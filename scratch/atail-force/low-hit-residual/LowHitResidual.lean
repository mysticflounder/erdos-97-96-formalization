/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Scratch: the positive-incidence boundary for a LowHit row

This file isolates the first nontrivial consequence of the `LowHit` branch
and the smallest direct critical-map consumer visible from it.

A LowHit selected four-row has at most one hit among three named anchors, so
it has at least three support points outside those anchors.  Two such fresh
points `z,w` already have one carrier perpendicular-bisector center: the row
center.  The critical shells sourced at `z` and `w` automatically contain
their own sources.  Consequently only the two reciprocal cross-incidences

* `w ∈ selectedAt z`, and
* `z ∈ selectedAt w`

are missing to turn the two blocker centers into two further bisector
centers.  If those two blockers and the original row center are distinct,
`Dumitrescu.perpBisector_apex_bound` closes the branch.

Without the distinctness fields, the same argument proves only a three-way
center collision.  Thus neither the reciprocal incidences nor blocker
separation is silently promoted to a consequence of LowHit.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailLowHitResidualScratch

attribute [local instance] Classical.propDecidable

/-- The branch in which no pair of the three named anchors occurs in the
selected support.  This is definitionally the same proposition as the
`LowHit` field in the scratch joint-transition packet. -/
def LowHit {A : Finset ℝ²} {center : ℝ²}
    (K : SelectedFourClass A center) (x y a : ℝ²) : Prop :=
  ¬ ((x ∈ K.support ∧ y ∈ K.support) ∨
      (x ∈ K.support ∧ a ∈ K.support) ∨
      (y ∈ K.support ∧ a ∈ K.support))

/-- LowHit means that the selected support contains at most one of the three
named anchors. -/
theorem lowHit_anchor_inter_card_le_one
    {A : Finset ℝ²} {center x y a : ℝ²}
    (K : SelectedFourClass A center)
    (hlow : LowHit K x y a) :
    (K.support ∩ ({x, y, a} : Finset ℝ²)).card ≤ 1 := by
  rw [Finset.card_le_one]
  intro u hu v hv
  have huSupport := (Finset.mem_inter.mp hu).1
  have hvSupport := (Finset.mem_inter.mp hv).1
  have huAnchor : u = x ∨ u = y ∨ u = a := by
    simpa only [Finset.mem_insert, Finset.mem_singleton] using
      (Finset.mem_inter.mp hu).2
  have hvAnchor : v = x ∨ v = y ∨ v = a := by
    simpa only [Finset.mem_insert, Finset.mem_singleton] using
      (Finset.mem_inter.mp hv).2
  rcases huAnchor with rfl | rfl | rfl <;>
    rcases hvAnchor with rfl | rfl | rfl
  · rfl
  · exact False.elim (hlow (Or.inl ⟨huSupport, hvSupport⟩))
  · exact False.elim (hlow (Or.inr (Or.inl ⟨huSupport, hvSupport⟩)))
  · exact False.elim (hlow (Or.inl ⟨hvSupport, huSupport⟩))
  · rfl
  · exact False.elim (hlow (Or.inr (Or.inr ⟨huSupport, hvSupport⟩)))
  · exact False.elim (hlow (Or.inr (Or.inl ⟨hvSupport, huSupport⟩)))
  · exact False.elim (hlow (Or.inr (Or.inr ⟨hvSupport, huSupport⟩)))
  · rfl

/-- A LowHit selected four-row has at least three support points outside the
three named anchors. -/
theorem lowHit_three_le_fresh_support_card
    {A : Finset ℝ²} {center x y a : ℝ²}
    (K : SelectedFourClass A center)
    (hlow : LowHit K x y a) :
    3 ≤ (K.support \ ({x, y, a} : Finset ℝ²)).card := by
  have hinter := lowHit_anchor_inter_card_le_one K hlow
  have hsplit := Finset.card_sdiff_add_card_inter K.support
    ({x, y, a} : Finset ℝ²)
  rw [K.support_card] at hsplit
  omega

/-- Named form of the three fresh source candidates supplied by LowHit. -/
theorem exists_three_fresh_sources_of_lowHit
    {A : Finset ℝ²} {center x y a : ℝ²}
    (K : SelectedFourClass A center)
    (hlow : LowHit K x y a) :
    ∃ z w t : ℝ²,
      z ∈ K.support \ ({x, y, a} : Finset ℝ²) ∧
      w ∈ K.support \ ({x, y, a} : Finset ℝ²) ∧
      t ∈ K.support \ ({x, y, a} : Finset ℝ²) ∧
      z ≠ w ∧ z ≠ t ∧ w ≠ t := by
  have hthree := lowHit_three_le_fresh_support_card K hlow
  have hlt :
      2 < (K.support \ ({x, y, a} : Finset ℝ²)).card := by
    omega
  rcases Finset.two_lt_card.mp hlt with
    ⟨z, hz, w, hw, t, ht, hzw, hzt, hwt⟩
  exact ⟨z, w, t, hz, hw, ht, hzw, hzt, hwt⟩

/-- The two source-specialized positive incidences.  The diagonal incidences
are omitted because each chosen critical shell already contains its source. -/
structure MutualCriticalFreshPair
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {z w : ℝ²} (hzA : z ∈ A) (hwA : w ∈ A) : Prop where
  w_mem_zShell :
    w ∈ (H.selectedAt z hzA).toCriticalFourShell.support
  z_mem_wShell :
    z ∈ (H.selectedAt w hwA).toCriticalFourShell.support

/-- Reciprocal fresh-source incidence forces a collision among the original
row center and the two chosen blocker centers.  This is the branch-complete
conclusion before any cap/MEC argument separates those centers. -/
theorem blocker_center_collision_of_mutualCriticalFreshPair
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    {center z w : ℝ²}
    (K : SelectedFourClass D.A center)
    (hcenterA : center ∈ D.A)
    (hzK : z ∈ K.support) (hwK : w ∈ K.support)
    (hzw : z ≠ w)
    (M : MutualCriticalFreshPair H
      (K.support_subset_A hzK) (K.support_subset_A hwK)) :
    center = H.centerAt z (K.support_subset_A hzK) ∨
      center = H.centerAt w (K.support_subset_A hwK) ∨
      H.centerAt z (K.support_subset_A hzK) =
        H.centerAt w (K.support_subset_A hwK) := by
  by_contra hcollision
  simp only [not_or] at hcollision
  let hzA : z ∈ D.A := K.support_subset_A hzK
  let hwA : w ∈ D.A := K.support_subset_A hwK
  let cz := H.centerAt z hzA
  let cw := H.centerAt w hwA
  have hczA : cz ∈ D.A := by
    exact (Finset.mem_erase.mp
      (H.selectedAt z hzA).toCriticalFourShell.center_mem).2
  have hcwA : cw ∈ D.A := by
    exact (Finset.mem_erase.mp
      (H.selectedAt w hwA).toCriticalFourShell.center_mem).2
  have hcenterEq : dist center z = dist center w :=
    (K.support_eq_radius z hzK).trans
      (K.support_eq_radius w hwK).symm
  have hczEq : dist cz z = dist cz w :=
    ((H.selectedAt z hzA).toCriticalFourShell.support_eq_radius z
      (H.selectedAt z hzA).toCriticalFourShell.q_mem_support).trans
    ((H.selectedAt z hzA).toCriticalFourShell.support_eq_radius w
      M.w_mem_zShell).symm
  have hcwEq : dist cw z = dist cw w :=
    ((H.selectedAt w hwA).toCriticalFourShell.support_eq_radius z
      M.z_mem_wShell).trans
    ((H.selectedAt w hwA).toCriticalFourShell.support_eq_radius w
      (H.selectedAt w hwA).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound
    D.convex hzA hwA hzw
  have hcenterFilter : center ∈
      D.A.filter (fun p => dist p z = dist p w) :=
    Finset.mem_filter.mpr ⟨hcenterA, hcenterEq⟩
  have hczFilter : cz ∈
      D.A.filter (fun p => dist p z = dist p w) :=
    Finset.mem_filter.mpr ⟨hczA, hczEq⟩
  have hcwFilter : cw ∈
      D.A.filter (fun p => dist p z = dist p w) :=
    Finset.mem_filter.mpr ⟨hcwA, hcwEq⟩
  have hthree :
      2 < (D.A.filter (fun p => dist p z = dist p w)).card := by
    rw [Finset.two_lt_card]
    exact ⟨center, hcenterFilter, cz, hczFilter, cw, hcwFilter,
      hcollision.1, hcollision.2.1, hcollision.2.2⟩
  omega

private def transportSelectedCenter
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    SelectedFourClass A center₂ :=
  hcenter ▸ K

@[simp] private theorem transportSelectedCenter_support
    {A : Finset ℝ²} {center₁ center₂ : ℝ²}
    (K : SelectedFourClass A center₁) (hcenter : center₁ = center₂) :
    (transportSelectedCenter K hcenter).support = K.support := by
  subst center₂
  rfl

/-- Support-level form of the three center-collision branches.  A collision
with the LowHit row center identifies that row with the corresponding exact
critical shell.  A collision of the two blocker centers identifies the two
critical supports, using the reciprocal incidences to put both sources on
the same selected circle. -/
def MutualCriticalFreshPairSupportCollision
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    {center z w : ℝ²}
    (K : SelectedFourClass D.A center)
    (hzA : z ∈ D.A) (hwA : w ∈ D.A) : Prop :=
  (center = H.centerAt z hzA ∧
      K.support =
        (H.selectedAt z hzA).toCriticalFourShell.support) ∨
    (center = H.centerAt w hwA ∧
      K.support =
        (H.selectedAt w hwA).toCriticalFourShell.support) ∨
    (H.centerAt z hzA = H.centerAt w hwA ∧
      (H.selectedAt z hzA).toCriticalFourShell.support =
        (H.selectedAt w hwA).toCriticalFourShell.support)

/-- Reciprocal fresh-source incidence always produces an exact support
alignment, even when it does not immediately produce three distinct
bisector centers. -/
theorem support_collision_of_mutualCriticalFreshPair
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    {center z w : ℝ²}
    (K : SelectedFourClass D.A center)
    (hcenterA : center ∈ D.A)
    (hzK : z ∈ K.support) (hwK : w ∈ K.support)
    (hzw : z ≠ w)
    (M : MutualCriticalFreshPair H
      (K.support_subset_A hzK) (K.support_subset_A hwK)) :
    MutualCriticalFreshPairSupportCollision H K
      (K.support_subset_A hzK) (K.support_subset_A hwK) := by
  let hzA : z ∈ D.A := K.support_subset_A hzK
  let hwA : w ∈ D.A := K.support_subset_A hwK
  rcases blocker_center_collision_of_mutualCriticalFreshPair
      H K hcenterA hzK hwK hzw M with hcz | hcw | hzwc
  · left
    refine ⟨hcz, ?_⟩
    let Kz : SelectedFourClass D.A (H.centerAt z hzA) :=
      transportSelectedCenter K hcz
    have hsupport := H.selectedFourClass_support_eq_shell z hzA Kz
    simpa [Kz] using hsupport
  · right
    left
    refine ⟨hcw, ?_⟩
    let Kw : SelectedFourClass D.A (H.centerAt w hwA) :=
      transportSelectedCenter K hcw
    have hsupport := H.selectedFourClass_support_eq_shell w hwA Kw
    simpa [Kw] using hsupport
  · right
    right
    refine ⟨hzwc, ?_⟩
    let Kz : SelectedFourClass D.A (H.centerAt w hwA) :=
      transportSelectedCenter
        (H.selectedAt z hzA).toSelectedFourClass hzwc
    have hsupport := H.selectedFourClass_support_eq_shell w hwA Kz
    simpa [Kz, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using hsupport

/-- The exact closing packet: the two reciprocal positive incidences plus the
three center-separation fields needed by the perpendicular-bisector bound. -/
structure DistinctMutualCriticalFreshPair
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    {center z w : ℝ²}
    (hzA : z ∈ D.A) (hwA : w ∈ D.A) : Prop
    extends MutualCriticalFreshPair H hzA hwA where
  center_ne_zBlocker : center ≠ H.centerAt z hzA
  center_ne_wBlocker : center ≠ H.centerAt w hwA
  blockers_ne : H.centerAt z hzA ≠ H.centerAt w hwA

/-- Consumer for the exact two-incidence closing packet. -/
theorem false_of_distinctMutualCriticalFreshPair
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    {center z w : ℝ²}
    (K : SelectedFourClass D.A center)
    (hcenterA : center ∈ D.A)
    (hzK : z ∈ K.support) (hwK : w ∈ K.support)
    (hzw : z ≠ w)
    (M : DistinctMutualCriticalFreshPair H (center := center)
      (K.support_subset_A hzK) (K.support_subset_A hwK)) : False := by
  rcases blocker_center_collision_of_mutualCriticalFreshPair
      H K hcenterA hzK hwK hzw
      M.toMutualCriticalFreshPair with hcz | hcw | hzwc
  · exact M.center_ne_zBlocker hcz
  · exact M.center_ne_wBlocker hcw
  · exact M.blockers_ne hzwc

/-- The weakest direct LowHit producer presently visible from the retained
critical map.  LowHit supplies three candidate sources; the new content is to
select two with the two reciprocal cross-incidences and separated blockers. -/
def LowHitFreshPairClosingProducer
    (D : CounterexampleData)
    (H : CriticalShellSystem D.A)
    {center x y a : ℝ²}
    (K : SelectedFourClass D.A center) : Prop :=
  LowHit K x y a →
    ∃ z w : ℝ²,
      ∃ hzK : z ∈ K.support,
      ∃ hwK : w ∈ K.support,
        z ∉ ({x, y, a} : Finset ℝ²) ∧
        w ∉ ({x, y, a} : Finset ℝ²) ∧
        z ≠ w ∧
        DistinctMutualCriticalFreshPair H (center := center)
          (K.support_subset_A hzK) (K.support_subset_A hwK)

/-- Once the explicit positive-incidence producer is supplied, a LowHit row
closes without any further finite classification. -/
theorem false_of_lowHit_of_freshPairClosingProducer
    (D : CounterexampleData)
    (H : CriticalShellSystem D.A)
    {center x y a : ℝ²}
    (K : SelectedFourClass D.A center)
    (hcenterA : center ∈ D.A)
    (hlow : LowHit K x y a)
    (produce : LowHitFreshPairClosingProducer
      (x := x) (y := y) (a := a) D H K) : False := by
  rcases produce hlow with
    ⟨z, w, hzK, hwK, _hzFresh, _hwFresh, hzw, M⟩
  exact false_of_distinctMutualCriticalFreshPair
    H K hcenterA hzK hwK hzw M

#print axioms lowHit_anchor_inter_card_le_one
#print axioms lowHit_three_le_fresh_support_card
#print axioms exists_three_fresh_sources_of_lowHit
#print axioms blocker_center_collision_of_mutualCriticalFreshPair
#print axioms support_collision_of_mutualCriticalFreshPair
#print axioms false_of_distinctMutualCriticalFreshPair
#print axioms false_of_lowHit_of_freshPairClosingProducer

end ATailLowHitResidualScratch
end Problem97
