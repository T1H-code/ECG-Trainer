-- ============================================================
-- ECG Trainer-Seite · gemeinsames Speichern einrichten
-- Einmal in Supabase ausführen: Projekt öffnen → "SQL Editor" →
-- "New query" → alles hier einfügen → "Run".
-- ============================================================

-- 1) Tabelle für den (verschlüsselten) Stand der Trainer-Listen
create table if not exists public.trainer_state (
  id         int primary key,
  version    int not null default 0,
  data       text,
  updated_at timestamptz not null default now()
);

-- 2) Geheimer Schreib-Schlüssel (nur als Prüfsumme gespeichert, von außen nicht lesbar)
create table if not exists public.trainer_secret (
  id       int primary key,
  key_hash text not null
);

alter table public.trainer_state  enable row level security;
alter table public.trainer_secret enable row level security;

-- Lesen erlaubt (die Daten sind verschlüsselt), direktes Schreiben NICHT erlaubt
drop policy if exists "trainer_state lesen" on public.trainer_state;
create policy "trainer_state lesen" on public.trainer_state
  for select to anon, authenticated using (true);

grant select on public.trainer_state to anon, authenticated;
revoke insert, update, delete on public.trainer_state from anon, authenticated;
revoke all on public.trainer_secret from anon, authenticated;

insert into public.trainer_secret (id, key_hash) values (1, '5ef48260e7ba0c2dc33b29e6be8940390d605adb863cb0711816cc7144f182cb')
  on conflict (id) do update set key_hash = excluded.key_hash;

insert into public.trainer_state (id, version, data) values (1, 0, null)
  on conflict (id) do nothing;

-- 3) Speichern nur über diese Funktion – sie prüft den Schlüssel
--    und verhindert, dass sich zwei Trainer gegenseitig überschreiben.
create or replace function public.save_trainer_state(p_key text, p_version int, p_data text)
returns int
language plpgsql
security definer
set search_path = public
as $$
declare
  h text;
  v int;
begin
  select key_hash into h from trainer_secret where id = 1;
  if h is null or h <> encode(sha256(convert_to(p_key, 'UTF8')), 'hex') then
    raise exception 'Falscher Schluessel' using errcode = '42501';
  end if;
  update trainer_state
     set version = version + 1, data = p_data, updated_at = now()
   where id = 1 and version = p_version
  returning version into v;
  if v is null then
    return -1;   -- jemand anderes hat inzwischen gespeichert
  end if;
  return v;
end;
$$;

revoke all on function public.save_trainer_state(text, int, text) from public;
grant execute on function public.save_trainer_state(text, int, text) to anon, authenticated;
