/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CanonicalCard13Reachability
import BooleanPacking

/-!
# Exact packing for the card-13 aggregate connectivity auxiliaries

The source has three row families, two reachability directions, thirteen
stages, and thirteen points.  This module packs those `3 * 2 * 13 * 13 = 1014`
Boolean auxiliaries in family/direction/stage/point order.  The packed values
are definitions of the three structured reachability packets; they are not
independent hypotheses.
-/

namespace Problem97
namespace ExactFiveCard13DistinctRadiusSourceIngressScratch

open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
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

/-- The exact 1,014-bit layout of the three bounded-connectivity tables. -/
abbrev ConnectivityBits := BitVec 1014

/-- Read one source connectivity auxiliary.  The numerical indices agree with
`surface.py`: family `0/1/2 = m/g0/g1`, direction `0/1 = forward/backward`. -/
abbrev connectivityBit (bits : ConnectivityBits)
    (family direction stage point : Nat) : Bool :=
  bits.getLsbD (338 * family + 169 * direction + 13 * stage + point)

/-- Fin-indexed view used while proving the generated natural-index facts. -/
abbrev connectivityFinBit (bits : ConnectivityBits)
    (family : Fin 3) (direction : Fin 2) (stage point : Fin 13) : Bool :=
  connectivityBit bits family.val direction.val stage.val point.val

/-- Pack arbitrary connectivity tables in the source's exact layout. -/
def packThreeConnectivityTables
    (table : Fin 3 → Fin 2 → Fin 13 → Label → Bool) : ConnectivityBits :=
  BitVec.ofFnLE fun bit ↦
    let family : Fin 3 := ⟨bit.val / 338, by omega⟩
    let withinFamily := bit.val % 338
    let direction : Fin 2 := ⟨withinFamily / 169, by omega⟩
    let withinDirection := withinFamily % 169
    let stage : Fin 13 := ⟨withinDirection / 13, by omega⟩
    let point : Label := ⟨withinDirection % 13, by omega⟩
    table family direction stage point

/-- `connectivityBit` recovers the table entry at the source indices. -/
@[simp] theorem connectivityBit_packThreeConnectivityTables
    (table : Fin 3 → Fin 2 → Fin 13 → Label → Bool)
    (family : Fin 3) (direction : Fin 2) (stage point : Fin 13) :
    connectivityBit (packThreeConnectivityTables table)
        family.val direction.val stage.val point.val =
      table family direction stage point := by
  unfold connectivityBit
  rw [packThreeConnectivityTables, BitVec.getLsbD_ofFnLE]
  have hpacked :
      338 * family.val + 169 * direction.val + 13 * stage.val + point.val <
        1014 := by
    omega
  rw [dif_pos hpacked]
  have hfamily :
      (338 * family.val + 169 * direction.val + 13 * stage.val + point.val) /
          338 = family.val := by
    omega
  have hwithinFamily :
      (338 * family.val + 169 * direction.val + 13 * stage.val + point.val) %
          338 = 169 * direction.val + 13 * stage.val + point.val := by
    omega
  have hdirection :
      (169 * direction.val + 13 * stage.val + point.val) / 169 =
        direction.val := by
    omega
  have hwithinDirection :
      (169 * direction.val + 13 * stage.val + point.val) % 169 =
        13 * stage.val + point.val := by
    omega
  have hstage : (13 * stage.val + point.val) / 13 = stage.val := by
    omega
  have hpoint : (13 * stage.val + point.val) % 13 = point.val := by
    omega
  simp only [hfamily, hwithinFamily, hdirection, hwithinDirection, hstage,
    hpoint]

/-- Read the structured packet table without changing its three-field semantic
boundary. -/
def canonicalConnectivityTable
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
    {C : CanonicalCoverFamilies T}
    (packets : CanonicalThreeFamilyReachabilityPacket C)
    (family : Fin 3) (direction : Fin 2) (stage point : Fin 13) : Bool :=
  if _hmain : family = 0 then
    if _hforward : direction = 0 then
      packets.main.forward stage point
    else
      packets.main.backward stage point
  else if _hleft : family = 1 then
    if _hforward : direction = 0 then
      packets.coverLeft.forward stage point
    else
      packets.coverLeft.backward stage point
  else if _hforward : direction = 0 then
    packets.coverRight.forward stage point
  else
    packets.coverRight.backward stage point

/-- Pack the three structured semantic packets into the source bit layout. -/
def packCanonicalConnectivity
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
    {C : CanonicalCoverFamilies T}
    (packets : CanonicalThreeFamilyReachabilityPacket C) : ConnectivityBits :=
  packThreeConnectivityTables (canonicalConnectivityTable packets)

@[simp] theorem connectivityBit_packCanonicalConnectivity
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
    {C : CanonicalCoverFamilies T}
    (packets : CanonicalThreeFamilyReachabilityPacket C)
    (family : Fin 3) (direction : Fin 2) (stage point : Fin 13) :
    connectivityBit (packCanonicalConnectivity packets)
        family.val direction.val stage.val point.val =
      canonicalConnectivityTable packets family direction stage point := by
  exact connectivityBit_packThreeConnectivityTables
    (canonicalConnectivityTable packets) family direction stage point

/-- Natural-index form used by the generated source statements. -/
@[simp] theorem connectivityBit_packCanonicalConnectivity_nat
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
    {C : CanonicalCoverFamilies T}
    (packets : CanonicalThreeFamilyReachabilityPacket C)
    (family direction stage point : Nat)
    (hfamily : family < 3) (hdirection : direction < 2)
    (hstage : stage < 13) (hpoint : point < 13) :
    connectivityBit (packCanonicalConnectivity packets)
        family direction stage point =
      canonicalConnectivityTable packets
        ⟨family, hfamily⟩ ⟨direction, hdirection⟩
        ⟨stage, hstage⟩ ⟨point, hpoint⟩ := by
  exact connectivityBit_packCanonicalConnectivity packets
    ⟨family, hfamily⟩ ⟨direction, hdirection⟩
    ⟨stage, hstage⟩ ⟨point, hpoint⟩

/-- The exact forward right-hand side emitted by `surface.py`.  `List.any`
unfolds to the source's ordered thirteen disjuncts. -/
def sourceForwardRhs (edge : Fin 3 → Label → Label → Bool)
    (bits : ConnectivityBits) (family : Fin 3) (step : ProperStage)
    (point : Label) : Bool :=
  connectivityFinBit bits family 0 ⟨step.val, by omega⟩ point ||
    (List.finRange 13).any fun source =>
      connectivityFinBit bits family 0 ⟨step.val, by omega⟩ source &&
        edge family source point

/-- The exact backward right-hand side emitted by `surface.py`. -/
def sourceBackwardRhs (edge : Fin 3 → Label → Label → Bool)
    (bits : ConnectivityBits) (family : Fin 3) (step : ProperStage)
    (point : Label) : Bool :=
  connectivityFinBit bits family 1 ⟨step.val, by omega⟩ point ||
    (List.finRange 13).any fun target =>
      edge family point target &&
        connectivityFinBit bits family 1 ⟨step.val, by omega⟩ target

private theorem family_eq_zero_or_one_or_two (family : Fin 3) :
    family = 0 ∨ family = 1 ∨ family = 2 := by
  fin_cases family <;> simp

private theorem direction_eq_zero_or_one (direction : Fin 2) :
    direction = 0 ∨ direction = 1 := by
  fin_cases direction <;> simp

/-- Exact Boolean-equality form of each source initial assertion. -/
theorem packedConnectivity_zero_sourceAssertion
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
    {C : CanonicalCoverFamilies T}
    (packets : CanonicalThreeFamilyReachabilityPacket C)
    (family : Fin 3) (direction : Fin 2) (point : Label) :
    ((connectivityFinBit (packCanonicalConnectivity packets)
        family direction 0 point == decide (point = 0))) = true := by
  have heq : connectivityFinBit (packCanonicalConnectivity packets)
      family direction 0 point = decide (point = 0) := by
    rcases family_eq_zero_or_one_or_two family with hmain | hleft | hright
    · subst family
      rcases direction_eq_zero_or_one direction with hforward | hbackward
      · subst direction
        simpa [canonicalConnectivityTable] using packets.main.forward_zero point
      · subst direction
        simpa [canonicalConnectivityTable] using packets.main.backward_zero point
    · subst family
      rcases direction_eq_zero_or_one direction with hforward | hbackward
      · subst direction
        simpa [canonicalConnectivityTable] using packets.coverLeft.forward_zero point
      · subst direction
        simpa [canonicalConnectivityTable] using packets.coverLeft.backward_zero point
    · subst family
      rcases direction_eq_zero_or_one direction with hforward | hbackward
      · subst direction
        simpa [canonicalConnectivityTable] using packets.coverRight.forward_zero point
      · subst direction
        simpa [canonicalConnectivityTable] using packets.coverRight.backward_zero point
  simpa only [Bool.beq_to_eq] using heq

/-- Exact Boolean-equality form of each source transition assertion. -/
theorem packedConnectivity_succ_sourceAssertion
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
    {C : CanonicalCoverFamilies T}
    (packets : CanonicalThreeFamilyReachabilityPacket C)
    (family : Fin 3) (direction : Fin 2) (step : ProperStage)
    (point : Label) :
    ((connectivityFinBit (packCanonicalConnectivity packets) family
        direction ⟨step.val + 1, by omega⟩ point ==
      if direction = 0 then
        sourceForwardRhs (directSourceRowMember C)
          (packCanonicalConnectivity packets) family step point
      else
        sourceBackwardRhs (directSourceRowMember C)
          (packCanonicalConnectivity packets) family step point)) = true := by
  have heq : connectivityFinBit (packCanonicalConnectivity packets) family
      direction ⟨step.val + 1, by omega⟩ point =
        if direction = 0 then
          sourceForwardRhs (directSourceRowMember C)
            (packCanonicalConnectivity packets) family step point
        else
          sourceBackwardRhs (directSourceRowMember C)
            (packCanonicalConnectivity packets) family step point := by
    rcases family_eq_zero_or_one_or_two family with hmain | hleft | hright
    · subst family
      rcases direction_eq_zero_or_one direction with hforward | hbackward
      · subst direction
        simpa [canonicalConnectivityTable, sourceForwardRhs] using
          packets.main.forward_succ step point
      · subst direction
        simpa [canonicalConnectivityTable, sourceBackwardRhs] using
          packets.main.backward_succ step point
    · subst family
      rcases direction_eq_zero_or_one direction with hforward | hbackward
      · subst direction
        simpa [canonicalConnectivityTable, sourceForwardRhs] using
          packets.coverLeft.forward_succ step point
      · subst direction
        simpa [canonicalConnectivityTable, sourceBackwardRhs] using
          packets.coverLeft.backward_succ step point
    · subst family
      rcases direction_eq_zero_or_one direction with hforward | hbackward
      · subst direction
        simpa [canonicalConnectivityTable, sourceForwardRhs] using
          packets.coverRight.forward_succ step point
      · subst direction
        simpa [canonicalConnectivityTable, sourceBackwardRhs] using
          packets.coverRight.backward_succ step point
  simpa only [Bool.beq_to_eq] using heq

/-- Exact unit-literal form of each source terminal assertion. -/
theorem packedConnectivity_terminal_sourceAssertion
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
    {C : CanonicalCoverFamilies T}
    (packets : CanonicalThreeFamilyReachabilityPacket C)
    (family : Fin 3) (direction : Fin 2) (point : Label) :
    connectivityFinBit (packCanonicalConnectivity packets)
        family direction 12 point = true := by
  rcases family_eq_zero_or_one_or_two family with hmain | hleft | hright
  · subst family
    rcases direction_eq_zero_or_one direction with hforward | hbackward
    · subst direction
      simpa [canonicalConnectivityTable] using packets.main.forward_terminal point
    · subst direction
      simpa [canonicalConnectivityTable] using packets.main.backward_terminal point
  · subst family
    rcases direction_eq_zero_or_one direction with hforward | hbackward
    · subst direction
      simpa [canonicalConnectivityTable] using
        packets.coverLeft.forward_terminal point
    · subst direction
      simpa [canonicalConnectivityTable] using
        packets.coverLeft.backward_terminal point
  · subst family
    rcases direction_eq_zero_or_one direction with hforward | hbackward
    · subst direction
      simpa [canonicalConnectivityTable] using
        packets.coverRight.forward_terminal point
    · subst direction
      simpa [canonicalConnectivityTable] using
        packets.coverRight.backward_terminal point

#print axioms connectivityBit_packThreeConnectivityTables
#print axioms connectivityBit_packCanonicalConnectivity
#print axioms connectivityBit_packCanonicalConnectivity_nat
#print axioms packedConnectivity_zero_sourceAssertion
#print axioms packedConnectivity_succ_sourceAssertion
#print axioms packedConnectivity_terminal_sourceAssertion

end

end ExactFiveCard13DistinctRadiusSourceIngressScratch
end Problem97
