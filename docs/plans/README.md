<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Plan index

Current proof state comes from the machine registry and live spine, not from a
fixed count embedded in a plan. The repository-wide authored ledger is the
[computational closure plan](../computational-closure-plan-2026-07-28.md).

## Current or partially current plans

- [TriApex paired common-deletion leaf](2026-09-01-d1-triapex-paired-common-deletion-closure-plan.md)
  — covering plan for the sole open TriApex obligation
  `false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core`.
- [B1 equal-blocker continuation](2026-08-29-b1-global-continuation.md) —
  current B1 residual and validation boundary.
- [B-family closure plan](2026-08-18-b-family-closure-plan.md) — current as
  background for B2/B3; its B1 target and fixed frontier count are superseded
  by the 2026-08-29 continuation plan.
- [FirstFiber witness search](2026-08-18-firstfiber-full-witness-search-plan.md)
  — executable search plan, not a closure claim.
- [Cap-configuration PIQD census](2026-08-23-cap-configuration-piqd-census-plan.md)
  — standalone plan; operation is governed by the
  [fail-closed runbook](../runbooks/p97-cap-configuration-ce-search.md).
- [Positive semantic contract](p97-positive-semantic-contract-implementation-plan-2026-08-30.md)
  — current implementation plan for the positive semantic boundary.

## Historical implementation records

- [Rigid221 post-positive-controls recommendation](rigid221-post-positive-controls-next-step-2026-08-28.md)
  — explicitly superseded.
- [capSourceThird refactor plan](false_of_capSourceThirdCanonicalRowSurface_refactor-plan-07-31-2026.md)
  — dated implementation history.
- [Progress-metric recommendations](p97-progress-metric-recommendations-2026-08-03.md)
  — dated process recommendations.

Rejected plans and their reviews belong in [`../archive/`](../archive/) and
[`../audits/`](../audits/), respectively.
