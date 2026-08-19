# FreshThird producer wave report — 2026-08-19

## Scope

This wave used the current source-complete FreshThird exact-three carrier
encoder and the current phase-ingress build receipt.  It is discovery data
only: no result below is a universal theorem, a Lean closure, or a promoted
UNSAT certificate.

Primary artifacts:

- `scratch/runs/freshthird-source-complete-static-v4/canary-20260819-0001/`
- `scratch/runs/freshthird-producer-wave-20260818/wave-0001/mine.json`
- `scratch/runs/freshthird-producer-wave-20260819/wave-0002/report.json`
- `scratch/runs/freshthird-producer-wave-20260819/wave-0003/report.json`
- `scratch/runs/freshthird-producer-wave-20260819/wave-0004/report.json`

## Results

The source-complete static wave returned `SAT_ABSTRACTION` in all four
boundary-index cells.  The runner validated every complete DIMACS assignment
and accepted every assignment through its independent source-total replay.
The standalone v1 miner was run with replay disabled because its historical
constraint-group contract does not accept the v4 source-complete result; this
does not replace the runner's recorded model validation and replay.

The first model in every cell had the same focal pattern, but that pattern was
not stable.  A second model was enumerated by blocking the complete first
Boolean assignment in each cell.  All four second models were SAT, passed the
source-complete clause validator, had a different signature from the first
model, and were accepted by sequential fresh-session source replay.

Across the eight replayed models:

- boundary source in the pinned fan: `false` in all eight;
- Q-row/fan overlap: `0` or `1`;
- Q-fiber sources in the pinned fan: `0` or `1`;
- Q-row/boundary-blocker-row overlap: `1` in all eight;
- boundary-blocker center aliases pinned center: `false` in all eight;
- second-order blocker-center aliases: `0` in all eight.

The stable Q-row/boundary-blocker overlap is the named boundary source already
supplied by the source packet: the Q row and that source's own blocker row
share the boundary source, while distinct-center row geometry bounds the
intersection by one.  It is therefore not a new producer.

## Synchronization probe

Two additional bounded probes were run against the source-complete CNF.
Forcing boundary-source/fan incidence was SAT in all four cells.  Adding the
full positive synchronization premise—boundary source in the fan and two
distinct Q-fiber sources in the fan—was UNSAT in all four cells.  The latter
probe used selectorized pair choices and is a clause-level discovery result;
it has no DRAT certificate or universal lift.

This rules out the current positive synchronization premise as a producer
route inside the present finite source theory.  It does not close the
consumer theorem: the existing Lean consumer already proves contradiction if
that premise is supplied.

## Routing decision

No source-valid new producer was obtained, and no load-bearing `sorry` was
closed or reduced.  Further same-cap or repeated positive-synchronization
waves are not justified.  A source audit after the wave found that the
common-radius G–Q interaction bridge is already present and builds:
`freshThird_commonRadius_qReducedIngress` supplies the reduced source packet,
and `FirstNonHitCommonRadiusReducedFinitePayload.ofSource` packages it into
the independent finite payload.  The next exact Lean-facing target is
therefore the universal impossibility contract for that payload, not another
G–Q bridge:

`FirstNonHitCommonRadiusFinitePayloadImpossible`.

Its finite producer must still expose one of the following source-level
obstructions to an existing consumer:

1. a named-endpoint one-sided omission transfer;
2. a distinct-cap third-incidence configuration; or
3. a cyclic-order/Kalmanson configuration.

The current source adapters were built successfully in focused Lean builds.
A finite signature, a bounded UNSAT result, or the anonymous escape producer
alone is insufficient for promotion.
