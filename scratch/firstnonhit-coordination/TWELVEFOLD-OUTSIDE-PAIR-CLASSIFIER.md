FreshThird coordination update (Lean 4.27 direct check passed):

I stayed outside your `TwoSourceFreshThirdResidual.lean` normalization hunk and added one source-clean classifier at the end of `TriApexEndpointRetainedOmission.lean`:

`exists_distinct_outsideCap_fan_escape_or_crossDeletion`

Inputs: a selected four-row `Row`, its cap `i`, `center ∈ cap i`, at least two row points outside `cap i`, the full source-faithful deletion fan, and the no-center-blocker condition for every row point.

Output: two distinct outside points with both dependent deletion-fan packets retained, followed by exactly one of:

1. the first actual blocker center lies outside `cap i`;
2. the second actual blocker center lies outside `cap i`;
3. deleting the second point preserves a four-row at the first blocker center;
4. deleting the first point preserves a four-row at the second blocker center.

Proof shape: select the outside pair first; if both blockers are in the row cap, equal blockers contradict `false_of_selectedFourClass_common_actualCenter_pair_outside_cap`, while distinct blockers invoke `crossDeletion_survives_of_distinct_sameCap_blockers_outside_pair`.

This confirms the exact synchronization residual for your hunk: neither endpoint/fan interface forces the outside points' blocker centers back into `rowCap`; if you can eliminate the two blocker-cap escape arms, the existing cross-deletion outcomes become available without any guessed alignment.

Validation:

- `lake env lean -M16384 Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean` passed;
- `git diff --check` passed for the edited module;
- `#print axioms` reports exactly `propext`, `Classical.choice`, and `Quot.sound` (no `sorryAx`, compiler trust, or project axiom).

The shared `lake-build` wrapper was occupied by another build, so this checkpoint records direct one-file elaboration rather than a wrapper target build.

## Indexed fan adapter

The integration adapter now typechecks in
`lean/scratch/firstnonhit-outside-cap-indexed/IndexedOutsideCap.lean`.
It deliberately accepts the reusable field

```lean
hcenterNe : ∀ j, center ≠ F.blockerCenter j
```

rather than requiring the primitive `NoCenterBlockerWitness F`. This lets the
caller use either the primitive witness or the later normalized
`SourceFaithfulFanNoCenterBlockerRowWitness.center_ne_actualBlocker` field.
For a support point `w`, the proof takes `j := F.index ⟨w, hw⟩`, uses
`F.source_index_support` to identify the indexed source with `w`, and calls the
checked classifier above. Direct Lean 4.27 elaboration passed.

## Consumer audit

There is no existing direct consumer of the four-way output.

- Either blocker-center-outside-cap arm still needs a source-clean bridge from
  cap escape to the pinned endpoint's named-seed escape while retaining row
  identity.
- Either single cross-deletion-survival arm can construct one erased selected
  four-class, but the existing `CrossDeletionErasedRows` adapter needs both
  directions.

Therefore the exact next refinement is one of:

1. eliminate both blocker-cap escape arms and strengthen the surviving case to
   paired cross-deletion survival; or
2. transport a blocker-cap escape to the existing pinned seed-escape consumer.
