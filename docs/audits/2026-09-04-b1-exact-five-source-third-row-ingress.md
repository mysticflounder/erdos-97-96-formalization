# B1 exact-five source-third-row ingress audit

Date: 2026-09-04
Lane: `luna-swarm-b1-exact-five-source-third-row-ingress-20260904`
Assignment: nthdegree message `#12005`

## Result

Added
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1ExactFiveSourceThirdRowIngress.lean`.
The repair also adds the proof-relevant
`B1ExactFiveSourceEqURigidResidual C G`, retaining `G.u = G.source` together
with the clean rigid global deletion.
The module defines the proof-relevant
`B1ExactFiveSourceThirdRowResidual C G`, retaining the clean
`ExactFourMutualOmissionRigid221GlobalDeletion`, `G.u ≠ G.source`, every
conjunct of `exactFourRigid221_context_u_ne_source_normalForm`, and the full
`exactFourRigid221_context_u_ne_source_otherPlacement` disjunction.

The producer theorem
`b1ExactFiveSourceThirdRow_or_secondDeletion_or_sourceEq` uses
`G.exact_five_split`, the source-context adapter,
`exactFourMutualOmissionRigid221_globalDeletion`, and both source-clean
Rigid221 placement consumers.  Under the exact-five class-cardinality
hypothesis it returns either a second joint deletion with a distinct deleted
vertex, a `Nonempty` source-equals-`u` rigid residual, or the named third-row
residual.  Global deletion is constructed before the source-equality split, so
the equality arm retains the rigid cover.  No terminal
wrapper, `Rigid221Closure`, `Coordinator`, or sorry-dependent theorem was
added.

The module has exactly two imports: the source-context ingress and
`Rigid221Placement`.

## Verification

- Base `HEAD`: `e846707a8a319fd097dbb4282773d001b3520c00`.
- Required indexed Lean reuse preflight completed once.  It found the existing
  source-context adapter, exact-five split, and the two Rigid221 placement
  consumers as the intended composition; no existing theorem named this
  ingress.
- Direct check: `lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1ExactFiveSourceThirdRowIngress.lean` — exit 0.
- Governed check: `LAKE_BUILD_NO_REFRESH=1 lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1ExactFiveSourceThirdRowIngress` — exit 0, `10880` jobs.
- Axiom probes for the producer and both consumed placement theorems returned
  `[propext, Classical.choice, Quot.sound]`; no `sorryAx`.
- Marker scan of the source for `sorry`, `axiom`, `native_decide`, `unsafe`,
  `admit`, and `exact?`: no matches.
- Import check: exactly two minimal imports, as listed above.
- Source SHA-256 after repair:
  `a17df55c96d6d1616635cce62a10cb8bbf92c35ff5d13707310ad52727ef5c62`.
- Checkpoint SHA-256:
  `4c71c595f8d7bf58818432306230c0f302e330c5014381b53a2e2da3a3505f72`.
- Nothing was staged or committed; foreign dirty/staged paths were preserved.
