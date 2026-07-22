/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import AllOneSourceIngress

/-!
# Ordinal-rank facts for the exact-card-thirteen all-one source ingress

These lemmas prove the rank-bound, selected-row, exact-five-shell, and strict
Kalmanson assertion schemas used by all three unquotiented all-one orbits.
They do not consume a SAT certificate and do not identify any two boundary
hub positions.
-/

namespace Problem97
namespace ATailExactFiveCard13AllOneSourceIngressScratch

open scoped EuclideanGeometry

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAllOneSourceOrbitIngress

attribute [local instance] Classical.propDecidable

noncomputable section

/-- The generated source circuit reads its seven-bit rank blocks at these
exact offsets. -/
abbrev allOneRankAtom (ranks : BitVec 546) (index : Nat) : BitVec 7 :=
  ranks.extractLsb' (7 * index) 7

@[simp] theorem shellBit_sourceShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (point : Fin 13) :
    shellBit (sourceShell T) point.val = decide (point ∈ T.exactFiveShell) := by
  exact shellBit_packShell _ point

@[simp] theorem firstRowBit_sourceFirstApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (point : Fin 13) :
    firstRowBit (sourceFirstApexRow T) point.val =
      decide (P.point point ∈ T.firstApexDoubleRow.support) := by
  exact firstRowBit_packFirstApexRow _ point

/-- Two members of one source-selected row have equal distances from its
canonical center. -/
theorem sourceClass_distance_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family : Fin 3) (center left right : Fin 13)
    (hleft : P.point left ∈ (I.sourceClass family center).support)
    (hright : P.point right ∈ (I.sourceClass family center).support) :
    dist (P.point center) (P.point left) =
      dist (P.point center) (P.point right) :=
  ((I.sourceClass family center).support_eq_radius _ hleft).trans
    ((I.sourceClass family center).support_eq_radius _ hright).symm

/-- The same equality for the retained first-apex double-deletion row. -/
theorem firstApexDoubleRow_distance_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (left right : Fin 13)
    (hleft : P.point left ∈ T.firstApexDoubleRow.support)
    (hright : P.point right ∈ T.firstApexDoubleRow.support) :
    dist (P.point 4) (P.point left) = dist (P.point 4) (P.point right) :=
  (T.firstApexDoubleRow.support_eq_radius _ hleft).trans
    (T.firstApexDoubleRow.support_eq_radius _ hright).symm

private theorem oppApex2_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex, hi]

/-- Two indices in the complete exact-five shell have equal distances from
canonical second-apex index `8`. -/
theorem exactFiveShell_distance_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (left right : Fin 13) (hleft : left ∈ T.exactFiveShell)
    (hright : right ∈ T.exactFiveShell) :
    dist (P.point 8) (P.point left) = dist (P.point 8) (P.point right) := by
  have hleft' := (T.exactFiveShell_mem_iff left).1 hleft
  have hright' := (T.exactFiveShell_mem_iff right).1 hright
  have hcenter : P.point 8 = S.oppApex2 :=
    P.secondApex_at_eight.trans
      (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S).symm
  rw [hcenter]
  exact (mem_selectedClass.mp hleft').2.trans (mem_selectedClass.mp hright').2.symm

/-- The canonical strict-Kalmanson packet in the exact six edge slots used
by the ordinal source formula. -/
theorem strictKalmanson_pairDistances
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile)
    (a b c d : Fin 13) (hab : a < b) (hbc : b < c) (hcd : c < d)
    (iBC iAD iAC iBD iAB iCD : Fin 78)
    (hiBC : cardThirteenPairAt iBC = (b, c))
    (hiAD : cardThirteenPairAt iAD = (a, d))
    (hiAC : cardThirteenPairAt iAC = (a, c))
    (hiBD : cardThirteenPairAt iBD = (b, d))
    (hiAB : cardThirteenPairAt iAB = (a, b))
    (hiCD : cardThirteenPairAt iCD = (c, d)) :
    (cardThirteenPairDistance P.point iBC + cardThirteenPairDistance P.point iAD <
        cardThirteenPairDistance P.point iAC + cardThirteenPairDistance P.point iBD) ∧
      (cardThirteenPairDistance P.point iAB + cardThirteenPairDistance P.point iCD <
        cardThirteenPairDistance P.point iAC + cardThirteenPairDistance P.point iBD) := by
  simpa only [cardThirteenPairDistance, hiBC, hiAD, hiAC, hiBD, hiAB, hiCD]
    using P.strictKalmanson hab hbc hcd

@[simp] theorem allOneRankAtom_sourceRanks
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile) (i : Fin 78) :
    allOneRankAtom (sourceRanks P) i.val =
      finiteOrdinalRank78BitVec (cardThirteenPairDistance P.point) i := by
  exact extractLsb_packedCardThirteenDistanceRanks P.point i

theorem allOneRankAtom_sourceRanks_ult_seventyEight
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile) (i : Fin 78) :
    (allOneRankAtom (sourceRanks P) i.val).ult (78#7) = true := by
  simpa only [sourceRanks, allOneRankAtom] using
    packedCardThirteenDistanceRanks_ult_seventyEight P.point i

theorem allOneRankAtom_sourceRanks_eq_of_distance_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile) (i j : Fin 78)
    (h : cardThirteenPairDistance P.point i = cardThirteenPairDistance P.point j) :
    allOneRankAtom (sourceRanks P) i.val = allOneRankAtom (sourceRanks P) j.val := by
  exact (packedCardThirteenDistanceRanks_eq_iff P.point i j).2 h

theorem allOneRankAtom_sourceRanks_cancellation
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile)
    (positiveMate positiveCanceled negativeMate negativeCanceled : Fin 78)
    (hsum :
      cardThirteenPairDistance P.point negativeMate +
          cardThirteenPairDistance P.point negativeCanceled <
        cardThirteenPairDistance P.point positiveMate +
          cardThirteenPairDistance P.point positiveCanceled)
    (heq : allOneRankAtom (sourceRanks P) positiveCanceled.val =
      allOneRankAtom (sourceRanks P) negativeCanceled.val) :
    (allOneRankAtom (sourceRanks P) negativeMate.val).ult
        (allOneRankAtom (sourceRanks P) positiveMate.val) = true := by
  have heq' :
      finiteOrdinalRank78BitVec (cardThirteenPairDistance P.point) positiveCanceled =
        finiteOrdinalRank78BitVec (cardThirteenPairDistance P.point) negativeCanceled := by
    simpa only [allOneRankAtom_sourceRanks] using heq
  have hresult := finiteOrdinalRank78BitVec_cancellation
    (cardThirteenPairDistance P.point) positiveMate positiveCanceled
      negativeMate negativeCanceled hsum heq'
  simpa only [allOneRankAtom_sourceRanks] using hresult

theorem cardThirteenPairDistance_eq_centerDistance
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile) (i : Fin 78) (center point : Fin 13)
    (hpair : cardThirteenPairAt i = (center, point) ∨
      cardThirteenPairAt i = (point, center)) :
    cardThirteenPairDistance P.point i = dist (P.point center) (P.point point) := by
  rcases hpair with hpair | hpair
  · simp only [cardThirteenPairDistance, hpair]
  · simp only [cardThirteenPairDistance, hpair, dist_comm]

theorem allOne_kalmanson_rank_guard
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (P : CanonicalCard13Frame profile)
    (positiveMate positiveCanceled negativeMate negativeCanceled : Fin 78)
    (hsum :
      cardThirteenPairDistance P.point negativeMate +
          cardThirteenPairDistance P.point negativeCanceled <
        cardThirteenPairDistance P.point positiveMate +
          cardThirteenPairDistance P.point positiveCanceled) :
    ((!(allOneRankAtom (sourceRanks P) positiveCanceled.val ==
          allOneRankAtom (sourceRanks P) negativeCanceled.val)) ||
      (allOneRankAtom (sourceRanks P) negativeMate.val).ult
        (allOneRankAtom (sourceRanks P) positiveMate.val)) = true := by
  by_cases heq : allOneRankAtom (sourceRanks P) positiveCanceled.val =
      allOneRankAtom (sourceRanks P) negativeCanceled.val
  · have hult := allOneRankAtom_sourceRanks_cancellation P
      positiveMate positiveCanceled negativeMate negativeCanceled hsum heq
    have hbeq :
        (allOneRankAtom (sourceRanks P) positiveCanceled.val ==
          allOneRankAtom (sourceRanks P) negativeCanceled.val) = true :=
      beq_iff_eq.mpr heq
    rw [hbeq]
    exact hult
  · have hbeq :
        (allOneRankAtom (sourceRanks P) positiveCanceled.val ==
          allOneRankAtom (sourceRanks P) negativeCanceled.val) = false :=
      Bool.eq_false_of_not_eq_true (fun h ↦ heq (beq_iff_eq.mp h))
    rw [hbeq]
    rfl

theorem allOne_row_rank_guard
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)
    (family : Fin 3) (center left right : Fin 13) (i j : Fin 78)
    (hi : cardThirteenPairDistance P.point i = dist (P.point center) (P.point left))
    (hj : cardThirteenPairDistance P.point j = dist (P.point center) (P.point right)) :
    ((!((rowBit I.sourceRows family.val center.val left.val &&
        rowBit I.sourceRows family.val center.val right.val))) ||
      (allOneRankAtom (sourceRanks P) i.val ==
        allOneRankAtom (sourceRanks P) j.val)) = true := by
  by_cases hleft : rowBit I.sourceRows family.val center.val left.val = true
  · by_cases hright : rowBit I.sourceRows family.val center.val right.val = true
    · have hleftMem : P.point left ∈ (I.sourceClass family center).support := by
        simpa only [rowBit_sourceRows, sourceRowMember, decide_eq_true_eq] using hleft
      have hrightMem : P.point right ∈ (I.sourceClass family center).support := by
        simpa only [rowBit_sourceRows, sourceRowMember, decide_eq_true_eq] using hright
      have hdist : cardThirteenPairDistance P.point i =
          cardThirteenPairDistance P.point j := by
        rw [hi, hj]
        exact sourceClass_distance_eq I family center left right hleftMem hrightMem
      have hrank := allOneRankAtom_sourceRanks_eq_of_distance_eq P i j hdist
      simp [hleft, hright, hrank]
    · have hrightFalse :
          rowBit I.sourceRows family.val center.val right.val = false :=
        Bool.eq_false_of_not_eq_true hright
      simp [hrightFalse]
  · have hleftFalse : rowBit I.sourceRows family.val center.val left.val = false :=
      Bool.eq_false_of_not_eq_true hleft
    simp [hleftFalse]

theorem allOne_firstRow_rank_guard
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (left right : Fin 13) (i j : Fin 78)
    (hi : cardThirteenPairDistance P.point i = dist (P.point 4) (P.point left))
    (hj : cardThirteenPairDistance P.point j = dist (P.point 4) (P.point right)) :
    ((!((firstRowBit (sourceFirstApexRow T) left.val &&
        firstRowBit (sourceFirstApexRow T) right.val))) ||
      (allOneRankAtom (sourceRanks P) i.val ==
        allOneRankAtom (sourceRanks P) j.val)) = true := by
  by_cases hleftMem : P.point left ∈ T.firstApexDoubleRow.support
  · by_cases hrightMem : P.point right ∈ T.firstApexDoubleRow.support
    · have hleftBit : firstRowBit (sourceFirstApexRow T) left.val = true := by
        rw [firstRowBit_sourceFirstApexRow]
        exact decide_eq_true_iff.mpr hleftMem
      have hrightBit : firstRowBit (sourceFirstApexRow T) right.val = true := by
        rw [firstRowBit_sourceFirstApexRow]
        exact decide_eq_true_iff.mpr hrightMem
      have hrank : allOneRankAtom (sourceRanks P) i.val =
          allOneRankAtom (sourceRanks P) j.val := by
        apply allOneRankAtom_sourceRanks_eq_of_distance_eq P i j
        rw [hi, hj]
        exact firstApexDoubleRow_distance_eq T left right hleftMem hrightMem
      rw [hleftBit, hrightBit, hrank]
      simp
    · have hrightBit : firstRowBit (sourceFirstApexRow T) right.val = false := by
        rw [firstRowBit_sourceFirstApexRow]
        exact decide_eq_false_iff_not.mpr hrightMem
      rw [hrightBit]
      simp
  · have hleftBit : firstRowBit (sourceFirstApexRow T) left.val = false := by
      rw [firstRowBit_sourceFirstApexRow]
      exact decide_eq_false_iff_not.mpr hleftMem
    rw [hleftBit]
    simp

theorem allOne_shell_rank_guard
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    (T : CanonicalAllOneSemanticRowTable P star hall first)
    (left right : Fin 13) (i j : Fin 78)
    (hi : cardThirteenPairDistance P.point i = dist (P.point 8) (P.point left))
    (hj : cardThirteenPairDistance P.point j = dist (P.point 8) (P.point right)) :
    ((!((shellBit (sourceShell T) left.val && shellBit (sourceShell T) right.val))) ||
      (allOneRankAtom (sourceRanks P) i.val ==
        allOneRankAtom (sourceRanks P) j.val)) = true := by
  by_cases hleftMem : left ∈ T.exactFiveShell
  · by_cases hrightMem : right ∈ T.exactFiveShell
    · have hleftBit : shellBit (sourceShell T) left.val = true := by
        rw [shellBit_sourceShell]
        exact decide_eq_true_iff.mpr hleftMem
      have hrightBit : shellBit (sourceShell T) right.val = true := by
        rw [shellBit_sourceShell]
        exact decide_eq_true_iff.mpr hrightMem
      have hrank : allOneRankAtom (sourceRanks P) i.val =
          allOneRankAtom (sourceRanks P) j.val := by
        apply allOneRankAtom_sourceRanks_eq_of_distance_eq P i j
        rw [hi, hj]
        exact exactFiveShell_distance_eq T left right hleftMem hrightMem
      rw [hleftBit, hrightBit, hrank]
      simp
    · have hrightBit : shellBit (sourceShell T) right.val = false := by
        rw [shellBit_sourceShell]
        exact decide_eq_false_iff_not.mpr hrightMem
      rw [hrightBit]
      simp
  · have hleftBit : shellBit (sourceShell T) left.val = false := by
      rw [shellBit_sourceShell]
      exact decide_eq_false_iff_not.mpr hleftMem
    rw [hleftBit]
    simp

#print axioms allOneRankAtom_sourceRanks_ult_seventyEight
#print axioms allOne_kalmanson_rank_guard
#print axioms allOne_row_rank_guard
#print axioms allOne_firstRow_rank_guard
#print axioms allOne_shell_rank_guard

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
