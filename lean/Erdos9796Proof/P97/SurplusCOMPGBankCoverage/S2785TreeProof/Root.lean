import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard05
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard06
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard10
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2785TreeProof.Shard12

namespace Problem97.S2785TreeProof

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def order : List Label := [.u, .Q1, .Q2, .Pu, .Pw, .s1, .s3, .s2]

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
    checkCompatibilityCertificateForTargets .s2 s2785Fixed s2785Targets order [] certificate = true := by
  simp only [order, certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard00.checked, Shard01.checked, Shard02.checked, Shard03.checked, Shard04.checked, Shard05.checked, Shard06.checked, Shard07.checked, Shard08.checked, Shard09.checked, Shard10.checked, Shard11.checked, Shard12.checked, True.intro⟩

theorem targetExists (choice : Label → Nat)
    (hchoice : ∀ center ∈ order, choice center ∈ candidateDomain .s2 s2785Fixed center)
    (hseparation : ∀ center ∈ order, ∀ other ∈ order, center ≠ other →
      crossSeparationOKForMasks center (choice center) other (choice other) = true) :
    ∃ target ∈ s2785Targets, ∀ center ∈ order, choice center = target center := by
  rcases target_of_checkCompatibilityCertificateForTargets checked hchoice (by simp)
      (by simp) hseparation with ⟨target, htarget, hfree, _⟩
  exact ⟨target, htarget, hfree⟩

theorem validFragmentTargetExists {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s2 shadow = true)
    (hv : shadow.centerMask .v = 209)
    (hw : shadow.centerMask .w = 785) :
    ∃ target ∈ s2785Targets,
      ∀ center ∈ order, shadow.centerMask center = target center := by
  apply validFragment_target_of_checkCompatibilityCertificateForTargets checked hvalid
  · intro center hcenter entry hentry
    simp [order, s2785Fixed] at hcenter hentry ⊢
    rcases hentry with hentry | hentry <;> subst entry <;>
      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide
  · intro entry hentry
    simp [s2785Fixed] at hentry
    rcases hentry with hentry | hentry <;> subst entry
    · exact hv
    · exact hw

private theorem validFragmentMasksEqTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s2 shadow = true)
    (hv : shadow.centerMask .v = 209)
    (hw : shadow.centerMask .w = 785)
    {target : Label → Nat}
    (htargetV : target .v = 209)
    (htargetW : target .w = 785)
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
    (hw : shadow.centerMask .w = 785) :
    shadow.masks ∈ [[424, 209, 785, 306, 556, 86, 156, 75, 547, 390], [424, 209, 785, 306, 616, 86, 156, 75, 547, 390], [424, 209, 785, 306, 616, 86, 156, 75, 549, 390], [424, 209, 785, 306, 45, 86, 156, 99, 523, 390], [424, 209, 785, 534, 354, 92, 178, 75, 525, 390], [424, 209, 785, 534, 354, 92, 178, 75, 549, 390], [424, 209, 785, 534, 616, 156, 390, 75, 549, 306], [424, 209, 785, 534, 106, 156, 390, 77, 549, 306], [424, 209, 785, 534, 616, 156, 390, 77, 549, 306], [424, 209, 785, 534, 43, 156, 390, 101, 525, 306], [424, 209, 785, 562, 652, 86, 390, 75, 549, 284], [424, 209, 785, 562, 652, 86, 390, 99, 549, 284], [424, 209, 785, 562, 652, 90, 390, 77, 549, 354], [424, 209, 785, 562, 652, 90, 390, 99, 549, 332], [424, 209, 785, 564, 354, 92, 674, 75, 525, 390], [424, 209, 785, 564, 354, 92, 652, 75, 547, 390]] := by
  rcases validFragmentTargetExists hvalid hv hw with ⟨target, htarget, hfree⟩
  simp only [s2785Targets, List.mem_cons, List.not_mem_nil, or_false] at htarget
  simp only [List.mem_cons, List.not_mem_nil, or_false]
  rcases htarget with htarget0 | htarget1 | htarget2 | htarget3 | htarget4 | htarget5 | htarget6 | htarget7 | htarget8 | htarget9 | htarget10 | htarget11 | htarget12 | htarget13 | htarget14 | htarget15
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inl (by simpa [allLabels, s2785TargetA] using hmasks)
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inl (by simpa [allLabels, s2785TargetB] using hmasks))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetC] using hmasks)))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetD] using hmasks))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetE] using hmasks)))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetF] using hmasks))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetG] using hmasks)))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetH] using hmasks))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetI] using hmasks)))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetJ] using hmasks))))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetK] using hmasks)))))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetL] using hmasks))))))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetM] using hmasks)))))))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetN] using hmasks))))))))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (by simpa [allLabels, s2785TargetO] using hmasks)))))))))))))))
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (by simpa [allLabels, s2785TargetP] using hmasks)))))))))))))))

theorem memDepth2SubtreeResult_memTargets {result : List Nat}
    (hresult : result ∈ depth2SubtreeResult .s2 785) :
    result ∈ [[424, 209, 785, 306, 556, 86, 156, 75, 547, 390], [424, 209, 785, 306, 616, 86, 156, 75, 547, 390], [424, 209, 785, 306, 616, 86, 156, 75, 549, 390], [424, 209, 785, 306, 45, 86, 156, 99, 523, 390], [424, 209, 785, 534, 354, 92, 178, 75, 525, 390], [424, 209, 785, 534, 354, 92, 178, 75, 549, 390], [424, 209, 785, 534, 616, 156, 390, 75, 549, 306], [424, 209, 785, 534, 106, 156, 390, 77, 549, 306], [424, 209, 785, 534, 616, 156, 390, 77, 549, 306], [424, 209, 785, 534, 43, 156, 390, 101, 525, 306], [424, 209, 785, 562, 652, 86, 390, 75, 549, 284], [424, 209, 785, 562, 652, 86, 390, 99, 549, 284], [424, 209, 785, 562, 652, 90, 390, 77, 549, 354], [424, 209, 785, 562, 652, 90, 390, 99, 549, 332], [424, 209, 785, 564, 354, 92, 674, 75, 525, 390], [424, 209, 785, 564, 354, 92, 652, 75, 547, 390]] := by
  have hdata := mem_depth2SubtreeResult_iff.mp hresult
  apply validFragmentMasksMemTargets (shadow := { masks := result })
  · exact hdata.1
  · simpa [Shadow.centerMask, centerMaskOf, pinnedMaskOf, maskOfLabels,
      Label.bit, Label.index] using hdata.2.1
  · simpa [Shadow.centerMask, centerMaskOf] using hdata.2.2

end Problem97.S2785TreeProof
