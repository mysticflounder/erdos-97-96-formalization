# Full-parent exact-five assembler

Date: 2026-07-18

Status: **KERNEL-CHECKED SCRATCH ASSEMBLER.** The production route from
`L : FrontierLargeOppositeCapsBiApexRobustResidual B` now elaborates through
the physical-radius classification, robust-large-radius reduction,
exact-five continuation, total physical omission transition, global
mutual/all-reverse split, exact period-three cycle, and shared cap order.
No production `sorry` is closed by this scratch result.

## Checked production trace

The theorem

```lean
exactTwoFourRadii_or_largeRadiusCommonDeletion_or_exactFiveRelation L
```

proves the following exhaustive source-level route.

```text
full L
  -> two distinct exact-four physical-apex radii
  or large physical-apex radius
       -> generic common-deletion packet
       or exact-five profile + origin-tagged continuation
            -> arbitrary mutual-omission pair
            or total all-reverse transition
                 + exact period-three cycle
                 + both continuation sources on that cycle
                 + one shared physical-cap order
```

The assembler visibly retains the original `L`, hence the original
`CriticalPairFrontier`, common-deletion parent, both robustness facts, both
cap-six bounds, minimality, and `noM44`. The exact-five profile radius is
proved equal to the large-radius parent radius.

The all-reverse packet is:

```lean
FullParentExactFiveAllReverseData L profile continuation
```

It stores the total transition and the global two-source relation, not only
an eventual cycle relation. Its cycle has period exactly three, starts at
the first continuation source, contains the second continuation source, and
uses the same concrete `CriticalShellSystem H`. It also stores production
`PhysicalActualCriticalOmissionTransitionSharedCapOrder` for that same total
transition. After the latest production promotion it additionally stores
the actual

```lean
FirstApexShellRolePacket F0 R
```

constructed by `nonempty_firstApexShellRolePacket`, so the original-frontier
first-apex rows and the total exact-five transition are now present in one
checked interface.

## Exact all-reverse theorem slot

The smallest terminal occurrence exposed by the checked assembly is:

```lean
FirstApexCoRadialTransitionReversePairOccurrence A
```

which unfolds to

```lean
exists q a b,
  a ≠ b ∧
  a ∈ transitionReverseOutsidePair A.transition q ∧
  b ∈ transitionReverseOutsidePair A.transition q ∧
  dist S.oppApex1 a = dist S.oppApex1 b
```

The existing production theorem

```lean
false_of_transitionReverseOutsidePair_coRadial_firstApex
```

consumes exactly this occurrence. The scratch theorem

```lean
false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence
```

checks the complete adapter to `False`; no additional row fields, slot
normalization, or local packet are missing after the occurrence lands.

The recommended next producer uses the newly productionized shell-role
extractor and is more source-directed:

```lean
theorem exists_transitionReverseOutsidePair_subset_firstApexSelectedRow
    (A : FullParentExactFiveAllReverseData L profile continuation) :
    exists q,
      transitionReverseOutsidePair A.transition q ⊆
          A.firstApexRoles.retainedRow.support ∨
        transitionReverseOutsidePair A.transition q ⊆
          A.firstApexRoles.doubleRow.support
```

This statement is **OPEN / CONJECTURAL**. The interface and its complete
consumer are not conjectural: the scratch declarations

```lean
FirstApexNamedRowTransitionReversePairOccurrence
firstApexCoRadialOccurrence_of_namedRowOccurrence
false_of_fullParentExactFiveAllReverseData_of_namedRowOccurrence
```

are proved and kernel-checked. Either containment makes the pair co-radial
from `S.oppApex1`, so the existing ordered-cap terminal closes immediately.

Consequently the load-bearing all-reverse producer should be stated at the
full-parent packet above, not at bare transition, cycle, selected-row, or
linear Kalmanson level. Its proof may use the retained original frontier,
MEC/cap geometry, minimality, `noM44`, and the complete critical map.

## Mutual-omission status

The current production global split returns

```lean
PhysicalActualCriticalMutualOmissionPair H profile
```

between arbitrary physical vertices. This is not the older
cycle-indexed `PhysicalActualCriticalMutualOmissionEdge K` used by the
scratch criss-cross and mutual-global-cap reductions.

No production declaration consumes the arbitrary-pair type; repository and
indexed-corpus searches found only its definition and constructor theorem.
The older cycle-edge scratch route is not a terminal anyway: its strongest
checked output is a same-cap common-deletion/equal-blocker-shell split whose
positive shared-outside-pair or placement consumer is still missing.

Therefore the mutual arm is **not already closed or protected**. It remains
a second direct theorem slot, represented by:

```lean
FullParentExactFiveMutualData L profile -> False
```

in the thin dispatcher

```lean
false_of_fullParentExactFive_of_relationConsumers
```

This does not duplicate the protected first-apex card-five
`CardFiveCapOrMutualFields` lane: that theorem is centered at
`S.oppApex1`, requires off-surplus class points and specific cap-local or
reciprocal incidences, and does not accept the physical exact-five arbitrary
mutual pair produced here.

## Other siblings

The full trace also confirms that exact-five is not the whole robust parent.
Before it, production retains:

1. `PhysicalSecondApexExactTwoFourRadiusResidual`, a separate live surface;
2. a generic physical-second-apex common-deletion packet, which current
   audits classify as a robustness recurrence unless a nonreturn theorem is
   added.

The present file neither claims nor assumes consumers for those siblings.

## Theorem-bank preflight

Before drafting the assembler, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches covered exact-five reverse outside pairs,
mutual omissions, critical-pair frontiers, and second-center consumers. The
nearest terminal was the production first-apex co-radial reverse-pair
theorem used above. The sibling `u1TwoLargeCapObstruction` remains a
seven-equality consumer and does not classify either relation arm.

## Validation

The scratch file was checked against the current production graph with:

```bash
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/parent-exactfive-assembler/\
ParentExactFiveAssembler.lean
```

The command exited zero with no linter warnings. The displayed axiom checks
for the full trace, exact relation split, named-row-to-co-radial adapter,
all-reverse terminal adapter, and thin dispatcher report exactly:

```text
propext, Classical.choice, Quot.sound
```

The file contains no `sorry`, `admit`, declaration-level `axiom`,
`native_decide`, or `unsafe` declaration.
