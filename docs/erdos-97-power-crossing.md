# Circle-power crossing and exact planarity controls for P97

## Preamble

**Theorem — PROVEN (pen-and-paper).** Let four distinct planar centers a,b,c,d
have properly crossing segments ab and cd. Let C_a,C_b,C_c,C_d be circles at
those centers. Suppose x₀,x₁ are distinct points of C_a∩C_b and y₀,y₁ are
distinct points of C_c∩C_d. Among these shared witnesses there are at least two
distinct points such that an x-point lies strictly inside the disk of c or d,
or a y-point lies strictly inside the disk of a or b. The two witness pairs may
share a point. Section 3 proves this statement without a global four-equidistant
or deletion assumption.

This is a supporting mathematical note. The [atomic prose proof](erdos-97-descent-prose-proof-atomic.md)
remains the authoritative project-status document. The theorem and the conditional
exposed-graph result are hand proofs, independently audited. Neither is a Lean
closure of the card ≥ 13 branch.

This revision repairs the [2026-09-05 audit](skeptic-planarity-audit-and-power-crossing-2026-09-05.md)
of an external note with SHA-256
`c3c237f648abc6eb1f0f6726f732c7ec03e4234e6ae8d5229cc41402a7ce11a2`.
The unavailable original sixteen-point witness is replaced by the independently
constructed, fully specified rational control in §2. The original unprovided support coordinates and
reported verifier output are not relied on here.

The graphs below have different meanings. Circle-point incidence uses separate
row and carrier-point vertices; abstract planarity is the relevant property.
A double-overlap center graph draws a straight edge between centers whose
circles share two carrier points; the prescribed drawing can cross even when
the abstract graph is planar. Neither negative control is a full P97
counterexample: the regular polygon uses two-point fibers, and the rational
control gives four-point fibers at only four of its sixteen centers.

## 1. Incidence counts and the regular-polygon control

Under the global four-equidistant hypothesis, choose four witnesses at each of the n carrier centers. The bipartite incidence graph has 2n vertices and exactly 4n edges. If it were planar, the simple bipartite planar bound would give

    4n ≤ 2(2n) − 4 = 4n − 4,

which is impossible. Thus this is a correct *consumer*, but producing planarity would do essentially all the missing geometric work. Planarizing crossings does not repair the argument: it introduces new vertices and changes the count.

There is a branch-specific weakening worth keeping: include BOTH physical four-point rows at O, and one selected four-point row at every other carrier center. Now there are n+1 row nodes, n point nodes, and 4n+4 edges. A simple bipartite graph on a torus has at most twice as many edges as vertices, whereas here

    4n+4 > 2(2n+1) = 4n+2.

Thus an orientable genus-at-most-one embedding would already contradict this two-radius branch. More generally, the bound E≤2V−4+4g forces genus g≥2 for this graph. This is only a weaker topological *target*, not an established embedding. The four-point and full-source assumptions must be essential, as the next section shows.

For the local packet with four row nodes and all n carrier-point nodes, the count is only 16 edges against a planar bound 2n+4. At n≥13 this has substantial slack. A planar subgraph on those local data does not by itself close the source.

### A regular 11-gon gives abstract nonplanarity

Let ζ=exp(2πi/11), and take the eleven physical carrier points p_j=ζ^j. They are strictly convex. Set

    U={0,1,2},   V={3,6,9}.

For each u in U and v in V choose the row centered at

    c(u,v)=6(u+v) mod 11.

Since 2·6=1 mod 11, we have 2c=u+v mod 11. Reflection in the radial line through p_c exchanges p_u and p_v, so the row circle has both points at the same positive distance from p_c.

The center-index table is

| u / v | 3 | 6 | 9 |
|---|---:|---:|---:|
| 0 | 7 | 3 | 10 |
| 1 | 2 | 9 | 5 |
| 2 | 8 | 4 | 0 |

These nine indices are distinct, and none equals an endpoint of its own pair. Each chosen row is a FULL TWO-POINT fiber: for a fixed center index c, a positive chord distance on the regular 11-gon determines exactly the two indices c±k.

In the bipartite incidence graph, the row for (u,v) is a distinct degree-two node connected to the point copies p_u,p_v. Suppressing those nine row nodes produces K_{3,3} on U,V. The nine row nodes subdivide the nine edges, so the incidence graph contains the one-subdivision of K_{3,3}, with 15 vertices and 18 edges. It is abstractly nonplanar.

The fact that some physical row centers also occur among U or V causes no identification: row nodes and point nodes are separate bipartite copies. One may select arbitrary positive-radius rows at the two unused physical centers; the nonplanar subgraph persists.

The regular-11 mode of [`verify_p97_power_crossing.py`](../scripts/verify_p97_power_crossing.py) checks the full fibers in the exact cyclotomic representation

    |ζ^a−ζ^b|² = 2−ζ^(a−b)−ζ^(b−a)

modulo 1+ζ+...+ζ^10, and verifies the explicit subdivision. No numerical trigonometry or planarity package is needed. The standard regular-polygon construction supplies the strict convexity.

**Exact scope:** This refutes planarity based only on convex position, carrier centers, and one positive-radius circle per center. It does not refute a theorem that uses four-point completion or the stronger live deletion hypotheses.

### The obstruction is not confined to genus zero

For any k≥2, let N=k²+k+1 (an odd integer), and take a regular N-gon. Set

    U={0,...,k−1},   V={k,2k,...,k²}.

The k² sums u+v are distinct integers between k and k²+k−1. Because 2 is invertible modulo N, their midpoint indices c=(u+v)/2 mod N are distinct. None is an endpoint of its own pair. The same equal-chord argument yields a full two-point fiber {p_u,p_v} at each chosen carrier center.

The incidence graph contains the one-subdivision of K_{k,k}. Applying the bipartite orientable-surface bound to K_{k,k} gives

    genus ≥ ceil((k−2)²/4).

Consequently, convex position and one circle per center do not even impose a uniform genus bound on these two-point-row incidence graphs. This does not extend the negative control to four-point-row completions.

## 2. A replayable rational four-row crossing control

**EMPIRICALLY VERIFIED — one complete rational 16-point configuration.**
The [certificate](../certificates/p97_power_crossing_control.json) contains all
coordinates as rational strings, the cyclic order, squared radii, four supports,
and crossing edges. The [exact verifier](../scripts/verify_p97_power_crossing.py)
checks the data with rational arithmetic.

The centers retain the four coordinates printed in the external note:

    c0=(74/75,13/80),       c1=(−51/53,−25/92),
    c2=(−14/15,−33/92),    c3=(74/87,−51/97).

The replacement's full supports are

    K0={4,5,8,9},       K1={6,7,10,11},
    K2={4,5,12,13},     K3={6,7,14,15}.

Its counterclockwise order is

    [1,2,8,14,15,4,9,10,7,11,3,0,6,12,13,5].

All 560 ordered triple determinants are positive, with minimum

    252466171965800614447677 / 83777235005198385585082512416.

Each listed center has exactly one positive-distance fiber of size at least
four, and that fiber is its displayed four-element support. Each other carrier
center has no such fiber. Deleting any member of a displayed support therefore
destroys K4 at that center. This is a local deletion statement; the other twelve
centers prevent it from being a global K4 counterexample.

The segments c0c2 and c1c3 properly cross, with K0∩K2={4,5} and
K1∩K3={6,7}. Their two-edge abstract graph is planar. The example establishes
that its prescribed straight center drawing need not be noncrossing, even with
these full, unique four-point fibers.

### Exact construction

Write J(x,y)=(−y,x), v=c2−c0, and w=c3−c1. Set

    p4=c0+(7/15)v+(17/25)Jv,    p5=c0+(7/15)v−(17/25)Jv,
    p6=c1+(9/10)w+(1/2)Jw,     p7=c1+(9/10)w−(1/2)Jw.

For a rational parameter t, let

    R_t u = ((1−t²)/(1+t²))u + (2t/(1+t²))Ju.

Its two coefficients have squared sum one, so it preserves squared length.
Each remaining point is c_i+R_t(p_j−c_i), using j=4 at centers 0 and 2,
and j=6 at centers 1 and 3. The certificate records these parameters:

| Point | Center | t |
|---|---:|---:|
| 8 | 0 | −3131/10000 |
| 9 | 0 | 3/5000 |
| 10 | 1 | −1399/2500 |
| 11 | 1 | −1093/2000 |
| 12 | 2 | 7577/10000 |
| 13 | 2 | 509/400 |
| 14 | 3 | 3431/1250 |
| 15 | 3 | 13859/5000 |

A numerical search selected candidates; the stored coordinates are reconstructed
from these rational formulas and accepted only after exact checks. The search's
floating-point output has no verification role.

## 3. Crossing forces strict disk containment — PROVEN (pen-and-paper)

Let a,b,c,d be four distinct centers such that segments ab and cd properly cross: their supporting lines are distinct and meet in the interior of each segment. Let C_a,C_b,C_c,C_d be their circles, with squared radii w_a,w_b,w_c,w_d. Suppose

    x0,x1 ∈ C_a∩C_b,  x0≠x1,
    y0,y1 ∈ C_c∩C_d,  y0≠y1.

The two pairs may initially share a point. Define

    π_i(z)=|z−i|²−w_i,
    h_i=|i|²−w_i.

Negative power means strictly inside the corresponding disk; zero means on the circle; positive means outside the closed disk.

### Theorem: at least two distinct shared witnesses are inside cross-pair disks

Among {x0,x1,y0,y1}, there are at least two DISTINCT points with the following property: an x-point is inside the disk of c or d, or a y-point is inside the disk of a or b.

No global four-equidistant or deletion assumption is needed for this theorem.

### Proof

Proper crossing supplies 0<t,s<1 such that

    (1−t)a+tb=(1−s)c+sd.

Set

    Δ=(1−t)h_a+t h_b−(1−s)h_c−s h_d.

Expanding squared distances gives, for every z,

    (1−t)π_a(z)+tπ_b(z)−(1−s)π_c(z)−sπ_d(z)=Δ.       (1)

The |z|² coefficient cancels because the weights on both sides sum to one; the linear coefficient cancels by the crossing-point equality.

Identity (1) uses only this affine balance and the definitions of the powers.
It does not require shared circle points. The two-point membership hypotheses
enter the sign deductions below; §4 can also apply the identity at a single
strict two-site minimum.

At either x-point, (1) becomes

    Δ=−(1−s)π_c(x)−sπ_d(x).                          (2)

At either y-point it becomes

    Δ=(1−t)π_a(y)+tπ_b(y).                           (3)

If Δ>0, (2) forces BOTH distinct x-points inside at least one of the other two disks. If Δ<0, (3) forces BOTH distinct y-points inside at least one of the first two disks.

It remains to treat Δ=0. If an x-point is not on both C_c,C_d, equation (2) says its two cross powers have opposite strict signs. Hence it is inside one of those disks. If neither x-point lies on both other circles, the two x-points suffice.

Otherwise one x-point lies on all four circles. There cannot be two such points: their common perpendicular bisector would contain a,b,c,d, contrary to proper crossing. Thus the other x-point has a negative cross power. At least one y-point is not on all four circles, and equation (3) gives a negative cross power at that point as well. This y-point cannot equal the chosen x-point: any point belonging to both shared pairs is on all four circles. We therefore again obtain two distinct points. QED.

### A division-free certificate

One can avoid normalized t,s. Take positive α,β,γ,δ with

    α+β=γ+δ,
    αa+βb=γc+δd.

Then the same identity holds with these coefficients. For a counterclockwise center order a,c,b,d, positive weights can be chosen as oriented triangle areas:

    α=orient(c,b,d),   β=orient(a,c,d),
    γ=orient(a,b,d),   δ=orient(a,c,b).

Here orient(u,v,w)=det(v−u,w−u), with counterclockwise triples positive. The balances are polynomial identities. This is suitable for ring normalization followed by positivity arguments, without invoking a large graph-topology library.

### Check against the exact crossing control

Its signs at the four shared points are

| point | π0 | π1 | π2 | π3 |
|---|---|---|---|---|
| 4 | 0 | − | 0 | + |
| 5 | 0 | − | 0 | + |
| 6 | − | 0 | + | 0 |
| 7 | − | 0 | + | 0 |

Its exact Δ is positive. In particular, both witnesses for edge c0c2 are strictly inside the disk centered at c1, as the theorem predicts. These containments are geometrically feasible, so the theorem must NOT be turned into an unconditional crossing prohibition.

## 4. The exposed graph — PROVEN (pen-and-paper)

Fix a finite family of m circles with distinct, convex-independent carrier centers: every center is a vertex of their convex hull. Call a center pair exposed when either:

- it has a common point at which every OTHER circle has strictly positive power; or
- it has two distinct common carrier points at which every OTHER circle has nonnegative power.

Then the straight-line graph of exposed center pairs is noncrossing and hence outerplanar.

For the first criterion, at the common point the two selected power functions tie strictly below all the others. Continuity gives a nontrivial interval of their radical axis on which they remain the two minima.

For the second criterion, take the midpoint z of the two shared points. The common chord lies on the radical axis, so π_a(z)=π_b(z)<0. Every difference π_k−π_a is affine, nonnegative at both endpoints, and therefore nonnegative at z. It is in fact positive: if both endpoint differences were zero, the third circle and the selected pair would share two points, putting their three distinct centers on one perpendicular bisector, which convex independence forbids. Thus z again gives a strict two-way minimum. Note that the individual powers at z are negative, not zero; it is their differences that are affine.

Either criterion supplies a genuine edge of the minimum-power diagram dual. Its noncrossing property also follows directly from (1): strict exposure of ab makes Δ negative at its witness, while strict exposure of cd makes Δ positive at its witness. Both cannot hold when their center segments cross.

The graph can therefore be extended to an outerplanar graph on the same convex centers and has at most 2m−3 edges for m≥2. This edge bound concerns only the exposed subgraph, not the entire overlap graph.

**Degeneracy warning:** A single common point with merely nonnegative other powers is not enough. Several sites may tie at one power-diagram vertex. Inserting every pair of tied centers as a straight edge can introduce crossing diagonals. The strict witness or the two-point argument above is what resolves this issue.

## 5. The two concentric physical radii require separate diagrams

The live branch contains two circles at the SAME physical center O with squared radii r²<s². For every z,

    π_r(z)−π_s(z)=s²−r²>0.

The smaller-radius site has no minimum-power cell when the larger-radius site is included. Counting both as separate visible vertices in one power diagram would be incorrect.

A safe approach uses a separate diagram for each physical row, with the same actual other centers and canonical rows retained. An application must prove how conclusions from those two diagrams combine; two separate outerplanar graphs do not automatically give one outerplanar graph.

Also, even for a full critical fiber, omission means only π≠0, not π>0. For a merely selected four-subset it may not even imply π≠0. The new positivity hypotheses cannot be read from old nonmembership flags.

## 6. Application contract at the live source

**Source audit, 2026-09-05.** The [active D-R closure plan](plans/2026-09-01-dr-two-radius-branch-closure.md),
Phase 4, covers `false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`.
It requires new metric/order information after the existing structural bank
admits card-13 survivors. This note supplies an audited mathematical constraint
and a negative control; it does not supply a source adapter or a terminal proof.

The [outcome dispatcher](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenOutcomeDispatcher.lean)
retains four cases: `rowOverlap`, `uncovered`, `exactThirteenTight`, and
`adjacentGrid`. The overlap constructor guarantees at least one common point
in some pair of rows. The [three-center packet](../lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenTerminalSplitV2.lean)
retains actual blocker rows, source provenance, and intersection upper bounds
of two. Those upper bounds do not produce two common points. The grid constructor
carries its grid rather than this packet. No power-sign or exposure hypothesis
is a field of these outcomes.

For a proposed application of §3, retain the following data explicitly:

1. Four distinct actual carrier centers, with their actual selected rows and radii.
2. A proper crossing of the selected center segments, witnessed by cyclic order or exact oriented areas.
3. Two distinct shared support points for each crossing pair, with their actual circle memberships.
4. A separately proved consequence of the live source that contradicts the forced strict containments.

The theorem supplies the containment conclusion after items 1–3. It does not
produce those antecedents or item 4. At a single retained common point the
possible signs must be distinguished: strict exposure, an additional circle
incidence, or strict containment. A full-fiber nonmembership flag supplies
nonzero power and leaves both strict signs possible. Counting an inside point
once for every crossing that uses it requires a separate multiplicity bound.

### Concrete existing consumers and their missing inputs

The bounded reuse search and source inspection found the following candidates.
These are existing source declarations, not new kernel-verification claims:

| Consumer | Required input not supplied by the crossing theorem |
|---|---|
| `false_of_three_selected_rows_in_six_ccw_order_cycle_adjacent_adjacent_cyclicShift` in [KalmansonThreeRowCycleSchemas.lean](../lean/Erdos9796Proof/P97/ATail/KalmansonThreeRowCycleSchemas.lean) | A bijective counterclockwise boundary enumeration, a cyclic cut, indices a<b<c<d<e<f, and selected rows at a,d,e with b,c in the a-row, c,f in the d-row, and b,f in the e-row. Negative powers do not give these six memberships. |
| `false_of_powerMatrix_unique_possible_matching` in [CirclePowerMatrix.lean](../lean/Erdos9796Proof/P97/Census554/CirclePowerMatrix.lean) | Five circles and five points with sound forced-zero/nonzero predicates, exactly one permutation surviving the forced zeros, and certified nonzero entries along that permutation. Two negative entries alone provide neither the five-site pattern nor uniqueness. |
| `power_eq_feature_sum` in the same matrix module | The feature expansion is a possible formal home for the affine identity. Its algebra alone supplies no contradiction. |

The actual-source packet does not presently provide either complete consumer
input. The [terminal-design audit](audits/2026-09-04-cardge13-terminal-design-lemma-lantern.md)
records the cyclic-pattern gap. The active plan says to report a missing
incidence before adding unrelated lemmas. Accordingly this checkpoint stops
at the explicit application contract rather than adding an unconsumed Lean
version of the scalar identity.

## 7. Literature boundaries

The [dead-ends registry](dead-ends.md), §§3.7 and 6.2, records the existing
rank-four circle-power construction and the limitations of earlier blanket
planarity/crossing arguments. Its scope leaves room for metric-labeled graph
constructions; it does not supply the exposure hypotheses of §4.

The [CGAL 2D triangulation manual](https://doc.cgal.org/latest/Triangulation_2/index.html)
describes regular triangulations, their power-diagram duals, and weighted sites
with no cell. Section 4 gives its own crossing proof, including the degeneracy
at a multi-site tie, so the graph deduction does not depend on a library's
choice of triangulation in degenerate cases.

Pinchasi's [*A note on lenses in arrangements of pairwise intersecting circles in the plane*](https://arxiv.org/html/2403.05270v1)
distinguishes lune faces from lens faces. Its stated lune theorem gives a
bipartite planar center embedding. The lens graph forbids avoiding edge pairs
under the additional hypothesis that no two circles touch; the paper explicitly
allows avoiding pairs when touching is admitted. Avoiding edges are opposite
sides of a convex quadrilateral, so this restriction is different from a
crossing prohibition. These results concern actual two-arc arrangement faces.
Two shared carrier points do not prove face emptiness, since further circle
intersections may occur away from the carrier. The two physical concentric
circles are also not a pairwise-intersecting family.

## 8. Replay and completion matrix

From the repository root:

```bash
uv run --no-cache --no-sync python scripts/verify_p97_power_crossing.py
uv run --no-cache --no-sync python scripts/verify_p97_power_crossing.py --regular11-only
PYTHONDONTWRITEBYTECODE=1 uv run --no-cache --no-sync python -m pytest -q -p no:cacheprovider scripts/tests/test_verify_p97_power_crossing.py
```

The first replay checks all 560 orientations, every positive-distance fiber at
all sixteen centers, both two-point overlaps, proper crossing, the affine power
identity at all sixteen stored points, and at least two distinct negative-power
witnesses. The second checks the nine full regular-11 fibers in the exact
cyclotomic representation. Mutation tests reject altered coordinates, floating
input, cyclic order, support, radius, and duplicate edges. Removing the
certificate is a test failure.

The replacement has

    Δ=17651658982842958398074821724251 / 62382923453167720197390900000000 > 0.

All four shared witnesses have a negative cross power, as displayed in §3.
An independent exact monotone-chain hull computation confirmed all sixteen
vertices and the cyclic order; an independent distance-fiber and rational
construction replay confirmed the certificate. These are finite checks, not
a general theorem inferred from testing.

| Obligation | Label | Evidence and boundary |
|---|---|---|
| Incidence/genus count consumers | PROVEN (pen-and-paper), conditional on the asserted embedding | §1 edge counts and the simple bipartite surface bound. |
| Regular-11 and general k polygon constructions | PROVEN (pen-and-paper) | §1 reflection/midpoint construction; exact finite regular-11 replay corroborates it. |
| Rational four-row crossing control | EMPIRICALLY VERIFIED, exact finite scope | Complete §2 certificate; 560 orientation checks, all fibers, independent hull and construction replay. |
| Power identity and two distinct containment witnesses | PROVEN (pen-and-paper) | §3 coefficient expansion and sign cases, including Δ=0; independent proof audit. |
| Exposed-graph noncrossing and outerplanarity | PROVEN (pen-and-paper), conditional on exposure | §4 strict-minimum argument and convex center positions; independent proof audit. |
| Concentric-site exclusion | PROVEN (pen-and-paper) | §5 constant positive power difference. |
| Cited graph facts | PROVEN (cited literature), under the stated hypotheses | §7; the lens assertion requires no touching. The self-contained §3–4 proofs do not use it. |
| Application to the card ≥ 13 source | HEURISTIC route; required source implications unproved | §6 lists the exact antecedents. Current project obligations remain in the authoritative atomic document. |

No Lean source was changed and no fresh root axiom audit was run. The
unavailable scalar Lean candidate mentioned by the external note is not a
dependency or a deliverable of this revision.
