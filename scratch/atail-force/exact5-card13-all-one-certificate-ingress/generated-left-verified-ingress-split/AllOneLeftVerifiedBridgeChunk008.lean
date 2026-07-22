/-
Generated packed-source bridge for verified left chunk 008.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk008_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h0512 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 9 && rowBit rows 0 10 4 && rowBit rows 0 10 9))) = true)
    (h0513 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 6 && rowBit rows 0 10 5 && rowBit rows 0 10 6))) = true)
    (h0514 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 8 && rowBit rows 0 10 5 && rowBit rows 0 10 8))) = true)
    (h0515 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 9 && rowBit rows 0 10 5 && rowBit rows 0 10 9))) = true)
    (h0516 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 7 && rowBit rows 0 10 6 && rowBit rows 0 10 7))) = true)
    (h0517 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 8 && rowBit rows 0 10 6 && rowBit rows 0 10 8))) = true)
    (h0518 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 9 && rowBit rows 0 10 6 && rowBit rows 0 10 9))) = true)
    (h0519 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 0 10 7 && rowBit rows 0 10 8))) = true)
    (h0520 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 9 && rowBit rows 0 10 7 && rowBit rows 0 10 9))) = true)
    (h0521 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 0 10 8 && rowBit rows 0 10 9))) = true)
    (h0522 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 0 11 0 && rowBit rows 0 11 1))) = true)
    (h0523 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 12 && rowBit rows 0 11 0 && rowBit rows 0 11 12))) = true)
    (h0524 : (!((rowBit rows 0 2 1 && rowBit rows 0 2 12 && rowBit rows 0 11 1 && rowBit rows 0 11 12))) = true)
    (h0525 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 4 && rowBit rows 0 11 3 && rowBit rows 0 11 4))) = true)
    (h0526 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 5 && rowBit rows 0 11 3 && rowBit rows 0 11 5))) = true)
    (h0527 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 6 && rowBit rows 0 11 3 && rowBit rows 0 11 6))) = true)
    (h0528 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 7 && rowBit rows 0 11 3 && rowBit rows 0 11 7))) = true)
    (h0529 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 8 && rowBit rows 0 11 3 && rowBit rows 0 11 8))) = true)
    (h0530 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 9 && rowBit rows 0 11 3 && rowBit rows 0 11 9))) = true)
    (h0531 : (!((rowBit rows 0 2 3 && rowBit rows 0 2 10 && rowBit rows 0 11 3 && rowBit rows 0 11 10))) = true)
    (h0532 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 5 && rowBit rows 0 11 4 && rowBit rows 0 11 5))) = true)
    (h0533 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 6 && rowBit rows 0 11 4 && rowBit rows 0 11 6))) = true)
    (h0534 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 7 && rowBit rows 0 11 4 && rowBit rows 0 11 7))) = true)
    (h0535 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 8 && rowBit rows 0 11 4 && rowBit rows 0 11 8))) = true)
    (h0536 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 9 && rowBit rows 0 11 4 && rowBit rows 0 11 9))) = true)
    (h0537 : (!((rowBit rows 0 2 4 && rowBit rows 0 2 10 && rowBit rows 0 11 4 && rowBit rows 0 11 10))) = true)
    (h0538 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 7 && rowBit rows 0 11 5 && rowBit rows 0 11 7))) = true)
    (h0539 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 8 && rowBit rows 0 11 5 && rowBit rows 0 11 8))) = true)
    (h0540 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 9 && rowBit rows 0 11 5 && rowBit rows 0 11 9))) = true)
    (h0541 : (!((rowBit rows 0 2 5 && rowBit rows 0 2 10 && rowBit rows 0 11 5 && rowBit rows 0 11 10))) = true)
    (h0542 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 7 && rowBit rows 0 11 6 && rowBit rows 0 11 7))) = true)
    (h0543 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 8 && rowBit rows 0 11 6 && rowBit rows 0 11 8))) = true)
    (h0544 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 9 && rowBit rows 0 11 6 && rowBit rows 0 11 9))) = true)
    (h0545 : (!((rowBit rows 0 2 6 && rowBit rows 0 2 10 && rowBit rows 0 11 6 && rowBit rows 0 11 10))) = true)
    (h0546 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 8 && rowBit rows 0 11 7 && rowBit rows 0 11 8))) = true)
    (h0547 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 9 && rowBit rows 0 11 7 && rowBit rows 0 11 9))) = true)
    (h0548 : (!((rowBit rows 0 2 7 && rowBit rows 0 2 10 && rowBit rows 0 11 7 && rowBit rows 0 11 10))) = true)
    (h0549 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 9 && rowBit rows 0 11 8 && rowBit rows 0 11 9))) = true)
    (h0550 : (!((rowBit rows 0 2 8 && rowBit rows 0 2 10 && rowBit rows 0 11 8 && rowBit rows 0 11 10))) = true)
    (h0551 : (!((rowBit rows 0 2 9 && rowBit rows 0 2 10 && rowBit rows 0 11 9 && rowBit rows 0 11 10))) = true)
    (h0552 : (!((rowBit rows 0 2 0 && rowBit rows 0 2 1 && rowBit rows 0 12 0 && rowBit rows 0 12 1))) = true)
    (h0553 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 5 && rowBit rows 0 4 0 && rowBit rows 0 4 5))) = true)
    (h0554 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 6 && rowBit rows 0 4 0 && rowBit rows 0 4 6))) = true)
    (h0555 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 9 && rowBit rows 0 4 0 && rowBit rows 0 4 9))) = true)
    (h0556 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 11 && rowBit rows 0 4 0 && rowBit rows 0 4 11))) = true)
    (h0557 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 12 && rowBit rows 0 4 0 && rowBit rows 0 4 12))) = true)
    (h0558 : (!((rowBit rows 0 3 1 && rowBit rows 0 3 9 && rowBit rows 0 4 1 && rowBit rows 0 4 9))) = true)
    (h0559 : (!((rowBit rows 0 3 1 && rowBit rows 0 3 11 && rowBit rows 0 4 1 && rowBit rows 0 4 11))) = true)
    (h0560 : (!((rowBit rows 0 3 1 && rowBit rows 0 3 12 && rowBit rows 0 4 1 && rowBit rows 0 4 12))) = true)
    (h0561 : (!((rowBit rows 0 3 2 && rowBit rows 0 3 5 && rowBit rows 0 4 2 && rowBit rows 0 4 5))) = true)
    (h0562 : (!((rowBit rows 0 3 9 && rowBit rows 0 3 12 && rowBit rows 0 4 9 && rowBit rows 0 4 12))) = true)
    (h0563 : (!((rowBit rows 0 3 10 && rowBit rows 0 3 11 && rowBit rows 0 4 10 && rowBit rows 0 4 11))) = true)
    (h0564 : (!((rowBit rows 0 3 10 && rowBit rows 0 3 12 && rowBit rows 0 4 10 && rowBit rows 0 4 12))) = true)
    (h0565 : (!((rowBit rows 0 3 11 && rowBit rows 0 3 12 && rowBit rows 0 4 11 && rowBit rows 0 4 12))) = true)
    (h0566 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 2 && rowBit rows 0 5 0 && rowBit rows 0 5 2))) = true)
    (h0567 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 6 && rowBit rows 0 5 0 && rowBit rows 0 5 6))) = true)
    (h0568 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 7 && rowBit rows 0 5 0 && rowBit rows 0 5 7))) = true)
    (h0569 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 8 && rowBit rows 0 5 0 && rowBit rows 0 5 8))) = true)
    (h0570 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 9 && rowBit rows 0 5 0 && rowBit rows 0 5 9))) = true)
    (h0571 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 10 && rowBit rows 0 5 0 && rowBit rows 0 5 10))) = true)
    (h0572 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 11 && rowBit rows 0 5 0 && rowBit rows 0 5 11))) = true)
    (h0573 : (!((rowBit rows 0 3 0 && rowBit rows 0 3 12 && rowBit rows 0 5 0 && rowBit rows 0 5 12))) = true)
    (h0574 : (!((rowBit rows 0 3 2 && rowBit rows 0 3 7 && rowBit rows 0 5 2 && rowBit rows 0 5 7))) = true)
    (h0575 : (!((rowBit rows 0 3 6 && rowBit rows 0 3 9 && rowBit rows 0 5 6 && rowBit rows 0 5 9))) = true) :
    ∀ item ∈ sourceChunk008Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk008Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0512
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0513
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0514
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0515
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0516
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0517
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0518
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0519
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0520
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0521
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0522
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0523
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0524
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0525
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0526
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0527
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0528
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0529
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0530
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0531
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0532
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0533
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0534
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0535
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0536
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0537
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0538
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0539
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0540
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0541
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0542
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0543
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0544
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0545
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0546
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0547
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0548
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0549
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0550
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0551
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0552
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0553
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0554
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0555
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0556
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0557
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0558
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0559
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0560
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0561
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0562
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0563
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0564
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0565
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0566
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0567
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0568
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0569
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0570
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0571
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0572
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0573
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0574
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h0575

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
