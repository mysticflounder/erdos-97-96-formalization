/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3ClauseFamilySemantics
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.G3LocalFourGeometry

/-!
# Semantic cores for exact-blocker and source-deletion G3 clauses

The finite occurrence ledger supplies only row identities and mask bits.
These theorems discharge the corresponding metric and deletion-critical
contradictions uniformly.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open Census554.CoverIndexBridge

attribute [local instance] Classical.propDecidable

theorem evalClauseD_three_negative
    (σ : Nat → Bool) {first second third : Nat}
    (hcontra :
      σ first = true → σ second = true → σ third = true → False) :
    evalClauseD σ
      [-Int.ofNat first, -Int.ofNat second, -Int.ofNat third] = true := by
  by_cases hfirst : σ first = true
  · by_cases hsecond : σ second = true
    · by_cases hthird : σ third = true
      · exact (hcontra hfirst hsecond hthird).elim
      · have hthirdFalse := Bool.eq_false_of_not_eq_true hthird
        simp [evalClauseD, evalLitD, hthirdFalse]
    · have hsecondFalse := Bool.eq_false_of_not_eq_true hsecond
      simp [evalClauseD, evalLitD, hsecondFalse]
  · have hfirstFalse := Bool.eq_false_of_not_eq_true hfirst
    simp [evalClauseD, evalLitD, hfirstFalse]

theorem evalClauseD_four_negative
    (σ : Nat → Bool) {first second third fourth : Nat}
    (hcontra :
      σ first = true → σ second = true → σ third = true →
        σ fourth = true → False) :
    evalClauseD σ
      [-Int.ofNat first, -Int.ofNat second, -Int.ofNat third,
        -Int.ofNat fourth] = true := by
  by_cases hfirst : σ first = true
  · by_cases hsecond : σ second = true
    · by_cases hthird : σ third = true
      · by_cases hfourth : σ fourth = true
        · exact (hcontra hfirst hsecond hthird hfourth).elim
        · have hfourthFalse := Bool.eq_false_of_not_eq_true hfourth
          simp [evalClauseD, evalLitD, hfourthFalse]
      · have hthirdFalse := Bool.eq_false_of_not_eq_true hthird
        simp [evalClauseD, evalLitD, hthirdFalse]
    · have hsecondFalse := Bool.eq_false_of_not_eq_true hsecond
      simp [evalClauseD, evalLitD, hsecondFalse]
  · have hfirstFalse := Bool.eq_false_of_not_eq_true hfirst
    simp [evalClauseD, evalLitD, hfirstFalse]

/-- A used center and selected candidate row cannot assert equality between
one row member and one point outside the full blocker shell. -/
def exactBlockerClause
    (center : Label) (candidateIndex : Nat)
    (localEquality : Fin 495) : List Int :=
  [-Int.ofNat (encodeG3Var (.usedCenter center)),
    -Int.ofNat (xVar center.val candidateIndex),
    -Int.ofNat (encodeG3Var (.localEquality localEquality))]

/-- A selected source-center map cannot retain a four-class at that center
after deleting the source. -/
def sourceCenterNoQFreeClause
    (sourceCenter : Fin 92)
    (first second third : Fin 495) : List Int :=
  [-Int.ofNat (encodeG3Var (.sourceCenter sourceCenter)),
    -Int.ofNat (encodeG3Var (.localEquality first)),
    -Int.ofNat (encodeG3Var (.localEquality second)),
    -Int.ofNat (encodeG3Var (.localEquality third))]

/-- Decoding a true selected-row atom recovers the packet's canonical row
index. -/
theorem CanonicalPacket.selectedRowIndex_eq_baseIndex
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (center : Label) (candidateIndex : Nat)
    (hindex : candidateIndex < candCount center.val)
    (hselected :
      P.fullRadiusValuation shadow selected
        (xVar center.val candidateIndex) = true) :
    candidateIndex = P.baseIndex center.val := by
  have hxpos : 0 < xVar center.val candidateIndex :=
    one_le_xVar center.val candidateIndex
  have hxlt : xVar center.val candidateIndex < 27905 := by
    have hx := xVar_le_nX center.isLt hindex
    have hnX := nX_lt_pairIndicatorStart
    omega
  have hsourceChoice :
      P.fullSourceChoiceValuation shadow
        (xVar center.val candidateIndex) = true := by
    rw [← P.fullRadiusValuation_eq_fullSourceChoice_of_lt
      shadow selected hxpos (by omega)]
    exact hselected
  have hseparation :
      P.separationValuation (xVar center.val candidateIndex) = true := by
    rw [← P.fullSourceChoiceValuation_eq_separation_of_lt shadow hxlt]
    exact hsourceChoice
  have hbase :
      P.baseValuation (xVar center.val candidateIndex) = true := by
    rw [← P.separationValuation_x center.isLt hindex]
    exact hseparation
  exact (P.baseValuation_x_iff hP center.isLt hindex).mp hbase

theorem CanonicalPacket.exactBlockerClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (center inside outside : Label)
    (candidateIndex : Nat)
    (hindex : candidateIndex < candCount center.val)
    (localEquality : Fin 495)
    (hrow :
      localEqRow localEquality = ⟨center, inside, outside⟩ ∨
      localEqRow localEquality = ⟨center, outside, inside⟩)
    (hinside :
      ((candMasks center.val).getD candidateIndex 0).testBit
        inside.val = true)
    (houtside :
      ((candMasks center.val).getD candidateIndex 0).testBit
        outside.val = false) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (exactBlockerClause center candidateIndex localEquality) = true := by
  unfold exactBlockerClause
  apply evalClauseD_three_negative
  intro husedValue hselected hlocalValue
  rw [P.fullRadiusValuation_usedCenter] at husedValue
  rw [P.fullRadiusValuation_localEquality] at hlocalValue
  have hused : P.usedCenterHolds shadow center :=
    of_decide_eq_true husedValue
  have hlocal : P.localEqHolds (localEqRow localEquality) :=
    of_decide_eq_true hlocalValue
  have hexact := P.exactAt_usedCenter shadow center hused
  have hchosen :=
    P.selectedRowIndex_eq_baseIndex hP shadow selected center
      candidateIndex hindex hselected
  have hinside' : inside ∈ P.cube.cube center := by
    apply of_decide_eq_true
    rw [← coverIndex_testBit_of_cubeOk hP center inside]
    simpa [hchosen] using hinside
  have houtside' : outside ∉ P.cube.cube center := by
    apply of_decide_eq_false
    rw [← coverIndex_testBit_of_cubeOk hP center outside]
    simpa [hchosen] using houtside
  rcases hrow with hrow | hrow
  · rw [hrow] at hlocal
    exact P.not_localEqHolds_of_exactAt
      ⟨center, inside, outside⟩ hexact hinside' houtside' hlocal
  · rw [hrow] at hlocal
    exact P.not_localEqHolds_of_exactAt
      ⟨center, inside, outside⟩ hexact hinside' houtside' hlocal.symm

/-- A source-center map rules out every decoded four-class surviving deletion
of that source at the mapped center. -/
theorem CanonicalPacket.not_localFourHolds_of_sourceCenterHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (sourceCenter : SourceCenterRow) (localFour : Fin 2310)
    (hcenter :
      (localFourRow localFour).center = sourceCenter.center)
    (hdeleted :
      sourceCenter.source ∉ (localFourRow localFour).support)
    (hmap : P.sourceCenterHolds shadow sourceCenter) :
    ¬ P.localFourHolds (localFourRow localFour) := by
  intro hlocal
  have hfour :=
    P.localFourHolds_to_hasNEquidistantPointsAt_erase
      (localFourRow localFour) sourceCenter.source
      (localFourRow_mem_encoderLocalFourRows localFour)
      hdeleted hlocal
  have hcenterPoint :
      L.pointOf (localFourRow localFour).center =
        H.centerAt (L.pointOf sourceCenter.source)
          (L.mem_carrier sourceCenter.source) := by
    rw [hcenter, ← hmap]
    exact shadow.center_point_eq sourceCenter.source
  apply H.no_qfree_at (L.pointOf sourceCenter.source)
    (L.mem_carrier sourceCenter.source)
  simpa [hcenterPoint] using hfour

theorem CanonicalPacket.sourceCenterNoQFreeClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (sourceCenter : Fin 92) (localFour : Fin 2310)
    (first second third : Fin 495)
    (source center anchor point₁ point₂ point₃ : Label)
    (hsourceCenter :
      sourceCenterRow sourceCenter = ⟨source, center⟩)
    (hfour :
      localFourRow localFour =
        ⟨center, [anchor, point₁, point₂, point₃]⟩)
    (hfirst :
      localEqRow first = ⟨center, anchor, point₁⟩)
    (hsecond :
      localEqRow second = ⟨center, anchor, point₂⟩)
    (hthird :
      localEqRow third = ⟨center, anchor, point₃⟩)
    (hdeleted : source ∉ [anchor, point₁, point₂, point₃]) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (sourceCenterNoQFreeClause sourceCenter first second third) = true := by
  unfold sourceCenterNoQFreeClause
  apply evalClauseD_four_negative
  intro hmapValue hfirstValue hsecondValue hthirdValue
  rw [P.fullRadiusValuation_sourceCenter] at hmapValue
  rw [P.fullRadiusValuation_localEquality] at hfirstValue hsecondValue hthirdValue
  have hmap : P.sourceCenterHolds shadow (sourceCenterRow sourceCenter) :=
    of_decide_eq_true hmapValue
  have hfirstProp : P.localEqHolds (localEqRow first) :=
    of_decide_eq_true hfirstValue
  have hsecondProp : P.localEqHolds (localEqRow second) :=
    of_decide_eq_true hsecondValue
  have hthirdProp : P.localEqHolds (localEqRow third) :=
    of_decide_eq_true hthirdValue
  rw [hsourceCenter] at hmap
  rw [hfirst] at hfirstProp
  rw [hsecond] at hsecondProp
  rw [hthird] at hthirdProp
  have hlocal :
      P.localFourHolds
        ⟨center, [anchor, point₁, point₂, point₃]⟩ := by
    intro point hpoint
    change
      dist (L.pointOf center) (L.pointOf anchor) =
        dist (L.pointOf center) (L.pointOf point)
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hpoint
    rcases hpoint with rfl | rfl | rfl | rfl
    · rfl
    · exact hfirstProp
    · exact hsecondProp
    · exact hthirdProp
  have hnot := P.not_localFourHolds_of_sourceCenterHolds shadow
    ⟨source, center⟩ localFour
  apply hnot
  · simp [hfour]
  · simpa [hfour] using hdeleted
  · exact hmap
  · simpa [hfour] using hlocal

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.exactBlockerClause_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.not_localFourHolds_of_sourceCenterHolds
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.sourceCenterNoQFreeClause_sat
