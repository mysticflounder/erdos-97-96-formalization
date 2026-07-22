/-
Generated packed-source bridge for verified left chunk 088.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk088_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5632 : ((!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 62).ult (rankAtom ranks 26)))) = true)
    (h5633 : ((!((rankAtom ranks 56 == rankAtom ranks 62)) || ((rankAtom ranks 25).ult (rankAtom ranks 26)))) = true)
    (h5634 : ((!((rankAtom ranks 26 == rankAtom ranks 32)) || ((rankAtom ranks 50).ult (rankAtom ranks 56)))) = true)
    (h5635 : ((!((rankAtom ranks 26 == rankAtom ranks 50)) || ((rankAtom ranks 32).ult (rankAtom ranks 56)))) = true)
    (h5636 : ((!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 32).ult (rankAtom ranks 26)))) = true)
    (h5637 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 63).ult (rankAtom ranks 52)))) = true)
    (h5638 : ((!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h5639 : ((!((rankAtom ranks 27 == rankAtom ranks 51)) || ((rankAtom ranks 28).ult (rankAtom ranks 52)))) = true)
    (h5640 : ((!((rankAtom ranks 52 == rankAtom ranks 28)) || ((rankAtom ranks 51).ult (rankAtom ranks 27)))) = true)
    (h5641 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 28).ult (rankAtom ranks 27)))) = true)
    (h5642 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h5643 : ((!((rankAtom ranks 53 == rankAtom ranks 25)) || ((rankAtom ranks 64).ult (rankAtom ranks 27)))) = true)
    (h5644 : ((!((rankAtom ranks 53 == rankAtom ranks 64)) || ((rankAtom ranks 25).ult (rankAtom ranks 27)))) = true)
    (h5645 : ((!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true)
    (h5646 : ((!((rankAtom ranks 53 == rankAtom ranks 29)) || ((rankAtom ranks 51).ult (rankAtom ranks 27)))) = true)
    (h5647 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 29).ult (rankAtom ranks 27)))) = true)
    (h5648 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 65).ult (rankAtom ranks 54)))) = true)
    (h5649 : ((!((rankAtom ranks 54 == rankAtom ranks 25)) || ((rankAtom ranks 65).ult (rankAtom ranks 27)))) = true)
    (h5650 : ((!((rankAtom ranks 54 == rankAtom ranks 65)) || ((rankAtom ranks 25).ult (rankAtom ranks 27)))) = true)
    (h5651 : ((!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 51).ult (rankAtom ranks 54)))) = true)
    (h5652 : ((!((rankAtom ranks 54 == rankAtom ranks 30)) || ((rankAtom ranks 51).ult (rankAtom ranks 27)))) = true)
    (h5653 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 30).ult (rankAtom ranks 27)))) = true)
    (h5654 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 66).ult (rankAtom ranks 55)))) = true)
    (h5655 : ((!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 66).ult (rankAtom ranks 27)))) = true)
    (h5656 : ((!((rankAtom ranks 55 == rankAtom ranks 66)) || ((rankAtom ranks 25).ult (rankAtom ranks 27)))) = true)
    (h5657 : ((!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 51).ult (rankAtom ranks 55)))) = true)
    (h5658 : ((!((rankAtom ranks 55 == rankAtom ranks 31)) || ((rankAtom ranks 51).ult (rankAtom ranks 27)))) = true)
    (h5659 : ((!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 31).ult (rankAtom ranks 27)))) = true)
    (h5660 : ((!((rankAtom ranks 27 == rankAtom ranks 25)) || ((rankAtom ranks 67).ult (rankAtom ranks 56)))) = true)
    (h5661 : ((!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 67).ult (rankAtom ranks 27)))) = true)
    (h5662 : ((!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 51).ult (rankAtom ranks 56)))) = true)
    (h5663 : ((!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 32).ult (rankAtom ranks 27)))) = true)
    (h5664 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 68).ult (rankAtom ranks 53)))) = true)
    (h5665 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 25).ult (rankAtom ranks 53)))) = true)
    (h5666 : ((!((rankAtom ranks 53 == rankAtom ranks 25)) || ((rankAtom ranks 68).ult (rankAtom ranks 28)))) = true)
    (h5667 : ((!((rankAtom ranks 53 == rankAtom ranks 68)) || ((rankAtom ranks 25).ult (rankAtom ranks 28)))) = true)
    (h5668 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 52).ult (rankAtom ranks 53)))) = true)
    (h5669 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 29).ult (rankAtom ranks 53)))) = true)
    (h5670 : ((!((rankAtom ranks 53 == rankAtom ranks 29)) || ((rankAtom ranks 52).ult (rankAtom ranks 28)))) = true)
    (h5671 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 29).ult (rankAtom ranks 28)))) = true)
    (h5672 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 69).ult (rankAtom ranks 54)))) = true)
    (h5673 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 25).ult (rankAtom ranks 54)))) = true)
    (h5674 : ((!((rankAtom ranks 54 == rankAtom ranks 25)) || ((rankAtom ranks 69).ult (rankAtom ranks 28)))) = true)
    (h5675 : ((!((rankAtom ranks 54 == rankAtom ranks 69)) || ((rankAtom ranks 25).ult (rankAtom ranks 28)))) = true)
    (h5676 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 52).ult (rankAtom ranks 54)))) = true)
    (h5677 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 30).ult (rankAtom ranks 54)))) = true)
    (h5678 : ((!((rankAtom ranks 54 == rankAtom ranks 30)) || ((rankAtom ranks 52).ult (rankAtom ranks 28)))) = true)
    (h5679 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 30).ult (rankAtom ranks 28)))) = true)
    (h5680 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 70).ult (rankAtom ranks 55)))) = true)
    (h5681 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 25).ult (rankAtom ranks 55)))) = true)
    (h5682 : ((!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 70).ult (rankAtom ranks 28)))) = true)
    (h5683 : ((!((rankAtom ranks 55 == rankAtom ranks 70)) || ((rankAtom ranks 25).ult (rankAtom ranks 28)))) = true)
    (h5684 : ((!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 52).ult (rankAtom ranks 55)))) = true)
    (h5685 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 31).ult (rankAtom ranks 55)))) = true)
    (h5686 : ((!((rankAtom ranks 55 == rankAtom ranks 31)) || ((rankAtom ranks 52).ult (rankAtom ranks 28)))) = true)
    (h5687 : ((!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 31).ult (rankAtom ranks 28)))) = true)
    (h5688 : ((!((rankAtom ranks 28 == rankAtom ranks 25)) || ((rankAtom ranks 71).ult (rankAtom ranks 56)))) = true)
    (h5689 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 25).ult (rankAtom ranks 56)))) = true)
    (h5690 : ((!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 71).ult (rankAtom ranks 28)))) = true)
    (h5691 : ((!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 52).ult (rankAtom ranks 56)))) = true)
    (h5692 : ((!((rankAtom ranks 28 == rankAtom ranks 52)) || ((rankAtom ranks 32).ult (rankAtom ranks 56)))) = true)
    (h5693 : ((!((rankAtom ranks 56 == rankAtom ranks 32)) || ((rankAtom ranks 52).ult (rankAtom ranks 28)))) = true)
    (h5694 : ((!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 32).ult (rankAtom ranks 28)))) = true)
    (h5695 : ((!((rankAtom ranks 29 == rankAtom ranks 25)) || ((rankAtom ranks 72).ult (rankAtom ranks 54)))) = true) :
    ∀ item ∈ sourceChunk088Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk088Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5632
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5633
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5634
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5635
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5636
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5637
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5638
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5639
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5640
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5641
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5642
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5643
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5644
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5645
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5646
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5647
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5648
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5649
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5650
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5651
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5652
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5653
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5654
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5655
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5656
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5657
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5658
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5659
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5660
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5661
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5662
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5663
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5664
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5665
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5666
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5667
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5668
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5669
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5670
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5671
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5672
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5673
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5674
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5675
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5676
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5677
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5678
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5679
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5680
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5681
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5682
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5683
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5684
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5685
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5686
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5687
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5688
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5689
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5690
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5691
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5692
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5693
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5694
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5695

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
