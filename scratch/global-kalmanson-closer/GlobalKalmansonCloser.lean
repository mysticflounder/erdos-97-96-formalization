/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Global Kalmanson closer audit

This scratch file isolates two facts.

* A pair of equality closures matching either strict Kalmanson sum is
  contradictory on a convex CCW carrier.
* A retained collision supplies exactly the blocker-centered equality closure
  between its two named sources.  If the blocker is a named point from the
  other collision row, this merely renames the center of that one closure.

The missing production step is therefore a producer of the complementary
closure on one common cyclically ordered quadruple.  This file does not assert
such a producer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace GlobalKalmansonCloserScratch

open ATailRetainedStrictInteriorPairSelector
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open CapCrossingKalmansonBridge
open Census554.EqualityCore
open Census554.GeneralCarrierBridge

/-- The two equality-closure patterns that directly cancel one of the two
strict Kalmanson inequalities on `a < b < c < d`.

This is a terminal interface, not a claim that the current collision-row
hypotheses produce it.
-/
inductive PairedKalmansonClosure {α : Type*} (P : RowPattern α)
    (a b c d : α) : Prop
  | firstSum
      (hbc_ac : EdgeClosure P (b, c) (a, c))
      (had_bd : EdgeClosure P (a, d) (b, d))
  | complementarySum
      (hab_ac : EdgeClosure P (a, b) (a, c))
      (hcd_bd : EdgeClosure P (c, d) (b, d))

/-- Either paired equality-closure pattern contradicts the corresponding
strict Kalmanson inequality on a convex CCW boundary. -/
theorem PairedKalmansonClosure.false_of_ccw
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin A.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = A)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {P : RowPattern (Fin A.card)}
    (hreal : Realizes P boundary)
    {ia ib ic id : Fin A.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hpaired : PairedKalmansonClosure P ia ib ic id) :
    False := by
  cases hpaired with
  | firstSum hbc_ac had_bd =>
      have hbc_ac_dist :
          dist (boundary ib) (boundary ic) =
            dist (boundary ia) (boundary ic) := by
        simpa only [edgeDist] using EdgeClosure.sound hreal hbc_ac
      have had_bd_dist :
          dist (boundary ia) (boundary id) =
            dist (boundary ib) (boundary id) := by
        simpa only [edgeDist] using EdgeClosure.sound hreal had_bd
      have hstrict :=
        dist_add_dist_lt_diagonal_sum_of_ccw hA
          hboundary_injective hboundary_image hboundary_ccw
          hiab hibc hicd
      linarith
  | complementarySum hab_ac hcd_bd =>
      have hab_ac_dist :
          dist (boundary ia) (boundary ib) =
            dist (boundary ia) (boundary ic) := by
        simpa only [edgeDist] using EdgeClosure.sound hreal hab_ac
      have hcd_bd_dist :
          dist (boundary ic) (boundary id) =
            dist (boundary ib) (boundary id) := by
        simpa only [edgeDist] using EdgeClosure.sound hreal hcd_bd
      have hstrict :=
        complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA
          hboundary_injective hboundary_image hboundary_ccw
          hiab hibc hicd
      linarith

/-- A retained collision gives the row equality between its two sources at
their common blocker in every faithful whole-carrier row pattern. -/
theorem collision_source_pair_edgeClosure_at_blocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (rows : FaithfulCarrierPattern D.A)
    (P : RetainedInteriorBlockerCollision R) :
    EdgeClosure (rowPattern rows)
      (blockerLabel H P.source₁ P.source₁_mem_A,
        ⟨P.source₁, P.source₁_mem_A⟩)
      (blockerLabel H P.source₁ P.source₁_mem_A,
        ⟨P.source₂, P.source₂_mem_A⟩) := by
  apply EdgeClosure.row
  · exact source_mem_blocker_row rows H
      ⟨P.source₁, P.source₁_mem_A⟩
  · apply
      (mem_rowPattern_iff rows
        (blockerLabel H P.source₁ P.source₁_mem_A)
        ⟨P.source₂, P.source₂_mem_A⟩).mpr
    rw [blocker_row_support_eq_shell]
    exact P.source₂_mem_source₁_shell

/-- If a collision blocker is a named point `q`, the collision equality is
only the one-star closure centered at `q`; no second closure is created by the
identification itself. -/
theorem collision_source_pair_edgeClosure_at_namedBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (rows : FaithfulCarrierPattern D.A)
    (P : RetainedInteriorBlockerCollision R)
    (q : ℝ²) (hq : q ∈ D.A)
    (hblocker : H.centerAt P.source₁ P.source₁_mem_A = q) :
    EdgeClosure (rowPattern rows)
      (⟨q, hq⟩, ⟨P.source₁, P.source₁_mem_A⟩)
      (⟨q, hq⟩, ⟨P.source₂, P.source₂_mem_A⟩) := by
  have hlabel :
      blockerLabel H P.source₁ P.source₁_mem_A = ⟨q, hq⟩ :=
    Subtype.ext hblocker
  simpa only [hlabel] using
    collision_source_pair_edgeClosure_at_blocker rows P

/-- The production leaf's finite `capEightOrCross` split translates each
blocker/source equality arm into one named one-star closure.  In particular,
the split does not itself produce either two-closure constructor of
`PairedKalmansonClosure`. -/
theorem capEightOrCross_to_named_oneStarClosures
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (rows : FaithfulCarrierPattern D.A)
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (hcapEightOrCross :
      8 ≤ (S.capByIndex S.oppIndex1).card ∨
        H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁ ∨
          H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂ ∨
            H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁ ∨
              H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    8 ≤ (S.capByIndex S.oppIndex1).card ∨
      EdgeClosure (rowPattern rows)
          (⟨Pρ.source₁, Pρ.source₁_mem_A⟩,
            ⟨P.source₁, P.source₁_mem_A⟩)
          (⟨Pρ.source₁, Pρ.source₁_mem_A⟩,
            ⟨P.source₂, P.source₂_mem_A⟩) ∨
        EdgeClosure (rowPattern rows)
            (⟨Pρ.source₂, Pρ.source₂_mem_A⟩,
              ⟨P.source₁, P.source₁_mem_A⟩)
            (⟨Pρ.source₂, Pρ.source₂_mem_A⟩,
              ⟨P.source₂, P.source₂_mem_A⟩) ∨
          EdgeClosure (rowPattern rows)
              (⟨P.source₁, P.source₁_mem_A⟩,
                ⟨Pρ.source₁, Pρ.source₁_mem_A⟩)
              (⟨P.source₁, P.source₁_mem_A⟩,
                ⟨Pρ.source₂, Pρ.source₂_mem_A⟩) ∨
            EdgeClosure (rowPattern rows)
              (⟨P.source₂, P.source₂_mem_A⟩,
                ⟨Pρ.source₁, Pρ.source₁_mem_A⟩)
              (⟨P.source₂, P.source₂_mem_A⟩,
                ⟨Pρ.source₂, Pρ.source₂_mem_A⟩) := by
  rcases hcapEightOrCross with hcap | h₁ | h₂ | h₃ | h₄
  · exact Or.inl hcap
  · exact Or.inr <| Or.inl <|
      collision_source_pair_edgeClosure_at_namedBlocker
        rows P Pρ.source₁ Pρ.source₁_mem_A h₁
  · exact Or.inr <| Or.inr <| Or.inl <|
      collision_source_pair_edgeClosure_at_namedBlocker
        rows P Pρ.source₂ Pρ.source₂_mem_A h₂
  · exact Or.inr <| Or.inr <| Or.inr <| Or.inl <|
      collision_source_pair_edgeClosure_at_namedBlocker
        rows Pρ P.source₁ P.source₁_mem_A h₃
  · exact Or.inr <| Or.inr <| Or.inr <| Or.inr <|
      collision_source_pair_edgeClosure_at_namedBlocker
        rows Pρ P.source₂ P.source₂_mem_A h₄

#print axioms PairedKalmansonClosure.false_of_ccw
#print axioms collision_source_pair_edgeClosure_at_blocker
#print axioms collision_source_pair_edgeClosure_at_namedBlocker
#print axioms capEightOrCross_to_named_oneStarClosures

end GlobalKalmansonCloserScratch
end Problem97
