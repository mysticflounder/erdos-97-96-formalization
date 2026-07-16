import LambdaKxFine.N079MergePart00

import LambdaKxFine.N010Zero

import LambdaKxFine.N011Zero

/-! Zero propagation for lambda Kx merge node 79. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode79Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hFAK : 2*Fx*Kx-2*Fx+2*Fy*Ky-2*Kx+1 = 0)
    : lambdaKxFineNode79Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode10Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFAK
  have hright := lambdaKxFineNode11Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFAK
  rw [lambdaKxBucketMerge79Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode79Zero

#eval IO.println "lambda Kx fine node 79: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
