/-
Generated packed-source bridge for verified right chunk 065.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk065_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h4160 : ((!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h4161 : ((!((rankAtom ranks 64 == rankAtom ranks 6)) || ((rankAtom ranks 68).ult (rankAtom ranks 7)))) = true)
    (h4162 : ((!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 6).ult (rankAtom ranks 7)))) = true)
    (h4163 : ((!((rankAtom ranks 7 == rankAtom ranks 63)) || ((rankAtom ranks 8).ult (rankAtom ranks 64)))) = true)
    (h4164 : ((!((rankAtom ranks 64 == rankAtom ranks 8)) || ((rankAtom ranks 63).ult (rankAtom ranks 7)))) = true)
    (h4165 : ((!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h4166 : ((!((rankAtom ranks 65 == rankAtom ranks 6)) || ((rankAtom ranks 69).ult (rankAtom ranks 7)))) = true)
    (h4167 : ((!((rankAtom ranks 65 == rankAtom ranks 69)) || ((rankAtom ranks 6).ult (rankAtom ranks 7)))) = true)
    (h4168 : ((!((rankAtom ranks 7 == rankAtom ranks 63)) || ((rankAtom ranks 9).ult (rankAtom ranks 65)))) = true)
    (h4169 : ((!((rankAtom ranks 65 == rankAtom ranks 9)) || ((rankAtom ranks 63).ult (rankAtom ranks 7)))) = true)
    (h4170 : ((!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 70).ult (rankAtom ranks 66)))) = true)
    (h4171 : ((!((rankAtom ranks 66 == rankAtom ranks 6)) || ((rankAtom ranks 70).ult (rankAtom ranks 7)))) = true)
    (h4172 : ((!((rankAtom ranks 66 == rankAtom ranks 70)) || ((rankAtom ranks 6).ult (rankAtom ranks 7)))) = true)
    (h4173 : ((!((rankAtom ranks 7 == rankAtom ranks 63)) || ((rankAtom ranks 10).ult (rankAtom ranks 66)))) = true)
    (h4174 : ((!((rankAtom ranks 66 == rankAtom ranks 10)) || ((rankAtom ranks 63).ult (rankAtom ranks 7)))) = true)
    (h4175 : ((!((rankAtom ranks 7 == rankAtom ranks 6)) || ((rankAtom ranks 71).ult (rankAtom ranks 67)))) = true)
    (h4176 : ((!((rankAtom ranks 7 == rankAtom ranks 71)) || ((rankAtom ranks 6).ult (rankAtom ranks 67)))) = true)
    (h4177 : ((!((rankAtom ranks 67 == rankAtom ranks 6)) || ((rankAtom ranks 71).ult (rankAtom ranks 7)))) = true)
    (h4178 : ((!((rankAtom ranks 8 == rankAtom ranks 6)) || ((rankAtom ranks 72).ult (rankAtom ranks 65)))) = true)
    (h4179 : ((!((rankAtom ranks 8 == rankAtom ranks 72)) || ((rankAtom ranks 6).ult (rankAtom ranks 65)))) = true)
    (h4180 : ((!((rankAtom ranks 65 == rankAtom ranks 6)) || ((rankAtom ranks 72).ult (rankAtom ranks 8)))) = true)
    (h4181 : ((!((rankAtom ranks 65 == rankAtom ranks 72)) || ((rankAtom ranks 6).ult (rankAtom ranks 8)))) = true)
    (h4182 : ((!((rankAtom ranks 8 == rankAtom ranks 64)) || ((rankAtom ranks 9).ult (rankAtom ranks 65)))) = true)
    (h4183 : ((!((rankAtom ranks 65 == rankAtom ranks 9)) || ((rankAtom ranks 64).ult (rankAtom ranks 8)))) = true)
    (h4184 : ((!((rankAtom ranks 65 == rankAtom ranks 64)) || ((rankAtom ranks 9).ult (rankAtom ranks 8)))) = true)
    (h4185 : ((!((rankAtom ranks 8 == rankAtom ranks 6)) || ((rankAtom ranks 73).ult (rankAtom ranks 66)))) = true)
    (h4186 : ((!((rankAtom ranks 8 == rankAtom ranks 73)) || ((rankAtom ranks 6).ult (rankAtom ranks 66)))) = true)
    (h4187 : ((!((rankAtom ranks 66 == rankAtom ranks 6)) || ((rankAtom ranks 73).ult (rankAtom ranks 8)))) = true)
    (h4188 : ((!((rankAtom ranks 66 == rankAtom ranks 73)) || ((rankAtom ranks 6).ult (rankAtom ranks 8)))) = true)
    (h4189 : ((!((rankAtom ranks 8 == rankAtom ranks 64)) || ((rankAtom ranks 10).ult (rankAtom ranks 66)))) = true)
    (h4190 : ((!((rankAtom ranks 66 == rankAtom ranks 10)) || ((rankAtom ranks 64).ult (rankAtom ranks 8)))) = true)
    (h4191 : ((!((rankAtom ranks 8 == rankAtom ranks 6)) || ((rankAtom ranks 74).ult (rankAtom ranks 67)))) = true)
    (h4192 : ((!((rankAtom ranks 8 == rankAtom ranks 74)) || ((rankAtom ranks 6).ult (rankAtom ranks 67)))) = true)
    (h4193 : ((!((rankAtom ranks 67 == rankAtom ranks 6)) || ((rankAtom ranks 74).ult (rankAtom ranks 8)))) = true)
    (h4194 : ((!((rankAtom ranks 8 == rankAtom ranks 64)) || ((rankAtom ranks 11).ult (rankAtom ranks 67)))) = true)
    (h4195 : ((!((rankAtom ranks 9 == rankAtom ranks 6)) || ((rankAtom ranks 75).ult (rankAtom ranks 66)))) = true)
    (h4196 : ((!((rankAtom ranks 9 == rankAtom ranks 75)) || ((rankAtom ranks 6).ult (rankAtom ranks 66)))) = true)
    (h4197 : ((!((rankAtom ranks 66 == rankAtom ranks 6)) || ((rankAtom ranks 75).ult (rankAtom ranks 9)))) = true)
    (h4198 : ((!((rankAtom ranks 66 == rankAtom ranks 75)) || ((rankAtom ranks 6).ult (rankAtom ranks 9)))) = true)
    (h4199 : ((!((rankAtom ranks 9 == rankAtom ranks 65)) || ((rankAtom ranks 10).ult (rankAtom ranks 66)))) = true)
    (h4200 : ((!((rankAtom ranks 66 == rankAtom ranks 10)) || ((rankAtom ranks 65).ult (rankAtom ranks 9)))) = true)
    (h4201 : ((!((rankAtom ranks 66 == rankAtom ranks 65)) || ((rankAtom ranks 10).ult (rankAtom ranks 9)))) = true)
    (h4202 : ((!((rankAtom ranks 9 == rankAtom ranks 6)) || ((rankAtom ranks 76).ult (rankAtom ranks 67)))) = true)
    (h4203 : ((!((rankAtom ranks 9 == rankAtom ranks 76)) || ((rankAtom ranks 6).ult (rankAtom ranks 67)))) = true)
    (h4204 : ((!((rankAtom ranks 9 == rankAtom ranks 65)) || ((rankAtom ranks 11).ult (rankAtom ranks 67)))) = true)
    (h4205 : ((!((rankAtom ranks 10 == rankAtom ranks 6)) || ((rankAtom ranks 77).ult (rankAtom ranks 67)))) = true)
    (h4206 : ((!((rankAtom ranks 10 == rankAtom ranks 77)) || ((rankAtom ranks 6).ult (rankAtom ranks 67)))) = true)
    (h4207 : ((!((rankAtom ranks 10 == rankAtom ranks 66)) || ((rankAtom ranks 11).ult (rankAtom ranks 67)))) = true)
    (h4208 : ((!((rankAtom ranks 67 == rankAtom ranks 66)) || ((rankAtom ranks 11).ult (rankAtom ranks 10)))) = true)
    (h4209 : ((!((rankAtom ranks 8 == rankAtom ranks 7)) || ((rankAtom ranks 72).ult (rankAtom ranks 69)))) = true)
    (h4210 : ((!((rankAtom ranks 8 == rankAtom ranks 72)) || ((rankAtom ranks 7).ult (rankAtom ranks 69)))) = true)
    (h4211 : ((!((rankAtom ranks 69 == rankAtom ranks 72)) || ((rankAtom ranks 7).ult (rankAtom ranks 8)))) = true)
    (h4212 : ((!((rankAtom ranks 8 == rankAtom ranks 68)) || ((rankAtom ranks 9).ult (rankAtom ranks 69)))) = true)
    (h4213 : ((!((rankAtom ranks 69 == rankAtom ranks 9)) || ((rankAtom ranks 68).ult (rankAtom ranks 8)))) = true)
    (h4214 : ((!((rankAtom ranks 69 == rankAtom ranks 68)) || ((rankAtom ranks 9).ult (rankAtom ranks 8)))) = true)
    (h4215 : ((!((rankAtom ranks 8 == rankAtom ranks 73)) || ((rankAtom ranks 7).ult (rankAtom ranks 70)))) = true)
    (h4216 : ((!((rankAtom ranks 70 == rankAtom ranks 73)) || ((rankAtom ranks 7).ult (rankAtom ranks 8)))) = true)
    (h4217 : ((!((rankAtom ranks 8 == rankAtom ranks 68)) || ((rankAtom ranks 10).ult (rankAtom ranks 70)))) = true)
    (h4218 : ((!((rankAtom ranks 70 == rankAtom ranks 10)) || ((rankAtom ranks 68).ult (rankAtom ranks 8)))) = true)
    (h4219 : ((!((rankAtom ranks 8 == rankAtom ranks 74)) || ((rankAtom ranks 7).ult (rankAtom ranks 71)))) = true)
    (h4220 : ((!((rankAtom ranks 8 == rankAtom ranks 11)) || ((rankAtom ranks 68).ult (rankAtom ranks 71)))) = true)
    (h4221 : ((!((rankAtom ranks 8 == rankAtom ranks 68)) || ((rankAtom ranks 11).ult (rankAtom ranks 71)))) = true)
    (h4222 : ((!((rankAtom ranks 71 == rankAtom ranks 68)) || ((rankAtom ranks 11).ult (rankAtom ranks 8)))) = true)
    (h4223 : ((!((rankAtom ranks 9 == rankAtom ranks 7)) || ((rankAtom ranks 75).ult (rankAtom ranks 70)))) = true) :
    ∀ item ∈ sourceChunk065Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk065Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4160
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4161
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4162
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4163
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4164
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4165
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4166
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4167
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4168
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4169
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4170
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4171
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4172
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4173
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4174
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4175
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4176
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4177
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4178
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4179
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4180
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4181
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4182
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4183
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4184
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4185
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4186
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4187
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4188
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4189
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4190
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4191
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4192
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4193
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4194
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4195
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4196
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4197
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4198
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4199
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4200
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4201
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4202
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4203
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4204
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4205
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4206
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4207
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4208
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4209
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4210
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4211
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4212
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4213
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4214
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4215
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4216
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4217
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4218
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4219
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4220
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4221
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4222
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h4223

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
