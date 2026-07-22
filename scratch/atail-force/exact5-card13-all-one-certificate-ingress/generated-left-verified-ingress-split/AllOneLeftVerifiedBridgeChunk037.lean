/-
Generated packed-source bridge for verified left chunk 037.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk037_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2368 : ((!((rowBit rows 0 5 4 && rowBit rows 0 5 9)) || ((rankAtom ranks 42 == rankAtom ranks 53)))) = true)
    (h2369 : ((!((rowBit rows 0 5 4 && rowBit rows 0 5 10)) || ((rankAtom ranks 42 == rankAtom ranks 54)))) = true)
    (h2370 : ((!((rowBit rows 0 5 4 && rowBit rows 0 5 11)) || ((rankAtom ranks 42 == rankAtom ranks 55)))) = true)
    (h2371 : ((!((rowBit rows 0 5 4 && rowBit rows 0 5 12)) || ((rankAtom ranks 42 == rankAtom ranks 56)))) = true)
    (h2372 : ((!((rowBit rows 0 5 6 && rowBit rows 0 5 7)) || ((rankAtom ranks 50 == rankAtom ranks 51)))) = true)
    (h2373 : ((!((rowBit rows 0 5 6 && rowBit rows 0 5 8)) || ((rankAtom ranks 50 == rankAtom ranks 52)))) = true)
    (h2374 : ((!((rowBit rows 0 5 6 && rowBit rows 0 5 9)) || ((rankAtom ranks 50 == rankAtom ranks 53)))) = true)
    (h2375 : ((!((rowBit rows 0 5 6 && rowBit rows 0 5 10)) || ((rankAtom ranks 50 == rankAtom ranks 54)))) = true)
    (h2376 : ((!((rowBit rows 0 5 6 && rowBit rows 0 5 11)) || ((rankAtom ranks 50 == rankAtom ranks 55)))) = true)
    (h2377 : ((!((rowBit rows 0 5 6 && rowBit rows 0 5 12)) || ((rankAtom ranks 50 == rankAtom ranks 56)))) = true)
    (h2378 : ((!((rowBit rows 0 5 7 && rowBit rows 0 5 8)) || ((rankAtom ranks 51 == rankAtom ranks 52)))) = true)
    (h2379 : ((!((rowBit rows 0 5 7 && rowBit rows 0 5 9)) || ((rankAtom ranks 51 == rankAtom ranks 53)))) = true)
    (h2380 : ((!((rowBit rows 0 5 7 && rowBit rows 0 5 10)) || ((rankAtom ranks 51 == rankAtom ranks 54)))) = true)
    (h2381 : ((!((rowBit rows 0 5 7 && rowBit rows 0 5 11)) || ((rankAtom ranks 51 == rankAtom ranks 55)))) = true)
    (h2382 : ((!((rowBit rows 0 5 7 && rowBit rows 0 5 12)) || ((rankAtom ranks 51 == rankAtom ranks 56)))) = true)
    (h2383 : ((!((rowBit rows 0 5 8 && rowBit rows 0 5 9)) || ((rankAtom ranks 52 == rankAtom ranks 53)))) = true)
    (h2384 : ((!((rowBit rows 0 5 8 && rowBit rows 0 5 10)) || ((rankAtom ranks 52 == rankAtom ranks 54)))) = true)
    (h2385 : ((!((rowBit rows 0 5 8 && rowBit rows 0 5 11)) || ((rankAtom ranks 52 == rankAtom ranks 55)))) = true)
    (h2386 : ((!((rowBit rows 0 5 8 && rowBit rows 0 5 12)) || ((rankAtom ranks 52 == rankAtom ranks 56)))) = true)
    (h2387 : ((!((rowBit rows 0 5 9 && rowBit rows 0 5 10)) || ((rankAtom ranks 53 == rankAtom ranks 54)))) = true)
    (h2388 : ((!((rowBit rows 0 5 9 && rowBit rows 0 5 11)) || ((rankAtom ranks 53 == rankAtom ranks 55)))) = true)
    (h2389 : ((!((rowBit rows 0 5 9 && rowBit rows 0 5 12)) || ((rankAtom ranks 53 == rankAtom ranks 56)))) = true)
    (h2390 : ((!((rowBit rows 0 5 10 && rowBit rows 0 5 11)) || ((rankAtom ranks 54 == rankAtom ranks 55)))) = true)
    (h2391 : ((!((rowBit rows 0 5 10 && rowBit rows 0 5 12)) || ((rankAtom ranks 54 == rankAtom ranks 56)))) = true)
    (h2392 : ((!((rowBit rows 0 5 11 && rowBit rows 0 5 12)) || ((rankAtom ranks 55 == rankAtom ranks 56)))) = true)
    (h2393 : ((!((rowBit rows 0 6 0 && rowBit rows 0 6 1)) || ((rankAtom ranks 5 == rankAtom ranks 16)))) = true)
    (h2394 : ((!((rowBit rows 0 6 0 && rowBit rows 0 6 2)) || ((rankAtom ranks 5 == rankAtom ranks 26)))) = true)
    (h2395 : ((!((rowBit rows 0 6 0 && rowBit rows 0 6 3)) || ((rankAtom ranks 5 == rankAtom ranks 35)))) = true)
    (h2396 : ((!((rowBit rows 0 6 0 && rowBit rows 0 6 4)) || ((rankAtom ranks 5 == rankAtom ranks 43)))) = true)
    (h2397 : ((!((rowBit rows 0 6 0 && rowBit rows 0 6 5)) || ((rankAtom ranks 5 == rankAtom ranks 50)))) = true)
    (h2398 : ((!((rowBit rows 0 6 0 && rowBit rows 0 6 7)) || ((rankAtom ranks 5 == rankAtom ranks 57)))) = true)
    (h2399 : ((!((rowBit rows 0 6 0 && rowBit rows 0 6 8)) || ((rankAtom ranks 5 == rankAtom ranks 58)))) = true)
    (h2400 : ((!((rowBit rows 0 6 0 && rowBit rows 0 6 9)) || ((rankAtom ranks 5 == rankAtom ranks 59)))) = true)
    (h2401 : ((!((rowBit rows 0 6 0 && rowBit rows 0 6 10)) || ((rankAtom ranks 5 == rankAtom ranks 60)))) = true)
    (h2402 : ((!((rowBit rows 0 6 0 && rowBit rows 0 6 11)) || ((rankAtom ranks 5 == rankAtom ranks 61)))) = true)
    (h2403 : ((!((rowBit rows 0 6 0 && rowBit rows 0 6 12)) || ((rankAtom ranks 5 == rankAtom ranks 62)))) = true)
    (h2404 : ((!((rowBit rows 0 6 1 && rowBit rows 0 6 2)) || ((rankAtom ranks 16 == rankAtom ranks 26)))) = true)
    (h2405 : ((!((rowBit rows 0 6 1 && rowBit rows 0 6 3)) || ((rankAtom ranks 16 == rankAtom ranks 35)))) = true)
    (h2406 : ((!((rowBit rows 0 6 1 && rowBit rows 0 6 4)) || ((rankAtom ranks 16 == rankAtom ranks 43)))) = true)
    (h2407 : ((!((rowBit rows 0 6 1 && rowBit rows 0 6 5)) || ((rankAtom ranks 16 == rankAtom ranks 50)))) = true)
    (h2408 : ((!((rowBit rows 0 6 1 && rowBit rows 0 6 7)) || ((rankAtom ranks 16 == rankAtom ranks 57)))) = true)
    (h2409 : ((!((rowBit rows 0 6 1 && rowBit rows 0 6 8)) || ((rankAtom ranks 16 == rankAtom ranks 58)))) = true)
    (h2410 : ((!((rowBit rows 0 6 1 && rowBit rows 0 6 9)) || ((rankAtom ranks 16 == rankAtom ranks 59)))) = true)
    (h2411 : ((!((rowBit rows 0 6 1 && rowBit rows 0 6 10)) || ((rankAtom ranks 16 == rankAtom ranks 60)))) = true)
    (h2412 : ((!((rowBit rows 0 6 1 && rowBit rows 0 6 11)) || ((rankAtom ranks 16 == rankAtom ranks 61)))) = true)
    (h2413 : ((!((rowBit rows 0 6 1 && rowBit rows 0 6 12)) || ((rankAtom ranks 16 == rankAtom ranks 62)))) = true)
    (h2414 : ((!((rowBit rows 0 6 2 && rowBit rows 0 6 3)) || ((rankAtom ranks 26 == rankAtom ranks 35)))) = true)
    (h2415 : ((!((rowBit rows 0 6 2 && rowBit rows 0 6 4)) || ((rankAtom ranks 26 == rankAtom ranks 43)))) = true)
    (h2416 : ((!((rowBit rows 0 6 2 && rowBit rows 0 6 5)) || ((rankAtom ranks 26 == rankAtom ranks 50)))) = true)
    (h2417 : ((!((rowBit rows 0 6 2 && rowBit rows 0 6 7)) || ((rankAtom ranks 26 == rankAtom ranks 57)))) = true)
    (h2418 : ((!((rowBit rows 0 6 2 && rowBit rows 0 6 8)) || ((rankAtom ranks 26 == rankAtom ranks 58)))) = true)
    (h2419 : ((!((rowBit rows 0 6 2 && rowBit rows 0 6 9)) || ((rankAtom ranks 26 == rankAtom ranks 59)))) = true)
    (h2420 : ((!((rowBit rows 0 6 2 && rowBit rows 0 6 10)) || ((rankAtom ranks 26 == rankAtom ranks 60)))) = true)
    (h2421 : ((!((rowBit rows 0 6 2 && rowBit rows 0 6 11)) || ((rankAtom ranks 26 == rankAtom ranks 61)))) = true)
    (h2422 : ((!((rowBit rows 0 6 2 && rowBit rows 0 6 12)) || ((rankAtom ranks 26 == rankAtom ranks 62)))) = true)
    (h2423 : ((!((rowBit rows 0 6 3 && rowBit rows 0 6 4)) || ((rankAtom ranks 35 == rankAtom ranks 43)))) = true)
    (h2424 : ((!((rowBit rows 0 6 3 && rowBit rows 0 6 5)) || ((rankAtom ranks 35 == rankAtom ranks 50)))) = true)
    (h2425 : ((!((rowBit rows 0 6 3 && rowBit rows 0 6 7)) || ((rankAtom ranks 35 == rankAtom ranks 57)))) = true)
    (h2426 : ((!((rowBit rows 0 6 3 && rowBit rows 0 6 8)) || ((rankAtom ranks 35 == rankAtom ranks 58)))) = true)
    (h2427 : ((!((rowBit rows 0 6 3 && rowBit rows 0 6 9)) || ((rankAtom ranks 35 == rankAtom ranks 59)))) = true)
    (h2428 : ((!((rowBit rows 0 6 3 && rowBit rows 0 6 10)) || ((rankAtom ranks 35 == rankAtom ranks 60)))) = true)
    (h2429 : ((!((rowBit rows 0 6 3 && rowBit rows 0 6 11)) || ((rankAtom ranks 35 == rankAtom ranks 61)))) = true)
    (h2430 : ((!((rowBit rows 0 6 3 && rowBit rows 0 6 12)) || ((rankAtom ranks 35 == rankAtom ranks 62)))) = true)
    (h2431 : ((!((rowBit rows 0 6 4 && rowBit rows 0 6 5)) || ((rankAtom ranks 43 == rankAtom ranks 50)))) = true) :
    ∀ item ∈ sourceChunk037Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk037Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2368
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2369
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2370
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2371
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2372
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2373
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2374
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2375
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2376
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2377
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2378
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2379
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2380
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2381
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2382
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2383
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2384
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2385
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2386
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2387
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2388
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2389
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2390
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2391
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2392
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2393
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2394
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2395
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2396
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2397
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2398
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2399
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2400
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2401
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2402
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2403
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2404
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2405
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2406
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2407
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2408
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2409
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2410
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2411
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2412
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2413
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2414
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2415
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2416
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2417
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2418
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2419
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2420
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2421
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2422
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2423
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2424
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2425
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2426
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2427
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2428
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2429
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2430
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2431

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
