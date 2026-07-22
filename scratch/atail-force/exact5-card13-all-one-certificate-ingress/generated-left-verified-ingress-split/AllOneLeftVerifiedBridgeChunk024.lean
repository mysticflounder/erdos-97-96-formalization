/-
Generated packed-source bridge for verified left chunk 024.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk024_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h1536 : (!((rowBit rows 0 6 0 && rowBit rows 0 6 1 && rowBit rows 2 8 0 && rowBit rows 2 8 1))) = true)
    (h1537 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 10 && rowBit rows 2 8 1 && rowBit rows 2 8 10))) = true)
    (h1538 : (!((rowBit rows 0 6 1 && rowBit rows 0 6 11 && rowBit rows 2 8 1 && rowBit rows 2 8 11))) = true)
    (h1539 : (!((rowBit rows 0 7 1 && rowBit rows 0 7 3 && rowBit rows 2 8 1 && rowBit rows 2 8 3))) = true)
    (h1540 : (!((rowBit rows 0 7 1 && rowBit rows 0 7 9 && rowBit rows 2 8 1 && rowBit rows 2 8 9))) = true)
    (h1541 : (!((rowBit rows 0 0 1 && rowBit rows 0 0 6 && rowBit rows 2 9 1 && rowBit rows 2 9 6))) = true)
    (h1542 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 5 && rowBit rows 2 9 2 && rowBit rows 2 9 5))) = true)
    (h1543 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 6 && rowBit rows 2 9 2 && rowBit rows 2 9 6))) = true)
    (h1544 : (!((rowBit rows 0 0 2 && rowBit rows 0 0 7 && rowBit rows 2 9 2 && rowBit rows 2 9 7))) = true)
    (h1545 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 5 && rowBit rows 2 9 3 && rowBit rows 2 9 5))) = true)
    (h1546 : (!((rowBit rows 0 0 3 && rowBit rows 0 0 6 && rowBit rows 2 9 3 && rowBit rows 2 9 6))) = true)
    (h1547 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 6 && rowBit rows 2 9 4 && rowBit rows 2 9 6))) = true)
    (h1548 : (!((rowBit rows 0 0 4 && rowBit rows 0 0 7 && rowBit rows 2 9 4 && rowBit rows 2 9 7))) = true)
    (h1549 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 6 && rowBit rows 2 9 5 && rowBit rows 2 9 6))) = true)
    (h1550 : (!((rowBit rows 0 0 5 && rowBit rows 0 0 7 && rowBit rows 2 9 5 && rowBit rows 2 9 7))) = true)
    (h1551 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 4 && rowBit rows 0 10 1 && rowBit rows 0 10 4))) = true)
    (h1552 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 7 && rowBit rows 0 10 1 && rowBit rows 0 10 7))) = true)
    (h1553 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 4 && rowBit rows 0 11 1 && rowBit rows 0 11 4))) = true)
    (h1554 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 5 && rowBit rows 0 11 1 && rowBit rows 0 11 5))) = true)
    (h1555 : (!((rowBit rows 2 8 1 && rowBit rows 2 8 7 && rowBit rows 0 12 1 && rowBit rows 0 12 7))) = true)
    (h1556 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 4 && rowBit rows 0 10 1 && rowBit rows 0 10 4))) = true)
    (h1557 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 5 && rowBit rows 0 10 1 && rowBit rows 0 10 5))) = true)
    (h1558 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 7 && rowBit rows 0 10 1 && rowBit rows 0 10 7))) = true)
    (h1559 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 6 && rowBit rows 0 10 2 && rowBit rows 0 10 6))) = true)
    (h1560 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 4 && rowBit rows 0 10 3 && rowBit rows 0 10 4))) = true)
    (h1561 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 5 && rowBit rows 0 10 3 && rowBit rows 0 10 5))) = true)
    (h1562 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 6 && rowBit rows 0 10 3 && rowBit rows 0 10 6))) = true)
    (h1563 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 7 && rowBit rows 0 10 3 && rowBit rows 0 10 7))) = true)
    (h1564 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 5 && rowBit rows 0 10 4 && rowBit rows 0 10 5))) = true)
    (h1565 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 6 && rowBit rows 0 10 4 && rowBit rows 0 10 6))) = true)
    (h1566 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 7 && rowBit rows 0 10 4 && rowBit rows 0 10 7))) = true)
    (h1567 : (!((rowBit rows 2 9 5 && rowBit rows 2 9 6 && rowBit rows 0 10 5 && rowBit rows 0 10 6))) = true)
    (h1568 : (!((rowBit rows 2 9 5 && rowBit rows 2 9 7 && rowBit rows 0 10 5 && rowBit rows 0 10 7))) = true)
    (h1569 : (!((rowBit rows 2 9 6 && rowBit rows 2 9 7 && rowBit rows 0 10 6 && rowBit rows 0 10 7))) = true)
    (h1570 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 4 && rowBit rows 0 11 1 && rowBit rows 0 11 4))) = true)
    (h1571 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 5 && rowBit rows 0 11 1 && rowBit rows 0 11 5))) = true)
    (h1572 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 6 && rowBit rows 0 11 1 && rowBit rows 0 11 6))) = true)
    (h1573 : (!((rowBit rows 2 9 1 && rowBit rows 2 9 7 && rowBit rows 0 11 1 && rowBit rows 0 11 7))) = true)
    (h1574 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 4 && rowBit rows 0 11 2 && rowBit rows 0 11 4))) = true)
    (h1575 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 5 && rowBit rows 0 11 2 && rowBit rows 0 11 5))) = true)
    (h1576 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 6 && rowBit rows 0 11 2 && rowBit rows 0 11 6))) = true)
    (h1577 : (!((rowBit rows 2 9 2 && rowBit rows 2 9 7 && rowBit rows 0 11 2 && rowBit rows 0 11 7))) = true)
    (h1578 : (!((rowBit rows 2 9 3 && rowBit rows 2 9 6 && rowBit rows 0 11 3 && rowBit rows 0 11 6))) = true)
    (h1579 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 5 && rowBit rows 0 11 4 && rowBit rows 0 11 5))) = true)
    (h1580 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 6 && rowBit rows 0 11 4 && rowBit rows 0 11 6))) = true)
    (h1581 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 7 && rowBit rows 0 11 4 && rowBit rows 0 11 7))) = true)
    (h1582 : (!((rowBit rows 2 9 5 && rowBit rows 2 9 6 && rowBit rows 0 11 5 && rowBit rows 0 11 6))) = true)
    (h1583 : (!((rowBit rows 2 9 5 && rowBit rows 2 9 7 && rowBit rows 0 11 5 && rowBit rows 0 11 7))) = true)
    (h1584 : (!((rowBit rows 2 9 6 && rowBit rows 2 9 7 && rowBit rows 0 11 6 && rowBit rows 0 11 7))) = true)
    (h1585 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 6 && rowBit rows 0 12 4 && rowBit rows 0 12 6))) = true)
    (h1586 : (!((rowBit rows 2 9 4 && rowBit rows 2 9 7 && rowBit rows 0 12 4 && rowBit rows 0 12 7))) = true)
    (h1587 : (!((rowBit rows 1 0 4 && rowBit rows 1 0 5 && rowBit rows 2 1 4 && rowBit rows 2 1 5))) = true)
    (h1588 : (!((rowBit rows 2 0 4 && rowBit rows 2 0 5 && rowBit rows 1 1 4 && rowBit rows 1 1 5))) = true)
    (h1589 : (!((rowBit rows 1 1 4 && rowBit rows 1 1 5 && rowBit rows 2 2 4 && rowBit rows 2 2 5))) = true)
    (h1590 : (!((rowBit rows 2 1 4 && rowBit rows 2 1 5 && rowBit rows 1 2 4 && rowBit rows 1 2 5))) = true)
    (h1591 : (!((rowBit rows 1 3 10 && rowBit rows 1 3 12 && rowBit rows 2 4 10 && rowBit rows 2 4 12))) = true)
    (h1592 : (!((rowBit rows 2 6 3 && rowBit rows 2 6 4 && rowBit rows 1 8 3 && rowBit rows 1 8 4))) = true)
    (h1593 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 3 && rowBit rows 2 9 0 && rowBit rows 2 9 3))) = true)
    (h1594 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 4 && rowBit rows 2 9 0 && rowBit rows 2 9 4))) = true)
    (h1595 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 5 && rowBit rows 2 9 0 && rowBit rows 2 9 5))) = true)
    (h1596 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 6 && rowBit rows 2 9 0 && rowBit rows 2 9 6))) = true)
    (h1597 : (!((rowBit rows 1 8 0 && rowBit rows 1 8 7 && rowBit rows 2 9 0 && rowBit rows 2 9 7))) = true)
    (h1598 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 5 && rowBit rows 2 9 3 && rowBit rows 2 9 5))) = true)
    (h1599 : (!((rowBit rows 1 8 3 && rowBit rows 1 8 6 && rowBit rows 2 9 3 && rowBit rows 2 9 6))) = true) :
    ∀ item ∈ sourceChunk024Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk024Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1536
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1537
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1538
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1539
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1540
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1541
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1542
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1543
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1544
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1545
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1546
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1547
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1548
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1549
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1550
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1551
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1552
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1553
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1554
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1555
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1556
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1557
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1558
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1559
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1560
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1561
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1562
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1563
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1564
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1565
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1566
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1567
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1568
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1569
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1570
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1571
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1572
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1573
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1574
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1575
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1576
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1577
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1578
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1579
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1580
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1581
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1582
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1583
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1584
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1585
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1586
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1587
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1588
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1589
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1590
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1591
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1592
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1593
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1594
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1595
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1596
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1597
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1598
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h1599

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
