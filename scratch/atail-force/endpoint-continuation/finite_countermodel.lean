/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Data.Finset.Card

/-!
# Finite obstruction to an incidence-only endpoint continuation

This file gives a kernel-checked finite incidence/order model.  It retains the
structural consequences of a selected critical-row system which are available
without Euclidean/MEC geometry:

* one four-element row at every center;
* exclusion of the row center;
* pairwise row intersection at most two;
* a fixed-point-free source-to-blocker map;
* source membership in the row at its blocker;
* an injective cyclic boundary enumeration; and
* a positive-period blocker orbit contained in one contiguous cap block.

Nevertheless, every row on the exhibited three-cycle omits both endpoints of
that cap.  Thus neither endpoint spending nor a strict cross-cap exit follows
from this finite interface alone.

This is deliberately not a Euclidean realization and not a model of the full
`CounterexampleData`/`CriticalPairFrontier` hypotheses.  It isolates the first
missing geometric producer field.
-/

namespace Problem97
namespace ATailEndpointContinuation

abbrev Label := Fin 13

/-- The order-13 difference-set row design.  Every row has four elements and
two distinct rows meet in one element. -/
def row (center : Label) : Finset Label :=
  {center + 1, center + 2, center + 4, center + 8}

/-- A blocker map containing the cycle `1 -> 6 -> 2 -> 1`.  Away from the
cycle, source `s` uses `s-1`, whose difference-set row contains `s`. -/
def blocker (source : Label) : Label :=
  if source = 1 then 6
  else if source = 6 then 2
  else if source = 2 then 1
  else source - 1

/-- A global cyclic boundary enumeration. -/
def boundary : Fin 13 → Label := id

/-- The retained cap is the first twelve labels of `boundary`. -/
def cap : Finset Label :=
  {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}

def leftEndpoint : Label := 0

def rightEndpoint : Label := 11

def cycle (i : Fin 3) : Label :=
  if i = 0 then 1 else if i = 1 then 6 else 2

/-- Exact finite surface needed to test an incidence-only continuation
producer. -/
structure FiniteContinuationSurface where
  row_card_four : ∀ center, (row center).card = 4
  center_not_mem : ∀ center, center ∉ row center
  row_inter_card_le_two :
    ∀ left right, left ≠ right → ((row left) ∩ (row right)).card ≤ 2
  boundary_injective : Function.Injective boundary
  cap_is_boundary_prefix : cap =
    {boundary 0, boundary 1, boundary 2, boundary 3, boundary 4,
      boundary 5, boundary 6, boundary 7, boundary 8, boundary 9,
      boundary 10, boundary 11}
  cap_left : boundary 0 = leftEndpoint
  cap_right : boundary 11 = rightEndpoint
  blocker_ne_source : ∀ source, blocker source ≠ source
  source_mem_blocker_row : ∀ source, source ∈ row (blocker source)
  cycle_step : ∀ i, blocker (cycle i) = cycle (i + 1)
  cycle_source_mem_cap : ∀ i, cycle i ∈ cap
  cycle_blocker_mem_cap : ∀ i, blocker (cycle i) ∈ cap
  left_omitted_on_cycle : ∀ i, leftEndpoint ∉ row (blocker (cycle i))
  right_omitted_on_cycle : ∀ i, rightEndpoint ∉ row (blocker (cycle i))

/-- The finite difference-set construction satisfies the entire surface. -/
def finiteContinuationSurface : FiniteContinuationSurface where
  row_card_four := by decide
  center_not_mem := by decide
  row_inter_card_le_two := by decide
  boundary_injective := by
    intro left right h
    simpa [boundary] using h
  cap_is_boundary_prefix := rfl
  cap_left := rfl
  cap_right := rfl
  blocker_ne_source := by decide
  source_mem_blocker_row := by decide
  cycle_step := by decide
  cycle_source_mem_cap := by decide
  cycle_blocker_mem_cap := by decide
  left_omitted_on_cycle := by decide
  right_omitted_on_cycle := by decide

/-- The natural incidence-only continuation conclusion fails: on every cycle
edge neither endpoint is selected and the source/blocker pair remains in the
same cap. -/
theorem endpoint_or_cap_exit_not_forced :
    ¬ ∀ i : Fin 3,
      leftEndpoint ∈ row (blocker (cycle i)) ∨
      rightEndpoint ∈ row (blocker (cycle i)) ∨
      cycle i ∉ cap ∨ blocker (cycle i) ∉ cap := by
  decide

/-- Strong pointwise form: all three cycle edges simultaneously omit both
endpoints and stay in the retained cap. -/
theorem cycle_omits_endpoints_and_stays_in_cap :
    ∀ i : Fin 3,
      leftEndpoint ∉ row (blocker (cycle i)) ∧
      rightEndpoint ∉ row (blocker (cycle i)) ∧
      cycle i ∈ cap ∧ blocker (cycle i) ∈ cap := by
  decide

#print axioms finiteContinuationSurface
#print axioms endpoint_or_cap_exit_not_forced
#print axioms cycle_omits_endpoints_and_stays_in_cap

end ATailEndpointContinuation
end Problem97
