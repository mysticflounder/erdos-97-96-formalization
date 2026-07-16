# R failure profiles: full-parent lift

## Scope

This scratch lane specializes
`TwoOffLiveFailureClassification.lean` to the actual retained live dangerous
row and to a common-deletion second center at the second opposite apex of the
full-parent surplus packet.

No production file, closure document, or proof-blueprint state was changed.

## Theorem-bank preflight

Before proving new incidence facts, I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for common deletion,
  exact `2+2` cover, dangerous-row support, same-side terminal packets,
  q-critical U5 classes, and cap placement.

The closest banked consumers are not role-faithful on this surface:

- the same-side terminal families require an already named terminal packet,
  audit center, cap labels, and U5 audit support;
- the q-critical triple consumer requires a q-critical class at a named center
  containing two named dangerous triple points; and
- the `IsM44` bank is unavailable under the parent hypothesis `¬ IsM44`.

In the present F2 packet, `C.B₂` is the exact row after deleting the fresh
source `deleted`; it is not a q-critical class for the original live source
`q`.  Conversely, `deletedCriticalSupport C` is the selected critical support
of `deleted`, and the new theorem below shows that in F2 it contains at most
one live-dangerous point.  Therefore it cannot honestly be passed to a
two-dangerous-point U5 consumer.

## Kernel-checked output

The file `FailureProfilesParentLift.lean` proves:

1. `CommonDeletionTwoCenterPacket.secondRowSelectedFourClass`

   The exact q-deleted second row is an ambient `SelectedFourClass`.

2. `TwoLiveExactCoverFailureProfile.support_inter_live_card_le_one`
   and the analogous F1 theorem

   In F1 or F2,

   ```text
   card (deletedCriticalSupport C ∩ liveBase) ≤ 1.
   ```

   The reason is exact: `support \ C.B₂` has two points and contains
   `deleted`; `deleted` is not live; and the F1/F2 `bothCell` is empty.

3. `deletedCriticalSupport_inter_live_card_le_two`

   For every actual live-row common-deletion packet, including F3,

   ```text
   card (deletedCriticalSupport C ∩ liveBase) ≤ 2.
   ```

4. `secondApexRow_to_capProfile`

   For the actual parent packet `S`, not merely `D.packet`, the second row has
   at least two points in

   ```text
   strictSecondCap S = S.oppCap2 \ (S.surplusCap ∪ S.oppCap1).
   ```

   Global K4 supplies a selected four-class centered at every such point.
   The proof repackets the unchanged carrier, convexity, and K4 data around
   the actual `S`; it does not silently identify `S` with `D.packet`.

5. `twoLiveExactCover_to_secondApexProfile`

   F2 is exactly

   ```text
   C.B₂ = liveOnlyCell ∪ supportOnlyCell
   card liveOnlyCell = 2
   card supportOnlyCell = 2
   ```

   with empty overlap.  Intersecting with `strictSecondCap S`, whose row
   intersection has size at least two, leaves exactly the useful distribution
   trichotomy:

   ```text
   at least two strict live-only points
   or at least two strict support-only points
   or exactly one strict point of each kind.
   ```

6. `liveSecondApex_failure_refinement`

   This is the actual retained-live specialization of the complete F1/F2/F3
   classification.  Every branch receives the parent cap profile; F1 and F2
   receive the sharp one-live critical-support bound; F3 receives the
   dangerous-circle at-most-two bound.

7. `twoLiveExactCover_two_liveStrict_forces_p_off_adjacentCaps`

   If the F2 strict region contains two live-only row points, the existing
   ordered-cap same-cap consumer applies source-faithfully.  It proves

   ```text
   p ∉ S.surplusCap ∧ p ∉ S.oppCap1.
   ```

   Both points are genuinely on the live row about `p`, genuinely on `C.B₂`
   about `S.oppApex2`, and genuinely outside each adjacent cap.  No audit or
   terminal role is invented.

8. `liveSource_not_mem_strictSecondCap`

   The parent field `q ∈ S.surplusCap` proves the original live source is not
   a strict second-cap point.

All printed declarations depend only on `propext`, `Classical.choice`, and
`Quot.sound`; none depends on `sorryAx`.

## What the full-parent fields add

| Parent surface | Exact contribution here |
| --- | --- |
| retained dangerous system `W` | exact first live row, `deleted ∉ liveBase`, live-row equal-radius equations, and the selected blocker map |
| `S` plus cap geometry | at least two second-row points in strict `oppCap2` |
| `D.K4` | a selected four-class at every strict second-row point |
| `D.convex` plus ordered-cap uniqueness | two strict live-only points exclude `p` from both caps containing `oppApex2` |
| `q ∈ S.surplusCap` | excludes `q` from the strict region |
| MEC non-obtuse construction, second-large-cap witness, `q ∉ M.verts`, `¬ IsM44`, and no-removability | no additional constraint on the anonymous F1/F2/F3 cells is exposed by the current theorem inventory |

The last row is important: those fields remain available in the full parent,
but there is currently no source-faithful theorem connecting them to a named
point of `C.B₂` or `deletedCriticalSupport C`.

## First missing theorem

For the live-heavy F2 arm, the first missing placement statement is:

```text
under the full parent and the F2 live-strict hypothesis,
p ∈ S.surplusCap ∪ S.oppCap1.
```

That statement immediately contradicts the kernel-checked conclusion that
`p` lies in neither adjacent cap.

The support-heavy and mixed F2 arms need a different producer: a theorem that
identifies the strict support-only point or points with the named source,
center, cap, and critical-class roles required by an existing U5/terminal
consumer.  Pure cardinality is insufficient.

Thus this lane does not itself close a production `sorry`.  It reduces the
priority F2 failure to one explicit placement theorem plus two precisely
described named-role branches, and it rules out the tempting but invalid
q-critical-class adapter.

## Validation

The two additional scratch prerequisites were compiled first:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:$BASE_LEAN_PATH" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-failure-parent-lift-oleans/GlobalCriticalContinuation.olean \
  ../scratch/atail-force/global-critical-continuation/GlobalCriticalContinuation.lean

env LEAN_PATH="/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:$BASE_LEAN_PATH" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-failure-parent-lift-oleans/same_cap_second_center.olean \
  ../scratch/atail-force/same_cap_second_center.lean
```

The final deliberate scratch check was:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:$BASE_LEAN_PATH" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-failure-parent-lift-oleans/FailureProfilesParentLift.olean \
  ../scratch/atail-force/r-failure-profiles-parent-lift/FailureProfilesParentLift.lean
```

It exited successfully.  No full `lake-build` was run.
