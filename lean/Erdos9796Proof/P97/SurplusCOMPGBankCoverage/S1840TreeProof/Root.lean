import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard05
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard06
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard10
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1840TreeProof.Shard12

namespace Problem97.S1840TreeProof

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def order : List Label := [.u, .Q1, .Q2, .Pw, .Pu, .s2, .s3, .s1]

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
    checkCompatibilityCertificateForTargets .s1 s1840Fixed s1840Targets order [] certificate = true := by
  simp only [order, certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard00.checked, Shard01.checked, Shard02.checked, Shard03.checked, Shard04.checked, Shard05.checked, Shard06.checked, Shard07.checked, Shard08.checked, Shard09.checked, Shard10.checked, Shard11.checked, Shard12.checked, True.intro⟩

theorem targetExists (choice : Label → Nat)
    (hchoice : ∀ center ∈ order, choice center ∈ candidateDomain .s1 s1840Fixed center)
    (hseparation : ∀ center ∈ order, ∀ other ∈ order, center ≠ other →
      crossSeparationOKForMasks center (choice center) other (choice other) = true) :
    ∃ target ∈ s1840Targets, ∀ center ∈ order, choice center = target center := by
  rcases target_of_checkCompatibilityCertificateForTargets checked hchoice (by simp)
      (by simp) hseparation with ⟨target, htarget, hfree, _⟩
  exact ⟨target, htarget, hfree⟩

theorem validFragmentTargetExists {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 840) :
    ∃ target ∈ s1840Targets,
      ∀ center ∈ order, shadow.centerMask center = target center := by
  apply validFragment_target_of_checkCompatibilityCertificateForTargets checked hvalid
  · intro center hcenter entry hentry
    simp [order, s1840Fixed] at hcenter hentry ⊢
    rcases hentry with hentry | hentry <;> subst entry <;>
      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide
  · intro entry hentry
    simp [s1840Fixed] at hentry
    rcases hentry with hentry | hentry <;> subst entry
    · exact hv
    · exact hw

private theorem validFragmentMasksEqTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 840)
    {target : Label → Nat}
    (htargetV : target .v = 201)
    (htargetW : target .w = 840)
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
    (hw : shadow.centerMask .w = 840) :
    shadow.masks ∈ [[368, 201, 840, 275, 170, 86, 660, 45, 547, 390], [368, 201, 840, 660, 294, 29, 142, 581, 674, 275], [368, 201, 840, 278, 676, 29, 142, 581, 658, 291], [432, 201, 840, 86, 43, 156, 390, 609, 531, 300], [432, 201, 840, 275, 45, 86, 156, 593, 646, 298], [432, 201, 840, 275, 45, 86, 156, 609, 646, 298], [432, 201, 840, 86, 291, 29, 170, 549, 531, 390], [432, 201, 840, 86, 291, 29, 170, 609, 531, 390], [432, 201, 840, 86, 291, 29, 172, 609, 531, 390], [432, 201, 840, 86, 291, 533, 154, 45, 610, 390], [688, 201, 840, 533, 43, 156, 418, 337, 582, 300]] := by
  rcases validFragmentTargetExists hvalid hv hw with ⟨target, htarget, hfree⟩
  simp only [s1840Targets, List.mem_cons, List.not_mem_nil, or_false] at htarget
  simp only [List.mem_cons, List.not_mem_nil, or_false]
  rcases htarget with htarget0 | htarget1 | htarget2 | htarget3 | htarget4 | htarget5 | htarget6 | htarget7 | htarget8 | htarget9 | htarget10
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inl (by simpa [allLabels, s1840TargetA] using hmasks)
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inl (by simpa [allLabels, s1840TargetB] using hmasks))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1840TargetC] using hmasks)))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1840TargetD] using hmasks))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1840TargetE] using hmasks)))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1840TargetF] using hmasks))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1840TargetG] using hmasks)))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1840TargetH] using hmasks))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1840TargetI] using hmasks)))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1840TargetJ] using hmasks))))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (by simpa [allLabels, s1840TargetK] using hmasks))))))))))

theorem memDepth2SubtreeResult_memTargets {result : List Nat}
    (hresult : result ∈ depth2SubtreeResult .s1 840) :
    result ∈ [[368, 201, 840, 275, 170, 86, 660, 45, 547, 390], [368, 201, 840, 660, 294, 29, 142, 581, 674, 275], [368, 201, 840, 278, 676, 29, 142, 581, 658, 291], [432, 201, 840, 86, 43, 156, 390, 609, 531, 300], [432, 201, 840, 275, 45, 86, 156, 593, 646, 298], [432, 201, 840, 275, 45, 86, 156, 609, 646, 298], [432, 201, 840, 86, 291, 29, 170, 549, 531, 390], [432, 201, 840, 86, 291, 29, 170, 609, 531, 390], [432, 201, 840, 86, 291, 29, 172, 609, 531, 390], [432, 201, 840, 86, 291, 533, 154, 45, 610, 390], [688, 201, 840, 533, 43, 156, 418, 337, 582, 300]] := by
  have hdata := mem_depth2SubtreeResult_iff.mp hresult
  apply validFragmentMasksMemTargets (shadow := { masks := result })
  · exact hdata.1
  · simpa [Shadow.centerMask, centerMaskOf, pinnedMaskOf, maskOfLabels,
      Label.bit, Label.index] using hdata.2.1
  · simpa [Shadow.centerMask, centerMaskOf] using hdata.2.2

end Problem97.S1840TreeProof
