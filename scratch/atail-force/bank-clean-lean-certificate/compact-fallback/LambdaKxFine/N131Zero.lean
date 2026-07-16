import LambdaKxFine.N131MergePart00

import LambdaKxFine.N092Zero

import LambdaKxFine.N095Zero

/-! Zero propagation for lambda Kx merge node 131. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode131Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hXZ : Xx^2+Xy^2-2*Xx*Zx-2*Xy*Zy+Zx^2+Zy^2-2*Kx = 0)
    (hYOX : -Xx^2+2*Xx*Yx-Xy^2+2*Xy*Yy = 0)
    : lambdaKxFineNode131Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode92Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hXZ
  have hright := lambdaKxFineNode95Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hYOX
  rw [lambdaKxBucketMerge131Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode131Zero

#eval IO.println "lambda Kx fine node 131: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
