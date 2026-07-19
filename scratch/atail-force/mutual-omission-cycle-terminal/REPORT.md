# Mutual-omission cycle terminal audit

Date: 2026-07-17

Status: **KERNEL-CHECKED CAP-ORDER REDUCTION; DIRECT `False` IS NOT
PRODUCED.**

This lane owns only
`scratch/atail-force/mutual-omission-cycle-terminal/`. It does not edit
production Lean, generated files, closure documents, or protected lanes.

## Exact result

Starting with the complete production surface

```lean
R : FrontierCommonDeletionParentResidual F
P : RetainedInteriorBlockerCollision R
L : LocalizedCollisionCommonDeletion P
C : LocalizedCollisionMutualOmissionCycle P L
```

the checked theorem is

```lean
theorem nonempty_localizedCollisionCapOrderOutcome
    (P : RetainedInteriorBlockerCollision R)
    (L : LocalizedCollisionCommonDeletion P)
    (C : LocalizedCollisionMutualOmissionCycle P L) :
    Nonempty (LocalizedCollisionCapOrderOutcome P L C)
```

It gives an exhaustive split.

1. The actual blocker of `L.fresh` is outside the first opposite closed cap.
2. The actual blocker lies in that cap, and the complete collision and fresh
   critical supports produce two disjoint banks of unordered pairs outside
   the cap.

On the second arm the structure
`LocalizedCollisionOnCapOutsidePairSeparation` records:

- the collision support has exactly two outside-cap members, hence exactly
  one unordered outside pair;
- the fresh support has at least two outside-cap members, hence at least one
  unordered outside pair;
- the two pair banks are disjoint; and
- consequently their union contains at least two different pair incidences.

The last fact is separately kernel-checked as

```lean
LocalizedCollisionOnCapOutsidePairSeparation
  .two_le_outsidePairBank_union_card
```

## Proof force

The collision shell meets the first cap in exactly its two original sources,
so its outside complement has cardinality two. If the fresh blocker is in the
same cap, the ordered-cap one-sided distance theorem bounds the fresh critical
shell's cap intersection by two, leaving at least two points outside.

If the two rows used the same unordered outside pair, their distinct blocker
centers would both lie in one ordered cap and both bisect the same distinct
pair outside it. This is exactly the forbidden configuration consumed by

```lean
CapSelectedRowCounting.outsidePair_unique_capCenter
```

The proof uses `D.convex`, the full cap carrier/order supplied by
`capByIndex_cgn4g_capData`, the complete selected supports from the shared
`CriticalShellSystem`, and the cycle's source-faithful blocker inequality. It
does not replace those data with a finite selected-row abstraction.

## Exact remaining blocker

This does **not** prove

```lean
LocalizedCollisionMutualOmissionCycle P L -> False
```

The cap-order theorem has the opposite immediate conclusion from the hoped
same-pair collision: on the on-cap arm it proves that the two available
outside pairs are different. Neither pair-bank disjointness nor two distinct
outside pair incidences is contradictory for a balanced cap complement.

The two live residuals are now precise.

| Residual | Missing consumer |
|---|---|
| Fresh blocker outside the first cap | A parent-global localization or cross-cap equality tying that blocker to another cap row. |
| Fresh blocker inside the first cap | A coverage/capacity theorem forcing more pair incidences than the cap complement permits, or a source-valid strict Kalmanson cycle among the distinct pairs. |

`R.noM44` supplies no further force here: the localized collision already
makes the first cap have cardinality at least five. `R.minimal` is what makes
the retained total critical map available upstream, but its polarity does not
turn either individual deletion into global K4; each source still fails at
its own actual blocker. Therefore a direct minimality-only cycle closer would
repeat a route already rejected by the exact regressions.

The strongest honest recommendation is to promote this split only if the
parent assembler has an immediate consumer for one of those two exact
residuals. Do not state a generic mutual-omission-cycle contradiction.

## Theorem-bank preflight

Before deriving the reduction, the lane inspected:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean searches for mutual critical omissions, common-deletion
  two-cycles, cap-local outside pairs, source returns, and Kalmanson cycles.

The nearest reusable results were the production cap pair-counting and
outside-pair uniqueness theorems used above. No indexed or archived theorem
accepts the localized mutual-omission cycle alone or supplies either missing
consumer. The sibling `u1TwoLargeCapObstruction` remains a metric consumer
requiring seven named equalities; this packet does not produce those
equalities.

## Regression boundary

The two existing countermodel checks were replayed:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python \
  scratch/atail-force/common-deletion-consumer/\
successor_cycle_countermodel.py

UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python \
  scratch/atail-force/paired-common-deletion-nonreturn-audit/\
exact_five_paired_cycle_model.py
```

Both return `PASS` with pinned digests

```text
f586212ef23e3575234e613ba764cc6481f13ba0d387008a89ef8378e5a2986b
db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa
```

The first is exact only in its finite symmetric distance-equality/global-K4/
total-critical-shell abstraction. The second is an exact rational finite
metric with source-faithful exact-five and paired-common-deletion data.
Neither is a Euclidean convex/MEC realization. They refute a geometry-free
cycle closer; they do not refute the cap-order reduction proved here or a
future full-geometric consumer.

## Validation

The scratch file was checked from `lean/` with the repository's direct
single-file scratch exception:

```bash
lake env lean -s 65536 \
  ../scratch/atail-force/mutual-omission-cycle-terminal/\
MutualOmissionCycleTerminal.lean
```

It exits zero. Explicit axiom queries for the output structure, the two-pair
union theorem, and the exhaustive split report exactly:

```text
propext, Classical.choice, Quot.sound
```

The file contains no `sorry`, `admit`, declaration-level `axiom`,
`native_decide`, or `unsafe` declaration.
