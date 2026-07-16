import LambdaKxFine.N140MergePart00

import LambdaKxFine.N138Zero

import LambdaKxFine.N139Zero

/-! Zero propagation for lambda Kx merge node 140. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode140Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hAOK : -Kx^2+2*Kx-Ky^2 = 0)
    (hFAK : 2*Fx*Kx-2*Fx+2*Fy*Ky-2*Kx+1 = 0)
    (hFKZ : 2*Fx*Zx+2*Fy*Zy-2*Fx*Kx-2*Fy*Ky-Zx^2-Zy^2+2*Kx = 0)
    (hGXK : 4*Kx*Ky*Xy-2*Kx-4*Ky^2*Xx+4*Ky^2-4*Ky*Xy+Xx^2+Xy^2 = 0)
    (hXZ : Xx^2+Xy^2-2*Xx*Zx-2*Xy*Zy+Zx^2+Zy^2-2*Kx = 0)
    (hXF : -Fx^2-Fy^2+2*Fx*Xx+2*Fy*Xy-Xx^2-Xy^2+2*Kx = 0)
    (hYOX : -Xx^2+2*Xx*Yx-Xy^2+2*Xy*Yy = 0)
    (hYOZ : 2*Yx*Zx+2*Yy*Zy-Zx^2-Zy^2 = 0)
    (hZAG : -4*Kx*Ky*Zy+4*Ky^2*Zx-4*Ky^2+4*Ky*Zy-2*Zx+1 = 0)
    (hLDEF : L*(-2*Kx*Zx+2*Kx-2*Ky*Zy+Zx^2+Zy^2)-(2*Kx*Ky-2*Kx*Ky*Zx+Kx*Zy-2*Ky^2*Zy+Ky*Zx) = 0)
    (hREFLECT_X : Yx-2*Ky^2-2*L*(Zy-Ky) = 0)
    (hREFLECT_Y : Yy-2*Ky*(1-Kx)+2*L*(Zx-Kx) = 0)
    : lambdaKxFineNode140Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode138Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK hFAK hREFLECT_X
  have hright := lambdaKxFineNode139Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFKZ hGXK hXZ hXF hYOX hYOZ hZAG hLDEF hREFLECT_Y
  rw [lambdaKxBucketMerge140Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode140Zero

#eval IO.println "lambda Kx fine node 140: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
