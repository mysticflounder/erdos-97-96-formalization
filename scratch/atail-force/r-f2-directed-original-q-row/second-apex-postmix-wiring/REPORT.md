# Second-apex post-mixed-residual wiring

Date: 2026-07-16

Status: **SOURCE-CLEAN POST-MIX SOURCE SPLIT KERNEL CHECKED. THE OLD
`equalSource_atSecondApex` FRONTIER ARM IS REPLACED BY AN ACTUAL NON-APEX
REROUTE AT `x` OR `y`.**

This lane owns only:

```text
scratch/atail-force/r-f2-directed-original-q-row/
  second-apex-postmix-wiring/
```

No production Lean, shared document, proof-blueprint state, mixed-residual
metric proof, protected file, or sibling scratch lane was changed.

## Caller and consumer audit

An exhaustive source search over `lean/**/*.lean` and `scratch/**/*.lean`
found the following complete current use graph.

### `SecondApexConstructorReduction`

- It is declared in
  `second-apex-constructor-split/SecondApexConstructorSplit.lean`.
- `secondApexConstructorReduction` is its only original producer.
- `secondApexConstructorReduction_of_reducedSourceSplit` is an equality-based
  adapter from an explicitly identified
  `ReducedSourceSplit.equalSource_atSecondApex` value.
- Before the mixed eliminator landed, there was no Lean consumer of this
  reduction outside its declaring file.
- `mixed-second-apex-eliminator/MixedSecondApexEliminator.lean` is now its
  only mathematical consumer.  It eliminates the two mixed residuals and
  returns `SecondApexRerouteReduction`, whose only outputs are reroutes at
  `x` and `y`.

The equality-based adapter has no caller.  It is no longer needed by the
preferred wiring because ordinary case elimination on `ReducedSourceSplit`
exposes the three second-apex payload fields directly.

### `ReducedSourceSplit.equalSource_atSecondApex`

- `equal-source-metric-terminal/EqualSourceMetricTerminal.lean` declares the
  constructor and emits it only from the corresponding constructor of the
  older `OriginalQGeneratedSuccessorPair.SourceSplit`.
- `secondApexConstructorReduction_of_reducedSourceSplit` can consume an
  equality proof identifying that constructor, but has no caller.
- `reduced-frontier-integration/ReducedFrontierIntegration.lean` does not
  inspect it.  It carries the whole `ReducedSourceSplit` only in the
  `ReducedGeneratedSuccessorFrontier.qDeleted` arm.
- No Lean theorem currently consumes `ReducedGeneratedSuccessorFrontier` or
  its existence form.  It is the present scratch handoff boundary.

Thus there is no hidden downstream API to preserve.  The only current caller
that needs refinement is the q-deleted field of
`ReducedGeneratedSuccessorFrontier`.

## Kernel-checked integration theorem

`PostmixSourceSplit Q` has exactly five constructors:

1. distinct successor sources;
2. equal sources with cross survival at `x`;
3. equal sources with cross survival at `y`;
4. a source-faithful non-apex outside-middle reroute at `x`; or
5. the symmetric reroute at `y`.

There is no unresolved equal-source-at-second-apex constructor.

The thinnest caller adapter is:

```lean
postmixSourceSplit_of_reducedSourceSplit
    (Q : OriginalQGeneratedSuccessorPair K)
    (h : ReducedSourceSplit Q) :
    PostmixSourceSplit Q
```

It preserves the first three constructors verbatim.  On the old second-apex
constructor it calls the checked `secondApexRerouteReduction` and retains the
returned `NonApexOutsideMiddleRerouteAtX` or
`NonApexOutsideMiddleRerouteAtY` without weakening or repackaging it.

The source-clean convenience theorem

```lean
postmixSourceSplit (Q : OriginalQGeneratedSuccessorPair K) :
  PostmixSourceSplit Q
```

composes that adapter with `reducedSourceSplit Q`.

No theorem-bank search was needed for this file: it introduces no new finite,
incidence, metric, or geometric contradiction.  It only composes the already
checked mixed-residual eliminator with an existing inductive case split.

## Reroute output compatibility

The two checked conversion theorems

```lean
NonApexOutsideMiddleRerouteAtX.toOutsideMiddleSuccessor
NonApexOutsideMiddleRerouteAtY.toOutsideMiddleSuccessor
```

show that each retained reroute immediately constructs the same
`OriginalQOutsideMiddleSuccessor` type used by the generated-successor parent
lane.  The reroute record still retains the additional fact that its source
is different from `S.oppApex2`; that information is not lost by the new
source split.

## Implemented caller wiring

The audited caller update is now implemented in
`reduced-frontier-integration/ReducedFrontierIntegration.lean`:

1. In `ReducedGeneratedSuccessorFrontier.qDeleted`, replace
   `sourceSplit : ReducedSourceSplit Q` with
   `sourceSplit : PostmixSourceSplit Q`.
2. In
   `OriginalQOutsideMiddleParentContext.reducedGeneratedSuccessorFrontier`,
   the old

   ```lean
   have hsplit : ReducedSourceSplit Q := reducedSourceSplit Q
   ```

   is replaced by

   ```lean
   have hsplit : PostmixSourceSplit Q := postmixSourceSplit Q
   ```

3. The q-critical constructor pair, oriented cross survival, endpoint
   normal form, and the existence theorem remain unchanged.
4. The equality-based
   `secondApexConstructorReduction_of_reducedSourceSplit` adapter is now
   legacy-only because it has no compatibility caller.
   `SecondApexConstructorReduction` remains the internal exhaustive proof
   intermediate used by the metric eliminator.

The updated frontier fresh-elaborates with only `propext`,
`Classical.choice`, and `Quot.sound`.  Because it still has no downstream Lean
consumer, changing its q-deleted payload directly avoids another parallel
frontier wrapper without breaking a caller.

## Proof impact

This closes the **local second-apex mixed-constructor residual**: neither
mixed complementary-`{s,t}` packet survives, and the old
`equalSource_atSecondApex` arm no longer appears at the reduced frontier.

It does **not** close a production `sorry`.  The result is a reroute, not
`False`.  A final parent consumer must still handle the two reroute arms
without unranked recursion, together with the distinct-source and two
cross-survival arms.  The conversion theorems make the next object exact:
an `OriginalQOutsideMiddleSuccessor` with a source different from the prior
second-apex source.

## Focused validation

The source-current file was checked with Lean 4.27.0 from `lean/`, using the
current scratch olean chain and emitting:

```text
/private/tmp/p97-second-apex-postmix-wiring-oleans/
  SecondApexPostmixWiring.olean
```

This is an unimported scratch module, so the established deliberate
single-file `lake env lean -R .. -M 16384` exception was used.  No full Lake
build was run.

All four printed theorem closures are exactly:

```text
propext
Classical.choice
Quot.sound
```

The Lean source contains no `sorry`, `admit`, declared axiom,
`native_decide`, `unsafe`, heartbeat override, or lint suppression.  The
single-file elaboration emitted no Lean warning.
