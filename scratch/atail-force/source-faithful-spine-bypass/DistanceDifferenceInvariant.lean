import Erdos9796Proof.P97.ATail.ParentExactFiveAssembler
import Erdos9796Proof.P97.Dumitrescu.Lc1Strict

/-!
# Distance-difference normal form for the full-`L` occurrence

This is copied from the `/opt/nfs` Round-98 checkpoint and adapted only in
placement.  It rewrites first-apex co-radiality of a transition reverse pair
as one exact inner-product zero, retaining the source-faithful transition
packet used by the live parent.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace Round98FullParentAllReverse

open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFiveLowHit
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveAssembler
open ATailPhysicalSecondApexCommonDeletion
open ATailRobustLargeRadius

attribute [local instance] Classical.propDecidable

/-- If `a,b` lie on one circle centered at `c`, their squared-distance
difference from `p` is the signed projection of their chord on `p-c`. -/
theorem sqDistDiff_eq_two_inner_sub_of_equidistant
    (p c a b : ℝ²) (hcenter : dist c a = dist c b) :
    dist p a ^ 2 - dist p b ^ 2 =
      2 * ⟪p - c, b - a⟫_ℝ := by
  have hc : ⟪c - midpoint ℝ a b, b - a⟫_ℝ = 0 :=
    inner_witness_midpoint_eq_zero a b c hcenter
  have hp := inner_chord_eq_dist_sq_diff a b p
  have hdecomp :
      p - midpoint ℝ a b = (p - c) + (c - midpoint ℝ a b) := by
    abel
  rw [hdecomp, inner_add_left, hc, add_zero] at hp
  exact hp.symm

/-- For a chord of a circle centered at `c`, the endpoints are co-radial from
`p` exactly when the chord is orthogonal to `p-c`. -/
theorem dist_eq_iff_inner_sub_eq_zero_of_equidistant
    (p c a b : ℝ²) (hcenter : dist c a = dist c b) :
    dist p a = dist p b ↔ ⟪p - c, b - a⟫_ℝ = 0 := by
  have hdiff := sqDistDiff_eq_two_inner_sub_of_equidistant p c a b hcenter
  constructor
  · intro hab
    rw [hab, sub_self] at hdiff
    linarith
  · intro hinner
    rw [hinner, mul_zero] at hdiff
    have ha : 0 ≤ dist p a := dist_nonneg
    have hb : 0 ≤ dist p b := dist_nonneg
    nlinarith

/-- Row-facing form for a transition reverse outside pair. -/
theorem transitionReverseOutsidePair_firstApex_dist_eq_iff_inner_eq_zero
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (T : PhysicalActualCriticalOmissionTransition H profile)
    (q : PhysicalVertex profile) {a b : ℝ²}
    (ha : a ∈ transitionReverseOutsidePair T q)
    (hb : b ∈ transitionReverseOutsidePair T q) :
    dist S.oppApex1 a = dist S.oppApex1 b ↔
      ⟪S.oppApex1 - transitionReverseRowCenter T q, b - a⟫_ℝ = 0 := by
  let row := (H.selectedAt (T.successor q).1
    (PhysicalVertex.mem_A (T.successor q))).toCriticalFourShell
  have haSupport : a ∈ row.support := (Finset.mem_sdiff.mp ha).1
  have hbSupport : b ∈ row.support := (Finset.mem_sdiff.mp hb).1
  have hcenter :
      dist (transitionReverseRowCenter T q) a =
        dist (transitionReverseRowCenter T q) b := by
    exact (row.support_eq_radius a haSupport).trans
      (row.support_eq_radius b hbSupport).symm
  exact dist_eq_iff_inner_sub_eq_zero_of_equidistant
    S.oppApex1 (transitionReverseRowCenter T q) a b hcenter

/-- Orthogonality form of the full-parent occurrence. -/
abbrev FirstApexOrthogonalTransitionReversePairOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation) : Prop :=
  ∃ q : PhysicalVertex profile, ∃ a b : ℝ²,
    a ≠ b ∧
      a ∈ transitionReverseOutsidePair A.transition q ∧
      b ∈ transitionReverseOutsidePair A.transition q ∧
      ⟪S.oppApex1 - transitionReverseRowCenter A.transition q,
        b - a⟫_ℝ = 0

/-- The orthogonality packet is equivalent to the production co-radial
occurrence by the actual selected-row radius equality. -/
theorem firstApexOrthogonalOccurrence_iff_coRadialOccurrence
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {firstRadius : ℝ}
    {H : CriticalShellSystem D.A}
    {F₀ : CriticalPairFrontier D S firstRadius H}
    {R : FrontierCommonDeletionParentResidual F₀}
    {B : FrontierBiApexRobustResidual R}
    {L : FrontierLargeOppositeCapsBiApexRobustResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {continuation :
      LargeCapUniqueFiveTwoCommonDeletionSources D S H profile}
    (A : FullParentExactFiveAllReverseData L profile continuation) :
    FirstApexOrthogonalTransitionReversePairOccurrence A ↔
      FirstApexCoRadialTransitionReversePairOccurrence A := by
  constructor
  · rintro ⟨q, a, b, hab, ha, hb, horth⟩
    exact ⟨q, a, b, hab, ha, hb,
      (transitionReverseOutsidePair_firstApex_dist_eq_iff_inner_eq_zero
        A.transition q ha hb).2 horth⟩
  · rintro ⟨q, a, b, hab, ha, hb, hdist⟩
    exact ⟨q, a, b, hab, ha, hb,
      (transitionReverseOutsidePair_firstApex_dist_eq_iff_inner_eq_zero
        A.transition q ha hb).1 hdist⟩

#print axioms transitionReverseOutsidePair_firstApex_dist_eq_iff_inner_eq_zero
#print axioms firstApexOrthogonalOccurrence_iff_coRadialOccurrence

end Round98FullParentAllReverse
end Problem97
