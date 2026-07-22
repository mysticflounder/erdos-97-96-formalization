/-
Generated packed-source bridge for verified middle chunk 057.
-/
import AllOneMiddleVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Middle

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk057_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h3648 : ((!((rankAtom ranks 7 == rankAtom ranks 2)) || ((rankAtom ranks 70).ult (rankAtom ranks 40)))) = true)
    (h3649 : ((!((rankAtom ranks 40 == rankAtom ranks 2)) || ((rankAtom ranks 70).ult (rankAtom ranks 7)))) = true)
    (h3650 : ((!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 10).ult (rankAtom ranks 40)))) = true)
    (h3651 : ((!((rankAtom ranks 40 == rankAtom ranks 10)) || ((rankAtom ranks 37).ult (rankAtom ranks 7)))) = true)
    (h3652 : ((!((rankAtom ranks 40 == rankAtom ranks 37)) || ((rankAtom ranks 10).ult (rankAtom ranks 7)))) = true)
    (h3653 : ((!((rankAtom ranks 7 == rankAtom ranks 2)) || ((rankAtom ranks 71).ult (rankAtom ranks 41)))) = true)
    (h3654 : ((!((rankAtom ranks 41 == rankAtom ranks 2)) || ((rankAtom ranks 71).ult (rankAtom ranks 7)))) = true)
    (h3655 : ((!((rankAtom ranks 7 == rankAtom ranks 37)) || ((rankAtom ranks 11).ult (rankAtom ranks 41)))) = true)
    (h3656 : ((!((rankAtom ranks 41 == rankAtom ranks 11)) || ((rankAtom ranks 37).ult (rankAtom ranks 7)))) = true)
    (h3657 : ((!((rankAtom ranks 41 == rankAtom ranks 37)) || ((rankAtom ranks 11).ult (rankAtom ranks 7)))) = true)
    (h3658 : ((!((rankAtom ranks 8 == rankAtom ranks 2)) || ((rankAtom ranks 72).ult (rankAtom ranks 39)))) = true)
    (h3659 : ((!((rankAtom ranks 8 == rankAtom ranks 72)) || ((rankAtom ranks 2).ult (rankAtom ranks 39)))) = true)
    (h3660 : ((!((rankAtom ranks 39 == rankAtom ranks 72)) || ((rankAtom ranks 2).ult (rankAtom ranks 8)))) = true)
    (h3661 : ((!((rankAtom ranks 8 == rankAtom ranks 38)) || ((rankAtom ranks 9).ult (rankAtom ranks 39)))) = true)
    (h3662 : ((!((rankAtom ranks 39 == rankAtom ranks 9)) || ((rankAtom ranks 38).ult (rankAtom ranks 8)))) = true)
    (h3663 : ((!((rankAtom ranks 39 == rankAtom ranks 38)) || ((rankAtom ranks 9).ult (rankAtom ranks 8)))) = true)
    (h3664 : ((!((rankAtom ranks 8 == rankAtom ranks 2)) || ((rankAtom ranks 73).ult (rankAtom ranks 40)))) = true)
    (h3665 : ((!((rankAtom ranks 8 == rankAtom ranks 73)) || ((rankAtom ranks 2).ult (rankAtom ranks 40)))) = true)
    (h3666 : ((!((rankAtom ranks 40 == rankAtom ranks 2)) || ((rankAtom ranks 73).ult (rankAtom ranks 8)))) = true)
    (h3667 : ((!((rankAtom ranks 40 == rankAtom ranks 73)) || ((rankAtom ranks 2).ult (rankAtom ranks 8)))) = true)
    (h3668 : ((!((rankAtom ranks 8 == rankAtom ranks 38)) || ((rankAtom ranks 10).ult (rankAtom ranks 40)))) = true)
    (h3669 : ((!((rankAtom ranks 40 == rankAtom ranks 10)) || ((rankAtom ranks 38).ult (rankAtom ranks 8)))) = true)
    (h3670 : ((!((rankAtom ranks 40 == rankAtom ranks 38)) || ((rankAtom ranks 10).ult (rankAtom ranks 8)))) = true)
    (h3671 : ((!((rankAtom ranks 8 == rankAtom ranks 2)) || ((rankAtom ranks 74).ult (rankAtom ranks 41)))) = true)
    (h3672 : ((!((rankAtom ranks 8 == rankAtom ranks 74)) || ((rankAtom ranks 2).ult (rankAtom ranks 41)))) = true)
    (h3673 : ((!((rankAtom ranks 41 == rankAtom ranks 2)) || ((rankAtom ranks 74).ult (rankAtom ranks 8)))) = true)
    (h3674 : ((!((rankAtom ranks 8 == rankAtom ranks 11)) || ((rankAtom ranks 38).ult (rankAtom ranks 41)))) = true)
    (h3675 : ((!((rankAtom ranks 8 == rankAtom ranks 38)) || ((rankAtom ranks 11).ult (rankAtom ranks 41)))) = true)
    (h3676 : ((!((rankAtom ranks 41 == rankAtom ranks 38)) || ((rankAtom ranks 11).ult (rankAtom ranks 8)))) = true)
    (h3677 : ((!((rankAtom ranks 9 == rankAtom ranks 2)) || ((rankAtom ranks 75).ult (rankAtom ranks 40)))) = true)
    (h3678 : ((!((rankAtom ranks 9 == rankAtom ranks 75)) || ((rankAtom ranks 2).ult (rankAtom ranks 40)))) = true)
    (h3679 : ((!((rankAtom ranks 40 == rankAtom ranks 75)) || ((rankAtom ranks 2).ult (rankAtom ranks 9)))) = true)
    (h3680 : ((!((rankAtom ranks 9 == rankAtom ranks 10)) || ((rankAtom ranks 39).ult (rankAtom ranks 40)))) = true)
    (h3681 : ((!((rankAtom ranks 9 == rankAtom ranks 39)) || ((rankAtom ranks 10).ult (rankAtom ranks 40)))) = true)
    (h3682 : ((!((rankAtom ranks 40 == rankAtom ranks 10)) || ((rankAtom ranks 39).ult (rankAtom ranks 9)))) = true)
    (h3683 : ((!((rankAtom ranks 40 == rankAtom ranks 39)) || ((rankAtom ranks 10).ult (rankAtom ranks 9)))) = true)
    (h3684 : ((!((rankAtom ranks 9 == rankAtom ranks 2)) || ((rankAtom ranks 76).ult (rankAtom ranks 41)))) = true)
    (h3685 : ((!((rankAtom ranks 9 == rankAtom ranks 76)) || ((rankAtom ranks 2).ult (rankAtom ranks 41)))) = true)
    (h3686 : ((!((rankAtom ranks 41 == rankAtom ranks 2)) || ((rankAtom ranks 76).ult (rankAtom ranks 9)))) = true)
    (h3687 : ((!((rankAtom ranks 9 == rankAtom ranks 39)) || ((rankAtom ranks 11).ult (rankAtom ranks 41)))) = true)
    (h3688 : ((!((rankAtom ranks 41 == rankAtom ranks 39)) || ((rankAtom ranks 11).ult (rankAtom ranks 9)))) = true)
    (h3689 : ((!((rankAtom ranks 10 == rankAtom ranks 2)) || ((rankAtom ranks 77).ult (rankAtom ranks 41)))) = true)
    (h3690 : ((!((rankAtom ranks 10 == rankAtom ranks 77)) || ((rankAtom ranks 2).ult (rankAtom ranks 41)))) = true)
    (h3691 : ((!((rankAtom ranks 41 == rankAtom ranks 2)) || ((rankAtom ranks 77).ult (rankAtom ranks 10)))) = true)
    (h3692 : ((!((rankAtom ranks 10 == rankAtom ranks 40)) || ((rankAtom ranks 11).ult (rankAtom ranks 41)))) = true)
    (h3693 : ((!((rankAtom ranks 41 == rankAtom ranks 40)) || ((rankAtom ranks 11).ult (rankAtom ranks 10)))) = true)
    (h3694 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 50).ult (rankAtom ranks 43)))) = true)
    (h3695 : ((!((rankAtom ranks 4 == rankAtom ranks 50)) || ((rankAtom ranks 3).ult (rankAtom ranks 43)))) = true)
    (h3696 : ((!((rankAtom ranks 43 == rankAtom ranks 3)) || ((rankAtom ranks 50).ult (rankAtom ranks 4)))) = true)
    (h3697 : ((!((rankAtom ranks 43 == rankAtom ranks 50)) || ((rankAtom ranks 3).ult (rankAtom ranks 4)))) = true)
    (h3698 : ((!((rankAtom ranks 4 == rankAtom ranks 5)) || ((rankAtom ranks 42).ult (rankAtom ranks 43)))) = true)
    (h3699 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 5).ult (rankAtom ranks 43)))) = true)
    (h3700 : ((!((rankAtom ranks 43 == rankAtom ranks 5)) || ((rankAtom ranks 42).ult (rankAtom ranks 4)))) = true)
    (h3701 : ((!((rankAtom ranks 43 == rankAtom ranks 42)) || ((rankAtom ranks 5).ult (rankAtom ranks 4)))) = true)
    (h3702 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 51).ult (rankAtom ranks 44)))) = true)
    (h3703 : ((!((rankAtom ranks 4 == rankAtom ranks 51)) || ((rankAtom ranks 3).ult (rankAtom ranks 44)))) = true)
    (h3704 : ((!((rankAtom ranks 44 == rankAtom ranks 3)) || ((rankAtom ranks 51).ult (rankAtom ranks 4)))) = true)
    (h3705 : ((!((rankAtom ranks 44 == rankAtom ranks 51)) || ((rankAtom ranks 3).ult (rankAtom ranks 4)))) = true)
    (h3706 : ((!((rankAtom ranks 4 == rankAtom ranks 6)) || ((rankAtom ranks 42).ult (rankAtom ranks 44)))) = true)
    (h3707 : ((!((rankAtom ranks 4 == rankAtom ranks 42)) || ((rankAtom ranks 6).ult (rankAtom ranks 44)))) = true)
    (h3708 : ((!((rankAtom ranks 44 == rankAtom ranks 6)) || ((rankAtom ranks 42).ult (rankAtom ranks 4)))) = true)
    (h3709 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 6).ult (rankAtom ranks 4)))) = true)
    (h3710 : ((!((rankAtom ranks 4 == rankAtom ranks 3)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h3711 : ((!((rankAtom ranks 4 == rankAtom ranks 52)) || ((rankAtom ranks 3).ult (rankAtom ranks 45)))) = true) :
    ∀ item ∈ sourceChunk057Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk057Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3648
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3649
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3650
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3651
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3652
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3653
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3654
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3655
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3656
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3657
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3658
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3659
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3660
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3661
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3662
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3663
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3664
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3665
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3666
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3667
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3668
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3669
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3670
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3671
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3672
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3673
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3674
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3675
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3676
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3677
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3678
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3679
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3680
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3681
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3682
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3683
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3684
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3685
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3686
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3687
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3688
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3689
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3690
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3691
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3692
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3693
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3694
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3695
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3696
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3697
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3698
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3699
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3700
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3701
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3702
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3703
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3704
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3705
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3706
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3707
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3708
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3709
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3710
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h3711

end Problem97.ATailExactFiveCard13AllOneCertificate.Middle
