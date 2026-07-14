/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# ATAIL Stage-I one-hit incidence countermodel

This file kernel-checks the exact finite incidence content of the post-arc
`(5,5,5)` round-19 shadow.  It is deliberately narrower than the live
geometric theorem: it does **not** construct a `CounterexampleData`, Euclidean
coordinates, a minimum enclosing circle, or cap geometry.

The point of the model is a sharp dependency audit.  Even after strengthening
the pair interface so that all five supplied rows come from one common
source-indexed system, the following fields coexist:

* the dangerous four-set is the common row for all four dangerous sources;
* the critical row for `p` is centered at a dangerous point `A` and contains
  another dangerous point `C`;
* the supplied `u` row is centered at another dangerous point `D`; and
* that `u` row has only the single dangerous hit `A`.

Thus common provenance, exact support cardinality, source membership,
same-center support rigidity, and the two-circle intersection upper bound do
not force the second dangerous hit.  Any live proof of that hit must visibly
use geometric data omitted by this incidence abstraction (or produce an
already-consumed alternate).
-/

namespace Problem97
namespace ATAILStageOneIncidenceCountermodel

/-- The exact source-indexed incidence consequences retained from a critical
shell system, together with the Euclidean two-circle overlap upper bound. -/
structure CommonCriticalIncidenceShadow (α : Type*) [DecidableEq α] where
  centerOf : α → α
  supportOf : α → Finset α
  support_card_four : ∀ source, (supportOf source).card = 4
  source_mem : ∀ source, source ∈ supportOf source
  center_not_mem : ∀ source, centerOf source ∉ supportOf source
  same_center_support_eq :
    ∀ source₁ source₂,
      centerOf source₁ = centerOf source₂ →
        supportOf source₁ = supportOf source₂
  distinct_center_inter_card_le_two :
    ∀ source₁ source₂,
      centerOf source₁ ≠ centerOf source₂ →
        ((supportOf source₁) ∩ (supportOf source₂)).card ≤ 2

abbrev Label := Fin 12

def p : Label := 0
def A : Label := 1
def C : Label := 2
def Dcenter : Label := 3
def E : Label := 4
def u : Label := 5

def q : Label := Dcenter
def t1 : Label := C
def t2 : Label := A
def t3 : Label := E

def dangerousBase : Finset Label := {q, t1, t2, t3}

def rowAtP : Finset Label := {A, C, Dcenter, E}
def rowAtA : Finset Label := {p, C, 6, 7}
def rowAtC : Finset Label := {Dcenter, 8, 9, 10}
def rowAtD : Finset Label := {A, u, 6, 8}
def rowAtE : Finset Label := {p, u, 9, 11}

/-- The blocker-center assignment in the exact round-19 incidence shadow. -/
def centerOf : Label → Label :=
  ![A, p, p, p, p, Dcenter, A, A, C, C, C, E]

/-- Same-center rows share one support by construction. -/
def supportAtCenter (center : Label) : Finset Label :=
  if center = p then rowAtP
  else if center = A then rowAtA
  else if center = C then rowAtC
  else if center = Dcenter then rowAtD
  else rowAtE

def supportOf (source : Label) : Finset Label :=
  supportAtCenter (centerOf source)

/-- Kernel-checked finite model of the common-system incidence abstraction. -/
def round19Shadow : CommonCriticalIncidenceShadow Label where
  centerOf := centerOf
  supportOf := supportOf
  support_card_four := by decide
  source_mem := by decide
  center_not_mem := by decide
  same_center_support_eq := by decide
  distinct_center_inter_card_le_two := by decide

/-- The four dangerous labels are exactly the common support of their supplied
rows, and all five supplied rows can be taken from this one system. -/
theorem supplied_rows_have_common_provenance :
    (∀ source ∈ ({q, t1, t2, t3} : Finset Label),
      centerOf source = p ∧ supportOf source = dangerousBase) ∧
    centerOf u = Dcenter ∧ supportOf u = rowAtD := by
  decide

/-- Stage I is aligned at the `p`-critical row and at the `u`-row center, but
the `u` row has only one dangerous hit. -/
theorem aligned_rows_with_exactly_one_uRow_hit :
    dangerousBase.card = 4 ∧
    centerOf p = A ∧
    C ∈ supportOf p ∧
    centerOf u = Dcenter ∧
    A ∈ supportOf u ∧
    (supportOf u ∩ dangerousBase).card = 1 ∧
    E ∉ supportOf u := by
  decide

/-- The desired lower bound is false in the strengthened common-provenance
incidence abstraction. -/
theorem not_two_le_uRow_inter_dangerousBase :
    ¬ 2 ≤ (supportOf u ∩ dangerousBase).card := by
  decide

/-- Equivalently, there is no second dangerous support member distinct from
the already-aligned point `A`. -/
theorem no_second_dangerous_support_member :
    ¬ ∃ z : Label,
      z ∈ dangerousBase ∧ z ≠ A ∧ z ∈ supportOf u := by
  decide

#print axioms supplied_rows_have_common_provenance
#print axioms aligned_rows_with_exactly_one_uRow_hit
#print axioms not_two_le_uRow_inter_dangerousBase
#print axioms no_second_dangerous_support_member

end ATAILStageOneIncidenceCountermodel
end Problem97
