/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleOrderedCapLift
import CoherentRCommonDeletionProvenance
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Ordered local extrema force source-outside on the coherent blocker cycle

The selected row at a cycle vertex is centered at the next actual blocker.
If the preceding source and the deleted vertex occur strictly on the same
side of that center in one ordered cap, `CGN6c` says that their distances from
the center are unequal.  They therefore cannot both lie in the deleted
vertex's full critical shell.

This file records that implication with the actual blocker map and full-row
provenance intact.  It also separates the only other rank-order possibility:
the next blocker rank lies strictly between the preceding two ranks.  The
global task is consequently a finite cyclic selection/descent argument, plus
the short-cycle and sole-`oppCap2` boundary cases; no endpoint-radius premise
is used here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

/-- Two ranks lie strictly on the same side of a distinguished center rank. -/
def RanksOnSameSide {m : ℕ} (center a b : Fin m) : Prop :=
  (center < a ∧ center < b) ∨ (a < center ∧ b < center)

/-- The distinguished center rank lies strictly between the other two ranks. -/
def RankStrictlyBetween {m : ℕ} (center a b : Fin m) : Prop :=
  (a < center ∧ center < b) ∨ (b < center ∧ center < a)

/-- Width of the rank interval spanned by two cap points. -/
def RankGap {m : ℕ} (a b : Fin m) : ℕ := Nat.dist a.1 b.1

/-- Three pairwise distinct ranks have exactly the local-extremum or
strict-between shape needed below. -/
theorem ranksOnSameSide_or_rankStrictlyBetween
    {m : ℕ} {center a b : Fin m}
    (hca : center ≠ a) (hcb : center ≠ b) (hab : a ≠ b) :
    RanksOnSameSide center a b ∨ RankStrictlyBetween center a b := by
  simp only [RanksOnSameSide, RankStrictlyBetween]
  omega

/-- Moving from `(a,b)` to `(b,center)` strictly shrinks interval width when
`center` lies strictly between `a` and `b`. -/
theorem rankGap_decreases_of_rankStrictlyBetween
    {m : ℕ} {center a b : Fin m}
    (hbetween : RankStrictlyBetween center a b) :
    RankGap b center < RankGap a b := by
  rcases hbetween with h | h
  · simp only [RankGap]
    rw [
      Nat.dist_eq_sub_of_le_right (le_of_lt h.2),
      Nat.dist_eq_sub_of_le (le_of_lt (lt_trans h.1 h.2))]
    omega
  · simp only [RankGap]
    rw [
      Nat.dist_eq_sub_of_le (le_of_lt h.1),
      Nat.dist_eq_sub_of_le_right (le_of_lt (lt_trans h.1 h.2))]
    omega

namespace OppCap1OrderedData

/-- `CGN6c`, transported to the concrete `oppCap1` order, forbids two
distinct same-side ranks from having the same distance to the center rank. -/
theorem oneSidedDistance_ne_of_sameSide
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (O : OppCap1OrderedData D S)
    {center a b : Fin O.m}
    (hab : a ≠ b)
    (hside : RanksOnSameSide center a b) :
    dist (O.L.points center) (O.L.points a) ≠
      dist (O.L.points center) (O.L.points b) := by
  have hinj := Problem97.CGN.oneSidedDistanceInjective_of_mecCapPacket
    O.Packet O.Hside O.Hord
  rcases lt_or_gt_of_ne hab with hab' | hba'
  · rcases hside with hright | hleft
    · exact hinj.1 hright.1 hab'
    · exact hinj.2 hab' hleft.2
  · rcases hside with hright | hleft
    · exact (hinj.1 hright.2 hba').symm
    · exact (hinj.2 hba' hleft.1).symm

end OppCap1OrderedData

/-- Full-row source exclusion from a concrete ordered-cap local extremum.

The `deleted` row is the actual critical row selected by `H`, so its center is
definitionally `H.blockerVertex deleted`.  If both `source` and `deleted`
were in that row, full-shell exactness would make their center distances
equal, contradicting transported `CGN6c` on the retained cap order. -/
theorem source_not_mem_deletedRow_of_orderedSameSide
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (O : OppCap1OrderedData D S)
    (H : CriticalShellSystem D.A)
    {source deleted : CriticalShellSystem.CarrierVertex D.A}
    {sourceRank deletedRank centerRank : Fin O.m}
    (hsourceRank : O.L.points sourceRank = source.1)
    (hdeletedRank : O.L.points deletedRank = deleted.1)
    (hcenterRank :
      O.L.points centerRank = (H.blockerVertex deleted).1)
    (hsd : sourceRank ≠ deletedRank)
    (hside : RanksOnSameSide centerRank sourceRank deletedRank) :
    source.1 ∉
      (H.selectedAt deleted.1 deleted.2).toCriticalFourShell.support := by
  intro hsourceMem
  let R := (H.selectedAt deleted.1 deleted.2).toCriticalFourShell
  have hdeletedMem : deleted.1 ∈ R.support := R.q_mem_support
  have heq :
      dist (H.blockerVertex deleted).1 source.1 =
        dist (H.blockerVertex deleted).1 deleted.1 := by
    simpa [R, CriticalShellSystem.blockerVertex] using
      (R.support_eq_radius source.1 hsourceMem).trans
        (R.support_eq_radius deleted.1 hdeletedMem).symm
  apply O.oneSidedDistance_ne_of_sameSide hsd hside
  simpa [hsourceRank, hdeletedRank, hcenterRank] using heq

/-- Public cyclic successor for the source-outside packet.  The analogous
definition in the extrema scratch file is intentionally private. -/
noncomputable def orderedSuccessorIndex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) : Fin K.period :=
  ⟨(i.1 + 1) % K.period,
    Nat.mod_lt _ (lt_of_lt_of_le Nat.zero_lt_two K.two_le_period)⟩

/-- The actual blocker map advances the canonical source by the public cyclic
successor, including at the wrap edge. -/
theorem blockerVertex_source_eq_orderedSuccessor
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    H.blockerVertex (K.source i) =
      K.source (orderedSuccessorIndex K i) := by
  apply Subtype.ext
  change
    (H.blockerVertex
      ((H.blockerVertex^[i.1]) K.base)).1 =
      ((H.blockerVertex^[(i.1 + 1) % K.period]) K.base).1
  have hiterate :
      (H.blockerVertex^[(i.1 + 1) % K.period]) K.base =
        (H.blockerVertex^[i.1 + 1]) K.base :=
    K.isPeriodicPt.iterate_mod_apply (i.1 + 1)
  rw [hiterate]
  simp [Function.iterate_succ_apply']

/-- In period at least three, a source cannot be the second blocker in its
consecutive triple.  Otherwise that source would have period two, while every
iterate of the canonical base has the same minimal period as the base. -/
theorem source_ne_secondBlocker_of_three_le_period
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (hthree : 3 ≤ K.period) (i : Fin K.period) :
    K.source i ≠
      H.blockerVertex (K.source (orderedSuccessorIndex K i)) := by
  intro htwo
  have hperiodTwo :
      Function.IsPeriodicPt H.blockerVertex 2 (K.source i) := by
    change H.blockerVertex (H.blockerVertex (K.source i)) = K.source i
    rw [blockerVertex_source_eq_orderedSuccessor K i]
    exact htwo.symm
  have hbaseMem : K.base ∈ Function.periodicPts H.blockerVertex := by
    exact ⟨K.period,
      lt_of_lt_of_le Nat.zero_lt_two K.two_le_period,
      K.isPeriodicPt⟩
  have hminimal :
      Function.minimalPeriod H.blockerVertex (K.source i) = K.period := by
    simpa [SourceExactMinimalActualBlockerCycle.source,
      SourceExactMinimalActualBlockerCycle.period] using
      Function.minimalPeriod_apply_iterate hbaseMem i.1
  have hle := hperiodTwo.minimalPeriod_le (by omega)
  rw [hminimal] at hle
  omega

/-- The exact source-outside assertion at one consecutive cycle triple
`v_i → v_{i+1} → v_{i+2}`. -/
def CycleSourceOutsideSuccessorShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) : Prop :=
  (K.source i).1 ∉
    (H.selectedAt
      (K.source (orderedSuccessorIndex K i)).1
      (K.source (orderedSuccessorIndex K i)).2).toCriticalFourShell.support

/-- Two consecutive strict actual-blocker edges realized in the same ordered
`oppCap1`.  The final field is precisely the non-period-two condition at this
triple: its first source differs from the second edge's actual blocker. -/
structure RankedConsecutiveStrictTriple
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (O : OppCap1OrderedData D S) (i : Fin K.period) where
  source_mem_strict :
    (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  deleted_mem_strict :
    (K.source (orderedSuccessorIndex K i)).1 ∈
      S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  center_mem_strict :
    (H.blockerVertex (K.source (orderedSuccessorIndex K i))).1 ∈
      S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  first : RankedActualBlockerEdge K O i
  second : RankedActualBlockerEdge K O (orderedSuccessorIndex K i)
  source_ne_secondBlocker :
    K.source i ≠ H.blockerVertex (K.source (orderedSuccessorIndex K i))

namespace RankedConsecutiveStrictTriple

/-- The target rank of the first actual-blocker edge is the source rank of
the second one.  This is the rank-level form of retained cycle provenance. -/
theorem middleRanks_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {K : SourceExactMinimalActualBlockerCycle P H}
    {O : OppCap1OrderedData D S} {i : Fin K.period}
    (R : RankedConsecutiveStrictTriple K O i) :
    R.first.blockerRank = R.second.sourceRank := by
  apply O.L.injective
  calc
    O.L.points R.first.blockerRank =
        (H.blockerVertex (K.source i)).1 := R.first.blocker_eq
    _ = (K.source (orderedSuccessorIndex K i)).1 :=
      congrArg Subtype.val (blockerVertex_source_eq_orderedSuccessor K i)
    _ = O.L.points R.second.sourceRank := R.second.source_eq.symm

/-- The first source and second blocker also have distinct ranks, by the
retained non-two-cycle provenance. -/
theorem sourceRank_ne_centerRank
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {K : SourceExactMinimalActualBlockerCycle P H}
    {O : OppCap1OrderedData D S} {i : Fin K.period}
    (R : RankedConsecutiveStrictTriple K O i) :
    R.first.sourceRank ≠ R.second.blockerRank := by
  intro hrank
  apply R.source_ne_secondBlocker
  apply Subtype.ext
  calc
    (K.source i).1 = O.L.points R.first.sourceRank := R.first.source_eq.symm
    _ = O.L.points R.second.blockerRank := congrArg O.L.points hrank
    _ = (H.blockerVertex
          (K.source (orderedSuccessorIndex K i))).1 := R.second.blocker_eq

/-- At every strict consecutive non-two-cycle triple, either the local
extremum directly supplies `SourceOutsideDeletedCriticalShell`, or the next
blocker rank lies strictly between the preceding source/deleted ranks. -/
theorem sourceOutside_or_centerRank_strictlyBetween
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {K : SourceExactMinimalActualBlockerCycle P H}
    {O : OppCap1OrderedData D S} {i : Fin K.period}
    (R : RankedConsecutiveStrictTriple K O i) :
    CycleSourceOutsideSuccessorShell K i ∨
      RankStrictlyBetween R.second.blockerRank
        R.first.sourceRank R.first.blockerRank := by
  have hmiddle := R.middleRanks_eq
  have hcenterDeleted :
      R.second.blockerRank ≠ R.first.blockerRank := by
    intro h
    apply R.second.ranks_ne
    exact hmiddle.symm.trans h.symm
  rcases ranksOnSameSide_or_rankStrictlyBetween
      R.sourceRank_ne_centerRank.symm hcenterDeleted R.first.ranks_ne with
    hside | hbetween
  · left
    apply source_not_mem_deletedRow_of_orderedSameSide O H
      R.first.source_eq
    · calc
        O.L.points R.first.blockerRank =
            (H.blockerVertex (K.source i)).1 := R.first.blocker_eq
        _ = (K.source (orderedSuccessorIndex K i)).1 :=
          congrArg Subtype.val (blockerVertex_source_eq_orderedSuccessor K i)
    · exact R.second.blocker_eq
    · exact R.first.ranks_ne
    · exact hside
  · exact Or.inr hbetween

/-- The strict-between branch is a literal descent of consecutive edge-rank
widths. -/
theorem rankGap_decreases_of_centerRank_strictlyBetween
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {K : SourceExactMinimalActualBlockerCycle P H}
    {O : OppCap1OrderedData D S} {i : Fin K.period}
    (R : RankedConsecutiveStrictTriple K O i)
    (hbetween : RankStrictlyBetween R.second.blockerRank
      R.first.sourceRank R.first.blockerRank) :
    RankGap R.first.blockerRank R.second.blockerRank <
      RankGap R.first.sourceRank R.first.blockerRank :=
  rankGap_decreases_of_rankStrictlyBetween hbetween

end RankedConsecutiveStrictTriple

/-- Construct the provenance-bearing ranked triple from three consecutive
strict-cap facts.  The last hypothesis is exactly what fails in period two. -/
theorem nonempty_rankedConsecutiveStrictTriple
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (O : OppCap1OrderedData D S) (i : Fin K.period)
    (hsource :
      (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hdeleted :
      (K.source (orderedSuccessorIndex K i)).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hcenter :
      (H.blockerVertex (K.source (orderedSuccessorIndex K i))).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hne :
      K.source i ≠ H.blockerVertex (K.source (orderedSuccessorIndex K i))) :
    Nonempty (RankedConsecutiveStrictTriple K O i) := by
  have hfirstBlocker :
      (H.blockerVertex (K.source i)).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
    rw [blockerVertex_source_eq_orderedSuccessor K i]
    exact hdeleted
  rcases nonempty_rankedActualBlockerEdge K O i hsource hfirstBlocker with
    ⟨E₀⟩
  rcases nonempty_rankedActualBlockerEdge K O
      (orderedSuccessorIndex K i) hdeleted hcenter with ⟨E₁⟩
  exact ⟨{
    source_mem_strict := hsource
    deleted_mem_strict := hdeleted
    center_mem_strict := hcenter
    first := E₀
    second := E₁
    source_ne_secondBlocker := hne }⟩

/-- Period at least three discharges the final distinctness field of the
ranked consecutive triple automatically. -/
theorem nonempty_rankedConsecutiveStrictTriple_of_three_le_period
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (O : OppCap1OrderedData D S) (hthree : 3 ≤ K.period)
    (i : Fin K.period)
    (hsource :
      (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hdeleted :
      (K.source (orderedSuccessorIndex K i)).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hcenter :
      (H.blockerVertex (K.source (orderedSuccessorIndex K i))).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) :
    Nonempty (RankedConsecutiveStrictTriple K O i) :=
  nonempty_rankedConsecutiveStrictTriple K O i hsource hdeleted hcenter
    (source_ne_secondBlocker_of_three_le_period K hthree i)

/-- Exact global branch over all strict triples in a period-at-least-three
cycle.  Either one triple already gives the desired source-outside fact, or
every strict triple admits a provenance-bearing rank realization whose next
edge has strictly smaller rank width. -/
theorem exists_sourceOutside_strictTriple_or_all_strictTriples_rankGapDecrease
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (O : OppCap1OrderedData D S) (hthree : 3 ≤ K.period) :
    (∃ i : Fin K.period,
      (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      (K.source (orderedSuccessorIndex K i)).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      (H.blockerVertex (K.source (orderedSuccessorIndex K i))).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
      CycleSourceOutsideSuccessorShell K i) ∨
    (∀ i : Fin K.period,
      (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) →
      (K.source (orderedSuccessorIndex K i)).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) →
      (H.blockerVertex (K.source (orderedSuccessorIndex K i))).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) →
      ∃ R : RankedConsecutiveStrictTriple K O i,
        RankStrictlyBetween R.second.blockerRank
            R.first.sourceRank R.first.blockerRank ∧
          RankGap R.first.blockerRank R.second.blockerRank <
            RankGap R.first.sourceRank R.first.blockerRank) := by
  classical
  by_cases hex :
      ∃ i : Fin K.period,
        (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
        (K.source (orderedSuccessorIndex K i)).1 ∈
          S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
        (H.blockerVertex (K.source (orderedSuccessorIndex K i))).1 ∈
          S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) ∧
        CycleSourceOutsideSuccessorShell K i
  · exact Or.inl hex
  · right
    intro i hsource hdeleted hcenter
    rcases nonempty_rankedConsecutiveStrictTriple_of_three_le_period
        K O hthree i hsource hdeleted hcenter with ⟨R⟩
    rcases R.sourceOutside_or_centerRank_strictlyBetween with
      houtside | hbetween
    · exact False.elim (hex ⟨i, hsource, hdeleted, hcenter, houtside⟩)
    · exact ⟨R, hbetween,
        R.rankGap_decreases_of_centerRank_strictlyBetween hbetween⟩

/-- A period-at-least-three cycle whose every source is strict `oppCap1`, with
one actual-blocker edge chosen at every cyclic index in the same retained
ordered-cap realization. -/
structure AllStrictRankedCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (O : OppCap1OrderedData D S) where
  source_mem_strict :
    ∀ i : Fin K.period,
      (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  edge : ∀ i : Fin K.period, RankedActualBlockerEdge K O i

namespace AllStrictRankedCycle

/-- The natural-number width of the actual blocker edge at one cycle index. -/
def edgeRankGap
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {K : SourceExactMinimalActualBlockerCycle P H}
    {O : OppCap1OrderedData D S}
    (C : AllStrictRankedCycle K O) (i : Fin K.period) : ℕ :=
  RankGap (C.edge i).sourceRank (C.edge i).blockerRank

/-- Consecutive all-strict edges give the provenance-bearing triple packet. -/
noncomputable def tripleAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {K : SourceExactMinimalActualBlockerCycle P H}
    {O : OppCap1OrderedData D S}
    (C : AllStrictRankedCycle K O) (hthree : 3 ≤ K.period)
    (i : Fin K.period) : RankedConsecutiveStrictTriple K O i :=
  { source_mem_strict := C.source_mem_strict i
    deleted_mem_strict := C.source_mem_strict (orderedSuccessorIndex K i)
    center_mem_strict := by
      rw [blockerVertex_source_eq_orderedSuccessor K
        (orderedSuccessorIndex K i)]
      exact C.source_mem_strict
        (orderedSuccessorIndex K (orderedSuccessorIndex K i))
    first := C.edge i
    second := C.edge (orderedSuccessorIndex K i)
    source_ne_secondBlocker :=
      source_ne_secondBlocker_of_three_le_period K hthree i }

/-- On an all-strict cycle, failure of source-outside at one triple makes the
next actual-blocker edge strictly narrower in cap-rank width. -/
theorem sourceOutside_or_nextEdgeRankGap_lt
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {K : SourceExactMinimalActualBlockerCycle P H}
    {O : OppCap1OrderedData D S}
    (C : AllStrictRankedCycle K O) (hthree : 3 ≤ K.period)
    (i : Fin K.period) :
    CycleSourceOutsideSuccessorShell K i ∨
      C.edgeRankGap (orderedSuccessorIndex K i) < C.edgeRankGap i := by
  let R := C.tripleAt hthree i
  rcases R.sourceOutside_or_centerRank_strictlyBetween with
    houtside | hbetween
  · exact Or.inl houtside
  · right
    have hdecrease :=
      R.rankGap_decreases_of_centerRank_strictlyBetween hbetween
    have hmiddle := R.middleRanks_eq
    have hmiddle' :
        (C.edge i).blockerRank =
          (C.edge (orderedSuccessorIndex K i)).sourceRank := by
      simpa [R, tripleAt] using hmiddle
    change
      RankGap (C.edge (orderedSuccessorIndex K i)).sourceRank
          (C.edge (orderedSuccessorIndex K i)).blockerRank <
        RankGap (C.edge i).sourceRank (C.edge i).blockerRank
    rw [← hmiddle']
    simpa [R, tripleAt] using hdecrease

end AllStrictRankedCycle

/-- Choose one ranked actual-blocker edge at every index of an all-strict
cycle. -/
theorem nonempty_allStrictRankedCycle
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (O : OppCap1OrderedData D S)
    (hall : ∀ i : Fin K.period,
      (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) :
    Nonempty (AllStrictRankedCycle K O) := by
  classical
  have hedge : ∀ i : Fin K.period,
      Nonempty (RankedActualBlockerEdge K O i) := by
    intro i
    apply nonempty_rankedActualBlockerEdge K O i (hall i)
    rw [blockerVertex_source_eq_orderedSuccessor K i]
    exact hall (orderedSuccessorIndex K i)
  exact ⟨{
    source_mem_strict := hall
    edge := fun i ↦ Classical.choice (hedge i) }⟩

/-- An all-strict cycle of period at least three must contain a source-outside
triple: otherwise its natural edge-rank width would decrease strictly at every
cyclic successor, contradicting a finite minimum. -/
theorem exists_sourceOutsideSuccessorShell_of_all_sources_strict
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (O : OppCap1OrderedData D S) (hthree : 3 ≤ K.period)
    (hall : ∀ i : Fin K.period,
      (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) :
    ∃ i : Fin K.period, CycleSourceOutsideSuccessorShell K i := by
  classical
  rcases nonempty_allStrictRankedCycle K O hall with ⟨C⟩
  by_contra hnone
  have hdecrease : ∀ i : Fin K.period,
      C.edgeRankGap (orderedSuccessorIndex K i) < C.edgeRankGap i := by
    intro i
    rcases C.sourceOutside_or_nextEdgeRankGap_lt hthree i with h | h
    · exact False.elim (hnone ⟨i, h⟩)
    · exact h
  have huniv : (Finset.univ : Finset (Fin K.period)).Nonempty :=
    ⟨⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩, by simp⟩
  rcases Finset.exists_min_image Finset.univ C.edgeRankGap huniv with
    ⟨imin, _himin, hmin⟩
  have hle := hmin (orderedSuccessorIndex K imin) (by simp)
  exact (not_lt_of_ge hle) (hdecrease imin)

/-- Therefore the sole cap-local obstruction to a source-outside triple in
period at least three is a genuine canonical source in `oppCap2`. -/
theorem exists_sourceOutsideSuccessorShell_or_source_mem_oppCap2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (O : OppCap1OrderedData D S) (hthree : 3 ≤ K.period) :
    (∃ i : Fin K.period, CycleSourceOutsideSuccessorShell K i) ∨
      ∃ e : Fin K.period, (K.source e).1 ∈ S.oppCap2 := by
  classical
  by_cases hall : ∀ i : Fin K.period,
      (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  · exact Or.inl
      (exists_sourceOutsideSuccessorShell_of_all_sources_strict
        K O hthree hall)
  · push_neg at hall
    rcases hall with ⟨e, he⟩
    rcases
        Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
          K e with hstrict | hopp2
    · exact False.elim (he hstrict)
    · exact Or.inr ⟨e, hopp2⟩

#print axioms ranksOnSameSide_or_rankStrictlyBetween
#print axioms rankGap_decreases_of_rankStrictlyBetween
#print axioms OppCap1OrderedData.oneSidedDistance_ne_of_sameSide
#print axioms source_not_mem_deletedRow_of_orderedSameSide
#print axioms blockerVertex_source_eq_orderedSuccessor
#print axioms source_ne_secondBlocker_of_three_le_period
#print axioms RankedConsecutiveStrictTriple.sourceOutside_or_centerRank_strictlyBetween
#print axioms nonempty_rankedConsecutiveStrictTriple
#print axioms nonempty_rankedConsecutiveStrictTriple_of_three_le_period
#print axioms exists_sourceOutside_strictTriple_or_all_strictTriples_rankGapDecrease
#print axioms AllStrictRankedCycle.sourceOutside_or_nextEdgeRankGap_lt
#print axioms exists_sourceOutsideSuccessorShell_of_all_sources_strict
#print axioms exists_sourceOutsideSuccessorShell_or_source_mem_oppCap2

end ATailRFullParentEntryScratch
end Problem97
