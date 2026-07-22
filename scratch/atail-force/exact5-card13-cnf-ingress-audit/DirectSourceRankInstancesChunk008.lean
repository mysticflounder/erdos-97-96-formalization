/-
Generated deterministically from `direct.source-core.pass5.json`.

Each theorem concludes one literal packed-source assertion from h0170--h1898
and proves it through the generic source facts in `DirectSourceRankFacts`.
-/
import DirectSourceRankFacts

/-!
# Exact pass-5 rank-source instances

This generated module specializes the generic source lemmas to the literal
packed assertions `h0170`--`h1898` selected by the direct pass-5 core.
-/

namespace Problem97
namespace ATailExactFiveCard13CnfIngressScratch

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailKalmansonParentOrderScratch
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable

attribute [local instance] Classical.propDecidable

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

noncomputable section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}

/-- Exact pass-5 source assertion `h0512` (first). -/
theorem directSource_h0512 :
    ((!((firstRowBit (directSourceFirstRow T) 6 && firstRowBit (directSourceFirstRow T) 11)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_firstRow_rank_guard
    (6 : Fin 13) (11 : Fin 13)
    (43 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0513` (first). -/
theorem directSource_h0513 :
    ((!((firstRowBit (directSourceFirstRow T) 6 && firstRowBit (directSourceFirstRow T) 12)) || ((rankAtom (directSourceRanks P) 43 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_firstRow_rank_guard
    (6 : Fin 13) (12 : Fin 13)
    (43 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (43 : Fin 78) (4 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0514` (first). -/
theorem directSource_h0514 :
    ((!((firstRowBit (directSourceFirstRow T) 7 && firstRowBit (directSourceFirstRow T) 9)) || ((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_firstRow_rank_guard
    (7 : Fin 13) (9 : Fin 13)
    (44 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (4 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0515` (first). -/
theorem directSource_h0515 :
    ((!((firstRowBit (directSourceFirstRow T) 7 && firstRowBit (directSourceFirstRow T) 10)) || ((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_firstRow_rank_guard
    (7 : Fin 13) (10 : Fin 13)
    (44 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (4 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0516` (first). -/
theorem directSource_h0516 :
    ((!((firstRowBit (directSourceFirstRow T) 7 && firstRowBit (directSourceFirstRow T) 11)) || ((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_firstRow_rank_guard
    (7 : Fin 13) (11 : Fin 13)
    (44 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (4 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0517` (first). -/
theorem directSource_h0517 :
    ((!((firstRowBit (directSourceFirstRow T) 7 && firstRowBit (directSourceFirstRow T) 12)) || ((rankAtom (directSourceRanks P) 44 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_firstRow_rank_guard
    (7 : Fin 13) (12 : Fin 13)
    (44 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (44 : Fin 78) (4 : Fin 13) (7 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0518` (first). -/
theorem directSource_h0518 :
    ((!((firstRowBit (directSourceFirstRow T) 8 && firstRowBit (directSourceFirstRow T) 9)) || ((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 46)))) = true := by
  exact directSource_firstRow_rank_guard
    (8 : Fin 13) (9 : Fin 13)
    (45 : Fin 78) (46 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (4 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0519` (first). -/
theorem directSource_h0519 :
    ((!((firstRowBit (directSourceFirstRow T) 8 && firstRowBit (directSourceFirstRow T) 10)) || ((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_firstRow_rank_guard
    (8 : Fin 13) (10 : Fin 13)
    (45 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (4 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0520` (first). -/
theorem directSource_h0520 :
    ((!((firstRowBit (directSourceFirstRow T) 8 && firstRowBit (directSourceFirstRow T) 11)) || ((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_firstRow_rank_guard
    (8 : Fin 13) (11 : Fin 13)
    (45 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (4 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0521` (first). -/
theorem directSource_h0521 :
    ((!((firstRowBit (directSourceFirstRow T) 8 && firstRowBit (directSourceFirstRow T) 12)) || ((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_firstRow_rank_guard
    (8 : Fin 13) (12 : Fin 13)
    (45 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (4 : Fin 13) (8 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0522` (first). -/
theorem directSource_h0522 :
    ((!((firstRowBit (directSourceFirstRow T) 9 && firstRowBit (directSourceFirstRow T) 10)) || ((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 47)))) = true := by
  exact directSource_firstRow_rank_guard
    (9 : Fin 13) (10 : Fin 13)
    (46 : Fin 78) (47 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0523` (first). -/
theorem directSource_h0523 :
    ((!((firstRowBit (directSourceFirstRow T) 9 && firstRowBit (directSourceFirstRow T) 11)) || ((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_firstRow_rank_guard
    (9 : Fin 13) (11 : Fin 13)
    (46 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0524` (first). -/
theorem directSource_h0524 :
    ((!((firstRowBit (directSourceFirstRow T) 9 && firstRowBit (directSourceFirstRow T) 12)) || ((rankAtom (directSourceRanks P) 46 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_firstRow_rank_guard
    (9 : Fin 13) (12 : Fin 13)
    (46 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (46 : Fin 78) (4 : Fin 13) (9 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0525` (first). -/
theorem directSource_h0525 :
    ((!((firstRowBit (directSourceFirstRow T) 10 && firstRowBit (directSourceFirstRow T) 11)) || ((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 48)))) = true := by
  exact directSource_firstRow_rank_guard
    (10 : Fin 13) (11 : Fin 13)
    (47 : Fin 78) (48 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0526` (first). -/
theorem directSource_h0526 :
    ((!((firstRowBit (directSourceFirstRow T) 10 && firstRowBit (directSourceFirstRow T) 12)) || ((rankAtom (directSourceRanks P) 47 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_firstRow_rank_guard
    (10 : Fin 13) (12 : Fin 13)
    (47 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (47 : Fin 78) (4 : Fin 13) (10 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0527` (first). -/
theorem directSource_h0527 :
    ((!((firstRowBit (directSourceFirstRow T) 11 && firstRowBit (directSourceFirstRow T) 12)) || ((rankAtom (directSourceRanks P) 48 == rankAtom (directSourceRanks P) 49)))) = true := by
  exact directSource_firstRow_rank_guard
    (11 : Fin 13) (12 : Fin 13)
    (48 : Fin 78) (49 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (48 : Fin 78) (4 : Fin 13) (11 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (49 : Fin 78) (4 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0528` (shell). -/
theorem directSource_h0528 :
    ((!((shellBit (directSourceShell T) 0 && shellBit (directSourceShell T) 1)) || ((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 18)))) = true := by
  exact directSource_shell_rank_guard
    (0 : Fin 13) (1 : Fin 13)
    (7 : Fin 78) (18 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (8 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (8 : Fin 13) (1 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0529` (shell). -/
theorem directSource_h0529 :
    ((!((shellBit (directSourceShell T) 0 && shellBit (directSourceShell T) 2)) || ((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 28)))) = true := by
  exact directSource_shell_rank_guard
    (0 : Fin 13) (2 : Fin 13)
    (7 : Fin 78) (28 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (8 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (8 : Fin 13) (2 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0530` (shell). -/
theorem directSource_h0530 :
    ((!((shellBit (directSourceShell T) 0 && shellBit (directSourceShell T) 3)) || ((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 37)))) = true := by
  exact directSource_shell_rank_guard
    (0 : Fin 13) (3 : Fin 13)
    (7 : Fin 78) (37 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (8 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (37 : Fin 78) (8 : Fin 13) (3 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0531` (shell). -/
theorem directSource_h0531 :
    ((!((shellBit (directSourceShell T) 0 && shellBit (directSourceShell T) 4)) || ((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 45)))) = true := by
  exact directSource_shell_rank_guard
    (0 : Fin 13) (4 : Fin 13)
    (7 : Fin 78) (45 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (8 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (8 : Fin 13) (4 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0532` (shell). -/
theorem directSource_h0532 :
    ((!((shellBit (directSourceShell T) 0 && shellBit (directSourceShell T) 5)) || ((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 52)))) = true := by
  exact directSource_shell_rank_guard
    (0 : Fin 13) (5 : Fin 13)
    (7 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (8 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (8 : Fin 13) (5 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0533` (shell). -/
theorem directSource_h0533 :
    ((!((shellBit (directSourceShell T) 0 && shellBit (directSourceShell T) 6)) || ((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 58)))) = true := by
  exact directSource_shell_rank_guard
    (0 : Fin 13) (6 : Fin 13)
    (7 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (8 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (8 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0534` (shell). -/
theorem directSource_h0534 :
    ((!((shellBit (directSourceShell T) 0 && shellBit (directSourceShell T) 7)) || ((rankAtom (directSourceRanks P) 7 == rankAtom (directSourceRanks P) 63)))) = true := by
  exact directSource_shell_rank_guard
    (0 : Fin 13) (7 : Fin 13)
    (7 : Fin 78) (63 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (7 : Fin 78) (8 : Fin 13) (0 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (8 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0535` (shell). -/
theorem directSource_h0535 :
    ((!((shellBit (directSourceShell T) 1 && shellBit (directSourceShell T) 2)) || ((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 28)))) = true := by
  exact directSource_shell_rank_guard
    (1 : Fin 13) (2 : Fin 13)
    (18 : Fin 78) (28 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (8 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (8 : Fin 13) (2 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0536` (shell). -/
theorem directSource_h0536 :
    ((!((shellBit (directSourceShell T) 1 && shellBit (directSourceShell T) 3)) || ((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 37)))) = true := by
  exact directSource_shell_rank_guard
    (1 : Fin 13) (3 : Fin 13)
    (18 : Fin 78) (37 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (8 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (37 : Fin 78) (8 : Fin 13) (3 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0537` (shell). -/
theorem directSource_h0537 :
    ((!((shellBit (directSourceShell T) 1 && shellBit (directSourceShell T) 4)) || ((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 45)))) = true := by
  exact directSource_shell_rank_guard
    (1 : Fin 13) (4 : Fin 13)
    (18 : Fin 78) (45 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (8 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (8 : Fin 13) (4 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0538` (shell). -/
theorem directSource_h0538 :
    ((!((shellBit (directSourceShell T) 1 && shellBit (directSourceShell T) 5)) || ((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 52)))) = true := by
  exact directSource_shell_rank_guard
    (1 : Fin 13) (5 : Fin 13)
    (18 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (8 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (8 : Fin 13) (5 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0539` (shell). -/
theorem directSource_h0539 :
    ((!((shellBit (directSourceShell T) 1 && shellBit (directSourceShell T) 6)) || ((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 58)))) = true := by
  exact directSource_shell_rank_guard
    (1 : Fin 13) (6 : Fin 13)
    (18 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (8 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (8 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0540` (shell). -/
theorem directSource_h0540 :
    ((!((shellBit (directSourceShell T) 1 && shellBit (directSourceShell T) 7)) || ((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 63)))) = true := by
  exact directSource_shell_rank_guard
    (1 : Fin 13) (7 : Fin 13)
    (18 : Fin 78) (63 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (8 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (8 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0541` (shell). -/
theorem directSource_h0541 :
    ((!((shellBit (directSourceShell T) 1 && shellBit (directSourceShell T) 9)) || ((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 68)))) = true := by
  exact directSource_shell_rank_guard
    (1 : Fin 13) (9 : Fin 13)
    (18 : Fin 78) (68 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (8 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (68 : Fin 78) (8 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0542` (shell). -/
theorem directSource_h0542 :
    ((!((shellBit (directSourceShell T) 1 && shellBit (directSourceShell T) 10)) || ((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 69)))) = true := by
  exact directSource_shell_rank_guard
    (1 : Fin 13) (10 : Fin 13)
    (18 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (8 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (8 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0543` (shell). -/
theorem directSource_h0543 :
    ((!((shellBit (directSourceShell T) 1 && shellBit (directSourceShell T) 11)) || ((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 70)))) = true := by
  exact directSource_shell_rank_guard
    (1 : Fin 13) (11 : Fin 13)
    (18 : Fin 78) (70 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (8 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (70 : Fin 78) (8 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0544` (shell). -/
theorem directSource_h0544 :
    ((!((shellBit (directSourceShell T) 1 && shellBit (directSourceShell T) 12)) || ((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 71)))) = true := by
  exact directSource_shell_rank_guard
    (1 : Fin 13) (12 : Fin 13)
    (18 : Fin 78) (71 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (18 : Fin 78) (8 : Fin 13) (1 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (71 : Fin 78) (8 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0545` (shell). -/
theorem directSource_h0545 :
    ((!((shellBit (directSourceShell T) 2 && shellBit (directSourceShell T) 3)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 37)))) = true := by
  exact directSource_shell_rank_guard
    (2 : Fin 13) (3 : Fin 13)
    (28 : Fin 78) (37 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (8 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (37 : Fin 78) (8 : Fin 13) (3 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0546` (shell). -/
theorem directSource_h0546 :
    ((!((shellBit (directSourceShell T) 2 && shellBit (directSourceShell T) 4)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 45)))) = true := by
  exact directSource_shell_rank_guard
    (2 : Fin 13) (4 : Fin 13)
    (28 : Fin 78) (45 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (8 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (8 : Fin 13) (4 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0547` (shell). -/
theorem directSource_h0547 :
    ((!((shellBit (directSourceShell T) 2 && shellBit (directSourceShell T) 5)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 52)))) = true := by
  exact directSource_shell_rank_guard
    (2 : Fin 13) (5 : Fin 13)
    (28 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (8 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (8 : Fin 13) (5 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0548` (shell). -/
theorem directSource_h0548 :
    ((!((shellBit (directSourceShell T) 2 && shellBit (directSourceShell T) 6)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 58)))) = true := by
  exact directSource_shell_rank_guard
    (2 : Fin 13) (6 : Fin 13)
    (28 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (8 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (8 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0549` (shell). -/
theorem directSource_h0549 :
    ((!((shellBit (directSourceShell T) 2 && shellBit (directSourceShell T) 7)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 63)))) = true := by
  exact directSource_shell_rank_guard
    (2 : Fin 13) (7 : Fin 13)
    (28 : Fin 78) (63 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (8 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (8 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0550` (shell). -/
theorem directSource_h0550 :
    ((!((shellBit (directSourceShell T) 2 && shellBit (directSourceShell T) 9)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 68)))) = true := by
  exact directSource_shell_rank_guard
    (2 : Fin 13) (9 : Fin 13)
    (28 : Fin 78) (68 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (8 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (68 : Fin 78) (8 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0551` (shell). -/
theorem directSource_h0551 :
    ((!((shellBit (directSourceShell T) 2 && shellBit (directSourceShell T) 10)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 69)))) = true := by
  exact directSource_shell_rank_guard
    (2 : Fin 13) (10 : Fin 13)
    (28 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (8 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (8 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0552` (shell). -/
theorem directSource_h0552 :
    ((!((shellBit (directSourceShell T) 2 && shellBit (directSourceShell T) 11)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 70)))) = true := by
  exact directSource_shell_rank_guard
    (2 : Fin 13) (11 : Fin 13)
    (28 : Fin 78) (70 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (8 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (70 : Fin 78) (8 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0553` (shell). -/
theorem directSource_h0553 :
    ((!((shellBit (directSourceShell T) 2 && shellBit (directSourceShell T) 12)) || ((rankAtom (directSourceRanks P) 28 == rankAtom (directSourceRanks P) 71)))) = true := by
  exact directSource_shell_rank_guard
    (2 : Fin 13) (12 : Fin 13)
    (28 : Fin 78) (71 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (28 : Fin 78) (8 : Fin 13) (2 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (71 : Fin 78) (8 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0554` (shell). -/
theorem directSource_h0554 :
    ((!((shellBit (directSourceShell T) 3 && shellBit (directSourceShell T) 4)) || ((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 45)))) = true := by
  exact directSource_shell_rank_guard
    (3 : Fin 13) (4 : Fin 13)
    (37 : Fin 78) (45 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (37 : Fin 78) (8 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (8 : Fin 13) (4 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0555` (shell). -/
theorem directSource_h0555 :
    ((!((shellBit (directSourceShell T) 3 && shellBit (directSourceShell T) 5)) || ((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 52)))) = true := by
  exact directSource_shell_rank_guard
    (3 : Fin 13) (5 : Fin 13)
    (37 : Fin 78) (52 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (37 : Fin 78) (8 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (8 : Fin 13) (5 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0556` (shell). -/
theorem directSource_h0556 :
    ((!((shellBit (directSourceShell T) 3 && shellBit (directSourceShell T) 6)) || ((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 58)))) = true := by
  exact directSource_shell_rank_guard
    (3 : Fin 13) (6 : Fin 13)
    (37 : Fin 78) (58 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (37 : Fin 78) (8 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (8 : Fin 13) (6 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0557` (shell). -/
theorem directSource_h0557 :
    ((!((shellBit (directSourceShell T) 3 && shellBit (directSourceShell T) 7)) || ((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 63)))) = true := by
  exact directSource_shell_rank_guard
    (3 : Fin 13) (7 : Fin 13)
    (37 : Fin 78) (63 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (37 : Fin 78) (8 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (8 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0558` (shell). -/
theorem directSource_h0558 :
    ((!((shellBit (directSourceShell T) 3 && shellBit (directSourceShell T) 9)) || ((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 68)))) = true := by
  exact directSource_shell_rank_guard
    (3 : Fin 13) (9 : Fin 13)
    (37 : Fin 78) (68 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (37 : Fin 78) (8 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (68 : Fin 78) (8 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0559` (shell). -/
theorem directSource_h0559 :
    ((!((shellBit (directSourceShell T) 3 && shellBit (directSourceShell T) 10)) || ((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 69)))) = true := by
  exact directSource_shell_rank_guard
    (3 : Fin 13) (10 : Fin 13)
    (37 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (37 : Fin 78) (8 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (8 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0560` (shell). -/
theorem directSource_h0560 :
    ((!((shellBit (directSourceShell T) 3 && shellBit (directSourceShell T) 11)) || ((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 70)))) = true := by
  exact directSource_shell_rank_guard
    (3 : Fin 13) (11 : Fin 13)
    (37 : Fin 78) (70 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (37 : Fin 78) (8 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (70 : Fin 78) (8 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0561` (shell). -/
theorem directSource_h0561 :
    ((!((shellBit (directSourceShell T) 3 && shellBit (directSourceShell T) 12)) || ((rankAtom (directSourceRanks P) 37 == rankAtom (directSourceRanks P) 71)))) = true := by
  exact directSource_shell_rank_guard
    (3 : Fin 13) (12 : Fin 13)
    (37 : Fin 78) (71 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (37 : Fin 78) (8 : Fin 13) (3 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (71 : Fin 78) (8 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0562` (shell). -/
theorem directSource_h0562 :
    ((!((shellBit (directSourceShell T) 4 && shellBit (directSourceShell T) 9)) || ((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 68)))) = true := by
  exact directSource_shell_rank_guard
    (4 : Fin 13) (9 : Fin 13)
    (45 : Fin 78) (68 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (8 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (68 : Fin 78) (8 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0563` (shell). -/
theorem directSource_h0563 :
    ((!((shellBit (directSourceShell T) 4 && shellBit (directSourceShell T) 11)) || ((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 70)))) = true := by
  exact directSource_shell_rank_guard
    (4 : Fin 13) (11 : Fin 13)
    (45 : Fin 78) (70 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (8 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (70 : Fin 78) (8 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0564` (shell). -/
theorem directSource_h0564 :
    ((!((shellBit (directSourceShell T) 4 && shellBit (directSourceShell T) 12)) || ((rankAtom (directSourceRanks P) 45 == rankAtom (directSourceRanks P) 71)))) = true := by
  exact directSource_shell_rank_guard
    (4 : Fin 13) (12 : Fin 13)
    (45 : Fin 78) (71 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (45 : Fin 78) (8 : Fin 13) (4 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (71 : Fin 78) (8 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0565` (shell). -/
theorem directSource_h0565 :
    ((!((shellBit (directSourceShell T) 5 && shellBit (directSourceShell T) 7)) || ((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 63)))) = true := by
  exact directSource_shell_rank_guard
    (5 : Fin 13) (7 : Fin 13)
    (52 : Fin 78) (63 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (8 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (8 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0566` (shell). -/
theorem directSource_h0566 :
    ((!((shellBit (directSourceShell T) 5 && shellBit (directSourceShell T) 9)) || ((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 68)))) = true := by
  exact directSource_shell_rank_guard
    (5 : Fin 13) (9 : Fin 13)
    (52 : Fin 78) (68 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (8 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (68 : Fin 78) (8 : Fin 13) (9 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0567` (shell). -/
theorem directSource_h0567 :
    ((!((shellBit (directSourceShell T) 5 && shellBit (directSourceShell T) 10)) || ((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 69)))) = true := by
  exact directSource_shell_rank_guard
    (5 : Fin 13) (10 : Fin 13)
    (52 : Fin 78) (69 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (8 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (69 : Fin 78) (8 : Fin 13) (10 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0568` (shell). -/
theorem directSource_h0568 :
    ((!((shellBit (directSourceShell T) 5 && shellBit (directSourceShell T) 11)) || ((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 70)))) = true := by
  exact directSource_shell_rank_guard
    (5 : Fin 13) (11 : Fin 13)
    (52 : Fin 78) (70 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (8 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (70 : Fin 78) (8 : Fin 13) (11 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0569` (shell). -/
theorem directSource_h0569 :
    ((!((shellBit (directSourceShell T) 5 && shellBit (directSourceShell T) 12)) || ((rankAtom (directSourceRanks P) 52 == rankAtom (directSourceRanks P) 71)))) = true := by
  exact directSource_shell_rank_guard
    (5 : Fin 13) (12 : Fin 13)
    (52 : Fin 78) (71 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (52 : Fin 78) (8 : Fin 13) (5 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (71 : Fin 78) (8 : Fin 13) (12 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0570` (shell). -/
theorem directSource_h0570 :
    ((!((shellBit (directSourceShell T) 6 && shellBit (directSourceShell T) 7)) || ((rankAtom (directSourceRanks P) 58 == rankAtom (directSourceRanks P) 63)))) = true := by
  exact directSource_shell_rank_guard
    (6 : Fin 13) (7 : Fin 13)
    (58 : Fin 78) (63 : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      (58 : Fin 78) (8 : Fin 13) (6 : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      (63 : Fin 78) (8 : Fin 13) (7 : Fin 13) (by decide))

/-- Exact pass-5 source assertion `h0571` (kalmanson). -/
theorem directSource_h0571 :
    ((!((rankAtom (directSourceRanks P) 1 == rankAtom (directSourceRanks P) 4)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 15)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (15 : Fin 78) (1 : Fin 78)
    (12 : Fin 78) (4 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (5 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (4 : Fin 78) (1 : Fin 78)
    (15 : Fin 78) (0 : Fin 78) (25 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0572` (kalmanson). -/
theorem directSource_h0572 :
    ((!((rankAtom (directSourceRanks P) 1 == rankAtom (directSourceRanks P) 5)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 16)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (16 : Fin 78) (1 : Fin 78)
    (12 : Fin 78) (5 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (6 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (5 : Fin 78) (1 : Fin 78)
    (16 : Fin 78) (0 : Fin 78) (26 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0573` (kalmanson). -/
theorem directSource_h0573 :
    ((!((rankAtom (directSourceRanks P) 1 == rankAtom (directSourceRanks P) 6)) || ((rankAtom (directSourceRanks P) 12).ult (rankAtom (directSourceRanks P) 17)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (17 : Fin 78) (1 : Fin 78)
    (12 : Fin 78) (6 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (7 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (6 : Fin 78) (1 : Fin 78)
    (17 : Fin 78) (0 : Fin 78) (27 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.1

/-- Exact pass-5 source assertion `h0574` (kalmanson). -/
theorem directSource_h0574 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 0)) || ((rankAtom (directSourceRanks P) 28).ult (rankAtom (directSourceRanks P) 1)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (1 : Fin 78) (18 : Fin 78)
    (28 : Fin 78) (0 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (7 : Fin 78) (1 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (28 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

/-- Exact pass-5 source assertion `h0575` (kalmanson). -/
theorem directSource_h0575 :
    ((!((rankAtom (directSourceRanks P) 18 == rankAtom (directSourceRanks P) 28)) || ((rankAtom (directSourceRanks P) 0).ult (rankAtom (directSourceRanks P) 1)))) = true := by
  apply directSource_kalmanson_rank_guard P
    (1 : Fin 78) (18 : Fin 78)
    (0 : Fin 78) (28 : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    (0 : Fin 13) (1 : Fin 13) (2 : Fin 13) (8 : Fin 13)
    (by decide) (by decide) (by decide)
    (12 : Fin 78) (7 : Fin 78) (1 : Fin 78)
    (18 : Fin 78) (0 : Fin 78) (28 : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.2

end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
