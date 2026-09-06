/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual

/-!
# One-hit critical-shell reselection

A source whose actual critical shell contains a retained endpoint can supply
the chosen blocker for that endpoint.  The override preserves every other
source's blocker and the complete critical support.  This is a source
transition, not a contradiction or a decreasing-measure theorem.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveOneHitShellReselection

open ATailCriticalPairFrontier
open FirstApexExactFiveInteriorFrontier
open FirstApexUniqueRadiusResidual

/-- Rechoose one endpoint's blocker from a critical shell containing it,
preserving all other chosen centers and the entire critical support. -/
theorem exists_reselection_of_mem_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {fresh retained : ℝ²} (hfresh : fresh ∈ A)
    (hretained : retained ∈ A)
    (hhit : retained ∈
      (H.selectedAt fresh hfresh).toCriticalFourShell.support) :
    ∃ H' : CriticalShellSystem A,
      H'.centerAt retained hretained = H.centerAt fresh hfresh ∧
      (∀ z : ℝ², ∀ hz : z ∈ A, z ≠ retained →
        H'.centerAt z hz = H.centerAt z hz) ∧
      (H'.selectedAt retained hretained).toCriticalFourShell.support =
        (H.selectedAt fresh hfresh).toCriticalFourShell.support := by
  classical
  let K := (H.selectedAt fresh hfresh).toCriticalFourShell
  have hclass :
      SelectedClass A (H.centerAt fresh hfresh) K.radius = K.support := by
    simpa [SelectedClass] using K.support_eq.symm
  obtain ⟨C⟩ := CriticalSelectedFourClass.exists_of_exactSelectedClass
    (Finset.mem_erase.mp K.center_mem).2 K.radius_pos
    (by rw [hclass]; exact K.support_card)
    (by rw [hclass]; exact hhit)
  have hblocked : ¬ HasNEquidistantPointsAt 4
      (A.erase retained) (H.centerAt fresh hfresh) := by
    intro hsurvives
    exact
      ((cross_deletion_survives_iff_not_mem_selected_support H hfresh).mp
        hsurvives) hhit
  let H' := H.overrideAt C hblocked
  refine ⟨H', H.overrideAt_centerAt C hblocked hretained, ?_, ?_⟩
  · intro z hz hne
    exact H.overrideAt_centerAt_of_ne C hblocked hz hne
  · have hsupport := H.selectedFourClass_support_eq_shell fresh hfresh
      C.toSelectedFourClass
    have hshell : H'.shellAt retained hretained =
        ⟨H.centerAt fresh hfresh, C⟩ := by
      simp [H', CriticalShellSystem.overrideAt]
    have hsame := congrArg
      (fun s : Sigma fun c : ℝ² => CriticalSelectedFourClass A retained c =>
        s.2.toCriticalFourShell.support) hshell
    exact hsame.trans hsupport

/-- A one-hit shell permits a blocker reselection with distinct endpoint
centers.  The omitted endpoint's chosen center is preserved. -/
theorem exists_reselection_of_one_hit
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {fresh omitted retained : ℝ²} (hfresh : fresh ∈ A)
    (homitted : omitted ∈ A) (hretained : retained ∈ A)
    (hmiss : omitted ∉
      (H.selectedAt fresh hfresh).toCriticalFourShell.support)
    (hhit : retained ∈
      (H.selectedAt fresh hfresh).toCriticalFourShell.support) :
    ∃ H' : CriticalShellSystem A,
      H'.centerAt retained hretained = H.centerAt fresh hfresh ∧
      H'.centerAt omitted homitted = H.centerAt omitted homitted ∧
      H'.centerAt omitted homitted ≠ H'.centerAt retained hretained ∧
      (H'.selectedAt retained hretained).toCriticalFourShell.support =
        (H.selectedAt fresh hfresh).toCriticalFourShell.support := by
  obtain ⟨H', hretainedCenter, hother, hsupport⟩ :=
    exists_reselection_of_mem_support H hfresh hretained hhit
  have hne : omitted ≠ retained := by
    intro h
    exact hmiss (h ▸ hhit)
  have hsurvives : HasNEquidistantPointsAt 4
      (A.erase omitted) (H.centerAt fresh hfresh) :=
    (cross_deletion_survives_iff_not_mem_selected_support H hfresh).mpr
      hmiss
  have hcenters :
      H.centerAt omitted homitted ≠ H.centerAt fresh hfresh := by
    intro h
    exact H.no_qfree_at omitted homitted (h.symm ▸ hsurvives)
  refine ⟨H', hretainedCenter, hother omitted homitted hne, ?_, hsupport⟩
  simpa only [hother omitted homitted hne, hretainedCenter] using hcenters

/-- Retained source data for the transition that omits the first endpoint and
installs the fresh blocker at the second endpoint. -/
structure QOmittedWHitReselection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    (fresh : ℝ²) (hfreshA : fresh ∈ D.A) where
  shell : CriticalShellSystem D.A
  frontier : CriticalPairFrontier D S radius shell
  next : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual frontier
  retained_center_eq :
    shell.centerAt Rmin.residual.interior.frontier.pair.w
        Rmin.residual.interior.frontier.pair.w_mem_A =
      H.centerAt fresh hfreshA
  omitted_center_eq :
    shell.centerAt Rmin.residual.interior.frontier.pair.q
        Rmin.residual.interior.frontier.pair.q_mem_A =
      H.centerAt Rmin.residual.interior.frontier.pair.q
        Rmin.residual.interior.frontier.pair.q_mem_A
  retained_support_eq :
    (shell.selectedAt Rmin.residual.interior.frontier.pair.w
        Rmin.residual.interior.frontier.pair.w_mem_A).toCriticalFourShell.support =
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support

/-- Retained source data for the symmetric transition that omits the second
endpoint and installs the fresh blocker at the first endpoint. -/
structure WOmittedQHitReselection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    (fresh : ℝ²) (hfreshA : fresh ∈ D.A) where
  shell : CriticalShellSystem D.A
  frontier : CriticalPairFrontier D S radius shell
  next : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual frontier
  retained_center_eq :
    shell.centerAt Rmin.residual.interior.frontier.pair.q
        Rmin.residual.interior.frontier.pair.q_mem_A =
      H.centerAt fresh hfreshA
  omitted_center_eq :
    shell.centerAt Rmin.residual.interior.frontier.pair.w
        Rmin.residual.interior.frontier.pair.w_mem_A =
      H.centerAt Rmin.residual.interior.frontier.pair.w
        Rmin.residual.interior.frontier.pair.w_mem_A
  retained_support_eq :
    (shell.selectedAt Rmin.residual.interior.frontier.pair.q
        Rmin.residual.interior.frontier.pair.q_mem_A).toCriticalFourShell.support =
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support

/-- If the fresh row omits the first endpoint and contains the second, shell
reselection rebuilds the same minimum pair as a distinct-center exact-five
residual.  The chord and radius do not decrease; this is the source transition
that a separate no-return theorem must consume. -/
theorem nonempty_reselected_minimalDistinct_of_q_omitted_w_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hqMiss : Rmin.residual.interior.frontier.pair.q ∉
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwHit : Rmin.residual.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    ∃ (H' : CriticalShellSystem D.A)
        (F' : CriticalPairFrontier D S radius H'),
      Nonempty (FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F') ∧
      H'.centerAt Rmin.residual.interior.frontier.pair.w
          Rmin.residual.interior.frontier.pair.w_mem_A =
        H.centerAt fresh hfreshA ∧
      H'.centerAt Rmin.residual.interior.frontier.pair.q
          Rmin.residual.interior.frontier.pair.q_mem_A =
        H.centerAt Rmin.residual.interior.frontier.pair.q
          Rmin.residual.interior.frontier.pair.q_mem_A ∧
      (H'.selectedAt Rmin.residual.interior.frontier.pair.w
          Rmin.residual.interior.frontier.pair.w_mem_A).toCriticalFourShell.support =
        (H.selectedAt fresh hfreshA).toCriticalFourShell.support := by
  let R := Rmin.residual
  obtain ⟨H', hwCenter, hqCenter, hcenters, hsupport⟩ :=
    exists_reselection_of_one_hit H hfreshA
      R.interior.frontier.pair.q_mem_A
      R.interior.frontier.pair.w_mem_A hqMiss hwHit
  let M' := Rmin.minimalPair.rebase H'
  let P' := M'.frontier
  let F' := P'.frontier
  have hsurvives : HasNEquidistantPointsAt 4
      (D.A.erase R.interior.frontier.pair.q)
        (H.centerAt fresh hfreshA) :=
    (cross_deletion_survives_iff_not_mem_selected_support H hfreshA).mpr
      hqMiss
  let R' :
      FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F' := {
    minimal := R.minimal
    noM44 := R.noM44
    carrier_card_gt_nine := R.carrier_card_gt_nine
    class_card_eq_five := R.class_card_eq_five
    unique_fourClass_radius := R.unique_fourClass_radius
    firstApex_fullyDeletionRobust := R.firstApex_fullyDeletionRobust
    originalPair_doubleDeletion_obstructs := by
      simpa [F', P', M', Rmin.source_eq] using
        R.interiorPair_doubleDeletion_obstructs
    interior := P'
    interiorPair_doubleDeletion_obstructs := by
      simpa [P', M', Rmin.source_eq] using
        R.interiorPair_doubleDeletion_obstructs
    obstructionCenters_ne := by
      simpa [P', M', Rmin.source_eq] using hcenters
    directed_crossDeletion_survival := Or.inr (by
      simpa [R, P', M', Rmin.source_eq, hwCenter] using hsurvives) }
  refine ⟨H', F', ⟨{
    residual := R'
    minimalPair := M'
    source_eq := rfl }⟩, ?_, ?_, ?_⟩
  · exact hwCenter
  · exact hqCenter
  · exact hsupport

/-- Symmetric source transition when the fresh row contains the first
endpoint and omits the second. -/
theorem nonempty_reselected_minimalDistinct_of_w_omitted_q_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hwMiss : Rmin.residual.interior.frontier.pair.w ∉
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hqHit : Rmin.residual.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    ∃ (H' : CriticalShellSystem D.A)
        (F' : CriticalPairFrontier D S radius H'),
      Nonempty (FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F') ∧
      H'.centerAt Rmin.residual.interior.frontier.pair.q
          Rmin.residual.interior.frontier.pair.q_mem_A =
        H.centerAt fresh hfreshA ∧
      H'.centerAt Rmin.residual.interior.frontier.pair.w
          Rmin.residual.interior.frontier.pair.w_mem_A =
        H.centerAt Rmin.residual.interior.frontier.pair.w
          Rmin.residual.interior.frontier.pair.w_mem_A ∧
      (H'.selectedAt Rmin.residual.interior.frontier.pair.q
          Rmin.residual.interior.frontier.pair.q_mem_A).toCriticalFourShell.support =
        (H.selectedAt fresh hfreshA).toCriticalFourShell.support := by
  let R := Rmin.residual
  obtain ⟨H', hqCenter, hwCenter, hcenters, hsupport⟩ :=
    exists_reselection_of_one_hit H hfreshA
      R.interior.frontier.pair.w_mem_A
      R.interior.frontier.pair.q_mem_A hwMiss hqHit
  let M' := Rmin.minimalPair.rebase H'
  let P' := M'.frontier
  let F' := P'.frontier
  have hsurvives : HasNEquidistantPointsAt 4
      (D.A.erase R.interior.frontier.pair.w)
        (H.centerAt fresh hfreshA) :=
    (cross_deletion_survives_iff_not_mem_selected_support H hfreshA).mpr
      hwMiss
  let R' :
      FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F' := {
    minimal := R.minimal
    noM44 := R.noM44
    carrier_card_gt_nine := R.carrier_card_gt_nine
    class_card_eq_five := R.class_card_eq_five
    unique_fourClass_radius := R.unique_fourClass_radius
    firstApex_fullyDeletionRobust := R.firstApex_fullyDeletionRobust
    originalPair_doubleDeletion_obstructs := by
      simpa [F', P', M', Rmin.source_eq] using
        R.interiorPair_doubleDeletion_obstructs
    interior := P'
    interiorPair_doubleDeletion_obstructs := by
      simpa [P', M', Rmin.source_eq] using
        R.interiorPair_doubleDeletion_obstructs
    obstructionCenters_ne := by
      simpa [P', M', Rmin.source_eq] using hcenters.symm
    directed_crossDeletion_survival := Or.inl (by
      simpa [R, P', M', Rmin.source_eq, hqCenter] using hsurvives) }
  refine ⟨H', F', ⟨{
    residual := R'
    minimalPair := M'
    source_eq := rfl }⟩, ?_, ?_, ?_⟩
  · exact hqCenter
  · exact hwCenter
  · exact hsupport

/-- Package the first one-hit transition with its source relationship to the
old shell system. -/
theorem nonempty_qOmittedWHitReselection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hqMiss : Rmin.residual.interior.frontier.pair.q ∉
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwHit : Rmin.residual.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    Nonempty (QOmittedWHitReselection Rmin fresh hfreshA) := by
  rcases nonempty_reselected_minimalDistinct_of_q_omitted_w_hit
      Rmin hfreshA hqMiss hwHit with
    ⟨H', F', next, hretained, homitted, hsupport⟩
  exact ⟨{
    shell := H'
    frontier := F'
    next := next.some
    retained_center_eq := hretained
    omitted_center_eq := homitted
    retained_support_eq := hsupport }⟩

/-- Package the symmetric one-hit transition with its source relationship to
the old shell system. -/
theorem nonempty_wOmittedQHitReselection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hwMiss : Rmin.residual.interior.frontier.pair.w ∉
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hqHit : Rmin.residual.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    Nonempty (WOmittedQHitReselection Rmin fresh hfreshA) := by
  rcases nonempty_reselected_minimalDistinct_of_w_omitted_q_hit
      Rmin hfreshA hwMiss hqHit with
    ⟨H', F', next, hretained, homitted, hsupport⟩
  exact ⟨{
    shell := H'
    frontier := F'
    next := next.some
    retained_center_eq := hretained
    omitted_center_eq := homitted
    retained_support_eq := hsupport }⟩

/-- A first-orientation one-hit reselection whose installed fresh blocker is
genuinely different from the second endpoint's previous blocker. -/
structure StrictQOmittedWHitReselection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    (fresh : ℝ²) (hfreshA : fresh ∈ D.A) extends
      QOmittedWHitReselection Rmin fresh hfreshA where
  fresh_center_ne_old_retained_center :
    H.centerAt fresh hfreshA ≠
      H.centerAt Rmin.residual.interior.frontier.pair.w
        Rmin.residual.interior.frontier.pair.w_mem_A

/-- A symmetric one-hit reselection whose installed fresh blocker is
genuinely different from the first endpoint's previous blocker. -/
structure StrictWOmittedQHitReselection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    (fresh : ℝ²) (hfreshA : fresh ∈ D.A) extends
      WOmittedQHitReselection Rmin fresh hfreshA where
  fresh_center_ne_old_retained_center :
    H.centerAt fresh hfreshA ≠
      H.centerAt Rmin.residual.interior.frontier.pair.q
        Rmin.residual.interior.frontier.pair.q_mem_A

/-- A first-orientation one-hit row either reuses the second endpoint's old
blocker or supplies a strict shell reselection. -/
theorem freshBlocker_eq_oldWBlocker_or_strict_qOmittedWHitReselection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hqMiss : Rmin.residual.interior.frontier.pair.q ∉
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hwHit : Rmin.residual.interior.frontier.pair.w ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    H.centerAt fresh hfreshA =
        H.centerAt Rmin.residual.interior.frontier.pair.w
          Rmin.residual.interior.frontier.pair.w_mem_A ∨
      Nonempty (StrictQOmittedWHitReselection Rmin fresh hfreshA) := by
  by_cases hshared : H.centerAt fresh hfreshA =
      H.centerAt Rmin.residual.interior.frontier.pair.w
        Rmin.residual.interior.frontier.pair.w_mem_A
  · exact Or.inl hshared
  · exact Or.inr ⟨{
      toQOmittedWHitReselection :=
        (nonempty_qOmittedWHitReselection Rmin hfreshA hqMiss hwHit).some
      fresh_center_ne_old_retained_center := hshared }⟩

/-- A symmetric one-hit row either reuses the first endpoint's old blocker or
supplies a strict shell reselection. -/
theorem freshBlocker_eq_oldQBlocker_or_strict_wOmittedQHitReselection
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (Rmin : FirstApexUniqueRadiusExactFiveMinimalDistinctResidual F)
    {fresh : ℝ²} (hfreshA : fresh ∈ D.A)
    (hwMiss : Rmin.residual.interior.frontier.pair.w ∉
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support)
    (hqHit : Rmin.residual.interior.frontier.pair.q ∈
      (H.selectedAt fresh hfreshA).toCriticalFourShell.support) :
    H.centerAt fresh hfreshA =
        H.centerAt Rmin.residual.interior.frontier.pair.q
          Rmin.residual.interior.frontier.pair.q_mem_A ∨
      Nonempty (StrictWOmittedQHitReselection Rmin fresh hfreshA) := by
  by_cases hshared : H.centerAt fresh hfreshA =
      H.centerAt Rmin.residual.interior.frontier.pair.q
        Rmin.residual.interior.frontier.pair.q_mem_A
  · exact Or.inl hshared
  · exact Or.inr ⟨{
      toWOmittedQHitReselection :=
        (nonempty_wOmittedQHitReselection Rmin hfreshA hwMiss hqHit).some
      fresh_center_ne_old_retained_center := hshared }⟩

end ExactFiveOneHitShellReselection
end Problem97
