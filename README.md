# ECG Trainer-Team · Schnupperkurs 2026

Interne Seite mit allen Teilnehmerlisten. Alles ist bearbeitbar:
Anwesenheit abhaken, Felder ausfüllen (Größe gemessen, Bezahlt am …),
Kinder bearbeiten und hinzufügen, eigene Listen anlegen, ändern, kopieren und löschen.

Passwort: **4545**

## 1. Auf GitHub Pages hosten

1. Auf github.com ein neues Repository anlegen (z. B. `ecg-trainer`).
2. `index.html`, `ecg-logo.png` und `.nojekyll` hochladen („Add file“ → „Upload files“).
   Die Datei `supabase-einrichtung.sql` bitte NICHT hochladen.
3. Settings → Pages → Source „Deploy from a branch“, Branch `main`, Ordner `/ (root)` → Save.
4. Nach 1–2 Minuten erreichbar unter `https://<github-name>.github.io/ecg-trainer/`

## 2. Gemeinsames Speichern einschalten (einmalig, ca. 2 Minuten)

Damit alle Trainer dieselben Häkchen und Einträge sehen, wird der Stand in eurer
bestehenden Supabase-Datenbank (die auch die Anmeldung nutzt) gespeichert:

1. supabase.com → euer Projekt öffnen → links **SQL Editor** → **New query**
2. Den kompletten Inhalt von `supabase-einrichtung.sql` einfügen → **Run**
3. Fertig. Oben rechts auf der Trainer-Seite steht dann „✓ Gespeichert – für alle Trainer“.

Solange das nicht eingerichtet ist, funktioniert die Seite trotzdem, speichert aber
nur auf dem jeweiligen Gerät („💾 Nur auf diesem Gerät gespeichert“).

## Bedienung

- **Häkchen / Felder:** direkt in der Tabelle antippen bzw. reinschreiben. Mit Enter springt man zum nächsten Kind.
- **Kind bearbeiten:** auf den Namen tippen (Daten ändern, Gruppe wechseln, löschen).
- **＋ Kind:** neues Kind anlegen, bekommt automatisch die nächste Nummer.
- **＋ Neue Liste:** Name, Spalten (Häkchen, Text, Datum, Zahl oder Kinder-Daten), Sortierung, nur eine Gruppe, als Tabelle oder nach Gruppen aufgeteilt.
- **✏️ Liste bearbeiten:** Spalten umbenennen, verschieben, entfernen, Liste kopieren oder löschen, Gruppen-Altersgrenzen ändern.
- **Feld aus einer anderen Liste:** zeigt dieselben Einträge (z. B. „Bezahlt am“ in mehreren Listen).
- **⋯ → Sicherung herunterladen:** kompletter Stand als Datei (enthält Kinderdaten – sicher aufbewahren).

## Datenschutz

- Die Kinderdaten liegen nur **verschlüsselt** im Quelltext und in der Datenbank.
- Speichern geht nur mit dem richtigen Passwort – Fremde können nichts überschreiben.
- Ein 4-stelliges Passwort ist aber für Technik-Kundige knackbar (10.000 Möglichkeiten).
  Link nur im Trainer-Team teilen und nach der Saison Seite und Datenbank-Eintrag löschen.

---
made by **t1h-code** Projekt group
