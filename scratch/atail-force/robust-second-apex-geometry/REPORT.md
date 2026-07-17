# Robust physical second-apex geometry audit

Date: 2026-07-16

Status: **KERNEL-CHECKED EXACT NORMAL FORM AND SMALL-CAP ROUTING. THE
CAP-AT-LEAST-SIX ENDPOINT IS NOT CLOSED. NO PRODUCTION `sorry` IS CLOSED.**

## Question

The input is the exact remaining endpoint of the physical-second-apex
common-deletion consumer:

```lean
FullyDeletionRobustAt D S.oppApex2
```

This says that every single carrier deletion leaves a four-point
equal-distance witness at the physical second Moser apex. The audit asked
whether existing theorem banks or the full cap/MEC geometry either contradict
this property directly or route it to protected swapped `FA-UNIQ4/5`.

## Required bank preflight

The audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the indexed Lean corpora with `nthdegree docs search --lean` queries for
  deletion-robust centers, critical deletions at a Moser apex, exact
  five-point radius classes, two disjoint four-point classes, cap one-hit
  bounds, and unique K4 radii.

The archive inventories contain the familiar one-hit and cap-membership
theorems but no declaration directly excluding the large-cap robust radius
alternatives. The closest current declarations are:

- `SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two`;
- `oppositeVertex_selectedClass_card_le_four_of_cap_card_eq_four`;
- `oppositeVertex_selectedClass_card_le_five_of_cap_card_eq_five`;
- `oppositeVertex_K4_radius_unique_of_cap_card_eq_five`;
- `oppositeVertex_distinct_K4_radii_force_cap_card_ge_six`;
- `secondSmallCap_reorients_to_swappedUnique`; and
- `FullyDeletionRobustAt.centerAt_ne`.

The last theorem only says that a fully robust center cannot be the selected
blocker center of any source in a fixed `CriticalShellSystem`. It does not
contradict global K4 or the existence of the critical system.

## Exact checked normal form

`RobustSecondApexGeometry.lean` proves the equivalence

```text
FullyDeletionRobustAt D S.oppApex2
  <->
one radius class at S.oppApex2 has cardinality at least five
  or
two distinct positive K4 radii occur at S.oppApex2,
with support-disjoint selected four-classes and oppCap2.card >= 6.
```

The forward implication is elementary but load-bearing:

1. choose any ambient K4 radius `r` at `S.oppApex2`;
2. if its full class has at least five members, take the first arm;
3. otherwise the class has exactly four members;
4. delete one member and apply full deletion robustness;
5. the surviving K4 radius cannot still be `r`, because only three members
   of the old class remain;
6. trim both distinct full classes to exact selected four-classes; and
7. apply the Moser-apex cap-capacity theorem to obtain
   `6 <= S.oppCap2.card`.

The reverse implication uses the already checked constructors:

- a class of cardinality at least five survives every single deletion; and
- among two support-disjoint selected four-classes, every deleted point misses
  at least one complete class.

Checked declarations:

- `fullyDeletionRobustAt_secondApex_radiusClassification`;
- `fullyDeletionRobustAt_secondApex_of_radiusClassification`; and
- `fullyDeletionRobustAt_secondApex_iff_radiusClassification`.

## Small-cap endpoints

The same file proves:

```text
oppCap2.card = 4
  -> not (FullyDeletionRobustAt D S.oppApex2)
```

and

```text
oppCap2.card = 5
  -> FullyDeletionRobustAt D S.oppApex2
  -> the unique K4 radius has ambient class cardinality exactly five
  -> Nonempty (SwappedFirstApexUniqueFiveFrontier D S H).
```

The cap-five handoff uses the existing fixed-surplus swap. Its possible
swapped unique-four result is ruled out by deleting one member of its exact
four-point class and using full robustness; uniqueness of the K4 radius then
leaves only three points. The remaining result is exactly the protected
swapped `FA-UNIQ5` frontier.

Checked declarations:

- `not_fullyDeletionRobustAt_secondApex_of_oppCap2_card_eq_four`;
- `nonempty_secondApexUniqueFiveRadius_of_fullyDeletionRobustAt`;
- `false_of_fullyDeletionRobustAt_secondApex_and_swappedUniqueFour`; and
- `fullyDeletionRobustAt_secondApex_reorients_to_swappedUniqueFive`.

## Exact residual on the live parent surface

The coherent robust/common-deletion parent reaches this endpoint only after
the small-cap bypass, so the live surface already has

```text
6 <= S.oppCap2.card.
```

On that surface both radius alternatives remain compatible with every
available cap/MEC fact:

1. **Large radius class.** A positive-radius class of cardinality at least
   five may place at least three points in the strict opposite-cap interior
   and at most one point in each adjacent cap. A cap of cardinality at least
   six has enough capacity.
2. **Two distinct K4 radii.** Each radius contributes at least two strict
   opposite-cap interior points. The supports are disjoint, so the two radii
   require four distinct interior points and hence a closed cap of cardinality
   at least six. This exactly meets, rather than contradicts, the live lower
   bound.

Therefore the cap/MEC one-hit layer is exhausted at this endpoint. It proves
the threshold and the normal form, but it does not refute either large-cap
alternative.

## Missing consumer

The sibling checked audit `../physical-apex-criticality/` corrects an earlier
way of phrasing this boundary.  `HasCriticalDeletionAt D S.oppApex2` is exactly
the negation of `FullyDeletionRobustAt D S.oppApex2`, and any retained
critical-map source centered at that apex would already produce such a
critical deletion.  Neither is a separate intermediate producer on the robust
arm.

The new large-cap theorem must directly exclude both exact normal-form arms.
It must use information beyond marginal cap-capacity and one-hit bounds, for
example source-indexed critical-map provenance or a cross-cap incidence forced
by the global row system. Another radius-class count or another local
selected-four extraction cannot close the branch.

## Validation

The owned source was compiled as an isolated scratch module against the
current production build and the checked scratch dependency oleans. The
focused Lean invocation exited successfully and produced:

```text
/private/tmp/p97-robust-second-apex-geometry-oleans/
  RobustSecondApexGeometry.olean
```

All seven printed declarations depend only on:

```text
propext
Classical.choice
Quot.sound
```

The owned directory contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, `unsafe`, heartbeat override, or linter suppression. No full
project build was run.
