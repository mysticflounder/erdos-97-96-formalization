/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierCoverage
import Erdos9796Proof.P97.Census554.CapSelectedNativePlacements

/-!
# Soundness of the native equality-closure implementation

The native classifier computes row-generated edge equality with a bounded
union-find over the 121 oriented edge codes. This module proves that every
parent pointer and every reported root equality is sound with respect to the
proof-facing `EqualityCore.EdgeClosure` relation.
-/

namespace Problem97
namespace Census554
namespace CapSelectedNativeClosureSound

open EqualityCore
open CapSelectedFiniteCode
open CapSelectedNativeClassifier
open CapSelectedNativeClassifierFacts
open CapSelectedNativeClassifierSound
open CapSelectedNativeClassifierCoverage

/-- Decode one row-major edge code into canonical labels. -/
def edgeOfCode (code : Nat) : Edge Label :=
  (Fin.ofNat 11 (code / 11), Fin.ofNat 11 (code % 11))

/-- Every code produced by `edgeCode` lies in the 121-entry parent array. -/
theorem edgeCode_lt_121 (left right : Nat)
    (hleft : left < 11) (hright : right < 11) :
    edgeCode left right < 121 := by
  unfold edgeCode
  split <;> omega

/-- Decoding a canonical edge code changes at most its orientation. -/
theorem edgeClosure_edgeOfCode_edgeCode
    {P : RowPattern Label} (left right : Label) :
    EdgeClosure P (edgeOfCode (edgeCode left.val right.val))
      (left, right) := by
  unfold edgeCode
  split <;> rename_i horder
  · have hleft := left.isLt
    have hright := right.isLt
    have hedge : edgeOfCode (11 * left.val + right.val) = (left, right) := by
      apply Prod.ext <;> apply Fin.ext <;>
        simp [edgeOfCode, Fin.ofNat, Nat.mul_add_div,
          Nat.div_eq_of_lt hright, Nat.mod_eq_of_lt hright, hleft]
    rw [hedge]
    exact EdgeClosure.refl (left, right)
  · by_cases heq : left = right
    · subst right
      have hleft := left.isLt
      have hdiv : (11 * left.val + left.val) / 11 = left.val := by
        rw [Nat.mul_add_div (by decide)]
        simp [Nat.div_eq_of_lt hleft]
      have hmod : (11 * left.val + left.val) % 11 = left.val := by
        rw [Nat.mul_add_mod]
        exact Nat.mod_eq_of_lt hleft
      have hedge : edgeOfCode (11 * left.val + left.val) = (left, left) := by
        apply Prod.ext <;> apply Fin.ext <;>
          simp [edgeOfCode, Fin.ofNat, hdiv, hmod, hleft]
      rw [hedge]
      exact EdgeClosure.refl (left, left)
    · have hrightLeft : right.val < left.val := by
        have hle : right.val ≤ left.val := Nat.le_of_not_gt horder
        exact lt_of_le_of_ne hle (fun h => heq (Fin.ext h.symm))
      have hleft := left.isLt
      have hright := right.isLt
      have hedge : edgeOfCode (11 * right.val + left.val) = (right, left) := by
        apply Prod.ext <;> apply Fin.ext <;>
          simp [edgeOfCode, Fin.ofNat, Nat.mul_add_div,
            Nat.div_eq_of_lt hleft, Nat.mod_eq_of_lt hleft, hright]
      rw [hedge]
      exact EdgeClosure.flip right left

/-- Parent-array invariant: every live parent is in range and relates its edge
code to the child by genuine row equality closure. -/
def ParentsSound (P : RowPattern Label) (parents : Array Nat) : Prop :=
  parents.size = 121 /\
    ∀ edge, edge < 121 ->
      parents[edge]! < 121 /\
        EdgeClosure P (edgeOfCode edge) (edgeOfCode parents[edge]!)

/-- The identity parent array is sound for every row pattern. -/
theorem initialParents_sound (P : RowPattern Label) :
    ParentsSound P initialParents := by
  constructor
  · simp [initialParents]
  · intro edge hedge
    have hget : initialParents[edge]! = edge := by
      simp [initialParents, getElem!_pos, hedge]
    rw [hget]
    exact ⟨hedge, EdgeClosure.refl (edgeOfCode edge)⟩

/-- Following a bounded parent chain preserves equality closure and remains
inside the parent array. -/
theorem rootAux_sound
    {P : RowPattern Label} {parents : Array Nat}
    (hparents : ParentsSound P parents) :
    ∀ fuel edge, edge < 121 ->
      rootAux fuel parents edge < 121 /\
        EdgeClosure P (edgeOfCode edge)
          (edgeOfCode (rootAux fuel parents edge)) := by
  intro fuel
  induction fuel with
  | zero =>
      intro edge hedge
      exact ⟨hedge, EdgeClosure.refl (edgeOfCode edge)⟩
  | succ fuel ih =>
      intro edge hedge
      have hparent := hparents.2 edge hedge
      simp only [rootAux]
      split
      · rename_i heq
        exact ⟨hedge, EdgeClosure.refl (edgeOfCode edge)⟩
      · rename_i hne
        have htail := ih parents[edge]! hparent.1
        exact ⟨htail.1, hparent.2.trans htail.2⟩

/-- `root` is a sound representative of its input edge code. -/
theorem root_sound
    {P : RowPattern Label} {parents : Array Nat}
    (hparents : ParentsSound P parents) {edge : Nat} (hedge : edge < 121) :
    root parents edge < 121 /\
      EdgeClosure P (edgeOfCode edge) (edgeOfCode (root parents edge)) := by
  exact rootAux_sound hparents 121 edge hedge

/-- Equal union-find roots imply proof-facing equality closure. -/
theorem edgeClosure_of_root_eq
    {P : RowPattern Label} {parents : Array Nat}
    (hparents : ParentsSound P parents) {left right : Nat}
    (hleft : left < 121) (hright : right < 121)
    (heq : root parents left = root parents right) :
    EdgeClosure P (edgeOfCode left) (edgeOfCode right) := by
  have hleftRoot := root_sound hparents hleft
  have hrightRoot := root_sound hparents hright
  rw [heq] at hleftRoot
  exact hleftRoot.2.trans hrightRoot.2.symm

/-- In-bounds lookup after `set!`, stated using the executable `get!` API. -/
theorem getElem!_set! {array : Array Nat} {index value point : Nat}
    (hpoint : point < array.size) :
    (array.set! index value)[point]! =
      if index = point then value else array[point]! := by
  simp [Array.set!_eq_setIfInBounds, getElem!_pos, hpoint,
    Array.getElem_setIfInBounds]

/-- Merging two sound roots along a genuine closure equality preserves the
parent-array invariant. -/
theorem unionEdges_sound
    {P : RowPattern Label} {parents : Array Nat} {left right : Nat}
    (hparents : ParentsSound P parents)
    (hleft : left < 121) (hright : right < 121)
    (hclosure : EdgeClosure P (edgeOfCode left) (edgeOfCode right)) :
    ParentsSound P (unionEdges parents left right) := by
  have hleftRoot := root_sound hparents hleft
  have hrightRoot := root_sound hparents hright
  simp only [unionEdges]
  split
  · exact hparents
  · constructor
    · simp [hparents.1]
    · intro edge hedge
      have hedgeSize : edge < parents.size := by
        simpa [hparents.1] using hedge
      rw [getElem!_set! hedgeSize]
      split
      · rename_i heq
        have hrootClosure :
            EdgeClosure P (edgeOfCode (root parents right))
              (edgeOfCode (root parents left)) :=
          hrightRoot.2.symm.trans (hclosure.symm.trans hleftRoot.2)
        rw [← heq]
        exact ⟨hleftRoot.1, hrootClosure⟩
      · exact hparents.2 edge hedge

/-- Native support enumeration only returns canonical label values. -/
theorem supportPoint_lt_eleven
    {P : PatternCode} {center : Label} {point : Nat}
    (hpoint : point ∈ supportPoints (rowOfPattern P center).support) :
    point < 11 := by
  have hlabels := (List.mem_filter.mp hpoint).1
  simpa [labels] using hlabels

/-- Every native support point decodes to membership in the corresponding
proof-facing row. -/
theorem supportPoint_mem_row
    {P : PatternCode} {center : Label} {point : Nat}
    (hpoint : point ∈ supportPoints (rowOfPattern P center).support) :
    (⟨point, supportPoint_lt_eleven hpoint⟩ : Label) ∈ row P center := by
  let pointLabel : Label := ⟨point, supportPoint_lt_eleven hpoint⟩
  have hhas : has (rowMaskOf P center) point = true := by
    simpa [supportPoints, rowOfPattern] using (List.mem_filter.mp hpoint).2
  apply (mem_row_iff P center pointLabel).2
  rw [← has_rowMaskOf P center pointLabel]
  simpa [pointLabel] using hhas

/-- Two edge codes generated by one semantic row are genuinely closure
equivalent. -/
theorem edgeClosure_edgeCodes_of_supportPoints
    {P : PatternCode} {center : Label} {first second : Nat}
    (hfirst : first ∈ supportPoints (rowOfPattern P center).support)
    (hsecond : second ∈ supportPoints (rowOfPattern P center).support) :
    EdgeClosure (rowPattern P)
      (edgeOfCode (edgeCode center.val first))
      (edgeOfCode (edgeCode center.val second)) := by
  let firstLabel : Label := ⟨first, supportPoint_lt_eleven hfirst⟩
  let secondLabel : Label := ⟨second, supportPoint_lt_eleven hsecond⟩
  have hfirstDecode :=
    edgeClosure_edgeOfCode_edgeCode (P := rowPattern P) center firstLabel
  have hsecondDecode :=
    edgeClosure_edgeOfCode_edgeCode (P := rowPattern P) center secondLabel
  have hrow :
      EdgeClosure (rowPattern P) (center, firstLabel) (center, secondLabel) :=
    EdgeClosure.row center firstLabel secondLabel
      (supportPoint_mem_row hfirst) (supportPoint_mem_row hsecond)
  simpa [firstLabel, secondLabel] using
    hfirstDecode.trans (hrow.trans hsecondDecode.symm)

/-- Folding the row-generated unions over a support tail preserves parent
soundness. -/
theorem foldl_unionEdges_row_sound
    {P : PatternCode} {center : Label} {first : Nat}
    (hfirst : first ∈ supportPoints (rowOfPattern P center).support) :
    ∀ (points : List Nat) (parents : Array Nat),
      ParentsSound (rowPattern P) parents ->
      (∀ point, point ∈ points ->
        point ∈ supportPoints (rowOfPattern P center).support) ->
      ParentsSound (rowPattern P)
        (points.foldl
          (fun current point =>
            unionEdges current (edgeCode center.val first)
              (edgeCode center.val point))
          parents) := by
  intro points
  induction points with
  | nil =>
      intro parents hparents _hpoints
      simpa
  | cons point points ih =>
      intro parents hparents hpoints
      have hpoint := hpoints point (by simp)
      have hrest : ∀ other, other ∈ points ->
          other ∈ supportPoints (rowOfPattern P center).support := by
        intro other hother
        exact hpoints other (by simp [hother])
      have hleft : edgeCode center.val first < 121 :=
        edgeCode_lt_121 center.val first center.isLt
          (supportPoint_lt_eleven hfirst)
      have hright : edgeCode center.val point < 121 :=
        edgeCode_lt_121 center.val point center.isLt
          (supportPoint_lt_eleven hpoint)
      have hunion : ParentsSound (rowPattern P)
          (unionEdges parents (edgeCode center.val first)
            (edgeCode center.val point)) :=
        unionEdges_sound hparents hleft hright
          (edgeClosure_edgeCodes_of_supportPoints hfirst hpoint)
      simpa only [List.foldl_cons] using
        ih (unionEdges parents (edgeCode center.val first)
          (edgeCode center.val point)) hunion hrest

/-- Adding all equalities from one semantic row preserves parent soundness. -/
theorem addRowEqualities_rowOfPattern_sound
    {P : PatternCode} {parents : Array Nat}
    (hparents : ParentsSound (rowPattern P) parents) (center : Label) :
    ParentsSound (rowPattern P)
      (addRowEqualities parents (rowOfPattern P center)) := by
  generalize hsupport :
      supportPoints (rowOfPattern P center).support = support
  cases support with
  | nil =>
      simp [addRowEqualities, hsupport, hparents]
  | cons first rest =>
      have hfirst :
          first ∈ supportPoints (rowOfPattern P center).support := by
        rw [hsupport]
        simp
      have hrest : ∀ point, point ∈ rest ->
          point ∈ supportPoints (rowOfPattern P center).support := by
        intro point hpoint
        rw [hsupport]
        simp [hpoint]
      simpa [addRowEqualities, hsupport] using
        foldl_unionEdges_row_sound hfirst rest parents hparents hrest

/-- Folding semantic rows into any sound parent array preserves the invariant. -/
theorem foldl_addRowEqualities_semantic_sound
    {P : PatternCode} :
    ∀ (centers : List Label) (parents : Array Nat),
      ParentsSound (rowPattern P) parents ->
      ParentsSound (rowPattern P)
        ((centers.map (rowOfPattern P)).foldl addRowEqualities parents) := by
  intro centers
  induction centers with
  | nil =>
      intro parents hparents
      simpa
  | cons center centers ih =>
      intro parents hparents
      simp only [List.map_cons, List.foldl_cons]
      exact ih (addRowEqualities parents (rowOfPattern P center))
        (addRowEqualities_rowOfPattern_sound hparents center)

/-- Equality closure of any semantic row prefix has a sound parent array. -/
theorem equalityClosure_semanticRows_sound
    {P : PatternCode} (centers : List Label) :
    ParentsSound (rowPattern P)
      (equalityClosure (centers.map (rowOfPattern P))) := by
  apply foldl_addRowEqualities_semantic_sound centers initialParents
  exact initialParents_sound (rowPattern P)

@[simp] theorem normalizedRoots_size (parents : Array Nat) :
    (normalizedRoots parents).size = 121 := by
  simp [normalizedRoots]

/-- Lookup in the normalized root array agrees with `root`. -/
theorem normalizedRoots_getElem!
    (parents : Array Nat) {edge : Nat} (hedge : edge < 121) :
    (normalizedRoots parents)[edge]! = root parents edge := by
  simp [normalizedRoots, getElem!_pos, hedge]

/-- Every equality reported by normalized native roots is a proof-facing
closure equality between the corresponding oriented label edges. -/
theorem edgeClosure_of_edgesEqual_normalizedRoots
    {P : PatternCode} {parents : Array Nat}
    (hparents : ParentsSound (rowPattern P) parents)
    (left₁ right₁ left₂ right₂ : Label)
    (hequal : edgesEqual (normalizedRoots parents)
      left₁.val right₁.val left₂.val right₂.val = true) :
    EdgeClosure (rowPattern P) (left₁, right₁) (left₂, right₂) := by
  have hcode₁ : edgeCode left₁.val right₁.val < 121 :=
    edgeCode_lt_121 _ _ left₁.isLt right₁.isLt
  have hcode₂ : edgeCode left₂.val right₂.val < 121 :=
    edgeCode_lt_121 _ _ left₂.isLt right₂.isLt
  have hrootEq :
      root parents (edgeCode left₁.val right₁.val) =
        root parents (edgeCode left₂.val right₂.val) := by
    simpa [edgesEqual, normalizedRoots_getElem! parents hcode₁,
      normalizedRoots_getElem! parents hcode₂] using hequal
  have hcodes := edgeClosure_of_root_eq hparents hcode₁ hcode₂ hrootEq
  have hdecode₁ := edgeClosure_edgeOfCode_edgeCode
    (P := rowPattern P) left₁ right₁
  have hdecode₂ := edgeClosure_edgeOfCode_edgeCode
    (P := rowPattern P) left₂ right₂
  exact hdecode₁.symm.trans (hcodes.trans hdecode₂)

/-- Specialization to the equality closure of a semantic row prefix. -/
theorem edgeClosure_of_semanticRows_edgesEqual
    {P : PatternCode} (centers : List Label)
    (left₁ right₁ left₂ right₂ : Label)
    (hequal : edgesEqual
      (normalizedRoots (equalityClosure
        (centers.map (rowOfPattern P))))
      left₁.val right₁.val left₂.val right₂.val = true) :
    EdgeClosure (rowPattern P) (left₁, right₁) (left₂, right₂) :=
  edgeClosure_of_edgesEqual_normalizedRoots
    (equalityClosure_semanticRows_sound centers)
    left₁ right₁ left₂ right₂ hequal

/-- Two successful entries of a Boolean predicate on a duplicate-free list
can be chosen distinctly. -/
theorem exists_two_of_two_le_countP
    {α : Type*} {predicate : α -> Bool} {xs : List α}
    (hnodup : xs.Nodup) (hcount : 2 ≤ xs.countP predicate) :
    ∃ first second, first ∈ xs /\ second ∈ xs /\ first ≠ second /\
      predicate first = true /\ predicate second = true := by
  induction xs with
  | nil => simp at hcount
  | cons head tail ih =>
      have hheadFresh := (List.nodup_cons.mp hnodup).1
      have htailNodup := (List.nodup_cons.mp hnodup).2
      by_cases hhead : predicate head = true
      · rw [List.countP_cons_of_pos hhead] at hcount
        have htailPos : 0 < tail.countP predicate := by omega
        rcases List.countP_pos_iff.mp htailPos with
          ⟨second, hsecond, hsecondPredicate⟩
        exact ⟨head, second, by simp, by simp [hsecond],
          fun heq => hheadFresh (heq ▸ hsecond), hhead,
          hsecondPredicate⟩
      · rw [List.countP_cons_of_neg hhead] at hcount
        rcases ih htailNodup hcount with
          ⟨first, second, hfirst, hsecond, hne, hpfirst, hpsecond⟩
        exact ⟨first, second, by simp [hfirst], by simp [hsecond],
          hne, hpfirst, hpsecond⟩

/-- Three successful entries of a Boolean predicate on a duplicate-free list
can be chosen pairwise distinctly. -/
theorem exists_three_of_three_le_countP
    {α : Type*} {predicate : α -> Bool} {xs : List α}
    (hnodup : xs.Nodup) (hcount : 3 ≤ xs.countP predicate) :
    ∃ first second third,
      first ∈ xs /\ second ∈ xs /\ third ∈ xs /\
      first ≠ second /\ first ≠ third /\ second ≠ third /\
      predicate first = true /\ predicate second = true /\
      predicate third = true := by
  induction xs with
  | nil => simp at hcount
  | cons head tail ih =>
      have hheadFresh := (List.nodup_cons.mp hnodup).1
      have htailNodup := (List.nodup_cons.mp hnodup).2
      by_cases hhead : predicate head = true
      · rw [List.countP_cons_of_pos hhead] at hcount
        have htailTwo : 2 ≤ tail.countP predicate := by omega
        rcases exists_two_of_two_le_countP htailNodup htailTwo with
          ⟨second, third, hsecond, hthird, hsecondThird,
            hpsecond, hpthird⟩
        exact ⟨head, second, third, by simp, by simp [hsecond],
          by simp [hthird], fun heq => hheadFresh (heq ▸ hsecond),
          fun heq => hheadFresh (heq ▸ hthird), hsecondThird,
          hhead, hpsecond, hpthird⟩
      · rw [List.countP_cons_of_neg hhead] at hcount
        rcases ih htailNodup hcount with
          ⟨first, second, third, hfirst, hsecond, hthird,
            hfirstSecond, hfirstThird, hsecondThird,
            hpfirst, hpsecond, hpthird⟩
        exact ⟨first, second, third, by simp [hfirst],
          by simp [hsecond], by simp [hthird], hfirstSecond,
          hfirstThird, hsecondThird, hpfirst, hpsecond, hpthird⟩

theorem labels_nodup : labels.Nodup := by
  exact List.nodup_range

theorem lt_eleven_of_mem_labels {value : Nat} (hvalue : value ∈ labels) :
    value < 11 := by
  simpa [labels] using hvalue

/-- Canonical label attached to a native value known to occur in `labels`. -/
def labelOfMem (value : Nat) (hvalue : value ∈ labels) : Label :=
  ⟨value, lt_eleven_of_mem_labels hvalue⟩

@[simp] theorem labelOfMem_val (value : Nat) (hvalue : value ∈ labels) :
    (labelOfMem value hvalue).val = value := rfl

/-- Arithmetic validity of one base-eleven triple code. -/
def ValidTripleCode (code : Nat) : Prop :=
  code / 121 < 11 /\
    (code / 11) % 11 < 11 /\
    code % 11 < 11 /\
    code / 121 ≠ (code / 11) % 11 /\
    code / 121 ≠ code % 11 /\
    (code / 11) % 11 ≠ code % 11

instance (code : Nat) : Decidable (ValidTripleCode code) := by
  unfold ValidTripleCode
  infer_instance

set_option linter.style.nativeDecide false in
theorem tripleCodes_valid :
    CapSelectedBVRoleBank.tripleCodes.all
      (fun code => decide (ValidTripleCode code)) = true := by
  native_decide

theorem validTripleCode_of_mem {code : Nat}
    (hcode : code ∈ CapSelectedBVRoleBank.tripleCodes) :
    ValidTripleCode code := by
  exact of_decide_eq_true
    (List.all_eq_true.mp tripleCodes_valid code hcode)

/-- Decoded labels of a valid base-eleven triple code. -/
def tripleFirstLabel (code : Nat) : Label := Fin.ofNat 11 (code / 121)
def tripleSecondLabel (code : Nat) : Label :=
  Fin.ofNat 11 ((code / 11) % 11)
def tripleThirdLabel (code : Nat) : Label := Fin.ofNat 11 (code % 11)

theorem tripleFirstLabel_val_of_mem {code : Nat}
    (hcode : code ∈ CapSelectedBVRoleBank.tripleCodes) :
    (tripleFirstLabel code).val = code / 121 := by
  simp [tripleFirstLabel,
    Nat.mod_eq_of_lt (validTripleCode_of_mem hcode).1]

theorem tripleSecondLabel_val_of_mem {code : Nat}
    (hcode : code ∈ CapSelectedBVRoleBank.tripleCodes) :
    (tripleSecondLabel code).val = (code / 11) % 11 := by
  simp [tripleSecondLabel,
    Nat.mod_eq_of_lt (validTripleCode_of_mem hcode).2.1]

theorem tripleThirdLabel_val_of_mem {code : Nat}
    (hcode : code ∈ CapSelectedBVRoleBank.tripleCodes) :
    (tripleThirdLabel code).val = code % 11 := by
  simp [tripleThirdLabel,
    Nat.mod_eq_of_lt (validTripleCode_of_mem hcode).2.2.1]

theorem tripleLabels_pairwise_ne {code : Nat}
    (hcode : code ∈ CapSelectedBVRoleBank.tripleCodes) :
    tripleFirstLabel code ≠ tripleSecondLabel code /\
      tripleFirstLabel code ≠ tripleThirdLabel code /\
      tripleSecondLabel code ≠ tripleThirdLabel code := by
  have hvalid := validTripleCode_of_mem hcode
  constructor
  · intro heq
    have hval := congrArg Fin.val heq
    rw [tripleFirstLabel_val_of_mem hcode,
      tripleSecondLabel_val_of_mem hcode] at hval
    exact hvalid.2.2.2.1 hval
  constructor
  · intro heq
    have hval := congrArg Fin.val heq
    rw [tripleFirstLabel_val_of_mem hcode,
      tripleThirdLabel_val_of_mem hcode] at hval
    exact hvalid.2.2.2.2.1 hval
  · intro heq
    have hval := congrArg Fin.val heq
    rw [tripleSecondLabel_val_of_mem hcode,
      tripleThirdLabel_val_of_mem hcode] at hval
    exact hvalid.2.2.2.2.2 hval

/-- Soundness of the native duplicate-center detector on a semantic prefix. -/
theorem duplicateCenterCore_sound
    {P : PatternCode} (centers : List Label)
    (hcore : duplicateCenterCore
      (normalizedRoots (equalityClosure
        (centers.map (rowOfPattern P)))) = true) :
    Nonempty (DuplicateCenterCore (rowPattern P)) := by
  rw [duplicateCenterCore, List.any_eq_true] at hcore
  rcases hcore with ⟨code, hcode, hcount⟩
  let p : Label := tripleFirstLabel code
  let q : Label := tripleSecondLabel code
  let r : Label := tripleThirdLabel code
  let predicate : Nat -> Bool := fun center =>
    edgesEqual
        (normalizedRoots (equalityClosure
          (centers.map (rowOfPattern P))))
        center (code / 121) center ((code / 11) % 11) &&
      edgesEqual
        (normalizedRoots (equalityClosure
          (centers.map (rowOfPattern P))))
        center (code / 121) center (code % 11)
  have hcount' : 2 ≤ labels.countP predicate := by
    simpa [atLeast, predicate] using hcount
  rcases exists_two_of_two_le_countP labels_nodup hcount' with
    ⟨aNat, bNat, haMem, hbMem, habNat, ha, hb⟩
  let a : Label := labelOfMem aNat haMem
  let b : Label := labelOfMem bNat hbMem
  rw [Bool.and_eq_true] at ha hb
  have hvals := tripleLabels_pairwise_ne hcode
  refine ⟨{
    p := p, q := q, r := r, a := a, b := b
    hpq := hvals.1, hpr := hvals.2.1, hqr := hvals.2.2
    hab := ?_
    ap_aq := ?_, ap_ar := ?_, bp_bq := ?_, bp_br := ?_ }⟩
  · intro heq
    exact habNat (congrArg Fin.val heq)
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [predicate, a, p, q,
      tripleFirstLabel_val_of_mem hcode,
      tripleSecondLabel_val_of_mem hcode] using ha.1
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [predicate, a, p, r,
      tripleFirstLabel_val_of_mem hcode,
      tripleThirdLabel_val_of_mem hcode] using ha.2
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [predicate, b, p, q,
      tripleFirstLabel_val_of_mem hcode,
      tripleSecondLabel_val_of_mem hcode] using hb.1
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [predicate, b, p, r,
      tripleFirstLabel_val_of_mem hcode,
      tripleThirdLabel_val_of_mem hcode] using hb.2

/-- Soundness of the native perpendicular-bisector detector on a semantic
prefix. -/
theorem perpendicularBisectorCore_sound
    {P : PatternCode} (centers : List Label)
    (hcore : perpendicularBisectorCore
      (normalizedRoots (equalityClosure
        (centers.map (rowOfPattern P)))) = true) :
    Nonempty (PerpBisectorCore (rowPattern P)) := by
  rw [perpendicularBisectorCore, List.any_eq_true] at hcore
  rcases hcore with ⟨code, hcode, hcount⟩
  let a : Label := pairFirstLabel code
  let b : Label := pairSecondLabel code
  let predicate : Nat -> Bool := fun point =>
    edgesEqual
      (normalizedRoots (equalityClosure
        (centers.map (rowOfPattern P))))
      point (decodePair code).1 point (decodePair code).2
  have hcount' : 3 ≤ labels.countP predicate := by
    simpa [atLeast, predicate] using hcount
  rcases exists_three_of_three_le_countP labels_nodup hcount' with
    ⟨pNat, qNat, rNat, hpMem, hqMem, hrMem,
      hpqNat, hprNat, hqrNat, hp, hq, hr⟩
  let p : Label := labelOfMem pNat hpMem
  let q : Label := labelOfMem qNat hqMem
  let r : Label := labelOfMem rNat hrMem
  refine ⟨{
    a := a, b := b, p := p, q := q, r := r
    hab := pairLabels_ne_of_mem hcode
    hpq := ?_, hpr := ?_, hqr := ?_
    pa_pb := ?_, qa_qb := ?_, ra_rb := ?_ }⟩
  · intro heq
    exact hpqNat (congrArg Fin.val heq)
  · intro heq
    exact hprNat (congrArg Fin.val heq)
  · intro heq
    exact hqrNat (congrArg Fin.val heq)
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [predicate, p, a, b, decodePair,
      pairFirstLabel_val_of_mem hcode,
      pairSecondLabel_val_of_mem hcode] using hp
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [predicate, q, a, b, decodePair,
      pairFirstLabel_val_of_mem hcode,
      pairSecondLabel_val_of_mem hcode] using hq
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [predicate, r, a, b, decodePair,
      pairFirstLabel_val_of_mem hcode,
      pairSecondLabel_val_of_mem hcode] using hr

/-- Soundness of the native exact pinned-row off-circle detector. -/
theorem exactPinnedOffCircleCore_sound
    {P : PatternCode} (centers : List Label)
    (hcore : exactPinnedOffCircleCore
      (normalizedRoots (equalityClosure
        (centers.map (rowOfPattern P))))
      (rowOfPattern P 1).support = true) :
    ∃ core : ExactOffCircleCore (rowPattern P), core.c = 1 := by
  rw [exactPinnedOffCircleCore, List.any_eq_true] at hcore
  rcases hcore with ⟨onCircleNat, honMem, hon⟩
  rw [Bool.and_eq_true, List.any_eq_true] at hon
  rcases hon with ⟨honSupport, offCircleNat, hoffMem, hoff⟩
  rw [Bool.and_eq_true] at hoff
  let onCircle : Label := labelOfMem onCircleNat honMem
  let offCircle : Label := labelOfMem offCircleNat hoffMem
  have honP : P 1 onCircle = true := by
    rw [← has_rowMaskOf P 1 onCircle]
    simpa [onCircle, rowOfPattern] using honSupport
  have hoffP : P 1 offCircle = false := by
    rw [← has_rowMaskOf P 1 offCircle]
    simpa [offCircle, rowOfPattern] using hoff.1
  refine ⟨{
    c := 1, a := onCircle, z := offCircle
    ha := (mem_row_iff P 1 onCircle).2 honP
    hz := ?_
    hacz := ?_ }, rfl⟩
  · intro hmem
    have htrue := (mem_row_iff P 1 offCircle).1 hmem
    simp [hoffP] at htrue
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [onCircle, offCircle] using hoff.2

instance cyclicFiveUpToOrientationDecidable
    (a x b c y : Label) :
    Decidable (CyclicFiveUpToOrientation a x b c y) := by
  unfold CapSelectedFiniteCode.CyclicFiveUpToOrientation
    CapSelectedFiniteCode.CyclicFive CapSelectedFiniteCode.cyclicOffset
  infer_instance

set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- The executable and proof-facing oriented five-label predicates agree. -/
theorem cyclicFiveUpToOrientation_val_iff
    (a x b c y : Label) :
    CapSelectedNativeClassifier.cyclicFiveUpToOrientation
      a.val x.val b.val c.val y.val = true ↔
      CyclicFiveUpToOrientation a x b c y := by
  native_decide +revert

/-- Soundness of the native five-point detector at fixed endpoints. -/
theorem fivePointCoreAtEndpoints_sound
    {P : PatternCode} (centers : List Label) (a b : Label)
    (hcore : fivePointCoreAtEndpoints
      (normalizedRoots (equalityClosure
        (centers.map (rowOfPattern P)))) a.val b.val = true) :
    ∃ core : ConvexFivePointCore.Core (rowPattern P),
      CyclicFiveUpToOrientation core.a core.x core.b core.c core.y := by
  rw [fivePointCoreAtEndpoints] at hcore
  let bisectors := labels.filter fun point =>
    edgesEqual
      (normalizedRoots (equalityClosure
        (centers.map (rowOfPattern P))))
      point a.val point b.val
  change (bisectors.any fun x => bisectors.any fun y =>
    x != y && labels.any fun c =>
      CapSelectedNativeClassifier.cyclicFiveUpToOrientation
          a.val x b.val c y &&
        edgesEqual
          (normalizedRoots (equalityClosure
            (centers.map (rowOfPattern P))))
          c b.val c x &&
        edgesEqual
          (normalizedRoots (equalityClosure
            (centers.map (rowOfPattern P))))
          c b.val c y) = true at hcore
  rw [List.any_eq_true] at hcore
  rcases hcore with ⟨xNat, hxBisector, hx⟩
  rw [List.any_eq_true] at hx
  rcases hx with ⟨yNat, hyBisector, hxy⟩
  rw [Bool.and_eq_true, List.any_eq_true] at hxy
  rcases hxy with ⟨hxyNe, cNat, hcMem, hc⟩
  simp only [Bool.and_eq_true] at hc
  let x : Label := labelOfMem xNat (List.mem_filter.mp hxBisector).1
  let y : Label := labelOfMem yNat (List.mem_filter.mp hyBisector).1
  let c : Label := labelOfMem cNat hcMem
  have hcyclic : CyclicFiveUpToOrientation a x b c y :=
    (cyclicFiveUpToOrientation_val_iff a x b c y).1 (by
      simpa [x, y, c] using hc.1.1)
  refine ⟨{
    a := a, x := x, b := b, c := c, y := y
    hab := hcyclic.a_ne_b, hxy := hcyclic.x_ne_y
    xa_xb := ?_, ya_yb := ?_, cb_cx := ?_, cb_cy := ?_ }, hcyclic⟩
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [bisectors, x] using (List.mem_filter.mp hxBisector).2
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [bisectors, y] using (List.mem_filter.mp hyBisector).2
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [c, x] using hc.1.2
  · apply edgeClosure_of_semanticRows_edgesEqual centers
    simpa [c, y] using hc.2

/-- Soundness of the endpoint-enumerated native convex five-point detector. -/
theorem convexFivePointCore_sound
    {P : PatternCode} (centers : List Label)
    (hcore : convexFivePointCore
      (normalizedRoots (equalityClosure
        (centers.map (rowOfPattern P)))) = true) :
    ∃ core : ConvexFivePointCore.Core (rowPattern P),
      CyclicFiveUpToOrientation core.a core.x core.b core.c core.y := by
  rw [convexFivePointCore, List.any_eq_true] at hcore
  rcases hcore with ⟨code, hcode, hendpoint⟩
  rw [Bool.or_eq_true] at hendpoint
  rcases hendpoint with hforward | hreverse
  · apply fivePointCoreAtEndpoints_sound centers
      (pairFirstLabel code) (pairSecondLabel code)
    simpa [decodePair, pairFirstLabel_val_of_mem hcode,
      pairSecondLabel_val_of_mem hcode] using hforward
  · apply fivePointCoreAtEndpoints_sound centers
      (pairSecondLabel code) (pairFirstLabel code)
    simpa [decodePair, pairFirstLabel_val_of_mem hcode,
      pairSecondLabel_val_of_mem hcode] using hreverse

/-- A native row found at center value `1` is the semantic row at label `1`. -/
theorem row_eq_rowOfPattern_one_of_find?_eq_some
    {P : PatternCode} {centers : List Label} {nativeRow : Row}
    (hfind : (centers.map (rowOfPattern P)).find?
      (fun row => row.center == 1) = some nativeRow) :
    nativeRow = rowOfPattern P 1 := by
  have hmem := List.mem_of_find?_eq_some hfind
  rcases List.mem_map.mp hmem with ⟨center, _hcenter, rfl⟩
  have hcenterValue := List.find?_some hfind
  have hcenter : center = (1 : Label) := by
    apply Fin.ext
    simpa [rowOfPattern] using hcenterValue
  rw [hcenter]

/-- Pinned-shell exactness supplies a source whose blocker is center `1`. -/
theorem exists_blockerSource_one
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label}
    (hpin : PinnedShellOK P blocker pinSource deleted) :
    ∃ source, blocker source = 1 := by
  rcases hpin with ⟨_hpinSource, _hdeleted, _hne, hpinnedRow,
    _hdeletedRow, _hblocker, hpinnedBlocker, _hdeletedBlocker⟩
  refine ⟨0, hpinnedBlocker 0 ?_⟩
  rw [hpinnedRow]
  simp

/-- End-to-end extraction of a public closure-core alternative from the
native prefix detector. -/
theorem closureCoreAlternative_of_hasPrefixCore
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label}
    (hpin : PinnedShellOK P blocker pinSource deleted)
    (centers : List Label)
    (hcore : hasPrefixCore (centers.map (rowOfPattern P)) = true) :
    ClosureCoreAlternative P blocker := by
  let rows : List Row := centers.map (rowOfPattern P)
  let roots : Array Nat := normalizedRoots (equalityClosure rows)
  let pinned : Option Row := rows.find? (fun row => row.center == 1)
  by_cases hduplicate : duplicateCenterCore roots = true
  · left
    exact duplicateCenterCore_sound centers (by
      simpa [roots, rows] using hduplicate)
  have hduplicateFalse : duplicateCenterCore roots = false :=
    Bool.eq_false_iff.mpr hduplicate
  let exactHit : Bool :=
    match pinned with
    | some row => exactPinnedOffCircleCore roots row.support
    | none => false
  change (duplicateCenterCore roots || exactHit ||
    perpendicularBisectorCore roots || convexFivePointCore roots) = true
    at hcore
  by_cases hexact : exactHit = true
  · cases hpinned : pinned with
    | none => simp [exactHit, hpinned] at hexact
    | some nativeRow =>
        have hfind : rows.find? (fun row => row.center == 1) =
            some nativeRow := by
          simpa [pinned] using hpinned
        have hrow : nativeRow = rowOfPattern P 1 :=
          row_eq_rowOfPattern_one_of_find?_eq_some (by
            simpa [rows] using hfind)
        have hhit : exactPinnedOffCircleCore roots nativeRow.support = true := by
          simpa [exactHit, hpinned] using hexact
        have hhit' : exactPinnedOffCircleCore
            (normalizedRoots (equalityClosure
              (centers.map (rowOfPattern P))))
            (rowOfPattern P 1).support = true := by
          simpa [roots, rows, hrow] using hhit
        rcases exactPinnedOffCircleCore_sound centers hhit' with
          ⟨exactCore, hcenter⟩
        rcases exists_blockerSource_one hpin with ⟨source, hsource⟩
        right; left
        exact ⟨source, exactCore, hcenter.trans hsource.symm⟩
  have hexactFalse : exactHit = false := Bool.eq_false_iff.mpr hexact
  by_cases hperp : perpendicularBisectorCore roots = true
  · right; right; right; right; right; right; right; right; right; left
    exact perpendicularBisectorCore_sound centers (by
      simpa [roots, rows] using hperp)
  have hperpFalse : perpendicularBisectorCore roots = false :=
    Bool.eq_false_iff.mpr hperp
  have hfive : convexFivePointCore roots = true := by
    simpa [hduplicateFalse, hexactFalse, hperpFalse] using hcore
  right; right; right; right; right; right; right; right; right; right; left
  exact convexFivePointCore_sound centers (by
    simpa [roots, rows] using hfive)

/-- A successful native placement check produces the public closure-core
alternative for every proof-facing admissible pattern. -/
theorem closureCoreAlternative_of_placementCheck
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label}
    (hinc : IncidenceOK P)
    (hpin : PinnedShellOK P blocker pinSource deleted)
    (hcheck : placementCheck pinSource.val deleted.val = true) :
    ClosureCoreAlternative P blocker := by
  rcases exists_semanticPrefixCore_of_placementCheck hinc hpin hcheck with
    ⟨centers, _hnodup, hcore⟩
  exact closureCoreAlternative_of_hasPrefixCore hpin centers hcore

/-- The twelve native placement theorems cover every ordered choice of
distinct strict surplus-interior labels. -/
theorem placementCheck_of_interior
    {pinSource deleted : Label}
    (hpinSource : pinSource ∈ intS)
    (hdeleted : deleted ∈ intS) (hne : pinSource ≠ deleted) :
    placementCheck pinSource.val deleted.val = true := by
  fin_cases pinSource <;> fin_cases deleted <;>
    simp_all [intS, placementCheck_p3_d4, placementCheck_p3_d5,
      placementCheck_p3_d6, placementCheck_p4_d3, placementCheck_p4_d5,
      placementCheck_p4_d6, placementCheck_p5_d3, placementCheck_p5_d4,
      placementCheck_p5_d6, placementCheck_p6_d3, placementCheck_p6_d4,
      placementCheck_p6_d5]

/-- Total finite theorem consumed by the card-eleven geometric labeling
bridge. -/
theorem closureCoreAlternative_of_incidenceOK_pinnedShellOK
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label}
    (hinc : IncidenceOK P)
    (hpin : PinnedShellOK P blocker pinSource deleted) :
    ClosureCoreAlternative P blocker := by
  have hcheck := placementCheck_of_interior hpin.1 hpin.2.1 hpin.2.2.1
  exact closureCoreAlternative_of_placementCheck hinc hpin hcheck

end CapSelectedNativeClosureSound
end Census554
end Problem97
