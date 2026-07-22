/-
Generated packed-source bridge for verified middle chunk 017.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk017_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1088 : (!((rowBit rows 0 3 8 && rowBit rows 0 3 12 && rowBit rows 0 4 8 && rowBit rows 0 4 12))) = true)
    (h1089 : (!((rowBit rows 0 3 9 && rowBit rows 0 3 11 && rowBit rows 0 4 9 && rowBit rows 0 4 11))) = true)
    (h1090 : (!(rowBit rows 1 0 0)) = true)
    (h1091 : (!(rowBit rows 1 1 1)) = true)
    (h1092 : (!(rowBit rows 1 2 2)) = true)
    (h1093 : (!(rowBit rows 1 3 3)) = true)
    (h1094 : (!(rowBit rows 1 4 4)) = true)
    (h1095 : (!(rowBit rows 1 5 5)) = true)
    (h1096 : (!(rowBit rows 1 6 6)) = true)
    (h1097 : (!(rowBit rows 1 7 7)) = true)
    (h1098 : (!(rowBit rows 1 8 8)) = true)
    (h1099 : ((((bif rowBit rows 1 8 0 then 1#4 else 0#4) + (bif rowBit rows 1 8 1 then 1#4 else 0#4) + (bif rowBit rows 1 8 2 then 1#4 else 0#4) + (bif rowBit rows 1 8 3 then 1#4 else 0#4) + (bif rowBit rows 1 8 4 then 1#4 else 0#4) + (bif rowBit rows 1 8 5 then 1#4 else 0#4) + (bif rowBit rows 1 8 6 then 1#4 else 0#4) + (bif rowBit rows 1 8 7 then 1#4 else 0#4) + (bif rowBit rows 1 8 8 then 1#4 else 0#4) + (bif rowBit rows 1 8 9 then 1#4 else 0#4) + (bif rowBit rows 1 8 10 then 1#4 else 0#4) + (bif rowBit rows 1 8 11 then 1#4 else 0#4) + (bif rowBit rows 1 8 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h1100 : (!(rowBit rows 1 9 9)) = true)
    (h1101 : (!(rowBit rows 1 10 10)) = true)
    (h1102 : (!(rowBit rows 1 11 11)) = true)
    (h1103 : (!(rowBit rows 1 12 12)) = true)
    (h1104 : ((((bif (rowBit rows 1 0 10 && rowBit rows 1 0 11) then 1#4 else 0#4) + (bif (rowBit rows 1 1 10 && rowBit rows 1 1 11) then 1#4 else 0#4) + (bif (rowBit rows 1 2 10 && rowBit rows 1 2 11) then 1#4 else 0#4) + (bif (rowBit rows 1 3 10 && rowBit rows 1 3 11) then 1#4 else 0#4) + (bif (rowBit rows 1 4 10 && rowBit rows 1 4 11) then 1#4 else 0#4) + (bif (rowBit rows 1 5 10 && rowBit rows 1 5 11) then 1#4 else 0#4) + (bif (rowBit rows 1 6 10 && rowBit rows 1 6 11) then 1#4 else 0#4) + (bif (rowBit rows 1 7 10 && rowBit rows 1 7 11) then 1#4 else 0#4) + (bif (rowBit rows 1 8 10 && rowBit rows 1 8 11) then 1#4 else 0#4) + (bif (rowBit rows 1 9 10 && rowBit rows 1 9 11) then 1#4 else 0#4) + (bif (rowBit rows 1 10 10 && rowBit rows 1 10 11) then 1#4 else 0#4) + (bif (rowBit rows 1 11 10 && rowBit rows 1 11 11) then 1#4 else 0#4) + (bif (rowBit rows 1 12 10 && rowBit rows 1 12 11) then 1#4 else 0#4))).ule 2#4) = true)
    (h1105 : (!((rowBit rows 1 0 4 && rowBit rows 1 0 5 && rowBit rows 1 1 4 && rowBit rows 1 1 5))) = true)
    (h1106 : (!((rowBit rows 1 1 4 && rowBit rows 1 1 5 && rowBit rows 1 2 4 && rowBit rows 1 2 5))) = true)
    (h1107 : (!((rowBit rows 1 6 3 && rowBit rows 1 6 4 && rowBit rows 1 8 3 && rowBit rows 1 8 4))) = true)
    (h1108 : (!((rowBit rows 1 7 3 && rowBit rows 1 7 4 && rowBit rows 1 8 3 && rowBit rows 1 8 4))) = true)
    (h1109 : (!((rowBit rows 1 9 0 && rowBit rows 1 9 8 && rowBit rows 1 11 0 && rowBit rows 1 11 8))) = true)
    (h1110 : (!((rowBit rows 1 9 10 && rowBit rows 1 9 11 && rowBit rows 1 12 10 && rowBit rows 1 12 11))) = true)
    (h1111 : (!((rowBit rows 1 10 2 && rowBit rows 1 10 9 && rowBit rows 1 11 2 && rowBit rows 1 11 9))) = true)
    (h1112 : (!((rowBit rows 1 10 2 && rowBit rows 1 10 9 && rowBit rows 1 12 2 && rowBit rows 1 12 9))) = true)
    (h1113 : (!((rowBit rows 1 11 2 && rowBit rows 1 11 9 && rowBit rows 1 12 2 && rowBit rows 1 12 9))) = true)
    (h1114 : ((((bif rowBit rows 1 0 0 then 1#4 else 0#4) + (bif rowBit rows 1 0 8 then 1#4 else 0#4) + (bif rowBit rows 1 0 9 then 1#4 else 0#4) + (bif rowBit rows 1 0 10 then 1#4 else 0#4) + (bif rowBit rows 1 0 11 then 1#4 else 0#4) + (bif rowBit rows 1 0 12 then 1#4 else 0#4))).ule 1#4) = true)
    (h1115 : ((((bif rowBit rows 1 4 0 then 1#4 else 0#4) + (bif rowBit rows 1 4 1 then 1#4 else 0#4) + (bif rowBit rows 1 4 2 then 1#4 else 0#4) + (bif rowBit rows 1 4 3 then 1#4 else 0#4) + (bif rowBit rows 1 4 4 then 1#4 else 0#4))).ule 1#4) = true)
    (h1116 : (!(rowBit rows 2 0 0)) = true)
    (h1117 : (!(rowBit rows 2 1 1)) = true)
    (h1118 : (!(rowBit rows 2 2 2)) = true)
    (h1119 : (!(rowBit rows 2 3 3)) = true)
    (h1120 : (!(rowBit rows 2 4 4)) = true)
    (h1121 : (!(rowBit rows 2 5 5)) = true)
    (h1122 : (!(rowBit rows 2 6 6)) = true)
    (h1123 : (!(rowBit rows 2 7 7)) = true)
    (h1124 : (!(rowBit rows 2 8 8)) = true)
    (h1125 : ((((bif rowBit rows 2 8 0 then 1#4 else 0#4) + (bif rowBit rows 2 8 1 then 1#4 else 0#4) + (bif rowBit rows 2 8 2 then 1#4 else 0#4) + (bif rowBit rows 2 8 3 then 1#4 else 0#4) + (bif rowBit rows 2 8 4 then 1#4 else 0#4) + (bif rowBit rows 2 8 5 then 1#4 else 0#4) + (bif rowBit rows 2 8 6 then 1#4 else 0#4) + (bif rowBit rows 2 8 7 then 1#4 else 0#4) + (bif rowBit rows 2 8 8 then 1#4 else 0#4) + (bif rowBit rows 2 8 9 then 1#4 else 0#4) + (bif rowBit rows 2 8 10 then 1#4 else 0#4) + (bif rowBit rows 2 8 11 then 1#4 else 0#4) + (bif rowBit rows 2 8 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h1126 : (!(rowBit rows 2 9 9)) = true)
    (h1127 : ((((bif rowBit rows 2 9 0 then 1#4 else 0#4) + (bif rowBit rows 2 9 1 then 1#4 else 0#4) + (bif rowBit rows 2 9 2 then 1#4 else 0#4) + (bif rowBit rows 2 9 3 then 1#4 else 0#4) + (bif rowBit rows 2 9 4 then 1#4 else 0#4) + (bif rowBit rows 2 9 5 then 1#4 else 0#4) + (bif rowBit rows 2 9 6 then 1#4 else 0#4) + (bif rowBit rows 2 9 7 then 1#4 else 0#4) + (bif rowBit rows 2 9 8 then 1#4 else 0#4) + (bif rowBit rows 2 9 9 then 1#4 else 0#4) + (bif rowBit rows 2 9 10 then 1#4 else 0#4) + (bif rowBit rows 2 9 11 then 1#4 else 0#4) + (bif rowBit rows 2 9 12 then 1#4 else 0#4)) == 4#4)) = true)
    (h1128 : (!(rowBit rows 2 10 10)) = true)
    (h1129 : (!(rowBit rows 2 11 11)) = true)
    (h1130 : (!(rowBit rows 2 12 12)) = true)
    (h1131 : ((((bif (rowBit rows 2 0 10 && rowBit rows 2 0 11) then 1#4 else 0#4) + (bif (rowBit rows 2 1 10 && rowBit rows 2 1 11) then 1#4 else 0#4) + (bif (rowBit rows 2 2 10 && rowBit rows 2 2 11) then 1#4 else 0#4) + (bif (rowBit rows 2 3 10 && rowBit rows 2 3 11) then 1#4 else 0#4) + (bif (rowBit rows 2 4 10 && rowBit rows 2 4 11) then 1#4 else 0#4) + (bif (rowBit rows 2 5 10 && rowBit rows 2 5 11) then 1#4 else 0#4) + (bif (rowBit rows 2 6 10 && rowBit rows 2 6 11) then 1#4 else 0#4) + (bif (rowBit rows 2 7 10 && rowBit rows 2 7 11) then 1#4 else 0#4) + (bif (rowBit rows 2 8 10 && rowBit rows 2 8 11) then 1#4 else 0#4) + (bif (rowBit rows 2 9 10 && rowBit rows 2 9 11) then 1#4 else 0#4) + (bif (rowBit rows 2 10 10 && rowBit rows 2 10 11) then 1#4 else 0#4) + (bif (rowBit rows 2 11 10 && rowBit rows 2 11 11) then 1#4 else 0#4) + (bif (rowBit rows 2 12 10 && rowBit rows 2 12 11) then 1#4 else 0#4))).ule 2#4) = true)
    (h1132 : (!((rowBit rows 2 1 4 && rowBit rows 2 1 5 && rowBit rows 2 2 4 && rowBit rows 2 2 5))) = true)
    (h1133 : (!((rowBit rows 2 6 1 && rowBit rows 2 6 4 && rowBit rows 2 8 1 && rowBit rows 2 8 4))) = true)
    (h1134 : (!((rowBit rows 2 7 1 && rowBit rows 2 7 4 && rowBit rows 2 8 1 && rowBit rows 2 8 4))) = true)
    (h1135 : (!((rowBit rows 2 8 0 && rowBit rows 2 8 1 && rowBit rows 2 9 0 && rowBit rows 2 9 1))) = true)
    (h1136 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 4 && rowBit rows 2 9 1 && rowBit rows 2 9 4))) = true)
    (h1137 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 10 && rowBit rows 2 9 1 && rowBit rows 2 9 10))) = true)
    (h1138 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 11 && rowBit rows 2 9 1 && rowBit rows 2 9 11))) = true)
    (h1139 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 12 && rowBit rows 2 9 1 && rowBit rows 2 9 12))) = true)
    (h1140 : (!((rowBit rows 2 8 5 && rowBit rows 2 8 11 && rowBit rows 2 9 5 && rowBit rows 2 9 11))) = true)
    (h1141 : (!((rowBit rows 2 8 5 && rowBit rows 2 8 12 && rowBit rows 2 9 5 && rowBit rows 2 9 12))) = true)
    (h1142 : (!((rowBit rows 2 8 6 && rowBit rows 2 8 11 && rowBit rows 2 9 6 && rowBit rows 2 9 11))) = true)
    (h1143 : (!((rowBit rows 2 8 6 && rowBit rows 2 8 12 && rowBit rows 2 9 6 && rowBit rows 2 9 12))) = true)
    (h1144 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 8 && rowBit rows 2 11 0 && rowBit rows 2 11 8))) = true)
    (h1145 : (!((rowBit rows 2 9 10 && rowBit rows 2 9 11 && rowBit rows 2 12 10 && rowBit rows 2 12 11))) = true)
    (h1146 : (!((rowBit rows 2 10 2 && rowBit rows 2 10 9 && rowBit rows 2 11 2 && rowBit rows 2 11 9))) = true)
    (h1147 : (!((rowBit rows 2 10 2 && rowBit rows 2 10 9 && rowBit rows 2 12 2 && rowBit rows 2 12 9))) = true)
    (h1148 : (!((rowBit rows 2 11 2 && rowBit rows 2 11 9 && rowBit rows 2 12 2 && rowBit rows 2 12 9))) = true)
    (h1149 : ((((bif rowBit rows 2 9 0 then 1#4 else 0#4) + (bif rowBit rows 2 9 8 then 1#4 else 0#4) + (bif rowBit rows 2 9 9 then 1#4 else 0#4) + (bif rowBit rows 2 9 10 then 1#4 else 0#4) + (bif rowBit rows 2 9 11 then 1#4 else 0#4) + (bif rowBit rows 2 9 12 then 1#4 else 0#4))).ule 2#4) = true)
    (h1150 : ((((bif rowBit rows 2 0 0 then 1#4 else 0#4) + (bif rowBit rows 2 0 8 then 1#4 else 0#4) + (bif rowBit rows 2 0 9 then 1#4 else 0#4) + (bif rowBit rows 2 0 10 then 1#4 else 0#4) + (bif rowBit rows 2 0 11 then 1#4 else 0#4) + (bif rowBit rows 2 0 12 then 1#4 else 0#4))).ule 1#4) = true)
    (h1151 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 5 && rowBit rows 2 9 1 && rowBit rows 2 9 5))) = true) :
    ∀ item ∈ sourceChunk017Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk017Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1088
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1089
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1090
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1091
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1092
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1093
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1094
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1095
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1096
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1097
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1098
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1099 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1100
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1101
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1102
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1103
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1104 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1105
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1106
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1107
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1108
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1109
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1110
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1111
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1112
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1113
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1114 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1115 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1116
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1117
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1118
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1119
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1120
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1121
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1122
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1123
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1124
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1125 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1126
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1127 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1128
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1129
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1130
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1131 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1132
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1133
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1134
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1135
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1136
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1137
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1138
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1139
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1140
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1141
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1142
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1143
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1144
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1145
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1146
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1147
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1148
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1149 ⊢
    bv_decide
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1150 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1151

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
