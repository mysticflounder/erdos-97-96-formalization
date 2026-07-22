/-
Generated packed-source bridge for verified right chunk 112.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk112_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h7168 : ((!((rankAtom ranks 74 == rankAtom ranks 72)) || ((rankAtom ranks 62).ult (rankAtom ranks 60)))) = true)
    (h7169 : ((!((rankAtom ranks 61 == rankAtom ranks 59)) || ((rankAtom ranks 77).ult (rankAtom ranks 74)))) = true)
    (h7170 : ((!((rankAtom ranks 61 == rankAtom ranks 77)) || ((rankAtom ranks 59).ult (rankAtom ranks 74)))) = true)
    (h7171 : ((!((rankAtom ranks 74 == rankAtom ranks 59)) || ((rankAtom ranks 77).ult (rankAtom ranks 61)))) = true)
    (h7172 : ((!((rankAtom ranks 61 == rankAtom ranks 62)) || ((rankAtom ranks 73).ult (rankAtom ranks 74)))) = true)
    (h7173 : ((!((rankAtom ranks 61 == rankAtom ranks 73)) || ((rankAtom ranks 62).ult (rankAtom ranks 74)))) = true)
    (h7174 : ((!((rankAtom ranks 74 == rankAtom ranks 73)) || ((rankAtom ranks 62).ult (rankAtom ranks 61)))) = true)
    (h7175 : ((!((rankAtom ranks 61 == rankAtom ranks 60)) || ((rankAtom ranks 77).ult (rankAtom ranks 76)))) = true)
    (h7176 : ((!((rankAtom ranks 61 == rankAtom ranks 77)) || ((rankAtom ranks 60).ult (rankAtom ranks 76)))) = true)
    (h7177 : ((!((rankAtom ranks 76 == rankAtom ranks 60)) || ((rankAtom ranks 77).ult (rankAtom ranks 61)))) = true)
    (h7178 : ((!((rankAtom ranks 61 == rankAtom ranks 62)) || ((rankAtom ranks 75).ult (rankAtom ranks 76)))) = true)
    (h7179 : ((!((rankAtom ranks 61 == rankAtom ranks 75)) || ((rankAtom ranks 62).ult (rankAtom ranks 76)))) = true)
    (h7180 : ((!((rankAtom ranks 76 == rankAtom ranks 75)) || ((rankAtom ranks 62).ult (rankAtom ranks 61)))) = true)
    (h7181 : ((!((rankAtom ranks 64 == rankAtom ranks 72)) || ((rankAtom ranks 63).ult (rankAtom ranks 69)))) = true)
    (h7182 : ((!((rankAtom ranks 69 == rankAtom ranks 63)) || ((rankAtom ranks 72).ult (rankAtom ranks 64)))) = true)
    (h7183 : ((!((rankAtom ranks 69 == rankAtom ranks 72)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h7184 : ((!((rankAtom ranks 64 == rankAtom ranks 65)) || ((rankAtom ranks 68).ult (rankAtom ranks 69)))) = true)
    (h7185 : ((!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 65).ult (rankAtom ranks 69)))) = true)
    (h7186 : ((!((rankAtom ranks 69 == rankAtom ranks 65)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h7187 : ((!((rankAtom ranks 64 == rankAtom ranks 73)) || ((rankAtom ranks 63).ult (rankAtom ranks 70)))) = true)
    (h7188 : ((!((rankAtom ranks 70 == rankAtom ranks 63)) || ((rankAtom ranks 73).ult (rankAtom ranks 64)))) = true)
    (h7189 : ((!((rankAtom ranks 70 == rankAtom ranks 73)) || ((rankAtom ranks 63).ult (rankAtom ranks 64)))) = true)
    (h7190 : ((!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 66).ult (rankAtom ranks 70)))) = true)
    (h7191 : ((!((rankAtom ranks 70 == rankAtom ranks 66)) || ((rankAtom ranks 68).ult (rankAtom ranks 64)))) = true)
    (h7192 : ((!((rankAtom ranks 64 == rankAtom ranks 74)) || ((rankAtom ranks 63).ult (rankAtom ranks 71)))) = true)
    (h7193 : ((!((rankAtom ranks 71 == rankAtom ranks 63)) || ((rankAtom ranks 74).ult (rankAtom ranks 64)))) = true)
    (h7194 : ((!((rankAtom ranks 64 == rankAtom ranks 68)) || ((rankAtom ranks 67).ult (rankAtom ranks 71)))) = true)
    (h7195 : ((!((rankAtom ranks 65 == rankAtom ranks 75)) || ((rankAtom ranks 63).ult (rankAtom ranks 70)))) = true)
    (h7196 : ((!((rankAtom ranks 70 == rankAtom ranks 63)) || ((rankAtom ranks 75).ult (rankAtom ranks 65)))) = true)
    (h7197 : ((!((rankAtom ranks 70 == rankAtom ranks 75)) || ((rankAtom ranks 63).ult (rankAtom ranks 65)))) = true)
    (h7198 : ((!((rankAtom ranks 65 == rankAtom ranks 66)) || ((rankAtom ranks 69).ult (rankAtom ranks 70)))) = true)
    (h7199 : ((!((rankAtom ranks 65 == rankAtom ranks 69)) || ((rankAtom ranks 66).ult (rankAtom ranks 70)))) = true)
    (h7200 : ((!((rankAtom ranks 70 == rankAtom ranks 66)) || ((rankAtom ranks 69).ult (rankAtom ranks 65)))) = true)
    (h7201 : ((!((rankAtom ranks 71 == rankAtom ranks 63)) || ((rankAtom ranks 76).ult (rankAtom ranks 65)))) = true)
    (h7202 : ((!((rankAtom ranks 65 == rankAtom ranks 67)) || ((rankAtom ranks 69).ult (rankAtom ranks 71)))) = true)
    (h7203 : ((!((rankAtom ranks 65 == rankAtom ranks 69)) || ((rankAtom ranks 67).ult (rankAtom ranks 71)))) = true)
    (h7204 : ((!((rankAtom ranks 71 == rankAtom ranks 69)) || ((rankAtom ranks 67).ult (rankAtom ranks 65)))) = true)
    (h7205 : ((!((rankAtom ranks 71 == rankAtom ranks 63)) || ((rankAtom ranks 77).ult (rankAtom ranks 66)))) = true)
    (h7206 : ((!((rankAtom ranks 66 == rankAtom ranks 67)) || ((rankAtom ranks 70).ult (rankAtom ranks 71)))) = true)
    (h7207 : ((!((rankAtom ranks 66 == rankAtom ranks 70)) || ((rankAtom ranks 67).ult (rankAtom ranks 71)))) = true)
    (h7208 : ((!((rankAtom ranks 65 == rankAtom ranks 64)) || ((rankAtom ranks 75).ult (rankAtom ranks 73)))) = true)
    (h7209 : ((!((rankAtom ranks 65 == rankAtom ranks 75)) || ((rankAtom ranks 64).ult (rankAtom ranks 73)))) = true)
    (h7210 : ((!((rankAtom ranks 73 == rankAtom ranks 64)) || ((rankAtom ranks 75).ult (rankAtom ranks 65)))) = true)
    (h7211 : ((!((rankAtom ranks 73 == rankAtom ranks 75)) || ((rankAtom ranks 64).ult (rankAtom ranks 65)))) = true)
    (h7212 : ((!((rankAtom ranks 65 == rankAtom ranks 66)) || ((rankAtom ranks 72).ult (rankAtom ranks 73)))) = true)
    (h7213 : ((!((rankAtom ranks 65 == rankAtom ranks 72)) || ((rankAtom ranks 66).ult (rankAtom ranks 73)))) = true)
    (h7214 : ((!((rankAtom ranks 73 == rankAtom ranks 66)) || ((rankAtom ranks 72).ult (rankAtom ranks 65)))) = true)
    (h7215 : ((!((rankAtom ranks 73 == rankAtom ranks 72)) || ((rankAtom ranks 66).ult (rankAtom ranks 65)))) = true)
    (h7216 : ((!((rankAtom ranks 65 == rankAtom ranks 64)) || ((rankAtom ranks 76).ult (rankAtom ranks 74)))) = true)
    (h7217 : ((!((rankAtom ranks 65 == rankAtom ranks 76)) || ((rankAtom ranks 64).ult (rankAtom ranks 74)))) = true)
    (h7218 : ((!((rankAtom ranks 74 == rankAtom ranks 64)) || ((rankAtom ranks 76).ult (rankAtom ranks 65)))) = true)
    (h7219 : ((!((rankAtom ranks 65 == rankAtom ranks 72)) || ((rankAtom ranks 67).ult (rankAtom ranks 74)))) = true)
    (h7220 : ((!((rankAtom ranks 74 == rankAtom ranks 72)) || ((rankAtom ranks 67).ult (rankAtom ranks 65)))) = true)
    (h7221 : ((!((rankAtom ranks 66 == rankAtom ranks 77)) || ((rankAtom ranks 64).ult (rankAtom ranks 74)))) = true)
    (h7222 : ((!((rankAtom ranks 74 == rankAtom ranks 64)) || ((rankAtom ranks 77).ult (rankAtom ranks 66)))) = true)
    (h7223 : ((!((rankAtom ranks 66 == rankAtom ranks 67)) || ((rankAtom ranks 73).ult (rankAtom ranks 74)))) = true)
    (h7224 : ((!((rankAtom ranks 66 == rankAtom ranks 73)) || ((rankAtom ranks 67).ult (rankAtom ranks 74)))) = true)
    (h7225 : ((!((rankAtom ranks 74 == rankAtom ranks 73)) || ((rankAtom ranks 67).ult (rankAtom ranks 66)))) = true)
    (h7226 : ((!((rankAtom ranks 66 == rankAtom ranks 65)) || ((rankAtom ranks 77).ult (rankAtom ranks 76)))) = true)
    (h7227 : ((!((rankAtom ranks 66 == rankAtom ranks 77)) || ((rankAtom ranks 65).ult (rankAtom ranks 76)))) = true)
    (h7228 : ((!((rankAtom ranks 76 == rankAtom ranks 65)) || ((rankAtom ranks 77).ult (rankAtom ranks 66)))) = true)
    (h7229 : ((!((rankAtom ranks 66 == rankAtom ranks 67)) || ((rankAtom ranks 75).ult (rankAtom ranks 76)))) = true)
    (h7230 : ((!((rankAtom ranks 66 == rankAtom ranks 75)) || ((rankAtom ranks 67).ult (rankAtom ranks 76)))) = true)
    (h7231 : ((!((rankAtom ranks 76 == rankAtom ranks 75)) || ((rankAtom ranks 67).ult (rankAtom ranks 66)))) = true) :
    ∀ item ∈ sourceChunk112Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk112Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7168
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7169
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7170
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7171
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7172
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7173
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7174
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7175
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7176
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7177
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7178
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7179
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7180
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7181
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7182
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7183
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7184
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7185
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7186
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7187
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7188
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7189
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7190
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7191
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7192
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7193
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7194
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7195
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7196
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7197
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7198
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7199
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7200
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7201
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7202
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7203
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7204
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7205
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7206
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7207
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7208
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7209
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7210
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7211
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7212
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7213
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7214
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7215
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7216
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7217
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7218
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7219
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7220
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7221
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7222
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7223
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7224
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7225
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7226
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7227
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7228
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7229
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7230
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h7231

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
