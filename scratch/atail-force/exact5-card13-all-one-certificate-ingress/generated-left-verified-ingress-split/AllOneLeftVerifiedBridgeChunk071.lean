/-
Generated packed-source bridge for verified left chunk 071.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk071_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4544 : ((!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 34).ult (rankAtom ranks 15)))) = true)
    (h4545 : ((!((rankAtom ranks 37 == rankAtom ranks 34)) || ((rankAtom ranks 18).ult (rankAtom ranks 15)))) = true)
    (h4546 : ((!((rankAtom ranks 15 == rankAtom ranks 13)) || ((rankAtom ranks 53).ult (rankAtom ranks 38)))) = true)
    (h4547 : ((!((rankAtom ranks 15 == rankAtom ranks 53)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h4548 : ((!((rankAtom ranks 38 == rankAtom ranks 53)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h4549 : ((!((rankAtom ranks 15 == rankAtom ranks 19)) || ((rankAtom ranks 34).ult (rankAtom ranks 38)))) = true)
    (h4550 : ((!((rankAtom ranks 15 == rankAtom ranks 13)) || ((rankAtom ranks 54).ult (rankAtom ranks 39)))) = true)
    (h4551 : ((!((rankAtom ranks 15 == rankAtom ranks 54)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h4552 : ((!((rankAtom ranks 39 == rankAtom ranks 54)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h4553 : ((!((rankAtom ranks 15 == rankAtom ranks 20)) || ((rankAtom ranks 34).ult (rankAtom ranks 39)))) = true)
    (h4554 : ((!((rankAtom ranks 15 == rankAtom ranks 13)) || ((rankAtom ranks 55).ult (rankAtom ranks 40)))) = true)
    (h4555 : ((!((rankAtom ranks 15 == rankAtom ranks 55)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h4556 : ((!((rankAtom ranks 40 == rankAtom ranks 55)) || ((rankAtom ranks 13).ult (rankAtom ranks 15)))) = true)
    (h4557 : ((!((rankAtom ranks 15 == rankAtom ranks 21)) || ((rankAtom ranks 34).ult (rankAtom ranks 40)))) = true)
    (h4558 : ((!((rankAtom ranks 15 == rankAtom ranks 13)) || ((rankAtom ranks 56).ult (rankAtom ranks 41)))) = true)
    (h4559 : ((!((rankAtom ranks 15 == rankAtom ranks 56)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h4560 : ((!((rankAtom ranks 15 == rankAtom ranks 22)) || ((rankAtom ranks 34).ult (rankAtom ranks 41)))) = true)
    (h4561 : ((!((rankAtom ranks 16 == rankAtom ranks 13)) || ((rankAtom ranks 57).ult (rankAtom ranks 36)))) = true)
    (h4562 : ((!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 13).ult (rankAtom ranks 36)))) = true)
    (h4563 : ((!((rankAtom ranks 16 == rankAtom ranks 17)) || ((rankAtom ranks 35).ult (rankAtom ranks 36)))) = true)
    (h4564 : ((!((rankAtom ranks 36 == rankAtom ranks 35)) || ((rankAtom ranks 17).ult (rankAtom ranks 16)))) = true)
    (h4565 : ((!((rankAtom ranks 16 == rankAtom ranks 13)) || ((rankAtom ranks 58).ult (rankAtom ranks 37)))) = true)
    (h4566 : ((!((rankAtom ranks 16 == rankAtom ranks 58)) || ((rankAtom ranks 13).ult (rankAtom ranks 37)))) = true)
    (h4567 : ((!((rankAtom ranks 37 == rankAtom ranks 13)) || ((rankAtom ranks 58).ult (rankAtom ranks 16)))) = true)
    (h4568 : ((!((rankAtom ranks 37 == rankAtom ranks 58)) || ((rankAtom ranks 13).ult (rankAtom ranks 16)))) = true)
    (h4569 : ((!((rankAtom ranks 16 == rankAtom ranks 18)) || ((rankAtom ranks 35).ult (rankAtom ranks 37)))) = true)
    (h4570 : ((!((rankAtom ranks 16 == rankAtom ranks 35)) || ((rankAtom ranks 18).ult (rankAtom ranks 37)))) = true)
    (h4571 : ((!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 35).ult (rankAtom ranks 16)))) = true)
    (h4572 : ((!((rankAtom ranks 37 == rankAtom ranks 35)) || ((rankAtom ranks 18).ult (rankAtom ranks 16)))) = true)
    (h4573 : ((!((rankAtom ranks 16 == rankAtom ranks 13)) || ((rankAtom ranks 59).ult (rankAtom ranks 38)))) = true)
    (h4574 : ((!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h4575 : ((!((rankAtom ranks 38 == rankAtom ranks 59)) || ((rankAtom ranks 13).ult (rankAtom ranks 16)))) = true)
    (h4576 : ((!((rankAtom ranks 16 == rankAtom ranks 19)) || ((rankAtom ranks 35).ult (rankAtom ranks 38)))) = true)
    (h4577 : ((!((rankAtom ranks 16 == rankAtom ranks 13)) || ((rankAtom ranks 60).ult (rankAtom ranks 39)))) = true)
    (h4578 : ((!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 13).ult (rankAtom ranks 39)))) = true)
    (h4579 : ((!((rankAtom ranks 39 == rankAtom ranks 60)) || ((rankAtom ranks 13).ult (rankAtom ranks 16)))) = true)
    (h4580 : ((!((rankAtom ranks 16 == rankAtom ranks 20)) || ((rankAtom ranks 35).ult (rankAtom ranks 39)))) = true)
    (h4581 : ((!((rankAtom ranks 16 == rankAtom ranks 13)) || ((rankAtom ranks 61).ult (rankAtom ranks 40)))) = true)
    (h4582 : ((!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 13).ult (rankAtom ranks 40)))) = true)
    (h4583 : ((!((rankAtom ranks 40 == rankAtom ranks 61)) || ((rankAtom ranks 13).ult (rankAtom ranks 16)))) = true)
    (h4584 : ((!((rankAtom ranks 16 == rankAtom ranks 21)) || ((rankAtom ranks 35).ult (rankAtom ranks 40)))) = true)
    (h4585 : ((!((rankAtom ranks 40 == rankAtom ranks 35)) || ((rankAtom ranks 21).ult (rankAtom ranks 16)))) = true)
    (h4586 : ((!((rankAtom ranks 16 == rankAtom ranks 13)) || ((rankAtom ranks 62).ult (rankAtom ranks 41)))) = true)
    (h4587 : ((!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 13).ult (rankAtom ranks 41)))) = true)
    (h4588 : ((!((rankAtom ranks 16 == rankAtom ranks 22)) || ((rankAtom ranks 35).ult (rankAtom ranks 41)))) = true)
    (h4589 : ((!((rankAtom ranks 37 == rankAtom ranks 13)) || ((rankAtom ranks 63).ult (rankAtom ranks 17)))) = true)
    (h4590 : ((!((rankAtom ranks 37 == rankAtom ranks 63)) || ((rankAtom ranks 13).ult (rankAtom ranks 17)))) = true)
    (h4591 : ((!((rankAtom ranks 17 == rankAtom ranks 18)) || ((rankAtom ranks 36).ult (rankAtom ranks 37)))) = true)
    (h4592 : ((!((rankAtom ranks 17 == rankAtom ranks 36)) || ((rankAtom ranks 18).ult (rankAtom ranks 37)))) = true)
    (h4593 : ((!((rankAtom ranks 37 == rankAtom ranks 18)) || ((rankAtom ranks 36).ult (rankAtom ranks 17)))) = true)
    (h4594 : ((!((rankAtom ranks 37 == rankAtom ranks 36)) || ((rankAtom ranks 18).ult (rankAtom ranks 17)))) = true)
    (h4595 : ((!((rankAtom ranks 17 == rankAtom ranks 13)) || ((rankAtom ranks 64).ult (rankAtom ranks 38)))) = true)
    (h4596 : ((!((rankAtom ranks 17 == rankAtom ranks 64)) || ((rankAtom ranks 13).ult (rankAtom ranks 38)))) = true)
    (h4597 : ((!((rankAtom ranks 38 == rankAtom ranks 64)) || ((rankAtom ranks 13).ult (rankAtom ranks 17)))) = true)
    (h4598 : ((!((rankAtom ranks 17 == rankAtom ranks 19)) || ((rankAtom ranks 36).ult (rankAtom ranks 38)))) = true)
    (h4599 : ((!((rankAtom ranks 17 == rankAtom ranks 13)) || ((rankAtom ranks 65).ult (rankAtom ranks 39)))) = true)
    (h4600 : ((!((rankAtom ranks 39 == rankAtom ranks 65)) || ((rankAtom ranks 13).ult (rankAtom ranks 17)))) = true)
    (h4601 : ((!((rankAtom ranks 17 == rankAtom ranks 20)) || ((rankAtom ranks 36).ult (rankAtom ranks 39)))) = true)
    (h4602 : ((!((rankAtom ranks 17 == rankAtom ranks 13)) || ((rankAtom ranks 66).ult (rankAtom ranks 40)))) = true)
    (h4603 : ((!((rankAtom ranks 40 == rankAtom ranks 66)) || ((rankAtom ranks 13).ult (rankAtom ranks 17)))) = true)
    (h4604 : ((!((rankAtom ranks 17 == rankAtom ranks 21)) || ((rankAtom ranks 36).ult (rankAtom ranks 40)))) = true)
    (h4605 : ((!((rankAtom ranks 17 == rankAtom ranks 13)) || ((rankAtom ranks 67).ult (rankAtom ranks 41)))) = true)
    (h4606 : ((!((rankAtom ranks 41 == rankAtom ranks 13)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h4607 : ((!((rankAtom ranks 17 == rankAtom ranks 22)) || ((rankAtom ranks 36).ult (rankAtom ranks 41)))) = true) :
    ∀ item ∈ sourceChunk071Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk071Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4544
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4545
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4546
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4547
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4548
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4549
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4550
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4551
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4552
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4553
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4554
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4555
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4556
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4557
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4558
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4559
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4560
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4561
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4562
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4563
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4564
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4565
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4566
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4567
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4568
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4569
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4570
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4571
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4572
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4573
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4574
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4575
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4576
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4577
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4578
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4579
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4580
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4581
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4582
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4583
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4584
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4585
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4586
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4587
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4588
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4589
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4590
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4591
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4592
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4593
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4594
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4595
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4596
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4597
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4598
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4599
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4600
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4601
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4602
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4603
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4604
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4605
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4606
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4607

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
