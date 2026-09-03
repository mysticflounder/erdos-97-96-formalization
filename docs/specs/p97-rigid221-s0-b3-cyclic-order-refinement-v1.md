# Rigid221 S0 B3 cyclic-order refinement v1

**Status:** bounded monotone-control contract for formula-scoped discovery; no
source-universal or Lean closure claim

## Objective

This contract refines the first hard boundary found by the exact-five
factorization. Each cell contains the 145-assertion Moser-disk prefix followed by
a nonempty prefix of directed cyclic edges. The immediate consumer remains
`Problem97.ATailFrontierLiveClosure.false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`.

The two order controls are the source-correct forward and reverse orders from
`rigid221_s0_blockerv_midpoint_order_probe.py`. Source provenance fixes the local
placement of `v` between `u` and `xu`; it does not itself provide all global
strict-turn inequalities used by either control.

## Monotone cells

For a thirteen-role order, cyclic edge `a → b` contributes one positive
orientation assertion against each of the remaining eleven roles. Edges are
selected in the original cyclic emission order. For each order control, the
producer emits prefixes containing 1 through 13 edges.

- Base prefix: 145 assertions.
- Assertions per directed edge: 11.
- Cumulative counts: `156,167,178,189,200,211,222,233,244,255,266,277,288`.
- Cells: 13 forward plus 13 reverse.

The 13-edge endpoint for each order must have byte-identical query-free SMT-LIB2
to the corresponding `06-cyclic-order` formula from the parent factorization.

## Selected and omitted ledger

`scripts/rigid221_s0_b3_cyclic_order_refinement.py` records for every cell:

- the selected order and directed-edge count;
- every selected and omitted edge in cyclic position order;
- the eleven third roles tested by each edge;
- assertion count, byte length, and SHA-256 digest; and
- the named B3 consumer.

All reduced cells omit at least one global strict-turn edge. Every cell also omits
source derivation of the complete global order, coverage over all Moser
normalizations, source realization of SAT assignments, the exact-cap and
deletion-multiplicity blocks, and Lean ingress.

## Static and solver gates

The producer invokes no solver backend. Its static checks require:

1. a 145-assertion parent prefix;
2. exactly 11 assertions per selected edge;
3. cumulative counts from 156 through 288 in steps of 11;
4. successful QF_NRA parsing with the pinned count for every cell;
5. absence of pseudo-Boolean operators; and
6. byte preservation at both 13-edge endpoints.

Emission is silent on success unless `--verbose` is passed. Errors are always
reported. Any later solver run must use fresh PiQD sessions and must retain the
formula digest, solver identity, status, and receipt.

## Verdict scope

These are monotone controls for formula-scoped discovery only. A status change
between edge prefixes locates a computational boundary inside the chosen fixed
order. It does not show that the newly added turn inequality follows from the
source, and it does not close B3. Any proposed Lean lemma must first map its
antecedents to source theorems and keep the theorem named above as its immediate
consumer.
