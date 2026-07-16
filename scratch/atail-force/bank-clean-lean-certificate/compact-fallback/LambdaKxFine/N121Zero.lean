import LambdaKxFine.N121MergePart00

import LambdaKxFine.N063Zero

import LambdaKxFine.N064Zero

/-! Zero propagation for lambda Kx merge node 121. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode121Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hREFLECT_Y : Yy-2*Ky*(1-Kx)+2*L*(Zx-Kx) = 0)
    : lambdaKxFineNode121Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode63Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_Y
  have hright := lambdaKxFineNode64Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_Y
  rw [lambdaKxBucketMerge121Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode121Zero

#eval IO.println "lambda Kx fine node 121: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
