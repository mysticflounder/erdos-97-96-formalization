/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import stage1_one_hit_incidence_countermodel

/-!
# ATAIL Stage-I short-cap-output incidence countermodel

This finite model strengthens the existing common-critical-incidence shadow by
making *both* short-facing-cap outputs true at once:

* the `u`-row center belongs to the dangerous four-set; and
* the dangerous apex `p` belongs to the exact `u`-row support.

Nevertheless the `u`-row support is disjoint from the dangerous four-set.  In
particular, neither output supplies even one dangerous support hit, let alone
the three hits consumed by the checked three-dangerous-point sink.

The model retains common source-indexed provenance, support cardinality four,
source membership, center exclusion, same-center support locking, and the
two-circle intersection upper bound.  It deliberately asserts no Euclidean
realization, convexity, MEC/cap geometry, exact full filters, or global K4, so
it is a kernel-checkable dependency countermodel rather than a counterexample
to the full K-A-PAIR hypotheses.
-/

namespace Problem97
namespace ATAILStageOneShortCapOutputCountermodel

open ATAILStageOneIncidenceCountermodel

/-- Alternative exact `u`-row support containing `p` but no dangerous label. -/
def rowAtDWithP : Finset Label := {p, u, 6, 8}

/-- Same-center support assignment with the alternative `Dcenter` row. -/
def supportAtCenterWithP (center : Label) : Finset Label :=
  if center = p then rowAtP
  else if center = A then rowAtA
  else if center = C then rowAtC
  else if center = Dcenter then rowAtDWithP
  else rowAtE

def supportOfWithP (source : Label) : Finset Label :=
  supportAtCenterWithP (centerOf source)

/-- The strengthened short-output shadow still satisfies every field of the
common-critical-incidence interface. -/
def shortOutputShadow : CommonCriticalIncidenceShadow Label where
  centerOf := centerOf
  supportOf := supportOfWithP
  support_card_four := by decide
  source_mem := by decide
  center_not_mem := by decide
  same_center_support_eq := by decide
  distinct_center_inter_card_le_two := by decide

/-- The dangerous rows and the `u` row still come from one source-indexed
system, with the exact dangerous support locked at center `p`. -/
theorem supplied_rows_have_common_provenance_with_p_hit :
    (∀ source ∈ ({q, t1, t2, t3} : Finset Label),
      centerOf source = p ∧ supportOfWithP source = dangerousBase) ∧
    centerOf u = Dcenter ∧ supportOfWithP u = rowAtDWithP := by
  decide

/-- Both short-cap outputs coexist with zero dangerous support hits. -/
theorem both_short_outputs_with_no_dangerous_support_hit :
    dangerousBase.card = 4 ∧
    centerOf u ∈ dangerousBase ∧
    p ∈ supportOfWithP u ∧
    u ∈ supportOfWithP u ∧
    centerOf u ∉ supportOfWithP u ∧
    (supportOfWithP u).card = 4 ∧
    supportOfWithP u ∩ dangerousBase = ∅ ∧
    ¬ (∃ z : Label, z ∈ dangerousBase ∧ z ∈ supportOfWithP u) := by
  decide

#print axioms supplied_rows_have_common_provenance_with_p_hit
#print axioms both_short_outputs_with_no_dangerous_support_hit

end ATAILStageOneShortCapOutputCountermodel
end Problem97
