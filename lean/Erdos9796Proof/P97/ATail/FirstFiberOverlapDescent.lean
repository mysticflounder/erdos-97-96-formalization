import Erdos9796Proof.P97.ATail.BlockerMultiplicityGeometry
import Erdos9796Proof.P97.ATail.DeletionRobustness
import Erdos9796Proof.P97.ATail.LocalizedCollisionMutualOmissionCycle
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.ATail.OrientedPhysicalApexIngress
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# First-fiber overlap descent

Checked normalization and terminal lemmas for
`false_of_capSource_freshOutsideFirstBlockerFiber`.

The direct positive-incidence target is incompatible with the distinct-circle
bound: the two critical rows can share at most two points.  This module instead
extracts the sound retained-data descent used by the live first-fiber branch:
either the two localized omission cycles align with two named cap-row hits, or
one of four collision-source deletions preserves K4 at five named centers.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFirstFiberOverlapDescent

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailLocalizedCollisionMutualOmissionCycle
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- One deletion preserves K4 at five named centers.  Distinctness of those
centers is intentionally not bundled here; the live hypotheses can supply
the required separations independently. -/
abbrev FiveCenterDeletionSurvival
    (D : CounterexampleData) (deleted c₀ c₁ c₂ c₃ c₄ : ℝ²) : Prop :=
  HasNEquidistantPointsAt 4 (D.A.erase deleted) c₀ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₁ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₂ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₃ ∧
    HasNEquidistantPointsAt 4 (D.A.erase deleted) c₄

/-- The single non-deletion arm left by the retained first-fiber descent.
The cap-source row hits the cycle-selected endpoint from each collision pair,
omits the other endpoint of each pair, and omits at least one of the two named
off-cap points. -/
abbrev FirstFiberCycleAlignedResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP) : Prop :=
  P.source₁ ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    P.source₂ ∉
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    Pρ.source₁ ∈
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    Pρ.source₂ ∉
      (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
    (Q.source.1 ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support ∨
      Q.otherOutsidePoint ∉
        (H.selectedAt source.1 source.2).toCriticalFourShell.support) ∧
    MPρ.collisionSource = P.source₁ ∧
    MP.collisionSource = Pρ.source₁

/-- The four deletion arms left by the retained first-fiber descent.  The
deleted point is one of the collision sources; K4 survives at the cap-source
blocker, the first apex, the opposite collision blocker, and the other two
Moser apices. -/
abbrev FirstFiberCollisionFiveCenterDeletionResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (a₂ a₃ : ℝ²) : Prop :=
  FiveCenterDeletionSurvival D P.source₁
      (H.centerAt source.1 source.2) S.oppApex1
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) a₂ a₃ ∨
    FiveCenterDeletionSurvival D Pρ.source₁
      (H.centerAt source.1 source.2) S.oppApex1
      (H.centerAt P.source₁ P.source₁_mem_A) a₂ a₃ ∨
    FiveCenterDeletionSurvival D P.source₂
      (H.centerAt source.1 source.2) S.oppApex1
      (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) a₂ a₃ ∨
    FiveCenterDeletionSurvival D Pρ.source₂
      (H.centerAt source.1 source.2) S.oppApex1
      (H.centerAt P.source₁ P.source₁_mem_A) a₂ a₃

/-- Two distinct centers in one ordered cap cannot both bisect the same
pair of points outside that cap. -/
private theorem false_of_two_cap_centers_equidistant_outside_pair
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {c d a b : ℝ²}
    (hcCap : c ∈ S.capByIndex k)
    (hdCap : d ∈ S.capByIndex k)
    (hcd : c ≠ d)
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
    (hcEq : dist c a = dist c b)
    (hdEq : dist d a = dist d b) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hdImage : d ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hdCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hdImage with ⟨id, _hid, hid⟩
  have hic_ne_id : ic ≠ id := by
    intro h
    apply hcd
    calc
      c = L.points ic := hic.symm
      _ = L.points id := by simp [h]
      _ = d := hid
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  rcases lt_or_gt_of_ne hic_ne_id with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt haA hbA haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hid] using hdEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt haA hbA haOutside hbOutside hab
      (by simpa [hid] using hdEq)
      (by simpa [hic] using hcEq)

/-- The first collision row is exactly its two strict-cap sources together
with the two named off-cap points carried by the enlarged blocker fiber. -/
theorem firstFiber_shell_eq_explicitFour
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ) :
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support =
      {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint} := by
  classical
  calc
    (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support =
        ((H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex1) ∪
        ((H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support \
          S.capByIndex S.oppIndex1) := by
            ext x
            by_cases hx : x ∈ S.capByIndex S.oppIndex1 <;> simp [hx]
    _ = ({P.source₁, P.source₂} : Finset ℝ²) ∪
        {Q.source.1, Q.otherOutsidePoint} := by
          rw [P.shell_inter_cap_eq_sources, Q.outside_eq_pair]
    _ = {P.source₁, P.source₂, Q.source.1, Q.otherOutsidePoint} := by
          ext x
          simp only [Finset.mem_union, Finset.mem_insert, Finset.mem_singleton]
          tauto

/-- Any other canonical four-row omits two distinct points of the explicit
first-fiber row.  This is the strongest unconditional incidence consequence:
distinct-center four-rows meet in at most two points. -/
theorem exists_two_firstFiber_points_omitted_by_row
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hcenters :
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A) :
    ∃ y ∈
        ({P.source₁, P.source₂, Q.source.1,
          Q.otherOutsidePoint} : Finset ℝ²),
      ∃ z ∈
        ({P.source₁, P.source₂, Q.source.1,
          Q.otherOutsidePoint} : Finset ℝ²),
        y ≠ z ∧
          y ∉
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∧
          z ∉
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support := by
  let K :=
    (H.selectedAt source.1
      source.2).toCriticalFourShell.toSelectedFourClass
  let L :=
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass
  have hinter : (K.support ∩ L.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two K L hcenters
  have hLcard :
      ({P.source₁, P.source₂, Q.source.1,
        Q.otherOutsidePoint} : Finset ℝ²).card = 4 := by
    rw [← firstFiber_shell_eq_explicitFour P Pρ Q]
    exact
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_card
  have hinterExplicit :
      ((H.selectedAt source.1
          source.2).toCriticalFourShell.support ∩
        ({P.source₁, P.source₂, Q.source.1,
          Q.otherOutsidePoint} : Finset ℝ²)).card ≤ 2 := by
    simpa [K, L, CriticalFourShell.toSelectedFourClass,
      firstFiber_shell_eq_explicitFour P Pρ Q] using hinter
  have hsum :
      (({P.source₁, P.source₂, Q.source.1,
          Q.otherOutsidePoint} : Finset ℝ²) \
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support).card +
        (({P.source₁, P.source₂, Q.source.1,
            Q.otherOutsidePoint} : Finset ℝ²) ∩
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support).card =
      ({P.source₁, P.source₂, Q.source.1,
        Q.otherOutsidePoint} : Finset ℝ²).card :=
    Finset.card_sdiff_add_card_inter _ _
  have hinterExplicit' :
      (({P.source₁, P.source₂, Q.source.1,
          Q.otherOutsidePoint} : Finset ℝ²) ∩
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support).card ≤ 2 := by
    simpa [Finset.inter_comm] using hinterExplicit
  have htwo :
      1 <
        (({P.source₁, P.source₂, Q.source.1,
            Q.otherOutsidePoint} : Finset ℝ²) \
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support).card := by
    omega
  rcases Finset.one_lt_card.mp htwo with
    ⟨y, hy, z, hz, hyz⟩
  exact
    ⟨y, (Finset.mem_sdiff.mp hy).1,
      z, (Finset.mem_sdiff.mp hz).1,
      hyz, (Finset.mem_sdiff.mp hy).2,
      (Finset.mem_sdiff.mp hz).2⟩

/-- The two omitted first-fiber points give two distinct deletions under
which the cap-source canonical K4 survives. -/
theorem exists_two_firstFiber_deletions_surviving_at_rowCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hcenters :
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A) :
    ∃ y ∈
        ({P.source₁, P.source₂, Q.source.1,
          Q.otherOutsidePoint} : Finset ℝ²),
      ∃ z ∈
        ({P.source₁, P.source₂, Q.source.1,
          Q.otherOutsidePoint} : Finset ℝ²),
        y ≠ z ∧
          HasNEquidistantPointsAt 4 (D.A.erase y)
            (H.centerAt source.1 source.2) ∧
          HasNEquidistantPointsAt 4 (D.A.erase z)
            (H.centerAt source.1 source.2) := by
  rcases exists_two_firstFiber_points_omitted_by_row
      P Pρ Q source hcenters with
    ⟨y, hyExplicit, z, hzExplicit, hyz, hyOmit, hzOmit⟩
  exact
    ⟨y, hyExplicit, z, hzExplicit, hyz,
      (cross_deletion_survives_iff_not_mem_selected_support
        H source.2).2 hyOmit,
      (cross_deletion_survives_iff_not_mem_selected_support
        H source.2).2 hzOmit⟩

/-- If three fixed centers are deletion-robust, the same two omitted
first-fiber points yield a two-deletion by four-center survival grid. -/
theorem exists_two_firstFiber_deletions_fourCenters_survive
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hcenters :
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    {a₁ a₂ a₃ : ℝ²}
    (R₁ : FullyDeletionRobustAt D a₁)
    (R₂ : FullyDeletionRobustAt D a₂)
    (R₃ : FullyDeletionRobustAt D a₃) :
    ∃ y ∈
        ({P.source₁, P.source₂, Q.source.1,
          Q.otherOutsidePoint} : Finset ℝ²),
      ∃ z ∈
        ({P.source₁, P.source₂, Q.source.1,
          Q.otherOutsidePoint} : Finset ℝ²),
        y ≠ z ∧
          (HasNEquidistantPointsAt 4 (D.A.erase y)
              (H.centerAt source.1 source.2) ∧
            HasNEquidistantPointsAt 4 (D.A.erase y) a₁ ∧
            HasNEquidistantPointsAt 4 (D.A.erase y) a₂ ∧
            HasNEquidistantPointsAt 4 (D.A.erase y) a₃) ∧
          (HasNEquidistantPointsAt 4 (D.A.erase z)
              (H.centerAt source.1 source.2) ∧
            HasNEquidistantPointsAt 4 (D.A.erase z) a₁ ∧
            HasNEquidistantPointsAt 4 (D.A.erase z) a₂ ∧
            HasNEquidistantPointsAt 4 (D.A.erase z) a₃) := by
  rcases exists_two_firstFiber_points_omitted_by_row
      P Pρ Q source hcenters with
    ⟨y, hyExplicit, z, hzExplicit, hyz, hyOmit, hzOmit⟩
  have hyShell :
      y ∈
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    rw [firstFiber_shell_eq_explicitFour P Pρ Q]
    exact hyExplicit
  have hzShell :
      z ∈
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    rw [firstFiber_shell_eq_explicitFour P Pρ Q]
    exact hzExplicit
  have hyA : y ∈ D.A :=
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.support_subset_A hyShell
  have hzA : z ∈ D.A :=
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.support_subset_A hzShell
  exact
    ⟨y, hyExplicit, z, hzExplicit, hyz,
      ⟨(cross_deletion_survives_iff_not_mem_selected_support
          H source.2).2 hyOmit,
        R₁.survives y hyA, R₂.survives y hyA, R₃.survives y hyA⟩,
      ⟨(cross_deletion_survives_iff_not_mem_selected_support
          H source.2).2 hzOmit,
        R₁.survives z hzA, R₂.survives z hzA, R₃.survives z hzA⟩⟩

/-- Retaining the localized common-deletion packet sharpens the generic
two-omission conclusion.  Either the cap-source row hits `P.source₁`; then
it must omit `P.source₂` and at least one named off-cap point.  Or deleting
`P.source₁` preserves K4 simultaneously at the cap-source blocker, the
first apex, the second collision blocker, and any two robust centers.

This is a genuine disjunction forced by the current live hypotheses.  It
does not assume any new positive incidence. -/
theorem firstFiber_firstSourceHit_or_fiveCenterDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hcenters :
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (homitPair :
      P.source₁ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∨
        P.source₂ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    {a₂ a₃ : ℝ²}
    (R₂ : FullyDeletionRobustAt D a₂)
    (R₃ : FullyDeletionRobustAt D a₃) :
    (P.source₁ ∈
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∧
        P.source₂ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∧
        (Q.source.1 ∉
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∨
          Q.otherOutsidePoint ∉
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support)) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
            (H.centerAt source.1 source.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
            S.oppApex1 ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
            (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁) a₂ ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁) a₃) := by
  by_cases hfirstHit :
      P.source₁ ∈
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support
  · left
    have hsecondOmit :
        P.source₂ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support :=
      homitPair.resolve_left (not_not_intro hfirstHit)
    have hoffcapOmit :
        Q.source.1 ∉
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support ∨
          Q.otherOutsidePoint ∉
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support := by
      by_contra hbothHit
      push_neg at hbothHit
      have hsourceNeFirst₁ : Q.source.1 ≠ P.source₁ := by
        intro h
        apply Q.source_ne_first₁
        apply Subtype.ext
        exact h
      have hotherNeFirst₁ : Q.otherOutsidePoint ≠ P.source₁ := by
        intro h
        apply Q.otherOutsidePoint_not_mem_firstCap
        rw [h]
        exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
          P.source₁_mem_capInterior
      have hsubset :
          ({P.source₁, Q.source.1,
              Q.otherOutsidePoint} : Finset ℝ²) ⊆
            ((H.selectedAt source.1
                source.2).toCriticalFourShell.support ∩
              {P.source₁, P.source₂, Q.source.1,
                Q.otherOutsidePoint}) := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hfirstHit, by simp⟩
        · exact Finset.mem_inter.mpr ⟨hbothHit.1, by simp⟩
        · exact Finset.mem_inter.mpr ⟨hbothHit.2, by simp⟩
      have hthree :
          3 ≤
            ((H.selectedAt source.1
                source.2).toCriticalFourShell.support ∩
              {P.source₁, P.source₂, Q.source.1,
                Q.otherOutsidePoint}).card := by
        calc
          3 =
              ({P.source₁, Q.source.1,
                Q.otherOutsidePoint} : Finset ℝ²).card := by
                  simp [hsourceNeFirst₁.symm, hotherNeFirst₁.symm,
                    Q.otherOutsidePoint_ne_source.symm]
          _ ≤ _ := Finset.card_le_card hsubset
      have hinter :
          ((H.selectedAt source.1
              source.2).toCriticalFourShell.support ∩
            {P.source₁, P.source₂, Q.source.1,
              Q.otherOutsidePoint}).card ≤ 2 := by
        simpa [CriticalFourShell.toSelectedFourClass,
          firstFiber_shell_eq_explicitFour P Pρ Q] using
          SelectedFourClass.inter_card_le_two
            (H.selectedAt source.1
              source.2).toCriticalFourShell.toSelectedFourClass
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass
            hcenters
      omega
    exact ⟨hfirstHit, hsecondOmit, hoffcapOmit⟩
  · right
    have hsourceSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          (H.centerAt source.1 source.2) :=
      (cross_deletion_survives_iff_not_mem_selected_support
        H source.2).2 hfirstHit
    have hapex1Survives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          S.oppApex1 := by
      simpa only [hLP] using LP.packet.survives₁
    have hsecondBlockerSurvives :
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) := by
      simpa only [hLP] using LP.packet.survives₂
    exact
      ⟨hsourceSurvives, hapex1Survives, hsecondBlockerSurvives,
        R₂.survives P.source₁ P.source₁_mem_A,
        R₃.survives P.source₁ P.source₁_mem_A⟩

/-- Applying the preceding descent to both collision pairs gives the exact
positive residual left when neither anchored common deletion is available.
Either the cap-source row hits both anchored sources `P.source₁` and
`Pρ.source₁` while omitting their partners and at least one named off-cap
point, or one of those two anchored deletions preserves K4 at five named
centers. -/
theorem firstFiber_twoAnchorHits_or_anchoredFiveCenterDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hcenters :
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (homitP :
      P.source₁ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∨
        P.source₂ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support)
    (homitPρ :
      Pρ.source₁ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∨
        Pρ.source₂ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    {a₂ a₃ : ℝ²}
    (R₂ : FullyDeletionRobustAt D a₂)
    (R₃ : FullyDeletionRobustAt D a₃) :
    (P.source₁ ∈
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∧
        P.source₂ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∧
        Pρ.source₁ ∈
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∧
        Pρ.source₂ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∧
        (Q.source.1 ∉
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support ∨
          Q.otherOutsidePoint ∉
              (H.selectedAt source.1
                source.2).toCriticalFourShell.support)) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
            (H.centerAt source.1 source.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
            S.oppApex1 ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
            (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁) a₂ ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁) a₃) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁)
            (H.centerAt source.1 source.2) ∧
        HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁)
            S.oppApex1 ∧
        HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁)
            (H.centerAt P.source₁ P.source₁_mem_A) ∧
        HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁) a₂ ∧
        HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁) a₃) := by
  rcases firstFiber_firstSourceHit_or_fiveCenterDeletion
      P Pρ Q source hcenters homitP LP hLP R₂ R₃ with
    hfirstResidual | hfirstDeletion
  · rcases hfirstResidual with
      ⟨hfirstHit, hsecondOmit, hoffcapOmit⟩
    by_cases hρfirstHit :
        Pρ.source₁ ∈
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support
    · have hρsecondOmit :
          Pρ.source₂ ∉
            (H.selectedAt source.1
              source.2).toCriticalFourShell.support :=
        homitPρ.resolve_left (not_not_intro hρfirstHit)
      exact Or.inl
        ⟨hfirstHit, hsecondOmit, hρfirstHit, hρsecondOmit,
          hoffcapOmit⟩
    · right
      right
      have hsourceSurvives :
          HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁)
            (H.centerAt source.1 source.2) :=
        (cross_deletion_survives_iff_not_mem_selected_support
          H source.2).2 hρfirstHit
      have hapex1Survives :
          HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁)
            S.oppApex1 := by
        simpa only [hLPρ] using LPρ.packet.survives₁
      have hfirstBlockerSurvives :
          HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₁)
            (H.centerAt P.source₁ P.source₁_mem_A) := by
        simpa only [hLPρ] using LPρ.packet.survives₂
      exact
        ⟨hsourceSurvives, hapex1Survives, hfirstBlockerSurvives,
          R₂.survives Pρ.source₁ Pρ.source₁_mem_A,
          R₃.survives Pρ.source₁ Pρ.source₁_mem_A⟩
  · exact Or.inr (Or.inl hfirstDeletion)

/-- The mutual-omission cycles sharpen the preceding residual once more.
Unless one of the four collision sources supplies a five-center surviving
deletion, both cycle-selected collision sources are forced to be precisely
the two cap-row hits.  This is the fully retained, source-exact residual
available from the current fields. -/
theorem firstFiber_cycleAlignedHits_or_collisionFiveCenterDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hcenters :
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (homitP :
      P.source₁ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∨
        P.source₂ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support)
    (homitPρ :
      Pρ.source₁ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∨
        Pρ.source₂ ∉
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP)
    {a₂ a₃ : ℝ²}
    (R₂ : FullyDeletionRobustAt D a₂)
    (R₃ : FullyDeletionRobustAt D a₃) :
    FirstFiberCycleAlignedResidual P Pρ Q source LPρ MPρ LP MP ∨
      FirstFiberCollisionFiveCenterDeletionResidual
        P Pρ source a₂ a₃ := by
  rcases firstFiber_twoAnchorHits_or_anchoredFiveCenterDeletion
      P Pρ Q source hcenters homitP homitPρ
      LPρ hLPρ LP hLP R₂ R₃ with
    hresidual | hdeleteP₁ | hdeletePρ₁
  · rcases hresidual with
      ⟨hP₁hit, hP₂omit, hPρ₁hit, hPρ₂omit, hoffcapOmit⟩
    rcases MPρ.collisionSource_eq with hMPρ₁ | hMPρ₂
    · rcases MP.collisionSource_eq with hMP₁ | hMP₂
      · exact Or.inl
          ⟨hP₁hit, hP₂omit, hPρ₁hit, hPρ₂omit, hoffcapOmit,
            hMPρ₁, hMP₁⟩
      · right
        right
        right
        right
        have hsourceSurvives :
            HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₂)
              (H.centerAt source.1 source.2) :=
          (cross_deletion_survives_iff_not_mem_selected_support
            H source.2).2 hPρ₂omit
        have hapex1Survives :
            HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₂)
              S.oppApex1 := by
          simpa only [hMP₂] using MP.collisionSourcePacket.survives₁
        have hfirstBlockerSurvives :
            HasNEquidistantPointsAt 4 (D.A.erase Pρ.source₂)
              (H.centerAt P.source₁ P.source₁_mem_A) := by
          simpa only [hMP₂, hLP] using
            MP.collisionSourcePacket.survives₂
        exact
          ⟨hsourceSurvives, hapex1Survives, hfirstBlockerSurvives,
            R₂.survives Pρ.source₂ Pρ.source₂_mem_A,
            R₃.survives Pρ.source₂ Pρ.source₂_mem_A⟩
    · right
      right
      right
      left
      have hsourceSurvives :
          HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
            (H.centerAt source.1 source.2) :=
        (cross_deletion_survives_iff_not_mem_selected_support
          H source.2).2 hP₂omit
      have hapex1Survives :
          HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
            S.oppApex1 := by
        simpa only [hMPρ₂] using
          MPρ.collisionSourcePacket.survives₁
      have hsecondBlockerSurvives :
          HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
            (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) := by
        simpa only [hMPρ₂, hLPρ] using
          MPρ.collisionSourcePacket.survives₂
      exact
        ⟨hsourceSurvives, hapex1Survives, hsecondBlockerSurvives,
          R₂.survives P.source₂ P.source₂_mem_A,
          R₃.survives P.source₂ P.source₂_mem_A⟩
  · exact Or.inr (Or.inl hdeleteP₁)
  · exact Or.inr (Or.inr (Or.inl hdeletePρ₁))

/-- A cap source chosen outside the two collision pairs is not itself a point
of the first collision row.  Thus the cap source's automatic self-hit cannot
contribute to the required overlap. -/
theorem capSource_not_mem_firstCollisionShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceInterior :
      source.1 ∈ S.capInteriorByIndex S.oppIndex1)
    (hsourceOutside :
      source.1 ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂})) :
    source.1 ∉
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support := by
  intro hsourceShell
  have hsourceCap :
      source.1 ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hsourceInterior
  have hsourcePair : source.1 ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by
    rw [← P.shell_inter_cap_eq_sources]
    exact Finset.mem_inter.mpr ⟨hsourceShell, hsourceCap⟩
  exact hsourceOutside (Finset.mem_union_left _ hsourcePair)

/-- Direct three-overlap terminal after replacing the first collision row by
its four explicitly named points. -/
theorem false_of_firstFiber_explicit_overlap_card_ge_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hcenters :
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (hthree :
      3 ≤
        ((H.selectedAt source.1
            source.2).toCriticalFourShell.support ∩
          {P.source₁, P.source₂, Q.source.1,
            Q.otherOutsidePoint}).card) :
    False := by
  apply false_of_centerAt_selectedFourClass_inter_card_ge_three
    H source.1 source.2
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass
    hcenters
  simpa only [CriticalFourShell.toSelectedFourClass,
    firstFiber_shell_eq_explicitFour P Pρ Q] using hthree

/-- Literal positive-incidence interface for the three-overlap route.  The
two named off-cap hits plus either one of the original collision sources
already form three distinct common support points. -/
theorem false_of_firstFiber_bothOutsideHits_and_firstPairHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hcenters :
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (hsourceHit :
      Q.source.1 ∈
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support)
    (hotherHit :
      Q.otherOutsidePoint ∈
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support)
    (hpairHit :
      P.source₁ ∈
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support ∨
        P.source₂ ∈
          (H.selectedAt source.1
            source.2).toCriticalFourShell.support) :
    False := by
  have hsourceNeFirst₁ : Q.source.1 ≠ P.source₁ := by
    intro h
    apply Q.source_ne_first₁
    apply Subtype.ext
    exact h
  have hsourceNeFirst₂ : Q.source.1 ≠ P.source₂ := by
    intro h
    apply Q.source_ne_first₂
    apply Subtype.ext
    exact h
  have hotherNeFirst₁ : Q.otherOutsidePoint ≠ P.source₁ := by
    intro h
    apply Q.otherOutsidePoint_not_mem_firstCap
    rw [h]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₁_mem_capInterior
  have hotherNeFirst₂ : Q.otherOutsidePoint ≠ P.source₂ := by
    intro h
    apply Q.otherOutsidePoint_not_mem_firstCap
    rw [h]
    exact S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.source₂_mem_capInterior
  apply false_of_firstFiber_explicit_overlap_card_ge_three
    P Pρ Q source hcenters
  rcases hpairHit with hfirstHit | hsecondHit
  · have hsubset :
        ({P.source₁, Q.source.1, Q.otherOutsidePoint} : Finset ℝ²) ⊆
          ((H.selectedAt source.1
              source.2).toCriticalFourShell.support ∩
            {P.source₁, P.source₂, Q.source.1,
              Q.otherOutsidePoint}) := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr ⟨hfirstHit, by simp⟩
      · exact Finset.mem_inter.mpr ⟨hsourceHit, by simp⟩
      · exact Finset.mem_inter.mpr ⟨hotherHit, by simp⟩
    calc
      3 =
          ({P.source₁, Q.source.1,
            Q.otherOutsidePoint} : Finset ℝ²).card := by
              simp [hsourceNeFirst₁.symm, hotherNeFirst₁.symm,
                Q.otherOutsidePoint_ne_source.symm]
      _ ≤ _ := Finset.card_le_card hsubset
  · have hsubset :
        ({P.source₂, Q.source.1, Q.otherOutsidePoint} : Finset ℝ²) ⊆
          ((H.selectedAt source.1
              source.2).toCriticalFourShell.support ∩
            {P.source₁, P.source₂, Q.source.1,
              Q.otherOutsidePoint}) := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl | rfl
      · exact Finset.mem_inter.mpr ⟨hsecondHit, by simp⟩
      · exact Finset.mem_inter.mpr ⟨hsourceHit, by simp⟩
      · exact Finset.mem_inter.mpr ⟨hotherHit, by simp⟩
    calc
      3 =
          ({P.source₂, Q.source.1,
            Q.otherOutsidePoint} : Finset ℝ²).card := by
              simp [hsourceNeFirst₂.symm, hotherNeFirst₂.symm,
                Q.otherOutsidePoint_ne_source.symm]
      _ ≤ _ := Finset.card_le_card hsubset

/-- Alternative two-hit terminal.  If the cap-source blocker is localized
inside the first cap, then the two named off-cap common hits already violate
ordered-cap uniqueness; no third support hit is needed. -/
theorem false_of_firstFiber_twoOutsideHits_of_capCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsourceCenterCap :
      H.centerAt source.1 source.2 ∈
        S.capByIndex S.oppIndex1)
    (hcenters :
      H.centerAt source.1 source.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (hsourceHit :
      Q.source.1 ∈
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support)
    (hotherHit :
      Q.otherOutsidePoint ∈
        (H.selectedAt source.1
          source.2).toCriticalFourShell.support) :
    False := by
  have hfirstCenterCap :
      H.centerAt P.source₁ P.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.blocker_mem_capInterior
  have hsourceEq :
      dist (H.centerAt source.1 source.2) Q.source.1 =
        dist (H.centerAt source.1 source.2) Q.otherOutsidePoint :=
    ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
      Q.source.1 hsourceHit).trans
      ((H.selectedAt source.1
        source.2).toCriticalFourShell.support_eq_radius
      Q.otherOutsidePoint hotherHit).symm
  have hfirstEq :
      dist (H.centerAt P.source₁ P.source₁_mem_A) Q.source.1 =
        dist (H.centerAt P.source₁ P.source₁_mem_A)
          Q.otherOutsidePoint :=
    ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.source.1 Q.source_mem_shell).trans
      ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.otherOutsidePoint Q.otherOutsidePoint_mem_shell).symm
  exact false_of_two_cap_centers_equidistant_outside_pair
    S S.oppIndex1 hsourceCenterCap hfirstCenterCap hcenters
    Q.source.2 Q.otherOutsidePoint_mem_A
    (Ne.symm Q.otherOutsidePoint_ne_source)
    Q.source_not_mem_firstCap Q.otherOutsidePoint_not_mem_firstCap
    hsourceEq hfirstEq

end ATailFirstFiberOverlapDescent
end Problem97
