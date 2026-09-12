# Why the inner normalized height is small

The two quadratic equations again leave two possible placements for the return
point. The upper placement contradicts strict convexity and the affine
separator, just as in the companion impossibility theorem.

For the lower placement, the proof splits according to whether `1 / s ≤ k`.
In that range, the height assumptions provide nonnegative barycentric
coordinates that put the return point in the triangle formed by the two
endpoints and the lower center, contradicting strict convexity.

In the remaining range, the affine relation among the return point, one
endpoint, and the two centers has two positive coefficients. The separator
signs force the third coefficient to be negative. Clearing its positive
denominator gives a strict scalar inequality, and elementary algebra with
`s² = 3`, `0 < s`, `1 < h`, and `0 < k ≤ 1` yields `k < 2 - s`.

The proof assumes the normalized chart, circle equations, and separator. The
open descent argument must still produce those data from its point-set
configuration.
