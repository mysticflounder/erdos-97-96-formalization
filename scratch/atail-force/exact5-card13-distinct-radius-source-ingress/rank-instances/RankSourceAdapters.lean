/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DistinctRadiusPackedRankAdapters
import DirectSourceRankFacts
import ExactFiveFirstApexCard13ParentRowCoupling

/-!
# Source adapters for the distinct-radius ordinal-rank blocks

This file connects the generic packed-rank adapters to the actual asymmetric
card-thirteen source assignment.  In particular, the critical-center clauses
retain the real `CanonicalAsymmetricSemanticRowTable.blockerIndex`; no blocker
is reassigned or replaced by a constant index.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressScratch

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveFirstApexCard13ParentRowCouplingScratch
open ATailExactFiveFirstApexCard13Scratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailKalmansonParentOrderScratch
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable

attribute [local instance] Classical.propDecidable

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

noncomputable section

variable
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
    {T : CanonicalAsymmetricSemanticRowTable P star first}

private theorem sourcePoint_mem_A (i : Fin 13) : P.point i ∈ D.A := by
  rw [← P.point_image]
  exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, rfl⟩

private theorem selectedFourClass_support_transport_local
    {A : Finset ℝ²} {a b : ℝ²} (h : a = b)
    (K : SelectedFourClass A a) :
    (h ▸ K).support = K.support := by
  cases h
  rfl

private theorem blockerAt_eq_ofNat_iff
    (source center : Fin 13) :
    blockerAt (directSourceBlockers T) source.val =
        BitVec.ofNat 4 center.val ↔
      T.blockerIndex source = center := by
  rw [blockerAt_directSourceBlockers]
  constructor
  · intro h
    apply Fin.ext
    have hnat := congrArg BitVec.toNat h
    simpa [BitVec.toNat_ofNat, Nat.mod_eq_of_lt,
      show (T.blockerIndex source).val < 16 by omega,
      show center.val < 16 by omega] using hnat
  · intro h
    simp [h]

/-- Exact 13-source image guard used by the generated critical-center blocks. -/
def actualBlockerImageBit (T : CanonicalAsymmetricSemanticRowTable P star first)
    (center : Fin 13) : Bool :=
  (blockerAt (directSourceBlockers T) 0 == BitVec.ofNat 4 center.val) ||
  (blockerAt (directSourceBlockers T) 1 == BitVec.ofNat 4 center.val) ||
  (blockerAt (directSourceBlockers T) 2 == BitVec.ofNat 4 center.val) ||
  (blockerAt (directSourceBlockers T) 3 == BitVec.ofNat 4 center.val) ||
  (blockerAt (directSourceBlockers T) 4 == BitVec.ofNat 4 center.val) ||
  (blockerAt (directSourceBlockers T) 5 == BitVec.ofNat 4 center.val) ||
  (blockerAt (directSourceBlockers T) 6 == BitVec.ofNat 4 center.val) ||
  (blockerAt (directSourceBlockers T) 7 == BitVec.ofNat 4 center.val) ||
  (blockerAt (directSourceBlockers T) 8 == BitVec.ofNat 4 center.val) ||
  (blockerAt (directSourceBlockers T) 9 == BitVec.ofNat 4 center.val) ||
  (blockerAt (directSourceBlockers T) 10 == BitVec.ofNat 4 center.val) ||
  (blockerAt (directSourceBlockers T) 11 == BitVec.ofNat 4 center.val) ||
  (blockerAt (directSourceBlockers T) 12 == BitVec.ofNat 4 center.val)

private theorem actualBlockerImageBit_true_source (center : Fin 13) :
    actualBlockerImageBit P T center = true →
      ∃ source : Fin 13, T.blockerIndex source = center := by
  simp only [actualBlockerImageBit, Bool.or_eq_true, beq_iff_eq]
  intro hguard
  by_contra hnone
  push_neg at hnone
  have h0 : blockerAt (directSourceBlockers T) 0 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 0 ((blockerAt_eq_ofNat_iff P 0 center).1 h)
  have h1 : blockerAt (directSourceBlockers T) 1 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 1 ((blockerAt_eq_ofNat_iff P 1 center).1 h)
  have h2 : blockerAt (directSourceBlockers T) 2 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 2 ((blockerAt_eq_ofNat_iff P 2 center).1 h)
  have h3 : blockerAt (directSourceBlockers T) 3 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 3 ((blockerAt_eq_ofNat_iff P 3 center).1 h)
  have h4 : blockerAt (directSourceBlockers T) 4 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 4 ((blockerAt_eq_ofNat_iff P 4 center).1 h)
  have h5 : blockerAt (directSourceBlockers T) 5 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 5 ((blockerAt_eq_ofNat_iff P 5 center).1 h)
  have h6 : blockerAt (directSourceBlockers T) 6 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 6 ((blockerAt_eq_ofNat_iff P 6 center).1 h)
  have h7 : blockerAt (directSourceBlockers T) 7 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 7 ((blockerAt_eq_ofNat_iff P 7 center).1 h)
  have h8 : blockerAt (directSourceBlockers T) 8 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 8 ((blockerAt_eq_ofNat_iff P 8 center).1 h)
  have h9 : blockerAt (directSourceBlockers T) 9 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 9 ((blockerAt_eq_ofNat_iff P 9 center).1 h)
  have h10 : blockerAt (directSourceBlockers T) 10 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 10 ((blockerAt_eq_ofNat_iff P 10 center).1 h)
  have h11 : blockerAt (directSourceBlockers T) 11 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 11 ((blockerAt_eq_ofNat_iff P 11 center).1 h)
  have h12 : blockerAt (directSourceBlockers T) 12 ≠ BitVec.ofNat 4 center.val :=
    fun h ↦ hnone 12 ((blockerAt_eq_ofNat_iff P 12 center).1 h)
  simp [h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12]
    at hguard

private theorem actual_main_support_eq_completeClass
    (source center : Fin 13) (hcenter : T.blockerIndex source = center) :
    (T.main center).support =
      SelectedClass D.A (P.point center) (T.main center).radius := by
  let hsourceA : P.point source ∈ D.A := sourcePoint_mem_A P source
  let critical :=
    (H.selectedAt (P.point source) hsourceA).toCriticalFourShell
  have hpointCenter : P.point center = H.centerAt (P.point source) hsourceA := by
    rw [← hcenter]
    exact T.blocker_point source
  let Kmain : SelectedFourClass D.A
      (H.centerAt (P.point source) hsourceA) :=
    hpointCenter ▸ T.main center
  have hsupport : Kmain.support = critical.support :=
    H.selectedFourClass_support_eq_shell (P.point source) hsourceA Kmain
  have htransport : Kmain.support = (T.main center).support :=
    selectedFourClass_support_transport_local hpointCenter (T.main center)
  have hradius : (T.main center).radius = critical.radius := by
    have hsourceMain : P.point source ∈ (T.main center).support := by
      rw [← htransport, hsupport]
      exact critical.q_mem_support
    calc
      (T.main center).radius = dist (P.point center) (P.point source) :=
        ((T.main center).support_eq_radius _ hsourceMain).symm
      _ = dist (H.centerAt (P.point source) hsourceA) (P.point source) := by
        rw [hpointCenter]
      _ = critical.radius :=
        critical.support_eq_radius _ critical.q_mem_support
  ext z
  constructor
  · intro hz
    exact mem_selectedClass.mpr
      ⟨(T.main center).support_subset_A hz,
        (T.main center).support_eq_radius z hz⟩
  · intro hz
    have hz' := mem_selectedClass.mp hz
    rw [← htransport, hsupport]
    exact critical.off_row_named_label_forbidden hz'.1 (by
      simpa only [hpointCenter] using hz'.2.trans hradius)

private theorem actual_source_mem_main
    (source center : Fin 13) (hcenter : T.blockerIndex source = center) :
    P.point source ∈ (T.main center).support := by
  let hsourceA : P.point source ∈ D.A := sourcePoint_mem_A P source
  have hpointCenter : P.point center = H.centerAt (P.point source) hsourceA := by
    rw [← hcenter]
    exact T.blocker_point source
  let Kmain : SelectedFourClass D.A
      (H.centerAt (P.point source) hsourceA) :=
    hpointCenter ▸ T.main center
  have htransport : Kmain.support = (T.main center).support :=
    selectedFourClass_support_transport_local hpointCenter (T.main center)
  rw [← htransport,
    H.selectedFourClass_support_eq_shell (P.point source) hsourceA Kmain]
  exact (H.selectedAt (P.point source) hsourceA).toCriticalFourShell.q_mem_support

private theorem actual_unique_K4_radius
    (source center : Fin 13) (hcenter : T.blockerIndex source = center) :
    ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass D.A (P.point center) rho).card →
      rho = (T.main center).radius := by
  intro rho hrho hfour
  let hsourceA : P.point source ∈ D.A := sourcePoint_mem_A P source
  have hpointCenter : P.point center = H.centerAt (P.point source) hsourceA := by
    rw [← hcenter]
    exact T.blocker_point source
  have hsourceClass : P.point source ∈
      SelectedClass D.A (P.point center) rho := by
    by_contra hnot
    apply H.no_qfree_at (P.point source) hsourceA
    refine ⟨rho, hrho, ?_⟩
    have hcardErase :
        (SelectedClass (D.A.erase (P.point source)) (P.point center) rho).card =
          (SelectedClass D.A (P.point center) rho).card :=
      selectedClass_erase_card_eq_of_not_mem hnot
    simpa [HasNEquidistantPointsAt, hpointCenter, SelectedClass] using
      hfour.trans_eq hcardErase.symm
  have hsourceMain : P.point source ∈ (T.main center).support :=
    actual_source_mem_main P source center hcenter
  calc
    rho = dist (P.point center) (P.point source) :=
      (mem_selectedClass.mp hsourceClass).2.symm
    _ = (T.main center).radius :=
      (T.main center).support_eq_radius _ hsourceMain

private theorem mainBit_true_iff (C : CanonicalCoverFamilies T)
    (center point : Fin 13) :
    rowBit (directSourceRows C) 0 center.val point.val = true ↔
      P.point point ∈ (T.main center).support := by
  calc
    rowBit (directSourceRows C) 0 center.val point.val = true ↔
        decide (P.point point ∈ (T.main center).support) = true := by
      rw [show rowBit (directSourceRows C) 0 center.val point.val =
          directSourceRowMember C (0 : Fin 3) center point by
        simpa using rowBit_directSourceRows C (0 : Fin 3) center point]
      simp [directSourceRowMember]
    _ ↔ P.point point ∈ (T.main center).support := decide_eq_true_iff

private theorem firstRowBit_true_iff (point : Fin 13) :
    firstRowBit (directSourceFirstRow T) point.val = true ↔
      P.point point ∈ T.firstApexDoubleRow.support := by
  rw [firstRowBit_directSourceFirstRow]
  exact decide_eq_true_iff

private theorem shellBit_true_iff (point : Fin 13) :
    shellBit (directSourceShell T) point.val = true ↔
      P.point point ∈ SelectedClass D.A S.oppApex2 profile.radius := by
  rw [shellBit_directSourceShell, decide_eq_true_iff]
  exact T.exactFiveShell_mem_iff point

private theorem rankAtom_eq_finiteRank (i : Fin 78) :
    rankAtom (directSourceRanks P) i.val =
      finiteOrdinalRank78BitVec (cardThirteenPairDistance P.point) i :=
  rankAtom_directSourceRanks P i

/-- One complete-class inequality for the retained first-apex class. -/
theorem directSource_complete_retained_guard
    (C : CanonicalCoverFamilies T)
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius)
    (left right : Fin 13) (i j : Fin 78)
    (hi : cardThirteenPairAt i = (4, left) ∨
      cardThirteenPairAt i = (left, 4))
    (hj : cardThirteenPairAt j = (4, right) ∨
      cardThirteenPairAt j = (right, 4)) :
    ((rowBit (directSourceRows C) 0 4 left.val ==
          rowBit (directSourceRows C) 0 4 right.val) ||
      !(rankAtom (directSourceRanks P) i.val ==
        rankAtom (directSourceRanks P) j.val)) = true := by
  have hexact :=
    firstApex_distinctRadius_rows_are_exactClasses Q first hcard hdistinct
  have hpointFirst : P.point 4 = S.oppApex1 :=
    P.firstApex_at_four.trans
      (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S).symm
  have hbase := distinct_completeClass_rank_ne_guard
    (center := P.point 4) (radius := radius) P.point
    (cardThirteenPairDistance P.point)
    (fun k ↦ rowBit (directSourceRows C) 0 4 k.val)
    left right i j (sourcePoint_mem_A P left) (sourcePoint_mem_A P right)
    (cardThirteenPairDistance_eq_centerDistance P i 4 left hi)
    (cardThirteenPairDistance_eq_centerDistance P j 4 right hj)
    (fun k ↦ by
      calc
        rowBit (directSourceRows C) 0 4 k.val = true ↔
            P.point k ∈ (T.main 4).support := by
          simpa using mainBit_true_iff P C (4 : Fin 13) k
        _ ↔ P.point k ∈ SelectedClass D.A (P.point 4) radius := by
          simp only [T.main_firstApex_support, hexact.1, hpointFirst])
  simpa only [rankAtom_directSourceRanks] using hbase

/-- One complete-class inequality for the first-apex double-deletion class. -/
theorem directSource_complete_double_guard
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius)
    (left right : Fin 13) (i j : Fin 78)
    (hi : cardThirteenPairAt i = (4, left) ∨
      cardThirteenPairAt i = (left, 4))
    (hj : cardThirteenPairAt j = (4, right) ∨
      cardThirteenPairAt j = (right, 4)) :
    ((firstRowBit (directSourceFirstRow T) left.val ==
          firstRowBit (directSourceFirstRow T) right.val) ||
      !(rankAtom (directSourceRanks P) i.val ==
        rankAtom (directSourceRanks P) j.val)) = true := by
  have hexact :=
    firstApex_distinctRadius_rows_are_exactClasses Q first hcard hdistinct
  have hpointFirst : P.point 4 = S.oppApex1 :=
    P.firstApex_at_four.trans
      (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S).symm
  have hbase := distinct_completeClass_rank_ne_guard
    (center := P.point 4) (radius := first.doubleRadius) P.point
    (cardThirteenPairDistance P.point)
    (fun k ↦ firstRowBit (directSourceFirstRow T) k.val)
    left right i j (sourcePoint_mem_A P left) (sourcePoint_mem_A P right)
    (cardThirteenPairDistance_eq_centerDistance P i 4 left hi)
    (cardThirteenPairDistance_eq_centerDistance P j 4 right hj)
    (fun k ↦ by
      change firstRowBit (directSourceFirstRow T) k.val = true ↔ _
      rw [firstRowBit_true_iff P]
      simp only [T.firstApexDoubleRow_support, hexact.2, hpointFirst])
  simpa only [rankAtom_directSourceRanks] using hbase

/-- One complete-class inequality for the exact-five second-apex class. -/
theorem directSource_complete_second_guard
    (left right : Fin 13) (i j : Fin 78)
    (hi : cardThirteenPairAt i = (8, left) ∨
      cardThirteenPairAt i = (left, 8))
    (hj : cardThirteenPairAt j = (8, right) ∨
      cardThirteenPairAt j = (right, 8)) :
    ((shellBit (directSourceShell T) left.val ==
          shellBit (directSourceShell T) right.val) ||
      !(rankAtom (directSourceRanks P) i.val ==
        rankAtom (directSourceRanks P) j.val)) = true := by
  have hpointSecond : P.point 8 = S.oppApex2 := by
    exact P.secondApex_at_eight.trans
      (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S).symm
  have hbase := distinct_completeClass_rank_ne_guard
    (center := P.point 8) (radius := profile.radius) P.point
    (cardThirteenPairDistance P.point)
    (fun k ↦ shellBit (directSourceShell T) k.val)
    left right i j (sourcePoint_mem_A P left) (sourcePoint_mem_A P right)
    (cardThirteenPairDistance_eq_centerDistance P i 8 left hi)
    (cardThirteenPairDistance_eq_centerDistance P j 8 right hj)
    (by
      intro k
      simpa only [hpointSecond] using shellBit_true_iff P k)
  simpa only [rankAtom_directSourceRanks] using hbase

/-- One image-guarded complete-class inequality at an actual fixed blocker. -/
theorem directSource_complete_actual_guard
    (C : CanonicalCoverFamilies T)
    (center left right : Fin 13) (i j : Fin 78)
    (hi : cardThirteenPairAt i = (center, left) ∨
      cardThirteenPairAt i = (left, center))
    (hj : cardThirteenPairAt j = (center, right) ∨
      cardThirteenPairAt j = (right, center)) :
    (!((actualBlockerImageBit P T center &&
          !(rowBit (directSourceRows C) 0 center.val left.val ==
            rowBit (directSourceRows C) 0 center.val right.val))) ||
      (!(rankAtom (directSourceRanks P) i.val ==
        rankAtom (directSourceRanks P) j.val))) = true := by
  by_cases himage : actualBlockerImageBit P T center = true
  · rcases actualBlockerImageBit_true_source P center himage with
      ⟨source, hsource⟩
    have hbase := distinct_completeClass_rank_ne_guard
      (center := P.point center) (radius := (T.main center).radius) P.point
      (cardThirteenPairDistance P.point)
      (fun k ↦ rowBit (directSourceRows C) 0 center.val k.val)
      left right i j (sourcePoint_mem_A P left) (sourcePoint_mem_A P right)
      (cardThirteenPairDistance_eq_centerDistance P i center left hi)
      (cardThirteenPairDistance_eq_centerDistance P j center right hj)
      (fun k ↦ by
        change rowBit (directSourceRows C) 0 center.val k.val = true ↔ _
        rw [mainBit_true_iff P C]
        exact Finset.ext_iff.mp
          (actual_main_support_eq_completeClass P source center hsource) (P.point k))
    simpa [himage] using hbase
  · have himageFalse : actualBlockerImageBit P T center = false :=
      Bool.eq_false_of_not_eq_true himage
    simp [himageFalse]

/-- Two-class variant of the unique-K4 adapter.  It is needed only at the
first apex, where the distinct-radius source theorem classifies every K4
radius as either the retained radius or the double-deletion radius. -/
theorem distinct_twoClass_uniqueK4_rank_guard
    {A : Finset ℝ²} {center : ℝ²} {radius₀ radius₁ : ℝ}
    (point : Fin 13 → ℝ²) (value : Fin 78 → ℝ)
    (member₀ member₁ : Fin 13 → Bool)
    (hpointA : ∀ k, point k ∈ A)
    (hpointInjective : Function.Injective point)
    (hclassify : ∀ rho : ℝ, 0 < rho →
      4 ≤ (SelectedClass A center rho).card →
      rho = radius₀ ∨ rho = radius₁)
    (hmember₀ : ∀ k, member₀ k = true ↔
      point k ∈ SelectedClass A center radius₀)
    (hmember₁ : ∀ k, member₁ k = true ↔
      point k ∈ SelectedClass A center radius₁)
    (a b c d : Fin 13)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (ia ib ic id : Fin 78)
    (hcenter : center ≠ point a)
    (hia : value ia = dist center (point a))
    (hib : value ib = dist center (point b))
    (hic : value ic = dist center (point c))
    (hid : value id = dist center (point d)) :
    (((member₀ a && member₀ b && member₀ c && member₀ d) ||
        (member₁ a && member₁ b && member₁ c && member₁ d)) ||
      !((finiteOrdinalRank78BitVec value ia ==
            finiteOrdinalRank78BitVec value ib) &&
        (finiteOrdinalRank78BitVec value ia ==
            finiteOrdinalRank78BitVec value ic) &&
        (finiteOrdinalRank78BitVec value ia ==
            finiteOrdinalRank78BitVec value id))) = true := by
  by_cases hrankAB : finiteOrdinalRank78BitVec value ia =
      finiteOrdinalRank78BitVec value ib
  · by_cases hrankAC : finiteOrdinalRank78BitVec value ia =
        finiteOrdinalRank78BitVec value ic
    · by_cases hrankAD : finiteOrdinalRank78BitVec value ia =
          finiteOrdinalRank78BitVec value id
      · have hvalueAB : value ia = value ib :=
          (finiteOrdinalRank78BitVec_eq_iff value ia ib).1 hrankAB
        have hvalueAC : value ia = value ic :=
          (finiteOrdinalRank78BitVec_eq_iff value ia ic).1 hrankAC
        have hvalueAD : value ia = value id :=
          (finiteOrdinalRank78BitVec_eq_iff value ia id).1 hrankAD
        let rho := dist center (point a)
        have hbRho : dist center (point b) = rho :=
          hib.symm.trans (hvalueAB.symm.trans hia)
        have hcRho : dist center (point c) = rho :=
          hic.symm.trans (hvalueAC.symm.trans hia)
        have hdRho : dist center (point d) = rho :=
          hid.symm.trans (hvalueAD.symm.trans hia)
        let quad : Finset ℝ² := {point a, point b, point c, point d}
        have hquadCard : quad.card = 4 := by
          have habp : point a ≠ point b := fun h ↦ hab (hpointInjective h)
          have hacp : point a ≠ point c := fun h ↦ hac (hpointInjective h)
          have hadp : point a ≠ point d := fun h ↦ had (hpointInjective h)
          have hbcp : point b ≠ point c := fun h ↦ hbc (hpointInjective h)
          have hbdp : point b ≠ point d := fun h ↦ hbd (hpointInjective h)
          have hcdp : point c ≠ point d := fun h ↦ hcd (hpointInjective h)
          simp [quad, habp, hacp, hadp, hbcp, hbdp, hcdp]
        have hquadSubset : quad ⊆ SelectedClass A center rho := by
          intro x hx
          simp only [quad, Finset.mem_insert, Finset.mem_singleton] at hx
          rcases hx with rfl | rfl | rfl | rfl
          · exact mem_selectedClass.mpr ⟨hpointA a, rfl⟩
          · exact mem_selectedClass.mpr ⟨hpointA b, hbRho⟩
          · exact mem_selectedClass.mpr ⟨hpointA c, hcRho⟩
          · exact mem_selectedClass.mpr ⟨hpointA d, hdRho⟩
        have hfour : 4 ≤ (SelectedClass A center rho).card := by
          calc
            4 = quad.card := hquadCard.symm
            _ ≤ (SelectedClass A center rho).card :=
              Finset.card_le_card hquadSubset
        have hrhoPos : 0 < rho := dist_pos.mpr hcenter
        rcases hclassify rho hrhoPos hfour with hrho₀ | hrho₁
        · have hma : member₀ a = true := (hmember₀ a).2 <|
            mem_selectedClass.mpr ⟨hpointA a, by simpa [rho] using hrho₀⟩
          have hmb : member₀ b = true := (hmember₀ b).2 <|
            mem_selectedClass.mpr ⟨hpointA b, hbRho.trans hrho₀⟩
          have hmc : member₀ c = true := (hmember₀ c).2 <|
            mem_selectedClass.mpr ⟨hpointA c, hcRho.trans hrho₀⟩
          have hmd : member₀ d = true := (hmember₀ d).2 <|
            mem_selectedClass.mpr ⟨hpointA d, hdRho.trans hrho₀⟩
          simp [hma, hmb, hmc, hmd]
        · have hma : member₁ a = true := (hmember₁ a).2 <|
            mem_selectedClass.mpr ⟨hpointA a, by simpa [rho] using hrho₁⟩
          have hmb : member₁ b = true := (hmember₁ b).2 <|
            mem_selectedClass.mpr ⟨hpointA b, hbRho.trans hrho₁⟩
          have hmc : member₁ c = true := (hmember₁ c).2 <|
            mem_selectedClass.mpr ⟨hpointA c, hcRho.trans hrho₁⟩
          have hmd : member₁ d = true := (hmember₁ d).2 <|
            mem_selectedClass.mpr ⟨hpointA d, hdRho.trans hrho₁⟩
          simp [hma, hmb, hmc, hmd]
      · simp [hrankAD]
    · simp [hrankAC]
  · simp [hrankAB]

private theorem centerPoint_ne_of_index_ne
    {center point : Fin 13} (hne : center ≠ point) :
    P.point center ≠ P.point point := by
  intro h
  exact hne (P.point_injective h)

/-- One unique-K4 four-subset assertion at the exact-five second apex. -/
theorem directSource_unique_second_guard
    (a b c d : Fin 13)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (hcenter : (8 : Fin 13) ≠ a)
    (ia ib ic id : Fin 78)
    (hia : cardThirteenPairAt ia = (8, a) ∨ cardThirteenPairAt ia = (a, 8))
    (hib : cardThirteenPairAt ib = (8, b) ∨ cardThirteenPairAt ib = (b, 8))
    (hic : cardThirteenPairAt ic = (8, c) ∨ cardThirteenPairAt ic = (c, 8))
    (hid : cardThirteenPairAt id = (8, d) ∨ cardThirteenPairAt id = (d, 8)) :
    ((shellBit (directSourceShell T) a.val &&
        shellBit (directSourceShell T) b.val &&
        shellBit (directSourceShell T) c.val &&
        shellBit (directSourceShell T) d.val) ||
      !((rankAtom (directSourceRanks P) ia.val ==
            rankAtom (directSourceRanks P) ib.val) &&
        (rankAtom (directSourceRanks P) ia.val ==
            rankAtom (directSourceRanks P) ic.val) &&
        (rankAtom (directSourceRanks P) ia.val ==
            rankAtom (directSourceRanks P) id.val))) = true := by
  have hpointSecond : P.point 8 = S.oppApex2 :=
    P.secondApex_at_eight.trans
      (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S).symm
  have hbase := distinct_uniqueK4_rank_guard
    (center := P.point 8) (radius := profile.radius)
    P.point (cardThirteenPairDistance P.point)
    (fun k ↦ shellBit (directSourceShell T) k.val)
    (sourcePoint_mem_A P) P.point_injective
    (by
      intro rho hrho hfour
      have hfour' : 4 ≤ (SelectedClass D.A S.oppApex2 rho).card := by
        simpa only [hpointSecond] using hfour
      exact profile.unique_K4_radius rho hrho hfour')
    (by
      intro k
      simpa only [hpointSecond] using shellBit_true_iff P k)
    a b c d hab hac had hbc hbd hcd ia ib ic id
    (centerPoint_ne_of_index_ne P hcenter)
    (cardThirteenPairDistance_eq_centerDistance P ia 8 a hia)
    (cardThirteenPairDistance_eq_centerDistance P ib 8 b hib)
    (cardThirteenPairDistance_eq_centerDistance P ic 8 c hic)
    (cardThirteenPairDistance_eq_centerDistance P id 8 d hid)
  simpa only [rankAtom_directSourceRanks] using hbase

/-- One unique-K4 four-subset assertion at the two-class first apex. -/
theorem directSource_unique_first_guard
    (C : CanonicalCoverFamilies T)
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius)
    (a b c d : Fin 13)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (hcenter : (4 : Fin 13) ≠ a)
    (ia ib ic id : Fin 78)
    (hia : cardThirteenPairAt ia = (4, a) ∨ cardThirteenPairAt ia = (a, 4))
    (hib : cardThirteenPairAt ib = (4, b) ∨ cardThirteenPairAt ib = (b, 4))
    (hic : cardThirteenPairAt ic = (4, c) ∨ cardThirteenPairAt ic = (c, 4))
    (hid : cardThirteenPairAt id = (4, d) ∨ cardThirteenPairAt id = (d, 4)) :
    (((rowBit (directSourceRows C) 0 4 a.val &&
          rowBit (directSourceRows C) 0 4 b.val &&
          rowBit (directSourceRows C) 0 4 c.val &&
          rowBit (directSourceRows C) 0 4 d.val) ||
        (firstRowBit (directSourceFirstRow T) a.val &&
          firstRowBit (directSourceFirstRow T) b.val &&
          firstRowBit (directSourceFirstRow T) c.val &&
          firstRowBit (directSourceFirstRow T) d.val)) ||
      !((rankAtom (directSourceRanks P) ia.val ==
            rankAtom (directSourceRanks P) ib.val) &&
        (rankAtom (directSourceRanks P) ia.val ==
            rankAtom (directSourceRanks P) ic.val) &&
        (rankAtom (directSourceRanks P) ia.val ==
            rankAtom (directSourceRanks P) id.val))) = true := by
  have hexact :=
    firstApex_distinctRadius_rows_are_exactClasses Q first hcard hdistinct
  have hpointFirst : P.point 4 = S.oppApex1 :=
    P.firstApex_at_four.trans
      (oppApex1_eq_oppositeVertexByIndex_oppIndex1 S).symm
  have hbase := distinct_twoClass_uniqueK4_rank_guard
    (center := P.point 4) (radius₀ := radius) (radius₁ := first.doubleRadius)
    P.point (cardThirteenPairDistance P.point)
    (fun k ↦ rowBit (directSourceRows C) 0 4 k.val)
    (fun k ↦ firstRowBit (directSourceFirstRow T) k.val)
    (sourcePoint_mem_A P) P.point_injective
    (by
      intro rho hrho hfour
      apply firstApex_K4_radius_eq_retained_or_double_of_distinctRadius
        Q first hcard hdistinct hrho
      simpa only [hpointFirst] using hfour)
    (by
      intro k
      calc
        rowBit (directSourceRows C) 0 4 k.val = true ↔
            P.point k ∈ (T.main 4).support := by
          simpa using mainBit_true_iff P C (4 : Fin 13) k
        _ ↔ P.point k ∈ SelectedClass D.A (P.point 4) radius := by
          simp only [T.main_firstApex_support, hexact.1, hpointFirst])
    (by
      intro k
      change firstRowBit (directSourceFirstRow T) k.val = true ↔ _
      rw [firstRowBit_true_iff P]
      simp only [T.firstApexDoubleRow_support, hexact.2, hpointFirst])
    a b c d hab hac had hbc hbd hcd ia ib ic id
    (centerPoint_ne_of_index_ne P hcenter)
    (cardThirteenPairDistance_eq_centerDistance P ia 4 a hia)
    (cardThirteenPairDistance_eq_centerDistance P ib 4 b hib)
    (cardThirteenPairDistance_eq_centerDistance P ic 4 c hic)
    (cardThirteenPairDistance_eq_centerDistance P id 4 d hid)
  simpa only [rankAtom_directSourceRanks] using hbase

/-- One image-guarded unique-K4 four-subset assertion at an actual blocker. -/
theorem directSource_unique_actual_guard
    (C : CanonicalCoverFamilies T)
    (center a b c d : Fin 13)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (hcenter : center ≠ a)
    (ia ib ic id : Fin 78)
    (hia : cardThirteenPairAt ia = (center, a) ∨
      cardThirteenPairAt ia = (a, center))
    (hib : cardThirteenPairAt ib = (center, b) ∨
      cardThirteenPairAt ib = (b, center))
    (hic : cardThirteenPairAt ic = (center, c) ∨
      cardThirteenPairAt ic = (c, center))
    (hid : cardThirteenPairAt id = (center, d) ∨
      cardThirteenPairAt id = (d, center)) :
    (!((actualBlockerImageBit P T center &&
        !((rowBit (directSourceRows C) 0 center.val a.val &&
          rowBit (directSourceRows C) 0 center.val b.val &&
          rowBit (directSourceRows C) 0 center.val c.val &&
          rowBit (directSourceRows C) 0 center.val d.val)))) ||
      !((rankAtom (directSourceRanks P) ia.val ==
            rankAtom (directSourceRanks P) ib.val) &&
        (rankAtom (directSourceRanks P) ia.val ==
            rankAtom (directSourceRanks P) ic.val) &&
        (rankAtom (directSourceRanks P) ia.val ==
            rankAtom (directSourceRanks P) id.val))) = true := by
  by_cases himage : actualBlockerImageBit P T center = true
  · rcases actualBlockerImageBit_true_source P center himage with
      ⟨source, hsource⟩
    have hbase := distinct_uniqueK4_rank_guard
      (center := P.point center) (radius := (T.main center).radius)
      P.point (cardThirteenPairDistance P.point)
      (fun k ↦ rowBit (directSourceRows C) 0 center.val k.val)
      (sourcePoint_mem_A P) P.point_injective
      (actual_unique_K4_radius P source center hsource)
      (by
        intro k
        change rowBit (directSourceRows C) 0 center.val k.val = true ↔ _
        rw [mainBit_true_iff P C]
        exact Finset.ext_iff.mp
          (actual_main_support_eq_completeClass P source center hsource) (P.point k))
      a b c d hab hac had hbc hbd hcd ia ib ic id
      (centerPoint_ne_of_index_ne P hcenter)
      (cardThirteenPairDistance_eq_centerDistance P ia center a hia)
      (cardThirteenPairDistance_eq_centerDistance P ib center b hib)
      (cardThirteenPairDistance_eq_centerDistance P ic center c hic)
      (cardThirteenPairDistance_eq_centerDistance P id center d hid)
    simpa [himage] using hbase
  · have himageFalse : actualBlockerImageBit P T center = false :=
      Bool.eq_false_of_not_eq_true himage
    simp [himageFalse]

#print axioms actualBlockerImageBit
#print axioms directSource_complete_retained_guard
#print axioms directSource_complete_double_guard
#print axioms directSource_complete_second_guard
#print axioms directSource_complete_actual_guard
#print axioms distinct_twoClass_uniqueK4_rank_guard
#print axioms directSource_unique_second_guard
#print axioms directSource_unique_first_guard
#print axioms directSource_unique_actual_guard

end

end ATailExactFiveCard13DistinctRadiusSourceIngressScratch
end Problem97
