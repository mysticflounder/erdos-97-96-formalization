# Robust two-radius center localization

Date: 2026-07-16

Status: **KERNEL-CHECKED THREE-ARM NORMAL FORM; NO TERMINAL ARM CLOSED.**

## Checked result

`RobustTwoRadiusCenterLocalization.lean` applies global cardinal minimality
to two chosen members of

```lean
firstRow.support ∩ S.capInteriorByIndex S.oppIndex2
```

whose existence follows from the checked second-apex cap counting theorem.
The coordinator

```lean
exists_strictPair_minimalDeletionNormalForm
```

returns exactly one of three source-valid endpoints:

1. `StrictPairCollisionIntervalEndpoint`;
2. `StrictPairCommonDeletionEndpoint`; or
3. `StrictPairUnequalCoreEndpoint`.

No `sorry`, `admit`, axiom, native computation, or heartbeat override is
used.

## Why the prescribed deletion set has two points

The predecessor theorem

```lean
exists_secondApexRow_minimalDeletionTransition
```

deletes all four points of `firstRow.support`.  Its collision pair can
therefore use either of the two support slots outside strict `oppCap2`.
That theorem cannot honestly imply a `StrictSecondCapInterval` for every
collision.

The present coordinator reuses its checked minimal-deletion machinery and
the strengthened equal-pair cardinality lemma, but applies minimality to a
chosen two-point strict-cap subset.  This is the smallest source-level
strengthening that makes the advertised three-arm normal form true.

The support-disjoint physical row is still used essentially: it proves the
fresh blocking center is not `S.oppApex2` after deleting an arbitrary
nonempty subset of the chosen pair.

## Exact endpoints

### 1. Equal-radius collision

The deleted set contains two distinct strict `oppCap2` points with equal
fresh-center radius.  Because the same pair is equidistant from the
physical second apex, the checked cap-center uniqueness argument forces the
fresh center into the same strict cap.  The one-sided cap-distance theorem
then supplies an ordered-cap packet in which the fresh center lies strictly
between the two sources.

Restoring one source also forces a five-point ambient radius class, hence
the fresh center is fully deletion-robust.  Deleting either source preserves
K4 at the physical second apex.

This is **local interval localization only**.  The checked
`ranked-common-deletion-transition/DirectedCycleCountermodel` shows that
strict betweenness at each independently chosen edge permits a three-cycle.
No rank decrease, nested interval, or nonreturn theorem is claimed here.

### 2. Singleton core

For a singleton minimal-deletion core, a support point of the physical row
outside the fresh exact shell exists because selected four-classes at two
distinct centers overlap in at most two points.  Deleting that point
preserves K4 at both the fresh center and `S.oppApex2`, producing an exact

```lean
CommonDeletionTwoCenterPacket D H deleted center S.oppApex2
```

This is a positive common-deletion producer, not `False`.  The current
uniform continuation can return another fully robust center, so the arm can
loop unless a separate well-founded invariant is proved.

### 3. Unequal-radius two-source core

The only remaining nontrivial core has exactly two sources, both in the
chosen strict physical row pair, and their fresh-center radii are unequal.
It supplies:

- a `MinimalDeletionCore` with two support-disjoint exact critical shells;
- full deletion robustness at the fresh center;
- physical-second-apex survival after deleting either core source; and
- `FreshSecondApexCorePacking`, namely either
  - the center lies in a strict cap with
    `2 * deleted.card ≤ (D.A \ cap).card`, or
  - the center is a nonphysical Moser vertex opposite a cap of cardinality
    at least six.

There is no common fresh-center radius in this arm, so the pair-bisector and
strict-between argument does not apply.  The packing split is a finite
location normal form, not a descent theorem.

## Theorem-bank preflight

Before deriving the local geometry, the required Problem 97 bank registries
and indexed Lean corpus were checked.  The useful existing ingredients were:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `BiapexContinuationGridScratch.secondApex_support_strictInterior_card_ge_two`;
- `SelectedFourClass.inter_card_le_two`;
- `nonempty_commonDeletionTwoCenterPacket`;
- `five_le_selectedClass_of_minimalDeletion_equal_pair`; and
- the existing ordered-cap one-sided distance injectivity theorem.

`SurplusCOMPGBank.btw_sep` was also inspected.  It can express cyclic
separation for a fixed bisected pair, but it does not turn independently
chosen local intervals into a well-founded sequence, so it is not used to
claim descent here.  No banked direct-`False` consumer was found for the
singleton loop or unequal-radius two-source core.

## Relationship to the stopped broad lane

The stopped `robust-second-apex-minimal-deletion` lane is a valid,
kernel-checked broad six-role trichotomy and has already supplied the useful
production `hmin` threading.  It closes no terminal arm.  Reopening it would
duplicate the present route; this checkpoint instead narrows the deletion
set enough to localize the equal-radius collision and isolates the exact
unequal-radius residual.

## Validation

The owned scratch file was compiled directly with the project-pinned Lean
4.27 toolchain against the checked predecessor oleans.  The focused command
exited zero and emitted:

```text
/private/tmp/p97-two-radius-center-localization-427/
  RobustTwoRadiusCenterLocalization.olean
```

The printed axiom closure of all public theorem checkpoints is exactly:

```text
propext, Classical.choice, Quot.sound
```

No full project build was run.  No production file, closure document,
proof-blueprint state, protected scratch lane, or stopped-lane file was
modified.  This checkpoint does not close a production `sorry`.
