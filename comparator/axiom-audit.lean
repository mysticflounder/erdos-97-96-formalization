import Solution

/-
Comparator axiom audit. Prints the `#print axioms` closure for every theorem in
`Solution.lean` that `config.json` lists in `theorem_names`. The comparator
itself enforces `permitted_axioms` during its run; this file lets a reviewer
(or CI) see the closure directly.

Every report must be a subset of {propext, Classical.choice, Quot.sound} — no
`sorryAx`, no custom axioms, and no `Lean.ofReduceBool` / `Lean.trustCompiler`.
The gated set deliberately uses no `native_decide`, so the two compiler axioms
are absent here even though project policy permits them elsewhere (see the
repository README, `native_decide` policy).

The theorems live in the shared `Headline` namespace in `Solution.lean`, so the
comparator finds them under the same qualified names listed in `config.json`.

Run: lake env lean ../comparator/axiom-audit.lean   (from `lean/`)
  or: comparator/check-conformance.sh                (from the repo root)
-/

#print axioms Headline.counterexample_card_ge_nine
#print axioms Headline.finiteN9Closure
#print axioms Headline.counterexample_card_ge_ten
#print axioms Headline.erdos97_of_card_le_nine
#print axioms Headline.erdos97_iff_pinnedMultiplicity
#print axioms Headline.exists_pinnedMultiplicity_le_three_of_card_le_nine
#print axioms Headline.universalProblem97_of_reduction
#print axioms Headline.smaller_counterexample_of_removable
#print axioms Headline.unit_distance_pairs_bound_of_erdos97
#print axioms Headline.erdos96_of_erdos97
#print axioms Headline.exists_unique_minimum_enclosing_circle
#print axioms Headline.iCount_le_of_convexIndep_circumscribed
#print axioms Headline.sylvester_dichotomy
#print axioms Headline.mec_center_mem_convexHull_boundary
#print axioms Headline.exists_nonobtuse_circumscribed_triple
#print axioms Headline.no_diameter_under_k4
#print axioms Headline.perpBisector_apex_bound
#print axioms Headline.base_apex_double_count
#print axioms Headline.six_mul_card_le_iCount_of_K4
#print axioms Headline.dist_midpoint_le_half_iff_inner_nonpos
#print axioms Headline.dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals
#print axioms Headline.complementary_dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals
#print axioms Headline.u5_unit_triangle_on_p_circle_incompatibility
#print axioms Headline.equilateral_inscribed_side_eq_radius_mul_sqrt_three
