# Self-centered common-deletion audit

## Scope

This audit concerns the coherent fixed-single-radius cycle output

```lean
CommonDeletionTwoCenterPacket D H deleted deleted S.oppApex2
```

where `deleted` is the actual blocker of the preceding cycle source.  It does
not assess the terminal-hit packet, whose deleted point and first center are
not definitionally equal.

## Required bank preflight

Before deriving the classifier, the following registries were searched for
common deletion, two-center deletion survival, a deleted center, and an actual
blocker:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries were run for the exact
self-centered two-row statement, deletion of a positive-radius circle center,
and a q-deleted exact row centered at an actual blocker.  No bank theorem
already classifies the specialized packet.  The reusable exact hit was

```lean
hasNEquidistantPointsAt_erase_center
```

from `Erdos9796Proof.P97.U3ToU5DangerousTriple`.  The closest terminal bank
consumers remain

```lean
U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility
U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility
U5QDeletedK4Class.not_dangerous_triple_subset_of_ne_center
```

but they require named q-critical rows with cross incidence, a shared third
dangerous point, or containment of a dangerous triple.  The current packet
does not produce any of those premises.

## Proven classifier

`SelfCenteredCommonDeletionClassifier.lean` proves

```lean
theorem nonempty_commonDeletion_selfCenter_iff
    (hdeletedA : deleted ∈ D.A)
    (hcenter₂A : center₂ ∈ D.A)
    (hcenters : deleted ≠ center₂) :
    Nonempty
      (CommonDeletionTwoCenterPacket D H deleted deleted center₂) ↔
    HasNEquidistantPointsAt 4 (D.A.erase deleted) center₂
```

Thus the specialized packet is not a genuine coupling of two independent
survival constraints.  Its first survival assertion is automatic from global
K4 at `deleted`: a positive-radius circle centered at `deleted` never uses
`deleted` as a support point.  The only nonautomatic survival proposition in
the bare packet is the second-center assertion.

This means that feeding the cycle output into the generic common-deletion
successor recursion discards the load-bearing cycle geometry.  The packet by
itself cannot be expected to close the cycle arm.

## Proven source-preserving replacement

The same file proves

```lean
ActualBlockerOmissionExactRowPacket.exists_selfCenteredCommonDeletion
```

which constructs the common-deletion packet with its first row fixed to the
predecessor's actual critical shell, rather than selecting an arbitrary row
from the survival proposition.  It retains:

- the predecessor source belongs to the first row;
- the deleted actual blocker does not belong to that row;
- the first row has exactly four points; and
- the first row is the full positive-radius class centered at the deleted
  blocker.

The cycle-facing theorem

```lean
SourceExactMinimalActualBlockerCycle.
  exists_sourcePreservingSelfCenteredCommonDeletion
```

wires this replacement directly to the coherent fixed-radius cycle.

## Exact residual

No contradiction follows from the self-centered packet as currently stated.
The next consumer must retain the source-preserving exact row together with
the fixed-radius/cap provenance and produce at least one of the following
missing incidences:

1. a dangerous triple contained in the exact actual-blocker row;
2. two q-critical rows satisfying the adjacent-center or shared-third-point
   bank consumer; or
3. two named common support points outside the cap containing the actual
   blocker and `oppApex2`, for the ordered-cap two-center consumer.

None of these is a field of `CommonDeletionTwoCenterPacket`, and none follows
from `deleted = center₁`.  Period two remains especially exposed because the
existing same-cap-edge theorem only forces a strict `oppCap1` blocker edge for
period at least three.

## Validation

The file was freshly compiled as a standalone scratch module with the current
R-lane dependency oleans:

```text
env LEAN_PATH=/tmp/p97-r-orbit-entry-oleans lake env lean -R .. -M 8192 \
  -o /tmp/p97-r-orbit-entry-oleans/SelfCenteredCommonDeletionClassifier.olean \
  ../scratch/atail-force/r-full-parent-entry/SelfCenteredCommonDeletionClassifier.lean
```

All three declarations use only `propext`, `Classical.choice`, and
`Quot.sound`.  No `sorryAx` occurs.

