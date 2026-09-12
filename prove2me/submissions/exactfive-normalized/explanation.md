# Why the normalized return configuration is impossible

The two quadratic equations leave two possible placements for the return point
in the chosen affine coordinates. The proof handles both placements.

For the upper placement, an affine dependence expresses either the return
point or the left endpoint as a convex combination of three other points. The
separator signs force the remaining coefficient into the required range, so
strict convexity gives a contradiction.

For the lower placement, the assumptions `s² = 3`, `0 < s ≤ h`, and `0 < k ≤ 1`
give nonnegative barycentric coordinates that place the return point in the
triangle formed by the two endpoints and the lower center. Strict convexity
again gives a contradiction.

This proof starts after the affine chart, circle equations, height bound, and
separator have been constructed. Producing those hypotheses from the full
Problem 97 descent configuration is separate work.
