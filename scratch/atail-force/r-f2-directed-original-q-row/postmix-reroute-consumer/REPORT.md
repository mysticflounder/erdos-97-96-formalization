# Postmix reroute consumer audit

Date: 2026-07-16

Status: **THE REROUTES ARE NOT DIRECTLY FALSE.  THEIR STRONGEST CURRENT
SOURCE-FAITHFUL CONSEQUENCE IS A TWO-ARM TERMINAL-FILTERED CAP-RANK OUTCOME,
KERNEL CHECKED.  A WELL-FOUNDED CONTINUATION STILL NEEDS A CROSS-STEP
ORDERED-CAP HISTORY INVARIANT.**

This lane owns only:

```text
scratch/atail-force/r-f2-directed-original-q-row/postmix-reroute-consumer/
```

No production Lean, shared document, proof-blueprint state, reduced-frontier
integration, protected file, or sibling scratch lane was changed.

## Exact current consumer graph

The live graph is smaller than the number of packet declarations suggests.

- `SecondApexConstructorReduction.rerouteAtX/rerouteAtY` are produced inside
  `SecondApexConstructorSplit.lean`.
- `MixedSecondApexEliminator.lean` eliminates the other two constructor arms
  and returns `SecondApexRerouteReduction`.
- `SecondApexPostmixWiring.lean` consumes that reduction and projects its
  reroutes into `PostmixSourceSplit.rerouteAtX/rerouteAtY`.
- The conversion theorems
  `NonApexOutsideMiddleRerouteAtX.toOutsideMiddleSuccessor` and
  `NonApexOutsideMiddleRerouteAtY.toOutsideMiddleSuccessor` construct the
  already-defined `OriginalQOutsideMiddleSuccessor`.  They have no callers
  outside their declaring file.
- The only downstream holder of `PostmixSourceSplit` is the q-deleted arm of
  `ReducedGeneratedSuccessorFrontier` in
  `reduced-frontier-integration/ReducedFrontierIntegration.lean`.
- `ReducedGeneratedSuccessorFrontier` and its existence theorem still have no
  Lean consumer outside their declaring file.

The existing `successor-sink-audit/REPORT.md` remains correct about a bare
`OriginalQOutsideMiddleSuccessor`: its source lies outside the old physical
middle row, so it has the opposite polarity from
`OffLiveCommonDeletionSuccessor`; generic aligned-R reclassification can
revisit unresolved F2 arms and is not a sink.

## The projection loss in `PostmixSourceSplit`

The reroute is produced only in the old
`ReducedSourceSplit.equalSource_atSecondApex` branch.  Before the reroute is
constructed, that branch has three facts:

```text
Q.at_x.source = Q.at_y.source
Q.generated.toTwoContinuationRows.EquilateralResidual
Q.at_x.source = S.oppApex2
```

`PostmixSourceSplit.rerouteAtX/rerouteAtY` retains only the raw reroute.  It
therefore forgets that the physical second apex is a common point of both
generated rows and that the equilateral residual puts the opposite named
center in each raw generated support.

`HistoryRetainingRerouteAtX`, `HistoryRetainingRerouteAtY`, and
`HistoryRetainingPostmixSourceSplit` preserve these fields.
`historyRetainingPostmixSourceSplit` is constructed directly from the
unprojected `ReducedSourceSplit`; it does not attempt to recover lost facts
from an arbitrary `PostmixSourceSplit` value.

This is the appropriate replacement interface if the reroute arms are wired
farther into the parent proof.  The old split is too weak for the strongest
available consumer.

## Required theorem-bank preflight

Before deriving the new outside-pair terminal, the following registries were
searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered a common second-apex
point at two ordered-cap centers and equal-radius points on opposite sides of
one cap center.  The relevant current-bank results are exactly the existing
local theorems:

```text
CapSelectedRowCounting.outsidePair_unique_capCenter
false_of_two_strictOppCap2_rows_common_outside_pair
CGN.oneSidedDistanceInjective_of_mecCapPacket
```

The sibling `p97-rvol` pushout bank contains ranked endpoint machinery such
as `source_pushout_left/right` and `ConsecutiveOppositeEndpointEdges`, but its
hypotheses require a `SameCapIncompatibleEdge`, a fixed endpoint orientation,
and a `MinorCapChainModel`.  The postmix reroute does not supply that packet,
and no import-reachable adapter identifies the next continuation with such an
edge.  Importing those declarations would not close the antecedent gap.

No new finite-pattern or solver certificate was needed.

## Kernel-checked direct sinks

For an `x`-reroute, suppose its fresh source is outside `S.oppCap2` and also
belongs to the full generated row at `y`.  Then the two distinct strict-cap
centers `x,y` have the common outside pair

```text
S.oppApex2, reroute.source.
```

The first point is common because the retained predecessor sources agree at
the second apex.  The second point is in the `x` row by the reroute field and
in the `y` row by the explicit premise.  The existing ordered-cap uniqueness
theorem gives `False`.

This is checked as:

```lean
false_of_rerouteAtX_sourceOutside_mem_otherRow
false_of_rerouteAtY_sourceOutside_mem_otherRow
```

The explicit opposite-row membership is load-bearing.  It is not inferred
from deletion survival or selected-support omission.

## Strongest unconditional reroute outcome

After consuming those terminals, every history-retaining reroute has exactly
one of two outcomes.

For the `x` side:

```text
1. reroute.source notin S.oppCap2
   and reroute.source notin the full generated row at y; or

2. reroute.source in S.oppCap2
   and the ordered-cap indices satisfy
     source < x < y  or  y < x < source.
```

The symmetric statement holds on the `y` side.  These are represented by
`RerouteRankOutcomeAtX/Y` and constructed by
`HistoryRetainingRerouteAtX/Y.rankOutcome`.

The in-cap branch is stronger than a bare cap membership.  The equilateral
history gives the opposite named center in the raw generated support, so the
generated center is equidistant from that companion and the fresh reroute
source.  One-sided distance injectivity forces the two points to opposite
sides of the center in one checked ordered-cap presentation.

This is the strongest source-implied continuation currently present in the
graph.  It does not require an unsupported constructor assumption and does
not recurse through `alignedRCommonDeletionBranch`.

## Why this is not yet a well-founded continuation

`EqualRadiusOppositeRankData` proves a one-step order statement, not descent.
The current reroute and successor packets do not retain:

1. one fixed ordered-cap presentation across continuation steps;
2. a fixed left/right endpoint orientation;
3. a current rank or shrinking rank interval;
4. an identification of the next generated center with the current fresh
   source, or any other strict comparison between successive center indices;
5. a no-wrap/nonreturn theorem showing that reclassification preserves the
   same orientation and strictly shrinks the interval.

The missing load-bearing producer is therefore a cross-step history theorem,
not another origin tag.  A sufficient interface would retain a common
`CGN.OrderedCap`, an oriented endpoint, and a natural-valued measure, then
prove that every nonterminal outside-middle reroute re-enters with a strictly
smaller measure.  Merely adding a `generated` constructor to
`RCommonDeletionOrigin`, or calling `alignedRCommonDeletionBranch`, would be
unranked recursion and is not closure progress.

The outside-cap/other-row-omitted arm is also a genuine residual.  It needs a
source-faithful producer of the missing cross incidence, a different direct
geometric contradiction on the full parent surface, or a ranked transition
which explicitly consumes that omission.

## Countermodel boundary

- The ordinary cap geometry permits an in-cap point on the opposite side of
  a center from an equal-radius companion, so the rank constructor alone is
  not contradictory.
- Selected-row data also permits an outside point to be omitted by the
  opposite row; support omission has no metric converse.
- The existing finite periodic-successor regression rules out a
  geometry-free termination theorem, but it does not carry the full
  Euclidean/MEC parent surface or the history-retaining postmix packet.
- No current countermodel refutes a theorem which visibly supplies the five
  cross-step ordered-cap history fields above.

## Production-sorry impact

No production `sorry` is closed by this scratch result.

It does remove one false architectural choice: the postmix reroutes should
not be routed as bare `OriginalQOutsideMiddleSuccessor` values or recursively
reclassified without history.  Their exact next boundary is now the two-arm
terminal-filtered rank outcome above.  Closing either residual still has to
feed the full parent contradiction before K-A-PAIR or the LIVE-Q/C tree can
be deleted.

## Focused validation

The source-current file was checked with Lean 4.27.0 from `lean/`, using the
current scratch olean chain and emitting:

```text
/private/tmp/p97-r-f2-postmix-reroute-consumer-oleans/
  PostmixRerouteConsumer.olean
```

This is an unimported scratch module, so the established deliberate
single-file `lake env lean -R .. -M 16384` exception was used.  No full Lake
build was run.

All five printed theorem closures are exactly:

```text
propext
Classical.choice
Quot.sound
```

The Lean source contains no `sorry`, `admit`, declared axiom,
`native_decide`, `unsafe`, heartbeat override, or lint suppression.  The
single-file elaboration emitted no Lean warning.
