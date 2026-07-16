/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedFirstRadiusTerminalDescent
import CapFiveApexRigidity
import FixedSingleRadiusCycleConsequence

/-!
# Alternate-radius descent after a spent frontier entry

When a card-four/card-five frontier radius is spent by the original pair,
`FrontierRadiusSpentAtEntry` supplies a different K4 radius on the twice-erased
carrier.  The fixed-single-radius descent can start there without returning to
the ambient carrier.

The resulting history has a sharp two-phase form.  The original frontier pair
uses the spent radius, while every point erased after entry uses the one
alternate radius.  This is a source-faithful continuation of the R descent,
not a contradiction: the full MEC/cap/no-`IsM44` parent currently supplies no
theorem excluding the two-radius state.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailCriticalPairFrontier
open ATailFullGeometryProducerScratch
open ATailRActualBlockerTransitionScratch
open ATailRTransitionLiveSurfaceScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex1_eq_oppositeVertex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem selectedClass_mono
    {A B : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (hBA : B ⊆ A) :
    SelectedClass B center radius ⊆ SelectedClass A center radius := by
  intro x hx
  rcases mem_selectedClass.mp hx with ⟨hxB, hxdist⟩
  exact mem_selectedClass.mpr ⟨hBA hxB, hxdist⟩

/-- The post-entry fixed-radius suffix, together with the original frontier
pair prepended to its ambient robust history. -/
structure SpentEntryAlternateRadiusTerminal
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (E : FrontierRadiusSpentAtEntry F) : Type where
  terminal : FixedSingleRadiusTerminalHistory D S
    ((D.A.erase F.pair.q).erase F.pair.w) E.alternateRadius
  ambient_history :
    RobustPairedErasureHistory D S D.A terminal.carrier

/-- Prepend the original frontier pair to a robust history which starts on
the twice-erased carrier. -/
private theorem prepend_frontier_pair_to_history
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hradius : 0 < radius)
    (hfirstDouble : HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1)
    {C : Finset ℝ²}
    (hCsub : C ⊆ (D.A.erase F.pair.q).erase F.pair.w)
    (Hhist : RobustPairedErasureHistory D S
      ((D.A.erase F.pair.q).erase F.pair.w) C) :
    RobustPairedErasureHistory D S D.A C := by
  intro x hxErased
  have hxA : x ∈ D.A := (Finset.mem_sdiff.mp hxErased).1
  have hxNotC : x ∉ C := (Finset.mem_sdiff.mp hxErased).2
  by_cases hxq : x = F.pair.q
  · subst x
    have hwNotC : F.pair.w ∉ C := by
      intro hwC
      exact (Finset.mem_erase.mp (hCsub hwC)).1 rfl
    exact ⟨radius, F.pair.w, hradius,
      F.pair.q_mem_marginal, F.pair.w_mem_marginal,
      Finset.mem_sdiff.mpr ⟨F.pair.w_mem_A, hwNotC⟩,
      F.pair.q_ne_w, hfirstDouble, F.secondApexDouble⟩
  · by_cases hxw : x = F.pair.w
    · subst x
      have hqNotC : F.pair.q ∉ C := by
        intro hqC
        have hqPost := hCsub hqC
        exact (Finset.mem_erase.mp
          (Finset.mem_erase.mp hqPost).2).1 rfl
      exact ⟨radius, F.pair.q, hradius,
        F.pair.w_mem_marginal, F.pair.q_mem_marginal,
        Finset.mem_sdiff.mpr ⟨F.pair.q_mem_A, hqNotC⟩,
        F.pair.q_ne_w.symm,
        by simpa [Finset.erase_right_comm] using hfirstDouble,
        by simpa [Finset.erase_right_comm] using F.secondApexDouble⟩
    · have hxPost :
          x ∈ (D.A.erase F.pair.q).erase F.pair.w :=
        Finset.mem_erase.mpr
          ⟨hxw, Finset.mem_erase.mpr ⟨hxq, hxA⟩⟩
      rcases Hhist x (Finset.mem_sdiff.mpr ⟨hxPost, hxNotC⟩) with
        ⟨rho, y, hrho, hxMarginal, hyMarginal, hyPost, hxy,
          hfirst, hsecond⟩
      have hyA : y ∈ D.A := by
        exact (Finset.mem_erase.mp
          (Finset.mem_erase.mp (Finset.mem_sdiff.mp hyPost).1).2).2
      exact ⟨rho, y, hrho, hxMarginal, hyMarginal,
        Finset.mem_sdiff.mpr
          ⟨hyA, (Finset.mem_sdiff.mp hyPost).2⟩,
        hxy, hfirst, hsecond⟩

/-- The spent-entry certificate always admits a fixed-single-radius suffix on
the actual post-entry carrier. -/
theorem CriticalPairFrontier.exists_alternateRadiusTerminal_of_spentAtEntry
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (hradius : 0 < radius)
    (hfirstDouble : HasNEquidistantPointsAt 4
      ((D.A.erase F.pair.q).erase F.pair.w) S.oppApex1)
    (E : FrontierRadiusSpentAtEntry F) :
    Nonempty (SpentEntryAlternateRadiusTerminal F E) := by
  let B := (D.A.erase F.pair.q).erase F.pair.w
  have hBsub : B ⊆ D.A := by
    intro z hz
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hz).2).2
  rcases exists_fixedSingleRadiusTerminalHistory
      D S B hBsub E.alternateRadius E.alternateRadius_pos
        (by simpa [B] using E.alternateRadius_four)
        F.secondApexDouble with ⟨T⟩
  exact ⟨
    { terminal := T
      ambient_history := prepend_frontier_pair_to_history
        F hradius hfirstDouble T.carrier_subset T.history }⟩

private theorem frontier_pair_mem_originalClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H) :
    F.pair.q ∈ SelectedClass D.A S.oppApex1 radius ∧
      F.pair.w ∈ SelectedClass D.A S.oppApex1 radius := by
  constructor
  · rcases Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.q_mem_marginal).1 with
      ⟨hqA, hqRadius⟩
    exact mem_selectedClass.mpr
      ⟨hqA, by simpa [dist_comm] using hqRadius⟩
  · rcases Finset.mem_filter.mp
      (Finset.mem_sdiff.mp F.pair.w_mem_marginal).1 with
      ⟨hwA, hwRadius⟩
    exact mem_selectedClass.mpr
      ⟨hwA, by simpa [dist_comm] using hwRadius⟩

/-- The two original frontier points are genuine exceptions to the alternate
radius suffix: neither lies in the alternate ambient class. -/
theorem FrontierRadiusSpentAtEntry.original_pair_not_mem_alternateClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (E : FrontierRadiusSpentAtEntry F) :
    F.pair.q ∉ SelectedClass D.A S.oppApex1 E.alternateRadius ∧
      F.pair.w ∉ SelectedClass D.A S.oppApex1 E.alternateRadius := by
  have horiginal := frontier_pair_mem_originalClass F
  constructor
  · intro hqAlternate
    exact E.alternateRadius_ne
      ((mem_selectedClass.mp hqAlternate).2.symm.trans
        (mem_selectedClass.mp horiginal.1).2)
  · intro hwAlternate
    exact E.alternateRadius_ne
      ((mem_selectedClass.mp hwAlternate).2.symm.trans
        (mem_selectedClass.mp horiginal.2).2)

/-- A spent frontier entry already exhibits two distinct positive K4 radii at
the first opposite apex.  Full cap geometry therefore forces the cap opposite
that apex to contain at least six points. -/
theorem FrontierRadiusSpentAtEntry.firstOppositeCap_card_ge_six
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (E : FrontierRadiusSpentAtEntry F)
    (hradius : 0 < radius) :
    6 ≤ (S.capByIndex S.oppIndex1).card := by
  let B := (D.A.erase F.pair.q).erase F.pair.w
  have hBsub : B ⊆ D.A := by
    intro z hz
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hz).2).2
  have hcenter :
      S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 :=
    oppApex1_eq_oppositeVertex_oppIndex1 S
  have horiginal :
      4 ≤ (SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1) radius).card := by
    have hfour : 4 ≤ (SelectedClass D.A S.oppApex1 radius).card := by
      rcases E.ambient_card with hcard | hcard <;> omega
    simpa only [← hcenter] using hfour
  have halternateB :
      4 ≤ (SelectedClass B
        (S.oppositeVertexByIndex S.oppIndex1) E.alternateRadius).card := by
    simpa only [B, ← hcenter] using E.alternateRadius_four
  have halternate :
      4 ≤ (SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex1) E.alternateRadius).card :=
    le_trans halternateB
      (Finset.card_le_card (selectedClass_mono hBsub))
  exact oppositeVertex_distinct_K4_radii_force_cap_card_ge_six
    S D.convex S.oppIndex1 hradius E.alternateRadius_pos
      horiginal halternate E.alternateRadius_ne.symm

/-- Consequently, the spent-at-entry branch is absent whenever the chosen
first opposite cap is one of the small cap-four/card-five alternatives. -/
theorem FrontierRadiusSpentAtEntry.not_firstOppositeCap_card_four_or_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (E : FrontierRadiusSpentAtEntry F)
    (hradius : 0 < radius) :
    ¬ ((S.capByIndex S.oppIndex1).card = 4 ∨
      (S.capByIndex S.oppIndex1).card = 5) := by
  intro hsmall
  have hge := E.firstOppositeCap_card_ge_six hradius
  rcases hsmall with hcard | hcard <;> omega

/-- Every erased point is either one of the original spent-radius endpoints
or belongs to the single alternate ambient radius class. -/
theorem SpentEntryAlternateRadiusTerminal.erased_mem_originalPair_or_alternateClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (T : SpentEntryAlternateRadiusTerminal F E)
    {x : ℝ²} (hx : x ∈ D.A \ T.terminal.carrier) :
    x = F.pair.q ∨ x = F.pair.w ∨
      x ∈ SelectedClass D.A S.oppApex1 E.alternateRadius := by
  have hxA : x ∈ D.A := (Finset.mem_sdiff.mp hx).1
  have hxNotCarrier : x ∉ T.terminal.carrier :=
    (Finset.mem_sdiff.mp hx).2
  by_cases hxq : x = F.pair.q
  · exact Or.inl hxq
  · by_cases hxw : x = F.pair.w
    · exact Or.inr (Or.inl hxw)
    · right
      right
      apply T.terminal.erased_mem_fixedClass x
      exact Finset.mem_sdiff.mpr
        ⟨Finset.mem_erase.mpr
          ⟨hxw, Finset.mem_erase.mpr ⟨hxq, hxA⟩⟩,
          hxNotCarrier⟩

/-- Away from the two named entry points, the entire erased history is
coherent at the alternate radius. -/
theorem SpentEntryAlternateRadiusTerminal.erased_mem_alternateClass_of_avoids_originalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (T : SpentEntryAlternateRadiusTerminal F E)
    {x : ℝ²} (hx : x ∈ D.A \ T.terminal.carrier)
    (hxq : x ≠ F.pair.q) (hxw : x ≠ F.pair.w) :
    x ∈ SelectedClass D.A S.oppApex1 E.alternateRadius := by
  rcases T.erased_mem_originalPair_or_alternateClass hx with
    hxq' | hxw' | hxAlternate
  · exact False.elim (hxq hxq')
  · exact False.elim (hxw hxw')
  · exact hxAlternate

/-- Conversely, every erased source which is not coherent at the alternate
radius is one of the two named entry points. -/
theorem SpentEntryAlternateRadiusTerminal.erased_eq_originalPair_of_not_mem_alternateClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (T : SpentEntryAlternateRadiusTerminal F E)
    {x : ℝ²} (hx : x ∈ D.A \ T.terminal.carrier)
    (hxNotAlternate :
      x ∉ SelectedClass D.A S.oppApex1 E.alternateRadius) :
    x = F.pair.q ∨ x = F.pair.w := by
  rcases T.erased_mem_originalPair_or_alternateClass hx with
    hxq | hxw | hxAlternate
  · exact Or.inl hxq
  · exact Or.inr hxw
  · exact False.elim (hxNotAlternate hxAlternate)

/-- Every erased source after the frontier entry has a robust mate on the
same alternate radius, still inside the post-entry carrier difference. -/
theorem SpentEntryAlternateRadiusTerminal.exists_alternateRadius_mate_of_postEntry_erased
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (T : SpentEntryAlternateRadiusTerminal F E)
    {x : ℝ²}
    (hx : x ∈ ((D.A.erase F.pair.q).erase F.pair.w) \
      T.terminal.carrier) :
    ∃ y : ℝ²,
      y ∈ ((D.A.erase F.pair.q).erase F.pair.w) \
        T.terminal.carrier ∧
      x ≠ y ∧
      x ∉ S.surplusCap ∧ y ∉ S.surplusCap ∧
      x ∈ SelectedClass D.A S.oppApex1 E.alternateRadius ∧
      y ∈ SelectedClass D.A S.oppApex1 E.alternateRadius ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) S.oppApex1 ∧
      HasNEquidistantPointsAt 4
        ((D.A.erase x).erase y) S.oppApex2 := by
  rcases T.terminal.history x hx with
    ⟨rho, y, _hrho, hxMarginal, hyMarginal, hyErased, hxy,
      hfirst, hsecond⟩
  exact ⟨y, hyErased, hxy,
    (Finset.mem_sdiff.mp hxMarginal).2,
    (Finset.mem_sdiff.mp hyMarginal).2,
    T.terminal.erased_mem_fixedClass x hx,
    T.terminal.erased_mem_fixedClass y hyErased,
    hfirst, hsecond⟩

/-- Start the actual-blocker orbit at any named point erased after the spent
entry.  The source-exact pair reconstructed there has the alternate radius,
and the orbit uses the ambient history with the two original endpoints
prepended. -/
theorem SpentEntryAlternateRadiusTerminal.exists_alternateRadiusOrbit_of_postEntry_erased
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (T : SpentEntryAlternateRadiusTerminal F E)
    {x : ℝ²}
    (hx : x ∈ ((D.A.erase F.pair.q).erase F.pair.w) \
      T.terminal.carrier) :
    ∃ P : AmbientRobustHistoryPair D S T.terminal.carrier
        E.alternateRadius,
      P.x = x ∧
        ((∃ n : ℕ,
            ((H.blockerVertex^[n])
              (actualBlockerStartVertex P)).1 ∈ T.terminal.carrier) ∨
          Nonempty (SourceExactMinimalActualBlockerCycle P H)) := by
  have hxA : x ∈ D.A :=
    (Finset.mem_erase.mp
      (Finset.mem_erase.mp (Finset.mem_sdiff.mp hx).1).2).2
  have hxAmbient : x ∈ D.A \ T.terminal.carrier :=
    Finset.mem_sdiff.mpr ⟨hxA, (Finset.mem_sdiff.mp hx).2⟩
  rcases exists_ambientRobustHistoryPair_with_source_of_erased
      D S T.ambient_history hxAmbient with ⟨rho, P, hsource⟩
  have hxAlternate :
      x ∈ SelectedClass D.A S.oppApex1 E.alternateRadius :=
    T.terminal.erased_mem_fixedClass x hx
  have hPAlternate :
      P.x ∈ SelectedClass D.A S.oppApex1 E.alternateRadius := by
    simpa only [hsource] using hxAlternate
  have hrho : rho = E.alternateRadius :=
    (mem_selectedClass.mp P.x_mem_class).2.symm.trans
      (mem_selectedClass.mp hPAlternate).2
  subst rho
  exact ⟨P, hsource,
    AmbientRobustHistoryPair.actualBlockerOrbit_terminalHit_or_sourceExactMinimalCycle
      P H T.ambient_history⟩

/-- The first named residual for a spent-entry blocker cycle: a canonical
cycle source returns to one of the two original frontier endpoints. -/
def SpentEntryCycleHitsOriginalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {C : Finset ℝ²} {P : AmbientRobustHistoryPair D S C rho}
    (F : CriticalPairFrontier D S radius H)
    (K : SourceExactMinimalActualBlockerCycle P H) : Prop :=
  ∃ i : Fin K.period,
    (K.source i).1 = F.pair.q ∨ (K.source i).1 = F.pair.w

/-- Branch-complete canonical-cycle normalization.  Either the cycle has a
named hit of the two-point entry exception, or every canonical source lies
on the one alternate circle. -/
theorem SourceExactMinimalActualBlockerCycle.hitsSpentEntryPair_or_all_sources_mem_alternateClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : SourceExactMinimalActualBlockerCycle P H) :
    SpentEntryCycleHitsOriginalPair F K ∨
      ∀ i : Fin K.period,
        (K.source i).1 ∈
          SelectedClass D.A S.oppApex1 E.alternateRadius := by
  classical
  by_cases hhit : SpentEntryCycleHitsOriginalPair F K
  · exact Or.inl hhit
  · right
    intro i
    apply T.erased_mem_alternateClass_of_avoids_originalPair
      (K.source_mem_erased_at i)
    · intro hq
      exact hhit ⟨i, Or.inl hq⟩
    · intro hw
      exact hhit ⟨i, Or.inr hw⟩

/-- Consumer-facing orbit form.  From a post-entry erased source, the only
cycle obstruction to full alternate-radius source coherence is the explicitly
named return to the original frontier pair. -/
theorem SpentEntryAlternateRadiusTerminal.alternateRadiusOrbit_terminalHit_or_cycleSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    (T : SpentEntryAlternateRadiusTerminal F E)
    {x : ℝ²}
    (hx : x ∈ ((D.A.erase F.pair.q).erase F.pair.w) \
      T.terminal.carrier) :
    ∃ P : AmbientRobustHistoryPair D S T.terminal.carrier
        E.alternateRadius,
      P.x = x ∧
        ((∃ n : ℕ,
            ((H.blockerVertex^[n])
              (actualBlockerStartVertex P)).1 ∈ T.terminal.carrier) ∨
          ∃ K : SourceExactMinimalActualBlockerCycle P H,
            SpentEntryCycleHitsOriginalPair F K ∨
              ∀ i : Fin K.period,
                (K.source i).1 ∈
                  SelectedClass D.A S.oppApex1 E.alternateRadius) := by
  rcases T.exists_alternateRadiusOrbit_of_postEntry_erased hx with
    ⟨P, hsource, horbit⟩
  refine ⟨P, hsource, ?_⟩
  rcases horbit with hhit | hcycle
  · exact Or.inl hhit
  · rcases hcycle with ⟨K⟩
    exact Or.inr
      ⟨K,
        Problem97.ATailRFullParentEntryScratch.SourceExactMinimalActualBlockerCycle.hitsSpentEntryPair_or_all_sources_mem_alternateClass
          K⟩

/-- The fixed-radius cycle row residual survives with one exact weakening:
at least two critical-row points are off the alternate circle, and each is
either retained or one of the two named entry exceptions. -/
theorem SourceExactMinimalActualBlockerCycle.actualBlockerRow_offAlternate_residual
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {E : FrontierRadiusSpentAtEntry F}
    {T : SpentEntryAlternateRadiusTerminal F E}
    {P : AmbientRobustHistoryPair D S T.terminal.carrier rho}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    let R := (H.selectedAt (K.source i).1 (K.source i).2).toCriticalFourShell
    2 ≤ (R.support \
        SelectedClass D.A S.oppApex1 E.alternateRadius).card ∧
      R.support \ SelectedClass D.A S.oppApex1 E.alternateRadius ⊆
        T.terminal.carrier ∪ {F.pair.q, F.pair.w} := by
  dsimp only
  let R := (H.selectedAt (K.source i).1
    (K.source i).2).toCriticalFourShell
  rcases K.exists_pair_at_source_at i with ⟨rho', P', hsource⟩
  have hblocker :
      H.centerAt (K.source i).1 (K.source i).2 ≠ S.oppApex1 := by
    simpa only [hsource] using
      ATailRTransitionLiveSurfaceScratch.AmbientRobustHistoryPair.sourceBlocker_ne_oppApex1
        P' H
  refine ⟨criticalFourShell_two_le_off_fixedClass_card R hblocker, ?_⟩
  intro z hz
  by_cases hzCarrier : z ∈ T.terminal.carrier
  · exact Finset.mem_union.mpr (Or.inl hzCarrier)
  · have hzA : z ∈ D.A :=
      R.support_subset_A (Finset.mem_sdiff.mp hz).1
    have hzErased : z ∈ D.A \ T.terminal.carrier :=
      Finset.mem_sdiff.mpr ⟨hzA, hzCarrier⟩
    have hzPair := T.erased_eq_originalPair_of_not_mem_alternateClass
      hzErased (Finset.mem_sdiff.mp hz).2
    apply Finset.mem_union.mpr
    right
    rcases hzPair with hq | hw
    · simp [hq]
    · simp [hw]

#print axioms CriticalPairFrontier.exists_alternateRadiusTerminal_of_spentAtEntry
#print axioms FrontierRadiusSpentAtEntry.original_pair_not_mem_alternateClass
#print axioms FrontierRadiusSpentAtEntry.firstOppositeCap_card_ge_six
#print axioms FrontierRadiusSpentAtEntry.not_firstOppositeCap_card_four_or_five
#print axioms SpentEntryAlternateRadiusTerminal.erased_mem_originalPair_or_alternateClass
#print axioms SpentEntryAlternateRadiusTerminal.erased_mem_alternateClass_of_avoids_originalPair
#print axioms SpentEntryAlternateRadiusTerminal.erased_eq_originalPair_of_not_mem_alternateClass
#print axioms SpentEntryAlternateRadiusTerminal.exists_alternateRadius_mate_of_postEntry_erased
#print axioms SpentEntryAlternateRadiusTerminal.exists_alternateRadiusOrbit_of_postEntry_erased
#print axioms SourceExactMinimalActualBlockerCycle.hitsSpentEntryPair_or_all_sources_mem_alternateClass
#print axioms SpentEntryAlternateRadiusTerminal.alternateRadiusOrbit_terminalHit_or_cycleSplit
#print axioms SourceExactMinimalActualBlockerCycle.actualBlockerRow_offAlternate_residual

end ATailRFullParentEntryScratch
end Problem97
