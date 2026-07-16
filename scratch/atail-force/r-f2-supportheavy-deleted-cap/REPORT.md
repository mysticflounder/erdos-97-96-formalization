# F2 support-heavy deleted-source cap placement

Date: 2026-07-16

Status: **kernel-checked source-faithful placement; no production `sorry`
closed.**

## Scope

This scratch lane strengthens the checked F2 support-heavy reduction without
changing the selected critical system or replacing the actual deleted source.
It owns only:

- `F2SupportHeavyDeletedCap.lean`; and
- this report.

No production Lean file, closure document, protected scratch lane, or
proof-blueprint state is changed here.

## Theorem-bank preflight

Before deriving the cap placement, the existing Problem 97 theorem-bank
registries and the indexed Lean corpora were checked.  The needed ingredients
were already local:

- the exact support-heavy cardinalities in
  `F2SupportHeavyReduction`;
- `deleted_mem_deletedCriticalSupport`;
- `deleted_not_mem_secondRow`; and
- `mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps`.

No new anonymous finite-pattern contradiction is introduced.

## Kernel-checked result

In the support-heavy arm, let

```text
supportStrict =
  supportOnlyCell C.B₂ live (deletedCriticalSupport C)
    ∩ strictSecondCap S
```

and

```text
supportOpp2 = deletedCriticalSupport C ∩ S.oppCap2.
```

The checked reduction gives:

```text
supportStrict ⊆ supportOpp2
card supportStrict = 2
card supportOpp2 = 2.
```

Hence the two sets are equal.  The deleted source belongs to
`deletedCriticalSupport C`, but it is not a member of the q-deleted middle
row `C.B₂`.  If it belonged to `S.oppCap2`, equality of the two sets would
put it in `supportStrict` and therefore in `C.B₂`, a contradiction.

The file proves:

```text
F2SupportHeavyReduction.deleted_not_mem_oppCap2
```

and, when the actual deleted source is off the surplus cap:

```text
F2SupportHeavyReduction.deleted_mem_strictOppCap1
```

with conclusion:

```text
deleted ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2).
```

This is a genuine placement of the actual source.  It does not infer any
radius equality from selected-support nonmembership.

## Consequence for the next producer

The support-heavy geometry now has a named cross-cap pair:

```text
deleted ∈ strict oppCap1
s,t ∈ strict oppCap2,
```

where `s,t` are the two generated-row centers retained by the support-heavy
K4 split.  Any next consumer should preserve these identities together with:

- the original deleted-source dangerous triple;
- the generated q-deleted/q-critical row kind;
- the retained live row;
- MEC/cap order; and
- the current critical-map provenance.

The result does not itself place either generated support, and therefore does
not close the q-critical or q-deleted generated-row branches.

## Validation

The repository-pinned Lean 4.27.0 single-file check produced:

```text
/private/tmp/p97-r-f2-supportheavy-deleted-cap-oleans/
  F2SupportHeavyDeletedCap.olean
```

Both printed endpoints depend only on:

```text
propext
Classical.choice
Quot.sound
```

Neither depends on `sorryAx`.  No full `lake-build` was run.

