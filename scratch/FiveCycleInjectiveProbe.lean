import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy

open scoped Matrix

private theorem five_cycle_edgeMap_injective
    {α : Type} [DecidableEq α] {a b c d e : α}
    (hcard : ({a, b, c, d, e} : Finset α).card = 5) :
    Function.Injective
      (fun i : Fin 5 => ![
        ({a, b} : Finset α), {b, c}, {c, d}, {d, e}, {e, a}] i) := by
  have hnodup : [a, b, c, d, e].Nodup := by
    rw [← Multiset.coe_nodup]
    apply Multiset.toFinset_card_eq_card_iff_nodup.mp
    simpa using hcard
  have hne :
      (a ≠ b ∧ a ≠ c ∧ a ≠ d ∧ a ≠ e) ∧
      (b ≠ c ∧ b ≠ d ∧ b ≠ e) ∧
      (c ≠ d ∧ c ≠ e) ∧ d ≠ e := by
    simpa [List.nodup_cons, not_or] using hnodup
  rcases hne with
    ⟨⟨hab, hac, had, hae⟩, ⟨hbc, hbd, hbe⟩, ⟨hcd, hce⟩, hde⟩
  have h01 : ({a, b} : Finset α) ≠ {b, c} := by
    intro h
    have hx := congrArg (fun s : Finset α => a ∈ s) h
    simpa [hab, hac] using hx
  have h02 : ({a, b} : Finset α) ≠ {c, d} := by
    intro h
    have hx := congrArg (fun s : Finset α => a ∈ s) h
    simpa [hac, had] using hx
  have h03 : ({a, b} : Finset α) ≠ {d, e} := by
    intro h
    have hx := congrArg (fun s : Finset α => a ∈ s) h
    simpa [had, hae] using hx
  have h04 : ({a, b} : Finset α) ≠ {e, a} := by
    intro h
    have hx := congrArg (fun s : Finset α => b ∈ s) h
    simpa [hab, hbe, Ne.symm hab, Ne.symm hbe] using hx
  have h12 : ({b, c} : Finset α) ≠ {c, d} := by
    intro h
    have hx := congrArg (fun s : Finset α => b ∈ s) h
    simpa [hbc, hbd] using hx
  have h13 : ({b, c} : Finset α) ≠ {d, e} := by
    intro h
    have hx := congrArg (fun s : Finset α => b ∈ s) h
    simpa [hbd, hbe] using hx
  have h14 : ({b, c} : Finset α) ≠ {e, a} := by
    intro h
    have hx := congrArg (fun s : Finset α => b ∈ s) h
    simpa [hab, hbe, Ne.symm hab, Ne.symm hbe] using hx
  have h23 : ({c, d} : Finset α) ≠ {d, e} := by
    intro h
    have hx := congrArg (fun s : Finset α => c ∈ s) h
    simpa [hcd, hce] using hx
  have h24 : ({c, d} : Finset α) ≠ {e, a} := by
    intro h
    have hx := congrArg (fun s : Finset α => c ∈ s) h
    simpa [hac, hce, Ne.symm hac, Ne.symm hce] using hx
  have h34 : ({d, e} : Finset α) ≠ {e, a} := by
    intro h
    have hx := congrArg (fun s : Finset α => d ∈ s) h
    simpa [had, hde, Ne.symm had, Ne.symm hde] using hx
  intro i j hij
  fin_cases i <;> fin_cases j <;> simp at hij ⊢
  all_goals
    first
    | exact h01 hij
    | exact h01 hij.symm
    | exact h02 hij
    | exact h02 hij.symm
    | exact h03 hij
    | exact h03 hij.symm
    | exact h04 hij
    | exact h04 hij.symm
    | exact h12 hij
    | exact h12 hij.symm
    | exact h13 hij
    | exact h13 hij.symm
    | exact h14 hij
    | exact h14 hij.symm
    | exact h23 hij
    | exact h23 hij.symm
    | exact h24 hij
    | exact h24 hij.symm
    | exact h34 hij
    | exact h34 hij.symm

#print axioms five_cycle_edgeMap_injective
