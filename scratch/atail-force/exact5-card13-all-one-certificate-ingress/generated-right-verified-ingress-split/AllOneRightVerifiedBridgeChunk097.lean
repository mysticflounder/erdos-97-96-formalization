/-
Generated packed-source bridge for verified right chunk 097.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk097_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6208 : ((!((rankAtom ranks 54 == rankAtom ranks 69)) || ((rankAtom ranks 34).ult (rankAtom ranks 37)))) = true)
    (h6209 : ((!((rankAtom ranks 37 == rankAtom ranks 39)) || ((rankAtom ranks 52).ult (rankAtom ranks 54)))) = true)
    (h6210 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 39).ult (rankAtom ranks 54)))) = true)
    (h6211 : ((!((rankAtom ranks 54 == rankAtom ranks 39)) || ((rankAtom ranks 52).ult (rankAtom ranks 37)))) = true)
    (h6212 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 39).ult (rankAtom ranks 37)))) = true)
    (h6213 : ((!((rankAtom ranks 37 == rankAtom ranks 34)) || ((rankAtom ranks 70).ult (rankAtom ranks 55)))) = true)
    (h6214 : ((!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 34).ult (rankAtom ranks 55)))) = true)
    (h6215 : ((!((rankAtom ranks 55 == rankAtom ranks 34)) || ((rankAtom ranks 70).ult (rankAtom ranks 37)))) = true)
    (h6216 : ((!((rankAtom ranks 55 == rankAtom ranks 70)) || ((rankAtom ranks 34).ult (rankAtom ranks 37)))) = true)
    (h6217 : ((!((rankAtom ranks 37 == rankAtom ranks 40)) || ((rankAtom ranks 52).ult (rankAtom ranks 55)))) = true)
    (h6218 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 40).ult (rankAtom ranks 55)))) = true)
    (h6219 : ((!((rankAtom ranks 55 == rankAtom ranks 40)) || ((rankAtom ranks 52).ult (rankAtom ranks 37)))) = true)
    (h6220 : ((!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 40).ult (rankAtom ranks 37)))) = true)
    (h6221 : ((!((rankAtom ranks 37 == rankAtom ranks 34)) || ((rankAtom ranks 71).ult (rankAtom ranks 56)))) = true)
    (h6222 : ((!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 34).ult (rankAtom ranks 56)))) = true)
    (h6223 : ((!((rankAtom ranks 56 == rankAtom ranks 34)) || ((rankAtom ranks 71).ult (rankAtom ranks 37)))) = true)
    (h6224 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 41).ult (rankAtom ranks 56)))) = true)
    (h6225 : ((!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 41).ult (rankAtom ranks 37)))) = true)
    (h6226 : ((!((rankAtom ranks 38 == rankAtom ranks 72)) || ((rankAtom ranks 34).ult (rankAtom ranks 54)))) = true)
    (h6227 : ((!((rankAtom ranks 54 == rankAtom ranks 34)) || ((rankAtom ranks 72).ult (rankAtom ranks 38)))) = true)
    (h6228 : ((!((rankAtom ranks 54 == rankAtom ranks 72)) || ((rankAtom ranks 34).ult (rankAtom ranks 38)))) = true)
    (h6229 : ((!((rankAtom ranks 38 == rankAtom ranks 53)) || ((rankAtom ranks 39).ult (rankAtom ranks 54)))) = true)
    (h6230 : ((!((rankAtom ranks 54 == rankAtom ranks 39)) || ((rankAtom ranks 53).ult (rankAtom ranks 38)))) = true)
    (h6231 : ((!((rankAtom ranks 54 == rankAtom ranks 53)) || ((rankAtom ranks 39).ult (rankAtom ranks 38)))) = true)
    (h6232 : ((!((rankAtom ranks 38 == rankAtom ranks 34)) || ((rankAtom ranks 73).ult (rankAtom ranks 55)))) = true)
    (h6233 : ((!((rankAtom ranks 38 == rankAtom ranks 73)) || ((rankAtom ranks 34).ult (rankAtom ranks 55)))) = true)
    (h6234 : ((!((rankAtom ranks 55 == rankAtom ranks 34)) || ((rankAtom ranks 73).ult (rankAtom ranks 38)))) = true)
    (h6235 : ((!((rankAtom ranks 55 == rankAtom ranks 73)) || ((rankAtom ranks 34).ult (rankAtom ranks 38)))) = true)
    (h6236 : ((!((rankAtom ranks 38 == rankAtom ranks 40)) || ((rankAtom ranks 53).ult (rankAtom ranks 55)))) = true)
    (h6237 : ((!((rankAtom ranks 38 == rankAtom ranks 53)) || ((rankAtom ranks 40).ult (rankAtom ranks 55)))) = true)
    (h6238 : ((!((rankAtom ranks 55 == rankAtom ranks 40)) || ((rankAtom ranks 53).ult (rankAtom ranks 38)))) = true)
    (h6239 : ((!((rankAtom ranks 55 == rankAtom ranks 53)) || ((rankAtom ranks 40).ult (rankAtom ranks 38)))) = true)
    (h6240 : ((!((rankAtom ranks 38 == rankAtom ranks 74)) || ((rankAtom ranks 34).ult (rankAtom ranks 56)))) = true)
    (h6241 : ((!((rankAtom ranks 56 == rankAtom ranks 34)) || ((rankAtom ranks 74).ult (rankAtom ranks 38)))) = true)
    (h6242 : ((!((rankAtom ranks 38 == rankAtom ranks 41)) || ((rankAtom ranks 53).ult (rankAtom ranks 56)))) = true)
    (h6243 : ((!((rankAtom ranks 38 == rankAtom ranks 53)) || ((rankAtom ranks 41).ult (rankAtom ranks 56)))) = true)
    (h6244 : ((!((rankAtom ranks 56 == rankAtom ranks 53)) || ((rankAtom ranks 41).ult (rankAtom ranks 38)))) = true)
    (h6245 : ((!((rankAtom ranks 39 == rankAtom ranks 75)) || ((rankAtom ranks 34).ult (rankAtom ranks 55)))) = true)
    (h6246 : ((!((rankAtom ranks 55 == rankAtom ranks 34)) || ((rankAtom ranks 75).ult (rankAtom ranks 39)))) = true)
    (h6247 : ((!((rankAtom ranks 55 == rankAtom ranks 75)) || ((rankAtom ranks 34).ult (rankAtom ranks 39)))) = true)
    (h6248 : ((!((rankAtom ranks 39 == rankAtom ranks 40)) || ((rankAtom ranks 54).ult (rankAtom ranks 55)))) = true)
    (h6249 : ((!((rankAtom ranks 39 == rankAtom ranks 54)) || ((rankAtom ranks 40).ult (rankAtom ranks 55)))) = true)
    (h6250 : ((!((rankAtom ranks 55 == rankAtom ranks 40)) || ((rankAtom ranks 54).ult (rankAtom ranks 39)))) = true)
    (h6251 : ((!((rankAtom ranks 55 == rankAtom ranks 54)) || ((rankAtom ranks 40).ult (rankAtom ranks 39)))) = true)
    (h6252 : ((!((rankAtom ranks 39 == rankAtom ranks 76)) || ((rankAtom ranks 34).ult (rankAtom ranks 56)))) = true)
    (h6253 : ((!((rankAtom ranks 56 == rankAtom ranks 34)) || ((rankAtom ranks 76).ult (rankAtom ranks 39)))) = true)
    (h6254 : ((!((rankAtom ranks 39 == rankAtom ranks 41)) || ((rankAtom ranks 54).ult (rankAtom ranks 56)))) = true)
    (h6255 : ((!((rankAtom ranks 39 == rankAtom ranks 54)) || ((rankAtom ranks 41).ult (rankAtom ranks 56)))) = true)
    (h6256 : ((!((rankAtom ranks 56 == rankAtom ranks 54)) || ((rankAtom ranks 41).ult (rankAtom ranks 39)))) = true)
    (h6257 : ((!((rankAtom ranks 40 == rankAtom ranks 77)) || ((rankAtom ranks 34).ult (rankAtom ranks 56)))) = true)
    (h6258 : ((!((rankAtom ranks 40 == rankAtom ranks 41)) || ((rankAtom ranks 55).ult (rankAtom ranks 56)))) = true)
    (h6259 : ((!((rankAtom ranks 40 == rankAtom ranks 55)) || ((rankAtom ranks 41).ult (rankAtom ranks 56)))) = true)
    (h6260 : ((!((rankAtom ranks 56 == rankAtom ranks 55)) || ((rankAtom ranks 41).ult (rankAtom ranks 40)))) = true)
    (h6261 : ((!((rankAtom ranks 36 == rankAtom ranks 35)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h6262 : ((!((rankAtom ranks 58 == rankAtom ranks 35)) || ((rankAtom ranks 63).ult (rankAtom ranks 36)))) = true)
    (h6263 : ((!((rankAtom ranks 36 == rankAtom ranks 37)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h6264 : ((!((rankAtom ranks 36 == rankAtom ranks 57)) || ((rankAtom ranks 37).ult (rankAtom ranks 58)))) = true)
    (h6265 : ((!((rankAtom ranks 58 == rankAtom ranks 37)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h6266 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 37).ult (rankAtom ranks 36)))) = true)
    (h6267 : ((!((rankAtom ranks 36 == rankAtom ranks 35)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h6268 : ((!((rankAtom ranks 36 == rankAtom ranks 64)) || ((rankAtom ranks 35).ult (rankAtom ranks 59)))) = true)
    (h6269 : ((!((rankAtom ranks 59 == rankAtom ranks 35)) || ((rankAtom ranks 64).ult (rankAtom ranks 36)))) = true)
    (h6270 : ((!((rankAtom ranks 59 == rankAtom ranks 64)) || ((rankAtom ranks 35).ult (rankAtom ranks 36)))) = true)
    (h6271 : ((!((rankAtom ranks 36 == rankAtom ranks 38)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true) :
    ∀ item ∈ sourceChunk097Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk097Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6208
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6209
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6210
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6211
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6212
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6213
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6214
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6215
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6216
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6217
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6218
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6219
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6220
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6221
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6222
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6223
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6224
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6225
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6226
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6227
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6228
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6229
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6230
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6231
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6232
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6233
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6234
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6235
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6236
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6237
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6238
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6239
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6240
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6241
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6242
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6243
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6244
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6245
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6246
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6247
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6248
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6249
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6250
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6251
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6252
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6253
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6254
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6255
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6256
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6257
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6258
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6259
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6260
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6261
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6262
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6263
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6264
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6265
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6266
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6267
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6268
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6269
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6270
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6271

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
