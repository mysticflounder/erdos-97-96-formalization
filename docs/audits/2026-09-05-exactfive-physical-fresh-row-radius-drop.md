# Exact-five physical fresh-row radius-drop checkpoint

## Frontier

- Publish target: `Problem97.erdos97_rhs`.
- Active residual:
  `Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`.
- Immediate coordinator:
  `Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenterNormalForm`.
- Lane base: `38b889232e6ad7f1318ef1cf8900bfd1ddcd32ba`.

The source-side strict radius drop is now available as
`FirstApexInteriorPairGeometry.bisectorCenter_radius_lt_of_selected_pair`.
This lane connects it to the exact critical shell chosen for the physical
fresh source.

## Reuse preflight

The bounded in-project search for an adapter from the exact-five residual and
a fresh critical shell found no current theorem.  The stale index still named
a removed untracked `FirstApexRadiusDrop.lean`; source inspection confirmed
that the maintained implementation is instead in
`FirstApexInteriorPairGeometry.lean`.

There is no circularity.  The adapter uses only:

- `R.interior.q_mem_interior` and `R.interior.w_mem_interior`;
- exact-shell `support_eq_radius` at the fresh source's chosen blocker;
- carrier membership of that blocker from `center_mem`;
- first-apex deletion robustness to exclude the first apex as the blocker;
  and
- the established source-side radius-drop theorem.

The immediate consumer is the double-hit branch of the physical residual.

## Formalized consequences

`ATail/ExactFiveDistinctPhysicalFreshRowRadiusDrop.lean` proves:

1. `actualFreshBlocker_radius_lt_of_contains_interiorPair`: if the fresh
   source's actual blocker row contains both original strict-interior sources,
   its radius is strictly below the first-apex radius;
2. `false_of_actualFreshBlocker_contains_interiorPair_of_radius_ge`: the
   double-hit branch with row radius at least the first-apex radius is false;
3. `actualFreshBlocker_doubleHit_sourceConsequences`: in the remaining
   double-hit child, the blocker center lies in the strict first cap, the row
   radius drops strictly, and the row's intersection with the whole first cap
   is exactly the original source pair;
4. `actualFreshBlocker_doubleHit_twoOutside`: once the fresh source's omission
   from the original first-apex row is supplied, the exact fresh row can be
   named as `{q, w, fresh, t}`, with both `fresh` and `t` outside the first cap
   and with the strict radius drop retained;
5. `actualFreshBlocker_omission_or_twoOutside`: the source-clean trichotomy
   needed by the physical caller—omit `q`, omit `w`, or enter that named
   low-radius two-outside configuration;
6. `actualFreshBlocker_doubleHit_otherCapPlacement`: both exterior points in
   the double-hit child lie in the union of the surplus cap and the second
   opposite cap.  This is the first explicit bridge from the small fresh row
   to the other Moser caps;
7. `FirstApexInteriorPairCirclePower.dist_firstApex_lt_of_interiorPair_circlePoint_outsideCap`:
   a carrier point on the bisector-center circle through the selected
   interior pair, but outside the first cap, has first-apex distance strictly
   below the original selected radius; and
8. `actualFreshBlocker_doubleHit_twoOutside_firstApexDistanceDrop`: in the
   named double-hit child, both `fresh` and the fourth point `t` satisfy that
   strict first-apex distance drop, in addition to the blocker-row radius
   drop.

The circle-power bridge is proved coordinate-free.  The two circle centers
lie on the chord's perpendicular bisector; strict ordered-cap placement puts
the interior blocker center opposite the two exterior carrier points; the
two-dimensional orientation Gram identity then makes the relevant inner
product negative, and a norm-square expansion gives the distance inequality.

Lean LSP elaborated the complete current file without diagnostics.  Literal
verification of the trichotomy and other-cap placement reported only
`propext`, `Classical.choice`, and `Quot.sound`, with no source-scan warnings.
A governed focused build through the named two-outside trichotomy completed
successfully (`8102/8102`).  Its best-effort proof-blueprint resync then hit
the pre-existing stale private
`B1CardSixRoleProjectionIngress.ambientRoleIndex_injective` index entry; this
occurred after the Lean build had succeeded and is not evidence against this
module.

## Remaining physical cases

This does not close the physical residual.  The source must next expose the
fresh source's actual critical shell and split its incidence with the original
pair.  The high-radius double-hit branch is now closed.  Remaining cases are:

- at least one original source is omitted by the actual fresh row; or
- both occur, but the fresh row has strictly smaller radius and the now-named
  support `{q, w, fresh, t}`, whose latter two points are outside the first
  cap and strictly inside the original first-apex circle.

The old `normalForm.blockerClass` is not a substitute for the fresh source's
actual blocker row: its hypotheses force only the retained point in the
first/blocker intersection, and provide no cross-center radius lower bound.
