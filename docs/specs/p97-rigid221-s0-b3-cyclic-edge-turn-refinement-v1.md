# Rigid221 S0 B3 cyclic-edge turn refinement v1

**Status:** fixed-order monotone-control contract for formula-scoped discovery;
no source-universal or Lean closure claim

## Objective

This contract refines the first directed-edge boundary from the cyclic-order
wave. Every cell starts with the 156-assertion prefix that completes the first
edge `O → au`, then appends a nonempty prefix of the eleven strict-turn
assertions for the second edge `au → av`. The immediate consumer remains
`Problem97.ATailFrontierLiveClosure.false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`.

The two controls use the source-correct forward and reverse role orders from
`rigid221_s0_blockerv_midpoint_order_probe.py`. Source provenance fixes the
local placement of `v` between `u` and `xu`; it does not supply the global
strict-turn inequalities selected by these cells.

## Monotone cells

For fixed directed edge `au → av`, the parent producer iterates through the
chosen role order and emits one positive orientation assertion for every role
other than `au` and `av`. This producer retains that exact order and emits
prefixes containing 1 through 11 individual turns.

- Base prefix: 156 assertions, including the complete `O → au` edge.
- Increment: exactly one strict-turn assertion per cell step.
- Cumulative counts: `157,158,159,160,161,162,163,164,165,166,167`.
- Cells: 11 forward plus 11 reverse.

The 11-turn endpoint for each control must have byte-identical query-free
SMT-LIB2 to the corresponding two-edge prefix from
`rigid221_s0_b3_cyclic_order_refinement.py`, the run-0002 formula producer.

## Selected and omitted ledger

`scripts/rigid221_s0_b3_cyclic_edge_turn_refinement.py` records for every cell:

- the selected role order and second-edge turn count;
- every selected and omitted third role in original emission order;
- the exact strict-turn assertion and its SHA-256 digest;
- assertion count, formula byte length, and formula SHA-256 digest; and
- the named B3 consumer.

Each reduced cell omits at least one `au → av` turn. Every cell also omits the
later cyclic edges, source derivation for the selected global turns, coverage
over all Moser normalizations, source realization of SAT assignments, the
exact-cap and deletion-multiplicity blocks, and Lean ingress.

## Static and solver gates

The producer invokes no solver backend. Its static checks require:

1. a 156-assertion complete first-edge prefix;
2. exactly eleven candidate turns for `au → av`;
3. one new assertion at every prefix step and cumulative counts 157 through
   167;
4. successful QF_NRA parsing with the pinned count for every cell;
5. absence of pseudo-Boolean operators;
6. preservation of the original third-role emission order; and
7. byte preservation at both 11-turn endpoints.

Emission is silent on success unless `--verbose` is passed. Errors are always
reported. Any later solver run must use fresh PiQD sessions and retain the
formula digest, solver identity, status, and receipt.

## Verdict scope

These are fixed-order monotone controls for formula-scoped discovery only. A
status change between adjacent turn prefixes locates a computational boundary
inside one chosen order. It does not show that the added global turn follows
from source hypotheses, and it does not close B3. Any proposed Lean lemma must
first map its antecedents to source theorems and keep the theorem named above as
its immediate consumer.
