# Cross-Wave General-Theorem-Mining Audit — Exact-12 Rigid221 Next-Row Arm CEGAR Lane

Date: 2026-08-14
Status: **EMPIRICAL / diagnostic sweep only.** No theorem claims. No solver,
no workdir validator, no Lean build was run. All statements below are about
re-derived diagnostic certificate cores of preserved SAT witnesses, quotiented
by role relabeling.

Machine-readable companion: `cores.json` (same directory) — full per-witness
provenance (path, file sha256, cube sha256, arm cell index), every unique
all-order core with memberships, the full 323-row recurrence table, and all
subsumption flags. Sweep code: `sweep_cross_wave_cores.py` +
`postprocess_iso_subsumption.py`.

## Method

- Detector machinery reused unchanged from
  `census/card_head/exact12_v14_ordered_coverage.py` (`_metric_rows`,
  `_common_five_point_cores`, `_common_five_orientation`, `SOURCE_ORDERS`,
  `_closure_memberships`) plus
  `census.global_confinement.cap_selected_nogood_certificate_probe` for the
  equality-closure replay, mirroring
  `scratch/rigid221-sourceheavy-anchor/mine_exact12_static_canary_all_orders_v23.py`
  lines 386-424 exactly (stage chosen from the first source order's
  orientation, as the v23 miner does).
- A core is **order-independent** when `_common_five_orientation` is non-null
  for all 48 `SOURCE_ORDERS`. Every kept core's closure certificate passed the
  in-process equality replay (`_validate_certificate` is pure Python; zero
  replay failures — see Anomalies).
- Sanity oracle: on the v23 live survivor the sweep reproduces the v23 mine's
  own `all_order_mining_summary.json` cores exactly (7 records = 6 cores after
  x<->y dedup, identical memberships and orientation counts 24/24).

### Quotient

- Concrete cores normalized by the known x<->y symmetry (canonical x < y).
  Both variants always appeared with identical membership sets (checked; zero
  disagreements).
- **Role structure** of a core = its `_closure_memberships` pattern with
  concrete labels replaced by core roles a/b/c/x/y, canonical under the x<->y
  swap; labels outside the five core roles get placeholders o1, o2, ...
  (assigned in ascending concrete-label order — a deterministic approximation;
  ties among multiple placeholders are broken by concrete label).
- No a<->c quotient was applied (task specified x<->y only).

### Subsumption tests (three levels, all recorded per core in cores.json)

1. **Concrete exact**: the core's membership pattern equals one of a bank's
   materialized concrete patterns.
2. **Concrete covered**: some banked pattern is implied by the core's
   memberships (every banked entry's support contained in the core's required
   set at the same center) — i.e. the banked family's blocking pattern fires
   on this membership configuration.
3. **Anonymous-isomorphism (iso)**: the core's role structure and a banked
   pattern are equal after canonical relabeling of *all* labels (quotients
   away role vocabulary as well; this is the only test that is meaningful
   across cells, because the banks materialize cell-6 label ranges only).

Banked families: the 19 `*_family_bank.json` files materialized in
`scratch/arm-static-cell6-v23-live-fc0b0f5d-20260814/` (identical family set
to the `census/card_head/exact12_*_membership_family_bank.py` modules
installed in the arm chain; the 20th module,
`exact12_block_spanning_membership_family_bank.py`, is not in the arm chain
and was excluded). File names, family ids, bank sha256, and pattern counts
are listed in `cores.json` under `banks`.

## Corpus census

| Source | Files found | Decoded | Skipped |
|---|---|---|---|
| Canary dirs `exact12-next-row-arm-static-canary-*` (22 dirs) | 21 `survivor.json` | 21 | 1 dir |
| Live workdirs (v22 f4f68481, v23 fc0b0f5d) | 2 `survivor.json` | 2 | 0 |
| Wave `exact12-next-row-arm-direct-wave-20260811-v2` (72 cells) | 68 `cell-*/model.json` | 68 | 4 cells |
| **Total** | **91** | **91** | **5** |

Skip list (no silent drops):

- `exact12-next-row-arm-static-canary-cell6-20260812-v21-reciprocal-first-opposite-surplus-second-opposite-common-five/` — empty directory, no `survivor.json` (superseded by its `-retry1` sibling, which is in the corpus).
- Wave `cell-52`, `cell-58`, `cell-65`, `cell-71` — no `model.json`; summary status `UNSAT_DRAT_VERIFIED` (no SAT witness exists for these cells).

Witness schema note: canary/live survivors carry
`classification: STRUCTURALLY_UNRESOLVED` + `cube` + `positive_variables`;
wave witnesses keep the cube in `cell-NN/model.json` (no classification
field; wave `summary.json` status is `SAT_WITNESS_REPLAYED`). All 91 cubes
decoded cleanly (12 centers, 4 distinct supports each).

**Duplicate-cube caveat (important):** the 68 wave witnesses contain only
**24 distinct cubes** — blocks of wave cells received byte-identical solver
models (e.g. cells 00-04, 06-10, 12-17, 30-35 each share one cube). The 21
canary + 2 live cubes are all distinct, and no wave cube equals a canary/live
cube (47 distinct cubes in total). Witness-count recurrence therefore
overstates independent evidence; every table below reports the deduplicated
`n_distinct_cubes` alongside the witness count, and `cores.json` carries
`cube_sha256` per witness.

## Totals

- Unique order-independent cores (after x<->y dedup): **3,488**
  (canary 47, live 7, wave 3,434).
- Distinct role-structure groups: **323**.
- Corpus span of groups: 1 group spans canary+live+wave, 4 span canary+wave,
  318 are wave-only, **0** are canary-only or live-only (every canary/live
  core structure recurs in the wave).

## Banked families vs the sweep

- The 19 banks materialize 623 concrete patterns but only **6 distinct
  anonymous shapes**. **15 of the 19 banks share one single anonymous
  shape** — exactly the shape of the lane's dominant role structure
  `{(c,{b,x,y}), (x,{a,b}), (y,{a,b})}` (see below). The four banks with
  other shapes: `first-opposite-pair-surplus-second-opposite…`,
  `reciprocal-first-opposite-surplus-second-opposite…`,
  `second-opposite-triple-surplus-first-opposite-three-triad…`,
  `surplus345-fixed6789-three-triad`.
  EMPIRICAL reading: the wave-local mining loop has been re-banking
  label-range slices of one and the same abstract structure, wave after wave.
- Subsumption of the 323 groups: **1 group iso-subsumed** (the dominant one),
  **0 further groups fully covered concretely**, 1 group partially covered
  (1 of its 11 distinct concrete patterns implies the reciprocal bank
  pattern), **321 groups with no bank contact at all**.
- Witness-cube-level check (which banks fire directly on a witness's cube):
  each canary vN's cube is matched by exactly the family that was mined from
  that survivor and installed next in the chain (e.g. v13 -> apex-first-
  opposite-shared-pair, v20 -> reciprocal-first-opposite-…), reproducing the
  historical CEGAR sequence; v1, v2, v7 match none; **no wave cube matches
  any bank** (0 of 68) — concrete cell-6 label materializations structurally
  cannot fire on other cells' labels, which is why the iso level is the only
  meaningful cross-cell subsumption test.

## Recurrence table (top rows; full 323-row table in cores.json)

Ranked by distinct-cube recurrence. "cov" = distinct concrete patterns
covered by a bank / total distinct concrete patterns in the group.

| # | Role structure | Distinct cubes (of 47) | Witnesses (of 91) | Corpus split (distinct cubes) | Subsumption |
|---|---|---|---|---|---|
| 0 | (c,{b,x,y}) (x,{a,b}) (y,{a,b}) — **dominant** | 45 | 89 | 19 canary + 2 live + 24 wave | **ISO-SUBSUMED** (15 banks); concrete cov 16/57 |
| 1 | (a,{b,x}) (b,{a,x}) (c,{b,x,y}) (y,{a,b}) | 25 | 60 | 4 canary + 21 wave | PARTIAL: cov 1/11 (reciprocal bank); **not iso-subsumed** |
| 2 | (a,{b,x}) (b,{a,c,x,y}) (x,{b,c}) (y,{a,b,c}) | 24 | 68 | 24 wave | UNSUBSUMED |
| 3 | (b,{c,x}) (c,{b,x,y}) (x,{a,c}) (y,{a,b}) | 22 | 66 | 22 wave | UNSUBSUMED |
| 4 | (a,{b,o1,x,y}) (b,{a,c,o1,x}) (c,{b,x}) (o1,{a,b,y}) (y,{b,c,o1}) | 21 | 56 | 21 wave | UNSUBSUMED |
| 5 | (a,{b,x}) (b,{a,c,x,y}) (c,{b,x}) (y,{a,b,c}) | 21 | 56 | 21 wave | UNSUBSUMED |
| 6 | (a,{o1,x}) (b,{c,o1,x,y}) (o1,{a,b}) (x,{b,c}) (y,{a,b,c}) | 21 | 56 | 21 wave | UNSUBSUMED |
| 7 | (c,{b,o1,x}) (o1,{c,y}) (x,{a,b}) (y,{a,b,c,o1}) | 21 | 56 | 21 wave | UNSUBSUMED |
| 8 | (a,{o1,x}) (c,{b,x,y}) (o1,{a,x}) (x,{b,o1}) (y,{a,b}) | 18 | 62 | 18 wave | UNSUBSUMED |
| 9 | (b,{c,x}) (c,{x,y}) (x,{a,b,c}) (y,{a,b}) | 17 | 43 | 1 canary + 16 wave | UNSUBSUMED |
| 10 | (a,{x,y}) (c,{b,x,y}) (x,{a,b,y}) (y,{b,x}) | 16 | 46 | 16 wave | UNSUBSUMED |
| 11 | (b,{o1,x}) (c,{b,x,y}) (o1,{b,x}) (x,{a,o1}) (y,{a,b}) | 16 | 46 | 16 wave | UNSUBSUMED |

### Top 5 unsubsumed recurrent patterns (REPORTABLE candidates, ranked by distinct-cube recurrence)

1. **(a,{b,x}) (b,{a,x}) (c,{b,x,y}) (y,{a,b})** — 25 distinct cubes
   (4 canary + 21 wave), 60 witnesses, 134 core instances. This is the
   dominant structure plus two extra memberships at a and b. Exactly one of
   its 11 distinct concrete patterns implies the reciprocal-first-opposite
   bank pattern (the v20-derived cell-6 instance from which that bank was
   mined); the other 24 distinct cubes carry the same structure unbanked.
   The only cross-corpus (canary+wave) reportable candidate.
2. **(a,{b,x}) (b,{a,c,x,y}) (x,{b,c}) (y,{a,b,c})** — 24 distinct cubes
   (all 24 distinct wave cubes; 68/68 wave witnesses), zero bank contact.
   The most wave-universal reportable structure.
3. **(b,{c,x}) (c,{b,x,y}) (x,{a,c}) (y,{a,b})** — 22 distinct wave cubes,
   66 witnesses, 84 instances, zero bank contact.
4. **(a,{b,o1,x,y}) (b,{a,c,o1,x}) (c,{b,x}) (o1,{a,b,y}) (y,{b,c,o1})** —
   21 distinct wave cubes, 56 witnesses. Six-label structure (one
   off-core label o1), zero bank contact.
5. **(a,{b,x}) (b,{a,c,x,y}) (c,{b,x}) (y,{a,b,c})** — 21 distinct wave
   cubes, 56 witnesses, zero bank contact. (Two further groups tie at 21
   distinct cubes; see rows 6-7 above and cores.json.)

## v23 dominant core — cross-wave recurrence

The v23 mine's dominant core a=1, b=7, c=6, x=9, y=11 has role structure
**(c,{b,x,y}) (x,{a,b}) (y,{a,b})** (all six v23 all-order cores share it).

- Recurs in **88 of the 90 other witnesses**: 19/21 canary, 1/1 other live
  (v22), 68/68 wave.
- Deduplicated: **44 of 46 other distinct cubes** (all 24 distinct wave
  cubes, v22, and 19/21 canaries).
- The only two witnesses lacking it: canary v13 (apex-internal-shared-pair)
  and canary v20 (apex-first-opposite-shared-pair-surplus); each has exactly
  one all-order core, of a different structure (v20's is reportable
  candidate #1 above).
- Verdict (EMPIRICAL): the newest candidate family's structure is **fully
  cross-wave general, not v23-specific** — indeed it is the same anonymous
  shape already carried by 15 of the 19 installed banks. Its recurrence is a
  property of the lane, not of the v23 witness.

## Anomalies

- Decode anomalies: **none.** 91/91 witness files parsed; all cubes had the
  full 12-center/4-support shape; zero closure-replay failures; zero x<->y
  membership disagreements.
- Data anomaly worth flagging: the wave's duplicated solver models (68
  witnesses, 24 distinct cubes, in contiguous cell blocks) — any wave-local
  count that treats cells as independent witnesses overstates evidence by
  roughly 2.8x.
- Diagnostic approximations (do not treat group identities as exact beyond
  this): placeholder labels o1/o2 are ordered by concrete label; only the
  x<->y quotient was applied; closure stage follows the first source order's
  orientation exactly as in the v23 miner.
