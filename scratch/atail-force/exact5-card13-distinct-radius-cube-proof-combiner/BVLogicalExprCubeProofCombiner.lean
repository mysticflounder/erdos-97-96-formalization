/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Std.Tactic.BVDecide.Reflect

/-!
# Source-expression cube proof combination

This is the portable cube boundary for verified `BVLogicalExpr` compilation.
A cube is expressed in source-level Boolean formulas, so each leaf may be
compiled and LRAT-checked independently.  No theorem assumes that bit-blast
variable indices are stable between the root and its leaves.
-/

namespace Problem97
namespace ATailExactFiveDistinctAggregateBVLogicalExprCubeProofCombinerScratch

open Std.Tactic.BVDecide

namespace SourceCube

/-- A signed source-level Boolean expression. -/
abbrev Literal := BVLogicalExpr × Bool

/-- A source cube is a conjunction of signed source expressions. -/
abbrev Literals := List Literal

def evalLiteral (assignment : BVExpr.Assignment) (literal : Literal) : Bool :=
  literal.1.eval assignment == literal.2

def eval (assignment : BVExpr.Assignment) (cube : Literals) : Bool :=
  cube.all (evalLiteral assignment)

def literalExpr (literal : Literal) : BVLogicalExpr :=
  if literal.2 then literal.1 else .not literal.1

def expr : Literals → BVLogicalExpr
  | [] => .const true
  | literal :: cube => .gate .and (literalExpr literal) (expr cube)

@[simp] theorem eval_literalExpr
    (assignment : BVExpr.Assignment) (literal : Literal) :
    (literalExpr literal).eval assignment = evalLiteral assignment literal := by
  rcases literal with ⟨expression, polarity⟩
  cases hvalue : expression.eval assignment <;> cases polarity <;>
    simp [literalExpr, evalLiteral, hvalue]

@[simp] theorem eval_expr
    (assignment : BVExpr.Assignment) (cube : Literals) :
    (expr cube).eval assignment = eval assignment cube := by
  induction cube with
  | nil => rfl
  | cons literal cube ih =>
      simp [expr, eval, ih, Gate.eval]

/-- Every assignment satisfies at least one source-level cube. -/
def Exhaustive (cubes : List Literals) : Prop :=
  ∀ assignment : BVExpr.Assignment,
    ∃ cube ∈ cubes, eval assignment cube = true

/-- The complete signed truth-table split on an ordered source-expression
list.  For nine expressions this constructs exactly 512 portable cubes. -/
def fullTruthTable : List BVLogicalExpr → List Literals
  | [] => [[]]
  | expression :: expressions =>
      (fullTruthTable expressions).map ((expression, true) :: ·) ++
      (fullTruthTable expressions).map ((expression, false) :: ·)

/-- The same complete truth-table split with the false branch first.  The
exact-five source-core bank numbers its nine-bit leaves from all-false at
`000` to all-true at `511`, so this order makes the generated leaf number a
structural list position rather than an external convention. -/
def fullTruthTableFalseFirst : List BVLogicalExpr → List Literals
  | [] => [[]]
  | expression :: expressions =>
      (fullTruthTableFalseFirst expressions).map ((expression, false) :: ·) ++
      (fullTruthTableFalseFirst expressions).map ((expression, true) :: ·)

@[simp] theorem length_fullTruthTable (expressions : List BVLogicalExpr) :
    (fullTruthTable expressions).length = 2 ^ expressions.length := by
  induction expressions with
  | nil => rfl
  | cons expression expressions ih =>
      simp [fullTruthTable, ih, Nat.pow_succ, Nat.mul_two]

@[simp] theorem length_fullTruthTableFalseFirst
    (expressions : List BVLogicalExpr) :
    (fullTruthTableFalseFirst expressions).length = 2 ^ expressions.length := by
  induction expressions with
  | nil => rfl
  | cons expression expressions ih =>
      simp [fullTruthTableFalseFirst, ih, Nat.pow_succ, Nat.mul_two]

/-- The recursive full truth table is exhaustive by construction; no SAT-side
blocking-CNF certificate or manual enumeration proof is needed. -/
theorem exhaustive_fullTruthTable (expressions : List BVLogicalExpr) :
    Exhaustive (fullTruthTable expressions) := by
  intro assignment
  induction expressions with
  | nil =>
      exact ⟨[], by simp [fullTruthTable], rfl⟩
  | cons expression expressions ih =>
      obtain ⟨cube, hcubeMem, hcubeTrue⟩ := ih
      cases hvalue : expression.eval assignment
      · refine ⟨(expression, false) :: cube, ?_, ?_⟩
        · simp [fullTruthTable, hcubeMem]
        · change
            (evalLiteral assignment (expression, false) &&
              eval assignment cube) = true
          simp [evalLiteral, hvalue, hcubeTrue]
      · refine ⟨(expression, true) :: cube, ?_, ?_⟩
        · simp [fullTruthTable, hcubeMem]
        · change
            (evalLiteral assignment (expression, true) &&
              eval assignment cube) = true
          simp [evalLiteral, hvalue, hcubeTrue]

/-- False-first enumeration is exhaustive for the same structural reason as
`fullTruthTable`; the proof does not inspect or trust generated leaf data. -/
theorem exhaustive_fullTruthTableFalseFirst (expressions : List BVLogicalExpr) :
    Exhaustive (fullTruthTableFalseFirst expressions) := by
  intro assignment
  induction expressions with
  | nil =>
      exact ⟨[], by simp [fullTruthTableFalseFirst], rfl⟩
  | cons expression expressions ih =>
      obtain ⟨cube, hcubeMem, hcubeTrue⟩ := ih
      cases hvalue : expression.eval assignment
      · refine ⟨(expression, false) :: cube, ?_, ?_⟩
        · simp [fullTruthTableFalseFirst, hcubeMem]
        · change
            (evalLiteral assignment (expression, false) &&
              eval assignment cube) = true
          simp [evalLiteral, hvalue, hcubeTrue]
      · refine ⟨(expression, true) :: cube, ?_, ?_⟩
        · simp [fullTruthTableFalseFirst, hcubeMem]
        · change
            (evalLiteral assignment (expression, true) &&
              eval assignment cube) = true
          simp [evalLiteral, hvalue, hcubeTrue]

end SourceCube

/-! ## Assertion-index core bridge -/

namespace SourceAssertions

/-- The Boolean conjunction of an ordered list of source assertions.  The
empty list denotes `true`, matching the identity used by the split generator.
-/
def conjunction : List BVLogicalExpr → BVLogicalExpr
  | [] => .const true
  | assertion :: assertions =>
      .gate .and assertion (conjunction assertions)

@[simp] theorem eval_conjunction
    (assignment : BVExpr.Assignment) (assertions : List BVLogicalExpr) :
    (conjunction assertions).eval assignment =
      assertions.all (fun assertion => assertion.eval assignment) := by
  induction assertions with
  | nil => rfl
  | cons assertion assertions ih =>
      simp [conjunction, Gate.eval, ih]

/-- A true list conjunction makes any assertion selected by a bounded source
index true.  Generated core adapters use this theorem twice: once to descend
from the outer chunk list to a chunk and once from that chunk to an original
assertion. -/
theorem eval_get_eq_true_of_conjunction_eq_true
    (assignment : BVExpr.Assignment) (assertions : List BVLogicalExpr)
    (index : Fin assertions.length)
    (hconjunction : (conjunction assertions).eval assignment = true) :
    (assertions.get index).eval assignment = true := by
  rw [eval_conjunction] at hconjunction
  exact List.all_eq_true.mp hconjunction _ (List.get_mem assertions index)

/-- A stable index into the split generator's two-level assertion hierarchy.
The first component names one bounded source chunk; the second names one
original assertion inside that chunk. -/
structure ChunkedIndex (chunks : List (List BVLogicalExpr)) where
  chunk : Fin chunks.length
  offset : Fin (chunks.get chunk).length

def chunkedConjunction
    (chunks : List (List BVLogicalExpr)) : BVLogicalExpr :=
  conjunction (chunks.map conjunction)

def getChunked
    (chunks : List (List BVLogicalExpr))
    (index : ChunkedIndex chunks) : BVLogicalExpr :=
  (chunks.get index.chunk).get index.offset

/-- Project one original assertion from a true two-level split source.  Its
proof traverses only the outer chunk list and one bounded chunk, rather than a
flattened list containing all source assertions. -/
theorem eval_getChunked_eq_true_of_chunkedConjunction_eq_true
    (assignment : BVExpr.Assignment)
    (chunks : List (List BVLogicalExpr))
    (index : ChunkedIndex chunks)
    (hsource : (chunkedConjunction chunks).eval assignment = true) :
    (getChunked chunks index).eval assignment = true := by
  let chunkIndex : Fin (chunks.map conjunction).length :=
    ⟨index.chunk.val, by
      simpa only [List.length_map] using index.chunk.isLt⟩
  have hchunkMapped :=
    eval_get_eq_true_of_conjunction_eq_true assignment
      (chunks.map conjunction) chunkIndex hsource
  have hchunk :
      (conjunction (chunks.get index.chunk)).eval assignment = true := by
    simpa [chunkIndex] using hchunkMapped
  exact eval_get_eq_true_of_conjunction_eq_true assignment
    (chunks.get index.chunk) index.offset hchunk

/-- Every assertion in `core` follows semantically from the complete source.
For generated index cores, this proposition has a tiny proof consisting only
of bounded `List.get` projections through the two-level chunk hierarchy. -/
def ImpliesCore (source : BVLogicalExpr) (core : List BVLogicalExpr) : Prop :=
  ∀ assignment, source.eval assignment = true →
    ∀ index : Fin core.length,
      (core.get index).eval assignment = true

/-- Selecting a finite list of two-level source indices automatically gives a
core implied by the full chunked conjunction.  Generated adapters therefore
need only emit data, not one proof branch per selected assertion. -/
theorem chunkedConjunction_impliesCore
    (chunks : List (List BVLogicalExpr))
    (indices : List (ChunkedIndex chunks)) :
    ImpliesCore (chunkedConjunction chunks)
      (indices.map (getChunked chunks)) := by
  intro assignment hsource index
  have hmember := List.get_mem (indices.map (getChunked chunks)) index
  rw [List.mem_map] at hmember
  obtain ⟨selected, _hselected, hget⟩ := hmember
  rw [← hget]
  exact eval_getChunked_eq_true_of_chunkedConjunction_eq_true
    assignment chunks selected hsource

/-- The flat-list analogue used by a reduced union of all checked leaf cores.
Each leaf supplies only positions in the union list; the subset implication is
then generic and independent of the number or size of recovered cores. -/
theorem conjunction_impliesCore_get
    (assertions : List BVLogicalExpr)
    (indices : List (Fin assertions.length)) :
    ImpliesCore (conjunction assertions)
      (indices.map assertions.get) := by
  intro assignment hsource index
  have hmember := List.get_mem (indices.map assertions.get) index
  rw [List.mem_map] at hmember
  obtain ⟨selected, _hselected, hget⟩ := hmember
  rw [← hget]
  exact eval_get_eq_true_of_conjunction_eq_true
    assignment assertions selected hsource

theorem eval_conjunction_eq_true_of_impliesCore
    {source : BVLogicalExpr} {core : List BVLogicalExpr}
    (himplies : ImpliesCore source core)
    (assignment : BVExpr.Assignment)
    (hsource : source.eval assignment = true) :
    (conjunction core).eval assignment = true := by
  rw [eval_conjunction, List.all_eq_true]
  intro assertion hassertion
  obtain ⟨index, hindex⟩ := List.get_of_mem hassertion
  rw [← hindex]
  exact himplies assignment hsource index

/-- Replace a complete source formula by an implied assertion-index core in a
cube leaf.  Thus an LRAT-checked UNSAT proof for `cube ∧ core` proves UNSAT of
the corresponding `cube ∧ source` branch without compiling the full source
CNF. -/
theorem unsat_of_core_unsat
    (source cube : BVLogicalExpr) (core : List BVLogicalExpr)
    (himplies : ImpliesCore source core)
    (hcoreUnsat :
      BVLogicalExpr.Unsat (.gate .and cube (conjunction core))) :
    BVLogicalExpr.Unsat (.gate .and cube source) := by
  intro assignment
  cases hcube : cube.eval assignment
  · simp [Gate.eval, hcube]
  · cases hsource : source.eval assignment
    · simp [Gate.eval, hcube, hsource]
    · have hcore :=
        eval_conjunction_eq_true_of_impliesCore
          himplies assignment hsource
      have hcoreFalse := hcoreUnsat assignment
      simp [Gate.eval, hcube, hcore] at hcoreFalse

/-- The source-first orientation expected by
`unsat_of_exhaustive_source_cubes`. -/
theorem unsat_source_and_cube_of_core_unsat
    (source cube : BVLogicalExpr) (core : List BVLogicalExpr)
    (himplies : ImpliesCore source core)
    (hcoreUnsat :
      BVLogicalExpr.Unsat (.gate .and cube (conjunction core))) :
    BVLogicalExpr.Unsat (.gate .and source cube) := by
  intro assignment
  have hswapped :=
    unsat_of_core_unsat source cube core himplies hcoreUnsat assignment
  simpa [Gate.eval, Bool.and_comm] using hswapped

end SourceAssertions

/-- Combine a source-semantic cube cover with independently compiled UNSAT
leaf expressions.  Each leaf is `source ∧ cubeExpr`; there is deliberately no
relationship asserted between the root CNF's auxiliary variables and any
leaf CNF's auxiliary variables. -/
theorem unsat_of_exhaustive_source_cubes
    (source : BVLogicalExpr) (cubes : List SourceCube.Literals)
    (hexhaustive : SourceCube.Exhaustive cubes)
    (hleafUnsat : ∀ cube, cube ∈ cubes →
      BVLogicalExpr.Unsat (.gate .and source (SourceCube.expr cube))) :
    BVLogicalExpr.Unsat source := by
  intro assignment
  obtain ⟨cube, hcubeMem, hcubeTrue⟩ := hexhaustive assignment
  have hleafFalse := hleafUnsat cube hcubeMem assignment
  simpa [Gate.eval, hcubeTrue] using hleafFalse

structure SourceCubeProofBundle
    (source : BVLogicalExpr) (cubes : List SourceCube.Literals) : Prop where
  exhaustive : SourceCube.Exhaustive cubes
  leafUnsat : ∀ cube, cube ∈ cubes →
    BVLogicalExpr.Unsat (.gate .and source (SourceCube.expr cube))

theorem SourceCubeProofBundle.source_unsat
    {source : BVLogicalExpr} {cubes : List SourceCube.Literals}
    (bundle : SourceCubeProofBundle source cubes) :
    BVLogicalExpr.Unsat source :=
  unsat_of_exhaustive_source_cubes source cubes
    bundle.exhaustive bundle.leafUnsat

/-! ## Toy source-level split -/

namespace Toy

def x : BVLogicalExpr := .literal (.getLsbD (.var 0 : BVExpr 1) 0)
def contradiction : BVLogicalExpr := .gate .and x (.not x)

def xTrue : SourceCube.Literals := [(x, true)]
def xFalse : SourceCube.Literals := [(x, false)]
def cubes : List SourceCube.Literals := SourceCube.fullTruthTable [x]

theorem cubes_eq : cubes = [xTrue, xFalse] := rfl

theorem cubes_exhaustive : SourceCube.Exhaustive cubes :=
  SourceCube.exhaustive_fullTruthTable [x]

theorem each_leaf_unsat : ∀ cube, cube ∈ cubes →
    BVLogicalExpr.Unsat (.gate .and contradiction (SourceCube.expr cube)) := by
  intro cube hcube assignment
  rw [cubes_eq] at hcube
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hcube
  rcases hcube with rfl | rfl
  · cases hx : x.eval assignment <;>
      simp [contradiction, SourceCube.expr, SourceCube.literalExpr, xTrue,
        Gate.eval, hx]
  · cases hx : x.eval assignment <;>
      simp [contradiction, SourceCube.expr, SourceCube.literalExpr, xFalse,
        Gate.eval, hx]

theorem contradiction_unsat : BVLogicalExpr.Unsat contradiction :=
  unsat_of_exhaustive_source_cubes contradiction cubes
    cubes_exhaustive each_leaf_unsat

end Toy

#print axioms SourceCube.eval_literalExpr
#print axioms SourceCube.eval_expr
#print axioms SourceCube.length_fullTruthTable
#print axioms SourceCube.exhaustive_fullTruthTable
#print axioms SourceCube.length_fullTruthTableFalseFirst
#print axioms SourceCube.exhaustive_fullTruthTableFalseFirst
#print axioms SourceAssertions.eval_conjunction
#print axioms SourceAssertions.eval_get_eq_true_of_conjunction_eq_true
#print axioms SourceAssertions.eval_getChunked_eq_true_of_chunkedConjunction_eq_true
#print axioms SourceAssertions.chunkedConjunction_impliesCore
#print axioms SourceAssertions.conjunction_impliesCore_get
#print axioms SourceAssertions.eval_conjunction_eq_true_of_impliesCore
#print axioms SourceAssertions.unsat_of_core_unsat
#print axioms SourceAssertions.unsat_source_and_cube_of_core_unsat
#print axioms unsat_of_exhaustive_source_cubes
#print axioms SourceCubeProofBundle.source_unsat
#print axioms Toy.cubes_exhaustive
#print axioms Toy.each_leaf_unsat
#print axioms Toy.contradiction_unsat

end ATailExactFiveDistinctAggregateBVLogicalExprCubeProofCombinerScratch
end Problem97
