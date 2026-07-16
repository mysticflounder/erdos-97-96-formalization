import LambdaKxFine.N140Zero

/-! Tiny terminal for the exact lambda Kx certificate. -/

namespace Problem97.ATailBankCleanLambdaKxFine

set_option maxHeartbeats 80000000

set_option maxRecDepth 100000

set_option linter.unusedVariables false

noncomputable section

#eval IO.println "lambda Kx fine terminal: root imported"

theorem lambda_kx_zero
    (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
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
    : Kx = 0 := by
  have hroot := lambdaKxFineNode140Zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK hFAK hFKZ hGXK hXZ hXF hYOX hYOZ hZAG hLDEF hREFLECT_X hREFLECT_Y
  simpa [lambdaKxFineNode140Value] using hroot

theorem generic_double_reflection_lambda_incompatible
    (Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx : ℝ)
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
    : False := by
  have hKx : Kx = 0 := lambda_kx_zero Ky Fx Fy Xy Zx Kx Yx Yy Zy L Xx hAOK hFAK hFKZ hGXK hXZ hXF hYOX hYOZ hZAG hLDEF hREFLECT_X hREFLECT_Y
  have hKy : Ky = 0 := by
    nlinarith [sq_nonneg Ky]
  have hGXK0 : Xx ^ 2 + Xy ^ 2 = 0 := by
    simpa [hKx, hKy] using hGXK
  have hXx : Xx = 0 := by
    nlinarith [sq_nonneg Xx, sq_nonneg Xy]
  have hXy : Xy = 0 := by
    nlinarith [sq_nonneg Xx, sq_nonneg Xy]
  have hXZ0 : Zx ^ 2 + Zy ^ 2 = 0 := by
    simpa [hKx, hXx, hXy] using hXZ
  have hZx : Zx = 0 := by
    nlinarith [sq_nonneg Zx, sq_nonneg Zy]
  have hZAG0 : -2 * Zx + 1 = 0 := by
    simpa [hKx, hKy] using hZAG
  nlinarith

#print axioms lambda_kx_zero

#print axioms generic_double_reflection_lambda_incompatible

#eval IO.println "lambda Kx fine terminal: checked"

end

end Problem97.ATailBankCleanLambdaKxFine
