/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.OrdinalKalmansonCycle

/-!
# Ordered robust/two-fiber Kalmanson consumer

This is the generic Lean terminal corresponding to the minimal `O,A,X`
ordinal core in the pinned fourteen-role shadow.  It deliberately states only
the six boundary roles and six selected-row incidences used by the two strict
comparisons.

In the intended blocker-map reading, `C` and `K` are two sources in the
`A`-fiber, while `J` is a source in the `X`-fiber and `K` is the required
cross-fiber support point of the `X`-row.  Thus two nontrivial fibers alone are
not the terminal antecedent: the ordered cross-support incidence is essential.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRobustTwoFiberKalmansonConsumerScratch

open CapCrossingKalmansonBridge

/-- The smallest selected-row packet used by the pinned `O,A,X` ordinal core.

The boundary order is `O < A < X < J < C < K`.  The three selected rows give
`OJ = OC`, `AC = AK`, and `XJ = XK`, respectively. -/
structure OrderedRobustTwoFiberKalmansonCore
    {A : Finset ℝ²} (boundary : Fin A.card → ℝ²) : Type where
  iO : Fin A.card
  iA : Fin A.card
  iX : Fin A.card
  iJ : Fin A.card
  iC : Fin A.card
  iK : Fin A.card
  hOA : iO < iA
  hAX : iA < iX
  hXJ : iX < iJ
  hJC : iJ < iC
  hCK : iC < iK
  robustRow : SelectedFourClass A (boundary iO)
  firstFiberRow : SelectedFourClass A (boundary iA)
  secondFiberRow : SelectedFourClass A (boundary iX)
  j_mem_robustRow : boundary iJ ∈ robustRow.support
  c_mem_robustRow : boundary iC ∈ robustRow.support
  c_mem_firstFiberRow : boundary iC ∈ firstFiberRow.support
  k_mem_firstFiberRow : boundary iK ∈ firstFiberRow.support
  j_mem_secondFiberRow : boundary iJ ∈ secondFiberRow.support
  k_mem_secondFiberRow : boundary iK ∈ secondFiberRow.support

/-- The robust-apex row gives the first half of the ordinal two-cycle:
`AJ < AC`. -/
theorem OrderedRobustTwoFiberKalmansonCore.dist_AJ_lt_dist_AC
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = A)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (P : OrderedRobustTwoFiberKalmansonCore boundary) :
    dist (boundary P.iA) (boundary P.iJ) <
      dist (boundary P.iA) (boundary P.iC) := by
  have hOJ_eq_OC :
      dist (boundary P.iO) (boundary P.iJ) =
        dist (boundary P.iO) (boundary P.iC) :=
    (P.robustRow.support_eq_radius _ P.j_mem_robustRow).trans
      (P.robustRow.support_eq_radius _ P.c_mem_robustRow).symm
  exact dist_lt_of_ccw_of_dist_diagonal_eq_side hA hboundary_injective
    hboundary_image hboundary_ccw P.hOA (P.hAX.trans P.hXJ) P.hJC hOJ_eq_OC

/-- The two fiber rows give the reverse half of the ordinal two-cycle:
`AC < AJ`.  The `X`-row cancels the two `X`-distances in the Kalmanson
inequality, and the `A`-row identifies the remaining `AK` term with `AC`. -/
theorem OrderedRobustTwoFiberKalmansonCore.dist_AC_lt_dist_AJ
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = A)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (P : OrderedRobustTwoFiberKalmansonCore boundary) :
    dist (boundary P.iA) (boundary P.iC) <
      dist (boundary P.iA) (boundary P.iJ) := by
  have hXJ_eq_XK :
      dist (boundary P.iX) (boundary P.iJ) =
        dist (boundary P.iX) (boundary P.iK) :=
    (P.secondFiberRow.support_eq_radius _ P.j_mem_secondFiberRow).trans
      (P.secondFiberRow.support_eq_radius _ P.k_mem_secondFiberRow).symm
  have hAC_eq_AK :
      dist (boundary P.iA) (boundary P.iC) =
        dist (boundary P.iA) (boundary P.iK) :=
    (P.firstFiberRow.support_eq_radius _ P.c_mem_firstFiberRow).trans
      (P.firstFiberRow.support_eq_radius _ P.k_mem_firstFiberRow).symm
  have hkal :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hboundary_injective
      hboundary_image hboundary_ccw P.hAX P.hXJ (P.hJC.trans P.hCK)
  linarith

/-- A robust-apex selected row and the two ordered fiber rows in the exact
`O,A,X` cross-support pattern are impossible. -/
theorem false_of_ordered_robust_twoFiberKalmansonCore
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = A)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (P : OrderedRobustTwoFiberKalmansonCore boundary) :
    False := by
  exact (P.dist_AJ_lt_dist_AC hA hboundary_injective hboundary_image hboundary_ccw).asymm
    (P.dist_AC_lt_dist_AJ hA hboundary_injective hboundary_image hboundary_ccw)

#print axioms OrderedRobustTwoFiberKalmansonCore.dist_AJ_lt_dist_AC
#print axioms OrderedRobustTwoFiberKalmansonCore.dist_AC_lt_dist_AJ
#print axioms false_of_ordered_robust_twoFiberKalmansonCore

end ATailRobustTwoFiberKalmansonConsumerScratch
end Problem97
