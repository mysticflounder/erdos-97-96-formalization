/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstNonHitSourceTotalFiniteAssignment

/-!
# Finite source laws for the FreshThird FirstNonHit assignment

This file projects the named source geometry and the three typed branch values in
`FirstNonHitSourceTotalFiniteAssignment` to exact propositions on the complete finite
carrier.  It adds no phase, alternation, second-non-hit, query, or contradiction
assumption.
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
    (C : TwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (A : FirstNonHitSourceTotalFiniteAssignment P Pρ C Q)

/-- The finite equal-center/equal-row arm of a cap-source interaction. -/
abbrev FirstNonHitFiniteSameBlocker
    (source : FirstNonHitNamedRole) : Prop :=
  A.blockerMap (A.roleIndex source) =
      A.blockerMap (A.roleIndex .freshSourceOne) ∧
    A.row (A.roleIndex source) = A.row (A.roleIndex .freshSourceOne)

/-- The finite surviving one-point-deletion arm of a cap-source interaction. -/
abbrev FirstNonHitFiniteSourceRowOmission
    (source : FirstNonHitNamedRole) : Prop :=
  ∃ deleted : Fin A.boundary.n,
    (deleted = A.roleIndex .freshSourceOne ∨
      deleted = A.roleIndex .freshSourceTwo) ∧
      deleted ∉ A.row (A.roleIndex source) ∧
      A.hasFourAfterDeleting deleted (A.blockerMap (A.roleIndex source)) = true

/-- Exact two-arm finite image of the first canonical source non-hit. -/
abbrev FirstNonHitFiniteFirstInteraction : Prop :=
  FirstNonHitFiniteSameBlocker P Pρ C Q A .canonicalSourceOne ∨
    FirstNonHitFiniteSourceRowOmission P Pρ C Q A .canonicalSourceOne

/-- Finite common data of the two distinct-center interaction arms. -/
abbrev FirstNonHitFiniteDistinctBlockerTwoPointOverlap
    (source : FirstNonHitNamedRole) : Prop :=
  A.blockerMap (A.roleIndex source) ≠
      A.blockerMap (A.roleIndex .freshSourceOne) ∧
    A.roleIndex .freshSourceOne ∈ A.row (A.roleIndex source) ∧
    A.roleIndex .freshSourceTwo ∈ A.row (A.roleIndex source) ∧
    A.row (A.roleIndex source) ∩ A.row (A.roleIndex .freshSourceOne) =
      {A.roleIndex .freshSourceOne, A.roleIndex .freshSourceTwo}

/-- The finite distinct-center/different-cap interaction arm. -/
abbrev FirstNonHitFiniteDifferentCapInteraction
    (source : FirstNonHitNamedRole) : Prop :=
  FirstNonHitFiniteDistinctBlockerTwoPointOverlap P Pρ C Q A source ∧
    ∃ sourceCap freshCap : Fin 3,
      A.inCapInterior (A.blockerMap (A.roleIndex source)) sourceCap = true ∧
        A.inCapInterior
            (A.blockerMap (A.roleIndex .freshSourceOne)) freshCap = true ∧
          sourceCap ≠ freshCap

/-- The finite distinct-center/same-cap interaction arm. -/
abbrev FirstNonHitFiniteSameCapInteraction
    (source : FirstNonHitNamedRole) : Prop :=
  FirstNonHitFiniteDistinctBlockerTwoPointOverlap P Pρ C Q A source ∧
    ∃ capIndex : Fin 3,
      A.inCapInterior (A.blockerMap (A.roleIndex source)) capIndex = true ∧
        A.inCapInterior
            (A.blockerMap (A.roleIndex .freshSourceOne)) capIndex = true ∧
          (A.inCap (A.roleIndex .freshSourceOne) capIndex = true ∨
            A.inCap (A.roleIndex .freshSourceTwo) capIndex = true)

/-- Exact four-arm finite image of the second canonical source interaction.
The source constructors are exhaustive; no pairwise exclusivity is asserted. -/
abbrev FirstNonHitFiniteSecondInteraction : Prop :=
  FirstNonHitFiniteSameBlocker P Pρ C Q A .canonicalSourceTwo ∨
    FirstNonHitFiniteSourceRowOmission P Pρ C Q A .canonicalSourceTwo ∨
    FirstNonHitFiniteDifferentCapInteraction P Pρ C Q A .canonicalSourceTwo ∨
    FirstNonHitFiniteSameCapInteraction P Pρ C Q A .canonicalSourceTwo

/-- The exact finite discriminator available for the retained/common-radius ingress.

The retained arm makes the canonical first-apex radii unequal; the common-radius
arm's witness contains its own canonical surface, with no equality tying that surface
to `C`.  Therefore the common arm has no named finite radius fact without an explicit
surface-equality bridge.  The assignment also has no two-point-deletion predicate, so
the retained arm's typed double-deletion cores are deliberately not restated here. -/
inductive FirstNonHitFiniteHingress : Prop where
  | retained
      (canonicalRadii_ne :
        A.radiusEq (A.roleIndex .firstApex)
          (A.roleIndex .canonicalSourceOne)
          (A.roleIndex .canonicalSourceTwo) = false)
  | commonRadius

/-- Source-entitled named-role, blocker, cap, and selected-row facts. -/
structure FirstNonHitNamedSourceFiniteFacts : Prop where
  firstRetained_sources_ne :
    A.roleIndex .firstRetainedSourceOne ≠ A.roleIndex .firstRetainedSourceTwo
  secondRetained_sources_ne :
    A.roleIndex .secondRetainedSourceOne ≠ A.roleIndex .secondRetainedSourceTwo
  canonical_sources_ne :
    A.roleIndex .canonicalSourceOne ≠ A.roleIndex .canonicalSourceTwo
  fresh_sources_ne :
    A.roleIndex .freshSourceOne ≠ A.roleIndex .freshSourceTwo
  canonicalOne_ne_retained :
    A.roleIndex .canonicalSourceOne ≠ A.roleIndex .firstRetainedSourceOne ∧
      A.roleIndex .canonicalSourceOne ≠ A.roleIndex .firstRetainedSourceTwo ∧
      A.roleIndex .canonicalSourceOne ≠ A.roleIndex .secondRetainedSourceOne ∧
      A.roleIndex .canonicalSourceOne ≠ A.roleIndex .secondRetainedSourceTwo
  canonicalTwo_ne_retained :
    A.roleIndex .canonicalSourceTwo ≠ A.roleIndex .firstRetainedSourceOne ∧
      A.roleIndex .canonicalSourceTwo ≠ A.roleIndex .firstRetainedSourceTwo ∧
      A.roleIndex .canonicalSourceTwo ≠ A.roleIndex .secondRetainedSourceOne ∧
      A.roleIndex .canonicalSourceTwo ≠ A.roleIndex .secondRetainedSourceTwo
  freshOne_ne_retained :
    A.roleIndex .freshSourceOne ≠ A.roleIndex .firstRetainedSourceOne ∧
      A.roleIndex .freshSourceOne ≠ A.roleIndex .firstRetainedSourceTwo ∧
      A.roleIndex .freshSourceOne ≠ A.roleIndex .secondRetainedSourceOne ∧
      A.roleIndex .freshSourceOne ≠ A.roleIndex .secondRetainedSourceTwo
  freshTwo_ne_retained :
    A.roleIndex .freshSourceTwo ≠ A.roleIndex .firstRetainedSourceOne ∧
      A.roleIndex .freshSourceTwo ≠ A.roleIndex .firstRetainedSourceTwo ∧
      A.roleIndex .freshSourceTwo ≠ A.roleIndex .secondRetainedSourceOne ∧
      A.roleIndex .freshSourceTwo ≠ A.roleIndex .secondRetainedSourceTwo
  firstRetained_blocker_eq :
    A.blockerMap (A.roleIndex .firstRetainedSourceOne) =
      A.blockerMap (A.roleIndex .firstRetainedSourceTwo)
  secondRetained_blocker_eq :
    A.blockerMap (A.roleIndex .secondRetainedSourceOne) =
      A.blockerMap (A.roleIndex .secondRetainedSourceTwo)
  fresh_blocker_eq :
    A.blockerMap (A.roleIndex .freshSourceOne) =
      A.blockerMap (A.roleIndex .freshSourceTwo)
  fresh_blocker_ne_first :
    A.blockerMap (A.roleIndex .freshSourceOne) ≠
      A.blockerMap (A.roleIndex .firstRetainedSourceOne)
  fresh_blocker_ne_second :
    A.blockerMap (A.roleIndex .freshSourceOne) ≠
      A.blockerMap (A.roleIndex .secondRetainedSourceOne)
  canonicalOne_blocker_ne_first :
    A.blockerMap (A.roleIndex .canonicalSourceOne) ≠
      A.blockerMap (A.roleIndex .firstRetainedSourceOne)
  canonicalOne_blocker_ne_second :
    A.blockerMap (A.roleIndex .canonicalSourceOne) ≠
      A.blockerMap (A.roleIndex .secondRetainedSourceOne)
  canonicalTwo_blocker_ne_first :
    A.blockerMap (A.roleIndex .canonicalSourceTwo) ≠
      A.blockerMap (A.roleIndex .firstRetainedSourceOne)
  canonicalTwo_blocker_ne_second :
    A.blockerMap (A.roleIndex .canonicalSourceTwo) ≠
      A.blockerMap (A.roleIndex .secondRetainedSourceOne)
  firstRetained_in_firstCapInterior :
    A.inCapInterior (A.roleIndex .firstRetainedSourceOne) S.oppIndex1 = true ∧
      A.inCapInterior (A.roleIndex .firstRetainedSourceTwo) S.oppIndex1 = true
  secondRetained_in_firstCapInterior :
    A.inCapInterior (A.roleIndex .secondRetainedSourceOne) S.oppIndex1 = true ∧
      A.inCapInterior (A.roleIndex .secondRetainedSourceTwo) S.oppIndex1 = true
  canonical_in_firstCapInterior :
    A.inCapInterior (A.roleIndex .canonicalSourceOne) S.oppIndex1 = true ∧
      A.inCapInterior (A.roleIndex .canonicalSourceTwo) S.oppIndex1 = true
  fresh_mutual_row :
    A.roleIndex .freshSourceOne ∈ A.row (A.roleIndex .freshSourceTwo) ∧
      A.roleIndex .freshSourceTwo ∈ A.row (A.roleIndex .freshSourceOne)
  canonicalOne_firstRetained_omission :
    A.roleIndex .firstRetainedSourceOne ∉ A.row (A.roleIndex .canonicalSourceOne) ∨
      A.roleIndex .firstRetainedSourceTwo ∉ A.row (A.roleIndex .canonicalSourceOne)
  canonicalOne_secondRetained_omission :
    A.roleIndex .secondRetainedSourceOne ∉ A.row (A.roleIndex .canonicalSourceOne) ∨
      A.roleIndex .secondRetainedSourceTwo ∉ A.row (A.roleIndex .canonicalSourceOne)
  canonicalTwo_firstRetained_omission :
    A.roleIndex .firstRetainedSourceOne ∉ A.row (A.roleIndex .canonicalSourceTwo) ∨
      A.roleIndex .firstRetainedSourceTwo ∉ A.row (A.roleIndex .canonicalSourceTwo)
  canonicalTwo_secondRetained_omission :
    A.roleIndex .secondRetainedSourceOne ∉ A.row (A.roleIndex .canonicalSourceTwo) ∨
      A.roleIndex .secondRetainedSourceTwo ∉ A.row (A.roleIndex .canonicalSourceTwo)
  canonicalOne_firstRetained_deletionSurvives :
    A.hasFourAfterDeleting (A.roleIndex .firstRetainedSourceOne)
        (A.blockerMap (A.roleIndex .canonicalSourceOne)) = true ∨
      A.hasFourAfterDeleting (A.roleIndex .firstRetainedSourceTwo)
        (A.blockerMap (A.roleIndex .canonicalSourceOne)) = true
  canonicalOne_secondRetained_deletionSurvives :
    A.hasFourAfterDeleting (A.roleIndex .secondRetainedSourceOne)
        (A.blockerMap (A.roleIndex .canonicalSourceOne)) = true ∨
      A.hasFourAfterDeleting (A.roleIndex .secondRetainedSourceTwo)
        (A.blockerMap (A.roleIndex .canonicalSourceOne)) = true
  canonicalTwo_firstRetained_deletionSurvives :
    A.hasFourAfterDeleting (A.roleIndex .firstRetainedSourceOne)
        (A.blockerMap (A.roleIndex .canonicalSourceTwo)) = true ∨
      A.hasFourAfterDeleting (A.roleIndex .firstRetainedSourceTwo)
        (A.blockerMap (A.roleIndex .canonicalSourceTwo)) = true
  canonicalTwo_secondRetained_deletionSurvives :
    A.hasFourAfterDeleting (A.roleIndex .secondRetainedSourceOne)
        (A.blockerMap (A.roleIndex .canonicalSourceTwo)) = true ∨
      A.hasFourAfterDeleting (A.roleIndex .secondRetainedSourceTwo)
        (A.blockerMap (A.roleIndex .canonicalSourceTwo)) = true

private theorem roleIndex_ne_of_point_ne
    {r s : FirstNonHitNamedRole}
    (h : FirstNonHitNamedRole.point P Pρ C Q r ≠
      FirstNonHitNamedRole.point P Pρ C Q s) :
    A.roleIndex r ≠ A.roleIndex s := by
  intro hrs
  apply h
  rw [← A.roleIndex_point_eq r, ← A.roleIndex_point_eq s, hrs]

private theorem center_roleIndex_eq (r : FirstNonHitNamedRole) :
    H.centerAt (A.boundary.boundary (A.roleIndex r))
        (A.boundary_mem (A.roleIndex r)) =
      H.centerAt (FirstNonHitNamedRole.point P Pρ C Q r)
        (FirstNonHitNamedRole.point_mem P Pρ C Q r) := by
  have hr :
      (⟨A.boundary.boundary (A.roleIndex r), A.boundary_mem (A.roleIndex r)⟩ :
          CriticalShellSystem.CarrierVertex D.A) =
        ⟨FirstNonHitNamedRole.point P Pρ C Q r,
          FirstNonHitNamedRole.point_mem P Pρ C Q r⟩ :=
    Subtype.ext (A.roleIndex_point_eq r)
  exact congrArg (fun v ↦ H.centerAt v.1 v.2) hr

private theorem selectedSupport_roleIndex_eq (r : FirstNonHitNamedRole) :
    (H.selectedAt (A.boundary.boundary (A.roleIndex r))
        (A.boundary_mem (A.roleIndex r))).toCriticalFourShell.support =
      (H.selectedAt (FirstNonHitNamedRole.point P Pρ C Q r)
        (FirstNonHitNamedRole.point_mem P Pρ C Q r)).toCriticalFourShell.support := by
  have hr :
      (⟨A.boundary.boundary (A.roleIndex r), A.boundary_mem (A.roleIndex r)⟩ :
          CriticalShellSystem.CarrierVertex D.A) =
        ⟨FirstNonHitNamedRole.point P Pρ C Q r,
          FirstNonHitNamedRole.point_mem P Pρ C Q r⟩ :=
    Subtype.ext (A.roleIndex_point_eq r)
  exact congrArg
    (fun v ↦ (H.selectedAt v.1 v.2).toCriticalFourShell.support) hr

private theorem blockerMap_eq_of_center_eq
    {r s : FirstNonHitNamedRole}
    (h :
      H.centerAt
          (FirstNonHitNamedRole.point P Pρ C Q r)
          (FirstNonHitNamedRole.point_mem P Pρ C Q r) =
        H.centerAt
          (FirstNonHitNamedRole.point P Pρ C Q s)
          (FirstNonHitNamedRole.point_mem P Pρ C Q s)) :
    A.blockerMap (A.roleIndex r) = A.blockerMap (A.roleIndex s) := by
  apply A.boundary.boundary_injective
  simpa only [A.blockerMap_point_eq, center_roleIndex_eq P Pρ C Q A] using h

private theorem blockerMap_ne_of_center_ne
    {r s : FirstNonHitNamedRole}
    (h :
      H.centerAt
          (FirstNonHitNamedRole.point P Pρ C Q r)
          (FirstNonHitNamedRole.point_mem P Pρ C Q r) ≠
        H.centerAt
          (FirstNonHitNamedRole.point P Pρ C Q s)
          (FirstNonHitNamedRole.point_mem P Pρ C Q s)) :
    A.blockerMap (A.roleIndex r) ≠ A.blockerMap (A.roleIndex s) := by
  intro hrs
  apply h
  have := congrArg A.boundary.boundary hrs
  simpa only [A.blockerMap_point_eq, center_roleIndex_eq P Pρ C Q A] using this

private theorem row_mem_of_source_mem
    {source x : FirstNonHitNamedRole}
    (h : FirstNonHitNamedRole.point P Pρ C Q x ∈
      (H.selectedAt
        (FirstNonHitNamedRole.point P Pρ C Q source)
        (FirstNonHitNamedRole.point_mem P Pρ C Q source)).toCriticalFourShell.support) :
    A.roleIndex x ∈ A.row (A.roleIndex source) := by
  apply (A.row_mem_iff _ _).mpr
  rw [selectedSupport_roleIndex_eq P Pρ C Q A]
  simpa only [A.roleIndex_point_eq] using h

private theorem row_not_mem_of_source_not_mem
    {source x : FirstNonHitNamedRole}
    (h : FirstNonHitNamedRole.point P Pρ C Q x ∉
      (H.selectedAt
        (FirstNonHitNamedRole.point P Pρ C Q source)
        (FirstNonHitNamedRole.point_mem P Pρ C Q source)).toCriticalFourShell.support) :
    A.roleIndex x ∉ A.row (A.roleIndex source) := by
  intro hx
  apply h
  have hx' := (A.row_mem_iff _ _).mp hx
  rw [selectedSupport_roleIndex_eq P Pρ C Q A] at hx'
  simpa only [A.roleIndex_point_eq] using hx'

private theorem row_eq_of_support_eq
    {r s : FirstNonHitNamedRole}
    (h :
      (H.selectedAt
        (FirstNonHitNamedRole.point P Pρ C Q r)
        (FirstNonHitNamedRole.point_mem P Pρ C Q r)).toCriticalFourShell.support =
      (H.selectedAt
        (FirstNonHitNamedRole.point P Pρ C Q s)
        (FirstNonHitNamedRole.point_mem P Pρ C Q s)).toCriticalFourShell.support) :
    A.row (A.roleIndex r) = A.row (A.roleIndex s) := by
  ext x
  constructor
  · intro hx
    apply (A.row_mem_iff _ _).mpr
    have hx' := (A.row_mem_iff _ _).mp hx
    rw [selectedSupport_roleIndex_eq P Pρ C Q A] at hx'
    have hxPoint' : A.boundary.boundary x ∈
        (H.selectedAt
          (FirstNonHitNamedRole.point P Pρ C Q s)
          (FirstNonHitNamedRole.point_mem P Pρ C Q s)).toCriticalFourShell.support := by
      simpa only [h] using hx'
    rw [selectedSupport_roleIndex_eq P Pρ C Q A]
    exact hxPoint'
  · intro hx
    apply (A.row_mem_iff _ _).mpr
    have hx' := (A.row_mem_iff _ _).mp hx
    rw [selectedSupport_roleIndex_eq P Pρ C Q A] at hx'
    have hxPoint' : A.boundary.boundary x ∈
        (H.selectedAt
          (FirstNonHitNamedRole.point P Pρ C Q r)
          (FirstNonHitNamedRole.point_mem P Pρ C Q r)).toCriticalFourShell.support := by
      simpa only [h] using hx'
    rw [selectedSupport_roleIndex_eq P Pρ C Q A]
    exact hxPoint'

private theorem finiteSameBlocker_of_source
    {source : FirstNonHitNamedRole}
    (hcenter :
      H.centerAt
          (FirstNonHitNamedRole.point P Pρ C Q source)
          (FirstNonHitNamedRole.point_mem P Pρ C Q source) =
        H.centerAt Q.source₁.1 Q.source₁.2)
    (hsupport :
      (H.selectedAt
        (FirstNonHitNamedRole.point P Pρ C Q source)
        (FirstNonHitNamedRole.point_mem P Pρ C Q source)).toCriticalFourShell.support =
      (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) :
    FirstNonHitFiniteSameBlocker P Pρ C Q A source := by
  exact
    ⟨blockerMap_eq_of_center_eq P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hcenter),
      row_eq_of_support_eq P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hsupport)⟩

private theorem finiteSourceRowOmission_of_freshOne
    {source : FirstNonHitNamedRole}
    (hnot : Q.source₁.1 ∉
      (H.selectedAt
        (FirstNonHitNamedRole.point P Pρ C Q source)
        (FirstNonHitNamedRole.point_mem P Pρ C Q source)).toCriticalFourShell.support)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase Q.source₁.1)
        (H.centerAt
          (FirstNonHitNamedRole.point P Pρ C Q source)
          (FirstNonHitNamedRole.point_mem P Pρ C Q source))) :
    FirstNonHitFiniteSourceRowOmission P Pρ C Q A source := by
  refine ⟨A.roleIndex .freshSourceOne, Or.inl rfl, ?_, ?_⟩
  · exact row_not_mem_of_source_not_mem P Pρ C Q A
      (by simpa only [FirstNonHitNamedRole.point] using hnot)
  · apply (A.hasFourAfterDeleting_iff _ _).mpr
    rw [A.roleIndex_point_eq, A.blockerMap_point_eq,
      center_roleIndex_eq P Pρ C Q A]
    exact hsurvives

private theorem finiteSourceRowOmission_of_freshTwo
    {source : FirstNonHitNamedRole}
    (hnot : Q.source₂.1 ∉
      (H.selectedAt
        (FirstNonHitNamedRole.point P Pρ C Q source)
        (FirstNonHitNamedRole.point_mem P Pρ C Q source)).toCriticalFourShell.support)
    (hsurvives :
      HasNEquidistantPointsAt 4 (D.A.erase Q.source₂.1)
        (H.centerAt
          (FirstNonHitNamedRole.point P Pρ C Q source)
          (FirstNonHitNamedRole.point_mem P Pρ C Q source))) :
    FirstNonHitFiniteSourceRowOmission P Pρ C Q A source := by
  refine ⟨A.roleIndex .freshSourceTwo, Or.inr rfl, ?_, ?_⟩
  · exact row_not_mem_of_source_not_mem P Pρ C Q A
      (by simpa only [FirstNonHitNamedRole.point] using hnot)
  · apply (A.hasFourAfterDeleting_iff _ _).mpr
    rw [A.roleIndex_point_eq, A.blockerMap_point_eq,
      center_roleIndex_eq P Pρ C Q A]
    exact hsurvives

private theorem hasFourAfterDeleting_of_source
    {deleted source : FirstNonHitNamedRole}
    (h :
      HasNEquidistantPointsAt 4
        (D.A.erase (FirstNonHitNamedRole.point P Pρ C Q deleted))
        (H.centerAt
          (FirstNonHitNamedRole.point P Pρ C Q source)
          (FirstNonHitNamedRole.point_mem P Pρ C Q source))) :
    A.hasFourAfterDeleting (A.roleIndex deleted)
      (A.blockerMap (A.roleIndex source)) = true := by
  apply (A.hasFourAfterDeleting_iff _ _).mpr
  rw [A.roleIndex_point_eq, A.blockerMap_point_eq,
    center_roleIndex_eq P Pρ C Q A]
  exact h

private theorem inCap_of_source_mem
    {source : FirstNonHitNamedRole} {cap : Fin 3}
    (h : FirstNonHitNamedRole.point P Pρ C Q source ∈ S.capByIndex cap) :
    A.inCap (A.roleIndex source) cap = true := by
  apply (A.inCap_iff _ _).mpr
  simpa [A.roleIndex_point_eq] using h

private theorem inCapInterior_of_source_mem
    {source : FirstNonHitNamedRole} {cap : Fin 3}
    (h :
      FirstNonHitNamedRole.point P Pρ C Q source ∈ S.capInteriorByIndex cap) :
    A.inCapInterior (A.roleIndex source) cap = true := by
  apply (A.inCapInterior_iff _ _).mpr
  simpa [A.roleIndex_point_eq] using h

private theorem blocker_inCapInterior_of_center_mem
    {source : FirstNonHitNamedRole} {cap : Fin 3}
    (h :
      H.centerAt
          (FirstNonHitNamedRole.point P Pρ C Q source)
          (FirstNonHitNamedRole.point_mem P Pρ C Q source) ∈
        S.capInteriorByIndex cap) :
    A.inCapInterior (A.blockerMap (A.roleIndex source)) cap = true := by
  apply (A.inCapInterior_iff _ _).mpr
  rw [A.blockerMap_point_eq, center_roleIndex_eq P Pρ C Q A]
  exact h

private theorem finiteOverlap_of_support_inter_eq
    {source : FirstNonHitNamedRole}
    (h :
      (H.selectedAt
        (FirstNonHitNamedRole.point P Pρ C Q source)
        (FirstNonHitNamedRole.point_mem P Pρ C Q source)).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1}) :
    A.row (A.roleIndex source) ∩ A.row (A.roleIndex .freshSourceOne) =
      {A.roleIndex .freshSourceOne, A.roleIndex .freshSourceTwo} := by
  ext x
  simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
  constructor
  · intro hx
    have hxSource := (A.row_mem_iff _ _).mp hx.1
    have hxFresh := (A.row_mem_iff _ _).mp hx.2
    rw [selectedSupport_roleIndex_eq P Pρ C Q A] at hxSource hxFresh
    have hx' : A.boundary.boundary x ∈
        (H.selectedAt
          (FirstNonHitNamedRole.point P Pρ C Q source)
          (FirstNonHitNamedRole.point_mem P Pρ C Q source)).toCriticalFourShell.support ∩
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support := by
      apply Finset.mem_inter.mpr
      exact ⟨hxSource,
        by simpa only [FirstNonHitNamedRole.point] using hxFresh⟩
    rw [h] at hx'
    rcases Finset.mem_insert.mp hx' with hx' | hx'
    · exact Or.inl (A.boundary.boundary_injective (by
        simpa only [A.roleIndex_point_eq, FirstNonHitNamedRole.point] using hx'))
    · exact Or.inr (A.boundary.boundary_injective (by
        simpa only [A.roleIndex_point_eq, FirstNonHitNamedRole.point,
          Finset.mem_singleton] using hx'))
  · intro hx
    have hx' : A.boundary.boundary x ∈ ({Q.source₁.1, Q.source₂.1} : Finset ℝ²) := by
      rcases hx with rfl | rfl
      · simp only [A.roleIndex_point_eq, FirstNonHitNamedRole.point,
          Finset.mem_insert, true_or]
      · simp only [A.roleIndex_point_eq, FirstNonHitNamedRole.point,
          Finset.mem_insert, Finset.mem_singleton, or_true]
    rw [← h] at hx'
    rcases Finset.mem_inter.mp hx' with ⟨hxSource, hxFresh⟩
    constructor
    · apply (A.row_mem_iff _ _).mpr
      rw [selectedSupport_roleIndex_eq P Pρ C Q A]
      exact hxSource
    · apply (A.row_mem_iff _ _).mpr
      rw [selectedSupport_roleIndex_eq P Pρ C Q A]
      simpa only [FirstNonHitNamedRole.point] using hxFresh

/-- The typed first non-hit produces its exact two-arm finite image. -/
theorem firstNonHitFiniteFirstInteraction_of_assignment :
    FirstNonHitFiniteFirstInteraction P Pρ C Q A := by
  rcases A.firstNonHit with ⟨hcenter, hsupport⟩ |
      ⟨deleted, hdeleted, hnot, hsurvives⟩
  · exact Or.inl
      (finiteSameBlocker_of_source P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hcenter)
        (by simpa only [FirstNonHitNamedRole.point] using hsupport))
  · rcases hdeleted with hdeleted | hdeleted
    · subst deleted
      exact Or.inr
        (finiteSourceRowOmission_of_freshOne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hnot)
          (by simpa only [FirstNonHitNamedRole.point] using hsurvives))
    · subst deleted
      exact Or.inr
        (finiteSourceRowOmission_of_freshTwo P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hnot)
          (by simpa only [FirstNonHitNamedRole.point] using hsurvives))

/-- The typed second interaction produces its exact four-arm finite image. -/
theorem firstNonHitFiniteSecondInteraction_of_assignment :
    FirstNonHitFiniteSecondInteraction P Pρ C Q A := by
  rcases A.secondInteraction with ⟨hcenter, hsupport⟩ |
      ⟨deleted, hdeleted, hnot, hsurvives⟩ |
      ⟨hcentersNe, hsourceOne, hsourceTwo, hoverlap,
        sourceCap, freshCap, hsourceCenter, hfreshCenter, hcapsNe⟩ |
      ⟨hcentersNe, hsourceOne, hsourceTwo, hoverlap,
        capIndex, hsourceCenter, hfreshCenter, hfiberSource⟩
  · exact Or.inl
      (finiteSameBlocker_of_source P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hcenter)
        (by simpa only [FirstNonHitNamedRole.point] using hsupport))
  · rcases hdeleted with hdeleted | hdeleted
    · subst deleted
      exact Or.inr (Or.inl
        (finiteSourceRowOmission_of_freshOne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hnot)
          (by simpa only [FirstNonHitNamedRole.point] using hsurvives)))
    · subst deleted
      exact Or.inr (Or.inl
        (finiteSourceRowOmission_of_freshTwo P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hnot)
          (by simpa only [FirstNonHitNamedRole.point] using hsurvives)))
  · exact Or.inr (Or.inr (Or.inl ⟨
      ⟨blockerMap_ne_of_center_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hcentersNe),
        row_mem_of_source_mem P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hsourceOne),
        row_mem_of_source_mem P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hsourceTwo),
        finiteOverlap_of_support_inter_eq P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hoverlap)⟩,
      sourceCap, freshCap,
      blocker_inCapInterior_of_center_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hsourceCenter),
      blocker_inCapInterior_of_center_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hfreshCenter),
      hcapsNe⟩))
  · refine Or.inr (Or.inr (Or.inr ⟨
      ⟨blockerMap_ne_of_center_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hcentersNe),
        row_mem_of_source_mem P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hsourceOne),
        row_mem_of_source_mem P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hsourceTwo),
        finiteOverlap_of_support_inter_eq P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hoverlap)⟩,
      capIndex,
      blocker_inCapInterior_of_center_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hsourceCenter),
      blocker_inCapInterior_of_center_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hfreshCenter),
      ?_⟩))
    rcases hfiberSource with hfirst | hsecond
    · exact Or.inl (inCap_of_source_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hfirst))
    · exact Or.inr (inCap_of_source_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hsecond))

private theorem retained_canonicalRadii_ne
    (hretained : FreshThirdAlignedRetainedConsumerPacket
      (P := P) (Pρ := Pρ) C) :
    A.radiusEq (A.roleIndex .firstApex)
      (A.roleIndex .canonicalSourceOne)
      (A.roleIndex .canonicalSourceTwo) = false := by
  cases hradius : A.radiusEq (A.roleIndex .firstApex)
      (A.roleIndex .canonicalSourceOne) (A.roleIndex .canonicalSourceTwo) with
  | false => rfl
  | true =>
      exfalso
      apply hretained.1
      have hdist := (A.radiusEq_iff _ _ _).mp hradius
      simpa [A.roleIndex_point_eq, FirstNonHitNamedRole.point] using hdist

private theorem common_canonicalRadii_eq
    (hcommon : Nonempty (CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ))
    (hcommonSurface :
      ∀ G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ,
        G.surface = C) :
    A.radiusEq (A.roleIndex .firstApex)
      (A.roleIndex .canonicalSourceOne)
      (A.roleIndex .canonicalSourceTwo) = true := by
  apply (A.radiusEq_iff _ _ _).mpr
  rcases hcommon with ⟨G⟩
  have hfirst := (mem_selectedClass.mp G.firstSource_mem).2
  have hsecond := (mem_selectedClass.mp G.secondSource_mem).2
  rw [hcommonSurface G] at hfirst hsecond
  simpa [A.roleIndex_point_eq, FirstNonHitNamedRole.point] using
    hfirst.trans hsecond.symm

/-- The typed retained/common-radius ingress produces the exact available finite
radius discriminator. -/
theorem firstNonHitFiniteHingress_of_assignment :
    FirstNonHitFiniteHingress P Pρ C Q A := by
  rcases A.hingress with hretained | hcommon
  · exact .retained (retained_canonicalRadii_ne P Pρ C Q A hretained)
  · exact .commonRadius

/-- If the common-radius witness is explicitly tied to the assignment's named surface,
the finite radius discriminator recovers the typed ingress branch exactly.  The extra
hypothesis is precisely the bridge absent from the current assignment. -/
theorem firstNonHitFiniteHingress_exact_of_commonSurface_eq
    (hcommonSurface :
      ∀ G : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ,
        G.surface = C) :
    (A.radiusEq (A.roleIndex .firstApex)
          (A.roleIndex .canonicalSourceOne)
          (A.roleIndex .canonicalSourceTwo) = false ↔
        FreshThirdAlignedRetainedConsumerPacket (P := P) (Pρ := Pρ) C) ∧
      (A.radiusEq (A.roleIndex .firstApex)
          (A.roleIndex .canonicalSourceOne)
          (A.roleIndex .canonicalSourceTwo) = true ↔
        Nonempty (CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)) := by
  constructor
  · constructor
    · intro hfalse
      rcases A.hingress with hretained | hcommon
      · exact hretained
      · have htrue :=
          common_canonicalRadii_eq P Pρ C Q A hcommon hcommonSurface
        simp_all
    · exact retained_canonicalRadii_ne P Pρ C Q A
  · constructor
    · intro htrue
      rcases A.hingress with hretained | hcommon
      · have hfalse := retained_canonicalRadii_ne P Pρ C Q A hretained
        simp_all
      · exact hcommon
    · intro hcommon
      exact common_canonicalRadii_eq P Pρ C Q A hcommon hcommonSurface

/-- The named geometry carried by `P`, `Pρ`, `C`, and `Q` produces all of its
source-entitled finite incidence facts. -/
theorem firstNonHitNamedSourceFiniteFacts_of_assignment :
    FirstNonHitNamedSourceFiniteFacts P Pρ C Q A := by
  rcases C.firstSource_data with
    ⟨_, hC1Cap, hC1NotRetained, hC1BlockerNeP, hC1BlockerNePρ,
      _, _, _, _, hC1ViewP, hC1ViewPρ⟩
  rcases C.secondSource_data with
    ⟨_, hC2Cap, hC2NotRetained, hC2BlockerNeP, hC2BlockerNePρ,
      _, _, _, _, hC2ViewP, hC2ViewPρ⟩
  have canonical_ne_retained
      (source : ℝ²)
      (hsource : source ∉
        (({P.source₁, P.source₂} : Finset ℝ²) ∪
          {Pρ.source₁, Pρ.source₂})) :
      source ≠ P.source₁ ∧ source ≠ P.source₂ ∧
        source ≠ Pρ.source₁ ∧ source ≠ Pρ.source₂ := by
    constructor
    · intro h
      apply hsource
      exact Finset.mem_union.mpr (Or.inl (Finset.mem_insert.mpr (Or.inl h)))
    constructor
    · intro h
      apply hsource
      exact Finset.mem_union.mpr
        (Or.inl (Finset.mem_insert.mpr (Or.inr (Finset.mem_singleton.mpr h))))
    constructor
    · intro h
      apply hsource
      exact Finset.mem_union.mpr (Or.inr (Finset.mem_insert.mpr (Or.inl h)))
    · intro h
      apply hsource
      exact Finset.mem_union.mpr
        (Or.inr (Finset.mem_insert.mpr (Or.inr (Finset.mem_singleton.mpr h))))
  have hC1Ne := canonical_ne_retained C.firstSource.1 hC1NotRetained
  have hC2Ne := canonical_ne_retained C.secondSource.1 hC2NotRetained
  have subtype_val_ne
      {x y : CriticalShellSystem.CarrierVertex D.A} (hxy : x ≠ y) : x.1 ≠ y.1 := by
    intro h
    exact hxy (Subtype.ext h)
  have hQSources : Q.source₁.1 ≠ Q.source₂.1 := subtype_val_ne Q.sources_ne
  have hQP11 : Q.source₁.1 ≠ P.source₁ :=
    subtype_val_ne Q.source₁_ne_first₁
  have hQP12 : Q.source₁.1 ≠ P.source₂ :=
    subtype_val_ne Q.source₁_ne_first₂
  have hQPρ11 : Q.source₁.1 ≠ Pρ.source₁ :=
    subtype_val_ne Q.source₁_ne_second₁
  have hQPρ12 : Q.source₁.1 ≠ Pρ.source₂ :=
    subtype_val_ne Q.source₁_ne_second₂
  have hQP21 : Q.source₂.1 ≠ P.source₁ :=
    subtype_val_ne Q.source₂_ne_first₁
  have hQP22 : Q.source₂.1 ≠ P.source₂ :=
    subtype_val_ne Q.source₂_ne_first₂
  have hQPρ21 : Q.source₂.1 ≠ Pρ.source₁ :=
    subtype_val_ne Q.source₂_ne_second₁
  have hQPρ22 : Q.source₂.1 ≠ Pρ.source₂ :=
    subtype_val_ne Q.source₂_ne_second₂
  have hQBlockerEq :
      H.centerAt Q.source₁.1 Q.source₁.2 =
        H.centerAt Q.source₂.1 Q.source₂.2 := by
    simpa [CriticalShellSystem.blockerVertex] using congrArg Subtype.val Q.blockers_eq
  have hQBlockerNeP :
      H.centerAt Q.source₁.1 Q.source₁.2 ≠
        H.centerAt P.source₁ P.source₁_mem_A := by
    intro h
    apply Q.blocker_ne_first
    apply Subtype.ext
    simpa [CriticalShellSystem.blockerVertex] using h
  have hQBlockerNePρ :
      H.centerAt Q.source₁.1 Q.source₁.2 ≠
        H.centerAt Pρ.source₁ Pρ.source₁_mem_A := by
    intro h
    apply Q.blocker_ne_second
    apply Subtype.ext
    simpa [CriticalShellSystem.blockerVertex] using h
  refine
    { firstRetained_sources_ne := roleIndex_ne_of_point_ne P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using P.sources_ne)
      secondRetained_sources_ne := roleIndex_ne_of_point_ne P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using Pρ.sources_ne)
      canonical_sources_ne := roleIndex_ne_of_point_ne P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using C.sources_ne)
      fresh_sources_ne := roleIndex_ne_of_point_ne P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hQSources)
      canonicalOne_ne_retained := ⟨
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hC1Ne.1),
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hC1Ne.2.1),
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hC1Ne.2.2.1),
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hC1Ne.2.2.2)⟩
      canonicalTwo_ne_retained := ⟨
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hC2Ne.1),
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hC2Ne.2.1),
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hC2Ne.2.2.1),
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hC2Ne.2.2.2)⟩
      freshOne_ne_retained := ⟨
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hQP11),
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hQP12),
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hQPρ11),
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hQPρ12)⟩
      freshTwo_ne_retained := ⟨
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hQP21),
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hQP22),
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hQPρ21),
        roleIndex_ne_of_point_ne P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hQPρ22)⟩
      firstRetained_blocker_eq := blockerMap_eq_of_center_eq P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using P.blockers_eq)
      secondRetained_blocker_eq := blockerMap_eq_of_center_eq P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using Pρ.blockers_eq)
      fresh_blocker_eq := blockerMap_eq_of_center_eq P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hQBlockerEq)
      fresh_blocker_ne_first := blockerMap_ne_of_center_ne P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hQBlockerNeP)
      fresh_blocker_ne_second := blockerMap_ne_of_center_ne P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hQBlockerNePρ)
      canonicalOne_blocker_ne_first := blockerMap_ne_of_center_ne P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hC1BlockerNeP)
      canonicalOne_blocker_ne_second := blockerMap_ne_of_center_ne P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hC1BlockerNePρ)
      canonicalTwo_blocker_ne_first := blockerMap_ne_of_center_ne P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hC2BlockerNeP)
      canonicalTwo_blocker_ne_second := blockerMap_ne_of_center_ne P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hC2BlockerNePρ)
      firstRetained_in_firstCapInterior := ⟨
        inCapInterior_of_source_mem P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using P.source₁_mem_capInterior),
        inCapInterior_of_source_mem P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using P.source₂_mem_capInterior)⟩
      secondRetained_in_firstCapInterior := ⟨
        inCapInterior_of_source_mem P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using Pρ.source₁_mem_capInterior),
        inCapInterior_of_source_mem P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using Pρ.source₂_mem_capInterior)⟩
      canonical_in_firstCapInterior := ⟨
        inCapInterior_of_source_mem P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hC1Cap),
        inCapInterior_of_source_mem P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using hC2Cap)⟩
      fresh_mutual_row := ⟨
        row_mem_of_source_mem P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using Q.source₁_mem_source₂_shell),
        row_mem_of_source_mem P Pρ C Q A
          (by simpa only [FirstNonHitNamedRole.point] using Q.source₂_mem_source₁_shell)⟩
      canonicalOne_firstRetained_omission := ?_
      canonicalOne_secondRetained_omission := ?_
      canonicalTwo_firstRetained_omission := ?_
      canonicalTwo_secondRetained_omission := ?_
      canonicalOne_firstRetained_deletionSurvives := ?_
      canonicalOne_secondRetained_deletionSurvives := ?_
      canonicalTwo_firstRetained_deletionSurvives := ?_
      canonicalTwo_secondRetained_deletionSurvives := ?_ }
  · rcases hC1ViewP.omits with hfirst | hsecond
    · exact Or.inl (row_not_mem_of_source_not_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hfirst))
    · exact Or.inr (row_not_mem_of_source_not_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hsecond))
  · rcases hC1ViewPρ.omits with hfirst | hsecond
    · exact Or.inl (row_not_mem_of_source_not_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hfirst))
    · exact Or.inr (row_not_mem_of_source_not_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hsecond))
  · rcases hC2ViewP.omits with hfirst | hsecond
    · exact Or.inl (row_not_mem_of_source_not_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hfirst))
    · exact Or.inr (row_not_mem_of_source_not_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hsecond))
  · rcases hC2ViewPρ.omits with hfirst | hsecond
    · exact Or.inl (row_not_mem_of_source_not_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hfirst))
    · exact Or.inr (row_not_mem_of_source_not_mem P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hsecond))
  · rcases hC1ViewP.survives with hfirst | hsecond
    · exact Or.inl (hasFourAfterDeleting_of_source P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hfirst))
    · exact Or.inr (hasFourAfterDeleting_of_source P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hsecond))
  · rcases hC1ViewPρ.survives with hfirst | hsecond
    · exact Or.inl (hasFourAfterDeleting_of_source P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hfirst))
    · exact Or.inr (hasFourAfterDeleting_of_source P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hsecond))
  · rcases hC2ViewP.survives with hfirst | hsecond
    · exact Or.inl (hasFourAfterDeleting_of_source P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hfirst))
    · exact Or.inr (hasFourAfterDeleting_of_source P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hsecond))
  · rcases hC2ViewPρ.survives with hfirst | hsecond
    · exact Or.inl (hasFourAfterDeleting_of_source P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hfirst))
    · exact Or.inr (hasFourAfterDeleting_of_source P Pρ C Q A
        (by simpa only [FirstNonHitNamedRole.point] using hsecond))

end

end
end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
