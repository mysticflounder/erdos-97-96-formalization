# Reciprocal directed-cross theorem-bank audit

Date: 2026-07-16

Scope:

- `CoherentRCommonDeletionPacket.ReciprocalDirectedCrossResidual`;
- `r-full-parent-entry/ReciprocalDirectedCrossGlobalBoundary.lean`;
- the theorem-bank registries required by `AGENTS.md`;
- indexed Lean-corpus searches for support/fixed-class and hit/residual
  consumers.

This audit is branch-local. It does not touch `SurplusM44`, the unique-row
producer, `SevenPointTwinFourCircleCollision`, docs, or proof-blueprint state.

## Result

There is no honest existing theorem-bank consumer that derives `False` from
`ReciprocalDirectedCrossResidual` or from
`exists_fresh_commonDeletion_or_secondApexCritical` as currently stated.

The global-boundary theorem is nevertheless sharp:

1. it proves
   `fixedClass ∩ reciprocalDeletedRow.support = {deleted, source}`;
2. therefore the off-fixed residual has cardinality exactly two;
3. one residual point `z` lies outside the source row;
4. deletion of `z` preserves the exact unique source row at `firstCenter`;
5. at `oppApex2`, deletion of `z` either survives, giving a
   `CommonDeletionTwoCenterPacket`, or is critical and the prescribed
   critical support equals `R.secondApexRow.support`.

Neither endpoint is terminal in the current bank.

## Exact theorem-bank field map

### Circle and row-incidence banks

The applicable generic consumers are:

- `SelectedFourClass.inter_card_le_two`;
- `U5QDeletedK4Class.inter_card_le_two`;
- `U5QAllowedK4Class.inter_dangerous_p_circle_card_le_two`;
- `two_circle_third_point_eq`;
- `two_circle_noncollinear_common_point_elim`;
- `u5_common_bisector_triple_incompatibility`;
- `u2_sharedBase_family_contradiction`.

Polarity:

- the reciprocal packet already saturates the two-circle bound with the
  exact pair `{deleted, source}`;
- the third-point and common-bisector consumers require a third common point,
  which the proved exact intersection excludes;
- no field supplies a three-point dangerous-base subset in the reciprocal
  row.

Therefore these banks explain the residual cardinality but do not contradict
it.

### U2 cap-hit banks

The one-hit theorems sharpen the strict-cap split already recorded in
`TerminalCapSplit.lean`. They yield either the same-cap packet or the ordered
cross-cap packet, not `False`.

### U5/M44 and endpoint banks

- U5 residual-payload closures require positive `D.IsM44`; this has the wrong
  polarity under the live `hNoM44` route.
- `N8e_own_mid_residual_false` requires the endpoint shell, N4e containment,
  and two adjacent strict-cap hits. Those fields are not present.
- The metric-point bank kernels require several rows on one shared radius.
  The reciprocal packet exposes four unrelated radii and provides no equality
  aligning them.

### Signed-area field

`directedCross_signedArea_product_neg` is the expected crossing-chord sign.
No indexed theorem derives the opposite sign from the retained cap/MEC
fields. It is informative geometry, not presently a contradiction.

## Critical second-apex arm

The apex-alignment scratch bank already proves the analogous consumer for a
`CrossSurvivalApexPacket`:

- `deletedApexOmission_iff_distinctApexRadiusClass`;
- `false_of_deletedApexCriticalCertificate_and_distinctApexRadiusClass`.

The reciprocal residual is not that packet, so importing the result does not
give an honest field map. The small direct connector in
`ReciprocalSecondApexRadiusConsumer.lean` proves:

```lean
criticalRadius_unique_of_blocked
```

and its reciprocal specialization:

```lean
false_of_secondApexCritical_and_distinctFourCapableRadius
```

Thus the exact missing antecedent for the critical arm is:

```lean
∃ tau : ℝ,
  0 < tau ∧
  4 ≤ (SelectedClass D.A S.oppApex2 tau).card ∧
  tau ≠ R.secondApexRow.radius
```

Equivalently, it is any selected four-row at `S.oppApex2` whose support omits
the prescribed deleted point `z`. The support equality already retained in
the branch is not new information: it identifies the prescribed critical
shell with `R.secondApexRow`.

## Common-deletion arm

`CommonDeletionTwoCenterPacket` still needs either:

- a well-founded progress/termination theorem for its successor expansion;
  or
- an aligned critical-pair consumer that uses the full parent geometry.

No bank theorem consumes the generic common-deletion packet by itself.

## Epistemic status

- **PROVEN:** exact fixed-class intersection; residual cardinality two; fresh
  source-row omission; exact/unique first-center row after two deletions;
  critical-shell support equality; and uniqueness of the critical
  second-apex four-capable radius.
- **PROVEN NEGATIVE:** no direct banked `False` consumer matches the current
  reciprocal fields; the nearest circle, U2, U5/M44, endpoint, and metric
  consumers have the polarity or antecedent mismatches listed above.
- **OPEN:** produce a distinct four-capable second-apex radius in the critical
  arm, and close the alternative common-deletion arm.

This connector closes no `sorry` by itself. It gives the exact producer target
for one side of the branch and prevents further mining of already-saturated
support/fixed-class or hit/residual objects.
