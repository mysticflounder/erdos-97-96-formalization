# Exact-five first-apex card-13 normal form

Date: 2026-07-21

Status: **KERNEL-CHECKED SOURCE NORMAL FORM. NO SOURCE `sorry` IS CLOSED.**

## Result

The live exact-five parent cannot be projected at card 13 as only two
anonymous first-apex four-rows.  Extracting the existing production
`FirstApexShellRolePacket F R` gives the following exhaustive strengthening.

First, the three displayed closed caps have exact cardinalities

```text
(surplusCap, oppCap1, oppCap2) = (5, 6, 5).
```

Let `I = S.capInteriorByIndex S.oppIndex1`; then `I.card = 4`.

If the retained and double-deletion first-apex radii agree, the complete
ambient retained radius class has cardinality exactly six and contains every
point of `I`:

```lean
firstApex_class_card_eq_six_of_sameRadius
firstApex_class_inter_capInterior_eq_capInterior_of_sameRadius
```

If the radii differ, the two selected rows meet `I` in disjoint two-point
sets that partition `I`.  More strongly, each selected four-row is its whole
ambient radius class, so the first apex has two distinct complete exact-four
classes:

```lean
firstApex_distinctRadius_rows_partition_capInterior
firstApex_distinctRadius_rows_are_exactClasses
```

The complete-class conclusion is not assumed from selected-row data.  It is
derived from the exact four-point cap interior, disjoint radii, the two
source-proved strict-cap hits in each row, and the adjacent-cap one-hit bound.

## Why this matters

The previous exact finite-metric regression does not realize even the weaker
production packet: after deleting its frontier pair, its forced first-apex
row has only one strict `oppCap1` hit.  The new normal form therefore removes
that regression as a blocker to the full parent-facing route.

Adding only the missing two-hit cut still leaves the isolated Boolean orbits
SAT.  The next meaningful decision surface must encode the complete split
above in one common strict convex order together with the actual retained
q-deleted rows and the exact-five global-cover outcome.  The purpose is to
find a compact terminal occurrence or a source-valid survivor, not to resume
literal CEGAR enumeration.

These theorems apply only on the exact-card-13 slice.  They do not discharge
the uniform `13 ≤ D.A.card` live theorem and are not themselves terminal
consumers.

## Theorem-bank preflight

Before proving the finite/cap/radius statements, the registries required by
`AGENTS.md` and focused indexed Lean searches were checked.  No banked theorem
states this exact source-level card-13 radius split or supplies its terminal
consumer.

## Validation

From `lean/`:

```bash
lake env lean -M 8192 -DwarningAsError=true \
  ../scratch/atail-force/exact5-first-apex-card13-normal-form/\
ExactFiveFirstApexCard13NormalForm.lean
```

All five displayed theorem axiom closures contain exactly:

```text
propext
Classical.choice
Quot.sound
```

The file contains no `sorry`, `admit`, custom axiom, `unsafe`, or
`native_decide` declaration.
