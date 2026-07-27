import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificateIngress
import Erdos9796Proof.P97.ATail.ExactFourPhysicalConsumer
import Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion
import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual
import Erdos9796Proof.P97.ATail.LocalizedCollisionMutualOmissionCycle
import Erdos9796Proof.P97.ATail.PhysicalSecondApexSwap
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization

namespace Problem97
namespace ATailTwoFrontierJointConsumerProbe

open ATailCriticalPairFrontier
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- The proposed construction really does produce a second parent residual at
the prescribed radius. This theorem deliberately stops at that data. -/
theorem nonempty_secondRadius_commonDeletionParent
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorBlockerCollision R)
    (hfrontierFour :
      (SelectedClass D.A S.oppApex1 radius).card = 4)
    (ρ : ℝ)
    (hρpos : 0 < ρ)
    (hρne : ρ ≠ radius)
    (hρfour : 4 ≤ (SelectedClass D.A S.oppApex1 ρ).card) :
    ∃ Fρ : CriticalPairFrontier D S ρ H,
      Nonempty (FrontierCommonDeletionParentResidual Fρ) := by
  classical
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.oppIndex1, hi]
  have hradiusPos : 0 < radius := by
    have hsourceNe : P.source₁ ≠ S.oppApex1 := by
      simpa only [hcenter] using
        S.capInteriorByIndex_ne_oppositeVertexByIndex
          P.source₁_mem_capInterior
    have hdistPos : 0 < dist S.oppApex1 P.source₁ :=
      dist_pos.mpr hsourceNe.symm
    have hdistRadius : dist S.oppApex1 P.source₁ = radius := by
      simpa only [dist_comm] using
        (mem_selectedClass.mp P.source₁_mem_radius).2
    simpa only [hdistRadius] using hdistPos
  let C : Finset (EuclideanSpace ℝ (Fin 2)) :=
    D.A.filter fun x ↦ dist x S.oppApex1 = ρ
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  have hCfour : 4 ≤ C.card := by
    simpa [C, SelectedClass, dist_comm] using hρfour
  have hhit : (C ∩ S.surplusCap).card ≤ 1 := by
    simpa [DS, C] using
      U2NonSurplusSqueeze.oppApex1_surplusCap_one_hit DS ρ
  have hsplit := Finset.card_sdiff_add_card_inter C S.surplusCap
  have hthree : 3 ≤ (C \ S.surplusCap).card := by omega
  rcases
      exists_criticalPairFrontier D S ρ H
        (by simpa only [C] using hthree) with
    ⟨Fρ⟩
  refine ⟨Fρ, ?_⟩
  rcases
      CriticalPairFrontier.originalUnique_or_commonDeletionParent
        Fρ R.minimal R.noM44 R.carrier_card_gt_nine hρfour with
    hunique | hcommon
  · exfalso
    have hradiusEq :
        radius = ρ :=
      hunique.2 radius hradiusPos (by omega)
    exact hρne hradiusEq.symm
  · exact hcommon

/-- Distinct frontier radii separate all four cross-pair source equalities.
This is the strongest immediate cross-frontier fact used in the audit. -/
theorem frontier_pair_sources_cross_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r ρ : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (Fρ : CriticalPairFrontier D S ρ H)
    (hρne : ρ ≠ r) :
    F.pair.q ≠ Fρ.pair.q ∧
      F.pair.q ≠ Fρ.pair.w ∧
      F.pair.w ≠ Fρ.pair.q ∧
      F.pair.w ≠ Fρ.pair.w := by
  have hFq : dist F.pair.q S.oppApex1 = r :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1).2
  have hFw : dist F.pair.w S.oppApex1 = r :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.w_mem_marginal).1).2
  have hρq : dist Fρ.pair.q S.oppApex1 = ρ :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp Fρ.pair.q_mem_marginal).1).2
  have hρw : dist Fρ.pair.w S.oppApex1 = ρ :=
    (Finset.mem_filter.mp
      (Finset.mem_sdiff.mp Fρ.pair.w_mem_marginal).1).2
  constructor
  · intro h
    apply hρne
    calc
      ρ = dist Fρ.pair.q S.oppApex1 := hρq.symm
      _ = dist F.pair.q S.oppApex1 := by rw [h]
      _ = r := hFq
  constructor
  · intro h
    apply hρne
    calc
      ρ = dist Fρ.pair.w S.oppApex1 := hρw.symm
      _ = dist F.pair.q S.oppApex1 := by rw [h]
      _ = r := hFq
  constructor
  · intro h
    apply hρne
    calc
      ρ = dist Fρ.pair.q S.oppApex1 := hρq.symm
      _ = dist F.pair.w S.oppApex1 := by rw [h]
      _ = r := hFw
  · intro h
    apply hρne
    calc
      ρ = dist Fρ.pair.w S.oppApex1 := hρw.symm
      _ = dist F.pair.w S.oppApex1 := by rw [h]
      _ = r := hFw

#check fullyDeletionRobustAt_of_two_K4_radii
#check FrontierCommonDeletionParentResidual.firstApexFullyDeletionRobust
#check CriticalPairFrontier.originalUnique_or_commonDeletionParent
#check exists_criticalPairFrontier
#print axioms nonempty_secondRadius_commonDeletionParent
#print axioms frontier_pair_sources_cross_ne

end ATailTwoFrontierJointConsumerProbe
end Problem97
