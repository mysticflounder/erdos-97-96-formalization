# Crossed-arm theorem-bank CEGAR audit

Date: 2026-08-01

## v5 raw `btw_sep` cyclic closure

The v5 encoder adds the recut-invariant raw-radius instance of
`Problem97.SurplusCOMPGBank.btw_sep`.  For every unordered endpoint pair
`{i,j}` and every unordered pair of distinct nonendpoint centers `{a,b}`, the
CEGAR matcher detects

```text
E(a,i,j) and E(b,i,j) and a,b lie on the same cyclic side of i,j
```

and learns the guarded cut

```text
not E(a,i,j) or not E(b,i,j) or XOR(B(a,b,i), B(a,b,j)).
```

Here `B(a,b,x)` is strict linear betweenness.  The XOR is invariant under
changing the linear cut and under reversal.  The theorem-role mapping is
`(i,j,a,b) := (a,b,i,j)`; this is a raw equality cut, not the weaker selected
K4-row membership projection.

The exhaustive checks cover all 24 four-point orders, all four equality truth
assignments (96 cases), rotations, reversal, and role swaps.  They also cover
all 120 five-point orders with an irrelevant point, 600 recuts, 120 reversals,
and 480 equality assignments.  With both equalities forced, the censuses are
exactly 16 rejected / 8 accepted at four points and 80 / 40 at five points.

The result schema is now
`n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v5`; learned-cut
manifests use `n17-crossed-arm-learned-cuts-v3`.  Ordinary resume remains
current-schema strict.  Universal import accepts the historical v4/v2 and
v3/v1 schema pairs and reconstructs their three pre-v5 structural families;
it does not pretend those artifacts already contain raw `btw_sep` cuts.

The corrected `n = 17` source-at-common run was subsequently completed while
importing and reconstructing the schema-v4 universal cuts. It returned finite
`SAT` after 435,815 ms, with 767 candidates, 3,149 structural raw-`btw_sep`
cuts, and 112,601 theorem cuts. The witness order is

```text
a1,t2,t3,t4,t1,a2,q1,r1,p2,r2,p1,q2,a3,s1,s4,s3,s2
```

That witness is eliminated by an existing production Lean metric route omitted
from v5. It has `E(a1,p2,p1)` and `E(p1,p2,a1)`, so
`Problem97.dist_eq_dist_of_mutual_bisector` yields `E(p2,a1,p1)`. It also has
`E(t3,a1,p1)` and `a1 < t3 < p2 < p1`, contradicting
`Problem97.false_of_two_centers_equidistant_pair_enclosed`. Declaration-level
axiom reports for these two theorems contain only `propext`,
`Classical.choice`, and `Quot.sound`, with no `sorryAx` or custom axiom. These
are theorem-local reports, not a global import-closure audit.

The full-radius and lazy-v5 QF_NRA runs both returned `UNKNOWN` after
122,803 ms and 123,543 ms respectively. The earlier schema-v4 metric-only
`UNSAT` is historical and concerns a different shadow; it must not be used as
the verdict for either v5 query.

## v6 mutual-bisector transport family

The v6 encoder adds the sound canonical Horn family
`mutual_bisector_transport`:

```text
not E(c1,q,c2) or not E(c2,q,c1) or E(q,c1,c2)
```

It generates exactly 2,040 canonical `(q,{c1,c2})` instances at `n = 17`.
The v6 source-at-common rerun imports the validated v5 result, reconstructing
and validating its importable arm-independent cuts before this new family is
applied. Its first 900-second tranche ended `UNKNOWN_FAIL_CLOSED` after
eliminating 1,443 candidates. It accumulated 6,382 structural cuts (5,411
raw-`btw_sep` and 971 mutual-bisector transports) and 153,894 theorem cuts.
The last solver check returned `unknown`/`canceled` when the total budget was
exhausted. A strict resume then returned `SAT` after 396,042 ms and 438 further
candidates, with cumulative totals of 6,956 structural cuts and 164,735
theorem cuts. Its serialized witness passes the complete v6 semantic replay.
Thus v6 has a survivor and no `UNSAT` result.

The solver-free v7 replay rejects that survivor by 23 global-edge equality
violations. The first serialized false atom is `E(t2,r1,q1)`, but the positive
local equalities give the undirected-edge chain

```text
{r1,t2} = {q2,r1} = {a1,q2} = {a1,q1} = {q1,t2}.
```

The new exact-11 six-role family has zero matches among the 12,376 ordered
sextuples in this witness. Thus this particular kill comes from completing
the equality quotient, not from adding another theorem-bank case split.

## v7 global-edge equality and exact-11 six-role checkpoint

`CrossedAudit` now enables one global undirected-edge equality-class encoding.
At `n = 17` this introduces 136 undirected-edge constants and 2,040
`E(center,left,right)` biconditionals. It replaces the redundant 28,560
center-local radius-transitivity clauses and 4,080 mutual-triangle transport
clauses without losing their equality semantics. The Lean reference for this
edge-closure model is
`Problem97.Census554.EqualityCore.EdgeClosure.sound`.

The theorem bank also includes the exact-11 family
`six_k2_three_row_triangle`, backed by
`Problem97.UniqueFourKalmansonOccurrenceScratch.false_of_two_k2_three_row_triangle`.
Its guard requires the strict six-role order
`i0 < i1 < i2 < i3 < i4 < i5` and the three row supports

```text
i0: {i3, i5}
i1: {i4, i5}
i2: {i3, i4}
```

The guard self-check examines all 720 linear orders, admits exactly the stated
one, and admits neither reversal nor a cyclic recut. A focused Lean 4.27 check
of the theorem passed; its axiom report is exactly `[propext,
Classical.choice, Quot.sound]`.

The current v7 result/v5 cut-schema manifest has 20 theorem families. Restore
for that schema pair accepts exactly either the frozen pre-family 19-family v7
manifest or the current 20-family manifest, and normalizes the next emitted
manifest to the current 20 families. The v3 through v6 schema pairs remain
frozen at 19 families.

These changes are bounded `n = 17` discovery machinery. They are not Lean
closure and do not close the arbitrary-`n` anchor.

The completed schema-v7 `source-at-common` run returned replay-PASS finite
Boolean `SAT` after 853,449 ms and 725 connected candidates, with 7,777
structural cuts and 183,331 theorem cuts. Its serialized radius partition
induces 58 spanning-forest generators for the 136 undirected distance
variables and 78 quotient classes. The compact metric basis retains 77
positivity representatives, one for every non-gauge class, and 1,001
representatives for quotient-class pairs observed in the original radius
disequalities. It deliberately does not assert disequality for every pair of
the 78 quotient classes. The gauged lazy Z3 QF_NRA run returned `UNKNOWN` at
24 active radius-equality atoms under the 120-second cap. This gives neither a
Euclidean realization nor a metric impossibility result.

The exact six-role order guard is essential. Coarse center/support block
separation (`CCC|SSS`) and the three selected-row equalities alone admit the
strict-convex cyclic configuration

```text
C=(-2,-1), A=(0,-2), B=(2,-1), V=(1,1), X=(0,2), U=(-1,1)
|A-U|^2 = |A-V|^2 = 10
|B-U|^2 = |B-X|^2 = 13
|C-V|^2 = |C-X|^2 = 13
```

in the displayed order. Its consecutive turn determinants are
`4,5,1,2,1,5`, so the polygon is strictly convex. A production adapter must
use additional five-center exact-row geometry to eliminate this realizable
phase; cap-block separation alone cannot discharge the generic Kalmanson
guard.

## Question and result

The following table is the historical schema-v4 bounded audit of the two
crossed alternatives in
`FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual`, starting from the
replayed `n = 17`, closed-cap profile `(6, 8, 6)` finite model.

Both alternatives were **SAT** in that schema after independently forcing the crossed
memberships, replaying the collision-deletion exact-row packet, and adding all
then-encoded source-proved finite geometric projections. The later v5
source-at-common witness is eliminated by the mutual-bisector transport route
above. The resumed v6 survivor is eliminated by the v7 global-edge quotient as
described above. The table is not a current branch verdict.

| arm | result | candidates | theorem cuts | elapsed |
| --- | --- | ---: | ---: | ---: |
| `source-at-common` | SAT, replay PASS | 91 | 2097 | 15.309 s |
| `other-at-common` | SAT, replay PASS | 26 | 521 | 8.049 s |

All three proved direction-preserving cyclic selected-row families are encoded:

1. first nonlinear (`direct`);
2. forward second (`forward-second`); and
3. reversed second (`reversed-second`).

No proved cyclic family was omitted.  The family self-check covers all 120
linear orders: each family rejects exactly the five positive cyclic rotations
of its antecedent and rejects no reversed rotation.

## Encoding

The audit uses an explicit one-hot ordered pair `(Q.source, Q.other)` among the
vertices outside the first cap.  It enforces that `Q.source` has the same actual
blocker as `P.source1`, and that both ordered points lie in that exact blocker
row.  Existing exact-row cardinality and cap-intersection constraints then
replay the live `outside_eq_pair` packet.

The finite base audit enables:

- one global undirected-edge equality partition and global selected K4 rows;
- exact critical shells and q-free deletion;
- minimality/connectivity CEGAR;
- the collision pairs and common q source pair;
- exact cap intersections and cap-block cyclic order;
- the collision five-center deletion selector;
- both source-proved incidence projections;
- cap-crossing Kalmanson constraints; and
- full selected-row shared-pair separation.

The forced arms are:

- `source-at-common`: `Q.source in row(bq)` and `Q.other in row(br)`;
- `other-at-common`: `Q.other in row(bq)` and `Q.source in row(br)`.

Here `bp = blocker(P.source1)`, `bq = blocker(source)`, and
`br = blocker(Prho.source1)`.

## Historical schema-v4 replayed survivors

### `source-at-common`

Live names are mapped as follows:

```text
P.source1 = p1       P.source2 = p2
Prho.source1 = r1    Prho.source2 = r2
source = q1          source' = q2
Q.source = s2        Q.other = t2
bp = q1              bq = r1             br = p1
```

The relevant exact rows are:

```text
row(bp=q1) = {t2, p1, p2, s2}
row(bq=r1) = {q1, q2, s2, s3}
row(br=p1) = {t2, r1, r2, s1}
```

Thus the forced crossed literals are `s2 in row(r1)` and
`t2 in row(p1)`.  The selected deletion arm deletes `P.source2 = p2`; every
one of the five selected center rows avoids `p2`.

### `other-at-common`

```text
P.source1 = p1       P.source2 = p2
Prho.source1 = r1    Prho.source2 = r2
source = q1          source' = q2
Q.source = t1        Q.other = t3
bp = q1              bq = r1             br = p1
```

The relevant exact rows are:

```text
row(bp=q1) = {t1, t3, p1, p2}
row(bq=r1) = {a1, t3, q1, q2}
row(br=p1) = {t1, r1, r2, a3}
```

Thus the forced crossed literals are `t3 in row(r1)` and
`t1 in row(p1)`.  The selected deletion arm deletes `Prho.source2 = r2`; every
one of the five selected center rows avoids `r2`.

Both witnesses replay:

- 61,880 two-circle and 61,880 common-bisector incidence checks;
- all 60 cap-crossing checks;
- all 14,280 shared-pair-separation candidates (10 active in the first arm and
  9 active in the second);
- the full 17-point cap-block order; and
- zero active matches of each of the three cyclic theorem families.

## Nearest bank relations and honest gap

For `source-at-common`, a model-local forward-second antecedent using both
forced literals is one positive membership short.  Two nearest instances are:

```text
(s1, s2, t2, p1, r1), missing s1 in row(r1)
(s3, s2, t2, p1, r1), missing s3 in row(p1)
```

For `other-at-common`, every nearest antecedent using both forced literals is
two memberships short.  One example is the forward-second tuple
`(a1, t1, t3, r1, p1)`, missing `a1 in row(p1)` and `p1 in row(r1)`.

These are only survivor-local diagnostics: `s1` and `s3` are arbitrary fourth
row members, not live named points.  The audit therefore does **not** establish
that a single universal occurrence lemma is missing.  The exact smallest
universal metric/order relation remains unknown.

The three-row crossed shell is only the base configuration

```text
row(bp) contains {P.source1, P.source2, Q.source, Q.other}
row(bq) contains {source, source', one crossed point, fourth_bq}
row(br) contains {Prho.source1, Prho.source2, the other crossed point, fourth_br}
```

under the cap-block cyclic order. `CCC|SSS` separation and these three
equalities are realizable, as the explicit six-point configuration above
shows. A closing theorem must additionally extract enough of the full
five-center exact-row geometry to eliminate the remaining cyclic phase and
reach one of the exact direct/reflected Kalmanson guards, or derive a different
metric contradiction.

The next bounded diagnostic forces the two anonymous fourth support vertices
to coincide and resumes the completed v7 learned-cut checkpoint. Any survivor
must again be semantically replayed before further QF_NRA or theorem
extraction. A bounded `UNSAT` result would still eliminate only this finite
abstraction and would not be a universal Lean proof.

## Current schema-v9 checkpoint (2026-08-01)

The legacy source-at-common v9 checkpoint processed two further tranches.  It
contains 9,082 structural cuts and 228,898 theorem-cut keys and ended
`UNKNOWN_FAIL_CLOSED` at the exact 1,800-second deadline.  Exact restore-local
formula caching reconstructs that checkpoint in 79.027 seconds after base
encoder construction; cached and uncached formulas have identical Z3
`sexpr`s in the regression fixtures.

The checkpoint is now normalized before replay.  Exact selected-row/raw
subsumption removes 6,195 theorem keys, and exact cyclic-orbit
canonicalization identifies all 38,707 `reversed_second` keys with rotated
`first` keys.  Thus the compact source restore starts from 183,996 canonical
theorem instances, not 228,898 mathematically distinct cuts.  Its first live
candidate took 8.831 seconds end to end and added three structural keys and 26
canonical theorem keys, ending at 9,085 and 184,022 respectively with
`UNKNOWN_ITERATION_LIMIT`.  These are instances of a fixed 22-family theorem
registry, not separate Lean proof obligations.

The first full other-at-common v9 tranche imported the source checkpoint and
ran for 1,800.028 seconds.  It processed 871 candidates, added 346 structural
and 18,418 theorem cuts, and ended `UNKNOWN_FAIL_CLOSED` with 9,428 structural
and 241,121 pre-orbit-normalization theorem keys.  Its mandatory audit found
41,640 `reversed_second` cyclic aliases in the accumulated state, including
2,933 introduced by this arm.  The audit is recorded in
`OTHER_AT_COMMON_V9_WAVE_UNIVERSAL_CANDIDATES.md`; it found no new universal or
general-cardinality theorem.

The exact critical-K4 block has also been compressed without changing its
truth table: 371,280 negative triple clauses are replaced by 3,264 guarded
unit-weight `PbLe` constraints.  Exhaustive tests cover all 32,760 tail
assignments for rows 3 through 14.  `compact-pb` is the default for new runs;
historical checkpoints with omitted representation metadata remain fixed to
the legacy triple-clause interpretation and conflicting explicit metadata is
rejected.

The mandatory source post-round global indexed-Lean and theorem-bank pass is
recorded in `V9_WAVE_UNIVERSAL_CANDIDATES.md`.  It found no credible new
universal or general-cardinality theorem: all 23,470 fresh theorem keys
instantiate existing families, and the global fourteen-role family matched
zero times.  The compact one-candidate audit in
`COMPACT_SOURCE_ONE_CANDIDATE_UNIVERSAL_AUDIT.md` likewise found no new family.

The full compact source continuation has since reached a replay-validated
`SAT` fixed point in
`source-at-common-compact-v9-canonical-resume-1800s-critical-k4-compact-pb/`.
It processed 1,197 connected candidates and stopped with 9,488 structural and
205,225 canonical theorem keys.  Because the final survivor activates no new
instance of any registered family, more time with the same 22-family matcher
cannot change this result.  The required post-round audit is
`COMPACT_SOURCE_V9_SAT_WAVE_UNIVERSAL_AUDIT.md`; it confirms that every fresh
key is an existing-family instance and that no registered theorem eliminates
the survivor.  This is finite Boolean fixed-point evidence, not Euclidean
realizability or closure.

The complete 17-point metric replay of that survivor contains 2,180 atoms.
Direct QF_NRA solving timed out `UNKNOWN` after 300 seconds.  Exact induced-
core mining then found a seven-point, eleven-equality subsystem with distance-
class sizes `5,3,3,2,2,2`.  Singular over characteristic zero reduces its
gauge-fixed ideal to `1`; msolve independently agrees in both variable orders,
while Z3 and cvc5 remain `UNKNOWN`.  No production signature or indexed Lean
theorem matches the pattern.  The resulting universal candidate says that the
eleven squared-distance equalities force the two gauge anchors to coincide.
It is still fixed-witness evidence until that theorem is kernel-proved and a
generic edge-closure occurrence matcher is proved sound.

All 22 theorem-cut families now name exact production Lean producers.  The
deterministic direct Boolean exporter in
`scripts/crossed_arm_cegar_v9_encoding.py` and
`scripts/materialize_crossed_arm_cegar_v9.py` closes the canonical input-
formula/provenance boundary, including authenticated checkpoint rereading and
adversarial regeneration tests.  It does not supply an `UNSAT` result or a
proof certificate.  The generic production scripts now also materialize
hash-bound two-shard pure-RUP packages, bounded replay windows, and compact
Lean replay modules; their 18 focused tests pass.  No crossed-arm LRAT input
exists yet, so this is reusable certificate infrastructure rather than a
certificate for either arm.  Proof-producing exhaustion and the Lean base/
structural semantic bridge remain open.  The source-at-common and
other-at-common orientations are not interchangeable in the live packet, so
both must be exhausted and checked unless a new blocker-equality theorem first
identifies their asymmetric source data.

## Trust boundary

This is finite Boolean incidence/order evidence only. The historical SAT
witnesses were semantically replayed, the v5 witness fails the existing
mutual-bisector transport route, the resumed v6 witness fails the global-edge
equality replay, and the completed v7 run has a different replay-PASS finite
Boolean witness. V7 remains bounded discovery machinery rather than a proof of
the arbitrary-`n` anchor. None of this is Lean closure or a universal claim.
Deliberately omitted are:

- Euclidean coordinates and QF_NRA realizability;
- MEC and nonobtuse-triangle inequalities;
- full `CounterexampleData` and `noM44` geometry;
- a global Lean build, kernel closure, and transitive import-closure audit; and
- every `n` other than 17 and every closed-cap profile other than `(6, 8, 6)`.

Bounded Boolean `SAT` claims are made for the completed v7 run and the compact
v9 source fixed point, both backed by semantic replay.  The seven-point core is
exact external algebraic evidence for a universal equality theorem, but it is
not yet a Lean theorem or a proved generic occurrence.  No Boolean `UNSAT`
certificate, Euclidean coordinate realization of the survivor, QF_NRA
conclusion, arbitrary-`n` closure claim, or Lean/kernel closure is claimed.
The focused theorem axiom reports apply only to their named declarations, not
to a global import closure.

## Reproduction and artifacts

From the repository root:

```bash
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py --self-check
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py --replay-mutual-bisector-witness scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/source-at-common-full-metric-bank-v5-raw-btw-sep-import-v4/witness.json
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py --arm source-at-common --timeout-ms 900000 --max-iterations 5000 --run-tag full-metric-bank-v6-mutual-bisector-import-v5 --import-universal-cuts scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/source-at-common-full-metric-bank-v5-raw-btw-sep-import-v4/result.json
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py --arm source-at-common --timeout-ms 900000 --max-iterations 5000 --run-tag full-metric-bank-v6-mutual-bisector-resume-01 --resume scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/source-at-common-full-metric-bank-v6-mutual-bisector-import-v5/result.json
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py --replay-v7-witness scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/source-at-common-full-metric-bank-v6-mutual-bisector-resume-01/witness.json --replay-v7-output scratch/crossed-arm-v7-v6-survivor-replay.json
```

Other current-encoder arm commands and the historical survivor analyzer are:

```bash
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py --arm source-at-common
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py --arm other-at-common
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/analyze_survivors.py
```

Each completed arm directory contains `result.json`, `iterations.jsonl`, and,
when SAT, `witness.json`. `nearest-live-bank-relations.json` records the
historical schema-v4 nearest-antecedent analysis. All important scratch output
stays under this repository tree rather than `/tmp`.

Focused v7 self-check artifacts are under `scratch/crossed-arm-v7-*`, including
the global-edge equality and exact-11 six-role guard reports. The v6-survivor
replay is `scratch/crossed-arm-v7-v6-survivor-replay.json`. The latest full
checkpoint roundtrip is `ROUNDTRIP_OK`: it reconstructs all 20 current theorem
families, resumes and cross-arm imports the frozen 19-family pre-family v7
form, normalizes the resulting manifest, and validates the older v3--v6 import
paths.
