import LambdaKxFine.N098MergePart00

import LambdaKxFine.N096Zero

import LambdaKxFine.N097Zero

/-! Zero propagation for lambda Kx merge node 98. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode98Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hYOZ : 2*Yx*Zx+2*Yy*Zy-Zx^2-Zy^2 = 0)
    : lambdaKxFineNode98Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode96Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hYOZ
  have hright := lambdaKxFineNode97Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hYOZ
  rw [lambdaKxBucketMerge98Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode98Zero

#eval IO.println "lambda Kx fine node 98: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
