import LambdaKxFine.N084MergePart00

import LambdaKxFine.N082Zero

import LambdaKxFine.N083Zero

/-! Zero propagation for lambda Kx merge node 84. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode84Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hFAK : 2*Fx*Kx-2*Fx+2*Fy*Ky-2*Kx+1 = 0)
    : lambdaKxFineNode84Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode82Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFAK
  have hright := lambdaKxFineNode83Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFAK
  rw [lambdaKxBucketMerge84Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode84Zero

#eval IO.println "lambda Kx fine node 84: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
