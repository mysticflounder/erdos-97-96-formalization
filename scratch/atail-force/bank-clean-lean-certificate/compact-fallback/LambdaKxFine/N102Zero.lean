import LambdaKxFine.N102MergePart00

import LambdaKxFine.N101Zero

import LambdaKxFine.N040Zero

/-! Zero propagation for lambda Kx merge node 102. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode102Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hZAG : -4*Kx*Ky*Zy+4*Ky^2*Zx-4*Ky^2+4*Ky*Zy-2*Zx+1 = 0)
    : lambdaKxFineNode102Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode101Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hZAG
  have hright := lambdaKxFineNode40Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hZAG
  rw [lambdaKxBucketMerge102Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode102Zero

#eval IO.println "lambda Kx fine node 102: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
