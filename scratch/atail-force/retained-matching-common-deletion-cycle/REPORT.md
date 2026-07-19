# Retained matching common-deletion cycle normal form

Date: 2026-07-17

Status: **KERNEL-CHECKED SOURCE-TAGGED NORMAL FORM; ALL THREE MATCHING
OUTCOMES CONSUMED; NO DIRECT `False`.**

## Result

The production normalization
`exists_commonDeletionPacket_of_largeCapConsumerOutcome` is correct but
forgets the information needed by a terminal consumer: which actual blocker
is the second center and which source-exact omission produced the packet.

`RetainedMatchingCommonDeletionCycle.lean` retains that information. Every
constructor of `RetainedMatchingLargeCapConsumerOutcome` now produces one
two-edge walk

```text
first -> second -> next
```

with all of the following checked fields:

- `first` and `second` are the two original retained-radius strict-first-cap
  sources;
- deleting `second` preserves K4 at the first apex and at
  `blocker(first)`;
- deleting `next` preserves K4 at the first apex and at
  `blocker(second)`;
- equivalently, `second` is omitted from the exact critical shell sourced at
  `first`, and `next` is omitted from the shell sourced at `second`;
- consecutive actual blockers are distinct; and
- `next` is either `first` itself, a fresh strict-first-cap point, or a fresh
  strict-second-cap point.

The second-cap case uses the now-production theorem
`exists_fresh_secondCap_commonDeletion_of_reverseHit`; it is not a separate
Kalmanson residual.

The consolidated theorem is:

```lean
nonempty_matchingCommonDeletionCycleNormalForm
  (G : RetainedMatchingGeometricReduction R) :
  Nonempty (RetainedMatchingCommonDeletionCycleNormalForm R)
```

It gives one exact endpoint trichotomy.

1. **`sourceReturn`.** `next = first`, so the two stored packets form a
   source-exact mutual-omission two-cycle.
2. **`endpointCriticalFiber`.** `next != first` but the endpoint actual
   blockers agree. The file reconstructs an origin-tagged
   `FrontierCommonDeletionCriticalFiber R` on `first,next`. Because `first`
   remains on the retained first-apex radius, the fiber also carries a
   checked `RowHit`.
3. **`threeDistinctBlockers`.** The three actual blockers of
   `first,second,next` are pairwise distinct, and the two source-exact
   omission/common-deletion edges remain attached to them.

This is stronger than projecting the branch to one anonymous
`CommonDeletionTwoCenterPacket`: it preserves the two consecutive critical
map transitions and exposes exactly where blocker recurrence occurs.

## What closes and what remains

No production `sorry` closes from this normal form alone.

- The source-return arm is a real two-cycle, not an immediate contradiction.
  It needs a full-geometric nonreturn theorem using a common boundary cut,
  cap/MEC roles, cumulative deletion, or another parent-global invariant.
- The endpoint-collision arm is now back on the critical-fiber route with a
  first-apex row hit. It is slightly more general than
  `RetainedRadiusCollision`: only the first endpoint is guaranteed to lie on
  the retained radius. The smallest existing-consumer-facing extension is a
  one-retained-source version of the production different-pair cross-hit
  consumer, followed by its live cyclic-order classification.
- The three-distinct-blocker arm is the unique genuinely new matching
  residual. Its missing producer is a source-indexed cross incidence or
  fixed-cut order fact coupling one of the two omission edges to an existing
  Kalmanson/strict-lap terminal. Marginal packet expansion is not enough.

Thus the matching branch should no longer be tracked as three unrelated cap
cases or as a generic common-deletion packet. Its exact terminal research
surface is:

```text
source-exact two-cycle
or origin-tagged critical fiber with RowHit
or two-edge path with three pairwise-distinct blockers.
```

### Narrowest next promotion

The `endpointCriticalFiber` arm is the narrowest and most likely next
production promotion. It already carries the exact critical fiber and the
`RowHit` which `RetainedCollisionDifferentPairConsumer` obtains indirectly
from the stronger `RetainedRadiusCollision` interface. The different-pair
Kalmanson proof itself uses the fiber, the first-apex row hit, one fresh row
point, one actual cross hit, and boundary order; it does not use retained-
radius membership of both fiber sources after that prefix.

The smallest next change is therefore to factor that production consumer
over

```text
FrontierCommonDeletionCriticalFiber + RowHit
```

and feed this endpoint arm to it. That does not yet prove `False`: the actual
cross hit and one of the two closing cyclic orders remain genuine producers.
But it unifies the collision and matching branches at their first common
consumer boundary without strengthening the matching endpoint to the false
claim that its fresh source lies on the retained radius.

## Regression gates

Two existing exact regressions were replayed.

1. `common-deletion-consumer/successor_cycle_countermodel.py` passed with
   digest

   ```text
   f586212ef23e3575234e613ba764cc6481f13ba0d387008a89ef8378e5a2986b
   ```

   and successor cycle `1 -> 4 -> 8 -> 1`.

2. `paired-common-deletion-nonreturn-audit/exact_five_paired_cycle_model.py`
   passed with digest

   ```text
   db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa
   ```

   and paired two-cycle `1 -> 2 -> 1`.

The first is exact inside its finite symmetric distance-equality/global-K4/
total-critical-shell abstraction. The second is an exact rational finite
metric with exact-five and paired source provenance. Neither is a Euclidean
convex/MEC realization. They reject a geometry-free cycle-termination claim,
not a theorem which visibly consumes the omitted parent geometry.

## Theorem-bank preflight

Before deriving the normal form, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean searches for common-deletion cycles, three consecutive actual
  blockers, endpoint blocker collisions, strict-cap omission paths, and
  blocker-swapped two-cycles.

The closest checked consumers are the production retained-collision
different-pair Kalmanson terminals and the exact-five physical omission-cycle
theorems. The former still needs one source-valid cross hit plus a compatible
cyclic order; the latter needs every cycle source in one exact-five physical
class. No banked theorem consumes only the two-step walk proved here.

## Validation

The production normalization dependency was built with the required wrapper:

```bash
lake-build \
  Erdos9796Proof.P97.ATail.RetainedMatchingCommonDeletionNormalization
```

The scratch file was then checked by the repository's direct single-file
scratch exception from `lean/`:

```bash
lake env lean -s 65536 \
  ../scratch/atail-force/retained-matching-common-deletion-cycle/\
RetainedMatchingCommonDeletionCycle.lean
```

The check exited zero. The five explicit axiom queries report exactly:

```text
propext, Classical.choice, Quot.sound
```

The file contains no `sorry`, `admit`, declaration-level `axiom`,
`native_decide`, or `unsafe` declaration.

The regression commands were:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/common-deletion-consumer/\
successor_cycle_countermodel.py

UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/paired-common-deletion-nonreturn-audit/\
exact_five_paired_cycle_model.py
```

Both exited zero with `status: PASS` and the pinned digests above.
