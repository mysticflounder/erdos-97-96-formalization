import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard05
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard06
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard10
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2912TreeProof.Shard12

namespace Problem97.S2912TreeProof

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def order : List Label := [.u, .Q1, .Q2, .Pw, .Pu, .s3, .s1, .s2]

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard00.certificate),
    (46, Shard01.certificate),
    (54, Shard02.certificate),
    (58, Shard03.certificate),
    (60, Shard04.certificate),
    (106, Shard05.certificate),
    (170, Shard06.certificate),
    (300, Shard07.certificate),
    (360, Shard08.certificate),
    (424, Shard09.certificate),
    (556, Shard10.certificate),
    (616, Shard11.certificate),
    (680, Shard12.certificate)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s2 s2912Fixed s2912Targets order [] certificate = true := by
  simp only [order, certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard00.checked, Shard01.checked, Shard02.checked, Shard03.checked, Shard04.checked, Shard05.checked, Shard06.checked, Shard07.checked, Shard08.checked, Shard09.checked, Shard10.checked, Shard11.checked, Shard12.checked, True.intro⟩

theorem targetExists (choice : Label → Nat)
    (hchoice : ∀ center ∈ order, choice center ∈ candidateDomain .s2 s2912Fixed center)
    (hseparation : ∀ center ∈ order, ∀ other ∈ order, center ≠ other →
      crossSeparationOKForMasks center (choice center) other (choice other) = true) :
    ∃ target ∈ s2912Targets, ∀ center ∈ order, choice center = target center := by
  rcases target_of_checkCompatibilityCertificateForTargets checked hchoice (by simp)
      (by simp) hseparation with ⟨target, htarget, hfree, _⟩
  exact ⟨target, htarget, hfree⟩

theorem validFragmentTargetExists {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s2 shadow = true)
    (hv : shadow.centerMask .v = 209)
    (hw : shadow.centerMask .w = 912) :
    ∃ target ∈ s2912Targets,
      ∀ center ∈ order, shadow.centerMask center = target center := by
  apply validFragment_target_of_checkCompatibilityCertificateForTargets checked hvalid
  · intro center hcenter entry hentry
    simp [order, s2912Fixed] at hcenter hentry ⊢
    rcases hentry with hentry | hentry <;> subst entry <;>
      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide
  · intro entry hentry
    simp [s2912Fixed] at hentry
    rcases hentry with hentry | hentry <;> subst entry
    · exact hv
    · exact hw

private theorem validFragmentMasksEqTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s2 shadow = true)
    (hv : shadow.centerMask .v = 209)
    (hw : shadow.centerMask .w = 912)
    {target : Label → Nat}
    (htargetV : target .v = 209)
    (htargetW : target .w = 912)
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
    (hw : shadow.centerMask .w = 912) :
    shadow.masks ∈ [[424, 209, 912, 291, 556, 86, 29, 609, 646, 330], [424, 209, 912, 306, 616, 86, 29, 579, 549, 267], [424, 209, 912, 306, 549, 86, 29, 99, 646, 267], [424, 209, 912, 306, 556, 86, 29, 99, 646, 267], [424, 209, 912, 306, 556, 86, 29, 609, 646, 267], [424, 209, 912, 306, 556, 86, 29, 609, 646, 330], [424, 209, 912, 278, 610, 92, 51, 585, 549, 267], [424, 209, 912, 534, 354, 92, 51, 585, 549, 267], [424, 209, 912, 534, 354, 92, 51, 585, 549, 270], [424, 209, 912, 534, 291, 92, 166, 609, 525, 330], [616, 209, 912, 549, 170, 332, 29, 323, 646, 306], [680, 209, 912, 354, 549, 142, 51, 329, 582, 284], [680, 209, 912, 549, 354, 142, 51, 329, 582, 284]] := by
  rcases validFragmentTargetExists hvalid hv hw with ⟨target, htarget, hfree⟩
  simp only [s2912Targets, List.mem_cons, List.not_mem_nil, or_false] at htarget
  simp only [List.mem_cons, List.not_mem_nil, or_false]
  rcases htarget with htarget0 | htarget1 | htarget2 | htarget3 | htarget4 | htarget5 | htarget6 | htarget7 | htarget8 | htarget9 | htarget10 | htarget11 | htarget12
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inl (by simpa [allLabels, s2912TargetA] using hmasks)
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inl (by simpa [allLabels, s2912TargetB] using hmasks))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2912TargetC] using hmasks)))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2912TargetD] using hmasks))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2912TargetE] using hmasks)))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2912TargetF] using hmasks))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2912TargetG] using hmasks)))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2912TargetH] using hmasks))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2912TargetI] using hmasks)))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2912TargetJ] using hmasks))))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2912TargetK] using hmasks)))))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2912TargetL] using hmasks))))))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (by simpa [allLabels, s2912TargetM] using hmasks))))))))))))

theorem memDepth2SubtreeResult_memTargets {result : List Nat}
    (hresult : result ∈ depth2SubtreeResult .s2 912) :
    result ∈ [[424, 209, 912, 291, 556, 86, 29, 609, 646, 330], [424, 209, 912, 306, 616, 86, 29, 579, 549, 267], [424, 209, 912, 306, 549, 86, 29, 99, 646, 267], [424, 209, 912, 306, 556, 86, 29, 99, 646, 267], [424, 209, 912, 306, 556, 86, 29, 609, 646, 267], [424, 209, 912, 306, 556, 86, 29, 609, 646, 330], [424, 209, 912, 278, 610, 92, 51, 585, 549, 267], [424, 209, 912, 534, 354, 92, 51, 585, 549, 267], [424, 209, 912, 534, 354, 92, 51, 585, 549, 270], [424, 209, 912, 534, 291, 92, 166, 609, 525, 330], [616, 209, 912, 549, 170, 332, 29, 323, 646, 306], [680, 209, 912, 354, 549, 142, 51, 329, 582, 284], [680, 209, 912, 549, 354, 142, 51, 329, 582, 284]] := by
  have hdata := mem_depth2SubtreeResult_iff.mp hresult
  apply validFragmentMasksMemTargets (shadow := { masks := result })
  · exact hdata.1
  · simpa [Shadow.centerMask, centerMaskOf, pinnedMaskOf, maskOfLabels,
      Label.bit, Label.index] using hdata.2.1
  · simpa [Shadow.centerMask, centerMaskOf] using hdata.2.2

end Problem97.S2912TreeProof
