import LambdaKxFine.N092MergePart00

import LambdaKxFine.N091Zero

import LambdaKxFine.N026Zero

/-! Zero propagation for lambda Kx merge node 92. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode92Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hXZ : Xx^2+Xy^2-2*Xx*Zx-2*Xy*Zy+Zx^2+Zy^2-2*Kx = 0)
    : lambdaKxFineNode92Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode91Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hXZ
  have hright := lambdaKxFineNode26Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hXZ
  rw [lambdaKxBucketMerge92Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode92Zero

#eval IO.println "lambda Kx fine node 92: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
