import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Direct blocker-`v` terminal attempt

This file develops source-clean consequences of the global deletion retained by
the rigid `2+2+1` branch.  In an exact-five radius class, a nonempty
cardinality-minimal deletion that blocks the centre and whose one-point
restorations all recover `K4` deletes exactly two points.  Moreover every
restored witness is forced back onto the original radius: any different radius
would be unchanged by the deletion and would contradict blocking.

The result is deliberately proved from the structure fields, rather than by
calling any downstream closer for the production blocker-`v` obligation.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

private theorem selectedClass_sdiff_eq
    (A T : Finset ℝ²) (center : ℝ²) (rho : ℝ) :
    SelectedClass (A \ T) center rho =
      SelectedClass A center rho \ T := by
  ext z
  simp only [mem_selectedClass, Finset.mem_sdiff]
  tauto

/-- A restored witness at a different radius would already survive the full
deletion.  Thus a minimally blocking subdeletion of an exact-five radius class
has exactly two members. -/
theorem exact_two_of_exact_five_radius_minimal_blocking
    {A T : Finset ℝ²} {center : ℝ²} {rho : ℝ}
    (hrho : 0 < rho)
    (hfive : (SelectedClass A center rho).card = 5)
    (hTne : T.Nonempty)
    (hTsub : T ⊆ SelectedClass A center rho)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A \ T) center)
    (hrestores : ∀ s ∈ T,
      HasNEquidistantPointsAt 4 (A \ T.erase s) center) :
    T.card = 2 := by
  let C := SelectedClass A center rho
  have hTcardLower : 2 ≤ T.card := by
    by_contra hnot
    have hTcard : T.card ≤ 1 := by omega
    apply hblocked
    refine ⟨rho, hrho, ?_⟩
    change 4 ≤ (SelectedClass (A \ T) center rho).card
    rw [selectedClass_sdiff_eq]
    rw [Finset.card_sdiff_of_subset hTsub]
    rw [hfive]
    omega
  have hTcardUpper : T.card ≤ 2 := by
    obtain ⟨s, hs⟩ := hTne
    rcases hrestores s hs with ⟨tau, htau, hfour⟩
    change
      4 ≤ (SelectedClass (A \ T.erase s) center tau).card at hfour
    have hsC : s ∈ C := hTsub hs
    have hsdist : dist center s = rho :=
      (mem_selectedClass.mp hsC).2
    have htauEq : tau = rho := by
      by_contra hne
      apply hblocked
      refine ⟨tau, htau, ?_⟩
      change 4 ≤ (SelectedClass (A \ T) center tau).card
      have hclasses :
          SelectedClass (A \ T.erase s) center tau =
            SelectedClass (A \ T) center tau := by
        ext z
        simp only [mem_selectedClass, Finset.mem_sdiff, Finset.mem_erase]
        constructor
        · rintro ⟨⟨hzA, hzNotErase⟩, hzdist⟩
          refine ⟨⟨hzA, ?_⟩, hzdist⟩
          intro hzT
          apply hzNotErase
          refine ⟨?_, hzT⟩
          intro hzs
          subst z
          exact hne (hzdist.symm.trans hsdist)
        · rintro ⟨⟨hzA, hzNotT⟩, hzdist⟩
          refine ⟨⟨hzA, ?_⟩, hzdist⟩
          intro hzErase
          exact hzNotT hzErase.2
      rw [← hclasses]
      exact hfour
    subst tau
    rw [selectedClass_sdiff_eq] at hfour
    have hEraseSub : T.erase s ⊆ C := by
      intro z hz
      exact hTsub (Finset.mem_of_mem_erase hz)
    rw [Finset.card_sdiff_of_subset hEraseSub] at hfour
    rw [hfive, Finset.card_erase_of_mem hs] at hfour
    omega
  omega

/-- The global deletion carried by the rigid physical-apex context is not an
opaque deletion of up to five points: it is exactly a two-point deletion. -/
theorem rigid221_globalDeletion_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    P.globalDeletion.deleted.card = 2 := by
  apply exact_two_of_exact_five_radius_minimal_blocking
      (A := D.A) (center := S.oppApex2) (rho := P.rho)
  · exact P.hrho
  · exact P.hclassFive
  · exact P.globalDeletion.deleted_nonempty
  · exact P.globalDeletion.deleted_subset_class
  · simpa only [P.hcenter] using P.globalDeletion.blocked
  · intro s hs
    simpa only [P.hcenter] using P.globalDeletion.restores s hs

/-- In the source-row-heavy blocker-`v` branch, the blocker itself is forced
into the strict physical second-cap interior.  The rigid packet supplies the
second source-row point in the physical radius class; heaviness puts both
points in the strict cap, and the two-center localization theorem then puts
their second bisector center `v` there as well. -/
theorem blockerV_sourceRowHeavy_v_mem_secondCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    (hsourceRowHeavy : P.sourceRowInteriorCount = 2) :
    P.v.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
  classical
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let I := K.support ∩ C
  have hblockerU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = P.v.1 := by
    simpa only [P.huSource] using hblocker
  have hICard : I.card = 2 := by
    rcases P.globalDeletion.rigid with
      ⟨hIuCard, _hIvCard, _hdisjoint, _hcover⟩
    simpa [I, K, C] using hIuCard
  have hIInteriorCard :
      (I ∩ S.capInteriorByIndex S.oppIndex2).card = 2 := by
    simpa [ExactFourRigid221PhysicalApexSourceEqUContext.sourceRowInteriorCount,
      I, K, C] using hsourceRowHeavy
  have hIInteriorEq :
      I ∩ S.capInteriorByIndex S.oppIndex2 = I := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_left
    omega
  have hsourceI : P.source.1 ∈ I := by
    refine Finset.mem_inter.mpr ⟨?_, ?_⟩
    · simpa [K, P.huSource] using K.q_mem_support
    · simpa [C, P.huSource] using P.huClass
  have hsourceSupport : P.source.1 ∈ K.support :=
    (Finset.mem_inter.mp hsourceI).1
  obtain ⟨x, y, hxy, hIEq⟩ := Finset.card_eq_two.mp hICard
  have hsourceCases : P.source.1 = x ∨ P.source.1 = y := by
    rw [hIEq] at hsourceI
    simpa only [Finset.mem_insert, Finset.mem_singleton] using hsourceI
  rcases hsourceCases with hsourceEq | hsourceEq
  · let partner := y
    have hpartnerI : partner ∈ I := by
      rw [hIEq]
      simp [partner]
    have hsourcePartner : P.source.1 ≠ partner := by
      simpa [partner, hsourceEq] using hxy
    have hpartnerData := Finset.mem_inter.mp hpartnerI
    have hpartnerInterior :
        partner ∈ S.capInteriorByIndex S.oppIndex2 := by
      have : partner ∈ I ∩ S.capInteriorByIndex S.oppIndex2 := by
        rw [hIInteriorEq]
        exact hpartnerI
      exact (Finset.mem_inter.mp this).2
    have hcenterNe : P.v.1 ≠ S.oppApex2 := by
      intro h
      have hvDist := (mem_selectedClass.mp P.hvClass).2
      rw [h] at hvDist
      simp only [dist_self] at hvDist
      linarith [P.hrho]
    apply commonPhysicalPair_center_mem_secondCapInterior
      P.v.2 hcenterNe P.context.source_mem_interior hpartnerInterior
      hsourcePartner
    · exact
        (by
          simpa [K, hblockerU] using
            (K.support_eq_radius P.source.1 hsourceSupport).trans
              (K.support_eq_radius partner hpartnerData.1).symm)
    · exact
        (mem_selectedClass.mp P.context.source_mem_class).2.trans
          (mem_selectedClass.mp hpartnerData.2).2.symm
  · let partner := x
    have hpartnerI : partner ∈ I := by
      rw [hIEq]
      simp [partner]
    have hsourcePartner : P.source.1 ≠ partner := by
      simpa [partner, hsourceEq] using hxy.symm
    have hpartnerData := Finset.mem_inter.mp hpartnerI
    have hpartnerInterior :
        partner ∈ S.capInteriorByIndex S.oppIndex2 := by
      have : partner ∈ I ∩ S.capInteriorByIndex S.oppIndex2 := by
        rw [hIInteriorEq]
        exact hpartnerI
      exact (Finset.mem_inter.mp this).2
    have hcenterNe : P.v.1 ≠ S.oppApex2 := by
      intro h
      have hvDist := (mem_selectedClass.mp P.hvClass).2
      rw [h] at hvDist
      simp only [dist_self] at hvDist
      linarith [P.hrho]
    apply commonPhysicalPair_center_mem_secondCapInterior
      P.v.2 hcenterNe P.context.source_mem_interior hpartnerInterior
      hsourcePartner
    · exact
        (by
          simpa [K, hblockerU] using
            (K.support_eq_radius P.source.1 hsourceSupport).trans
              (K.support_eq_radius partner hpartnerData.1).symm)
    · exact
        (mem_selectedClass.mp P.context.source_mem_class).2.trans
          (mem_selectedClass.mp hpartnerData.2).2.symm

#print axioms exact_two_of_exact_five_radius_minimal_blocking
#print axioms rigid221_globalDeletion_card_eq_two
#print axioms blockerV_sourceRowHeavy_v_mem_secondCapInterior

end ATailFrontierLiveClosure
end Problem97
