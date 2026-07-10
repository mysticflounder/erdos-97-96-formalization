/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.Space
import Std.Sat.CNF

/-!
# Census-554 cover CNF (closure plan A.2 step 3)

Lean-side port of the **base** encoding of `scratch/census-554/sat_cover.py`
(`CoverInstance.__init__`): one-hot class selection per center, `C2` NAND
clauses, and `C4` Sinz sequential counters.  Variable numbering and clause
order reproduce the Python encoder exactly (same candidate enumeration
order, same `new_var()` allocation sequence, same clause emission order), so
the DIMACS rendered from `baseDimacs` is byte-identical to the Python
`dimacs()` output and the terminal UNSAT LRAT certificate replays against
`baseCnf` (plus the banked-pattern layer) via
`Std.Tactic.BVDecide.Reflect.verifyCert_correct`.

Layout of the 1-based DIMACS variables (Python `new_var()` order):

* `x` vars `1..1949`: center `p` in `0..10`, candidate index `i` in
  `candMasks p` order; `xVar p i = xOffset p + i`;
* one-hot Sinz aux `1950..3898`: one block of `candCount p` vars per center;
* `C2` allocates no vars;
* `C4` Sinz aux `3899..27286`: per pair `(a,b)` in `allPairs` order, a block
  of `2 * (incidentVars a b).length` vars, row-major `s i j = base + 2*i + j`.

Encoding validation (solver policy): the candidate counts, variable total,
clause total, and `C2` clause count are anchored below against the Python
ground truth (`base_nvars = 27286`, `base_nclauses = 207969`,
`n_c2_clauses = 143883`).
-/

namespace Problem97
namespace Census554
namespace CoverCnf

/-- `k`-element combinations of a list in `itertools.combinations` order
(lexicographic by position). -/
def combos : Nat → List Nat → List (List Nat)
  | 0, _ => [[]]
  | _ + 1, [] => []
  | k + 1, a :: rest => ((combos k rest).map (a :: ·)) ++ combos (k + 1) rest

/-- Bitmask of a class given as a list of points `0..10`. -/
def maskOf (c : List Nat) : Nat := c.foldl (fun m b => m ||| (1 <<< b)) 0

/-- `|m1 ∩ m2|` as bitmasks over points `0..10`. -/
def interCard (m1 m2 : Nat) : Nat :=
  ((List.range 11).filter fun b => (m1 &&& m2).testBit b).length

/-- One-hit predicate on a class bitmask, exact port of
`census554_lib.onehit_ok`.  Masks: `S∖{V} = 60`, `O2∖{V} = 1537`,
`S∖{W} = 58`, `O1∖{W} = 449`. -/
def onehitOkB (p m : Nat) : Bool :=
  (p != 1 || (decide (interCard m 60 ≤ 1) && decide (interCard m 1537 ≤ 1))) &&
  (p != 2 || (decide (interCard m 58 ≤ 1) && decide (interCard m 449 ≤ 1)))

/-- Candidate class bitmasks per center, in the exact order of
`census554_lib.candidates(p)` (lex combinations of the sorted complement,
filtered by one-hit).  A nullary table so compiled evaluation computes the
enumeration once instead of once per emitted literal. -/
def candTable : List (List Nat) :=
  (List.range 11).map fun p =>
    ((combos 4 ((List.range 11).filter fun q => q != p)).map maskOf).filter
      (onehitOkB p)

/-- Candidate class bitmasks at center `p`. -/
def candMasks (p : Nat) : List Nat := candTable.getD p []

/-- Candidate counts per center (nullary, computed once). -/
def candCounts : List Nat := candTable.map List.length

def candCount (p : Nat) : Nat := candCounts.getD p 0

/-- Total number of `x` variables. -/
def nX : Nat := candCounts.sum

/-- 1-based first `x` variable of center `p`. -/
def xOffset (p : Nat) : Nat := 1 + (candCounts.take p).sum

/-- DIMACS variable of "center `p` picks candidate `i`". -/
def xVar (p i : Nat) : Nat := xOffset p + i

/-- Number of auxiliary variables `le_k_sinz` allocates for `m` inputs. -/
def sinzVarCount (m k : Nat) : Nat := if m ≤ k then 0 else k * m

/-- Sinz sequential-counter clauses for `sum xs ≤ k`, exact port of
`CNF.le_k_sinz`: auxiliary variables `s i j = base + k*i + j + 1` where
`base` is the variable count before the call; emits nothing when
`xs.length ≤ k`. -/
def sinzClauses (xs : List Nat) (k base : Nat) : List (List Int) :=
  let m := xs.length
  if m ≤ k then []
  else
    let x : Nat → Int := fun i => Int.ofNat (xs.getD i 0)
    let s : Nat → Nat → Int := fun i j => Int.ofNat (base + k * i + j + 1)
    [[-(x 0), s 0 0]] ++
    (List.range (m - 1)).flatMap fun i' =>
      let i := i' + 1
      [[-(x i), s i 0], [-(s (i - 1) 0), s i 0]] ++
      ((List.range (k - 1)).flatMap fun j' =>
        let j := j' + 1
        [[-(x i), -(s (i - 1) (j - 1)), s i j], [-(s (i - 1) j), s i j]]) ++
      [[-(x i), -(s (i - 1) (k - 1))]]

/-- First one-hot Sinz aux block base for center `p` (variable count before
that center's `le_k_sinz(xs, 1)` call). -/
def aux1Base (p : Nat) : Nat := nX + (candCounts.take p).sum

/-- One-hot layer: per center, the at-least-one clause followed by the
`≤ 1` Sinz clauses (`_build_onehot`). -/
def onehotClauses : List (List Int) :=
  (List.range 11).flatMap fun p =>
    let xs := (List.range (candCount p)).map (xVar p)
    (xs.map Int.ofNat) :: sinzClauses xs 1 (aux1Base p)

/-- Unordered center/point pairs `(a, b)`, `a < b`, in
`itertools.combinations(range(11), 2)` order. -/
def allPairs : List (Nat × Nat) :=
  (List.range 11).flatMap fun a =>
    ((List.range 11).drop (a + 1)).map fun b => (a, b)

/-- `C2` NAND clauses (`_build_c2`): for centers `p < q` and candidate
classes with `|K_p ∩ K_q| ≥ 3`, forbid picking both. -/
def c2Clauses : List (List Int) :=
  allPairs.flatMap fun pq =>
    let mp := candMasks pq.1
    let mq := candMasks pq.2
    (List.range mp.length).flatMap fun i =>
      (List.range mq.length).filterMap fun j =>
        if 2 < interCard (mp.getD i 0) (mq.getD j 0) then
          some [-(Int.ofNat (xVar pq.1 i)), -(Int.ofNat (xVar pq.2 j))]
        else none

/-- The `x` variables whose candidate class contains both `a` and `b`, in
global `(p, i)` order (`_build_c4`'s `incident[e]`). -/
def incidentVars (a b : Nat) : List Nat :=
  (List.range 11).flatMap fun p =>
    (List.range (candCount p)).filterMap fun i =>
      let m := (candMasks p).getD i 0
      if m.testBit a && m.testBit b then some (xVar p i) else none

/-- `C4` layer folded in `allPairs` order, threading the variable counter
exactly as Python's `new_var()` does: returns
`(final variable count, clauses)`. -/
def c4Fold : Nat × List (List Int) :=
  allPairs.foldl (init := (nX + nX, ([] : List (List Int))))
    fun acc pq =>
      let xs := incidentVars pq.1 pq.2
      (acc.1 + sinzVarCount xs.length 2, acc.2 ++ sinzClauses xs 2 acc.1)

def c4Clauses : List (List Int) := c4Fold.2

/-- Total DIMACS variable count of the base instance
(Python `base_nvars`). -/
def baseNumVars : Nat := c4Fold.1

/-- The base cover instance in DIMACS signed-literal form, clause order
identical to Python's `self.cnf.clauses`. -/
def baseDimacs : List (List Int) := onehotClauses ++ c2Clauses ++ c4Clauses

/-- DIMACS literal `±k` as a `Std.Sat` literal (0-indexed variable,
polarity). -/
def toLit (i : Int) : Nat × Bool := (i.natAbs - 1, decide (0 < i))

/-- The base cover instance as a `Std.Sat.CNF` formula. -/
def baseCnf : Std.Sat.CNF Nat := baseDimacs.map fun c => c.map toLit

/-- DIMACS text of the base instance; byte-identical to
`CoverInstance().dimacs()` with an empty pattern bank. -/
def dimacsString : String :=
  let lines :=
    s!"p cnf {baseNumVars} {baseDimacs.length}" ::
      baseDimacs.map fun c =>
        String.intercalate " " (c.map toString) ++ " 0"
  String.intercalate "\n" lines ++ "\n"

/-
## Encoding anchors (Python ground truth)

`[len(census554_lib.candidates(p)) for p in range(11)]`,
`CoverInstance().base_nvars / base_nclauses / n_c2_clauses`.
-/

example :
    candCounts = [210, 43, 16, 210, 210, 210, 210, 210, 210, 210, 210] := by
  native_decide

example : nX = 1949 := by native_decide

example : baseNumVars = 27286 := by native_decide

example : baseDimacs.length = 207969 := by native_decide

example : c2Clauses.length = 143883 := by native_decide

end CoverCnf
end Census554
end Problem97
