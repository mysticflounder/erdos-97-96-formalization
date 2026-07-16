import LambdaKxFine.N112MergePart00

import LambdaKxFine.N054Zero

import LambdaKxFine.N055Zero

/-! Zero propagation for lambda Kx merge node 112. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode112Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hREFLECT_X : Yx-2*Ky^2-2*L*(Zy-Ky) = 0)
    : lambdaKxFineNode112Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode54Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_X
  have hright := lambdaKxFineNode55Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_X
  rw [lambdaKxBucketMerge112Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode112Zero

#eval IO.println "lambda Kx fine node 112: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
