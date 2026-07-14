# ATAIL Stage-I separated-cap geometry assessment

Date: 2026-07-13

## Verdict

The actual K-A-PAIR cap surface now has a sharper, kernel-checked frontier,
but `URowSeparatedCapPlacement` is not yet excluded.

The checked classification is exhaustive:

```text
separated placement
  -> p and uRow.center lie in strict interiors of two distinct caps
     or one center is the Moser vertex opposite the other's strict cap.
```

Two Moser vertices cannot survive the separated branch: every pair of Moser
vertices shares a closed cap.  The endpoint branch is now independent of the
facing cap cardinality.  The production theorem
`selectedClass_capInteriorByIndex_card_ge_two` shows that any positive-radius
K4 class centered at the opposite Moser vertex contains two distinct points
of the facing strict cap interior.  Applied to the exact critical row, this
gives a pair `x != y` with:

- the entire carrier radius filter equal to the named four-point support;
- `dist opposite x = dist opposite y`;
- `x,y` both in the facing strict cap interior; and
- unequal distances from `x,y` to each of the two outer Moser endpoints.

The last two inequalities are the checked two-circle/cap-order consequences
`capInterior_pair_dist_ne_rightOuter_of_selectedClass` and its left analogue.
Thus the former `card = 4` versus `card >= 5` split is superseded: there is no
large-cap escape.  This remains a producer frontier, not a contradiction.  A
new cross-row equality would have to put another carrier center on the
pair's perpendicular bisector; neither cap counting nor exactness produces
such an equality.

## Exact remaining theorem

All cap bookkeeping needed for ALIGN is now behind two propositions:

```text
URowDistinctInteriorCapPlacement -> False

URowOppositeEndpointInteriorPairFields -> False
```

`commonCapAlignment_of_geometry_frontier_exclusions` composes these two
future geometric exclusions with the existing cap-coverage dichotomy and
produces `URowCommonCapAlignment`.  Thus the smallest honest next result is a
consumer for one of those two packets, not another cap-coverage or lower-bound
lemma.

The exact `leafSurplusPacket` adapter is
`leaf_separatedCapPlacement_sharp_frontier`.  The K-A-PAIR hypotheses
`hNoM44` and the second-large-cap witness affect cap cardinalities but contain
no center-membership or row-filter conclusion, so they do not collapse either
remaining packet without a new metric/order argument.

## Bank preflight

Before deriving this local geometry, the required registries were rechecked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered common/shared cap placement, separated critical
centers, Moser-opposite exact-radius classes, and full-filter cap localization.
The relevant reusable declarations were the existing cap-interior uniqueness,
the selected-class interior lower bound, the two outer-endpoint distance
separation theorems, the Moser-cap selector, and selected-row upper bounds. No
indexed or banked theorem excludes either final frontier packet. The closest
sibling U5 double-bisector theorem needs a specific eight-equality graph that
the current pair packet does not produce.

## Validation

`PinnedSurplusGeneralM` was rebuilt as a production target, after which
`stage1_separated_cap_geometry_boundary.lean` was checked in dependency order
using scratch oleans for its two existing local imports. Every printed endpoint
has axiom closure exactly
`propext`, `Classical.choice`, and `Quot.sound`.  The file contains no `sorry`,
`admit`, named axiom, or `native_decide`.

Epistemic labels:

- **PROVEN / kernel-checked:** the exhaustive cap classification, both
  historical short-cap incidences, the cap-cardinality-free exact-filter
  interior-pair packet, the sharp combined frontier, and the exact leaf
  adapter;
- **PROVEN dependency boundary:** no-`M44` and two-large-cap cardinality data
  do not themselves supply the missing center placement;
- **NOT CLAIMED:** exclusion of `URowSeparatedCapPlacement` or closure of a
  live source `sorry`;
- **CONJECTURED:** one or both remaining frontier packets feed an existing
  MEC/order contradiction after a new producer theorem.
