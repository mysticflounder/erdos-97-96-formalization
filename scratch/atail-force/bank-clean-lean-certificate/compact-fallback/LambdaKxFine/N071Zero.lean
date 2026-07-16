import LambdaKxFine.N071MergePart00

import LambdaKxFine.N000Zero

import LambdaKxFine.N001Zero

/-! Zero propagation for lambda Kx merge node 71. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode71Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hAOK : -Kx^2+2*Kx-Ky^2 = 0)
    : lambdaKxFineNode71Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode0Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK
  have hright := lambdaKxFineNode1Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK
  rw [lambdaKxBucketMerge71Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode71Zero

#eval IO.println "lambda Kx fine node 71: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
