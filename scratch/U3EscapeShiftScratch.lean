import Erdos9796Proof.P97.U3ToU5Terminal

open scoped EuclideanGeometry

namespace Problem97

namespace CriticalFourShell

/-- A critical four-shell is a q-allowed K4 witness at its center. -/
noncomputable def toU5QAllowedK4Class
    {D : CounterexampleData} {q center : ℝ²}
    (K : CriticalFourShell D.A q center) :
    U5QAllowedK4Class D center K.support where
  subset := by
    intro y hy
    exact Finset.mem_erase.mpr ⟨fun h => K.center_not_mem_support (h ▸ hy),
      K.support_subset_A hy⟩
  card_four := by
    rw [K.support_card]
  radius := K.radius
  radius_pos := K.radius_pos
  same_radius := K.support_eq_radius

end CriticalFourShell

namespace U5DangerousTriple

/-- A point of an exact critical shell escaping the bounded U3 frame is a new
off-dangerous-circle skeleton candidate. -/
theorem candidate_of_criticalFourShell_not_mem_boundedSupport
    {D : CounterexampleData} {q p center y u a0 a1 : ℝ²}
    {T : Finset ℝ²}
    (H : U5DangerousTriple D q p T)
    (K : CriticalFourShell D.A q center)
    (hyK : y ∈ K.support)
    (hyOutside : y ∉ U5BoundedSupport D q p T u a0 a1)
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    U5SelectedCandidateSkeleton D q p T y ∧ dist p y ≠ dist p q := by
  apply H.candidate_of_not_mem_qAllowedBoundedSupport
    K.toU5QAllowedK4Class hyK
  · simpa [U5QAllowedBoundedSupport, U5BoundedSupport] using hyOutside
  · exact hexact

end U5DangerousTriple

namespace U3FixedTripleAuditFrame

/-- Shift a U3 audit frame by inserting a new escaping candidate and retaining
the two most recent off-circle candidates as auxiliaries. -/
noncomputable def shiftOfEscape
    {D : CounterexampleData} {q p t1 t2 t3 y : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hy : U5SelectedCandidateSkeleton D q p
      ({t1, t2, t3} : Finset ℝ²) y)
    (hyOff : dist p y ≠ dist p q)
    (hyOutside : y ∉ U5BoundedSupport D q p
      ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1) :
    U3FixedTripleAuditFrame D q p t1 t2 t3 where
  u := y
  a0 := H.u
  a1 := H.a0
  dangerous := H.dangerous
  selected := hy
  selected_off_circle := hyOff
  a0_mem := H.selected.candidate_mem
  a1_mem := H.a0_mem
  a0_notin_base := by
    intro hu
    rw [Finset.mem_insert] at hu
    rcases hu with huy | huT
    · apply hyOutside
      subst y
      simp [U5BoundedSupport]
    · exact H.selected.candidate_notin_T huT
  a1_notin_base := by
    intro ha0
    simp only [Finset.mem_insert] at ha0
    rcases ha0 with ha0y | ha0u | ha0T
    · apply hyOutside
      subst y
      simp [U5BoundedSupport]
    · exact H.a0_notin_base (by simp [ha0u])
    · apply H.a0_notin_base
      exact Finset.mem_insert.mpr (Or.inr (by
        simpa only [Finset.mem_insert] using ha0T))
  a0_off_circle := H.selected_off_circle
  a1_off_circle := H.a0_off_circle

/-- A critical-shell escape produces a shifted U3 audit frame. -/
theorem exists_shift_of_criticalFourShell_escape
    {D : CounterexampleData} {q p t1 t2 t3 center y : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (K : CriticalFourShell D.A q center)
    (hyK : y ∈ K.support)
    (hyOutside : y ∉ U5BoundedSupport D q p
      ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1)
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    Nonempty (U3FixedTripleAuditFrame D q p t1 t2 t3) := by
  rcases H.dangerous.candidate_of_criticalFourShell_not_mem_boundedSupport
      K hyK hyOutside hexact with ⟨hy, hyOff⟩
  exact ⟨H.shiftOfEscape hy hyOff hyOutside⟩

/-- Every exact-radius U3 frame either advances to a frame whose distinguished
candidate escapes the old bounded support, or exposes a critical shell wholly
confined to that support.  This removes the anonymous q-deleted escape arm
without claiming that iterated frame shifts cannot cycle. -/
theorem exists_escaping_shift_or_confinedCriticalFourShell
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    (∃ F' : U3FixedTripleAuditFrame D q p t1 t2 t3,
      F'.u ∉ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
        H.u H.a0 H.a1) ∨
      ∃ x, x ∈ U5BoundedAuditCenters D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
        ∃ K : CriticalFourShell D.A q x,
          K.support ⊆ U5BoundedSupport D q p
            ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 := by
  classical
  rcases H.exists_qDeleted_escape_or_criticalFourShell with
    ⟨x, hx, hescape | hshell⟩
  · rcases hescape with ⟨B, y, ⟨K⟩, _hcard, hyB, hyOutside⟩
    rcases H.dangerous.candidate_of_not_mem_boundedSupport
        K hyB hyOutside hexact with ⟨hy, hyOff⟩
    let F' := H.shiftOfEscape hy hyOff hyOutside
    exact Or.inl ⟨F', by
      simpa [F', shiftOfEscape] using hyOutside⟩
  · rcases hshell with ⟨K⟩
    by_cases hconf : K.support ⊆ U5BoundedSupport D q p
        ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1
    · exact Or.inr ⟨x, hx, K, hconf⟩
    · rcases Finset.not_subset.mp hconf with ⟨y, hyK, hyOutside⟩
      rcases H.dangerous.candidate_of_criticalFourShell_not_mem_boundedSupport
          K hyK hyOutside hexact with ⟨hy, hyOff⟩
      let F' := H.shiftOfEscape hy hyOff hyOutside
      exact Or.inl ⟨F', by
        simpa [F', shiftOfEscape] using hyOutside⟩

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

theorem MixedConfinedAuditPacket.nonempty_qAllowedAuditSupport
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {H : U3FixedTripleAuditFrame D q p t1 t2 t3}
    (hmixed : H.MixedConfinedAuditPacket) :
    Nonempty (U5QAllowedAuditSupport D q p
      ({t1, t2, t3} : Finset ℝ²) H.u) := by
  classical
  let T : Finset ℝ² := {t1, t2, t3}
  have hexists :
      ∀ x (hx : x ∈ U5BoundedAuditCenters D q p T H.u H.a0 H.a1),
        Nonempty (Σ B : Finset ℝ²,
          Subtype fun _K : Subtype fun _K : U5QAllowedK4Class D x B =>
            B ⊆ U5QAllowedBoundedSupport D q p T H.u H.a0 H.a1 =>
              B.card = 4) := by
    intro x hx
    rcases hmixed x (by simpa [T] using hx) with
      ⟨B, ⟨K⟩, hcard, hconf⟩ | ⟨K, hconf⟩
    · refine ⟨⟨B, ⟨⟨K.toQAllowedK4Class, ?_⟩, hcard⟩⟩⟩
      intro y hy
      exact Finset.mem_insert.mpr (Or.inr (hconf hy))
    · refine ⟨⟨K.support, ⟨⟨K.toU5QAllowedK4Class, ?_⟩, K.support_card⟩⟩⟩
      intro y hy
      exact Finset.mem_insert.mpr (Or.inr (hconf hy))
  let picked := fun x hx => Classical.choice (hexists x hx)
  let classes :
      ∀ x (hx : x ∈ U5BoundedAuditCenters D q p T H.u H.a0 H.a1),
        Σ B : Finset ℝ²,
          Subtype fun _K : U5QAllowedK4Class D x B =>
            B ⊆ U5QAllowedBoundedSupport D q p T H.u H.a0 H.a1 :=
    fun x hx => ⟨(picked x hx).1, (picked x hx).2.1⟩
  refine ⟨U5QAllowedAuditSupport.of_selectedClasses
    H.a0 H.a1 H.a0_mem H.a1_mem ?_ ?_
    H.a0_off_circle H.a1_off_circle classes ?_⟩
  · simpa [T] using H.a0_notin_base
  · simpa [T] using H.a1_notin_base
  · intro x hx
    exact (picked x hx).2.2

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

#print axioms Problem97.CriticalFourShell.toU5QAllowedK4Class
#print axioms Problem97.U5DangerousTriple.candidate_of_criticalFourShell_not_mem_boundedSupport
#print axioms Problem97.U3FixedTripleAuditFrame.shiftOfEscape
#print axioms Problem97.U3FixedTripleAuditFrame.exists_shift_of_criticalFourShell_escape
#print axioms Problem97.U3FixedTripleAuditFrame.exists_escaping_shift_or_confinedCriticalFourShell
#print axioms Problem97.U3FixedTripleAuditFrame.exists_escaping_shift_or_mixedConfinedAuditPacket
#print axioms Problem97.U3FixedTripleAuditFrame.MixedConfinedAuditPacket.nonempty_qAllowedAuditSupport
