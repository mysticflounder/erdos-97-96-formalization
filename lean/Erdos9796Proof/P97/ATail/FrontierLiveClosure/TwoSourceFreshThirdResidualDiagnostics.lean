/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdQFiberThreeSynchronization

/-!
# Exact diagnostics for the FreshThird pinned-endpoint finite source theory

This module isolates the explicit finite survivor and its compiler-trusted
regression checks from the production residual and consumer module.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal
namespace FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory

/- ### Exact diagnostic model for the current query vocabulary

The packet-independent source theory is intentionally only a projection of
the geometry.  The following finite model records that this projection is
still consistent even after all source-proved relational closure laws above
are included.  Consequently a CEGAR run over exactly this vocabulary cannot
soundly end in UNSAT; one further source theorem must first be exported.

The two deliberate aliases are `pinnedCenter = canonicalSource` and
`boundaryCenter = freshSourceTwo`.  Every other role has its own rank. -/

section DiagnosticChecks

private def diagnosticRank :
    FreshThirdPinnedEndpointOutsideSeedPointRole → Nat
  | .freshSourceOne => 0
  | .freshCenter => 1
  | .freshSourceTwo | .boundaryCenter => 2
  | .sourceCenter => 3
  | .canonicalSource | .pinnedCenter => 4
  | .canonicalSecondSource => 5
  | .freshRemainder i => 6 + i
  | .fanSource i => 8 + i
  | .boundarySource i => 12 + i
  | .blockerCenter i => 16 + i
  | .blockerRowSource i j =>
      if j = 0 then 8 + i else 20 + 3 * i + (j.1 - 1)

private def diagnosticSame
    (left right : FreshThirdPinnedEndpointOutsideSeedPointRole) : Bool :=
  decide (diagnosticRank left = diagnosticRank right)

private def diagnosticIncident
    (point : FreshThirdPinnedEndpointOutsideSeedPointRole)
    (row : FreshThirdPinnedEndpointOutsideSeedRowRole) : Bool :=
  decide (∃ i : Fin 4,
    diagnosticRank point =
      diagnosticRank (freshThirdPinnedEndpointOutsideSeedRowSlot row i))

private def diagnosticInCap
    (point : FreshThirdPinnedEndpointOutsideSeedPointRole) (cap : Fin 3) : Bool :=
  let rank := diagnosticRank point
  decide
    (((rank = 3 ∨ rank = 4 ∨ rank = 5) ∧ cap = 0) ∨
      (rank = 1 ∧ cap = 1) ∨
      (16 ≤ rank ∧ rank < 20 ∧ cap = 1) ∨
      (rank = 2 ∧ cap = 2) ∨
      ((rank = 12 ∨ rank = 13) ∧ cap = 2) ∨
      (rank ≠ 1 ∧ rank ≠ 2 ∧ rank ≠ 3 ∧ rank ≠ 4 ∧ rank ≠ 5 ∧
        ¬ (16 ≤ rank ∧ rank < 20) ∧ rank ≠ 12 ∧ rank ≠ 13 ∧ cap = 1))

private def diagnosticInCapInterior
    (point : FreshThirdPinnedEndpointOutsideSeedPointRole) (cap : Fin 3) : Bool :=
  let rank := diagnosticRank point
  decide
    (((rank = 3 ∨ rank = 4 ∨ rank = 5) ∧ cap = 0) ∨
      (rank = 1 ∧ cap = 1) ∨
      (16 ≤ rank ∧ rank < 20 ∧ cap = 1))

private def diagnosticBefore
    (left right : FreshThirdPinnedEndpointOutsideSeedPointRole) : Bool :=
  decide (diagnosticRank left < diagnosticRank right)

private def diagnosticSameDistanceFrom
    (center left right : FreshThirdPinnedEndpointOutsideSeedPointRole) : Bool :=
  decide
    (diagnosticRank left = diagnosticRank right ∨
      ∃ row : FreshThirdPinnedEndpointOutsideSeedRowRole,
        diagnosticRank center =
            diagnosticRank (freshThirdPinnedEndpointOutsideSeedRowCenter row) ∧
          diagnosticIncident left row = true ∧
          diagnosticIncident right row = true)

private def diagnosticHasFourAfterDeleting
    (deleted center : FreshThirdPinnedEndpointOutsideSeedPointRole) : Bool :=
  decide
    ((diagnosticRank center = diagnosticRank .pinnedCenter ∧
        diagnosticIncident deleted .fan = false) ∨
      ∃ i : Fin 4,
        diagnosticRank center = diagnosticRank (.blockerCenter i) ∧
          diagnosticIncident deleted (.blocker i) = false)

/-- A concrete assignment satisfying the complete currently exported source
theory.  It is a diagnostic abstraction model, not a Euclidean realization. -/
def diagnosticAssignment :
    FreshThirdPinnedEndpointOutsideSeedFiniteAssignment where
  samePoint := diagnosticSame
  incident := diagnosticIncident
  inCap := diagnosticInCap
  inCapInterior := diagnosticInCapInterior
  before := diagnosticBefore
  sameDistanceFrom := diagnosticSameDistanceFrom
  hasFourAfterDeleting := diagnosticHasFourAfterDeleting
  nonrobust := fun _ ↦ true

/-- Distinguished cap labels for the exact diagnostic assignment. -/
def diagnosticConfiguration :
    FreshThirdPinnedEndpointOutsideSeedFiniteConfiguration where
  assignment := diagnosticAssignment
  firstCap := 0
  freshCap := 1
  rowCap := 2
  blockerCap := fun _ ↦ 1

private theorem diagnostic_seed_sameDistanceFrom_pinned_iff_eq (i j : Fin 6) :
    diagnosticAssignment.SameDistanceFrom .pinnedCenter
        (freshThirdPinnedEndpointOutsideSeedSeedRole i)
        (freshThirdPinnedEndpointOutsideSeedSeedRole j) ↔
      i = j := by
  fin_cases i <;> fin_cases j <;> decide

/-- The current packet-independent source theory is satisfiable.

This machine-checked model is the fail-closed boundary for the next CEGAR
wave: no UNSAT claim may be sought until a newly source-proved predicate rules
out this model (and its analogues). -/
theorem diagnosticConfiguration_sourceTheory :
    FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory
      diagnosticConfiguration := by
  refine
    { relational :=
        { rowTheory :=
            { same_refl := by decide
              same_symm := by decide
              same_trans := by
                intro left middle right hleft hright
                simp only [
                  FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same,
                  diagnosticConfiguration, diagnosticAssignment, diagnosticSame,
                  decide_eq_true_eq] at hleft hright ⊢
                exact hleft.trans hright
              slot_same_iff_eq := by decide
              incident_iff_slot := by decide
              row_center_not_incident := by decide
              row_slots_same_distance := by decide }
          inCap_congr := by decide
          inCapInterior_congr := by decide
          interior_in_cap := by decide
          interior_not_in_other_cap := by decide
          before_congr := by
            intro left left' right right' hleft hright
            simp only [
              FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same,
              FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Before,
              diagnosticConfiguration, diagnosticAssignment, diagnosticSame,
              diagnosticBefore, decide_eq_true_eq] at hleft hright ⊢
            rw [hleft, hright]
          before_irrefl := by decide
          before_trans := by
            intro left middle right hleft hright
            simp only [
              FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Before,
              diagnosticConfiguration, diagnosticAssignment, diagnosticBefore,
              decide_eq_true_eq] at hleft hright ⊢
            exact hleft.trans hright
          before_or_same_or_after := by decide
          sameDistanceFrom_congr := by
            intro center center' left left' right right' hcenter hleft hright
            simp only [
              FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same,
              FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.SameDistanceFrom,
              diagnosticConfiguration, diagnosticAssignment, diagnosticSame,
              diagnosticSameDistanceFrom, diagnosticIncident, decide_eq_true_eq]
              at hcenter hleft hright ⊢
            rw [hcenter, hleft, hright]
          sameDistanceFrom_refl := by decide
          sameDistanceFrom_symm := by
            intro center left right
            simp only [
              FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.SameDistanceFrom,
              diagnosticConfiguration, diagnosticAssignment,
              diagnosticSameDistanceFrom, decide_eq_true_eq]
            constructor
            · rintro (hlr | ⟨row, hcenter, hleft, hright⟩)
              · exact Or.inl hlr.symm
              · exact Or.inr ⟨row, hcenter, hright, hleft⟩
            · rintro (hrl | ⟨row, hcenter, hright, hleft⟩)
              · exact Or.inl hrl.symm
              · exact Or.inr ⟨row, hcenter, hleft, hright⟩
          hasFourAfterDeleting_congr := by
            intro deleted deleted' center center' hdeleted hcenter
            simp only [
              FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.Same,
              FreshThirdPinnedEndpointOutsideSeedFiniteAssignment.HasFourAfterDeleting,
              diagnosticConfiguration, diagnosticAssignment, diagnosticSame,
              diagnosticHasFourAfterDeleting, diagnosticIncident,
              decide_eq_true_eq] at hdeleted hcenter ⊢
            rw [hdeleted, hcenter]
          blocked_deletion_nonrobust := by decide
          nonrobust_congr := by decide }
      seed_same_iff_eq := by decide
      pinned_in_seed := by decide
      pinned_ne_sourceCenter := by decide
      pinned_ne_freshCenter := by decide
      seed_multiplicity := by
        intro e _ hall
        have h01 : e (0 : Fin 4) = e 1 :=
          (diagnostic_seed_sameDistanceFrom_pinned_iff_eq (e 0) (e 1)).1
            (hall 1)
        exact (by decide : (0 : Fin 4) ≠ 1) (e.injective h01)
      source_center_first_cap := by decide
      canonical_sources_first_cap := by decide
      source_fresh_overlap_two := by decide
      fresh_cap_ne_first := by decide
      fresh_center_cap := by decide
      endpoints_outside_first := by decide
      point_in_some_cap := by decide
      ordered_boundary_row := by
        unfold FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.OrderedRowAtWith
        refine Or.inl ?_
        refine Or.inl ⟨by decide, by decide, by decide, by decide, by decide, ?_⟩
        unfold FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.EndpointCapSplitAt
        exact ⟨Or.inl (by decide), by decide, by decide, by decide⟩
      fan_source_outside_seed := by
        refine ⟨0, ?_⟩
        intro i
        fin_cases i <;> decide
      endpoint_split := by
        left
        refine ⟨by decide, 0, ?_⟩
        intro i
        fin_cases i <;> decide
      sourceFaithfulFan := by
        intro i
        refine ⟨?_, ?_, Or.inr ⟨?_, ?_⟩⟩
        · fin_cases i <;> decide
        · fin_cases i <;> decide
        · fin_cases i <;> decide
        · fin_cases i <;> decide
      blocker_source_incident := by decide
      pinned_deletion_survives_iff_robust_or_not_incident := by decide
      blocker_deletion_survives_iff_not_incident := by decide
      blocker_row_all_deletions_blocked := by decide
      normalizedFan := by
        right
        refine ⟨?_, ?_, ?_⟩
        · intro i
          fin_cases i <;> decide
        · refine ⟨0, 1, by decide, 1, by decide, by decide, ?_⟩
          exact Or.inr (Or.inl (by decide))
        · exact ⟨0, 1, by decide, by decide, by decide, by decide⟩ }

/-- The diagnostic model escapes the existing actual-row synchronization
gate: no named point of the fan row occurs in the fresh selected row. -/
theorem diagnostic_fan_fresh_slots_separated (i j : Fin 4) :
    ¬ diagnosticAssignment.Same
      (freshThirdPinnedEndpointOutsideSeedRowSlot .fan i)
      (freshThirdPinnedEndpointOutsideSeedRowSlot .fresh j) := by
  fin_cases i <;> fin_cases j <;> decide

/-- Adding the four currently named blocker rows does not repair that escape:
each of them is also pointwise disjoint from the fresh selected row. -/
theorem diagnostic_blocker_fresh_slots_separated (i j k : Fin 4) :
    ¬ diagnosticAssignment.Same
      (freshThirdPinnedEndpointOutsideSeedRowSlot (.blocker i) j)
      (freshThirdPinnedEndpointOutsideSeedRowSlot .fresh k) := by
  fin_cases i <;> fin_cases j <;> fin_cases k <;> decide

/-- The source-derived exact-three fiber partition still admits the current
disjoint fan/`Q` diagnostic model.  All conditional blocker-center clauses are
vacuous because no fan source aliases a `Q`-row slot.

This is a machine-checked stop rule: adding only the exact-three partition to
the finite query cannot yield a sound universal UNSAT result. -/
theorem diagnosticConfiguration_qFiberThreeBoundaryConstraint :
    FreshThirdQFiberThreeFiniteBoundaryConstraint diagnosticConfiguration := by
  refine ⟨2, Or.inl rfl, ?_, ?_⟩
  · intro fanIndex freshSlot _ hsame
    exfalso
    exact diagnostic_fan_fresh_slots_separated fanIndex freshSlot <| by
      simpa [freshThirdQFiberThreeFreshSlot,
        freshThirdPinnedEndpointOutsideSeedRowSlot] using hsame
  · intro fanIndex hsame
    exfalso
    exact diagnostic_fan_fresh_slots_separated fanIndex 2 <| by
      simpa [freshThirdQFiberThreeFreshSlot,
        freshThirdPinnedEndpointOutsideSeedRowSlot] using hsame

/-- The diagnostic model also satisfies the exact two-circle overlap bound
for every pair of visible rows.  In particular, the strengthened query still
has a model for a geometric reason visible at the finite level, not because
that generic row law was omitted. -/
theorem diagnosticConfiguration_visibleRowGeometryConstraint :
    FreshThirdVisibleRowGeometryConstraint diagnosticConfiguration := by
  intro left right
  fin_cases left <;> fin_cases right <;> decide

/-- The same diagnostic model satisfies every source-derived shared-pair
cyclic-separation clause among the visible rows. -/
theorem diagnosticConfiguration_visibleRowSharedPairSeparationConstraint :
    FreshThirdVisibleRowSharedPairSeparationConstraint
      diagnosticConfiguration := by
  intro left right i j
  fin_cases left <;> fin_cases right <;>
    fin_cases i <;> fin_cases j <;> decide

private theorem diagnostic_bc_row_pair :
    ∀ bRow cRow : FreshThirdPinnedEndpointOutsideSeedRowRole,
      diagnosticAssignment.Before
        (freshThirdPinnedEndpointOutsideSeedRowCenter bRow)
        (freshThirdPinnedEndpointOutsideSeedRowCenter cRow) →
      diagnosticAssignment.Incident
        (freshThirdPinnedEndpointOutsideSeedRowCenter bRow) cRow →
      bRow = .boundary ∧ cRow = .source := by
  decide

private theorem diagnostic_no_boundary_point_before_boundary_center :
    ∀ a : FreshThirdPinnedEndpointOutsideSeedPointRole,
      diagnosticAssignment.Before a .boundaryCenter →
      diagnosticAssignment.Incident a .boundary → False := by
  decide

private theorem diagnostic_de_row_pair :
    ∀ dRow eRow : FreshThirdPinnedEndpointOutsideSeedRowRole,
      diagnosticAssignment.Before
        (freshThirdPinnedEndpointOutsideSeedRowCenter dRow)
        (freshThirdPinnedEndpointOutsideSeedRowCenter eRow) →
      diagnosticAssignment.Incident
        (freshThirdPinnedEndpointOutsideSeedRowCenter eRow) dRow →
      (dRow = .fresh ∧ eRow = .boundary) ∨
        (dRow = .source ∧ eRow = .fan) := by
  decide

private theorem diagnostic_no_fresh_boundary_common_point :
    ∀ a : FreshThirdPinnedEndpointOutsideSeedPointRole,
      diagnosticAssignment.Incident a .fresh →
      diagnosticAssignment.Incident a .boundary → False := by
  decide

private theorem diagnostic_no_source_fan_common_point :
    ∀ a : FreshThirdPinnedEndpointOutsideSeedPointRole,
      diagnosticAssignment.Incident a .source →
      diagnosticAssignment.Incident a .fan → False := by
  decide

/-- The diagnostic model also avoids both visible five-point forbidden
patterns. -/
theorem diagnosticConfiguration_visibleFivePointConstraint :
    FreshThirdVisibleFivePointConstraint diagnosticConfiguration := by
  constructor
  · intro a _d _e bRow cRow haB hBC _hCd _hde haBRow _heBRow _haC hBcenterC _hdC
    rcases diagnostic_bc_row_pair bRow cRow hBC hBcenterC with ⟨rfl, rfl⟩
    exact diagnostic_no_boundary_point_before_boundary_center a haB haBRow
  · intro a _b _c dRow eRow _hab _hbc _hcD hDE haD _hcDRow hEcenterD haE _hbE
    rcases diagnostic_de_row_pair dRow eRow hDE hEcenterD with hpair | hpair
    · rcases hpair with ⟨rfl, rfl⟩
      exact diagnostic_no_fresh_boundary_common_point a haD haE
    · rcases hpair with ⟨rfl, rfl⟩
      exact diagnostic_no_source_fan_common_point a haD haE

/-- Exact cap profile of the boundary row in the diagnostic model.

Every boundary-row point avoids the first cap, while the four slots split
two-and-two between the row cap and the fresh cap.  This corrects the stronger
but false claim that the row avoided both source-adjacent caps: the present
source theory does expose fresh-cap witnesses, but it still does not couple
them to the pinned fan or any blocker row. -/
theorem diagnostic_boundary_exact_cap_profile :
    (∀ i : Fin 4,
      ¬ diagnosticAssignment.InCap
        (freshThirdPinnedEndpointOutsideSeedRowSlot .boundary i)
        diagnosticConfiguration.firstCap) ∧
      FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowCapInsideCount
          diagnosticAssignment .boundary diagnosticConfiguration.rowCap = 2 ∧
      FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowCapOutsideCount
          diagnosticAssignment .boundary diagnosticConfiguration.rowCap = 2 ∧
      FreshThirdPinnedEndpointOutsideSeedFiniteConstraint.RowCapInsideCount
          diagnosticAssignment .boundary diagnosticConfiguration.freshCap = 2 := by
  decide

end DiagnosticChecks

end FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory

/-- There is no sound rejection contract over only the currently exported
finite source theory: `diagnosticConfiguration` is an explicit model. -/
theorem FreshThirdPinnedEndpointOutsideSeedFiniteQueryContract.not_of_currentSourceTheory :
    ¬ FreshThirdPinnedEndpointOutsideSeedFiniteQueryContract := by
  intro Contract
  exact Contract.reject
    FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory.diagnosticConfiguration
    FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory.diagnosticConfiguration_sourceTheory

/-- Even after adding the exact source-derived three-fiber partition, the
intrinsic finite theory has an explicit model.  A terminating CEGAR query must
therefore add a new carrier-wide source theorem, not merely encode the
partition more faithfully. -/
theorem FreshThirdQFiberThreeFiniteQueryContract.not_of_currentSourceTheory :
    ¬ FreshThirdQFiberThreeFiniteQueryContract := by
  intro Contract
  exact Contract.reject
    FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory.diagnosticConfiguration
    FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory.diagnosticConfiguration_sourceTheory
    FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory.diagnosticConfiguration_visibleRowGeometryConstraint
    FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory.diagnosticConfiguration_visibleRowSharedPairSeparationConstraint
    FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory.diagnosticConfiguration_visibleFivePointConstraint
    FreshThirdPinnedEndpointOutsideSeedFiniteSourceTheory.diagnosticConfiguration_qFiberThreeBoundaryConstraint

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
