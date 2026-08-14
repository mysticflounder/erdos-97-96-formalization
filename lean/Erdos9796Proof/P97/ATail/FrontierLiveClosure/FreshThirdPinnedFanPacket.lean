/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TriApexEndpointRetainedOmission
import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover

/-!
# Intrinsic finite packet for a source-faithful selected-four deletion fan

This module indexes the four points of an arbitrary selected-four row without
placing any upper bound on the ambient carrier.  The canonical blocker rows
remain derived from `CriticalShellSystem`; they are not independent finite
data.  This is the Lean ingress boundary for the FreshThird pinned-endpoint
fan query.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailMinimalUniqueFourCover
open ATailDeletionRobustness

/-- A source-faithful selected-four deletion fan with its four row points
indexed by `Fin 4`.

The equivalence is intrinsic to the exact four-element support.  In
particular, this packet does not enumerate the ambient carrier and does not
assume `A.card = n` for any `n`. -/
structure IndexedSourceFaithfulSelectedFourFan
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    {center : ℝ²} (Row : SelectedFourClass D.A center) where
  center_mem : center ∈ D.A
  index : Row.support ≃ Fin 4
  sourceFaithful : SourceFaithfulSelectedFourDeletionFan D S H Row

namespace IndexedSourceFaithfulSelectedFourFan

/-- The `i`th row point, retaining its proof of ambient-carrier membership. -/
def source
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) (i : Fin 4) :
    CriticalShellSystem.CarrierVertex D.A :=
  ⟨(F.index.symm i).1, Row.support_subset_A (F.index.symm i).2⟩

@[simp] theorem source_mem_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) (i : Fin 4) :
    (F.source i).1 ∈ Row.support :=
  (F.index.symm i).2

/-- The four indexed sources are pairwise distinct. -/
theorem source_injective
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) :
    Function.Injective F.source := by
  intro i j hij
  have hval : (F.source i).1 = (F.source j).1 :=
    congrArg (fun x ↦ x.1) hij
  change (F.index.symm i).1 = (F.index.symm j).1 at hval
  exact F.index.symm.injective (Subtype.ext hval)

/-- The indexed sources cover exactly the selected-four support. -/
theorem support_eq_source_image
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) :
    Row.support = Finset.univ.image (fun i : Fin 4 ↦ (F.source i).1) := by
  ext x
  constructor
  · intro hx
    refine Finset.mem_image.mpr ⟨F.index ⟨x, hx⟩, Finset.mem_univ _, ?_⟩
    simp [source]
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨i, _, rfl⟩
    exact F.source_mem_support i

/-- Indexing a row-support witness and then recovering its source returns the
original carrier vertex. -/
@[simp] theorem source_index_support
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row)
    (w : CriticalShellSystem.CarrierVertex D.A)
    (hw : w.1 ∈ Row.support) :
    F.source (F.index ⟨w.1, hw⟩) = w := by
  apply Subtype.ext
  simp [source]

/-- The canonical blocker center associated by `H` to the `i`th row point. -/
def blockerCenter
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) (i : Fin 4) : ℝ² :=
  H.centerAt (F.source i).1 (F.source i).2

/-- The canonical blocker row is derived from `CriticalShellSystem`; it is not
an independently chosen row of the bounded query. -/
def blockerRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) (i : Fin 4) :
    CriticalSelectedFourClass D.A (F.source i).1 (F.blockerCenter i) :=
  H.selectedAt (F.source i).1 (F.source i).2

/-- The source-faithful packet attached to one indexed row point. -/
theorem deletionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) (i : Fin 4) :
    SourceFaithfulSelectedFourDeletionPacket D S H Row
      (F.index.symm i).1 (F.index.symm i).2 :=
  F.sourceFaithful (F.index.symm i).1 (F.index.symm i).2

/-- Deleting any member of an indexed blocker's exact critical row destroys
every four-point equidistant witness at that blocker center.

The fan initially records only the failed deletion of its own source.  That
failure makes the blocker center nonrobust; minimality then makes it a unique
four-center, so every member of its canonical four-row is a blocking
deletion.  This is cardinality-independent and uses the actual critical row,
not an abstract four-slot surrogate. -/
theorem blockerRow_support_deletion_blocked
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row)
    (i : Fin 4) {x : ℝ²}
    (hx : x ∈ (F.blockerRow i).toCriticalFourShell.support) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase x) (F.blockerCenter i) := by
  have hcenterA : F.blockerCenter i ∈ D.A :=
    Finset.mem_of_mem_erase
      (F.blockerRow i).toCriticalFourShell.center_mem
  have hnonrobust : ¬ FullyDeletionRobustAt D (F.blockerCenter i) := by
    rcases F.deletionPacket i with ⟨_cap, _hcap, hblocked, _houtcome⟩
    intro hrobust
    exact hblocked (hrobust.survives (F.source i).1 (F.source i).2)
  have hunique : IsUniqueFourCenter D.A (F.blockerCenter i) :=
    isUniqueFourCenter_of_not_fullyDeletionRobust hcenterA hnonrobust
  let K : SelectedFourClass D.A (F.blockerCenter i) :=
    (F.blockerRow i).toCriticalFourShell.toSelectedFourClass
  have hsupport : K.support = uniqueFourClass D.A (F.blockerCenter i) :=
    selectedFourClass_support_eq_uniqueFourClass hunique K
  apply not_hasNEquidistantPointsAt_erase_of_mem_uniqueFourClass hunique
  rw [← hsupport]
  exact hx

/-- Every source-faithful fan over an arbitrary selected-four row yields the
intrinsic four-index packet.  This is the cardinality-independent extraction
step: only the row support is enumerated. -/
noncomputable def ofSourceFaithfulFan
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} (hcenter : center ∈ D.A)
    (Row : SelectedFourClass D.A center)
    (hfan : SourceFaithfulSelectedFourDeletionFan D S H Row) :
    IndexedSourceFaithfulSelectedFourFan D S H Row where
  center_mem := hcenter
  index := Finset.equivFinOfCardEq Row.support_card
  sourceFaithful := hfan

/-- Recover the universal-on-the-four-support fan from its intrinsic `Fin 4`
indexing. -/
theorem sourceFaithfulFan
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) :
    SourceFaithfulSelectedFourDeletionFan D S H Row :=
  F.sourceFaithful

/-- Deleting an indexed point of the selected four-row preserves a four-point
equidistant witness at the row center exactly when that center is fully
deletion-robust.

This is an intrinsic arbitrary-cardinality law.  The alternative in the
general selected-row deletion theorem disappears because every indexed source
is an actual member of `Row.support`. -/
theorem source_deletion_survives_iff_fullyDeletionRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) (i : Fin 4) :
    HasNEquidistantPointsAt 4 (D.A.erase (F.source i).1) center ↔
      FullyDeletionRobustAt D center := by
  rw [selectedFourClass_survives_erase_iff_robust_or_not_mem F.center_mem Row]
  simp only [F.source_mem_support i, not_true_eq_false, or_false]

/-- In the nonrobust arm, all four indexed fan sources are blocking deletions
at the pinned row center, not merely one existentially chosen source. -/
theorem source_deletion_blocked_of_not_fullyDeletionRobust
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row)
    (hnonrobust : ¬ FullyDeletionRobustAt D center) (i : Fin 4) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase (F.source i).1) center := by
  rw [F.source_deletion_survives_iff_fullyDeletionRobust i]
  exact hnonrobust

/-- The information-preserving center-blocker arm of an indexed deletion fan.

Unlike the coarse conclusion `¬ FullyDeletionRobustAt D center`, this packet
retains the source whose actual blocker is the row center, the blocker cap,
the blocked deletion, and the exact canonical support equality. -/
structure CenterBlockerWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) where
  sourceIndex : Fin 4
  blockerCap : Fin 3
  center_eq : center = F.blockerCenter sourceIndex
  blocker_mem_cap :
    F.blockerCenter sourceIndex ∈ S.capInteriorByIndex blockerCap
  deletion_blocked :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase (F.source sourceIndex).1)
      (F.blockerCenter sourceIndex)
  support_eq :
    Row.support =
      (F.blockerRow sourceIndex).toCriticalFourShell.support
  unique_center : IsUniqueFourCenter D.A center
  nonrobust : ¬ FullyDeletionRobustAt D center

/-- The information-preserving no-center-blocker arm of an indexed deletion
fan.  It retains both finite consequences needed by downstream consumers:
a repeated blocker-cap pair, and a (possibly different) pair with mutual
cross-deletion rows. -/
structure NoCenterBlockerWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) where
  center_ne_actualBlocker : ∀ i : Fin 4, center ≠ F.blockerCenter i
  repeatedCapPair :
    ∃ i j : Fin 4, i ≠ j ∧
        ∃ blockerCap : Fin 3,
            F.blockerCenter i ∈ S.capInteriorByIndex blockerCap ∧
            F.blockerCenter j ∈ S.capInteriorByIndex blockerCap ∧
            (F.blockerCenter i = F.blockerCenter j ∨
              HasNEquidistantPointsAt 4 (D.A.erase (F.source j).1)
                (F.blockerCenter i) ∨
              HasNEquidistantPointsAt 4 (D.A.erase (F.source i).1)
                (F.blockerCenter j))
  mutualCrossRows :
    ∃ i j : Fin 4, i ≠ j ∧
        HasNEquidistantPointsAt 4 (D.A.erase (F.source j).1)
          (F.blockerCenter i) ∧
        HasNEquidistantPointsAt 4 (D.A.erase (F.source i).1)
          (F.blockerCenter j) ∧
        F.blockerCenter i ≠ F.blockerCenter j

/-- Exact, cardinality-independent normalization of the source-faithful fan.

The coarse fan lemmas expose only nonrobustness in the first branch and only
one pair consequence in the second.  This theorem keeps the actual
center-blocker witness when it exists; otherwise it keeps the universal
center inequality together with both repeated-cap and mutual-deletion pairs.
No ambient carrier enumeration is introduced. -/
theorem centerBlocker_or_noCenterBlockerWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row) :
    Nonempty (CenterBlockerWitness F) ∨ NoCenterBlockerWitness F := by
  classical
  by_cases hcenterBlocker :
      ∃ (q : ℝ²) (hq : q ∈ Row.support),
        center = H.centerAt q (Row.support_subset_A hq)
  · rcases
        exists_nonrobustCenter_witness_of_sourceFaithfulFan
          Row F.sourceFaithful hcenterBlocker with
      ⟨q, hq, blockerCap, hcenter, hcap, hblocked, hsupport,
        hunique, hnonrobust⟩
    let source : CriticalShellSystem.CarrierVertex D.A :=
      ⟨q, Row.support_subset_A hq⟩
    let sourceIndex : Fin 4 := F.index ⟨q, hq⟩
    have hsource : F.source sourceIndex = source := by
      change F.source (F.index ⟨q, hq⟩) = source
      exact F.source_index_support source hq
    exact Or.inl ⟨
      { sourceIndex := sourceIndex
        blockerCap := blockerCap
        center_eq := by simpa [blockerCenter, hsource, source] using hcenter
        blocker_mem_cap := by
          simpa [blockerCenter, hsource, source] using hcap
        deletion_blocked := by
          simpa [blockerCenter, hsource, source] using hblocked
        support_eq := by
          change Row.support =
            (H.selectedAt (F.source sourceIndex).1
              (F.source sourceIndex).2).support
          rw [hsource]
          simpa [source] using hsupport
        unique_center := hunique
        nonrobust := hnonrobust }⟩
  · have hcenterNe : ∀ (w : ℝ²) (hw : w ∈ Row.support),
        center ≠ H.centerAt w (Row.support_subset_A hw) := by
      intro w hw heq
      exact hcenterBlocker ⟨w, hw, heq⟩
    right
    refine
      { center_ne_actualBlocker := ?_
        repeatedCapPair := ?_
        mutualCrossRows := ?_ }
    · intro i
      simpa [blockerCenter] using
        hcenterNe (F.source i).1 (F.source_mem_support i)
    · rcases
          exists_distinct_support_points_with_same_blockerCap
            Row F.sourceFaithful with
        ⟨z, w, hzRow, hwRow, hzw, blockerCap, hzCap, hwCap⟩
      let i : Fin 4 := F.index ⟨z.1, hzRow⟩
      let j : Fin 4 := F.index ⟨w.1, hwRow⟩
      have hi : F.source i = z := by
        simpa [i] using F.source_index_support z hzRow
      have hj : F.source j = w := by
        simpa [j] using F.source_index_support w hwRow
      have hij : i ≠ j := by
        intro hij
        apply hzw
        rw [← hi, ← hj, hij]
      refine
        ⟨i, j, hij, blockerCap,
          by simpa [blockerCenter, hi] using hzCap,
          by simpa [blockerCenter, hj] using hwCap, ?_⟩
      by_cases hblockers :
          H.centerAt z.1 z.2 = H.centerAt w.1 w.2
      · exact Or.inl (by simpa [blockerCenter, hi, hj] using hblockers)
      · have hzBlockerNeCenter : H.centerAt z.1 z.2 ≠ center :=
          (hcenterNe z.1 hzRow).symm
        have hwBlockerNeCenter : H.centerAt w.1 w.2 ≠ center :=
          (hcenterNe w.1 hwRow).symm
        rcases
            crossDeletion_survives_of_distinct_selectedRow_blockers
              F.center_mem Row z w hzRow hwRow hzw
                hzBlockerNeCenter hwBlockerNeCenter hblockers with
          hzwSurvives | hwzSurvives
        · exact Or.inr (Or.inl (by
            simpa [blockerCenter, hi, hj] using hzwSurvives))
        · exact Or.inr (Or.inr (by
            simpa [blockerCenter, hi, hj] using hwzSurvives))
    · rcases
          exists_mutualCrossDeletion_pair_of_sourceFaithfulFan_no_centerBlocker
            Row F.sourceFaithful hcenterNe with
        ⟨z, w, hzRow, hwRow, hzw, hzwSurvives, hwzSurvives,
          hblockersNe⟩
      let i : Fin 4 := F.index ⟨z.1, hzRow⟩
      let j : Fin 4 := F.index ⟨w.1, hwRow⟩
      have hi : F.source i = z := by
        simpa [i] using F.source_index_support z hzRow
      have hj : F.source j = w := by
        simpa [j] using F.source_index_support w hwRow
      have hij : i ≠ j := by
        intro hij
        apply hzw
        rw [← hi, ← hj, hij]
      exact
        ⟨i, j, hij,
          by simpa [blockerCenter, hi, hj] using hzwSurvives,
          by simpa [blockerCenter, hi, hj] using hwzSurvives,
          by simpa [blockerCenter, hi, hj] using hblockersNe⟩

/-- Unindex the generic outside-cap fan consequence.  The result keeps the
actual deletion packets and the exact four-way obstruction: one actual
blocker leaves the cap, or one of the two cross deletions preserves four
equidistant points. -/
theorem exists_distinct_outsideCap_escape_or_crossDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {center : ℝ²} {Row : SelectedFourClass D.A center}
    (F : IndexedSourceFaithfulSelectedFourFan D S H Row)
    (hcenterNe : ∀ j, center ≠ F.blockerCenter j)
    (i : Fin 3)
    (hcenterCap : center ∈ S.capByIndex i)
    (houtside : 2 ≤ (Row.support \ S.capByIndex i).card) :
    ∃ z w : CriticalShellSystem.CarrierVertex D.A,
      ∃ hz : z.1 ∈ Row.support \ S.capByIndex i,
        ∃ hw : w.1 ∈ Row.support \ S.capByIndex i,
          z ≠ w ∧
            SourceFaithfulSelectedFourDeletionPacket D S H Row z.1
              (Finset.mem_sdiff.mp hz).1 ∧
            SourceFaithfulSelectedFourDeletionPacket D S H Row w.1
              (Finset.mem_sdiff.mp hw).1 ∧
            (H.centerAt z.1 z.2 ∉ S.capByIndex i ∨
              H.centerAt w.1 w.2 ∉ S.capByIndex i ∨
              HasNEquidistantPointsAt 4 (D.A.erase w.1)
                (H.centerAt z.1 z.2) ∨
              HasNEquidistantPointsAt 4 (D.A.erase z.1)
                (H.centerAt w.1 w.2)) := by
  apply ATailFrontierLiveClosure.exists_distinct_outsideCap_fan_escape_or_crossDeletion
    Row i hcenterCap houtside F.sourceFaithful
  intro w hw
  let j : Fin 4 := F.index ⟨w, hw⟩
  have hsource : F.source j = ⟨w, Row.support_subset_A hw⟩ := by
    simpa [j] using F.source_index_support
      ⟨w, Row.support_subset_A hw⟩ hw
  simpa [blockerCenter, hsource] using hcenterNe j

end IndexedSourceFaithfulSelectedFourFan

/-- Intrinsic finite normalization of the endpoint/off-endpoint terminal
split.

Unlike `exists_escaping_sourceFaithfulRow_of_endpoint_split`, this packet does
not forget which branch produced the escaping fan row.  In the endpoint arm
it records that the indexed row and the boundary-selected row have identical
support; in the off-endpoint arm it retains the separate escaping witness in
the boundary row. -/
structure IndexedPinnedEndpointOutsideSeedFan
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A)
    (seed : Finset ℝ²) (center boundary : ℝ²)
    (BoundaryRow : SelectedFourClass D.A boundary) where
  Row : SelectedFourClass D.A center
  fan : IndexedSourceFaithfulSelectedFourFan D S H Row
  rowEscape : ∃ z ∈ Row.support, z ∉ seed
  endpointSplit :
    (center ≠ boundary ∧
        ∃ z ∈ BoundaryRow.support, z ∉ seed) ∨
      (center = boundary ∧ Row.support = BoundaryRow.support)

namespace IndexedPinnedEndpointOutsideSeedFan

/-- Extract the branch-preserving indexed packet from the exact terminal
disjunction produced by the live FreshThird source theorem. -/
theorem nonempty_ofEndpointSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {seed : Finset ℝ²} {center boundary : ℝ²}
    (hcenter : center ∈ D.A)
    (BoundaryRow : SelectedFourClass D.A boundary)
    (hterminal :
      (center ≠ boundary ∧
          (∃ z ∈ BoundaryRow.support, z ∉ seed) ∧
          ∃ Row : SelectedFourClass D.A center,
            (∃ z ∈ Row.support, z ∉ seed) ∧
              SourceFaithfulSelectedFourDeletionFan D S H Row) ∨
        center = boundary ∧
          (∃ z ∈ BoundaryRow.support, z ∉ seed) ∧
          SourceFaithfulSelectedFourDeletionFan D S H BoundaryRow) :
    Nonempty
      (IndexedPinnedEndpointOutsideSeedFan D S H seed center boundary
        BoundaryRow) := by
  classical
  rcases hterminal with hoff | hendpoint
  · rcases hoff with ⟨hcenterNe, hboundaryEscape, Row, hrowEscape, hfan⟩
    exact ⟨
      { Row := Row
        fan :=
          IndexedSourceFaithfulSelectedFourFan.ofSourceFaithfulFan hcenter Row
            hfan
        rowEscape := hrowEscape
        endpointSplit := Or.inl ⟨hcenterNe, hboundaryEscape⟩ }⟩
  · rcases hendpoint with ⟨hcenterEq, hrowEscape, hfan⟩
    subst boundary
    exact ⟨
      { Row := BoundaryRow
        fan :=
          IndexedSourceFaithfulSelectedFourFan.ofSourceFaithfulFan hcenter
            BoundaryRow hfan
        rowEscape := hrowEscape
        endpointSplit := Or.inr ⟨rfl, rfl⟩ }⟩

/-- A chosen branch-preserving packet.  Its mathematical content is exactly
`nonempty_ofEndpointSplit`; choice only selects an indexing of the four-point
support. -/
noncomputable def ofEndpointSplit
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {seed : Finset ℝ²} {center boundary : ℝ²}
    (hcenter : center ∈ D.A)
    (BoundaryRow : SelectedFourClass D.A boundary)
    (hterminal :
      (center ≠ boundary ∧
          (∃ z ∈ BoundaryRow.support, z ∉ seed) ∧
          ∃ Row : SelectedFourClass D.A center,
            (∃ z ∈ Row.support, z ∉ seed) ∧
              SourceFaithfulSelectedFourDeletionFan D S H Row) ∨
        center = boundary ∧
          (∃ z ∈ BoundaryRow.support, z ∉ seed) ∧
          SourceFaithfulSelectedFourDeletionFan D S H BoundaryRow) :
    IndexedPinnedEndpointOutsideSeedFan D S H seed center boundary
      BoundaryRow :=
  Classical.choice
    (nonempty_ofEndpointSplit hcenter BoundaryRow hterminal)

end IndexedPinnedEndpointOutsideSeedFan

end ATailFrontierLiveClosure
end Problem97
