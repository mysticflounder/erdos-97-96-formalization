import LambdaKxFine.N132MergePart00

import LambdaKxFine.N130Zero

import LambdaKxFine.N131Zero

/-! Zero propagation for lambda Kx merge node 132. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode132Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hGXK : 4*Kx*Ky*Xy-2*Kx-4*Ky^2*Xx+4*Ky^2-4*Ky*Xy+Xx^2+Xy^2 = 0)
    (hXZ : Xx^2+Xy^2-2*Xx*Zx-2*Xy*Zy+Zx^2+Zy^2-2*Kx = 0)
    (hXF : -Fx^2-Fy^2+2*Fx*Xx+2*Fy*Xy-Xx^2-Xy^2+2*Kx = 0)
    (hYOX : -Xx^2+2*Xx*Yx-Xy^2+2*Xy*Yy = 0)
    : lambdaKxFineNode132Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode130Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hGXK hXF
  have hright := lambdaKxFineNode131Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hXZ hYOX
  rw [lambdaKxBucketMerge132Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode132Zero

#eval IO.println "lambda Kx fine node 132: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
