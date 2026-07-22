/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DirectSourceBaseFacts

/-!
# Rank facts for the exact-five card-thirteen direct source assignment

This module is the source-side interface for the rank and strict-Kalmanson
blocks of the verified Boolean certificate.  It does not mention a generated
certificate leaf: the lemmas below transport actual distance equality and
strict inequality into the exact packed seven-bit rank atoms used by every
generated chunk.
-/

namespace Problem97
namespace ATailExactFiveCard13CnfIngressScratch

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13CommonLabelTransportScratch
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

noncomputable section

/-- The generated source circuit reads its seven-bit rank blocks at these
exact offsets. -/
abbrev rankAtom (ranks : BitVec 546) (index : Nat) : BitVec 7 :=
  ranks.extractLsb' (7 * index) 7

section SemanticDistanceFacts

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
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}

/-- Two members of one main selected row have equal distances from its
canonical center. -/
theorem mainRow_distance_eq (center left right : Fin 13)
    (hleft : P.point left ∈ (T.main center).support)
    (hright : P.point right ∈ (T.main center).support) :
    dist (P.point center) (P.point left) =
      dist (P.point center) (P.point right) :=
  ((T.main center).support_eq_radius _ hleft).trans
    ((T.main center).support_eq_radius _ hright).symm

/-- The same equality for the canonical left deletion-cover family. -/
theorem leftCoverRow_distance_eq (C : CanonicalCoverFamilies T)
    (center left right : Fin 13)
    (hleft : P.point left ∈ (C.left center).support)
    (hright : P.point right ∈ (C.left center).support) :
    dist (P.point center) (P.point left) =
      dist (P.point center) (P.point right) :=
  ((C.left center).support_eq_radius _ hleft).trans
    ((C.left center).support_eq_radius _ hright).symm

/-- The same equality for the canonical right deletion-cover family. -/
theorem rightCoverRow_distance_eq (C : CanonicalCoverFamilies T)
    (center left right : Fin 13)
    (hleft : P.point left ∈ (C.right center).support)
    (hright : P.point right ∈ (C.right center).support) :
    dist (P.point center) (P.point left) =
      dist (P.point center) (P.point right) :=
  ((C.right center).support_eq_radius _ hleft).trans
    ((C.right center).support_eq_radius _ hright).symm

/-- The same equality for the first-apex double-deletion row. -/
theorem firstApexDoubleRow_distance_eq (left right : Fin 13)
    (hleft : P.point left ∈ T.firstApexDoubleRow.support)
    (hright : P.point right ∈ T.firstApexDoubleRow.support) :
    dist (P.point 4) (P.point left) =
      dist (P.point 4) (P.point right) :=
  (T.firstApexDoubleRow.support_eq_radius _ hleft).trans
    (T.firstApexDoubleRow.support_eq_radius _ hright).symm

/-- Two indices in the exact five-shell have equal distances from canonical
second-apex index `8`. -/
theorem exactFiveShell_distance_eq (left right : Fin 13)
    (hleft : left ∈ T.exactFiveShell)
    (hright : right ∈ T.exactFiveShell) :
    dist (P.point 8) (P.point left) =
      dist (P.point 8) (P.point right) := by
  have hleft' := (T.exactFiveShell_mem_iff left).1 hleft
  have hright' := (T.exactFiveShell_mem_iff right).1 hright
  have hcenter : P.point 8 = S.oppApex2 :=
    P.secondApex_at_eight.trans
      (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S).symm
  rw [hcenter]
  exact (mem_selectedClass.mp hleft').2.trans
    (mem_selectedClass.mp hright').2.symm

/-- The canonical strict-Kalmanson packet, rewritten into the exact six edge
indices used by the generated ordinal formula.  Concrete generated uses
discharge the six `cardThirteenPairAt` equalities by computation. -/
theorem strictKalmanson_pairDistances
    (a b c d : Fin 13) (hab : a < b) (hbc : b < c) (hcd : c < d)
    (iBC iAD iAC iBD iAB iCD : Fin 78)
    (hiBC : cardThirteenPairAt iBC = (b, c))
    (hiAD : cardThirteenPairAt iAD = (a, d))
    (hiAC : cardThirteenPairAt iAC = (a, c))
    (hiBD : cardThirteenPairAt iBD = (b, d))
    (hiAB : cardThirteenPairAt iAB = (a, b))
    (hiCD : cardThirteenPairAt iCD = (c, d)) :
    (cardThirteenPairDistance P.point iBC +
          cardThirteenPairDistance P.point iAD <
        cardThirteenPairDistance P.point iAC +
          cardThirteenPairDistance P.point iBD) ∧
      (cardThirteenPairDistance P.point iAB +
          cardThirteenPairDistance P.point iCD <
        cardThirteenPairDistance P.point iAC +
          cardThirteenPairDistance P.point iBD) := by
  simpa only [cardThirteenPairDistance, hiBC, hiAD, hiAC, hiBD, hiAB, hiCD]
    using P.strictKalmanson hab hbc hcd

end SemanticDistanceFacts

/-- Extraction from the packed source rank assignment is exactly the finite
ordinal rank of the corresponding Euclidean distance. -/
@[simp] theorem rankAtom_directSourceRanks
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (i : Fin 78) :
    rankAtom (directSourceRanks P) i.val =
      finiteOrdinalRank78BitVec (cardThirteenPairDistance P.point) i := by
  exact extractLsb_packedCardThirteenDistanceRanks P.point i

/-- Every extracted rank in the source assignment satisfies the explicit
seven-bit upper bound used by the generated formula. -/
theorem rankAtom_directSourceRanks_ult_seventyEight
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (i : Fin 78) :
    (rankAtom (directSourceRanks P) i.val).ult (78#7) = true := by
  simpa only [directSourceRanks, rankAtom] using
    packedCardThirteenDistanceRanks_ult_seventyEight P.point i

/-- Equality of two actual indexed distances gives equality of their packed
source ranks. -/
theorem rankAtom_directSourceRanks_eq_of_distance_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (i j : Fin 78)
    (h : cardThirteenPairDistance P.point i =
      cardThirteenPairDistance P.point j) :
    rankAtom (directSourceRanks P) i.val =
      rankAtom (directSourceRanks P) j.val := by
  exact (packedCardThirteenDistanceRanks_eq_iff P.point i j).2 h

/-- A strict comparison of two actual indexed distances gives the exact
unsigned comparison of their packed source ranks. -/
theorem rankAtom_directSourceRanks_ult_of_distance_lt
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (i j : Fin 78)
    (h : cardThirteenPairDistance P.point i <
      cardThirteenPairDistance P.point j) :
    (rankAtom (directSourceRanks P) i.val).ult
        (rankAtom (directSourceRanks P) j.val) = true := by
  exact (packedCardThirteenDistanceRanks_ult_iff P.point i j).2 h

/-- Cancellation form used by the strict-Kalmanson source clauses.  The
geometric inequality supplies the four distance indices; equality of the
canceled rank pair forces the remaining unsigned strict comparison. -/
theorem rankAtom_directSourceRanks_cancellation
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
    (positiveMate positiveCanceled negativeMate negativeCanceled : Fin 78)
    (hsum :
      cardThirteenPairDistance P.point negativeMate +
          cardThirteenPairDistance P.point negativeCanceled <
        cardThirteenPairDistance P.point positiveMate +
          cardThirteenPairDistance P.point positiveCanceled)
    (heq :
      rankAtom (directSourceRanks P) positiveCanceled.val =
        rankAtom (directSourceRanks P) negativeCanceled.val) :
    (rankAtom (directSourceRanks P) negativeMate.val).ult
        (rankAtom (directSourceRanks P) positiveMate.val) = true := by
  have heq' :
      finiteOrdinalRank78BitVec (cardThirteenPairDistance P.point)
          positiveCanceled =
        finiteOrdinalRank78BitVec (cardThirteenPairDistance P.point)
          negativeCanceled := by
    simpa only [rankAtom_directSourceRanks] using heq
  have hresult := finiteOrdinalRank78BitVec_cancellation
    (cardThirteenPairDistance P.point) positiveMate positiveCanceled
      negativeMate negativeCanceled hsum heq'
  simpa only [rankAtom_directSourceRanks] using hresult

/-- Computational adapter from the lexicographic pair table to an ordered
center-to-point distance.  Generated instances discharge `hpair` by
`decide`; the second orientation uses symmetry of Euclidean distance. -/
theorem cardThirteenPairDistance_eq_centerDistance
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
    (i : Fin 78) (center point : Fin 13)
    (hpair : cardThirteenPairAt i = (center, point) ∨
      cardThirteenPairAt i = (point, center)) :
    cardThirteenPairDistance P.point i =
      dist (P.point center) (P.point point) := by
  rcases hpair with hpair | hpair
  · simp only [cardThirteenPairDistance, hpair]
  · simp only [cardThirteenPairDistance, hpair, dist_comm]

/-- Boolean implication form of the Kalmanson cancellation rule used by the
generated source formula. -/
theorem directSource_kalmanson_rank_guard
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
    (positiveMate positiveCanceled negativeMate negativeCanceled : Fin 78)
    (hsum :
      cardThirteenPairDistance P.point negativeMate +
          cardThirteenPairDistance P.point negativeCanceled <
        cardThirteenPairDistance P.point positiveMate +
          cardThirteenPairDistance P.point positiveCanceled) :
    ((!(rankAtom (directSourceRanks P) positiveCanceled.val ==
          rankAtom (directSourceRanks P) negativeCanceled.val)) ||
      (rankAtom (directSourceRanks P) negativeMate.val).ult
        (rankAtom (directSourceRanks P) positiveMate.val)) = true := by
  by_cases heq : rankAtom (directSourceRanks P) positiveCanceled.val =
      rankAtom (directSourceRanks P) negativeCanceled.val
  · have hult := rankAtom_directSourceRanks_cancellation P
      positiveMate positiveCanceled negativeMate negativeCanceled hsum heq
    have hbeq :
        (rankAtom (directSourceRanks P) positiveCanceled.val ==
          rankAtom (directSourceRanks P) negativeCanceled.val) = true :=
      beq_iff_eq.mpr heq
    rw [hbeq]
    exact hult
  · have hbeq :
        (rankAtom (directSourceRanks P) positiveCanceled.val ==
          rankAtom (directSourceRanks P) negativeCanceled.val) = false :=
      Bool.eq_false_of_not_eq_true (fun h ↦ heq (beq_iff_eq.mp h))
    rw [hbeq]
    rfl

/-- Guarded equal-rank clause for any one of the three selected row
families.  Concrete generated calls only have to identify the two edge
indices with their actual center-to-support distances. -/
theorem directSource_row_rank_guard
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
    (C : CanonicalCoverFamilies T)
    (family : Fin 3) (center left right : Fin 13) (i j : Fin 78)
    (hi : cardThirteenPairDistance P.point i =
      dist (P.point center) (P.point left))
    (hj : cardThirteenPairDistance P.point j =
      dist (P.point center) (P.point right)) :
    ((!((rowBit (directSourceRows C) family.val center.val left.val &&
        rowBit (directSourceRows C) family.val center.val right.val))) ||
      (rankAtom (directSourceRanks P) i.val ==
        rankAtom (directSourceRanks P) j.val)) = true := by
  by_cases hleft :
      rowBit (directSourceRows C) family.val center.val left.val = true
  · by_cases hright :
        rowBit (directSourceRows C) family.val center.val right.val = true
    · have hleftMem :
          P.point left ∈ (directSourceClass C family center).support := by
        simpa only [rowBit_directSourceRows,
          directSourceRowMember_eq_decide_mem, decide_eq_true_eq] using hleft
      have hrightMem :
          P.point right ∈ (directSourceClass C family center).support := by
        simpa only [rowBit_directSourceRows,
          directSourceRowMember_eq_decide_mem, decide_eq_true_eq] using hright
      have hdist : cardThirteenPairDistance P.point i =
          cardThirteenPairDistance P.point j := by
        rw [hi, hj]
        exact ((directSourceClass C family center).support_eq_radius
          _ hleftMem).trans
          ((directSourceClass C family center).support_eq_radius
            _ hrightMem).symm
      have hrank := rankAtom_directSourceRanks_eq_of_distance_eq P i j hdist
      simp [hleft, hright, hrank]
    · have hrightFalse :
          rowBit (directSourceRows C) family.val center.val right.val = false :=
        Bool.eq_false_of_not_eq_true hright
      simp [hrightFalse]
  · have hleftFalse :
        rowBit (directSourceRows C) family.val center.val left.val = false :=
      Bool.eq_false_of_not_eq_true hleft
    simp [hleftFalse]

/-- Guarded equal-rank clause for the first-apex double-deletion row. -/
theorem directSource_firstRow_rank_guard
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
    (left right : Fin 13) (i j : Fin 78)
    (hi : cardThirteenPairDistance P.point i =
      dist (P.point 4) (P.point left))
    (hj : cardThirteenPairDistance P.point j =
      dist (P.point 4) (P.point right)) :
    ((!((firstRowBit (directSourceFirstRow T) left.val &&
        firstRowBit (directSourceFirstRow T) right.val))) ||
      (rankAtom (directSourceRanks P) i.val ==
        rankAtom (directSourceRanks P) j.val)) = true := by
  by_cases hleftMem : P.point left ∈ T.firstApexDoubleRow.support
  · by_cases hrightMem : P.point right ∈ T.firstApexDoubleRow.support
    · have hleftBit :
          firstRowBit (directSourceFirstRow T) left.val = true := by
        rw [firstRowBit_directSourceFirstRow]
        exact decide_eq_true_iff.mpr hleftMem
      have hrightBit :
          firstRowBit (directSourceFirstRow T) right.val = true := by
        rw [firstRowBit_directSourceFirstRow]
        exact decide_eq_true_iff.mpr hrightMem
      have hrank : rankAtom (directSourceRanks P) i.val =
          rankAtom (directSourceRanks P) j.val := by
        apply rankAtom_directSourceRanks_eq_of_distance_eq P i j
        rw [hi, hj]
        exact firstApexDoubleRow_distance_eq left right hleftMem hrightMem
      rw [hleftBit, hrightBit, hrank]
      simp
    · have hrightBit :
          firstRowBit (directSourceFirstRow T) right.val = false := by
        rw [firstRowBit_directSourceFirstRow]
        exact decide_eq_false_iff_not.mpr hrightMem
      rw [hrightBit]
      simp
  · have hleftBit :
        firstRowBit (directSourceFirstRow T) left.val = false := by
      rw [firstRowBit_directSourceFirstRow]
      exact decide_eq_false_iff_not.mpr hleftMem
    rw [hleftBit]
    simp

/-- Guarded equal-rank clause for the complete exact-five shell. -/
theorem directSource_shell_rank_guard
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
    (left right : Fin 13) (i j : Fin 78)
    (hi : cardThirteenPairDistance P.point i =
      dist (P.point 8) (P.point left))
    (hj : cardThirteenPairDistance P.point j =
      dist (P.point 8) (P.point right)) :
    ((!((shellBit (directSourceShell T) left.val &&
        shellBit (directSourceShell T) right.val))) ||
      (rankAtom (directSourceRanks P) i.val ==
        rankAtom (directSourceRanks P) j.val)) = true := by
  by_cases hleftMem : left ∈ T.exactFiveShell
  · by_cases hrightMem : right ∈ T.exactFiveShell
    · have hleftBit : shellBit (directSourceShell T) left.val = true := by
        rw [shellBit_directSourceShell]
        exact decide_eq_true_iff.mpr hleftMem
      have hrightBit : shellBit (directSourceShell T) right.val = true := by
        rw [shellBit_directSourceShell]
        exact decide_eq_true_iff.mpr hrightMem
      have hrank : rankAtom (directSourceRanks P) i.val =
          rankAtom (directSourceRanks P) j.val := by
        apply rankAtom_directSourceRanks_eq_of_distance_eq P i j
        rw [hi, hj]
        exact exactFiveShell_distance_eq left right hleftMem hrightMem
      rw [hleftBit, hrightBit, hrank]
      simp
    · have hrightBit :
          shellBit (directSourceShell T) right.val = false := by
        rw [shellBit_directSourceShell]
        exact decide_eq_false_iff_not.mpr hrightMem
      rw [hrightBit]
      simp
  · have hleftBit : shellBit (directSourceShell T) left.val = false := by
      rw [shellBit_directSourceShell]
      exact decide_eq_false_iff_not.mpr hleftMem
    rw [hleftBit]
    simp

#print axioms rankAtom_directSourceRanks
#print axioms rankAtom_directSourceRanks_ult_seventyEight
#print axioms rankAtom_directSourceRanks_eq_of_distance_eq
#print axioms rankAtom_directSourceRanks_ult_of_distance_lt
#print axioms rankAtom_directSourceRanks_cancellation
#print axioms cardThirteenPairDistance_eq_centerDistance
#print axioms directSource_kalmanson_rank_guard
#print axioms directSource_row_rank_guard
#print axioms directSource_firstRow_rank_guard
#print axioms directSource_shell_rank_guard
#print axioms mainRow_distance_eq
#print axioms leftCoverRow_distance_eq
#print axioms rightCoverRow_distance_eq
#print axioms firstApexDoubleRow_distance_eq
#print axioms exactFiveShell_distance_eq
#print axioms strictKalmanson_pairDistances

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
