/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Root
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1834TreeProof.Root
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1848TreeProof.Root
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1864TreeProof.Root
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1904TreeProof.Root
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1912TreeProof.Root
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1928TreeProof.Root
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S2864TreeProof.Root
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Root
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3928TreeProof.Root

/-!
# Coverage of singleton depth-two search cells

This module collects ten depth-two search cells whose valid results are structurally
determined and shows that every result from one of those cells occurs among the stored row masks.
-/

namespace Problem97
namespace SurplusCOMPGBankCoverage

open SurplusCOMPGBank

/-- The three depth-two search cells whose result is fixed by the structural certificates. -/
inductive IsSingletonDepthTwoCell : Label → Nat → Prop where
  | s1At777 : IsSingletonDepthTwoCell .s1 777
  | s1At912 : IsSingletonDepthTwoCell .s1 912
  | s3At801 : IsSingletonDepthTwoCell .s3 801

/-- A depth-two search cell covered by a singleton certificate or a finite target-row
certificate. -/
inductive IsStructurallyCoveredDepthTwoCell : Label → Nat → Prop where
  | singleton {sstar : Label} {wmask : Nat} :
      IsSingletonDepthTwoCell sstar wmask → IsStructurallyCoveredDepthTwoCell sstar wmask
  | s1At834 : IsStructurallyCoveredDepthTwoCell .s1 834
  | s1At848 : IsStructurallyCoveredDepthTwoCell .s1 848
  | s1At864 : IsStructurallyCoveredDepthTwoCell .s1 864
  | s1At904 : IsStructurallyCoveredDepthTwoCell .s1 904
  | s1At928 : IsStructurallyCoveredDepthTwoCell .s1 928
  | s2At864 : IsStructurallyCoveredDepthTwoCell .s2 864
  | s3At928 : IsStructurallyCoveredDepthTwoCell .s3 928

/-- The unique result of the `(.s1, 777)` cell occurs among the stored row masks. -/
theorem s1777Target_mem_rowShadowKeys :
    [432, 201, 777, 534, 354, 92, 170, 83, 549, 390] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The first possible result of the `(.s1, 834)` cell occurs among the stored row masks. -/
theorem s1834TargetA_mem_rowShadowKeys :
    [312, 201, 834, 277, 553, 660, 142, 83, 612, 418] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The second possible result of the `(.s1, 834)` cell occurs among the stored row masks. -/
theorem s1834TargetB_mem_rowShadowKeys :
    [432, 201, 834, 277, 553, 660, 396, 83, 612, 298] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The first certified target row for the `(.s1, 848)` cell is stored. -/
theorem s1848TargetA_mem_rowShadowKeys :
    [114, 201, 848, 531, 680, 78, 390, 297, 549, 284] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The second certified target row for the `(.s1, 848)` cell is stored. -/
theorem s1848TargetB_mem_rowShadowKeys :
    [178, 201, 848, 531, 106, 652, 390, 297, 549, 284] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The third certified target row for the `(.s1, 848)` cell is stored. -/
theorem s1848TargetC_mem_rowShadowKeys :
    [178, 201, 848, 531, 106, 652, 297, 326, 549, 284] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The fourth certified target row for the `(.s1, 848)` cell is stored. -/
theorem s1848TargetD_mem_rowShadowKeys :
    [300, 201, 848, 688, 291, 525, 154, 85, 610, 390] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_029` for the `(.s1, 864)` cell is stored. -/
theorem s1864TargetA_mem_rowShadowKeys :
    [114, 201, 864, 531, 680, 78, 390, 281, 660, 300] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_030` for the `(.s1, 864)` cell is stored. -/
theorem s1864TargetB_mem_rowShadowKeys :
    [178, 201, 864, 531, 106, 652, 390, 281, 596, 300] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_031` for the `(.s1, 864)` cell is stored. -/
theorem s1864TargetC_mem_rowShadowKeys :
    [284, 201, 864, 688, 291, 525, 170, 101, 531, 390] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_032` for the `(.s1, 864)` cell is stored. -/
theorem s1864TargetD_mem_rowShadowKeys :
    [284, 201, 864, 688, 102, 525, 170, 323, 531, 390] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_033` for the `(.s1, 864)` cell is stored. -/
theorem s1864TargetE_mem_rowShadowKeys :
    [284, 201, 864, 294, 553, 660, 170, 113, 582, 275] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_034` for the `(.s1, 864)` cell is stored. -/
theorem s1864TargetF_mem_rowShadowKeys :
    [284, 201, 864, 294, 553, 660, 170, 113, 582, 402] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_035` for the `(.s1, 864)` cell is stored. -/
theorem s1864TargetG_mem_rowShadowKeys :
    [284, 201, 864, 402, 680, 86, 43, 593, 646, 293] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_036` for the `(.s1, 864)` cell is stored. -/
theorem s1864TargetH_mem_rowShadowKeys :
    [284, 201, 864, 688, 291, 525, 170, 101, 594, 390] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_020` for the `(.s1, 904)` cell is stored. -/
theorem s1904TargetA_mem_rowShadowKeys :
    [432, 201, 904, 338, 43, 533, 150, 325, 610, 300] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_019` for the `(.s1, 904)` cell is stored. -/
theorem s1904TargetB_mem_rowShadowKeys :
    [432, 201, 904, 338, 46, 596, 29, 609, 646, 291] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_015` for the `(.s1, 904)` cell is stored. -/
theorem s1904TargetC_mem_rowShadowKeys :
    [432, 201, 904, 275, 106, 29, 150, 581, 547, 300] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_014` for the `(.s1, 904)` cell is stored. -/
theorem s1904TargetD_mem_rowShadowKeys :
    [432, 201, 904, 275, 106, 150, 45, 593, 547, 326] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_018` for the `(.s1, 904)` cell is stored. -/
theorem s1904TargetE_mem_rowShadowKeys :
    [432, 201, 904, 278, 106, 596, 45, 83, 646, 291] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_016` for the `(.s1, 904)` cell is stored. -/
theorem s1904TargetF_mem_rowShadowKeys :
    [432, 201, 904, 534, 354, 92, 43, 593, 549, 275] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_017` for the `(.s1, 904)` cell is stored. -/
theorem s1904TargetG_mem_rowShadowKeys :
    [432, 201, 904, 275, 610, 92, 150, 593, 549, 298] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_022` for the `(.s1, 904)` cell is stored. -/
theorem s1904TargetH_mem_rowShadowKeys :
    [688, 201, 904, 549, 354, 150, 43, 337, 582, 284] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_021` for the `(.s1, 904)` cell is stored. -/
theorem s1904TargetI_mem_rowShadowKeys :
    [688, 201, 904, 338, 549, 150, 29, 353, 582, 298] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s1_023` for the `(.s1, 904)` cell is stored. -/
theorem s1904TargetJ_mem_rowShadowKeys :
    [688, 201, 904, 354, 549, 150, 43, 337, 582, 284] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The first certified target row for the `(.s1, 928)` cell is stored. -/
theorem s1928TargetA_mem_rowShadowKeys :
    [178, 201, 928, 338, 616, 142, 281, 579, 533, 300] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The second certified target row for the `(.s1, 928)` cell is stored. -/
theorem s1928TargetB_mem_rowShadowKeys :
    [284, 201, 928, 178, 556, 326, 43, 593, 646, 275] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The third certified target row for the `(.s1, 928)` cell is stored. -/
theorem s1928TargetC_mem_rowShadowKeys :
    [284, 201, 928, 178, 616, 326, 43, 593, 646, 275] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The fourth certified target row for the `(.s1, 928)` cell is stored. -/
theorem s1928TargetD_mem_rowShadowKeys :
    [284, 201, 928, 178, 616, 86, 43, 593, 646, 293] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The first certified target row for the `(.s3, 928)` cell is stored. -/
theorem s3928TargetA_mem_rowShadowKeys :
    [344, 225, 928, 306, 588, 150, 45, 579, 533, 267] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The second certified target row for the `(.s3, 928)` cell is stored. -/
theorem s3928TargetB_mem_rowShadowKeys :
    [408, 225, 928, 306, 556, 86, 43, 593, 646, 269] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The third certified target row for the `(.s3, 928)` cell is stored. -/
theorem s3928TargetC_mem_rowShadowKeys :
    [408, 225, 928, 306, 588, 150, 45, 579, 533, 267] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The fourth certified target row for the `(.s3, 928)` cell is stored. -/
theorem s3928TargetD_mem_rowShadowKeys :
    [408, 225, 928, 338, 46, 596, 51, 585, 646, 269] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The fifth certified target row for the `(.s3, 928)` cell is stored. -/
theorem s3928TargetE_mem_rowShadowKeys :
    [408, 225, 928, 338, 588, 150, 45, 579, 533, 267] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s2_065` for the `(.s2, 864)` cell is stored. -/
theorem s2864TargetA_mem_rowShadowKeys :
    [284, 209, 864, 291, 172, 533, 178, 105, 582, 394] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s2_066` for the `(.s2, 864)` cell is stored. -/
theorem s2864TargetB_mem_rowShadowKeys :
    [284, 209, 864, 291, 680, 533, 178, 105, 582, 394] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s2_067` for the `(.s2, 864)` cell is stored. -/
theorem s2864TargetC_mem_rowShadowKeys :
    [284, 209, 864, 102, 680, 533, 178, 75, 646, 297] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s2_068` for the `(.s2, 864)` cell is stored. -/
theorem s2864TargetD_mem_rowShadowKeys :
    [284, 209, 864, 294, 680, 533, 178, 105, 582, 267] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s2_069` for the `(.s2, 864)` cell is stored. -/
theorem s2864TargetE_mem_rowShadowKeys :
    [284, 209, 864, 294, 680, 533, 178, 105, 582, 394] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The certified target row `s2_070` for the `(.s2, 864)` cell is stored. -/
theorem s2864TargetF_mem_rowShadowKeys :
    [284, 209, 864, 294, 680, 533, 178, 105, 646, 267] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The unique result of the `(.s1, 912)` cell occurs among the stored row masks. -/
theorem s1912Target_mem_rowShadowKeys :
    [178, 201, 912, 531, 616, 142, 297, 326, 549, 284] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- The unique result of the `(.s3, 801)` cell occurs among the stored row masks. -/
theorem s3801Target_mem_rowShadowKeys :
    [408, 225, 801, 562, 652, 86, 390, 75, 533, 300] ∈ rowShadowKeys := by
  simp [rowShadowKeys, rows, Row.shadowKey]

/-- Every result in one of the three singleton depth-two cells occurs among the stored rows. -/
theorem mem_rowShadowKeys_of_mem_depth2SubtreeResult_of_singletonCell
    {sstar : Label} {wmask : Nat} {result : List Nat}
    (hcell : IsSingletonDepthTwoCell sstar wmask)
    (hresult : result ∈ depth2SubtreeResult sstar wmask) :
    result ∈ rowShadowKeys := by
  cases hcell with
  | s1At777 =>
      rw [S1777TreeProof.memDepth2SubtreeResult_eqTarget hresult]
      exact s1777Target_mem_rowShadowKeys
  | s1At912 =>
      rw [S1912TreeProof.memDepth2SubtreeResult_eqTarget hresult]
      exact s1912Target_mem_rowShadowKeys
  | s3At801 =>
      rw [S3801TreeProof.memDepth2SubtreeResult_eqTarget hresult]
      exact s3801Target_mem_rowShadowKeys

/-- Every result in a singleton depth-two cell passes the Boolean stored-row membership test. -/
theorem depth2SubtreeResult_all_containsKey_rowShadowKeys_of_singletonCell
    {sstar : Label} {wmask : Nat}
    (hcell : IsSingletonDepthTwoCell sstar wmask) :
    (depth2SubtreeResult sstar wmask).all
      (fun result ↦ containsKey result rowShadowKeys) = true := by
  rw [List.all_eq_true]
  intro result hresult
  exact containsKey_eq_true_of_mem
    (mem_rowShadowKeys_of_mem_depth2SubtreeResult_of_singletonCell hcell hresult)

/-- Every result in one of the ten structurally covered depth-two cells occurs among the
stored rows. -/
theorem mem_rowShadowKeys_of_mem_depth2SubtreeResult_of_structurallyCoveredCell
    {sstar : Label} {wmask : Nat} {result : List Nat}
    (hcell : IsStructurallyCoveredDepthTwoCell sstar wmask)
    (hresult : result ∈ depth2SubtreeResult sstar wmask) :
    result ∈ rowShadowKeys := by
  cases hcell with
  | singleton hsingleton =>
      exact mem_rowShadowKeys_of_mem_depth2SubtreeResult_of_singletonCell hsingleton hresult
  | s1At834 =>
      have htargets := S1834TreeProof.memDepth2SubtreeResult_memTargets hresult
      simp only [List.mem_cons, List.not_mem_nil, or_false] at htargets
      rcases htargets with rfl | rfl
      · exact s1834TargetA_mem_rowShadowKeys
      · exact s1834TargetB_mem_rowShadowKeys
  | s1At848 =>
      have htargets := S1848TreeProof.memDepth2SubtreeResult_memTargets hresult
      simp only [List.mem_cons, List.not_mem_nil, or_false] at htargets
      rcases htargets with rfl | rfl | rfl | rfl
      · exact s1848TargetA_mem_rowShadowKeys
      · exact s1848TargetB_mem_rowShadowKeys
      · exact s1848TargetC_mem_rowShadowKeys
      · exact s1848TargetD_mem_rowShadowKeys
  | s1At864 =>
      have htargets := S1864TreeProof.memDepth2SubtreeResult_memTargets hresult
      simp only [List.mem_cons, List.not_mem_nil, or_false] at htargets
      rcases htargets with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
      · exact s1864TargetA_mem_rowShadowKeys
      · exact s1864TargetB_mem_rowShadowKeys
      · exact s1864TargetD_mem_rowShadowKeys
      · exact s1864TargetC_mem_rowShadowKeys
      · exact s1864TargetE_mem_rowShadowKeys
      · exact s1864TargetF_mem_rowShadowKeys
      · exact s1864TargetH_mem_rowShadowKeys
      · exact s1864TargetG_mem_rowShadowKeys
  | s1At904 =>
      have htargets := S1904TreeProof.memDepth2SubtreeResult_memTargets hresult
      simp only [List.mem_cons, List.not_mem_nil, or_false] at htargets
      rcases htargets with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
      · exact s1904TargetA_mem_rowShadowKeys
      · exact s1904TargetB_mem_rowShadowKeys
      · exact s1904TargetC_mem_rowShadowKeys
      · exact s1904TargetD_mem_rowShadowKeys
      · exact s1904TargetE_mem_rowShadowKeys
      · exact s1904TargetF_mem_rowShadowKeys
      · exact s1904TargetG_mem_rowShadowKeys
      · exact s1904TargetH_mem_rowShadowKeys
      · exact s1904TargetI_mem_rowShadowKeys
      · exact s1904TargetJ_mem_rowShadowKeys
  | s1At928 =>
      have htargets := S1928TreeProof.memDepth2SubtreeResult_memTargets hresult
      simp only [List.mem_cons, List.not_mem_nil, or_false] at htargets
      rcases htargets with rfl | rfl | rfl | rfl
      · exact s1928TargetA_mem_rowShadowKeys
      · exact s1928TargetB_mem_rowShadowKeys
      · exact s1928TargetC_mem_rowShadowKeys
      · exact s1928TargetD_mem_rowShadowKeys
  | s2At864 =>
      have htargets := S2864TreeProof.memDepth2SubtreeResult_memTargets hresult
      simp only [List.mem_cons, List.not_mem_nil, or_false] at htargets
      rcases htargets with rfl | rfl | rfl | rfl | rfl | rfl
      · exact s2864TargetC_mem_rowShadowKeys
      · exact s2864TargetA_mem_rowShadowKeys
      · exact s2864TargetB_mem_rowShadowKeys
      · exact s2864TargetD_mem_rowShadowKeys
      · exact s2864TargetE_mem_rowShadowKeys
      · exact s2864TargetF_mem_rowShadowKeys
  | s3At928 =>
      have htargets := S3928TreeProof.memDepth2SubtreeResult_memTargets hresult
      simp only [List.mem_cons, List.not_mem_nil, or_false] at htargets
      rcases htargets with rfl | rfl | rfl | rfl | rfl
      · exact s3928TargetA_mem_rowShadowKeys
      · exact s3928TargetB_mem_rowShadowKeys
      · exact s3928TargetC_mem_rowShadowKeys
      · exact s3928TargetD_mem_rowShadowKeys
      · exact s3928TargetE_mem_rowShadowKeys

/-- Every result in a structurally covered depth-two cell passes the Boolean stored-row
membership test. -/
theorem depth2SubtreeResult_all_containsKey_rowShadowKeys_of_structurallyCoveredCell
    {sstar : Label} {wmask : Nat}
    (hcell : IsStructurallyCoveredDepthTwoCell sstar wmask) :
    (depth2SubtreeResult sstar wmask).all
      (fun result ↦ containsKey result rowShadowKeys) = true := by
  rw [List.all_eq_true]
  intro result hresult
  exact containsKey_eq_true_of_mem
    (mem_rowShadowKeys_of_mem_depth2SubtreeResult_of_structurallyCoveredCell hcell hresult)

end SurplusCOMPGBankCoverage
end Problem97
