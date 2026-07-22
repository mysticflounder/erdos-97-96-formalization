/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DirectSourceBaseFacts
import DirectSourceRankInstances
import VerifiedPass5DirectIngress

/-!
# Exact-five card-thirteen same-radius coordinator

This module composes the source-faithful semantic row table with the verified
pass-five LRAT endpoint.  The finite encoding's blocker variables are used
only as guards for already-proved row equality.  We therefore choose the
constant blocker assignment at this boundary, rather than imposing the
stronger and unnecessary claim that canonical index `1` is always the
distinguished geometric source in both boundary-order orbits.
-/

namespace Problem97
namespace ATailExactFiveCard13CnfIngressScratch

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailCapApexRadiusRigidity
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveFirstApexCard13Scratch
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable

open Problem97.ATailExactFiveVerifiedPass5

attribute [local instance] Classical.propDecidable

noncomputable section

/-- A certificate-local blocker assignment.  The selected core uses blocker
bits only to guard the already-proved equality between the left cover row and
the main row at center `2`, plus the fixed assertion that slot `1` has value
`2`.  No geometric blocker data are discarded by choosing these auxiliary
bits uniformly. -/
def directCertificateBlockers : BlockerBits :=
  packThirteenBlockers fun _ ↦ 2#4

@[simp]
theorem blockerAt_directCertificateBlockers (source : Fin 13) :
    blockerAt directCertificateBlockers source.val = 2#4 := by
  simp [directCertificateBlockers]

/-- The source assertions between the reusable base package and the generated
rank chunks. -/
structure DirectSourceRoleAssertions
    (rows : RowBits) (blockers : BlockerBits) (q w : RoleBits)
    (b1 : FirstRowBits) : Prop where
  h0145 : ((!((q == 9#4)) || (!(firstRowBit b1 9)))) = true
  h0146 : ((!((w == 9#4)) || (!(firstRowBit b1 9)))) = true
  h0147 : ((!((q == 10#4)) || (!(firstRowBit b1 10)))) = true
  h0148 : ((!((w == 10#4)) || (!(firstRowBit b1 10)))) = true
  h0149 : ((!((q == 11#4)) || (!(firstRowBit b1 11)))) = true
  h0150 : ((!((w == 11#4)) || (!(firstRowBit b1 11)))) = true
  h0151 : ((!((q == 12#4)) || (!(firstRowBit b1 12)))) = true
  h0152 : ((!((w == 12#4)) || (!(firstRowBit b1 12)))) = true
  h0153 : ((((bif firstRowBit b1 4 then 1#4 else 0#4) +
    (bif firstRowBit b1 5 then 1#4 else 0#4) +
    (bif firstRowBit b1 6 then 1#4 else 0#4) +
    (bif firstRowBit b1 7 then 1#4 else 0#4) +
    (bif firstRowBit b1 8 then 1#4 else 0#4))).ule 1#4) = true
  h0154 : ((((bif firstRowBit b1 0 then 1#4 else 0#4) +
    (bif firstRowBit b1 1 then 1#4 else 0#4) +
    (bif firstRowBit b1 2 then 1#4 else 0#4) +
    (bif firstRowBit b1 3 then 1#4 else 0#4) +
    (bif firstRowBit b1 4 then 1#4 else 0#4))).ule 1#4) = true
  h0155 : (!((rowBit rows 1 6 2 && rowBit rows 1 6 1))) = true
  h0156 : (!((rowBit rows 2 5 2 && rowBit rows 2 5 3))) = true
  h0157 : ((blockerAt blockers 1 == 2#4)) = true
  h0158 : (rowBit rows 0 2 1) = true
  h0159 : (rowBit rows 0 2 3) = true
  h0160 : (!(rowBit rows 0 2 0)) = true
  h0161 : (!(rowBit rows 0 2 4)) = true
  h0162 : ((2#4).ule ((bif rowBit rows 0 4 9 then 1#4 else 0#4) +
    (bif rowBit rows 0 4 10 then 1#4 else 0#4) +
    (bif rowBit rows 0 4 11 then 1#4 else 0#4) +
    (bif rowBit rows 0 4 12 then 1#4 else 0#4))) = true
  h0163 : ((2#4).ule ((bif firstRowBit b1 9 then 1#4 else 0#4) +
    (bif firstRowBit b1 10 then 1#4 else 0#4) +
    (bif firstRowBit b1 11 then 1#4 else 0#4) +
    (bif firstRowBit b1 12 then 1#4 else 0#4))) = true
  h0164 : ((((q == 9#4) && rowBit rows 0 4 9) ||
    ((q == 10#4) && rowBit rows 0 4 10) ||
    ((q == 11#4) && rowBit rows 0 4 11) ||
    ((q == 12#4) && rowBit rows 0 4 12) ||
    ((w == 9#4) && rowBit rows 0 4 9) ||
    ((w == 10#4) && rowBit rows 0 4 10) ||
    ((w == 11#4) && rowBit rows 0 4 11) ||
    ((w == 12#4) && rowBit rows 0 4 12))) = true
  h0165 : ((((bif (rowBit rows 0 4 0 || firstRowBit b1 0) then 1#4 else 0#4) +
    (bif (rowBit rows 0 4 1 || firstRowBit b1 1) then 1#4 else 0#4) +
    (bif (rowBit rows 0 4 2 || firstRowBit b1 2) then 1#4 else 0#4) +
    (bif (rowBit rows 0 4 3 || firstRowBit b1 3) then 1#4 else 0#4) +
    (bif (rowBit rows 0 4 4 || firstRowBit b1 4) then 1#4 else 0#4) +
    (bif (rowBit rows 0 4 5 || firstRowBit b1 5) then 1#4 else 0#4) +
    (bif (rowBit rows 0 4 6 || firstRowBit b1 6) then 1#4 else 0#4) +
    (bif (rowBit rows 0 4 7 || firstRowBit b1 7) then 1#4 else 0#4) +
    (bif (rowBit rows 0 4 8 || firstRowBit b1 8) then 1#4 else 0#4) +
    (bif (rowBit rows 0 4 9 || firstRowBit b1 9) then 1#4 else 0#4) +
    (bif (rowBit rows 0 4 10 || firstRowBit b1 10) then 1#4 else 0#4) +
    (bif (rowBit rows 0 4 11 || firstRowBit b1 11) then 1#4 else 0#4) +
    (bif (rowBit rows 0 4 12 || firstRowBit b1 12) then 1#4 else 0#4)) == 6#4)) = true
  h0166 : ((rowBit rows 0 4 9 || firstRowBit b1 9)) = true
  h0167 : ((rowBit rows 0 4 10 || firstRowBit b1 10)) = true
  h0168 : ((rowBit rows 0 4 11 || firstRowBit b1 11)) = true
  h0169 : ((rowBit rows 0 4 12 || firstRowBit b1 12)) = true

private theorem rowBit_left_eq_decide
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) (center point : Fin 13) :
    rowBit (directSourceRows C) 1 center.val point.val =
      decide (P.point point ∈ (C.left center).support) := by
  calc
    rowBit (directSourceRows C) 1 center.val point.val =
        directSourceRowMember C (1 : Fin 3) center point :=
      rowBit_directSourceRows C (1 : Fin 3) center point
    _ = decide (P.point point ∈ (C.left center).support) := by
      simp [directSourceRowMember]

private theorem rowBit_right_eq_decide
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) (center point : Fin 13) :
    rowBit (directSourceRows C) 2 center.val point.val =
      decide (P.point point ∈ (C.right center).support) := by
  calc
    rowBit (directSourceRows C) 2 center.val point.val =
        directSourceRowMember C (2 : Fin 3) center point :=
      rowBit_directSourceRows C (2 : Fin 3) center point
    _ = decide (P.point point ∈ (C.right center).support) := by
      simp [directSourceRowMember]

private theorem rowBit_main_eq_decide
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) (center point : Fin 13) :
    rowBit (directSourceRows C) 0 center.val point.val =
      decide (P.point point ∈ (T.main center).support) := by
  calc
    rowBit (directSourceRows C) 0 center.val point.val =
        directSourceRowMember C (0 : Fin 3) center point :=
      rowBit_directSourceRows C (0 : Fin 3) center point
    _ = decide (P.point point ∈ (T.main center).support) := by
      simp [directSourceRowMember]

private theorem selectedFourClass_support_transport_local
    {A : Finset ℝ²} {a b : ℝ²} (h : a = b)
    (K : SelectedFourClass A a) :
    (h ▸ K).support = K.support := by
  cases h
  rfl

private theorem selectedAt_support_congr
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {x y : ℝ²} (hxy : x = y) (hx : x ∈ A) (hy : y ∈ A) :
    (H.selectedAt x hx).toCriticalFourShell.support =
      (H.selectedAt y hy).toCriticalFourShell.support := by
  cases hxy
  rfl

private theorem oppCap2_eq_capByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppCap2 = S.capByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppCap2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.capByIndex, hi]

private theorem mainTwo_support_eq_actualSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    (T.main 2).support =
      (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support := by
  let hsourceA : P.point P.sourceIndex ∈ D.A := by
    rw [← P.point_image]
    exact Finset.mem_image.mpr ⟨P.sourceIndex, Finset.mem_univ _, rfl⟩
  have hcenter : P.point 2 =
      H.centerAt (P.point P.sourceIndex) hsourceA := by
    calc
      P.point 2 = P.point P.blockerIndex := by rw [P.blockerIndex_eq_two]
      _ = M.target.1 := P.blocker_point
      _ = H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) :=
        P.actualCenter_eq_blocker.symm
      _ = H.centerAt (P.point P.sourceIndex) hsourceA := by
        simp only [P.source_point]
  let Kmain : SelectedFourClass D.A
      (H.centerAt (P.point P.sourceIndex) hsourceA) :=
    hcenter ▸ T.main 2
  have hmain := H.selectedFourClass_support_eq_shell
    (P.point P.sourceIndex) hsourceA Kmain
  calc
    (T.main 2).support = Kmain.support :=
      (selectedFourClass_support_transport_local hcenter (T.main 2)).symm
    _ = (H.selectedAt (P.point P.sourceIndex) hsourceA).toCriticalFourShell.support := hmain
    _ = (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support :=
      selectedAt_support_congr H P.source_point hsourceA
        (PhysicalVertex.mem_A M.source)

private theorem mainTwo_membership_normal_form
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    P.point 1 ∈ (T.main 2).support ∧
      P.point 3 ∈ (T.main 2).support ∧
      P.point 0 ∉ (T.main 2).support ∧
      P.point 4 ∉ (T.main 2).support := by
  rw [mainTwo_support_eq_actualSupport P T]
  have hsource : P.point P.sourceIndex ∈
      (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support := by
    simpa only [P.source_point] using P.source_mem_actualSupport
  have hthird : P.point P.thirdIndex ∈
      (H.selectedAt M.source.1
        (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support := by
    simpa only [P.third_point] using P.third_mem_actualSupport
  have hout (i : Fin 13) (hiCap : P.point i ∈ S.capByIndex S.oppIndex2)
      (hiSource : i ≠ P.sourceIndex) (hiThird : i ≠ P.thirdIndex) :
      P.point i ∉
        (H.selectedAt M.source.1
          (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support := by
    intro hiSupport
    have hiInter : P.point i ∈
        (H.selectedAt M.source.1
          (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support ∩
          S.capByIndex S.oppIndex2 := Finset.mem_inter.mpr ⟨hiSupport, hiCap⟩
    rw [P.actualSupport_inter_physicalCap_eq] at hiInter
    simp only [Finset.mem_insert, Finset.mem_singleton] at hiInter
    rcases hiInter with hi | hi
    · apply hiSource
      apply P.point_injective
      exact hi.trans P.source_point.symm
    · apply hiThird
      apply P.point_injective
      exact hi.trans P.third_point.symm
  have hzeroCap : P.point 0 ∈ S.capByIndex S.oppIndex2 := by
    rw [← oppCap2_eq_capByIndex_oppIndex2 S]
    exact (P.secondOppCap_mem_iff_initial_block 0).mpr (by decide)
  have hfourCap : P.point 4 ∈ S.capByIndex S.oppIndex2 := by
    rw [← oppCap2_eq_capByIndex_oppIndex2 S]
    exact (P.secondOppCap_mem_iff_initial_block 4).mpr (by decide)
  rcases P.source_role_orbits with hforward | hreverse
  · refine ⟨?_, ?_, ?_, ?_⟩
    · simpa only [hforward.1] using hsource
    · simpa only [hforward.2.2] using hthird
    · exact hout 0 hzeroCap (by rw [hforward.1]; decide)
        (by rw [hforward.2.2]; decide)
    · exact hout 4 hfourCap (by rw [hforward.1]; decide)
        (by rw [hforward.2.2]; decide)
  · refine ⟨?_, ?_, ?_, ?_⟩
    · simpa only [hreverse.2.2] using hthird
    · simpa only [hreverse.1] using hsource
    · exact hout 0 hzeroCap (by rw [hreverse.1]; decide)
        (by rw [hreverse.2.2]; decide)
    · exact hout 4 hfourCap (by rw [hreverse.1]; decide)
        (by rw [hreverse.2.2]; decide)

/-- Rebase the reusable source assertions onto the certificate-local blocker
assignment.  Only `h0134`–`h0142` mention blocker bits; their activated row
equalities are exactly `directSource_leftTwo_eq_mainTwo`. -/
theorem directSource_certificateBaseAssertions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) :
    DirectSourceBaseAssertions
      (directSourceRows C) directCertificateBlockers
      (directSourceShell T) (directSourceFirstRow T) := by
  let actual := directSource_baseAssertions C
  exact { actual with
    h0134 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 0))
    h0135 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 1))
    h0136 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 3))
    h0137 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 4))
    h0138 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 6))
    h0139 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 8))
    h0140 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 10))
    h0141 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 11))
    h0142 := by
      apply (Bool.or_eq_true_eq_eq_true_or_eq_true _ _).mpr
      exact Or.inr (beq_iff_eq.mpr (directSource_leftTwo_eq_mainTwo C 12)) }

theorem directSource_roleAssertions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (C : CanonicalCoverFamilies T)
    (hcard : D.A.card = 13) (hsame : first.doubleRadius = radius) :
    DirectSourceRoleAssertions (directSourceRows C) directCertificateBlockers
      (directSourceQ T) (directSourceW T) (directSourceFirstRow T) := by
  have hfrontier9 := directSource_frontier_or_not_firstRow T (9 : Fin 13)
  have hfrontier10 := directSource_frontier_or_not_firstRow T (10 : Fin 13)
  have hfrontier11 := directSource_frontier_or_not_firstRow T (11 : Fin 13)
  have hfrontier12 := directSource_frontier_or_not_firstRow T (12 : Fin 13)
  have hadjacent := directSource_firstRow_adjacent_blocks_ule_one T
  have hmain := mainTwo_membership_normal_form P T
  have hprivate := directSource_private_block_covered Q C hcard hsame
  exact {
    h0145 := hfrontier9.1
    h0146 := hfrontier9.2
    h0147 := hfrontier10.1
    h0148 := hfrontier10.2
    h0149 := hfrontier11.1
    h0150 := hfrontier11.2
    h0151 := hfrontier12.1
    h0152 := hfrontier12.2
    h0153 := hadjacent.1
    h0154 := hadjacent.2
    h0155 := by
      have htwo := rowBit_left_eq_decide C (6 : Fin 13) (2 : Fin 13)
      have hone := rowBit_left_eq_decide C (6 : Fin 13) (1 : Fin 13)
      change (!(rowBit (directSourceRows C) 1 (6 : Fin 13).val
        (2 : Fin 13).val && rowBit (directSourceRows C) 1
        (6 : Fin 13).val (1 : Fin 13).val)) = true
      rw [htwo, hone]
      rcases C.left_omits 6 with htwo | hone
      · simp [htwo]
      · simp [hone]
    h0156 := by
      have htwo := rowBit_right_eq_decide C (5 : Fin 13) (2 : Fin 13)
      have hthree := rowBit_right_eq_decide C (5 : Fin 13) (3 : Fin 13)
      change (!(rowBit (directSourceRows C) 2 (5 : Fin 13).val
        (2 : Fin 13).val && rowBit (directSourceRows C) 2
        (5 : Fin 13).val (3 : Fin 13).val)) = true
      rw [htwo, hthree]
      rcases C.right_omits 5 with htwo | hthree
      · simp [htwo]
      · simp [hthree]
    h0157 := beq_iff_eq.mpr
      (blockerAt_directCertificateBlockers (1 : Fin 13))
    h0158 := by
      have hbit := rowBit_main_eq_decide C (2 : Fin 13) (1 : Fin 13)
      change rowBit (directSourceRows C) 0 (2 : Fin 13).val
        (1 : Fin 13).val = true
      rw [hbit]
      simp [hmain.1]
    h0159 := by
      have hbit := rowBit_main_eq_decide C (2 : Fin 13) (3 : Fin 13)
      change rowBit (directSourceRows C) 0 (2 : Fin 13).val
        (3 : Fin 13).val = true
      rw [hbit]
      simp [hmain.2.1]
    h0160 := by
      have hbit := rowBit_main_eq_decide C (2 : Fin 13) (0 : Fin 13)
      change (!rowBit (directSourceRows C) 0 (2 : Fin 13).val
        (0 : Fin 13).val) = true
      rw [hbit]
      simp [hmain.2.2.1]
    h0161 := by
      have hbit := rowBit_main_eq_decide C (2 : Fin 13) (4 : Fin 13)
      change (!rowBit (directSourceRows C) 0 (2 : Fin 13).val
        (4 : Fin 13).val) = true
      rw [hbit]
      simp [hmain.2.2.2]
    h0162 := directSource_main_private_hits_ge_two C
    h0163 := directSource_firstRow_private_hits_ge_two T
    h0164 := directSource_frontier_strict_main_occurrence C
    h0165 := directSource_firstApex_union_card_eq_six Q C hcard hsame
    h0166 := hprivate.1
    h0167 := hprivate.2.1
    h0168 := hprivate.2.2.1
    h0169 := hprivate.2.2.2
  }

-- GENERATED DIRECT-SOURCE APPLICATION START
/-- The source-faithful semantic table contradicts the exact pass-five LRAT
certificate in the card-thirteen same-radius branch. -/
theorem false_of_directSource_semanticTable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (C : CanonicalCoverFamilies T)
    (hcard : D.A.card = 13) (hsame : first.doubleRadius = radius) :
    False := by
  let base := directSource_certificateBaseAssertions C
  let role := directSource_roleAssertions Q T C hcard hsame
  exact false_of_directSource_flat
      (directSourceRows C) directCertificateBlockers (directSourceShell T)
      (directSourceQ T) (directSourceW T) (directSourceFirstRow T)
      (directSourceRanks P)
      base.h0000
      base.h0001
      base.h0002
      base.h0003
      base.h0004
      base.h0005
      base.h0006
      base.h0007
      base.h0008
      base.h0009
      base.h0010
      base.h0011
      base.h0012
      base.h0013
      base.h0014
      base.h0015
      base.h0016
      base.h0017
      base.h0018
      base.h0019
      base.h0020
      base.h0021
      base.h0022
      base.h0023
      base.h0024
      base.h0025
      base.h0026
      base.h0027
      base.h0028
      base.h0029
      base.h0030
      base.h0031
      base.h0032
      base.h0033
      base.h0034
      base.h0035
      base.h0036
      base.h0037
      base.h0038
      base.h0039
      base.h0040
      base.h0041
      base.h0042
      base.h0043
      base.h0044
      base.h0045
      base.h0046
      base.h0047
      base.h0048
      base.h0049
      base.h0050
      base.h0051
      base.h0052
      base.h0053
      base.h0054
      base.h0055
      base.h0056
      base.h0057
      base.h0058
      base.h0059
      base.h0060
      base.h0061
      base.h0062
      base.h0063
      base.h0064
      base.h0065
      base.h0066
      base.h0067
      base.h0068
      base.h0069
      base.h0070
      base.h0071
      base.h0072
      base.h0073
      base.h0074
      base.h0075
      base.h0076
      base.h0077
      base.h0078
      base.h0079
      base.h0080
      base.h0081
      base.h0082
      base.h0083
      base.h0084
      base.h0085
      base.h0086
      base.h0087
      base.h0088
      base.h0089
      base.h0090
      base.h0091
      base.h0092
      base.h0093
      base.h0094
      base.h0095
      base.h0096
      base.h0097
      base.h0098
      base.h0099
      base.h0100
      base.h0101
      base.h0102
      base.h0103
      base.h0104
      base.h0105
      base.h0106
      base.h0107
      base.h0108
      base.h0109
      base.h0110
      base.h0111
      base.h0112
      base.h0113
      base.h0114
      base.h0115
      base.h0116
      base.h0117
      base.h0118
      base.h0119
      base.h0120
      base.h0121
      base.h0122
      base.h0123
      base.h0124
      base.h0125
      base.h0126
      base.h0127
      base.h0128
      base.h0129
      base.h0130
      base.h0131
      base.h0132
      base.h0133
      base.h0134
      base.h0135
      base.h0136
      base.h0137
      base.h0138
      base.h0139
      base.h0140
      base.h0141
      base.h0142
      base.h0143
      base.h0144
      role.h0145
      role.h0146
      role.h0147
      role.h0148
      role.h0149
      role.h0150
      role.h0151
      role.h0152
      role.h0153
      role.h0154
      role.h0155
      role.h0156
      role.h0157
      role.h0158
      role.h0159
      role.h0160
      role.h0161
      role.h0162
      role.h0163
      role.h0164
      role.h0165
      role.h0166
      role.h0167
      role.h0168
      role.h0169
      (directSource_h0170 P)
      (directSource_h0171 P)
      (directSource_h0172 P)
      (directSource_h0173 P)
      (directSource_h0174 P)
      (directSource_h0175 P)
      (directSource_h0176 P)
      (directSource_h0177 P)
      (directSource_h0178 P)
      (directSource_h0179 P)
      (directSource_h0180 P)
      (directSource_h0181 P)
      (directSource_h0182 P)
      (directSource_h0183 P)
      (directSource_h0184 P)
      (directSource_h0185 P)
      (directSource_h0186 P)
      (directSource_h0187 P)
      (directSource_h0188 P)
      (directSource_h0189 P)
      (directSource_h0190 P)
      (directSource_h0191 P)
      (directSource_h0192 P)
      (directSource_h0193 P)
      (directSource_h0194 P)
      (directSource_h0195 P)
      (directSource_h0196 P)
      (directSource_h0197 P)
      (directSource_h0198 P)
      (directSource_h0199 P)
      (directSource_h0200 P)
      (directSource_h0201 P)
      (directSource_h0202 P)
      (directSource_h0203 P)
      (directSource_h0204 P)
      (directSource_h0205 P)
      (directSource_h0206 P)
      (directSource_h0207 P)
      (directSource_h0208 P)
      (directSource_h0209 P)
      (directSource_h0210 P)
      (directSource_h0211 P)
      (directSource_h0212 P)
      (directSource_h0213 P)
      (directSource_h0214 P)
      (directSource_h0215 P)
      (directSource_h0216 P)
      (directSource_h0217 P)
      (directSource_h0218 P)
      (directSource_h0219 P)
      (directSource_h0220 P)
      (directSource_h0221 P)
      (directSource_h0222 P)
      (directSource_h0223 P)
      (directSource_h0224 P)
      (directSource_h0225 P)
      (directSource_h0226 P)
      (directSource_h0227 P)
      (directSource_h0228 P)
      (directSource_h0229 P)
      (directSource_h0230 P)
      (directSource_h0231 P)
      (directSource_h0232 P)
      (directSource_h0233 P)
      (directSource_h0234 P)
      (directSource_h0235 P)
      (directSource_h0236 P)
      (directSource_h0237 (C := C) P)
      (directSource_h0238 (C := C) P)
      (directSource_h0239 (C := C) P)
      (directSource_h0240 (C := C) P)
      (directSource_h0241 (C := C) P)
      (directSource_h0242 (C := C) P)
      (directSource_h0243 (C := C) P)
      (directSource_h0244 (C := C) P)
      (directSource_h0245 (C := C) P)
      (directSource_h0246 (C := C) P)
      (directSource_h0247 (C := C) P)
      (directSource_h0248 (C := C) P)
      (directSource_h0249 (C := C) P)
      (directSource_h0250 (C := C) P)
      (directSource_h0251 (C := C) P)
      (directSource_h0252 (C := C) P)
      (directSource_h0253 (C := C) P)
      (directSource_h0254 (C := C) P)
      (directSource_h0255 (C := C) P)
      (directSource_h0256 (C := C) P)
      (directSource_h0257 (C := C) P)
      (directSource_h0258 (C := C) P)
      (directSource_h0259 (C := C) P)
      (directSource_h0260 (C := C) P)
      (directSource_h0261 (C := C) P)
      (directSource_h0262 (C := C) P)
      (directSource_h0263 (C := C) P)
      (directSource_h0264 (C := C) P)
      (directSource_h0265 (C := C) P)
      (directSource_h0266 (C := C) P)
      (directSource_h0267 (C := C) P)
      (directSource_h0268 (C := C) P)
      (directSource_h0269 (C := C) P)
      (directSource_h0270 (C := C) P)
      (directSource_h0271 (C := C) P)
      (directSource_h0272 (C := C) P)
      (directSource_h0273 (C := C) P)
      (directSource_h0274 (C := C) P)
      (directSource_h0275 (C := C) P)
      (directSource_h0276 (C := C) P)
      (directSource_h0277 (C := C) P)
      (directSource_h0278 (C := C) P)
      (directSource_h0279 (C := C) P)
      (directSource_h0280 (C := C) P)
      (directSource_h0281 (C := C) P)
      (directSource_h0282 (C := C) P)
      (directSource_h0283 (C := C) P)
      (directSource_h0284 (C := C) P)
      (directSource_h0285 (C := C) P)
      (directSource_h0286 (C := C) P)
      (directSource_h0287 (C := C) P)
      (directSource_h0288 (C := C) P)
      (directSource_h0289 (C := C) P)
      (directSource_h0290 (C := C) P)
      (directSource_h0291 (C := C) P)
      (directSource_h0292 (C := C) P)
      (directSource_h0293 (C := C) P)
      (directSource_h0294 (C := C) P)
      (directSource_h0295 (C := C) P)
      (directSource_h0296 (C := C) P)
      (directSource_h0297 (C := C) P)
      (directSource_h0298 (C := C) P)
      (directSource_h0299 (C := C) P)
      (directSource_h0300 (C := C) P)
      (directSource_h0301 (C := C) P)
      (directSource_h0302 (C := C) P)
      (directSource_h0303 (C := C) P)
      (directSource_h0304 (C := C) P)
      (directSource_h0305 (C := C) P)
      (directSource_h0306 (C := C) P)
      (directSource_h0307 (C := C) P)
      (directSource_h0308 (C := C) P)
      (directSource_h0309 (C := C) P)
      (directSource_h0310 (C := C) P)
      (directSource_h0311 (C := C) P)
      (directSource_h0312 (C := C) P)
      (directSource_h0313 (C := C) P)
      (directSource_h0314 (C := C) P)
      (directSource_h0315 (C := C) P)
      (directSource_h0316 (C := C) P)
      (directSource_h0317 (C := C) P)
      (directSource_h0318 (C := C) P)
      (directSource_h0319 (C := C) P)
      (directSource_h0320 (C := C) P)
      (directSource_h0321 (C := C) P)
      (directSource_h0322 (C := C) P)
      (directSource_h0323 (C := C) P)
      (directSource_h0324 (C := C) P)
      (directSource_h0325 (C := C) P)
      (directSource_h0326 (C := C) P)
      (directSource_h0327 (C := C) P)
      (directSource_h0328 (C := C) P)
      (directSource_h0329 (C := C) P)
      (directSource_h0330 (C := C) P)
      (directSource_h0331 (C := C) P)
      (directSource_h0332 (C := C) P)
      (directSource_h0333 (C := C) P)
      (directSource_h0334 (C := C) P)
      (directSource_h0335 (C := C) P)
      (directSource_h0336 (C := C) P)
      (directSource_h0337 (C := C) P)
      (directSource_h0338 (C := C) P)
      (directSource_h0339 (C := C) P)
      (directSource_h0340 (C := C) P)
      (directSource_h0341 (C := C) P)
      (directSource_h0342 (C := C) P)
      (directSource_h0343 (C := C) P)
      (directSource_h0344 (C := C) P)
      (directSource_h0345 (C := C) P)
      (directSource_h0346 (C := C) P)
      (directSource_h0347 (C := C) P)
      (directSource_h0348 (C := C) P)
      (directSource_h0349 (C := C) P)
      (directSource_h0350 (C := C) P)
      (directSource_h0351 (C := C) P)
      (directSource_h0352 (C := C) P)
      (directSource_h0353 (C := C) P)
      (directSource_h0354 (C := C) P)
      (directSource_h0355 (C := C) P)
      (directSource_h0356 (C := C) P)
      (directSource_h0357 (C := C) P)
      (directSource_h0358 (C := C) P)
      (directSource_h0359 (C := C) P)
      (directSource_h0360 (C := C) P)
      (directSource_h0361 (C := C) P)
      (directSource_h0362 (C := C) P)
      (directSource_h0363 (C := C) P)
      (directSource_h0364 (C := C) P)
      (directSource_h0365 (C := C) P)
      (directSource_h0366 (C := C) P)
      (directSource_h0367 (C := C) P)
      (directSource_h0368 (C := C) P)
      (directSource_h0369 (C := C) P)
      (directSource_h0370 (C := C) P)
      (directSource_h0371 (C := C) P)
      (directSource_h0372 (C := C) P)
      (directSource_h0373 (C := C) P)
      (directSource_h0374 (C := C) P)
      (directSource_h0375 (C := C) P)
      (directSource_h0376 (C := C) P)
      (directSource_h0377 (C := C) P)
      (directSource_h0378 (C := C) P)
      (directSource_h0379 (C := C) P)
      (directSource_h0380 (C := C) P)
      (directSource_h0381 (C := C) P)
      (directSource_h0382 (C := C) P)
      (directSource_h0383 (C := C) P)
      (directSource_h0384 (C := C) P)
      (directSource_h0385 (C := C) P)
      (directSource_h0386 (C := C) P)
      (directSource_h0387 (C := C) P)
      (directSource_h0388 (C := C) P)
      (directSource_h0389 (C := C) P)
      (directSource_h0390 (C := C) P)
      (directSource_h0391 (C := C) P)
      (directSource_h0392 (C := C) P)
      (directSource_h0393 (C := C) P)
      (directSource_h0394 (C := C) P)
      (directSource_h0395 (C := C) P)
      (directSource_h0396 (C := C) P)
      (directSource_h0397 (C := C) P)
      (directSource_h0398 (C := C) P)
      (directSource_h0399 (C := C) P)
      (directSource_h0400 (C := C) P)
      (directSource_h0401 (C := C) P)
      (directSource_h0402 (C := C) P)
      (directSource_h0403 (C := C) P)
      (directSource_h0404 (C := C) P)
      (directSource_h0405 (C := C) P)
      (directSource_h0406 (C := C) P)
      (directSource_h0407 (C := C) P)
      (directSource_h0408 (C := C) P)
      (directSource_h0409 (C := C) P)
      (directSource_h0410 (C := C) P)
      (directSource_h0411 (C := C) P)
      (directSource_h0412 (C := C) P)
      (directSource_h0413 (C := C) P)
      (directSource_h0414 (C := C) P)
      (directSource_h0415 (C := C) P)
      (directSource_h0416 (C := C) P)
      (directSource_h0417 (C := C) P)
      (directSource_h0418 (C := C) P)
      (directSource_h0419 (C := C) P)
      (directSource_h0420 (C := C) P)
      (directSource_h0421 (C := C) P)
      (directSource_h0422 (C := C) P)
      (directSource_h0423 (C := C) P)
      (directSource_h0424 (C := C) P)
      (directSource_h0425 (C := C) P)
      (directSource_h0426 (C := C) P)
      (directSource_h0427 (C := C) P)
      (directSource_h0428 (C := C) P)
      (directSource_h0429 (C := C) P)
      (directSource_h0430 (C := C) P)
      (directSource_h0431 (C := C) P)
      (directSource_h0432 (C := C) P)
      (directSource_h0433 (C := C) P)
      (directSource_h0434 (C := C) P)
      (directSource_h0435 (C := C) P)
      (directSource_h0436 (C := C) P)
      (directSource_h0437 (C := C) P)
      (directSource_h0438 (C := C) P)
      (directSource_h0439 (C := C) P)
      (directSource_h0440 (C := C) P)
      (directSource_h0441 (C := C) P)
      (directSource_h0442 (C := C) P)
      (directSource_h0443 (C := C) P)
      (directSource_h0444 (C := C) P)
      (directSource_h0445 (C := C) P)
      (directSource_h0446 (C := C) P)
      (directSource_h0447 (C := C) P)
      (directSource_h0448 (C := C) P)
      (directSource_h0449 (C := C) P)
      (directSource_h0450 (C := C) P)
      (directSource_h0451 (C := C) P)
      (directSource_h0452 (C := C) P)
      (directSource_h0453 (C := C) P)
      (directSource_h0454 (C := C) P)
      (directSource_h0455 (C := C) P)
      (directSource_h0456 (C := C) P)
      (directSource_h0457 (C := C) P)
      (directSource_h0458 (C := C) P)
      (directSource_h0459 (C := C) P)
      (directSource_h0460 (C := C) P)
      (directSource_h0461 (C := C) P)
      (directSource_h0462 (C := C) P)
      (directSource_h0463 (C := C) P)
      (directSource_h0464 (C := C) P)
      (directSource_h0465 (C := C) P)
      (directSource_h0466 (C := C) P)
      (directSource_h0467 (C := C) P)
      (directSource_h0468 (C := C) P)
      (directSource_h0469 (C := C) P)
      (directSource_h0470 (C := C) P)
      (directSource_h0471 (C := C) P)
      (directSource_h0472 (C := C) P)
      (directSource_h0473 (C := C) P)
      (directSource_h0474 (C := C) P)
      (directSource_h0475 (C := C) P)
      (directSource_h0476 (C := C) P)
      (directSource_h0477 (C := C) P)
      (directSource_h0478 (C := C) P)
      (directSource_h0479 (C := C) P)
      (directSource_h0480 (C := C) P)
      (directSource_h0481 (C := C) P)
      (directSource_h0482 (C := C) P)
      (directSource_h0483 (C := C) P)
      (directSource_h0484 (C := C) P)
      (directSource_h0485 (C := C) P)
      (directSource_h0486 (C := C) P)
      (directSource_h0487 (C := C) P)
      (directSource_h0488 (C := C) P)
      (directSource_h0489 (T := T) P)
      (directSource_h0490 (T := T) P)
      (directSource_h0491 (T := T) P)
      (directSource_h0492 (T := T) P)
      (directSource_h0493 (T := T) P)
      (directSource_h0494 (T := T) P)
      (directSource_h0495 (T := T) P)
      (directSource_h0496 (T := T) P)
      (directSource_h0497 (T := T) P)
      (directSource_h0498 (T := T) P)
      (directSource_h0499 (T := T) P)
      (directSource_h0500 (T := T) P)
      (directSource_h0501 (T := T) P)
      (directSource_h0502 (T := T) P)
      (directSource_h0503 (T := T) P)
      (directSource_h0504 (T := T) P)
      (directSource_h0505 (T := T) P)
      (directSource_h0506 (T := T) P)
      (directSource_h0507 (T := T) P)
      (directSource_h0508 (T := T) P)
      (directSource_h0509 (T := T) P)
      (directSource_h0510 (T := T) P)
      (directSource_h0511 (T := T) P)
      (directSource_h0512 (T := T) P)
      (directSource_h0513 (T := T) P)
      (directSource_h0514 (T := T) P)
      (directSource_h0515 (T := T) P)
      (directSource_h0516 (T := T) P)
      (directSource_h0517 (T := T) P)
      (directSource_h0518 (T := T) P)
      (directSource_h0519 (T := T) P)
      (directSource_h0520 (T := T) P)
      (directSource_h0521 (T := T) P)
      (directSource_h0522 (T := T) P)
      (directSource_h0523 (T := T) P)
      (directSource_h0524 (T := T) P)
      (directSource_h0525 (T := T) P)
      (directSource_h0526 (T := T) P)
      (directSource_h0527 (T := T) P)
      (directSource_h0528 (T := T) P)
      (directSource_h0529 (T := T) P)
      (directSource_h0530 (T := T) P)
      (directSource_h0531 (T := T) P)
      (directSource_h0532 (T := T) P)
      (directSource_h0533 (T := T) P)
      (directSource_h0534 (T := T) P)
      (directSource_h0535 (T := T) P)
      (directSource_h0536 (T := T) P)
      (directSource_h0537 (T := T) P)
      (directSource_h0538 (T := T) P)
      (directSource_h0539 (T := T) P)
      (directSource_h0540 (T := T) P)
      (directSource_h0541 (T := T) P)
      (directSource_h0542 (T := T) P)
      (directSource_h0543 (T := T) P)
      (directSource_h0544 (T := T) P)
      (directSource_h0545 (T := T) P)
      (directSource_h0546 (T := T) P)
      (directSource_h0547 (T := T) P)
      (directSource_h0548 (T := T) P)
      (directSource_h0549 (T := T) P)
      (directSource_h0550 (T := T) P)
      (directSource_h0551 (T := T) P)
      (directSource_h0552 (T := T) P)
      (directSource_h0553 (T := T) P)
      (directSource_h0554 (T := T) P)
      (directSource_h0555 (T := T) P)
      (directSource_h0556 (T := T) P)
      (directSource_h0557 (T := T) P)
      (directSource_h0558 (T := T) P)
      (directSource_h0559 (T := T) P)
      (directSource_h0560 (T := T) P)
      (directSource_h0561 (T := T) P)
      (directSource_h0562 (T := T) P)
      (directSource_h0563 (T := T) P)
      (directSource_h0564 (T := T) P)
      (directSource_h0565 (T := T) P)
      (directSource_h0566 (T := T) P)
      (directSource_h0567 (T := T) P)
      (directSource_h0568 (T := T) P)
      (directSource_h0569 (T := T) P)
      (directSource_h0570 (T := T) P)
      (directSource_h0571 P)
      (directSource_h0572 P)
      (directSource_h0573 P)
      (directSource_h0574 P)
      (directSource_h0575 P)
      (directSource_h0576 P)
      (directSource_h0577 P)
      (directSource_h0578 P)
      (directSource_h0579 P)
      (directSource_h0580 P)
      (directSource_h0581 P)
      (directSource_h0582 P)
      (directSource_h0583 P)
      (directSource_h0584 P)
      (directSource_h0585 P)
      (directSource_h0586 P)
      (directSource_h0587 P)
      (directSource_h0588 P)
      (directSource_h0589 P)
      (directSource_h0590 P)
      (directSource_h0591 P)
      (directSource_h0592 P)
      (directSource_h0593 P)
      (directSource_h0594 P)
      (directSource_h0595 P)
      (directSource_h0596 P)
      (directSource_h0597 P)
      (directSource_h0598 P)
      (directSource_h0599 P)
      (directSource_h0600 P)
      (directSource_h0601 P)
      (directSource_h0602 P)
      (directSource_h0603 P)
      (directSource_h0604 P)
      (directSource_h0605 P)
      (directSource_h0606 P)
      (directSource_h0607 P)
      (directSource_h0608 P)
      (directSource_h0609 P)
      (directSource_h0610 P)
      (directSource_h0611 P)
      (directSource_h0612 P)
      (directSource_h0613 P)
      (directSource_h0614 P)
      (directSource_h0615 P)
      (directSource_h0616 P)
      (directSource_h0617 P)
      (directSource_h0618 P)
      (directSource_h0619 P)
      (directSource_h0620 P)
      (directSource_h0621 P)
      (directSource_h0622 P)
      (directSource_h0623 P)
      (directSource_h0624 P)
      (directSource_h0625 P)
      (directSource_h0626 P)
      (directSource_h0627 P)
      (directSource_h0628 P)
      (directSource_h0629 P)
      (directSource_h0630 P)
      (directSource_h0631 P)
      (directSource_h0632 P)
      (directSource_h0633 P)
      (directSource_h0634 P)
      (directSource_h0635 P)
      (directSource_h0636 P)
      (directSource_h0637 P)
      (directSource_h0638 P)
      (directSource_h0639 P)
      (directSource_h0640 P)
      (directSource_h0641 P)
      (directSource_h0642 P)
      (directSource_h0643 P)
      (directSource_h0644 P)
      (directSource_h0645 P)
      (directSource_h0646 P)
      (directSource_h0647 P)
      (directSource_h0648 P)
      (directSource_h0649 P)
      (directSource_h0650 P)
      (directSource_h0651 P)
      (directSource_h0652 P)
      (directSource_h0653 P)
      (directSource_h0654 P)
      (directSource_h0655 P)
      (directSource_h0656 P)
      (directSource_h0657 P)
      (directSource_h0658 P)
      (directSource_h0659 P)
      (directSource_h0660 P)
      (directSource_h0661 P)
      (directSource_h0662 P)
      (directSource_h0663 P)
      (directSource_h0664 P)
      (directSource_h0665 P)
      (directSource_h0666 P)
      (directSource_h0667 P)
      (directSource_h0668 P)
      (directSource_h0669 P)
      (directSource_h0670 P)
      (directSource_h0671 P)
      (directSource_h0672 P)
      (directSource_h0673 P)
      (directSource_h0674 P)
      (directSource_h0675 P)
      (directSource_h0676 P)
      (directSource_h0677 P)
      (directSource_h0678 P)
      (directSource_h0679 P)
      (directSource_h0680 P)
      (directSource_h0681 P)
      (directSource_h0682 P)
      (directSource_h0683 P)
      (directSource_h0684 P)
      (directSource_h0685 P)
      (directSource_h0686 P)
      (directSource_h0687 P)
      (directSource_h0688 P)
      (directSource_h0689 P)
      (directSource_h0690 P)
      (directSource_h0691 P)
      (directSource_h0692 P)
      (directSource_h0693 P)
      (directSource_h0694 P)
      (directSource_h0695 P)
      (directSource_h0696 P)
      (directSource_h0697 P)
      (directSource_h0698 P)
      (directSource_h0699 P)
      (directSource_h0700 P)
      (directSource_h0701 P)
      (directSource_h0702 P)
      (directSource_h0703 P)
      (directSource_h0704 P)
      (directSource_h0705 P)
      (directSource_h0706 P)
      (directSource_h0707 P)
      (directSource_h0708 P)
      (directSource_h0709 P)
      (directSource_h0710 P)
      (directSource_h0711 P)
      (directSource_h0712 P)
      (directSource_h0713 P)
      (directSource_h0714 P)
      (directSource_h0715 P)
      (directSource_h0716 P)
      (directSource_h0717 P)
      (directSource_h0718 P)
      (directSource_h0719 P)
      (directSource_h0720 P)
      (directSource_h0721 P)
      (directSource_h0722 P)
      (directSource_h0723 P)
      (directSource_h0724 P)
      (directSource_h0725 P)
      (directSource_h0726 P)
      (directSource_h0727 P)
      (directSource_h0728 P)
      (directSource_h0729 P)
      (directSource_h0730 P)
      (directSource_h0731 P)
      (directSource_h0732 P)
      (directSource_h0733 P)
      (directSource_h0734 P)
      (directSource_h0735 P)
      (directSource_h0736 P)
      (directSource_h0737 P)
      (directSource_h0738 P)
      (directSource_h0739 P)
      (directSource_h0740 P)
      (directSource_h0741 P)
      (directSource_h0742 P)
      (directSource_h0743 P)
      (directSource_h0744 P)
      (directSource_h0745 P)
      (directSource_h0746 P)
      (directSource_h0747 P)
      (directSource_h0748 P)
      (directSource_h0749 P)
      (directSource_h0750 P)
      (directSource_h0751 P)
      (directSource_h0752 P)
      (directSource_h0753 P)
      (directSource_h0754 P)
      (directSource_h0755 P)
      (directSource_h0756 P)
      (directSource_h0757 P)
      (directSource_h0758 P)
      (directSource_h0759 P)
      (directSource_h0760 P)
      (directSource_h0761 P)
      (directSource_h0762 P)
      (directSource_h0763 P)
      (directSource_h0764 P)
      (directSource_h0765 P)
      (directSource_h0766 P)
      (directSource_h0767 P)
      (directSource_h0768 P)
      (directSource_h0769 P)
      (directSource_h0770 P)
      (directSource_h0771 P)
      (directSource_h0772 P)
      (directSource_h0773 P)
      (directSource_h0774 P)
      (directSource_h0775 P)
      (directSource_h0776 P)
      (directSource_h0777 P)
      (directSource_h0778 P)
      (directSource_h0779 P)
      (directSource_h0780 P)
      (directSource_h0781 P)
      (directSource_h0782 P)
      (directSource_h0783 P)
      (directSource_h0784 P)
      (directSource_h0785 P)
      (directSource_h0786 P)
      (directSource_h0787 P)
      (directSource_h0788 P)
      (directSource_h0789 P)
      (directSource_h0790 P)
      (directSource_h0791 P)
      (directSource_h0792 P)
      (directSource_h0793 P)
      (directSource_h0794 P)
      (directSource_h0795 P)
      (directSource_h0796 P)
      (directSource_h0797 P)
      (directSource_h0798 P)
      (directSource_h0799 P)
      (directSource_h0800 P)
      (directSource_h0801 P)
      (directSource_h0802 P)
      (directSource_h0803 P)
      (directSource_h0804 P)
      (directSource_h0805 P)
      (directSource_h0806 P)
      (directSource_h0807 P)
      (directSource_h0808 P)
      (directSource_h0809 P)
      (directSource_h0810 P)
      (directSource_h0811 P)
      (directSource_h0812 P)
      (directSource_h0813 P)
      (directSource_h0814 P)
      (directSource_h0815 P)
      (directSource_h0816 P)
      (directSource_h0817 P)
      (directSource_h0818 P)
      (directSource_h0819 P)
      (directSource_h0820 P)
      (directSource_h0821 P)
      (directSource_h0822 P)
      (directSource_h0823 P)
      (directSource_h0824 P)
      (directSource_h0825 P)
      (directSource_h0826 P)
      (directSource_h0827 P)
      (directSource_h0828 P)
      (directSource_h0829 P)
      (directSource_h0830 P)
      (directSource_h0831 P)
      (directSource_h0832 P)
      (directSource_h0833 P)
      (directSource_h0834 P)
      (directSource_h0835 P)
      (directSource_h0836 P)
      (directSource_h0837 P)
      (directSource_h0838 P)
      (directSource_h0839 P)
      (directSource_h0840 P)
      (directSource_h0841 P)
      (directSource_h0842 P)
      (directSource_h0843 P)
      (directSource_h0844 P)
      (directSource_h0845 P)
      (directSource_h0846 P)
      (directSource_h0847 P)
      (directSource_h0848 P)
      (directSource_h0849 P)
      (directSource_h0850 P)
      (directSource_h0851 P)
      (directSource_h0852 P)
      (directSource_h0853 P)
      (directSource_h0854 P)
      (directSource_h0855 P)
      (directSource_h0856 P)
      (directSource_h0857 P)
      (directSource_h0858 P)
      (directSource_h0859 P)
      (directSource_h0860 P)
      (directSource_h0861 P)
      (directSource_h0862 P)
      (directSource_h0863 P)
      (directSource_h0864 P)
      (directSource_h0865 P)
      (directSource_h0866 P)
      (directSource_h0867 P)
      (directSource_h0868 P)
      (directSource_h0869 P)
      (directSource_h0870 P)
      (directSource_h0871 P)
      (directSource_h0872 P)
      (directSource_h0873 P)
      (directSource_h0874 P)
      (directSource_h0875 P)
      (directSource_h0876 P)
      (directSource_h0877 P)
      (directSource_h0878 P)
      (directSource_h0879 P)
      (directSource_h0880 P)
      (directSource_h0881 P)
      (directSource_h0882 P)
      (directSource_h0883 P)
      (directSource_h0884 P)
      (directSource_h0885 P)
      (directSource_h0886 P)
      (directSource_h0887 P)
      (directSource_h0888 P)
      (directSource_h0889 P)
      (directSource_h0890 P)
      (directSource_h0891 P)
      (directSource_h0892 P)
      (directSource_h0893 P)
      (directSource_h0894 P)
      (directSource_h0895 P)
      (directSource_h0896 P)
      (directSource_h0897 P)
      (directSource_h0898 P)
      (directSource_h0899 P)
      (directSource_h0900 P)
      (directSource_h0901 P)
      (directSource_h0902 P)
      (directSource_h0903 P)
      (directSource_h0904 P)
      (directSource_h0905 P)
      (directSource_h0906 P)
      (directSource_h0907 P)
      (directSource_h0908 P)
      (directSource_h0909 P)
      (directSource_h0910 P)
      (directSource_h0911 P)
      (directSource_h0912 P)
      (directSource_h0913 P)
      (directSource_h0914 P)
      (directSource_h0915 P)
      (directSource_h0916 P)
      (directSource_h0917 P)
      (directSource_h0918 P)
      (directSource_h0919 P)
      (directSource_h0920 P)
      (directSource_h0921 P)
      (directSource_h0922 P)
      (directSource_h0923 P)
      (directSource_h0924 P)
      (directSource_h0925 P)
      (directSource_h0926 P)
      (directSource_h0927 P)
      (directSource_h0928 P)
      (directSource_h0929 P)
      (directSource_h0930 P)
      (directSource_h0931 P)
      (directSource_h0932 P)
      (directSource_h0933 P)
      (directSource_h0934 P)
      (directSource_h0935 P)
      (directSource_h0936 P)
      (directSource_h0937 P)
      (directSource_h0938 P)
      (directSource_h0939 P)
      (directSource_h0940 P)
      (directSource_h0941 P)
      (directSource_h0942 P)
      (directSource_h0943 P)
      (directSource_h0944 P)
      (directSource_h0945 P)
      (directSource_h0946 P)
      (directSource_h0947 P)
      (directSource_h0948 P)
      (directSource_h0949 P)
      (directSource_h0950 P)
      (directSource_h0951 P)
      (directSource_h0952 P)
      (directSource_h0953 P)
      (directSource_h0954 P)
      (directSource_h0955 P)
      (directSource_h0956 P)
      (directSource_h0957 P)
      (directSource_h0958 P)
      (directSource_h0959 P)
      (directSource_h0960 P)
      (directSource_h0961 P)
      (directSource_h0962 P)
      (directSource_h0963 P)
      (directSource_h0964 P)
      (directSource_h0965 P)
      (directSource_h0966 P)
      (directSource_h0967 P)
      (directSource_h0968 P)
      (directSource_h0969 P)
      (directSource_h0970 P)
      (directSource_h0971 P)
      (directSource_h0972 P)
      (directSource_h0973 P)
      (directSource_h0974 P)
      (directSource_h0975 P)
      (directSource_h0976 P)
      (directSource_h0977 P)
      (directSource_h0978 P)
      (directSource_h0979 P)
      (directSource_h0980 P)
      (directSource_h0981 P)
      (directSource_h0982 P)
      (directSource_h0983 P)
      (directSource_h0984 P)
      (directSource_h0985 P)
      (directSource_h0986 P)
      (directSource_h0987 P)
      (directSource_h0988 P)
      (directSource_h0989 P)
      (directSource_h0990 P)
      (directSource_h0991 P)
      (directSource_h0992 P)
      (directSource_h0993 P)
      (directSource_h0994 P)
      (directSource_h0995 P)
      (directSource_h0996 P)
      (directSource_h0997 P)
      (directSource_h0998 P)
      (directSource_h0999 P)
      (directSource_h1000 P)
      (directSource_h1001 P)
      (directSource_h1002 P)
      (directSource_h1003 P)
      (directSource_h1004 P)
      (directSource_h1005 P)
      (directSource_h1006 P)
      (directSource_h1007 P)
      (directSource_h1008 P)
      (directSource_h1009 P)
      (directSource_h1010 P)
      (directSource_h1011 P)
      (directSource_h1012 P)
      (directSource_h1013 P)
      (directSource_h1014 P)
      (directSource_h1015 P)
      (directSource_h1016 P)
      (directSource_h1017 P)
      (directSource_h1018 P)
      (directSource_h1019 P)
      (directSource_h1020 P)
      (directSource_h1021 P)
      (directSource_h1022 P)
      (directSource_h1023 P)
      (directSource_h1024 P)
      (directSource_h1025 P)
      (directSource_h1026 P)
      (directSource_h1027 P)
      (directSource_h1028 P)
      (directSource_h1029 P)
      (directSource_h1030 P)
      (directSource_h1031 P)
      (directSource_h1032 P)
      (directSource_h1033 P)
      (directSource_h1034 P)
      (directSource_h1035 P)
      (directSource_h1036 P)
      (directSource_h1037 P)
      (directSource_h1038 P)
      (directSource_h1039 P)
      (directSource_h1040 P)
      (directSource_h1041 P)
      (directSource_h1042 P)
      (directSource_h1043 P)
      (directSource_h1044 P)
      (directSource_h1045 P)
      (directSource_h1046 P)
      (directSource_h1047 P)
      (directSource_h1048 P)
      (directSource_h1049 P)
      (directSource_h1050 P)
      (directSource_h1051 P)
      (directSource_h1052 P)
      (directSource_h1053 P)
      (directSource_h1054 P)
      (directSource_h1055 P)
      (directSource_h1056 P)
      (directSource_h1057 P)
      (directSource_h1058 P)
      (directSource_h1059 P)
      (directSource_h1060 P)
      (directSource_h1061 P)
      (directSource_h1062 P)
      (directSource_h1063 P)
      (directSource_h1064 P)
      (directSource_h1065 P)
      (directSource_h1066 P)
      (directSource_h1067 P)
      (directSource_h1068 P)
      (directSource_h1069 P)
      (directSource_h1070 P)
      (directSource_h1071 P)
      (directSource_h1072 P)
      (directSource_h1073 P)
      (directSource_h1074 P)
      (directSource_h1075 P)
      (directSource_h1076 P)
      (directSource_h1077 P)
      (directSource_h1078 P)
      (directSource_h1079 P)
      (directSource_h1080 P)
      (directSource_h1081 P)
      (directSource_h1082 P)
      (directSource_h1083 P)
      (directSource_h1084 P)
      (directSource_h1085 P)
      (directSource_h1086 P)
      (directSource_h1087 P)
      (directSource_h1088 P)
      (directSource_h1089 P)
      (directSource_h1090 P)
      (directSource_h1091 P)
      (directSource_h1092 P)
      (directSource_h1093 P)
      (directSource_h1094 P)
      (directSource_h1095 P)
      (directSource_h1096 P)
      (directSource_h1097 P)
      (directSource_h1098 P)
      (directSource_h1099 P)
      (directSource_h1100 P)
      (directSource_h1101 P)
      (directSource_h1102 P)
      (directSource_h1103 P)
      (directSource_h1104 P)
      (directSource_h1105 P)
      (directSource_h1106 P)
      (directSource_h1107 P)
      (directSource_h1108 P)
      (directSource_h1109 P)
      (directSource_h1110 P)
      (directSource_h1111 P)
      (directSource_h1112 P)
      (directSource_h1113 P)
      (directSource_h1114 P)
      (directSource_h1115 P)
      (directSource_h1116 P)
      (directSource_h1117 P)
      (directSource_h1118 P)
      (directSource_h1119 P)
      (directSource_h1120 P)
      (directSource_h1121 P)
      (directSource_h1122 P)
      (directSource_h1123 P)
      (directSource_h1124 P)
      (directSource_h1125 P)
      (directSource_h1126 P)
      (directSource_h1127 P)
      (directSource_h1128 P)
      (directSource_h1129 P)
      (directSource_h1130 P)
      (directSource_h1131 P)
      (directSource_h1132 P)
      (directSource_h1133 P)
      (directSource_h1134 P)
      (directSource_h1135 P)
      (directSource_h1136 P)
      (directSource_h1137 P)
      (directSource_h1138 P)
      (directSource_h1139 P)
      (directSource_h1140 P)
      (directSource_h1141 P)
      (directSource_h1142 P)
      (directSource_h1143 P)
      (directSource_h1144 P)
      (directSource_h1145 P)
      (directSource_h1146 P)
      (directSource_h1147 P)
      (directSource_h1148 P)
      (directSource_h1149 P)
      (directSource_h1150 P)
      (directSource_h1151 P)
      (directSource_h1152 P)
      (directSource_h1153 P)
      (directSource_h1154 P)
      (directSource_h1155 P)
      (directSource_h1156 P)
      (directSource_h1157 P)
      (directSource_h1158 P)
      (directSource_h1159 P)
      (directSource_h1160 P)
      (directSource_h1161 P)
      (directSource_h1162 P)
      (directSource_h1163 P)
      (directSource_h1164 P)
      (directSource_h1165 P)
      (directSource_h1166 P)
      (directSource_h1167 P)
      (directSource_h1168 P)
      (directSource_h1169 P)
      (directSource_h1170 P)
      (directSource_h1171 P)
      (directSource_h1172 P)
      (directSource_h1173 P)
      (directSource_h1174 P)
      (directSource_h1175 P)
      (directSource_h1176 P)
      (directSource_h1177 P)
      (directSource_h1178 P)
      (directSource_h1179 P)
      (directSource_h1180 P)
      (directSource_h1181 P)
      (directSource_h1182 P)
      (directSource_h1183 P)
      (directSource_h1184 P)
      (directSource_h1185 P)
      (directSource_h1186 P)
      (directSource_h1187 P)
      (directSource_h1188 P)
      (directSource_h1189 P)
      (directSource_h1190 P)
      (directSource_h1191 P)
      (directSource_h1192 P)
      (directSource_h1193 P)
      (directSource_h1194 P)
      (directSource_h1195 P)
      (directSource_h1196 P)
      (directSource_h1197 P)
      (directSource_h1198 P)
      (directSource_h1199 P)
      (directSource_h1200 P)
      (directSource_h1201 P)
      (directSource_h1202 P)
      (directSource_h1203 P)
      (directSource_h1204 P)
      (directSource_h1205 P)
      (directSource_h1206 P)
      (directSource_h1207 P)
      (directSource_h1208 P)
      (directSource_h1209 P)
      (directSource_h1210 P)
      (directSource_h1211 P)
      (directSource_h1212 P)
      (directSource_h1213 P)
      (directSource_h1214 P)
      (directSource_h1215 P)
      (directSource_h1216 P)
      (directSource_h1217 P)
      (directSource_h1218 P)
      (directSource_h1219 P)
      (directSource_h1220 P)
      (directSource_h1221 P)
      (directSource_h1222 P)
      (directSource_h1223 P)
      (directSource_h1224 P)
      (directSource_h1225 P)
      (directSource_h1226 P)
      (directSource_h1227 P)
      (directSource_h1228 P)
      (directSource_h1229 P)
      (directSource_h1230 P)
      (directSource_h1231 P)
      (directSource_h1232 P)
      (directSource_h1233 P)
      (directSource_h1234 P)
      (directSource_h1235 P)
      (directSource_h1236 P)
      (directSource_h1237 P)
      (directSource_h1238 P)
      (directSource_h1239 P)
      (directSource_h1240 P)
      (directSource_h1241 P)
      (directSource_h1242 P)
      (directSource_h1243 P)
      (directSource_h1244 P)
      (directSource_h1245 P)
      (directSource_h1246 P)
      (directSource_h1247 P)
      (directSource_h1248 P)
      (directSource_h1249 P)
      (directSource_h1250 P)
      (directSource_h1251 P)
      (directSource_h1252 P)
      (directSource_h1253 P)
      (directSource_h1254 P)
      (directSource_h1255 P)
      (directSource_h1256 P)
      (directSource_h1257 P)
      (directSource_h1258 P)
      (directSource_h1259 P)
      (directSource_h1260 P)
      (directSource_h1261 P)
      (directSource_h1262 P)
      (directSource_h1263 P)
      (directSource_h1264 P)
      (directSource_h1265 P)
      (directSource_h1266 P)
      (directSource_h1267 P)
      (directSource_h1268 P)
      (directSource_h1269 P)
      (directSource_h1270 P)
      (directSource_h1271 P)
      (directSource_h1272 P)
      (directSource_h1273 P)
      (directSource_h1274 P)
      (directSource_h1275 P)
      (directSource_h1276 P)
      (directSource_h1277 P)
      (directSource_h1278 P)
      (directSource_h1279 P)
      (directSource_h1280 P)
      (directSource_h1281 P)
      (directSource_h1282 P)
      (directSource_h1283 P)
      (directSource_h1284 P)
      (directSource_h1285 P)
      (directSource_h1286 P)
      (directSource_h1287 P)
      (directSource_h1288 P)
      (directSource_h1289 P)
      (directSource_h1290 P)
      (directSource_h1291 P)
      (directSource_h1292 P)
      (directSource_h1293 P)
      (directSource_h1294 P)
      (directSource_h1295 P)
      (directSource_h1296 P)
      (directSource_h1297 P)
      (directSource_h1298 P)
      (directSource_h1299 P)
      (directSource_h1300 P)
      (directSource_h1301 P)
      (directSource_h1302 P)
      (directSource_h1303 P)
      (directSource_h1304 P)
      (directSource_h1305 P)
      (directSource_h1306 P)
      (directSource_h1307 P)
      (directSource_h1308 P)
      (directSource_h1309 P)
      (directSource_h1310 P)
      (directSource_h1311 P)
      (directSource_h1312 P)
      (directSource_h1313 P)
      (directSource_h1314 P)
      (directSource_h1315 P)
      (directSource_h1316 P)
      (directSource_h1317 P)
      (directSource_h1318 P)
      (directSource_h1319 P)
      (directSource_h1320 P)
      (directSource_h1321 P)
      (directSource_h1322 P)
      (directSource_h1323 P)
      (directSource_h1324 P)
      (directSource_h1325 P)
      (directSource_h1326 P)
      (directSource_h1327 P)
      (directSource_h1328 P)
      (directSource_h1329 P)
      (directSource_h1330 P)
      (directSource_h1331 P)
      (directSource_h1332 P)
      (directSource_h1333 P)
      (directSource_h1334 P)
      (directSource_h1335 P)
      (directSource_h1336 P)
      (directSource_h1337 P)
      (directSource_h1338 P)
      (directSource_h1339 P)
      (directSource_h1340 P)
      (directSource_h1341 P)
      (directSource_h1342 P)
      (directSource_h1343 P)
      (directSource_h1344 P)
      (directSource_h1345 P)
      (directSource_h1346 P)
      (directSource_h1347 P)
      (directSource_h1348 P)
      (directSource_h1349 P)
      (directSource_h1350 P)
      (directSource_h1351 P)
      (directSource_h1352 P)
      (directSource_h1353 P)
      (directSource_h1354 P)
      (directSource_h1355 P)
      (directSource_h1356 P)
      (directSource_h1357 P)
      (directSource_h1358 P)
      (directSource_h1359 P)
      (directSource_h1360 P)
      (directSource_h1361 P)
      (directSource_h1362 P)
      (directSource_h1363 P)
      (directSource_h1364 P)
      (directSource_h1365 P)
      (directSource_h1366 P)
      (directSource_h1367 P)
      (directSource_h1368 P)
      (directSource_h1369 P)
      (directSource_h1370 P)
      (directSource_h1371 P)
      (directSource_h1372 P)
      (directSource_h1373 P)
      (directSource_h1374 P)
      (directSource_h1375 P)
      (directSource_h1376 P)
      (directSource_h1377 P)
      (directSource_h1378 P)
      (directSource_h1379 P)
      (directSource_h1380 P)
      (directSource_h1381 P)
      (directSource_h1382 P)
      (directSource_h1383 P)
      (directSource_h1384 P)
      (directSource_h1385 P)
      (directSource_h1386 P)
      (directSource_h1387 P)
      (directSource_h1388 P)
      (directSource_h1389 P)
      (directSource_h1390 P)
      (directSource_h1391 P)
      (directSource_h1392 P)
      (directSource_h1393 P)
      (directSource_h1394 P)
      (directSource_h1395 P)
      (directSource_h1396 P)
      (directSource_h1397 P)
      (directSource_h1398 P)
      (directSource_h1399 P)
      (directSource_h1400 P)
      (directSource_h1401 P)
      (directSource_h1402 P)
      (directSource_h1403 P)
      (directSource_h1404 P)
      (directSource_h1405 P)
      (directSource_h1406 P)
      (directSource_h1407 P)
      (directSource_h1408 P)
      (directSource_h1409 P)
      (directSource_h1410 P)
      (directSource_h1411 P)
      (directSource_h1412 P)
      (directSource_h1413 P)
      (directSource_h1414 P)
      (directSource_h1415 P)
      (directSource_h1416 P)
      (directSource_h1417 P)
      (directSource_h1418 P)
      (directSource_h1419 P)
      (directSource_h1420 P)
      (directSource_h1421 P)
      (directSource_h1422 P)
      (directSource_h1423 P)
      (directSource_h1424 P)
      (directSource_h1425 P)
      (directSource_h1426 P)
      (directSource_h1427 P)
      (directSource_h1428 P)
      (directSource_h1429 P)
      (directSource_h1430 P)
      (directSource_h1431 P)
      (directSource_h1432 P)
      (directSource_h1433 P)
      (directSource_h1434 P)
      (directSource_h1435 P)
      (directSource_h1436 P)
      (directSource_h1437 P)
      (directSource_h1438 P)
      (directSource_h1439 P)
      (directSource_h1440 P)
      (directSource_h1441 P)
      (directSource_h1442 P)
      (directSource_h1443 P)
      (directSource_h1444 P)
      (directSource_h1445 P)
      (directSource_h1446 P)
      (directSource_h1447 P)
      (directSource_h1448 P)
      (directSource_h1449 P)
      (directSource_h1450 P)
      (directSource_h1451 P)
      (directSource_h1452 P)
      (directSource_h1453 P)
      (directSource_h1454 P)
      (directSource_h1455 P)
      (directSource_h1456 P)
      (directSource_h1457 P)
      (directSource_h1458 P)
      (directSource_h1459 P)
      (directSource_h1460 P)
      (directSource_h1461 P)
      (directSource_h1462 P)
      (directSource_h1463 P)
      (directSource_h1464 P)
      (directSource_h1465 P)
      (directSource_h1466 P)
      (directSource_h1467 P)
      (directSource_h1468 P)
      (directSource_h1469 P)
      (directSource_h1470 P)
      (directSource_h1471 P)
      (directSource_h1472 P)
      (directSource_h1473 P)
      (directSource_h1474 P)
      (directSource_h1475 P)
      (directSource_h1476 P)
      (directSource_h1477 P)
      (directSource_h1478 P)
      (directSource_h1479 P)
      (directSource_h1480 P)
      (directSource_h1481 P)
      (directSource_h1482 P)
      (directSource_h1483 P)
      (directSource_h1484 P)
      (directSource_h1485 P)
      (directSource_h1486 P)
      (directSource_h1487 P)
      (directSource_h1488 P)
      (directSource_h1489 P)
      (directSource_h1490 P)
      (directSource_h1491 P)
      (directSource_h1492 P)
      (directSource_h1493 P)
      (directSource_h1494 P)
      (directSource_h1495 P)
      (directSource_h1496 P)
      (directSource_h1497 P)
      (directSource_h1498 P)
      (directSource_h1499 P)
      (directSource_h1500 P)
      (directSource_h1501 P)
      (directSource_h1502 P)
      (directSource_h1503 P)
      (directSource_h1504 P)
      (directSource_h1505 P)
      (directSource_h1506 P)
      (directSource_h1507 P)
      (directSource_h1508 P)
      (directSource_h1509 P)
      (directSource_h1510 P)
      (directSource_h1511 P)
      (directSource_h1512 P)
      (directSource_h1513 P)
      (directSource_h1514 P)
      (directSource_h1515 P)
      (directSource_h1516 P)
      (directSource_h1517 P)
      (directSource_h1518 P)
      (directSource_h1519 P)
      (directSource_h1520 P)
      (directSource_h1521 P)
      (directSource_h1522 P)
      (directSource_h1523 P)
      (directSource_h1524 P)
      (directSource_h1525 P)
      (directSource_h1526 P)
      (directSource_h1527 P)
      (directSource_h1528 P)
      (directSource_h1529 P)
      (directSource_h1530 P)
      (directSource_h1531 P)
      (directSource_h1532 P)
      (directSource_h1533 P)
      (directSource_h1534 P)
      (directSource_h1535 P)
      (directSource_h1536 P)
      (directSource_h1537 P)
      (directSource_h1538 P)
      (directSource_h1539 P)
      (directSource_h1540 P)
      (directSource_h1541 P)
      (directSource_h1542 P)
      (directSource_h1543 P)
      (directSource_h1544 P)
      (directSource_h1545 P)
      (directSource_h1546 P)
      (directSource_h1547 P)
      (directSource_h1548 P)
      (directSource_h1549 P)
      (directSource_h1550 P)
      (directSource_h1551 P)
      (directSource_h1552 P)
      (directSource_h1553 P)
      (directSource_h1554 P)
      (directSource_h1555 P)
      (directSource_h1556 P)
      (directSource_h1557 P)
      (directSource_h1558 P)
      (directSource_h1559 P)
      (directSource_h1560 P)
      (directSource_h1561 P)
      (directSource_h1562 P)
      (directSource_h1563 P)
      (directSource_h1564 P)
      (directSource_h1565 P)
      (directSource_h1566 P)
      (directSource_h1567 P)
      (directSource_h1568 P)
      (directSource_h1569 P)
      (directSource_h1570 P)
      (directSource_h1571 P)
      (directSource_h1572 P)
      (directSource_h1573 P)
      (directSource_h1574 P)
      (directSource_h1575 P)
      (directSource_h1576 P)
      (directSource_h1577 P)
      (directSource_h1578 P)
      (directSource_h1579 P)
      (directSource_h1580 P)
      (directSource_h1581 P)
      (directSource_h1582 P)
      (directSource_h1583 P)
      (directSource_h1584 P)
      (directSource_h1585 P)
      (directSource_h1586 P)
      (directSource_h1587 P)
      (directSource_h1588 P)
      (directSource_h1589 P)
      (directSource_h1590 P)
      (directSource_h1591 P)
      (directSource_h1592 P)
      (directSource_h1593 P)
      (directSource_h1594 P)
      (directSource_h1595 P)
      (directSource_h1596 P)
      (directSource_h1597 P)
      (directSource_h1598 P)
      (directSource_h1599 P)
      (directSource_h1600 P)
      (directSource_h1601 P)
      (directSource_h1602 P)
      (directSource_h1603 P)
      (directSource_h1604 P)
      (directSource_h1605 P)
      (directSource_h1606 P)
      (directSource_h1607 P)
      (directSource_h1608 P)
      (directSource_h1609 P)
      (directSource_h1610 P)
      (directSource_h1611 P)
      (directSource_h1612 P)
      (directSource_h1613 P)
      (directSource_h1614 P)
      (directSource_h1615 P)
      (directSource_h1616 P)
      (directSource_h1617 P)
      (directSource_h1618 P)
      (directSource_h1619 P)
      (directSource_h1620 P)
      (directSource_h1621 P)
      (directSource_h1622 P)
      (directSource_h1623 P)
      (directSource_h1624 P)
      (directSource_h1625 P)
      (directSource_h1626 P)
      (directSource_h1627 P)
      (directSource_h1628 P)
      (directSource_h1629 P)
      (directSource_h1630 P)
      (directSource_h1631 P)
      (directSource_h1632 P)
      (directSource_h1633 P)
      (directSource_h1634 P)
      (directSource_h1635 P)
      (directSource_h1636 P)
      (directSource_h1637 P)
      (directSource_h1638 P)
      (directSource_h1639 P)
      (directSource_h1640 P)
      (directSource_h1641 P)
      (directSource_h1642 P)
      (directSource_h1643 P)
      (directSource_h1644 P)
      (directSource_h1645 P)
      (directSource_h1646 P)
      (directSource_h1647 P)
      (directSource_h1648 P)
      (directSource_h1649 P)
      (directSource_h1650 P)
      (directSource_h1651 P)
      (directSource_h1652 P)
      (directSource_h1653 P)
      (directSource_h1654 P)
      (directSource_h1655 P)
      (directSource_h1656 P)
      (directSource_h1657 P)
      (directSource_h1658 P)
      (directSource_h1659 P)
      (directSource_h1660 P)
      (directSource_h1661 P)
      (directSource_h1662 P)
      (directSource_h1663 P)
      (directSource_h1664 P)
      (directSource_h1665 P)
      (directSource_h1666 P)
      (directSource_h1667 P)
      (directSource_h1668 P)
      (directSource_h1669 P)
      (directSource_h1670 P)
      (directSource_h1671 P)
      (directSource_h1672 P)
      (directSource_h1673 P)
      (directSource_h1674 P)
      (directSource_h1675 P)
      (directSource_h1676 P)
      (directSource_h1677 P)
      (directSource_h1678 P)
      (directSource_h1679 P)
      (directSource_h1680 P)
      (directSource_h1681 P)
      (directSource_h1682 P)
      (directSource_h1683 P)
      (directSource_h1684 P)
      (directSource_h1685 P)
      (directSource_h1686 P)
      (directSource_h1687 P)
      (directSource_h1688 P)
      (directSource_h1689 P)
      (directSource_h1690 P)
      (directSource_h1691 P)
      (directSource_h1692 P)
      (directSource_h1693 P)
      (directSource_h1694 P)
      (directSource_h1695 P)
      (directSource_h1696 P)
      (directSource_h1697 P)
      (directSource_h1698 P)
      (directSource_h1699 P)
      (directSource_h1700 P)
      (directSource_h1701 P)
      (directSource_h1702 P)
      (directSource_h1703 P)
      (directSource_h1704 P)
      (directSource_h1705 P)
      (directSource_h1706 P)
      (directSource_h1707 P)
      (directSource_h1708 P)
      (directSource_h1709 P)
      (directSource_h1710 P)
      (directSource_h1711 P)
      (directSource_h1712 P)
      (directSource_h1713 P)
      (directSource_h1714 P)
      (directSource_h1715 P)
      (directSource_h1716 P)
      (directSource_h1717 P)
      (directSource_h1718 P)
      (directSource_h1719 P)
      (directSource_h1720 P)
      (directSource_h1721 P)
      (directSource_h1722 P)
      (directSource_h1723 P)
      (directSource_h1724 P)
      (directSource_h1725 P)
      (directSource_h1726 P)
      (directSource_h1727 P)
      (directSource_h1728 P)
      (directSource_h1729 P)
      (directSource_h1730 P)
      (directSource_h1731 P)
      (directSource_h1732 P)
      (directSource_h1733 P)
      (directSource_h1734 P)
      (directSource_h1735 P)
      (directSource_h1736 P)
      (directSource_h1737 P)
      (directSource_h1738 P)
      (directSource_h1739 P)
      (directSource_h1740 P)
      (directSource_h1741 P)
      (directSource_h1742 P)
      (directSource_h1743 P)
      (directSource_h1744 P)
      (directSource_h1745 P)
      (directSource_h1746 P)
      (directSource_h1747 P)
      (directSource_h1748 P)
      (directSource_h1749 P)
      (directSource_h1750 P)
      (directSource_h1751 P)
      (directSource_h1752 P)
      (directSource_h1753 P)
      (directSource_h1754 P)
      (directSource_h1755 P)
      (directSource_h1756 P)
      (directSource_h1757 P)
      (directSource_h1758 P)
      (directSource_h1759 P)
      (directSource_h1760 P)
      (directSource_h1761 P)
      (directSource_h1762 P)
      (directSource_h1763 P)
      (directSource_h1764 P)
      (directSource_h1765 P)
      (directSource_h1766 P)
      (directSource_h1767 P)
      (directSource_h1768 P)
      (directSource_h1769 P)
      (directSource_h1770 P)
      (directSource_h1771 P)
      (directSource_h1772 P)
      (directSource_h1773 P)
      (directSource_h1774 P)
      (directSource_h1775 P)
      (directSource_h1776 P)
      (directSource_h1777 P)
      (directSource_h1778 P)
      (directSource_h1779 P)
      (directSource_h1780 P)
      (directSource_h1781 P)
      (directSource_h1782 P)
      (directSource_h1783 P)
      (directSource_h1784 P)
      (directSource_h1785 P)
      (directSource_h1786 P)
      (directSource_h1787 P)
      (directSource_h1788 P)
      (directSource_h1789 P)
      (directSource_h1790 P)
      (directSource_h1791 P)
      (directSource_h1792 P)
      (directSource_h1793 P)
      (directSource_h1794 P)
      (directSource_h1795 P)
      (directSource_h1796 P)
      (directSource_h1797 P)
      (directSource_h1798 P)
      (directSource_h1799 P)
      (directSource_h1800 P)
      (directSource_h1801 P)
      (directSource_h1802 P)
      (directSource_h1803 P)
      (directSource_h1804 P)
      (directSource_h1805 P)
      (directSource_h1806 P)
      (directSource_h1807 P)
      (directSource_h1808 P)
      (directSource_h1809 P)
      (directSource_h1810 P)
      (directSource_h1811 P)
      (directSource_h1812 P)
      (directSource_h1813 P)
      (directSource_h1814 P)
      (directSource_h1815 P)
      (directSource_h1816 P)
      (directSource_h1817 P)
      (directSource_h1818 P)
      (directSource_h1819 P)
      (directSource_h1820 P)
      (directSource_h1821 P)
      (directSource_h1822 P)
      (directSource_h1823 P)
      (directSource_h1824 P)
      (directSource_h1825 P)
      (directSource_h1826 P)
      (directSource_h1827 P)
      (directSource_h1828 P)
      (directSource_h1829 P)
      (directSource_h1830 P)
      (directSource_h1831 P)
      (directSource_h1832 P)
      (directSource_h1833 P)
      (directSource_h1834 P)
      (directSource_h1835 P)
      (directSource_h1836 P)
      (directSource_h1837 P)
      (directSource_h1838 P)
      (directSource_h1839 P)
      (directSource_h1840 P)
      (directSource_h1841 P)
      (directSource_h1842 P)
      (directSource_h1843 P)
      (directSource_h1844 P)
      (directSource_h1845 P)
      (directSource_h1846 P)
      (directSource_h1847 P)
      (directSource_h1848 P)
      (directSource_h1849 P)
      (directSource_h1850 P)
      (directSource_h1851 P)
      (directSource_h1852 P)
      (directSource_h1853 P)
      (directSource_h1854 P)
      (directSource_h1855 P)
      (directSource_h1856 P)
      (directSource_h1857 P)
      (directSource_h1858 P)
      (directSource_h1859 P)
      (directSource_h1860 P)
      (directSource_h1861 P)
      (directSource_h1862 P)
      (directSource_h1863 P)
      (directSource_h1864 P)
      (directSource_h1865 P)
      (directSource_h1866 P)
      (directSource_h1867 P)
      (directSource_h1868 P)
      (directSource_h1869 P)
      (directSource_h1870 P)
      (directSource_h1871 P)
      (directSource_h1872 P)
      (directSource_h1873 P)
      (directSource_h1874 P)
      (directSource_h1875 P)
      (directSource_h1876 P)
      (directSource_h1877 P)
      (directSource_h1878 P)
      (directSource_h1879 P)
      (directSource_h1880 P)
      (directSource_h1881 P)
      (directSource_h1882 P)
      (directSource_h1883 P)
      (directSource_h1884 P)
      (directSource_h1885 P)
      (directSource_h1886 P)
      (directSource_h1887 P)
      (directSource_h1888 P)
      (directSource_h1889 P)
      (directSource_h1890 P)
      (directSource_h1891 P)
      (directSource_h1892 P)
      (directSource_h1893 P)
      (directSource_h1894 P)
      (directSource_h1895 P)
      (directSource_h1896 P)
      (directSource_h1897 P)
      (directSource_h1898 P)

/-- The spoke-one source normal form supplies the complete exact certificate
ingress from the live geometric parent. -/
theorem false_of_exactFive_card13_sameRadius_spoke₁
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (N : SourceTwoHitNormalForm Q profile
      star.spoke₁HubPair.toMutualOmissionPair)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13) (hsame : first.doubleRadius = radius) :
    False := by
  rcases nonempty_canonicalAsymmetricRolePrepacket Q profile
      star.spoke₁HubPair.toMutualOmissionPair N hcard with ⟨P⟩
  rcases CanonicalAsymmetricSemanticRowTable.nonempty P star first with ⟨T⟩
  rcases nonempty_canonicalCoverFamilies_spoke₁ T with ⟨C⟩
  exact false_of_directSource_semanticTable Q P T C hcard hsame

/-- The spoke-two source normal form supplies the complete exact certificate
ingress from the live geometric parent. -/
theorem false_of_exactFive_card13_sameRadius_spoke₂
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (N : SourceTwoHitNormalForm Q profile
      star.spoke₂HubPair.toMutualOmissionPair)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13) (hsame : first.doubleRadius = radius) :
    False := by
  rcases nonempty_canonicalAsymmetricRolePrepacket Q profile
      star.spoke₂HubPair.toMutualOmissionPair N hcard with ⟨P⟩
  rcases CanonicalAsymmetricSemanticRowTable.nonempty P star first with ⟨T⟩
  rcases nonempty_canonicalCoverFamilies_spoke₂ T with ⟨C⟩
  exact false_of_directSource_semanticTable Q P T C hcard hsame
-- GENERATED DIRECT-SOURCE APPLICATION END

#print axioms directSource_roleAssertions
#print axioms directSource_certificateBaseAssertions
#print axioms false_of_directSource_semanticTable
#print axioms false_of_exactFive_card13_sameRadius_spoke₁
#print axioms false_of_exactFive_card13_sameRadius_spoke₂

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
