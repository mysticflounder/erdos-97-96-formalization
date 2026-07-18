# Exact-six minimal-deletion-core consumer

Date: 2026-07-18

Status: **KERNEL-CHECKED SOURCE-FAITHFUL RETURN TO THE EXISTING COMMON-DELETION
SURFACE; NOT A DIRECT CONTRADICTION.**

## Question audited

Apply

```lean
ATailGlobalMinimalDeletion.exists_fresh_sharedRadiusPair_or_minimalDeletionCore
```

to

```lean
physicalVertices profile =
  SelectedClass D.A S.oppApex2 profile.radius ∩
    S.capInteriorByIndex S.oppIndex2
```

on the exact-five physical-apex branch, with `S.oppCap2.card = 6`.  This
report owns the `MinimalDeletionCore` outcome only.  It asks whether the
core's pairwise-disjoint exact shells, the exact-six cap, and the retained
physical-apex robustness directly contradict the full parent.

They do not.  The strongest checked consumer returns the core to an existing
nonterminal surface.

## Checked results

`ExactSixMinimalCoreConsumer.lean` proves the following.

### 1. Exact-six physical source count

```lean
physicalVertices_card_eq_three_or_four_of_oppCap2_card_eq_six
```

The strict interior of a six-point closed cap has cardinality four, while the
exact-five physical class has at least three strict-interior hits.  Therefore
`physicalVertices profile` has cardinality exactly three or four.

### 2. The fresh core center is not the physical apex

```lean
minimalDeletionCore_center_ne_physicalApex
```

This uses the exactness of `MinimalDeletionCore.shellAt`, not merely a chosen
four-point row.  If the core center were `S.oppApex2`, the exact shell through
any core source would have the profile radius.  Its complete radius class
would then have both cardinality four (the shell) and cardinality five (the
profile), a contradiction.

### 3. Every nonempty core gives an existing common-deletion packet

```lean
exists_physicalVertex_commonDeletion_of_minimalDeletionCore
```

Choose one exact fresh-center shell from the core.  The fresh center differs
from the physical apex, so the banked two-circle theorem

```lean
N8ApexArcWitness.selectedClass_inter_card_le_two
```

shows that this shell contains at most two points of the complete physical
exact-five class.  Since at least three physical-class points lie in the
strict cap, there is a named

```lean
deleted ∈ physicalVertices profile
```

outside the fresh shell.  Deleting it preserves the fresh shell and, by the
retained `FullyDeletionRobustAt D S.oppApex2`, preserves K4 at the physical
apex.  The existing constructor then gives

```lean
CommonDeletionTwoCenterPacket D H deleted center S.oppApex2.
```

This is stronger than the earlier generic large-radius reduction in one
respect: the deleted point is certified to be a physical strict-cap vertex,
not just a member of the ambient radius class.  It is also independent of
the core's cardinality; singleton and multi-source cores both return to the
same existing packet.

### 4. Exact core cardinal and robust-center boundary

The file additionally proves:

```lean
four_mul_card_lt_carrier_of_minimalDeletionCore
```

with the strict packing bound

```text
4 * V.card < D.A.card.
```

The strict inequality improves the earlier weak packing inequality by using
the fact that the fresh center belongs to the carrier but to none of its own
shell supports.

For `2 ≤ V.card`, two support-disjoint exact shells make the fresh center
fully deletion-robust:

```lean
fullyDeletionRobustAt_of_minimalDeletionCore_card_ge_two
```

The combined exact-six normal form is:

```lean
exactSix_minimalDeletionCore_commonDeletion_and_card_normalForm
```

It returns:

- a physical-source `CommonDeletionTwoCenterPacket`;
- `V.card ≤ 4`;
- `4 * V.card < D.A.card`; and
- either `V.card = 1`, or `2 ≤ V.card` together with
  `FullyDeletionRobustAt D center`.

## Closure interpretation

This closes the **producer question** for the minimal-core arm, but not the
parent contradiction.

The result is exactly the antecedent of the existing production
common-deletion machinery.  That machinery is already documented as
nonterminal: it either reproduces physical-apex robustness or continues into
another origin-sensitive critical/common-deletion route.  On a non-singleton
core, this audit also explicitly produces a new fully robust carrier center.
Neither output carries a decreasing cap-order rank, a no-return theorem, or
an aggregate all-center contradiction.

Consequently the exact-six minimal-core arm should **not** become another
standalone direct-`False` target.  It should be routed immediately to the
origin-tagged common-deletion consumer.  Any terminal use must retain new
global information capable of forbidding that return, for example:

1. a source-faithful no-return/decreasing-order theorem for the returned
   physical deletion source;
2. an aggregate theorem coupling the returned fresh center to the complete
   parent `R/B/L` packet and total critical map; or
3. genuinely nonlinear Euclidean/MEC/no-`IsM44` force that is absent from
   `MinimalDeletionCore` and the exact-six cardinal facts themselves.

The full parent `noM44`, first-apex frontier, and MEC/cap-order fields are
unused by the checked reduction.  That is evidence that they must enter the
next consumer essentially; adding more local shell packing cannot make this
normal form terminal.

## Bank and corpus preflight

Before proving the consumer, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered minimal deletion
cores, pairwise-disjoint exact shells, exact-six caps, fresh/physical circle
intersection, and common-deletion packets.  The relevant banked results were:

- `N8ApexArcWitness.selectedClass_inter_card_le_two`;
- `ATailDeletionRobustness.selectedFourClass_survives_erase_of_not_mem`;
- `ATailCommonDeletionTwoCenter.nonempty_commonDeletionTwoCenterPacket`; and
- `ATailRobustLargeRadius.nonempty_commonDeletionTwoCenterPacket_of_sharedCriticalPair`.

The last theorem confirms the same architectural return for the older
shared-critical-shell surface, but it does not retain the stronger strict-cap
membership proved here.  No banked theorem turns the returned generic packet
into `False` while retaining the current full-parent provenance.

## Validation

The owned Lean file was compiled directly as an isolated scratch module
against the current production oleans:

```text
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/exact6-minimality-core-consumer/ExactSixMinimalCoreConsumer.lean
```

The command exited successfully.  Every printed declaration has axiom
closure exactly:

```text
propext
Classical.choice
Quot.sound
```

The owned directory contains no `sorry`, `admit`, declared axiom,
`native_decide`, unsafe declaration, heartbeat override, or linter
suppression.  No production source, shared document, proof-blueprint state,
or protected file was edited.  No production `sorry` is closed by this
checkpoint.
