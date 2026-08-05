import Erdos9796Proof.P97.ATail.FrontierLiveClosure

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry

open ATailApexRichClassStructure
open ATailBiApexBlockerMultiplicity
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailBlockerMultiplicityGeometry
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector
open ATailMinimalUniqueFourCover

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

theorem distinctCaps_sourceCap_eq_opp_probe
    (source : CriticalShellSystem.CarrierVertex D.A)
    (hsource : CapSourceThirdCanonicalRowWitness P Pρ source)
    (Q : FreshThirdBlockerFiber P Pρ)
    {sourceCap freshCap : Fin 3}
    (sourceCenter_canonical :
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex S.oppIndex1)
    (sourceCenter_mem :
      H.centerAt source.1 source.2 ∈ S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (caps_ne : sourceCap ≠ freshCap) :
    sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 := by
  have hsourceCap : sourceCap = S.oppIndex1 := by
    by_contra hne
    exact
      (S.capInteriorByIndex_ne_of_mem_of_mem_ne
        sourceCenter_mem sourceCenter_canonical hne) rfl
  refine ⟨hsourceCap, ?_⟩
  intro hfreshCap
  exact caps_ne (hsourceCap.trans hfreshCap.symm)

theorem commonRadius_distinctCaps_isolate_probe
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (hrich : ApexRichClassStructure D.A S.oppApex1)
    (Q : FreshThirdBlockerFiber P Pρ)
    {sourceCap freshCap : Fin 3}
    (sourceCenter_mem :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (caps_ne : sourceCap ≠ freshCap)
    (hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2) :
    sourceCap = S.oppIndex1 ∧ freshCap ≠ S.oppIndex1 := by
  have hfirstIndexed :
      C.surface.firstSource.1 ∈
        SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) C.commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simpa only [oppositeVertexByIndex_oppIndex1] using
      (Finset.mem_inter.mpr
        ⟨C.firstSource_mem, C.surface.firstSource_data.2.1⟩)
  have hsecondIndexed :
      C.surface.secondSource.1 ∈
        SelectedClass D.A
            (S.oppositeVertexByIndex S.oppIndex1) C.commonRadius ∩
          S.capInteriorByIndex S.oppIndex1 := by
    simpa only [oppositeVertexByIndex_oppIndex1] using
      (Finset.mem_inter.mpr
        ⟨C.secondSource_mem, C.surface.secondSource_data.2.1⟩)
  have hgeometry :=
    equalBlocker_sameRadiusInterior_shell_inter_cap_eq_pair
      C.surface.firstSource.2 C.surface.secondSource.2 hfirstIndexed hsecondIndexed
      C.surface.sources_ne hcenters
      (by simpa only [oppositeVertexByIndex_oppIndex1] using hrich)
      (isUniqueFourCenter_centerAt H
        C.surface.firstSource.1 C.surface.firstSource.2)
  have hsourceCap : sourceCap = S.oppIndex1 := by
    by_contra hne
    exact
      (S.capInteriorByIndex_ne_of_mem_of_mem_ne
        sourceCenter_mem hgeometry.1 hne) rfl
  refine ⟨hsourceCap, ?_⟩
  intro hfreshCap
  exact caps_ne (hsourceCap.trans hfreshCap.symm)

theorem equalCenter_distinctCaps_indices_agree_probe
    (C : CommonRadiusTwoCapSourceThirdCanonicalRowSurface P Pρ)
    (Q : FreshThirdBlockerFiber P Pρ)
    {sourceCap freshCap sourceCap' freshCap' : Fin 3}
    (sourceCenter_mem :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 ∈
        S.capInteriorByIndex sourceCap)
    (sourceCenter_mem' :
      H.centerAt C.surface.secondSource.1 C.surface.secondSource.2 ∈
        S.capInteriorByIndex sourceCap')
    (freshCenter_mem :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap)
    (freshCenter_mem' :
      H.centerAt Q.source₁.1 Q.source₁.2 ∈
        S.capInteriorByIndex freshCap')
    (hcenters :
      H.centerAt C.surface.firstSource.1 C.surface.firstSource.2 =
        H.centerAt C.surface.secondSource.1 C.surface.secondSource.2) :
    sourceCap = sourceCap' ∧ freshCap = freshCap' := by
  have hsourceCap : sourceCap = sourceCap' := by
    by_contra hne
    exact
      (S.capInteriorByIndex_ne_of_mem_of_mem_ne sourceCenter_mem
        (by simpa [hcenters] using sourceCenter_mem') hne) rfl
  have hfreshCap : freshCap = freshCap' := by
    by_contra hne
    exact
      (S.capInteriorByIndex_ne_of_mem_of_mem_ne freshCenter_mem
        freshCenter_mem' hne) rfl
  exact ⟨hsourceCap, hfreshCap⟩

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
