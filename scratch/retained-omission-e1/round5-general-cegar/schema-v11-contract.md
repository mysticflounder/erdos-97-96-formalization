# Schema 11 pinned-seed contract

Schema 11 extends Schema 10 only with source facts proved in
`TwoSourceFreshThirdResidual.lean` for the equal-center, distinct-cap
FreshThird branch.

The two selected critical supports have exact intersection equal to the two
Q sources.  The canonical C support is exactly the two C sources together
with the two Q sources.  Consequently their union is a six-point seed.

Global minimality and the all-large carrier lower bound prove that there is
one carrier center in this seed such that every positive physical radius
class at the center contains at most three seed points.  The same proof
excludes both exposed critical-shell centers as the pinned center.  In the
finite encoding this is the exact existential formula

```text
exists c in seed,
  c != C-center and c != Q-center and
  for every carrier anchor a != c,
    card({p in seed | dist(c,p) = dist(c,a)}) <= 3.
```

The existing radius-equivalence relation `E(c,a,p)` represents the displayed
physical class.  A one-hot selector chooses the pinned center before all
radius anchors, matching the Lean quantifier order.  The *negated shared-pair
subquery* is rebuilt at that same selected center; the older endpoint-centered
shared-pair negation is not inherited.  Schema 11 does retain Schema 7's
separate positive surviving-row query at a selected fresh endpoint.  That is
source ingress from
`freshThird_canonicalDifferentCap_exists_orderSelectedEndpointSurvivingRow`,
not the row being tested by the pinned-center shared-pair negation.  The two
deletion alternatives remain the 16-matrix coverage split.  Every radius
class of size at least four at the pinned center necessarily contains a point
outside the seed.

The query ranges over every positive radius class at the pinned center and
every globally selected four-row at a distinct carrier center.  Its direct
clauses negate the existence of two shared points on the same cyclic arc
between the row centers.  This is now the exact finite predicate consumed by
`FreshThirdSharedPairNonalternationPacket` and
`false_of_freshThirdSharedPairNonalternationPacket`.  The latter is a checked
general-`n` Lean theorem and works directly with boundary betweenness, so no
cyclic-cut rotation through `FreshThirdSharedLatePairPacket` is required.
All carrier points receive positions in the finite boundary permutation; the
pinned center need not be one of the five named Schema 9 roles.  Promotion
still requires source extraction of the selected radius class and coherent
comparison row, plus a sound arbitrary-cardinality finite-pattern lift.
The stronger blocker/support dichotomy from
`exists_freshThirdCrossRow_pinnedCenter_universal_escape_dichotomy` is not
fully represented here and must not be claimed as part of a Schema 11 result.

The query continues to negate the Schema-9 shared-pair producer through the
audited Schema-10 direct clauses.  SAT is bounded abstract countermodel
evidence only.  UNSAT would require a general Lean extraction theorem and
kernel-checked certificate replay before it could close the live residual.
