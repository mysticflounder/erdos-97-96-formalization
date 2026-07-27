# Equality-arm consumer audit

Scope: the arm

```lean
hc : H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁
```

of
`exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`.
No production source was changed.

## Result

No imported, source-clean theorem currently contradicts `hc`.

Write

```text
c := H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁
e := H.centerAt Pρ.source₁ Pρ.source₁_mem_A
```

Then `hblockersNe` says `e ≠ c`.  Thus `hc` makes the first collision
row's blocker a source of the second collision row; it does **not** identify
the two row centers.

This is compatible with all supplied packets:

- the `P` shell is centered at `c`, contains `P.source₁,P.source₂`, and does
  not contain its center `c`;
- the `Pρ` shell is centered at `e`, contains
  `c = Pρ.source₁,Pρ.source₂`, and `e ≠ c`;
- after rewriting `hLPρ`, `LPρ.packet` deletes `q=c` and has its second
  auxiliary center equal to `c`.  `CommonDeletionTwoCenterPacket` does not
  require `q ≠ center₂`; its required
  `actual_blocker_ne_center₂` is precisely `e ≠ c`;
- `qDeletedRow_at_actualBlocker_eq_canonicalSupport` identifies
  `LPρ.packet.B₂` with the canonical `P` shell.  Since that row is
  `q`-deleted, its omission of `c` agrees with `c` being the center of the
  `P` shell;
- `MPρ` supplies a `P` collision source omitted from the row at
  `c=Pρ.source₁`, and supplies `c` omitted from the common `P` shell.
  `MP` similarly supplies `P.source₁` omitted from the common `Pρ` shell.
  These are omissions, not the positive common-pair incidences needed by
  the checked convex terminals.

The unique-four cover is also compatible: it gives `c ≠ P.source₁` and
`e ≠ c`, and identifies each selected support with the unique four-class at
its own blocker.  It does not say that a point cannot be a center of one row
and a source of another row.

## Checked imported consumers

All declarations below are available after importing
`Erdos9796Proof.P97.ATail.FrontierLiveClosure`.  `lean_verify` reports only
`propext`, `Classical.choice`, and `Quot.sound` for each (no `sorryAx`).

### 1. Closest consumer

```lean
Problem97.ATailRetainedCollisionCapLocalization.
  false_of_distinct_actualRow_contains_collisionSources
    (Q : RetainedRadiusCollision)
    (hsource : source ∈ D.A)
    (hcenter_ne :
      H.centerAt source hsource ≠
        H.centerAt Q.fiber.source₁.1 Q.fiber.source₁.2)
    (hsource₁ :
      Q.fiber.source₁.1 ∈ (H.selectedAt source hsource).support)
    (hsource₂ :
      Q.fiber.source₂.1 ∈ (H.selectedAt source hsource).support) :
    False
```

This is the direct perpendicular-bisector rigidity terminal.

- With `Q=P` and `source=c=Pρ.source₁`, `hcenter_ne` is `e ≠ c`.
  The first missing premise is that **both** `P.source₁` and `P.source₂`
  lie in the `Pρ` shell.  In fact `MP` already gives
  `P.source₁ ∉ Pρ.shell`.
- With `Q=Pρ` and `source=P.source₁`, the first missing premise is that
  both `c=Pρ.source₁` and `Pρ.source₂` lie in the `P` shell.  In fact
  `c ∉ P.shell` follows from the shell's center exclusion (and is also
  supplied by the localized omission cycle).

The necessary adapter from `RetainedInteriorBlockerCollision` to
`RetainedRadiusCollision` is mechanical and already exists privately in
`LocalizedCollisionMutualOmissionCycle.lean`; the obstruction is the
positive memberships, not packaging.

### 2. Mutual-cross-membership center rigidity

```lean
Problem97.ATailFrontierLiveClosure.
  blocker_centers_eq_of_secondRadius_mutual_cross_membership
    (R : FrontierCommonDeletionParentResidual F)
    (hxA : x ∈ D.A) (hyA : y ∈ D.A) (hxy : x ≠ y)
    (hxRadius : x ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hyRadius : y ∈ SelectedClass D.A S.oppApex1 commonRadius)
    (hyx : y ∈ (H.selectedAt x hxA).support)
    (hxy' : x ∈ (H.selectedAt y hyA).support) :
    H.centerAt x hxA = H.centerAt y hyA
```

For `x=P.source₁`, `y=c=Pρ.source₁`, the first missing premise is a
single `commonRadius` containing both sources: the live data places them on
the distinct radii `radius` and `ρ`, with `hρne : ρ ≠ radius`.
Moreover both mutual membership premises are explicitly false by the
localized omission data.  Hence this theorem cannot combine with
`hblockersNe`.

### 3. Exact-four two-deletion blocker cycle

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_exactFour_twoDeletion_blockerTwoCycle
    (first second : ExactFourMutualOmissionJointDeletion R rho u v)
    (hdeletedNe : first.deleted ≠ second.deleted)
    (hdeletedBlockersNe : ...)
    (hfirstBlockerNeApex : ...)
    (hsecondBlockerNeApex : ...)
    (hfirstMemSecondRow : first.deleted.1 ∈ secondRow.support)
    (hsecondMemFirstRow : second.deleted.1 ∈ firstRow.support) :
    False
```

The first missing premise is the whole `OriginalUniqueFourResidual` /
`ExactFourMutualOmissionJointDeletion` interface; the live equality arm has
`FrontierCommonDeletionParentResidual` plus localized common-deletion
packets.  Even after a hypothetical adapter, the terminal requires positive
mutual membership, whereas the corresponding `P.source₁`/`c` memberships
are omitted.

### 4. Kalmanson shared-pair terminal

```lean
Problem97.CapCrossingKalmansonBridge.
  false_of_two_selected_rows_shared_late_pair
    ...
    (ARow BRow : SelectedFourClass carrier ...)
    (hic_mem_ARow : boundary ic ∈ ARow.support)
    (hid_mem_ARow : boundary id ∈ ARow.support)
    (hic_mem_BRow : boundary ic ∈ BRow.support)
    (hid_mem_BRow : boundary id ∈ BRow.support) :
    False
```

The first substantive missing premise is a pair of distinct points lying in
both rows (plus compatible cyclic order).  The exact cap intersections give
two disjoint in-cap pairs, and the hypotheses provide no positive shared
outside point.  Equality of one row center with a source of the other row
does not create a shared support point.

### 5. Third-center common-pair terminal

```lean
Problem97.ATailThirdCenterCommonPair.
  false_of_thirdActualCenter_selectedRow_contains_frontierPair
    (P : SurvivorPairRelocationPacket ...)
    (hwSupport : P.w ∈ (H.selectedAt P.q ...).support)
    ...
    (hqThird : P.q ∈ (H.selectedAt source ...).support)
    (hwThird : P.w ∈ (H.selectedAt source ...).support) :
    False
```

The first missing premise is a `SurvivorPairRelocationPacket` with its
directed cross hit `hwSupport`.  The equality arm has localized collision
cycles carrying omissions.  It does not provide a frontier pair contained
in a third actual row.

## Equality-shaped declarations that are not usable

The closest statement shapes in `FrontierLiveClosure.lean` are

```lean
false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted
false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV
```

but both are themselves proved by `sorry` and require the unrelated
`ExactFourRigid221PhysicalApexSourceEqUContext`.  They are not source-clean
consumers of the live arm.

## Bottleneck

The checked convex geometry only closes after producing positive incidence:
both collision sources in one distinct actual row, a mutual cross-membership
pair, or a common pair in two rows.  The equality arm instead produces the
compatible blocker-source chain

```text
P.source pair -- common blocker c = Pρ.source₁
Pρ.source pair -- common blocker e, with e ≠ c
```

together with exact in-cap disjointness and localized omissions.  No imported
theorem converts that chain, the LP/MP packets, or the unique-four cover into
the needed positive incidence or directly into `False`.  An equality-specific
closure therefore still has to use additional global cap/minimality/tri-apex
information; it is not present in the current theorem bank.
