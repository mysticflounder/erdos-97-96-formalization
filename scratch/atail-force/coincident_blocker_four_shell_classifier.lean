/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Coincident-blocker four-shell classifier

This scratch module records the exact information contributed by the other
two members of a coincident blocker's selected four-shell.  If two distinct
centres have the same two distinct points on their circles, every other member
of the blocker's shell is off the apex circle.  Since the shell has cardinality
four, deleting the common pair leaves exactly two points.

This is a classifier, not a closure theorem: global K4 and a critical-shell
system do not by themselves place either residual point in another source row.
-/

open scoped EuclideanGeometry
open EuclideanGeometry

namespace Problem97
namespace ATAILCoincidentBlockerFourShell

attribute [local instance] Classical.propDecidable

/-- Two selected members of a four-shell leave exactly two residual members. -/
theorem support_sdiff_pair_card_eq_two
    {A : Finset ℝ²} {center q w : ℝ²}
    (K : SelectedFourClass A center)
    (hq : q ∈ K.support) (hw : w ∈ K.support) (hqw : q ≠ w) :
    (K.support \ ({q, w} : Finset ℝ²)).card = 2 := by
  rw [Finset.card_sdiff]
  · rw [K.support_card]
    have hpair : ({q, w} : Finset ℝ²).card = 2 := by simp [hqw]
    have hinter : K.support ∩ ({q, w} : Finset ℝ²) = {q, w} := by
      ext x
      simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
      constructor
      · exact fun hx => hx.2
      · intro hx
        rcases hx with rfl | rfl
        · exact ⟨hq, Or.inl rfl⟩
        · exact ⟨hw, Or.inr rfl⟩
    have hinter' : ({q, w} : Finset ℝ²) ∩ K.support = {q, w} := by
      simpa [Finset.inter_comm] using hinter
    rw [hinter', hpair]

/-- Apart from the two shared points, the blocker's four-shell is disjoint
from the apex circle through the shared pair. -/
theorem residual_support_off_apex_circle
    {A : Finset ℝ²} {apex center q w : ℝ²}
    (K : SelectedFourClass A center)
    (hcenters : apex ≠ center)
    (hqw : q ≠ w)
    (hq : q ∈ K.support) (hw : w ∈ K.support)
    (hapex : dist apex q = dist apex w) :
    ∀ x ∈ K.support \ ({q, w} : Finset ℝ²),
      dist apex x ≠ dist apex q := by
  intro x hx hax
  have hxK : x ∈ K.support := (Finset.mem_sdiff.mp hx).1
  have hxPair : x ∉ ({q, w} : Finset ℝ²) := (Finset.mem_sdiff.mp hx).2
  let sA : Sphere ℝ² := ⟨apex, dist apex q⟩
  let sK : Sphere ℝ² := ⟨center, K.radius⟩
  have hspheres : sA ≠ sK := by
    intro hs
    apply hcenters
    exact congrArg Sphere.center hs
  have hqA : q ∈ sA := by
    rw [mem_sphere]
    simp [sA, dist_comm]
  have hwA : w ∈ sA := by
    rw [mem_sphere]
    simpa [sA, dist_comm] using hapex.symm
  have hqK : q ∈ sK := by
    rw [mem_sphere]
    simpa [sK, dist_comm] using K.support_eq_radius q hq
  have hwK : w ∈ sK := by
    rw [mem_sphere]
    simpa [sK, dist_comm] using K.support_eq_radius w hw
  have hxA : x ∈ sA := by
    rw [mem_sphere]
    simpa [sA, dist_comm] using hax
  have hxCircle : x ∈ sK := by
    rw [mem_sphere]
    simpa [sK, dist_comm] using K.support_eq_radius x hxK
  rcases two_circle_common_point_eq_endpoint hspheres hqw
      hqA hwA hqK hwK hxA hxCircle with h | h
  · exact hxPair (by simp [h])
  · exact hxPair (by simp [h])

/-- If the common blocker and common pair lie in one indexed cap, the pair
already saturates the cap-local two-hit bound.  Hence both residual shell
members lie outside that cap. -/
theorem residual_support_outside_same_cap
    {A : Finset ℝ²} (S : SurplusCapPacket A) (hconv : ConvexIndep A)
    (i : Fin 3) {center q w : ℝ²}
    (K : SelectedFourClass A center)
    (hcenterCap : center ∈ S.capByIndex i)
    (hqCap : q ∈ S.capByIndex i) (hwCap : w ∈ S.capByIndex i)
    (hq : q ∈ K.support) (hw : w ∈ K.support) (hqw : q ≠ w) :
    ∀ x ∈ K.support \ ({q, w} : Finset ℝ²),
      x ∉ S.capByIndex i := by
  intro x hx hxCap
  have hxK : x ∈ K.support := (Finset.mem_sdiff.mp hx).1
  have hxPair : x ∉ ({q, w} : Finset ℝ²) := (Finset.mem_sdiff.mp hx).2
  have hxq : x ≠ q := by
    intro h
    exact hxPair (by simp [h])
  have hxw : x ≠ w := by
    intro h
    exact hxPair (by simp [h])
  have hsub : ({q, w, x} : Finset ℝ²) ⊆
      K.support ∩ S.capByIndex i := by
    intro y hy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hy
    rcases hy with rfl | rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hq, hqCap⟩
    · exact Finset.mem_inter.mpr ⟨hw, hwCap⟩
    · exact Finset.mem_inter.mpr ⟨hxK, hxCap⟩
  have hthree : 3 ≤ (K.support ∩ S.capByIndex i).card := by
    have hcard : ({q, w, x} : Finset ℝ²).card = 3 := by
      simp [hqw, hxq.symm, hxw.symm]
    rw [← hcard]
    exact Finset.card_le_card hsub
  have htwo :=
    Problem97.CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S hconv i K hcenterCap
  omega

/-- Exact combined output of the full four-shell in the coincident-blocker
branch: two residual points, all off the original apex circle. -/
theorem coincident_blocker_residual_pair
    {A : Finset ℝ²} {apex center q w : ℝ²}
    (K : SelectedFourClass A center)
    (hcenters : apex ≠ center)
    (hqw : q ≠ w)
    (hq : q ∈ K.support) (hw : w ∈ K.support)
    (hapex : dist apex q = dist apex w) :
    (K.support \ ({q, w} : Finset ℝ²)).card = 2 ∧
      ∀ x ∈ K.support \ ({q, w} : Finset ℝ²),
        dist apex x ≠ dist apex q :=
  ⟨support_sdiff_pair_card_eq_two K hq hw hqw,
    residual_support_off_apex_circle K hcenters hqw hq hw hapex⟩

/-- Exact consumer for the remaining global-K4 producer.  If either residual
shell member has a selected global-K4 class containing the original common
pair, the apex, blocker, and residual member are three distinct carrier
centres on one perpendicular bisector, contradicting Dumitrescu's bound. -/
theorem false_of_residual_member_class_contains_common_pair
    {D : CounterexampleData} {apex center q w x : ℝ²}
    (K : SelectedFourClass D.A center)
    (Kx : SelectedFourClass D.A x)
    (hapexA : apex ∈ D.A) (hcenterA : center ∈ D.A)
    (hqw : q ≠ w)
    (hq : q ∈ K.support) (hw : w ∈ K.support)
    (hx : x ∈ K.support \ ({q, w} : Finset ℝ²))
    (hapexCenter : apex ≠ center) (hxApex : x ≠ apex)
    (hapex : dist apex q = dist apex w)
    (hqKx : q ∈ Kx.support) (hwKx : w ∈ Kx.support) : False := by
  have hqA : q ∈ D.A := K.support_subset_A hq
  have hwA : w ∈ D.A := K.support_subset_A hw
  have hxK : x ∈ K.support := (Finset.mem_sdiff.mp hx).1
  have hxA : x ∈ D.A := K.support_subset_A hxK
  have hxCenter : x ≠ center := by
    intro h
    apply K.center_not_mem
    simpa [h] using hxK
  have hcenterDist : dist center q = dist center w :=
    (K.support_eq_radius q hq).trans (K.support_eq_radius w hw).symm
  have hxDist : dist x q = dist x w :=
    (Kx.support_eq_radius q hqKx).trans
      (Kx.support_eq_radius w hwKx).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex hqA hwA hqw
  have hthree :
      2 < (D.A.filter (fun y => dist y q = dist y w)).card := by
    rw [Finset.two_lt_card]
    refine ⟨apex, Finset.mem_filter.mpr ⟨hapexA, hapex⟩,
      center, Finset.mem_filter.mpr ⟨hcenterA, hcenterDist⟩,
      x, Finset.mem_filter.mpr ⟨hxA, hxDist⟩,
      hapexCenter, hxApex.symm, hxCenter.symm⟩
  exact (not_lt_of_ge hbound) hthree

#print axioms support_sdiff_pair_card_eq_two
#print axioms residual_support_off_apex_circle
#print axioms residual_support_outside_same_cap
#print axioms coincident_blocker_residual_pair
#print axioms false_of_residual_member_class_contains_common_pair

end ATAILCoincidentBlockerFourShell
end Problem97
