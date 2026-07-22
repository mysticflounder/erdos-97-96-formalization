/-
Generated packed-source bridge for verified left chunk 034.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk034_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2176 : ((!((rowBit rows 0 2 4 && rowBit rows 0 2 7)) || ((rankAtom ranks 24 == rankAtom ranks 27)))) = true)
    (h2177 : ((!((rowBit rows 0 2 4 && rowBit rows 0 2 8)) || ((rankAtom ranks 24 == rankAtom ranks 28)))) = true)
    (h2178 : ((!((rowBit rows 0 2 4 && rowBit rows 0 2 9)) || ((rankAtom ranks 24 == rankAtom ranks 29)))) = true)
    (h2179 : ((!((rowBit rows 0 2 4 && rowBit rows 0 2 10)) || ((rankAtom ranks 24 == rankAtom ranks 30)))) = true)
    (h2180 : ((!((rowBit rows 0 2 4 && rowBit rows 0 2 11)) || ((rankAtom ranks 24 == rankAtom ranks 31)))) = true)
    (h2181 : ((!((rowBit rows 0 2 4 && rowBit rows 0 2 12)) || ((rankAtom ranks 24 == rankAtom ranks 32)))) = true)
    (h2182 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 6)) || ((rankAtom ranks 25 == rankAtom ranks 26)))) = true)
    (h2183 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 7)) || ((rankAtom ranks 25 == rankAtom ranks 27)))) = true)
    (h2184 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 8)) || ((rankAtom ranks 25 == rankAtom ranks 28)))) = true)
    (h2185 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 9)) || ((rankAtom ranks 25 == rankAtom ranks 29)))) = true)
    (h2186 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 10)) || ((rankAtom ranks 25 == rankAtom ranks 30)))) = true)
    (h2187 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 11)) || ((rankAtom ranks 25 == rankAtom ranks 31)))) = true)
    (h2188 : ((!((rowBit rows 0 2 5 && rowBit rows 0 2 12)) || ((rankAtom ranks 25 == rankAtom ranks 32)))) = true)
    (h2189 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 7)) || ((rankAtom ranks 26 == rankAtom ranks 27)))) = true)
    (h2190 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 8)) || ((rankAtom ranks 26 == rankAtom ranks 28)))) = true)
    (h2191 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 9)) || ((rankAtom ranks 26 == rankAtom ranks 29)))) = true)
    (h2192 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 10)) || ((rankAtom ranks 26 == rankAtom ranks 30)))) = true)
    (h2193 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 11)) || ((rankAtom ranks 26 == rankAtom ranks 31)))) = true)
    (h2194 : ((!((rowBit rows 0 2 6 && rowBit rows 0 2 12)) || ((rankAtom ranks 26 == rankAtom ranks 32)))) = true)
    (h2195 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 8)) || ((rankAtom ranks 27 == rankAtom ranks 28)))) = true)
    (h2196 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 9)) || ((rankAtom ranks 27 == rankAtom ranks 29)))) = true)
    (h2197 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 10)) || ((rankAtom ranks 27 == rankAtom ranks 30)))) = true)
    (h2198 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 11)) || ((rankAtom ranks 27 == rankAtom ranks 31)))) = true)
    (h2199 : ((!((rowBit rows 0 2 7 && rowBit rows 0 2 12)) || ((rankAtom ranks 27 == rankAtom ranks 32)))) = true)
    (h2200 : ((!((rowBit rows 0 2 8 && rowBit rows 0 2 9)) || ((rankAtom ranks 28 == rankAtom ranks 29)))) = true)
    (h2201 : ((!((rowBit rows 0 2 8 && rowBit rows 0 2 10)) || ((rankAtom ranks 28 == rankAtom ranks 30)))) = true)
    (h2202 : ((!((rowBit rows 0 2 8 && rowBit rows 0 2 11)) || ((rankAtom ranks 28 == rankAtom ranks 31)))) = true)
    (h2203 : ((!((rowBit rows 0 2 8 && rowBit rows 0 2 12)) || ((rankAtom ranks 28 == rankAtom ranks 32)))) = true)
    (h2204 : ((!((rowBit rows 0 2 9 && rowBit rows 0 2 10)) || ((rankAtom ranks 29 == rankAtom ranks 30)))) = true)
    (h2205 : ((!((rowBit rows 0 2 9 && rowBit rows 0 2 11)) || ((rankAtom ranks 29 == rankAtom ranks 31)))) = true)
    (h2206 : ((!((rowBit rows 0 2 9 && rowBit rows 0 2 12)) || ((rankAtom ranks 29 == rankAtom ranks 32)))) = true)
    (h2207 : ((!((rowBit rows 0 2 10 && rowBit rows 0 2 11)) || ((rankAtom ranks 30 == rankAtom ranks 31)))) = true)
    (h2208 : ((!((rowBit rows 0 2 10 && rowBit rows 0 2 12)) || ((rankAtom ranks 30 == rankAtom ranks 32)))) = true)
    (h2209 : ((!((rowBit rows 0 2 11 && rowBit rows 0 2 12)) || ((rankAtom ranks 31 == rankAtom ranks 32)))) = true)
    (h2210 : ((!((rowBit rows 0 3 0 && rowBit rows 0 3 1)) || ((rankAtom ranks 2 == rankAtom ranks 13)))) = true)
    (h2211 : ((!((rowBit rows 0 3 0 && rowBit rows 0 3 2)) || ((rankAtom ranks 2 == rankAtom ranks 23)))) = true)
    (h2212 : ((!((rowBit rows 0 3 0 && rowBit rows 0 3 4)) || ((rankAtom ranks 2 == rankAtom ranks 33)))) = true)
    (h2213 : ((!((rowBit rows 0 3 0 && rowBit rows 0 3 5)) || ((rankAtom ranks 2 == rankAtom ranks 34)))) = true)
    (h2214 : ((!((rowBit rows 0 3 0 && rowBit rows 0 3 6)) || ((rankAtom ranks 2 == rankAtom ranks 35)))) = true)
    (h2215 : ((!((rowBit rows 0 3 0 && rowBit rows 0 3 7)) || ((rankAtom ranks 2 == rankAtom ranks 36)))) = true)
    (h2216 : ((!((rowBit rows 0 3 0 && rowBit rows 0 3 8)) || ((rankAtom ranks 2 == rankAtom ranks 37)))) = true)
    (h2217 : ((!((rowBit rows 0 3 0 && rowBit rows 0 3 9)) || ((rankAtom ranks 2 == rankAtom ranks 38)))) = true)
    (h2218 : ((!((rowBit rows 0 3 0 && rowBit rows 0 3 10)) || ((rankAtom ranks 2 == rankAtom ranks 39)))) = true)
    (h2219 : ((!((rowBit rows 0 3 0 && rowBit rows 0 3 11)) || ((rankAtom ranks 2 == rankAtom ranks 40)))) = true)
    (h2220 : ((!((rowBit rows 0 3 0 && rowBit rows 0 3 12)) || ((rankAtom ranks 2 == rankAtom ranks 41)))) = true)
    (h2221 : ((!((rowBit rows 0 3 1 && rowBit rows 0 3 2)) || ((rankAtom ranks 13 == rankAtom ranks 23)))) = true)
    (h2222 : ((!((rowBit rows 0 3 1 && rowBit rows 0 3 4)) || ((rankAtom ranks 13 == rankAtom ranks 33)))) = true)
    (h2223 : ((!((rowBit rows 0 3 1 && rowBit rows 0 3 6)) || ((rankAtom ranks 13 == rankAtom ranks 35)))) = true)
    (h2224 : ((!((rowBit rows 0 3 1 && rowBit rows 0 3 8)) || ((rankAtom ranks 13 == rankAtom ranks 37)))) = true)
    (h2225 : ((!((rowBit rows 0 3 1 && rowBit rows 0 3 9)) || ((rankAtom ranks 13 == rankAtom ranks 38)))) = true)
    (h2226 : ((!((rowBit rows 0 3 1 && rowBit rows 0 3 10)) || ((rankAtom ranks 13 == rankAtom ranks 39)))) = true)
    (h2227 : ((!((rowBit rows 0 3 1 && rowBit rows 0 3 11)) || ((rankAtom ranks 13 == rankAtom ranks 40)))) = true)
    (h2228 : ((!((rowBit rows 0 3 1 && rowBit rows 0 3 12)) || ((rankAtom ranks 13 == rankAtom ranks 41)))) = true)
    (h2229 : ((!((rowBit rows 0 3 2 && rowBit rows 0 3 4)) || ((rankAtom ranks 23 == rankAtom ranks 33)))) = true)
    (h2230 : ((!((rowBit rows 0 3 2 && rowBit rows 0 3 5)) || ((rankAtom ranks 23 == rankAtom ranks 34)))) = true)
    (h2231 : ((!((rowBit rows 0 3 2 && rowBit rows 0 3 6)) || ((rankAtom ranks 23 == rankAtom ranks 35)))) = true)
    (h2232 : ((!((rowBit rows 0 3 2 && rowBit rows 0 3 7)) || ((rankAtom ranks 23 == rankAtom ranks 36)))) = true)
    (h2233 : ((!((rowBit rows 0 3 2 && rowBit rows 0 3 8)) || ((rankAtom ranks 23 == rankAtom ranks 37)))) = true)
    (h2234 : ((!((rowBit rows 0 3 2 && rowBit rows 0 3 9)) || ((rankAtom ranks 23 == rankAtom ranks 38)))) = true)
    (h2235 : ((!((rowBit rows 0 3 2 && rowBit rows 0 3 10)) || ((rankAtom ranks 23 == rankAtom ranks 39)))) = true)
    (h2236 : ((!((rowBit rows 0 3 2 && rowBit rows 0 3 11)) || ((rankAtom ranks 23 == rankAtom ranks 40)))) = true)
    (h2237 : ((!((rowBit rows 0 3 2 && rowBit rows 0 3 12)) || ((rankAtom ranks 23 == rankAtom ranks 41)))) = true)
    (h2238 : ((!((rowBit rows 0 3 4 && rowBit rows 0 3 5)) || ((rankAtom ranks 33 == rankAtom ranks 34)))) = true)
    (h2239 : ((!((rowBit rows 0 3 4 && rowBit rows 0 3 6)) || ((rankAtom ranks 33 == rankAtom ranks 35)))) = true) :
    ∀ item ∈ sourceChunk034Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk034Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2176
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2177
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2178
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2179
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2180
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2181
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2182
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2183
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2184
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2185
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2186
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2187
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2188
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2189
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2190
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2191
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2192
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2193
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2194
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2195
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2196
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2197
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2198
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2199
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2200
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2201
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2202
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2203
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2204
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2205
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2206
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2207
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2208
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2209
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2210
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2211
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2212
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2213
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2214
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2215
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2216
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2217
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2218
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2219
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2220
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2221
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2222
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2223
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2224
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2225
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2226
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2227
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2228
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2229
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2230
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2231
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2232
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2233
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2234
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2235
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2236
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2237
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2238
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2239

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
