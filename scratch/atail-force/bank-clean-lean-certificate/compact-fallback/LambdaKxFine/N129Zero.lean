import LambdaKxFine.N129MergePart00

import LambdaKxFine.N128Zero

import LambdaKxFine.N127Zero

/-! Zero propagation for lambda Kx merge node 129. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode129Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hREFLECT_Y : Yy-2*Ky*(1-Kx)+2*L*(Zx-Kx) = 0)
    : lambdaKxFineNode129Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode128Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_Y
  have hright := lambdaKxFineNode127Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_Y
  rw [lambdaKxBucketMerge129Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode129Zero

#eval IO.println "lambda Kx fine node 129: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
