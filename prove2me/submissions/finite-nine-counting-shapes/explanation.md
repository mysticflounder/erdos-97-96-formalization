# How the finite-nine counting shapes assemble

For a chosen apex `p`, let `S` be a finite set of neighbours of `p` at one
common distance. Every two-element subset of `S` is an isosceles pair at `p`.
The first theorem records the resulting bound
`S.card.choose 2 ≤ iCountAt A p`. It is the reusable local counting step.

The second theorem specializes that step to five neighbours: five choose two
is ten, so the apex contributes at least ten local pairs. The third theorem
starts with a four-point equidistant class, whose six two-element subsets are
already counted, and adds one equal-distance pair with a designated endpoint
outside that class. The pair is therefore a new member of the isosceles-pair
family, giving at least seven local pairs.

The last two theorems use the accepted theorem
`Problem97.fifty_five_le_iCount_of_card_nine_K4_of_iCountAt_ge_seven`.
In a set of nine points with four equidistant witnesses at every point, an
apex with at least seven local pairs raises the six-pairs-per-point baseline by
one, and the total is at least fifty-five. Feeding the ten-pair conclusion of
the five-neighbour theorem into that lift gives the first nine-point result.
Feeding the seven-pair conclusion of the extra-pair theorem into the same lift
gives the second. The dependency graph is therefore:

```text
iCountAt_ge_choose_two_of_equidistant_subset
        └── iCountAt_ge_ten_of_five_equidistant
                └── fifty_five_le_iCount_of_card_nine_K4_of_five_equidistant

four-class + extra pair
        └── iCountAt_ge_seven_of_four_class_and_extra_pair
                └── fifty_five_le_iCount_of_card_nine_K4_of_four_class_and_extra_pair
```

The two nine-point conclusions matter because finite-nine shape proofs can
invoke them at the exact apex supplied by a local configuration, then compare
the resulting lower bound with the finite-nine total-count upper bound. This
packet exposes that interface for the five-neighbour and extra-pair shapes; it
does not claim a mission milestone or a complete finite-nine exclusion.

The counting method follows Adrian Dumitrescu's 2006 paper *On Distinct
Distances from a Vertex of a Convex Polygon*. The Lean formalization and the
Prove2Me proofs are by Adam McKenna.
