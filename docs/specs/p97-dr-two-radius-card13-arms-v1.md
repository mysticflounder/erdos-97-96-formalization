# D-R two-radius branch: card-13 growth-arm structural CNFs (Phase 4 diagnostic) v1

Lane `dr-two-radius-20260901`. Plan: `docs/plans/2026-09-01-dr-two-radius-branch-closure.md`,
Phase 4. Written 2026-09-02.

## 1. Purpose and claim boundary

Target: the on-spine residual
`Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`
(`Rigid221Closure.lean`, binders of the two-radius leaf plus `12 < D.A.card`);
consumer `false_of_exactFourPostCardElevenTwoRadiusBranch`, whose exact
card-12 arm is closed by the two-family CNF replay (plan P3.5, P3.6).

Highest-risk assumption of Phase 4: that the structural route which closed
card 12 (edge-equality relation + D-R hypothesis blocks + the two order
families `two_circle_same_arc`, `five_point_circle_isosceles_order`) still
yields UNSAT once one growth point is added. This spec tests it at card 13,
one CNF per growth arm.

Claim boundary. A model is an equality pattern, not a configuration. An UNSAT
is a statement about one CNF at card 13 for one arm under the cut admission
record in section 4, checked by a `drat-trim` verified proof; it is
EMPIRICAL evidence for the plan, closes no Lean theorem, and is not
promotion eligible. A SAT model is a candidate witness of the missing
coupling and must be replayed against every eager clause and every lazy core
before it is reported.

## 2. Profiles at card 13

`CounterexampleData.capSum`: `surplus + opp1 + opp2 = card + 3 = 16`;
`capInteriorByIndex_card_add_two`: interior = cap − 2. Arm structures in
`ATail/ExactFourRobustCapExpansion.lean:250-266`, plus `6 ≤ S.oppCap2.card`
(plan section 3). Each arm has exactly one profile at card 13:

| arm | (surplus, opp1, opp2) | (|IS|, |I1|, |I2|) |
|---|---|---|
| `secondOpposite` (`ExactFourSecondOppositeCapGrowth`) | (5, 4, 7) | (3, 2, 5) |
| `surplus` (`6 ≤ surplusCap.card`) | (6, 4, 6) | (4, 2, 4) |
| `firstOpposite` (`ExactFourFirstOppositeCapGrowth`) | (5, 5, 6) | (3, 3, 4) |

Labels: `A2 = 0`, `A1 = 1`, `A3 = 2`, then `IS`, then `I1`, then `I2`,
consecutively. Cyclic order `(A1, IS…, A2, I1…, A3, I2…)`, as in
`dr_exact12_structural.CYCLIC_ORDER`. `interior_q`, `interior_w` are the
first two `I1` labels; in the `firstOpposite` arm the third `I1` label is
unconstrained. The growth point is not distinguished from its cap-mates, so
one CNF per arm covers every card-13 carrier of that arm.

## 3. Variables

As in `dr_exact12_structural.build`: edge-equality variables over all pairs
of the `C(13,2) = 78` edges, then `X`, `Y` (rows), `U` (first-apex class),
`K4` selectors, `chi` blocker selectors. No ingress variables unless the
ingress family is requested.

## 4. Cut admission record

Every family names its Lean source or declares itself a relaxation. Families
marked GENERIC are unchanged from the exact-12 encoder except for the label
set and the cyclic order.

| family | content at card 13 | status / Lean source |
|---|---|---|
| `transitivity` | equal-length is an equivalence relation on edges | definition, GENERIC |
| `two_circle_same_arc` | as at card 12 | proved-source, GENERIC (`FourPointTwoCircleBisectorOrderCore.false_of_core_of_same_side` + arc bridge) |
| `five_point_circle_isosceles_order` | as at card 12 | proved-source, GENERIC (`GENERIC_CORES` entry) |
| other `SELECTABLE_FAMILIES` | optional, as at card 12 | proved-source, GENERIC |
| `second_apex_rows` | two rows `X`, `Y`: full class at `A2` (`exact_class`); exactly 4 members; at most 1 in `IS ∪ {A1}`; at most 1 in `I1 ∪ {A3}`; disjoint | `SelectedFourClass.support_card`; `_hnoFive` (a row is the full class at its radius); `_hdisjoint`; `leftAdjacentCap_at_opposite_card_le_one_of_convexIndep`, `rightAdjacentCap_at_opposite_card_le_one_of_convexIndep` (`SurplusM44Packet/Shard01.lean:1064,1079`, any radius, index `oppIndex2`). The interior slice `≥ 2` follows. Card 12 used the stronger exact forms (exactly 2 in `I2`, exactly 1 per adjacent cap); those are exact-12 rigidity and are NOT used here |
| `first_apex_class` | full class at `A1`; contains `interior_q`, `interior_w`; exactly 4 members; at most 1 in `IS ∪ {A2}`; at most 1 in `I2 ∪ {A3}`; unique four-class at `A1` | `OriginalUniqueFourResidual.class_card_eq_four`, `interior_q_mem`, `interior_w_mem`, `unique_K4_radius`; adjacent-cap lemmas above at index `oppIndex1`. Card 12 used exactly 1 per adjacent cap |
| `k4_everywhere` | every label has four equidistant labels | `CounterexampleData.K4`, GENERIC |
| `blockers` | every label has a blocker other than `A2` whose unique four-class contains it; late system sends `U` to `A1` | as in the exact-12 ledger, GENERIC |
| `ingress` | dropped by default (0 of 30,062 clauses in the card-12 core) | RELAXATION when included, as at card 12 |

Cardinality constraints over more than six variables (exactly 4 members
among 12) use subset enumeration; the exact-12 six-variable cap is lifted for
this module only.

Omitted facts: those of `dr_exact12_structural.OMITTED_FACTS`, plus every
exact-12 rigidity fact (`TwoRadiusExactTwelveProfile.lean`).

## 5. Validation oracle

- Legacy mode (`profile = exact12`, exact forms, ingress on, families as
  given) must reproduce the wave-5 CNF byte for byte:
  `scratch/runs/dr-two-radius-20260901/q1b-wave-5/artifacts/cnf-core2-none.cnf`,
  sha256 `e29d1b2646d763425598fe0e5b1364118033b61df5aacdf5b907b6d0dad3bcb0`
  (254,412 clauses, 6,281 variables, families `two_circle_same_arc` and
  `five_point_circle_isosceles_order`, control `none`).
- Control run: the exact-12 profile in generic mode (section 4 forms, no
  ingress). UNSAT expected if the card-12 contradiction does not need the
  exact-12 rigidity facts; SAT would itself be a finding.

## 6. Runs

All solver runs go through `piqd` (raw-DIMACS jobs, backend `cadical`,
profile `default`, timeout 3600 s) under
`scratch/runs/dr-two-radius-20260901/p4-card13-arms/` with a
`worktree-run-manifest/v1` manifest. Order: control, `secondOpposite`,
`surplus`, `firstOpposite`, two families each. UNSAT: retain the job id and
the `drat-trim` verdict. SAT: decode the model, replay the eager clauses,
check the lazy cores, and record the equality pattern; then rerun with every
selectable family before reporting.

Escalation ladder after a two-family SAT (recorded 2026-09-02). The eager
all-families CNFs (7.4M clauses) were UNKNOWN at 3600 s in every arm, so the
escalation runs in two parallel lanes per arm, each under the same
cut-admission record:

- **lazy session loop** (`census/card_head/dr_two_radius_arm_lazy_loop.py`):
  a `piqd` session seeded with the two-family CNF; every SAT model is replayed
  against all 21 `GENERIC_CORES`, only the violated instances are added, and
  a model that violates nothing is a survivor blocked by its x/y/u/chi
  signature (at most 20 survivors, 300 iterations, 600 s per solve);
- **small-eager jobs**: `convex` = the two base families plus
  `convex_five_point` (about 435k clauses) and `small` = the two base families
  plus the eleven selectable families whose eager instance count is at most
  100k clauses (about 674k clauses), one raw-DIMACS job per arm and variant.
  Each CNF is validated by per-family clause-count identity against the
  all-families manifest of the same arm before confirmation.

An eager UNSAT with zero RAT lemmas in the `drat-trim` core decides that arm
at the encoded scope; a lazy-loop survivor that replays clean under all 21
cores decides the route (section 7). Job ids live in
`scratch/runs/dr-two-radius-20260901/p4-card13-arms/events/jobs.json`.

## 7. Decision rule

- All three arms UNSAT: the structural route extends one step; Phase 4 next
  tests card 14 on the `secondOpposite` arm and looks for a cardinality lift
  of the two-family argument.
- Some arm SAT after the lazy-core check: report the witness and the arm; the
  branch needs metric or exact-rigidity content in that arm, and the plan's
  Phase 4 route changes before any Lean work.

## 8. P4.3 cut families beyond the Census554 bank (added 2026-09-02)

A read-only source audit of the facts derivable from the leaf hypotheses
found three families that the encoding lacks and that need no metric
variables: they are static constraints on the existing equality variables
over the fixed boundary order and cap membership. Cut admission record:

| family | clause shape | Lean source | antecedents | status |
|---|---|---|---|---|
| `cap_betweenness` | for each closed cap in boundary order, cap labels j, r, s with pos(r) < pos(s), j ∉ {r, s}, and j not strictly between r and s: unit ¬same(j; r, s) | `CGN.index_strictly_between_of_equidistant` (`CapSelectedRowCounting.lean:51`) through `SurplusCapPacket.capByIndex_cgn4g_capData hconv i` (used the same way at `:305`) | `ConvexIndep D.A` | proved-source; bridge lemma pending: the ordered cap `StrictCapOrder` must be identified with the boundary cyclic order restricted to the closed cap {{NEEDS_PROOF}} |
| `common_pair_localization` | for each cap with opposite apex a and interior Int, s < p in Int, label c ∉ Int with c ≠ a: ¬(same(c; s, p) ∧ same(a; s, p)) | `ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_capInteriorByIndex` (`TwoCenterCapLocalization.lean:121`) | all at the leaf | proved-source |
| `frontier_bisector_interior` | for each label c ∉ I1 ∪ {A1}: unit ¬same(c; interior_q, interior_w) | field `OriginalUniqueFourResidual.bisector_center_mem_interior` (`OriginalUniqueResidualDispatch.lean:66`), previously in `OMITTED_FACTS` | leaf hypothesis `R` | proved-source |

Preflight on the six P4.2 survivors (`artifacts/readback-card13-new-families-check.txt`,
`tmp/new_families_check.py`): every survivor violates `cap_betweenness`
(5 to 8 instances each, in every cap, apex endpoints included); none
violates the other two. So `cap_betweenness` is a cut the Census554 bank
does not contain (one-sided distance monotonicity along a minor cap of the
enclosing circle is not a consequence of convexity alone), and the next
run adds all three families to the `small` eager set.

Also checked and rejected: the audit's suggestion that the exact card-12 row
form (`twoRichClassSlices_partition_of_capInterior_card_eq_four`) removes
two arms outright. In the `surplus` and `firstOpposite` survivors the rows
already partition I2 (the generic constraints force it when |I2| = 4); the
growth point sits in IS (surplus) or I1 (firstOpposite), so that fact adds
nothing there.

Candidates not yet encoded: the cap-crossing Kalmanson chain cores
`false_of_five_ccw_three_shell_equalities`,
`false_of_six_ccw_two_k2_three_selected_rows`,
`false_of_seven_ccw_three_chained_bisectors`
(`ATail/CapCrossingKalmanson.lean:341, 863, 730`; convexity plus a ccw
enumeration), absent from `GENERIC_CORES`. Explicit negatives: no
`RadialCyclicOrder` producer exists at `oppIndex2`, and the `oppIndex1`
producer needs two distinct four-classes at `S.oppApex1`, which
`R.unique_K4_radius` forbids; no theorem relates `rho` and `otherRadius`
by an inequality.

Run record (2026-09-02): `small` + the three families is UNSAT in
`secondOpposite` (2,646 s) and `surplus` (1,735 s) but both proofs failed
the daemon's drat-trim replay (unverified; cause: the replay shares the
discovery timeout and runs under `--unsat`, see the audit; plain-profile
reruns with 7,200 s timed out twice; at 21,600 s the `unsat`-profile job
`ceac0a58…` verified secondOpposite UNSAT on 2026-09-03 03:39Z with a
drat-trim-checked 14.1 GB uncompacted LRAT, 71,510 RAT lemmas in core, so
EMPIRICAL at the encoded scope and not yet RUP-only; the `plain` job
`a1954a67…` verified surplus UNSAT on 2026-09-03 04:00Z with a
drat-trim-checked 14.2 GB uncompacted LRAT and 0 RAT lemmas in core, so
RUP-only and EMPIRICAL at the encoded scope; the remaining surplus and
secondOpposite jobs are in proof replay, `firstOpposite` in discovery);
`firstOpposite` and every `convex` + three-families run is UNKNOWN at
3,600 s. Details in the audit subsection "P4.3". The `StrictCapOrder` bridge has a
design sketch in the plan (Step P4.3): signed-area facts from the cap
packet, converted to `CyclicThree` on the ingress enumeration, then linear
betweenness inside the closed cap interval by arithmetic.

