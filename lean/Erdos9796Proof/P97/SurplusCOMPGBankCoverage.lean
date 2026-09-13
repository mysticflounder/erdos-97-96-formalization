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

/-- Fixed masks for the `(s1, 834)` depth-two cell with two target rows. -/
def s1834Fixed : List (Label × Nat) := [(.v, 201), (.w, 834)]

/-- Free centers for the `(s1, 834)` depth-two cell. -/
def s1834Free : List Label := [.u, .s1, .s2, .s3, .Pw, .Pu, .Q1, .Q2]

/-- First target tuple for the `(s1, 834)` depth-two cell. -/
def s1834TargetA : Label → Nat
  | .u => 312
  | .v => 201
  | .w => 834
  | .s1 => 277
  | .s2 => 553
  | .s3 => 660
  | .Pw => 142
  | .Pu => 83
  | .Q1 => 612
  | .Q2 => 418

/-- Second target tuple for the `(s1, 834)` depth-two cell. -/
def s1834TargetB : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 834
  | .s1 => 277
  | .s2 => 553
  | .s3 => 660
  | .Pw => 396
  | .Pu => 83
  | .Q1 => 612
  | .Q2 => 298

/-- The two target tuples admitted by the `(s1, 834)` compatibility certificate. -/
def s1834Targets : List (Label → Nat) := [s1834TargetA, s1834TargetB]

/-- Fixed masks for the `(s1, 848)` depth-two cell with four target rows. -/
def s1848Fixed : List (Label × Nat) := [(.v, 201), (.w, 848)]

/-- First target tuple for the `(s1, 848)` depth-two cell. -/
def s1848TargetA : Label → Nat
  | .u => 114
  | .v => 201
  | .w => 848
  | .s1 => 531
  | .s2 => 680
  | .s3 => 78
  | .Pw => 390
  | .Pu => 297
  | .Q1 => 549
  | .Q2 => 284

/-- Second target tuple for the `(s1, 848)` depth-two cell. -/
def s1848TargetB : Label → Nat
  | .u => 178
  | .v => 201
  | .w => 848
  | .s1 => 531
  | .s2 => 106
  | .s3 => 652
  | .Pw => 390
  | .Pu => 297
  | .Q1 => 549
  | .Q2 => 284

/-- Third target tuple for the `(s1, 848)` depth-two cell. -/
def s1848TargetC : Label → Nat
  | .u => 178
  | .v => 201
  | .w => 848
  | .s1 => 531
  | .s2 => 106
  | .s3 => 652
  | .Pw => 297
  | .Pu => 326
  | .Q1 => 549
  | .Q2 => 284

/-- Fourth target tuple for the `(s1, 848)` depth-two cell. -/
def s1848TargetD : Label → Nat
  | .u => 300
  | .v => 201
  | .w => 848
  | .s1 => 688
  | .s2 => 291
  | .s3 => 525
  | .Pw => 154
  | .Pu => 85
  | .Q1 => 610
  | .Q2 => 390

/-- The four target tuples admitted by the `(s1, 848)` compatibility certificate. -/
def s1848Targets : List (Label → Nat) :=
  [s1848TargetA, s1848TargetB, s1848TargetC, s1848TargetD]

/-- Fixed masks for the `(s1, 840)` depth-two cell with eleven target rows. -/
def s1840Fixed : List (Label × Nat) := [(.v, 201), (.w, 840)]

/-- First target tuple for the `(s1, 840)` depth-two cell. -/
def s1840TargetA : Label → Nat
  | .u => 368
  | .v => 201
  | .w => 840
  | .s1 => 275
  | .s2 => 170
  | .s3 => 86
  | .Pw => 660
  | .Pu => 45
  | .Q1 => 547
  | .Q2 => 390

/-- Second target tuple for the `(s1, 840)` depth-two cell. -/
def s1840TargetB : Label → Nat
  | .u => 368
  | .v => 201
  | .w => 840
  | .s1 => 660
  | .s2 => 294
  | .s3 => 29
  | .Pw => 142
  | .Pu => 581
  | .Q1 => 674
  | .Q2 => 275

/-- Third target tuple for the `(s1, 840)` depth-two cell. -/
def s1840TargetC : Label → Nat
  | .u => 368
  | .v => 201
  | .w => 840
  | .s1 => 278
  | .s2 => 676
  | .s3 => 29
  | .Pw => 142
  | .Pu => 581
  | .Q1 => 658
  | .Q2 => 291

/-- Fourth target tuple for the `(s1, 840)` depth-two cell. -/
def s1840TargetD : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 840
  | .s1 => 86
  | .s2 => 43
  | .s3 => 156
  | .Pw => 390
  | .Pu => 609
  | .Q1 => 531
  | .Q2 => 300

/-- Fifth target tuple for the `(s1, 840)` depth-two cell. -/
def s1840TargetE : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 840
  | .s1 => 275
  | .s2 => 45
  | .s3 => 86
  | .Pw => 156
  | .Pu => 593
  | .Q1 => 646
  | .Q2 => 298

/-- Sixth target tuple for the `(s1, 840)` depth-two cell. -/
def s1840TargetF : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 840
  | .s1 => 275
  | .s2 => 45
  | .s3 => 86
  | .Pw => 156
  | .Pu => 609
  | .Q1 => 646
  | .Q2 => 298

/-- Seventh target tuple for the `(s1, 840)` depth-two cell. -/
def s1840TargetG : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 840
  | .s1 => 86
  | .s2 => 291
  | .s3 => 29
  | .Pw => 170
  | .Pu => 549
  | .Q1 => 531
  | .Q2 => 390

/-- Eighth target tuple for the `(s1, 840)` depth-two cell. -/
def s1840TargetH : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 840
  | .s1 => 86
  | .s2 => 291
  | .s3 => 29
  | .Pw => 170
  | .Pu => 609
  | .Q1 => 531
  | .Q2 => 390

/-- Ninth target tuple for the `(s1, 840)` depth-two cell. -/
def s1840TargetI : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 840
  | .s1 => 86
  | .s2 => 291
  | .s3 => 29
  | .Pw => 172
  | .Pu => 609
  | .Q1 => 531
  | .Q2 => 390

/-- Tenth target tuple for the `(s1, 840)` depth-two cell. -/
def s1840TargetJ : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 840
  | .s1 => 86
  | .s2 => 291
  | .s3 => 533
  | .Pw => 154
  | .Pu => 45
  | .Q1 => 610
  | .Q2 => 390

/-- Eleventh target tuple for the `(s1, 840)` depth-two cell. -/
def s1840TargetK : Label → Nat
  | .u => 688
  | .v => 201
  | .w => 840
  | .s1 => 533
  | .s2 => 43
  | .s3 => 156
  | .Pw => 418
  | .Pu => 337
  | .Q1 => 582
  | .Q2 => 300

/-- The eleven target tuples admitted by the `(s1, 840)` compatibility certificate. -/
def s1840Targets : List (Label → Nat) :=
  [s1840TargetA, s1840TargetB, s1840TargetC, s1840TargetD, s1840TargetE,
    s1840TargetF, s1840TargetG, s1840TargetH, s1840TargetI, s1840TargetJ,
    s1840TargetK]

/-- Fixed masks for the `(s1, 928)` depth-two cell with four target rows. -/
def s1928Fixed : List (Label × Nat) := [(.v, 201), (.w, 928)]

/-- First target tuple for the `(s1, 928)` depth-two cell. -/
def s1928TargetA : Label → Nat
  | .u => 178
  | .v => 201
  | .w => 928
  | .s1 => 338
  | .s2 => 616
  | .s3 => 142
  | .Pw => 281
  | .Pu => 579
  | .Q1 => 533
  | .Q2 => 300

/-- Second target tuple for the `(s1, 928)` depth-two cell. -/
def s1928TargetB : Label → Nat
  | .u => 284
  | .v => 201
  | .w => 928
  | .s1 => 178
  | .s2 => 556
  | .s3 => 326
  | .Pw => 43
  | .Pu => 593
  | .Q1 => 646
  | .Q2 => 275

/-- Third target tuple for the `(s1, 928)` depth-two cell. -/
def s1928TargetC : Label → Nat
  | .u => 284
  | .v => 201
  | .w => 928
  | .s1 => 178
  | .s2 => 616
  | .s3 => 326
  | .Pw => 43
  | .Pu => 593
  | .Q1 => 646
  | .Q2 => 275

/-- Fourth target tuple for the `(s1, 928)` depth-two cell. -/
def s1928TargetD : Label → Nat
  | .u => 284
  | .v => 201
  | .w => 928
  | .s1 => 178
  | .s2 => 616
  | .s3 => 86
  | .Pw => 43
  | .Pu => 593
  | .Q1 => 646
  | .Q2 => 293

/-- The four target tuples admitted by the `(s1, 928)` compatibility certificate. -/
def s1928Targets : List (Label → Nat) :=
  [s1928TargetA, s1928TargetB, s1928TargetC, s1928TargetD]

/-- Fixed masks for the `(s1, 864)` depth-two cell with eight target rows. -/
def s1864Fixed : List (Label × Nat) := [(.v, 201), (.w, 864)]

/-- First target tuple for the `(s1, 864)` depth-two cell. -/
def s1864TargetA : Label → Nat
  | .u => 114
  | .v => 201
  | .w => 864
  | .s1 => 531
  | .s2 => 680
  | .s3 => 78
  | .Pw => 390
  | .Pu => 281
  | .Q1 => 660
  | .Q2 => 300

/-- Second target tuple for the `(s1, 864)` depth-two cell. -/
def s1864TargetB : Label → Nat
  | .u => 178
  | .v => 201
  | .w => 864
  | .s1 => 531
  | .s2 => 106
  | .s3 => 652
  | .Pw => 390
  | .Pu => 281
  | .Q1 => 596
  | .Q2 => 300

/-- Third target tuple for the `(s1, 864)` depth-two cell. -/
def s1864TargetC : Label → Nat
  | .u => 284
  | .v => 201
  | .w => 864
  | .s1 => 688
  | .s2 => 291
  | .s3 => 525
  | .Pw => 170
  | .Pu => 101
  | .Q1 => 531
  | .Q2 => 390

/-- Fourth target tuple for the `(s1, 864)` depth-two cell. -/
def s1864TargetD : Label → Nat
  | .u => 284
  | .v => 201
  | .w => 864
  | .s1 => 688
  | .s2 => 102
  | .s3 => 525
  | .Pw => 170
  | .Pu => 323
  | .Q1 => 531
  | .Q2 => 390

/-- Fifth target tuple for the `(s1, 864)` depth-two cell. -/
def s1864TargetE : Label → Nat
  | .u => 284
  | .v => 201
  | .w => 864
  | .s1 => 294
  | .s2 => 553
  | .s3 => 660
  | .Pw => 170
  | .Pu => 113
  | .Q1 => 582
  | .Q2 => 275

/-- Sixth target tuple for the `(s1, 864)` depth-two cell. -/
def s1864TargetF : Label → Nat
  | .u => 284
  | .v => 201
  | .w => 864
  | .s1 => 294
  | .s2 => 553
  | .s3 => 660
  | .Pw => 170
  | .Pu => 113
  | .Q1 => 582
  | .Q2 => 402

/-- Seventh target tuple for the `(s1, 864)` depth-two cell. -/
def s1864TargetG : Label → Nat
  | .u => 284
  | .v => 201
  | .w => 864
  | .s1 => 402
  | .s2 => 680
  | .s3 => 86
  | .Pw => 43
  | .Pu => 593
  | .Q1 => 646
  | .Q2 => 293

/-- Eighth target tuple for the `(s1, 864)` depth-two cell. -/
def s1864TargetH : Label → Nat
  | .u => 284
  | .v => 201
  | .w => 864
  | .s1 => 688
  | .s2 => 291
  | .s3 => 525
  | .Pw => 170
  | .Pu => 101
  | .Q1 => 594
  | .Q2 => 390

/-- The eight target tuples admitted by the `(s1, 864)` compatibility certificate. -/
def s1864Targets : List (Label → Nat) :=
  [s1864TargetA, s1864TargetB, s1864TargetD, s1864TargetC,
    s1864TargetE, s1864TargetF, s1864TargetH, s1864TargetG]

/-- Fixed masks for the `(s1, 904)` depth-two cell with ten target rows. -/
def s1904Fixed : List (Label × Nat) := [(.v, 201), (.w, 904)]

/-- First target tuple for the `(s1, 904)` depth-two cell. -/
def s1904TargetA : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 904
  | .s1 => 338
  | .s2 => 43
  | .s3 => 533
  | .Pw => 150
  | .Pu => 325
  | .Q1 => 610
  | .Q2 => 300

/-- Second target tuple for the `(s1, 904)` depth-two cell. -/
def s1904TargetB : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 904
  | .s1 => 338
  | .s2 => 46
  | .s3 => 596
  | .Pw => 29
  | .Pu => 609
  | .Q1 => 646
  | .Q2 => 291

/-- Third target tuple for the `(s1, 904)` depth-two cell. -/
def s1904TargetC : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 904
  | .s1 => 275
  | .s2 => 106
  | .s3 => 29
  | .Pw => 150
  | .Pu => 581
  | .Q1 => 547
  | .Q2 => 300

/-- Fourth target tuple for the `(s1, 904)` depth-two cell. -/
def s1904TargetD : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 904
  | .s1 => 275
  | .s2 => 106
  | .s3 => 150
  | .Pw => 45
  | .Pu => 593
  | .Q1 => 547
  | .Q2 => 326

/-- Fifth target tuple for the `(s1, 904)` depth-two cell. -/
def s1904TargetE : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 904
  | .s1 => 278
  | .s2 => 106
  | .s3 => 596
  | .Pw => 45
  | .Pu => 83
  | .Q1 => 646
  | .Q2 => 291

/-- Sixth target tuple for the `(s1, 904)` depth-two cell. -/
def s1904TargetF : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 904
  | .s1 => 534
  | .s2 => 354
  | .s3 => 92
  | .Pw => 43
  | .Pu => 593
  | .Q1 => 549
  | .Q2 => 275

/-- Seventh target tuple for the `(s1, 904)` depth-two cell. -/
def s1904TargetG : Label → Nat
  | .u => 432
  | .v => 201
  | .w => 904
  | .s1 => 275
  | .s2 => 610
  | .s3 => 92
  | .Pw => 150
  | .Pu => 593
  | .Q1 => 549
  | .Q2 => 298

/-- Eighth target tuple for the `(s1, 904)` depth-two cell. -/
def s1904TargetH : Label → Nat
  | .u => 688
  | .v => 201
  | .w => 904
  | .s1 => 549
  | .s2 => 354
  | .s3 => 150
  | .Pw => 43
  | .Pu => 337
  | .Q1 => 582
  | .Q2 => 284

/-- Ninth target tuple for the `(s1, 904)` depth-two cell. -/
def s1904TargetI : Label → Nat
  | .u => 688
  | .v => 201
  | .w => 904
  | .s1 => 338
  | .s2 => 549
  | .s3 => 150
  | .Pw => 29
  | .Pu => 353
  | .Q1 => 582
  | .Q2 => 298

/-- Tenth target tuple for the `(s1, 904)` depth-two cell. -/
def s1904TargetJ : Label → Nat
  | .u => 688
  | .v => 201
  | .w => 904
  | .s1 => 354
  | .s2 => 549
  | .s3 => 150
  | .Pw => 43
  | .Pu => 337
  | .Q1 => 582
  | .Q2 => 284

/-- The ten target tuples admitted by the `(s1, 904)` compatibility certificate. -/
def s1904Targets : List (Label → Nat) :=
  [s1904TargetA, s1904TargetB, s1904TargetC, s1904TargetD, s1904TargetE,
    s1904TargetF, s1904TargetG, s1904TargetH, s1904TargetI, s1904TargetJ]

/-- Fixed masks for the `(s3, 928)` depth-two cell with five target rows. -/
def s3928Fixed : List (Label × Nat) := [(.v, 225), (.w, 928)]

/-- First target tuple for the `(s3, 928)` depth-two cell. -/
def s3928TargetA : Label → Nat
  | .u => 344
  | .v => 225
  | .w => 928
  | .s1 => 306
  | .s2 => 588
  | .s3 => 150
  | .Pw => 45
  | .Pu => 579
  | .Q1 => 533
  | .Q2 => 267

/-- Second target tuple for the `(s3, 928)` depth-two cell. -/
def s3928TargetB : Label → Nat
  | .u => 408
  | .v => 225
  | .w => 928
  | .s1 => 306
  | .s2 => 556
  | .s3 => 86
  | .Pw => 43
  | .Pu => 593
  | .Q1 => 646
  | .Q2 => 269

/-- Third target tuple for the `(s3, 928)` depth-two cell. -/
def s3928TargetC : Label → Nat
  | .u => 408
  | .v => 225
  | .w => 928
  | .s1 => 306
  | .s2 => 588
  | .s3 => 150
  | .Pw => 45
  | .Pu => 579
  | .Q1 => 533
  | .Q2 => 267

/-- Fourth target tuple for the `(s3, 928)` depth-two cell. -/
def s3928TargetD : Label → Nat
  | .u => 408
  | .v => 225
  | .w => 928
  | .s1 => 338
  | .s2 => 46
  | .s3 => 596
  | .Pw => 51
  | .Pu => 585
  | .Q1 => 646
  | .Q2 => 269

/-- Fifth target tuple for the `(s3, 928)` depth-two cell. -/
def s3928TargetE : Label → Nat
  | .u => 408
  | .v => 225
  | .w => 928
  | .s1 => 338
  | .s2 => 588
  | .s3 => 150
  | .Pw => 45
  | .Pu => 579
  | .Q1 => 533
  | .Q2 => 267

/-- The five target tuples admitted by the `(s3, 928)` compatibility certificate. -/
def s3928Targets : List (Label → Nat) :=
  [s3928TargetA, s3928TargetB, s3928TargetC, s3928TargetD, s3928TargetE]

/-- Fixed masks for the `(s2, 785)` depth-two cell with sixteen target rows. -/
def s2785Fixed : List (Label × Nat) := [(.v, 209), (.w, 785)]

/-- First target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetA : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 306 | .s2 => 556
  | .s3 => 86 | .Pw => 156 | .Pu => 75 | .Q1 => 547 | .Q2 => 390

/-- Second target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetB : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 306 | .s2 => 616
  | .s3 => 86 | .Pw => 156 | .Pu => 75 | .Q1 => 547 | .Q2 => 390

/-- Third target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetC : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 306 | .s2 => 616
  | .s3 => 86 | .Pw => 156 | .Pu => 75 | .Q1 => 549 | .Q2 => 390

/-- Fourth target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetD : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 306 | .s2 => 45
  | .s3 => 86 | .Pw => 156 | .Pu => 99 | .Q1 => 523 | .Q2 => 390

/-- Fifth target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetE : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 534 | .s2 => 354
  | .s3 => 92 | .Pw => 178 | .Pu => 75 | .Q1 => 525 | .Q2 => 390

/-- Sixth target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetF : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 534 | .s2 => 354
  | .s3 => 92 | .Pw => 178 | .Pu => 75 | .Q1 => 549 | .Q2 => 390

/-- Seventh target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetG : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 534 | .s2 => 616
  | .s3 => 156 | .Pw => 390 | .Pu => 75 | .Q1 => 549 | .Q2 => 306

/-- Eighth target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetH : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 534 | .s2 => 106
  | .s3 => 156 | .Pw => 390 | .Pu => 77 | .Q1 => 549 | .Q2 => 306

/-- Ninth target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetI : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 534 | .s2 => 616
  | .s3 => 156 | .Pw => 390 | .Pu => 77 | .Q1 => 549 | .Q2 => 306

/-- Tenth target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetJ : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 534 | .s2 => 43
  | .s3 => 156 | .Pw => 390 | .Pu => 101 | .Q1 => 525 | .Q2 => 306

/-- Eleventh target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetK : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 562 | .s2 => 652
  | .s3 => 86 | .Pw => 390 | .Pu => 75 | .Q1 => 549 | .Q2 => 284

/-- Twelfth target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetL : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 562 | .s2 => 652
  | .s3 => 86 | .Pw => 390 | .Pu => 99 | .Q1 => 549 | .Q2 => 284

/-- Thirteenth target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetM : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 562 | .s2 => 652
  | .s3 => 90 | .Pw => 390 | .Pu => 77 | .Q1 => 549 | .Q2 => 354

/-- Fourteenth target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetN : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 562 | .s2 => 652
  | .s3 => 90 | .Pw => 390 | .Pu => 99 | .Q1 => 549 | .Q2 => 332

/-- Fifteenth target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetO : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 564 | .s2 => 354
  | .s3 => 92 | .Pw => 674 | .Pu => 75 | .Q1 => 525 | .Q2 => 390

/-- Sixteenth target tuple for the `(s2, 785)` depth-two cell. -/
def s2785TargetP : Label → Nat
  | .u => 424 | .v => 209 | .w => 785 | .s1 => 564 | .s2 => 354
  | .s3 => 92 | .Pw => 652 | .Pu => 75 | .Q1 => 547 | .Q2 => 390

/-- The sixteen target tuples admitted by the `(s2, 785)` compatibility certificate. -/
def s2785Targets : List (Label → Nat) :=
  [s2785TargetA, s2785TargetB, s2785TargetC, s2785TargetD,
    s2785TargetE, s2785TargetF, s2785TargetG, s2785TargetH,
    s2785TargetI, s2785TargetJ, s2785TargetK, s2785TargetL,
    s2785TargetM, s2785TargetN, s2785TargetO, s2785TargetP]

/-- Fixed masks for the `(s2, 864)` depth-two cell with six target rows. -/
def s2864Fixed : List (Label × Nat) := [(.v, 209), (.w, 864)]

/-- First target tuple for the `(s2, 864)` depth-two cell. -/
def s2864TargetA : Label → Nat
  | .u => 284
  | .v => 209
  | .w => 864
  | .s1 => 291
  | .s2 => 172
  | .s3 => 533
  | .Pw => 178
  | .Pu => 105
  | .Q1 => 582
  | .Q2 => 394

/-- Second target tuple for the `(s2, 864)` depth-two cell. -/
def s2864TargetB : Label → Nat
  | .u => 284
  | .v => 209
  | .w => 864
  | .s1 => 291
  | .s2 => 680
  | .s3 => 533
  | .Pw => 178
  | .Pu => 105
  | .Q1 => 582
  | .Q2 => 394

/-- Third target tuple for the `(s2, 864)` depth-two cell. -/
def s2864TargetC : Label → Nat
  | .u => 284
  | .v => 209
  | .w => 864
  | .s1 => 102
  | .s2 => 680
  | .s3 => 533
  | .Pw => 178
  | .Pu => 75
  | .Q1 => 646
  | .Q2 => 297

/-- Fourth target tuple for the `(s2, 864)` depth-two cell. -/
def s2864TargetD : Label → Nat
  | .u => 284
  | .v => 209
  | .w => 864
  | .s1 => 294
  | .s2 => 680
  | .s3 => 533
  | .Pw => 178
  | .Pu => 105
  | .Q1 => 582
  | .Q2 => 267

/-- Fifth target tuple for the `(s2, 864)` depth-two cell. -/
def s2864TargetE : Label → Nat
  | .u => 284
  | .v => 209
  | .w => 864
  | .s1 => 294
  | .s2 => 680
  | .s3 => 533
  | .Pw => 178
  | .Pu => 105
  | .Q1 => 582
  | .Q2 => 394

/-- Sixth target tuple for the `(s2, 864)` depth-two cell. -/
def s2864TargetF : Label → Nat
  | .u => 284
  | .v => 209
  | .w => 864
  | .s1 => 294
  | .s2 => 680
  | .s3 => 533
  | .Pw => 178
  | .Pu => 105
  | .Q1 => 646
  | .Q2 => 267

/-- The six target tuples admitted by the `(s2, 864)` compatibility certificate. -/
def s2864Targets : List (Label → Nat) :=
  [s2864TargetC, s2864TargetA, s2864TargetB, s2864TargetD, s2864TargetE, s2864TargetF]

/-- Fixed masks for the `(s2, 912)` depth-two cell with thirteen target rows. -/
def s2912Fixed : List (Label × Nat) := [(.v, 209), (.w, 912)]

/-- First target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetA : Label → Nat
  | .u => 424
  | .v => 209
  | .w => 912
  | .s1 => 291
  | .s2 => 556
  | .s3 => 86
  | .Pw => 29
  | .Pu => 609
  | .Q1 => 646
  | .Q2 => 330

/-- Second target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetB : Label → Nat
  | .u => 424
  | .v => 209
  | .w => 912
  | .s1 => 306
  | .s2 => 616
  | .s3 => 86
  | .Pw => 29
  | .Pu => 579
  | .Q1 => 549
  | .Q2 => 267

/-- Third target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetC : Label → Nat
  | .u => 424
  | .v => 209
  | .w => 912
  | .s1 => 306
  | .s2 => 549
  | .s3 => 86
  | .Pw => 29
  | .Pu => 99
  | .Q1 => 646
  | .Q2 => 267

/-- Fourth target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetD : Label → Nat
  | .u => 424
  | .v => 209
  | .w => 912
  | .s1 => 306
  | .s2 => 556
  | .s3 => 86
  | .Pw => 29
  | .Pu => 99
  | .Q1 => 646
  | .Q2 => 267

/-- Fifth target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetE : Label → Nat
  | .u => 424
  | .v => 209
  | .w => 912
  | .s1 => 306
  | .s2 => 556
  | .s3 => 86
  | .Pw => 29
  | .Pu => 609
  | .Q1 => 646
  | .Q2 => 267

/-- Sixth target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetF : Label → Nat
  | .u => 424
  | .v => 209
  | .w => 912
  | .s1 => 306
  | .s2 => 556
  | .s3 => 86
  | .Pw => 29
  | .Pu => 609
  | .Q1 => 646
  | .Q2 => 330

/-- Seventh target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetG : Label → Nat
  | .u => 424
  | .v => 209
  | .w => 912
  | .s1 => 278
  | .s2 => 610
  | .s3 => 92
  | .Pw => 51
  | .Pu => 585
  | .Q1 => 549
  | .Q2 => 267

/-- Eighth target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetH : Label → Nat
  | .u => 424
  | .v => 209
  | .w => 912
  | .s1 => 534
  | .s2 => 354
  | .s3 => 92
  | .Pw => 51
  | .Pu => 585
  | .Q1 => 549
  | .Q2 => 267

/-- Ninth target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetI : Label → Nat
  | .u => 424
  | .v => 209
  | .w => 912
  | .s1 => 534
  | .s2 => 354
  | .s3 => 92
  | .Pw => 51
  | .Pu => 585
  | .Q1 => 549
  | .Q2 => 270

/-- Tenth target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetJ : Label → Nat
  | .u => 424
  | .v => 209
  | .w => 912
  | .s1 => 534
  | .s2 => 291
  | .s3 => 92
  | .Pw => 166
  | .Pu => 609
  | .Q1 => 525
  | .Q2 => 330

/-- Eleventh target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetK : Label → Nat
  | .u => 616
  | .v => 209
  | .w => 912
  | .s1 => 549
  | .s2 => 170
  | .s3 => 332
  | .Pw => 29
  | .Pu => 323
  | .Q1 => 646
  | .Q2 => 306

/-- Twelfth target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetL : Label → Nat
  | .u => 680
  | .v => 209
  | .w => 912
  | .s1 => 354
  | .s2 => 549
  | .s3 => 142
  | .Pw => 51
  | .Pu => 329
  | .Q1 => 582
  | .Q2 => 284

/-- Thirteenth target tuple for the `(s2, 912)` depth-two cell. -/
def s2912TargetM : Label → Nat
  | .u => 680
  | .v => 209
  | .w => 912
  | .s1 => 549
  | .s2 => 354
  | .s3 => 142
  | .Pw => 51
  | .Pu => 329
  | .Q1 => 582
  | .Q2 => 284

/-- The thirteen target tuples admitted by the `(s2, 912)` compatibility certificate. -/
def s2912Targets : List (Label → Nat) :=
  [s2912TargetA, s2912TargetB, s2912TargetC, s2912TargetD, s2912TargetE,
    s2912TargetF, s2912TargetG, s2912TargetH, s2912TargetI, s2912TargetJ,
    s2912TargetK, s2912TargetL, s2912TargetM]

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

/-- Check one compatibility decision tree against a finite list of possible targets.

The split and prune checks are identical to `checkCompatibilityCertificate`; only a
terminal assignment changes, accepting when at least one target agrees with every
assigned center. -/
def checkCompatibilityCertificateForTargets (sstar : Label)
    (fixed : List (Label × Nat)) (targets : List (Label → Nat)) :
    List Label → List (Label × Nat) → CompatibilityCertificate → Bool
  | [], assigned, .done =>
      targets.any fun target =>
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
              checkCompatibilityCertificateForTargets sstar fixed targets remaining
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

/-- A checked multi-target tree selects a listed target agreeing with every
compatible choice on both the remaining and already assigned centers. -/
theorem target_of_checkCompatibilityCertificateForTargets
    {sstar : Label} {fixed : List (Label × Nat)}
    {targets : List (Label → Nat)} {choice : Label → Nat}
    {remaining : List Label} {assigned : List (Label × Nat)}
    {certificate : CompatibilityCertificate}
    (hcheck : checkCompatibilityCertificateForTargets sstar fixed targets
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
    ∃ target ∈ targets,
      (∀ center ∈ remaining, choice center = target center) ∧
        (∀ entry ∈ assigned, entry.2 = target entry.1) := by
  induction remaining generalizing assigned certificate with
  | nil =>
      cases certificate with
      | done =>
          unfold checkCompatibilityCertificateForTargets at hcheck
          rcases List.any_eq_true.mp hcheck with ⟨target, htarget, hagree⟩
          refine ⟨target, htarget, by simp, ?_⟩
          intro entry hentry
          rw [List.all_eq_true] at hagree
          simpa only [beq_iff_eq] using hagree entry hentry
      | split branches => simp [checkCompatibilityCertificateForTargets] at hcheck
      | prune center mask => simp [checkCompatibilityCertificateForTargets] at hcheck
  | cons head remaining ih =>
      cases certificate with
      | done => simp [checkCompatibilityCertificateForTargets] at hcheck
      | prune againstCenter againstMask =>
          simp [checkCompatibilityCertificateForTargets] at hcheck
      | split branches =>
          simp only [checkCompatibilityCertificateForTargets, Bool.and_eq_true] at hcheck
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
              rcases ih hbranchCheck
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
                    hseparationRemaining c (by simp [hc]) other (by simp [hother]) hne) with
                ⟨target, htarget, hremaining, hassignedTarget⟩
              refine ⟨target, htarget, ?_, ?_⟩
              · intro c hc
                rcases List.mem_cons.mp hc with rfl | hc
                · exact hassignedTarget (current, choice current) (by simp [current])
                · exact hremaining c hc
              · intro entry hentry
                exact hassignedTarget entry (by simp [hentry])
          | split childBranches =>
              rcases ih hbranchCheck
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
                    hseparationRemaining c (by simp [hc]) other (by simp [hother]) hne) with
                ⟨target, htarget, hremaining, hassignedTarget⟩
              refine ⟨target, htarget, ?_, ?_⟩
              · intro c hc
                rcases List.mem_cons.mp hc with rfl | hc
                · exact hassignedTarget (current, choice current) (by simp [current])
                · exact hremaining c hc
              · intro entry hentry
                exact hassignedTarget entry (by simp [hentry])

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

/-- A valid pinned fragment accepted by a multi-target tree agrees on every free
center with one target from the supplied list. -/
theorem validFragment_target_of_checkCompatibilityCertificateForTargets
    {sstar : Label} {fixed : List (Label × Nat)} {free : List Label}
    {targets : List (Label → Nat)} {certificate : CompatibilityCertificate}
    {shadow : Shadow}
    (hcheck : checkCompatibilityCertificateForTargets sstar fixed targets
      free [] certificate = true)
    (hvalid : isValidPinnedFragment sstar shadow = true)
    (hdisjoint : ∀ center ∈ free, ∀ entry ∈ fixed, center ≠ entry.1)
    (hfixed : ∀ entry ∈ fixed, shadow.centerMask entry.1 = entry.2) :
    ∃ target ∈ targets,
      ∀ center ∈ free, shadow.centerMask center = target center := by
  rcases target_of_checkCompatibilityCertificateForTargets hcheck
      (fun center hcenter =>
        shadow_mask_mem_candidateDomain hvalid hcenter hdisjoint hfixed)
      (by simp)
      (by simp)
      (fun center hcenter other hother hne =>
        crossSeparationOKForMasks_of_searchSeparationOK
          (searchSeparationOK_of_isValidPinnedFragment hvalid) hne) with
    ⟨target, htarget, hfree, _⟩
  exact ⟨target, htarget, hfree⟩

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
