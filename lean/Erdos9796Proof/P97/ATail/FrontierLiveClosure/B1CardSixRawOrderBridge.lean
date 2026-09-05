/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardSixPointConfigurationIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1LiveSharedPairNonalternationIngress

/-!
# B1 card-six raw-order bridge

This module keeps the seven role indices in the ambient boundary order.  The
finite chart is the boundary function obtained by evaluating the ambient
boundary at the sorted image of those indices; no fresh projected boundary
indexing is introduced.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace B1CardSixRawOrderBridge

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open B1CardSixBoundaryRoleIngress
open B1CardSixLocalRolePacket
open B1CardSixPointConfigurationIngress
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
    (H := H) (F := F)}

/-- The seven roles used by the two live pairs and their common apex. -/
inductive RawCardSixRole : Type
  | apex | uBlocker | vBlocker | u0 | u1 | v0 | v1
  deriving DecidableEq, Fintype

def rawRoleUniverse : Finset RawCardSixRole := Finset.univ

noncomputable def rawRoleValue
    (P : B1CardSixLocalRolePacket C) :
    RawCardSixRole → CarrierVertex D.A
  | .apex => B1CardSixRole.value P .physicalApex
  | .uBlocker => B1CardSixRole.value P .Bu
  | .vBlocker => B1CardSixRole.value P .Bv
  | .u0 => B1CardSixRole.value P .u0
  | .u1 => B1CardSixRole.value P .u1
  | .v0 => B1CardSixRole.value P .v0
  | .v1 => B1CardSixRole.value P .v1

noncomputable def rawRoleCarrier
    (P : B1CardSixLocalRolePacket C) : Finset ℝ² :=
  rawRoleUniverse.image (fun role => (rawRoleValue P role).1)

theorem rawRoleCarrier_mem
    (P : B1CardSixLocalRolePacket C) (role : RawCardSixRole) :
    (rawRoleValue P role).1 ∈ rawRoleCarrier P := by
  exact Finset.mem_image.mpr ⟨role, Finset.mem_univ _, rfl⟩

theorem rawRoleCarrier_subset_A
    (P : B1CardSixLocalRolePacket C) :
    rawRoleCarrier P ⊆ D.A := by
  intro point hpoint
  rcases Finset.mem_image.mp hpoint with ⟨role, _hrole, hvalue⟩
  rw [← hvalue]
  exact (rawRoleValue P role).2

noncomputable def rawRoleLabel
    (P : B1CardSixLocalRolePacket C) (role : RawCardSixRole) :
    CarrierLabel (rawRoleCarrier P) :=
  ⟨(rawRoleValue P role).1, rawRoleCarrier_mem P role⟩

noncomputable def ambientRoleLabel
    (P : B1CardSixLocalRolePacket C) :
    CarrierLabel (rawRoleCarrier P) → CarrierLabel D.A :=
  fun label => ⟨label.1, rawRoleCarrier_subset_A P label.2⟩

noncomputable def ambientRoleIndices
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    Finset (Fin B.n) :=
  (rawRoleCarrier P).attach.image
    (fun label => B.indexOf (ambientRoleLabel P label))

private theorem ambientRoleIndex_injective
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    Function.Injective
      (fun label : CarrierLabel (rawRoleCarrier P) =>
        B.indexOf (ambientRoleLabel P label)) := by
  intro x y hxy
  apply Subtype.ext
  calc
    x.1 = B.boundary (B.indexOf (ambientRoleLabel P x)) := by
      simpa [ambientRoleLabel, pointOf] using
        (B.point_eq (ambientRoleLabel P x)).symm
    _ = B.boundary (B.indexOf (ambientRoleLabel P y)) :=
      congrArg B.boundary hxy
    _ = y.1 := by
      simpa [ambientRoleLabel, pointOf] using
        B.point_eq (ambientRoleLabel P y)

theorem ambientRoleIndices_card
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    (ambientRoleIndices P B).card = (rawRoleCarrier P).card := by
  calc
    (ambientRoleIndices P B).card =
        (rawRoleCarrier P).attach.card := by
      unfold ambientRoleIndices
      exact Finset.card_image_of_injective _
        (ambientRoleIndex_injective P B)
    _ = (rawRoleCarrier P).card := Finset.card_attach

noncomputable def orderedRoleEmbedding
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    Fin (rawRoleCarrier P).card ↪o Fin B.n :=
  (ambientRoleIndices P B).orderEmbOfFin (ambientRoleIndices_card P B)

theorem orderedRoleEmbedding_image
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    Finset.univ.image (orderedRoleEmbedding P B) =
      ambientRoleIndices P B := by
  simpa [orderedRoleEmbedding] using
    (Finset.image_orderEmbOfFin_univ
      (ambientRoleIndices P B) (ambientRoleIndices_card P B))

theorem ambientRoleIndex_mem
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A)
    (label : CarrierLabel (rawRoleCarrier P)) :
    B.indexOf (ambientRoleLabel P label) ∈ ambientRoleIndices P B := by
  exact Finset.mem_image.mpr ⟨label,
    Finset.mem_attach (rawRoleCarrier P) label, rfl⟩

noncomputable def orderedRoleIndex
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A)
    (label : CarrierLabel (rawRoleCarrier P)) :
    Fin (rawRoleCarrier P).card :=
  (Finset.orderIsoOfFin
      (ambientRoleIndices P B)
      (ambientRoleIndices_card P B)).symm
    ⟨B.indexOf (ambientRoleLabel P label),
      ambientRoleIndex_mem P B label⟩

theorem orderedRoleEmbedding_orderedRoleIndex
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A)
    (label : CarrierLabel (rawRoleCarrier P)) :
    orderedRoleEmbedding P B (orderedRoleIndex P B label) =
      B.indexOf (ambientRoleLabel P label) := by
  have h := Finset.coe_orderIsoOfFin_apply
    (ambientRoleIndices P B) (ambientRoleIndices_card P B)
    (orderedRoleIndex P B label)
  simpa [orderedRoleEmbedding, orderedRoleIndex] using h.symm

noncomputable def rawRoleIndex
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A)
    (role : RawCardSixRole) : Fin (rawRoleCarrier P).card :=
  orderedRoleIndex P B (rawRoleLabel P role)

theorem orderedRoleEmbedding_rawRoleIndex
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A)
    (role : RawCardSixRole) :
    orderedRoleEmbedding P B (rawRoleIndex P B role) =
      B.indexOf (ambientRoleLabel P (rawRoleLabel P role)) := by
  exact orderedRoleEmbedding_orderedRoleIndex P B (rawRoleLabel P role)

noncomputable def orderedRoleBoundary
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    Fin (rawRoleCarrier P).card → ℝ² :=
  fun i => B.boundary (orderedRoleEmbedding P B i)

theorem orderedRoleBoundary_at_rawRoleIndex
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A)
    (role : RawCardSixRole) :
    orderedRoleBoundary P B (rawRoleIndex P B role) =
      (rawRoleValue P role).1 := by
  rw [orderedRoleBoundary, orderedRoleEmbedding_rawRoleIndex]
  simpa [ambientRoleLabel, rawRoleLabel, pointOf] using
    B.point_eq (ambientRoleLabel P (rawRoleLabel P role))

theorem raw_btw_iff_ambient
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A)
    (i j k : Fin (rawRoleCarrier P).card) :
    SurplusCOMPGBank.btw
        (orderedRoleEmbedding P B i)
        (orderedRoleEmbedding P B j)
        (orderedRoleEmbedding P B k) ↔
      SurplusCOMPGBank.btw i j k := by
  unfold SurplusCOMPGBank.btw
  simp only [(orderedRoleEmbedding P B).lt_iff_lt]

def RawCardSixBad {n : ℕ}
    (apex uBlocker vBlocker u0 u1 v0 v1 : Fin n) : Prop :=
  ¬ ((SurplusCOMPGBank.btw apex uBlocker u0 ↔
        SurplusCOMPGBank.btw apex uBlocker u1) ∧
      (SurplusCOMPGBank.btw apex vBlocker v0 ↔
        SurplusCOMPGBank.btw apex vBlocker v1))

theorem rawCardSixBad_iff_ambient
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A)
    (apex uBlocker vBlocker u0 u1 v0 v1 : Fin (rawRoleCarrier P).card) :
    RawCardSixBad apex uBlocker vBlocker u0 u1 v0 v1 ↔
      ¬ ((SurplusCOMPGBank.btw
            (orderedRoleEmbedding P B apex)
            (orderedRoleEmbedding P B uBlocker)
            (orderedRoleEmbedding P B u0) ↔
          SurplusCOMPGBank.btw
            (orderedRoleEmbedding P B apex)
            (orderedRoleEmbedding P B uBlocker)
            (orderedRoleEmbedding P B u1)) ∧
        (SurplusCOMPGBank.btw
            (orderedRoleEmbedding P B apex)
            (orderedRoleEmbedding P B vBlocker)
            (orderedRoleEmbedding P B v0) ↔
          SurplusCOMPGBank.btw
            (orderedRoleEmbedding P B apex)
            (orderedRoleEmbedding P B vBlocker)
            (orderedRoleEmbedding P B v1))) := by
  simp only [RawCardSixBad, raw_btw_iff_ambient]

def rawCardSixGood
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) : Prop :=
  (SurplusCOMPGBank.btw
      (rawRoleIndex P B .apex)
      (rawRoleIndex P B .uBlocker)
      (rawRoleIndex P B .u0) ↔
    SurplusCOMPGBank.btw
      (rawRoleIndex P B .apex)
      (rawRoleIndex P B .uBlocker)
      (rawRoleIndex P B .u1)) ∧
  (SurplusCOMPGBank.btw
      (rawRoleIndex P B .apex)
      (rawRoleIndex P B .vBlocker)
      (rawRoleIndex P B .v0) ↔
    SurplusCOMPGBank.btw
      (rawRoleIndex P B .apex)
      (rawRoleIndex P B .vBlocker)
      (rawRoleIndex P B .v1))

theorem b1LiveSlicesSameBoundaryArc_of_rawCardSixGood
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A)
    (hgood : rawCardSixGood P B) :
    B1LiveSlicesSameBoundaryArc C := by
  classical
  rcases hgood with ⟨hgoodU, hgoodV⟩
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let Hlate := lateFirstApexSystem C.R
  let uSlice :=
    (Hlate.selectedAt C.u.1 C.u.2).toCriticalFourShell.support ∩
      physicalClass
  let vSlice :=
    (Hlate.selectedAt C.v.1 C.v.2).toCriticalFourShell.support ∩
      physicalClass
  have hUSlice : uSlice = {C.u.1, P.uPhysical.other.1} := by
    simpa [uSlice, physicalClass] using P.uPhysical.slice_eq
  have hVSlice : vSlice = {C.v.1, P.vPhysical.other.1} := by
    simpa [vSlice, physicalClass] using P.vPhysical.slice_eq
  have hindex : ∀ (role : RawCardSixRole) (ix : Fin B.n),
      B.boundary ix = (rawRoleValue P role).1 →
        ix = B.indexOf (ambientRoleLabel P (rawRoleLabel P role)) := by
    intro role ix hpoint
    apply B.boundary_injective
    calc
      B.boundary ix = (rawRoleValue P role).1 := hpoint
      _ = B.boundary
          (B.indexOf (ambientRoleLabel P (rawRoleLabel P role))) := by
        simpa [ambientRoleLabel, rawRoleLabel, pointOf] using
          (B.point_eq (ambientRoleLabel P (rawRoleLabel P role))).symm
  have hUarc :
      B1SliceSameBoundaryArc B
        (ambientRoleLabel P (rawRoleLabel P .apex))
        (ambientRoleLabel P (rawRoleLabel P .uBlocker)) uSlice := by
    intro ix iy hix hiy hne
    have hix' : B.boundary ix = C.u.1 ∨
        B.boundary ix = P.uPhysical.other.1 := by
      rw [hUSlice] at hix
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hix
    have hiy' : B.boundary iy = C.u.1 ∨
        B.boundary iy = P.uPhysical.other.1 := by
      rw [hUSlice] at hiy
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hiy
    rcases hix' with hix' | hix'
    · have hixIndex := hindex .u0 ix (by
        simpa [rawRoleValue, B1CardSixRole.value,
          B1CardSixLocalRolePacket.u0] using hix')
      rcases hiy' with hiy' | hiy'
      · have hiyIndex := hindex .u0 iy (by
          simpa [rawRoleValue, B1CardSixRole.value,
            B1CardSixLocalRolePacket.u0] using hiy')
        exfalso
        exact hne (hixIndex.trans hiyIndex.symm)
      · have hiyIndex := hindex .u1 iy (by
          simpa [rawRoleValue, B1CardSixRole.value,
            B1CardSixLocalRolePacket.u1] using hiy')
        have hraw := raw_btw_iff_ambient P B
          (rawRoleIndex P B .apex) (rawRoleIndex P B .uBlocker)
          (rawRoleIndex P B .u0)
        rw [orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex] at hraw
        have hraw' :
            SurplusCOMPGBank.btw
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .apex)))
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .uBlocker))) ix ↔
              SurplusCOMPGBank.btw
                (rawRoleIndex P B .apex)
                (rawRoleIndex P B .uBlocker)
                (rawRoleIndex P B .u0) := by
          rw [hixIndex]
          simpa using hraw
        have hraw1 := raw_btw_iff_ambient P B
          (rawRoleIndex P B .apex) (rawRoleIndex P B .uBlocker)
          (rawRoleIndex P B .u1)
        rw [orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex] at hraw1
        have hraw1' :
            SurplusCOMPGBank.btw
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .apex)))
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .uBlocker))) iy ↔
              SurplusCOMPGBank.btw
                (rawRoleIndex P B .apex)
                (rawRoleIndex P B .uBlocker)
                (rawRoleIndex P B .u1) := by
          rw [hiyIndex]
          simpa using hraw1
        exact hraw'.trans hgoodU |>.trans hraw1'.symm
    · have hixIndex := hindex .u1 ix (by
        simpa [rawRoleValue, B1CardSixRole.value,
          B1CardSixLocalRolePacket.u1] using hix')
      rcases hiy' with hiy' | hiy'
      · have hiyIndex := hindex .u0 iy (by
          simpa [rawRoleValue, B1CardSixRole.value,
            B1CardSixLocalRolePacket.u0] using hiy')
        have hraw := raw_btw_iff_ambient P B
          (rawRoleIndex P B .apex) (rawRoleIndex P B .uBlocker)
          (rawRoleIndex P B .u1)
        rw [orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex] at hraw
        have hraw' :
            SurplusCOMPGBank.btw
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .apex)))
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .uBlocker))) ix ↔
              SurplusCOMPGBank.btw
                (rawRoleIndex P B .apex)
                (rawRoleIndex P B .uBlocker)
                (rawRoleIndex P B .u1) := by
          rw [hixIndex]
          simpa using hraw
        have hraw0 := raw_btw_iff_ambient P B
          (rawRoleIndex P B .apex) (rawRoleIndex P B .uBlocker)
          (rawRoleIndex P B .u0)
        rw [orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex] at hraw0
        have hraw0' :
            SurplusCOMPGBank.btw
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .apex)))
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .uBlocker))) iy ↔
              SurplusCOMPGBank.btw
                (rawRoleIndex P B .apex)
                (rawRoleIndex P B .uBlocker)
                (rawRoleIndex P B .u0) := by
          rw [hiyIndex]
          simpa using hraw0
        exact hraw'.trans hgoodU.symm |>.trans hraw0'.symm
      · have hiyIndex := hindex .u1 iy (by
          simpa [rawRoleValue, B1CardSixRole.value,
            B1CardSixLocalRolePacket.u1] using hiy')
        exfalso
        exact hne (hixIndex.trans hiyIndex.symm)
  have hVarc :
      B1SliceSameBoundaryArc B
        (ambientRoleLabel P (rawRoleLabel P .apex))
        (ambientRoleLabel P (rawRoleLabel P .vBlocker)) vSlice := by
    intro ix iy hix hiy hne
    have hix' : B.boundary ix = C.v.1 ∨
        B.boundary ix = P.vPhysical.other.1 := by
      rw [hVSlice] at hix
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hix
    have hiy' : B.boundary iy = C.v.1 ∨
        B.boundary iy = P.vPhysical.other.1 := by
      rw [hVSlice] at hiy
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hiy
    rcases hix' with hix' | hix'
    · have hixIndex := hindex .v0 ix (by
        simpa [rawRoleValue, B1CardSixRole.value,
          B1CardSixLocalRolePacket.v0] using hix')
      rcases hiy' with hiy' | hiy'
      · have hiyIndex := hindex .v0 iy (by
          simpa [rawRoleValue, B1CardSixRole.value,
            B1CardSixLocalRolePacket.v0] using hiy')
        exfalso
        exact hne (hixIndex.trans hiyIndex.symm)
      · have hiyIndex := hindex .v1 iy (by
          simpa [rawRoleValue, B1CardSixRole.value,
            B1CardSixLocalRolePacket.v1] using hiy')
        have hraw := raw_btw_iff_ambient P B
          (rawRoleIndex P B .apex) (rawRoleIndex P B .vBlocker)
          (rawRoleIndex P B .v0)
        rw [orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex] at hraw
        have hraw' :
            SurplusCOMPGBank.btw
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .apex)))
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .vBlocker))) ix ↔
              SurplusCOMPGBank.btw
                (rawRoleIndex P B .apex)
                (rawRoleIndex P B .vBlocker)
                (rawRoleIndex P B .v0) := by
          rw [hixIndex]
          simpa using hraw
        have hraw1 := raw_btw_iff_ambient P B
          (rawRoleIndex P B .apex) (rawRoleIndex P B .vBlocker)
          (rawRoleIndex P B .v1)
        rw [orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex] at hraw1
        have hraw1' :
            SurplusCOMPGBank.btw
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .apex)))
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .vBlocker))) iy ↔
              SurplusCOMPGBank.btw
                (rawRoleIndex P B .apex)
                (rawRoleIndex P B .vBlocker)
                (rawRoleIndex P B .v1) := by
          rw [hiyIndex]
          simpa using hraw1
        exact hraw'.trans hgoodV |>.trans hraw1'.symm
    · have hixIndex := hindex .v1 ix (by
        simpa [rawRoleValue, B1CardSixRole.value,
          B1CardSixLocalRolePacket.v1] using hix')
      rcases hiy' with hiy' | hiy'
      · have hiyIndex := hindex .v0 iy (by
          simpa [rawRoleValue, B1CardSixRole.value,
            B1CardSixLocalRolePacket.v0] using hiy')
        have hraw := raw_btw_iff_ambient P B
          (rawRoleIndex P B .apex) (rawRoleIndex P B .vBlocker)
          (rawRoleIndex P B .v1)
        rw [orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex] at hraw
        have hraw' :
            SurplusCOMPGBank.btw
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .apex)))
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .vBlocker))) ix ↔
              SurplusCOMPGBank.btw
                (rawRoleIndex P B .apex)
                (rawRoleIndex P B .vBlocker)
                (rawRoleIndex P B .v1) := by
          rw [hixIndex]
          simpa using hraw
        have hraw0 := raw_btw_iff_ambient P B
          (rawRoleIndex P B .apex) (rawRoleIndex P B .vBlocker)
          (rawRoleIndex P B .v0)
        rw [orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex,
          orderedRoleEmbedding_rawRoleIndex] at hraw0
        have hraw0' :
            SurplusCOMPGBank.btw
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .apex)))
                (B.indexOf (ambientRoleLabel P (rawRoleLabel P .vBlocker))) iy ↔
              SurplusCOMPGBank.btw
                (rawRoleIndex P B .apex)
                (rawRoleIndex P B .vBlocker)
                (rawRoleIndex P B .v0) := by
          rw [hiyIndex]
          simpa using hraw0
        exact hraw'.trans hgoodV.symm |>.trans hraw0'.symm
      · have hiyIndex := hindex .v1 iy (by
          simpa [rawRoleValue, B1CardSixRole.value,
            B1CardSixLocalRolePacket.v1] using hiy')
        exfalso
        exact hne (hixIndex.trans hiyIndex.symm)
  have hapex :
      ambientRoleLabel P (rawRoleLabel P .apex) =
        (⟨S.oppApex2, b1_oppApex2_mem_A S⟩ : CarrierLabel D.A) := by
    apply Subtype.ext
    rfl
  have hBu :
      ambientRoleLabel P (rawRoleLabel P .uBlocker) =
        blockerLabel Hlate C.u.1 C.u.2 := by
    apply Subtype.ext
    rfl
  have hBv :
      ambientRoleLabel P (rawRoleLabel P .vBlocker) =
        blockerLabel Hlate C.v.1 C.v.2 := by
    apply Subtype.ext
    rfl
  refine ⟨B, ?_⟩
  change
    (uSlice.card = 2 →
      B1SliceSameBoundaryArc B
        (⟨S.oppApex2, b1_oppApex2_mem_A S⟩ : CarrierLabel D.A)
        (blockerLabel Hlate C.u.1 C.u.2) uSlice) ∧
    (vSlice.card = 2 →
      B1SliceSameBoundaryArc B
        (⟨S.oppApex2, b1_oppApex2_mem_A S⟩ : CarrierLabel D.A)
        (blockerLabel Hlate C.v.1 C.v.2) vSlice)
  constructor
  · intro _
    rw [← hapex, ← hBu]
    exact hUarc
  · intro _
    rw [← hapex, ← hBv]
    exact hVarc

theorem rawCardSixBad_of_b1PhysicalClassFiveSixNormalForm
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A)
    (hnormal : B1PhysicalClassFiveSixNormalForm C) :
    RawCardSixBad
      (rawRoleIndex P B .apex)
      (rawRoleIndex P B .uBlocker)
      (rawRoleIndex P B .vBlocker)
      (rawRoleIndex P B .u0)
      (rawRoleIndex P B .u1)
      (rawRoleIndex P B .v0)
      (rawRoleIndex P B .v1) := by
  intro hgood
  apply false_of_b1PhysicalClassFiveSixNormalForm_of_liveSlicesSameBoundaryArc
    C hnormal
  exact b1LiveSlicesSameBoundaryArc_of_rawCardSixGood P B hgood

end B1CardSixRawOrderBridge
end ATailFrontierLiveClosure
end Problem97
