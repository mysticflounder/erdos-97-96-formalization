# Phase-3 prefix global theorem search: the three-rhombus collision

Date: 2026-08-01
Scope: **pre-round only**
Status: one new project-local rule found; no live-round coverage claim

## Outcome

The strongest new constraint found in this search is an order-independent
seven-point unit-distance obstruction.  Its ten required equal-distance pairs
form the graph usually denoted `F(7,10,1)`.  In the Phase-3 row language it is
best viewed as a **three-rhombus chain**: three equal-sided four-cycles force
two labeled points to coincide.

The mathematical theorem and the concrete 13-membership Phase-3 antecedent
below are **PROVEN** by the elementary argument in this report.  The theorem is
now the project-local declaration
`Problem97.SevenPointThreeRhombus.false_of_ten_equal_edges`.  Lean LSP
elaboration and `lean_verify` succeeded with only `propext`,
`Classical.choice`, and `Quot.sound`; the aggregate import-bank Lake build is
reported separately from this pre-round search snapshot.

The rule is genuinely new to the searched project theorem banks, but not new
to the mathematical literature.  `F(7,10,1)` appears among the six minimal
forbidden unit-distance graphs on at most seven vertices in Figure 2 of
[Globus--Parshall, *Small unit-distance graphs in the plane*](https://arxiv.org/abs/1905.07829).
The proof below is self-contained and does not depend on that classification.

The immediate pre-round impact is substantial:

- the fixed 13-atom antecedent occurs in **100/100** authenticated projected-
  static-v2 cube-19 residuals;
- up to relabeling, it occurs directly in **5,824/24,194 = 24.072%** of the
  semantic assignments in the pinned learned-prefix audit;
- the stronger equality-closure formulation occurs in
  **20,406/24,194 = 84.343%** of those assignments; and
- only **2** of the 5,824 corresponding direct 13-literal clauses strictly
  subsume the already stored historical clause.  The other 5,822 comparisons
  are incomparable.  Applicability must not be reported as clause-antichain
  replacement.

The constraint uses only positive `s[p,q]` memberships.  It needs no negative
membership, blocker, cap fact, cyclic order, coordinate, angle, convexity, or
off-support inequality.  Consequently, whenever its row antecedent holds, it
covers every compatible cap annotation and all 24 cyclic orders without an
order enumeration.

## Epistemic status

| Claim | Status | Boundary |
|---|---|---|
| Seven-point three-rhombus theorem | **LEAN-VERIFIED** | Project-local source elaborates; `lean_verify` reports only standard axioms |
| Concrete 13-membership Phase-3 corollary | **PROVEN** | Derived only from positive row equalities and injectivity |
| Thirteen-literal direct antecedent is minimal in this row-equality model | **PROVEN** | Vertex-cover and radius-connection argument below |
| Exact theorem is absent from searched project banks | **EMPIRICALLY VERIFIED** | Indexed-Lean, registry, and source searches; no build |
| 100/100 cube-19 and frozen-prefix counts | **EMPIRICALLY VERIFIED** | Read-only hash-pinned finite scans; no committed replay artifact |
| The live terminal antichain will have comparable hit rates | **HEURISTIC** | Must be rescanned after the live round finishes |
| Problem 97 or Phase 3 is closed | **NOT ESTABLISHED** | No aggregate certificate or kernel gate was produced |

## 1. Exact finite theorem

For points `x₀,...,x₆` in `R²`, put

```text
E₇,₁₀ = {
  01, 03, 04, 06,
  12, 23, 25,
  34, 45, 56
}.
```

Here `ij` abbreviates the unordered pair `{i,j}`.

### Theorem (three-rhombus collision)

Let `x₀,...,x₆ : R²` be pairwise distinct.  There is no real number `r` such
that

```text
dist(xᵢ,xⱼ) = r    for every ij in E₇,₁₀.
```

Equivalently, if all ten displayed distances are equal, then `x₁ = x₆`.
The latter conclusion contradicts pairwise distinctness.

### Proof

First use the following four-cycle fact.  If `A,B,C,D` are four distinct
points in the Euclidean plane and

```text
dist(A,B) = dist(B,C) = dist(C,D) = dist(D,A),
```

then

```text
A + C = B + D.                                      (1)
```

Indeed, `B` and `D` are distinct common points of the two equal-radius circles
centered at `A` and `C`.  The centers are distinct.  Both intersections lie
on the perpendicular bisector of `AC`, and reflection across the **line
`AC`** exchanges the two intersections.  Their midpoint is therefore the
intersection of `AC` with its perpendicular bisector, namely `(A+C)/2`, which
gives (1).

Apply (1) to the three four-cycles

```text
x₀ - x₁ - x₂ - x₃ - x₀,
x₂ - x₃ - x₄ - x₅ - x₂,
x₀ - x₄ - x₅ - x₆ - x₀.
```

Every edge of these cycles belongs to `E₇,₁₀`, so the hypotheses give

```text
x₀ + x₂ = x₁ + x₃,                                  (2)
x₂ + x₄ = x₃ + x₅,                                  (3)
x₀ + x₅ = x₄ + x₆.                                  (4)
```

Equation (2) yields

```text
x₁ = x₀ + x₂ - x₃.                                  (5)
```

Equation (3) gives `x₅ = x₂ + x₄ - x₃`.  Substituting this into (4) gives

```text
x₆ = x₀ + x₅ - x₄
   = x₀ + x₂ - x₃
   = x₁,
```

where the last equality is (5).  This contradicts the assumed distinctness of
`x₁` and `x₆`.  Therefore the ten equal-distance pairs cannot occur among
seven pairwise distinct planar points.  QED.

### Scope of the proof

The proof allows nonedges to have the same distance as the ten listed edges.
It is therefore a non-faithful unit-distance obstruction, exactly matching the
Phase-3 `exact=false` metric-row semantics.  It does not use convex position or
cyclic order.

## 2. A concrete 13-membership Phase-3 antecedent

For a metric row centered at `p`, write `s[p,q]` for positive membership of
`q` in its four-point support.  The Euclidean consumer interprets all positive
memberships in one row as distances equal to that row's selected radius.

Use the theorem-label-to-assignment-label map

```text
(x₀,x₁,x₂,x₃,x₄,x₅,x₆) = (P₀,P₂,P₄,P₇,P₅,P₆,P₈).
```

The following thirteen positive atoms suffice:

```text
row 0: s[0,2]  s[0,5]  s[0,7]  s[0,8]
row 4: s[4,2]  s[4,6]  s[4,7]
row 6: s[6,4]  s[6,5]  s[6,8]
row 7: s[7,0]  s[7,4]  s[7,5]
```

The reciprocal pairs `0<->7`, `4<->7`, and `4<->6` identify the four row
radii:

```text
r₀ = dist(P₀,P₇) = r₇,
r₄ = dist(P₄,P₇) = r₇,
r₄ = dist(P₄,P₆) = r₆.
```

Thus `r₀=r₄=r₆=r₇`.  The ten theorem edges become

```text
P₀P₂, P₀P₇, P₀P₅, P₀P₈,
P₂P₄, P₄P₇, P₄P₆,
P₇P₅, P₅P₆, P₆P₈,
```

and each has that common length.  The theorem forces `P₂=P₈`, contradicting
the injectivity of the ambient P97 point configuration.

The corresponding learned clause is exactly the disjunction of the thirteen
negated atoms above.  It is cap-free and order-free.

### Literal minimality for a direct witness

The 13-atom count is minimal for deriving this exact `F(7,10,1)` obstruction
in the direct positive-row model where every theorem edge is oriented from
one endpoint and row-radius connections use only same-row equality, distance
symmetry, and transitivity.  It is not a lower bound for arbitrary geometric
certificates or learned clauses.

1. Every one of the ten required undirected distance pairs must be selected by
   a row centered at one of its endpoints.  The selected source centers
   therefore form a vertex cover of `E₇,₁₀`.
2. The maximum independent-set size of `E₇,₁₀` is three.  Indeed, an
   independent set containing vertex `0` can use at most one of the remaining
   candidates `2,5`, since `25` is an edge.  If it omits `0`, the three
   disjoint edges `12`, `34`, and `56` limit it to one endpoint from each.
   The set `{1,3,5}` attains size three.  Thus the minimum vertex-cover size is
   `7-3=4`; one minimum connected cover is `{0,2,3,5}` in the theorem labels.
3. The ten required pairs consume at least ten directed membership atoms, one
   per edge.
4. If `k` source centers are used, then `k >= 4` by the vertex-cover bound and
   their row radii require at least `k-1 >= 3` equality links.  Two rows can
   share a distance atom only on their mutual center pair.  If that pair is a
   required theorem edge, the link needs the reverse membership in addition
   to its already-counted direction; if it is not, the link costs both
   directions.  Either way, each link costs at least one further atom, hence
   at least three in total.

Hence every direct positive-row antecedent has at least `10+3=13` atoms.  The
displayed antecedent attains the bound using the reciprocal tree
`0--3--2--5` in theorem labels.

## 3. Stronger equality-closure formulation

The fixed 13-atom shape is a cheapest direct certificate for this exact
obstruction in the model just delimited.  A stronger form expressible from the
current data uses the equality closure already natural to the structural
miner.

Let `D` be the 45 unordered distance atoms `{p,q}` with `0 <= p < q < 10`.
Given the ten positive rows, define `~` to be the least equivalence relation on
`D` generated by

```text
{p,q} ~ {p,r}    whenever s[p,q] and s[p,r] are both true.
```

### Closure rule

If there is an injection

```text
phi : {0,...,6} -> {0,...,9}
```

such that the ten distance atoms

```text
{phi(i),phi(j)}    for ij in E₇,₁₀
```

all lie in one `~`-class, then the assignment has no injective Euclidean P97
realization.

This is a finite antecedent.  Each generator step of `~` is justified by two
positive memberships in one row.  Transitivity converts a certificate path
into equality of the endpoint distances.  The ten paths therefore instantiate
the theorem from Section 1.

No new semantic input is required.  The minimum sound enrichment is a new
certificate/replay stage and a Lean consumer, not new SAT variables, cap data,
negative membership, or coordinates.

## 4. Replayable certificate design

A direct certificate can remain small and rigid:

```text
schema = p97-phase3-three-rhombus-collision-v1
pattern_labels = [x0,x1,x2,x3,x4,x5,x6]
pattern_edges = the fixed ten-edge E7,10 list
source_memberships = the canonical 13 directed pairs derived from the labels
radius_bridges = the three reciprocal center pairs
collision = [x1,x6]
literal_count = 13
theorem = the exact local Lean declaration
payload_sha256 = ...
```

Strict replay should:

1. reject missing or extra fields;
2. verify that the seven labels are distinct and in `Fin 10`;
3. regenerate, rather than trust, the ten pattern edges, thirteen membership
   atoms, three radius bridges, and collision labels;
4. check every membership against the semantic assignment;
5. reconstruct the four row-radius equalities and all ten common-length
   conclusions;
6. regenerate the sorted thirteen-negative-literal clause using the canonical
   `s[p,q]` SAT-variable map; and
7. recompute every payload and clause hash.

For the general closure rule, replace the fixed source-membership field by ten
checked closure paths to a canonical root distance atom.  A path step should be

```text
(center=p, first=q, second=r)
```

and replay must check both `s[p,q]` and `s[p,r]`.  The learned clause is the
negation of the deduplicated union of memberships actually used by the paths.
For deterministic minimization, enumerate membership subsets by cardinality
and then lexicographic order, reconstruct `~`, and accept the first subset
containing a certified `E₇,₁₀` embedding.  Stored paths or a stored embedding
must never substitute for recomputation.

The global soundness adapter needs exactly these ambient assumptions:

- `P : Fin 10 -> R²` is injective;
- every positive row membership gives equality to the row radius; and
- Euclidean distance is symmetric.

It does not need cap annotations or a CCW predicate.  Within the SAT layer the
clause is conditional on this P97 Euclidean consumer; it is not a standalone
propositional contradiction in arbitrary Boolean assignments.

## 5. Existing-bank audit

The required searches were performed before recommending a new theorem.

### Project registries and indexed Lean

No exact entry was found for `F(7,10,1)`, a three-rhombus chain, or a
four-cycle-chain endpoint collision in:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- the sibling `p97-rvol` registry and exhaustive JSON inventory;
- the legacy `erdos/97` registry and inventory;
- the older `erdos-general-theorem/97` registry and inventory; or
- the merged indexed Lean corpora.

An independent read-only antecedent-graph scan of the three named JSON
registries also found no pure-metric declaration with 7--10 distinct-distance
edges whose antecedent embeds in `E₇,₁₀`.

The one permitted agentic indexed-Lean search returned nearby seven-point
collision consumers, not this antecedent:

- `seven_point_five_circle_collision` in
  `lean/Erdos9796Proof/P97/Census554/SevenEightPointFiveCircleCollisions.lean`;
- `seven_point_twin_four_circle_collision` in
  `lean/Erdos9796Proof/P97/Census554/SevenPointTwinFourCircleCollision.lean`;
- `seven_point_six_circle_collision` in
  `lean/Erdos9796Proof/P97/Census554/SevenPointSixCircleCollision.lean`; and
- `seven_point_orbit_collision` in
  `lean/Erdos9796Proof/P97/Census554/SevenPointOrbitCollision.lean`.

Those declarations require different, larger circle-equality networks.  Their
hypotheses are not the ten common-length edges of `E₇,₁₀`, and none supplies
the three-rhombus statement by direct specialization.

`ConvexRhombusCore.metric_orientation_incompatibility` is also nearby in
`lean/Erdos9796Proof/P97/Census554/ConvexRhombusCore.lean`.  It uses one
equal-sided quadrilateral, two equilateral apices, and six positive
orientations.  It is neither order-free nor the present three-rhombus
collision.  Its useful rhombus-coordinate helper is private.

The completed-round theorem-bank audit had already classified every detector
used in that round and found no missing local theorem.  The present candidate
was not one of those detector shapes.  It is a fresh pre-round theorem search,
not a relabeling of the already banked forward six-point rule or shared-pair
cyclic-separation rule.

### Literature check

Globus--Parshall define a unit-distance embedding as an injection for which
every graph edge has unit length while nonedges may also have unit length.
That is the relevant `exact=false` notion.  Their Figure 2 labels the present
ten-edge graph `F(7,10,1)`.  This gives independent nomenclature and prior
mathematical provenance.  The local proof and certificate should use the
explicit edge list, not depend on a graph-name lookup or an external
classification computation.

### Novelty verdict

The rule is **new to this project's active theorem/certificate banks** and
**known in external unit-distance graph theory**.  Project novelty is based on
source/index searches and is therefore **EMPIRICALLY VERIFIED**, not a theorem
that no hidden or future declaration can exist.

## 6. Measured pre-round applicability

All measurements below are read-only finite scans.  They are evidence about
pinned historical artifacts, not the terminal state of the live round.

### Projected-static-v2 cube-19 residual

Input:

```text
scratch/p97-distinct-distance-lane/
  phase3_structural_cegar_projected_static_v2_cube19_20260729/
  survivors.jsonl
```

The file SHA-256 is
`705f52fdef626a997a9be507b05df4f271dcd031b201c1563e083d17c075fac0`.
It contains 100 records.  Every record has the same metric-row SHA-256
`851c782cb69ce8058138a40ab4145ac2a2df1236ea1fbad1c588f5d4793a3dec`.

The concrete thirteen atoms in Section 2 occur in **100/100** records.  Thus
one fixed 13-literal clause rejects the entire authenticated cube-19 residual,
independently of each record's seven cap facts and all 24 compatible orders.
This is assignment coverage for that bank, not a kernel-checked aggregate
Phase-3 closure theorem.

### Pinned learned-prefix audit

Input:

```text
scratch/p97-distinct-distance-lane/
  phase3_projected_static_v2_frontier_cube24_20260801_050632/
  learned-certificates.jsonl
```

The scan used exactly the first `110,068,043` bytes / 24,666 complete records,
with SHA-256
`7f31d598bcf42083a99f0af20abb9b461c015e32acab8ff58984c139544c8ab9`.
This is the same prefix whose record chain, nested hashes, assignments, and
semantic cap facts were authenticated by the existing forward-six-point
audit.  Of the 24,666 records, 24,194 carry semantic assignments.

Two detectors were applied:

| Detector | Hit semantic assignments | Rate |
|---|---:|---:|
| Direct 13-atom pattern, all injective relabelings | 5,824 / 24,194 | 24.072% |
| Any `E₇,₁₀` embedding in one positive-row equality class | 20,406 / 24,194 | 84.343% |

The closure detector built the 45 unordered distance atoms, unioned the four
selected atoms in each row, and searched each resulting component for the
fixed ten-edge graph by injective subgraph matching.  Hit-component sizes
ranged from 13 to 31 distance atoms.  No negative `s` value was read as a
metric inequality.

The closure rate is dominated by historical `equality-duplicate-center`
records: 20,320 of the 20,406 closure hits have that stage.  It also hits
34/109 historical shared-pair records and 0/134 cap-order five-point records.
It should therefore be interpreted as a cheap alternative cut on equality-
rich assignments, not as evidence that it improves the cap-order family.

### Historical clause comparison

For each of the 5,824 direct hits, every direct witness gives a 13-negative-
literal clause.  Choosing over all witnesses produced:

| Relation to stored clause | Records |
|---|---:|
| New clause strictly subsumes stored clause | 2 |
| Equal | 0 |
| Stored clause strictly subsumes new clause | 0 |
| Incomparable | 5,822 |

The two strict improvements are:

| Record index | Existing stage | Old length | New length | Saving |
|---:|---|---:|---:|---:|
| 15,751 | `equality-perpendicular-bisector-convex` | 20 | 13 | 7 |
| 21,927 | `equality-three-triad-collision` | 24 | 13 | 11 |

Among all direct hits, 2,937 stored clauses are longer than 13, 543 have
length 13, and 2,344 are shorter.  A shorter literal count does not imply
subsumption; the 5,822 incomparable cases must remain classified as
incomparable unless a global antichain rebuild proves otherwise.

No minimized closure certificates were generated in this search, so the
84.343% closure-hit rate is **not** a measured clause-shortening rate.

### Expected live-round applicability

The only exact forward statement is conditional: any future semantic
assignment whose positive-row equality closure contains an `E₇,₁₀` embedding
is rejected, regardless of its cap facts or order.  The historical 84.343%
rate makes equality-rich residuals the most plausible beneficiaries, while
the observed 0/134 cap-order five-point hits give no support for expecting
coverage of that family.  The live terminal antichain is unmeasured; its hit,
subsumption, and incomparability counts require a fresh authenticated scan
after the round ends.

## 7. First missing bridge

There is no missing mathematical bridge in the seven-point theorem.  The first
missing production bridge is:

```text
positive Phase-3 row memberships
  -> replayed common-distance E7,10 certificate
  -> local Lean three-rhombus collision theorem
  -> exact learned-clause regeneration
  -> current terminal-antichain rescan.
```

In concrete deliverables this means:

1. a public pure-metric Lean theorem returning `x₁=x₆` from the ten distance
   equalities and the needed distinctness hypotheses;
2. a `Fin 10` row adapter for the canonical 13-membership witness;
3. a strict Python certificate builder/replayer with tamper tests;
4. source import into the Phase-3 metric certificate bank;
5. a focused Lean build and transitive axiom audit; and
6. a fresh scan of the terminal active antichain after the live round ends.

The existing data model is sufficient.  Adding cap facts, order roles,
coordinates, negative membership, or a faithful-unit-distance assumption would
weaken portability without contributing to this proof.

## 8. Ranked next actions

> **Status update 2026-08-03.** Item 1 is half-done. The formalization landed
> as `lean/Erdos9796Proof/P97/Phase3ThreeRhombusRowAdapter.lean` and
> `lean/Erdos9796Proof/P97/Phase3MetricCertificateBank.lean` (both 2026-08-02),
> but the *integration* half has not: the bank imports the adapter and nothing
> imports the bank, so the pair is an orphan island unreachable from the
> `Problem97.erdos97_rhs` spine. The "source-clean unimported declaration"
> classification in `docs/p97-three-rhombus-collision-skeptic-audit-2026-08-01.md`
> therefore still stands. Items 2–5 are untouched.

1. **Formalize and integrate the direct 13-atom rule.**  It is literal-minimal,
   has a two-line vector conclusion after the four-cycle lemma, and rejects the
   fixed 100-survivor projected-static-v2 residual with one clause.
2. **Add strict direct-certificate replay and tests.**  Include rejected label,
   membership, bridge, collision, clause, and rehashed-tampering cases.  Run no
   migration until replay regenerates the exact 13 literals.
3. **Generalize to the equality-closure detector.**  Reuse checked closure-path
   machinery and add exact membership-union minimization.  Its 84.343%
   historical hit rate warrants this only after the direct path is trusted.
4. **Rebuild clause impact on the terminal active antichain.**  Report hits,
   strict subsumptions, incomparable clauses, and source fan-in separately.
5. **Repeat the global theorem search after the live round terminates.**  The
   present search is expressly pre-round; new residual graph classes may expose
   a different minimal forbidden subgraph or make this rule irrelevant.

## 9. Verification and trust boundary

Performed in this search:

- exact source and theorem-bank reads;
- one agentic merged-Lean search followed by source inspection of its hits;
- read-only SHA-256 checks and finite JSON/pattern scans;
- direct clause-set comparisons; and
- primary-literature lookup for nomenclature and scope.

Not performed:

- Lean or Lake invocation;
- proof-blueprint, kernel, or transitive-axiom gate;
- SAT/SMT/CAD/first-order solver run;
- CEGAR worker, generator, or live-round mutation;
- production source or certificate mutation; or
- terminal active-antichain scan.

The only repository mutation from this task is this report.  The theorem is
mathematically closed in prose; the production and kernel trust boundaries
remain open until the listed bridge is implemented and verified.
