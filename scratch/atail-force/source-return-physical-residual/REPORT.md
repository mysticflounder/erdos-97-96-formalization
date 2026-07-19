# Source-return physical residual consumer

Date: 2026-07-17

Status: **KERNEL-CHECKED REDUCTION TO ROBUST PHYSICAL SECOND APEX OR
PROTECTED SWAPPED FA-UNIQ4. NO DIRECT `False`; NO PRODUCTION `sorry` CLOSED.**

## Scope

This lane owns only:

- `SourceReturnPhysicalResidual.lean`;
- this report.

No production, plan, generated, protected FA-UNIQ, `surplusM44`,
card-five-consumer, or shell-curvature file was edited.

## Required theorem-bank preflight

Before deriving the consumer I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean searches for physical second-apex critical rows, joint
  deletion, support-disjoint exact shells, critical-map rows, cap/MEC
  localization, and common-deletion consumers.

No bank theorem directly refutes the source-return physical endpoint. The
reusable exact consumers are already present in the current scratch and
production stack:

- `secondApexCritical_reorients_to_firstApexUniqueFour` consumes a prescribed
  critical row at the physical second apex and constructs the protected
  swapped unique-card-four frontier;
- `fullyDeletionRobustAt_of_two_disjoint_selectedFourClasses` consumes two
  support-disjoint rows at one center; and
- `nonempty_physicalSecondApexCriticalResidual_of_not_robust` turns the exact
  negation of robustness back into a prescribed critical row.

The U5 families and `u1TwoLargeCapObstruction` still require named incidences
or metric equalities not supplied by these physical leaves. They are not used.

## Exact checked reduction

The stopped predecessor exposes four constructors in

```text
RetainedSourceReturnPhysicalSecondApexOutcome W:
  firstCritical
  secondCritical
  jointDoubleDeletion
  disjointExactShells.
```

`SourceReturnPhysicalResidual.lean` proves that all four constructors reduce
to exactly two already named continuations:

```text
FullyDeletionRobustAt D S.oppApex2
or
Nonempty (SwappedFirstApexUniqueFourFrontier D S H).
```

The exported theorem is:

```lean
sourceReturn_secondApexRobust_or_swappedUniqueFour
```

with the motive-valued closure interface:

```lean
false_of_sourceReturnPhysicalConsumers
```

### Critical leaves

Both `firstCritical` and `secondCritical` carry an exact
`PhysicalSecondApexCriticalResidual`. Its `shell` and `deletion_blocked`
fields are definitionally the hypotheses of
`secondApexCritical_reorients_to_firstApexUniqueFour`. Therefore these leaves
are not new physical-residual consumers: they are the protected swapped
FA-UNIQ4 branch.

### Disjoint-exact-shell leaf

The two critical selected four-classes have the same center
`S.oppApex2` and support-disjoint supports. Their selected-four projections
therefore construct

```text
FullyDeletionRobustAt D S.oppApex2
```

directly. No cap-cardinality inference or finite mining is needed after the
support-disjointness theorem has landed.

### Joint-double-deletion leaf

Joint double deletion is not itself full single-deletion robustness. The
honest complete split is on the exact predicate
`FullyDeletionRobustAt D S.oppApex2`:

- the positive arm is the robust frontier;
- on the negative arm,
  `nonempty_physicalSecondApexCriticalResidual_of_not_robust` supplies an
  exact prescribed critical row, which again reorients to swapped FA-UNIQ4.

This is an exhaustive implication, not a claim that joint double deletion
alone implies robustness.

## Route correction

The source-return physical endpoint is no longer a four-consumer research
surface. It has only the same two dependencies already present elsewhere in
the parent route:

1. the robust physical-second-apex consumer; and
2. the protected swapped FA-UNIQ4 eliminator.

In particular:

- `PhysicalSecondApexCriticalResidual` should be recorded as **routed to
  swapped FA-UNIQ4**, not as an unconsumed leaf;
- the disjoint-shell leaf should be recorded as **robust**, not as a new
  exact-shell contradiction target; and
- the joint-double-deletion leaf needs no bespoke direct-`False` theorem
  before the robust/FA-UNIQ4 split.

The robust continuation remains genuinely open. Existing checked work
classifies it by large radius versus two disjoint radii and then by global
minimal-deletion outcomes; neither marginal cap capacity nor blocker-map
connectivity closes it. This checkpoint does not change that status.

## Validation

The predecessor and this module were freshly compiled from current source.
The final invocation used the checked scratch olean for the fixed-surplus
swap and exited successfully. All four exported theorem checks report only:

```text
propext, Classical.choice, Quot.sound
```

The owned Lean source contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration.
