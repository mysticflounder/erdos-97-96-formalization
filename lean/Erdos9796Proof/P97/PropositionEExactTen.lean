/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Foundation
import Erdos9796Proof.P97.ArcBlockContiguity
import Erdos9796Proof.P97.ConvexCyclicOrder.Construct
import Erdos9796Proof.P97.ConvexIndepHelpers
import Erdos9796Proof.P97.SignedAreaOangle
import Erdos9796Proof.P97.Cap.PartitionFromMEC
import Erdos9796Proof.P97.U1TwoShortCapReduction
import Erdos9796Proof.P97.U2EquilateralMECFromM44

/-!
# Proposition E at exact cardinality ten

This is the local port of the verified Proposition E core and gauge assembly.
It is a conditional theorem bank: it rules out a ten-point counterexample once
`IsM44` and the U2 full-distance-class hypothesis are supplied. It is not an
unconditional closure of the live cardinality-ten route.

The primary terminal exposes exactly the U2 component used by the proof.
`propositionE_n10` is retained as a compatibility wrapper for callers that
already have the bundled `U2Statement`.
-/

set_option linter.style.moduleDocstring false

open scoped EuclideanGeometry
open Finset

namespace Problem97

/-- **SEP — chord separation of shared equidistant points.**
If `x ≠ y` are both equidistant from `c` and from `d` (`c ≠ d` not needed),
then their signed areas against the chord `(c,d)` are negatives. -/
theorem sep_signedArea2 (x y c d : ℝ²)
    (hxc : dist x c = dist y c) (hxd : dist x d = dist y d) (hxy : x ≠ y) :
    signedArea2 x c d = - signedArea2 y c d := by
  have Hc : (x 0 - c 0) ^ 2 + (x 1 - c 1) ^ 2
      = (y 0 - c 0) ^ 2 + (y 1 - c 1) ^ 2 := by
    have h : dist x c ^ 2 = dist y c ^ 2 := by rw [hxc]
    rw [dist_sq_coord, dist_sq_coord] at h
    exact h
  have Hd : (x 0 - d 0) ^ 2 + (x 1 - d 1) ^ 2
      = (y 0 - d 0) ^ 2 + (y 1 - d 1) ^ 2 := by
    have h : dist x d ^ 2 = dist y d ^ 2 := by rw [hxd]
    rw [dist_sq_coord, dist_sq_coord] at h
    exact h
  -- dot products of n = y - x with (c - m), (d - m), m = midpoint, vanish
  have hnp : (y 0 - x 0) * (c 0 - (x 0 + y 0) / 2)
      + (y 1 - x 1) * (c 1 - (x 1 + y 1) / 2) = 0 := by
    linear_combination Hc / 2
  have hnq : (y 0 - x 0) * (d 0 - (x 0 + y 0) / 2)
      + (y 1 - x 1) * (d 1 - (x 1 + y 1) / 2) = 0 := by
    linear_combination Hd / 2
  -- master identity, then divide by ‖n‖² > 0
  have key : ((y 0 - x 0) ^ 2 + (y 1 - x 1) ^ 2)
      * (signedArea2 x c d + signedArea2 y c d) = 0 := by
    simp only [signedArea2]
    linear_combination
      (2 * ((y 0 - x 0) * (d 1 - (x 1 + y 1) / 2)
          - (y 1 - x 1) * (d 0 - (x 0 + y 0) / 2))) * hnp
      - (2 * ((y 0 - x 0) * (c 1 - (x 1 + y 1) / 2)
          - (y 1 - x 1) * (c 0 - (x 0 + y 0) / 2))) * hnq
  have hpos : 0 < (y 0 - x 0) ^ 2 + (y 1 - x 1) ^ 2 := by
    have hcoord : x 0 ≠ y 0 ∨ x 1 ≠ y 1 := by
      by_contra h
      push_neg at h
      exact hxy (by
        ext i
        fin_cases i <;> simp [h.1, h.2])
    rcases hcoord with h0 | h1
    · have : 0 < (y 0 - x 0) ^ 2 := by
        have : y 0 - x 0 ≠ 0 := sub_ne_zero.mpr (Ne.symm h0)
        positivity
      nlinarith [sq_nonneg (y 1 - x 1)]
    · have : 0 < (y 1 - x 1) ^ 2 := by
        have : y 1 - x 1 ≠ 0 := sub_ne_zero.mpr (Ne.symm h1)
        positivity
      nlinarith [sq_nonneg (y 0 - x 0)]
  have hsum : signedArea2 x c d + signedArea2 y c d = 0 := by
    rcases mul_eq_zero.mp key with h | h
    · exact absurd h (ne_of_gt hpos)
    · exact h
  linarith [hsum]

/- ## Combinatorial counting core (the 8-step contradiction, fixed gauge) -/

/-- Strict linear betweenness on `Fin 10`.  In the fixed gauge
`u Q1 Q2 v s1 s2 s3 w Pw Pu = 0 1 2 3 4 5 6 7 8 9` with the wrap-cut at `u=0`,
this faithfully encodes the open cyclic arc of the chord `{i,j}`: for `i<j` a
point `k` is strictly between iff `i<k<j`; the wrap arc (through `9→0→1`) is
the numeric complement. -/
def btw (i j k : Fin 10) : Prop := (i < k ∧ k < j) ∨ (j < k ∧ k < i)

instance (i j k : Fin 10) : Decidable (btw i j k) := by unfold btw; infer_instance

/-- **Proposition E — emptiness core (fixed `(5,4,4)` gauge at `n=10`).**
No incidence system `K` of exact-4 classes over the 10 gauge points can satisfy
the two U2.B pins (`K_v = oppCap1`, `K_w = oppCap2`) together with chord
separation (SEP, encoded via `btw`).  This is the finite combinatorial heart of
Proposition E; the geometric realization (gauge assembly + SEP realness via
`sep_signedArea2`) feeds it. -/
theorem propE_core
    (K : Fin 10 → Finset (Fin 10))
    (hcard : ∀ i, (K i).card = 4)
    (hself : ∀ i, i ∉ K i)
    (hpinV : K 3 = {0, 7, 8, 9})
    (hpinW : K 7 = {0, 1, 2, 3})
    (hsep : ∀ (i j a b : Fin 10), i ≠ j → a ∈ K i → a ∈ K j → b ∈ K i → b ∈ K j →
        a ≠ b → (btw i j a ↔ ¬ btw i j b)) :
    False := by
  -- SEP as "no two shared members on the same side of the chord" (distinct centers)
  have not_both : ∀ (i j a b : Fin 10), i ≠ j → a ∈ K i → a ∈ K j → b ∈ K i → b ∈ K j →
      a ≠ b → (btw i j a ↔ btw i j b) → False := by
    intro i j a b hij h1 h2 h3 h4 hab hs
    have h := hsep i j a b hij h1 h2 h3 h4 hab
    rw [hs] at h; tauto
  -- at most one shared member of `K i, K j` on a single side
  have side_le : ∀ (i j : Fin 10) (S : Finset (Fin 10)), i ≠ j → S ⊆ K j →
      (∀ a ∈ S, ∀ b ∈ S, (btw i j a ↔ btw i j b)) → (K i ∩ S).card ≤ 1 := by
    intro i j S hij hSj hside
    rw [Finset.card_le_one]
    intro a ha b hb
    rw [Finset.mem_inter] at ha hb
    by_contra hab
    exact not_both i j a b hij ha.1 (hSj ha.2) hb.1 (hSj hb.2) hab (hside a ha.2 b hb.2)
  -- subadditivity of a class across a two-set cover
  have split : ∀ (X U V : Finset (Fin 10)), X ⊆ U ∪ V →
      X.card ≤ (X ∩ U).card + (X ∩ V).card := by
    intro X U V hsub
    calc X.card = (X ∩ (U ∪ V)).card := by rw [Finset.inter_eq_left.mpr hsub]
      _ = ((X ∩ U) ∪ (X ∩ V)).card := by rw [Finset.inter_union_distrib_left]
      _ ≤ (X ∩ U).card + (X ∩ V).card := Finset.card_union_le _ _
  have interU : ∀ (X B C : Finset (Fin 10)),
      (X ∩ (B ∪ C)).card ≤ (X ∩ B).card + (X ∩ C).card := by
    intro X B C; rw [Finset.inter_union_distrib_left]; exact Finset.card_union_le _ _
  -- Step 3: {s2,s3} = {5,6} ⊆ K_s1 = K 4
  have h4_a : (K 4 ∩ {0, 7, 8, 9}).card ≤ 1 :=
    side_le 4 3 _ (by decide) hpinV.symm.le (by decide)
  have h4_b : (K 4 ∩ {1, 2, 3}).card ≤ 1 :=
    side_le 4 7 _ (by decide) (by rw [hpinW]; decide) (by decide)
  have h4_sub : K 4 ⊆ ({0, 7, 8, 9} ∪ {1, 2, 3}) ∪ {5, 6} := by
    intro k hk
    have hk4 : k ≠ 4 := fun h => hself 4 (h ▸ hk)
    fin_cases k <;> first | (exact absurd rfl hk4) | decide
  have h4_56 : ({5, 6} : Finset (Fin 10)) ⊆ K 4 := by
    have hs := split (K 4) ({0, 7, 8, 9} ∪ {1, 2, 3}) {5, 6} h4_sub
    have hu := interU (K 4) {0, 7, 8, 9} {1, 2, 3}
    have hcard4 := hcard 4
    have hge : 2 ≤ (K 4 ∩ {5, 6}).card := by omega
    have heq : K 4 ∩ {5, 6} = {5, 6} :=
      Finset.eq_of_subset_of_card_le Finset.inter_subset_right (by
        have : ({5, 6} : Finset (Fin 10)).card = 2 := by decide
        omega)
    rw [← heq]; exact Finset.inter_subset_left
  -- Step 4: {s1,s2} = {4,5} ⊆ K_s3 = K 6
  have h6_a : (K 6 ∩ {0, 1, 2, 3}).card ≤ 1 :=
    side_le 6 7 _ (by decide) hpinW.symm.le (by decide)
  have h6_b : (K 6 ∩ {0, 7, 8, 9}).card ≤ 1 :=
    side_le 6 3 _ (by decide) hpinV.symm.le (by decide)
  have h6_sub : K 6 ⊆ ({0, 1, 2, 3} ∪ {7, 8, 9}) ∪ {4, 5} := by
    intro k hk
    have hk6 : k ≠ 6 := fun h => hself 6 (h ▸ hk)
    fin_cases k <;> first | (exact absurd rfl hk6) | decide
  have h6_45 : ({4, 5} : Finset (Fin 10)) ⊆ K 6 := by
    have hs := split (K 6) ({0, 1, 2, 3} ∪ {7, 8, 9}) {4, 5} h6_sub
    have hu := interU (K 6) {0, 1, 2, 3} {7, 8, 9}
    have h789 : (K 6 ∩ {7, 8, 9}).card ≤ 1 :=
      le_trans (Finset.card_le_card (Finset.inter_subset_inter (Finset.Subset.refl _)
        (by decide))) h6_b
    have hcard6 := hcard 6
    have hge : 2 ≤ (K 6 ∩ {4, 5}).card := by omega
    have heq : K 6 ∩ {4, 5} = {4, 5} :=
      Finset.eq_of_subset_of_card_le Finset.inter_subset_right (by
        have : ({4, 5} : Finset (Fin 10)).card = 2 := by decide
        omega)
    rw [← heq]; exact Finset.inter_subset_left
  -- Step 5/6: K_Q1 = K 1 contains 4 and 6
  have h1_a : (K 1 ∩ {0, 7, 8, 9}).card ≤ 1 :=
    side_le 1 3 _ (by decide) hpinV.symm.le (by decide)
  have h1_b : (K 1 ∩ {2, 3}).card ≤ 1 :=
    side_le 1 7 _ (by decide) (by rw [hpinW]; decide) (by decide)
  have h1_sub : K 1 ⊆ ({0, 7, 8, 9} ∪ {2, 3}) ∪ {4, 5, 6} := by
    intro k hk
    have hk1 : k ≠ 1 := fun h => hself 1 (h ▸ hk)
    fin_cases k <;> first | (exact absurd rfl hk1) | decide
  have h1_456ge : 2 ≤ (K 1 ∩ {4, 5, 6}).card := by
    have hs := split (K 1) ({0, 7, 8, 9} ∪ {2, 3}) {4, 5, 6} h1_sub
    have hu := interU (K 1) {0, 7, 8, 9} {2, 3}
    have hcard1 := hcard 1
    omega
  have h1_not56 : ¬ (5 ∈ K 1 ∧ 6 ∈ K 1) := by
    rintro ⟨h5, h6⟩
    exact not_both 1 4 5 6 (by decide) h5 (h4_56 (by decide)) h6 (h4_56 (by decide)) (by decide)
      (by decide)
  have h1_not45 : ¬ (4 ∈ K 1 ∧ 5 ∈ K 1) := by
    rintro ⟨h4, h5⟩
    exact not_both 1 6 4 5 (by decide) h4 (h6_45 (by decide)) h5 (h6_45 (by decide)) (by decide)
      (by decide)
  have h1_46 : 4 ∈ K 1 ∧ 6 ∈ K 1 := by
    by_cases h5 : 5 ∈ K 1
    · exfalso
      have h4n : 4 ∉ K 1 := fun h => h1_not45 ⟨h, h5⟩
      have h6n : 6 ∉ K 1 := fun h => h1_not56 ⟨h5, h⟩
      have hsub5 : K 1 ∩ {4, 5, 6} ⊆ {5} := by
        intro k hk
        rw [Finset.mem_inter, Finset.mem_insert, Finset.mem_insert,
          Finset.mem_singleton] at hk
        obtain ⟨hkK, rfl | rfl | rfl⟩ := hk
        · exact absurd hkK h4n
        · decide
        · exact absurd hkK h6n
      have : (K 1 ∩ {4, 5, 6}).card ≤ 1 :=
        le_trans (Finset.card_le_card hsub5) (by decide)
      omega
    · have hsub46 : K 1 ∩ {4, 5, 6} ⊆ {4, 6} := by
        intro k hk
        rw [Finset.mem_inter, Finset.mem_insert, Finset.mem_insert,
          Finset.mem_singleton] at hk
        obtain ⟨hkK, rfl | rfl | rfl⟩ := hk
        · decide
        · exact absurd hkK h5
        · decide
      have heq : K 1 ∩ {4, 5, 6} = {4, 6} :=
        Finset.eq_of_subset_of_card_le hsub46 (by
          have : ({4, 6} : Finset (Fin 10)).card = 2 := by decide
          omega)
      refine ⟨?_, ?_⟩
      · have : (4 : Fin 10) ∈ K 1 ∩ {4, 5, 6} := by rw [heq]; decide
        exact (Finset.mem_inter.mp this).1
      · have : (6 : Fin 10) ∈ K 1 ∩ {4, 5, 6} := by rw [heq]; decide
        exact (Finset.mem_inter.mp this).1
  -- Step 7: K_Pu = K 9 contains 4 and 6 (mirror of Step 5/6)
  have h9_a : (K 9 ∩ {0, 1, 2, 3}).card ≤ 1 :=
    side_le 9 7 _ (by decide) hpinW.symm.le (by decide)
  have h9_b : (K 9 ∩ {7, 8}).card ≤ 1 :=
    side_le 9 3 _ (by decide) (by rw [hpinV]; decide) (by decide)
  have h9_sub : K 9 ⊆ ({0, 1, 2, 3} ∪ {7, 8}) ∪ {4, 5, 6} := by
    intro k hk
    have hk9 : k ≠ 9 := fun h => hself 9 (h ▸ hk)
    fin_cases k <;> first | (exact absurd rfl hk9) | decide
  have h9_456ge : 2 ≤ (K 9 ∩ {4, 5, 6}).card := by
    have hs := split (K 9) ({0, 1, 2, 3} ∪ {7, 8}) {4, 5, 6} h9_sub
    have hu := interU (K 9) {0, 1, 2, 3} {7, 8}
    have hcard9 := hcard 9
    omega
  have h9_not56 : ¬ (5 ∈ K 9 ∧ 6 ∈ K 9) := by
    rintro ⟨h5, h6⟩
    exact not_both 9 4 5 6 (by decide) h5 (h4_56 (by decide)) h6 (h4_56 (by decide)) (by decide)
      (by decide)
  have h9_not45 : ¬ (4 ∈ K 9 ∧ 5 ∈ K 9) := by
    rintro ⟨h4, h5⟩
    exact not_both 9 6 4 5 (by decide) h4 (h6_45 (by decide)) h5 (h6_45 (by decide)) (by decide)
      (by decide)
  have h9_46 : 4 ∈ K 9 ∧ 6 ∈ K 9 := by
    by_cases h5 : 5 ∈ K 9
    · exfalso
      have h4n : 4 ∉ K 9 := fun h => h9_not45 ⟨h, h5⟩
      have h6n : 6 ∉ K 9 := fun h => h9_not56 ⟨h5, h⟩
      have hsub5 : K 9 ∩ {4, 5, 6} ⊆ {5} := by
        intro k hk
        rw [Finset.mem_inter, Finset.mem_insert, Finset.mem_insert,
          Finset.mem_singleton] at hk
        obtain ⟨hkK, rfl | rfl | rfl⟩ := hk
        · exact absurd hkK h4n
        · decide
        · exact absurd hkK h6n
      have : (K 9 ∩ {4, 5, 6}).card ≤ 1 :=
        le_trans (Finset.card_le_card hsub5) (by decide)
      omega
    · have hsub46 : K 9 ∩ {4, 5, 6} ⊆ {4, 6} := by
        intro k hk
        rw [Finset.mem_inter, Finset.mem_insert, Finset.mem_insert,
          Finset.mem_singleton] at hk
        obtain ⟨hkK, rfl | rfl | rfl⟩ := hk
        · decide
        · exact absurd hkK h5
        · decide
      have heq : K 9 ∩ {4, 5, 6} = {4, 6} :=
        Finset.eq_of_subset_of_card_le hsub46 (by
          have : ({4, 6} : Finset (Fin 10)).card = 2 := by decide
          omega)
      refine ⟨?_, ?_⟩
      · have : (4 : Fin 10) ∈ K 9 ∩ {4, 5, 6} := by rw [heq]; decide
        exact (Finset.mem_inter.mp this).1
      · have : (6 : Fin 10) ∈ K 9 ∩ {4, 5, 6} := by rw [heq]; decide
        exact (Finset.mem_inter.mp this).1
  -- Step 8: {4,6} ⊆ K 1 ∩ K 9, both strictly between 1 and 9 — SEP violated
  exact not_both 1 9 4 6 (by decide) h1_46.1 h9_46.1 h1_46.2 h9_46.2 (by decide) (by decide)

/-- **Gauge entry point (feasibility probe).**  A 10-point convex-independent set
admits a CCW convex-boundary enumeration `φ : Fin 10 → ℝ²`, injective and onto.
This is the starting point of the gauge assembly that must feed `propE_core`. -/
theorem gauge_enumeration (A : Finset ℝ²) (hconv : ConvexIndep A)
    (hcardA : A.card = 10) :
    ∃ (φ : Fin 10 → ℝ²), Function.Injective φ ∧ Finset.univ.image φ = A ∧
      EuclideanGeometry.IsCcwConvexPolygon φ := by
  have hnc : ¬ Collinear ℝ (A : Set ℝ²) :=
    ConvexIndep.not_collinear_of_card_ge_three hconv (by omega)
  obtain ⟨n, _hn, φ, hinj, himg, hccw⟩ :=
    exists_isCcwConvexPolygon_of_convexIndep hconv hnc
  have hn10 : n = 10 := by
    have hc : (Finset.univ.image φ).card = A.card := by rw [himg]
    rw [Finset.card_image_of_injective _ hinj, Finset.card_univ, Fintype.card_fin] at hc
    omega
  subst hn10
  exact ⟨φ, hinj, himg, hccw⟩


/-! ## Part 2a — apex-form arc-memberships (uniform over `surplusIdx`) -/

open SurplusCapPacket in
/-- The three caps of a `SurplusCapPacket`, characterized by `OnArcOpposite`
with the *cap's own opposite apex first* — uniformly across the three
`surplusIdx` branches (the cyclic cap↔apex correspondence).  This packages
`CapTriple.arc_membership` in apex-labelled form. -/
theorem arc_membership_apex {A : Finset ℝ²} (S : SurplusCapPacket A) :
    (∀ x ∈ A, x ∈ S.surplusCap ↔
        OnArcOpposite S.surplusApex S.oppApex1 S.oppApex2 x) ∧
    (∀ x ∈ A, x ∈ S.oppCap1 ↔
        OnArcOpposite S.oppApex1 S.oppApex2 S.surplusApex x) ∧
    (∀ x ∈ A, x ∈ S.oppCap2 ↔
        OnArcOpposite S.oppApex2 S.surplusApex S.oppApex1 x) := by
  have harc := S.partition.arc_membership
  rcases hidx : S.surplusIdx with ⟨i, hlt⟩
  interval_cases i <;>
    refine ⟨fun x hx => ?_, fun x hx => ?_, fun x hx => ?_⟩ <;>
    · simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
        SurplusCapPacket.oppCap2, SurplusCapPacket.surplusApex,
        SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hidx]
      first
        | exact harc x hx |>.1
        | exact harc x hx |>.2.1
        | exact harc x hx |>.2.2

/-- The three apices are the Moser-triangle vertices, hence lie in `A`. -/
theorem apex_mem {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex ∈ A ∧ S.oppApex1 ∈ A ∧ S.oppApex2 ∈ A := by
  have h1 := S.triangle.v1_mem
  have h2 := S.triangle.v2_mem
  have h3 := S.triangle.v3_mem
  rcases hidx : S.surplusIdx with ⟨i, hlt⟩
  interval_cases i <;>
    simp only [SurplusCapPacket.surplusApex, SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hidx] <;>
    exact ⟨by assumption, by assumption, by assumption⟩

/-- The three caps are subsets of `A`. -/
theorem caps_subset {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusCap ⊆ A ∧ S.oppCap1 ⊆ A ∧ S.oppCap2 ⊆ A := by
  have h1 := S.partition.C1_subset
  have h2 := S.partition.C2_subset
  have h3 := S.partition.C3_subset
  rcases hidx : S.surplusIdx with ⟨i, hlt⟩
  interval_cases i <;>
    simp only [SurplusCapPacket.surplusCap, SurplusCapPacket.oppCap1,
      SurplusCapPacket.oppCap2, hidx] <;>
    exact ⟨by assumption, by assumption, by assumption⟩

/-- The three apices are pairwise distinct. -/
theorem apex_distinct {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex ≠ S.oppApex1 ∧ S.surplusApex ≠ S.oppApex2 ∧
      S.oppApex1 ≠ S.oppApex2 := by
  have h12 := S.triangle.v12_ne
  have h13 := S.triangle.v13_ne
  have h23 := S.triangle.v23_ne
  rcases hidx : S.surplusIdx with ⟨i, hlt⟩
  interval_cases i <;>
    refine ⟨?_, ?_, ?_⟩ <;>
    simp only [SurplusCapPacket.surplusApex, SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppApex2, hidx] <;>
    first
      | exact h12 | exact h13 | exact h23
      | exact h12.symm | exact h13.symm | exact h23.symm

/-! ## Part 2b — reading caps as index blocks off a CCW enumeration -/

/-- `OnArcOpposite` is symmetric in its two chord-endpoint slots. -/
theorem propositionE_onArcOpposite_swap (p a b x : ℝ²) :
    OnArcOpposite p a b x ↔ OnArcOpposite p b a x := by
  unfold OnArcOpposite
  have e1 : signedArea2 x b a = - signedArea2 x a b := by simp only [signedArea2]; ring
  have e2 : signedArea2 p b a = - signedArea2 p a b := by simp only [signedArea2]; ring
  rw [e1, e2]; constructor <;> intro h <;> nlinarith [h]

/-- The pullback index set of a cap has the cap's cardinality. -/
theorem idxset_card {ψ : Fin 10 → ℝ²} (hinj : Function.Injective ψ)
    {A C : Finset ℝ²} (hA : Finset.univ.image ψ = A) (hCA : C ⊆ A) :
    (Finset.univ.filter (fun i => ψ i ∈ C)).card = C.card := by
  refine Finset.card_bij (fun i _ => ψ i) ?_ ?_ ?_
  · intro a ha; exact (Finset.mem_filter.mp ha).2
  · intro a _ b _ h; exact hinj h
  · intro b hb
    have hbA : b ∈ A := hCA hb
    have : b ∈ Finset.univ.image ψ := by rw [hA]; exact hbA
    rcases Finset.mem_image.mp this with ⟨a, _, rfl⟩
    exact ⟨a, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hb⟩, rfl⟩

/-- Non-wrapping cap: `ψ i ∈ C ↔ ia ≤ i ≤ ib`, from apex-form arc-membership
with the reference index strictly outside `[ia, ib]`. -/
theorem psi_block_nonwrap {ψ : Fin 10 → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon ψ) (hinj : Function.Injective ψ)
    {A C : Finset ℝ²} (hA : Finset.univ.image ψ = A)
    {ia ib ic : Fin 10} (hab : ia < ib) (hc : ic < ia ∨ ib < ic)
    (harc : ∀ x ∈ A, x ∈ C ↔ OnArcOpposite (ψ ic) (ψ ia) (ψ ib) x) :
    ∀ i : Fin 10, ψ i ∈ C ↔ (ia ≤ i ∧ i ≤ ib) := by
  intro i
  have hiA : ψ i ∈ A := by rw [← hA]; exact Finset.mem_image_of_mem ψ (Finset.mem_univ i)
  rw [harc (ψ i) hiA]
  exact onArcOpposite_iff_index_block hccw hinj hab hc i

/-- Cap cardinality read off a non-wrapping index block. -/
theorem cap_card_nonwrap {ψ : Fin 10 → ℝ²} (hinj : Function.Injective ψ)
    {A C : Finset ℝ²} (hA : Finset.univ.image ψ = A) (hCA : C ⊆ A)
    {ia ib : Fin 10} (hmem : ∀ i : Fin 10, ψ i ∈ C ↔ (ia ≤ i ∧ i ≤ ib)) :
    C.card = (ib : ℕ) + 1 - (ia : ℕ) := by
  rw [← idxset_card hinj hA hCA]
  have hset : Finset.univ.filter (fun i => ψ i ∈ C) = Finset.Icc ia ib := by
    ext i
    simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_Icc]
    exact hmem i
  rw [hset, Fin.card_Icc]

/-- Wrapping cap: `ψ i ∈ C ↔ i ≤ ia ∨ ib ≤ i`, from apex-form arc-membership
with the reference index strictly *between* the endpoints. -/
theorem psi_block_wrap {ψ : Fin 10 → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon ψ) (hinj : Function.Injective ψ)
    {A C : Finset ℝ²} (hA : Finset.univ.image ψ = A)
    {ia ib ic : Fin 10} (hab : ia < ib) (hlo : ia < ic) (hhi : ic < ib)
    (harc : ∀ x ∈ A, x ∈ C ↔ OnArcOpposite (ψ ic) (ψ ia) (ψ ib) x) :
    ∀ i : Fin 10, ψ i ∈ C ↔ (i ≤ ia ∨ ib ≤ i) := by
  intro i
  have hiA : ψ i ∈ A := by rw [← hA]; exact Finset.mem_image_of_mem ψ (Finset.mem_univ i)
  rw [harc (ψ i) hiA]
  unfold OnArcOpposite
  obtain ⟨hpos, hzero, hneg⟩ := signedArea2_trichotomy hccw hinj hab i
  obtain ⟨hposR, _, _⟩ := signedArea2_trichotomy hccw hinj hab ic
  have href : 0 < signedArea2 (ψ ic) (ψ ia) (ψ ib) := hposR.mpr ⟨hlo, hhi⟩
  constructor
  · intro hle
    have htarget : signedArea2 (ψ i) (ψ ia) (ψ ib) ≤ 0 := by nlinarith [hle, href]
    rcases lt_or_eq_of_le htarget with hlt | heq
    · rcases hneg.mp hlt with h | h
      · exact Or.inl (le_of_lt h)
      · exact Or.inr (le_of_lt h)
    · rcases hzero.mp heq with h | h
      · exact Or.inl (le_of_eq h)
      · exact Or.inr (le_of_eq h.symm)
  · intro hor
    have htarget : signedArea2 (ψ i) (ψ ia) (ψ ib) ≤ 0 := by
      rcases hor with h | h
      · rcases lt_or_eq_of_le h with hlt | heq
        · exact le_of_lt (hneg.mpr (Or.inl hlt))
        · exact le_of_eq (hzero.mpr (Or.inl heq))
      · rcases lt_or_eq_of_le h with hlt | heq
        · exact le_of_lt (hneg.mpr (Or.inr hlt))
        · exact le_of_eq (hzero.mpr (Or.inr heq.symm))
    nlinarith [htarget, href]

/-! ## Part 2c — the gauge normalization (steps 1–3)

Rotate the CCW enumeration so the surplus apex sits at index `0`; then the two
non-surplus apices are *forced* to indices `3` and `7` by the cap sizes
(surplus `= 5`, opposite `= 4`), and the two opposite caps pull back to the
fixed index blocks `{0,7,8,9}` (opposite index 3) and `{0,1,2,3}` (opposite
index 7).  The residual `v ↔ w` reflection is the disjunction below (both
disjuncts deliver the *same* position→block assignment). -/

open CounterexampleData in
/-- **Gauge normalization for `n = 10` `(5,4,4)`.** -/
theorem gauge_normalization (D : CounterexampleData) (hcard : D.A.card = 10)
    (hM44 : D.IsM44) :
    ∃ ψ : Fin 10 → ℝ², Function.Injective ψ ∧ Finset.univ.image ψ = D.A ∧
      EuclideanGeometry.IsCcwConvexPolygon ψ ∧ ψ 0 = D.packet.surplusApex ∧
      ( ( ψ 3 = D.packet.oppApex1 ∧ ψ 7 = D.packet.oppApex2 ∧
          (∀ i : Fin 10, ψ i ∈ D.packet.oppCap1 ↔ i ∈ ({0,7,8,9} : Finset (Fin 10))) ∧
          (∀ i : Fin 10, ψ i ∈ D.packet.oppCap2 ↔ i ∈ ({0,1,2,3} : Finset (Fin 10))) )
        ∨
        ( ψ 3 = D.packet.oppApex2 ∧ ψ 7 = D.packet.oppApex1 ∧
          (∀ i : Fin 10, ψ i ∈ D.packet.oppCap2 ↔ i ∈ ({0,7,8,9} : Finset (Fin 10))) ∧
          (∀ i : Fin 10, ψ i ∈ D.packet.oppCap1 ↔ i ∈ ({0,1,2,3} : Finset (Fin 10))) ) ) := by
  classical
  obtain ⟨φ, hφinj, hφimg, hφccw⟩ := gauge_enumeration D.A D.convex hcard
  have hsurp_card : D.packet.surplusCap.card = 5 := by have := hM44.surplus_card_eq; omega
  obtain ⟨hO1card, hO2card⟩ := hM44
  obtain ⟨hsuA, hA1A, hA2A⟩ := apex_mem D.packet
  obtain ⟨hsu_ne1, hsu_ne2, h1_ne2⟩ := apex_distinct D.packet
  obtain ⟨hSurpSub, hO1Sub, hO2Sub⟩ := caps_subset D.packet
  obtain ⟨hArcSurp, hArcO1, hArcO2⟩ := arc_membership_apex D.packet
  -- shift the surplus apex to index 0
  have hsuImg : D.packet.surplusApex ∈ Finset.univ.image φ := by rw [hφimg]; exact hsuA
  obtain ⟨isu, _, hisu⟩ := Finset.mem_image.mp hsuImg
  set ψ : Fin 10 → ℝ² := fun t => φ (t + isu) with hψdef
  have hψccw : EuclideanGeometry.IsCcwConvexPolygon ψ :=
    isCcwConvexPolygon_cyclicShift hφinj hφccw isu
  have hψinj : Function.Injective ψ := fun a b h => add_left_injective isu (hφinj h)
  have hψimg : Finset.univ.image ψ = D.A := by
    rw [← hφimg]; ext y; constructor
    · intro hy; rcases Finset.mem_image.mp hy with ⟨t, _, rfl⟩
      exact Finset.mem_image_of_mem φ (Finset.mem_univ _)
    · intro hy; rcases Finset.mem_image.mp hy with ⟨q, _, rfl⟩
      exact Finset.mem_image.mpr ⟨q - isu, Finset.mem_univ _, by simp [hψdef]⟩
  have hψ0 : ψ 0 = D.packet.surplusApex := by simp [hψdef, hisu]
  -- locate the two non-surplus apices
  have hA1Img : D.packet.oppApex1 ∈ Finset.univ.image ψ := by rw [hψimg]; exact hA1A
  have hA2Img : D.packet.oppApex2 ∈ Finset.univ.image ψ := by rw [hψimg]; exact hA2A
  obtain ⟨iA1, _, hiA1⟩ := Finset.mem_image.mp hA1Img
  obtain ⟨iA2, _, hiA2⟩ := Finset.mem_image.mp hA2Img
  have hiA1_ne0 : iA1 ≠ 0 := fun h => hsu_ne1 (by rw [← hψ0, ← hiA1, h])
  have hiA2_ne0 : iA2 ≠ 0 := fun h => hsu_ne2 (by rw [← hψ0, ← hiA2, h])
  have hiA1_ne2 : iA1 ≠ iA2 := fun h => h1_ne2 (by rw [← hiA1, ← hiA2, h])
  have h0lt1 : (0 : Fin 10) < iA1 := (Fin.pos_iff_ne_zero).mpr hiA1_ne0
  have h0lt2 : (0 : Fin 10) < iA2 := (Fin.pos_iff_ne_zero).mpr hiA2_ne0
  rw [← hψ0, ← hiA1, ← hiA2] at hArcSurp hArcO1 hArcO2
  -- finite index-block ↔ finset facts
  have hfin2 : ∀ i : Fin 10, ((0 : Fin 10) ≤ i ∧ i ≤ (3 : Fin 10)) ↔
      i ∈ ({0,1,2,3} : Finset (Fin 10)) := by decide
  have hfin1 : ∀ i : Fin 10, (i ≤ (0 : Fin 10) ∨ (7 : Fin 10) ≤ i) ↔
      i ∈ ({0,7,8,9} : Finset (Fin 10)) := by decide
  have h3val : ((3 : Fin 10) : ℕ) = 3 := by decide
  have h7val : ((7 : Fin 10) : ℕ) = 7 := by decide
  rcases lt_or_gt_of_ne hiA1_ne2 with hlt | hgt
  · -- Case L: iA1 < iA2, so iA1 = 3, iA2 = 7
    have hSurpMem : ∀ i : Fin 10, ψ i ∈ D.packet.surplusCap ↔ (iA1 ≤ i ∧ i ≤ iA2) :=
      psi_block_nonwrap hψccw hψinj hψimg hlt (Or.inl h0lt1) hArcSurp
    have hSurpEq := cap_card_nonwrap hψinj hψimg hSurpSub hSurpMem
    have hO2Mem : ∀ i : Fin 10, ψ i ∈ D.packet.oppCap2 ↔ ((0 : Fin 10) ≤ i ∧ i ≤ iA1) :=
      psi_block_nonwrap hψccw hψinj hψimg h0lt1 (Or.inr hlt) hArcO2
    have hO2Eq := cap_card_nonwrap hψinj hψimg hO2Sub hO2Mem
    have hiA1val : (iA1 : ℕ) = 3 := by
      rw [hO2card, Fin.val_zero] at hO2Eq; omega
    have hiA2val : (iA2 : ℕ) = 7 := by rw [hsurp_card] at hSurpEq; omega
    have hiA1eq : iA1 = 3 := Fin.ext (by omega)
    have hiA2eq : iA2 = 7 := Fin.ext (by omega)
    subst hiA1eq hiA2eq
    have hO2pull : ∀ i : Fin 10, ψ i ∈ D.packet.oppCap2 ↔ i ∈ ({0,1,2,3} : Finset (Fin 10)) :=
      fun i => (hO2Mem i).trans (hfin2 i)
    have hArcO1' : ∀ x ∈ D.A, x ∈ D.packet.oppCap1 ↔ OnArcOpposite (ψ 3) (ψ 0) (ψ 7) x :=
      fun x hx => (hArcO1 x hx).trans (propositionE_onArcOpposite_swap _ _ _ _)
    have hO1Mem : ∀ i : Fin 10, ψ i ∈ D.packet.oppCap1 ↔ (i ≤ (0 : Fin 10) ∨ (7 : Fin 10) ≤ i) :=
      psi_block_wrap hψccw hψinj hψimg (by decide) (by decide) (by decide) hArcO1'
    have hO1pull : ∀ i : Fin 10, ψ i ∈ D.packet.oppCap1 ↔ i ∈ ({0,7,8,9} : Finset (Fin 10)) :=
      fun i => (hO1Mem i).trans (hfin1 i)
    exact ⟨ψ, hψinj, hψimg, hψccw, hψ0, Or.inl ⟨hiA1, hiA2, hO1pull, hO2pull⟩⟩
  · -- Case R: iA2 < iA1, so iA2 = 3, iA1 = 7
    have hgt' : iA2 < iA1 := hgt
    have hArcSurp' : ∀ x ∈ D.A, x ∈ D.packet.surplusCap ↔
        OnArcOpposite (ψ 0) (ψ iA2) (ψ iA1) x :=
      fun x hx => (hArcSurp x hx).trans (propositionE_onArcOpposite_swap _ _ _ _)
    have hSurpMem : ∀ i : Fin 10, ψ i ∈ D.packet.surplusCap ↔ (iA2 ≤ i ∧ i ≤ iA1) :=
      psi_block_nonwrap hψccw hψinj hψimg hgt' (Or.inl h0lt2) hArcSurp'
    have hSurpEq := cap_card_nonwrap hψinj hψimg hSurpSub hSurpMem
    have hArcO1' : ∀ x ∈ D.A, x ∈ D.packet.oppCap1 ↔ OnArcOpposite (ψ iA1) (ψ 0) (ψ iA2) x :=
      fun x hx => (hArcO1 x hx).trans (propositionE_onArcOpposite_swap _ _ _ _)
    have hO1Mem : ∀ i : Fin 10, ψ i ∈ D.packet.oppCap1 ↔ ((0 : Fin 10) ≤ i ∧ i ≤ iA2) :=
      psi_block_nonwrap hψccw hψinj hψimg h0lt2 (Or.inr hgt') hArcO1'
    have hO1Eq := cap_card_nonwrap hψinj hψimg hO1Sub hO1Mem
    have hiA2val : (iA2 : ℕ) = 3 := by
      rw [hO1card, Fin.val_zero] at hO1Eq; omega
    have hiA1val : (iA1 : ℕ) = 7 := by rw [hsurp_card] at hSurpEq; omega
    have hiA2eq : iA2 = 3 := Fin.ext (by omega)
    have hiA1eq : iA1 = 7 := Fin.ext (by omega)
    subst hiA2eq hiA1eq
    have hO1pull : ∀ i : Fin 10, ψ i ∈ D.packet.oppCap1 ↔ i ∈ ({0,1,2,3} : Finset (Fin 10)) :=
      fun i => (hO1Mem i).trans (hfin2 i)
    have hO2Mem : ∀ i : Fin 10, ψ i ∈ D.packet.oppCap2 ↔ (i ≤ (0 : Fin 10) ∨ (7 : Fin 10) ≤ i) :=
      psi_block_wrap hψccw hψinj hψimg (by decide) (by decide) (by decide) hArcO2
    have hO2pull : ∀ i : Fin 10, ψ i ∈ D.packet.oppCap2 ↔ i ∈ ({0,7,8,9} : Finset (Fin 10)) :=
      fun i => (hO2Mem i).trans (hfin1 i)
    exact ⟨ψ, hψinj, hψimg, hψccw, hψ0, Or.inr ⟨hiA2, hiA1, hO2pull, hO1pull⟩⟩

/-! ## Part 3a — chord separation ⟹ `btw` alternation (the `hsep` core) -/

/-- **SEP → `btw` alternation.**  If `ψ a` and `ψ b` are equidistant from both
`ψ i` and `ψ j` (`i ≠ j`, `a,b ∉ {i,j}`, `ψ a ≠ ψ b`), then exactly one of them
lies strictly between `i` and `j` in the cyclic index order. -/
theorem btw_sep {ψ : Fin 10 → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon ψ) (hinj : Function.Injective ψ)
    {i j a b : Fin 10} (hij : i ≠ j)
    (hbi : b ≠ i) (hbj : b ≠ j)
    (hci : dist (ψ a) (ψ i) = dist (ψ b) (ψ i))
    (hcj : dist (ψ a) (ψ j) = dist (ψ b) (ψ j))
    (habne : ψ a ≠ ψ b) :
    (btw i j a ↔ ¬ btw i j b) := by
  rcases lt_or_gt_of_ne hij with hlt | hgt
  · -- i < j
    have hseq : signedArea2 (ψ a) (ψ i) (ψ j) = - signedArea2 (ψ b) (ψ i) (ψ j) :=
      sep_signedArea2 (ψ a) (ψ b) (ψ i) (ψ j) hci hcj habne
    obtain ⟨hpa, hza, _⟩ := signedArea2_trichotomy hccw hinj hlt a
    obtain ⟨hpb, hzb, _⟩ := signedArea2_trichotomy hccw hinj hlt b
    have hsab_ne : signedArea2 (ψ b) (ψ i) (ψ j) ≠ 0 := fun h => by
      rcases hzb.mp h with h' | h'; exacts [hbi h', hbj h']
    have hbtwa : btw i j a ↔ 0 < signedArea2 (ψ a) (ψ i) (ψ j) := by
      rw [hpa]; unfold btw
      exact ⟨fun h => h.elim id (fun ⟨h1, h2⟩ => absurd h1 (by omega)), Or.inl⟩
    have hbtwb : btw i j b ↔ 0 < signedArea2 (ψ b) (ψ i) (ψ j) := by
      rw [hpb]; unfold btw
      exact ⟨fun h => h.elim id (fun ⟨h1, h2⟩ => absurd h1 (by omega)), Or.inl⟩
    rw [hbtwa, hbtwb, hseq]
    constructor
    · intro h; linarith
    · intro h
      have hle : signedArea2 (ψ b) (ψ i) (ψ j) ≤ 0 := not_lt.mp h
      have : signedArea2 (ψ b) (ψ i) (ψ j) < 0 := lt_of_le_of_ne hle hsab_ne
      linarith
  · -- j < i
    have hseq : signedArea2 (ψ a) (ψ j) (ψ i) = - signedArea2 (ψ b) (ψ j) (ψ i) :=
      sep_signedArea2 (ψ a) (ψ b) (ψ j) (ψ i) hcj hci habne
    obtain ⟨hpa, hza, _⟩ := signedArea2_trichotomy hccw hinj hgt a
    obtain ⟨hpb, hzb, _⟩ := signedArea2_trichotomy hccw hinj hgt b
    have hsab_ne : signedArea2 (ψ b) (ψ j) (ψ i) ≠ 0 := fun h => by
      rcases hzb.mp h with h' | h'; exacts [hbj h', hbi h']
    have hbtwa : btw i j a ↔ 0 < signedArea2 (ψ a) (ψ j) (ψ i) := by
      rw [hpa]; unfold btw
      exact ⟨fun h => h.elim (fun ⟨h1, h2⟩ => absurd h1 (by omega)) id, Or.inr⟩
    have hbtwb : btw i j b ↔ 0 < signedArea2 (ψ b) (ψ j) (ψ i) := by
      rw [hpb]; unfold btw
      exact ⟨fun h => h.elim (fun ⟨h1, h2⟩ => absurd h1 (by omega)) id, Or.inr⟩
    rw [hbtwa, hbtwb, hseq]
    constructor
    · intro h; linarith
    · intro h
      have hle : signedArea2 (ψ b) (ψ j) (ψ i) ≤ 0 := not_lt.mp h
      have : signedArea2 (ψ b) (ψ j) (ψ i) < 0 := lt_of_le_of_ne hle hsab_ne
      linarith

/-! ## Part 3b — the two U2.B pins, on the normalized enumeration -/

open CounterexampleData in
/-- **Gauge pins.**  On the normalized enumeration, the U2.B full-distance
classes at indices `3` and `7` (common radius `d`) pull back to the fixed index
blocks `{0,7,8,9}` and `{0,1,2,3}`. -/
theorem gauge_pins (D : CounterexampleData) (hcard : D.A.card = 10) (hM44 : D.IsM44)
    (hFD : U2FullDistanceClasses D) :
    ∃ ψ : Fin 10 → ℝ², Function.Injective ψ ∧ Finset.univ.image ψ = D.A ∧
      EuclideanGeometry.IsCcwConvexPolygon ψ ∧
      ∃ d : ℝ, 0 < d ∧
        (∀ i : Fin 10, ψ i ∈ D.A.filter (fun x => dist x (ψ 3) = d) ↔
          i ∈ ({0,7,8,9} : Finset (Fin 10))) ∧
        (∀ i : Fin 10, ψ i ∈ D.A.filter (fun x => dist x (ψ 7) = d) ↔
          i ∈ ({0,1,2,3} : Finset (Fin 10))) := by
  obtain ⟨ψ, hψinj, hψimg, hψccw, _hψ0, hcases⟩ := gauge_normalization D hcard hM44
  obtain ⟨d, hd_pos, hf1, hf2⟩ := hFD hM44
  rcases hcases with ⟨h3, h7, hO1pull, hO2pull⟩ | ⟨h3, h7, hO2pull, hO1pull⟩
  · refine ⟨ψ, hψinj, hψimg, hψccw, d, hd_pos, fun i => ?_, fun i => ?_⟩
    · rw [show D.A.filter (fun x => dist x (ψ 3) = d) = D.packet.oppCap1 by
        simp only [h3]; exact hf1]; exact hO1pull i
    · rw [show D.A.filter (fun x => dist x (ψ 7) = d) = D.packet.oppCap2 by
        simp only [h7]; exact hf2]; exact hO2pull i
  · refine ⟨ψ, hψinj, hψimg, hψccw, d, hd_pos, fun i => ?_, fun i => ?_⟩
    · rw [show D.A.filter (fun x => dist x (ψ 3) = d) = D.packet.oppCap2 by
        simp only [h3]; exact hf2]; exact hO2pull i
    · rw [show D.A.filter (fun x => dist x (ψ 7) = d) = D.packet.oppCap1 by
        simp only [h7]; exact hf1]; exact hO1pull i


/-! ## Conditional exact-ten terminal -/

open CounterexampleData in
/-- **Conditional Proposition E at `n = 10`.** No `CounterexampleData` with
`|A| = 10` satisfies both `IsM44` and the U2 full-distance-class conclusion.
This banked terminal does not produce either hypothesis. -/
theorem propositionE_n10_of_u2FullDistanceClasses (D : CounterexampleData) (hcard : D.A.card = 10)
    (hM44 : D.IsM44) (hFD : U2FullDistanceClasses D) : False := by
  classical
  obtain ⟨ψ, hψinj, hψimg, hψccw, d, hd_pos, hpin3, hpin7⟩ := gauge_pins D hcard hM44 hFD
  set pull := Function.invFun ψ with hpulldef
  have hright : ∀ x ∈ D.A, ψ (pull x) = x := by
    intro x hx
    have hex : ∃ a, ψ a = x := by
      have hxi : x ∈ Finset.univ.image ψ := by rw [hψimg]; exact hx
      rcases Finset.mem_image.mp hxi with ⟨a, _, ha⟩; exact ⟨a, ha⟩
    exact Function.invFun_eq hex
  have hpull_injOnA : Set.InjOn pull ↑D.A := by
    intro x hx y hy hxy
    rw [← hright x (Finset.mem_coe.mp hx), ← hright y (Finset.mem_coe.mp hy), hxy]
  have hψmem : ∀ i, ψ i ∈ D.A := fun i => by
    rw [← hψimg]; exact Finset.mem_image_of_mem ψ (Finset.mem_univ i)
  -- Per-index witness class: a positive-radius equidistance class, card 4,
  -- with indices 3 / 7 pinned to their U2.B caps.
  have hclass : ∀ i : Fin 10, ∃ (ri : ℝ) (Ki : Finset (Fin 10)),
      0 < ri ∧ Ki.card = 4 ∧ (∀ a ∈ Ki, dist (ψ a) (ψ i) = ri) ∧
      (i = 3 → Ki = ({0,7,8,9} : Finset (Fin 10))) ∧
      (i = 7 → Ki = ({0,1,2,3} : Finset (Fin 10))) := by
    intro i
    by_cases h3 : i = 3
    · subst h3
      refine ⟨d, {0,7,8,9}, hd_pos, by decide, ?_, fun _ => rfl, fun h => absurd h (by decide)⟩
      intro a ha
      exact (Finset.mem_filter.mp ((hpin3 a).mpr ha)).2
    · by_cases h7 : i = 7
      · subst h7
        refine ⟨d, {0,1,2,3}, hd_pos, by decide, ?_, fun h => absurd h (by decide), fun _ => rfl⟩
        intro a ha
        exact (Finset.mem_filter.mp ((hpin7 a).mpr ha)).2
      · obtain ⟨r, hr_pos, hr_card⟩ := D.K4 (ψ i) (hψmem i)
        obtain ⟨W, hWsub, hWcard⟩ := Finset.exists_subset_card_eq hr_card
        have hWsubA : W ⊆ D.A := hWsub.trans (Finset.filter_subset _ _)
        refine ⟨r, W.image pull, hr_pos, ?_, ?_, fun h => absurd h h3, fun h => absurd h h7⟩
        · rw [Finset.card_image_of_injOn (hpull_injOnA.mono (Finset.coe_subset.mpr hWsubA)), hWcard]
        · intro a ha
          rcases Finset.mem_image.mp ha with ⟨x, hxW, rfl⟩
          rw [hright x (hWsubA hxW), dist_comm]
          exact (Finset.mem_filter.mp (hWsub hxW)).2
  choose r K hr_pos hK_card hK_dist hK3 hK7 using hclass
  have hself : ∀ i : Fin 10, i ∉ K i := by
    intro i hi
    have h := hK_dist i i hi
    rw [dist_self] at h
    exact absurd h.symm (ne_of_gt (hr_pos i))
  refine propE_core K hK_card hself (hK3 3 rfl) (hK7 7 rfl) ?_
  intro i j a b hij ha_i ha_j hb_i hb_j hab
  have hbi : b ≠ i := fun h => hself i (h ▸ hb_i)
  have hbj : b ≠ j := fun h => hself j (h ▸ hb_j)
  have hci : dist (ψ a) (ψ i) = dist (ψ b) (ψ i) :=
    (hK_dist i a ha_i).trans (hK_dist i b hb_i).symm
  have hcj : dist (ψ a) (ψ j) = dist (ψ b) (ψ j) :=
    (hK_dist j a ha_j).trans (hK_dist j b hb_j).symm
  have habne : ψ a ≠ ψ b := fun h => hab (hψinj h)
  exact btw_sep hψccw hψinj hij hbi hbj hci hcj habne


open CounterexampleData in
/-- Compatibility wrapper for callers carrying the bundled `U2Statement`.
Only its `U2FullDistanceClasses` component is used. -/
theorem propositionE_n10 (D : CounterexampleData) (hcard : D.A.card = 10)
    (hM44 : D.IsM44) (hU2 : U2Statement D) : False :=
  propositionE_n10_of_u2FullDistanceClasses D hcard hM44 hU2.2.1

end Problem97
