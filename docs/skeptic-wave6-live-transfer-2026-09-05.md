# Math Skeptic Audit: Wave-6 live transfer

**Target**: docs/audits/2026-09-05-wave6-live-transfer.md
**Date**: 2026-09-05
**Verdict**: NEEDS WORK (source-wide transfer is unestablished)
**Claims audited**: 5

## Summary

The finite certificate passes; no new live closure is claimed. The remaining
work is mathematical premise production, not mandatory formalization of this
already-rejected sample. Target remained read-only during this review.

## Findings

### F1: Missing producer is an audit finding, not impossibility

- **Location**: target:8
- **Quote**: "None of the three audited live branches has an identified source-to-kernel producer."
- **Stated label**: bounded source observation.
- **Evidence present**: independent exact-13 and B1 source audits; local exact-five radius-drop inspection.
- **Actual label**: EMPIRICALLY VERIFIED within the named source inspection.
- **Verdict**: OK.
- **Reason**: The following sentence explicitly excludes a no-producer theorem.

### F2: Five-label motif search matches the adapter

- **Location**: target:40
- **Quote**: "Its seven explicit inequalities, together with exclusion of each row's own center, force five distinct labels."
- **Stated label**: source-level mathematical implication.
- **Evidence present**: named adapter; direct argument below.
- **Actual label**: PROVEN (pen-and-paper, this report).
- **Verdict**: OK.
- **Reason**: The omitted inequalities are B != C, C != D, D != E. The first two follow because C's row contains B,D but not C; the last because E's row contains D but not E. The other seven are explicit premises.

### F3: Shared points do not identify row radii

- **Location**: target:44
- **Quote**: "Two rows sharing two points do not alone provide the equal-radius kernel's four equal lengths."
- **Stated label**: mathematical limitation of those premises alone.
- **Evidence present**: direct example below; inspected exact-five radius-drop theorem signature.
- **Actual label**: PROVEN (pen-and-paper for the limitation); EMPIRICALLY VERIFIED source observation for the exact-five theorem signature.
- **Verdict**: OK.
- **Reason**: Points (-1,0),(1,0) are equidistant from each of (0,1),(0,2), with row radii sqrt(2),sqrt(5). This example addresses shared-point premises alone, not all live convexity hypotheses. No fresh Lean trust audit is claimed.

### F4: Finite collision certificate has bounded scope

- **Location**: target:50
- **Quote**: "EMPIRICALLY VERIFIED, on exactly the row table retained in the companion JSON:"
- **Stated label**: EMPIRICALLY VERIFIED.
- **Evidence present**: scripts/verify_wave6_live_affine_sample.py, retained rows and integer certificate; independent worker confirmation from the pinned model (nthdegree #15772).
- **Actual label**: EMPIRICALLY VERIFIED for the finite certificate.
- **Verdict**: OK.
- **Reason**: Replay returned 14 rows, 36 components, eight relations, zero motifs, collision labels [0,2]. Altering a coefficient was rejected. The vector identity has result -2p0+2p2. Geometric use is conditional on distinct planar realization and the equal-radius identity; it is not a source-coverage proof. All four cross-edges of each certificate relation were independently checked to lie in one equality component.

### F5: Further mining has no established payoff yet

- **Location**: target:88
- **Quote**: "HEURISTIC recommendation: apply the full equality-closed affine relation test"
- **Stated label**: HEURISTIC.
- **Evidence present**: one alternate rejection of a previously rejected sample.
- **Actual label**: HEURISTIC.
- **Verdict**: OK.
- **Reason**: No surviving completion was newly rejected in this lane.

## Weasel words

No automatic proof-language flags found in the target.

## Scope conflation

No n10/n11 re-certification, general strict-Kalmanson impossibility, new closed
cell, or source-wide P97 conclusion is asserted. "Zero nine-hit motifs" must
not be read as "no affine obstruction"; the certificate distinguishes them.

## Lean sorry graph

No fresh graph audit or build was performed. Existing kernel declarations are
reported as source observations, not newly promoted Lean results. The live
source implications remain unestablished by this lane.

## Required before CERTIFIED

For a source-wide transfer claim: derive the packet from source hypotheses or
provide a sound exhaustive coverage argument. This requirement does not
invalidate the finite check and is not a recommendation to re-formalize n10/n11.
