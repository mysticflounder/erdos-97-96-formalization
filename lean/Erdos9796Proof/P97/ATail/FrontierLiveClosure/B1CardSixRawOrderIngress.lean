/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardSixPointConfigurationIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1LiveSharedPairNonalternationIngress

/-!
# B1 card-six raw boundary order ingress

This module carries the finite raw order of the named card-six roles into one
ambient `BoundaryIndexing`.  The role carrier keeps aliases as one point, so
its sorted index domain is allowed to have fewer than sixteen elements.  The
raw-good predicate is the exact two-pair order statement consumed by the
source-level live-slice contradiction.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace B1CardSixRawOrderIngress

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailCriticalSystemRebase
open ATailExactFourPhysicalConsumer
open ATailUniqueFourLateChoiceTerminalScratch
open B1CardSixPointConfigurationIngress
open Census554.GeneralCarrierBridge
open GenericRowNogoodCertificate

attribute [local instance] Classical.propDecidable

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
    (H := H) (F := F)}

/-- The carrier of the sixteen named roles, with aliases collapsed. -/
noncomputable def roleCarrier (P : B1CardSixLocalRolePacket C) : Finset ℝ² :=
  {(B1CardSixRole.value P .physicalApex).1,
    (B1CardSixRole.value P .d1).1,
    (B1CardSixRole.value P .d2).1,
    (B1CardSixRole.value P .u0).1,
    (B1CardSixRole.value P .u1).1,
    (B1CardSixRole.value P .v0).1,
    (B1CardSixRole.value P .v1).1,
    (B1CardSixRole.value P .Bc).1,
    (B1CardSixRole.value P .Bu).1,
    (B1CardSixRole.value P .Bv).1,
    (B1CardSixRole.value P .c0).1,
    (B1CardSixRole.value P .c1).1,
    (B1CardSixRole.value P .uL).1,
    (B1CardSixRole.value P .uR).1,
    (B1CardSixRole.value P .vL).1,
    (B1CardSixRole.value P .vR).1}

theorem roleCarrier_subset (P : B1CardSixLocalRolePacket C) :
    roleCarrier P ⊆ D.A := by
  intro x hx
  simp only [roleCarrier, Finset.mem_insert, Finset.mem_singleton] at hx
  rcases hx with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  all_goals subst x
  all_goals exact (B1CardSixRole.value P _).2

/-- A role label in the finite role carrier. -/
noncomputable def roleLabel
    (P : B1CardSixLocalRolePacket C) (role : B1CardSixRole) :
    CarrierLabel (roleCarrier P) :=
  ⟨(B1CardSixRole.value P role).1, by
    cases role
    · exact Finset.mem_insert_self _ _
    · exact Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem
            (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _))))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem
            (Finset.mem_insert_of_mem
              (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)))))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem
            (Finset.mem_insert_of_mem
              (Finset.mem_insert_of_mem
                (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _))))))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem
            (Finset.mem_insert_of_mem
              (Finset.mem_insert_of_mem
                (Finset.mem_insert_of_mem
                  (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)))))))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem
            (Finset.mem_insert_of_mem
              (Finset.mem_insert_of_mem
                (Finset.mem_insert_of_mem
                  (Finset.mem_insert_of_mem
                    (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _))))))))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem
            (Finset.mem_insert_of_mem
              (Finset.mem_insert_of_mem
                (Finset.mem_insert_of_mem
                  (Finset.mem_insert_of_mem
                    (Finset.mem_insert_of_mem
                      (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)))))))))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem
            (Finset.mem_insert_of_mem
              (Finset.mem_insert_of_mem
                (Finset.mem_insert_of_mem
                  (Finset.mem_insert_of_mem
                    (Finset.mem_insert_of_mem
                      (Finset.mem_insert_of_mem
                        (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _))))))))))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem
            (Finset.mem_insert_of_mem
              (Finset.mem_insert_of_mem
                (Finset.mem_insert_of_mem
                  (Finset.mem_insert_of_mem
                    (Finset.mem_insert_of_mem
                      (Finset.mem_insert_of_mem
                        (Finset.mem_insert_of_mem
                          (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _)))))))))))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem
            (Finset.mem_insert_of_mem
              (Finset.mem_insert_of_mem
                (Finset.mem_insert_of_mem
                  (Finset.mem_insert_of_mem
                    (Finset.mem_insert_of_mem
                      (Finset.mem_insert_of_mem
                        (Finset.mem_insert_of_mem
                          (Finset.mem_insert_of_mem
                            (Finset.mem_insert_of_mem (Finset.mem_insert_self _ _))))))))))))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem
            (Finset.mem_insert_of_mem
              (Finset.mem_insert_of_mem
                (Finset.mem_insert_of_mem
                  (Finset.mem_insert_of_mem
                    (Finset.mem_insert_of_mem
                      (Finset.mem_insert_of_mem
                        (Finset.mem_insert_of_mem
                          (Finset.mem_insert_of_mem
                            (Finset.mem_insert_of_mem
                              (Finset.mem_insert_of_mem
                                (Finset.mem_insert_self _ _)))))))))))))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem
            (Finset.mem_insert_of_mem
              (Finset.mem_insert_of_mem
                (Finset.mem_insert_of_mem
                  (Finset.mem_insert_of_mem
                    (Finset.mem_insert_of_mem
                      (Finset.mem_insert_of_mem
                        (Finset.mem_insert_of_mem
                          (Finset.mem_insert_of_mem
                            (Finset.mem_insert_of_mem
                              (Finset.mem_insert_of_mem
                                (Finset.mem_insert_of_mem
                                  (Finset.mem_insert_self _ _))))))))))))))
    · exact Finset.mem_insert_of_mem
        (Finset.mem_insert_of_mem
          (Finset.mem_insert_of_mem
            (Finset.mem_insert_of_mem
              (Finset.mem_insert_of_mem
                (Finset.mem_insert_of_mem
                  (Finset.mem_insert_of_mem
                    (Finset.mem_insert_of_mem
                      (Finset.mem_insert_of_mem
                        (Finset.mem_insert_of_mem
                          (Finset.mem_insert_of_mem
                            (Finset.mem_insert_of_mem
                              (Finset.mem_insert_of_mem
                                (Finset.mem_insert_of_mem
                                  (Finset.mem_insert_of_mem
                                    (Finset.mem_singleton_self _)))))))))))))))⟩

/-- The same role label viewed in the ambient carrier. -/
noncomputable def ambientCarrierLabel
    (P : B1CardSixLocalRolePacket C)
    (hsubset : roleCarrier P ⊆ D.A)
    (label : CarrierLabel (roleCarrier P)) : CarrierLabel D.A :=
  ⟨label.1, hsubset label.2⟩

noncomputable def ambientRoleLabel
    (P : B1CardSixLocalRolePacket C)
    (hsubset : roleCarrier P ⊆ D.A)
    (role : B1CardSixRole) : CarrierLabel D.A :=
  ambientCarrierLabel P hsubset (roleLabel P role)

noncomputable def ambientRoleIndices
    (P : B1CardSixLocalRolePacket C)
    (hsubset : roleCarrier P ⊆ D.A)
    (B : BoundaryIndexing D.A) : Finset (Fin B.n) :=
  (roleCarrier P).attach.image
    (fun label => B.indexOf (ambientCarrierLabel P hsubset label))

private theorem ambientRoleIndex_injective
    (P : B1CardSixLocalRolePacket C)
    (hsubset : roleCarrier P ⊆ D.A)
    (B : BoundaryIndexing D.A) :
      Function.Injective
      (fun label : CarrierLabel (roleCarrier P) =>
        B.indexOf (ambientCarrierLabel P hsubset label)) := by
  intro x y hxy
  apply Subtype.ext
  calc
    x.1 = B.boundary (B.indexOf (ambientCarrierLabel P hsubset x)) := by
      simpa [ambientCarrierLabel] using
        (B.point_eq (ambientCarrierLabel P hsubset x)).symm
    _ = B.boundary (B.indexOf (ambientCarrierLabel P hsubset y)) :=
      congrArg B.boundary hxy
    _ = y.1 := by
      simpa [ambientCarrierLabel] using
        B.point_eq (ambientCarrierLabel P hsubset y)

theorem ambientRoleIndices_card
    (P : B1CardSixLocalRolePacket C)
    (hsubset : roleCarrier P ⊆ D.A)
    (B : BoundaryIndexing D.A) :
    (ambientRoleIndices P hsubset B).card = (roleCarrier P).card := by
  calc
    (ambientRoleIndices P hsubset B).card =
        (roleCarrier P).attach.card := by
      unfold ambientRoleIndices
      exact Finset.card_image_of_injective _
        (ambientRoleIndex_injective P hsubset B)
    _ = (roleCarrier P).card := Finset.card_attach

noncomputable def orderedRoleEmbedding
    (P : B1CardSixLocalRolePacket C)
    (hsubset : roleCarrier P ⊆ D.A)
    (B : BoundaryIndexing D.A) :
    Fin (roleCarrier P).card ↪o Fin B.n :=
  (ambientRoleIndices P hsubset B).orderEmbOfFin
    (ambientRoleIndices_card P hsubset B)

theorem orderedRoleEmbedding_image
    (P : B1CardSixLocalRolePacket C)
    (hsubset : roleCarrier P ⊆ D.A)
    (B : BoundaryIndexing D.A) :
    Finset.univ.image (orderedRoleEmbedding P hsubset B) =
      ambientRoleIndices P hsubset B := by
  simpa [orderedRoleEmbedding] using
    (Finset.image_orderEmbOfFin_univ
      (ambientRoleIndices P hsubset B)
      (ambientRoleIndices_card P hsubset B))

theorem ambientRoleIndex_mem
    (P : B1CardSixLocalRolePacket C)
    (hsubset : roleCarrier P ⊆ D.A)
    (B : BoundaryIndexing D.A)
    (label : CarrierLabel (roleCarrier P)) :
    B.indexOf (ambientCarrierLabel P hsubset label) ∈
      ambientRoleIndices P hsubset B := by
  exact Finset.mem_image.mpr ⟨label,
    Finset.mem_attach (roleCarrier P) label, rfl⟩

/-- Inverse sorted index of a role label. -/
noncomputable def orderedRoleIndex
    (P : B1CardSixLocalRolePacket C)
    (hsubset : roleCarrier P ⊆ D.A)
    (B : BoundaryIndexing D.A)
    (label : CarrierLabel (roleCarrier P)) :
    Fin (roleCarrier P).card :=
  (Finset.orderIsoOfFin
      (ambientRoleIndices P hsubset B)
      (ambientRoleIndices_card P hsubset B)).symm
    ⟨B.indexOf (ambientCarrierLabel P hsubset label),
      ambientRoleIndex_mem P hsubset B label⟩

theorem orderedRoleEmbedding_orderedRoleIndex
    (P : B1CardSixLocalRolePacket C)
    (hsubset : roleCarrier P ⊆ D.A)
    (B : BoundaryIndexing D.A)
    (label : CarrierLabel (roleCarrier P)) :
    orderedRoleEmbedding P hsubset B
        (orderedRoleIndex P hsubset B label) =
      B.indexOf (ambientCarrierLabel P hsubset label) := by
  have h :=
    Finset.coe_orderIsoOfFin_apply
      (ambientRoleIndices P hsubset B)
      (ambientRoleIndices_card P hsubset B)
      (orderedRoleIndex P hsubset B label)
  simpa [orderedRoleEmbedding, orderedRoleIndex] using h.symm

noncomputable def roleIndex
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A) (role : B1CardSixRole) :
    Fin (roleCarrier P).card :=
  orderedRoleIndex P (roleCarrier_subset P) B (roleLabel P role)

noncomputable def roleEmbedding
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    Fin (roleCarrier P).card ↪o Fin B.n :=
  orderedRoleEmbedding P (roleCarrier_subset P) B

theorem roleEmbedding_roleIndex
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A)
    (role : B1CardSixRole) :
    roleEmbedding P B (roleIndex P B role) =
      B.indexOf (ambientRoleLabel P (roleCarrier_subset P) role) := by
  simpa [roleEmbedding, roleIndex, ambientRoleLabel] using
    (orderedRoleEmbedding_orderedRoleIndex P (roleCarrier_subset P) B
      (roleLabel P role))

theorem raw_btw_iff_ambient
    (P : B1CardSixLocalRolePacket C)
    (hsubset : roleCarrier P ⊆ D.A)
    (B : BoundaryIndexing D.A)
    (i j k : Fin (roleCarrier P).card) :
    SurplusCOMPGBank.btw
        (orderedRoleEmbedding P hsubset B i)
        (orderedRoleEmbedding P hsubset B j)
        (orderedRoleEmbedding P hsubset B k) ↔
      SurplusCOMPGBank.btw i j k := by
  unfold SurplusCOMPGBank.btw
  simp only [(orderedRoleEmbedding P hsubset B).lt_iff_lt]

theorem raw_btw_role_iff_ambient
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (r s t : B1CardSixRole) :
    SurplusCOMPGBank.btw (roleIndex P B r) (roleIndex P B s)
        (roleIndex P B t) ↔
      SurplusCOMPGBank.btw
        (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) r))
        (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) s))
        (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) t)) := by
  unfold roleIndex
  rw [← raw_btw_iff_ambient P (roleCarrier_subset P) B
    (orderedRoleIndex P (roleCarrier_subset P) B (roleLabel P r))
    (orderedRoleIndex P (roleCarrier_subset P) B (roleLabel P s))
    (orderedRoleIndex P (roleCarrier_subset P) B (roleLabel P t))]
  rw [orderedRoleEmbedding_orderedRoleIndex P (roleCarrier_subset P) B
      (roleLabel P r),
    orderedRoleEmbedding_orderedRoleIndex P (roleCarrier_subset P) B
      (roleLabel P s),
    orderedRoleEmbedding_orderedRoleIndex P (roleCarrier_subset P) B
      (roleLabel P t)]
  rfl

/-- The exact raw card-six bad predicate: at least one live pair changes
side between its apex and its corresponding blocker. -/
def RawCardSixBad {n : ℕ}
    (apex uBlocker vBlocker u0 u1 v0 v1 : Fin n) : Prop :=
  ¬ ((SurplusCOMPGBank.btw apex uBlocker u0 ↔
        SurplusCOMPGBank.btw apex uBlocker u1) ∧
      (SurplusCOMPGBank.btw apex vBlocker v0 ↔
        SurplusCOMPGBank.btw apex vBlocker v1))

theorem rawCardSixBad_iff_ambient
    (P : B1CardSixLocalRolePacket C) (B : BoundaryIndexing D.A) :
    RawCardSixBad
        (roleIndex P B .physicalApex)
        (roleIndex P B .Bu)
        (roleIndex P B .Bv)
        (roleIndex P B .u0)
        (roleIndex P B .u1)
        (roleIndex P B .v0)
        (roleIndex P B .v1) ↔
      ¬ ((SurplusCOMPGBank.btw
            (B.indexOf (ambientRoleLabel P (roleCarrier_subset P)
              .physicalApex))
            (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .Bu))
            (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .u0)) ↔
          SurplusCOMPGBank.btw
            (B.indexOf (ambientRoleLabel P (roleCarrier_subset P)
              .physicalApex))
            (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .Bu))
            (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .u1))) ∧
        (SurplusCOMPGBank.btw
            (B.indexOf (ambientRoleLabel P (roleCarrier_subset P)
              .physicalApex))
            (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .Bv))
            (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .v0)) ↔
          SurplusCOMPGBank.btw
            (B.indexOf (ambientRoleLabel P (roleCarrier_subset P)
              .physicalApex))
            (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .Bv))
            (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .v1)))) := by
  simp only [RawCardSixBad,
    raw_btw_role_iff_ambient P B .physicalApex .Bu .u0,
    raw_btw_role_iff_ambient P B .physicalApex .Bu .u1,
    raw_btw_role_iff_ambient P B .physicalApex .Bv .v0,
    raw_btw_role_iff_ambient P B .physicalApex .Bv .v1]

theorem b1LiveSlicesSameBoundaryArc_of_not_rawCardSixBad
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (hgood : ¬ RawCardSixBad
      (roleIndex P B .physicalApex)
      (roleIndex P B .Bu)
      (roleIndex P B .Bv)
      (roleIndex P B .u0)
      (roleIndex P B .u1)
      (roleIndex P B .v0)
      (roleIndex P B .v1)) :
    B1LiveSlicesSameBoundaryArc C := by
  classical
  let apex : CarrierLabel D.A :=
    ⟨S.oppApex2, b1_oppApex2_mem_A S⟩
  let Hlate := lateFirstApexSystem C.R
  let uBlocker : CarrierLabel D.A :=
    blockerLabel Hlate C.u.1 C.u.2
  let vBlocker : CarrierLabel D.A :=
    blockerLabel Hlate C.v.1 C.v.2
  let physicalClass := SelectedClass D.A S.oppApex2 C.rho
  let uSlice :=
    (Hlate.selectedAt C.u.1 C.u.2).toCriticalFourShell.support ∩
      physicalClass
  let vSlice :=
    (Hlate.selectedAt C.v.1 C.v.2).toCriticalFourShell.support ∩
      physicalClass
  have hApex :
      ambientRoleLabel P (roleCarrier_subset P) .physicalApex = apex := by
    apply Subtype.ext
    rfl
  have hUBlocker :
      ambientRoleLabel P (roleCarrier_subset P) .Bu = uBlocker := by
    apply Subtype.ext
    rfl
  have hVBlocker :
      ambientRoleLabel P (roleCarrier_subset P) .Bv = vBlocker := by
    apply Subtype.ext
    rfl
  have hU0 :
      ambientRoleLabel P (roleCarrier_subset P) .u0 = C.u := by
    apply Subtype.ext
    rfl
  have hU1 :
      ambientRoleLabel P (roleCarrier_subset P) .u1 = P.uPhysical.other := by
    apply Subtype.ext
    rfl
  have hV0 :
      ambientRoleLabel P (roleCarrier_subset P) .v0 = C.v := by
    apply Subtype.ext
    rfl
  have hV1 :
      ambientRoleLabel P (roleCarrier_subset P) .v1 = P.vPhysical.other := by
    apply Subtype.ext
    rfl
  have hUSlice : uSlice = {C.u.1, P.uPhysical.other.1} := by
    simpa [uSlice, Hlate, physicalClass, b1USlice, b1PhysicalClass] using
      P.uPhysical.slice_eq
  have hVSlice : vSlice = {C.v.1, P.vPhysical.other.1} := by
    simpa [vSlice, Hlate, physicalClass, b1VSlice, b1PhysicalClass] using
      P.vPhysical.slice_eq
  have hgood' :
      (SurplusCOMPGBank.btw (roleIndex P B .physicalApex)
          (roleIndex P B .Bu) (roleIndex P B .u0) ↔
        SurplusCOMPGBank.btw (roleIndex P B .physicalApex)
          (roleIndex P B .Bu) (roleIndex P B .u1)) ∧
      (SurplusCOMPGBank.btw (roleIndex P B .physicalApex)
          (roleIndex P B .Bv) (roleIndex P B .v0) ↔
        SurplusCOMPGBank.btw (roleIndex P B .physicalApex)
          (roleIndex P B .Bv) (roleIndex P B .v1)) := by
    simpa [RawCardSixBad] using hgood
  have hUgoodLabel :
      (SurplusCOMPGBank.btw
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P)
            .physicalApex))
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .Bu))
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .u0)) ↔
        SurplusCOMPGBank.btw
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P)
            .physicalApex))
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .Bu))
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .u1))) := by
    exact
      (raw_btw_role_iff_ambient P B .physicalApex .Bu .u0).symm.trans
        (hgood'.1.trans (raw_btw_role_iff_ambient P B
          .physicalApex .Bu .u1))
  have hVgoodLabel :
      (SurplusCOMPGBank.btw
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P)
            .physicalApex))
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .Bv))
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .v0)) ↔
        SurplusCOMPGBank.btw
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P)
            .physicalApex))
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .Bv))
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .v1))) := by
    exact
      (raw_btw_role_iff_ambient P B .physicalApex .Bv .v0).symm.trans
        (hgood'.2.trans (raw_btw_role_iff_ambient P B
          .physicalApex .Bv .v1))
  have hUgood :
      (SurplusCOMPGBank.btw (B.indexOf apex) (B.indexOf uBlocker)
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .u0)) ↔
        SurplusCOMPGBank.btw (B.indexOf apex) (B.indexOf uBlocker)
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .u1))) := by
    simpa [hApex, hUBlocker] using hUgoodLabel
  have hVgood :
      (SurplusCOMPGBank.btw (B.indexOf apex) (B.indexOf vBlocker)
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .v0)) ↔
        SurplusCOMPGBank.btw (B.indexOf apex) (B.indexOf vBlocker)
          (B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .v1))) := by
    simpa [hApex, hVBlocker] using hVgoodLabel
  have hidxU0 (i : Fin B.n) (hi : B.boundary i = C.u.1) :
      i = B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .u0) := by
    apply B.boundary_injective
    calc
      B.boundary i = C.u.1 := hi
      _ = (ambientRoleLabel P (roleCarrier_subset P) .u0).1 := by
        rw [hU0]
      _ = B.boundary (B.indexOf
          (ambientRoleLabel P (roleCarrier_subset P) .u0)) :=
        (B.point_eq _).symm
  have hidxU1 (i : Fin B.n) (hi :
      B.boundary i = P.uPhysical.other.1) :
      i = B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .u1) := by
    apply B.boundary_injective
    calc
      B.boundary i = P.uPhysical.other.1 := hi
      _ = (ambientRoleLabel P (roleCarrier_subset P) .u1).1 := by
        rw [hU1]
      _ = B.boundary (B.indexOf
          (ambientRoleLabel P (roleCarrier_subset P) .u1)) :=
        (B.point_eq _).symm
  have hidxV0 (i : Fin B.n) (hi : B.boundary i = C.v.1) :
      i = B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .v0) := by
    apply B.boundary_injective
    calc
      B.boundary i = C.v.1 := hi
      _ = (ambientRoleLabel P (roleCarrier_subset P) .v0).1 := by
        rw [hV0]
      _ = B.boundary (B.indexOf
          (ambientRoleLabel P (roleCarrier_subset P) .v0)) :=
        (B.point_eq _).symm
  have hidxV1 (i : Fin B.n) (hi :
      B.boundary i = P.vPhysical.other.1) :
      i = B.indexOf (ambientRoleLabel P (roleCarrier_subset P) .v1) := by
    apply B.boundary_injective
    calc
      B.boundary i = P.vPhysical.other.1 := hi
      _ = (ambientRoleLabel P (roleCarrier_subset P) .v1).1 := by
        rw [hV1]
      _ = B.boundary (B.indexOf
          (ambientRoleLabel P (roleCarrier_subset P) .v1)) :=
        (B.point_eq _).symm
  refine ⟨B, ?_⟩
  change
    (uSlice.card = 2 → B1SliceSameBoundaryArc B apex uBlocker uSlice) ∧
      (vSlice.card = 2 → B1SliceSameBoundaryArc B apex vBlocker vSlice)
  constructor
  · intro _ ix iy hix hiy hne
    rw [hUSlice] at hix hiy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hix hiy
    rcases hix with hix | hix
    · have hix0 := hidxU0 ix hix
      rcases hiy with hiy | hiy
      · have hiy0 := hidxU0 iy hiy
        exact (hne (hix0.trans hiy0.symm)).elim
      · have hiy1 := hidxU1 iy hiy
        simpa [hix0, hiy1, hApex, hUBlocker, hU0, hU1] using hUgood
    · have hix1 := hidxU1 ix hix
      rcases hiy with hiy | hiy
      · have hiy0 := hidxU0 iy hiy
        simpa [hix1, hiy0, hApex, hUBlocker, hU0, hU1] using hUgood.symm
      · have hiy1 := hidxU1 iy hiy
        exact (hne (hix1.trans hiy1.symm)).elim
  · intro _ ix iy hix hiy hne
    rw [hVSlice] at hix hiy
    simp only [Finset.mem_insert, Finset.mem_singleton] at hix hiy
    rcases hix with hix | hix
    · have hix0 := hidxV0 ix hix
      rcases hiy with hiy | hiy
      · have hiy0 := hidxV0 iy hiy
        exact (hne (hix0.trans hiy0.symm)).elim
      · have hiy1 := hidxV1 iy hiy
        simpa [hix0, hiy1, hApex, hVBlocker, hV0, hV1] using hVgood
    · have hix1 := hidxV1 ix hix
      rcases hiy with hiy | hiy
      · have hiy0 := hidxV0 iy hiy
        simpa [hix1, hiy0, hApex, hVBlocker, hV0, hV1] using hVgood.symm
      · have hiy1 := hidxV1 iy hiy
        exact (hne (hix1.trans hiy1.symm)).elim

/-- The source-level card-six contradiction obtained from the exact raw-good
predicate and the already-proved live-slice consumer. -/
theorem false_of_b1PhysicalClassFiveSixNormalForm_of_not_rawCardSixBad
    (C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (P : B1CardSixLocalRolePacket C)
    (B : BoundaryIndexing D.A)
    (hgood : ¬ RawCardSixBad
      (roleIndex P B .physicalApex)
      (roleIndex P B .Bu)
      (roleIndex P B .Bv)
      (roleIndex P B .u0)
      (roleIndex P B .u1)
      (roleIndex P B .v0)
      (roleIndex P B .v1)) : False := by
  exact false_of_b1PhysicalClassFiveSixNormalForm_of_liveSlicesSameBoundaryArc
    C hnormal (b1LiveSlicesSameBoundaryArc_of_not_rawCardSixBad C P B hgood)

end B1CardSixRawOrderIngress
end ATailFrontierLiveClosure
end Problem97
