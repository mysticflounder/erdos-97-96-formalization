# Collision-three-hit reuse preflight

## Conclusion: BLOCKED

`exists_three_hit_of_two_collisionRows_capCross_normalForm`
(`FrontierLiveClosure.lean:14056`) is not constructible from the target
inputs

```lean
(Q : RetainedOmissionAllLargeNormalForm P)
(G : TriApexAllLargeContext D S)
```

without new global premises.  It belongs to the *symmetric two-collision*
branch, whereas `Q` is explicitly the surviving *directed-omission* branch.

## Hypothesis map

| Candidate input | Available from `Q` / `G`? | Notes |
| --- | --- | --- |
| one `RetainedInteriorBlockerCollision R` (`P`) | **No** | `Q` contains an `OrientedRetainedCommonDeletion` whose two retained sources have `blockers_ne`; it is not an equal-blocker collision. |
| a second `RetainedInteriorBlockerCollision Rρ` at `ρ ≠ radius` | **No** | Neither Q arm supplies a second frontier/radius, a collision packet, or distinct-radius data. |
| exact-four and exact-two facts for both radii | **No** | Q gives first-radius membership of its kept/deleted sources, but no class-cardinality equalities; G only gives cap lower bounds and apex richness. |
| tri-apex all-large residual chain `B,L,N,T` | **No (only flattened consequences)** | G retains `cap_card_ge_six`, indexed richness, the cover cardinality bound, and no-three-apex-cover; it cannot be inverted to the dependent residual witnesses required by the candidate. |
| disjoint pairs, distinct actual blockers, four cross omissions, opposite localized cycles, final cap-eight/cross split | **No** | Q provides one oriented common-deletion packet (and, in the reverse-hit arm, one fresh packet), not the symmetric two-collision rectangle/cycles. |

## First missing antecedent

The first parameter after the shared frontier data is already unavailable:

```lean
(P : RetainedInteriorBlockerCollision R)
```

at `FrontierLiveClosure.lean:14061`.  This is not merely an unproved
projection: the Q-normal form starts from `OrientedRetainedCommonDeletion`
(`:6793` or `:6802`), whose `blockers_ne` field is part of the directed
omission data.  A collision would need two (possibly entirely new) sources
with equal actual blockers, and cannot be obtained by reusing Q's oriented
source pair.

## Direct next producer

No existing source producer bridges this branch change.  The useful loud
producer to add/target is therefore the direct normal-form theorem

```lean
exists_three_hit_of_retainedOmissionAllLargeNormalForm
  (Q : RetainedOmissionAllLargeNormalForm P)
  (G : TriApexAllLargeContext D S) :
  ∃ i x hx r, ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
    3 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
      (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)).card
```

It has exactly the positive three-hit conclusion needed by the E1 core,
without falsely routing an omission survivor through a collision-only
coordinator.  A narrower intermediate theorem may be named
`exists_two_distinctRadiusBlockerCollisions_of_retainedOmissionAllLargeNormalForm`,
but it must produce genuinely new collision sources and all the symmetric
normalization data; Q/G alone do not provide it.

## Source locations inspected

- Normal form: `FrontierLiveClosure.lean:6786-6824`
- Flattened tri-apex context: `FrontierLiveClosure.lean:6855-6869`
- Candidate: `FrontierLiveClosure.lean:14056-14123`
- Collision structure: `RetainedStrictInteriorPairSelector.lean:69-85`
- Oriented directed-omission packet: `RetainedMatchingLargeCapConsumer.lean:203-225`
