# Exact-11 V7 replay and bankability audit (2026-07-31)

Scope: read-only audit while `FiniteN11` is building.  This report separates
source-clean semantic fragments, external certificate verification, Lean
replay, and the source-to-valuation bridge.

## Current build bottleneck

The `FiniteN11` build is still active.  The active Lean target observed was
`G3ConvexFiveSliceLedger.lean` (about 20 minutes CPU, near 100% CPU).  The
already-built G3 slices have `.olean` files, while `G3ConvexFiveSliceLedger`,
the V6/V7 ledgers, `G3Checkpoint0ClauseBank`, and the S2O0 retained-core
modules were not yet built at the audit point.  The smallest next step is to
let this build reach the first actual failure (or the checkpoint bank), rather
than infer closure from the generated artifacts.

## G3 status

The completed G3 slice theorems audited were:

* `g3Checkpoint0_firstApexGlobalEqSlice_signed_sat`;
* `g3Checkpoint0_firstApexExactFiveSlice_signed_sat`;
* `g3Checkpoint0_duplicateCenterSlice_signed_sat`;
* `g3Checkpoint0_perpendicularBisectorSlice_signed_sat`.

Their transitive axiom prints contain `propext`, `Classical.choice`,
`Lean.ofReduceBool`, `Lean.trustCompiler`, and `Quot.sound`, but no `sorryAx`.
They are positive SAT-fragment lemmas: each says the geometric valuation
satisfies its retained slice.  They are bankable semantic components, not
standalone contradictions.

`G3Checkpoint0ClauseBank` is the actual consumer: it joins all 21 slices
(273017 signed clauses) and `false_of_g3Checkpoint0_clause_bank` applies the
complete replay theorem to derive `False`.  It cannot be called banked until
the remaining ledgers compile and its final theorem receives a focused
transitive axiom audit.

## S2O0 status

The S2O0 artifacts are externally/structurally validated but not yet Lean-
replay closed:

* DRAT audit: `DRAT_VERIFIED_FIXED_CNF`, 1,370,778 clauses;
* ingress: `LRAT_MATERIALIZED_LEAN_REPLAY_PENDING`;
* windowed replay: `STRUCTURALLY_MATERIALIZED_LEAN_REPLAY_PENDING`;
* compact package: `STRUCTURALLY VERIFIED COMPACT REPLAY PACKAGE; LEAN BUILD
  AND AXIOM AUDIT REQUIRED`;
* source manifest: `EXTERNALLY VERIFIED PURE-RUP CORE; LEAN REPLAY AND
  SOURCE-VALUATION BRIDGE NOT YET COMPLETE`.

`S2O0TextIngress` has a source-clean shape (`certificateCore_unsat` and
`core_unsat`) but this only refutes the frozen core CNF.  The semantic
adapter and shell-case coverage live in `S2O0RetainedCoreClauseBank` and the
`FiniteN11Frontier` consumer, both still waiting on this build/replay path.

## CoverIndexBridge status

`Census554/CoverIndexBridge.lean` is already compiled (olean timestamp
2026-07-30) and its audited declarations are source-clean with no `sorryAx`.
In particular, `exists_coverIndex_of_cubeOk` and
`finalAssign_coverIndex_baseSat_of_cubeOk` depend only on the standard
compiler/trust axioms listed above.  This is a reusable semantic adapter:
`CubeOk` yields an encoder index assignment satisfying the base C2/C4
encoding.  It is bankable as an adapter theorem and is already imported by
the V7 semantic modules.  It is not itself a contradiction; it becomes useful
only when paired with a base-CNF unsat consumer.

## Closure criterion

Exact-11 is not yet unconditionally banked from this audit.  The required
gate is: (1) all G3 ledgers and `G3Checkpoint0ClauseBank` compile, (2) the
S2O0 retained-core replay and source-to-valuation/case bridge compile, and
(3) focused `#print axioms` on the final `False` consumers show no `sorryAx`.
Until then, call the current state “source-clean semantic slices plus
external/structural replay artifacts,” not theorem-level exact-11 closure.

