import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionCycle

/-!
Scratch-only finite check for the named physical C5 at the rigid221
source-heavy anchor.  This file checks only the five-point row-incidence
shadow; it does not construct a `CriticalShellSystem` or a production
physical-omission cycle.
-/

namespace Rigid221SourceHeavyC5IncidenceAudit

set_option linter.unusedSimpArgs false

abbrev Vertex := Fin 5

def u : Vertex := 0
def xu : Vertex := 1
def deleted : Vertex := 2
def v : Vertex := 3
def xv : Vertex := 4

/-- The exact named positive row traces
`u -> xu -> deleted -> v -> xv -> u`. -/
def rowMembership (source target : Vertex) : Prop :=
  target = source ∨ target = source + 1

def omissionEdge (source target : Vertex) : Prop :=
  source ≠ target ∧ ¬ rowMembership source target

def reverseMembership (source target : Vertex) : Prop :=
  rowMembership target source

def mutualOmissionEdge (source target : Vertex) : Prop :=
  omissionEdge source target ∧ omissionEdge target source

/-- Under the named C5, an omitted edge with reverse membership is exactly
one of the five reverse-C5 edges. -/
theorem omission_and_reverse_iff_reverseC5 (source target : Vertex) :
    omissionEdge source target ∧ reverseMembership source target ↔
      (source = u ∧ target = xv) ∨
      (source = xu ∧ target = u) ∨
      (source = deleted ∧ target = xu) ∨
      (source = v ∧ target = deleted) ∨
      (source = xv ∧ target = v) := by
  fin_cases source <;> fin_cases target <;>
    simp [omissionEdge, reverseMembership, rowMembership, u, xu, deleted, v, xv]

/-- Mutual omissions are exactly the two orientations of the five C5
diagonals. -/
theorem mutual_omission_iff_diagonal (source target : Vertex) :
    mutualOmissionEdge source target ↔
      (source = u ∧ target = deleted) ∨
      (source = deleted ∧ target = u) ∨
      (source = u ∧ target = v) ∨
      (source = v ∧ target = u) ∨
      (source = xu ∧ target = v) ∨
      (source = v ∧ target = xu) ∨
      (source = xu ∧ target = xv) ∨
      (source = xv ∧ target = xu) ∨
      (source = deleted ∧ target = xv) ∨
      (source = xv ∧ target = deleted) := by
  fin_cases source <;> fin_cases target <;>
    simp [mutualOmissionEdge, omissionEdge, rowMembership, u, xu, deleted, v, xv]

/- Incidence-shadow witnesses: the named row traces alone do not exclude any
of the generic production periods 2, 3, 4, or 5. -/
theorem period2_shadow :
    omissionEdge xu xv ∧ omissionEdge xv xu := by
  simp [omissionEdge, rowMembership, u, xu, deleted, v, xv]

theorem period3_shadow :
    omissionEdge u xv ∧ omissionEdge xv xu ∧ omissionEdge xu u := by
  simp [omissionEdge, rowMembership, u, xu, deleted, v, xv]

theorem period4_shadow :
    omissionEdge u deleted ∧ omissionEdge deleted xv ∧
      omissionEdge xv v ∧ omissionEdge v u := by
  simp [omissionEdge, rowMembership, u, xu, deleted, v, xv]

theorem period5_allReverse_shadow :
    omissionEdge u xv ∧ reverseMembership u xv ∧
      omissionEdge xv v ∧ reverseMembership xv v ∧
      omissionEdge v deleted ∧ reverseMembership v deleted ∧
      omissionEdge deleted xu ∧ reverseMembership deleted xu ∧
      omissionEdge xu u ∧ reverseMembership xu u := by
  simp [omissionEdge, reverseMembership, rowMembership, u, xu, deleted, v, xv]

#print axioms omission_and_reverse_iff_reverseC5
#print axioms mutual_omission_iff_diagonal
#print axioms period2_shadow
#print axioms period3_shadow
#print axioms period4_shadow
#print axioms period5_allReverse_shadow

end Rigid221SourceHeavyC5IncidenceAudit
