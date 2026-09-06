# Math Skeptic Audit: exact-thirteen raw-cover additions

**Target:** [semantic canonicalization note](erdos-97-exact13-semantic-canonicalization.md),
the raw-cover section at lines 118–148, helper draft at lines 420–482,
and the corresponding [atomic-proof paragraph](erdos-97-descent-prose-proof-atomic.md#114-the-two-radius-branch-exact-twelve-and-larger-carriers).
**Date:** 2026-09-06.
**Verdict:** CERTIFIED within this limited pen-and-paper scope.
**Claims audited:** 2 mathematical deductions, plus the source consumer contract.

## Summary

The raw packet supplies the physical cover and exclusive raw apex membership.
Both arguments are complete under its existing fields and the selected rows'
center exclusions. Neither deduction needs label-map injectivity. Independent
source/API and mathematical reviews accepted these additions. The helper is
uncompiled; this report certifies no Lean declaration, axiom closure, import
reachability, eighteen-choice enumeration, or terminal contradiction.

The original 213-line canonicalization draft is unchanged from `e0219079f`.
Its broader geometric argument is outside this incremental audit.

## Findings

### F1: The raw cover transports to the required physical cover

- **Location:** target lines 128–135 and 443–466.
- **Quote:** “This transport needs no injectivity, cardinality, or
  disjointness argument; those additional packet fields are not used.”
- **Stated label:** PROVEN, pen-and-paper; Lean draft uncompiled.
- **Evidence:** `CardGeThirteenExact13RawTightSupport.raw_cover`,
  `zraw_image`, the three support-image equalities, and `LabelMap.image_eq`.
- **Actual label:** PROVEN, pen-and-paper.
- **Verdict:** OK.
- **Reason:** Insertion restores the omitted raw label to the universe.
  Applying the point-map image preserves insertion and union. Substituting
  the five stored image equalities gives the exact physical cover. The local
  APIs `Finset.insert_erase`, `Finset.image_insert`, and `Finset.image_union`
  have the required statements. This source inspection is not elaboration.

### F2: The raw apex belongs to exactly one blocker

- **Location:** target lines 137–145.
- **Quote:** “This proves exclusive blocker membership directly in raw labels.”
- **Stated label:** PROVEN, pen-and-paper.
- **Evidence:** `secondApex_eq`, `zraw_image`, `Kraw_image`, `raw_cover`,
  `raw_disjoint_C0_C1`, `z_mem_rows`, and the named rows' center exclusions.
- **Actual label:** PROVEN, pen-and-paper.
- **Verdict:** OK.
- **Reason:** The uncovered physical point differs from the apex, so their
  raw labels differ: equality of labels would give equality of images by
  `congrArg J.pt`. The raw apex cannot belong to the third support, since its
  image is that row's center. The raw cover puts it in one of the blockers;
  blocker disjointness rules out both. This direction uses preservation of
  equality by a function, not injectivity. No finite experiment is used.

## Source contract and validation boundary

The helper takes the existing tight-support packet, with no additional cover
premise. Its namespace and binders match `CardGeThirteenExact13RawIngress.lean`
lines 345–369. The consumer supplies `X.tightSupport`, whose type is declared
in `CardGeThirteenExact13DispatchRawBridge.lean` lines 35–50. The map fields
are in `DRExactThirteenValuation.lean` lines 284–294. These paths are relative
to `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/`.

The raw helper draft imports only `CardGeThirteenExact13RawIngress`; it does
not depend on the canonicalization draft's private radius helper. The planned
consumer call passes `Q.base`, as required by the weaker three-center packet
type. Both drafts remain explicitly uncompiled. No Lean build was run during
this review because the coordinated reconciliation build was still active.

Reviewed note SHA-256:
`cf1a4549e57322252e187a9da3651d3fbbbb846e0b862b86af697a754914e9ca`.
The new 41-line helper block, including its final newline, has SHA-256
`405e5a1fa89e653b0f8feea43ea5ef30a60ab2757736de9f41af1c59c0ecbeca`.
Source/API review was against the working tree through `e40a95155`.
