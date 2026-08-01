/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellAdapter
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.SemanticCore

/-!
# Live exact-five common-shell v7 packet

This file composes the geometric four-case adapter with the exact v7 order
enumeration.  Its output includes a semantic proof of every cyclic-alternation
clause represented by `CyclicAlternationSat`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open ATailCriticalPairFrontier
open FirstApexUniqueRadiusResidual
open Census554

/-- The live exact-five common-center residual supplies the labelled packet
used by the v7 encoder, including an encoder-indexed boundary order. -/
theorem exists_livePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F)
    (hcard : D.A.card = 11) :
    ∃ frame : MultiCenter.JointCapIndexFrame S.surplusIdx S.oppIndex1,
      ∃ L : Card11CapLabeling S.partition frame,
        ∃ P : CanonicalPacket L,
          L.pointOf 6 = R.interior.frontier.pair.q ∧
          L.pointOf 7 = R.interior.frontier.pair.w ∧
          L.pointOf 8 =
            H.centerAt R.interior.frontier.pair.q
              R.interior.frontier.pair.q_mem_A ∧
          CyclicAlternationSat P.boundaryOrder := by
  rcases
      _root_.Problem97.ATailFiniteN11ExactFiveCommonShellAdapter.exists_card11SelectedCube_with_canonical_firstApex_exactFive_shell
          R hcard with
    ⟨frame, L, C, h6, h7, h8, hsubset, hcases⟩
  obtain ⟨shellCase, hshell⟩ :=
    exists_shellCase_of_support_cases
      (L.toCard11Labeling.labelsOf
        (SelectedClass D.A S.oppApex1 radius))
      hcases
  rcases L.nonempty_directOrMirrorMacroCcwLabeling
      S D.convex D.K4 S.surplusIdx_ne_oppIndex1.symm frame with
    ⟨boundary⟩
  have hcenter : L.pointOf 1 = S.oppApex1 := by
    rw [L.point_one]
    rcases hs : S.surplusIdx with ⟨i, hi⟩
    interval_cases i <;>
      simp [apexAt, SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppIndex1, hs]
  let boundaryOrder : SelectedBoundaryOrder L.pointOf :=
    SelectedBoundaryOrder.ofDirectOrMirror boundary
  let P : CanonicalPacket L := {
    cube := C
    shellCase := shellCase
    shellLabels :=
      L.toCard11Labeling.labelsOf
        (SelectedClass D.A S.oppApex1 radius)
    shellLabels_eq := hshell
    shellRadius := radius
    shellRadius_pos := R.interior.frontier.radius_pos
    shellLabels_iff_radius := by
      intro label
      rw [Card11Labeling.mem_labelsOf, mem_selectedClass]
      constructor
      · intro h
        simpa only [hcenter, dist_comm] using h.2
      · intro h
        exact ⟨L.mem_carrier label, by
          simpa only [hcenter, dist_comm] using h⟩
    selectedAtOne_subset := hsubset
    boundaryOrder := boundaryOrder
  }
  refine ⟨frame, L, P, h6, h7, h8, ?_⟩
  exact cyclicAlternationSat D.convex hcard
    (_root_.Problem97.ExactFiveCommonShellV7.Card11Labeling.image_pointOf_eq
      L.toCard11Labeling)
    P.boundaryOrder

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.exists_livePacket
