import LambdaKxFine.N117MergePart00

import LambdaKxFine.N114Zero

import LambdaKxFine.N115Zero

/-! Zero propagation for lambda Kx merge node 117. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode117Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hREFLECT_X : Yx-2*Ky^2-2*L*(Zy-Ky) = 0)
    : lambdaKxFineNode117Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode114Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_X
  have hright := lambdaKxFineNode115Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_X
  rw [lambdaKxBucketMerge117Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode117Zero

#eval IO.println "lambda Kx fine node 117: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
