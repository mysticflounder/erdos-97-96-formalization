/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221ConcreteRowsBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverSat

/-!
# Live source ingress for the exact-twelve source-safe CNF

This module closes the source-to-finite ingress contract for the frozen
`C1/C2/C4` abstraction.  The exact-twelve residual supplies the exact cap and
strict-interior profile, the concrete-row bridge supplies a faithful carrier
pattern and frozen role labeling, and the safe-candidate bridge proves that
the resulting row family satisfies `FrozenSafeCubeOK`.

The resulting CNF is satisfiable, so this is an ingress theorem rather than a
contradiction.  Closing the live residual requires a separately source-proved
strengthening whose finite encoding excludes the surviving source-safe cubes.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open ExactTwelveCarrierIngress

/-- Every live exact-twelve pentagon-off-class residual induces a proof-facing
source-safe row family.  The carrier pattern is chosen by the concrete-row
producer, so future source-proved clauses may strengthen this ingress without
changing the role labeling. -/
theorem exists_source_safeCubeOK
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12) :
    ∃ carrierPattern : FaithfulCarrierPattern D.A,
      ∃ labeling : FrozenRoleLabeling Q carrierPattern,
        FrozenSafeCubeOK
          (labeledRowPattern carrierPattern labeling.e) := by
  classical
  obtain ⟨carrierPattern, ⟨labeling⟩, _hphysical, _hxv, _hnext⟩ :=
    exists_frozen_role_labeling_for_xuConcreteRows Q hcard
  rcases pentagonOffClassBlocker_card_twelve_exact_cap_profile
      P packet Q hcard with
    ⟨hsurplus, hfirst, hsecond, hsecondInterior, _growth⟩
  let interiors := labeling.interiorProfile
    hsurplus hfirst hsecond hsecondInterior
  let caps := interiors.closedCapProfile hsurplus hfirst hsecond
  exact ⟨carrierPattern, labeling, labeling.safeCubeOK interiors caps⟩

/-- Direct source-to-CNF ingress.  This theorem states the sound direction of
the abstraction only; it does not turn satisfiability into source
realizability or discharge any live contradiction. -/
theorem source_safeCoverCnf_sat
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    {P : ExactFourRigid221PhysicalApexSourceEqUContext R}
    {packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P}
    (Q : ExactFourRigid221PentagonOffClassBlockerResidual P packet)
    (hcard : D.A.card = 12) :
    ∃ τ : Nat → Bool,
      Std.Sat.CNF.eval τ SafeCoverCnf.baseCnf = true := by
  obtain ⟨_carrierPattern, _labeling, hsafe⟩ :=
    exists_source_safeCubeOK Q hcard
  exact safeCoverCnf_sat_of_safeCubeOK hsafe

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
