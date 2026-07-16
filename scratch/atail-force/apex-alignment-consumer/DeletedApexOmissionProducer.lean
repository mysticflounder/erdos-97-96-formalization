/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ApexAlignmentConsumer
import LateCriticalSystemSurface

/-!
# Scratch: exact producer boundary for deleted-apex omission

The apex-alignment residual blocks `K4` at `S.oppApex2` after deleting one
oriented continuation endpoint.  This file checks every row retained by the
current cross/frontier surface and isolates the first additional fact that
would produce the already checked `DeletedApexOmissionPacket`.

There are two equivalent useful producer interfaces:

* an existing row whose center role is `S.oppApex2` and whose support omits
  the deleted endpoint; or
* any positive-radius class of cardinality at least five at that apex
  (including on the frontier's twice-erased carrier).

The current `secondApexDouble` field supplies only cardinality at least four.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailDeletedApexOmissionProducerScratch

open ATailApexAlignmentConsumerScratch
open ATailCriticalPairFrontier
open ATailCriticalSystemRebaseScratch
open ATailCrossSurvivalEliminatorScratch
open ATailFrontierContinuationDispatcherScratch
open ATailGlobalSourceSelectionScratch
open ATailLateCriticalSystemSurfaceScratch

attribute [local instance] Classical.propDecidable

/-- The exact role-map form of an already retained omission row.  Keeping the
row's current center explicit makes this usable for live U1 critical rows,
continuation rows, or any later generated row. -/
structure ApexOmissionRoleAlignment
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) where
  center : ℝ²
  row : SelectedFourClass D.A center
  center_eq_oppApex2 : center = S.oppApex2
  deleted_not_mem : O.survivor.deleted ∉ row.support

/-- Center-role alignment plus support omission is exactly enough to produce
the terminal packet. -/
theorem nonempty_deletedApexOmissionPacket_of_roleAlignment
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (A : ApexOmissionRoleAlignment O) :
    Nonempty (DeletedApexOmissionPacket O) := by
  rcases A with ⟨center, row, rfl, hdeleted⟩
  exact ⟨{ row := row, deleted_not_mem := hdeleted }⟩

/-- A concrete adapter for one of the live source-indexed critical rows.  The
two genuinely new fields are visible in the statement: identify the row's
blocker center with the second apex and show that its exact support omits the
oriented deleted continuation label. -/
theorem nonempty_deletedApexOmissionPacket_of_criticalRowAlignment
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    {source : ℝ²} (R : U1Depth5.CriticalRowPacket D source)
    (hcenter : R.center = S.oppApex2)
    (hdeleted :
      O.survivor.deleted ∉
        R.selected.toCriticalFourShell.support) :
    Nonempty (DeletedApexOmissionPacket O) := by
  apply nonempty_deletedApexOmissionPacket_of_roleAlignment
  exact
    { center := R.center
      row := R.selected.toSelectedFourClass
      center_eq_oppApex2 := hcenter
      deleted_not_mem := by simpa using hdeleted }

/-- Trim a specified positive-radius class of cardinality at least four to an
exact selected four-row at that same radius. -/
theorem exists_selectedFourClass_at_radius_of_four_le_selectedClass
    {A : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hfour : 4 ≤ (SelectedClass A center radius).card) :
    ∃ K : SelectedFourClass A center, K.radius = radius := by
  classical
  obtain ⟨T, hTC, hTcard⟩ := Finset.exists_subset_card_eq hfour
  let K : SelectedFourClass A center :=
    { support := T
      support_subset_A := by
        intro x hx
        exact (mem_selectedClass.mp (hTC hx)).1
      support_card := hTcard
      radius := radius
      radius_pos := hradius
      support_eq_radius := by
        intro x hx
        exact (mem_selectedClass.mp (hTC hx)).2
      center_not_mem := by
        intro hcenter
        have hdist := (mem_selectedClass.mp (hTC hcenter)).2
        have hzero : (0 : ℝ) = radius := by simpa using hdist
        linarith }
  exact ⟨K, rfl⟩

/-- The sharp radius-level producer: a second K4-capable radius at the apex,
different from the radius of the retained parent row. -/
structure DistinctApexRadiusClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) where
  radius : ℝ
  radius_pos : 0 < radius
  card_ge_four : 4 ≤ (SelectedClass D.A S.oppApex2 radius).card
  radius_ne_parent : radius ≠ O.apexRow.radius

/-- A different-radius apex row automatically omits the deleted endpoint:
that endpoint already lies at the parent row's radius. -/
theorem nonempty_deletedApexOmissionPacket_of_distinctApexRadiusClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (W : DistinctApexRadiusClass O) :
    Nonempty (DeletedApexOmissionPacket O) := by
  rcases exists_selectedFourClass_at_radius_of_four_le_selectedClass
      W.radius_pos W.card_ge_four with ⟨K, hKradius⟩
  have hdeleted : O.survivor.deleted ∉ K.support := by
    intro hdeleted
    apply W.radius_ne_parent
    calc
      W.radius = K.radius := hKradius.symm
      _ = dist S.oppApex2 O.survivor.deleted :=
        (K.support_eq_radius O.survivor.deleted hdeleted).symm
      _ = O.apexRow.radius :=
        O.apexRow.support_eq_radius O.survivor.deleted
          (Finset.mem_inter.mp O.deleted_mem_apexRow).1
  exact ⟨{ row := K, deleted_not_mem := hdeleted }⟩

/-- Pure finite selection: removing one prescribed point from a radius class
of cardinality at least five still leaves four points, which may be trimmed to
an exact selected row. -/
theorem exists_selectedFourClass_omitting_of_five_le_selectedClass
    {A : Finset ℝ²} {center deleted : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hfive : 5 ≤ (SelectedClass A center radius).card) :
    ∃ K : SelectedFourClass A center, deleted ∉ K.support := by
  classical
  let C := (SelectedClass A center radius).erase deleted
  have hfour : 4 ≤ C.card := by
    by_cases hdeleted : deleted ∈ SelectedClass A center radius
    · rw [show C.card =
          ((SelectedClass A center radius).erase deleted).card by rfl,
        Finset.card_erase_of_mem hdeleted]
      omega
    · simpa [C, hdeleted] using (show
        4 ≤ (SelectedClass A center radius).card by omega)
  obtain ⟨T, hTC, hTcard⟩ := Finset.exists_subset_card_eq hfour
  let K : SelectedFourClass A center :=
    { support := T
      support_subset_A := by
        intro x hx
        have hxClass : x ∈ SelectedClass A center radius :=
          Finset.mem_of_mem_erase (hTC hx)
        exact (mem_selectedClass.mp hxClass).1
      support_card := hTcard
      radius := radius
      radius_pos := hradius
      support_eq_radius := by
        intro x hx
        have hxClass : x ∈ SelectedClass A center radius :=
          Finset.mem_of_mem_erase (hTC hx)
        exact (mem_selectedClass.mp hxClass).2
      center_not_mem := by
        intro hcenter
        have hdist := (mem_selectedClass.mp
          (Finset.mem_of_mem_erase (hTC hcenter))).2
        have hzero : (0 : ℝ) = radius := by simpa using hdist
        linarith }
  refine ⟨K, ?_⟩
  intro hdeleted
  exact (Finset.mem_erase.mp (hTC hdeleted)).1 rfl

/-- A five-point class at any radius of the second apex produces the exact
omission packet, independently of which radius was used for the retained
parent apex row. -/
theorem nonempty_deletedApexOmissionPacket_of_apexClass_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    {radius : ℝ} (hradius : 0 < radius)
    (hfive : 5 ≤ (SelectedClass D.A S.oppApex2 radius).card) :
    Nonempty (DeletedApexOmissionPacket O) := by
  rcases exists_selectedFourClass_omitting_of_five_le_selectedClass
      hradius hfive with ⟨K, hdeleted⟩
  exact ⟨{ row := K, deleted_not_mem := hdeleted }⟩

/-- The quantitative strengthening that would turn `secondApexDouble` into
the desired producer.  A five-point class on any twice-erased frontier
carrier lifts to a five-point ambient class and hence yields an apex row
omitting the oriented deleted endpoint. -/
theorem nonempty_deletedApexOmissionPacket_of_twiceErased_apexClass_card_ge_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    {q w : ℝ²} {radius : ℝ}
    (hradius : 0 < radius)
    (hfive :
      5 ≤ (SelectedClass ((D.A.erase q).erase w)
        S.oppApex2 radius).card) :
    Nonempty (DeletedApexOmissionPacket O) := by
  have hsubset :
      SelectedClass ((D.A.erase q).erase w) S.oppApex2 radius ⊆
        SelectedClass D.A S.oppApex2 radius := by
    intro x hx
    rcases mem_selectedClass.mp hx with ⟨hxCarrier, hxr⟩
    exact mem_selectedClass.mpr
      ⟨(Finset.mem_erase.mp (Finset.mem_erase.mp hxCarrier).2).2, hxr⟩
  have hambient : 5 ≤ (SelectedClass D.A S.oppApex2 radius).card :=
    hfive.trans (Finset.card_le_card hsubset)
  exact nonempty_deletedApexOmissionPacket_of_apexClass_card_ge_five
    hradius hambient

/-- The parent apex row has the correct center but the wrong support polarity:
the oriented deleted endpoint is one of its selected points. -/
theorem deleted_mem_parentApexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) :
    O.survivor.deleted ∈ O.apexRow.support :=
  (Finset.mem_inter.mp O.deleted_mem_apexRow).1

/-- The retained cross-survivor row has the desired omission polarity. -/
theorem deleted_not_mem_survivorRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) :
    O.survivor.deleted ∉ O.survivor.row.support := by
  intro hdeleted
  have hsubset := O.survivor.exactRow.row.subset hdeleted
  have hskeleton := (Finset.mem_erase.mp hsubset).2
  change O.survivor.deleted ∈ D.A.erase O.survivor.deleted at hskeleton
  exact (Finset.mem_erase.mp hskeleton).1 rfl

/-- The retained cross-survivor row has the wrong center role.  Its center is
a support point of the parent apex row, so it cannot equal that row's center. -/
theorem survivorCenter_ne_oppApex2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) :
    O.survivor.center ≠ S.oppApex2 := by
  intro hcenter
  apply O.apexRow.center_not_mem
  simpa [hcenter] using (Finset.mem_inter.mp O.center_mem_apexRow).1

/-- The other continuation label is also not the second apex, for the same
selected-row reason. -/
theorem deleted_ne_oppApex2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) :
    O.survivor.deleted ≠ S.oppApex2 := by
  intro hdeleted
  apply O.apexRow.center_not_mem
  simpa [hdeleted] using (Finset.mem_inter.mp O.deleted_mem_apexRow).1

/-- Both H-independent continuation centers selected from a geometric
frontier are necessarily different from the second apex. -/
theorem geometricContinuation_centers_ne_oppApex2
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hinitial : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S r Hinitial}
    (G : GeometricFrontierContinuation F) :
    G.rows.z₁ ≠ S.oppApex2 ∧ G.rows.z₂ ≠ S.oppApex2 := by
  constructor
  · intro hz₁
    apply G.secondApex.row.center_not_mem
    simpa [hz₁] using (Finset.mem_inter.mp G.rows.z₁_mem).1
  · intro hz₂
    apply G.secondApex.row.center_not_mem
    simpa [hz₂] using (Finset.mem_inter.mp G.rows.z₂_mem).1

/-- A deletion-critical apex certificate forces the full radius class of the
retained parent row to have cardinality exactly four.  Thus the card-five
producer above is not hidden inside the residual: proving it would already
be the contradiction. -/
theorem parentApexRadiusClass_card_eq_four_of_certificate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (C : DeletedApexCriticalCertificate O) :
    (SelectedClass D.A S.oppApex2 O.apexRow.radius).card = 4 := by
  have hsubset :
      O.apexRow.support ⊆
        SelectedClass D.A S.oppApex2 O.apexRow.radius := by
    intro x hx
    exact mem_selectedClass.mpr
      ⟨O.apexRow.support_subset_A hx,
        O.apexRow.support_eq_radius x hx⟩
  have hfour :
      4 ≤ (SelectedClass D.A S.oppApex2 O.apexRow.radius).card := by
    have hle := Finset.card_le_card hsubset
    simpa [O.apexRow.support_card] using hle
  have hle :
      (SelectedClass D.A S.oppApex2 O.apexRow.radius).card ≤ 4 := by
    by_contra hnot
    have hfive :
        5 ≤ (SelectedClass D.A S.oppApex2 O.apexRow.radius).card := by
      omega
    rcases nonempty_deletedApexOmissionPacket_of_apexClass_card_ge_five
        O.apexRow.radius_pos hfive with ⟨P⟩
    exact false_of_deletedApexCriticalCertificate_and_omission C P
  omega

/-- Direct terminal for the sharp distinct-radius producer. -/
theorem false_of_deletedApexCriticalCertificate_and_distinctApexRadiusClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (C : DeletedApexCriticalCertificate O)
    (W : DistinctApexRadiusClass O) : False :=
  false_of_deletedApexCriticalCertificate_and_omission C
    (Classical.choice
      (nonempty_deletedApexOmissionPacket_of_distinctApexRadiusClass W))

/-- Under the residual, every selected four-row at the second apex is forced
onto the same exact support as the retained parent apex row. -/
theorem apexRow_support_eq_parent_of_certificate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (C : DeletedApexCriticalCertificate O)
    (K : SelectedFourClass D.A S.oppApex2) :
    K.support = O.apexRow.support := by
  have hdeletedK : O.survivor.deleted ∈ K.support := by
    by_contra hnot
    exact false_of_deletedApexCriticalCertificate_and_omission C
      { row := K, deleted_not_mem := hnot }
  have hradius : K.radius = O.apexRow.radius := by
    calc
      K.radius = dist S.oppApex2 O.survivor.deleted :=
        (K.support_eq_radius O.survivor.deleted hdeletedK).symm
      _ = O.apexRow.radius :=
        O.apexRow.support_eq_radius O.survivor.deleted
          (deleted_mem_parentApexRow O)
  have hcard := parentApexRadiusClass_card_eq_four_of_certificate C
  have hKsubset :
      K.support ⊆ SelectedClass D.A S.oppApex2 O.apexRow.radius := by
    intro x hx
    exact mem_selectedClass.mpr
      ⟨K.support_subset_A hx,
        (K.support_eq_radius x hx).trans hradius⟩
  have hOsubset :
      O.apexRow.support ⊆
        SelectedClass D.A S.oppApex2 O.apexRow.radius := by
    intro x hx
    exact mem_selectedClass.mpr
      ⟨O.apexRow.support_subset_A hx,
        O.apexRow.support_eq_radius x hx⟩
  have hKfull :
      K.support = SelectedClass D.A S.oppApex2 O.apexRow.radius := by
    apply Finset.eq_of_subset_of_card_le hKsubset
    rw [hcard, K.support_card]
  have hOfull :
      O.apexRow.support =
        SelectedClass D.A S.oppApex2 O.apexRow.radius := by
    apply Finset.eq_of_subset_of_card_le hOsubset
    rw [hcard, O.apexRow.support_card]
  exact hKfull.trans hOfull.symm

/-- Under the critical certificate, support omission is equivalent to a
second K4-capable apex radius.  Same-radius alternatives collapse to the full
four-point critical class; every different-radius alternative omits the
deleted endpoint automatically. -/
theorem deletedApexOmission_iff_distinctApexRadiusClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (C : DeletedApexCriticalCertificate O) :
    Nonempty (DeletedApexOmissionPacket O) ↔
      Nonempty (DistinctApexRadiusClass O) := by
  constructor
  · rintro ⟨P⟩
    have hsubset :
        P.row.support ⊆
          SelectedClass D.A S.oppApex2 P.row.radius := by
      intro x hx
      exact mem_selectedClass.mpr
        ⟨P.row.support_subset_A hx,
          P.row.support_eq_radius x hx⟩
    have hfour :
        4 ≤ (SelectedClass D.A S.oppApex2 P.row.radius).card := by
      have hle := Finset.card_le_card hsubset
      simpa [P.row.support_card] using hle
    have hne : P.row.radius ≠ O.apexRow.radius := by
      intro hradius
      have hPsubset :
          P.row.support ⊆
            SelectedClass D.A S.oppApex2 O.apexRow.radius := by
        intro x hx
        exact mem_selectedClass.mpr
          ⟨P.row.support_subset_A hx,
            (P.row.support_eq_radius x hx).trans hradius⟩
      have hcard := parentApexRadiusClass_card_eq_four_of_certificate C
      have hPfull :
          P.row.support =
            SelectedClass D.A S.oppApex2 O.apexRow.radius := by
        apply Finset.eq_of_subset_of_card_le hPsubset
        rw [hcard, P.row.support_card]
      have hdeletedClass :
          O.survivor.deleted ∈
            SelectedClass D.A S.oppApex2 O.apexRow.radius :=
        mem_selectedClass.mpr
          ⟨O.survivor.deleted_mem_A,
            O.apexRow.support_eq_radius O.survivor.deleted
              (deleted_mem_parentApexRow O)⟩
      apply P.deleted_not_mem
      rw [hPfull]
      exact hdeletedClass
    exact ⟨
      { radius := P.row.radius
        radius_pos := P.row.radius_pos
        card_ge_four := hfour
        radius_ne_parent := hne }⟩
  · rintro ⟨W⟩
    exact nonempty_deletedApexOmissionPacket_of_distinctApexRadiusClass W

#print axioms nonempty_deletedApexOmissionPacket_of_roleAlignment
#print axioms nonempty_deletedApexOmissionPacket_of_criticalRowAlignment
#print axioms exists_selectedFourClass_at_radius_of_four_le_selectedClass
#print axioms nonempty_deletedApexOmissionPacket_of_distinctApexRadiusClass
#print axioms exists_selectedFourClass_omitting_of_five_le_selectedClass
#print axioms nonempty_deletedApexOmissionPacket_of_apexClass_card_ge_five
#print axioms nonempty_deletedApexOmissionPacket_of_twiceErased_apexClass_card_ge_five
#print axioms deleted_not_mem_survivorRow
#print axioms survivorCenter_ne_oppApex2
#print axioms geometricContinuation_centers_ne_oppApex2
#print axioms parentApexRadiusClass_card_eq_four_of_certificate
#print axioms false_of_deletedApexCriticalCertificate_and_distinctApexRadiusClass
#print axioms apexRow_support_eq_parent_of_certificate
#print axioms deletedApexOmission_iff_distinctApexRadiusClass

end ATailDeletedApexOmissionProducerScratch
end Problem97
