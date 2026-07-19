/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LocalizedCollisionMutualOmissionCycle
import Erdos9796Proof.P97.Dumitrescu.L7

/-!
# Off-first-cap localization for a localized collision cycle

The actual blocker of the fresh strict-first-cap source is a carrier point.
If it is outside the first opposite closed cap, it cannot be a Moser vertex:
the two endpoints belong to that cap, while the opposite vertex is the first
physical apex and is excluded by source criticality.  Hence it lies in the
strict interior of either the surplus cap or the second opposite cap.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCollisionOffCapLocalizationScratch

open ATailCriticalPairFrontier
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- Exact location of the fresh source's actual blocker on the arm where it
is outside the first opposite closed cap. -/
inductive FreshBlockerOffFirstCapLocation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    (L : LocalizedCollisionCommonDeletion P) : Type
  | surplusInterior
      (blocker_mem :
        H.centerAt L.fresh L.packet.q_mem_A ∈
          S.capInteriorByIndex S.surplusIdx)
  | secondOppositeInterior
      (blocker_mem :
        H.centerAt L.fresh L.packet.q_mem_A ∈
          S.capInteriorByIndex S.oppIndex2)

/-- The off-first-cap blocker lies in one of the other two strict cap
interiors.  No cardinality or selected-row abstraction is used. -/
theorem nonempty_freshBlockerOffFirstCapLocation
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    (L : LocalizedCollisionCommonDeletion P)
    (hblockerOff :
      H.centerAt L.fresh L.packet.q_mem_A ∉
        S.capByIndex S.oppIndex1) :
    Nonempty (FreshBlockerOffFirstCapLocation L) := by
  let blocker := H.centerAt L.fresh L.packet.q_mem_A
  have hblockerA : blocker ∈ D.A := by
    simpa only [blocker, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨L.fresh, L.packet.q_mem_A⟩).2
  have hblockerNotTriangle : blocker ∉ S.triangle.verts := by
    intro htriangle
    rcases S.mem_triangle_verts_oppositeVertexByIndex_cases htriangle with
      hsurplus | hfirst | hsecond
    · apply hblockerOff
      change blocker ∈ S.capByIndex S.oppIndex1
      rw [hsurplus,
        ← S.leftOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_surplusIdx]
      exact S.leftOuterVertexByIndex_mem_capByIndex S.oppIndex1
    · apply L.packet.actual_blocker_ne_center₁
      simpa only [blocker, oppApex1_eq_oppositeVertexByIndex_oppIndex1 S]
        using hfirst
    · apply hblockerOff
      change blocker ∈ S.capByIndex S.oppIndex1
      rw [hsecond,
        ← S.rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2]
      exact S.rightOuterVertexByIndex_mem_capByIndex S.oppIndex1
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hblockerA with
    htriangle | ⟨i, hblockerInterior⟩
  · exact False.elim (hblockerNotTriangle htriangle)
  · rcases S.index_eq_surplusIdx_or_oppIndex1_or_oppIndex2 i with
      hisurplus | hifirst | hisecond
    · exact ⟨FreshBlockerOffFirstCapLocation.surplusInterior
        (by simpa only [blocker, hisurplus] using hblockerInterior)⟩
    · apply False.elim
      apply hblockerOff
      change blocker ∈ S.capByIndex S.oppIndex1
      simpa only [hifirst] using
        S.capInteriorByIndex_subset_capByIndex i hblockerInterior
    · exact ⟨FreshBlockerOffFirstCapLocation.secondOppositeInterior
        (by simpa only [blocker, hisecond] using hblockerInterior)⟩

/-- Full off-cap localization packet, including the resulting cross-cap edge
between the fresh source and its actual blocker.  Dumitrescu's existing
consumer only classifies this edge as non-witness; it does not yield `False`.
-/
structure FreshBlockerOffFirstCapCrossCapPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    (L : LocalizedCollisionCommonDeletion P) : Type where
  location : FreshBlockerOffFirstCapLocation L
  crossCapEdge :
    Dumitrescu.IsCrossCapEdge S.partition
      ({L.fresh, H.centerAt L.fresh L.packet.q_mem_A} : Finset ℝ²)

private theorem crossCapEdge_of_location
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    (L : LocalizedCollisionCommonDeletion P)
    (location : FreshBlockerOffFirstCapLocation L) :
    Dumitrescu.IsCrossCapEdge S.partition
      ({L.fresh, H.centerAt L.fresh L.packet.q_mem_A} : Finset ℝ²) := by
  let blocker := H.centerAt L.fresh L.packet.q_mem_A
  have hfreshA : L.fresh ∈ D.A := L.packet.q_mem_A
  have hblockerA : blocker ∈ D.A := by
    simpa only [blocker, CriticalShellSystem.blockerVertex] using
      (H.blockerVertex ⟨L.fresh, L.packet.q_mem_A⟩).2
  have hfreshNeBlocker : L.fresh ≠ blocker := by
    intro h
    apply (H.selectedAt L.fresh
      L.packet.q_mem_A).toCriticalFourShell.center_not_mem_support
    change blocker ∈
      (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support
    rw [← h]
    exact (H.selectedAt L.fresh
      L.packet.q_mem_A).toCriticalFourShell.q_mem_support
  have hnoShared : ∀ k : Fin 3,
      ¬ (L.fresh ∈ S.capByIndex k ∧ blocker ∈ S.capByIndex k) := by
    intro k hk
    cases location with
    | surplusInterior hblockerI =>
        by_cases hkFirst : k = S.oppIndex1
        · subst k
          exact (S.capInteriorByIndex_not_mem_capByIndex_of_ne
            hblockerI S.surplusIdx_ne_oppIndex1) hk.2
        · exact (S.capInteriorByIndex_not_mem_capByIndex_of_ne
            L.fresh_mem_capInterior (Ne.symm hkFirst)) hk.1
    | secondOppositeInterior hblockerI =>
        by_cases hkFirst : k = S.oppIndex1
        · subst k
          exact (S.capInteriorByIndex_not_mem_capByIndex_of_ne
            hblockerI S.oppIndex1_ne_oppIndex2.symm) hk.2
        · exact (S.capInteriorByIndex_not_mem_capByIndex_of_ne
            L.fresh_mem_capInterior (Ne.symm hkFirst)) hk.1
  apply Dumitrescu.isCrossCapEdge_of_no_shared_cap S.partition
    hfreshA hblockerA hfreshNeBlocker
  refine ⟨?_, ?_, ?_⟩
  · simpa only [SurplusCapPacket.capByIndex] using hnoShared 0
  · simpa only [SurplusCapPacket.capByIndex] using hnoShared 1
  · simpa only [SurplusCapPacket.capByIndex] using hnoShared 2

/-- Assemble the exact cap location and the cross-cap classification. -/
theorem nonempty_freshBlockerOffFirstCapCrossCapPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    (L : LocalizedCollisionCommonDeletion P)
    (hblockerOff :
      H.centerAt L.fresh L.packet.q_mem_A ∉
        S.capByIndex S.oppIndex1) :
    Nonempty (FreshBlockerOffFirstCapCrossCapPacket L) := by
  rcases nonempty_freshBlockerOffFirstCapLocation L hblockerOff with
    ⟨location⟩
  exact ⟨⟨location, crossCapEdge_of_location L location⟩⟩

/-- U5-facing form of the off-cap collision cycle.  Take the collision source
as `q`.  Its retained first-apex radius gives the dangerous triple, its own
actual shell gives the q-critical row, and the mutual-omission packet gives
q-deleted rows at the first apex and at the fresh source's actual blocker.
The exact off-cap location is retained rather than erased. -/
structure FreshBlockerOffFirstCapU5Ingress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    (C : LocalizedCollisionMutualOmissionCycle P L) : Type where
  location : FreshBlockerOffFirstCapLocation L
  collisionSource_mem_radius :
    C.collisionSource ∈ SelectedClass D.A S.oppApex1 radius
  otherCollisionSource : ℝ²
  otherCollisionSource_ne : otherCollisionSource ≠ C.collisionSource
  otherCollisionSource_mem_radius :
    otherCollisionSource ∈ SelectedClass D.A S.oppApex1 radius
  T : Finset ℝ²
  otherCollisionSource_mem_T : otherCollisionSource ∈ T
  dangerous : U5DangerousTriple D C.collisionSource S.oppApex1 T
  firstApexDeleted :
    U5QDeletedK4Class D C.collisionSource S.oppApex1
      C.collisionSourcePacket.B₁
  freshBlockerDeleted :
    U5QDeletedK4Class D C.collisionSource
      (H.centerAt L.fresh L.packet.q_mem_A)
      C.collisionSourcePacket.B₂
  freshActualDeleted :
    U5QDeletedK4Class D C.collisionSource
      (H.centerAt L.fresh L.packet.q_mem_A)
      (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support
  fresh_mem_freshActualDeleted :
    L.fresh ∈
      (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support
  actualCritical :
    U5QCriticalTripleClass D C.collisionSource
      (H.centerAt C.collisionSource C.collisionSource_mem_A)
      ((H.selectedAt C.collisionSource
        C.collisionSource_mem_A).toCriticalFourShell.support.erase
          C.collisionSource)
  otherCollisionSource_mem_actualCritical :
    otherCollisionSource ∈
      (H.selectedAt C.collisionSource
        C.collisionSource_mem_A).toCriticalFourShell.support.erase
          C.collisionSource

private theorem collisionSource_mem_radius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    (C : LocalizedCollisionMutualOmissionCycle P L) :
    C.collisionSource ∈ SelectedClass D.A S.oppApex1 radius := by
  rcases C.collisionSource_eq with h | h
  · simpa only [h] using P.source₁_mem_radius
  · simpa only [h] using P.source₂_mem_radius

private def transportSelectedFourClass
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass A center₂ :=
  Eq.mp (congrArg (SelectedFourClass A) hcenter) K

@[simp] private theorem transportSelectedFourClass_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    (transportSelectedFourClass K hcenter).support = K.support := by
  cases hcenter
  rfl

private theorem criticalSupports_eq_of_centers_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {q r : ℝ²} (hq : q ∈ A) (hr : r ∈ A)
    (hcenters : H.centerAt q hq = H.centerAt r hr) :
    (H.selectedAt q hq).toCriticalFourShell.support =
      (H.selectedAt r hr).toCriticalFourShell.support := by
  let Kr : SelectedFourClass A (H.centerAt q hq) :=
    transportSelectedFourClass
      (H.selectedAt r hr).toSelectedFourClass hcenters.symm
  calc
    (H.selectedAt q hq).toCriticalFourShell.support = Kr.support :=
      (H.selectedFourClass_support_eq_shell q hq Kr).symm
    _ = (H.selectedAt r hr).toCriticalFourShell.support := by
      simp [Kr, CriticalSelectedFourClass.toSelectedFourClass,
        CriticalFourShell.toSelectedFourClass]

private noncomputable def collisionSource_actualCritical
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    (C : LocalizedCollisionMutualOmissionCycle P L) :
    U5QCriticalTripleClass D C.collisionSource
      (H.centerAt C.collisionSource C.collisionSource_mem_A)
      ((H.selectedAt C.collisionSource
        C.collisionSource_mem_A).toCriticalFourShell.support.erase
          C.collisionSource) := by
  let K := (H.selectedAt C.collisionSource
    C.collisionSource_mem_A).toCriticalFourShell
  have hqK : C.collisionSource ∈ K.support := K.q_mem_support
  refine {
    subset := ?_
    card_three := ?_
    q_radius_pos := ?_
    same_q_radius := ?_ }
  · intro y hy
    rcases Finset.mem_erase.mp hy with ⟨hyNeQ, hyK⟩
    change y ∈ (D.A.erase C.collisionSource).erase
      (H.centerAt C.collisionSource C.collisionSource_mem_A)
    exact Finset.mem_erase.mpr
      ⟨fun hyCenter ↦ K.center_not_mem_support (hyCenter ▸ hyK),
        Finset.mem_erase.mpr ⟨hyNeQ, K.support_subset_A hyK⟩⟩
  · rw [Finset.card_erase_of_mem hqK, K.support_card]
  · have hqRadius := K.support_eq_radius C.collisionSource hqK
    simpa only [hqRadius] using K.radius_pos
  · intro y hy
    have hyK : y ∈ K.support := (Finset.mem_erase.mp hy).2
    exact (K.support_eq_radius y hyK).trans
      (K.support_eq_radius C.collisionSource hqK).symm

private noncomputable def fresh_actualDeleted
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    (C : LocalizedCollisionMutualOmissionCycle P L) :
    U5QDeletedK4Class D C.collisionSource
      (H.centerAt L.fresh L.packet.q_mem_A)
      (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.support := by
  let K := (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell
  refine {
    subset := ?_
    card_four := by rw [K.support_card]
    q_not_mem := C.collisionSource_not_mem_fresh_shell
    radius := K.radius
    radius_pos := K.radius_pos
    same_radius := K.support_eq_radius }
  intro y hy
  change y ∈ (D.A.erase C.collisionSource).erase
    (H.centerAt L.fresh L.packet.q_mem_A)
  exact Finset.mem_erase.mpr
    ⟨fun hyCenter ↦ K.center_not_mem_support (hyCenter ▸ hy),
      Finset.mem_erase.mpr
        ⟨fun hySource ↦ C.collisionSource_not_mem_fresh_shell
          (hySource ▸ hy),
          K.support_subset_A hy⟩⟩

/-- Construct the exact U5 row ingress on the off-first-cap arm.  This is a
producer, not a contradiction: the current U5 bank still needs a row-support
incidence schema connecting these three concrete rows. -/
theorem nonempty_freshBlockerOffFirstCapU5Ingress
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    (C : LocalizedCollisionMutualOmissionCycle P L)
    (hblockerOff :
      H.centerAt L.fresh L.packet.q_mem_A ∉
        S.capByIndex S.oppIndex1) :
    Nonempty (FreshBlockerOffFirstCapU5Ingress C) := by
  classical
  rcases nonempty_freshBlockerOffFirstCapLocation L hblockerOff with
    ⟨location⟩
  let q := C.collisionSource
  let RadiusClass := SelectedClass D.A S.oppApex1 radius
  have hqRadius : q ∈ RadiusClass := by
    simpa only [q, RadiusClass] using collisionSource_mem_radius C
  have hcollisionSupportEq :
      (H.selectedAt C.collisionSource
          C.collisionSource_mem_A).toCriticalFourShell.support =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    criticalSupports_eq_of_centers_eq H C.collisionSource_mem_A
      P.source₁_mem_A C.collisionSource_blocker_eq_commonBlocker
  obtain ⟨other, hotherNe, hotherRadius, hotherSupport⟩ :
      ∃ other : ℝ²,
        other ≠ q ∧ other ∈ RadiusClass ∧
          other ∈
            (H.selectedAt C.collisionSource
              C.collisionSource_mem_A).toCriticalFourShell.support := by
    rcases C.collisionSource_eq with hqSource₁ | hqSource₂
    · refine ⟨P.source₂, ?_, ?_, ?_⟩
      · simpa only [q, hqSource₁] using P.sources_ne.symm
      · simpa only [RadiusClass] using P.source₂_mem_radius
      · rw [hcollisionSupportEq]
        exact P.source₂_mem_source₁_shell
    · refine ⟨P.source₁, ?_, ?_, ?_⟩
      · simpa only [q, hqSource₂] using P.sources_ne
      · simpa only [RadiusClass] using P.source₁_mem_radius
      · rw [hcollisionSupportEq]
        exact (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.q_mem_support
  have hqNeFirst : q ≠ S.oppApex1 := by
    have hqInterior := C.collisionSource_mem_capInterior
    have hqNeOpposite :=
      S.capInteriorByIndex_ne_oppositeVertexByIndex hqInterior
    simpa only [q, ← oppApex1_eq_oppositeVertexByIndex_oppIndex1 S]
      using hqNeOpposite
  have hthree : 3 ≤ (RadiusClass.erase q).card := by
    rw [Finset.card_erase_of_mem hqRadius]
    have hfour : 4 ≤ RadiusClass.card := by
      simpa only [RadiusClass] using R.frontierRadius_class_card_ge_four
    omega
  have hotherErase : other ∈ RadiusClass.erase q :=
    Finset.mem_erase.mpr ⟨hotherNe, hotherRadius⟩
  let Rest := (RadiusClass.erase q).erase other
  have htwoRest : 2 ≤ Rest.card := by
    change 2 ≤ ((RadiusClass.erase q).erase other).card
    rw [Finset.card_erase_of_mem hotherErase]
    omega
  rcases Finset.exists_subset_card_eq (s := Rest) htwoRest with
    ⟨U, hUsub, hUcard⟩
  let T := insert other U
  have hotherNotU : other ∉ U := by
    intro hotherU
    exact (Finset.mem_erase.mp (hUsub hotherU)).1 rfl
  have hotherT : other ∈ T := Finset.mem_insert_self _ _
  have hTcard : T.card = 3 := by
    change (insert other U).card = 3
    rw [Finset.card_insert_of_notMem hotherNotU, hUcard]
  have hTsub : T ⊆ RadiusClass.erase q := by
    intro y hy
    rcases Finset.mem_insert.mp hy with rfl | hyU
    · exact hotherErase
    · exact Finset.mem_of_mem_erase (hUsub hyU)
  have hTsubA : T ⊆ D.A := by
    intro y hy
    exact (mem_selectedClass.mp
      (Finset.mem_erase.mp (hTsub hy)).2).1
  have hTnoncollinear : ¬ Collinear ℝ (T : Set ℝ²) :=
    (D.convex.mono hTsubA).not_collinear_of_card_ge_three (by omega)
  have hTsubSkeleton :
      T ⊆ (D.skeleton q).erase S.oppApex1 := by
    intro y hy
    have hyErase := Finset.mem_erase.mp (hTsub hy)
    have hyClass := mem_selectedClass.mp hyErase.2
    have hyNeFirst : y ≠ S.oppApex1 := by
      intro h
      have hzero := hyClass.2
      rw [h, dist_self] at hzero
      have hqPos : 0 < dist S.oppApex1 q := dist_pos.mpr hqNeFirst.symm
      have hqDist : dist S.oppApex1 q = radius :=
        (mem_selectedClass.mp hqRadius).2
      rw [hqDist] at hqPos
      linarith
    change y ∈ (D.A.erase q).erase S.oppApex1
    exact Finset.mem_erase.mpr
      ⟨hyNeFirst, Finset.mem_erase.mpr ⟨hyErase.1, hyClass.1⟩⟩
  let dangerous : U5DangerousTriple D q S.oppApex1 T := {
    q_mem := C.collisionSource_mem_A
    p_mem := C.collisionSourcePacket.center₁_mem_A
    p_ne_q := hqNeFirst.symm
    T_subset := hTsubSkeleton
    T_card := hTcard
    T_noncollinear := hTnoncollinear
    q_radius_pos := dist_pos.mpr hqNeFirst.symm
    T_same_radius := by
      intro y hy
      have hyClass := mem_selectedClass.mp
        (Finset.mem_erase.mp (hTsub hy)).2
      exact hyClass.2.trans (mem_selectedClass.mp hqRadius).2.symm }
  exact ⟨{
    location := location
    collisionSource_mem_radius := collisionSource_mem_radius C
    otherCollisionSource := other
    otherCollisionSource_ne := by simpa only [q] using hotherNe
    otherCollisionSource_mem_radius := by
      simpa only [RadiusClass] using hotherRadius
    T := T
    otherCollisionSource_mem_T := hotherT
    dangerous := by simpa only [q] using dangerous
    firstApexDeleted := C.collisionSourcePacket.row₁
    freshBlockerDeleted := C.collisionSourcePacket.row₂
    freshActualDeleted := fresh_actualDeleted C
    fresh_mem_freshActualDeleted :=
      (H.selectedAt L.fresh L.packet.q_mem_A).toCriticalFourShell.q_mem_support
    actualCritical := collisionSource_actualCritical C
    otherCollisionSource_mem_actualCritical :=
      Finset.mem_erase.mpr ⟨by simpa only [q] using hotherNe, hotherSupport⟩ }⟩

namespace FreshBlockerOffFirstCapU5Ingress

/-- The one dangerous point deliberately placed in the collision source's
actual q-critical row is the only dangerous point that row can contain.  Thus
the closest generic U5 two-triple-point contradiction cannot fire a second
time on this row. -/
theorem otherCollisionSource_unique_in_actualCritical
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (I : FreshBlockerOffFirstCapU5Ingress C)
    {t : ℝ²} (htT : t ∈ I.T) (hotherNeT : I.otherCollisionSource ≠ t) :
    t ∉
      (H.selectedAt C.collisionSource
        C.collisionSource_mem_A).toCriticalFourShell.support.erase
          C.collisionSource := by
  intro htCritical
  have hcenterNeFirst :
      H.centerAt C.collisionSource C.collisionSource_mem_A ≠
        S.oppApex1 := by
    intro hcenter
    apply R.actualBlocker_ne_firstApex P.source₁ P.source₁_mem_A
    exact C.collisionSource_blocker_eq_commonBlocker.symm.trans hcenter
  exact U5QCriticalTripleClass.two_triple_points_incompatibility
    I.dangerous I.actualCritical hcenterNeFirst
    I.otherCollisionSource_mem_T htT hotherNeT
    I.otherCollisionSource_mem_actualCritical htCritical

/-- The fresh source's actual q-deleted row meets the dangerous first-apex
circle in at most two points.  This is the exact current bank boundary: an
additional incidence producer is needed to identify which two points occur.
-/
theorem freshActualDeleted_inter_dangerousCircle_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {P : RetainedInteriorBlockerCollision R}
    {L : LocalizedCollisionCommonDeletion P}
    {C : LocalizedCollisionMutualOmissionCycle P L}
    (I : FreshBlockerOffFirstCapU5Ingress C) :
    ((H.selectedAt L.fresh
        L.packet.q_mem_A).toCriticalFourShell.support ∩
      insert C.collisionSource I.T).card ≤ 2 := by
  exact U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two
    I.dangerous I.freshActualDeleted L.packet.actual_blocker_ne_center₁

end FreshBlockerOffFirstCapU5Ingress

#print axioms FreshBlockerOffFirstCapLocation
#print axioms nonempty_freshBlockerOffFirstCapLocation
#print axioms FreshBlockerOffFirstCapCrossCapPacket
#print axioms nonempty_freshBlockerOffFirstCapCrossCapPacket
#print axioms FreshBlockerOffFirstCapU5Ingress
#print axioms nonempty_freshBlockerOffFirstCapU5Ingress
#print axioms FreshBlockerOffFirstCapU5Ingress.otherCollisionSource_unique_in_actualCritical
#print axioms FreshBlockerOffFirstCapU5Ingress.freshActualDeleted_inter_dangerousCircle_card_le_two

end ATailCollisionOffCapLocalizationScratch
end Problem97
