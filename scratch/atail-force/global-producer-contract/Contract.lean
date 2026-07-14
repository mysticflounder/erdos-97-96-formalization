/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.FourPointTwoCircleBisectorOrderCore
import Erdos9796Proof.P97.Census554.EquilateralHingeCollisions
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Census554.NestedEqualChordCore
import Erdos9796Proof.P97.Census554.SixPointTwoCircleArcOvertakeOrderCore
import Erdos9796Proof.P97.Census554.SixPointTwoCircleOrderCore

/-!
# Scratch contract for the ATAIL global producer

This unimported file records both the historical ordered-only sink contract
and an all-current contract covering the four ordered equality sinks together
with the four orientation-free equilateral-hinge sinks.  It also checks the
smaller four-label closure-plus-order branch without strengthening its equality
paths to direct row memberships.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailForce
namespace GlobalProducerContract

open Census554
open Census554.EqualityCore
open Census554.GeneralCarrierBridge

/-- The exact sink-facing disjunction.  Every branch consists only of a
production core and the orientation signs consumed by that core. -/
def ProductionOrderedCoreAlternative {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) : Prop :=
  (∃ core : FourPointTwoCircleBisectorOrderCore.Core (rowPattern F),
    0 < signedArea2 (pointOf core.u) (pointOf core.q) (pointOf core.v) *
      signedArea2 (pointOf core.y) (pointOf core.q) (pointOf core.v)) ∨
  (∃ core : SixPointTwoCircleArcOvertakeOrderCore.Core (rowPattern F),
    signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.C) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.D) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.A) (pointOf core.E) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.C) < 0 ∧
    signedArea2 (pointOf core.O) (pointOf core.E) (pointOf core.F) < 0 ∧
    signedArea2 (pointOf core.E) (pointOf core.F) (pointOf core.C) < 0) ∨
  (∃ core : SixPointTwoCircleOrderCore.Core (rowPattern F),
    signedArea2 (pointOf core.A) (pointOf core.B) (pointOf core.C) < 0 ∧
    signedArea2 (pointOf core.A) (pointOf core.B) (pointOf core.D) < 0 ∧
    signedArea2 (pointOf core.B) (pointOf core.D) (pointOf core.C) < 0 ∧
    signedArea2 (pointOf core.A) (pointOf core.P) (pointOf core.B) < 0 ∧
    signedArea2 (pointOf core.A) (pointOf core.Q) (pointOf core.B) < 0 ∧
    signedArea2 (pointOf core.Q) (pointOf core.B) (pointOf core.D) < 0 ∧
    signedArea2 (pointOf core.A) (pointOf core.P) (pointOf core.Q) < 0) ∨
  (∃ core : NestedEqualChordCore.Core (rowPattern F),
    signedArea2 (pointOf core.o) (pointOf core.a) (pointOf core.d) < 0 ∧
    signedArea2 (pointOf core.o) (pointOf core.b) (pointOf core.c) < 0 ∧
    signedArea2 (pointOf core.a) (pointOf core.b) (pointOf core.d) < 0 ∧
    signedArea2 (pointOf core.b) (pointOf core.c) (pointOf core.d) < 0)

/-- The disjunction is exactly strong enough to call an already-built sink;
there is no finite-cardinality or direct-row-membership assumption here. -/
theorem false_of_productionOrderedCoreAlternative
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (h : ProductionOrderedCoreAlternative F) : False := by
  have hreal := realizes F
  rcases h with hfour | harc | hsix | hnested
  · rcases hfour with ⟨core, hsame⟩
    exact FourPointTwoCircleBisectorOrderCore.false_of_core_of_same_side
      hreal core hsame
  · rcases harc with ⟨core, hOAC, hOAD, hOAE, hOEC, hOEF, hEFC⟩
    exact SixPointTwoCircleArcOvertakeOrderCore.false_of_core_of_neg
      hreal core hOAC hOAD hOAE hOEC hOEF hEFC
  · rcases hsix with ⟨core, hABC, hABD, hBDC, hAPB, hAQB, hQBD, hAPQ⟩
    exact SixPointTwoCircleOrderCore.false_of_core_of_neg
      hreal core hABC hABD hBDC hAPB hAQB hQBD hAPQ
  · rcases hnested with ⟨core, hoad, hobc, habd, hbcd⟩
    exact NestedEqualChordCore.false_of_core_of_neg
      hreal core hoad hobc habd hbcd

/-- The sink-facing disjunction for all eight production consumers currently
replayed by the extended matcher.  The first branch retains the ordered-only
contract; the remaining branches need only equality-closure cores. -/
def ProductionCoreAlternative {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) : Prop :=
  ProductionOrderedCoreAlternative F ∨
  Nonempty (FivePointHingeCycleCore (rowPattern F)) ∨
  Nonempty (SixPointHingeTailCore (rowPattern F)) ∨
  Nonempty (SixPointHingeDoubleSpokeCore (rowPattern F)) ∨
  Nonempty (SevenPointHingeClosedTailCore (rowPattern F))

/-- Every all-current production-core alternative contradicts a faithful
planar carrier realization. -/
theorem false_of_productionCoreAlternative
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (h : ProductionCoreAlternative F) : False := by
  have hreal := realizes F
  rcases h with hordered | hcycle | htail | hspoke | hclosed
  · exact false_of_productionOrderedCoreAlternative F hordered
  · rcases hcycle with ⟨core⟩
    exact false_of_fivePointHingeCycleCore hreal core
  · rcases htail with ⟨core⟩
    exact false_of_sixPointHingeTailCore hreal core
  · rcases hspoke with ⟨core⟩
    exact false_of_sixPointHingeDoubleSpokeCore hreal core
  · rcases hclosed with ⟨core⟩
    exact false_of_sevenPointHingeClosedTailCore hreal core

/-- Four indices occur in cyclic order `q,u,y,v`, independent of the chosen
linear cut of the boundary enumeration. -/
def CyclicFourIndices {n : ℕ} (q u y v : Fin n) : Prop :=
  (q < u ∧ u < y ∧ y < v) ∨
  (u < y ∧ y < v ∧ v < q) ∨
  (y < v ∧ v < q ∧ q < u) ∨
  (v < q ∧ q < u ∧ u < y)

/-- The smallest observed reusable branch: two equality-closure paths for
two common points of two centers, together with their forbidden cyclic
placement.  Unlike the direct carrier bridge, this does not require the
paths to be generated by three particular rows. -/
def FourPointClosureContract {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (B : BoundaryIndexing A) : Prop :=
  ∃ core : FourPointTwoCircleBisectorOrderCore.Core (rowPattern F),
    CyclicFourIndices (B.indexOf core.q) (B.indexOf core.u)
      (B.indexOf core.y) (B.indexOf core.v)

/-- The closure-plus-cyclic-order contract already contradicts a faithful
convex carrier.  The proof routes through the production cyclic-separation
theorem and therefore accepts arbitrary transitive `EdgeClosure` paths. -/
theorem false_of_fourPointClosureContract
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (B : BoundaryIndexing A) (h : FourPointClosureContract F B) : False := by
  rcases h with ⟨core, hcyc⟩
  have hqv : core.q ≠ core.v := by
    intro heq
    have hindex := congrArg B.indexOf heq
    unfold CyclicFourIndices at hcyc
    omega
  have hyq : core.y ≠ core.q := by
    intro heq
    have hindex := congrArg B.indexOf heq
    unfold CyclicFourIndices at hcyc
    omega
  have hyv : core.y ≠ core.v := by
    intro heq
    have hindex := congrArg B.indexOf heq
    unfold CyclicFourIndices at hcyc
    omega
  let sep : SeparationCore.SharedPairSeparationCore (rowPattern F) :=
    { firstCenter := core.q
      secondCenter := core.v
      firstPoint := core.u
      secondPoint := core.y
      centers_ne := hqv
      secondPoint_ne_firstCenter := hyq
      secondPoint_ne_secondCenter := hyv
      points_ne := core.huy
      firstCenter_eq := core.qu_qy
      secondCenter_eq := EdgeClosure.trans (EdgeClosure.flip core.v core.u)
        (EdgeClosure.trans core.uv_yv (EdgeClosure.flip core.y core.v)) }
  have hsep := B.sharedPair_satisfied F sep
  change
    (SurplusCOMPGBank.btw (B.indexOf core.q) (B.indexOf core.v)
        (B.indexOf core.u) ↔
      ¬ SurplusCOMPGBank.btw (B.indexOf core.q) (B.indexOf core.v)
        (B.indexOf core.y)) at hsep
  unfold SurplusCOMPGBank.btw at hsep
  unfold CyclicFourIndices at hcyc
  omega

#print axioms false_of_productionOrderedCoreAlternative
#print axioms false_of_productionCoreAlternative
#print axioms false_of_fourPointClosureContract

end GlobalProducerContract
end ATailForce
end Problem97
