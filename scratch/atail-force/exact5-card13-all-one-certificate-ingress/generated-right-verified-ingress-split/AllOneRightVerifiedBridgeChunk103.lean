/-
Generated packed-source bridge for verified right chunk 103.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk103_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6592 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h6593 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 53).ult (rankAtom ranks 46)))) = true)
    (h6594 : ((!((rankAtom ranks 56 == rankAtom ranks 53)) || ((rankAtom ranks 49).ult (rankAtom ranks 46)))) = true)
    (h6595 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 75).ult (rankAtom ranks 55)))) = true)
    (h6596 : ((!((rankAtom ranks 47 == rankAtom ranks 75)) || ((rankAtom ranks 42).ult (rankAtom ranks 55)))) = true)
    (h6597 : ((!((rankAtom ranks 55 == rankAtom ranks 42)) || ((rankAtom ranks 75).ult (rankAtom ranks 47)))) = true)
    (h6598 : ((!((rankAtom ranks 55 == rankAtom ranks 75)) || ((rankAtom ranks 42).ult (rankAtom ranks 47)))) = true)
    (h6599 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 54).ult (rankAtom ranks 55)))) = true)
    (h6600 : ((!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 48).ult (rankAtom ranks 55)))) = true)
    (h6601 : ((!((rankAtom ranks 55 == rankAtom ranks 48)) || ((rankAtom ranks 54).ult (rankAtom ranks 47)))) = true)
    (h6602 : ((!((rankAtom ranks 55 == rankAtom ranks 54)) || ((rankAtom ranks 48).ult (rankAtom ranks 47)))) = true)
    (h6603 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 76).ult (rankAtom ranks 56)))) = true)
    (h6604 : ((!((rankAtom ranks 47 == rankAtom ranks 76)) || ((rankAtom ranks 42).ult (rankAtom ranks 56)))) = true)
    (h6605 : ((!((rankAtom ranks 56 == rankAtom ranks 42)) || ((rankAtom ranks 76).ult (rankAtom ranks 47)))) = true)
    (h6606 : ((!((rankAtom ranks 56 == rankAtom ranks 76)) || ((rankAtom ranks 42).ult (rankAtom ranks 47)))) = true)
    (h6607 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 54).ult (rankAtom ranks 56)))) = true)
    (h6608 : ((!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h6609 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 54).ult (rankAtom ranks 47)))) = true)
    (h6610 : ((!((rankAtom ranks 56 == rankAtom ranks 54)) || ((rankAtom ranks 49).ult (rankAtom ranks 47)))) = true)
    (h6611 : ((!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 77).ult (rankAtom ranks 56)))) = true)
    (h6612 : ((!((rankAtom ranks 48 == rankAtom ranks 77)) || ((rankAtom ranks 42).ult (rankAtom ranks 56)))) = true)
    (h6613 : ((!((rankAtom ranks 56 == rankAtom ranks 42)) || ((rankAtom ranks 77).ult (rankAtom ranks 48)))) = true)
    (h6614 : ((!((rankAtom ranks 56 == rankAtom ranks 77)) || ((rankAtom ranks 42).ult (rankAtom ranks 48)))) = true)
    (h6615 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 55).ult (rankAtom ranks 56)))) = true)
    (h6616 : ((!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 49).ult (rankAtom ranks 56)))) = true)
    (h6617 : ((!((rankAtom ranks 56 == rankAtom ranks 49)) || ((rankAtom ranks 55).ult (rankAtom ranks 48)))) = true)
    (h6618 : ((!((rankAtom ranks 56 == rankAtom ranks 55)) || ((rankAtom ranks 49).ult (rankAtom ranks 48)))) = true)
    (h6619 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h6620 : ((!((rankAtom ranks 44 == rankAtom ranks 63)) || ((rankAtom ranks 43).ult (rankAtom ranks 58)))) = true)
    (h6621 : ((!((rankAtom ranks 58 == rankAtom ranks 43)) || ((rankAtom ranks 63).ult (rankAtom ranks 44)))) = true)
    (h6622 : ((!((rankAtom ranks 44 == rankAtom ranks 45)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h6623 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 45).ult (rankAtom ranks 44)))) = true)
    (h6624 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h6625 : ((!((rankAtom ranks 44 == rankAtom ranks 64)) || ((rankAtom ranks 43).ult (rankAtom ranks 59)))) = true)
    (h6626 : ((!((rankAtom ranks 59 == rankAtom ranks 43)) || ((rankAtom ranks 64).ult (rankAtom ranks 44)))) = true)
    (h6627 : ((!((rankAtom ranks 59 == rankAtom ranks 64)) || ((rankAtom ranks 43).ult (rankAtom ranks 44)))) = true)
    (h6628 : ((!((rankAtom ranks 44 == rankAtom ranks 46)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h6629 : ((!((rankAtom ranks 59 == rankAtom ranks 46)) || ((rankAtom ranks 57).ult (rankAtom ranks 44)))) = true)
    (h6630 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 46).ult (rankAtom ranks 44)))) = true)
    (h6631 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h6632 : ((!((rankAtom ranks 44 == rankAtom ranks 65)) || ((rankAtom ranks 43).ult (rankAtom ranks 60)))) = true)
    (h6633 : ((!((rankAtom ranks 60 == rankAtom ranks 43)) || ((rankAtom ranks 65).ult (rankAtom ranks 44)))) = true)
    (h6634 : ((!((rankAtom ranks 60 == rankAtom ranks 65)) || ((rankAtom ranks 43).ult (rankAtom ranks 44)))) = true)
    (h6635 : ((!((rankAtom ranks 44 == rankAtom ranks 47)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h6636 : ((!((rankAtom ranks 60 == rankAtom ranks 47)) || ((rankAtom ranks 57).ult (rankAtom ranks 44)))) = true)
    (h6637 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 47).ult (rankAtom ranks 44)))) = true)
    (h6638 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 66).ult (rankAtom ranks 61)))) = true)
    (h6639 : ((!((rankAtom ranks 61 == rankAtom ranks 43)) || ((rankAtom ranks 66).ult (rankAtom ranks 44)))) = true)
    (h6640 : ((!((rankAtom ranks 61 == rankAtom ranks 66)) || ((rankAtom ranks 43).ult (rankAtom ranks 44)))) = true)
    (h6641 : ((!((rankAtom ranks 44 == rankAtom ranks 48)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h6642 : ((!((rankAtom ranks 61 == rankAtom ranks 48)) || ((rankAtom ranks 57).ult (rankAtom ranks 44)))) = true)
    (h6643 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 48).ult (rankAtom ranks 44)))) = true)
    (h6644 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) = true)
    (h6645 : ((!((rankAtom ranks 62 == rankAtom ranks 43)) || ((rankAtom ranks 67).ult (rankAtom ranks 44)))) = true)
    (h6646 : ((!((rankAtom ranks 44 == rankAtom ranks 49)) || ((rankAtom ranks 57).ult (rankAtom ranks 62)))) = true)
    (h6647 : ((!((rankAtom ranks 44 == rankAtom ranks 57)) || ((rankAtom ranks 49).ult (rankAtom ranks 62)))) = true)
    (h6648 : ((!((rankAtom ranks 62 == rankAtom ranks 49)) || ((rankAtom ranks 57).ult (rankAtom ranks 44)))) = true)
    (h6649 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 49).ult (rankAtom ranks 44)))) = true)
    (h6650 : ((!((rankAtom ranks 45 == rankAtom ranks 43)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h6651 : ((!((rankAtom ranks 45 == rankAtom ranks 68)) || ((rankAtom ranks 43).ult (rankAtom ranks 59)))) = true)
    (h6652 : ((!((rankAtom ranks 59 == rankAtom ranks 43)) || ((rankAtom ranks 68).ult (rankAtom ranks 45)))) = true)
    (h6653 : ((!((rankAtom ranks 59 == rankAtom ranks 68)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h6654 : ((!((rankAtom ranks 45 == rankAtom ranks 46)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h6655 : ((!((rankAtom ranks 45 == rankAtom ranks 58)) || ((rankAtom ranks 46).ult (rankAtom ranks 59)))) = true) :
    ∀ item ∈ sourceChunk103Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk103Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6592
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6593
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6594
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6595
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6596
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6597
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6598
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6599
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6600
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6601
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6602
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6603
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6604
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6605
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6606
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6607
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6608
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6609
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6610
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6611
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6612
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6613
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6614
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6615
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6616
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6617
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6618
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6619
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6620
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6621
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6622
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6623
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6624
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6625
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6626
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6627
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6628
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6629
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6630
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6631
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6632
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6633
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6634
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6635
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6636
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6637
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6638
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6639
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6640
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6641
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6642
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6643
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6644
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6645
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6646
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6647
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6648
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6649
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6650
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6651
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6652
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6653
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6654
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6655

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
