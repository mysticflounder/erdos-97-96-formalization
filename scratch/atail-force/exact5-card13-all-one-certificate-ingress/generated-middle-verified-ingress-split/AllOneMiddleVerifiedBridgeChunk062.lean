/-
Generated packed-source bridge for verified middle chunk 062.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk062_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3968 : ((!((rankAtom ranks 53 == rankAtom ranks 8)) || ((rankAtom ranks 51).ult (rankAtom ranks 6)))) = true)
    (h3969 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 8).ult (rankAtom ranks 6)))) = true)
    (h3970 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 65).ult (rankAtom ranks 54)))) = true)
    (h3971 : ((!((rankAtom ranks 6 == rankAtom ranks 65)) || ((rankAtom ranks 4).ult (rankAtom ranks 54)))) = true)
    (h3972 : ((!((rankAtom ranks 54 == rankAtom ranks 4)) || ((rankAtom ranks 65).ult (rankAtom ranks 6)))) = true)
    (h3973 : ((!((rankAtom ranks 54 == rankAtom ranks 65)) || ((rankAtom ranks 4).ult (rankAtom ranks 6)))) = true)
    (h3974 : ((!((rankAtom ranks 6 == rankAtom ranks 9)) || ((rankAtom ranks 51).ult (rankAtom ranks 54)))) = true)
    (h3975 : ((!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 9).ult (rankAtom ranks 54)))) = true)
    (h3976 : ((!((rankAtom ranks 54 == rankAtom ranks 9)) || ((rankAtom ranks 51).ult (rankAtom ranks 6)))) = true)
    (h3977 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 9).ult (rankAtom ranks 6)))) = true)
    (h3978 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 66).ult (rankAtom ranks 55)))) = true)
    (h3979 : ((!((rankAtom ranks 6 == rankAtom ranks 66)) || ((rankAtom ranks 4).ult (rankAtom ranks 55)))) = true)
    (h3980 : ((!((rankAtom ranks 55 == rankAtom ranks 4)) || ((rankAtom ranks 66).ult (rankAtom ranks 6)))) = true)
    (h3981 : ((!((rankAtom ranks 55 == rankAtom ranks 66)) || ((rankAtom ranks 4).ult (rankAtom ranks 6)))) = true)
    (h3982 : ((!((rankAtom ranks 6 == rankAtom ranks 10)) || ((rankAtom ranks 51).ult (rankAtom ranks 55)))) = true)
    (h3983 : ((!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 10).ult (rankAtom ranks 55)))) = true)
    (h3984 : ((!((rankAtom ranks 55 == rankAtom ranks 10)) || ((rankAtom ranks 51).ult (rankAtom ranks 6)))) = true)
    (h3985 : ((!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 10).ult (rankAtom ranks 6)))) = true)
    (h3986 : ((!((rankAtom ranks 6 == rankAtom ranks 4)) || ((rankAtom ranks 67).ult (rankAtom ranks 56)))) = true)
    (h3987 : ((!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 67).ult (rankAtom ranks 6)))) = true)
    (h3988 : ((!((rankAtom ranks 56 == rankAtom ranks 67)) || ((rankAtom ranks 4).ult (rankAtom ranks 6)))) = true)
    (h3989 : ((!((rankAtom ranks 6 == rankAtom ranks 11)) || ((rankAtom ranks 51).ult (rankAtom ranks 56)))) = true)
    (h3990 : ((!((rankAtom ranks 6 == rankAtom ranks 51)) || ((rankAtom ranks 11).ult (rankAtom ranks 56)))) = true)
    (h3991 : ((!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 11).ult (rankAtom ranks 6)))) = true)
    (h3992 : ((!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 68).ult (rankAtom ranks 53)))) = true)
    (h3993 : ((!((rankAtom ranks 7 == rankAtom ranks 68)) || ((rankAtom ranks 4).ult (rankAtom ranks 53)))) = true)
    (h3994 : ((!((rankAtom ranks 53 == rankAtom ranks 4)) || ((rankAtom ranks 68).ult (rankAtom ranks 7)))) = true)
    (h3995 : ((!((rankAtom ranks 53 == rankAtom ranks 68)) || ((rankAtom ranks 4).ult (rankAtom ranks 7)))) = true)
    (h3996 : ((!((rankAtom ranks 7 == rankAtom ranks 8)) || ((rankAtom ranks 52).ult (rankAtom ranks 53)))) = true)
    (h3997 : ((!((rankAtom ranks 7 == rankAtom ranks 52)) || ((rankAtom ranks 8).ult (rankAtom ranks 53)))) = true)
    (h3998 : ((!((rankAtom ranks 53 == rankAtom ranks 8)) || ((rankAtom ranks 52).ult (rankAtom ranks 7)))) = true)
    (h3999 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 8).ult (rankAtom ranks 7)))) = true)
    (h4000 : ((!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 69).ult (rankAtom ranks 54)))) = true)
    (h4001 : ((!((rankAtom ranks 7 == rankAtom ranks 69)) || ((rankAtom ranks 4).ult (rankAtom ranks 54)))) = true)
    (h4002 : ((!((rankAtom ranks 54 == rankAtom ranks 4)) || ((rankAtom ranks 69).ult (rankAtom ranks 7)))) = true)
    (h4003 : ((!((rankAtom ranks 54 == rankAtom ranks 69)) || ((rankAtom ranks 4).ult (rankAtom ranks 7)))) = true)
    (h4004 : ((!((rankAtom ranks 7 == rankAtom ranks 9)) || ((rankAtom ranks 52).ult (rankAtom ranks 54)))) = true)
    (h4005 : ((!((rankAtom ranks 7 == rankAtom ranks 52)) || ((rankAtom ranks 9).ult (rankAtom ranks 54)))) = true)
    (h4006 : ((!((rankAtom ranks 54 == rankAtom ranks 9)) || ((rankAtom ranks 52).ult (rankAtom ranks 7)))) = true)
    (h4007 : ((!((rankAtom ranks 54 == rankAtom ranks 52)) || ((rankAtom ranks 9).ult (rankAtom ranks 7)))) = true)
    (h4008 : ((!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 70).ult (rankAtom ranks 55)))) = true)
    (h4009 : ((!((rankAtom ranks 55 == rankAtom ranks 4)) || ((rankAtom ranks 70).ult (rankAtom ranks 7)))) = true)
    (h4010 : ((!((rankAtom ranks 55 == rankAtom ranks 70)) || ((rankAtom ranks 4).ult (rankAtom ranks 7)))) = true)
    (h4011 : ((!((rankAtom ranks 7 == rankAtom ranks 52)) || ((rankAtom ranks 10).ult (rankAtom ranks 55)))) = true)
    (h4012 : ((!((rankAtom ranks 55 == rankAtom ranks 10)) || ((rankAtom ranks 52).ult (rankAtom ranks 7)))) = true)
    (h4013 : ((!((rankAtom ranks 55 == rankAtom ranks 52)) || ((rankAtom ranks 10).ult (rankAtom ranks 7)))) = true)
    (h4014 : ((!((rankAtom ranks 7 == rankAtom ranks 4)) || ((rankAtom ranks 71).ult (rankAtom ranks 56)))) = true)
    (h4015 : ((!((rankAtom ranks 56 == rankAtom ranks 4)) || ((rankAtom ranks 71).ult (rankAtom ranks 7)))) = true)
    (h4016 : ((!((rankAtom ranks 7 == rankAtom ranks 52)) || ((rankAtom ranks 11).ult (rankAtom ranks 56)))) = true)
    (h4017 : ((!((rankAtom ranks 56 == rankAtom ranks 52)) || ((rankAtom ranks 11).ult (rankAtom ranks 7)))) = true)
    (h4018 : ((!((rankAtom ranks 8 == rankAtom ranks 4)) || ((rankAtom ranks 72).ult (rankAtom ranks 54)))) = true)
    (h4019 : ((!((rankAtom ranks 8 == rankAtom ranks 72)) || ((rankAtom ranks 4).ult (rankAtom ranks 54)))) = true)
    (h4020 : ((!((rankAtom ranks 54 == rankAtom ranks 4)) || ((rankAtom ranks 72).ult (rankAtom ranks 8)))) = true)
    (h4021 : ((!((rankAtom ranks 54 == rankAtom ranks 72)) || ((rankAtom ranks 4).ult (rankAtom ranks 8)))) = true)
    (h4022 : ((!((rankAtom ranks 8 == rankAtom ranks 53)) || ((rankAtom ranks 9).ult (rankAtom ranks 54)))) = true)
    (h4023 : ((!((rankAtom ranks 54 == rankAtom ranks 9)) || ((rankAtom ranks 53).ult (rankAtom ranks 8)))) = true)
    (h4024 : ((!((rankAtom ranks 54 == rankAtom ranks 53)) || ((rankAtom ranks 9).ult (rankAtom ranks 8)))) = true)
    (h4025 : ((!((rankAtom ranks 8 == rankAtom ranks 4)) || ((rankAtom ranks 73).ult (rankAtom ranks 55)))) = true)
    (h4026 : ((!((rankAtom ranks 8 == rankAtom ranks 73)) || ((rankAtom ranks 4).ult (rankAtom ranks 55)))) = true)
    (h4027 : ((!((rankAtom ranks 55 == rankAtom ranks 4)) || ((rankAtom ranks 73).ult (rankAtom ranks 8)))) = true)
    (h4028 : ((!((rankAtom ranks 55 == rankAtom ranks 73)) || ((rankAtom ranks 4).ult (rankAtom ranks 8)))) = true)
    (h4029 : ((!((rankAtom ranks 8 == rankAtom ranks 53)) || ((rankAtom ranks 10).ult (rankAtom ranks 55)))) = true)
    (h4030 : ((!((rankAtom ranks 55 == rankAtom ranks 10)) || ((rankAtom ranks 53).ult (rankAtom ranks 8)))) = true)
    (h4031 : ((!((rankAtom ranks 55 == rankAtom ranks 53)) || ((rankAtom ranks 10).ult (rankAtom ranks 8)))) = true) :
    ∀ item ∈ sourceChunk062Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk062Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3968
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3969
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3970
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3971
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3972
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3973
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3974
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3975
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3976
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3977
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3978
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3979
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3980
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3981
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3982
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3983
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3984
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3985
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3986
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3987
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3988
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3989
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3990
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3991
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3992
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3993
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3994
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3995
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3996
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3997
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3998
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3999
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4000
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4001
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4002
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4003
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4004
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4005
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4006
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4007
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4008
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4009
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4010
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4011
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4012
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4013
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4014
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4015
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4016
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4017
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4018
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4019
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4020
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4021
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4022
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4023
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4024
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4025
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4026
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4027
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4028
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4029
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4030
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4031

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
