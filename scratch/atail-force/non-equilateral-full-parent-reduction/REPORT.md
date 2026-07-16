# Non-equilateral full-parent reduction

## Outcome

The full parent surface does not yet contradict the
`NonEquilateralOutput` arm.  It does, however, force a substantially sharper
and choice-order-correct packet than the earlier support-only result.

The key repair is to replace the existential rows in
`NonEquilateralOutput.commonDeletion` with the two native continuation rows.
Those rows are themselves exact rows after deleting the second apex, so they
define a canonical `CommonDeletionTwoCenterPacket`.  After rebasing that
packet to an arbitrary late-chosen favorable critical system, all of the
following facts refer to the same two supports:

- the surplus-heavy or exclusive-strict-witness support dichotomy;
- native overlap at most one;
- the common-deletion critical expansion and prescribed transitions;
- at least four native-row sources outside the deleted source's critical
  shell; and
- the exact `oppCap2` profile split described below.

Thus the useful next theorem is no longer a generic common-deletion producer:
the generic packet already existed, but it forgot which rows carried the
non-equilateral incidences.  The remaining proof must consume this canonical
native packet.

## Exact residual split

For each native row, the other continuation center is a known support point
inside `oppCap2`.  The general selected-row/cap counting theorem bounds that
intersection by two.  Since the row has four points, each row has exactly one
of these profiles:

```text
(outside oppCap2, inside oppCap2) = (2,2) or (3,1).
```

If either row has profile `(3,1)`, the union of the points outside `oppCap2`
has cardinality at least four: the other row contributes at least two and the
native overlap is at most one.  The deleted source's four-point critical
shell meets the native row union in at most three points.  Therefore one can
choose a native-row source that is simultaneously:

- outside `oppCap2`;
- outside the late critical shell;
- in the surplus cap or the strict `oppCap1` region; and
- equipped with the common-deletion consumer's prescribed transition.

The exact terminal split is consequently:

```text
both native rows have profile (2,2)
or
there is an outside-oppCap2 fresh prescribed transition.
```

Neither arm is currently contradictory.  This is a real reduction, not a
closure claim.

## Kernel-checked declarations

`NonEquilateralFullParentReduction.lean` proves:

- `NativeOppCap2Profile` and `nativeOppCap2Profile`;
- `nativeCommonDeletionPacket`, whose `B₁` and `B₂` are definitionally
  the two native row supports;
- `nativeCommonDeletionPacketAt`, rebasing that packet to any late critical
  system without changing its supports;
- `NativeCommonDeletionSupportDichotomy` and
  `nativeCommonDeletionSupportDichotomy`;
- `rows_union_inter_deletedCriticalSupport_card_le_three`;
- `four_le_rows_union_sdiff_deletedCriticalSupport_of_overlap_le_one`;
- `FourFreshCriticalSources` and its nonemptiness constructor;
- `NativeTwoByTwoOppCap2Profile`;
- `OutsideOppCap2FreshTransition` and
  `nativeTwoByTwo_or_outsideOppCap2FreshTransition`;
- `NonEquilateralNativeCriticalExpansion` and its nonemptiness constructor;
- `RoutedContinuationWithNativeNonEquilateralExpansion`; and
- `fullParent_nativeNonEquilateralRoutedReduction`.

The last theorem consumes the full checked parent data in the canonical
order.  The no-`IsM44` hypothesis produces the genuine second large cap;
global K4 plus no removability produces a late critical system; and the
frontier supplies the H-independent continuation geometry.  These outputs
coexist, but the current bank has no theorem coupling the second large cap to
the native critical-expansion packet.

## Bank preflight

The required registries and focused nthdegree searches were checked before
deriving this packet:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused searches covered non-equilateral support dichotomies, exclusive
strict-cap witnesses, common-deletion two-center consumers, and the favorable
late-system surface.  The nearest reusable results were the general cap-row
intersection bound, critical-shell source expansion, and the existing
common-deletion consumer.  No indexed theorem eliminates either exact
residual arm above.  The stronger surplus-cap exact-count theorem requires
`IsM44` and is unavailable in this no-`IsM44` branch; the existing
non-`IsM44` removable-vertex theorem is transitively downstream of the live
K-A-PAIR obligation and would be circular here.

## Regression boundary

The exact rational regression from the parent-producer lane still passes:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/non-equilateral-parent-producer/verify_cap_profile_regression.py
```

It realizes the local equal-radius rows and a structural `(5,5,4)` cap profile,
including row overlap zero and a set-theoretically surplus-heavy row.  It does
**not** realize the native continuation packet: its row centers `z1,z2` are
endpoints of `oppCap2`, while the strict `oppCap2` points are `kL,kR`.  It also
does not validate MEC promotion, global K4, a total critical system, no
removability, or the live telescope.  It therefore guards only against local
deductions that ignore the strict-center placement; it does not refute a
native or full-parent coupling theorem.

## Validation

From `lean/`:

```bash
LEAN_PATH=/tmp/p97-joint-transition-oleans:/tmp/p97-mixed-parent-coupling \
  lake env lean \
  -R ../scratch/atail-force/non-equilateral-full-parent-reduction \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/NonEquilateralFullParentReduction.olean \
  ../scratch/atail-force/non-equilateral-full-parent-reduction/NonEquilateralFullParentReduction.lean
```

The direct check succeeds.  Every printed declaration depends only on:

```text
[propext, Classical.choice, Quot.sound]
```

A hygiene scan finds no `sorry`, `admit`, `axiom`, or `native_decide` in this
lane.
