import LambdaKxFine.N076MergePart00

import LambdaKxFine.N073Zero

import LambdaKxFine.N074Zero

/-! Zero propagation for lambda Kx merge node 76. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode76Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hAOK : -Kx^2+2*Kx-Ky^2 = 0)
    : lambdaKxFineNode76Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode73Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK
  have hright := lambdaKxFineNode74Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK
  rw [lambdaKxBucketMerge76Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode76Zero

#eval IO.println "lambda Kx fine node 76: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
