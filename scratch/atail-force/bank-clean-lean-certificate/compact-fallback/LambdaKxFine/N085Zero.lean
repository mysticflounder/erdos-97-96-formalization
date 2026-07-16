import LambdaKxFine.N085MergePart00

import LambdaKxFine.N016Zero

import LambdaKxFine.N017Zero

/-! Zero propagation for lambda Kx merge node 85. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode85Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hFKZ : 2*Fx*Zx+2*Fy*Zy-2*Fx*Kx-2*Fy*Ky-Zx^2-Zy^2+2*Kx = 0)
    : lambdaKxFineNode85Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode16Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFKZ
  have hright := lambdaKxFineNode17Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFKZ
  rw [lambdaKxBucketMerge85Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode85Zero

#eval IO.println "lambda Kx fine node 85: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
