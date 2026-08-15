# Projected-v3 base-only staged validation

- Staged tree: `84400afbdc0ae715cbc8cea82537f8126f65721e`
- Focused launcher test: `23 passed in 3.09s`
- Focused Ruff: check passed; 2 files already formatted
- Broad capped wrapper: `372 passed in 36.26s`; Ruff check passed; 13 files already formatted
- Historical read-only survivor fixture: 98,446 bytes, SHA-256 `84c1d67da7827bd9a3bfceff8a230f9459576bce3f61f5eca782942692659481`
- The first broad run had only five missing-fixture failures because Git archives omit that untracked historical fixture. The successful rerun mounted the exact live fixture through a read-only symlink; no staged source bytes changed.
