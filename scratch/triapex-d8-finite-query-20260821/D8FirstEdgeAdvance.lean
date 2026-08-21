import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TriApexEndpointRetainedOmission

/-! # First strict order advance for the F1/D8 endpoint cycle -/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingEndpointCollisionLocalization
open ATailRetainedMatchingEndpointContinuation
open ATailRetainedMatchingLargeCapConsumer

/-- The first strict order advance carried by the D8 endpoint cycle context:
the deleted-source blocker lies strictly between the retained endpoint and the
deleted endpoint in the canonical order of the first cap.

This is a thin adapter to the already-proved reverse-hit separation theorem.
It deliberately keeps the complete cycle argument so it can be inserted
immediately before the remaining D8 terminal. -/
theorem endpointDistinctBlockerThreeStepDeletionCycle_deletedBlocker_between
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (C : ReverseHitFreshEndpointContext R O)
    (E : RetainedMatchingEndpointCriticalFiber C.walk)
    (Q : EndpointFreshFirstApexRowSource E)
    (_cycle : EndpointDistinctBlockerThreeStepDeletionCycle R O C E Q) :
    ∃ (m : ℕ) (L : CGN.OrderedCap m)
      (Packet : CGN.MecCapPacket D.A L)
      (_Hside : CGN.MinorCapSideHypotheses Packet)
      (_Hord : CGN.StrictCapOrder D.A L)
      (ib ic id : Fin m),
        Finset.univ.image L.points = S.capByIndex S.oppIndex1 ∧
        L.points ic = Q.C ∧
        L.points id = O.deleted ∧
        L.points ib = H.centerAt O.deleted O.deleted_mem_A ∧
        ((ic < ib ∧ ib < id) ∨ (id < ib ∧ ib < ic)) := by
  have hCeq : Q.C = O.kept :=
    Q.C_eq_fiber_source₁.trans
      (E.fiber_source₁_eq_first.trans C.walk_first_eq)
  rcases exists_firstCap_cgn_order_between_reverseBlocker_of_reverseHit O
      C.reverse_mem C.reverseBlocker_mem_capInterior
      C.reverseShell_inter_cap_eq with
    ⟨m, L, Packet, Hside, Hord, ib, ic, id,
      hcap, hic, hid, hib, hbetween⟩
  exact ⟨m, L, Packet, Hside, Hord, ib, ic, id,
    hcap, by simpa only [hCeq] using hic, hid, hib, hbetween⟩

end ATailFrontierLiveClosure
end Problem97
