# Aggregate positive-contour discovery checkpoint

Date: 2026-07-18

Status: **THEOREM DISCOVERY ONLY.  EIGHT HIGH-GIRTH CARD-FORTY FIXED ROW
TABLES ARE EXACTLY KALMANSON-INFEASIBLE; ALL 263 MINIMIZED EXACT-CORE BANK
MEMBERS HAVE INDEPENDENTLY REPLAYED POSITIVE CONTOURS.  THE GENERIC EXTRACTION
THEOREM REMAINS OPEN, SO NO LIVE PARENT COVERAGE THEOREM OR SOURCE `sorry` IS
CLOSED.**

## Decision surface

This lane tests the cardinality-generic whole-carrier route isolated in
`variable-card-positive-dual-proof-audit/`: one four-target equal-distance row
at every cyclic carrier point, together with every strict Kalmanson
inequality.  It deliberately does not enumerate A-tail role literals.

The adversarial fixed tables are center-avoiding relabelings of the
40-point/40-line incidence table of the symplectic generalized quadrangle
`W(3,3)`.  Every row has four targets and every two design rows meet in at
most one target.  These tables therefore defeat any argument that relies only
on repeated target pairs or dense local overlap.

The fixed-table oracle reports exact-LRA `UNSAT` for seeds `0` through `7`.
Seeds `2` through `7` were run together at a 300-second bound and all finished
without reaching the bound.  Their assumption cores have the following
sizes:

| seed | core row equalities | represented centers |
|---:|---:|---:|
| 0 | 16 | 8 |
| 1 | 8 | 4 |
| 2 | 8 | 4 |
| 3 | 8 | 5 |
| 4 | 13 | 7 |
| 5 | 16 | 8 |
| 6 | 6 | 4 |
| 7 | 8 | 4 |

This is fixed-table evidence, not a decision for all four-target row tables
and not a Lean proof.

## Exact dual extractor

[`exact_fixed_rows_dual.py`](exact_fixed_rows_dual.py) turns one fixed-table
UNSAT core into an independently replayed positive Kalmanson dual:

1. sparse HiGHS dual simplex selects a candidate support;
2. Z3 reconstructs rational multipliers on only that support;
3. denominators are cleared;
4. adjacent positive `K2` rectangles are replaced by their exact union; and
5. every unordered-distance coefficient is replayed as an integer and checked
   to cancel to zero.

Only the Kalmanson multipliers are constrained nonnegative.  Row-equality
multipliers remain unrestricted.  The tool rejects malformed inputs whose
core equalities are not present in the corresponding selected row.

`EXACT_POSITIVE_DUAL` therefore means exact coefficient cancellation for the
displayed fixed table.  It does not mean kernel checking or generic coverage.

## Compact card-forty contour

Seed `1` reduces to the four effective selected-row equalities

```text
d(3,34) = d(3,37)
d(4,25) = d(4,34)
d(7,12) = d(7,25)
d(8,12) = d(8,37).
```

The exact positive part is

```text
K2(3,4,34,37) + K2(4,8,25,37) + K2(7,8,12,25).
```

Expanding those three strict inequalities gives

```text
(d(3,34) - d(3,37))
+ (d(4,25) - d(4,34))
+ (d(7,12) - d(7,25))
+ (d(8,37) - d(8,12)) > 0,
```

while the four row equalities make the left-hand side zero.  The earlier
54-term full-grid LP output was therefore only a nonminimal fill.  Restricting
to core vertices and exact rectangle compression exposes the actual
three-cell staircase.

The projective-plane `PG(2,3)` adversary likewise has a two-`K2`, three-row
contour.  W(3,3) seeds `2`, `6`, and `7` replay with five Kalmanson terms and
four represented centers.  Seeds `0`, `3`, `4`, and `5` also have exact
positive duals, although the present LP support is not claimed minimal.

## What this advances

The high-girth adversary did not refute the aggregate theorem.  More
importantly, the compact seed-1 core identifies the recurring object as a
closed alternating center/target incidence contour whose row-fiber boundary
is filled by positively oriented Kalmanson rectangles.  This is materially
stronger than another literal A-tail core: its statement is independent of
the live cap cardinality and of the W(3,3) labels.

The remaining mathematical obligation is still the extraction step:

> From a full cyclic four-target row table (using selected-witness strong
> connectivity if necessary), produce a nonzero closed row-fiber contour that
> admits a consistently oriented Kalmanson filling.

A bipartite incidence cycle alone is insufficient; some cyclic placements of
a three-center/three-target cycle have no positive dual.  The proof must select
the orientation/filling, not merely invoke graph cyclicity.  Until that
selection theorem is proved, this checkpoint closes no A-tail parent branch.

## Exact recurrence in the 263-core bank

The compact contour is not peculiar to the `W(3,3)` adversary.  The canonical
source for this census is
`../exact6-allcenter-capaware-gate/combined_round1_round2_minimized_schema_bank.json`,
whose independent replay reports `VERIFIED` for all 263 deletion-minimal
exact-LRA cores.

[`audit_core_bank_contours.py`](audit_core_bank_contours.py) discards each
core's strict inequalities for its small-support search, retains only its
selected-row equalities, and searches all `K1`/`K2` inequalities on the active
ordered roles for a positive dual.  HiGHS selects a minimum support.  A wider
pass raises the support limit to eight; if minimization still times out, the
tool can replay the source-minimal strict support directly.  A core is counted
as covered only after Z3 reconstructs rational multipliers and the independent
verifier replays every distance-coordinate coefficient exactly over the
integers.  The resulting exact-positive census is:

| positive strict support | exactly replayed cores |
|---:|---:|
| 1 | 33 |
| 2 | 121 |
| 3 | 70 |
| 4 | 29 |
| 5 | 8 |
| 34 | 1 |
| 49 | 1 |
| **total** | **263 / 263** |

Thus 154 cores have a one- or two-cell contour, 224 have a contour of at most
three cells, 253 have one of at most four cells, and 261 have one of at most
five cells.  Of the 263 exact certificates, 258 use unit weight on every
strict term.

The literal card-forty signature

```text
three positive K2 cells + four represented center fibers
```

occurs in 4 cores, at canonical indices `65`, `79`, `94`, and `211`.  Its
seam-aware generalization

```text
three positive K1/K2 cells + four represented center fibers
```

occurs in 45 cores.  The row equalities may be multi-edge paths through a
row's selected shell; after path compression they have the same boundary
role as the four direct equalities in the `W(3,3)` seed-1 certificate.

The dominant schema is therefore not the literal three-`K2` staircase.  It is
a **small positive strip contour**:

> Three to seven oriented center-fiber paths have total boundary equal to the
> negative boundary of a nonempty positive chain of at most four Kalmanson
> cells, using `K2` cells in the interior and `K1` cells when the contour
> crosses the distance-term strip seam.

This is the right generalized producer shape for theorem discovery.  A theorem
restricted to the three-`K2`/four-row picture would explain only 4 cores; even
allowing either cell kind at the same size explains 45.  A uniform extraction
theorem should construct the positive strip contour, with the existing
weighted Kalmanson consumer handling its variable cell and row-path counts.

The 17 first-pass gaps were search-bound artifacts, not survivors.  A wider
parallel pass finds exact three-to-five-cell contours for 15 of them.  For
indices `157` and `221`, small-support minimization still times out, but direct
replay of their already verified source-minimal supports gives exact positive
contours with 49 and 34 strict terms respectively.  There is therefore no
unresolved member in the stored 263-core bank.  This remains recurrence within
a mined finite bank, not live parent coverage or a proof of the generic
interval-flux extraction lemma.

The merged records and every displayed multiplier are in
[`core_bank_small_contour_audit.json`](core_bank_small_contour_audit.json).
[`merge_core_bank_contour_audits.py`](merge_core_bank_contour_audits.py)
checks that the shards cover each source index exactly once before producing
the census.

## Reproduction

Generate one adversarial table and its exact assumption core:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/variable-card-positive-dual-proof-audit/structured_design_falsifier.py \
  --design w33 --seed 1 --timeout-ms 300000 \
  --output /tmp/p97-w33-seed1.json
```

Extract and replay the compact dual:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/aggregate-positive-contour-discovery/exact_fixed_rows_dual.py \
  /tmp/p97-w33-seed1.json --kalmanson-core-vertices \
  --output /tmp/p97-w33-seed1-dual.json
```

Validation at this checkpoint:

```text
python byte compilation                         PASS (through uv)
ruff check                                      PASS
seed-1 exact dual status                        SAT
seed-1 exact vector cancellation                true
seed-1 active Kalmanson inequalities            3
seed-1 represented row centers                  4
263-core source replay                           VERIFIED
exact positive contours                          263
exact positive contours with <= 5 cells          261
unit-weight positive contours                    258
literal 3-K2 / 4-center recurrences                4
```
