# Exact13 witnessed-Key guarded CEGAR wave4

Lane: `exact13-witnessed-key-guarded-cegar-wave4-20260906`
Base: `282a1be8ef87359ad671ecd5afd0ecd8e38a35fd` (`282a1be8e`)
Claim status: formula-scoped solver discovery only; no Lean closure or promotion claim.

## Contract and imports

Wave4 uses a fresh PIQD CaDiCaL session. Its guarded root is imported byte-for-byte
from wave3:

- 432 variables, 31,283 clauses, 1,815 guarded clauses;
- root SHA-256: `238003d365089adf8e2ad00e4fa181e2972b34e68a34c550532901b05472ed5f`;
- immutable wave3 final cut bank: 16,000 rows, SHA-256
  `2320eefd2a89c5738d437620989bdbeaf0de8e19177c8e5b1cb8fd5117f97c7b`.

The first 6,000 historical parents are replayed against their wave2
29,468-clause root and classified honestly: 4,431 are outside `StrongValid` and
1,569 satisfy `StrongValid`. The 10,000 wave3 cut parents are replayed against
the guarded root and all satisfy `StrongValid`. This distinction does not weaken
cut soundness: each cut is independently replayed from its provider atoms,
one/two-form path certificate, zero projected sum, and exact clause. Old-parent
`StrongValid` is not an antecedent to the universal cut-soundness record.

Every imported certificate, parent model, and raw solve path is resolved beneath
the immutable wave3 run root and hash-checked before copying. Imported JSON event
seals are removed before resealing with wave4 paths. The immutable imported bank
and live final bank have separate paths and hashes.

The live loop admits only negative clauses over projected provider atoms
(`m_*`, `is_b0_*`, `is_b1_*`). It introduces no witness atoms and no exact-Key
enumeration blocks. Each new SAT model is replayed against the guarded root,
`Key.Valid`, and `GlobalOneBoundaryValid` before cut admission. A first
uncancellable survivor triggers the PIQD cvc5 full-cone diagnostic.

## Run record

The durable run manifest is at
`scratch/runs/exact13-witnessed-key-guarded-cegar-wave4-20260906/run-0001/run_manifest.json`.
The generated root is restricted to that run directory. The command is bounded
at 20,000 additional refinements, 120 seconds per solve, and 3,600 seconds wall
time. The terminal status, model/cut counts, authenticated PIQD receipts,
exported and expected journals, event seals, and source bindings are recorded in
the run directory's `events/` and `artifacts/` files.

Terminal status and final statistics are filled from the authenticated
`events/run.json` after the session closes.

Completed result:

- terminal status: `REFINEMENT_BUDGET` (final solve status `SAT`);
- 20,001 new SAT solves/models and 20,000 additional cuts;
- 36,000 total cuts: 34,704 one-form and 1,296 two-form;
- wall span: 3,266.249 seconds; per-solve timeout: 120,000 ms;
- all 20,001 new models passed guarded-root, `Key.Valid`,
  `GlobalOneBoundaryValid`, and `StrongValid` replay;
- no uncancellable survivor occurred, so no full-cone diagnostic was needed;
- the PIQD CaDiCaL 3.0.1 session closed successfully.

Authenticated outputs:

- final live bank: SHA-256
  `2c1607d847dcb1417a067419b3494d285d52cc2bd98337099993bbb3d19a3e90`;
- immutable imported bank remains SHA-256
  `2320eefd2a89c5738d437620989bdbeaf0de8e19177c8e5b1cb8fd5117f97c7b`;
- exported PIQD journal: SHA-256
  `348281ec84af59b033d8e82fc94dccb05ee12001df8ad556bbea6843d0f3f027`;
- expected deterministic journal: SHA-256
  `b12f0d0d854af7daac9ff3dce1b09d6af215c518fc9fb38dd91b1d67c94b8e58`;
- session close receipt: SHA-256
  `e0b3c4324c2d72c3a73f80700f22d2cf412ddad622841e779b53c1407833bc34`.

The complete run record is `events/run.json`; custody is in
`events/piqd-custody.json`; imported-parent and all-16,000-cut replay are in
`events/wave3-import-replay.json`; new-model replay is in
`events/new-model-strongvalid-replay.json`.

## Validation boundary

This lane reports only the exact authenticated formula and its solver session.
It makes no claim that formula UNSAT, if reached, proves the P97 theorem or any
Lean declaration. No Lean-ingress binding or promotion record is generated.
