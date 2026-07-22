/-
Generated packed-source bridge for verified left chunk 067.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk067_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4288 : ((!((rankAtom ranks 25 == rankAtom ranks 42)) || ((rankAtom ranks 12).ult (rankAtom ranks 14)))) = true)
    (h4289 : ((!((rankAtom ranks 14 == rankAtom ranks 15)) || ((rankAtom ranks 24).ult (rankAtom ranks 25)))) = true)
    (h4290 : ((!((rankAtom ranks 25 == rankAtom ranks 24)) || ((rankAtom ranks 15).ult (rankAtom ranks 14)))) = true)
    (h4291 : ((!((rankAtom ranks 14 == rankAtom ranks 12)) || ((rankAtom ranks 43).ult (rankAtom ranks 26)))) = true)
    (h4292 : ((!((rankAtom ranks 14 == rankAtom ranks 43)) || ((rankAtom ranks 12).ult (rankAtom ranks 26)))) = true)
    (h4293 : ((!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 43).ult (rankAtom ranks 14)))) = true)
    (h4294 : ((!((rankAtom ranks 26 == rankAtom ranks 43)) || ((rankAtom ranks 12).ult (rankAtom ranks 14)))) = true)
    (h4295 : ((!((rankAtom ranks 14 == rankAtom ranks 16)) || ((rankAtom ranks 24).ult (rankAtom ranks 26)))) = true)
    (h4296 : ((!((rankAtom ranks 26 == rankAtom ranks 24)) || ((rankAtom ranks 16).ult (rankAtom ranks 14)))) = true)
    (h4297 : ((!((rankAtom ranks 14 == rankAtom ranks 12)) || ((rankAtom ranks 44).ult (rankAtom ranks 27)))) = true)
    (h4298 : ((!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 44).ult (rankAtom ranks 14)))) = true)
    (h4299 : ((!((rankAtom ranks 14 == rankAtom ranks 17)) || ((rankAtom ranks 24).ult (rankAtom ranks 27)))) = true)
    (h4300 : ((!((rankAtom ranks 27 == rankAtom ranks 24)) || ((rankAtom ranks 17).ult (rankAtom ranks 14)))) = true)
    (h4301 : ((!((rankAtom ranks 14 == rankAtom ranks 12)) || ((rankAtom ranks 45).ult (rankAtom ranks 28)))) = true)
    (h4302 : ((!((rankAtom ranks 14 == rankAtom ranks 45)) || ((rankAtom ranks 12).ult (rankAtom ranks 28)))) = true)
    (h4303 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 45).ult (rankAtom ranks 14)))) = true)
    (h4304 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 12).ult (rankAtom ranks 14)))) = true)
    (h4305 : ((!((rankAtom ranks 14 == rankAtom ranks 18)) || ((rankAtom ranks 24).ult (rankAtom ranks 28)))) = true)
    (h4306 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 24).ult (rankAtom ranks 14)))) = true)
    (h4307 : ((!((rankAtom ranks 28 == rankAtom ranks 24)) || ((rankAtom ranks 18).ult (rankAtom ranks 14)))) = true)
    (h4308 : ((!((rankAtom ranks 14 == rankAtom ranks 12)) || ((rankAtom ranks 46).ult (rankAtom ranks 29)))) = true)
    (h4309 : ((!((rankAtom ranks 14 == rankAtom ranks 46)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) = true)
    (h4310 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 46).ult (rankAtom ranks 14)))) = true)
    (h4311 : ((!((rankAtom ranks 29 == rankAtom ranks 46)) || ((rankAtom ranks 12).ult (rankAtom ranks 14)))) = true)
    (h4312 : ((!((rankAtom ranks 14 == rankAtom ranks 19)) || ((rankAtom ranks 24).ult (rankAtom ranks 29)))) = true)
    (h4313 : ((!((rankAtom ranks 29 == rankAtom ranks 24)) || ((rankAtom ranks 19).ult (rankAtom ranks 14)))) = true)
    (h4314 : ((!((rankAtom ranks 14 == rankAtom ranks 12)) || ((rankAtom ranks 47).ult (rankAtom ranks 30)))) = true)
    (h4315 : ((!((rankAtom ranks 14 == rankAtom ranks 47)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h4316 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 47).ult (rankAtom ranks 14)))) = true)
    (h4317 : ((!((rankAtom ranks 30 == rankAtom ranks 47)) || ((rankAtom ranks 12).ult (rankAtom ranks 14)))) = true)
    (h4318 : ((!((rankAtom ranks 14 == rankAtom ranks 20)) || ((rankAtom ranks 24).ult (rankAtom ranks 30)))) = true)
    (h4319 : ((!((rankAtom ranks 30 == rankAtom ranks 24)) || ((rankAtom ranks 20).ult (rankAtom ranks 14)))) = true)
    (h4320 : ((!((rankAtom ranks 14 == rankAtom ranks 12)) || ((rankAtom ranks 48).ult (rankAtom ranks 31)))) = true)
    (h4321 : ((!((rankAtom ranks 14 == rankAtom ranks 48)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h4322 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 48).ult (rankAtom ranks 14)))) = true)
    (h4323 : ((!((rankAtom ranks 31 == rankAtom ranks 48)) || ((rankAtom ranks 12).ult (rankAtom ranks 14)))) = true)
    (h4324 : ((!((rankAtom ranks 14 == rankAtom ranks 21)) || ((rankAtom ranks 24).ult (rankAtom ranks 31)))) = true)
    (h4325 : ((!((rankAtom ranks 31 == rankAtom ranks 24)) || ((rankAtom ranks 21).ult (rankAtom ranks 14)))) = true)
    (h4326 : ((!((rankAtom ranks 14 == rankAtom ranks 12)) || ((rankAtom ranks 49).ult (rankAtom ranks 32)))) = true)
    (h4327 : ((!((rankAtom ranks 14 == rankAtom ranks 49)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h4328 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 49).ult (rankAtom ranks 14)))) = true)
    (h4329 : ((!((rankAtom ranks 14 == rankAtom ranks 22)) || ((rankAtom ranks 24).ult (rankAtom ranks 32)))) = true)
    (h4330 : ((!((rankAtom ranks 32 == rankAtom ranks 24)) || ((rankAtom ranks 22).ult (rankAtom ranks 14)))) = true)
    (h4331 : ((!((rankAtom ranks 15 == rankAtom ranks 12)) || ((rankAtom ranks 50).ult (rankAtom ranks 26)))) = true)
    (h4332 : ((!((rankAtom ranks 26 == rankAtom ranks 12)) || ((rankAtom ranks 50).ult (rankAtom ranks 15)))) = true)
    (h4333 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 12).ult (rankAtom ranks 15)))) = true)
    (h4334 : ((!((rankAtom ranks 15 == rankAtom ranks 16)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h4335 : ((!((rankAtom ranks 26 == rankAtom ranks 25)) || ((rankAtom ranks 16).ult (rankAtom ranks 15)))) = true)
    (h4336 : ((!((rankAtom ranks 15 == rankAtom ranks 12)) || ((rankAtom ranks 51).ult (rankAtom ranks 27)))) = true)
    (h4337 : ((!((rankAtom ranks 15 == rankAtom ranks 51)) || ((rankAtom ranks 12).ult (rankAtom ranks 27)))) = true)
    (h4338 : ((!((rankAtom ranks 27 == rankAtom ranks 12)) || ((rankAtom ranks 51).ult (rankAtom ranks 15)))) = true)
    (h4339 : ((!((rankAtom ranks 15 == rankAtom ranks 17)) || ((rankAtom ranks 25).ult (rankAtom ranks 27)))) = true)
    (h4340 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 17).ult (rankAtom ranks 15)))) = true)
    (h4341 : ((!((rankAtom ranks 15 == rankAtom ranks 12)) || ((rankAtom ranks 52).ult (rankAtom ranks 28)))) = true)
    (h4342 : ((!((rankAtom ranks 15 == rankAtom ranks 52)) || ((rankAtom ranks 12).ult (rankAtom ranks 28)))) = true)
    (h4343 : ((!((rankAtom ranks 28 == rankAtom ranks 12)) || ((rankAtom ranks 52).ult (rankAtom ranks 15)))) = true)
    (h4344 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 12).ult (rankAtom ranks 15)))) = true)
    (h4345 : ((!((rankAtom ranks 15 == rankAtom ranks 18)) || ((rankAtom ranks 25).ult (rankAtom ranks 28)))) = true)
    (h4346 : ((!((rankAtom ranks 15 == rankAtom ranks 25)) || ((rankAtom ranks 18).ult (rankAtom ranks 28)))) = true)
    (h4347 : ((!((rankAtom ranks 28 == rankAtom ranks 18)) || ((rankAtom ranks 25).ult (rankAtom ranks 15)))) = true)
    (h4348 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 18).ult (rankAtom ranks 15)))) = true)
    (h4349 : ((!((rankAtom ranks 15 == rankAtom ranks 12)) || ((rankAtom ranks 53).ult (rankAtom ranks 29)))) = true)
    (h4350 : ((!((rankAtom ranks 15 == rankAtom ranks 53)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) = true)
    (h4351 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 53).ult (rankAtom ranks 15)))) = true) :
    ∀ item ∈ sourceChunk067Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk067Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4288
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4289
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4290
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4291
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4292
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4293
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4294
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4295
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4296
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4297
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4298
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4299
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4300
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4301
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4302
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4303
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4304
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4305
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4306
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4307
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4308
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4309
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4310
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4311
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4312
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4313
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4314
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4315
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4316
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4317
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4318
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4319
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4320
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4321
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4322
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4323
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4324
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4325
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4326
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4327
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4328
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4329
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4330
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4331
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4332
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4333
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4334
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4335
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4336
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4337
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4338
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4339
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4340
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4341
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4342
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4343
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4344
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4345
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4346
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4347
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4348
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4349
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4350
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4351

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
