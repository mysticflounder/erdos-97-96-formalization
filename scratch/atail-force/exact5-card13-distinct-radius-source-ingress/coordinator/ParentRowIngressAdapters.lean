/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DirectFlatSourceIngress
import DirectSourceRankFacts
import ExactFiveFirstApexCard13ParentRowCoupling

/-!
# Parent-row ingress for the exact-five card-thirteen distinct-radius source

This module supplies the two thirteen-bit parent-row assignments omitted by
`DirectFlatSourceIngress`.  It proves the fourteen assertions in the
distinct-parent-coupling block and generic equal-rank guards for both parent
rows.  It does not instantiate the 132 parent-row rank assertions and does not
claim coverage of the other source blocks.
-/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveFirstApexCard13ParentRowCouplingScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable

attribute [local instance] Classical.propDecidable

noncomputable section

private theorem oppApex2_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp only [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppositeVertexByIndex,
      Fin.isValue] <;>
    simp_all

/-- One parent-row membership vector in canonical point order. -/
abbrev ParentRowBits := BitVec 13

/-- Read one parent-row membership bit. -/
abbrev parentRowBit (row : ParentRowBits) (point : Nat) : Bool :=
  row.getLsbD point

/-- Pack one parent row in canonical point order. -/
def packParentRow (member : Fin 13 → Bool) : ParentRowBits :=
  BitVec.ofFnLE member

/-- `parentRowBit` exactly recovers a packed parent-row membership. -/
@[simp] theorem parentRowBit_packParentRow
    (member : Fin 13 → Bool) (point : Fin 13) :
    parentRowBit (packParentRow member) point.val = member point := by
  unfold parentRowBit
  rw [packParentRow, BitVec.getLsbD_ofFnLE, dif_pos point.isLt]

/-- The retained first-apex parent row in the source's thirteen-bit layout. -/
def directSourceParentFirst
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) : ParentRowBits :=
  packParentRow fun point ↦ decide (P.point point ∈ R.common.packet.B₁)

/-- The retained second-apex parent row in the source's thirteen-bit layout. -/
def directSourceParentSecond
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) : ParentRowBits :=
  packParentRow fun point ↦ decide (P.point point ∈ R.common.packet.B₂)

@[simp] theorem parentRowBit_directSourceParentFirst
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (point : Fin 13) :
    parentRowBit (directSourceParentFirst P) point.val =
      decide (P.point point ∈ R.common.packet.B₁) := by
  exact parentRowBit_packParentRow _ point

@[simp] theorem parentRowBit_directSourceParentSecond
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) (point : Fin 13) :
    parentRowBit (directSourceParentSecond P) point.val =
      decide (P.point point ∈ R.common.packet.B₂) := by
  exact parentRowBit_packParentRow _ point

/-- The thirteen pointwise equalities in source assertions `h40210`--`h40222`. -/
theorem directSource_parentFirst_eq_firstRow
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
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius)
    (point : Fin 13) :
    parentRowBit (directSourceParentFirst P) point.val =
      firstRowBit (directSourceFirstRow T) point.val := by
  rw [parentRowBit_directSourceParentFirst, firstRowBit_directSourceFirstRow]
  rw [parentFirstRow_eq_doubleRow_of_distinctRadius Q first hcard hdistinct,
    ← T.firstApexDoubleRow_support]

/-- The complete exact-five second-apex class cannot contain both retained
frontier sources, because their simultaneous deletion still leaves K4. -/
theorem frontier_not_both_mem_exactFiveShell
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    ¬(T.frontierQIndex ∈ T.exactFiveShell ∧
      T.frontierWIndex ∈ T.exactFiveShell) := by
  rintro ⟨hqShell, hwShell⟩
  have hqClass :
      F.pair.q ∈ SelectedClass D.A S.oppApex2 profile.radius := by
    simpa only [T.frontierQ_point] using
      (T.exactFiveShell_mem_iff T.frontierQIndex).mp hqShell
  have hwClass :
      F.pair.w ∈ SelectedClass D.A S.oppApex2 profile.radius := by
    simpa only [T.frontierW_point] using
      (T.exactFiveShell_mem_iff T.frontierWIndex).mp hwShell
  rcases exists_selectedClass_card_ge_of_hasNEquidistantPointsAt
      F.secondApexDouble with ⟨rho, hrho, hfourErased⟩
  have herasedSubset :
      SelectedClass ((D.A.erase F.pair.q).erase F.pair.w)
          S.oppApex2 rho ⊆ SelectedClass D.A S.oppApex2 rho := by
    intro x hx
    rcases mem_selectedClass.mp hx with ⟨hxA, hxRadius⟩
    exact mem_selectedClass.mpr
      ⟨Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxA), hxRadius⟩
  have hfourAmbient :
      4 ≤ (SelectedClass D.A S.oppApex2 rho).card :=
    hfourErased.trans (Finset.card_le_card herasedSubset)
  have hradius : rho = profile.radius :=
    profile.unique_K4_radius rho hrho hfourAmbient
  subst rho
  have hwAfterQ :
      F.pair.w ∈
        (SelectedClass D.A S.oppApex2 profile.radius).erase F.pair.q :=
    Finset.mem_erase.mpr ⟨F.pair.q_ne_w.symm, hwClass⟩
  rw [selectedClass_erase_eq, selectedClass_erase_eq,
    Finset.card_erase_of_mem hwAfterQ,
    Finset.card_erase_of_mem hqClass,
    profile.class_card_eq_five] at hfourErased
  omega

/-- Evaluate exact-shell membership at one four-bit role.  This is the
thirteen-way multiplexer used by source assertion `h40223`. -/
def shellAtRole (shell : ShellBits) (role : BitVec 4) : Bool :=
  ((role == 0#4) && shellBit shell 0) ||
  ((role == 1#4) && shellBit shell 1) ||
  ((role == 2#4) && shellBit shell 2) ||
  ((role == 3#4) && shellBit shell 3) ||
  ((role == 4#4) && shellBit shell 4) ||
  ((role == 5#4) && shellBit shell 5) ||
  ((role == 6#4) && shellBit shell 6) ||
  ((role == 7#4) && shellBit shell 7) ||
  ((role == 8#4) && shellBit shell 8) ||
  ((role == 9#4) && shellBit shell 9) ||
  ((role == 10#4) && shellBit shell 10) ||
  ((role == 11#4) && shellBit shell 11) ||
  ((role == 12#4) && shellBit shell 12)

private theorem shellAtRole_ofNat
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) (point : Fin 13) :
    shellAtRole (directSourceShell T) (BitVec.ofNat 4 point.val) =
      decide (point ∈ T.exactFiveShell) := by
  have hmux :
      shellAtRole (directSourceShell T) (BitVec.ofNat 4 point.val) =
        shellBit (directSourceShell T) point.val := by
    fin_cases point <;> simp [shellAtRole]
  rw [hmux]
  exact shellBit_directSourceShell T point

@[simp] theorem shellAtRole_directSourceQ
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    shellAtRole (directSourceShell T) (directSourceQ T) =
      decide (T.frontierQIndex ∈ T.exactFiveShell) := by
  exact shellAtRole_ofNat T T.frontierQIndex

@[simp] theorem shellAtRole_directSourceW
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    shellAtRole (directSourceShell T) (directSourceW T) =
      decide (T.frontierWIndex ∈ T.exactFiveShell) := by
  exact shellAtRole_ofNat T T.frontierWIndex

/-- Exact Boolean form of source assertion `h40223`. -/
theorem directSource_frontier_not_both_mem_shell
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) :
    (!(shellAtRole (directSourceShell T) (directSourceQ T) &&
      shellAtRole (directSourceShell T) (directSourceW T))) = true := by
  have hnot := frontier_not_both_mem_exactFiveShell T
  by_cases hq : T.frontierQIndex ∈ T.exactFiveShell
  · have hw : T.frontierWIndex ∉ T.exactFiveShell := fun hw ↦ hnot ⟨hq, hw⟩
    simp [hq, hw]
  · simp [hq]

/-- Generic guarded rank equality for the retained first parent row. -/
theorem directSource_parentFirst_rank_guard
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
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius)
    (left right : Fin 13) (i j : Fin 78)
    (hi : cardThirteenPairDistance P.point i =
      dist (P.point 4) (P.point left))
    (hj : cardThirteenPairDistance P.point j =
      dist (P.point 4) (P.point right)) :
    ((!((parentRowBit (directSourceParentFirst P) left.val &&
        parentRowBit (directSourceParentFirst P) right.val))) ||
      (rankAtom (directSourceRanks P) i.val ==
        rankAtom (directSourceRanks P) j.val)) = true := by
  rw [directSource_parentFirst_eq_firstRow T hcard hdistinct left,
    directSource_parentFirst_eq_firstRow T hcard hdistinct right]
  exact directSource_firstRow_rank_guard left right i j hi hj

/-- Generic guarded rank equality for the retained second parent row. -/
theorem directSource_parentSecond_rank_guard
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
    (left right : Fin 13) (i j : Fin 78)
    (hi : cardThirteenPairDistance P.point i =
      dist (P.point 8) (P.point left))
    (hj : cardThirteenPairDistance P.point j =
      dist (P.point 8) (P.point right)) :
    ((!((parentRowBit (directSourceParentSecond P) left.val &&
        parentRowBit (directSourceParentSecond P) right.val))) ||
      (rankAtom (directSourceRanks P) i.val ==
        rankAtom (directSourceRanks P) j.val)) = true := by
  rw [parentRowBit_directSourceParentSecond,
    parentRowBit_directSourceParentSecond]
  by_cases hleft : P.point left ∈ R.common.packet.B₂
  · by_cases hright : P.point right ∈ R.common.packet.B₂
    · have hpointSecond : P.point 8 = S.oppApex2 :=
        P.secondApex_at_eight.trans
          (oppApex2_eq_oppositeVertexByIndex_oppIndex2 S).symm
      have hdist : cardThirteenPairDistance P.point i =
          cardThirteenPairDistance P.point j := by
        rw [hi, hj, hpointSecond]
        exact (R.common.packet.row₂.same_radius _ hleft).trans
          (R.common.packet.row₂.same_radius _ hright).symm
      have hrank := rankAtom_directSourceRanks_eq_of_distance_eq P i j hdist
      simp [hleft, hright, hrank]
    · simp [hright]
  · simp [hleft]

#print axioms parentRowBit_packParentRow
#print axioms directSource_parentFirst_eq_firstRow
#print axioms frontier_not_both_mem_exactFiveShell
#print axioms shellAtRole_directSourceQ
#print axioms shellAtRole_directSourceW
#print axioms directSource_frontier_not_both_mem_shell
#print axioms directSource_parentFirst_rank_guard
#print axioms directSource_parentSecond_rank_guard

end

end ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch
end Problem97
