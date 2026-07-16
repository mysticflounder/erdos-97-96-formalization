import LambdaKxFine.N108MergePart00

import LambdaKxFine.N106Zero

import LambdaKxFine.N107Zero

/-! Zero propagation for lambda Kx merge node 108. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode108Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hLDEF : L*(-2*Kx*Zx+2*Kx-2*Ky*Zy+Zx^2+Zy^2)-(2*Kx*Ky-2*Kx*Ky*Zx+Kx*Zy-2*Ky^2*Zy+Ky*Zx) = 0)
    : lambdaKxFineNode108Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode106Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hLDEF
  have hright := lambdaKxFineNode107Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hLDEF
  rw [lambdaKxBucketMerge108Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode108Zero

#eval IO.println "lambda Kx fine node 108: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
