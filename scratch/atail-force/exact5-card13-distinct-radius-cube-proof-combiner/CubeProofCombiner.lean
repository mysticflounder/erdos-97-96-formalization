/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Tactic
import Std.Sat.CNF.Basic
import Std.Tactic.BVDecide.Reflect

/-!
# Generic cube-proof combination for `Std.Sat.CNF`

This module isolates the proof-theoretic step needed to combine a finite
`march_cu` cover with independently checked per-cube UNSAT certificates.  A
cube is a conjunction of signed literals; adding it to a root CNF means adding
one unit clause per literal.
-/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusCubeProofCombinerScratch

open Std.Sat

namespace Cube

/-- A cube is a finite conjunction of signed literals. -/
abbrev Literals (α : Type*) := List (Literal α)

/-- Evaluate every literal in a cube under one total assignment. -/
def eval (assignment : α → Bool) (cube : Literals α) : Bool :=
  cube.all fun literal => assignment literal.1 == literal.2

/-- Convert a cube into the unit clauses appended to a root CNF. -/
def unitClauses (cube : Literals α) : CNF α :=
  cube.map fun literal => [literal]

/-- Append a cube's unit clauses to the original root CNF. -/
def withCube (root : CNF α) (cube : Literals α) : CNF α :=
  root ++ unitClauses cube

/-- The unit-clause CNF evaluates exactly as the conjunction represented by
the cube. -/
@[simp] theorem eval_unitClauses (assignment : α → Bool) (cube : Literals α) :
    CNF.eval assignment (unitClauses cube) = eval assignment cube := by
  simp [unitClauses, eval, CNF.eval, CNF.Clause.eval, Function.comp_def]

/-- Evaluation after adding a cube is root satisfaction conjoined with cube
satisfaction. -/
@[simp] theorem eval_withCube (assignment : α → Bool)
    (root : CNF α) (cube : Literals α) :
    CNF.eval assignment (withCube root cube) =
      (CNF.eval assignment root && eval assignment cube) := by
  simp [withCube]

/-- A finite cube list is exhaustive when every total assignment satisfies at
least one listed cube. -/
def Exhaustive (cubes : List (Literals α)) : Prop :=
  ∀ assignment : α → Bool,
    ∃ cube ∈ cubes, eval assignment cube = true

/-- Negate every literal of a cube.  As a clause, this is the Boolean
complement of the cube conjunction. -/
def blockingClause (cube : Literals α) : CNF.Clause α :=
  cube.map fun literal => (literal.1, !literal.2)

/-- The conjunction of all negated-cube clauses.  It is satisfiable exactly
when some assignment is missed by every cube. -/
def blockingCNF (cubes : List (Literals α)) : CNF α :=
  cubes.map blockingClause

@[simp] theorem eval_blockingClause (assignment : α → Bool)
    (cube : Literals α) :
    CNF.Clause.eval assignment (blockingClause cube) = !eval assignment cube := by
  induction cube with
  | nil => rfl
  | cons literal cube ih =>
      change
        ((assignment literal.1 == !literal.2) ||
          CNF.Clause.eval assignment (blockingClause cube)) =
        !((assignment literal.1 == literal.2) && eval assignment cube)
      rw [ih]
      cases assignment literal.1 <;> cases literal.2 <;>
        cases eval assignment cube <;> rfl

@[simp] theorem eval_blockingCNF (assignment : α → Bool)
    (cubes : List (Literals α)) :
    CNF.eval assignment (blockingCNF cubes) =
      cubes.all fun cube => !eval assignment cube := by
  simp [blockingCNF, CNF.eval, Function.comp_def]

/-- A checked UNSAT certificate for the blocking CNF is an exhaustiveness
certificate for the cube list. -/
theorem exhaustive_of_blockingCNF_unsat
    {cubes : List (Literals α)}
    (hblocking : CNF.Unsat (blockingCNF cubes)) :
    Exhaustive cubes := by
  intro assignment
  have hfalse := hblocking assignment
  rw [eval_blockingCNF, List.all_eq_false] at hfalse
  obtain ⟨cube, hcubeMem, hnotMissed⟩ := hfalse
  refine ⟨cube, hcubeMem, ?_⟩
  by_contra hcubeFalse
  have hevalFalse : eval assignment cube = false :=
    Bool.eq_false_of_not_eq_true hcubeFalse
  simp [hevalFalse] at hnotMissed

end Cube

/-- UNSAT is monotone under adding clauses.  This is the adapter needed when a
per-cube LRAT endpoint proves an UNSAT kept-CNF whose clauses are all present
in the full root-plus-units CNF. -/
theorem CNF.Unsat.of_clause_subset
    {small large : CNF α}
    (hsmall : CNF.Unsat small)
    (hsubset : ∀ clause, clause ∈ small → clause ∈ large) :
    CNF.Unsat large := by
  intro assignment
  by_cases hlarge : CNF.eval assignment large = true
  · have hlargeClauses :
        ∀ clause ∈ large, CNF.Clause.eval assignment clause = true := by
      simpa only [CNF.eval, List.all_eq_true] using hlarge
    have hsmallEval : CNF.eval assignment small = true := by
      rw [CNF.eval, List.all_eq_true]
      intro clause hclause
      exact hlargeClauses clause (hsubset clause hclause)
    rw [hsmall assignment] at hsmallEval
    contradiction
  · exact Bool.eq_false_of_not_eq_true hlarge

/-- Combine an exhaustive finite cube cover with one UNSAT proof for every
root-plus-cube formula. -/
theorem unsat_of_exhaustive_cubes
    (root : CNF α) (cubes : List (Cube.Literals α))
    (hexhaustive : Cube.Exhaustive cubes)
    (hcubeUnsat : ∀ cube, cube ∈ cubes →
      CNF.Unsat (Cube.withCube root cube)) :
    CNF.Unsat root := by
  intro assignment
  obtain ⟨cube, hcubeMem, hcubeTrue⟩ := hexhaustive assignment
  have haugmentedFalse := hcubeUnsat cube hcubeMem assignment
  cases hroot : CNF.eval assignment root
  · rfl
  · have haugmentedTrue :
        CNF.eval assignment (Cube.withCube root cube) = true := by
      simp [hroot, hcubeTrue]
    rw [haugmentedFalse] at haugmentedTrue
    contradiction

/-- A bundled form convenient for generated manifest coordinators. -/
structure CubeProofBundle (root : CNF α)
    (cubes : List (Cube.Literals α)) : Prop where
  exhaustive : Cube.Exhaustive cubes
  cubeUnsat : ∀ cube, cube ∈ cubes →
    CNF.Unsat (Cube.withCube root cube)

theorem CubeProofBundle.root_unsat
    {root : CNF α} {cubes : List (Cube.Literals α)}
    (bundle : CubeProofBundle root cubes) :
    CNF.Unsat root :=
  unsat_of_exhaustive_cubes root cubes bundle.exhaustive bundle.cubeUnsat

/-- Lift UNSAT of the exact CNF produced by Lean's verified
`BVLogicalExpr → AIG → CNF` compiler back to source-expression UNSAT.  Cube
variables may include arbitrary internal AIG/Tseitin variables because this
theorem is applied only after the whole compiled root CNF has been proved
UNSAT. -/
theorem BVLogicalExpr.unsat_of_compiledCnf_unsat
    (expression : Std.Tactic.BVDecide.BVLogicalExpr)
    (hcnf : CNF.Unsat
      (Std.Sat.AIG.toCNF expression.bitblast.relabelNat)) :
    expression.Unsat := by
  have hbitblast : expression.bitblast.Unsat := by
    rw [← Std.Sat.AIG.Entrypoint.relabelNat_unsat_iff]
    exact (Std.Sat.AIG.toCNF_equisat
      expression.bitblast.relabelNat).mp hcnf
  exact Std.Tactic.BVDecide.BVLogicalExpr.unsat_of_bitblast
    expression hbitblast

/-! ## Toy checked instance -/

namespace Toy

abbrev Var := Fin 2

def x : Var := 0
def y : Var := 1

/-- All four sign combinations on two variables.  Their conjunction is
UNSAT; the toy cover branches only on `x`. -/
def root : CNF Var :=
  [ [(x, true), (y, true)],
    [(x, false), (y, true)],
    [(x, true), (y, false)],
    [(x, false), (y, false)] ]

def xTrue : Cube.Literals Var := [(x, true)]
def xFalse : Cube.Literals Var := [(x, false)]
def cubes : List (Cube.Literals Var) := [xTrue, xFalse]

theorem blockingCNF_unsat : CNF.Unsat (Cube.blockingCNF cubes) := by
  intro assignment
  cases hx : assignment x <;>
    simp [Cube.blockingCNF, Cube.blockingClause, cubes, xTrue, xFalse,
      CNF.eval, CNF.Clause.eval, hx]

theorem cubes_exhaustive : Cube.Exhaustive cubes :=
  Cube.exhaustive_of_blockingCNF_unsat blockingCNF_unsat

theorem root_with_xTrue_unsat :
    CNF.Unsat (Cube.withCube root xTrue) := by
  intro assignment
  cases hx : assignment x <;> cases hy : assignment y <;>
    simp [Cube.withCube, Cube.unitClauses, root, xTrue,
      CNF.eval, CNF.Clause.eval, hx, hy]

theorem root_with_xFalse_unsat :
    CNF.Unsat (Cube.withCube root xFalse) := by
  intro assignment
  cases hx : assignment x <;> cases hy : assignment y <;>
    simp [Cube.withCube, Cube.unitClauses, root, xFalse,
      CNF.eval, CNF.Clause.eval, hx, hy]

theorem each_cube_unsat :
    ∀ cube, cube ∈ cubes → CNF.Unsat (Cube.withCube root cube) := by
  intro cube hcube
  simp [cubes] at hcube
  rcases hcube with rfl | rfl
  · exact root_with_xTrue_unsat
  · exact root_with_xFalse_unsat

/-- End-to-end smoke test of the generic combiner. -/
theorem root_unsat : CNF.Unsat root :=
  unsat_of_exhaustive_cubes root cubes cubes_exhaustive each_cube_unsat

end Toy

#print axioms Cube.eval_unitClauses
#print axioms Cube.eval_withCube
#print axioms Cube.eval_blockingClause
#print axioms Cube.eval_blockingCNF
#print axioms Cube.exhaustive_of_blockingCNF_unsat
#print axioms CNF.Unsat.of_clause_subset
#print axioms unsat_of_exhaustive_cubes
#print axioms CubeProofBundle.root_unsat
#print axioms BVLogicalExpr.unsat_of_compiledCnf_unsat
#print axioms Toy.cubes_exhaustive
#print axioms Toy.blockingCNF_unsat
#print axioms Toy.root_with_xTrue_unsat
#print axioms Toy.root_with_xFalse_unsat
#print axioms Toy.root_unsat

end ATailExactFiveCard13DistinctRadiusCubeProofCombinerScratch
end Problem97
