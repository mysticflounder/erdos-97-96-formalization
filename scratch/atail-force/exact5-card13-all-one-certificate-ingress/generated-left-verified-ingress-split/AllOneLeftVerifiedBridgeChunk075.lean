/-
Generated packed-source bridge for verified left chunk 075.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk075_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4800 : ((!((rankAtom ranks 18 == rankAtom ranks 19)) || ((rankAtom ranks 45).ult (rankAtom ranks 46)))) = true)
    (h4801 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 19).ult (rankAtom ranks 46)))) = true)
    (h4802 : ((!((rankAtom ranks 46 == rankAtom ranks 19)) || ((rankAtom ranks 45).ult (rankAtom ranks 18)))) = true)
    (h4803 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 19).ult (rankAtom ranks 18)))) = true)
    (h4804 : ((!((rankAtom ranks 18 == rankAtom ranks 14)) || ((rankAtom ranks 69).ult (rankAtom ranks 47)))) = true)
    (h4805 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 14).ult (rankAtom ranks 47)))) = true)
    (h4806 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 69).ult (rankAtom ranks 18)))) = true)
    (h4807 : ((!((rankAtom ranks 47 == rankAtom ranks 69)) || ((rankAtom ranks 14).ult (rankAtom ranks 18)))) = true)
    (h4808 : ((!((rankAtom ranks 18 == rankAtom ranks 20)) || ((rankAtom ranks 45).ult (rankAtom ranks 47)))) = true)
    (h4809 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 20).ult (rankAtom ranks 47)))) = true)
    (h4810 : ((!((rankAtom ranks 47 == rankAtom ranks 20)) || ((rankAtom ranks 45).ult (rankAtom ranks 18)))) = true)
    (h4811 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 20).ult (rankAtom ranks 18)))) = true)
    (h4812 : ((!((rankAtom ranks 18 == rankAtom ranks 14)) || ((rankAtom ranks 70).ult (rankAtom ranks 48)))) = true)
    (h4813 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 14).ult (rankAtom ranks 48)))) = true)
    (h4814 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 70).ult (rankAtom ranks 18)))) = true)
    (h4815 : ((!((rankAtom ranks 48 == rankAtom ranks 70)) || ((rankAtom ranks 14).ult (rankAtom ranks 18)))) = true)
    (h4816 : ((!((rankAtom ranks 18 == rankAtom ranks 21)) || ((rankAtom ranks 45).ult (rankAtom ranks 48)))) = true)
    (h4817 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 21).ult (rankAtom ranks 48)))) = true)
    (h4818 : ((!((rankAtom ranks 48 == rankAtom ranks 21)) || ((rankAtom ranks 45).ult (rankAtom ranks 18)))) = true)
    (h4819 : ((!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 21).ult (rankAtom ranks 18)))) = true)
    (h4820 : ((!((rankAtom ranks 18 == rankAtom ranks 14)) || ((rankAtom ranks 71).ult (rankAtom ranks 49)))) = true)
    (h4821 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h4822 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 71).ult (rankAtom ranks 18)))) = true)
    (h4823 : ((!((rankAtom ranks 18 == rankAtom ranks 22)) || ((rankAtom ranks 45).ult (rankAtom ranks 49)))) = true)
    (h4824 : ((!((rankAtom ranks 18 == rankAtom ranks 45)) || ((rankAtom ranks 22).ult (rankAtom ranks 49)))) = true)
    (h4825 : ((!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 22).ult (rankAtom ranks 18)))) = true)
    (h4826 : ((!((rankAtom ranks 19 == rankAtom ranks 14)) || ((rankAtom ranks 72).ult (rankAtom ranks 47)))) = true)
    (h4827 : ((!((rankAtom ranks 19 == rankAtom ranks 72)) || ((rankAtom ranks 14).ult (rankAtom ranks 47)))) = true)
    (h4828 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 72).ult (rankAtom ranks 19)))) = true)
    (h4829 : ((!((rankAtom ranks 47 == rankAtom ranks 72)) || ((rankAtom ranks 14).ult (rankAtom ranks 19)))) = true)
    (h4830 : ((!((rankAtom ranks 19 == rankAtom ranks 20)) || ((rankAtom ranks 46).ult (rankAtom ranks 47)))) = true)
    (h4831 : ((!((rankAtom ranks 19 == rankAtom ranks 46)) || ((rankAtom ranks 20).ult (rankAtom ranks 47)))) = true)
    (h4832 : ((!((rankAtom ranks 47 == rankAtom ranks 20)) || ((rankAtom ranks 46).ult (rankAtom ranks 19)))) = true)
    (h4833 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 20).ult (rankAtom ranks 19)))) = true)
    (h4834 : ((!((rankAtom ranks 19 == rankAtom ranks 14)) || ((rankAtom ranks 73).ult (rankAtom ranks 48)))) = true)
    (h4835 : ((!((rankAtom ranks 19 == rankAtom ranks 73)) || ((rankAtom ranks 14).ult (rankAtom ranks 48)))) = true)
    (h4836 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 73).ult (rankAtom ranks 19)))) = true)
    (h4837 : ((!((rankAtom ranks 48 == rankAtom ranks 73)) || ((rankAtom ranks 14).ult (rankAtom ranks 19)))) = true)
    (h4838 : ((!((rankAtom ranks 19 == rankAtom ranks 21)) || ((rankAtom ranks 46).ult (rankAtom ranks 48)))) = true)
    (h4839 : ((!((rankAtom ranks 19 == rankAtom ranks 46)) || ((rankAtom ranks 21).ult (rankAtom ranks 48)))) = true)
    (h4840 : ((!((rankAtom ranks 48 == rankAtom ranks 21)) || ((rankAtom ranks 46).ult (rankAtom ranks 19)))) = true)
    (h4841 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 21).ult (rankAtom ranks 19)))) = true)
    (h4842 : ((!((rankAtom ranks 19 == rankAtom ranks 14)) || ((rankAtom ranks 74).ult (rankAtom ranks 49)))) = true)
    (h4843 : ((!((rankAtom ranks 19 == rankAtom ranks 74)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h4844 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 74).ult (rankAtom ranks 19)))) = true)
    (h4845 : ((!((rankAtom ranks 49 == rankAtom ranks 74)) || ((rankAtom ranks 14).ult (rankAtom ranks 19)))) = true)
    (h4846 : ((!((rankAtom ranks 19 == rankAtom ranks 22)) || ((rankAtom ranks 46).ult (rankAtom ranks 49)))) = true)
    (h4847 : ((!((rankAtom ranks 19 == rankAtom ranks 46)) || ((rankAtom ranks 22).ult (rankAtom ranks 49)))) = true)
    (h4848 : ((!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 22).ult (rankAtom ranks 19)))) = true)
    (h4849 : ((!((rankAtom ranks 20 == rankAtom ranks 14)) || ((rankAtom ranks 75).ult (rankAtom ranks 48)))) = true)
    (h4850 : ((!((rankAtom ranks 20 == rankAtom ranks 75)) || ((rankAtom ranks 14).ult (rankAtom ranks 48)))) = true)
    (h4851 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 75).ult (rankAtom ranks 20)))) = true)
    (h4852 : ((!((rankAtom ranks 48 == rankAtom ranks 75)) || ((rankAtom ranks 14).ult (rankAtom ranks 20)))) = true)
    (h4853 : ((!((rankAtom ranks 20 == rankAtom ranks 21)) || ((rankAtom ranks 47).ult (rankAtom ranks 48)))) = true)
    (h4854 : ((!((rankAtom ranks 20 == rankAtom ranks 47)) || ((rankAtom ranks 21).ult (rankAtom ranks 48)))) = true)
    (h4855 : ((!((rankAtom ranks 48 == rankAtom ranks 21)) || ((rankAtom ranks 47).ult (rankAtom ranks 20)))) = true)
    (h4856 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 21).ult (rankAtom ranks 20)))) = true)
    (h4857 : ((!((rankAtom ranks 20 == rankAtom ranks 14)) || ((rankAtom ranks 76).ult (rankAtom ranks 49)))) = true)
    (h4858 : ((!((rankAtom ranks 20 == rankAtom ranks 76)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h4859 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 76).ult (rankAtom ranks 20)))) = true)
    (h4860 : ((!((rankAtom ranks 49 == rankAtom ranks 76)) || ((rankAtom ranks 14).ult (rankAtom ranks 20)))) = true)
    (h4861 : ((!((rankAtom ranks 20 == rankAtom ranks 22)) || ((rankAtom ranks 47).ult (rankAtom ranks 49)))) = true)
    (h4862 : ((!((rankAtom ranks 20 == rankAtom ranks 47)) || ((rankAtom ranks 22).ult (rankAtom ranks 49)))) = true)
    (h4863 : ((!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 22).ult (rankAtom ranks 20)))) = true) :
    ∀ item ∈ sourceChunk075Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk075Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4800
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4801
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4802
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4803
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4804
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4805
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4806
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4807
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4808
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4809
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4810
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4811
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4812
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4813
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4814
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4815
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4816
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4817
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4818
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4819
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4820
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4821
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4822
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4823
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4824
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4825
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4826
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4827
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4828
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4829
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4830
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4831
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4832
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4833
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4834
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4835
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4836
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4837
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4838
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4839
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4840
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4841
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4842
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4843
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4844
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4845
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4846
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4847
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4848
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4849
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4850
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4851
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4852
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4853
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4854
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4855
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4856
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4857
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4858
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4859
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4860
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4861
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4862
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4863

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
