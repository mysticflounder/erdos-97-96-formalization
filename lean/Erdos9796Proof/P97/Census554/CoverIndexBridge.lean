/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.BaseSat

/-!
# Bridge from semantic census cubes to the base cover encoding

This file connects the proof-facing `Finset` formulation of a census cube to
the bitmask candidate enumeration used by `CoverCnf.baseDimacs`.
-/

namespace Problem97
namespace Census554
namespace CoverIndexBridge

open CoverCnf

/-- Eleven-bit encoding of a semantic candidate class. -/
def classMask (K : Finset (Fin 11)) : Nat :=
  ∑ q ∈ K, 1 <<< q.val

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- A semantic candidate class has a mask in the encoder's candidate enumeration
for that center. -/
theorem classMask_mem_candMasks (p : Fin 11) (K : Finset (Fin 11))
    (hK : IsCandidateClass p K) :
    classMask K ∈ candMasks p.val := by
  native_decide +revert

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- Membership in a semantic class is the corresponding bit of `classMask`. -/
theorem classMask_testBit (K : Finset (Fin 11)) (a : Fin 11) :
    (classMask K).testBit a.val = decide (a ∈ K) := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- Bitmask intersection cardinality agrees with semantic intersection
cardinality for eleven-point classes. -/
theorem interCard_classMask (K L : Finset (Fin 11)) :
    interCard (classMask K) (classMask L) = (K ∩ L).card := by
  native_decide +revert

/-- The number of true entries in `List.range n` is the corresponding
indicator sum over `Finset.range n`. -/
theorem length_filter_range_eq_sum (f : Nat → Bool) (n : Nat) :
    ((List.range n).filter f).length =
      ∑ i ∈ Finset.range n, if f i then 1 else 0 := by
  induction n with
  | zero => simp
  | succ n ih =>
      rw [List.range_succ, List.filter_append, List.length_append,
        Finset.sum_range_succ]
      simp only [List.filter_singleton]
      rw [ih]
      cases f n <;> simp

/-- Index of a semantic candidate class in the encoder enumeration. -/
def coverIndexAt (p : Fin 11) (K : Finset (Fin 11)) : Nat :=
  (candMasks p.val).findIdx fun m => m == classMask K

/-- The semantic candidate's index is in range. -/
theorem coverIndexAt_lt (p : Fin 11) (K : Finset (Fin 11))
    (hK : IsCandidateClass p K) :
    coverIndexAt p K < candCount p.val := by
  rw [← candMasks_length p.isLt]
  apply List.findIdx_lt_length_of_exists
  exact ⟨classMask K, classMask_mem_candMasks p K hK, by simp⟩

/-- Looking up the semantic candidate's index recovers its exact bitmask. -/
theorem getD_coverIndexAt (p : Fin 11) (K : Finset (Fin 11))
    (hK : IsCandidateClass p K) :
    (candMasks p.val).getD (coverIndexAt p K) 0 = classMask K := by
  have hi : coverIndexAt p K < (candMasks p.val).length := by
    simpa only [candMasks_length p.isLt] using coverIndexAt_lt p K hK
  rw [List.getD_eq_getElem _ _ hi]
  have hfind := List.findIdx_getElem
    (p := fun m => m == classMask K) (xs := candMasks p.val) (w := hi)
  exact beq_iff_eq.mp hfind

/-- Total index function used by `BaseSat`; values outside `0..10` are
irrelevant and are set to zero. -/
def coverIndex (κ : Cube) (p : Nat) : Nat :=
  if hp : p < 11 then coverIndexAt ⟨p, hp⟩ (κ ⟨p, hp⟩) else 0

/-- Every valid center receives an in-range candidate index. -/
theorem coverIndex_lt_of_cubeOk {κ : Cube} (hκ : CubeOk κ)
    {p : Nat} (hp : p < 11) :
    coverIndex κ p < candCount p := by
  simp only [coverIndex, dif_pos hp]
  exact coverIndexAt_lt ⟨p, hp⟩ (κ ⟨p, hp⟩) (hκ.1 ⟨p, hp⟩)

/-- Looking up `coverIndex` recovers the exact semantic row mask. -/
theorem getD_coverIndex_of_cubeOk {κ : Cube} (hκ : CubeOk κ) (p : Fin 11) :
    (candMasks p.val).getD (coverIndex κ p.val) 0 = classMask (κ p) := by
  simp only [coverIndex, dif_pos p.isLt]
  exact getD_coverIndexAt p (κ p) (hκ.1 p)

/-- Point membership in the semantic row is exactly the selected candidate
mask's corresponding bit. -/
theorem coverIndex_testBit_of_cubeOk {κ : Cube} (hκ : CubeOk κ)
    (p a : Fin 11) :
    ((candMasks p.val).getD (coverIndex κ p.val) 0).testBit a.val =
      decide (a ∈ κ p) := by
  rw [getD_coverIndex_of_cubeOk hκ p, classMask_testBit]

/-- The selected candidate indices inherit the encoder's `C2` hypothesis. -/
theorem coverIndex_c2_of_cubeOk {κ : Cube} (hκ : CubeOk κ) :
    ∀ p q, p < 11 → q < 11 → p ≠ q →
      interCard ((candMasks p).getD (coverIndex κ p) 0)
        ((candMasks q).getD (coverIndex κ q) 0) ≤ 2 := by
  intro p q hp hq hpq
  let pf : Fin 11 := ⟨p, hp⟩
  let qf : Fin 11 := ⟨q, hq⟩
  have hpqf : pf ≠ qf := by
    intro h
    exact hpq (congrArg Fin.val h)
  rw [show p = pf.val from rfl, show q = qf.val from rfl,
    getD_coverIndex_of_cubeOk hκ pf, getD_coverIndex_of_cubeOk hκ qf,
    interCard_classMask]
  exact hκ.2.1 pf qf hpqf

/-- The selected candidate indices inherit the encoder's `C4` hypothesis. -/
theorem coverIndex_c4_of_cubeOk {κ : Cube} (hκ : CubeOk κ) :
    ∀ a b, a < 11 → b < 11 → a ≠ b →
      ((List.range 11).filter fun p =>
        ((candMasks p).getD (coverIndex κ p) 0).testBit a &&
          ((candMasks p).getD (coverIndex κ p) 0).testBit b).length ≤ 2 := by
  intro a b ha hb hab
  let af : Fin 11 := ⟨a, ha⟩
  let bf : Fin 11 := ⟨b, hb⟩
  have habf : af ≠ bf := by
    intro h
    exact hab (congrArg Fin.val h)
  rw [length_filter_range_eq_sum]
  rw [← Fin.sum_univ_eq_sum_range]
  have hsemantic := hκ.2.2 af bf habf
  rw [Finset.card_filter] at hsemantic
  simp_rw [show a = af.val from rfl, show b = bf.val from rfl,
    getD_coverIndex_of_cubeOk hκ, classMask_testBit]
  simpa only [
    Bool.and_eq_true, decide_eq_true_eq, Finset.mem_univ, true_and] using hsemantic

/-- A semantic `CubeOk` cube supplies one exact encoder index per center,
together with the row-bit equivalence and precisely the `C2`/`C4` hypotheses
consumed by `CoverCnf.baseDimacs_sat`. -/
theorem exists_coverIndex_of_cubeOk {κ : Cube} (hκ : CubeOk κ) :
    ∃ idx : Nat → Nat,
      (∀ p, p < 11 → idx p < candCount p) ∧
      (∀ p a : Fin 11,
        ((candMasks p.val).getD (idx p.val) 0).testBit a.val =
          decide (a ∈ κ p)) ∧
      (∀ p q, p < 11 → q < 11 → p ≠ q →
        interCard ((candMasks p).getD (idx p) 0)
          ((candMasks q).getD (idx q) 0) ≤ 2) ∧
      (∀ a b, a < 11 → b < 11 → a ≠ b →
        ((List.range 11).filter fun p =>
          ((candMasks p).getD (idx p) 0).testBit a &&
            ((candMasks p).getD (idx p) 0).testBit b).length ≤ 2) := by
  exact ⟨coverIndex κ, (fun p hp => coverIndex_lt_of_cubeOk hκ (p := p) hp),
    coverIndex_testBit_of_cubeOk hκ, coverIndex_c2_of_cubeOk hκ,
    coverIndex_c4_of_cubeOk hκ⟩

/-- The chosen `x` variable at every valid center is true under the full
`BaseSat.finalAssign` assignment built from the semantic cube. -/
theorem finalAssign_coverIndex_chosen_of_cubeOk {κ : Cube} (hκ : CubeOk κ)
    {p : Nat} (hp : p < 11) :
    finalAssign (coverIndex κ) (xVar p (coverIndex κ p)) = true := by
  rw [finalAssign_x (coverIndex κ) hp
    (coverIndex_lt_of_cubeOk hκ (p := p) hp)]
  exact baseAssign_chosen (coverIndex κ) hp

/-- The canonical assignment built from a semantic cube satisfies every
DIMACS clause in the base cover encoding. -/
theorem finalAssign_coverIndex_baseDimacs_sat_of_cubeOk
    {κ : Cube} (hκ : CubeOk κ) :
    ∀ c ∈ baseDimacs,
      evalClauseD (finalAssign (coverIndex κ)) c = true := by
  intro c hc
  simp only [baseDimacs, List.mem_append] at hc
  rcases hc with (hc | hc) | hc
  · exact onehot_sat (coverIndex κ)
      (fun p hp => coverIndex_lt_of_cubeOk hκ (p := p) hp) c hc
  · exact c2_sat (coverIndex κ)
      (fun p hp => coverIndex_lt_of_cubeOk hκ (p := p) hp)
      (coverIndex_c2_of_cubeOk hκ) c hc
  · exact c4_sat (coverIndex κ)
      (fun p hp => coverIndex_lt_of_cubeOk hκ (p := p) hp)
      (coverIndex_c4_of_cubeOk hκ) c hc

/-- The zero-based SAT assignment induced by `finalAssign` satisfies the
`Std.Sat.CNF` form of the base cover encoding. -/
theorem finalAssign_coverIndex_baseCnf_sat_of_cubeOk
    {κ : Cube} (hκ : CubeOk κ) :
    Std.Sat.CNF.eval (fun n => finalAssign (coverIndex κ) (n + 1))
      baseCnf = true := by
  rw [Std.Sat.CNF.eval, List.all_eq_true]
  intro cl hcl
  simp only [baseCnf, List.mem_map] at hcl
  obtain ⟨c, hc, rfl⟩ := hcl
  rw [evalClauseD_toLit (finalAssign (coverIndex κ)) c
    (baseDimacs_nonzero c hc)]
  exact finalAssign_coverIndex_baseDimacs_sat_of_cubeOk hκ c hc

/-- Packaged base-satisfaction interface: the same canonical `finalAssign`
assignment makes every chosen `x` variable true and satisfies both forms of
the base cover encoding. -/
theorem finalAssign_coverIndex_baseSat_of_cubeOk
    {κ : Cube} (hκ : CubeOk κ) :
    (∀ p, p < 11 →
      finalAssign (coverIndex κ) (xVar p (coverIndex κ p)) = true) ∧
    (∀ c ∈ baseDimacs,
      evalClauseD (finalAssign (coverIndex κ)) c = true) ∧
    Std.Sat.CNF.eval (fun n => finalAssign (coverIndex κ) (n + 1))
      baseCnf = true := by
  exact ⟨(fun _ hp => finalAssign_coverIndex_chosen_of_cubeOk hκ hp),
    finalAssign_coverIndex_baseDimacs_sat_of_cubeOk hκ,
    finalAssign_coverIndex_baseCnf_sat_of_cubeOk hκ⟩

end CoverIndexBridge
end Census554
end Problem97
