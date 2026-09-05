# PentagonBlocker refactor pilot checkpoint — 2026-09-03

## Objective
Use `P97-R221-PENTAGONBLOCKER` as the pilot for a proof-architecture refactor that lowers the publish-reachable `sorryAx` count, rather than adding another branch-specific wrapper.

Primary target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted`

Known source location from the latest leaf audit: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean:3451-3523`.

Known direct consumer: `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagon_blockerCenterSplit`, around `Rigid221SourceHeavy.lean:18395-18470`. Closing the target removes one named pentagon continuation.

## Current diagnosis
The leaf is not blocked by Lean plumbing. The existing packet retains the exact-five physical-class/pentagon roles, row traces and omissions, strict-cap locations, and the blocker/deletion identity. The prior source audit identifies one missing mathematical kernel: a common-circle + strict-arc / equal-chord midpoint-cycle contradiction.

The key refactor requirement is that this kernel must NOT mention Rigid221 residual structures. `Rigid221SourceHeavy` should contain only an adapter from its source packet to the pure geometric theorem.

## Proposed three-layer architecture

### Layer G — pure geometry kernel
Create or reuse a low acyclic geometry module below FrontierLiveClosure. Desired theorem shape, pending exact source reconstruction:

- finitely many explicit planar points;
- pairwise distinctness assumptions actually needed by the proof;
- one common-circle/cospherical packet or equivalent equal-radius hypotheses;
- strict cyclic/arc order hypotheses;
- the equal-chord/equidistance relations induced by the blocker/pentagon cycle;
- conclusion `False` (or a strict order cycle impossible by asymmetry).

No `CounterexampleData`, `Rigid221`, `OriginalUniqueFourResidual`, `SelectedFourClass`, source/deletion records, or branch-specific names should appear in this theorem.

Preferred proof style: reduce each equal-chord relation to an arc-midpoint/betweenness statement and compose them into a strict cyclic-order cycle. If the actual packet is better expressed through perpendicular-bisector or Kalmanson inequalities, use that lower-level language instead. The kernel should be the strongest statement justified by the source, but no stronger.

### Layer A — source adapter
A small theorem in a module imported by `Rigid221SourceHeavy` should map the pentagon-blocker packet to Layer G. It may use branch-specific support-membership-to-distance lemmas, cap-to-boundary-order adapters, and blocker-center identities. It should not prove new Euclidean mathematics.

Acceptance criterion: `#print axioms` for the adapter and Layer G contains only standard project baseline axioms; no `sorryAx`; no backward import from a coordinator.

### Layer C — coordinator
Replace the body of `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerDeleted` with the adapter/kernel invocation. The parent `...pentagon_blockerCenterSplit` remains a thin dispatcher.

## Reuse audit to perform before fixing the kernel signature
Search open leaves for the same or weaker packet:

1. TwoDeletion blocker-coincidence and survival-square leaves.
2. Rigid221 Placement `blockerV_sourceRowHeavy` and `blockerVRow_oppositeRowHeavy`.
3. Exact-five three-fan / hook-cycle endpoints.
4. TwoSource ordered-row occurrence leaves.
5. B1 same-arc endpoint geometry.

For each, record whether it already has:
- the same common-circle/cospherical hypothesis;
- the same equal-chord pattern;
- enough cyclic order to invoke Layer G;
- or exactly one missing adapter fact.

Do not generalize Layer G speculatively. Generalize only when at least two live leaves instantiate the generalized statement.

## Broader refactor policy suggested by this pilot
1. Move pure circle/Kalmanson/order contradictions downward into reusable modules.
2. Factor historical provenance away from mathematical consumer structures.
3. Keep `Rigid221Closure`, `Rigid221SourceHeavy`, and `TwoSourceClosure` as dispatch/adaptation layers rather than theorem banks.
4. Strengthen upstream ingress records only when a live terminal demonstrably needs a fact currently discarded.
5. Judge each refactor by publication-root `sorryAx` reachability, not source-clean wrapper count.

## Current tasks dispatched via nthdegree
- Message #9800: exact live target/consumer/import audit and reuse scan.
- Message #9801: split pure-math reconstruction from cross-sorry reuse audit across luna-swarm agents.
- Message #9802: requested literal target signature/context and low-level geometry import inventory from ProofRelay97.

No source edits requested yet: the kernel signature must first be source-faithful.

## Decision gate
Once the exact target packet is returned:
1. write the literal pure theorem statement;
2. try to prove/refute it independently of Rigid221;
3. if proved, route formalization to luna-swarm;
4. if false, identify the minimal additional source fact actually used by the branch and revise the adapter/kernel boundary;
5. only then rewire the live target.
