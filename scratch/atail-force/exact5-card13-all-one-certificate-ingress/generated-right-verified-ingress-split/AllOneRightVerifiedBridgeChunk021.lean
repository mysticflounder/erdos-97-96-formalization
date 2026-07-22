/-
Generated packed-source bridge for verified right chunk 021.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk021_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1344 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 8 && rowBit rows 2 9 6 && rowBit rows 2 9 8))) = true)
    (h1345 : (!((rowBit rows 0 3 10 && rowBit rows 0 3 11 && rowBit rows 2 9 10 && rowBit rows 2 9 11))) = true)
    (h1346 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 10 && rowBit rows 2 8 1 && rowBit rows 2 8 10))) = true)
    (h1347 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 10 && rowBit rows 2 9 0 && rowBit rows 2 9 10))) = true)
    (h1348 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 11 && rowBit rows 2 9 0 && rowBit rows 2 9 11))) = true)
    (h1349 : (!((rowBit rows 0 4 0 && rowBit rows 0 4 12 && rowBit rows 2 9 0 && rowBit rows 2 9 12))) = true)
    (h1350 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 10 && rowBit rows 2 9 1 && rowBit rows 2 9 10))) = true)
    (h1351 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 11 && rowBit rows 2 9 1 && rowBit rows 2 9 11))) = true)
    (h1352 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 12 && rowBit rows 2 9 1 && rowBit rows 2 9 12))) = true)
    (h1353 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 10 && rowBit rows 2 9 2 && rowBit rows 2 9 10))) = true)
    (h1354 : (!((rowBit rows 0 4 2 && rowBit rows 0 4 12 && rowBit rows 2 9 2 && rowBit rows 2 9 12))) = true)
    (h1355 : (!((rowBit rows 0 4 3 && rowBit rows 0 4 11 && rowBit rows 2 9 3 && rowBit rows 2 9 11))) = true)
    (h1356 : (!((rowBit rows 0 4 10 && rowBit rows 0 4 11 && rowBit rows 2 9 10 && rowBit rows 2 9 11))) = true)
    (h1357 : (!((rowBit rows 0 4 10 && rowBit rows 0 4 12 && rowBit rows 2 9 10 && rowBit rows 2 9 12))) = true)
    (h1358 : (!((rowBit rows 0 4 11 && rowBit rows 0 4 12 && rowBit rows 2 9 11 && rowBit rows 2 9 12))) = true)
    (h1359 : (!((rowBit rows 2 5 3 && rowBit rows 2 5 4 && rowBit rows 0 6 3 && rowBit rows 0 6 4))) = true)
    (h1360 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 4 && rowBit rows 2 8 1 && rowBit rows 2 8 4))) = true)
    (h1361 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 10 && rowBit rows 2 8 1 && rowBit rows 2 8 10))) = true)
    (h1362 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 11 && rowBit rows 2 8 1 && rowBit rows 2 8 11))) = true)
    (h1363 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 12 && rowBit rows 2 8 1 && rowBit rows 2 8 12))) = true)
    (h1364 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 11 && rowBit rows 2 8 4 && rowBit rows 2 8 11))) = true)
    (h1365 : ((((bif (rowBit rows 0 5 0 && rowBit rows 2 9 0) then 1#4 else 0#4) + (bif (rowBit rows 0 5 1 && rowBit rows 2 9 1) then 1#4 else 0#4) + (bif (rowBit rows 0 5 2 && rowBit rows 2 9 2) then 1#4 else 0#4) + (bif (rowBit rows 0 5 3 && rowBit rows 2 9 3) then 1#4 else 0#4) + (bif (rowBit rows 0 5 4 && rowBit rows 2 9 4) then 1#4 else 0#4) + (bif (rowBit rows 0 5 5 && rowBit rows 2 9 5) then 1#4 else 0#4) + (bif (rowBit rows 0 5 6 && rowBit rows 2 9 6) then 1#4 else 0#4) + (bif (rowBit rows 0 5 7 && rowBit rows 2 9 7) then 1#4 else 0#4) + (bif (rowBit rows 0 5 8 && rowBit rows 2 9 8) then 1#4 else 0#4) + (bif (rowBit rows 0 5 9 && rowBit rows 2 9 9) then 1#4 else 0#4) + (bif (rowBit rows 0 5 10 && rowBit rows 2 9 10) then 1#4 else 0#4) + (bif (rowBit rows 0 5 11 && rowBit rows 2 9 11) then 1#4 else 0#4) + (bif (rowBit rows 0 5 12 && rowBit rows 2 9 12) then 1#4 else 0#4))).ule 2#4) = true)
    (h1366 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 4 && rowBit rows 2 9 0 && rowBit rows 2 9 4))) = true)
    (h1367 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 10 && rowBit rows 2 9 0 && rowBit rows 2 9 10))) = true)
    (h1368 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 11 && rowBit rows 2 9 0 && rowBit rows 2 9 11))) = true)
    (h1369 : (!((rowBit rows 0 5 0 && rowBit rows 0 5 12 && rowBit rows 2 9 0 && rowBit rows 2 9 12))) = true)
    (h1370 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 4 && rowBit rows 2 9 1 && rowBit rows 2 9 4))) = true)
    (h1371 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 10 && rowBit rows 2 9 1 && rowBit rows 2 9 10))) = true)
    (h1372 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 12 && rowBit rows 2 9 1 && rowBit rows 2 9 12))) = true)
    (h1373 : (!((rowBit rows 0 5 2 && rowBit rows 0 5 10 && rowBit rows 2 9 2 && rowBit rows 2 9 10))) = true)
    (h1374 : (!((rowBit rows 0 5 2 && rowBit rows 0 5 11 && rowBit rows 2 9 2 && rowBit rows 2 9 11))) = true)
    (h1375 : (!((rowBit rows 0 5 2 && rowBit rows 0 5 12 && rowBit rows 2 9 2 && rowBit rows 2 9 12))) = true)
    (h1376 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 10 && rowBit rows 2 9 3 && rowBit rows 2 9 10))) = true)
    (h1377 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 11 && rowBit rows 2 9 3 && rowBit rows 2 9 11))) = true)
    (h1378 : (!((rowBit rows 0 5 3 && rowBit rows 0 5 12 && rowBit rows 2 9 3 && rowBit rows 2 9 12))) = true)
    (h1379 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 10 && rowBit rows 2 9 4 && rowBit rows 2 9 10))) = true)
    (h1380 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 11 && rowBit rows 2 9 4 && rowBit rows 2 9 11))) = true)
    (h1381 : (!((rowBit rows 0 5 4 && rowBit rows 0 5 12 && rowBit rows 2 9 4 && rowBit rows 2 9 12))) = true)
    (h1382 : (!((rowBit rows 0 5 6 && rowBit rows 0 5 7 && rowBit rows 2 9 6 && rowBit rows 2 9 7))) = true)
    (h1383 : (!((rowBit rows 0 5 6 && rowBit rows 0 5 8 && rowBit rows 2 9 6 && rowBit rows 2 9 8))) = true)
    (h1384 : (!((rowBit rows 0 5 7 && rowBit rows 0 5 8 && rowBit rows 2 9 7 && rowBit rows 2 9 8))) = true)
    (h1385 : (!((rowBit rows 0 5 10 && rowBit rows 0 5 11 && rowBit rows 2 9 10 && rowBit rows 2 9 11))) = true)
    (h1386 : (!((rowBit rows 0 5 10 && rowBit rows 0 5 12 && rowBit rows 2 9 10 && rowBit rows 2 9 12))) = true)
    (h1387 : (!((rowBit rows 0 5 11 && rowBit rows 0 5 12 && rowBit rows 2 9 11 && rowBit rows 2 9 12))) = true)
    (h1388 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 4 && rowBit rows 2 8 1 && rowBit rows 2 8 4))) = true)
    (h1389 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 5 && rowBit rows 2 8 1 && rowBit rows 2 8 5))) = true)
    (h1390 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 9 && rowBit rows 2 8 1 && rowBit rows 2 8 9))) = true)
    (h1391 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 12 && rowBit rows 2 8 1 && rowBit rows 2 8 12))) = true)
    (h1392 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 10 && rowBit rows 2 8 5 && rowBit rows 2 8 10))) = true)
    (h1393 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 12 && rowBit rows 2 8 5 && rowBit rows 2 8 12))) = true)
    (h1394 : ((((bif (rowBit rows 0 6 0 && rowBit rows 2 9 0) then 1#4 else 0#4) + (bif (rowBit rows 0 6 1 && rowBit rows 2 9 1) then 1#4 else 0#4) + (bif (rowBit rows 0 6 2 && rowBit rows 2 9 2) then 1#4 else 0#4) + (bif (rowBit rows 0 6 3 && rowBit rows 2 9 3) then 1#4 else 0#4) + (bif (rowBit rows 0 6 4 && rowBit rows 2 9 4) then 1#4 else 0#4) + (bif (rowBit rows 0 6 5 && rowBit rows 2 9 5) then 1#4 else 0#4) + (bif (rowBit rows 0 6 6 && rowBit rows 2 9 6) then 1#4 else 0#4) + (bif (rowBit rows 0 6 7 && rowBit rows 2 9 7) then 1#4 else 0#4) + (bif (rowBit rows 0 6 8 && rowBit rows 2 9 8) then 1#4 else 0#4) + (bif (rowBit rows 0 6 9 && rowBit rows 2 9 9) then 1#4 else 0#4) + (bif (rowBit rows 0 6 10 && rowBit rows 2 9 10) then 1#4 else 0#4) + (bif (rowBit rows 0 6 11 && rowBit rows 2 9 11) then 1#4 else 0#4) + (bif (rowBit rows 0 6 12 && rowBit rows 2 9 12) then 1#4 else 0#4))).ule 2#4) = true)
    (h1395 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 3 && rowBit rows 2 9 0 && rowBit rows 2 9 3))) = true)
    (h1396 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 4 && rowBit rows 2 9 0 && rowBit rows 2 9 4))) = true)
    (h1397 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 5 && rowBit rows 2 9 0 && rowBit rows 2 9 5))) = true)
    (h1398 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 10 && rowBit rows 2 9 0 && rowBit rows 2 9 10))) = true)
    (h1399 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 11 && rowBit rows 2 9 0 && rowBit rows 2 9 11))) = true)
    (h1400 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 12 && rowBit rows 2 9 0 && rowBit rows 2 9 12))) = true)
    (h1401 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 10 && rowBit rows 2 9 1 && rowBit rows 2 9 10))) = true)
    (h1402 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 11 && rowBit rows 2 9 1 && rowBit rows 2 9 11))) = true)
    (h1403 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 12 && rowBit rows 2 9 1 && rowBit rows 2 9 12))) = true)
    (h1404 : (!((rowBit rows 0 6 2 && rowBit rows 0 6 4 && rowBit rows 2 9 2 && rowBit rows 2 9 4))) = true)
    (h1405 : (!((rowBit rows 0 6 2 && rowBit rows 0 6 5 && rowBit rows 2 9 2 && rowBit rows 2 9 5))) = true)
    (h1406 : (!((rowBit rows 0 6 2 && rowBit rows 0 6 10 && rowBit rows 2 9 2 && rowBit rows 2 9 10))) = true)
    (h1407 : (!((rowBit rows 0 6 2 && rowBit rows 0 6 11 && rowBit rows 2 9 2 && rowBit rows 2 9 11))) = true) :
    ∀ item ∈ sourceChunk021Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk021Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1344
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1345
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1346
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1347
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1348
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1349
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1350
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1351
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1352
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1353
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1354
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1355
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1356
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1357
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1358
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1359
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1360
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1361
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1362
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1363
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1364
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1365 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1366
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1367
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1368
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1369
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1370
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1371
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1372
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1373
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1374
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1375
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1376
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1377
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1378
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1379
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1380
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1381
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1382
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1383
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1384
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1385
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1386
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1387
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1388
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1389
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1390
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1391
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1392
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1393
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1394 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1395
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1396
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1397
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1398
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1399
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1400
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1401
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1402
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1403
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1404
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1405
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1406
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1407

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
