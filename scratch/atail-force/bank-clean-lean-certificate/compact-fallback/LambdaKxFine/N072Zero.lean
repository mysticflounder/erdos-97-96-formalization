import LambdaKxFine.N072MergePart00

import LambdaKxFine.N002Zero

import LambdaKxFine.N003Zero

/-! Zero propagation for lambda Kx merge node 72. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode72Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hAOK : -Kx^2+2*Kx-Ky^2 = 0)
    : lambdaKxFineNode72Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode2Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK
  have hright := lambdaKxFineNode3Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK
  rw [lambdaKxBucketMerge72Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode72Zero

#eval IO.println "lambda Kx fine node 72: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
