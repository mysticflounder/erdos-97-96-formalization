/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.EqualBlockerContinuation
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

/-!
# B1 six-point local roles

This file names the source-produced roles in the six-point branch of the B1
five/six normal form.  It retains only inequalities supplied by the source:
the two members of each live physical slice are distinct, as are the two
completion members within each exact row.  In particular, the packet does not
assert that roles belonging to different rows are distinct.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open Census554.EqualityCore
open Census554.GeneralCarrierBridge
open GenericRowNogoodCertificate

attribute [local instance] Classical.propDecidable

/-- A two-point slice named relative to one already distinguished member. -/
structure B1NamedTwoPointSlice (A slice : Finset ℝ²)
    (source : CarrierVertex A) where
  other : CarrierVertex A
  source_ne_other : source ≠ other
  slice_eq : slice = {source.1, other.1}

/-- Name the other point in a two-point slice containing a given carrier
source. -/
theorem nonempty_b1NamedTwoPointSlice_of_card_eq_two
    {A slice : Finset ℝ²} {source : CarrierVertex A}
    (hsliceA : slice ⊆ A) (hsource : source.1 ∈ slice)
    (hcard : slice.card = 2) :
    Nonempty (B1NamedTwoPointSlice A slice source) := by
  classical
  obtain ⟨first, second, hfirstSecond, hslice⟩ := Finset.card_eq_two.mp hcard
  have hsource' : source.1 = first ∨ source.1 = second := by
    simpa [hslice] using hsource
  rcases hsource' with hsourceFirst | hsourceSecond
  · let other : CarrierVertex A := ⟨second, hsliceA (by rw [hslice]; simp)⟩
    refine ⟨{
      other := other
      source_ne_other := ?_
      slice_eq := ?_ }⟩
    · intro heq
      exact hfirstSecond (hsourceFirst.symm.trans (congrArg Subtype.val heq))
    · simpa [other, hsourceFirst] using hslice
  · let other : CarrierVertex A := ⟨first, hsliceA (by rw [hslice]; simp)⟩
    refine ⟨{
      other := other
      source_ne_other := ?_
      slice_eq := ?_ }⟩
    · intro heq
      apply hfirstSecond
      calc
        first = other.1 := rfl
        _ = source.1 := (congrArg Subtype.val heq).symm
        _ = second := hsourceSecond
    · rw [hslice]
      ext x
      simp only [Finset.mem_insert, Finset.mem_singleton]
      rw [or_comm]
      simp [other, hsourceSecond]

/-- Source-clean local role packet for the card-six B1 normal-form branch.

The deleted sources are `d1` and `d2`; `u0` and `v0` are the original live
sources; `uPhysical.other` and `vPhysical.other` name `u1` and `v1`.  The
three embedded completion pairs name `c0,c1`, `uL,uR`, and `vL,vR` through
the projections below. -/
structure B1CardSixLocalRolePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)) where
  uPhysical :
    B1NamedTwoPointSlice D.A
      (((lateFirstApexSystem C.R).selectedAt
        C.u.1 C.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 C.rho) C.u
  vPhysical :
    B1NamedTwoPointSlice D.A
      (((lateFirstApexSystem C.R).selectedAt
        C.v.1 C.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 C.rho) C.v
  commonCompletion :
    B1RowCompletionPair D.A (b1CommonRow C)
      (SelectedClass D.A S.oppApex2 C.rho)
  uCompletion :
    B1RowCompletionPair D.A
      ((lateFirstApexSystem C.R).selectedAt
        C.u.1 C.u.2).toCriticalFourShell.support
      (SelectedClass D.A S.oppApex2 C.rho)
  vCompletion :
    B1RowCompletionPair D.A
      ((lateFirstApexSystem C.R).selectedAt
        C.v.1 C.v.2).toCriticalFourShell.support
      (SelectedClass D.A S.oppApex2 C.rho)

namespace B1CardSixLocalRolePacket

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
    (H := H) (F := F)}

/-- First deleted physical role. -/
def d1 (_ : B1CardSixLocalRolePacket C) : CarrierVertex D.A := C.first.deleted

/-- Second deleted physical role. -/
def d2 (_ : B1CardSixLocalRolePacket C) : CarrierVertex D.A := C.second.deleted

/-- Distinguished member of the first live physical slice. -/
def u0 (_ : B1CardSixLocalRolePacket C) : CarrierVertex D.A := C.u

/-- Other member of the first live physical slice. -/
def u1 (P : B1CardSixLocalRolePacket C) : CarrierVertex D.A := P.uPhysical.other

/-- Distinguished member of the second live physical slice. -/
def v0 (_ : B1CardSixLocalRolePacket C) : CarrierVertex D.A := C.v

/-- Other member of the second live physical slice. -/
def v1 (P : B1CardSixLocalRolePacket C) : CarrierVertex D.A := P.vPhysical.other

/-- Physical second-apex role. -/
def physicalApex (_ : B1CardSixLocalRolePacket C) : CarrierVertex D.A :=
  ⟨S.oppApex2, C.first.uPacket.center₂_mem_A⟩

/-- Common deleted-source blocker role. -/
noncomputable def Bc (_ : B1CardSixLocalRolePacket C) : CarrierVertex D.A :=
  ⟨b1CommonBlocker C,
    (Finset.mem_erase.mp
      ((lateFirstApexSystem C.R).selectedAt
        C.first.deleted.1 C.first.deleted.2).toCriticalFourShell.center_mem).2⟩

/-- First live-source blocker role. -/
noncomputable def Bu (_ : B1CardSixLocalRolePacket C) : CarrierVertex D.A :=
  ⟨(lateFirstApexSystem C.R).centerAt C.u.1 C.u.2,
    (Finset.mem_erase.mp
      ((lateFirstApexSystem C.R).selectedAt
        C.u.1 C.u.2).toCriticalFourShell.center_mem).2⟩

/-- Second live-source blocker role. -/
noncomputable def Bv (_ : B1CardSixLocalRolePacket C) : CarrierVertex D.A :=
  ⟨(lateFirstApexSystem C.R).centerAt C.v.1 C.v.2,
    (Finset.mem_erase.mp
      ((lateFirstApexSystem C.R).selectedAt
        C.v.1 C.v.2).toCriticalFourShell.center_mem).2⟩

/-- First common-row completion role. -/
def c0 (P : B1CardSixLocalRolePacket C) : CarrierVertex D.A :=
  P.commonCompletion.first

/-- Second common-row completion role. -/
def c1 (P : B1CardSixLocalRolePacket C) : CarrierVertex D.A :=
  P.commonCompletion.second

/-- First completion role for the `u` row. -/
def uL (P : B1CardSixLocalRolePacket C) : CarrierVertex D.A :=
  P.uCompletion.first

/-- Second completion role for the `u` row. -/
def uR (P : B1CardSixLocalRolePacket C) : CarrierVertex D.A :=
  P.uCompletion.second

/-- First completion role for the `v` row. -/
def vL (P : B1CardSixLocalRolePacket C) : CarrierVertex D.A :=
  P.vCompletion.first

/-- Second completion role for the `v` row. -/
def vR (P : B1CardSixLocalRolePacket C) : CarrierVertex D.A :=
  P.vCompletion.second

end B1CardSixLocalRolePacket

/-- The card-six B1 normal form supplies all sixteen local roles without any
ambient-cardinality assumption. -/
theorem nonempty_b1CardSixLocalRolePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6) :
    Nonempty (B1CardSixLocalRolePacket C) := by
  classical
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let uSlice :=
    ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support ∩ physicalClass
  let vSlice :=
    ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support ∩ physicalClass
  have hslices :=
    b1_live_slices_card_eq_two_disjoint_of_physicalClass_card_six
      C hnormal hsix
  have huMem : C.u.1 ∈ uSlice := by
    exact Finset.mem_inter.mpr ⟨
      ((lateFirstApexSystem C.R).selectedAt
        C.u.1 C.u.2).toCriticalFourShell.q_mem_support,
      C.huClass⟩
  have hvMem : C.v.1 ∈ vSlice := by
    exact Finset.mem_inter.mpr ⟨
      ((lateFirstApexSystem C.R).selectedAt
        C.v.1 C.v.2).toCriticalFourShell.q_mem_support,
      C.hvClass⟩
  have huSubset : uSlice ⊆ D.A := by
    intro x hx
    exact ((lateFirstApexSystem C.R).selectedAt
      C.u.1 C.u.2).toCriticalFourShell.support_subset_A
        (Finset.mem_inter.mp hx).1
  have hvSubset : vSlice ⊆ D.A := by
    intro x hx
    exact ((lateFirstApexSystem C.R).selectedAt
      C.v.1 C.v.2).toCriticalFourShell.support_subset_A
        (Finset.mem_inter.mp hx).1
  obtain ⟨uPhysical⟩ :=
    nonempty_b1NamedTwoPointSlice_of_card_eq_two
      huSubset huMem (by simpa [uSlice, vSlice, physicalClass] using hslices.1)
  obtain ⟨vPhysical⟩ :=
    nonempty_b1NamedTwoPointSlice_of_card_eq_two
      hvSubset hvMem (by simpa [uSlice, vSlice, physicalClass] using hslices.2.1)
  obtain ⟨commonCompletion⟩ := nonempty_b1CommonRowCompletionPair C
  obtain ⟨uCompletions, vCompletions⟩ :=
    nonempty_b1LiveRowCompletionPairs_of_physicalClass_card_six
      C hnormal hsix
  obtain ⟨uCompletion⟩ := uCompletions
  obtain ⟨vCompletion⟩ := vCompletions
  exact ⟨{
    uPhysical := uPhysical
    vPhysical := vPhysical
    commonCompletion := commonCompletion
    uCompletion := uCompletion
    vCompletion := vCompletion }⟩

namespace B1CardSixLocalRolePacket

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
    (H := H) (F := F)}

/-- Radius selected for each of the four named metric centers.  Other carrier
labels receive radius zero; no row choice below mentions them. -/
noncomputable def sourceRadius (P : B1CardSixLocalRolePacket C)
    (center : CarrierLabel D.A) : ℝ :=
  if center = P.physicalApex then C.rho
  else if center = P.Bc then dist P.Bc.1 P.d1.1
  else if center = P.Bu then dist P.Bu.1 P.u0.1
  else if center = P.Bv then dist P.Bv.1 P.v0.1
  else 0

/-- The four source metric rows, represented as full carrier spheres. -/
noncomputable def sourceMetricRows (P : B1CardSixLocalRolePacket C) :
    RowPattern (CarrierLabel D.A) :=
  fun center => D.A.attach.filter fun point ↦
    dist center.1 point.1 = P.sourceRadius center

@[simp] theorem mem_sourceMetricRows_iff
    (P : B1CardSixLocalRolePacket C) (center point : CarrierLabel D.A) :
    point ∈ P.sourceMetricRows center ↔
      dist center.1 point.1 = P.sourceRadius center := by
  simp [sourceMetricRows]

/-- The canonical carrier interpretation realizes the four source metric
rows.  This statement is independent of all role aliases. -/
theorem realizes_sourceMetricRows (P : B1CardSixLocalRolePacket C) :
    Realizes P.sourceMetricRows (pointOf (A := D.A)) := by
  refine ⟨?_, Subtype.val_injective⟩
  intro center first hfirst second hsecond
  exact ((mem_sourceMetricRows_iff P center first).mp hfirst).trans
    ((mem_sourceMetricRows_iff P center second).mp hsecond).symm

/-- The physical-radius source row choice. -/
noncomputable def physicalRowChoice (P : B1CardSixLocalRolePacket C) :
    RowChoice (CarrierLabel D.A) :=
  { center := P.physicalApex
    support := {P.d1, P.d2, P.u0, P.u1, P.v0, P.v1} }

/-- The common-blocker exact-four source row choice. -/
noncomputable def commonRowChoice (P : B1CardSixLocalRolePacket C) :
    RowChoice (CarrierLabel D.A) :=
  { center := P.Bc
    support := {P.d1, P.d2, P.c0, P.c1} }

/-- The first live-blocker exact-four source row choice. -/
noncomputable def uRowChoice (P : B1CardSixLocalRolePacket C) :
    RowChoice (CarrierLabel D.A) :=
  { center := P.Bu
    support := {P.u0, P.u1, P.uL, P.uR} }

/-- The second live-blocker exact-four source row choice. -/
noncomputable def vRowChoice (P : B1CardSixLocalRolePacket C) :
    RowChoice (CarrierLabel D.A) :=
  { center := P.Bv
    support := {P.v0, P.v1, P.vL, P.vR} }

/-- Positive row choices exported to the cardinality-generic nogood checker. -/
noncomputable def sourceRowChoices (P : B1CardSixLocalRolePacket C) :
    List (RowChoice (CarrierLabel D.A)) :=
  [P.physicalRowChoice, P.commonRowChoice, P.uRowChoice, P.vRowChoice]

private theorem Bc_ne_physicalApex (P : B1CardSixLocalRolePacket C) :
    P.Bc ≠ P.physicalApex := by
  intro h
  exact C.first.uPacket.actual_blocker_ne_center₂
    (congrArg Subtype.val h)

private theorem Bu_ne_physicalApex (P : B1CardSixLocalRolePacket C) :
    P.Bu ≠ P.physicalApex := by
  intro h
  exact C.first.uPacket.centers_ne (congrArg Subtype.val h)

private theorem Bu_ne_Bc (P : B1CardSixLocalRolePacket C) : P.Bu ≠ P.Bc := by
  intro h
  exact C.first.uPacket.actual_blocker_ne_center₁
    (congrArg Subtype.val h).symm

private theorem Bv_ne_physicalApex (P : B1CardSixLocalRolePacket C) :
    P.Bv ≠ P.physicalApex := by
  intro h
  exact C.first.vPacket.centers_ne (congrArg Subtype.val h)

private theorem Bv_ne_Bc (P : B1CardSixLocalRolePacket C) : P.Bv ≠ P.Bc := by
  intro h
  exact C.first.vPacket.actual_blocker_ne_center₁
    (congrArg Subtype.val h).symm

private theorem Bv_ne_Bu (P : B1CardSixLocalRolePacket C) : P.Bv ≠ P.Bu := by
  intro h
  exact C.first.blockers_ne (congrArg Subtype.val h).symm

private theorem physical_support_subset_sourceMetricRows
    (P : B1CardSixLocalRolePacket C) :
    P.physicalRowChoice.support ⊆ P.sourceMetricRows P.physicalApex := by
  intro point hpoint
  have hpointCases :
      point = P.d1 ∨ point = P.d2 ∨ point = P.u0 ∨
        point = P.u1 ∨ point = P.v0 ∨ point = P.v1 := by
    simpa [physicalRowChoice] using hpoint
  have hu1Class : P.u1.1 ∈ SelectedClass D.A S.oppApex2 C.rho := by
    have hu1Slice : P.u1.1 ∈
        ((lateFirstApexSystem C.R).selectedAt
          C.u.1 C.u.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 C.rho := by
      rw [P.uPhysical.slice_eq]
      simp [u1]
    exact (Finset.mem_inter.mp hu1Slice).2
  have hv1Class : P.v1.1 ∈ SelectedClass D.A S.oppApex2 C.rho := by
    have hv1Slice : P.v1.1 ∈
        ((lateFirstApexSystem C.R).selectedAt
          C.v.1 C.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 C.rho := by
      rw [P.vPhysical.slice_eq]
      simp [v1]
    exact (Finset.mem_inter.mp hv1Slice).2
  apply (mem_sourceMetricRows_iff P P.physicalApex point).mpr
  simp only [sourceRadius, if_pos]
  rcases hpointCases with rfl | rfl | rfl | rfl | rfl | rfl
  · exact (mem_selectedClass.mp C.first.deleted_mem_class).2
  · exact (mem_selectedClass.mp C.second.deleted_mem_class).2
  · exact (mem_selectedClass.mp C.huClass).2
  · exact (mem_selectedClass.mp hu1Class).2
  · exact (mem_selectedClass.mp C.hvClass).2
  · exact (mem_selectedClass.mp hv1Class).2

private theorem common_support_subset_sourceMetricRows
    (P : B1CardSixLocalRolePacket C) :
    P.commonRowChoice.support ⊆ P.sourceMetricRows P.Bc := by
  intro point hpoint
  have hpointCases :
      point = P.d1 ∨ point = P.d2 ∨ point = P.c0 ∨ point = P.c1 := by
    simpa [commonRowChoice] using hpoint
  let K := ((lateFirstApexSystem C.R).selectedAt
    C.first.deleted.1 C.first.deleted.2).toCriticalFourShell
  have hnormal :=
    b1_live_normalForm C.R C.hcard C.surface C.rho C.hrho C.hfive
      C.u C.v C.huNeV C.huClass C.hvClass C.hvOmitted C.huOmitted
      C.first C.second C.hdeletedNe C.hblockersEq
  have hd1 : P.d1.1 ∈ K.support := by
    exact K.q_mem_support
  have hd2 : P.d2.1 ∈ K.support := by
    simpa [K, d2, b1CommonRow] using hnormal.2.2.1
  have hc0 : P.c0.1 ∈ K.support := by
    have hdiff : P.c0.1 ∈
        b1CommonRow C \ SelectedClass D.A S.oppApex2 C.rho := by
      rw [P.commonCompletion.complement_eq]
      simp [c0]
    exact (Finset.mem_sdiff.mp hdiff).1
  have hc1 : P.c1.1 ∈ K.support := by
    have hdiff : P.c1.1 ∈
        b1CommonRow C \ SelectedClass D.A S.oppApex2 C.rho := by
      rw [P.commonCompletion.complement_eq]
      simp [c1]
    exact (Finset.mem_sdiff.mp hdiff).1
  apply (mem_sourceMetricRows_iff P P.Bc point).mpr
  simp only [sourceRadius, if_neg (Bc_ne_physicalApex P), if_pos]
  rcases hpointCases with rfl | rfl | rfl | rfl
  all_goals
    exact (K.support_eq_radius _ (by assumption)).trans
      (K.support_eq_radius _ hd1).symm

private theorem u_support_subset_sourceMetricRows
    (P : B1CardSixLocalRolePacket C) :
    P.uRowChoice.support ⊆ P.sourceMetricRows P.Bu := by
  intro point hpoint
  have hpointCases :
      point = P.u0 ∨ point = P.u1 ∨ point = P.uL ∨ point = P.uR := by
    simpa [uRowChoice] using hpoint
  let K := ((lateFirstApexSystem C.R).selectedAt
    C.u.1 C.u.2).toCriticalFourShell
  have hu0 : P.u0.1 ∈ K.support := K.q_mem_support
  have hu1 : P.u1.1 ∈ K.support := by
    have hs : P.u1.1 ∈ K.support ∩ SelectedClass D.A S.oppApex2 C.rho := by
      rw [P.uPhysical.slice_eq]
      simp [u1]
    exact (Finset.mem_inter.mp hs).1
  have huL : P.uL.1 ∈ K.support := by
    have hdiff : P.uL.1 ∈ K.support \ SelectedClass D.A S.oppApex2 C.rho := by
      rw [P.uCompletion.complement_eq]
      simp [uL]
    exact (Finset.mem_sdiff.mp hdiff).1
  have huR : P.uR.1 ∈ K.support := by
    have hdiff : P.uR.1 ∈ K.support \ SelectedClass D.A S.oppApex2 C.rho := by
      rw [P.uCompletion.complement_eq]
      simp [uR]
    exact (Finset.mem_sdiff.mp hdiff).1
  apply (mem_sourceMetricRows_iff P P.Bu point).mpr
  simp only [sourceRadius, if_neg (Bu_ne_physicalApex P), if_neg (Bu_ne_Bc P), if_pos]
  rcases hpointCases with rfl | rfl | rfl | rfl
  all_goals
    exact (K.support_eq_radius _ (by assumption)).trans
      (K.support_eq_radius _ hu0).symm

private theorem v_support_subset_sourceMetricRows
    (P : B1CardSixLocalRolePacket C) :
    P.vRowChoice.support ⊆ P.sourceMetricRows P.Bv := by
  intro point hpoint
  have hpointCases :
      point = P.v0 ∨ point = P.v1 ∨ point = P.vL ∨ point = P.vR := by
    simpa [vRowChoice] using hpoint
  let K := ((lateFirstApexSystem C.R).selectedAt
    C.v.1 C.v.2).toCriticalFourShell
  have hv0 : P.v0.1 ∈ K.support := K.q_mem_support
  have hv1 : P.v1.1 ∈ K.support := by
    have hs : P.v1.1 ∈ K.support ∩ SelectedClass D.A S.oppApex2 C.rho := by
      rw [P.vPhysical.slice_eq]
      simp [v1]
    exact (Finset.mem_inter.mp hs).1
  have hvL : P.vL.1 ∈ K.support := by
    have hdiff : P.vL.1 ∈ K.support \ SelectedClass D.A S.oppApex2 C.rho := by
      rw [P.vCompletion.complement_eq]
      simp [vL]
    exact (Finset.mem_sdiff.mp hdiff).1
  have hvR : P.vR.1 ∈ K.support := by
    have hdiff : P.vR.1 ∈ K.support \ SelectedClass D.A S.oppApex2 C.rho := by
      rw [P.vCompletion.complement_eq]
      simp [vR]
    exact (Finset.mem_sdiff.mp hdiff).1
  apply (mem_sourceMetricRows_iff P P.Bv point).mpr
  simp only [sourceRadius, if_neg (Bv_ne_physicalApex P), if_neg (Bv_ne_Bc P),
    if_neg (Bv_ne_Bu P), if_pos]
  rcases hpointCases with rfl | rfl | rfl | rfl
  all_goals
    exact (K.support_eq_radius _ (by assumption)).trans
      (K.support_eq_radius _ hv0).symm

/-- All four named source rows are available as positive row choices for the
generic row-nogood certificate interface. -/
theorem positiveRowsMatch_sourceRowChoices
    (P : B1CardSixLocalRolePacket C) :
    PositiveRowsMatch P.sourceMetricRows P.sourceRowChoices := by
  intro choice hchoice
  simp only [sourceRowChoices, List.mem_cons, List.not_mem_nil, or_false] at hchoice
  rcases hchoice with rfl | rfl | rfl | rfl
  · exact physical_support_subset_sourceMetricRows P
  · exact common_support_subset_sourceMetricRows P
  · exact u_support_subset_sourceMetricRows P
  · exact v_support_subset_sourceMetricRows P

/-- A checked duplicate-center record over the four exported source rows
contradicts their canonical planar realization.  This theorem validates one
record only; it does not assert coverage by any finite record collection. -/
theorem false_of_duplicateCenterData_of_check
    (P : B1CardSixLocalRolePacket C)
    (data : DuplicateCenterData (CarrierLabel D.A))
    (hcheck : data.check P.sourceRowChoices = true) : False := by
  rcases nonempty_duplicateCenterCore_of_positiveCheck
      (positiveRowsMatch_sourceRowChoices P) data hcheck with ⟨core⟩
  exact Census554.EqualityCore.not_realizes_of_duplicateCenterCore core
    ⟨pointOf (A := D.A), realizes_sourceMetricRows P⟩

/-- No duplicate-center metric core can exist in the realized source metric
row pattern. -/
theorem not_nonempty_duplicateCenterCore_sourceMetricRows
    (P : B1CardSixLocalRolePacket C) :
    ¬ Nonempty (DuplicateCenterCore P.sourceMetricRows) := by
  rintro ⟨core⟩
  exact Census554.EqualityCore.not_realizes_of_duplicateCenterCore core
    ⟨pointOf (A := D.A), realizes_sourceMetricRows P⟩

end B1CardSixLocalRolePacket

end ATailFrontierLiveClosure
end Problem97
