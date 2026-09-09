# Math Skeptic Audit: finite-nine-modular

**Target**: `prove2me/submissions/finite-nine-modular/`
**Date**: 2026-09-08
**Verdict**: NEEDS WORK
**Claims audited**: 8

## Summary

The packet accurately says that it is not upload-ready and labels all nine child
theorem declarations as sketches. Its source custody, extraction counts, hashes,
cut sizes, and DAG have independent computational checks. It is not certified as
a Prove2Me proof: the child declarations contain `sorry`, their wrapper statements
have not been formally related to the authenticated source declarations, and the
root file does not itself display the sketch label carried by its imports.

## Findings

### F1: Root's direct no-`sorry` check does not cover imported sketches

- **Location**: `README.md:28`
- **Quote**: "`Sol_Erdos9796Mission_finite_nine_exclusion.lean` is the 1,482-byte final reduction. It imports the child nodes, contains no `sorry`, and reconstructs the same endpoint assembly as `Problem97.FiniteN9Closure`."
- **Stated label**: Implicitly a completed final reduction.
- **Evidence present**: The file has no literal `sorry`, but imports nine theorem stubs whose bodies are `by sorry`; the wrapper stack has not elaborated.
- **Actual label**: CONJECTURED proof port, supported by a source-proof correspondence sketch.
- **Verdict**: CLARIFY
- **Reason**: Direct textual absence of `sorry` is narrower than transitive proof closure. The root file must be visibly marked `SKETCH — NOT PROMOTABLE` until all child proofs elaborate and the final root passes an axiom audit.

### F2: “Exact” wrapper statements are not yet mechanically checked

- **Location**: `README.md:25`
- **Quote**: "`platform/Theorems/` contains the nine exact candidate theorem stubs."
- **Stated label**: Exact statement correspondence.
- **Evidence present**: The generator checks 13 source declaration headers for equality between two source trees, but it does not compare those headers with the manually authored wrapper statements. The shell wrapper, for example, changes a source constructor returning `FiniteEndpointShell A` into a theorem returning `Nonempty (FiniteEndpointShell A)`.
- **Actual label**: CONJECTURED interface correspondence pending Lean elaboration of explicit adapters.
- **Verdict**: CLARIFY
- **Reason**: The wrappers appear intentionally chosen and preserve the needed root information, but source-to-wrapper correspondence is not established by the current validation.

### F3: Source-fragment checks establish custody, not proof closure

- **Location**: `README.md:21`
- **Quote**: "No fragment contains `sorry`, native reduction, `unsafe`, `implemented_by`, or `extern` markers."
- **Stated label**: EMPIRICALLY VERIFIED textual property.
- **Evidence present**: Regeneration and an independent recursive text scan over the nine fragments.
- **Actual label**: EMPIRICALLY VERIFIED for the retained fragment bytes only.
- **Verdict**: OK
- **Reason**: The scope is explicit. The README separately requires `#print axioms` on each eventual child and the root, so it does not conflate marker scanning with a transitive trust audit.

### F4: Extraction and topology claims are bounded computational checks

- **Location**: `README.md:8`
- **Quote**: "The generator authenticates the two retained live snapshots, splits the larger failed solution into all 87 original `Batch3N9` module units, and cross-checks the 42 N9 source modules..."
- **Stated label**: EMPIRICALLY VERIFIED artifact claim.
- **Evidence present**: Deterministic generator, pinned snapshot hashes, sequential section-envelope checks, per-file hashes, and an independently reproduced two-run aggregate.
- **Actual label**: EMPIRICALLY VERIFIED on the two retained snapshots and the 42 selected source modules.
- **Verdict**: OK
- **Reason**: The finite scope and evidence are stated precisely.

### F5: Migration source custody is now accurately limited

- **Location**: `README.md:61`
- **Quote**: "The Lean 4.33.1 migration sources are untracked files in that workspace."
- **Stated label**: EMPIRICALLY VERIFIED custody limitation.
- **Evidence present**: Git object lookup and per-file hashes in `source-inventory.json`.
- **Actual label**: EMPIRICALLY VERIFIED.
- **Verdict**: OK
- **Reason**: The packet no longer implies that the workspace commit alone reproduces those source files.

## Weasel words

No proof-context weasel words were found.

## Scope conflation

The remaining scope risk is F1: the direct root file contains no `sorry`, while
its imported child declarations do. `validation.json` correctly records only
`root_solution_contains_sorry`; it must not be read as a transitive closure check.

## Lean sorry graph

The nine child theorem stubs each contain one deliberately labeled `sorry`. The
root has no direct `sorry` but depends on all nine. No theorem in this packet is
currently promotable.

## Required before CERTIFIED

1. Put the sketch/non-promotable label in the root solution itself.
2. Elaborate explicit source-to-wrapper adapters for all nine public statements.
3. Replace all nine child `sorry` bodies with elaborated proof solutions in DAG order.
4. Elaborate the root and audit every transitive axiom closure.
5. Preserve durable custody for the migration sources or rebuild from the tracked tree.
6. Obtain the project-required independent promotion verification before upload.

## Post-audit corrections

The packet generator now places `SKETCH — NOT PROMOTABLE` directly in the root
solution, and the README now calls the nine wrappers fixed *candidate*
statements and distinguishes direct from transitive absence of `sorry`. Findings
F1 and F2 are therefore clarified; the verdict remains NEEDS WORK until the
remaining formal elaboration, axiom-audit, custody, and promotion steps close.
