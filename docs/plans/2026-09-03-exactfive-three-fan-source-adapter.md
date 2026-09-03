# Exact-five three-fan source adapter

Date: 2026-09-03

## Objective

Connect the distinctness-based three-fan collision to the live three-row data
without introducing generated role names. The source theorem takes a
`RobustApexFourIncidenceContinuationPacket` and closes the subcase in which:

- the blocker center and second-apex center both belong to the first row;
- a point distinct from the retained point and second-apex center belongs to
  both the first and blocker rows.

The packet supplies the retained point in all three rows. The adapter also
takes explicit first-apex memberships in the blocker and second-apex rows;
these are retained by the final continuation constructor but are not fields of
the packet itself. Row-radius facts then give the six metric equalities. The
geometry theorem forces the shared point, first apex, and second-apex center to
be collinear, contradicting convex independence of the carrier.

## Reuse preflight

A bounded indexed Lean search found
`RobustApexFourIncidenceContinuationPacket.secondRow_crossCenter_metric_exclusive`,
the four-incidence producer, and `ConvexIndep.not_three_collinear`. The metric
exclusivity theorem does not close this subcase: it excludes simultaneous
first-apex and blocker-center radius membership in the second row, while the
three-fan subcase uses the second-apex center in the first row and a different
shared point across the first two rows. The three-fan geometry theorem from
`EquilateralThreeFanCollision.lean` supplies the missing metric conclusion.

The immediate consumer is the final constructor of
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`. The first
missing antecedent is a source-level split producing either second-apex
membership in the first row plus the extra shared support, or its complementary
incidence restrictions. The search and plan are based at revision
`510233b07d`.

## Claim boundary

This adapter closes one source-stated incidence subcase and removes all cyclic
order choices inside that subcase. It does not prove that the subcase holds in
every continuation constructor, classify the complementary source positions,
or close the broad endpoint by itself.
