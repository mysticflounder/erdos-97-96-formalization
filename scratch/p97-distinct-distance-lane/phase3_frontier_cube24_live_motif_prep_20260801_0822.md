# Live Phase-3 frontier cube24 preparatory cut/motif audit

Date: 2026-08-01

Artifact (read-only):
`scratch/p97-distinct-distance-lane/phase3_projected_static_v2_frontier_cube24_20260801_050632`

## Scope, snapshot, and trust boundary

This is a preparatory prefix audit of a **running** artifact.  It did not mutate
the artifact, signal a process, run a solver, run Lean/Lake, replay a
certificate, or claim to be the mandatory post-round miner.  The artifact was
still `RUNNING`; `survivors.jsonl` was empty at inspection time, but that is not
a terminal or completeness result.

The detailed distributions below are pinned to the first 24,666 complete lines
of `learned-certificates.jsonl` as observed at `2026-08-01T15:22:26Z`
(`08:22:26 PDT`):

- byte length of pinned prefix: `110068043`;
- SHA-256 of pinned prefix:
  `7f31d598bcf42083a99f0af20abb9b461c015e32acab8ff58984c139544c8ab9`;
- 472 records are bootstrap structural records and 24,194 are dynamic solver
  records;
- reconstructed active antichain at that prefix: 22,383 clauses.

The live manifest changed after the prefix was captured, as expected.  Its own
claim is only a bounded structural CEGAR checkpoint: no Euclidean,
P97-realizable, kernel-level, completeness, or non-existence claim.  Per-cube
UNSAT is explicitly unverified and is not terminal.  The concrete certificate
ingress is Python-checked, not landed as concrete Lean certificates.

## Cut-stage distribution

`Total` counts every historical learned record in the pinned prefix.  `Active`
replays every `superseded_nogood_sha256` deletion and counts the reconstructed
active antichain.

| Cut stage | Total | Active |
|---|---:|---:|
| `equality-duplicate-center` | 23,434 | 21,170 |
| `equality-equilateral-bisector-collision` | 614 | 605 |
| `equality-three-triad-collision` | 161 | 160 |
| `cap-order-convex-five-point-exhaustive` | 134 | 134 |
| `equality-perpendicular-bisector-convex` | 122 | 116 |
| `shared-pair-cyclic-separation-exhaustive` | 109 | 109 |
| `equality-equal-k4` | 38 | 38 |
| `equality-surplus-source-collision` | 10 | 8 |
| `equality-six-point-two-pair-collision` | 9 | 9 |
| `equality-six-row-anchor-collision` | 7 | 7 |
| `equality-six-point-circle-chain-collision` | 7 | 7 |
| `equality-six-point-five-circle-collision-a` | 6 | 6 |
| `equality-six-point-five-circle-collision-c` | 6 | 5 |
| `equality-eight-point-five-circle-collision` | 4 | 4 |
| `equality-six-point-five-circle-collision-b` | 1 | 1 |
| `equality-seven-point-twin-four-circle-collision` | 1 | 1 |
| `equality-seven-point-six-circle-collision` | 1 | 1 |
| `equality-seven-point-orbit-collision` | 1 | 1 |
| `equality-seven-point-five-circle-collision` | 1 | 1 |
| **Total** | **24,666** | **22,383** |

The dominant duplicate-center family is 95.01% of historical cuts and 94.58%
of the active antichain.  The next largest families are equilateral-bisector,
three-triad, cap-order five-point, perpendicular-bisector, and shared-pair
separation.  All already have named existing structural consumers; this prefix
does not suggest a missing local theorem for those stages.

## Origin and certificate distribution

| Origin | Total | Active |
|---|---:|---:|
| `solver-structural-path-memberships` | 23,951 | 21,669 |
| `bootstrap-structural-path-memberships` | 472 | 471 |
| `solver-cap-order-convex-five-point` | 134 | 134 |
| `solver-shared-pair-cyclic-separation` | 109 | 109 |

| Learned certificate schema/class | Total | Active |
|---|---:|---:|
| checked equality-path replay | 24,423 | 22,140 |
| cap-order convex-five-point certificate v1 | 134 | 134 |
| shared-pair cyclic-separation certificate v1 | 109 | 109 |

The manifest classifies every dynamic certificate as `STRUCTURAL`; the pinned
prefix has 24,194 dynamic records.  There were no dynamic algebraic,
real-distinctness, equilateral-shell, or Kalmanson cuts in the manifest around
this checkpoint.

Separately, the embedded bootstrap algebraic bank contains seven hash-pinned
templates:

- five `UNIT_EQUALITY_INFEASIBILITY` QQ identities, with antecedent literal
  counts `15,16,25,27,36` and respectively `6,6,8,9,10` used rows;
- one `REAL_DISTINCTNESS_CONTRADICTION` identity (23 literals, 7 used rows);
- one `EQUILATERAL_SHELL_REAL_DISTINCTNESS_CONTRADICTION` identity
  (26 literals).

All seven say `identity_replayed=true`, while the embedded bank metadata says
`lean_kernel_checked=false`.  The five UNIT identities require the external
gauge precondition `P0 != P1`; they are represented as bootstrap templates,
not newly observed dynamic cuts in this prefix.

## Antecedent/cut size distribution

For equality-path records there is no separate `certificate.antecedent`
object, so the operational antecedent size is the learned clause length.  For
both exhaustive order certificate schemas, `antecedent.literal_count` equals
the clause length.  Thus the following is the uniform cut-antecedent literal
distribution.

| Literals | Total | Active | Literals | Total | Active |
|---:|---:|---:|---:|---:|---:|
| 9 | 3,216 | 3,193 | 27 | 9 | 9 |
| 10 | 3,225 | 3,201 | 28 | 5 | 5 |
| 11 | 1,431 | 1,362 | 29 | 2 | 2 |
| 12 | 2,706 | 2,581 | 30 | 7 | 7 |
| 13 | 1,989 | 1,837 | 31 | 6 | 6 |
| 14 | 2,542 | 2,301 | 32 | 7 | 7 |
| 15 | 1,966 | 1,750 | 33 | 10 | 10 |
| 16 | 2,761 | 2,476 | 34 | 2 | 2 |
| 17 | 1,422 | 1,176 | 35 | 8 | 8 |
| 18 | 1,277 | 1,001 | 36 | 6 | 6 |
| 19 | 771 | 562 | 37 | 11 | 11 |
| 20 | 652 | 488 | 38 | 2 | 2 |
| 21 | 290 | 164 | 39 | 4 | 4 |
| 22 | 179 | 100 | 40 | 5 | 5 |
| 23 | 61 | 31 | 41 | 5 | 5 |
| 24 | 71 | 55 | 42 | 2 | 2 |
| 25 | 9 | 7 | 44 | 2 | 2 |
| 26 | 5 | 5 | | | |

The concentration is genuinely small: 6,441/24,666 cuts have 9 or 10
literals, and 12,567/24,666 have at most 14.  By stage, the informative ranges
are:

- duplicate-center: 9--27, mean 13.43;
- shared-pair separation: 9--11, mean 10.02;
- cap-order five-point: 14--44, mean exactly 30.00;
- three-triad: 16--24, mean 16.60;
- perpendicular-bisector: 12--24, mean 14.75;
- equilateral-bisector: 16--24, mean 16.30;
- named six-/seven-/eight-point circle-network stages: typically 20--28.

Selected certificate rows range from 2 to 10.  The full row-count histogram is
`2:109, 3:540, 4:7106, 5:5060, 6:5202, 7:3800, 8:1980,
9:622, 10:113`; all 24,666 represented rows have `exact=false`.

## Duplicate and subsumption indicators

The prefix is clean with respect to exact replay duplication:

- 24,666/24,666 distinct `record_sha256` values;
- 24,666/24,666 distinct `clause_sha256` values;
- 24,194/24,194 distinct non-null dynamic `assignment_sha256` values;
- therefore zero exact repeated clauses and zero repeated dynamic assignments.

Subsumption is active and material:

- 1,483 new records superseded at least one older nogood;
- they superseded 2,283 historical nogoods in total (maximum 26 from one new
  record);
- superseding record stages were duplicate-center (1,406 records removing
  2,156 nogoods), equal-K4 (13 removing 20), equilateral-bisector (41 removing
  49), perpendicular-bisector (21 removing 56), and three-triad (2 removing
  2);
- replaying the removals yields exactly 22,383 active clauses;
- an independent trie subset pass found zero strict subset pair among those
  22,383 active clauses.

Thus the stored active collection behaves as the advertised antichain.  The
large gap between historical and active duplicate-center cuts also says that
post-round theorem mining should operate on the active antichain or explicitly
account for supersession, rather than treating all historical records as
independent motif support.

## Requested motif checks

### Six-pair skew-Bollobas

For every certificate, I tested the natural row-derived ordered set pairs
`A_i={center_i}, B_i=support_i`, and the swapped orientation.  The test asks for
six distinct rows with every required earlier/later cross-intersection.  There
were **zero** six-pair hits in either orientation across all 24,666 records.

This rules out only the canonical singleton-center/support construction.  It
does not rule out a more elaborate set-pair construction assembled from
several rows.  The first missing bridge remains a canonical construction with
all disjointness and cross-intersection conditions proved; there is no current
high-value skew-Bollobas theorem candidate in the prefix.

### Closed angular-midpoint

No certificate contains coordinates, midpoint witnesses, angle values,
oriented-angle equalities, or an angular closure proof.  As an incidence-only
prefilter, joining two selected centers when their supports overlap in at
least two points gives positive graph cycle rank in 16,757/24,666 records
(cycle ranks 1--15; 19,609 graphs are connected).  This abundance is not
geometric evidence: it is generated overwhelmingly by duplicate-center rows
and does not certify a midpoint or a closed angular component.

Therefore a closed angular-midpoint motif is **not represented soundly**.  A
post-round miner would first need a coordinate/oriented-angle ingress or an
existing theorem converting the exact row configuration to certified midpoint
and angle data.

### Miquel / Clifford / bundle

There are 28 superficially related named circle-chain/network records in the
six-/seven-/eight-point stages:

- 7 six-point circle-chain;
- 13 six-point five-circle (`a/b/c`);
- 1 seven-point five-circle;
- 1 seven-point six-circle;
- 1 seven-point twin-four-circle;
- 1 seven-point orbit;
- 4 eight-point five-circle.

They record positive equal-distance/concyclic membership consequences, but all
rows are `exact=false` and the records do not supply the full required
intersection, nondegeneracy, exact-circle, or transfer hypotheses for a sound
Miquel/Clifford/bundle theorem.  The records already terminate in existing
equality consumers.  No direct sound Miquel/bundle candidate is represented,
and a new theorem here is lower value than concrete certificate ingress.

### Circle power matrix

No record or certificate field names a power matrix, and the dynamic algebraic
cut count is zero.  Positive row memberships can provide some zero-power
entries, but `exact=false` supplies no off-row nonzero entries.  Hence the
unique-possible-matching antecedent of the existing
`CirclePowerMatrix.false_of_powerMatrix_unique_possible_matching` cannot be
constructed soundly from these records.  There is no full 5-by-5 power-matrix
pattern represented in this prefix.

### Two-triple-row six-point

This is the one strong preparatory signal.

Ignoring boundary order, every one of the 24,666 certificates contains a
positive-incidence pair of rows of the combinatorial form

`B:{A,C,D,...}` and `F:{A,D,E,...}`

on six distinct labels.  That incidence-only fact is too weak: the existing
Euclidean theorem additionally needs cyclic order `A<B<C<D<E<F`.

I then tested exactly the 5,832 supplied order entries in the 243 order-aware
certificates:

| Order certificate family | Records | Order entries | Records with any hit | Records with all supplied orders hit | Hit order entries |
|---|---:|---:|---:|---:|---:|
| cap-order convex-five-point | 134 | 3,216 | 63 | 8 | 724 |
| shared-pair separation | 109 | 2,616 | 0 | 0 | 0 |

The 724 hits realize 64 label-level ordered patterns.  This is not a new
general theorem: the source-clean metric theorem and boundary adapter already
exist in
`lean/Erdos9796Proof/P97/ATail/TwoTripleRowSixPointEuclideanObstruction.lean`
as `metric_orientation_incompatibility` and
`false_of_six_ccw_two_triple_row_equalities`.  The theorem was previously
reported as a banked exact small pattern.

What is new in this prefix audit is the concrete frequency signal.  After the
round ends, a dedicated authenticated two-triple detector is high value:

1. the cap-order source clauses are long (14--44, mean 30), whereas the banked
   pattern is small;
2. 724 existing order leaves may admit smaller theorem cuts;
3. 8 cap-order records have a two-triple hit in all 24 supplied orders and are
   especially promising all-order minimization targets;
4. the other 55 hit records may support partial replacement inside their
   all-order coverage certificates.

The miner must not merely use the incidence-only hit.  It must authenticate
the supplied cyclic order, minimize enough cap/order facts to cover every
compatible completion, emit a checked clause, and compare it against the live
active antichain.  Until that bridge exists, these are order-leaf candidates,
not new learned clauses or Lean closure.

### UNIT equality

UNIT equality is represented only through the five embedded bootstrap QQ
identities described above.  They are exact externally replayed identities
conditional on the similarity gauge, but the embedded metadata does not claim
kernel checking, and no dynamic algebraic cut was learned in the pinned
prefix.  There is therefore no emerging new UNIT pattern here.  A post-round
check should simply test whether any final active/surviving systems match one
of the five hash-pinned antecedent templates; it should not infer a universal
equality theorem from their presence in `bootstrap.json`.

## Preparatory priority after the round ends

1. **Mine the already-banked two-triple theorem against authenticated cap-order
   coverage.**  Start with the 8 all-24-order records, then the remaining 55
   partial records.  This is a cut-minimization/coverage task, not theorem
   invention.
2. **Run on the terminal active antichain, not historical cuts.**  Supersession
   already removed 2,283 prefix nogoods and exact duplicate counts are zero.
3. **Treat angular cycles and circle networks only as prefilters.**  The current
   schemas lack the geometric data needed for angular-midpoint,
   Miquel/bundle, or power-matrix hypotheses.
4. **Recheck the five UNIT templates only against final unmatched systems.**
   They are present but did not fire dynamically in this prefix.
5. **Do not prioritize skew-Bollobas from the current row encoding.**  Both
   natural six-pair orientations have zero hits.

No new cardinality-independent geometric theorem is established by this
preparatory audit.  The concrete high-value opportunity is reuse of an
existing small Lean theorem to shrink or replace some long cap-order cuts once
the running round has ended and the artifacts can be hash-pinned normally.
