# D-R two-radius branch closure plan

Date: 2026-09-01
Lane: `dr-two-radius-20260901`
Base head: `5cba2911cad417b1c519b2d9399717cb4d712ae4`

Status: ACTIVE COVERING PLAN. Nothing in this document closes a Lean
theorem. Every mathematical claim below carries a rigor label.

## 1. Target

```text
Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean:1245
```

Publish target: `Problem97.erdos97_rhs`.
Immediate consumer: `false_of_exactFourPostCardElevenRobustSurface_frame`
(`Rigid221Closure.lean:1267`), which splits the robust surface with
`interiorPairGood_or_twoDistinctExactFourInteriorRows`
(`ExactFourRobustCapExpansion.lean:1098`) and sends the two-radius arm here.
The leaf retains `R` and `surface`, so no upstream hypothesis is lost at the
leaf boundary. Spine status at base head: on spine, one consumer, 28 open
obligations project-wide.

Historical label: "D1" in `docs/solve-prompts/2026-07-27-post-card-eleven-unique-radius.md`
and "D-R" in `docs/computational-closure-plan-2026-07-28.md`. The label "D1"
is also used for an unrelated TriApex leaf; this plan uses "D-R".

## 2. Binder map

| Binder | Content | Reconstructible extras |
|---|---|---|
| `R : OriginalUniqueFourResidual F` | minimality, no `IsM44`, `9 < card`, exact-four unique-radius class at `oppApex1`, every class member blocks `oppApex1`, two strict-first-cap members `interior_q`, `interior_w`, bisector-center property | frontier pair `q`, `w` in the first-apex class outside the surplus cap; `A \ {q,w}` keeps K4 at `oppApex2` |
| `12 ≤ D.A.card` | carrier size | |
| `surface` | common-deletion ingress (source, late blocker ≠ `oppApex2`, two-center packet), full deletion robustness at `oppApex2`, `4 ≤ oppCap1`, `5 ≤ oppCap2`, radius classification, cap-growth arm | |
| `firstRow`, `secondRow` | selected four-classes at `oppApex2` with radii `rho ≠ otherRadius`, disjoint supports | `0 < rho`, `0 < otherRadius`, both full classes have card exactly 4, each class has at least two strict-second-cap members (`selectedClass_capInteriorByIndex_card_ge_card_sub_two`) |
| `hnoFive` | no positive radius class at `oppApex2` has five points | `oppApex2` is not a unique-four center, so it is nobody's chosen blocker |

## 3. Recorded obstructions

All PROVEN or EMPIRICALLY VERIFIED as stated in their sources.

- Local 4+4 concentric geometry at one apex is satisfiable; no bank theorem
  sends the branch to `False`
  (`scratch/p97-search-lane/exact11-two-radius-branch-audit-20260731.md`).
- Strongest direct consequence found is `6 ≤ S.oppCap2.card`; the ingress
  packet supplies one cross-hit only; the four strict-interior hits cannot be
  forced to include a good outside source by counting (memory audit
  2026-08-06).
- Pair-deletion global-survival route is refuted: global survival after a pair
  deletion forces a mutual-blocker pair, which nothing supplies
  (`lean/scratch/d-package-bank/REPORT.md`, `D1GlobalSurvival.lean`, 95
  sorry-free scratch theorems, build state against current HEAD unverified).
- The equality-only pattern language admits the package (D-R SAT probes,
  `computational-closure-plan-2026-07-28.md:6817`), so a proof needs metric or
  convex-order content.
- Declaring the branch vacuous was audited and rejected
  (`docs/audits/2026-07-27-lean-source-wide-simplification-strengthening-audit.md:721`).

Candidate routes recorded but unfinished:

1. angular exposed-vertex argument on the eight concentric points
   (`docs/erdos-97-descent-prose-proof-atomic.md` §16.5.C3, OPEN);
2. occurrence of the three-cyclic-rows Kalmanson core
   `false_of_one_k1_three_cyclic_selected_rows`
   (`docs/audits/2026-07-26-exact-four-post-card-eleven-robust-closure-plan.md:507`);
3. two-radius analogue of the five-class mutual-omission producer
   (`docs/solve-prompts/2026-07-28-d-round1-response-b.md:152`).

## 4. Exact-12 rigidity

Arithmetic consequence of checked lemmas; PROVEN in Lean 2026-09-01 as
Phase 2 item L1 (`ATail/FrontierLiveClosure/TwoRadiusExactTwelveProfile.lean`).

From `CounterexampleData.capSum` (`surplus + opp1 + opp2 = card + 3`),
`capInteriorByIndex_card_add_two`, the two-member interior bound on both
classes, `4 ≤ oppCap1`, and `4 < surplus`:

- `card = 12` forces `(surplus, opp1, opp2) = (5, 4, 6)`;
- only the `secondOpposite` cap-growth arm is consistent;
- the strict second-cap interior has exactly 4 points and
  `twoRichClassSlices_partition_of_capInterior_card_eq_four` splits it 2 + 2
  between the two classes;
- `S.exactFourTwoRadiusAdjacentCapGrid` at `S.oppIndex2` then exists, so each
  class has exactly one point in each adjacent closed cap;
- the first-apex class is exactly `{interior_q, interior_w}` plus one point in
  the closed second cap and one point in the closed surplus cap.

For `card ≥ 13` the three growth arms are all open. In the `secondOpposite`
arm all growth is in the second cap, so the interior slices of the two classes
range over 2 to 4 points each.

## 5. Measure

Measure `M` = number of (cardinality class, cap profile, interior-slice cell)
triples reachable from this leaf that no checked terminal or replayed
certificate covers. Cardinality classes are `{12, ≥13}`; profiles are the
three cap-growth arms; interior-slice cells are the pairs of class interior
counts in `{2,3,4}²`. At base head every triple is uncovered. A checkpoint
counts as proof progress only if `M` strictly decreases and the raw on-spine
`sorry` count does not increase, except as allowed in Phase 3.

## 6. Phases

### Phase 0 — coverage and lane (this checkpoint)

- Anchor the blueprint session on the target.
- Lane checkpoint `.codex/worktree-checkpoints/dr-two-radius-20260901.json`.
- This document.

### Phase 1 — kill-test (computational, discovery gate only)

Question tested first: is the branch refutable from its own binders at all?

Solver lane and approvals (sat-solvers skill policy):

- every SAT stage runs through `piqd` (CaDiCaL, DRAT → LRAT captured by the
  daemon); the metric stage is the existing `piqd` Z3 `QF_NRA` one-shot
  profile used by `b1_exact12_metric_piqd.py`, with no local solver fallback;
- any non-`piqd` invocation (cvc5 `--nl-cov` second opinion, Singular, msolve,
  SymPy certificate replay) needs Adam's per-task approval before it runs;
- every run carries a wall-clock timeout; no cube-and-conquer without a cube
  cap.

Two encodings, run in this order:

1a. Cardinality-independent named-role quotient. Points are only the roles
    the binders name: `a1`, `a2`, `a3`, the eight class points, the four
    first-apex class points, the ingress source, its blocker, and the two
    packet rows, with equality classes allowing coincidences. Convex cyclic
    order is encoded on the named points only, which is sound because a
    subset of a convex-position set is in convex position. A metric UNSAT
    here is at a scope that lifts without an exact-cardinality argument. The
    equality-only version of this quotient is already known SAT (July D-R
    probes), so only the metric stage is informative.

1b. Exact-12 full-carrier cube, profile `(5,4,6)` only, mirroring
    `b1_exact12_structural.py` and its static and metric stages. This is the
    tight diagnostic case; it adds a blocker for every carrier point, which
    encoding 1a cannot name. Encode the full binder block, not a package
    sketch:

- roles `a1 = oppApex1`, `a2 = oppApex2`, `a3 = surplus apex`, interiors
  `I1 = {iq, iw}`, `I2 = {c1, c2, c1', c2'}`, `Is = {s1, s2, s3}`;
- classes `C`, `C'` at `a2` with the 2 + 2 interior split and one hit per
  adjacent closed cap each, distinct radii, no five-class at `a2`;
- first-apex class `C1 = {iq, iw, p2, ps}` with the frontier pair
  `q, w ∈ C1` outside the surplus cap;
- ingress source `s` with blocker `χ(s) ∉ {a1, a2}`, deleted point in `{q, w}`,
  rows `B1` at `χ(s)` and `B2` at `a2` avoiding the deleted point,
  `|B1 ∩ B2| ≤ 2`;
- a blocker `χ(z)` for every one of the 12 points, each blocker a unique-four
  center with an exact four-class containing `z`; `a2` is nobody's blocker;
- every point has at least four equidistant points; convex cyclic order.

Stages: equality-only SAT, static convex checks, then the metric stage on
every surviving cell.

Guardrails applied to both encodings:

- Smoke test before any verdict is trusted: re-encode the closed exact-12
  sibling context of
  `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_twoRadiusPartition`
  and confirm the expected verdict, and re-encode one hand-checked SAT
  instance.
- Cut admission record: every hard-clause block names the Lean theorem or
  definition it images, or declares itself a relaxation. Blocks expected: cap
  partition and adjacent one-hit bounds, `CriticalShellSystem` blocker
  existence and uniqueness, `FullyDeletionRobustAt`, no-five, the ingress
  packet fields, `ConvexIndep` cyclic order. No block may image an open
  `sorry`.
- Every verdict is reported as CONJECTURE until the encoding-to-claim map
  has been adversarially audited by a second reader.
- SAT models are read back independently and replayed in exact rational
  arithmetic; a model that fails replay is not a witness.
- UNSAT is reported only at the scope encoded: quotient scope for 1a, exact
  12 for 1b.

Decision rule:

- 1a metrically UNSAT on every cell → the strongest outcome; Phase 3 targets
  the quotient directly and Phase 4 shrinks to the occurrence theorem for the
  named roles.
- 1a SAT, 1b UNSAT on every cell → Phase 3 at exact 12; the 1a witness
  records which global coupling the quotient lacks and seeds Phase 4.
- 1b has a cell that is metrically feasible with every hypothesis encoded →
  stop, report, and propose an upstream re-split; the branch does not close
  from its binders at size 12.
- feasible only because a hypothesis was omitted → add it, record the
  addition in the cut admission record, rerun.

Deliverables: manifests under `scratch/runs/dr-two-radius-20260901/<run-id>/`
with `run_manifest.json`, `promotion_eligible = false` until Phase 3.

Status 2026-09-01: encoding 1a is SAT at the principal all-distinct cell
with `B2 = X`, by an exact rational witness replayed over Q
(`census/card_head/dr_two_radius_quotient.py`, audit
`docs/audits/2026-09-01-dr-two-radius-quotient-wave.md`). Z3 QF_NRA through
PIQD is compute-blocked on the full quotient and on an 18-atom geometric
negative control, so it is not the UNSAT instrument for 1b. Next per the
decision rule: encoding 1b. Its UNSAT side must come from Lean-provable
counting/order arguments or from an algebra engine that needs approval.

Status 2026-09-01, later: encoding 1b (`census/card_head/dr_exact12_structural.py`,
spec `docs/specs/p97-dr-two-radius-exact12-cell-v1.md` sections 3a and 3b)
is SAT at the incidence level (wave 1) and after the three label-generic B1
geometry rules (wave 2, models replay). Wave 3 adds every label-generic
`Census554` core, eight order cores on the fixed cyclic order (within-cap
orders WLOG), and a piqd session loop with lazy seven- and eight-label cores
and survivor enumeration (`census/card_head/dr_exact12_session_loop.py`).
Results in the audit document. The structural stage cannot express the
metric coupling of twelve four-classes on twenty degrees of freedom; the
metric UNSAT side remains gated on an approved algebra engine.

### Phase 2 — Lean positive controls (on spine, cheap)

Each item narrows the leaf and is needed by Phase 3 in any outcome.

- L1 DONE 2026-09-01: `exactTwelve_profile_of_twoRadiusBranch` (interiors
  `3, 2, 4`), `exactTwelve_capProfile_of_twoRadiusBranch` (`5, 4, 6`),
  `four_le_oppInterior2_card_of_twoRadiusRows` (from the two radii alone),
  and `exactTwelve_secondOppositeCapGrowth_of_twoRadiusBranch` (the
  `secondOpposite` profile packet; the other two arms' data refuted).
  Module `ATail/FrontierLiveClosure/TwoRadiusExactTwelveProfile.lean`,
  sorry-free, standard axioms; not imported by the spine yet.
- L2 `secondCapInterior_partition_of_twoRadiusBranch_exactTwelve`: the 2 + 2
  split via the existing partition theorem.
- L3 `exactFourTwoRadiusAdjacentCapGrid_oppIndex2_of_twoRadiusBranch_exactTwelve`
  via the index-generic grid constructor.
- L4 first-apex class census at exact 12.
- L5 port of the sorry-free scratch bound `d1_secondOppCap_card_ge_six`
  (`lean/scratch/d-package-bank/DPackageBank.lean:1253`) after a fresh
  elaboration and axiom check.

None of these may be committed as a wrapper network; each must be consumed by
the Phase 3 ingress or by the leaf itself.

### Phase 3 — exact-12 closure through structural certificate ingress

Rewritten 2026-09-01 after waves 3 to 5: the card-12 leaf closes at CNF
scope with the hard D-R blocks plus two order families, so no metric
(Nullstellensatz) certificate is needed for card 12; that route moves to
Phase 4 only if a growth arm needs it.

Finite representation: the two-family CNF of wave 5 (base incidence CNF +
`two_circle_same_arc` + `five_point_circle_isosceles_order`, 254,412
clauses, sha256 `e29d1b26…`) over the 2145 relation variables
`eq(e, e')` and the D-R selectors. Its UNSAT is reproduced from scratch
(job `ad966d3c…`) and each family is necessary (one-family controls SAT).

Lean route, in dependency order; every item names its consumer.

- P3.1 Boundary order. `ZeroCutBoundaryIndexing.exists_with_capBlocks D S`
  (`Census554/ZeroCutBoundaryIndexing.lean:206`, sorry-free, needs only
  `CounterexampleData` and `SurplusCapPacket`) gives a `BoundaryIndexing`
  with the surplus apex at index 0 and the three cap interiors in direct or
  mirror blocks. Consumer: P3.4. This discharges skeptic item f2; no new
  order theorem is needed, only the label-to-index map of the encoder's
  `CYCLIC_ORDER` under the direct/mirror dichotomy (mirror = reversed
  order; the encoder's order-family instance sets are reversal invariant).
- P3.2 DONE 2026-09-01 as `Census554.CyclicOrderDistanceCores.
  false_of_two_circle_same_arc` (dist level, `iq < iv`, same-arc as a
  between-iff). Original item: `FourPointTwoCircleBisectorOrderBridge.
  false_of_three_rows_and_cyclic_subsequence` (`Census554/…Bridge.lean:159`,
  off-spine module, sorry-free) already kills `q, u, y, v` in cyclic order
  on a faithfully realized convex carrier; the wrapper states it on the
  encoder's clause `¬(qu = qy ∧ uv = yv)` for `u, y` on one arc of `qv`.
  Consumer: P3.4.
- P3.3 DONE 2026-09-01 as `Census554.CyclicOrderDistanceCores.
  false_of_circle_isosceles_cyclic` (dist level, `CyclicFive` pattern or its
  reverse; no re-cut needed). Original item: rotate the indexing with
  `exists_isCcwConvexPolygon_cyclicShift_at_zero` (`ConvexCyclicOrder/
  Basic.lean:196`) so the five labels are linear; the encoder's predicate
  (W and X on opposite sides of `FZ`, `FX` crossing `PZ`) holds exactly for
  the cyclic patterns `W, F, P, X, Z` and its reverse `Z, X, P, F, W`, which
  after rotation are the linear chains consumed by
  `FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw` (negative
  signs) and by `FivePointCircleIsoscelesOrderCore.false_of_core` with
  `hneg_of_ccw` on the reversed chain (positive signs; chords cross by
  `CapCrossingKalmansonBridge.exists_mem_openSegment_diagonals_of_ccw` with
  the roles `Z, X, P, F`). Consumer: P3.4.
- P3.4 Valuation theorem. From the branch binders, `D.A.card = 12`, L1 to L4
  and P3.1 to P3.3: every clause of the two-family CNF holds under the
  valuation `eq(e, e') := dist e = dist e'` on the 12 labelled points, with
  the D-R selectors read from the packet (source, deleted point, `B2`,
  blockers, the `X`/`Y`/`U` classes). The `dist`-level statements of the two
  cores are used directly (skeptic f5): `RowPattern` is not the carrier of
  this valuation. Consumer: P3.5.
- P3.5 Certificate replay. Store a checked, zero-RAT LRAT of the two-family
  CNF (`piqd` job `bdbe81da…` or a `cadical --plain` rerun through `piqd`
  if the proof has RAT lemmas), normalize it, and replay it with the
  project's checkpointed RUP checker (`P97/Certificate/CheckpointedRup*.lean`)
  per the lean-usage generated-proofs procedure. Consumer: the leaf theorem
  at card 12 through P3.4 (UNSAT of the CNF + a valuation satisfying every
  clause gives `False`).
- P3.6 Split the leaf into `card = 12` and `13 ≤ card` in the checkpoint
  that closes `card = 12`, so the on-spine `sorry` count does not rise;
  independent promotion verifier and math-skeptic audit before any
  promotion claim; transitive axiom audit of the leaf.

Alternative to P3.5, to be tried first because it may be far smaller: mine
the clause-level core of the two-family UNSAT (the LRAT's referenced input
clauses, then a deletion shrink on a session). If the core is a few dozen
clauses over a handful of labels, state it as one finite lemma over the
named roles and prove it directly, with P3.1 to P3.4 as its hypotheses; the
certificate replay is then unnecessary for card 12.

### Phase 4 — carrier size at least 13

- Extract from the size-12 certificates the smallest infeasible sub-pattern
  and state it as a cardinality-generic Lean core over boundary indices, in
  the style of `false_of_one_k1_three_cyclic_selected_rows`.
- Prove an occurrence theorem from the branch binders per growth arm, starting
  with `secondOpposite`, where all growth is confined to the second cap.
- If the core does not occur in some arm, report the exact missing incidence
  and stop; do not add off-spine lemmas.
- Generalizing `exists_fourHits_radialCyclicOrder_oppIndex1` to `oppIndex2`
  is a bounded Lean task, to be done only if the extracted core uses the strict
  cross-distance inequality.

## 7. Effort

In sessions: Phase 0 + 2 together, one. Phase 1, one to two. Phase 3, one
to two. Phase 4, unknown, at least three. {{UNVALIDATED}} until Phase 1
reports.

## 8. Gates

- `uv run python scripts/check_worktree_hygiene.py check --lane dr-two-radius-20260901 --staged`
  before every commit; stage exact owned paths only.
- Fresh `proof-blueprint spine` after every Lean change; a green
  `lake-build` alone is not evidence.
- Solver results are diagnostic until replayed through the Lean-ingress gate.

Status 2026-09-01, wave 4/5. Phase 1b closed at CNF scope: the structural
formula (wave 3) is UNSAT, and the family-level minimal core is
`{two_circle_same_arc, five_point_circle_isosceles_order}` over the hard
D-R blocks (wave 4; standalone two-family CNF and its one-family controls
in wave 5). The second-reader audit found no over-strong family and fixed
citations. Phase 2/3 now targets exactly: L1 assembly, the cap-block
boundary order, the same-arc and isosceles wrappers, and the `dist`-level
core restatements (audit, second-reader section). Guardrail 5 open until a
checked LRAT is stored (wave-5 job or the resubmitted wave-3 job).

