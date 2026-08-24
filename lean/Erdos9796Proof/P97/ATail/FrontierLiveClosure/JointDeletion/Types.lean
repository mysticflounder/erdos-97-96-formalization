/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ExactFourPhysicalConsumer

/-!
# Joint-deletion packet types

The data structures behind the exact-four mutual-omission joint deletion, with
the smallest import cone that elaborates the declarations themselves.  Consumers
that only need to mention a joint-deletion packet import this module instead of
the certificate and geometry layers above it.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCommonDeletionTwoCenter
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailLargeCapUniqueFive
open Census554.CapSelectedGeometry
open ATailCriticalSystemRebase
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailPhysicalSecondApexSwap
open ATailSurvivalCover
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- The concrete narrowing supplied by a mutually omitted pair in a
five-point physical second-apex radius class.  A third class point is absent
from both actual late rows, so deleting it preserves K4 at the physical apex
and at both distinct actual blockers. -/
structure ExactFourMutualOmissionJointDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (u v : CarrierVertex D.A) : Type where
  deleted : CarrierVertex D.A
  deleted_mem_class :
    deleted.1 ∈ SelectedClass D.A S.oppApex2 rho
  deleted_ne_u : deleted ≠ u
  deleted_ne_v : deleted ≠ v
  deleted_not_mem_uRow :
    deleted.1 ∉
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
  deleted_not_mem_vRow :
    deleted.1 ∉
      ((lateFirstApexSystem R).selectedAt
        v.1 v.2).toCriticalFourShell.support
  blockers_ne :
    (lateFirstApexSystem R).centerAt u.1 u.2 ≠
      (lateFirstApexSystem R).centerAt v.1 v.2
  uPacket :
    CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) deleted.1
      ((lateFirstApexSystem R).centerAt u.1 u.2) S.oppApex2
  vPacket :
    CommonDeletionTwoCenterPacket D (lateFirstApexSystem R) deleted.1
      ((lateFirstApexSystem R).centerAt v.1 v.2) S.oppApex2

/-- Source-row data retained from the strict-cap omitted-peer producer.
The rigid `2+2+1` terminal needs this context: the bare partition and global
minimal deletion do not remember which row supplied the mutually omitted
pair. -/
structure ExactFourMutualOmissionSourceContext
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (rho : ℝ) (source other u v : CarrierVertex D.A) : Prop where
  source_mem_class :
    source.1 ∈ SelectedClass D.A S.oppApex2 rho
  source_mem_interior :
    source.1 ∈ S.capInteriorByIndex S.oppIndex2
  source_mem_outside :
    source ∈ outsideFirstApexFiber R
  source_cross_card_le_two :
    ((((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support ∩
        (SelectedClass D.A S.oppApex2 rho ∩
          S.capInteriorByIndex S.oppIndex2)).card ≤ 2)
  other_ne_source : other ≠ source
  other_mem_class :
    other.1 ∈ SelectedClass D.A S.oppApex2 rho
  other_mem_interior :
    other.1 ∈ S.capInteriorByIndex S.oppIndex2
  other_not_mem_source_row :
    other.1 ∉
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
  source_other_blockers_ne :
    (lateFirstApexSystem R).centerAt source.1 source.2 ≠
      (lateFirstApexSystem R).centerAt other.1 other.2
  source_survives_q_or_w :
    HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
        ((lateFirstApexSystem R).centerAt source.1 source.2) ∨
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
        ((lateFirstApexSystem R).centerAt source.1 source.2)
  source_mem_u_row :
    source.1 ∈
      ((lateFirstApexSystem R).selectedAt
        u.1 u.2).toCriticalFourShell.support
  v_not_mem_source_row :
    v.1 ∉
      ((lateFirstApexSystem R).selectedAt
        source.1 source.2).toCriticalFourShell.support
  u_eq_source_or_not_mem_source_row :
    u = source ∨
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          source.1 source.2).toCriticalFourShell.support

end ATailFrontierLiveClosure
end Problem97
