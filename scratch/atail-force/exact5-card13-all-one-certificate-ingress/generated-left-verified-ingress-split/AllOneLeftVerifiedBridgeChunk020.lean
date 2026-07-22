/-
Generated packed-source bridge for verified left chunk 020.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk020_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1280 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 7 && rowBit rows 2 9 3 && rowBit rows 2 9 7))) = true)
    (h1281 : (!((rowBit rows 0 1 3 && rowBit rows 0 1 8 && rowBit rows 2 9 3 && rowBit rows 2 9 8))) = true)
    (h1282 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 5 && rowBit rows 2 9 4 && rowBit rows 2 9 5))) = true)
    (h1283 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 6 && rowBit rows 2 9 4 && rowBit rows 2 9 6))) = true)
    (h1284 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 7 && rowBit rows 2 9 4 && rowBit rows 2 9 7))) = true)
    (h1285 : (!((rowBit rows 0 1 4 && rowBit rows 0 1 8 && rowBit rows 2 9 4 && rowBit rows 2 9 8))) = true)
    (h1286 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 6 && rowBit rows 2 9 5 && rowBit rows 2 9 6))) = true)
    (h1287 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 7 && rowBit rows 2 9 5 && rowBit rows 2 9 7))) = true)
    (h1288 : (!((rowBit rows 0 1 5 && rowBit rows 0 1 8 && rowBit rows 2 9 5 && rowBit rows 2 9 8))) = true)
    (h1289 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 7 && rowBit rows 2 9 6 && rowBit rows 2 9 7))) = true)
    (h1290 : (!((rowBit rows 0 1 6 && rowBit rows 0 1 8 && rowBit rows 2 9 6 && rowBit rows 2 9 8))) = true)
    (h1291 : (!((rowBit rows 0 1 7 && rowBit rows 0 1 8 && rowBit rows 2 9 7 && rowBit rows 2 9 8))) = true)
    (h1292 : (!((rowBit rows 0 1 10 && rowBit rows 0 1 11 && rowBit rows 2 9 10 && rowBit rows 2 9 11))) = true)
    (h1293 : (!((rowBit rows 0 1 10 && rowBit rows 0 1 12 && rowBit rows 2 9 10 && rowBit rows 2 9 12))) = true)
    (h1294 : (!((rowBit rows 0 1 11 && rowBit rows 0 1 12 && rowBit rows 2 9 11 && rowBit rows 2 9 12))) = true)
    (h1295 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 2 3 0 && rowBit rows 2 3 1))) = true)
    (h1296 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 2 5 0 && rowBit rows 2 5 1))) = true)
    (h1297 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 2 6 0 && rowBit rows 2 6 1))) = true)
    (h1298 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 2 7 0 && rowBit rows 2 7 1))) = true)
    (h1299 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 2 8 0 && rowBit rows 2 8 1))) = true)
    (h1300 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 9 && rowBit rows 2 8 1 && rowBit rows 2 8 9))) = true)
    (h1301 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 2 8 1 && rowBit rows 2 8 10))) = true)
    (h1302 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 2 8 1 && rowBit rows 2 8 11))) = true)
    (h1303 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 2 8 1 && rowBit rows 2 8 12))) = true)
    (h1304 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 2 9 0 && rowBit rows 2 9 1))) = true)
    (h1305 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 10 && rowBit rows 2 9 0 && rowBit rows 2 9 10))) = true)
    (h1306 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 11 && rowBit rows 2 9 0 && rowBit rows 2 9 11))) = true)
    (h1307 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 12 && rowBit rows 2 9 0 && rowBit rows 2 9 12))) = true)
    (h1308 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 10 && rowBit rows 2 9 1 && rowBit rows 2 9 10))) = true)
    (h1309 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 11 && rowBit rows 2 9 1 && rowBit rows 2 9 11))) = true)
    (h1310 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 2 9 1 && rowBit rows 2 9 12))) = true)
    (h1311 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 4 && rowBit rows 2 9 3 && rowBit rows 2 9 4))) = true)
    (h1312 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 5 && rowBit rows 2 9 3 && rowBit rows 2 9 5))) = true)
    (h1313 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 6 && rowBit rows 2 9 3 && rowBit rows 2 9 6))) = true)
    (h1314 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 7 && rowBit rows 2 9 3 && rowBit rows 2 9 7))) = true)
    (h1315 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 8 && rowBit rows 2 9 3 && rowBit rows 2 9 8))) = true)
    (h1316 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 5 && rowBit rows 2 9 4 && rowBit rows 2 9 5))) = true)
    (h1317 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 6 && rowBit rows 2 9 4 && rowBit rows 2 9 6))) = true)
    (h1318 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 7 && rowBit rows 2 9 4 && rowBit rows 2 9 7))) = true)
    (h1319 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 8 && rowBit rows 2 9 4 && rowBit rows 2 9 8))) = true)
    (h1320 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 6 && rowBit rows 2 9 5 && rowBit rows 2 9 6))) = true)
    (h1321 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 7 && rowBit rows 2 9 5 && rowBit rows 2 9 7))) = true)
    (h1322 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 8 && rowBit rows 2 9 5 && rowBit rows 2 9 8))) = true)
    (h1323 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 8 && rowBit rows 2 9 6 && rowBit rows 2 9 8))) = true)
    (h1324 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 2 9 7 && rowBit rows 2 9 8))) = true)
    (h1325 : (!((rowBit rows 0 2 10 && rowBit rows 0 2 11 && rowBit rows 2 9 10 && rowBit rows 2 9 11))) = true)
    (h1326 : (!((rowBit rows 0 2 11 && rowBit rows 0 2 12 && rowBit rows 2 9 11 && rowBit rows 2 9 12))) = true)
    (h1327 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 2 10 0 && rowBit rows 2 10 1))) = true)
    (h1328 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 2 11 0 && rowBit rows 2 11 1))) = true)
    (h1329 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 2 12 0 && rowBit rows 2 12 1))) = true)
    (h1330 : (!((rowBit rows 0 3 1 && rowBit rows 0 3 9 && rowBit rows 2 8 1 && rowBit rows 2 8 9))) = true)
    (h1331 : (!((rowBit rows 0 3 1 && rowBit rows 0 3 10 && rowBit rows 2 8 1 && rowBit rows 2 8 10))) = true)
    (h1332 : (!((rowBit rows 0 3 1 && rowBit rows 0 3 11 && rowBit rows 2 8 1 && rowBit rows 2 8 11))) = true)
    (h1333 : (!((rowBit rows 0 3 1 && rowBit rows 0 3 12 && rowBit rows 2 8 1 && rowBit rows 2 8 12))) = true)
    (h1334 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 10 && rowBit rows 2 9 0 && rowBit rows 2 9 10))) = true)
    (h1335 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 11 && rowBit rows 2 9 0 && rowBit rows 2 9 11))) = true)
    (h1336 : (!((rowBit rows 0 3 1 && rowBit rows 0 3 10 && rowBit rows 2 9 1 && rowBit rows 2 9 10))) = true)
    (h1337 : (!((rowBit rows 0 3 2 && rowBit rows 0 3 10 && rowBit rows 2 9 2 && rowBit rows 2 9 10))) = true)
    (h1338 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 6 && rowBit rows 2 9 4 && rowBit rows 2 9 6))) = true)
    (h1339 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 7 && rowBit rows 2 9 4 && rowBit rows 2 9 7))) = true)
    (h1340 : (!((rowBit rows 0 3 4 && rowBit rows 0 3 8 && rowBit rows 2 9 4 && rowBit rows 2 9 8))) = true)
    (h1341 : (!((rowBit rows 0 3 5 && rowBit rows 0 3 6 && rowBit rows 2 9 5 && rowBit rows 2 9 6))) = true)
    (h1342 : (!((rowBit rows 0 3 5 && rowBit rows 0 3 8 && rowBit rows 2 9 5 && rowBit rows 2 9 8))) = true)
    (h1343 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 7 && rowBit rows 2 9 6 && rowBit rows 2 9 7))) = true) :
    ∀ item ∈ sourceChunk020Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk020Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1280
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1281
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1282
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1283
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1284
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1285
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1286
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1287
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1288
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1289
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1290
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1291
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1292
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1293
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1294
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1295
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1296
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1297
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1298
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1299
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1300
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1301
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1302
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1303
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1304
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1305
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1306
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1307
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1308
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1309
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1310
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1311
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1312
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1313
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1314
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1315
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1316
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1317
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1318
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1319
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1320
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1321
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1322
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1323
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1324
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1325
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1326
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1327
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1328
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1329
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1330
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1331
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1332
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1333
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1334
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1335
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1336
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1337
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1338
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1339
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1340
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1341
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1342
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1343

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
