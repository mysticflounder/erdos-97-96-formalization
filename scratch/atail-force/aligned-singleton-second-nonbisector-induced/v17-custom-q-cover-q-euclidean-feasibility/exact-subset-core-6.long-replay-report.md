# Exact six-class core long replay

Input: `exact-subset-core-6.smt2`

SHA-256: `6ff34d28c8e0707eaf63c758552addb3dcf01e6d81ff6ebcd068b9f852e905d1`

## Verdict

- Z3 4.16.0, fresh CLI process, `-smt2 -T:299`: `unsat` in 24 wall seconds.
- Z3 4.17.0, fresh CLI process, `-smt2 -T:299`: `timeout` in 299 wall seconds.
- cvc5 1.3.3, fresh CLI process, `--lang smt2 --nl-cov --tlimit=299000`: no SAT/UNSAT status; interrupted by its timeout at 299 wall seconds.

The emitted 41-record formula is therefore reproducibly UNSAT under the
artifact-matched Z3 4.16.0 binary. This is exact trusted-solver evidence, not a
kernel-checked or independently checkable UNSAT certificate. Cross-engine
validation remains open because cvc5 returned no verdict.

## Seed versus shrunk formula

The seed has 48 assertions; the shrunk formula has 41. Shrinking removed these
seven strict-orientation assertions:

- `orient_0_1_2`
- `orient_0_1_3`
- `orient_0_1_4`
- `orient_0_1_5`
- `orient_1_2_4`
- `orient_2_3_0`
- `orient_2_3_4`

All four gauge assertions, all 15 pairwise-distinctness assertions, all five
positive-row equalities, and 17 strict-orientation assertions remain. Thus the
shrunk formula is a proper logical weakening of the seed, not a byte-equivalent
reserialization. The full textual comparison is in
`exact-subset-core-6.long-replay-seed-vs-shrunk.diff`.

A fresh Z3 4.17.0 CLI replay of the seed also timed out at 30 seconds, despite
the miner's in-process Z3 4.16.0 direct seed check returning UNSAT in 0.241
seconds. Together with the long-replay results, this shows strong
version/process/search-order sensitivity, not a semantic disagreement.

## Stronger validation strategy

Keep the byte-identical formula and Z3 4.16.0 binary/version pinned as the
reproducible discovery result. For an engine-independent gate, eliminate
gauge-fixed variables and equality substitutions first, then send the exact
residual semialgebraic system to an independent complete real-CAD or
quantifier-elimination engine. Alternatively, derive a rational
Positivstellensatz/SOS infeasibility certificate and check its polynomial
identity and nonnegative multipliers independently. Merely increasing the
cvc5/Z3 timeout is not recommended: the same formula remained budget-insensitive
for 299 seconds on cvc5 and Z3 4.17.0.
