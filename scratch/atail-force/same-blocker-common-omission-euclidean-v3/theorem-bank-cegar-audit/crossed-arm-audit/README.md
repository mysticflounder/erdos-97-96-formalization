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
exhausted. Thus there is no v6 survivor and no v6 `UNSAT` result; the artifact
is a validated resume checkpoint. Excluding the displayed v5 witness still
eliminates only one finite abstract shadow and does not prove the universal
Lean anchor.

## Question and result

The following table is the historical schema-v4 bounded audit of the two
crossed alternatives in
`FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual`, starting from the
replayed `n = 17`, closed-cap profile `(6, 8, 6)` finite model.

Both alternatives were **SAT** in that schema after independently forcing the crossed
memberships, replaying the collision-deletion exact-row packet, and adding all
then-encoded source-proved finite geometric projections. The later v5
source-at-common witness is eliminated by the mutual-bisector transport route
above, and the first v6 tranche is fail-closed without a survivor or an
`UNSAT` result; the table is not a current branch
verdict.

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

- complete radius-equivalence relations and global selected K4 rows;
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

The stable missing object is a local three-row obstruction for the triangle

```text
row(bp) contains {P.source1, P.source2, Q.source, Q.other}
row(bq) contains {source, source', one crossed point, fourth_bq}
row(br) contains {Prho.source1, Prho.source2, the other crossed point, fourth_br}
```

under the cap-block cyclic order.  A closing theorem must either force a named
positive membership/order localization from the full terminal geometry, or
rule this three-row crossed-shell pattern out directly by Euclidean metric
equalities.

The current computational step is a strict resume from the first schema-v6
source-at-common checkpoint. If
a finite shadow survives, it must be replayed against the production metric
routes before any further QF_NRA or theorem extraction. If the family makes the
finite model UNSAT, that still eliminates only the bounded abstraction and is
not a universal Lean proof.

## Trust boundary

This is finite Boolean incidence/order evidence only. The historical SAT
witnesses were semantically replayed, but the v5 witness fails the existing
mutual-bisector transport route; v6 has so far returned only the fail-closed
timeout checkpoint described above. None of this is Lean closure or a
universal claim. Deliberately omitted are:

- Euclidean coordinates and QF_NRA realizability;
- MEC and nonobtuse-triangle inequalities;
- full `CounterexampleData` and `noM44` geometry;
- a global Lean build, kernel closure, and transitive import-closure audit; and
- every `n` other than 17 and every closed-cap profile other than `(6, 8, 6)`.

No current SAT, UNSAT, or certificate claim is made for v6. The two local
production-theorem axiom reports exclude `sorryAx` and custom axioms only for
those declarations.

## Reproduction and artifacts

From the repository root:

```bash
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py --self-check
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py --replay-mutual-bisector-witness scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/source-at-common-full-metric-bank-v5-raw-btw-sep-import-v4/witness.json
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py --arm source-at-common --timeout-ms 900000 --max-iterations 5000 --run-tag full-metric-bank-v6-mutual-bisector-import-v5 --import-universal-cuts scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/source-at-common-full-metric-bank-v5-raw-btw-sep-import-v4/result.json
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/crossed_arm_cegar.py --arm source-at-common --timeout-ms 900000 --max-iterations 5000 --run-tag full-metric-bank-v6-mutual-bisector-resume-01 --resume scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-audit/source-at-common-full-metric-bank-v6-mutual-bisector-import-v5/result.json
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
