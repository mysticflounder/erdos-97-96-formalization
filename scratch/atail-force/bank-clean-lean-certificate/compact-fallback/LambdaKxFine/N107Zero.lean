import LambdaKxFine.N107MergePart00

import LambdaKxFine.N105Zero

import LambdaKxFine.N047Zero

/-! Zero propagation for lambda Kx merge node 107. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode107Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hLDEF : L*(-2*Kx*Zx+2*Kx-2*Ky*Zy+Zx^2+Zy^2)-(2*Kx*Ky-2*Kx*Ky*Zx+Kx*Zy-2*Ky^2*Zy+Ky*Zx) = 0)
    : lambdaKxFineNode107Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode105Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hLDEF
  have hright := lambdaKxFineNode47Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hLDEF
  rw [lambdaKxBucketMerge107Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode107Zero

#eval IO.println "lambda Kx fine node 107: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
