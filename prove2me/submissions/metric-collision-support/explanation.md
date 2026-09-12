# Why the metric constraints force collisions

The first theorem is the usual uniqueness of a circumcenter, written without
assuming a pre-existing circle. Equal squared distances to each of three base
points give two linear equations for the candidate center. A separate
coordinate argument shows that three pairwise-distinct points lying at one
distance from a center cannot be collinear. The resulting nonzero determinant
forces the coordinate differences between the two candidate centers to vanish.

For the equilateral-bisector configuration, translate the point `p` to the
origin and use displacement coordinates for `a`, `b`, `c`, and `x`.
Squared-distance subtraction reduces the conditions to polynomial equations.
Eliminating the coordinates leaves two possibilities: `x` is `p`, or `c` is
`b`.

For the three-triad configuration, normalize two distinct points to a fixed
horizontal pair. The six equal-distance relations determine successive
coordinates. Polynomial elimination makes the remaining scalar system
inconsistent, so the assumed distinction is impossible and the two points
must coincide.

These proofs expose the geometric collision lemmas without the surrounding
finite-pattern enumeration. Later descent work may call them after producing
their metric hypotheses from a counterexample configuration.
