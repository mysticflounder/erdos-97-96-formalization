# Universal witness closure from minimality

Date: 2026-07-22

Status: **KERNEL-CHECKED UNIVERSAL MINIMALITY CUT; NOT AN A-TAIL
TERMINAL.**

## Result

The production stack already contains the source-level obstruction:

```lean
Problem97.ATailGlobalMinimalDeletion
  .not_hasNEquidistantProperty_of_nonempty_proper_subset
```

It says that a nonempty proper subset of a minimal carrier cannot retain
global K4.  Production also contains the fixed-row consequence
`FaithfulCarrierPattern.exists_row_escape_of_proper_subset`.

This scratch lane adds only thin adapters.  The direct requested subset form
is:

```lean
exists_center_without_local_K4_of_minimal
```

For every nonempty proper `B ⊆ D.A`, it produces `center ∈ B` with
`not HasNEquidistantPointsAt 4 B center`.  It is a two-theorem composition of
the existing production subset obstruction and production local-blocker
extraction.

The quantifier-strengthened selected-row form is:

```lean
exists_center_every_selectedFourClass_escapes_of_minimal
```

For every nonempty proper `B ⊆ D.A`, it produces one `center ∈ B` such
that

```text
∀ K : SelectedFourClass D.A center,
  ∃ target ∈ K.support, target ∉ B.
```

The selected row is quantified *after* the center.  Thus this is not merely
the no-proper-sink condition for one chosen witness graph: the same center
blocks every possible selected ambient four-class from being contained in
`B`.

The equivalent deletion form is kernel-checked as:

```lean
exists_remaining_center_every_selectedFourClass_hits_deletion
```

For every nonempty `U ⊆ D.A` with `D.A \ U` nonempty, it produces one
remaining center such that every selected ambient four-class at that center
meets `U`.

## Exact finite constraint

The distinction from ordinary selected-row strong connectivity is the
quantifier order.

For one fixed simultaneous row choice, the existing graph cut is

```text
∀ nonempty proper B,
  ∃ center ∈ B, the chosen row at center exits B.
```

Global minimality actually supplies

```text
∀ nonempty proper B,
  ∃ center ∈ B,
    ∀ valid selected four-rows K at center, K exits B.
```

Equivalently, in deletion language:

```text
∀ nonempty U ⊆ D.A with D.A \ U nonempty,
  ∃ center ∈ D.A \ U,
    ∀ valid selected four-rows K at center, K.support ∩ U ≠ ∅.
```

A finite search that stores all admissible K4 rows at each center may encode
this as a universal hitting constraint.  Encoding only strong connectivity
of one selected-row assignment loses this information.

This theorem does **not** identify the center, the hit in `U`, or a common hit
shared by different rows.  It also does not force the four disjoint
quarter-turn arcs from the exact-two survivor quotient.  Such an occurrence
theorem still needs additional source data from the full parent geometry,
critical map, MEC/cap structure, or `noM44`.

## Proof architecture

The file deliberately reuses production rather than reconstructing
minimality:

1. `not_hasNEquidistantProperty_of_nonempty_proper_subset` rules out global
   K4 on `B`.
2. `exists_local_blocker_of_not_global_K4` selects a center of `B` with no
   local K4 on `B`.
3. Any ambient `SelectedFourClass` contained in `B` would directly rebuild
   local K4 at that center, a contradiction.

No fixed `CriticalShellSystem`, selected-row system, cap geometry, or
cardinality profile is assumed.

## Bank preflight

Before formalization I checked the registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries found the production subset
obstruction and `FaithfulCarrierPattern.exists_row_escape_of_proper_subset`.
No duplicate local incidence theorem was introduced.  The new content is the
same-center, all-selected-rows quantifier order above.

## Validation

Focused validation passed with warnings treated as errors:

```text
cd lean
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/unique4-universal-witness-closure/\
UniversalWitnessClosure.lean
```

All four printed declarations depend only on:

```text
propext
Classical.choice
Quot.sound
```

The source contains no `sorry`, `admit`, declared axiom, `unsafe`, or
`native_decide` escape hatch.
