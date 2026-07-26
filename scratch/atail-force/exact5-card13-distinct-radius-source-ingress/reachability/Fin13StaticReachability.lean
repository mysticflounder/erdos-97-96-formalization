/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Data.Finset.Card
import Mathlib.Logic.Relation
import Mathlib.Tactic

/-!
# The exact Fin-13 static reachability recurrence

This file supplies the generic finite ingress bridge for the static strong-
connectivity block in the exact-five card-thirteen distinct-radius source.
It does not instantiate the bridge for any of the three selected-row families
and does not generate the 1,092 source assertions.
-/

namespace Problem97
namespace ExactFiveCard13DistinctRadiusSourceIngressScratch

abbrev Label := Fin 13
abbrev ProperStage := Fin 12

/-- The source's forward Boolean recurrence, rooted at label zero. -/
def staticForward (edge : Label → Label → Bool) : ℕ → Label → Bool
  | 0, point => decide (point = 0)
  | step + 1, point =>
      staticForward edge step point ||
        (List.finRange 13).any fun source =>
          staticForward edge step source && edge source point

/-- The source's backward Boolean recurrence, rooted at label zero. -/
def staticBackward (edge : Label → Label → Bool) : ℕ → Label → Bool
  | 0, point => decide (point = 0)
  | step + 1, point =>
      staticBackward edge step point ||
        (List.finRange 13).any fun target =>
          edge point target && staticBackward edge step target

/-- Vertices reached by the forward recurrence after at most `step` arcs. -/
def staticForwardSet (edge : Label → Label → Bool) (step : ℕ) : Finset Label :=
  Finset.univ.filter fun point => staticForward edge step point = true

@[simp] theorem mem_staticForwardSet_iff
    (edge : Label → Label → Bool) (step : ℕ) (point : Label) :
    point ∈ staticForwardSet edge step ↔ staticForward edge step point = true := by
  simp [staticForwardSet]

theorem staticForward_mono
    (edge : Label → Label → Bool) {step : ℕ} {point : Label}
    (hpoint : staticForward edge step point = true) :
    staticForward edge (step + 1) point = true := by
  simp [staticForward, hpoint]

theorem staticForward_edge
    (edge : Label → Label → Bool) {step : ℕ} {source point : Label}
    (hsource : staticForward edge step source = true)
    (hedge : edge source point = true) :
    staticForward edge (step + 1) point = true := by
  simp only [staticForward, Bool.or_eq_true, List.any_eq_true,
    Bool.and_eq_true]
  exact Or.inr ⟨source, List.mem_finRange source, hsource, hedge⟩

theorem staticForwardSet_subset_succ
    (edge : Label → Label → Bool) (step : ℕ) :
    staticForwardSet edge step ⊆ staticForwardSet edge (step + 1) := by
  intro point hpoint
  exact mem_staticForwardSet_iff edge (step + 1) point |>.2
    (staticForward_mono edge
      (mem_staticForwardSet_iff edge step point |>.1 hpoint))

theorem zero_mem_staticForwardSet
    (edge : Label → Label → Bool) (step : ℕ) :
    (0 : Label) ∈ staticForwardSet edge step := by
  induction step with
  | zero => simp [staticForwardSet, staticForward]
  | succ step ih => exact staticForwardSet_subset_succ edge step ih

/-- If one recurrence stage adds no vertex, its reached set is edge-closed. -/
theorem staticForwardSet_closed_of_succ_subset
    (edge : Label → Label → Bool) (step : ℕ)
    (hstable : staticForwardSet edge (step + 1) ⊆ staticForwardSet edge step) :
    ∀ source ∈ staticForwardSet edge step, ∀ point,
      edge source point = true → point ∈ staticForwardSet edge step := by
  intro source hsource point hedge
  apply hstable
  exact mem_staticForwardSet_iff edge (step + 1) point |>.2
    (staticForward_edge edge
      (mem_staticForwardSet_iff edge step source |>.1 hsource) hedge)

/-- Strong reachability from zero makes every stable forward stage universal. -/
theorem staticForwardSet_eq_univ_of_stable
    (edge : Label → Label → Bool)
    (hreach : ∀ point : Label,
      Relation.ReflTransGen (fun source target => edge source target = true) 0 point)
    (step : ℕ)
    (hstable : staticForwardSet edge (step + 1) ⊆ staticForwardSet edge step) :
    staticForwardSet edge step = Finset.univ := by
  have hclosed := staticForwardSet_closed_of_succ_subset edge step hstable
  apply Finset.eq_univ_of_forall
  intro point
  have hpath := hreach point
  induction hpath with
  | refl => exact zero_mem_staticForwardSet edge step
  | @tail source point _ hedge ih => exact hclosed source ih point hedge

/-- Before stage twelve, a non-universal reached set strictly grows. -/
theorem staticForwardSet_ssubset_succ_of_ne_univ
    (edge : Label → Label → Bool)
    (hreach : ∀ point : Label,
      Relation.ReflTransGen (fun source target => edge source target = true) 0 point)
    (step : ℕ)
    (hne : staticForwardSet edge step ≠ Finset.univ) :
    staticForwardSet edge step ⊂ staticForwardSet edge (step + 1) := by
  refine Finset.ssubset_iff_subset_ne.mpr
    ⟨staticForwardSet_subset_succ edge step, ?_⟩
  intro heq
  apply hne
  apply staticForwardSet_eq_univ_of_stable edge hreach step
  simp [heq]

/-- At stage `step ≤ 12`, at least `step + 1` labels have been reached. -/
theorem staticForwardSet_card_lower_bound
    (edge : Label → Label → Bool)
    (hreach : ∀ point : Label,
      Relation.ReflTransGen (fun source target => edge source target = true) 0 point) :
    ∀ step : ℕ, step ≤ 12 →
      step + 1 ≤ (staticForwardSet edge step).card := by
  intro step hstep
  induction step with
  | zero =>
      exact Finset.card_pos.mpr ⟨0, zero_mem_staticForwardSet edge 0⟩
  | succ step ih =>
      have hstep_le : step ≤ 12 := by omega
      have ih' := ih hstep_le
      by_cases hfull : staticForwardSet edge step = Finset.univ
      · have hnext : staticForwardSet edge (step + 1) = Finset.univ := by
          apply Finset.Subset.antisymm (Finset.subset_univ _)
          simpa [hfull] using staticForwardSet_subset_succ edge step
        rw [hnext]
        simp
        omega
      · have hlt : (staticForwardSet edge step).card <
            (staticForwardSet edge (step + 1)).card :=
          Finset.card_lt_card
            (staticForwardSet_ssubset_succ_of_ne_univ edge hreach step hfull)
        omega

/-- Every label is forward-reached after the source's twelve transition stages. -/
theorem staticForward_twelve_eq_true
    (edge : Label → Label → Bool)
    (hreach : ∀ point : Label,
      Relation.ReflTransGen (fun source target => edge source target = true) 0 point)
    (point : Label) :
    staticForward edge 12 point = true := by
  have hcard : 13 ≤ (staticForwardSet edge 12).card :=
    staticForwardSet_card_lower_bound edge hreach 12 (by omega)
  have huniv : staticForwardSet edge 12 = Finset.univ := by
    apply Finset.eq_of_subset_of_card_le (Finset.subset_univ _)
    simpa using hcard
  exact mem_staticForwardSet_iff edge 12 point |>.1 (by simp [huniv])

theorem staticBackward_eq_staticForward_swap
    (edge : Label → Label → Bool) (step : ℕ) (point : Label) :
    staticBackward edge step point =
      staticForward (fun source target => edge target source) step point := by
  induction step generalizing point with
  | zero => rfl
  | succ step ih =>
      simp only [staticBackward, staticForward, ih]
      congr 1
      apply List.any_congr
      · rfl
      intro target
      rw [Bool.and_comm]

/-- Every label is backward-reached after the source's twelve transition stages. -/
theorem staticBackward_twelve_eq_true
    (edge : Label → Label → Bool)
    (hreach : ∀ source target : Label,
      Relation.ReflTransGen (fun left right => edge left right = true) source target)
    (point : Label) :
    staticBackward edge 12 point = true := by
  rw [staticBackward_eq_staticForward_swap]
  apply staticForward_twelve_eq_true
  intro target
  exact (hreach target 0).swap

/-- One source-faithful family of the exact Fin-13 reachability auxiliaries. -/
structure Fin13StaticReachabilityPacket (edge : Label → Label → Bool) where
  forward : Fin 13 → Label → Bool
  backward : Fin 13 → Label → Bool
  forward_zero : ∀ point,
    forward 0 point = decide (point = 0)
  backward_zero : ∀ point,
    backward 0 point = decide (point = 0)
  forward_succ : ∀ (step : ProperStage) (point : Label),
    forward ⟨step.val + 1, by omega⟩ point =
      (forward ⟨step.val, by omega⟩ point ||
        (List.finRange 13).any fun source =>
          forward ⟨step.val, by omega⟩ source && edge source point)
  backward_succ : ∀ (step : ProperStage) (point : Label),
    backward ⟨step.val + 1, by omega⟩ point =
      (backward ⟨step.val, by omega⟩ point ||
        (List.finRange 13).any fun target =>
          edge point target && backward ⟨step.val, by omega⟩ target)
  forward_terminal : ∀ point, forward 12 point = true
  backward_terminal : ∀ point, backward 12 point = true

/-- Construct the exact source recurrence packet from semantic strong
connectivity. -/
def fin13StaticReachabilityPacketOfSelectedRows
    (edge : Label → Label → Bool)
    (hreach : ∀ source target : Label,
      Relation.ReflTransGen (fun left right => edge left right = true) source target) :
    Fin13StaticReachabilityPacket edge := by
  refine {
    forward := fun step point => staticForward edge step.val point
    backward := fun step point => staticBackward edge step.val point
    forward_zero := ?_
    backward_zero := ?_
    forward_succ := ?_
    backward_succ := ?_
    forward_terminal := ?_
    backward_terminal := ?_
  }
  · intro point
    rfl
  · intro point
    rfl
  · intro step point
    rfl
  · intro step point
    rfl
  · exact staticForward_twelve_eq_true edge (hreach 0)
  · exact staticBackward_twelve_eq_true edge hreach

/-- Proposition-level ingress theorem for one source row family. -/
theorem fin13_staticReachability_of_selectedRows
    (edge : Label → Label → Bool)
    (hreach : ∀ source target : Label,
      Relation.ReflTransGen (fun left right => edge left right = true) source target) :
    Nonempty (Fin13StaticReachabilityPacket edge) :=
  ⟨fin13StaticReachabilityPacketOfSelectedRows edge hreach⟩

/-- Boolean row membership in precisely the form used by the finite source. -/
def selectedRowEdgeBits (row : Label → Finset Label)
    (center point : Label) : Bool :=
  decide (point ∈ row center)

@[simp] theorem selectedRowEdgeBits_eq_true_iff
    (row : Label → Finset Label) (center point : Label) :
    selectedRowEdgeBits row center point = true ↔ point ∈ row center := by
  simp [selectedRowEdgeBits]

/-- Construct the exact Boolean recurrence packet from selected supports. -/
def fin13StaticReachabilityPacketOfSelectedRowSupports
    (row : Label → Finset Label)
    (hreach : ∀ source target : Label,
      Relation.ReflTransGen (fun center point => point ∈ row center) source target) :
    Fin13StaticReachabilityPacket (selectedRowEdgeBits row) := by
  apply fin13StaticReachabilityPacketOfSelectedRows
  intro source target
  exact (hreach source target).mono fun _center _point hpoint => by
    simpa using hpoint

/-- Adapter from the existing source-level `ReflTransGen` theorem to the exact
Boolean recurrence packet.  The existing minimality theorem supplies `hreach`
for each selected-row family; no stronger row incidence is assumed here. -/
theorem fin13_staticReachability_of_selectedRowSupports
    (row : Label → Finset Label)
    (hreach : ∀ source target : Label,
      Relation.ReflTransGen (fun center point => point ∈ row center) source target) :
    Nonempty (Fin13StaticReachabilityPacket (selectedRowEdgeBits row)) :=
  ⟨fin13StaticReachabilityPacketOfSelectedRowSupports row hreach⟩

#print axioms fin13StaticReachabilityPacketOfSelectedRows
#print axioms fin13_staticReachability_of_selectedRows
#print axioms fin13StaticReachabilityPacketOfSelectedRowSupports
#print axioms fin13_staticReachability_of_selectedRowSupports

end ExactFiveCard13DistinctRadiusSourceIngressScratch
end Problem97
