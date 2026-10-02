# Protocol — notes for Claude Code

Personal health-routine app for a single user. Flutter + drift (SQLite), no
backend, Greek UI, English identifiers/comments/commits. The spec document
the owner holds is the source of truth for all content and is **not** in this
repository (the repository is public).

## Non-negotiables

1. **No medical logic.** The app never computes, suggests or adjusts a
   medication dose. Where the spec says "ask the doctor", show that sentence
   and stop. If a slice seems to need medical inference, stop and ask.
2. **Data honesty.** A failed read is never shown as empty. An estimate is
   never stored or shown as a measurement. A portion-mode meal is never shown
   as a single calorie number. The UI never offers an action that cannot
   succeed, and no save discards input.
3. **The plan tolerates 80%.** No streaks that break, no red, no guilt
   language. Late is not failure.
4. **Nothing is hard-coded.** Every time, dose, target and rule is an
   editable default.
5. **Greek UI, English code.** All user-facing strings live in
   `lib/l10n/app_el.arb`.

## Verification

Verification is by reproduction, never by code reading. Run the app
(simulator, device, or `flutter run -d linux`), capture screenshots, and
report strings read off the rendered screen. Before claiming something does
not appear, prove the screen that could contain it actually rendered. List
plainly what a slice left unverified. Record it under `docs/verification/`.

## Conventions

- Schema lives in `lib/data/tables.dart`; regenerate with
  `dart run build_runner build --delete-conflicting-outputs` and bump
  `schemaVersion` with a migration for any change after the first release.
- Routes are declared in `lib/router.dart`; one `StatefulShellBranch` per tab.
- Times of day are stored as minutes after midnight. Doses are free text.
- Run `dart format`, `flutter analyze` and `flutter test` before committing.
- One slice per branch. Never publish, deploy or submit to any store.
