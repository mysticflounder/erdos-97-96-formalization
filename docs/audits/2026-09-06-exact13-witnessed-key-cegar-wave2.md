# Exact-13 witnessed-Key CEGAR wave 2 audit — 2026-09-06

Lane: `exact13-witnessed-key-cegar-wave2-20260906`

Base HEAD: `be28c8c1c44f57a69009f33da061062f70207ff4`

Run: `scratch/runs/exact13-witnessed-key-cegar-wave2-20260906/run-0001`

## Claim boundary

This is solver-only discovery and custody evidence. It makes no Lean theorem,
kernel-checking, promotion, source-coverage, abstract-coverage, or formula-
independent UNSAT claim. The terminal status is `REFINEMENT_BUDGET`, not UNSAT.
No first uncancellable survivor occurred, so the required full-cone cvc5
diagnostic was not launched. No exact-Key enumeration blocks or witness atoms
were used.

The wave used only PIQD for SAT search: CaDiCaL 3.0.1 through
`piqd-satworker-cadical-3.0.1`, solver digest
`d2cb8bd4440f2fae71d9d03373dd471b185aec26b5b5f3488f1fbed701c16736`. The
PIQD session was closed after its terminal SAT receipt. Its retained PIQD
label is inherited from the audited delegate (`exact13-witnessed-key-cegar-wave1`);
the session ID, wave-2 schema, run root, source bindings, and closure record
identify this wave unambiguously.

## Root and imported frontier

The current HEAD root is the corrected `Key.Valid` root: 432 variables and
29,468 clauses. The wave-1 effective root was imported byte-for-byte and its
normalized clause journal was checked against the required identity:

- imported wave-1 effective root: `a93163e7342405bad06772269ea8f54726c1fabd4467e55d4a6efecd4c87181f`;
- normalized root journal: `b9de440ef5a6856a6b0cebbe5f7e5e3b66ad983019c3cfaabf5774a3fb696080`;
- current wave-2 emitted root: `22cf80c657d8444827893533f22975e0ac2cbc12f033cf4334125f6088da857a`.

The source wave-1 cut bank was checked at 1,000 records and hash
`ab759ceba74daf8d3cc3eb06daf18e8144e88098ae1a48b5df33d7f3ba06906f`. The
new lane imported and locally rewrote/resealed all 1,000 cut certificates,
parent models, and raw solve records. The migration event independently
replayed every imported parent against the current corrected root and exact
`Key.Valid`, then reconstructed every path, zero sum, atom set, and clause:
`revalidated_cut_count = 1000`, with all checks true.

The final append-only wave-2 cut journal contains 6,000 records and has hash
`f5145fb2af3725486b29690fb7015c2723fbeca8d47262b6730bad739e141af5`. Its
first 1,000 imported records have atom counts 4–5, mean 4.01; the 5,000 new
records have atom counts 4–7, mean 4.5516. Across all records, atom counts
are 4–7 with mean 4.4613333333. Every cut is a
`transitive-incidence-path` one-form cut; there are no two-form cuts. Exact
path-step counts are 2–3, mean 2.0058333333; every form has five terms.

## Result

Status: `REFINEMENT_BUDGET`.

- additional refinement budget: 5,000;
- total cuts: 6,000 (1,000 wave-1 plus 5,000 wave-2);
- PIQD solves in this invocation: 5,001;
- retained model certificates: 6,001;
- all 6,001 models independently replay `Key.Valid = true`;
- all 6,001 selected mirror orientation and were cancellable;
- one-form cuts: 6,000; two-form cuts: 0;
- root: 432 variables / 29,468 clauses;
- no UNSAT and no uncancellable survivor.

The final PIQD session is
`02ddb018-b575-45ad-8ed2-8532c5868cef`. The authenticated closed-state
record reports 5,001 solves, 35,468 clauses, last solve index 5,001, terminal
status SAT, and `state = closed`. PIQD receipt-prefix verification checked
all 5,001 prefixes. The exported session bytes hash
`2fb4db7544462cbb8062af48f24661ceddc07534c713b42cc3048054462c95bb`; after
the deterministic export header normalization, the retained expected journal
hash is `12c6b0c0b050800189ff68647b2941ff2367c1167100b41bbd97b09b2f8414ef`.

Event hashes:

- run: `0ddc87994942eb9466a27e0ccfa4d31f47dca426ecc71d1bd5060dcd3c3ea254`;
- run.json embedded `event_sha256`: `ba8ca5610804dab21e4557e720d419e34c0cb8793ed372cf626de846c18d01d4`;
- state: `c390a9925c1e1784198e125f3ac3bcd77c125238b5ffcbd237abce381a736639`;
- root migration: `f8388a47a13398959469acac75802ec410891fcadb4eccee95b8f00ca61022c3`;
- PIQD custody: `fc4860f6fd0e3fc1d0aa7d457b1e6411ae5711043eb8f99ab6247d989e9d249c`;
- PIQD receipts: `9d712f296e7e8b7d047423ed69cff0a1ab786101c2b37a0e792c77ca5e636f96`.

The retained `run.json` was repaired without rerunning PIQD: its inherited
`event_sha256` was removed and recomputed over the unsigned canonical JSON.
The cut bank, effective root, exported and normalized journals, and receipts
were byte-identical before and after that repair. The run manifest was then
updated for the corrected wave-2 producer digest and re-sealed with manifest
hash `9bd772befeedf96e105e1e5d27b74e7b057a01e7ec09c0d410f6671014639f9f`.

## Verification gate

The focused wave-2 tests passed 5/5 after the custody repair. The full gate is:

```text
uv run --no-cache pytest -q \
  scripts/test_cardge13_exact13_witnessed_key_root_piqd.py \
  scripts/test_cardge13_exact13_witnessed_key_cegar_wave1_piqd.py \
  scripts/test_cardge13_exact13_witnessed_key_cegar_wave2_piqd.py
uv run --no-cache --with ruff ruff check \
  scripts/cardge13_exact13_witnessed_key_root_piqd.py \
  scripts/cardge13_exact13_witnessed_key_cegar_wave1_piqd.py \
  scripts/cardge13_exact13_witnessed_key_cegar_wave2_piqd.py \
  scripts/test_cardge13_exact13_witnessed_key_root_piqd.py \
  scripts/test_cardge13_exact13_witnessed_key_cegar_wave1_piqd.py \
  scripts/test_cardge13_exact13_witnessed_key_cegar_wave2_piqd.py
git diff --check
```

The lane checkpoint is
`.codex/worktree-checkpoints/exact13-witnessed-key-cegar-wave2-20260906.json`.
The generated root has a standard `worktree-run-manifest/v1` with the lane
base HEAD above. No Lean source was edited, staged, or promoted.
