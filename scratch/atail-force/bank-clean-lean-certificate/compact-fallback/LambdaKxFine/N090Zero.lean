import LambdaKxFine.N090MergePart00

import LambdaKxFine.N022Zero

import LambdaKxFine.N023Zero

/-! Zero propagation for lambda Kx merge node 90. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode90Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hGXK : 4*Kx*Ky*Xy-2*Kx-4*Ky^2*Xx+4*Ky^2-4*Ky*Xy+Xx^2+Xy^2 = 0)
    : lambdaKxFineNode90Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode22Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hGXK
  have hright := lambdaKxFineNode23Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hGXK
  rw [lambdaKxBucketMerge90Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode90Zero

#eval IO.println "lambda Kx fine node 90: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
