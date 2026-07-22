/-
Generated packed-source bridge for verified right chunk 089.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk089_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5696 : ((!((rankAtom ranks 29 == rankAtom ranks 72)) || ((rankAtom ranks 25).ult (rankAtom ranks 54)))) = true)
    (h5697 : ((!((rankAtom ranks 54 == rankAtom ranks 25)) || ((rankAtom ranks 72).ult (rankAtom ranks 29)))) = true)
    (h5698 : ((!((rankAtom ranks 54 == rankAtom ranks 72)) || ((rankAtom ranks 25).ult (rankAtom ranks 29)))) = true)
    (h5699 : ((!((rankAtom ranks 29 == rankAtom ranks 30)) || ((rankAtom ranks 53).ult (rankAtom ranks 54)))) = true)
    (h5700 : ((!((rankAtom ranks 29 == rankAtom ranks 53)) || ((rankAtom ranks 30).ult (rankAtom ranks 54)))) = true)
    (h5701 : ((!((rankAtom ranks 54 == rankAtom ranks 30)) || ((rankAtom ranks 53).ult (rankAtom ranks 29)))) = true)
    (h5702 : ((!((rankAtom ranks 54 == rankAtom ranks 53)) || ((rankAtom ranks 30).ult (rankAtom ranks 29)))) = true)
    (h5703 : ((!((rankAtom ranks 29 == rankAtom ranks 25)) || ((rankAtom ranks 73).ult (rankAtom ranks 55)))) = true)
    (h5704 : ((!((rankAtom ranks 29 == rankAtom ranks 73)) || ((rankAtom ranks 25).ult (rankAtom ranks 55)))) = true)
    (h5705 : ((!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 73).ult (rankAtom ranks 29)))) = true)
    (h5706 : ((!((rankAtom ranks 55 == rankAtom ranks 73)) || ((rankAtom ranks 25).ult (rankAtom ranks 29)))) = true)
    (h5707 : ((!((rankAtom ranks 29 == rankAtom ranks 31)) || ((rankAtom ranks 53).ult (rankAtom ranks 55)))) = true)
    (h5708 : ((!((rankAtom ranks 29 == rankAtom ranks 53)) || ((rankAtom ranks 31).ult (rankAtom ranks 55)))) = true)
    (h5709 : ((!((rankAtom ranks 55 == rankAtom ranks 31)) || ((rankAtom ranks 53).ult (rankAtom ranks 29)))) = true)
    (h5710 : ((!((rankAtom ranks 55 == rankAtom ranks 53)) || ((rankAtom ranks 31).ult (rankAtom ranks 29)))) = true)
    (h5711 : ((!((rankAtom ranks 29 == rankAtom ranks 25)) || ((rankAtom ranks 74).ult (rankAtom ranks 56)))) = true)
    (h5712 : ((!((rankAtom ranks 29 == rankAtom ranks 74)) || ((rankAtom ranks 25).ult (rankAtom ranks 56)))) = true)
    (h5713 : ((!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 74).ult (rankAtom ranks 29)))) = true)
    (h5714 : ((!((rankAtom ranks 29 == rankAtom ranks 32)) || ((rankAtom ranks 53).ult (rankAtom ranks 56)))) = true)
    (h5715 : ((!((rankAtom ranks 29 == rankAtom ranks 53)) || ((rankAtom ranks 32).ult (rankAtom ranks 56)))) = true)
    (h5716 : ((!((rankAtom ranks 56 == rankAtom ranks 53)) || ((rankAtom ranks 32).ult (rankAtom ranks 29)))) = true)
    (h5717 : ((!((rankAtom ranks 30 == rankAtom ranks 25)) || ((rankAtom ranks 75).ult (rankAtom ranks 55)))) = true)
    (h5718 : ((!((rankAtom ranks 30 == rankAtom ranks 75)) || ((rankAtom ranks 25).ult (rankAtom ranks 55)))) = true)
    (h5719 : ((!((rankAtom ranks 55 == rankAtom ranks 25)) || ((rankAtom ranks 75).ult (rankAtom ranks 30)))) = true)
    (h5720 : ((!((rankAtom ranks 55 == rankAtom ranks 75)) || ((rankAtom ranks 25).ult (rankAtom ranks 30)))) = true)
    (h5721 : ((!((rankAtom ranks 30 == rankAtom ranks 31)) || ((rankAtom ranks 54).ult (rankAtom ranks 55)))) = true)
    (h5722 : ((!((rankAtom ranks 30 == rankAtom ranks 54)) || ((rankAtom ranks 31).ult (rankAtom ranks 55)))) = true)
    (h5723 : ((!((rankAtom ranks 55 == rankAtom ranks 31)) || ((rankAtom ranks 54).ult (rankAtom ranks 30)))) = true)
    (h5724 : ((!((rankAtom ranks 55 == rankAtom ranks 54)) || ((rankAtom ranks 31).ult (rankAtom ranks 30)))) = true)
    (h5725 : ((!((rankAtom ranks 30 == rankAtom ranks 25)) || ((rankAtom ranks 76).ult (rankAtom ranks 56)))) = true)
    (h5726 : ((!((rankAtom ranks 30 == rankAtom ranks 76)) || ((rankAtom ranks 25).ult (rankAtom ranks 56)))) = true)
    (h5727 : ((!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 76).ult (rankAtom ranks 30)))) = true)
    (h5728 : ((!((rankAtom ranks 30 == rankAtom ranks 32)) || ((rankAtom ranks 54).ult (rankAtom ranks 56)))) = true)
    (h5729 : ((!((rankAtom ranks 30 == rankAtom ranks 54)) || ((rankAtom ranks 32).ult (rankAtom ranks 56)))) = true)
    (h5730 : ((!((rankAtom ranks 56 == rankAtom ranks 54)) || ((rankAtom ranks 32).ult (rankAtom ranks 30)))) = true)
    (h5731 : ((!((rankAtom ranks 31 == rankAtom ranks 25)) || ((rankAtom ranks 77).ult (rankAtom ranks 56)))) = true)
    (h5732 : ((!((rankAtom ranks 31 == rankAtom ranks 77)) || ((rankAtom ranks 25).ult (rankAtom ranks 56)))) = true)
    (h5733 : ((!((rankAtom ranks 56 == rankAtom ranks 25)) || ((rankAtom ranks 77).ult (rankAtom ranks 31)))) = true)
    (h5734 : ((!((rankAtom ranks 31 == rankAtom ranks 32)) || ((rankAtom ranks 55).ult (rankAtom ranks 56)))) = true)
    (h5735 : ((!((rankAtom ranks 31 == rankAtom ranks 55)) || ((rankAtom ranks 32).ult (rankAtom ranks 56)))) = true)
    (h5736 : ((!((rankAtom ranks 56 == rankAtom ranks 55)) || ((rankAtom ranks 32).ult (rankAtom ranks 31)))) = true)
    (h5737 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 63).ult (rankAtom ranks 58)))) = true)
    (h5738 : ((!((rankAtom ranks 27 == rankAtom ranks 63)) || ((rankAtom ranks 26).ult (rankAtom ranks 58)))) = true)
    (h5739 : ((!((rankAtom ranks 58 == rankAtom ranks 26)) || ((rankAtom ranks 63).ult (rankAtom ranks 27)))) = true)
    (h5740 : ((!((rankAtom ranks 27 == rankAtom ranks 28)) || ((rankAtom ranks 57).ult (rankAtom ranks 58)))) = true)
    (h5741 : ((!((rankAtom ranks 27 == rankAtom ranks 57)) || ((rankAtom ranks 28).ult (rankAtom ranks 58)))) = true)
    (h5742 : ((!((rankAtom ranks 58 == rankAtom ranks 28)) || ((rankAtom ranks 57).ult (rankAtom ranks 27)))) = true)
    (h5743 : ((!((rankAtom ranks 58 == rankAtom ranks 57)) || ((rankAtom ranks 28).ult (rankAtom ranks 27)))) = true)
    (h5744 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 64).ult (rankAtom ranks 59)))) = true)
    (h5745 : ((!((rankAtom ranks 27 == rankAtom ranks 64)) || ((rankAtom ranks 26).ult (rankAtom ranks 59)))) = true)
    (h5746 : ((!((rankAtom ranks 59 == rankAtom ranks 26)) || ((rankAtom ranks 64).ult (rankAtom ranks 27)))) = true)
    (h5747 : ((!((rankAtom ranks 59 == rankAtom ranks 64)) || ((rankAtom ranks 26).ult (rankAtom ranks 27)))) = true)
    (h5748 : ((!((rankAtom ranks 27 == rankAtom ranks 29)) || ((rankAtom ranks 57).ult (rankAtom ranks 59)))) = true)
    (h5749 : ((!((rankAtom ranks 59 == rankAtom ranks 29)) || ((rankAtom ranks 57).ult (rankAtom ranks 27)))) = true)
    (h5750 : ((!((rankAtom ranks 59 == rankAtom ranks 57)) || ((rankAtom ranks 29).ult (rankAtom ranks 27)))) = true)
    (h5751 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 65).ult (rankAtom ranks 60)))) = true)
    (h5752 : ((!((rankAtom ranks 27 == rankAtom ranks 65)) || ((rankAtom ranks 26).ult (rankAtom ranks 60)))) = true)
    (h5753 : ((!((rankAtom ranks 60 == rankAtom ranks 26)) || ((rankAtom ranks 65).ult (rankAtom ranks 27)))) = true)
    (h5754 : ((!((rankAtom ranks 60 == rankAtom ranks 65)) || ((rankAtom ranks 26).ult (rankAtom ranks 27)))) = true)
    (h5755 : ((!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 57).ult (rankAtom ranks 60)))) = true)
    (h5756 : ((!((rankAtom ranks 60 == rankAtom ranks 30)) || ((rankAtom ranks 57).ult (rankAtom ranks 27)))) = true)
    (h5757 : ((!((rankAtom ranks 60 == rankAtom ranks 57)) || ((rankAtom ranks 30).ult (rankAtom ranks 27)))) = true)
    (h5758 : ((!((rankAtom ranks 27 == rankAtom ranks 26)) || ((rankAtom ranks 66).ult (rankAtom ranks 61)))) = true)
    (h5759 : ((!((rankAtom ranks 61 == rankAtom ranks 26)) || ((rankAtom ranks 66).ult (rankAtom ranks 27)))) = true) :
    ∀ item ∈ sourceChunk089Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk089Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5696
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5697
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5698
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5699
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5700
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5701
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5702
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5703
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5704
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5705
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5706
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5707
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5708
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5709
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5710
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5711
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5712
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5713
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5714
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5715
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5716
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5717
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5718
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5719
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5720
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5721
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5722
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5723
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5724
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5725
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5726
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5727
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5728
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5729
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5730
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5731
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5732
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5733
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5734
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5735
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5736
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5737
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5738
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5739
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5740
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5741
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5742
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5743
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5744
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5745
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5746
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5747
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5748
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5749
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5750
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5751
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5752
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5753
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5754
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5755
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5756
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5757
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5758
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5759

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
