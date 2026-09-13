/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBank
import Erdos9796Proof.P97.ListCNF

/-!
# Proof-carrying coverage for the surplus COMP-G bank

This module gives semantic adapters from valid pinned fragments to finite CNF
instances used by kernel-checked coverage certificates.
-/

namespace Problem97
namespace SurplusCOMPGBankCoverage

open SurplusCOMPGBank

/-- A candidate-choice SAT atom records a center and one candidate mask. -/
structure Atom where
  center : Label
  mask : Nat
  deriving DecidableEq, Repr

/-- Signed literals for the candidate-choice CNF. -/
inductive Literal where
  | pos : Atom → Literal
  | neg : Atom → Literal
  deriving DecidableEq, Repr

/-- A disjunctive clause in the typed candidate-choice encoding. -/
abbrev Clause := List Literal

/-- A conjunction of typed candidate-choice clauses. -/
abbrev CNF := List Clause

/-- Propositional meaning of a typed literal under an assignment. -/
def Literal.Holds (assignment : Atom → Prop) : Literal → Prop
  | .pos atom => assignment atom
  | .neg atom => ¬assignment atom

/-- A clause is satisfied when one of its literals holds. -/
def ClauseSatisfied (assignment : Atom → Prop) (clause : Clause) : Prop :=
  ∃ literal ∈ clause, literal.Holds assignment

/-- A CNF is satisfied when each of its clauses is satisfied. -/
def CNFSatisfied (assignment : Atom → Prop) (cnf : CNF) : Prop :=
  ∀ clause ∈ cnf, ClauseSatisfied assignment clause

/-- The assignment selected by a concrete shadow. -/
def shadowAssignment (shadow : Shadow) (atom : Atom) : Prop :=
  shadow.centerMask atom.center = atom.mask

/-- Candidate masks compatible with every already fixed center. -/
def candidateDomain (sstar : Label) (fixed : List (Label × Nat))
    (center : Label) : List Nat :=
  (candidateMasks sstar center).filter fun mask =>
    fixed.all fun entry =>
      crossSeparationOKForMasks center mask entry.1 entry.2

/-- Ordered pairs in list order, with each unordered pair occurring once. -/
def strictPairs {α : Type} : List α → List (α × α)
  | [] => []
  | head :: tail => tail.map (head, ·) ++ strictPairs tail

/-- At-most-one clauses for one center's candidate domain. -/
def atMostOneClauses (center : Label) (domain : List Nat) : CNF :=
  (strictPairs domain).map fun pair =>
    [.neg ⟨center, pair.1⟩, .neg ⟨center, pair.2⟩]

/-- Binary incompatibility clauses for one ordered center pair. -/
def incompatibleClausesFor (sstar : Label) (fixed : List (Label × Nat))
    (center other : Label) : CNF :=
  (candidateDomain sstar fixed center).flatMap fun mask =>
    (candidateDomain sstar fixed other).filterMap fun otherMask =>
      if crossSeparationOKForMasks center mask other otherMask then
        none
      else
        some [.neg ⟨center, mask⟩, .neg ⟨other, otherMask⟩]

/-- Candidate-choice CNF used by singleton depth-two cells.

The four clause families are emitted in the same order as the DIMACS encoder:
one positive domain clause per free center, pairwise at-most-one clauses within
each domain, cross-separation incompatibilities, and the target blocker. -/
def singletonCandidateCNF (sstar : Label) (fixed : List (Label × Nat))
    (free : List Label) (target : Label → Nat) : CNF :=
  free.map (fun center =>
      (candidateDomain sstar fixed center).map fun mask => .pos ⟨center, mask⟩) ++
    free.flatMap (fun center =>
      atMostOneClauses center (candidateDomain sstar fixed center)) ++
    (strictPairs free).flatMap (fun centers =>
      incompatibleClausesFor sstar fixed centers.1 centers.2) ++
    [free.map fun center => .neg ⟨center, target center⟩]

private theorem mem_strictPairs_left_right {α : Type} {left right : α} {items : List α}
    (h : (left, right) ∈ strictPairs items) :
    left ∈ items ∧ right ∈ items := by
  induction items with
  | nil => simp [strictPairs] at h
  | cons head tail ih =>
      simp only [strictPairs, List.mem_append, List.mem_map] at h
      rcases h with h | h
      · rcases h with ⟨item, hitem, heq⟩
        cases heq
        exact ⟨by simp, by simp [hitem]⟩
      · exact ⟨by simp [ih h |>.1], by simp [ih h |>.2]⟩

private theorem mem_strictPairs_ne {α : Type} {left right : α} {items : List α}
    [DecidableEq α] (hnodup : items.Nodup)
    (h : (left, right) ∈ strictPairs items) :
    left ≠ right := by
  induction items with
  | nil => simp [strictPairs] at h
  | cons head tail ih =>
      rw [List.nodup_cons] at hnodup
      simp only [strictPairs, List.mem_append, List.mem_map] at h
      rcases h with h | h
      · rcases h with ⟨item, hitem, heq⟩
        cases heq
        exact fun heq => hnodup.1 (heq ▸ hitem)
      · exact ih hnodup.2 h

private theorem candidateMasks_nodup (sstar center : Label) :
    (candidateMasks sstar center).Nodup := by
  cases sstar <;> cases center <;> decide

private theorem shadow_mask_mem_candidateDomain
    {sstar : Label} {shadow : Shadow} {fixed : List (Label × Nat)}
    {free : List Label} {center : Label}
    (hvalid : isValidPinnedFragment sstar shadow = true)
    (hcenter : center ∈ free)
    (hdisjoint : ∀ c ∈ free, ∀ entry ∈ fixed, c ≠ entry.1)
    (hfixed : ∀ entry ∈ fixed, shadow.centerMask entry.1 = entry.2) :
    shadow.centerMask center ∈ candidateDomain sstar fixed center := by
  rw [candidateDomain, List.mem_filter]
  refine ⟨mem_candidateMasks_of_isValidPinnedFragment hvalid, ?_⟩
  rw [List.all_eq_true]
  intro entry hentry
  rw [← hfixed entry hentry]
  exact crossSeparationOKForMasks_of_searchSeparationOK
    (searchSeparationOK_of_isValidPinnedFragment hvalid)
    (hdisjoint center hcenter entry hentry)

private theorem atLeastOneClause_satisfied
    {sstar : Label} {shadow : Shadow} {fixed : List (Label × Nat)}
    {free : List Label} {center : Label}
    (hvalid : isValidPinnedFragment sstar shadow = true)
    (hcenter : center ∈ free)
    (hdisjoint : ∀ c ∈ free, ∀ entry ∈ fixed, c ≠ entry.1)
    (hfixed : ∀ entry ∈ fixed, shadow.centerMask entry.1 = entry.2) :
    ClauseSatisfied (shadowAssignment shadow)
      ((candidateDomain sstar fixed center).map fun mask => .pos ⟨center, mask⟩) := by
  let mask := shadow.centerMask center
  refine ⟨.pos ⟨center, mask⟩, ?_, rfl⟩
  exact List.mem_map.mpr ⟨mask,
    shadow_mask_mem_candidateDomain hvalid hcenter hdisjoint hfixed, rfl⟩

private theorem atMostOneClause_satisfied
    {shadow : Shadow} {center : Label} {domain : List Nat} {clause : Clause}
    (hdomain : domain.Nodup)
    (hclause : clause ∈ atMostOneClauses center domain) :
    ClauseSatisfied (shadowAssignment shadow) clause := by
  rw [atMostOneClauses] at hclause
  rcases List.mem_map.mp hclause with ⟨pair, hpair, rfl⟩
  have hne : pair.1 ≠ pair.2 := mem_strictPairs_ne hdomain hpair
  by_cases hleft : shadow.centerMask center = pair.1
  · refine ⟨.neg ⟨center, pair.2⟩, by simp, ?_⟩
    intro hright
    exact hne (hleft.symm.trans hright)
  · exact ⟨.neg ⟨center, pair.1⟩, by simp, hleft⟩

private theorem incompatibleClause_satisfied
    {sstar : Label} {shadow : Shadow} {fixed : List (Label × Nat)}
    {center other : Label} {clause : Clause}
    (hvalid : isValidPinnedFragment sstar shadow = true)
    (hne : center ≠ other)
    (hclause : clause ∈ incompatibleClausesFor sstar fixed center other) :
    ClauseSatisfied (shadowAssignment shadow) clause := by
  rw [incompatibleClausesFor] at hclause
  rcases List.mem_flatMap.mp hclause with ⟨mask, hmask, hclause⟩
  rcases List.mem_filterMap.mp hclause with ⟨otherMask, hotherMask, heq⟩
  split at heq
  · cases heq
  · rename_i hbad
    cases heq
    by_cases hleft : shadow.centerMask center = mask
    · refine ⟨.neg ⟨other, otherMask⟩, by simp, ?_⟩
      intro hright
      have hgood := crossSeparationOKForMasks_of_searchSeparationOK
        (searchSeparationOK_of_isValidPinnedFragment hvalid) hne
      rw [hleft, hright] at hgood
      exact hbad hgood
    · exact ⟨.neg ⟨center, mask⟩, by simp, hleft⟩

/-- Any valid fragment agreeing with the fixed masks and differing from the
blocked target at a free center satisfies the generic singleton CNF. -/
theorem validFragment_satisfies_singletonCandidateCNF
    {sstar : Label} {shadow : Shadow} {fixed : List (Label × Nat)}
    {free : List Label} {target : Label → Nat}
    (hvalid : isValidPinnedFragment sstar shadow = true)
    (hfree : free.Nodup)
    (hdisjoint : ∀ center ∈ free, ∀ entry ∈ fixed, center ≠ entry.1)
    (hfixed : ∀ entry ∈ fixed, shadow.centerMask entry.1 = entry.2)
    (hdiff : ∃ center ∈ free, shadow.centerMask center ≠ target center) :
    CNFSatisfied (shadowAssignment shadow)
      (singletonCandidateCNF sstar fixed free target) := by
  intro clause hclause
  simp only [singletonCandidateCNF, List.mem_append, List.mem_singleton] at hclause
  rcases hclause with ((hclause | hclause) | hclause) | rfl
  · rcases List.mem_map.mp hclause with ⟨center, hcenter, rfl⟩
    exact atLeastOneClause_satisfied hvalid hcenter hdisjoint hfixed
  · rcases List.mem_flatMap.mp hclause with ⟨center, hcenter, hclause⟩
    apply atMostOneClause_satisfied _ hclause
    exact List.Nodup.filter _ (candidateMasks_nodup sstar center)
  · rcases List.mem_flatMap.mp hclause with ⟨centers, hcenters, hclause⟩
    exact incompatibleClause_satisfied hvalid (mem_strictPairs_ne hfree hcenters) hclause
  · rcases hdiff with ⟨center, hcenter, hne⟩
    exact ⟨.neg ⟨center, target center⟩, List.mem_map.mpr ⟨center, hcenter, rfl⟩, hne⟩

/-- Fixed masks for the `(s1, 777)` depth-two singleton cell. -/
def s1777Fixed : List (Label × Nat) := [(.v, 201), (.w, 777)]

/-- Free centers in the same order as the `(s1, 777)` DIMACS variable map. -/
def s1777Free : List Label := [.u, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2]

/-- The unique target tuple for the `(s1, 777)` depth-two cell. -/
def s1777Target : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 777
  | .s1 => 534
  | .s2 => 354
  | .s3 => 92
  | .Pw => 170
  | .Pu => 83
  | .Q1 => 549
  | .Q2 => 390

/-- Fixed masks for the `(s1, 912)` depth-two singleton cell. -/
def s1912Fixed : List (Label × Nat) := [(.v, 201), (.w, 912)]

/-- The unique target tuple for the `(s1, 912)` depth-two cell. -/
def s1912Target : Label → Nat
  | .u => 178
  | .v => 201
  | .w => 912
  | .s1 => 531
  | .s2 => 616
  | .s3 => 142
  | .Pw => 297
  | .Pu => 326
  | .Q1 => 549
  | .Q2 => 284

/-- Fixed masks for the `(s3, 801)` depth-two singleton cell. -/
def s3801Fixed : List (Label × Nat) := [(.v, 225), (.w, 801)]

/-- The unique target tuple for the `(s3, 801)` depth-two cell. -/
def s3801Target : Label → Nat
  | .u => 408
  | .v => 225
  | .w => 801
  | .s1 => 562
  | .s2 => 652
  | .s3 => 86
  | .Pw => 390
  | .Pu => 75
  | .Q1 => 533
  | .Q2 => 300

/-- Typed clause construction corresponding to `s1-w777-block-target.cnf`. -/
def s1777CNF : CNF :=
  singletonCandidateCNF .s1 s1777Fixed s1777Free s1777Target

/-- The atom carried by a signed typed literal. -/
def Literal.atom : Literal → Atom
  | .pos atom | .neg atom => atom

/-- Candidate atoms in the deterministic center-major, mask-minor order used
by the Python variable map. -/
def candidateAtoms (sstar : Label) (fixed : List (Label × Nat))
    (free : List Label) : List Atom :=
  free.flatMap fun center =>
    (candidateDomain sstar fixed center).map fun mask => ⟨center, mask⟩

/-- Zero-based atom number. The DIMACS variable emitted by Python is this
number plus one. -/
def atomNumber (atoms : List Atom) (atom : Atom) : Nat :=
  atoms.idxOf atom

/-- One-based DIMACS variable corresponding to `atomNumber`. -/
def dimacsVariable (atoms : List Atom) (atom : Atom) : Nat :=
  atomNumber atoms atom + 1

/-- Convert a typed literal to the standard SAT representation. -/
def Literal.toStd (atoms : List Atom) : Literal → Std.Sat.Literal Nat
  | .pos atom => (dimacsVariable atoms atom, true)
  | .neg atom => (dimacsVariable atoms atom, false)

/-- Convert a typed clause list to the list-backed standard SAT CNF. -/
def CNF.toListCNF (atoms : List Atom) (cnf : CNF) : ListCNF Nat :=
  cnf.map fun clause => clause.map (Literal.toStd atoms)

/-- Decode a numeric assignment through the deterministic atom list. -/
def numberedShadowAssignment (atoms : List Atom) (shadow : Shadow) (number : Nat) : Bool :=
  match number with
  | 0 => false
  | index + 1 =>
      match atoms[index]? with
      | some atom => decide (shadow.centerMask atom.center = atom.mask)
      | none => false

/-- Every typed literal in a CNF is represented by the atom-numbering list. -/
def CNFAtomsIn (atoms : List Atom) (cnf : CNF) : Prop :=
  ∀ clause ∈ cnf, ∀ literal ∈ clause, literal.atom ∈ atoms

private theorem stdLiteral_true_of_typed_holds
    {atoms : List Atom} {shadow : Shadow} {literal : Literal}
    (hmem : literal.atom ∈ atoms)
    (hholds : literal.Holds (shadowAssignment shadow)) :
    numberedShadowAssignment atoms shadow (literal.toStd atoms).1 =
      (literal.toStd atoms).2 := by
  cases literal with
  | pos atom =>
      simp only [Literal.atom, Literal.Holds] at hmem hholds
      have hlt' : atoms.idxOf atom < atoms.length :=
        List.idxOf_lt_length_of_mem hmem
      simp only [Literal.toStd, numberedShadowAssignment, dimacsVariable, atomNumber]
      rw [List.getElem?_eq_getElem hlt', List.getElem_idxOf hlt']
      simpa [shadowAssignment] using hholds
  | neg atom =>
      simp only [Literal.atom, Literal.Holds] at hmem hholds
      have hlt' : atoms.idxOf atom < atoms.length :=
        List.idxOf_lt_length_of_mem hmem
      simp only [Literal.toStd, numberedShadowAssignment, dimacsVariable, atomNumber]
      rw [List.getElem?_eq_getElem hlt', List.getElem_idxOf hlt']
      simpa [shadowAssignment] using hholds

/-- Satisfaction transfers from the typed CNF to its numbered `ListCNF`
representation whenever every occurring atom is numbered. -/
theorem listCNFSat_of_typedSat
    {atoms : List Atom} {shadow : Shadow} {cnf : CNF}
    (hatoms : CNFAtomsIn atoms cnf)
    (hsat : CNFSatisfied (shadowAssignment shadow) cnf) :
    ListCNF.Sat (numberedShadowAssignment atoms shadow) (cnf.toListCNF atoms) := by
  rw [ListCNF.sat_def]
  unfold ListCNF.eval
  rw [List.all_eq_true]
  intro numberedClause hnumbered
  rw [CNF.toListCNF] at hnumbered
  rcases List.mem_map.mp hnumbered with ⟨clause, hclause, rfl⟩
  unfold Std.Sat.CNF.Clause.eval
  rw [List.any_eq_true]
  rcases hsat clause hclause with ⟨literal, hliteral, hholds⟩
  refine ⟨literal.toStd atoms, List.mem_map.mpr ⟨literal, hliteral, rfl⟩, ?_⟩
  simpa only [beq_iff_eq] using
    stdLiteral_true_of_typed_holds (hatoms clause hclause literal hliteral) hholds

private theorem atom_mem_candidateAtoms
    {sstar : Label} {fixed : List (Label × Nat)} {free : List Label}
    {center : Label} {mask : Nat}
    (hcenter : center ∈ free)
    (hmask : mask ∈ candidateDomain sstar fixed center) :
    (⟨center, mask⟩ : Atom) ∈ candidateAtoms sstar fixed free := by
  rw [candidateAtoms, List.mem_flatMap]
  exact ⟨center, hcenter, List.mem_map.mpr ⟨mask, hmask, rfl⟩⟩

/-- Every atom in a singleton candidate CNF occurs in its deterministic atom
list, provided the blocked target masks belong to their candidate domains. -/
theorem singletonCandidateCNF_atoms
    {sstar : Label} {fixed : List (Label × Nat)} {free : List Label}
    {target : Label → Nat}
    (htarget : ∀ center ∈ free,
      target center ∈ candidateDomain sstar fixed center) :
    CNFAtomsIn (candidateAtoms sstar fixed free)
      (singletonCandidateCNF sstar fixed free target) := by
  intro clause hclause literal hliteral
  simp only [singletonCandidateCNF, List.mem_append, List.mem_singleton] at hclause
  rcases hclause with ((hclause | hclause) | hclause) | rfl
  · rcases List.mem_map.mp hclause with ⟨center, hcenter, rfl⟩
    rcases List.mem_map.mp hliteral with ⟨mask, hmask, rfl⟩
    exact atom_mem_candidateAtoms hcenter hmask
  · rcases List.mem_flatMap.mp hclause with ⟨center, hcenter, hclause⟩
    rw [atMostOneClauses] at hclause
    rcases List.mem_map.mp hclause with ⟨masks, hmasks, rfl⟩
    have hm := mem_strictPairs_left_right hmasks
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hliteral
    rcases hliteral with rfl | rfl
    · exact atom_mem_candidateAtoms hcenter hm.1
    · exact atom_mem_candidateAtoms hcenter hm.2
  · rcases List.mem_flatMap.mp hclause with ⟨centers, hcenters, hclause⟩
    have hc := mem_strictPairs_left_right hcenters
    rw [incompatibleClausesFor] at hclause
    rcases List.mem_flatMap.mp hclause with ⟨mask, hmask, hclause⟩
    rcases List.mem_filterMap.mp hclause with ⟨otherMask, hotherMask, heq⟩
    split at heq
    · cases heq
    · cases heq
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hliteral
      rcases hliteral with rfl | rfl
      · exact atom_mem_candidateAtoms hc.1 hmask
      · exact atom_mem_candidateAtoms hc.2 hotherMask
  · rcases List.mem_map.mp hliteral with ⟨center, hcenter, rfl⟩
    exact atom_mem_candidateAtoms hcenter (htarget center hcenter)

/-- Deterministically numbered atoms for the `(s1, 777)` instance. -/
def s1777Atoms : List Atom :=
  candidateAtoms .s1 s1777Fixed s1777Free

/-- The `ListCNF` carrying the same one-based variable names as DIMACS. -/
def s1777ListCNF : ListCNF Nat :=
  s1777CNF.toListCNF s1777Atoms

/-- The upstream array-backed standard SAT representation of the instance. -/
def s1777StdCNF : Std.Sat.CNF Nat :=
  ListCNF.toStd s1777ListCNF

/-- Every blocked target atom occurs in the numbered `(s1, 777)` domain. -/
theorem s1777Target_mem_candidateDomain
    (center : Label) (hcenter : center ∈ s1777Free) :
    s1777Target center ∈ candidateDomain .s1 s1777Fixed center := by
  cases center <;> simp [s1777Free] at hcenter ⊢ <;> decide

set_option maxRecDepth 100000 in
/-- The `(s1, 777)` atom list has exactly the 248 variables in the DIMACS map. -/
theorem s1777Atoms_length : s1777Atoms.length = 248 := by decide

set_option maxRecDepth 100000 in
/-- Target variables reproduce the Python one-based DIMACS numbers. -/
theorem s1777Target_dimacsVariables :
    s1777Free.map (fun center =>
      dimacsVariable s1777Atoms ⟨center, s1777Target center⟩) =
      [10, 41, 68, 84, 115, 147, 195, 243] := by decide

/-- A compatibility decision tree either finishes, splits over a complete
candidate domain, or prunes using one concrete assigned-center witness. -/
inductive CompatibilityCertificate where
  | done
  | split (branches : List (Nat × CompatibilityCertificate))
  | prune (againstCenter : Label) (againstMask : Nat)
  deriving Repr

/-- Check a compatibility decision tree against finite candidate domains.

Each split must list exactly the current candidate domain. A pruned branch
records an assigned center/mask pair and a failed cross-separation check. -/
def checkCompatibilityCertificate (sstar : Label) (fixed : List (Label × Nat))
    (target : Label → Nat) :
    List Label → List (Label × Nat) → CompatibilityCertificate → Bool
  | [], assigned, .done =>
      assigned.all fun entry => entry.2 == target entry.1
  | center :: remaining, assigned, .split branches =>
      decide (branches.map Prod.fst = candidateDomain sstar fixed center) &&
        branches.all fun branch =>
          match branch.2 with
          | .prune againstCenter againstMask =>
              assigned.any (fun entry =>
                decide (entry.1 = againstCenter) &&
                  decide (entry.2 = againstMask)) &&
                decide (center ≠ againstCenter) &&
                  !crossSeparationOKForMasks center branch.1
                    againstCenter againstMask
          | child =>
              checkCompatibilityCertificate sstar fixed target remaining
                ((center, branch.1) :: assigned) child
  | _, _, _ => false

/-- A checked compatibility tree forces every compatible candidate selection
to equal its target on the remaining centers. -/
theorem target_of_checkCompatibilityCertificate
    {sstar : Label} {fixed : List (Label × Nat)} {target choice : Label → Nat}
    {remaining : List Label} {assigned : List (Label × Nat)}
    {certificate : CompatibilityCertificate}
    (hcheck : checkCompatibilityCertificate sstar fixed target
      remaining assigned certificate = true)
    (hchoice : ∀ center ∈ remaining,
      choice center ∈ candidateDomain sstar fixed center)
    (hassigned : ∀ entry ∈ assigned, choice entry.1 = entry.2)
    (hseparationAssigned : ∀ center ∈ remaining, ∀ entry ∈ assigned,
      center ≠ entry.1 →
        crossSeparationOKForMasks center (choice center)
          entry.1 (choice entry.1) = true)
    (hseparationRemaining : ∀ center ∈ remaining, ∀ other ∈ remaining,
      center ≠ other →
        crossSeparationOKForMasks center (choice center)
          other (choice other) = true) :
    (∀ center ∈ remaining, choice center = target center) ∧
      (∀ entry ∈ assigned, entry.2 = target entry.1) := by
  induction remaining generalizing assigned certificate with
  | nil =>
      cases certificate with
      | done =>
          constructor
          · simp
          · intro entry hentry
            unfold checkCompatibilityCertificate at hcheck
            rw [List.all_eq_true] at hcheck
            simpa only [beq_iff_eq] using hcheck entry hentry
      | split branches => simp [checkCompatibilityCertificate] at hcheck
      | prune center mask => simp [checkCompatibilityCertificate] at hcheck
  | cons head remaining ih =>
      cases certificate with
      | done => simp [checkCompatibilityCertificate] at hcheck
      | prune againstCenter againstMask =>
          simp [checkCompatibilityCertificate] at hcheck
      | split branches =>
          simp only [checkCompatibilityCertificate, Bool.and_eq_true] at hcheck
          have hdomain : branches.map Prod.fst = candidateDomain sstar fixed head :=
            of_decide_eq_true hcheck.1
          have hselected : choice head ∈ branches.map Prod.fst := by
            rw [hdomain]
            exact hchoice head (by simp)
          rcases List.mem_map.mp hselected with ⟨branch, hbranch, hmask⟩
          have hbranchCheck := List.all_eq_true.mp hcheck.2 branch hbranch
          rcases branch with ⟨mask, child⟩
          simp only at hmask
          subst mask
          let current := head
          cases child with
          | prune againstCenter againstMask =>
              change ((assigned.any fun entry =>
                decide (entry.1 = againstCenter) &&
                  decide (entry.2 = againstMask)) &&
                decide (current ≠ againstCenter) &&
                !crossSeparationOKForMasks current (choice current)
                  againstCenter againstMask) = true at hbranchCheck
              rw [Bool.and_eq_true] at hbranchCheck
              have hleft := hbranchCheck.1
              rw [Bool.and_eq_true] at hleft
              have hany := hleft.1
              rw [List.any_eq_true] at hany
              rcases hany with ⟨entry, hentry, hentryCheck⟩
              rw [Bool.and_eq_true] at hentryCheck
              have hcenterEq := of_decide_eq_true hentryCheck.1
              have hmaskEq := of_decide_eq_true hentryCheck.2
              have hne : current ≠ entry.1 := by
                intro heq
                exact (of_decide_eq_true hleft.2) (heq.trans hcenterEq)
              have hgood := hseparationAssigned current (by simp [current])
                entry hentry hne
              have hassignedEntry := hassigned entry hentry
              rw [hcenterEq, hmaskEq] at hassignedEntry
              rw [hcenterEq, hassignedEntry] at hgood
              rw [hgood] at hbranchCheck
              simp at hbranchCheck
          | done =>
              have hresult := ih hbranchCheck
                (fun c hc => hchoice c (by simp [hc]))
                (fun entry hentry => by
                  rcases List.mem_cons.mp hentry with rfl | hentry
                  · rfl
                  · exact hassigned entry hentry)
                (fun c hc entry hentry hne => by
                  rcases List.mem_cons.mp hentry with rfl | hentry
                  · exact hseparationRemaining c (by simp [hc]) current
                      (by simp [current]) hne
                  · exact hseparationAssigned c (by simp [hc]) entry hentry hne)
                (fun c hc other hother hne =>
                  hseparationRemaining c (by simp [hc]) other (by simp [hother]) hne)
              constructor
              · intro c hc
                rcases List.mem_cons.mp hc with rfl | hc
                · exact hresult.2 (current, choice current) (by simp [current])
                · exact hresult.1 c hc
              · intro entry hentry
                exact hresult.2 entry (by simp [hentry])
          | split childBranches =>
              have hresult := ih hbranchCheck
                (fun c hc => hchoice c (by simp [hc]))
                (fun entry hentry => by
                  rcases List.mem_cons.mp hentry with rfl | hentry
                  · rfl
                  · exact hassigned entry hentry)
                (fun c hc entry hentry hne => by
                  rcases List.mem_cons.mp hentry with rfl | hentry
                  · exact hseparationRemaining c (by simp [hc]) current
                      (by simp [current]) hne
                  · exact hseparationAssigned c (by simp [hc]) entry hentry hne)
                (fun c hc other hother hne =>
                  hseparationRemaining c (by simp [hc]) other (by simp [hother]) hne)
              constructor
              · intro c hc
                rcases List.mem_cons.mp hc with rfl | hc
                · exact hresult.2 (current, choice current) (by simp [current])
                · exact hresult.1 c hc
              · intro entry hentry
                exact hresult.2 entry (by simp [hentry])

/-- A checked compatibility tree transfers directly to valid pinned fragments,
using only candidate-mask admissibility and search separation. -/
theorem validFragment_target_of_checkCompatibilityCertificate
    {sstar : Label} {fixed : List (Label × Nat)} {free : List Label}
    {target : Label → Nat} {certificate : CompatibilityCertificate}
    {shadow : Shadow}
    (hcheck : checkCompatibilityCertificate sstar fixed target
      free [] certificate = true)
    (hvalid : isValidPinnedFragment sstar shadow = true)
    (hdisjoint : ∀ center ∈ free, ∀ entry ∈ fixed, center ≠ entry.1)
    (hfixed : ∀ entry ∈ fixed, shadow.centerMask entry.1 = entry.2) :
    ∀ center ∈ free, shadow.centerMask center = target center := by
  exact (target_of_checkCompatibilityCertificate hcheck
    (fun center hcenter =>
      shadow_mask_mem_candidateDomain hvalid hcenter hdisjoint hfixed)
    (by simp)
    (by simp)
    (fun center hcenter other hother hne =>
      crossSeparationOKForMasks_of_searchSeparationOK
        (searchSeparationOK_of_isValidPinnedFragment hvalid) hne)).1

/-- Semantic adapter for the blocked `(s1, 777)` candidate-choice instance. -/
theorem validFragment_satisfies_s1777CNF
    {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 777)
    (hdiff : ∃ center ∈ s1777Free,
      shadow.centerMask center ≠ s1777Target center) :
    CNFSatisfied (shadowAssignment shadow) s1777CNF := by
  apply validFragment_satisfies_singletonCandidateCNF hvalid (by decide)
  · intro center hcenter entry hentry
    simp [s1777Free, s1777Fixed] at hcenter hentry ⊢
    rcases hentry with hentry | hentry <;> subst entry <;>
      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide
  · intro entry hentry
    simp [s1777Fixed] at hentry
    rcases hentry with hentry | hentry <;> subst entry
    · exact hv
    · exact hw
  · exact hdiff

/-- A differing valid fragment in the `(s1, 777)` cell satisfies the numbered
formula consumed by the LRAT checker. -/
theorem validFragment_satisfies_s1777ListCNF
    {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 777)
    (hdiff : ∃ center ∈ s1777Free,
      shadow.centerMask center ≠ s1777Target center) :
    ListCNF.Sat (numberedShadowAssignment s1777Atoms shadow) s1777ListCNF := by
  apply listCNFSat_of_typedSat
  · exact singletonCandidateCNF_atoms s1777Target_mem_candidateDomain
  · exact validFragment_satisfies_s1777CNF hvalid hv hw hdiff

/-- Unsatisfiability of the numbered certificate formula excludes every valid
`(s1, 777)` fragment that differs from the target at a free center. -/
theorem no_differing_validFragment_of_s1777ListCNF_unsat
    (hunsat : ListCNF.Unsat s1777ListCNF)
    {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 777) :
    ¬∃ center ∈ s1777Free,
      shadow.centerMask center ≠ s1777Target center := by
  intro hdiff
  have hsat := validFragment_satisfies_s1777ListCNF hvalid hv hw hdiff
  have hfalse := hunsat (numberedShadowAssignment s1777Atoms shadow)
  exact Bool.false_ne_true (hfalse.symm.trans hsat)

/-- A length-ten shadow is determined by its masks at the ten labels. -/
theorem shadow_masks_eq_map_of_hasTenMasks
    {shadow : Shadow} {target : Label → Nat}
    (hlength : shadow.hasTenMasks = true)
    (hcenter : ∀ center, shadow.centerMask center = target center) :
    shadow.masks = allLabels.map target := by
  cases shadow with
  | mk masks =>
      simp only [Shadow.hasTenMasks, labelCount, beq_iff_eq] at hlength
      apply List.ext_getElem (by simpa [allLabels] using hlength)
      intro index hleft hright
      have hi : index < 10 := by simpa [hlength] using hleft
      interval_cases index
      all_goals
        first
        | have hx := hcenter .u
          change masks.getD 0 0 = target .u at hx
          rw [← List.getElem_eq_getD (h := hleft) 0] at hx
          simpa [Shadow.centerMask, allLabels] using hx
        | have hx := hcenter .v
          change masks.getD 1 0 = target .v at hx
          rw [← List.getElem_eq_getD (h := hleft) 0] at hx
          simpa [Shadow.centerMask, allLabels] using hx
        | have hx := hcenter .w
          change masks.getD 2 0 = target .w at hx
          rw [← List.getElem_eq_getD (h := hleft) 0] at hx
          simpa [Shadow.centerMask, allLabels] using hx
        | have hx := hcenter .s1
          change masks.getD 3 0 = target .s1 at hx
          rw [← List.getElem_eq_getD (h := hleft) 0] at hx
          simpa [Shadow.centerMask, allLabels] using hx
        | have hx := hcenter .s2
          change masks.getD 4 0 = target .s2 at hx
          rw [← List.getElem_eq_getD (h := hleft) 0] at hx
          simpa [Shadow.centerMask, allLabels] using hx
        | have hx := hcenter .s3
          change masks.getD 5 0 = target .s3 at hx
          rw [← List.getElem_eq_getD (h := hleft) 0] at hx
          simpa [Shadow.centerMask, allLabels] using hx
        | have hx := hcenter .Pw
          change masks.getD 6 0 = target .Pw at hx
          rw [← List.getElem_eq_getD (h := hleft) 0] at hx
          simpa [Shadow.centerMask, allLabels] using hx
        | have hx := hcenter .Pu
          change masks.getD 7 0 = target .Pu at hx
          rw [← List.getElem_eq_getD (h := hleft) 0] at hx
          simpa [Shadow.centerMask, allLabels] using hx
        | have hx := hcenter .Q1
          change masks.getD 8 0 = target .Q1 at hx
          rw [← List.getElem_eq_getD (h := hleft) 0] at hx
          simpa [Shadow.centerMask, allLabels] using hx
        | have hx := hcenter .Q2
          change masks.getD 9 0 = target .Q2 at hx
          rw [← List.getElem_eq_getD (h := hleft) 0] at hx
          simpa [Shadow.centerMask, allLabels] using hx

/-- Once the numbered CNF is proved unsatisfiable, every valid fragment in the
`(s1, 777)` cell has exactly the target mask list. -/
theorem validFragment_masks_eq_s1777Target_of_unsat
    (hunsat : ListCNF.Unsat s1777ListCNF)
    {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 777) :
    shadow.masks = [432, 201, 777, 534, 354, 92, 170, 83, 549, 390] := by
  have hfree := no_differing_validFragment_of_s1777ListCNF_unsat hunsat hvalid hv hw
  have hcenter : ∀ center, shadow.centerMask center = s1777Target center := by
    intro center
    cases center with
    | v => exact hv
    | w => exact hw
    | u | s1 | s2 | s3 | Pw | Pu | Q1 | Q2 =>
        by_contra hne
        apply hfree
        exact ⟨_, by simp [s1777Free], hne⟩
  simpa [allLabels, s1777Target] using
    shadow_masks_eq_map_of_hasTenMasks
      (hasTenMasks_of_isValidPinnedFragment hvalid) hcenter

end SurplusCOMPGBankCoverage
end Problem97
