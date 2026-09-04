# Math Skeptic Audit: TwoRadiusDoublePartitionAdjacentGrid

**Target**:

- `lean/Erdos9796Proof/P97/ATail/TwoRadiusGridNestedEscapeTerminal.lean`

**Date**: 2026-09-03

**Lane base**: `14edf89b66ff1f3582956707074216b2b61b8e56`

**Verdict**: CERTIFIED for the scoped nested-escape terminal; BLOCKED for the
requested adjacent-grid closing theorem

**Claims audited**: 2 public Lean declarations and 3 promotion gaps

## Summary

The target module proves the source-neutral algebraic contradiction produced by
the existing zero-cut assembly. Its two public declarations pass the governed
`lake-build`, and direct axiom probes report only `propext`,
`Classical.choice`, and `Quot.sound`. The module contains no `sorry`, custom
axiom, native computation, solver call, or external-evidence dependency.

This audit does not certify
`false_of_twoRadius_doublePartition_adjacentGrid`. That declaration is absent.
Two independent geometry audits found missing order/sign adapters, and an
earlier trace audit found a selected-class support gap. The new module is a
standalone helper until a named downstream theorem consumes it.

## Findings

### F1: Direct-or-mirror packet contradiction

- **Location**: `TwoRadiusGridNestedEscapeTerminal.lean:297`
- **Declaration**:
  `Problem97.ATailTwoRadiusGridNestedEscapeTerminal.false_of_nestedEscape_packet`
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The theorem consumes exactly the two disjuncts returned by
  `twoRadiusGrid_zeroCut_assembly`. In the direct branch it derives the missing
  signed-area premise from positive scaled nesting. In the mirror branch it
  transports both reflected pairs and reverses the relevant determinant sign.
  The private scalar kernels and their point adapters match the previously
  checked source-heavy proof bodies.

### F2: Source-neutral zero-cut terminal

- **Location**: `TwoRadiusGridNestedEscapeTerminal.lean:370`
- **Declaration**:
  `Problem97.ATailTwoRadiusGridNestedEscapeTerminal.false_of_twoRadiusGrid_zeroCut_nestedEscape`
- **Actual label**: PROVEN — Lean-formalized under its explicit hypotheses.
- **Verdict**: OK.
- **Reason**: The wrapper forwards the existing assembly assumptions unchanged
  and adds only the shared smaller-radius coordinate norm needed by F1. Its sole
  import is `TwoRadiusGridZeroCutAssembly`; it does not import the source-heavy
  frontier module.

### F3: Requested index transport

- **Candidate**: apply the zero-cut assembly at `S.oppIndex2`, or at arbitrary
  `i : Fin 3`.
- **Actual label**: NOT PROVEN.
- **Verdict**: BLOCKER.
- **First missing result**: a generalized boundary-sign packet covering the
  four order branches not represented by the current `oppIndex1` direct/mirror
  cases.
- **Reason**: the low geometric kernels are indexed, but
  `DirectBoundaryBlocks`, `MirrorBoundaryBlocks`, the zero-cut block producer,
  and the orientation premise of `boundary_sign_packet` use fixed
  `oppIndex1`/`oppIndex2` roles. A textual index swap is invalid.

### F4: Unbalanced shell trace

- **Candidate**: exclude the surviving `2+0` strict-interior shell trace by a
  strict Kalmanson cancellation.
- **Actual label**: NOT PROVEN.
- **Verdict**: BLOCKER.
- **First missing antecedent**:
  `ConvexCyclicOrder D.A S.oppApex2 X x b` for the side-aware adjacent-cap hit
  `X`, strict-cap point `x`, and shell center `b`.
- **Reason**: center localization yields only
  `b ∈ S.capInteriorByIndex S.oppIndex2`. The missing adapter must combine
  the direct/mirror zero-cut blocks, the correct adjacent side, a cyclic recut
  at the apex, and shell distinctness such as
  `CriticalFourShell.center_not_mem_support`. Once that cyclic order is
  supplied, the public strict Kalmanson theorem has the required inequality
  orientation.

### F5: Selected support and promotion boundary

- **Actual label**: NOT PROVEN.
- **Verdict**: BLOCKER for the requested closing theorem; non-blocking for F1
  and F2.
- **Reason**: `SelectedFourClass` controls a chosen four-point subset, while
  `ExactFourTwoRadiusAdjacentCapGrid` is stated for the full `SelectedClass`.
  A final adapter needs support equality, or the existing no-five-point
  hypotheses that derive it. Separately, the new source-neutral module has no
  named consumer, so it is not yet consumer-reachable under the promotion
  contract.

## Trust audit

- Governed build:
  `lake-build Erdos9796Proof.P97.ATail.TwoRadiusGridNestedEscapeTerminal`
  completed successfully with 8132 jobs.
- Both public declarations print the axiom set
  `[propext, Classical.choice, Quot.sound]`.
- A theorem-rooted `proof-blueprint spine` reports 0 open nodes among 201
  dependencies and kernel completion under the approved core axiom set.
- The target scan found no `sorry`, `admit`, custom `axiom`, `native_decide`,
  `unsafe`, `implemented_by`, `extern`, solver, or external-evidence mechanism.
- The copied scalar core was checked against the source-heavy proof body; no
  mathematical drift was found.

## Weasel words

None found in the scoped theorem labels or module documentation.

## Scope conflation

The requested adjacent-grid theorem must not be advertised from this lane. The
proved result begins after the zero-cut assembly has named all six geometric
roles and supplied its direct-or-mirror packet.

## Required before the adjacent-grid theorem can be certified

1. Prove the missing index-generic orientation/sign branches, or provide a
   dedicated `oppIndex2` assembly with the same trust guarantees.
2. Prove the side-aware cyclic-order adapter needed by the unbalanced shell
   cancellation.
3. Supply the bridge from each selected four-class support to the full radial
   selected class.
4. Add a named consumer and complete the normal promotion/ingress checks.
