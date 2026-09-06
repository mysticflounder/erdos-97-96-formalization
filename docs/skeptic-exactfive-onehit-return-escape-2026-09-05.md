# Math Skeptic Audit: exact-five one-hit return/escape

**Target**: `docs/audits/2026-09-05-exactfive-onehit-return-escape.md` (uncommitted draft before correction)
**Date**: 2026-09-05
**Verdict**: NEEDS WORK
**Claims audited**: 3 load-bearing claims; not a whole-project certification

## Summary

The two orientation-specific return/escape implications have contradictory
premises. Their conclusions do not narrow a realizable return case. The
standalone fiber dichotomy does not fix that defect. No new Lean result is
certified by this review.

## Findings

### F1: Vacuous implication presented as progress

- **Location**: target, line 48.
- **Quote**: "This is a strict source-level narrowing of an assumed return."
- **Stated label**: implicit proof progress.
- **Evidence present**: the uncompiled `QOmittedWHitReselection.exists_oldSupport_escape_of_new_return` and its W-oriented counterpart in `ExactFiveOneHitBlockerFiber.lean`.
- **Actual label**: HEURISTIC as a route to narrowing the live case.
- **Verdict**: REJECT.
- **Reason**: let B be the old selected row centered at U. The premises
  include x outside B and the new shell choosing U at x. After rewriting
  that center equality, `CriticalShellSystem.source_mem_selectedFourClass`
  (`U1CarrierInjection.lean:1165`) applied to the new shell and B gives
  x in B. This contradicts the omission without any fiber-exhaustion
  premise or preservation-of-other-centers premise. Thus neither orientation
  exposes a new source in a possible return configuration.

### F2: An impossible premise named as the next producer

- **Location**: target, lines 26–28.
- **Quote**: "The first missing antecedent remains the production of such a return source outside the retained row, followed by a consumer for the escaping old-row source."
- **Stated label**: proposed proof route.
- **Evidence present**: same selected-class source-membership theorem.
- **Actual label**: HEURISTIC, contradicted by the stated hypotheses.
- **Verdict**: REJECT.
- **Reason**: a genuine return source must be inside the old row. Being
  outside the three current rows does not imply being outside that old row.

### F3: No on-spine consumer for the replacement selection fork

- **Location**: target, line 24.
- **Quote**: "The immediate consumer is a post-one-hit no-return argument."
- **Stated label**: consumer availability.
- **Evidence present**: intended argument, not an installed contradiction consumer.
- **Actual label**: HEURISTIC route.
- **Verdict**: CLARIFY.
- **Reason**: the current physical theorem in
  `FrontierLiveClosure/Rigid221Closure.lean` remains a bare admission.
  Pro consult `01M1TGPRMN7EKAW68WMTZH0GD2` proposes choosing a source outside
  an additional old row, or obtaining carrier cardinality at most 15.
  Luna's independent read-only consumer audit (conversation #16241)
  found neither a contradiction for the small-cardinality branch nor a
  strict decreasing measure for the non-return branch. Rebuilding the
  normal form also requires its retained-source packet and omission;
  changing only the fresh point in a fixed normal form preserves those
  inputs but does not establish termination.

## Lean sorry graph

Source inspection only. No fresh kernel graph or axiom audit was run for
the rejected draft. The physical admission remains; no closure is claimed.

## Upgrade drift

The draft's strict-narrowing claim is withdrawn. The earlier review missed
vacuity; passing elaboration would not validate that progress claim.

## Required before CERTIFIED

Remove the vacuous route from the proposed production change. Supply a
source-faithful strict reduction and its actual consumer before promoting
replacement helpers. Compilation and an independent trust/reachability
audit remain required for any eventual Lean change.
