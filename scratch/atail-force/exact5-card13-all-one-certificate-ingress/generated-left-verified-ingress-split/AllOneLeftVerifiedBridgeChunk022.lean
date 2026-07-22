/-
Generated packed-source bridge for verified left chunk 022.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk022_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1408 : (!((rowBit rows 0 6 2 && rowBit rows 0 6 12 && rowBit rows 2 9 2 && rowBit rows 2 9 12))) = true)
    (h1409 : (!((rowBit rows 0 6 3 && rowBit rows 0 6 4 && rowBit rows 2 9 3 && rowBit rows 2 9 4))) = true)
    (h1410 : (!((rowBit rows 0 6 3 && rowBit rows 0 6 5 && rowBit rows 2 9 3 && rowBit rows 2 9 5))) = true)
    (h1411 : (!((rowBit rows 0 6 3 && rowBit rows 0 6 10 && rowBit rows 2 9 3 && rowBit rows 2 9 10))) = true)
    (h1412 : (!((rowBit rows 0 6 3 && rowBit rows 0 6 11 && rowBit rows 2 9 3 && rowBit rows 2 9 11))) = true)
    (h1413 : (!((rowBit rows 0 6 3 && rowBit rows 0 6 12 && rowBit rows 2 9 3 && rowBit rows 2 9 12))) = true)
    (h1414 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 5 && rowBit rows 2 9 4 && rowBit rows 2 9 5))) = true)
    (h1415 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 10 && rowBit rows 2 9 4 && rowBit rows 2 9 10))) = true)
    (h1416 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 11 && rowBit rows 2 9 4 && rowBit rows 2 9 11))) = true)
    (h1417 : (!((rowBit rows 0 6 4 && rowBit rows 0 6 12 && rowBit rows 2 9 4 && rowBit rows 2 9 12))) = true)
    (h1418 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 10 && rowBit rows 2 9 5 && rowBit rows 2 9 10))) = true)
    (h1419 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 11 && rowBit rows 2 9 5 && rowBit rows 2 9 11))) = true)
    (h1420 : (!((rowBit rows 0 6 5 && rowBit rows 0 6 12 && rowBit rows 2 9 5 && rowBit rows 2 9 12))) = true)
    (h1421 : (!((rowBit rows 0 6 7 && rowBit rows 0 6 8 && rowBit rows 2 9 7 && rowBit rows 2 9 8))) = true)
    (h1422 : (!((rowBit rows 0 6 10 && rowBit rows 0 6 11 && rowBit rows 2 9 10 && rowBit rows 2 9 11))) = true)
    (h1423 : (!((rowBit rows 0 6 10 && rowBit rows 0 6 12 && rowBit rows 2 9 10 && rowBit rows 2 9 12))) = true)
    (h1424 : (!((rowBit rows 0 6 11 && rowBit rows 0 6 12 && rowBit rows 2 9 11 && rowBit rows 2 9 12))) = true)
    (h1425 : (!((rowBit rows 0 7 1 && rowBit rows 0 7 5 && rowBit rows 2 8 1 && rowBit rows 2 8 5))) = true)
    (h1426 : (!((rowBit rows 0 7 1 && rowBit rows 0 7 6 && rowBit rows 2 8 1 && rowBit rows 2 8 6))) = true)
    (h1427 : (!((rowBit rows 0 7 1 && rowBit rows 0 7 11 && rowBit rows 2 8 1 && rowBit rows 2 8 11))) = true)
    (h1428 : (!((rowBit rows 0 7 5 && rowBit rows 0 7 10 && rowBit rows 2 8 5 && rowBit rows 2 8 10))) = true)
    (h1429 : (!((rowBit rows 0 7 1 && rowBit rows 0 7 6 && rowBit rows 2 9 1 && rowBit rows 2 9 6))) = true)
    (h1430 : (!((rowBit rows 0 7 6 && rowBit rows 0 7 10 && rowBit rows 2 9 6 && rowBit rows 2 9 10))) = true)
    (h1431 : (!((rowBit rows 0 7 6 && rowBit rows 0 7 11 && rowBit rows 2 9 6 && rowBit rows 2 9 11))) = true)
    (h1432 : (!((rowBit rows 0 7 10 && rowBit rows 0 7 11 && rowBit rows 2 9 10 && rowBit rows 2 9 11))) = true)
    (h1433 : (!((rowBit rows 0 7 10 && rowBit rows 0 7 12 && rowBit rows 2 9 10 && rowBit rows 2 9 12))) = true)
    (h1434 : (!((rowBit rows 0 7 11 && rowBit rows 0 7 12 && rowBit rows 2 9 11 && rowBit rows 2 9 12))) = true)
    (h1435 : (!((rowBit rows 2 8 0 && rowBit rows 2 8 1 && rowBit rows 0 10 0 && rowBit rows 0 10 1))) = true)
    (h1436 : (!((rowBit rows 2 8 0 && rowBit rows 2 8 5 && rowBit rows 0 10 0 && rowBit rows 0 10 5))) = true)
    (h1437 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 5 && rowBit rows 0 10 1 && rowBit rows 0 10 5))) = true)
    (h1438 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 6 && rowBit rows 0 10 1 && rowBit rows 0 10 6))) = true)
    (h1439 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 11 && rowBit rows 0 10 1 && rowBit rows 0 10 11))) = true)
    (h1440 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 12 && rowBit rows 0 10 1 && rowBit rows 0 10 12))) = true)
    (h1441 : (!((rowBit rows 2 8 4 && rowBit rows 2 8 11 && rowBit rows 0 10 4 && rowBit rows 0 10 11))) = true)
    (h1442 : (!((rowBit rows 2 8 6 && rowBit rows 2 8 11 && rowBit rows 0 10 6 && rowBit rows 0 10 11))) = true)
    (h1443 : (!((rowBit rows 2 8 6 && rowBit rows 2 8 12 && rowBit rows 0 10 6 && rowBit rows 0 10 12))) = true)
    (h1444 : (!((rowBit rows 2 8 0 && rowBit rows 2 8 1 && rowBit rows 0 11 0 && rowBit rows 0 11 1))) = true)
    (h1445 : (!((rowBit rows 2 8 0 && rowBit rows 2 8 5 && rowBit rows 0 11 0 && rowBit rows 0 11 5))) = true)
    (h1446 : (!((rowBit rows 2 8 0 && rowBit rows 2 8 6 && rowBit rows 0 11 0 && rowBit rows 0 11 6))) = true)
    (h1447 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 6 && rowBit rows 0 11 1 && rowBit rows 0 11 6))) = true)
    (h1448 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 7 && rowBit rows 0 11 1 && rowBit rows 0 11 7))) = true)
    (h1449 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 12 && rowBit rows 0 11 1 && rowBit rows 0 11 12))) = true)
    (h1450 : (!((rowBit rows 2 8 5 && rowBit rows 2 8 12 && rowBit rows 0 11 5 && rowBit rows 0 11 12))) = true)
    (h1451 : (!((rowBit rows 2 8 6 && rowBit rows 2 8 12 && rowBit rows 0 11 6 && rowBit rows 0 11 12))) = true)
    (h1452 : (!((rowBit rows 2 8 0 && rowBit rows 2 8 1 && rowBit rows 0 12 0 && rowBit rows 0 12 1))) = true)
    (h1453 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 4 && rowBit rows 0 12 1 && rowBit rows 0 12 4))) = true)
    (h1454 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 5 && rowBit rows 0 12 1 && rowBit rows 0 12 5))) = true)
    (h1455 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 6 && rowBit rows 0 12 1 && rowBit rows 0 12 6))) = true)
    (h1456 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 1 && rowBit rows 0 10 0 && rowBit rows 0 10 1))) = true)
    (h1457 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 2 && rowBit rows 0 10 0 && rowBit rows 0 10 2))) = true)
    (h1458 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 3 && rowBit rows 0 10 0 && rowBit rows 0 10 3))) = true)
    (h1459 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 4 && rowBit rows 0 10 0 && rowBit rows 0 10 4))) = true)
    (h1460 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 5 && rowBit rows 0 10 0 && rowBit rows 0 10 5))) = true)
    (h1461 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 6 && rowBit rows 0 10 0 && rowBit rows 0 10 6))) = true)
    (h1462 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 7 && rowBit rows 0 10 0 && rowBit rows 0 10 7))) = true)
    (h1463 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 8 && rowBit rows 0 10 0 && rowBit rows 0 10 8))) = true)
    (h1464 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 11 && rowBit rows 0 10 0 && rowBit rows 0 10 11))) = true)
    (h1465 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 12 && rowBit rows 0 10 0 && rowBit rows 0 10 12))) = true)
    (h1466 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 6 && rowBit rows 0 10 1 && rowBit rows 0 10 6))) = true)
    (h1467 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 8 && rowBit rows 0 10 1 && rowBit rows 0 10 8))) = true)
    (h1468 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 11 && rowBit rows 0 10 1 && rowBit rows 0 10 11))) = true)
    (h1469 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 12 && rowBit rows 0 10 1 && rowBit rows 0 10 12))) = true)
    (h1470 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 4 && rowBit rows 0 10 2 && rowBit rows 0 10 4))) = true)
    (h1471 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 5 && rowBit rows 0 10 2 && rowBit rows 0 10 5))) = true) :
    ∀ item ∈ sourceChunk022Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk022Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1408
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1409
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1410
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1411
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1412
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1413
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1414
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1415
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1416
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1417
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1418
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1419
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1420
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1421
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1422
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1423
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1424
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1425
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1426
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1427
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1428
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1429
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1430
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1431
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1432
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1433
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1434
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1435
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1436
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1437
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1438
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1439
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1440
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1441
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1442
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1443
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1444
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1445
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1446
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1447
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1448
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1449
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1450
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1451
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1452
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1453
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1454
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1455
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1456
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1457
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1458
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1459
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1460
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1461
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1462
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1463
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1464
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1465
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1466
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1467
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1468
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1469
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1470
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1471

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
