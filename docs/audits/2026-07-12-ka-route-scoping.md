# K-A-LIVE / K-A-PAIR route scoping (2026-07-12)

Read-only prover-agent scoping of the two K-A spine rows. Line numbers are
working-tree (`U1LargeCapRouteBTail.lean` at 5475 lines, post-ef79d1c7/680b770b).
Dead-ends check: no LIVE-*/PAIR-* dead end; binding entries are Cluster 1
"(Q)", `doubleapex-card12up-uniform-pattern-lemma` (FALSIFIED),
`doubleapex-card12up-per-type-window-kills` (CLOSED).

## Spine role (PROVEN, source-verified)

`removableVertexOfLarge_of_nonIsM44` (Continuation.lean:684) →
`u1_largeCap_routeB_tail_false` (:5197, sorry-free wrapper) →
`u1_largeCap_routeB_tail_liveData_false` (:3433, 79 holes) → its
`center = p, t2 = t2[0]` branch (:4725) → chain to
`DoubleApexOffSurplusSharedRadiusPair` (:2516, hole :2561) → proven sink
`U2NonSurplusSqueeze.oppCap2_escape_gen` (:2373). K-A-PAIR is nested inside
one already-code-closed branch of K-A-LIVE's case tree; both are required
(closing one does not close the other).

## K-A-LIVE (79 holes, all goal `False`)

Structural families (outer 7-way split on `f2CriticalRow.center`, :1732):
- **LIVE-Q** 24 holes (:3657–3943): center p, q = t2[0]; four 6-blocks
  (q-slot l1..l4 × 6 tail-label perms).
- **LIVE-T1** 24 (:4103–4717): t1 = t2[0]; 12 pairs (4 q-slots × 3
  source-slots × 2 tail orders); polarity split — 6 positive leaves closed
  by in-file `hfalse_of_*` lemmas.
- **LIVE-T3** 24 (:4791–5163): mirror of T1, no polarity split built.
- **LIVE-C-*** 7 (:5180–5191): outer centers q/t1/t2-named/t2-row-failure/
  t3/u/fresh; no support pinning available.

Hypothesis surface at every leaf: `U3LocalizedNoQFreePacket`,
`U3FixedTriplePacket` (with `exactQDeletedRadius` pinning {t1,t2,t3} as the
full q-deleted p-radius class), 6-point distinctness, Moser frame,
`hsurplus`, `hcard : 9 < card`, `hnoRem`, `hcritical`,
`rows : CriticalSourceRows` (five exact-4 blocker rows + sixth
`f2CriticalRow`), `H : LiveData`.

Recorded obstructions: **COMP-1** (`false_of_hocc_noCollision` :3246 —
the packet-label-centered surface is self-contradictory on the no-collision
cell; centered fields cannot be produced from depth-5 live data alone);
**F5** (audits/2026-07-06-frontier-missed-angle-analysis.md —
EMPIRICALLY VERIFIED: the equality leaves are SAT under the finite core
vocabulary; no Nullstellensatz certificate over the current vocabulary — do
not hunt per-leaf certificates). Sibling bank: 18 unimported U1 consumers
(8 `cert_*_false_of_row_slot_packet` + 10 `false_of_all8_slot_metric_core`,
ordinals {2,12,40,47,88,136,169,206}) are consumers only — the registry
records that no placement/equality producer exists and no proof that any
live leaf's packet matches a certified ordinal.

**Verdict: split.** Card-11 slice TRACTABLE-with-route via the A11 lane:
A11-RUN terminal verdict → A11-OPS engineering → A11-CONSUME
(`Census554.false_of_cardEleven_twoLargeCaps`; geometry side A11-GEO-*
DONE core-only) → **A11-WIRE-LIVE**: second large cap via proven
`exists_secondLargeCap_of_noM44` (:2273), split card 11 vs ≥ 12 using DONE
`card_ge_eleven_of_twoLargeCaps`, close card 11 before the case tree —
removes the declaration at card 11 without touching the 79 leaves.
Card ≥ 12 residual: OPEN-RESEARCH — missing fact is an
incidence/confinement theorem consuming the six critical rows ((Q)-flavor
multi-center statement). Deciding experiment first: **LIVE-BANK-MATCH**
(OPEN-ENG, cheap): machine-readable leaf → `RowSlotLabelPacket` → bank
ordinal map, encoding-validated by reproducing the 12 already-closed
leaves' consumers; a negative map is an accepted terminal result.

## K-A-PAIR (hole :2561)

Goal is an existential (two distinct off-surplus carrier points co-radial
from both opposite apices), deliberately unsatisfiable downstream — proving
it IS the leaf contradiction. Consumer chain to `∃ removable` is sorry-free
core-only. Prior work: O1–O4 PROVEN core-only (sibling verdict 2026-07-05);
O5 (leaf ⟹ pair) open. EMPIRICALLY VERIFIED: raw incidence/cap counting
cannot force the pair (11-point shadow, max raw K-class overlap 2); the
missing input is metric closure at the apex exact-radius classes. Retired
shapes recorded in-file (:2441–2459, :2563–2584). The one bank kernel
(`u1TwoLargeCapObstruction`) is non-uniform: 3,713/4,000 constrained cubes
miss the pattern — a completeness/producer theorem is the missing piece.

**Verdict: split.** Card-11 slice TRACTABLE (A11-WIRE-PAIR, same gating).
Card ≥ 12 tail: OPEN-RESEARCH (matrix ATAIL-FORCE) — convexity-coupled
forcing of the pair from {two caps ≥ 5, center-K4 everywhere, critical
shell, convex independence} at every card ≥ 12; uniform equality/pattern
statements are FALSIFIED by realizable witnesses (W15/W16 families,
two-ring); surviving route is Candidate-D two-center coupling. Deciders:
**ATAIL-SUB2** (seven-variable SUB2-H half-disk statement by hand proof or
independently checked CAD/QE; encoding must reproduce the three PROVEN
probe cuts and keep banked witnesses SAT), then **ATAIL-Q3** (two-center
coupling sweep with exact certificates). AHEAD-DEC (head narrowing rerun
under PROVEN cuts only) is an Adam-gated decision row; the existing
`654_all` run is invalid evidence.

## Card-{10,11} instrument applicability

YES for the card-11 slice of both rows — already the planned route
(A11-WIRE-*), via the Census554 lane (geometry bridge DONE core-only); two
large caps force 11 ≤ card, so no card-10 branch exists here. NO
structurally for the card ≥ 12 residuals: K-B-PIN/K-B-END-GENERAL worked
because the obligation was forced into one finite cardinality; K-A cards
are unbounded, per-leaf certificates are excluded (COMP-1/F5), and for
card ≥ 15 the classifier statement surface is falsified by realizable
witnesses. Only a bounded-forced-subsystem producer (shared, per F5, with
the PAIR leaf — one producer may serve both) or the card-split route
touches the leaves.

## Ranked next actions

1. LIVE-BANK-MATCH (cheap, decides whether any band leaf closes from the 18
   existing sibling consumers before new math).
2. A11 lane to terminal + A11-WIRE-PAIR/LIVE (closes the card-11 slice of
   both rows; leaves named 12 ≤ card residuals).
3. ATAIL-SUB2 → ATAIL-Q3 (PAIR-tail deciders; any bounded-forced-subsystem
   theorem must immediately be tested as a liveData producer).
4. AHEAD-DEC — {{NEEDS_ADAM_INPUT}}; and note the cross-front convergence:
   K-B-ERASE's proposed third classifier lane and these rows all funnel
   toward finite-closure instruments — a plan-level view across all four
   fronts is warranted before committing compute.
