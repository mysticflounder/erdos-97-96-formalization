/-
Generated packed-source bridge for verified right chunk 023.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk023_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1472 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 7 && rowBit rows 0 10 2 && rowBit rows 0 10 7))) = true)
    (h1473 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 8 && rowBit rows 0 10 2 && rowBit rows 0 10 8))) = true)
    (h1474 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 11 && rowBit rows 0 10 2 && rowBit rows 0 10 11))) = true)
    (h1475 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 12 && rowBit rows 0 10 2 && rowBit rows 0 10 12))) = true)
    (h1476 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 8 && rowBit rows 0 10 3 && rowBit rows 0 10 8))) = true)
    (h1477 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 11 && rowBit rows 0 10 3 && rowBit rows 0 10 11))) = true)
    (h1478 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 12 && rowBit rows 0 10 3 && rowBit rows 0 10 12))) = true)
    (h1479 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 8 && rowBit rows 0 10 4 && rowBit rows 0 10 8))) = true)
    (h1480 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 11 && rowBit rows 0 10 4 && rowBit rows 0 10 11))) = true)
    (h1481 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 12 && rowBit rows 0 10 4 && rowBit rows 0 10 12))) = true)
    (h1482 : (!((rowBit rows 2 9 5 && rowBit rows 2 9 8 && rowBit rows 0 10 5 && rowBit rows 0 10 8))) = true)
    (h1483 : (!((rowBit rows 2 9 5 && rowBit rows 2 9 11 && rowBit rows 0 10 5 && rowBit rows 0 10 11))) = true)
    (h1484 : (!((rowBit rows 2 9 5 && rowBit rows 2 9 12 && rowBit rows 0 10 5 && rowBit rows 0 10 12))) = true)
    (h1485 : (!((rowBit rows 2 9 6 && rowBit rows 2 9 8 && rowBit rows 0 10 6 && rowBit rows 0 10 8))) = true)
    (h1486 : (!((rowBit rows 2 9 6 && rowBit rows 2 9 11 && rowBit rows 0 10 6 && rowBit rows 0 10 11))) = true)
    (h1487 : (!((rowBit rows 2 9 6 && rowBit rows 2 9 12 && rowBit rows 0 10 6 && rowBit rows 0 10 12))) = true)
    (h1488 : (!((rowBit rows 2 9 7 && rowBit rows 2 9 8 && rowBit rows 0 10 7 && rowBit rows 0 10 8))) = true)
    (h1489 : (!((rowBit rows 2 9 7 && rowBit rows 2 9 11 && rowBit rows 0 10 7 && rowBit rows 0 10 11))) = true)
    (h1490 : (!((rowBit rows 2 9 7 && rowBit rows 2 9 12 && rowBit rows 0 10 7 && rowBit rows 0 10 12))) = true)
    (h1491 : (!((rowBit rows 2 9 8 && rowBit rows 2 9 11 && rowBit rows 0 10 8 && rowBit rows 0 10 11))) = true)
    (h1492 : (!((rowBit rows 2 9 8 && rowBit rows 2 9 12 && rowBit rows 0 10 8 && rowBit rows 0 10 12))) = true)
    (h1493 : (!((rowBit rows 2 9 11 && rowBit rows 2 9 12 && rowBit rows 0 10 11 && rowBit rows 0 10 12))) = true)
    (h1494 : (!((rowBit rows 0 9 0 && rowBit rows 0 9 8 && rowBit rows 2 11 0 && rowBit rows 2 11 8))) = true)
    (h1495 : ((((bif (rowBit rows 2 9 0 && rowBit rows 0 11 0) then 1#4 else 0#4) + (bif (rowBit rows 2 9 1 && rowBit rows 0 11 1) then 1#4 else 0#4) + (bif (rowBit rows 2 9 2 && rowBit rows 0 11 2) then 1#4 else 0#4) + (bif (rowBit rows 2 9 3 && rowBit rows 0 11 3) then 1#4 else 0#4) + (bif (rowBit rows 2 9 4 && rowBit rows 0 11 4) then 1#4 else 0#4) + (bif (rowBit rows 2 9 5 && rowBit rows 0 11 5) then 1#4 else 0#4) + (bif (rowBit rows 2 9 6 && rowBit rows 0 11 6) then 1#4 else 0#4) + (bif (rowBit rows 2 9 7 && rowBit rows 0 11 7) then 1#4 else 0#4) + (bif (rowBit rows 2 9 8 && rowBit rows 0 11 8) then 1#4 else 0#4) + (bif (rowBit rows 2 9 9 && rowBit rows 0 11 9) then 1#4 else 0#4) + (bif (rowBit rows 2 9 10 && rowBit rows 0 11 10) then 1#4 else 0#4) + (bif (rowBit rows 2 9 11 && rowBit rows 0 11 11) then 1#4 else 0#4) + (bif (rowBit rows 2 9 12 && rowBit rows 0 11 12) then 1#4 else 0#4))).ule 2#4) = true)
    (h1496 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 1 && rowBit rows 0 11 0 && rowBit rows 0 11 1))) = true)
    (h1497 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 2 && rowBit rows 0 11 0 && rowBit rows 0 11 2))) = true)
    (h1498 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 3 && rowBit rows 0 11 0 && rowBit rows 0 11 3))) = true)
    (h1499 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 4 && rowBit rows 0 11 0 && rowBit rows 0 11 4))) = true)
    (h1500 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 5 && rowBit rows 0 11 0 && rowBit rows 0 11 5))) = true)
    (h1501 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 6 && rowBit rows 0 11 0 && rowBit rows 0 11 6))) = true)
    (h1502 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 7 && rowBit rows 0 11 0 && rowBit rows 0 11 7))) = true)
    (h1503 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 8 && rowBit rows 0 11 0 && rowBit rows 0 11 8))) = true)
    (h1504 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 12 && rowBit rows 0 11 0 && rowBit rows 0 11 12))) = true)
    (h1505 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 8 && rowBit rows 0 11 1 && rowBit rows 0 11 8))) = true)
    (h1506 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 12 && rowBit rows 0 11 1 && rowBit rows 0 11 12))) = true)
    (h1507 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 8 && rowBit rows 0 11 2 && rowBit rows 0 11 8))) = true)
    (h1508 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 12 && rowBit rows 0 11 2 && rowBit rows 0 11 12))) = true)
    (h1509 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 4 && rowBit rows 0 11 3 && rowBit rows 0 11 4))) = true)
    (h1510 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 5 && rowBit rows 0 11 3 && rowBit rows 0 11 5))) = true)
    (h1511 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 7 && rowBit rows 0 11 3 && rowBit rows 0 11 7))) = true)
    (h1512 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 8 && rowBit rows 0 11 3 && rowBit rows 0 11 8))) = true)
    (h1513 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 12 && rowBit rows 0 11 3 && rowBit rows 0 11 12))) = true)
    (h1514 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 8 && rowBit rows 0 11 4 && rowBit rows 0 11 8))) = true)
    (h1515 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 12 && rowBit rows 0 11 4 && rowBit rows 0 11 12))) = true)
    (h1516 : (!((rowBit rows 2 9 5 && rowBit rows 2 9 8 && rowBit rows 0 11 5 && rowBit rows 0 11 8))) = true)
    (h1517 : (!((rowBit rows 2 9 5 && rowBit rows 2 9 12 && rowBit rows 0 11 5 && rowBit rows 0 11 12))) = true)
    (h1518 : (!((rowBit rows 2 9 6 && rowBit rows 2 9 8 && rowBit rows 0 11 6 && rowBit rows 0 11 8))) = true)
    (h1519 : (!((rowBit rows 2 9 6 && rowBit rows 2 9 12 && rowBit rows 0 11 6 && rowBit rows 0 11 12))) = true)
    (h1520 : (!((rowBit rows 2 9 7 && rowBit rows 2 9 8 && rowBit rows 0 11 7 && rowBit rows 0 11 8))) = true)
    (h1521 : (!((rowBit rows 2 9 7 && rowBit rows 2 9 12 && rowBit rows 0 11 7 && rowBit rows 0 11 12))) = true)
    (h1522 : (!((rowBit rows 2 9 8 && rowBit rows 2 9 12 && rowBit rows 0 11 8 && rowBit rows 0 11 12))) = true)
    (h1523 : (!((rowBit rows 2 9 0 && rowBit rows 2 9 6 && rowBit rows 0 12 0 && rowBit rows 0 12 6))) = true)
    (h1524 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 8 && rowBit rows 0 12 4 && rowBit rows 0 12 8))) = true)
    (h1525 : (!((rowBit rows 2 9 7 && rowBit rows 2 9 8 && rowBit rows 0 12 7 && rowBit rows 0 12 8))) = true)
    (h1526 : (!((rowBit rows 0 10 2 && rowBit rows 0 10 9 && rowBit rows 2 11 2 && rowBit rows 2 11 9))) = true)
    (h1527 : (!((rowBit rows 2 10 2 && rowBit rows 2 10 9 && rowBit rows 0 11 2 && rowBit rows 0 11 9))) = true)
    (h1528 : (!((rowBit rows 0 10 2 && rowBit rows 0 10 9 && rowBit rows 2 12 2 && rowBit rows 2 12 9))) = true)
    (h1529 : (!((rowBit rows 2 10 2 && rowBit rows 2 10 9 && rowBit rows 0 12 2 && rowBit rows 0 12 9))) = true)
    (h1530 : (!((rowBit rows 0 11 2 && rowBit rows 0 11 9 && rowBit rows 2 12 2 && rowBit rows 2 12 9))) = true)
    (h1531 : (!((rowBit rows 2 11 2 && rowBit rows 2 11 9 && rowBit rows 0 12 2 && rowBit rows 0 12 9))) = true)
    (h1532 : (!((rowBit rows 2 4 10 && rowBit rows 2 4 12 && rowBit rows 0 5 10 && rowBit rows 0 5 12))) = true)
    (h1533 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 9 && rowBit rows 2 8 1 && rowBit rows 2 8 9))) = true)
    (h1534 : (!((rowBit rows 0 4 1 && rowBit rows 0 4 11 && rowBit rows 2 8 1 && rowBit rows 2 8 11))) = true)
    (h1535 : (!((rowBit rows 0 5 1 && rowBit rows 0 5 9 && rowBit rows 2 8 1 && rowBit rows 2 8 9))) = true) :
    ∀ item ∈ sourceChunk023Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk023Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1472
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1473
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1474
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1475
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1476
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1477
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1478
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1479
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1480
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1481
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1482
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1483
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1484
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1485
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1486
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1487
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1488
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1489
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1490
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1491
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1492
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1493
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1494
  · simp [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] at h1495 ⊢
    bv_decide
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1496
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1497
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1498
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1499
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1500
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1501
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1502
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1503
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1504
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1505
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1506
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1507
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1508
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1509
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1510
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1511
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1512
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1513
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1514
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1515
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1516
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1517
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1518
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1519
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1520
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1521
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1522
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1523
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1524
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1525
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1526
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1527
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1528
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1529
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1530
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1531
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1532
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1533
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1534
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1535

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
