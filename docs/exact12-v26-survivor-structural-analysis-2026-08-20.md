# Exact-12 v26 survivor: direct structural analysis (2026-08-20)

Status: EMPIRICAL throughout — observations on one authenticated SAT model,
not theorems.  Nothing here establishes terminal UNSAT, aggregate arm
coverage, or Lean closure.

Source artifacts: the preserved cell-6 v14 canary workdir
`scratch/runs/exact12-rigid221-all-order-common-five/canary-v14-20260818/artifacts/workdir/`
(survivor classification `UNADMITTED_STRUCTURAL_SURVIVOR`, job
`7f45a3e4…`, assignment `334b1d58…`), the v26 all-order mining summary
`all_order_mining_summary.json` (sha `dd75ffcb…`, schema
`p97_rigid221_exact12_static_canary_all_order_mining.v6`), and the
diagnostic certificate (sha `895db0be…`).  The v25 mining summary used
for comparison is `scratch/arm-static-cell6-v25-live-898fbd78-20260816/all_order_mining_summary.json`
(sha `d9f7557b…`, schema `…all_order_mining.v5`).  The run was independently
replayed by the frozen v26 outcome validator: `SAT_WITNESS_REPLAYED`
over 47,211 variables / 704,481 clauses.

Related commits: 22nd (core-pair) bank chained `553e033a`; canary run
recorded `18acb113`; v26 validator frozen `603e0aca`; v26 mine
`e6ab6598`.  Predecessor analysis:
`docs/exact12-v24-survivor-structural-analysis-2026-08-16.md`.

## The survivor cube

One selected 4-element support row per center (the 12-literal cube of the
v26 cell-6 model).  The right column marks whether the row is byte-identical
to the same center's row in the v24 and v25 survivors.

| center | block | support | v24 = v25 = v26 |
|---|---|---|---|
| 0 | anchor | {1, 2, 3, 4} | frozen |
| 1 | anchor | {0, 3, 6, 8} | frozen |
| 2 | anchor | {0, 1, 10, 11} | frozen |
| 3 | surplus | {0, 5, 7, 9} | frozen |
| 4 | surplus | {0, 5, 6, 10} | frozen |
| 5 | surplus | {3, 4, 8, 10} | moved at v26 |
| 6 | second | {2, 5, 8, 10} | moved at v26 |
| 7 | second | {5, 6, 8, 11} | moved at v25 and v26 |
| 8 | second | {4, 6, 9, 11} | moved at v25 and v26 |
| 9 | second | {0, 3, 7, 11} | frozen |
| 10 | first-opp | {2, 4, 5, 7} | moved at v25 and v26 |
| 11 | first-opp | {4, 6, 7, 10} | moved at v25 and v26 |

Blocks: anchors {0, 1, 2}; surplus {3, 4, 5} (6 internal orders);
second-opposite {6, 7, 8, 9} (2 internal orders); first-opposite {10, 11}
(2 internal orders).  The frozen hypotheses leave 48 canonical boundary
orders (the "deck"); the mine reports that deck as 24 direct and 24 mirror.

## Observation 1 — the frozen anchor star (new, and the strongest signal)

Six of the twelve rows are byte-identical across **three consecutive
canary waves** — v24, v25 and v26 — that is, across two installed banks:

```
center  0 (anchor):  {1, 2, 3, 4}
center  1 (anchor):  {0, 3, 6, 8}
center  2 (anchor):  {0, 1, 10, 11}
center  3 (surplus): {0, 5, 7, 9}
center  4 (surplus): {0, 5, 6, 10}
center  9 (second):  {0, 3, 7, 11}
```

That set has an exact characterization.  In every one of the three waves,
the centers whose support contains label 0 are precisely {1, 2, 3, 4, 9},
and supp(0) = {1, 2, 3, 4}.  The frozen set is therefore

> {0} ∪ {c : 0 ∈ supp(c)}

— the closed star of the anchor label 0 — and that star has not moved
once while the rest of the cube was rearranged twice.  This is the v24
"fully mutual star at the anchor" observation, now shown to be stable
under two rounds of bank pressure rather than a feature of one model.

Movement is confined to the deck-mobile blocks:

| transition | rows moved | by block |
|---|---|---|
| v24 → v25 | 4 — centers 7, 8, 10, 11 | second ×2, first-opp ×2 |
| v25 → v26 | 6 — centers 5, 6, 7, 8, 10, 11 | second ×3, first-opp ×2, surplus ×1 |

No anchor row has moved in either transition.  EMPIRICAL: three models.

**Scope correction (2026-08-20, later the same day).**  Observation 1
below is a statement about the three per-wave canary survivors, and it
remains true as stated.  It is NOT a statement about the formula's model
space: projected enumeration of the v26 formula
(`docs/exact12-v26-projected-model-space-2026-08-20.md`) found 0 of 300
sampled models carrying the full frozen star.  Only the center-1 row
supp(1) = {0, 3, 6, 8} is universal in the sample, and that row is
theorem-pinned.  The star is solver-path stability, not forced structure.

## Observation 2 — what the 22nd bank actually changed

The 22nd (core-pair) bank did real structural work.  Comparing the v25
and v26 mines on identical scope:

| | v25 | v26 |
|---|---|---|
| covering rule | `convex-five-point-common-orientation` | same |
| coverage records | 48 | 48 |
| covering cores | 2, at 24 orders each | 2, at 24 orders each |
| per-core orientation | 12 forward / 12 reverse | 12 forward / 12 reverse |
| per-core source orientation | 12 direct / 12 mirror | 12 direct / 12 mirror |
| distinct 5-label sets | **1** — {5, 7, 8, 10, 11} | **2** — {4, 6, 7, 8, 11} and {4, 6, 8, 10, 11} |
| shared labels | (single set) | {4, 6, 8, 11}; symmetric difference {7, 10} |
| strict / center-exchange / klein-union instances | 0 / 0 / 0 | 0 / 0 / 0 |
| unoriented instances | 7 | 8 |
| unoriented c-row kinds | all `single` | all `single` |
| mutual containment pairs | 9 | 12 |
| mutual triangles | none | {4, 5, 10} |
| structural certificate stage | equality-six-row-anchor-collision | equality-three-triad-collision |

The load-bearing line is the label-set split.  At v25 both covering cores
sat on **one** five-label set; at v26 they sit on **two** sets that share
four labels and differ in one each.  A single five-point family no longer
covers the deck: order-blocks 00–11 and the odd orders 25–47 are covered
by core (a,b,c,x,y) = (4, 6, 7, 11, 8), and order-blocks 12–24 and the
even orders 26–46 by core (10, 6, 8, 4, 11).

Both covering cores appear verbatim in the survivor's own unoriented
instance list (verified programmatically under the classifier's `x < y`
serialization), so the escape is not through a shape the mine failed to
see.

Deck roles of the two cores, from the mine's deck-aware reporting:

| core | a | b | c | x | y |
|---|---|---|---|---|---|
| (4, 6, 7, 11, 8) | 4 surplus, S3-permutable | 6 second, endpoint-pair-reversible | 7 second, middle-pair-reversible | 11 first-opp, pair-reversible | 8 second, middle-pair-reversible |
| (10, 6, 8, 4, 11) | 10 first-opp, pair-reversible | 6 second, endpoint-pair-reversible | 8 second, middle-pair-reversible | 4 surplus, S3-permutable | 11 first-opp, pair-reversible |

Every role in both cores is deck-mobile.  No anchor label appears in
either core — consistent with observation 1.

## Observation 3 — the installed rules bind

`rule_shape_classification` reports 0 strict, 0 center-exchange and 0
klein-union instances in the v26 cube.  The clauses installed by the
earlier banks are therefore active and unviolated: the survivor does not
escape by re-using a banked shape.  All 8 shared-pair core-pair instances
it does realize are `unoriented`, every one with a `single` c-row.

**This diagnostic has no discriminating power and must not be used to
judge a 23rd bank.**  It read exactly the same way — 0/0/0 with all
instances unoriented and `single` — in the v25 survivor, immediately
before the 22nd bank that did remove that survivor.  A reading of 0/0/0
is consistent both with "the next bank will work" and with "the next bank
will not".

## Observation 4 — degree and dispersion

Support-degree per label, v26: 0, 4, 5, 6, 10 → 5; 3, 7, 8, 11 → 4;
2 → 3; 1, 9 → 2.  (Cross-validated: the mine's own
`reciprocal_containment.degrees` and an independent recount agree.)

Compared with v25 (0, 5, 8, 11 → 5; 1, 3, 4, 6, 7, 10 → 4; 2, 9 → 2), the
heavy end has rotated off {8, 11} and onto {4, 6, 10}, while 0 and 5 stay
heavy.  Labels 1 and 9 stay lightest in both.

Dispersion is essentially unchanged.  Pairwise support-intersection
histogram moved from {0 → 9, 1 → 36, 2 → 21} at v25 to {0 → 8, 1 → 37,
2 → 21} at v26; no two supports share more than 2 elements in either.  No
support takes more than 2 labels from any one block in either wave.  The
v24 reading of a systematically dispersed, orientation-ambiguous model
still holds.

## Observation 5 — the mutual triangle returned, on a mobile label set

v25 had 9 reciprocal containment pairs and no triangle.  v26 has 12 pairs
— (0,1) (0,2) (0,3) (0,4) (2,10) (3,5) (3,9) (4,5) (4,10) (5,10) (6,8)
(7,11) — and one triangle, {4, 5, 10}.

The v24 survivor also carried a triangle, {5, 8, 11}.  Both triangles are
made entirely of deck-mobile labels (surplus 4, 5; first-opposite 10 at
v26).  Neither triangle coincides with the mine's certificate core, so the
v24 note stands: the model carries at least two triad-like structures and
the mine reports only the one its rule shape sees.

## Consequences for a 23rd bank

Recorded as evidence, not as a decision.  Starting a 23rd bank is a goal
change and needs explicit authorization.

1. **A single-set five-point family will not do it.**  The 22nd bank's
   measured effect was to force the covering cores off one five-label set
   onto two.  A 23rd bank aimed at another single-set shape targets a
   configuration the survivor has already left behind.  The shape that
   matches the current evidence is a core-pair family spanning **two**
   five-label sets that share four labels — here {4, 6, 8, 11} plus one
   of {7, 10}.  {{UNVALIDATED}}
2. **Do not use `rule_shape_classification` as the acceptance test.**
   Observation 3 gives the counterexample from the immediately preceding
   wave.
3. **The anchor star is the standing invariant to attack or exploit.**
   Six rows, closed under the label-0 star, have survived two banks
   untouched.  Either a bank that constrains the anchor star directly, or
   a proof that the star is forced (which would cut the free cube from 12
   rows to 6), is a different lever from another mobile-block five-point
   family.  Nothing yet says which is cheaper.  {{NEEDS_RESEARCH}}
4. **Minimality is stable and small.**  The v26 structural certificate
   again reduces to 4 rows out of 12 (centers 5, 6, 7, 10; 794 subsets
   tested, 1 optimal subset, max closure-path length 2).  The survivor's
   obligation set is narrow, which is what makes per-wave banking work at
   all and also what lets it keep finding a new escape.

## Carried-forward items from the v24 analysis

Still open, unchanged by this wave: surplus-S₃ triple cycling remains
unmeasured ({{NEEDS_RESEARCH}}); steered survivors via MaxSAT; projected
model enumeration modulo symmetry; mining refutation streams (DRAT /
learned clauses) as a family-hypothesis source.  None started.

## Method note

The statistics above were computed twice from the authenticated cubes:
once by the mine itself, and once by
`scratch/rigid221-sourceheavy-anchor/core-pair/analyze_v26_survivor.py`,
a read-only script that reloads `survivor.json` for each of the three
waves and recomputes every quoted figure with different code.  The two
agree on degrees, reciprocal pairs and triangles.

That script also asserts the two load-bearing claims rather than printing
them: that the frozen six-row set is exactly {0} ∪ {c : 0 ∈ supp(c)} in
all three waves, and that both v26 covering cores appear in the
survivor's own unoriented instance list.  It exits non-zero if either
fails.

Every cube was read from its own `survivor.json`, never from a prose
document.  In particular the v24 cube came from
`scratch/arm-static-cell6-v24-live-5fc7ade0-20260815/survivor.json`; it
was then checked against the table published in the v24 analysis and
agrees with it at all twelve centers, so that document's cube table is
confirmed accurate.
