# Results: FreshThird retained robust-class source-fan v1

The existing `results.json` records a completed bounded preflight (no solver
rerun was performed for this documentation repair):

- Positive quotient cases: 128/128 SAT in Z3 and 128/128 SAT in cvc5, with
  model readback passing.
- Composition: 2 non-hit tags × 4 interaction tags × 16 endpoint metadata
  tuples.
- Malformed controls: 4/4 UNSAT in both solvers (overfull exact-four row,
  missing self-shell, forbidden source membership, and no mutual cross-pair).
- SMT artifacts: 132 total, each independently replayable and read back.
- Finite fan enumeration: 625/625 allowed four-vertex shell graphs contain a
  mutual omitted pair.

These 128 dual-SAT results are exhaustive for the explicitly weakened quotient
only. Endpoint choices are metadata. The quotient does not encode the live
constructor equality, deletion/deletion-survival, cap, or support-overlap
fields, and does not link those fields to the retained robust rows. Therefore
the result is not evidence that the live Lean constructor product is
insufficient or sufficient, is not a geometric realization or counterexample,
and does not close a FirstNonHit family or the universal residual theorem.

Source paths and declaration-level ingress are recorded in
[INGRESS-CONTRACT.md](INGRESS-CONTRACT.md); artifact and source hashes are in
[SHA256SUMS](SHA256SUMS).
