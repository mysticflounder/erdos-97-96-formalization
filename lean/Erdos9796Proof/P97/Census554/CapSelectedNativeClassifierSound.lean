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
