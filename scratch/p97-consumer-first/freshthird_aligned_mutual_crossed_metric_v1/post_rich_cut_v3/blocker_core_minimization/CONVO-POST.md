FreshThird post-rich-cut-v3 blocker-core minimization is complete. Starting
from the full frozen exact-17/direct-crossed 1,070-clause blocker_exactness
query, external named-assertion Z3 extraction found a 9-clause core: 8 K4
common-radius equalities plus blocker_exact_8_13. Z3 and cvc5 both replay the
full query and core UNSAT. Every drop-one is SAT under an explicit exact
triangular-lattice witness; all 9 substitutions pass exact Z3 validation,
both rational witnesses also pass Fraction replay, and both external solvers
accept every exact-substituted drop-one. The required row identity was checked
independently for all 17 sources: selected_rows[s] equals
point_k4_rows[blockers[s]], 17 matches/0 mismatches. There is no direct
syntactic equality/disequality collision: the 8 K4 clauses derive
d2(8,13)=d2(8,0) by symmetry/transitivity, while blocker_exact_8_13 forbids
it. Classification: source-entitled preflight cut eliminating this frozen
incidence motif, not a P97 CE, universal FreshThird producer, Lean theorem, or
sorry closure. Artifacts live under post_rich_cut_v3/blocker_core_minimization/.
