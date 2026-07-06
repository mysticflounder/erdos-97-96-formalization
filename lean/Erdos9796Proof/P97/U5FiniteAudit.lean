/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U5GlobalIncidenceBasic
import Mathlib.Data.List.FinRange
import Mathlib.Data.Nat.Bitwise

/-!
# U5 finite bounded-audit reflection

This file reflects the finite support pattern sweep from
`scripts/u5_global_pattern_sweep.py` into Lean.  It is purely finite: the labels
stand for `{p,q,t1,t2,t3,u,a0,a1}`, and the theorem checks that every q-free
four-class choice at the six q-deleted centers is killed by one of the exact
geometric prefilter shapes once the two-circle overlap proxy is imposed.
-/

namespace Problem97

/-- Labels for the bounded eight-point U5 audit support. -/
inductive U5AuditLabel where
  | p | q | t1 | t2 | t3 | u | a0 | a1
  deriving DecidableEq, Repr, Fintype

namespace U5AuditLabel

open U5AuditLabel

instance : Inhabited U5AuditLabel := ⟨p⟩

/-- The bit-mask used to encode one four-point witness class. -/
abbrev ClassMask := Nat

/-- The bit-mask used to encode the symmetric graph of forced unit-distance
edges. -/
abbrev EdgeMask := Nat

def code : U5AuditLabel → Nat
  | p => 0
  | q => 1
  | t1 => 2
  | t2 => 3
  | t3 => 4
  | u => 5
  | a0 => 6
  | a1 => 7

def labels : List U5AuditLabel := [p, q, t1, t2, t3, u, a0, a1]

def triple : List U5AuditLabel := [t1, t2, t3]

def nonTriple : List U5AuditLabel := [u, a0, a1]

def centers : List U5AuditLabel := [t1, t2, t3, u, a0, a1]

def has (B : ClassMask) (x : U5AuditLabel) : Bool :=
  B.testBit (code x)

def containsAll (B : ClassMask) (xs : List U5AuditLabel) : Bool :=
  xs.all fun x => has B x

def labelMask (L : Finset U5AuditLabel) : ClassMask :=
  labels.foldl (fun m x => if x ∈ L then m ||| ((1 : Nat) <<< code x) else m) 0

/- The following six lists are the q-free four-witness choices at the selected
centers, encoded with `p=0, q=1, t1=2, t2=3, t3=4, u=5, a0=6, a1=7`.  They are
the direct finite counterpart of `selected_choices` in
`scripts/u5_global_pattern_sweep.py`. -/
def choices : U5AuditLabel → List ClassMask
  | t1 => [57, 89, 153, 105, 169, 201, 113, 177, 209, 225, 120, 184, 216, 232, 240]
  | t2 => [53, 85, 149, 101, 165, 197, 113, 177, 209, 225, 116, 180, 212, 228, 240]
  | t3 => [45, 77, 141, 101, 165, 197, 105, 169, 201, 225, 108, 172, 204, 228, 232]
  | u => [29, 77, 141, 85, 149, 197, 89, 153, 201, 209, 92, 156, 204, 212, 216]
  | a0 => [29, 45, 141, 53, 149, 165, 57, 153, 169, 177, 60, 156, 172, 180, 184]
  | a1 => [29, 45, 77, 53, 85, 101, 57, 89, 105, 113, 60, 92, 108, 116, 120]
  | p => []
  | q => []

def choice (center : U5AuditLabel) (i : Fin 15) : ClassMask :=
  (choices center).getD i.val 0

set_option maxRecDepth 10000 in
-- Kernel enumeration over the finite label powerset.
theorem exists_choice_index_of_labelMask
    {center : U5AuditLabel} (hcenter : center ∈ centers)
    (L : Finset U5AuditLabel)
    (hcard : L.card = 4) (hq : q ∉ L) (hc : center ∉ L) :
    ∃ i : Fin 15, choice center i = labelMask L := by
  decide +revert

def classOf
    (i1 i2 i3 iu ia0 ia1 : Fin 15) :
    U5AuditLabel → ClassMask
  | t1 => choice t1 i1
  | t2 => choice t2 i2
  | t3 => choice t3 i3
  | u => choice u iu
  | a0 => choice a0 ia0
  | a1 => choice a1 ia1
  | p => 0
  | q => 0

def classContains
    (i1 i2 i3 iu ia0 ia1 : Fin 15)
    (center : U5AuditLabel) (xs : List U5AuditLabel) : Bool :=
  containsAll (classOf i1 i2 i3 iu ia0 ia1 center) xs

def overlapAtMostTwo (B C : ClassMask) : Bool :=
  decide ((labels.filter fun x => has B x && has C x).length ≤ 2)

def overlapOK (i1 i2 i3 iu ia0 ia1 : Fin 15) : Bool :=
  centers.all fun x =>
    centers.all fun y =>
      decide (x = y) ||
        overlapAtMostTwo
          (classOf i1 i2 i3 iu ia0 ia1 x)
          (classOf i1 i2 i3 iu ia0 ia1 y)

def edgeCode (a b : U5AuditLabel) : Nat :=
  8 * code a + code b

def edgeBit (a b : U5AuditLabel) : EdgeMask :=
  (1 : Nat) <<< edgeCode a b

def insertEdge (E : EdgeMask) (a b : U5AuditLabel) : EdgeMask :=
  E ||| edgeBit a b ||| edgeBit b a

def hasEdge (E : EdgeMask) (a b : U5AuditLabel) : Bool :=
  E.testBit (edgeCode a b)

def initialUnitEdges : EdgeMask :=
  [t1, t2, t3].foldl (fun E t => insertEdge E p t) 0

def addClassEdges
    (i1 i2 i3 iu ia0 ia1 : Fin 15)
    (E : EdgeMask)
    (center : U5AuditLabel) : EdgeMask :=
  let B := classOf i1 i2 i3 iu ia0 ia1 center
  if labels.any fun x => has B x && hasEdge E center x then
    labels.foldl
      (fun F x => if has B x then insertEdge F center x else F)
      E
  else
    E

def unitStep
    (i1 i2 i3 iu ia0 ia1 : Fin 15)
    (E : EdgeMask) : EdgeMask :=
  centers.foldl (fun F center => addClassEdges i1 i2 i3 iu ia0 ia1 F center) E

def unitClosure
    (i1 i2 i3 iu ia0 ia1 : Fin 15) : EdgeMask :=
  Nat.iterate (unitStep i1 i2 i3 iu ia0 ia1) 8 initialUnitEdges

def unitEdge
    (i1 i2 i3 iu ia0 ia1 : Fin 15)
    (a b : U5AuditLabel) : Bool :=
  hasEdge (unitClosure i1 i2 i3 iu ia0 ia1) a b

def unitTriangleIncompatibility (i1 i2 i3 iu ia0 ia1 : Fin 15) : Bool :=
  unitEdge i1 i2 i3 iu ia0 ia1 t1 t2 &&
  unitEdge i1 i2 i3 iu ia0 ia1 t1 t3 &&
  unitEdge i1 i2 i3 iu ia0 ia1 t2 t3

def thirdTriple (a b : U5AuditLabel) : U5AuditLabel :=
  if a = t1 then
    if b = t2 then t3 else t2
  else if a = t2 then
    if b = t1 then t3 else t1
  else
    if b = t1 then t2 else t1

def equilateralOppositeIncompatibility (i1 i2 i3 iu ia0 ia1 : Fin 15) : Bool :=
  triple.any fun a =>
    triple.any fun b =>
      decide (b ≠ a) && nonTriple.any fun x =>
        let c := thirdTriple a b
        classContains i1 i2 i3 iu ia0 ia1 a [p, b, c, x] &&
        classContains i1 i2 i3 iu ia0 ia1 b [p, a, x] &&
        classContains i1 i2 i3 iu ia0 ia1 x [p, c]

def equilateralBisectorIncompatibility (i1 i2 i3 iu ia0 ia1 : Fin 15) : Bool :=
  triple.any fun a =>
    triple.any fun b =>
      decide (b ≠ a) && nonTriple.any fun x =>
        let c := thirdTriple a b
        classContains i1 i2 i3 iu ia0 ia1 a [p, b, x] &&
        classContains i1 i2 i3 iu ia0 ia1 b [p, a, x] &&
        classContains i1 i2 i3 iu ia0 ia1 x [p, c] &&
        classContains i1 i2 i3 iu ia0 ia1 c [a, b]

def commonBisectorTripleIncompatibility (i1 i2 i3 iu ia0 ia1 : Fin 15) : Bool :=
  nonTriple.any fun x =>
    classContains i1 i2 i3 iu ia0 ia1 x [p, t1, t2, t3]

def triplePairDotsForcedEqual (i1 i2 i3 iu ia0 ia1 : Fin 15) : Bool :=
  let e01 := classContains i1 i2 i3 iu ia0 ia1 t1 [t2, t3]
  let e02 := classContains i1 i2 i3 iu ia0 ia1 t2 [t1, t3]
  let e12 := classContains i1 i2 i3 iu ia0 ia1 t3 [t1, t2]
  (e01 && e02) || (e01 && e12) || (e02 && e12)

def tripleWitnessCount
    (i1 i2 i3 iu ia0 ia1 : Fin 15) (center : U5AuditLabel) : Nat :=
  (triple.filter fun t => has (classOf i1 i2 i3 iu ia0 ia1 center) t).length

def equilateralCircumcenterIncompatibility
    (i1 i2 i3 iu ia0 ia1 : Fin 15) : Bool :=
  triplePairDotsForcedEqual i1 i2 i3 iu ia0 ia1 &&
    nonTriple.any fun x =>
      has (classOf i1 i2 i3 iu ia0 ia1 x) p &&
      decide (2 ≤ tripleWitnessCount i1 i2 i3 iu ia0 ia1 x)

def hasTripleWitness
    (i1 i2 i3 iu ia0 ia1 : Fin 15)
    (center : U5AuditLabel) : Bool :=
  triple.any fun t =>
    decide (t ≠ center) &&
      has (classOf i1 i2 i3 iu ia0 ia1 center) t

def equilateralOuterPointIncompatibility
    (i1 i2 i3 iu ia0 ia1 : Fin 15) : Bool :=
  triplePairDotsForcedEqual i1 i2 i3 iu ia0 ia1 &&
    nonTriple.any fun x =>
      triple.any fun left =>
        triple.any fun right =>
          decide (left ≠ right) &&
            let opposite := thirdTriple left right
            has (classOf i1 i2 i3 iu ia0 ia1 left) x &&
            has (classOf i1 i2 i3 iu ia0 ia1 right) x &&
            hasTripleWitness i1 i2 i3 iu ia0 ia1 left &&
            hasTripleWitness i1 i2 i3 iu ia0 ia1 right &&
            classContains i1 i2 i3 iu ia0 ia1 x [p, opposite]

def nontripleEquilateralOnPCircleIncompatibility
    (i1 i2 i3 iu ia0 ia1 : Fin 15) : Bool :=
  triple.any fun t =>
    nonTriple.any fun x =>
      classContains i1 i2 i3 iu ia0 ia1 t [p, x] &&
      classContains i1 i2 i3 iu ia0 ia1 x [p, t]

def killedByExactPrefilter
    (i1 i2 i3 iu ia0 ia1 : Fin 15) : Bool :=
  unitTriangleIncompatibility i1 i2 i3 iu ia0 ia1 ||
  nontripleEquilateralOnPCircleIncompatibility i1 i2 i3 iu ia0 ia1 ||
  equilateralOppositeIncompatibility i1 i2 i3 iu ia0 ia1 ||
  equilateralBisectorIncompatibility i1 i2 i3 iu ia0 ia1 ||
  commonBisectorTripleIncompatibility i1 i2 i3 iu ia0 ia1 ||
  equilateralCircumcenterIncompatibility i1 i2 i3 iu ia0 ia1 ||
  equilateralOuterPointIncompatibility i1 i2 i3 iu ia0 ia1

/-- Named finite-prefilter reasons, in the same priority order as
`killedByExactPrefilter` and `scripts/u5_global_pattern_sweep.py`. -/
inductive PrefilterReason where
  | unitTriangleOnPCircle
  | nontripleEquilateralOnPCircle
  | equilateralOppositePoint
  | equilateralBisector
  | commonBisectorTriple
  | equilateralCircumcenterOnPCircle
  | equilateralOuterPoint
  deriving DecidableEq, Repr

def prefilterReason (i1 i2 i3 iu ia0 ia1 : Fin 15) :
    Option PrefilterReason :=
  if unitTriangleIncompatibility i1 i2 i3 iu ia0 ia1 then
    some PrefilterReason.unitTriangleOnPCircle
  else if nontripleEquilateralOnPCircleIncompatibility i1 i2 i3 iu ia0 ia1 then
    some PrefilterReason.nontripleEquilateralOnPCircle
  else if equilateralOppositeIncompatibility i1 i2 i3 iu ia0 ia1 then
    some PrefilterReason.equilateralOppositePoint
  else if equilateralBisectorIncompatibility i1 i2 i3 iu ia0 ia1 then
    some PrefilterReason.equilateralBisector
  else if commonBisectorTripleIncompatibility i1 i2 i3 iu ia0 ia1 then
    some PrefilterReason.commonBisectorTriple
  else if equilateralCircumcenterIncompatibility i1 i2 i3 iu ia0 ia1 then
    some PrefilterReason.equilateralCircumcenterOnPCircle
  else if equilateralOuterPointIncompatibility i1 i2 i3 iu ia0 ia1 then
    some PrefilterReason.equilateralOuterPoint
  else
    none

theorem prefilterReason_isSome_of_killedByExactPrefilter
    {i1 i2 i3 iu ia0 ia1 : Fin 15}
    (hkill : killedByExactPrefilter i1 i2 i3 iu ia0 ia1 = true) :
    ∃ reason, prefilterReason i1 i2 i3 iu ia0 ia1 = some reason := by
  unfold killedByExactPrefilter at hkill
  unfold prefilterReason
  repeat split <;> simp_all

/-- One q-free selected-class choice at the six audited centers. -/
structure IndexPattern where
  i1 : Fin 15
  i2 : Fin 15
  i3 : Fin 15
  iu : Fin 15
  ia0 : Fin 15
  ia1 : Fin 15
  deriving DecidableEq, Repr, Fintype

def pairOK (c₁ : U5AuditLabel) (i₁ : Fin 15)
    (c₂ : U5AuditLabel) (i₂ : Fin 15) : Bool :=
  overlapAtMostTwo (choice c₁ i₁) (choice c₂ i₂)

def fin15 : List (Fin 15) := List.finRange 15

/-- Pruned finite pattern generator: this is the Lean counterpart of
`pattern_iterator`, including the pairwise two-circle overlap proxy. -/
def boundedIndexPatterns : List IndexPattern :=
  fin15.flatMap fun i1 =>
    fin15.flatMap fun i2 =>
      if pairOK t1 i1 t2 i2 then
        fin15.flatMap fun i3 =>
          if pairOK t1 i1 t3 i3 && pairOK t2 i2 t3 i3 then
            fin15.flatMap fun iu =>
              if pairOK t1 i1 u iu && pairOK t2 i2 u iu &&
                  pairOK t3 i3 u iu then
                fin15.flatMap fun ia0 =>
                  if pairOK t1 i1 a0 ia0 && pairOK t2 i2 a0 ia0 &&
                      pairOK t3 i3 a0 ia0 && pairOK u iu a0 ia0 then
                    fin15.flatMap fun ia1 =>
                      if pairOK t1 i1 a1 ia1 && pairOK t2 i2 a1 ia1 &&
                          pairOK t3 i3 a1 ia1 && pairOK u iu a1 ia1 &&
                          pairOK a0 ia0 a1 ia1 then
                        [{ i1, i2, i3, iu, ia0, ia1 }]
                      else
                        []
                  else
                    []
              else
                []
          else
            []
      else
        []

def patternOverlapOK (P : IndexPattern) : Bool :=
  overlapOK P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1

def patternKilled (P : IndexPattern) : Bool :=
  killedByExactPrefilter P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1

def patternReason (P : IndexPattern) : Option PrefilterReason :=
  prefilterReason P.i1 P.i2 P.i3 P.iu P.ia0 P.ia1

set_option maxHeartbeats 5000000 in
-- Native execution unfolds the concrete nested finite-audit generator with the
-- same compiler-trust profile as `bv_decide`.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
/-- The pruned finite audit has exactly the `1440` overlap-compatible patterns
reported by `scripts/u5_global_pattern_sweep.py --count`.  The recursion limit
is raised here because native reduction unfolds the concrete nested list
generator. -/
theorem boundedIndexPattern_count :
    boundedIndexPatterns.length = 1440 := by
  native_decide

set_option maxHeartbeats 5000000 in
-- Native execution checks all generated overlap-compatible audit patterns.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
/-- Sanity check: every generated pattern satisfies the global overlap predicate. -/
theorem boundedIndexPatterns_overlapOK :
    boundedIndexPatterns.all patternOverlapOK = true := by
  native_decide

set_option maxHeartbeats 5000000 in
-- Native execution checks all generated overlap-compatible audit patterns.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
/-- Native-checked finite exhaustion corresponding to the `1440 -> 0`
fixed-pattern audit. -/
theorem exact_prefilter_exhaustion :
    boundedIndexPatterns.all patternKilled = true := by
  native_decide

/-- Membership form of `boundedIndexPatterns_overlapOK`, convenient for the
real-pattern extraction layer. -/
theorem overlapOK_of_mem_boundedIndexPatterns {P : IndexPattern}
    (hP : P ∈ boundedIndexPatterns) :
    patternOverlapOK P = true :=
  List.all_eq_true.mp boundedIndexPatterns_overlapOK P hP

/-- Prefix-wise insertion into the pruned finite generator.  The real-pattern
extraction layer gets these fifteen pairwise overlap checks directly from
`U5BoundedAuditSupport.two_circle_overlap`. -/
theorem mem_boundedIndexPatterns_of_pairOK (P : IndexPattern)
    (h12 : pairOK t1 P.i1 t2 P.i2 = true)
    (h13 : pairOK t1 P.i1 t3 P.i3 = true)
    (h23 : pairOK t2 P.i2 t3 P.i3 = true)
    (h1u : pairOK t1 P.i1 u P.iu = true)
    (h2u : pairOK t2 P.i2 u P.iu = true)
    (h3u : pairOK t3 P.i3 u P.iu = true)
    (h10 : pairOK t1 P.i1 a0 P.ia0 = true)
    (h20 : pairOK t2 P.i2 a0 P.ia0 = true)
    (h30 : pairOK t3 P.i3 a0 P.ia0 = true)
    (hu0 : pairOK u P.iu a0 P.ia0 = true)
    (h11 : pairOK t1 P.i1 a1 P.ia1 = true)
    (h21 : pairOK t2 P.i2 a1 P.ia1 = true)
    (h31 : pairOK t3 P.i3 a1 P.ia1 = true)
    (hu1 : pairOK u P.iu a1 P.ia1 = true)
    (h01 : pairOK a0 P.ia0 a1 P.ia1 = true) :
    P ∈ boundedIndexPatterns := by
  rcases P with ⟨i1, i2, i3, iu, ia0, ia1⟩
  simp [boundedIndexPatterns, fin15, h12, h13, h23, h1u, h2u, h3u, h10,
    h20, h30, hu0, h11, h21, h31, hu1, h01]

/-- Membership form of `exact_prefilter_exhaustion`, convenient for the
real-pattern extraction layer. -/
theorem killed_of_mem_boundedIndexPatterns {P : IndexPattern}
    (hP : P ∈ boundedIndexPatterns) :
    patternKilled P = true :=
  List.all_eq_true.mp exact_prefilter_exhaustion P hP

theorem patternReason_isSome_of_mem_boundedIndexPatterns {P : IndexPattern}
    (hP : P ∈ boundedIndexPatterns) :
    ∃ reason, patternReason P = some reason :=
  prefilterReason_isSome_of_killedByExactPrefilter
    (killed_of_mem_boundedIndexPatterns hP)

end U5AuditLabel

end Problem97
