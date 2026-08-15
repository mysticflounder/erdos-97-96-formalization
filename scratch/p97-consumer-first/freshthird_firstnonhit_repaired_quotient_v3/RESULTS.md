# Results

Final four-valued classification: **SAT-abstraction** (`SAT_MOTIF_FREE_SURVIVOR`). All three retained/common/common-sameblocker arms returned SAT in corrected Python-Z3 and cvc5 exact pinned replays. No CEGAR no-good was needed; the production thirteen-point/seven-circle obstruction was absent from each survivor.

| arm | Z3 | cvc5 pinned | full-clause | model | result |
|---|---:|---:|---:|---:|---|
| retained | SAT | SAT | PASS | PASS | survivor |
| common | SAT | SAT | PASS | PASS | survivor |
| common_sameblocker | SAT | SAT | PASS | PASS | survivor |

The single smallest source-entitled FirstNonHit clause absent from this quotient is recorded in `EXTRACTED-CLAUSE.json`: `C.firstSource.1 ∈ S.capInteriorByIndex S.oppIndex1`, sourced to `TwoSourceCanonicalSurface.lean`. It is recorded only; no theorem-bank or Lean search was launched.

The initial pre-authentication driver attempt is retained under `attempt0-invalid-driver/` solely as a semantics audit; it is not solver evidence. The authenticated replay uses the exact parsed antecedents and passes all gates.
