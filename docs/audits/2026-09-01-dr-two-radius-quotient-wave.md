# D-R two-radius branch: named-role quotient wave (Phase 1a)

Date: 2026-09-01. Lane `dr-two-radius-20260901`. Plan
`docs/plans/2026-09-01-dr-two-radius-branch-closure.md`, Phase 1a.

Status: Phase 1a settled SAT by an exact witness; Phase 1b structural waves 1 and 2 SAT; wave 3 (all label-generic Census554 cores, fixed cyclic order) UNSAT in a piqd session and in a one-shot job (no stored proof yet; resubmitted); wave 4 minimal family core = {two_circle_same_arc, five_point_circle_isosceles_order}; wave 5 standalone two-family CNF UNSAT from scratch (360.8 s), one-family controls SAT; no checked proof stored yet (piqd proof pipeline failing silently; daemon restarted with logging, jobs rerunning). No
result here closes a Lean theorem, supplies coverage, or authorizes removing
the live `sorry` at `Rigid221Closure.lean:1245`. Every verdict below is CONJECTURE-level
evidence about one encoding until a second reader audits the
encoding-to-claim map.

## Encoder

`census/card_head/dr_two_radius_quotient.py` (tests in
`census/card_head/tests/test_dr_two_radius_quotient.py`, 19 tests).

Named roles (all distinct carrier points in every cell of this module):
`a2 = oppApex2` (gauge origin), `a1 = oppApex1` (gauge `(1,0)`),
`a3 = surplusApex`, `U0..U3` (exact class at `a1`; `U0 = interior_q`,
`U1 = interior_w`), `X0..X3`, `Y0..Y3` (the two exact classes at `a2`),
`B1_0..B1_3` (row at the source's blocker; `B1_0 = source`), `c1` (that
blocker), optional `Z0..Z3` when the second ingress row is a third class.
The MEC centre and squared radius are auxiliary real variables.

Atom families and their Lean images are the module's
`SOURCE_CLAUSE_LEDGER`; facts the quotient cannot assert are
`OMITTED_FACTS` and are checked on every exact model at readback. The
derivation `source ∈ B1` (from `CriticalShellSystem.no_qfree`) is recorded
there as a derived identity.

Cyclic order convention: `a1, Is, a2, I1, a3, I2` in one boundary orientation
(up to reversal), from
`CapTriple` endpoint membership (cap `i` has endpoints `v_{i+1}, v_{i+2}`).
Cap membership is asserted directly through `OnArcOpposite` sign products,
not only through the order.

The generic cell (`generic-x`) has 20 carrier points, 43 real variables,
717 atoms (360 convexity, 190 distinctness, 60 exactness, 12 row
equalities). Free coordinates after the gauge: 39; equalities: 15.

## Runs (all through `piqd`, Z3 4.17.0, QF_NRA one-shot, no local fallback)

Run root `scratch/runs/dr-two-radius-20260901/q1a-wave-1`:

| cell | control | atoms | verdict | solve time |
|---|---|---:|---|---:|
| generic-x | five-at-second-apex (full system + one equality) | 718 | UNSAT | 2 ms |
| generic-x | duplicate-center (full system + two equalities) | 719 | UNKNOWN | 611 s (budget 600 s) |
| generic-x | none | 717 | UNKNOWN | 930 s (budget 900 s) |

Reading. The first control shows the exactness family is live and that
PIQD custody, receipts, and result shaping work. The two UNKNOWNs are the
nlsat stall the QF_NRA reference describes: 43 real variables with 360
strict orientation atoms are beyond a one-shot budget, for UNSAT and SAT
alike. A timeout is the absence of a verdict, not evidence for either side.

Run root `scratch/runs/dr-two-radius-20260901/q1a-wave-2` (reduced
five-point controls built from the same atom generators):

| cell | control | atoms | declared reals | verdict | solve time |
|---|---|---:|---:|---|---:|
| generic-x | duplicate-center (three points equidistant from two centres) | 18 | 43 | UNKNOWN | 301 s (budget 300 s) |
| generic-x | small-sat (three points on one circle, convex with two apexes) | 31 | 43 | SAT, algebraic model | under 1 s |

Reading of the reduced controls:

- The negative control is a genuine geometric UNSAT (two distinct circles
  share at most two points), not a syntactic one, and Z3 4.17.0 nlsat does
  not settle it in 300 s. The Z3 one-shot route is therefore not a usable
  UNSAT instrument for this lane at any size; the only UNSAT it produced
  (`five-at-second-apex`) was a syntactic clash with the exactness family.
  A rerun with only the twelve mentioned reals declared (`q1a-wave-3`,
  budget 300 s) is UNKNOWN as well, so the spare declarations were not the
  cause.
- The positive control returned SAT with the model `x_9 = root-obj(4x² − 7, 2)`
  (an algebraic number). The exact-rational verifier rejected it as
  `non-rational-readback`, as designed; the first run of the encoder then
  treated that rejection as a failure and discarded the custody tree. The
  encoder now publishes such a result with classification
  `Z3_SAT_ALGEBRAIC_MODEL_NOT_RATIONALLY_REPLAYED_DIAGNOSTIC`: a bare solver
  SAT, never a verified witness. The rational witness for this control is
  the hand-checked pentagon in the tests, replayed exactly.

Consequences applied in the same checkpoints:

- Reduced controls now declare only the reals their atoms mention (the
  journal for `generic-x`/`none` still declares all 43).
- The `source_digests` of the `q1a-wave-1` and `q1a-wave-2` run manifests
  were refreshed after the encoder edits; the published custody trees under
  `*/artifacts/*` carry the exact executed encoder bytes as
  `implementation-0000` snapshots.

## Constructive exact witness (no solver)

`witness` subcommand. The Moser triangle is fixed as `a2 = (0,0)`,
`a1 = (1,0)`, `a3 = (1/2, -6/7)` with rational circumcentre
`(1/2, -665/2352)`; every class point is a rational point of its class
circle (Pythagorean parametrisation), so every equality holds exactly by
construction. A float search over the same parametrisation (class radii,
the blocker `c1`, its row radius, one angle per class point) maximises the
smallest normalised slack of the strict atoms: the within-cap order is read
off the current configuration and frozen, a bounded trust-region
least-squares solve drives hinge residuals of every strict atom to zero,
the order is re-read, and the loop repeats until stable. The parameters are
then rationalised (`limit_denominator(10000)`) and every atom is replayed
with `Fraction` arithmetic by the same `replay_atoms` the PIQD verifier
uses. Only an exactly replayed configuration is returned.

History: a uniform random sampler (2000 trials) found nothing; SLSQP on the
epigraph form converged to worse points than its start; the hinge
least-squares form stalled once on two coincident row points (the
edge-normalised convexity margin was singular there, now floored at 0.02)
and once on the enclosure atoms of the three Moser vertices, which sit on
the circle by construction and were wrongly counted as zero-margin atoms.

Result (`certificates/p97_dr_two_radius/witness-x-exact-witness.json`, also
under `q1a-wave-2/artifacts/`; seed 0,
restart 8 of the randomised restarts; the designed restart 0 now starts
from its parameters and replays in a few seconds):

- EMPIRICALLY VERIFIED, exact over Q: a 20-point configuration realising
  the principal all-distinct cell with `B2 = X`, all 717 asserted atoms
  replayed, smallest normalised margin 0.33 (worst family: distinctness,
  two points about 0.01 apart).
- Realised cell: `Is = X2, B1_1, Y2, c1, U3`; `I1 = U0, U1, B1_2, Y3, X3`;
  `I2 = U2, Y0, X0, X1, Y1, B1_0, B1_3` (counterclockwise from a1, a2, a3
  respectively). Class radii about 0.964 (`U`), 0.982 (`X`), 0.964 (`Y`);
  the blocker `c1 ≈ (0.133, 0.010)` sits in the surplus cap next to `a2`
  with row radius about 0.84, so its row lies near `a1`.
- Omitted-fact readback on the witness: no five-class at `a2` (class sizes
  4, 4, then singletons); the `U` radius is the unique four-radius at `a1`;
  the `B1` radius is the unique four-radius at `c1`. The named points other
  than `a1`, `a2`, `c1` carry no four-class, and `X`, `Y` have no named
  unique-four blocker because `a2` carries two four-classes: these are
  exactly the facts the named-role quotient cannot express (blockers of the
  unnamed carrier points; the exact-12 count).

Reading. Phase 1a is SAT: the named-role facts the Lean binders expose,
with metric exactness and convex position on the named points, do not force
a contradiction. Any closure of the branch must use what the quotient omits:
the blocker of every carrier point (`CriticalShellSystem` at unnamed
points), the exact carrier count, or the a2-blocker exclusion interacting
with those. By the plan's decision rule the lane moves to encoding 1b
(exact-12 full carrier, profile (5,4,6)).

The `Z`-role cell (a third exact class at `a2` as the second ingress row,
24 points, 1028 atoms) is realizable as well:
`certificates/p97_dr_two_radius/witness-z-exact-witness.json`, designed
restart 0,
smallest normalised margin 0.25, all 1028 atoms replayed over Q, three
four-classes at `a2` and no five-class.

## Phase 1b, wave 1: exact-12 structural CNF (piqd CaDiCaL)

Encoder `census/card_head/dr_exact12_structural.py` (tests
`census/card_head/tests/test_dr_exact12_structural.py`, 7 tests), built to
`docs/specs/p97-dr-two-radius-exact12-cell-v1.md`: the equality relation on
the 66 edges of the 12 labelled points (2145 relation variables,
transitivity, duplicate-three-point-center) plus the D-R blocks as
cardinality and exclusion clauses on the induced classes. 6281 variables,
252,432 clauses. No geometry deltas, no cyclic order. Run root
`scratch/runs/dr-two-radius-20260901/q1b-wave-1` (raw-DIMACS jobs through
`piqc job submit-cnf`, backend cadical, budget 600 s).

| CNF | piqd job | verdict | wall |
|---|---|---|---:|
| five-at-second-apex control (ten units asserting a five-class at `a2`) | `b1d14f34…` | UNSAT | 91 ms |
| base | `8098fedb…` | SAT | 577 ms |

Readback of the SAT model (`artifacts/base-sat-pattern.json`): every clause
replays; the independent checker `check_pattern` reports no violation. The
pattern has `X = {5,7,10,11}`, `Y = {4,6,8,9}` at `a2`, `U = {5,6,7,9}` at
`a1`, source `a2` with blocker `10`, deleted `6`, `B2 = X`; it also has
six-point classes at `a3` and at `3`, which no convex 12-gon realises.

Reading. The pure incidence abstraction at card 12 is satisfiable
(EMPIRICALLY VERIFIED at the CNF level; UNSAT of the control is the
counting guardrail from the plan). The branch, if it closes at card 12,
closes through geometry: the perpendicular-bisector and circumcenter
consequences of convex position (the B1 G/C deltas, after a
label-genericity audit) and the metric stage. Next wave: add the
label-generic geometry deltas, enumerate surviving patterns under a cap
with blocking clauses, and feed each to the constructive metric search.

## Phase 1b, wave 2: label-generic geometry nogoods (piqd CaDiCaL)

Audit of the B1 static layers (`b1_exact12_static_geometry`,
`b1_exact12_static_convex`): the three rules that quantify over all labels
are label-generic, and their Lean sources need only an injective
realization (`Realizes`) plus, for the bisector rule, `ConvexIndep`, both
supplied by `CounterexampleData`; the six literal finite cores are
B1-mined label instances of general theorems and were not imported. The
encoder (`p97-dr-exact12-structural-cnf/v2`) adds `perp_bisector` (7,920),
`equilateral_bisector` (95,040) and `equilateral_chain_bisector` (665,280)
as all-negative clauses; a differential test reproduces the B1 generators
clause for clause, and the regular 12-gon satisfies every family. The wave-1
model violates 29 bisector and 12 equilateral clauses.

Run root `scratch/runs/dr-two-radius-20260901/q1b-wave-2`:

| CNF | piqd job | verdict | wall |
|---|---|---|---:|
| base + three generic rules (1,020,672 clauses) | `64de1f83…` | SAT | 1.8 s |

Readback (`artifacts/base-sat-pattern.json`): every clause replays, the
checker reports nothing; 258 true relation variables; `X = {5,7,10,11}`,
`Y = {4,6,8,9}`, `U = {5,6,7,9}`, source `a2` with blocker `9`, deleted
`6`, `B2 = X`; a seven-point class at `a3`. The structural residual is still
wide: the three rules prune, the model moves.

## Phase 1b, wave 3: all label-generic Census554 cores and the cyclic order

Spec section 3b. The encoder now carries 25 clause families (4,067,694
clauses): the eager cores with at most six labels, eight order cores
instantiated on the fixed cyclic order (within-cap orders WLOG; sign
convention independent), and six lazy seven- and eight-label cores checked
against models by a vectorised checker. The regular 12-gon in the cyclic
order satisfies every family and triggers no lazy core. Run root
`scratch/runs/dr-two-radius-20260901/q1b-wave-3`, driven by
`census/card_head/dr_exact12_session_loop.py` on a piqd CaDiCaL session
(`artifacts/loop-log.jsonl`, `survivor-*.json`, `loop-summary.json`).

Result (session `receipts.json`, solve 1, base 4,067,694 clauses, sha256
`d57df331…`): UNSAT in 127 s on the eager CNF alone; no lazy core was ever
consulted, no survivor. The identical CNF (blob `182909cb…`) ran as the
one-shot raw-DIMACS job `4564e28a…` (default profile, 600 s): UNSAT in
244.6 s, independently reproducing the session verdict, but the job stored
no proof. Its transcript (`events/proof-job-4564e28a-log.txt`) ends at the
proof-free discovery run; the job completed 2651 s after confirmation, so
the DRAT replay (same 600 s budget, `--unsat`, proof tracing) or the
drat-trim pass that follows it failed, and the daemon log for this period is
empty. Resubmitted as job `9e243936…` (profile `unsat`, 3600 s; same blob,
`artifacts/submit-none-unsat-t3600.txt`); it finished UNSAT in 223.6 s
with no stored proof (the LRAT compaction cap, see wave 5). Until a checked
proof is stored the verdict is three agreeing unchecked UNSATs (Guardrail 5
open).

Reading (CONJECTURE, scope: this CNF at card 12). Hard-clause audit per
Guardrail 4: every family names a proved Lean source except (i) `ingress`,
which is a declared relaxation (weaker than the source, so it cannot cause a
spurious UNSAT), (ii) the within-cap order fixed WLOG by the relabelling
symmetry of the base CNF, (iii) the side/arc bridge, proved in `ArcBlockContiguity.lean` (reachable
from the aggregator through `SurplusM44Packet/Shard01`), whose cap-block
boundary-order wrapper for this carrier is not written, and (iv)
`five_point_circle_isosceles_order`, whose chord-crossing bridge
`FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw` is proved for the
linear order `W < F < P < X < Z` while the wrapper from the cyclic predicate
was open at that time (proved later the same day, see "Phase 3, P3.2 and
P3.3" below). Next: a family-level
minimal core (assumption selectors per family in one session) to learn which
theorems the Phase 3 ingress must cover and whether (iv) is needed at all;
then the encoding-to-claim map goes to a second reader.

## Phase 1b, wave 4: family-level minimal core

Spec section 3c. Run root `scratch/runs/dr-two-radius-20260901/q1b-wave-4`,
driven by `census/card_head/dr_exact12_family_core.py`: the wave-3 CNF with
one selector per selectable family (19 selectable, the rest hard), one piqd
CaDiCaL session, first solve under all selectors, then a deletion shrink
over the returned family core, trying `five_point_circle_isosceles_order`,
`two_circle_same_arc`, the six order cores and `convex_rhombus` first.

Result (`artifacts/family-core-summary.json`, 13 session receipts): the
first solve, under all 19 selectors, is UNSAT in 484 s with an assumption
core of 15 families (`six_point_five_row_interlock`,
`six_point_six_row_interlock`, `six_point_circle_chain_order`,
`convex_rhombus` unused). Dropping `five_point_circle_isosceles_order` or
`two_circle_same_arc` makes the formula SAT (12 s, 6 s). Every other family
of the core drops in turn while UNSAT persists, in the order
`convex_five_point`, `nested_equal_chord`, `six_point_two_circle_order`,
`six_point_two_circle_arc_overtake_order`, `duplicate_three_point_center`,
`equilateral_bisector`, `hinge_five_cycle`, `hinge_six_double_spoke`,
`hinge_six_tail`, `perp_bisector` (11 s to 189 s each). Outcome
`MINIMAL_CORE`:

| minimal family core | Lean source |
|---|---|
| `two_circle_same_arc` | `FourPointTwoCircleBisectorOrderCore.false_of_core_of_same_side` + same-arc-to-same-side bridge |
| `five_point_circle_isosceles_order` | `FivePointCircleIsoscelesOrderCore.false_of_core` / `_of_neg` via `FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw` + cyclic wrapper |

Reading (CONJECTURE, scope: this CNF at card 12). With the hard blocks
(transitivity, `second_apex_rows`, `first_apex_class`, `k4_everywhere`,
`blockers`, `ingress`) fixed, two order families suffice for the
contradiction, and each is necessary given the other. Both are order cores
on the fixed cyclic order, so the whole structural contradiction at card 12
runs through the boundary order of the carrier; the equality-only cores
(`equal_k4`, the hinge and interlock families, `perp_bisector`) are not
needed. This is one irreducible family set, not the unique or smallest one.
The Phase 3 ingress therefore needs exactly: the cap-block boundary order
(skeptic item f2), the two bridges named in the table, and the structural
assembly L1 (item f1).

## Phase 1b, wave 5: the two-family core as a standalone CNF

Run root `scratch/runs/dr-two-radius-20260901/q1b-wave-5`. The encoder's
`--family` filter builds the base incidence CNF plus exactly the two core
families (254,412 clauses, sha256 `e29d1b26…`; 7,920 isosceles-order and
1,980 same-arc clauses) and the two one-family controls. One-shot
raw-DIMACS jobs, default profile, 3600 s:

| CNF | job | verdict | wall |
|---|---|---:|---:|
| base + `two_circle_same_arc` only (246,492 clauses) | `2132db19…` | SAT | 0.8 s |
| base + `five_point_circle_isosceles_order` only (252,432 clauses) | `38e2a8cc…` | SAT | 0.7 s |
| base + both (254,412 clauses) | `ad966d3c…` | UNSAT | 360.8 s |

The two controls confirm from scratch that neither family alone closes the
formula, and the standalone job reproduces the session's two-selector UNSAT
from scratch. The standalone two-family job is the certificate target: a
checked LRAT on a 254k-clause CNF replaces the 4M-clause wave-3 proof for
Guardrail 5, and the wave-3 formula contains this clause set.

Proof capture: job `ad966d3c…` also stored no proof (718 s from
confirmation: 361 s discovery, about 357 s replay, then an immediate
pipeline failure). The daemon had been started without `RUST_LOG`, so its
`warn`-level "proof pipeline failed" lines were never written; it was
restarted with `RUST_LOG=info` (no live sessions, only job `9e243936…`
running, which the restart requeued), and the two-family CNF was resubmitted
as job `bdbe81da…` (profile `unsat`, 3600 s) so the failure reason is
logged. Job `bdbe81da…` then showed the reason (daemon log, 01:19 UTC):
discovery UNSAT in 114 s, proof replay UNSAT in 125 s, drat-trim accepted
the DRAT (the pipeline only reaches compaction after `s VERIFIED`), and
the compaction step refused the LRAT: `piqd-lrat parse: parse resource
Bytes exceeded: observed 1950757765, limit 268435456`. So the two-family
proof was checked by drat-trim inside piqd but not retained (the 1.95 GB
LRAT exceeds the compactor's 256 MB cap, and the work directory is
discarded). The wave-3 job `9e243936…` finished UNSAT (223.6 s) with no
stored proof in the same way. Guardrail 5 therefore stays open in the sense that no artifact is
stored; retaining one needs either a larger compaction cap in piqd (a
change outside this repository) or a manual `cadical --plain` + drat-trim
run, which is a non-piqd solver run and needs Adam's approval.
{{NEEDS_ADAM_INPUT}}


## Phase 1b, waves 6 and 7: clause-level cores of the two-family CNF

Goal: a selector core finer than the family level, as a candidate for the
Phase 3 finite lemma. Both runs use `dr_exact12_family_core.py` on the
wave-5 two-family CNF (base hard families plus `two_circle_same_arc` and
`five_point_circle_isosceles_order`), one piqd session each, solver
`SESSION_SOLVER`, deletion shrink after the first solve.

| Wave | Selectors | Budget per solve | First solve | Outcome |
|---|---|---|---|---|
| 6 (`--by-group`, root `q1b-wave-6`) | 1,287 (`family:label-set`: 495 same-arc, 792 isosceles) | 900 s (two accidental parallel launches), then 3600 s (session `24d5736c…`) | UNKNOWN at 900 s, 900 s, and 3600 s | UNDECIDED; no core |
| 7 (`--coarse`, root `q1b-wave-7`, session `d4fee929…`) | 78 (`family:coarse`: 66 chords `{q, v}`, 12 centers `W`) | 3600 s | UNSAT in 1,864 s; returned core = all 78 selectors | shrink RUNNING at the time of writing (drop 1 in progress after 24 min) |

Reading (bookkeeping). Assumption-based solving of the same formula is
much slower than the from-scratch job (360.8 s) because the 1,287 or 78
selector literals block preprocessing of the guarded clauses; at the fine
granularity the first solve does not finish within one hour, so no
label-set core exists at this budget. The coarse first solve returned
every selector, so the pruning must come from the deletion shrink, whose
per-drop cost is of the same order as the first solve; a full shrink of
78 drops at this pace is several days of solver time and is not a route
to a small finite lemma. The coarse run is left running for its first few
drops only to measure whether incremental solves are faster; its result,
if any, is reported in a later section. No budget was widened beyond the
3600 s per solve already in use.

Consequence for Phase 3: the certificate route (P3.5) is the primary
route for card 12; the finite-lemma alternative needs a core-extraction
method that does not solve under assumptions (for example the input
clauses referenced by a retained LRAT), which is blocked on proof
retention (see the {{NEEDS_ADAM_INPUT}} item under wave 5).

## Second reader: encoding-to-claim map (math-skeptic, 2026-09-01)

Read-only adversarial pass over spec sections 1 to 3c, the encoder ledger,
and the Lean sources named there. Verdict NEEDS WORK, with these findings.

- No over-strong hard family. Every family of the `none` build is implied
  by the binders of the branch theorem plus `card = 12` and the two order
  bridges; the ingress block is strictly weaker than its source (it admits
  `deleted = a2`, which Lean excludes), and `B2 ∈ {X, Y}` is derived, not
  assumed. The WLOG within-cap order holds: every non-order family is
  invariant under the relabellings inside `Is`, inside `I2`, and `iq ↔ iw`
  (the controls break this, but are not in the audited build). The sign
  convention argument holds: both orientation variants exist for every
  eager order core, and `_forward` on a convex indexing gives a nonzero
  `signedArea2` sign for every distinct triple.
- Citation errors, fixed in this checkpoint: `duplicate_three_point_center`
  now cites `EqualityCore.not_realizes_of_duplicateCenterCore`; the blocker
  exclusion at `a2` cites `FullyDeletionRobustAt.centerAt_ne`;
  `ArcBlockContiguity.lean` is reachable from the aggregator (import walk),
  not unimported; the chord-crossing bridge is proved for the linear order
  (`FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw`) and only its
  cyclic wrapper is open; `perp_bisector` needs `ConvexIndep` and carrier
  membership, not only `Realizes`; "counterclockwise" is now "up to
  reversal".
- Under-strong (harmless for UNSAT): ingress drops `q_survives`,
  `w_survives`, `secondApexDouble`, `actual_blocker_ne_center₁`; blockers
  drop `bisector_center_mem_interior`, minimality, no-M44.
- Lean prerequisites for a Phase 3 ingress, ranked: (f1) the structural
  assembly L1 from the branch binders; (f2) a cap-block boundary indexing
  with the caps contiguous in order `a1, Is, a2, I1, a3, I2` up to rotation
  and reversal (prior art `ZeroCutBoundaryIndexing.exists_with_capBlocks`,
  `FrozenBoundaryOrder`); (f3) a public cyclic-triple sign lemma (the
  existing ones are `private`); (f4) the two wrappers of the wave-4 core;
  (f5) `dist`-level restatements, since `RowPattern` records one class per
  center while the D-R pattern has two classes at `a2`; (f6) the checked
  proof; (f7) a built-tree axiom closure for every cited theorem.

## Phase 3, P3.2 and P3.3: dist-level order wrappers (2026-09-01)

New module `lean/Erdos9796Proof/P97/Census554/CyclicOrderDistanceCores.lean`
(built with `lake-build Erdos9796Proof.P97.Census554.CyclicOrderDistanceCores`,
no `sorry`, no warnings; axioms of every theorem: `propext`,
`Classical.choice`, `Quot.sound`). On one CCW convex-polygon enumeration
`φ : Fin n → ℝ²` (injective; `ConvexIndep` of its image where diagonals are
needed):

- `false_of_two_circle_same_arc`: for `iq < iv`, `u, y` distinct and off
  the chord endpoints, and `u` strictly between `q` and `v` exactly when `y`
  is, the equalities `dist q u = dist q y` and `dist u v = dist y v` are
  contradictory. Kernel `twoCircle_sameSide_reflection_false`; chord sides
  from `signedArea2_pos_of_between` and `signedArea2_neg_of_outside`.
- `false_of_circle_isosceles_cyclic`: for indices in the cyclic pattern
  `W,F,P,X,Z` or its reverse (`CyclicFive`, a five-way disjunction of linear
  chains, so no re-cut of the enumeration is needed), the equalities
  `WF = WX`, `WF = WZ`, `PZ = XZ` are contradictory. Kernel
  `FivePointCircleIsoscelesOrderCore.metric_order_incompatibility`; signs
  from `hneg_of_ccw` through `signedArea2_neg_of_cyclicThree`; the crossing
  of `FX` with `PZ` from `exists_mem_openSegment_diagonals_of_cyclicFour`.

These are the encoder's two clause families at the dist level (the
same-arc predicate is the cyclic non-separation of `{u, y}` by `{q, v}`;
the isosceles instance set was checked by enumeration to be exactly the two
cyclic patterns, 7,920 instances). The module is not imported by any spine
module yet; its consumer is the valuation theorem P3.4. This is
infrastructure for Phase 3, not a change to the obligation frontier.

## Claim boundary

- PROVEN: nothing new.
- EMPIRICALLY VERIFIED (exact over Q, replayed by a test): the principal
  cell of the named-role quotient with `B2 = X` is realizable; encoding 1a
  is SAT at that cell. This is a statement about the encoded quotient, not
  about the Lean obligation: the quotient omits the blockers of unnamed
  points and the carrier count, and the encoding-to-claim map has not been
  adversarially audited by a second reader.
- EMPIRICALLY VERIFIED: one full-system negative control UNSAT in 2 ms
  (syntactic); the reduced geometric negative control UNKNOWN at 300 s twice;
  the reduced positive control SAT with an algebraic model.
- Instrument finding: Z3 QF_NRA one-shot through PIQD is not a usable
  UNSAT oracle for this lane. UNSAT-side evidence for 1b needs either a
  counting/order argument provable in Lean or a Gröbner/CAD engine, which
  needs Adam's approval before it runs.
