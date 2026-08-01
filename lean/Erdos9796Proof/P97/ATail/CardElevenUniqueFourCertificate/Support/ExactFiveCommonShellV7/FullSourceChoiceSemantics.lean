/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.ExactFiveCommonShellV7.PrefixInheritedTailSemantics

/-!
# Full source-choice semantics for the exact-five V7 prefix

The source-indexed encoder assigns every carrier label one ordered choice of a
selected four-row containing that source.  This file decodes all eleven choice
blocks and their `≤ 1` Sinz auxiliary blocks.  A choice means that its decoded
center is the source's geometric blocker center and that its decoded row is the
row selected by the canonical packet.  A Sinz auxiliary means that some choice
at or before its ordinal is true.

Sources `6` and `7` have the common-shell domain forced to center `8`; the
totality theorem therefore exposes membership of the actual blocker center in
the encoder's center domain as an explicit hypothesis.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ExactFiveCommonShellV7

open Census554
open Census554.CoverCnf
open Census554.CoverIndexBridge

attribute [local instance] Classical.propDecidable

/-- Encoder centers available to a source, in generator order.  The two common
sources use only blocker center `8`; every other source scans all centers. -/
def sourceChoiceCenters (source : Label) : List Label :=
  if source = 6 ∨ source = 7 then [8] else List.finRange 11

/-- The common-center equalities from the live V7 packet are exactly what is
needed to put every geometric blocker center in its encoder center domain. -/
theorem mem_sourceChoiceCenters_of_commonCenters
    (centerOf : Label → Label)
    (hsix : centerOf 6 = 8) (hseven : centerOf 7 = 8)
    (source : Label) :
    centerOf source ∈ sourceChoiceCenters source := by
  fin_cases source <;>
    simp [sourceChoiceCenters, hsix, hseven]

/-- Ordered `(center, candidate-row)` domain for one source. -/
def sourceChoiceDomain (source : Label) : List (Label × Nat) :=
  (sourceChoiceCenters source).flatMap fun center =>
    ((List.range (candCount center.val)).filter fun candidateIndex =>
      ((candMasks center.val).getD candidateIndex 0).testBit source.val).map
        fun candidateIndex => (center, candidateIndex)

/-- Manifest choice count for each source label. -/
def sourceChoiceCount (source : Label) : Nat :=
  match source.val with
  | 0 => 689
  | 1 => 760
  | 2 => 766
  | 3 => 686
  | 4 => 686
  | 5 => 686
  | 6 => 84
  | 7 => 84
  | 8 => 707
  | 9 => 701
  | _ => 701

set_option maxHeartbeats 0 in
set_option maxRecDepth 20000 in
set_option linter.style.nativeDecide false in
/-- The computed source domains have exactly the manifest cardinalities. -/
theorem sourceChoiceDomain_length (source : Label) :
    (sourceChoiceDomain source).length = sourceChoiceCount source := by
  fin_cases source <;> native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 20000 in
set_option linter.style.nativeDecide false in
/-- No ordered source domain repeats a `(center, row)` choice. -/
theorem sourceChoiceDomain_nodup (source : Label) :
    (sourceChoiceDomain source).Nodup := by
  fin_cases source <;> native_decide

/-- Ordinal of a source choice in its generator-ordered domain. -/
abbrev SourceChoiceIndex (source : Label) := Fin (sourceChoiceCount source)

/-- Dependent occurrence of a source-choice variable. -/
structure SourceChoiceOccurrence where
  source : Label
  choice : SourceChoiceIndex source

/-- The domain index corresponding to a manifest source-choice ordinal. -/
def sourceChoiceDomainIndex (source : Label) (choice : SourceChoiceIndex source) :
    Fin (sourceChoiceDomain source).length :=
  ⟨choice.val, by
    rw [sourceChoiceDomain_length]
    exact choice.isLt⟩

/-- Decode a source-choice ordinal to its center and candidate row. -/
def sourceChoiceAt (source : Label) (choice : SourceChoiceIndex source) :
    Label × Nat :=
  (sourceChoiceDomain source).get (sourceChoiceDomainIndex source choice)

/-- Decoded blocker center of a source-choice occurrence. -/
def SourceChoiceOccurrence.center (occurrence : SourceChoiceOccurrence) : Label :=
  (sourceChoiceAt occurrence.source occurrence.choice).1

/-- Decoded candidate row of a source-choice occurrence. -/
def SourceChoiceOccurrence.row (occurrence : SourceChoiceOccurrence) : Nat :=
  (sourceChoiceAt occurrence.source occurrence.choice).2

/-- First DIMACS choice variable for each source. -/
def sourceChoiceStart (source : Label) : Nat :=
  match source.val with
  | 0 => 27905
  | 1 => 29283
  | 2 => 30803
  | 3 => 32335
  | 4 => 33707
  | 5 => 35079
  | 6 => 36451
  | 7 => 36619
  | 8 => 36787
  | 9 => 38201
  | _ => 39603

/-- First DIMACS Sinz auxiliary variable for each source. -/
def sourcePrefixStart (source : Label) : Nat :=
  match source.val with
  | 0 => 28594
  | 1 => 30043
  | 2 => 31569
  | 3 => 33021
  | 4 => 34393
  | 5 => 35765
  | 6 => 36535
  | 7 => 36703
  | 8 => 37494
  | 9 => 38902
  | _ => 40304

/-- Exact DIMACS variable of a source choice. -/
def sourceChoiceVariable
    (source : Label) (choice : SourceChoiceIndex source) : Nat :=
  sourceChoiceStart source + choice.val

/-- Exact DIMACS variable of the corresponding Sinz prefix auxiliary. -/
def sourcePrefixVariable
    (source : Label) (choice : SourceChoiceIndex source) : Nat :=
  sourcePrefixStart source + choice.val

set_option linter.style.nativeDecide false in
/-- Exact choice starts, auxiliary starts, and counts from the V7 manifest. -/
theorem sourceChoiceBlockTable :
    (List.finRange 11).map
        (fun source =>
          (sourceChoiceStart source, sourcePrefixStart source,
            sourceChoiceCount source)) =
      [(27905, 28594, 689), (29283, 30043, 760),
        (30803, 31569, 766), (32335, 33021, 686),
        (33707, 34393, 686), (35079, 35765, 686),
        (36451, 36535, 84), (36619, 36703, 84),
        (36787, 37494, 707), (38201, 38902, 701),
        (39603, 40304, 701)] := by
  native_decide

/-- Exact implication clause emitted for one source choice. -/
def sourceChoiceImplicationClause
    (source : Label) (choice : SourceChoiceIndex source) : List Int :=
  [-Int.ofNat (sourceChoiceVariable source choice),
    Int.ofNat
      (xVar (sourceChoiceAt source choice).1.val
        (sourceChoiceAt source choice).2)]

/-- Exact positive totality clause emitted for one source. -/
def sourceChoiceTotalityClause (source : Label) : List Int :=
  (List.finRange (sourceChoiceCount source)).map fun choice =>
    Int.ofNat (sourceChoiceVariable source choice)

/-- Sinz clause saying that a true choice sets its same-ordinal prefix bit. -/
def sourceChoicePrefixClause
    (source : Label) (choice : SourceChoiceIndex source) : List Int :=
  [-Int.ofNat (sourceChoiceVariable source choice),
    Int.ofNat (sourcePrefixVariable source choice)]

/-- Sinz clause propagating a prefix bit to a later ordinal.  The encoder uses
this with consecutive ordinals; the semantic statement works for every
ordered pair. -/
def sourcePrefixMonotonicityClause
    (source : Label) (left right : SourceChoiceIndex source) : List Int :=
  [-Int.ofNat (sourcePrefixVariable source left),
    Int.ofNat (sourcePrefixVariable source right)]

/-- Sinz exclusion clause.  The encoder uses the previous prefix and current
choice; the semantic statement works whenever `left < right`. -/
def sourceChoicePrefixExclusionClause
    (source : Label) (left right : SourceChoiceIndex source) : List Int :=
  [-Int.ofNat (sourceChoiceVariable source right),
    -Int.ofNat (sourcePrefixVariable source left)]

theorem sourceChoiceVariable_pos
    (source : Label) (choice : SourceChoiceIndex source) :
    0 < sourceChoiceVariable source choice := by
  fin_cases source <;>
    simp [sourceChoiceVariable, sourceChoiceStart] <;>
    omega

theorem sourcePrefixVariable_pos
    (source : Label) (choice : SourceChoiceIndex source) :
    0 < sourcePrefixVariable source choice := by
  fin_cases source <;>
    simp [sourcePrefixVariable, sourcePrefixStart] <;>
    omega

private theorem evalClauseD_binary_implication
    (σ : Nat → Bool) {left right : Nat} (hright : 0 < right)
    (himp : σ left = true → σ right = true) :
    evalClauseD σ [-Int.ofNat left, Int.ofNat right] = true := by
  by_cases hleft : σ left = true
  · have hrightValue := himp hleft
    simp [evalClauseD, evalLitD, hright, hleft, hrightValue]
  · have hleftValue : σ left = false :=
      Bool.eq_false_of_not_eq_true hleft
    simp [evalClauseD, evalLitD, hright, hleftValue]

private theorem evalClauseD_binary_exclusion
    (σ : Nat → Bool) {left right : Nat}
    (hexclusion : ¬(σ left = true ∧ σ right = true)) :
    evalClauseD σ [-Int.ofNat left, -Int.ofNat right] = true := by
  by_cases hleft : σ left = true
  · have hright : σ right ≠ true := fun hright =>
      hexclusion ⟨hleft, hright⟩
    have hrightValue : σ right = false :=
      Bool.eq_false_of_not_eq_true hright
    simp [evalClauseD, evalLitD, hleft, hrightValue]
  · have hleftValue : σ left = false :=
      Bool.eq_false_of_not_eq_true hleft
    simp [evalClauseD, evalLitD, hleftValue]

/-- Decoder for all eleven source-choice variable blocks. -/
def decodeSourceChoiceVariable (varIndex : Nat) :
    Option SourceChoiceOccurrence :=
  if h : 27905 ≤ varIndex ∧ varIndex < 28594 then
    some ⟨0, ⟨varIndex - 27905, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 29283 ≤ varIndex ∧ varIndex < 30043 then
    some ⟨1, ⟨varIndex - 29283, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 30803 ≤ varIndex ∧ varIndex < 31569 then
    some ⟨2, ⟨varIndex - 30803, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 32335 ≤ varIndex ∧ varIndex < 33021 then
    some ⟨3, ⟨varIndex - 32335, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 33707 ≤ varIndex ∧ varIndex < 34393 then
    some ⟨4, ⟨varIndex - 33707, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 35079 ≤ varIndex ∧ varIndex < 35765 then
    some ⟨5, ⟨varIndex - 35079, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 36451 ≤ varIndex ∧ varIndex < 36535 then
    some ⟨6, ⟨varIndex - 36451, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 36619 ≤ varIndex ∧ varIndex < 36703 then
    some ⟨7, ⟨varIndex - 36619, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 36787 ≤ varIndex ∧ varIndex < 37494 then
    some ⟨8, ⟨varIndex - 36787, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 38201 ≤ varIndex ∧ varIndex < 38902 then
    some ⟨9, ⟨varIndex - 38201, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 39603 ≤ varIndex ∧ varIndex < 40304 then
    some ⟨10, ⟨varIndex - 39603, by simp [sourceChoiceCount]; omega⟩⟩
  else none

/-- Decoder for all eleven Sinz prefix-auxiliary variable blocks. -/
def decodeSourcePrefixVariable (varIndex : Nat) :
    Option SourceChoiceOccurrence :=
  if h : 28594 ≤ varIndex ∧ varIndex < 29283 then
    some ⟨0, ⟨varIndex - 28594, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 30043 ≤ varIndex ∧ varIndex < 30803 then
    some ⟨1, ⟨varIndex - 30043, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 31569 ≤ varIndex ∧ varIndex < 32335 then
    some ⟨2, ⟨varIndex - 31569, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 33021 ≤ varIndex ∧ varIndex < 33707 then
    some ⟨3, ⟨varIndex - 33021, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 34393 ≤ varIndex ∧ varIndex < 35079 then
    some ⟨4, ⟨varIndex - 34393, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 35765 ≤ varIndex ∧ varIndex < 36451 then
    some ⟨5, ⟨varIndex - 35765, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 36535 ≤ varIndex ∧ varIndex < 36619 then
    some ⟨6, ⟨varIndex - 36535, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 36703 ≤ varIndex ∧ varIndex < 36787 then
    some ⟨7, ⟨varIndex - 36703, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 37494 ≤ varIndex ∧ varIndex < 38201 then
    some ⟨8, ⟨varIndex - 37494, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 38902 ≤ varIndex ∧ varIndex < 39603 then
    some ⟨9, ⟨varIndex - 38902, by simp [sourceChoiceCount]; omega⟩⟩
  else if h : 40304 ≤ varIndex ∧ varIndex < 41005 then
    some ⟨10, ⟨varIndex - 40304, by simp [sourceChoiceCount]; omega⟩⟩
  else none

set_option maxHeartbeats 0 in
set_option maxRecDepth 10000 in
theorem decodeSourceChoiceVariable_exact
    (source : Label) (choice : SourceChoiceIndex source) :
    decodeSourceChoiceVariable (sourceChoiceVariable source choice) =
      some ⟨source, choice⟩ := by
  fin_cases source <;>
    simp (config := { maxSteps := 1000000 }) (disch := omega) only
      [decodeSourceChoiceVariable, sourceChoiceVariable,
      sourceChoiceStart, sourceChoiceCount, dif_pos, dif_neg,
      Nat.add_sub_cancel_left] <;>
    congr

set_option maxHeartbeats 0 in
set_option maxRecDepth 10000 in
theorem decodeSourceChoiceVariable_prefix_none
    (source : Label) (choice : SourceChoiceIndex source) :
    decodeSourceChoiceVariable (sourcePrefixVariable source choice) = none := by
  fin_cases source <;>
    have hchoice := choice.isLt <;>
    simp only [sourceChoiceCount] at hchoice <;>
    simp (config := { maxSteps := 1000000 }) (disch := omega) only
      [decodeSourceChoiceVariable, sourcePrefixVariable,
      sourcePrefixStart, sourceChoiceCount, dif_pos, dif_neg]

set_option maxHeartbeats 0 in
set_option maxRecDepth 10000 in
theorem decodeSourcePrefixVariable_exact
    (source : Label) (choice : SourceChoiceIndex source) :
    decodeSourcePrefixVariable (sourcePrefixVariable source choice) =
      some ⟨source, choice⟩ := by
  fin_cases source <;>
    have hchoice := choice.isLt <;>
    simp only [sourceChoiceCount] at hchoice <;>
    simp (config := { maxSteps := 1000000 }) (disch := omega) only
      [decodeSourcePrefixVariable, sourcePrefixVariable,
      sourcePrefixStart, sourceChoiceCount, dif_pos, dif_neg,
      Nat.add_sub_cancel_left] <;>
    congr

/-- Semantic interpretation of one source-choice occurrence. -/
def CanonicalPacket.sourceChoiceHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) (choice : SourceChoiceIndex source) : Prop :=
  shadow.centerOf source = (sourceChoiceAt source choice).1 ∧
    (sourceChoiceAt source choice).2 =
      P.baseIndex (sourceChoiceAt source choice).1.val

/-- Semantic interpretation of one Sinz prefix auxiliary. -/
def CanonicalPacket.sourcePrefixHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) (choice : SourceChoiceIndex source) : Prop :=
  ∃ earlier : SourceChoiceIndex source,
    earlier.val ≤ choice.val ∧ P.sourceChoiceHolds shadow source earlier

/-- One valuation covering every source choice and every source Sinz
auxiliary, while preserving the inherited separation valuation elsewhere. -/
noncomputable def CanonicalPacket.fullSourceChoiceValuation
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (varIndex : Nat) : Bool :=
  match decodeSourceChoiceVariable varIndex with
  | some occurrence =>
      decide (P.sourceChoiceHolds shadow occurrence.source occurrence.choice)
  | none =>
      match decodeSourcePrefixVariable varIndex with
      | some occurrence =>
          decide (P.sourcePrefixHolds shadow occurrence.source occurrence.choice)
      | none => P.separationValuation varIndex

theorem CanonicalPacket.fullSourceChoiceValuation_choice
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) (choice : SourceChoiceIndex source) :
    P.fullSourceChoiceValuation shadow (sourceChoiceVariable source choice) =
      decide (P.sourceChoiceHolds shadow source choice) := by
  simp [CanonicalPacket.fullSourceChoiceValuation,
    decodeSourceChoiceVariable_exact]

theorem CanonicalPacket.fullSourceChoiceValuation_prefix
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) (choice : SourceChoiceIndex source) :
    P.fullSourceChoiceValuation shadow (sourcePrefixVariable source choice) =
      decide (P.sourcePrefixHolds shadow source choice) := by
  rw [CanonicalPacket.fullSourceChoiceValuation,
    decodeSourceChoiceVariable_prefix_none,
    decodeSourcePrefixVariable_exact]

theorem CanonicalPacket.fullSourceChoiceValuation_eq_separation_of_lt
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    {varIndex : Nat} (hvarIndex : varIndex < 27905) :
    P.fullSourceChoiceValuation shadow varIndex =
      P.separationValuation varIndex := by
  have hchoice :
      decodeSourceChoiceVariable varIndex = none := by
    simp (disch := omega) only
      [decodeSourceChoiceVariable, dif_neg]
  have hprefix :
      decodeSourcePrefixVariable varIndex = none := by
    simp (disch := omega) only
      [decodeSourcePrefixVariable, dif_neg]
  rw [CanonicalPacket.fullSourceChoiceValuation, hchoice, hprefix]

/-- Every decoded choice names a valid candidate row containing its source. -/
theorem sourceChoiceAt_facts
    (source : Label) (choice : SourceChoiceIndex source) :
    (sourceChoiceAt source choice).2 <
        candCount (sourceChoiceAt source choice).1.val ∧
      ((candMasks (sourceChoiceAt source choice).1.val).getD
          (sourceChoiceAt source choice).2 0).testBit source.val = true := by
  have hmem :=
    List.get_mem (sourceChoiceDomain source)
      (sourceChoiceDomainIndex source choice)
  simp only [sourceChoiceDomain, List.mem_flatMap] at hmem
  obtain ⟨center, _hcenter, hrow⟩ := hmem
  simp only [List.mem_map, List.mem_filter, List.mem_range] at hrow
  obtain ⟨row, ⟨hrowLt, hbit⟩, hpair⟩ := hrow
  have hdecode : sourceChoiceAt source choice = (center, row) := by
    exact hpair.symm
  simpa [hdecode] using ⟨hrowLt, hbit⟩

/-- A true source choice always sets its selected base row variable. -/
theorem CanonicalPacket.sourceChoice_selectedRow
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) (choice : SourceChoiceIndex source)
    (hchoice : P.sourceChoiceHolds shadow source choice) :
    P.fullSourceChoiceValuation shadow
        (xVar (sourceChoiceAt source choice).1.val
          (sourceChoiceAt source choice).2) = true := by
  have hfacts := sourceChoiceAt_facts source choice
  have hxlt :
      xVar (sourceChoiceAt source choice).1.val
          (sourceChoiceAt source choice).2 < 27905 := by
    have hx :=
      xVar_le_nX (sourceChoiceAt source choice).1.isLt hfacts.1
    have hnX := nX_lt_pairIndicatorStart
    omega
  rw [P.fullSourceChoiceValuation_eq_separation_of_lt shadow hxlt]
  rw [P.separationValuation_x (sourceChoiceAt source choice).1.isLt hfacts.1]
  rw [P.baseValuation_x_iff hP (sourceChoiceAt source choice).1.isLt hfacts.1]
  exact hchoice.2

/-- Totality: if the geometric blocker center belongs to the source's encoder
center domain, at least one source choice is semantically true. -/
theorem CanonicalPacket.exists_sourceChoiceHolds
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (source : Label)
    (hcenter : shadow.centerOf source ∈ sourceChoiceCenters source) :
    ∃ choice : SourceChoiceIndex source,
      P.sourceChoiceHolds shadow source choice := by
  let center := shadow.centerOf source
  have hindex : P.baseIndex center.val < candCount center.val :=
    coverIndex_lt_of_cubeOk hP center.isLt
  have hbit :
      ((candMasks center.val).getD (P.baseIndex center.val) 0).testBit
          source.val = true := by
    have hsource : source ∈ P.cube.cube center := by
      simpa [center] using shadow.source_mem_cube source
    simpa [CanonicalPacket.baseIndex, hsource] using
      coverIndex_testBit_of_cubeOk hP center source
  have hmem :
      (center, P.baseIndex center.val) ∈ sourceChoiceDomain source := by
    simp only [sourceChoiceDomain, List.mem_flatMap]
    refine ⟨center, hcenter, ?_⟩
    simp only [List.mem_map, List.mem_filter, List.mem_range]
    exact ⟨P.baseIndex center.val, ⟨hindex, hbit⟩, rfl⟩
  obtain ⟨domainChoice, hchoice⟩ := List.mem_iff_get.mp hmem
  let choice : SourceChoiceIndex source :=
    ⟨domainChoice.val, by
      rw [← sourceChoiceDomain_length source]
      exact domainChoice.isLt⟩
  refine ⟨choice, ?_⟩
  have hdomainIndex :
      sourceChoiceDomainIndex source choice = domainChoice := by
    apply Fin.ext
    rfl
  have hdecode :
      sourceChoiceAt source choice = (center, P.baseIndex center.val) := by
    simpa [sourceChoiceAt, hdomainIndex] using hchoice
  exact ⟨by simpa [center, hdecode], by simp [hdecode]⟩

/-- A true choice makes its same-ordinal Sinz prefix true. -/
theorem CanonicalPacket.sourceChoice_implies_prefix
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) (choice : SourceChoiceIndex source)
    (hchoice : P.sourceChoiceHolds shadow source choice) :
    P.sourcePrefixHolds shadow source choice :=
  ⟨choice, le_rfl, hchoice⟩

/-- Sinz prefix truth is monotone in the source-choice order. -/
theorem CanonicalPacket.sourcePrefix_mono
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) {left right : SourceChoiceIndex source}
    (hle : left.val ≤ right.val)
    (hleft : P.sourcePrefixHolds shadow source left) :
    P.sourcePrefixHolds shadow source right := by
  obtain ⟨earlier, hearlier, hchoice⟩ := hleft
  exact ⟨earlier, hearlier.trans hle, hchoice⟩

/-- Two semantically true choices for one source have the same ordinal. -/
theorem CanonicalPacket.sourceChoice_pairwise
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) {left right : SourceChoiceIndex source}
    (hleft : P.sourceChoiceHolds shadow source left)
    (hright : P.sourceChoiceHolds shadow source right) :
    left = right := by
  have hcenter :
      (sourceChoiceAt source left).1 =
        (sourceChoiceAt source right).1 := by
    rw [← hleft.1, ← hright.1]
  have hrow :
      (sourceChoiceAt source left).2 =
        (sourceChoiceAt source right).2 := by
    rw [hleft.2, hright.2, hcenter]
  have hpair :
      sourceChoiceAt source left = sourceChoiceAt source right :=
    Prod.ext hcenter hrow
  have hindices :
      sourceChoiceDomainIndex source left =
        sourceChoiceDomainIndex source right :=
    (sourceChoiceDomain_nodup source).get_inj_iff.mp hpair
  apply Fin.ext
  simpa [sourceChoiceDomainIndex] using
    congrArg
      (fun i : Fin (sourceChoiceDomain source).length => i.val)
      hindices

/-- Every emitted source-choice implication clause is satisfied. -/
theorem CanonicalPacket.sourceChoiceImplicationClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) (choice : SourceChoiceIndex source) :
    evalClauseD (P.fullSourceChoiceValuation shadow)
      (sourceChoiceImplicationClause source choice) = true := by
  unfold sourceChoiceImplicationClause
  apply evalClauseD_binary_implication
  · exact lt_of_lt_of_le Nat.zero_lt_one
      (one_le_xVar (sourceChoiceAt source choice).1.val
        (sourceChoiceAt source choice).2)
  · intro hchoiceValue
    have hchoice : P.sourceChoiceHolds shadow source choice := by
      rw [P.fullSourceChoiceValuation_choice] at hchoiceValue
      exact of_decide_eq_true hchoiceValue
    exact P.sourceChoice_selectedRow hP shadow source choice hchoice

/-- The emitted positive source totality clause is satisfied whenever the live
blocker center belongs to the encoder domain for that source. -/
theorem CanonicalPacket.sourceChoiceTotalityClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (source : Label)
    (hcenter : shadow.centerOf source ∈ sourceChoiceCenters source) :
    evalClauseD (P.fullSourceChoiceValuation shadow)
      (sourceChoiceTotalityClause source) = true := by
  obtain ⟨choice, hchoice⟩ :=
    P.exists_sourceChoiceHolds hP shadow source hcenter
  rw [evalClauseD, List.any_eq_true]
  refine ⟨Int.ofNat (sourceChoiceVariable source choice), ?_, ?_⟩
  · simp only [sourceChoiceTotalityClause, List.mem_map]
    exact ⟨choice, List.mem_finRange choice, rfl⟩
  · rw [evalLitD_pos _ (sourceChoiceVariable_pos source choice)]
    rw [P.fullSourceChoiceValuation_choice]
    simp [hchoice]

/-- Under the two live common-center equalities, all eleven source totality
clauses are satisfied. -/
theorem CanonicalPacket.sourceChoiceTotalityClause_sat_of_commonCenters
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8)
    (source : Label) :
    evalClauseD (P.fullSourceChoiceValuation shadow)
      (sourceChoiceTotalityClause source) = true :=
  P.sourceChoiceTotalityClause_sat hP shadow source
    (mem_sourceChoiceCenters_of_commonCenters
      shadow.centerOf hsix hseven source)

/-- Every Sinz `choice -> prefix` clause is satisfied. -/
theorem CanonicalPacket.sourceChoicePrefixClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) (choice : SourceChoiceIndex source) :
    evalClauseD (P.fullSourceChoiceValuation shadow)
      (sourceChoicePrefixClause source choice) = true := by
  unfold sourceChoicePrefixClause
  apply evalClauseD_binary_implication _
      (sourcePrefixVariable_pos source choice)
  intro hchoiceValue
  have hchoice : P.sourceChoiceHolds shadow source choice := by
    rw [P.fullSourceChoiceValuation_choice] at hchoiceValue
    exact of_decide_eq_true hchoiceValue
  rw [P.fullSourceChoiceValuation_prefix]
  simp [P.sourceChoice_implies_prefix shadow source choice hchoice]

/-- Every ordered Sinz prefix-propagation clause is satisfied. -/
theorem CanonicalPacket.sourcePrefixMonotonicityClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) {left right : SourceChoiceIndex source}
    (hle : left.val ≤ right.val) :
    evalClauseD (P.fullSourceChoiceValuation shadow)
      (sourcePrefixMonotonicityClause source left right) = true := by
  unfold sourcePrefixMonotonicityClause
  apply evalClauseD_binary_implication _
      (sourcePrefixVariable_pos source right)
  intro hleftValue
  have hleft : P.sourcePrefixHolds shadow source left := by
    rw [P.fullSourceChoiceValuation_prefix] at hleftValue
    exact of_decide_eq_true hleftValue
  rw [P.fullSourceChoiceValuation_prefix]
  simp [P.sourcePrefix_mono shadow source hle hleft]

/-- Every Sinz exclusion clause with an earlier prefix and later choice is
satisfied.  Consecutive ordinals give precisely the encoder's last clause in
each sequential-counter step. -/
theorem CanonicalPacket.sourceChoicePrefixExclusionClause_sat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (source : Label) {left right : SourceChoiceIndex source}
    (hlt : left.val < right.val) :
    evalClauseD (P.fullSourceChoiceValuation shadow)
      (sourceChoicePrefixExclusionClause source left right) = true := by
  unfold sourceChoicePrefixExclusionClause
  apply evalClauseD_binary_exclusion
  rintro ⟨hrightValue, hleftValue⟩
  have hright : P.sourceChoiceHolds shadow source right := by
    rw [P.fullSourceChoiceValuation_choice] at hrightValue
    exact of_decide_eq_true hrightValue
  have hleft : P.sourcePrefixHolds shadow source left := by
    rw [P.fullSourceChoiceValuation_prefix] at hleftValue
    exact of_decide_eq_true hleftValue
  obtain ⟨earlier, hearlier, hearlierChoice⟩ := hleft
  have heq : earlier = right :=
    P.sourceChoice_pairwise shadow source hearlierChoice hright
  subst earlier
  omega

/-- Aggregate semantic contract for the five source-choice clause families
emitted by the exact-11 encoder. -/
def FullSourceChoiceFamilySat
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube) :
    Prop :=
  (∀ (source : Label) (choice : SourceChoiceIndex source),
    evalClauseD (P.fullSourceChoiceValuation shadow)
      (sourceChoiceImplicationClause source choice) = true) ∧
  (∀ source : Label,
    evalClauseD (P.fullSourceChoiceValuation shadow)
      (sourceChoiceTotalityClause source) = true) ∧
  (∀ (source : Label) (choice : SourceChoiceIndex source),
    evalClauseD (P.fullSourceChoiceValuation shadow)
      (sourceChoicePrefixClause source choice) = true) ∧
  (∀ (source : Label) (left right : SourceChoiceIndex source),
    left.val ≤ right.val →
      evalClauseD (P.fullSourceChoiceValuation shadow)
        (sourcePrefixMonotonicityClause source left right) = true) ∧
  (∀ (source : Label) (left right : SourceChoiceIndex source),
    left.val < right.val →
      evalClauseD (P.fullSourceChoiceValuation shadow)
        (sourceChoicePrefixExclusionClause source left right) = true)

/-- `CubeOk` and the two V7 common-center equalities satisfy the complete
source-choice/Sinz family contract. -/
theorem CanonicalPacket.fullSourceChoiceFamily_sat_of_commonCenters
    {A : Finset ℝ²} {M : MoserTriangle A} {CP : CapTriple A M}
    {surplus second : Fin 3}
    {frame : MultiCenter.JointCapIndexFrame surplus second}
    {L : Card11CapLabeling CP frame}
    {H : CriticalShellSystem A}
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (hsix : shadow.centerOf 6 = 8)
    (hseven : shadow.centerOf 7 = 8) :
    FullSourceChoiceFamilySat P shadow := by
  refine ⟨?_, ?_, ?_, ?_, ?_⟩
  · intro source choice
    exact P.sourceChoiceImplicationClause_sat hP shadow source choice
  · intro source
    exact P.sourceChoiceTotalityClause_sat_of_commonCenters
      hP shadow hsix hseven source
  · intro source choice
    exact P.sourceChoicePrefixClause_sat shadow source choice
  · intro source left right hle
    exact P.sourcePrefixMonotonicityClause_sat shadow source hle
  · intro source left right hlt
    exact P.sourceChoicePrefixExclusionClause_sat shadow source hlt

end ExactFiveCommonShellV7
end Problem97

#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.exists_sourceChoiceHolds
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.sourceChoice_selectedRow
#print axioms Problem97.ExactFiveCommonShellV7.CanonicalPacket.sourceChoice_pairwise
