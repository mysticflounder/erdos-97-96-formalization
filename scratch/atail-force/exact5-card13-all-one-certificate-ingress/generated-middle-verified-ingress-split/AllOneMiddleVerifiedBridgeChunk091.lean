/-
Generated packed-source bridge for verified middle chunk 091.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk091_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5824 : ((!((rankAtom ranks 30 == rankAtom ranks 31)) || ((rankAtom ranks 60).ult (rankAtom ranks 61)))) = true)
    (h5825 : ((!((rankAtom ranks 30 == rankAtom ranks 60)) || ((rankAtom ranks 31).ult (rankAtom ranks 61)))) = true)
    (h5826 : ((!((rankAtom ranks 61 == rankAtom ranks 31)) || ((rankAtom ranks 60).ult (rankAtom ranks 30)))) = true)
    (h5827 : ((!((rankAtom ranks 61 == rankAtom ranks 60)) || ((rankAtom ranks 31).ult (rankAtom ranks 30)))) = true)
    (h5828 : ((!((rankAtom ranks 30 == rankAtom ranks 26)) || ((rankAtom ranks 76).ult (rankAtom ranks 62)))) = true)
    (h5829 : ((!((rankAtom ranks 30 == rankAtom ranks 76)) || ((rankAtom ranks 26).ult (rankAtom ranks 62)))) = true)
    (h5830 : ((!((rankAtom ranks 62 == rankAtom ranks 26)) || ((rankAtom ranks 76).ult (rankAtom ranks 30)))) = true)
    (h5831 : ((!((rankAtom ranks 30 == rankAtom ranks 32)) || ((rankAtom ranks 60).ult (rankAtom ranks 62)))) = true)
    (h5832 : ((!((rankAtom ranks 30 == rankAtom ranks 60)) || ((rankAtom ranks 32).ult (rankAtom ranks 62)))) = true)
    (h5833 : ((!((rankAtom ranks 62 == rankAtom ranks 60)) || ((rankAtom ranks 32).ult (rankAtom ranks 30)))) = true)
    (h5834 : ((!((rankAtom ranks 31 == rankAtom ranks 77)) || ((rankAtom ranks 26).ult (rankAtom ranks 62)))) = true)
    (h5835 : ((!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 61).ult (rankAtom ranks 62)))) = true)
    (h5836 : ((!((rankAtom ranks 31 == rankAtom ranks 61)) || ((rankAtom ranks 32).ult (rankAtom ranks 62)))) = true)
    (h5837 : ((!((rankAtom ranks 62 == rankAtom ranks 61)) || ((rankAtom ranks 32).ult (rankAtom ranks 31)))) = true)
    (h5838 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h5839 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 27).ult (rankAtom ranks 64)))) = true)
    (h5840 : ((!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 27).ult (rankAtom ranks 28)))) = true)
    (h5841 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h5842 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 29).ult (rankAtom ranks 64)))) = true)
    (h5843 : ((!((rankAtom ranks 64 == rankAtom ranks 29)) || ((rankAtom ranks 63).ult (rankAtom ranks 28)))) = true)
    (h5844 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h5845 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 27).ult (rankAtom ranks 65)))) = true)
    (h5846 : ((!((rankAtom ranks 65 == rankAtom ranks 27)) || ((rankAtom ranks 69).ult (rankAtom ranks 28)))) = true)
    (h5847 : ((!((rankAtom ranks 65 == rankAtom ranks 69)) || ((rankAtom ranks 27).ult (rankAtom ranks 28)))) = true)
    (h5848 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 63).ult (rankAtom ranks 65)))) = true)
    (h5849 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 30).ult (rankAtom ranks 65)))) = true)
    (h5850 : ((!((rankAtom ranks 65 == rankAtom ranks 30)) || ((rankAtom ranks 63).ult (rankAtom ranks 28)))) = true)
    (h5851 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h5852 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 27).ult (rankAtom ranks 66)))) = true)
    (h5853 : ((!((rankAtom ranks 66 == rankAtom ranks 27)) || ((rankAtom ranks 70).ult (rankAtom ranks 28)))) = true)
    (h5854 : ((!((rankAtom ranks 66 == rankAtom ranks 70)) || ((rankAtom ranks 27).ult (rankAtom ranks 28)))) = true)
    (h5855 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 31).ult (rankAtom ranks 66)))) = true)
    (h5856 : ((!((rankAtom ranks 66 == rankAtom ranks 31)) || ((rankAtom ranks 63).ult (rankAtom ranks 28)))) = true)
    (h5857 : ((!((rankAtom ranks 28 == rankAtom ranks 27)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h5858 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 27).ult (rankAtom ranks 67)))) = true)
    (h5859 : ((!((rankAtom ranks 67 == rankAtom ranks 27)) || ((rankAtom ranks 71).ult (rankAtom ranks 28)))) = true)
    (h5860 : ((!((rankAtom ranks 28 == rankAtom ranks 63)) || ((rankAtom ranks 32).ult (rankAtom ranks 67)))) = true)
    (h5861 : ((!((rankAtom ranks 29 == rankAtom ranks 27)) || ((rankAtom ranks 72).ult (rankAtom ranks 65)))) = true)
    (h5862 : ((!((rankAtom ranks 29 == rankAtom ranks 72)) || ((rankAtom ranks 27).ult (rankAtom ranks 65)))) = true)
    (h5863 : ((!((rankAtom ranks 65 == rankAtom ranks 72)) || ((rankAtom ranks 27).ult (rankAtom ranks 29)))) = true)
    (h5864 : ((!((rankAtom ranks 29 == rankAtom ranks 30)) || ((rankAtom ranks 64).ult (rankAtom ranks 65)))) = true)
    (h5865 : ((!((rankAtom ranks 29 == rankAtom ranks 64)) || ((rankAtom ranks 30).ult (rankAtom ranks 65)))) = true)
    (h5866 : ((!((rankAtom ranks 65 == rankAtom ranks 30)) || ((rankAtom ranks 64).ult (rankAtom ranks 29)))) = true)
    (h5867 : ((!((rankAtom ranks 65 == rankAtom ranks 64)) || ((rankAtom ranks 30).ult (rankAtom ranks 29)))) = true)
    (h5868 : ((!((rankAtom ranks 29 == rankAtom ranks 27)) || ((rankAtom ranks 73).ult (rankAtom ranks 66)))) = true)
    (h5869 : ((!((rankAtom ranks 29 == rankAtom ranks 73)) || ((rankAtom ranks 27).ult (rankAtom ranks 66)))) = true)
    (h5870 : ((!((rankAtom ranks 66 == rankAtom ranks 73)) || ((rankAtom ranks 27).ult (rankAtom ranks 29)))) = true)
    (h5871 : ((!((rankAtom ranks 29 == rankAtom ranks 31)) || ((rankAtom ranks 64).ult (rankAtom ranks 66)))) = true)
    (h5872 : ((!((rankAtom ranks 29 == rankAtom ranks 64)) || ((rankAtom ranks 31).ult (rankAtom ranks 66)))) = true)
    (h5873 : ((!((rankAtom ranks 66 == rankAtom ranks 31)) || ((rankAtom ranks 64).ult (rankAtom ranks 29)))) = true)
    (h5874 : ((!((rankAtom ranks 29 == rankAtom ranks 27)) || ((rankAtom ranks 74).ult (rankAtom ranks 67)))) = true)
    (h5875 : ((!((rankAtom ranks 29 == rankAtom ranks 74)) || ((rankAtom ranks 27).ult (rankAtom ranks 67)))) = true)
    (h5876 : ((!((rankAtom ranks 29 == rankAtom ranks 32)) || ((rankAtom ranks 64).ult (rankAtom ranks 67)))) = true)
    (h5877 : ((!((rankAtom ranks 29 == rankAtom ranks 64)) || ((rankAtom ranks 32).ult (rankAtom ranks 67)))) = true)
    (h5878 : ((!((rankAtom ranks 30 == rankAtom ranks 27)) || ((rankAtom ranks 75).ult (rankAtom ranks 66)))) = true)
    (h5879 : ((!((rankAtom ranks 30 == rankAtom ranks 75)) || ((rankAtom ranks 27).ult (rankAtom ranks 66)))) = true)
    (h5880 : ((!((rankAtom ranks 66 == rankAtom ranks 75)) || ((rankAtom ranks 27).ult (rankAtom ranks 30)))) = true)
    (h5881 : ((!((rankAtom ranks 30 == rankAtom ranks 31)) || ((rankAtom ranks 65).ult (rankAtom ranks 66)))) = true)
    (h5882 : ((!((rankAtom ranks 30 == rankAtom ranks 65)) || ((rankAtom ranks 31).ult (rankAtom ranks 66)))) = true)
    (h5883 : ((!((rankAtom ranks 66 == rankAtom ranks 31)) || ((rankAtom ranks 65).ult (rankAtom ranks 30)))) = true)
    (h5884 : ((!((rankAtom ranks 30 == rankAtom ranks 27)) || ((rankAtom ranks 76).ult (rankAtom ranks 67)))) = true)
    (h5885 : ((!((rankAtom ranks 30 == rankAtom ranks 76)) || ((rankAtom ranks 27).ult (rankAtom ranks 67)))) = true)
    (h5886 : ((!((rankAtom ranks 30 == rankAtom ranks 32)) || ((rankAtom ranks 65).ult (rankAtom ranks 67)))) = true)
    (h5887 : ((!((rankAtom ranks 30 == rankAtom ranks 65)) || ((rankAtom ranks 32).ult (rankAtom ranks 67)))) = true) :
    ∀ item ∈ sourceChunk091Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk091Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5824
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5825
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5826
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5827
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5828
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5829
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5830
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5831
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5832
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5833
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5834
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5835
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5836
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5837
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5838
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5839
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5840
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5841
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5842
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5843
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5844
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5845
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5846
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5847
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5848
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5849
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5850
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5851
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5852
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5853
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5854
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5855
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5856
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5857
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5858
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5859
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5860
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5861
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5862
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5863
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5864
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5865
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5866
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5867
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5868
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5869
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5870
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5871
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5872
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5873
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5874
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5875
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5876
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5877
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5878
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5879
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5880
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5881
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5882
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5883
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5884
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5885
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5886
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5887

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
