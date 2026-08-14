# Ingress contract

## Source-entitled assumptions

1. `capInterior_eq_retainedPairs_union_canonicalSources_of_cap_card_eq_eight`
   in `lean/scratch/freshthird-firstnonhit-cap-eight/CapInteriorSix.lean`
   (lines 105–165) gives exactly six strict-cap vertices in the cap-eight
   branch, independent of total carrier cardinality.
2. The same file's retained-collision localization (lines 48–103) gives each
   retained pair's actual common blocker in the strict cap, not in its own
   pair, and gives its equal-distance relation.
3. The cap-eight FreshThird consumer (lines 206–266) puts the fresh common
   blocker in the four retained vertices when the two canonical row supports
   are identified with the Q support.

## Finite encoding

The six vertices are general planar points with the source-entitled increasing
cyclic subsequence/order: every increasing triple among the six is strictly
counterclockwise.  Translation, rotation, and positive scale are gauge-fixed
by translating the common apex to zero, scaling the first pair radius to one,
and rotating the first cap ray to the positive x-axis; there is no coordinate
box and no t-order or apex-order assumption.  The rational direction chart is
complete here: if another strict-cap point lay on the omitted antipodal ray,
the common apex would lie between it and the fixed first cap point, making
those three distinct A-points collinear.  This contradicts
`Problem97.ConvexIndep.not_three_collinear` from
`lean/Erdos9796Proof/P97/ConvexIndepHelpers.lean:67`, applied to
`S.oppApex1`, the fixed cap point, and that other point.  The application is
valid because the opposite apex is outside its opposite cap and cap points
are injective/distinct.  Thus each vertex has the complete form
`s_pair * ((1−t²)/(1+t²), 2t/(1+t²))`, with `t₀ = 0`.
The three centers are finite aliases among the six: Q is in the four retained
vertices, each retained-pair blocker is outside its own pair, and all three
centers are distinct.  Each center is required to be strictly between its own
pair by the source-clean same-cap betweenness consequence.

The common apex has equal distances on each of the three pairs, and the three
pair radii are positive and pairwise distinct.  Since both endpoints of each
blocker support pair have the same common-apex radius, the actual-blocker
equalities reduce exactly to equal dot products of the rational unit
directions; no geometric constraint is dropped.

## Deliberately omitted

The query does not encode the ambient carrier beyond these six points, all
global K4 rows, rows outside the selected cap, arbitrary cyclic order outside
the minor cap, deletion-survival data beyond the named centers, or a
finite-to-universal/general-cardinality lift.  Consequently even an UNSAT
alias query would be only a bounded obstruction unless a separate Lean lift
were supplied.
