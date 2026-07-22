/-
Generated packed-source bridge for verified left chunk 019.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk019_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1216 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 4 && rowBit rows 0 12 3 && rowBit rows 0 12 4))) = true)
    (h1217 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 5 && rowBit rows 0 12 3 && rowBit rows 0 12 5))) = true)
    (h1218 : (!((rowBit rows 0 9 0 && rowBit rows 0 9 8 && rowBit rows 1 11 0 && rowBit rows 1 11 8))) = true)
    (h1219 : (!((rowBit rows 1 9 0 && rowBit rows 1 9 8 && rowBit rows 0 11 0 && rowBit rows 0 11 8))) = true)
    (h1220 : (!((rowBit rows 0 10 2 && rowBit rows 0 10 9 && rowBit rows 1 11 2 && rowBit rows 1 11 9))) = true)
    (h1221 : (!((rowBit rows 1 10 2 && rowBit rows 1 10 9 && rowBit rows 0 11 2 && rowBit rows 0 11 9))) = true)
    (h1222 : (!((rowBit rows 0 10 2 && rowBit rows 0 10 9 && rowBit rows 1 12 2 && rowBit rows 1 12 9))) = true)
    (h1223 : (!((rowBit rows 1 10 2 && rowBit rows 1 10 9 && rowBit rows 0 12 2 && rowBit rows 0 12 9))) = true)
    (h1224 : (!((rowBit rows 0 11 2 && rowBit rows 0 11 9 && rowBit rows 1 12 2 && rowBit rows 1 12 9))) = true)
    (h1225 : (!((rowBit rows 1 11 2 && rowBit rows 1 11 9 && rowBit rows 0 12 2 && rowBit rows 0 12 9))) = true)
    (h1226 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 9 && rowBit rows 1 8 3 && rowBit rows 1 8 9))) = true)
    (h1227 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 10 && rowBit rows 1 8 3 && rowBit rows 1 8 10))) = true)
    (h1228 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 11 && rowBit rows 1 8 3 && rowBit rows 1 8 11))) = true)
    (h1229 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 12 && rowBit rows 1 8 3 && rowBit rows 1 8 12))) = true)
    (h1230 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 3 && rowBit rows 1 8 0 && rowBit rows 1 8 3))) = true)
    (h1231 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 9 && rowBit rows 1 8 3 && rowBit rows 1 8 9))) = true)
    (h1232 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 10 && rowBit rows 1 8 3 && rowBit rows 1 8 10))) = true)
    (h1233 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 11 && rowBit rows 1 8 3 && rowBit rows 1 8 11))) = true)
    (h1234 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 12 && rowBit rows 1 8 3 && rowBit rows 1 8 12))) = true)
    (h1235 : (!((rowBit rows 0 6 3 && rowBit rows 0 6 11 && rowBit rows 1 8 3 && rowBit rows 1 8 11))) = true)
    (h1236 : (!((rowBit rows 0 6 3 && rowBit rows 0 6 12 && rowBit rows 1 8 3 && rowBit rows 1 8 12))) = true)
    (h1237 : (!((rowBit rows 0 7 0 && rowBit rows 0 7 3 && rowBit rows 1 8 0 && rowBit rows 1 8 3))) = true)
    (h1238 : (!((rowBit rows 0 7 1 && rowBit rows 0 7 3 && rowBit rows 1 8 1 && rowBit rows 1 8 3))) = true)
    (h1239 : (!((rowBit rows 0 7 3 && rowBit rows 0 7 9 && rowBit rows 1 8 3 && rowBit rows 1 8 9))) = true)
    (h1240 : (!((rowBit rows 0 7 3 && rowBit rows 0 7 10 && rowBit rows 1 8 3 && rowBit rows 1 8 10))) = true)
    (h1241 : (!((rowBit rows 0 7 3 && rowBit rows 0 7 11 && rowBit rows 1 8 3 && rowBit rows 1 8 11))) = true)
    (h1242 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 1 8 3 && rowBit rows 1 8 5))) = true)
    (h1243 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 6 && rowBit rows 1 8 3 && rowBit rows 1 8 6))) = true)
    (h1244 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 7 && rowBit rows 1 8 3 && rowBit rows 1 8 7))) = true)
    (h1245 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 4 && rowBit rows 0 10 3 && rowBit rows 0 10 4))) = true)
    (h1246 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 5 && rowBit rows 0 10 3 && rowBit rows 0 10 5))) = true)
    (h1247 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 6 && rowBit rows 0 10 3 && rowBit rows 0 10 6))) = true)
    (h1248 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 7 && rowBit rows 0 10 3 && rowBit rows 0 10 7))) = true)
    (h1249 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 4 && rowBit rows 0 11 3 && rowBit rows 0 11 4))) = true)
    (h1250 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 6 && rowBit rows 0 11 3 && rowBit rows 0 11 6))) = true)
    (h1251 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 7 && rowBit rows 0 11 3 && rowBit rows 0 11 7))) = true)
    (h1252 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 6 && rowBit rows 2 8 1 && rowBit rows 2 8 6))) = true)
    (h1253 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 7 && rowBit rows 2 8 1 && rowBit rows 2 8 7))) = true)
    (h1254 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 5 && rowBit rows 2 9 1 && rowBit rows 2 9 5))) = true)
    (h1255 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 7 && rowBit rows 2 9 1 && rowBit rows 2 9 7))) = true)
    (h1256 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 8 && rowBit rows 2 9 1 && rowBit rows 2 9 8))) = true)
    (h1257 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 8 && rowBit rows 2 9 2 && rowBit rows 2 9 8))) = true)
    (h1258 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 7 && rowBit rows 2 9 3 && rowBit rows 2 9 7))) = true)
    (h1259 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 8 && rowBit rows 2 9 3 && rowBit rows 2 9 8))) = true)
    (h1260 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 5 && rowBit rows 2 9 4 && rowBit rows 2 9 5))) = true)
    (h1261 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 8 && rowBit rows 2 9 4 && rowBit rows 2 9 8))) = true)
    (h1262 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 8 && rowBit rows 2 9 5 && rowBit rows 2 9 8))) = true)
    (h1263 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 7 && rowBit rows 2 9 6 && rowBit rows 2 9 7))) = true)
    (h1264 : (!((rowBit rows 0 0 6 && rowBit rows 0 0 8 && rowBit rows 2 9 6 && rowBit rows 2 9 8))) = true)
    (h1265 : (!((rowBit rows 0 0 7 && rowBit rows 0 0 8 && rowBit rows 2 9 7 && rowBit rows 2 9 8))) = true)
    (h1266 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 5 && rowBit rows 2 2 4 && rowBit rows 2 2 5))) = true)
    (h1267 : (!((rowBit rows 2 1 4 && rowBit rows 2 1 5 && rowBit rows 0 2 4 && rowBit rows 0 2 5))) = true)
    (h1268 : ((((bif (rowBit rows 0 1 0 && rowBit rows 2 9 0) then 1#4 else 0#4) + (bif (rowBit rows 0 1 1 && rowBit rows 2 9 1) then 1#4 else 0#4) + (bif (rowBit rows 0 1 2 && rowBit rows 2 9 2) then 1#4 else 0#4) + (bif (rowBit rows 0 1 3 && rowBit rows 2 9 3) then 1#4 else 0#4) + (bif (rowBit rows 0 1 4 && rowBit rows 2 9 4) then 1#4 else 0#4) + (bif (rowBit rows 0 1 5 && rowBit rows 2 9 5) then 1#4 else 0#4) + (bif (rowBit rows 0 1 6 && rowBit rows 2 9 6) then 1#4 else 0#4) + (bif (rowBit rows 0 1 7 && rowBit rows 2 9 7) then 1#4 else 0#4) + (bif (rowBit rows 0 1 8 && rowBit rows 2 9 8) then 1#4 else 0#4) + (bif (rowBit rows 0 1 9 && rowBit rows 2 9 9) then 1#4 else 0#4) + (bif (rowBit rows 0 1 10 && rowBit rows 2 9 10) then 1#4 else 0#4) + (bif (rowBit rows 0 1 11 && rowBit rows 2 9 11) then 1#4 else 0#4) + (bif (rowBit rows 0 1 12 && rowBit rows 2 9 12) then 1#4 else 0#4))).ule 2#4) = true)
    (h1269 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 10 && rowBit rows 2 9 0 && rowBit rows 2 9 10))) = true)
    (h1270 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 11 && rowBit rows 2 9 0 && rowBit rows 2 9 11))) = true)
    (h1271 : (!((rowBit rows 0 1 0 && rowBit rows 0 1 12 && rowBit rows 2 9 0 && rowBit rows 2 9 12))) = true)
    (h1272 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 4 && rowBit rows 2 9 2 && rowBit rows 2 9 4))) = true)
    (h1273 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 5 && rowBit rows 2 9 2 && rowBit rows 2 9 5))) = true)
    (h1274 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 6 && rowBit rows 2 9 2 && rowBit rows 2 9 6))) = true)
    (h1275 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 7 && rowBit rows 2 9 2 && rowBit rows 2 9 7))) = true)
    (h1276 : (!((rowBit rows 0 1 2 && rowBit rows 0 1 8 && rowBit rows 2 9 2 && rowBit rows 2 9 8))) = true)
    (h1277 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 4 && rowBit rows 2 9 3 && rowBit rows 2 9 4))) = true)
    (h1278 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 5 && rowBit rows 2 9 3 && rowBit rows 2 9 5))) = true)
    (h1279 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 6 && rowBit rows 2 9 3 && rowBit rows 2 9 6))) = true) :
    ∀ item ∈ sourceChunk019Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk019Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1216
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1217
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1218
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1219
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1220
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1221
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1222
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1223
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1224
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1225
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1226
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1227
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1228
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1229
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1230
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1231
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1232
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1233
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1234
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1235
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1236
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1237
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1238
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1239
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1240
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1241
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1242
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1243
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1244
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1245
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1246
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1247
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1248
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1249
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1250
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1251
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1252
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1253
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1254
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1255
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1256
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1257
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1258
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1259
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1260
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1261
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1262
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1263
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1264
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1265
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1266
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1267
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1268 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1269
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1270
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1271
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1272
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1273
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1274
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1275
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1276
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1277
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1278
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1279

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
