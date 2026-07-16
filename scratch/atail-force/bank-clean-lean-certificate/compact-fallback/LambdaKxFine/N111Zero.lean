import LambdaKxFine.N111MergePart00

import LambdaKxFine.N052Zero

import LambdaKxFine.N053Zero

/-! Zero propagation for lambda Kx merge node 111. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode111Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hREFLECT_X : Yx-2*Ky^2-2*L*(Zy-Ky) = 0)
    : lambdaKxFineNode111Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode52Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_X
  have hright := lambdaKxFineNode53Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hREFLECT_X
  rw [lambdaKxBucketMerge111Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode111Zero

#eval IO.println "lambda Kx fine node 111: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
