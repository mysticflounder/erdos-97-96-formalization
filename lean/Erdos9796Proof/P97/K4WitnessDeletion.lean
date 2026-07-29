import Erdos9796Proof.P97.Counting

/-!
# Witness-system deletion (Lemma D) and the `n = 9` corollary

Formalizes Lemma D and Corollary D9 from
`scratch/p97-search-lane/blocker-annotation-existence.md` §3, the
`census/p97_search` search lane's minimal-counterexample deletion step.

A **witness system** for a K4 configuration `A` assigns to each `y ∈ A` an
equidistant class `S y` of at least 4 other points of `A` (the `census`
lane's per-node blocker-annotation witness classes, `IsWitnessSystem`
below). Lemma D shows that deleting a point of in-degree 0 under `S`
(a point in nobody's witness class) leaves a K4 configuration, with every
surviving class unchanged. Corollary D9 uses it together with the banked
floor `counterexample_card_ge_nine` to show every 9-point K4 configuration
has, under every witness system, min in-degree ≥ 1.

Theorem C (the composition theorem discharging the census's per-cell
annotation-conditional claims into an unconditional one) is NOT formalized
here: per the source note (§5 item 3), it is a paper theorem over the
Python census coverage plus these two Lean lemmas, not a Lean-formalizable
statement itself.

Both theorems below are unconditional: their axiom closure is
`{propext, Classical.choice, Quot.sound}` (inherited from
`counterexample_card_ge_nine`, kernel-checked to that closure).
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

/-- A **witness system** for `A`: a choice, for each `y ∈ A`, of a class
`S y` of at least 4 *other* points of `A`, all at one common positive
distance from `y`. Matches the `census/p97_search` lane's per-node
blocker-annotation witness classes
(`scratch/p97-search-lane/blocker-annotation-existence.md` §2). -/
def IsWitnessSystem (A : Finset ℝ²) (S : ℝ² → Finset ℝ²) : Prop :=
  ∀ y ∈ A, S y ⊆ A.erase y ∧ 4 ≤ (S y).card ∧ ∃ r > 0, ∀ q ∈ S y, dist y q = r

/-- **Lemma D** (`blocker-annotation-existence.md` §3). If `x ∈ A` has
in-degree 0 under a witness system `S` — `x` lies in nobody's class — then
`A.erase x` is again a K4 configuration, and every surviving class `S y`
(`y ≠ x`) is unchanged: it already avoided `x`, so it remains a valid
witness class for `y` in `A.erase x`. -/
theorem K4_delete_of_indeg_zero {A : Finset ℝ²} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    {S : ℝ² → Finset ℝ²} (hS : IsWitnessSystem A S)
    {x : ℝ²} (hxA : x ∈ A) (hindeg0 : ∀ y ∈ A, x ∉ S y) :
    (A.erase x).Nonempty ∧ ConvexIndep (A.erase x) ∧
      HasNEquidistantProperty 4 (A.erase x) := by
  have h5 : 5 ≤ A.card := card_ge_five_of_K4 hne hK4
  have herase : (A.erase x).card = A.card - 1 := Finset.card_erase_of_mem hxA
  refine ⟨Finset.card_pos.mp (by omega), ConvexIndep.erase x hconv, ?_⟩
  intro y hy
  obtain ⟨hyx, hyA⟩ := Finset.mem_erase.mp hy
  obtain ⟨hSsub, hScard, r, hrpos, hSr⟩ := hS y hyA
  refine ⟨r, hrpos, ?_⟩
  have hSsub' : S y ⊆ (A.erase x).filter (fun q => dist y q = r) := by
    intro q hq
    have hqx : q ≠ x := by
      rintro rfl
      exact hindeg0 y hyA hq
    have hqA : q ∈ A := (Finset.mem_erase.mp (hSsub hq)).2
    exact Finset.mem_filter.mpr ⟨Finset.mem_erase.mpr ⟨hqx, hqA⟩, hSr q hq⟩
  exact hScard.trans (Finset.card_le_card hSsub')

/-- **Corollary D9** (`blocker-annotation-existence.md` §3). Every K4
configuration with exactly 9 points has, under every witness system, every
point with in-degree ≥ 1 — an in-degree-0 point would delete (Lemma D) to
an 8-point K4 configuration, contradicting the banked floor
`counterexample_card_ge_nine`. -/
theorem exists_witness_mem_of_card_eq_nine {A : Finset ℝ²} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hcard : A.card = 9) {S : ℝ² → Finset ℝ²} (hS : IsWitnessSystem A S)
    {x : ℝ²} (hxA : x ∈ A) : ∃ y ∈ A, x ∈ S y := by
  by_contra hcon
  push_neg at hcon
  obtain ⟨hne', hconv', hK4'⟩ :=
    K4_delete_of_indeg_zero hne hconv hK4 hS hxA hcon
  have h9 : 9 ≤ (A.erase x).card := counterexample_card_ge_nine hne' hconv' hK4'
  have herase : (A.erase x).card = A.card - 1 := Finset.card_erase_of_mem hxA
  omega

end Problem97
