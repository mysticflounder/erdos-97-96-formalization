# Bi-apex continuation fixed-shadow refresh

Status: **EMPIRICALLY VERIFIED within one fixed finite-incidence
abstraction; no live producer theorem is proved.**

> **Broader-bank correction.** This report's refresh driver is synchronized
> against the proved cap cuts and an older matcher subset, not the current
> complete common-system producer bank.  A pinned broader scan in
> `../second-apex-joint-fiber/` finds 10 already-formalized matches in five of
> the 11 saved SAT shadows: dirty shards `10,12,13,15,21`; clean shards
> `0,1,2,3,16,20`.  Consequently the final file below is a cap-bound
> checkpoint with split 11 SAT / 12 indeterminate, not a final current-bank
> checkpoint.  The five rejected shards require regeneration before a new
> current-bank split can be stated.  See
> `../second-apex-joint-fiber/REPORT.md` and its pinned `checkpoint.json`.

## Superseded inputs and corrected pair

The source checkpoint is
`second_center_query/formalized_core_shards_after_current_bank_checkpoint.json`
at SHA-256
`5b661a15f4dda8a6cd143f3737457f2733d23eca056defcbcd30872f629bcc1a`.
Its 23 cases are disjoint domain shards of **one** fixed-label card-12
`(5,5,5)` placement, not 23 placements.

Two old inferences from that checkpoint are superseded:

1. all 23 stored survivors fail today's complete-bank freshness scan; and
2. the first strict pair is
   `row(1) ∩ strictInterior(O1)`, not `row(1) \ O2`.  The latter set can
   contain Moser endpoint `2` and is not the Lean symmetric pair.

The corrected audit enumerates every two-subset of
`row(1) ∩ strictInterior(O1)` and every two-subset of
`row(2) ∩ strictInterior(O2)`.  A lexicographically first grid is retained
only for display; every deficit and pattern claim ranges over all grids.

## Proved monotone cuts

The refresh adds only these source-proved necessary consequences:

- `Problem97.CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`:
  an interior-centered selected four-class has at most two members in its
  own indexed cap;
- `Problem97.CapSelectedRowCounting.selectedFourClass_inter_orderedCap_first_card_le_one`
  and
  `Problem97.CapSelectedRowCounting.selectedFourClass_inter_orderedCap_last_card_le_one`:
  an endpoint-centered selected class has at most one member in that ordered
  cap; and
- `Problem97.SurplusCapPacket.capByIndex_cgn4g_capData_oriented`: the two
  Moser vertices of an indexed cap are exactly its ordered endpoints, in one
  of the two orientations.

The general cap cut found 29 violations in 18 old survivors.  The endpoint
cut found none because the older candidate generator already enforced its
endpoint consequence.  The cuts are monotone under adding complete selected
rows.

## Current-bank freshness

Every old survivor was replayed through both the current
`_formalized_metric_core` and the complete-leaf bank used by
`formalized_core_shard.py --extended-production-cores`.  All 23 were stale:

- 12 first hit `equality-convex-four-point-two-circle-bisector-order`;
- 7 first hit `equality-convex-nested-equal-chords`;
- 2 first hit `equality-five-point-hinge-cycle`; and
- 2 first hit `equality-six-point-hinge-tail`.

Therefore the refresh reused **zero** old survivors and reran all 23 shards.
Important current source pins recorded in the checkpoint are:

- metric matcher:
  `f7a92776f9cee02eda2265467d77a0bbd5254d1dd335bc7a70713203239d3373`;
- complete-leaf bank:
  `18b1a91a3326b975c8baa16f82e7c692fafd5b979450bb305d4c31895cde1334`;
- source shard driver:
  `d8d4846d4e6009de6b7bd2b691e204a1c5c8f43660644de2568e452aa6d98511`;
- fixed query:
  `f0a90838a7cbd5166e58c78ac1c0c7252fb1fbd7c744dce575820e24b92dee52`;
- cap-cut implementation:
  `cf1a60f886d100e887a2cf55568575178f86f14d36b9af806c82f918c947d802`;
  and
- cap-bound shard driver:
  `1f0c262050374e82e0bdd07d828ade110829bc783132abd3729de372bd51a94b`.

## Exact bounded result

At 100,000 nodes per shard, the fully refreshed checkpoint is
`selected_row_own_cap_bound_refresh_checkpoint.json`, SHA-256
`3648bc9408b9557cc6a1adb10cfd21a7bf75bdf4d5ac2489d417b68b07412b74`,
with the split:

- 10 `SAT_FINITE_SHADOW_ONLY` shards;
- 0 exhaustive-`UNSAT` shards; and
- 13 node-capped `INDETERMINATE` shards.

The requested one-million-node retry of zero-based shard 21 found a fresh SAT
survivor at 107,632 nodes.  The final checkpoint is
`selected_row_own_cap_bound_refresh_1m_retry_checkpoint.json`, SHA-256
`ad2400da59782d38d0952a9c31ae448bd30f86a110239bcca4687b538bc09fe9`,
with the final split:

- 11 `SAT_FINITE_SHADOW_ONLY` shards;
- 0 exhaustive-`UNSAT` shards; and
- 12 `INDETERMINATE` shards.

## All-pairs bi-apex grid

The 11 fresh SAT survivors contain 13 strict-pair grids in total.  Across
every one of those grids:

- no continuation row already contains both members of the first strict
  pair;
- the existential-best deficit is exactly one membership;
- the universal-worst deficit is also exactly one membership; and
- hence every strict-pair grid is one forward row-incidence short of the
  repeated-outside-pair consumer.

Forward patterns over the 13 grids are:

- 1 identity alternating permutation;
- 5 swap alternating permutations;
- 5 one-entry grids; and
- 2 two-in-one-column grids.

Reverse patterns are 1 identity permutation, 4 swap permutations, and 8
one-entry grids.  The `z1`/`z2` cross-incidence is one-way in 12 grids and
mutual in 1.

The per-grid missing-incidence ledger contains 31 absent forward incidences.
Of these, 21 are single-edge completions of a continuation row.  Every absent
edge has the same finite-shadow interpretation:

- the strict-`O2` continuation center has a selected four-row surviving
  deletion of the strict-`O1` source;
- because that exact global row omits the source, the center is ineligible
  and therefore is not the source's chosen critical-shell blocker; and
- the missing producer target is to add that one strict-`O1` source to a
  strict-`O2` continuation row.

No h4/h5 label is assigned.  The compact refreshed witnesses do not retain an
exact U1 `(a,c,d,e,f)` role map, so comparing a missing edge to an h4- or
h5-style row extension would be speculative.

## Reproduction

From the repository root:

```bash
.venv/bin/python \
  scratch/atail-force/biapex-continuation-shadow-audit/refresh.py \
  --workers 12 --max-nodes 100000
.venv/bin/python \
  scratch/atail-force/biapex-continuation-shadow-audit/retry_shard.py
.venv/bin/python \
  scratch/atail-force/biapex-continuation-shadow-audit/analyze.py --check
```

The refresh pins the original checkpoint.  The final check pins the final
checkpoint, every matcher, bank, cap-cut, and Lean theorem source recorded by
the refresh, and the high-budget retry driver.  It also independently rejects
any final SAT survivor that now hits the current bank or either cap bound.

## Rigor boundary

`SAT` means only that the encoded finite-incidence constraints admit a row
assignment.  It is not a Euclidean realization.  `UNSAT` would apply only to
this fixed placement and this encoding; no shard is currently UNSAT.
`INDETERMINATE` means the node cap was reached.  This audit neither covers
cardinality 11 nor proves a uniform card-at-least-12 producer, and it does not
close K-A-PAIR.
