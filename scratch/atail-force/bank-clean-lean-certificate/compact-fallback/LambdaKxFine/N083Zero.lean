import LambdaKxFine.N083MergePart00

import LambdaKxFine.N080Zero

import LambdaKxFine.N081Zero

/-! Zero propagation for lambda Kx merge node 83. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode83Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hFAK : 2*Fx*Kx-2*Fx+2*Fy*Ky-2*Kx+1 = 0)
    : lambdaKxFineNode83Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode80Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFAK
  have hright := lambdaKxFineNode81Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFAK
  rw [lambdaKxBucketMerge83Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode83Zero

#eval IO.println "lambda Kx fine node 83: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
