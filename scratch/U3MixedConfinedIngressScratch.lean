import Erdos9796Proof.P97.U3ToU5Terminal

open scoped EuclideanGeometry

namespace Problem97

namespace U3FixedTripleAuditFrame

/-- At every center in the bounded U3 audit, either an exact q-deleted row or
an ambient critical four-shell is confined to the current bounded support. -/
def MixedConfinedAuditPacket
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3) : Prop :=
  ∀ x ∈ U5BoundedAuditCenters D q p ({t1, t2, t3} : Finset ℝ²)
      H.u H.a0 H.a1,
    (∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D q x B) ∧
        B.card = 4 ∧
        B ⊆ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
          H.u H.a0 H.a1) ∨
      ∃ K : CriticalFourShell D.A q x,
        K.support ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1

/-- An exact-radius U3 frame either shifts beyond its current bounded support,
or all six audited centers admit a confined q-deleted/critical-shell row.

This is finite ingress for the mixed-row census, not a contradiction: a
critical shell contains `q` and therefore does not directly populate the
existing q-deleted bounded-support consumer. -/
theorem exists_escaping_shift_or_mixedConfinedAuditPacket
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    (∃ F' : U3FixedTripleAuditFrame D q p t1 t2 t3,
      F'.u ∉ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
        H.u H.a0 H.a1) ∨
      H.MixedConfinedAuditPacket := by
  classical
  by_cases hescape :
      ∃ F' : U3FixedTripleAuditFrame D q p t1 t2 t3,
        F'.u ∉ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
          H.u H.a0 H.a1
  · exact Or.inl hescape
  · refine Or.inr ?_
    intro x hx
    rcases H.auditCenter_qDeleted_or_criticalFourShell hx with
      hdeleted | hshell
    · rcases hdeleted with ⟨B, hclass, hcard⟩
      by_cases hconf : B ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1
      · exact Or.inl ⟨B, hclass, hcard, hconf⟩
      · rcases Finset.not_subset.mp hconf with ⟨y, hyB, hyOutside⟩
        rcases hclass with ⟨K⟩
        rcases H.dangerous.candidate_of_not_mem_boundedSupport
            K hyB hyOutside hexact with ⟨hy, hyOff⟩
        let F' := H.shiftOfEscape hy hyOff hyOutside
        exact False.elim (hescape ⟨F', by
          simpa [F', shiftOfEscape] using hyOutside⟩)
    · rcases hshell with ⟨K⟩
      by_cases hconf : K.support ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1
      · exact Or.inr ⟨K, hconf⟩
      · rcases Finset.not_subset.mp hconf with ⟨y, hyK, hyOutside⟩
        rcases H.dangerous.candidate_of_criticalFourShell_not_mem_boundedSupport
            K hyK hyOutside hexact with ⟨hy, hyOff⟩
        let F' := H.shiftOfEscape hy hyOff hyOutside
        exact False.elim (hescape ⟨F', by
          simpa [F', shiftOfEscape] using hyOutside⟩)

end U3FixedTripleAuditFrame

end Problem97
