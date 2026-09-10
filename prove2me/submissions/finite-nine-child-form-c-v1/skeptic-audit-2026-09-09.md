# Math Skeptic Audit: finite-nine Form `c` at `v₁`

**Target:** `Erdos9796FiniteNine.form_c_v1` packet  
**Date:** 2026-09-09  
**Verdict:** NEEDS WORK  
**Claims audited:** 1

## Summary

The generated source is free of forbidden proof tokens and both the solution and audit elaborate
under Lean 4.33.1. Server-verified closure is still absent. The local axiom probe contains
`sorryAx` because accepted theorem nodes are represented locally by statement-only stubs, and the
815,939-byte monolith has not been submitted because its runtime risk exceeds that of the
694,176-byte Form `b` source that timed out twice. Smaller support nodes require server
verification before this packet can be certified.

## Findings

### F1: Server-verified proof closure is absent

- **Location:** `explanation.md:6`
- **Quote:** “The first branch is closed by the upper-arc obstruction; the remaining branches
  reduce to the coordinate and pin-clash contradictions already established by the finite-nine
  geometry layer.”
- **Stated label:** Lean-formalized proof transfer.
- **Evidence:** The generated `theorem solution` at line 17,533 elaborates in 8,750 jobs with exit
  code 0. The audit elaborates in 8,751 jobs with exit code 0. Its `#print axioms solution` output is
  `[propext, sorryAx, Classical.choice, Quot.sound]`; `sorryAx` comes from accepted theorem nodes
  represented locally by statement-only `by sorry` stubs. No Form `c` server receipt exists.
- **Actual label:** Locally elaborated candidate conditional on accepted theorem mirrors.
- **Verdict:** DOWNGRADE TO CONJECTURED as an unconditional core-clean or server-verified claim.
- **Reason:** Local elaboration checks typing but cannot discharge the imported stub dependency.
  The proof must be split into smaller support nodes and verified by Prove2Me before certification.

## Weasel words

None found.

## Scope conflation

The packet metadata distinguishes local elaboration from server verification. No server receipt or
core-clean result is claimed.

## Lean sorry graph

The generated solution source contains no `sorry` or `sorryAx` token. The local dependency graph
does contain `sorryAx` through Prove2Me's statement-only mirrors of accepted theorem nodes, as
shown by the audit. Server verification of smaller nodes is required to replace that local trust
gap with platform evidence.

## Upgrade drift

None found. The packet records the authenticated sources and the exact Lean 4.33.1 repairs applied
by the generator.

## Required before CERTIFIED

1. Split the authenticated support proof into source-sized Prove2Me nodes.
2. Obtain successful server verification receipts for those nodes and the short final consumer.
3. Record the resulting evidence in `validation.json` and rerun this audit.
