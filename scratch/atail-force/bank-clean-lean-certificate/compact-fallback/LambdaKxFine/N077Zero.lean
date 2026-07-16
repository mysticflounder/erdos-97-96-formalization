import LambdaKxFine.N077MergePart00

import LambdaKxFine.N075Zero

import LambdaKxFine.N076Zero

/-! Zero propagation for lambda Kx merge node 77. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode77Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hAOK : -Kx^2+2*Kx-Ky^2 = 0)
    : lambdaKxFineNode77Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode75Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK
  have hright := lambdaKxFineNode76Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK
  rw [lambdaKxBucketMerge77Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode77Zero

#eval IO.println "lambda Kx fine node 77: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
