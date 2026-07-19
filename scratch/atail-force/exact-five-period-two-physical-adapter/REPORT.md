# Exact-five period-two parent reuse audit

Date: 2026-07-17

Status: **EXACT REUSE IDENTIFIED; NO NEW LEAN PROOF NEEDED.**

This lane initially targeted an arbitrary-apex generalization of
`ATailCriticalPairFrontier.blocker_centers_eq_of_first_apex_deletion_survives_of_mutual_cross_membership`.
The intended application was the period-two all-reverse arm of
`PhysicalActualCriticalOmissionCycle`: deletion survival at the common physical
apex plus reciprocal selected-support membership would force equal consecutive
actual blockers, contradicting `successor_actualBlockers_ne`.

That route is valid in principle but redundant.  A strictly stronger and
simpler source-clean theorem already exists in:

```text
scratch/atail-force/exact-five-reverse-membership-closure/ReverseMembershipClosure.lean
```

The reusable theorem is:

```lean
theorem period_ne_two_of_all_reverseMembership
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support) :
    K.period ≠ 2
```

On a two-cycle, the reverse membership on one edge is exactly the forward
omission forbidden on the other edge by
`PhysicalActualCriticalOmissionCycle.successor_not_mem_actualCriticalSupport`.
The proof therefore requires neither physical-apex deletion survival nor
blocker equality.  The same file immediately derives:

```lean
theorem three_le_period_of_all_reverseMembership ... : 3 ≤ K.period
```

Together with the production theorem `K.period_le_five`, this reduces the
all-reverse arm to periods three, four, and five.

## Parent-facing specialization

Production already exposes the exact-five cycle through:

```lean
E : ATailPhysicalOmissionCycleParentResidual.ExactFivePhysicalCycleParentResidual H F
```

whose field `E.cycle` has precisely the type consumed by the two scratch
theorems above.  Consequently the parent-facing results are definitional
specializations only:

```lean
theorem ExactFivePhysicalCycleParentResidual.cycle_period_ne_two
    (E : ExactFivePhysicalCycleParentResidual H F)
    (hreverse : ∀ i : Fin E.cycle.period,
      (E.cycle.source i).1 ∈
        (H.selectedAt (E.cycle.source (E.cycle.successorIndex i)).1
          (PhysicalVertex.mem_A
            (E.cycle.source
              (E.cycle.successorIndex i)))).toCriticalFourShell.support) :
    E.cycle.period ≠ 2 :=
  period_ne_two_of_all_reverseMembership E.cycle hreverse

theorem ExactFivePhysicalCycleParentResidual.cycle_period_ge_three
    (E : ExactFivePhysicalCycleParentResidual H F)
    (hreverse : ∀ i : Fin E.cycle.period,
      (E.cycle.source i).1 ∈
        (H.selectedAt (E.cycle.source (E.cycle.successorIndex i)).1
          (PhysicalVertex.mem_A
            (E.cycle.source
              (E.cycle.successorIndex i)))).toCriticalFourShell.support) :
    3 ≤ E.cycle.period :=
  three_le_period_of_all_reverseMembership E.cycle hreverse
```

These wrappers contain no new mathematics and should not be promoted before
their source theorem.  The checkpoint-worthy production change is instead:

1. promote `period_ne_two_of_all_reverseMembership` and
   `three_le_period_of_all_reverseMembership` from the reverse-membership
   scratch file into a production module imported by
   `PhysicalOmissionCycleParentResidual`;
2. add the parent-facing projection lemmas only if a downstream consumer
   benefits from their names;
3. leave the arbitrary-apex blocker-coincidence generalization for a consumer
   that genuinely needs it.

## Search and trust audit

The required preflight used `nthdegree docs search --lean` for the existing
first-apex blocker-equality theorem, physical-apex source-deletion survival,
successor blocker distinctness, and arbitrary-apex variants.  It found the
first three production declarations and no indexed arbitrary-apex version.
After that search, the local reverse-membership scratch theorem above was
identified as the stronger exact match.

The existing scratch report records a source-clean elaboration and axiom
closure consisting only of:

- `propext`;
- `Classical.choice`; and
- `Quot.sound`.

This lane independently rechecked the current source from the Lake root with:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/exact-five-reverse-membership-closure/ReverseMembershipClosure.lean
```

The command exited successfully.  Its inline `#print axioms` output confirmed
the same three standard axioms for both
`period_ne_two_of_all_reverseMembership` and
`three_le_period_of_all_reverseMembership`.  A focused source scan found no
`sorry`, no `axiom` declaration, and no `NonSurplusSwap` use.  The preferred
`lean4-skills-sorry-analyzer` wrapper was not installed on this host, so the
source scan and successful elaboration are the recorded no-`sorry` checks.

This lane intentionally leaves no duplicate `.lean` file, uses no `sorry`,
introduces no axiom, does not use `NonSurplusSwap`, and modifies no production
file.
