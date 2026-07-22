/-
Generated packed-source bridge for verified right chunk 035.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk035_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2240 : ((!((rowBit rows 0 3 4 && rowBit rows 0 3 7)) || ((rankAtom ranks 33 == rankAtom ranks 36)))) = true)
    (h2241 : ((!((rowBit rows 0 3 4 && rowBit rows 0 3 8)) || ((rankAtom ranks 33 == rankAtom ranks 37)))) = true)
    (h2242 : ((!((rowBit rows 0 3 4 && rowBit rows 0 3 9)) || ((rankAtom ranks 33 == rankAtom ranks 38)))) = true)
    (h2243 : ((!((rowBit rows 0 3 4 && rowBit rows 0 3 10)) || ((rankAtom ranks 33 == rankAtom ranks 39)))) = true)
    (h2244 : ((!((rowBit rows 0 3 4 && rowBit rows 0 3 11)) || ((rankAtom ranks 33 == rankAtom ranks 40)))) = true)
    (h2245 : ((!((rowBit rows 0 3 4 && rowBit rows 0 3 12)) || ((rankAtom ranks 33 == rankAtom ranks 41)))) = true)
    (h2246 : ((!((rowBit rows 0 3 5 && rowBit rows 0 3 6)) || ((rankAtom ranks 34 == rankAtom ranks 35)))) = true)
    (h2247 : ((!((rowBit rows 0 3 5 && rowBit rows 0 3 7)) || ((rankAtom ranks 34 == rankAtom ranks 36)))) = true)
    (h2248 : ((!((rowBit rows 0 3 5 && rowBit rows 0 3 8)) || ((rankAtom ranks 34 == rankAtom ranks 37)))) = true)
    (h2249 : ((!((rowBit rows 0 3 5 && rowBit rows 0 3 9)) || ((rankAtom ranks 34 == rankAtom ranks 38)))) = true)
    (h2250 : ((!((rowBit rows 0 3 5 && rowBit rows 0 3 10)) || ((rankAtom ranks 34 == rankAtom ranks 39)))) = true)
    (h2251 : ((!((rowBit rows 0 3 5 && rowBit rows 0 3 11)) || ((rankAtom ranks 34 == rankAtom ranks 40)))) = true)
    (h2252 : ((!((rowBit rows 0 3 5 && rowBit rows 0 3 12)) || ((rankAtom ranks 34 == rankAtom ranks 41)))) = true)
    (h2253 : ((!((rowBit rows 0 3 6 && rowBit rows 0 3 7)) || ((rankAtom ranks 35 == rankAtom ranks 36)))) = true)
    (h2254 : ((!((rowBit rows 0 3 6 && rowBit rows 0 3 8)) || ((rankAtom ranks 35 == rankAtom ranks 37)))) = true)
    (h2255 : ((!((rowBit rows 0 3 6 && rowBit rows 0 3 9)) || ((rankAtom ranks 35 == rankAtom ranks 38)))) = true)
    (h2256 : ((!((rowBit rows 0 3 6 && rowBit rows 0 3 10)) || ((rankAtom ranks 35 == rankAtom ranks 39)))) = true)
    (h2257 : ((!((rowBit rows 0 3 6 && rowBit rows 0 3 11)) || ((rankAtom ranks 35 == rankAtom ranks 40)))) = true)
    (h2258 : ((!((rowBit rows 0 3 6 && rowBit rows 0 3 12)) || ((rankAtom ranks 35 == rankAtom ranks 41)))) = true)
    (h2259 : ((!((rowBit rows 0 3 7 && rowBit rows 0 3 8)) || ((rankAtom ranks 36 == rankAtom ranks 37)))) = true)
    (h2260 : ((!((rowBit rows 0 3 7 && rowBit rows 0 3 9)) || ((rankAtom ranks 36 == rankAtom ranks 38)))) = true)
    (h2261 : ((!((rowBit rows 0 3 7 && rowBit rows 0 3 10)) || ((rankAtom ranks 36 == rankAtom ranks 39)))) = true)
    (h2262 : ((!((rowBit rows 0 3 7 && rowBit rows 0 3 11)) || ((rankAtom ranks 36 == rankAtom ranks 40)))) = true)
    (h2263 : ((!((rowBit rows 0 3 7 && rowBit rows 0 3 12)) || ((rankAtom ranks 36 == rankAtom ranks 41)))) = true)
    (h2264 : ((!((rowBit rows 0 3 8 && rowBit rows 0 3 9)) || ((rankAtom ranks 37 == rankAtom ranks 38)))) = true)
    (h2265 : ((!((rowBit rows 0 3 8 && rowBit rows 0 3 10)) || ((rankAtom ranks 37 == rankAtom ranks 39)))) = true)
    (h2266 : ((!((rowBit rows 0 3 8 && rowBit rows 0 3 11)) || ((rankAtom ranks 37 == rankAtom ranks 40)))) = true)
    (h2267 : ((!((rowBit rows 0 3 8 && rowBit rows 0 3 12)) || ((rankAtom ranks 37 == rankAtom ranks 41)))) = true)
    (h2268 : ((!((rowBit rows 0 3 9 && rowBit rows 0 3 10)) || ((rankAtom ranks 38 == rankAtom ranks 39)))) = true)
    (h2269 : ((!((rowBit rows 0 3 9 && rowBit rows 0 3 11)) || ((rankAtom ranks 38 == rankAtom ranks 40)))) = true)
    (h2270 : ((!((rowBit rows 0 3 9 && rowBit rows 0 3 12)) || ((rankAtom ranks 38 == rankAtom ranks 41)))) = true)
    (h2271 : ((!((rowBit rows 0 3 10 && rowBit rows 0 3 11)) || ((rankAtom ranks 39 == rankAtom ranks 40)))) = true)
    (h2272 : ((!((rowBit rows 0 3 10 && rowBit rows 0 3 12)) || ((rankAtom ranks 39 == rankAtom ranks 41)))) = true)
    (h2273 : ((!((rowBit rows 0 3 11 && rowBit rows 0 3 12)) || ((rankAtom ranks 40 == rankAtom ranks 41)))) = true)
    (h2274 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 5)) || ((rankAtom ranks 3 == rankAtom ranks 42)))) = true)
    (h2275 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 6)) || ((rankAtom ranks 3 == rankAtom ranks 43)))) = true)
    (h2276 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 7)) || ((rankAtom ranks 3 == rankAtom ranks 44)))) = true)
    (h2277 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 8)) || ((rankAtom ranks 3 == rankAtom ranks 45)))) = true)
    (h2278 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 9)) || ((rankAtom ranks 3 == rankAtom ranks 46)))) = true)
    (h2279 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 10)) || ((rankAtom ranks 3 == rankAtom ranks 47)))) = true)
    (h2280 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 11)) || ((rankAtom ranks 3 == rankAtom ranks 48)))) = true)
    (h2281 : ((!((rowBit rows 0 4 0 && rowBit rows 0 4 12)) || ((rankAtom ranks 3 == rankAtom ranks 49)))) = true)
    (h2282 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 5)) || ((rankAtom ranks 14 == rankAtom ranks 42)))) = true)
    (h2283 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 6)) || ((rankAtom ranks 14 == rankAtom ranks 43)))) = true)
    (h2284 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 7)) || ((rankAtom ranks 14 == rankAtom ranks 44)))) = true)
    (h2285 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 8)) || ((rankAtom ranks 14 == rankAtom ranks 45)))) = true)
    (h2286 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 9)) || ((rankAtom ranks 14 == rankAtom ranks 46)))) = true)
    (h2287 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 10)) || ((rankAtom ranks 14 == rankAtom ranks 47)))) = true)
    (h2288 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 11)) || ((rankAtom ranks 14 == rankAtom ranks 48)))) = true)
    (h2289 : ((!((rowBit rows 0 4 1 && rowBit rows 0 4 12)) || ((rankAtom ranks 14 == rankAtom ranks 49)))) = true)
    (h2290 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 5)) || ((rankAtom ranks 24 == rankAtom ranks 42)))) = true)
    (h2291 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 6)) || ((rankAtom ranks 24 == rankAtom ranks 43)))) = true)
    (h2292 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 7)) || ((rankAtom ranks 24 == rankAtom ranks 44)))) = true)
    (h2293 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 8)) || ((rankAtom ranks 24 == rankAtom ranks 45)))) = true)
    (h2294 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 9)) || ((rankAtom ranks 24 == rankAtom ranks 46)))) = true)
    (h2295 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 10)) || ((rankAtom ranks 24 == rankAtom ranks 47)))) = true)
    (h2296 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 11)) || ((rankAtom ranks 24 == rankAtom ranks 48)))) = true)
    (h2297 : ((!((rowBit rows 0 4 2 && rowBit rows 0 4 12)) || ((rankAtom ranks 24 == rankAtom ranks 49)))) = true)
    (h2298 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 5)) || ((rankAtom ranks 33 == rankAtom ranks 42)))) = true)
    (h2299 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 6)) || ((rankAtom ranks 33 == rankAtom ranks 43)))) = true)
    (h2300 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 8)) || ((rankAtom ranks 33 == rankAtom ranks 45)))) = true)
    (h2301 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 9)) || ((rankAtom ranks 33 == rankAtom ranks 46)))) = true)
    (h2302 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 10)) || ((rankAtom ranks 33 == rankAtom ranks 47)))) = true)
    (h2303 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 11)) || ((rankAtom ranks 33 == rankAtom ranks 48)))) = true) :
    ∀ item ∈ sourceChunk035Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk035Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2240
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2241
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2242
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2243
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2244
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2245
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2246
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2247
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2248
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2249
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2250
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2251
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2252
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2253
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2254
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2255
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2256
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2257
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2258
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2259
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2260
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2261
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2262
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2263
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2264
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2265
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2266
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2267
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2268
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2269
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2270
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2271
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2272
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2273
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2274
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2275
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2276
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2277
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2278
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2279
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2280
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2281
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2282
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2283
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2284
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2285
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2286
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2287
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2288
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2289
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2290
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2291
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2292
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2293
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2294
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2295
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2296
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2297
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2298
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2299
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2300
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2301
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2302
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2303

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
