# B1 card-six endpoint logical adapter — 2026-09-03

Lane: `b1-card-six-endpoint-equivalence-20260903`  
Base head: `ae90cce573eaea37291bc9078b89a5727dd351be`

## Result

Added the off-spine scratch module
`scratch/B1CardSixEndpointEquivalence.lean`.  It defines
`EndpointConclusion C` (with `B1EndpointConclusion C` as a prefixed alias) as

```text
B1WinningLiveSliceSameBoundaryArc C ∨
  ∃ third, third.deleted ≠ C.first.deleted ∧ third.deleted ≠ C.second.deleted
```

and proves:

* `b1_normalForm_implies_not_EndpointConclusion` (and its B1-prefixed alias):
  the normal-form no-third field rules out the second branch, while the
  source-clean same-arc consumer rules out the first, using only `C` and
  `hnormal`;
* `b1_cardSix_endpoint_residual_witness`: a direct wrapper around the actual
  `nonempty_b1CardSixEndpointOrderResidual` producer;
* `b1_cardSix_residual_to_endpointConclusion_iff_false`: given
  `hres : Nonempty (B1CardSixEndpointOrderResidual C E)`,
  `((B1CardSixEndpointOrderResidual C E → B1EndpointConclusion C) ↔ False)`.

The forward proof does not invoke the open B1 normal-form obligation.  The
residual is kept separate from the conclusion and is not promoted to either
branch.

## Validation

Focused command, from `lean/`:

```text
lake env lean ../scratch/B1CardSixEndpointEquivalence.lean
```

Result: exit 0.  The three named theorems report only
`propext`, `Classical.choice`, and `Quot.sound` in their transitive axiom
closures; no `sorryAx`, custom axiom, native computation, or unsafe execution
appears.  A source scan found no `sorry` token in the scratch module.  The
focused command was rerun after the C-only signature update and exited 0.

The theorem-bank preflight found the existing producer declaration but no
downstream consumer of the endpoint residual.  Production modules were not
modified.
