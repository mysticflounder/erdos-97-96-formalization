# Math Skeptic Audit: ExactTwelveRigid221StaticBoundaryAdapter

**Target**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactTwelveRigid221StaticBoundaryAdapter.lean`
**Date**: 2026-09-04
**Verdict**: NEEDS WORK
**Claims audited**: 10

## Summary

The adapter is a source-clean Lean interface and its focused elaboration and
targeted project build pass, producing the adapter and boundary `.olean`
artifacts.  The build wrapper's later proof-blueprint resync reports an
unrelated foreign indexed declaration absent from its imported environment;
that index failure does not invalidate the successful Lean build.  The adapter
correctly exposes a conditional contradiction from a static terminal bank
indexed by every dispatched cell.  The file does not establish
that such a bank exists, that its clauses are authenticated, or that the
dispatched cells have terminal coverage.  Those missing obligations keep the
overall lane open.

## Findings

### F1: Conditional static-bank composition

- **Location**: `ExactTwelveRigid221StaticBoundaryAdapter.lean:12-16`
- **Quote**: "a sound static terminal bank for each dispatched cell contradicts the source branch"
- **Stated label**: Lean-formalized, conditional
- **Evidence present**: `false_of_source_namedNextRowStaticTerminalBank`; focused `lake env lean` exits 0; targeted `lake-build` completes the Lean build and emits both adapter `.olean` artifacts; a source-text `#print axioms` probe reports only `propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`, and `Quot.sound`.
- **Dependency audit**: The imported `exists_source_namedNextRowBoundaryJob` declaration was independently probed after the artifact refresh and reports the same axiom set, with no `sorryAx`.
- **Actual label**: PROVEN (Lean-formalized, conditional)
- **Verdict**: OK
- **Reason**: The theorem obtains the source-normalized boundary package and applies `false_of_terminalStaticNextRowSourceOrderBank` to the supplied static bank. Its hypotheses state the bank and terminal UNSAT results explicitly.

### F2: No terminal-bank or closure result

- **Location**: `ExactTwelveRigid221StaticBoundaryAdapter.lean:14-16`
- **Quote**: "It does not provide the bank, authenticate generated clauses, or claim closure of the live residual."
- **Stated label**: Explicit limitation
- **Evidence present**: The theorem accepts `bank`, `hencodable`, and `hterminal` as hypotheses; no declaration in this file constructs them.
- **Actual label**: PROVEN (Lean-formalized limitation by interface inspection)
- **Verdict**: OK
- **Reason**: The type exposes a conditional interface only. The static terminal consumer and the all-cell dispatch remain separate obligations.

### F3: Exact-twelve profile wrapper

- **Location**: `ExactTwelveRigid221StaticBoundaryAdapter.lean:87-122`
- **Quote**: "The same static-parent boundary interface with the exact-twelve cap profile supplied by the source normalization theorem."
- **Stated label**: Lean-formalized convenience wrapper
- **Evidence present**: `false_of_source_namedNextRowStaticTerminalBank_of_cardProfile`; focused `lake env lean` exits 0; a source-text `#print axioms` probe reports only `propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`, and `Quot.sound`.
- **Actual label**: PROVEN (Lean-formalized, conditional)
- **Verdict**: OK
- **Reason**: The wrapper obtains the source theorem's `(5,4,6)` cap profile and forwards its cardinality and interior equalities, while retaining the explicit next-row hypothesis and terminal-bank assumptions.

### F4: Static formula clause-count interface

- **Location**: `ExactTwelveRigid221StaticBoundaryAdapter.lean:38-45`
- **Quote**: "The static parent contributes its fixed clause count, while the bank adds one clause for each proof-carrying source-order cut."
- **Stated label**: Lean-formalized bookkeeping lemma
- **Evidence present**: `terminalStaticDimacs_length`; focused `lake env lean` exits 0.
- **Actual label**: PROVEN (Lean-formalized bookkeeping)
- **Verdict**: OK
- **Reason**: The proof reduces the list length to the parent clause-count theorem and the mapped bank length. It adds no terminal or coverage claim.

### F8: Positive-membership formula clause-count interface

- **Location**: `ExactTwelveRigid221StaticBoundaryAdapter.lean:47-65`
- **Quote**: "The positive-membership endpoint adds its 57 compiler implications and the single final blocking clause to the same frozen parent."
- **Stated label**: Lean-formalized bookkeeping lemma
- **Evidence present**: `terminalStaticPositiveMembershipDimacs_length`; focused `lake env lean` exits 0; the implication count is checked by `native_decide` and the parent count by `frozenParentClauseCount`.
- **Actual label**: PROVEN (Lean-formalized bookkeeping)
- **Verdict**: OK
- **Reason**: The proof expands the positive-membership formula, checks the compiler implication list has length 57, counts its one blocking clause, and reduces the result to `634917 + bank.length`. It adds no terminal or coverage claim.

### F9: Positive-membership endpoint literal-range interface

- **Location**: `ExactTwelveRigid221StaticBoundaryAdapter.lean:82-142`
- **Quote**: "all positive-membership endpoint literals should lie within the frozen parent’s 44,875 variables plus the three fresh variables"
- **Stated label**: Lean-formalized bookkeeping lemma
- **Evidence present**: `terminalStaticPositiveMembershipDimacs_lit_natAbs_le`; focused `lake env lean` exits 0; source-plus-probe compilation reports only the standard core dependencies plus native computation trust.
- **Actual label**: PROVEN (Lean-formalized bookkeeping)
- **Verdict**: OK
- **Reason**: The proof partitions parent, compiler, blocking, and bank clauses. It uses the parent bound 44,875, native-checked bounds for the 57 compiler clauses and blocking clause, and the learned-clause bound 42,560, then concludes the uniform bound 44,878. It adds no terminal or coverage claim.

### F10: Generic endpoint literal-range interface

- **Location**: `ExactTwelveRigid221StaticBoundaryAdapter.lean:143-163`
- **Quote**: "every literal in `terminalStaticDimacs` is bounded by `44875`"
- **Stated label**: Lean-formalized bookkeeping lemma
- **Evidence present**: `terminalStaticDimacs_lit_natAbs_le`; focused `lake env lean` exits 0; the source-plus-probe audit reports only the standard core dependencies plus native computation trust.
- **Actual label**: PROVEN (Lean-formalized bookkeeping)
- **Verdict**: OK
- **Reason**: The proof partitions the frozen parent and mapped bank clauses, applies the shared parent bound 44,875, and lifts the learned bank bound 42,560 to 44,875. It adds no terminal or coverage claim.

### F5: Learned-clause variable-range interface

- **Location**: `ExactTwelveRigid221StaticBoundaryAdapter.lean:47-73`
- **Quote**: "Every learned bank literal remains in the base-variable interval whenever its source candidate is admitted by the frozen candidate filter."
- **Stated label**: Lean-formalized bookkeeping lemma
- **Evidence present**: `learnedClause_lit_natAbs_le_baseNumVars`; focused `lake env lean` exits 0.
- **Actual label**: PROVEN (Lean-formalized bookkeeping)
- **Verdict**: OK
- **Reason**: The proof extracts an admitted candidate from list membership, applies the existing candidate-index and variable-range bounds, and reflects the signed literal through `Int.natAbs`. It does not assert bank validity or terminal UNSAT.

### F6: Cell-1 positive-membership consumer composition

- **Location**: `ExactTwelveRigid221StaticBoundaryAdapter.lean:124-179`
- **Quote**: "The same source boundary feeds the existing cell-1 positive-membership terminal consumer."
- **Stated label**: Lean-formalized conditional adapter
- **Evidence present**: `false_of_source_namedNextRowStaticPositiveMembershipBank`; focused `lake env lean` exits 0; source-plus-probe compilation reports only the standard core dependencies plus native computation trust.
- **Actual label**: PROVEN (Lean-formalized, conditional)
- **Verdict**: OK
- **Reason**: The theorem obtains the normalized boundary package and applies the existing positive-membership consumer with its specialized formula, bank, encodability, and per-cell UNSAT assumptions. It does not construct those assumptions or claim all-cell closure.

### F7: Cell-1 positive-membership profile wrapper

- **Location**: `ExactTwelveRigid221StaticBoundaryAdapter.lean:181-229`
- **Quote**: "The positive-membership endpoint with the exact-twelve cap profile supplied by the source normalization theorem."
- **Stated label**: Lean-formalized conditional convenience wrapper
- **Evidence present**: `false_of_source_namedNextRowStaticPositiveMembershipBank_of_cardProfile`; focused `lake env lean` exits 0.
- **Actual label**: PROVEN (Lean-formalized, conditional)
- **Verdict**: OK
- **Reason**: The wrapper obtains the `(5,4,6)` profile and second-cap interior equality from the existing source theorem, then forwards them to the positive-membership adapter. Its bank and per-cell UNSAT hypotheses remain explicit.

## Weasel words

None found in the proof explanation.

## Scope conflation

The file does not conflate a conditional bank consumer with a terminal-bank
construction or a live residual closure.

## Aggregate reachability

The adapter is now aggregate-reachable.  Commit `46f6216eb` adds its import to
`Erdos9796Proof.P97.ATail.FrontierLiveClosure`; the governed targeted build
completed all 12049 jobs, and a refreshed probe that imports the aggregate and
checks `terminalStaticDimacs_lit_natAbs_le` succeeds.  The earlier
`unknownIdentifier` result was produced before that import edge and against a
stale aggregate artifact; it is retained only as the pre-integration finding,
not as the current reachability status.

## Lean sorry graph

The target contains no `sorry`.  The audited target theorem and the imported
source-boundary theorem both passed source-text axiom probes with no `sorryAx`
or custom project axiom.  The `Lean.trustCompiler` marker is present through
native computation, so independent publication should retain the explicit
native trust audit.  The post-build blueprint resync was not clean: it failed
on an unrelated foreign indexed declaration absent from the imported
environment.

## Upgrade drift

No stronger label is introduced by this report or by the target file.

## Required before CERTIFIED

Provide an authenticated terminal bank for the dispatched cells, verify its
clause serialization and source witness, and establish the coverage needed by
the live coordinator.
