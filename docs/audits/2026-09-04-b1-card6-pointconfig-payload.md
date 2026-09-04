# B1 card-six positive PointConfiguration payload

- Lane: `luna-swarm-slice-ingress-b1-card6-pointconfig-payload-20260904`
- Assignment: monitor message `#10711`, following B1 assignment `#9780`
- Claim: convo message `#10712`
- Checkpoint: `.codex/worktree-checkpoints/luna-swarm-slice-ingress-b1-card6-pointconfig-payload-20260904.json`
- Run manifest: `scratch/runs/luna-swarm-slice-ingress-b1-card6-pointconfig-payload-20260904/run-0001/run_manifest.json`
- Lane base: `03912489fe67f3911de3bfbe7a67b2dc10d46ebe`
- Working-tree head observed after the source check: `68bb902a330e3cc69fa9e32d0284ebc51b36697f`

## Result

The typed Lean payload is implemented in
`B1CardSixPointConfigurationIngress.lean` and compiles with exit status zero:

```text
cd lean
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CardSixPointConfigurationIngress.lean
```

The source file has no `sorry`, `axiom`, `unsafe`, `native_decide`,
`implemented_by`, or `extern` marker.  No PIQD session, QF_NRA emission, or
solver job was launched.

## Payload shape

`B1CardSixPointConfigurationPayload.Payload` is parameterized by the local
packet `P`, the normal-form proof `hnormal`, the card-six proof `hsix`, and the
escape provenance record `E`.  Thus the enriched producer retains every proof
needed by the card-six boundary ingress instead of recovering erased facts
from `B1FiveSixWaveIngress.cardSix`.

The constructor `ofSource` supplies:

- the complete carrier `E.boundary`, its nonemptiness, full image, and
  counterclockwise convex boundary proof;
- typed indices for all sixteen roles
  `physicalApex,d1,d2,u0,u1,v0,v1,Bc,Bu,Bv,c0,c1,uL,uR,vL,vR`;
- four typed rows `physical`, `common`, `u`, and `v`, with members obtained
  by applying `E.boundary.indexOf` to the four public row-choice supports;
- an anchor member for each row and the positive common-radius equality from
  every listed member to that anchor;
- the physical-row cardinality six source theorem;
- exactly the five source-backed pairwise distinctions available in the
  packet: `u0 ≠ u1`, `v0 ≠ v1`, `c0 ≠ c1`, `uL ≠ uR`, and `vL ≠ vR`;
- source branch data for the winning live-slice cardinality, escape-source
  membership, and cross omission.

The role-index preservation field proves that two payload indices coincide
precisely when their source carrier labels coincide.  Therefore aliases remain
aliases, and no cross-row distinction is inferred from role names.

## Source bridge for positive rows

For a row tag and a listed member, `ofSource` applies
`B1CardSixLocalRolePacket.positiveRowsMatch_sourceRowChoices`, using the
public membership characterization `mem_sourceMetricRows_iff`.  Applying the
same chain to the designated anchor gives the equality emitted by native
`CommonRadius`.  The boundary `point_eq` field transports that equality from
source carrier labels to free boundary coordinates.  The canonical injective
realization is retained through `E.boundary.index_injective` and
`E.boundary.boundary_injective`.

This uses the monitor correction: `PointConfiguration/v1` is positive-only.
No omitted-carrier inequalities are included, and no exact-row assertion is
claimed.

## Remaining gate

The payload covers the metric fields required by the positive-only schema.
Conversion of this proof-facing typed payload to the external string-labeled
Rust input still needs a separately authenticated source-manifest adapter;
this lane does not launch that external process.  The target B1 terminal
negation and the source-level cap/deletion conclusions remain outside the
PointConfiguration metric input, as required by the schema.
