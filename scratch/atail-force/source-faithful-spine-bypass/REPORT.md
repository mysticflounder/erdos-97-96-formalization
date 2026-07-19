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
