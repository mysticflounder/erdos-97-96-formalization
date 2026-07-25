/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.DeletionRobustness
import Erdos9796Proof.P97.SmallerCounterexample
import Erdos9796Proof.P97.U1TwoShortCapReduction

/-!
# Minimality forces a unique-four cover of the carrier

Global minimality is carried unchanged all the way down the ATAIL frontier
(`FrontierCommonDeletionParentResidual.minimal`), but downstream it is only
ever spent as a discharge: a residual produces a removable vertex and
minimality refutes it.  This module extracts the *positive* content instead.

If no carrier point is removable then for every `x ∈ A` some other point `p`
loses its whole K4 witness when `x` goes.  Selected classes at a common center
with different radii are disjoint, so a center that keeps a four-class after
deleting `x` can only be broken by a point lying in *every* one of its
four-classes.  That forces the broken center to carry exactly one K4 radius,
with a class of exactly four points, containing `x`.

Recorded here, all general in `n` and free of cap or packet data:

* `exists_isUniqueFourCenter_of_minimal` — every carrier point lies in the
  four-point class of a unique-four center distinct from it.
* `not_isUniqueFourCenter_of_fullyDeletionRobust` — a deletion-robust center is
  never a unique-four center, so robust apices never serve as witnesses.
* `card_le_four_mul_uniqueFourCenters` — those centers cover the carrier by
  four-point classes, hence `|A| ≤ 4 * |U|`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailMinimalUniqueFourCover

open ATailDeletionRobustness

attribute [local instance] Classical.propDecidable

/-- A center carrying exactly one K4 radius, whose class has exactly four
points.  Deleting any member of that class destroys the center's witness. -/
def IsUniqueFourCenter (A : Finset ℝ²) (p : ℝ²) : Prop :=
  p ∈ A ∧ ∃ r : ℝ, 0 < r ∧ (SelectedClass A p r).card = 4 ∧
    ∀ ρ : ℝ, 0 < ρ → 4 ≤ (SelectedClass A p ρ).card → ρ = r

/-- Selected classes at a common center with distinct radii are disjoint: a
point of both would have two different distances to the center. -/
theorem selectedClass_radius_unique_of_mem
    {A : Finset ℝ²} {p x : ℝ²} {r ρ : ℝ}
    (hr : x ∈ SelectedClass A p r) (hρ : x ∈ SelectedClass A p ρ) :
    r = ρ := by
  have h1 := (mem_selectedClass.mp hr).2
  have h2 := (mem_selectedClass.mp hρ).2
  rw [← h1, ← h2]

/-- The four-point class of a center that has one, and `∅` otherwise.  At a
`IsUniqueFourCenter` the choice is pinned by `uniqueFourClass_eq`. -/
noncomputable def uniqueFourClass (A : Finset ℝ²) (p : ℝ²) : Finset ℝ² :=
  if h : ∃ r : ℝ, 0 < r ∧ (SelectedClass A p r).card = 4 then
    SelectedClass A p h.choose
  else ∅

theorem uniqueFourClass_card_le (A : Finset ℝ²) (p : ℝ²) :
    (uniqueFourClass A p).card ≤ 4 := by
  classical
  unfold uniqueFourClass
  by_cases h : ∃ r : ℝ, 0 < r ∧ (SelectedClass A p r).card = 4
  · rw [dif_pos h]
    exact le_of_eq h.choose_spec.2
  · rw [dif_neg h]
    simp

/-- At a unique-four center the selector returns the one four-class. -/
theorem uniqueFourClass_eq
    {A : Finset ℝ²} {p : ℝ²} (hp : IsUniqueFourCenter A p)
    {r : ℝ} (hr : 0 < r) (hcard : (SelectedClass A p r).card = 4) :
    uniqueFourClass A p = SelectedClass A p r := by
  classical
  obtain ⟨-, r₀, hr₀pos, hr₀card, huniq⟩ := hp
  have hex : ∃ ρ : ℝ, 0 < ρ ∧ (SelectedClass A p ρ).card = 4 := ⟨r, hr, hcard⟩
  have hspec := hex.choose_spec
  have hchoice : hex.choose = r₀ :=
    huniq hex.choose hspec.1 (le_of_eq hspec.2.symm)
  have hr' : r = r₀ := huniq r hr (le_of_eq hcard.symm)
  unfold uniqueFourClass
  rw [dif_pos hex, hchoice, hr']

/-- **Minimality cover.**  In a minimal counterexample every carrier point `x`
lies in the four-point class of some *other* point `p`, and `p` carries no K4
radius other than that one.

This is the positive form of `not_isRemovableVertex_of_minimal`: `A.erase x`
must fail the K4 property somewhere, and the failing center is forced into the
unique-four shape. -/
theorem exists_isUniqueFourCenter_of_minimal
    {D : CounterexampleData} (hmin : D.Minimal) {x : ℝ²} (hx : x ∈ D.A) :
    ∃ p : ℝ², ∃ r : ℝ, p ≠ x ∧ IsUniqueFourCenter D.A p ∧
      0 < r ∧ (SelectedClass D.A p r).card = 4 ∧
      x ∈ SelectedClass D.A p r := by
  classical
  have hnrem : ¬ IsRemovableVertex D.A x :=
    CounterexampleData.not_isRemovableVertex_of_minimal hmin x
  have hfail : ¬ HasNEquidistantProperty 4 (D.A.erase x) := fun h =>
    hnrem ⟨hx, h⟩
  -- Some center of `A.erase x` has no surviving four-class.
  obtain ⟨p, hpErase, hpNoFour⟩ :
      ∃ p ∈ D.A.erase x, ¬ HasNEquidistantPointsAt 4 (D.A.erase x) p := by
    by_contra hcon
    push_neg at hcon
    exact hfail fun p hp => hcon p hp
  have hpx : p ≠ x := Finset.ne_of_mem_erase hpErase
  have hpA : p ∈ D.A := Finset.mem_of_mem_erase hpErase
  -- Restated: every class at `p` drops below four when `x` goes.
  have hsmall : ∀ ρ : ℝ, 0 < ρ →
      ((SelectedClass D.A p ρ).erase x).card ≤ 3 := by
    intro ρ hρ
    by_contra hge
    push_neg at hge
    refine hpNoFour ⟨ρ, hρ, ?_⟩
    have hEq : SelectedClass (D.A.erase x) p ρ =
        (SelectedClass D.A p ρ).erase x := selectedClass_erase_eq D.A x p ρ
    have hfour : 4 ≤ (SelectedClass (D.A.erase x) p ρ).card := by
      rw [hEq]; omega
    simpa [SelectedClass] using hfour
  -- Hence any four-class at `p` contains `x` and has exactly four points.
  have hkey : ∀ ρ : ℝ, 0 < ρ → 4 ≤ (SelectedClass D.A p ρ).card →
      x ∈ SelectedClass D.A p ρ ∧ (SelectedClass D.A p ρ).card = 4 := by
    intro ρ hρ hcard
    have hs := hsmall ρ hρ
    by_cases hmem : x ∈ SelectedClass D.A p ρ
    · refine ⟨hmem, ?_⟩
      rw [Finset.card_erase_of_mem hmem] at hs
      omega
    · exfalso
      have hsub : SelectedClass D.A p ρ ⊆ (SelectedClass D.A p ρ).erase x :=
        Finset.subset_erase.mpr ⟨Finset.Subset.refl _, hmem⟩
      have := Finset.card_le_card hsub
      omega
  -- `p` is a carrier point, so it has some four-class to begin with.
  obtain ⟨r, hrpos, hrcard⟩ := D.K4 p hpA
  have hrcard' : 4 ≤ (SelectedClass D.A p r).card := by
    simpa [SelectedClass] using hrcard
  obtain ⟨hxr, hcard4⟩ := hkey r hrpos hrcard'
  refine ⟨p, r, hpx, ⟨hpA, r, hrpos, hcard4, ?_⟩, hrpos, hcard4, hxr⟩
  -- Uniqueness: `x` lies in every four-class at `p`, and classes at a common
  -- center with distinct radii are disjoint.
  intro ρ hρ hcard
  exact selectedClass_radius_unique_of_mem (hkey ρ hρ hcard).1 hxr

/-- A deletion-robust center is never a unique-four center: deleting a member
of its single class leaves three equidistant points, and no other radius can
take over. -/
theorem not_isUniqueFourCenter_of_fullyDeletionRobust
    {D : CounterexampleData} {c : ℝ²}
    (hrob : FullyDeletionRobustAt D c) :
    ¬ IsUniqueFourCenter D.A c := by
  classical
  rintro ⟨-, r, hrpos, hcard, huniq⟩
  obtain ⟨z, hz⟩ : (SelectedClass D.A c r).Nonempty := by
    rw [← Finset.card_pos, hcard]; omega
  have hzA : z ∈ D.A := (mem_selectedClass.mp hz).1
  obtain ⟨ρ, hρpos, hρcard⟩ := hrob.survives z hzA
  have hEq : SelectedClass (D.A.erase z) c ρ =
      (SelectedClass D.A c ρ).erase z := selectedClass_erase_eq D.A z c ρ
  have hρcard' : 4 ≤ ((SelectedClass D.A c ρ).erase z).card := by
    rw [← hEq]
    simpa [SelectedClass] using hρcard
  have hfull : 4 ≤ (SelectedClass D.A c ρ).card :=
    hρcard'.trans Finset.card_erase_le
  have hρr : ρ = r := huniq ρ hρpos hfull
  subst hρr
  rw [Finset.card_erase_of_mem hz, hcard] at hρcard'
  omega

/-- A center carrying a class of five or more points is deletion robust: one
deletion leaves at least four. -/
theorem fullyDeletionRobustAt_of_large_class
    {D : CounterexampleData} {c : ℝ²} {r : ℝ} (hr : 0 < r)
    (hcard : 5 ≤ (SelectedClass D.A c r).card) :
    FullyDeletionRobustAt D c := by
  classical
  refine ⟨fun z _ => ⟨r, hr, ?_⟩⟩
  have hEq : SelectedClass (D.A.erase z) c r =
      (SelectedClass D.A c r).erase z := selectedClass_erase_eq D.A z c r
  have hpred := Finset.pred_card_le_card_erase (s := SelectedClass D.A c r) (a := z)
  have hfour : 4 ≤ (SelectedClass (D.A.erase z) c r).card := by
    rw [hEq]; omega
  simpa [SelectedClass] using hfour

/-- A center carrying two distinct K4 radii is deletion robust: classes at a
common center with distinct radii are disjoint, so one deletion cannot break
both. -/
theorem fullyDeletionRobustAt_of_two_K4_radii
    {D : CounterexampleData} {c : ℝ²} {r₁ r₂ : ℝ}
    (hr₁ : 0 < r₁) (hr₂ : 0 < r₂) (hne : r₁ ≠ r₂)
    (h₁ : 4 ≤ (SelectedClass D.A c r₁).card)
    (h₂ : 4 ≤ (SelectedClass D.A c r₂).card) :
    FullyDeletionRobustAt D c := by
  classical
  refine ⟨fun z _ => ?_⟩
  by_cases hz : z ∈ SelectedClass D.A c r₁
  · -- `z` cannot also lie on the second radius, so that class survives whole.
    have hznot : z ∉ SelectedClass D.A c r₂ := fun hz₂ =>
      hne (selectedClass_radius_unique_of_mem hz hz₂)
    refine ⟨r₂, hr₂, ?_⟩
    have hEq : SelectedClass (D.A.erase z) c r₂ =
        (SelectedClass D.A c r₂).erase z := selectedClass_erase_eq D.A z c r₂
    have hsub : SelectedClass D.A c r₂ ⊆ (SelectedClass D.A c r₂).erase z :=
      Finset.subset_erase.mpr ⟨Finset.Subset.refl _, hznot⟩
    have hfour : 4 ≤ (SelectedClass (D.A.erase z) c r₂).card := by
      rw [hEq]; exact h₂.trans (Finset.card_le_card hsub)
    simpa [SelectedClass] using hfour
  · refine ⟨r₁, hr₁, ?_⟩
    have hEq : SelectedClass (D.A.erase z) c r₁ =
        (SelectedClass D.A c r₁).erase z := selectedClass_erase_eq D.A z c r₁
    have hsub : SelectedClass D.A c r₁ ⊆ (SelectedClass D.A c r₁).erase z :=
      Finset.subset_erase.mpr ⟨Finset.Subset.refl _, hz⟩
    have hfour : 4 ≤ (SelectedClass (D.A.erase z) c r₁).card := by
      rw [hEq]; exact h₁.trans (Finset.card_le_card hsub)
    simpa [SelectedClass] using hfour

/-- **Converse of `not_isUniqueFourCenter_of_fullyDeletionRobust`.**  A carrier
point that fails deletion robustness is exactly a unique-four center.

Together the two directions say `¬ FullyDeletionRobustAt D p ↔
IsUniqueFourCenter D.A p` for `p ∈ D.A`, which turns the cover bound into a
statement about robustness alone: at most a quarter of the carrier can be
deletion robust's complement, i.e. `|A| ≤ 4 * |{p ∈ A : ¬ robust at p}|`. -/
theorem isUniqueFourCenter_of_not_fullyDeletionRobust
    {D : CounterexampleData} {c : ℝ²} (hc : c ∈ D.A)
    (hnr : ¬ FullyDeletionRobustAt D c) :
    IsUniqueFourCenter D.A c := by
  classical
  obtain ⟨r, hrpos, hrcard⟩ := D.K4 c hc
  have hr4 : 4 ≤ (SelectedClass D.A c r).card := by
    simpa [SelectedClass] using hrcard
  have huniq : ∀ ρ : ℝ, 0 < ρ → 4 ≤ (SelectedClass D.A c ρ).card → ρ = r := by
    intro ρ hρ hρcard
    by_contra hne
    exact hnr (fullyDeletionRobustAt_of_two_K4_radii hρ hrpos hne hρcard hr4)
  have hle : (SelectedClass D.A c r).card ≤ 4 := by
    by_contra hgt
    push_neg at hgt
    exact hnr (fullyDeletionRobustAt_of_large_class hrpos (by omega))
  exact ⟨hc, r, hrpos, le_antisymm hle hr4, huniq⟩

/-- **Cover bound.**  The unique-four centers of a minimal counterexample cover
the carrier by classes of exactly four points, so the carrier has at most four
times as many points as there are unique-four centers. -/
theorem card_le_four_mul_uniqueFourCenters
    {D : CounterexampleData} (hmin : D.Minimal) :
    D.A.card ≤
      4 * (D.A.filter (fun p => IsUniqueFourCenter D.A p)).card := by
  classical
  set U : Finset ℝ² := D.A.filter (fun p => IsUniqueFourCenter D.A p) with hU
  have hcover : D.A ⊆ U.biUnion (fun p => uniqueFourClass D.A p) := by
    intro x hx
    obtain ⟨p, r, -, hp, hrpos, hcard, hxr⟩ :=
      exists_isUniqueFourCenter_of_minimal hmin hx
    have hpU : p ∈ U := Finset.mem_filter.mpr ⟨hp.1, hp⟩
    refine Finset.mem_biUnion.mpr ⟨p, hpU, ?_⟩
    rw [uniqueFourClass_eq hp hrpos hcard]
    exact hxr
  calc
    D.A.card ≤ (U.biUnion (fun p => uniqueFourClass D.A p)).card :=
      Finset.card_le_card hcover
    _ ≤ ∑ p ∈ U, (uniqueFourClass D.A p).card := Finset.card_biUnion_le
    _ ≤ ∑ _p ∈ U, 4 :=
      Finset.sum_le_sum fun p _ => uniqueFourClass_card_le D.A p
    _ = 4 * U.card := by
      rw [Finset.sum_const, smul_eq_mul, mul_comm]

/-- The carrier points at which deletion robustness fails. -/
noncomputable def notRobustCenters (D : CounterexampleData) : Finset ℝ² :=
  D.A.filter (fun p => ¬ FullyDeletionRobustAt D p)

/-- **The cover bound in robustness form.**  By the two directions above the
unique-four centers are exactly the points where deletion robustness fails, so
the cover bound reads `|A| ≤ 4 * |non-robust points|`.

This is the sharpest statement of what an ATAIL terminal has to produce: a
contradiction needs MORE than three quarters of the carrier to be deletion
robust.  Harvesting robustness at distinguished points yields a bounded number
of them, so no fixed number of such harvests reaches this bound as `n` grows. -/
theorem card_le_four_mul_notRobustCenters
    {D : CounterexampleData} (hmin : D.Minimal) :
    D.A.card ≤ 4 * (notRobustCenters D).card := by
  classical
  refine (card_le_four_mul_uniqueFourCenters hmin).trans ?_
  refine Nat.mul_le_mul_left 4 (Finset.card_le_card ?_)
  intro p hp
  rcases Finset.mem_filter.mp hp with ⟨hpA, hpU⟩
  exact Finset.mem_filter.mpr
    ⟨hpA, fun hrob => not_isUniqueFourCenter_of_fullyDeletionRobust hrob hpU⟩

end ATailMinimalUniqueFourCover
end Problem97
