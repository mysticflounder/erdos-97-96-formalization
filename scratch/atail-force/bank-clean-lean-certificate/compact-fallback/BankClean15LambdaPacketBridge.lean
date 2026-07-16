import BankCleanFirstBranchSmoke
import LambdaGenericAdapter

/-!
# Checked bridge from the normalized fifteen-row core to a lambda packet

This module isolates the branch reduction and denominator-clearing adapter
from the generated rational certificate.
-/

namespace Problem97.ATailBankClean15LambdaPacketBridgeScratch

theorem exists_lambda_packet_of_bank_clean_15_rows
    {Ex Ey Fx Fy Gx Gy Kx Ky Xx Xy Yx Yy Zx Zy : ℝ}
    (hAOG : -Gx ^ 2 + 2 * Gx - Gy ^ 2 = 0)
    (hAOK : -Kx ^ 2 + 2 * Kx - Ky ^ 2 = 0)
    (hFAZ : 2 * Fx * Zx - 2 * Fx + 2 * Fy * Zy - Zx ^ 2 - Zy ^ 2 + 1 = 0)
    (hFAK : 2 * Fx * Kx - 2 * Fx + 2 * Fy * Ky - Kx ^ 2 - Ky ^ 2 + 1 = 0)
    (hGXE : -Ex ^ 2 + 2 * Ex * Gx - Ey ^ 2 + 2 * Ey * Gy -
      2 * Gx * Xx - 2 * Gy * Xy + Xx ^ 2 + Xy ^ 2 = 0)
    (hGXK : 2 * Gx * Kx - 2 * Gx * Xx + 2 * Gy * Ky -
      2 * Gy * Xy - Kx ^ 2 - Ky ^ 2 + Xx ^ 2 + Xy ^ 2 = 0)
    (hKOY : 2 * Kx * Yx + 2 * Ky * Yy - Yx ^ 2 - Yy ^ 2 = 0)
    (hKOG : -Gx ^ 2 + 2 * Gx * Kx - Gy ^ 2 + 2 * Gy * Ky = 0)
    (hOAE : -Ex ^ 2 - Ey ^ 2 + 1 = 0)
    (hXZG : -Gx ^ 2 + 2 * Gx * Xx - Gy ^ 2 + 2 * Gy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hXZF : -Fx ^ 2 + 2 * Fx * Xx - Fy ^ 2 + 2 * Fy * Xy -
      2 * Xx * Zx - 2 * Xy * Zy + Zx ^ 2 + Zy ^ 2 = 0)
    (hYOX : -Xx ^ 2 + 2 * Xx * Yx - Xy ^ 2 + 2 * Xy * Yy = 0)
    (hYOZ : 2 * Yx * Zx + 2 * Yy * Zy - Zx ^ 2 - Zy ^ 2 = 0)
    (hZAY : -Yx ^ 2 + 2 * Yx * Zx - Yy ^ 2 + 2 * Yy * Zy -
      2 * Zx + 1 = 0)
    (hZAG : -Gx ^ 2 + 2 * Gx * Zx - Gy ^ 2 + 2 * Gy * Zy -
      2 * Zx + 1 = 0) :
    ∃ L,
      Problem97.ATailBankCleanGenericAdapterScratch.LambdaPacket
        L Fx Fy Kx Ky Xx Xy Yx Yy Zx Zy := by
  rcases
      Problem97.ATailBankCleanCompactScratch.bank_clean_core_forces_generic_double_reflection
        hAOG hAOK hFAZ hFAK hGXE hGXK hKOY hKOG hOAE hXZG hXZF hYOX
        hYOZ hZAY hZAG with
    ⟨hGx, hGy, hKZne, _hYGne, hReflectX, hReflectY⟩
  exact
    Problem97.ATailBankCleanGenericAdapterScratch.exists_lambdaPacket_of_generic_double_reflection
      hGx hGy hKZne hReflectX hReflectY hAOK hFAZ hFAK hGXK hXZG hXZF
      hYOX hYOZ hZAG

#print axioms exists_lambda_packet_of_bank_clean_15_rows

end Problem97.ATailBankClean15LambdaPacketBridgeScratch
