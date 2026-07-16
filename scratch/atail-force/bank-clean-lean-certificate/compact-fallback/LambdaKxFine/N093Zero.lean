import LambdaKxFine.N093MergePart00

import LambdaKxFine.N027Zero

import LambdaKxFine.N028Zero

/-! Zero propagation for lambda Kx merge node 93. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode93Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hXF : -Fx^2-Fy^2+2*Fx*Xx+2*Fy*Xy-Xx^2-Xy^2+2*Kx = 0)
    : lambdaKxFineNode93Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode27Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hXF
  have hright := lambdaKxFineNode28Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hXF
  rw [lambdaKxBucketMerge93Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode93Zero

#eval IO.println "lambda Kx fine node 93: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
