import LambdaKxFine.N091MergePart00

import LambdaKxFine.N024Zero

import LambdaKxFine.N025Zero

/-! Zero propagation for lambda Kx merge node 91. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode91Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hXZ : Xx^2+Xy^2-2*Xx*Zx-2*Xy*Zy+Zx^2+Zy^2-2*Kx = 0)
    : lambdaKxFineNode91Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode24Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hXZ
  have hright := lambdaKxFineNode25Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hXZ
  rw [lambdaKxBucketMerge91Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode91Zero

#eval IO.println "lambda Kx fine node 91: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
