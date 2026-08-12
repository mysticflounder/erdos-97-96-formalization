# Results

Run on 2026-08-11 with Mace4 2017-11A and Vampire 5.0.1.

| Query | Result | Meaning |
|---|---|---|
| `firstnonhit_base.in` | first model at domain 8 | Mace4, run with `-m 1`, found a finite model of the named source-mapped incidence abstraction. |
| `firstnonhit_malformed_three_overlap.p` | UNSAT, 0.010 s | Three distinct common support points at distinct centers fire the clean two-circle terminal. |
| `firstnonhit_three_blocked_producer.p` | UNSAT, 0.006 s | The proposed three-blocked-deletion ingress correctly produces the terminal contradiction. |

The Mace4 base model has domain size 8 and is recorded in `base-mace4.log`.
Both UNSAT results include Vampire refutations in their corresponding logs.
Prover9 did not find the malformed-overlap refutation within 30 seconds; this
is an incomplete timeout, not disagreement with Vampire.

## Classification

- Base SAT: **finite abstraction countermodel only**.  It is not a Euclidean
  realization, a P97 counterexample, or evidence against the Lean theorem.
- Control UNSAT: **logical landing-contract validation only**.  It proves no
  new P97 producer.
- Lean closure: **none**.

The result shows that these named incidence clauses alone do not imply a
contradiction.  The next theorem must add genuinely global metric,
cyclic-order, or blocker-relocation information.  A source audit found no
connection from the Q/common-deletion packet to the four retained-grid hits,
so a reverse weak inequality for those hits is not licensed by the current
interface.
