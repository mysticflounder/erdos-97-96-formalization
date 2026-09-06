# Exact-13 witnessed-Key guarded PIQD CEGAR wave 3

Status: `REFINEMENT_BUDGET` — formula-scoped solver evidence only.

Lane: `exact13-witnessed-key-guarded-cegar-wave3-20260906`
Base HEAD: `cfd6eed3abd136093d6fa6d7c912b02bdbfa5671`
Run: `scratch/runs/exact13-witnessed-key-guarded-cegar-wave3-20260906/run-0001`

## Root and guarded boundary

The corrected wave-2 root was preserved byte-for-byte as
`22cf80c657d8444827893533f22975e0ac2cbc12f033cf4334125f6088da857a`
(432 variables, 29,468 clauses).  Wave 3 appended only the three active
guarded families

```
b0_c OR b1_c OR not Gc_p OR not Gc_x OR not Gc_y OR not F_x OR not F_y
```

for `c = 2..12`, `(F,p) = (K,0), (L,0), (T,1)`, and `x,y` outside `{p,c}`.
The result is exactly 1,815 unique nontrivial clauses, zero new variables,
and 432 variables / 31,283 clauses.  The guarded root hash is
`238003d365089adf8e2ad00e4fa181e2972b34e68a34c550532901b05472ed5f` and its
normalized PIQD root journal hash is
`0fcbbef0b4e1d1edd305ef3fe5276d64f67f13d5753510b1aee3826582b9ea77`.

The independent guarded-boundary replay of all 6,001 retained wave-2 models
reported 4,432 guarded violations and 1,569 survivors; all 1,569 survivors
had an independently replayed zero-form witness.  Its model-stream hash is
`a73108f3ca72f73e65f3c5ee033ccb728208129cb54c3d62a013d1dd8ab5e65a`.
The checker source hash is
`4d100815716e3683cf769430f6a1bd647d8a5f7bd68cc67043d898db0fc25d68`, bound
to checker/report commit `068d26ee03486b9f30160a6c6d0a42ab9ba7e6e0`.

## Imported bank and source custody

All 6,000 wave-2 projected provider-incidence cuts were imported from the
immutable bank copy with hash
`f5145fb2af3725486b29690fb7015c2723fbeca8d47262b6730bad739e141af5`.
The imported path is
`scratch/runs/exact13-witnessed-key-guarded-cegar-wave3-20260906/run-0001/artifacts/immutable-imported-wave2-cut-bank.jsonl`.
The final wave-3 cut bank hash is
`2320eefd2a89c5738d437620989bdbeaf0de8e19177c8e5b1cb8fd5117f97c7b`, at
`scratch/runs/exact13-witnessed-key-guarded-cegar-wave3-20260906/run-0001/events/cut-bank.jsonl`.
Every imported parent model and certificate was independently replayed against
the corrected root and `Key.Valid`; all 6,000 clause reconstructions passed.
Imported cuts remain projected provider atoms only: no witness atoms and no
exact-Key blocks.

The imported-parent guarded partition is 4,431 boundary violations / 1,569
survivors.  The separate full retained wave-2 corpus is 4,432 / 1,569 across
6,001 models.  Only newly generated wave-3 models were required to replay the
guarded root and `StrongValid`; all 10,001 passed that check.

The bound Lean source hashes are:

- `CardGeThirteenExact13SourceIndexedFiniteKey.lean`:
  `8ec3b72ccf9cbb0a002558630b1971775f81f0170998329f0934db9062cdb1dc`;
- `CardGeThirteenExact13StrongSourceCoverage.lean`:
  `3231e836f06c3dabcc436e798466aedd2af64678633ea24c0a8ac8072b61f86b`.

## PIQD result

The fresh CaDiCaL session was `81fcb81d-a942-45cc-8cdd-a31705fc0449`, using
`piqd-satworker-cadical-3.0.1` with solver hash
`d2cb8bd4440f2fae71d9d03373dd471b185aec26b5b5f3488f1fbed701c16736`.
It closed after 10,001 solves and 10,000 new refinements (16,000 total cuts),
at 1,600.573 seconds.  The terminal solver result was SAT at the exhausted
refinement budget; there was no uncancellable survivor and no full-cone cvc5
diagnostic was needed.

Cut statistics: 15,939 one-form incidence-path cuts and 61 two-form
incidence-path cuts.  Across all cuts, provider-atom counts were 4–14 with
mean 5.2265625 and histogram `{4:3300, 5:8015, 6:3027, 7:1225, 8:310,
9:105, 10:13, 11:4, 14:1}`.  One-form cuts have five terms; two-form cuts
have two five-term forms.  There were 31,878 one-form path pairings and 244
two-form pairings.  One-form path lengths were 1–5 (mean 1.1592007); the
two-form path lengths were 0–1 (mean 0.75), where zero is the identity edge
pairing.

Root, journal, and receipt custody hashes:

- exported PIQD journal:
  `128b9759b8db6fa9c007b06a675953e4540abb380d198a3c9fc3a6045e1b4bb6`;
- deterministic expected journal:
  `ada295262a268bee1fd58ee673f65f7aff1b199a643002d9d9218b8e661bc5b9`;
- receipt journal:
  `2b3717eb83740cf102f00a90aa52a3143aaf7ecce7ef2eeb4b9c7aba377419d2`.

All 10,001 receipt prefixes were checked, the exported journal matched the
root-plus-cuts journal after deterministic header normalization, the PIQD
session was closed, and the imported bank was retained as an immutable source
copy.  The post-run source-binding and semantic-label repair changed no solver,
model, cut, root,
journal, or receipt bytes; it only resealed manifest/state/run/environment
metadata with the explicit `StrongSourceCoverage` hash.

## Event custody and validation

Relevant event file hashes are:

- `effective-root.json`: `b73048f8a41640f61af5782b0b165dd3c6c583e820e7784fc05bf7c52992dbc9`;
- `guarded-boundary-report.json`: `99ab5881a45a97c6bab672624e04cb0d962b7a49c5b26bddd86bbe9a6ac5d72a`;
- `wave2-import-replay.json`: `a68bf81b6f18c92efb623f5e3cc5fd9d04b2644a0e34bd2aa1acf7ce290c2a0a`;
- `new-model-strongvalid-replay.json`: `a92bc3f45147da00661fa138bd29b7c5f69707178d0f490f7a907a7c81fbfe12`;
- `piqd-custody.json`: `556745497ae6c3678958096e9c9bfb9ab6fd73b4024ff07c79c4d5e6bb61d1d8`;
- `state.json`: `d3db4f3a17426d39b38d221392dc84c3b9e8d9730506a1d0ec635cb023ecb2e3`;
- `run.json`: `03999ed6dc4cb99996d8158e9b8713f1123d509119dfcf1b9885e748d40ba273`;
- `piqd-environment.json`: `00a9423b2fa567d7dad7c91fb2030e1308a54f0c2a2550df32ae38fb872139cd`.

The run manifest’s authenticated `manifest_sha256` is
`57ee43151f05ff8961b0d7d5453792094c7b00bf293b41d2b2e91177ce01e81f` and
retains base head `cfd6eed3abd136093d6fa6d7c912b02bdbfa5671`.  A recursive event
audit found 32,009 self-sealed JSON events, zero bad seals, and 16,002 expected
unsealed raw/receipt JSON records.

Validation passed:

```text
30 passed — root + wave1 + wave2 + wave3 pytest suites
9 passed — post-run wave3 custody/schema suite
Ruff: all checks passed
git diff --check: passed
```

This is formula-scoped solver evidence.  It does not claim a Lean theorem,
kernel closure, promoted certificate, or formula-independent UNSAT result.
