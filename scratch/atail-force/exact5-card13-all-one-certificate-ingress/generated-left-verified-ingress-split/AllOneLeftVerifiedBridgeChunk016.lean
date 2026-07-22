/-
Generated packed-source bridge for verified left chunk 016.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk016_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1024 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 6 && rowBit rows 0 2 5 && rowBit rows 0 2 6))) = true)
    (h1025 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 7 && rowBit rows 0 2 5 && rowBit rows 0 2 7))) = true)
    (h1026 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 9 && rowBit rows 0 2 5 && rowBit rows 0 2 9))) = true)
    (h1027 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 10 && rowBit rows 0 2 5 && rowBit rows 0 2 10))) = true)
    (h1028 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 11 && rowBit rows 0 2 5 && rowBit rows 0 2 11))) = true)
    (h1029 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 12 && rowBit rows 0 2 5 && rowBit rows 0 2 12))) = true)
    (h1030 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 7 && rowBit rows 0 2 6 && rowBit rows 0 2 7))) = true)
    (h1031 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 8 && rowBit rows 0 2 6 && rowBit rows 0 2 8))) = true)
    (h1032 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 9 && rowBit rows 0 2 6 && rowBit rows 0 2 9))) = true)
    (h1033 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 11 && rowBit rows 0 2 6 && rowBit rows 0 2 11))) = true)
    (h1034 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 12 && rowBit rows 0 2 6 && rowBit rows 0 2 12))) = true)
    (h1035 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 9 && rowBit rows 0 2 7 && rowBit rows 0 2 9))) = true)
    (h1036 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 11 && rowBit rows 0 2 7 && rowBit rows 0 2 11))) = true)
    (h1037 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 12 && rowBit rows 0 2 7 && rowBit rows 0 2 12))) = true)
    (h1038 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 12 && rowBit rows 0 2 8 && rowBit rows 0 2 12))) = true)
    (h1039 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 10 && rowBit rows 0 2 9 && rowBit rows 0 2 10))) = true)
    (h1040 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 11 && rowBit rows 0 2 9 && rowBit rows 0 2 11))) = true)
    (h1041 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 12 && rowBit rows 0 2 9 && rowBit rows 0 2 12))) = true)
    (h1042 : (!((rowBit rows 0 1 10 && rowBit rows 0 1 11 && rowBit rows 0 2 10 && rowBit rows 0 2 11))) = true)
    (h1043 : (!((rowBit rows 0 1 11 && rowBit rows 0 1 12 && rowBit rows 0 2 11 && rowBit rows 0 2 12))) = true)
    (h1044 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 10 && rowBit rows 0 3 6 && rowBit rows 0 3 10))) = true)
    (h1045 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 8 && rowBit rows 0 3 7 && rowBit rows 0 3 8))) = true)
    (h1046 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 10 && rowBit rows 0 3 7 && rowBit rows 0 3 10))) = true)
    (h1047 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 12 && rowBit rows 0 3 7 && rowBit rows 0 3 12))) = true)
    (h1048 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 10 && rowBit rows 0 3 8 && rowBit rows 0 3 10))) = true)
    (h1049 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 11 && rowBit rows 0 3 8 && rowBit rows 0 3 11))) = true)
    (h1050 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 12 && rowBit rows 0 3 8 && rowBit rows 0 3 12))) = true)
    (h1051 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 11 && rowBit rows 0 3 9 && rowBit rows 0 3 11))) = true)
    (h1052 : (!((rowBit rows 0 1 11 && rowBit rows 0 1 12 && rowBit rows 0 3 11 && rowBit rows 0 3 12))) = true)
    (h1053 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 11 && rowBit rows 0 4 5 && rowBit rows 0 4 11))) = true)
    (h1054 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 12 && rowBit rows 0 4 5 && rowBit rows 0 4 12))) = true)
    (h1055 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 9 && rowBit rows 0 4 6 && rowBit rows 0 4 9))) = true)
    (h1056 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 11 && rowBit rows 0 4 6 && rowBit rows 0 4 11))) = true)
    (h1057 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 12 && rowBit rows 0 4 6 && rowBit rows 0 4 12))) = true)
    (h1058 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 12 && rowBit rows 0 4 7 && rowBit rows 0 4 12))) = true)
    (h1059 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 9 && rowBit rows 0 4 8 && rowBit rows 0 4 9))) = true)
    (h1060 : (!((rowBit rows 0 1 8 && rowBit rows 0 1 11 && rowBit rows 0 4 8 && rowBit rows 0 4 11))) = true)
    (h1061 : (!((rowBit rows 0 1 9 && rowBit rows 0 1 10 && rowBit rows 0 4 9 && rowBit rows 0 4 10))) = true)
    (h1062 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 7 && rowBit rows 0 3 5 && rowBit rows 0 3 7))) = true)
    (h1063 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 8 && rowBit rows 0 3 5 && rowBit rows 0 3 8))) = true)
    (h1064 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 11 && rowBit rows 0 3 5 && rowBit rows 0 3 11))) = true)
    (h1065 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 12 && rowBit rows 0 3 5 && rowBit rows 0 3 12))) = true)
    (h1066 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 9 && rowBit rows 0 3 6 && rowBit rows 0 3 9))) = true)
    (h1067 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 11 && rowBit rows 0 3 6 && rowBit rows 0 3 11))) = true)
    (h1068 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 0 3 7 && rowBit rows 0 3 10))) = true)
    (h1069 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 11 && rowBit rows 0 3 7 && rowBit rows 0 3 11))) = true)
    (h1070 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 0 3 8 && rowBit rows 0 3 9))) = true)
    (h1071 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 0 3 8 && rowBit rows 0 3 10))) = true)
    (h1072 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 11 && rowBit rows 0 3 8 && rowBit rows 0 3 11))) = true)
    (h1073 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 0 3 8 && rowBit rows 0 3 12))) = true)
    (h1074 : (!((rowBit rows 0 2 9 && rowBit rows 0 2 12 && rowBit rows 0 3 9 && rowBit rows 0 3 12))) = true)
    (h1075 : (!((rowBit rows 0 2 10 && rowBit rows 0 2 12 && rowBit rows 0 3 10 && rowBit rows 0 3 12))) = true)
    (h1076 : (!((rowBit rows 0 2 11 && rowBit rows 0 2 12 && rowBit rows 0 3 11 && rowBit rows 0 3 12))) = true)
    (h1077 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 12 && rowBit rows 0 4 5 && rowBit rows 0 4 12))) = true)
    (h1078 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 9 && rowBit rows 0 4 6 && rowBit rows 0 4 9))) = true)
    (h1079 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 11 && rowBit rows 0 4 6 && rowBit rows 0 4 11))) = true)
    (h1080 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 0 4 7 && rowBit rows 0 4 10))) = true)
    (h1081 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 11 && rowBit rows 0 4 7 && rowBit rows 0 4 11))) = true)
    (h1082 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 12 && rowBit rows 0 4 7 && rowBit rows 0 4 12))) = true)
    (h1083 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 0 4 8 && rowBit rows 0 4 9))) = true)
    (h1084 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 0 4 8 && rowBit rows 0 4 10))) = true)
    (h1085 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 12 && rowBit rows 0 4 8 && rowBit rows 0 4 12))) = true)
    (h1086 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 11 && rowBit rows 0 4 6 && rowBit rows 0 4 11))) = true)
    (h1087 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 12 && rowBit rows 0 4 6 && rowBit rows 0 4 12))) = true) :
    ∀ item ∈ sourceChunk016Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk016Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1024
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1025
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1026
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1027
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1028
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1029
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1030
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1031
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1032
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1033
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1034
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1035
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1036
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1037
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1038
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1039
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1040
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1041
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1042
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1043
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1044
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1045
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1046
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1047
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1048
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1049
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1050
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1051
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1052
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1053
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1054
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1055
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1056
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1057
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1058
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1059
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1060
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1061
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1062
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1063
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1064
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1065
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1066
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1067
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1068
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1069
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1070
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1071
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1072
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1073
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1074
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1075
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1076
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1077
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1078
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1079
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1080
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1081
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1082
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1083
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1084
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1085
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1086
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1087

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
