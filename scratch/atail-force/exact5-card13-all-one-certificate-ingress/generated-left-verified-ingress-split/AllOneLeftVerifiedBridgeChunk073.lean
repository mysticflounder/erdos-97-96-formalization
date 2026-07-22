/-
Generated packed-source bridge for verified left chunk 073.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk073_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4672 : ((!((rankAtom ranks 15 == rankAtom ranks 14)) || ((rankAtom ranks 51).ult (rankAtom ranks 44)))) = true)
    (h4673 : ((!((rankAtom ranks 15 == rankAtom ranks 51)) || ((rankAtom ranks 14).ult (rankAtom ranks 44)))) = true)
    (h4674 : ((!((rankAtom ranks 44 == rankAtom ranks 14)) || ((rankAtom ranks 51).ult (rankAtom ranks 15)))) = true)
    (h4675 : ((!((rankAtom ranks 44 == rankAtom ranks 51)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h4676 : ((!((rankAtom ranks 15 == rankAtom ranks 17)) || ((rankAtom ranks 42).ult (rankAtom ranks 44)))) = true)
    (h4677 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 17).ult (rankAtom ranks 44)))) = true)
    (h4678 : ((!((rankAtom ranks 44 == rankAtom ranks 42)) || ((rankAtom ranks 17).ult (rankAtom ranks 15)))) = true)
    (h4679 : ((!((rankAtom ranks 15 == rankAtom ranks 14)) || ((rankAtom ranks 52).ult (rankAtom ranks 45)))) = true)
    (h4680 : ((!((rankAtom ranks 15 == rankAtom ranks 52)) || ((rankAtom ranks 14).ult (rankAtom ranks 45)))) = true)
    (h4681 : ((!((rankAtom ranks 45 == rankAtom ranks 14)) || ((rankAtom ranks 52).ult (rankAtom ranks 15)))) = true)
    (h4682 : ((!((rankAtom ranks 45 == rankAtom ranks 52)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h4683 : ((!((rankAtom ranks 15 == rankAtom ranks 18)) || ((rankAtom ranks 42).ult (rankAtom ranks 45)))) = true)
    (h4684 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 18).ult (rankAtom ranks 45)))) = true)
    (h4685 : ((!((rankAtom ranks 45 == rankAtom ranks 18)) || ((rankAtom ranks 42).ult (rankAtom ranks 15)))) = true)
    (h4686 : ((!((rankAtom ranks 45 == rankAtom ranks 42)) || ((rankAtom ranks 18).ult (rankAtom ranks 15)))) = true)
    (h4687 : ((!((rankAtom ranks 15 == rankAtom ranks 14)) || ((rankAtom ranks 53).ult (rankAtom ranks 46)))) = true)
    (h4688 : ((!((rankAtom ranks 15 == rankAtom ranks 53)) || ((rankAtom ranks 14).ult (rankAtom ranks 46)))) = true)
    (h4689 : ((!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 53).ult (rankAtom ranks 15)))) = true)
    (h4690 : ((!((rankAtom ranks 46 == rankAtom ranks 53)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h4691 : ((!((rankAtom ranks 15 == rankAtom ranks 19)) || ((rankAtom ranks 42).ult (rankAtom ranks 46)))) = true)
    (h4692 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 19).ult (rankAtom ranks 46)))) = true)
    (h4693 : ((!((rankAtom ranks 46 == rankAtom ranks 19)) || ((rankAtom ranks 42).ult (rankAtom ranks 15)))) = true)
    (h4694 : ((!((rankAtom ranks 46 == rankAtom ranks 42)) || ((rankAtom ranks 19).ult (rankAtom ranks 15)))) = true)
    (h4695 : ((!((rankAtom ranks 15 == rankAtom ranks 14)) || ((rankAtom ranks 54).ult (rankAtom ranks 47)))) = true)
    (h4696 : ((!((rankAtom ranks 15 == rankAtom ranks 54)) || ((rankAtom ranks 14).ult (rankAtom ranks 47)))) = true)
    (h4697 : ((!((rankAtom ranks 47 == rankAtom ranks 14)) || ((rankAtom ranks 54).ult (rankAtom ranks 15)))) = true)
    (h4698 : ((!((rankAtom ranks 47 == rankAtom ranks 54)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h4699 : ((!((rankAtom ranks 15 == rankAtom ranks 20)) || ((rankAtom ranks 42).ult (rankAtom ranks 47)))) = true)
    (h4700 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 20).ult (rankAtom ranks 47)))) = true)
    (h4701 : ((!((rankAtom ranks 47 == rankAtom ranks 20)) || ((rankAtom ranks 42).ult (rankAtom ranks 15)))) = true)
    (h4702 : ((!((rankAtom ranks 47 == rankAtom ranks 42)) || ((rankAtom ranks 20).ult (rankAtom ranks 15)))) = true)
    (h4703 : ((!((rankAtom ranks 15 == rankAtom ranks 14)) || ((rankAtom ranks 55).ult (rankAtom ranks 48)))) = true)
    (h4704 : ((!((rankAtom ranks 15 == rankAtom ranks 55)) || ((rankAtom ranks 14).ult (rankAtom ranks 48)))) = true)
    (h4705 : ((!((rankAtom ranks 48 == rankAtom ranks 14)) || ((rankAtom ranks 55).ult (rankAtom ranks 15)))) = true)
    (h4706 : ((!((rankAtom ranks 48 == rankAtom ranks 55)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h4707 : ((!((rankAtom ranks 15 == rankAtom ranks 21)) || ((rankAtom ranks 42).ult (rankAtom ranks 48)))) = true)
    (h4708 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 21).ult (rankAtom ranks 48)))) = true)
    (h4709 : ((!((rankAtom ranks 48 == rankAtom ranks 21)) || ((rankAtom ranks 42).ult (rankAtom ranks 15)))) = true)
    (h4710 : ((!((rankAtom ranks 48 == rankAtom ranks 42)) || ((rankAtom ranks 21).ult (rankAtom ranks 15)))) = true)
    (h4711 : ((!((rankAtom ranks 15 == rankAtom ranks 14)) || ((rankAtom ranks 56).ult (rankAtom ranks 49)))) = true)
    (h4712 : ((!((rankAtom ranks 15 == rankAtom ranks 56)) || ((rankAtom ranks 14).ult (rankAtom ranks 49)))) = true)
    (h4713 : ((!((rankAtom ranks 49 == rankAtom ranks 14)) || ((rankAtom ranks 56).ult (rankAtom ranks 15)))) = true)
    (h4714 : ((!((rankAtom ranks 49 == rankAtom ranks 56)) || ((rankAtom ranks 14).ult (rankAtom ranks 15)))) = true)
    (h4715 : ((!((rankAtom ranks 15 == rankAtom ranks 22)) || ((rankAtom ranks 42).ult (rankAtom ranks 49)))) = true)
    (h4716 : ((!((rankAtom ranks 15 == rankAtom ranks 42)) || ((rankAtom ranks 22).ult (rankAtom ranks 49)))) = true)
    (h4717 : ((!((rankAtom ranks 49 == rankAtom ranks 42)) || ((rankAtom ranks 22).ult (rankAtom ranks 15)))) = true)
    (h4718 : ((!((rankAtom ranks 16 == rankAtom ranks 14)) || ((rankAtom ranks 57).ult (rankAtom ranks 44)))) = true)
    (h4719 : ((!((rankAtom ranks 16 == rankAtom ranks 57)) || ((rankAtom ranks 14).ult (rankAtom ranks 44)))) = true)
    (h4720 : ((!((rankAtom ranks 16 == rankAtom ranks 17)) || ((rankAtom ranks 43).ult (rankAtom ranks 44)))) = true)
    (h4721 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 17).ult (rankAtom ranks 44)))) = true)
    (h4722 : ((!((rankAtom ranks 44 == rankAtom ranks 43)) || ((rankAtom ranks 17).ult (rankAtom ranks 16)))) = true)
    (h4723 : ((!((rankAtom ranks 16 == rankAtom ranks 14)) || ((rankAtom ranks 58).ult (rankAtom ranks 45)))) = true)
    (h4724 : ((!((rankAtom ranks 16 == rankAtom ranks 58)) || ((rankAtom ranks 14).ult (rankAtom ranks 45)))) = true)
    (h4725 : ((!((rankAtom ranks 45 == rankAtom ranks 14)) || ((rankAtom ranks 58).ult (rankAtom ranks 16)))) = true)
    (h4726 : ((!((rankAtom ranks 45 == rankAtom ranks 58)) || ((rankAtom ranks 14).ult (rankAtom ranks 16)))) = true)
    (h4727 : ((!((rankAtom ranks 16 == rankAtom ranks 18)) || ((rankAtom ranks 43).ult (rankAtom ranks 45)))) = true)
    (h4728 : ((!((rankAtom ranks 16 == rankAtom ranks 43)) || ((rankAtom ranks 18).ult (rankAtom ranks 45)))) = true)
    (h4729 : ((!((rankAtom ranks 45 == rankAtom ranks 18)) || ((rankAtom ranks 43).ult (rankAtom ranks 16)))) = true)
    (h4730 : ((!((rankAtom ranks 45 == rankAtom ranks 43)) || ((rankAtom ranks 18).ult (rankAtom ranks 16)))) = true)
    (h4731 : ((!((rankAtom ranks 16 == rankAtom ranks 14)) || ((rankAtom ranks 59).ult (rankAtom ranks 46)))) = true)
    (h4732 : ((!((rankAtom ranks 16 == rankAtom ranks 59)) || ((rankAtom ranks 14).ult (rankAtom ranks 46)))) = true)
    (h4733 : ((!((rankAtom ranks 46 == rankAtom ranks 14)) || ((rankAtom ranks 59).ult (rankAtom ranks 16)))) = true)
    (h4734 : ((!((rankAtom ranks 46 == rankAtom ranks 59)) || ((rankAtom ranks 14).ult (rankAtom ranks 16)))) = true)
    (h4735 : ((!((rankAtom ranks 16 == rankAtom ranks 19)) || ((rankAtom ranks 43).ult (rankAtom ranks 46)))) = true) :
    ∀ item ∈ sourceChunk073Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk073Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4672
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4673
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4674
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4675
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4676
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4677
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4678
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4679
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4680
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4681
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4682
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4683
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4684
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4685
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4686
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4687
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4688
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4689
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4690
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4691
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4692
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4693
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4694
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4695
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4696
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4697
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4698
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4699
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4700
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4701
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4702
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4703
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4704
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4705
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4706
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4707
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4708
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4709
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4710
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4711
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4712
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4713
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4714
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4715
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4716
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4717
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4718
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4719
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4720
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4721
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4722
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4723
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4724
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4725
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4726
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4727
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4728
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4729
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4730
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4731
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4732
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4733
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4734
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4735

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
