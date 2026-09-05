# Rigid221 actual-blocker physical-class compatibility audit

## Scope and source state

This lane audited the external #11775 candidate
`false_of_exactFourMutualOmissionRigid221_actualBlocker_mem_physicalClass`
against the current source. The lane was claimed as
`rigid221-s0-actual-blocker-off-physical-class-20260904` at base commit
`0e04e7d4cb9f0f78e4d151f31e84ef8251219963`. During the audit, the shared HEAD
advanced to `14741550eac919bddd4f52a9fdca7bf6f59a754`; the target source had no
committed diff between the lane base and that HEAD.

The proposed handoff file
`Rigid221ActualBlockerOffPhysicalClass-handoff-2026-09-04.lean` was not present
in the repository tree or `/Users/adam/Downloads`.

## Candidate statement

The reported candidate was described as a theorem of the form

```lean
theorem false_of_exactFourMutualOmissionRigid221_actualBlocker_mem_physicalClass
    (Q : ExactFourMutualOmissionRigid221GlobalDeletion R rho)
    (z : CriticalShellSystem.CarrierVertex D.A)
    (hz : (lateFirstApexSystem R).centerAt z.1 z.2 ∈
      SelectedClass D.A S.oppApex2 rho) : False
```

The quoted body was said to reuse `Q.sourceContext`, `Q.jointDeletion`, and
`Q.rigid`, then call an existing theorem
`false_of_exactFourMutualOmissionRigid221_centerInPhysicalClass`.

## Current-HEAD result

The candidate is **not compatible** with the current source.

1. `ExactFourMutualOmissionRigid221GlobalDeletion` is declared at
   `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean:52`
   with explicit parameters `R`, `rho`, `u`, `v`, and `jointDeletion`. Thus
   `Q : ... R rho` is only a partial application and does not elaborate.
2. The structure fields at lines 59–86 are `rigid`, `center`, `deleted`,
   `center_mem_remaining`, deletion minimality, `blocked`, `restores`, and
   `geometry`. There are no `sourceContext` or `jointDeletion` fields on `Q`.
3. Neither
   `false_of_exactFourMutualOmissionRigid221_actualBlocker_mem_physicalClass`
   nor `false_of_exactFourMutualOmissionRigid221_centerInPhysicalClass` exists
   in the current Lean source or indexed corpus.
4. The current S0-facing consumers use the placement API with separate context
   and deletion arguments, including
   `B1ExactFiveSourceBlockerOutcome.lean:150–162` and
   `Rigid221Closure.lean:236–240`.

The claimed proof route therefore lacks both a well-typed candidate signature
and its stated contradiction dependency. No Lean source edit or generic B2
sorry edit was made, and no build was run. The lane is awaiting a current-HEAD
handoff or a corrected statement with an actual on-spine consumer.

## Evidence classification

The compatibility result is **EMPIRICALLY VERIFIED** by direct current-source
inspection, indexed search, and an independent read-only subagent audit. It is
not a proof of the proposed mathematical theorem.
