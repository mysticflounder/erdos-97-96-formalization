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

/-- The unique nonfiber point is one of the exact two fresh-remainder points,
not either of the two named `Q` sources shared with the canonical source row. -/
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

/-- Every other point of the exact `Q` row has actual blocker the common `Q`
center. -/
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
      w ∈ (actualBlockerFiber H Q.source₁).image (fun source ↦ source.1) := by
    rw [Boundary.fiberImage_eq_qSupport_erase_source (P := P) (Pρ := Pρ) Q]
    exact Finset.mem_erase.mpr ⟨hwne, hw⟩
  rcases Finset.mem_image.mp hwImage with ⟨source, hsourceFiber, hsourceValue⟩
  have hsourceEq : source = wSource := Subtype.ext hsourceValue
  subst source
  exact congrArg Subtype.val (Finset.mem_filter.mp hsourceFiber).2

/-- The two retained omission successors have the common `Q` actual blocker,
while deleting either one preserves a four-point class at the boundary
source's distinct blocker. -/
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

/-- If the pinned center is one of the two fresh-remainder points, exact-three
saturation makes it either the unique nonfiber boundary source or a source
whose actual blocker is the common `Q` center. -/
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

/-
## Intrinsic finite-query ingress

The base pinned-endpoint finite theory already names the four exact slots of
the `Q` row and the four indexed fan sources.  The exact-three boundary adds
one further piece of source data: one `Q`-row slot is the distinct-blocker
boundary source, while each of the other three slots has actual blocker the
common `Q` center.  The following packet records exactly the consequences of
that partition that are visible in the existing finite vocabulary.

It deliberately does not assert that any `Q`-row slot lies in the fan row.
That positive synchronization remains the theorem-discovery target.
-/

/-- The role naming slot `i` of the exact `Q` row in the pinned-endpoint
finite vocabulary. -/
abbrev freshThirdQFiberThreeFreshSlot
    (i : Fin 4) : FreshThirdPinnedEndpointOutsideSeedPointRole :=
  freshThirdPinnedEndpointOutsideSeedRowSlot .fresh i

/-- Packet-independent exact-three `Q`-fiber constraints visible to the
intrinsic finite query.

If a nonboundary `Q`-row slot aliases a fan source, that fan source's actual
blocker is the common `Q` center.  If the boundary slot aliases a fan source,
its actual blocker differs from the common `Q` center.  No ambient carrier is
enumerated. -/
def FreshThirdQFiberThreeFiniteBoundaryConstraint
    (Config : FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration) : Prop :=
  ∃ boundarySlot : Fin 4,
  (boundarySlot = 2 ∨ boundarySlot = 3) ∧
  (∀ (fanIndex freshSlot : Fin 4),
    freshSlot ≠ boundarySlot →
    Config.assignment.Same (.fanSource fanIndex)
      (freshThirdQFiberThreeFreshSlot freshSlot) →
    Config.assignment.Same (.blockerCenter fanIndex) .freshCenter) ∧
  (∀ fanIndex : Fin 4,
    Config.assignment.Same (.fanSource fanIndex)
      (freshThirdQFiberThreeFreshSlot boundarySlot) →
    ¬ Config.assignment.Same (.blockerCenter fanIndex) .freshCenter)

/-- Exact two-circle overlap law for every pair of selected rows visible in
the intrinsic finite query.  This is independent of the exact-three arm, but
is kept beside its query extension because it is the geometric consumer of
the sought fan/`Q` synchronization. -/
def FreshThirdVisibleRowGeometryConstraint
    (Config : FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration) : Prop :=
  ∀ left right : FreshThirdPinnedEndpointOutsideSeedRowRole,
    ¬ Config.assignment.Same
      (freshThirdPinnedEndpointOutsideSeedRowCenter left)
      (freshThirdPinnedEndpointOutsideSeedRowCenter right) →
    FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowOverlapCount
      Config.assignment left right ≤ 2

/-- Strict betweenness in the finite boundary order. -/
def freshThirdFiniteBetween
    (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (first second point : FreshThirdPinnedEndpointOutsideSeedPointRole) : Prop :=
  (A.Before first point ∧ A.Before point second) ∨
    (A.Before second point ∧ A.Before point first)

instance freshThirdFiniteBetweenDecidable
    (A : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment)
    (first second point : FreshThirdPinnedEndpointOutsideSeedPointRole) :
    Decidable (freshThirdFiniteBetween A first second point) := by
  unfold freshThirdFiniteBetween
  infer_instance

/-- Every pair of distinct-center visible rows separates any two shared
points in the convex boundary order. -/
def FreshThirdVisibleRowSharedPairSeparationConstraint
    (Config : FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration) : Prop :=
  ∀ (left right : FreshThirdPinnedEndpointOutsideSeedRowRole) (i j : Fin 4),
    ¬ Config.assignment.Same
      (freshThirdPinnedEndpointOutsideSeedRowCenter left)
      (freshThirdPinnedEndpointOutsideSeedRowCenter right) →
    i ≠ j →
    Config.assignment.Incident
      (freshThirdPinnedEndpointOutsideSeedRowSlot left i) right →
    Config.assignment.Incident
      (freshThirdPinnedEndpointOutsideSeedRowSlot left j) right →
    (freshThirdFiniteBetween Config.assignment
        (freshThirdPinnedEndpointOutsideSeedRowCenter left)
        (freshThirdPinnedEndpointOutsideSeedRowCenter right)
        (freshThirdPinnedEndpointOutsideSeedRowSlot left i) ↔
      ¬ freshThirdFiniteBetween Config.assignment
        (freshThirdPinnedEndpointOutsideSeedRowCenter left)
        (freshThirdPinnedEndpointOutsideSeedRowCenter right)
        (freshThirdPinnedEndpointOutsideSeedRowSlot left j))

/-- Every exact packet view satisfies the visible-row two-circle overlap
law.  The proof uses the actual selected four-classes, not a Boolean axiom. -/
theorem FreshThirdVisibleRowGeometryConstraint.ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdVisibleRowGeometryConstraint
      (FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View) := by
  intro left right hcenters
  have hcenters' :
      FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
          (freshThirdPinnedEndpointOutsideSeedRowCenter left) ≠
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
          (freshThirdPinnedEndpointOutsideSeedRowCenter right) := by
    intro heq
    apply hcenters
    exact
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).2 heq
  change FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowOverlapCount
    (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.ofView P Pρ View)
      left right ≤ 2
  rw [FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.rowOverlapCount_ofView_eq
    (P := P) (Pρ := Pρ) View]
  rw [← FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass_support_eq_rowSupport
    (P := P) (Pρ := Pρ) View left]
  rw [← FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass_support_eq_rowSupport
    (P := P) (Pρ := Pρ) View right]
  exact SelectedFourClass.inter_card_le_two
    (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass P Pρ View left)
    (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass P Pρ View right)
    hcenters'

/-- Source replay for the visible-row shared-pair separation constraints. -/
theorem FreshThirdVisibleRowSharedPairSeparationConstraint.ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdVisibleRowSharedPairSeparationConstraint
      (FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View) := by
  intro left right i j hcenters hij hiRight hjRight
  let leftCenter :=
    FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
      (freshThirdPinnedEndpointOutsideSeedRowCenter left)
  let rightCenter :=
    FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
      (freshThirdPinnedEndpointOutsideSeedRowCenter right)
  let firstPoint :=
    FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
      (freshThirdPinnedEndpointOutsideSeedRowSlot left i)
  let secondPoint :=
    FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
      (freshThirdPinnedEndpointOutsideSeedRowSlot left j)
  have hcenters' : leftCenter ≠ rightCenter := by
    intro heq
    apply hcenters
    exact
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).2 heq
  have hpoints' : firstPoint ≠ secondPoint := by
    intro heq
    apply hij
    exact FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSlot_point_injective
      (P := P) (Pρ := Pρ) View left heq
  have hfirstLeft : firstPoint ∈
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass
        P Pρ View left).support := by
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass_support_eq_rowSupport,
      FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image]
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩
  have hsecondLeft : secondPoint ∈
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass
        P Pρ View left).support := by
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass_support_eq_rowSupport,
      FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image]
    exact Finset.mem_image.mpr ⟨j, Finset.mem_univ _, rfl⟩
  have hfirstRight : firstPoint ∈
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass
        P Pρ View right).support := by
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass_support_eq_rowSupport]
    exact
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.incident_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).1 hiRight
  have hsecondRight : secondPoint ∈
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass
        P Pρ View right).support := by
    rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass_support_eq_rowSupport]
    exact
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.incident_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).1 hjRight
  have hseparated :=
    selectedFourClass_sharedPairCyclicSeparation_atBoundary
      (D := D) B
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.point_mem_carrier
        (P := P) (Pρ := Pρ) View _)
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.point_mem_carrier
        (P := P) (Pρ := Pρ) View _)
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.point_mem_carrier
        (P := P) (Pρ := Pρ) View _)
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.point_mem_carrier
        (P := P) (Pρ := Pρ) View _)
      hcenters' hpoints'
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass P Pρ View left)
      (FreshThirdPinnedEndpointOutsideSeedFiniteView.rowClass P Pρ View right)
      hfirstLeft hsecondLeft hfirstRight hsecondRight
  simpa [freshThirdFiniteBetween,
    FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
    FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.before_ofView_iff,
    FreshThirdPinnedEndpointOutsideSeedFiniteView.Before,
    FreshThirdPinnedEndpointOutsideSeedFiniteView.boundaryPosition,
    SurplusCOMPGBank.btw, leftCenter, rightCenter, firstPoint, secondPoint] using
      hseparated

/-- Transport the source-level exact-three boundary into the existing
packet-independent finite vocabulary.

The chosen boundary slot comes from the exact four-slot enumeration of the
actual `Q` row.  The blocker equalities are recovered from the actual blocker
fiber; they are not guessed Boolean clauses. -/
theorem FreshThirdQFiberThreeFiniteBoundaryConstraint.ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet) :
    FreshThirdQFiberThreeFiniteBoundaryConstraint
      (FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View) := by
  classical
  let freshPoint : Fin 4 → ℝ² := fun i ↦
    FreshThirdPinnedEndpointOutsideSeedFiniteView.point P Pρ View
      (freshThirdQFiberThreeFreshSlot i)
  have hsourceInRow :
      Boundary.source.1 ∈
        FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport P Pρ View .fresh := by
    simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using
      Boundary.source_mem
  rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image
    (P := P) (Pρ := Pρ) View .fresh] at hsourceInRow
  rcases Finset.mem_image.mp hsourceInRow with
    ⟨boundarySlot, _, hboundarySlot⟩
  have hboundarySlot' : freshPoint boundarySlot = Boundary.source.1 := by
    simpa [freshPoint] using hboundarySlot
  have hboundaryRemainder : boundarySlot = 2 ∨ boundarySlot = 3 := by
    fin_cases boundarySlot
    · exfalso
      apply Boundary.centers_ne
      have hsource : Boundary.source = Q.source₁ := by
        apply Subtype.ext
        simpa [freshPoint, freshThirdQFiberThreeFreshSlot,
          freshThirdPinnedEndpointOutsideSeedRowSlot,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
            hboundarySlot'.symm
      rw [hsource]
    · exfalso
      apply Boundary.centers_ne
      have hsource : Boundary.source = Q.source₂ := by
        apply Subtype.ext
        simpa [freshPoint, freshThirdQFiberThreeFreshSlot,
          freshThirdPinnedEndpointOutsideSeedRowSlot,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
            hboundarySlot'.symm
      rw [hsource]
      exact congrArg Subtype.val Q.blockers_eq.symm
    · exact Or.inl rfl
    · exact Or.inr rfl
  refine ⟨boundarySlot, hboundaryRemainder, ?_, ?_⟩
  · intro fanIndex freshSlot hfreshSlot hfanAlias
    apply
      (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).2
    have hfanAlias' :
        (Packet.fan.fan.source fanIndex).1 = freshPoint freshSlot := by
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point, freshPoint] using
          (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
            (P := P) (Pρ := Pρ) View _ _).1 hfanAlias
    have hfreshNe : freshPoint freshSlot ≠ Boundary.source.1 := by
      intro hsame
      apply hfreshSlot
      apply FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSlot_point_injective
        (P := P) (Pρ := Pρ) View .fresh
      exact hsame.trans hboundarySlot'.symm
    have hfreshMem :
        freshPoint freshSlot ∈
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.support := by
      have hmem :
          freshPoint freshSlot ∈
            FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport
              P Pρ View .fresh := by
        rw [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport_eq_slot_image
          (P := P) (Pρ := Pρ) View .fresh]
        exact Finset.mem_image.mpr ⟨freshSlot, Finset.mem_univ _, rfl⟩
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.rowSupport] using hmem
    have hfreshImage :
        freshPoint freshSlot ∈
          (actualBlockerFiber H Q.source₁).image (fun source ↦ source.1) := by
      rw [Boundary.fiberImage_eq_qSupport_erase_source
        (P := P) (Pρ := Pρ) Q]
      exact Finset.mem_erase.mpr ⟨hfreshNe, hfreshMem⟩
    rcases Finset.mem_image.mp hfreshImage with
      ⟨source, hsourceFiber, hsourceValue⟩
    have hfanSource : Packet.fan.fan.source fanIndex = source := by
      apply Subtype.ext
      exact hfanAlias'.trans hsourceValue.symm
    have hcenter :
        H.centerAt source.1 source.2 =
          H.centerAt Q.source₁.1 Q.source₁.2 :=
      congrArg (fun vertex : CriticalShellSystem.CarrierVertex D.A ↦ vertex.1)
        (Finset.mem_filter.mp hsourceFiber).2
    change Packet.fan.fan.blockerCenter fanIndex =
      H.centerAt Q.source₁.1 Q.source₁.2
    change H.centerAt (Packet.fan.fan.source fanIndex).1
      (Packet.fan.fan.source fanIndex).2 = _
    rw [hfanSource]
    exact hcenter
  · intro fanIndex hfanAlias hblockerEq
    have hfanAlias' :
        (Packet.fan.fan.source fanIndex).1 = freshPoint boundarySlot := by
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point, freshPoint] using
          (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
            (P := P) (Pρ := Pρ) View _ _).1 hfanAlias
    have hsourceEq : Packet.fan.fan.source fanIndex = Boundary.source := by
      apply Subtype.ext
      exact hfanAlias'.trans hboundarySlot'
    have hblockerEq' :
        Packet.fan.fan.blockerCenter fanIndex =
          H.centerAt Q.source₁.1 Q.source₁.2 := by
      simpa [FreshThirdPinnedEndpointOutsideSeedFiniteView.SamePoint,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using
          (FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff
            (P := P) (Pρ := Pρ) View _ _).1 hblockerEq
    apply Boundary.centers_ne
    rw [← hsourceEq]
    change Packet.fan.fan.blockerCenter fanIndex =
      H.centerAt Q.source₁.1 Q.source₁.2
    exact hblockerEq'

/-- Certificate contract for the exact-three extension of the intrinsic
pinned-endpoint finite query. -/
structure FreshThirdQFiberThreeFiniteQueryContract : Prop where
  reject : ∀ Config : FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration,
    FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory Config →
    FreshThirdVisibleRowGeometryConstraint Config →
    FreshThirdVisibleRowSharedPairSeparationConstraint Config →
    FreshThirdQFiberThreeFiniteBoundaryConstraint Config → False

/-- Replay an exact-three finite-query certificate on an arbitrary-cardinality
source packet.  The ambient carrier is absent from the certificate contract;
only the intrinsic packet view is interpreted. -/
theorem FreshThirdQFiberThreeBoundary.false_of_finiteQueryContract
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    (Q : FreshThirdBlockerFiber P Pρ)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    (View : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (Contract : FreshThirdQFiberThreeFiniteQueryContract) : False := by
  let Config :=
    FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView P Pρ View
  exact Contract.reject Config
    (FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory.ofView
      (P := P) (Pρ := Pρ) View)
    (FreshThirdVisibleRowGeometryConstraint.ofView
      (P := P) (Pρ := Pρ) View)
    (FreshThirdVisibleRowSharedPairSeparationConstraint.ofView
      (P := P) (Pρ := Pρ) View)
    (FreshThirdQFiberThreeFiniteBoundaryConstraint.ofView
      (P := P) (Pρ := Pρ) Q Boundary View)

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
