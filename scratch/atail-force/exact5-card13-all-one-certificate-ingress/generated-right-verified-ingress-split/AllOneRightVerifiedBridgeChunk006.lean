/-
Generated packed-source bridge for verified right chunk 006.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk006_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0384 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 5 && rowBit rows 0 3 0 && rowBit rows 0 3 5))) = true)
    (h0385 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 6 && rowBit rows 0 3 0 && rowBit rows 0 3 6))) = true)
    (h0386 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 7 && rowBit rows 0 3 0 && rowBit rows 0 3 7))) = true)
    (h0387 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 8 && rowBit rows 0 3 0 && rowBit rows 0 3 8))) = true)
    (h0388 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 9 && rowBit rows 0 3 0 && rowBit rows 0 3 9))) = true)
    (h0389 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 6 && rowBit rows 0 3 1 && rowBit rows 0 3 6))) = true)
    (h0390 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 8 && rowBit rows 0 3 1 && rowBit rows 0 3 8))) = true)
    (h0391 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 0 3 1 && rowBit rows 0 3 10))) = true)
    (h0392 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 0 3 1 && rowBit rows 0 3 12))) = true)
    (h0393 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 6 && rowBit rows 0 3 4 && rowBit rows 0 3 6))) = true)
    (h0394 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 7 && rowBit rows 0 3 4 && rowBit rows 0 3 7))) = true)
    (h0395 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 10 && rowBit rows 0 3 4 && rowBit rows 0 3 10))) = true)
    (h0396 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 11 && rowBit rows 0 3 4 && rowBit rows 0 3 11))) = true)
    (h0397 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 12 && rowBit rows 0 3 4 && rowBit rows 0 3 12))) = true)
    (h0398 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 10 && rowBit rows 0 3 5 && rowBit rows 0 3 10))) = true)
    (h0399 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 8 && rowBit rows 0 3 6 && rowBit rows 0 3 8))) = true)
    (h0400 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 10 && rowBit rows 0 3 6 && rowBit rows 0 3 10))) = true)
    (h0401 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 12 && rowBit rows 0 3 6 && rowBit rows 0 3 12))) = true)
    (h0402 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 0 3 7 && rowBit rows 0 3 8))) = true)
    (h0403 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 12 && rowBit rows 0 3 7 && rowBit rows 0 3 12))) = true)
    (h0404 : (!((rowBit rows 0 2 9 && rowBit rows 0 2 11 && rowBit rows 0 3 9 && rowBit rows 0 3 11))) = true)
    (h0405 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 5 && rowBit rows 0 4 0 && rowBit rows 0 4 5))) = true)
    (h0406 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 6 && rowBit rows 0 4 0 && rowBit rows 0 4 6))) = true)
    (h0407 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 7 && rowBit rows 0 4 0 && rowBit rows 0 4 7))) = true)
    (h0408 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 8 && rowBit rows 0 4 0 && rowBit rows 0 4 8))) = true)
    (h0409 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 9 && rowBit rows 0 4 0 && rowBit rows 0 4 9))) = true)
    (h0410 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 10 && rowBit rows 0 4 0 && rowBit rows 0 4 10))) = true)
    (h0411 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 11 && rowBit rows 0 4 0 && rowBit rows 0 4 11))) = true)
    (h0412 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 12 && rowBit rows 0 4 0 && rowBit rows 0 4 12))) = true)
    (h0413 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 5 && rowBit rows 0 4 1 && rowBit rows 0 4 5))) = true)
    (h0414 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 6 && rowBit rows 0 4 1 && rowBit rows 0 4 6))) = true)
    (h0415 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 7 && rowBit rows 0 4 1 && rowBit rows 0 4 7))) = true)
    (h0416 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 8 && rowBit rows 0 4 1 && rowBit rows 0 4 8))) = true)
    (h0417 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 9 && rowBit rows 0 4 1 && rowBit rows 0 4 9))) = true)
    (h0418 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 0 4 1 && rowBit rows 0 4 10))) = true)
    (h0419 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 0 4 1 && rowBit rows 0 4 11))) = true)
    (h0420 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 0 4 1 && rowBit rows 0 4 12))) = true)
    (h0421 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 10 && rowBit rows 0 4 5 && rowBit rows 0 4 10))) = true)
    (h0422 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 10 && rowBit rows 0 4 6 && rowBit rows 0 4 10))) = true)
    (h0423 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 12 && rowBit rows 0 4 6 && rowBit rows 0 4 12))) = true)
    (h0424 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 11 && rowBit rows 0 4 8 && rowBit rows 0 4 11))) = true)
    (h0425 : (!((rowBit rows 0 2 9 && rowBit rows 0 2 11 && rowBit rows 0 4 9 && rowBit rows 0 4 11))) = true)
    (h0426 : (!((rowBit rows 0 2 9 && rowBit rows 0 2 12 && rowBit rows 0 4 9 && rowBit rows 0 4 12))) = true)
    (h0427 : (!((rowBit rows 0 2 10 && rowBit rows 0 2 11 && rowBit rows 0 4 10 && rowBit rows 0 4 11))) = true)
    (h0428 : (!((rowBit rows 0 2 11 && rowBit rows 0 2 12 && rowBit rows 0 4 11 && rowBit rows 0 4 12))) = true)
    (h0429 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 0 5 0 && rowBit rows 0 5 1))) = true)
    (h0430 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 6 && rowBit rows 0 5 0 && rowBit rows 0 5 6))) = true)
    (h0431 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 7 && rowBit rows 0 5 0 && rowBit rows 0 5 7))) = true)
    (h0432 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 8 && rowBit rows 0 5 0 && rowBit rows 0 5 8))) = true)
    (h0433 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 9 && rowBit rows 0 5 0 && rowBit rows 0 5 9))) = true)
    (h0434 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 12 && rowBit rows 0 5 0 && rowBit rows 0 5 12))) = true)
    (h0435 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 6 && rowBit rows 0 5 1 && rowBit rows 0 5 6))) = true)
    (h0436 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 7 && rowBit rows 0 5 1 && rowBit rows 0 5 7))) = true)
    (h0437 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 8 && rowBit rows 0 5 1 && rowBit rows 0 5 8))) = true)
    (h0438 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 9 && rowBit rows 0 5 1 && rowBit rows 0 5 9))) = true)
    (h0439 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 0 5 1 && rowBit rows 0 5 10))) = true)
    (h0440 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 0 5 1 && rowBit rows 0 5 11))) = true)
    (h0441 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 0 5 1 && rowBit rows 0 5 12))) = true)
    (h0442 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 7 && rowBit rows 0 5 6 && rowBit rows 0 5 7))) = true)
    (h0443 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 8 && rowBit rows 0 5 6 && rowBit rows 0 5 8))) = true)
    (h0444 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 9 && rowBit rows 0 5 6 && rowBit rows 0 5 9))) = true)
    (h0445 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 10 && rowBit rows 0 5 6 && rowBit rows 0 5 10))) = true)
    (h0446 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 11 && rowBit rows 0 5 6 && rowBit rows 0 5 11))) = true)
    (h0447 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 12 && rowBit rows 0 5 6 && rowBit rows 0 5 12))) = true) :
    ∀ item ∈ sourceChunk006Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk006Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0384
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0385
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0386
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0387
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0388
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0389
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0390
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0391
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0392
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0393
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0394
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0395
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0396
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0397
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0398
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0399
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0400
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0401
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0402
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0403
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0404
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0405
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0406
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0407
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0408
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0409
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0410
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0411
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0412
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0413
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0414
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0415
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0416
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0417
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0418
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0419
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0420
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0421
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0422
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0423
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0424
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0425
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0426
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0427
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0428
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0429
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0430
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0431
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0432
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0433
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0434
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0435
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0436
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0437
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0438
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0439
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0440
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0441
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0442
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0443
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0444
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0445
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0446
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0447

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
