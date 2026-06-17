import Erdos9796Proof.P97.Foundation
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Finset.Powerset

/-!
# Isosceles count for Erdős Problem 97 (Dumitrescu lower bound, Milestone 3)

Defines the per-vertex and total isosceles count of a finite point set,
in the Dumitrescu 2006 / Nivasch–Pach–Pinchasi–Zerbib 2012 convention
(equilaterals counted three times), and proves the easy lower bound:

  Per-vertex `K4` ⇒ each vertex contributes `≥ C(4,2) = 6` isosceles pairs.
  Summing: `6 · |A| ≤ I(A)`.

The matching upper bound `I(A) ≤ (11·|A|²−18·|A|)/12` for convex point
sets is Dumitrescu 2006 eq. (5), still open
(`p97-isosceles-count-upper-bound`).

References: doc slug `p97-isosceles-obstruction`.
-/

set_option linter.style.openClassical false

open scoped EuclideanGeometry
open Finset Classical

namespace Problem97

/-- Unordered pairs of points in `A.erase p` at common distance from `p`.
Each such pair witnesses one isosceles triangle with apex `p`. -/
noncomputable def IsoscelesPairsAt (A : Finset ℝ²) (p : ℝ²) : Finset (Finset ℝ²) :=
  ((A.erase p).powersetCard 2).filter (fun s => ∃ r : ℝ, ∀ q ∈ s, dist p q = r)

/-- The number of isosceles triangles with apex `p`. -/
noncomputable def iCountAt (A : Finset ℝ²) (p : ℝ²) : ℕ := (IsoscelesPairsAt A p).card

/-- Total isosceles count of `A`, equilaterals counted 3× (Dumitrescu 2006). -/
noncomputable def iCount (A : Finset ℝ²) : ℕ := ∑ p ∈ A, iCountAt A p

/-- Every two-point subset of an equidistant finite set contributes an
isosceles pair at the same apex. -/
theorem powersetCard_two_subset_isoscelesPairsAt_of_equidistant_subset
    (A : Finset ℝ²) (p : ℝ²) (S : Finset ℝ²)
    (hSsub : S ⊆ A.erase p)
    (hSdist : ∃ r : ℝ, ∀ q ∈ S, dist p q = r) :
    S.powersetCard 2 ⊆ IsoscelesPairsAt A p := by
  rcases hSdist with ⟨r, hdist⟩
  intro t ht
  rcases mem_powersetCard.mp ht with ⟨htsub, htcard⟩
  refine mem_filter.mpr ⟨?_, ⟨r, ?_⟩⟩
  · exact mem_powersetCard.mpr ⟨htsub.trans hSsub, htcard⟩
  · intro q hqt
    exact hdist q (htsub hqt)

/-- A set of equidistant neighbours gives at least `choose(card, 2)`
isosceles pairs at the apex. -/
theorem iCountAt_ge_choose_two_of_equidistant_subset
    (A : Finset ℝ²) (p : ℝ²) (S : Finset ℝ²)
    (hSsub : S ⊆ A.erase p)
    (hSdist : ∃ r : ℝ, ∀ q ∈ S, dist p q = r) :
    S.card.choose 2 ≤ iCountAt A p := by
  calc
    S.card.choose 2 = (S.powersetCard 2).card := (S.card_powersetCard 2).symm
    _ ≤ iCountAt A p :=
      card_le_card (powersetCard_two_subset_isoscelesPairsAt_of_equidistant_subset
        A p S hSsub hSdist)

/-- Five equidistant neighbours force at least ten isosceles pairs at the
apex. This is the local-counting form used by A1 positive-excess certificates
when a selected four-class has a fifth point at the same radius. -/
theorem iCountAt_ge_ten_of_five_equidistant
    (A : Finset ℝ²) (p : ℝ²) (S : Finset ℝ²)
    (hScard : 5 ≤ S.card)
    (hSsub : S ⊆ A.erase p)
    (hSdist : ∃ r : ℝ, ∀ q ∈ S, dist p q = r) :
    10 ≤ iCountAt A p := by
  calc
    10 = (5 : ℕ).choose 2 := by decide
    _ ≤ S.card.choose 2 := Nat.choose_le_choose 2 hScard
    _ ≤ iCountAt A p := iCountAt_ge_choose_two_of_equidistant_subset A p S hSsub hSdist

/-- A four-point equidistant class plus one additional equal-distance pair not
already contained in that class forces at least seven isosceles pairs at the
apex. This is the local-counting form used by A1 positive-excess certificates
when an extra pair appears outside the selected four-class. -/
theorem iCountAt_ge_seven_of_four_class_and_extra_pair
    (A : Finset ℝ²) (p : ℝ²) (T : Finset ℝ²) (u v : ℝ²)
    (hTcard : 4 ≤ T.card)
    (hTsub : T ⊆ A.erase p)
    (hTdist : ∃ r : ℝ, ∀ q ∈ T, dist p q = r)
    (hpair_sub : ({u, v} : Finset ℝ²) ⊆ A.erase p)
    (hpair_card : ({u, v} : Finset ℝ²).card = 2)
    (hpair_dist : ∃ r : ℝ, ∀ q ∈ ({u, v} : Finset ℝ²), dist p q = r)
    (hu_not_mem_T : u ∉ T) :
    7 ≤ iCountAt A p := by
  let pair : Finset ℝ² := {u, v}
  have hTpow_sub : T.powersetCard 2 ⊆ IsoscelesPairsAt A p :=
    powersetCard_two_subset_isoscelesPairsAt_of_equidistant_subset A p T hTsub hTdist
  have hpair_mem_iso : pair ∈ IsoscelesPairsAt A p := by
    refine mem_filter.mpr ⟨?_, hpair_dist⟩
    exact mem_powersetCard.mpr ⟨hpair_sub, hpair_card⟩
  have hpair_not_mem_Tpow : pair ∉ T.powersetCard 2 := by
    intro hmem
    have hsubT : pair ⊆ T := (mem_powersetCard.mp hmem).1
    have hu_pair : u ∈ pair := by simp [pair]
    exact hu_not_mem_T (hsubT hu_pair)
  have hinsert_sub : insert pair (T.powersetCard 2) ⊆ IsoscelesPairsAt A p := by
    intro x hx
    rcases mem_insert.mp hx with hxpair | hxT
    · simpa [hxpair] using hpair_mem_iso
    · exact hTpow_sub hxT
  have hSix : 6 ≤ (T.powersetCard 2).card := by
    calc
      6 = (4 : ℕ).choose 2 := by decide
      _ ≤ T.card.choose 2 := Nat.choose_le_choose 2 hTcard
      _ = (T.powersetCard 2).card := (T.card_powersetCard 2).symm
  have hSeven : 7 ≤ (insert pair (T.powersetCard 2)).card := by
    rw [card_insert_of_notMem hpair_not_mem_Tpow]
    simpa using Nat.add_le_add_right hSix 1
  exact le_trans hSeven (card_le_card hinsert_sub)

/-- **Per-vertex isosceles count lower bound under K4.**  Each vertex with 4
equidistant neighbors witnesses at least `C(4,2) = 6` isosceles pairs. -/
theorem iCountAt_ge_six_of_K4 (A : Finset ℝ²) (p : ℝ²)
    (hp : HasNEquidistantPointsAt 4 A p) : 6 ≤ iCountAt A p := by
  obtain ⟨r, hrpos, hcount⟩ := hp
  -- Let `S` be the 4-equidistant class at `p`.
  set S : Finset ℝ² := A.filter (fun q => dist p q = r) with hS
  have hScard : 4 ≤ S.card := hcount
  -- `S ⊆ A.erase p`: every element of `S` is in `A` at positive distance from `p`.
  have hSsub : S ⊆ A.erase p := by
    intro q hqS
    rcases mem_filter.mp hqS with ⟨hqA, hqr⟩
    refine mem_erase.mpr ⟨?_, hqA⟩
    intro hqp; rw [hqp] at hqr; rw [dist_self] at hqr; linarith
  -- Every 2-element subset of `S` is in `IsoscelesPairsAt A p`.
  have hsubInIso : S.powersetCard 2 ⊆ IsoscelesPairsAt A p := by
    intro t ht
    rcases mem_powersetCard.mp ht with ⟨htsub, htcard⟩
    refine mem_filter.mpr ⟨?_, ⟨r, ?_⟩⟩
    · exact mem_powersetCard.mpr ⟨htsub.trans hSsub, htcard⟩
    · intro q hqt
      exact (mem_filter.mp (htsub hqt)).2
  -- Cardinality bookkeeping: `C(S.card, 2) ≥ C(4, 2) = 6`.
  calc 6 = (4 : ℕ).choose 2 := by decide
    _ ≤ S.card.choose 2 := Nat.choose_le_choose 2 hScard
    _ = (S.powersetCard 2).card := (S.card_powersetCard 2).symm
    _ ≤ iCountAt A p := card_le_card hsubInIso

/-- **Total isosceles count lower bound under K4.**  Summing the per-vertex
bound `iCountAt_ge_six_of_K4` over all `p ∈ A`. -/
theorem six_mul_card_le_iCount_of_K4 {A : Finset ℝ²}
    (hK4 : HasNEquidistantProperty 4 A) : 6 * A.card ≤ iCount A := by
  classical
  unfold iCount
  have hpoint : ∀ p ∈ A, 6 ≤ iCountAt A p :=
    fun p hp => iCountAt_ge_six_of_K4 A p (hK4 p hp)
  calc 6 * A.card
      = ∑ _p ∈ A, 6 := by rw [sum_const, smul_eq_mul, mul_comm]
    _ ≤ ∑ p ∈ A, iCountAt A p := sum_le_sum hpoint

/-- **Strict total-count lower bound from one excess apex.** If every vertex
has a `K4` class and one apex contributes at least seven isosceles pairs, then
the total count is at least one above the `6 * |A|` exact-minimal baseline. -/
theorem six_mul_card_add_one_le_iCount_of_K4_of_iCountAt_ge_seven {A : Finset ℝ²}
    (hK4 : HasNEquidistantProperty 4 A) {p : ℝ²} (hpA : p ∈ A)
    (hpExtra : 7 ≤ iCountAt A p) :
    6 * A.card + 1 ≤ iCount A := by
  classical
  unfold iCount
  rw [← Finset.sum_erase_add _ _ hpA]
  have hcard : A.card = (A.erase p).card + 1 := by
    rw [← card_insert_of_notMem]
    · rw [insert_erase hpA]
    · simp
  have hsum : 6 * (A.erase p).card ≤ ∑ q ∈ A.erase p, iCountAt A q := by
    calc
      6 * (A.erase p).card = ∑ _q ∈ A.erase p, 6 := by
        rw [sum_const, smul_eq_mul, mul_comm]
      _ ≤ ∑ q ∈ A.erase p, iCountAt A q := by
        refine sum_le_sum ?_
        intro q hq
        exact iCountAt_ge_six_of_K4 A q (hK4 q (mem_of_mem_erase hq))
  rw [hcard]
  calc
    6 * ((A.erase p).card + 1) + 1 = 6 * (A.erase p).card + 7 := by omega
    _ ≤ (∑ q ∈ A.erase p, iCountAt A q) + iCountAt A p := Nat.add_le_add hsum hpExtra

/-- In an `n = 9` `K4` configuration, one apex with seven isosceles pairs
forces total isosceles count at least `55`. -/
theorem fifty_five_le_iCount_of_card_nine_K4_of_iCountAt_ge_seven {A : Finset ℝ²}
    (hcard : A.card = 9) (hK4 : HasNEquidistantProperty 4 A) {p : ℝ²} (hpA : p ∈ A)
    (hpExtra : 7 ≤ iCountAt A p) :
    55 ≤ iCount A := by
  have h :=
    six_mul_card_add_one_le_iCount_of_K4_of_iCountAt_ge_seven hK4 hpA hpExtra
  rw [hcard] at h
  norm_num at h
  exact h

/-- Certificate interface for the A1 fifth-point shape: in an `n = 9` `K4`
configuration, five equidistant neighbours at one apex force total isosceles
count at least `55`. -/
theorem fifty_five_le_iCount_of_card_nine_K4_of_five_equidistant {A : Finset ℝ²}
    (hcard : A.card = 9) (hK4 : HasNEquidistantProperty 4 A)
    {p : ℝ²} (hpA : p ∈ A) {S : Finset ℝ²}
    (hScard : 5 ≤ S.card)
    (hSsub : S ⊆ A.erase p)
    (hSdist : ∃ r : ℝ, ∀ q ∈ S, dist p q = r) :
    55 ≤ iCount A := by
  have hlocal : 10 ≤ iCountAt A p :=
    iCountAt_ge_ten_of_five_equidistant A p S hScard hSsub hSdist
  exact fifty_five_le_iCount_of_card_nine_K4_of_iCountAt_ge_seven hcard hK4 hpA
    (le_trans (by decide : 7 ≤ 10) hlocal)

/-- Certificate interface for the A1 extra-pair shape: in an `n = 9` `K4`
configuration, a four-point equidistant class plus one extra equal-distance
pair at one apex force total isosceles count at least `55`. -/
theorem fifty_five_le_iCount_of_card_nine_K4_of_four_class_and_extra_pair {A : Finset ℝ²}
    (hcard : A.card = 9) (hK4 : HasNEquidistantProperty 4 A)
    {p u v : ℝ²} (hpA : p ∈ A) {T : Finset ℝ²}
    (hTcard : 4 ≤ T.card)
    (hTsub : T ⊆ A.erase p)
    (hTdist : ∃ r : ℝ, ∀ q ∈ T, dist p q = r)
    (hpair_sub : ({u, v} : Finset ℝ²) ⊆ A.erase p)
    (hpair_card : ({u, v} : Finset ℝ²).card = 2)
    (hpair_dist : ∃ r : ℝ, ∀ q ∈ ({u, v} : Finset ℝ²), dist p q = r)
    (hu_not_mem_T : u ∉ T) :
    55 ≤ iCount A := by
  have hlocal : 7 ≤ iCountAt A p :=
    iCountAt_ge_seven_of_four_class_and_extra_pair A p T u v hTcard hTsub hTdist
      hpair_sub hpair_card hpair_dist hu_not_mem_T
  exact fifty_five_le_iCount_of_card_nine_K4_of_iCountAt_ge_seven hcard hK4 hpA hlocal

end Problem97
