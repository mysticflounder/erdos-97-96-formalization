import LambdaKxFine.N087MergePart00

import LambdaKxFine.N020Zero

import LambdaKxFine.N021Zero

/-! Zero propagation for lambda Kx merge node 87. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

theorem lambdaKxFineNode87Zero (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
    (hFKZ : 2*Fx*Zx+2*Fy*Zy-2*Fx*Kx-2*Fy*Ky-Zx^2-Zy^2+2*Kx = 0)
    : lambdaKxFineNode87Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx = 0 := by
  have hleft := lambdaKxFineNode20Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFKZ
  have hright := lambdaKxFineNode21Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hFKZ
  rw [lambdaKxBucketMerge87Value Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx, hleft, hright]
  norm_num

#print axioms lambdaKxFineNode87Zero

#eval IO.println "lambda Kx fine node 87: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
