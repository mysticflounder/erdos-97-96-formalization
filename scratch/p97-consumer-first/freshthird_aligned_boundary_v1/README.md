# FreshThird aligned mutual-boundary packet, exact-17 diagnostic

This directory contains the smallest next bounded query for the live first
aligned constructor.  It extends the existing exact-17 incidence canary in
`../freshthird_six_center_global_k4_v2/canary.py` with the finite projection of
`FreshThirdAlignedMutualBlockerBoundaryPacket`.

The run is diagnostic only.  It is not a Euclidean realization, does not
prove the boundary producer, does not lift from exact 17 to general
cardinality, and does not close the Lean residual.

## Ingress contract

Every encoded clause has the following source origin.

| encoded field | source-faithful origin |
|---|---|
| exact-17 carrier, cap profile `(8,6,6)`, exact strict interiors `(6,4,4)`, global K4/blocker-fiber/shell clauses | inherited `../freshthird_six_center_global_k4_v2/canary.py`; profile is the exact-17 consequence recorded in `docs/computational-closure-plan-2026-07-28.md`, §13.24 |
| unequal first-apex radii, singleton first-apex slices, opaque retained multi-point-radii proposition | `FreshThirdAlignedRetainedConsumerPacket`, `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean:714-730` |
| both exact four-point source rows contain `firstSource` and `secondSource` | `TwoCapSourcesMutualCrossMembership` and `CapSourceThirdCanonicalRowWitness`, represented by `rows[row]` cardinality 4 and the two mandatory memberships |
| chosen P/P-rho endpoint omissions and four-survivor restoration | `FreshThirdAlignedFixedDeletionCorePacket`, `TwoSourceFreshThirdRetainedProducer.lean:465-485`; the first-apex failure and `MinimalDeletionCore` fields remain explicit source propositions |
| one shared omitted endpoint across the two rows | `FreshThirdAlignedCommonDeletionCorePairPacket`, `TwoSourceFreshThirdRetainedProducer.lean:566-600`; `common_deletion_endpoint_in_P` selects the P or P-rho pair and `common_deletion_endpoint_slot` is shared by both rows |
| distinct indexed blocker caps and strict-interior membership | `FreshThirdAlignedMutualBlockerBoundaryPacket`, `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean:2172-2195` |
| zero/surplus/opp1/opp2 placements | `zeroIndex`, `oppositeVertexByIndex surplusIdx`, `iv`, and `iw` fields of the same packet; finite normalization is `pos[surplus]=0`, `iv=pos[opp1]`, `iw=pos[opp2]` |
| Direct/Mirror cap blocks | literal expansion of `DirectBoundaryBlocks` and `MirrorBoundaryBlocks`, `lean/Erdos9796Proof/P97/Census554/CapSelectedGeometry.lean:59-95` |
| cyclic separation biconditional | literal expansion of `SurplusCOMPGBank.btw`, `lean/Erdos9796Proof/P97/SurplusCOMPGBankSep.lean:85`, with `Xor(btw(blocker0,blocker1,firstSource), btw(blocker0,blocker1,secondSource))` |

The finite role normalization chooses the two source roles from distinct base
blocker fibers (`q_source` in B1 and `source5` in B5), while `p1,p2` and
`rho1,rho2` are the two retained endpoint pairs.  All seven named roles are
constrained pairwise distinct; this is an explicit finite adapter choice, not
a new Lean theorem.

## Results

`freshthird_aligned_boundary_v1.py` runs Z3 and cvc5 on two positive
orientations and four malformed controls.  The current `results.txt` records:

```text
negative_overfull_source_row: z3=unsat cvc5=unsat
negative_no_common_omission: z3=unsat cvc5=unsat
negative_boundary_order: z3=unsat cvc5=unsat
negative_cyclic_separation: z3=unsat cvc5=unsat
positive_direct: z3=sat cvc5=unknown
positive_mirror: z3=sat cvc5=unknown
```

Each Z3 positive assignment is independently read back: boundary positions
are a permutation, the selected orientation blocks hold, the zero/apex
placements and cyclic separation hold, rows have cardinality four and contain
both source points, and all deletion-core propositions/common omission hold.

The four controls deliberately negate one encoded clause: row cardinality,
common omission, Direct cap order, or cyclic separation.  cvc5 is invoked once
per case (six sequential solver processes total).

No metric equalities, coordinates, convexity realization, selected-class
adjacency, or universal cardinality lift is encoded here.  In particular, a
SAT result is only consistency of this finite source projection, and an UNSAT
result would be a candidate finite obstruction requiring a separate
bounded-core theorem or general-cardinality lift before any theorem claim.
