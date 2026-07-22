/-
Generated packed-source bridge for verified middle chunk 074.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk074_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4736 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 19).ult (rankAtom ranks 46)))) = true)
    (h4737 : ((!((rankAtom ranks 46 == rankAtom ranks 19)) || ((rankAtom ranks 43).ult (rankAtom ranks 16)))) = true)
    (h4738 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 19).ult (rankAtom ranks 16)))) = true)
    (h4739 : ((!((rankAtom ranks 16 == rankAtom ranks 14)) || ((rankAtom ranks 60).ult (rankAtom ranks 47)))) = true)
    (h4740 : ((!((rankAtom ranks 16 == rankAtom ranks 60)) || ((rankAtom ranks 14).ult (rankAtom ranks 47)))) = true)
    (h4741 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 60).ult (rankAtom ranks 16)))) = true)
    (h4742 : ((!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 14).ult (rankAtom ranks 16)))) = true)
    (h4743 : ((!((rankAtom ranks 16 == rankAtom ranks 20)) || ((rankAtom ranks 43).ult (rankAtom ranks 47)))) = true)
    (h4744 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 20).ult (rankAtom ranks 47)))) = true)
    (h4745 : ((!((rankAtom ranks 47 == rankAtom ranks 20)) || ((rankAtom ranks 43).ult (rankAtom ranks 16)))) = true)
    (h4746 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 20).ult (rankAtom ranks 16)))) = true)
    (h4747 : ((!((rankAtom ranks 16 == rankAtom ranks 14)) || ((rankAtom ranks 61).ult (rankAtom ranks 48)))) = true)
    (h4748 : ((!((rankAtom ranks 16 == rankAtom ranks 61)) || ((rankAtom ranks 14).ult (rankAtom ranks 48)))) = true)
    (h4749 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 61).ult (rankAtom ranks 16)))) = true)
    (h4750 : ((!((rankAtom ranks 48 == rankAtom ranks 61)) || ((rankAtom ranks 14).ult (rankAtom ranks 16)))) = true)
    (h4751 : ((!((rankAtom ranks 16 == rankAtom ranks 21)) || ((rankAtom ranks 43).ult (rankAtom ranks 48)))) = true)
    (h4752 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 21).ult (rankAtom ranks 48)))) = true)
    (h4753 : ((!((rankAtom ranks 48 == rankAtom ranks 21)) || ((rankAtom ranks 43).ult (rankAtom ranks 16)))) = true)
    (h4754 : ((!((rankAtom ranks 48 == rankAtom ranks 43)) || ((rankAtom ranks 21).ult (rankAtom ranks 16)))) = true)
    (h4755 : ((!((rankAtom ranks 16 == rankAtom ranks 14)) || ((rankAtom ranks 62).ult (rankAtom ranks 49)))) = true)
    (h4756 : ((!((rankAtom ranks 16 == rankAtom ranks 62)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h4757 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 62).ult (rankAtom ranks 16)))) = true)
    (h4758 : ((!((rankAtom ranks 49 == rankAtom ranks 62)) || ((rankAtom ranks 14).ult (rankAtom ranks 16)))) = true)
    (h4759 : ((!((rankAtom ranks 16 == rankAtom ranks 22)) || ((rankAtom ranks 43).ult (rankAtom ranks 49)))) = true)
    (h4760 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 22).ult (rankAtom ranks 49)))) = true)
    (h4761 : ((!((rankAtom ranks 49 == rankAtom ranks 43)) || ((rankAtom ranks 22).ult (rankAtom ranks 16)))) = true)
    (h4762 : ((!((rankAtom ranks 17 == rankAtom ranks 14)) || ((rankAtom ranks 63).ult (rankAtom ranks 45)))) = true)
    (h4763 : ((!((rankAtom ranks 45 == rankAtom ranks 14)) || ((rankAtom ranks 63).ult (rankAtom ranks 17)))) = true)
    (h4764 : ((!((rankAtom ranks 17 == rankAtom ranks 18)) || ((rankAtom ranks 44).ult (rankAtom ranks 45)))) = true)
    (h4765 : ((!((rankAtom ranks 17 == rankAtom ranks 44)) || ((rankAtom ranks 18).ult (rankAtom ranks 45)))) = true)
    (h4766 : ((!((rankAtom ranks 45 == rankAtom ranks 18)) || ((rankAtom ranks 44).ult (rankAtom ranks 17)))) = true)
    (h4767 : ((!((rankAtom ranks 45 == rankAtom ranks 44)) || ((rankAtom ranks 18).ult (rankAtom ranks 17)))) = true)
    (h4768 : ((!((rankAtom ranks 17 == rankAtom ranks 14)) || ((rankAtom ranks 64).ult (rankAtom ranks 46)))) = true)
    (h4769 : ((!((rankAtom ranks 17 == rankAtom ranks 64)) || ((rankAtom ranks 14).ult (rankAtom ranks 46)))) = true)
    (h4770 : ((!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 64).ult (rankAtom ranks 17)))) = true)
    (h4771 : ((!((rankAtom ranks 46 == rankAtom ranks 64)) || ((rankAtom ranks 14).ult (rankAtom ranks 17)))) = true)
    (h4772 : ((!((rankAtom ranks 17 == rankAtom ranks 19)) || ((rankAtom ranks 44).ult (rankAtom ranks 46)))) = true)
    (h4773 : ((!((rankAtom ranks 46 == rankAtom ranks 19)) || ((rankAtom ranks 44).ult (rankAtom ranks 17)))) = true)
    (h4774 : ((!((rankAtom ranks 46 == rankAtom ranks 44)) || ((rankAtom ranks 19).ult (rankAtom ranks 17)))) = true)
    (h4775 : ((!((rankAtom ranks 17 == rankAtom ranks 14)) || ((rankAtom ranks 65).ult (rankAtom ranks 47)))) = true)
    (h4776 : ((!((rankAtom ranks 17 == rankAtom ranks 65)) || ((rankAtom ranks 14).ult (rankAtom ranks 47)))) = true)
    (h4777 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 65).ult (rankAtom ranks 17)))) = true)
    (h4778 : ((!((rankAtom ranks 47 == rankAtom ranks 65)) || ((rankAtom ranks 14).ult (rankAtom ranks 17)))) = true)
    (h4779 : ((!((rankAtom ranks 17 == rankAtom ranks 20)) || ((rankAtom ranks 44).ult (rankAtom ranks 47)))) = true)
    (h4780 : ((!((rankAtom ranks 17 == rankAtom ranks 44)) || ((rankAtom ranks 20).ult (rankAtom ranks 47)))) = true)
    (h4781 : ((!((rankAtom ranks 47 == rankAtom ranks 20)) || ((rankAtom ranks 44).ult (rankAtom ranks 17)))) = true)
    (h4782 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 20).ult (rankAtom ranks 17)))) = true)
    (h4783 : ((!((rankAtom ranks 17 == rankAtom ranks 14)) || ((rankAtom ranks 66).ult (rankAtom ranks 48)))) = true)
    (h4784 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 66).ult (rankAtom ranks 17)))) = true)
    (h4785 : ((!((rankAtom ranks 48 == rankAtom ranks 66)) || ((rankAtom ranks 14).ult (rankAtom ranks 17)))) = true)
    (h4786 : ((!((rankAtom ranks 17 == rankAtom ranks 21)) || ((rankAtom ranks 44).ult (rankAtom ranks 48)))) = true)
    (h4787 : ((!((rankAtom ranks 17 == rankAtom ranks 44)) || ((rankAtom ranks 21).ult (rankAtom ranks 48)))) = true)
    (h4788 : ((!((rankAtom ranks 48 == rankAtom ranks 21)) || ((rankAtom ranks 44).ult (rankAtom ranks 17)))) = true)
    (h4789 : ((!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 21).ult (rankAtom ranks 17)))) = true)
    (h4790 : ((!((rankAtom ranks 17 == rankAtom ranks 14)) || ((rankAtom ranks 67).ult (rankAtom ranks 49)))) = true)
    (h4791 : ((!((rankAtom ranks 17 == rankAtom ranks 67)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h4792 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 67).ult (rankAtom ranks 17)))) = true)
    (h4793 : ((!((rankAtom ranks 17 == rankAtom ranks 22)) || ((rankAtom ranks 44).ult (rankAtom ranks 49)))) = true)
    (h4794 : ((!((rankAtom ranks 17 == rankAtom ranks 44)) || ((rankAtom ranks 22).ult (rankAtom ranks 49)))) = true)
    (h4795 : ((!((rankAtom ranks 49 == rankAtom ranks 44)) || ((rankAtom ranks 22).ult (rankAtom ranks 17)))) = true)
    (h4796 : ((!((rankAtom ranks 18 == rankAtom ranks 14)) || ((rankAtom ranks 68).ult (rankAtom ranks 46)))) = true)
    (h4797 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 14).ult (rankAtom ranks 46)))) = true)
    (h4798 : ((!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 68).ult (rankAtom ranks 18)))) = true)
    (h4799 : ((!((rankAtom ranks 46 == rankAtom ranks 68)) || ((rankAtom ranks 14).ult (rankAtom ranks 18)))) = true) :
    ∀ item ∈ sourceChunk074Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk074Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4736
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4737
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4738
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4739
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4740
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4741
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4742
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4743
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4744
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4745
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4746
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4747
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4748
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4749
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4750
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4751
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4752
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4753
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4754
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4755
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4756
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4757
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4758
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4759
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4760
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4761
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4762
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4763
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4764
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4765
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4766
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4767
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4768
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4769
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4770
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4771
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4772
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4773
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4774
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4775
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4776
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4777
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4778
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4779
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4780
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4781
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4782
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4783
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4784
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4785
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4786
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4787
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4788
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4789
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4790
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4791
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4792
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4793
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4794
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4795
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4796
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4797
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4798
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4799

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
