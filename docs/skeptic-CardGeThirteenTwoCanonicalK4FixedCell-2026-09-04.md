# Math Skeptic Audit: CardGeThirteenTwoCanonicalK4FixedCell

**Target**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenTwoCanonicalK4FixedCell*.lean`
**Date**: 2026-09-04
**Verdict**: CERTIFIED
**Claims audited**: 8

## Summary

The four-module fixed-cell result is correctly scoped and Lean-formalized.
The external bundle transcription was independently checked over every finite
table entry.  Ordinary kernel reduction checks the two normalizers and all
108 static cancellation entries.  The final theorem's printed trust closure
contains only `propext`, `Classical.choice`, and `Quot.sound`.

## Findings

### F1: DR-rank transport and tables

- **Location**: `CardGeThirteenTwoCanonicalK4FixedCellData.lean:31`
- **Quote**: "Raw labels are converted to positions in the direct order `[2, 8, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7]`."
- **Stated label**: Implicit exact transcription.
- **Evidence present**: The bundle SHA-256 is
  `35e4cead03ce736e2c09d8a3c7bd55166b3dc8af23f89e13fe558ffdeeb2db1b`.
  An independent finite comparison checked the rank map, both support domains,
  both pair banks, all 63 joint term lists, and all 432 route entries.
- **Actual label**: EMPIRICALLY VERIFIED over the complete finite payload.
- **Verdict**: OK
- **Reason**: The evidence covers every table entry, and the module does not
  promote this custody claim to a general mathematical theorem.

### F2: Center-2 row-domain reduction

- **Location**: `CardGeThirteenTwoCanonicalK4FixedCellNormalizers.lean:57`
- **Quote**: "Every center-2 four-support either contains one of the eighteen certified pairs or is one of the twenty-seven residual supports."
- **Stated label**: PROVEN.
- **Evidence present**: Lean theorem `center2_pair_or_domain`, followed by
  `center2_normalize` at line 107 and the checked pair certificates.
- **Actual label**: PROVEN, Lean-formalized.
- **Verdict**: OK
- **Reason**: Ordinary `decide` exhausts all 495 four-subsets avoiding the
  challenged center; each discarded pair reaches the weighted soundness
  endpoint.

### F3: Center-5 row-domain reduction

- **Location**: `CardGeThirteenTwoCanonicalK4FixedCellNormalizers.lean:69`
- **Quote**: "Every center-5 four-support either contains one of the twenty-seven certified pairs or is one of the sixteen residual supports."
- **Stated label**: PROVEN.
- **Evidence present**: Lean theorem `center5_pair_or_domain`, followed by
  `center5_normalize` at line 142 and the checked pair certificates.
- **Actual label**: PROVEN, Lean-formalized.
- **Verdict**: OK
- **Reason**: The proof has the same complete 495-support scope and checked
  geometric elimination as the center-2 theorem.

### F4: Static sixty-three-entry bank

- **Location**: `CardGeThirteenTwoCanonicalK4FixedCellCertificateBank.lean:166`
- **Quote**: "Common center-2 support over every residual cell routed to one certificate."
- **Stated label**: PROVEN.
- **Evidence present**: `jointCenter2Core`, `jointCenter5Core`, their two fiber
  subset theorems, and `jointCertificate_check` at line 206.
- **Actual label**: PROVEN, Lean-formalized.
- **Verdict**: OK
- **Reason**: Choices and cancellation data are indexed by `Fin 63`, not by
  432 cells.  The generated BFS paths and greedy pairings are accepted only
  after the inherited checker verifies path endpoints, primitive steps, and
  both edge-multiset permutations.

### F5: Main fixed-cell terminal

- **Location**: `CardGeThirteenTwoCanonicalK4FixedCell.lean:65`
- **Quote**: "Main source-neutral fixed-cell terminal."
- **Stated label**: PROVEN.
- **Evidence present**: Lean theorem `false_of_twoCanonicalK4_fixedCell`.
- **Actual label**: PROVEN, Lean-formalized.
- **Verdict**: OK
- **Reason**: The theorem composes both exhaustive normalizers with the static
  joint bank and the generic strict-Kalmanson soundness theorem.

### F6: Scope is not overstated

- **Location**: `CardGeThirteenTwoCanonicalK4FixedCell.lean:14`
- **Quote**: "This is a fixed-cell theorem; source occurrence and mirror coverage are deliberately separate."
- **Stated label**: Fixed-cell only.
- **Evidence present**: The theorem accepts an already ordered positional
  boundary and explicitly supplied base/challenged row equalities.
- **Actual label**: PROVEN, Lean-formalized at the stated scope.
- **Verdict**: OK
- **Reason**: No source-level occurrence, raw-boundary transport, or mirror
  coverage is claimed.

## Weasel words

None found by the automatic scan.

## Scope conflation

None.  The module explicitly separates the fixed-cell terminal from source
occurrence and mirror coverage.

## Lean sorry graph

No `sorry`, `admit`, `native_decide`, `Lean.ofReduceBool`, `unsafe`, custom
`axiom`, `@[implemented_by]`, or `@[extern]` occurs in the four target modules.
The focused build prints only `propext`, `Classical.choice`, and `Quot.sound`
for the final theorems.

## Upgrade drift

The modules are new.  Every mathematical result asserted in their module and
declaration documentation is accompanied by a compiling theorem in the same
change.  The finite custody statement remains classified as empirically
verified.

## Required before CERTIFIED

None for the fixed-cell scope.
