/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

/-!
# Exact semantics of the FreshThird Q-fiber-three boundary

This scratch module isolates the strongest source-clean consequences of the
exact-three actual-blocker-fiber arm.
-/

namespace Problem97
namespace ATailSurvivalCover

open scoped EuclideanGeometry
open ATailMinimalUniqueFourCover

attribute [local instance] Classical.propDecidable

/-- A three-element actual-blocker fiber occupies exactly the complement of
one selected-row point whose actual blocker is different from the anchor's.

This is the exact finite semantics behind the `FreshThirdQFiberThreeBoundary`
arm. -/
theorem actualBlockerFiber_image_eq_selectedSupport_erase_of_card_eq_three
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (anchor missing : CriticalShellSystem.CarrierVertex A)
    (hcard : (actualBlockerFiber H anchor).card = 3)
    (hmissing :
      missing.1 ∈
        (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support)
    (hcenters :
      H.centerAt missing.1 missing.2 ≠ H.centerAt anchor.1 anchor.2) :
    (actualBlockerFiber H anchor).image (fun source => source.1) =
      (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support.erase
        missing.1 := by
  classical
  let points :=
    (actualBlockerFiber H anchor).image (fun source => source.1)
  let support :=
    (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support
  have hpoints_subset : points ⊆ support := by
    intro z hz
    rcases Finset.mem_image.mp hz with ⟨source, hsourceFiber, rfl⟩
    have hblockerVertex := (Finset.mem_filter.mp hsourceFiber).2
    have hcenter :
        H.centerAt source.1 source.2 = H.centerAt anchor.1 anchor.2 :=
      congrArg Subtype.val hblockerVertex
    have hsupport :=
      selectedSupports_eq_of_actualBlockers_eq H source.2 anchor.2 hcenter
    simpa only [support, ← hsupport] using
      (H.selectedAt source.1 source.2).toCriticalFourShell.q_mem_support
  have hmissing_not_mem : missing.1 ∉ points := by
    intro hmem
    rcases Finset.mem_image.mp hmem with ⟨source, hsourceFiber, hsourceValue⟩
    have hsourceEq : source = missing := Subtype.ext hsourceValue
    subst source
    exact hcenters <| congrArg Subtype.val (Finset.mem_filter.mp hsourceFiber).2
  have hsubset_erase : points ⊆ support.erase missing.1 := by
    intro z hz
    exact Finset.mem_erase.mpr ⟨by
      intro hzm
      subst z
      exact hmissing_not_mem hz, hpoints_subset hz⟩
  have hpoints_card : points.card = 3 := by
    calc
      points.card = (actualBlockerFiber H anchor).card :=
        Finset.card_image_of_injective _ Subtype.val_injective
      _ = 3 := hcard
  apply Finset.eq_of_subset_of_card_le hsubset_erase
  rw [Finset.card_erase_of_mem hmissing]
  rw [(H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support_card,
    hpoints_card]

end ATailSurvivalCover

namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry
open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

/-- In the exact-three boundary, the named distinct-blocker source is the
unique point of the exact `Q` row outside the actual-blocker-fiber image. -/
theorem FreshThirdQFiberThreeBoundary.fiberImage_eq_qSupport_erase_source
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q) :
    (actualBlockerFiber H Q.source₁).image (fun source => source.1) =
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support.erase Boundary.source.1 := by
  exact
    actualBlockerFiber_image_eq_selectedSupport_erase_of_card_eq_three
      H Q.source₁ Boundary.source Boundary.card_eq Boundary.source_mem
        Boundary.centers_ne

/-- Every other point of the exact `Q` row has the canonical `Q` actual
blocker.  In particular, the two omission successors retained by the boundary
are not anonymous: their actual blocker is the `Q` center. -/
theorem FreshThirdQFiberThreeBoundary.centerAt_eq_qCenter_of_mem_ne_source
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    {w : ℝ²}
    (hw :
      w ∈
        (H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support)
    (hwne : w ≠ Boundary.source.1) :
    H.centerAt w
        ((H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support_subset_A hw) =
      H.centerAt Q.source₁.1 Q.source₁.2 := by
  let wSource : CriticalShellSystem.CarrierVertex D.A :=
    ⟨w, (H.selectedAt Q.source₁.1
      Q.source₁.2).toCriticalFourShell.support_subset_A hw⟩
  have hwImage :
      w ∈ (actualBlockerFiber H Q.source₁).image (fun source => source.1) := by
    rw [Boundary.fiberImage_eq_qSupport_erase_source (P := P) (Pρ := Pρ) Q]
    exact Finset.mem_erase.mpr ⟨hwne, hw⟩
  rcases Finset.mem_image.mp hwImage with ⟨source, hsourceFiber, hsourceValue⟩
  have hsourceEq : source = wSource := Subtype.ext hsourceValue
  subst source
  exact congrArg Subtype.val (Finset.mem_filter.mp hsourceFiber).2

/-- The two retained omission successors are one-way cross-deletion witnesses:
their own actual blocker is the `Q` center, while deleting them preserves K4
at the boundary source's distinct actual blocker. -/
theorem FreshThirdQFiberThreeBoundary.omissionSuccessor_qCenter_and_survives
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q) :
    ∀ (w : ℝ²)
      (hw : w ∈
        (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support \
            (H.selectedAt Boundary.source.1
              Boundary.source.2).toCriticalFourShell.support),
      H.centerAt w
          ((H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support_subset_A
              (Finset.mem_sdiff.mp hw).1) =
          H.centerAt Q.source₁.1 Q.source₁.2 ∧
        HasNEquidistantPointsAt 4 (D.A.erase w)
          (H.centerAt Boundary.source.1 Boundary.source.2) := by
  intro w hw
  have hsuccessor := Boundary.deletion_successors w hw
  exact
    ⟨Boundary.centerAt_eq_qCenter_of_mem_ne_source
        (P := P) (Pρ := Pρ) Q (Finset.mem_sdiff.mp hw).1 hsuccessor.1,
      hsuccessor.2⟩

/-- The complete pinned packet supplies an upper, not a lower, synchronization
bound: its fan row can meet the exact `Q` row in at most three points.  This is
the only direct consequence of `seed_multiplicity` because the Q row is one
half of the six-point seed. -/
theorem FreshThirdPinnedEndpointOutsideSeedQueryPacket.qRow_inter_fanRow_card_le_three
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) :
    ((H.selectedAt Q.source₁.1
          Q.source₁.2).toCriticalFourShell.support ∩
        Packet.fan.Row.support).card ≤ 3 := by
  have hsubset :
      (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support ∩
          Packet.fan.Row.support ⊆
        SelectedClass D.A center Packet.fan.Row.radius ∩
          freshThirdCrossRowTwoShellSeed P Pρ C.surface Q := by
    intro z hz
    rcases Finset.mem_inter.mp hz with ⟨hzQ, hzRow⟩
    exact Finset.mem_inter.mpr
      ⟨mem_selectedClass.mpr
          ⟨Packet.fan.Row.support_subset_A hzRow,
            Packet.fan.Row.support_eq_radius z hzRow⟩,
        Finset.mem_union.mpr (Or.inr hzQ)⟩
  exact (Finset.card_le_card hsubset).trans
    (Packet.seed_multiplicity Packet.fan.Row.radius Packet.fan.Row.radius_pos)

/-- The unique point of the exact `Q` row outside its three-source blocker
fiber is one of the two fresh-remainder points, not one of the two named
`Q` sources shared with the canonical source row. -/
theorem FreshThirdQFiberThreeBoundary.source_mem_freshRemainder
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) :
    Boundary.source.1 ∈
      freshThirdCrossRowFreshRemainder P Pρ C.surface Q := by
  have hsource_ne₁ : Boundary.source.1 ≠ Q.source₁.1 := by
    intro h
    apply Boundary.centers_ne
    have hsource : Boundary.source = Q.source₁ := Subtype.ext h
    rw [hsource]
  have hsource_ne₂ : Boundary.source.1 ≠ Q.source₂.1 := by
    intro h
    apply Boundary.centers_ne
    have hsource : Boundary.source = Q.source₂ := Subtype.ext h
    rw [hsource]
    exact congrArg Subtype.val Q.blockers_eq.symm
  apply Finset.mem_sdiff.mpr
  refine ⟨Boundary.source_mem, ?_⟩
  intro hsourceCanonical
  have hsourceInter :
      Boundary.source.1 ∈
        (H.selectedAt C.surface.firstSource.1
              C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support :=
    Finset.mem_inter.mpr ⟨hsourceCanonical, Boundary.source_mem⟩
  rw [Packet.seedOverlap] at hsourceInter
  simp only [Finset.mem_insert, Finset.mem_singleton] at hsourceInter
  exact hsourceInter.elim hsource_ne₁ hsource_ne₂

/-- If the pinned robust center is itself one of the two fresh-remainder
points, exact-three saturation leaves only two possibilities: it is the
unique non-Q-blocked boundary source, or its own actual blocker is the `Q`
center.  This still gives no membership in `Packet.fan.Row.support`. -/
theorem FreshThirdQFiberThreeBoundary.pinnedCenter_eq_source_or_qBlocker
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (hcenterFresh :
      center ∈ freshThirdCrossRowFreshRemainder P Pρ C.surface Q) :
    center = Boundary.source.1 ∨
      H.centerAt center Packet.fan.fan.center_mem =
        H.centerAt Q.source₁.1 Q.source₁.2 := by
  by_cases hcenter : center = Boundary.source.1
  · exact Or.inl hcenter
  · right
    have hcenterQ :
        center ∈
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support :=
      (Finset.mem_sdiff.mp hcenterFresh).1
    simpa only using
      Boundary.centerAt_eq_qCenter_of_mem_ne_source
        (P := P) (Pρ := Pρ) Q hcenterQ hcenter

/-- Exact consumer for the genuinely missing synchronization clause in the
Q-fiber-three arm.  It is enough to place the unique nonfiber Q-row source in
the pinned fan row and place any two points of the three-source fiber image in
that row.  The resulting three Q-row incidences close through the existing
two-circle terminal. -/
theorem FreshThirdQFiberThreeBoundary.false_of_pinnedFan_source_and_twoFiberPoints
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (hsourceFan : Boundary.source.1 ∈ Packet.fan.Row.support)
    (htwo :
      2 ≤
        (((actualBlockerFiber H Q.source₁).image fun source => source.1) ∩
          Packet.fan.Row.support).card) :
    False := by
  let fiberImage :=
    (actualBlockerFiber H Q.source₁).image (fun source => source.1)
  let common := fiberImage ∩ Packet.fan.Row.support
  have hsource_not_common : Boundary.source.1 ∉ common := by
    intro hmem
    have hsourceImage : Boundary.source.1 ∈ fiberImage :=
      (Finset.mem_inter.mp hmem).1
    have hsourceImage' :
        Boundary.source.1 ∈
          (actualBlockerFiber H Q.source₁).image (fun source => source.1) := by
      simpa only [fiberImage] using hsourceImage
    rw [Boundary.fiberImage_eq_qSupport_erase_source
      (P := P) (Pρ := Pρ) Q] at hsourceImage'
    exact (Finset.mem_erase.mp hsourceImage').1 rfl
  have hcard_insert :
      (insert Boundary.source.1 common).card = common.card + 1 := by
    rw [Finset.card_insert_of_notMem hsource_not_common]
  have hsubset :
      insert Boundary.source.1 common ⊆
        (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support ∩
          Packet.fan.Row.support := by
    intro z hz
    rcases Finset.mem_insert.mp hz with rfl | hzCommon
    · exact Finset.mem_inter.mpr ⟨Boundary.source_mem, hsourceFan⟩
    · rcases Finset.mem_inter.mp hzCommon with ⟨hzImage, hzFan⟩
      have hzImage' :
          z ∈
            (actualBlockerFiber H Q.source₁).image (fun source => source.1) := by
        simpa only [fiberImage] using hzImage
      have hzQ :
          z ∈
            (H.selectedAt Q.source₁.1
              Q.source₁.2).toCriticalFourShell.support := by
        rw [Boundary.fiberImage_eq_qSupport_erase_source
          (P := P) (Pρ := Pρ) Q] at hzImage'
        exact (Finset.mem_erase.mp hzImage').2
      exact Finset.mem_inter.mpr ⟨hzQ, hzFan⟩
  apply Packet.false_of_qRow_overlap_card_ge_three
  have hthreeInsert : 3 ≤ (insert Boundary.source.1 common).card := by
    rw [hcard_insert]
    exact Nat.add_le_add_right (by simpa only [common, fiberImage] using htwo) 1
  exact hthreeInsert.trans (Finset.card_le_card hsubset)

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure

/- A finite incidence projection witnessing why the exact-three boundary
does not force the pinned fan row to meet the `Q` row.

This is deliberately *not* a geometric `CounterexampleData` realization.  It
models exactly the row/fiber/seed incidences exposed at the current interface:
the Q row has four points, its blocker fiber occupies three, the unique fourth
point has a distinct four-row omitting two Q points, the canonical source and
Q rows form a six-point seed, and the pinned fan row escapes that seed.  The
fan row can nevertheless be disjoint from the Q row. -/
namespace FreshThirdQFiberThreeIncidenceCounterpattern

def qRow : Finset Nat := {0, 1, 2, 3}
def qFiberImage : Finset Nat := {0, 1, 2}
def boundarySource : Nat := 3
def boundarySourceRow : Finset Nat := {2, 3, 4, 5}
def canonicalSourceRow : Finset Nat := {0, 1, 4, 5}
def twoShellSeed : Finset Nat := qRow ∪ canonicalSourceRow
def pinnedFanRow : Finset Nat := {6, 7, 8, 9}
def endpointBoundaryRow : Finset Nat := pinnedFanRow

theorem exact_interface_projection :
    qRow.card = 4 ∧
      qFiberImage.card = 3 ∧
      qFiberImage = qRow.erase boundarySource ∧
      boundarySource ∈ qRow ∧
      boundarySource ∈ boundarySourceRow ∧
      (qRow \ boundarySourceRow).card = 2 ∧
      (qRow ∩ boundarySourceRow).card = 2 ∧
      twoShellSeed.card = 6 ∧
      pinnedFanRow.card = 4 ∧
      (pinnedFanRow ∩ qRow).card = 0 ∧
      (∃ z ∈ pinnedFanRow, z ∉ twoShellSeed) ∧
      (∃ z ∈ endpointBoundaryRow, z ∉ twoShellSeed) := by
  decide

end FreshThirdQFiberThreeIncidenceCounterpattern
end Problem97
