import LambdaKxFine.N094MergePart00

import LambdaKxFine.N029Zero

import LambdaKxFine.N030Zero

/-! Zero propagation for lambda Kx merge node 94. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode94Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hYOX : -Xx^2+2*Xx*Yx-Xy^2+2*Xy*Yy = 0)
    : lambdaKxFineNode94Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode29Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hYOX
  have hright := lambdaKxFineNode30Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hYOX
  rw [lambdaKxBucketMerge94Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode94Zero

#eval IO.println "lambda Kx fine node 94: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
