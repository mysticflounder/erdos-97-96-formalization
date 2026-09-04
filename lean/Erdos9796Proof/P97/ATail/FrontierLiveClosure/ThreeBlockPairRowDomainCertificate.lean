/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

/-!
# Three-block pair row-domain certificates

This module supplies a source-neutral compression for finite four-support
classifiers.  Mapping four support points into three blocks produces a
same-block pair.  A finite table may attach a checked weighted Kalmanson
certificate to each such pair.

The soundness layer treats row choices as independently tagged witnesses.
Unlike a `RowPattern`, it permits two distinct radius rows with the same
geometric center without asserting cross-row distance equalities.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ThreeBlockPairRowDomainCertificate

open Census554.EqualityCore
open GenericRowNogoodCertificate
open scoped EuclideanGeometry

/-- Every row choice in a list independently realizes its internal distance
equalities.  Equal centers in different choices remain independent. -/
def RowChoicesDistanceEqual {α : Type*} (boundary : α → ℝ²)
    (choices : List (RowChoice α)) : Prop :=
  ∀ choice, choice ∈ choices →
    ∀ ⦃first⦄, first ∈ choice.support →
      ∀ ⦃second⦄, second ∈ choice.support →
        edgeDist boundary (choice.center, first) =
          edgeDist boundary (choice.center, second)

/-- One checked primitive equality step is sound for independently tagged
rows. -/
theorem edgeDist_eq_of_checkPrimitiveStep
    {α : Type*} [DecidableEq α] {boundary : α → ℝ²}
    {choices : List (RowChoice α)}
    (hrows : RowChoicesDistanceEqual boundary choices)
    (step : PrimitiveEqualityStep α)
    (hcheck : checkPrimitiveStep choices step = true) :
    edgeDist boundary step.source = edgeDist boundary step.target := by
  cases step with
  | row center first second =>
      rw [checkPrimitiveStep, List.any_eq_true] at hcheck
      rcases hcheck with ⟨choice, hchoice, hcheck⟩
      have hdata :
          choice.center = center ∧
            first ∈ choice.support ∧ second ∈ choice.support :=
        of_decide_eq_true hcheck
      change edgeDist boundary (center, first) =
        edgeDist boundary (center, second)
      rw [← hdata.1]
      exact hrows choice hchoice hdata.2.1 hdata.2.2
  | flip first second =>
      change dist (boundary first) (boundary second) =
        dist (boundary second) (boundary first)
      exact dist_comm _ _

/-- A checked chain of independently tagged row equalities preserves its
endpoint distance. -/
theorem edgeDist_eq_of_checkStepChain
    {α : Type*} [DecidableEq α] {boundary : α → ℝ²}
    {choices : List (RowChoice α)}
    (hrows : RowChoicesDistanceEqual boundary choices)
    {first last : Edge α} {steps : List (PrimitiveEqualityStep α)}
    (hcheck : checkStepChain choices first steps last = true) :
    edgeDist boundary first = edgeDist boundary last := by
  induction steps generalizing first with
  | nil =>
      simp only [checkStepChain, decide_eq_true_eq] at hcheck
      subst last
      rfl
  | cons step steps ih =>
      simp only [checkStepChain, Bool.and_eq_true,
        decide_eq_true_eq] at hcheck
      rcases hcheck with ⟨⟨hfirst, hstep⟩, htail⟩
      subst first
      exact (edgeDist_eq_of_checkPrimitiveStep hrows step hstep).trans
        (ih htail)

/-- A checked path over independently tagged rows proves equality of its
declared endpoint distances. -/
theorem edgeDist_eq_of_checkPath
    {α : Type*} [DecidableEq α] {boundary : α → ℝ²}
    {choices : List (RowChoice α)}
    (hrows : RowChoicesDistanceEqual boundary choices)
    (path : ClosurePathData α) {first last : Edge α}
    (hcheck : checkPath choices path first last = true) :
    edgeDist boundary first = edgeDist boundary last := by
  simp only [checkPath, Bool.and_eq_true, decide_eq_true_eq] at hcheck
  rcases hcheck with ⟨⟨hfirst, hlast⟩, hsteps⟩
  subst first
  subst last
  exact edgeDist_eq_of_checkStepChain hrows hsteps

/-- Every checked list of edge pairings has equal left and right distance
sums when its rows are independently tagged. -/
theorem sum_weightedEdgePairings_eq
    {n : ℕ} {boundary : Fin n → ℝ²}
    (choices : List (RowChoice (Fin n)))
    (hrows : RowChoicesDistanceEqual boundary choices)
    (pairings : List (WeightedEdgePairingData (Fin n)))
    (hall : ∀ pairing ∈ pairings,
      checkPath choices pairing.path pairing.left pairing.right = true) :
    (pairings.map (fun pairing => edgeDist boundary pairing.left)).sum =
      (pairings.map (fun pairing => edgeDist boundary pairing.right)).sum := by
  induction pairings with
  | nil => simp
  | cons head tail ih =>
      have hhead : edgeDist boundary head.left =
          edgeDist boundary head.right :=
        edgeDist_eq_of_checkPath hrows head.path (hall head (by simp))
      have htail := ih (fun pairing hpairing =>
        hall pairing (by simp [hpairing]))
      simp only [List.map_cons, List.sum_cons]
      rw [hhead, htail]

/-- A checked weighted Kalmanson cancellation remains sound when its concrete
rows are independent tagged witnesses, including repeated centers. -/
theorem false_of_weightedKalmansonCancellationData_of_check
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (choices : List (RowChoice (Fin n)))
    (hrows : RowChoicesDistanceEqual boundary choices)
    (data : WeightedKalmansonCancellationData (Fin n))
    (hcheck : data.check choices = true) : False := by
  have hvalid : data.Valid choices := data.valid_of_check choices hcheck
  rcases hvalid with ⟨hne, hterms, hleft, hright, hpairings⟩
  have hlt := sum_lt_of_weightedKalmansonTerms hA hinj
    himage hccw data.terms hne hterms
  have hpairingEq := sum_weightedEdgePairings_eq choices hrows
    data.pairings hpairings
  have hleftEq :
      (data.leftEdges.map (edgeDist boundary)).sum =
        (data.pairings.map
          (fun pairing => edgeDist boundary pairing.left)).sum := by
    symm
    simpa [Function.comp_def] using
      (hleft.map (edgeDist boundary)).sum_eq
  have hrightEq :
      (data.pairings.map
          (fun pairing => edgeDist boundary pairing.right)).sum =
        (data.rightEdges.map (edgeDist boundary)).sum := by
    simpa [Function.comp_def] using
      (hright.map (edgeDist boundary)).sum_eq
  have heq :
      (data.leftEdges.map (edgeDist boundary)).sum =
        (data.rightEdges.map (edgeDist boundary)).sum :=
    hleftEq.trans (hpairingEq.trans hrightEq)
  exact (ne_of_lt hlt) heq

/-- Four support points assigned to three block labels contain two distinct
points with the same label. -/
theorem four_support_contains_pair_in_one_of_three_four_blocks
    {α : Type*}
    (support : Finset α) (block : α → Fin 3)
    (hcard : support.card = 4) :
    ∃ first ∈ support, ∃ second ∈ support,
      first ≠ second ∧ block first = block second := by
  classical
  apply Finset.exists_ne_map_eq_of_card_lt_of_maps_to
    (s := support) (t := Finset.univ)
  · simp [hcard]
  · intro point _hpoint
    simp

/-- One table entry for an unordered same-block pair.  Each entry carries its
own concrete row choices, so a table does not assert all candidate pair rows
simultaneously. -/
structure PairCertificate (α : Type*) where
  first : α
  second : α
  choices : List (RowChoice α)
  data : WeightedKalmansonCancellationData α

/-- A pair table entry names the supplied pair in either order. -/
def PairCertificate.Matches {α : Type*} (certificate : PairCertificate α)
    (first second : α) : Prop :=
  (certificate.first = first ∧ certificate.second = second) ∨
    (certificate.first = second ∧ certificate.second = first)

/-- A finite dispatcher closing every same-block pair closes an arbitrary
four-support row.  An eighteen-entry table is the canonical specialization
for three four-point blocks. -/
theorem false_of_fourSupport_of_threeBlock_pairCertificates
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {boundary : Fin n → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (support : Finset (Fin n)) (block : Fin n → Fin 3)
    (hcard : support.card = 4)
    {certificateCount : ℕ}
    (certificates : Fin certificateCount → PairCertificate (Fin n))
    (hbranch :
      ∀ first ∈ support, ∀ second ∈ support, first ≠ second →
        block first = block second →
        ∃ index : Fin certificateCount,
          (certificates index).Matches first second ∧
          RowChoicesDistanceEqual boundary (certificates index).choices ∧
          (certificates index).data.check
            (certificates index).choices = true) : False := by
  obtain ⟨first, hfirst, second, hsecond, hne, hblock⟩ :=
    four_support_contains_pair_in_one_of_three_four_blocks
      support block hcard
  obtain ⟨index, _hmatch, hrows, hcheck⟩ :=
    hbranch first hfirst second hsecond hne hblock
  exact false_of_weightedKalmansonCancellationData_of_check
    hA hinj himage hccw (certificates index).choices hrows
      (certificates index).data hcheck

#print axioms four_support_contains_pair_in_one_of_three_four_blocks
#print axioms false_of_weightedKalmansonCancellationData_of_check
#print axioms false_of_fourSupport_of_threeBlock_pairCertificates

end ThreeBlockPairRowDomainCertificate
end ATailFrontierLiveClosure
end Problem97
