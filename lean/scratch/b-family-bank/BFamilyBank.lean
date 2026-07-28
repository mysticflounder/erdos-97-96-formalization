import Erdos9796Proof.P97.ATail.FrontierLiveClosure
import Erdos9796Proof.P97.Dumitrescu.L1

/-!
# B-family bank (scratch)

Kernel-checked, `sorry`-free bank theorems for the derivations claimed in
`docs/solve-prompts/2026-07-27-b-round1-response.md`.

Every hypothesis list below is copied verbatim (up to binder renaming, which
only removes the `_` linter prefix where the hypothesis is actually used) from
the three live B leaves in
`Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`:

* B1 `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`
  (:693),
* B2 `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`
  (:1165),
* B3 `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare`
  (:1239).

Nothing here is wired into the production files; these are BANK theorems only.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace BFamilyBank

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailFrontierLiveClosure
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/- ## Shared helper: an omitted point cannot destroy a chosen critical shell -/

/-- If `x` is not on the chosen critical shell of source `s`, then deleting `x`
leaves a full four-point equidistant class at `s`'s chosen blocker. -/
theorem survives_at_blocker_of_not_mem_row
    {D : CounterexampleData} (H : CriticalShellSystem D.A)
    {s x : ℝ²} (hs : s ∈ D.A)
    (hx : x ∉ (H.selectedAt s hs).toCriticalFourShell.support) :
    HasNEquidistantPointsAt 4 (D.A.erase x) (H.centerAt s hs) := by
  classical
  set K := (H.selectedAt s hs).toCriticalFourShell with hK
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ ((D.A.erase x).filter
        fun z => dist (H.centerAt s hs) z = K.radius).card := by
      refine Finset.card_le_card ?_
      intro z hz
      refine Finset.mem_filter.mpr ⟨?_, K.support_eq_radius z hz⟩
      refine Finset.mem_erase.mpr ⟨?_, K.support_subset_A hz⟩
      intro hzx
      exact hx (hzx ▸ hz)

/- ## Target 1 — B1 normal form and the B1-gap reduction

The hypothesis block below is verbatim B1
(`FrontierLiveClosure.lean:693–741`). -/

/-- **B1 normal form (a).**  The shared canonical support meets the physical
second-apex class in exactly the two deleted sources. -/
theorem b1_sharedSupport_inter_class_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (_hblockersEq :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hsupportsEq :
      ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (_hfirstMemSecondRow :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (hsecondMemFirstRow :
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support)
    (hclassIntersectionTwo :
      ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card = 2)) :
    (((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 rho)
      = ({first.deleted.1, second.deleted.1} : Finset ℝ²) := by
  classical
  have hne : first.deleted.1 ≠ second.deleted.1 := by
    intro h
    exact hdeletedNe (Subtype.ext h)
  have hz₁ :
      first.deleted.1 ∈
        (((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho) :=
    Finset.mem_inter.mpr
      ⟨((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support,
        first.deleted_mem_class⟩
  have hz₂ :
      second.deleted.1 ∈
        (((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho) :=
    Finset.mem_inter.mpr ⟨hsecondMemFirstRow, second.deleted_mem_class⟩
  have hpairCard :
      ({first.deleted.1, second.deleted.1} : Finset ℝ²).card = 2 :=
    Finset.card_pair hne
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact hz₁
    · rw [Finset.mem_singleton] at hx
      exact hx ▸ hz₂
  · rw [hpairCard, hclassIntersectionTwo]

/-- **B1 normal form (b).**  The common actual blocker and the physical second
apex are two distinct carrier points, both equidistant from the two deleted
sources. -/
theorem b1_two_carrier_bisector_points
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hblockersEq :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hsupportsEq :
      ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (_hfirstMemSecondRow :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (hsecondMemFirstRow :
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support)
    (_hclassIntersectionTwo :
      ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card = 2)) :
    (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ≠
        S.oppApex2 ∧
      (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2 ∈ D.A ∧
      S.oppApex2 ∈ D.A ∧
      dist ((lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2)
          first.deleted.1 =
        dist ((lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2)
          second.deleted.1 ∧
      dist S.oppApex2 first.deleted.1 = dist S.oppApex2 second.deleted.1 := by
  classical
  refine ⟨first.uPacket.actual_blocker_ne_center₂, ?_, first.uPacket.center₂_mem_A,
    ?_, ?_⟩
  · exact (Finset.mem_erase.mp
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.center_mem).2
  · have h₁ :=
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support_eq_radius
        first.deleted.1
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.q_mem_support
    have h₂ :=
      ((lateFirstApexSystem R).selectedAt
        first.deleted.1 first.deleted.2).toCriticalFourShell.support_eq_radius
        second.deleted.1 hsecondMemFirstRow
    exact h₁.trans h₂.symm
  · have h₁ := (mem_selectedClass.mp first.deleted_mem_class).2
    have h₂ := (mem_selectedClass.mp second.deleted_mem_class).2
    exact h₁.trans h₂.symm

/-- **B1-gap reduction (c).**  Under B1's hypotheses, any third carrier point
equidistant from the two deleted sources closes the leaf. -/
theorem b1_false_of_third_bisector_carrier
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (_hblockersEq :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hsupportsEq :
      ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (_hfirstMemSecondRow :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (hsecondMemFirstRow :
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support)
    (_hclassIntersectionTwo :
      ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card = 2))
    -- (B1-gap): a third carrier point on the perpendicular bisector of the
    -- two deleted sources.
    (c : ℝ²) (hcA : c ∈ D.A)
    (hcNeBlocker :
      c ≠ (lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2)
    (hcNeApex : c ≠ S.oppApex2)
    (hcBisects : dist c first.deleted.1 = dist c second.deleted.1) :
    False := by
  classical
  have hne : first.deleted.1 ≠ second.deleted.1 := by
    intro h
    exact hdeletedNe (Subtype.ext h)
  obtain ⟨hbNeApex, hbA, haA, hbBisects, haBisects⟩ :=
    b1_two_carrier_bisector_points R _hcard _surface rho _hrho _hfive u v _huNeV
      _huClass _hvClass _hvOmitted _huOmitted first second hdeletedNe
      _hblockersEq _hsupportsEq _hfirstMemSecondRow hsecondMemFirstRow
      _hclassIntersectionTwo
  have hbound :
      (D.A.filter
        (fun p => dist p first.deleted.1 = dist p second.deleted.1)).card ≤ 2 :=
    Problem97.Dumitrescu.perpBisector_apex_bound D.convex
      first.deleted.2 second.deleted.2 hne
  have hthree :
      2 <
        (D.A.filter
          (fun p => dist p first.deleted.1 = dist p second.deleted.1)).card := by
    rw [Finset.two_lt_card]
    exact
      ⟨(lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2,
        Finset.mem_filter.mpr ⟨hbA, hbBisects⟩,
        S.oppApex2, Finset.mem_filter.mpr ⟨haA, haBisects⟩,
        c, Finset.mem_filter.mpr ⟨hcA, hcBisects⟩,
        hbNeApex, fun h => hcNeBlocker h.symm, fun h => hcNeApex h.symm⟩
  omega

/- ## Target 2 — B3-rem removability equivalence and the B3-gap reduction

The hypothesis block below is verbatim B3
(`FrontierLiveClosure.lean:1239–1332`). -/

/-- The four named centers of the B3 arm, as a `Finset`. -/
noncomputable def b3NamedCenters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {rho : ℝ} {u v : CarrierVertex D.A}
    (second : ExactFourMutualOmissionJointDeletion R rho u v) : Finset ℝ² :=
  ({S.oppApex2,
      (lateFirstApexSystem R).centerAt u.1 u.2,
      (lateFirstApexSystem R).centerAt v.1 v.2,
      (lateFirstApexSystem R).centerAt second.deleted.1 second.deleted.2}
    : Finset ℝ²)

/-- **(B3-rem).**  Under B3's hypotheses the common deleted source is removable
iff deletion survival holds at every carrier center outside the four named
ones.  The four named centers are supplied by `first.uPacket`, `first.vPacket`
and the cross packet. -/
theorem b3_removable_iff_survival_off_named_centers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2)
    (_hsquare :
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1) S.oppApex2 ∧
        HasNEquidistantPointsAt 4
          (D.A.erase S.oppApex2)
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt u.1 u.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            ((lateFirstApexSystem R).centerAt u.1 u.2))
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt v.1 v.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            ((lateFirstApexSystem R).centerAt v.1 v.2))
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            ((lateFirstApexSystem R).centerAt
              second.deleted.1 second.deleted.2))
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2))) :
    IsRemovableVertex D.A first.deleted.1 ↔
      ∀ c ∈ D.A.erase first.deleted.1,
        c ∉ b3NamedCenters second →
          HasNEquidistantPointsAt 4 (D.A.erase first.deleted.1) c := by
  classical
  constructor
  · intro hrem c hc _
    exact hrem.2 c hc
  · intro hgap
    refine ⟨first.deleted.2, ?_⟩
    intro p hp
    by_cases hnamed : p ∈ b3NamedCenters second
    · have hnamed' :
          p = S.oppApex2 ∨
            p = (lateFirstApexSystem R).centerAt u.1 u.2 ∨
            p = (lateFirstApexSystem R).centerAt v.1 v.2 ∨
            p =
              (lateFirstApexSystem R).centerAt
                second.deleted.1 second.deleted.2 := by
        simpa [b3NamedCenters, Finset.mem_insert, Finset.mem_singleton]
          using hnamed
      rcases hnamed' with rfl | rfl | rfl | rfl
      · exact first.uPacket.survives₂
      · exact first.uPacket.survives₁
      · exact first.vPacket.survives₁
      · exact crossPacket.survives₁
    · exact hgap p hp hnamed

/-- **(B3-gap) closes B3.**  Deletion survival at every carrier center outside
the four named ones contradicts minimality. -/
theorem b3_false_of_survival_off_named_centers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2)
    (hsquare :
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1) S.oppApex2 ∧
        HasNEquidistantPointsAt 4
          (D.A.erase S.oppApex2)
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt u.1 u.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            ((lateFirstApexSystem R).centerAt u.1 u.2))
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt v.1 v.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            ((lateFirstApexSystem R).centerAt v.1 v.2))
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)) ∨
      (HasNEquidistantPointsAt 4
          (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2) ∧
        HasNEquidistantPointsAt 4
          (D.A.erase
            ((lateFirstApexSystem R).centerAt
              second.deleted.1 second.deleted.2))
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2)))
    -- (B3-gap)
    (hgap :
      ∀ c ∈ D.A.erase first.deleted.1,
        c ∉ b3NamedCenters second →
          HasNEquidistantPointsAt 4 (D.A.erase first.deleted.1) c) :
    False := by
  classical
  exact
    CounterexampleData.not_isRemovableVertex_of_minimal R.minimal
      first.deleted.1
      ((b3_removable_iff_survival_off_named_centers R _hcard _surface rho _hrho
        _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted first second
        _hdeletedNe _hdeletedBlockersNe _hfirstBlockerNeU _hfirstBlockerNeV
        _hfirstBlockerNeApex _hsecondBlockerNeU _hsecondBlockerNeV
        _hsecondBlockerNeApex crossPacket hsquare).mpr hgap)

/- ## Target 3 — B2 arm normalization

The hypothesis block below is verbatim B2
(`FrontierLiveClosure.lean:1165–1232`). -/

/-- **B2 canonical-row forcing.**  Each blocker-centred `q`-deleted row of the
three common-deletion packets is the canonical critical support of the source
owning that blocker.  This holds unconditionally on `_hcollision`. -/
theorem b2_canonicalRow_forcing
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2)
    (_hcollision :
      first.deleted.1 =
          (lateFirstApexSystem R).centerAt u.1 u.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt v.1 v.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2) :
    first.uPacket.B₁ =
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support ∧
      first.vPacket.B₁ =
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support ∧
      crossPacket.B₁ =
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support := by
  classical
  refine ⟨?_, ?_, ?_⟩
  · exact qDeletedRow_at_actualBlocker_eq_canonicalSupport u.2
      first.uPacket.row₁ first.uPacket.B₁_card
  · exact qDeletedRow_at_actualBlocker_eq_canonicalSupport v.2
      first.vPacket.row₁ first.vPacket.B₁_card
  · exact qDeletedRow_at_actualBlocker_eq_canonicalSupport second.deleted.2
      crossPacket.row₁ crossPacket.B₁_card

/-- **B2 center exclusion.**  In each collision arm the collided point is the
centre of the corresponding selected shell, hence omitted from that shell's
support.  No positive row incidence is produced. -/
theorem b2_collision_center_exclusion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (_crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2)
    (hcollision :
      first.deleted.1 =
          (lateFirstApexSystem R).centerAt u.1 u.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt v.1 v.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2) :
    (first.deleted.1 = (lateFirstApexSystem R).centerAt u.1 u.2 ∧
        first.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support) ∨
      (first.deleted.1 = (lateFirstApexSystem R).centerAt v.1 v.2 ∧
        first.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support) ∨
      (first.deleted.1 =
          (lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2 ∧
        first.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            second.deleted.1 second.deleted.2).toCriticalFourShell.support) := by
  classical
  rcases hcollision with hc | hc | hc
  · refine Or.inl ⟨hc, ?_⟩
    rw [hc]
    exact ((lateFirstApexSystem R).selectedAt
      u.1 u.2).toCriticalFourShell.center_not_mem_support
  · refine Or.inr (Or.inl ⟨hc, ?_⟩)
    rw [hc]
    exact ((lateFirstApexSystem R).selectedAt
      v.1 v.2).toCriticalFourShell.center_not_mem_support
  · refine Or.inr (Or.inr ⟨hc, ?_⟩)
    rw [hc]
    exact ((lateFirstApexSystem R).selectedAt
      second.deleted.1 second.deleted.2).toCriticalFourShell.center_not_mem_support

/-- **B2 mutually omitted pair and bidirectional single-deletion survival.**
The common deleted source mutually omits one of the two original class points,
and each omission upgrades to a full four-point class at the omitted point's
chosen blocker after the other point is deleted. -/
theorem b2_mutualOmission_bidirectional_survival
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (huNeV : u ≠ v)
    (huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (_hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2)
    (_hsecondBlockerNeU :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (_hsecondBlockerNeV :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (_hsecondBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2 ≠ S.oppApex2)
    (_crossPacket :
      CommonDeletionTwoCenterPacket
        D (lateFirstApexSystem R) first.deleted.1
        ((lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
        S.oppApex2)
    (_hcollision :
      first.deleted.1 =
          (lateFirstApexSystem R).centerAt u.1 u.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt v.1 v.2 ∨
        first.deleted.1 =
          (lateFirstApexSystem R).centerAt
            second.deleted.1 second.deleted.2) :
    ((u.1 ∉
          ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∧
        first.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            u.1 u.2).toCriticalFourShell.support) ∧
      HasNEquidistantPointsAt 4 (D.A.erase u.1)
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt u.1 u.2)) ∨
    ((v.1 ∉
          ((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∧
        first.deleted.1 ∉
          ((lateFirstApexSystem R).selectedAt
            v.1 v.2).toCriticalFourShell.support) ∧
      HasNEquidistantPointsAt 4 (D.A.erase v.1)
          ((lateFirstApexSystem R).centerAt
            first.deleted.1 first.deleted.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase first.deleted.1)
          ((lateFirstApexSystem R).centerAt v.1 v.2)) := by
  classical
  rcases
      exactFour_jointDeleted_mutualOmission_with_one_original surface huNeV
        huClass hvClass first with ⟨hu₁, hu₂⟩ | ⟨hv₁, hv₂⟩
  · exact Or.inl
      ⟨⟨hu₁, hu₂⟩,
        survives_at_blocker_of_not_mem_row (lateFirstApexSystem R)
          first.deleted.2 hu₁,
        survives_at_blocker_of_not_mem_row (lateFirstApexSystem R) u.2 hu₂⟩
  · exact Or.inr
      ⟨⟨hv₁, hv₂⟩,
        survives_at_blocker_of_not_mem_row (lateFirstApexSystem R)
          first.deleted.2 hv₁,
        survives_at_blocker_of_not_mem_row (lateFirstApexSystem R) v.2 hv₂⟩

/- ## Target 4 — status of the two boxed gap statements

Both round-1 "gap" statements are refutable from the leaves' own binder
packages.  For B3 the refutation is a single step from
`CriticalShellSystem.no_qfree`; for B1 it is the saturation of the
perpendicular-bisector bound established in Target 1. -/

/-- With a `CriticalShellSystem` present on `A`, **no** vertex of `A` is
removable: the system's chosen blocker for `x` already witnesses the failure of
`HasNEquidistantProperty 4 (A.erase x)` at a point of `A.erase x`.  Hence the
"delete a source, contradict minimality" mechanism carries no content beyond
`no_qfree` itself. -/
theorem not_isRemovableVertex_of_criticalShellSystem
    {A : Finset ℝ²} (H : CriticalShellSystem A) (x : ℝ²) :
    ¬ IsRemovableVertex A x := by
  intro hrem
  exact H.no_qfree_at x hrem.1
    (hrem.2 (H.centerAt x hrem.1)
      (H.selectedAt x hrem.1).toCriticalFourShell.center_mem)

/-- **(B3-gap) is refutable.**  The chosen blocker of the common deleted source
lies in `A.erase z₁`, is distinct from all four named centers by four of B3's
own hypotheses, and is by construction a point where deletion survival fails. -/
theorem b3_gap_refuted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (hfirstBlockerNeU :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt u.1 u.2)
    (hfirstBlockerNeV :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠
        (lateFirstApexSystem R).centerAt v.1 v.2)
    (hfirstBlockerNeApex :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 ≠ S.oppApex2) :
    ¬ (∀ c ∈ D.A.erase first.deleted.1,
        c ∉ b3NamedCenters second →
          HasNEquidistantPointsAt 4 (D.A.erase first.deleted.1) c) := by
  classical
  intro hgap
  refine (lateFirstApexSystem R).no_qfree_at first.deleted.1 first.deleted.2 ?_
  refine hgap _
    ((lateFirstApexSystem R).selectedAt
      first.deleted.1 first.deleted.2).toCriticalFourShell.center_mem ?_
  simp only [b3NamedCenters, Finset.mem_insert, Finset.mem_singleton, not_or]
  exact ⟨hfirstBlockerNeApex, hfirstBlockerNeU, hfirstBlockerNeV,
    hdeletedBlockersNe⟩

/-- **B1 bisector saturation.**  The carrier points equidistant from the two
deleted sources are exactly the common actual blocker and the physical second
apex. -/
theorem b1_bisectorSet_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (_hblockersEq :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hsupportsEq :
      ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (_hfirstMemSecondRow :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (hsecondMemFirstRow :
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support)
    (_hclassIntersectionTwo :
      ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card = 2)) :
    D.A.filter
        (fun p => dist p first.deleted.1 = dist p second.deleted.1) =
      ({(lateFirstApexSystem R).centerAt first.deleted.1 first.deleted.2,
          S.oppApex2} : Finset ℝ²) := by
  classical
  have hne : first.deleted.1 ≠ second.deleted.1 := by
    intro h
    exact hdeletedNe (Subtype.ext h)
  obtain ⟨hbNeApex, hbA, haA, hbBisects, haBisects⟩ :=
    b1_two_carrier_bisector_points R _hcard _surface rho _hrho _hfive u v _huNeV
      _huClass _hvClass _hvOmitted _huOmitted first second hdeletedNe
      _hblockersEq _hsupportsEq _hfirstMemSecondRow hsecondMemFirstRow
      _hclassIntersectionTwo
  have hbound :
      (D.A.filter
        (fun p => dist p first.deleted.1 = dist p second.deleted.1)).card ≤ 2 :=
    Problem97.Dumitrescu.perpBisector_apex_bound D.convex
      first.deleted.2 second.deleted.2 hne
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro x hx
    rcases Finset.mem_insert.mp hx with rfl | hx
    · exact Finset.mem_filter.mpr ⟨hbA, hbBisects⟩
    · rw [Finset.mem_singleton] at hx
      exact hx ▸ Finset.mem_filter.mpr ⟨haA, haBisects⟩
  · rw [Finset.card_pair hbNeApex]
    exact hbound

/-- **The two actual blockers of `u` and `v` are refuted as (B1-gap)
witnesses.**  Each is a carrier point distinct from both saturating bisector
points, hence provably not equidistant from the two deleted sources. -/
theorem b1_uv_blockers_not_bisectors
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (_surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (first second :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (_hblockersEq :
      (lateFirstApexSystem R).centerAt
          first.deleted.1 first.deleted.2 =
        (lateFirstApexSystem R).centerAt
          second.deleted.1 second.deleted.2)
    (_hsupportsEq :
      ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support =
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (_hfirstMemSecondRow :
      first.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          second.deleted.1 second.deleted.2).toCriticalFourShell.support)
    (hsecondMemFirstRow :
      second.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          first.deleted.1 first.deleted.2).toCriticalFourShell.support)
    (_hclassIntersectionTwo :
      ((((lateFirstApexSystem R).selectedAt
            first.deleted.1 first.deleted.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 rho).card = 2)) :
    dist ((lateFirstApexSystem R).centerAt u.1 u.2) first.deleted.1 ≠
        dist ((lateFirstApexSystem R).centerAt u.1 u.2) second.deleted.1 ∧
      dist ((lateFirstApexSystem R).centerAt v.1 v.2) first.deleted.1 ≠
        dist ((lateFirstApexSystem R).centerAt v.1 v.2) second.deleted.1 := by
  classical
  constructor
  · intro hbis
    exact
      b1_false_of_third_bisector_carrier R _hcard _surface rho _hrho _hfive u v
        _huNeV _huClass _hvClass _hvOmitted _huOmitted first second hdeletedNe
        _hblockersEq _hsupportsEq _hfirstMemSecondRow hsecondMemFirstRow
        _hclassIntersectionTwo
        ((lateFirstApexSystem R).centerAt u.1 u.2)
        first.uPacket.center₁_mem_A
        (Ne.symm first.uPacket.actual_blocker_ne_center₁)
        first.uPacket.centers_ne hbis
  · intro hbis
    exact
      b1_false_of_third_bisector_carrier R _hcard _surface rho _hrho _hfive u v
        _huNeV _huClass _hvClass _hvOmitted _huOmitted first second hdeletedNe
        _hblockersEq _hsupportsEq _hfirstMemSecondRow hsecondMemFirstRow
        _hclassIntersectionTwo
        ((lateFirstApexSystem R).centerAt v.1 v.2)
        first.vPacket.center₁_mem_A
        (Ne.symm first.vPacket.actual_blocker_ne_center₁)
        first.vPacket.centers_ne hbis

/- ## Axiom gate

Every bank theorem must show only Lean core axioms
(`propext`, `Classical.choice`, `Quot.sound`) — no `sorryAx`, no
`Lean.ofReduceBool`, no project axiom. -/

#print axioms survives_at_blocker_of_not_mem_row
#print axioms b1_sharedSupport_inter_class_eq_pair
#print axioms b1_two_carrier_bisector_points
#print axioms b1_false_of_third_bisector_carrier
#print axioms b3_removable_iff_survival_off_named_centers
#print axioms b3_false_of_survival_off_named_centers
#print axioms b2_canonicalRow_forcing
#print axioms b2_collision_center_exclusion
#print axioms b2_mutualOmission_bidirectional_survival
#print axioms not_isRemovableVertex_of_criticalShellSystem
#print axioms b3_gap_refuted
#print axioms b1_bisectorSet_eq_pair
#print axioms b1_uv_blockers_not_bisectors

end BFamilyBank
end Problem97
