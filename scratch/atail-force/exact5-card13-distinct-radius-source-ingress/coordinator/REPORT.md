# Distinct-source reduced-union ingress coordinator

Status: **complete source-fresh scratch closure of the exact-five,
exact-card-thirteen branch**.

This lane connects the current card-13 distinct-radius geometric packet to the
verified `BVLogicalExpr` reduced-union endpoint.  The unconditional scratch
theorem `false_of_exactFive_card13` is warning-as-error kernel checked and has
no `sorryAx`.  This remains a banked scratch theorem until a production module
imports and applies it; it is not yet a live-spine closure by itself.

## Current checked artifacts

- `ParentRowIngressAdapters.lean` retains both parent rows and proves the
  current parent-first coupling facts.
- `selected-exact/` contains 882 current-index exact packet projections
  selected by at least one orientation.  All 14 chunks and the aggregate
  module compile with `warningAsError`.
- `selected-rank/` contains 7,945 shared rank, selected-row, shell,
  parent-first, and Kalmanson producers.  All 125 chunks and the aggregate
  module compile with `warningAsError`.
- `selected-assignment/` contains the exact dense `BVExpr.Assignment` for the
  current 1,666-variable / 2,179-bit source table.  Its 27 lookup/eval chunks,
  aggregate module, and `SelectedSemanticAssignment.lean` compile with
  `warningAsError`.
- `generate_reduced_union_eval_bridge.py` proves, by original current source
  index, that every selected verified symbolic assertion evaluates to its
  exact packed Boolean source expression.  All 275 direct chunks (17,537
  assertions), all 282 mirror chunks (18,043 assertions), and both aggregate
  imports compile with `warningAsError`, including pseudo-Boolean rows.
- Both complete eval maps are regenerated against the final repo-relative
  publication roots under
  `exact5-card13-distinct-radius-cube-proof-combiner/generated-reduced-union-*`.
  Their pinned map hashes remain `73cd3c146f61287092517034a5b13c566f6ed3b5d4139916bf3da4705be140d0`
  (direct) and
  `d468374598e9f0bc4a68aa0271b59b0854ba46eb58d2497130cbd8bf750f72fa`
  (mirror).
- `generate_reduced_union_semantic_bridge.py` performs the final strict join
  between the eval map and the base/retained, exact-projection, and rank maps.
  It refuses missing producers, duplicate producers, expression drift, or
  expression-hash drift before emitting any final callback.  Each emitted
  semantic chunk imports only the producer chunks it actually uses, rather
  than the three complete producer aggregates.  All 275 direct chunks (17,537
  callbacks) and all 282 mirror chunks (18,043 callbacks) pass source-fresh
  Werror compilation.  Their aggregate contradictions pass as well.
- `ExactFiveCard13Closure.lean` contains the final typed join: the direct and
  mirror checked callbacks close the distinct-radius dispatcher, after which
  an exhaustive radius split combines that theorem with the already-closed
  same-radius branch.  Both
  `false_of_exactFive_card13_distinctRadius` and
  `false_of_exactFive_card13` pass Werror with exactly
  `[propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler,
  Quot.sound]`; neither reaches `sorryAx`.

The final source-fresh gate also rebuilt the complete same-radius prerequisite
chain: three raw verified certificates, three assignments, 342 split verified
bridges, three verified endpoints, 157 base-instance chunks, 84 rank-instance
chunks, 342 source-composition chunks, and the three final orbit closures.
That rebuild exposed and fixed import collisions caused by globally named
`main` runners in both the three all-one raw verifiers and the direct/mirror
reduced-union coordinators.  The runners are now namespaced; proof statements
and certificate terms are unchanged.  The coordinator generator emits the
namespaced form so regeneration preserves the fix.

The complete current source stream hashes are:

- direct: `a1014dbfbae06dda92263461cfaf50cd14d96a4a645b7569790504b5f1a5dab0`;
- mirror: `1d60fb308d08c1f3aa5f80ea6685d4440f741dfe0e60eec5f49bcdc804c6c663`.

The tracked checked-core bank is
`best-checked-cores.complete.json.gz`, SHA-256
`c620897150393c053e6c06e99ffd1a772b123748b14fd7a4ced3db0fcb88901e`.

## Important current-index correction

The old `DirectSourceBaseAssertions.h0000`--`h0144` numbering predates a
source-bank renumbering.  Only old `h0000` and `h0001` still match current
source indices `h0` and `h1`.  No other old positional declaration may be
reused by index.  The route generator therefore marks current `h2` onward as
requiring a current-source theorem unless another exact current-index packet
or rank/Kalmanson producer covers it.

## Final map contract

The eval generator accepts one direct or mirror reduced-union map only when
all of the following checks pass:

1. the caller supplies the exact map SHA-256;
2. schema, orientation, and source orbit agree;
3. the complete 58,433-assertion length-delimited fingerprint agrees;
4. all 1,666 variable names, indices, sorts, and widths agree;
5. every generated verified module agrees with the SHA-256 stored in the map;
6. selected original source indices are sorted, unique, and in range; and
7. the chunk count and every selected source expression agree with the live
   rebuilt source stream.

This contract is independent of reduced-union size.  A globally shrunk core
uses the same generator and Lean theorem shape as the full-union fallback.

The final generation commands are:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run \
  scratch/atail-force/exact5-card13-distinct-radius-source-ingress/coordinator/generate_reduced_union_eval_bridge.py \
  --orientation direct \
  --reduced-map <direct-root>/map.json \
  --reduced-map-sha256 <direct-map-sha256> \
  --verified-root <direct-root> \
  --output-dir scratch/atail-force/exact5-card13-distinct-radius-source-ingress/coordinator/selected-eval-direct

UV_CACHE_DIR=/tmp/uv-cache uv run \
  scratch/atail-force/exact5-card13-distinct-radius-source-ingress/coordinator/generate_reduced_union_eval_bridge.py \
  --orientation mirror \
  --reduced-map <mirror-root>/map.json \
  --reduced-map-sha256 <mirror-map-sha256> \
  --verified-root <mirror-root> \
  --output-dir scratch/atail-force/exact5-card13-distinct-radius-source-ingress/coordinator/selected-eval-mirror
```

## Remaining work

The scratch closure is complete.  Remaining work is architectural wiring:

1. publish/import the scratch theorem from a production predecessor of the
   live frontier theorem;
2. apply it on the exact-five, exact-card-thirteen branch; and
3. rerun the production target build and proof-blueprint axiom/spine gates.

Until that wiring lands, this artifact is a source-clean sibling bank rather
than an unconditional removal of a live production `sorry`.
