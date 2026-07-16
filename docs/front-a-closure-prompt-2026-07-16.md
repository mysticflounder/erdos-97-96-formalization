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
`scratch/atail-force/parent-false-surface/`. Everything after the rule is
the prompt.

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

Consequently, any of the following finishes the task: derive from
(H1)–(H7) the existence of such a shared-radius pair; or exhibit a
removable point, contradicting (H3); or derive any other contradiction.

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

Use your multiagent harness aggressively and dynamically. Do not use a
fixed assignment such as "N agents for strategy X." Instead, manage the
search using the following heuristics:

- Begin with a genuinely diverse portfolio of approaches. Agents should
explore substantially different formulations: counting incidences
between points of A and circles centered at v1, v2, v3; counting points
of A by their distances to v1, v2, v3; convex-order and arc-interleaving
arguments around the polygon; reflection and perpendicular-bisector
structure; extremal counting over the critical shells; algebraic and
analytic viewpoints; exchange arguments between the two large caps; and
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
