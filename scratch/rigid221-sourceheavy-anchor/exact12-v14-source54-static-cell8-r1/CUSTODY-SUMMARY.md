# Custody summary

- Scope: exact12 v14 cell 8, source54, requested commit `56128312` (resolved `56128312a2b9b1fed3b9dadccb3e1ecaf7c4cefc`); live source54 is byte-identical to that commit. Live `HEAD` is the pre-existing source55 commit `249983428180783d89b594221caccf1e37f0d923`.
- No canonical strict producer manifest or complete variable map was present; both were emitted deterministically.
- [producer-manifest.json](producer-manifest.json): 5,046 bytes; file SHA-256 `c73c143d7ce00cd7e7180b3cbd9d45b95340179f348ad9054c671513fa8397df`; canonical body SHA-256 `3b57c46b415b88c0065fda2685c4ac0303f73226c2d94e9ca00ed79bcac13e9`.
- [variable-map.json](variable-map.json): 6,032,523 bytes; file SHA-256 `7e64883e0ace30271f748b3ac9541dc817b70387372764f7ad2765c19349d3dc`; canonical body SHA-256 `ec980621a61541fdf63a4097fa654eaa590e0119278ede7b55657b5870c8a18d`.
- Map coverage is complete: 44,855 IDs (`1..44855`), roles `choice=3040`, `sinz_counter=39620`, `compiled_blocker=50`, `static_distance_equality=2145`.
- Bound CNF: 17,227,349 bytes, `p cnf 44855 732131`, SHA-256 `47c6275c143c4e99d10d0c73488629e5b9c3046599a7d31d750192ae17c770d4`.
- Source54 Lean: 3,712 bytes, SHA-256 `7ca3e854d038dfb07c6d5b4a3e9c9b676cff19b371d96992166c93a001892750`; source-order entry index `53`, certificate SHA-256 `3c245d0087b24b779470e2da7926a6d22fda5815a5f0df8bbcdfc234e4d15315`, learned clause `[-21,-290,-936]`, witness-cube SHA-256 `9e461b6cd53901a1e3ccfab2c667516262ea9ce81b8f4f5ffbdd7ef2791a7b83`.
- Current source-order bank has 55 entries (current bank SHA-256 `c2d195a8b2eb32a6d83f3b72ddf54677444b07fdc9dd318daec6f199d1ca5ee7`); the requested commit had 54. The extra live entry is preserved and noted in the manifest.
- No solver was launched; this is finite custody bookkeeping, not proof closure. Limitation: the static extension encoder is an untracked scratch file and therefore not commit-pinned; exact CNF bytes/SHA and deterministic relation allocation are pinned.
