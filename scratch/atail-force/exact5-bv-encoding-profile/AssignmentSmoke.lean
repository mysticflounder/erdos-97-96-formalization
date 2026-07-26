import VerifiedPass5Direct
import Lean.Data.RArray

namespace Problem97.ATailExactFiveVerifiedPass5

open Std.Tactic.BVDecide

def smokeAssignment (x : Bool) (y : BitVec 4) : BVExpr.Assignment :=
  Lean.RArray.ofFn (n := 2) (fun i =>
    if i.val = 0 then ⟨BitVec.ofBool x⟩ else ⟨y⟩) (by decide)

@[simp] theorem smokeAssignment_get (x : Bool) (y : BitVec 4) (i : Fin 2) :
    (smokeAssignment x y).get i.val =
      (if i.val = 0 then ⟨BitVec.ofBool x⟩ else ⟨y⟩) := by
  exact Lean.RArray.get_ofFn _ _ i

@[simp] theorem smokeAssignment_get_zero (x : Bool) (y : BitVec 4) :
    (smokeAssignment x y).get 0 = ⟨BitVec.ofBool x⟩ := by
  simpa using smokeAssignment_get x y (0 : Fin 2)

@[simp] theorem smokeAssignment_get_one (x : Bool) (y : BitVec 4) :
    (smokeAssignment x y).get 1 = ⟨y⟩ := by
  simpa using smokeAssignment_get x y (1 : Fin 2)

example (x : Bool) (y : BitVec 4) :
    (bvar 0).eval (smokeAssignment x y) = x := by
  simp only [bvar, BVLogicalExpr.eval_literal, BVPred.eval_getLsbD,
    BVExpr.eval_var]
  rw [smokeAssignment_get_zero]
  simp

example (x : Bool) (y : BitVec 4) :
    (bveq ((.var 1 : BVExpr 4)) (.const 3#4)).eval (smokeAssignment x y) =
      (y == 3#4) := by
  simp only [bveq, BVLogicalExpr.eval_literal, BVPred.eval_bin,
    BVBinPred.eval_eq, BVExpr.eval_var, BVExpr.eval]
  rw [smokeAssignment_get_one]
  simp

def smokeTreeAssignment (x : Bool) (y : BitVec 4) : BVExpr.Assignment :=
  .branch 1 (.leaf ⟨BitVec.ofBool x⟩) (.leaf ⟨y⟩)

example (x : Bool) (y : BitVec 4) :
    (bvar 0).eval (smokeTreeAssignment x y) = x := by
  have hget : (smokeTreeAssignment x y).get 0 = ⟨BitVec.ofBool x⟩ := by
    unfold BVExpr.Assignment.get
    rw [Lean.RArray.get_eq_getImpl]
    rfl
  simp only [bvar, BVLogicalExpr.eval_literal, BVPred.eval_getLsbD,
    BVExpr.eval_var]
  rw [hget]
  simp

example (x : Bool) (y : BitVec 4) :
    (bveq ((.var 1 : BVExpr 4)) (.const 3#4)).eval (smokeTreeAssignment x y) =
      (y == 3#4) := by
  have hget : (smokeTreeAssignment x y).get 1 = ⟨y⟩ := by
    unfold BVExpr.Assignment.get
    rw [Lean.RArray.get_eq_getImpl]
    rfl
  simp only [bveq, BVLogicalExpr.eval_literal, BVPred.eval_bin,
    BVBinPred.eval_eq, BVExpr.eval_var]
  rw [hget]
  simp

end Problem97.ATailExactFiveVerifiedPass5
