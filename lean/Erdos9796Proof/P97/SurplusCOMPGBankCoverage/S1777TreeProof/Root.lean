import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard05
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard06
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard10
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Shard12

namespace Problem97.S1777TreeProof

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def order : List Label := [.u, .Pw, .Pu, .Q1, .Q2, .s1, .s2, .s3]

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard00.certificate),
    (46, Shard01.certificate),
    (54, Shard02.certificate),
    (58, Shard03.certificate),
    (60, Shard04.certificate),
    (114, Shard05.certificate),
    (178, Shard06.certificate),
    (308, Shard07.certificate),
    (368, Shard08.certificate),
    (432, Shard09.certificate),
    (564, Shard10.certificate),
    (624, Shard11.certificate),
    (688, Shard12.certificate)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificate .s1 s1777Fixed s1777Target order [] certificate = true := by
  simp only [order, certificate, checkCompatibilityCertificate, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard00.checked, Shard01.checked, Shard02.checked, Shard03.checked, Shard04.checked, Shard05.checked, Shard06.checked, Shard07.checked, Shard08.checked, Shard09.checked, Shard10.checked, Shard11.checked, Shard12.checked, True.intro⟩

theorem forcesTarget (choice : Label → Nat)
    (hchoice : ∀ center ∈ order, choice center ∈ candidateDomain .s1 s1777Fixed center)
    (hseparation : ∀ center ∈ order, ∀ other ∈ order, center ≠ other →
      crossSeparationOKForMasks center (choice center) other (choice other) = true) :
    ∀ center ∈ order, choice center = s1777Target center := by
  exact (target_of_checkCompatibilityCertificate checked hchoice (by simp)
    (by simp) hseparation).1

theorem validFragmentForcesTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 777) :
    ∀ center ∈ order, shadow.centerMask center = s1777Target center := by
  apply validFragment_target_of_checkCompatibilityCertificate checked hvalid
  · intro center hcenter entry hentry
    simp [order, s1777Fixed] at hcenter hentry ⊢
    rcases hentry with hentry | hentry <;> subst entry <;>
      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide
  · intro entry hentry
    simp [s1777Fixed] at hentry
    rcases hentry with hentry | hentry <;> subst entry
    · exact hv
    · exact hw

theorem validFragmentMasksEqTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 777) :
    shadow.masks = [432, 201, 777, 534, 354, 92, 170, 83, 549, 390] := by
  have hfree := validFragmentForcesTarget hvalid hv hw
  have hcenter : ∀ center, shadow.centerMask center = s1777Target center := by
    intro center
    cases center with
    | v => exact hv
    | w => exact hw
    | u | s1 | s2 | s3 | Pw | Pu | Q1 | Q2 =>
        exact hfree _ (by simp [order])
  simpa [allLabels, s1777Target] using
    shadow_masks_eq_map_of_hasTenMasks
      (hasTenMasks_of_isValidPinnedFragment hvalid) hcenter

theorem memDepth2SubtreeResult_eqTarget {result : List Nat}
    (hresult : result ∈ depth2SubtreeResult .s1 777) :
    result = [432, 201, 777, 534, 354, 92, 170, 83, 549, 390] := by
  have hdata := mem_depth2SubtreeResult_iff.mp hresult
  apply validFragmentMasksEqTarget (shadow := { masks := result })
  · exact hdata.1
  · simpa [Shadow.centerMask, centerMaskOf, pinnedMaskOf, maskOfLabels,
      Label.bit, Label.index] using hdata.2.1
  · simpa [Shadow.centerMask, centerMaskOf] using hdata.2.2

end Problem97.S1777TreeProof
