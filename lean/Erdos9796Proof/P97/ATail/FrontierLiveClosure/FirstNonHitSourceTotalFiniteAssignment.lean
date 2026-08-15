/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Census554.ZeroCutBoundaryIndexing
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdRetainedProducer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceTripleShellEscape

/-!
# Source-total finite assignment for the FreshThird FirstNonHit packet

This file reindexes the complete actual carrier by one checked convex-boundary
enumeration.  Every finite relation below is definitionally or propositionally
tied to the source geometry.  The structure deliberately contains no query,
contradiction, fixed carrier size, or global phase/no-alternation assertion.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailExactFifteenApexProfile
open ATailLargeOppositeCapsBiApexSurface
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedStrictInteriorPairSelector
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge
open Census554.ZeroCutBoundaryIndexing

attribute [local instance] Classical.propDecidable

namespace TwoSourceExactCollisionRowsTerminal

noncomputable section

/-- The eleven source-named roles retained by the FirstNonHit finite assignment. -/
inductive FirstNonHitNamedRole where
  | surplusApex
  | firstApex
  | secondApex
  | firstRetainedSourceOne
  | firstRetainedSourceTwo
  | secondRetainedSourceOne
  | secondRetainedSourceTwo
  | canonicalSourceOne
  | canonicalSourceTwo
  | freshSourceOne
  | freshSourceTwo
deriving DecidableEq, Fintype

namespace FirstNonHitNamedRole

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

/-- Geometric point represented by a source-named finite role. -/
def point
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : FirstNonHitNamedRole → ℝ²
  | .surplusApex => S.oppositeVertexByIndex S.surplusIdx
  | .firstApex => S.oppositeVertexByIndex S.oppIndex1
  | .secondApex => S.oppositeVertexByIndex S.oppIndex2
  | .firstRetainedSourceOne => P.source₁
  | .firstRetainedSourceTwo => P.source₂
  | .secondRetainedSourceOne => Pρ.source₁
  | .secondRetainedSourceTwo => Pρ.source₂
  | .canonicalSourceOne => C.firstSource.1
  | .canonicalSourceTwo => C.secondSource.1
  | .freshSourceOne => Q.source₁.1
  | .freshSourceTwo => Q.source₂.1

/-- Every source-named role is an actual carrier point. -/
theorem point_mem
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) (role : FirstNonHitNamedRole) :
    point P Pρ C Q role ∈ D.A := by
  cases role with
  | surplusApex => exact S.oppositeVertexByIndex_mem S.surplusIdx
  | firstApex => exact S.oppositeVertexByIndex_mem S.oppIndex1
  | secondApex => exact S.oppositeVertexByIndex_mem S.oppIndex2
  | firstRetainedSourceOne => exact P.source₁_mem_A
  | firstRetainedSourceTwo => exact P.source₂_mem_A
  | secondRetainedSourceOne => exact Pρ.source₁_mem_A
  | secondRetainedSourceTwo => exact Pρ.source₂_mem_A
  | canonicalSourceOne => exact C.firstSource.2
  | canonicalSourceTwo => exact C.secondSource.2
  | freshSourceOne => exact Q.source₁.2
  | freshSourceTwo => exact Q.source₂.2

end
end FirstNonHitNamedRole

private def pullback
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (U : Finset ℝ²) :
    Finset (Fin boundary.n) :=
  Finset.univ.filter fun i ↦ boundary.boundary i ∈ U

private theorem boundary_point_mem
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (i : Fin boundary.n) :
    boundary.boundary i ∈ A := by
  have hi : boundary.boundary i ∈ Finset.univ.image boundary.boundary :=
    Finset.mem_image.mpr ⟨i, Finset.mem_univ i, rfl⟩
  rwa [boundary.boundary_image] at hi

@[simp] private theorem mem_pullback_iff
    {A U : Finset ℝ²} (boundary : BoundaryIndexing A) (i : Fin boundary.n) :
    i ∈ pullback boundary U ↔ boundary.boundary i ∈ U := by
  simp [pullback]

private theorem image_pullback_eq
    {A U : Finset ℝ²} (boundary : BoundaryIndexing A) (hU : U ⊆ A) :
    (pullback boundary U).image boundary.boundary = U := by
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    exact (mem_pullback_iff boundary i).mp hi
  · intro hx
    have hxImage : x ∈ Finset.univ.image boundary.boundary := by
      rw [boundary.boundary_image]
      exact hU hx
    rcases Finset.mem_image.mp hxImage with ⟨i, _hi, rfl⟩
    exact Finset.mem_image.mpr
      ⟨i, (mem_pullback_iff boundary i).mpr hx, rfl⟩

private theorem card_pullback_eq
    {A U : Finset ℝ²} (boundary : BoundaryIndexing A) (hU : U ⊆ A) :
    (pullback boundary U).card = U.card := by
  calc
    (pullback boundary U).card =
        ((pullback boundary U).image boundary.boundary).card :=
      (Finset.card_image_of_injective _ boundary.boundary_injective).symm
    _ = U.card := congrArg Finset.card (image_pullback_eq boundary hU)

private theorem boundary_card_eq
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) :
    boundary.n = A.card := by
  calc
    boundary.n = (Finset.univ : Finset (Fin boundary.n)).card := by simp
    _ = (Finset.univ.image boundary.boundary).card :=
      (Finset.card_image_of_injective _ boundary.boundary_injective).symm
    _ = A.card := congrArg Finset.card boundary.boundary_image

private theorem pullback_erase_eq
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (deleted : Fin boundary.n) :
    pullback boundary (A.erase (boundary.boundary deleted)) =
      Finset.univ.erase deleted := by
  ext i
  simp only [mem_pullback_iff, Finset.mem_erase, boundary_point_mem,
    Finset.mem_univ, and_true]
  exact not_congr boundary.boundary_injective.eq_iff

private theorem image_univ_erase_eq
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (deleted : Fin boundary.n) :
    (Finset.univ.erase deleted).image boundary.boundary =
      A.erase (boundary.boundary deleted) := by
  rw [← pullback_erase_eq boundary deleted]
  exact image_pullback_eq boundary (Finset.erase_subset _ _)

private def indexedBlockerMap
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (H : CriticalShellSystem A) :
    Fin boundary.n → Fin boundary.n :=
  fun i ↦
    boundary.indexOf
      (H.blockerVertex ⟨boundary.boundary i, boundary_point_mem boundary i⟩)

private theorem indexedBlockerMap_point_eq
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (H : CriticalShellSystem A)
    (i : Fin boundary.n) :
    boundary.boundary (indexedBlockerMap boundary H i) =
      H.centerAt (boundary.boundary i) (boundary_point_mem boundary i) := by
  simpa [indexedBlockerMap, pointOf, CriticalShellSystem.blockerVertex] using
    boundary.point_eq
      (H.blockerVertex ⟨boundary.boundary i, boundary_point_mem boundary i⟩)

private theorem indexedBlockerMap_ne
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (H : CriticalShellSystem A)
    (i : Fin boundary.n) :
    indexedBlockerMap boundary H i ≠ i := by
  intro hfixed
  apply H.blockerVertex_ne
    ⟨boundary.boundary i, boundary_point_mem boundary i⟩
  apply Subtype.ext
  have hboundary := congrArg boundary.boundary hfixed
  simpa [CriticalShellSystem.blockerVertex] using
    (indexedBlockerMap_point_eq boundary H i).symm.trans hboundary

private def indexedRadiusEq
    {A : Finset ℝ²} (boundary : BoundaryIndexing A)
    (center x y : Fin boundary.n) : Bool :=
  decide (dist (boundary.boundary center) (boundary.boundary x) =
    dist (boundary.boundary center) (boundary.boundary y))

@[simp] private theorem indexedRadiusEq_eq_true_iff
    {A : Finset ℝ²} (boundary : BoundaryIndexing A)
    (center x y : Fin boundary.n) :
    indexedRadiusEq boundary center x y = true ↔
      dist (boundary.boundary center) (boundary.boundary x) =
        dist (boundary.boundary center) (boundary.boundary y) := by
  simp [indexedRadiusEq]

private def indexedRow
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (H : CriticalShellSystem A)
    (source : Fin boundary.n) : Finset (Fin boundary.n) :=
  pullback boundary
    (H.selectedAt (boundary.boundary source)
      (boundary_point_mem boundary source)).toCriticalFourShell.support

@[simp] private theorem mem_indexedRow_iff
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (H : CriticalShellSystem A)
    (source x : Fin boundary.n) :
    x ∈ indexedRow boundary H source ↔
      boundary.boundary x ∈
        (H.selectedAt (boundary.boundary source)
          (boundary_point_mem boundary source)).toCriticalFourShell.support := by
  simp [indexedRow]

private theorem indexedRow_image_eq
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (H : CriticalShellSystem A)
    (source : Fin boundary.n) :
    (indexedRow boundary H source).image boundary.boundary =
      (H.selectedAt (boundary.boundary source)
        (boundary_point_mem boundary source)).toCriticalFourShell.support := by
  exact image_pullback_eq boundary
    (H.selectedAt (boundary.boundary source)
      (boundary_point_mem boundary source)).toCriticalFourShell.support_subset_A

private theorem indexedRow_card
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (H : CriticalShellSystem A)
    (source : Fin boundary.n) :
    (indexedRow boundary H source).card = 4 := by
  rw [indexedRow, card_pullback_eq boundary
    (H.selectedAt (boundary.boundary source)
      (boundary_point_mem boundary source)).toCriticalFourShell.support_subset_A]
  exact
    (H.selectedAt (boundary.boundary source)
      (boundary_point_mem boundary source)).toCriticalFourShell.support_card

private theorem indexedRow_source_mem
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (H : CriticalShellSystem A)
    (source : Fin boundary.n) :
    source ∈ indexedRow boundary H source := by
  rw [mem_indexedRow_iff]
  exact
    (H.selectedAt (boundary.boundary source)
      (boundary_point_mem boundary source)).toCriticalFourShell.q_mem_support

private theorem mem_indexedRow_iff_radiusEq
    {A : Finset ℝ²} (boundary : BoundaryIndexing A) (H : CriticalShellSystem A)
    (source x : Fin boundary.n) :
    x ∈ indexedRow boundary H source ↔
      indexedRadiusEq boundary (indexedBlockerMap boundary H source) x source = true := by
  rw [mem_indexedRow_iff, indexedRadiusEq_eq_true_iff,
    indexedBlockerMap_point_eq]
  let K :=
    (H.selectedAt (boundary.boundary source)
      (boundary_point_mem boundary source)).toCriticalFourShell
  constructor
  · intro hx
    exact (K.support_eq_radius _ hx).trans
      (K.support_eq_radius _ K.q_mem_support).symm
  · intro hdist
    exact K.off_row_named_label_forbidden (boundary_point_mem boundary x)
      (hdist.trans (K.support_eq_radius _ K.q_mem_support))

private def indexedHasFourAfterDeleting
    {A : Finset ℝ²} (boundary : BoundaryIndexing A)
    (deleted center : Fin boundary.n) : Bool :=
  decide
    (HasNEquidistantPointsAt 4
      ((Finset.univ.erase deleted).image boundary.boundary)
      (boundary.boundary center))

@[simp] private theorem indexedHasFourAfterDeleting_eq_true_iff
    {A : Finset ℝ²} (boundary : BoundaryIndexing A)
    (deleted center : Fin boundary.n) :
    indexedHasFourAfterDeleting boundary deleted center = true ↔
      HasNEquidistantPointsAt 4
        (A.erase (boundary.boundary deleted))
        (boundary.boundary center) := by
  simp [indexedHasFourAfterDeleting, image_univ_erase_eq]

private def indexedInCap
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (boundary : BoundaryIndexing D.A) (source : Fin boundary.n) (cap : Fin 3) : Bool :=
  decide (boundary.boundary source ∈ S.capByIndex cap)

@[simp] private theorem indexedInCap_eq_true_iff
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (boundary : BoundaryIndexing D.A) (source : Fin boundary.n) (cap : Fin 3) :
    indexedInCap S boundary source cap = true ↔
      boundary.boundary source ∈ S.capByIndex cap := by
  simp [indexedInCap]

private def indexedInCapInterior
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (boundary : BoundaryIndexing D.A) (source : Fin boundary.n) (cap : Fin 3) : Bool :=
  decide (boundary.boundary source ∈ S.capInteriorByIndex cap)

@[simp] private theorem indexedInCapInterior_eq_true_iff
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (boundary : BoundaryIndexing D.A) (source : Fin boundary.n) (cap : Fin 3) :
    indexedInCapInterior S boundary source cap = true ↔
      boundary.boundary source ∈ S.capInteriorByIndex cap := by
  simp [indexedInCapInterior]

private structure BoundaryPacket
    {D : CounterexampleData} (S : SurplusCapPacket D.A) where
  boundary : BoundaryIndexing D.A
  boundary_pos : 0 < boundary.n
  opp1Cut : Fin boundary.n
  opp2Cut : Fin boundary.n
  zeroCut_eq :
    boundary.boundary (zeroIndex boundary_pos) =
      S.oppositeVertexByIndex S.surplusIdx
  opp1Cut_eq :
    boundary.boundary opp1Cut = S.oppositeVertexByIndex S.oppIndex1
  opp2Cut_eq :
    boundary.boundary opp2Cut = S.oppositeVertexByIndex S.oppIndex2
  capBlocks :
    DirectBoundaryBlocks S boundary.boundary boundary_pos opp1Cut opp2Cut ∨
      MirrorBoundaryBlocks S boundary.boundary boundary_pos opp1Cut opp2Cut

private theorem boundaryPacket_nonempty
    {D : CounterexampleData} (S : SurplusCapPacket D.A) :
    Nonempty (BoundaryPacket S) := by
  rcases exists_with_capBlocks S with
    ⟨boundary, boundary_pos, opp1Cut, opp2Cut,
      zeroCut_eq, opp1Cut_eq, opp2Cut_eq, capBlocks⟩
  exact ⟨{
    boundary := boundary
    boundary_pos := boundary_pos
    opp1Cut := opp1Cut
    opp2Cut := opp2Cut
    zeroCut_eq := zeroCut_eq
    opp1Cut_eq := opp1Cut_eq
    opp2Cut_eq := opp2Cut_eq
    capBlocks := capBlocks }⟩

private noncomputable def boundaryPacket
    {D : CounterexampleData} (S : SurplusCapPacket D.A) : BoundaryPacket S :=
  Classical.choice (boundaryPacket_nonempty S)

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
    {B : FrontierBiApexRobustResidual R}

/-- The source cap-eight and all-large residual margins force the carrier lower
bound.  This is not an exact-cardinality or upper-bound claim. -/
theorem firstNonHit_sourceTotal_carrier_card_ge_seventeen
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ) :
    17 ≤ D.A.card := by
  have hcap1 : 6 ≤ (S.capByIndex S.oppIndex1).card := by
    rcases hi : S.surplusIdx with ⟨j, hj⟩
    interval_cases j <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap1,
        SurplusCapPacket.oppIndex1, hi] using
        FrontierLargeOppositeCapsBiApexRobustResidual.firstOppCap_card_ge_six L
  have hcap2 : 6 ≤ (S.capByIndex S.oppIndex2).card := by
    rcases hi : S.surplusIdx with ⟨j, hj⟩
    interval_cases j <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap2,
        SurplusCapPacket.oppIndex2, hi] using
        FrontierLargeOppositeCapsBiApexRobustResidual.secondOppCap_card_ge_six L
  have hsurplus : 6 ≤ (S.capByIndex S.surplusIdx).card := by
    rcases hi : S.surplusIdx with ⟨j, hj⟩
    interval_cases j <;>
      simpa [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi] using
        FrontierAllLargeCapsBiApexRobustResidual.surplusCap_card_ge_six N
  apply card_ge_seventeen_of_one_cap_card_ge_eight
    S S.oppIndex1 C.cap_card_ge_eight
  intro i
  rcases triApexAllLargeContext_index_cases S i with rfl | rfl | rfl
  · exact hcap1
  · exact hcap2
  · exact hsurplus

/-- Kernel-facing source assignment on the complete finite carrier. -/
structure FirstNonHitSourceTotalFiniteAssignment
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) where
  boundary : BoundaryIndexing D.A
  boundary_pos : 0 < boundary.n
  boundary_mem : ∀ i, boundary.boundary i ∈ D.A
  opp1Cut : Fin boundary.n
  opp2Cut : Fin boundary.n
  zeroCut_eq :
    boundary.boundary (zeroIndex boundary_pos) =
      S.oppositeVertexByIndex S.surplusIdx
  opp1Cut_eq :
    boundary.boundary opp1Cut = S.oppositeVertexByIndex S.oppIndex1
  opp2Cut_eq :
    boundary.boundary opp2Cut = S.oppositeVertexByIndex S.oppIndex2
  capBlocks :
    DirectBoundaryBlocks S boundary.boundary boundary_pos opp1Cut opp2Cut ∨
      MirrorBoundaryBlocks S boundary.boundary boundary_pos opp1Cut opp2Cut
  carrier_card_ge_seventeen : 17 ≤ boundary.n
  roleIndex : FirstNonHitNamedRole → Fin boundary.n
  roleIndex_eq : ∀ role,
    roleIndex role = boundary.indexOf
      ⟨FirstNonHitNamedRole.point P Pρ C Q role,
        FirstNonHitNamedRole.point_mem P Pρ C Q role⟩
  roleIndex_point_eq : ∀ role,
    boundary.boundary (roleIndex role) =
      FirstNonHitNamedRole.point P Pρ C Q role
  blockerMap : Fin boundary.n → Fin boundary.n
  blockerMap_point_eq : ∀ i,
    boundary.boundary (blockerMap i) =
      H.centerAt (boundary.boundary i) (boundary_mem i)
  blockerMap_ne : ∀ i, blockerMap i ≠ i
  radiusEq : Fin boundary.n → Fin boundary.n → Fin boundary.n → Bool
  radiusEq_iff : ∀ center x y,
    radiusEq center x y = true ↔
      dist (boundary.boundary center) (boundary.boundary x) =
        dist (boundary.boundary center) (boundary.boundary y)
  row : Fin boundary.n → Finset (Fin boundary.n)
  row_mem_iff : ∀ source x,
    x ∈ row source ↔
      boundary.boundary x ∈
        (H.selectedAt (boundary.boundary source)
          (boundary_mem source)).toCriticalFourShell.support
  row_image_eq_shell : ∀ source,
    (row source).image boundary.boundary =
      (H.selectedAt (boundary.boundary source)
        (boundary_mem source)).toCriticalFourShell.support
  row_card : ∀ source, (row source).card = 4
  row_source_mem : ∀ source, source ∈ row source
  row_mem_iff_radiusEq : ∀ source x,
    x ∈ row source ↔ radiusEq (blockerMap source) x source = true
  hasFourAfterDeleting : Fin boundary.n → Fin boundary.n → Bool
  hasFourAfterDeleting_iff : ∀ deleted center,
    hasFourAfterDeleting deleted center = true ↔
      HasNEquidistantPointsAt 4
        (D.A.erase (boundary.boundary deleted))
        (boundary.boundary center)
  no_qfree : ∀ source,
    ¬ HasNEquidistantPointsAt 4
      (D.A.erase (boundary.boundary source))
      (boundary.boundary (blockerMap source))
  inCap : Fin boundary.n → Fin 3 → Bool
  inCap_iff : ∀ source cap,
    inCap source cap = true ↔
      boundary.boundary source ∈ S.capByIndex cap
  inCapInterior : Fin boundary.n → Fin 3 → Bool
  inCapInterior_iff : ∀ source cap,
    inCapInterior source cap = true ↔
      boundary.boundary source ∈ S.capInteriorByIndex cap
  hingress : FreshThirdAcyclicCanonicalConsumerPacket P Pρ C
  firstNonHit : FreshThirdCapSourceNonHit P Pρ C.firstSource Q
  secondInteraction : FreshThirdCapSourceInteraction P Pρ C.secondSource Q
  tripleShellEscape :
    ∃ center : ℝ²,
      ∃ K : SelectedFourClass D.A center,
        ∃ z : ℝ²,
          z ∈ K.support ∧
            z ∉ freshThirdCriticalTripleShellSeed P Pρ Q.source₁ ∧
            (K.support ∩
              (H.selectedAt Q.source₁.1
                Q.source₁.2).toCriticalFourShell.support).card ≤ 2

namespace FirstNonHitSourceTotalFiniteAssignment

/-- Exact finite reindexing of the live FirstNonHit source packet. -/
noncomputable def ofPacket
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (hingress : FreshThirdAcyclicCanonicalConsumerPacket P Pρ C)
    (data : FreshThirdCapSourceNonHit P Pρ C.firstSource Q)
    (secondInteraction :
      FreshThirdCapSourceInteraction P Pρ C.secondSource Q) :
    FirstNonHitSourceTotalFiniteAssignment P Pρ C Q := by
  classical
  let packet := boundaryPacket S
  let boundary := packet.boundary
  refine
    { boundary := boundary
      boundary_pos := packet.boundary_pos
      boundary_mem := boundary_point_mem boundary
      opp1Cut := packet.opp1Cut
      opp2Cut := packet.opp2Cut
      zeroCut_eq := packet.zeroCut_eq
      opp1Cut_eq := packet.opp1Cut_eq
      opp2Cut_eq := packet.opp2Cut_eq
      capBlocks := packet.capBlocks
      carrier_card_ge_seventeen := ?_
      roleIndex := fun role ↦ boundary.indexOf
        ⟨FirstNonHitNamedRole.point P Pρ C Q role,
          FirstNonHitNamedRole.point_mem P Pρ C Q role⟩
      roleIndex_eq := fun _ ↦ rfl
      roleIndex_point_eq := fun role ↦
        boundary.point_eq
          ⟨FirstNonHitNamedRole.point P Pρ C Q role,
            FirstNonHitNamedRole.point_mem P Pρ C Q role⟩
      blockerMap := indexedBlockerMap boundary H
      blockerMap_point_eq := indexedBlockerMap_point_eq boundary H
      blockerMap_ne := indexedBlockerMap_ne boundary H
      radiusEq := indexedRadiusEq boundary
      radiusEq_iff := indexedRadiusEq_eq_true_iff boundary
      row := indexedRow boundary H
      row_mem_iff := mem_indexedRow_iff boundary H
      row_image_eq_shell := indexedRow_image_eq boundary H
      row_card := indexedRow_card boundary H
      row_source_mem := indexedRow_source_mem boundary H
      row_mem_iff_radiusEq := mem_indexedRow_iff_radiusEq boundary H
      hasFourAfterDeleting := indexedHasFourAfterDeleting boundary
      hasFourAfterDeleting_iff :=
        indexedHasFourAfterDeleting_eq_true_iff boundary
      no_qfree := ?_
      inCap := indexedInCap S boundary
      inCap_iff := indexedInCap_eq_true_iff S boundary
      inCapInterior := indexedInCapInterior S boundary
      inCapInterior_iff := indexedInCapInterior_eq_true_iff S boundary
      hingress := hingress
      firstNonHit := data
      secondInteraction := secondInteraction
      tripleShellEscape :=
        exists_q_tripleShellEscape_qRow_overlap_card_le_two P Pρ L Q }
  · rw [boundary_card_eq boundary]
    exact firstNonHit_sourceTotal_carrier_card_ge_seventeen P Pρ L N C
  · intro source
    rw [indexedBlockerMap_point_eq]
    exact H.no_qfree_at (boundary.boundary source)
      (boundary_point_mem boundary source)

end FirstNonHitSourceTotalFiniteAssignment

#print axioms FirstNonHitSourceTotalFiniteAssignment.ofPacket

end
end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
