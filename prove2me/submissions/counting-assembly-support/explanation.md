# Why the counting hypotheses force nine points

Following Adrian Dumitrescu's 2006 isosceles-count method in *On Distinct
Distances from a Vertex of a Convex Polygon*, at any vertex four other points
at one positive distance determine six
unordered pairs. Each pair forms an isosceles triangle with that vertex as
apex, so summing over all vertices gives `6 · |A| ≤ I(A)`, where `I(A)` is the
total isosceles count.

The repeated-distance property also supplies at least five points. Strict
convexity then rules out collinearity. The minimum-enclosing-circle theorem
used by the counting route can therefore exclude its diameter branch and
places at least three points of the set on the circle boundary.

The final intermediate theorem deliberately assumes the quadratic upper bound

`I(A) ≤ (11 · |A|² - 18 · |A|) / 12`.

Combining it with `6 · |A| ≤ I(A)` gives a scalar quadratic inequality. The
separate arithmetic lemma, together with `3 ≤ |A|`, yields `9 ≤ |A|`.

This packet exposes the lower bound, the geometric boundary input, and the
conditional arithmetic reducer. The already accepted counting root supplies
the required upper bound through the circumscribed-triangle argument.
