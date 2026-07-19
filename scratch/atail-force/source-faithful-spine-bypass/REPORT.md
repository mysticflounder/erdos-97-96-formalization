# Source-faithful spine bypass import

Date: 2026-07-19

The source was copied from the `/opt/nfs/front-a-closure-canonical-20260719T073000Z/top`
snapshot into this checkout as
`Round134SourceFaithfulSpineBypass.lean`.

## Checked result

The copied file elaborates against the current production tree with
warnings-as-errors:

```text
lake env lean -M 16384 -DwarningAsError=true \
  -R /Users/adam/projects/math-projects/erdos-97-96-formalization/scratch \
  ../scratch/atail-force/source-faithful-spine-bypass/\
  Round134SourceFaithfulSpineBypass.lean
```

The two provenance congruences and the outer coordinator are source-clean
and have no `sorryAx`.  Their reported dependencies are
`propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`, and
`Quot.sound`; the two extra trust entries come from the already checked
aggregate consumer, not from this copied coordinator.

## What this imports

`SourceFaithfulLiveContext` reconstructs the five source rows and the extra
`f2` row from one concrete `CriticalShellSystem`.  The coordinator then
compresses the eight current local residuals into one contract:

```text
SourceFaithfulAggregateProducer :=
  ∀ C, U1LargeCapRouteBTailMetricResidualTarget (p := C.p) C.rows
```

If that single aggregate producer is proved, the copied theorem closes the
outer Route-B leaf without entering the eight local declarations.

## Boundary

This import does **not** prove the aggregate producer and therefore closes no
production `sorry` by itself.  It is the correct source-faithful predecessor
for the remaining work; the next producer must prove the metric residual for
the reconstructed rows, or replace this contract with the direct parent
`False` theorem while retaining the same critical-map provenance.

## Snapshot audit

The later snapshots under `/opt/nfs` were also searched, including the
2026-07-19 canonical and incomplete checkpoints.  They add the exact-card-14
cap-block normalization and several bounded consumers, but no source-clean
theorem proving either the full-`L` first-apex co-radial occurrence or
`false_of_largeOppositeCapsBiApexRobust`.  The current production
`ParentExactFiveAssembler` remains byte-for-byte aligned with the newest
production snapshot: its only open input is still the aggregate occurrence
or the arbitrary mutual-omission consumer.  Accordingly, no snapshot source
was imported as if it were a terminal proof.

## Imported occurrence normal form

The companion `DistanceDifferenceInvariant.lean` is copied from the Round-98
snapshot and compiles against current production with warnings-as-errors.  It
proves, with core axioms only, that the missing first-apex equality is exactly

```text
<S.oppApex1 - transitionReverseRowCenter T q, b - a> = 0
```

for one actual reverse outside pair.  It also proves equivalence between the
orthogonality existential and the production co-radial occurrence.  This does
not close a sorry; it removes the metric ambiguity from the next producer and
makes clear that the remaining theorem must force one zero across the full
transition, not merely classify a row.

## Imported critical-target coverage bridge

`CriticalTargetCoverage.lean` is the source-clean Round-159 bridge copied from
the newer snapshot and compiled against current production.  It gives a
uniform faithful carrier pattern in which every carrier label occurs in a
selected four-row owned by a distinct actual blocker.  The declarations use
only `propext`, `Classical.choice`, and `Quot.sound`.

This is a genuine global input for a future occurrence producer, but it is
not yet wired to `FullParentExactFiveAllReverseData`: the remaining coupling
must still identify the relevant faithful row with the source-faithful
critical rows (or prove a contradiction from the coverage pattern).

## Newer scratch snapshot audit (2026-07-19)

The later `/Users/adam/scratch` history was checked in addition to the
`/opt/nfs` checkpoints:

* rounds 234--235 (`full_occurrence_probe`) and 237--249 (shell-overlap,
  metric-cone, and Kalmanson-cycle probes) all report `UNKNOWN` after a
  bounded SAT continuation; their scope is explicitly the fixed exact-card-14
  row-table gate;
* the round-249 generic cycle files are source-clean finite Kalmanson
  consumers, but their statements are `OrderedRowKalmansonPacket 14` schemas,
  not producers from `FullParentExactFiveAllReverseData`;
* the saved round-249 survivor analysis still contains SAT row tables and
  marks the result as having no Euclidean-realization or closure claim;
* `/opt/nfs/.../Round171LiveSparseThreeRowOccurrence.lean` proves that the
  current three-row sparse projection can avoid the existing six-point
  Kalmanson terminal words, and `/opt/nfs/.../Round147DualUnusedCommonCycleSource.lean`
  supplies only a higher-cap dual-unused residual.  Neither file proves the
  full-`L` first-apex occurrence or a direct parent contradiction.

These results rule out treating the exact-six CEGAR bank as a uniform
`card ≥ 14` producer.  The next source-faithful target remains the same
single contract: from the complete `F₀/R/B/L` parent and the common critical
map, produce either `FirstApexCoRadialTransitionReversePairOccurrence` or
`False`.  Any future finite certificate must first provide a checked bridge
from the live parent packet to its row-table schema.
