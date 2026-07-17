# Ranked common-deletion transition audit

Date: 2026-07-16

Status: **NO PROVENANCE-PRESERVING DESCENT FOLLOWS FROM THE CURRENT
CARD-AT-LEAST-FOURTEEN PACKET. THE INTERFACE MISMATCH IS SOURCE-EXACT, AND A
KERNEL-CHECKED EXACT CONVEX/MEC REGRESSION RULES OUT THE PROPOSED LOCAL-RANK
NO-WRAP STEP.**

Route status: **SECONDARY NEGATIVE AUDIT.**  The later physical-second-apex
producer and uniform consumer bypass generic ranked recursion entirely,
reducing card ≥14 to `FullyDeletionRobustAt D S.oppApex2` or swapped
`FA-UNIQ4`.  This report remains a regression against reviving an unranked
generic common-deletion loop; it is no longer the primary closure boundary.

This lane owns only:

```text
scratch/atail-force/ranked-common-deletion-transition/
```

It does not edit production Lean, shared docs, proof-blueprint state,
`CriticalPairFrontier.lean`, `SevenPointTwinFourCircleCollision.lean`,
`SurplusM44`, or another scratch lane.

## Verdict

The card-at-least-fourteen theorem and the postmix rank theorem are not two
adjacent interfaces.

The former produces a generic common-deletion packet at two arbitrary actual
blockers. The latter is available only after a long physical-role-specific
construction whose common-deletion centers are literally `p` and
`S.oppApex2`. No current field identifies either arbitrary blocker with those
centers or reconstructs the erased live/F2/generated-row history.

There is a second, independent obstruction. Even after manually supplying
the cap membership and equal-radius companion required by the postmix rank
adapter, `EqualRadiusOppositeRankData` is a local between statement, not a
directed descent. The exact rational directed-cycle model has all three local
between statements in one fixed boundary presentation, but the third edge
wraps across the linear cut. No natural-valued rank can strictly decrease
around the resulting cycle.

Therefore the next valid consumer cannot be:

```text
generic common-deletion packet
  -> choose local cap ranks independently
  -> recurse at a fresh source
```

That shape remains unranked recursion.

## Exact source interface

The checked theorem

```lean
exists_sourceFaithful_commonDeletionTwoCenterPacket_of_card_ge_fourteen
```

retains exactly:

- `deleted = P.q` or `deleted = P.w`;
- two carrier sources outside `qBlockerFiber P`;
- two distinct centers
  `H.centerAt source₁` and `H.centerAt source₂`;
- survival of deleting `deleted` at both centers; and
- the corresponding `CommonDeletionTwoCenterPacket`.

It does **not** retain:

- a cap containing either source;
- a cap containing either blocker center;
- an ordered-cap presentation;
- an equal-radius companion in the blocker's cap;
- equality of either center with `p`, `S.oppApex1`, or `S.oppApex2`;
- a fixed first-apex marginal or terminal-history carrier;
- named live-row, F2-cell, or generated-row provenance; or
- any cross-step relation between a later fresh source and the original two
  selected sources.

The nearby cap theorems do not repair this by conjunction.

- `exists_distinct_sameCapInterior_sameDeletionSurvival_sources` chooses a
  possibly different pair of sources in one strict cap, but does not force
  their blockers to be distinct.
- `nonempty_blockerCapSurvivalPair` chooses a possibly different source pair
  whose blockers occupy one closed cap, but allows equal blockers.
- `sameBlockerShell_or_orderedDistinctBlockers` gives honest ranks in the
  distinct-blocker arm, but both critical rows **omit** the common deleted
  frontier point. It supplies neither a shared outside support pair nor an
  endpoint-radius equality.

These existential witnesses cannot be silently identified. Their proofs use
different pigeonhole assignments, and no theorem states that one chosen pair
satisfies all three packets.

## Exact postmix interface

`HistoryRetainingPostmixSourceSplit Q` is indexed by all of the following:

```text
W      : LiveDangerousRetainingSystem D p q t1 t2 t3
R      : CoherentRCommonDeletionPacket T P₀ W.H
A      : AnchoredSourceCriticalTransition R
X      : RowExternalCommonDeletionSource A
hcenter : R.firstCenter = p
P      : AnchoredProvenanceF2NormalForm W R A X hcenter
chain  : SourceFaithfulF2ThreeRowChain ...
K      : AnchoredF2LiveHeavyReduction ...
Q      : OriginalQGeneratedSuccessorPair K
```

The common-deletion packet used by that chain is exactly

```text
alignedSharedRowPacket X hcenter
  : CommonDeletionTwoCenterPacket D W.H X.point p S.oppApex2.
```

The history-retaining reroute additionally records:

```text
Q.at_x.source = Q.at_y.source
Q.at_x.source = S.oppApex2
Q.generated.toTwoContinuationRows.EquilateralResidual.
```

None of those equalities is a field of the card-at-least-fourteen output.
Even the deleted-source roles differ: the generic producer deletes a frontier
point `P.q` or `P.w`, while the postmix aligned packet deletes the later
row-external point `X.point`.

Consequently there is no sound adapter from the new generic packet to
`HistoryRetainingPostmixSourceSplit`. Constructing one would require proving
the missing physical alignment and all of the intermediate live/F2
provenance; that is the mathematical consumer, not interface plumbing.

## Kernel-checked no-wrap regression

`RankedCommonDeletionTransitionAudit.lean` imports the existing exact rational
configuration from

```text
strict-oppcap-cross-classifier/directed-cycle-geometry/
  DirectedCycleCountermodel.lean
```

Its nine points are in strict convex position and admit the checked
non-obtuse circumscribed MEC triangle. The three source/blocker pairs satisfy:

```text
dist c0 q0 = dist c0 q1
dist c1 q1 = dist c1 q2
dist c2 q2 = dist c2 q0.
```

In one fixed boundary cut, the source ranks are

```text
q0 = 2, q1 = 5, q2 = 7
```

and the corresponding center ranks are

```text
c0 = 3, c1 = 6, c2 = 4.
```

Thus every center lies strictly between its equal-radius source pair:

```text
2 < 3 < 5
5 < 6 < 7
2 < 4 < 7.
```

The first two directed source edges increase in the cut, while the third edge
is `7 -> 2` and wraps. The new file kernel-proves:

```lean
cycleCenter_bisects_source_successor
cycleCenter_strictly_between_source_successor
not_all_source_edges_increase_in_fixed_cut
no_strict_descent_around_cycle
exact_local_rank_cycle_no_global_descent
```

The last theorem packages strict convexity, all three exact bisector
equalities, all three local opposite-rank statements, and the fact that no
map `Fin 3 -> Nat` strictly decreases around every directed edge.

This is not a counterexample to the full parent or to the card-fourteen
producer: it does not carry global K4 or a total critical system. It is a
decisive counterexample to the proposed *consumer step* from local
equal-radius/cap-order data to a cycle-wide descent.

## Common-deletion recursion regression

The existing exact 24-vertex finite model was replayed. Its digest remains:

```text
f586212ef23e3575234e613ba764cc6481f13ba0d387008a89ef8378e5a2986b
```

Within its explicitly non-Euclidean symmetric distance-equality abstraction,
it retains global K4, a total deletion-critical blocker map, common-deletion
packets at every source, and the genuine successor cycle

```text
1 -> 4 -> 8 -> 1.
```

This independently rules out geometry-free termination of
`CommonDeletionSuccessorCycle`. The rational cap model rules out adding only
local opposite-rank geometry. A positive theorem must consume a coupling
absent from both regressions.

## Smallest honest next interface

A ranked common-deletion continuation needs one cycle-wide history object,
not independent local `EqualRadiusOppositeRankData` values. At minimum it
must retain:

1. one fixed `CGN.OrderedCap` and one fixed linear cut/oriented endpoint for
   every continuation step;
2. an exact identification of the next deleted source with the current
   generated/reroute source;
3. a concrete current interval or natural-valued measure;
4. a proof that every nonterminal re-entry stays inside that same interval
   and strictly shrinks it; and
5. a terminal consumer for the outside-cap/other-row-omitted arm.

Equivalently, a three-step closure could construct an existing
`StrictLapPacket`, but then the producer must visibly supply its no-wrap
return inequality. The local between theorem supplies only the first two
linear pushes and permits the third edge to cross the cut.

For the current card-fourteen packet there is an even earlier prerequisite:
either align its arbitrary centers with `p,S.oppApex2`, or develop a consumer
uniform in arbitrary actual blockers. Until that alignment/uniform consumer
exists, postmix descent is not reachable from this producer.

## Bank and corpus preflight

Before this audit, the required registries were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered common-deletion actual
blockers, same-cap source/blocker edges, `SameCapIncompatibleEdge`,
`RankInterval`, `StrictLapPacket`, critical-shell cap membership, and the
history-retaining postmix split.

The closest banked consumers remain downstream:

- `outsidePair_unique_capCenter` requires a common outside pair;
- `SameCapIncompatibleEdge` requires a spent endpoint-radius equality;
- `EqualRadiusOppositeRankData` gives only a local opposite-side statement;
- `rank_drop` requires strict inclusion of concrete rank intervals; and
- `strictLapPacket_nonreturn` requires the complete no-wrap lap packet.

No banked theorem produces the missing physical alignment, common pair,
endpoint spending, interval inclusion, or no-wrap return inequality from the
current packet.

## Validation

The exact directed-cycle dependency and the new file were checked from
`lean/` with the repository-pinned Lean 4.27.0 toolchain, using temporary
oleans and the established direct single-file scratch exception:

```bash
lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-ranked-common-deletion-transition-oleans/\
DirectedCycleCountermodel.olean \
  ../scratch/atail-force/strict-oppcap-cross-classifier/\
directed-cycle-geometry/DirectedCycleCountermodel.lean

env LEAN_PATH=/private/tmp/p97-ranked-common-deletion-transition-oleans:... \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-ranked-common-deletion-transition-oleans/\
RankedCommonDeletionTransitionAudit.olean \
  ../scratch/atail-force/ranked-common-deletion-transition/\
RankedCommonDeletionTransitionAudit.lean
```

Both checks exited `0`. Every new printed declaration depends only on:

```text
propext
Classical.choice
Quot.sound
```

The finite common-deletion regression replayed with:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  scratch/atail-force/common-deletion-consumer/\
successor_cycle_countermodel.py
```

and returned `status: PASS` with the pinned digest above.

No full build, production wiring, source `sorry` closure, proof-blueprint
refresh, or publication gate was performed.
