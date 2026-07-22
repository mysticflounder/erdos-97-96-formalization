/-
Generated packed-source bridge for verified left chunk 109.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk109_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6976 : ((!((rankAtom ranks 53 == rankAtom ranks 64)) || ((rankAtom ranks 54).ult (rankAtom ranks 65)))) = true)
    (h6977 : ((!((rankAtom ranks 65 == rankAtom ranks 54)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h6978 : ((!((rankAtom ranks 65 == rankAtom ranks 64)) || ((rankAtom ranks 54).ult (rankAtom ranks 53)))) = true)
    (h6979 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 73).ult (rankAtom ranks 66)))) = true)
    (h6980 : ((!((rankAtom ranks 53 == rankAtom ranks 73)) || ((rankAtom ranks 51).ult (rankAtom ranks 66)))) = true)
    (h6981 : ((!((rankAtom ranks 66 == rankAtom ranks 73)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true)
    (h6982 : ((!((rankAtom ranks 53 == rankAtom ranks 55)) || ((rankAtom ranks 64).ult (rankAtom ranks 66)))) = true)
    (h6983 : ((!((rankAtom ranks 53 == rankAtom ranks 64)) || ((rankAtom ranks 55).ult (rankAtom ranks 66)))) = true)
    (h6984 : ((!((rankAtom ranks 66 == rankAtom ranks 55)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h6985 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 74).ult (rankAtom ranks 67)))) = true)
    (h6986 : ((!((rankAtom ranks 53 == rankAtom ranks 74)) || ((rankAtom ranks 51).ult (rankAtom ranks 67)))) = true)
    (h6987 : ((!((rankAtom ranks 53 == rankAtom ranks 56)) || ((rankAtom ranks 64).ult (rankAtom ranks 67)))) = true)
    (h6988 : ((!((rankAtom ranks 53 == rankAtom ranks 64)) || ((rankAtom ranks 56).ult (rankAtom ranks 67)))) = true)
    (h6989 : ((!((rankAtom ranks 67 == rankAtom ranks 56)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h6990 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 75).ult (rankAtom ranks 66)))) = true)
    (h6991 : ((!((rankAtom ranks 54 == rankAtom ranks 75)) || ((rankAtom ranks 51).ult (rankAtom ranks 66)))) = true)
    (h6992 : ((!((rankAtom ranks 66 == rankAtom ranks 75)) || ((rankAtom ranks 51).ult (rankAtom ranks 54)))) = true)
    (h6993 : ((!((rankAtom ranks 54 == rankAtom ranks 55)) || ((rankAtom ranks 65).ult (rankAtom ranks 66)))) = true)
    (h6994 : ((!((rankAtom ranks 54 == rankAtom ranks 65)) || ((rankAtom ranks 55).ult (rankAtom ranks 66)))) = true)
    (h6995 : ((!((rankAtom ranks 66 == rankAtom ranks 55)) || ((rankAtom ranks 65).ult (rankAtom ranks 54)))) = true)
    (h6996 : ((!((rankAtom ranks 66 == rankAtom ranks 65)) || ((rankAtom ranks 55).ult (rankAtom ranks 54)))) = true)
    (h6997 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 76).ult (rankAtom ranks 67)))) = true)
    (h6998 : ((!((rankAtom ranks 54 == rankAtom ranks 76)) || ((rankAtom ranks 51).ult (rankAtom ranks 67)))) = true)
    (h6999 : ((!((rankAtom ranks 54 == rankAtom ranks 56)) || ((rankAtom ranks 65).ult (rankAtom ranks 67)))) = true)
    (h7000 : ((!((rankAtom ranks 54 == rankAtom ranks 65)) || ((rankAtom ranks 56).ult (rankAtom ranks 67)))) = true)
    (h7001 : ((!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 77).ult (rankAtom ranks 67)))) = true)
    (h7002 : ((!((rankAtom ranks 55 == rankAtom ranks 77)) || ((rankAtom ranks 51).ult (rankAtom ranks 67)))) = true)
    (h7003 : ((!((rankAtom ranks 55 == rankAtom ranks 56)) || ((rankAtom ranks 66).ult (rankAtom ranks 67)))) = true)
    (h7004 : ((!((rankAtom ranks 55 == rankAtom ranks 66)) || ((rankAtom ranks 56).ult (rankAtom ranks 67)))) = true)
    (h7005 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 72).ult (rankAtom ranks 69)))) = true)
    (h7006 : ((!((rankAtom ranks 53 == rankAtom ranks 72)) || ((rankAtom ranks 52).ult (rankAtom ranks 69)))) = true)
    (h7007 : ((!((rankAtom ranks 69 == rankAtom ranks 52)) || ((rankAtom ranks 72).ult (rankAtom ranks 53)))) = true)
    (h7008 : ((!((rankAtom ranks 69 == rankAtom ranks 72)) || ((rankAtom ranks 52).ult (rankAtom ranks 53)))) = true)
    (h7009 : ((!((rankAtom ranks 53 == rankAtom ranks 54)) || ((rankAtom ranks 68).ult (rankAtom ranks 69)))) = true)
    (h7010 : ((!((rankAtom ranks 53 == rankAtom ranks 68)) || ((rankAtom ranks 54).ult (rankAtom ranks 69)))) = true)
    (h7011 : ((!((rankAtom ranks 69 == rankAtom ranks 54)) || ((rankAtom ranks 68).ult (rankAtom ranks 53)))) = true)
    (h7012 : ((!((rankAtom ranks 69 == rankAtom ranks 68)) || ((rankAtom ranks 54).ult (rankAtom ranks 53)))) = true)
    (h7013 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 73).ult (rankAtom ranks 70)))) = true)
    (h7014 : ((!((rankAtom ranks 53 == rankAtom ranks 73)) || ((rankAtom ranks 52).ult (rankAtom ranks 70)))) = true)
    (h7015 : ((!((rankAtom ranks 70 == rankAtom ranks 52)) || ((rankAtom ranks 73).ult (rankAtom ranks 53)))) = true)
    (h7016 : ((!((rankAtom ranks 70 == rankAtom ranks 73)) || ((rankAtom ranks 52).ult (rankAtom ranks 53)))) = true)
    (h7017 : ((!((rankAtom ranks 53 == rankAtom ranks 55)) || ((rankAtom ranks 68).ult (rankAtom ranks 70)))) = true)
    (h7018 : ((!((rankAtom ranks 53 == rankAtom ranks 68)) || ((rankAtom ranks 55).ult (rankAtom ranks 70)))) = true)
    (h7019 : ((!((rankAtom ranks 70 == rankAtom ranks 55)) || ((rankAtom ranks 68).ult (rankAtom ranks 53)))) = true)
    (h7020 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 74).ult (rankAtom ranks 71)))) = true)
    (h7021 : ((!((rankAtom ranks 53 == rankAtom ranks 74)) || ((rankAtom ranks 52).ult (rankAtom ranks 71)))) = true)
    (h7022 : ((!((rankAtom ranks 71 == rankAtom ranks 52)) || ((rankAtom ranks 74).ult (rankAtom ranks 53)))) = true)
    (h7023 : ((!((rankAtom ranks 53 == rankAtom ranks 56)) || ((rankAtom ranks 68).ult (rankAtom ranks 71)))) = true)
    (h7024 : ((!((rankAtom ranks 53 == rankAtom ranks 68)) || ((rankAtom ranks 56).ult (rankAtom ranks 71)))) = true)
    (h7025 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 75).ult (rankAtom ranks 70)))) = true)
    (h7026 : ((!((rankAtom ranks 54 == rankAtom ranks 75)) || ((rankAtom ranks 52).ult (rankAtom ranks 70)))) = true)
    (h7027 : ((!((rankAtom ranks 70 == rankAtom ranks 52)) || ((rankAtom ranks 75).ult (rankAtom ranks 54)))) = true)
    (h7028 : ((!((rankAtom ranks 70 == rankAtom ranks 75)) || ((rankAtom ranks 52).ult (rankAtom ranks 54)))) = true)
    (h7029 : ((!((rankAtom ranks 54 == rankAtom ranks 55)) || ((rankAtom ranks 69).ult (rankAtom ranks 70)))) = true)
    (h7030 : ((!((rankAtom ranks 54 == rankAtom ranks 69)) || ((rankAtom ranks 55).ult (rankAtom ranks 70)))) = true)
    (h7031 : ((!((rankAtom ranks 70 == rankAtom ranks 55)) || ((rankAtom ranks 69).ult (rankAtom ranks 54)))) = true)
    (h7032 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 76).ult (rankAtom ranks 71)))) = true)
    (h7033 : ((!((rankAtom ranks 54 == rankAtom ranks 76)) || ((rankAtom ranks 52).ult (rankAtom ranks 71)))) = true)
    (h7034 : ((!((rankAtom ranks 71 == rankAtom ranks 52)) || ((rankAtom ranks 76).ult (rankAtom ranks 54)))) = true)
    (h7035 : ((!((rankAtom ranks 54 == rankAtom ranks 56)) || ((rankAtom ranks 69).ult (rankAtom ranks 71)))) = true)
    (h7036 : ((!((rankAtom ranks 54 == rankAtom ranks 69)) || ((rankAtom ranks 56).ult (rankAtom ranks 71)))) = true)
    (h7037 : ((!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 77).ult (rankAtom ranks 71)))) = true)
    (h7038 : ((!((rankAtom ranks 55 == rankAtom ranks 77)) || ((rankAtom ranks 52).ult (rankAtom ranks 71)))) = true)
    (h7039 : ((!((rankAtom ranks 55 == rankAtom ranks 56)) || ((rankAtom ranks 70).ult (rankAtom ranks 71)))) = true) :
    ∀ item ∈ sourceChunk109Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk109Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6976
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6977
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6978
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6979
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6980
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6981
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6982
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6983
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6984
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6985
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6986
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6987
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6988
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6989
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6990
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6991
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6992
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6993
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6994
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6995
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6996
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6997
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6998
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6999
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7000
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7001
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7002
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7003
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7004
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7005
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7006
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7007
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7008
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7009
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7010
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7011
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7012
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7013
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7014
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7015
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7016
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7017
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7018
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7019
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7020
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7021
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7022
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7023
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7024
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7025
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7026
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7027
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7028
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7029
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7030
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7031
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7032
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7033
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7034
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7035
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7036
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7037
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7038
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7039

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
