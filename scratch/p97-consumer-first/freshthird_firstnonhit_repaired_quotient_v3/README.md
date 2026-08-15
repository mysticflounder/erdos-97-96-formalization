# Fresh FirstNonHit repaired quotient v3

This is a fresh-namespace, one-wave replay of the retained/common/common-sameblocker quotient. It imports code/schema and authenticated source pins from v2, but no v2 readbacks, terminal verdicts, cuts, or model evidence.

The corrected Z3 driver adds every parsed assertion, extracts the exact parsed named Bool antecedents, and calls `check(*labels)`. The named-false smoke is UNSAT in both Z3 and cvc5. All three cases are dual-solver SAT, and every SAT readback passes the independent model and full-clause validators.

Classification: `SAT_MOTIF_FREE_SURVIVOR` / `SAT-abstraction`. This is not a universal mathematical claim and does not lift the unbounded quotient to the carrier-wide theorem.
