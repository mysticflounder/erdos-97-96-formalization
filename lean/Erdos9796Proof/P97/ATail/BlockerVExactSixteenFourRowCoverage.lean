/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Phase3SharedPairSeparation
import Erdos9796Proof.P97.FiniteRowCardinality
import Erdos9796Proof.P97.FourPairCoverage
import Erdos9796Proof.P97.ATail.BlockerVExactFifteenFourRowCoverage
import Erdos9796Proof.P97.ATail.KalmansonFourEqualitySchemas

/-!
# Exact-sixteen four-row coverage for the BlockerV residual

At carrier cardinality sixteen, the remaining cap-nine `BlockerV` profile has
seven strict-interior cap points and seven points outside the cap.  Each of the
four selected rows has two fixed cap hits and exactly two outside hits.  The
seventh outside point can occupy any of seven positions after the named cap
packet, in either of the two source-forced orders.

Four two-point supports in seven outside points must overlap. Pairwise cyclic
separation rules out three pairings, and each remaining pairing supplies an
existing metric obstruction. This counting argument preserves the four-family
interface without enumerating assignments.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace BlockerVExactSixteenFourRowCoverage

/-- One row's two support points outside the nine-point long cap. -/
abbrev OutsidePair := {s : Finset (Fin 7) // s.card = 2}

/-- Labels of the seven points outside the long cap. -/
def outsideLabel (i : Fin 7) : Fin 16 :=
  match i.1 with
  | 0 => 1
  | 1 => 3
  | 2 => 4
  | 3 => 5
  | 4 => 13
  | 5 => 14
  | _ => 15

/-- The four row centers, in the order `v`, `xv`, `deleted`, `c`. -/
def centerLabel (row : Fin 4) : Fin 16 :=
  match row.1 with
  | 0 => 8
  | 1 => 9
  | 2 => 10
  | _ => 11

/-- First fixed long-cap hit of each row. -/
def fixedHit₁ (row : Fin 4) : Fin 16 :=
  match row.1 with
  | 0 => 6
  | 1 => 6
  | 2 => 8
  | _ => 8

/-- Second fixed long-cap hit of each row. -/
def fixedHit₂ (row : Fin 4) : Fin 16 :=
  match row.1 with
  | 0 => 9
  | 1 => 7
  | 2 => 9
  | _ => 10

/-- Whether a label belongs to the nine-point long cap. -/
def longLabelBool (point : Fin 16) : Bool :=
  !(outsideLabel 0 == point || outsideLabel 1 == point ||
    outsideLabel 2 == point || outsideLabel 3 == point ||
    outsideLabel 4 == point || outsideLabel 5 == point ||
    outsideLabel 6 == point)

/-- The outside labels selected by one actual row-membership predicate. -/
def outsideHits (membership : Fin 16 → Bool) : Finset (Fin 7) :=
  Finset.univ.filter fun i => membership (outsideLabel i)

/-- A four-element row containing its two fixed cap hits and at most two cap
labels has exactly two outside labels. -/
theorem outsideHits_card_eq_two
    (membership : Fin 16 → Bool) (row : Fin 4)
    (htotal : (Finset.univ.filter fun point => membership point).card = 4)
    (hfixed₁ : membership (fixedHit₁ row) = true)
    (hfixed₂ : membership (fixedHit₂ row) = true)
    (hlong :
      (Finset.univ.filter fun point =>
        membership point && longLabelBool point).card ≤ 2) :
    (outsideHits membership).card = 2 := by
  let support : Finset (Fin 16) := Finset.univ.filter fun p ↦ membership p
  let cap : Finset (Fin 16) := Finset.univ.filter fun p ↦ longLabelBool p
  have hinter : support ∩ cap =
      Finset.univ.filter (fun p ↦ membership p && longLabelBool p) := by
    ext p
    simp [support, cap, Bool.and_eq_true]
  have hcap : (support ∩ cap).card ≤ 2 := by
    rw [hinter]
    exact hlong
  have hcap₁ : ∀ r : Fin 4, longLabelBool (fixedHit₁ r) = true := by decide
  have hcap₂ : ∀ r : Fin 4, longLabelBool (fixedHit₂ r) = true := by decide
  have hdistinct : ∀ r : Fin 4, fixedHit₁ r ≠ fixedHit₂ r := by decide
  have houtside : (support \ cap).card = 2 :=
    FiniteRowCardinality.outsideSlice_card_eq_two support cap (fixedHit₁ row) (fixedHit₂ row)
      htotal hcap (by simp [support, cap, hfixed₁, hcap₁])
      (by simp [support, cap, hfixed₂, hcap₂]) (hdistinct row)
  have hinj : Function.Injective outsideLabel := by decide
  have hlabel : ∀ i, longLabelBool (outsideLabel i) = false := by decide
  have hcover : ∀ p : Fin 16,
      longLabelBool p = false ↔ ∃ i, outsideLabel i = p := by decide
  have himage : (outsideHits membership).image outsideLabel = support \ cap := by
    ext p
    simp only [Finset.mem_image, outsideHits, Finset.mem_filter, Finset.mem_univ,
      true_and, Finset.mem_sdiff, support, cap]
    constructor
    · rintro ⟨i, hi, rfl⟩
      exact ⟨hi, by simp [hlabel i]⟩
    · rintro ⟨hm, hc⟩
      have hfalse : longLabelBool p = false := by simpa using hc
      obtain ⟨i, rfl⟩ := (hcover p).mp hfalse
      exact ⟨i, hm, rfl⟩
  rw [← himage, Finset.card_image_of_injective _ hinj] at houtside
  exact houtside

/-- The normalized outside pair attached to one actual four-point row. -/
def outsidePairOfMembership
    (membership : Fin 16 → Bool) (row : Fin 4)
    (htotal : (Finset.univ.filter fun point => membership point).card = 4)
    (hfixed₁ : membership (fixedHit₁ row) = true)
    (hfixed₂ : membership (fixedHit₂ row) = true)
    (hlong :
      (Finset.univ.filter fun point =>
        membership point && longLabelBool point).card ≤ 2) : OutsidePair :=
  ⟨outsideHits membership,
    outsideHits_card_eq_two membership row htotal hfixed₁ hfixed₂ hlong⟩

/-- Computable membership in the selected four-row determined by its outside pair. -/
def hitsBool (rows : Fin 4 → OutsidePair) (row : Fin 4) (point : Fin 16) : Bool :=
  point == fixedHit₁ row || point == fixedHit₂ row ||
    (decide ((0 : Fin 7) ∈ (rows row).1) && outsideLabel 0 == point) ||
    (decide ((1 : Fin 7) ∈ (rows row).1) && outsideLabel 1 == point) ||
    (decide ((2 : Fin 7) ∈ (rows row).1) && outsideLabel 2 == point) ||
    (decide ((3 : Fin 7) ∈ (rows row).1) && outsideLabel 3 == point) ||
    (decide ((4 : Fin 7) ∈ (rows row).1) && outsideLabel 4 == point) ||
    (decide ((5 : Fin 7) ∈ (rows row).1) && outsideLabel 5 == point) ||
    (decide ((6 : Fin 7) ∈ (rows row).1) && outsideLabel 6 == point)

/-- Membership in the selected four-row determined by its outside pair. -/
def Hits (rows : Fin 4 → OutsidePair) (row : Fin 4) (point : Fin 16) : Prop :=
  hitsBool rows row point = true

instance (rows : Fin 4 → OutsidePair) (row : Fin 4) (point : Fin 16) :
    Decidable (Hits rows row point) := by
  unfold Hits
  infer_instance

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Every encoded hit of a normalized row is an actual hit of the original
membership predicate. -/
theorem membership_of_hits_outsidePairOfMembership
    (rows : Fin 4 → OutsidePair) (membership : Fin 16 → Bool) (row : Fin 4)
    (htotal : (Finset.univ.filter fun point => membership point).card = 4)
    (hfixed₁ : membership (fixedHit₁ row) = true)
    (hfixed₂ : membership (fixedHit₂ row) = true)
    (hlong :
      (Finset.univ.filter fun point =>
        membership point && longLabelBool point).card ≤ 2)
    (hrow : rows row =
      outsidePairOfMembership membership row htotal hfixed₁ hfixed₂ hlong)
    (point : Fin 16) :
    hitsBool rows row point = true → membership point = true := by
  intro hhit
  simp only [hitsBool, Bool.or_eq_true, or_assoc] at hhit
  rcases hhit with hhit | hhit | hhit | hhit | hhit | hhit | hhit | hhit | hhit
  · have heq : point = fixedHit₁ row := by
      simpa only [beq_iff_eq] using hhit
    rw [heq]
    exact hfixed₁
  · have heq : point = fixedHit₂ row := by
      simpa only [beq_iff_eq] using hhit
    rw [heq]
    exact hfixed₂
  all_goals
    simp only [hrow, outsidePairOfMembership, outsideHits,
      Bool.and_eq_true, decide_eq_true_eq, Finset.mem_filter,
      Finset.mem_univ, true_and, beq_iff_eq] at hhit
    rcases hhit with ⟨hmem, heq⟩
    rw [← heq]
    exact hmem

/-- Insert the anonymous sixteenth point into one of the seven positions after
the named cap packet. -/
def position (order : Fin 2) (insertion : Fin 7) (point : Fin 16) : Fin 16 :=
  if hlast : point.1 = 15 then
    ⟨9 + insertion.1, by omega⟩
  else
    let oldPoint : Fin 15 := ⟨point.1, by omega⟩
    let oldPosition := BlockerVExactFifteenFourRowCoverage.position order oldPoint
    if oldPosition.1 < 9 + insertion.1 then
      ⟨oldPosition.1, by omega⟩
    else
      ⟨oldPosition.1 + 1, by omega⟩

/-- Every pair shared by two rows separates their two centers cyclically. -/
def PairwiseSeparated (order : Fin 2) (insertion : Fin 7)
    (rows : Fin 4 → OutsidePair) : Prop :=
  ∀ row₁ row₂ point₁ point₂,
    row₁.1 < row₂.1 → point₁.1 < point₂.1 →
    Hits rows row₁ point₁ → Hits rows row₁ point₂ →
    Hits rows row₂ point₁ → Hits rows row₂ point₂ →
    (SurplusCOMPGBank.btw
        (position order insertion (centerLabel row₁))
        (position order insertion (centerLabel row₂))
        (position order insertion point₁) ↔
      ¬ SurplusCOMPGBank.btw
        (position order insertion (centerLabel row₁))
        (position order insertion (centerLabel row₂))
        (position order insertion point₂))

instance (order : Fin 2) (insertion : Fin 7) (rows : Fin 4 → OutsidePair) :
    Decidable (PairwiseSeparated order insertion rows) := by
  unfold PairwiseSeparated
  infer_instance

/-- The banked `103/243/340` five-point motif. -/
def OldCMotifOccurs (order : Fin 2) (insertion : Fin 7)
    (rows : Fin 4 → OutsidePair) : Prop :=
  ∃ x : Fin 16,
    position order insertion 9 < position order insertion x ∧
    Hits rows 2 x ∧ Hits rows 1 x

/-- The banked `043/140/203` five-point motif. -/
def OldBMotifOccurs (order : Fin 2) (insertion : Fin 7)
    (rows : Fin 4 → OutsidePair) : Prop :=
  ∃ x y : Fin 16,
    position order insertion 10 < position order insertion x ∧
    position order insertion x < position order insertion y ∧
    Hits rows 0 x ∧ Hits rows 0 y ∧
    Hits rows 3 y ∧ Hits rows 2 x

/-- The first new seven-point four-equality motif. -/
def NewAMotifOccurs (order : Fin 2) (insertion : Fin 7)
    (rows : Fin 4 → OutsidePair) : Prop :=
  ∃ f g : Fin 16,
    position order insertion 9 < position order insertion f ∧
    position order insertion f < position order insertion g ∧
    Hits rows 3 f ∧ Hits rows 1 f ∧ Hits rows 0 g

/-- The reflected new seven-point four-equality motif. -/
def NewBMotifOccurs (order : Fin 2) (insertion : Fin 7)
    (rows : Fin 4 → OutsidePair) : Prop :=
  ∃ f g : Fin 16,
    position order insertion 9 < position order insertion f ∧
    position order insertion f < position order insertion g ∧
    Hits rows 3 g ∧ Hits rows 1 g

/-- One of the four metric obstruction families occurs. -/
def MetricObstructionOccurs (order : Fin 2) (insertion : Fin 7)
    (rows : Fin 4 → OutsidePair) : Prop :=
  OldCMotifOccurs order insertion rows ∨
  OldBMotifOccurs order insertion rows ∨
  NewAMotifOccurs order insertion rows ∨
  NewBMotifOccurs order insertion rows

instance (order : Fin 2) (insertion : Fin 7) (rows : Fin 4 → OutsidePair) :
    Decidable (MetricObstructionOccurs order insertion rows) := by
  unfold MetricObstructionOccurs OldCMotifOccurs OldBMotifOccurs
    NewAMotifOccurs NewBMotifOccurs
  infer_instance

/-- An outside support member is a hit of its row. -/
private theorem hits_outside_of_mem (rows : Fin 4 → OutsidePair) (r : Fin 4)
    (i : Fin 7) (hi : i ∈ (rows r).val) : Hits rows r (outsideLabel i) := by
  fin_cases i <;> simp_all [Hits, hitsBool, outsideLabel]

/-- Insertion leaves every outside point at position at least nine. -/
private theorem outside_position_ge_nine (o : Fin 2) (ins : Fin 7) (i : Fin 7) :
    9 ≤ (position o ins (outsideLabel i)).val := by
  fin_cases o <;> fin_cases ins <;> fin_cases i <;> decide

/-- All outside labels lie beyond every row center in both orders. -/
private theorem outside_not_btw (o : Fin 2) (ins : Fin 7) (r s : Fin 4) (i : Fin 7) :
    ¬ SurplusCOMPGBank.btw (position o ins (centerLabel r))
      (position o ins (centerLabel s)) (position o ins (outsideLabel i)) := by
  have hc : ∀ (o : Fin 2) (ins : Fin 7) (r : Fin 4),
      (position o ins (centerLabel r)).val < 9 := by decide
  have hr := hc o ins r
  have hs := hc o ins s
  have hi := outside_position_ge_nine o ins i
  unfold SurplusCOMPGBank.btw
  simp only [Fin.lt_def]
  omega

/-- Two distinct shared hits cannot both lie outside the centers' interval. -/
private theorem false_of_shared_not_btw {o : Fin 2} {ins : Fin 7}
    {rows : Fin 4 → OutsidePair} (hsep : PairwiseSeparated o ins rows)
    (r s : Fin 4) (hrs : r.val < s.val) (p q : Fin 16) (hpq : p ≠ q)
    (hrp : Hits rows r p) (hrq : Hits rows r q)
    (hsp : Hits rows s p) (hsq : Hits rows s q)
    (hp : ¬ SurplusCOMPGBank.btw (position o ins (centerLabel r))
      (position o ins (centerLabel s)) (position o ins p))
    (hq : ¬ SurplusCOMPGBank.btw (position o ins (centerLabel r))
      (position o ins (centerLabel s)) (position o ins q)) : False := by
  rcases lt_or_gt_of_ne hpq with hlt | hlt
  · exact hp ((hsep r s p q hrs hlt hrp hrq hsp hsq).mpr hq)
  · exact hq ((hsep r s q p hrs hlt hrq hrp hsq hsp).mpr hp)

/-- A shared fixed hit outside the interval forbids a shared outside support. -/
private theorem disjoint_of_fixed_hit {o : Fin 2} {ins : Fin 7}
    {rows : Fin 4 → OutsidePair} (hsep : PairwiseSeparated o ins rows)
    (r s : Fin 4) (hrs : r.val < s.val) (p : Fin 16)
    (hrp : Hits rows r p) (hsp : Hits rows s p) (hne : ∀ i, p ≠ outsideLabel i)
    (hp : ¬ SurplusCOMPGBank.btw (position o ins (centerLabel r))
      (position o ins (centerLabel s)) (position o ins p)) :
    Disjoint (rows r).val (rows s).val := by
  apply Finset.disjoint_left.mpr
  intro i hir his
  exact false_of_shared_not_btw hsep r s hrs p (outsideLabel i) (hne i)
    hrp (hits_outside_of_mem rows r i hir) hsp (hits_outside_of_mem rows s i his)
    hp (outside_not_btw o ins r s i)

/-- The fixed labels used as motif witnesses retain their cap order. -/
private theorem fixed_motif_order (o : Fin 2) (ins : Fin 7) :
    position o ins 10 < position o ins 9 ∧ position o ins 9 < position o ins 7 := by
  fin_cases o <;> fin_cases ins <;> decide

/-- The cap label seven precedes every outside label. -/
private theorem seven_lt_outside (o : Fin 2) (ins : Fin 7) (i : Fin 7) :
    position o ins 7 < position o ins (outsideLabel i) := by
  have h7 : ∀ (o : Fin 2) (ins : Fin 7), (position o ins 7).val < 9 := by decide
  change (position o ins 7).val < (position o ins (outsideLabel i)).val
  exact lt_of_lt_of_le (h7 o ins) (outside_position_ge_nine o ins i)

/-- Exhaustive coverage of the exact-sixteen four-row core by four reusable
metric obstruction families. -/
theorem metricObstructionOccurs_of_pairwiseSeparated :
    ∀ (order : Fin 2) (insertion : Fin 7) (rows : Fin 4 → OutsidePair),
      PairwiseSeparated order insertion rows →
        MetricObstructionOccurs order insertion rows := by
  intro order insertion rows hsep
  have h01 : Disjoint (rows 0).val (rows 1).val := by
    apply disjoint_of_fixed_hit hsep 0 1 (by decide) 6
    · simp [Hits, hitsBool, fixedHit₁]
    · simp [Hits, hitsBool, fixedHit₁]
    · decide
    · fin_cases order <;> fin_cases insertion <;> decide
  have h02 : Disjoint (rows 0).val (rows 2).val := by
    apply disjoint_of_fixed_hit hsep 0 2 (by decide) 9
    · simp [Hits, hitsBool, fixedHit₂]
    · simp [Hits, hitsBool, fixedHit₂]
    · decide
    · fin_cases order <;> fin_cases insertion <;> decide
  have h23 : Disjoint (rows 2).val (rows 3).val := by
    apply disjoint_of_fixed_hit hsep 2 3 (by decide) 8
    · simp [Hits, hitsBool, fixedHit₁]
    · simp [Hits, hitsBool, fixedHit₁]
    · decide
    · fin_cases order <;> fin_cases insertion <;> decide
  obtain hAD | hBC | hBD := FourPairCoverage.overlap_of_three_disjoint_pairs Finset.univ
    (rows 0).val (rows 1).val (rows 2).val (rows 3).val (by decide)
    (Finset.subset_univ _) (Finset.subset_univ _) (Finset.subset_univ _) (Finset.subset_univ _)
    (rows 0).property (rows 1).property (rows 2).property (rows 3).property h01 h02 h23
  · obtain ⟨i, hi⟩ := hAD
    obtain ⟨h0, h3⟩ := Finset.mem_inter.mp hi
    refine Or.inr (Or.inl ⟨9, outsideLabel i, (fixed_motif_order order insertion).1,
      lt_trans (fixed_motif_order order insertion).2 (seven_lt_outside order insertion i),
      ?_, hits_outside_of_mem rows 0 i h0, hits_outside_of_mem rows 3 i h3, ?_⟩)
    · simp [Hits, hitsBool, fixedHit₂]
    · simp [Hits, hitsBool, fixedHit₂]
  · obtain ⟨i, hi⟩ := hBC
    obtain ⟨h1, h2⟩ := Finset.mem_inter.mp hi
    exact Or.inl ⟨outsideLabel i,
      lt_trans (fixed_motif_order order insertion).2 (seven_lt_outside order insertion i),
      hits_outside_of_mem rows 2 i h2, hits_outside_of_mem rows 1 i h1⟩
  · obtain ⟨i, hi⟩ := hBD
    obtain ⟨h1, h3⟩ := Finset.mem_inter.mp hi
    exact Or.inr (Or.inr (Or.inr ⟨7, outsideLabel i,
      (fixed_motif_order order insertion).2, seven_lt_outside order insertion i,
      hits_outside_of_mem rows 3 i h3, hits_outside_of_mem rows 1 i h1⟩))

/-- The two possible orientations in which the named exact-sixteen order can
sit in a fixed CCW boundary enumeration. -/
inductive Orientation where
  | forward
  | reverse
deriving DecidableEq

/-- Strict comparison of boundary indices in the selected orientation. -/
def OrientedLt {n : ℕ} (orientation : Orientation)
    (labelIndex : Fin 16 → Fin n) (point₁ point₂ : Fin 16) : Prop :=
  match orientation with
  | .forward => labelIndex point₁ < labelIndex point₂
  | .reverse => labelIndex point₂ < labelIndex point₁

/-- The boundary indices respect the selected exact-sixteen cyclic order. -/
def PositionEmbedding {n : ℕ} (orientation : Orientation) (order : Fin 2)
    (insertion : Fin 7) (labelIndex : Fin 16 → Fin n) : Prop :=
  ∀ point₁ point₂,
    position order insertion point₁ < position order insertion point₂ →
      OrientedLt orientation labelIndex point₁ point₂

/-- Every two encoded hits in one row lie on that row's shell. -/
def RealizesRows {n : ℕ} (boundary : Fin n → ℝ²)
    (labelIndex : Fin 16 → Fin n) (rows : Fin 4 → OutsidePair) : Prop :=
  ∀ row point₁ point₂,
    Hits rows row point₁ → Hits rows row point₂ →
      dist (boundary (labelIndex (centerLabel row)))
          (boundary (labelIndex point₁)) =
        dist (boundary (labelIndex (centerLabel row)))
          (boundary (labelIndex point₂))

/-- Every encoded exact-sixteen order is a permutation of the labels. -/
theorem position_injective (order : Fin 2) (insertion : Fin 7) :
    Function.Injective (position order insertion) := by
  fin_cases order <;> fin_cases insertion <;> decide

/-- An order-preserving exact-sixteen label map is injective. -/
theorem labelIndex_injective_of_positionEmbedding {n : ℕ}
    (orientation : Orientation) (order : Fin 2) (insertion : Fin 7)
    (labelIndex : Fin 16 → Fin n)
    (hposition : PositionEmbedding orientation order insertion labelIndex) :
    Function.Injective labelIndex := by
  intro point₁ point₂ heq
  by_contra hne
  have hposne :
      position order insertion point₁ ≠ position order insertion point₂ := by
    intro h
    exact hne (position_injective order insertion h)
  rcases lt_or_gt_of_ne hposne with hlt | hgt
  · cases orientation with
    | forward => exact (ne_of_lt (hposition point₁ point₂ hlt)) heq
    | reverse => exact (ne_of_gt (hposition point₁ point₂ hlt)) heq
  · cases orientation with
    | forward => exact (ne_of_gt (hposition point₂ point₁ hgt)) heq
    | reverse => exact (ne_of_lt (hposition point₂ point₁ hgt)) heq

/-- `PositionEmbedding` reflects as well as preserves comparisons. -/
theorem position_lt_iff_orientedLt {n : ℕ} (orientation : Orientation)
    (order : Fin 2) (insertion : Fin 7)
    (labelIndex : Fin 16 → Fin n)
    (hposition : PositionEmbedding orientation order insertion labelIndex)
    (point₁ point₂ : Fin 16) :
    position order insertion point₁ < position order insertion point₂ ↔
      OrientedLt orientation labelIndex point₁ point₂ := by
  constructor
  · exact hposition point₁ point₂
  · intro horiented
    rcases lt_trichotomy (position order insertion point₁)
        (position order insertion point₂) with h | h | h
    · exact h
    · have heq := position_injective order insertion h
      subst point₂
      cases orientation <;> exact (lt_irrefl _ horiented).elim
    · have hreverse := hposition point₂ point₁ h
      cases orientation with
      | forward =>
          exact (not_lt_of_ge (le_of_lt hreverse) horiented).elim
      | reverse =>
          exact (not_lt_of_ge (le_of_lt horiented) hreverse).elim

/-- Pairwise separation follows from the realized shell rows in a convex
boundary embedding. -/
theorem pairwiseSeparated_of_positionEmbedding_realizesRows
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (order : Fin 2) (insertion : Fin 7)
    (labelIndex : Fin 16 → Fin n) (rows : Fin 4 → OutsidePair)
    (hposition : PositionEmbedding orientation order insertion labelIndex)
    (hrows : RealizesRows boundary labelIndex rows) :
    PairwiseSeparated order insertion rows := by
  intro row₁ row₂ point₁ point₂ hrow hpoint hp11 hp12 hp21 hp22
  have hlabelInjective :=
    labelIndex_injective_of_positionEmbedding orientation order insertion
      labelIndex hposition
  have hcenters : centerLabel row₁ ≠ centerLabel row₂ := by
    fin_cases row₁ <;> fin_cases row₂ <;> simp_all [centerLabel]
  have hpoint₂_ne_center₁ : point₂ ≠ centerLabel row₁ := by
    intro heq
    subst point₂
    fin_cases row₁ <;> simp [Hits, hitsBool, fixedHit₁, fixedHit₂,
      centerLabel, outsideLabel] at hp12
  have hpoint₂_ne_center₂ : point₂ ≠ centerLabel row₂ := by
    intro heq
    subst point₂
    fin_cases row₂ <;> simp [Hits, hitsBool, fixedHit₁, fixedHit₂,
      centerLabel, outsideLabel] at hp22
  have hfirst :
      dist (boundary (labelIndex point₁))
          (boundary (labelIndex (centerLabel row₁))) =
        dist (boundary (labelIndex point₂))
          (boundary (labelIndex (centerLabel row₁))) := by
    simpa only [dist_comm] using hrows row₁ point₁ point₂ hp11 hp12
  have hsecond :
      dist (boundary (labelIndex point₁))
          (boundary (labelIndex (centerLabel row₂))) =
        dist (boundary (labelIndex point₂))
          (boundary (labelIndex (centerLabel row₂))) := by
    simpa only [dist_comm] using hrows row₂ point₁ point₂ hp21 hp22
  have hsep := SurplusCOMPGBank.btw_sep hboundaryCcw hboundaryInjective
    (hlabelInjective.ne hcenters)
    (hlabelInjective.ne hpoint₂_ne_center₁)
    (hlabelInjective.ne hpoint₂_ne_center₂)
    hfirst hsecond
    (hboundaryInjective.ne (hlabelInjective.ne (ne_of_lt hpoint)))
  have hbtw (x y z : Fin 16) :
      SurplusCOMPGBank.btw
          (position order insertion x) (position order insertion y)
          (position order insertion z) ↔
        SurplusCOMPGBank.btw
          (labelIndex x) (labelIndex y) (labelIndex z) := by
    unfold SurplusCOMPGBank.btw
    rw [position_lt_iff_orientedLt orientation order insertion labelIndex
        hposition x z,
      position_lt_iff_orientedLt orientation order insertion labelIndex
        hposition z y,
      position_lt_iff_orientedLt orientation order insertion labelIndex
        hposition y z,
      position_lt_iff_orientedLt orientation order insertion labelIndex
        hposition z x]
    cases orientation <;> simp only [OrientedLt, and_comm, or_comm]
  rw [hbtw, hbtw]
  exact hsep

/-- Orientation-neutral consumer for the `043/140/203` five-point motif. -/
private theorem false_of_oriented_five_shell_equalities_B
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (labelIndex : Fin 16 → Fin A.card)
    {p0 p1 p2 p3 p4 : Fin 16}
    (h01 : OrientedLt orientation labelIndex p0 p1)
    (h12 : OrientedLt orientation labelIndex p1 p2)
    (h23 : OrientedLt orientation labelIndex p2 p3)
    (h34 : OrientedLt orientation labelIndex p3 p4)
    (h043 : dist (boundary (labelIndex p0)) (boundary (labelIndex p4)) =
      dist (boundary (labelIndex p0)) (boundary (labelIndex p3)))
    (h140 : dist (boundary (labelIndex p1)) (boundary (labelIndex p4)) =
      dist (boundary (labelIndex p1)) (boundary (labelIndex p0)))
    (h203 : dist (boundary (labelIndex p2)) (boundary (labelIndex p0)) =
      dist (boundary (labelIndex p2)) (boundary (labelIndex p3))) :
    False := by
  cases orientation with
  | forward =>
      exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_043_140_203
        hA hboundaryInjective hboundaryImage hboundaryCcw
        h01 h12 h23 h34 h043 h140 h203
  | reverse =>
      exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_410_304_241
        hA hboundaryInjective hboundaryImage hboundaryCcw
        h34 h23 h12 h01 h043.symm h140 h203

/-- Orientation-neutral consumer for the `103/243/340` five-point motif. -/
private theorem false_of_oriented_five_shell_equalities_C
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (labelIndex : Fin 16 → Fin A.card)
    {p0 p1 p2 p3 p4 : Fin 16}
    (h01 : OrientedLt orientation labelIndex p0 p1)
    (h12 : OrientedLt orientation labelIndex p1 p2)
    (h23 : OrientedLt orientation labelIndex p2 p3)
    (h34 : OrientedLt orientation labelIndex p3 p4)
    (h103 : dist (boundary (labelIndex p1)) (boundary (labelIndex p0)) =
      dist (boundary (labelIndex p1)) (boundary (labelIndex p3)))
    (h243 : dist (boundary (labelIndex p2)) (boundary (labelIndex p4)) =
      dist (boundary (labelIndex p2)) (boundary (labelIndex p3)))
    (h340 : dist (boundary (labelIndex p3)) (boundary (labelIndex p4)) =
      dist (boundary (labelIndex p3)) (boundary (labelIndex p0))) :
    False := by
  cases orientation with
  | forward =>
      exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_103_243_340
        hA hboundaryInjective hboundaryImage hboundaryCcw
        h01 h12 h23 h34 h103 h243 h340
  | reverse =>
      exact CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities_341_201_104
        hA hboundaryInjective hboundaryImage hboundaryCcw
        h34 h23 h12 h01 h103 h243 h340

/-- Orientation-neutral consumer for the first seven-point motif. -/
private theorem false_of_oriented_seven_shell_equalities_A
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (labelIndex : Fin 16 → Fin A.card)
    {a b c d e f g : Fin 16}
    (hab : OrientedLt orientation labelIndex a b)
    (hbc : OrientedLt orientation labelIndex b c)
    (hcd : OrientedLt orientation labelIndex c d)
    (hde : OrientedLt orientation labelIndex d e)
    (hef : OrientedLt orientation labelIndex e f)
    (hfg : OrientedLt orientation labelIndex f g)
    (hbae : dist (boundary (labelIndex b)) (boundary (labelIndex a)) =
      dist (boundary (labelIndex b)) (boundary (labelIndex e)))
    (hcbf : dist (boundary (labelIndex c)) (boundary (labelIndex b)) =
      dist (boundary (labelIndex c)) (boundary (labelIndex f)))
    (hdbe : dist (boundary (labelIndex d)) (boundary (labelIndex b)) =
      dist (boundary (labelIndex d)) (boundary (labelIndex e)))
    (heaf : dist (boundary (labelIndex e)) (boundary (labelIndex a)) =
      dist (boundary (labelIndex e)) (boundary (labelIndex f))) : False := by
  cases orientation with
  | forward =>
      exact CapCrossingKalmansonBridge.false_of_seven_ccw_four_shell_equalities_A_of_increasing
        hA hboundaryInjective hboundaryImage hboundaryCcw
        hab hbc hcd hde hef hfg hbae hcbf hdbe heaf
  | reverse =>
      exact CapCrossingKalmansonBridge.false_of_seven_ccw_four_shell_equalities_A_of_decreasing
        hA hboundaryInjective hboundaryImage hboundaryCcw
        hab hbc hcd hde hef hfg hbae hcbf hdbe heaf

/-- Orientation-neutral consumer for the reflected seven-point motif. -/
private theorem false_of_oriented_seven_shell_equalities_B
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (labelIndex : Fin 16 → Fin A.card)
    {a b c d e f g : Fin 16}
    (hab : OrientedLt orientation labelIndex a b)
    (hbc : OrientedLt orientation labelIndex b c)
    (hcd : OrientedLt orientation labelIndex c d)
    (hde : OrientedLt orientation labelIndex d e)
    (hef : OrientedLt orientation labelIndex e f)
    (hfg : OrientedLt orientation labelIndex f g)
    (hbae : dist (boundary (labelIndex b)) (boundary (labelIndex a)) =
      dist (boundary (labelIndex b)) (boundary (labelIndex e)))
    (hcbg : dist (boundary (labelIndex c)) (boundary (labelIndex b)) =
      dist (boundary (labelIndex c)) (boundary (labelIndex g)))
    (hdbe : dist (boundary (labelIndex d)) (boundary (labelIndex b)) =
      dist (boundary (labelIndex d)) (boundary (labelIndex e)))
    (heag : dist (boundary (labelIndex e)) (boundary (labelIndex a)) =
      dist (boundary (labelIndex e)) (boundary (labelIndex g))) : False := by
  cases orientation with
  | forward =>
      exact CapCrossingKalmansonBridge.false_of_seven_ccw_four_shell_equalities_B_of_increasing
        hA hboundaryInjective hboundaryImage hboundaryCcw
        hab hbc hcd hde hef hfg hbae hcbg hdbe heag
  | reverse =>
      exact CapCrossingKalmansonBridge.false_of_seven_ccw_four_shell_equalities_B_of_decreasing
        hA hboundaryInjective hboundaryImage hboundaryCcw
        hab hbc hcd hde hef hfg hbae hcbg hdbe heag

/-- The exhaustive coverage and the four metric kernels rule out every
geometrically realized exact-sixteen assignment. -/
theorem false_of_pairwiseSeparated_realizedRows
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (order : Fin 2) (insertion : Fin 7)
    (labelIndex : Fin 16 → Fin A.card) (rows : Fin 4 → OutsidePair)
    (hposition : PositionEmbedding orientation order insertion labelIndex)
    (hrows : RealizesRows boundary labelIndex rows)
    (hseparated : PairwiseSeparated order insertion rows) : False := by
  have h68 := hposition 6 8 (by
    fin_cases order <;> fin_cases insertion <;> decide)
  have h8c := hposition 8 11 (by
    fin_cases order <;> fin_cases insertion <;> decide)
  have h810 := hposition 8 10 (by
    fin_cases order <;> fin_cases insertion <;> decide)
  have hc10 := hposition 11 10 (by
    fin_cases order <;> fin_cases insertion <;> decide)
  have h109 := hposition 10 9 (by
    fin_cases order <;> fin_cases insertion <;> decide)
  have h06 : Hits rows 0 6 := by
    simp [Hits, hitsBool, fixedHit₁, fixedHit₂]
  have h09 : Hits rows 0 9 := by
    simp [Hits, hitsBool, fixedHit₁, fixedHit₂]
  have h16 : Hits rows 1 6 := by
    simp [Hits, hitsBool, fixedHit₁, fixedHit₂]
  have h28 : Hits rows 2 8 := by
    simp [Hits, hitsBool, fixedHit₁, fixedHit₂]
  have h29 : Hits rows 2 9 := by
    simp [Hits, hitsBool, fixedHit₁, fixedHit₂]
  have h38 : Hits rows 3 8 := by
    simp [Hits, hitsBool, fixedHit₁, fixedHit₂]
  obtain hmotif :=
    metricObstructionOccurs_of_pairwiseSeparated order insertion rows hseparated
  rcases hmotif with hC | hB | hNewA | hNewB
  · rcases hC with ⟨x, h9x, h2x, h1x⟩
    exact false_of_oriented_five_shell_equalities_C
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      h68 h810 h109 (hposition 9 x h9x)
      (hrows 0 6 9 h06 h09)
      (hrows 2 x 9 h2x h29)
      (hrows 1 x 6 h1x h16)
  · rcases hB with ⟨x, y, h10x, hxy, h0x, h0y, h3y, h2x⟩
    exact false_of_oriented_five_shell_equalities_B
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      h8c hc10 (hposition 10 x h10x) (hposition x y hxy)
      (hrows 0 y x h0y h0x)
      (hrows 3 y 8 h3y h38)
      (hrows 2 8 x h28 h2x)
  · rcases hNewA with ⟨f, g, h9f, hfg, h3f, h1f, _h0g⟩
    exact false_of_oriented_seven_shell_equalities_A
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      h68 h8c hc10 h109 (hposition 9 f h9f) (hposition f g hfg)
      (hrows 0 6 9 h06 h09)
      (hrows 3 8 f h38 h3f)
      (hrows 2 8 9 h28 h29)
      (hrows 1 6 f h16 h1f)
  · rcases hNewB with ⟨f, g, h9f, hfg, h3g, h1g⟩
    exact false_of_oriented_seven_shell_equalities_B
      hA hboundaryInjective hboundaryImage hboundaryCcw orientation labelIndex
      h68 h8c hc10 h109 (hposition 9 f h9f) (hposition f g hfg)
      (hrows 0 6 9 h06 h09)
      (hrows 3 8 g h38 h3g)
      (hrows 2 8 9 h28 h29)
      (hrows 1 6 g h16 h1g)

/-- Consumer-facing form: pairwise separation is derived from convex boundary
geometry. -/
theorem false_of_positionEmbedding_realizedRows
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (order : Fin 2) (insertion : Fin 7)
    (labelIndex : Fin 16 → Fin A.card) (rows : Fin 4 → OutsidePair)
    (hposition : PositionEmbedding orientation order insertion labelIndex)
    (hrows : RealizesRows boundary labelIndex rows) : False := by
  exact false_of_pairwiseSeparated_realizedRows hA hboundaryInjective
    hboundaryImage hboundaryCcw orientation order insertion labelIndex rows
    hposition hrows
    (pairwiseSeparated_of_positionEmbedding_realizesRows
      hboundaryInjective hboundaryCcw orientation order insertion labelIndex
      rows hposition hrows)

/-- Geometric ingress in terms of the four actual row-membership predicates. -/
theorem false_of_positionEmbedding_membershipRows
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundaryInjective : Function.Injective boundary)
    (hboundaryImage : Finset.univ.image boundary = A)
    (hboundaryCcw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (orientation : Orientation) (order : Fin 2) (insertion : Fin 7)
    (labelIndex : Fin 16 → Fin A.card)
    (membership : Fin 4 → Fin 16 → Bool)
    (hposition : PositionEmbedding orientation order insertion labelIndex)
    (htotal : ∀ row,
      (Finset.univ.filter fun point => membership row point).card = 4)
    (hfixed₁ : ∀ row, membership row (fixedHit₁ row) = true)
    (hfixed₂ : ∀ row, membership row (fixedHit₂ row) = true)
    (hlong : ∀ row,
      (Finset.univ.filter fun point =>
        membership row point && longLabelBool point).card ≤ 2)
    (hshell : ∀ row point₁ point₂,
      membership row point₁ = true → membership row point₂ = true →
        dist (boundary (labelIndex (centerLabel row)))
            (boundary (labelIndex point₁)) =
          dist (boundary (labelIndex (centerLabel row)))
            (boundary (labelIndex point₂))) : False := by
  let rows : Fin 4 → OutsidePair := fun row =>
    outsidePairOfMembership (membership row) row
      (htotal row) (hfixed₁ row) (hfixed₂ row) (hlong row)
  apply false_of_positionEmbedding_realizedRows hA hboundaryInjective
    hboundaryImage hboundaryCcw orientation order insertion labelIndex rows
    hposition
  intro row point₁ point₂ hhit₁ hhit₂
  apply hshell row point₁ point₂
  · exact membership_of_hits_outsidePairOfMembership rows (membership row) row
      (htotal row) (hfixed₁ row) (hfixed₂ row) (hlong row) (by rfl)
      point₁ hhit₁
  · exact membership_of_hits_outsidePairOfMembership rows (membership row) row
      (htotal row) (hfixed₁ row) (hfixed₂ row) (hlong row) (by rfl)
      point₂ hhit₂

end BlockerVExactSixteenFourRowCoverage
end Problem97
