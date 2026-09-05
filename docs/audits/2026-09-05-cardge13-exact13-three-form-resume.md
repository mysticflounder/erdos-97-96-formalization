# Exact-13 three-form resume audit (2026-09-05)

## Scope

This lane tests one source-derived coarse cell after loading the complete
authenticated one-, two-, and equal-weight three-form cut chain available at
lane creation.  It is a formula-level discriminator only.  It does not claim
source coverage, an exact-13 terminal, or theorem promotion.

The tested catalog cell is `direct-z08-k09-10` (cell 0).  The run manifest pins
seven predecessor events and the six Python modules used to build and replay
the SMT journal.

## Authenticated artifacts

- Lane: `cardge13-exact13-three-form-resume-20260905`
- Base commit: `e376c9010bc38db6c48b9f018bb8a85df18cb0e9`
- Run manifest self-hash:
  `a4fc7a5d81fbf0f63634f53c6fbd512cf55169d4ebe4c12156701e9081900ae3`
- Run manifest file SHA-256:
  `f355b0605031adbc4aad898c83dc75e66f379ed65f1a51051482f746569687a9`
- Event self-hash:
  `092139983efba4caf16379b6c59ac40d72ed2ca4a3d00d92e841418c45024c9f`
- Event file SHA-256:
  `c32a39e64458fc669f3937948435402a345ee66a12983abe5c28bd7bc2243619`
- PIQD journal SHA-256:
  `6c5b182d5fba5b54cb94c94cdcb4e6a3a411a70225ea52245902dbfbc17fca5a`

The event self-hash was independently recomputed after removing the
`event_sha256` field and applying the producer's canonical JSON encoding.

## Result

The producer loaded 14,895 distinct predecessor cuts and emitted a 64,423
command SMT journal.  PIQD ran Z3 4.17.0 for one assumption-free solve.  The
result was replayed SAT (`model_replay.outcome = SATISFIED`) and the decoded
model exposed a new nine-atom `transitive-incidence-path` conflict.  Because
the lane intentionally set the refinement budget to zero, its terminal CEGAR
status is `REFINEMENT_BUDGET`.

Therefore the accumulated one-, two-, and equal-weight three-form bank does
not close this cell.  The next source-sound refinement should search the full
positive rational cone of projected strict Kalmanson forms, then scale any
dependence to natural weights accepted by the existing provider certificate
checker.  More blind fixed-size batching is not justified by this result.

## Claim boundary

This run proves only that the authenticated Boolean/SMT encoding plus the
14,895 asserted cuts has a replayed model and that this model violates another
source-sound provider incidence-path clause.  A replayed abstract model is not
a geometric source configuration.  No Lean declaration consumes this event,
and the live card-at-least-thirteen theorem remains open.
