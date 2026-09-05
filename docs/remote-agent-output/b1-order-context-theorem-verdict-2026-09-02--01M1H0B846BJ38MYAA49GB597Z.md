# B1 winning-slice order/context theorem: proof/refutation checkpoint

**Date:** 2026-09-02  
**Target:** the proposed B1 theorem
```lean
b1_winningSliceNonalternation_or_escapeSourceContext
  (C : B1GlobalTransportContext ...)
  (hnormal : B1PhysicalClassFiveSixNormalForm C)
  (W : B1FiveSixWaveIngress C) :
  Nonempty (B1WinningLiveSliceSameBoundaryArc C) ∨
  Nonempty (B1EscapeSourceContext C)
```

## Verdict

The proposed two-way theorem is **refuted as the intended local/source-packet
implication**.  This does not exhibit a full Euclidean `CounterexampleData`
model; it shows that the current B1 normal form and wave ingress do not retain
enough information to prove the disjunction.

The first disjunct is already impossible under the same hypotheses, by the
kernel-clean B1 shared-pair consumer
`false_of_b1WinningLiveSliceSameBoundaryArc` (equivalently the broader
`false_of_b1PhysicalClassFiveSixNormalForm_of_liveSlicesSameBoundaryArc`).
Consequently, a proof of the proposed outcome would amount to an unconditional
proof of
```lean
Nonempty (B1EscapeSourceContext C).
```

`B1FiveSixWaveIngress` does not force that context.  Its escape source is known
to lie in the fixed physical class, the strict second-cap interior, its own
escape row, and one live slice.  It is not known to lie outside the first-apex
fiber, and it is not known to survive either retained first-apex deletion.

## Exact source obstruction

`B1EscapeSourceContext` adds two load-bearing predicates to the escape star:

1. the fixed escape source belongs to `outsideFirstApexFiber C.R`;
2. deleting `C.R.interior_q` or `C.R.interior_w` preserves a four-point class
   at that source's actual blocker.

Neither follows from `B1EscapeRowProvenanceStar`, the card-five packet, or the
card-six packet.  The existing adapter `b1EscapeSourceContext_of_star` is
already proved once these two predicates are supplied.

Failure of the context has two concrete source meanings:

- failure of outside-fiber membership places the source in the exact
  first-apex class;
- if outside membership holds but both retained deletions fail, the source is
  in `badOutsideSources`.

In either case the escape row contains the retained pair.  No current theorem
combines that fact with strict second-cap membership and a live-slice incidence
to force a same-arc pair or a contradiction.

## Reproducible finite-interface countermodel

The accompanying verifier constructs a 12-label cyclic incidence projection:

```text
physical class C = {1,2,3,5,6,10}
uSlice             = {2,6}
vSlice             = {3,10}

Ku       (center 4)  = {0,2,6,7}
Kv       (center 8)  = {3,4,10,11}
Kcommon  (center 7)  = {0,1,5,9}
F1=Kesc  (center 11) = {6,8,9,10}
```

It verifies:

- physical-class cardinality six and the exact deleted-pair/live-slice cover;
- both live slices have cardinality two and are disjoint;
- reciprocal endpoint omission and exactly two incidence-level joint-deletion
  candidates;
- exact row cardinality four, center exclusion, source membership,
  physical-trace cardinality at most two, and pairwise row intersection at most
  two;
- all finite escape-star fields;
- both eligible live pairs alternate in the cyclic order;
- the escape source lies in the first-apex support;
- both retained points lie in the escape row.

Thus both proposed outcome arms fail in the retained finite interface.

**Scope qualification:** the projection does not supply coordinates,
equal-distance equations, strict convexity, the MEC packet, global minimality,
or a full `CounterexampleData`.  It refutes the claim that the theorem follows
from the present packet's finite/order content, not the global mathematical
possibility that the full antecedent is empty.

Verifier: `b1-order-context-interface-countermodel-2026-09-02.py`  
Verifier SHA-256: `6b5fde0f09d265c22976954fb60d291555c882ce3e92d79e43d21e2f54146e6f`

## Stronger source-clean replacement

A fixed-radius selector already exists:
```lean
ATailExactFourRobustCapExpansion.
  exists_interiorPairGoodOutsideSource_mem_secondClassInterior
```
It returns a source `g` in the exact B1 physical class and strict second-cap
interior, outside the first-apex fiber, with one retained first-apex deletion
surviving at `beta(g)`.

The correct source theorem is therefore:

```lean
structure B1GoodDeletedInteriorPacket (C : B1GlobalTransportContext ...) where
  source : CarrierVertex D.A
  source_eq_first_or_second :
    source = C.first.deleted ∨ source = C.second.deleted
  source_mem_physicalClass :
    source.1 ∈ SelectedClass D.A S.oppApex2 C.rho
  source_mem_secondCapInterior :
    source.1 ∈ S.capInteriorByIndex S.oppIndex2
  source_mem_outsideFirstApexFiber :
    source ∈ outsideFirstApexFiber C.R
  survives_retained_firstApex_deletion :
    HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_q)
      ((lateFirstApexSystem C.R).centerAt source.1 source.2) ∨
    HasNEquidistantPointsAt 4 (D.A.erase C.R.interior_w)
      ((lateFirstApexSystem C.R).centerAt source.1 source.2)

theorem b1_escapeSourceContext_or_goodDeletedInterior
    (C : B1GlobalTransportContext ...)
    (hnormal : B1PhysicalClassFiveSixNormalForm C) :
    Nonempty (B1EscapeSourceContext C) ∨
    Nonempty (B1GoodDeletedInteriorPacket C)
```

### Proof

Obtain `g` from the fixed-radius selector and split on
`g = C.first.deleted` and `g = C.second.deleted`.

- In either equality arm, package the selector fields into
  `B1GoodDeletedInteriorPacket`.
- In the remaining arm:
  1. `b1_source_not_mem_commonRow_of_class_of_ne_deletions` proves `g` is not
     in the common row.
  2. `b1EscapeWitness_of_sourceData` constructs the escape witness.
  3. Rewrite the normal-form cover and eliminate the deleted-pair branch to
     show `g ∈ b1USlice C ∨ g ∈ b1VSlice C`.
  4. Critical-shell self-membership puts `g` in its escape row.
  5. `b1_escapeRow_crossOmission` supplies one deleted-source omission.
  6. Copy the selector's outside-fiber and retained-deletion-survival fields.

This proof is source-clean in prose and field-by-field audited; it needs a
small Lean adapter for step 3 and record assembly.

## Why the deleted arm is genuine

If the selector returns one deleted point, equal blocker/support transport
makes both deleted points good and strict second-cap interior.  The two
exceptional families for the remaining nondeleted strict-interior points have
sharp total capacity two:

- first-apex marginal points in the fixed second class: at most one;
- `interiorPairBadOutsideSources` in the fixed class and strict interior: at
  most one.

After removing the two deleted points, card five leaves at least one and card
six at least two nondeleted strict-interior points.  Those lower bounds can be
fully covered by the two exceptional families.  Therefore neither cardinality
forces a nondeleted good source.  No current source-clean consumer closes the
good-deleted packet.

The apparent shortcut
`false_of_exactFourPostCardElevenInteriorDeletionBranch` accepts the selector
source, including a deleted point, but its axiom closure contains `sorryAx` and
routes through the still-open Rigid221 placement leaves.  It is not a clean B1
proof.

## Recommended next theorem

Implement `b1_escapeSourceContext_or_goodDeletedInterior`, then make
`B1GoodDeletedInteriorPacket` the sole new B1 residual.  The original
same-arc-or-context theorem should not be pursued further.
