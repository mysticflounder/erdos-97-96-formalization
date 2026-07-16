# F2 support-heavy reduction

## Scope

This scratch lane analyzes the support-heavy strict-cell arm of the exact
`TwoLiveExactCoverSecondApexProfile`:

```text
2 ≤ card (
  supportOnlyCell C.B₂ live (deletedCriticalSupport C)
    ∩ strictSecondCap S).
```

It uses the retained `LiveDangerousRetainingSystem W`, the actual
common-deletion packet `C`, and the actual selected critical shell at
`deleted`.  No production file, closure document, protected file, or
proof-blueprint state was changed.

## Theorem-bank preflight

Before adding a new cap or incidence argument, I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for support-only strict-cap
  witnesses, deleted-source blockers, selected critical shells, and exact
  cap-intersection bounds.

The closest existing results do not close this arm:

- `selectedFourClass_inter_capByIndex_card_le_two` gives the sharp upper bound
  used below.
- `oppCap2_escape_gen` requires its two equal-radius centers to be the named
  opposite apices.  Here one center is the actual deleted-source blocker, so
  substituting it for an apex would invent a role.
- The `IsM44` one-hit and squeeze theorems are unavailable on the current
  no-M44 parent surface.
- The global source-selection dichotomy concerns an already constructed
  `SurvivingContinuationRow`; the present F2 packet does not by itself supply
  that additional continuation provenance.

No banked theorem supplies a contradiction or an at-most-one bound for the
actual deleted critical shell in `oppCap2`.

## Kernel-checked support-heavy result

The file `F2SupportHeavyReduction.lean` proves the following.

### 1. Source-faithful outside-pair placement

`twoLiveExactCover_two_supportStrict_forces_deletedBlocker_off_adjacentCaps`
names two distinct support-heavy witnesses `x,w`.  Their roles are exact:

```text
x,w ∈ C.B₂
x,w ∈ deletedCriticalSupport C
x,w ∈ strictSecondCap S.
```

Therefore:

- `C.row₂` gives
  `dist S.oppApex2 x = dist S.oppApex2 w`;
- the retained selected shell
  `W.H.selectedAt deleted C.q_mem_A` gives equal distances from
  `W.H.centerAt deleted C.q_mem_A`; and
- `C.actual_blocker_ne_center₂` proves those two centers are distinct.

Applying `false_of_sameCap_outsidePair_twoCenters` separately to the surplus
cap and `oppCap1` proves:

```text
W.H.centerAt deleted C.q_mem_A ∉ S.surplusCap
W.H.centerAt deleted C.q_mem_A ∉ S.oppCap1.
```

No replacement shell, packet substitution, or anonymous audit class occurs.

### 2. Deleted-source blocker in strict `oppCap2`

The selected critical shell proves its center belongs to `D.A`.  Exact
three-cap coverage, reused from the live-heavy placement audit, then yields:

```text
W.H.centerAt deleted C.q_mem_A ∈ strictSecondCap S.
```

This is theorem
`twoLiveExactCover_two_supportStrict_forces_deletedBlocker_mem_strictSecondCap`.

### 3. Exact critical-shell saturation

The support-heavy points give a lower bound of two for:

```text
deletedCriticalSupport C ∩ S.oppCap2.
```

Because the actual deleted-source blocker is in `oppCap2`,
`selectedFourClass_inter_capByIndex_card_le_two` gives the matching upper
bound.  Hence
`twoLiveExactCover_two_supportStrict_saturates_deletedSupport_oppCap2` proves:

```text
card (deletedCriticalSupport C ∩ S.oppCap2) = 2.
```

The existing cap-incidence theorem is therefore saturated, not violated.

### 4. Exact support-heavy packet

`twoLiveExactCover_to_supportHeavyReduction` packages:

```text
card supportStrict = 2
deleted blocker outside surplusCap and oppCap1
deleted blocker in strictSecondCap
card (deletedCriticalSupport C ∩ oppCap2) = 2.
```

The equality `card supportStrict = 2` uses the exact F2 fact that the entire
support-only cell has cardinality two.

## Mixed one-live/one-support boundary

`F2MixedOneLiveOneSupportBoundary` records only:

```text
card liveStrict = 1
card supportStrict = 1.
```

`twoLiveExactCover_to_mixedBoundary_of_not_heavy` proves this packet whenever
neither heavy inequality holds, directly from the profile's checked
trichotomy.

`F2MixedOneLiveOneSupportBoundary.exists_distinct_witnesses` names the two
strict witnesses and proves they are distinct because the first is live-only
and the second is support-only.  It does not assign either point a blocker,
audit-center, q-critical, terminal, or apex role.  With only one point on each
outer row, the two-point same-cap argument used by the heavy arms is not
available.

## Epistemic status

Proven:

- support-heavy localization of the actual deleted-source blocker;
- exact two-hit saturation of its retained selected critical shell in
  `oppCap2`;
- exact one-live/one-support description of the residual mixed arm.

Not proven:

- that the support-heavy arm is contradictory;
- an at-most-one bound for
  `deletedCriticalSupport C ∩ S.oppCap2`;
- exclusion of the deleted-source blocker from `oppCap2`; or
- any additional U5 or terminal role for the mixed witnesses.

Thus this lane does not close a production `sorry`.  A direct closure theorem
would need genuinely stronger parent/continuation information, for example:

```text
card (deletedCriticalSupport C ∩ S.oppCap2) ≤ 1
```

or

```text
W.H.centerAt deleted C.q_mem_A ∉ S.oppCap2.
```

Either would contradict the checked support-heavy reduction, but neither is
currently available.

## Validation

The repository pins:

```text
leanprover/lean4:v4.27.0
```

and the validation environment reported:

```text
Lean 4.27.0, arm64-apple-darwin24.6.0
commit db93fe1608548721853390a10cd40580fe7d22ae
```

The deliberate single-file check was:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:$BASE_LEAN_PATH" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-supportheavy-reduction-oleans/F2SupportHeavyReduction.olean \
  ../scratch/atail-force/r-f2-supportheavy-reduction/F2SupportHeavyReduction.lean
```

It exited successfully.  Every printed theorem depends only on:

```text
propext
Classical.choice
Quot.sound
```

None depends on `sorryAx`.  No full `lake-build` was run.
