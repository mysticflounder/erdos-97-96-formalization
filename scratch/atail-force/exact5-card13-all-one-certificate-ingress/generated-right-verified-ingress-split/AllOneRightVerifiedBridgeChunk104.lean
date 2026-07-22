/-
Generated packed-source bridge for verified right chunk 104.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk104_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6656 : ((!((rankAtom ranks 59 == rankAtom ranks 46)) || ((rankAtom ranks 58).ult (rankAtom ranks 45)))) = true)
    (h6657 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 46).ult (rankAtom ranks 45)))) = true)
    (h6658 : ((!((rankAtom ranks 45 == rankAtom ranks 43)) || ((rankAtom ranks 69).ult (rankAtom ranks 60)))) = true)
    (h6659 : ((!((rankAtom ranks 45 == rankAtom ranks 69)) || ((rankAtom ranks 43).ult (rankAtom ranks 60)))) = true)
    (h6660 : ((!((rankAtom ranks 60 == rankAtom ranks 43)) || ((rankAtom ranks 69).ult (rankAtom ranks 45)))) = true)
    (h6661 : ((!((rankAtom ranks 60 == rankAtom ranks 69)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h6662 : ((!((rankAtom ranks 45 == rankAtom ranks 47)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h6663 : ((!((rankAtom ranks 45 == rankAtom ranks 58)) || ((rankAtom ranks 47).ult (rankAtom ranks 60)))) = true)
    (h6664 : ((!((rankAtom ranks 60 == rankAtom ranks 47)) || ((rankAtom ranks 58).ult (rankAtom ranks 45)))) = true)
    (h6665 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 47).ult (rankAtom ranks 45)))) = true)
    (h6666 : ((!((rankAtom ranks 45 == rankAtom ranks 43)) || ((rankAtom ranks 70).ult (rankAtom ranks 61)))) = true)
    (h6667 : ((!((rankAtom ranks 45 == rankAtom ranks 70)) || ((rankAtom ranks 43).ult (rankAtom ranks 61)))) = true)
    (h6668 : ((!((rankAtom ranks 61 == rankAtom ranks 43)) || ((rankAtom ranks 70).ult (rankAtom ranks 45)))) = true)
    (h6669 : ((!((rankAtom ranks 61 == rankAtom ranks 70)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h6670 : ((!((rankAtom ranks 45 == rankAtom ranks 48)) || ((rankAtom ranks 58).ult (rankAtom ranks 61)))) = true)
    (h6671 : ((!((rankAtom ranks 45 == rankAtom ranks 58)) || ((rankAtom ranks 48).ult (rankAtom ranks 61)))) = true)
    (h6672 : ((!((rankAtom ranks 61 == rankAtom ranks 48)) || ((rankAtom ranks 58).ult (rankAtom ranks 45)))) = true)
    (h6673 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 48).ult (rankAtom ranks 45)))) = true)
    (h6674 : ((!((rankAtom ranks 45 == rankAtom ranks 43)) || ((rankAtom ranks 71).ult (rankAtom ranks 62)))) = true)
    (h6675 : ((!((rankAtom ranks 45 == rankAtom ranks 71)) || ((rankAtom ranks 43).ult (rankAtom ranks 62)))) = true)
    (h6676 : ((!((rankAtom ranks 62 == rankAtom ranks 43)) || ((rankAtom ranks 71).ult (rankAtom ranks 45)))) = true)
    (h6677 : ((!((rankAtom ranks 45 == rankAtom ranks 49)) || ((rankAtom ranks 58).ult (rankAtom ranks 62)))) = true)
    (h6678 : ((!((rankAtom ranks 45 == rankAtom ranks 58)) || ((rankAtom ranks 49).ult (rankAtom ranks 62)))) = true)
    (h6679 : ((!((rankAtom ranks 62 == rankAtom ranks 49)) || ((rankAtom ranks 58).ult (rankAtom ranks 45)))) = true)
    (h6680 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 49).ult (rankAtom ranks 45)))) = true)
    (h6681 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 72).ult (rankAtom ranks 60)))) = true)
    (h6682 : ((!((rankAtom ranks 46 == rankAtom ranks 72)) || ((rankAtom ranks 43).ult (rankAtom ranks 60)))) = true)
    (h6683 : ((!((rankAtom ranks 60 == rankAtom ranks 43)) || ((rankAtom ranks 72).ult (rankAtom ranks 46)))) = true)
    (h6684 : ((!((rankAtom ranks 60 == rankAtom ranks 72)) || ((rankAtom ranks 43).ult (rankAtom ranks 46)))) = true)
    (h6685 : ((!((rankAtom ranks 46 == rankAtom ranks 47)) || ((rankAtom ranks 59).ult (rankAtom ranks 60)))) = true)
    (h6686 : ((!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 47).ult (rankAtom ranks 60)))) = true)
    (h6687 : ((!((rankAtom ranks 60 == rankAtom ranks 47)) || ((rankAtom ranks 59).ult (rankAtom ranks 46)))) = true)
    (h6688 : ((!((rankAtom ranks 60 == rankAtom ranks 59)) || ((rankAtom ranks 47).ult (rankAtom ranks 46)))) = true)
    (h6689 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 73).ult (rankAtom ranks 61)))) = true)
    (h6690 : ((!((rankAtom ranks 46 == rankAtom ranks 73)) || ((rankAtom ranks 43).ult (rankAtom ranks 61)))) = true)
    (h6691 : ((!((rankAtom ranks 61 == rankAtom ranks 43)) || ((rankAtom ranks 73).ult (rankAtom ranks 46)))) = true)
    (h6692 : ((!((rankAtom ranks 61 == rankAtom ranks 73)) || ((rankAtom ranks 43).ult (rankAtom ranks 46)))) = true)
    (h6693 : ((!((rankAtom ranks 46 == rankAtom ranks 48)) || ((rankAtom ranks 59).ult (rankAtom ranks 61)))) = true)
    (h6694 : ((!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 48).ult (rankAtom ranks 61)))) = true)
    (h6695 : ((!((rankAtom ranks 61 == rankAtom ranks 48)) || ((rankAtom ranks 59).ult (rankAtom ranks 46)))) = true)
    (h6696 : ((!((rankAtom ranks 61 == rankAtom ranks 59)) || ((rankAtom ranks 48).ult (rankAtom ranks 46)))) = true)
    (h6697 : ((!((rankAtom ranks 46 == rankAtom ranks 43)) || ((rankAtom ranks 74).ult (rankAtom ranks 62)))) = true)
    (h6698 : ((!((rankAtom ranks 46 == rankAtom ranks 74)) || ((rankAtom ranks 43).ult (rankAtom ranks 62)))) = true)
    (h6699 : ((!((rankAtom ranks 62 == rankAtom ranks 43)) || ((rankAtom ranks 74).ult (rankAtom ranks 46)))) = true)
    (h6700 : ((!((rankAtom ranks 62 == rankAtom ranks 74)) || ((rankAtom ranks 43).ult (rankAtom ranks 46)))) = true)
    (h6701 : ((!((rankAtom ranks 46 == rankAtom ranks 49)) || ((rankAtom ranks 59).ult (rankAtom ranks 62)))) = true)
    (h6702 : ((!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 49).ult (rankAtom ranks 62)))) = true)
    (h6703 : ((!((rankAtom ranks 62 == rankAtom ranks 49)) || ((rankAtom ranks 59).ult (rankAtom ranks 46)))) = true)
    (h6704 : ((!((rankAtom ranks 62 == rankAtom ranks 59)) || ((rankAtom ranks 49).ult (rankAtom ranks 46)))) = true)
    (h6705 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 75).ult (rankAtom ranks 61)))) = true)
    (h6706 : ((!((rankAtom ranks 47 == rankAtom ranks 75)) || ((rankAtom ranks 43).ult (rankAtom ranks 61)))) = true)
    (h6707 : ((!((rankAtom ranks 61 == rankAtom ranks 43)) || ((rankAtom ranks 75).ult (rankAtom ranks 47)))) = true)
    (h6708 : ((!((rankAtom ranks 61 == rankAtom ranks 75)) || ((rankAtom ranks 43).ult (rankAtom ranks 47)))) = true)
    (h6709 : ((!((rankAtom ranks 47 == rankAtom ranks 48)) || ((rankAtom ranks 60).ult (rankAtom ranks 61)))) = true)
    (h6710 : ((!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 48).ult (rankAtom ranks 61)))) = true)
    (h6711 : ((!((rankAtom ranks 61 == rankAtom ranks 48)) || ((rankAtom ranks 60).ult (rankAtom ranks 47)))) = true)
    (h6712 : ((!((rankAtom ranks 61 == rankAtom ranks 60)) || ((rankAtom ranks 48).ult (rankAtom ranks 47)))) = true)
    (h6713 : ((!((rankAtom ranks 47 == rankAtom ranks 43)) || ((rankAtom ranks 76).ult (rankAtom ranks 62)))) = true)
    (h6714 : ((!((rankAtom ranks 47 == rankAtom ranks 76)) || ((rankAtom ranks 43).ult (rankAtom ranks 62)))) = true)
    (h6715 : ((!((rankAtom ranks 62 == rankAtom ranks 43)) || ((rankAtom ranks 76).ult (rankAtom ranks 47)))) = true)
    (h6716 : ((!((rankAtom ranks 62 == rankAtom ranks 76)) || ((rankAtom ranks 43).ult (rankAtom ranks 47)))) = true)
    (h6717 : ((!((rankAtom ranks 47 == rankAtom ranks 49)) || ((rankAtom ranks 60).ult (rankAtom ranks 62)))) = true)
    (h6718 : ((!((rankAtom ranks 47 == rankAtom ranks 60)) || ((rankAtom ranks 49).ult (rankAtom ranks 62)))) = true)
    (h6719 : ((!((rankAtom ranks 62 == rankAtom ranks 49)) || ((rankAtom ranks 60).ult (rankAtom ranks 47)))) = true) :
    ∀ item ∈ sourceChunk104Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk104Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6656
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6657
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6658
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6659
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6660
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6661
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6662
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6663
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6664
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6665
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6666
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6667
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6668
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6669
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6670
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6671
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6672
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6673
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6674
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6675
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6676
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6677
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6678
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6679
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6680
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6681
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6682
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6683
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6684
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6685
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6686
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6687
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6688
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6689
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6690
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6691
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6692
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6693
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6694
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6695
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6696
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6697
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6698
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6699
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6700
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6701
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6702
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6703
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6704
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6705
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6706
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6707
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6708
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6709
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6710
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6711
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6712
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6713
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6714
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6715
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6716
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6717
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6718
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6719

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
