/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.RetainedMatchingSourceReturnRadiusSplit
import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# Normal form for the paired retained common deletion

The paired arm of the retained-omission normal form is a source-return
two-step common-deletion walk: the kept and the deleted source lie on the
retained first-apex radius, each is omitted by the other's canonical critical
shell, and their actual blockers are distinct.

`RetainedMatchingSourceReturnRadiusSplit` already classifies that walk into a
joint deletion on the retained radius or an exact two-by-two cut of a
four-point retained class.  This file renews the exact-four arm at the second
rich first-apex radius supplied by `ApexRichClassStructure`, and the result is
the exhaustive two-outcome normal form

* `PairedApexClassJointDeletion` — a carrier point on some first-apex class of
  at least four points escapes both retained shells, so its deletion is a
  common deletion at the first apex and at both retained blockers; or
* `PairedTwoRadiusGrid` — both retained shells are pinned onto two concentric
  first-apex classes of cardinality exactly four, meeting each class in exactly
  two points, with the two shells disjoint and their union equal to the union
  of the two classes.

The grid arm carries order-sensitive content for free: each shell's two hits on
a first-apex circle are equidistant from the first apex *and* from that shell's
blocker, so the two hits have opposite signed areas against the chord joining
the apex to the blocker (`*_sep` below).  That is the reflection statement, not
merely an incidence count.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailPairedCommonDeletionNormalForm

open ATailApexRichClassStructure
open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedMatchingCommonDeletionCycle
open ATailRetainedMatchingGeometricReduction
open ATailRetainedMatchingLargeCapConsumer
open ATailRetainedMatchingSourceReturnRadiusSplit

attribute [local instance] Classical.propDecidable

noncomputable section

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A}
  {F : CriticalPairFrontier D S radius H}
  {R : FrontierCommonDeletionParentResidual F}
  {P : RetainedInteriorDirectedOmission R}

/-- The paired arm is literally the source-return two-step walk: the kept
source is both the first and the returned endpoint. -/
def pairedSourceReturnWalk
    (O : OrientedRetainedCommonDeletion P)
    (reversePacket :
      CommonDeletionTwoCenterPacket
        D H O.kept S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A)) :
    RetainedMatchingTwoStepCommonDeletionWalk R where
  first := O.kept
  second := O.deleted
  next := O.kept
  first_mem_A := O.kept_mem_A
  second_mem_A := O.deleted_mem_A
  next_mem_A := O.kept_mem_A
  first_ne_second := O.sources_ne
  second_ne_next := O.sources_ne.symm
  first_mem_radius := O.kept_mem_radius
  second_mem_radius := O.deleted_mem_radius
  first_mem_capInterior := O.kept_mem_capInterior
  second_mem_capInterior := O.deleted_mem_capInterior
  firstPacket := O.packet
  secondPacket := reversePacket
  nextLocation := RetainedMatchingNextLocation.sourceReturn rfl

/-- A carrier point on a positive first-apex radius class of at least four
points which escapes both retained critical shells.  Its deletion preserves K4
at the first apex and at both retained blockers, so the paired common deletion
renews at three pairwise-distinct centers. -/
structure PairedApexClassJointDeletion
    (O : OrientedRetainedCommonDeletion P) : Type where
  /-- The first-apex radius carrying the escaping source. -/
  sourceRadius : ℝ
  sourceRadius_pos : 0 < sourceRadius
  sourceClass_card_ge_four :
    4 ≤ (SelectedClass D.A S.oppApex1 sourceRadius).card
  source : ℝ²
  source_mem_class :
    source ∈ SelectedClass D.A S.oppApex1 sourceRadius
  source_not_mem_keptShell :
    source ∉
      (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support
  source_not_mem_deletedShell :
    source ∉
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  keptPacket :
    CommonDeletionTwoCenterPacket D H source S.oppApex1
      (H.centerAt O.kept O.kept_mem_A)
  deletedPacket :
    CommonDeletionTwoCenterPacket D H source S.oppApex1
      (H.centerAt O.deleted O.deleted_mem_A)

namespace PairedApexClassJointDeletion

variable {O : OrientedRetainedCommonDeletion P}

theorem source_mem_A (J : PairedApexClassJointDeletion O) :
    J.source ∈ D.A :=
  (mem_selectedClass.mp J.source_mem_class).1

theorem source_ne_kept (J : PairedApexClassJointDeletion O) :
    J.source ≠ O.kept := by
  intro h
  apply J.source_not_mem_keptShell
  rw [h]
  exact (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.q_mem_support

theorem source_ne_deleted (J : PairedApexClassJointDeletion O) :
    J.source ≠ O.deleted := by
  intro h
  apply J.source_not_mem_deletedShell
  rw [h]
  exact (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.q_mem_support

/-- The escaping source has an actual blocker distinct from the first apex and
from both retained blockers. -/
theorem blocker_ne_keptBlocker (J : PairedApexClassJointDeletion O) :
    H.centerAt J.source J.source_mem_A ≠ H.centerAt O.kept O.kept_mem_A := by
  intro h
  apply J.source_not_mem_keptShell
  have hsupports :
      (H.selectedAt J.source J.source_mem_A).toCriticalFourShell.support =
        (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support := by
    rw [← ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support
        H J.source J.source_mem_A,
      ← ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support
        H O.kept O.kept_mem_A, h]
  rw [← hsupports]
  exact (H.selectedAt J.source J.source_mem_A).toCriticalFourShell.q_mem_support

theorem blocker_ne_deletedBlocker (J : PairedApexClassJointDeletion O) :
    H.centerAt J.source J.source_mem_A ≠
      H.centerAt O.deleted O.deleted_mem_A := by
  intro h
  apply J.source_not_mem_deletedShell
  have hsupports :
      (H.selectedAt J.source J.source_mem_A).toCriticalFourShell.support =
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support := by
    rw [← ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support
        H J.source J.source_mem_A,
      ← ATailMinimalUniqueFourCover.uniqueFourClass_centerAt_eq_selectedAt_support
        H O.deleted O.deleted_mem_A, h]
  rw [← hsupports]
  exact (H.selectedAt J.source J.source_mem_A).toCriticalFourShell.q_mem_support

end PairedApexClassJointDeletion

/-- The saturated two-radius grid.  Both retained critical shells are pinned
onto two concentric first-apex classes of cardinality exactly four: each shell
meets each class in a named two-point set, the two shells are disjoint, and
their union is exactly the union of the two classes. -/
structure PairedTwoRadiusGrid
    (O : OrientedRetainedCommonDeletion P) : Type where
  otherRadius : ℝ
  otherRadius_pos : 0 < otherRadius
  otherRadius_ne_radius : otherRadius ≠ radius
  retainedClass_card_eq_four :
    (SelectedClass D.A S.oppApex1 radius).card = 4
  otherClass_card_eq_four :
    (SelectedClass D.A S.oppApex1 otherRadius).card = 4
  keptPartner : ℝ²
  deletedPartner : ℝ²
  keptPartner_ne_kept : keptPartner ≠ O.kept
  deletedPartner_ne_deleted : deletedPartner ≠ O.deleted
  keptShell_inter_retained_eq :
    (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex1 radius =
      {O.kept, keptPartner}
  deletedShell_inter_retained_eq :
    (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex1 radius =
      {O.deleted, deletedPartner}
  keptOtherFirst : ℝ²
  keptOtherSecond : ℝ²
  keptOther_ne : keptOtherFirst ≠ keptOtherSecond
  keptShell_inter_other_eq :
    (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex1 otherRadius =
      {keptOtherFirst, keptOtherSecond}
  deletedOtherFirst : ℝ²
  deletedOtherSecond : ℝ²
  deletedOther_ne : deletedOtherFirst ≠ deletedOtherSecond
  deletedShell_inter_other_eq :
    (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex1 otherRadius =
      {deletedOtherFirst, deletedOtherSecond}
  keptShell_subset_union :
    (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support ⊆
      SelectedClass D.A S.oppApex1 radius ∪
        SelectedClass D.A S.oppApex1 otherRadius
  deletedShell_subset_union :
    (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support ⊆
      SelectedClass D.A S.oppApex1 radius ∪
        SelectedClass D.A S.oppApex1 otherRadius
  shells_disjoint :
    Disjoint
      (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
  shells_union_eq_classes_union :
    (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support ∪
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support =
      SelectedClass D.A S.oppApex1 radius ∪
        SelectedClass D.A S.oppApex1 otherRadius

/-- Exhaustive paired-arm classification: either the retained common deletion
renews at a first-apex class point escaping both shells, or the configuration
saturates into the two-radius grid. -/
inductive PairedCommonDeletionOutcome
    (O : OrientedRetainedCommonDeletion P) : Type
  | apexClassJointDeletion (data : PairedApexClassJointDeletion O)
  | twoRadiusGrid (data : PairedTwoRadiusGrid O)

/-- Two classes at one centre and distinct radii are disjoint. -/
theorem selectedClass_disjoint_of_radius_ne
    {A : Finset ℝ²} {p : ℝ²} {r₁ r₂ : ℝ} (hne : r₁ ≠ r₂) :
    Disjoint (SelectedClass A p r₁) (SelectedClass A p r₂) := by
  rw [Finset.disjoint_left]
  intro z hz₁ hz₂
  exact hne
    ((mem_selectedClass.mp hz₁).2.symm.trans (mem_selectedClass.mp hz₂).2)

/-- An exact-four class at a rich centre leaves a second radius carrying at
least four carrier points. -/
theorem exists_otherClass_card_ge_four_of_class_card_eq_four
    {p : ℝ²} {r : ℝ}
    (hrich : ApexRichClassStructure D.A p)
    (hfour : (SelectedClass D.A p r).card = 4) :
    ∃ ρ : ℝ, 0 < ρ ∧ ρ ≠ r ∧ 4 ≤ (SelectedClass D.A p ρ).card := by
  rcases hrich with ⟨r₀, hr₀, hsix⟩ | ⟨r₁, r₂, hr₁, hr₂, hne, hc₁, hc₂⟩
  · refine ⟨r₀, hr₀, ?_, by omega⟩
    intro h
    rw [h, hfour] at hsix
    omega
  · by_cases hr₁r : r₁ = r
    · refine ⟨r₂, hr₂, ?_, hc₂⟩
      rw [← hr₁r]
      exact fun h => hne h.symm
    · exact ⟨r₁, hr₁, hr₁r, hc₁⟩

/-- **Chord separation of two shell hits on one apex circle.**  Two distinct
points of one canonical critical shell that also lie on one class of a centre
`p` are equidistant from `p` and from the shell's blocker, so they fall on
opposite sides of the chord joining `p` to that blocker. -/
theorem shellClassPair_sep
    {w : ℝ²} (hw : w ∈ D.A) {p u v : ℝ²} {r : ℝ}
    (hu : u ∈ (H.selectedAt w hw).toCriticalFourShell.support)
    (hv : v ∈ (H.selectedAt w hw).toCriticalFourShell.support)
    (huClass : u ∈ SelectedClass D.A p r)
    (hvClass : v ∈ SelectedClass D.A p r)
    (huv : u ≠ v) :
    signedArea2 u p (H.centerAt w hw) =
      - signedArea2 v p (H.centerAt w hw) := by
  refine SurplusCOMPGBank.sep_signedArea2 u v p (H.centerAt w hw) ?_ ?_ huv
  · rw [dist_comm u p, dist_comm v p, (mem_selectedClass.mp huClass).2,
      (mem_selectedClass.mp hvClass).2]
  · rw [dist_comm u (H.centerAt w hw), dist_comm v (H.centerAt w hw),
      (H.selectedAt w hw).toCriticalFourShell.support_eq_radius u hu,
      (H.selectedAt w hw).toCriticalFourShell.support_eq_radius v hv]

namespace PairedTwoRadiusGrid

variable {O : OrientedRetainedCommonDeletion P}

theorem kept_mem_keptShell (_Gr : PairedTwoRadiusGrid O) :
    O.kept ∈ (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support :=
  (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.q_mem_support

theorem deleted_mem_deletedShell (_Gr : PairedTwoRadiusGrid O) :
    O.deleted ∈
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support :=
  (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.q_mem_support

private theorem mem_of_inter_eq_pair
    {K C : Finset ℝ²} {s t z : ℝ²} (heq : K ∩ C = {s, t})
    (hz : z ∈ ({s, t} : Finset ℝ²)) :
    z ∈ K ∧ z ∈ C := by
  have : z ∈ K ∩ C := by rw [heq]; exact hz
  exact ⟨(Finset.mem_inter.mp this).1, (Finset.mem_inter.mp this).2⟩

theorem keptPartner_mem_keptShell (Gr : PairedTwoRadiusGrid O) :
    Gr.keptPartner ∈
      (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support :=
  (mem_of_inter_eq_pair Gr.keptShell_inter_retained_eq (by simp)).1

theorem keptPartner_mem_retained (Gr : PairedTwoRadiusGrid O) :
    Gr.keptPartner ∈ SelectedClass D.A S.oppApex1 radius :=
  (mem_of_inter_eq_pair Gr.keptShell_inter_retained_eq (by simp)).2

theorem deletedPartner_mem_deletedShell (Gr : PairedTwoRadiusGrid O) :
    Gr.deletedPartner ∈
      (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support :=
  (mem_of_inter_eq_pair Gr.deletedShell_inter_retained_eq (by simp)).1

theorem deletedPartner_mem_retained (Gr : PairedTwoRadiusGrid O) :
    Gr.deletedPartner ∈ SelectedClass D.A S.oppApex1 radius :=
  (mem_of_inter_eq_pair Gr.deletedShell_inter_retained_eq (by simp)).2

/-- The kept source and its retained-class partner fall on opposite sides of
the chord from the first apex to the kept blocker. -/
theorem keptRetainedPair_sep (Gr : PairedTwoRadiusGrid O) :
    signedArea2 O.kept S.oppApex1 (H.centerAt O.kept O.kept_mem_A) =
      - signedArea2 Gr.keptPartner S.oppApex1
          (H.centerAt O.kept O.kept_mem_A) :=
  shellClassPair_sep O.kept_mem_A Gr.kept_mem_keptShell
    Gr.keptPartner_mem_keptShell O.kept_mem_radius Gr.keptPartner_mem_retained
    (fun h => Gr.keptPartner_ne_kept h.symm)

/-- The same separation for the two kept-shell hits on the second class. -/
theorem keptOtherPair_sep (Gr : PairedTwoRadiusGrid O) :
    signedArea2 Gr.keptOtherFirst S.oppApex1
        (H.centerAt O.kept O.kept_mem_A) =
      - signedArea2 Gr.keptOtherSecond S.oppApex1
          (H.centerAt O.kept O.kept_mem_A) :=
  shellClassPair_sep O.kept_mem_A
    (mem_of_inter_eq_pair Gr.keptShell_inter_other_eq (by simp)).1
    (mem_of_inter_eq_pair Gr.keptShell_inter_other_eq (by simp)).1
    (mem_of_inter_eq_pair Gr.keptShell_inter_other_eq (by simp)).2
    (mem_of_inter_eq_pair Gr.keptShell_inter_other_eq (by simp)).2
    Gr.keptOther_ne

/-- The deleted source and its retained-class partner fall on opposite sides
of the chord from the first apex to the deleted blocker. -/
theorem deletedRetainedPair_sep (Gr : PairedTwoRadiusGrid O) :
    signedArea2 O.deleted S.oppApex1 (H.centerAt O.deleted O.deleted_mem_A) =
      - signedArea2 Gr.deletedPartner S.oppApex1
          (H.centerAt O.deleted O.deleted_mem_A) :=
  shellClassPair_sep O.deleted_mem_A Gr.deleted_mem_deletedShell
    Gr.deletedPartner_mem_deletedShell O.deleted_mem_radius
    Gr.deletedPartner_mem_retained
    (fun h => Gr.deletedPartner_ne_deleted h.symm)

/-- The same separation for the two deleted-shell hits on the second class. -/
theorem deletedOtherPair_sep (Gr : PairedTwoRadiusGrid O) :
    signedArea2 Gr.deletedOtherFirst S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A) =
      - signedArea2 Gr.deletedOtherSecond S.oppApex1
          (H.centerAt O.deleted O.deleted_mem_A) :=
  shellClassPair_sep O.deleted_mem_A
    (mem_of_inter_eq_pair Gr.deletedShell_inter_other_eq (by simp)).1
    (mem_of_inter_eq_pair Gr.deletedShell_inter_other_eq (by simp)).1
    (mem_of_inter_eq_pair Gr.deletedShell_inter_other_eq (by simp)).2
    (mem_of_inter_eq_pair Gr.deletedShell_inter_other_eq (by simp)).2
    Gr.deletedOther_ne

end PairedTwoRadiusGrid

/-- **The paired arm reaches exactly one of the two normalized outcomes.**

The source-return split classifies the retained radius class; the exact-four
arm is then renewed at the second rich first-apex radius.  If that second class
is not covered by the two retained shells it supplies the escaping source;
otherwise the two ≤ 2 bounds force it to have cardinality exactly four, split
two and two, which pins both four-point shells onto the union of the two
classes. -/
theorem nonempty_pairedCommonDeletionOutcome
    (O : OrientedRetainedCommonDeletion P)
    (reversePacket :
      CommonDeletionTwoCenterPacket
        D H O.kept S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A))
    (hrich : ApexRichClassStructure D.A S.oppApex1) :
    Nonempty (PairedCommonDeletionOutcome O) := by
  classical
  rcases nonempty_sourceReturnRadiusOutcome
      (pairedSourceReturnWalk O reversePacket) rfl with ⟨outcome⟩
  cases outcome with
  | jointDeletion J =>
      exact ⟨PairedCommonDeletionOutcome.apexClassJointDeletion {
        sourceRadius := radius
        sourceRadius_pos := F.radius_pos
        sourceClass_card_ge_four := R.frontierRadius_class_card_ge_four
        source := J.source
        source_mem_class := J.source_mem_radius
        source_not_mem_keptShell := J.source_not_mem_firstShell
        source_not_mem_deletedShell := J.source_not_mem_secondShell
        keptPacket := J.firstPacket
        deletedPacket := J.secondPacket }⟩
  | exactFourPartition E =>
      rcases exists_otherClass_card_ge_four_of_class_card_eq_four
          hrich E.class_card_eq_four with ⟨ρ, hρpos, hρne, hρcard⟩
      set Kkept :=
        (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support
        with hKkept
      set Kdel :=
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support
        with hKdel
      set C := SelectedClass D.A S.oppApex1 radius with hC
      set C' := SelectedClass D.A S.oppApex1 ρ with hC'
      have hclassesDisjoint : Disjoint C C' :=
        selectedClass_disjoint_of_radius_ne (fun h => hρne h.symm)
      have hkeptCard : Kkept.card = 4 :=
        (H.selectedAt O.kept O.kept_mem_A).toCriticalFourShell.support_card
      have hdelCard : Kdel.card = 4 :=
        (H.selectedAt O.deleted O.deleted_mem_A).toCriticalFourShell.support_card
      have hkeptRetained : Kkept ∩ C = {O.kept, E.firstPartner} :=
        E.firstHits_eq
      have hdelRetained : Kdel ∩ C = {O.deleted, E.secondPartner} :=
        E.secondHits_eq
      have hkeptRetainedTwo : (Kkept ∩ C).card = 2 := by
        rw [hkeptRetained,
          Finset.card_insert_of_notMem (by
            simpa using fun h => E.firstPartner_ne_first h.symm),
          Finset.card_singleton]
      have hdelRetainedTwo : (Kdel ∩ C).card = 2 := by
        rw [hdelRetained,
          Finset.card_insert_of_notMem (by
            simpa using fun h => E.secondPartner_ne_second h.symm),
          Finset.card_singleton]
      by_cases hcover : C' ⊆ Kkept ∪ Kdel
      · have hkeptOther : (Kkept ∩ C').card ≤ 2 :=
          criticalShell_inter_selectedClass_card_le_two_of_apexRich
            H O.kept O.kept_mem_A hrich ρ
        have hdelOther : (Kdel ∩ C').card ≤ 2 :=
          criticalShell_inter_selectedClass_card_le_two_of_apexRich
            H O.deleted O.deleted_mem_A hrich ρ
        have hsplit : C' = (Kkept ∩ C') ∪ (Kdel ∩ C') := by
          apply Finset.Subset.antisymm
          · intro z hz
            rcases Finset.mem_union.mp (hcover hz) with h | h
            · exact Finset.mem_union_left _ (Finset.mem_inter.mpr ⟨h, hz⟩)
            · exact Finset.mem_union_right _ (Finset.mem_inter.mpr ⟨h, hz⟩)
          · intro z hz
            rcases Finset.mem_union.mp hz with h | h
            · exact (Finset.mem_inter.mp h).2
            · exact (Finset.mem_inter.mp h).2
        have hle : C'.card ≤ (Kkept ∩ C').card + (Kdel ∩ C').card := by
          calc
            C'.card = ((Kkept ∩ C') ∪ (Kdel ∩ C')).card := by rw [← hsplit]
            _ ≤ (Kkept ∩ C').card + (Kdel ∩ C').card := Finset.card_union_le _ _
        have hC'four : C'.card = 4 := by omega
        have hkeptOtherTwo : (Kkept ∩ C').card = 2 := by omega
        have hdelOtherTwo : (Kdel ∩ C').card = 2 := by omega
        have hshellSplit :
            ∀ K : Finset ℝ², K.card = 4 → (K ∩ C).card = 2 →
              (K ∩ C').card = 2 → K ⊆ C ∪ C' := by
          intro K hKcard hKC hKC'
          have hunion : K ∩ (C ∪ C') = (K ∩ C) ∪ (K ∩ C') := by
            ext z
            simp only [Finset.mem_inter, Finset.mem_union]
            tauto
          have hdisj : Disjoint (K ∩ C) (K ∩ C') :=
            Finset.disjoint_left.mpr fun z hz hz' =>
              (Finset.disjoint_left.mp hclassesDisjoint)
                (Finset.mem_inter.mp hz).2 (Finset.mem_inter.mp hz').2
          have hinter : (K ∩ (C ∪ C')).card = 4 := by
            rw [hunion, Finset.card_union_of_disjoint hdisj, hKC, hKC']
          have heq : K ∩ (C ∪ C') = K :=
            Finset.eq_of_subset_of_card_le Finset.inter_subset_left
              (by rw [hinter, hKcard])
          intro z hz
          exact (Finset.mem_inter.mp (heq ▸ hz)).2
        have hkeptSubset : Kkept ⊆ C ∪ C' :=
          hshellSplit Kkept hkeptCard hkeptRetainedTwo hkeptOtherTwo
        have hdelSubset : Kdel ⊆ C ∪ C' :=
          hshellSplit Kdel hdelCard hdelRetainedTwo hdelOtherTwo
        have hotherDisjoint : Disjoint (Kkept ∩ C') (Kdel ∩ C') := by
          have hcards :=
            Finset.card_union_add_card_inter (Kkept ∩ C') (Kdel ∩ C')
          rw [← hsplit, hC'four, hkeptOtherTwo, hdelOtherTwo] at hcards
          rw [Finset.disjoint_iff_inter_eq_empty]
          exact Finset.card_eq_zero.mp (by omega)
        have hshellsDisjoint : Disjoint Kkept Kdel := by
          refine Finset.disjoint_left.mpr ?_
          intro z hzKept hzDel
          rcases Finset.mem_union.mp (hkeptSubset hzKept) with hzC | hzC'
          · exact (Finset.disjoint_left.mp E.hits_disjoint)
              (Finset.mem_inter.mpr ⟨hzKept, hzC⟩)
              (Finset.mem_inter.mpr ⟨hzDel, hzC⟩)
          · exact (Finset.disjoint_left.mp hotherDisjoint)
              (Finset.mem_inter.mpr ⟨hzKept, hzC'⟩)
              (Finset.mem_inter.mpr ⟨hzDel, hzC'⟩)
        have hunionEq : Kkept ∪ Kdel = C ∪ C' := by
          refine Finset.eq_of_subset_of_card_le ?_ ?_
          · intro z hz
            rcases Finset.mem_union.mp hz with h | h
            · exact hkeptSubset h
            · exact hdelSubset h
          · rw [Finset.card_union_of_disjoint hshellsDisjoint,
              Finset.card_union_of_disjoint hclassesDisjoint,
              hkeptCard, hdelCard, E.class_card_eq_four, hC'four]
        rcases Finset.card_eq_two.mp hkeptOtherTwo with
          ⟨keptOtherFirst, keptOtherSecond, hkeptOtherNe, hkeptOtherEq⟩
        rcases Finset.card_eq_two.mp hdelOtherTwo with
          ⟨delOtherFirst, delOtherSecond, hdelOtherNe, hdelOtherEq⟩
        exact ⟨PairedCommonDeletionOutcome.twoRadiusGrid {
          otherRadius := ρ
          otherRadius_pos := hρpos
          otherRadius_ne_radius := hρne
          retainedClass_card_eq_four := E.class_card_eq_four
          otherClass_card_eq_four := hC'four
          keptPartner := E.firstPartner
          deletedPartner := E.secondPartner
          keptPartner_ne_kept := E.firstPartner_ne_first
          deletedPartner_ne_deleted := E.secondPartner_ne_second
          keptShell_inter_retained_eq := hkeptRetained
          deletedShell_inter_retained_eq := hdelRetained
          keptOtherFirst := keptOtherFirst
          keptOtherSecond := keptOtherSecond
          keptOther_ne := hkeptOtherNe
          keptShell_inter_other_eq := hkeptOtherEq
          deletedOtherFirst := delOtherFirst
          deletedOtherSecond := delOtherSecond
          deletedOther_ne := hdelOtherNe
          deletedShell_inter_other_eq := hdelOtherEq
          keptShell_subset_union := hkeptSubset
          deletedShell_subset_union := hdelSubset
          shells_disjoint := hshellsDisjoint
          shells_union_eq_classes_union := hunionEq }⟩
      · rcases Finset.not_subset.mp hcover with ⟨z, hzC', hzNot⟩
        have hzKkept : z ∉ Kkept := fun h => hzNot (Finset.mem_union_left _ h)
        have hzKdel : z ∉ Kdel := fun h => hzNot (Finset.mem_union_right _ h)
        have hzA : z ∈ D.A := (mem_selectedClass.mp hzC').1
        have hsurvApex :
            HasNEquidistantPointsAt 4 (D.A.erase z) S.oppApex1 :=
          R.firstApexFullyDeletionRobust.survives z hzA
        have hsurvKept :
            HasNEquidistantPointsAt 4 (D.A.erase z)
              (H.centerAt O.kept O.kept_mem_A) :=
          (cross_deletion_survives_iff_not_mem_selected_support
            H O.kept_mem_A).mpr hzKkept
        have hsurvDel :
            HasNEquidistantPointsAt 4 (D.A.erase z)
              (H.centerAt O.deleted O.deleted_mem_A) :=
          (cross_deletion_survives_iff_not_mem_selected_support
            H O.deleted_mem_A).mpr hzKdel
        rcases nonempty_commonDeletionTwoCenterPacket H hzA
            O.packet.center₁_mem_A O.packet.center₂_mem_A
            O.packet.centers_ne hsurvApex hsurvKept with ⟨keptPacket⟩
        rcases nonempty_commonDeletionTwoCenterPacket H hzA
            reversePacket.center₁_mem_A reversePacket.center₂_mem_A
            reversePacket.centers_ne hsurvApex hsurvDel with ⟨deletedPacket⟩
        exact ⟨PairedCommonDeletionOutcome.apexClassJointDeletion {
          sourceRadius := ρ
          sourceRadius_pos := hρpos
          sourceClass_card_ge_four := hρcard
          source := z
          source_mem_class := hzC'
          source_not_mem_keptShell := hzKkept
          source_not_mem_deletedShell := hzKdel
          keptPacket := keptPacket
          deletedPacket := deletedPacket }⟩

#print axioms nonempty_pairedCommonDeletionOutcome
#print axioms PairedTwoRadiusGrid.keptRetainedPair_sep
#print axioms PairedTwoRadiusGrid.deletedOtherPair_sep

end

end ATailPairedCommonDeletionNormalForm
end Problem97
