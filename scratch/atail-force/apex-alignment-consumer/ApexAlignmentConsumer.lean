/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import GlobalSourceSelection
import CriticalSystemRebase
import BlockerAlignment

/-!
# Scratch: exact consumption of the two cross-survival apex alignments

This file consumes only `ApexDoubleCriticalResidual` and
`DeletedBlockerApexAlignment`.  Both normalize to a certified critical shell
for deletion of the oriented survivor's deleted endpoint at `S.oppApex2`.
The certificate may be installed into a favorable `CriticalShellSystem` after
the geometric frontier and cross labels have been selected.

The resulting prescribed-deletion equality is already present in the parent
second-apex row.  Consequently the smallest genuinely additional incidence
packet is another selected four-row at that same apex whose support omits the
deleted endpoint.  Such a row survives the deletion and is immediately
incompatible with either residual.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailApexAlignmentConsumerScratch

open ATailCriticalPairFrontier
open ATailCriticalSystemRebaseScratch
open ATailCrossSurvivalEliminatorScratch
open ATailGlobalK4Extension
open ATailGlobalSourceSelectionScratch

attribute [local instance] Classical.propDecidable

/-- Forget the phantom critical-system parameter of an oriented cross packet.
All fields of the packet are geometric or selected-row data. -/
def rebaseCrossSurvivalApexPacketSystem
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H)
    (H' : CriticalShellSystem D.A) :
    CrossSurvivalApexPacket D S H' where
  survivor := {
    center := O.survivor.center
    deleted := O.survivor.deleted
    center_mem_A := O.survivor.center_mem_A
    deleted_mem_A := O.survivor.deleted_mem_A
    center_ne_deleted := O.survivor.center_ne_deleted
    center_strict := O.survivor.center_strict
    survives := O.survivor.survives
    exactRow := O.survivor.exactRow }
  apexRow := O.apexRow
  center_mem_apexRow := O.center_mem_apexRow
  deleted_mem_apexRow := O.deleted_mem_apexRow

/-- Choice-free certificate common to both exact apex-alignment residuals. -/
structure DeletedApexCriticalCertificate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) where
  shell :
    CriticalSelectedFourClass D.A O.survivor.deleted S.oppApex2
  blocked :
    ¬ HasNEquidistantPointsAt 4
      (D.A.erase O.survivor.deleted) S.oppApex2

private theorem transportedSelectedFourClass_support
    {A : Finset ℝ²} {c d : ℝ²}
    (h : c = d) (K : SelectedFourClass A d) :
    (h.symm ▸ K).support = K.support := by
  subst d
  rfl

private theorem overrideAt_selectedAt_support
    {A : Finset ℝ²} (H0 : CriticalShellSystem A)
    {source center : ℝ²}
    (C : CriticalSelectedFourClass A source center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase source) center)
    (hsource : source ∈ A) :
    ((H0.overrideAt C hblocked).selectedAt source hsource).toCriticalFourShell.support =
      C.toCriticalFourShell.support := by
  simp only [CriticalShellSystem.selectedAt,
    CriticalShellSystem.centerAt, CriticalShellSystem.overrideAt]
  rw [dif_pos rfl]

/-- The double-critical residual contains the common deleted-endpoint
certificate, independently of the inherited critical system. -/
def deletedApexCriticalCertificate_of_apexDouble
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (R : ApexDoubleCriticalResidual O) :
    DeletedApexCriticalCertificate O := by
  refine {
    shell := ?_
    blocked := ?_ }
  · simpa only [R.source_eq_oppApex2] using R.deletedCritical
  · simpa only [R.source_eq_oppApex2] using R.deletedBlocks

/-- Actual-map alignment gives the same choice-free certificate. -/
def deletedApexCriticalCertificate_of_blockerAlignment
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (R : DeletedBlockerApexAlignment O) :
    DeletedApexCriticalCertificate O := by
  refine {
    shell := ?_
    blocked := ?_ }
  · simpa only [R.blocker_eq_oppApex2] using
      (H.selectedAt O.survivor.deleted
        O.survivor.deleted_mem_A)
  · simpa only [R.blocker_eq_oppApex2] using
      (H.no_qfree_at O.survivor.deleted
        O.survivor.deleted_mem_A)

/-- Favorable-system normalization of one deleted-apex certificate.  The
installed selected support is forced to equal the already retained parent
apex row, so no selector-support alignment remains open. -/
theorem exists_favorableSystem_of_deletedApexCriticalCertificate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (H0 : CriticalShellSystem D.A)
    (C : DeletedApexCriticalCertificate O) :
    ∃ Hfav : CriticalShellSystem D.A,
      Hfav.centerAt O.survivor.deleted O.survivor.deleted_mem_A =
          S.oppApex2 ∧
        (Hfav.selectedAt O.survivor.deleted
          O.survivor.deleted_mem_A).toCriticalFourShell.support =
            O.apexRow.support := by
  let Hfav := H0.overrideAt C.shell C.blocked
  have hcenter :
      Hfav.centerAt O.survivor.deleted O.survivor.deleted_mem_A =
        S.oppApex2 := by
    simpa only [Hfav] using
      H0.overrideAt_centerAt C.shell C.blocked
        O.survivor.deleted_mem_A
  let K : SelectedFourClass D.A
      (Hfav.centerAt O.survivor.deleted O.survivor.deleted_mem_A) :=
    hcenter.symm ▸ O.apexRow
  have hsupport :=
    Hfav.selectedFourClass_support_eq_shell
      O.survivor.deleted O.survivor.deleted_mem_A K
  refine ⟨Hfav, hcenter, ?_⟩
  exact hsupport.symm.trans
    (transportedSelectedFourClass_support hcenter O.apexRow)

/-- The certified shell and the parent apex row have exactly the same
support.  This is stronger than a single radius equality and is independent
of which system supplied the certificate. -/
theorem DeletedApexCriticalCertificate.shell_support_eq_apexRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (C : DeletedApexCriticalCertificate O) :
    C.shell.toCriticalFourShell.support = O.apexRow.support := by
  let Hfav := H.overrideAt C.shell C.blocked
  have hinstalled :
      (Hfav.selectedAt O.survivor.deleted
        O.survivor.deleted_mem_A).toCriticalFourShell.support =
          C.shell.toCriticalFourShell.support := by
    simpa only [Hfav] using
      overrideAt_selectedAt_support H C.shell C.blocked
        O.survivor.deleted_mem_A
  have hcenter :
      Hfav.centerAt O.survivor.deleted O.survivor.deleted_mem_A =
        S.oppApex2 := by
    simpa only [Hfav] using
      H.overrideAt_centerAt C.shell C.blocked
        O.survivor.deleted_mem_A
  let K : SelectedFourClass D.A
      (Hfav.centerAt O.survivor.deleted O.survivor.deleted_mem_A) :=
    hcenter.symm ▸ O.apexRow
  have hsupport :=
    Hfav.selectedFourClass_support_eq_shell
      O.survivor.deleted O.survivor.deleted_mem_A K
  exact hinstalled.symm.trans
    (hsupport.symm.trans
      (transportedSelectedFourClass_support hcenter O.apexRow))

/-- Rebase the oriented cross packet itself after installing the certified
shell.  This is the choice-after-labels operation used by the favorable
one-dispatch parent surface. -/
theorem exists_favorableCrossPacket_of_deletedApexCriticalCertificate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (H0 : CriticalShellSystem D.A)
    (C : DeletedApexCriticalCertificate O) :
    ∃ (Hfav : CriticalShellSystem D.A)
        (O' : CrossSurvivalApexPacket D S Hfav),
      Hfav.centerAt O'.survivor.deleted O'.survivor.deleted_mem_A =
          S.oppApex2 ∧
        (Hfav.selectedAt O'.survivor.deleted
          O'.survivor.deleted_mem_A).toCriticalFourShell.support =
            O'.apexRow.support := by
  rcases exists_favorableSystem_of_deletedApexCriticalCertificate
      H0 C with ⟨Hfav, hcenter, hsupport⟩
  exact ⟨Hfav, rebaseCrossSurvivalApexPacketSystem O Hfav,
    hcenter, hsupport⟩

/-- The same normalization can be attached to a previously selected
H-independent frontier by rebasing it to the favorable system. -/
theorem exists_favorableFrontier_of_deletedApexCriticalCertificate
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {Hfrontier H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r Hfrontier)
    {O : CrossSurvivalApexPacket D S H}
    (C : DeletedApexCriticalCertificate O) :
    ∃ Hfav : CriticalShellSystem D.A,
      Nonempty (CriticalPairFrontier D S r Hfav) ∧
        Hfav.centerAt O.survivor.deleted O.survivor.deleted_mem_A =
          S.oppApex2 ∧
        (Hfav.selectedAt O.survivor.deleted
          O.survivor.deleted_mem_A).toCriticalFourShell.support =
            O.apexRow.support := by
  rcases exists_favorableSystem_of_deletedApexCriticalCertificate
      Hfrontier C with ⟨Hfav, hcenter, hsupport⟩
  exact ⟨Hfav, ⟨rebaseCriticalPairFrontierSystem F Hfav⟩,
    hcenter, hsupport⟩

/-- The double-critical residual permits both certified shells to be
installed simultaneously after the labels are known. -/
theorem exists_favorableSystem_of_apexDouble
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (H0 : CriticalShellSystem D.A)
    (R : ApexDoubleCriticalResidual O) :
    ∃ Hfav : CriticalShellSystem D.A,
      Hfav.centerAt O.survivor.deleted O.survivor.deleted_mem_A =
          S.oppApex2 ∧
        Hfav.centerAt O.survivor.center O.survivor.center_mem_A =
          S.oppApex2 ∧
        (Hfav.selectedAt O.survivor.deleted
          O.survivor.deleted_mem_A).toCriticalFourShell.support =
            O.apexRow.support ∧
        (Hfav.selectedAt O.survivor.center
          O.survivor.center_mem_A).toCriticalFourShell.support =
            O.apexRow.support := by
  have Cdeleted :
      CriticalSelectedFourClass D.A O.survivor.deleted S.oppApex2 := by
    simpa only [R.source_eq_oppApex2] using R.deletedCritical
  have hdeletedBlocked :
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase O.survivor.deleted) S.oppApex2 := by
    simpa only [R.source_eq_oppApex2] using R.deletedBlocks
  have Ccenter :
      CriticalSelectedFourClass D.A O.survivor.center S.oppApex2 := by
    simpa only [R.source_eq_oppApex2] using R.centerCritical
  have hcenterBlocked :
      ¬ HasNEquidistantPointsAt 4
        (D.A.erase O.survivor.center) S.oppApex2 := by
    simpa only [R.source_eq_oppApex2] using R.centerBlocks
  let Hdeleted := H0.overrideAt Cdeleted hdeletedBlocked
  let Hfav := Hdeleted.overrideAt Ccenter hcenterBlocked
  have hdeletedCenter :
      Hfav.centerAt O.survivor.deleted O.survivor.deleted_mem_A =
        S.oppApex2 := by
    calc
      Hfav.centerAt O.survivor.deleted O.survivor.deleted_mem_A =
          Hdeleted.centerAt O.survivor.deleted O.survivor.deleted_mem_A := by
        exact Hdeleted.overrideAt_centerAt_of_ne Ccenter hcenterBlocked
          O.survivor.deleted_mem_A O.survivor.center_ne_deleted.symm
      _ = S.oppApex2 := by
        simpa only [Hdeleted] using
          H0.overrideAt_centerAt Cdeleted hdeletedBlocked
            O.survivor.deleted_mem_A
  have hcenterCenter :
      Hfav.centerAt O.survivor.center O.survivor.center_mem_A =
        S.oppApex2 := by
    simpa only [Hfav] using
      Hdeleted.overrideAt_centerAt Ccenter hcenterBlocked
        O.survivor.center_mem_A
  let Kdeleted : SelectedFourClass D.A
      (Hfav.centerAt O.survivor.deleted O.survivor.deleted_mem_A) :=
    hdeletedCenter.symm ▸ O.apexRow
  let Kcenter : SelectedFourClass D.A
      (Hfav.centerAt O.survivor.center O.survivor.center_mem_A) :=
    hcenterCenter.symm ▸ O.apexRow
  have hdeletedSupport :=
    Hfav.selectedFourClass_support_eq_shell
      O.survivor.deleted O.survivor.deleted_mem_A Kdeleted
  have hcenterSupport :=
    Hfav.selectedFourClass_support_eq_shell
      O.survivor.center O.survivor.center_mem_A Kcenter
  refine ⟨Hfav, hdeletedCenter, hcenterCenter, ?_, ?_⟩
  · exact hdeletedSupport.symm.trans
      (transportedSelectedFourClass_support hdeletedCenter O.apexRow)
  · exact hcenterSupport.symm.trans
      (transportedSelectedFourClass_support hcenterCenter O.apexRow)

/-- The h5-shaped equality delivered by prescribed deletion criticality. -/
theorem h5_of_deletedApexCriticalCertificate
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (C : DeletedApexCriticalCertificate O)
    (K : SelectedFourClass D.A S.oppApex2)
    {anchor : ℝ²} (hanchor : anchor ∈ K.support) :
    dist S.oppApex2 anchor =
      dist S.oppApex2 O.survivor.deleted :=
  h5_of_prescribed_deletion_criticality K hanchor C.blocked

/-- The parent apex row already contains the h5 edge before either critical
residual is inspected. -/
theorem parentApexPair_radius_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) :
    dist S.oppApex2 O.survivor.center =
      dist S.oppApex2 O.survivor.deleted :=
  (O.apexRow.support_eq_radius O.survivor.center
      (Finset.mem_inter.mp O.center_mem_apexRow).1).trans
    (O.apexRow.support_eq_radius O.survivor.deleted
      (Finset.mem_inter.mp O.deleted_mem_apexRow).1).symm

/-- Calling the h5 adapter on the retained parent row produces exactly the
already-known apex-row equality. -/
theorem h5_from_certificate_is_parentApexPair_radius_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (C : DeletedApexCriticalCertificate O) :
    dist S.oppApex2 O.survivor.center =
      dist S.oppApex2 O.survivor.deleted :=
  h5_of_deletedApexCriticalCertificate C O.apexRow
    (Finset.mem_inter.mp O.center_mem_apexRow).1

/-- Smallest exact additional incidence packet: a selected K4 row at the
second apex whose support omits the prescribed deleted endpoint. -/
structure DeletedApexOmissionPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (O : CrossSurvivalApexPacket D S H) where
  row : SelectedFourClass D.A S.oppApex2
  deleted_not_mem : O.survivor.deleted ∉ row.support

private theorem deletion_survives_of_selectedRow_omission
    {A : Finset ℝ²} {source center : ℝ²}
    (K : SelectedFourClass A center)
    (hsource : source ∉ K.support) :
    HasNEquidistantPointsAt 4 (A.erase source) center := by
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ ((A.erase source).filter
        fun z => dist center z = K.radius).card := by
      apply Finset.card_le_card
      intro z hz
      exact Finset.mem_filter.mpr
        ⟨Finset.mem_erase.mpr
            ⟨fun h => hsource (h ▸ hz), K.support_subset_A hz⟩,
          K.support_eq_radius z hz⟩

/-- The omission packet is terminal for the choice-free certificate. -/
theorem false_of_deletedApexCriticalCertificate_and_omission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (C : DeletedApexCriticalCertificate O)
    (P : DeletedApexOmissionPacket O) : False :=
  C.blocked
    (deletion_survives_of_selectedRow_omission
      P.row P.deleted_not_mem)

/-- Direct consumer for the double-critical residual. -/
theorem false_of_apexDouble_and_deletedApexOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (R : ApexDoubleCriticalResidual O)
    (P : DeletedApexOmissionPacket O) : False :=
  false_of_deletedApexCriticalCertificate_and_omission
    (deletedApexCriticalCertificate_of_apexDouble R) P

/-- Direct consumer for actual-map blocker--apex alignment. -/
theorem false_of_deletedBlockerAlignment_and_deletedApexOmission
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {O : CrossSurvivalApexPacket D S H}
    (R : DeletedBlockerApexAlignment O)
    (P : DeletedApexOmissionPacket O) : False :=
  false_of_deletedApexCriticalCertificate_and_omission
    (deletedApexCriticalCertificate_of_blockerAlignment R) P

#print axioms rebaseCrossSurvivalApexPacketSystem
#print axioms deletedApexCriticalCertificate_of_apexDouble
#print axioms deletedApexCriticalCertificate_of_blockerAlignment
#print axioms exists_favorableSystem_of_deletedApexCriticalCertificate
#print axioms DeletedApexCriticalCertificate.shell_support_eq_apexRow
#print axioms exists_favorableCrossPacket_of_deletedApexCriticalCertificate
#print axioms exists_favorableFrontier_of_deletedApexCriticalCertificate
#print axioms exists_favorableSystem_of_apexDouble
#print axioms h5_of_deletedApexCriticalCertificate
#print axioms parentApexPair_radius_eq
#print axioms h5_from_certificate_is_parentApexPair_radius_eq
#print axioms false_of_deletedApexCriticalCertificate_and_omission
#print axioms false_of_apexDouble_and_deletedApexOmission
#print axioms false_of_deletedBlockerAlignment_and_deletedApexOmission

end ATailApexAlignmentConsumerScratch
end Problem97
