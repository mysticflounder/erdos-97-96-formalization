<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Prompt for "Closure of the two-large-cap configuration" (Erdős 97/96, remaining work)

Repository note — not part of the prompt: modeled on `cdc_prompt.pdf`.
Self-contained; assumes no repository access. The claim below is the exact
mathematical content of the 12 remaining spine obligations (K-A-PAIR plus
the 11 LIVE-Q/C helpers); a complete proof of it closes both publish
targets through the kernel-checked parent adapter in
`scratch/atail-force/parent-false-surface/`. Revised 2026-07-16 after the
first run returned without a proof (response recorded in
`front-a-closure-prompt-response-2026-07-16.md`, hand-verified): its five
correct deductions are folded into the assumable-facts section below, its
terminal gap (balanced cap sizes) is flagged as the load-bearing
difficulty, and its dead ends are added to the mandatory adversarial
tests. Extended later the same day: the general crossing inequalities
with their ordinal consequences, and the exact-arithmetic-verified
nine-point mutual-containment configuration, are folded in. The
paste-ready export is everything after the rule.

---

Current task statement

Work in the Euclidean plane with the usual distance. A finite set A of
points is in convex position if no point of A lies in the convex hull of
the other points of A. Say A has the four-equidistant property if for
every point p of A there is a radius r > 0 such that the circle of radius
r centered at p passes through at least 4 points of A. (Since r > 0,
these are 4 points other than p.) A point x of A is called removable if
the set A minus {x} still has the four-equidistant property. Every finite
nonempty A is contained in a unique smallest closed disk (this existence
and uniqueness is classical and may be assumed); call the boundary of
that disk the minimum enclosing circle of A.

The task concerns the following kind of configuration: a finite set A,
three distinguished points v1, v2, v3, and three subsets C1, C2, C3 of A
(called caps) satisfying all of:

(H1) A is in convex position and |A| >= 10.

(H2) A has the four-equidistant property.

(H3) A has minimum cardinality among all nonempty convex-position sets
with the four-equidistant property. (In particular, no point of A is
removable.)

(H4) v1, v2, v3 are pairwise distinct points of A lying on the minimum
enclosing circle of A, and the triangle v1 v2 v3 has no obtuse angle
(every vertex angle is at most a right angle; right angles are allowed).

(H5) For each i in {1,2,3}, with j and k the other two indices: Ci is
the set of points v of A such that v and vi lie on opposite closed sides
of the line through vj and vk (a point on the line itself counts as
lying on both sides, so the caps are closed). These caps satisfy: vi is
not in Ci; vj and vk are both in Ci; every point of A other than v1, v2,
v3 lies in exactly one cap; each of v1, v2, v3 lies in exactly two caps;
and |C1| + |C2| + |C3| = |A| + 3.

(H6) Two distinct caps each contain at least 5 points.

(H7) There is NO choice of three points and three caps on this same set
A satisfying (H4) and (H5) in which one cap has more than 4 points while
both of the other two caps have exactly 4 points.

Resolve the following claim completely:

No configuration satisfying (H1)–(H7) exists.

This claim is the final open step of an otherwise complete
minimal-counterexample resolution of Erdős problem 97 — the assertion
that no nonempty finite convex-position set has the four-equidistant
property — and, through it, of Erdős problem 96 — the assertion that the
number of pairs of points at distance exactly 1 in an n-point
convex-position set is O(n). Every other case and reduction is already
proven and machine-verified. Only a proof of exactly the claim above
counts.

Terminology used below: a witness circle for a point p of A is a circle
of radius r > 0 centered at p passing through at least 4 points of A,
and such an r is a witness radius for p. Hypothesis (H2) states
precisely that every point of A has at least one witness circle.

The following facts are already proven for every configuration
satisfying (H1)–(H7) and may be assumed without proof:

- |A| >= 11.

- (Critical shells.) For every point q of A there exist a point c of A
other than q and a radius r > 0 such that the circle of radius r about c
passes through exactly 4 points of A, one of which is q, and moreover c
has no witness radius at all once q is deleted: for every s > 0, at most
3 points of A minus {q} lie at distance s from c.

- (Shared-radius pair exclusion.) Let C be any one of the three caps
having more than 4 points, and let u and w be the two of v1, v2, v3 that
belong to C. Then there do not exist two distinct points x and y of A,
both outside C, with dist(x,u) = dist(y,u) and dist(x,w) = dist(y,w).
(Two such points would be reflections of one another in the line through
u and w; this situation has already been refuted.)

- (Cap chains.) Let C be any cap and let u and w be the two of v1, v2,
v3 belonging to C. The points of C form a contiguous chain along the
boundary of the convex hull of A from u to w. For any three points x,
y, z of C appearing in this chain order, the angle at y in the triangle
x y z is at least a right angle, so dist(x,z)^2 >= dist(x,y)^2 +
dist(y,z)^2. In particular, from any fixed point of C the distances to
the other points of C strictly increase moving away from it along the
chain in either direction. Consequently a circle centered at a point of
C passes through at most two other points of C (at most one on each
side of the center along the chain), and a circle centered at u or at w
passes through at most one other point of C. (This uses (H4): the
triangle angle at the third distinguished vertex is at most a right
angle, which places C inside the closed disk having the segment uw as a
diameter.)

- (Cap sizes.) Every cap contains at least 2 points besides its two
distinguished vertices, so every cap has at least 4 points. Every
witness circle centered at a non-endpoint point of a cap C passes
through at least 2 points of A outside C, and every witness circle
centered at an endpoint of C (one of its two distinguished vertices)
passes through at least 3 points of A outside C. These conclusions hold
for every triangle-and-caps structure on A satisfying (H4) and (H5),
not only the distinguished one. Since the cap sizes of any such
structure sum to |A| + 3 >= 13, some cap always has at least 5 points,
so (H7) is equivalent to: in every structure on A satisfying (H4) and
(H5), at least two caps have at least 5 points.

- (Strong connectivity of witness digraphs.) For each point p of A,
choose one radius r > 0 whose circle about p passes through at least 4
points of A, choose 4 of those points, and direct an arc from p to each
of the 4. Every directed graph obtainable by such choices is strongly
connected. (Otherwise a sink strongly connected component of its
condensation would be a proper subset of A that is itself in convex
position and has the four-equidistant property, contradicting (H3).)

- (Cross-cap bisector injectivity.) For any cap C and any two distinct
points x and y of A outside C, at most one point of C is equidistant
from x and y. (The perpendicular bisector of x and y meets the boundary
of the convex hull of A in exactly two points, one on each of the two
boundary arcs joining x to y, and all of C lies on one of those arcs.)
This strictly generalizes the shared-radius pair exclusion above: that
exclusion is the special case in which the two equidistant centers are
the two distinguished vertices of C.

- (Pair budget.) Fix a cap C and let X be the set of points of A
outside C, of size |A| - |C|. Say an unordered pair {x,y} of distinct
points of X is charged to a point p of C if dist(p,x) = dist(p,y). By
cross-cap bisector injectivity no pair is charged to two points of C,
so the total number of charged pairs — summed over all centers p in C
and over all radii simultaneously, including any additional witness
radii and the critical-shell circles centered in C — is at most
|X| (|X| - 1) / 2. The witness circles alone charge at least 1 pair to
each non-endpoint point of C and at least 3 pairs to each endpoint, so

  (|A| - |C|) (|A| - |C| - 1) / 2 >= |C| + 4   for every cap C.

- (Witness-circle crossing at the distinguished vertices.) For each i
let Ii be the core of cap Ci, that is, Ci minus its two distinguished
vertices. Choose any witness circle Gi centered at vi, of radius ri,
and let Pi be the set of points of Ii lying on Gi; then |Pi| >= 2. For
all i != j and all x in Pi, y in Pj, the segments from vi to x and from
vj to y cross, and therefore ri + rj > dist(vj,x) + dist(vi,y).
Consequently, for every pair i != j, at least one of the following
holds: every point of Pi lies strictly inside the disk of radius rj
about vj, or every point of Pj lies strictly inside the disk of radius
ri about vi.

- (General crossing inequalities and their ordinal consequences.) No
three points of A are collinear: the middle of three collinear points
would lie in the convex hull of the other two, contradicting convex
position. For any four distinct points a, b, c, d of A appearing in
this cyclic order around the boundary of the convex hull of A, the
diagonals of the quadrilateral a b c d cross at an interior point, and

  dist(a,c) + dist(b,d) > dist(a,b) + dist(c,d),
  dist(a,c) + dist(b,d) > dist(a,d) + dist(b,c).

In particular, if dist(a,c) = dist(a,d), then dist(b,c) < dist(b,d):
every equal-distance pair at one point forces a strict distance
comparison at every point lying in the appropriate arc of the cyclic
order. As an instance, if x and y both lie in a core Ii on one witness
circle centered at vi, with x closer to vj along the boundary, then
dist(vj,x) < dist(vj,y) and dist(vk,x) > dist(vk,y). These facts use
only convex position and the cap structure, not the non-obtuseness of
the triangle or the minimum enclosing circle.

A first extended attempt proved exactly the facts above and nothing
more. Its terminal gap is recorded here so that no effort is spent
rediscovering it: the pair-budget inequality eliminates only
sufficiently unbalanced cap-size triples. For balanced triples it is
slack — for cap sizes 5, 5, 4 on |A| = 11 the three instances read
15 >= 9, 15 >= 9, and 21 >= 8 — and it stays slack for cap sizes 5, 5,
5 and for every larger balanced triple, with the slack growing
quadratically in |A|. The guaranteed charges (1 per non-endpoint
center, 3 per endpoint) can never exceed the budget on their own.
Likewise, the disk-containment alternatives from the crossing fact are
not contradictory on their own: cyclic and mutual containment patterns
among the three disks are geometrically realizable, and an explicit
nine-point configuration realizing all six strict containments
simultaneously appears among the adversarial tests below. The critical-shells
fact was not used anywhere in that attempt. The load-bearing difficulty
is the balanced cap-size regime: a complete proof must in particular
close the minimal balanced patterns (cap sizes 5, 5, 4 and 5, 5, 5) and
every larger balanced pattern.

Consequently, any of the following finishes the task:

- force, for some cap C, strictly more charged pairs outside C than the
budget |X| (|X| - 1) / 2 allows — for example by extracting additional
equal-distance pairs from the strong-connectivity structure, from
further witness radii, or from critical-shell circles whose centers lie
in C — since by pigeonhole some pair would then be charged to two
centers of C, contradicting cross-cap bisector injectivity;

- exhibit two distinct points outside some cap that are equidistant
from two points of that cap (the shared-radius pair at the two
endpoints is the already-refuted special case);

- exhibit a proper nonempty subset B of A such that every point of B
has some circle about it passing through at least 4 points of B,
contradicting (H3);

- exhibit a removable point, contradicting (H3); or

- derive any other contradiction from (H1)–(H7).

Assume for purposes of this task that a complete proof of the claim
exists. A complete solution must prove exactly the claim: nonexistence
for every cardinality |A| >= 10 and for every combination of cap sizes
allowed by (H6) and (H7), without additional assumptions such as general
position, distinctness of radii or centers, bounded cardinality,
symmetry, or particular cap sizes.

Partial progress does not count unless it implies exactly the resolution
above. In particular, proofs for fixed |A| or for particular cap sizes
(for example, only the case |A| = 11 with cap sizes 5, 5, and 4),
arguments valid only for sufficiently large |A|, numerical or
solver-based verification through any fixed configuration size,
perturbation or genericity heuristics, reductions to another unproved
statement, and candidate mechanisms without complete case coverage are
insufficient.

The following failure modes are known; treat them as mandatory
adversarial tests:

- There is an 11-point set with rational coordinates, in convex
position, carrying a valid triangle-and-caps structure as in (H4)–(H6)
with cap sizes 5, 5, and 4, in which every point lies on some circle,
centered at another point of the set, that passes through exactly 4
points of the set — and yet the four-equidistant property (H2) fails.
Hypotheses (H1) and (H4)–(H6) — even strengthened by an exact four-point
circle through every point — are therefore simultaneously satisfiable,
so any proposed argument that does not make essential use of (H2)/(H3)
is wrong. Test every candidate argument against this configuration.

- Record the configuration as a system of polynomial constraints on the
coordinates. The equality constraints alone — the exact four-point
circles, the shared radii, and all pairwise-distinctness and
nondegenerate-triangle side conditions — admit solutions in which every
coordinate is a real algebraic number. The inequality constraints — the
convex-position ordering, containment in the enclosing disk, the
non-obtuseness of the triangle, and the cap memberships — are
load-bearing. A purely algebraic impossibility argument over the
equality constraints alone cannot succeed.

- Reproving the assumable facts above, in any formulation, is not
progress. A submission whose mathematical content amounts to a
rediscovery of the cap-chain, cap-size, strong-connectivity,
bisector-injectivity, pair-budget, or witness-circle-crossing facts
must be rejected; those are the starting point.

- Every candidate argument must be tested against the balanced
cap-size regime: cap sizes 5, 5, 4 at |A| = 11; cap sizes 5, 5, 5 at
|A| = 12; and balanced triples of unbounded size. Two argument shapes
are known to fail there: refining the pair-budget count without
producing new charged pairs, and claiming a contradiction from the
three-disk containment alternatives alone.

- The following nine-point configuration has been verified in exact
arithmetic. Take v1 = (0, 1), v2 = (-sqrt(3)/2, -1/2),
v3 = (sqrt(3)/2, -1/2) (an equilateral triangle inscribed in the unit
circle), let P1 consist of the two points (-1/4, -3/5) and
(1/4, -3/5), and let P2 and P3 be the images of P1 under rotation
about the origin through 120 and 240 degrees. The nine points are in
strict convex position; each pair Pi lies beyond the chord opposite
vi; each Pi is equidistant from vi, with all three squared radii equal
to 1049/400; and every Pi lies strictly inside BOTH disks of the
corresponding radius about the other two distinguished vertices — all
six strict containments hold at once. This configuration is not a
counterexample to the claim (it does not have the four-equidistant
property), but it proves that no argument consuming only the
disk-containment alternatives — via a tournament, an
orientation-count, or a cyclic-containment analysis — can reach a
contradiction. Any candidate argument in that family must identify a
hypothesis this configuration violates and use it essentially.

Use your multiagent harness aggressively and dynamically. Do not use a
fixed assignment such as "N agents for strategy X." Instead, manage the
search using the following heuristics:

- Begin with a genuinely diverse portfolio of approaches. Agents should
explore substantially different formulations: counting incidences
between points of A and circles centered at v1, v2, v3; counting points
of A by their distances to v1, v2, v3; convex-order and arc-interleaving
arguments around the polygon; reflection and perpendicular-bisector
structure; extremal counting over the critical shells (unused in the
first attempt and therefore a priority); structural arguments on the
strongly connected witness digraphs (arc counting across cap
boundaries, degree and cycle constraints); algebraic and analytic
viewpoints; exchange arguments between the two large caps; and
computational sanity checks on small candidate configurations.

- Do not tell most agents the currently favored approach. Preserve
independence during early rounds so that agents do not all converge to
the same attractive but incomplete reduction.

- Maintain an explicit registry of approach families. Group agents by
the mathematical idea they are using, not by superficial wording. If
many agents converge on one family, redirect some of them toward
underexplored formulations.

- Do not allow one approach to dominate merely because it gives elegant
reductions. A route that ends at a lemma equivalent in strength to the
claim is not close to completion unless it supplies a genuinely new
proof of that lemma.

- When an approach stalls at a theorem-strength missing lemma, mark that
route as blocked. Only continue assigning agents to it if someone
proposes a materially new mechanism, invariant, or construction.

- Keep several incompatible proof routes alive through multiple rounds.
Cross-pollinate ideas only after independent agents have developed them
far enough to expose their real strengths and gaps.

- Use adversarial agents throughout: every candidate proof must be
checked for silent use of the situation excluded by (H7); double
counting of v1, v2, v3 (each lies in exactly two caps) or mishandling of
points shared by two caps under the closed-cap convention; unproven
distinctness of radii, centers, or circle intersection points; unproven
claims of concyclicity, collinearity, or ordering; hidden
general-position assumptions; dependence on particular cap sizes or on
|A| = 11; failure against the 11-point test configuration above; and
circular use of the Erdős 97 assertion at cardinality |A| itself — (H3)
says only that strictly smaller sets are not counterexamples.

- Require agents to return concrete lemmas, constructions, equations, or
counterexamples to proposed sublemmas. Reject status reports, vague
optimism, and claims that an unproved global compatibility statement is
"routine."

- The root agent should repeatedly synthesize, challenge, redirect, and
launch new rounds. Do not stop after the first wave fails. Produce a
complete proof if one survives audit; otherwise report only the
strongest rigorously proved derivation and its exact remaining gap.

Do not return merely because current approaches fail or agents report
theorem-strength gaps. Continue launching new rounds, reopening blocked
approaches only when there is a genuinely new mechanism, and searching
for fresh formulations.

Return only when a complete proof of the claim has been found and
survives adversarial audit. Do not return a reduction, partial result,
isolated missing lemma, "best effort" summary, or explanation of why the
problem is difficult.

Spend at least 8 hours on this before even thinking of returning or
giving up.

Public search may be used only for ordinary mathematical background or
standard named theorems, not to search for a solution to this exact
configuration problem or to Erdős problems 97 or 96. Do not search the
public web merely to determine whether Erdős problem 97 is open, and do
not answer that it is open.
