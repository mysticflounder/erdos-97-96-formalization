# P97 Counterexample Audit

**Date:** 2026-09-03  
**Project:** Erdős 97–96 formalization  
**Audit cutoff:** nthdegree channel `#erdos-97-96-formalization` through message `#9389`  
**Conclusion:** No inspected artifact is presently a P97 counterexample. Five card-14 Boolean profiles remain the only direct, current, counterexample-shaped structural survivors; the maximal sixth profile was eliminated during this audit by a two-inequality Kalmanson contradiction.

## 1. What would count as a P97 counterexample

For this audit, a counterexample is an explicit finite set \(A\subset\mathbb R^2\) such that:

1. `A.Nonempty`;
2. `ConvexIndep A` — every point is a vertex of the convex polygon;
3. for every \(p\in A\), there is a positive radius \(r_p\) for which at least four other points of \(A\) have distance \(r_p\) from \(p\).

Equivalently, the set must satisfy `HasNEquidistantProperty 4 A`.

The project frequently works inside a minimal-counterexample reduction carrying stronger objects such as `CounterexampleData`, `D.Minimal`, a `SurplusCapPacket`, deletion-critical shells, and MEC/non-obtuse data. Those are proof-reduction hypotheses. They are **not independently necessary** to refute P97: an exact convex coordinate set with the all-center four-equidistant property would already be a counterexample, even if it had not yet been repackaged into the project’s minimality interfaces.

I therefore used two distinct standards:

- **Raw P97 gate:** exact real planar coordinates, exact strict convexity, and an exact four-neighbour distance class at every vertex.
- **Reduced-branch gate:** when an artifact is claimed to model a particular Lean branch, it must additionally satisfy the typed source, cap, deletion, and minimality data used by that branch.

This distinction matters. Several prior objects refute proposed local producers without coming close to the raw all-center condition.

## 2. Executive finding

### No full counterexample found

No inspected object currently combines:

- one exact real planar coordinate set;
- exact convex independence for the whole set;
- a verified distance class of cardinality at least four at **every** vertex; and
- an independent exact replay tying those rows to the same coordinates.

The strongest exact-coordinate objects have only a small number of qualifying centers. The strongest global-looking objects are Boolean, metric, finite-field, or induced-subsystem survivors without a planar coordinate realization.

### The live shortlist changed during the audit

At the start of the audit, the maximal card-14 profile was the strongest direct survivor. During the audit, message `#9387` found an exact Kalmanson contradiction in that model:

- cyclic order:
  `[1,3,4,5,0,6,7,8,9,2,10,11,12,13]`;
- equality component at center `0`: \(d(0,10)=d(0,9)\);
- equality component at center `6`: \(d(6,12)=d(6,10)\);
- equality component at center `1`: \(d(1,9)=d(1,12)\).

For the cyclic quadruple `(1,0,9,10)`, strict convex Kalmanson gives
\[
d(1,9)+d(0,10)>d(1,10)+d(0,9),
\]
hence \(d(1,9)>d(1,10)\).

For `(1,6,10,12)`, it gives
\[
d(1,10)+d(6,12)>d(1,12)+d(6,10),
\]
hence \(d(1,10)>d(1,12)\).

The third equality then yields
\[
d(1,9)>d(1,10)>d(1,12)=d(1,9),
\]
a contradiction.

This is a coordinate-free exact geometric refutation of the maximal model. A Lean/source theorem-bank mapping was still being checked at the audit cutoff, but the mathematical contradiction itself uses only the authenticated order and equality classes.

The other five authenticated card-14 profile models had not yet been run through this occurrence screen at the cutoff. They are now the highest-priority counterexample search targets.

## 3. Ranked candidate ledger

| Rank | Object | Exact coordinates? | Whole-set convexity? | Four-neighbour row at every vertex? | Current verdict |
|---:|---|---|---|---|---|
| 1 | Other five card-14 authenticated Boolean profiles | No | Symbolic order only | Encoded at structural/profile level, not geometrically realized | **Live counterexample-shaped abstractions; screen immediately** |
| 2 | Exact-12 v26 projected SAT model space | No | No coordinate certificate | Projected universal-row structure only | Large structural survivor family, not geometric |
| 3 | D1 TriApex unresolved algebraic orbits `187` and `1412` | Finite-field points only | No real coordinate proof | Local D1 cells, not global all-center P97 | Algebraic local survivors, not direct candidates |
| 4 | Aligned-singleton v19 / v16 induced survivors | Local metric or subset realizations | Global convex realization unknown | Only induced necessary-condition packets | Local geometric survivors |
| 5 | Round170 exact rational \(n=11\) metric skeleton | Abstract metric, not planar | No | Strong row/Kalmanson relaxation only | Exhibited metric is nonplanar |
| 6 | Exact rational 18-point B1 construction | Yes | Yes, exact | **Only 4 of 18 centers** | Decisively not P97 |
| 7 | S0 exact 28/31/34/40-point controls | Yes | Yes, exact | 40-point tower has only 12 of 40 centers; smaller controls certify named rows only | Decisively/local-only |
| 8 | Exact 11-point two-shell and 8-point B2 witnesses | Yes | Yes, exact | Only a few named shells | Local countermodels only |
| 9 | Crossed-arm 10-point QF_NRA survivors | Local exact metric replay | Full cyclic convexity unresolved | Fixed local roles only | Not global P97 |
| 10 | AlphaEvolve 15-point near-miss | Coordinates supplied | Claimed, but global incidence validation failed | Only 3 of 9 claimed centers validated; six unmapped | Invalid candidate |
| 11 | COMP-1, N=17 incidence SAT, Packet 177/181, A5.13j6, cyclic row systems | No P97 coordinate set | No | Abstract/local rows only | Countermodels to proof routes |
| 12 | Unit-circle 17-gon six-equality witness | Yes | Yes | Only two-hit local equalities, no all-center K4 | Refutes one unsound nogood, not P97 |

## 4. Directly counterexample-shaped structural survivors

### 4.1 The five remaining card-14 profiles

**Artifacts**

- Run root: `scratch/runs/dr-card14-profile-probe-20260903/p4-card14-profiles/`
- Maximal model SHA: `03166e4a947c0b66559edb8732a91828ad5a4e0ff5efb8a90e91e0959c233d84`
- Maximal CNF SHA: `706c42a5956b0142d9b04f38cb5fcdf66252edb325097d045293168028ba2274`
- Current metric-realizability receipt family:
  `scratch/runs/dr-card14-metric-realizability-20260903/`
- Specification:
  `docs/specs/p97-dr-card14-metric-realizability-v1.md`
- Main status messages: `#9364`–`#9368`, `#9381`, `#9385`, `#9387`.

All six exact card-14 source profiles were SAT at the Boolean/profile level. The maximal model contained:

- 14 labels;
- one exact four-support selected row per encoded center;
- center exclusion;
- blocker targets and source/deletion routing;
- 172 positive squared-distance equalities;
- equality compression to 53 components;
- exact profile/cap-order information;
- zero clause violations in the authenticated Boolean model.

A full strict-convex QF_NRA query with the 53 compressed equalities and 168 orientation constraints returned `UNKNOWN`, not `SAT`. Therefore there was never a coordinate witness.

The maximal profile is now eliminated by the exact Kalmanson chain in §2. This is substantially stronger than the prior `UNKNOWN`: it proves that particular equality/order model cannot be a strictly convex planar realization.

**What remains live**

The other five profile models remain serious only in the following narrow sense:

- their finite structural formulas contain a row of four witnesses at each encoded center;
- their cap/order labels come from the branch profile;
- no exact geometric contradiction has yet been recorded for their particular equality closures.

They are not counterexamples until one common coordinate set realizes every selected row and the strict convex order. Conversely, a real strict-convex realization of the full per-center positive equality system would be enough for raw P97; exact-row negative inequalities are not needed, because P97 requires at least four equidistant neighbours, not exactly four.

**Immediate action**

Run the same six-role/two-K2 occurrence scan on each of the other five authenticated models. This should be done before another nonlinear SMT attempt. The maximal model needed only three equality pairs and two Kalmanson inequalities; a complete scan over all equality components and cyclic quadruples is cheap, exact, and likely to eliminate additional profiles.

For any surviving profile:

1. close equality components;
2. enumerate all strict Kalmanson implications;
3. compute transitive strict-order cycles between distance components;
4. test the existing two-K2/three-row, five-row equality-chain, and six-role cancellation schemas;
5. only then proceed to Cayley–Menger, EDM/Gram, Ptolemy, or coordinate NRA.

### 4.2 Exact-12 v26 projected SAT enumeration

**Anchor**

- `docs/exact12-v26-projected-model-space-2026-08-20.md:1-84`
- scripts under `scratch/rigid221-sourceheavy-anchor/core-pair/`
- collaborator summary `#9384`.

A recorded projected cube satisfies 704,481 CNF clauses, all 3,040 choice variables decode, and blocking enumeration found at least 300 projected models.

This is large, authenticated combinatorial evidence that the projected clause family is not enough. It is not a P97 counterexample because it has:

- no Euclidean coordinates;
- no exact convexity certificate;
- incomplete source-faithful semantics;
- no independent coordinate replay of one four-neighbour class at every vertex.

It should be retained as a model bank for theorem mining, not described as geometric evidence.

### 4.3 Cyclic1248 abstract row system

**Anchor**

- `Cyclic1248AbstractRowSystem.lean`
- source audit `#9386`
- related S0 status `#8221`.

At \(n=14\), the system uses row offsets `{1,2,4,8}` and blocker map \(\beta(q)=q-1\). It satisfies several strikingly counterexample-like abstract properties:

- every row has cardinality four;
- the row center is excluded;
- blocker-section/source membership;
- row intersections at most two;
- pair codegree at most two;
- support minimality;
- a genuine 14-cycle in the blocker map.

It proves that generic incidence, connectivity, bounded row intersections, and blocker cycles do not force a contradiction. It has no Euclidean distance realization or convex-boundary metric certificate. It is therefore a countermodel to an incidence-only proof route, not a P97 candidate.

## 5. Algebraic and metric survivors

### 5.1 D1 TriApex 111-pattern mine

**Anchors**

- `docs/audits/2026-09-02-d1-triapex-computational-general-theorem-mine.md:214-232`
- `scratch/runs/d1-triapex-plan-20260901/`
- messages around `#9327`–`#9360`
- custody warning `#9328`.

All 111 residue patterns passed the abstract full-Kalmanson LRA and Kalmanson-plus-triangle LRA screens. Dihedral reduction produced five orbit types.

Three orbits, representing 72 source patterns, were rigorously refuted in the finite-field/equality-ideal pipeline. Two remain interesting:

- the 36-pattern orbit represented by pattern `187`;
- the 24-pattern orbit represented by pattern `1412`.

For `187`, a saturated all-pairs-distinct ideal over \(\mathbb F_{32003}\) was zero-dimensional with vector-space dimension 192. Multiple characteristic-zero Gröbner runs timed out before producing a first basis. Random modular factor tests did not force a coordinate collapse.

For `1412`, a valid rerun found a zero-dimensional finite-field survivor of vector-space dimension 3072, with live saturated/minimal-polynomial data and no detected finite-field coordinate collapse.

There was an important false positive: an earlier `1412` “survivor” was produced by an empty-stdout/parser bug and was retracted. The guarded rerun is the only result that should be retained.

Even a characteristic-zero real point of these ideals would not by itself be a P97 counterexample. The systems are local D1 residue cells and deliberately dropped source-role/slice information. They do not encode the all-center property on a complete polygon. Their value is as possible realizable local obstructions to the current proof route.

### 5.2 Round170 exact rational \(n=11\) metric skeleton

**Anchors**

- `#2405`–`#2406` in the retained `p97-formalization` channel.

The round produced an exact rational metric skeleton with:

- a symmetric 4-regular selected-row digraph;
- strong connectivity;
- all 2,046 H3 outgoing cuts;
- eleven fifth-edge exactness conditions;
- four exact owners at every target;
- strict Kalmanson and triangle inequalities.

The exhibited metric is not planar Euclidean: all 330 four-point Cayley–Menger determinants were nonzero in the relevant audit. This does not prove that the same combinatorial template has no other planar realization, but it decisively prevents the displayed rational metric from being a counterexample.

Its lesson is structural: H2/H3 incidence plus strict-Kalmanson metric relaxations are too weak.

### 5.3 Aligned-singleton and crossed-arm survivors

**Aligned-singleton v19**

- `docs/computational-closure-plan-2026-07-28.md:6331-6352`
- nthdegree memory `HDWHVM`.

This has a 22-class quotient, 37 positive distance equalities, 440 convexity assertions, and an exact strict-Kalmanson abstract metric. Coordinate QF_NRA timed out. It is explicitly classified `INDUCED_NECESSARY_CONDITION_ONLY`.

**Frozen v16 subset mine**

- `scratch/atail-force/aligned-singleton-second-nonbisector-induced/v16-exact-subset-mining/final-report.md`
- memory `A6ME06`.

All 3,876 four-class and 11,628 five-class subsets were exact SAT. Ten six-class probes were SAT and fourteen were `UNKNOWN`. One leading local schema has a rational realization. These are realizable local subsets, not one global all-center carrier.

**Crossed-arm ten-point systems**

- `scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-qf-nra/`
- memory `Z56PM5`.

The local Euclidean metric core has exact SAT replay and an adjacent-turn relaxation. Full nonlocal strict cyclic convexity remained `UNKNOWN`/timeout. The systems contain fixed local roles, not four-neighbour rows for all ten points.

### 5.4 Global-confinement, Packet 177/181, and induced SAT remnants

Relevant retained records include:

- Packet181 alternate eleven-core-free SAT witness;
- Packet177 SAT/indeterminate models after one seven-point Gröbner core killed the previous witness;
- \(n=11\) and \(n=12\) survival SAT families;
- 61 equality systems surviving after 1,264 of 1,325 were killed by equality closure;
- several signed-minor or rank-pattern SAT remnants.

These are useful diagnostics for missing clauses and candidate geometric cores. None supplies a single planar convex coordinate set satisfying all-center K4.

## 6. Exact-coordinate objects

Exact coordinates deserve special scrutiny because they are the only artifacts that could accidentally already be counterexamples. None survived the all-center check.

### 6.1 Exact rational 18-point B1 construction — exact global refutation

**Anchors**

- construction: message `#9207`;
- independent exact Fraction replay: `#9215`;
- branch boundary audit: `#9213`;
- no committed source artifact was present at the cutoff.

The construction has 18 distinct rational points in strict convex order. All \(\binom{18}{3}=816\) ordered orientation determinants are positive. It has four intended distance fibers:

- center `A`: six points `{x0,x1,x2,x3,x4,x5}`;
- center `b0`: `{c00,c01,x0,x1}`;
- center `b1`: `{x2,x5,c10,c11}`;
- center `b2`: `{x3,x4,c20,c21}`.

During this audit I reconstructed all 18 points exactly from the rational formulas in `#9207`, grouped the exact squared distances from every vertex, and obtained:

| Center | Maximum equal-distance multiplicity | Four-or-more class |
|---|---:|---|
| `A` | 6 | `{x0,x1,x2,x3,x4,x5}` |
| `b0` | 4 | `{c00,c01,x0,x1}` |
| `b1` | 4 | `{x2,x5,c10,c11}` |
| `b2` | 4 | `{x3,x4,c20,c21}` |
| `s`, `o1` | 2 | none |
| each of `c00,c01,x0,x1,x2,x3,x4,x5,c10,c11,c20,c21` | 1 | none |

Thus exactly **4 of 18** vertices satisfy the P97 counterexample incidence condition. Fourteen fail, mostly with all distances distinct. The model is conclusively not a P97 counterexample.

This is stronger and cleaner than saying it lacks the project’s MEC/minimality packet: it fails the raw theorem-negating property itself.

It remains an important negative control. It shows that strict convexity, a six-point physical class, three complete four-point rows, cap-order markers, and blocker betweenness do not close the B1 branch.

### 6.2 S0 28/31/34/40-point exact controls

**Anchor**

- verifier:
  `docs/computation/rigid221-s0-coupled-two-row-residue-lantern-20260831/solver/verify_rigid221_s0_total_critical_system_model.py`
- detailed replay: message `#8215`.

The exact controls include:

- a 28-point base;
- 31-point owner-return cell;
- 34-point owner-distinct/core cell;
- 34-point owner-distinct/fresh cell;
- an independent 40-point four-lift tower.

All reported strict-convexity determinant tests pass, and the named local rows are exact complete fibers. The 40-point tower has a four-point class at only **12 of 40** centers; the other 28 fail K4. The smaller controls certify their named rows and finite source assignments but do not provide a geometric four-class at every point.

These models refute fixed-depth/local owner contradictions. They are not raw P97 candidates.

### 6.3 Exact 11-point two-shell witness

**Anchors**

- `docs/audits/2026-07-27-two-shell-partial-euclidean-witness.md`
- compact audit:
  `docs/audits/rigid221-cegar-risk-audit-2026-08-26/representative-models/05-two-shell-partial-euclidean.md`
- artifact SHA:
  `e7d46cb5d64c7d833ddcee6a365a7d5f5d7c669c11c52966ade441b6321dd7d2`
- collaborator summary `#9385`.

This is an exact algebraic, strictly convex coordinate witness realizing two blocker shells and four cross omissions. It does not realize all-center K4. It is a local Euclidean countermodel to an overstrong two-shell inference.

### 6.4 Exact rational 8-point B2 witness

**Anchor**

- `docs/erdos-97-descent-prose-proof-atomic.md:4289-4301`
- collaborator summaries `#9384`–`#9385`.

The witness is strictly convex and realizes a five-point unit circle, a four-point radius-two circle, singleton support intersection, and the local counting pattern. It does not assign a four-point equidistant class to every vertex.

### 6.5 Unit-circle 17-gon six-equality witness

**Anchors**

- `lost+found` messages `#6052`–`#6055`.

This exact strict-convex construction refuted an intended six-hit/two-circle source nogood. Four named boundary positions can be put at angles \(\pi/2,\pi,3\pi/2,2\pi\), with the remaining points inserted monotonically on the circle. The requested six equalities hold, while the FourPointTwoCircle core has opposite-side signs.

This is a genuine geometric counterexample to the proposed intermediate lemma. It is not a P97 candidate: the supplied equalities give only local two-hit relations and no all-center four-neighbour system.

### 6.6 AlphaEvolve 15-point near-miss

The AlphaEvolve coordinate file was previously scored as a promising object, but independent validation failed:

- the distance-table equivalence classes were inconsistent;
- only 3 of 9 claimed centers actually achieved multiplicity four;
- six claimed centers could not be mapped;
- the global circle-incidence system was not satisfied.

The attempted Lean proof based on its `Candidate.B`/`by_contra` route was unsound and rejected. This object should remain a regression fixture for candidate validation, not a live candidate.

## 7. Exact and abstract countermodels to proof producers

These findings are mathematically important but should not be confused with P97 counterexamples.

### 7.1 COMP-1 exact rational witness

**Retained channel:** `p97-rvol`, messages around `#2310`–`#2313`.

COMP-1 is an exact rational countermodel to a proposed producer from a depth-five blocker-centered surface. It simultaneously falsifies all eight `MetricResidualTarget` fields, both shell shadows, and all four centered-row targets while passing the encoder gate.

It proves that the retained depth-five data do not imply the desired residual. It does not provide one convex coordinate set with K4 at every point.

### 7.2 Source-faithful \(N=17\) incidence abstraction

**Anchor:** `lost+found #4100`.

All four aligned-mutual deletion base cases were SAT under both Z3 and cvc5. Carefully chosen control perturbations were UNSAT. The experiment therefore found a genuine two-choice CEGAR cut but no contradiction.

The abstraction has no geometry, cyclic order, or general-\(n\) lift. It is not a counterexample.

### 7.3 FreshThird structural SAT / exact-metric UNSAT

**Anchor:** `lost+found #3367`.

A refined FreshThird system was structural SAT but exact-metric UNSAT across 23 representatives and 23,408 assertions. This is the cleanest historical example of why a structural model must not be promoted to counterexample status before exact metric screening.

### 7.4 API-level cap-colouring counterpatterns

**Anchors:** `lost+found #5939`, `#6076`–`#6077`, `#6173`–`#6175`.

Several small set-theoretic colourings satisfy the exposed row/fan API while falsifying the proposed synchronization conclusions. Examples include:

- a four-point row whose only repeated blocker-cap colour occurs on an inside/outside pair rather than two outside points;
- an exact-two overlap between a source row and a Q-row where the desired producer needs overlap at least three;
- a pinned endpoint fan with repeated blocker-cap labels but no source-point/outside-cap alignment.

These establish missing antecedents in API-level theorems. They make no Euclidean-realizability claim.

### 7.5 A5.13j6 and other abstract stress systems

The A5.13j6 model in
`docs/erdos-97-descent-prose-proof-atomic.md:7112` onward is explicitly set-theoretic, without Euclidean coordinates, convexity, or the full P97 incidence property.

Similar abstract row systems and closure towers should be classified as **route countermodels** unless a metric realization is separately supplied.

## 8. Reliability findings that invalidate apparent “survivors”

A project-wide counterexample scan must account for artifact provenance. Several prior “survivor” labels were later shown not to be mathematical evidence.

### 8.1 Empty-output/parser false positive in D1

A D1 run treated missing/empty stdout as a permissive survivor. The result was retracted; a schema-first guard and negative test were added. Only later guarded runs should be considered.

### 8.2 Finite-field points are not real convex configurations

The D1 Singular probes are explicitly one-engine finite-field diagnostics. Their source contracts mark mathematical verdict and promotion as false. A proper ideal or finite-field solution does not establish a characteristic-zero point, a real point, convexity, or the source occurrence map.

### 8.3 `UNKNOWN` is not a model

This applies to:

- card-14 strict-convex QF_NRA;
- B1 193-equality/481-inequality systems;
- aligned-singleton global systems;
- crossed-arm full cyclic systems;
- several exact-five equality ideals.

No coordinate candidate exists unless a solver returns a model and an independent exact replay accepts it.

### 8.4 Projected SAT is not source-faithful geometry

Many exact17, exact12, Packet177/181, and CEGAR models live in necessary-condition projections. A SAT assignment can refute a proposed finite clause family without corresponding to points, distances, or even the complete source packet.

### 8.5 Legacy custody/replay weaknesses

Historical audits found, and later repaired, several hazards:

- outer result fields not bound to the actual solve;
- assumptions omitted from SMT model replay;
- noncanonical assignment ordering;
- semantic source-model fields that could be changed while recomputing outer hashes;
- incomplete source/output inventories;
- parser acceptance of malformed or underspecified schemas;
- hardlink/path-custody gaps;
- phase-zero symbolic normalization bugs.

Legacy survivors produced before the strict replay fixes should be rerun from current source before being used even as theorem-mining models.

### 8.6 Unsound local geometric nogoods

The unit-circle 17-gon and related sign audit showed that a proposed two-circle same-side contradiction had the roles on opposite sides. This is a reminder that equality closure alone is not enough; every Kalmanson/two-circle consumer needs an independently checked cyclic-role map.

## 9. What is most likely to produce a real counterexample, if one exists

### Priority 1 — finish all six card-14 exact Kalmanson screens

The maximal profile fell to an extremely small contradiction. Run the same exhaustive process on the other five models:

- all equality components;
- all source-authenticated cyclic orders and reflections;
- every Kalmanson inequality between distance components;
- strict-order cycle detection;
- minimal unsatisfiable support extraction;
- direct theorem-bank occurrence matching.

This is now the highest-value computation in the project. It is cheap, exact, and directly tests the only current all-center structural candidates.

### Priority 2 — for any surviving card-14 model, seek coordinates from the complete positive equality system

A raw P97 counterexample requires only at-least-four rows. Therefore do not overconstrain the search with exact-class non-equalities or minimality/MEC fields at the first coordinate stage.

The first geometric system should contain:

- two coordinates for every label;
- one fixed affine gauge;
- all authenticated positive row equalities;
- strict cyclic convexity;
- point distinctness, already implied by a strict convex order when encoded correctly.

If SAT, independently replay every per-center row and every orientation determinant in exact algebraic arithmetic. That would be a genuine P97 counterexample even before the minimal-counterexample packet is reconstructed.

If UNSAT or Kalmanson-infeasible, bank a small exact geometric nogood and add it to the structural search.

### Priority 3 — turn coordinate controls into an automatic all-center adjudication suite

Every coordinate artifact should be passed through one standard verifier that reports, for every vertex:

- exact squared-distance equivalence classes;
- maximum multiplicity;
- a named four-neighbour class if present;
- exact convexity determinant minimum;
- the first failing center.

The 18-point B1 result in §6.1 demonstrates the value of this. The same audit should be run on the 28/31/34-point S0 controls and any reconstructed 8/10/11-point witnesses, even though they are expected to fail.

### Priority 4 — continue the D1 real-algebra lane only as local-branch research

For patterns `187` and `1412`:

- obtain a characteristic-zero elimination basis or certified reason for timeout;
- isolate real roots;
- check all coordinate distinctness;
- recover dropped source roles;
- test strict convex order.

This may refute or validate a difficult local producer. It is less likely than the card-14 work to produce a raw P97 counterexample because the D1 systems do not encode the whole polygon’s all-center property.

### Priority 5 — mine structural models for small geometric contradictions, not coordinates first

Round170, exact12 v26, Packet177/181, aligned-singleton, and cyclic row systems are best treated as motif banks. Search them for:

- two-K2/three-row chains;
- repeated-center shared-pair contradictions;
- three distinct bisector centers for one pair;
- five-row Kalmanson equality chains;
- Cayley–Menger rank defects;
- circle-intersection overload.

A small exact nogood is more valuable than another long `UNKNOWN` coordinate run.

## 10. Bottom line

There is **no existing P97 counterexample hidden in the prior work that I could validate**.

The closest things divide cleanly into three groups:

1. **Counterexample-shaped abstractions:** the five card-14 profiles not yet Kalmanson-screened, exact12 projected models, and several global-looking CEGAR models. These have universal row structure but no planar convex realization.
2. **Exact geometric local countermodels:** the 8-, 11-, 18-, 28/31/34/40-point controls and several small QF_NRA witnesses. These refute local proof routes but do not have four equidistant neighbours at every vertex. The exact 18-point model has only 4 qualifying centers; the 40-point tower has only 12.
3. **Proof-route/API countermodels:** COMP-1, A5.13j6, FreshThird incidence survivors, cap-colouring counterpatterns, and cyclic abstract row systems. These show that certain implications are false but are not coordinate configurations.

The most important new result of this audit is not a candidate but an elimination: the maximal card-14 Boolean survivor is exactly incompatible with strict convexity by a three-equality, two-Kalmanson chain. The immediate counterexample-search task is to run that exact screen over the five remaining profile models.

## 11. Coverage and limitations

I scanned the retained project work accessible through:

- `#erdos-97-96-formalization`;
- `p97-formalization`;
- `p97-rvol`;
- `lost+found`;
- `piqd`;
- `survivor-cvc5-audit`;
- the cap-configuration and cap-CE runtime channels;
- collaborator responses to the explicit audit request in `#9382`;
- the project continuity summaries for older work.

The File Library did not return project files in this session, and a local checkout was not available for a byte-level repository grep. The report is therefore a retained-work and authenticated-artifact-record audit, not a claim that every historical scratch byte was independently reopened. Exact paths, SHAs, and channel anchors are included so the remaining high-value artifacts can be reopened from the repository.

---

### Audit checkpoint

The exact 18-point all-center distance scan was performed directly from the rational formulas in message `#9207`, using rational squared-distance equality. No floating-point comparison was used. The maximal card-14 Kalmanson elimination is recorded in message `#9387`; independent Lean theorem mapping was pending at the audit cutoff.
