/-
Generated packed-source bridge for verified right chunk 079.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk079_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5056 : ((!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 19).ult (rankAtom ranks 59)))) = true)
    (h5057 : ((!((rankAtom ranks 59 == rankAtom ranks 19)) || ((rankAtom ranks 58).ult (rankAtom ranks 18)))) = true)
    (h5058 : ((!((rankAtom ranks 59 == rankAtom ranks 58)) || ((rankAtom ranks 19).ult (rankAtom ranks 18)))) = true)
    (h5059 : ((!((rankAtom ranks 18 == rankAtom ranks 16)) || ((rankAtom ranks 69).ult (rankAtom ranks 60)))) = true)
    (h5060 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 16).ult (rankAtom ranks 60)))) = true)
    (h5061 : ((!((rankAtom ranks 60 == rankAtom ranks 16)) || ((rankAtom ranks 69).ult (rankAtom ranks 18)))) = true)
    (h5062 : ((!((rankAtom ranks 60 == rankAtom ranks 69)) || ((rankAtom ranks 16).ult (rankAtom ranks 18)))) = true)
    (h5063 : ((!((rankAtom ranks 18 == rankAtom ranks 20)) || ((rankAtom ranks 58).ult (rankAtom ranks 60)))) = true)
    (h5064 : ((!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 20).ult (rankAtom ranks 60)))) = true)
    (h5065 : ((!((rankAtom ranks 60 == rankAtom ranks 20)) || ((rankAtom ranks 58).ult (rankAtom ranks 18)))) = true)
    (h5066 : ((!((rankAtom ranks 60 == rankAtom ranks 58)) || ((rankAtom ranks 20).ult (rankAtom ranks 18)))) = true)
    (h5067 : ((!((rankAtom ranks 18 == rankAtom ranks 16)) || ((rankAtom ranks 70).ult (rankAtom ranks 61)))) = true)
    (h5068 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 16).ult (rankAtom ranks 61)))) = true)
    (h5069 : ((!((rankAtom ranks 61 == rankAtom ranks 16)) || ((rankAtom ranks 70).ult (rankAtom ranks 18)))) = true)
    (h5070 : ((!((rankAtom ranks 61 == rankAtom ranks 70)) || ((rankAtom ranks 16).ult (rankAtom ranks 18)))) = true)
    (h5071 : ((!((rankAtom ranks 18 == rankAtom ranks 21)) || ((rankAtom ranks 58).ult (rankAtom ranks 61)))) = true)
    (h5072 : ((!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 21).ult (rankAtom ranks 61)))) = true)
    (h5073 : ((!((rankAtom ranks 61 == rankAtom ranks 21)) || ((rankAtom ranks 58).ult (rankAtom ranks 18)))) = true)
    (h5074 : ((!((rankAtom ranks 61 == rankAtom ranks 58)) || ((rankAtom ranks 21).ult (rankAtom ranks 18)))) = true)
    (h5075 : ((!((rankAtom ranks 18 == rankAtom ranks 16)) || ((rankAtom ranks 71).ult (rankAtom ranks 62)))) = true)
    (h5076 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 16).ult (rankAtom ranks 62)))) = true)
    (h5077 : ((!((rankAtom ranks 62 == rankAtom ranks 16)) || ((rankAtom ranks 71).ult (rankAtom ranks 18)))) = true)
    (h5078 : ((!((rankAtom ranks 18 == rankAtom ranks 22)) || ((rankAtom ranks 58).ult (rankAtom ranks 62)))) = true)
    (h5079 : ((!((rankAtom ranks 18 == rankAtom ranks 58)) || ((rankAtom ranks 22).ult (rankAtom ranks 62)))) = true)
    (h5080 : ((!((rankAtom ranks 62 == rankAtom ranks 58)) || ((rankAtom ranks 22).ult (rankAtom ranks 18)))) = true)
    (h5081 : ((!((rankAtom ranks 19 == rankAtom ranks 16)) || ((rankAtom ranks 72).ult (rankAtom ranks 60)))) = true)
    (h5082 : ((!((rankAtom ranks 19 == rankAtom ranks 72)) || ((rankAtom ranks 16).ult (rankAtom ranks 60)))) = true)
    (h5083 : ((!((rankAtom ranks 60 == rankAtom ranks 16)) || ((rankAtom ranks 72).ult (rankAtom ranks 19)))) = true)
    (h5084 : ((!((rankAtom ranks 60 == rankAtom ranks 72)) || ((rankAtom ranks 16).ult (rankAtom ranks 19)))) = true)
    (h5085 : ((!((rankAtom ranks 19 == rankAtom ranks 20)) || ((rankAtom ranks 59).ult (rankAtom ranks 60)))) = true)
    (h5086 : ((!((rankAtom ranks 19 == rankAtom ranks 59)) || ((rankAtom ranks 20).ult (rankAtom ranks 60)))) = true)
    (h5087 : ((!((rankAtom ranks 60 == rankAtom ranks 20)) || ((rankAtom ranks 59).ult (rankAtom ranks 19)))) = true)
    (h5088 : ((!((rankAtom ranks 60 == rankAtom ranks 59)) || ((rankAtom ranks 20).ult (rankAtom ranks 19)))) = true)
    (h5089 : ((!((rankAtom ranks 19 == rankAtom ranks 16)) || ((rankAtom ranks 73).ult (rankAtom ranks 61)))) = true)
    (h5090 : ((!((rankAtom ranks 19 == rankAtom ranks 73)) || ((rankAtom ranks 16).ult (rankAtom ranks 61)))) = true)
    (h5091 : ((!((rankAtom ranks 61 == rankAtom ranks 16)) || ((rankAtom ranks 73).ult (rankAtom ranks 19)))) = true)
    (h5092 : ((!((rankAtom ranks 61 == rankAtom ranks 73)) || ((rankAtom ranks 16).ult (rankAtom ranks 19)))) = true)
    (h5093 : ((!((rankAtom ranks 19 == rankAtom ranks 21)) || ((rankAtom ranks 59).ult (rankAtom ranks 61)))) = true)
    (h5094 : ((!((rankAtom ranks 19 == rankAtom ranks 59)) || ((rankAtom ranks 21).ult (rankAtom ranks 61)))) = true)
    (h5095 : ((!((rankAtom ranks 61 == rankAtom ranks 21)) || ((rankAtom ranks 59).ult (rankAtom ranks 19)))) = true)
    (h5096 : ((!((rankAtom ranks 61 == rankAtom ranks 59)) || ((rankAtom ranks 21).ult (rankAtom ranks 19)))) = true)
    (h5097 : ((!((rankAtom ranks 19 == rankAtom ranks 16)) || ((rankAtom ranks 74).ult (rankAtom ranks 62)))) = true)
    (h5098 : ((!((rankAtom ranks 19 == rankAtom ranks 74)) || ((rankAtom ranks 16).ult (rankAtom ranks 62)))) = true)
    (h5099 : ((!((rankAtom ranks 62 == rankAtom ranks 16)) || ((rankAtom ranks 74).ult (rankAtom ranks 19)))) = true)
    (h5100 : ((!((rankAtom ranks 19 == rankAtom ranks 22)) || ((rankAtom ranks 59).ult (rankAtom ranks 62)))) = true)
    (h5101 : ((!((rankAtom ranks 19 == rankAtom ranks 59)) || ((rankAtom ranks 22).ult (rankAtom ranks 62)))) = true)
    (h5102 : ((!((rankAtom ranks 62 == rankAtom ranks 59)) || ((rankAtom ranks 22).ult (rankAtom ranks 19)))) = true)
    (h5103 : ((!((rankAtom ranks 20 == rankAtom ranks 16)) || ((rankAtom ranks 75).ult (rankAtom ranks 61)))) = true)
    (h5104 : ((!((rankAtom ranks 20 == rankAtom ranks 75)) || ((rankAtom ranks 16).ult (rankAtom ranks 61)))) = true)
    (h5105 : ((!((rankAtom ranks 61 == rankAtom ranks 16)) || ((rankAtom ranks 75).ult (rankAtom ranks 20)))) = true)
    (h5106 : ((!((rankAtom ranks 61 == rankAtom ranks 75)) || ((rankAtom ranks 16).ult (rankAtom ranks 20)))) = true)
    (h5107 : ((!((rankAtom ranks 20 == rankAtom ranks 21)) || ((rankAtom ranks 60).ult (rankAtom ranks 61)))) = true)
    (h5108 : ((!((rankAtom ranks 20 == rankAtom ranks 60)) || ((rankAtom ranks 21).ult (rankAtom ranks 61)))) = true)
    (h5109 : ((!((rankAtom ranks 61 == rankAtom ranks 21)) || ((rankAtom ranks 60).ult (rankAtom ranks 20)))) = true)
    (h5110 : ((!((rankAtom ranks 61 == rankAtom ranks 60)) || ((rankAtom ranks 21).ult (rankAtom ranks 20)))) = true)
    (h5111 : ((!((rankAtom ranks 20 == rankAtom ranks 16)) || ((rankAtom ranks 76).ult (rankAtom ranks 62)))) = true)
    (h5112 : ((!((rankAtom ranks 20 == rankAtom ranks 76)) || ((rankAtom ranks 16).ult (rankAtom ranks 62)))) = true)
    (h5113 : ((!((rankAtom ranks 62 == rankAtom ranks 16)) || ((rankAtom ranks 76).ult (rankAtom ranks 20)))) = true)
    (h5114 : ((!((rankAtom ranks 20 == rankAtom ranks 22)) || ((rankAtom ranks 60).ult (rankAtom ranks 62)))) = true)
    (h5115 : ((!((rankAtom ranks 20 == rankAtom ranks 60)) || ((rankAtom ranks 22).ult (rankAtom ranks 62)))) = true)
    (h5116 : ((!((rankAtom ranks 62 == rankAtom ranks 60)) || ((rankAtom ranks 22).ult (rankAtom ranks 20)))) = true)
    (h5117 : ((!((rankAtom ranks 21 == rankAtom ranks 16)) || ((rankAtom ranks 77).ult (rankAtom ranks 62)))) = true)
    (h5118 : ((!((rankAtom ranks 21 == rankAtom ranks 77)) || ((rankAtom ranks 16).ult (rankAtom ranks 62)))) = true)
    (h5119 : ((!((rankAtom ranks 62 == rankAtom ranks 16)) || ((rankAtom ranks 77).ult (rankAtom ranks 21)))) = true) :
    ∀ item ∈ sourceChunk079Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk079Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5056
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5057
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5058
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5059
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5060
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5061
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5062
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5063
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5064
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5065
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5066
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5067
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5068
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5069
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5070
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5071
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5072
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5073
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5074
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5075
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5076
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5077
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5078
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5079
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5080
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5081
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5082
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5083
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5084
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5085
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5086
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5087
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5088
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5089
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5090
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5091
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5092
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5093
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5094
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5095
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5096
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5097
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5098
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5099
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5100
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5101
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5102
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5103
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5104
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5105
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5106
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5107
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5108
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5109
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5110
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5111
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5112
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5113
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5114
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5115
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5116
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5117
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5118
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5119

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
