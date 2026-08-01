/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.PrefixBaseSemantics
import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# Cyclic-separation prefix semantics for exact-five V7

This file reconstructs the exact `Census554` cyclic-separation extension:

* `474` pair-indicator variables `27287..27760`;
* `11694` implications from selected candidates to pair indicators;
* one totality clause for the `144` boundary-order selectors; and
* `168192` guarded nonalternation clauses.

The resulting family has `179887` clauses, occupying original input IDs
`207970..387856`.  It is separate from the following `26191` inherited-tail
clauses.  The semantic theorem below proves the entire separation family, so
in particular it covers all `17792` separation occurrences retained by the
exact-five V7 core.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open Census554.CoverIndexBridge
open Census554.SeparationCore

abbrev PairIndicatorRow := Label × RawEdge
abbrev IndicatorOccurrence := Fin 474 × Nat
abbrev PairCenterOccurrence := Fin 474 × Fin 474
abbrev GuardedOccurrence := Fin 144 × PairCenterOccurrence

/-- Whether some candidate row at `center` contains both endpoints. -/
def pairFeasibleAt (center : Label) (edge : RawEdge) : Bool :=
  (candMasks center.val).any fun mask =>
    mask.testBit edge.1.val && mask.testBit edge.2.val

/-- Exact Python allocation order: center-major, then lexicographic pair. -/
def encoderPairIndicatorRows : List PairIndicatorRow :=
  (List.finRange 11).flatMap fun center =>
    (encoderEdges.filter (pairFeasibleAt center)).map fun edge =>
      (center, edge)

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem encoderPairIndicatorRows_length :
    encoderPairIndicatorRows.length = 474 := by
  native_decide

def pairIndicatorRow (i : Fin 474) : PairIndicatorRow :=
  encoderPairIndicatorRows.get
    ⟨i.val, by simpa [encoderPairIndicatorRows_length] using i.isLt⟩

def pairIndicatorVar (i : Fin 474) : Nat :=
  27287 + i.val

/-- The exact `x -> z` occurrence order inside the separation extension. -/
def encoderIndicatorOccurrences : List IndicatorOccurrence :=
  (List.finRange 474).flatMap fun indicator =>
    ((List.range (candCount (pairIndicatorRow indicator).1.val)).filter
      fun candidateIndex =>
        let mask :=
          (candMasks (pairIndicatorRow indicator).1.val).getD candidateIndex 0
        mask.testBit (pairIndicatorRow indicator).2.1.val &&
          mask.testBit (pairIndicatorRow indicator).2.2.val).map
      fun candidateIndex => (indicator, candidateIndex)

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem encoderIndicatorOccurrences_length :
    encoderIndicatorOccurrences.length = 11694 := by
  native_decide

/-- Indicator indices for one endpoint pair, in increasing-center order. -/
def indicatorIndicesForEdge (edge : RawEdge) : List (Fin 474) :=
  (List.finRange 474).filter fun indicator =>
    decide ((pairIndicatorRow indicator).2 = edge)

/-- Exact Python pair-major order of two feasible centers sharing an edge. -/
def encoderPairCenterOccurrences : List PairCenterOccurrence :=
  encoderEdges.flatMap fun edge =>
    (indicatorIndicesForEdge edge).flatMap fun first =>
      ((indicatorIndicesForEdge edge).filter fun second =>
        decide (first < second)).map fun second => (first, second)

/-- Boolean strict betweenness in the order chosen by `selector`. -/
def betweenB (selector : Fin 144) (first second point : Label) : Bool :=
  decide
    (SurplusCOMPGBank.btw
      (selectorIndexEquiv selector first)
      (selectorIndexEquiv selector second)
      (selectorIndexEquiv selector point))

/-- The shared endpoints fail to alternate across the two centers. -/
def nonalternatingB
    (selector : Fin 144) (occurrence : PairCenterOccurrence) : Bool :=
  let first := pairIndicatorRow occurrence.1
  let second := pairIndicatorRow occurrence.2
  betweenB selector first.1 second.1 first.2.1 ==
    betweenB selector first.1 second.1 first.2.2

/-- Exact selector-major order of all guarded nonalternation occurrences. -/
def encoderGuardedOccurrences : List GuardedOccurrence :=
  (List.finRange 144).flatMap fun selector =>
    (encoderPairCenterOccurrences.filter
      (nonalternatingB selector)).map fun occurrence =>
        (selector, occurrence)

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem encoderGuardedOccurrences_length :
    encoderGuardedOccurrences.length = 168192 := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
/-- Every allocated pair indicator names two distinct noncenter labels. -/
theorem pairIndicatorRow_valid (indicator : Fin 474) :
    let row := pairIndicatorRow indicator
    row.2.1 ≠ row.2.2 ∧
      row.1 ≠ row.2.1 ∧ row.1 ≠ row.2.2 := by
  native_decide +revert

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
/-- The exact 474-row decoder has no duplicate `(center,pair)` rows. -/
theorem pairIndicatorRow_injective :
    Function.Injective pairIndicatorRow := by
  native_decide

/-- Structural facts exposed by an emitted `x -> z` occurrence. -/
theorem indicatorOccurrence_facts
    {occurrence : IndicatorOccurrence}
    (hoccurrence : occurrence ∈ encoderIndicatorOccurrences) :
    occurrence.2 <
        candCount (pairIndicatorRow occurrence.1).1.val ∧
      let mask :=
        (candMasks (pairIndicatorRow occurrence.1).1.val).getD occurrence.2 0
      mask.testBit (pairIndicatorRow occurrence.1).2.1.val = true ∧
        mask.testBit (pairIndicatorRow occurrence.1).2.2.val = true := by
  simp only [encoderIndicatorOccurrences, List.mem_flatMap,
    List.mem_map] at hoccurrence
  obtain ⟨indicator, _hindicator, candidateIndex, hcand, rfl⟩ := hoccurrence
  obtain ⟨hindex, hbits⟩ := List.mem_filter.mp hcand
  simp only [Bool.and_eq_true] at hbits
  exact ⟨List.mem_range.mp hindex, hbits⟩

/-- Structural facts exposed by two indicator rows paired for one edge. -/
theorem pairCenterOccurrence_facts
    {occurrence : PairCenterOccurrence}
    (hoccurrence : occurrence ∈ encoderPairCenterOccurrences) :
    (pairIndicatorRow occurrence.1).2 =
        (pairIndicatorRow occurrence.2).2 ∧
      occurrence.1 < occurrence.2 := by
  simp only [encoderPairCenterOccurrences, List.mem_flatMap,
    List.mem_map] at hoccurrence
  obtain ⟨edge, _hedge, first, hfirst, second, hsecond, rfl⟩ := hoccurrence
  have hfirstEdge :
      (pairIndicatorRow first).2 = edge := by
    exact of_decide_eq_true (List.mem_filter.mp hfirst).2
  obtain ⟨hsecondMem, hltBool⟩ := List.mem_filter.mp hsecond
  have hsecondEdge :
      (pairIndicatorRow second).2 = edge := by
    exact of_decide_eq_true (List.mem_filter.mp hsecondMem).2
  exact ⟨hfirstEdge.trans hsecondEdge.symm, of_decide_eq_true hltBool⟩

/-- A guarded occurrence has the shared edge and nonalternation facts used by
the geometric contradiction. -/
theorem guardedOccurrence_facts
    {occurrence : GuardedOccurrence}
    (hoccurrence : occurrence ∈ encoderGuardedOccurrences) :
    (pairIndicatorRow occurrence.2.1).2 =
        (pairIndicatorRow occurrence.2.2).2 ∧
      occurrence.2.1 < occurrence.2.2 ∧
      nonalternatingB occurrence.1 occurrence.2 = true := by
  simp only [encoderGuardedOccurrences, List.mem_flatMap,
    List.mem_map] at hoccurrence
  obtain ⟨selector, _hselector, pair, hpair, rfl⟩ := hoccurrence
  obtain ⟨hpairMem, hnonalternating⟩ := List.mem_filter.mp hpair
  exact ⟨(pairCenterOccurrence_facts hpairMem).1,
    (pairCenterOccurrence_facts hpairMem).2, hnonalternating⟩

/-- Pair indicators are interpreted by actual shared membership in the live
selected cube. -/
noncomputable def CanonicalPacket.pairIndicatorValue
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (indicator : Fin 474) : Bool :=
  let row := pairIndicatorRow indicator
  decide
    (row.2.1 ∈ P.cube.cube row.1 ∧
      row.2.2 ∈ P.cube.cube row.1)

/-- The base valuation, pair memberships, and selected cyclic order combined
on their exact disjoint variable ranges. -/
noncomputable def CanonicalPacket.separationValuation
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (varIndex : Nat) : Bool :=
  if hPair : 27287 ≤ varIndex ∧ varIndex < 27761 then
    P.pairIndicatorValue ⟨varIndex - 27287, by omega⟩
  else if hSelector : 27761 ≤ varIndex ∧ varIndex < 27905 then
    decide
      ((⟨varIndex - 27761, by omega⟩ : Fin 144) =
        P.boundaryOrder.selector)
  else
    P.baseValuation varIndex

/-- Below the first separation-extension variable, the separation valuation is
literally the inherited Census554 base valuation. -/
theorem CanonicalPacket.separationValuation_eq_base_of_lt
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) {varIndex : Nat}
    (hvarIndex : varIndex < 27287) :
    P.separationValuation varIndex = P.baseValuation varIndex := by
  rw [CanonicalPacket.separationValuation,
    dif_neg (by omega), dif_neg (by omega)]

set_option maxRecDepth 10000 in
theorem CanonicalPacket.separationValuation_pair
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (indicator : Fin 474) :
    P.separationValuation (pairIndicatorVar indicator) =
      P.pairIndicatorValue indicator := by
  rw [CanonicalPacket.separationValuation, pairIndicatorVar,
    dif_pos (by omega)]
  have hi :
      (⟨27287 + indicator.val - 27287, by omega⟩ : Fin 474) =
        indicator := by
    apply Fin.ext
    simp
  rw [hi]

set_option maxRecDepth 10000 in
theorem CanonicalPacket.separationValuation_selector
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (selector : Fin 144) :
    P.separationValuation (varOfAtom (.orderSelector selector)) =
      decide (selector = P.boundaryOrder.selector) := by
  rw [CanonicalPacket.separationValuation, varOfAtom,
    dif_neg (by omega), dif_pos (by omega)]
  have hi :
      (⟨27761 + selector.val - 27761, by omega⟩ : Fin 144) =
        selector := by
    apply Fin.ext
    simp
  rw [hi]

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem nX_lt_pairIndicatorStart : nX < 27287 := by
  native_decide

set_option maxRecDepth 10000 in
theorem CanonicalPacket.separationValuation_x
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) {center candidateIndex : Nat}
    (hcenter : center < 11) (hindex : candidateIndex < candCount center) :
    P.separationValuation (xVar center candidateIndex) =
      P.baseValuation (xVar center candidateIndex) := by
  have hx : xVar center candidateIndex < 27287 :=
    lt_of_le_of_lt (xVar_le_nX hcenter hindex)
      nX_lt_pairIndicatorStart
  rw [CanonicalPacket.separationValuation,
    dif_neg (by omega), dif_neg (by omega)]

theorem CanonicalPacket.pairIndicatorValue_eq_true
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (indicator : Fin 474) :
    P.pairIndicatorValue indicator = true ↔
      let row := pairIndicatorRow indicator
      row.2.1 ∈ P.cube.cube row.1 ∧
        row.2.2 ∈ P.cube.cube row.1 := by
  simp [CanonicalPacket.pairIndicatorValue]

/-- Two selected rows sharing a distinct pair force that pair to alternate
across the centers in the packet's chosen boundary order. -/
theorem CanonicalPacket.sharedPair_separated
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L)
    {firstCenter secondCenter firstPoint secondPoint : Label}
    (hcenters : firstCenter ≠ secondCenter)
    (hpoints : firstPoint ≠ secondPoint)
    (hfirstPoint_first :
      firstPoint ∈ P.cube.cube firstCenter)
    (hsecondPoint_first :
      secondPoint ∈ P.cube.cube firstCenter)
    (hfirstPoint_second :
      firstPoint ∈ P.cube.cube secondCenter)
    (hsecondPoint_second :
      secondPoint ∈ P.cube.cube secondCenter) :
    SurplusCOMPGBank.btw
        (selectorIndexEquiv P.boundaryOrder.selector firstCenter)
        (selectorIndexEquiv P.boundaryOrder.selector secondCenter)
        (selectorIndexEquiv P.boundaryOrder.selector firstPoint) ↔
      ¬ SurplusCOMPGBank.btw
        (selectorIndexEquiv P.boundaryOrder.selector firstCenter)
        (selectorIndexEquiv P.boundaryOrder.selector secondCenter)
        (selectorIndexEquiv P.boundaryOrder.selector secondPoint) := by
  have hsecondPoint_ne_firstCenter :
      secondPoint ≠ firstCenter := by
    intro h
    subst secondPoint
    exact P.cube.center_not_mem_cube firstCenter hsecondPoint_first
  have hsecondPoint_ne_secondCenter :
      secondPoint ≠ secondCenter := by
    intro h
    subst secondPoint
    exact P.cube.center_not_mem_cube secondCenter hsecondPoint_second
  have hfirst :
      dist
          (P.boundaryOrder.boundary
            (selectorIndexEquiv P.boundaryOrder.selector firstPoint))
          (P.boundaryOrder.boundary
            (selectorIndexEquiv P.boundaryOrder.selector firstCenter)) =
        dist
          (P.boundaryOrder.boundary
            (selectorIndexEquiv P.boundaryOrder.selector secondPoint))
          (P.boundaryOrder.boundary
            (selectorIndexEquiv P.boundaryOrder.selector firstCenter)) := by
    simpa only [P.boundaryOrder.point_eq, dist_comm] using
      P.cube.equidist_of_mem_cube firstCenter firstPoint secondPoint
        hfirstPoint_first hsecondPoint_first
  have hsecond :
      dist
          (P.boundaryOrder.boundary
            (selectorIndexEquiv P.boundaryOrder.selector firstPoint))
          (P.boundaryOrder.boundary
            (selectorIndexEquiv P.boundaryOrder.selector secondCenter)) =
        dist
          (P.boundaryOrder.boundary
            (selectorIndexEquiv P.boundaryOrder.selector secondPoint))
          (P.boundaryOrder.boundary
            (selectorIndexEquiv P.boundaryOrder.selector secondCenter)) := by
    simpa only [P.boundaryOrder.point_eq, dist_comm] using
      P.cube.equidist_of_mem_cube secondCenter firstPoint secondPoint
        hfirstPoint_second hsecondPoint_second
  apply SurplusCOMPGBank.btw_sep
    P.boundaryOrder.boundary_ccw P.boundaryOrder.boundary_injective
  · exact (selectorIndexEquiv P.boundaryOrder.selector).injective.ne hcenters
  · exact
      (selectorIndexEquiv P.boundaryOrder.selector).injective.ne
        hsecondPoint_ne_firstCenter
  · exact
      (selectorIndexEquiv P.boundaryOrder.selector).injective.ne
        hsecondPoint_ne_secondCenter
  · exact hfirst
  · exact hsecond
  · exact
      P.boundaryOrder.boundary_injective.ne
        ((selectorIndexEquiv P.boundaryOrder.selector).injective.ne hpoints)

/-- No guarded nonalternation occurrence can have its selector and both pair
indicators simultaneously true under the live geometric valuation. -/
theorem CanonicalPacket.guardedOccurrence_not_all_true
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L)
    {occurrence : GuardedOccurrence}
    (hoccurrence : occurrence ∈ encoderGuardedOccurrences) :
    ¬(P.separationValuation
          (varOfAtom (.orderSelector occurrence.1)) = true ∧
      P.separationValuation
          (pairIndicatorVar occurrence.2.1) = true ∧
      P.separationValuation
          (pairIndicatorVar occurrence.2.2) = true) := by
  intro hvalues
  let first := pairIndicatorRow occurrence.2.1
  let second := pairIndicatorRow occurrence.2.2
  have hfacts := guardedOccurrence_facts hoccurrence
  have hedge : first.2 = second.2 := hfacts.1
  have hlt : occurrence.2.1 < occurrence.2.2 := hfacts.2.1
  have hcenters : first.1 ≠ second.1 := by
    intro hcenters
    have hrows : first = second := Prod.ext hcenters hedge
    have hindicators : occurrence.2.1 = occurrence.2.2 :=
      pairIndicatorRow_injective hrows
    exact (ne_of_lt hlt) hindicators
  have hselector :
      occurrence.1 = P.boundaryOrder.selector := by
    have hs := hvalues.1
    rw [P.separationValuation_selector] at hs
    exact of_decide_eq_true hs
  have hfirstMembership :
      first.2.1 ∈ P.cube.cube first.1 ∧
        first.2.2 ∈ P.cube.cube first.1 := by
    apply (P.pairIndicatorValue_eq_true occurrence.2.1).mp
    rw [← P.separationValuation_pair]
    exact hvalues.2.1
  have hsecondMembership :
      first.2.1 ∈ P.cube.cube second.1 ∧
        first.2.2 ∈ P.cube.cube second.1 := by
    have hsecondMembership' :
        second.2.1 ∈ P.cube.cube second.1 ∧
          second.2.2 ∈ P.cube.cube second.1 := by
      apply (P.pairIndicatorValue_eq_true occurrence.2.2).mp
      rw [← P.separationValuation_pair]
      exact hvalues.2.2
    simpa only [hedge] using hsecondMembership'
  have hseparated :=
    P.sharedPair_separated hcenters
      (pairIndicatorRow_valid occurrence.2.1).1
      hfirstMembership.1 hfirstMembership.2
      hsecondMembership.1 hsecondMembership.2
  have hnonalternatingBool :
      betweenB occurrence.1 first.1 second.1 first.2.1 =
        betweenB occurrence.1 first.1 second.1 first.2.2 :=
    beq_iff_eq.mp hfacts.2.2
  have hnonalternating :
      SurplusCOMPGBank.btw
          (selectorIndexEquiv occurrence.1 first.1)
          (selectorIndexEquiv occurrence.1 second.1)
          (selectorIndexEquiv occurrence.1 first.2.1) ↔
        SurplusCOMPGBank.btw
          (selectorIndexEquiv occurrence.1 first.1)
          (selectorIndexEquiv occurrence.1 second.1)
          (selectorIndexEquiv occurrence.1 first.2.2) := by
    simpa only [betweenB, decide_eq_decide] using hnonalternatingBool
  rw [hselector] at hnonalternating
  by_cases hbetween :
      SurplusCOMPGBank.btw
        (selectorIndexEquiv P.boundaryOrder.selector first.1)
        (selectorIndexEquiv P.boundaryOrder.selector second.1)
        (selectorIndexEquiv P.boundaryOrder.selector first.2.1)
  · exact (hseparated.mp hbetween) (hnonalternating.mp hbetween)
  · have hsecondBetween :
        SurplusCOMPGBank.btw
          (selectorIndexEquiv P.boundaryOrder.selector first.1)
          (selectorIndexEquiv P.boundaryOrder.selector second.1)
          (selectorIndexEquiv P.boundaryOrder.selector first.2.2) := by
      by_contra hnot
      exact hbetween (hseparated.mpr hnot)
    exact hbetween (hnonalternating.mpr hsecondBetween)

/-- DIMACS clause saying that candidate `i` forces its pair indicator. -/
def indicatorClause (occurrence : IndicatorOccurrence) : List Int :=
  [-Int.ofNat
      (xVar (pairIndicatorRow occurrence.1).1.val occurrence.2),
    Int.ofNat (pairIndicatorVar occurrence.1)]

/-- At least one of the exact 144 boundary-order selectors is active. -/
def selectorTotalityClause : List Int :=
  (List.finRange 144).map fun selector =>
    Int.ofNat (varOfAtom (.orderSelector selector))

/-- The selected order forbids two centers from sharing a nonalternating
endpoint pair. -/
def guardedClause (occurrence : GuardedOccurrence) : List Int :=
  [-Int.ofNat (varOfAtom (.orderSelector occurrence.1)),
    -Int.ofNat (pairIndicatorVar occurrence.2.1),
    -Int.ofNat (pairIndicatorVar occurrence.2.2)]

/-- Arithmetic census of the typed separation families.  We deliberately do
not materialize the full 179887-clause list in a theorem statement. -/
theorem separationFamily_clauseCount :
    11694 + 1 + 168192 = 179887 := by
  norm_num

@[simp]
private theorem evalLitD_neg_ofNat
    (valuation : Nat → Bool) (varIndex : Nat) :
    evalLitD valuation (-Int.ofNat varIndex) = !valuation varIndex := by
  unfold evalLitD
  cases hvalue : valuation varIndex <;> simp [hvalue] <;> omega

private theorem evalLitD_ofNat_of_pos
    (valuation : Nat → Bool) (varIndex : Nat) (hvarIndex : 0 < varIndex) :
    evalLitD valuation (Int.ofNat varIndex) = valuation varIndex := by
  unfold evalLitD
  cases hvalue : valuation varIndex <;> simp [hvalue] <;> omega

/-- Every emitted candidate-to-indicator implication is true under the live
cube valuation. -/
theorem CanonicalPacket.indicatorClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    {occurrence : IndicatorOccurrence}
    (hoccurrence : occurrence ∈ encoderIndicatorOccurrences) :
    evalClauseD P.separationValuation
      (indicatorClause occurrence) = true := by
  let row := pairIndicatorRow occurrence.1
  have hfacts := indicatorOccurrence_facts hoccurrence
  have hindex : occurrence.2 < candCount row.1.val := hfacts.1
  by_cases hx :
      P.separationValuation (xVar row.1.val occurrence.2) = true
  · have hxbase :
        P.baseValuation (xVar row.1.val occurrence.2) = true := by
      rw [← P.separationValuation_x row.1.isLt hindex]
      exact hx
    have hchosen : occurrence.2 = P.baseIndex row.1.val :=
      (P.baseValuation_x_iff hP row.1.isLt hindex).mp hxbase
    have hfirstBit := hfacts.2.1
    have hsecondBit := hfacts.2.2
    change
      ((candMasks row.1.val).getD occurrence.2 0).testBit
          row.2.1.val = true at hfirstBit
    change
      ((candMasks row.1.val).getD occurrence.2 0).testBit
          row.2.2.val = true at hsecondBit
    rw [hchosen] at hfirstBit hsecondBit
    change
      ((candMasks row.1.val).getD
          (coverIndex P.cube.cube row.1.val) 0).testBit
          row.2.1.val = true at hfirstBit
    change
      ((candMasks row.1.val).getD
          (coverIndex P.cube.cube row.1.val) 0).testBit
          row.2.2.val = true at hsecondBit
    rw [coverIndex_testBit_of_cubeOk hP] at hfirstBit hsecondBit
    have hfirstMembership :
        row.2.1 ∈ P.cube.cube row.1 :=
      of_decide_eq_true hfirstBit
    have hsecondMembership :
        row.2.2 ∈ P.cube.cube row.1 :=
      of_decide_eq_true hsecondBit
    have hz :
        P.separationValuation (pairIndicatorVar occurrence.1) = true := by
      rw [P.separationValuation_pair,
        P.pairIndicatorValue_eq_true]
      exact ⟨hfirstMembership, hsecondMembership⟩
    rw [evalClauseD]
    simp only [indicatorClause, List.any_cons, List.any_nil, Bool.or_false,
      evalLitD_neg_ofNat]
    rw [Bool.or_eq_true]
    right
    rw [evalLitD_ofNat_of_pos _ _ (by simp [pairIndicatorVar])]
    exact hz
  · have hxfalse :
        P.separationValuation (xVar row.1.val occurrence.2) = false :=
      Bool.eq_false_of_not_eq_true hx
    rw [evalClauseD]
    simp only [indicatorClause, List.any_cons, List.any_nil, Bool.or_false,
      evalLitD_neg_ofNat]
    rw [Bool.or_eq_true]
    left
    simp [row, hxfalse]

/-- The selector-totality clause is witnessed by the packet's selected
boundary order. -/
theorem CanonicalPacket.selectorTotalityClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) :
    evalClauseD P.separationValuation selectorTotalityClause = true := by
  rw [evalClauseD, List.any_eq_true]
  refine
    ⟨Int.ofNat
        (varOfAtom (.orderSelector P.boundaryOrder.selector)), ?_, ?_⟩
  · exact List.mem_map.mpr
      ⟨P.boundaryOrder.selector, by simp, rfl⟩
  · rw [evalLitD_ofNat_of_pos _ _ (by simp [varOfAtom])]
    simp [P.separationValuation_selector]

/-- Every guarded nonalternation clause is true under the live geometric
valuation. -/
theorem CanonicalPacket.guardedClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L)
    {occurrence : GuardedOccurrence}
    (hoccurrence : occurrence ∈ encoderGuardedOccurrences) :
    evalClauseD P.separationValuation
      (guardedClause occurrence) = true := by
  cases hs :
      P.separationValuation
        (varOfAtom (.orderSelector occurrence.1)) with
  | false =>
      rw [evalClauseD]
      simp only [guardedClause, List.any_cons, List.any_nil, Bool.or_false]
      rw [Bool.or_eq_true]
      left
      rw [evalLitD_neg_ofNat]
      simp [hs]
  | true =>
      cases hfirst :
          P.separationValuation
            (pairIndicatorVar occurrence.2.1) with
      | false =>
          rw [evalClauseD]
          simp only [guardedClause, List.any_cons, List.any_nil, Bool.or_false]
          rw [Bool.or_eq_true]
          right
          rw [Bool.or_eq_true]
          left
          rw [evalLitD_neg_ofNat]
          simp [hfirst]
      | true =>
          cases hsecond :
              P.separationValuation
                (pairIndicatorVar occurrence.2.2) with
          | false =>
              rw [evalClauseD]
              simp only [guardedClause, List.any_cons, List.any_nil,
                Bool.or_false]
              rw [Bool.or_eq_true]
              right
              rw [Bool.or_eq_true]
              right
              rw [evalLitD_neg_ofNat]
              simp [hsecond]
          | true =>
              exact False.elim
                (P.guardedOccurrence_not_all_true hoccurrence
                  ⟨hs, hfirst, hsecond⟩)

/-- Typed family-level satisfaction for the full exact cyclic-separation
block.  This is the reusable interface for retained-occurrence composition;
it avoids materializing the full `179887`-clause list in the kernel. -/
def CanonicalPacket.SeparationFamilySat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) : Prop :=
  (∀ occurrence ∈ encoderIndicatorOccurrences,
    evalClauseD P.separationValuation
      (indicatorClause occurrence) = true) ∧
  evalClauseD P.separationValuation selectorTotalityClause = true ∧
  ∀ occurrence ∈ encoderGuardedOccurrences,
    evalClauseD P.separationValuation
      (guardedClause occurrence) = true

theorem CanonicalPacket.separationFamily_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube) :
    P.SeparationFamilySat := by
  refine ⟨?_, P.selectorTotalityClause_sat, ?_⟩
  · intro occurrence hoccurrence
    exact P.indicatorClause_sat hP hoccurrence
  · intro occurrence hoccurrence
    exact P.guardedClause_sat hoccurrence

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.encoderPairIndicatorRows_length
#print axioms Problem97.ExactFiveCommonShellV7.encoderIndicatorOccurrences_length
#print axioms Problem97.ExactFiveCommonShellV7.encoderGuardedOccurrences_length
