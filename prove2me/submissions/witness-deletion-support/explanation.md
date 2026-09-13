# Why witness-system deletion is a descent interface

A witness system records one four-point equal-distance class for each point
of a finite planar configuration. Suppose a point `x` occurs in none of these
classes. For any remaining point `y`, its selected class already avoids `x`,
so the same class remains available after deleting `x`. The Lean theorem
`Problem97.K4_delete_of_indeg_zero` packages this observation together with
preservation of nonemptiness and strict convexity.

The second theorem applies that deletion step at the nine-point boundary. If
some point of a nine-point configuration occurred in no witness class, its
deletion would be an eight-point configuration with the same four-witness
property. The accepted counting lower bound rules out such a configuration.
Thus `Problem97.exists_witness_mem_of_card_eq_nine` supplies the finite base
condition needed when a larger minimal-counterexample argument reaches nine
points.

That nine-point lower bound follows Adrian Dumitrescu's 2006 isosceles-count
method in *On Distinct Distances from a Vertex of a Convex Polygon*. This
citation records the provenance of the counting step; the Lean formalization
used here is by Adam McKenna.

This packet leaves the existence of an unused point in larger configurations
as a separate open obligation. The statements use the project's planar
Euclidean definitions and have been formalized in Lean by Adam McKenna.
