import LambdaKxFine.N101MergePart00

import LambdaKxFine.N099Zero

import LambdaKxFine.N100Zero

/-! Zero propagation for lambda Kx merge node 101. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode101Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hZAG : -4*Kx*Ky*Zy+4*Ky^2*Zx-4*Ky^2+4*Ky*Zy-2*Zx+1 = 0)
    : lambdaKxFineNode101Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode99Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hZAG
  have hright := lambdaKxFineNode100Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hZAG
  rw [lambdaKxBucketMerge101Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode101Zero

#eval IO.println "lambda Kx fine node 101: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
