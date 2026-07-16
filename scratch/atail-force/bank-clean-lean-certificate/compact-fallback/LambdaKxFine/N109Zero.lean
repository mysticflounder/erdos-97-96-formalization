import LambdaKxFine.N109MergePart00

import LambdaKxFine.N048Zero

import LambdaKxFine.N049Zero

/-! Zero propagation for lambda Kx merge node 109. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode109Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hREFLECT_X : Yx-2*Ky^2-2*L*(Zy-Ky) = 0)
    : lambdaKxFineNode109Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode48Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_X
  have hright := lambdaKxFineNode49Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_X
  rw [lambdaKxBucketMerge109Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode109Zero

#eval IO.println "lambda Kx fine node 109: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
