import LambdaKxFine.N089MergePart00

import LambdaKxFine.N088Zero

import LambdaKxFine.N087Zero

/-! Zero propagation for lambda Kx merge node 89. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode89Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hFKZ : 2*Fx*Zx+2*Fy*Zy-2*Fx*Kx-2*Fy*Ky-Zx^2-Zy^2+2*Kx = 0)
    : lambdaKxFineNode89Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode88Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFKZ
  have hright := lambdaKxFineNode87Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFKZ
  rw [lambdaKxBucketMerge89Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode89Zero

#eval IO.println "lambda Kx fine node 89: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
