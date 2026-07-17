# Reduced generated-successor frontier integration

Status: source-clean focused scratch integration.

## Purpose

This lane combines two independently checked routing reductions without
introducing a new contradiction:

- `EqualSourceMetricTerminal.reducedSourceSplit` removes the impossible
  equal-source-at-live-center metric constructor and leaves four honest source
  cases;
- `QCriticalEndpointIntegration.qCritical_reducedCrossSinkNormalForm` handles
  the case in which both exact generated rows are q-critical and removes the
  actual-map deleted-blocker/apex-alignment endpoint.

## Exact frontier

`QDeletedConstructorWitness Q` records, with constructor equality, that the
exact generated row at `x` or at `y` is q-deleted.

`ReducedGeneratedSuccessorFrontier Q` has exactly two top-level arms:

1. `qDeleted`: at least one exact generated row is q-deleted, and the arm
   carries `ReducedSourceSplit Q`;
2. `qCritical`: both exact generated rows are q-critical, and the arm carries
   an oriented `LiveDeletedCrossSurvival` together with
   `ReducedCrossSinkNormalForm` at that survival.

The full-parent theorem

```lean
OriginalQOutsideMiddleParentContext.exists_generatedSuccessor_reducedFrontier
```

constructs a generated-successor pair and returns this exact frontier.

## Residuals

The q-deleted arm retains these four source cases:

- distinct successor sources;
- equal sources with survival after deleting `y`;
- equal sources with survival after deleting `x`;
- equal sources at the second apex with the equilateral metric residual.

The q-critical arm retains the three endpoint families encoded by
`ReducedCrossSinkNormalForm`:

- an escape source with one of two common-deletion two-center packets;
- an apex double-critical residual;
- a common-deletion two-center packet at the selected blocker center.

This file proves routing only.  It does not assert that any retained residual
is impossible.

## Theorem-bank preflight

The required registries and the indexed Lean corpora were searched before
writing this coordinator.  The hits were generic q-critical routers and the
existing incidence banks; no bank theorem states this combined
generated-successor frontier.  No new finite-pattern, incidence, or metric
contradiction is derived here: the file only case-splits exact constructors
and composes the two checked reductions above.

## Validation

The source-current file was checked with Lean 4.27.0 from `lean/`, using the
existing scratch olean directories and emitting:

```text
/private/tmp/p97-r-f2-reduced-frontier-integration-oleans/
  ReducedFrontierIntegration.olean
```

The focused command was the established scratch-file invocation
`lake env lean -R .. -M 16384`, with `LEAN_PATH` containing the current
equal-source-metric-terminal and q-critical-endpoint-integration artifacts.
No full build was run.

Both printed theorem closures are exactly:

```text
propext
Classical.choice
Quot.sound
```

The Lean source contains no `sorry`, `admit`, declared axiom,
`native_decide`, `unsafe`, heartbeat override, or lint suppression.  The
single-file elaboration emitted no Lean warning.
