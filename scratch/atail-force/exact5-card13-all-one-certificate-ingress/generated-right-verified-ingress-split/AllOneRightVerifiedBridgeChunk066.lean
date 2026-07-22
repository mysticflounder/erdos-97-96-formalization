/-
Generated packed-source bridge for verified right chunk 066.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk066_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4224 : ((!((rankAtom ranks 9 == rankAtom ranks 75)) || ((rankAtom ranks 7).ult (rankAtom ranks 70)))) = true)
    (h4225 : ((!((rankAtom ranks 70 == rankAtom ranks 75)) || ((rankAtom ranks 7).ult (rankAtom ranks 9)))) = true)
    (h4226 : ((!((rankAtom ranks 9 == rankAtom ranks 10)) || ((rankAtom ranks 69).ult (rankAtom ranks 70)))) = true)
    (h4227 : ((!((rankAtom ranks 9 == rankAtom ranks 69)) || ((rankAtom ranks 10).ult (rankAtom ranks 70)))) = true)
    (h4228 : ((!((rankAtom ranks 70 == rankAtom ranks 10)) || ((rankAtom ranks 69).ult (rankAtom ranks 9)))) = true)
    (h4229 : ((!((rankAtom ranks 9 == rankAtom ranks 76)) || ((rankAtom ranks 7).ult (rankAtom ranks 71)))) = true)
    (h4230 : ((!((rankAtom ranks 9 == rankAtom ranks 11)) || ((rankAtom ranks 69).ult (rankAtom ranks 71)))) = true)
    (h4231 : ((!((rankAtom ranks 9 == rankAtom ranks 69)) || ((rankAtom ranks 11).ult (rankAtom ranks 71)))) = true)
    (h4232 : ((!((rankAtom ranks 10 == rankAtom ranks 77)) || ((rankAtom ranks 7).ult (rankAtom ranks 71)))) = true)
    (h4233 : ((!((rankAtom ranks 10 == rankAtom ranks 11)) || ((rankAtom ranks 70).ult (rankAtom ranks 71)))) = true)
    (h4234 : ((!((rankAtom ranks 10 == rankAtom ranks 70)) || ((rankAtom ranks 11).ult (rankAtom ranks 71)))) = true)
    (h4235 : ((!((rankAtom ranks 9 == rankAtom ranks 75)) || ((rankAtom ranks 8).ult (rankAtom ranks 73)))) = true)
    (h4236 : ((!((rankAtom ranks 73 == rankAtom ranks 8)) || ((rankAtom ranks 75).ult (rankAtom ranks 9)))) = true)
    (h4237 : ((!((rankAtom ranks 73 == rankAtom ranks 75)) || ((rankAtom ranks 8).ult (rankAtom ranks 9)))) = true)
    (h4238 : ((!((rankAtom ranks 9 == rankAtom ranks 10)) || ((rankAtom ranks 72).ult (rankAtom ranks 73)))) = true)
    (h4239 : ((!((rankAtom ranks 9 == rankAtom ranks 72)) || ((rankAtom ranks 10).ult (rankAtom ranks 73)))) = true)
    (h4240 : ((!((rankAtom ranks 73 == rankAtom ranks 10)) || ((rankAtom ranks 72).ult (rankAtom ranks 9)))) = true)
    (h4241 : ((!((rankAtom ranks 73 == rankAtom ranks 72)) || ((rankAtom ranks 10).ult (rankAtom ranks 9)))) = true)
    (h4242 : ((!((rankAtom ranks 9 == rankAtom ranks 76)) || ((rankAtom ranks 8).ult (rankAtom ranks 74)))) = true)
    (h4243 : ((!((rankAtom ranks 74 == rankAtom ranks 8)) || ((rankAtom ranks 76).ult (rankAtom ranks 9)))) = true)
    (h4244 : ((!((rankAtom ranks 9 == rankAtom ranks 11)) || ((rankAtom ranks 72).ult (rankAtom ranks 74)))) = true)
    (h4245 : ((!((rankAtom ranks 9 == rankAtom ranks 72)) || ((rankAtom ranks 11).ult (rankAtom ranks 74)))) = true)
    (h4246 : ((!((rankAtom ranks 74 == rankAtom ranks 72)) || ((rankAtom ranks 11).ult (rankAtom ranks 9)))) = true)
    (h4247 : ((!((rankAtom ranks 10 == rankAtom ranks 77)) || ((rankAtom ranks 8).ult (rankAtom ranks 74)))) = true)
    (h4248 : ((!((rankAtom ranks 74 == rankAtom ranks 8)) || ((rankAtom ranks 77).ult (rankAtom ranks 10)))) = true)
    (h4249 : ((!((rankAtom ranks 10 == rankAtom ranks 11)) || ((rankAtom ranks 73).ult (rankAtom ranks 74)))) = true)
    (h4250 : ((!((rankAtom ranks 10 == rankAtom ranks 73)) || ((rankAtom ranks 11).ult (rankAtom ranks 74)))) = true)
    (h4251 : ((!((rankAtom ranks 74 == rankAtom ranks 73)) || ((rankAtom ranks 11).ult (rankAtom ranks 10)))) = true)
    (h4252 : ((!((rankAtom ranks 10 == rankAtom ranks 77)) || ((rankAtom ranks 9).ult (rankAtom ranks 76)))) = true)
    (h4253 : ((!((rankAtom ranks 76 == rankAtom ranks 9)) || ((rankAtom ranks 77).ult (rankAtom ranks 10)))) = true)
    (h4254 : ((!((rankAtom ranks 10 == rankAtom ranks 75)) || ((rankAtom ranks 11).ult (rankAtom ranks 76)))) = true)
    (h4255 : ((!((rankAtom ranks 76 == rankAtom ranks 75)) || ((rankAtom ranks 11).ult (rankAtom ranks 10)))) = true)
    (h4256 : ((!((rankAtom ranks 24 == rankAtom ranks 12)) || ((rankAtom ranks 33).ult (rankAtom ranks 13)))) = true)
    (h4257 : ((!((rankAtom ranks 13 == rankAtom ranks 14)) || ((rankAtom ranks 23).ult (rankAtom ranks 24)))) = true)
    (h4258 : ((!((rankAtom ranks 24 == rankAtom ranks 23)) || ((rankAtom ranks 14).ult (rankAtom ranks 13)))) = true)
    (h4259 : ((!((rankAtom ranks 25 == rankAtom ranks 12)) || ((rankAtom ranks 34).ult (rankAtom ranks 13)))) = true)
    (h4260 : ((!((rankAtom ranks 13 == rankAtom ranks 15)) || ((rankAtom ranks 23).ult (rankAtom ranks 25)))) = true)
    (h4261 : ((!((rankAtom ranks 25 == rankAtom ranks 23)) || ((rankAtom ranks 15).ult (rankAtom ranks 13)))) = true)
    (h4262 : ((!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 35).ult (rankAtom ranks 13)))) = true)
    (h4263 : ((!((rankAtom ranks 13 == rankAtom ranks 16)) || ((rankAtom ranks 23).ult (rankAtom ranks 26)))) = true)
    (h4264 : ((!((rankAtom ranks 26 == rankAtom ranks 23)) || ((rankAtom ranks 16).ult (rankAtom ranks 13)))) = true)
    (h4265 : ((!((rankAtom ranks 13 == rankAtom ranks 17)) || ((rankAtom ranks 23).ult (rankAtom ranks 27)))) = true)
    (h4266 : ((!((rankAtom ranks 27 == rankAtom ranks 23)) || ((rankAtom ranks 17).ult (rankAtom ranks 13)))) = true)
    (h4267 : ((!((rankAtom ranks 13 == rankAtom ranks 12)) || ((rankAtom ranks 37).ult (rankAtom ranks 28)))) = true)
    (h4268 : ((!((rankAtom ranks 13 == rankAtom ranks 37)) || ((rankAtom ranks 12).ult (rankAtom ranks 28)))) = true)
    (h4269 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 37).ult (rankAtom ranks 13)))) = true)
    (h4270 : ((!((rankAtom ranks 28 == rankAtom ranks 37)) || ((rankAtom ranks 12).ult (rankAtom ranks 13)))) = true)
    (h4271 : ((!((rankAtom ranks 13 == rankAtom ranks 23)) || ((rankAtom ranks 18).ult (rankAtom ranks 28)))) = true)
    (h4272 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 23).ult (rankAtom ranks 13)))) = true)
    (h4273 : ((!((rankAtom ranks 28 == rankAtom ranks 23)) || ((rankAtom ranks 18).ult (rankAtom ranks 13)))) = true)
    (h4274 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 38).ult (rankAtom ranks 13)))) = true)
    (h4275 : ((!((rankAtom ranks 13 == rankAtom ranks 19)) || ((rankAtom ranks 23).ult (rankAtom ranks 29)))) = true)
    (h4276 : ((!((rankAtom ranks 29 == rankAtom ranks 23)) || ((rankAtom ranks 19).ult (rankAtom ranks 13)))) = true)
    (h4277 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 39).ult (rankAtom ranks 13)))) = true)
    (h4278 : ((!((rankAtom ranks 13 == rankAtom ranks 20)) || ((rankAtom ranks 23).ult (rankAtom ranks 30)))) = true)
    (h4279 : ((!((rankAtom ranks 30 == rankAtom ranks 23)) || ((rankAtom ranks 20).ult (rankAtom ranks 13)))) = true)
    (h4280 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 40).ult (rankAtom ranks 13)))) = true)
    (h4281 : ((!((rankAtom ranks 13 == rankAtom ranks 21)) || ((rankAtom ranks 23).ult (rankAtom ranks 31)))) = true)
    (h4282 : ((!((rankAtom ranks 31 == rankAtom ranks 23)) || ((rankAtom ranks 21).ult (rankAtom ranks 13)))) = true)
    (h4283 : ((!((rankAtom ranks 13 == rankAtom ranks 41)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h4284 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 41).ult (rankAtom ranks 13)))) = true)
    (h4285 : ((!((rankAtom ranks 13 == rankAtom ranks 22)) || ((rankAtom ranks 23).ult (rankAtom ranks 32)))) = true)
    (h4286 : ((!((rankAtom ranks 14 == rankAtom ranks 12)) || ((rankAtom ranks 42).ult (rankAtom ranks 25)))) = true)
    (h4287 : ((!((rankAtom ranks 25 == rankAtom ranks 12)) || ((rankAtom ranks 42).ult (rankAtom ranks 14)))) = true) :
    ∀ item ∈ sourceChunk066Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk066Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4224
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4225
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4226
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4227
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4228
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4229
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4230
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4231
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4232
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4233
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4234
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4235
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4236
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4237
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4238
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4239
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4240
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4241
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4242
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4243
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4244
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4245
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4246
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4247
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4248
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4249
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4250
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4251
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4252
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4253
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4254
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4255
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4256
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4257
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4258
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4259
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4260
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4261
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4262
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4263
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4264
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4265
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4266
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4267
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4268
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4269
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4270
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4271
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4272
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4273
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4274
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4275
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4276
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4277
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4278
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4279
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4280
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4281
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4282
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4283
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4284
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4285
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4286
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4287

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
