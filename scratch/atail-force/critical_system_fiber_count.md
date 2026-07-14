<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Critical-system blocker-fiber count

## Verdict

**PROVEN and Lean-validated:** for one `CriticalShellSystem`, every fiber of
`centerAt` has cardinality at most four. All sources in the fiber lie in the
same exact four-point critical support. Consequently

```text
|A| <= 4 * |image(centerAt)|.
```

The general threshold form is

```text
4 * n < |A|  ==>  n < |image(centerAt)|.
```

Thus the live hypothesis `9 < |A|` forces at least three distinct blocker
centers. This count first forces a fourth center under `12 < |A|`, not at
card 12.

**NEGATIVE FOR THE CARD-12 COMMON-CAP PRODUCER.** The count does not force a
non-`p` blocker center into a cap containing `p`. The strongest generic
consequence is conditional on

```text
4 * (|A \ cap| + 1) < |A|.
```

That condition says that the complement centers, together with at most the
single exceptional center `p` inside the cap, cannot carry all source fibers.
For `|A| = 12` and every cap in the no-`IsM44` profiles `(5,5,5)` and
`(4,5,6)`, the cap has size at most six, so the complement has size at least
six and the required inequality is arithmetically impossible.

This advances the provenance route by making its exact counting content a
reusable theorem. It does **not** produce `URowCapMultiplicityFields` or the
common-cap field.

## The exact argument

Fix a blocker center `c` and choose one source `q0` with
`centerAt(q0) = c`. The system supplies an exact selected four-shell `K0` at
`c`. For any other source `q` in the same fiber,
`CriticalShellSystem.source_mem_selectedFourClass` applies to `K0` after
transporting it across the equality `centerAt(q) = centerAt(q0)`. Therefore
`q` belongs to `K0.support`.

The map from carrier-source subtypes to their underlying points is injective,
so

```text
|centerAt^-1(c)| <= |K0.support| = 4.
```

Summing these bounds over the finite image of `centerAt` gives the global
inequality. No row is counted twice at one center: the common-provenance lemma
`selectedAt_support_eq_of_centerAt_eq` identifies all selected supports at
that center.

## Why cap size and no-`IsM44` do not finish

Let `I` be the blocker-center image and let `C` be a cap. If there is no
center of `I ∩ C` other than `p`, then

```text
|I ∩ C| <= 1,
|I \ C| <= |A \ C|,
|I| <= |A \ C| + 1.
```

Combining this with `|A| <= 4|I|` yields a contradiction only if

```text
4 * (|A \ C| + 1) < |A|.
```

At card 12, cap sizes four, five, or six give right-side capacities
`4*(9)`, `4*(8)`, or `4*(7)`, all far above 12. The bare fiber count therefore
has no card-12 same-cap pigeonhole.

The current no-`IsM44` theorem
`exists_secondLargeCap_of_noM44` only supplies a second cap of size at least
five. Its statement has no `centerAt`, source, row-support, or dangerous-apex
incidence. It cannot improve the image-distribution bound without a new
geometric coupling.

Even moving from card 12 to card 13 only increases the guaranteed blocker
image from three to four. Four centers can still all avoid `C \ {p}` because
the complement of a card-13 cap in the listed profiles has at least six
points. Under the extremal two-large-cap complement size six, this raw count
does not become capable of forcing a same-cap center until `|A| >= 29`.
That is only a capacity threshold, not a claim that all higher-card geometry
realizes the extremal profile.

## Theorem-bank preflight

The registries required by `AGENTS.md` and indexed Lean search were checked
before drafting the lemmas. The searches found the current
`CriticalShellSystem.centerAt`, `blockerVertex`,
`source_mem_selectedFourClass`, and
`selectedFourClass_support_eq_shell`, plus unrelated finite-fiber utilities.
No existing P97 theorem states the blocker-fiber bound or turns it into the
needed common-cap placement.

The sibling and legacy contradiction banks remain downstream consumers:
their useful same-cap or incidence lemmas require already-produced cap/row
memberships, and the `IsM44` producer families assume the regime excluded by
this lane.

## Lean artifact

The owned source is
`scratch/atail-force/critical_system_fiber_count.lean`. It contains no
`sorry`, `admit`, or axiom declaration and validates:

- `source_mem_selectedAt_of_centerAt_eq`;
- `centerFiber_card_le_four`;
- `centerImage_subset_A`;
- `card_le_four_mul_centerImage_card`;
- `lt_centerImage_card_of_four_mul_lt_card`;
- the three-center and four-center numerical corollaries;
- `exists_centerImage_mem_cap_ne_of_count`; and
- the card-12 cap-at-most-six failure of that threshold.

The first narrow check found that the two `Finset` definitions over `R^2`
needed the expected `noncomputable` marker:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/critical_system_fiber_count.lean

error(lean.dependsOnNoncomputable) at centerFiber
error(lean.dependsOnNoncomputable) at centerImage
```

After adding only those two markers, the same narrow command succeeded twice,
including the final axiom-audit run:

```text
exit code: 0
warnings from the Lean file: none
```

The three printed axiom closures are identical:

```text
centerFiber_card_le_four:
  [propext, Classical.choice, Quot.sound]
card_le_four_mul_centerImage_card:
  [propext, Classical.choice, Quot.sound]
exists_centerImage_mem_cap_ne_of_count:
  [propext, Classical.choice, Quot.sound]
```

There is no `sorryAx` or custom axiom. Source scans also found no
`sorry`/`admit`, axiom/opaque declaration, linter suppression, heartbeat
override, or line longer than 120 characters. The artifact is therefore
kernel checked at the narrow single-file target; it is intentionally not
imported into the shared Route-B module.

## Next useful theorem

The producer still needs a statement that couples blocker placement to the
two-large-cap geometry. The smallest useful form is not a larger global image
bound; it is one of:

1. a non-`p` `centerAt` value in a cap containing `p`, together with two
   dangerous support points outside that cap; or
2. a geometric rule forcing enough sources from the dangerous row into one
   blocker fiber/cap incidence to invoke the same-cap consumer.

Cap cardinalities and deletion provenance alone supply neither field.
