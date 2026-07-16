import LambdaKxFine.N133MergePart00

import LambdaKxFine.N098Zero

import LambdaKxFine.N132Zero

/-! Zero propagation for lambda Kx merge node 133. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode133Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hGXK : 4*Kx*Ky*Xy-2*Kx-4*Ky^2*Xx+4*Ky^2-4*Ky*Xy+Xx^2+Xy^2 = 0)
    (hXZ : Xx^2+Xy^2-2*Xx*Zx-2*Xy*Zy+Zx^2+Zy^2-2*Kx = 0)
    (hXF : -Fx^2-Fy^2+2*Fx*Xx+2*Fy*Xy-Xx^2-Xy^2+2*Kx = 0)
    (hYOX : -Xx^2+2*Xx*Yx-Xy^2+2*Xy*Yy = 0)
    (hYOZ : 2*Yx*Zx+2*Yy*Zy-Zx^2-Zy^2 = 0)
    : lambdaKxFineNode133Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode98Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hYOZ
  have hright := lambdaKxFineNode132Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hGXK hXZ hXF hYOX
  rw [lambdaKxBucketMerge133Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode133Zero

#eval IO.println "lambda Kx fine node 133: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
