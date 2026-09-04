# Math Skeptic Audit: TwoRadiusDoublePartitionLargeInterior

**Targets**:

- `lean/Erdos9796Proof/P97/ATail/CapInteriorEquidistant.lean`
- `lean/Erdos9796Proof/P97/ATail/TwoRadiusDoublePartitionLargeInterior.lean`

**Date**: 2026-09-03
**Verdict**: CERTIFIED
**Claims audited**: 5

## Summary

All five mathematical claims are Lean-formalized by the named declarations in
the target files. Both modules pass `lake-build`, and direct `#print axioms`
probes for the two public closing lemmas report only `propext`,
`Classical.choice`, and `Quot.sound`. The build-time kernel mining reported no
edges into custom axioms for either new module. No `sorry`, custom axiom,
finite-computation claim, or label inflation occurs in the targets.

The project-wide `proof-blueprint audit` currently reports unrelated global
promotion and name-collision failures, so that command is not used as evidence
for this target verdict.

## Findings

### F1: Ordered-cap obstruction

- **Location**: `CapInteriorEquidistant.lean:14`
- **Quote**: "A center in a strict cap cannot be equidistant from three distinct points of that cap: each pair would have to straddle the center in the strict linear cap order."
- **Stated label**: Implicitly proven.
- **Evidence present**: `Problem97.ATailCapInteriorEquidistant.false_of_orderedCap_center_equidistant_three_points`, built successfully.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The proof derives three strict betweenness alternatives and closes every order case with `omega`.

### F2: Public cap-interior wrapper

- **Location**: `CapInteriorEquidistant.lean:60`
- **Quote**: "Four points in one strict cap cannot consist of a center and three distinct points equidistant from that center."
- **Stated label**: Implicitly proven.
- **Evidence present**: `Problem97.ATailCapInteriorEquidistant.false_of_capInterior_center_equidistant_three_points`, built successfully; its axiom print contains only the three standard Lean axioms listed above.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The wrapper obtains cap indices for all four points, proves their index distinctness, and invokes F1.

### F3: Double-partition counting step

- **Location**: `TwoRadiusDoublePartitionLargeInterior.lean:16`
- **Quote**: "Five points from the two classes in one strict cap force three onto one shell, and two of those three share a selected physical radius."
- **Stated label**: Implicitly proven.
- **Evidence present**: Private helper `false_of_shell_threeInterior` and the counting part of `false_of_twoRadius_doublePartition_largeInterior`, built successfully.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The double partition covers the class points by the two shells; cardinality gives a shell trace of size at least three, and exhaustive two-class membership cases supply a same-class pair.

### F4: Source-neutral closing branch

- **Location**: `TwoRadiusDoublePartitionLargeInterior.lean:14`
- **Quote**: "This module closes the source-neutral finite-geometric branch in which two selected four-classes are simultaneously partitioned by two critical four-shells."
- **Stated label**: Implicitly proven.
- **Evidence present**: `Problem97.ATailTwoRadiusDoublePartitionLargeInterior.false_of_twoRadius_doublePartition_largeInterior`, built successfully.
- **Actual label**: PROVEN — Lean-formalized under the theorem's explicit hypotheses.
- **Verdict**: OK.
- **Reason**: The declaration quantifies over the two selected classes, two critical shells, class disjointness, surviving centers, the double-partition packet, and the large-interior bound without source-specific wiring.

### F5: Public large-interior contradiction

- **Location**: `TwoRadiusDoublePartitionLargeInterior.lean:113`
- **Quote**: "Five strict-cap points from two disjoint selected four-classes cannot be distributed through two disjoint critical four-shells by a simultaneous double partition."
- **Stated label**: Implicitly proven.
- **Evidence present**: `Problem97.ATailTwoRadiusDoublePartitionLargeInterior.false_of_twoRadius_doublePartition_largeInterior`, built successfully; its axiom print contains only the three standard Lean axioms listed above.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: A same-class pair localizes the chosen shell center into the strict second-cap interior, and F2 excludes that center together with the shell's three distinct interior points.

## Weasel words

None found.

## Scope conflation

None found. The public theorem states every geometric and finite-partition
hypothesis consumed by the proof.

## Lean sorry graph

No `sorryAx` or custom axiom appears in the direct axiom prints. The reported
dependency set is `[propext, Classical.choice, Quot.sound]` for each public
closing lemma.

## Required before CERTIFIED

None for these targets.
