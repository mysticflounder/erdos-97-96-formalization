import LambdaKxFine.N097MergePart00

import LambdaKxFine.N034Zero

import LambdaKxFine.N035Zero

/-! Zero propagation for lambda Kx merge node 97. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode97Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hYOZ : 2*Yx*Zx+2*Yy*Zy-Zx^2-Zy^2 = 0)
    : lambdaKxFineNode97Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode34Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hYOZ
  have hright := lambdaKxFineNode35Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hYOZ
  rw [lambdaKxBucketMerge97Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode97Zero

#eval IO.println "lambda Kx fine node 97: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
