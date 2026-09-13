# Why one extra local pair gives the finite-nine bound

The baseline counting argument assigns at least six local isosceles pairs to
each point when four equidistant neighbours are available. Summing over the
configuration gives `6 · |A| ≤ I(A)`, where `I(A)` is the total isosceles
count. If one chosen vertex contributes at least seven local pairs, deleting
that vertex from the sum leaves the six-pair lower bound at every remaining
vertex while the chosen vertex contributes seven. Therefore
`6 · |A| + 1 ≤ I(A)`.

At nine points this inequality evaluates to `55 ≤ I(A)`. The second theorem
packages that arithmetic as a direct interface for later finite-nine shape
arguments, so those arguments can use the strengthened count without
repeating the summation and cardinality bookkeeping.

The method follows Adrian Dumitrescu's 2006 paper *On Distinct Distances from a
Vertex of a Convex Polygon*. The Lean formalization and the Prove2Me proofs are
by Adam McKenna.
