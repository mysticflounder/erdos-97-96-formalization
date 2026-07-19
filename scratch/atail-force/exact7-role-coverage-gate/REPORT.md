# Exact-seven role-coverage gate

Date: 2026-07-18 (lane opened at session takeover fd7b0078)

Status: **L0 (ALL-FRESH) CENSUS COMPLETE: 744 SAT / 256 UNSAT with a
clean landing law; MERGE-LAYER CENSUS RUNNING.**

This lane owns only `scratch/atail-force/exact7-role-coverage-gate/`.  It
continues the exact-seven branch of `DoubleApexOffSurplusSharedRadiusPair`
from the Round 124-156 frontier (see
`~/scratch/docs/closure-round12*.md` through `closure-round156-*.md` and
`scratch/atail-force/exact7-global-coradial-producer/REPORT.md`).

## Finding 1: the fixed-fixture QF_LRA UNSAT is an equilateral-hinge accident

`extract_fixture_unsat_core.py` re-encodes the sibling lane's
`solve_linear_distance_shadow.py` fixture with one tracked marker per
assertion and asks Z3 for a minimized unsat core.  The result
(`fixture_unsat_core.json`) has exactly four constraints:

```text
cls_eq|7|4    dist(7,4) = dist(7,3)   (support-locked class at center 7)
cls_eq|7|8    dist(7,8) = dist(7,3)   (same class)
cls_eq|8|7    dist(8,7) = dist(8,4)   (support-locked class at center 8)
cls_ne|4|7    dist(4,7) != dist(4,8)  (completeness of the class at 4)
```

Centers 7 and 8 each carry the other plus the common point 4 on their
complete critical circles, so `d(7,4) = d(7,8) = d(8,4)` (the shared edge
`7-8` identifies the two radii), forcing `d(4,7) = d(4,8)`; the complete
class at 4 contains 8 and excludes 7.  This is the known equilateral-hinge
/ mutual-membership collapse.  No triangle, Kalmanson, convex-order, or K4
constraint enters the core.

Consequence: the UNSAT of the fixed fixture came from that fixture's
arbitrary `CRITICAL_SUPPORT` choices, not from exact-seven structure.  The
sibling REPORT's "positive evidence that the exact-seven role collision may
make the linear geometry load-bearing" should be read as: one arbitrary
support table happened to contain a hinge.  Coverage over source-faithful
support choices remains genuinely open, and the expected outcome now
includes SAT survivors.

Replay:

```bash
UV_CACHE_DIR=/Users/adam/scratch/.uv-cache \
uv run --no-project --with z3-solver python \
  scratch/atail-force/exact7-role-coverage-gate/extract_fixture_unsat_core.py
```

Verdict-bearing output: `solver_result=unsat`, `core_size=4`,
`families={'cls_eq': 3, 'cls_ne': 1}`, `k4_in_core=False`.

## Finding 2: the aligned exact-seven cap interior is fully named

The closed exact-six slice
(`false_of_fullParentExactFiveAllReverseData_of_secondCap_card_eq_six`)
dies by counting: `five_le_card_of_periodThree_straddles` needs five strict
interior slots and a six-cap has four.  At exact-seven the same counting
saturates instead of overflowing.  Combining the recorded round facts:

- sources `s0,s1,s2` lie in the strict physical cap and `s1` lies strictly
  between `s0` and `s2` in the common strict-cap order (Round 125);
- the three transition blockers are pairwise distinct, lie in the strict
  physical cap, and each straddles its edge (Round 136, production
  all-reverse localization);
- alignment identifies the predecessor blocker with `s1` (Round 119/124);

the five strict-interior slots of the seven-cap are exactly
`{s0, b0, s1, b1, s2}` in the order

```text
endpoint < s0 < b0 < s1 < b1 < s2 < endpoint
```

(up to reflection), with `s1` at the middle slot — matching the Round
109-119 "successor is index 3" occurrence.  The two endpoints are the two
Moser vertices of the physical cap.  PROVEN as a single Lean normal-form
theorem: `Problem97.Round188ExactSevenNamedInteriorNormalForm` in
`/Users/adam/scratch/Round188ExactSevenNamedInteriorNormalForm.lean`
(SHA-256 `6424bc903740a6a98ddaee2f951044722fb325ba47dfe8708fb81f33adeaaa33`,
axiom closure `propext, Classical.choice, Quot.sound`, warnings-as-errors
clean, independently recompiled at takeover session).  Main declarations:

- `aligned_namedInterior_normalForm`: collision `H.centerAt s0 = s1`, the
  ten pairwise inequalities, the five strict-interior memberships, the
  Finset identity `capInterior = {s0, b0, s1, b1, s2}`, and the
  two-orientation shared-order chain
  `s0 < b0 < s1 < b1 < s2  ∨  s2 < b1 < s1 < b0 < s0`;
- `exists_exactSeven_aligned_namedInterior_normalForm`: existential form
  with the strictly-inside-MEC fact, aligned index from Round 124.

No fresh placement fact was needed; sources localize by
`PhysicalVertex.mem_capInterior`, reverse centers by
`transition_successor_actualBlocker_mem_physicalCapInterior`.
Closure doc:
`~/scratch/docs/closure-round188-exact-seven-named-interior-2026-07-18.md`.

Consequence: at exact-seven there are NO anonymous points in the physical
cap.  A finite role-coverage gate over the named system is portable to a
Lean coverage theorem; anonymity is confined to the other two caps.

## Finding 3: no single forced five-point occurrence by hand

The forced membership table (three reverse rows, exact-five class at the
second apex, first-apex role rows) was checked by hand against the
`FivePointCircleIsoscelesOrderCore` pattern.  Every candidate assignment
leaves at least one membership or one cyclic-order premise unforced; the
nearest miss is `(O, e, w, s0, s1)`, which fires only under an arc-position
choice for one exact-five extra member and one outside-pair member.  The
pattern is therefore a sound cut for the gate, not a direct terminal.

## Gate design

Per-schema variables: membership atoms over the named roles (seven cap
points, second apex, exact-five extras, reverse-row outside pairs,
first-apex row members), arc positions of the non-cap roles, identification
pattern among non-cap roles, blockers of the two cap endpoints (Round 152
alternative), same/distinct first-apex radius arms.

Constraint sources, all already-proven and Lean-portable: support-locked
complete classes at blocker values, exact 2+2 reverse rows, cap-chain
strict monotonicity, crossing/ordinal comparisons, cross-cap bisector
injectivity, witness-circle crossing, at-most-two cap hits per row, K4 at
every named center, strict triangle and Kalmanson on the boundary order.

Cut banks (sound clauses, reused from the exact-six gate infrastructure):
equilateral-hinge collapse (this lane, Finding 1 — radius-free, order-free),
five-point circle-isosceles order (Round 186 + Round 183 cyclic transport),
six-point planar terminals (Rounds 170/177).  Survivors go to exact QF_LRA;
QF_LRA-SAT survivors are the branch's genuine residual and must be answered
by geometry the gate does not encode (rank+winding curvature or a new
cross-row occurrence, per Round 166).

## Finding 4: the fixture carries two more accidents; encoder smoke-validated

`gate_encoder.py` implements the DESIGN.md engine core: block-structured
boundary order (ordered blocks + symbolic bags with Z3 integer positions),
strict Kalmanson asserted conditionally on an exhaustive enumeration of
within-bag orderings per cyclic quadruple, complete radius classes,
selected-row equalities, radius distinctions, and K4 disjunctions with an
anonymous-slot escape (trivialized disjunctions are recorded, never
silently dropped).  `smoke_fixture.py` runs five gates through the
production codepath; all five PASS:

- A (fixed order, full fixture): UNSAT, minimized core == the recorded
  4-constraint hinge, label for label;
- C (symbolic within-arc order, full fixture): UNSAT with the same
  order-free hinge core — the conditional-branch machinery neither loses
  nor invents constraints;
- E (fixed order, hinge memberships removed): UNSAT with a NEW sound
  5-constraint core `{cls_eq: 3, kal: 2}` — points 5 and 11 both lie in
  the classes at centers 1 and 2, so both centers sit on the bisector of
  chord (5,11), but that chord does not cross chord (1,2) in the boundary
  order; summing the two strict Kalmanson inequalities gives 0 >= 2.
  This is the cross-cap bisector-parity pattern: the Kalmanson base
  family already implies it, so no separate bisector cut bank is needed.
  DESIGN.md's original smoke-B expectation (hinge-free => SAT) was wrong:
  the fixture's arbitrary supports carry this second accident.
- Hand-checking the fixture's named-role projection found a THIRD
  accident: the fixture identifies the second exact-five extra with the
  b1-row outside point 8, which puts the non-crossing pair {8,12} in the
  classes at centers 1 and 4 — UNSAT by the same parity pattern.  So that
  identification-plus-arc-side class is already a portable gate verdict.
- B/D (named-forced schema, fixed/symbolic): SAT.  The de-accidented
  named system — exact-five class with a fresh extra, the three
  support-locked reverse rows, first-apex fibers with the distinct-radius
  arm, lower/triangle/Kalmanson — does not close by itself, confirming
  the census will have genuine SAT survivors (Round 166) and that the
  encoder does not manufacture UNSAT.

Replay:

```bash
UV_CACHE_DIR=/Users/adam/scratch/.uv-cache uv run --no-project \
  --with z3-solver python \
  scratch/atail-force/exact7-role-coverage-gate/smoke_fixture.py
```

Verdict-bearing output: `ALL SMOKE GATES PASS` plus per-gate verdicts in
`smoke_results.json`.

## Finding 5: L0 all-fresh census — 256/1000 UNSAT with a clean law

The L0 layer (`enumerate_l0.py`: named cap system + O + extras + the three
reverse-row outside pairs, all fresh, landings enumerated per
ENCODER_FACTS.md, within-arc order symbolic) is fully decided: 744 SAT,
256 UNSAT, no timeouts.  Every UNSAT core is pure `{cls_eq, kal}` (sizes
4-10) over named roles only — no uniq4, no cls_ne, no anonymous escape —
so all 256 verdicts are portable in principle.

The dead set is exactly characterized by the landing law

    UNSAT  <=>  O lands on the collision row (r2)  AND
                O lands on at least one blocker row (r0 or r1),

independent of the extras landing (uniform 32/125 over all eight
e-landings).  Mechanism (hand-checked against the cores): with
O ∈ class(s1) and O ∈ class(b0), the pair {O, s0} lies in
class(b0) ∩ class(s1) (s0 is their shared forced source), so both
centers b0, s1 sit on the bisector of chord (O, s0); in the boundary
order both centers lie on the SAME arc side of that chord —
the bisector-parity kill (Finding 4E) fires via two strict Kalmanson
quadruples.  Symmetrically for b1 via {O, s2}.

Consequence: "the second apex is an outside-pair point of both the
collision row and a blocker row" is impossible — a portable finite
producer candidate.  The 744 SAT survivors confirm (Round 166) that the
base families cannot close the branch alone; the residual freedom now
has an exact catalog by landing pattern.

Artifacts: `l0_ledger.jsonl` (full verdicts + minimized cores; replay via
`enumerate_l0.py` + `census_runner.py`).

### Lean porting spec for the landing law

The minimal cores are single-quadruple (size 4), e.g.
`L0.eS-S.r0S-O.r1S-O.r2O1-O`:

```text
cls_eq|b0|O     d(b0,O) = d(b0,s0)     O on the b0 reverse row
cls_eq|s1|O     d(s1,O) = d(s1,s2)     O on the collision row
cls_eq|s1|s0    d(s1,s0) = d(s1,s2)    s0 on the collision row (PROVEN)
kal|O,s0,b0,s1  d(O,b0)+d(s0,s1) > d(O,s1)+d(s0,b0)
```

Substituting the equalities cancels both sides: strict 0 > 0.  Pattern:
two centers (b0, s1) equidistant from the pair {O, s0}, with both centers
on the same arc side of chord (O, s0) — cross-cap bisector injectivity in
its 4-point Kalmanson form.  The r1-variant uses (O, s2, b1, s1)
symmetrically.  Lean obligations: the two case assumptions (O on each
row), the PROVEN 2+2 memberships, the Round 188 cyclic order, and one
strict Kalmanson kernel on a named quadruple.  Bank check done: the
production kernel `false_of_two_cap_centers_equidistant_outside_pair`
(TwoCenterCapLocalization.lean:60, via
`CapSelectedRowCounting.outsidePair_unique_capCenter`) covers two cap
centers bisecting a pair BOTH outside the cap; our pair {O, s0} is mixed
(s0 interior), so the port is a small assembly over the raw kernel
`dist_add_dist_lt_diagonal_sum_of_ccw` (CapCrossingKalmanson), plus a ccw
fact for (O, s0, b0, s1) from the cap partition.

## Finding 6: merge-layer census — identification layer fully decided

All 7040 merge schemas decided, no timeouts (`merge_ledger.jsonl`,
`merge_census_summary.json`):

| kind | sat | unsat |
|---|---|---|
| e~p0 / e~p1 / e~p2 | 0 | 3000 |
| p0~p2 / p1~p2 | 0 | 2560 |
| p0~p1 double | 0 | 200 |
| p0~p1 single | 1008 | 272 |

Portable laws (each with uniform local certificates in
`dead_type_local_cores.json`, cores over {fused point, named} only —
`verify_dead_type_local_cores.py`, 10/10 PASS):

1. an exact-five extra is NEVER an outside-pair point (any row, either
   arc);
2. the collision row shares NO outside point with either blocker row
   (5-6 constraint cores, same bisector-parity shape as Finding 5);
3. the two blocker rows cannot share BOTH outside points;
4. of the 272 dead p0~p1 singles, 224 inherit the Finding 5 landing law;
   the 48 others are a new uniform law: if the blocker rows share an
   outside point, O cannot be an outside point of both blocker rows
   (cores: 4 cls_eq + 1-2 kal on {O, fused, b0, b1, s1}).

Z3's minimized cores on the full schemas often drag in stray fresh
points via conditional-Kalmanson implications (locality audit: 2780
non-local cores), so the multi-merge containment argument runs through
the mini-schema certificates instead: every multi-merge pattern contains
a dead pair whose mini-core maps verbatim under renaming (class
memberships only grow; named points are never fused; the mini-cores'
quadruples contain at most the fused bag point).

Residual freedom after L0 + merge layer: 744 all-fresh + 1008 single
p0~p1 SAT classes.  Next teeth: L1 first-apex rows (frontier pair,
retained/double rows, polychromatic split — note the polychromatic
rad_ne family is INERT without EA-centered equalities, so it only fires
with the row structure), then Round 166 geometry for whatever survives.

Coverage accounting for the identification layer.  Every real aligned
exact-seven configuration projects to exactly one of:

1. an all-fresh L0 schema (Finding 5);
2. a single-merge schema (extra ~ outside point same bag, or outside
   points of two different rows same bag) — enumerated exhaustively
   (`enumerate_merges.py`, 6840 schemas);
3. a double b0-row ~ b1-row merge (200 schemas, enumerated); or
4. a multi-merge pattern containing at least one pair whose type is dead
   in the single-merge census.  Such a pattern inherits the dead pair's
   minimized core verbatim, PROVIDED the core touches no fresh point
   other than the fused one (named points are never fusable and distinct
   fusions touch distinct fresh points).  This locality condition is
   checked mechanically over every dead core (`analyze_merges.py`,
   `nonlocal_cores` must be empty); remaining multi patterns are
   impossible role-side (same-row or e1~e2 fusions violate proven card
   facts).

## Finding 7: one-hit region families — the L0 residual halves (2026-07-19)

The L0 fact sweep missed four theorems outside the ATail directory
(`U2NonSurplusOneHit.lean`): every exact-radius class at EA or O meets
each ADJACENT closed cap in at most one point, and all four compose for
the generic packet `S` via the `DS`/`withPacket` rebuild already used at
three sites in the codebase (full provenance: DESIGN-L1.md,
ENCODER_FACTS.md "L1 additions").  Encoded as pairwise `rad_ne`
families over same-closed-cap pairs (`regions.py`), validated by 7 new
smoke gates plus a 7/7 regression (`smoke_l1.py`; the previously-SAT
named-forced smoke-B schema now dies exactly on its both-extras-in-
surplus e-pattern, pinning the new teeth label-for-label).

Retro census over the 1752 identification-layer survivors
(`build_retro_l0.py`, retro ledgers): **876 SAT / 876 UNSAT**.  The
kills are exactly the four e-landing patterns with both extras on one
side — S-S, S-EA, O1-O1, O1-W (219 each; the L0 law "extras are
irrelevant" is repealed by the new families).  Every core is the same
3-label shape: two class(O) membership equalities + one one-hit
disequality at O.  No p-pattern kills: the region and outside-pair
disequalities are generically satisfiable in the all-fresh layer
(witnessed).  Residual: 876 = 372 all-fresh + 504 single p0~p1, with
e-patterns confined to {S-O1, S-W, EA-O1, EA-W}.

## Finding 8: L1 first-apex rows are inert all-fresh

L1a (39 retained-row site patterns on the named base, one-hit budgets
discrete, `enumerate_l1a.py`): all SAT.  L1b (746 = L1a × double-row
profiles × same/distinct radius arms with joint-budget accounting,
`enumerate_l1b.py`): all SAT.  The SelectedFourClass rows are
equality-only (4-subsets of ambient classes — `sameRadius_six` forbids
completeness assertions), and with the discrete one-hit filters already
applied at enumeration, nothing in the metric vocabulary closes an
all-fresh row pattern.

## Finding 9: the L1 teeth are identification types (terminal + tooth)

`verify_l1_id_types.py`, 18/18 dead-type certificates PASS with uniform
LOCAL cores (only fused roles + named points, so the merge-layer
containment argument extends each kill to every pattern containing it):

- **pp-ret / pp-dbl** (both outside points of any reverse row occupy two
  slots of the retained/double row; 3 rows × 3 bag variants × 2 targets):
  UNSAT, cores = outside-pair `rad_ne|EA` against 1-2 `row_eq` — the
  censal image of the production terminal
  `false_of_fullParentExactFiveAllReverseData_of_namedRowOccurrence`;
  the Lean port of these kills is a direct citation.
- **qw-classO** (both frontier sources in class(O): q~e & w~e, q~e &
  w=s_j; both-sources-named already dead in the L1a filter): dead by
  CITATION — `secondApexDouble` + `unique_K4_radius` +
  `class_card_eq_five` force |class(O) ∖ {q,w}| ≥ 4 vs actual 3.  Not
  solver-encoded (any encoding begs the discrete cardinality argument).

Alive types (mini-schema SAT, inconclusive for refinements, recorded as
residual): single outside point on a completion slot, outside point =
frontier source, extra on a row slot, shared completion in the
same-radius arm (`l1_id_type_cores.json`).

Joint-crossing sample (`sample_l1c.py`, deterministic seed 97, 40
crossings): **2 joint kills, 38 SAT** (`l1c_sample_results.json`).
Cross-layer teeth EXIST: both kills have an L1 row carrying O plus a
named interior point (`cO-s1`, `ds0-O`), where the row equalities feed
the L0 Kalmanson/class system (cores mix row_eq + cls_eq + kal, sizes
12-16).  A full L1c census (876 × surviving row patterns) is warranted —
joint schemas run minutes each, so shard it or offload to flux.local.

## Finding 10: full L1c census, factored — three row-coupling laws (2026-07-19)

The full joint product (876 retro survivors × 746 l1b patterns =
653,496 schemas) factors through the named EA-coradiality constraints a
row pattern implies (`factor_l1c.py`): the fresh row content is inert
(Finding 8), so join(retro, l1b) inherits UNSAT a fortiori from
retro + implied(l1b).  Both sample joint kills reproduce factored with
matching cores (`smoke_l1f.py`, 3/3 incl. a SAT control).  Structure of
the implied sets: every genuine equality pairs O with one named point
(the physical ≤1 row budget forbids two non-O named landings per row),
and all 15 named–named disequalities are already asserted by the
one-hit families (those sets are retro-equal, SAT by citation).
Distinct genuine sets: 6 bare `eqO-x` + 30 ne-decorated + 6 pure
`neO-x` = 42; census = 36,792 runs, all resolved (one 10-min timeout
retried SAT at 1h; `l1f_ledger.jsonl.gz`, `l1f_coverage_summary.json`).

Verdicts are three clean laws (perfect separation, no exceptions):

- **Law A**: retro + `eqO-s0` (equally `eqO-s1`) is UNSAT **iff some
  reverse row carries O** — 552/876 die (504 with one O-row, 48 with
  two); all 324 no-O-row survivors are SAT.
- **Law B**: retro + `eqO-W` is UNSAT iff some reverse row carries O
  AND the e-extra lands on W — 276/876 (a subset of the 552).
- **Law C (no other teeth)**: `eqO-b0`, `eqO-b1`, `eqO-s2` and every
  pure disequality kill nothing; every ne-decorated superset's kill set
  equals its bare-eq kill set id-for-id (md5-verified) — disequalities
  never add teeth.

Joint-product coverage: 75,900/653,496 (11.6%) of retro × l1b pairs
dead via factored kills.  No retro survivor dies under ALL bare-eq
sets, so the row layer closes no survivor outright — it kills the
"row ties O to s0/s1 (or to W, with a W-extra)" case on O-row
survivors.  Caveat: the SAT direction is factored-SAT, not certified
joint-SAT (supported by Finding 8 + the 38/40 SAT samples, not
proven).  Lean shape of Laws A/B: a `TwoCenterBisectorParity`-style
assembly where the row equality supplies one radius equation and the
O-carrying reverse row supplies the second — same kernel family as the
Finding 5 ports.

## Next steps

1. ~~Lean normal-form theorem for Finding 2~~ DONE (Round 188).
2. ~~Encoder + smoke gates~~ DONE (Finding 4).
3. ~~Identification-layer census~~ DONE (Findings 5-6).
4. ~~One-hit families + retro census + L1 rows + id types~~ DONE
   (Findings 7-9).
5. Lean ports: (a) ~~e-pattern split law~~ DONE
   (`SecondApexClassOneHit.lean`); (b) ~~Finding 5 landing law~~ DONE
   (`TwoCenterBisectorParity.lean`); (c) record the Finding 9 dead
   types as citations of existing production theorems; (d) Laws A/B
   (Finding 10) as ordered terminals over the same Kalmanson kernels.
6. ~~Full L1c census~~ DONE factored (Finding 10): 11.6% of the joint
   product dead via Laws A/B; no survivor closes outright.
7. Residual: 876 censal classes × (alive id types + non-coupling row
   landings) — closed only by Round 166 geometry (rank+winding /
   cross-row occurrence) or an L2 refinement (unused-critical-row
   dimension, W-centered one-hit analogue if provable).  The 324
   no-O-row survivors take no L1-row damage at all and are the hard
   core of the residual.
