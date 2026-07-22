/-
Generated packed-source bridge for verified right chunk 080.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk080_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5120 : ((!((rankAtom ranks 21 == rankAtom ranks 22)) || ((rankAtom ranks 61).ult (rankAtom ranks 62)))) = true)
    (h5121 : ((!((rankAtom ranks 21 == rankAtom ranks 61)) || ((rankAtom ranks 22).ult (rankAtom ranks 62)))) = true)
    (h5122 : ((!((rankAtom ranks 62 == rankAtom ranks 61)) || ((rankAtom ranks 22).ult (rankAtom ranks 21)))) = true)
    (h5123 : ((!((rankAtom ranks 18 == rankAtom ranks 17)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h5124 : ((!((rankAtom ranks 18 == rankAtom ranks 68)) || ((rankAtom ranks 17).ult (rankAtom ranks 64)))) = true)
    (h5125 : ((!((rankAtom ranks 64 == rankAtom ranks 17)) || ((rankAtom ranks 68).ult (rankAtom ranks 18)))) = true)
    (h5126 : ((!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 17).ult (rankAtom ranks 18)))) = true)
    (h5127 : ((!((rankAtom ranks 18 == rankAtom ranks 19)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h5128 : ((!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 19).ult (rankAtom ranks 64)))) = true)
    (h5129 : ((!((rankAtom ranks 64 == rankAtom ranks 19)) || ((rankAtom ranks 63).ult (rankAtom ranks 18)))) = true)
    (h5130 : ((!((rankAtom ranks 18 == rankAtom ranks 17)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h5131 : ((!((rankAtom ranks 18 == rankAtom ranks 69)) || ((rankAtom ranks 17).ult (rankAtom ranks 65)))) = true)
    (h5132 : ((!((rankAtom ranks 65 == rankAtom ranks 17)) || ((rankAtom ranks 69).ult (rankAtom ranks 18)))) = true)
    (h5133 : ((!((rankAtom ranks 65 == rankAtom ranks 69)) || ((rankAtom ranks 17).ult (rankAtom ranks 18)))) = true)
    (h5134 : ((!((rankAtom ranks 18 == rankAtom ranks 20)) || ((rankAtom ranks 63).ult (rankAtom ranks 65)))) = true)
    (h5135 : ((!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 20).ult (rankAtom ranks 65)))) = true)
    (h5136 : ((!((rankAtom ranks 18 == rankAtom ranks 17)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h5137 : ((!((rankAtom ranks 18 == rankAtom ranks 70)) || ((rankAtom ranks 17).ult (rankAtom ranks 66)))) = true)
    (h5138 : ((!((rankAtom ranks 66 == rankAtom ranks 17)) || ((rankAtom ranks 70).ult (rankAtom ranks 18)))) = true)
    (h5139 : ((!((rankAtom ranks 66 == rankAtom ranks 70)) || ((rankAtom ranks 17).ult (rankAtom ranks 18)))) = true)
    (h5140 : ((!((rankAtom ranks 18 == rankAtom ranks 21)) || ((rankAtom ranks 63).ult (rankAtom ranks 66)))) = true)
    (h5141 : ((!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 21).ult (rankAtom ranks 66)))) = true)
    (h5142 : ((!((rankAtom ranks 18 == rankAtom ranks 17)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h5143 : ((!((rankAtom ranks 18 == rankAtom ranks 71)) || ((rankAtom ranks 17).ult (rankAtom ranks 67)))) = true)
    (h5144 : ((!((rankAtom ranks 67 == rankAtom ranks 17)) || ((rankAtom ranks 71).ult (rankAtom ranks 18)))) = true)
    (h5145 : ((!((rankAtom ranks 18 == rankAtom ranks 22)) || ((rankAtom ranks 63).ult (rankAtom ranks 67)))) = true)
    (h5146 : ((!((rankAtom ranks 18 == rankAtom ranks 63)) || ((rankAtom ranks 22).ult (rankAtom ranks 67)))) = true)
    (h5147 : ((!((rankAtom ranks 19 == rankAtom ranks 17)) || ((rankAtom ranks 72).ult (rankAtom ranks 65)))) = true)
    (h5148 : ((!((rankAtom ranks 19 == rankAtom ranks 72)) || ((rankAtom ranks 17).ult (rankAtom ranks 65)))) = true)
    (h5149 : ((!((rankAtom ranks 65 == rankAtom ranks 72)) || ((rankAtom ranks 17).ult (rankAtom ranks 19)))) = true)
    (h5150 : ((!((rankAtom ranks 19 == rankAtom ranks 20)) || ((rankAtom ranks 64).ult (rankAtom ranks 65)))) = true)
    (h5151 : ((!((rankAtom ranks 19 == rankAtom ranks 64)) || ((rankAtom ranks 20).ult (rankAtom ranks 65)))) = true)
    (h5152 : ((!((rankAtom ranks 65 == rankAtom ranks 20)) || ((rankAtom ranks 64).ult (rankAtom ranks 19)))) = true)
    (h5153 : ((!((rankAtom ranks 65 == rankAtom ranks 64)) || ((rankAtom ranks 20).ult (rankAtom ranks 19)))) = true)
    (h5154 : ((!((rankAtom ranks 19 == rankAtom ranks 17)) || ((rankAtom ranks 73).ult (rankAtom ranks 66)))) = true)
    (h5155 : ((!((rankAtom ranks 19 == rankAtom ranks 73)) || ((rankAtom ranks 17).ult (rankAtom ranks 66)))) = true)
    (h5156 : ((!((rankAtom ranks 66 == rankAtom ranks 17)) || ((rankAtom ranks 73).ult (rankAtom ranks 19)))) = true)
    (h5157 : ((!((rankAtom ranks 66 == rankAtom ranks 73)) || ((rankAtom ranks 17).ult (rankAtom ranks 19)))) = true)
    (h5158 : ((!((rankAtom ranks 19 == rankAtom ranks 21)) || ((rankAtom ranks 64).ult (rankAtom ranks 66)))) = true)
    (h5159 : ((!((rankAtom ranks 19 == rankAtom ranks 64)) || ((rankAtom ranks 21).ult (rankAtom ranks 66)))) = true)
    (h5160 : ((!((rankAtom ranks 66 == rankAtom ranks 21)) || ((rankAtom ranks 64).ult (rankAtom ranks 19)))) = true)
    (h5161 : ((!((rankAtom ranks 66 == rankAtom ranks 64)) || ((rankAtom ranks 21).ult (rankAtom ranks 19)))) = true)
    (h5162 : ((!((rankAtom ranks 19 == rankAtom ranks 17)) || ((rankAtom ranks 74).ult (rankAtom ranks 67)))) = true)
    (h5163 : ((!((rankAtom ranks 19 == rankAtom ranks 74)) || ((rankAtom ranks 17).ult (rankAtom ranks 67)))) = true)
    (h5164 : ((!((rankAtom ranks 67 == rankAtom ranks 17)) || ((rankAtom ranks 74).ult (rankAtom ranks 19)))) = true)
    (h5165 : ((!((rankAtom ranks 19 == rankAtom ranks 22)) || ((rankAtom ranks 64).ult (rankAtom ranks 67)))) = true)
    (h5166 : ((!((rankAtom ranks 19 == rankAtom ranks 64)) || ((rankAtom ranks 22).ult (rankAtom ranks 67)))) = true)
    (h5167 : ((!((rankAtom ranks 20 == rankAtom ranks 17)) || ((rankAtom ranks 75).ult (rankAtom ranks 66)))) = true)
    (h5168 : ((!((rankAtom ranks 20 == rankAtom ranks 75)) || ((rankAtom ranks 17).ult (rankAtom ranks 66)))) = true)
    (h5169 : ((!((rankAtom ranks 66 == rankAtom ranks 75)) || ((rankAtom ranks 17).ult (rankAtom ranks 20)))) = true)
    (h5170 : ((!((rankAtom ranks 20 == rankAtom ranks 21)) || ((rankAtom ranks 65).ult (rankAtom ranks 66)))) = true)
    (h5171 : ((!((rankAtom ranks 20 == rankAtom ranks 65)) || ((rankAtom ranks 21).ult (rankAtom ranks 66)))) = true)
    (h5172 : ((!((rankAtom ranks 66 == rankAtom ranks 21)) || ((rankAtom ranks 65).ult (rankAtom ranks 20)))) = true)
    (h5173 : ((!((rankAtom ranks 66 == rankAtom ranks 65)) || ((rankAtom ranks 21).ult (rankAtom ranks 20)))) = true)
    (h5174 : ((!((rankAtom ranks 20 == rankAtom ranks 17)) || ((rankAtom ranks 76).ult (rankAtom ranks 67)))) = true)
    (h5175 : ((!((rankAtom ranks 20 == rankAtom ranks 76)) || ((rankAtom ranks 17).ult (rankAtom ranks 67)))) = true)
    (h5176 : ((!((rankAtom ranks 20 == rankAtom ranks 22)) || ((rankAtom ranks 65).ult (rankAtom ranks 67)))) = true)
    (h5177 : ((!((rankAtom ranks 20 == rankAtom ranks 65)) || ((rankAtom ranks 22).ult (rankAtom ranks 67)))) = true)
    (h5178 : ((!((rankAtom ranks 21 == rankAtom ranks 17)) || ((rankAtom ranks 77).ult (rankAtom ranks 67)))) = true)
    (h5179 : ((!((rankAtom ranks 21 == rankAtom ranks 77)) || ((rankAtom ranks 17).ult (rankAtom ranks 67)))) = true)
    (h5180 : ((!((rankAtom ranks 21 == rankAtom ranks 22)) || ((rankAtom ranks 66).ult (rankAtom ranks 67)))) = true)
    (h5181 : ((!((rankAtom ranks 21 == rankAtom ranks 66)) || ((rankAtom ranks 22).ult (rankAtom ranks 67)))) = true)
    (h5182 : ((!((rankAtom ranks 67 == rankAtom ranks 22)) || ((rankAtom ranks 66).ult (rankAtom ranks 21)))) = true)
    (h5183 : ((!((rankAtom ranks 67 == rankAtom ranks 66)) || ((rankAtom ranks 22).ult (rankAtom ranks 21)))) = true) :
    ∀ item ∈ sourceChunk080Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk080Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5120
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5121
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5122
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5123
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5124
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5125
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5126
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5127
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5128
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5129
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5130
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5131
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5132
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5133
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5134
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5135
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5136
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5137
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5138
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5139
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5140
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5141
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5142
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5143
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5144
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5145
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5146
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5147
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5148
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5149
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5150
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5151
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5152
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5153
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5154
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5155
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5156
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5157
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5158
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5159
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5160
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5161
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5162
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5163
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5164
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5165
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5166
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5167
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5168
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5169
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5170
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5171
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5172
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5173
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5174
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5175
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5176
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5177
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5178
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5179
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5180
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5181
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5182
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5183

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
