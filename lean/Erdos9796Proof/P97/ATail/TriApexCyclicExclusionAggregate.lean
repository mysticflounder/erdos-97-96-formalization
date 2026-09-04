/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CyclicForeignHitExclusion
import Erdos9796Proof.P97.ATail.TwoRadiiAdjacentCapForeignLowerBound
import Erdos9796Proof.P97.ATail.ForeignHitPairBound

/-!
# Tri-apex cyclic-exclusion aggregate

This import-only module keeps the tri-apex cyclic-exclusion chain buildable
off-spine.  It adds no theorem, definition, serializer, or solver entitlement.

The three imports are the roots of the chain's import DAG, and between them
they cover its nine modules: `AdjacentCapContainment`,
`CyclicSideInequalities`, `InDiskCriterion`, `CircumradiusRelation`,
`NonObtusePolarization`, `SlotOccupantDichotomy`, `CyclicForeignHitExclusion`,
`TwoRadiiAdjacentCapForeignLowerBound`, and `ForeignHitPairBound`.

## Scope and nonclaims

None of these modules is in the import closure of the public `Erdos9796Proof`
root, and this aggregate is deliberately absent from that root too.  Building
this target shows only that the nine modules elaborate together against the
current tree.  It establishes no consumer reachability, discharges no
obligation of the D1 tri-apex leaf, and carries no promotion claim; promotion
would need a named on-spine aggregate import edge and a `lean-ingress` binding
record, neither of which exists.

The mathematics these modules carry, and the exact scope limits on it — the
one-radius arm, the card-fifteen gate — are recorded in
`docs/plans/2026-09-01-d1-triapex-paired-common-deletion-closure-plan.md`,
sections 62 through 82.
-/
