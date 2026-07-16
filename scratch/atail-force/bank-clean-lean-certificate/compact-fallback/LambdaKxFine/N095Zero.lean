import LambdaKxFine.N095MergePart00

import LambdaKxFine.N094Zero

import LambdaKxFine.N031Zero

/-! Zero propagation for lambda Kx merge node 95. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode95Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hYOX : -Xx^2+2*Xx*Yx-Xy^2+2*Xy*Yy = 0)
    : lambdaKxFineNode95Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode94Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hYOX
  have hright := lambdaKxFineNode31Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hYOX
  rw [lambdaKxBucketMerge95Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode95Zero

#eval IO.println "lambda Kx fine node 95: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
