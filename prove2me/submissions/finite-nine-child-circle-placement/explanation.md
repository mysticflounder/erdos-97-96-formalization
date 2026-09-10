# Finite-nine common-radius circle placement

The public theorem already supplies `S.N4eCapContainment`. The authenticated
`circle_placement.lean` fragment proves the needed intermediate facts in three steps:

1. each positive distance class with at least four points is exactly the corresponding
   four-point cap;
2. the three cap classes force the Moser triangle to have equal side lengths;
3. the positive side length of the first triangle edge is the common radius, and each
   cap is contained in its matching distance class.

The generator retains these support declarations verbatim after removing the duplicate
`N4eCapContainment` definition, which is already in the public N8 interface. The final
`solution` theorem applies the retained `n7_circle_placement` theorem to the public cap
premise. No solution module is imported, and the cap-containment proof is used only as
the accepted upstream producer of the premise at the public DAG boundary.
