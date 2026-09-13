import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard05
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard06
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Shard08

namespace Problem97.S1864TreeProof

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def order : List Label := [.u, .Q1, .Q2, .Pw, .Pu, .s3, .s2, .s1]

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard00.certificate),
    (46, Shard01.certificate),
    (54, Shard02.certificate),
    (58, Shard03.certificate),
    (60, Shard04.certificate),
    (114, Shard05.certificate),
    (178, Shard06.certificate),
    (284, Shard07.certificate),
    (540, Shard08.certificate)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1864Fixed s1864Targets order [] certificate = true := by
  simp only [order, certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard00.checked, Shard01.checked, Shard02.checked, Shard03.checked, Shard04.checked, Shard05.checked, Shard06.checked, Shard07.checked, Shard08.checked, True.intro⟩

theorem targetExists (choice : Label → Nat)
    (hchoice : ∀ center ∈ order, choice center ∈ candidateDomain .s1 s1864Fixed center)
    (hseparation : ∀ center ∈ order, ∀ other ∈ order, center ≠ other →
      crossSeparationOKForMasks center (choice center) other (choice other) = true) :
    ∃ target ∈ s1864Targets, ∀ center ∈ order, choice center = target center := by
  rcases target_of_checkCompatibilityCertificateForTargets checked hchoice (by simp)
      (by simp) hseparation with ⟨target, htarget, hfree, _⟩
  exact ⟨target, htarget, hfree⟩

theorem validFragmentTargetExists {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 864) :
    ∃ target ∈ s1864Targets,
      ∀ center ∈ order, shadow.centerMask center = target center := by
  apply validFragment_target_of_checkCompatibilityCertificateForTargets checked hvalid
  · intro center hcenter entry hentry
    simp [order, s1864Fixed] at hcenter hentry ⊢
    rcases hentry with hentry | hentry <;> subst entry <;>
      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide
  · intro entry hentry
    simp [s1864Fixed] at hentry
    rcases hentry with hentry | hentry <;> subst entry
    · exact hv
    · exact hw

private theorem validFragmentMasksEqTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 864)
    {target : Label → Nat}
    (htargetV : target .v = 201)
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
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 864) :
    shadow.masks ∈ [[114, 201, 864, 531, 680, 78, 390, 281, 660, 300], [178, 201, 864, 531, 106, 652, 390, 281, 596, 300], [284, 201, 864, 688, 102, 525, 170, 323, 531, 390], [284, 201, 864, 688, 291, 525, 170, 101, 531, 390], [284, 201, 864, 294, 553, 660, 170, 113, 582, 275], [284, 201, 864, 294, 553, 660, 170, 113, 582, 402], [284, 201, 864, 688, 291, 525, 170, 101, 594, 390], [284, 201, 864, 402, 680, 86, 43, 593, 646, 293]] := by
  rcases validFragmentTargetExists hvalid hv hw with ⟨target, htarget, hfree⟩
  simp only [s1864Targets, List.mem_cons, List.not_mem_nil, or_false] at htarget
  simp only [List.mem_cons, List.not_mem_nil, or_false]
  rcases htarget with htarget0 | htarget1 | htarget2 | htarget3 | htarget4 | htarget5 | htarget6 | htarget7
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inl (by simpa [allLabels, s1864TargetA] using hmasks)
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inl (by simpa [allLabels, s1864TargetB] using hmasks))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1864TargetD] using hmasks)))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1864TargetC] using hmasks))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1864TargetE] using hmasks)))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1864TargetF] using hmasks))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1864TargetH] using hmasks)))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (by simpa [allLabels, s1864TargetG] using hmasks)))))))

theorem memDepth2SubtreeResult_memTargets {result : List Nat}
    (hresult : result ∈ depth2SubtreeResult .s1 864) :
    result ∈ [[114, 201, 864, 531, 680, 78, 390, 281, 660, 300], [178, 201, 864, 531, 106, 652, 390, 281, 596, 300], [284, 201, 864, 688, 102, 525, 170, 323, 531, 390], [284, 201, 864, 688, 291, 525, 170, 101, 531, 390], [284, 201, 864, 294, 553, 660, 170, 113, 582, 275], [284, 201, 864, 294, 553, 660, 170, 113, 582, 402], [284, 201, 864, 688, 291, 525, 170, 101, 594, 390], [284, 201, 864, 402, 680, 86, 43, 593, 646, 293]] := by
  have hdata := mem_depth2SubtreeResult_iff.mp hresult
  apply validFragmentMasksMemTargets (shadow := { masks := result })
  · exact hdata.1
  · simpa [Shadow.centerMask, centerMaskOf, pinnedMaskOf, maskOfLabels,
      Label.bit, Label.index] using hdata.2.1
  · simpa [Shadow.centerMask, centerMaskOf] using hdata.2.2

end Problem97.S1864TreeProof
