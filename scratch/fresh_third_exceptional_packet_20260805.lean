import Erdos9796Proof.P97.ATail.FrontierLiveClosure

open scoped EuclideanGeometry

namespace Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal

open Problem97
open Problem97.ATailFrontierLiveClosure
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailBlockerMultiplicityGeometry
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge

#check freshThird_canonicalDifferentCap_endpointPlacement
#check freshThird_canonicalDifferentCap_sourceSupportPlacement
#check freshThird_commonRadius_distinctCaps_dual_packet

/- A source-clean positive packet: endpoint order/support data plus the
   canonical source-point block.  This is deliberately a producer only; no
   contradiction is asserted. -/
def FreshThirdExceptionalBoundaryMetricPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ) : Prop :=
  ∃ (B : BoundaryIndexing D.A) (hn : 0 < B.n) (iv iw : Fin B.n),
    B.boundary (zeroIndex hn) =
        S.oppositeVertexByIndex S.surplusIdx ∧
    B.boundary iv = S.oppositeVertexByIndex S.oppIndex1 ∧
    B.boundary iw = S.oppositeVertexByIndex S.oppIndex2 ∧
    (DirectBoundaryBlocks S B.boundary hn iv iw ∨
      MirrorBoundaryBlocks S B.boundary hn iv iw) ∧
    (let sourceCenter : CarrierLabel D.A :=
        ⟨H.centerAt C.surface.firstSource.1 C.surface.firstSource.2,
          (Finset.mem_erase.mp
            (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.center_mem).2⟩
     let freshCenter : CarrierLabel D.A :=
        ⟨H.centerAt Q.source₁.1 Q.source₁.2,
          (Finset.mem_erase.mp
            (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.center_mem).2⟩
     let firstPoint : CarrierLabel D.A := ⟨Q.source₁.1, Q.source₁.2⟩
     let secondPoint : CarrierLabel D.A := ⟨Q.source₂.1, Q.source₂.2⟩
     FreshThirdAlternatingEndpointPlacement
       (B.indexOf sourceCenter) (B.indexOf freshCenter)
       (B.indexOf firstPoint) (B.indexOf secondPoint) ∧
       firstPoint.1 ∈
         (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∧
       secondPoint.1 ∈
         (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∧
       firstPoint.1 ∈
         (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support ∧
       secondPoint.1 ∈
         (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support) ∧
    FreshThirdCanonicalSourceSupportPlacement
      (zeroIndex hn) iv iw
      (B.indexOf ⟨C.surface.firstSource.1, C.surface.firstSource.2⟩)

theorem freshThird_exceptionalBoundaryMetricPacket_of_endpoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    (centers_ne :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (hpacket :
      sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 ∧
        Q.source₁.1 ∉ S.capByIndex S.oppIndex1 ∧
        Q.source₂.1 ∉ S.capByIndex S.oppIndex1) :
    FreshThirdExceptionalBoundaryMetricPacket P Pρ C Q := by
  rcases freshThird_canonicalDifferentCap_endpointPlacement
      (P := P) (Pρ := Pρ) C.surface Q centers_ne source₁_mem source₂_mem
      sourceCap freshCap sourceCenter_mem freshCenter_mem hpacket with
    ⟨B, hn, iv, iw, hzero, hiv, hiw, hblocks, horder⟩
  have hsource :=
    freshThird_canonicalDifferentCap_sourceSupportPlacement
      (P := P) (Pρ := Pρ) C.surface B hn iv iw hblocks
  exact ⟨B, hn, iv, iw, hzero, hiv, hiw, hblocks, horder, hsource⟩

/- The actual exceptional two-row branch: dual cap extraction supplies the
   hpacket required by the endpoint producer. -/
theorem freshThird_exceptionalBoundaryMetricPacket_of_dual_interactions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    {B : ATailPhysicalSecondApexCommonDeletion.FrontierBiApexRobustResidual R}
    {L : ATailLargeOppositeCapsBiApexSurface.FrontierLargeOppositeCapsBiApexRobustResidual B}
    {N : FrontierAllLargeCapsBiApexRobustResidual L}
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2)
    (centers_ne :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (source₂_mem :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support)
    (overlap_eq :
      (H.selectedAt C.surface.firstSource.1 C.surface.firstSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (sourceCap freshCap : Fin 3)
    (sourceCenter_mem :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capInteriorByIndex freshCap)
    (caps_ne : sourceCap ≠ freshCap)
    (centers_ne' :
      H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ≠
        H.centerAt Q.source₁.1 Q.source₁.2)
    (source₁_mem' :
      Q.source₁.1 ∈
        (H.selectedAt C.surface.secondSource.1 C.surface.secondSource.2).toCriticalFourShell.support)
    (source₂_mem' :
      Q.source₂.1 ∈
        (H.selectedAt C.surface.secondSource.1 C.surface.secondSource.2).toCriticalFourShell.support)
    (overlap_eq' :
      (H.selectedAt C.surface.secondSource.1 C.surface.secondSource.2).toCriticalFourShell.support ∩
          (H.selectedAt Q.source₁.1 Q.source₁.2).toCriticalFourShell.support =
        {Q.source₁.1, Q.source₂.1})
    (sourceCap' freshCap' : Fin 3)
    (sourceCenter_mem' :
      H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ∈
        S.capInteriorByIndex sourceCap')
    (freshCenter_mem' :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈ S.capInteriorByIndex freshCap')
    (caps_ne' : sourceCap' ≠ freshCap') :
    FreshThirdExceptionalBoundaryMetricPacket P Pρ C Q := by
  rcases freshThird_commonRadius_distinctCaps_dual_packet
      (P := P) (Pρ := Pρ) T C Q hcenters centers_ne source₁_mem
      source₂_mem overlap_eq sourceCap freshCap sourceCenter_mem
      freshCenter_mem caps_ne centers_ne' source₁_mem' source₂_mem'
      overlap_eq' sourceCap' freshCap' sourceCenter_mem' freshCenter_mem'
      caps_ne' with
    ⟨hsource, hfresh, hsource', hfresh', hsourceEq, hfreshEq, hq1Off, hq2Off⟩
  exact freshThird_exceptionalBoundaryMetricPacket_of_endpoint
    (P := P) (Pρ := Pρ) C Q centers_ne source₁_mem source₂_mem sourceCap
    freshCap sourceCenter_mem freshCenter_mem
    ⟨hsource, hfresh, hq1Off, hq2Off⟩

end Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal
