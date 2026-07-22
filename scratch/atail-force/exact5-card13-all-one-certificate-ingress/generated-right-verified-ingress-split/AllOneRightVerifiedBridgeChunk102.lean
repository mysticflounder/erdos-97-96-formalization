/-
Generated packed-source bridge for verified right chunk 102.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk102_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6528 : ((!((rankAtom ranks 55 == rankAtom ranks 42)) || ((rankAtom ranks 66).ult (rankAtom ranks 44)))) = true)
    (h6529 : ((!((rankAtom ranks 55 == rankAtom ranks 66)) || ((rankAtom ranks 42).ult (rankAtom ranks 44)))) = true)
    (h6530 : ((!((rankAtom ranks 44 == rankAtom ranks 48)) || ((rankAtom ranks 51).ult (rankAtom ranks 55)))) = true)
    (h6531 : ((!((rankAtom ranks 44 == rankAtom ranks 51)) || ((rankAtom ranks 48).ult (rankAtom ranks 55)))) = true)
    (h6532 : ((!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 51).ult (rankAtom ranks 44)))) = true)
    (h6533 : ((!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 48).ult (rankAtom ranks 44)))) = true)
    (h6534 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 67).ult (rankAtom ranks 56)))) = true)
    (h6535 : ((!((rankAtom ranks 56 == rankAtom ranks 42)) || ((rankAtom ranks 67).ult (rankAtom ranks 44)))) = true)
    (h6536 : ((!((rankAtom ranks 56 == rankAtom ranks 67)) || ((rankAtom ranks 42).ult (rankAtom ranks 44)))) = true)
    (h6537 : ((!((rankAtom ranks 44 == rankAtom ranks 49)) || ((rankAtom ranks 51).ult (rankAtom ranks 56)))) = true)
    (h6538 : ((!((rankAtom ranks 44 == rankAtom ranks 51)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h6539 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 51).ult (rankAtom ranks 44)))) = true)
    (h6540 : ((!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 49).ult (rankAtom ranks 44)))) = true)
    (h6541 : ((!((rankAtom ranks 45 == rankAtom ranks 42)) || ((rankAtom ranks 68).ult (rankAtom ranks 53)))) = true)
    (h6542 : ((!((rankAtom ranks 45 == rankAtom ranks 68)) || ((rankAtom ranks 42).ult (rankAtom ranks 53)))) = true)
    (h6543 : ((!((rankAtom ranks 53 == rankAtom ranks 42)) || ((rankAtom ranks 68).ult (rankAtom ranks 45)))) = true)
    (h6544 : ((!((rankAtom ranks 53 == rankAtom ranks 68)) || ((rankAtom ranks 42).ult (rankAtom ranks 45)))) = true)
    (h6545 : ((!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 52).ult (rankAtom ranks 53)))) = true)
    (h6546 : ((!((rankAtom ranks 53 == rankAtom ranks 46)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h6547 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 46).ult (rankAtom ranks 45)))) = true)
    (h6548 : ((!((rankAtom ranks 45 == rankAtom ranks 42)) || ((rankAtom ranks 69).ult (rankAtom ranks 54)))) = true)
    (h6549 : ((!((rankAtom ranks 45 == rankAtom ranks 69)) || ((rankAtom ranks 42).ult (rankAtom ranks 54)))) = true)
    (h6550 : ((!((rankAtom ranks 54 == rankAtom ranks 42)) || ((rankAtom ranks 69).ult (rankAtom ranks 45)))) = true)
    (h6551 : ((!((rankAtom ranks 54 == rankAtom ranks 69)) || ((rankAtom ranks 42).ult (rankAtom ranks 45)))) = true)
    (h6552 : ((!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 52).ult (rankAtom ranks 54)))) = true)
    (h6553 : ((!((rankAtom ranks 45 == rankAtom ranks 52)) || ((rankAtom ranks 47).ult (rankAtom ranks 54)))) = true)
    (h6554 : ((!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h6555 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 47).ult (rankAtom ranks 45)))) = true)
    (h6556 : ((!((rankAtom ranks 45 == rankAtom ranks 42)) || ((rankAtom ranks 70).ult (rankAtom ranks 55)))) = true)
    (h6557 : ((!((rankAtom ranks 45 == rankAtom ranks 70)) || ((rankAtom ranks 42).ult (rankAtom ranks 55)))) = true)
    (h6558 : ((!((rankAtom ranks 55 == rankAtom ranks 42)) || ((rankAtom ranks 70).ult (rankAtom ranks 45)))) = true)
    (h6559 : ((!((rankAtom ranks 55 == rankAtom ranks 70)) || ((rankAtom ranks 42).ult (rankAtom ranks 45)))) = true)
    (h6560 : ((!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 52).ult (rankAtom ranks 55)))) = true)
    (h6561 : ((!((rankAtom ranks 45 == rankAtom ranks 52)) || ((rankAtom ranks 48).ult (rankAtom ranks 55)))) = true)
    (h6562 : ((!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h6563 : ((!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 48).ult (rankAtom ranks 45)))) = true)
    (h6564 : ((!((rankAtom ranks 45 == rankAtom ranks 42)) || ((rankAtom ranks 71).ult (rankAtom ranks 56)))) = true)
    (h6565 : ((!((rankAtom ranks 45 == rankAtom ranks 71)) || ((rankAtom ranks 42).ult (rankAtom ranks 56)))) = true)
    (h6566 : ((!((rankAtom ranks 56 == rankAtom ranks 42)) || ((rankAtom ranks 71).ult (rankAtom ranks 45)))) = true)
    (h6567 : ((!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 52).ult (rankAtom ranks 56)))) = true)
    (h6568 : ((!((rankAtom ranks 45 == rankAtom ranks 52)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h6569 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h6570 : ((!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 49).ult (rankAtom ranks 45)))) = true)
    (h6571 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 72).ult (rankAtom ranks 54)))) = true)
    (h6572 : ((!((rankAtom ranks 46 == rankAtom ranks 72)) || ((rankAtom ranks 42).ult (rankAtom ranks 54)))) = true)
    (h6573 : ((!((rankAtom ranks 54 == rankAtom ranks 42)) || ((rankAtom ranks 72).ult (rankAtom ranks 46)))) = true)
    (h6574 : ((!((rankAtom ranks 54 == rankAtom ranks 72)) || ((rankAtom ranks 42).ult (rankAtom ranks 46)))) = true)
    (h6575 : ((!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 53).ult (rankAtom ranks 54)))) = true)
    (h6576 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 47).ult (rankAtom ranks 54)))) = true)
    (h6577 : ((!((rankAtom ranks 54 == rankAtom ranks 47)) || ((rankAtom ranks 53).ult (rankAtom ranks 46)))) = true)
    (h6578 : ((!((rankAtom ranks 54 == rankAtom ranks 53)) || ((rankAtom ranks 47).ult (rankAtom ranks 46)))) = true)
    (h6579 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 73).ult (rankAtom ranks 55)))) = true)
    (h6580 : ((!((rankAtom ranks 46 == rankAtom ranks 73)) || ((rankAtom ranks 42).ult (rankAtom ranks 55)))) = true)
    (h6581 : ((!((rankAtom ranks 55 == rankAtom ranks 42)) || ((rankAtom ranks 73).ult (rankAtom ranks 46)))) = true)
    (h6582 : ((!((rankAtom ranks 55 == rankAtom ranks 73)) || ((rankAtom ranks 42).ult (rankAtom ranks 46)))) = true)
    (h6583 : ((!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 53).ult (rankAtom ranks 55)))) = true)
    (h6584 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 48).ult (rankAtom ranks 55)))) = true)
    (h6585 : ((!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 53).ult (rankAtom ranks 46)))) = true)
    (h6586 : ((!((rankAtom ranks 55 == rankAtom ranks 53)) || ((rankAtom ranks 48).ult (rankAtom ranks 46)))) = true)
    (h6587 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 74).ult (rankAtom ranks 56)))) = true)
    (h6588 : ((!((rankAtom ranks 46 == rankAtom ranks 74)) || ((rankAtom ranks 42).ult (rankAtom ranks 56)))) = true)
    (h6589 : ((!((rankAtom ranks 56 == rankAtom ranks 42)) || ((rankAtom ranks 74).ult (rankAtom ranks 46)))) = true)
    (h6590 : ((!((rankAtom ranks 56 == rankAtom ranks 74)) || ((rankAtom ranks 42).ult (rankAtom ranks 46)))) = true)
    (h6591 : ((!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 53).ult (rankAtom ranks 56)))) = true) :
    ∀ item ∈ sourceChunk102Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk102Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6528
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6529
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6530
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6531
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6532
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6533
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6534
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6535
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6536
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6537
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6538
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6539
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6540
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6541
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6542
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6543
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6544
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6545
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6546
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6547
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6548
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6549
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6550
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6551
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6552
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6553
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6554
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6555
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6556
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6557
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6558
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6559
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6560
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6561
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6562
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6563
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6564
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6565
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6566
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6567
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6568
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6569
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6570
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6571
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6572
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6573
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6574
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6575
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6576
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6577
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6578
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6579
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6580
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6581
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6582
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6583
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6584
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6585
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6586
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6587
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6588
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6589
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6590
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6591

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
