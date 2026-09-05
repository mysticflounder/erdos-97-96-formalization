# Motivation

The mission is to prove the combined open goal

$$
\text{Problem 97} \;\land\; \text{Problem 96}
$$

for finite point sets in strictly convex position in the Euclidean plane.

## Why Problems 97 and 96 belong together

Problem 97 gives the local step needed for Problem 96. Assume Problem 97. Every
nonempty convex-independent finite set then has a vertex with at most three
neighbors at each positive radius, in particular at radius $1$. Delete that
vertex and preserve convex independence. Apply the same step to every subset
created by deletion until no points remain.
Charge each unordered unit-distance pair to the first endpoint deleted. Each
deleted vertex receives at most three charges, so an $n$-point set determines
at most $3n$ unordered unit-distance pairs. This gives the Problem 96 bound
and therefore $O(n)$. The package uses this one-way dependency; it does not
seek a reverse implication.

# Setting

Let $A\subset\mathbb R^2$ be finite. Strict convex position is represented by
the upstream predicate `EuclideanGeometry.ConvexIndep`: every point of $A$ is
an extreme point of the convex hull of $A$. For $p\in A$, the pinned
multiplicity at radius $r>0$ counts points $q\in A$ with
$\lVert p-q\rVert=r$. Problem 97 asks for a point where no radius has four
such other points. Problem 96 counts unordered pairs at distance $1$, then
takes the supremum over convex-independent $n$-point sets.

The historical progression is part of the setting. Erdős’s 1946 paper posed an
earlier three-neighbor version. His 1987 account reports Danzer’s convex
nonagon in which every vertex has three equidistant witnesses, and asks about
four witnesses. Fishburn and Reeds’s 1992 work gives a 20-vertex convex
configuration with the same unit distance at every vertex, placing the local
question beside the unit-distance problem.

# Target

The Problem 97 target is the canonical statement that every nonempty finite
convex-independent $A$ has no four-equidistant-point property:

$$
\forall A,\quad A\ne\varnothing\;\to\;\operatorname{ConvexIndep}(A)
\;\to\;\neg\operatorname{HasNEquidistantProperty}(4,A).
$$

The Problem 96 target is the canonical asymptotic statement

$$
U_c(n)=O(n),
$$

where $U_c(n)$ is the supremum of the unordered unit-distance counts
determined by convex-independent $n$-point sets. The bound is asymptotic;
the Problem 97 route would give the stronger explicit bound $U_c(n)\le3n$
for every natural number $n$.

# Significance

The package records a formal proof route joining a pinned geometric obstruction
to a global extremal bound. A successful Problem 97 proof would immediately
settle Problem 96 with the explicit constant $3$, while preserving the
combinatorial meaning of the count. It also separates the historical
three-neighbor constructions from the still-open four-neighbor assertion.

# Difficulty

The source proof reduces Problem 97 to strong induction on $|A|$. A counting
engine forces every counterexample to have at least nine points; a finite
geometric analysis excludes exactly nine points; and the remaining step must
produce a removable vertex for every larger minimal counterexample. The
removable-vertex statement carries the induction hypothesis that every
strictly smaller nonempty convex 4-equidistant set is contradictory. That
large-cardinality geometric step remains open, so both headline targets remain
open. Finite computational certificates can support local cases but do not
replace the universal geometric statement.

# Formalization scope

The canonical source is pinned at commit
`757d852766f377f7c1a0ffeeef6d3526bc0cb7a4`. Source-repository exports are
[`Problem97.erdos97_rhs`](https://github.com/mysticflounder/erdos-97-96-formalization/blob/757d852766f377f7c1a0ffeeef6d3526bc0cb7a4/lean/Erdos9796Proof/P97/UpstreamBridge.lean#L30)
and [`Problem96.erdos96_rhs`](https://github.com/mysticflounder/erdos-97-96-formalization/blob/757d852766f377f7c1a0ffeeef6d3526bc0cb7a4/lean/Erdos9796Proof/P96/UpstreamBridge.lean#L96).
The source repository reports closed proofs of the conditional bridge to the $3n$ bound
([`unit_distance_pairs_bound_of_erdos97`](https://github.com/mysticflounder/erdos-97-96-formalization/blob/757d852766f377f7c1a0ffeeef6d3526bc0cb7a4/lean/Erdos9796Proof/P96/EuclideanPeeling.lean#L273)),
the $|A|\ge9$ counting milestone
([`counterexample_card_ge_nine`](https://github.com/mysticflounder/erdos-97-96-formalization/blob/757d852766f377f7c1a0ffeeef6d3526bc0cb7a4/lean/Erdos9796Proof/P97/Counting.lean#L95)),
and the exact nine-point exclusion
([`FiniteN9Closure`](https://github.com/mysticflounder/erdos-97-96-formalization/blob/757d852766f377f7c1a0ffeeef6d3526bc0cb7a4/lean/Erdos9796Proof/P97/N9Endpoint/Closure.lean#L56)).
The large-cardinality milestone is
[`RemovableVertexOfLarge`](https://github.com/mysticflounder/erdos-97-96-formalization/blob/757d852766f377f7c1a0ffeeef6d3526bc0cb7a4/lean/Erdos9796Proof/P97/RemovableVertexAxiom/RemovableVertexOfLarge.lean#L50),
with its minimality hypothesis retained. The current platform draft contains
statement-level sketches and no imported source proofs. Its definitions make
convex independence and the positive-radius condition explicit; no theorem is
assumed inside a definition. Singletons and two-point sets are included in
Problem 97, while Problem 96's counting definitions also include the empty set.
The source repository uses Lean `v4.27.0`; these mission statements target the
platform's `v4.33.1`. Source-proof transfer and revalidation remain separate work.

These source results establish the intended dependency graph: the P97 universal
root feeds low-unit-degree extraction, strong induction, and then the P96
supremum bound. The platform mission records those contracts and milestones;
it does not claim to have transplanted their proof bodies.
Planned milestones are the two canonical roots, their conditional bridge, the
`|A| ≥ 9` count, the `n = 9` exclusion, the `|A| > 9` removable-vertex step,
and the documented Danzer nine-point three-neighbor example.

# References

- Erdős, *On Sets of Distances of n Points* (1946), [DOI](https://doi.org/10.1080/00029890.1946.11991674).
- Erdős, *Some Combinatorial and Metric Problems in Geometry* (1987), [scan](https://www.renyi.hu/~p_erdos/1987-27.pdf).
- Fishburn–Reeds, *Unit Distances Between Vertices of a Convex Polygon* (1992), [publisher record](https://www.sciencedirect.com/science/article/pii/092577219290026O).
- Dumitrescu, *On Distinct Distances from a Vertex of a Convex Polygon* (2006), [Springer record](https://link.springer.com/article/10.1007/s00454-006-1262-y); provenance for the source counting method.
