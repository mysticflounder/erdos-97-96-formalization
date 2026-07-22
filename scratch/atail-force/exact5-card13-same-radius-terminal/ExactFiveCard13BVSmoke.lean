/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Tactic

/-!
# Small bitvector-reflection smoke gate for the exact-five ordinal circuit

This file tests the precise equality-plus-strict-rank cancellation primitive
used by the proposed card-13 source circuit.  It is intentionally tiny: the
purpose is to measure the local `bv_decide` path before generating the full
source circuit.
-/

namespace Problem97.ATailExactFiveCard13BVSmoke

def cancellationAntecedent (left right : BitVec 7) : Bool :=
  (left == right) && right.ult left

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cancellationAntecedent_false (left right : BitVec 7) :
    cancellationAntecedent left right = false := by
  unfold cancellationAntecedent
  bv_decide

#print axioms cancellationAntecedent_false

end Problem97.ATailExactFiveCard13BVSmoke
