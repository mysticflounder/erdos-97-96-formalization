# Skeptic audit: seven-point three-rhombus collision

Date: 2026-08-01
Audited document: `docs/p97-phase3-prefix-global-theorem-search-2026-08-01.md`
Mode: source and pinned-artifact inspection only; no Lean/Lake invocation, solver,
generator, certificate replay command, or kernel/axiom gate

## Verdict

The seven-point obstruction is mathematically sound, the three displayed cycles
and the algebraic conclusion `x1 = x6` are correct, and the concrete thirteen
positive Phase-3 memberships do force the ten required distances to have one
common value.  The injectivity contradiction is also correct and does not use
negative memberships or off-support inequalities.

There are two corrections to the report's status claims.

1. The prose proof at lines 99--103 names the wrong reflection axis.  The two
   intersections of equal-radius circles centered at `A` and `C` are reflected
   across the **line `AC`**, not across the perpendicular bisector of `AC`.
   Reflection across the perpendicular bisector fixes each intersection point.
   Consequently the midpoint conclusion does not follow from the sentence as
   written.  This is a repairable proof defect, not a counterexample to the
   lemma or theorem.  Until that sentence is corrected, the report's
   "complete prose proof" classification at lines 16 and 50 is too strong.
2. The thirteen-atom lower bound is proved only for a specifically delimited
   direct positive-row equality model.  The unqualified statement at line 220
   that the fixed shape is "the cheapest certificate" is not established for
   arbitrary Phase-3 certificates, other geometric obstructions, or learned
   clauses.  The report itself records shorter historical clauses at lines
   456--459.

All reproduced finite counts below are **EMPIRICALLY VERIFIED** for the named
files and pinned prefixes.  They do not establish aggregate Phase-3 closure or
kernel-checked soundness.

## 1. Four-cycle lemma, including degenerate and crossed cases

The lemma is true under the weaker hypotheses `A != C`, `B != D` and the four
side equalities.  Pairwise distinctness is more than sufficient.

Let `M = (A+C)/2`.  Because `B` and `D` are each equidistant from `A` and `C`,
they lie on the perpendicular-bisector line `L` through `M`.  Their common
distance to `A` also gives `|B-M| = |D-M|`.  The line `L` is one-dimensional, so
the two points of `L` at this distance from `M` are `M+v` and `M-v`.  Since
`B != D`, they occupy the two different positions.  Therefore

```text
B + D = 2M = A + C.
```

This argument disposes of every apparent degeneracy:

- `A=C` and coincident center circles are excluded by distinctness.
- The common side length is nonzero because `A != B`.
- Disjoint circles are impossible because `B` is a common point.
- Tangency would give only one common point, contrary to `B != D`.
- Four distinct collinear points cannot satisfy the hypotheses; that would
  again collapse the two intersections.
- Concave, self-intersecting, or crossed display order causes no exception.
  The argument uses only distances and the two opposite-pair inequalities.

Thus the intended identity at audited lines 86--103 is valid, but its stated
circle-reflection justification must replace "perpendicular bisector of `AC`"
by "line `AC`" (or use the coordinate argument above).

A concurrent source file now exists at
`lean/Erdos9796Proof/P97/SevenPointThreeRhombus.lean`.  Its helper at lines
29--129 uses coordinate algebra, not the faulty reflection sentence, and has no
visible `sorry`, `admit`, or new `axiom`.  This audit did not run Lean or inspect
transitive axioms, and the file is not imported by another local Lean source,
so this is only a source-clean observation, not a kernel-checked status claim.
It also means the snapshot statement at audited line 17 ("not currently a
project-local Lean declaration") is no longer current in the shared worktree.

## 2. Cycle incidence and algebra

For

```text
E = {01,03,04,06,12,23,25,34,45,56},
```

all four sides of each reported cycle are present:

| cycle | sides in `E` | midpoint identity |
|---|---|---|
| `0-1-2-3-0` | `01,12,23,03` | `x0+x2=x1+x3` |
| `2-3-4-5-2` | `23,34,45,25` | `x2+x4=x3+x5` |
| `0-4-5-6-0` | `04,45,56,06` | `x0+x5=x4+x6` |

The substitutions at audited lines 121--133 are exact:

```text
x1 = x0+x2-x3,
x5 = x2+x4-x3,
x6 = x0+x5-x4 = x0+x2-x3 = x1.
```

The four-cycle helper needs only the opposite-pair inequalities
`x0!=x2`, `x1!=x3`, `x2!=x4`, `x3!=x5`, `x0!=x5`, and `x4!=x6`; seven-point
pairwise distinctness supplies them.  Finally `x1=x6` contradicts the same
pairwise-distinct hypothesis.  No unmentioned general-position assumption is
used.

The concurrent Lean source mirrors these steps at lines 132--169 and derives
the final contradiction at lines 173--199.  Again, that source was inspected
but not built or kernel-audited here.

## 3. Thirteen Phase-3 membership atoms

Under the audited label map

```text
(x0,x1,x2,x3,x4,x5,x6) = (P0,P2,P4,P7,P5,P6,P8),
```

the thirteen atoms at audited lines 160--165 give the following ten theorem
edges:

| theorem edge | assignment pair | positive row witness |
|---|---|---|
| `01` | `P0P2` | `s[0,2]` |
| `03` | `P0P7` | `s[0,7]` |
| `04` | `P0P5` | `s[0,5]` |
| `06` | `P0P8` | `s[0,8]` |
| `12` | `P2P4` | `s[4,2]` |
| `23` | `P4P7` | `s[4,7]` |
| `25` | `P4P6` | `s[4,6]` |
| `34` | `P7P5` | `s[7,5]` |
| `45` | `P5P6` | `s[6,5]` |
| `56` | `P6P8` | `s[6,8]` |

The three extra orientations are exactly the reciprocal bridges
`s[7,0]`, `s[7,4]`, and `s[6,4]`.  Using symmetry of Euclidean distance, they
give

```text
r0 = dist(P0,P7) = r7,
r4 = dist(P4,P7) = r7,
r4 = dist(P4,P6) = r6.
```

Hence `r0=r4=r6=r7`, so every edge in the table has one common length.  The
geometric theorem returns `P2=P8`.  The seven assignment labels
`0,2,4,7,5,6,8` are distinct elements of `Fin 10`, and injectivity of the
ambient point map contradicts that equality.

This derivation reads only positive `s[p,q]` atoms.  Under `exact=false`, an
unselected or off-support pair is not inferred to have a different length; no
such inference appears here.  Cap facts and cyclic order are mathematically
irrelevant.  The separate six-point rule-map audit says the seven cap facts are
expanded to exactly 24 compatible orders at
`scratch/p97-distinct-distance-lane/20260801-phase3-two-triple-row-six-point-rule-map.md:58-63`.
The three-rhombus proof covers all of them because it never examines order; the
number 24 is not a premise of the obstruction.

## 4. Literal-minimality audit

The argument at audited lines 190--216 is correct after its model is stated
precisely:

> A direct witness must orient every one of the ten fixed theorem edges as a
> positive membership in a row centered at one endpoint, and row-radius
> equality may be derived only from same-row equality, distance symmetry, and
> transitivity.  Each additional membership is counted as one literal.

In that model:

1. The used row centers form a vertex cover of `E`.
2. `alpha(E)=3`: `{1,3,5}` is independent; if an independent set contains `0`,
   its only other candidates are `2,5`, which are adjacent, while if it omits
   `0`, the disjoint edges `12,34,56` cap its size at three.  Hence
   `tau(E)=7-3=4`.
3. The ten theorem edges require at least ten directed atoms.
4. The radii of `k>=4` used rows must lie in one connected equality component,
   requiring at least `k-1>=3` links.  Two center rows can share an unordered
   distance atom only through their mutual center pair.  If it is already a
   theorem edge, its reverse orientation costs one extra atom; otherwise both
   orientations cost two.  Thus at least three additional atoms are necessary.
5. The displayed witness attains `10+3=13`, using reciprocal-tree links
   `0--3--2--5` in theorem labels.

Allowing unused external row centers does not beat this bound: connecting a
new center costs at least the two reciprocal memberships for its first link,
while the theorem-edge orientations still require a four-vertex cover.

What is **not** proved is thirteen-literal minimality among every possible
Phase-3 contradiction, every certificate schema, or every learned clause.  Nor
does the argument exclude a different geometric theorem with a smaller
antecedent.  Accordingly, audited line 52 is sound only with the narrow model
above, line 192 should say "this exact obstruction in the direct model," and
line 220 should not call it the cheapest certificate without that qualifier.

## 5. Pinned empirical evidence

### Cube-19 survivors

For

`scratch/p97-distinct-distance-lane/phase3_structural_cegar_projected_static_v2_cube19_20260729/survivors.jsonl`,
the following claims were independently reproduced by read-only scans:

- file size: 100 complete JSONL records;
- SHA-256:
  `705f52fdef626a997a9be507b05df4f271dcd031b201c1563e083d17c075fac0`;
- unique `metric_rows_sha256`:
  `851c782cb69ce8058138a40ab4145ac2a2df1236ea1fbad1c588f5d4793a3dec`;
- all thirteen fixed positive atoms occur in 100/100 records;
- represented metric rows have `exact=false`.

This verifies assignment coverage of that file.  It does not itself replay a
Lean theorem or certify an aggregate Phase-3 result.

### Learned-certificate pinned prefix

For the first 110,068,043 bytes / 24,666 complete records of

`scratch/p97-distinct-distance-lane/phase3_projected_static_v2_frontier_cube24_20260801_050632/learned-certificates.jsonl`,

the prefix SHA-256 reproduced as
`7f31d598bcf42083a99f0af20abb9b461c015e32acab8ff58984c139544c8ab9`.
The live file was larger than the prefix at audit time, so all figures below
are prefix figures, not terminal-live figures.

The independent scan reproduced:

| quantity | result |
|---|---:|
| complete records | 24,666 |
| records with semantic assignments | 24,194 |
| direct 13-atom hits | 5,824 / 24,194 = 24.072% |
| equality-closure hits | 20,406 / 24,194 = 84.343% |
| direct witness incomparable with stored clause | 5,822 |
| direct witness strictly stronger | 2 |
| stored clauses shorter / equal / longer than 13 | 2,344 / 543 / 2,937 |

The two strict improvements also reproduced at record indices 15,751
(`equality-perpendicular-bisector-convex`, 20 to 13) and 21,927
(`equality-three-triad-collision`, 24 to 13).

The closure-stage check reproduced 20,320 duplicate-center hits, 34/109
shared-pair hits, and 0/134 cap-order hits.  The closure scan formed the least
same-positive-row equality relation on the 45 unordered distances and then
searched for an injective copy of the fixed ten-edge graph.  It never treated a
false `s` value as a distance inequality.

A separate read-only authentication of those 24,666 records found zero broken
`previous_record_sha256` links and zero mismatches in record, clause, and
assignment hashes, using the canonical hash constructions in
`census/p97_search/phase3_structural_cegar.py`.  This audit did **not** rerun the
semantic replay of every nested historical geometric certificate.  The report's
reference at audited lines 414--416 to an "existing forward-six-point audit" is
under-specified; the inspected live-prefix audit at
`scratch/p97-distinct-distance-lane/phase3_frontier_cube24_live_motif_prep_20260801_0822.md:16-31`
pins the same prefix and trust boundary but does not by itself document a full
nested-certificate replay.

Therefore `EMPIRICALLY VERIFIED` is the correct label for the hashes and finite
assignment-level hit counts.  The report correctly refuses to reinterpret
84.343% as a measured clause-shortening rate and correctly leaves live-terminal
applicability heuristic/unmeasured.

## 6. Cited local theorem-bank artifacts

The following cited local artifacts were inspected:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and `.json`;
- `certificates/erdos97_legacy_general_n_mining.md` and `.json`;
- `certificates/erdos_general_theorem_p97_mining.md` and `.json`;
- `lean/Erdos9796Proof/P97/Census554/SevenEightPointFiveCircleCollisions.lean`;
- `lean/Erdos9796Proof/P97/Census554/SevenPointTwinFourCircleCollision.lean`;
- `lean/Erdos9796Proof/P97/Census554/SevenPointSixCircleCollision.lean`;
- `lean/Erdos9796Proof/P97/Census554/SevenPointOrbitCollision.lean`;
- `lean/Erdos9796Proof/P97/Census554/SevenPointCircleNetworkCollision.lean`;
- `lean/Erdos9796Proof/P97/Census554/ConvexRhombusCore.lean`.

The named nearby declarations have different equality networks or require
orientation hypotheses; none directly specializes to the fixed ten-edge
antecedent.  The registries describe syntactic/source inventories, not a proof
of semantic non-equivalence.  Thus "absent from the searched banks" was a
reasonable **EMPIRICALLY VERIFIED** snapshot claim, not a mathematical
completeness theorem.

The current indexed corpus also returns `SevenPointCircleNetworkCollision`,
which is another nearby but nonmatching network, and now returns the concurrent
`SevenPointThreeRhombus` source itself.  Consequently the four-item nearby-hit
list at audited lines 330--340 is not exhaustive in the present workspace, and
the project-local-absence statement is now stale.  This is repository drift
after the pre-round snapshot, not evidence against the mathematical theorem.

## Final classification

| claim | skeptic classification |
|---|---|
| equal-sided four-cycle identity | **PROVEN after a one-sentence repair**; prose proof as written has a wrong-axis gap |
| three-cycle incidence and `x1=x6` algebra | **PROVEN** |
| concrete thirteen-positive-membership implication | **PROVEN** from row equalities, symmetry, and injectivity |
| no reliance on `exact=false` nonmembership | **PROVEN by dependency audit** |
| thirteen-atom minimum | **PROVEN only in the explicitly delimited direct equality model** |
| cube-19 and pinned-prefix hashes/counts | **EMPIRICALLY VERIFIED** |
| current local Lean/kernel closure | **NOT ESTABLISHED by this audit**; source-clean unimported declaration now exists |
| aggregate Problem 97 / Phase-3 closure | **NOT ESTABLISHED** |
