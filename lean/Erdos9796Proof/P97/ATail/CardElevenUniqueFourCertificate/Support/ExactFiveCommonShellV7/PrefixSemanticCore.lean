/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.LivePacket
import Erdos9796Proof.P97.Census554.CoverIndexBridge

/-!
# Semantic core for the inherited exact-five common-shell prefix

The source-indexed encoder chooses, for every carrier label, a blocker center
whose selected four-row contains that source.  This file packages the exact
geometric producer for that finite shadow.  It deliberately uses the selected
cube row at the blocker center: `CriticalShellSystem` proves that any such row
is the source's named critical shell.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open Census554.CoverIndexBridge
open ATailCriticalPairFrontier
open FirstApexUniqueRadiusResidual
open U1LargeCapRouteBTailMetricResidualTarget

attribute [local instance] Classical.propDecidable

/-- The exact candidate-row index selected by a live canonical packet.  This
definition lives with the semantic packet so its constructed first-apex row
can expose the corresponding encoder fact directly. -/
noncomputable def CanonicalPacket.baseIndex
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) : Nat → Nat :=
  coverIndex P.cube.cube

/-- Semantic content of the source-indexed choice variables. -/
structure SourceIndexedShadow
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (H : CriticalShellSystem A) (L : Card11CapLabeling CP frame)
    (C : Card11SelectedCube L) where
  /-- Label of the chosen blocker center for each source label. -/
  centerOf : Label → Label
  /-- The chosen label denotes the actual critical-shell center. -/
  center_point_eq : ∀ source,
    L.pointOf (centerOf source) =
      H.centerAt (L.pointOf source) (L.mem_carrier source)
  /-- Deleting a source is witnessed by a selected row containing it. -/
  source_mem_cube : ∀ source, source ∈ C.cube (centerOf source)
  /-- A source is never its own blocker center. -/
  center_ne_source : ∀ source, centerOf source ≠ source

namespace SourceIndexedShadow

private def recenterSelectedFourClass
    {A : Finset ℝ²} {center center' : ℝ²}
    (K : SelectedFourClass A center) (h : center = center') :
    SelectedFourClass A center' where
  support := K.support
  support_subset_A := K.support_subset_A
  support_card := K.support_card
  radius := K.radius
  radius_pos := K.radius_pos
  support_eq_radius := by
    intro x hx
    simpa [← h] using K.support_eq_radius x hx
  center_not_mem := by
    simpa [← h] using K.center_not_mem

private theorem blockerCenter_mem
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : ℝ²) (hq : q ∈ A) :
    H.centerAt q hq ∈ A :=
  (Finset.mem_erase.mp
    (H.selectedAt q hq).toCriticalFourShell.center_mem).2

/-- Every critical-shell system and every independently selected geometric
cube induce a total functional source-indexed shadow. -/
noncomputable def ofCriticalShellSystem
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    (H : CriticalShellSystem A) (L : Card11CapLabeling CP frame)
    (C : Card11SelectedCube L) :
    SourceIndexedShadow H L C := by
  let centerOf : Label → Label := fun source =>
    Classical.choose
      (L.carrier_surjective
        (H.centerAt (L.pointOf source) (L.mem_carrier source))
        (blockerCenter_mem H (L.pointOf source)
          (L.mem_carrier source)))
  have hcenter : ∀ source,
      L.pointOf (centerOf source) =
        H.centerAt (L.pointOf source) (L.mem_carrier source) := by
    intro source
    exact Classical.choose_spec
      (L.carrier_surjective
        (H.centerAt (L.pointOf source) (L.mem_carrier source))
        (blockerCenter_mem H (L.pointOf source)
          (L.mem_carrier source)))
  refine {
    centerOf := centerOf
    center_point_eq := hcenter
    source_mem_cube := ?_
    center_ne_source := ?_ }
  · intro source
    rw [C.mem_cube_iff]
    let K : SelectedFourClass A
        (H.centerAt (L.pointOf source) (L.mem_carrier source)) :=
      recenterSelectedFourClass (C.classAt (centerOf source))
        (hcenter source)
    have hsource :
        L.pointOf source ∈ K.support :=
      H.source_mem_selectedFourClass
        (L.pointOf source) (L.mem_carrier source) K
    simpa [K] using hsource
  · intro source heq
    have hpoint :
        H.centerAt (L.pointOf source) (L.mem_carrier source) =
          L.pointOf source := by
      rw [← hcenter source, heq]
    let K : SelectedFourClass A
        (H.centerAt (L.pointOf source) (L.mem_carrier source)) :=
      recenterSelectedFourClass (C.classAt (centerOf source))
        (hcenter source)
    have hsource :
        L.pointOf source ∈ K.support :=
      H.source_mem_selectedFourClass
        (L.pointOf source) (L.mem_carrier source)
        K
    exact K.center_not_mem (by simpa [hpoint] using hsource)

end SourceIndexedShadow

/-- Remove one named point from a positive exact five-point radius class. -/
noncomputable def selectedFourClassOfExactFiveErase
    {A : Finset ℝ²} {center : ℝ²} {radius : ℝ} {removed : ℝ²}
    (hradius : 0 < radius)
    (hcard : (SelectedClass A center radius).card = 5)
    (hremoved : removed ∈ SelectedClass A center radius) :
    SelectedFourClass A center where
  support := (SelectedClass A center radius).erase removed
  support_subset_A := by
    intro x hx
    exact (mem_selectedClass.mp (Finset.mem_of_mem_erase hx)).1
  support_card := by
    rw [Finset.card_erase_of_mem hremoved, hcard]
  radius := radius
  radius_pos := hradius
  support_eq_radius := by
    intro x hx
    exact (mem_selectedClass.mp (Finset.mem_of_mem_erase hx)).2
  center_not_mem := by
    intro hcenter
    have hdist :=
      (mem_selectedClass.mp (Finset.mem_of_mem_erase hcenter)).2
    rw [dist_self] at hdist
    linarith

set_option maxHeartbeats 1000000 in
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
/-- The encoder index of the four-row obtained by deleting the named `0/9`
point from this shell case. -/
def ShellCase.erasedCandidateIndex (shellCase : ShellCase) : Nat :=
  match shellCase.surplus with
  | .labelTwo => 13
  | .labelThree => 20

/-- Exact finite decoder fact for the constructed erased shell row. -/
private theorem erasedShellCandidateIndex_eq
    (shellCase : ShellCase) (candidateIndex : Nat)
    (hindex : candidateIndex < candCount 1)
    (hmask :
      (candMasks 1).getD candidateIndex 0 =
        classMask
          (shellCase.support.erase shellCase.other.label)) :
    candidateIndex = shellCase.erasedCandidateIndex := by
  native_decide +revert

/-- Strengthened live packet matching the inherited source-indexed CNF:

* the selected row at apex label `1` contains the two named sources `6,7`;
* every source has a total selected blocker-row shadow;
* both named sources choose the common blocker label `8`;
* the selected cube satisfies the complete Census554 base predicate; and
* the v7 cyclic-alternation suffix is semantically satisfied.

The center-`1` row is obtained by deleting the shell's `0/9` point from the
exact five-point class.  This repairs the gap left by an arbitrary global-K4
choice at that center.
-/
theorem exists_livePrefixPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F)
    (hcard : D.A.card = 11) :
    ∃ frame : MultiCenter.JointCapIndexFrame S.surplusIdx S.oppIndex1,
      ∃ L : Card11CapLabeling S.partition frame,
        ∃ P : CanonicalPacket L,
          ∃ sourceShadow : SourceIndexedShadow H L P.cube,
            L.pointOf 6 = R.interior.frontier.pair.q ∧
            L.pointOf 7 = R.interior.frontier.pair.w ∧
            L.pointOf 8 =
              H.centerAt R.interior.frontier.pair.q
                R.interior.frontier.pair.q_mem_A ∧
            6 ∈ P.cube.cube 1 ∧
            7 ∈ P.cube.cube 1 ∧
            sourceShadow.centerOf 6 = 8 ∧
            sourceShadow.centerOf 7 = 8 ∧
            P.baseIndex 1 = P.shellCase.erasedCandidateIndex ∧
            CubeOk P.cube.cube ∧
            CyclicAlternationSat P.boundaryOrder := by
  rcases
      _root_.Problem97.ATailFiniteN11ExactFiveCommonShellAdapter.exists_card11SelectedCube_with_canonical_firstApex_exactFive_shell
        R hcard with
    ⟨frame, L, C₀, h6, h7, h8, _hsubset, hcases⟩
  let T : Finset ℝ² := SelectedClass D.A S.oppApex1 radius
  obtain ⟨shellCase, hshell⟩ :=
    exists_shellCase_of_support_cases
      (L.toCard11Labeling.labelsOf T) (by simpa [T] using hcases)
  let removed : ℝ² := L.pointOf shellCase.other.label
  have shellMember_point_mem_T :
      ∀ label ∈ shellCase.support, L.pointOf label ∈ T := by
    intro label hlabel
    apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mp
    rw [hshell]
    exact hlabel
  have hremoved : removed ∈ T := by
    apply shellMember_point_mem_T shellCase.other.label
    simp [ShellCase.support]
  have hcenter : L.pointOf 1 = S.oppApex1 := by
    rw [L.point_one]
    rcases hs : S.surplusIdx with ⟨i, hi⟩
    interval_cases i <;>
      simp [apexAt, SurplusCapPacket.oppApex1,
        SurplusCapPacket.oppIndex1, hs]
  let K₁ : SelectedFourClass D.A (L.pointOf 1) := {
    support := T.erase removed
    support_subset_A := by
      intro x hx
      exact
        (mem_selectedClass.mp (Finset.mem_of_mem_erase hx)).1
    support_card := by
      rw [Finset.card_erase_of_mem hremoved]
      have hTcard : T.card = 5 := by
        simpa [T] using R.class_card_eq_five
      omega
    radius := radius
    radius_pos := R.interior.frontier.radius_pos
    support_eq_radius := by
      intro x hx
      rw [hcenter]
      exact
        (mem_selectedClass.mp (Finset.mem_of_mem_erase hx)).2
    center_not_mem := by
      intro hmem
      have hdist :=
        (mem_selectedClass.mp (Finset.mem_of_mem_erase hmem)).2
      rw [← hcenter, dist_self] at hdist
      exact (ne_of_gt R.interior.frontier.radius_pos) hdist.symm }
  let C : Card11SelectedCube L := {
    classAt := fun p =>
      if hp : p = 1 then by
        subst p
        exact K₁
      else C₀.classAt p }
  have hclassAtOne : C.classAt 1 = K₁ := by
    simp [C]
  have hKsupport : K₁.support = T.erase removed := by
    rfl
  have hsixT : L.pointOf 6 ∈ T :=
    shellMember_point_mem_T 6 (by simp [ShellCase.support])
  have hsevenT : L.pointOf 7 ∈ T :=
    shellMember_point_mem_T 7 (by simp [ShellCase.support])
  have hsix_ne_removed : L.pointOf 6 ≠ removed := by
    apply L.injective.ne
    cases shellCase.other <;> decide
  have hseven_ne_removed : L.pointOf 7 ≠ removed := by
    apply L.injective.ne
    cases shellCase.other <;> decide
  have hsixCube : 6 ∈ C.cube 1 := by
    rw [C.mem_cube_iff, hclassAtOne, hKsupport]
    exact Finset.mem_erase.mpr ⟨hsix_ne_removed, hsixT⟩
  have hsevenCube : 7 ∈ C.cube 1 := by
    rw [C.mem_cube_iff, hclassAtOne, hKsupport]
    exact Finset.mem_erase.mpr ⟨hseven_ne_removed, hsevenT⟩
  have hcubeOne :
      C.cube 1 =
        shellCase.support.erase shellCase.other.label := by
    ext label
    rw [C.mem_cube_iff, hclassAtOne, hKsupport]
    constructor
    · intro hlabel
      obtain ⟨hne, hmem⟩ := Finset.mem_erase.mp hlabel
      apply Finset.mem_erase.mpr
      refine ⟨?_, ?_⟩
      · intro heq
        apply hne
        simp [removed, heq]
      · rw [← hshell]
        exact
          (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr hmem
    · intro hlabel
      obtain ⟨hne, hmem⟩ := Finset.mem_erase.mp hlabel
      apply Finset.mem_erase.mpr
      refine ⟨?_, ?_⟩
      · intro heq
        apply hne
        apply L.injective
        simpa [removed] using heq
      · apply
          (Card11Labeling.mem_labelsOf L.toCard11Labeling).mp
        rw [hshell]
        exact hmem
  have hcubeSub :
      C.cube 1 ⊆ L.toCard11Labeling.labelsOf T := by
    intro label hlabel
    apply (Card11Labeling.mem_labelsOf L.toCard11Labeling).mpr
    rw [C.mem_cube_iff, hclassAtOne, hKsupport] at hlabel
    exact Finset.mem_of_mem_erase hlabel
  rcases L.nonempty_directOrMirrorMacroCcwLabeling
      S D.convex D.K4 S.surplusIdx_ne_oppIndex1.symm frame with
    ⟨boundary⟩
  let boundaryOrder : SelectedBoundaryOrder L.pointOf :=
    SelectedBoundaryOrder.ofDirectOrMirror boundary
  let P : CanonicalPacket L := {
    cube := C
    shellCase := shellCase
    shellLabels := L.toCard11Labeling.labelsOf T
    shellLabels_eq := hshell
    shellRadius := radius
    shellRadius_pos := R.interior.frontier.radius_pos
    shellLabels_iff_radius := by
      intro label
      rw [Card11Labeling.mem_labelsOf, mem_selectedClass]
      constructor
      · intro h
        simpa only [T, hcenter, dist_comm] using h.2
      · intro h
        exact ⟨L.mem_carrier label, by
          simpa only [T, hcenter, dist_comm] using h⟩
    selectedAtOne_subset := hcubeSub
    boundaryOrder := boundaryOrder }
  let sourceShadow : SourceIndexedShadow H L P.cube :=
    SourceIndexedShadow.ofCriticalShellSystem H L P.cube
  have hsourceSix :
      H.centerAt (L.pointOf 6) (L.mem_carrier 6) =
        L.pointOf 8 := by
    simpa only [h6] using h8.symm
  have hsourceSeven :
      H.centerAt (L.pointOf 7) (L.mem_carrier 7) =
        L.pointOf 8 := by
    simpa only [h6, h7] using R.obstructionCenters_eq.symm.trans h8.symm
  have hshadowSix : sourceShadow.centerOf 6 = 8 := by
    apply L.injective
    exact (sourceShadow.center_point_eq 6).trans hsourceSix
  have hshadowSeven : sourceShadow.centerOf 7 = 8 := by
    apply L.injective
    exact (sourceShadow.center_point_eq 7).trans hsourceSeven
  have hinter :
      3 ≤ (SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1).card :=
    ATailUniqueRowProducerScratch.firstApex_cardFive_interior_card_ge_three
      D S R.interior.frontier.radius_pos R.class_card_eq_five
  have hcapAdd :
      (S.capInteriorByIndex S.oppIndex1).card + 2 =
        (S.capByIndex S.oppIndex1).card :=
    ATailCapApexRadiusRigidity.capInteriorByIndex_card_add_two
      S S.oppIndex1
  have hsecond5' : 5 ≤ (S.capByIndex S.oppIndex1).card := by
    have hIge : 3 ≤ (S.capInteriorByIndex S.oppIndex1).card :=
      hinter.trans (Finset.card_le_card Finset.inter_subset_right)
    omega
  have hsecond5 : 5 ≤ (S.partition.capAt S.oppIndex1).card := by
    rcases hi : S.oppIndex1 with ⟨i, hiLt⟩
    interval_cases i <;>
      simpa [SurplusCapPacket.capByIndex, CapTriple.capAt, hi] using hsecond5'
  have hprofile :=
    capProfile_eq_554_of_card_eq_eleven
      S.triangleNonObtuse S.hCirc S.partition rfl
      (S.surplusIdx_ne_oppIndex1).symm S.surplus hsecond5 hcard
  have hcubeOk : CubeOk P.cube.cube := by
    exact P.cube.cubeOk S D.convex
      (S.surplusIdx_ne_oppIndex1).symm frame L
      hprofile.1 hprofile.2.1
      (hprofile.2.2 frame.rest frame.rest_ne_surplus
        frame.rest_ne_second)
  have hApexChoice :
      P.baseIndex 1 = P.shellCase.erasedCandidateIndex := by
    apply erasedShellCandidateIndex_eq P.shellCase (P.baseIndex 1)
    · exact coverIndex_lt_of_cubeOk hcubeOk (by omega)
    · have hmask :=
        getD_coverIndex_of_cubeOk hcubeOk (1 : Label)
      have hPcubeOne :
          P.cube.cube 1 =
            P.shellCase.support.erase P.shellCase.other.label := by
        simpa [P] using hcubeOne
      simpa [CanonicalPacket.baseIndex, hPcubeOne] using hmask
  have hcyclic : CyclicAlternationSat P.boundaryOrder :=
    cyclicAlternationSat D.convex hcard
      (Card11Labeling.image_pointOf_eq L.toCard11Labeling)
      P.boundaryOrder
  exact ⟨frame, L, P, sourceShadow, h6, h7, h8,
    hsixCube, hsevenCube, hshadowSix, hshadowSeven, hApexChoice,
    hcubeOk, hcyclic⟩

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.SourceIndexedShadow.ofCriticalShellSystem
#print axioms Problem97.ExactFiveCommonShellV7.exists_livePrefixPacket
