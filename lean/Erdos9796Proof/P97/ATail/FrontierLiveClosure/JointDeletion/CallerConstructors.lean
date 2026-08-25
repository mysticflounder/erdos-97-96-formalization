/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.CallerProvenance
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.Producers

/-!
# Identity-binding constructors for the caller provenance records

`TriApexJointDeletionProvenance` accepts any three apexes, and `CallerProvenance`
records that leaving the triple as a parameter is an obligation: nothing in the
record forces the three points to be the Moser triple of the ambient surplus cap
packet.  This module discharges that obligation by building the record with
`apexes` instantiated to `surplusTriApexes S`.

## What the tri-apex constructor needs

The record demands survival of the recorded deletion at all three Moser apexes,
and survival of every recorded escape point at the same three apexes.  Two of
the three survivals come from the shared layer:

* the first opposite apex is fully deletion robust on any common-deletion parent
  residual, by `FrontierCommonDeletionParentResidual.firstApexFullyDeletionRobust`;
  and
* the second opposite apex is fully deletion robust on a bi-apex robust residual,
  by `FrontierBiApexRobustResidual.secondApex_robust`, so that residual is taken
  as an argument.

The surplus apex has no shared-layer producer at all.  The proposition
`ApexRichClassStructure D.A S.surplusApex`, which is the only route to
`FullyDeletionRobustAt D S.surplusApex`, occurs in this repository only as a
field of the tri-apex robust residual of the live closure cluster, and that
residual cannot be imported from a shared module.  The constructor therefore
takes `FullyDeletionRobustAt D S.surplusApex` as an explicit hypothesis.  Both
named types live outside the cluster, so the signature stays importable from the
shared layer; the cluster caller supplies the hypothesis from its residual's
surplus-apex rich-class field.  No count anywhere below stands in for that
survival witness.

## The escape set

The record's `globalEscapeSet` is built as a class-and-cap escape set: the
carrier points lying on one apex class, inside the strict interior of one cap,
and missing the core's exact source row.  The class centre, its radius, and the
cap index are arguments, so the same constructor serves the first-apex route of
the retained matching geometry and the second-apex route of the exact-four cap
expansion.  Each escape point carries its own class membership, its own cap
membership, and its own row omission; `capLabels` is the constant labelling by
the chosen cap index, justified pointwise by the cap membership rather than by a
cap census.

The core handed in is enlarged, not replaced: its survivals gain the three Moser
apexes and its omissions gain the escape set, while its source, blocker, exact
row and deletion are carried through unchanged.

## The two-source dangerous triple, as W3-A left it

`TwoSourceJointDeletionProvenance.dangerousTriple` was the second identity
`CallerProvenance` listed as an obligation.  W3-A discharged it by making the
decided meaning the definition: the dangerous triple is now the derived
`largeClass.erase J.source.1`, where `largeClass` is the larger-radius exact
first-apex four-point class, and `dangerousTriple_card` proves its three-point
cardinality from `largeClass_card_eq_four` and the record field
`source_mem_largeClass`.  Writing `largeClass = largeInside ∪ {z, w}` with
`J.source.1 = z`, the triple is `largeInside ∪ {w}`; under `radius < ρ` the large
class is the class at `ρ` with inside pair `{Pρ.source₁, Pρ.source₂}`, and under
`ρ < radius` it is the class at `radius` with inside pair
`{P.source₁, P.source₂}`.  The mixed candidate `{P.source₁, P.source₂, Pρ.source₁}`
was rejected: in either orientation it is in general not even a subset of the
large class, since the localization identity `LPρ.fresh = Pρ.source₁` places the
fresh point in a source-return omission cycle, not in the other collision's
class.  The fixed-circle triple of the U3 audit frame is an unrelated object.

No constructor for the two-source record is written here.  A producer now owes
`source_mem_largeClass` and nothing else for the triple, and that one field
fixes the radius order: it puts the source on the large radius, and `radii_ne`
then puts the deletion on the small one, by
`TwoSourceJointDeletionProvenance.sourceRadius_eq_largeRadius` and
`TwoSourceJointDeletionProvenance.deletedRadius_eq_smallRadius`.  A constructor
must split the radius order that way, identify the small and large classes, and
prove `J.source.1 ∈ largeClass \ largeInside`.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer

attribute [local instance] Classical.propDecidable

noncomputable section

/- ## The Moser triple as a finite set -/

/-- The three Moser apexes of a surplus cap packet, collected as a finite set.
This is the finite-set form of `surplusTriApexes`, in the shape the provenance
core's `fixedSurvivals` field wants. -/
def surplusTriApexFinset {A : Finset ℝ²} (S : SurplusCapPacket A) : Finset ℝ² :=
  {S.surplusApex, S.oppApex1, S.oppApex2}

/-- The Moser triple index by index: the surplus apex first, then the two
opposite apexes.  This is the pointwise reading a caller uses to recognise the
`apexes` parameter of a tri-apex record instantiated at `surplusTriApexes`. -/
theorem surplusTriApexes_pointwise {A : Finset ℝ²} (S : SurplusCapPacket A) :
    surplusTriApexes S 0 = S.surplusApex ∧
      surplusTriApexes S 1 = S.oppApex1 ∧
      surplusTriApexes S 2 = S.oppApex2 :=
  ⟨rfl, rfl, rfl⟩

/-- Every Moser apex belongs to the Moser triple's finite set. -/
theorem surplusTriApexes_mem_surplusTriApexFinset
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    surplusTriApexes S i ∈ surplusTriApexFinset S := by
  fin_cases i <;> simp [surplusTriApexFinset, surplusTriApexes]

/-- A member of the Moser triple's finite set is one of the three apexes,
named by its index. -/
theorem exists_index_of_mem_surplusTriApexFinset
    {A : Finset ℝ²} (S : SurplusCapPacket A) {c : ℝ²}
    (hc : c ∈ surplusTriApexFinset S) :
    ∃ i : Fin 3, c = surplusTriApexes S i := by
  simp only [surplusTriApexFinset, Finset.mem_insert, Finset.mem_singleton] at hc
  rcases hc with rfl | rfl | rfl
  · exact ⟨0, rfl⟩
  · exact ⟨1, rfl⟩
  · exact ⟨2, rfl⟩

/-- The Moser triple's finite set lies inside the carrier. -/
theorem surplusTriApexFinset_subset_carrier
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    surplusTriApexFinset S ⊆ A := by
  intro c hc
  rcases exists_index_of_mem_surplusTriApexFinset S hc with ⟨i, rfl⟩
  exact surplusTriApexes_mem_carrier S i

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A}
  {F : CriticalPairFrontier D S radius H}
  {R : FrontierCommonDeletionParentResidual F}

/- ## Robustness at all three Moser apexes -/

/-- Every Moser apex survives the deletion of any one carrier point.

The first opposite apex is robust on the common-deletion parent residual alone,
the second on the bi-apex robust residual, and the surplus apex by the explicit
hypothesis.  That third hypothesis has no shared-layer producer: see the module
docstring. -/
theorem fullyDeletionRobustAt_surplusTriApexes
    (B : FrontierBiApexRobustResidual R)
    (hsurplus : FullyDeletionRobustAt D S.surplusApex) (i : Fin 3) :
    FullyDeletionRobustAt D (surplusTriApexes S i) := by
  fin_cases i
  · exact hsurplus
  · exact R.firstApexFullyDeletionRobust
  · exact B.secondApex_robust

/- ## The class-and-cap escape set -/

/-- The escape set of a provenance core at one apex class and one cap.

Its members are the carrier points that lie on the class of `center` at radius
`rho`, lie in the strict interior of the cap `capIndex`, and miss the core's
exact source row.  Every membership is a pointwise fact about a named point; the
set is never described by its cardinality. -/
def classCapInteriorEscapeSet (S : SurplusCapPacket D.A)
    (C : JointDeletionCore D H) (center : ℝ²) (rho : ℝ) (capIndex : Fin 3) :
    Finset ℝ² :=
  (SelectedClass D.A center rho ∩ S.capInteriorByIndex capIndex) \
    C.exactSourceRow.toCriticalFourShell.support

section EscapeSetFacts

variable {C : JointDeletionCore D H} {center : ℝ²} {rho : ℝ} {capIndex : Fin 3}

/-- Membership in the escape set, spelled out as its three constituent
facts. -/
theorem mem_classCapInteriorEscapeSet_iff {z : ℝ²} :
    z ∈ classCapInteriorEscapeSet S C center rho capIndex ↔
      z ∈ SelectedClass D.A center rho ∧
        z ∈ S.capInteriorByIndex capIndex ∧
        z ∉ C.exactSourceRow.toCriticalFourShell.support := by
  simp only [classCapInteriorEscapeSet, Finset.mem_sdiff, Finset.mem_inter,
    and_assoc]

/-- An escape point lies on the recorded apex class. -/
theorem mem_selectedClass_of_mem_classCapInteriorEscapeSet {z : ℝ²}
    (hz : z ∈ classCapInteriorEscapeSet S C center rho capIndex) :
    z ∈ SelectedClass D.A center rho :=
  (mem_classCapInteriorEscapeSet_iff.mp hz).1

/-- An escape point lies in the strict interior of the recorded cap. -/
theorem mem_capInterior_of_mem_classCapInteriorEscapeSet {z : ℝ²}
    (hz : z ∈ classCapInteriorEscapeSet S C center rho capIndex) :
    z ∈ S.capInteriorByIndex capIndex :=
  (mem_classCapInteriorEscapeSet_iff.mp hz).2.1

/-- An escape point misses the core's exact source row. -/
theorem not_mem_exactSourceRow_of_mem_classCapInteriorEscapeSet {z : ℝ²}
    (hz : z ∈ classCapInteriorEscapeSet S C center rho capIndex) :
    z ∉ C.exactSourceRow.toCriticalFourShell.support :=
  (mem_classCapInteriorEscapeSet_iff.mp hz).2.2

/-- The escape set lies inside the carrier. -/
theorem classCapInteriorEscapeSet_subset_carrier :
    classCapInteriorEscapeSet S C center rho capIndex ⊆ D.A := by
  intro z hz
  exact (mem_selectedClass.mp
    (mem_selectedClass_of_mem_classCapInteriorEscapeSet hz)).1

/-- The recorded deletion is an escape point as soon as it lies on the apex
class and in the cap interior: it misses the source row by the core's own
omission. -/
theorem deleted_mem_classCapInteriorEscapeSet
    (hdeletedClass : C.deleted.1 ∈ SelectedClass D.A center rho)
    (hdeletedCap : C.deleted.1 ∈ S.capInteriorByIndex capIndex) :
    C.deleted.1 ∈ classCapInteriorEscapeSet S C center rho capIndex :=
  mem_classCapInteriorEscapeSet_iff.mpr
    ⟨hdeletedClass, hdeletedCap, C.deleted_not_mem_exactSourceRow⟩

end EscapeSetFacts

/- ## The enlarged provenance core -/

section TriApexConstruction

variable (B : FrontierBiApexRobustResidual R)
  (hsurplus : FullyDeletionRobustAt D S.surplusApex)
  (C : JointDeletionCore D H) (center : ℝ²) (rho : ℝ) (capIndex : Fin 3)

/-- The provenance core enlarged for the tri-apex caller.

The source, its blocker, the exact source row and the deletion are carried
through unchanged.  The recorded survivals gain the three Moser apexes, each
with its own survival hypothesis coming from that apex's own robustness fact;
the recorded omissions gain the class-and-cap escape set, each of whose members
misses the source row by construction. -/
def triApexAugmentedJointDeletionCore : JointDeletionCore D H where
  source := C.source
  sourceBlocker := C.sourceBlocker
  sourceBlocker_eq := C.sourceBlocker_eq
  exactSourceRow := C.exactSourceRow
  deleted := C.deleted
  fixedSurvivals := C.fixedSurvivals ∪ surplusTriApexFinset S
  fixedSurvivals_subset_carrier := by
    intro c hc
    rcases Finset.mem_union.mp hc with hc | hc
    · exact C.fixedSurvivals_subset_carrier hc
    · exact surplusTriApexFinset_subset_carrier S hc
  survives_of_mem_fixedSurvivals := by
    intro c hc
    rcases Finset.mem_union.mp hc with hc | hc
    · exact C.survives_of_mem_fixedSurvivals c hc
    · rcases exists_index_of_mem_surplusTriApexFinset S hc with ⟨i, rfl⟩
      exact (fullyDeletionRobustAt_surplusTriApexes B hsurplus i).survives
        C.deleted.1 C.deleted.2
  fixedOmissions :=
    C.fixedOmissions ∪ classCapInteriorEscapeSet S C center rho capIndex
  fixedOmissions_subset_carrier := by
    intro z hz
    rcases Finset.mem_union.mp hz with hz | hz
    · exact C.fixedOmissions_subset_carrier hz
    · exact classCapInteriorEscapeSet_subset_carrier hz
  deleted_mem_fixedOmissions :=
    Finset.mem_union_left _ C.deleted_mem_fixedOmissions
  omitted_of_mem_fixedOmissions := by
    intro z hz
    rcases Finset.mem_union.mp hz with hz | hz
    · exact C.omitted_of_mem_fixedOmissions z hz
    · exact not_mem_exactSourceRow_of_mem_classCapInteriorEscapeSet hz

/-- The enlarged core keeps the source. -/
@[simp] theorem triApexAugmentedJointDeletionCore_source :
    (triApexAugmentedJointDeletionCore B hsurplus C center rho
      capIndex).source = C.source := rfl

/-- The enlarged core keeps the source's blocker. -/
@[simp] theorem triApexAugmentedJointDeletionCore_sourceBlocker :
    (triApexAugmentedJointDeletionCore B hsurplus C center rho
      capIndex).sourceBlocker = C.sourceBlocker := rfl

/-- The enlarged core keeps the exact source row. -/
@[simp] theorem triApexAugmentedJointDeletionCore_exactSourceRow :
    (triApexAugmentedJointDeletionCore B hsurplus C center rho
      capIndex).exactSourceRow = C.exactSourceRow := rfl

/-- The enlarged core keeps the deletion. -/
@[simp] theorem triApexAugmentedJointDeletionCore_deleted :
    (triApexAugmentedJointDeletionCore B hsurplus C center rho
      capIndex).deleted = C.deleted := rfl

/-- The enlarged core's survivals are the original ones together with the three
Moser apexes. -/
@[simp] theorem triApexAugmentedJointDeletionCore_fixedSurvivals :
    (triApexAugmentedJointDeletionCore B hsurplus C center rho
      capIndex).fixedSurvivals = C.fixedSurvivals ∪ surplusTriApexFinset S :=
  rfl

/-- The enlarged core's omissions are the original ones together with the
class-and-cap escape set. -/
@[simp] theorem triApexAugmentedJointDeletionCore_fixedOmissions :
    (triApexAugmentedJointDeletionCore B hsurplus C center rho
        capIndex).fixedOmissions =
      C.fixedOmissions ∪ classCapInteriorEscapeSet S C center rho capIndex :=
  rfl

/-- Every Moser apex is a recorded survival center of the enlarged core. -/
theorem surplusTriApexes_mem_triApexAugmentedJointDeletionCore_fixedSurvivals
    (i : Fin 3) :
    surplusTriApexes S i ∈
      (triApexAugmentedJointDeletionCore B hsurplus C center rho
        capIndex).fixedSurvivals :=
  Finset.mem_union_right _ (surplusTriApexes_mem_surplusTriApexFinset S i)

/- ## The tri-apex provenance -/

variable (hdeletedClass : C.deleted.1 ∈ SelectedClass D.A center rho)
  (hdeletedCap : C.deleted.1 ∈ S.capInteriorByIndex capIndex)

/-- Tri-apex provenance for a joint deletion, with the apexes bound to the
Moser triple of the ambient surplus cap packet.

This is the constructor `CallerProvenance` reserves: `apexes` is instantiated to
`surplusTriApexes S`, so the record no longer certifies survival at three
arbitrary points.  Survival at the first opposite apex comes from the parent
residual, survival at the second from `B`, and survival at the surplus apex from
the explicit hypothesis `hsurplus`, which has no shared-layer producer.  The
escape set is the class-and-cap set of the enlarged core, and every escape point
carries its own class membership, cap membership, and row omission. -/
def triApexJointDeletionProvenance_ofJointDeletionCore :
    TriApexJointDeletionProvenance D S H (surplusTriApexes S) :=
  TriApexJointDeletionProvenance.ofJointDeletionCore (S := S)
    (apexes := surplusTriApexes S)
    (triApexAugmentedJointDeletionCore B hsurplus C center rho capIndex)
    (surplusTriApexes_mem_triApexAugmentedJointDeletionCore_fixedSurvivals B
      hsurplus C center rho capIndex)
    (classCapInteriorEscapeSet S C center rho capIndex)
    classCapInteriorEscapeSet_subset_carrier
    (deleted_mem_classCapInteriorEscapeSet hdeletedClass hdeletedCap)
    Finset.subset_union_right
    (by
      intro z hz i
      exact (fullyDeletionRobustAt_surplusTriApexes B hsurplus i).survives z
        (classCapInteriorEscapeSet_subset_carrier hz))
    (fun _ => capIndex)
    (fun _ hz => mem_capInterior_of_mem_classCapInteriorEscapeSet hz)

/-- The tri-apex record carries the enlarged core. -/
@[simp] theorem triApexJointDeletionProvenance_ofJointDeletionCore_toJointDeletionCore :
    (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
          capIndex hdeletedClass hdeletedCap).toJointDeletionCore =
      triApexAugmentedJointDeletionCore B hsurplus C center rho capIndex :=
  rfl

/-- The tri-apex record keeps the given core's source. -/
@[simp] theorem triApexJointDeletionProvenance_ofJointDeletionCore_source :
    (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
      capIndex hdeletedClass hdeletedCap).source = C.source := rfl

/-- The tri-apex record keeps the given core's source blocker. -/
@[simp] theorem triApexJointDeletionProvenance_ofJointDeletionCore_sourceBlocker :
    (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
      capIndex hdeletedClass hdeletedCap).sourceBlocker = C.sourceBlocker := rfl

/-- The tri-apex record keeps the given core's exact source row. -/
@[simp] theorem triApexJointDeletionProvenance_ofJointDeletionCore_exactSourceRow :
    (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
      capIndex hdeletedClass hdeletedCap).exactSourceRow = C.exactSourceRow :=
  rfl

/-- The tri-apex record keeps the given core's deletion. -/
@[simp] theorem triApexJointDeletionProvenance_ofJointDeletionCore_deleted :
    (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
      capIndex hdeletedClass hdeletedCap).deleted = C.deleted := rfl

/-- The tri-apex record's escape set is the class-and-cap escape set. -/
@[simp] theorem triApexJointDeletionProvenance_ofJointDeletionCore_globalEscapeSet :
    (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
        capIndex hdeletedClass hdeletedCap).globalEscapeSet =
      classCapInteriorEscapeSet S C center rho capIndex := rfl

/-- The tri-apex record labels every point with the chosen cap index. -/
@[simp] theorem triApexJointDeletionProvenance_ofJointDeletionCore_capLabels :
    (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
        capIndex hdeletedClass hdeletedCap).capLabels =
      fun _ => capIndex := rfl

/-- The surplus apex is a recorded survival center of the record. -/
theorem surplusApex_mem_triApexJointDeletionProvenance_fixedSurvivals :
    S.surplusApex ∈
      (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center
        rho capIndex hdeletedClass hdeletedCap).fixedSurvivals :=
  (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
    capIndex hdeletedClass hdeletedCap).allApexSurvivals 0

/-- The first opposite apex is a recorded survival center of the record. -/
theorem oppApex1_mem_triApexJointDeletionProvenance_fixedSurvivals :
    S.oppApex1 ∈
      (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center
        rho capIndex hdeletedClass hdeletedCap).fixedSurvivals :=
  (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
    capIndex hdeletedClass hdeletedCap).allApexSurvivals 1

/-- The second opposite apex is a recorded survival center of the record. -/
theorem oppApex2_mem_triApexJointDeletionProvenance_fixedSurvivals :
    S.oppApex2 ∈
      (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center
        rho capIndex hdeletedClass hdeletedCap).fixedSurvivals :=
  (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
    capIndex hdeletedClass hdeletedCap).allApexSurvivals 2

/-- The recorded deletion survives at the surplus apex. -/
theorem triApexJointDeletionProvenance_ofJointDeletionCore_surplusApex_survives :
    HasNEquidistantPointsAt 4
      (D.A.erase (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus
        C center rho capIndex hdeletedClass hdeletedCap).deleted.1)
      S.surplusApex :=
  (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
    capIndex hdeletedClass hdeletedCap).apex_survives 0

/-- The recorded deletion survives at the first opposite apex. -/
theorem triApexJointDeletionProvenance_ofJointDeletionCore_oppApex1_survives :
    HasNEquidistantPointsAt 4
      (D.A.erase (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus
        C center rho capIndex hdeletedClass hdeletedCap).deleted.1)
      S.oppApex1 :=
  (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
    capIndex hdeletedClass hdeletedCap).apex_survives 1

/-- The recorded deletion survives at the second opposite apex. -/
theorem triApexJointDeletionProvenance_ofJointDeletionCore_oppApex2_survives :
    HasNEquidistantPointsAt 4
      (D.A.erase (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus
        C center rho capIndex hdeletedClass hdeletedCap).deleted.1)
      S.oppApex2 :=
  (triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus C center rho
    capIndex hdeletedClass hdeletedCap).apex_survives 2

end TriApexConstruction

/- ## The Moser triple read off any record bound to it -/

namespace TriApexJointDeletionProvenance

/-- On a record whose apexes are the Moser triple, the recorded deletion
survives at the surplus apex.  This is the first apex of `surplusTriApexes`
read back by name. -/
theorem surplusApex_survives
    (T : TriApexJointDeletionProvenance D S H (surplusTriApexes S)) :
    HasNEquidistantPointsAt 4 (D.A.erase T.deleted.1) S.surplusApex :=
  T.apex_survives 0

/-- On a record whose apexes are the Moser triple, the recorded deletion
survives at the first opposite apex. -/
theorem oppApex1_survives
    (T : TriApexJointDeletionProvenance D S H (surplusTriApexes S)) :
    HasNEquidistantPointsAt 4 (D.A.erase T.deleted.1) S.oppApex1 :=
  T.apex_survives 1

/-- On a record whose apexes are the Moser triple, the recorded deletion
survives at the second opposite apex. -/
theorem oppApex2_survives
    (T : TriApexJointDeletionProvenance D S H (surplusTriApexes S)) :
    HasNEquidistantPointsAt 4 (D.A.erase T.deleted.1) S.oppApex2 :=
  T.apex_survives 2

/-- On a record whose apexes are the Moser triple, every escape point survives
at all three named apexes. -/
theorem escape_survives_at_moserApexes
    (T : TriApexJointDeletionProvenance D S H (surplusTriApexes S))
    {z : ℝ²} (hz : z ∈ T.globalEscapeSet) :
    HasNEquidistantPointsAt 4 (D.A.erase z) S.surplusApex ∧
      HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex1 ∧
      HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex2 :=
  ⟨T.escape_survives_at_apexes z hz 0, T.escape_survives_at_apexes z hz 1,
    T.escape_survives_at_apexes z hz 2⟩

end TriApexJointDeletionProvenance

/- ## The oriented retained common deletion as tri-apex caller -/

variable {P : RetainedInteriorDirectedOmission R}

/-- Tri-apex provenance read off an oriented retained common deletion.

The oriented record's deleted source already lies on the first opposite apex
class at the frontier radius and in the strict interior of the first opposite
cap, so the class-and-cap escape set is taken at that apex, that radius, and
that cap index, and both class arguments are discharged by the record's own
fields.  The apexes are the Moser triple. -/
def triApexJointDeletionProvenance_ofOrientedRetainedCommonDeletion
    (B : FrontierBiApexRobustResidual R)
    (hsurplus : FullyDeletionRobustAt D S.surplusApex)
    (O : OrientedRetainedCommonDeletion P) :
    TriApexJointDeletionProvenance D S H (surplusTriApexes S) :=
  triApexJointDeletionProvenance_ofJointDeletionCore B hsurplus
    (jointDeletionCore_ofOrientedRetainedCommonDeletion O) S.oppApex1 radius
    S.oppIndex1 O.deleted_mem_radius O.deleted_mem_capInterior

/-- The oriented reading keeps the kept source as the provenance source. -/
@[simp] theorem triApexJointDeletionProvenance_ofOrientedRetainedCommonDeletion_source
    (B : FrontierBiApexRobustResidual R)
    (hsurplus : FullyDeletionRobustAt D S.surplusApex)
    (O : OrientedRetainedCommonDeletion P) :
    (triApexJointDeletionProvenance_ofOrientedRetainedCommonDeletion B hsurplus
      O).source.1 = O.kept := rfl

/-- The oriented reading keeps the system's chosen blocker at the kept
source. -/
@[simp] theorem triApexJointDeletionProvenance_ofOrientedRetainedCommonDeletion_sourceBlocker
    (B : FrontierBiApexRobustResidual R)
    (hsurplus : FullyDeletionRobustAt D S.surplusApex)
    (O : OrientedRetainedCommonDeletion P) :
    (triApexJointDeletionProvenance_ofOrientedRetainedCommonDeletion B hsurplus
      O).sourceBlocker = H.centerAt O.kept O.kept_mem_A := rfl

/-- The oriented reading keeps the deleted source as the deletion. -/
@[simp] theorem triApexJointDeletionProvenance_ofOrientedRetainedCommonDeletion_deleted
    (B : FrontierBiApexRobustResidual R)
    (hsurplus : FullyDeletionRobustAt D S.surplusApex)
    (O : OrientedRetainedCommonDeletion P) :
    (triApexJointDeletionProvenance_ofOrientedRetainedCommonDeletion B hsurplus
      O).deleted.1 = O.deleted := rfl

/-- A stored retained interior common deletion produces tri-apex provenance at
the Moser triple.

The hypotheses are those of `nonempty_orientedRetainedCommonDeletion` together
with the bi-apex robust residual and the surplus-apex survival.  Nothing further
is assumed, and the surplus-apex survival is not derived here: it is the caller's
to supply. -/
theorem nonempty_triApexJointDeletionProvenance_of_retainedInteriorCommonDeletion
    (B : FrontierBiApexRobustResidual R)
    (hsurplus : FullyDeletionRobustAt D S.surplusApex)
    (P : RetainedInteriorDirectedOmission R)
    (K : RetainedInteriorCommonDeletion P) :
    Nonempty (TriApexJointDeletionProvenance D S H (surplusTriApexes S)) := by
  rcases nonempty_orientedRetainedCommonDeletion P K with ⟨O⟩
  exact ⟨triApexJointDeletionProvenance_ofOrientedRetainedCommonDeletion B
    hsurplus O⟩

end

end ATailFrontierLiveClosure
end Problem97
