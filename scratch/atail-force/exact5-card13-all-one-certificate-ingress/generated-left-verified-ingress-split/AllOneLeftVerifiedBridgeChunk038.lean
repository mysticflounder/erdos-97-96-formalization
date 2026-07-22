/-
Generated packed-source bridge for verified left chunk 038.
-/
import AllOneLeftVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Left

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk038_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h2432 : ((!((rowBit rows 0 6 4 && rowBit rows 0 6 7)) || ((rankAtom ranks 43 == rankAtom ranks 57)))) = true)
    (h2433 : ((!((rowBit rows 0 6 4 && rowBit rows 0 6 8)) || ((rankAtom ranks 43 == rankAtom ranks 58)))) = true)
    (h2434 : ((!((rowBit rows 0 6 4 && rowBit rows 0 6 9)) || ((rankAtom ranks 43 == rankAtom ranks 59)))) = true)
    (h2435 : ((!((rowBit rows 0 6 4 && rowBit rows 0 6 10)) || ((rankAtom ranks 43 == rankAtom ranks 60)))) = true)
    (h2436 : ((!((rowBit rows 0 6 4 && rowBit rows 0 6 11)) || ((rankAtom ranks 43 == rankAtom ranks 61)))) = true)
    (h2437 : ((!((rowBit rows 0 6 4 && rowBit rows 0 6 12)) || ((rankAtom ranks 43 == rankAtom ranks 62)))) = true)
    (h2438 : ((!((rowBit rows 0 6 5 && rowBit rows 0 6 7)) || ((rankAtom ranks 50 == rankAtom ranks 57)))) = true)
    (h2439 : ((!((rowBit rows 0 6 5 && rowBit rows 0 6 8)) || ((rankAtom ranks 50 == rankAtom ranks 58)))) = true)
    (h2440 : ((!((rowBit rows 0 6 5 && rowBit rows 0 6 9)) || ((rankAtom ranks 50 == rankAtom ranks 59)))) = true)
    (h2441 : ((!((rowBit rows 0 6 5 && rowBit rows 0 6 10)) || ((rankAtom ranks 50 == rankAtom ranks 60)))) = true)
    (h2442 : ((!((rowBit rows 0 6 5 && rowBit rows 0 6 11)) || ((rankAtom ranks 50 == rankAtom ranks 61)))) = true)
    (h2443 : ((!((rowBit rows 0 6 5 && rowBit rows 0 6 12)) || ((rankAtom ranks 50 == rankAtom ranks 62)))) = true)
    (h2444 : ((!((rowBit rows 0 6 7 && rowBit rows 0 6 8)) || ((rankAtom ranks 57 == rankAtom ranks 58)))) = true)
    (h2445 : ((!((rowBit rows 0 6 7 && rowBit rows 0 6 9)) || ((rankAtom ranks 57 == rankAtom ranks 59)))) = true)
    (h2446 : ((!((rowBit rows 0 6 7 && rowBit rows 0 6 10)) || ((rankAtom ranks 57 == rankAtom ranks 60)))) = true)
    (h2447 : ((!((rowBit rows 0 6 7 && rowBit rows 0 6 11)) || ((rankAtom ranks 57 == rankAtom ranks 61)))) = true)
    (h2448 : ((!((rowBit rows 0 6 7 && rowBit rows 0 6 12)) || ((rankAtom ranks 57 == rankAtom ranks 62)))) = true)
    (h2449 : ((!((rowBit rows 0 6 8 && rowBit rows 0 6 9)) || ((rankAtom ranks 58 == rankAtom ranks 59)))) = true)
    (h2450 : ((!((rowBit rows 0 6 8 && rowBit rows 0 6 10)) || ((rankAtom ranks 58 == rankAtom ranks 60)))) = true)
    (h2451 : ((!((rowBit rows 0 6 8 && rowBit rows 0 6 11)) || ((rankAtom ranks 58 == rankAtom ranks 61)))) = true)
    (h2452 : ((!((rowBit rows 0 6 8 && rowBit rows 0 6 12)) || ((rankAtom ranks 58 == rankAtom ranks 62)))) = true)
    (h2453 : ((!((rowBit rows 0 6 9 && rowBit rows 0 6 10)) || ((rankAtom ranks 59 == rankAtom ranks 60)))) = true)
    (h2454 : ((!((rowBit rows 0 6 9 && rowBit rows 0 6 11)) || ((rankAtom ranks 59 == rankAtom ranks 61)))) = true)
    (h2455 : ((!((rowBit rows 0 6 9 && rowBit rows 0 6 12)) || ((rankAtom ranks 59 == rankAtom ranks 62)))) = true)
    (h2456 : ((!((rowBit rows 0 6 10 && rowBit rows 0 6 11)) || ((rankAtom ranks 60 == rankAtom ranks 61)))) = true)
    (h2457 : ((!((rowBit rows 0 6 10 && rowBit rows 0 6 12)) || ((rankAtom ranks 60 == rankAtom ranks 62)))) = true)
    (h2458 : ((!((rowBit rows 0 6 11 && rowBit rows 0 6 12)) || ((rankAtom ranks 61 == rankAtom ranks 62)))) = true)
    (h2459 : ((!((rowBit rows 0 7 0 && rowBit rows 0 7 1)) || ((rankAtom ranks 6 == rankAtom ranks 17)))) = true)
    (h2460 : ((!((rowBit rows 0 7 0 && rowBit rows 0 7 2)) || ((rankAtom ranks 6 == rankAtom ranks 27)))) = true)
    (h2461 : ((!((rowBit rows 0 7 0 && rowBit rows 0 7 3)) || ((rankAtom ranks 6 == rankAtom ranks 36)))) = true)
    (h2462 : ((!((rowBit rows 0 7 0 && rowBit rows 0 7 4)) || ((rankAtom ranks 6 == rankAtom ranks 44)))) = true)
    (h2463 : ((!((rowBit rows 0 7 0 && rowBit rows 0 7 5)) || ((rankAtom ranks 6 == rankAtom ranks 51)))) = true)
    (h2464 : ((!((rowBit rows 0 7 0 && rowBit rows 0 7 6)) || ((rankAtom ranks 6 == rankAtom ranks 57)))) = true)
    (h2465 : ((!((rowBit rows 0 7 0 && rowBit rows 0 7 8)) || ((rankAtom ranks 6 == rankAtom ranks 63)))) = true)
    (h2466 : ((!((rowBit rows 0 7 0 && rowBit rows 0 7 10)) || ((rankAtom ranks 6 == rankAtom ranks 65)))) = true)
    (h2467 : ((!((rowBit rows 0 7 0 && rowBit rows 0 7 11)) || ((rankAtom ranks 6 == rankAtom ranks 66)))) = true)
    (h2468 : ((!((rowBit rows 0 7 0 && rowBit rows 0 7 12)) || ((rankAtom ranks 6 == rankAtom ranks 67)))) = true)
    (h2469 : ((!((rowBit rows 0 7 1 && rowBit rows 0 7 2)) || ((rankAtom ranks 17 == rankAtom ranks 27)))) = true)
    (h2470 : ((!((rowBit rows 0 7 1 && rowBit rows 0 7 3)) || ((rankAtom ranks 17 == rankAtom ranks 36)))) = true)
    (h2471 : ((!((rowBit rows 0 7 1 && rowBit rows 0 7 6)) || ((rankAtom ranks 17 == rankAtom ranks 57)))) = true)
    (h2472 : ((!((rowBit rows 0 7 1 && rowBit rows 0 7 8)) || ((rankAtom ranks 17 == rankAtom ranks 63)))) = true)
    (h2473 : ((!((rowBit rows 0 7 1 && rowBit rows 0 7 9)) || ((rankAtom ranks 17 == rankAtom ranks 64)))) = true)
    (h2474 : ((!((rowBit rows 0 7 1 && rowBit rows 0 7 10)) || ((rankAtom ranks 17 == rankAtom ranks 65)))) = true)
    (h2475 : ((!((rowBit rows 0 7 1 && rowBit rows 0 7 11)) || ((rankAtom ranks 17 == rankAtom ranks 66)))) = true)
    (h2476 : ((!((rowBit rows 0 7 2 && rowBit rows 0 7 3)) || ((rankAtom ranks 27 == rankAtom ranks 36)))) = true)
    (h2477 : ((!((rowBit rows 0 7 2 && rowBit rows 0 7 5)) || ((rankAtom ranks 27 == rankAtom ranks 51)))) = true)
    (h2478 : ((!((rowBit rows 0 7 2 && rowBit rows 0 7 6)) || ((rankAtom ranks 27 == rankAtom ranks 57)))) = true)
    (h2479 : ((!((rowBit rows 0 7 2 && rowBit rows 0 7 8)) || ((rankAtom ranks 27 == rankAtom ranks 63)))) = true)
    (h2480 : ((!((rowBit rows 0 7 2 && rowBit rows 0 7 9)) || ((rankAtom ranks 27 == rankAtom ranks 64)))) = true)
    (h2481 : ((!((rowBit rows 0 7 2 && rowBit rows 0 7 10)) || ((rankAtom ranks 27 == rankAtom ranks 65)))) = true)
    (h2482 : ((!((rowBit rows 0 7 2 && rowBit rows 0 7 11)) || ((rankAtom ranks 27 == rankAtom ranks 66)))) = true)
    (h2483 : ((!((rowBit rows 0 7 3 && rowBit rows 0 7 4)) || ((rankAtom ranks 36 == rankAtom ranks 44)))) = true)
    (h2484 : ((!((rowBit rows 0 7 3 && rowBit rows 0 7 5)) || ((rankAtom ranks 36 == rankAtom ranks 51)))) = true)
    (h2485 : ((!((rowBit rows 0 7 3 && rowBit rows 0 7 6)) || ((rankAtom ranks 36 == rankAtom ranks 57)))) = true)
    (h2486 : ((!((rowBit rows 0 7 3 && rowBit rows 0 7 8)) || ((rankAtom ranks 36 == rankAtom ranks 63)))) = true)
    (h2487 : ((!((rowBit rows 0 7 3 && rowBit rows 0 7 9)) || ((rankAtom ranks 36 == rankAtom ranks 64)))) = true)
    (h2488 : ((!((rowBit rows 0 7 3 && rowBit rows 0 7 10)) || ((rankAtom ranks 36 == rankAtom ranks 65)))) = true)
    (h2489 : ((!((rowBit rows 0 7 3 && rowBit rows 0 7 11)) || ((rankAtom ranks 36 == rankAtom ranks 66)))) = true)
    (h2490 : ((!((rowBit rows 0 7 4 && rowBit rows 0 7 5)) || ((rankAtom ranks 44 == rankAtom ranks 51)))) = true)
    (h2491 : ((!((rowBit rows 0 7 4 && rowBit rows 0 7 6)) || ((rankAtom ranks 44 == rankAtom ranks 57)))) = true)
    (h2492 : ((!((rowBit rows 0 7 4 && rowBit rows 0 7 8)) || ((rankAtom ranks 44 == rankAtom ranks 63)))) = true)
    (h2493 : ((!((rowBit rows 0 7 4 && rowBit rows 0 7 9)) || ((rankAtom ranks 44 == rankAtom ranks 64)))) = true)
    (h2494 : ((!((rowBit rows 0 7 4 && rowBit rows 0 7 10)) || ((rankAtom ranks 44 == rankAtom ranks 65)))) = true)
    (h2495 : ((!((rowBit rows 0 7 4 && rowBit rows 0 7 11)) || ((rankAtom ranks 44 == rankAtom ranks 66)))) = true) :
    ∀ item ∈ sourceChunk038Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk038Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2432
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2433
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2434
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2435
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2436
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2437
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2438
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2439
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2440
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2441
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2442
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2443
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2444
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2445
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2446
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2447
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2448
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2449
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2450
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2451
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2452
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2453
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2454
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2455
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2456
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2457
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2458
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2459
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2460
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2461
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2462
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2463
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2464
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2465
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2466
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2467
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2468
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2469
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2470
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2471
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2472
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2473
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2474
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2475
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2476
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2477
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2478
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2479
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2480
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2481
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2482
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2483
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2484
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2485
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2486
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2487
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2488
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2489
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2490
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2491
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2492
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2493
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2494
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h2495

end Problem97.ATailExactFiveCard13AllOneCertificate.Left
