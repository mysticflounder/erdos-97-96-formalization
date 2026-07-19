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

Citation record (item 5c, verified at source 2026-07-19): the 18
pp-ret/pp-dbl certificates (`pp-{ret,dbl}.{b0,b1,s1}.{O1-O,O1-O1,O1-S}`,
uniform local core `rad_ne|EA|m1,m2 + row_eq|ret|m1 + row_eq|ret|m2`)
are the censal image of
`Problem97.false_of_fullParentExactFiveAllReverseData_of_namedRowOccurrence`
(`lean/Erdos9796Proof/P97/ATail/ParentExactFiveAssembler.lean:356`) —
two named points on one first-apex row slot pair against the EA
one-hit disequality family.  The qw-classO types cite the cardinality
argument: `secondApexDouble`
(`ATail/CriticalPairFrontier.lean:573`) +
`LargeCapUniqueFiveSecondApexRadius.class_card_eq_five` /
`unique_K4_radius` (`ATail/LargeCapUniqueFive.lean:30-36`) force
|class(O) ∖ {q,w}| ≥ 4 against the actual 3.  No new Lean is needed
for either family.

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

## Finding 11: the W-centered one-hit hypothesis is moot (2026-07-19)

The endpoint one-hit kernel plausibly permutes to `W` (an endpoint of
both its adjacent caps), but no bank theorem asserts it and the acute
hypothesis is unverified.  Payoff test before any Lean investment
(`build_l2w.py`, `build_l2w_eq.py`; kills would have been CONDITIONAL
on the unproven analogue):

- W families (rad_ne at W over the physical and opp1 closed regions)
  added to all 876 retro survivors: **876/876 SAT** — no L0-level
  damage (`l2w_ledger.jsonl.gz`).
- W families + each of the 6 bare row-coupling equalities on the 324
  hard-core (no-O-row) survivors: **1,944/1,944 SAT**
  (`l2weq_ledger.jsonl.gz`).

The W analogue adds no kills to this residual even if provable — the
Lean question is retired, and with it the "W-centered one-hit" L2
refinement branch.  Remaining residual consumers: Round 166 geometry
(rank+winding / cross-row occurrence) and the unused-critical-row
dimension.

## Finding 12: the no_qfree families at named centers are inert (2026-07-19)

The retro schemas commit (Round 188 aligned normal form, uniform across
all 1752: `jq` check) to the reverse rows being the critical shells
`H.selectedAt s_i` with named centers `(b0←s0, b1←s1, s1←s2)`.  The
shell-system field `no_qfree` (U1CarrierInjection.lean:1022-1024) then
gives a PROVEN family the retro layer never encoded: no four carrier
points avoiding the source are co-radial at its blocker center at ANY
radius.  New encoder family `no_k4` (label `nok4|center|quad`; smoke
`smoke_l2n.py` 4/4 PASS incl. old-behavior regression), builder
`build_l2n.py`, three specs per schema (~3,000 extra Or-of-disequality
assertions).

Result: **876/876 SAT** (`l2n_ledger.jsonl.gz`) — zero kills.
Consistent with Law C (Finding 10): `no_k4` is a pure-disequality
family, and disequalities have been toothless throughout this gate.
Sharp consequence for the unused-critical-row dimension: its
disequality content (row exactness excludes, `no_qfree` at the row
center) is predicted inert; the only candidate teeth are the row
EQUALITIES `d(uc,u) = d(uc,m)` with u, m named and the center uc
placed (named identification or bag membership — a floating uc is
provably toothless: its distance variables occur only in row/exclusion
constraints and always extend by a large-M assignment).

## Finding 13: the unused-row equality layer has teeth — shell-cycle laws (2026-07-19)

L2u probe (`build_l2u_probe.py`): bare single equalities `d(uc,u) =
d(uc,m)` — the factored |M|=1 named-part of the unused critical row —
over 12 stratified bases, all placed centers, 5,982 runs, smoke 3/3.
182 kills: 150 dead-by-citation (uc = EA with u, m both in the closed
physical cap — the one-hit family, uniform) and 32 structural.  Scale
sweep (`build_l2u_scale.py`, 6,576 runs over all 876 survivors):
**2,952 branch kills**, confirming the probe laws exactly:

- **Law U1** (876/876): the shell of b0 centered at s0 cannot contain
  s1.  Minimal core (4 labels, base-independent): `cls_eq|b0|s1`,
  `cls_eq|s1|s0`, `cls_ne|s1|b0`, `row_eq|unu|s1`.
- **Law U2** (876/876): the shell of b1 centered at s2 cannot contain
  s1.  Core: 3 labels.
- **O-coupling laws** (conditional on which reverse row carries O):
  shell(b0)@s0 ∌ O iff O ∈ r0 (192) or O ∈ r2 (216); shell(b1)@s2 ∌ O
  iff O ∈ r1 (192) or O ∈ r2 (216); shell(b0)@s1 ∌ O iff O ∈ r0 (192);
  shell(b1)@s1 ∌ O iff O ∈ r1 (192).  Carrier counts (192+192+216 =
  600 slots on 552 carriers) reconcile with Law A's 48 double-carriers.

Every core is a pure equality-symmetry chain — cls_eq/cls_ne/row_eq
only, NO Kalmanson, order, or triangle labels.  Common shape: a mutual
shell pair (the branch shell of P centered at C, and a named shell
centered at P containing both the shared member M and C) forces
d(M,P) = radius of a third shell centered at M that contains C but
excludes P — full-class exactness (`CriticalFourShell.support_eq`)
gives False.  One general lemma covers U1/U2 (third shell = r2/r2);
the O-laws are the same chain with class(O) exactness as the third
class.  These are the cheapest Lean-portable kills the gate has
produced (Laws A/B needed ordered terminals over Kalmanson kernels).

Scope, stated honestly: these kill BRANCHES of the unused-row
refinement (where the shells of b0/b1 can sit), not base schemas.  The
all-fresh full-row branch (fresh center, 3 fresh members, exactness
excludes + no_qfree included) is SAT on a hard-core base — the L2u
dimension prunes and refines but cannot close a base outright.
Generalization pinned for round 2: `CriticalShellSystem` +
`physicalApex_survives_erase` (arbitrary deleted point) give an
unconditional row through EVERY carrier point with center ≠ O —
u ∈ {O, e1, e2, outside points} are valid new through-points (sources'
rows are the reverse rows already encoded).

## Finding 14: round-2 L2u — the p2-row laws (2026-07-19)

Probe (6,652 runs, same 12 stratified bases; smoke 3/3 against recorded
round-1 verdicts incl. member-order swap symmetry): 1,887 kills — 28%
kill rate vs round 1's ~5%.  Regime differs from Finding 13: 1,825/1,857
structural cores are Kalmanson-terminal (order-coupled, up to 36
labels), and p-point centers — expected weak (one encoded class each) —
are the dominant killers.

Scale (22 candidate patterns × 876 survivors = 16,896 runs, 2,376
build-skips for merges/citations; `l2u_round2_scale_ledger.jsonl.gz`):
**15,088 branch kills**, per-pattern verdicts exact:

- **16 universal p2-row laws** (kill/built): the unused row through
  `p2a` at each of the eight named centers `EA, W, b0, b1, s0, s2`
  (with the evidence-paired cap member m: (EA,s0), (W,s2), (b0,s2),
  (b1,s0), (s0,s1), (s0,s2), (s2,s0), (s2,s1)) — **876/876 each**;
  same eight through `p2b` — **660/660 each** (216 bases lack `p2b`).
  All Kalmanson-cored: Lean shape = ordered terminals (resolved in
  Finding 14a — all 16 reduce to two-center bisector terminals).
- **Two conditional u=O pure-equality laws**: rows through `O` at `s0`
  or `s2` carrying `s1` — **660/876 each**; minimal cores are the
  three-center chain ALREADY PORTED
  (`false_of_mutualClassPair_sharedMember_thirdClassExcludes`,
  instantiations (P,C,M) = (O,s0,s1) / (O,s2,s1)).  The 216-base
  conditioning is unmapped (deferred).
- **Cross-validation**: (O,s0,b0) 408/876 and (O,s1,b0) 192/660 are
  member-order swaps of round-1's (b0,s0,O)/(b0,s1,O) and reproduce
  their kill counts exactly.
- **(p2a,p2b,s1) / (p2b,p2a,s1)**: 440/660 each — conditional, unmapped.

Honest scope: branch kills of the unused-row refinement, as in
Finding 13; no base closes outright (1,808 SAT rows remain across the
22 patterns).  The p2-row laws say: on every survivor base, the
critical shell of an r2-outside point at any named center off its own
row cannot carry the paired cap member — the strongest single
refinement layer censused so far.

## Finding 14a: Lean shape of the universal p2-row laws (2026-07-19)

Structural fact, machine-checked against all 876 survivor schemas: every
survivor has the same six-block cyclic layout
`[EA] [S-bag] [O] [O1-bag] [W] [s0 b0 s1 b1 s2]`, and the p2 points
always land in one of the two bags (`p2a`: S-bag 548 / O1-bag 328;
`p2b`: S-bag 220 / O1-bag 440 / absent 216).  Hence
`EA < p2 < W < s0 < b0 < s1 < b1 < s2` in every surviving base — each
p2-row law's four-point arrangement is fixed blockwise, not
per-schema.

With the r2 equalities `d(s1,p2a) = rad2 = d(s1,s0) = d(s1,s2)`, the
eight uc-patterns split into two shapes:

- **Six direct two-center kills** — chord `{p2a, m}`, centers
  `(uc, s1)`, one Kalmanson kernel + r2 radius transport:
  (EA,s0) `_split`; (W,s2), (b0,s2), (s0,s2) `_enclosed`;
  (b1,s0), (s2,s0) `_after` — the three previously ported
  `TwoCenterBisectorParity` terminals suffice.
- **Two mutual-pair kills** ((s0,s1), (s2,s1)) — the row
  (`d(uc,p2a) = d(uc,s1)`) and r2 (`d(s1,p2a) = d(s1,uc)`) form a
  mutual isoceles pair sharing edge `{uc, s1}`, forcing
  `d(p2a,uc) = d(p2a,s1)`; the class-O radius holds `O` on the same
  bisector of chord `{uc, s1}`, and both centers `O, p2a` precede the
  chord — a FOURTH linear arrangement (`c₂ < c₁ < p₁ < p₂`), not
  covered by split/after/enclosed.

Ported (TwoCenterBisectorParity.lean, axioms
`[propext, Classical.choice, Quot.sound]`):
`dist_eq_dist_of_mutual_bisector` (the shared-edge equality transport)
and `false_of_two_centers_equidistant_pair_before` (the centers-before
kill via the crossing kernel at `(j2, j1, i1, i2)`).

Census cross-check: the mutual-pair minimal cores are exactly
`cls_eq|O|s1 [cls_eq|O|s2] cls_eq|s1|p2a [cls_eq|s1|s0]
kal|{O,p2a | p2a,O},uc,s1| row_eq|unu|s1`, and the kernel's
center order splits 328/548 across the 876 kills — matching the
O1-bag/S-bag placement counts exactly ((s0,s1): 109+219 / 211+337;
(s2,s1): 114+214 / 179+369).  The p2b laws are verbatim copies on the
same bag regions.

Honest scope: the arrangement claim is machine-checked against all 876
schema block layouts; the reduction of each law to its ported terminal
is hand-derived from the census cores (the solver's alternative larger
irreducible cores route the same net inequality through auxiliary
points).  Per-base Lean wiring of the laws is not done — these are
terminal instruments, and the spine `sorry` is unchanged.

## Finding 14b: conditioning of the non-universal round-2 laws (2026-07-19)

Both conditionings are exact biconditionals, verified against the scale
ledger and the survivor schemas:

- **u=O laws** (O,s0,s1) / (O,s2,s1), 660/876 each: kill **iff
  `O ∉ r2.members`**.  The 216 SAT bases are exactly the `r2*-O`
  decorations, where `p2b` is merged with `O` and `O` is therefore an
  r2 MEMBER (`members = [s2, s0, p2a, O]`, checked 216/216; no killed
  base has `O ∈ r2`, 0/660).  On those bases the chain lemma's
  exclusion hypothesis (`cls_ne|s1|O`) is structurally absent — the
  branch is genuinely consistent, not under-censused.  Both laws share
  the identical SAT set.
- **(p2a,p2b,s1) / (p2b,p2a,s1)**, 440/660 each: kill **iff `p2a` and
  `p2b` lie in the same bag** (220 S/S + 220 O1/O1); the 220 SAT bases
  are exactly the split placement `p2a ∈ S-bag, p2b ∈ O1-bag` (the
  reverse placement does not occur).  Mirror SAT sets identical.  Kill
  cores are TWO-BRANCH case splits over the unordered in-bag pair
  order (`pos|ne|p2a,p2b` + `|br0`/`|br1` kernels): per branch, the
  mutual transport `d(p2a,p2b) = d(p2a,s1)`
  (`dist_eq_dist_of_mutual_bisector`) feeds a 1-3-kernel Kalmanson
  chain.  Composite shape — no single ported terminal; Lean wiring
  would need a per-branch case split.

## Finding 15: round-3 L2u — e/p0/p1 through-point laws (2026-07-19)

Scale of the 126 all-kill round-2 probe patterns at e/p0/p1
through-points (selection: probe denominator ≥ 4, or ≥ 2 for
e-patterns; smoke 3/3 against recorded round-2 probe verdicts;
`l2u_round3_scale_ledger.jsonl.gz`, 36,914 runs): **31,580 kills
(85.5%)**, 5,334 SAT.  All 31,408 structural cores are
Kalmanson-terminal (1-33 kal labels; zero pure-equality kills) — the
round-2 order-coupled regime, not the round-1 equality-chain regime.

**73 of 126 patterns are universal on their availability classes**
(kill = built in the per-pattern denominators of
`l2u_round3_denominators.json`):

- all 12 e2-involving patterns — 219/219 (the eS-O1 bases): rows
  through e1 at e2, through e2 at {e1, EA, b1, s2}, m ∈ {s0,s1,s2};
- p0a family — 588/588 at (b1,s0), (EA,s0), (s0,s1), (s0,s2),
  (s2,s0), (W,s1), (W,s2), plus (p0b,s1) 252/252 and e2-centered
  147/147;
- p1a family — 588/588 at (b0,s2), (EA,s0), (EA,s1), (s0,s2),
  (s2,s0), (s2,s1), (W,s2), plus e2-centered 147/147;
- p0b / p1b counterparts — 468/468 on the same center sets;
- merged-point variants — p0a+p1a 172/172 (10 patterns),
  p0b+p1b 100/100 (12 patterns).

The 53 conditional patterns hold the SAT mass, concentrated in p-p
cross patterns ((p1b,p2a,s2), (p0b,p2a,s2), ...) — presumably
bag-placement conditioned as in Finding 14b; mapping deferred.

Honest scope: branch kills of the unused-row refinement; no base
closes outright.  Lean shape of the round-3 universal laws assessed in
Finding 15a.

## Finding 15a: Lean shape of the round-3 universal laws (2026-07-19)

Classification of all 73 universal patterns by the four-point geometry
of `{uc, K(u), u, m}`, where `K(u)` is the through-point's exact-class
center — `b0` for `p0a/p0b` (r0), `b1` for `p1a/p1b` (r1), `O` for
`e1/e2` (class O) — computed directly from the block order over every
killed base (`classify_l2u_round3_shapes.py`; the census minimal cores
sometimes use an alternate multi-kernel certificate, but the branch is
dead by the two-center bisector whenever both centers are equidistant
from the chord `{u, m}` and the arrangement is one of the four ported
terminals).  Two centers are equidistant here exactly when `m` shares
`K(u)`'s class: the asserted row gives `d(uc, u) = d(uc, m)` and the
class radius gives `d(K, u) = d(K, m)`.

- **48/73 reduce to a single ported `TwoCenterBisectorParity` terminal**
  in every killed base — no new Lean, an r0/r1/O-class transport in
  place of Finding 14a's r2:
  - `enclosed` (21): e1e2·s{0,1,2}; p0a/p0b at (W,s1),(s0,s1);
    p1a/p1b at (W,s2),(b0,s2),(s0,s2); the p0a+p1a/p0b+p1b (W,s1),
    (W,s2),(s0,s1),(s0,s2) merges;
  - `split` (11): e2 at (b1,s0),(s2,s0),(s2,s1); p0a/p0b/p1a/p1b and
    both merges at their EA-centered patterns;
  - `after` (10): p0a/p0b at (b1,s0),(s2,s0); p1a/p1b (s2,s1); the
    (s2,s0)/(s2,s1) merges;
  - `before` (6): e2 at (EA,s{0,1,2}) and (e1,s{0,1,2}).
- **7/73 are same-bag two-branch kills** — the chord or a center pairs
  two same-bag points, so both index orders must die; the non-tied
  arrangement is `enclosed` or `split`, so each branch lands on a
  ported terminal (the Finding 14b mechanism, `pos|ne|·|br0/br1`
  cores): (p0a,p0b,s1), (p1b,p1a,s1), (p0a,p0b+p1b,s1),
  (p1b,p0a+p1a,s1), (p0a,e2,s1), (p1a,e2,s2), (p1b,e2,s2).  No new
  terminal; the wiring is a two-case split, not yet written.
- **9/73 merged-point chains** — `u ∈ {p0a+p1a, p0b+p1b}` sits in both
  r0 and r1, and the minimal certificate routes through a longer
  complementary-kernel chain (e.g. (p0a+p1a,p2a,s1): `EA,O,b1`
  four-point kernels), not a single bisector.  Not single-terminal
  reducible; unported.
- **9/73 three-center cycles** — `m ∉ K(u)`'s class, so no second
  center is equidistant from `{u, m}` and the kill is an irreducible
  3–4 kernel triangle: (p0a,W,s2), (p0a,s0,s2), (p0b,W,s2),
  (p0b,s0,s2), (p0a,e2,s2), (p1a,EA,s0), (p1a,s2,s0), (p1b,EA,s0),
  (p1b,s2,s0).  A cycle argument distinct from the bisector terminals;
  unported.

Result: **no two-center bisector terminal is missing** — the four
Finding 14a arrangements (after/enclosed/split/before) cover all 55
bisector-shaped round-3 laws (48 direct + 7 two-branch).  The
remaining 18 (9 merged + 9 cycle) need multi-kernel chain/cycle
machinery — a separate development, off the exact-seven critical path
(the DoubleApex spine sorry is unchanged either way).

## Finding 15b: conditioning of the 53 non-universal round-3 laws (2026-07-19)

The 53 conditional patterns (kill < denominator) resolved against the
bag placements of `(u, uc, m)` over every buildable base
(`condition_l2u_round3.py` / `_v2.py`; table
`l2u_round3_conditioning.json`).  **48/53 are pure placement laws** —
the verdict is a function of `(bag(u), bag(uc), bag(m))` alone (no base
with a fixed placement tuple splits kill/SAT).  Four mechanism
families, all generalizing the Finding 14b (p2a,p2b,s1) split:

- **s2 through-point (18): kill ⟺ `bag(uc) = O1`.**  The row center in
  the O1-bag forces the crossing; `uc ∈ S`-bag is SAT.  Independent of
  `bag(u)`.
- **s1, u & uc in the same exact class (2: (p0b,p0a), (p1a,p1b)):
  kill ⟺ same bag.**  SAT = the split placement — the exact Finding
  14b law.
- **s1, u & uc in different classes (16): kill on 3 of 4 placements**,
  the single SAT split fixed by `u`'s class: r0-`u` alive only at
  `(u ∈ O1, uc ∈ S)`; r1-`u` alive only at `(u ∈ S, uc ∈ O1)`.
- **s0 merged-`u` (6): kill ⟺ `bag(uc) = S`** (the S↔O1 mirror of the
  s2 law).

The six "other-pure" patterns fold into the same three predicates
(`bag(uc)`, same-bag, `bag(u)`): e.g. (p1b,W,s1)/(p1b,s0,s1) kill ⟺
`bag(p1b) = O1`.

- **5/53 mixed** — all `p0a+p1a, ·, O` (merged first-family `u`,
  target `m = O`): the placement tuple leaves residual kill/SAT mixing
  (e.g. `(O1, blk0, blk2)` 24 kill / 20 SAT).  The chord touches the
  class-O center and the merged `u` sits in both r0 and r1; a deeper
  coupling, deferred with the 18 merged/cycle universal laws.

Honest scope: these are the bag-placement selection rules for the
conditional branch kills; they are census facts, not yet Lean.  The
DoubleApex spine sorry is unchanged.

## Finding 15c: |M|=2 joint co-radiality — no base closes (2026-07-19)

REPORT item 10(c).  The forced unused critical row (DESIGN-L2) is a full
4-class: `u` plus THREE named members all co-radial from the placed
center `uc ≠ O`.  A base is CLOSED iff no placement `(u, uc)` admits such
a row.  Reframing as a compatibility graph per `(base, u, uc)`: nodes =
the `|M|=1`-SAT members (individually co-radial with `u`; 5–15 per group,
median 12, so none are row-dead on single teeth), edges = the `|M|=2`-SAT
pairs (jointly co-radial with `u`).  A 4-class row needs three
pairwise-co-radial members — a **triangle** — so a triangle-free `(u,uc)`
is row-dead and a base with every group triangle-free is closed
(`build_l2u_m2_probe.py`, `analyze_l2u_m2.py`; smoke 5/5 + 8/8).

Census over the 12 stratified sample bases (all pairs among the
`|M|=1`-SAT members): **31,335 pairs, 9,941 kills (31.7%)**.  Result:
**16 of 510 groups are row-dead (triangle-free), but 0 bases close** —
every sample base retains 21–64 surviving groups (median-12 nodes at
~68% edge density is well above the triangle-free threshold; total
44,623 surviving triangles).  The `|M|=3` smoke (`smoke_l2u_m3.py`)
confirms the obstruction saturates: 10/10 tested triangles are jointly
4-co-radial SAT, so 4 co-radial boundary points are geometrically
admissible in these configs.

Conclusion: raw co-radiality (`|M|=1,2,3`) kills branches but does not
close bases — every schema hosts abundant valid row placements.  The
`|M|=3` census (44,623 triangles) is running to complete the map and
pre-filter the real 4-co-radial candidates, but closure — if reachable
by this dimension — must come from the full row's EXCLUSION (exactly 4
co-radial, all others off-radius) and `no_qfree` blocker, not more
co-radiality layers.  Branch-kill instruments only; the DoubleApex spine
sorry is unchanged.

## Finding 16: full-row census — exclusion + no_qfree are inert (2026-07-19)

Tests the two constraint families Finding 15c named as the remaining
closure candidates, on top of the |M|=3 co-radiality.

- **Stage A (`build_l2u_fc.py`)**: co-radiality (`row_eqs [u,m1,m2,m3]`)
  + exclusion (`rad_ne`: every other named point off u's radius from uc)
  — the full `support_eq` of `CriticalFourShell`.  Encoded via the
  `rad_ne` namespace to avoid the base `exact_class` label collision.
- **Stage B (`build_l2u_fcq.py`)**: Stage A + `no_qfree` (`no_k4`
  `{center: uc, avoid: [u]}`) — the complete `CriticalSelectedFourClass`.

Encoding validated (`smoke_l2u_fc.py`, `probe_l2u_stageb.py`):
- **P0 (positive control)**: forcing one excluded point co-radial with u
  flips 5/5 to UNSAT — `rad_ne` genuinely bites when the co-radiality is
  present.
- **N1 (soundness)**: all 15 |M|=3-UNSAT triples stay fc-UNSAT (tightening
  cannot revive).  **N2 (monotonicity)**: fc-SAT ⇒ |M|=3-SAT, 40/40.

**Finding — exclusion is generically free.**  N3 diagnostic: 0/40 |M|=3-SAT
triples flip to fc-UNSAT.  P0 confirms this is geometric, not a dead
encoding: unless the base *forces* an other-point onto u's circle at uc,
exclusion is satisfiable by perturbing the unconstrained points off that
circle.  **no_qfree is also inert** (already L2n Finding 12: 876/876 SAT;
re-confirmed here — Stage B `fcq` is SAT at named center `uc=W` with named
members on 3/3 tested triples).

This **falsifies the Finding 15c / BGG3XM conjecture** that exclusion +
no_qfree were the closure lever.  Combined with the all-fresh full-row SAT
witness (Finding 13, lines 498–501), the full forced unused critical row
(co-radiality + exclusion + no_qfree, named members, named center `uc=W`)
admits a placement on the tested bases ⇒ **the L2u dimension cannot close a
base outright.**

**Scale run COMPLETE** (Stage A over all 44,623 triangles, 12 bases, 28
shards, `analyze_l2u_fc.py` → `l2u_fc_closure.json`): 692 UNSAT (1.55%),
**0 closed bases, 0 fully-dead `(base,u,uc)` groups of 494**, 0 soundness
violations (every |M|=3-UNSAT stays fc-UNSAT).  The decisive number:
**0 exclusion flips and 0 of the 692 UNSAT cores use `rad_ne`** — every
kill core is `{cls_eq, kal, pos, row_eq}` (co-radiality + Kalmanson), the
Finding 13/14/15 branch-kill laws reproduced.  Exclusion is provably inert
at full scale: it contributes to no kill and closes no base.  The sample
result is now a complete map — the L2u base-closer question is settled
negative.

Consequence for the branch: the L2u refinement dimension is exhausted as a
base-closer (co-radiality, exclusion, no_qfree all censused inert for
outright closure).  The hard-core 324 no-O-row survivors (E902M6) must
close via **Round 166 geometry (rank+winding / cross-row occurrence)** — the
one dimension the report (item 7) reserves as a closer — not this one.
Branch-kill instruments only; the DoubleApex spine sorry is unchanged.

## Finding 17: DoubleApex closure path — validated at source (2026-07-19)

Subagent trace + my source validation. **Corrects the overflow hypothesis
(Next steps 13).** Four load-bearing facts verified at file:line:

1. The interior OVERFLOW lever is OBSTRUCTED: `fourClass_of_cover`
   (`U2SqueezePort.lean:347`) is hard-wired to `|I| = 2`, so a `≥5`-regime
   interior (`card ≥ 3`, trivially from `capInteriorAt_card_add_two:2211`)
   cannot feed the squeeze.  The M44 squeeze does not transfer.
2. The `≤1` adjacent one-hit bounds are UNCONDITIONAL —
   `oppApex1_surplusCap_one_hit (D) (r)` (`U2NonSurplusOneHit.lean:213`),
   no cap-size/`IsM44` hypothesis; they survive the two-large-cap regime.
3. The co-radial-pair producer is ALREADY BUILT, sorry-free, cap-size-
   agnostic: `exists_criticalPairFrontier_of_K4 (D)(S)(H)`
   (`CriticalPairFrontier.lean:1281`) gets `3 ≤ |class \ surplusCap|` from
   `D.K4` (≥4) minus the one-hit (≤1) via `omega` (`:1302-1309`) — NOT
   from overflow.
4. WIRING BLOCKER: the ATail `→ False` route
   (`false_of_parentResidualConsumers`, `OrientedPhysicalApexIngress.lean:454`)
   needs `hmin : D.Minimal`.  The `:2531` DoubleApex target LACKS it;
   `u1_largeCap_routeB_tail_false` (`:9522`) HAS it (+ `hcritical`,
   `hNoM44`, `hcard`, `hnoRem`).  The `:2531` conclusion is unsatisfiable
   over ℝ² (`oppCap2_escape_gen`), i.e. ex-falso only.

RECOMMENDATION (a spine refactor — **Adam's pivot to decide**): close the
tail through the frontier route at the `hmin` level, leaving the two genuine
open kills — `OriginalFrontierUniqueRadiusArm F → False` (simpler arm) and
`FrontierCoupledStrictInteriorNormalForm R → False` (the two-center coupled
residual, which `dead-ends.md:743/786` independently flag as the sole
surviving route; single-center / pattern-level / `|A|≥12`-uniform levers are
falsified).  Not-yet-pinned: exact current `:9522→:2531` routing; whether
arm 1 is partly available.  See memories "Exact-seven DoubleApex CLOSURE
PATH" + "…overflow MECHANISM".  Spine sorry unchanged.

## Finding 18: the two Finding-17 open items, pinned at source (2026-07-19)

Read-only follow-up resolving Finding 17's two "not-yet-pinned" items.
Authoritative spine path (`proof-blueprint spine`):
`u1_largeCap_routeB_tail_false` (`:9522`) → `..._liveData_false` (`:8086`)
→ `..._exactDangerousRow` (`:2671`) → `..._twoLargeCaps_pCentered_t2Source`
(`:2647`) → `exists_removableVertex_of_twoLargeCaps` (`:2600`) →
`DoubleApexOffSurplusSharedRadiusPair` [💧 sorry, `:2531`].

1. **`:9522→:2531` routing = single unbroken caller chain, all in
   `U1LargeCapRouteBTail.lean`.**  `hmin` is dropped precisely at the
   `:9522→:8086` boundary — `liveData_false` (`:8086`) lacks `hmin`, and its
   ONLY real invocation is `:9691` (inside `:9522`, which has `hmin`); every
   other ~40 mentions are doc-comments ("orbit leaf of …"), incl.
   `Continuation.lean:740`.  So threading `hmin` down the chain is a
   MECHANICAL additive-hypothesis widening (Statement abbreviations
   untouched — add `hmin` before the `:` conclusion), single-caller confirmed
   at every link, no interface retirement.  **But it yields ZERO sorry
   reduction on its own** — it only makes `hmin` available at `:2531`.

2. **Arm 1 (`OriginalFrontierUniqueRadiusArm F → False`) is NOT available.**
   It is never discharged in-tree: it occurs only as an INPUT hypothesis in
   four assemblers (`OrientedPhysicalApexIngress.lean:458`,
   `FrontierCommonDeletionSurplusEscape.lean:579`,
   `FrontierCoupledStrictInteriorNormalForm.lean:65`,
   `FrontierCommonDeletionEscape.lean:550`).  So the frontier route leaves
   TWO open kills, not one.

3. **The frontier assemblers are all sorry-free** (0 sorries in
   `FrontierCoupledStrictInteriorNormalForm/CommonDeletionEscape/
   CommonDeletionSurplusEscape.lean`) because they DEFER both arms as
   hypotheses.  Tightest entry point:
   `false_of_frontierCoupledStrictInteriorConsumers`
   (`FrontierCoupledStrictInteriorNormalForm.lean:57`) — proves
   `nonempty_frontierCoupledStrictInteriorNormalForm R` internally and
   reduces the whole frontier to exactly `{arm1, arm2}`.

**Net (fully-pinned blocker).**  Closing exact-seven via the only viable
route (frontier; overflow is dead) = (a) mechanical `hmin`-thread `:9522`→
`:2531` [autonomous-legal, no sorry reduction], then (b) a TARGET SWAP that
replaces the one DoubleApex sorry with the two open frontier arms — arm2 =
`dead-ends.md:743/786` sole survivor.  (b) relocates the on-spine residual;
it is Adam's pivot.  Neither arm is discharged now (both open), so executing
the wiring closes no sorry.  **BLOCKED ON ADAM:
do not execute the target swap autonomously.**  Spine sorry unchanged.

## Finding 18b: the blocker is airtight — no hmin-free route exists (2026-07-19)

Independent second confirmation (read-only) that the DoubleApex sorry cannot
be closed without `hmin`, ruling out any producer-only shortcut around the
pivot.  The cap-agnostic producer `exists_criticalPairFrontier_of_K4`
(`CriticalPairFrontier.lean:1281`) builds `Nonempty (CriticalPairFrontier D S
r H)` with NO `hmin` — but the frontier structure (`:568`) does **not** carry
the DoubleApex pair.  Its fields are `pair : SurvivorPairRelocationPacket`
(two off-surplus points co-radial from **oppApex1 only**), `secondApexDouble :
HasNEquidistantPointsAt 4 ((A.erase q).erase w) oppApex2` (a 4-class *after*
deleting q,w), and the two apex splits.

Decisive: `firstApex_marginal_inter_secondClass_card_le_one` (`:633`) proves
the off-surplus oppApex1-marginal meets ANY fixed oppApex2 class in `≤ 1`
point (via `oppCap2_escape_gen`, `:653`).  So the DoubleApex conclusion — two
distinct points co-radial from BOTH apices — is genuinely **impossible over
ℝ²**; the sorry is **ex-falso-only**.  The frontier is a genuine (satisfiable)
structure, so it is not itself the contradiction; `False` emerges only via
`false_of_parentResidualConsumers` (frontier + `hmin` + arm1 + arm2).  Every
`hmin`-free contradiction source is falsified per `dead-ends.md` (single-
center / pattern-level / `|A|≥12`-uniform levers), leaving the `hmin`-level
two-center coupled residual (arm2) as the sole survivor.  Hence the pivot
(thread `hmin` + target swap) is the ONLY viable closure; there is no
producer-only shortcut.  Confirms Findings 17-18; spine sorry unchanged.

## Finding 18c: arm1 content pinned, not bank-dischargeable (2026-07-19)

Read-only characterization of the "simpler" arm.  `OriginalFrontierUnique
RadiusArm F` (`OrientedPhysicalApexIngress.lean:226`) unfolds to: `((class
card = 4) ∨ (class card = 5)) ∧ ∀ ρ>0, 4 ≤ (SelectedClass D.A oppApex1 ρ).card
→ ρ = radius` — i.e. oppApex1 has a UNIQUE ≥4-radius, of card exactly 4 or 5.
`arm1 → False` is therefore a **global radius-uniqueness rigidity refutation**
at the first apex, needing the minimality structure; it is not a finite-pattern
or local-metric fact.  Theorem-bank / Lean-corpus search (apex radius
uniqueness / multiplicity / two-radius-class) returns no discharge: the nearest
hit `largePhysicalRadius_or_exactTwoFourRadii_of_robust` (`:506`) concerns the
SECOND apex under robustness (yields two radius classes — the opposite of
arm1), and is an assembler piece, not an arm1 refutation.  So BOTH arms of the
only viable route are open: arm1 (this rigidity) and arm2 (`dead-ends.md:
743/786` sole survivor).  No autonomous non-pivot closure exists.  Spine sorry
unchanged.

## Next steps

1. ~~Lean normal-form theorem for Finding 2~~ DONE (Round 188).
2. ~~Encoder + smoke gates~~ DONE (Finding 4).
3. ~~Identification-layer census~~ DONE (Findings 5-6).
4. ~~One-hit families + retro census + L1 rows + id types~~ DONE
   (Findings 7-9).
5. Lean ports: (a) ~~e-pattern split law~~ DONE
   (`SecondApexClassOneHit.lean`); (b) ~~Finding 5 landing law~~ DONE
   (`TwoCenterBisectorParity.lean`); (c) ~~Finding 9 dead-type
   citations~~ DONE (recorded under Finding 9, declarations verified
   at source); (d) Laws A/B
   canonical terminals DONE —
   `false_of_two_centers_equidistant_pair_split`
   (TwoCenterBisectorParity.lean: the `c₂ < p₁ < p₂ < c₁` arrangement
   of every small kal core, `kal|EA,O,m,c|ac+bd-ab-cd`) and
   `false_of_mutualClassPair_sharedMember_thirdClassExcludes`
   (MutualShellPairSharedMember.lean: the 108 pure-equality eO1-EA
   cores).  OPEN residue of (d): the large-core kills (≥7 labels,
   ~1,130 of 1,380 bare) chain extra cls_eq/kal transport steps down
   to the same split terminal; those transport reductions are not
   themselves Lean-proven.
6. ~~Full L1c census~~ DONE factored (Finding 10): 11.6% of the joint
   product dead via Laws A/B; no survivor closes outright.
7. Residual: 876 censal classes × (alive id types + non-coupling row
   landings) — closed only by Round 166 geometry (rank+winding /
   cross-row occurrence) or the unused-critical-row L2 dimension
   (W-centered one-hit retired by Finding 11; no_qfree layer inert by
   Finding 12).  The 324 no-O-row survivors take no L1-row damage at
   all and are the hard core of the residual.
8. ~~L2u probe + scale~~ DONE (Finding 13): Laws U1/U2 universal,
   O-coupling laws per carrier row; 2,952 branch kills.
8b. ~~L2u round 2 (generalized through-points) probe + scale~~ DONE
   (Finding 14): 15,088 branch kills; 16 universal p2-row laws; two
   conditional u=O pure-equality laws (660/876) already covered by the
   ported chain lemma.
9. ~~Lean port of the Finding 13 laws~~ DONE
   (`MutualShellPairSharedMember.lean`): three kernel-clean lemmas
   covering all 2,952 structural cores —
   `false_of_mutualShellPair_sharedMember_thirdShellExcludes` (Laws
   U1/U2, 1,752 kills), `..._sharedMember_selectedClassExcludes` (the
   four 192-kill O-cores), and
   `..._selectedClassBridge_thirdShellExcludes` (the two 216-kill
   r2-carrier O-cores; four-center chain through class(O)).  Axioms:
   `[propext, Classical.choice, Quot.sound]`.
10. ~~L2u round 2 probe + scale~~ DONE (Finding 14).  Follow-ups:
    (a) ~~map the 216-base conditioning of the u=O laws and the
    440/660 (p2a,p2b,s1) split~~ DONE (Finding 14b: u=O kills iff
    `O ∉ r2.members`; p2-pair kills iff same-bag placement);
    (b) ~~Lean shape of the p2-row kal cores~~
    DONE (Finding 14a: six laws on ported split/after/enclosed
    terminals; two need the new centers-before arrangement + mutual
    transport, both ported kernel-clean in
    `TwoCenterBisectorParity.lean`); (c) ~~|M| = 2 decorations of
    surviving branches~~ DONE (Finding 15c: |M|=2 joint co-radiality,
    31.7% pair-kill, 16/510 groups row-dead but 0 bases close; |M|=3
    census running to complete the co-radiality map — closure needs the
    full row's exclusion + no_qfree, not more co-radiality); (d)
    ~~e1/e2/p0/p1 non-universal probe
    patterns~~ DONE (Finding 15: 73/126 universal on availability
    classes; follow-ups — ~~Lean shape of the round-3 laws~~ DONE
    (Finding 15a: 48 direct + 7 two-branch on the four ported
    terminals, no missing terminal; 18 merged/cycle patterns need
    separate chain machinery), ~~conditioning map of the 53 conditional
    patterns~~ DONE (Finding 15b: 48/53 pure bag-placement laws in four
    families generalizing 14b; 5 merged `p0a+p1a,·,O` mixed)).
11. **L2u full row** DONE (Finding 16): co-radiality + exclusion +
    no_qfree all inert; the L2u unused-row dimension (arm (a) of the
    DoubleApex residual per `live-blueprint.md:2`) refines but cannot
    close a base.  The `capInteriorByIndex_card_add_two` counting slice
    that closes exact-SIX (`ParentExactFiveExactSix.lean`,
    `five_le_card_of_periodThree_straddles`: period-3 sources+blockers
    force interior ≥ 5) is TIGHT at exact-seven (interior = 7−2 = 5),
    which is the structural reason this branch is the residual.
12. **NEXT — L3 cross-row-occurrence layer** (the gate contract's
    "Round 166 producers" for the SAT residuals).  The producers already
    exist kernel-clean in `ATail.CriticalPairFrontier.lean` (0 sorries):
    `blocker_centers_eq_iff_mutual_cross_membership_of_five_le` (:1177) —
    with first-apex `SelectedClass` card ≥ 5, blocker-center coincidence
    `H.centerAt q = H.centerAt w` ⟺ MUTUAL cross-membership (`w` in `q`'s
    row-shell support ∧ `q` in `w`'s); the winding companion is
    `signedArea_product_neg_of_cross_membership` (:927).  Both relations
    are gate-encodable (row-support membership + center identification are
    already encoded).  Design: add an L3 schema field asserting the
    cross-membership⟹center-coincidence implication; a survivor that
    forces mutual cross-membership with role-distinct centers is then
    UNSAT.  Soundness gate before any census: each added constraint must
    be a proven consequence of the packet (the iff lemma supplies it,
    conditioned on the card-≥5 first-apex hypothesis — verify that
    hypothesis holds on the survivor class before encoding).  Needs the
    `SurvivorPairRelocationPacket` field map + a check that the L2u SAT
    survivors actually exhibit forced mutual cross-membership.
13. **DIRECT closure path (verified at source 2026-07-19).**  This gate is a
    DIAGNOSTIC (DESIGN.md contract: SAT ⇒ which non-encoded geometry to add);
    the intended DIRECT closure of `DoubleApexOffSurplusSharedRadiusPair`
    (`U1LargeCapRouteBTail.lean:2531`, sorry :2576) is the U2-squeeze
    OVERFLOW.  Downstream is fully proven (the shared-radius pair fires
    `oppCap2_escape_gen` + reflection kernel ⇒ leaf closes).  Open = does
    `(≥5,≥5,4)` FORCE the pair.  Scaffold `U2SqueezePort.lean` (0 sorries):
    `oppApex1_exactRadiusClass_cover` (:299) is UNCONDITIONAL;
    `oppApex1_interior_card_eq_two_of_isM44` (:249) is M44-conditional
    (caps 4 ⇒ apex interior 2, exactly covered).  TRANSFER GAP: in the
    DoubleApex `hNoM44` two-large-cap regime the caps are ≥5, so the apex
    interior OVERFLOWS (card ≥ 3) — the exact-radius classes cannot all be
    covered, forcing the double-apex coincidence.  Concrete next: prove the
    ≥5-regime apex-interior-overflow analog + assemble the coincidence via
    the unconditional cover.  Same overflow as the exact-six period-3
    straddle count and the card-≥5 cross-membership producer.  See memory
    "Exact-seven DoubleApex CLOSURE PATH".
