# Exact-five profile 0034 `c₂ ∉ row₀` complement audit

Date: 2026-09-04

## Scope and disposition

- Lane: `profile0034-c2-complement-audit-20260904`.
- Base head: `6604fc4e5343d615fc30e2ae22cfe7a7ea93569c`.
- Immediate consumer under audit: `RobustApexFourIncidenceContinuationPacket.false_of_profile0034_boundaryOrder`.
- Result: read-only source audit; no Lean source edit and no sorry movement.

The current source adapter is valid for the explicit boundary chain

```text
blocker < p < s < retained < deleted < c₂ < O.
```

`exists_first_two_support_residual_pairs_with_boundary_indices` supplies the
two residual pairs and canonical boundary indices, but deliberately supplies
no order, cross-row distinctness, or relation between `c₂` and `row₀`.
Consequently it cannot instantiate the seven-order adapter by itself.

## Existing complement facts

The source-valid `c₂ ∉ row₀` split is already present in
`ExactFiveDistinctThreeFanCollision`:

- `threeFan_shared_support_restriction` returns
  `c₂ ∉ row₀ ∨ ∀ s ∈ row₀, s ∈ row₁ → s = a ∨ s = c₂`;
- `threeFan_shared_support_intersection_normalForm` returns
  `c₂ ∉ row₀ ∨ row₀ ∩ row₁ = {a} ∨ row₀ ∩ row₁ = {a,c₂}`.

In the complement arm these are disjunction facts only. They do not produce a
boundary rank inequality or the missing seven-role chain. The separate
`secondApex_not_mem_firstApexFive_of_not_mem_rowZero` theorem proves only that
the second apex is outside the original exact-five class (assuming it differs
from the deleted point); no consumer of that fact exists in the current Lean
source.

The hard-source theorem
`HardSourceSwapExactGridRoles.false_of_fourthIncidence_exactGrid` is not a
complement consumer: it requires a `HardSourceSwapExactGridRoles` witness and
`c₂ ∈ row₀`, together with the hard-grid fourth-incidence hypotheses.

## Missing source ingress

The remaining source-level bridge would need all of the following:

1. an exhaustive alias/role partition for the named points (including the
   `c₂ ∉ row₀` arm);
2. a source-backed selection of `p` and `s` with the required row memberships;
3. a finite transfer from those memberships and convex boundary indexing to a
   strict rank chain, or a checked consumer for each complementary order; and
4. a consumer for the omission/intersection facts in the complement arm.

The authenticated seven-order PIQD results are diagnostic only. They provide
no Lean alias-exhaustiveness theorem, role-to-point ingress, rank transfer, or
source-realizability certificate. A SAT survivor would not close the Lean
obligation; an UNSAT fixed-order result would still require the missing
coverage theorem.

## Reuse and validation

The bounded Lean-corpus search found the existing boundary-order adapter and
the two three-fan complement declarations above, but no source-clean theorem
covering the complement arm. The relevant source snapshots at this checkpoint
are:

```text
ExactFiveDistinctProfile0034SourceAdapter.lean  e1a7c8c78b498e8edf75287b17d5b9a296c745231a9470250ca2be9cef784a21
RobustApexFourIncidenceCyclicReduction.lean     e891b5f47c5e717e4df408efa486c53cff054b64444cde5db1b5d8c2f31de12e
ExactFiveDistinctThreeFanCollision.lean         617d5920ae3fa39f6f782e3419642132fe4afa72f416464912ef5f77b18c5d2f
ExactFiveDistinctOpposedTurnHardSource.lean     91b0a547ac7f45c6ae47a4c3bf2b46c7836a6f9950aea973ed0c8589156e4294
```

No source-clean finite order/alias split was found. Adding a wrapper that only
repackages `c₂ ∉ row₀` would not advance the consumer and would violate the
source-ingress obligation, so this lane stops at the precise missing antecedent.
