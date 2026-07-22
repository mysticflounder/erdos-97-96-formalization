/-
Generated packed-source bridge for verified left chunk 069.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk069_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4416 : ((!((rankAtom ranks 29 == rankAtom ranks 64)) || ((rankAtom ranks 12).ult (rankAtom ranks 17)))) = true)
    (h4417 : ((!((rankAtom ranks 17 == rankAtom ranks 19)) || ((rankAtom ranks 27).ult (rankAtom ranks 29)))) = true)
    (h4418 : ((!((rankAtom ranks 29 == rankAtom ranks 27)) || ((rankAtom ranks 19).ult (rankAtom ranks 17)))) = true)
    (h4419 : ((!((rankAtom ranks 17 == rankAtom ranks 12)) || ((rankAtom ranks 65).ult (rankAtom ranks 30)))) = true)
    (h4420 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 65).ult (rankAtom ranks 17)))) = true)
    (h4421 : ((!((rankAtom ranks 30 == rankAtom ranks 65)) || ((rankAtom ranks 12).ult (rankAtom ranks 17)))) = true)
    (h4422 : ((!((rankAtom ranks 17 == rankAtom ranks 20)) || ((rankAtom ranks 27).ult (rankAtom ranks 30)))) = true)
    (h4423 : ((!((rankAtom ranks 30 == rankAtom ranks 27)) || ((rankAtom ranks 20).ult (rankAtom ranks 17)))) = true)
    (h4424 : ((!((rankAtom ranks 17 == rankAtom ranks 12)) || ((rankAtom ranks 66).ult (rankAtom ranks 31)))) = true)
    (h4425 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 66).ult (rankAtom ranks 17)))) = true)
    (h4426 : ((!((rankAtom ranks 31 == rankAtom ranks 66)) || ((rankAtom ranks 12).ult (rankAtom ranks 17)))) = true)
    (h4427 : ((!((rankAtom ranks 17 == rankAtom ranks 21)) || ((rankAtom ranks 27).ult (rankAtom ranks 31)))) = true)
    (h4428 : ((!((rankAtom ranks 31 == rankAtom ranks 27)) || ((rankAtom ranks 21).ult (rankAtom ranks 17)))) = true)
    (h4429 : ((!((rankAtom ranks 17 == rankAtom ranks 12)) || ((rankAtom ranks 67).ult (rankAtom ranks 32)))) = true)
    (h4430 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h4431 : ((!((rankAtom ranks 17 == rankAtom ranks 22)) || ((rankAtom ranks 27).ult (rankAtom ranks 32)))) = true)
    (h4432 : ((!((rankAtom ranks 32 == rankAtom ranks 27)) || ((rankAtom ranks 22).ult (rankAtom ranks 17)))) = true)
    (h4433 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 68).ult (rankAtom ranks 29)))) = true)
    (h4434 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 12).ult (rankAtom ranks 29)))) = true)
    (h4435 : ((!((rankAtom ranks 29 == rankAtom ranks 12)) || ((rankAtom ranks 68).ult (rankAtom ranks 18)))) = true)
    (h4436 : ((!((rankAtom ranks 29 == rankAtom ranks 68)) || ((rankAtom ranks 12).ult (rankAtom ranks 18)))) = true)
    (h4437 : ((!((rankAtom ranks 18 == rankAtom ranks 19)) || ((rankAtom ranks 28).ult (rankAtom ranks 29)))) = true)
    (h4438 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 19).ult (rankAtom ranks 29)))) = true)
    (h4439 : ((!((rankAtom ranks 29 == rankAtom ranks 19)) || ((rankAtom ranks 28).ult (rankAtom ranks 18)))) = true)
    (h4440 : ((!((rankAtom ranks 29 == rankAtom ranks 28)) || ((rankAtom ranks 19).ult (rankAtom ranks 18)))) = true)
    (h4441 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 69).ult (rankAtom ranks 30)))) = true)
    (h4442 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h4443 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 69).ult (rankAtom ranks 18)))) = true)
    (h4444 : ((!((rankAtom ranks 30 == rankAtom ranks 69)) || ((rankAtom ranks 12).ult (rankAtom ranks 18)))) = true)
    (h4445 : ((!((rankAtom ranks 18 == rankAtom ranks 20)) || ((rankAtom ranks 28).ult (rankAtom ranks 30)))) = true)
    (h4446 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 20).ult (rankAtom ranks 30)))) = true)
    (h4447 : ((!((rankAtom ranks 30 == rankAtom ranks 20)) || ((rankAtom ranks 28).ult (rankAtom ranks 18)))) = true)
    (h4448 : ((!((rankAtom ranks 30 == rankAtom ranks 28)) || ((rankAtom ranks 20).ult (rankAtom ranks 18)))) = true)
    (h4449 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 70).ult (rankAtom ranks 31)))) = true)
    (h4450 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h4451 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 70).ult (rankAtom ranks 18)))) = true)
    (h4452 : ((!((rankAtom ranks 31 == rankAtom ranks 70)) || ((rankAtom ranks 12).ult (rankAtom ranks 18)))) = true)
    (h4453 : ((!((rankAtom ranks 18 == rankAtom ranks 21)) || ((rankAtom ranks 28).ult (rankAtom ranks 31)))) = true)
    (h4454 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 21).ult (rankAtom ranks 31)))) = true)
    (h4455 : ((!((rankAtom ranks 31 == rankAtom ranks 21)) || ((rankAtom ranks 28).ult (rankAtom ranks 18)))) = true)
    (h4456 : ((!((rankAtom ranks 31 == rankAtom ranks 28)) || ((rankAtom ranks 21).ult (rankAtom ranks 18)))) = true)
    (h4457 : ((!((rankAtom ranks 18 == rankAtom ranks 12)) || ((rankAtom ranks 71).ult (rankAtom ranks 32)))) = true)
    (h4458 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h4459 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 71).ult (rankAtom ranks 18)))) = true)
    (h4460 : ((!((rankAtom ranks 18 == rankAtom ranks 22)) || ((rankAtom ranks 28).ult (rankAtom ranks 32)))) = true)
    (h4461 : ((!((rankAtom ranks 18 == rankAtom ranks 28)) || ((rankAtom ranks 22).ult (rankAtom ranks 32)))) = true)
    (h4462 : ((!((rankAtom ranks 32 == rankAtom ranks 22)) || ((rankAtom ranks 28).ult (rankAtom ranks 18)))) = true)
    (h4463 : ((!((rankAtom ranks 32 == rankAtom ranks 28)) || ((rankAtom ranks 22).ult (rankAtom ranks 18)))) = true)
    (h4464 : ((!((rankAtom ranks 19 == rankAtom ranks 12)) || ((rankAtom ranks 72).ult (rankAtom ranks 30)))) = true)
    (h4465 : ((!((rankAtom ranks 19 == rankAtom ranks 72)) || ((rankAtom ranks 12).ult (rankAtom ranks 30)))) = true)
    (h4466 : ((!((rankAtom ranks 30 == rankAtom ranks 12)) || ((rankAtom ranks 72).ult (rankAtom ranks 19)))) = true)
    (h4467 : ((!((rankAtom ranks 30 == rankAtom ranks 72)) || ((rankAtom ranks 12).ult (rankAtom ranks 19)))) = true)
    (h4468 : ((!((rankAtom ranks 19 == rankAtom ranks 20)) || ((rankAtom ranks 29).ult (rankAtom ranks 30)))) = true)
    (h4469 : ((!((rankAtom ranks 30 == rankAtom ranks 29)) || ((rankAtom ranks 20).ult (rankAtom ranks 19)))) = true)
    (h4470 : ((!((rankAtom ranks 19 == rankAtom ranks 12)) || ((rankAtom ranks 73).ult (rankAtom ranks 31)))) = true)
    (h4471 : ((!((rankAtom ranks 19 == rankAtom ranks 73)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h4472 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 73).ult (rankAtom ranks 19)))) = true)
    (h4473 : ((!((rankAtom ranks 31 == rankAtom ranks 73)) || ((rankAtom ranks 12).ult (rankAtom ranks 19)))) = true)
    (h4474 : ((!((rankAtom ranks 19 == rankAtom ranks 21)) || ((rankAtom ranks 29).ult (rankAtom ranks 31)))) = true)
    (h4475 : ((!((rankAtom ranks 31 == rankAtom ranks 29)) || ((rankAtom ranks 21).ult (rankAtom ranks 19)))) = true)
    (h4476 : ((!((rankAtom ranks 19 == rankAtom ranks 12)) || ((rankAtom ranks 74).ult (rankAtom ranks 32)))) = true)
    (h4477 : ((!((rankAtom ranks 19 == rankAtom ranks 74)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h4478 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 74).ult (rankAtom ranks 19)))) = true)
    (h4479 : ((!((rankAtom ranks 19 == rankAtom ranks 22)) || ((rankAtom ranks 29).ult (rankAtom ranks 32)))) = true) :
    ∀ item ∈ sourceChunk069Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk069Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4416
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4417
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4418
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4419
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4420
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4421
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4422
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4423
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4424
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4425
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4426
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4427
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4428
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4429
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4430
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4431
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4432
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4433
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4434
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4435
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4436
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4437
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4438
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4439
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4440
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4441
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4442
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4443
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4444
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4445
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4446
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4447
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4448
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4449
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4450
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4451
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4452
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4453
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4454
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4455
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4456
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4457
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4458
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4459
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4460
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4461
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4462
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4463
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4464
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4465
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4466
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4467
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4468
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4469
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4470
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4471
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4472
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4473
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4474
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4475
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4476
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4477
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4478
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4479

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
