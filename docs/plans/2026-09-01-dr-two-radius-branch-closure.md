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

Arithmetic consequence of checked lemmas; not yet stated in Lean.
{{NEEDS_PROOF}} as a Lean lemma (Phase 2 item L1).

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

### Phase 1 — exact-12 kill-test (computational, decides the route)

Question tested first: is the branch refutable from its own binders at all?

Build a D-R cell family under `census/card_head/` mirroring
`b1_exact12_structural.py` and its static/metric stages, profile `(5,4,6)`
only. Encode the full binder block, not a package sketch:

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
every surviving cell. Validate the encoding against a known instance before
trusting any UNSAT: re-encode the closed exact-12 sibling
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker_exactTwelve_twoRadiusPartition`
context and confirm the expected verdict.

Decision rule:

- all cells metrically infeasible → Phase 3;
- some cell metrically feasible with every hypothesis encoded → stop, report,
  and propose an upstream re-split; the branch does not close from its
  binders at size 12;
- feasible only because a hypothesis was omitted → add it, record the
  addition, rerun.

Deliverables: manifests under `scratch/runs/dr-two-radius-20260901/<run-id>/`
with `run_manifest.json`, `promotion_eligible = false` until Phase 3.

### Phase 2 — Lean positive controls (on spine, cheap)

Each item narrows the leaf and is needed by Phase 3 in any outcome.

- L1 `exactTwelve_profile_of_twoRadiusBranch`: the Section 4 arithmetic.
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

### Phase 3 — exact-12 closure through certificate ingress

- Emit the Phase 1 certificates through
  `census/p97_search/phase3_qq_certificate_lean_emitter.py` and pass the
  Lean-ingress publication gate.
- Split the leaf into `card = 12` and `13 ≤ card` in the same checkpoint that
  closes the `card = 12` leaf, so the on-spine `sorry` count does not rise.
- Independent promotion verifier plus a math-skeptic audit before any
  promotion claim.

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
