/-
Generated packed-source bridge for verified left chunk 107.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk107_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6848 : ((!((rankAtom ranks 48 == rankAtom ranks 77)) || ((rankAtom ranks 47).ult (rankAtom ranks 76)))) = true)
    (h6849 : ((!((rankAtom ranks 76 == rankAtom ranks 47)) || ((rankAtom ranks 77).ult (rankAtom ranks 48)))) = true)
    (h6850 : ((!((rankAtom ranks 48 == rankAtom ranks 49)) || ((rankAtom ranks 75).ult (rankAtom ranks 76)))) = true)
    (h6851 : ((!((rankAtom ranks 48 == rankAtom ranks 75)) || ((rankAtom ranks 49).ult (rankAtom ranks 76)))) = true)
    (h6852 : ((!((rankAtom ranks 76 == rankAtom ranks 75)) || ((rankAtom ranks 49).ult (rankAtom ranks 48)))) = true)
    (h6853 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h6854 : ((!((rankAtom ranks 58 == rankAtom ranks 50)) || ((rankAtom ranks 63).ult (rankAtom ranks 51)))) = true)
    (h6855 : ((!((rankAtom ranks 51 == rankAtom ranks 52)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h6856 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 52).ult (rankAtom ranks 51)))) = true)
    (h6857 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h6858 : ((!((rankAtom ranks 59 == rankAtom ranks 50)) || ((rankAtom ranks 64).ult (rankAtom ranks 51)))) = true)
    (h6859 : ((!((rankAtom ranks 59 == rankAtom ranks 64)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h6860 : ((!((rankAtom ranks 51 == rankAtom ranks 53)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h6861 : ((!((rankAtom ranks 59 == rankAtom ranks 53)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h6862 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 53).ult (rankAtom ranks 51)))) = true)
    (h6863 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h6864 : ((!((rankAtom ranks 60 == rankAtom ranks 50)) || ((rankAtom ranks 65).ult (rankAtom ranks 51)))) = true)
    (h6865 : ((!((rankAtom ranks 60 == rankAtom ranks 65)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h6866 : ((!((rankAtom ranks 51 == rankAtom ranks 54)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h6867 : ((!((rankAtom ranks 60 == rankAtom ranks 54)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h6868 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 54).ult (rankAtom ranks 51)))) = true)
    (h6869 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 66).ult (rankAtom ranks 61)))) = true)
    (h6870 : ((!((rankAtom ranks 61 == rankAtom ranks 50)) || ((rankAtom ranks 66).ult (rankAtom ranks 51)))) = true)
    (h6871 : ((!((rankAtom ranks 61 == rankAtom ranks 66)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h6872 : ((!((rankAtom ranks 51 == rankAtom ranks 55)) || ((rankAtom ranks 57).ult (rankAtom ranks 61)))) = true)
    (h6873 : ((!((rankAtom ranks 61 == rankAtom ranks 55)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h6874 : ((!((rankAtom ranks 61 == rankAtom ranks 57)) || ((rankAtom ranks 55).ult (rankAtom ranks 51)))) = true)
    (h6875 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 67).ult (rankAtom ranks 62)))) = true)
    (h6876 : ((!((rankAtom ranks 62 == rankAtom ranks 50)) || ((rankAtom ranks 67).ult (rankAtom ranks 51)))) = true)
    (h6877 : ((!((rankAtom ranks 51 == rankAtom ranks 56)) || ((rankAtom ranks 57).ult (rankAtom ranks 62)))) = true)
    (h6878 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 56).ult (rankAtom ranks 62)))) = true)
    (h6879 : ((!((rankAtom ranks 62 == rankAtom ranks 56)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h6880 : ((!((rankAtom ranks 62 == rankAtom ranks 57)) || ((rankAtom ranks 56).ult (rankAtom ranks 51)))) = true)
    (h6881 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 68).ult (rankAtom ranks 59)))) = true)
    (h6882 : ((!((rankAtom ranks 52 == rankAtom ranks 68)) || ((rankAtom ranks 50).ult (rankAtom ranks 59)))) = true)
    (h6883 : ((!((rankAtom ranks 59 == rankAtom ranks 50)) || ((rankAtom ranks 68).ult (rankAtom ranks 52)))) = true)
    (h6884 : ((!((rankAtom ranks 59 == rankAtom ranks 68)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h6885 : ((!((rankAtom ranks 52 == rankAtom ranks 53)) || ((rankAtom ranks 58).ult (rankAtom ranks 59)))) = true)
    (h6886 : ((!((rankAtom ranks 59 == rankAtom ranks 53)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h6887 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 53).ult (rankAtom ranks 52)))) = true)
    (h6888 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 69).ult (rankAtom ranks 60)))) = true)
    (h6889 : ((!((rankAtom ranks 52 == rankAtom ranks 69)) || ((rankAtom ranks 50).ult (rankAtom ranks 60)))) = true)
    (h6890 : ((!((rankAtom ranks 60 == rankAtom ranks 50)) || ((rankAtom ranks 69).ult (rankAtom ranks 52)))) = true)
    (h6891 : ((!((rankAtom ranks 60 == rankAtom ranks 69)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h6892 : ((!((rankAtom ranks 52 == rankAtom ranks 54)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h6893 : ((!((rankAtom ranks 60 == rankAtom ranks 54)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h6894 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 54).ult (rankAtom ranks 52)))) = true)
    (h6895 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 70).ult (rankAtom ranks 61)))) = true)
    (h6896 : ((!((rankAtom ranks 52 == rankAtom ranks 70)) || ((rankAtom ranks 50).ult (rankAtom ranks 61)))) = true)
    (h6897 : ((!((rankAtom ranks 61 == rankAtom ranks 50)) || ((rankAtom ranks 70).ult (rankAtom ranks 52)))) = true)
    (h6898 : ((!((rankAtom ranks 61 == rankAtom ranks 70)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h6899 : ((!((rankAtom ranks 52 == rankAtom ranks 55)) || ((rankAtom ranks 58).ult (rankAtom ranks 61)))) = true)
    (h6900 : ((!((rankAtom ranks 61 == rankAtom ranks 55)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h6901 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 55).ult (rankAtom ranks 52)))) = true)
    (h6902 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 71).ult (rankAtom ranks 62)))) = true)
    (h6903 : ((!((rankAtom ranks 52 == rankAtom ranks 71)) || ((rankAtom ranks 50).ult (rankAtom ranks 62)))) = true)
    (h6904 : ((!((rankAtom ranks 62 == rankAtom ranks 50)) || ((rankAtom ranks 71).ult (rankAtom ranks 52)))) = true)
    (h6905 : ((!((rankAtom ranks 52 == rankAtom ranks 56)) || ((rankAtom ranks 58).ult (rankAtom ranks 62)))) = true)
    (h6906 : ((!((rankAtom ranks 62 == rankAtom ranks 56)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h6907 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 56).ult (rankAtom ranks 52)))) = true)
    (h6908 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 72).ult (rankAtom ranks 60)))) = true)
    (h6909 : ((!((rankAtom ranks 53 == rankAtom ranks 72)) || ((rankAtom ranks 50).ult (rankAtom ranks 60)))) = true)
    (h6910 : ((!((rankAtom ranks 60 == rankAtom ranks 50)) || ((rankAtom ranks 72).ult (rankAtom ranks 53)))) = true)
    (h6911 : ((!((rankAtom ranks 60 == rankAtom ranks 72)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true) :
    ∀ item ∈ sourceChunk107Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk107Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6848
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6849
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6850
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6851
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6852
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6853
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6854
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6855
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6856
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6857
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6858
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6859
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6860
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6861
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6862
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6863
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6864
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6865
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6866
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6867
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6868
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6869
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6870
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6871
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6872
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6873
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6874
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6875
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6876
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6877
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6878
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6879
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6880
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6881
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6882
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6883
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6884
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6885
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6886
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6887
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6888
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6889
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6890
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6891
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6892
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6893
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6894
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6895
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6896
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6897
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6898
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6899
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6900
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6901
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6902
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6903
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6904
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6905
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6906
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6907
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6908
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6909
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6910
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6911

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
