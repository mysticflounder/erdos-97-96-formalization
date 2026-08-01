/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.SeparationCertificate

/-!
# Exact-five common-shell v7 encoder atoms

This file records the two atom families used by the v7 delta:

* variables `27761..27904`: the 144 direct/mirrored boundary-order selectors;
* variables `41603..43087`: equality of two of the 55 unordered carrier edges.

The global-equality rows are decoded in the same nested lexicographic order as
Python's `itertools.combinations(range(11), 2)` followed by combinations of
the resulting 55 edges.  The order selectors use the encoder's Python
lexicographic permutation order, which is deliberately kept separate from the
constructive `card11InternalOrderEquivFin72` certificate enumeration.
-/

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554.SeparationCore

abbrev Label := Fin 11
abbrev RawEdge := Label × Label
abbrev GlobalEqRow := RawEdge × RawEdge

def toLabel (n : Nat) : Label :=
  ⟨n % 11, Nat.mod_lt n (by decide)⟩

def edgeCode (e : RawEdge) : Nat :=
  11 * e.1.val + e.2.val

def canonicalEdge (a b : Label) : RawEdge :=
  if a < b then (a, b) else (b, a)

/-- Python's `gkey`: sort the two already-canonical edges by their encoder
code. -/
def canonicalGlobalRow (first second : RawEdge) : GlobalEqRow :=
  if edgeCode first < edgeCode second then
    (first, second)
  else
    (second, first)

def encoderEdges : List RawEdge :=
  (List.finRange 11).flatMap fun a =>
    ((List.finRange 11).filter fun b => decide (a < b)).map fun b =>
      (toLabel a, toLabel b)

def encoderGlobalEqRows : List GlobalEqRow :=
  encoderEdges.flatMap fun first =>
    (encoderEdges.filter fun second =>
      decide (edgeCode first < edgeCode second)).map fun second =>
        (first, second)

theorem encoderEdges_length : encoderEdges.length = 55 := by
  decide

theorem encoderGlobalEqRows_length :
    encoderGlobalEqRows.length = 1485 := by
  set_option maxRecDepth 100000 in
    decide

def globalEqRow (i : Fin 1485) : GlobalEqRow :=
  encoderGlobalEqRows.get
    ⟨i.val, by simpa [encoderGlobalEqRows_length] using i.isLt⟩

/- ## The encoder's lexicographic internal-order enumeration -/

def encoderPermTwoAt : Fin 2 → Equiv.Perm (Fin 2)
  | 0 => Equiv.refl _
  | 1 => Equiv.swap 0 1

/-- The inverse-position permutations associated with Python's lexicographic
lists `[0,1,2]`, `[0,2,1]`, `[1,0,2]`, `[1,2,0]`, `[2,0,1]`,
`[2,1,0]`. -/
def encoderPermThreeAt : Fin 6 → Equiv.Perm (Fin 3)
  | 0 => Equiv.refl _
  | 1 => Equiv.swap 1 2
  | 2 => Equiv.swap 0 1
  | 3 => (Equiv.swap 0 1).trans (Equiv.swap 1 2)
  | 4 => (Equiv.swap 1 2).trans (Equiv.swap 0 1)
  | 5 => Equiv.swap 0 2

def encoderInternalOrderAt (i : Fin 72) : Card11InternalOrder :=
  let o2 : Fin 2 := ⟨i.val / 36, by omega⟩
  let s : Fin 6 := ⟨(i.val % 36) / 6, by omega⟩
  let o1 : Fin 6 := ⟨i.val % 6, Nat.mod_lt _ (by decide)⟩
  (encoderPermTwoAt o2, (encoderPermThreeAt s, encoderPermThreeAt o1))

theorem encoderInternalOrderAt_bijective :
    Function.Bijective encoderInternalOrderAt := by
  set_option maxRecDepth 100000 in
    decide

noncomputable def encoderInternalOrderEquiv : Fin 72 ≃ Card11InternalOrder :=
  Equiv.ofBijective encoderInternalOrderAt
    encoderInternalOrderAt_bijective

def selectorInternalIndex (i : Fin 144) : Fin 72 :=
  ⟨i.val % 72, Nat.mod_lt _ (by decide)⟩

def selectorIndexEquiv (i : Fin 144) : Label ≃ Label :=
  if i.val < 72 then
    card11IndexEquiv (encoderInternalOrderAt (selectorInternalIndex i))
  else
    card11MirrorIndexEquiv
      (encoderInternalOrderAt (selectorInternalIndex i))

noncomputable def directSelector (order : Card11InternalOrder) : Fin 144 :=
  ⟨(encoderInternalOrderEquiv.symm order).val, by
    exact (encoderInternalOrderEquiv.symm order).isLt.trans (by decide)⟩

noncomputable def mirrorSelector (order : Card11InternalOrder) : Fin 144 :=
  ⟨72 + (encoderInternalOrderEquiv.symm order).val, by
    have := (encoderInternalOrderEquiv.symm order).isLt
    omega⟩

theorem selectorIndexEquiv_directSelector
    (order : Card11InternalOrder) :
    selectorIndexEquiv (directSelector order) =
      card11IndexEquiv order := by
  have hlt : (directSelector order).val < 72 := by
    simpa [directSelector] using (encoderInternalOrderEquiv.symm order).isLt
  rw [selectorIndexEquiv]
  simp only [if_pos hlt]
  apply congrArg card11IndexEquiv
  calc
    encoderInternalOrderAt (selectorInternalIndex (directSelector order)) =
        encoderInternalOrderEquiv
          (encoderInternalOrderEquiv.symm order) := by
            congr 1
            apply Fin.ext
            simp [selectorInternalIndex, directSelector]
    _ = order := encoderInternalOrderEquiv.apply_symm_apply order

theorem selectorIndexEquiv_mirrorSelector
    (order : Card11InternalOrder) :
    selectorIndexEquiv (mirrorSelector order) =
      card11MirrorIndexEquiv order := by
  have hnot : ¬ (mirrorSelector order).val < 72 := by
    simp [mirrorSelector]
  rw [selectorIndexEquiv]
  simp only [if_neg hnot]
  apply congrArg card11MirrorIndexEquiv
  calc
    encoderInternalOrderAt (selectorInternalIndex (mirrorSelector order)) =
        encoderInternalOrderEquiv
          (encoderInternalOrderEquiv.symm order) := by
            congr 1
            apply Fin.ext
            simp [selectorInternalIndex, mirrorSelector]
    _ = order := encoderInternalOrderEquiv.apply_symm_apply order

/-- Position-to-label list of a selector, in manifest serialization order. -/
def selectorLabels (i : Fin 144) : List Label :=
  List.ofFn fun position => (selectorIndexEquiv i).symm position

theorem selectorLabels_zero :
    selectorLabels 0 = [0, 9, 10, 1, 3, 4, 5, 2, 6, 7, 8] := by
  decide

theorem selectorLabels_seventyTwo :
    selectorLabels 72 = [0, 8, 7, 6, 2, 5, 4, 3, 1, 10, 9] := by
  decide

/- ## Variable-number round trips -/

inductive Atom where
  | orderSelector (index : Fin 144)
  | globalEdgeEq (index : Fin 1485)
deriving DecidableEq

def varOfAtom : Atom → Nat
  | .orderSelector i => 27761 + i.val
  | .globalEdgeEq i => 41603 + i.val

def atomOfVar (n : Nat) : Atom :=
  if hOrder : 27761 ≤ n ∧ n < 27905 then
    .orderSelector ⟨n - 27761, by omega⟩
  else if hGlobal : 41603 ≤ n ∧ n < 43088 then
    .globalEdgeEq ⟨n - 41603, by omega⟩
  else
    .orderSelector 0

theorem atomOfVar_varOfAtom_order (i : Fin 144) :
    atomOfVar (varOfAtom (.orderSelector i)) = .orderSelector i := by
  rw [atomOfVar, varOfAtom, dif_pos (by omega)]
  apply congrArg Atom.orderSelector
  apply Fin.ext
  simp

theorem atomOfVar_varOfAtom_global (i : Fin 1485) :
    atomOfVar (varOfAtom (.globalEdgeEq i)) = .globalEdgeEq i := by
  rw [atomOfVar, varOfAtom, dif_neg (by omega), dif_pos (by omega)]
  apply congrArg Atom.globalEdgeEq
  apply Fin.ext
  simp

theorem varOfAtom_order_range (i : Fin 144) :
    27761 ≤ varOfAtom (.orderSelector i) ∧
      varOfAtom (.orderSelector i) ≤ 27904 := by
  simp [varOfAtom]
  omega

theorem varOfAtom_global_range (i : Fin 1485) :
    41603 ≤ varOfAtom (.globalEdgeEq i) ∧
      varOfAtom (.globalEdgeEq i) ≤ 43087 := by
  simp [varOfAtom]
  omega

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.encoderInternalOrderAt_bijective
#print axioms Problem97.ExactFiveCommonShellV7.atomOfVar_varOfAtom_order
#print axioms Problem97.ExactFiveCommonShellV7.atomOfVar_varOfAtom_global
