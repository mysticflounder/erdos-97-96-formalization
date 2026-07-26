/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CardElevenUniqueFourCertificateCoordinator
import UniqueFourCardinalityBoundary

/-!
# Card-eleven original unique-four closure

This module connects the checked fixed-cardinality certificates to the
parent-facing unique-radius frontier fields.  It closes exactly the
card-eleven, exact-four leaf; it makes no claim about either exact-five leaf
or exact-four carriers of cardinality at least twelve.
-/

namespace Problem97
namespace ATailUniqueFourCardElevenCertificateScratch

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourUniformRouteAuditScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}

/-- The production unique-radius fields close the exact-four leaf at carrier
cardinality eleven. -/
theorem false_of_cardElevenOriginalFrontierUniqueRadiusArm_of_exactFour
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : D.A.card = 11)
    (hfour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (hunique : OriginalFrontierUniqueRadiusArm F) :
    False := by
  have hcardGt : 9 < D.A.card := by omega
  rcases originalUniqueRadiusArm_residual_dispatch
      F hmin hNoM44 hcardGt hunique with hfourResidual | hfiveResidual
  · exact false_of_cardElevenOriginalUniqueFourResidual
      hfourResidual.some hcard
  · rcases hfiveResidual with hdistinct | hcoincident
    · have hfive := hdistinct.some.base.class_card_eq_five
      omega
    · have hfive := hcoincident.some.base.class_card_eq_five
      omega

/-- The exact frontier left after consuming the checked card-eleven
exact-four certificates. -/
inductive OriginalUniqueRadiusArmPostCardEleven
    (F : CriticalPairFrontier D S radius H) : Type
  | exactFourLarge
      (residual : OriginalUniqueFourResidual F)
      (carrier_card_ge_twelve : 12 ≤ D.A.card)
  | exactFiveDistinct
      (residual : OriginalUniqueFiveDistinctBlockersResidual F)
  | exactFiveCoincident
      (residual : OriginalUniqueFiveCoincidentBlockerResidual F)

/-- After the fixed card-eleven certificates, the production unique-radius
arm has exactly three remaining source-faithful leaves. -/
theorem nonempty_originalUniqueRadiusArmPostCardEleven
    (F : CriticalPairFrontier D S radius H)
    (hmin : D.Minimal)
    (hNoM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44)
    (hcard : 9 < D.A.card)
    (hunique : OriginalFrontierUniqueRadiusArm F) :
    Nonempty (OriginalUniqueRadiusArmPostCardEleven F) := by
  rcases originalUniqueRadiusArm_residual_dispatch
      F hmin hNoM44 hcard hunique with hfourResidual | hfiveResidual
  · rcases hfourResidual with ⟨R⟩
    by_cases hcardEleven : D.A.card = 11
    · exact False.elim
        (false_of_cardElevenOriginalUniqueFourResidual R hcardEleven)
    · have hcardGe := carrier_card_ge_eleven R
      exact ⟨OriginalUniqueRadiusArmPostCardEleven.exactFourLarge
        R (by omega)⟩
  · rcases hfiveResidual with hdistinct | hcoincident
    · exact ⟨OriginalUniqueRadiusArmPostCardEleven.exactFiveDistinct
        hdistinct.some⟩
    · exact ⟨OriginalUniqueRadiusArmPostCardEleven.exactFiveCoincident
        hcoincident.some⟩

end ATailUniqueFourCardElevenCertificateScratch
end Problem97
