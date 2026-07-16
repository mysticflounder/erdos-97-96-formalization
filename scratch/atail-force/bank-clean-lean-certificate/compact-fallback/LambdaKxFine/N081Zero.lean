import LambdaKxFine.N081MergePart00

import LambdaKxFine.N014Zero

import LambdaKxFine.N015Zero

/-! Zero propagation for lambda Kx merge node 81. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode81Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hFAK : 2*Fx*Kx-2*Fx+2*Fy*Ky-2*Kx+1 = 0)
    : lambdaKxFineNode81Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode14Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFAK
  have hright := lambdaKxFineNode15Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFAK
  rw [lambdaKxBucketMerge81Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode81Zero

#eval IO.println "lambda Kx fine node 81: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
