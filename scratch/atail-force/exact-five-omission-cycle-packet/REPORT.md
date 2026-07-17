# Exact-five physical actual-critical omission-cycle packet

Date: 2026-07-17

Status: **PROMOTED TO PRODUCTION; KERNEL-CHECKED SOURCE-EXACT CYCLE.**

The production home is
`ATail/LargeCapUniqueFivePhysicalOmissionCycle.lean`. Production additionally
contains the exhaustive mutual-omission versus all-reverse-positive split
used by the next direct geometric consumer.

This lane turns the production per-source omission successor into the honest
finite recurrent normal form.  It proves a genuine source-exact cycle of
period between two and five.  It does not claim that the cycle is
contradictory.

## Theorem-bank preflight

Before adding the packet, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- indexed Lean search for finite source-exact critical-row omission cycles;
  and
- the existing cycle bank under `scratch/atail-force/r-full-parent-entry/`
  and `scratch/atail-force/r-actual-blocker-transition/`.

The closest banked object is
`SourceExactMinimalActualBlockerCycle`.  Its transition is definitionally the
actual-blocker map

```text
q |-> H.centerAt q
```

whereas the production theorem used here chooses a physical source `w`
*omitted by* the actual critical row at `q`.  Therefore that structure cannot
be instantiated directly.  This file adapts its finite-orbit/minimal-period
normalization to the correct source-to-source omission map instead of
conflating the omitted source with the blocker center.

No indexed theorem-bank consumer closes the resulting cycle.

## Exact production input

The construction starts from

```lean
theorem
    ATailLargeCapUniqueFivePhysicalOmissionSuccessor.
      exists_distinct_physicalInterior_survives_actualBlocker
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (q : ℝ²)
    (hqPhysical :
      q ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2) :
    ∃ w : ℝ²,
      w ∈ SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2 ∧
      w ≠ q ∧
      HasNEquidistantPointsAt 4 (D.A.erase w)
        (H.centerAt q ...)
```

The reverse direction of
`cross_deletion_survives_iff_not_mem_selected_support` recovers the exact
omission from the returned deletion survival.

## Exact new theorem surface

The finite physical vertex set is

```lean
def physicalVertices (profile) : Finset ℝ² :=
  SelectedClass D.A S.oppApex2 profile.radius ∩
    S.capInteriorByIndex S.oppIndex2
```

and is proved to have cardinality at least three.

The total transition retains, at every source, the actual selected row and
actual blocker:

```lean
structure PhysicalActualCriticalOmissionTransition
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) where
  successor : PhysicalVertex profile → PhysicalVertex profile
  successor_ne : ∀ q, successor q ≠ q
  successor_not_mem_actualCriticalSupport :
    ∀ q,
      (successor q).1 ∉
        (H.selectedAt q.1 (PhysicalVertex.mem_A q))
          .toCriticalFourShell.support
  successor_deletion_survives_actualBlocker :
    ∀ q,
      HasNEquidistantPointsAt 4 (D.A.erase (successor q).1)
        (H.centerAt q.1 (PhysicalVertex.mem_A q))
```

The canonical cycle is:

```lean
structure PhysicalActualCriticalOmissionCycle
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) where
  transition : PhysicalActualCriticalOmissionTransition H profile
  start : PhysicalVertex profile
  entryTime : ℕ
  period_two_le :
    2 ≤ Function.minimalPeriod transition.successor
      ((transition.successor^[entryTime]) start)
```

The main constructor is exactly:

```lean
theorem nonempty_physicalActualCriticalOmissionCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (PhysicalActualCriticalOmissionCycle H profile)
```

The checked projections prove:

- `2 ≤ K.period` and `K.period ≤ 5`;
- canonical cycle sources are injective in their `Fin K.period` index;
- every source is in `D.A`, the same exact-five physical radius class, and
  the same strict physical cap interior;
- each edge target is distinct from its source;
- each edge target is omitted from the source's actual selected critical
  support;
- deleting each edge target preserves K4 at the source's actual blocker;
- every actual blocker differs from the physical apex;
- consecutive actual blockers are distinct; and
- consecutive actual selected supports intersect in at most two points.

Thus the packet retains the common exact-five radius/cap class and the actual
critical-map provenance simultaneously.  The period upper bound uses only
the injection of cycle sources into the ambient radius class of cardinality
five.

## First missing consumer field

The first exact field missing for reuse of the existing
`SourceExactMinimalActualBlockerCycle` consumers is

```lean
∀ i,
  (K.source (K.successorIndex i)).1 =
    H.centerAt (K.source i).1 (PhysicalVertex.mem_A (K.source i))
```

Equivalently, one would need the actual blocker of every cycle source itself
to be the chosen next physical strict-cap source.  The production theorem
does not say this: it says that deleting the next source preserves K4 *at*
that blocker.  Conflating these roles would reverse the actual implication.

The nearest terminal U5 row sink is not a safe way to manufacture this
missing field.  It would require two distinct additional physical-class hits
in one actual row; the checked sibling boundary
`actualCriticalRow_otherPhysicalInterior_inter_card_le_one` proves that such
an antecedent is already impossible.  A terminal continuation must instead
add a genuinely joint geometric consumer on this same cycle, such as a
globally anchored ordered-cap no-wrap fact or an equally concrete
source-indexed cross-incidence consumed immediately by a valid sink.

## Validation

The file was checked against the current production import graph with:

```bash
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/exact-five-omission-cycle-packet/\
ExactFiveOmissionCyclePacket.lean
```

The command exited successfully.  Every printed declaration closes over
exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, `sorry`, `admit`, or `native_decide` in
the file.
