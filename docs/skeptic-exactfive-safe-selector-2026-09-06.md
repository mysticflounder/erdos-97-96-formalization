# Math Skeptic Audit: exact-five safe-selector preflight

**Target**: `docs/audits/2026-09-06-exactfive-safe-selector-preflight.md`
**Date**: 2026-09-06
**Verdict**: NEEDS WORK for the original selector; auxiliary paper argument and finite diagnostic pass within their stated scopes
**Claims audited**: 3 principal claims and their stated dependencies

## Summary

No proof of the original safe selector or physical terminal is claimed or
certified. Independent read-only review accepted the at-most-two argument,
its cardinality-15 corollary, and the exact metric control. This report
records that bounded review, not a fresh Lean promotion audit.

## Findings

### F1: At-most-two paper argument

- **Location**: target, lines 63–100.
- **Quote**: "Under the live physical hypotheses, at most two members of F have their canonical actual row containing both q and w."
- **Stated label**: PROVEN, pen-and-paper.
- **Evidence present**: complete argument from bisector capacity, robust first-apex exclusion, and four-row source membership; exact source APIs inspected; independent review agrees.
- **Actual label**: PROVEN, pen-and-paper under the stated source hypotheses.
- **Verdict**: OK.
- **Reason**: all double-hit centers must occupy the one non-O position on
  the bisector. Their deletion sources belong to a fixed four-point row
  already containing q,w, neither of which is in F. The union bound at
  cardinality 15 then supplies three choices. No minimum-pair assumption,
  recursion, or geometric safety conclusion is used.

### F2: Finite metric control

- **Location**: target, section "Exact finite diagnostic".
- **Quote**: "EMPIRICALLY VERIFIED — one rational 13-point metric and all 8,190 proper nonempty subsets."
- **Stated label**: EMPIRICALLY VERIFIED at finite metric scope.
- **Evidence present**: rational-matrix checker, five passing tests, independent code review, explicit Ptolemy and radius-drop failures.
- **Actual label**: EMPIRICALLY VERIFIED at the stated scope.
- **Verdict**: OK.
- **Reason**: all radius classes and deletion tests are recomputed from
  exact fractions. The checker now asserts uniqueness of the rich class
  at every center before the intersection check. L is described as a
  selected subset of a five-point class, not a full four-point class.
  Marked cap and triangle labels are not promoted to geometric objects.

### F3: Original selector and proof closure

- **Location**: target, preamble and completion matrix.
- **Quote**: "CONJECTURED; not established here."
- **Stated label**: CONJECTURED.
- **Evidence present**: no proof of the uniform selector; an explicitly weaker auxiliary result and nonplanar diagnostic.
- **Actual label**: CONJECTURED.
- **Verdict**: OK.
- **Reason**: the paper corollary need not produce a safe point and says
  nothing for cardinality at most 14. Zero-hit/one-hit contradictions and
  return-cycle termination remain absent.

## Scope conflation and Lean sorry graph

The independent review's wording recommendation was applied: the control's
choices are called matrix-defined critical choices. No Lean source was
edited, no kernel graph refreshed, and no transitive axiom audit performed.
The existing physical admission remains. Ptolemy rejection is justified
by the displayed complex-number identity and triangle inequality, not by
an unsupported empirical assertion of nonplanarity.

## Required before CERTIFIED for the original target

Prove the actual geometric safe selector or explicitly authorize a different
closure route. The auxiliary result still needs a source-clean consumer for
the remaining cases, followed by formalization and current trust/reachability
validation before any proof-spine promotion claim.
