/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import RobustLargeRadiusExactFiveConsumer
import ShellCurvature
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson

/-!
# Scratch: ordered-shell bridge from the exact-five large-radius residual

The exact-five large-radius consumer produces an unused cap point together
with the actual critical row selected for that source by the retained global
critical map.  This file places the full four-point support of that row into a
single global CCW boundary enumeration, cut at the row's blocker.

The resulting order is source-valid: it is derived from the exact critical
support, rather than imposed as an additional packet hypothesis.  Convex
Kalmanson inequalities then force a strict two-step distance chain from the
first support point to the remaining three support points.

This does not claim a contradiction.  The current Kalmanson terminal needs
three selected rows with six cross-row support memberships, while this source
surface supplies one selected row.  The angle-chart curvature theorems also
still need a real lifted edge/chord argument chart, which is not currently
exported by `IsCcwConvexPolygon`.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace ATailRobustLargeRadiusExactFiveShellCurvatureScratch

open ATailRobustLargeRadiusExactFiveConsumerScratch
open ATailRobustLargeRadiusGeometryScratch
open CapCrossingKalmansonBridge

attribute [local instance] Classical.propDecidable

/-- The actual critical shell at the unused exact-five cap point, sorted in a
global CCW boundary enumeration cut at its blocker.

Besides the complete support identity, the packet records the first ordinal
consequences of the shell equalities: distances from the first shell point to
the next three shell points strictly increase along the boundary. -/
structure OrderedUnusedCriticalShell
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (row : LargeCapUniqueFiveUnusedCriticalRow D S H profile) : Type where
  boundary : Fin D.A.card → ℝ²
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = D.A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  blockerIndex : Fin D.A.card
  q1 : Fin D.A.card
  q2 : Fin D.A.card
  q3 : Fin D.A.card
  q4 : Fin D.A.card
  blockerIndex_val : blockerIndex.val = 0
  blocker_at_index :
    boundary blockerIndex = H.centerAt row.unused.point row.source_mem_A
  blocker_lt_q1 : blockerIndex < q1
  q1_lt_q2 : q1 < q2
  q2_lt_q3 : q2 < q3
  q3_lt_q4 : q3 < q4
  support_eq_ordered_points :
    row.criticalRow.toCriticalFourShell.support =
      {boundary q1, boundary q2, boundary q3, boundary q4}
  source_eq_ordered_point :
    row.unused.point = boundary q1 ∨
      row.unused.point = boundary q2 ∨
      row.unused.point = boundary q3 ∨
      row.unused.point = boundary q4
  first_distance_strictMono_12_13 :
    dist (boundary q1) (boundary q2) <
      dist (boundary q1) (boundary q3)
  first_distance_strictMono_13_14 :
    dist (boundary q1) (boundary q3) <
      dist (boundary q1) (boundary q4)
  last_distance_strictMono_43_42 :
    dist (boundary q4) (boundary q3) <
      dist (boundary q4) (boundary q2)
  last_distance_strictMono_42_41 :
    dist (boundary q4) (boundary q2) <
      dist (boundary q4) (boundary q1)

/-- The exact critical support admits the ordered-shell normal form above.

The construction uses the retained row itself, a global CCW enumeration of
the convex carrier, and `Finset.orderEmbOfFin` on the preimage of the exact
four-point support. -/
theorem nonempty_orderedUnusedCriticalShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (row : LargeCapUniqueFiveUnusedCriticalRow D S H profile) :
    Nonempty (OrderedUnusedCriticalShell D S H profile row) := by
  classical
  let K := row.criticalRow.toCriticalFourShell
  let blocker := H.centerAt row.unused.point row.source_mem_A
  have hcardThree : 3 ≤ D.A.card := by
    have hgt := D.card_gt_four
    omega
  have hnoncoll : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    D.convex.not_collinear_of_card_ge_three hcardThree
  rcases exists_isCcwConvexPolygon_of_convexIndep D.convex hnoncoll with
    ⟨n, hnThree, phi, hphiInj, hphiImage, hphiCcw⟩
  have hnCard : n = D.A.card := by
    have hcards := congrArg Finset.card hphiImage
    simpa [Finset.card_image_of_injective _ hphiInj] using hcards
  subst n
  have hcardPos : 0 < D.A.card := by omega
  rcases exists_isCcwConvexPolygon_cyclicShift_at_zero hcardPos hphiInj
      hphiImage hphiCcw row.blocker_mem_A with
    ⟨cut, hboundaryInj, hboundaryImage, hboundaryCcw, hboundaryZero⟩
  let boundary : Fin D.A.card → ℝ² := fun t => phi (t + cut)
  let blockerIndex : Fin D.A.card := ⟨0, hcardPos⟩
  have hboundaryImage' : Finset.univ.image boundary = D.A := by
    simpa [boundary] using hboundaryImage
  have hblockerAt : boundary blockerIndex = blocker := by
    simpa [boundary, blockerIndex, blocker] using hboundaryZero
  let supportIndices : Finset (Fin D.A.card) :=
    Finset.univ.filter fun i => boundary i ∈ K.support
  have hsupportImage : supportIndices.image boundary = K.support := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      exact (Finset.mem_filter.mp hi).2
    · intro hx
      have hxA : x ∈ D.A := K.support_subset_A hx
      have hxImage : x ∈ Finset.univ.image boundary := by
        simpa [hboundaryImage'] using hxA
      rcases Finset.mem_image.mp hxImage with ⟨i, _hi, hiEq⟩
      refine Finset.mem_image.mpr ⟨i, ?_, hiEq⟩
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_univ i, by simpa only [hiEq] using hx⟩
  have hsupportIndicesCard : supportIndices.card = 4 := by
    calc
      supportIndices.card = (supportIndices.image boundary).card :=
        (Finset.card_image_of_injective _ hboundaryInj).symm
      _ = K.support.card := by rw [hsupportImage]
      _ = 4 := K.support_card
  let ordered : Fin 4 ↪o Fin D.A.card :=
    supportIndices.orderEmbOfFin hsupportIndicesCard
  let q1 : Fin D.A.card := ordered (0 : Fin 4)
  let q2 : Fin D.A.card := ordered (1 : Fin 4)
  let q3 : Fin D.A.card := ordered (2 : Fin 4)
  let q4 : Fin D.A.card := ordered (3 : Fin 4)
  have hq1Indices : q1 ∈ supportIndices := by
    change
      (supportIndices.orderEmbOfFin hsupportIndicesCard) (0 : Fin 4) ∈
        supportIndices
    exact Finset.orderEmbOfFin_mem supportIndices hsupportIndicesCard (0 : Fin 4)
  have hq2Indices : q2 ∈ supportIndices := by
    change
      (supportIndices.orderEmbOfFin hsupportIndicesCard) (1 : Fin 4) ∈
        supportIndices
    exact Finset.orderEmbOfFin_mem supportIndices hsupportIndicesCard (1 : Fin 4)
  have hq3Indices : q3 ∈ supportIndices := by
    change
      (supportIndices.orderEmbOfFin hsupportIndicesCard) (2 : Fin 4) ∈
        supportIndices
    exact Finset.orderEmbOfFin_mem supportIndices hsupportIndicesCard (2 : Fin 4)
  have hq4Indices : q4 ∈ supportIndices := by
    change
      (supportIndices.orderEmbOfFin hsupportIndicesCard) (3 : Fin 4) ∈
        supportIndices
    exact Finset.orderEmbOfFin_mem supportIndices hsupportIndicesCard (3 : Fin 4)
  have hq1Support : boundary q1 ∈ K.support :=
    (Finset.mem_filter.mp hq1Indices).2
  have hq2Support : boundary q2 ∈ K.support :=
    (Finset.mem_filter.mp hq2Indices).2
  have hq3Support : boundary q3 ∈ K.support :=
    (Finset.mem_filter.mp hq3Indices).2
  have hq4Support : boundary q4 ∈ K.support :=
    (Finset.mem_filter.mp hq4Indices).2
  have hq12 : q1 < q2 := by
    exact ordered.strictMono (by decide)
  have hq23 : q2 < q3 := by
    exact ordered.strictMono (by decide)
  have hq34 : q3 < q4 := by
    exact ordered.strictMono (by decide)
  have hq1NeBlocker : q1 ≠ blockerIndex := by
    intro heq
    apply K.center_not_mem_support
    simpa only [heq, hblockerAt] using hq1Support
  have hblockerQ1 : blockerIndex < q1 := by
    have hq1ValNe : q1.val ≠ 0 := by
      intro hval
      apply hq1NeBlocker
      apply Fin.ext
      simpa [blockerIndex] using hval
    exact Nat.pos_of_ne_zero hq1ValNe
  have horderedImage :
      Finset.univ.image (fun j : Fin 4 => boundary (ordered j)) = K.support := by
    calc
      Finset.univ.image (fun j : Fin 4 => boundary (ordered j)) =
          (Finset.univ.image ordered).image boundary := by
        rw [Finset.image_image]
        rfl
      _ = supportIndices.image boundary := by
        rw [Finset.image_orderEmbOfFin_univ supportIndices hsupportIndicesCard]
      _ = K.support := hsupportImage
  have hfinFour :
      (Finset.univ : Finset (Fin 4)) = {0, 1, 2, 3} := by
    decide
  have hsupportEq :
      K.support = {boundary q1, boundary q2, boundary q3, boundary q4} := by
    rw [← horderedImage, hfinFour]
    simp only [Finset.image_insert, Finset.image_singleton]
    rfl
  have hsourceCases :
      row.unused.point = boundary q1 ∨
        row.unused.point = boundary q2 ∨
        row.unused.point = boundary q3 ∨
        row.unused.point = boundary q4 := by
    have hsource := row.source_mem_criticalSupport
    rw [hsupportEq] at hsource
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hsource
  have hradius23 :
      dist (boundary blockerIndex) (boundary q2) =
        dist (boundary blockerIndex) (boundary q3) := by
    calc
      dist (boundary blockerIndex) (boundary q2) =
          dist blocker (boundary q2) := by rw [hblockerAt]
      _ = K.radius := K.support_eq_radius _ hq2Support
      _ = dist blocker (boundary q3) :=
        (K.support_eq_radius _ hq3Support).symm
      _ = dist (boundary blockerIndex) (boundary q3) := by rw [hblockerAt]
  have hradius12 :
      dist (boundary blockerIndex) (boundary q1) =
        dist (boundary blockerIndex) (boundary q2) := by
    calc
      dist (boundary blockerIndex) (boundary q1) =
          dist blocker (boundary q1) := by rw [hblockerAt]
      _ = K.radius := K.support_eq_radius _ hq1Support
      _ = dist blocker (boundary q2) :=
        (K.support_eq_radius _ hq2Support).symm
      _ = dist (boundary blockerIndex) (boundary q2) := by rw [hblockerAt]
  have hradius34 :
      dist (boundary blockerIndex) (boundary q3) =
        dist (boundary blockerIndex) (boundary q4) := by
    calc
      dist (boundary blockerIndex) (boundary q3) =
          dist blocker (boundary q3) := by rw [hblockerAt]
      _ = K.radius := K.support_eq_radius _ hq3Support
      _ = dist blocker (boundary q4) :=
        (K.support_eq_radius _ hq4Support).symm
      _ = dist (boundary blockerIndex) (boundary q4) := by rw [hblockerAt]
  have hdist12lt13 :
      dist (boundary q1) (boundary q2) <
        dist (boundary q1) (boundary q3) :=
    dist_lt_of_ccw_of_dist_diagonal_eq_side D.convex hboundaryInj
      hboundaryImage hboundaryCcw hblockerQ1 hq12 hq23 hradius23
  have hdist13lt14 :
      dist (boundary q1) (boundary q3) <
        dist (boundary q1) (boundary q4) :=
    dist_lt_of_ccw_of_dist_diagonal_eq_side D.convex hboundaryInj
      hboundaryImage hboundaryCcw hblockerQ1 (hq12.trans hq23) hq34
      hradius34
  have hkalLast32 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw D.convex
      hboundaryInj hboundaryImage' hboundaryCcw
      (hblockerQ1.trans hq12) hq23 hq34
  have hdist43lt42 :
      dist (boundary q4) (boundary q3) <
        dist (boundary q4) (boundary q2) := by
    rw [dist_comm (boundary q4) (boundary q3),
      dist_comm (boundary q4) (boundary q2)]
    linarith [hradius23]
  have hkalLast21 :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw D.convex
      hboundaryInj hboundaryImage' hboundaryCcw
      hblockerQ1 hq12 (hq23.trans hq34)
  have hdist42lt41 :
      dist (boundary q4) (boundary q2) <
        dist (boundary q4) (boundary q1) := by
    rw [dist_comm (boundary q4) (boundary q2),
      dist_comm (boundary q4) (boundary q1)]
    linarith [hradius12]
  exact ⟨{
    boundary := boundary
    boundary_injective := hboundaryInj
    boundary_image := hboundaryImage'
    boundary_ccw := hboundaryCcw
    blockerIndex := blockerIndex
    q1 := q1
    q2 := q2
    q3 := q3
    q4 := q4
    blockerIndex_val := rfl
    blocker_at_index := hblockerAt
    blocker_lt_q1 := hblockerQ1
    q1_lt_q2 := hq12
    q2_lt_q3 := hq23
    q3_lt_q4 := hq34
    support_eq_ordered_points := hsupportEq
    source_eq_ordered_point := hsourceCases
    first_distance_strictMono_12_13 := hdist12lt13
    first_distance_strictMono_13_14 := hdist13lt14
    last_distance_strictMono_43_42 := hdist43lt42
    last_distance_strictMono_42_41 := hdist42lt41
  }⟩

/-- A selected row centered at the first point of an ordered four-point set
can meet that set at most once when its distances to the remaining three
points are strictly increasing. -/
private theorem selectedFourClass_inter_orderedFour_card_le_one
    {A : Finset ℝ²} {a b c d : ℝ²}
    (R : SelectedFourClass A a)
    (habc : dist a b < dist a c)
    (hacd : dist a c < dist a d) :
    (R.support ∩ {a, b, c, d}).card ≤ 1 := by
  rw [Finset.card_le_one]
  intro x hx y hy
  have hxR : x ∈ R.support := (Finset.mem_inter.mp hx).1
  have hyR : y ∈ R.support := (Finset.mem_inter.mp hy).1
  have hxFour : x ∈ ({a, b, c, d} : Finset ℝ²) :=
    (Finset.mem_inter.mp hx).2
  have hyFour : y ∈ ({a, b, c, d} : Finset ℝ²) :=
    (Finset.mem_inter.mp hy).2
  have hdistEq : dist a x = dist a y :=
    (R.support_eq_radius _ hxR).trans
      (R.support_eq_radius _ hyR).symm
  simp only [Finset.mem_insert, Finset.mem_singleton] at hxFour hyFour
  rcases hxFour with rfl | rfl | rfl | rfl
  · exact (R.center_not_mem hxR).elim
  · rcases hyFour with rfl | rfl | rfl | rfl
    · exact (R.center_not_mem hyR).elim
    · rfl
    · exact ((ne_of_lt habc) hdistEq).elim
    · exact ((ne_of_lt (habc.trans hacd)) hdistEq).elim
  · rcases hyFour with rfl | rfl | rfl | rfl
    · exact (R.center_not_mem hyR).elim
    · exact ((ne_of_lt habc) hdistEq.symm).elim
    · rfl
    · exact ((ne_of_lt hacd) hdistEq).elim
  · rcases hyFour with rfl | rfl | rfl | rfl
    · exact (R.center_not_mem hyR).elim
    · exact ((ne_of_lt (habc.trans hacd)) hdistEq.symm).elim
    · exact ((ne_of_lt hacd) hdistEq.symm).elim
    · rfl

/-- Global K4 rows at the two extreme support points of the ordered critical
shell.  Convex order forces each of these rows to have at least three support
points outside the original critical shell. -/
structure OrderedUnusedCriticalShellK4Escape
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (row : LargeCapUniqueFiveUnusedCriticalRow D S H profile)
    (P : OrderedUnusedCriticalShell D S H profile row) : Type where
  firstRow : SelectedFourClass D.A (P.boundary P.q1)
  lastRow : SelectedFourClass D.A (P.boundary P.q4)
  firstRow_inter_criticalSupport_card_le_one :
    (firstRow.support ∩ row.criticalRow.toCriticalFourShell.support).card ≤ 1
  lastRow_inter_criticalSupport_card_le_one :
    (lastRow.support ∩ row.criticalRow.toCriticalFourShell.support).card ≤ 1
  firstRow_outside_criticalSupport_card_ge_three :
    3 ≤ (firstRow.support \ row.criticalRow.toCriticalFourShell.support).card
  lastRow_outside_criticalSupport_card_ge_three :
    3 ≤ (lastRow.support \ row.criticalRow.toCriticalFourShell.support).card

/-- The endpoint escape packet follows uniformly from global K4 and the
source-valid ordered-shell packet. -/
theorem nonempty_orderedUnusedCriticalShellK4Escape
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {row : LargeCapUniqueFiveUnusedCriticalRow D S H profile}
    (P : OrderedUnusedCriticalShell D S H profile row) :
    Nonempty (OrderedUnusedCriticalShellK4Escape D S H profile row P) := by
  classical
  let K := row.criticalRow.toCriticalFourShell
  have hq1Support : P.boundary P.q1 ∈ K.support := by
    rw [P.support_eq_ordered_points]
    simp
  have hq4Support : P.boundary P.q4 ∈ K.support := by
    rw [P.support_eq_ordered_points]
    simp
  have hq1A : P.boundary P.q1 ∈ D.A := K.support_subset_A hq1Support
  have hq4A : P.boundary P.q4 ∈ D.A := K.support_subset_A hq4Support
  rcases exists_selectedFourClass_of_globalK4 D.K4 hq1A with ⟨firstRow⟩
  rcases exists_selectedFourClass_of_globalK4 D.K4 hq4A with ⟨lastRow⟩
  have hfirstInter : (firstRow.support ∩ K.support).card ≤ 1 := by
    rw [P.support_eq_ordered_points]
    exact selectedFourClass_inter_orderedFour_card_le_one firstRow
      P.first_distance_strictMono_12_13
      P.first_distance_strictMono_13_14
  have hreverseSet :
      ({P.boundary P.q4, P.boundary P.q3, P.boundary P.q2,
          P.boundary P.q1} : Finset ℝ²) =
        {P.boundary P.q1, P.boundary P.q2, P.boundary P.q3,
          P.boundary P.q4} := by
    ext x
    simp only [Finset.mem_insert, Finset.mem_singleton]
    tauto
  have hlastInter : (lastRow.support ∩ K.support).card ≤ 1 := by
    rw [P.support_eq_ordered_points, ← hreverseSet]
    exact selectedFourClass_inter_orderedFour_card_le_one lastRow
      P.last_distance_strictMono_43_42
      P.last_distance_strictMono_42_41
  have hfirstOutside : 3 ≤ (firstRow.support \ K.support).card := by
    have hsplit := Finset.card_sdiff_add_card_inter firstRow.support K.support
    rw [firstRow.support_card] at hsplit
    omega
  have hlastOutside : 3 ≤ (lastRow.support \ K.support).card := by
    have hsplit := Finset.card_sdiff_add_card_inter lastRow.support K.support
    rw [lastRow.support_card] at hsplit
    omega
  exact ⟨{
    firstRow := firstRow
    lastRow := lastRow
    firstRow_inter_criticalSupport_card_le_one := hfirstInter
    lastRow_inter_criticalSupport_card_le_one := hlastInter
    firstRow_outside_criticalSupport_card_ge_three := hfirstOutside
    lastRow_outside_criticalSupport_card_ge_three := hlastOutside
  }⟩

#print axioms nonempty_orderedUnusedCriticalShell
#print axioms nonempty_orderedUnusedCriticalShellK4Escape

end ATailRobustLargeRadiusExactFiveShellCurvatureScratch
end Problem97
