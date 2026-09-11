/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Std.Sat.CNF
import Std.Sat.CNF.Relabel

/-!
# List-backed CNF formulas

Lean v4.33 changed `Std.Sat.CNF α` from the abbreviation
`List (Std.Sat.CNF.Clause α)` to a structure holding an `Array` of clauses.
The certificate-bank modules of this project state their formulas and
evaluation facts against the list representation and its `List` lemmas.
`ListCNF` reproduces the v4.27.0 definitions verbatim so that those statements
keep their meaning; clauses and literals are still the upstream
`Std.Sat.CNF.Clause` and `Std.Sat.Literal`.
-/

/-- A CNF formula as a list of clauses (the `ListCNF` of Lean v4.27.0). -/
abbrev ListCNF (α : Type u) : Type u := List (Std.Sat.CNF.Clause α)

namespace ListCNF

open Std.Sat

/-- Evaluating a `ListCNF` formula with respect to an assignment `a`. -/
def eval (a : α → Bool) (f : ListCNF α) : Bool := f.all fun c => c.eval a

@[simp] theorem eval_nil (a : α → Bool) : eval a [] = true := rfl

@[simp] theorem eval_cons (a : α → Bool) {c : CNF.Clause α} {f : ListCNF α} :
    eval a (c :: f) = (c.eval a && eval a f) := rfl

@[simp] theorem eval_append (a : α → Bool) (f1 f2 : ListCNF α) :
    eval a (f1 ++ f2) = (eval a f1 && eval a f2) := List.all_append

/-- The assignment `a` satisfies the formula `f`. -/
def Sat (a : α → Bool) (f : ListCNF α) : Prop := eval a f = true

/-- No assignment satisfies the formula `f`. -/
def Unsat (f : ListCNF α) : Prop := ∀ a, eval a f = false

theorem sat_def (a : α → Bool) (f : ListCNF α) : Sat a f ↔ (eval a f = true) := by rfl

theorem unsat_def (f : ListCNF α) : Unsat f ↔ (∀ a, eval a f = false) := by rfl

@[simp] theorem not_unsat_nil : ¬Unsat ([] : ListCNF α) :=
  fun h => by simp [unsat_def] at h

@[simp] theorem sat_nil {assign : α → Bool} : Sat assign ([] : ListCNF α) := by
  simp [sat_def]

@[simp] theorem unsat_nil_cons {g : ListCNF α} : Unsat ([] :: g) := by
  simp [unsat_def]

/-- Relabel the variables of a formula (the v4.27.0 `ListCNF.relabel`). -/
def relabel (r : α → β) (f : ListCNF α) : ListCNF β := f.map (CNF.Clause.relabel r)

@[simp] theorem relabel_nil {r : α → β} : relabel r [] = [] := by simp [relabel]

@[simp] theorem relabel_cons {r : α → β} {c : CNF.Clause α} {f : ListCNF α} :
    relabel r (c :: f) = (c.relabel r) :: relabel r f := by
  simp [relabel]

@[simp] theorem eval_relabel (r : α → β) (a : β → Bool) (f : ListCNF α) :
    eval a (relabel r f) = eval (a ∘ r) f := by
  induction f with
  | nil => rfl
  | cons c f ih => simp [ih]

@[simp] theorem relabel_append {r : α → β} {f1 f2 : ListCNF α} :
    relabel r (f1 ++ f2) = relabel r f1 ++ relabel r f2 :=
  List.map_append

/-- Variable `v` occurs in the formula `f` (the v4.27.0 `ListCNF.Mem`). -/
def Mem (v : α) (f : ListCNF α) : Prop := ∃ c, c ∈ f ∧ c.Mem v

theorem mem_of {f : ListCNF α} {c : CNF.Clause α} (h : c ∈ f) (w : CNF.Clause.Mem v c) :
    Mem v f := ⟨c, h, w⟩

@[simp] theorem relabel_relabel {r1 : β → γ} {r2 : α → β} {f : ListCNF α} :
    relabel r1 (relabel r2 f) = relabel (r1 ∘ r2) f := by
  simp only [relabel, List.map_map, CNF.Clause.relabel_relabel']

@[simp] theorem relabel_id {x : ListCNF α} : relabel id x = x := by simp [relabel]

theorem relabel_congr {f : ListCNF α} {r1 r2 : α → β} (hw : ∀ v, Mem v f → r1 v = r2 v) :
    relabel r1 f = relabel r2 f := by
  dsimp only [relabel]
  rw [List.map_congr_left]
  intro c h
  apply CNF.Clause.relabel_congr
  intro v m
  exact hw _ (mem_of h m)

theorem sat_relabel {f : ListCNF α} {r1 : β → Bool} {r2 : α → β} (h : Sat (r1 ∘ r2) f) :
    Sat r1 (relabel r2 f) := by
  simp_all [sat_def]

theorem unsat_relabel {f : ListCNF α} (r : α → β) (h : Unsat f) :
    Unsat (relabel r f) := by
  simp_all [unsat_def]

theorem nonempty_or_impossible (f : ListCNF α) :
    Nonempty α ∨ ∃ n, f = List.replicate n [] := by
  induction f with
  | nil => exact Or.inr ⟨0, rfl⟩
  | cons c x ih => match c with
    | [] => cases ih with
      | inl h => left; exact h
      | inr h =>
        obtain ⟨n, rfl⟩ := h
        right
        exact ⟨n + 1, rfl⟩
    | ⟨a, b⟩ :: c => exact Or.inl ⟨a⟩

theorem unsat_relabel_iff {f : ListCNF α} {r : α → β}
    (hw : ∀ {v1 v2}, Mem v1 f → Mem v2 f → r v1 = r v2 → v1 = v2) :
    Unsat (relabel r f) ↔ Unsat f := by
  rcases nonempty_or_impossible f with (⟨⟨a₀⟩⟩ | ⟨n, rfl⟩)
  · refine ⟨fun h => ?_, unsat_relabel r⟩
    have em := Classical.propDecidable
    let g : β → α := fun b =>
      if h : ∃ a, Mem a f ∧ r a = b then h.choose else a₀
    have h' := unsat_relabel g h
    suffices w : relabel g (relabel r f) = f by
      rwa [w] at h'
    have : ∀ a, Mem a f → g (r a) = a := by
      intro v h
      dsimp [g]
      rw [dif_pos ⟨v, h, rfl⟩]
      apply hw _ h
      · exact (Exists.choose_spec (⟨v, h, rfl⟩ : ∃ a', Mem a' f ∧ r a' = r v)).2
      · exact (Exists.choose_spec (⟨v, h, rfl⟩ : ∃ a', Mem a' f ∧ r a' = r v)).1
    rw [relabel_relabel, relabel_congr, relabel_id]
    exact this
  · cases n <;> simp [unsat_def, List.replicate_succ]

/-- The list-backed formula and the upstream array-backed formula with the same
clauses evaluate identically. -/
theorem eval_eq_std (a : α → Bool) (f : ListCNF α) :
    eval a f = CNF.eval a ⟨f.toArray⟩ := by
  simp [eval, CNF.eval]

/-- The upstream array-backed formula with the same clauses. -/
def toStd (f : ListCNF α) : CNF α := ⟨f.toArray⟩

/-- Unsatisfiability transfers from the array-backed formula (as established by
the reflective LRAT checker `Std.Tactic.BVDecide.Reflect.verifyCert_correct`)
to the list-backed one. -/
theorem unsat_of_toStd_unsat {f : ListCNF α} (h : CNF.Unsat (toStd f)) : Unsat f := by
  intro a
  rw [eval_eq_std]
  exact h a

end ListCNF
