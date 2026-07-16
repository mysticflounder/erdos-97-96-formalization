import LambdaKxFine.N130MergePart00

import LambdaKxFine.N090Zero

import LambdaKxFine.N093Zero

/-! Zero propagation for lambda Kx merge node 130. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode130Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hGXK : 4*Kx*Ky*Xy-2*Kx-4*Ky^2*Xx+4*Ky^2-4*Ky*Xy+Xx^2+Xy^2 = 0)
    (hXF : -Fx^2-Fy^2+2*Fx*Xx+2*Fy*Xy-Xx^2-Xy^2+2*Kx = 0)
    : lambdaKxFineNode130Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode90Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hGXK
  have hright := lambdaKxFineNode93Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hXF
  rw [lambdaKxBucketMerge130Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode130Zero

#eval IO.println "lambda Kx fine node 130: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
