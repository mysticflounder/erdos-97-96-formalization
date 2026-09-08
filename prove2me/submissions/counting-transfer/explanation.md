# Why a counterexample has at least nine points

This milestone formalizes the counting obstruction in the source repository.
Its route follows Dumitrescu's isosceles-count method (2006), with the
cap-witness refinements used in the source attributed to
Nivasch--Pach--Pinchasi--Zerbib (2013). The Lean declarations and proof are this
project's own formalization. These citations record mathematical provenance;
they do not mean that a paper proof was imported or machine-checked directly.

Let `iCount A` count isosceles triangles by their apex. If every vertex has at
least four other points at one common positive distance, then the six unordered
pairs among those four points give at least six isosceles triangles at each
apex. Thus

```text
6 * |A| ≤ iCount A.
```

Convex independence first excludes the diameter-supported branch of the
minimum enclosing circle. In the remaining circumscribed branch, three support
vertices divide the configuration into three closed caps. The formalized
Dumitrescu counting chain bounds the number of possible apices for each base
pair. The CGN cap-witness stack orders each cap, controls which intra-cap edges
can have two apices, and combines the three cap bounds. This yields

```text
iCount A ≤ (11 * |A|^2 - 18 * |A|) / 12.
```

Combining the lower and upper bounds gives

```text
6 * |A| ≤ (11 * |A|^2 - 18 * |A|) / 12.
```

The equidistance hypothesis already implies `5 ≤ |A|`; elementary arithmetic
then forces `9 ≤ |A|`. This closes the first descent milestone. It does not
settle Problem 97 by itself: the formalization must still exclude nine-point
counterexamples and handle larger minimal counterexamples.

## References

- Adrian Dumitrescu, *On Distinct Distances from a Vertex of a Convex
  Polygon*, Discrete & Computational Geometry 36 (2006), 503--509.
- Gabriel Nivasch, János Pach, Rom Pinchasi, and Shira Zerbib, *The Number of
  Distinct Distances from a Vertex of a Convex Polygon*, Journal of
  Computational Geometry 4 (2013), 1--12; arXiv:1207.1266.

