/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1777TreeProof.Root
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S1912TreeProof.Root
import Erdos9796Proof.P97.SurplusCOMPGBankCoverage.S3801TreeProof.Root

/-!
# Coverage of singleton depth-two search cells

This module collects the three depth-two search cells whose valid result is unique and
shows that every result from one of those cells occurs among the stored row masks.
-/

namespace Problem97
namespace SurplusCOMPGBankCoverage

open SurplusCOMPGBank

/-- The three depth-two search cells whose result is fixed by the structural certificates. -/
inductive IsSingletonDepthTwoCell : Label → Nat → Prop where
  | s1At777 : IsSingletonDepthTwoCell .s1 777
  | s1At912 : IsSingletonDepthTwoCell .s1 912
  | s3At801 : IsSingletonDepthTwoCell .s3 801

/-- The unique result of the `(.s1, 777)` cell occurs among the stored row masks. -/
theorem s1777Target_mem_rowShadowKeys :
    [432, 201, 777, 534, 354, 92, 170, 83, 549, 390] ∈ rowShadowKeys := by
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

end SurplusCOMPGBankCoverage
end Problem97
