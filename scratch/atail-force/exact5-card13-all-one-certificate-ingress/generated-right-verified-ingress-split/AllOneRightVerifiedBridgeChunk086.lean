/-
Generated packed-source bridge for verified right chunk 086.
-/
import AllOneRightVerifiedAssignment

namespace Problem97.ATailExactFiveCard13AllOneCertificate.Right

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false

theorem sourceChunk086_each_of_flat
    (rows : RowBits) (blockers : BlockerBits) (shell : ShellBits)
    (q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)
    (h5504 : ((!((rankAtom ranks 27 == rankAtom ranks 24)) || ((rankAtom ranks 65).ult (rankAtom ranks 47)))) = true)
    (h5505 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 65).ult (rankAtom ranks 27)))) = true)
    (h5506 : ((!((rankAtom ranks 47 == rankAtom ranks 65)) || ((rankAtom ranks 24).ult (rankAtom ranks 27)))) = true)
    (h5507 : ((!((rankAtom ranks 27 == rankAtom ranks 30)) || ((rankAtom ranks 44).ult (rankAtom ranks 47)))) = true)
    (h5508 : ((!((rankAtom ranks 47 == rankAtom ranks 30)) || ((rankAtom ranks 44).ult (rankAtom ranks 27)))) = true)
    (h5509 : ((!((rankAtom ranks 47 == rankAtom ranks 44)) || ((rankAtom ranks 30).ult (rankAtom ranks 27)))) = true)
    (h5510 : ((!((rankAtom ranks 27 == rankAtom ranks 24)) || ((rankAtom ranks 66).ult (rankAtom ranks 48)))) = true)
    (h5511 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 66).ult (rankAtom ranks 27)))) = true)
    (h5512 : ((!((rankAtom ranks 48 == rankAtom ranks 66)) || ((rankAtom ranks 24).ult (rankAtom ranks 27)))) = true)
    (h5513 : ((!((rankAtom ranks 27 == rankAtom ranks 31)) || ((rankAtom ranks 44).ult (rankAtom ranks 48)))) = true)
    (h5514 : ((!((rankAtom ranks 48 == rankAtom ranks 31)) || ((rankAtom ranks 44).ult (rankAtom ranks 27)))) = true)
    (h5515 : ((!((rankAtom ranks 48 == rankAtom ranks 44)) || ((rankAtom ranks 31).ult (rankAtom ranks 27)))) = true)
    (h5516 : ((!((rankAtom ranks 27 == rankAtom ranks 24)) || ((rankAtom ranks 67).ult (rankAtom ranks 49)))) = true)
    (h5517 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 67).ult (rankAtom ranks 27)))) = true)
    (h5518 : ((!((rankAtom ranks 27 == rankAtom ranks 32)) || ((rankAtom ranks 44).ult (rankAtom ranks 49)))) = true)
    (h5519 : ((!((rankAtom ranks 49 == rankAtom ranks 44)) || ((rankAtom ranks 32).ult (rankAtom ranks 27)))) = true)
    (h5520 : ((!((rankAtom ranks 28 == rankAtom ranks 24)) || ((rankAtom ranks 68).ult (rankAtom ranks 46)))) = true)
    (h5521 : ((!((rankAtom ranks 28 == rankAtom ranks 68)) || ((rankAtom ranks 24).ult (rankAtom ranks 46)))) = true)
    (h5522 : ((!((rankAtom ranks 46 == rankAtom ranks 24)) || ((rankAtom ranks 68).ult (rankAtom ranks 28)))) = true)
    (h5523 : ((!((rankAtom ranks 46 == rankAtom ranks 68)) || ((rankAtom ranks 24).ult (rankAtom ranks 28)))) = true)
    (h5524 : ((!((rankAtom ranks 28 == rankAtom ranks 29)) || ((rankAtom ranks 45).ult (rankAtom ranks 46)))) = true)
    (h5525 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 29).ult (rankAtom ranks 46)))) = true)
    (h5526 : ((!((rankAtom ranks 46 == rankAtom ranks 29)) || ((rankAtom ranks 45).ult (rankAtom ranks 28)))) = true)
    (h5527 : ((!((rankAtom ranks 46 == rankAtom ranks 45)) || ((rankAtom ranks 29).ult (rankAtom ranks 28)))) = true)
    (h5528 : ((!((rankAtom ranks 28 == rankAtom ranks 24)) || ((rankAtom ranks 69).ult (rankAtom ranks 47)))) = true)
    (h5529 : ((!((rankAtom ranks 28 == rankAtom ranks 69)) || ((rankAtom ranks 24).ult (rankAtom ranks 47)))) = true)
    (h5530 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 69).ult (rankAtom ranks 28)))) = true)
    (h5531 : ((!((rankAtom ranks 47 == rankAtom ranks 69)) || ((rankAtom ranks 24).ult (rankAtom ranks 28)))) = true)
    (h5532 : ((!((rankAtom ranks 28 == rankAtom ranks 30)) || ((rankAtom ranks 45).ult (rankAtom ranks 47)))) = true)
    (h5533 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 30).ult (rankAtom ranks 47)))) = true)
    (h5534 : ((!((rankAtom ranks 47 == rankAtom ranks 30)) || ((rankAtom ranks 45).ult (rankAtom ranks 28)))) = true)
    (h5535 : ((!((rankAtom ranks 47 == rankAtom ranks 45)) || ((rankAtom ranks 30).ult (rankAtom ranks 28)))) = true)
    (h5536 : ((!((rankAtom ranks 28 == rankAtom ranks 24)) || ((rankAtom ranks 70).ult (rankAtom ranks 48)))) = true)
    (h5537 : ((!((rankAtom ranks 28 == rankAtom ranks 70)) || ((rankAtom ranks 24).ult (rankAtom ranks 48)))) = true)
    (h5538 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 70).ult (rankAtom ranks 28)))) = true)
    (h5539 : ((!((rankAtom ranks 48 == rankAtom ranks 70)) || ((rankAtom ranks 24).ult (rankAtom ranks 28)))) = true)
    (h5540 : ((!((rankAtom ranks 28 == rankAtom ranks 31)) || ((rankAtom ranks 45).ult (rankAtom ranks 48)))) = true)
    (h5541 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 31).ult (rankAtom ranks 48)))) = true)
    (h5542 : ((!((rankAtom ranks 48 == rankAtom ranks 31)) || ((rankAtom ranks 45).ult (rankAtom ranks 28)))) = true)
    (h5543 : ((!((rankAtom ranks 48 == rankAtom ranks 45)) || ((rankAtom ranks 31).ult (rankAtom ranks 28)))) = true)
    (h5544 : ((!((rankAtom ranks 28 == rankAtom ranks 24)) || ((rankAtom ranks 71).ult (rankAtom ranks 49)))) = true)
    (h5545 : ((!((rankAtom ranks 28 == rankAtom ranks 71)) || ((rankAtom ranks 24).ult (rankAtom ranks 49)))) = true)
    (h5546 : ((!((rankAtom ranks 49 == rankAtom ranks 24)) || ((rankAtom ranks 71).ult (rankAtom ranks 28)))) = true)
    (h5547 : ((!((rankAtom ranks 28 == rankAtom ranks 32)) || ((rankAtom ranks 45).ult (rankAtom ranks 49)))) = true)
    (h5548 : ((!((rankAtom ranks 28 == rankAtom ranks 45)) || ((rankAtom ranks 32).ult (rankAtom ranks 49)))) = true)
    (h5549 : ((!((rankAtom ranks 49 == rankAtom ranks 45)) || ((rankAtom ranks 32).ult (rankAtom ranks 28)))) = true)
    (h5550 : ((!((rankAtom ranks 29 == rankAtom ranks 24)) || ((rankAtom ranks 72).ult (rankAtom ranks 47)))) = true)
    (h5551 : ((!((rankAtom ranks 29 == rankAtom ranks 72)) || ((rankAtom ranks 24).ult (rankAtom ranks 47)))) = true)
    (h5552 : ((!((rankAtom ranks 47 == rankAtom ranks 24)) || ((rankAtom ranks 72).ult (rankAtom ranks 29)))) = true)
    (h5553 : ((!((rankAtom ranks 47 == rankAtom ranks 72)) || ((rankAtom ranks 24).ult (rankAtom ranks 29)))) = true)
    (h5554 : ((!((rankAtom ranks 29 == rankAtom ranks 30)) || ((rankAtom ranks 46).ult (rankAtom ranks 47)))) = true)
    (h5555 : ((!((rankAtom ranks 29 == rankAtom ranks 46)) || ((rankAtom ranks 30).ult (rankAtom ranks 47)))) = true)
    (h5556 : ((!((rankAtom ranks 47 == rankAtom ranks 30)) || ((rankAtom ranks 46).ult (rankAtom ranks 29)))) = true)
    (h5557 : ((!((rankAtom ranks 47 == rankAtom ranks 46)) || ((rankAtom ranks 30).ult (rankAtom ranks 29)))) = true)
    (h5558 : ((!((rankAtom ranks 29 == rankAtom ranks 24)) || ((rankAtom ranks 73).ult (rankAtom ranks 48)))) = true)
    (h5559 : ((!((rankAtom ranks 29 == rankAtom ranks 73)) || ((rankAtom ranks 24).ult (rankAtom ranks 48)))) = true)
    (h5560 : ((!((rankAtom ranks 48 == rankAtom ranks 24)) || ((rankAtom ranks 73).ult (rankAtom ranks 29)))) = true)
    (h5561 : ((!((rankAtom ranks 48 == rankAtom ranks 73)) || ((rankAtom ranks 24).ult (rankAtom ranks 29)))) = true)
    (h5562 : ((!((rankAtom ranks 29 == rankAtom ranks 31)) || ((rankAtom ranks 46).ult (rankAtom ranks 48)))) = true)
    (h5563 : ((!((rankAtom ranks 29 == rankAtom ranks 46)) || ((rankAtom ranks 31).ult (rankAtom ranks 48)))) = true)
    (h5564 : ((!((rankAtom ranks 48 == rankAtom ranks 31)) || ((rankAtom ranks 46).ult (rankAtom ranks 29)))) = true)
    (h5565 : ((!((rankAtom ranks 48 == rankAtom ranks 46)) || ((rankAtom ranks 31).ult (rankAtom ranks 29)))) = true)
    (h5566 : ((!((rankAtom ranks 29 == rankAtom ranks 24)) || ((rankAtom ranks 74).ult (rankAtom ranks 49)))) = true)
    (h5567 : ((!((rankAtom ranks 29 == rankAtom ranks 74)) || ((rankAtom ranks 24).ult (rankAtom ranks 49)))) = true) :
    ∀ item ∈ sourceChunk086Assertions,
      item.eval (sourceAssignment rows blockers shell q w b1 ranks) = true := by
  intro item hitem
  simp only [sourceChunk086Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
  rcases hitem with (rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl)
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5504
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5505
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5506
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5507
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5508
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5509
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5510
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5511
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5512
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5513
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5514
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5515
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5516
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5517
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5518
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5519
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5520
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5521
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5522
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5523
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5524
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5525
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5526
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5527
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5528
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5529
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5530
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5531
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5532
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5533
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5534
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5535
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5536
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5537
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5538
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5539
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5540
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5541
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5542
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5543
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5544
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5545
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5546
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5547
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5548
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5549
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5550
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5551
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5552
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5553
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5554
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5555
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5556
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5557
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5558
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5559
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5560
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5561
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5562
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5563
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5564
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5565
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5566
  · simpa [bvar, bnot, band, bor, bbeq, bimplies, bveq, bvult, bvule, bands, bors, atLeast, atMost, exactly, Gate.eval, and_assoc, or_assoc, BitVec.ule_eq_not_ult] using h5567

end Problem97.ATailExactFiveCard13AllOneCertificate.Right
