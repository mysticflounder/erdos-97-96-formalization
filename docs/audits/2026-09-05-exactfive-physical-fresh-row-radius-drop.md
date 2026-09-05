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
   low-radius two-outside configuration.

Lean LSP elaborated the complete file without diagnostics.  A literal theorem
verification of the strongest consequence reported only `propext`,
`Classical.choice`, and `Quot.sound`, with no source-scan warnings.
The governed focused build completed successfully (`8102/8102`).  Its
best-effort proof-blueprint resync then hit the pre-existing stale private
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
  cap.

The old `normalForm.blockerClass` is not a substitute for the fresh source's
actual blocker row: its hypotheses force only the retained point in the
first/blocker intersection, and provide no cross-center radius lower bound.
