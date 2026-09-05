# Math Skeptic Audit: ExactlyOneCrossAliasGeometry

**Target**: `lean/Erdos9796Proof/P97/ATail/ExactlyOneCrossAliasGeometry.lean`
**Date**: 2026-09-04
**Verdict**: CERTIFIED
**Claims audited**: 6

## Summary

The three public contradiction theorems compile directly, and their explicit
axiom probes report only `propext`, `Classical.choice`, and `Quot.sound`. No
`sorry`, `admit`, or custom `axiom` marker occurs in the target. The proof
claims are therefore Lean-formalized. The module-header description was
clarified during this audit to state that the wrappers consume the strict-order
output of the finite classifier.

## Findings

### F1: Wrapper-input description was clarified

- **Location**: `lean/Erdos9796Proof/P97/ATail/ExactlyOneCrossAliasGeometry.lean:14-18`
- **Quote**: "it consumes the classifier's strict-order output, an injective CCW boundary enumeration, and the six equal-distance relations for the three fan centers."
- **Stated label**: Lean-backed interface claim
- **Evidence present**: The public signatures at lines 496-502, 572-578, and 635-641 use `hinj`, `hccw`, a strict-order premise, and equal-distance packets; the direct Lean check and axiom probe pass.
- **Actual label**: PROVEN Lean-formalized description
- **Verdict**: OK
- **Reason**: The header now distinguishes the finite classifier's separation inputs from the geometric wrapper's actual inputs.

## Weasel words

None found in the target's prose.

## Scope conflation

No remaining scope issue was found. The source-neutral geometric contradiction
is stated separately from the finite classifier's separation layer.

## Lean sorry graph

The direct source check passed. Explicit probes for
`false_of_threeFan_one_cross_alias_order₁`,
`false_of_threeFan_one_cross_alias_order₂`, and
`false_of_threeFan_one_cross_alias_order_orbit` returned exactly
`[propext, Classical.choice, Quot.sound]`; no `sorryAx` or custom axiom was
reported.

## Upgrade drift

No base-commit label upgrade was audited.

## Required before CERTIFIED

None. The header clarification was applied, and the direct Lean check and
axiom probe were rerun successfully.
