/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SemanticRowTable
import BooleanPacking
import FiniteDistanceRank
import ExactFiveFirstApexCard13NormalForm
import KalmansonParentOrderAdapter

/-!
# Source assignment for the exact-five card-thirteen direct flat core

This module maps the source-faithful semantic witness table into the exact
bit layouts consumed by `directFlatSourceCore_false`.  It does not repeat the
generated certificate and does not aggregate its hypotheses into a Boolean
formula.
-/

namespace Problem97
namespace ATailExactFiveCard13CnfIngressScratch

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
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

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Membership in the three source-faithful row families.  Family zero is an
arbitrary ambient K4 row; families one and two are the independently chosen
canonical left/right deletion-cover rows. -/
def directSourceRowMember
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
    (family : Fin 3) (center point : Fin 13) : Bool :=
  if family = 0 then
    decide (P.point point ∈ (T.main center).support)
  else if family = 1 then
    decide (P.point point ∈ (C.left center).support)
  else
    decide (P.point point ∈ (C.right center).support)

/-- The exact 507-bit source row assignment. -/
def directSourceRows
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
    (C : CanonicalCoverFamilies T) : RowBits :=
  packThreeRowFamilies (directSourceRowMember C)

/-- The exact 52-bit actual-blocker assignment. -/
def directSourceBlockers
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) : BlockerBits :=
  packThirteenBlockers fun source ↦
    BitVec.ofNat 4 (T.blockerIndex source).val

/-- The exact 13-bit complete second-apex five-shell assignment. -/
def directSourceShell
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) : ShellBits :=
  packShell fun point ↦ decide (point ∈ T.exactFiveShell)

/-- The exact 13-bit first-apex double-deletion row assignment. -/
def directSourceFirstRow
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) : FirstRowBits :=
  packFirstApexRow fun point ↦
    decide (P.point point ∈ T.firstApexDoubleRow.support)

/-- The frontier source roles in the generated four-bit encoding. -/
def directSourceQ
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) : BitVec 4 :=
  BitVec.ofNat 4 T.frontierQIndex.val

def directSourceW
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) : BitVec 4 :=
  BitVec.ofNat 4 T.frontierWIndex.val

/-- The exact 546-bit ordinal-distance assignment. -/
def directSourceRanks
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N) : BitVec 546 :=
  packedCardThirteenDistanceRanks P.point

@[simp] theorem rowBit_directSourceRows
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
    (family : Fin 3) (center point : Fin 13) :
    rowBit (directSourceRows C) family.val center.val point.val =
      directSourceRowMember C family center point := by
  exact rowBit_packThreeRowFamilies _ _ _ _

@[simp] theorem blockerAt_directSourceBlockers
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
    (source : Fin 13) :
    blockerAt (directSourceBlockers T) source.val =
      BitVec.ofNat 4 (T.blockerIndex source).val := by
  exact blockerAt_packThirteenBlockers _ _

@[simp] theorem shellBit_directSourceShell
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
    (point : Fin 13) :
    shellBit (directSourceShell T) point.val =
      decide (point ∈ T.exactFiveShell) := by
  exact shellBit_packShell _ _

@[simp] theorem firstRowBit_directSourceFirstRow
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
    (point : Fin 13) :
    firstRowBit (directSourceFirstRow T) point.val =
      decide (P.point point ∈ T.firstApexDoubleRow.support) := by
  exact firstRowBit_packFirstApexRow _ _

@[simp] theorem directSourceQ_toNat
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
    (directSourceQ T).toNat = T.frontierQIndex.val := by
  rw [directSourceQ, BitVec.toNat_ofNat, Nat.mod_eq_of_lt]
  omega

@[simp] theorem directSourceW_toNat
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
    (directSourceW T).toNat = T.frontierWIndex.val := by
  rw [directSourceW, BitVec.toNat_ofNat, Nat.mod_eq_of_lt]
  omega

theorem directSourceQ_eq_ofNat_iff
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) (i : Fin 13) :
    directSourceQ T = BitVec.ofNat 4 i.val ↔ T.frontierQIndex = i := by
  constructor
  · intro h
    apply Fin.ext
    have hnat := congrArg BitVec.toNat h
    simpa [directSourceQ, BitVec.toNat_ofNat, Nat.mod_eq_of_lt,
      show T.frontierQIndex.val < 16 by omega,
      show i.val < 16 by omega] using hnat
  · intro h
    simp [directSourceQ, h]

theorem directSourceW_eq_ofNat_iff
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) (i : Fin 13) :
    directSourceW T = BitVec.ofNat 4 i.val ↔ T.frontierWIndex = i := by
  constructor
  · intro h
    apply Fin.ext
    have hnat := congrArg BitVec.toNat h
    simpa [directSourceW, BitVec.toNat_ofNat, Nat.mod_eq_of_lt,
      show T.frontierWIndex.val < 16 by omega,
      show i.val < 16 by omega] using hnat
  · intro h
    simp [directSourceW, h]

/-- Uniform source proof of the eight q/w double-deletion omissions
`h0145`–`h0152`. -/
theorem directSource_frontier_or_not_firstRow
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) (i : Fin 13) :
    ((!((directSourceQ T == BitVec.ofNat 4 i.val)) ||
          !(firstRowBit (directSourceFirstRow T) i.val))) = true ∧
      ((!((directSourceW T == BitVec.ofNat 4 i.val)) ||
          !(firstRowBit (directSourceFirstRow T) i.val))) = true := by
  have hfacts := frontier_row_facts T
  constructor
  · by_cases hqi : T.frontierQIndex = i
    · have hnot : P.point i ∉ T.firstApexDoubleRow.support := by
        simpa only [hqi] using hfacts.2.2.1
      have hqeq : directSourceQ T = BitVec.ofNat 4 i.val :=
        (directSourceQ_eq_ofNat_iff T i).mpr hqi
      have hbit : firstRowBit (directSourceFirstRow T) i.val = false := by
        rw [firstRowBit_directSourceFirstRow]
        exact decide_eq_false_iff_not.mpr hnot
      rw [hqeq]
      simp only [beq_self_eq_true, Bool.not_true, Bool.false_or]
      simpa [hbit]
    · have hqne : directSourceQ T ≠ BitVec.ofNat 4 i.val :=
        fun h ↦ hqi ((directSourceQ_eq_ofNat_iff T i).mp h)
      simp [hqne]
  · by_cases hwi : T.frontierWIndex = i
    · have hnot : P.point i ∉ T.firstApexDoubleRow.support := by
        simpa only [hwi] using hfacts.2.2.2
      have hweq : directSourceW T = BitVec.ofNat 4 i.val :=
        (directSourceW_eq_ofNat_iff T i).mpr hwi
      have hbit : firstRowBit (directSourceFirstRow T) i.val = false := by
        rw [firstRowBit_directSourceFirstRow]
        exact decide_eq_false_iff_not.mpr hnot
      rw [hweq]
      simp only [beq_self_eq_true, Bool.not_true, Bool.false_or]
      simpa [hbit]
    · have hwne : directSourceW T ≠ BitVec.ofNat 4 i.val :=
        fun h ↦ hwi ((directSourceW_eq_ofNat_iff T i).mp h)
      simp [hwne]

/-- Exact source proof of the strict-block retained-row occurrence `h0164`. -/
theorem directSource_frontier_strict_main_occurrence
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
    ((((directSourceQ T == 9#4) && rowBit (directSourceRows C) 0 4 9) ||
      ((directSourceQ T == 10#4) && rowBit (directSourceRows C) 0 4 10) ||
      ((directSourceQ T == 11#4) && rowBit (directSourceRows C) 0 4 11) ||
      ((directSourceQ T == 12#4) && rowBit (directSourceRows C) 0 4 12) ||
      ((directSourceW T == 9#4) && rowBit (directSourceRows C) 0 4 9) ||
      ((directSourceW T == 10#4) && rowBit (directSourceRows C) 0 4 10) ||
      ((directSourceW T == 11#4) && rowBit (directSourceRows C) 0 4 11) ||
      ((directSourceW T == 12#4) && rowBit (directSourceRows C) 0 4 12))) = true := by
  have hfacts := frontier_row_facts T
  have hqMain (i : Fin 13) (hi : T.frontierQIndex = i) :
      rowBit (directSourceRows C) 0 4 i.val = true := by
    have hpack := rowBit_directSourceRows C (0 : Fin 3) (4 : Fin 13) i
    change rowBit (directSourceRows C) 0 4 i.val =
      directSourceRowMember C 0 4 i at hpack
    rw [hpack]
    have hmem : P.point i ∈ (T.main 4).support := by
      simpa only [hi] using hfacts.1
    simp [directSourceRowMember, hmem]
  have hwMain (i : Fin 13) (hi : T.frontierWIndex = i) :
      rowBit (directSourceRows C) 0 4 i.val = true := by
    have hpack := rowBit_directSourceRows C (0 : Fin 3) (4 : Fin 13) i
    change rowBit (directSourceRows C) 0 4 i.val =
      directSourceRowMember C 0 4 i at hpack
    rw [hpack]
    have hmem : P.point i ∈ (T.main 4).support := by
      simpa only [hi] using hfacts.2.1
    simp [directSourceRowMember, hmem]
  rcases frontier_index_gt_eight T with hq | hw
  · have hcases : T.frontierQIndex.val = 9 ∨
        T.frontierQIndex.val = 10 ∨ T.frontierQIndex.val = 11 ∨
        T.frontierQIndex.val = 12 := by omega
    rcases hcases with h9 | h10 | h11 | h12
    · have hi : T.frontierQIndex = (9 : Fin 13) := Fin.ext h9
      have hqeq : directSourceQ T = 9#4 :=
        (directSourceQ_eq_ofNat_iff T 9).mpr hi
      have hrow := hqMain 9 hi
      change rowBit (directSourceRows C) 0 4 9 = true at hrow
      rw [hqeq, hrow]
      simp
    · have hi : T.frontierQIndex = (10 : Fin 13) := Fin.ext h10
      have hqeq : directSourceQ T = 10#4 :=
        (directSourceQ_eq_ofNat_iff T 10).mpr hi
      have hrow := hqMain 10 hi
      change rowBit (directSourceRows C) 0 4 10 = true at hrow
      rw [hqeq, hrow]
      simp
    · have hi : T.frontierQIndex = (11 : Fin 13) := Fin.ext h11
      have hqeq : directSourceQ T = 11#4 :=
        (directSourceQ_eq_ofNat_iff T 11).mpr hi
      have hrow := hqMain 11 hi
      change rowBit (directSourceRows C) 0 4 11 = true at hrow
      rw [hqeq, hrow]
      simp
    · have hi : T.frontierQIndex = (12 : Fin 13) := Fin.ext h12
      have hqeq : directSourceQ T = 12#4 :=
        (directSourceQ_eq_ofNat_iff T 12).mpr hi
      have hrow := hqMain 12 hi
      change rowBit (directSourceRows C) 0 4 12 = true at hrow
      rw [hqeq, hrow]
      simp
  · have hcases : T.frontierWIndex.val = 9 ∨
        T.frontierWIndex.val = 10 ∨ T.frontierWIndex.val = 11 ∨
        T.frontierWIndex.val = 12 := by omega
    rcases hcases with h9 | h10 | h11 | h12
    · have hi : T.frontierWIndex = (9 : Fin 13) := Fin.ext h9
      have hweq : directSourceW T = 9#4 :=
        (directSourceW_eq_ofNat_iff T 9).mpr hi
      have hrow := hwMain 9 hi
      change rowBit (directSourceRows C) 0 4 9 = true at hrow
      rw [hweq, hrow]
      simp
    · have hi : T.frontierWIndex = (10 : Fin 13) := Fin.ext h10
      have hweq : directSourceW T = 10#4 :=
        (directSourceW_eq_ofNat_iff T 10).mpr hi
      have hrow := hwMain 10 hi
      change rowBit (directSourceRows C) 0 4 10 = true at hrow
      rw [hweq, hrow]
      simp
    · have hi : T.frontierWIndex = (11 : Fin 13) := Fin.ext h11
      have hweq : directSourceW T = 11#4 :=
        (directSourceW_eq_ofNat_iff T 11).mpr hi
      have hrow := hwMain 11 hi
      change rowBit (directSourceRows C) 0 4 11 = true at hrow
      rw [hweq, hrow]
      simp
    · have hi : T.frontierWIndex = (12 : Fin 13) := Fin.ext h12
      have hweq : directSourceW T = 12#4 :=
        (directSourceW_eq_ofNat_iff T 12).mpr hi
      have hrow := hwMain 12 hi
      change rowBit (directSourceRows C) 0 4 12 = true at hrow
      rw [hweq, hrow]
      simp

/-- Two distinct canonical private-cap indices with true membership bits force
the generated four-bit lower-bound expression. -/
private theorem two_private_bits_force_two_le
    (bit : Fin 13 → Bool) (i j : Fin 13)
    (hi : (8 : Fin 13) < i) (hj : (8 : Fin 13) < j)
    (hij : i ≠ j) (hbi : bit i = true) (hbj : bit j = true) :
    ((2#4).ule
      ((bif bit 9 then 1#4 else 0#4) +
        (bif bit 10 then 1#4 else 0#4) +
        (bif bit 11 then 1#4 else 0#4) +
        (bif bit 12 then 1#4 else 0#4))) = true := by
  fin_cases i <;> fin_cases j <;> simp_all
  all_goals
    cases h9 : bit 9 <;> cases h10 : bit 10 <;>
      cases h11 : bit 11 <;> cases h12 : bit 12 <;> simp_all

/-- The retained first-apex row has at least two hits in the exact canonical
private-cap block.  This is generated assertion `h0162`. -/
theorem directSource_main_private_hits_ge_two
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
    ((2#4).ule
      ((bif rowBit (directSourceRows C) 0 4 9 then 1#4 else 0#4) +
        (bif rowBit (directSourceRows C) 0 4 10 then 1#4 else 0#4) +
        (bif rowBit (directSourceRows C) 0 4 11 then 1#4 else 0#4) +
        (bif rowBit (directSourceRows C) 0 4 12 then 1#4 else 0#4))) = true := by
  have hpointMem (x : ℝ²) (hx : x ∈ D.A) :
      ∃ i : Fin 13, P.point i = x := by
    rw [← P.point_image] at hx
    rcases Finset.mem_image.mp hx with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩
  rcases hpointMem first.retainedInterior₁
      (S.capInteriorByIndex_subset S.oppIndex1
        first.retainedInterior₁_mem_cap) with ⟨i, hiPoint⟩
  rcases hpointMem first.retainedInterior₂
      (S.capInteriorByIndex_subset S.oppIndex1
        first.retainedInterior₂_mem_cap) with ⟨j, hjPoint⟩
  have hi : (8 : Fin 13) < i :=
    (P.capInterior_mem_iff_index_gt_eight i).mp (by
      simpa only [hiPoint] using first.retainedInterior₁_mem_cap)
  have hj : (8 : Fin 13) < j :=
    (P.capInterior_mem_iff_index_gt_eight j).mp (by
      simpa only [hjPoint] using first.retainedInterior₂_mem_cap)
  have hij : i ≠ j := by
    intro h
    apply first.retainedInterior_ne
    calc
      first.retainedInterior₁ = P.point i := hiPoint.symm
      _ = P.point j := congrArg P.point h
      _ = first.retainedInterior₂ := hjPoint
  have hbi : rowBit (directSourceRows C) 0 4 i.val = true := by
    have hpack := rowBit_directSourceRows C (0 : Fin 3) (4 : Fin 13) i
    change rowBit (directSourceRows C) 0 4 i.val =
      directSourceRowMember C 0 4 i at hpack
    rw [hpack]
    have hmem : P.point i ∈ (T.main 4).support := by
      rw [T.main_firstApex_support, hiPoint]
      exact first.retainedInterior₁_mem_row
    simp [directSourceRowMember, hmem]
  have hbj : rowBit (directSourceRows C) 0 4 j.val = true := by
    have hpack := rowBit_directSourceRows C (0 : Fin 3) (4 : Fin 13) j
    change rowBit (directSourceRows C) 0 4 j.val =
      directSourceRowMember C 0 4 j at hpack
    rw [hpack]
    have hmem : P.point j ∈ (T.main 4).support := by
      rw [T.main_firstApex_support, hjPoint]
      exact first.retainedInterior₂_mem_row
    simp [directSourceRowMember, hmem]
  exact two_private_bits_force_two_le
    (fun k ↦ rowBit (directSourceRows C) 0 4 k.val)
    i j hi hj hij hbi hbj

/-- The double-deletion first-apex row has at least two hits in the exact
canonical private-cap block.  This is generated assertion `h0163`. -/
theorem directSource_firstRow_private_hits_ge_two
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
    ((2#4).ule
      ((bif firstRowBit (directSourceFirstRow T) 9 then 1#4 else 0#4) +
        (bif firstRowBit (directSourceFirstRow T) 10 then 1#4 else 0#4) +
        (bif firstRowBit (directSourceFirstRow T) 11 then 1#4 else 0#4) +
        (bif firstRowBit (directSourceFirstRow T) 12 then 1#4 else 0#4))) = true := by
  have hpointMem (x : ℝ²) (hx : x ∈ D.A) :
      ∃ i : Fin 13, P.point i = x := by
    rw [← P.point_image] at hx
    rcases Finset.mem_image.mp hx with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩
  rcases hpointMem first.doubleInterior₁
      (S.capInteriorByIndex_subset S.oppIndex1
        first.doubleInterior₁_mem_cap) with ⟨i, hiPoint⟩
  rcases hpointMem first.doubleInterior₂
      (S.capInteriorByIndex_subset S.oppIndex1
        first.doubleInterior₂_mem_cap) with ⟨j, hjPoint⟩
  have hi : (8 : Fin 13) < i :=
    (P.capInterior_mem_iff_index_gt_eight i).mp (by
      simpa only [hiPoint] using first.doubleInterior₁_mem_cap)
  have hj : (8 : Fin 13) < j :=
    (P.capInterior_mem_iff_index_gt_eight j).mp (by
      simpa only [hjPoint] using first.doubleInterior₂_mem_cap)
  have hij : i ≠ j := by
    intro h
    apply first.doubleInterior_ne
    calc
      first.doubleInterior₁ = P.point i := hiPoint.symm
      _ = P.point j := congrArg P.point h
      _ = first.doubleInterior₂ := hjPoint
  have hbi : firstRowBit (directSourceFirstRow T) i.val = true := by
    rw [firstRowBit_directSourceFirstRow]
    apply decide_eq_true_iff.mpr
    rw [T.firstApexDoubleRow_support, hiPoint]
    exact first.doubleInterior₁_mem_row
  have hbj : firstRowBit (directSourceFirstRow T) j.val = true := by
    rw [firstRowBit_directSourceFirstRow]
    apply decide_eq_true_iff.mpr
    rw [T.firstApexDoubleRow_support, hjPoint]
    exact first.doubleInterior₂_mem_row
  exact two_private_bits_force_two_le
    (fun k ↦ firstRowBit (directSourceFirstRow T) k.val)
    i j hi hj hij hbi hbj

/-- In the same-radius card-thirteen arm, the retained row and the selected
double-deletion row fill the complete six-point first-apex radius class. -/
theorem firstApex_source_rows_union_eq_class_of_sameRadius
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
    (hcard : D.A.card = 13) (hsame : first.doubleRadius = radius) :
    (T.main 4).support ∪ T.firstApexDoubleRow.support =
      SelectedClass D.A S.oppApex1 radius := by
  have hmainSub : (T.main 4).support ⊆
      SelectedClass D.A S.oppApex1 radius := by
    intro x hx
    have hxRow : x ∈ first.retainedRow.support := by
      simpa only [T.main_firstApex_support] using hx
    exact mem_selectedClass.mpr
      ⟨first.retainedRow.support_subset_A hxRow,
        (first.retainedRow.support_eq_radius x hxRow).trans
          first.retainedRow_radius⟩
  have hdoubleSub : T.firstApexDoubleRow.support ⊆
      SelectedClass D.A S.oppApex1 radius := by
    intro x hx
    have hxRow : x ∈ first.doubleRow.support := by
      simpa only [T.firstApexDoubleRow_support] using hx
    exact mem_selectedClass.mpr
      ⟨first.doubleRow.support_subset_A hxRow,
        (first.doubleRow.support_eq_radius x hxRow).trans
          (first.doubleRow_radius.trans hsame)⟩
  have hunionSub : (T.main 4).support ∪ T.firstApexDoubleRow.support ⊆
      SelectedClass D.A S.oppApex1 radius :=
    Finset.union_subset hmainSub hdoubleSub
  have hfacts := frontier_row_facts T
  let pair : Finset ℝ² := {F.pair.q, F.pair.w}
  have hpairCard : pair.card = 2 := by
    simp [pair, Finset.card_pair F.pair.q_ne_w]
  have hpairDisjoint : Disjoint pair T.firstApexDoubleRow.support := by
    rw [Finset.disjoint_left]
    intro x hxPair hxDouble
    simp only [pair, Finset.mem_insert, Finset.mem_singleton] at hxPair
    rcases hxPair with rfl | rfl
    · apply hfacts.2.2.1
      simpa only [T.frontierQ_point] using hxDouble
    · apply hfacts.2.2.2
      simpa only [T.frontierW_point] using hxDouble
  have hseedCard : (pair ∪ T.firstApexDoubleRow.support).card = 6 := by
    rw [Finset.card_union_of_disjoint hpairDisjoint, hpairCard,
      T.firstApexDoubleRow.support_card]
  have hseedSub : pair ∪ T.firstApexDoubleRow.support ⊆
      (T.main 4).support ∪ T.firstApexDoubleRow.support := by
    intro x hx
    rcases Finset.mem_union.mp hx with hxPair | hxDouble
    · apply Finset.mem_union_left
      simp only [pair, Finset.mem_insert, Finset.mem_singleton] at hxPair
      rcases hxPair with rfl | rfl
      · simpa only [T.frontierQ_point] using hfacts.1
      · simpa only [T.frontierW_point] using hfacts.2.1
    · exact Finset.mem_union_right _ hxDouble
  have hunionCardLower :
      6 ≤ ((T.main 4).support ∪ T.firstApexDoubleRow.support).card := by
    rw [← hseedCard]
    exact Finset.card_le_card hseedSub
  have hclassCard :
      (SelectedClass D.A S.oppApex1 radius).card = 6 :=
    firstApex_class_card_eq_six_of_sameRadius Q first hcard hsame
  apply Finset.eq_of_subset_of_card_le hunionSub
  rw [hclassCard]
  exact hunionCardLower

/-- The bit-vector sum used by `h0165` is merely the packed form of a
thirteen-element predicate with exactly six true entries. -/
private theorem thirteen_bif_sum_eq_six
    (p : Fin 13 → Prop) [DecidablePred p]
    (hsum : (∑ i : Fin 13, if p i then 1 else 0) = 6) :
    (((bif decide (p 0) then 1#4 else 0#4) +
      (bif decide (p 1) then 1#4 else 0#4) +
      (bif decide (p 2) then 1#4 else 0#4) +
      (bif decide (p 3) then 1#4 else 0#4) +
      (bif decide (p 4) then 1#4 else 0#4) +
      (bif decide (p 5) then 1#4 else 0#4) +
      (bif decide (p 6) then 1#4 else 0#4) +
      (bif decide (p 7) then 1#4 else 0#4) +
      (bif decide (p 8) then 1#4 else 0#4) +
      (bif decide (p 9) then 1#4 else 0#4) +
      (bif decide (p 10) then 1#4 else 0#4) +
      (bif decide (p 11) then 1#4 else 0#4) +
      (bif decide (p 12) then 1#4 else 0#4)) == 6#4) = true := by
  simp only [beq_iff_eq, Bool.cond_decide]
  have hone (i : Fin 13) :
      (if p i then 1#4 else 0#4) =
        BitVec.ofNat 4 (if p i then 1 else 0) := by
    by_cases hi : p i <;> simp [hi]
  rw [hone 0, hone 1, hone 2, hone 3, hone 4, hone 5, hone 6,
    hone 7, hone 8, hone 9, hone 10, hone 11, hone 12]
  simp only [BitVec.ofNat_add_ofNat]
  have hsum' := hsum
  simp only [Finset.sum_fin_eq_sum_range, Finset.sum_range_succ,
    Finset.sum_range_zero] at hsum'
  norm_num at hsum'
  have hsum'' :
      (((((((((((((if p 0 then 1 else 0) + if p 1 then 1 else 0) +
        (if p 2 then 1 else 0)) + (if p 3 then 1 else 0)) +
        (if p 4 then 1 else 0)) + (if p 5 then 1 else 0)) +
        (if p 6 then 1 else 0)) + (if p 7 then 1 else 0)) +
        (if p 8 then 1 else 0)) + (if p 9 then 1 else 0)) +
        (if p 10 then 1 else 0)) + (if p 11 then 1 else 0)) +
        (if p 12 then 1 else 0)) = 6 := by
    simpa using hsum'
  rw [hsum'']

/-- Uniform semantic reading of the generated union bit. -/
private theorem directSource_union_bit
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
    (C : CanonicalCoverFamilies T) (i : Fin 13) :
    (rowBit (directSourceRows C) 0 4 i.val ||
        firstRowBit (directSourceFirstRow T) i.val) =
      decide (P.point i ∈
        (T.main 4).support ∪ T.firstApexDoubleRow.support) := by
  have hrow := rowBit_directSourceRows C (0 : Fin 3) (4 : Fin 13) i
  change rowBit (directSourceRows C) 0 4 i.val =
    directSourceRowMember C 0 4 i at hrow
  have hfirst := firstRowBit_directSourceFirstRow T i
  change firstRowBit (directSourceFirstRow T) i.val =
    decide (P.point i ∈ T.firstApexDoubleRow.support) at hfirst
  rw [hrow, hfirst]
  simp only [directSourceRowMember, ↓reduceIte]
  by_cases hmain : P.point i ∈ (T.main 4).support <;>
    by_cases hdouble : P.point i ∈ T.firstApexDoubleRow.support <;>
    simp [hmain, hdouble]

private theorem five_bits_ule_one
    (a b c d e : Bool)
    (hab : ¬(a = true ∧ b = true))
    (hac : ¬(a = true ∧ c = true))
    (had : ¬(a = true ∧ d = true))
    (hae : ¬(a = true ∧ e = true))
    (hbc : ¬(b = true ∧ c = true))
    (hbd : ¬(b = true ∧ d = true))
    (hbe : ¬(b = true ∧ e = true))
    (hcd : ¬(c = true ∧ d = true))
    (hce : ¬(c = true ∧ e = true))
    (hde : ¬(d = true ∧ e = true)) :
    (((bif a then 1#4 else 0#4) + (bif b then 1#4 else 0#4) +
      (bif c then 1#4 else 0#4) + (bif d then 1#4 else 0#4) +
      (bif e then 1#4 else 0#4)).ule 1#4) = true := by
  cases a <;> cases b <;> cases c <;> cases d <;> cases e <;> simp_all

private theorem firstApexDoubleRow_inter_surplus_card_le_one
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
    (T.firstApexDoubleRow.support ∩ S.surplusCap).card ≤ 1 := by
  have hcenter :=
    _root_.Problem97.ATailKalmansonParentOrderScratch.oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
  have hambient :=
    S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 first.doubleRadius
  rw [← hcenter] at hambient
  have hsurplusAmbient :
      (SelectedClass D.A S.oppApex1 first.doubleRadius ∩
        S.surplusCap).card ≤ 1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppIndex1,
        SurplusCapPacket.rightAdjacentCapByIndex,
        SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]
        using hambient
  refine (Finset.card_le_card ?_).trans hsurplusAmbient
  intro x hx
  rcases Finset.mem_inter.mp hx with ⟨hxRow, hxCap⟩
  apply Finset.mem_inter.mpr
  refine ⟨?_, hxCap⟩
  have hxFirst : x ∈ first.doubleRow.support := by
    simpa only [T.firstApexDoubleRow_support] using hxRow
  exact mem_selectedClass.mpr
    ⟨first.doubleRow.support_subset_A hxFirst,
      (first.doubleRow.support_eq_radius x hxFirst).trans
        first.doubleRow_radius⟩

private theorem firstApexDoubleRow_inter_secondCap_card_le_one
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
    (T.firstApexDoubleRow.support ∩ S.oppCap2).card ≤ 1 := by
  have hcenter :=
    _root_.Problem97.ATailKalmansonParentOrderScratch.oppApex1_eq_oppositeVertexByIndex_oppIndex1 S
  have hambient :=
    S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
      D.convex S.oppIndex1 first.doubleRadius
  rw [← hcenter] at hambient
  have hsecondAmbient :
      (SelectedClass D.A S.oppApex1 first.doubleRadius ∩
        S.oppCap2).card ≤ 1 := by
    rcases hi : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.oppIndex1,
        SurplusCapPacket.leftAdjacentCapByIndex,
        SurplusCapPacket.capByIndex, SurplusCapPacket.oppCap2, hi]
        using hambient
  refine (Finset.card_le_card ?_).trans hsecondAmbient
  intro x hx
  rcases Finset.mem_inter.mp hx with ⟨hxRow, hxCap⟩
  apply Finset.mem_inter.mpr
  refine ⟨?_, hxCap⟩
  have hxFirst : x ∈ first.doubleRow.support := by
    simpa only [T.firstApexDoubleRow_support] using hxRow
  exact mem_selectedClass.mpr
    ⟨first.doubleRow.support_subset_A hxFirst,
      (first.doubleRow.support_eq_radius x hxFirst).trans
        first.doubleRow_radius⟩

private theorem firstRowBit_true_iff
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
    (T : CanonicalAsymmetricSemanticRowTable P star first) (i : Fin 13) :
    firstRowBit (directSourceFirstRow T) i.val = true ↔
      P.point i ∈ T.firstApexDoubleRow.support := by
  rw [firstRowBit_directSourceFirstRow]
  exact decide_eq_true_iff

private theorem firstRow_pair_not_both_of_cap_one_hit
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
    (cap : Finset ℝ²)
    (hone : (T.firstApexDoubleRow.support ∩ cap).card ≤ 1)
    (i j : Fin 13) (hij : i ≠ j)
    (hiCap : P.point i ∈ cap) (hjCap : P.point j ∈ cap) :
    ¬(firstRowBit (directSourceFirstRow T) i.val = true ∧
      firstRowBit (directSourceFirstRow T) j.val = true) := by
  rintro ⟨hiBit, hjBit⟩
  have hiRow := (firstRowBit_true_iff T i).mp hiBit
  have hjRow := (firstRowBit_true_iff T j).mp hjBit
  have hpointNe : P.point i ≠ P.point j := fun h ↦
    hij (P.point_injective h)
  have hpairSub : ({P.point i, P.point j} : Finset ℝ²) ⊆
      T.firstApexDoubleRow.support ∩ cap := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨hiRow, hiCap⟩
    · exact Finset.mem_inter.mpr ⟨hjRow, hjCap⟩
  have hcard := Finset.card_le_card hpairSub
  rw [Finset.card_pair hpointNe] at hcard
  omega

/-- Exact generated adjacent-cap one-hit assertions `h0153` and `h0154`. -/
theorem directSource_firstRow_adjacent_blocks_ule_one
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
    (((bif firstRowBit (directSourceFirstRow T) 4 then 1#4 else 0#4) +
      (bif firstRowBit (directSourceFirstRow T) 5 then 1#4 else 0#4) +
      (bif firstRowBit (directSourceFirstRow T) 6 then 1#4 else 0#4) +
      (bif firstRowBit (directSourceFirstRow T) 7 then 1#4 else 0#4) +
      (bif firstRowBit (directSourceFirstRow T) 8 then 1#4 else 0#4)).ule
        1#4) = true ∧
      (((bif firstRowBit (directSourceFirstRow T) 0 then 1#4 else 0#4) +
        (bif firstRowBit (directSourceFirstRow T) 1 then 1#4 else 0#4) +
        (bif firstRowBit (directSourceFirstRow T) 2 then 1#4 else 0#4) +
        (bif firstRowBit (directSourceFirstRow T) 3 then 1#4 else 0#4) +
        (bif firstRowBit (directSourceFirstRow T) 4 then 1#4 else 0#4)).ule
          1#4) = true := by
  have hsurplus := firstApexDoubleRow_inter_surplus_card_le_one T
  have hsecond := firstApexDoubleRow_inter_secondCap_card_le_one T
  have hmid (i j : Fin 13) (hij : i ≠ j)
      (hi : (4 : Fin 13) ≤ i ∧ i ≤ (8 : Fin 13))
      (hj : (4 : Fin 13) ≤ j ∧ j ≤ (8 : Fin 13)) :=
    firstRow_pair_not_both_of_cap_one_hit T S.surplusCap hsurplus i j hij
      ((P.surplusCap_mem_iff_middle_block i).mpr hi)
      ((P.surplusCap_mem_iff_middle_block j).mpr hj)
  have hini (i j : Fin 13) (hij : i ≠ j)
      (hi : i ≤ (4 : Fin 13)) (hj : j ≤ (4 : Fin 13)) :=
    firstRow_pair_not_both_of_cap_one_hit T S.oppCap2 hsecond i j hij
      ((P.secondOppCap_mem_iff_initial_block i).mpr hi)
      ((P.secondOppCap_mem_iff_initial_block j).mpr hj)
  constructor
  · exact five_bits_ule_one _ _ _ _ _
      (hmid 4 5 (by decide) (by decide) (by decide))
      (hmid 4 6 (by decide) (by decide) (by decide))
      (hmid 4 7 (by decide) (by decide) (by decide))
      (hmid 4 8 (by decide) (by decide) (by decide))
      (hmid 5 6 (by decide) (by decide) (by decide))
      (hmid 5 7 (by decide) (by decide) (by decide))
      (hmid 5 8 (by decide) (by decide) (by decide))
      (hmid 6 7 (by decide) (by decide) (by decide))
      (hmid 6 8 (by decide) (by decide) (by decide))
      (hmid 7 8 (by decide) (by decide) (by decide))
  · exact five_bits_ule_one _ _ _ _ _
      (hini 0 1 (by decide) (by decide) (by decide))
      (hini 0 2 (by decide) (by decide) (by decide))
      (hini 0 3 (by decide) (by decide) (by decide))
      (hini 0 4 (by decide) (by decide) (by decide))
      (hini 1 2 (by decide) (by decide) (by decide))
      (hini 1 3 (by decide) (by decide) (by decide))
      (hini 1 4 (by decide) (by decide) (by decide))
      (hini 2 3 (by decide) (by decide) (by decide))
      (hini 2 4 (by decide) (by decide) (by decide))
      (hini 3 4 (by decide) (by decide) (by decide))

/-- Exact generated union-cardinality assertion `h0165`. -/
theorem directSource_firstApex_union_card_eq_six
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
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T)
    (hcard : D.A.card = 13) (hsame : first.doubleRadius = radius) :
    ((((bif (rowBit (directSourceRows C) 0 4 0 ||
          firstRowBit (directSourceFirstRow T) 0) then 1#4 else 0#4) +
      (bif (rowBit (directSourceRows C) 0 4 1 ||
          firstRowBit (directSourceFirstRow T) 1) then 1#4 else 0#4) +
      (bif (rowBit (directSourceRows C) 0 4 2 ||
          firstRowBit (directSourceFirstRow T) 2) then 1#4 else 0#4) +
      (bif (rowBit (directSourceRows C) 0 4 3 ||
          firstRowBit (directSourceFirstRow T) 3) then 1#4 else 0#4) +
      (bif (rowBit (directSourceRows C) 0 4 4 ||
          firstRowBit (directSourceFirstRow T) 4) then 1#4 else 0#4) +
      (bif (rowBit (directSourceRows C) 0 4 5 ||
          firstRowBit (directSourceFirstRow T) 5) then 1#4 else 0#4) +
      (bif (rowBit (directSourceRows C) 0 4 6 ||
          firstRowBit (directSourceFirstRow T) 6) then 1#4 else 0#4) +
      (bif (rowBit (directSourceRows C) 0 4 7 ||
          firstRowBit (directSourceFirstRow T) 7) then 1#4 else 0#4) +
      (bif (rowBit (directSourceRows C) 0 4 8 ||
          firstRowBit (directSourceFirstRow T) 8) then 1#4 else 0#4) +
      (bif (rowBit (directSourceRows C) 0 4 9 ||
          firstRowBit (directSourceFirstRow T) 9) then 1#4 else 0#4) +
      (bif (rowBit (directSourceRows C) 0 4 10 ||
          firstRowBit (directSourceFirstRow T) 10) then 1#4 else 0#4) +
      (bif (rowBit (directSourceRows C) 0 4 11 ||
          firstRowBit (directSourceFirstRow T) 11) then 1#4 else 0#4) +
      (bif (rowBit (directSourceRows C) 0 4 12 ||
          firstRowBit (directSourceFirstRow T) 12) then 1#4 else 0#4)) == 6#4)) = true := by
  let U : Finset ℝ² :=
    (T.main 4).support ∪ T.firstApexDoubleRow.support
  have hUeq : U = SelectedClass D.A S.oppApex1 radius := by
    exact firstApex_source_rows_union_eq_class_of_sameRadius
      Q T hcard hsame
  let I : Finset (Fin 13) :=
    Finset.univ.filter fun i ↦ P.point i ∈ U
  have hIimage : I.image P.point = U := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      exact (Finset.mem_filter.mp hi).2
    · intro hx
      have hxA : x ∈ D.A := by
        rw [hUeq] at hx
        exact (mem_selectedClass.mp hx).1
      rw [← P.point_image] at hxA
      rcases Finset.mem_image.mp hxA with ⟨i, _hi, hpoint⟩
      exact Finset.mem_image.mpr
        ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hpoint ▸ hx⟩, hpoint⟩
  have hIcard : I.card = 6 := by
    calc
      I.card = (I.image P.point).card :=
        (Finset.card_image_of_injective I P.point_injective).symm
      _ = U.card := by rw [hIimage]
      _ = 6 := by
        rw [hUeq]
        exact firstApex_class_card_eq_six_of_sameRadius Q first hcard hsame
  have hsum :
      (∑ i : Fin 13, if P.point i ∈ U then 1 else 0) = 6 := by
    simpa [I, Finset.sum_boole] using hIcard
  have h0 := directSource_union_bit C (0 : Fin 13)
  have h1 := directSource_union_bit C (1 : Fin 13)
  have h2 := directSource_union_bit C (2 : Fin 13)
  have h3 := directSource_union_bit C (3 : Fin 13)
  have h4 := directSource_union_bit C (4 : Fin 13)
  have h5 := directSource_union_bit C (5 : Fin 13)
  have h6 := directSource_union_bit C (6 : Fin 13)
  have h7 := directSource_union_bit C (7 : Fin 13)
  have h8 := directSource_union_bit C (8 : Fin 13)
  have h9 := directSource_union_bit C (9 : Fin 13)
  have h10 := directSource_union_bit C (10 : Fin 13)
  have h11 := directSource_union_bit C (11 : Fin 13)
  have h12 := directSource_union_bit C (12 : Fin 13)
  change (rowBit (directSourceRows C) 0 4 0 ||
    firstRowBit (directSourceFirstRow T) 0) =
      decide (P.point 0 ∈ U) at h0
  change (rowBit (directSourceRows C) 0 4 1 ||
    firstRowBit (directSourceFirstRow T) 1) =
      decide (P.point 1 ∈ U) at h1
  change (rowBit (directSourceRows C) 0 4 2 ||
    firstRowBit (directSourceFirstRow T) 2) =
      decide (P.point 2 ∈ U) at h2
  change (rowBit (directSourceRows C) 0 4 3 ||
    firstRowBit (directSourceFirstRow T) 3) =
      decide (P.point 3 ∈ U) at h3
  change (rowBit (directSourceRows C) 0 4 4 ||
    firstRowBit (directSourceFirstRow T) 4) =
      decide (P.point 4 ∈ U) at h4
  change (rowBit (directSourceRows C) 0 4 5 ||
    firstRowBit (directSourceFirstRow T) 5) =
      decide (P.point 5 ∈ U) at h5
  change (rowBit (directSourceRows C) 0 4 6 ||
    firstRowBit (directSourceFirstRow T) 6) =
      decide (P.point 6 ∈ U) at h6
  change (rowBit (directSourceRows C) 0 4 7 ||
    firstRowBit (directSourceFirstRow T) 7) =
      decide (P.point 7 ∈ U) at h7
  change (rowBit (directSourceRows C) 0 4 8 ||
    firstRowBit (directSourceFirstRow T) 8) =
      decide (P.point 8 ∈ U) at h8
  change (rowBit (directSourceRows C) 0 4 9 ||
    firstRowBit (directSourceFirstRow T) 9) =
      decide (P.point 9 ∈ U) at h9
  change (rowBit (directSourceRows C) 0 4 10 ||
    firstRowBit (directSourceFirstRow T) 10) =
      decide (P.point 10 ∈ U) at h10
  change (rowBit (directSourceRows C) 0 4 11 ||
    firstRowBit (directSourceFirstRow T) 11) =
      decide (P.point 11 ∈ U) at h11
  change (rowBit (directSourceRows C) 0 4 12 ||
    firstRowBit (directSourceFirstRow T) 12) =
      decide (P.point 12 ∈ U) at h12
  rw [h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12]
  exact thirteen_bif_sum_eq_six (fun i ↦ P.point i ∈ U) hsum

/-- Every canonical strict first-opposite point is covered by one of the two
same-radius first-apex rows.  Instantiations at `9,10,11,12` are generated
assertions `h0166`–`h0169`. -/
theorem directSource_private_index_covered
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
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T)
    (hcard : D.A.card = 13) (hsame : first.doubleRadius = radius)
    (i : Fin 13) (hi : (8 : Fin 13) < i) :
    (rowBit (directSourceRows C) 0 4 i.val ||
      firstRowBit (directSourceFirstRow T) i.val) = true := by
  have hcap : P.point i ∈ S.capInteriorByIndex S.oppIndex1 :=
    (P.capInterior_mem_iff_index_gt_eight i).mpr hi
  have hclass : P.point i ∈ SelectedClass D.A S.oppApex1 radius := by
    have hinter :=
      firstApex_class_inter_capInterior_eq_capInterior_of_sameRadius
        Q first hcard hsame
    have : P.point i ∈
        SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
      rw [hinter]
      exact hcap
    exact (Finset.mem_inter.mp this).1
  have hunion := firstApex_source_rows_union_eq_class_of_sameRadius
    Q T hcard hsame
  have hmem : P.point i ∈
      (T.main 4).support ∪ T.firstApexDoubleRow.support := by
    rw [hunion]
    exact hclass
  rw [directSource_union_bit C i]
  exact decide_eq_true_iff.mpr hmem

/-- Exact generated forms of `h0166`–`h0169`. -/
theorem directSource_private_block_covered
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
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T)
    (hcard : D.A.card = 13) (hsame : first.doubleRadius = radius) :
    (rowBit (directSourceRows C) 0 4 9 ||
        firstRowBit (directSourceFirstRow T) 9) = true ∧
      (rowBit (directSourceRows C) 0 4 10 ||
        firstRowBit (directSourceFirstRow T) 10) = true ∧
      (rowBit (directSourceRows C) 0 4 11 ||
        firstRowBit (directSourceFirstRow T) 11) = true ∧
      (rowBit (directSourceRows C) 0 4 12 ||
        firstRowBit (directSourceFirstRow T) 12) = true := by
  have h9 := directSource_private_index_covered Q C hcard hsame
    (9 : Fin 13) (by decide)
  have h10 := directSource_private_index_covered Q C hcard hsame
    (10 : Fin 13) (by decide)
  have h11 := directSource_private_index_covered Q C hcard hsame
    (11 : Fin 13) (by decide)
  have h12 := directSource_private_index_covered Q C hcard hsame
    (12 : Fin 13) (by decide)
  change (rowBit (directSourceRows C) 0 4 9 ||
    firstRowBit (directSourceFirstRow T) 9) = true at h9
  change (rowBit (directSourceRows C) 0 4 10 ||
    firstRowBit (directSourceFirstRow T) 10) = true at h10
  change (rowBit (directSourceRows C) 0 4 11 ||
    firstRowBit (directSourceFirstRow T) 11) = true at h11
  change (rowBit (directSourceRows C) 0 4 12 ||
    firstRowBit (directSourceFirstRow T) 12) = true at h12
  exact ⟨h9, h10, h11, h12⟩

#print axioms rowBit_directSourceRows
#print axioms blockerAt_directSourceBlockers
#print axioms shellBit_directSourceShell
#print axioms firstRowBit_directSourceFirstRow
#print axioms directSourceQ_toNat
#print axioms directSourceW_toNat
#print axioms directSourceQ_eq_ofNat_iff
#print axioms directSourceW_eq_ofNat_iff
#print axioms directSource_frontier_or_not_firstRow
#print axioms directSource_frontier_strict_main_occurrence
#print axioms directSource_main_private_hits_ge_two
#print axioms directSource_firstRow_private_hits_ge_two
#print axioms firstApex_source_rows_union_eq_class_of_sameRadius
#print axioms directSource_firstApex_union_card_eq_six
#print axioms directSource_private_index_covered
#print axioms directSource_private_block_covered

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
