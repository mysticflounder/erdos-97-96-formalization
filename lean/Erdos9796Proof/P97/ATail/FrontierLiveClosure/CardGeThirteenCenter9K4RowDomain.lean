/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

/-!
# The exact-thirteen center-9 row-domain certificate

The discovery certificate uses the cyclic label order
`[2, 8, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7]`.  This module works in the
corresponding positional `Fin 13` coordinates, so raw center `9` is position
`2`.

The five source rows are row-tagged.  In particular, the two rows with raw
center `0` remain independent hypotheses; they must not be collapsed into one
`RowPattern` entry.  `Center9FourSupportRow` is the narrow proof-facing ingress
for one arbitrary four-element support at raw center `9`.

The finite classifier below covers all 495 supports by 29 transparent
certificate families.  Ordinary kernel reduction checks the finite coverage;
the soundness theorem proves each family's one-, two-, or three-form
cancellation from the row equalities.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CardGeThirteenCenter9K4RowDomain

open GenericRowNogoodCertificate
open Census554.EqualityCore
open scoped EuclideanGeometry

/-- All distances from one tagged center to the listed support are equal. -/
def RowDistancesEqual (boundary : Fin 13 → ℝ²) (center : Fin 13)
    (support : Finset (Fin 13)) : Prop :=
  ∀ ⦃u⦄, u ∈ support → ∀ ⦃v⦄, v ∈ support →
    dist (boundary center) (boundary u) =
      dist (boundary center) (boundary v)

/-- Raw-center-11 support `{0,2,3,5}`, in positional coordinates. -/
def raw11Support : Finset (Fin 13) := {10, 0, 7, 9}

/-- Raw-center-10 support `{1,6,9,12}`, in positional coordinates. -/
def raw10Support : Finset (Fin 13) := {6, 11, 2, 5}

/-- First raw-center-0 support `{4,7,8,11}`, in positional coordinates. -/
def raw0FirstSupport : Finset (Fin 13) := {8, 12, 1, 4}

/-- Second raw-center-0 support `{3,9,10,12}`, in positional coordinates. -/
def raw0SecondSupport : Finset (Fin 13) := {7, 2, 3, 5}

/-- Raw-center-1 support `{2,6,7,10}`, in positional coordinates. -/
def raw1Support : Finset (Fin 13) := {0, 11, 12, 3}

/-- The five fixed, independently tagged source-row equalities. -/
structure FixedFiveRows (boundary : Fin 13 → ℝ²) : Prop where
  raw11 : RowDistancesEqual boundary 4 raw11Support
  raw10 : RowDistancesEqual boundary 3 raw10Support
  raw0First : RowDistancesEqual boundary 10 raw0FirstSupport
  raw0Second : RowDistancesEqual boundary 10 raw0SecondSupport
  raw1 : RowDistancesEqual boundary 6 raw1Support

/-- One arbitrary four-support row at raw center `9` (positional center `2`).
Only positive support incidence is recorded. -/
structure Center9FourSupportRow (boundary : Fin 13 → ℝ²)
    (support : Finset (Fin 13)) : Prop where
  card_eq_four : support.card = 4
  center_not_mem : 2 ∉ support
  equalDistances : RowDistancesEqual boundary 2 support

/-- A direct cancellation endpoint for the certificate bank's one-, two-, and
three-form terminals.  The equality can be proved from any row-tagged source;
no one-row-per-geometric-center encoding is required. -/
theorem false_of_one_two_or_three_kalmanson_terms_of_sum_eq
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (terms : List (WeightedKalmansonTerm (Fin n)))
    (hlength : terms.length = 1 ∨ terms.length = 2 ∨ terms.length = 3)
    (hcheck : terms.all WeightedKalmansonTerm.check = true)
    (hcancel :
      (terms.flatMap WeightedKalmansonTerm.leftEdges |>.map
        (edgeDist boundary)).sum =
      (terms.flatMap WeightedKalmansonTerm.rightEdges |>.map
        (edgeDist boundary)).sum) : False := by
  have hne : terms ≠ [] := by
    intro hnil
    subst terms
    simp at hlength
  have hall : ∀ term ∈ terms, term.check = true := by
    simpa only [List.all_eq_true] using hcheck
  have hlt := sum_lt_of_weightedKalmansonTerms hA hinj himage hccw
    terms hne hall
  exact (ne_of_lt hlt) hcancel

/-- One unit-weight strict form in the compressed certificate bank. -/
def unitKalmansonTerm (a b c d : Fin 13) (form : KalmansonForm) :
    WeightedKalmansonTerm (Fin 13) :=
  { quad := { a := a, b := b, c := c, d := d }
    form := form
    weight := 1 }

/-- The 29 distinct certificate tuples used by the 495 center-9 supports. -/
def certificateTerms : Fin 29 → List (WeightedKalmansonTerm (Fin 13)) := ![
  [unitKalmansonTerm 0 1 2 6 .innerOuter,
    unitKalmansonTerm 0 2 4 10 .adjacentSides,
    unitKalmansonTerm 1 6 10 12 .adjacentSides],
  [unitKalmansonTerm 0 1 2 6 .innerOuter,
    unitKalmansonTerm 0 2 4 9 .adjacentSides,
    unitKalmansonTerm 1 6 10 12 .adjacentSides],
  [unitKalmansonTerm 0 1 2 6 .innerOuter,
    unitKalmansonTerm 1 6 10 12 .adjacentSides],
  [unitKalmansonTerm 0 2 6 11 .adjacentSides],
  [unitKalmansonTerm 0 2 6 12 .adjacentSides],
  [unitKalmansonTerm 0 2 4 10 .adjacentSides],
  [unitKalmansonTerm 0 2 4 6 .innerOuter,
    unitKalmansonTerm 2 6 10 12 .adjacentSides],
  [unitKalmansonTerm 0 2 4 7 .adjacentSides],
  [unitKalmansonTerm 0 2 4 9 .adjacentSides],
  [unitKalmansonTerm 1 2 10 12 .adjacentSides],
  [unitKalmansonTerm 1 2 6 11 .adjacentSides,
    unitKalmansonTerm 1 6 10 12 .adjacentSides],
  [unitKalmansonTerm 2 6 11 12 .innerOuter],
  [unitKalmansonTerm 2 3 10 11 .innerOuter],
  [unitKalmansonTerm 2 3 10 11 .innerOuter,
    unitKalmansonTerm 2 6 11 12 .innerOuter],
  [unitKalmansonTerm 2 3 6 10 .innerOuter],
  [unitKalmansonTerm 2 3 6 11 .innerOuter],
  [unitKalmansonTerm 2 3 6 11 .innerOuter,
    unitKalmansonTerm 2 6 11 12 .innerOuter],
  [unitKalmansonTerm 2 3 7 10 .adjacentSides],
  [unitKalmansonTerm 2 3 5 10 .adjacentSides],
  [unitKalmansonTerm 2 3 5 6 .innerOuter],
  [unitKalmansonTerm 2 3 5 6 .innerOuter,
    unitKalmansonTerm 2 5 7 10 .adjacentSides],
  [unitKalmansonTerm 2 3 5 11 .innerOuter],
  [unitKalmansonTerm 2 3 5 11 .innerOuter,
    unitKalmansonTerm 2 6 11 12 .innerOuter],
  [unitKalmansonTerm 2 4 7 10 .innerOuter],
  [unitKalmansonTerm 2 4 7 9 .innerOuter],
  [unitKalmansonTerm 2 4 8 10 .adjacentSides],
  [unitKalmansonTerm 2 4 9 10 .innerOuter],
  [unitKalmansonTerm 2 4 5 10 .adjacentSides,
    unitKalmansonTerm 3 6 10 12 .adjacentSides],
  [unitKalmansonTerm 2 5 7 10 .adjacentSides]
]

/-- The common support core for each of the 29 certificate families. -/
def requiredSupport : Fin 29 → Finset (Fin 13) := ![
  {1, 8, 10}, {1, 9}, {0, 1}, {0, 11}, {0, 12}, {0, 10},
  {4, 10}, {0, 7}, {0, 9}, {1, 12}, {1, 11}, {11, 12},
  {3, 11}, {3, 12}, {3, 6}, {6, 11}, {6, 12}, {3, 7},
  {3, 5}, {5, 6}, {6, 7}, {5, 11}, {5, 12}, {7, 10},
  {7, 9}, {4, 8}, {9, 10}, {1, 4, 5, 9}, {5, 7}
]

/-- The directly enumerated domain of four-subsets avoiding positional center
`2`.  Its `Fintype` enumerator has 495, rather than 8192, entries. -/
abbrev Center9SupportDomain :=
  (↑(((Finset.univ : Finset (Fin 13)).erase 2).powersetCard 4) : Type)

theorem center9SupportDomain_card :
    (((Finset.univ : Finset (Fin 13)).erase 2).powersetCard 4).card = 495 := by
  rw [Finset.card_powersetCard]
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Ordinary kernel reduction enumerates all 495 members of the support domain.
/-- Every one of the 495 supports contains one of the 29 required cores. -/
theorem requiredSupport_covers_center9SupportDomain :
    ∀ support : Center9SupportDomain,
      ∃ family : Fin 29, requiredSupport family ⊆ support.1 := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Reduction unfolds the full transparent 29-entry tuple table.
theorem certificateTerms_length :
    ∀ family : Fin 29,
      (certificateTerms family).length = 1 ∨
        (certificateTerms family).length = 2 ∨
          (certificateTerms family).length = 3 := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Reduction checks every ordered quadruple and positive unit weight in the bank.
theorem certificateTerms_check :
    ∀ family : Fin 29,
      (certificateTerms family).all WeightedKalmansonTerm.check = true := by
  decide

set_option maxHeartbeats 0 in
-- The proof elaborates 29 independent finite linear cancellation branches.
/-- Every compressed certificate family is impossible.  The proof normalizes
the three fixed equality classes once, then checks the 29 finite cancellation
shapes. -/
theorem false_of_certificateFamily
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 13 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hfixed : FixedFiveRows boundary)
    {support : Finset (Fin 13)}
    (hcenter9 : Center9FourSupportRow boundary support)
    (family : Fin 29) (hsubset : requiredSupport family ⊆ support) : False := by
  apply false_of_one_two_or_three_kalmanson_terms_of_sum_eq
    hA hinj himage hccw (certificateTerms family)
    (certificateTerms_length family) (certificateTerms_check family)
  have h11_0 :
      dist (boundary 4) (boundary 10) = dist (boundary 0) (boundary 4) := by
    simpa only [dist_comm (boundary 4) (boundary 0)] using
      hfixed.raw11 (u := 10) (by simp [raw11Support])
        (v := 0) (by simp [raw11Support])
  have h11_7 :
      dist (boundary 4) (boundary 10) = dist (boundary 4) (boundary 7) :=
    hfixed.raw11 (u := 10) (by simp [raw11Support])
      (v := 7) (by simp [raw11Support])
  have h11_9 :
      dist (boundary 4) (boundary 10) = dist (boundary 4) (boundary 9) :=
    hfixed.raw11 (u := 10) (by simp [raw11Support])
      (v := 9) (by simp [raw11Support])
  have h10_11 :
      dist (boundary 3) (boundary 6) = dist (boundary 3) (boundary 11) :=
    hfixed.raw10 (u := 6) (by simp [raw10Support])
      (v := 11) (by simp [raw10Support])
  have h10_2 :
      dist (boundary 3) (boundary 6) = dist (boundary 2) (boundary 3) := by
    simpa only [dist_comm (boundary 3) (boundary 2)] using
      hfixed.raw10 (u := 6) (by simp [raw10Support])
        (v := 2) (by simp [raw10Support])
  have h10_5 :
      dist (boundary 3) (boundary 6) = dist (boundary 3) (boundary 5) :=
    hfixed.raw10 (u := 6) (by simp [raw10Support])
      (v := 5) (by simp [raw10Support])
  have h0first_12 :
      dist (boundary 8) (boundary 10) = dist (boundary 10) (boundary 12) := by
    simpa only [dist_comm (boundary 10) (boundary 8)] using
      hfixed.raw0First (u := 8) (by simp [raw0FirstSupport])
        (v := 12) (by simp [raw0FirstSupport])
  have h0first_1 :
      dist (boundary 8) (boundary 10) = dist (boundary 1) (boundary 10) := by
    simpa only [dist_comm (boundary 10) (boundary 8),
      dist_comm (boundary 10) (boundary 1)] using
      hfixed.raw0First (u := 8) (by simp [raw0FirstSupport])
        (v := 1) (by simp [raw0FirstSupport])
  have h0first_4 :
      dist (boundary 8) (boundary 10) = dist (boundary 4) (boundary 10) := by
    simpa only [dist_comm (boundary 10) (boundary 8),
      dist_comm (boundary 10) (boundary 4)] using
      hfixed.raw0First (u := 8) (by simp [raw0FirstSupport])
        (v := 4) (by simp [raw0FirstSupport])
  have h0second_2 :
      dist (boundary 7) (boundary 10) = dist (boundary 2) (boundary 10) := by
    simpa only [dist_comm (boundary 10) (boundary 7),
      dist_comm (boundary 10) (boundary 2)] using
      hfixed.raw0Second (u := 7) (by simp [raw0SecondSupport])
        (v := 2) (by simp [raw0SecondSupport])
  have h0second_3 :
      dist (boundary 7) (boundary 10) = dist (boundary 3) (boundary 10) := by
    simpa only [dist_comm (boundary 10) (boundary 7),
      dist_comm (boundary 10) (boundary 3)] using
      hfixed.raw0Second (u := 7) (by simp [raw0SecondSupport])
        (v := 3) (by simp [raw0SecondSupport])
  have h0second_5 :
      dist (boundary 7) (boundary 10) = dist (boundary 5) (boundary 10) := by
    simpa only [dist_comm (boundary 10) (boundary 7),
      dist_comm (boundary 10) (boundary 5)] using
      hfixed.raw0Second (u := 7) (by simp [raw0SecondSupport])
        (v := 5) (by simp [raw0SecondSupport])
  have h1_11 :
      dist (boundary 0) (boundary 6) = dist (boundary 6) (boundary 11) := by
    simpa only [dist_comm (boundary 6) (boundary 0)] using
      hfixed.raw1 (u := 0) (by simp [raw1Support])
        (v := 11) (by simp [raw1Support])
  have h1_12 :
      dist (boundary 0) (boundary 6) = dist (boundary 6) (boundary 12) := by
    simpa only [dist_comm (boundary 6) (boundary 0)] using
      hfixed.raw1 (u := 0) (by simp [raw1Support])
        (v := 12) (by simp [raw1Support])
  have h1_3 :
      dist (boundary 0) (boundary 6) = dist (boundary 3) (boundary 6) := by
    simpa only [dist_comm (boundary 6) (boundary 0),
      dist_comm (boundary 6) (boundary 3)] using
      hfixed.raw1 (u := 0) (by simp [raw1Support])
        (v := 3) (by simp [raw1Support])
  have hsym20 := dist_comm (boundary 2) (boundary 0)
  have hsym21 := dist_comm (boundary 2) (boundary 1)
  have candidateEq {u v : Fin 13}
      (hu : u ∈ requiredSupport family) (hv : v ∈ requiredSupport family) :
      dist (boundary 2) (boundary u) = dist (boundary 2) (boundary v) :=
    hcenter9.equalDistances (hsubset hu) (hsubset hv)
  have hc_1_8 : (1 : Fin 13) ∈ requiredSupport family →
      (8 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 1) = dist (boundary 2) (boundary 8) :=
    fun hu hv => candidateEq hu hv
  have hc_1_10 : (1 : Fin 13) ∈ requiredSupport family →
      (10 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 1) = dist (boundary 2) (boundary 10) :=
    fun hu hv => candidateEq hu hv
  have hc_8_10 : (8 : Fin 13) ∈ requiredSupport family →
      (10 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 8) = dist (boundary 2) (boundary 10) :=
    fun hu hv => candidateEq hu hv
  have hc_1_9 : (1 : Fin 13) ∈ requiredSupport family →
      (9 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 1) = dist (boundary 2) (boundary 9) :=
    fun hu hv => candidateEq hu hv
  have hc_0_1 : (0 : Fin 13) ∈ requiredSupport family →
      (1 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 0) = dist (boundary 2) (boundary 1) :=
    fun hu hv => candidateEq hu hv
  have hc_0_11 : (0 : Fin 13) ∈ requiredSupport family →
      (11 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 0) = dist (boundary 2) (boundary 11) :=
    fun hu hv => candidateEq hu hv
  have hc_0_12 : (0 : Fin 13) ∈ requiredSupport family →
      (12 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 0) = dist (boundary 2) (boundary 12) :=
    fun hu hv => candidateEq hu hv
  have hc_0_10 : (0 : Fin 13) ∈ requiredSupport family →
      (10 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 0) = dist (boundary 2) (boundary 10) :=
    fun hu hv => candidateEq hu hv
  have hc_4_10 : (4 : Fin 13) ∈ requiredSupport family →
      (10 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 4) = dist (boundary 2) (boundary 10) :=
    fun hu hv => candidateEq hu hv
  have hc_0_7 : (0 : Fin 13) ∈ requiredSupport family →
      (7 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 0) = dist (boundary 2) (boundary 7) :=
    fun hu hv => candidateEq hu hv
  have hc_0_9 : (0 : Fin 13) ∈ requiredSupport family →
      (9 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 0) = dist (boundary 2) (boundary 9) :=
    fun hu hv => candidateEq hu hv
  have hc_1_12 : (1 : Fin 13) ∈ requiredSupport family →
      (12 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 1) = dist (boundary 2) (boundary 12) :=
    fun hu hv => candidateEq hu hv
  have hc_1_11 : (1 : Fin 13) ∈ requiredSupport family →
      (11 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 1) = dist (boundary 2) (boundary 11) :=
    fun hu hv => candidateEq hu hv
  have hc_11_12 : (11 : Fin 13) ∈ requiredSupport family →
      (12 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 11) = dist (boundary 2) (boundary 12) :=
    fun hu hv => candidateEq hu hv
  have hc_3_11 : (3 : Fin 13) ∈ requiredSupport family →
      (11 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 3) = dist (boundary 2) (boundary 11) :=
    fun hu hv => candidateEq hu hv
  have hc_3_12 : (3 : Fin 13) ∈ requiredSupport family →
      (12 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 3) = dist (boundary 2) (boundary 12) :=
    fun hu hv => candidateEq hu hv
  have hc_3_6 : (3 : Fin 13) ∈ requiredSupport family →
      (6 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 3) = dist (boundary 2) (boundary 6) :=
    fun hu hv => candidateEq hu hv
  have hc_6_11 : (6 : Fin 13) ∈ requiredSupport family →
      (11 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 6) = dist (boundary 2) (boundary 11) :=
    fun hu hv => candidateEq hu hv
  have hc_6_12 : (6 : Fin 13) ∈ requiredSupport family →
      (12 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 6) = dist (boundary 2) (boundary 12) :=
    fun hu hv => candidateEq hu hv
  have hc_3_7 : (3 : Fin 13) ∈ requiredSupport family →
      (7 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 3) = dist (boundary 2) (boundary 7) :=
    fun hu hv => candidateEq hu hv
  have hc_3_5 : (3 : Fin 13) ∈ requiredSupport family →
      (5 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 3) = dist (boundary 2) (boundary 5) :=
    fun hu hv => candidateEq hu hv
  have hc_5_6 : (5 : Fin 13) ∈ requiredSupport family →
      (6 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 5) = dist (boundary 2) (boundary 6) :=
    fun hu hv => candidateEq hu hv
  have hc_6_7 : (6 : Fin 13) ∈ requiredSupport family →
      (7 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 6) = dist (boundary 2) (boundary 7) :=
    fun hu hv => candidateEq hu hv
  have hc_5_11 : (5 : Fin 13) ∈ requiredSupport family →
      (11 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 5) = dist (boundary 2) (boundary 11) :=
    fun hu hv => candidateEq hu hv
  have hc_5_12 : (5 : Fin 13) ∈ requiredSupport family →
      (12 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 5) = dist (boundary 2) (boundary 12) :=
    fun hu hv => candidateEq hu hv
  have hc_7_10 : (7 : Fin 13) ∈ requiredSupport family →
      (10 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 7) = dist (boundary 2) (boundary 10) :=
    fun hu hv => candidateEq hu hv
  have hc_7_9 : (7 : Fin 13) ∈ requiredSupport family →
      (9 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 7) = dist (boundary 2) (boundary 9) :=
    fun hu hv => candidateEq hu hv
  have hc_4_8 : (4 : Fin 13) ∈ requiredSupport family →
      (8 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 4) = dist (boundary 2) (boundary 8) :=
    fun hu hv => candidateEq hu hv
  have hc_9_10 : (9 : Fin 13) ∈ requiredSupport family →
      (10 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 9) = dist (boundary 2) (boundary 10) :=
    fun hu hv => candidateEq hu hv
  have hc_1_4 : (1 : Fin 13) ∈ requiredSupport family →
      (4 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 1) = dist (boundary 2) (boundary 4) :=
    fun hu hv => candidateEq hu hv
  have hc_1_5 : (1 : Fin 13) ∈ requiredSupport family →
      (5 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 1) = dist (boundary 2) (boundary 5) :=
    fun hu hv => candidateEq hu hv
  have hc_4_5 : (4 : Fin 13) ∈ requiredSupport family →
      (5 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 4) = dist (boundary 2) (boundary 5) :=
    fun hu hv => candidateEq hu hv
  have hc_4_9 : (4 : Fin 13) ∈ requiredSupport family →
      (9 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 4) = dist (boundary 2) (boundary 9) :=
    fun hu hv => candidateEq hu hv
  have hc_5_9 : (5 : Fin 13) ∈ requiredSupport family →
      (9 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 5) = dist (boundary 2) (boundary 9) :=
    fun hu hv => candidateEq hu hv
  have hc_5_7 : (5 : Fin 13) ∈ requiredSupport family →
      (7 : Fin 13) ∈ requiredSupport family →
      dist (boundary 2) (boundary 5) = dist (boundary 2) (boundary 7) :=
    fun hu hv => candidateEq hu hv
  fin_cases family <;>
    simp [requiredSupport] at hc_1_8 hc_1_10 hc_8_10 hc_1_9 hc_0_1 hc_0_11 hc_0_12 <;>
    simp [requiredSupport] at hc_0_10 hc_4_10 hc_0_7 hc_0_9 hc_1_12 hc_1_11 hc_11_12 <;>
    simp [requiredSupport] at hc_3_11 hc_3_12 hc_3_6 hc_6_11 hc_6_12 hc_3_7 hc_3_5 <;>
    simp [requiredSupport] at hc_5_6 hc_6_7 hc_5_11 hc_5_12 hc_7_10 hc_7_9 hc_4_8 <;>
    simp [requiredSupport] at hc_9_10 hc_1_4 hc_1_5 hc_4_5 hc_4_9 hc_5_9 hc_5_7 <;>
    simp [certificateTerms, unitKalmansonTerm,
      WeightedKalmansonTerm.leftEdges, WeightedKalmansonTerm.rightEdges,
      OrderedQuadData.leftEdge0, OrderedQuadData.leftEdge1,
      OrderedQuadData.rightEdge0, OrderedQuadData.rightEdge1,
      edgeDist] <;>
    linarith

/-- No four-element equal-distance support avoiding raw center `9` can be
added to the five fixed rows.  The finite step is the kernel-checked
495-support classifier above. -/
theorem false_of_center9_fourSupportRow
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 13 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hfixed : FixedFiveRows boundary)
    {support : Finset (Fin 13)}
    (hcenter9 : Center9FourSupportRow boundary support) : False := by
  have hmem :
      support ∈ ((Finset.univ : Finset (Fin 13)).erase 2).powersetCard 4 := by
    rw [Finset.mem_powersetCard]
    refine ⟨?_, hcenter9.card_eq_four⟩
    intro x hx
    have hxne : x ≠ (2 : Fin 13) := by
      intro hxeq
      apply hcenter9.center_not_mem
      simpa [hxeq] using hx
    simp [hxne]
  obtain ⟨family, hsubset⟩ :=
    requiredSupport_covers_center9SupportDomain ⟨support, hmem⟩
  exact false_of_certificateFamily hA hinj himage hccw hfixed hcenter9
    family hsubset

/-- Positional support `{0,6,7,10}`, corresponding to raw support
`{0,1,2,3}`. -/
def rawSupport0123 : Finset (Fin 13) := {0, 6, 7, 10}

/-- The one-form certificate for raw center-9 support `{0,1,2,3}`.

The strict form uses positional quadruple `0 < 2 < 4 < 7`.  Its adjacent
sides cancel because the raw-center-11 row identifies the `4-7` and `4-0`
distances, while the candidate raw-center-9 row identifies the `2-0` and
`2-7` distances. -/
theorem false_of_center9_rawSupport0123
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 13 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hfixed : FixedFiveRows boundary)
    (hcenter9 : Center9FourSupportRow boundary rawSupport0123) : False := by
  have hraw11 :
      dist (boundary 4) (boundary 7) =
        dist (boundary 4) (boundary 0) :=
    hfixed.raw11 (by simp [raw11Support]) (by simp [raw11Support])
  have hraw9 :
      dist (boundary 2) (boundary 0) =
        dist (boundary 2) (boundary 7) :=
    hcenter9.equalDistances
      (by simp [rawSupport0123]) (by simp [rawSupport0123])
  have hkal :=
    CapCrossingKalmansonBridge.complementary_dist_add_dist_lt_diagonal_sum_of_ccw
      hA hinj himage hccw
      (show (0 : Fin 13) < 2 by decide)
      (show (2 : Fin 13) < 4 by decide)
      (show (4 : Fin 13) < 7 by decide)
  rw [dist_comm (boundary 0) (boundary 2),
    dist_comm (boundary 0) (boundary 4)] at hkal
  linarith

end CardGeThirteenCenter9K4RowDomain
end ATailFrontierLiveClosure
end Problem97
