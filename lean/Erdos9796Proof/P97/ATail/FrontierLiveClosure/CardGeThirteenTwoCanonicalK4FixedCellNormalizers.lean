/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenTwoCanonicalK4FixedCellCertificateBank

/-!
# Row-domain normalizers for the two-canonical-K4 fixed cell

This module separates the finite row-domain reduction from the final joint
certificate.  The two challenged rows are independent tagged witnesses.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CardGeThirteenTwoCanonicalK4FixedCellNormalizers

open Census554.EqualityCore
open GenericRowNogoodCertificate
open ThreeBlockPairRowDomainCertificate
open CardGeThirteenTwoCanonicalK4FixedCellData
open CardGeThirteenTwoCanonicalK4FixedCellCertificateBank
open scoped EuclideanGeometry

abbrev Label := Fin 13

/-- All distances from one tagged center to a supplied support are equal. -/
def RowDistancesEqual (boundary : Label → ℝ²) (center : Label)
    (support : Finset Label) : Prop :=
  ∀ ⦃first⦄, first ∈ support →
    ∀ ⦃second⦄, second ∈ support →
      edgeDist boundary (center, first) =
        edgeDist boundary (center, second)

/-- One arbitrary exact four-support row, recorded independently of every
other row having the same geometric center. -/
structure FourSupportRow (boundary : Label → ℝ²) (center : Label)
    (support : Finset Label) : Prop where
  card_eq_four : support.card = 4
  center_not_mem : center ∉ support
  equalDistances : RowDistancesEqual boundary center support

/-- The finite type of four-subsets avoiding one challenged center. -/
abbrev FourSupportDomain (center : Label) :=
  (↑(((Finset.univ : Finset Label).erase center).powersetCard 4) : Type)

/-- Both endpoints of an unordered pair occur in a support. -/
abbrev PairContained (pair : Label × Label) (support : Finset Label) : Prop :=
  pair.1 ∈ support ∧ pair.2 ∈ support

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Ordinary reduction enumerates all 495 center-2 four-supports.
/-- Every center-2 four-support either contains one of the eighteen certified
pairs or is one of the twenty-seven residual supports. -/
theorem center2_pair_or_domain :
    ∀ support : FourSupportDomain (rawToPos 2),
      (∃ index : Fin 18,
        PairContained (center2PairEndpoints index) support.1) ∨
      ∃ index : Fin 27, center2Domain index = support.1 := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Ordinary reduction enumerates all 495 center-5 four-supports.
/-- Every center-5 four-support either contains one of the twenty-seven
certified pairs or is one of the sixteen residual supports. -/
theorem center5_pair_or_domain :
    ∀ support : FourSupportDomain (rawToPos 5),
      (∃ index : Fin 27,
        PairContained (center5PairEndpoints index) support.1) ∨
      ∃ index : Fin 16, center5Domain index = support.1 := by
  decide

/-- Append one partial challenged row to independently tagged base rows. -/
theorem rowChoicesDistanceEqual_append_singleton
    {boundary : Label → ℝ²} {base : List (RowChoice Label)}
    {center : Label} {support core : Finset Label}
    (hbase : RowChoicesDistanceEqual boundary base)
    (hrow : RowDistancesEqual boundary center support)
    (hcore : core ⊆ support) :
    RowChoicesDistanceEqual boundary
      (base ++ [{ center := center, support := core }]) := by
  intro choice hchoice first hfirst second hsecond
  simp only [List.mem_append, List.mem_singleton] at hchoice
  rcases hchoice with hchoice | hchoice
  · exact hbase choice hchoice hfirst hsecond
  · subst choice
    exact hrow (hcore hfirst) (hcore hsecond)

/-- An exact four-support row belongs to the corresponding finite support
domain. -/
theorem mem_fourSupportDomain
    {boundary : Label → ℝ²} {center : Label} {support : Finset Label}
    (hrow : FourSupportRow boundary center support) :
    support ∈ ((Finset.univ : Finset Label).erase center).powersetCard 4 := by
  rw [Finset.mem_powersetCard]
  refine ⟨?_, hrow.card_eq_four⟩
  intro point hpoint
  simp only [Finset.mem_erase, Finset.mem_univ, and_true]
  exact fun hpointCenter => hrow.center_not_mem (hpointCenter ▸ hpoint)

/-- The center-2 pair bank reduces an arbitrary row to one of twenty-seven
explicit supports. -/
theorem center2_normalize
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Label → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hbase : RowChoicesDistanceEqual boundary baseChoices)
    {support : Finset Label}
    (hrow : FourSupportRow boundary (rawToPos 2) support) :
    ∃ index : Fin 27, support = center2Domain index := by
  have hmem := mem_fourSupportDomain hrow
  rcases center2_pair_or_domain ⟨support, hmem⟩ with hpair | hdomain
  · rcases hpair with ⟨index, hfirst, hsecond⟩
    have hsubset : center2PairSupport index ⊆ support := by
      intro point hpoint
      simp only [center2PairSupport, Finset.mem_insert,
        Finset.mem_singleton] at hpoint
      rcases hpoint with hpoint | hpoint
      · simpa [hpoint] using hfirst
      · simpa [hpoint] using hsecond
    have hrows :
        RowChoicesDistanceEqual boundary (center2PairChoices index) := by
      simpa only [center2PairChoices] using
        rowChoicesDistanceEqual_append_singleton hbase
          hrow.equalDistances hsubset
    exact False.elim <|
      false_of_weightedKalmansonCancellationData_of_check
        hA hinj himage hccw (center2PairChoices index) hrows
          (center2PairCertificate index)
          (center2PairCertificate_check index)
  · rcases hdomain with ⟨index, hsupport⟩
    exact ⟨index, hsupport.symm⟩

/-- The center-5 pair bank reduces an arbitrary row to one of sixteen
explicit supports. -/
theorem center5_normalize
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Label → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hbase : RowChoicesDistanceEqual boundary baseChoices)
    {support : Finset Label}
    (hrow : FourSupportRow boundary (rawToPos 5) support) :
    ∃ index : Fin 16, support = center5Domain index := by
  have hmem := mem_fourSupportDomain hrow
  rcases center5_pair_or_domain ⟨support, hmem⟩ with hpair | hdomain
  · rcases hpair with ⟨index, hfirst, hsecond⟩
    have hsubset : center5PairSupport index ⊆ support := by
      intro point hpoint
      simp only [center5PairSupport, Finset.mem_insert,
        Finset.mem_singleton] at hpoint
      rcases hpoint with hpoint | hpoint
      · simpa [hpoint] using hfirst
      · simpa [hpoint] using hsecond
    have hrows :
        RowChoicesDistanceEqual boundary (center5PairChoices index) := by
      simpa only [center5PairChoices] using
        rowChoicesDistanceEqual_append_singleton hbase
          hrow.equalDistances hsubset
    exact False.elim <|
      false_of_weightedKalmansonCancellationData_of_check
        hA hinj himage hccw (center5PairChoices index) hrows
          (center5PairCertificate index)
          (center5PairCertificate_check index)
  · rcases hdomain with ⟨index, hsupport⟩
    exact ⟨index, hsupport.symm⟩

#print axioms center2_pair_or_domain
#print axioms center5_pair_or_domain
#print axioms center2_normalize
#print axioms center5_normalize

end CardGeThirteenTwoCanonicalK4FixedCellNormalizers
end ATailFrontierLiveClosure
end Problem97
