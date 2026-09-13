import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard05
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard06
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard10
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Shard12

namespace Problem97.S1904TreeProof

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
    (308, Shard07.certificate),
    (368, Shard08.certificate),
    (432, Shard09.certificate),
    (564, Shard10.certificate),
    (624, Shard11.certificate),
    (688, Shard12.certificate)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1904Fixed s1904Targets order [] certificate = true := by
  simp only [order, certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard00.checked, Shard01.checked, Shard02.checked, Shard03.checked, Shard04.checked, Shard05.checked, Shard06.checked, Shard07.checked, Shard08.checked, Shard09.checked, Shard10.checked, Shard11.checked, Shard12.checked, True.intro⟩

theorem targetExists (choice : Label → Nat)
    (hchoice : ∀ center ∈ order, choice center ∈ candidateDomain .s1 s1904Fixed center)
    (hseparation : ∀ center ∈ order, ∀ other ∈ order, center ≠ other →
      crossSeparationOKForMasks center (choice center) other (choice other) = true) :
    ∃ target ∈ s1904Targets, ∀ center ∈ order, choice center = target center := by
  rcases target_of_checkCompatibilityCertificateForTargets checked hchoice (by simp)
      (by simp) hseparation with ⟨target, htarget, hfree, _⟩
  exact ⟨target, htarget, hfree⟩

theorem validFragmentTargetExists {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 904) :
    ∃ target ∈ s1904Targets,
      ∀ center ∈ order, shadow.centerMask center = target center := by
  apply validFragment_target_of_checkCompatibilityCertificateForTargets checked hvalid
  · intro center hcenter entry hentry
    simp [order, s1904Fixed] at hcenter hentry ⊢
    rcases hentry with hentry | hentry <;> subst entry <;>
      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide
  · intro entry hentry
    simp [s1904Fixed] at hentry
    rcases hentry with hentry | hentry <;> subst entry
    · exact hv
    · exact hw

private theorem validFragmentMasksEqTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 904)
    {target : Label → Nat}
    (htargetV : target .v = 201)
    (htargetW : target .w = 904)
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
    (hw : shadow.centerMask .w = 904) :
    shadow.masks ∈ [[432, 201, 904, 338, 43, 533, 150, 325, 610, 300], [432, 201, 904, 338, 46, 596, 29, 609, 646, 291], [432, 201, 904, 275, 106, 29, 150, 581, 547, 300], [432, 201, 904, 275, 106, 150, 45, 593, 547, 326], [432, 201, 904, 278, 106, 596, 45, 83, 646, 291], [432, 201, 904, 534, 354, 92, 43, 593, 549, 275], [432, 201, 904, 275, 610, 92, 150, 593, 549, 298], [688, 201, 904, 549, 354, 150, 43, 337, 582, 284], [688, 201, 904, 338, 549, 150, 29, 353, 582, 298], [688, 201, 904, 354, 549, 150, 43, 337, 582, 284]] := by
  rcases validFragmentTargetExists hvalid hv hw with ⟨target, htarget, hfree⟩
  simp only [s1904Targets, List.mem_cons, List.not_mem_nil, or_false] at htarget
  simp only [List.mem_cons, List.not_mem_nil, or_false]
  rcases htarget with htarget0 | htarget1 | htarget2 | htarget3 | htarget4 | htarget5 | htarget6 | htarget7 | htarget8 | htarget9
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inl (by simpa [allLabels, s1904TargetA] using hmasks)
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inl (by simpa [allLabels, s1904TargetB] using hmasks))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1904TargetC] using hmasks)))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1904TargetD] using hmasks))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1904TargetE] using hmasks)))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1904TargetF] using hmasks))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1904TargetG] using hmasks)))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1904TargetH] using hmasks))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s1904TargetI] using hmasks)))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (by simpa [allLabels, s1904TargetJ] using hmasks)))))))))

theorem memDepth2SubtreeResult_memTargets {result : List Nat}
    (hresult : result ∈ depth2SubtreeResult .s1 904) :
    result ∈ [[432, 201, 904, 338, 43, 533, 150, 325, 610, 300], [432, 201, 904, 338, 46, 596, 29, 609, 646, 291], [432, 201, 904, 275, 106, 29, 150, 581, 547, 300], [432, 201, 904, 275, 106, 150, 45, 593, 547, 326], [432, 201, 904, 278, 106, 596, 45, 83, 646, 291], [432, 201, 904, 534, 354, 92, 43, 593, 549, 275], [432, 201, 904, 275, 610, 92, 150, 593, 549, 298], [688, 201, 904, 549, 354, 150, 43, 337, 582, 284], [688, 201, 904, 338, 549, 150, 29, 353, 582, 298], [688, 201, 904, 354, 549, 150, 43, 337, 582, 284]] := by
  have hdata := mem_depth2SubtreeResult_iff.mp hresult
  apply validFragmentMasksMemTargets (shadow := { masks := result })
  · exact hdata.1
  · simpa [Shadow.centerMask, centerMaskOf, pinnedMaskOf, maskOfLabels,
      Label.bit, Label.index] using hdata.2.1
  · simpa [Shadow.centerMask, centerMaskOf] using hdata.2.2

end Problem97.S1904TreeProof
