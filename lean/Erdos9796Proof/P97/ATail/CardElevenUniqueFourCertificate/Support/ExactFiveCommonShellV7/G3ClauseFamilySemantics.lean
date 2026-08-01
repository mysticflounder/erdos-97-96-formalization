/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.FullRadiusSemantics

/-!
# Semantic contracts for exact-eleven G3 clause families

This file proves the reusable mathematical implications behind the retained
G3 source families.  A downstream authenticated ledger records only which
family instance generated each retained checkpoint clause.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open Census554.CoverIndexBridge

attribute [local instance] Classical.propDecidable

/-- A Boolean implication satisfies its signed binary DIMACS clause. -/
theorem evalClauseD_binary_implication
    (σ : Nat → Bool) {left right : Nat} (hright : 0 < right)
    (himp : σ left = true → σ right = true) :
    evalClauseD σ [-Int.ofNat left, Int.ofNat right] = true := by
  by_cases hleft : σ left = true
  · have hrightValue := himp hleft
    simp [evalClauseD, evalLitD, hright, hleft, hrightValue]
  · have hleftValue : σ left = false :=
      Bool.eq_false_of_not_eq_true hleft
    simp [evalClauseD, evalLitD, hright, hleftValue]

/-- The exact signed clause emitted for one local-equality transitivity
implication. -/
def localEqTransitivityClause
    (left middle right : Fin 495) : List Int :=
  [-Int.ofNat (encodeG3Var (.localEquality left)),
    -Int.ofNat (encodeG3Var (.localEquality middle)),
    Int.ofNat (encodeG3Var (.localEquality right))]

/-- The exact signed clause emitted for one global-equality transitivity
implication. -/
def globalEqTransitivityClause
    (left middle right : Fin 1485) : List Int :=
  [-Int.ofNat (encodeG3Var (.globalEquality left)),
    -Int.ofNat (encodeG3Var (.globalEquality middle)),
    Int.ofNat (encodeG3Var (.globalEquality right))]

/-- The source-center map atom implies the corresponding used-center atom. -/
def sourceCenterUsedClause
    (sourceCenter : Fin 92) (center : Label) : List Int :=
  [-Int.ofNat (encodeG3Var (.sourceCenter sourceCenter)),
    Int.ofNat (encodeG3Var (.usedCenter center))]

/-- A selected encoder row implies the corresponding center-local equality
whenever both endpoints occur in that candidate mask. -/
theorem CanonicalPacket.localEqHolds_of_selectedRow
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (center : Label) (candidateIndex : Nat)
    (hindex : candidateIndex < candCount center.val)
    (left right : Label)
    (hleft :
      ((candMasks center.val).getD candidateIndex 0).testBit left.val =
        true)
    (hright :
      ((candMasks center.val).getD candidateIndex 0).testBit right.val =
        true)
    (hselected :
      P.fullRadiusValuation shadow selected
        (xVar center.val candidateIndex) = true) :
    P.localEqHolds ⟨center, left, right⟩ := by
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
  have hchosen : candidateIndex = P.baseIndex center.val :=
    (P.baseValuation_x_iff hP center.isLt hindex).mp hbase
  rw [hchosen] at hleft hright
  change
    ((candMasks center.val).getD
      (coverIndex P.cube.cube center.val) 0).testBit left.val = true
      at hleft
  change
    ((candMasks center.val).getD
      (coverIndex P.cube.cube center.val) 0).testBit right.val = true
      at hright
  rw [coverIndex_testBit_of_cubeOk hP] at hleft hright
  exact P.localEqHolds_of_mem_cube ⟨center, left, right⟩
    (of_decide_eq_true hleft) (of_decide_eq_true hright)

/-- Selected-row implication to a center-local equality atom. -/
def selectedLocalEqClause
    (center : Label) (candidateIndex : Nat)
    (localEquality : Fin 495) : List Int :=
  [-Int.ofNat (xVar center.val candidateIndex),
    Int.ofNat (encodeG3Var (.localEquality localEquality))]

/-- Selected-row implication to a global edge-equality atom. -/
def selectedGlobalEqClause
    (center : Label) (candidateIndex : Nat)
    (globalEquality : Fin 1485) : List Int :=
  [-Int.ofNat (xVar center.val candidateIndex),
    Int.ofNat (encodeG3Var (.globalEquality globalEquality))]

/-- One direction of the local-four Tseitin equivalence: a four-class helper
implies one of its three anchor equalities. -/
def localFourForwardClause
    (localFour : Fin 2310) (localEquality : Fin 495) : List Int :=
  [-Int.ofNat (encodeG3Var (.localFour localFour)),
    Int.ofNat (encodeG3Var (.localEquality localEquality))]

/-- The reverse local-four Tseitin clause: the three anchor equalities imply
the four-class helper. -/
def localFourReverseClause
    (localFour : Fin 2310)
    (first second third : Fin 495) : List Int :=
  [Int.ofNat (encodeG3Var (.localFour localFour)),
    -Int.ofNat (encodeG3Var (.localEquality first)),
    -Int.ofNat (encodeG3Var (.localEquality second)),
    -Int.ofNat (encodeG3Var (.localEquality third))]

/-- One local four-class witness implies the corresponding deleted-pair
helper. -/
def qDeletedPairForwardClause
    (localFour : Fin 2310) (qDeletedPair : Fin 3960) : List Int :=
  [-Int.ofNat (encodeG3Var (.localFour localFour)),
    Int.ofNat (encodeG3Var (.qDeletedPair qDeletedPair))]

/-- The deleted-pair helper implies that at least one listed local four-class
is a witness.  The authenticated family decoder supplies the exact 21-element
list used by the source encoder. -/
def qDeletedPairReverseClause
    (qDeletedPair : Fin 3960) (witnesses : List (Fin 2310)) : List Int :=
  -Int.ofNat (encodeG3Var (.qDeletedPair qDeletedPair)) ::
    witnesses.map fun localFour =>
      Int.ofNat (encodeG3Var (.localFour localFour))

/-- A positive literal already present in a clause discharges its DIMACS
evaluation. -/
theorem evalClauseD_of_positive_mem
    (σ : Nat → Bool) {right : Nat} (hright : 0 < right)
    {clause : List Int} (hmem : Int.ofNat right ∈ clause)
    (htrue : σ right = true) :
    evalClauseD σ clause = true := by
  unfold evalClauseD
  apply List.any_eq_true.mpr
  refine ⟨Int.ofNat right, hmem, ?_⟩
  simp [evalLitD, hright, htrue]

/-- Four Boolean premises implying one conclusion satisfy the corresponding
four-literal DIMACS clause. -/
theorem evalClauseD_three_to_one
    (σ : Nat → Bool) {result first second third : Nat}
    (hresult : 0 < result)
    (himp :
      σ first = true → σ second = true → σ third = true →
        σ result = true) :
    evalClauseD σ
      [Int.ofNat result, -Int.ofNat first, -Int.ofNat second,
        -Int.ofNat third] = true := by
  by_cases hfirst : σ first = true
  · by_cases hsecond : σ second = true
    · by_cases hthird : σ third = true
      · have hresultValue := himp hfirst hsecond hthird
        simp [evalClauseD, evalLitD, hresult, hfirst, hsecond, hthird,
          hresultValue]
      · have hthirdValue : σ third = false :=
          Bool.eq_false_of_not_eq_true hthird
        simp [evalClauseD, evalLitD, hfirst, hsecond, hthirdValue]
    · have hsecondValue : σ second = false :=
        Bool.eq_false_of_not_eq_true hsecond
      simp [evalClauseD, evalLitD, hfirst, hsecondValue]
  · have hfirstValue : σ first = false :=
      Bool.eq_false_of_not_eq_true hfirst
    simp [evalClauseD, evalLitD, hfirstValue]

/-- Every decoded local-four row is one of the encoder rows. -/
theorem localFourRow_mem_encoderLocalFourRows (index : Fin 2310) :
    localFourRow index ∈ encoderLocalFourRows := by
  exact List.get_mem _ _

/-- The full-radius valuation satisfies the exact G3 selector-totality
clause. -/
theorem CanonicalPacket.fullRadiusSelectorTotalityClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      g3SelectorTotalityClause = true := by
  apply evalClauseD_of_positive_mem _
      (right := g3SelectorVar selected)
      (by cases selected <;> decide)
  · cases selected <;> decide
  · rw [P.fullRadiusValuation_selector]
    simp

/-- An unselected route discharges a guarded G3 clause through its negative
selector literal under the full-radius valuation. -/
theorem CanonicalPacket.fullRadiusGuardedClause_sat_of_unselected
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    {selected route : G3Case} (hne : route ≠ selected)
    (payload : List Int) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (g3GuardedClause route payload) = true := by
  have hguard :
      evalLitD (P.fullRadiusValuation shadow selected)
        (-Int.ofNat (g3SelectorVar route)) = true := by
    rw [evalLitD_negNat, P.fullRadiusValuation_selector]
    simp [hne]
  simp only [g3GuardedClause, evalClauseD, List.any_cons]
  rw [hguard]
  rfl

/-- On the selected route, evaluation of a guarded clause reduces to its
payload. -/
theorem CanonicalPacket.eval_fullRadiusGuardedClause_selected
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (payload : List Int) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (g3GuardedClause selected payload) =
        evalClauseD (P.fullRadiusValuation shadow selected) payload := by
  have hguard :
      evalLitD (P.fullRadiusValuation shadow selected)
        (-Int.ofNat (g3SelectorVar selected)) = false := by
    rw [evalLitD_negNat, P.fullRadiusValuation_selector]
    simp
  simp only [g3GuardedClause, evalClauseD, List.any_cons]
  rw [hguard, Bool.false_or]

/-- Generic full-radius route-guard dispatcher. -/
theorem CanonicalPacket.fullRadiusGuardedClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    {selected route : G3Case} (payload : List Int)
    (hpayload :
      route = selected →
        evalClauseD (P.fullRadiusValuation shadow selected) payload = true) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (g3GuardedClause route payload) = true := by
  by_cases hroute : route = selected
  · subst route
    rw [P.eval_fullRadiusGuardedClause_selected shadow]
    exact hpayload rfl
  · exact P.fullRadiusGuardedClause_sat_of_unselected shadow hroute payload

/-- Every decoded local-equality transitivity instance is satisfied. -/
theorem CanonicalPacket.localEqTransitivityClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (left middle right : Fin 495)
    (center first pivot last : Label)
    (hleft : localEqRow left = ⟨center, first, pivot⟩)
    (hmiddle : localEqRow middle = ⟨center, pivot, last⟩)
    (hright : localEqRow right = ⟨center, first, last⟩) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (localEqTransitivityClause left middle right) = true := by
  unfold localEqTransitivityClause
  apply evalClauseD_transitivityClause _
      (encodeG3Var_pos (.localEquality right))
  intro hleftValue hmiddleValue
  rw [P.fullRadiusValuation_localEquality] at hleftValue hmiddleValue
  rw [P.fullRadiusValuation_localEquality]
  have hleftProp : P.localEqHolds (localEqRow left) :=
    of_decide_eq_true hleftValue
  have hmiddleProp : P.localEqHolds (localEqRow middle) :=
    of_decide_eq_true hmiddleValue
  have hresult : P.localEqHolds (localEqRow right) := by
    rw [hleft] at hleftProp
    rw [hmiddle] at hmiddleProp
    rw [hright]
    exact P.localEqHolds_trans center first pivot last
      hleftProp hmiddleProp
  exact decide_eq_true hresult

/-- Every decoded global-equality transitivity instance is satisfied. -/
theorem CanonicalPacket.globalEqTransitivityClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (left middle right : Fin 1485)
    (first pivot last : RawEdge)
    (hleft : globalEqRow left = (first, pivot))
    (hmiddle : globalEqRow middle = (pivot, last))
    (hright : globalEqRow right = (first, last)) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (globalEqTransitivityClause left middle right) = true := by
  unfold globalEqTransitivityClause
  apply evalClauseD_transitivityClause _
      (encodeG3Var_pos (.globalEquality right))
  intro hleftValue hmiddleValue
  rw [P.fullRadiusValuation_globalEquality] at hleftValue hmiddleValue
  rw [P.fullRadiusValuation_globalEquality]
  have hleftProp : P.globalEqHolds (globalEqRow left) :=
    of_decide_eq_true hleftValue
  have hmiddleProp : P.globalEqHolds (globalEqRow middle) :=
    of_decide_eq_true hmiddleValue
  have hresult : P.globalEqHolds (globalEqRow right) := by
    rw [hleft] at hleftProp
    rw [hmiddle] at hmiddleProp
    rw [hright]
    exact hleftProp.trans hmiddleProp
  exact decide_eq_true hresult

/-- Every decoded source-center-to-used-center implication is satisfied. -/
theorem CanonicalPacket.sourceCenterUsedClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (sourceCenter : Fin 92)
    (source center : Label)
    (hrow : sourceCenterRow sourceCenter = ⟨source, center⟩) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (sourceCenterUsedClause sourceCenter center) = true := by
  unfold sourceCenterUsedClause
  apply evalClauseD_binary_implication _
      (encodeG3Var_pos (.usedCenter center))
  intro hsourceValue
  rw [P.fullRadiusValuation_sourceCenter] at hsourceValue
  rw [P.fullRadiusValuation_usedCenter]
  have hsource :
      P.sourceCenterHolds shadow (sourceCenterRow sourceCenter) :=
    of_decide_eq_true hsourceValue
  rw [hrow] at hsource
  exact decide_eq_true
    (P.sourceCenterHolds_usedCenterHolds shadow
      ⟨source, center⟩ hsource)

/-- Every decoded selected-row-to-local-equality seed is satisfied. -/
theorem CanonicalPacket.selectedLocalEqClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (center : Label) (candidateIndex : Nat)
    (hindex : candidateIndex < candCount center.val)
    (localEquality : Fin 495) (left right : Label)
    (hrow : localEqRow localEquality = ⟨center, left, right⟩)
    (hleft :
      ((candMasks center.val).getD candidateIndex 0).testBit left.val =
        true)
    (hright :
      ((candMasks center.val).getD candidateIndex 0).testBit right.val =
        true) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (selectedLocalEqClause center candidateIndex localEquality) = true := by
  unfold selectedLocalEqClause
  apply evalClauseD_binary_implication _
      (encodeG3Var_pos (.localEquality localEquality))
  intro hselected
  rw [P.fullRadiusValuation_localEquality]
  have hlocal :
      P.localEqHolds ⟨center, left, right⟩ :=
    P.localEqHolds_of_selectedRow hP shadow selected center candidateIndex
      hindex left right hleft hright hselected
  rw [hrow]
  exact decide_eq_true hlocal

/-- Every decoded selected-row-to-global-equality seed is satisfied when its
global row is the corresponding pair of incident edges. -/
theorem CanonicalPacket.selectedGlobalEqClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (center : Label) (candidateIndex : Nat)
    (hindex : candidateIndex < candCount center.val)
    (globalEquality : Fin 1485) (left right : Label)
    (hrow :
      globalEqRow globalEquality =
        (canonicalEdge center left, canonicalEdge center right))
    (hleft :
      ((candMasks center.val).getD candidateIndex 0).testBit left.val =
        true)
    (hright :
      ((candMasks center.val).getD candidateIndex 0).testBit right.val =
        true) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (selectedGlobalEqClause center candidateIndex globalEquality) = true := by
  unfold selectedGlobalEqClause
  apply evalClauseD_binary_implication _
      (encodeG3Var_pos (.globalEquality globalEquality))
  intro hselected
  rw [P.fullRadiusValuation_globalEquality]
  have hlocal :
      P.localEqHolds ⟨center, left, right⟩ :=
    P.localEqHolds_of_selectedRow hP shadow selected center candidateIndex
      hindex left right hleft hright hselected
  have hglobal :
      P.globalEqHolds
        (canonicalEdge center left, canonicalEdge center right) := by
    change
      edgeDistance L.pointOf (canonicalEdge center left) =
        edgeDistance L.pointOf (canonicalEdge center right)
    rw [edgeDistance_canonicalEdge, edgeDistance_canonicalEdge]
    exact hlocal
  rw [hrow]
  exact decide_eq_true hglobal

/-- Every forward local-four definition clause is satisfied when its decoded
local equality is one of the helper's anchor equalities. -/
theorem CanonicalPacket.localFourForwardClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (localFour : Fin 2310)
    (localEquality : Fin 495) (center anchor point : Label)
    (support : List Label)
    (hfour : localFourRow localFour = ⟨center, support⟩)
    (hequality :
      localEqRow localEquality = ⟨center, anchor, point⟩)
    (hanchor : support.getD 0 0 = anchor)
    (hpoint : point ∈ support) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (localFourForwardClause localFour localEquality) = true := by
  unfold localFourForwardClause
  apply evalClauseD_binary_implication _
      (encodeG3Var_pos (.localEquality localEquality))
  intro hlocalValue
  rw [P.fullRadiusValuation_localFour] at hlocalValue
  rw [P.fullRadiusValuation_localEquality]
  have hlocal : P.localFourHolds (localFourRow localFour) :=
    of_decide_eq_true hlocalValue
  rw [hfour] at hlocal
  have heq :
      dist (L.pointOf center) (L.pointOf anchor) =
        dist (L.pointOf center) (L.pointOf point) := by
    rw [← hanchor]
    exact hlocal point hpoint
  rw [hequality]
  exact decide_eq_true heq

/-- Every reverse local-four definition clause is satisfied once the decoder
identifies the support and its three anchor-equality rows. -/
theorem CanonicalPacket.localFourReverseClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (localFour : Fin 2310)
    (first second third : Fin 495)
    (center anchor point₁ point₂ point₃ : Label)
    (hfour :
      localFourRow localFour =
        ⟨center, [anchor, point₁, point₂, point₃]⟩)
    (hfirst :
      localEqRow first = ⟨center, anchor, point₁⟩)
    (hsecond :
      localEqRow second = ⟨center, anchor, point₂⟩)
    (hthird :
      localEqRow third = ⟨center, anchor, point₃⟩) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (localFourReverseClause localFour first second third) = true := by
  unfold localFourReverseClause
  apply evalClauseD_three_to_one _
      (encodeG3Var_pos (.localFour localFour))
  intro hfirstValue hsecondValue hthirdValue
  rw [P.fullRadiusValuation_localEquality] at hfirstValue hsecondValue hthirdValue
  rw [P.fullRadiusValuation_localFour]
  have hfirstProp : P.localEqHolds (localEqRow first) :=
    of_decide_eq_true hfirstValue
  have hsecondProp : P.localEqHolds (localEqRow second) :=
    of_decide_eq_true hsecondValue
  have hthirdProp : P.localEqHolds (localEqRow third) :=
    of_decide_eq_true hthirdValue
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
  rw [hfour]
  exact decide_eq_true hlocal

/-- Every forward deleted-pair definition clause is satisfied when the
decoded local four-class has the required support incidence. -/
theorem CanonicalPacket.qDeletedPairForwardClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (localFour : Fin 2310)
    (qDeletedPair : Fin 3960)
    (hcenter :
      (localFourRow localFour).center =
        (qDeletedPairRow qDeletedPair).center)
    (hdeleted :
      (qDeletedPairRow qDeletedPair).deleted ∉
        (localFourRow localFour).support)
    (hfirst :
      (qDeletedPairRow qDeletedPair).first ∈
        (localFourRow localFour).support)
    (hsecond :
      (qDeletedPairRow qDeletedPair).second ∈
        (localFourRow localFour).support) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (qDeletedPairForwardClause localFour qDeletedPair) = true := by
  unfold qDeletedPairForwardClause
  apply evalClauseD_binary_implication _
      (encodeG3Var_pos (.qDeletedPair qDeletedPair))
  intro hlocalValue
  rw [P.fullRadiusValuation_localFour] at hlocalValue
  rw [P.fullRadiusValuation_qDeletedPair]
  have hlocal : P.localFourHolds (localFourRow localFour) :=
    of_decide_eq_true hlocalValue
  apply decide_eq_true
  exact ⟨localFourRow localFour,
    localFourRow_mem_encoderLocalFourRows localFour,
    hcenter, hdeleted, hfirst, hsecond, hlocal⟩

/-- Every reverse deleted-pair definition clause is satisfied when the
authenticated witness list is complete for the decoded deleted pair. -/
theorem CanonicalPacket.qDeletedPairReverseClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (qDeletedPair : Fin 3960)
    (witnesses : List (Fin 2310))
    (hcomplete :
      ∀ candidate ∈ encoderLocalFourRows,
        candidate.center = (qDeletedPairRow qDeletedPair).center →
        (qDeletedPairRow qDeletedPair).deleted ∉ candidate.support →
        (qDeletedPairRow qDeletedPair).first ∈ candidate.support →
        (qDeletedPairRow qDeletedPair).second ∈ candidate.support →
        ∃ localFour ∈ witnesses, localFourRow localFour = candidate) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (qDeletedPairReverseClause qDeletedPair witnesses) = true := by
  by_cases hpairValue :
      P.fullRadiusValuation shadow selected
        (encodeG3Var (.qDeletedPair qDeletedPair)) = true
  · rw [P.fullRadiusValuation_qDeletedPair] at hpairValue
    have hpair : P.qDeletedPairHolds (qDeletedPairRow qDeletedPair) :=
      of_decide_eq_true hpairValue
    rcases hpair with
      ⟨candidate, hcandidate, hcenter, hdeleted, hfirst, hsecond,
        hlocal⟩
    rcases hcomplete candidate hcandidate hcenter hdeleted hfirst hsecond with
      ⟨localFour, hwitness, hrow⟩
    have hlocalValue :
        P.fullRadiusValuation shadow selected
          (encodeG3Var (.localFour localFour)) = true := by
      rw [P.fullRadiusValuation_localFour, hrow]
      exact decide_eq_true hlocal
    apply evalClauseD_of_positive_mem _
      (encodeG3Var_pos (.localFour localFour))
    · simp only [qDeletedPairReverseClause, List.mem_cons, List.mem_map]
      exact Or.inr ⟨localFour, hwitness, rfl⟩
    · exact hlocalValue
  · have hpairFalse :
        P.fullRadiusValuation shadow selected
          (encodeG3Var (.qDeletedPair qDeletedPair)) = false :=
      Bool.eq_false_of_not_eq_true hpairValue
    simp [qDeletedPairReverseClause, evalClauseD, evalLitD, hpairFalse]

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.localEqTransitivityClause_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.globalEqTransitivityClause_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.sourceCenterUsedClause_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.selectedLocalEqClause_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.selectedGlobalEqClause_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.localFourForwardClause_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.localFourReverseClause_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.qDeletedPairForwardClause_sat
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.qDeletedPairReverseClause_sat
