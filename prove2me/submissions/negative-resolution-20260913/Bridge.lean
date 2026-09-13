/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

/-!
# Bridge from the upstream Erdős 96 count to the mission vocabulary

The upstream count and the mission count both enumerate unordered pairs in a
finite set.  This file records the count identity, the induced identity of
the two supremum functions, and the resulting negative Problem 96 adapter.

This fragment is appended after `upstream/Erdos9697Complete.lean`.
-/

namespace Erdos9796MissionBridge

open Erdos9796Mission

lemma unitDistancePairsCount_eq_unitDistNum (A : Finset Plane) :
    unitDistancePairsCount A = unitDistNum A := by
  classical
  simp only [unitDistancePairsCount, unitDistNum]
  change
    (A.sym2.filter (Sym2.lift ⟨fun p q : Plane ↦ 0 < dist p q ∧ dist p q = 1, _⟩)).card =
    (A.sym2.filter (fun p ↦ dist p.out.1 p.out.2 = 1)).card
  congr 1
  ext p
  simp only [Finset.mem_filter]
  have hrel : (Sym2.lift ⟨fun p q : Plane ↦ 0 < dist p q ∧ dist p q = 1,
      fun p q ↦ congrArg (fun d : ℝ ↦ 0 < d ∧ d = 1) (dist_comm p q)⟩ p) ↔
      dist p.out.1 p.out.2 = 1 := by
    calc
      _ ↔ Proof.pairDistance p = 1 := by
        refine Sym2.inductionOn p ?_
        intro a b
        simp only [Sym2.lift_mk, Proof.pairDistance]
        constructor
        · exact fun h ↦ h.2
        · intro h
          exact ⟨by rw [h]; norm_num, h⟩
      _ ↔ _ := by rw [Proof.pairDistance_eq_out]
  rw [hrel]

lemma convexUnitDistanceCounts_eq (n : ℕ) :
    Erdos9796Mission.convexUnitDistanceCounts n = Erdos96.convexUnitDistanceCounts n := by
  ext k
  constructor
  · rintro ⟨A, hcard, hconv, rfl⟩
    exact ⟨A, hcard, hconv, (unitDistancePairsCount_eq_unitDistNum A).symm⟩
  · rintro ⟨A, hcard, hconv, rfl⟩
    exact ⟨A, hcard, hconv, unitDistancePairsCount_eq_unitDistNum A⟩

lemma maxConvexUnitDistances_eq (n : ℕ) :
    Erdos9796Mission.maxConvexUnitDistances n = Erdos96.maxConvexUnitDistances n := by
  simp only [Erdos9796Mission.maxConvexUnitDistances, Erdos96.maxConvexUnitDistances,
    convexUnitDistanceCounts_eq]

theorem problem96_false : ¬ Erdos9796Mission.Problem96 := by
  intro h
  apply Proof.erdos_96_false
  simpa only [Erdos9796Mission.Problem96, maxConvexUnitDistances_eq] using h

end Erdos9796MissionBridge
