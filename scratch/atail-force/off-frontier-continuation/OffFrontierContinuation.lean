/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Full-live off-frontier continuation boundary

This scratch file starts from the fields which really survive into K-A-PAIR:
the dangerous exact `p`-row, a global critical-shell system, global K4, and a
convex boundary indexing.  It proves that these fields always produce a
genuine off-frontier blocker center and a single faithful carrier pattern in
which both the dangerous row and that blocker row are represented exactly.

The remaining producer is not a pattern-construction or provenance problem.
It is precisely a two-point cross-incidence together with the forbidden
nonalternating cyclic placement.  The final theorem kernel-checks that this
packet closes immediately.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailOffFrontierContinuation

open U1Depth5
open Census554
open Census554.EqualityCore
open Census554.GeneralCarrierBridge

/-- Four indices occur in cyclic order `q,u,y,v`, independently of the chosen
linear cut of the boundary enumeration. -/
def CyclicFourIndices {n : ℕ} (q u y v : Fin n) : Prop :=
  (q < u ∧ u < y ∧ y < v) ∨
  (u < y ∧ y < v ∧ v < q) ∨
  (y < v ∧ v < q ∧ q < u) ∨
  (v < q ∧ q < u ∧ u < y)

/-- The live selected source is an ambient carrier point. -/
theorem selectedU_mem_A
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    u ∈ D.A := by
  have huSkeleton : u ∈ D.skeleton q :=
    (Finset.mem_erase.mp H.selected.candidate_mem).2
  have huEraseQ : u ∈ D.A.erase q := by
    simpa [CounterexampleData.skeleton] using huSkeleton
  exact (Finset.mem_erase.mp huEraseQ).2

/-- The selected source is outside the dangerous exact four-set. -/
theorem selectedU_not_mem_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u) :
    u ∉ ({q, t1, t2, t3} : Finset ℝ²) := by
  intro hu
  simp only [Finset.mem_insert, Finset.mem_singleton] at hu
  rcases hu with huq | hut1 | hut2 | hut3
  · exact H.selected_off_circle (by simp [huq])
  · exact H.selected.candidate_notin_T (by simp [hut1])
  · exact H.selected.candidate_notin_T (by simp [hut2])
  · exact H.selected.candidate_notin_T (by simp [hut3])

/-- The chosen critical blocker of the outside source cannot be the dangerous
center.  Otherwise the dangerous four-class survives deletion of `u`,
contradicting the blocker condition at `u`. -/
theorem selectedU_blocker_ne_p
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (Hsys : CriticalShellSystem D.A) :
    Hsys.centerAt u (selectedU_mem_A Hlive) ≠ p := by
  intro hcenter
  let Kp : SelectedFourClass D.A p := dangerousBaseSelectedFourClass hfixed
  apply Hsys.no_qfree_at u (selectedU_mem_A Hlive)
  rw [hcenter]
  refine ⟨Kp.radius, Kp.radius_pos, ?_⟩
  calc
    4 = Kp.support.card := Kp.support_card.symm
    _ ≤ ((D.A.erase u).filter fun z => dist p z = Kp.radius).card :=
      Finset.card_le_card (by
        intro z hz
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr
              ⟨fun hzu => selectedU_not_mem_dangerousBase Hlive (by
                  simpa [Kp, dangerousBaseSelectedFourClass, hzu] using hz),
                Kp.support_subset_A hz⟩,
            Kp.support_eq_radius z hz⟩)

/-- The off-frontier critical shell can contain at most two dangerous-row
points.  Thus a lower bound of two would be an exact shared pair, not a loose
counting surrogate. -/
theorem selectedU_blocker_inter_dangerous_card_le_two
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (Hsys : CriticalShellSystem D.A) :
    (((Hsys.selectedAt u (selectedU_mem_A Hlive)).toCriticalFourShell.support ∩
      ({q, t1, t2, t3} : Finset ℝ²)).card ≤ 2) := by
  let Ku : SelectedFourClass D.A
      (Hsys.centerAt u (selectedU_mem_A Hlive)) :=
    (Hsys.selectedAt u (selectedU_mem_A Hlive)).toSelectedFourClass
  let Kp : SelectedFourClass D.A p := dangerousBaseSelectedFourClass hfixed
  have h := SelectedFourClass.inter_card_le_two Ku Kp
    (selectedU_blocker_ne_p hfixed Hlive Hsys)
  simpa [Ku, Kp, dangerousBaseSelectedFourClass,
    CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass] using h

/-- A full-live off-frontier candidate.  The critical center is the blocker
chosen for the actual outside source `u`; the faithful global row at `p` is
pinned to the dangerous class, and the row at the blocker is automatically
the exact critical shell. -/
structure LiveOffFrontierCandidate
    (D : CounterexampleData) (p q t1 t2 t3 u : ℝ²)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (Hsys : CriticalShellSystem D.A) where
  huA : u ∈ D.A
  huOutside : u ∉ ({q, t1, t2, t3} : Finset ℝ²)
  blocker_ne_p : Hsys.centerAt u huA ≠ p
  F : FaithfulCarrierPattern D.A
  boundary : BoundaryIndexing D.A
  dangerous_row :
    (F.classAt p hfixed.p_mem).support =
      ({q, t1, t2, t3} : Finset ℝ²)
  blocker_row :
    (F.classAt (blockerLabel Hsys u huA).1
      (blockerLabel Hsys u huA).2).support =
        (Hsys.selectedAt u huA).toCriticalFourShell.support

/-- The full K-A row/critical/global-K4 surface always supplies an honest
off-frontier candidate.  No common-system equality between the supplied five
`rows` and `Hsys` is required. -/
theorem exists_liveOffFrontierCandidate
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hncol : ¬ Collinear ℝ (D.A : Set ℝ²))
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (Hsys : CriticalShellSystem D.A) :
    Nonempty (LiveOffFrontierCandidate D p q t1 t2 t3 u
      hfixed Hlive Hsys) := by
  let Kp : SelectedFourClass D.A p := dangerousBaseSelectedFourClass hfixed
  rcases exists_faithfulCarrierPattern_with_classAt
      D.K4 hfixed.p_mem Kp with ⟨F, hF⟩
  rcases exists_boundaryIndexing D.convex hncol with ⟨B⟩
  let huA : u ∈ D.A := selectedU_mem_A Hlive
  refine ⟨{
    huA := huA
    huOutside := selectedU_not_mem_dangerousBase Hlive
    blocker_ne_p := by
      simpa [huA] using selectedU_blocker_ne_p hfixed Hlive Hsys
    F := F
    boundary := B
    dangerous_row := by
      simpa [Kp, dangerousBaseSelectedFourClass] using hF
    blocker_row := blocker_row_support_eq_shell F Hsys u huA }⟩

/-- The outer `Nonempty CriticalShellSystem` binder is enough to construct the
candidate, despite the current theorem signature forgetting which system made
the five supplied source rows. -/
theorem exists_system_and_liveOffFrontierCandidate
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    (hncol : ¬ Collinear ℝ (D.A : Set ℝ²))
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcritical : Nonempty (CriticalShellSystem D.A)) :
    ∃ Hsys : CriticalShellSystem D.A,
      Nonempty (LiveOffFrontierCandidate D p q t1 t2 t3 u
        hfixed Hlive Hsys) := by
  rcases hcritical with ⟨Hsys⟩
  exact ⟨Hsys,
    exists_liveOffFrontierCandidate hncol hfixed Hlive Hsys⟩

/-- The exact missing packet after the full-live adapter: two dangerous-row
points also lie in the off-frontier blocker row, and the two centers and two
points occur in the forbidden nonalternating cyclic order. -/
def HasNonalternatingSharedPair
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hfixed : U3FixedTriplePacket D q p t1 t2 t3}
    {Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u}
    {Hsys : CriticalShellSystem D.A}
    (C : LiveOffFrontierCandidate D p q t1 t2 t3 u
      hfixed Hlive Hsys) : Prop :=
  ∃ x y : ℝ²,
    ∃ hxA : x ∈ D.A, ∃ hyA : y ∈ D.A,
      x ∈ ({q, t1, t2, t3} : Finset ℝ²) ∧
      y ∈ ({q, t1, t2, t3} : Finset ℝ²) ∧
      x ∈ (Hsys.selectedAt u C.huA).toCriticalFourShell.support ∧
      y ∈ (Hsys.selectedAt u C.huA).toCriticalFourShell.support ∧
      x ≠ y ∧
      CyclicFourIndices
        (C.boundary.indexOf ⟨p, hfixed.p_mem⟩)
        (C.boundary.indexOf ⟨x, hxA⟩)
        (C.boundary.indexOf ⟨y, hyA⟩)
        (C.boundary.indexOf (blockerLabel Hsys u C.huA))

/-- Any shared pair between the dangerous row and the off-frontier blocker row
must alternate on the convex boundary.  Hence the exact nonalternating packet
is contradictory. -/
theorem false_of_hasNonalternatingSharedPair
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hfixed : U3FixedTriplePacket D q p t1 t2 t3}
    {Hlive : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u}
    {Hsys : CriticalShellSystem D.A}
    (C : LiveOffFrontierCandidate D p q t1 t2 t3 u
      hfixed Hlive Hsys)
    (hpair : HasNonalternatingSharedPair C) : False := by
  rcases hpair with
    ⟨x, y, hxA, hyA, hxDangerous, hyDangerous,
      hxBlocker, hyBlocker, hxy, hcyc⟩
  let Kp : SelectedFourClass D.A p := dangerousBaseSelectedFourClass hfixed
  have hxKp : x ∈ Kp.support := by
    simpa [Kp, dangerousBaseSelectedFourClass] using hxDangerous
  have hyKp : y ∈ Kp.support := by
    simpa [Kp, dangerousBaseSelectedFourClass] using hyDangerous
  let P : CarrierLabel D.A := ⟨p, hfixed.p_mem⟩
  let V : CarrierLabel D.A := blockerLabel Hsys u C.huA
  let X : CarrierLabel D.A := ⟨x, hxA⟩
  let Y : CarrierLabel D.A := ⟨y, hyA⟩
  have hPneV : P ≠ V := by
    intro h
    apply C.blocker_ne_p
    exact (congrArg Subtype.val h).symm
  have hXneY : X ≠ Y := by
    intro h
    exact hxy (congrArg Subtype.val h)
  have hYneP : Y ≠ P := by
    intro h
    apply Kp.center_not_mem
    have hyp : y = p := congrArg Subtype.val h
    simpa [hyp] using hyKp
  have hYneV : Y ≠ V := by
    intro h
    apply (Hsys.selectedAt u C.huA).toCriticalFourShell.center_not_mem_support
    have hyv : y = Hsys.centerAt u C.huA := congrArg Subtype.val h
    simpa [V, blockerLabel, hyv] using hyBlocker
  have hxP : X ∈ rowPattern C.F P := by
    apply (mem_rowPattern_iff C.F P X).mpr
    rw [C.dangerous_row]
    exact hxDangerous
  have hyP : Y ∈ rowPattern C.F P := by
    apply (mem_rowPattern_iff C.F P Y).mpr
    rw [C.dangerous_row]
    exact hyDangerous
  have hxV : X ∈ rowPattern C.F V := by
    apply (mem_rowPattern_iff C.F V X).mpr
    rw [show (C.F.classAt V.1 V.2).support =
        (Hsys.selectedAt u C.huA).toCriticalFourShell.support by
      simpa [V] using C.blocker_row]
    exact hxBlocker
  have hyV : Y ∈ rowPattern C.F V := by
    apply (mem_rowPattern_iff C.F V Y).mpr
    rw [show (C.F.classAt V.1 V.2).support =
        (Hsys.selectedAt u C.huA).toCriticalFourShell.support by
      simpa [V] using C.blocker_row]
    exact hyBlocker
  let sep : SeparationCore.SharedPairSeparationCore (rowPattern C.F) :=
    { firstCenter := P
      secondCenter := V
      firstPoint := X
      secondPoint := Y
      centers_ne := hPneV
      secondPoint_ne_firstCenter := hYneP
      secondPoint_ne_secondCenter := hYneV
      points_ne := hXneY
      firstCenter_eq := EdgeClosure.row P X Y hxP hyP
      secondCenter_eq := EdgeClosure.row V X Y hxV hyV }
  have hsep := C.boundary.sharedPair_satisfied C.F sep
  change
    (SurplusCOMPGBank.btw (C.boundary.indexOf P)
        (C.boundary.indexOf V) (C.boundary.indexOf X) ↔
      ¬ SurplusCOMPGBank.btw (C.boundary.indexOf P)
        (C.boundary.indexOf V) (C.boundary.indexOf Y)) at hsep
  change CyclicFourIndices (C.boundary.indexOf P)
    (C.boundary.indexOf X) (C.boundary.indexOf Y)
    (C.boundary.indexOf V) at hcyc
  unfold SurplusCOMPGBank.btw at hsep
  unfold CyclicFourIndices at hcyc
  omega

#print axioms selectedU_blocker_ne_p
#print axioms selectedU_blocker_inter_dangerous_card_le_two
#print axioms exists_liveOffFrontierCandidate
#print axioms exists_system_and_liveOffFrontierCandidate
#print axioms false_of_hasNonalternatingSharedPair

end ATailOffFrontierContinuation
end Problem97
