# P97 Rigid221 card-18 v1 positive controls

**Status: ALL POSITIVE-CONTROL PUBLICATION GATES COMPLETE.**

Date: 2026-08-28

Lane: `rigid221-card18-v1-positive-controls-20260828`

Lane base: `6d0fcc389255ac24be267636abb8f7545d63bcb7`

## 1. Outcome

The published v1 `Valid` surface admits an explicit packet in each of the BI, U, and XV arms.
`Rigid221Card18PositiveControls.lean` checks all three packets in the Lean kernel and applies the
existing `armCnf_sat_iff` theorem to prove that every v1 arm formula has a satisfying assignment.

These packets are finite positive controls. They are not geometric source realizations, and their
existence does not close any Rigid221 source branch.

## 2. Reuse and consumer preflight

The current project index contains the generic `armCnf_sat_iff` theorem but no concrete theorem
inhabiting any of the three arm-specific validity subtypes. The new declarations therefore reuse
the existing formula correspondence and add only the missing closed witnesses.

The immediate consumers are the three applications of `armCnf_sat_iff`. The off-spine
`Rigid221Card18Aggregate` imports the positive-control module so routine Card18 replay keeps the
claims fresh. This checkpoint changes an epistemic state from unchecked satisfiability to three
kernel proofs; it does not reduce the publication proof spine.

## 3. Concrete packets

All labels below lie in `Fin 18`. The common roles are

```text
u=0, v=1, xu=2, xv=3, deleted=4,
source1=5, source2=6, deletedCenter=7,
actualCenter1=8, actualCenter2=9.
```

The common supports are

```text
selectedXvRow  = {0,3,10,11}
deletedCenterRow = {7,10,11,12}.
```

The BI support data are

```text
uB1={1,2,3,4}, uB2={5,6,7,8},
xvB1={0,1,2,4}, xvB2={5,6,7,8}.
```

The U crossed data are

```text
oppApex2=13,
K1={3,5,10,11}, K2={3,6,12,13}, BO={3,10,11,12}.
```

The XV crossed data are

```text
oppApex2=13,
K1={0,5,10,11}, K2={0,6,12,13}, BO={0,10,11,12}.
```

In each crossed packet, `actualCenter1=8` is absent from `BO`, so the required five-incidence
conjunction contains a false atom.

## 4. Checked declarations

The module exposes:

```lean
bi_v1_valid_nonempty
u_v1_valid_nonempty
xv_v1_valid_nonempty

bi_v1_armCnf_sat
u_v1_armCnf_sat
xv_v1_armCnf_sat
```

The packet-validity proofs use ordinary kernel `decide` after exposing the concrete abstract-packet
constructor. The formula theorems then use the valid-packet-to-model direction of
`armCnf_sat_iff`. This checkpoint introduces no external assignment, DIMACS artifact, enumerator,
certificate, solver result, `native_decide`, or compiler-trust boundary.

## 5. Scope and revised order

Version 1 is retained as a checked positive control and CEGAR seed. A DIMACS serializer for these
unchanged formulas would serialize formulas already proved satisfiable, so serializer and solver
work is postponed.

The next mathematical boundary is the live bi-survival common-deletion rectangle. Current source
already produces two common-deletion packets at the same centers, but the four row witnesses remain
independently chosen across deletion views. The next theorem must retain or derive one additional
source relation connecting the fixed-center views. Only after a source-derived consequence justifies
a stronger v2 finite projection should the project revise the formula and reconsider serialization.

The scratch candidate
`DPackageBank.criticalShell_erase_survives_iff_not_mem_support` led to the already-production theorem
`ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support`. The 2026-08-28
follow-up composes its forward direction with the packet-row identification theorems in
`PhysicalSecondApexCommonDeletion.lean`. The resulting acyclic
`BiSurvivalCanonicalRows.lean` interface carries both common-deletion packets, identifies the two
fixed-center row pairs with the same canonical source shells, and records their four endpoint
nonmemberships. The live bi-survival leaf consumes that stronger value. See
`docs/specs/p97-rigid221-bi-survival-canonical-rows-v1.md` for its statement, frontier measure, and
verification gates.

## 6. Acceptance gates

This checkpoint is publishable only after:

1. the focused positive-control module and aggregate build targets pass;
2. all six public theorem axiom closures contain no `sorryAx`, native, or external evidence;
3. source scans find no forbidden runtime or solver mechanism;
4. independent review checks every literal packet against the published 12/12/14 validity surface;
5. proof-blueprint confirms the module remains off the publication spine; and
6. exact-path staged hygiene passes with no foreign staged path.

## 7. Verification evidence

- Focused `lake-build` of `Rigid221Card18PositiveControls` passed with 10,886 jobs.
- Governed `lake-build` of `Rigid221Card18Aggregate` passed with 10,887 jobs.
- Independent semantic review checked the complete 12/14/12 atom surfaces and returned GO.
- Independent trust/import review returned GO and confirmed all six declarations remain off-spine.
- The three validity witnesses have axiom closure exactly `propext`, `Quot.sound`.
- The three formula theorems add only `Classical.choice` to that closure.
- The source scan found no forbidden trust/runtime mechanism and no Lean line over 100 columns.
- Commit `79cb6289c` publishes labeled and crossed custody v2 plus predicate coverage v4 without
  rewriting any historical artifact. Fresh kernel mines keep the 26/27 module tuples unchanged;
  only the `Rigid221SourceHeavy.lean` source row changes.
- The governed Card18 runner passes Ruff, all 348 historical tests in the pinned v3 snapshot, all
  131 live v2/v4 tests, and the 10,887-job aggregate build containing these positive controls.

The positive controls are verified as Lean declarations. Exact-path staged hygiene passes with
zero lane issues and no foreign staged path.
