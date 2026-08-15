/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitSourceTotalFiniteAssignment

/-!
# Retained-source finite context for the FreshThird FirstNonHit branch

This module projects the retained-pair hypotheses of the active FirstNonHit branch onto the
complete finite carrier assignment.  It keeps exact distance classes, cap-interior membership,
blocker relations, mutual selected-class omissions, and one-deletion survival.  The tri-apex
residual `T` is deliberately absent: none of these consequences, nor the carrier lower bound in
the underlying assignment, uses it.

The exact deleted-row witnesses stored in the common-deletion packets are not copied into this
context.  Their one-deletion survival and center data are already expressed by
`hasFourAfterDeleting`, so copying the witnesses would introduce unnecessary finite variables.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailLargeOppositeCapsBiApexSurface
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

namespace TwoSourceExactCollisionRowsTerminal

noncomputable section

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
    {C : TwoCapSourceThirdCanonicalRowSurface P Pρ}
    {Q : FreshThirdBlockerFiber P Pρ}

/-- Carrier indices at the same first-apex distance as one named reference point. -/
noncomputable def firstApexDistanceClassIndices
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (reference : FirstNonHitNamedRole) : Finset (Fin A.boundary.n) :=
  Finset.univ.filter fun x ↦
    A.radiusEq (A.roleIndex .firstApex) x (A.roleIndex reference)

/-- Carrier indices in the strict interior of the first opposite cap. -/
noncomputable def firstOppositeCapInteriorIndices
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) :
    Finset (Fin A.boundary.n) :=
  Finset.univ.filter fun x ↦ A.inCapInterior x S.oppIndex1

private theorem oppApex1_eq_namedFirstApex
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) :
    S.oppApex1 = FirstNonHitNamedRole.point P Pρ C Q .firstApex := by
  change S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem mem_firstApexDistanceClassIndices_iff
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (reference : FirstNonHitNamedRole) {d : ℝ}
    (hreference :
      FirstNonHitNamedRole.point P Pρ C Q reference ∈
        SelectedClass D.A S.oppApex1 d)
    (i : Fin A.boundary.n) :
    i ∈ firstApexDistanceClassIndices P Pρ A reference ↔
      A.boundary.boundary i ∈ SelectedClass D.A S.oppApex1 d := by
  simp only [firstApexDistanceClassIndices, Finset.mem_filter, Finset.mem_univ,
    true_and]
  rw [A.radiusEq_iff, A.roleIndex_point_eq .firstApex,
    A.roleIndex_point_eq reference, ← oppApex1_eq_namedFirstApex P Pρ C Q]
  constructor
  · intro hdist
    exact mem_selectedClass.mpr
      ⟨A.boundary_mem i, hdist.trans (mem_selectedClass.mp hreference).2⟩
  · intro hi
    exact (mem_selectedClass.mp hi).2.trans (mem_selectedClass.mp hreference).2.symm

private theorem firstApexDistanceClassIndices_image_eq
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (reference : FirstNonHitNamedRole) {d : ℝ}
    (hreference :
      FirstNonHitNamedRole.point P Pρ C Q reference ∈
        SelectedClass D.A S.oppApex1 d) :
    (firstApexDistanceClassIndices P Pρ A reference).image A.boundary.boundary =
      SelectedClass D.A S.oppApex1 d := by
  ext x
  constructor
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
    exact (mem_firstApexDistanceClassIndices_iff P Pρ A reference hreference i).mp hi
  · intro hx
    have hxImage : x ∈ Finset.univ.image A.boundary.boundary := by
      rw [A.boundary.boundary_image]
      exact (mem_selectedClass.mp hx).1
    rcases Finset.mem_image.mp hxImage with ⟨i, _hi, rfl⟩
    exact Finset.mem_image.mpr
      ⟨i,
        (mem_firstApexDistanceClassIndices_iff P Pρ A reference hreference i).mpr hx,
        rfl⟩

private theorem firstApexDistanceClassIndices_card_eq
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (reference : FirstNonHitNamedRole) {d : ℝ}
    (hreference :
      FirstNonHitNamedRole.point P Pρ C Q reference ∈
        SelectedClass D.A S.oppApex1 d)
    (hcard : (SelectedClass D.A S.oppApex1 d).card = 4) :
    (firstApexDistanceClassIndices P Pρ A reference).card = 4 := by
  calc
    (firstApexDistanceClassIndices P Pρ A reference).card =
        ((firstApexDistanceClassIndices P Pρ A reference).image
          A.boundary.boundary).card :=
      (Finset.card_image_of_injective _ A.boundary.boundary_injective).symm
    _ = (SelectedClass D.A S.oppApex1 d).card :=
      congrArg Finset.card
        (firstApexDistanceClassIndices_image_eq P Pρ A reference hreference)
    _ = 4 := hcard

@[simp] private theorem mem_firstOppositeCapInteriorIndices_iff
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (i : Fin A.boundary.n) :
    i ∈ firstOppositeCapInteriorIndices P Pρ A ↔
      A.boundary.boundary i ∈ S.capInteriorByIndex S.oppIndex1 := by
  simp [firstOppositeCapInteriorIndices, A.inCapInterior_iff]

private theorem distanceClass_inter_firstInterior_eq_pair
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (reference left right : FirstNonHitNamedRole) {d : ℝ}
    (hreference :
      FirstNonHitNamedRole.point P Pρ C Q reference ∈
        SelectedClass D.A S.oppApex1 d)
    (hinterior :
      SelectedClass D.A S.oppApex1 d ∩ S.capInteriorByIndex S.oppIndex1 =
        {FirstNonHitNamedRole.point P Pρ C Q left,
          FirstNonHitNamedRole.point P Pρ C Q right}) :
    firstApexDistanceClassIndices P Pρ A reference ∩
        firstOppositeCapInteriorIndices P Pρ A =
      {A.roleIndex left, A.roleIndex right} := by
  ext i
  constructor
  · intro hi
    have hpoint :
        A.boundary.boundary i ∈
          SelectedClass D.A S.oppApex1 d ∩ S.capInteriorByIndex S.oppIndex1 :=
      Finset.mem_inter.mpr
        ⟨(mem_firstApexDistanceClassIndices_iff P Pρ A reference hreference i).mp
            (Finset.mem_inter.mp hi).1,
          (mem_firstOppositeCapInteriorIndices_iff P Pρ A i).mp
            (Finset.mem_inter.mp hi).2⟩
    rw [hinterior] at hpoint
    rcases Finset.mem_insert.mp hpoint with hleft | hright
    · exact Finset.mem_insert.mpr <| Or.inl <| A.boundary.boundary_injective <|
        hleft.trans (A.roleIndex_point_eq left).symm
    · exact Finset.mem_insert.mpr <| Or.inr <|
        Finset.mem_singleton.mpr <| A.boundary.boundary_injective <|
          (Finset.mem_singleton.mp hright).trans (A.roleIndex_point_eq right).symm
  · intro hi
    have hpoint :
        A.boundary.boundary i = FirstNonHitNamedRole.point P Pρ C Q left ∨
          A.boundary.boundary i = FirstNonHitNamedRole.point P Pρ C Q right := by
      rcases Finset.mem_insert.mp hi with hleft | hright
      · exact Or.inl <|
          (congrArg A.boundary.boundary hleft).trans (A.roleIndex_point_eq left)
      · exact Or.inr <|
          (congrArg A.boundary.boundary (Finset.mem_singleton.mp hright)).trans
            (A.roleIndex_point_eq right)
    have hpointMem :
        A.boundary.boundary i ∈
          SelectedClass D.A S.oppApex1 d ∩ S.capInteriorByIndex S.oppIndex1 := by
      rw [hinterior]
      rcases hpoint with hleft | hright
      · exact Finset.mem_insert.mpr (Or.inl hleft)
      · exact Finset.mem_insert.mpr (Or.inr (Finset.mem_singleton.mpr hright))
    exact Finset.mem_inter.mpr
      ⟨(mem_firstApexDistanceClassIndices_iff P Pρ A reference hreference i).mpr
          (Finset.mem_inter.mp hpointMem).1,
        (mem_firstOppositeCapInteriorIndices_iff P Pρ A i).mpr
          (Finset.mem_inter.mp hpointMem).2⟩

private theorem radiusEq_eq_false_of_distinct_classes
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (left right : FirstNonHitNamedRole) {leftRadius rightRadius : ℝ}
    (hleft :
      FirstNonHitNamedRole.point P Pρ C Q left ∈
        SelectedClass D.A S.oppApex1 leftRadius)
    (hright :
      FirstNonHitNamedRole.point P Pρ C Q right ∈
        SelectedClass D.A S.oppApex1 rightRadius)
    (hradii : rightRadius ≠ leftRadius) :
    A.radiusEq (A.roleIndex .firstApex) (A.roleIndex left) (A.roleIndex right) =
      false := by
  apply Bool.eq_false_iff.mpr
  intro htrue
  have hdist := (A.radiusEq_iff _ _ _).mp htrue
  rw [A.roleIndex_point_eq .firstApex, A.roleIndex_point_eq left,
    A.roleIndex_point_eq right, ← oppApex1_eq_namedFirstApex P Pρ C Q] at hdist
  apply hradii
  exact (mem_selectedClass.mp hright).2.symm.trans <|
    hdist.symm.trans (mem_selectedClass.mp hleft).2

private theorem roleIndex_ne_of_point_ne
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (left right : FirstNonHitNamedRole)
    (hne : FirstNonHitNamedRole.point P Pρ C Q left ≠
      FirstNonHitNamedRole.point P Pρ C Q right) :
    A.roleIndex left ≠ A.roleIndex right := by
  intro hindices
  apply hne
  calc
    FirstNonHitNamedRole.point P Pρ C Q left =
        A.boundary.boundary (A.roleIndex left) := (A.roleIndex_point_eq left).symm
    _ = A.boundary.boundary (A.roleIndex right) := congrArg _ hindices
    _ = FirstNonHitNamedRole.point P Pρ C Q right := A.roleIndex_point_eq right

private theorem blockerMap_role_point_eq
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (role : FirstNonHitNamedRole) :
    A.boundary.boundary (A.blockerMap (A.roleIndex role)) =
      H.centerAt (FirstNonHitNamedRole.point P Pρ C Q role)
        (FirstNonHitNamedRole.point_mem P Pρ C Q role) := by
  simpa only [A.roleIndex_point_eq] using A.blockerMap_point_eq (A.roleIndex role)

private theorem blockerMap_index_point_eq
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (i : Fin A.boundary.n) {x : ℝ²} (hx : x ∈ D.A)
    (hpoint : A.boundary.boundary i = x) :
    A.boundary.boundary (A.blockerMap i) = H.centerAt x hx := by
  simpa only [hpoint] using A.blockerMap_point_eq i

private theorem row_mem_iff_index_point
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (source item : Fin A.boundary.n) {x : ℝ²} (hx : x ∈ D.A)
    (hsource : A.boundary.boundary source = x) :
    item ∈ A.row source ↔
      A.boundary.boundary item ∈
        (H.selectedAt x hx).toCriticalFourShell.support := by
  rw [A.row_mem_iff]
  subst x
  rfl

/-- Exact finite consequences of the retained two-radius and mutual-omission context.

This is a sound relaxation of the active leaf context because it deliberately omits `T`; every
field below is derived without the tri-apex residual. -/
structure FirstNonHitCompleteFiniteSourceTheoryContext
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q) where
  firstRetainedDistanceClass_card :
    (firstApexDistanceClassIndices P Pρ A .firstRetainedSourceOne).card = 4
  secondRetainedDistanceClass_card :
    (firstApexDistanceClassIndices P Pρ A .secondRetainedSourceOne).card = 4
  firstRetainedDistanceClass_interior :
    firstApexDistanceClassIndices P Pρ A .firstRetainedSourceOne ∩
        firstOppositeCapInteriorIndices P Pρ A =
      {A.roleIndex .firstRetainedSourceOne, A.roleIndex .firstRetainedSourceTwo}
  secondRetainedDistanceClass_interior :
    firstApexDistanceClassIndices P Pρ A .secondRetainedSourceOne ∩
        firstOppositeCapInteriorIndices P Pρ A =
      {A.roleIndex .secondRetainedSourceOne, A.roleIndex .secondRetainedSourceTwo}
  firstOne_secondOne_radius_ne :
    A.radiusEq (A.roleIndex .firstApex) (A.roleIndex .firstRetainedSourceOne)
      (A.roleIndex .secondRetainedSourceOne) = false
  firstOne_secondTwo_radius_ne :
    A.radiusEq (A.roleIndex .firstApex) (A.roleIndex .firstRetainedSourceOne)
      (A.roleIndex .secondRetainedSourceTwo) = false
  firstTwo_secondOne_radius_ne :
    A.radiusEq (A.roleIndex .firstApex) (A.roleIndex .firstRetainedSourceTwo)
      (A.roleIndex .secondRetainedSourceOne) = false
  firstTwo_secondTwo_radius_ne :
    A.radiusEq (A.roleIndex .firstApex) (A.roleIndex .firstRetainedSourceTwo)
      (A.roleIndex .secondRetainedSourceTwo) = false
  firstOne_ne_secondOne :
    A.roleIndex .firstRetainedSourceOne ≠ A.roleIndex .secondRetainedSourceOne
  firstOne_ne_secondTwo :
    A.roleIndex .firstRetainedSourceOne ≠ A.roleIndex .secondRetainedSourceTwo
  firstTwo_ne_secondOne :
    A.roleIndex .firstRetainedSourceTwo ≠ A.roleIndex .secondRetainedSourceOne
  firstTwo_ne_secondTwo :
    A.roleIndex .firstRetainedSourceTwo ≠ A.roleIndex .secondRetainedSourceTwo
  firstRetainedBlockers_eq :
    A.blockerMap (A.roleIndex .firstRetainedSourceOne) =
      A.blockerMap (A.roleIndex .firstRetainedSourceTwo)
  secondRetainedBlockers_eq :
    A.blockerMap (A.roleIndex .secondRetainedSourceOne) =
      A.blockerMap (A.roleIndex .secondRetainedSourceTwo)
  retainedBlockers_ne :
    A.blockerMap (A.roleIndex .secondRetainedSourceOne) ≠
      A.blockerMap (A.roleIndex .firstRetainedSourceOne)
  firstPairFresh : Fin A.boundary.n
  firstPairFresh_eq : firstPairFresh = A.roleIndex .secondRetainedSourceOne
  firstPairCollisionSource : Fin A.boundary.n
  firstPairCollisionSource_eq :
    firstPairCollisionSource = A.roleIndex .firstRetainedSourceOne ∨
      firstPairCollisionSource = A.roleIndex .firstRetainedSourceTwo
  firstPairFresh_not_mem_collisionSource_class :
    firstPairFresh ∉ A.row firstPairCollisionSource
  firstPairCollisionSource_not_mem_fresh_class :
    firstPairCollisionSource ∉ A.row firstPairFresh
  firstPairCollisionSource_blocker_eq :
    A.blockerMap firstPairCollisionSource =
      A.blockerMap (A.roleIndex .firstRetainedSourceOne)
  firstPairBlockers_ne :
    A.blockerMap firstPairCollisionSource ≠ A.blockerMap firstPairFresh
  firstPairFresh_apex_survives :
    A.hasFourAfterDeleting firstPairFresh (A.roleIndex .firstApex) = true
  firstPairFresh_collisionBlocker_survives :
    A.hasFourAfterDeleting firstPairFresh (A.blockerMap firstPairCollisionSource) = true
  firstPairCollisionSource_apex_survives :
    A.hasFourAfterDeleting firstPairCollisionSource (A.roleIndex .firstApex) = true
  firstPairCollisionSource_freshBlocker_survives :
    A.hasFourAfterDeleting firstPairCollisionSource (A.blockerMap firstPairFresh) = true
  secondPairFresh : Fin A.boundary.n
  secondPairFresh_eq : secondPairFresh = A.roleIndex .firstRetainedSourceOne
  secondPairCollisionSource : Fin A.boundary.n
  secondPairCollisionSource_eq :
    secondPairCollisionSource = A.roleIndex .secondRetainedSourceOne ∨
      secondPairCollisionSource = A.roleIndex .secondRetainedSourceTwo
  secondPairFresh_not_mem_collisionSource_class :
    secondPairFresh ∉ A.row secondPairCollisionSource
  secondPairCollisionSource_not_mem_fresh_class :
    secondPairCollisionSource ∉ A.row secondPairFresh
  secondPairCollisionSource_blocker_eq :
    A.blockerMap secondPairCollisionSource =
      A.blockerMap (A.roleIndex .secondRetainedSourceOne)
  secondPairBlockers_ne :
    A.blockerMap secondPairCollisionSource ≠ A.blockerMap secondPairFresh
  secondPairFresh_apex_survives :
    A.hasFourAfterDeleting secondPairFresh (A.roleIndex .firstApex) = true
  secondPairFresh_collisionBlocker_survives :
    A.hasFourAfterDeleting secondPairFresh (A.blockerMap secondPairCollisionSource) = true
  secondPairCollisionSource_apex_survives :
    A.hasFourAfterDeleting secondPairCollisionSource (A.roleIndex .firstApex) = true
  secondPairCollisionSource_freshBlocker_survives :
    A.hasFourAfterDeleting secondPairCollisionSource (A.blockerMap secondPairFresh) = true

namespace FirstNonHitCompleteFiniteSourceTheoryContext

/-- Construct the exact retained finite context from the active FirstNonHit leaf hypotheses. -/
noncomputable def ofSource
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)
    (hρne : ρ ≠ radius)
    (hfrontierFour : (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hρfour : (SelectedClass D.A S.oppApex1 ρ).card = 4)
    (hfrontierInteriorEq :
      SelectedClass D.A S.oppApex1 radius ∩ S.capInteriorByIndex S.oppIndex1 =
        {P.source₁, P.source₂})
    (hρInteriorEq :
      SelectedClass D.A S.oppApex1 ρ ∩ S.capInteriorByIndex S.oppIndex1 =
        {Pρ.source₁, Pρ.source₂})
    (hpairsDisjoint :
      Disjoint ({P.source₁, P.source₂} : Finset ℝ²) {Pρ.source₁, Pρ.source₂})
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP) :
    FirstNonHitCompleteFiniteSourceTheoryContext P Pρ A := by
  classical
  let p₁ := A.roleIndex .firstRetainedSourceOne
  let p₂ := A.roleIndex .firstRetainedSourceTwo
  let pρ₁ := A.roleIndex .secondRetainedSourceOne
  let pρ₂ := A.roleIndex .secondRetainedSourceTwo
  let apex := A.roleIndex .firstApex
  let firstFresh := A.boundary.indexOf ⟨LPρ.fresh, LPρ.packet.q_mem_A⟩
  let firstCollision :=
    A.boundary.indexOf ⟨MPρ.collisionSource, MPρ.collisionSource_mem_A⟩
  let secondFresh := A.boundary.indexOf ⟨LP.fresh, LP.packet.q_mem_A⟩
  let secondCollision :=
    A.boundary.indexOf ⟨MP.collisionSource, MP.collisionSource_mem_A⟩
  have hp₁Point : A.boundary.boundary p₁ = P.source₁ := by
    simpa [p₁, FirstNonHitNamedRole.point] using
      A.roleIndex_point_eq .firstRetainedSourceOne
  have hp₂Point : A.boundary.boundary p₂ = P.source₂ := by
    simpa [p₂, FirstNonHitNamedRole.point] using
      A.roleIndex_point_eq .firstRetainedSourceTwo
  have hpρ₁Point : A.boundary.boundary pρ₁ = Pρ.source₁ := by
    simpa [pρ₁, FirstNonHitNamedRole.point] using
      A.roleIndex_point_eq .secondRetainedSourceOne
  have hpρ₂Point : A.boundary.boundary pρ₂ = Pρ.source₂ := by
    simpa [pρ₂, FirstNonHitNamedRole.point] using
      A.roleIndex_point_eq .secondRetainedSourceTwo
  have hapexPoint : A.boundary.boundary apex = S.oppApex1 := by
    calc
      A.boundary.boundary apex =
          FirstNonHitNamedRole.point P Pρ C Q .firstApex := by
        simpa [apex] using A.roleIndex_point_eq .firstApex
      _ = S.oppApex1 := (oppApex1_eq_namedFirstApex P Pρ C Q).symm
  have hfirstFreshPoint : A.boundary.boundary firstFresh = LPρ.fresh := by
    simpa [firstFresh, pointOf] using
      A.boundary.point_eq ⟨LPρ.fresh, LPρ.packet.q_mem_A⟩
  have hfirstCollisionPoint :
      A.boundary.boundary firstCollision = MPρ.collisionSource := by
    simpa [firstCollision, pointOf] using
      A.boundary.point_eq ⟨MPρ.collisionSource, MPρ.collisionSource_mem_A⟩
  have hsecondFreshPoint : A.boundary.boundary secondFresh = LP.fresh := by
    simpa [secondFresh, pointOf] using
      A.boundary.point_eq ⟨LP.fresh, LP.packet.q_mem_A⟩
  have hsecondCollisionPoint :
      A.boundary.boundary secondCollision = MP.collisionSource := by
    simpa [secondCollision, pointOf] using
      A.boundary.point_eq ⟨MP.collisionSource, MP.collisionSource_mem_A⟩
  have hfirstFreshEq : firstFresh = pρ₁ := by
    apply A.boundary.boundary_injective
    rw [hfirstFreshPoint, hpρ₁Point]
    exact hLPρ
  have hsecondFreshEq : secondFresh = p₁ := by
    apply A.boundary.boundary_injective
    rw [hsecondFreshPoint, hp₁Point]
    exact hLP
  have hfirstCollisionEq : firstCollision = p₁ ∨ firstCollision = p₂ := by
    rcases MPρ.collisionSource_eq with hsource | hsource
    · apply Or.inl
      apply A.boundary.boundary_injective
      rw [hfirstCollisionPoint, hp₁Point]
      exact hsource
    · apply Or.inr
      apply A.boundary.boundary_injective
      rw [hfirstCollisionPoint, hp₂Point]
      exact hsource
  have hsecondCollisionEq : secondCollision = pρ₁ ∨ secondCollision = pρ₂ := by
    rcases MP.collisionSource_eq with hsource | hsource
    · apply Or.inl
      apply A.boundary.boundary_injective
      rw [hsecondCollisionPoint, hpρ₁Point]
      exact hsource
    · apply Or.inr
      apply A.boundary.boundary_injective
      rw [hsecondCollisionPoint, hpρ₂Point]
      exact hsource
  have hfirstCollisionBlockerPoint :
      A.boundary.boundary (A.blockerMap firstCollision) =
        H.centerAt MPρ.collisionSource MPρ.collisionSource_mem_A :=
    blockerMap_index_point_eq P Pρ A firstCollision MPρ.collisionSource_mem_A
      hfirstCollisionPoint
  have hfirstFreshBlockerPoint :
      A.boundary.boundary (A.blockerMap firstFresh) =
        H.centerAt LPρ.fresh LPρ.packet.q_mem_A :=
    blockerMap_index_point_eq P Pρ A firstFresh LPρ.packet.q_mem_A hfirstFreshPoint
  have hsecondCollisionBlockerPoint :
      A.boundary.boundary (A.blockerMap secondCollision) =
        H.centerAt MP.collisionSource MP.collisionSource_mem_A :=
    blockerMap_index_point_eq P Pρ A secondCollision MP.collisionSource_mem_A
      hsecondCollisionPoint
  have hsecondFreshBlockerPoint :
      A.boundary.boundary (A.blockerMap secondFresh) =
        H.centerAt LP.fresh LP.packet.q_mem_A :=
    blockerMap_index_point_eq P Pρ A secondFresh LP.packet.q_mem_A hsecondFreshPoint
  have hP₁Class :
      FirstNonHitNamedRole.point P Pρ C Q .firstRetainedSourceOne ∈
        SelectedClass D.A S.oppApex1 radius := by
    simpa [FirstNonHitNamedRole.point] using P.source₁_mem_radius
  have hP₂Class :
      FirstNonHitNamedRole.point P Pρ C Q .firstRetainedSourceTwo ∈
        SelectedClass D.A S.oppApex1 radius := by
    simpa [FirstNonHitNamedRole.point] using P.source₂_mem_radius
  have hPρ₁Class :
      FirstNonHitNamedRole.point P Pρ C Q .secondRetainedSourceOne ∈
        SelectedClass D.A S.oppApex1 ρ := by
    simpa [FirstNonHitNamedRole.point] using Pρ.source₁_mem_radius
  have hPρ₂Class :
      FirstNonHitNamedRole.point P Pρ C Q .secondRetainedSourceTwo ∈
        SelectedClass D.A S.oppApex1 ρ := by
    simpa [FirstNonHitNamedRole.point] using Pρ.source₂_mem_radius
  have hPInterior :
      SelectedClass D.A S.oppApex1 radius ∩ S.capInteriorByIndex S.oppIndex1 =
        {FirstNonHitNamedRole.point P Pρ C Q .firstRetainedSourceOne,
          FirstNonHitNamedRole.point P Pρ C Q .firstRetainedSourceTwo} := by
    simpa [FirstNonHitNamedRole.point] using hfrontierInteriorEq
  have hPρInterior :
      SelectedClass D.A S.oppApex1 ρ ∩ S.capInteriorByIndex S.oppIndex1 =
        {FirstNonHitNamedRole.point P Pρ C Q .secondRetainedSourceOne,
          FirstNonHitNamedRole.point P Pρ C Q .secondRetainedSourceTwo} := by
    simpa [FirstNonHitNamedRole.point] using hρInteriorEq
  have hP₁Pρ₁ : P.source₁ ≠ Pρ.source₁ := by
    intro heq
    have hleft : P.source₁ ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by simp
    have hright : P.source₁ ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) := by
      rw [heq]
      simp
    exact (Finset.disjoint_left.mp hpairsDisjoint) hleft hright
  have hP₁Pρ₂ : P.source₁ ≠ Pρ.source₂ := by
    intro heq
    have hleft : P.source₁ ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by simp
    have hright : P.source₁ ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) := by
      rw [heq]
      simp
    exact (Finset.disjoint_left.mp hpairsDisjoint) hleft hright
  have hP₂Pρ₁ : P.source₂ ≠ Pρ.source₁ := by
    intro heq
    have hleft : P.source₂ ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by simp
    have hright : P.source₂ ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) := by
      rw [heq]
      simp
    exact (Finset.disjoint_left.mp hpairsDisjoint) hleft hright
  have hP₂Pρ₂ : P.source₂ ≠ Pρ.source₂ := by
    intro heq
    have hleft : P.source₂ ∈ ({P.source₁, P.source₂} : Finset ℝ²) := by simp
    have hright : P.source₂ ∈ ({Pρ.source₁, Pρ.source₂} : Finset ℝ²) := by
      rw [heq]
      simp
    exact (Finset.disjoint_left.mp hpairsDisjoint) hleft hright
  have hfirstRetainedBlockers :
      A.blockerMap p₁ = A.blockerMap p₂ := by
    apply A.boundary.boundary_injective
    calc
      A.boundary.boundary (A.blockerMap p₁) =
          H.centerAt P.source₁ P.source₁_mem_A := by
        simpa [p₁, FirstNonHitNamedRole.point] using
          blockerMap_role_point_eq P Pρ A .firstRetainedSourceOne
      _ = H.centerAt P.source₂ P.source₂_mem_A := P.blockers_eq
      _ = A.boundary.boundary (A.blockerMap p₂) := by
        symm
        simpa [p₂, FirstNonHitNamedRole.point] using
          blockerMap_role_point_eq P Pρ A .firstRetainedSourceTwo
  have hsecondRetainedBlockers :
      A.blockerMap pρ₁ = A.blockerMap pρ₂ := by
    apply A.boundary.boundary_injective
    calc
      A.boundary.boundary (A.blockerMap pρ₁) =
          H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
        simpa [pρ₁, FirstNonHitNamedRole.point] using
          blockerMap_role_point_eq P Pρ A .secondRetainedSourceOne
      _ = H.centerAt Pρ.source₂ Pρ.source₂_mem_A := Pρ.blockers_eq
      _ = A.boundary.boundary (A.blockerMap pρ₂) := by
        symm
        simpa [pρ₂, FirstNonHitNamedRole.point] using
          blockerMap_role_point_eq P Pρ A .secondRetainedSourceTwo
  have hretainedBlockersNe : A.blockerMap pρ₁ ≠ A.blockerMap p₁ := by
    intro hindices
    apply hblockersNe
    calc
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A =
          A.boundary.boundary (A.blockerMap pρ₁) := by
        symm
        simpa [pρ₁, FirstNonHitNamedRole.point] using
          blockerMap_role_point_eq P Pρ A .secondRetainedSourceOne
      _ = A.boundary.boundary (A.blockerMap p₁) := congrArg _ hindices
      _ = H.centerAt P.source₁ P.source₁_mem_A := by
        simpa [p₁, FirstNonHitNamedRole.point] using
          blockerMap_role_point_eq P Pρ A .firstRetainedSourceOne
  have hfirstFreshNotCollisionClass : firstFresh ∉ A.row firstCollision := by
    intro hmem
    have hshell :=
      (row_mem_iff_index_point P Pρ A firstCollision firstFresh
        MPρ.collisionSource_mem_A hfirstCollisionPoint).mp hmem
    apply MPρ.fresh_not_mem_collisionSource_shell
    simpa only [hfirstFreshPoint] using hshell
  have hfirstCollisionNotFreshClass : firstCollision ∉ A.row firstFresh := by
    intro hmem
    have hshell :=
      (row_mem_iff_index_point P Pρ A firstFresh firstCollision LPρ.packet.q_mem_A
        hfirstFreshPoint).mp hmem
    apply MPρ.collisionSource_not_mem_fresh_shell
    simpa only [hfirstCollisionPoint] using hshell
  have hfirstCollisionBlockerEq :
      A.blockerMap firstCollision = A.blockerMap p₁ := by
    apply A.boundary.boundary_injective
    calc
      A.boundary.boundary (A.blockerMap firstCollision) =
          H.centerAt MPρ.collisionSource MPρ.collisionSource_mem_A :=
        hfirstCollisionBlockerPoint
      _ = H.centerAt P.source₁ P.source₁_mem_A :=
        MPρ.collisionSource_blocker_eq_commonBlocker
      _ = A.boundary.boundary (A.blockerMap p₁) := by
        symm
        simpa [p₁, FirstNonHitNamedRole.point] using
          blockerMap_role_point_eq P Pρ A .firstRetainedSourceOne
  have hfirstBlockersNe :
      A.blockerMap firstCollision ≠ A.blockerMap firstFresh := by
    intro hindices
    apply MPρ.blockers_ne
    calc
      H.centerAt MPρ.collisionSource MPρ.collisionSource_mem_A =
          A.boundary.boundary (A.blockerMap firstCollision) :=
        hfirstCollisionBlockerPoint.symm
      _ = A.boundary.boundary (A.blockerMap firstFresh) := congrArg _ hindices
      _ = H.centerAt LPρ.fresh LPρ.packet.q_mem_A := hfirstFreshBlockerPoint
  have hsecondFreshNotCollisionClass : secondFresh ∉ A.row secondCollision := by
    intro hmem
    have hshell :=
      (row_mem_iff_index_point P Pρ A secondCollision secondFresh
        MP.collisionSource_mem_A hsecondCollisionPoint).mp hmem
    apply MP.fresh_not_mem_collisionSource_shell
    simpa only [hsecondFreshPoint] using hshell
  have hsecondCollisionNotFreshClass : secondCollision ∉ A.row secondFresh := by
    intro hmem
    have hshell :=
      (row_mem_iff_index_point P Pρ A secondFresh secondCollision LP.packet.q_mem_A
        hsecondFreshPoint).mp hmem
    apply MP.collisionSource_not_mem_fresh_shell
    simpa only [hsecondCollisionPoint] using hshell
  have hsecondCollisionBlockerEq :
      A.blockerMap secondCollision = A.blockerMap pρ₁ := by
    apply A.boundary.boundary_injective
    calc
      A.boundary.boundary (A.blockerMap secondCollision) =
          H.centerAt MP.collisionSource MP.collisionSource_mem_A :=
        hsecondCollisionBlockerPoint
      _ = H.centerAt Pρ.source₁ Pρ.source₁_mem_A :=
        MP.collisionSource_blocker_eq_commonBlocker
      _ = A.boundary.boundary (A.blockerMap pρ₁) := by
        symm
        simpa [pρ₁, FirstNonHitNamedRole.point] using
          blockerMap_role_point_eq P Pρ A .secondRetainedSourceOne
  have hsecondBlockersNe :
      A.blockerMap secondCollision ≠ A.blockerMap secondFresh := by
    intro hindices
    apply MP.blockers_ne
    calc
      H.centerAt MP.collisionSource MP.collisionSource_mem_A =
          A.boundary.boundary (A.blockerMap secondCollision) :=
        hsecondCollisionBlockerPoint.symm
      _ = A.boundary.boundary (A.blockerMap secondFresh) := congrArg _ hindices
      _ = H.centerAt LP.fresh LP.packet.q_mem_A := hsecondFreshBlockerPoint
  refine
    { firstRetainedDistanceClass_card :=
        firstApexDistanceClassIndices_card_eq P Pρ A .firstRetainedSourceOne
          hP₁Class hfrontierFour
      secondRetainedDistanceClass_card :=
        firstApexDistanceClassIndices_card_eq P Pρ A .secondRetainedSourceOne
          hPρ₁Class hρfour
      firstRetainedDistanceClass_interior :=
        distanceClass_inter_firstInterior_eq_pair P Pρ A .firstRetainedSourceOne
          .firstRetainedSourceOne .firstRetainedSourceTwo hP₁Class hPInterior
      secondRetainedDistanceClass_interior :=
        distanceClass_inter_firstInterior_eq_pair P Pρ A .secondRetainedSourceOne
          .secondRetainedSourceOne .secondRetainedSourceTwo hPρ₁Class hPρInterior
      firstOne_secondOne_radius_ne :=
        radiusEq_eq_false_of_distinct_classes P Pρ A .firstRetainedSourceOne
          .secondRetainedSourceOne hP₁Class hPρ₁Class hρne
      firstOne_secondTwo_radius_ne :=
        radiusEq_eq_false_of_distinct_classes P Pρ A .firstRetainedSourceOne
          .secondRetainedSourceTwo hP₁Class hPρ₂Class hρne
      firstTwo_secondOne_radius_ne :=
        radiusEq_eq_false_of_distinct_classes P Pρ A .firstRetainedSourceTwo
          .secondRetainedSourceOne hP₂Class hPρ₁Class hρne
      firstTwo_secondTwo_radius_ne :=
        radiusEq_eq_false_of_distinct_classes P Pρ A .firstRetainedSourceTwo
          .secondRetainedSourceTwo hP₂Class hPρ₂Class hρne
      firstOne_ne_secondOne := by
        apply roleIndex_ne_of_point_ne P Pρ A
        simpa [FirstNonHitNamedRole.point] using hP₁Pρ₁
      firstOne_ne_secondTwo := by
        apply roleIndex_ne_of_point_ne P Pρ A
        simpa [FirstNonHitNamedRole.point] using hP₁Pρ₂
      firstTwo_ne_secondOne := by
        apply roleIndex_ne_of_point_ne P Pρ A
        simpa [FirstNonHitNamedRole.point] using hP₂Pρ₁
      firstTwo_ne_secondTwo := by
        apply roleIndex_ne_of_point_ne P Pρ A
        simpa [FirstNonHitNamedRole.point] using hP₂Pρ₂
      firstRetainedBlockers_eq := by simpa [p₁, p₂] using hfirstRetainedBlockers
      secondRetainedBlockers_eq := by
        simpa [pρ₁, pρ₂] using hsecondRetainedBlockers
      retainedBlockers_ne := by simpa [pρ₁, p₁] using hretainedBlockersNe
      firstPairFresh := firstFresh
      firstPairFresh_eq := by simpa [pρ₁] using hfirstFreshEq
      firstPairCollisionSource := firstCollision
      firstPairCollisionSource_eq := by simpa [p₁, p₂] using hfirstCollisionEq
      firstPairFresh_not_mem_collisionSource_class := hfirstFreshNotCollisionClass
      firstPairCollisionSource_not_mem_fresh_class := hfirstCollisionNotFreshClass
      firstPairCollisionSource_blocker_eq := by
        simpa [p₁] using hfirstCollisionBlockerEq
      firstPairBlockers_ne := hfirstBlockersNe
      firstPairFresh_apex_survives := ?_
      firstPairFresh_collisionBlocker_survives := ?_
      firstPairCollisionSource_apex_survives := ?_
      firstPairCollisionSource_freshBlocker_survives := ?_
      secondPairFresh := secondFresh
      secondPairFresh_eq := by simpa [p₁] using hsecondFreshEq
      secondPairCollisionSource := secondCollision
      secondPairCollisionSource_eq := by simpa [pρ₁, pρ₂] using hsecondCollisionEq
      secondPairFresh_not_mem_collisionSource_class := hsecondFreshNotCollisionClass
      secondPairCollisionSource_not_mem_fresh_class := hsecondCollisionNotFreshClass
      secondPairCollisionSource_blocker_eq := by
        simpa [pρ₁] using hsecondCollisionBlockerEq
      secondPairBlockers_ne := hsecondBlockersNe
      secondPairFresh_apex_survives := ?_
      secondPairFresh_collisionBlocker_survives := ?_
      secondPairCollisionSource_apex_survives := ?_
      secondPairCollisionSource_freshBlocker_survives := ?_ }
  · apply (A.hasFourAfterDeleting_iff firstFresh apex).mpr
    simpa only [hfirstFreshPoint, hapexPoint] using MPρ.freshPacket.survives₁
  · apply (A.hasFourAfterDeleting_iff firstFresh (A.blockerMap firstCollision)).mpr
    simpa only [hfirstFreshPoint, hfirstCollisionBlockerPoint] using
      MPρ.freshPacket.survives₂
  · apply (A.hasFourAfterDeleting_iff firstCollision apex).mpr
    simpa only [hfirstCollisionPoint, hapexPoint] using
      MPρ.collisionSourcePacket.survives₁
  · apply (A.hasFourAfterDeleting_iff firstCollision (A.blockerMap firstFresh)).mpr
    simpa only [hfirstCollisionPoint, hfirstFreshBlockerPoint] using
      MPρ.collisionSourcePacket.survives₂
  · apply (A.hasFourAfterDeleting_iff secondFresh apex).mpr
    simpa only [hsecondFreshPoint, hapexPoint] using MP.freshPacket.survives₁
  · apply (A.hasFourAfterDeleting_iff secondFresh (A.blockerMap secondCollision)).mpr
    simpa only [hsecondFreshPoint, hsecondCollisionBlockerPoint] using
      MP.freshPacket.survives₂
  · apply (A.hasFourAfterDeleting_iff secondCollision apex).mpr
    simpa only [hsecondCollisionPoint, hapexPoint] using
      MP.collisionSourcePacket.survives₁
  · apply (A.hasFourAfterDeleting_iff secondCollision (A.blockerMap secondFresh)).mpr
    simpa only [hsecondCollisionPoint, hsecondFreshBlockerPoint] using
      MP.collisionSourcePacket.survives₂

end FirstNonHitCompleteFiniteSourceTheoryContext

#print axioms FirstNonHitCompleteFiniteSourceTheoryContext.ofSource

end
end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
