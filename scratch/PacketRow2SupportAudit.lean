import Erdos9796Proof.P97.ATail.FrontierLiveClosure

open scoped EuclideanGeometry

namespace Problem97
namespace ScratchPacketRow2SupportAudit

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

private def qDeletedK4ClassToSelectedFourClass
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D q center B)
    (hcard : B.card = 4) :
    SelectedFourClass D.A center where
  support := B
  support_subset_A := by
    intro y hy
    have hyErase : y ∈ (D.skeleton q).erase center := K.subset hy
    have hySkeleton : y ∈ D.skeleton q := (Finset.mem_erase.mp hyErase).2
    exact (Finset.mem_erase.mp hySkeleton).2
  support_card := hcard
  radius := K.radius
  radius_pos := K.radius_pos
  support_eq_radius := K.same_radius
  center_not_mem := by
    intro hcenter
    exact (Finset.mem_erase.mp (K.subset hcenter)).1 rfl

private theorem qDeletedK4Class_support_eq_selectedShell
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source deleted : ℝ²} {B : Finset ℝ²}
    (hsource : source ∈ D.A)
    (K :
      U5QDeletedK4Class D deleted (H.centerAt source hsource) B)
    (hcard : B.card = 4) :
    B = (H.selectedAt source hsource).toCriticalFourShell.support := by
  exact H.selectedFourClass_support_eq_shell source hsource
    (qDeletedK4ClassToSelectedFourClass K hcard)

/-- The exact information carried by the four blocker-centered packet rows.

The two common-deletion rows omit the prescribed fresh source.  The two
reverse-cycle rows omit one (not prescribed which) source from the opposite
collision pair.  No row field supplies positive membership in the
physical-apex row of the same packet. -/
theorem packetRow₂_support_and_omission_audit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP) :
    LPρ.packet.B₂ =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support ∧
      LP.packet.B₂ =
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∧
      MPρ.collisionSourcePacket.B₂ =
        (H.selectedAt LPρ.fresh
          LPρ.packet.q_mem_A).toCriticalFourShell.support ∧
      MP.collisionSourcePacket.B₂ =
        (H.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support ∧
      Pρ.source₁ ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support ∧
      P.source₁ ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support ∧
      MPρ.collisionSource ∉
        (H.selectedAt LPρ.fresh
          LPρ.packet.q_mem_A).toCriticalFourShell.support ∧
      MP.collisionSource ∉
        (H.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support := by
  have hLPρB₂ :
      LPρ.packet.B₂ =
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support :=
    qDeletedK4Class_support_eq_selectedShell
      P.source₁_mem_A LPρ.packet.row₂ LPρ.packet.B₂_card
  have hLPB₂ :
      LP.packet.B₂ =
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support :=
    qDeletedK4Class_support_eq_selectedShell
      Pρ.source₁_mem_A LP.packet.row₂ LP.packet.B₂_card
  have hMPρB₂Fresh :
      MPρ.collisionSourcePacket.B₂ =
        (H.selectedAt LPρ.fresh
          LPρ.packet.q_mem_A).toCriticalFourShell.support :=
    qDeletedK4Class_support_eq_selectedShell
      LPρ.packet.q_mem_A
      MPρ.collisionSourcePacket.row₂
      MPρ.collisionSourcePacket.B₂_card
  have hMPB₂Fresh :
      MP.collisionSourcePacket.B₂ =
        (H.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support :=
    qDeletedK4Class_support_eq_selectedShell
      LP.packet.q_mem_A
      MP.collisionSourcePacket.row₂
      MP.collisionSourcePacket.B₂_card
  have hPρ₁NotP :
      Pρ.source₁ ∉
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support := by
    rw [← hLPρB₂, ← hLPρ]
    exact LPρ.packet.row₂.q_not_mem
  have hP₁NotPρ :
      P.source₁ ∉
        (H.selectedAt Pρ.source₁
          Pρ.source₁_mem_A).toCriticalFourShell.support := by
    rw [← hLPB₂, ← hLP]
    exact LP.packet.row₂.q_not_mem
  have hMPρSourceNotPρ :
      MPρ.collisionSource ∉
        (H.selectedAt LPρ.fresh
          LPρ.packet.q_mem_A).toCriticalFourShell.support := by
    rw [← hMPρB₂Fresh]
    exact MPρ.collisionSourcePacket.row₂.q_not_mem
  have hMPSourceNotP :
      MP.collisionSource ∉
        (H.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support := by
    rw [← hMPB₂Fresh]
    exact MP.collisionSourcePacket.row₂.q_not_mem
  exact ⟨hLPρB₂, hLPB₂, hMPρB₂Fresh, hMPB₂Fresh,
    hPρ₁NotP, hP₁NotPρ, hMPρSourceNotPρ, hMPSourceNotP⟩

end ScratchPacketRow2SupportAudit
end Problem97
