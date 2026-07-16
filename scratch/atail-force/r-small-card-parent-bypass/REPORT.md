# R small-card parent bypass report

Status: kernel-checked scratch parent bypass.  No production theorem or
protected unique-row theorem is claimed closed.

Target:

```text
D.A.card <= 13
  -> original FA-UNIQ4/5
     or swapped FA-UNIQ4
     or swapped FA-UNIQ5
```

This is a parent-level route correction.  It bypasses the coherent
common-deletion `R` lane whenever one of the two non-surplus caps is forced
to have cardinality four or five.  It does not prove any protected unique-row
arm.

Inputs reused:

- `card_le_thirteen_has_opposite_cap_card_four_or_five`;
- `firstApexSplit_unique_of_small_opposite_cap`;
- the fixed-surplus non-surplus swap;
- `SwappedFirstApexUniqueFourFrontier`;
- `SwappedFirstApexUniqueFiveFrontier`.

No anonymous finite shadow or selected-support metric inference is used.

Checked declarations:

- `secondSmallCap_reorients_to_swappedUnique`;
- `smallCarrier_routes_to_protectedFrontier`;
- `SmallCardProtectedFrontierEliminator.eliminate`.

The first theorem performs the fixed-surplus non-surplus swap, extracts a
fresh `CriticalPairFrontier`, and uses cap-four/five radius rigidity to
construct either:

- `SwappedFirstApexUniqueFourFrontier`; or
- `SwappedFirstApexUniqueFiveFrontier`.

The parent theorem combines this with
`card_le_thirteen_has_opposite_cap_card_four_or_five`.  If the original first
cap is small it returns `OriginalUniqueRadiusArm`; if the second cap is small
it returns one of the two swapped frontiers.  Therefore no origin-tagged
common-deletion handler is needed through card thirteen.

Focused validation from `lean/`:

```bash
env LEAN_PATH="/private/tmp/p97-r-small-card-parent-bypass-oleans:/private/tmp/p97-r-f1-f3-handler-oleans:/private/tmp/p97-r-two-off-live-handler-oleans:/private/tmp/p97-r-f2-second-apex-radius-transport-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-three-row-metric-oleans:/private/tmp/p97-r-origin-tagged-coordinator-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-root-failure-parent-lift:/private/tmp/p97-r-failure-parent-lift-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-r-reciprocal-swap-reduction-oleans:/private/tmp/p97-r-collapse-lean427-current-pb2jam3_:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-joint-transition-oleans" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-small-card-parent-bypass-oleans/SmallCardParentBypass.olean \
  ../scratch/atail-force/r-small-card-parent-bypass/SmallCardParentBypass.lean
```

Result: exit 0.  All three printed declarations depend only on:

- `propext`;
- `Classical.choice`;
- `Quot.sound`.

No printed declaration reaches `sorryAx`.
