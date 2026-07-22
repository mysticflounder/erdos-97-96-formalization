/-
Generated packed-source bridge for verified left chunk 018.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk018_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1152 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 6 && rowBit rows 2 9 1 && rowBit rows 2 9 6))) = true)
    (h1153 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 7 && rowBit rows 2 9 1 && rowBit rows 2 9 7))) = true)
    (h1154 : ((((bif rowBit rows 2 4 0 then 1#4 else 0#4) + (bif rowBit rows 2 4 1 then 1#4 else 0#4) + (bif rowBit rows 2 4 2 then 1#4 else 0#4) + (bif rowBit rows 2 4 3 then 1#4 else 0#4) + (bif rowBit rows 2 4 4 then 1#4 else 0#4))).ule 1#4) = true)
    (h1155 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 1 1 4 && rowBit rows 1 1 5))) = true)
    (h1156 : (!((rowBit rows 1 0 4 && rowBit rows 1 0 5 && rowBit rows 0 1 4 && rowBit rows 0 1 5))) = true)
    (h1157 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 5 && rowBit rows 1 2 4 && rowBit rows 1 2 5))) = true)
    (h1158 : (!((rowBit rows 1 1 4 && rowBit rows 1 1 5 && rowBit rows 0 2 4 && rowBit rows 0 2 5))) = true)
    (h1159 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 4 && rowBit rows 1 8 3 && rowBit rows 1 8 4))) = true)
    (h1160 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 5 && rowBit rows 1 8 3 && rowBit rows 1 8 5))) = true)
    (h1161 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 6 && rowBit rows 1 8 3 && rowBit rows 1 8 6))) = true)
    (h1162 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 7 && rowBit rows 1 8 3 && rowBit rows 1 8 7))) = true)
    (h1163 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 1 3 0 && rowBit rows 1 3 1))) = true)
    (h1164 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 1 5 0 && rowBit rows 1 5 1))) = true)
    (h1165 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 1 6 0 && rowBit rows 1 6 1))) = true)
    (h1166 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 1 7 0 && rowBit rows 1 7 1))) = true)
    (h1167 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 1 8 0 && rowBit rows 1 8 1))) = true)
    (h1168 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 4 && rowBit rows 1 8 3 && rowBit rows 1 8 4))) = true)
    (h1169 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 5 && rowBit rows 1 8 3 && rowBit rows 1 8 5))) = true)
    (h1170 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 6 && rowBit rows 1 8 3 && rowBit rows 1 8 6))) = true)
    (h1171 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 7 && rowBit rows 1 8 3 && rowBit rows 1 8 7))) = true)
    (h1172 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 1 9 0 && rowBit rows 1 9 1))) = true)
    (h1173 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 1 10 0 && rowBit rows 1 10 1))) = true)
    (h1174 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 1 11 0 && rowBit rows 1 11 1))) = true)
    (h1175 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 1 12 0 && rowBit rows 1 12 1))) = true)
    (h1176 : (!((rowBit rows 1 5 3 && rowBit rows 1 5 4 && rowBit rows 0 6 3 && rowBit rows 0 6 4))) = true)
    (h1177 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 4 && rowBit rows 1 8 0 && rowBit rows 1 8 4))) = true)
    (h1178 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 4 && rowBit rows 1 8 3 && rowBit rows 1 8 4))) = true)
    (h1179 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 9 && rowBit rows 1 8 4 && rowBit rows 1 8 9))) = true)
    (h1180 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 10 && rowBit rows 1 8 4 && rowBit rows 1 8 10))) = true)
    (h1181 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 12 && rowBit rows 1 8 4 && rowBit rows 1 8 12))) = true)
    (h1182 : ((((bif (rowBit rows 0 6 0 && rowBit rows 1 8 0) then 1#4 else 0#4) + (bif (rowBit rows 0 6 1 && rowBit rows 1 8 1) then 1#4 else 0#4) + (bif (rowBit rows 0 6 2 && rowBit rows 1 8 2) then 1#4 else 0#4) + (bif (rowBit rows 0 6 3 && rowBit rows 1 8 3) then 1#4 else 0#4) + (bif (rowBit rows 0 6 4 && rowBit rows 1 8 4) then 1#4 else 0#4) + (bif (rowBit rows 0 6 5 && rowBit rows 1 8 5) then 1#4 else 0#4) + (bif (rowBit rows 0 6 6 && rowBit rows 1 8 6) then 1#4 else 0#4) + (bif (rowBit rows 0 6 7 && rowBit rows 1 8 7) then 1#4 else 0#4) + (bif (rowBit rows 0 6 8 && rowBit rows 1 8 8) then 1#4 else 0#4) + (bif (rowBit rows 0 6 9 && rowBit rows 1 8 9) then 1#4 else 0#4) + (bif (rowBit rows 0 6 10 && rowBit rows 1 8 10) then 1#4 else 0#4) + (bif (rowBit rows 0 6 11 && rowBit rows 1 8 11) then 1#4 else 0#4) + (bif (rowBit rows 0 6 12 && rowBit rows 1 8 12) then 1#4 else 0#4))).ule 2#4) = true)
    (h1183 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 3 && rowBit rows 1 8 0 && rowBit rows 1 8 3))) = true)
    (h1184 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 4 && rowBit rows 1 8 0 && rowBit rows 1 8 4))) = true)
    (h1185 : (!((rowBit rows 0 6 3 && rowBit rows 0 6 4 && rowBit rows 1 8 3 && rowBit rows 1 8 4))) = true)
    (h1186 : (!((rowBit rows 0 6 3 && rowBit rows 0 6 5 && rowBit rows 1 8 3 && rowBit rows 1 8 5))) = true)
    (h1187 : (!((rowBit rows 0 6 3 && rowBit rows 0 6 9 && rowBit rows 1 8 3 && rowBit rows 1 8 9))) = true)
    (h1188 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 9 && rowBit rows 1 8 4 && rowBit rows 1 8 9))) = true)
    (h1189 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 10 && rowBit rows 1 8 4 && rowBit rows 1 8 10))) = true)
    (h1190 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 11 && rowBit rows 1 8 4 && rowBit rows 1 8 11))) = true)
    (h1191 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 12 && rowBit rows 1 8 4 && rowBit rows 1 8 12))) = true)
    (h1192 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 9 && rowBit rows 1 8 5 && rowBit rows 1 8 9))) = true)
    (h1193 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 11 && rowBit rows 1 8 5 && rowBit rows 1 8 11))) = true)
    (h1194 : (!((rowBit rows 0 7 3 && rowBit rows 0 7 4 && rowBit rows 1 8 3 && rowBit rows 1 8 4))) = true)
    (h1195 : (!((rowBit rows 0 7 3 && rowBit rows 0 7 5 && rowBit rows 1 8 3 && rowBit rows 1 8 5))) = true)
    (h1196 : (!((rowBit rows 0 7 3 && rowBit rows 0 7 6 && rowBit rows 1 8 3 && rowBit rows 1 8 6))) = true)
    (h1197 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 3 && rowBit rows 0 10 0 && rowBit rows 0 10 3))) = true)
    (h1198 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 4 && rowBit rows 0 10 0 && rowBit rows 0 10 4))) = true)
    (h1199 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 6 && rowBit rows 0 10 0 && rowBit rows 0 10 6))) = true)
    (h1200 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 7 && rowBit rows 0 10 0 && rowBit rows 0 10 7))) = true)
    (h1201 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 11 && rowBit rows 0 10 3 && rowBit rows 0 10 11))) = true)
    (h1202 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 12 && rowBit rows 0 10 3 && rowBit rows 0 10 12))) = true)
    (h1203 : (!((rowBit rows 1 8 4 && rowBit rows 1 8 12 && rowBit rows 0 10 4 && rowBit rows 0 10 12))) = true)
    (h1204 : (!((rowBit rows 1 8 5 && rowBit rows 1 8 11 && rowBit rows 0 10 5 && rowBit rows 0 10 11))) = true)
    (h1205 : (!((rowBit rows 1 8 5 && rowBit rows 1 8 12 && rowBit rows 0 10 5 && rowBit rows 0 10 12))) = true)
    (h1206 : (!((rowBit rows 1 8 7 && rowBit rows 1 8 11 && rowBit rows 0 10 7 && rowBit rows 0 10 11))) = true)
    (h1207 : (!((rowBit rows 1 8 7 && rowBit rows 1 8 12 && rowBit rows 0 10 7 && rowBit rows 0 10 12))) = true)
    (h1208 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 3 && rowBit rows 0 11 0 && rowBit rows 0 11 3))) = true)
    (h1209 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 4 && rowBit rows 0 11 0 && rowBit rows 0 11 4))) = true)
    (h1210 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 7 && rowBit rows 0 11 0 && rowBit rows 0 11 7))) = true)
    (h1211 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 5 && rowBit rows 0 11 3 && rowBit rows 0 11 5))) = true)
    (h1212 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 12 && rowBit rows 0 11 3 && rowBit rows 0 11 12))) = true)
    (h1213 : (!((rowBit rows 1 8 4 && rowBit rows 1 8 12 && rowBit rows 0 11 4 && rowBit rows 0 11 12))) = true)
    (h1214 : (!((rowBit rows 1 8 7 && rowBit rows 1 8 12 && rowBit rows 0 11 7 && rowBit rows 0 11 12))) = true)
    (h1215 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 3 && rowBit rows 0 12 0 && rowBit rows 0 12 3))) = true) :
    ∀ item ∈ sourceChunk018Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk018Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1152
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1153
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1154 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1155
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1156
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1157
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1158
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1159
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1160
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1161
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1162
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1163
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1164
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1165
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1166
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1167
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1168
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1169
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1170
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1171
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1172
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1173
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1174
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1175
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1176
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1177
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1178
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1179
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1180
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1181
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1182 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1183
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1184
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1185
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1186
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1187
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1188
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1189
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1190
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1191
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1192
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1193
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1194
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1195
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1196
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1197
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1198
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1199
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1200
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1201
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1202
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1203
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1204
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1205
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1206
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1207
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1208
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1209
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1210
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1211
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1212
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1213
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1214
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1215

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
