/-
Generated packed-source bridge for verified right chunk 070.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk070_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4480 : ((!((rankAtom ranks 32 == rankAtom ranks 29)) || ((rankAtom ranks 22).ult (rankAtom ranks 19)))) = true)
    (h4481 : ((!((rankAtom ranks 20 == rankAtom ranks 12)) || ((rankAtom ranks 75).ult (rankAtom ranks 31)))) = true)
    (h4482 : ((!((rankAtom ranks 20 == rankAtom ranks 75)) || ((rankAtom ranks 12).ult (rankAtom ranks 31)))) = true)
    (h4483 : ((!((rankAtom ranks 31 == rankAtom ranks 12)) || ((rankAtom ranks 75).ult (rankAtom ranks 20)))) = true)
    (h4484 : ((!((rankAtom ranks 31 == rankAtom ranks 75)) || ((rankAtom ranks 12).ult (rankAtom ranks 20)))) = true)
    (h4485 : ((!((rankAtom ranks 20 == rankAtom ranks 21)) || ((rankAtom ranks 30).ult (rankAtom ranks 31)))) = true)
    (h4486 : ((!((rankAtom ranks 31 == rankAtom ranks 30)) || ((rankAtom ranks 21).ult (rankAtom ranks 20)))) = true)
    (h4487 : ((!((rankAtom ranks 20 == rankAtom ranks 12)) || ((rankAtom ranks 76).ult (rankAtom ranks 32)))) = true)
    (h4488 : ((!((rankAtom ranks 20 == rankAtom ranks 76)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h4489 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 76).ult (rankAtom ranks 20)))) = true)
    (h4490 : ((!((rankAtom ranks 20 == rankAtom ranks 22)) || ((rankAtom ranks 30).ult (rankAtom ranks 32)))) = true)
    (h4491 : ((!((rankAtom ranks 32 == rankAtom ranks 30)) || ((rankAtom ranks 22).ult (rankAtom ranks 20)))) = true)
    (h4492 : ((!((rankAtom ranks 21 == rankAtom ranks 12)) || ((rankAtom ranks 77).ult (rankAtom ranks 32)))) = true)
    (h4493 : ((!((rankAtom ranks 21 == rankAtom ranks 77)) || ((rankAtom ranks 12).ult (rankAtom ranks 32)))) = true)
    (h4494 : ((!((rankAtom ranks 32 == rankAtom ranks 12)) || ((rankAtom ranks 77).ult (rankAtom ranks 21)))) = true)
    (h4495 : ((!((rankAtom ranks 21 == rankAtom ranks 22)) || ((rankAtom ranks 31).ult (rankAtom ranks 32)))) = true)
    (h4496 : ((!((rankAtom ranks 32 == rankAtom ranks 31)) || ((rankAtom ranks 22).ult (rankAtom ranks 21)))) = true)
    (h4497 : ((!((rankAtom ranks 14 == rankAtom ranks 13)) || ((rankAtom ranks 42).ult (rankAtom ranks 34)))) = true)
    (h4498 : ((!((rankAtom ranks 14 == rankAtom ranks 42)) || ((rankAtom ranks 13).ult (rankAtom ranks 34)))) = true)
    (h4499 : ((!((rankAtom ranks 34 == rankAtom ranks 42)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h4500 : ((!((rankAtom ranks 14 == rankAtom ranks 15)) || ((rankAtom ranks 33).ult (rankAtom ranks 34)))) = true)
    (h4501 : ((!((rankAtom ranks 14 == rankAtom ranks 13)) || ((rankAtom ranks 43).ult (rankAtom ranks 35)))) = true)
    (h4502 : ((!((rankAtom ranks 14 == rankAtom ranks 43)) || ((rankAtom ranks 13).ult (rankAtom ranks 35)))) = true)
    (h4503 : ((!((rankAtom ranks 35 == rankAtom ranks 43)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h4504 : ((!((rankAtom ranks 14 == rankAtom ranks 16)) || ((rankAtom ranks 33).ult (rankAtom ranks 35)))) = true)
    (h4505 : ((!((rankAtom ranks 35 == rankAtom ranks 33)) || ((rankAtom ranks 16).ult (rankAtom ranks 14)))) = true)
    (h4506 : ((!((rankAtom ranks 14 == rankAtom ranks 13)) || ((rankAtom ranks 44).ult (rankAtom ranks 36)))) = true)
    (h4507 : ((!((rankAtom ranks 14 == rankAtom ranks 44)) || ((rankAtom ranks 13).ult (rankAtom ranks 36)))) = true)
    (h4508 : ((!((rankAtom ranks 36 == rankAtom ranks 44)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h4509 : ((!((rankAtom ranks 14 == rankAtom ranks 17)) || ((rankAtom ranks 33).ult (rankAtom ranks 36)))) = true)
    (h4510 : ((!((rankAtom ranks 36 == rankAtom ranks 33)) || ((rankAtom ranks 17).ult (rankAtom ranks 14)))) = true)
    (h4511 : ((!((rankAtom ranks 14 == rankAtom ranks 13)) || ((rankAtom ranks 45).ult (rankAtom ranks 37)))) = true)
    (h4512 : ((!((rankAtom ranks 14 == rankAtom ranks 45)) || ((rankAtom ranks 13).ult (rankAtom ranks 37)))) = true)
    (h4513 : ((!((rankAtom ranks 37 == rankAtom ranks 13)) || ((rankAtom ranks 45).ult (rankAtom ranks 14)))) = true)
    (h4514 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h4515 : ((!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 33).ult (rankAtom ranks 14)))) = true)
    (h4516 : ((!((rankAtom ranks 14 == rankAtom ranks 13)) || ((rankAtom ranks 46).ult (rankAtom ranks 38)))) = true)
    (h4517 : ((!((rankAtom ranks 14 == rankAtom ranks 46)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h4518 : ((!((rankAtom ranks 38 == rankAtom ranks 46)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h4519 : ((!((rankAtom ranks 14 == rankAtom ranks 19)) || ((rankAtom ranks 33).ult (rankAtom ranks 38)))) = true)
    (h4520 : ((!((rankAtom ranks 14 == rankAtom ranks 13)) || ((rankAtom ranks 47).ult (rankAtom ranks 39)))) = true)
    (h4521 : ((!((rankAtom ranks 14 == rankAtom ranks 47)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h4522 : ((!((rankAtom ranks 39 == rankAtom ranks 47)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h4523 : ((!((rankAtom ranks 14 == rankAtom ranks 13)) || ((rankAtom ranks 48).ult (rankAtom ranks 40)))) = true)
    (h4524 : ((!((rankAtom ranks 14 == rankAtom ranks 48)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h4525 : ((!((rankAtom ranks 40 == rankAtom ranks 13)) || ((rankAtom ranks 48).ult (rankAtom ranks 14)))) = true)
    (h4526 : ((!((rankAtom ranks 40 == rankAtom ranks 48)) || ((rankAtom ranks 13).ult (rankAtom ranks 14)))) = true)
    (h4527 : ((!((rankAtom ranks 14 == rankAtom ranks 13)) || ((rankAtom ranks 49).ult (rankAtom ranks 41)))) = true)
    (h4528 : ((!((rankAtom ranks 14 == rankAtom ranks 49)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h4529 : ((!((rankAtom ranks 15 == rankAtom ranks 13)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h4530 : ((!((rankAtom ranks 15 == rankAtom ranks 50)) || ((rankAtom ranks 13).ult (rankAtom ranks 35)))) = true)
    (h4531 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h4532 : ((!((rankAtom ranks 15 == rankAtom ranks 16)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h4533 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 16).ult (rankAtom ranks 15)))) = true)
    (h4534 : ((!((rankAtom ranks 15 == rankAtom ranks 13)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h4535 : ((!((rankAtom ranks 15 == rankAtom ranks 51)) || ((rankAtom ranks 13).ult (rankAtom ranks 36)))) = true)
    (h4536 : ((!((rankAtom ranks 36 == rankAtom ranks 51)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h4537 : ((!((rankAtom ranks 15 == rankAtom ranks 17)) || ((rankAtom ranks 34).ult (rankAtom ranks 36)))) = true)
    (h4538 : ((!((rankAtom ranks 15 == rankAtom ranks 13)) || ((rankAtom ranks 52).ult (rankAtom ranks 37)))) = true)
    (h4539 : ((!((rankAtom ranks 15 == rankAtom ranks 52)) || ((rankAtom ranks 13).ult (rankAtom ranks 37)))) = true)
    (h4540 : ((!((rankAtom ranks 37 == rankAtom ranks 13)) || ((rankAtom ranks 52).ult (rankAtom ranks 15)))) = true)
    (h4541 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h4542 : ((!((rankAtom ranks 15 == rankAtom ranks 18)) || ((rankAtom ranks 34).ult (rankAtom ranks 37)))) = true)
    (h4543 : ((!((rankAtom ranks 15 == rankAtom ranks 34)) || ((rankAtom ranks 18).ult (rankAtom ranks 37)))) = true) :
    ∀ item ∈ sourceChunk070Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk070Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4480
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4481
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4482
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4483
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4484
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4485
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4486
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4487
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4488
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4489
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4490
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4491
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4492
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4493
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4494
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4495
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4496
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4497
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4498
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4499
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4500
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4501
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4502
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4503
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4504
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4505
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4506
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4507
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4508
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4509
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4510
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4511
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4512
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4513
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4514
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4515
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4516
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4517
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4518
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4519
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4520
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4521
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4522
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4523
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4524
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4525
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4526
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4527
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4528
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4529
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4530
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4531
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4532
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4533
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4534
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4535
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4536
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4537
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4538
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4539
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4540
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4541
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4542
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4543

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
