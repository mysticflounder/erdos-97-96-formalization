/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdQFiberThreeCarrierFiniteQuery

/-!
# Source theory for the FreshThird exact-three carrier query

This module compiles the actual `Q`-row carrier fan and the boundary row's
second-order fan into finite Boolean clauses.  Nonboundary `Q` blockers are
normalized to the already named `freshCenter` and `q` row using the exact
source theorem; the unique boundary blocker and every genuinely new
second-order row remain explicit.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry
open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailSurvivalCover
open Census554.GeneralCarrierBridge

namespace FreshThirdQFiberThreeCarrierFiniteView

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

/-- Turn an exact geometric overlap bound into the finite no-three-slots
predicate used by the carrier query. -/
private theorem noThreeSourcesInRow_of_overlap_card_le_two
    {center₁ center₂ : ℝ²}
    {Row₁ : SelectedFourClass D.A center₁}
    (Fan : IndexedSourceFaithfulSelectedFourFan D S H Row₁)
    (Row₂ : SelectedFourClass D.A center₂)
    (hoverlap : (Row₁.support ∩ Row₂.support).card ≤ 2) :
    ∀ e : Fin 3 ↪ Fin 4,
      ¬ ∀ k : Fin 3, (Fan.source (e k)).1 ∈ Row₂.support := by
  intro e hall
  let chosen : Finset ℝ² :=
    Finset.univ.image (fun k : Fin 3 ↦ (Fan.source (e k)).1)
  have hinjective :
      Function.Injective (fun k : Fin 3 ↦ (Fan.source (e k)).1) := by
    intro i j hij
    apply e.injective
    apply Fan.source_injective
    exact Subtype.ext hij
  have hcard : chosen.card = 3 := by
    simp [chosen, Finset.card_image_of_injective _ hinjective]
  have hsubset : chosen ⊆ Row₁.support ∩ Row₂.support := by
    intro x hx
    rcases Finset.mem_image.mp hx with ⟨k, _, rfl⟩
    exact Finset.mem_inter.mpr ⟨Fan.source_mem_support (e k), hall k⟩
  have hle := Finset.card_le_card hsubset
  rw [hcard] at hle
  omega

/-- Complete source-proved finite theory contributed by the carrier fans.

This extends, rather than replaces, the pinned finite source theory.  It
retains every cross-vocabulary alias but asserts no pinned-fan/`Q`
synchronization. -/
structure SourceTheory
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (boundaryIndex : Fin 4) : Prop where
  qSourcesDistinct : ∀ i j : Fin 4,
    A.Same (.inr (.qSource i)) (.inr (.qSource j)) ↔ i = j
  qRowExact : ∀ point,
    A.Incident point (.inr .q) ↔
      ∃ i : Fin 4, A.Same point (.inr (.qSource i))
  qRowEqPinnedFresh : ∀ point,
    A.Incident point (.inr .q) ↔ A.Incident point (.inl .fresh)
  boundaryFreshRemainder : ∃ i : Fin 2,
    A.Same (.inr (.qSource boundaryIndex)) (.inl (.freshRemainder i))
  namedQSources :
    (∃ i : Fin 4,
      A.Same (.inr (.qSource i)) (.inl .freshSourceOne)) ∧
    (∃ i : Fin 4,
      A.Same (.inr (.qSource i)) (.inl .freshSourceTwo))
  boundaryCenterNeQCenter :
    ¬ A.Same (.inr .boundaryBlockerCenter) (.inl .freshCenter)
  nonboundaryDeletionBlocked : ∀ i : Fin 4, i ≠ boundaryIndex →
    ¬ A.HasFourAfterDeleting
      (.inr (.qSource i)) (.inl .freshCenter)
  boundaryPacket :
    (∃ cap : Fin 3,
      A.InCapInterior (.inr .boundaryBlockerCenter) cap) ∧
    ¬ A.HasFourAfterDeleting
      (.inr (.qSource boundaryIndex)) (.inr .boundaryBlockerCenter) ∧
    A.NoThreeSourcesInRow
      (fun i ↦ .inr (.qSource i)) (.inr .boundaryBlocker)
  boundaryRowExact : ∀ point,
    A.Incident point (.inr .boundaryBlocker) ↔
      ∃ i : Fin 4, A.Same point (.inr (.boundaryRowSource i))
  boundarySourceInBoundaryRow : ∃ i : Fin 4,
    A.Same (.inr (.boundaryRowSource i))
      (.inr (.qSource boundaryIndex))
  boundaryFanRowsExact : ∀ i point,
    A.Incident point (.inr (.boundaryFanBlocker i)) ↔
      ∃ j : Fin 4,
        A.Same point (.inr (.boundaryFanBlockerRowSource i j))
  boundaryFanPackets : ∀ i : Fin 4,
    ∃ cap : Fin 3,
      A.InCapInterior (.inr (.boundaryFanBlockerCenter i)) cap ∧
      ¬ A.HasFourAfterDeleting
        (.inr (.boundaryRowSource i))
        (.inr (.boundaryFanBlockerCenter i)) ∧
      ((A.Same (.inr (.boundaryFanBlockerCenter i))
            (.inr .boundaryBlockerCenter) ∧
          A.Nonrobust (.inr .boundaryBlockerCenter) ∧
          (∀ point,
            A.Incident point (.inr (.boundaryFanBlocker i)) ↔
              A.Incident point (.inr .boundaryBlocker))) ∨
        (¬ A.Same (.inr (.boundaryFanBlockerCenter i))
            (.inr .boundaryBlockerCenter) ∧
          A.NoThreeSourcesInRow
            (fun j ↦ .inr (.boundaryRowSource j))
            (.inr (.boundaryFanBlocker i))))

/-- Packet-independent complete finite configuration for the exact-three
carrier query. -/
structure Configuration where
  assignment : FreshThirdQFiberThreeCarrierFiniteAssignment
  pinned : FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration
  boundaryIndex : Fin 4
deriving DecidableEq

namespace Configuration

/-- Evaluate a complete configuration on one exact combined view. -/
noncomputable def ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary) :
    Configuration where
  assignment := FreshThirdQFiberThreeCarrierFiniteAssignment.ofView P Pρ View
  pinned := FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView
    P Pρ View.pinned
  boundaryIndex := View.carrier.boundaryIndex

end Configuration

/-- Semantic bridge identifying the inherited part of the combined Boolean
vocabulary with the already certified pinned assignment.  Keeping this bridge
propositional avoids depending on which `Decidable` instance computed an
extensionally equal Boolean atom. -/
structure PinnedBridge
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment)
    (Pinned : FreshThirdPinnedEndpointOutsideSeedFiniteAssignment) : Prop where
  same : ∀ left right, A.Same (.inl left) (.inl right) ↔ Pinned.Same left right
  incident : ∀ point row,
    A.Incident (.inl point) (.inl row) ↔ Pinned.Incident point row
  inCap : ∀ point cap, A.InCap (.inl point) cap ↔ Pinned.InCap point cap
  inCapInterior : ∀ point cap,
    A.InCapInterior (.inl point) cap ↔ Pinned.InCapInterior point cap
  before : ∀ left right,
    A.Before (.inl left) (.inl right) ↔ Pinned.Before left right
  sameDistanceFrom : ∀ center left right,
    A.SameDistanceFrom (.inl center) (.inl left) (.inl right) ↔
      Pinned.SameDistanceFrom center left right
  hasFourAfterDeleting : ∀ deleted atCenter,
    A.HasFourAfterDeleting (.inl deleted) (.inl atCenter) ↔
      Pinned.HasFourAfterDeleting deleted atCenter
  nonrobust : ∀ center,
    A.Nonrobust (.inl center) ↔ Pinned.Nonrobust center

/-- Equality and predicate congruence over the complete old/new role
vocabulary.  These laws prevent a solver from assigning incompatible atoms to
roles that the source theory identifies as the same carrier point. -/
structure RelationalTheory
    (A : FreshThirdQFiberThreeCarrierFiniteAssignment) : Prop where
  same_refl : ∀ point, A.Same point point
  same_symm : ∀ {left right}, A.Same left right → A.Same right left
  same_trans : ∀ {left middle right},
    A.Same left middle → A.Same middle right → A.Same left right
  incident_congr : ∀ {left right row}, A.Same left right →
    (A.Incident left row ↔ A.Incident right row)
  inCap_congr : ∀ {left right cap}, A.Same left right →
    (A.InCap left cap ↔ A.InCap right cap)
  inCapInterior_congr : ∀ {left right cap}, A.Same left right →
    (A.InCapInterior left cap ↔ A.InCapInterior right cap)
  interior_in_cap : ∀ {point cap}, A.InCapInterior point cap → A.InCap point cap
  interior_not_in_other_cap : ∀ {point firstCap secondCap},
    A.InCapInterior point firstCap → firstCap ≠ secondCap →
      ¬ A.InCap point secondCap
  before_congr : ∀ {left left' right right'},
    A.Same left left' → A.Same right right' →
      (A.Before left right ↔ A.Before left' right')
  before_irrefl : ∀ point, ¬ A.Before point point
  before_trans : ∀ {left middle right},
    A.Before left middle → A.Before middle right → A.Before left right
  before_or_same_or_after : ∀ left right,
    A.Before left right ∨ A.Same left right ∨ A.Before right left
  sameDistanceFrom_congr : ∀
      {center center' left left' right right'},
    A.Same center center' → A.Same left left' → A.Same right right' →
      (A.SameDistanceFrom center left right ↔
        A.SameDistanceFrom center' left' right')
  sameDistanceFrom_refl : ∀ center point,
    A.SameDistanceFrom center point point
  sameDistanceFrom_symm : ∀ center left right,
    A.SameDistanceFrom center left right ↔
      A.SameDistanceFrom center right left
  sameDistanceFrom_trans : ∀ center left middle right,
    A.SameDistanceFrom center left middle →
      A.SameDistanceFrom center middle right →
        A.SameDistanceFrom center left right
  hasFourAfterDeleting_congr : ∀
      {deleted deleted' atCenter atCenter'},
    A.Same deleted deleted' → A.Same atCenter atCenter' →
      (A.HasFourAfterDeleting deleted atCenter ↔
        A.HasFourAfterDeleting deleted' atCenter')
  blocked_deletion_nonrobust : ∀ deleted atCenter,
    ¬ A.HasFourAfterDeleting deleted atCenter → A.Nonrobust atCenter
  nonrobust_congr : ∀ {left right}, A.Same left right →
    (A.Nonrobust left ↔ A.Nonrobust right)

/-- Full query ingress: the complete old pinned theory, the new carrier-fan
clauses, and their shared-role bridge. -/
structure CompleteSourceTheory (Config : Configuration) : Prop where
  pinned : FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory Config.pinned
  carrier : SourceTheory Config.assignment Config.boundaryIndex
  bridge : PinnedBridge Config.assignment Config.pinned.assignment
  relational : RelationalTheory Config.assignment
  rowTheory : FreshThirdQFiberThreeCarrierFiniteRowTheory Config.assignment

attribute [local instance] Classical.propDecidable

/-- Every exact combined view satisfies the carrier-fan finite theory. -/
theorem sourceTheory_ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary) :
    SourceTheory
      (FreshThirdQFiberThreeCarrierFiniteAssignment.ofView P Pρ View)
      View.carrier.boundaryIndex := by
  let A := FreshThirdQFiberThreeCarrierFiniteAssignment.ofView P Pρ View
  refine {
    qSourcesDistinct := ?_
    qRowExact := ?_
    qRowEqPinnedFresh := ?_
    boundaryFreshRemainder := ?_
    namedQSources := ?_
    boundaryCenterNeQCenter := ?_
    nonboundaryDeletionBlocked := ?_
    boundaryPacket := ?_
    boundaryRowExact := ?_
    boundarySourceInBoundaryRow := ?_
    boundaryFanRowsExact := ?_
    boundaryFanPackets := ?_ }
  · intro i j
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff]
    constructor
    · intro hij
      exact View.carrier.qFan.source_injective (Subtype.ext hij)
    · rintro rfl
      rfl
  · intro role
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff]
    constructor
    · intro hrole
      let i : Fin 4 := View.carrier.qFan.index
        ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View role, hrole⟩
      refine ⟨i, ?_⟩
      rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff]
      exact congrArg Subtype.val
        (View.carrier.qFan.source_index_support
          ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View role,
            FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier
              P Pρ View role⟩ hrole) |>.symm
    · rintro ⟨i, hi⟩
      rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff] at hi
      rw [hi]
      exact View.carrier.qFan.source_mem_support i
  · intro role
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff,
      FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff]
    rfl
  · rcases View.exists_boundary_freshRemainder_alias
      (P := P) (Pρ := Pρ) with ⟨i, hi⟩
    exact ⟨i,
      (FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).2 hi⟩
  · constructor
    · let i : Fin 4 := View.carrier.qFan.index
        ⟨Q.source₁.1,
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.q_mem_support⟩
      refine ⟨i, ?_⟩
      rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff]
      simp only [FreshThirdQFiberThreeCarrierFiniteView.point,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point]
      exact congrArg Subtype.val
        (View.carrier.qFan.source_index_support Q.source₁
          (H.selectedAt Q.source₁.1
            Q.source₁.2).toCriticalFourShell.q_mem_support)
    · let i : Fin 4 := View.carrier.qFan.index
        ⟨Q.source₂.1, Q.source₂_mem_source₁_shell⟩
      refine ⟨i, ?_⟩
      rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff]
      simp only [FreshThirdQFiberThreeCarrierFiniteView.point,
        FreshThirdPinnedEndpointOutsideSeedFiniteView.point]
      exact congrArg Subtype.val
        (View.carrier.qFan.source_index_support Q.source₂
          Q.source₂_mem_source₁_shell)
  · rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff]
    intro hsame
    apply Boundary.centers_ne
    calc
      H.centerAt Boundary.source.1 Boundary.source.2 =
          View.carrier.qFan.blockerCenter View.carrier.boundaryIndex :=
        (View.carrier.boundary_blockerCenter_eq
          (P := P) (Pρ := Pρ)).symm
      _ = H.centerAt Q.source₁.1 Q.source₁.2 := by
        simpa [FreshThirdQFiberThreeCarrierFiniteView.point,
          FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hsame
  · intro i hi
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.hasFourAfterDeleting_ofView_iff]
    rcases View.carrier.nonboundary_deletionPacket
        (P := P) (Pρ := Pρ) hi with ⟨_, hcenter, _, hblocked, _, _⟩
    rw [hcenter] at hblocked
    simpa [FreshThirdQFiberThreeCarrierFiniteView.point,
      FreshThirdPinnedEndpointOutsideSeedFiniteView.point] using hblocked
  · rcases View.carrier.boundary_deletionPacket
      (P := P) (Pρ := Pρ) with ⟨cap, hcap, hblocked, hoverlap⟩
    refine ⟨⟨cap, ?_⟩, ?_, ?_⟩
    · rw [FreshThirdQFiberThreeCarrierFiniteAssignment.inCapInterior_ofView_iff]
      exact hcap
    · rw [FreshThirdQFiberThreeCarrierFiniteAssignment.hasFourAfterDeleting_ofView_iff]
      simpa [FreshThirdQFiberThreeCarrierFiniteView.point] using hblocked
    · intro e hall
      apply noThreeSourcesInRow_of_overlap_card_le_two
        View.carrier.qFan View.carrier.boundaryBlockerRow hoverlap e
      intro k
      exact
        (FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff
          (P := P) (Pρ := Pρ) View _ _).1 (hall k)
  · intro role
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff]
    constructor
    · intro hrole
      let i : Fin 4 := View.carrier.boundaryBlockerRowFan.index
        ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View role, hrole⟩
      refine ⟨i, ?_⟩
      rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff]
      exact congrArg Subtype.val
        (View.carrier.boundaryBlockerRowFan.source_index_support
          ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View role,
            FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier
              P Pρ View role⟩ hrole) |>.symm
    · rintro ⟨i, hi⟩
      rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff] at hi
      rw [hi]
      exact View.carrier.boundaryBlockerRowFan.source_mem_support i
  · rcases View.exists_boundaryRow_source_alias
      (P := P) (Pρ := Pρ) with ⟨i, hi⟩
    exact ⟨i,
      (FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff
        (P := P) (Pρ := Pρ) View _ _).2 hi⟩
  · intro i role
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff]
    constructor
    · intro hrole
      let j : Fin 4 := View.boundaryFanBlockerRowIndex i
        ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View role, hrole⟩
      refine ⟨j, ?_⟩
      rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff]
      simp [FreshThirdQFiberThreeCarrierFiniteView.point, j]
    · rintro ⟨j, hj⟩
      rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff] at hj
      rw [hj]
      exact (View.boundaryFanBlockerRowIndex i).symm j |>.2
  · intro i
    rcases View.carrier.boundaryBlockerRowFan.deletionPacket i with
      ⟨cap, hcap, hblocked, hsame | hdistinct⟩
    · refine ⟨cap, ?_, ?_, Or.inl ⟨?_, ?_, ?_⟩⟩
      · rw [FreshThirdQFiberThreeCarrierFiniteAssignment.inCapInterior_ofView_iff]
        exact hcap
      · rw [FreshThirdQFiberThreeCarrierFiniteAssignment.hasFourAfterDeleting_ofView_iff]
        simpa [FreshThirdQFiberThreeCarrierFiniteView.point] using hblocked
      · rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff]
        exact hsame.1.symm
      · rw [FreshThirdQFiberThreeCarrierFiniteAssignment.nonrobust_ofView_iff]
        exact hsame.2.2
      · intro role
        simp only [FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff]
        rw [FreshThirdQFiberThreeCarrierFiniteView.rowSupport,
          FreshThirdQFiberThreeCarrierFiniteView.rowSupport]
        exact Iff.of_eq (congrArg (fun support : Finset ℝ² ↦
          FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View role ∈ support)
            hsame.2.1.symm)
    · refine ⟨cap, ?_, ?_, Or.inr ⟨?_, ?_⟩⟩
      · rw [FreshThirdQFiberThreeCarrierFiniteAssignment.inCapInterior_ofView_iff]
        exact hcap
      · rw [FreshThirdQFiberThreeCarrierFiniteAssignment.hasFourAfterDeleting_ofView_iff]
        simpa [FreshThirdQFiberThreeCarrierFiniteView.point] using hblocked
      · rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff]
        exact hdistinct.1.symm
      · intro e hall
        apply noThreeSourcesInRow_of_overlap_card_le_two
          View.carrier.boundaryBlockerRowFan
          ((View.carrier.boundaryBlockerRowFan.blockerRow i
            ).toCriticalFourShell.toSelectedFourClass)
          hdistinct.2 e
        intro k
        exact
          (FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff
            (P := P) (Pρ := Pρ) View _ _).1 (hall k)

/-- The exact combined assignment satisfies equality congruence for every
solver-visible predicate. -/
theorem relationalTheory_ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary) :
    RelationalTheory
      (FreshThirdQFiberThreeCarrierFiniteAssignment.ofView P Pρ View) := by
  refine {
    same_refl := ?_
    same_symm := ?_
    same_trans := ?_
    incident_congr := ?_
    inCap_congr := ?_
    inCapInterior_congr := ?_
    interior_in_cap := ?_
    interior_not_in_other_cap := ?_
    before_congr := ?_
    before_irrefl := ?_
    before_trans := ?_
    before_or_same_or_after := ?_
    sameDistanceFrom_congr := ?_
    sameDistanceFrom_refl := ?_
    sameDistanceFrom_symm := ?_
    sameDistanceFrom_trans := ?_
    hasFourAfterDeleting_congr := ?_
    blocked_deletion_nonrobust := ?_
    nonrobust_congr := ?_ }
  · intro point
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff]
  · intro left right hsame
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff] at hsame ⊢
    exact hsame.symm
  · intro left middle right hleft hright
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff] at hleft hright ⊢
    exact hleft.trans hright
  · intro left right row hsame
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff] at hsame
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff,
      FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff]
    rw [hsame]
  · intro left right cap hsame
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff] at hsame
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.inCap_ofView_iff,
      FreshThirdQFiberThreeCarrierFiniteAssignment.inCap_ofView_iff]
    rw [hsame]
  · intro left right cap hsame
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff] at hsame
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.inCapInterior_ofView_iff,
      FreshThirdQFiberThreeCarrierFiniteAssignment.inCapInterior_ofView_iff]
    rw [hsame]
  · intro point cap hInterior
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.inCap_ofView_iff]
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.inCapInterior_ofView_iff]
      at hInterior
    exact S.capInteriorByIndex_subset_capByIndex cap hInterior
  · intro point firstCap secondCap hInterior hne hCap
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.inCapInterior_ofView_iff]
      at hInterior
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.inCap_ofView_iff] at hCap
    exact S.capInteriorByIndex_not_mem_capByIndex_of_ne hInterior hne hCap
  · intro left left' right right' hleft hright
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff] at hleft hright
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.before_ofView_iff,
      FreshThirdQFiberThreeCarrierFiniteAssignment.before_ofView_iff]
    have hleftIndex :
        B.indexOf
            ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View left,
              FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier
                P Pρ View left⟩ =
          B.indexOf
            ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View left',
              FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier
                P Pρ View left'⟩ :=
      congrArg B.indexOf (Subtype.ext hleft)
    have hrightIndex :
        B.indexOf
            ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View right,
              FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier
                P Pρ View right⟩ =
          B.indexOf
            ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View right',
              FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier
                P Pρ View right'⟩ :=
      congrArg B.indexOf (Subtype.ext hright)
    rw [hleftIndex, hrightIndex]
  · intro point
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.before_ofView_iff]
    exact lt_irrefl _
  · intro left middle right hleft hright
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.before_ofView_iff] at hleft hright ⊢
    exact lt_trans hleft hright
  · intro left right
    let leftPoint : D.A :=
      ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View left,
        FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier P Pρ View left⟩
    let rightPoint : D.A :=
      ⟨FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View right,
        FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier P Pρ View right⟩
    rcases lt_trichotomy (B.indexOf leftPoint) (B.indexOf rightPoint) with
      hlt | heq | hgt
    · left
      rw [FreshThirdQFiberThreeCarrierFiniteAssignment.before_ofView_iff]
      exact hlt
    · right
      left
      rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff]
      calc
        FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View left =
            B.boundary (B.indexOf leftPoint) := by
          simpa [leftPoint] using (B.point_eq leftPoint).symm
        _ = B.boundary (B.indexOf rightPoint) := congrArg B.boundary heq
        _ = FreshThirdQFiberThreeCarrierFiniteView.point P Pρ View right := by
          simpa [rightPoint] using B.point_eq rightPoint
    · right
      right
      rw [FreshThirdQFiberThreeCarrierFiniteAssignment.before_ofView_iff]
      exact hgt
  · intro centerRole centerRole' left left' right right'
      hcenter hleft hright
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff] at hcenter hleft hright
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.sameDistanceFrom_ofView_iff,
      FreshThirdQFiberThreeCarrierFiniteAssignment.sameDistanceFrom_ofView_iff]
    rw [hcenter, hleft, hright]
  · intro centerRole point
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.sameDistanceFrom_ofView_iff]
  · intro centerRole left right
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.sameDistanceFrom_ofView_iff,
      FreshThirdQFiberThreeCarrierFiniteAssignment.sameDistanceFrom_ofView_iff]
    exact eq_comm
  · intro centerRole left middle right hleft hright
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.sameDistanceFrom_ofView_iff]
      at hleft hright ⊢
    exact hleft.trans hright
  · intro deleted deleted' atCenter atCenter' hdeleted hcenter
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff] at hdeleted hcenter
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.hasFourAfterDeleting_ofView_iff,
      FreshThirdQFiberThreeCarrierFiniteAssignment.hasFourAfterDeleting_ofView_iff]
    rw [hdeleted, hcenter]
  · intro deleted atCenter hblocked
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.nonrobust_ofView_iff]
    intro hrobust
    apply hblocked
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.hasFourAfterDeleting_ofView_iff]
    exact hrobust.survives _
      (FreshThirdQFiberThreeCarrierFiniteView.point_mem_carrier
        P Pρ View deleted)
  · intro left right hsame
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff] at hsame
    rw [FreshThirdQFiberThreeCarrierFiniteAssignment.nonrobust_ofView_iff,
      FreshThirdQFiberThreeCarrierFiniteAssignment.nonrobust_ofView_iff]
    rw [hsame]

/-- The complete combined query has an arbitrary-cardinality ingress from
every exact live packet and exact-three boundary witness. -/
theorem completeSourceTheory_ofView
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    {Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap}
    {G : TriApexAllLargeContext D S}
    {Boundary : FreshThirdQFiberThreeBoundary P Pρ Q}
    (View : FreshThirdQFiberThreeCarrierFiniteView P Pρ Packet G Boundary) :
    CompleteSourceTheory (Configuration.ofView P Pρ View) := by
  refine {
    pinned := ?_
    carrier := sourceTheory_ofView P Pρ View
    bridge := ?_
    relational := relationalTheory_ofView P Pρ View
    rowTheory := FreshThirdQFiberThreeCarrierFiniteRowTheory.ofView P Pρ View }
  · exact FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory.ofView
      (P := P) (Pρ := Pρ) View.pinned
  · refine {
      same := ?_
      incident := ?_
      inCap := ?_
      inCapInterior := ?_
      before := ?_
      sameDistanceFrom := ?_
      hasFourAfterDeleting := ?_
      nonrobust := ?_ }
    · intro left right
      simp only [Configuration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdQFiberThreeCarrierFiniteAssignment.same_ofView_iff,
        FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.same_ofView_iff]
      rfl
    · intro point row
      simp only [Configuration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdQFiberThreeCarrierFiniteAssignment.incident_ofView_iff,
        FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.incident_ofView_iff]
      rfl
    · intro point cap
      simp only [Configuration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdQFiberThreeCarrierFiniteAssignment.inCap_ofView_iff,
        FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCap_ofView_iff]
      rfl
    · intro point cap
      simp only [Configuration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdQFiberThreeCarrierFiniteAssignment.inCapInterior_ofView_iff,
        FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.inCapInterior_ofView_iff]
      rfl
    · intro left right
      simp only [Configuration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdQFiberThreeCarrierFiniteAssignment.before_ofView_iff,
        FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.before_ofView_iff]
      rfl
    · intro centerRole left right
      simp only [Configuration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdQFiberThreeCarrierFiniteAssignment.sameDistanceFrom_ofView_iff,
        FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.sameDistanceFrom_ofView_iff]
      rfl
    · intro deleted atCenter
      simp only [Configuration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdQFiberThreeCarrierFiniteAssignment.hasFourAfterDeleting_ofView_iff,
        FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.hasFourAfterDeleting_ofView_iff]
      rfl
    · intro centerRole
      simp only [Configuration.ofView,
        FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration.ofView,
        FreshThirdQFiberThreeCarrierFiniteAssignment.nonrobust_ofView_iff,
        FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.nonrobust_ofView_iff]
      rfl

/-- Packet-independent replay contract for the complete carrier query. -/
structure QueryContract : Prop where
  reject : ∀ Config : Configuration, CompleteSourceTheory Config → False

/-- A replayed complete carrier-query certificate rejects the actual
arbitrary-cardinality packet in the exact-three branch. -/
theorem FreshThirdQFiberThreeBoundary.false_of_carrierFiniteQueryContract
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (G : TriApexAllLargeContext D S)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    (Pinned : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (Contract : QueryContract) : False := by
  let View := FreshThirdQFiberThreeCarrierFiniteView.ofPacketBoundary
    P Pρ Packet G Boundary Pinned
  exact Contract.reject (Configuration.ofView P Pρ View)
    (completeSourceTheory_ofView P Pρ View)

end

end FreshThirdQFiberThreeCarrierFiniteView

/-- Public name for the complete carrier-query replay contract. -/
abbrev FreshThirdQFiberThreeCarrierQueryContract :=
  FreshThirdQFiberThreeCarrierFiniteView.QueryContract

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

/-- Public exact-three replay adapter for the complete carrier query. -/
theorem FreshThirdQFiberThreeBoundary.false_of_carrierFiniteQueryContract
    {C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}
    {B : BoundaryIndexing D.A} {qOutside qBetween : Fin B.n}
    {center : ℝ²} {id : Fin B.n}
    {DRow : SelectedFourClass D.A (B.boundary id)}
    {freshCap rowCap : Fin 3}
    (Packet : FreshThirdPinnedEndpointOutsideSeedQueryPacket
      P Pρ C Q B qOutside qBetween center id DRow freshCap rowCap)
    (G : TriApexAllLargeContext D S)
    (Boundary : FreshThirdQFiberThreeBoundary P Pρ Q)
    (Pinned : FreshThirdPinnedEndpointOutsideSeedFiniteView P Pρ Packet)
    (Contract : FreshThirdQFiberThreeCarrierQueryContract) : False :=
  FreshThirdQFiberThreeCarrierFiniteView.FreshThirdQFiberThreeBoundary.false_of_carrierFiniteQueryContract
    P Pρ Packet G Boundary Pinned Contract

end

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
