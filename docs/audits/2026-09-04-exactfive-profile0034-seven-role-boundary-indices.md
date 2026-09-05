# Exact-five profile 0034 seven-role boundary indices

Date: 2026-09-04

## Reuse preflight

Concrete candidate: package the separated residual heads and canonical
boundary indices for the blocker, both residual heads, retained source,
original deletion, second apex, and first apex.  The immediate consumer is
`RobustApexFourIncidenceContinuationPacket.false_of_profile0034_boundaryOrder`.

One agentic search of the indexed repository Lean corpus at source/import
revision `c7d2ff2a0ca8ad311dee665cd5de57fcb4d8127a` found the two immediate
building blocks:

- `exists_first_two_support_residual_pairs_with_boundary_indices`, which
  indexes arbitrary residual pairs but does not enforce cross-row separation;
- `exists_profile0034_separated_residual_heads`, which chooses separated heads
  but does not expose their indices.

No existing declaration packages the seven roles selected by the final
positive continuation branch.  The first missing antecedent after packaging
is the strict index chain required by the obstruction consumer; there is no
circular dependency on that consumer.

## New declaration

`RobustApexFourIncidenceContinuationPacket.exists_profile0034_seven_role_boundary_indices`
chooses `p ∈ row₀` and `s ∈ row₁`, retains
`p ≠ s`, `p ≠ S.oppApex2`, `s ≠ S.oppApex2`, and
`blocker ≠ deleted`, and returns canonical boundary indices
`iU ip is ia id ic iO` whose evaluations are the seven named roles.

The proof uses carrier membership already present in the three-row surface,
the exact-five selected-class membership of `deleted`, the separated-head
selector, and the blocker/deletion separation lemma.  It adds no geometric or
ordering assumption.

## Verification and trust

Focused compilation from `lean/`:

```text
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctProfile0034SourceAdapter.lean
exit 0
```

The declaration reports only
`[propext, Classical.choice, Quot.sound]` under `#print axioms`.  It contains a
Lean docstring and introduces no `sorry`, custom axiom, native reduction, or
external certificate.

## Remaining frontier

The declaration deliberately asserts no order among the seven indices.  To
invoke `false_of_profile0034_boundaryOrder`, the live source still needs a
classifier producing
`iU < ip < is < ia < id < ic < iO` for one selected pair of residual heads.
The completed supporting-edge computation remains diagnostic and contributes
no Lean premise until independently confirmed and formalized.
