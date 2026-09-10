# Math Skeptic Audit: finite-nine N4 cap containment

**Target**: `submissions/finite-nine-child-cap-containment/platform/Solutions/Sol_Erdos9796FiniteNine_cap_containment.lean`  
**Date**: 2026-09-09  
**Verdict**: NEEDS WORK  
**Claims audited**: 5

## Summary

The platform accepted proof `2ab7afe0-25de-4ecb-b326-1bcb63a31b23` and reports theorem status
`Proved`. The local transitive axiom audit still reports `sorryAx`, so the workspace is not
source-clean under the strict local trust profile. The `sorryAx` comes from offline statement
mirrors for accepted dependencies, rather than from the generated solution text.

## Findings

### F1: N4c form classification
- **Location**: solution:587, solution:730, solution:871
- **Quote**: `theorem n4c_forms_v1` (and the corresponding `n4c_forms_v2`, `n4c_forms_v3`)
- **Stated label**: implicit Lean theorem
- **Evidence present**: `lake-build Solutions.Sol_Erdos9796FiniteNine_cap_containment` passed with 8758 jobs
- **Actual label**: PROVEN, Lean-formalized conditional on imported theorem mirrors
- **Verdict**: CLARIFY
- **Reason**: the local theorem environment includes statement-only imported support, so the
  kernel closure is not source-clean.

### F2: N4d exclusion constructors
- **Location**: solution:1087, solution:1098, solution:1109
- **Quote**: `theorem n4dExcludes_v1_of_forms` (and the corresponding v2 and v3 theorems)
- **Stated label**: implicit Lean theorem
- **Evidence present**: each theorem destructures its corresponding `n4c_forms` disjunction and
  applies the three form hypotheses
- **Actual label**: PROVEN, Lean-formalized conditional on imported theorem mirrors
- **Verdict**: CLARIFY
- **Reason**: the constructors themselves contain no placeholder, but their transitive inputs
  include the offline `sorryAx` boundary.

### F3: N4e cap containment bridge
- **Location**: solution:1120
- **Quote**: `theorem n4eCapContainment_of_n4c_n4d`
- **Stated label**: implicit Lean theorem
- **Evidence present**: three explicit `by_contra` branches apply `hExcl1`, `hExcl2`, and `hExcl3`
- **Actual label**: PROVEN, Lean-formalized conditional on imported theorem mirrors
- **Verdict**: CLARIFY
- **Reason**: the bridge is fully elaborated, while the final closure still inherits the local
  dependency mirror axioms.

### F4: Public solution wrapper
- **Location**: solution:1147-1159
- **Quote**: `theorem solution ... : S.N4eCapContainment`
- **Stated label**: implicit Lean theorem
- **Evidence present**: audit build prints the target and reports axioms
  `[propext, sorryAx, Classical.choice, Quot.sound]`
- **Actual label**: PROVEN, Lean-formalized conditional on accepted inputs
- **Verdict**: DOWNGRADE TO NEEDS WORK
- **Reason**: `sorryAx` is present in the local transitive closure even though platform verification
  accepted the proof using the accepted dependency records.

### F5: Source hygiene
- **Location**: generated solution, whole file
- **Quote**: generator forbidden-token scan
- **Stated label**: source contains no proof or compiler-trust escape
- **Evidence present**: generator `--check`, Ruff, and explicit forbidden-token scan all pass
- **Actual label**: PROVEN as a source-level property
- **Verdict**: OK
- **Reason**: no `sorry`, `sorryAx`, native/compiler trust, `unsafe`, `partial`, external
  implementation, or named axiom token occurs in the generated source.

## Weasel words

No flagged proof-context weasel words occur in the target explanation or generated proof. The
project explanation uses concrete evidence and identifies the dependency boundary.

## Scope conflation

The report distinguishes source-level hygiene from transitive trust closure. Platform verification
is recorded separately from the local mirror audit.

## Lean sorry graph

The audit build reports `sorryAx` through statement-only mirrors of `n4e_core`,
`n4d_formb_branch`, Form A v1, Form B v1, Form B v2, Form C v1, and cyclic forms, together with
their offline mathematical theorem mirrors. No `sorryAx` token appears in the generated solution.

## Upgrade drift

Platform acceptance is recorded in `validation.json` and `provenance.md`. The local strict-trust
label remains limited by the offline dependency mirrors.

## Required before CERTIFIED

To upgrade the local strict-trust verdict, replace the statement-only dependency mirrors with
proof-bearing accepted theorem modules and rerun the transitive axiom audit. Platform verification
itself is complete and accepted.
