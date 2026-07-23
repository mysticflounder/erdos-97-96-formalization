/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GenericFamilies
import Erdos9796Proof.P97.ATail.TwoCenterBisectorParity

/-!
# Two-center cyclic alternation core

Family `full_class_cyclic_alternation`: for CNF centers `l < r` and
points `p < q` (all distinct) that do not linearly alternate, the two
radius equalities are contradictory.  The core lemma is stated for an
arbitrary CCW `Fin 11` boundary and an arbitrary strictly monotone or
strictly antitone index embedding, so the direct branch (identity) and
the mirror branch (strict reversal of the shifted boundary) both
instantiate it.  The four non-alternating arrangements map onto the four
production bisector-parity terminals
(`Problem97.false_of_two_centers_equidistant_pair_{after, enclosed,
split, before}`).
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P5IndexedSourceScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch

/-! ## `Fin 11` to `Fin A.card` bridge -/

def cardBoundary {A : Finset ℝ²} (hcard : A.card = 11)
    (boundary : Label → ℝ²) : Fin A.card → ℝ² :=
  fun i => boundary (Fin.cast hcard i)

def toCardIndex {A : Finset ℝ²} (hcard : A.card = 11)
    (i : Label) : Fin A.card :=
  Fin.cast hcard.symm i

@[simp] theorem cardBoundary_toCardIndex {A : Finset ℝ²}
    (hcard : A.card = 11) (boundary : Label → ℝ²) (i : Label) :
    cardBoundary hcard boundary (toCardIndex hcard i) = boundary i :=
  rfl

theorem toCardIndex_lt {A : Finset ℝ²} (hcard : A.card = 11)
    {i j : Label} (h : i < j) :
    toCardIndex hcard i < toCardIndex hcard j := by
  simpa [toCardIndex, Fin.lt_def] using h

theorem cardBoundary_injective {A : Finset ℝ²} (hcard : A.card = 11)
    {boundary : Label → ℝ²} (hinj : Function.Injective boundary) :
    Function.Injective (cardBoundary hcard boundary) := by
  intro i j hij
  apply Fin.cast_injective hcard
  exact hinj hij

theorem cardBoundary_image {A : Finset ℝ²} (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (himage : Finset.univ.image boundary = A) :
    Finset.univ.image (cardBoundary hcard boundary) = A := by
  calc
    Finset.univ.image (cardBoundary hcard boundary) =
        Finset.univ.image boundary := by
      apply Finset.Subset.antisymm
      · intro x hx
        rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.cast hcard i, Finset.mem_univ _, rfl⟩
      · intro x hx
        rcases Finset.mem_image.mp hx with ⟨i, _hi, rfl⟩
        exact Finset.mem_image.mpr
          ⟨Fin.cast hcard.symm i, Finset.mem_univ _, by
            simp [cardBoundary]⟩
    _ = A := himage

theorem cardBoundary_ccw {A : Finset ℝ²} (hcard : A.card = 11)
    {boundary : Label → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary) :
    EuclideanGeometry.IsCcwConvexPolygon
      (cardBoundary hcard boundary) := by
  intro i j k hij hjk
  apply hccw
  · simpa using hij
  · simpa using hjk

/-! ## Non-alternating two-center contradiction core -/

/-- Two centers `l < r` and a chord pair `p < q` (all distinct, CNF
order) that do not alternate cannot both be equidistant from the chord,
whether the index embedding preserves or reverses the CNF order. -/
theorem false_of_nonalternating_equidistant
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hinj : Function.Injective phi)
    (himage : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {idx : Label → Fin A.card}
    (hidx : (∀ i j : Label, i < j → idx i < idx j) ∨
      (∀ i j : Label, i < j → idx j < idx i))
    {l r p q : Label} (hlr : l < r) (hpq : p < q)
    (hpl : p ≠ l) (hpr : p ≠ r) (hql : q ≠ l) (hqr : q ≠ r)
    (hside : (l < p ∧ p < r) ↔ (l < q ∧ q < r))
    (heql : dist (phi (idx l)) (phi (idx p)) =
      dist (phi (idx l)) (phi (idx q)))
    (heqr : dist (phi (idx r)) (phi (idx p)) =
      dist (phi (idx r)) (phi (idx q))) : False := by
  by_cases hp : l < p ∧ p < r
  · -- both inside: l < p < q < r
    have hq' : l < q ∧ q < r := hside.mp hp
    rcases hidx with hmono | hanti
    · exact false_of_two_centers_equidistant_pair_split hA hinj
        himage hccw (hmono l p hp.1) (hmono p q hpq)
        (hmono q r hq'.2) heqr heql
    · exact false_of_two_centers_equidistant_pair_split hA hinj
        himage hccw (hanti q r hq'.2) (hanti p q hpq)
        (hanti l p hp.1) heql.symm heqr.symm
  · -- both outside
    have hq' : ¬(l < q ∧ q < r) := fun h => hp (hside.mpr h)
    have hp_out : p < l ∨ r < p := by
      rcases lt_trichotomy p l with h | h | h
      · exact Or.inl h
      · exact absurd h hpl
      · rcases lt_trichotomy p r with h' | h' | h'
        · exact absurd ⟨h, h'⟩ hp
        · exact absurd h' hpr
        · exact Or.inr h'
    have hq_out : q < l ∨ r < q := by
      rcases lt_trichotomy q l with h | h | h
      · exact Or.inl h
      · exact absurd h hql
      · rcases lt_trichotomy q r with h' | h' | h'
        · exact absurd ⟨h, h'⟩ hq'
        · exact absurd h' hqr
        · exact Or.inr h'
    rcases hp_out with hpl' | hrp
    · rcases hq_out with hql' | hrq
      · -- p < q < l < r
        rcases hidx with hmono | hanti
        · exact false_of_two_centers_equidistant_pair_after hA hinj
            himage hccw (hmono p q hpq) (hmono q l hql')
            (hmono l r hlr) heql heqr
        · exact false_of_two_centers_equidistant_pair_before hA hinj
            himage hccw (hanti l r hlr) (hanti q l hql')
            (hanti p q hpq) heql.symm heqr.symm
      · -- p < l < r < q
        rcases hidx with hmono | hanti
        · exact false_of_two_centers_equidistant_pair_enclosed hA hinj
            himage hccw (hmono p l hpl') (hmono l r hlr)
            (hmono r q hrq) heqr heql
        · exact false_of_two_centers_equidistant_pair_enclosed hA hinj
            himage hccw (hanti r q hrq) (hanti l r hlr)
            (hanti p l hpl') heql.symm heqr.symm
    · -- l < r < p < q
      have hrq : r < q := hrp.trans hpq
      rcases hidx with hmono | hanti
      · exact false_of_two_centers_equidistant_pair_before hA hinj
          himage hccw (hmono l r hlr) (hmono r p hrp)
          (hmono p q hpq) heqr heql
      · exact false_of_two_centers_equidistant_pair_after hA hinj
          himage hccw (hanti p q hpq) (hanti r p hrp)
          (hanti l r hlr) heqr.symm heql.symm

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

/-- Family `full_class_cyclic_alternation` on the direct branch. -/
theorem fullClassCyclicAlternationSat_direct
    (Q : ExactTwoBoundaryCore R distribution) :
    FullClassCyclicAlternationSat Q directIndex := by
  intro l r p q hlr hpq hpl hpr hql hqr hside heq
  obtain ⟨heql, heqr⟩ := heq
  unfold radiusEq at heql heqr
  have hcard := carrier_card_eq_eleven Q
  exact false_of_nonalternating_equidistant D.convex
    (cardBoundary_injective hcard Q.boundary_injective)
    (cardBoundary_image hcard Q.boundary_image)
    (cardBoundary_ccw hcard Q.boundary_ccw)
    (idx := toCardIndex hcard)
    (Or.inl fun i j h => toCardIndex_lt hcard h)
    hlr hpq hpl hpr hql hqr hside heql heqr

end P5IndexedSourceScratch
end Problem97

#print axioms
  Problem97.P5IndexedSourceScratch.false_of_nonalternating_equidistant
#print axioms
  Problem97.P5IndexedSourceScratch.fullClassCyclicAlternationSat_direct
