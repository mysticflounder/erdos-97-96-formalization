/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenSourceNormalForm
import Std.Sat.CNF

/-!
# Checked SAT surface for the exact-seventeen BlockerV source normal form

This module defines the SAT atoms, deterministic DIMACS numbering, and base
CNF directly in Lean.  The clauses encode exactly the Boolean fields of
`SourceModel`; later metric refinements must be admitted separately through
named Lean consumers.
-/

namespace Problem97
namespace ATailBlockerVExactSeventeenSourceCnf

open ATailBlockerVExactSeventeenSourceNormalForm

/-- Proof-facing atoms of the exact-seventeen source model. -/
inductive Atom where
  | hit (center point : Label)
  | nextCenter (center : Label)
  | namedOrder (order : NamedOrder)
deriving DecidableEq, Fintype, Repr

abbrev Lit := Atom × Bool

def pos (atom : Atom) : Lit := (atom, true)
def neg (atom : Atom) : Lit := (atom, false)

/-- All labels, in the canonical `Fin` order. -/
def labels : List Label := List.ofFn id

/-- The four old rows, in their source order. -/
def oldRows : List (Fin 4) := List.ofFn id

/-- Executable, deterministic enumeration of the distinguished-cap labels. -/
def secondCapList : List Label := [0, 2, 6, 7, 8, 9, 10, 11, 12]

/-- Executable, deterministic enumeration of the labels outside that cap. -/
def outsideList : List Label := [1, 3, 4, 5, 13, 14, 15, 16]

/-- Executable, deterministic enumeration of the selected physical class. -/
def physicalList : List Label := [6, 7, 8, 9, 10]

/-- The executable label tables agree with the source-normal-form regions. -/
theorem regionList_regression :
    (∀ point, point ∈ secondCapList ↔ point ∈ secondCapLabels) ∧
      (∀ point, point ∈ outsideList ↔ point ∈ outsideLabels) ∧
      (∀ point, point ∈ physicalList ↔ point ∈ physicalLabels) := by
  decide

/-- All unordered pairs from a list, preserving the input order. -/
def unorderedPairs {α : Type*} : List α → List (α × α)
  | [] => []
  | a :: rest => rest.map (fun b => (a, b)) ++ unorderedPairs rest

/-- An unordered pair drawn from a duplicate-free list has distinct entries. -/
theorem unorderedPairs_mem_ne {α : Type*} {items : List α} {a b : α}
    (hnodup : items.Nodup) (hmem : (a, b) ∈ unorderedPairs items) : a ≠ b := by
  induction items with
  | nil => simp [unorderedPairs] at hmem
  | cons head rest ih =>
      rw [unorderedPairs, List.mem_append] at hmem
      obtain ⟨hhead, hrest⟩ := List.nodup_cons.mp hnodup
      rcases hmem with hfirst | hlater
      · simp only [List.mem_map] at hfirst
        obtain ⟨point, hpoint, hpair⟩ := hfirst
        cases hpair
        exact fun heq => hhead (heq ▸ hpoint)
      · exact ih hrest hlater

/-- Both entries of an enumerated unordered pair occur in the source list. -/
theorem unorderedPairs_mem {α : Type*} {items : List α} {a b : α}
    (hmem : (a, b) ∈ unorderedPairs items) : a ∈ items ∧ b ∈ items := by
  induction items with
  | nil => simp [unorderedPairs] at hmem
  | cons head rest ih =>
      rw [unorderedPairs, List.mem_append] at hmem
      rcases hmem with hfirst | hlater
      · simp only [List.mem_map] at hfirst
        obtain ⟨point, hpoint, hpair⟩ := hfirst
        cases hpair
        exact ⟨List.mem_cons_self, List.mem_cons_of_mem a hpoint⟩
      · obtain ⟨ha, hb⟩ := ih hlater
        exact ⟨List.mem_cons_of_mem head ha, List.mem_cons_of_mem head hb⟩

/-- One-based DIMACS variable number for a row-incidence atom. -/
def hitVar (center point : Label) : Nat :=
  1 + center.val * 17 + point.val

/-- One-based DIMACS variable number for the chosen next center. -/
def nextCenterVar (center : Label) : Nat := 290 + center.val

/-- One-based DIMACS variable number for the normalized named order. -/
def namedOrderVar (order : NamedOrder) : Nat := 307 + order.val

/-- Deterministic one-based DIMACS numbering of every proof-facing atom. -/
def atomVar : Atom → Nat
  | .hit center point => hitVar center point
  | .nextCenter center => nextCenterVar center
  | .namedOrder order => namedOrderVar order

/-- The base formula has no auxiliary variables. -/
def baseNumVars : Nat := 308

/-- Every row has at most four hits. -/
def rowAtMostFourClauses : Std.Sat.CNF Atom :=
  labels.flatMap fun center =>
    (labels.sublistsLen 5).map fun points =>
      points.map fun point => neg (.hit center point)

/-- Every row has at least four hits. -/
def rowAtLeastFourClauses : Std.Sat.CNF Atom :=
  labels.flatMap fun center =>
    (labels.sublistsLen 14).map fun points =>
      points.map fun point => pos (.hit center point)

/-- A center does not lie in its own positive-radius row. -/
def centerNotMemClauses : Std.Sat.CNF Atom :=
  labels.map fun center => [neg (.hit center center)]

/-- Every carrier label is hit by at least one selected row. -/
def coverClauses : Std.Sat.CNF Atom :=
  labels.map fun point => labels.map fun center => pos (.hit center point)

/-- Two distinct full circle rows have at most two common hits. -/
def pairIntersectionClauses : Std.Sat.CNF Atom :=
  (unorderedPairs labels).flatMap fun centers =>
    (labels.sublistsLen 3).map fun points =>
      points.flatMap fun point =>
        [neg (.hit centers.1 point), neg (.hit centers.2 point)]

/-- Exact distinguished-cap slice of each old row. -/
def oldCapSliceClauses : Std.Sat.CNF Atom :=
  oldRows.flatMap fun row =>
    secondCapList.map fun point =>
      if point = oldFixedHit₁ row ∨ point = oldFixedHit₂ row then
        [pos (.hit (oldCenter row) point)]
      else
        [neg (.hit (oldCenter row) point)]

/-- Every outside label occurs in at least one old row. -/
def oldOutsideAtLeastOneClauses : Std.Sat.CNF Atom :=
  outsideList.map fun point =>
    oldRows.map fun row => pos (.hit (oldCenter row) point)

/-- Every outside label occurs in at most one old row. -/
def oldOutsideAtMostOneClauses : Std.Sat.CNF Atom :=
  outsideList.flatMap fun point =>
    (unorderedPairs oldRows).map fun rows =>
      [neg (.hit (oldCenter rows.1) point),
        neg (.hit (oldCenter rows.2) point)]

/-- Exactly one label is chosen as the next-row center. -/
def nextCenterChoiceClauses : Std.Sat.CNF Atom :=
  [labels.map fun center => pos (.nextCenter center)] ++
    (unorderedPairs labels).map (fun centers =>
      [neg (.nextCenter centers.1), neg (.nextCenter centers.2)])

/-- The next center is not one of the four old centers. -/
def nextCenterNotOldClauses : Std.Sat.CNF Atom :=
  oldRows.map fun row => [neg (.nextCenter (oldCenter row))]

/-- The chosen next row contains the source label `11`. -/
def nextSourceClauses : Std.Sat.CNF Atom :=
  labels.map fun center =>
    [neg (.nextCenter center), pos (.hit center 11)]

/-- The chosen next row contains at most one physical-class label. -/
def nextPhysicalClauses : Std.Sat.CNF Atom :=
  labels.flatMap fun center =>
    (unorderedPairs physicalList).map fun points =>
      [neg (.nextCenter center), neg (.hit center points.1),
        neg (.hit center points.2)]

/-- Exactly one of the two source-forced named orders is selected. -/
def namedOrderClauses : Std.Sat.CNF Atom :=
  [[pos (.namedOrder 0), pos (.namedOrder 1)],
    [neg (.namedOrder 0), neg (.namedOrder 1)]]

/-- Lean-authoritative Boolean base formula for the source normal form. -/
def baseCnf : Std.Sat.CNF Atom :=
  rowAtMostFourClauses ++
    rowAtLeastFourClauses ++
    centerNotMemClauses ++
    coverClauses ++
    pairIntersectionClauses ++
    oldCapSliceClauses ++
    oldOutsideAtLeastOneClauses ++
    oldOutsideAtMostOneClauses ++
    nextCenterChoiceClauses ++
    nextCenterNotOldClauses ++
    nextSourceClauses ++
    nextPhysicalClauses ++
    namedOrderClauses

/-- Signed DIMACS literal corresponding to a proof-facing literal. -/
def litToDimacs : Lit → Int
  | (atom, true) => Int.ofNat (atomVar atom)
  | (atom, false) => -(Int.ofNat (atomVar atom))

/-- Deterministic DIMACS clause list rendered from `baseCnf`. -/
def baseDimacs : List (List Int) :=
  baseCnf.map fun clause => clause.map litToDimacs

/-- Canonical DIMACS text produced from the checked clause list. -/
def dimacsString : String :=
  let lines :=
    s!"p cnf {baseNumVars} {baseDimacs.length}" ::
      baseDimacs.map fun clause =>
        String.intercalate " " (clause.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

/-- Truth assignment induced by a source-authenticated finite model. -/
def sourceAssign (model : SourceModel) : Atom → Bool
  | .hit center point => decide (point ∈ model.selected center)
  | .nextCenter center => decide (center = model.nextCenter)
  | .namedOrder order => decide (order = model.order)

/-- Semantic form of a checked clause under the source assignment. -/
theorem clause_eval_iff (model : SourceModel) (clause : Std.Sat.CNF.Clause Atom) :
    Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true ↔
      ∃ atom polarity, (atom, polarity) ∈ clause ∧
        sourceAssign model atom = polarity := by
  simp [Std.Sat.CNF.Clause.eval]

/-- A duplicate-free list longer than a finite set contains a point outside it. -/
theorem exists_not_mem_of_card_lt {α : Type*}
    (set : Finset α) (points : List α) (hnodup : points.Nodup)
    (hcard : set.card < points.length) :
    ∃ point ∈ points, point ∉ set := by
  classical
  by_contra h
  push_neg at h
  have hsubset : points.toFinset ⊆ set := by
    intro point hpoint
    exact h point (List.mem_toFinset.mp hpoint)
  have hle := Finset.card_le_card hsubset
  rw [List.toFinset_card_of_nodup hnodup] at hle
  omega

/-- A set larger than the complement of a duplicate-free list meets the list. -/
theorem exists_mem_of_compl_lt_card {α : Type*} [Fintype α]
    (set : Finset α) (points : List α) (hnodup : points.Nodup)
    (hcard : Fintype.card α - points.length < set.card) :
    ∃ point ∈ points, point ∈ set := by
  classical
  by_contra h
  push_neg at h
  have hsubset : set ⊆ points.toFinsetᶜ := by
    intro point hpoint
    simp only [Finset.mem_compl, List.mem_toFinset]
    exact fun hpoints => h point hpoints hpoint
  have hle := Finset.card_le_card hsubset
  rw [Finset.card_compl, List.toFinset_card_of_nodup hnodup] at hle
  omega

/-- Every source model satisfies the row-at-most-four clause family. -/
theorem sourceAssign_rowAtMostFour (model : SourceModel) :
    ∀ clause ∈ rowAtMostFourClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  intro clause hclause
  simp only [rowAtMostFourClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨center, _, points, hpoints, rfl⟩ := hclause
  have hlabels : labels.Nodup := by simp [labels]
  have hsub := (List.mem_sublistsLen.mp hpoints).1
  have hlen := (List.mem_sublistsLen.mp hpoints).2
  have hnodup := hsub.nodup hlabels
  obtain ⟨point, hpoint, hnotmem⟩ := exists_not_mem_of_card_lt
    (model.selected center) points hnodup (by rw [model.row_card, hlen]; omega)
  apply (clause_eval_iff model _).2
  refine ⟨.hit center point, false, ?_, ?_⟩
  · simp [neg, hpoint]
  · simp [sourceAssign, hnotmem]

/-- Every source model satisfies the row-at-least-four clause family. -/
theorem sourceAssign_rowAtLeastFour (model : SourceModel) :
    ∀ clause ∈ rowAtLeastFourClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  intro clause hclause
  simp only [rowAtLeastFourClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨center, _, points, hpoints, rfl⟩ := hclause
  have hlabels : labels.Nodup := by simp [labels]
  have hsub := (List.mem_sublistsLen.mp hpoints).1
  have hlen := (List.mem_sublistsLen.mp hpoints).2
  have hnodup := hsub.nodup hlabels
  obtain ⟨point, hpoint, hmem⟩ := exists_mem_of_compl_lt_card
    (model.selected center) points hnodup (by
      rw [model.row_card, hlen]
      decide)
  apply (clause_eval_iff model _).2
  refine ⟨.hit center point, true, ?_, ?_⟩
  · simp [pos, hpoint]
  · simp [sourceAssign, hmem]

/-- Every source model satisfies center exclusion. -/
theorem sourceAssign_centerNotMem (model : SourceModel) :
    ∀ clause ∈ centerNotMemClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  intro clause hclause
  simp only [centerNotMemClauses, List.mem_map] at hclause
  obtain ⟨center, _, rfl⟩ := hclause
  apply (clause_eval_iff model _).2
  refine ⟨.hit center center, false, by simp [neg], ?_⟩
  simp [sourceAssign, model.center_not_mem]

/-- Every source model satisfies carrier-wide row coverage. -/
theorem sourceAssign_cover (model : SourceModel) :
    ∀ clause ∈ coverClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  intro clause hclause
  simp only [coverClauses, List.mem_map] at hclause
  obtain ⟨point, _, rfl⟩ := hclause
  obtain ⟨center, hmem⟩ := model.cover point
  apply (clause_eval_iff model _).2
  refine ⟨.hit center point, true, ?_, ?_⟩
  · apply List.mem_map.mpr
    exact ⟨center, List.mem_ofFn.mpr ⟨center, rfl⟩, rfl⟩
  · simp [sourceAssign, hmem]

/-- Every source model satisfies pairwise full-row intersection capacity. -/
theorem sourceAssign_pairIntersection (model : SourceModel) :
    ∀ clause ∈ pairIntersectionClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  intro clause hclause
  simp only [pairIntersectionClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨centers, hcenters, points, hpoints, rfl⟩ := hclause
  have hlabels : labels.Nodup := by simp [labels]
  have hcentersne := unorderedPairs_mem_ne hlabels hcenters
  have hsub := (List.mem_sublistsLen.mp hpoints).1
  have hlen := (List.mem_sublistsLen.mp hpoints).2
  have hnodup := hsub.nodup hlabels
  obtain ⟨point, hpoint, hnotmem⟩ := exists_not_mem_of_card_lt
    (model.selected centers.1 ∩ model.selected centers.2) points hnodup (by
      have hle := model.pair_inter_le_two centers.1 centers.2 hcentersne
      rw [hlen]
      omega)
  simp only [Finset.mem_inter, not_and_or] at hnotmem
  apply (clause_eval_iff model _).2
  rcases hnotmem with hfirst | hsecond
  · refine ⟨.hit centers.1 point, false, ?_, ?_⟩
    · apply List.mem_flatMap.mpr
      exact ⟨point, hpoint, by simp [neg]⟩
    · simp [sourceAssign, hfirst]
  · refine ⟨.hit centers.2 point, false, ?_, ?_⟩
    · apply List.mem_flatMap.mpr
      exact ⟨point, hpoint, by simp [neg]⟩
    · simp [sourceAssign, hsecond]

/-- Every source model satisfies the exact old-row cap slices. -/
theorem sourceAssign_oldCapSlice (model : SourceModel) :
    ∀ clause ∈ oldCapSliceClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  intro clause hclause
  simp only [oldCapSliceClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨row, _, point, hpoint, rfl⟩ := hclause
  have hcap : point ∈ secondCapLabels :=
    (regionList_regression.1 point).mp hpoint
  have hslice := congrArg (fun set : Finset Label => point ∈ set)
    (model.old_cap_slice row)
  simp only [Finset.mem_inter, hcap, and_true, Finset.mem_insert,
    Finset.mem_singleton] at hslice
  by_cases hfixed : point = oldFixedHit₁ row ∨ point = oldFixedHit₂ row
  · rw [if_pos hfixed]
    apply (clause_eval_iff model _).2
    refine ⟨.hit (oldCenter row) point, true, by simp [pos], ?_⟩
    simp [sourceAssign, hslice.mpr hfixed]
  · rw [if_neg hfixed]
    have hnotmem : point ∉ model.selected (oldCenter row) :=
      fun hmem => hfixed (hslice.mp hmem)
    apply (clause_eval_iff model _).2
    refine ⟨.hit (oldCenter row) point, false, by simp [neg], ?_⟩
    simp [sourceAssign, hnotmem]

/-- Every source model gives each outside label an old-row hit. -/
theorem sourceAssign_oldOutsideAtLeastOne (model : SourceModel) :
    ∀ clause ∈ oldOutsideAtLeastOneClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  intro clause hclause
  simp only [oldOutsideAtLeastOneClauses, List.mem_map] at hclause
  obtain ⟨point, hpoint, rfl⟩ := hclause
  have houtside : point ∈ outsideLabels :=
    (regionList_regression.2.1 point).mp hpoint
  have hcard := model.old_outside_multiplicity_one point houtside
  have hnonempty : (Finset.univ.filter fun row : Fin 4 =>
      point ∈ model.selected (oldCenter row)).Nonempty := by
    apply Finset.card_pos.mp
    rw [hcard]
    decide
  obtain ⟨row, hrow⟩ := hnonempty
  have hmem : point ∈ model.selected (oldCenter row) :=
    (Finset.mem_filter.mp hrow).2
  apply (clause_eval_iff model _).2
  refine ⟨.hit (oldCenter row) point, true, ?_, ?_⟩
  · apply List.mem_map.mpr
    exact ⟨row, List.mem_ofFn.mpr ⟨row, rfl⟩, rfl⟩
  · simp [sourceAssign, hmem]

/-- Every source model gives each outside label at most one old-row hit. -/
theorem sourceAssign_oldOutsideAtMostOne (model : SourceModel) :
    ∀ clause ∈ oldOutsideAtMostOneClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  intro clause hclause
  simp only [oldOutsideAtMostOneClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨point, hpoint, rows, hrows, rfl⟩ := hclause
  have houtside : point ∈ outsideLabels :=
    (regionList_regression.2.1 point).mp hpoint
  have hrowsne := unorderedPairs_mem_ne (by simp [oldRows]) hrows
  have hnotboth : ¬ (point ∈ model.selected (oldCenter rows.1) ∧
      point ∈ model.selected (oldCenter rows.2)) := by
    intro hboth
    let hitRows := Finset.univ.filter fun row : Fin 4 =>
      point ∈ model.selected (oldCenter row)
    have hfirst : rows.1 ∈ hitRows := by simp [hitRows, hboth.1]
    have hsecond : rows.2 ∈ hitRows := by simp [hitRows, hboth.2]
    have hsubset : ({rows.1, rows.2} : Finset (Fin 4)) ⊆ hitRows := by
      intro row hrow
      simp only [Finset.mem_insert, Finset.mem_singleton] at hrow
      rcases hrow with rfl | rfl
      · exact hfirst
      · exact hsecond
    have hle := Finset.card_le_card hsubset
    have hcard := model.old_outside_multiplicity_one point houtside
    change hitRows.card = 1 at hcard
    have hpairs : ({rows.1, rows.2} : Finset (Fin 4)).card = 2 := by
      simp [hrowsne]
    omega
  by_cases hfirst : point ∈ model.selected (oldCenter rows.1)
  · have hsecond : point ∉ model.selected (oldCenter rows.2) :=
      fun hmem => hnotboth ⟨hfirst, hmem⟩
    apply (clause_eval_iff model _).2
    refine ⟨.hit (oldCenter rows.2) point, false, by simp [neg], ?_⟩
    simp [sourceAssign, hsecond]
  · apply (clause_eval_iff model _).2
    refine ⟨.hit (oldCenter rows.1) point, false, by simp [neg], ?_⟩
    simp [sourceAssign, hfirst]

/-- Every source model satisfies the unique next-center choice clauses. -/
theorem sourceAssign_nextCenterChoice (model : SourceModel) :
    ∀ clause ∈ nextCenterChoiceClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  intro clause hclause
  rw [nextCenterChoiceClauses, List.mem_append] at hclause
  rcases hclause with hchoice | hpair
  · simp only [List.mem_singleton] at hchoice
    subst clause
    apply (clause_eval_iff model _).2
    refine ⟨.nextCenter model.nextCenter, true, ?_, ?_⟩
    · apply List.mem_map.mpr
      exact ⟨model.nextCenter,
        List.mem_ofFn.mpr ⟨model.nextCenter, rfl⟩, rfl⟩
    · simp [sourceAssign]
  · simp only [List.mem_map] at hpair
    obtain ⟨centers, hcenters, rfl⟩ := hpair
    have hne := unorderedPairs_mem_ne (by simp [labels]) hcenters
    by_cases hfirst : centers.1 = model.nextCenter
    · have hsecond : centers.2 ≠ model.nextCenter := by
        intro heq
        exact hne (hfirst.trans heq.symm)
      apply (clause_eval_iff model _).2
      refine ⟨.nextCenter centers.2, false, by simp [neg], ?_⟩
      simp [sourceAssign, hsecond]
    · apply (clause_eval_iff model _).2
      refine ⟨.nextCenter centers.1, false, by simp [neg], ?_⟩
      simp [sourceAssign, hfirst]

/-- Every source model excludes all four old rows as the next center. -/
theorem sourceAssign_nextCenterNotOld (model : SourceModel) :
    ∀ clause ∈ nextCenterNotOldClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  intro clause hclause
  simp only [nextCenterNotOldClauses, List.mem_map] at hclause
  obtain ⟨row, _, rfl⟩ := hclause
  have holdmem : oldCenter row ∈
      ({oldCenter 0, oldCenter 1, oldCenter 2, oldCenter 3} : Finset Label) := by
    fin_cases row <;> simp [oldCenter]
  have hne : oldCenter row ≠ model.nextCenter := by
    intro heq
    exact model.nextCenter_not_old (heq ▸ holdmem)
  apply (clause_eval_iff model _).2
  refine ⟨.nextCenter (oldCenter row), false, by simp [neg], ?_⟩
  simp [sourceAssign, hne]

/-- Every source model forces label `11` into its chosen next row. -/
theorem sourceAssign_nextSource (model : SourceModel) :
    ∀ clause ∈ nextSourceClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  intro clause hclause
  simp only [nextSourceClauses, List.mem_map] at hclause
  obtain ⟨center, _, rfl⟩ := hclause
  by_cases heq : center = model.nextCenter
  · subst center
    apply (clause_eval_iff model _).2
    refine ⟨.hit model.nextCenter 11, true, by simp [pos], ?_⟩
    simp [sourceAssign, model.next_source_mem]
  · apply (clause_eval_iff model _).2
    refine ⟨.nextCenter center, false, by simp [neg], ?_⟩
    simp [sourceAssign, heq]

/-- Every source model satisfies the chosen next row's physical-hit cap. -/
theorem sourceAssign_nextPhysical (model : SourceModel) :
    ∀ clause ∈ nextPhysicalClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  intro clause hclause
  simp only [nextPhysicalClauses, List.mem_flatMap, List.mem_map] at hclause
  obtain ⟨center, _, points, hpoints, rfl⟩ := hclause
  by_cases heq : center = model.nextCenter
  · subst center
    have hpointsne := unorderedPairs_mem_ne (by simp [physicalList]) hpoints
    obtain ⟨hfirstPhysical, hsecondPhysical⟩ := unorderedPairs_mem hpoints
    have hfirstPhysical' : points.1 ∈ physicalLabels :=
      (regionList_regression.2.2 points.1).mp hfirstPhysical
    have hsecondPhysical' : points.2 ∈ physicalLabels :=
      (regionList_regression.2.2 points.2).mp hsecondPhysical
    have hnotboth : ¬ (points.1 ∈ model.selected model.nextCenter ∧
        points.2 ∈ model.selected model.nextCenter) := by
      intro hboth
      have hsubset : ({points.1, points.2} : Finset Label) ⊆
          model.selected model.nextCenter ∩ physicalLabels := by
        intro point hpoint
        simp only [Finset.mem_insert, Finset.mem_singleton] at hpoint
        rcases hpoint with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hboth.1, hfirstPhysical'⟩
        · exact Finset.mem_inter.mpr ⟨hboth.2, hsecondPhysical'⟩
      have hle := Finset.card_le_card hsubset
      have hcap := model.next_physical_hits
      have hpairs : ({points.1, points.2} : Finset Label).card = 2 := by
        simp [hpointsne]
      omega
    by_cases hfirst : points.1 ∈ model.selected model.nextCenter
    · have hsecond : points.2 ∉ model.selected model.nextCenter :=
        fun hmem => hnotboth ⟨hfirst, hmem⟩
      apply (clause_eval_iff model _).2
      refine ⟨.hit model.nextCenter points.2, false, by simp [neg], ?_⟩
      simp [sourceAssign, hsecond]
    · apply (clause_eval_iff model _).2
      refine ⟨.hit model.nextCenter points.1, false, by simp [neg], ?_⟩
      simp [sourceAssign, hfirst]
  · apply (clause_eval_iff model _).2
    refine ⟨.nextCenter center, false, by simp [neg], ?_⟩
    simp [sourceAssign, heq]

/-- Every source model satisfies the two-way named-order choice. -/
theorem sourceAssign_namedOrder (model : SourceModel) :
    ∀ clause ∈ namedOrderClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign model) clause = true := by
  generalize horder : model.order = order
  fin_cases order <;>
    intro clause hclause <;>
    simp only [namedOrderClauses, List.mem_cons, List.not_mem_nil, or_false] at hclause <;>
    rcases hclause with rfl | rfl <;>
    simp [Std.Sat.CNF.Clause.eval, sourceAssign, pos, neg, horder]

/-- Gate B: every source-authenticated finite model satisfies the complete
Lean-authoritative Boolean base formula. -/
theorem sourceAssign_baseCnf (model : SourceModel) :
    Std.Sat.CNF.eval (sourceAssign model) baseCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro clause hclause
  simp only [baseCnf, List.mem_append] at hclause
  rcases hclause with hclause | h₁₃
  · rcases hclause with hclause | h₁₂
    · rcases hclause with hclause | h₁₁
      · rcases hclause with hclause | h₁₀
        · rcases hclause with hclause | h₉
          · rcases hclause with hclause | h₈
            · rcases hclause with hclause | h₇
              · rcases hclause with hclause | h₆
                · rcases hclause with hclause | h₅
                  · rcases hclause with hclause | h₄
                    · rcases hclause with hclause | h₃
                      · rcases hclause with h₁ | h₂
                        · exact sourceAssign_rowAtMostFour model clause h₁
                        · exact sourceAssign_rowAtLeastFour model clause h₂
                      · exact sourceAssign_centerNotMem model clause h₃
                    · exact sourceAssign_cover model clause h₄
                  · exact sourceAssign_pairIntersection model clause h₅
                · exact sourceAssign_oldCapSlice model clause h₆
              · exact sourceAssign_oldOutsideAtLeastOne model clause h₇
            · exact sourceAssign_oldOutsideAtMostOne model clause h₈
          · exact sourceAssign_nextCenterChoice model clause h₉
        · exact sourceAssign_nextCenterNotOld model clause h₁₀
      · exact sourceAssign_nextSource model clause h₁₁
    · exact sourceAssign_nextPhysical model clause h₁₂
  · exact sourceAssign_namedOrder model clause h₁₃

/-- Every source model therefore has a concrete satisfying assignment for the
checked Boolean base formula. -/
theorem sourceModel_baseCnf_sat (model : SourceModel) :
    ∃ assignment, Std.Sat.CNF.eval assignment baseCnf = true :=
  ⟨sourceAssign model, sourceAssign_baseCnf model⟩

/-- Gate-A-to-Gate-B adapter: a geometric source realization induces a
satisfying assignment of the exact finite base formula. -/
theorem SourceRealization.baseCnf_sat
    {A : Finset (EuclideanSpace ℝ (Fin 2))}
    (realization : SourceRealization A) :
    ∃ assignment, Std.Sat.CNF.eval assignment baseCnf = true :=
  sourceModel_baseCnf_sat realization.model

/-- The deterministic variable map is one-based and injective. -/
theorem atomVar_regression :
    (∀ atom, 1 ≤ atomVar atom ∧ atomVar atom ≤ baseNumVars) ∧
      Function.Injective atomVar := by
  native_decide

set_option maxHeartbeats 1000000 in
-- Native normalization of the 209,692-clause list needs a larger local budget.
/-- Exact clause-count anchor for the checked base formula. -/
theorem baseCnf_clause_count : baseCnf.length = 209692 := by
  native_decide

end ATailBlockerVExactSeventeenSourceCnf
end Problem97
