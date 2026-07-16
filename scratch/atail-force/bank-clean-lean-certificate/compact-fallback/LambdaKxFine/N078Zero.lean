import LambdaKxFine.N078MergePart00

import LambdaKxFine.N008Zero

import LambdaKxFine.N009Zero

/-! Zero propagation for lambda Kx merge node 78. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode78Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hFAK : 2*Fx*Kx-2*Fx+2*Fy*Ky-2*Kx+1 = 0)
    : lambdaKxFineNode78Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode8Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFAK
  have hright := lambdaKxFineNode9Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFAK
  rw [lambdaKxBucketMerge78Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode78Zero

#eval IO.println "lambda Kx fine node 78: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
