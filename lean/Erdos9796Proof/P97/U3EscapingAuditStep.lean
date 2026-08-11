/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U3ToU5Terminal

/-!
# Provenance-preserving U3 audit escape steps

The older escaping-frame disjunction remembers only that the distinguished
point of some next frame lies outside the current bounded support.  That is too
weak for iteration: it forgets both that the next frame is the canonical
rolling-window shift and which actual q-deleted row or critical shell supplied
the escaping point.

`U3EscapingAuditStep` retains exactly this source data.  The theorem below is a
one-step source theorem only.  It does not assert that repeated steps terminate
or that a finite orbit is acyclic.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- One source-faithful escape from a fixed-triple audit frame.

Both constructors retain the actual audit center and source row, the escaping
point in that row, its selected/off-dangerous-circle facts, and make the target
definitionally equal to `shiftOfEscape`. -/
inductive U3EscapingAuditStep
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²} :
    U3FixedTripleAuditFrame D q p t1 t2 t3 →
      U3FixedTripleAuditFrame D q p t1 t2 t3 → Prop
  | qDeleted
      (F : U3FixedTripleAuditFrame D q p t1 t2 t3)
      (center : ℝ²)
      (hcenter : center ∈ U5BoundedAuditCenters D q p
        ({t1, t2, t3} : Finset ℝ²) F.u F.a0 F.a1)
      (B : Finset ℝ²)
      (K : U5QDeletedK4Class D q center B)
      (hcard : B.card = 4)
      (y : ℝ²)
      (hyB : y ∈ B)
      (hy : U5SelectedCandidateSkeleton D q p
        ({t1, t2, t3} : Finset ℝ²) y)
      (hyOff : dist p y ≠ dist p q)
      (hyOutside : y ∉ U5BoundedSupport D q p
        ({t1, t2, t3} : Finset ℝ²) F.u F.a0 F.a1) :
      U3EscapingAuditStep F (F.shiftOfEscape hy hyOff hyOutside)
  | criticalFourShell
      (F : U3FixedTripleAuditFrame D q p t1 t2 t3)
      (center : ℝ²)
      (hcenter : center ∈ U5BoundedAuditCenters D q p
        ({t1, t2, t3} : Finset ℝ²) F.u F.a0 F.a1)
      (K : CriticalFourShell D.A q center)
      (y : ℝ²)
      (hyK : y ∈ K.support)
      (hy : U5SelectedCandidateSkeleton D q p
        ({t1, t2, t3} : Finset ℝ²) y)
      (hyOff : dist p y ≠ dist p q)
      (hyOutside : y ∉ U5BoundedSupport D q p
        ({t1, t2, t3} : Finset ℝ²) F.u F.a0 F.a1) :
      U3EscapingAuditStep F (F.shiftOfEscape hy hyOff hyOutside)

namespace U3FixedTripleAuditFrame

/-- An exact-radius fixed-triple audit either makes one source-faithful escape
step or every one of its six audit centers has a confined q-deleted row or
critical four-shell.

Unlike `exists_escaping_shift_or_mixedConfinedAuditPacket`, the escape arm
retains the exact `shiftOfEscape` successor and its actual row provenance. -/
theorem exists_escapingAuditStep_or_mixedConfinedAuditPacket
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (F : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    (∃ G : U3FixedTripleAuditFrame D q p t1 t2 t3,
      U3EscapingAuditStep F G) ∨ F.MixedConfinedAuditPacket := by
  classical
  by_cases hstep :
      ∃ G : U3FixedTripleAuditFrame D q p t1 t2 t3,
        U3EscapingAuditStep F G
  · exact Or.inl hstep
  · refine Or.inr ?_
    intro center hcenter
    rcases F.auditCenter_qDeleted_or_criticalFourShell hcenter with
      hdeleted | hshell
    · rcases hdeleted with ⟨B, ⟨K⟩, hcard⟩
      by_cases hconf : B ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) F.u F.a0 F.a1
      · exact Or.inl ⟨B, ⟨K⟩, hcard, hconf⟩
      · rcases Finset.not_subset.mp hconf with ⟨y, hyB, hyOutside⟩
        rcases F.dangerous.candidate_of_not_mem_boundedSupport
            K hyB hyOutside hexact with ⟨hy, hyOff⟩
        exact False.elim (hstep ⟨F.shiftOfEscape hy hyOff hyOutside,
          U3EscapingAuditStep.qDeleted F center hcenter B K hcard y hyB
            hy hyOff hyOutside⟩)
    · rcases hshell with ⟨K⟩
      by_cases hconf : K.support ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) F.u F.a0 F.a1
      · exact Or.inr ⟨K, hconf⟩
      · rcases Finset.not_subset.mp hconf with ⟨y, hyK, hyOutside⟩
        rcases F.dangerous.candidate_of_criticalFourShell_not_mem_boundedSupport
            K hyK hyOutside hexact with ⟨hy, hyOff⟩
        exact False.elim (hstep ⟨F.shiftOfEscape hy hyOff hyOutside,
          U3EscapingAuditStep.criticalFourShell F center hcenter K y hyK
            hy hyOff hyOutside⟩)

end U3FixedTripleAuditFrame
end Problem97
