/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierFacts

/-!
# Soundness interface for the native card-eleven classifier

The executable search enumerates eleven-bit row masks. This file connects
those masks to the proof-facing `PatternCode` surface. Native computation is
used only for closed finite bitmask identities; the search-coverage and
equality-closure arguments remain ordinary Lean proofs.
-/

namespace Problem97
namespace Census554
namespace CapSelectedNativeClassifierSound

open CapSelectedFiniteCode
open CapSelectedNativeClassifier
open CapSelectedNativeClassifierFacts

/-- Row mask extracted from a proof-facing pattern. -/
def rowMaskOf (P : PatternCode) (center : Label) : RowMask :=
  maskOfFinset (row P center)

/-- Executable row extracted from a proof-facing pattern. -/
def rowOfPattern (P : PatternCode) (center : Label) : Row :=
  { center := center.val
    support := rowMaskOf P center }

@[simp] theorem has_rowMaskOf (P : PatternCode) (center point : Label) :
    has (rowMaskOf P center) point.val = P center point := by
  simp only [rowMaskOf, has_maskOfFinset, mem_row_iff]
  cases P center point <;> simp

/-- Every semantically admissible local row occurs in the executable
candidate list. -/
theorem rowOfPattern_mem_candidateRows_of_localCandidateSpec
    {P : PatternCode} {center deleted : Label}
    (h : LocalCandidateSpec center deleted (row P center)) :
    rowOfPattern P center ∈ candidateRows center.val deleted.val := by
  have hlocal :
      localCandidateOK center.val deleted.val (rowMaskOf P center) = true := by
    exact (localCandidateOK_maskOfFinset_iff center deleted (row P center)).2 h
  have hlt : rowMaskOf P center < 2048 :=
    maskOfFinset_lt_2048 (row P center)
  simp only [candidateRows, List.mem_filterMap]
  refine ⟨rowMaskOf P center, List.mem_range.mpr hlt, ?_⟩
  simp [hlocal, rowOfPattern]

/-- The proof-facing incidence and pinned-shell premises supply every local
condition used to enumerate a row. -/
theorem localCandidateSpec_of_incidenceOK_pinnedShellOK
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label}
    (hinc : IncidenceOK P)
    (hpin : PinnedShellOK P blocker pinSource deleted)
    (center : Label) :
    LocalCandidateSpec center deleted (row P center) := by
  rcases hinc with ⟨hlocal, _hintersections, _hpairCount,
    _hseparation, _hq3, hcapCounts⟩
  rcases hlocal with ⟨hrows, hmoser, hnonMoser⟩
  rcases hpin with
    ⟨_hpinSource, _hdeletedInterior, _hne, _hpinnedRow,
      hdeleted, _hblocker, _hpinnedBlocker, _hdeletedBlocker⟩
  refine ⟨(hrows center).1, (hrows center).2, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro hcenter
    subst center
    simpa [capO1, capO2] using hmoser.1
  · intro hcenter
    subst center
    simpa [capS, capO2] using hmoser.2.1
  · intro hcenter
    subst center
    simpa [capS, capO1] using hmoser.2.2
  · exact hnonMoser center
  · exact hcapCounts center
  · intro hcenter
    subst center
    exact hdeleted

/-- Every row of a proof-facing admissible placement occurs in the native
candidate list. -/
theorem rowOfPattern_mem_candidateRows
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label}
    (hinc : IncidenceOK P)
    (hpin : PinnedShellOK P blocker pinSource deleted)
    (center : Label) :
    rowOfPattern P center ∈ candidateRows center.val deleted.val :=
  rowOfPattern_mem_candidateRows_of_localCandidateSpec
    (localCandidateSpec_of_incidenceOK_pinnedShellOK hinc hpin center)

/-- The executable overlap count for two encoded rows is bounded by the
proof-facing row-intersection hypothesis. -/
theorem rowIntersectionBound_of_incidenceOK
    {P : PatternCode} (hinc : IncidenceOK P)
    {left right : Label} (hne : left ≠ right) :
    countPoints (rowOfPattern P left).support
      (supportPoints (rowOfPattern P right).support) ≤ 2 := by
  simp only [rowOfPattern, rowMaskOf]
  rw [countPoints_supportPoints_maskOfFinset]
  exact hinc.2.1 left right hne

set_option maxHeartbeats 1000000 in
-- The explicit 121 label pairs require a larger simplifier budget.
/-- The executable Q3 pair filter accepts every pair of rows from a
proof-facing `Q3OK` pattern. -/
theorem q3PairOK_rowOfPattern
    {P : PatternCode} (hq3 : Q3OK P) (left right : Label) :
    q3PairOK (rowOfPattern P left) (rowOfPattern P right) = true := by
  rcases hq3 with ⟨h01o2, h01, h02o1, h02, h12s, h12⟩
  have h01o2' := h01o2
  have h01' := h01
  have h02o1' := h02o1
  have h02' := h02
  have h12s' := h12s
  have h12' := h12
  rw [Finset.inter_comm (row P 0) (row P 1)] at h01o2' h01'
  rw [Finset.inter_comm (row P 0) (row P 2)] at h02o1' h02'
  rw [Finset.inter_comm (row P 1) (row P 2)] at h12s' h12'
  fin_cases left <;> fin_cases right <;>
    simp_all [q3PairOK, rowOfPattern, rowMaskOf]

instance cyclicSeparatedDecidable (left right first second : Label) :
    Decidable (CyclicSeparated left right first second) := by
  unfold CapSelectedFiniteCode.CyclicSeparated
    CapSelectedFiniteCode.CyclicBetween CapSelectedFiniteCode.cyclicOffset
  infer_instance

set_option maxHeartbeats 1000000 in
-- Exhaustive comparison of the two cyclic-separation implementations.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem cyclicSeparated_val_iff (left right first second : Label) :
    cyclicSeparated left.val right.val first.val second.val = true ↔
      CyclicSeparated left right first second := by
  native_decide +revert

theorem commonPoints_nodup (left right : RowMask) :
    (commonPoints left right).Nodup := by
  unfold commonPoints labels
  exact (List.nodup_range (n := 11)).filter _

theorem lt_eleven_of_mem_commonPoints
    {left right point : Nat} (hpoint : point ∈ commonPoints left right) :
    point < 11 := by
  have hlabels : point ∈ labels := (List.mem_filter.mp hpoint).1
  simpa [labels] using hlabels

theorem mem_commonPoints_rowMaskOf
    (P : PatternCode) (left right point : Label) :
    point.val ∈ commonPoints (rowMaskOf P left) (rowMaskOf P right) ↔
      point ∈ row P left ∧ point ∈ row P right := by
  simp [commonPoints, labels, has_rowMaskOf]

/-- The executable cyclic-separation filter accepts two distinct encoded rows
whenever the proof-facing separation premise holds. -/
theorem crossSeparationOK_rowOfPattern
    {P : PatternCode} (hseparation : CrossSeparationOK P)
    {left right : Label} (hne : left ≠ right) :
    crossSeparationOK (rowOfPattern P left) (rowOfPattern P right) = true := by
  simp only [crossSeparationOK, rowOfPattern]
  generalize hcommon :
      commonPoints (rowMaskOf P left) (rowMaskOf P right) = common
  cases common with
  | nil => rfl
  | cons first rest =>
      cases rest with
      | nil => rfl
      | cons second tail =>
          simp only
          have hfirstMem :
              first ∈ commonPoints (rowMaskOf P left) (rowMaskOf P right) := by
            rw [hcommon]
            simp
          have hsecondMem :
              second ∈ commonPoints (rowMaskOf P left) (rowMaskOf P right) := by
            rw [hcommon]
            simp
          have hfirstLt : first < 11 :=
            lt_eleven_of_mem_commonPoints hfirstMem
          have hsecondLt : second < 11 :=
            lt_eleven_of_mem_commonPoints hsecondMem
          let firstLabel : Label := ⟨first, hfirstLt⟩
          let secondLabel : Label := ⟨second, hsecondLt⟩
          have hpointsNe : firstLabel ≠ secondLabel := by
            intro heq
            have hval : first = second := congrArg Fin.val heq
            have hnodup := commonPoints_nodup
              (rowMaskOf P left) (rowMaskOf P right)
            rw [hcommon] at hnodup
            simp [hval] at hnodup
          have hfirstRows :=
            (mem_commonPoints_rowMaskOf P left right firstLabel).mp (by
              simpa [firstLabel] using hfirstMem)
          have hsecondRows :=
            (mem_commonPoints_rowMaskOf P left right secondLabel).mp (by
              simpa [secondLabel] using hsecondMem)
          have hcyclic : CyclicSeparated left right firstLabel secondLabel :=
            hseparation left right firstLabel secondLabel hne hpointsNe
              hfirstRows.1 hsecondRows.1 hfirstRows.2 hsecondRows.2
          exact (cyclicSeparated_val_iff left right firstLabel secondLabel).2
            hcyclic

/-- Every pair of distinct proof-facing rows passes the executable pairwise
compatibility filter. -/
theorem rowsCompatible_rowOfPattern
    {P : PatternCode} (hinc : IncidenceOK P)
    {left right : Label} (hne : left ≠ right) :
    rowsCompatible (rowOfPattern P left) (rowOfPattern P right) = true := by
  have hoverlap := rowIntersectionBound_of_incidenceOK hinc hne
  have hq3 := q3PairOK_rowOfPattern hinc.2.2.2.2.1 left right
  have hseparation :=
    crossSeparationOK_rowOfPattern hinc.2.2.2.1 hne
  simp [rowsCompatible, hoverlap, hq3, hseparation]

/-- Arithmetic contract for one base-eleven pair code. -/
def ValidPairCode (code : Nat) : Prop :=
  code / 11 < 11 ∧ code % 11 < 11 ∧ code / 11 ≠ code % 11

instance (code : Nat) : Decidable (ValidPairCode code) := by
  unfold ValidPairCode
  infer_instance

set_option linter.style.nativeDecide false in
theorem pairCodes_valid :
    CapSelectedBVRoleBank.pairCodes.all
      (fun code => decide (ValidPairCode code)) = true := by
  native_decide

theorem validPairCode_of_mem {code : Nat}
    (hcode : code ∈ CapSelectedBVRoleBank.pairCodes) :
    ValidPairCode code := by
  have hvalid := List.all_eq_true.mp pairCodes_valid code hcode
  exact of_decide_eq_true hvalid

/-- First decoded label of a base-eleven pair code. -/
def pairFirstLabel (code : Nat) : Label := Fin.ofNat 11 (code / 11)

/-- Second decoded label of a base-eleven pair code. -/
def pairSecondLabel (code : Nat) : Label := Fin.ofNat 11 (code % 11)

theorem pairFirstLabel_val_of_mem {code : Nat}
    (hcode : code ∈ CapSelectedBVRoleBank.pairCodes) :
    (pairFirstLabel code).val = code / 11 := by
  have hvalid := validPairCode_of_mem hcode
  simp [pairFirstLabel, Nat.mod_eq_of_lt hvalid.1]

theorem pairSecondLabel_val_of_mem {code : Nat}
    (hcode : code ∈ CapSelectedBVRoleBank.pairCodes) :
    (pairSecondLabel code).val = code % 11 := by
  have hvalid := validPairCode_of_mem hcode
  simp [pairSecondLabel, Nat.mod_eq_of_lt hvalid.2.1]

theorem pairLabels_ne_of_mem {code : Nat}
    (hcode : code ∈ CapSelectedBVRoleBank.pairCodes) :
    pairFirstLabel code ≠ pairSecondLabel code := by
  have hfirst := pairFirstLabel_val_of_mem hcode
  have hsecond := pairSecondLabel_val_of_mem hcode
  intro heq
  have hval := congrArg Fin.val heq
  rw [hfirst, hsecond] at hval
  exact (validPairCode_of_mem hcode).2.2 hval

theorem containsPair_rowOfPattern_iff
    (P : PatternCode) (center : Label) {code : Nat}
    (hcode : code ∈ CapSelectedBVRoleBank.pairCodes) :
    containsPair (rowOfPattern P center) code = true ↔
      pairFirstLabel code ∈ row P center ∧
        pairSecondLabel code ∈ row P center := by
  have hfirst := pairFirstLabel_val_of_mem hcode
  have hsecond := pairSecondLabel_val_of_mem hcode
  change
    (has (rowMaskOf P center) (code / 11) &&
      has (rowMaskOf P center) (code % 11)) = true ↔ _
  rw [← hfirst, ← hsecond, Bool.and_eq_true, has_rowMaskOf, has_rowMaskOf]
  simp only [mem_row_iff]

/-- Counting encoded prefix rows containing a decoded pair agrees with the
cardinality of the corresponding semantic center set. -/
theorem countP_encodedRows_eq_pairCentersCard
    (P : PatternCode) {centers : List Label} (hnodup : centers.Nodup)
    {code : Nat} (hcode : code ∈ CapSelectedBVRoleBank.pairCodes) :
    (centers.map (rowOfPattern P)).countP
        (fun previous => containsPair previous code) =
      (centers.toFinset.filter fun center =>
        pairFirstLabel code ∈ row P center ∧
          pairSecondLabel code ∈ row P center).card := by
  classical
  rw [List.countP_map, List.countP_eq_length_filter]
  change
    (centers.filter fun center =>
      containsPair (rowOfPattern P center) code).length = _
  have hnodupFiltered :
      (centers.filter fun center =>
        containsPair (rowOfPattern P center) code).Nodup :=
    hnodup.filter _
  rw [← List.toFinset_card_of_nodup hnodupFiltered,
    List.toFinset_filter]
  apply congrArg Finset.card
  ext center
  simp [containsPair_rowOfPattern_iff P center hcode]

/-- The executable point-pair pruning guard accepts every fresh semantic row
under the global two-center bound. -/
theorem pairBoundOK_encodedRows
    {P : PatternCode} (hpair : PairCenterCountOK P)
    {centers : List Label} (hnodup : centers.Nodup)
    {center : Label} (hfresh : center ∉ centers) :
    pairBoundOK (centers.map (rowOfPattern P)) (rowOfPattern P center) = true := by
  classical
  unfold pairBoundOK
  rw [List.all_eq_true]
  intro code hcode
  by_cases hsemantic :
      pairFirstLabel code ∈ row P center ∧
        pairSecondLabel code ∈ row P center
  · have hcontains :
        containsPair (rowOfPattern P center) code = true :=
      (containsPair_rowOfPattern_iff P center hcode).2 hsemantic
    have htotal :
        ((Finset.univ : Finset Label).filter fun other =>
          pairFirstLabel code ∈ row P other ∧
            pairSecondLabel code ∈ row P other).card ≤ 2 :=
      hpair (pairFirstLabel code) (pairSecondLabel code)
        (pairLabels_ne_of_mem hcode)
    have hsubset :
        (centers.toFinset.filter fun other =>
          pairFirstLabel code ∈ row P other ∧
            pairSecondLabel code ∈ row P other) ⊆
          (Finset.univ.filter fun other =>
            pairFirstLabel code ∈ row P other ∧
              pairSecondLabel code ∈ row P other) := by
      intro other hother
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_univ other, (Finset.mem_filter.mp hother).2⟩
    have hcenterTotal :
        center ∈ (Finset.univ.filter fun other =>
          pairFirstLabel code ∈ row P other ∧
            pairSecondLabel code ∈ row P other) := by
      exact Finset.mem_filter.mpr ⟨Finset.mem_univ center, hsemantic⟩
    have hcenterPrefix :
        center ∉ (centers.toFinset.filter fun other =>
          pairFirstLabel code ∈ row P other ∧
            pairSecondLabel code ∈ row P other) := by
      intro hcenter
      exact hfresh (by simpa using (Finset.mem_filter.mp hcenter).1)
    have hproper :
        (centers.toFinset.filter fun other =>
          pairFirstLabel code ∈ row P other ∧
            pairSecondLabel code ∈ row P other) ⊂
          (Finset.univ.filter fun other =>
            pairFirstLabel code ∈ row P other ∧
              pairSecondLabel code ∈ row P other) :=
      (Finset.ssubset_iff_of_subset hsubset).2
        ⟨center, hcenterTotal, hcenterPrefix⟩
    have hprefixLt :
        (centers.toFinset.filter fun other =>
          pairFirstLabel code ∈ row P other ∧
            pairSecondLabel code ∈ row P other).card < 2 :=
      (Finset.card_lt_card hproper).trans_le htotal
    have hcountLt :
        (centers.map (rowOfPattern P)).countP
          (fun previous => containsPair previous code) < 2 := by
      rw [countP_encodedRows_eq_pairCentersCard P hnodup hcode]
      exact hprefixLt
    have hcountLt' :
        centers.countP
          ((fun previous => containsPair previous code) ∘ rowOfPattern P) < 2 := by
      simpa only [List.countP_map] using hcountLt
    simp [hcontains, hcountLt']
  · have hcontains :
        containsPair (rowOfPattern P center) code = false :=
      Bool.eq_false_iff.mpr fun htrue =>
        hsemantic ((containsPair_rowOfPattern_iff P center hcode).1 htrue)
    simp [hcontains]

/-- Every fresh proof-facing row passes the complete executable prefix
compatibility filter. -/
theorem compatibleWith_encodedRows
    {P : PatternCode} (hinc : IncidenceOK P)
    {centers : List Label} (hnodup : centers.Nodup)
    {center : Label} (hfresh : center ∉ centers) :
    compatibleWith (centers.map (rowOfPattern P))
      (rowOfPattern P center) = true := by
  have hpair :
      pairBoundOK (centers.map (rowOfPattern P))
        (rowOfPattern P center) = true :=
    pairBoundOK_encodedRows hinc.2.2.1 hnodup hfresh
  have hrows :
      (centers.map (rowOfPattern P)).all
        (fun previous =>
          rowsCompatible (rowOfPattern P center) previous) = true := by
    rw [List.all_eq_true]
    intro previous hprevious
    rcases List.mem_map.mp hprevious with ⟨other, hother, rfl⟩
    apply rowsCompatible_rowOfPattern hinc
    intro heq
    exact hfresh (heq ▸ hother)
  simp [compatibleWith, hpair, hrows]

/-- The semantic pinned-shell row is exactly the fixed seed used by the native
search. -/
theorem rowOfPattern_eq_fixedPinnedRow
    {P : PatternCode} {blocker : Label -> Label}
    {pinSource deleted : Label}
    (hpin : PinnedShellOK P blocker pinSource deleted) :
    rowOfPattern P 1 = fixedPinnedRow pinSource.val := by
  rcases hpin with
    ⟨hpinSource, _hdeletedInterior, _hne, hpinnedRow,
      _hdeleted, _hblocker, _hpinnedBlocker, _hdeletedBlocker⟩
  simp only [rowOfPattern, rowMaskOf]
  rw [hpinnedRow, maskOfFinset_pinnedRow pinSource hpinSource]
  rfl

end CapSelectedNativeClassifierSound
end Census554
end Problem97
