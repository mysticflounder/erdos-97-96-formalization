# FreshThird lazy exact replay: theorem-bank audit

Date: 2026-08-07

## Replay verdict

The corrected source-faithful run was repeated exactly:

```text
uv run python scratch/p97-consumer-first/freshthird_lazy_metric.py \
  --source-faithful-slots --timeout-ms 120000 --core-timeout-ms 10000
```

It returned an exact QF-LRA `unsat` verdict after two lazy iterations:

```text
result=unsat status=unsat iterations=2
runtime_seconds=1.237 total_runtime_seconds=11.973
base_assertions=8349 active_kalmanson=18156/29900
violated_per_iteration=18156
core_result=unknown raw_core_size=0 core_runtime_seconds=10.736
```

The main verdict is an exhaustive finite separation of this frozen structural
model.  The raw tracked-core diagnostic timed out and supplied no core.  This
is solver evidence for the fixed replay, not a Lean theorem or a universal
FreshThird closure.

## Required bank/search pass

The mandated semantic search was attempted first with
`nthdegree docs search --lean --agentic` over the explicit
`erdos-97-96-formalization-lean` corpus (the agentic backend hit its current
usage limit); the plain semantic search then returned the expected current
candidate `freshThird_canonicalDifferentCap_fivePointKalmansonOrder`.

The required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

None contains a `FreshThird`, `lazy`, or `ConvexFivePointCore` declaration.
The sibling RVOL census has many general-n U5/U1 consumers, but no matching
FreshThird packet or import-reachable adapter.  The general-n census explicitly
warns that its candidates are local-uniform shapes, not hidden all-`n`
closers.  Therefore this replay found no existing theorem-bank consumer for
the exact 25-representative/18,156-active-Kalmanson family.

## Current Lean consumers versus producers

The strongest direct cardinality-free metric consumer is
`Problem97.CapCrossingKalmansonBridge.false_of_freshThird_four_order_arms`
([`CapCrossingKalmanson.lean:571`](../../lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean:571)).
It consumes a convex carrier, an injective/image/CCW boundary, and one of four
source-faithful linear order packets, each carrying two equal-distance
bisector equations.  It is complete as a consumer, but it does not produce
those order/equality hypotheses.

`TwoSourceFreshThirdFiber.false_of_freshThird_orderSelectedEndpointDeletionObstructions`
([`TwoSourceFreshThirdFiber.lean:653`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:653))
is a wrapper/adapter: it extracts one of the four arms from four named endpoint
deletion obstructions and invokes the consumer.  The normalized FreshThird
residual still has to produce those obstructions; this wrapper is not a new
source of them.

The second exact-rational consumer is
`false_of_seven_ccw_three_chained_bisectors`
([`CapCrossingKalmanson.lean:631`](../../lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean:631)).
It consumes seven ordered indices, three equal-distance equations, and the
four strict Kalmanson inequalities corresponding to the documented chained
core.  No current FreshThird residual theorem constructs this seven-point
packet.

`freshThird_canonicalDifferentCap_fivePointKalmansonOrder`
([`TwoSourceCanonicalSurface.lean:1830`](../../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean:1830))
is a genuine source producer for the exceptional canonical-different-cap
branch, but it produces only the five-point order (and endpoint naming), not
the deletion-row equalities required by either terminal consumer.

The generic `ConvexFivePointCore.false_of_core_of_common_orientation`
([`ConvexFivePointCore.lean:194`](../../lean/Erdos9796Proof/P97/Census554/ConvexFivePointCore.lean:194)) and
`GeneralCarrierBridge.false_of_metricCoreAlternative`
([`GeneralCarrierBridge.lean:282`](../../lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean:282)) are complete consumers only after a `Core`/`Realizes` object and signed-area orientation are supplied.  No FreshThird file currently constructs that adapter.

## Missing producer and next core to mine

The first missing source-level bridge is:

```text
normalized FreshThird packet
  -> source-faithful four endpoint-deletion obstructions
  -> one of the four order/equality arms
  -> false_of_freshThird_four_order_arms
```

For a smaller metric-core mining target, prioritize the equality-only
seven-point chain already named in `CapCrossingKalmanson.lean:625-631`:

```text
three shell/blocker equalities
  + four specific chained Kalmanson inequalities
  -> false_of_seven_ccw_three_chained_bisectors
```

The producer work should expose physical carrier aliases for the three
anonymous exact-shell slots, derive the three named equalities from
`known_row_equal_radius`/`blocker_slot_shell` data, and prove the required
strict index chain.  Only after that adapter exists should the 18,156 active
Kalmanson assertions be reduced to this named seven-point family.  Broad raw
core extraction is currently unproductive (10-second timeout); mine the
source-produced shell/equality families plus the four chain inequalities, not
the full 29,900-record Kalmanson bank.

No Lean files were edited and no build or axiom audit was run.
