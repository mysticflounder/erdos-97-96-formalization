import LambdaKxFine.N103MergePart00

import LambdaKxFine.N041Zero

import LambdaKxFine.N042Zero

/-! Zero propagation for lambda Kx merge node 103. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode103Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hLDEF : L*(-2*Kx*Zx+2*Kx-2*Ky*Zy+Zx^2+Zy^2)-(2*Kx*Ky-2*Kx*Ky*Zx+Kx*Zy-2*Ky^2*Zy+Ky*Zx) = 0)
    : lambdaKxFineNode103Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode41Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hLDEF
  have hright := lambdaKxFineNode42Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hLDEF
  rw [lambdaKxBucketMerge103Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode103Zero

#eval IO.println "lambda Kx fine node 103: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
