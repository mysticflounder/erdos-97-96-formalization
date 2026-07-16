# Fresh continuation equality/MARCO audit

Date: 2026-07-14

This scratch lane uses only the final fresh checkpoint
`selected_row_own_cap_bound_refresh_1m_retry_checkpoint.json`, SHA-256
`ad2400da59782d38d0952a9c31ae448bd30f86a110239bcca4687b538bc09fe9`.
It does not modify Lean, closure docs, `SurplusM44`, unique-row work, or the
separate `(6,5,4)` lane.

## Outcome

1. **All 11 fresh SAT shadows have inconsistent full row-equality ideals.**
   Singular 4.4.1, together with msolve 0.10.1 in both variable orders,
   returns `UNIT` for every normalized full system.  Here `UNIT` means the ideal is the whole
   ring, so the encoded equalities have no complex solution.  This is trusted
   exact CAS computation over `Q`, not a kernel-checked Lean theorem or a
   replayed Nullstellensatz certificate.

2. **The synchronized live producer-bank split is 6 clean / 5 already
   covered.**  Only shards `0,1,2,3,16,20` were eligible for new mining.
   Shards `10,12,13,15,21` match live split-bridge,
   split-bridge-tail, or circle-chain-wrap consumers and were retained only in
   the full-oracle/freshness ledger.

3. **MARCO did not establish any deletion-minimal core.**  Deletion candidates
   repeatedly received `NONUNIT` from both msolve orders, while exact Singular
   proper-ideal confirmation timed out, including a 120-second diagnostic.
   Therefore `minimal_core_count = 0`.  No MUS/minimality claim is made.

4. **Ten smaller nonminimal `UNIT` frontiers were nevertheless preserved and
   independently replayed.**  Every frontier is `UNIT` in Singular plus both
   msolve orders.  The smallest row counts per clean shard are:

   | shard | 0 | 1 | 2 | 3 | 16 | 20 |
   |---|---:|---:|---:|---:|---:|---:|
   | rows | 7 | 7 | 8 | 9 | 9 | 8 |

   The ten frontiers have ten distinct relabel-isomorphism shapes, no shape
   repeats across survivors, none lies inside a strict grid's named six
   centers, and the scratch live `producer_bank` scan finds zero exact current
   matches.  These are confirmed inconsistent subsets, not deletion-minimal
   subsets and not uniform producers.

5. **The strongest reusable signal is a deficit-one bank route.**  A pinned
   role-aliasing scan of all three required registry inventories finds 13
   nondegenerate one-equality deficits across the six smallest frontiers:

   | shard | rows | deficit-one consumers |
   |---|---:|---:|
   | 0 | 7 | 5 |
   | 1 | 7 | 1 |
   | 2 | 8 | 1 |
   | 3 | 9 | 0 |
   | 16 | 9 | 4 |
   | 20 | 8 | 2 |

   Two recurrences matter:

   - `u5_qcritical_exact_selected_mid_aux_qcritical_collision_metric_incompatibility`
     covers shards `0,1,2,16,20` after one missing equality of the uniform
     form `dist p q = dist t₁ q`.  In geometric language, the missing producer
     places `q` on the perpendicular bisector of the relevant apex pair.
   - `u1TwoLargeCapObstruction` covers shards `0` and `16`; in both role maps
     the sole missing equality is exactly
     `dist(1,2) = dist(1,10)`.  Equivalently, extend center `1`'s anchor row by
     label `10`.  This is the concrete h4/h5-style prescribed-deletion target.

   Shard `3` has no deficit-one consumer in the supported grammar and remains
   the separate residual.  The deficit scan is an exact syntactic result
   within its parser and equality closure.  It proves neither the missing
   equality producer nor the consumer theorem's applicability from the live
   K-A packet.  Nine metric-looking false statements across the three
   registries are deliberately skipped because their grammar is unsupported.

## Common mechanism audit

For the six smallest frontiers, the following are exact combinatorial facts:

- exactly two apex rows occur and force the same equilateral anchor triangle;
- the active-center incidence digraph is strongly connected;
- every packet has repeated support pairs, with multiplicity at most two; and
- row counts are `7--9` on `11--12` used points.

The generic similarity-normalized equation excesses are `3,1,4,7,7,4`.
This motivates an equilateral two-apex, strongly-connected four-row packet
family, but dimension excess is only **heuristic** and is not an emptiness
proof.  The recurring deficit-one bank consumer is the more actionable
parameterized shape.

## Closure implication

The next producer theorem should consume the retained critical map, global
`K4`, and cap/MEC order to prove the relevant apex-bisector equality after the
prescribed deletion.  A uniform version routes five of the six clean shadow
frontiers into an existing bank consumer; the specific
`dist(1,2)=dist(1,10)` instance routes shards `0` and `16` directly into the
live U1 obstruction.  Shard `3` still needs a distinct producer or a new bank
consumer.

This does **not** close K-A-PAIR by itself: the fixed-shadow row packets and the
missing equalities still need a Lean producer from the live hypotheses.  It
does show that more raw equality mining is not the first priority for five of
six residual shadows.

The zero exact-match count stored in `frontier_checkpoint.json` is the
scratch driver's live `producer_bank` scan.  The main lane's separately
synchronized, role-aliasing current-bank run is not imported into this
checkpoint; its status must be tracked separately.  The deficit-one result is
its own pinned three-registry scan.

## Encoded and omitted

Encoded:

- the 11 selected exact-row survivors and all 13 linked strict pair grids;
- four-point row equalities as squared Euclidean polynomial equalities;
- the similarity gauge `point 0 = (0,0)`, `point 1 = (1,0)`; and
- exact characteristic-zero ideal decisions over the normalized equality
  system.

Not encoded:

- convexity or cyclic orientation inequalities;
- exact off-radius disequalities and general point distinctness beyond the
  normalization gauge;
- MEC/cap order, `liveData`, or `SurplusM44` hypotheses;
- arbitrary card-11/card-ge-12 placements outside this fixed card-12 `5-5-5`
  checkpoint;
- real-variety sampling, a replayable Nullstellensatz certificate, or a Lean
  proof; and
- a uniform theorem producing any deficit-one equality.

`NONUNIT` means only that an encoded complex ideal is proper.  In the MARCO
proposal layer, paired msolve `NONUNIT` results were used to navigate the map
when Singular timed out; they are not real SAT certificates and were not used
to claim core minimality.

## Reproducibility

Primary artifact hashes:

```text
b3baf9fc5d8cedb4db58d71da59c822a6ce63087c09cfae424594b80ef06fd46  full_probe_checkpoint.json
f3234fb83d4097393b96bcfd091d59f2431e089d2d933fd9a188847bb2a5ba70  checkpoint.json
60cdb851ae94d0afef0188cc4a2ee7ac0cfc9a67dc998a87082e1ab96cf3bc68  frontier_checkpoint.json
82abce28293e6e7a1f10f6414831b86d1e6218574561ace7a315f5ddac9c0ef6  analysis_checkpoint.json
bb5e6f16415e99562c19f0f317b11ac91e6ededf552e17dd8c2b5b6b4c3e7dfd  mechanism_checkpoint.json
1ff0a1a5f24e1a39e0a4047e48c6c213b04887213db1b05b2418b5de2ecda862  deficit_one_checkpoint.json
```

Pinned registry hashes are stored in `deficit_one_checkpoint.json`.  The
immutable forward seed removes the former analysis/replay provenance cycle;
its SHA-256 is
`b70f11b50303caa970673a430d414e5689f7b28e5566e34796399132bcd99882`.

Validation commands:

```text
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python -m unittest scratch/atail-force/fresh-continuation-marco/test_mine.py
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python scratch/atail-force/fresh-continuation-marco/replay_frontiers.py --check
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python scratch/atail-force/fresh-continuation-marco/analyze.py --check
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python scratch/atail-force/fresh-continuation-marco/mechanism_analysis.py --check
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python scratch/atail-force/fresh-continuation-marco/deficit_one_scan.py --check
```

All four unit tests and every checkpoint drift/replay gate pass.
