# Rigid-base (6,6,6) metric-realizability gate at n = 15

Date: 2026-07-25

Lane: `scratch/atail-force/rigid-base-metric-gate/`.  This lane owns only its
own directory.  It made no `lean/` edit, no production edit, and no edit
outside this directory.

**Headline: the full rigid base case is `UNKNOWN` over the encoded surface.
It is `SAT` -- an exact rational abstract-distance shadow -- when the K4
hypothesis is imposed at 7 of the 15 centers.  Nothing here is a planar
Euclidean realization and nothing here is a counterexample to Erdos 97.**

## 1. What was measured

The **rigid base case** of the Erdos-97 all-large-caps terminal:

* `A` is a set of 15 points in strictly convex position, so a cyclic boundary
  order exists;
* an inscribed **non-obtuse Moser triangle** `v1, v2, v3` in `A` lies on the
  minimal enclosing circle of `A`;
* its three chords cut `A` into caps `P1, P2, P3` (points on the far side of
  the chord, plus the two chord endpoints), with
  `|P1| + |P2| + |P3| = |A| + 3`;
* **all three caps have cardinality exactly 6**, so each cap interior
  `I_i = P_i` minus its two endpoints has exactly 4 points, and `6+6+6 = 15+3`;
* **K4**: every `z` in `A` has at least 4 other points of `A` equidistant
  from `z`;
* **full deletion robustness at two of the three apices** `oppApex1`,
  `oppApex2`: for each such apex `u` and every `z` in `A`, the set `A \ {z}`
  still contains 4 points equidistant from `u`.

The question decided here is whether that configuration admits an **exact
rational abstract-distance shadow**: an assignment of positive rationals to the
105 unordered pairs satisfying every strict triangle inequality, both strict
Kalmanson inequalities on every cyclic quadruple of the boundary order, and all
co-radiality equations forced by an incidence model of the hypotheses.

**Kalmanson plus triangle are necessary but not sufficient for strictly convex
planar realizability.**  Every verdict below is scoped to that surface.

## 2. Layout and the without-loss-of-generality choice

Boundary cyclic order is `0, 1, ..., 14`.  The three apices sit at `0, 5, 10`,
so each closed cap is a contiguous block of six boundary vertices:

```text
C_A = {0,1,2,3,4,5}       endpoints 0,5    opposite apex 10   interior {1,2,3,4}
C_B = {5,6,7,8,9,10}      endpoints 5,10   opposite apex 0    interior {6,7,8,9}
C_C = {10,11,12,13,14,0}  endpoints 10,0   opposite apex 5    interior {11,12,13,14}
```

The two robust apices are taken to be `0` and `5`; the third apex `10` carries
K4 but not robustness.  The whole encoding is invariant under the order-3
rotation `0 -> 5 -> 10 -> 0` of the boundary labels, which sends
`C_A -> C_B -> C_C -> C_A` with chain orders preserved, and under which the
strict Kalmanson family is closed (the two inequalities attached to a cyclic
quadruple do not depend on which of its four points has the least index).
Hence every unordered pair of apices is equivalent and `{0, 5}` is without loss
of generality.

## 3. The exact encoding

### 3.1 Boolean incidence layer

287 Boolean variables; 10,414 assertions, or 10,614 with the cap-injectivity
projection (B5').

| key | meaning |
| --- | --- |
| `m[c][p]` | `p` is in the selected co-radial K4 4-row at center `c` |
| `rA[u][p]`, `rB[u][p]` | `p` is in the first / second designated radius class at robust apex `u` |
| `single[u]` | apex `u` is in SINGLE mode |

* **(B1) K4.** `Not m[c][c]`, and exactly four `p` with `m[c][p]`, at every
  center.
* **(B2)** For every pair of centers, at most two common row members.  Two
  distinct centers give two distinct circles, which meet in at most two points.
* **(B3)** For every pair of points, at most two centers carry both.  Such
  centers lie on that pair's perpendicular bisector, a line, which meets a
  strictly convex point set in at most two points.
* **(B4) bisector alternation.** If `c1` and `c2` both bisect `{p1, p2}`, the
  line `c1 c2` is that perpendicular bisector and separates `p1` from `p2`, so
  exactly one of `p1, p2` lies on the open boundary arc from `c1` to `c2`.
* **(B5) cap-local row-hit bounds.** A selected row centered inside a cap meets
  that cap in at most 2 points; a row centered at a chord endpoint meets it in
  at most 1.
* **(B5') one-sided cap-injectivity projection** (present only when the
  cap-injectivity layer is on).  A co-radial class at a center `c` of a cap
  chain has at most one member strictly before `c` and at most one strictly
  after `c` in that chain.  Subsumes (B5) and additionally forbids same-side
  pairs, which a counting bound cannot express.  Applied to `m`, `rA` and `rB`.
* **(B6)** Two centers of one cap cannot share a pair of points outside that
  cap.  This is (B4) restated so it also covers the wrap-around block `C_C`.
* **(B7) robustness normal form.**  Radius classes at `u` are disjoint, so

  > for every deleted `z`, `A \ {z}` contains 4 points co-radial at `u`
  > **iff** `u` carries a class of size >= 5, or two distinct classes each of
  > size >= 4.

  Proof of the equivalence used: (=>) if every class has size <= 4 and at most
  one has size exactly 4, delete a member of that class and no class of the
  survivors has 4 elements.  (<=) a class of size >= 5 survives any single
  deletion, and of two disjoint classes of size >= 4 at most one can be hit.
  Two disjoint co-radial 4-sets sharing a radius merge into a class of size
  8 >= 5, so the disjunction stays sound without asserting distinct radii.

  The Boolean layer therefore carries SINGLE mode (`|rA| >= 5`, `rB` empty) or
  TWIN mode (`|rA| = |rB| = 4`, disjoint), plus `m[u]` a subset of `rA`
  (naming `rA` as the class that contains the selected row), plus the endpoint
  cap-hit bound `|rA ∩ C| <= 1` and `|rB ∩ C| <= 1` for each cap `C` having `u`
  as a chord endpoint, plus (B2)/(B3)/(B4) transferred to the complete apex
  classes.

  Consequence, matching the rigidity supplied with the task: `A \ {u}` splits
  into `I_u` (4 points) plus the two adjacent-cap parts (5 points each), so a
  class of size `k` at `u` puts at least `k - 2` points into `I_u`.  In TWIN
  mode two disjoint classes each contribute at least 2 to a 4-element `I_u`, so
  both have size exactly 4, contribute exactly 2 each, together fill `I_u`, and
  have exactly one point in each adjacent cap.  In SINGLE mode `|rA|` is 5 or
  6.  These are implied by the constraints above, not separately asserted.

The literal quantifier-for-quantifier robustness statement -- for every deleted
`z`, some 4-subset of the survivors is pairwise co-radial at the apex -- is
re-checked exactly on the concrete rational model by the in-process verifier
and again, independently, by `verify.py`.

### 3.2 Exact metric layer over the rationals

105 real variables (one per unordered pair).  Every constraint is homogeneous
of degree one in the distances, so scaling a strict solution makes every strict
slack at least 1.  Normalizing strict inequalities to **integral slack >= 1**
is therefore without loss of generality and keeps the whole solve in exact
linear rational arithmetic (`QF_LRA`, z3 4.16.0, exact rationals throughout;
no floating point anywhere in the decision path).

| family | count | statement |
| --- | ---: | --- |
| positivity | 105 | `d(a,b) >= 1` |
| strict triangle | 1,365 | `d(a,b) + d(b,c) >= d(a,c) + 1`, all three rotations of every triple |
| strict Kalmanson (first) | 1,365 | `d(a,c) + d(b,d) >= d(a,b) + d(c,d) + 1` for every `a<b<c<d` |
| strict Kalmanson (second) | 1,365 | `d(a,c) + d(b,d) >= d(a,d) + d(b,c) + 1` for every `a<b<c<d` |
| **base total** | **4,200** | |
| one-sided cap injectivity | 120 | see 3.3 |

Co-radiality equations from the incidence model:

* `m[c][p]` and `m[c][q]` force `d(c,p) = d(c,q)`;
* `rA[u][p]` and `rA[u][q]` force `d(u,p) = d(u,q)`; likewise `rB`;
* **exactness** at the robust apices: `rA[u]` and `rB[u]` are FULL radius
  classes, so `d(u,p) != radA[u]` for every `p` outside `rA[u]`, and in TWIN
  mode `radA[u] != radB[u]`.  Sound as a necessary condition: given robustness
  at `u`, choose `rA` (and `rB`) to be complete radius classes of `u`; a class
  of size >= 5 gives SINGLE mode, two complete classes of size >= 4 give TWIN
  mode, and the cap-hit bound then pins both to size exactly 4.  Disable with
  `--no-apex-exactness`.

In `--mode integrated` the two layers are decided in one solver: each center
carries a real `rad[c] >= 1` with `m[c][p] -> d(c,p) = rad[c]`, and each robust
apex carries `radA[u]`, `radB[u]` with the analogous implications and the
exactness disequalities.  There is no cut bank and no outer/inner split, so an
UNSAT there would be quantified over the whole Boolean incidence space at once.

### 3.3 One-sided cap-distance injectivity (imported premise)

```text
j < r < s  ->  dist(p_j, p_r) != dist(p_j, p_s)
r < s < j  ->  dist(p_j, p_r) != dist(p_j, p_s)
```

for indices along one ordered cap chain.  Proven sorry-free in the production
Lean tree as `Problem97.CGN.CGN6c_oneSidedDistanceInjective`
(`lean/Erdos9796Proof/P97/CGN/CGN6.lean:1505`), transported to an unnormalized
ordered cap by `Problem97.CGN.oneSidedDistanceInjective_of_mecCapPacket`
(`lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:29`).  Its geometric
source is that a minor-cap chain is nonacute at every middle vertex, which is
where the **non-obtuse Moser triangle hypothesis enters this encoding** -- it is
the only place it does.  The lemma is radius generic, so it applies to complete
radius classes and not only to selected 4-rows, and it strictly implies both
cap-hit bounds (B5).  120 disequalities.  Disable with `--no-cap-injectivity`.

Derived consumers already in the Lean tree:
`selectedFourClass_inter_capByIndex_card_le_two` and
`selectedFourClass_inter_orderedCap_first/last_card_le_one`
(`lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:257,171,213`), plus the
radius-generic endpoint form
`SurplusCapPacket.capByIndex_sameRadius_at_v2/v3_card_le_one_of_convexIndep`
(`lean/Erdos9796Proof/P97/SurplusM44Packet/Shard01.lean:845`).

Because these constraints are attached to specific cap blocks, cores that use
them are **not** transportable to other boundary embeddings.  See 5.4.

## 4. Smoke battery -- 16 / 16 PASS

`--mode smoke`, per-check timeout 120,000 ms.  Artifact: `smoke.json`.
Downstream verdicts are void without this.

| result | id | expected | actual |
| --- | --- | --- | --- |
| PASS | `P0_pure_lra_surface_sat` | SAT | SAT |
| PASS | `P_planar_replay_center_and_arc` | no violation | 0 violations |
| PASS | `P_smt_accepts_center_and_arc` | SAT | SAT |
| PASS | `N_wrong_cyclic_order_rejected` | UNSAT | UNSAT |
| PASS | `P_planar_replay_two_radii` | no violation | 0 violations |
| PASS | `P_smt_accepts_two_radii` | SAT | SAT |
| PASS | `P_cap_injectivity_layer_not_vacuous` | SAT | SAT |
| PASS | `C_cap_injectivity_same_side_after` | UNSAT | UNSAT |
| PASS | `C_cap_injectivity_same_side_before` | UNSAT | UNSAT |
| PASS | `C_cap_injectivity_opposite_sides` | SAT | SAT |
| PASS | `R_core_transport_guard` | only order-invariant cores transport | 4/4 correct |
| PASS | `N_triangle_violation_rejected` | UNSAT | UNSAT |
| PASS | `N_mined_bank_schemas_still_unsat_at_n15` | UNSAT (all) | 4/4 UNSAT |
| PASS | `N_boolean_cap_hit_bound_rejects_two_adjacent_cap_points` | unsat | unsat |
| PASS | `B_boolean_layer_status` | (informational) | sat |
| PASS | `X_staged_and_integrated_encodings_agree` | agree on every pinned model | 4/4 agree |

### 4.1 Positive controls -- the encoding must not reject real convex geometry

Two **genuine strictly convex planar 15-point sets with rational coordinates**
are built and their convex position is checked exactly (monotone chain over
`Fraction`, rejecting any point that is not a strict hull vertex):

* `center_and_arc`: the origin plus 14 rational points of the unit circle about
  it, spread over an arc of about 72 degrees.  Its hull order is the identity
  `0..14`, and the origin carries an exact co-radial class of size 14.
* `two_radii`: the origin plus 14 rational points on four circles about it of
  radii `2, 9/5, 8/5, 6/5` in nested angular bands, giving three disjoint exact
  co-radial classes of size 4 at the origin -- the incidence shape of TWIN mode.

Squared distances are exact rationals; distances are a *deterministic function
of the squared distance* (`isqrt` at `10^40` precision), so equal squared
distances give byte-identical distances and the co-radiality relation stays
exact.  The matrices are then scaled to integral slack.  Both replay the entire
encoded LRA surface with **zero violations**, and z3 returns SAT when the full
LRA surface is combined with **every** exact co-radial equality the real
configuration satisfies.

### 4.2 Negative controls -- the encoding must reject what it should

* `N_triangle_violation_rejected`: `d(0,2) >= d(0,1) + d(1,2)` against the
  strict triangle family -> UNSAT.
* `N_wrong_cyclic_order_rejected`: the `center_and_arc` distance matrix with
  boundary labels 3 and 9 transposed, all 105 distances pinned -> UNSAT, and
  the exact replay locates **719** directly violated Kalmanson inequalities.
  This is the "cyclic order inconsistent with convex position" control.
* `N_mined_bank_schemas_still_unsat_at_n15`: four deletion-minimal exact-LRA
  UNSAT row schemas, mined **independently** by the sibling n=14
  `exact6-allcenter-capaware-gate` lane, embedded increasingly into the n=15
  boundary order -> 4/4 UNSAT.  Cross-artifact agreement with a previously
  replayed bank (SHA-256 recorded in `smoke.json`).
* `N_boolean_cap_hit_bound_...`: forcing the apex-0 class to hold two points of
  the adjacent cap `C_A` -> Boolean layer unsat.
* `C_cap_injectivity_*`: same-side co-radial pairs in a cap are UNSAT while an
  opposite-side pair stays SAT -- a discriminating test, not just a rejection.

### 4.3 Cross-validation and one regression guard

* `X_staged_and_integrated_encodings_agree`: for four pinned Boolean incidence
  models, the CEGAR staged encoding and the single-model integrated encoding
  are solved independently and must return the same status; run twice with and
  twice without the cap-injectivity layer.  4/4 agree.
* `R_core_transport_guard`: **regression.**  An earlier revision transported
  metric unsat cores that referenced a specific cap block, and produced a
  spurious `UNSAT` on the full problem in 2.7 seconds.  Cap-injectivity and
  apex-class constraints are not invariant under order-preserving relabelling
  of the boundary, so cores touching them must not generate a schema closure;
  they still yield a sound literal cut.  The guard is now asserted directly.

## 5. Verdicts

Per-solve timeout **300,000 ms (300 s)** everywhere; CEGAR wall budget
**1,800 s**; outer solve timeout 60,000 ms.

### 5.1 Single layers

| run | status | time | artifact |
| --- | --- | ---: | --- |
| universal LRA surface alone (4,200 constraints) | **SAT** | 0.14 s | `lra_only.json` |
| Boolean incidence layer alone (B1-B7) | **SAT** | 0.71 s | `boolean_only.json` |

Neither layer is contradictory on its own, so there is no purely combinatorial
and no purely metric verdict.

### 5.2 Integrated single-model relaxation ladder

Each rung imposes the K4 selected-row hypothesis at a subset of the 15 centers.
The robustness structure at apices 0 and 5 is always present.  **Dropping a
center is a sound relaxation** -- every solution of the full problem yields one
of the relaxation by emptying the dropped rows -- so an `UNSAT` on any rung
would transfer upward to the full problem.  A `SAT` on a rung transfers
nowhere.

| K4 imposed at | without cap injectivity | with cap injectivity |
| --- | --- | --- |
| 0 centers (robustness only) | SAT, 1 s | SAT, 1 s |
| 3 centers (the apices) | SAT, 1 s | SAT, 1 s |
| 7 centers (apices + `I_0 = {6,7,8,9}`) | **SAT, 52 s** | **SAT, 9 s** |
| 11 centers (apices + `I_0` + `I_5`) | UNKNOWN, 300 s | UNKNOWN, 300 s |
| 12 centers (all three cap interiors) | UNKNOWN, 300 s | UNKNOWN, 300 s |
| 15 centers (**the full problem**) | UNKNOWN, 300 s | UNKNOWN, 300 s |

Every SAT rung was replayed independently by `verify.py` (exact `Fraction`
arithmetic, no z3 in the model-checking path) and passed with zero failures.

The 7-center rung with cap injectivity exhibits **exactly the rigidity supplied
with the task**, as an exact rational abstract-distance shadow:

```text
apex 0: SINGLE, class {5,6,7,9,10}, size 5
        {5} in adjacent cap C_A, {10} in adjacent cap C_C,
        {6,7,9} in the opposite-cap interior I_0 = {6,7,8,9}
apex 5: TWIN,   classes {4,8,11,12} and {1,6,13,14}, both size 4
        each has exactly one point in each adjacent cap,
        {11,12} and {13,14} partition the opposite-cap interior I_5
```

So the rigidity itself does not kill the branch at the Kalmanson + triangle
level.

### 5.3 CEGAR gate over the full 15-center problem

| run | status | attempts | stage-1 UNSAT | survivors | transported applications | artifact |
| --- | --- | ---: | ---: | ---: | ---: | --- |
| no cap injectivity | **UNKNOWN** (1,800 s wall) | 2,206 | 2,205 | 0 | 2,721,688 | `gate_default.json` |
| with cap injectivity | **UNKNOWN** (1,800 s wall) | 5,134 | 5,133 | 0 | 2,367,338 | `gate_capinj.json` |

**Every single enumerated Boolean incidence model that reached the exact metric
oracle -- 2,205 of them without the cap-injectivity layer and 5,133 with it --
was exact-LRA UNSAT.**  No candidate survived to the exactness stage, so the
stage-2 apex-exactness oracle and the SAT replay path were never exercised by
the full problem.  This is **not** exhaustion: the outer search timed out.

200 stored cuts from each run were re-solved from scratch by `verify.py
--replay-cuts` and all 400 replay UNSAT.

### 5.4 Epistemic labels

* **`UNKNOWN` is the verdict for the full rigid base case.**  It means timeout,
  and it is reported as `UNKNOWN`, never as `UNSAT`.
* The **`SAT` at 7 centers** is an **EXACT RATIONAL ABSTRACT-DISTANCE SHADOW**.
  It is **not** a planar Euclidean realization and **not** a counterexample to
  Erdos 97.  Kalmanson + triangle are necessary, not sufficient, for strictly
  convex planar realizability, and section 6 lists what was left out.
* The **`UNSAT` results** are bounded solver verdicts over exactly the
  constraints listed in section 3 and recorded in the `encoded` field of every
  result JSON.  The per-candidate stage-1 UNSATs are over: positivity, strict
  triangle, both strict Kalmanson, the co-radiality equalities of that one
  Boolean model, and (in the `capinj` run) one-sided cap injectivity.

## 6. What was NOT encoded

* **Planar Euclidean realizability.**  No rank-two Gram / Cayley-Menger
  condition, no coordinates, no equality-ideal or CAS pass.  This is the
  largest gap between a SAT shadow and a real configuration.
* **Minimal-enclosing-circle containment** and the position of the MEC center.
* **The non-obtuse condition on the Moser triangle** as a direct constraint.
  It enters only through the imported one-sided cap-injectivity premise of 3.3.
  The three squared-length inequalities on `v1 v2 v3` are nonlinear and are not
  asserted.
* **The orientation content of "far side of the chord"** beyond contiguity of
  the cap blocks on the boundary order.
* **Ptolemy** and other higher-order convex-position inequalities;
  **concyclicity** of any radius class.
* **Rotational core transport.**  Cores transport to increasing embeddings and
  to the reflection only; the additional cyclic rotations of a target embedding
  are valid but were not asserted, so the learned closure is not complete.
* Anything about `noM44`, minimal-counterexample structure, blocker rows or
  `no_qfree_at`.  Those belong to the sibling n=14 lane.
* Any Lean-side consumer.  **Nothing in this lane closes or shrinks a `sorry`,
  and this lane is not on the spine.**

## 7. Reproduction

```bash
cd <repo root>
G=scratch/atail-force/rigid-base-metric-gate

# mandatory smoke battery
uv run python $G/rigid_base_gate.py --mode smoke --output $G/smoke.json

# single layers
uv run python $G/rigid_base_gate.py --mode lra-only     --output $G/lra_only.json
uv run python $G/rigid_base_gate.py --mode boolean-only --output $G/boolean_only.json

# integrated single-model decision, full problem
uv run python $G/rigid_base_gate.py --mode integrated --row-centers all \
  --metric-timeout-ms 300000 --output $G/relax_capinj_all.json

# CEGAR gate, both configurations
uv run python $G/rigid_base_gate.py --mode gate --wall-seconds 1800 \
  --metric-timeout-ms 300000 --outer-timeout-ms 60000 --log-every 25 \
  --no-cap-injectivity --output $G/gate_default.json
uv run python $G/rigid_base_gate.py --mode gate --wall-seconds 1800 \
  --metric-timeout-ms 300000 --outer-timeout-ms 60000 --log-every 25 \
  --output $G/gate_capinj.json

# relaxation ladder (per-solve timeout ms, with|without cap injectivity)
$G/run_ladder.sh 300000 with
$G/run_ladder.sh 300000 without

# independent exact replay
uv run python $G/verify.py $G/relax_*.json
uv run python $G/verify.py --replay-cuts $G/gate_default.json $G/gate_capinj.json
```

`gate_default.json` was produced before `--no-cap-injectivity` existed as a
flag; that configuration is byte-equivalent to running the current script with
the flag, because both the metric cap-injectivity family and its Boolean
projection (B5') are gated on it and the transport guard is a no-op when no
cap-injectivity constraint can enter a core.

## 8. Artifacts

| file | contents |
| --- | --- |
| `rigid_base_gate.py` | the gate; modes `smoke`, `gate`, `integrated`, `lra-only`, `boolean-only` |
| `verify.py` | independent exact-`Fraction` replay (z3-free for model checks) plus `--replay-cuts` |
| `run_ladder.sh` | relaxation ladder driver |
| `smoke.json` | smoke battery, 16/16 pass |
| `lra_only.json`, `boolean_only.json` | single-layer statuses |
| `gate_default.json`, `gate_default.log` | CEGAR run without cap injectivity |
| `gate_capinj.json`, `gate_capinj.log` | CEGAR run with cap injectivity |
| `relax_capinj_*.json`, `relax_nocapinj_*.json` | the twelve ladder rungs |
| `ladder_capinj.log`, `ladder_nocapinj.log` | ladder driver logs |

## 9. What would move this

1. The bottleneck is the outer Boolean search, not the metric oracle: every
   metric call is decided in well under a second and always answers UNSAT.
   Rotational core transport, or a direct CNF encoding of the incidence layer
   handed to CaDiCaL with the learned closure, would raise the enumeration rate
   by orders of magnitude.
2. The 11-center integrated rung is the first one that does not decide in
   300 s.  A longer budget there, or a targeted split on the apex-0 / apex-5
   modes (SINGLE/SINGLE, SINGLE/TWIN, TWIN/TWIN -- three cases, each of which
   can be run independently), is the cheapest route to a decisive relaxation
   verdict that transfers upward.
3. If a full-LRA survivor ever appears, the next oracles are the stage-2
   exactness filter (already implemented) and then a Euclidean equality-ideal /
   Cayley-Menger pass, which this lane does not have.

## 10. Unique-four cover and apex-triple exclusion in the outer search

Added 2026-07-25, behind two flags, both defaulting off:

    --unique-four    unique-four centre cover, families (U1)/(U2)/(U3)
    --apex-triple    no carrier point equidistant from all three Moser apices

New kinds: `unique_four_class_equality`, `unique_four_class_exactness`,
`unique_four_uniqueness`, `apex_triple_exclusion`.  **None is in
`TRANSPORTABLE`**, and `TRANSPORTABLE` is assigned exactly once and never
mutated — verified by inspection.  Adding any of them there would be unsound:
a unique-four class is attached to a specific centre and is not order-invariant.

Validation, 2026-07-25:

* `--mode smoke` 16/16 pass, `"actual"` values identical to the committed
  `smoke.json` baseline, including `R_core_transport_guard` (4/4) and
  `N_wrong_cyclic_order_rejected` (UNSAT).
* Two runs, same configuration, 550 s internal wall cap, seed 0, cap
  injectivity on:

  | | baseline (off) | enabled |
  |---|---|---|
  | file | `gate_baseline_600s.json` | `gate_unique_apex_600s.json` |
  | status / reason | UNKNOWN / `outer: timeout` | UNKNOWN / `wall budget exhausted` |
  | attempts | 2253 | 4974 |
  | `counters.stage1_cuts` | 2252 | 4973 |
  | transported schemas | 680 | 146 |
  | transported applications | 1122134 | 177856 |

  Both are UNKNOWN BY TIMEOUT.  **UNKNOWN is not UNSAT**; neither run proves
  anything.  Enabling the families roughly doubled the raw cut rate while
  cutting transport reuse by about six times, so the net effect on time-to-
  decision is not established by these two runs.

### Open defects in this addition

* {{NEEDS_UPDATE}} `Outer.__init__` defaults `use_unique_four` and
  `use_apex_triple` to `True`, so `smoke()` and `run_boolean_only`, which
  construct `Outer(...)` without kwargs, silently run WITH the new families.
  This contradicts the flags' `default=False`.  No smoke verdict changed, but
  the two paths disagree about what "default" means.
* {{NEEDS_UPDATE}} In `verify_exact_shadow` the apex-triple violation check is
  unconditional, unlike the unique-four block which is gated on
  `"uf_centers" in decoded`.  A SAT witness produced with `--apex-triple` off
  would raise an uncaught `AssertionError` instead of returning a verdict.
  Not reached in either run above, since both ended UNKNOWN.
* {{NEEDS_UPDATE}} `run_gate`'s `"encoded"` prose list names both layers even
  when both flags are off.  Metadata only.
