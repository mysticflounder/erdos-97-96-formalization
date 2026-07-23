/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CyclicAlternationCore

/-!
# Mirror-branch transport machinery

The mirror branch evaluates CNF index `i` at boundary position
`ρ(i) = -i`.  The reflection factors as `ρ = (· + 1) ∘ ρ'` with
`ρ'(i) = 10 - i` a strict order reversal, so every order-sensitive
consumer applies through the cyclically shifted boundary
`shiftedBoundary Q = Q.boundary ∘ (· + 1)` (still CCW, injective, and
carrier-covering) at strictly decreasing transported positions.

This file provides the shifted boundary with its four side conditions,
the strict reversal `reflFin` with the factorization identity, the
`patternCode` transport bridge, and the mirror instance of family
`full_class_cyclic_alternation` (the antitone arm of the alternation
core).
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P5IndexedSourceScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch

/-- The strict index reversal `ρ'(i) = 10 - i`. -/
def reflFin : Label → Label := fun i => ⟨10 - i.val, by omega⟩

theorem reflFin_lt {i j : Label} (h : i < j) : reflFin j < reflFin i := by
  simp only [reflFin, Fin.lt_def] at h ⊢
  omega

/-- The mirror transport factors through the strict reversal and a
one-step cyclic shift. -/
theorem reflFin_add_one (i : Label) : reflFin i + 1 = mirrorIndex i := by
  revert i
  decide

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {distribution : ExactTwoStrictHitDistribution R}

/-- The exact-two boundary re-cut one position later. -/
def shiftedBoundary (Q : ExactTwoBoundaryCore R distribution) :
    Label → ℝ² :=
  fun i => Q.boundary (i + 1)

theorem shiftedBoundary_mem (Q : ExactTwoBoundaryCore R distribution)
    (i : Label) : shiftedBoundary Q i ∈ D.A :=
  boundary_mem_carrier Q (i + 1)

theorem shiftedBoundary_injective
    (Q : ExactTwoBoundaryCore R distribution) :
    Function.Injective (shiftedBoundary Q) :=
  injective_cyclicShift Q.boundary_injective 1

theorem shiftedBoundary_image (Q : ExactTwoBoundaryCore R distribution) :
    Finset.univ.image (shiftedBoundary Q) = D.A := by
  unfold shiftedBoundary
  rw [image_univ_cyclicShift]
  exact Q.boundary_image

theorem shiftedBoundary_ccw (Q : ExactTwoBoundaryCore R distribution) :
    EuclideanGeometry.IsCcwConvexPolygon (shiftedBoundary Q) :=
  isCcwConvexPolygon_cyclicShift Q.boundary_injective Q.boundary_ccw 1

/-- Evaluating the shifted boundary at the reversed position is the
mirror-transported boundary point. -/
theorem shiftedBoundary_reflFin (Q : ExactTwoBoundaryCore R distribution)
    (i : Label) :
    shiftedBoundary Q (reflFin i) = Q.boundary (mirrorIndex i) := by
  unfold shiftedBoundary
  rw [reflFin_add_one]

/-- The shifted-boundary `patternCode` at reversed positions is the
mirror-transported `patternCode`. -/
theorem patternCode_shifted_reflFin
    (Q : ExactTwoBoundaryCore R distribution) (c p : Label) :
    patternCode (shiftedBoundary Q) (shiftedBoundary_mem Q)
        Q.carrierPattern (reflFin c) (reflFin p) =
      patternCode (fun i => Q.boundary (mirrorIndex i))
        (fun i => boundary_mem_carrier Q (mirrorIndex i))
        Q.carrierPattern c p := by
  unfold patternCode
  rw [decide_eq_decide]
  rw [classAt_support_congr Q.carrierPattern
    (shiftedBoundary_mem Q (reflFin c))
    (boundary_mem_carrier Q (mirrorIndex c))
    (shiftedBoundary_reflFin Q c), shiftedBoundary_reflFin Q p]

/-- Family `full_class_cyclic_alternation` on the mirror branch: the
antitone arm of the alternation core over the shifted boundary. -/
theorem fullClassCyclicAlternationSat_mirror
    (Q : ExactTwoBoundaryCore R distribution) :
    FullClassCyclicAlternationSat Q mirrorIndex := by
  intro l r p q hlr hpq hpl hpr hql hqr hside heq
  obtain ⟨heql, heqr⟩ := heq
  unfold radiusEq at heql heqr
  simp only [← shiftedBoundary_reflFin] at heql heqr
  have hcard := carrier_card_eq_eleven Q
  exact false_of_nonalternating_equidistant D.convex
    (cardBoundary_injective hcard (shiftedBoundary_injective Q))
    (cardBoundary_image hcard (shiftedBoundary_image Q))
    (cardBoundary_ccw hcard (shiftedBoundary_ccw Q))
    (idx := fun i => toCardIndex hcard (reflFin i))
    (Or.inr fun i j h => toCardIndex_lt hcard (reflFin_lt h))
    hlr hpq hpl hpr hql hqr hside heql heqr

end P5IndexedSourceScratch
end Problem97

#print axioms Problem97.P5IndexedSourceScratch.shiftedBoundary_reflFin
#print axioms
  Problem97.P5IndexedSourceScratch.fullClassCyclicAlternationSat_mirror
