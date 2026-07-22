/-
Generated packed-source bridge for verified right chunk 036.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk036_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2304 : ((!((rowBit rows 0 4 3 && rowBit rows 0 4 12)) || ((rankAtom ranks 33 == rankAtom ranks 49)))) = true)
    (h2305 : ((!((rowBit rows 0 4 5 && rowBit rows 0 4 9)) || ((rankAtom ranks 42 == rankAtom ranks 46)))) = true)
    (h2306 : ((!((rowBit rows 0 4 5 && rowBit rows 0 4 10)) || ((rankAtom ranks 42 == rankAtom ranks 47)))) = true)
    (h2307 : ((!((rowBit rows 0 4 5 && rowBit rows 0 4 11)) || ((rankAtom ranks 42 == rankAtom ranks 48)))) = true)
    (h2308 : ((!((rowBit rows 0 4 5 && rowBit rows 0 4 12)) || ((rankAtom ranks 42 == rankAtom ranks 49)))) = true)
    (h2309 : ((!((rowBit rows 0 4 6 && rowBit rows 0 4 9)) || ((rankAtom ranks 43 == rankAtom ranks 46)))) = true)
    (h2310 : ((!((rowBit rows 0 4 6 && rowBit rows 0 4 10)) || ((rankAtom ranks 43 == rankAtom ranks 47)))) = true)
    (h2311 : ((!((rowBit rows 0 4 6 && rowBit rows 0 4 11)) || ((rankAtom ranks 43 == rankAtom ranks 48)))) = true)
    (h2312 : ((!((rowBit rows 0 4 6 && rowBit rows 0 4 12)) || ((rankAtom ranks 43 == rankAtom ranks 49)))) = true)
    (h2313 : ((!((rowBit rows 0 4 7 && rowBit rows 0 4 9)) || ((rankAtom ranks 44 == rankAtom ranks 46)))) = true)
    (h2314 : ((!((rowBit rows 0 4 7 && rowBit rows 0 4 10)) || ((rankAtom ranks 44 == rankAtom ranks 47)))) = true)
    (h2315 : ((!((rowBit rows 0 4 7 && rowBit rows 0 4 11)) || ((rankAtom ranks 44 == rankAtom ranks 48)))) = true)
    (h2316 : ((!((rowBit rows 0 4 7 && rowBit rows 0 4 12)) || ((rankAtom ranks 44 == rankAtom ranks 49)))) = true)
    (h2317 : ((!((rowBit rows 0 4 8 && rowBit rows 0 4 9)) || ((rankAtom ranks 45 == rankAtom ranks 46)))) = true)
    (h2318 : ((!((rowBit rows 0 4 8 && rowBit rows 0 4 10)) || ((rankAtom ranks 45 == rankAtom ranks 47)))) = true)
    (h2319 : ((!((rowBit rows 0 4 8 && rowBit rows 0 4 11)) || ((rankAtom ranks 45 == rankAtom ranks 48)))) = true)
    (h2320 : ((!((rowBit rows 0 4 8 && rowBit rows 0 4 12)) || ((rankAtom ranks 45 == rankAtom ranks 49)))) = true)
    (h2321 : ((!((rowBit rows 0 4 9 && rowBit rows 0 4 10)) || ((rankAtom ranks 46 == rankAtom ranks 47)))) = true)
    (h2322 : ((!((rowBit rows 0 4 9 && rowBit rows 0 4 11)) || ((rankAtom ranks 46 == rankAtom ranks 48)))) = true)
    (h2323 : ((!((rowBit rows 0 4 9 && rowBit rows 0 4 12)) || ((rankAtom ranks 46 == rankAtom ranks 49)))) = true)
    (h2324 : ((!((rowBit rows 0 4 10 && rowBit rows 0 4 11)) || ((rankAtom ranks 47 == rankAtom ranks 48)))) = true)
    (h2325 : ((!((rowBit rows 0 4 10 && rowBit rows 0 4 12)) || ((rankAtom ranks 47 == rankAtom ranks 49)))) = true)
    (h2326 : ((!((rowBit rows 0 4 11 && rowBit rows 0 4 12)) || ((rankAtom ranks 48 == rankAtom ranks 49)))) = true)
    (h2327 : ((!((rowBit rows 0 5 0 && rowBit rows 0 5 1)) || ((rankAtom ranks 4 == rankAtom ranks 15)))) = true)
    (h2328 : ((!((rowBit rows 0 5 0 && rowBit rows 0 5 2)) || ((rankAtom ranks 4 == rankAtom ranks 25)))) = true)
    (h2329 : ((!((rowBit rows 0 5 0 && rowBit rows 0 5 3)) || ((rankAtom ranks 4 == rankAtom ranks 34)))) = true)
    (h2330 : ((!((rowBit rows 0 5 0 && rowBit rows 0 5 4)) || ((rankAtom ranks 4 == rankAtom ranks 42)))) = true)
    (h2331 : ((!((rowBit rows 0 5 0 && rowBit rows 0 5 6)) || ((rankAtom ranks 4 == rankAtom ranks 50)))) = true)
    (h2332 : ((!((rowBit rows 0 5 0 && rowBit rows 0 5 7)) || ((rankAtom ranks 4 == rankAtom ranks 51)))) = true)
    (h2333 : ((!((rowBit rows 0 5 0 && rowBit rows 0 5 8)) || ((rankAtom ranks 4 == rankAtom ranks 52)))) = true)
    (h2334 : ((!((rowBit rows 0 5 0 && rowBit rows 0 5 9)) || ((rankAtom ranks 4 == rankAtom ranks 53)))) = true)
    (h2335 : ((!((rowBit rows 0 5 0 && rowBit rows 0 5 10)) || ((rankAtom ranks 4 == rankAtom ranks 54)))) = true)
    (h2336 : ((!((rowBit rows 0 5 0 && rowBit rows 0 5 11)) || ((rankAtom ranks 4 == rankAtom ranks 55)))) = true)
    (h2337 : ((!((rowBit rows 0 5 0 && rowBit rows 0 5 12)) || ((rankAtom ranks 4 == rankAtom ranks 56)))) = true)
    (h2338 : ((!((rowBit rows 0 5 1 && rowBit rows 0 5 2)) || ((rankAtom ranks 15 == rankAtom ranks 25)))) = true)
    (h2339 : ((!((rowBit rows 0 5 1 && rowBit rows 0 5 3)) || ((rankAtom ranks 15 == rankAtom ranks 34)))) = true)
    (h2340 : ((!((rowBit rows 0 5 1 && rowBit rows 0 5 4)) || ((rankAtom ranks 15 == rankAtom ranks 42)))) = true)
    (h2341 : ((!((rowBit rows 0 5 1 && rowBit rows 0 5 6)) || ((rankAtom ranks 15 == rankAtom ranks 50)))) = true)
    (h2342 : ((!((rowBit rows 0 5 1 && rowBit rows 0 5 7)) || ((rankAtom ranks 15 == rankAtom ranks 51)))) = true)
    (h2343 : ((!((rowBit rows 0 5 1 && rowBit rows 0 5 8)) || ((rankAtom ranks 15 == rankAtom ranks 52)))) = true)
    (h2344 : ((!((rowBit rows 0 5 1 && rowBit rows 0 5 9)) || ((rankAtom ranks 15 == rankAtom ranks 53)))) = true)
    (h2345 : ((!((rowBit rows 0 5 1 && rowBit rows 0 5 10)) || ((rankAtom ranks 15 == rankAtom ranks 54)))) = true)
    (h2346 : ((!((rowBit rows 0 5 1 && rowBit rows 0 5 11)) || ((rankAtom ranks 15 == rankAtom ranks 55)))) = true)
    (h2347 : ((!((rowBit rows 0 5 1 && rowBit rows 0 5 12)) || ((rankAtom ranks 15 == rankAtom ranks 56)))) = true)
    (h2348 : ((!((rowBit rows 0 5 2 && rowBit rows 0 5 3)) || ((rankAtom ranks 25 == rankAtom ranks 34)))) = true)
    (h2349 : ((!((rowBit rows 0 5 2 && rowBit rows 0 5 4)) || ((rankAtom ranks 25 == rankAtom ranks 42)))) = true)
    (h2350 : ((!((rowBit rows 0 5 2 && rowBit rows 0 5 6)) || ((rankAtom ranks 25 == rankAtom ranks 50)))) = true)
    (h2351 : ((!((rowBit rows 0 5 2 && rowBit rows 0 5 7)) || ((rankAtom ranks 25 == rankAtom ranks 51)))) = true)
    (h2352 : ((!((rowBit rows 0 5 2 && rowBit rows 0 5 8)) || ((rankAtom ranks 25 == rankAtom ranks 52)))) = true)
    (h2353 : ((!((rowBit rows 0 5 2 && rowBit rows 0 5 9)) || ((rankAtom ranks 25 == rankAtom ranks 53)))) = true)
    (h2354 : ((!((rowBit rows 0 5 2 && rowBit rows 0 5 10)) || ((rankAtom ranks 25 == rankAtom ranks 54)))) = true)
    (h2355 : ((!((rowBit rows 0 5 2 && rowBit rows 0 5 11)) || ((rankAtom ranks 25 == rankAtom ranks 55)))) = true)
    (h2356 : ((!((rowBit rows 0 5 2 && rowBit rows 0 5 12)) || ((rankAtom ranks 25 == rankAtom ranks 56)))) = true)
    (h2357 : ((!((rowBit rows 0 5 3 && rowBit rows 0 5 4)) || ((rankAtom ranks 34 == rankAtom ranks 42)))) = true)
    (h2358 : ((!((rowBit rows 0 5 3 && rowBit rows 0 5 6)) || ((rankAtom ranks 34 == rankAtom ranks 50)))) = true)
    (h2359 : ((!((rowBit rows 0 5 3 && rowBit rows 0 5 7)) || ((rankAtom ranks 34 == rankAtom ranks 51)))) = true)
    (h2360 : ((!((rowBit rows 0 5 3 && rowBit rows 0 5 8)) || ((rankAtom ranks 34 == rankAtom ranks 52)))) = true)
    (h2361 : ((!((rowBit rows 0 5 3 && rowBit rows 0 5 9)) || ((rankAtom ranks 34 == rankAtom ranks 53)))) = true)
    (h2362 : ((!((rowBit rows 0 5 3 && rowBit rows 0 5 10)) || ((rankAtom ranks 34 == rankAtom ranks 54)))) = true)
    (h2363 : ((!((rowBit rows 0 5 3 && rowBit rows 0 5 11)) || ((rankAtom ranks 34 == rankAtom ranks 55)))) = true)
    (h2364 : ((!((rowBit rows 0 5 3 && rowBit rows 0 5 12)) || ((rankAtom ranks 34 == rankAtom ranks 56)))) = true)
    (h2365 : ((!((rowBit rows 0 5 4 && rowBit rows 0 5 6)) || ((rankAtom ranks 42 == rankAtom ranks 50)))) = true)
    (h2366 : ((!((rowBit rows 0 5 4 && rowBit rows 0 5 7)) || ((rankAtom ranks 42 == rankAtom ranks 51)))) = true)
    (h2367 : ((!((rowBit rows 0 5 4 && rowBit rows 0 5 8)) || ((rankAtom ranks 42 == rankAtom ranks 52)))) = true) :
    ∀ item ∈ sourceChunk036Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk036Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2304
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2305
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2306
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2307
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2308
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2309
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2310
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2311
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2312
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2313
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2314
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2315
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2316
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2317
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2318
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2319
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2320
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2321
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2322
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2323
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2324
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2325
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2326
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2327
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2328
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2329
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2330
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2331
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2332
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2333
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2334
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2335
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2336
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2337
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2338
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2339
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2340
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2341
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2342
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2343
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2344
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2345
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2346
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2347
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2348
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2349
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2350
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2351
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2352
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2353
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2354
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2355
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2356
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2357
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2358
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2359
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2360
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2361
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2362
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2363
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2364
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2365
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2366
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2367

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
