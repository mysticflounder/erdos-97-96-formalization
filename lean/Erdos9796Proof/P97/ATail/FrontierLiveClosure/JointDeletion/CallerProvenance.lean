/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.ProvenanceCore

/-!
# Caller extensions of the joint-deletion provenance core

`JointDeletionCore` keeps what every joint-deletion consumer needs: the source,
its blocker, the exact source row, the recorded survivals and the recorded
omissions.  Two callers need strictly more, and this module adds each caller's
extra data on top of the shared core instead of flattening everything into one
record.

## `TriApexJointDeletionProvenance`

The tri-apex caller works with all three Moser apexes at once.  It adds the
survival of the recorded deletion at every apex, the finite set of carrier
points that escape the source row and survive at every apex, and the cap index
attached to each such escape point.

## `TwoSourceJointDeletionProvenance`

The two-source caller works with two concentric classes at one apex, so it
extends `CrossRadiusJointDeletion` rather than the bare core.  It adds the
ordered pair of radii, the two exact four-point classes as named finite sets,
the membership that puts the source on the large class, and the trace the
source row leaves on the union of the two classes.

## Types deliberately kept as parameters

Three types this hierarchy would naturally mention are defined inside cluster
modules of `Erdos9796Proof.P97.ATail.FrontierLiveClosure`:
`FrontierAllLargeCapsTriApexRobustResidual` and
`FrontierAllLargeCapsBiApexRobustResidual` in `TriApexEndpointRetainedOmission`,
and `CapSourceThirdCanonicalRowWitness` in `TwoSourceCanonicalSurface`.  This is
a *shared* module of that directory, so importing any of them would create the
`from-shared-to-cluster` edge `scripts/lint_cluster_imports.py` rejects.  Two
substitutions are used instead, and neither weakens the records:

* the three apexes arrive as the parameter `apexes : Fin 3 → ℝ²`, with
  `surplusTriApexes` below supplying the Moser triple a tri-apex residual would
  have carried; and
* the canonical row witness is replaced by its underlying finite data — the
  named class finsets and the `retainedTrace` intersection — which is what the
  cluster consumers read off that witness anyway.

A caller holding the cluster residual passes its apexes and its class data in;
nothing is lost, and the records stay importable from the shared layer.

## Obligations left to the producer port (W2b)

One identity is still a parameter here and is not yet bound by any constructor.

* `TriApexJointDeletionProvenance` accepts any `apexes : Fin 3 → ℝ²`; nothing
  in the record forces them to be the Moser triple of the ambient surplus
  packet.  `surplusTriApexes` names the intended triple, and the caller
  constructor written in the producer port must instantiate `apexes` with it.

The second obligation, on the two-source dangerous triple, is discharged in
this module.  `TwoSourceJointDeletionProvenance.dangerousTriple` is no longer a
field: it is the derived `largeClass.erase source.1`, and `dangerousTriple_card`
computes its three-point cardinality from `largeClass_card_eq_four` and the
field `source_mem_largeClass`.  That membership is the single datum the producer
port supplies for the triple.

Until the tri-apex constructor exists that record certifies only the data it
carries; it is not a proof that a cluster caller's provenance has been ported.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

/-- The three Moser apexes of a surplus cap packet in cyclic order: the
surplus apex first, then the two opposite apexes.  This is the concrete
`apexes` argument a tri-apex consumer supplies. -/
noncomputable def surplusTriApexes
    {A : Finset ℝ²} (S : SurplusCapPacket A) : Fin 3 → ℝ² :=
  fun i =>
    match i.1 with
    | 0 => S.surplusApex
    | 1 => S.oppApex1
    | _ => S.oppApex2

/-- The surplus apex is a carrier point. -/
theorem surplusApex_mem_carrier {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.surplusApex, hi] using S.triangle.v3_mem

/-- The first opposite apex is a carrier point. -/
theorem oppApex1_mem_carrier {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v2_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex1, hi] using S.triangle.v1_mem

/-- The second opposite apex is a carrier point. -/
theorem oppApex2_mem_carrier {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

@[simp] theorem surplusTriApexes_zero
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    surplusTriApexes S 0 = S.surplusApex := rfl

@[simp] theorem surplusTriApexes_one
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    surplusTriApexes S 1 = S.oppApex1 := rfl

@[simp] theorem surplusTriApexes_two
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    surplusTriApexes S 2 = S.oppApex2 := rfl

/-- Every Moser apex is a carrier point. -/
theorem surplusTriApexes_mem_carrier
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    surplusTriApexes S i ∈ A := by
  fin_cases i
  · exact surplusApex_mem_carrier S
  · exact oppApex1_mem_carrier S
  · exact oppApex2_mem_carrier S

/-- Tri-apex provenance for a joint deletion.

On top of the shared core this records that the deletion survives at all three
apexes, the finite set of carrier points that escape the source row and survive
at every apex, and the cap index carried by each escape point.  The apexes are
a parameter rather than a field: the type that would supply them lives in a
cluster module, see the module docstring. -/
structure TriApexJointDeletionProvenance
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (L : CriticalShellSystem D.A) (apexes : Fin 3 → ℝ²)
    extends JointDeletionCore D L where
  /-- All three apexes are recorded survival centers of the deletion. -/
  allApexSurvivals : ∀ i : Fin 3, apexes i ∈ fixedSurvivals
  /-- The carrier points that escape the source row and survive globally. -/
  globalEscapeSet : Finset ℝ²
  /-- Every escape point is a carrier point. -/
  globalEscapeSet_subset_carrier : globalEscapeSet ⊆ D.A
  /-- The recorded deletion is itself a global escape point. -/
  deleted_mem_globalEscapeSet : deleted.1 ∈ globalEscapeSet
  /-- Every escape point is one of the recorded row omissions. -/
  globalEscapeSet_subset_fixedOmissions : globalEscapeSet ⊆ fixedOmissions
  /-- Deleting any escape point leaves a four-point class at every apex. -/
  escape_survives_at_apexes :
    ∀ z ∈ globalEscapeSet, ∀ i : Fin 3,
      HasNEquidistantPointsAt 4 (D.A.erase z) (apexes i)
  /-- The cap index attached to a carrier point. -/
  capLabels : ℝ² → Fin 3
  /-- Every escape point lies in the strict interior of its labelled cap. -/
  capLabels_mem_capInterior :
    ∀ z ∈ globalEscapeSet, z ∈ S.capInteriorByIndex (capLabels z)

namespace TriApexJointDeletionProvenance

variable {D : CounterexampleData} {S : SurplusCapPacket D.A}
  {L : CriticalShellSystem D.A} {apexes : Fin 3 → ℝ²}

/-- Deleting the recorded point leaves a four-point class at each apex. -/
theorem apex_survives (T : TriApexJointDeletionProvenance D S L apexes)
    (i : Fin 3) :
    HasNEquidistantPointsAt 4 (D.A.erase T.deleted.1) (apexes i) :=
  T.survives_of_mem_fixedSurvivals (apexes i) (T.allApexSurvivals i)

/-- The deleted point's own blocker is none of the three apexes. -/
theorem centerAt_deleted_ne_apex
    (T : TriApexJointDeletionProvenance D S L apexes) (i : Fin 3) :
    L.centerAt T.deleted.1 T.deleted.2 ≠ apexes i :=
  T.centerAt_deleted_ne_of_mem_fixedSurvivals (T.allApexSurvivals i)

/-- Every global escape point misses the source row. -/
theorem escape_not_mem_exactSourceRow
    (T : TriApexJointDeletionProvenance D S L apexes)
    {z : ℝ²} (hz : z ∈ T.globalEscapeSet) :
    z ∉ T.exactSourceRow.toCriticalFourShell.support :=
  T.omitted_of_mem_fixedOmissions z (T.globalEscapeSet_subset_fixedOmissions hz)

/-- The blocker chosen for a global escape point is none of the three apexes:
the apexes survive that deletion and a blocker does not. -/
theorem centerAt_escape_ne_apex
    (T : TriApexJointDeletionProvenance D S L apexes)
    {z : ℝ²} (hz : z ∈ T.globalEscapeSet) (i : Fin 3) :
    L.centerAt z (T.globalEscapeSet_subset_carrier hz) ≠ apexes i := by
  intro hEq
  refine L.no_qfree_at z (T.globalEscapeSet_subset_carrier hz) ?_
  rw [hEq]
  exact T.escape_survives_at_apexes z hz i

/-- The global escape set is nonempty: the recorded deletion belongs to it. -/
theorem globalEscapeSet_nonempty
    (T : TriApexJointDeletionProvenance D S L apexes) :
    T.globalEscapeSet.Nonempty :=
  ⟨T.deleted.1, T.deleted_mem_globalEscapeSet⟩

/-- The recorded deletion lies in the strict interior of its labelled cap. -/
theorem deleted_mem_capInterior
    (T : TriApexJointDeletionProvenance D S L apexes) :
    T.deleted.1 ∈ S.capInteriorByIndex (T.capLabels T.deleted.1) :=
  T.capLabels_mem_capInterior T.deleted.1 T.deleted_mem_globalEscapeSet

/-- The source is not a global escape point: it lies on its own row. -/
theorem source_not_mem_globalEscapeSet
    (T : TriApexJointDeletionProvenance D S L apexes) :
    T.source.1 ∉ T.globalEscapeSet := by
  intro hmem
  exact T.escape_not_mem_exactSourceRow hmem T.source_mem_exactSourceRow

end TriApexJointDeletionProvenance

/-- Two-source provenance for a cross-radius joint deletion.

The two-source closure argument works at one apex with two concentric exact
four-point classes.  This record extends the cross-radius arm with the ordered
radius pair, both classes as named finite sets, the membership that puts the
source on the large class, and the trace the source row leaves on the union of
the two classes.

The set the closure argument treats as dangerous is not recorded.  It is the
derived `TwoSourceJointDeletionProvenance.dangerousTriple`, namely the large
class with the source erased, and its three-point cardinality
`dangerousTriple_card` is computed from `largeClass_card_eq_four` and
`source_mem_largeClass`.  No provenance in this record rests on a cardinality
standing in for a witness. -/
structure TwoSourceJointDeletionProvenance
    (D : CounterexampleData) (L : CriticalShellSystem D.A) (apex : ℝ²)
    extends CrossRadiusJointDeletion D L apex where
  /-- The smaller of the two apex radii. -/
  smallRadius : ℝ
  /-- The larger of the two apex radii. -/
  largeRadius : ℝ
  /-- The smaller radius is positive. -/
  smallRadius_pos : 0 < smallRadius
  /-- The radii are recorded in increasing order. -/
  radii_lt : smallRadius < largeRadius
  /-- The small apex class, as a named finite set. -/
  smallClass : Finset ℝ²
  /-- The large apex class, as a named finite set. -/
  largeClass : Finset ℝ²
  /-- The small class is the apex class at the small radius. -/
  smallClass_eq : smallClass = SelectedClass D.A apex smallRadius
  /-- The large class is the apex class at the large radius. -/
  largeClass_eq : largeClass = SelectedClass D.A apex largeRadius
  /-- The small class has exactly four points. -/
  smallClass_card_eq_four : smallClass.card = 4
  /-- The large class has exactly four points. -/
  largeClass_card_eq_four : largeClass.card = 4
  /-- The source sits on one of the two recorded radii. -/
  sourceRadius_eq_small_or_large :
    sourceRadius = smallRadius ∨ sourceRadius = largeRadius
  /-- The deletion sits on one of the two recorded radii. -/
  deletedRadius_eq_small_or_large :
    deletedRadius = smallRadius ∨ deletedRadius = largeRadius
  /-- The source is one of the four points of the large class.  This is what
  makes the dangerous triple derivable: it is the large class with the source
  erased. -/
  source_mem_largeClass : source.1 ∈ largeClass
  /-- The trace the source row leaves on the two classes. -/
  retainedTrace : Finset ℝ²
  /-- That trace is exactly the row's intersection with the two classes. -/
  retainedTrace_eq :
    retainedTrace =
      exactSourceRow.toCriticalFourShell.support ∩ (smallClass ∪ largeClass)

namespace TwoSourceJointDeletionProvenance

variable {D : CounterexampleData} {L : CriticalShellSystem D.A} {apex : ℝ²}

/-- The three-point set the two-source closure argument treats as dangerous:
the large apex class with the source erased.

This is a definition, not a record field.  The source lies on the large class
by `source_mem_largeClass`, so erasing it from a four-point class leaves three
points, and `dangerousTriple_card` proves that rather than assuming it. -/
noncomputable def dangerousTriple
    (J : TwoSourceJointDeletionProvenance D L apex) : Finset ℝ² :=
  J.largeClass.erase J.source.1

/-- The dangerous triple has three points.  This is computed from the large
class's exact cardinality and the source's membership, not assumed. -/
theorem dangerousTriple_card (J : TwoSourceJointDeletionProvenance D L apex) :
    J.dangerousTriple.card = 3 := by
  unfold dangerousTriple
  rw [Finset.card_erase_of_mem J.source_mem_largeClass,
    J.largeClass_card_eq_four]

/-- The dangerous triple lies on the two recorded classes. -/
theorem dangerousTriple_subset
    (J : TwoSourceJointDeletionProvenance D L apex) :
    J.dangerousTriple ⊆ J.smallClass ∪ J.largeClass :=
  (Finset.erase_subset J.source.1 J.largeClass).trans Finset.subset_union_right

/-- The two recorded radii are distinct. -/
theorem smallRadius_ne_largeRadius
    (J : TwoSourceJointDeletionProvenance D L apex) :
    J.smallRadius ≠ J.largeRadius :=
  ne_of_lt J.radii_lt

/-- The larger radius is positive. -/
theorem largeRadius_pos (J : TwoSourceJointDeletionProvenance D L apex) :
    0 < J.largeRadius :=
  lt_trans J.smallRadius_pos J.radii_lt

/-- Both exact class cardinalities at once. -/
theorem exactFourClasses (J : TwoSourceJointDeletionProvenance D L apex) :
    J.smallClass.card = 4 ∧ J.largeClass.card = 4 :=
  ⟨J.smallClass_card_eq_four, J.largeClass_card_eq_four⟩

/-- The two recorded classes share no point. -/
theorem classes_disjoint (J : TwoSourceJointDeletionProvenance D L apex) :
    Disjoint J.smallClass J.largeClass := by
  rw [J.smallClass_eq, J.largeClass_eq, Finset.disjoint_left]
  intro z hz₁ hz₂
  exact J.smallRadius_ne_largeRadius
    ((mem_selectedClass.mp hz₁).2.symm.trans (mem_selectedClass.mp hz₂).2)

/-- The source sits on the large radius: it lies on the large class. -/
theorem sourceRadius_eq_largeRadius
    (J : TwoSourceJointDeletionProvenance D L apex) :
    J.sourceRadius = J.largeRadius := by
  have hlarge : J.source.1 ∈ SelectedClass D.A apex J.largeRadius := by
    rw [← J.largeClass_eq]
    exact J.source_mem_largeClass
  exact (mem_selectedClass.mp J.source_mem_sourceClass).2.symm.trans
    (mem_selectedClass.mp hlarge).2

/-- The deletion therefore sits on the small radius. -/
theorem deletedRadius_eq_smallRadius
    (J : TwoSourceJointDeletionProvenance D L apex) :
    J.deletedRadius = J.smallRadius := by
  rcases J.deletedRadius_eq_small_or_large with h | h
  · exact h
  · exact absurd (J.sourceRadius_eq_largeRadius.trans h.symm) J.radii_ne

/-- The recorded deletion is never one of the dangerous points: it sits on the
small class and the dangerous triple sits on the large one. -/
theorem deleted_not_mem_dangerousTriple
    (J : TwoSourceJointDeletionProvenance D L apex) :
    J.deleted.1 ∉ J.dangerousTriple := by
  intro hmem
  unfold dangerousTriple at hmem
  have hlarge : J.deleted.1 ∈ J.largeClass := Finset.mem_of_mem_erase hmem
  have hsmall : J.deleted.1 ∈ J.smallClass := by
    rw [J.smallClass_eq, ← J.deletedRadius_eq_smallRadius]
    exact J.deleted_mem_deletedClass
  exact Finset.disjoint_left.mp J.classes_disjoint hsmall hlarge

/-- The source and the deletion occupy the two recorded radii in one of the
two possible orders. -/
theorem radii_split (J : TwoSourceJointDeletionProvenance D L apex) :
    (J.sourceRadius = J.smallRadius ∧ J.deletedRadius = J.largeRadius) ∨
      (J.sourceRadius = J.largeRadius ∧ J.deletedRadius = J.smallRadius) := by
  rcases J.sourceRadius_eq_small_or_large with hsource | hsource <;>
    rcases J.deletedRadius_eq_small_or_large with hdeleted | hdeleted
  · exact absurd (hsource.trans hdeleted.symm) J.radii_ne
  · exact Or.inl ⟨hsource, hdeleted⟩
  · exact Or.inr ⟨hsource, hdeleted⟩
  · exact absurd (hsource.trans hdeleted.symm) J.radii_ne

/-- The retained trace lies inside the source row. -/
theorem retainedTrace_subset_exactSourceRow
    (J : TwoSourceJointDeletionProvenance D L apex) :
    J.retainedTrace ⊆ J.exactSourceRow.toCriticalFourShell.support := by
  rw [J.retainedTrace_eq]
  exact Finset.inter_subset_left

/-- The retained trace has at most four points, because the source row does. -/
theorem retainedTrace_card_le_four
    (J : TwoSourceJointDeletionProvenance D L apex) :
    J.retainedTrace.card ≤ 4 := by
  calc
    J.retainedTrace.card ≤
        J.exactSourceRow.toCriticalFourShell.support.card :=
      Finset.card_le_card J.retainedTrace_subset_exactSourceRow
    _ = 4 := J.exactSourceRow_card

/-- The recorded deletion misses the retained trace: it misses the whole
source row. -/
theorem deleted_not_mem_retainedTrace
    (J : TwoSourceJointDeletionProvenance D L apex) :
    J.deleted.1 ∉ J.retainedTrace := by
  intro hmem
  exact J.deleted_not_mem_exactSourceRow
    (J.retainedTrace_subset_exactSourceRow hmem)

/-- The recorded deletion lies on one of the two classes. -/
theorem deleted_mem_classes_union
    (J : TwoSourceJointDeletionProvenance D L apex) :
    J.deleted.1 ∈ J.smallClass ∪ J.largeClass := by
  rcases J.deletedRadius_eq_small_or_large with h | h
  · refine Finset.mem_union_left _ ?_
    rw [J.smallClass_eq, ← h]
    exact J.deleted_mem_deletedClass
  · refine Finset.mem_union_right _ ?_
    rw [J.largeClass_eq, ← h]
    exact J.deleted_mem_deletedClass

/-- Read the two-source record as an apex radius mode.  It is always the
cross-radius arm. -/
def toApexRadiusMode (J : TwoSourceJointDeletionProvenance D L apex) :
    ApexRadiusMode D L apex :=
  .crossRadius J.toCrossRadiusJointDeletion

/-- The mode reading keeps the same provenance core. -/
theorem toApexRadiusMode_toJointDeletionCore
    (J : TwoSourceJointDeletionProvenance D L apex) :
    J.toApexRadiusMode.toJointDeletionCore = J.toJointDeletionCore := rfl

end TwoSourceJointDeletionProvenance

end ATailFrontierLiveClosure
end Problem97
