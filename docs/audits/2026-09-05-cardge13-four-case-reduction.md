# CardGe13 four-case coordinator reduction

Lane: `cardge13-four-case-reduction-20260905`  
Owner: `luna-swarm-radial-otter`  
Date: 2026-09-05

## Scope and source delta

The coordinator in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenCoordinator.lean`
now exposes four documented residual leaves—row overlap, disjoint fresh,
exact-thirteen finite, and adjacent grid—and exhaustively dispatches the
source-anchored outcome.  The exact-thirteen arm constructs the existing
`X`/`O`/coarse/source-role payload.  The coordinator keeps all four residual
leaves as same-change `sorry` obligations; this is a frontier decomposition,
not a CardGe13 closure.

`Rigid221Closure.lean` adds the coordinator import and calls the coordinator
from `false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.  The
initial call was corrected by removing leaf-only `named`/`sources` parameters
from `onSpine`; the leaf signatures retain those payloads.  The SourceRole
ingress received only the authorized robust membership conversion:
`hb0T`/`hb1T` are converted through `T.C0raw`/`T.C1raw` before rewriting.

## Validation

The final current-byte three-target `lake-build` succeeded with explicit
`lake-build: lake build exited 0`, replaying/building:

* `CardGeThirteenExact13SourceRoleIngress`
* `CardGeThirteenCoordinator`
* `Rigid221Closure`

The final current-tree pre-build and post-build SHA-256 snapshots compare
equal (`CURRENT-TREE-SNAPSHOT-CMP=0`).  They include the repaired SourceRole
ingress, current Geometry `TwoInteriorSameBoundaryRadius`, OneHit shell
reselection, both dispatchers, the coordinator, and Rigid consumer.  Logs:

* `scratch/runs/cardge13-four-case-reduction-20260905/run-0001/artifacts/build-final-rerun.log`
* `scratch/runs/cardge13-four-case-reduction-20260905/run-0001/artifacts/build-three-target-final.log`

The explicit Lean axiom probe reports:

* SourceRole witness ingress: `[propext, Classical.choice, Quot.sound]`.
* Coordinator `onSpine`: `[propext, sorryAx, Classical.choice, Quot.sound]`.
* Rigid CardGe13 consumer: `[propext, sorryAx, Classical.choice, Quot.sound]`.

The `sorryAx` is expected and comes from the four residual leaves; it is not
approved or claimed closed.  Probe: `artifacts/axiom-probe.log`.

## Proof-blueprint state

Ran `proof-blueprint refs --refresh`, `proof-blueprint sync`,
`proof-blueprint spine`, and axiom queries for the coordinator, Rigid
consumer, and configured target.  The build wrapper and direct refresh both
reported the same existing private-symbol cache mismatch:

`TwoSourceClosure.TwoSourceExactCollisionRowsTerminal.false_of_three_firstCap_hits_in_selected_row`
is indexed but absent from the imported environment.  Earlier attempts also
reported the corresponding stale private Geometry declaration; a forced
source-index refresh did not remove the stale-private-entry class of failure.
Consequently the graph mine cannot be freshly completed and the spine render
contains stale nodes; no proof-blueprint closure claim is made.  The axiom
queries independently confirm the intentional `sorryAx` frontier.  Outputs
are retained under the run root.

## Reproducibility and hand-off

The run manifest records current source digests, including SourceRole,
Geometry, OneHit, coordinator, Rigid, and both dispatchers.  Its self-hash is
`caea2d6e4045d8007dca013f7e5de872126814a0f10f189b02ff4fc4d516f38f`.

This lane does not close CardGe13.  Remaining work is to discharge the four
residual leaves and repair/re-mine the shared private-symbol blueprint cache
before relying on a fresh spine report.
