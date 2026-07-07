# Endpoint bank exact-mask coverage — feasibility check

Date: 2026-07-07. Read-only analysis; no project files modified.
Computation: `coverage_check.py` (this dir), output `coverage.json`.

## VERDICT: GAPS — 20 of 32 demandable triples have NO exact-mask bank row

The exact-mask producer demanded by the two sorries is unprovable by bank-row
lookup for those 20 triples: `endpointShadowInBank` membership pins the full
10-mask vector to one of the 117 rows, and no row carries the gap masks.
Moreover the gaps are CONTRACT-LEVEL, not generator omissions: the kernel-checked
coverage theorem `endpointShadowInBank_of_endpointShadowOK`
(ShadowSearchCoverage.lean:92-100, sorry-free incl. all shards) is
unconditional — every shadow satisfying `endpointShadowOK` is in the bank — so
no `endpointShadowOK`-valid shadow with a gap-triple (v,w)-mask pair exists at all.

## Demand side (REQUIRED)

Sorry sites: `lean/Erdos9796Proof/P97/RemovableVertexAxiom.lean`
theorem `Problem97.isM44EndpointResidualsExcluded` (line 2673) —
left producer sorry at 2701, right at 2727. Each demands

```
∃ shadow, endpointShadowInBank xLabel shadow = true
  ∧ shadow.centerMask .v = maskOfLabels [.Pw, .Pu, xLabel, aLabel]   -- 2693-2694 / 2719-2720
  ∧ shadow.centerMask .w = maskOfLabels [.Q1, .Q2, bLabel, .u]       -- 2695-2696 / 2721-2722
  ∧ EndpointMetricShadow pointOf shadow                              -- 2697-2698 / 2723-2724
```

Labels arrive from the handoff surfaces (existentially quantified — the
producer must handle every triple the statement permits; no narrower
constraint is in scope at the sorry sites):

- Left: `endpointLeft_residual_exists_false_of_metric_shadow_data`,
  ResidualCoreData.lean:592-614. Label hypotheses at 599-601.
- Right: `endpointRight_residual_exists_false_of_metric_shadow_data`,
  ResidualCoreData.lean:693-715. Label hypotheses at 700-702.

Both sides expose IDENTICAL label ranges (Geometry.lean definitions):

| binder | predicate | range | citation |
|---|---|---|---|
| xLabel | `IsEndpointEscapeeLabel` | {Q1, Q2} | Geometry.lean:61-62 |
| aLabel | `IsEndpointVSurplusHitLabel` | {w, s1, s2, s3} | Geometry.lean:65-66 |
| bLabel | `IsEndpointWSurplusHitLabel` | {v, s1, s2, s3} | Geometry.lean:69-70 |

xLabel is NOT fixed per side: both residuals range over {Q1, Q2}. Left and
right differ only in `pointOf` (`endpointLabelPoint` Geometry.lean:28-41 vs
`endpointMirrorLabelPoint` Geometry.lean:45-58) — i.e. which packet points the
labels denote — not in label ranges. Upstream source of the labels:
`endpointLeft_residual_exists_label_data` (Geometry.lean:1095-1133; aLabel is
the v-class right-adjacent-cap hit, bLabel the w-class left-adjacent-cap hit,
lines 1119-1132) and `endpointRight_residual_exists_label_data`
(Geometry.lean:1612+). No hypothesis couples aLabel/bLabel/xLabel (aLabel =
bLabel ∈ {s1,s2,s3} is permitted by the statements).

Demand space: 2 × 4 × 4 = 32 triples per side, same 32 for both sides.

Dedup sanity: `maskOfLabels` (SurplusCOMPGBank.lean:54-56) is a bit-SUM with
no dedup, but every demandable list is duplicate-free — {Pw,Pu} ∩ {Q1,Q2} = ∅,
aLabel range ∩ {Pw,Pu,Q1,Q2} = ∅, bLabel range ∩ {Q1,Q2,u} = ∅ — so 3-element
degenerate masks are NOT demandable, and no bank row has one either.

## Available side (bank)

Authoritative source: `lean/Erdos9796Proof/P97/EndpointCertificate/ShadowBank.lean`
— it is what `endpointShadowInBank` (line 1602-1603) literally evaluates:
membership of `(escapee, shadow.masks)` in `endpointRowEntries` built from
`allEndpointRows = endpointRowsQ1 ++ endpointRowsQ2` (rows at lines 180+, 581+).
Row counts proved by `rfl`: 33 + 84 = 117 (lines 1605-1612). All rows pass
`endpointShadowOK` (`allEndpointRows_valid`, line 1614-1616, native_decide).
The `certificates/endpoint/*.json` files carry algebraic payloads, not masks;
their 117 ids match the bank ids exactly (verified, `json_ids.txt` vs
`bank_ids.txt`). Patterns/ modules are certificate payloads, not mask sources.

Mask→class mapping: `Shadow.centerMask` = `masks.getD center.index 0`
(SurplusCOMPGBank.lean:164-165); v.index = 1, w.index = 2
(SurplusCOMPGBank.lean:35-45), so masks[1] = v-class, masks[2] = w-class.
Every row's v-mask has shape {Pw, Pu, escapee, a} and w-mask {Q1, Q2, u, b}
(forced by `endpointVShapeOK`/`endpointWShapeOK`; confirmed row-by-row in the
parse — all 117 rows classified, zero anomalies).

## Coverage table (row counts per triple; identical demand both sides)

```
              b=v   b=s1  b=s2  b=s3
x=Q1 a=w       0     0     0     0
x=Q1 a=s1      0     5     0     4
x=Q1 a=s2      0     0    13     1
x=Q1 a=s3      0     0     0    10     (Q1 total 33)
x=Q2 a=w       0     0     0     2
x=Q2 a=s1      0    17     6     8
x=Q2 a=s2      0     0    36     4
x=Q2 a=s3      0     0     0    11     (Q2 total 84)
```

Covered (12): Q1:(s1,s1),(s1,s3),(s2,s2),(s2,s3),(s3,s3);
Q2:(w,s3),(s1,s1),(s1,s2),(s1,s3),(s2,s2),(s2,s3),(s3,s3).

GAPS (20 triples, applying to BOTH the left and right residual):
- bLabel = v: all 8 triples (both escapees, all aLabel) — no bank row ever has b=v.
- aLabel = w: 7 of 8 (only (Q2, w, s3) is covered).
- s-index inversions: (Q1,s1,s2), (Q1,s2,s1), (Q1,s3,s1), (Q1,s3,s2),
  (Q2,s2,s1), (Q2,s3,s1), (Q2,s3,s2).
Full list in coverage.json `.gaps`. Note the Q1/Q2 asymmetry ((Q2,s1,s2) and
(Q2,w,s3) covered, Q1 counterparts not) — this is genuine contract-level
satisfiability, not a symmetric canonicalization artifact.

## Implications for the lane

1. The exact-mask producer as currently written is infeasible for the 20 gap
   triples: the conjunction `endpointShadowInBank xLabel shadow ∧ centerMask .v
   = <gap v-mask> ∧ centerMask .w = <gap w-mask>` is FALSE for every shadow
   (bank membership forces the mask vector to equal one of the 117 rows).
   Closing those cases requires refuting the gap triple from the ambient
   geometric hypotheses (hend/hM44/hconv + hvMask/hwMask/hinj), per triple —
   there is no in-scope hypothesis that excludes them.
2. Pivot option A (interface narrowing): strengthen
   `endpoint{Left,Right}_residual_exists_label_data` /
   `_of_metric_shadow_data` to emit only covered triples (needs geometric
   exclusions, e.g. bLabel ≠ .v, plus s-relabeling freedom at the
   `exists_surplusInterior_triple_covering` choice point, Geometry.lean:1164).
   The s-inversion gaps look like relabeling freedom; bLabel = v and aLabel = w
   (for Q1) look like real geometric exclusions.
3. Pivot option B (route change): abandon exact-mask row lookup; build the
   geometric shadow and prove `endpointShadowOK` from geometry, then bank
   membership is `endpointShadowInBank_of_endpointShadowOK` and the v/w masks
   are hvMask/hwMask definitionally — this is the already-present
   `endpoint{Left,Right}_residual_exists_false_of_selectedClass_core_interfaces`
   surface (ResidualSoundness.lean:252, 581), whose price is the remaining
   finite-mask interface facts for the other 8 classes.
4. Even on covered triples, mask coverage is necessary but NOT sufficient for
   the sorry: the produced row must also satisfy `EndpointMetricShadow pointOf`
   (MetricShadow.lean:26-35 — injectivity + equidistance for every co-class
   pair claimed by ALL TEN row masks), i.e. the full 10-mask vector must match
   the metric geometry, not just the v/w pair. Multiple rows share a (x,a,b)
   triple and differ in the other 8 masks.

## UNRESOLVED

- Whether each of the 20 gap triples is geometrically excludable from the
  hypotheses in scope at the sorry sites (exact question: for gap triple
  (x,a,b), do hend + hM44 + hconv + hvMask + hwMask + hinj refute it?). Not
  decidable from the Lean interfaces alone; this is exactly the work options
  A/B would surface or bypass.
- Which `endpointShadowOK` conjunct kills each gap shape (the v/w-local checks
  pass for b=v; death is deeper in the DFS — pair counts / separation /
  no-three / circumcenter). Determining this per triple would require running
  the DFS with the corresponding masks pinned; not needed for the verdict.
