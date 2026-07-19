/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierCommonDeletionSurplusEscape

/-!
# arm2 coupled question — does the FE factor supply the missing first-cap center?

Scratch analysis (session fd7b0078, 2026-07-19).  The SI-alone kill of
`RetainedInteriorBlockerCollision R → False` (card≥5) stalls because
`outsidePair_unique_capCenter` (CapSelectedRowCounting.lean:283) needs a SECOND
member of the FIRST cap co-radial from source₁'s shell outside pair `{a,b}`, and
the collision supplies only one first-cap center (the shared blocker `bc`).

The COUPLED obligation `FrontierCoupledStrictInteriorNormalForm R → False`
(FrontierCoupledStrictInteriorNormalForm.lean:31) additionally carries
`frontierEscape : FrontierCommonDeletionRefinedNormalForm R`.  Coordinator's
decisive question: does any of its three `FrontierRefinedEscapeOutcome` cases
(FrontierCommonDeletionSurplusEscape.lean:490) supply a first-cap center
DISTINCT from `bc` that is co-radial from `{a,b}` (or forces `{a,b}` onto a
second concentric cap-center)?

## VERDICT: NO for all three cases — the coupling does NOT supply the center.

The residual stays global (Q).  The exact structural reason, per case:

* **FE1 `originalOffRadiusCommonDeletion`** (SurplusEscape.lean:496).  The escape
  point is OFF the frontier radius (`FrontierOffRadiusEscape.off_radius`,
  Escape.lean:393).  Its common-deletion packet
  (`FrontierOffRadiusCommonDeletion.packet`, Escape.lean:443) has survival
  centers `center₁ = S.oppApex1` and `center₂ = H.centerAt F.pair.q` — the
  FIRST apex and the FRONTIER-pair blocker.  `oppApex1 ∉ capByIndex oppIndex1`
  (it is the opposite apex — a member of every cap EXCEPT the first, cf.
  `commonFirstApexPair_center_mem_firstCapInterior`, RetainedMatchingLargeCap-
  Consumer.lean:186-198).  `centerAt F.pair.q` is the frontier pair's blocker;
  no field forces it into `capByIndex oppIndex1`, and — decisively — NO FE field
  asserts co-radiality from source₁'s shell `{a,b}` (which live on `bc`'s shell,
  not on `F.pair.q`'s).  So neither packet center is a usable second first-cap
  co-radial center.  PROVEN(does-not-supply-center).

* **FE2 `onRadiusSurplusPairedCommonDeletion`** (SurplusEscape.lean:500).  The
  escape point lies IN the surplus cap (`ParentSurplusEscape.point_mem_surplusCap`;
  `escape.point ∈ S.surplusCap`) — NOT the first cap.  Its companion
  (`FirstApexMarginalCompanion`, SurplusEscape.lean:141) IS on the frontier
  radius off surplus (`point_mem_firstApexMarginal`, :154-156) but survives
  deletion at `H.centerAt F.pair.q` (`actualBlocker_survives_deleting_point`,
  :157-159), NOT at `bc`, and carries no co-radiality from `{a,b}`.  PROVEN(does-
  not-supply-center).

* **FE3 `companionOffRadiusCommonDeletion`** (SurplusEscape.lean:505).  A second
  off-radius companion escape (`escape.point ∉ S.surplusCap`, off frontier
  radius) with common-deletion again at `(oppApex1, centerAt F.pair.q)`.  Same
  reason as FE1.  PROVEN(does-not-supply-center).

## Root structural fact

Source₁'s outside pair `{a,b} = shell(source₁) \ capByIndex oppIndex1` are members
of the `bc`-centred critical shell.  EVERY FE object
(`FrontierSecondRowOffConfinementEscape`, `FrontierOffRadiusCommonDeletion`,
`ParentSurplusEscape`, `FirstApexMarginalCompanion`,
`OnRadiusSurplusMarginalCommonDeletion`, `FrontierDirectedBlockerOutcome`) is
stated over the FRONTIER pair `(F.pair.q, F.pair.w)`, its blocker
`centerAt F.pair.q`, the SURPLUS cap, and the SECOND apex `oppApex2` (only in the
`point_ne_secondApex` / surplus-counting helpers) — none references `source₁`,
`bc`, or `shell(source₁)`.  Hence no FE field can DERIVE
`dist c a = dist c b` for a first-cap `c ≠ bc`; the closing hypothesis of
`outsidePair_unique_capCenter` is logically absent from the FE factor.  Supplying
it is exactly the global `D.K4` incidence — the (Q) core, unchanged by the
coupling.

## Second question — oppApex2-survival for a collision point?

NO.  Every FE common-deletion is centred at `S.oppApex1` and `H.centerAt F.pair.q`
(Escape.lean:443, SurplusEscape.lean:157-159); none is centred at `S.oppApex2`.
The only `oppApex2` appearances are `escape.point ≠ oppApex2` and the surplus-
counting `SelectedFourClass D.A S.oppApex2` helper (Escape.lean:89), neither of
which supplies `HasNEquidistantPointsAt 4 (D.A.erase source_i) S.oppApex2`.  So the
card-5 `SurvivorPairRelocationPacket` producers `blocker_centers_eq_iff_..._of_
five_le` / `card_five_cross_deletion_survives_or_cross_oppositeSide`
(CriticalPairFrontier.lean:1177 / :1202) — which REQUIRE oppApex2-survival —
remain inapplicable to the collision even after coupling with FE.

The lemmas below FORMALISE (kernel-clean) the two positive crux facts that make
the above negative verdict evident.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailArm2SI1CoupledFE

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailFrontierCommonDeletionEscape
open ATailFrontierCommonDeletionSurplusEscape

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A}
  {F : CriticalPairFrontier D S radius H}
  {R : FrontierCommonDeletionParentResidual F}

/-- **Crux 1.** The FE escape point is never a fresh first-cap co-radial point:
it lies in the surplus cap or off the frontier radius.  A second first-cap
center co-radial from source₁'s shell would have to be a first-cap point on the
frontier radius off surplus; the escape point is structurally excluded from that
shape. -/
theorem fe_escapePoint_surplus_or_off_radius
    (normal : FrontierCommonDeletionConsumerNormalForm R) :
    normal.escape.point ∈ S.surplusCap ∨
      dist normal.escape.point S.oppApex1 ≠ radius :=
  normal.escape.point_mem_surplus_or_firstApexRadius_ne

/-- **Crux 2.** The FE1/FE3 off-radius common-deletion survives at exactly the
first apex and the FRONTIER-pair blocker `centerAt F.pair.q` — never at
source₁'s collision blocker `bc`, and with no co-radiality from source₁'s shell
outside pair.  These two centers are the only ones the FE factor supplies. -/
theorem fe_offRadius_commonDeletion_centers
    {escape : FrontierSecondRowOffConfinementEscape R.common}
    {E : FrontierOffRadiusEscape R escape}
    (cd : FrontierOffRadiusCommonDeletion escape E) :
    HasNEquidistantPointsAt 4 (D.A.erase escape.point) S.oppApex1 ∧
    HasNEquidistantPointsAt 4 (D.A.erase escape.point)
      (H.centerAt F.pair.q F.pair.q_mem_A) :=
  ⟨cd.packet.survives₁, cd.packet.survives₂⟩

/-- **Crux 3 (FE2).** The on-radius surplus companion survives deletion at the
FRONTIER-pair blocker `centerAt F.pair.q`, and is a frontier-radius / off-surplus
point — again with no tie to source₁'s blocker or shell. -/
theorem fe_surplusCompanion_survives_at_frontierBlocker
    {Es : ParentSurplusEscape R}
    (hit : FirstApexMarginalCompanion Es) :
    HasNEquidistantPointsAt 4 (D.A.erase hit.point)
      (H.centerAt F.pair.q F.pair.q_mem_A) ∧
    hit.point ∈ ((D.A.filter fun x ↦ dist x S.oppApex1 = radius) \ S.surplusCap) :=
  ⟨hit.actualBlocker_survives_deleting_point, hit.point_mem_firstApexMarginal⟩

-- Axiom audit: all three crux extractions are kernel-clean.
#print axioms fe_escapePoint_surplus_or_off_radius
#print axioms fe_offRadius_commonDeletion_centers
#print axioms fe_surplusCompanion_survives_at_frontierBlocker

end ATailArm2SI1CoupledFE
end Problem97
