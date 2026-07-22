/-
Generated packed-source bridge for verified left chunk 095.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk095_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6080 : ((!((rankAtom ranks 37 == rankAtom ranks 33)) || ((rankAtom ranks 70).ult (rankAtom ranks 48)))) = true)
    (h6081 : ((!((rankAtom ranks 37 == rankAtom ranks 70)) || ((rankAtom ranks 33).ult (rankAtom ranks 48)))) = true)
    (h6082 : ((!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 70).ult (rankAtom ranks 37)))) = true)
    (h6083 : ((!((rankAtom ranks 48 == rankAtom ranks 70)) || ((rankAtom ranks 33).ult (rankAtom ranks 37)))) = true)
    (h6084 : ((!((rankAtom ranks 37 == rankAtom ranks 40)) || ((rankAtom ranks 45).ult (rankAtom ranks 48)))) = true)
    (h6085 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 40).ult (rankAtom ranks 48)))) = true)
    (h6086 : ((!((rankAtom ranks 48 == rankAtom ranks 40)) || ((rankAtom ranks 45).ult (rankAtom ranks 37)))) = true)
    (h6087 : ((!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 40).ult (rankAtom ranks 37)))) = true)
    (h6088 : ((!((rankAtom ranks 37 == rankAtom ranks 33)) || ((rankAtom ranks 71).ult (rankAtom ranks 49)))) = true)
    (h6089 : ((!((rankAtom ranks 37 == rankAtom ranks 71)) || ((rankAtom ranks 33).ult (rankAtom ranks 49)))) = true)
    (h6090 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 71).ult (rankAtom ranks 37)))) = true)
    (h6091 : ((!((rankAtom ranks 37 == rankAtom ranks 45)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h6092 : ((!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 41).ult (rankAtom ranks 37)))) = true)
    (h6093 : ((!((rankAtom ranks 38 == rankAtom ranks 33)) || ((rankAtom ranks 72).ult (rankAtom ranks 47)))) = true)
    (h6094 : ((!((rankAtom ranks 38 == rankAtom ranks 72)) || ((rankAtom ranks 33).ult (rankAtom ranks 47)))) = true)
    (h6095 : ((!((rankAtom ranks 47 == rankAtom ranks 33)) || ((rankAtom ranks 72).ult (rankAtom ranks 38)))) = true)
    (h6096 : ((!((rankAtom ranks 38 == rankAtom ranks 39)) || ((rankAtom ranks 46).ult (rankAtom ranks 47)))) = true)
    (h6097 : ((!((rankAtom ranks 38 == rankAtom ranks 46)) || ((rankAtom ranks 39).ult (rankAtom ranks 47)))) = true)
    (h6098 : ((!((rankAtom ranks 47 == rankAtom ranks 39)) || ((rankAtom ranks 46).ult (rankAtom ranks 38)))) = true)
    (h6099 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 39).ult (rankAtom ranks 38)))) = true)
    (h6100 : ((!((rankAtom ranks 38 == rankAtom ranks 33)) || ((rankAtom ranks 73).ult (rankAtom ranks 48)))) = true)
    (h6101 : ((!((rankAtom ranks 38 == rankAtom ranks 73)) || ((rankAtom ranks 33).ult (rankAtom ranks 48)))) = true)
    (h6102 : ((!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 73).ult (rankAtom ranks 38)))) = true)
    (h6103 : ((!((rankAtom ranks 38 == rankAtom ranks 40)) || ((rankAtom ranks 46).ult (rankAtom ranks 48)))) = true)
    (h6104 : ((!((rankAtom ranks 38 == rankAtom ranks 46)) || ((rankAtom ranks 40).ult (rankAtom ranks 48)))) = true)
    (h6105 : ((!((rankAtom ranks 48 == rankAtom ranks 40)) || ((rankAtom ranks 46).ult (rankAtom ranks 38)))) = true)
    (h6106 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 40).ult (rankAtom ranks 38)))) = true)
    (h6107 : ((!((rankAtom ranks 38 == rankAtom ranks 74)) || ((rankAtom ranks 33).ult (rankAtom ranks 49)))) = true)
    (h6108 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 74).ult (rankAtom ranks 38)))) = true)
    (h6109 : ((!((rankAtom ranks 38 == rankAtom ranks 41)) || ((rankAtom ranks 46).ult (rankAtom ranks 49)))) = true)
    (h6110 : ((!((rankAtom ranks 38 == rankAtom ranks 46)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h6111 : ((!((rankAtom ranks 49 == rankAtom ranks 46)) || ((rankAtom ranks 41).ult (rankAtom ranks 38)))) = true)
    (h6112 : ((!((rankAtom ranks 39 == rankAtom ranks 75)) || ((rankAtom ranks 33).ult (rankAtom ranks 48)))) = true)
    (h6113 : ((!((rankAtom ranks 48 == rankAtom ranks 33)) || ((rankAtom ranks 75).ult (rankAtom ranks 39)))) = true)
    (h6114 : ((!((rankAtom ranks 39 == rankAtom ranks 40)) || ((rankAtom ranks 47).ult (rankAtom ranks 48)))) = true)
    (h6115 : ((!((rankAtom ranks 39 == rankAtom ranks 47)) || ((rankAtom ranks 40).ult (rankAtom ranks 48)))) = true)
    (h6116 : ((!((rankAtom ranks 48 == rankAtom ranks 40)) || ((rankAtom ranks 47).ult (rankAtom ranks 39)))) = true)
    (h6117 : ((!((rankAtom ranks 48 == rankAtom ranks 47)) || ((rankAtom ranks 40).ult (rankAtom ranks 39)))) = true)
    (h6118 : ((!((rankAtom ranks 39 == rankAtom ranks 76)) || ((rankAtom ranks 33).ult (rankAtom ranks 49)))) = true)
    (h6119 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 76).ult (rankAtom ranks 39)))) = true)
    (h6120 : ((!((rankAtom ranks 39 == rankAtom ranks 41)) || ((rankAtom ranks 47).ult (rankAtom ranks 49)))) = true)
    (h6121 : ((!((rankAtom ranks 39 == rankAtom ranks 47)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h6122 : ((!((rankAtom ranks 49 == rankAtom ranks 47)) || ((rankAtom ranks 41).ult (rankAtom ranks 39)))) = true)
    (h6123 : ((!((rankAtom ranks 40 == rankAtom ranks 77)) || ((rankAtom ranks 33).ult (rankAtom ranks 49)))) = true)
    (h6124 : ((!((rankAtom ranks 49 == rankAtom ranks 33)) || ((rankAtom ranks 77).ult (rankAtom ranks 40)))) = true)
    (h6125 : ((!((rankAtom ranks 40 == rankAtom ranks 41)) || ((rankAtom ranks 48).ult (rankAtom ranks 49)))) = true)
    (h6126 : ((!((rankAtom ranks 40 == rankAtom ranks 48)) || ((rankAtom ranks 41).ult (rankAtom ranks 49)))) = true)
    (h6127 : ((!((rankAtom ranks 49 == rankAtom ranks 48)) || ((rankAtom ranks 41).ult (rankAtom ranks 40)))) = true)
    (h6128 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 57).ult (rankAtom ranks 51)))) = true)
    (h6129 : ((!((rankAtom ranks 51 == rankAtom ranks 34)) || ((rankAtom ranks 57).ult (rankAtom ranks 35)))) = true)
    (h6130 : ((!((rankAtom ranks 51 == rankAtom ranks 57)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h6131 : ((!((rankAtom ranks 35 == rankAtom ranks 36)) || ((rankAtom ranks 50).ult (rankAtom ranks 51)))) = true)
    (h6132 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 36).ult (rankAtom ranks 51)))) = true)
    (h6133 : ((!((rankAtom ranks 51 == rankAtom ranks 50)) || ((rankAtom ranks 36).ult (rankAtom ranks 35)))) = true)
    (h6134 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 58).ult (rankAtom ranks 52)))) = true)
    (h6135 : ((!((rankAtom ranks 35 == rankAtom ranks 58)) || ((rankAtom ranks 34).ult (rankAtom ranks 52)))) = true)
    (h6136 : ((!((rankAtom ranks 52 == rankAtom ranks 34)) || ((rankAtom ranks 58).ult (rankAtom ranks 35)))) = true)
    (h6137 : ((!((rankAtom ranks 35 == rankAtom ranks 37)) || ((rankAtom ranks 50).ult (rankAtom ranks 52)))) = true)
    (h6138 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 37).ult (rankAtom ranks 52)))) = true)
    (h6139 : ((!((rankAtom ranks 52 == rankAtom ranks 37)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h6140 : ((!((rankAtom ranks 52 == rankAtom ranks 50)) || ((rankAtom ranks 37).ult (rankAtom ranks 35)))) = true)
    (h6141 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 59).ult (rankAtom ranks 53)))) = true)
    (h6142 : ((!((rankAtom ranks 35 == rankAtom ranks 59)) || ((rankAtom ranks 34).ult (rankAtom ranks 53)))) = true)
    (h6143 : ((!((rankAtom ranks 53 == rankAtom ranks 34)) || ((rankAtom ranks 59).ult (rankAtom ranks 35)))) = true) :
    ∀ item ∈ sourceChunk095Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk095Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6080
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6081
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6082
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6083
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6084
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6085
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6086
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6087
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6088
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6089
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6090
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6091
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6092
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6093
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6094
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6095
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6096
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6097
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6098
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6099
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6100
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6101
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6102
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6103
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6104
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6105
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6106
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6107
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6108
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6109
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6110
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6111
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6112
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6113
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6114
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6115
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6116
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6117
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6118
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6119
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6120
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6121
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6122
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6123
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6124
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6125
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6126
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6127
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6128
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6129
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6130
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6131
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6132
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6133
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6134
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6135
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6136
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6137
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6138
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6139
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6140
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6141
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6142
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6143

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
