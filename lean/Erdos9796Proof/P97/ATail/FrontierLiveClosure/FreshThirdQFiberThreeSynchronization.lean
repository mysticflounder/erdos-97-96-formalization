/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual

/-!
# FreshThird exact-three Q-fiber synchronization

This module isolates the two positive incidence facts that close the
exact-three `Q`-fiber arm of the FreshThird pinned-endpoint residual.  It does
not claim those incidences follow from the current packet.  Instead, it gives
finite theorem-discovery and certificate replay an intrinsic, arbitrary-
cardinality landing target:

* the unique `Q`-row point outside the three-source blocker-fiber image lies
  in the pinned fan row; and
* two distinct points of that blocker-fiber image lie in the pinned fan row.

The final indexed consumer refers only to the four intrinsic fan indices and
the actual blocker fiber.  It does not enumerate the ambient carrier.
-/

namespace Problem97
namespace ATailSurvivalCover

open scoped EuclideanGeometry
open ATailMinimalUniqueFourCover

attribute [local instance] Classical.propDecidable

/-- A three-element actual-blocker fiber occupies exactly the complement of
one selected-row point whose actual blocker differs from the anchor's. -/
theorem actualBlockerFiber_image_eq_selectedSupport_erase_of_card_eq_three
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (anchor missing : CriticalShellSystem.CarrierVertex A)
    (hcard : (actualBlockerFiber H anchor).card = 3)
    (hmissing :
      missing.1 ∈
        (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support)
    (hcenters :
      H.centerAt missing.1 missing.2 ≠ H.centerAt anchor.1 anchor.2) :
    (actualBlockerFiber H anchor).image (fun source ↦ source.1) =
      (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support.erase
        missing.1 := by
  classical
  let points :=
    (actualBlockerFiber H anchor).image (fun source ↦ source.1)
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
    exact hcenters <|
      congrArg Subtype.val (Finset.mem_filter.mp hsourceFiber).2
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
    (actualBlockerFiber H Q.source₁).image (fun source ↦ source.1) =
      (H.selectedAt Q.source₁.1
        Q.source₁.2).toCriticalFourShell.support.erase Boundary.source.1 := by
  exact
    actualBlockerFiber_image_eq_selectedSupport_erase_of_card_eq_three
      H Q.source₁ Boundary.source Boundary.card_eq Boundary.source_mem
        Boundary.centers_ne

/-- A fan index naming the unique nonfiber `Q`-row source proves the first
positive synchronization field required by the exact-three consumer. -/
theorem FreshThirdQFiberThreeBoundary.source_mem_pinnedFan_of_index
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (sourceIndex : Fin 4)
    (hsource : Packet.fan.fan.source sourceIndex = Boundary.source) :
    Boundary.source.1 ∈ Packet.fan.Row.support := by
  have hmem := Packet.fan.fan.source_mem_support sourceIndex
  simpa only [hsource] using hmem

/-- Two distinct indexed fan sources in the actual `Q` blocker fiber prove
the second positive synchronization field required by the exact-three
consumer. -/
theorem FreshThirdQFiberThreeBoundary.two_fiberImage_mem_pinnedFan_of_indices
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    (Q : FreshThirdBlockerFiber P Pρ)
    (_Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (firstIndex secondIndex : Fin 4)
    (hindices : firstIndex ≠ secondIndex)
    (hfirst : Packet.fan.fan.source firstIndex ∈
      actualBlockerFiber H Q.source₁)
    (hsecond : Packet.fan.fan.source secondIndex ∈
      actualBlockerFiber H Q.source₁) :
    2 ≤
      (((actualBlockerFiber H Q.source₁).image fun source ↦ source.1) ∩
        Packet.fan.Row.support).card := by
  let firstPoint := (Packet.fan.fan.source firstIndex).1
  let secondPoint := (Packet.fan.fan.source secondIndex).1
  have hpoints_ne : firstPoint ≠ secondPoint := by
    intro hpoints
    apply hindices
    apply Packet.fan.fan.source_injective
    apply Subtype.ext
    exact hpoints
  have hfirstCommon :
      firstPoint ∈
        ((actualBlockerFiber H Q.source₁).image (fun source ↦ source.1) ∩
          Packet.fan.Row.support) := by
    exact Finset.mem_inter.mpr
      ⟨Finset.mem_image.mpr
          ⟨Packet.fan.fan.source firstIndex, hfirst, rfl⟩,
        Packet.fan.fan.source_mem_support firstIndex⟩
  have hsecondCommon :
      secondPoint ∈
        ((actualBlockerFiber H Q.source₁).image (fun source ↦ source.1) ∩
          Packet.fan.Row.support) := by
    exact Finset.mem_inter.mpr
      ⟨Finset.mem_image.mpr
          ⟨Packet.fan.fan.source secondIndex, hsecond, rfl⟩,
        Packet.fan.fan.source_mem_support secondIndex⟩
  have hpairSubset :
      ({firstPoint, secondPoint} : Finset ℝ²) ⊆
        ((actualBlockerFiber H Q.source₁).image (fun source ↦ source.1) ∩
          Packet.fan.Row.support) := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl
    · exact hfirstCommon
    · exact hsecondCommon
  have hpairCard : ({firstPoint, secondPoint} : Finset ℝ²).card = 2 := by
    rw [Finset.card_insert_of_notMem]
    · simp
    · simpa only [Finset.mem_singleton] using hpoints_ne
  have hcard := Finset.card_le_card hpairSubset
  rwa [hpairCard] at hcard

/-- Exact consumer for the genuinely missing synchronization clause in the
Q-fiber-three arm.  One nonfiber source plus two fiber-image points in the
pinned fan row yield three common `Q`-row points and contradict the existing
distinct-center two-circle bound. -/
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
        (((actualBlockerFiber H Q.source₁).image fun source ↦ source.1) ∩
          Packet.fan.Row.support).card) :
    False := by
  let fiberImage :=
    (actualBlockerFiber H Q.source₁).image (fun source ↦ source.1)
  let common := fiberImage ∩ Packet.fan.Row.support
  have hsource_not_common : Boundary.source.1 ∉ common := by
    intro hmem
    have hsourceImage : Boundary.source.1 ∈ fiberImage :=
      (Finset.mem_inter.mp hmem).1
    have hsourceImage' :
        Boundary.source.1 ∈
          (actualBlockerFiber H Q.source₁).image (fun source ↦ source.1) := by
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
            (actualBlockerFiber H Q.source₁).image (fun source ↦ source.1) := by
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
    exact Nat.add_le_add_right
      (by simpa only [common, fiberImage] using htwo) 1
  exact hthreeInsert.trans (Finset.card_le_card hsubset)

/-- Intrinsic finite synchronization certificate over the four indexed fan
sources.  These are exactly the two missing positive incidence fields; the
packet carries no assertion that such indices exist. -/
structure FreshThirdQFiberThreePinnedFanIndexSynchronization
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap) where
  sourceIndex : Fin 4
  source_eq : Packet.fan.fan.source sourceIndex = Boundary.source
  firstFiberIndex : Fin 4
  secondFiberIndex : Fin 4
  fiberIndices_ne : firstFiberIndex ≠ secondFiberIndex
  first_mem_fiber : Packet.fan.fan.source firstFiberIndex ∈
    actualBlockerFiber H Q.source₁
  second_mem_fiber : Packet.fan.fan.source secondFiberIndex ∈
    actualBlockerFiber H Q.source₁

/-- Replay an intrinsic indexed synchronization certificate through the
exact-three consumer. -/
theorem FreshThirdQFiberThreePinnedFanIndexSynchronization.false
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (Sync : FreshThirdQFiberThreePinnedFanIndexSynchronization
      P Pρ Q Boundary Packet) :
    False := by
  apply Boundary.false_of_pinnedFan_source_and_twoFiberPoints
    (P := P) (Pρ := Pρ) Q Packet
  · exact Boundary.source_mem_pinnedFan_of_index
      (P := P) (Pρ := Pρ) Q Packet Sync.sourceIndex Sync.source_eq
  · exact Boundary.two_fiberImage_mem_pinnedFan_of_indices
      (P := P) (Pρ := Pρ) Q Packet Sync.firstFiberIndex
        Sync.secondFiberIndex Sync.fiberIndices_ne Sync.first_mem_fiber
        Sync.second_mem_fiber

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
