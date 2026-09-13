import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard05
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard06
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard08
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard09
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard10
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard11
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard12
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard13
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard14
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard15
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard16
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard17
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Shard18

namespace Problem97.S1834TreeProof

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def order : List Label := [.u, .Q1, .s1, .Q2, .Pw, .s2, .Pu, .s3]

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
    (300, Shard08.certificate),
    (308, Shard09.certificate),
    (312, Shard10.certificate),
    (368, Shard11.certificate),
    (432, Shard12.certificate),
    (540, Shard13.certificate),
    (556, Shard14.certificate),
    (564, Shard15.certificate),
    (568, Shard16.certificate),
    (624, Shard17.certificate),
    (688, Shard18.certificate)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificateForTargets .s1 s1834Fixed s1834Targets order [] certificate = true := by
  simp only [order, certificate, checkCompatibilityCertificateForTargets, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard00.checked, Shard01.checked, Shard02.checked, Shard03.checked, Shard04.checked, Shard05.checked, Shard06.checked, Shard07.checked, Shard08.checked, Shard09.checked, Shard10.checked, Shard11.checked, Shard12.checked, Shard13.checked, Shard14.checked, Shard15.checked, Shard16.checked, Shard17.checked, Shard18.checked, True.intro⟩

theorem targetExists (choice : Label → Nat)
    (hchoice : ∀ center ∈ order, choice center ∈ candidateDomain .s1 s1834Fixed center)
    (hseparation : ∀ center ∈ order, ∀ other ∈ order, center ≠ other →
      crossSeparationOKForMasks center (choice center) other (choice other) = true) :
    ∃ target ∈ s1834Targets, ∀ center ∈ order, choice center = target center := by
  rcases target_of_checkCompatibilityCertificateForTargets checked hchoice (by simp)
      (by simp) hseparation with ⟨target, htarget, hfree, _⟩
  exact ⟨target, htarget, hfree⟩

theorem validFragmentTargetExists {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 834) :
    ∃ target ∈ s1834Targets,
      ∀ center ∈ order, shadow.centerMask center = target center := by
  apply validFragment_target_of_checkCompatibilityCertificateForTargets checked hvalid
  · intro center hcenter entry hentry
    simp [order, s1834Fixed] at hcenter hentry ⊢
    rcases hentry with hentry | hentry <;> subst entry <;>
      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide
  · intro entry hentry
    simp [s1834Fixed] at hentry
    rcases hentry with hentry | hentry <;> subst entry
    · exact hv
    · exact hw

private theorem validFragmentMasksEqTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 834)
    {target : Label → Nat}
    (htargetV : target .v = 201)
    (htargetW : target .w = 834)
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
    (hw : shadow.centerMask .w = 834) :
    shadow.masks ∈ [[312, 201, 834, 277, 553, 660, 142, 83, 612, 418], [432, 201, 834, 277, 553, 660, 396, 83, 612, 298]] := by
  rcases validFragmentTargetExists hvalid hv hw with ⟨target, htarget, hfree⟩
  simp only [s1834Targets, List.mem_cons, List.not_mem_nil, or_false] at htarget
  simp only [List.mem_cons, List.not_mem_nil, or_false]
  rcases htarget with htarget0 | htarget1
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inl (by simpa [allLabels, s1834TargetA] using hmasks)
  · subst target
    have hmasks := validFragmentMasksEqTarget hvalid hv hw
      (by decide) (by decide) hfree
    exact Or.inr (by simpa [allLabels, s1834TargetB] using hmasks)

theorem memDepth2SubtreeResult_memTargets {result : List Nat}
    (hresult : result ∈ depth2SubtreeResult .s1 834) :
    result ∈ [[312, 201, 834, 277, 553, 660, 142, 83, 612, 418], [432, 201, 834, 277, 553, 660, 396, 83, 612, 298]] := by
  have hdata := mem_depth2SubtreeResult_iff.mp hresult
  apply validFragmentMasksMemTargets (shadow := { masks := result })
  · exact hdata.1
  · simpa [Shadow.centerMask, centerMaskOf, pinnedMaskOf, maskOfLabels,
      Label.bit, Label.index] using hdata.2.1
  · simpa [Shadow.centerMask, centerMaskOf] using hdata.2.2

end Problem97.S1834TreeProof
