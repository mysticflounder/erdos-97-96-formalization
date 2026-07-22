/-
Generated packed-source bridge for verified right chunk 096.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk096_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h6144 : ((!((rankAtom ranks 53 == rankAtom ranks 59)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h6145 : ((!((rankAtom ranks 35 == rankAtom ranks 38)) || ((rankAtom ranks 50).ult (rankAtom ranks 53)))) = true)
    (h6146 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 38).ult (rankAtom ranks 53)))) = true)
    (h6147 : ((!((rankAtom ranks 53 == rankAtom ranks 38)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h6148 : ((!((rankAtom ranks 53 == rankAtom ranks 50)) || ((rankAtom ranks 38).ult (rankAtom ranks 35)))) = true)
    (h6149 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 60).ult (rankAtom ranks 54)))) = true)
    (h6150 : ((!((rankAtom ranks 35 == rankAtom ranks 60)) || ((rankAtom ranks 34).ult (rankAtom ranks 54)))) = true)
    (h6151 : ((!((rankAtom ranks 54 == rankAtom ranks 34)) || ((rankAtom ranks 60).ult (rankAtom ranks 35)))) = true)
    (h6152 : ((!((rankAtom ranks 54 == rankAtom ranks 60)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h6153 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 39).ult (rankAtom ranks 54)))) = true)
    (h6154 : ((!((rankAtom ranks 54 == rankAtom ranks 39)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h6155 : ((!((rankAtom ranks 54 == rankAtom ranks 50)) || ((rankAtom ranks 39).ult (rankAtom ranks 35)))) = true)
    (h6156 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 61).ult (rankAtom ranks 55)))) = true)
    (h6157 : ((!((rankAtom ranks 35 == rankAtom ranks 61)) || ((rankAtom ranks 34).ult (rankAtom ranks 55)))) = true)
    (h6158 : ((!((rankAtom ranks 55 == rankAtom ranks 34)) || ((rankAtom ranks 61).ult (rankAtom ranks 35)))) = true)
    (h6159 : ((!((rankAtom ranks 55 == rankAtom ranks 61)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h6160 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 40).ult (rankAtom ranks 55)))) = true)
    (h6161 : ((!((rankAtom ranks 55 == rankAtom ranks 40)) || ((rankAtom ranks 50).ult (rankAtom ranks 35)))) = true)
    (h6162 : ((!((rankAtom ranks 55 == rankAtom ranks 50)) || ((rankAtom ranks 40).ult (rankAtom ranks 35)))) = true)
    (h6163 : ((!((rankAtom ranks 35 == rankAtom ranks 34)) || ((rankAtom ranks 62).ult (rankAtom ranks 56)))) = true)
    (h6164 : ((!((rankAtom ranks 35 == rankAtom ranks 62)) || ((rankAtom ranks 34).ult (rankAtom ranks 56)))) = true)
    (h6165 : ((!((rankAtom ranks 56 == rankAtom ranks 34)) || ((rankAtom ranks 62).ult (rankAtom ranks 35)))) = true)
    (h6166 : ((!((rankAtom ranks 56 == rankAtom ranks 62)) || ((rankAtom ranks 34).ult (rankAtom ranks 35)))) = true)
    (h6167 : ((!((rankAtom ranks 35 == rankAtom ranks 50)) || ((rankAtom ranks 41).ult (rankAtom ranks 56)))) = true)
    (h6168 : ((!((rankAtom ranks 56 == rankAtom ranks 50)) || ((rankAtom ranks 41).ult (rankAtom ranks 35)))) = true)
    (h6169 : ((!((rankAtom ranks 36 == rankAtom ranks 34)) || ((rankAtom ranks 63).ult (rankAtom ranks 52)))) = true)
    (h6170 : ((!((rankAtom ranks 52 == rankAtom ranks 34)) || ((rankAtom ranks 63).ult (rankAtom ranks 36)))) = true)
    (h6171 : ((!((rankAtom ranks 36 == rankAtom ranks 37)) || ((rankAtom ranks 51).ult (rankAtom ranks 52)))) = true)
    (h6172 : ((!((rankAtom ranks 52 == rankAtom ranks 37)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h6173 : ((!((rankAtom ranks 52 == rankAtom ranks 51)) || ((rankAtom ranks 37).ult (rankAtom ranks 36)))) = true)
    (h6174 : ((!((rankAtom ranks 36 == rankAtom ranks 34)) || ((rankAtom ranks 64).ult (rankAtom ranks 53)))) = true)
    (h6175 : ((!((rankAtom ranks 53 == rankAtom ranks 34)) || ((rankAtom ranks 64).ult (rankAtom ranks 36)))) = true)
    (h6176 : ((!((rankAtom ranks 53 == rankAtom ranks 64)) || ((rankAtom ranks 34).ult (rankAtom ranks 36)))) = true)
    (h6177 : ((!((rankAtom ranks 36 == rankAtom ranks 38)) || ((rankAtom ranks 51).ult (rankAtom ranks 53)))) = true)
    (h6178 : ((!((rankAtom ranks 53 == rankAtom ranks 38)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h6179 : ((!((rankAtom ranks 53 == rankAtom ranks 51)) || ((rankAtom ranks 38).ult (rankAtom ranks 36)))) = true)
    (h6180 : ((!((rankAtom ranks 36 == rankAtom ranks 34)) || ((rankAtom ranks 65).ult (rankAtom ranks 54)))) = true)
    (h6181 : ((!((rankAtom ranks 54 == rankAtom ranks 34)) || ((rankAtom ranks 65).ult (rankAtom ranks 36)))) = true)
    (h6182 : ((!((rankAtom ranks 54 == rankAtom ranks 65)) || ((rankAtom ranks 34).ult (rankAtom ranks 36)))) = true)
    (h6183 : ((!((rankAtom ranks 36 == rankAtom ranks 39)) || ((rankAtom ranks 51).ult (rankAtom ranks 54)))) = true)
    (h6184 : ((!((rankAtom ranks 54 == rankAtom ranks 39)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h6185 : ((!((rankAtom ranks 54 == rankAtom ranks 51)) || ((rankAtom ranks 39).ult (rankAtom ranks 36)))) = true)
    (h6186 : ((!((rankAtom ranks 36 == rankAtom ranks 34)) || ((rankAtom ranks 66).ult (rankAtom ranks 55)))) = true)
    (h6187 : ((!((rankAtom ranks 55 == rankAtom ranks 34)) || ((rankAtom ranks 66).ult (rankAtom ranks 36)))) = true)
    (h6188 : ((!((rankAtom ranks 55 == rankAtom ranks 66)) || ((rankAtom ranks 34).ult (rankAtom ranks 36)))) = true)
    (h6189 : ((!((rankAtom ranks 36 == rankAtom ranks 40)) || ((rankAtom ranks 51).ult (rankAtom ranks 55)))) = true)
    (h6190 : ((!((rankAtom ranks 36 == rankAtom ranks 51)) || ((rankAtom ranks 40).ult (rankAtom ranks 55)))) = true)
    (h6191 : ((!((rankAtom ranks 55 == rankAtom ranks 40)) || ((rankAtom ranks 51).ult (rankAtom ranks 36)))) = true)
    (h6192 : ((!((rankAtom ranks 55 == rankAtom ranks 51)) || ((rankAtom ranks 40).ult (rankAtom ranks 36)))) = true)
    (h6193 : ((!((rankAtom ranks 36 == rankAtom ranks 34)) || ((rankAtom ranks 67).ult (rankAtom ranks 56)))) = true)
    (h6194 : ((!((rankAtom ranks 56 == rankAtom ranks 34)) || ((rankAtom ranks 67).ult (rankAtom ranks 36)))) = true)
    (h6195 : ((!((rankAtom ranks 36 == rankAtom ranks 51)) || ((rankAtom ranks 41).ult (rankAtom ranks 56)))) = true)
    (h6196 : ((!((rankAtom ranks 56 == rankAtom ranks 51)) || ((rankAtom ranks 41).ult (rankAtom ranks 36)))) = true)
    (h6197 : ((!((rankAtom ranks 37 == rankAtom ranks 34)) || ((rankAtom ranks 68).ult (rankAtom ranks 53)))) = true)
    (h6198 : ((!((rankAtom ranks 37 == rankAtom ranks 68)) || ((rankAtom ranks 34).ult (rankAtom ranks 53)))) = true)
    (h6199 : ((!((rankAtom ranks 53 == rankAtom ranks 34)) || ((rankAtom ranks 68).ult (rankAtom ranks 37)))) = true)
    (h6200 : ((!((rankAtom ranks 53 == rankAtom ranks 68)) || ((rankAtom ranks 34).ult (rankAtom ranks 37)))) = true)
    (h6201 : ((!((rankAtom ranks 37 == rankAtom ranks 38)) || ((rankAtom ranks 52).ult (rankAtom ranks 53)))) = true)
    (h6202 : ((!((rankAtom ranks 37 == rankAtom ranks 52)) || ((rankAtom ranks 38).ult (rankAtom ranks 53)))) = true)
    (h6203 : ((!((rankAtom ranks 53 == rankAtom ranks 38)) || ((rankAtom ranks 52).ult (rankAtom ranks 37)))) = true)
    (h6204 : ((!((rankAtom ranks 53 == rankAtom ranks 52)) || ((rankAtom ranks 38).ult (rankAtom ranks 37)))) = true)
    (h6205 : ((!((rankAtom ranks 37 == rankAtom ranks 34)) || ((rankAtom ranks 69).ult (rankAtom ranks 54)))) = true)
    (h6206 : ((!((rankAtom ranks 37 == rankAtom ranks 69)) || ((rankAtom ranks 34).ult (rankAtom ranks 54)))) = true)
    (h6207 : ((!((rankAtom ranks 54 == rankAtom ranks 34)) || ((rankAtom ranks 69).ult (rankAtom ranks 37)))) = true) :
    ∀ item ∈ sourceChunk096Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk096Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6144
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6145
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6146
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6147
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6148
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6149
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6150
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6151
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6152
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6153
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6154
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6155
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6156
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6157
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6158
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6159
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6160
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6161
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6162
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6163
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6164
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6165
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6166
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6167
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6168
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6169
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6170
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6171
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6172
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6173
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6174
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6175
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6176
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6177
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6178
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6179
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6180
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6181
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6182
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6183
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6184
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6185
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6186
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6187
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6188
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6189
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6190
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6191
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6192
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6193
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6194
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6195
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6196
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6197
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6198
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6199
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6200
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6201
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6202
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6203
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6204
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6205
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6206
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h6207

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
