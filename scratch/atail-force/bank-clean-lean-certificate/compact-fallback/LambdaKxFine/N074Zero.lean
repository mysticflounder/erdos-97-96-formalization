import LambdaKxFine.N074MergePart00

import LambdaKxFine.N006Zero

import LambdaKxFine.N007Zero

/-! Zero propagation for lambda Kx merge node 74. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode74Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hAOK : -Kx^2+2*Kx-Ky^2 = 0)
    : lambdaKxFineNode74Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode6Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK
  have hright := lambdaKxFineNode7Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK
  rw [lambdaKxBucketMerge74Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode74Zero

#eval IO.println "lambda Kx fine node 74: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
