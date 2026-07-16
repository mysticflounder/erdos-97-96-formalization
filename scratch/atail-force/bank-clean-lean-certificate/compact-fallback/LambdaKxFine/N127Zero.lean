import LambdaKxFine.N127MergePart00

import LambdaKxFine.N123Zero

import LambdaKxFine.N124Zero

/-! Zero propagation for lambda Kx merge node 127. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode127Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hREFLECT_Y : Yy-2*Ky*(1-Kx)+2*L*(Zx-Kx) = 0)
    : lambdaKxFineNode127Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode123Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_Y
  have hright := lambdaKxFineNode124Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_Y
  rw [lambdaKxBucketMerge127Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode127Zero

#eval IO.println "lambda Kx fine node 127: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
