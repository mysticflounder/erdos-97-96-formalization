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
coupling sweep with exact certificates). ATAIL-Q3 is now a DONE-NEGATIVE
decider (2026-07-13): all 87 joint classes are classified, 72 realized windows
and 44 token assignments replay exactly through the permanent checkpoint, and
the enlarged proved cut set remains SAT at token level for every profile at
cards 12--16. This does not falsify the full leaf; it proves that the
selected-four/single-pair abstraction is insufficient. ATAIL-FORCE now targets
a card-at-least-two off-surplus overlap of the two full apex exact-radius
filters, or an equivalent multi-window/critical-row contradiction
(`docs/atail-force-producer-plan-2026-07-13.md`). AHEAD-DEC was authorized by
Adam on 2026-07-13 as parallel head-only research under PROVEN cuts and the
separate CTRL-RESOURCE gate. The historical `654_all` run remains nonterminal
and is not coverage: its order-free `s <= 2` exclusion is now PROVEN post-SUB2 for
dropping `s >= 3`, but it covered only (6,5,4), did not converge, and predates
the immutable manifest/source-digest gate. Its exact encoding must be ported
and revalidated before reuse.

The first order-coupled successor checkpoint landed on 2026-07-13 in
`census/atail_force/`. It replays every row of the pinned 3,375-class
L2/full-participant inventory and restores every membership-distinct order of
the three cap blocks in one common MEC frame, for exactly 167,782 polynomial
systems. The dimensions range from 19--31 variables with exactly 14
equalities. The checkpoint is `PREFLIGHT_COMPLETE_NO_SOLVER_RUN`: it constructs
only representative smoke systems, proves no geometric inventory coverage,
and supplies neither the Lean extraction nor the full-filter producer. A bulk
nonlinear run is not authorized. The exact combinatorial reduction is now
complete: 590 S3 class orbits with 30,997 representative-order cases, and 343
raw / 70 S3 equality skeletons. The checkpoint validates all 20,250 class
permutation edges and canonical-order round trips, while explicitly withholding
an independent fixed-gauge similarity transfer certificate. A separate
manifest-bound CTRL-RESOURCE pilot gate comes next. The unsaturated equality
layer itself is already terminal negative: one exact collapsed equilateral
`Q(sqrt(3))` witness replays for all 343 raw skeletons, with all 1,029 radius
mutations rejected. Only a separator-saturated pilot or full inequalities can
still discriminate cases.

The first permanent AHEAD-SPEC checkpoint landed on 2026-07-13 in
`census/card_head/run_manifest.py`: the post-SUB2 PROVEN cut contract is
pinned at SHA-256
`8e067c226a9e5fec0825d0f7461d84af3aca19baaba52d6faafcbd7d8be505cf`,
and the manifest validator enforces exact labeled profiles, source digests,
safe paths, worker/nice bounds, wall/bank-growth/shape-staleness stops, and
exclusive creation. Three profile tests plus six manifest tests pass. The
candidate-count fixtures and execution adapter remained open at that first
checkpoint; no heavy run had begun.

The second AHEAD-SPEC checkpoint on 2026-07-13 ports the post-SUB2 PROVEN
per-center surface into `census/card_head/candidate_surface.py` and commits
exact fixtures for all 19 labeled profiles: 254 profile/center instances and
106,755 candidate classes. All three n=12 profiles match the historical `all`
counts exactly, while every n=12--14 count also matches an independent closed
formula. The manifest now constructs the niced permanent runner command;
`runner.py` re-hashes every required source and checks the selected fixture,
but `execute` fails closed until the CEGAR adapter lands and CTRL-RESOURCE is
transferred. All 16 card-head tests pass. This is exhaustive only within the
stated finite candidate abstraction; no heavy run or geometric closure claim
has occurred.

The third AHEAD-SPEC checkpoint on 2026-07-13 ports the generic finite CNF in
`census/card_head/sat_encoding.py`. Its card-12 (6,5,4) base reproduces the
historical 37,310 variables and 297,119 clauses exactly; representative
card-13 and card-14 structural sizes are pinned as regressions. The five
card-12 smoke gates pass: SAT models are independently checked by `cube_ok`,
and the forced C2, C4, and submask UNSAT cases each have a `drat-trim`-verified
CaDiCaL proof. This is EMPIRICALLY VERIFIED encoder evidence only. The suite is
22/22 passing, while the CEGAR mining/certification adapter, historical-bank
replay, and CTRL-RESOURCE transfer remain open; no census run has started.

The fourth AHEAD-SPEC checkpoint on 2026-07-13 adds a permanent read-only
structural audit of the historical `654_all` bank. Bank SHA-256
`e65e00a1a8ac900a5608061d135fb3b46c77f79b0c78533c775119816eeb8c04`
contains 256 unique profile-automorphism rows, expanding to 20,610
candidate-compatible instances and 159 independently recomputed role-blind
shape labels; all 256 referenced certificate files are present. The committed
audit is deliberately `PASS_STRUCTURAL_ONLY`: the certificate directory is
9,233,993,303 bytes and its exact polynomial identities were NOT freshly
replayed under the active resource gate. The attempted legacy verifier was
stopped rather than allowed to contend. The suite is 26/26 passing; neither
the historical bank nor its file inventory is coverage or a current proof.

The fifth AHEAD-SPEC checkpoint on 2026-07-13 adds
`census/card_head/run_protocol.py`: an immutable, manifest-bound, hash-chained
event stream whose state is derived by strict replay rather than copied into a
mutable status file. Start events freeze the bank/shape baselines; chunk events
record one SAT witness's pre-certification fresh-shape count and derive the
historical shape-stale predicate from that count, independently of whether a
fresh shape was later certified and banked. They also derive wall time and
new-bank growth. Hitting any declared limit is terminal and later appends are
rejected. Engine exhaustion is named `ENGINE_EXHAUSTED_UNVERIFIED`, not
coverage. `runner.py status` performs
the full source/fixture preflight and reads the derived state without starting
a run. All 35 tests pass; `execute`, fresh 9.23 GB identity replay, and heavy
AHEAD work remain gated, and no census process was launched.

The sixth AHEAD-SPEC checkpoint on 2026-07-13 makes the exact certificate and
publication boundary permanent. `pattern_certificate.py` reconstructs the
pattern's equidistance/Rabinowitsch generators and independently checks every
cofactor identity in rational arithmetic; `cegar_adapter.py` binds the source
cube and profile orbit to that replay; and `bank_store.py` journal-couples the
certificate files, bank rows, and run measurement with crash recovery across
each publication window. This demotes msolve and Singular to proposal
generators rather than trusted bank writers. Fault injection and exact-identity
regressions pass, bringing the card-head suite to 52/52. The heavy
mining/generation worker, full historical identity replay, and
`CTRL-RESOURCE` transfer remain open, so no AHEAD run or coverage claim follows.

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
3. ATAIL-SUB2 → ATAIL-Q3 are decided: SUB2 PROVEN, Q3 DONE-NEGATIVE. Continue
   ATAIL-FORCE on the selection-robust full-filter/multi-window/critical-row
   producer. Its three-center/global-order surface and finite reduction are
   DONE, and bare equality-ideal emptiness is ruled out by exact witnesses.
   Next run only a bounded, manifest-controlled separator-saturated pilot, not
   a bulk inequality sweep. Any bounded-forced-subsystem theorem must
   immediately be tested as a liveData producer.
4. AHEAD-DEC — DONE 2026-07-13: Adam authorized head-only card-12--14
   narrowing as parallel research alongside Census554/A11. AHEAD-SPEC and
   lightweight preflights may proceed now; heavy AHEAD-N12/N13/N14 runs remain
   serialized through CTRL-RESOURCE at one profile and at most four workers.
   No named card-at-least-15 residual is authorized before a proved AHEAD-COVER
   and its immediate AHEAD-CONSUME spine consumer.
