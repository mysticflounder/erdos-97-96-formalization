import LambdaKxFine.N116MergePart00

import LambdaKxFine.N113Zero

import LambdaKxFine.N058Zero

/-! Zero propagation for lambda Kx merge node 116. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode116Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hREFLECT_X : Yx-2*Ky^2-2*L*(Zy-Ky) = 0)
    : lambdaKxFineNode116Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode113Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_X
  have hright := lambdaKxFineNode58Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_X
  rw [lambdaKxBucketMerge116Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode116Zero

#eval IO.println "lambda Kx fine node 116: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
