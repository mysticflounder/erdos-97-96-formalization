/-
Generated packed-source bridge for verified middle chunk 005.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk005_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0320 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 12 && rowBit rows 0 10 0 && rowBit rows 0 10 12))) = true)
    (h0321 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 4 && rowBit rows 0 10 2 && rowBit rows 0 10 4))) = true)
    (h0322 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 5 && rowBit rows 0 10 2 && rowBit rows 0 10 5))) = true)
    (h0323 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 6 && rowBit rows 0 10 2 && rowBit rows 0 10 6))) = true)
    (h0324 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 7 && rowBit rows 0 10 2 && rowBit rows 0 10 7))) = true)
    (h0325 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 8 && rowBit rows 0 10 2 && rowBit rows 0 10 8))) = true)
    (h0326 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 9 && rowBit rows 0 10 2 && rowBit rows 0 10 9))) = true)
    (h0327 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 4 && rowBit rows 0 10 3 && rowBit rows 0 10 4))) = true)
    (h0328 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 5 && rowBit rows 0 10 3 && rowBit rows 0 10 5))) = true)
    (h0329 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 6 && rowBit rows 0 10 3 && rowBit rows 0 10 6))) = true)
    (h0330 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 7 && rowBit rows 0 10 3 && rowBit rows 0 10 7))) = true)
    (h0331 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 8 && rowBit rows 0 10 3 && rowBit rows 0 10 8))) = true)
    (h0332 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 9 && rowBit rows 0 10 3 && rowBit rows 0 10 9))) = true)
    (h0333 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 5 && rowBit rows 0 10 4 && rowBit rows 0 10 5))) = true)
    (h0334 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 6 && rowBit rows 0 10 4 && rowBit rows 0 10 6))) = true)
    (h0335 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 7 && rowBit rows 0 10 4 && rowBit rows 0 10 7))) = true)
    (h0336 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 8 && rowBit rows 0 10 4 && rowBit rows 0 10 8))) = true)
    (h0337 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 9 && rowBit rows 0 10 4 && rowBit rows 0 10 9))) = true)
    (h0338 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 7 && rowBit rows 0 10 5 && rowBit rows 0 10 7))) = true)
    (h0339 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 8 && rowBit rows 0 10 5 && rowBit rows 0 10 8))) = true)
    (h0340 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 9 && rowBit rows 0 10 5 && rowBit rows 0 10 9))) = true)
    (h0341 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 7 && rowBit rows 0 10 6 && rowBit rows 0 10 7))) = true)
    (h0342 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 8 && rowBit rows 0 10 6 && rowBit rows 0 10 8))) = true)
    (h0343 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 9 && rowBit rows 0 10 6 && rowBit rows 0 10 9))) = true)
    (h0344 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 8 && rowBit rows 0 10 7 && rowBit rows 0 10 8))) = true)
    (h0345 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 9 && rowBit rows 0 10 7 && rowBit rows 0 10 9))) = true)
    (h0346 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 9 && rowBit rows 0 10 8 && rowBit rows 0 10 9))) = true)
    (h0347 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 12 && rowBit rows 0 11 0 && rowBit rows 0 11 12))) = true)
    (h0348 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 4 && rowBit rows 0 11 2 && rowBit rows 0 11 4))) = true)
    (h0349 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 5 && rowBit rows 0 11 2 && rowBit rows 0 11 5))) = true)
    (h0350 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 6 && rowBit rows 0 11 2 && rowBit rows 0 11 6))) = true)
    (h0351 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 7 && rowBit rows 0 11 2 && rowBit rows 0 11 7))) = true)
    (h0352 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 8 && rowBit rows 0 11 2 && rowBit rows 0 11 8))) = true)
    (h0353 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 9 && rowBit rows 0 11 2 && rowBit rows 0 11 9))) = true)
    (h0354 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 10 && rowBit rows 0 11 2 && rowBit rows 0 11 10))) = true)
    (h0355 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 4 && rowBit rows 0 11 3 && rowBit rows 0 11 4))) = true)
    (h0356 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 5 && rowBit rows 0 11 3 && rowBit rows 0 11 5))) = true)
    (h0357 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 6 && rowBit rows 0 11 3 && rowBit rows 0 11 6))) = true)
    (h0358 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 7 && rowBit rows 0 11 3 && rowBit rows 0 11 7))) = true)
    (h0359 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 8 && rowBit rows 0 11 3 && rowBit rows 0 11 8))) = true)
    (h0360 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 9 && rowBit rows 0 11 3 && rowBit rows 0 11 9))) = true)
    (h0361 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 10 && rowBit rows 0 11 3 && rowBit rows 0 11 10))) = true)
    (h0362 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 5 && rowBit rows 0 11 4 && rowBit rows 0 11 5))) = true)
    (h0363 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 6 && rowBit rows 0 11 4 && rowBit rows 0 11 6))) = true)
    (h0364 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 7 && rowBit rows 0 11 4 && rowBit rows 0 11 7))) = true)
    (h0365 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 8 && rowBit rows 0 11 4 && rowBit rows 0 11 8))) = true)
    (h0366 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 9 && rowBit rows 0 11 4 && rowBit rows 0 11 9))) = true)
    (h0367 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 10 && rowBit rows 0 11 4 && rowBit rows 0 11 10))) = true)
    (h0368 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 7 && rowBit rows 0 11 5 && rowBit rows 0 11 7))) = true)
    (h0369 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 8 && rowBit rows 0 11 5 && rowBit rows 0 11 8))) = true)
    (h0370 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 9 && rowBit rows 0 11 5 && rowBit rows 0 11 9))) = true)
    (h0371 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 10 && rowBit rows 0 11 5 && rowBit rows 0 11 10))) = true)
    (h0372 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 7 && rowBit rows 0 11 6 && rowBit rows 0 11 7))) = true)
    (h0373 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 8 && rowBit rows 0 11 6 && rowBit rows 0 11 8))) = true)
    (h0374 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 9 && rowBit rows 0 11 6 && rowBit rows 0 11 9))) = true)
    (h0375 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 10 && rowBit rows 0 11 6 && rowBit rows 0 11 10))) = true)
    (h0376 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 8 && rowBit rows 0 11 7 && rowBit rows 0 11 8))) = true)
    (h0377 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 9 && rowBit rows 0 11 7 && rowBit rows 0 11 9))) = true)
    (h0378 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 10 && rowBit rows 0 11 7 && rowBit rows 0 11 10))) = true)
    (h0379 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 9 && rowBit rows 0 11 8 && rowBit rows 0 11 9))) = true)
    (h0380 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 10 && rowBit rows 0 11 8 && rowBit rows 0 11 10))) = true)
    (h0381 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 10 && rowBit rows 0 11 9 && rowBit rows 0 11 10))) = true)
    (h0382 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 9 && rowBit rows 0 12 4 && rowBit rows 0 12 9))) = true)
    (h0383 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 0 3 0 && rowBit rows 0 3 1))) = true) :
    ∀ item ∈ sourceChunk005Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk005Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0320
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0321
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0322
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0323
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0324
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0325
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0326
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0327
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0328
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0329
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0330
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0331
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0332
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0333
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0334
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0335
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0336
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0337
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0338
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0339
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0340
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0341
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0342
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0343
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0344
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0345
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0346
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0347
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0348
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0349
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0350
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0351
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0352
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0353
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0354
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0355
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0356
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0357
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0358
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0359
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0360
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0361
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0362
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0363
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0364
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0365
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0366
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0367
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0368
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0369
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0370
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0371
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0372
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0373
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0374
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0375
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0376
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0377
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0378
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0379
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0380
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0381
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0382
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0383

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
