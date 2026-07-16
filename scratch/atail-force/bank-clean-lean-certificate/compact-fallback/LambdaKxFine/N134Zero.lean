import LambdaKxFine.N134MergePart00

import LambdaKxFine.N102Zero

import LambdaKxFine.N108Zero

/-! Zero propagation for lambda Kx merge node 134. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode134Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hZAG : -4*Kx*Ky*Zy+4*Ky^2*Zx-4*Ky^2+4*Ky*Zy-2*Zx+1 = 0)
    (hLDEF : L*(-2*Kx*Zx+2*Kx-2*Ky*Zy+Zx^2+Zy^2)-(2*Kx*Ky-2*Kx*Ky*Zx+Kx*Zy-2*Ky^2*Zy+Ky*Zx) = 0)
    : lambdaKxFineNode134Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode102Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hZAG
  have hright := lambdaKxFineNode108Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hLDEF
  rw [lambdaKxBucketMerge134Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode134Zero

#eval IO.println "lambda Kx fine node 134: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
