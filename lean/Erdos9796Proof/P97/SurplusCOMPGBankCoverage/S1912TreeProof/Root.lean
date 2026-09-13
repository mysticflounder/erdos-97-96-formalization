import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1912TreeProof.Shard00
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1912TreeProof.Shard01
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1912TreeProof.Shard02
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1912TreeProof.Shard03
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1912TreeProof.Shard04
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1912TreeProof.Shard05
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1912TreeProof.Shard06
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1912TreeProof.Shard07
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1912TreeProof.Shard08

namespace Problem97.S1912TreeProof

open SurplusCOMPGBank SurplusCOMPGBankCoverage

def order : List Label := [.u, .Q1, .Pw, .Pu, .Q2, .s3, .s2, .s1]

def certificate : CompatibilityCertificate :=
  .split [
    (30, Shard00.certificate),
    (46, Shard01.certificate),
    (54, Shard02.certificate),
    (58, Shard03.certificate),
    (60, Shard04.certificate),
    (114, Shard05.certificate),
    (178, Shard06.certificate),
    (300, Shard07.certificate),
    (556, Shard08.certificate)
  ]

set_option maxRecDepth 100000 in
theorem checked :
    checkCompatibilityCertificate .s1 s1912Fixed s1912Target order [] certificate = true := by
  simp only [order, certificate, checkCompatibilityCertificate, List.map_cons,
    List.map_nil, Bool.and_eq_true, List.all_cons, List.all_nil]
  refine ⟨by decide, ?_⟩
  exact ⟨Shard00.checked, Shard01.checked, Shard02.checked, Shard03.checked, Shard04.checked, Shard05.checked, Shard06.checked, Shard07.checked, Shard08.checked, True.intro⟩

theorem forcesTarget (choice : Label → Nat)
    (hchoice : ∀ center ∈ order, choice center ∈ candidateDomain .s1 s1912Fixed center)
    (hseparation : ∀ center ∈ order, ∀ other ∈ order, center ≠ other →
      crossSeparationOKForMasks center (choice center) other (choice other) = true) :
    ∀ center ∈ order, choice center = s1912Target center := by
  exact (target_of_checkCompatibilityCertificate checked hchoice (by simp)
    (by simp) hseparation).1

theorem validFragmentForcesTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 912) :
    ∀ center ∈ order, shadow.centerMask center = s1912Target center := by
  apply validFragment_target_of_checkCompatibilityCertificate checked hvalid
  · intro center hcenter entry hentry
    simp [order, s1912Fixed] at hcenter hentry ⊢
    rcases hentry with hentry | hentry <;> subst entry <;>
      rcases hcenter with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> decide
  · intro entry hentry
    simp [s1912Fixed] at hentry
    rcases hentry with hentry | hentry <;> subst entry
    · exact hv
    · exact hw

theorem validFragmentMasksEqTarget {shadow : Shadow}
    (hvalid : isValidPinnedFragment .s1 shadow = true)
    (hv : shadow.centerMask .v = 201)
    (hw : shadow.centerMask .w = 912) :
    shadow.masks = [178, 201, 912, 531, 616, 142, 297, 326, 549, 284] := by
  have hfree := validFragmentForcesTarget hvalid hv hw
  have hcenter : ∀ center, shadow.centerMask center = s1912Target center := by
    intro center
    cases center with
    | v => exact hv
    | w => exact hw
    | u | s1 | s2 | s3 | Pw | Pu | Q1 | Q2 =>
        exact hfree _ (by simp [order])
  simpa [allLabels, s1912Target] using
    shadow_masks_eq_map_of_hasTenMasks
      (hasTenMasks_of_isValidPinnedFragment hvalid) hcenter

theorem memDepth2SubtreeResult_eqTarget {result : List Nat}
    (hresult : result ∈ depth2SubtreeResult .s1 912) :
    result = [178, 201, 912, 531, 616, 142, 297, 326, 549, 284] := by
  have hdata := mem_depth2SubtreeResult_iff.mp hresult
  apply validFragmentMasksEqTarget (shadow := { masks := result })
  · exact hdata.1
  · simpa [Shadow.centerMask, centerMaskOf, pinnedMaskOf, maskOfLabels,
      Label.bit, Label.index] using hdata.2.1
  · simpa [Shadow.centerMask, centerMaskOf] using hdata.2.2

end Problem97.S1912TreeProof
