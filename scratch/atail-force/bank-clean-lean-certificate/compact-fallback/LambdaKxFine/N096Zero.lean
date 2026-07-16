import LambdaKxFine.N096MergePart00

import LambdaKxFine.N032Zero

import LambdaKxFine.N033Zero

/-! Zero propagation for lambda Kx merge node 96. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode96Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hYOZ : 2*Yx*Zx+2*Yy*Zy-Zx^2-Zy^2 = 0)
    : lambdaKxFineNode96Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode32Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hYOZ
  have hright := lambdaKxFineNode33Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hYOZ
  rw [lambdaKxBucketMerge96Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode96Zero

#eval IO.println "lambda Kx fine node 96: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
