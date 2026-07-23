/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AlignedP5KalmansonDecode
import AlignedP5SourceTrace

/-!
# Direct aligned-p5 boundary closure

The semantic source trace for a direct aligned-p5 boundary packet enters the
closed native coverage theorem.  The resulting executable Kalmanson occurrence
is then impossible by the orientation-aware geometric decoder.

This file treats only the direct boundary packet.  The reflected boundary arm
is kept separate.
-/

namespace Problem97
namespace ATailUniqueFourAlignedP5BoundaryScratch.AlignedP5BoundaryPacket

open ATailAlignedP5KalmansonDecodeScratch
open ATailAlignedP5NativeClassifierScratch
open ATailAlignedP5NativeCoverageScratch
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open Census554.CapSelectedNativeClassifierSound

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 5 ∧ S.oppCap2.card = 4}
  {P : AlignedInteriorFrontier R}

/-- A direct aligned-p5 boundary packet contradicts the geometric Kalmanson
terminals after tracing its selected rows through the closed native search. -/
theorem false_of_boundaryPacket
    (Q : AlignedP5BoundaryPacket R profile P) : False := by
  have hcard : D.A.card = 11 := by
    have hsum := S.capSum
    omega
  rcases hasKalmansonOccurrence_of_semanticTrace Q.semanticTrace with
    ⟨centers, _hcenters, hcore⟩
  exact false_of_kalmansonCore_eq_true
    D.convex hcard Q.boundary Q.boundary_mem Q.boundary_injective
    Q.boundary_image Q.boundary_ccw Q.carrierPattern centers hcore

end ATailUniqueFourAlignedP5BoundaryScratch.AlignedP5BoundaryPacket
end Problem97
