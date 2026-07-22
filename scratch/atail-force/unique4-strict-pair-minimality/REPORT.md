# Exact-four strict-pair minimality

Date: 2026-07-22

Status: **KERNEL-CHECKED SOURCE SPECIALIZATION.  THE PRESCRIBED DELETION SET IS
EXACTLY THE TWO DISTINGUISHED STRICT-CAP POINTS.  THE OUTPUT IS A NAMED
SINGLETON CORE, AN EQUAL-RADIUS SAME-CAP ROBUST CENTER, OR A DISTINCT-RADIUS
TWO-SHELL CORE.  THE EQUAL-RADIUS ARM IS CONTRADICTORY IF THE PHYSICAL FIRST
OPPOSITE CAP HAS CARDINALITY FOUR, BUT THAT CAP CARDINALITY IS NOT A FIELD OR
CONSEQUENCE CURRENTLY PROVIDED BY `OriginalUniqueFourResidual`.**

## Scope

This lane owns only

```text
scratch/atail-force/unique4-strict-pair-minimality/
```

and starts from

```lean
R : OriginalUniqueFourResidual F.
```

Its prescribed deletion set is

```lean
{R.interior_q, R.interior_w}.
```

Both points are actual carrier points, both lie in the exact first-apex
radius class, both lie in the strict interior of the first opposite cap, and
they are distinct.

## Required theorem-bank preflight

Before formalizing the specialization, the following registries were
searched as required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed-corpus searches included:

```text
nthdegree docs search --lean \
  "cardinal minimal four equidistant deletion fresh center subset pair blocked restored singleton pair"
nthdegree docs search --lean \
  "OriginalUniqueFourResidual bisector center interior equal radius collision"
nthdegree docs search --lean \
  "MinimalDeletionCore exact two deleted sources distinct radii consumer"
nthdegree docs search --lean \
  "fully deletion robust center five point radius class same cap two points terminal"
```

The relevant existing source theorems were the generic global-minimality
bridge, `exists_minimalDeletionCore`, the repeated-radius five-class lemma,
the deletion-robustness lemmas, and the residual's own bisector localization.
No bank theorem already supplied the missing terminal occurrence.

## Kernel-checked normal form

`UniqueFourStrictPairMinimality.lean` defines

```lean
StrictPairMinimalDeletion R
```

with the following complete provenance:

- a center in `D.A \ {R.interior_q, R.interior_w}`;
- a nonempty deletion set `V` contained in that pair;
- failure of K4 at the center on `D.A \ V`;
- restoration of K4 after restoring each member of `V`; and
- the exhaustive cardinality classification

  ```lean
  V.card = 1 ∨
    (V.card = 2 ∧ V = {R.interior_q, R.interior_w}).
  ```

The theorem

```lean
exists_strictPair_minimalDeletion
```

constructs this packet directly from `R.minimal`.  No finite row table or
selected-subset surrogate is used.

The final unconditional split is

```lean
exists_strictPair_singleton_or_equalRadius_or_distinctRadius
```

and has three arms.

### 1. Named singleton core

If `V.card = 1`, then

```lean
V = {R.interior_q} ∨ V = {R.interior_w}
```

and

```lean
Nonempty (MinimalDeletionCore D.A V center).
```

Thus the result is not an anonymous minimality restatement: the unique
deleted source is one of the two displayed strict-cap points and carries an
exact critical shell at the fresh center.

### 2. Equal-radius whole-pair collision

If `V` is the whole pair and

```lean
dist center R.interior_q = dist center R.interior_w,
```

then `equalRadius_pair_collision_normalForm` proves all of the following:

- `center` is not the first opposite apex;
- `center ∈ S.capInteriorByIndex S.oppIndex1`, by the checked bisector
  localization stored in `R`;
- the radius `dist center R.interior_q` is positive;
- both displayed points belong to that complete ambient radius class;
- that complete class has cardinality at least five;
- the physical first opposite cap has cardinality at least five, because its
  strict interior contains the three distinct points
  `center`, `R.interior_q`, and `R.interior_w`;
- `FullyDeletionRobustAt D center`; and
- every legal `CriticalShellSystem D.A` omits `center` from its blocker image.

The theorem

```lean
false_of_equalRadius_pair_of_firstOppCap_card_eq_four
```

therefore closes this arm immediately under the additional hypothesis

```lean
(S.capByIndex S.oppIndex1).card = 4.
```

### 3. Distinct-radius whole-pair core

If the two displayed distances at the fresh center differ, then

```lean
Nonempty (MinimalDeletionCore D.A V center)
```

for `V = {R.interior_q, R.interior_w}`.  Its two exact critical shells are
support-disjoint and concentric at `center`; they make `center` fully
deletion-robust.

The conditional theorem

```lean
exists_strictPair_singleton_or_distinctRadius_of_firstOppCap_card_eq_four
```

removes the equal-radius arm when an independent source supplies exact
physical cap cardinality four.

## Important source distinction

The current structure has the field

```lean
R.class_card_eq_four :
  (SelectedClass D.A S.oppApex1 radius).card = 4.
```

It does **not** have

```lean
(S.capByIndex S.oppIndex1).card = 4.
```

The first statement fixes an ambient radius class; the second fixes a
physical boundary cap.  They are not interchangeable.  Consequently the
unconditional equal-radius conclusion is `5 ≤ cap.card`, not `False`.

## Immediate consumer audit

### `outsidePair_unique_capCenter`

No match.  In the equal-radius arm, the two collision points are **inside**
the same cap as the fresh center.  The existing theorem needs a pair outside
the common centers' cap.

### Third-actual-center common-pair terminal

No match.  The fresh equal-radius center is fully deletion-robust and hence
cannot itself be an actual blocker center.  The pair specialization does not
produce a third actual selected row containing both strict points.

### `CriticalFiberClosingCore`

No match.  Its constructors require a source-indexed repeated blocker fiber
together with an ordered cross-row membership, or two cap centers sharing a
pair outside their cap.  The present singleton and two-shell cores are
centered at one fresh center and provide neither required cross membership.

### Kalmanson, U5, and planar banks

No match.  A two-member `MinimalDeletionCore` supplies two shells at one
center, not two distinct row centers.  The current smallest bank consumers
require at least three distinct row centers plus positive cross-row support
memberships.  The singleton supplies only one new row.

### Indexed-apex cap-six consequence

`MinimalDeletionCore.capByIndex_card_ge_six` would apply to the two-shell
arm if the fresh center were identified with a displayed Moser opposite
vertex.  The strict-pair minimality data does not provide that identification.

## Exact first missing source field

There are two honest continuation choices.

1. A source theorem proving

   ```lean
   (S.capByIndex S.oppIndex1).card = 4
   ```

   closes the equal-radius arm immediately, but it does not close the named
   singleton or distinct-radius core arms.  Current `OriginalUniqueFourResidual`
   does not imply this field.

2. Uniformly, the first missing terminal-grade input is a **positive
   multicenter occurrence** from the singleton or two-shell core: an actual
   critical row at a genuinely additional carrier center with the exact
   cross membership required by a checked Kalmanson/U5 terminal, or a complete
   alternative MEC/`IsM44` packet with its immediate consumer.  Merely
   choosing another arbitrary K4 row does not supply that membership.

This pair specialization is therefore a real reduction of the global
minimality surface, but not by itself a proof of
`OriginalUniqueFourResidual F → False`.

## Validation

The upstream scratch dependency and this file were freshly elaborated with
warnings as errors.  To avoid placing build artifacts in the repository, the
upstream `.olean` was written under `/tmp`:

```bash
mkdir -p /tmp/p97-unique4-strict-pair-lean

cd lean
env LEAN_PATH=../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer:\
./.lake/build/lib/lean \
  lake env lean -R .. -M 16384 -DwarningAsError=true \
  -o /tmp/p97-unique4-strict-pair-lean/UniqueFourGlobalDeletionCoupling.olean \
  ../scratch/atail-force/unique4-global-coupling/UniqueFourGlobalDeletionCoupling.lean

env LEAN_PATH=/tmp/p97-unique4-strict-pair-lean:\
../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer:\
./.lake/build/lib/lean \
  lake env lean -R .. -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/unique4-strict-pair-minimality/UniqueFourStrictPairMinimality.lean
```

Every printed declaration has axiom closure exactly

```text
propext
Classical.choice
Quot.sound
```

There is no `sorry`, `admit`, declared axiom, `native_decide`, or unsafe
declaration in the new Lean file.

## Epistemic status

- **PROVEN / KERNEL-CHECKED:** the pair specialization, singleton naming,
  singleton and distinct-radius minimal-deletion cores, equal-radius
  bisector localization, five-class and five-cap bounds, deletion robustness,
  blocker-image omission, and the conditional exact-cap-four contradiction.
- **PROVEN INTERFACE MISMATCH:** none of the audited terminals receives its
  complete antecedent from this output alone.
- **OPEN:** a source theorem producing exact physical cap cardinality four,
  or a positive multicenter cross-row/MEC occurrence from the remaining
  minimal-deletion cores.
- **NOT CLAIMED:** unconditional `False`, a new counterexample, or closure of
  a production `sorry`.
