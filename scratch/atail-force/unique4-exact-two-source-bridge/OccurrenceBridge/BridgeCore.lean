/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import IndexedSourceValuation

/-!
# Occurrence-map bridge core: dense atoms, valuation, clause satisfaction

Infrastructure for proving every trimmed p5 CNF clause satisfied by the
`IndexedSource` geometric valuation.  The dense variable numbering is the
encoder's (verified against all 616 name/number pairs of the authenticated
trimmed occurrence map `p5-largest.trimmed-occurrence-map.json`):

* vars `1–110`: `m_c_p`, c-major, `p` skipping `c`;
* vars `111–605`: `eq_c_l_r`, 45 lexicographic off-center pairs per center;
* vars `606–616`: `class_p`.

`bridgeVal Q σ` interprets variable `n` as the `IndexedSource` meaning of
its decoded atom (`rowMem` / `radiusEq` / `classHit`), so a clause-level
satisfaction statement composes with `DenseFamilySatisfaction` at the
documented seam.  This module proves no clause; it provides the atom
round-trip, literal-level helpers, and the subset transfer principle used
by every per-family bridge lemma.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P5OccurrenceBridgeScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open RetainedKalmansonDecoderScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

/- ## Dense atoms and the encoder variable numbering -/

/-- One dense Boolean atom of the selected p5 formula. -/
inductive DenseAtom where
  | m (c p : Label)
  | eq (c l r : Label)
  | classA (p : Label)
deriving DecidableEq

/-- The 45 off-center index pairs of one center, in the encoder's
lexicographic order. -/
def eqPairs (c : Label) : List (Label × Label) :=
  (((List.finRange 11).flatMap fun l =>
    (List.finRange 11).map fun r => (l, r)).filter
      fun pr => decide (pr.1 < pr.2) && decide (pr.1 ≠ c) &&
        decide (pr.2 ≠ c))

/-- Dense variable number of an atom (encoder numbering). -/
def varOfAtom : DenseAtom → Nat
  | .m c p => 1 + 10 * c.val + (if p.val < c.val then p.val else p.val - 1)
  | .eq c l r => 111 + 45 * c.val + (eqPairs c).idxOf (l, r)
  | .classA p => 606 + p.val

/-- Kernel-reducible index decoder (Mathlib's `Nat.cast` into `Fin` does
not reduce under `decide`). -/
def toLabel (n : Nat) : Label := ⟨n % 11, Nat.mod_lt n (by decide)⟩

/-- Atom of a dense variable number (left inverse of `varOfAtom` on the
valid range; junk outside it). -/
def atomOfVar (n : Nat) : DenseAtom :=
  if n ≤ 110 then
    let k := n - 1
    let j := k % 10
    .m (toLabel (k / 10)) (toLabel (if j < k / 10 then j else j + 1))
  else if n ≤ 605 then
    let k := n - 111
    let c : Label := toLabel (k / 45)
    let pr := (eqPairs c)[k % 45]!
    .eq c pr.1 pr.2
  else
    .classA (toLabel (n - 606))

/-- Validity of an atom: exactly the shapes carrying dense variables. -/
def validAtom : DenseAtom → Bool
  | .m c p => decide (c ≠ p)
  | .eq c l r => decide (l < r) && decide (l ≠ c) && decide (r ≠ c)
  | .classA _ => true

theorem atomOfVar_varOfAtom_m : ∀ c p : Label, c ≠ p →
    atomOfVar (varOfAtom (.m c p)) = .m c p := by decide

theorem atomOfVar_varOfAtom_eq : ∀ c l r : Label,
    l < r → l ≠ c → r ≠ c →
    atomOfVar (varOfAtom (.eq c l r)) = .eq c l r := by decide

theorem atomOfVar_varOfAtom_class : ∀ p : Label,
    atomOfVar (varOfAtom (.classA p)) = .classA p := by decide

/-- The decoded atom of a valid atom's variable is the atom itself. -/
theorem atomOfVar_varOfAtom (a : DenseAtom) (ha : validAtom a = true) :
    atomOfVar (varOfAtom a) = a := by
  cases a with
  | m c p =>
      exact atomOfVar_varOfAtom_m c p
        (by simpa [validAtom] using ha)
  | eq c l r =>
      simp only [validAtom, Bool.and_eq_true, decide_eq_true_eq] at ha
      exact atomOfVar_varOfAtom_eq c l r ha.1.1 ha.1.2 ha.2
  | classA p => exact atomOfVar_varOfAtom_class p

/-- Every dense variable number is positive. -/
theorem varOfAtom_pos (a : DenseAtom) : 1 ≤ varOfAtom a := by
  cases a with
  | m c p => simp only [varOfAtom]; split <;> omega
  | eq c l r => simp only [varOfAtom]; omega
  | classA p => simp only [varOfAtom]; omega

/- ## The bridge valuation and clause satisfaction -/

/-- `IndexedSource` interpretation of one dense atom. -/
def interpAtom (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) : DenseAtom → Prop
  | .m c p => rowMem Q σ c p
  | .eq c l r => radiusEq Q σ c l r
  | .classA p => classHit Q σ p

/-- The bridge valuation: dense variable `n` means the `IndexedSource`
interpretation of its decoded atom. -/
def bridgeVal (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) : Nat → Prop :=
  fun n => interpAtom Q σ (atomOfVar n)

/-- One signed DIMACS literal is satisfied by a valuation. -/
def litSat (v : Nat → Prop) (l : Int) : Prop :=
  if 0 ≤ l then v l.toNat else ¬ v (-l).toNat

/-- One signed clause is satisfied: some literal is. -/
def clauseSat (v : Nat → Prop) (clause : List Int) : Prop :=
  ∃ l ∈ clause, litSat v l

theorem litSat_pos {v : Nat → Prop} {n : Nat} (h : v n) :
    litSat v (n : Int) := by
  unfold litSat
  rw [if_pos (Int.natCast_nonneg n)]
  simpa using h

theorem litSat_neg {v : Nat → Prop} {n : Nat} (hn : 1 ≤ n) (h : ¬ v n) :
    litSat v (-(n : Int)) := by
  unfold litSat
  rw [if_neg (by omega)]
  simpa using h

/-- A true positive atom literal is satisfied by the bridge valuation. -/
theorem litSat_posAtom (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (a : DenseAtom) (ha : validAtom a = true)
    (h : interpAtom Q σ a) :
    litSat (bridgeVal Q σ) ((varOfAtom a : Nat) : Int) :=
  litSat_pos (show bridgeVal Q σ (varOfAtom a) by
    unfold bridgeVal
    rw [atomOfVar_varOfAtom a ha]
    exact h)

/-- A false atom's negative literal is satisfied by the bridge
valuation. -/
theorem litSat_negAtom (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (a : DenseAtom) (ha : validAtom a = true)
    (h : ¬ interpAtom Q σ a) :
    litSat (bridgeVal Q σ) (-((varOfAtom a : Nat) : Int)) :=
  litSat_neg (varOfAtom_pos a)
    (show ¬ bridgeVal Q σ (varOfAtom a) by
      unfold bridgeVal
      rw [atomOfVar_varOfAtom a ha]
      exact h)

/- ## Subset transfer -/

/-- Boolean check: every literal of `lits` occurs in `clause`. -/
def litsSubset (lits clause : List Int) : Bool :=
  lits.all fun l => clause.contains l

/-- Satisfaction transfers from a literal subset to the stored clause:
the stored clause is at most weaker. -/
theorem clauseSat_of_subset {v : Nat → Prop} {lits clause : List Int}
    (hsub : litsSubset lits clause = true) (h : clauseSat v lits) :
    clauseSat v clause := by
  obtain ⟨l, hl, hsat⟩ := h
  refine ⟨l, ?_, hsat⟩
  simpa using List.all_eq_true.mp hsub l hl

/- ## Sorted equality atoms -/

/-- The stored `eq` atom for an unordered pair, sorted to the encoder's
`l < r` normal form. -/
def sortedEq (c a b : Label) : DenseAtom :=
  if a < b then .eq c a b else .eq c b a

theorem validAtom_sortedEq : ∀ c a b : Label, a ≠ b → a ≠ c → b ≠ c →
    validAtom (sortedEq c a b) = true := by decide

theorem interpAtom_sortedEq (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) (c a b : Label) :
    interpAtom Q σ (sortedEq c a b) ↔ radiusEq Q σ c a b := by
  unfold sortedEq
  split
  · exact Iff.rfl
  · exact radiusEq_comm Q σ c b a

end P5OccurrenceBridgeScratch
end Problem97

#print axioms Problem97.P5OccurrenceBridgeScratch.atomOfVar_varOfAtom
#print axioms Problem97.P5OccurrenceBridgeScratch.clauseSat_of_subset
#print axioms Problem97.P5OccurrenceBridgeScratch.litSat_negAtom
