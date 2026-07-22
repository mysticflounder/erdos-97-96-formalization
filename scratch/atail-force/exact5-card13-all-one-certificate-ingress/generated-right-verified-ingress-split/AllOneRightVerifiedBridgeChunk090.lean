/-
Generated packed-source bridge for verified right chunk 090.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk090_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5760 : ((!((rankAtom ranks 61 == rankAtom ranks 66)) || ((rankAtom ranks 26).ult (rankAtom ranks 27)))) = true)
    (h5761 : ((!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h5762 : ((!((rankAtom ranks 61 == rankAtom ranks 31)) || ((rankAtom ranks 57).ult (rankAtom ranks 27)))) = true)
    (h5763 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 31).ult (rankAtom ranks 27)))) = true)
    (h5764 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) = true)
    (h5765 : ((!((rankAtom ranks 62 == rankAtom ranks 26)) || ((rankAtom ranks 67).ult (rankAtom ranks 27)))) = true)
    (h5766 : ((!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 57).ult (rankAtom ranks 62)))) = true)
    (h5767 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 32).ult (rankAtom ranks 27)))) = true)
    (h5768 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h5769 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 26).ult (rankAtom ranks 59)))) = true)
    (h5770 : ((!((rankAtom ranks 59 == rankAtom ranks 26)) || ((rankAtom ranks 68).ult (rankAtom ranks 28)))) = true)
    (h5771 : ((!((rankAtom ranks 59 == rankAtom ranks 68)) || ((rankAtom ranks 26).ult (rankAtom ranks 28)))) = true)
    (h5772 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h5773 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 29).ult (rankAtom ranks 59)))) = true)
    (h5774 : ((!((rankAtom ranks 59 == rankAtom ranks 29)) || ((rankAtom ranks 58).ult (rankAtom ranks 28)))) = true)
    (h5775 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 29).ult (rankAtom ranks 28)))) = true)
    (h5776 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 69).ult (rankAtom ranks 60)))) = true)
    (h5777 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 26).ult (rankAtom ranks 60)))) = true)
    (h5778 : ((!((rankAtom ranks 60 == rankAtom ranks 26)) || ((rankAtom ranks 69).ult (rankAtom ranks 28)))) = true)
    (h5779 : ((!((rankAtom ranks 60 == rankAtom ranks 69)) || ((rankAtom ranks 26).ult (rankAtom ranks 28)))) = true)
    (h5780 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h5781 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 30).ult (rankAtom ranks 60)))) = true)
    (h5782 : ((!((rankAtom ranks 60 == rankAtom ranks 30)) || ((rankAtom ranks 58).ult (rankAtom ranks 28)))) = true)
    (h5783 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 30).ult (rankAtom ranks 28)))) = true)
    (h5784 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 70).ult (rankAtom ranks 61)))) = true)
    (h5785 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 26).ult (rankAtom ranks 61)))) = true)
    (h5786 : ((!((rankAtom ranks 61 == rankAtom ranks 26)) || ((rankAtom ranks 70).ult (rankAtom ranks 28)))) = true)
    (h5787 : ((!((rankAtom ranks 61 == rankAtom ranks 70)) || ((rankAtom ranks 26).ult (rankAtom ranks 28)))) = true)
    (h5788 : ((!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 58).ult (rankAtom ranks 61)))) = true)
    (h5789 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 31).ult (rankAtom ranks 61)))) = true)
    (h5790 : ((!((rankAtom ranks 61 == rankAtom ranks 31)) || ((rankAtom ranks 58).ult (rankAtom ranks 28)))) = true)
    (h5791 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 31).ult (rankAtom ranks 28)))) = true)
    (h5792 : ((!((rankAtom ranks 28 == rankAtom ranks 26)) || ((rankAtom ranks 71).ult (rankAtom ranks 62)))) = true)
    (h5793 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 26).ult (rankAtom ranks 62)))) = true)
    (h5794 : ((!((rankAtom ranks 62 == rankAtom ranks 26)) || ((rankAtom ranks 71).ult (rankAtom ranks 28)))) = true)
    (h5795 : ((!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 58).ult (rankAtom ranks 62)))) = true)
    (h5796 : ((!((rankAtom ranks 28 == rankAtom ranks 58)) || ((rankAtom ranks 32).ult (rankAtom ranks 62)))) = true)
    (h5797 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 32).ult (rankAtom ranks 28)))) = true)
    (h5798 : ((!((rankAtom ranks 29 == rankAtom ranks 26)) || ((rankAtom ranks 72).ult (rankAtom ranks 60)))) = true)
    (h5799 : ((!((rankAtom ranks 29 == rankAtom ranks 72)) || ((rankAtom ranks 26).ult (rankAtom ranks 60)))) = true)
    (h5800 : ((!((rankAtom ranks 60 == rankAtom ranks 26)) || ((rankAtom ranks 72).ult (rankAtom ranks 29)))) = true)
    (h5801 : ((!((rankAtom ranks 60 == rankAtom ranks 72)) || ((rankAtom ranks 26).ult (rankAtom ranks 29)))) = true)
    (h5802 : ((!((rankAtom ranks 29 == rankAtom ranks 30)) || ((rankAtom ranks 59).ult (rankAtom ranks 60)))) = true)
    (h5803 : ((!((rankAtom ranks 29 == rankAtom ranks 59)) || ((rankAtom ranks 30).ult (rankAtom ranks 60)))) = true)
    (h5804 : ((!((rankAtom ranks 60 == rankAtom ranks 30)) || ((rankAtom ranks 59).ult (rankAtom ranks 29)))) = true)
    (h5805 : ((!((rankAtom ranks 60 == rankAtom ranks 59)) || ((rankAtom ranks 30).ult (rankAtom ranks 29)))) = true)
    (h5806 : ((!((rankAtom ranks 29 == rankAtom ranks 26)) || ((rankAtom ranks 73).ult (rankAtom ranks 61)))) = true)
    (h5807 : ((!((rankAtom ranks 29 == rankAtom ranks 73)) || ((rankAtom ranks 26).ult (rankAtom ranks 61)))) = true)
    (h5808 : ((!((rankAtom ranks 61 == rankAtom ranks 26)) || ((rankAtom ranks 73).ult (rankAtom ranks 29)))) = true)
    (h5809 : ((!((rankAtom ranks 61 == rankAtom ranks 73)) || ((rankAtom ranks 26).ult (rankAtom ranks 29)))) = true)
    (h5810 : ((!((rankAtom ranks 29 == rankAtom ranks 31)) || ((rankAtom ranks 59).ult (rankAtom ranks 61)))) = true)
    (h5811 : ((!((rankAtom ranks 29 == rankAtom ranks 59)) || ((rankAtom ranks 31).ult (rankAtom ranks 61)))) = true)
    (h5812 : ((!((rankAtom ranks 61 == rankAtom ranks 31)) || ((rankAtom ranks 59).ult (rankAtom ranks 29)))) = true)
    (h5813 : ((!((rankAtom ranks 61 == rankAtom ranks 59)) || ((rankAtom ranks 31).ult (rankAtom ranks 29)))) = true)
    (h5814 : ((!((rankAtom ranks 29 == rankAtom ranks 26)) || ((rankAtom ranks 74).ult (rankAtom ranks 62)))) = true)
    (h5815 : ((!((rankAtom ranks 29 == rankAtom ranks 74)) || ((rankAtom ranks 26).ult (rankAtom ranks 62)))) = true)
    (h5816 : ((!((rankAtom ranks 62 == rankAtom ranks 26)) || ((rankAtom ranks 74).ult (rankAtom ranks 29)))) = true)
    (h5817 : ((!((rankAtom ranks 29 == rankAtom ranks 32)) || ((rankAtom ranks 59).ult (rankAtom ranks 62)))) = true)
    (h5818 : ((!((rankAtom ranks 29 == rankAtom ranks 59)) || ((rankAtom ranks 32).ult (rankAtom ranks 62)))) = true)
    (h5819 : ((!((rankAtom ranks 62 == rankAtom ranks 59)) || ((rankAtom ranks 32).ult (rankAtom ranks 29)))) = true)
    (h5820 : ((!((rankAtom ranks 30 == rankAtom ranks 26)) || ((rankAtom ranks 75).ult (rankAtom ranks 61)))) = true)
    (h5821 : ((!((rankAtom ranks 30 == rankAtom ranks 75)) || ((rankAtom ranks 26).ult (rankAtom ranks 61)))) = true)
    (h5822 : ((!((rankAtom ranks 61 == rankAtom ranks 26)) || ((rankAtom ranks 75).ult (rankAtom ranks 30)))) = true)
    (h5823 : ((!((rankAtom ranks 61 == rankAtom ranks 75)) || ((rankAtom ranks 26).ult (rankAtom ranks 30)))) = true) :
    ∀ item ∈ sourceChunk090Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk090Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5760
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5761
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5762
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5763
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5764
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5765
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5766
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5767
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5768
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5769
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5770
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5771
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5772
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5773
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5774
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5775
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5776
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5777
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5778
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5779
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5780
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5781
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5782
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5783
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5784
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5785
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5786
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5787
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5788
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5789
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5790
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5791
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5792
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5793
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5794
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5795
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5796
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5797
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5798
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5799
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5800
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5801
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5802
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5803
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5804
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5805
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5806
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5807
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5808
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5809
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5810
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5811
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5812
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5813
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5814
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5815
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5816
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5817
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5818
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5819
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5820
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5821
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5822
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5823

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
