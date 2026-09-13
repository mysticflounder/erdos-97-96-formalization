import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard05
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard06
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard10
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Shard12

namespace Problem97.S3801TreeProof

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def order : List Label := [.u, .Q1, .Pu, .Q2, .Pw, .s3, .s2, .s1]

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard00.certificate),
    (46, Shard01.certificate),
    (54, Shard02.certificate),
    (58, Shard03.certificate),
    (60, Shard04.certificate),
    (90, Shard05.certificate),
    (154, Shard06.certificate),
    (284, Shard07.certificate),
    (344, Shard08.certificate),
    (408, Shard09.certificate),
    (540, Shard10.certificate),
    (600, Shard11.certificate),
    (664, Shard12.certificate)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificate .s3 s3801Fixed s3801Target order [] certificate = true := by
  simp only [order, certificate, checkCompatibilityCertificate, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard00.checked, Shard01.checked, Shard02.checked, Shard03.checked, Shard04.checked, Shard05.checked, Shard06.checked, Shard07.checked, Shard08.checked, Shard09.checked, Shard10.checked, Shard11.checked, Shard12.checked, True.intro⟩

theorem forcesTarget (choice : Label → Nat)
    (hchoice : ∀ center ∈ order, choice center ∈ candidateDomain .s3 s3801Fixed center)
    (hseparation : ∀ center ∈ order, ∀ other ∈ order, center ≠ other →
      crossSeparationOKForMasks center (choice center) other (choice other) = true) :
    ∀ center ∈ order, choice center = s3801Target center := by
  exact (target_of_checkCompatibilityCertificate checked hchoice (by simp)
    (by simp) hseparation).1

theorem validFragmentForcesTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s3 shadow = true)
    (hv : shadow.centerMask .v = 225)
    (hw : shadow.centerMask .w = 801) :
    ∀ center ∈ order, shadow.centerMask center = s3801Target center := by
  apply validFragment_target_of_checkCompatibilityCertificate checked hvalid
  · intro center hcenter entry hentry
    simp [order, s3801Fixed] at hcenter hentry ⊢
    rcases hentry with hentry | hentry <;> subst entry <;>
      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide
  · intro entry hentry
    simp [s3801Fixed] at hentry
    rcases hentry with hentry | hentry <;> subst entry
    · exact hv
    · exact hw

theorem validFragmentMasksEqTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s3 shadow = true)
    (hv : shadow.centerMask .v = 225)
    (hw : shadow.centerMask .w = 801) :
    shadow.masks = [408, 225, 801, 562, 652, 86, 390, 75, 533, 300] := by
  have hfree := validFragmentForcesTarget hvalid hv hw
  have hcenter : ∀ center, shadow.centerMask center = s3801Target center := by
    intro center
    cases center with
    | v => exact hv
    | w => exact hw
    | u | s1 | s2 | s3 | Pw | Pu | Q1 | Q2 =>
        exact hfree _ (by simp [order])
  simpa [allLabels, s3801Target] using
    shadow_masks_eq_map_of_hasTenMasks
      (hasTenMasks_of_isValidPinnedFragment hvalid) hcenter

theorem memDepth2SubtreeResult_eqTarget {result : List Nat}
    (hresult : result ∈ depth2SubtreeResult .s3 801) :
    result = [408, 225, 801, 562, 652, 86, 390, 75, 533, 300] := by
  have hdata := mem_depth2SubtreeResult_iff.mp hresult
  apply validFragmentMasksEqTarget (shadow := { masks := result })
  · exact hdata.1
  · simpa [Shadow.centerMask, centerMaskOf, pinnedMaskOf, maskOfLabels,
      Label.bit, Label.index] using hdata.2.1
  · simpa [Shadow.centerMask, centerMaskOf] using hdata.2.2

end Problem97.S3801TreeProof
