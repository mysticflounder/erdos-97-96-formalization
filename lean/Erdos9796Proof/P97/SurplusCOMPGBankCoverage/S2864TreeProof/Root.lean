import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard05
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard06
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Shard08

namespace Problem97.S2864TreeProof

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def order : List Label := [.u, .Q1, .Q2, .Pw, .Pu, .s1, .s3, .s2]

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard00.certificate),
    (46, Shard01.certificate),
    (54, Shard02.certificate),
    (58, Shard03.certificate),
    (60, Shard04.certificate),
    (106, Shard05.certificate),
    (170, Shard06.certificate),
    (284, Shard07.certificate),
    (540, Shard08.certificate)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2864Fixed s2864Targets order [] certificate = true := by
  simp only [order, certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard00.checked, Shard01.checked, Shard02.checked, Shard03.checked, Shard04.checked, Shard05.checked, Shard06.checked, Shard07.checked, Shard08.checked, True.intro⟩

theorem targetExists (choice : Label → Nat)
    (hchoice : ∀ center ∈ order, choice center ∈ candidateDomain .s2 s2864Fixed center)
    (hseparation : ∀ center ∈ order, ∀ other ∈ order, center ≠ other →
      crossSeparationOKForMasks center (choice center) other (choice other) = true) :
    ∃ target ∈ s2864Targets, ∀ center ∈ order, choice center = target center := by
  rcases target_of_checkCompatibilityCertificateForTargets checked hchoice (by simp)
      (by simp) hseparation with ⟨target, htarget, hfree, _⟩
  exact ⟨target, htarget, hfree⟩

theorem validFragmentTargetExists {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s2 shadow = true)
    (hv : shadow.centerMask .v = 209)
    (hw : shadow.centerMask .w = 864) :
    ∃ target ∈ s2864Targets,
      ∀ center ∈ order, shadow.centerMask center = target center := by
  apply validFragment_target_of_checkCompatibilityCertificateForTargets checked hvalid
  · intro center hcenter entry hentry
    simp [order, s2864Fixed] at hcenter hentry ⊢
    rcases hentry with hentry | hentry <;> subst entry <;>
      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide
  · intro entry hentry
    simp [s2864Fixed] at hentry
    rcases hentry with hentry | hentry <;> subst entry
    · exact hv
    · exact hw

private theorem validFragmentMasksEqTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s2 shadow = true)
    (hv : shadow.centerMask .v = 209)
    (hw : shadow.centerMask .w = 864)
    {target : Label → Nat}
    (htargetV : target .v = 209)
    (htargetW : target .w = 864)
    (hfree : ∀ center ∈ order, shadow.centerMask center = target center) :
    shadow.masks = allLabels.map target := by
  have hcenter : ∀ center, shadow.centerMask center = target center := by
    intro center
    cases center with
    | v => exact hv.trans htargetV.symm
    | w => exact hw.trans htargetW.symm
    | u | s1 | s2 | s3 | Pw | Pu | Q1 | Q2 =>
        exact hfree _ (by simp [order])
  exact shadow_masks_eq_map_of_hasTenMasks
    (hasTenMasks_of_isValidPinnedFragment hvalid) hcenter

theorem validFragmentMasksMemTargets {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s2 shadow = true)
    (hv : shadow.centerMask .v = 209)
    (hw : shadow.centerMask .w = 864) :
    shadow.masks ∈ [[284, 209, 864, 102, 680, 533, 178, 75, 646, 297], [284, 209, 864, 291, 172, 533, 178, 105, 582, 394], [284, 209, 864, 291, 680, 533, 178, 105, 582, 394], [284, 209, 864, 294, 680, 533, 178, 105, 582, 267], [284, 209, 864, 294, 680, 533, 178, 105, 582, 394], [284, 209, 864, 294, 680, 533, 178, 105, 646, 267]] := by
  rcases validFragmentTargetExists hvalid hv hw with ⟨target, htarget, hfree⟩
  simp only [s2864Targets, List.mem_cons, List.not_mem_nil, or_false] at htarget
  simp only [List.mem_cons, List.not_mem_nil, or_false]
  rcases htarget with htarget0 | htarget1 | htarget2 | htarget3 | htarget4 | htarget5
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inl (by simpa [allLabels, s2864TargetC] using hmasks)
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inl (by simpa [allLabels, s2864TargetA] using hmasks))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2864TargetB] using hmasks)))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2864TargetD] using hmasks))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2864TargetE] using hmasks)))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (by simpa [allLabels, s2864TargetF] using hmasks)))))

theorem memDepth2SubtreeResult_memTargets {result : List Nat}
    (hresult : result ∈ depth2SubtreeResult .s2 864) :
    result ∈ [[284, 209, 864, 102, 680, 533, 178, 75, 646, 297], [284, 209, 864, 291, 172, 533, 178, 105, 582, 394], [284, 209, 864, 291, 680, 533, 178, 105, 582, 394], [284, 209, 864, 294, 680, 533, 178, 105, 582, 267], [284, 209, 864, 294, 680, 533, 178, 105, 582, 394], [284, 209, 864, 294, 680, 533, 178, 105, 646, 267]] := by
  have hdata := mem_depth2SubtreeResult_iff.mp hresult
  apply validFragmentMasksMemTargets (shadow := { masks := result })
  · exact hdata.1
  · simpa [Shadow.centerMask, centerMaskOf, pinnedMaskOf, maskOfLabels,
      Label.bit, Label.index] using hdata.2.1
  · simpa [Shadow.centerMask, centerMaskOf] using hdata.2.2

end Problem97.S2864TreeProof
