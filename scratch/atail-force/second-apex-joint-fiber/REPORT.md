# Second-apex joint-fiber audit

Status: **kernel-checked normal form plus exact fixed-shadow discovery; K-A-PAIR
remains open.**

## Result

The direct second-apex equality target is already an exact geometric terminal.
`JointFiberNormalForm.lean` proves:

1. on every off-surplus fixed first-apex radius fiber, distance to the second
   apex is injective;
2. the distinct strict pair selected by the first-apex row therefore has
   unequal second-apex distances; and
3. those distances consequently satisfy one of the two strict orders.

The key declaration is
`secondApex_distance_injective_on_firstApex_offSurplus_fiber`.  Its two
consumer-facing specializations are
`firstApex_strict_pair_secondApex_distance_ne` and
`firstApex_strict_pair_secondApex_distance_lt_or_gt`.

This is a **normal form, not closure**.  It packages the contradiction obtained
*if* a producer supplies equal second-apex distances, or if another argument
contradicts the forced strict orientation.  It does not produce either fact.

## Pinned fixed-shadow calculation

The input is
`biapex-continuation-shadow-audit/selected_row_own_cap_bound_refresh_1m_retry_checkpoint.json`,
SHA-256
`ad2400da59782d38d0952a9c31ae448bd30f86a110239bcca4687b538bc09fe9`.
It contains 11 SAT finite-incidence shadows and 12 node-capped indeterminate
shards from one fixed-label card-12 `(5,5,5)` placement.

The source file is synchronized against the proved cap bounds and only the
refresh driver's **older matcher subset**.  It cannot be called synchronized
against the current complete producer bank.

The broader current all-family scan is pinned by:

- `census/atail_force/producer_bank.py`:
  `b6cf53f6950231e39d9f2fa8ea855587d17445b6630a7ed8d825b4caaf70f2a0`;
- `census/global_confinement/metric_realizability_probe.py`:
  `f7a92776f9cee02eda2265467d77a0bbd5254d1dd335bc7a70713203239d3373`;
  and
- `scratch/atail-force/common_system_metric_probe.py`:
  `18b1a91a3326b975c8baa16f82e7c692fafd5b979450bb305d4c31895cde1334`.

That scan finds 10 named formalized-bank matches in five shadows:

- shard 10: `equality-convex-seven-point-split-bridge-order`,
  `equality-convex-seven-point-split-bridge-tail-order`, and
  `equality-convex-six-point-circle-chain-wrap-order`;
- shard 12: the same three families;
- shard 13:
  `equality-convex-seven-point-split-bridge-tail-order-reverse`;
- shard 15: `equality-convex-seven-point-split-bridge-order-reverse` and
  `equality-convex-seven-point-split-bridge-order`; and
- shard 21: `equality-convex-seven-point-split-bridge-order`.

Thus the current-bank-dirty shard IDs are `10, 12, 13, 15, 21`.  The six
current-bank-clean IDs are `0, 1, 2, 3, 16, 20`.

Across all 13 strict first-apex pairs in the 11 saved shadows, transitive
closure of the selected-row equalities derives the requested second-apex
equality **zero** times.  The direct equality producer is therefore not an
incidence-closure consequence of these witnesses.

On the other hand, every complete 12-row system (36 squared-distance
equalities after the normalized gauge `point 0 = (0,0)`,
`point 1 = (1,0)`) generates the unit ideal over `QQ` in all three exact
checks:

- Singular;
- msolve in forward variable order; and
- msolve in reverse variable order.

The verdict is `UNIT/UNIT/UNIT` for all 11 systems, including all six that
remain clean under the current complete producer-bank scan.  Therefore the
first missing field in the surviving finite abstraction is already **joint
polynomial metric realizability of the global selected rows**.  Convexity,
MEC, and critical-shell coherence are not needed to reject these six concrete
assignments.

This does not yet give the live theorem.  What remains is a uniform extractor:
from arbitrary-cardinality global K4 continuation data, select a bounded
formalized row obstruction (or a certificate-replayable polynomial core).
The fixed card-12 calculation supplies neither that coverage theorem nor a
Lean/Nullstellensatz certificate.

The generated checkpoint is `checkpoint.json`, SHA-256
`db3570b41ed944af37b8316847d3a5e2a2091808e202bf5b2b71d4b516c90203`.
The driver is `analyze.py`, SHA-256
`a52fc95c19f17f8ed39a3a9c91d0a67bc785e19927132d6df582624812ca685c`.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/second-apex-joint-fiber/analyze.py --workers 4
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/second-apex-joint-fiber/analyze.py --workers 4 --check
```

For each subset the driver serializes expanded polynomials over `QQ`, then
executes `Singular -q` with the generated script on standard input and
`msolve -f <input> -o <output> -t 1` in both declared variable orders.  Each
solver call has a six-second fail-closed timeout.  The stored checkpoint was
regenerated and then replayed with `--check` successfully.

The scratch Lean validation was run from `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/second-apex-joint-fiber/JointFiberNormalForm.lean
```

It exited successfully.  `#print axioms` reports exactly
`propext`, `Classical.choice`, and `Quot.sound` for all three declarations;
there is no `sorryAx` or unapproved proof axiom.  The Lean file SHA-256 is
`57e70a1b4f2bf7725c99db3bd22d6378838497cf982335514b97d75d592d4667`.

## Rigor boundary

- **Proved:** the joint-fiber injectivity, unequal-distance specialization,
  and strict-order normal form in Lean.
- **Exact-CAS verified within the pinned abstraction:** all 11 complete row
  ideals are unit, and all six current-bank-clean ones are unit in three
  independent exact runs.
- **Not independently certified:** the CAS unit-ideal outputs have not been
  replayed from a Nullstellensatz certificate in Lean.
- **Not proved:** fixed-cardinality exhaustion, arbitrary-cardinality
  extraction, the desired equality producer, or K-A-PAIR closure.
- `INDETERMINATE` remains fail-closed for the 12 node-capped source shards.

Compact-core/MARCO enumeration is intentionally left to the separately owned
fresh-continuation lane; this audit does not duplicate it.
