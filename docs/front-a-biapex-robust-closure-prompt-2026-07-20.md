# Exact-five physical-omission-cycle closure

Prove the following theorem:

```lean
Problem97.ATailFrontierLiveClosure
  .false_of_frontierBiApexRobustExactFiveSecondCapProfile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    False
```

## Relevant live data

`S` has physical opposite apices `O1 = S.oppApex1` and
`O2 = S.oppApex2`. The full parent `F/R/B/Q` retains both `q`-deleted
four-point rows, at `O1` and at `O2`, together with the common-deletion,
robustness, cap, and fixed critical-shell data. The second physical cap has
cardinality five and the first has cardinality at least six.

`profile` gives the unique positive-radius `O2` class `E` of cardinality five.
Let `P` be its intersection with the strict physical second-cap interior.
The following is already kernel-checked:

```lean
three_le_capInterior_hits_of_largeCapUniqueFive profile
```

so `P` has at least three points. Do not confuse `E`, a complete ambient
radius class, with either selected parent row.

In particular, this theorem does **not** establish that three points of `P`
occur in the selected `O2` q-deleted row `U2`. The retained-row cardinalities
and `|U1 ∩ U2| ≤ 2` alone do not yield a physical point of `U2 \ U1`:

```text
P  = {p1, p2, p3}
U2 = {p1, p2, u, v}
U1 = {p1, p2, s, t}
```

is an abstract compatible incidence pattern. Do not silently identify a
selected row with `E` or assume a three-point hit.

The existing physical omission machinery gives, for every `start :
PhysicalVertex profile`, a source-faithful cycle:

```lean
nonempty_physicalActualCriticalOmissionCycle_from_start H profile start
```

and a complete split:

```lean
nonempty_mutualOmissionEdge_or_all_reverseMembership K
```

On the all-reverse arm, this is an existing terminal:

```lean
false_of_transitionReverseOutsidePair_coRadial_firstApex
```

It concludes `False` from a transition, its reverse-membership condition, and
two distinct points of one `transitionReverseOutsidePair` that have equal
distance from `O1`.

## Required result

The first missing source-level implication is:

```text
there is x in P which is in the O2 q-deleted row
and not in the O1 q-deleted row.
```

This bridge is **CONJECTURED**, not an available hypothesis. A sufficient
producer is `3 ≤ |P ∩ U2|`, since the parent gives `|U1 ∩ U2| ≤ 2`. Prove this
or another source-faithful producer from the actual parent fields. Do not use
only the displayed cardinalities.

Only after that producer is established, close both arms of the existing split:

1. prove a mutual-omission edge contradicts the full parent and exact-five
   profile; and
2. on the all-reverse arm, produce a transition and distinct `a b` in its
   `transitionReverseOutsidePair` with
   `dist O1 a = dist O1 b`, then invoke
   `false_of_transitionReverseOutsidePair_coRadial_firstApex`.

## Excluded directions

Do not target a MEC-boundary extreme, retriangulation packet, cap-at-least-six
continuation, another selected-row adapter, literal CEGAR, or a reassigned
critical system. None is an established producer for this exact-five anchor.

## Rigor requirements

- Use only the exact `F/R/B/Q/profile` data and existing named theorems.
- Keep complete radius classes and selected four-point rows separate; do not
  infer selected-row coverage from a full-class cardinality.
- Do not assume genericity, distinct radii, or distinct critical centers.
- Retain the fixed `H`; no favorable reassignment of blockers.
- Label claims `PROVEN`, `EMPIRICALLY VERIFIED`, `CONJECTURED`, or
  `HEURISTIC`. Do not call a conditional consumer, a cycle, or a source-clean
  adapter closure.

If closure fails, report only the first missing source-level implication and
the exact existing terminal it would feed.
