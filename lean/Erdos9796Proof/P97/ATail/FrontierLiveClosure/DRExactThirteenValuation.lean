/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenBoundaryIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRZeroCutCapIntervals
import Erdos9796Proof.P97.CapSelectedRowCounting
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.UniqueArmRouteAudit.OriginalUniqueResidualDispatch

/-!
# Finite valuation ingress for the exact-thirteen two-radius profiles

The diagnostic card-thirteen encoder uses thirteen labels in the order
`A2, A1, A3, IS, I1, I2`.  This file supplies the finite label interface:
each of the three strict profiles has an explicit direct and reflected label
order.  It also records the interval-cardinality inequalities supplied by a
`ExactThirteenBoundaryBlocks` package; saturation of those inequalities is a
separate downstream source-order obligation.

This module contains no certificate replay and makes no satisfiability claim.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace DRExactThirteenValuation

open ATailCapApexRadiusRigidity
open Census554.CapSelectedGeometry
open Census554.GeneralCarrierBridge
open Census554.ZeroCutBoundaryIndexing
open ExactThirteenBoundaryBlocks

/- ## The three finite strict profiles -/

/-- The three strict-interior profiles at carrier cardinality thirteen. -/
inductive Profile : Type
  | secondOpposite
  | surplus
  | firstOpposite
  deriving DecidableEq, Fintype

def secondApex : Fin 13 := 0

def firstApex : Fin 13 := 1

def thirdApex : Fin 13 := 2

def surplusInterior : Profile → Finset (Fin 13)
  | .secondOpposite => Finset.Ico 3 6
  | .surplus => Finset.Ico 3 7
  | .firstOpposite => Finset.Ico 3 6

def firstOppositeInterior : Profile → Finset (Fin 13)
  | .secondOpposite => Finset.Ico 6 8
  | .surplus => Finset.Ico 7 9
  | .firstOpposite => Finset.Ico 6 9

def secondOppositeInterior : Profile → Finset (Fin 13)
  | .secondOpposite => Finset.Icc 8 12
  | .surplus => Finset.Icc 9 12
  | .firstOpposite => Finset.Icc 9 12

/- Regression guards for the finite profile tables.  In particular, these
   checks prevent a `Fin 13` upper endpoint from silently wrapping to zero. -/
theorem secondOppositeInterior_card_profile :
    (secondOppositeInterior .secondOpposite).card = 5 ∧
      (secondOppositeInterior .surplus).card = 4 ∧
      (secondOppositeInterior .firstOpposite).card = 4 := by
  decide

theorem nine_mem_secondOppositeInterior (p : Profile) :
    (9 : Fin 13) ∈ secondOppositeInterior p := by
  cases p <;> decide

theorem eight_mem_secondOppositeInterior_iff (p : Profile) :
    (8 : Fin 13) ∈ secondOppositeInterior p ↔ p = .secondOpposite := by
  cases p <;> decide

/-- The strict-cardinality assertion associated with a finite profile. -/
def HasStrictProfile {D : CounterexampleData} (S : SurplusCapPacket D.A) :
    Profile → Prop
  | .secondOpposite =>
      (S.capInteriorByIndex S.surplusIdx).card = 3 ∧
        S.oppInterior1.card = 2 ∧ S.oppInterior2.card = 5
  | .surplus =>
      (S.capInteriorByIndex S.surplusIdx).card = 4 ∧
        S.oppInterior1.card = 2 ∧ S.oppInterior2.card = 4
  | .firstOpposite =>
      (S.capInteriorByIndex S.surplusIdx).card = 3 ∧
        S.oppInterior1.card = 3 ∧ S.oppInterior2.card = 4

/- ## Explicit direct and reflected orders -/

/-- The source direct order starts at the surplus apex and follows the three
strict blocks `I2, A1, IS, A2, I1`. -/
def directOrder : Profile → List (Fin 13)
  | .secondOpposite => [2, 8, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7]
  | .surplus => [2, 9, 10, 11, 12, 1, 3, 4, 5, 6, 0, 7, 8]
  | .firstOpposite => [2, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7, 8]

/-- The reflected source order starts at the surplus apex and follows
`I1, A2, IS, A1, I2`. -/
def mirrorOrder : Profile → List (Fin 13)
  | .secondOpposite => [2, 6, 7, 0, 3, 4, 5, 1, 8, 9, 10, 11, 12]
  | .surplus => [2, 7, 8, 0, 3, 4, 5, 6, 1, 9, 10, 11, 12]
  | .firstOpposite => [2, 6, 7, 8, 0, 3, 4, 5, 1, 9, 10, 11, 12]

theorem mem_directOrder (p : Profile) (l : Fin 13) : l ∈ directOrder p := by
  cases p <;> fin_cases l <;> decide

theorem mem_mirrorOrder (p : Profile) (l : Fin 13) : l ∈ mirrorOrder p := by
  cases p <;> fin_cases l <;> decide

theorem directOrder_nodup (p : Profile) : (directOrder p).Nodup := by
  cases p <;> decide

theorem mirrorOrder_nodup (p : Profile) : (mirrorOrder p).Nodup := by
  cases p <;> decide

private theorem directOrder_length (p : Profile) : (directOrder p).length = 13 := by
  cases p <;> decide

private theorem mirrorOrder_length (p : Profile) : (mirrorOrder p).length = 13 := by
  cases p <;> decide

private theorem image_univ_comp {α : Type*} {β : Type*} [Fintype α]
    [DecidableEq α] [DecidableEq β]
    {boundary : α → β} {idx : α → α} (hidx : Function.Injective idx) :
    Finset.univ.image (fun l => boundary (idx l)) = Finset.univ.image boundary := by
  calc
    Finset.univ.image (fun l => boundary (idx l)) =
        (Finset.univ.image idx).image boundary :=
      (Finset.image_image (s := Finset.univ) (f := idx) (g := boundary)).symm
    _ = Finset.univ.image boundary := by
      rw [Finset.image_univ_of_surjective (Finite.injective_iff_surjective.mp hidx)]

/- ## The label-to-index maps -/

/- The maps are written arithmetically rather than through `findIdx`: this
keeps the finite order lemmas reducible for the kernel. -/
def directValue (p : Profile) (l : Fin 13) : Nat :=
  match p with
  | .secondOpposite =>
      if l = 0 then 10 else if l = 1 then 6 else if l = 2 then 0
      else if l.val < 6 then 7 + (l.val - 3)
      else if l.val < 8 then 11 + (l.val - 6)
      else 1 + (l.val - 8)
  | .surplus =>
      if l = 0 then 10 else if l = 1 then 5 else if l = 2 then 0
      else if l.val < 7 then 6 + (l.val - 3)
      else if l.val < 9 then 11 + (l.val - 7)
      else 1 + (l.val - 9)
  | .firstOpposite =>
      if l = 0 then 9 else if l = 1 then 5 else if l = 2 then 0
      else if l.val < 6 then 6 + (l.val - 3)
      else if l.val < 9 then 10 + (l.val - 6)
      else 1 + (l.val - 9)

def mirrorValue (p : Profile) (l : Fin 13) : Nat :=
  match p with
  | .secondOpposite =>
      if l = 0 then 3 else if l = 1 then 7 else if l = 2 then 0
      else if l.val < 6 then 4 + (l.val - 3)
      else if l.val < 8 then 1 + (l.val - 6)
      else 8 + (l.val - 8)
  | .surplus =>
      if l = 0 then 3 else if l = 1 then 8 else if l = 2 then 0
      else if l.val < 7 then 4 + (l.val - 3)
      else if l.val < 9 then 1 + (l.val - 7)
      else 9 + (l.val - 9)
  | .firstOpposite =>
      if l = 0 then 4 else if l = 1 then 8 else if l = 2 then 0
      else if l.val < 6 then 5 + (l.val - 3)
      else if l.val < 9 then 1 + (l.val - 6)
      else 9 + (l.val - 9)

private theorem directValue_lt (p : Profile) (l : Fin 13) : directValue p l < 13 := by
  cases p <;> fin_cases l <;> decide

private theorem mirrorValue_lt (p : Profile) (l : Fin 13) : mirrorValue p l < 13 := by
  cases p <;> fin_cases l <;> decide

def directIndex (p : Profile) (l : Fin 13) : Fin 13 :=
  ⟨directValue p l, directValue_lt p l⟩

def mirrorIndex (p : Profile) (l : Fin 13) : Fin 13 :=
  ⟨mirrorValue p l, mirrorValue_lt p l⟩

theorem directIndex_injective (p : Profile) : Function.Injective (directIndex p) := by
  cases p <;> decide +kernel

theorem mirrorIndex_injective (p : Profile) : Function.Injective (mirrorIndex p) := by
  cases p <;> decide +kernel

theorem directIndex_bijective (p : Profile) : Function.Bijective (directIndex p) := by
  exact ⟨directIndex_injective p, Finite.injective_iff_surjective.mp (directIndex_injective p)⟩

theorem mirrorIndex_bijective (p : Profile) : Function.Bijective (mirrorIndex p) := by
  exact ⟨mirrorIndex_injective p, Finite.injective_iff_surjective.mp (mirrorIndex_injective p)⟩

theorem directIndex_thirdApex (p : Profile) : directIndex p thirdApex = 0 := by
  cases p <;> decide

theorem mirrorIndex_thirdApex (p : Profile) : mirrorIndex p thirdApex = 0 := by
  cases p <;> decide

theorem directIndex_secondApex (p : Profile) : directIndex p secondApex =
    match p with
    | .secondOpposite => 10
    | .surplus => 10
    | .firstOpposite => 9 := by
  cases p <;> decide

theorem directIndex_firstApex (p : Profile) : directIndex p firstApex =
    match p with
    | .secondOpposite => 6
    | .surplus => 5
    | .firstOpposite => 5 := by
  cases p <;> decide

theorem mirrorIndex_secondApex (p : Profile) : mirrorIndex p secondApex =
    match p with
    | .secondOpposite => 3
    | .surplus => 3
    | .firstOpposite => 4 := by
  cases p <;> decide

theorem mirrorIndex_firstApex (p : Profile) : mirrorIndex p firstApex =
    match p with
    | .secondOpposite => 7
    | .surplus => 8
    | .firstOpposite => 8 := by
  cases p <;> decide

theorem directIndex_surplus_order (p : Profile) :
    ∀ z ∈ surplusInterior p,
      directIndex p firstApex < directIndex p z ∧
        directIndex p z < directIndex p secondApex := by
  cases p <;> intro z hz <;> fin_cases z <;>
    simp [surplusInterior, directIndex, directValue, firstApex, secondApex] at hz ⊢

theorem directIndex_firstOpposite_order (p : Profile) :
    ∀ z ∈ firstOppositeInterior p,
      directIndex p secondApex < directIndex p z := by
  cases p <;> intro z hz <;> fin_cases z <;>
    simp [firstOppositeInterior, directIndex, directValue, secondApex] at hz ⊢

theorem directIndex_secondOpposite_order (p : Profile) :
    ∀ z ∈ secondOppositeInterior p,
      (0 : Fin 13) < directIndex p z ∧
        directIndex p z < directIndex p firstApex := by
  cases p <;> intro z hz <;> fin_cases z <;>
    simp [secondOppositeInterior, directIndex, directValue,
      firstApex] at hz ⊢

theorem mirrorIndex_firstOpposite_order (p : Profile) :
    ∀ z ∈ firstOppositeInterior p,
      (0 : Fin 13) < mirrorIndex p z ∧
        mirrorIndex p z < mirrorIndex p secondApex := by
  cases p <;> intro z hz <;> fin_cases z <;>
    simp [firstOppositeInterior, mirrorIndex, mirrorValue, secondApex] at hz ⊢

theorem mirrorIndex_surplus_order (p : Profile) :
    ∀ z ∈ surplusInterior p,
      mirrorIndex p secondApex < mirrorIndex p z ∧
        mirrorIndex p z < mirrorIndex p firstApex := by
  cases p <;> intro z hz <;> fin_cases z <;>
    simp [surplusInterior, mirrorIndex, mirrorValue, firstApex, secondApex] at hz ⊢

theorem mirrorIndex_secondOpposite_order (p : Profile) :
    ∀ z ∈ secondOppositeInterior p,
      mirrorIndex p firstApex < mirrorIndex p z := by
  cases p <;> intro z hz <;> fin_cases z <;>
    simp [secondOppositeInterior, mirrorIndex, mirrorValue,
      firstApex] at hz ⊢

/- ## Label and boundary contracts -/

structure LabelMap (p : Profile) {D : CounterexampleData}
    (S : SurplusCapPacket D.A) (pt : Fin 13 → ℝ²) : Prop where
  secondApex_eq : pt secondApex = S.oppApex2
  firstApex_eq : pt firstApex = S.oppApex1
  thirdApex_eq : pt thirdApex = S.surplusApex
  surplusInterior_mem : ∀ z ∈ surplusInterior p,
    pt z ∈ S.capInteriorByIndex S.surplusIdx
  firstOppositeInterior_mem : ∀ z ∈ firstOppositeInterior p,
    pt z ∈ S.oppInterior1
  secondOppositeInterior_mem : ∀ z ∈ secondOppositeInterior p,
    pt z ∈ S.oppInterior2
  injective : Function.Injective pt
  image_eq : Finset.univ.image pt = D.A

private theorem image_eq_of_mem_of_card
    {α β : Type*} [DecidableEq β]
    {I : Finset α} {T : Finset β} {pt : α → β}
    (hinj : Function.Injective pt)
    (hmem : ∀ z ∈ I, pt z ∈ T)
    (hcard : I.card = T.card) :
    I.image pt = T := by
  have hsub : I.image pt ⊆ T := by
    intro x hx
    rcases Finset.mem_image.mp hx with ⟨z, hz, rfl⟩
    exact hmem z hz
  apply Finset.eq_of_subset_of_card_le hsub
  rw [Finset.card_image_of_injective _ hinj]
  exact Nat.le_of_eq hcard.symm

/-- Under the strict profile cardinalities, the repaired I2 label interval
exhausts the physical second-opposite interior. -/
theorem secondOppositeInterior_image_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p : Profile} {pt : Fin 13 → ℝ²}
    (hL : LabelMap p S pt)
    (hprofile : HasStrictProfile S p) :
    (secondOppositeInterior p).image pt = S.oppInterior2 := by
  apply image_eq_of_mem_of_card hL.injective hL.secondOppositeInterior_mem
  cases p with
  | secondOpposite =>
      have hcard := hprofile.2.2
      simp [secondOppositeInterior] at hcard ⊢
      omega
  | surplus =>
      have hcard := hprofile.2.2
      simp [secondOppositeInterior] at hcard ⊢
      omega
  | firstOpposite =>
      have hcard := hprofile.2.2
      simp [secondOppositeInterior] at hcard ⊢
      omega

/-- Under the strict profile cardinalities, the I1 label interval exhausts
the physical first-opposite interior. -/
theorem firstOppositeInterior_image_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p : Profile} {pt : Fin 13 → ℝ²}
    (hL : LabelMap p S pt)
    (hprofile : HasStrictProfile S p) :
    (firstOppositeInterior p).image pt = S.oppInterior1 := by
  apply image_eq_of_mem_of_card hL.injective hL.firstOppositeInterior_mem
  cases p with
  | secondOpposite =>
      have hcard := hprofile.2.1
      simp [firstOppositeInterior] at hcard ⊢
      omega
  | surplus =>
      have hcard := hprofile.2.1
      simp [firstOppositeInterior] at hcard ⊢
      omega
  | firstOpposite =>
      have hcard := hprofile.2.1
      simp [firstOppositeInterior] at hcard ⊢
      omega

/-- Under the strict profile cardinalities, the surplus label interval
exhausts the physical surplus-cap interior. -/
theorem surplusInterior_image_eq
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p : Profile} {pt : Fin 13 → ℝ²}
    (hL : LabelMap p S pt)
    (hprofile : HasStrictProfile S p) :
    (surplusInterior p).image pt = S.capInteriorByIndex S.surplusIdx := by
  apply image_eq_of_mem_of_card hL.injective hL.surplusInterior_mem
  cases p with
  | secondOpposite =>
      have hcard := hprofile.1
      simp [surplusInterior] at hcard ⊢
      omega
  | surplus =>
      have hcard := hprofile.1
      simp [surplusInterior] at hcard ⊢
      omega
  | firstOpposite =>
      have hcard := hprofile.1
      simp [surplusInterior] at hcard ⊢
      omega

/- ## Source-localization transports -/

/-- A labelled common physical pair transports the source cap-localization
theorem to its finite centre label.  The centre's carrier membership is
recovered from `LabelMap.image_eq`; the source-cap memberships and physical
inequality are kept explicit because the label contract supplies only the
forward profile inclusions. -/
theorem common_pair_localization_of_labels
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p : Profile} {pt : Fin 13 → ℝ²}
    (hL : LabelMap p S pt) (i : Fin 3)
    {c s w : Fin 13}
    (hcenterNe : pt c ≠ S.oppositeVertexByIndex i)
    (hsource : pt s ∈ S.capInteriorByIndex i)
    (hpartner : pt w ∈ S.capInteriorByIndex i)
    (hsw : s ≠ w)
    (hcenterEq : dist (pt c) (pt s) = dist (pt c) (pt w))
    (hphysicalEq :
      dist (S.oppositeVertexByIndex i) (pt s) =
        dist (S.oppositeVertexByIndex i) (pt w)) :
    pt c ∈ S.capInteriorByIndex i := by
  apply ATailTwoCenterCapLocalization.commonPhysicalPair_center_mem_capInteriorByIndex i
  · rw [← hL.image_eq]
    exact Finset.mem_image_of_mem _ (Finset.mem_univ c)
  · exact hcenterNe
  · exact hsource
  · exact hpartner
  · intro hsame
    apply hsw
    exact hL.injective hsame
  · exact hcenterEq
  · exact hphysicalEq

/-- The exact-four original residual's bisector localization transports to
finite labels once the two retained residual points are represented by
labels.  `hc_ne_first` is explicit: `LabelMap` can derive the physical
opposite-apex inequality from it, but does not encode a converse for profile
membership. -/
theorem frontier_bisector_interior_of_labels
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {p : Profile} {pt : Fin 13 → ℝ²}
    {radius : ℝ} {H : CriticalShellSystem D.A}
    {F : ATailCriticalPairFrontier.CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (hL : LabelMap p S pt) {c q w : Fin 13}
    (hc_ne_first : c ≠ firstApex)
    (hq : pt q = R.interior_q)
    (hw : pt w = R.interior_w)
    (heq : dist (pt c) (pt q) = dist (pt c) (pt w)) :
    pt c ∈ S.capInteriorByIndex S.oppIndex1 := by
  have hc_ne : pt c ≠ S.oppApex1 := by
    intro h
    apply hc_ne_first
    apply hL.injective
    calc
      pt c = S.oppApex1 := h
      _ = pt firstApex := hL.firstApex_eq.symm
  apply R.bisector_center_mem_interior
  · rw [← hL.image_eq]
    exact Finset.mem_image_of_mem _ (Finset.mem_univ c)
  · exact hc_ne
  · simpa only [hq, hw] using heq

structure ConvexBoundaryEnumeration (p : Profile)
    (pt φ : Fin 13 → ℝ²) (idx : Fin 13 → Fin 13) : Prop where
  injective : Function.Injective φ
  ccw : EuclideanGeometry.IsCcwConvexPolygon φ
  convexIndep : ConvexIndep (Finset.univ.image φ)
  pt_eq : ∀ l, pt l = φ (idx l)
  orientation : idx = directIndex p ∨ idx = mirrorIndex p

theorem ConvexBoundaryEnumeration.idx_injective {p : Profile}
    {pt φ : Fin 13 → ℝ²} {idx : Fin 13 → Fin 13}
    (hB : ConvexBoundaryEnumeration p pt φ idx) : Function.Injective idx := by
  rcases hB.orientation with rfl | rfl
  · exact directIndex_injective p
  · exact mirrorIndex_injective p

/- ## Cap-betweenness transport

The retained cap block is indexed in the ambient boundary order, while a
`LabelMap` is indexed by the finite profile labels.  This adapter recovers
the local cap indices from `cap_image`; it does not add local-index data to
the label contract. -/

theorem capLabel_not_equidistant_of_boundary_not_between
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} (B : CGN.StrictCapBlockData D.A C)
    {p : Profile} {pt φ : Fin 13 → ℝ²} {idx : Fin 13 → Fin 13}
    (hL : LabelMap p S pt)
    (hE : ConvexBoundaryEnumeration p pt φ idx)
    (hBn : B.n = 13)
    (hphi : ∀ q : Fin 13, φ q = B.phi (Fin.cast hBn.symm q))
    {j r s : Fin 13}
    (hjC : pt j ∈ C) (hrC : pt r ∈ C) (hsC : pt s ∈ C)
    (hrs : idx r < idx s) (hjr : j ≠ r) (hjs : j ≠ s)
    (hnot : ¬ (idx r < idx j ∧ idx j < idx s)) :
    dist (pt j) (pt r) ≠ dist (pt j) (pt s) := by
  let cast : Fin 13 → Fin B.n := Fin.cast hBn.symm
  have local_index_of_mem_cap : ∀ l : Fin 13, pt l ∈ C →
      ∃ t : Fin B.m, B.L.points t = pt l ∧ B.Block.idx t = cast (idx l) := by
    intro l hlC
    rw [← B.cap_image] at hlC
    obtain ⟨t, -, ht⟩ := Finset.mem_image.mp hlC
    have hpoint : pt l = B.phi (cast (idx l)) := by
      calc
        pt l = φ (idx l) := hE.pt_eq l
        _ = B.phi (cast (idx l)) := hphi (idx l)
    have hidx : B.Block.idx t = cast (idx l) := by
      apply B.phi_injective
      calc
        B.phi (B.Block.idx t) = B.L.points t := (B.Block.points_eq t).symm
        _ = pt l := ht
        _ = B.phi (cast (idx l)) := hpoint
    exact ⟨t, ht, hidx⟩
  obtain ⟨tj, htj, hij⟩ := local_index_of_mem_cap j hjC
  obtain ⟨tr, htr, hir⟩ := local_index_of_mem_cap r hrC
  obtain ⟨ts, hts, his⟩ := local_index_of_mem_cap s hsC
  have hrs' : B.Block.idx tr < B.Block.idx ts := by
    rw [hir, his]
    simpa [cast] using hrs
  have hjr' : tj ≠ tr := by
    intro hsame
    apply hjr
    apply hL.injective
    calc
      pt j = B.L.points tj := htj.symm
      _ = B.L.points tr := by rw [hsame]
      _ = pt r := htr
  have hjs' : tj ≠ ts := by
    intro hsame
    apply hjs
    apply hL.injective
    calc
      pt j = B.L.points tj := htj.symm
      _ = B.L.points ts := by rw [hsame]
      _ = pt s := hts
  have hnot' : ¬ (B.Block.idx tr < B.Block.idx tj ∧
      B.Block.idx tj < B.Block.idx ts) := by
    intro hbetween
    apply hnot
    constructor
    · have hcast : cast (idx r) < cast (idx j) := by
        calc
          cast (idx r) = B.Block.idx tr := hir.symm
          _ < B.Block.idx tj := hbetween.1
          _ = cast (idx j) := hij
      simpa [cast] using hcast
    · have hcast : cast (idx j) < cast (idx s) := by
        calc
          cast (idx j) = B.Block.idx tj := hij.symm
          _ < B.Block.idx ts := hbetween.2
          _ = cast (idx s) := his
      simpa [cast] using hcast
  intro heq
  have heq' : dist (B.L.points tj) (B.L.points tr) =
      dist (B.L.points tj) (B.L.points ts) := by
    simpa [htj, htr, hts] using heq
  have hrsLocal : tr < ts := (B.Block.idx_strict.lt_iff_lt).1 hrs'
  have hlocal := CGN.index_strictly_between_of_equidistant
    B.Packet B.Hside B.Hord hrsLocal hjr' hjs' heq'
  exact hnot' ⟨B.Block.idx_strict hlocal.1, B.Block.idx_strict hlocal.2⟩

/- ## Cap blocks and cyclic recut of the wrapping cap

The two non-wrapping blocks retain the original boundary.  The remaining
block is made ordinary by cutting the same cyclic boundary at `iw`; its
explicit shifted enumeration is part of the result. -/

theorem capBlock_of_interval_on_boundary
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (B : BoundaryIndexing D.A) {i : Fin 3}
    {u lo hi : Fin B.n} (hlohi : lo < hi)
    (hinterval : ∀ x : ℝ², x ∈ S.capByIndex i ↔
      ∃ q : Fin B.n, lo ≤ q ∧ q ≤ hi ∧ B.boundary q = x)
    (hu : B.boundary u = (S.triangleByIndex i).v1)
    (hends : (B.boundary lo = (S.triangleByIndex i).v2 ∧
        B.boundary hi = (S.triangleByIndex i).v3) ∨
      (B.boundary lo = (S.triangleByIndex i).v3 ∧
        B.boundary hi = (S.triangleByIndex i).v2))
    (hbase : signedArea2 (B.boundary u) (B.boundary lo)
      (B.boundary hi) < 0) :
    ∃ data : CGN.StrictCapBlockData D.A (S.capByIndex i),
      data.n = B.n ∧ HEq data.phi B.boundary := by
  have hneg : ∀ {a b c : Fin B.n}, a < b → b < c →
      signedArea2 (B.boundary a) (B.boundary b) (B.boundary c) < 0 := by
    intro a b c hab hbc
    exact ExactFourAdjacentGridKalmanson.signedArea_strict_of_boundaryIndexing
      B hab hbc
  obtain ⟨m, L, Packet, Hside, Block, Hord, _, _⟩ :=
    ExactFourAdjacentGridKalmanson.strictCapBlockData_of_supportCap_on_boundary
      D.convex (S.capByIndex_subset i)
      (S.circPacketByIndex i)
      (S.circPacketByIndex i).inner_at_v1
      B.boundary_injective B.boundary_image hlohi hinterval hu hends hneg hbase
  let data : CGN.StrictCapBlockData D.A (S.capByIndex i) :=
    { n := B.n, m := m, phi := B.boundary,
      phi_injective := B.boundary_injective, phi_ccw := B.boundary_ccw,
      L := L, Packet := Packet, Hside := Hside, Block := Block, Hord := Hord }
  refine ⟨data, rfl, ?_⟩
  change HEq B.boundary B.boundary
  exact HEq.rfl

theorem wrapping_capBlock_of_direct_zeroCutBlocks
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (B : BoundaryIndexing D.A) (hn : 0 < B.n) (iv iw : Fin B.n)
    (hzero : B.boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hiv : B.boundary iv =
      S.oppositeVertexByIndex S.oppIndex1)
    (hiw : B.boundary iw =
      S.oppositeVertexByIndex S.oppIndex2)
    (O : DirectBoundaryBlocks S B.boundary hn iv iw) :
    ∃ BW : CGN.StrictCapBlockData D.A
        (S.capByIndex S.oppIndex1),
      BW.n = B.n ∧
        HEq BW.phi (fun q : Fin B.n => B.boundary (q + iw)) := by
  classical
  letI : NeZero B.n := ⟨Nat.ne_of_gt hn⟩
  let iz : Fin B.n := zeroIndex hn
  let phi : Fin B.n → ℝ² := fun t => B.boundary (t + iw)
  let jU : Fin B.n := iz - iw
  let jV : Fin B.n := iv - iw
  have hphi0 : phi 0 = S.oppositeVertexByIndex S.oppIndex2 := by
    simpa only [phi, zero_add] using hiw
  have hphiU : phi jU = S.oppositeVertexByIndex S.surplusIdx := by
    simpa only [phi, jU, sub_add_cancel, iz] using hzero
  have hphiV : phi jV = S.oppositeVertexByIndex S.oppIndex1 := by
    simpa only [phi, jV, sub_add_cancel] using hiv
  have hjUpos : (0 : Fin B.n) < jU := by
    apply Fin.pos_iff_ne_zero.mpr
    intro hj
    have hadd := congrArg (fun t : Fin B.n => t + iw) hj
    have hiz : iz = iw := by
      simpa only [jU, sub_add_cancel, zero_add] using hadd
    exact (ne_of_gt (lt_trans O.apex_order.1 O.apex_order.2))
      (by simpa only [iz] using hiz.symm)
  have hjVpos : (0 : Fin B.n) < jV := by
    apply Fin.pos_iff_ne_zero.mpr
    intro hj
    have hadd := congrArg (fun t : Fin B.n => t + iw) hj
    have hivw : iv = iw := by
      simpa only [jV, sub_add_cancel, zero_add] using hadd
    exact (ne_of_gt O.apex_order.2) hivw.symm
  have hjU_ne_jV : jU ≠ jV := by
    intro heq
    have hadd := congrArg (fun t : Fin B.n => t + iw) heq
    have hizv : iz = iv := by
      simpa only [jU, jV, sub_add_cancel] using hadd
    exact (ne_of_gt O.apex_order.1) (by simpa only [iz] using hizv.symm)
  have hneg : ∀ {i j k : Fin B.n}, i < j → j < k →
      signedArea2 (B.boundary i) (B.boundary j) (B.boundary k) < 0 := by
    intro i j k hij hjk
    exact ExactFourAdjacentGridKalmanson.signedArea_strict_of_boundaryIndexing
      B hij hjk
  have hnegShift : ∀ {i j k : Fin B.n}, i < j → j < k →
      signedArea2 (phi i) (phi j) (phi k) < 0 := by
    intro i j k hij hjk
    exact ExactFourAdjacentGridKalmanson.signedArea_strict_of_cyclicShift
      hneg iw hij hjk
  have hjU_lt_jV : jU < jV := by
    rcases lt_or_gt_of_ne hjU_ne_jV with hlt | hgt
    · exact hlt
    · have hs := hnegShift hjVpos hgt
      have ho := hneg O.apex_order.1 O.apex_order.2
      have hswap :
          signedArea2 (B.boundary iw) (B.boundary iv) (B.boundary iz) =
            -signedArea2 (B.boundary iz) (B.boundary iv) (B.boundary iw) := by
        simp [signedArea2]
        ring
      rw [hphi0, hphiV, hphiU] at hs
      rw [← hiw, ← hiv, ← hzero] at hs
      rw [hswap] at hs
      exact (show False by linarith).elim
  have hphiInj : Function.Injective phi :=
    injective_cyclicShift B.boundary_injective iw
  have hphiImage : Finset.univ.image phi = D.A := by
    simpa only [phi, image_univ_cyclicShift B.boundary iw] using B.boundary_image
  have hphiCcw : EuclideanGeometry.IsCcwConvexPolygon phi :=
    isCcwConvexPolygon_cyclicShift B.boundary_injective B.boundary_ccw iw
  have hinterval : ∀ x : ℝ²,
      x ∈ S.capByIndex S.oppIndex1 ↔
        ∃ q : Fin B.n, 0 ≤ q ∧ q ≤ jU ∧ phi q = x := by
    apply S.capByIndex_interval_of_global_indices S.oppIndex1
      hphiCcw hphiInj hphiImage hjUpos (Or.inr hjU_lt_jV)
    · simpa [hphiV] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex1).symm
    · simpa [hphi0] using
        S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm
    · simpa [hphiU] using
        S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  have hbase : signedArea2 (phi jV) (phi 0) (phi jU) < 0 := by
    have h := hnegShift hjUpos hjU_lt_jV
    have hcycle : signedArea2 (phi jV) (phi 0) (phi jU) =
        signedArea2 (phi 0) (phi jU) (phi jV) := by
      simp [signedArea2]
      ring
    rw [hcycle]
    exact h
  obtain ⟨m, L, Packet, Hside, Block, Hord, hlo, hhi⟩ :=
    ExactFourAdjacentGridKalmanson.strictCapBlockData_of_supportCap_on_boundary
      D.convex (S.capByIndex_subset S.oppIndex1)
      (S.circPacketByIndex S.oppIndex1)
      (S.circPacketByIndex S.oppIndex1).inner_at_v1
      hphiInj hphiImage hjUpos hinterval
      (u := jV) (lo := 0) (hi := jU)
      (by simpa [hphiV] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex1).symm)
      (Or.inl ⟨by simpa [hphi0] using
        S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm,
        by simpa [hphiU] using
        S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm⟩)
      hnegShift hbase
  let BW : CGN.StrictCapBlockData D.A
      (S.capByIndex S.oppIndex1) :=
    { n := B.n, m := m, phi := phi,
      phi_injective := hphiInj, phi_ccw := hphiCcw,
      L := L, Packet := Packet, Hside := Hside, Block := Block, Hord := Hord }
  refine ⟨BW, rfl, ?_⟩
  · change HEq phi (fun q : Fin B.n => B.boundary (q + iw))
    rfl

theorem wrapping_capBlock_of_mirror_zeroCutBlocks
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (B : BoundaryIndexing D.A) (hn : 0 < B.n) (iv iw : Fin B.n)
    (hzero : B.boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hiv : B.boundary iv =
      S.oppositeVertexByIndex S.oppIndex1)
    (hiw : B.boundary iw =
      S.oppositeVertexByIndex S.oppIndex2)
    (O : MirrorBoundaryBlocks S B.boundary hn iv iw) :
    ∃ BW : CGN.StrictCapBlockData D.A
        (S.capByIndex S.oppIndex2),
      BW.n = B.n ∧
        HEq BW.phi (fun q : Fin B.n => B.boundary (q + iw)) := by
  classical
  letI : NeZero B.n := ⟨Nat.ne_of_gt hn⟩
  let iz : Fin B.n := zeroIndex hn
  let phi : Fin B.n → ℝ² := fun t => B.boundary (t + iw)
  let jU : Fin B.n := iz - iw
  let jV : Fin B.n := iv - iw
  have hphi0 : phi 0 = S.oppositeVertexByIndex S.oppIndex2 := by
    simpa only [phi, zero_add] using hiw
  have hphiU : phi jU = S.oppositeVertexByIndex S.surplusIdx := by
    simpa only [phi, jU, sub_add_cancel, iz] using hzero
  have hphiV : phi jV = S.oppositeVertexByIndex S.oppIndex1 := by
    simpa only [phi, jV, sub_add_cancel] using hiv
  have hjVpos : (0 : Fin B.n) < jV := by
    apply Fin.pos_iff_ne_zero.mpr
    intro hj
    have hadd := congrArg (fun t : Fin B.n => t + iw) hj
    have hivw : iv = iw := by
      simpa only [jV, sub_add_cancel, zero_add] using hadd
    exact (ne_of_gt O.apex_order.2) hivw
  have hjUpos : (0 : Fin B.n) < jU := by
    apply Fin.pos_iff_ne_zero.mpr
    intro hj
    have hadd := congrArg (fun t : Fin B.n => t + iw) hj
    have hiz : iz = iw := by
      simpa only [jU, sub_add_cancel, zero_add] using hadd
    exact (ne_of_gt O.apex_order.1) (by simpa only [iz] using hiz.symm)
  have hjV_ne_jU : jV ≠ jU := by
    intro heq
    have hadd := congrArg (fun t : Fin B.n => t + iw) heq
    have hivz : iv = iz := by
      simpa only [jV, jU, sub_add_cancel] using hadd
    exact (ne_of_gt (lt_trans O.apex_order.1 O.apex_order.2))
      (by simpa only [iz] using hivz)
  have hneg : ∀ {i j k : Fin B.n}, i < j → j < k →
      signedArea2 (B.boundary i) (B.boundary j) (B.boundary k) < 0 := by
    intro i j k hij hjk
    exact ExactFourAdjacentGridKalmanson.signedArea_strict_of_boundaryIndexing
      B hij hjk
  have hnegShift : ∀ {i j k : Fin B.n}, i < j → j < k →
      signedArea2 (phi i) (phi j) (phi k) < 0 := by
    intro i j k hij hjk
    exact ExactFourAdjacentGridKalmanson.signedArea_strict_of_cyclicShift
      hneg iw hij hjk
  have hjV_lt_jU : jV < jU := by
    rcases lt_or_gt_of_ne hjV_ne_jU with hlt | hgt
    · exact hlt
    · have hs := hnegShift hjUpos hgt
      have ho := hneg O.apex_order.1 O.apex_order.2
      have hswap :
          signedArea2 (B.boundary iw) (B.boundary iz) (B.boundary iv) =
            -signedArea2 (B.boundary iz) (B.boundary iw) (B.boundary iv) := by
        simp [signedArea2]
        ring
      rw [hphi0, hphiU, hphiV] at hs
      rw [← hiw, ← hzero, ← hiv] at hs
      rw [hswap] at hs
      exact (show False by linarith).elim
  have hphiInj : Function.Injective phi :=
    injective_cyclicShift B.boundary_injective iw
  have hphiImage : Finset.univ.image phi = D.A := by
    simpa only [phi, image_univ_cyclicShift B.boundary iw] using B.boundary_image
  have hphiCcw : EuclideanGeometry.IsCcwConvexPolygon phi :=
    isCcwConvexPolygon_cyclicShift B.boundary_injective B.boundary_ccw iw
  have hinterval : ∀ x : ℝ²,
      x ∈ S.capByIndex S.oppIndex2 ↔
        ∃ q : Fin B.n, jV ≤ q ∧ q ≤ jU ∧ phi q = x := by
    apply S.capByIndex_reverse_interval_of_global_indices S.oppIndex2
      hphiCcw hphiInj hphiImage hjV_lt_jU (Or.inl hjVpos)
    · simpa [hphi0] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm
    · simpa [hphiU] using
        S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm
    · simpa [hphiV] using
        S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm
  have hbase : signedArea2 (phi 0) (phi jV) (phi jU) < 0 :=
    hnegShift hjVpos hjV_lt_jU
  obtain ⟨m, L, Packet, Hside, Block, Hord, hlo, hhi⟩ :=
    ExactFourAdjacentGridKalmanson.strictCapBlockData_of_supportCap_on_boundary
      D.convex (S.capByIndex_subset S.oppIndex2)
      (S.circPacketByIndex S.oppIndex2)
      (S.circPacketByIndex S.oppIndex2).inner_at_v1
      hphiInj hphiImage hjV_lt_jU hinterval
      (u := 0) (lo := jV) (hi := jU)
      (by simpa [hphi0] using
        (S.triangleByIndex_v1_eq_oppositeVertexByIndex S.oppIndex2).symm)
      (Or.inr ⟨by simpa [hphiV] using
        S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm,
        by simpa [hphiU] using
        S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm⟩)
      hnegShift hbase
  let BW : CGN.StrictCapBlockData D.A
      (S.capByIndex S.oppIndex2) :=
    { n := B.n, m := m, phi := phi,
      phi_injective := hphiInj, phi_ccw := hphiCcw,
      L := L, Packet := Packet, Hside := Hside, Block := Block, Hord := Hord }
  refine ⟨BW, rfl, ?_⟩
  · change HEq phi (fun q : Fin B.n => B.boundary (q + iw))
    rfl

theorem all_capBlocks_of_zeroCutBlocks
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (B : BoundaryIndexing D.A) (hn : 0 < B.n) (iv iw : Fin B.n)
    (hzero : B.boundary (zeroIndex hn) =
      S.oppositeVertexByIndex S.surplusIdx)
    (hiv : B.boundary iv =
      S.oppositeVertexByIndex S.oppIndex1)
    (hiw : B.boundary iw =
      S.oppositeVertexByIndex S.oppIndex2)
    (hblocks : DirectBoundaryBlocks S B.boundary hn iv iw ∨
      MirrorBoundaryBlocks S B.boundary hn iv iw) :
    (∃ (BS : CGN.StrictCapBlockData D.A
          (S.capByIndex S.surplusIdx))
        (B2 : CGN.StrictCapBlockData D.A
          (S.capByIndex S.oppIndex2))
        (BW : CGN.StrictCapBlockData D.A
          (S.capByIndex S.oppIndex1)),
        BS.n = B.n ∧ HEq BS.phi B.boundary ∧
          B2.n = B.n ∧ HEq B2.phi B.boundary ∧
          BW.n = B.n ∧
          HEq BW.phi (fun q : Fin B.n => B.boundary (q + iw))) ∨
    (∃ (BS : CGN.StrictCapBlockData D.A
          (S.capByIndex S.surplusIdx))
        (B1 : CGN.StrictCapBlockData D.A
          (S.capByIndex S.oppIndex1))
        (BW : CGN.StrictCapBlockData D.A
          (S.capByIndex S.oppIndex2)),
        BS.n = B.n ∧ HEq BS.phi B.boundary ∧
          B1.n = B.n ∧ HEq B1.phi B.boundary ∧
          BW.n = B.n ∧
          HEq BW.phi (fun q : Fin B.n => B.boundary (q + iw))) := by
  classical
  have hzero_surplus : B.boundary (zeroIndex hn) =
      (S.triangleByIndex S.surplusIdx).v1 :=
    hzero.trans (S.triangleByIndex_v1_eq_oppositeVertexByIndex
      S.surplusIdx).symm
  have hiv_surplus : B.boundary iv =
      (S.triangleByIndex S.surplusIdx).v2 :=
    hiv.trans S.triangleByIndex_surplusIdx_v2_eq_oppositeVertexByIndex_oppIndex1.symm
  have hiw_surplus : B.boundary iw =
      (S.triangleByIndex S.surplusIdx).v3 :=
    hiw.trans S.triangleByIndex_surplusIdx_v3_eq_oppositeVertexByIndex_oppIndex2.symm
  have hiv_first : B.boundary iv =
      (S.triangleByIndex S.oppIndex1).v1 :=
    hiv.trans (S.triangleByIndex_v1_eq_oppositeVertexByIndex
      S.oppIndex1).symm
  have hiw_first : B.boundary iw =
      (S.triangleByIndex S.oppIndex1).v2 :=
    hiw.trans S.triangleByIndex_oppIndex1_v2_eq_oppositeVertexByIndex_oppIndex2.symm
  have hzero_first : B.boundary (zeroIndex hn) =
      (S.triangleByIndex S.oppIndex1).v3 :=
    hzero.trans S.triangleByIndex_oppIndex1_v3_eq_oppositeVertexByIndex_surplusIdx.symm
  have hiw_second : B.boundary iw =
      (S.triangleByIndex S.oppIndex2).v1 :=
    hiw.trans (S.triangleByIndex_v1_eq_oppositeVertexByIndex
      S.oppIndex2).symm
  have hzero_second : B.boundary (zeroIndex hn) =
      (S.triangleByIndex S.oppIndex2).v2 :=
    hzero.trans S.triangleByIndex_oppIndex2_v2_eq_oppositeVertexByIndex_surplusIdx.symm
  have hiv_second : B.boundary iv =
      (S.triangleByIndex S.oppIndex2).v3 :=
    hiv.trans S.triangleByIndex_oppIndex2_v3_eq_oppositeVertexByIndex_oppIndex1.symm
  have hneg : ∀ {i j k : Fin B.n}, i < j → j < k →
      signedArea2 (B.boundary i) (B.boundary j) (B.boundary k) < 0 := by
    intro i j k hij hjk
    exact ExactFourAdjacentGridKalmanson.signedArea_strict_of_boundaryIndexing
      B hij hjk
  have hcycle {a b c : ℝ²} :
      signedArea2 a b c = signedArea2 b c a := by
    simp [signedArea2]
    ring
  rcases hblocks with hdirect | hmirror
  · have hS := capBlock_of_interval_on_boundary S B
      hdirect.apex_order.2
      (S.capByIndex_interval_of_global_indices S.surplusIdx
        B.boundary_ccw B.boundary_injective B.boundary_image
        hdirect.apex_order.2 (Or.inl hdirect.apex_order.1)
        hzero_surplus hiv_surplus hiw_surplus)
      hzero_surplus (Or.inl ⟨hiv_surplus, hiw_surplus⟩)
      (hneg hdirect.apex_order.1 hdirect.apex_order.2)
    have h2base : signedArea2 (B.boundary iw)
        (B.boundary (zeroIndex hn)) (B.boundary iv) < 0 := by
      rw [hcycle]
      exact hneg hdirect.apex_order.1 hdirect.apex_order.2
    have h2 := capBlock_of_interval_on_boundary S B
      hdirect.apex_order.1
      (S.capByIndex_interval_of_global_indices S.oppIndex2
        B.boundary_ccw B.boundary_injective B.boundary_image
        hdirect.apex_order.1 (Or.inr hdirect.apex_order.2)
        hiw_second hzero_second hiv_second)
      hiw_second (Or.inl ⟨hzero_second, hiv_second⟩) h2base
    rcases hS with ⟨BS, hBS⟩
    rcases h2 with ⟨B2, hB2⟩
    obtain ⟨BW, hBWn, hBWphi⟩ :=
      wrapping_capBlock_of_direct_zeroCutBlocks S B hn iv iw hzero hiv hiw hdirect
    exact Or.inl ⟨BS, B2, BW, hBS.1, hBS.2, hB2.1, hB2.2,
      hBWn, hBWphi⟩
  · have hS := capBlock_of_interval_on_boundary S B
      hmirror.apex_order.2
      (S.capByIndex_reverse_interval_of_global_indices S.surplusIdx
        B.boundary_ccw B.boundary_injective B.boundary_image
        hmirror.apex_order.2 (Or.inl hmirror.apex_order.1)
        hzero_surplus hiv_surplus hiw_surplus)
      hzero_surplus (Or.inr ⟨hiw_surplus, hiv_surplus⟩)
      (hneg hmirror.apex_order.1 hmirror.apex_order.2)
    have h1base : signedArea2 (B.boundary iv)
        (B.boundary (zeroIndex hn)) (B.boundary iw) < 0 := by
      rw [hcycle]
      exact hneg hmirror.apex_order.1 hmirror.apex_order.2
    have h1 := capBlock_of_interval_on_boundary S B
      hmirror.apex_order.1
      (S.capByIndex_reverse_interval_of_global_indices S.oppIndex1
        B.boundary_ccw B.boundary_injective B.boundary_image
        hmirror.apex_order.1 (Or.inr hmirror.apex_order.2)
        hiv_first hiw_first hzero_first)
      hiv_first (Or.inr ⟨hzero_first, hiw_first⟩) h1base
    rcases hS with ⟨BS, hBS⟩
    rcases h1 with ⟨B1, hB1⟩
    obtain ⟨BW, hBWn, hBWphi⟩ :=
      wrapping_capBlock_of_mirror_zeroCutBlocks S B hn iv iw hzero hiv hiw hmirror
    exact Or.inr ⟨BS, B1, BW, hBS.1, hBS.2, hB1.1, hB1.2,
      hBWn, hBWphi⟩

/- ## Source interval bounds

The source block package records inclusions into the corresponding open
index intervals.  The finite label maps above are unconditional; turning
these inclusions into a full boundary enumeration requires an additional
saturation/partition lemma, which is intentionally kept as a downstream
obligation.
-/

private theorem card_le_of_Ioo {n : ℕ} {boundary : Fin n → ℝ²} {T : Finset ℝ²}
    {a b : Fin n}
    (h : ∀ x ∈ T, ∃ q : Fin n, a < q ∧ q < b ∧ boundary q = x) :
    T.card ≤ (b : ℕ) - a - 1 := by
  calc
    T.card ≤ ((Finset.Ioo a b).image boundary).card := by
      apply Finset.card_le_card
      intro x hx
      obtain ⟨q, hq1, hq2, hqx⟩ := h x hx
      rw [← hqx]
      exact Finset.mem_image_of_mem _ (Finset.mem_Ioo.mpr ⟨hq1, hq2⟩)
    _ ≤ (Finset.Ioo a b).card := Finset.card_image_le
    _ = (b : ℕ) - a - 1 := Fin.card_Ioo a b

private theorem card_le_of_Ioi {n : ℕ} {boundary : Fin n → ℝ²} {T : Finset ℝ²}
    {a : Fin n}
    (h : ∀ x ∈ T, ∃ q : Fin n, a < q ∧ boundary q = x) :
    T.card ≤ n - 1 - (a : ℕ) := by
  calc
    T.card ≤ ((Finset.Ioi a).image boundary).card := by
      apply Finset.card_le_card
      intro x hx
      obtain ⟨q, hq, hqx⟩ := h x hx
      rw [← hqx]
      exact Finset.mem_image_of_mem _ (Finset.mem_Ioi.mpr hq)
    _ ≤ (Finset.Ioi a).card := Finset.card_image_le
    _ = n - 1 - (a : ℕ) := Fin.card_Ioi a

theorem direct_boundary_interval_card_le
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBoundaryBlocks S)
    (B : DirectBoundaryBlocks S P.B.boundary P.hn P.iv P.iw) :
    S.oppInterior2.card ≤ (P.iv : ℕ) - 1 ∧
      (S.capInteriorByIndex S.surplusIdx).card ≤
        (P.iw : ℕ) - (P.iv : ℕ) - 1 ∧
      S.oppInterior1.card ≤ P.B.n - 1 - (P.iw : ℕ) := by
  exact ⟨(by simpa [zeroIndex] using card_le_of_Ioo B.opp2_between),
    card_le_of_Ioo B.surplus_between,
    card_le_of_Ioi B.opp1_after⟩

theorem mirror_boundary_interval_card_le
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBoundaryBlocks S)
    (B : MirrorBoundaryBlocks S P.B.boundary P.hn P.iv P.iw) :
    S.oppInterior1.card ≤ (P.iw : ℕ) - 1 ∧
      (S.capInteriorByIndex S.surplusIdx).card ≤
        (P.iv : ℕ) - (P.iw : ℕ) - 1 ∧
      S.oppInterior2.card ≤ P.B.n - 1 - (P.iv : ℕ) := by
  exact ⟨(by simpa [zeroIndex] using card_le_of_Ioo B.opp1_between),
    card_le_of_Ioo B.surplus_between,
    card_le_of_Ioi B.opp2_after⟩

private theorem interval_image_eq_of_saturation {n : ℕ}
    {boundary : Fin n → ℝ²} (hinj : Function.Injective boundary)
    {T : Finset ℝ²} {a b : Fin n}
    (h : ∀ x ∈ T, ∃ q : Fin n, a < q ∧ q < b ∧ boundary q = x)
    (hsat : T.card = (Finset.Ioo a b).card) :
    (Finset.Ioo a b).image boundary = T := by
  have hsub : T ⊆ (Finset.Ioo a b).image boundary := by
    intro x hx
    obtain ⟨q, hq1, hq2, hqx⟩ := h x hx
    rw [← hqx]
    exact Finset.mem_image_of_mem _ (Finset.mem_Ioo.mpr ⟨hq1, hq2⟩)
  exact (Finset.eq_of_subset_of_card_le hsub (by
    rw [Finset.card_image_of_injective _ hinj]
    exact Nat.le_of_eq hsat.symm)).symm

private theorem ray_image_eq_of_saturation {n : ℕ}
    {boundary : Fin n → ℝ²} (hinj : Function.Injective boundary)
    {T : Finset ℝ²} {a : Fin n}
    (h : ∀ x ∈ T, ∃ q : Fin n, a < q ∧ boundary q = x)
    (hsat : T.card = (Finset.Ioi a).card) :
    (Finset.Ioi a).image boundary = T := by
  have hsub : T ⊆ (Finset.Ioi a).image boundary := by
    intro x hx
    obtain ⟨q, hq, hqx⟩ := h x hx
    rw [← hqx]
    exact Finset.mem_image_of_mem _ (Finset.mem_Ioi.mpr hq)
  exact (Finset.eq_of_subset_of_card_le hsub (by
    rw [Finset.card_image_of_injective _ hinj]
    exact Nat.le_of_eq hsat.symm)).symm

private theorem surplusApex_eq_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex = S.oppositeVertexByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.surplusApex,
      SurplusCapPacket.oppositeVertexByIndex, hi]

private theorem oppApex1_eq_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

private theorem oppApex2_eq_oppositeVertexByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

/- The following conditional ingress is intentionally parameterized by the
three interval saturation equalities.  The unconditional block package only
provides the corresponding inclusions; this theorem isolates exactly the
extra source-order hypothesis needed to realize the finite labels. -/
theorem direct_labelMap_of_saturated_boundaryBlocks_with_boundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBoundaryBlocks S) (p : Profile)
    (hprofile : HasStrictProfile S p)
    (B : DirectBoundaryBlocks S P.B.boundary P.hn P.iv P.iw)
    (hsat2 : S.oppInterior2.card = (P.iv : ℕ) - 1)
    (hsatS : (S.capInteriorByIndex S.surplusIdx).card =
      (P.iw : ℕ) - (P.iv : ℕ) - 1)
    (hsat1 : S.oppInterior1.card = 13 - 1 - (P.iw : ℕ)) :
    ∃ pt φ : Fin 13 → ℝ², ∃ idx : Fin 13 → Fin 13,
      LabelMap p S pt ∧ ConvexBoundaryEnumeration p pt φ idx ∧
        ∀ q : Fin 13, φ q = P.B.boundary (Fin.cast P.card_n.symm q) := by
  classical
  let cast : Fin 13 → Fin P.B.n := Fin.cast P.card_n.symm
  let boundary : Fin 13 → ℝ² := fun q => P.B.boundary (cast q)
  let iv : Fin 13 := Fin.cast P.card_n P.iv
  let iw : Fin 13 := Fin.cast P.card_n P.iw
  have hboundary_injective : Function.Injective boundary := by
    intro x y hxy
    apply Fin.ext
    have hcast : cast x = cast y := by
      apply P.B.boundary_injective
      exact hxy
    have hv := congrArg (fun q : Fin P.B.n => q.val) hcast
    simpa [cast] using hv
  have hboundary_image : Finset.univ.image boundary = D.A := by
    have hcast_surjective : Function.Surjective cast := by
      intro q
      refine ⟨Fin.cast P.card_n q, ?_⟩
      simp [cast]
    calc
      Finset.univ.image boundary =
          (Finset.univ.image cast).image P.B.boundary := by
        simpa [boundary, Function.comp_def] using
          (Finset.image_image (s := (Finset.univ : Finset (Fin 13)))
            (f := cast) (g := P.B.boundary)).symm
      _ = Finset.univ.image P.B.boundary := by
        rw [Finset.image_univ_of_surjective hcast_surjective]
      _ = D.A := P.B.boundary_image
  have hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
    intro i j k hij hjk
    apply P.B.boundary_ccw
    · simpa [cast] using hij
    · simpa [cast] using hjk
  have hd13 : DirectBoundaryBlocks S boundary (by norm_num) iv iw := by
    refine
      { apex_order := ?_
        opp2_between := ?_
        surplus_between := ?_
        opp1_after := ?_ }
    · change (0 : ℕ) < P.iv ∧ P.iv < P.iw
      simpa only [zeroIndex] using B.apex_order
    · intro x hx
      obtain ⟨q, hq0, hqiv, hqx⟩ := B.opp2_between x hx
      refine ⟨Fin.cast P.card_n q, ?_, ?_, ?_⟩
      · change (0 : ℕ) < q
        simpa only [zeroIndex] using hq0
      · exact hqiv
      · simpa [boundary, cast] using hqx
    · intro x hx
      obtain ⟨q, hqiv, hqiw, hqx⟩ := B.surplus_between x hx
      refine ⟨Fin.cast P.card_n q, ?_, ?_, ?_⟩
      · exact hqiv
      · exact hqiw
      · simpa [boundary, cast] using hqx
    · intro x hx
      obtain ⟨q, hqiw, hqx⟩ := B.opp1_after x hx
      refine ⟨Fin.cast P.card_n q, ?_, ?_⟩
      · exact hqiw
      · simpa [boundary, cast] using hqx
  have hsat2' : S.oppInterior2.card = (iv : ℕ) - 1 := by
    simpa [iv] using hsat2
  have hsatS' : (S.capInteriorByIndex S.surplusIdx).card =
      (iw : ℕ) - (iv : ℕ) - 1 := by
    simpa [iv, iw] using hsatS
  have hsat1' : S.oppInterior1.card = 13 - 1 - (iw : ℕ) := by
    simpa [iw] using hsat1
  have hiv : iv = directIndex p firstApex := by
    apply Fin.ext
    cases p
    · change (iv : ℕ) = 6
      have hc := hprofile.2.2
      omega
    · change (iv : ℕ) = 5
      have hc := hprofile.2.2
      omega
    · change (iv : ℕ) = 5
      have hc := hprofile.2.2
      omega
  have hiw : iw = directIndex p secondApex := by
    apply Fin.ext
    cases p
    · change (iw : ℕ) = 10
      have hc2 := hprofile.2.2
      have hcS := hprofile.1
      omega
    · change (iw : ℕ) = 10
      have hc2 := hprofile.2.2
      have hcS := hprofile.1
      omega
    · change (iw : ℕ) = 9
      have hc2 := hprofile.2.2
      have hcS := hprofile.1
      omega
  have hzero : zeroIndex (by norm_num : 0 < 13) = (0 : Fin 13) := rfl
  have hsurplus : boundary 0 = S.surplusApex := by
    rw [surplusApex_eq_oppositeVertexByIndex S]
    simpa only [boundary, cast, hzero] using P.surplus_eq
  have hfirst : boundary (directIndex p firstApex) = S.oppApex1 := by
    rw [← hiv]
    change P.B.boundary (cast iv) = S.oppApex1
    have hcast : cast iv = P.iv := by
      apply Fin.ext
      rfl
    rw [hcast, oppApex1_eq_oppositeVertexByIndex S]
    exact P.first_eq
  have hsecond : boundary (directIndex p secondApex) = S.oppApex2 := by
    rw [← hiw]
    change P.B.boundary (cast iw) = S.oppApex2
    have hcast : cast iw = P.iw := by
      apply Fin.ext
      rfl
    rw [hcast, oppApex2_eq_oppositeVertexByIndex S]
    exact P.second_eq
  have himage2 : (Finset.Ioo (0 : Fin 13) iv).image boundary = S.oppInterior2 := by
    apply interval_image_eq_of_saturation hboundary_injective hd13.opp2_between
    simpa [hzero, Fin.card_Ioo] using hsat2'
  have himageS : (Finset.Ioo iv iw).image boundary =
      S.capInteriorByIndex S.surplusIdx := by
    apply interval_image_eq_of_saturation hboundary_injective hd13.surplus_between
    simpa [Fin.card_Ioo] using hsatS'
  have himage1 : (Finset.Ioi iw).image boundary = S.oppInterior1 := by
    apply ray_image_eq_of_saturation hboundary_injective hd13.opp1_after
    simpa [Fin.card_Ioi] using hsat1'
  let pt : Fin 13 → ℝ² := fun l => boundary (directIndex p l)
  have hconv : ConvexIndep (Finset.univ.image boundary) := by
    rw [hboundary_image]
    exact D.convex
  refine ⟨pt, boundary, directIndex p, ?_, ?_, ?_⟩
  · refine
      { secondApex_eq := ?_
        firstApex_eq := ?_
        thirdApex_eq := ?_
        surplusInterior_mem := ?_
        firstOppositeInterior_mem := ?_
        secondOppositeInterior_mem := ?_
        injective := hboundary_injective.comp (directIndex_injective p)
        image_eq := ?_ }
    · simpa only [pt] using hsecond
    · simpa only [pt] using hfirst
    · change boundary (directIndex p thirdApex) = S.surplusApex
      rw [directIndex_thirdApex p]
      exact hsurplus
    · intro z hz
      have ho := directIndex_surplus_order p z hz
      rw [← hiv, ← hiw] at ho
      rw [← himageS]
      exact Finset.mem_image_of_mem _ (Finset.mem_Ioo.mpr ho)
    · intro z hz
      have ho := directIndex_firstOpposite_order p z hz
      rw [← hiw] at ho
      rw [← himage1]
      exact Finset.mem_image_of_mem _ (Finset.mem_Ioi.mpr ho)
    · intro z hz
      have ho := directIndex_secondOpposite_order p z hz
      rw [← hiv] at ho
      rw [← himage2]
      exact Finset.mem_image_of_mem _ (Finset.mem_Ioo.mpr ho)
    · dsimp [pt]
      exact image_univ_comp (directIndex_injective p) |>.trans hboundary_image
  · exact
      { injective := hboundary_injective
        ccw := hboundary_ccw
        convexIndep := hconv
        pt_eq := fun _ => rfl
        orientation := Or.inl rfl }
  · intro q
    rfl

/-- The direct exact-thirteen label map with the provenance field erased. -/
theorem direct_labelMap_of_saturated_boundaryBlocks
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBoundaryBlocks S) (p : Profile)
    (hprofile : HasStrictProfile S p)
    (B : DirectBoundaryBlocks S P.B.boundary P.hn P.iv P.iw)
    (hsat2 : S.oppInterior2.card = (P.iv : ℕ) - 1)
    (hsatS : (S.capInteriorByIndex S.surplusIdx).card =
      (P.iw : ℕ) - (P.iv : ℕ) - 1)
    (hsat1 : S.oppInterior1.card = 13 - 1 - (P.iw : ℕ)) :
    ∃ pt φ : Fin 13 → ℝ², ∃ idx : Fin 13 → Fin 13,
      LabelMap p S pt ∧ ConvexBoundaryEnumeration p pt φ idx := by
  obtain ⟨pt, φ, idx, hL, hE, _⟩ :=
    direct_labelMap_of_saturated_boundaryBlocks_with_boundary P p hprofile B
      hsat2 hsatS hsat1
  exact ⟨pt, φ, idx, hL, hE⟩

theorem mirror_labelMap_of_saturated_boundaryBlocks_with_boundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBoundaryBlocks S) (p : Profile)
    (hprofile : HasStrictProfile S p)
    (B : MirrorBoundaryBlocks S P.B.boundary P.hn P.iv P.iw)
    (hsat1 : S.oppInterior1.card = (P.iw : ℕ) - 1)
    (hsatS : (S.capInteriorByIndex S.surplusIdx).card =
      (P.iv : ℕ) - (P.iw : ℕ) - 1)
    (hsat2 : S.oppInterior2.card = 13 - 1 - (P.iv : ℕ)) :
    ∃ pt φ : Fin 13 → ℝ², ∃ idx : Fin 13 → Fin 13,
      LabelMap p S pt ∧ ConvexBoundaryEnumeration p pt φ idx ∧
        ∀ q : Fin 13, φ q = P.B.boundary (Fin.cast P.card_n.symm q) := by
  classical
  let cast : Fin 13 → Fin P.B.n := Fin.cast P.card_n.symm
  let boundary : Fin 13 → ℝ² := fun q => P.B.boundary (cast q)
  let iv : Fin 13 := Fin.cast P.card_n P.iv
  let iw : Fin 13 := Fin.cast P.card_n P.iw
  have hboundary_injective : Function.Injective boundary := by
    intro x y hxy
    apply Fin.ext
    have hcast : cast x = cast y := by
      apply P.B.boundary_injective
      exact hxy
    have hv := congrArg (fun q : Fin P.B.n => q.val) hcast
    simpa [cast] using hv
  have hboundary_image : Finset.univ.image boundary = D.A := by
    have hcast_surjective : Function.Surjective cast := by
      intro q
      refine ⟨Fin.cast P.card_n q, ?_⟩
      simp [cast]
    calc
      Finset.univ.image boundary =
          (Finset.univ.image cast).image P.B.boundary := by
        simpa [boundary, Function.comp_def] using
          (Finset.image_image (s := (Finset.univ : Finset (Fin 13)))
            (f := cast) (g := P.B.boundary)).symm
      _ = Finset.univ.image P.B.boundary := by
        rw [Finset.image_univ_of_surjective hcast_surjective]
      _ = D.A := P.B.boundary_image
  have hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary := by
    intro i j k hij hjk
    apply P.B.boundary_ccw
    · simpa [cast] using hij
    · simpa [cast] using hjk
  have hm13 : MirrorBoundaryBlocks S boundary (by norm_num) iv iw := by
    refine
      { apex_order := ?_
        opp1_between := ?_
        surplus_between := ?_
        opp2_after := ?_ }
    · change (0 : ℕ) < P.iw ∧ P.iw < P.iv
      simpa only [zeroIndex] using B.apex_order
    · intro x hx
      obtain ⟨q, hq0, hqiw, hqx⟩ := B.opp1_between x hx
      refine ⟨Fin.cast P.card_n q, ?_, ?_, ?_⟩
      · change (0 : ℕ) < q
        simpa only [zeroIndex] using hq0
      · exact hqiw
      · simpa [boundary, cast] using hqx
    · intro x hx
      obtain ⟨q, hqiw, hqiv, hqx⟩ := B.surplus_between x hx
      refine ⟨Fin.cast P.card_n q, ?_, ?_, ?_⟩
      · exact hqiw
      · exact hqiv
      · simpa [boundary, cast] using hqx
    · intro x hx
      obtain ⟨q, hqiv, hqx⟩ := B.opp2_after x hx
      refine ⟨Fin.cast P.card_n q, ?_, ?_⟩
      · exact hqiv
      · simpa [boundary, cast] using hqx
  have hsat1' : S.oppInterior1.card = (iw : ℕ) - 1 := by
    simpa [iw] using hsat1
  have hsatS' : (S.capInteriorByIndex S.surplusIdx).card =
      (iv : ℕ) - (iw : ℕ) - 1 := by
    simpa [iv, iw] using hsatS
  have hsat2' : S.oppInterior2.card = 13 - 1 - (iv : ℕ) := by
    simpa [iv] using hsat2
  have hiw : iw = mirrorIndex p secondApex := by
    apply Fin.ext
    cases p
    · change (iw : ℕ) = 3
      have hc := hprofile.2.1
      omega
    · change (iw : ℕ) = 3
      have hc := hprofile.2.1
      omega
    · change (iw : ℕ) = 4
      have hc := hprofile.2.1
      omega
  have hiv : iv = mirrorIndex p firstApex := by
    apply Fin.ext
    cases p
    · have hmap : mirrorIndex Profile.secondOpposite firstApex = 7 := by decide
      rw [hmap]
      change (iv : ℕ) = 7
      have hc1 := hprofile.2.1
      have hcS := hprofile.1
      omega
    · have hmap : mirrorIndex Profile.surplus firstApex = 8 := by decide
      rw [hmap]
      change (iv : ℕ) = 8
      have hc1 := hprofile.2.1
      have hcS := hprofile.1
      omega
    · have hmap : mirrorIndex Profile.firstOpposite firstApex = 8 := by decide
      rw [hmap]
      change (iv : ℕ) = 8
      have hc1 := hprofile.2.1
      have hcS := hprofile.1
      omega
  have hzero : zeroIndex (by norm_num : 0 < 13) = (0 : Fin 13) := rfl
  have hsurplus : boundary 0 = S.surplusApex := by
    rw [surplusApex_eq_oppositeVertexByIndex S]
    simpa only [boundary, cast, hzero] using P.surplus_eq
  have hfirst : boundary (mirrorIndex p firstApex) = S.oppApex1 := by
    rw [← hiv]
    change P.B.boundary (cast iv) = S.oppApex1
    have hcast : cast iv = P.iv := by
      apply Fin.ext
      rfl
    rw [hcast, oppApex1_eq_oppositeVertexByIndex S]
    exact P.first_eq
  have hsecond : boundary (mirrorIndex p secondApex) = S.oppApex2 := by
    rw [← hiw]
    change P.B.boundary (cast iw) = S.oppApex2
    have hcast : cast iw = P.iw := by
      apply Fin.ext
      rfl
    rw [hcast, oppApex2_eq_oppositeVertexByIndex S]
    exact P.second_eq
  have himage1 : (Finset.Ioo (0 : Fin 13) iw).image boundary = S.oppInterior1 := by
    apply interval_image_eq_of_saturation hboundary_injective hm13.opp1_between
    simpa [hzero, Fin.card_Ioo] using hsat1'
  have himageS : (Finset.Ioo iw iv).image boundary =
      S.capInteriorByIndex S.surplusIdx := by
    apply interval_image_eq_of_saturation hboundary_injective hm13.surplus_between
    simpa [Fin.card_Ioo] using hsatS'
  have himage2 : (Finset.Ioi iv).image boundary = S.oppInterior2 := by
    apply ray_image_eq_of_saturation hboundary_injective hm13.opp2_after
    simpa [Fin.card_Ioi] using hsat2'
  let pt : Fin 13 → ℝ² := fun l => boundary (mirrorIndex p l)
  have hconv : ConvexIndep (Finset.univ.image boundary) := by
    rw [hboundary_image]
    exact D.convex
  refine ⟨pt, boundary, mirrorIndex p, ?_, ?_, ?_⟩
  · refine
      { secondApex_eq := ?_
        firstApex_eq := ?_
        thirdApex_eq := ?_
        surplusInterior_mem := ?_
        firstOppositeInterior_mem := ?_
        secondOppositeInterior_mem := ?_
        injective := hboundary_injective.comp (mirrorIndex_injective p)
        image_eq := ?_ }
    · simpa only [pt] using hsecond
    · simpa only [pt] using hfirst
    · change boundary (mirrorIndex p thirdApex) = S.surplusApex
      rw [mirrorIndex_thirdApex p]
      exact hsurplus
    · intro z hz
      have ho := mirrorIndex_surplus_order p z hz
      rw [← hiw, ← hiv] at ho
      rw [← himageS]
      exact Finset.mem_image_of_mem _ (Finset.mem_Ioo.mpr ho)
    · intro z hz
      have ho := mirrorIndex_firstOpposite_order p z hz
      rw [← hiw] at ho
      rw [← himage1]
      exact Finset.mem_image_of_mem _ (Finset.mem_Ioo.mpr ho)
    · intro z hz
      have ho := mirrorIndex_secondOpposite_order p z hz
      rw [← hiv] at ho
      rw [← himage2]
      exact Finset.mem_image_of_mem _ (Finset.mem_Ioi.mpr ho)
    · dsimp [pt]
      exact image_univ_comp (mirrorIndex_injective p) |>.trans hboundary_image
  · exact
      { injective := hboundary_injective
        ccw := hboundary_ccw
        convexIndep := hconv
        pt_eq := fun _ => rfl
        orientation := Or.inr rfl }
  · intro q
    rfl

/-- The mirror exact-thirteen label map with the provenance field erased. -/
theorem mirror_labelMap_of_saturated_boundaryBlocks
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBoundaryBlocks S) (p : Profile)
    (hprofile : HasStrictProfile S p)
    (B : MirrorBoundaryBlocks S P.B.boundary P.hn P.iv P.iw)
    (hsat1 : S.oppInterior1.card = (P.iw : ℕ) - 1)
    (hsatS : (S.capInteriorByIndex S.surplusIdx).card =
      (P.iv : ℕ) - (P.iw : ℕ) - 1)
    (hsat2 : S.oppInterior2.card = 13 - 1 - (P.iv : ℕ)) :
    ∃ pt φ : Fin 13 → ℝ², ∃ idx : Fin 13 → Fin 13,
      LabelMap p S pt ∧ ConvexBoundaryEnumeration p pt φ idx := by
  obtain ⟨pt, φ, idx, hL, hE, _⟩ :=
    mirror_labelMap_of_saturated_boundaryBlocks_with_boundary P p hprofile B
      hsat1 hsatS hsat2
  exact ⟨pt, φ, idx, hL, hE⟩

/- The strict profile fixes the three interior cardinalities.  Since the
direct (respectively mirror) boundary intervals are disjoint and exhaust the
thirteen boundary positions, the three upper bounds are simultaneously tight.
These wrappers expose that arithmetic step before invoking the saturated label
map constructors. -/

theorem direct_labelMap_of_profile_boundaryBlocks_with_boundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBoundaryBlocks S) (p : Profile)
    (hprofile : HasStrictProfile S p)
    (B : DirectBoundaryBlocks S P.B.boundary P.hn P.iv P.iw) :
    ∃ pt φ : Fin 13 → ℝ², ∃ idx : Fin 13 → Fin 13,
      LabelMap p S pt ∧ ConvexBoundaryEnumeration p pt φ idx ∧
        ∀ q : Fin 13, φ q = P.B.boundary (Fin.cast P.card_n.symm q) := by
  have hle := direct_boundary_interval_card_le P B
  have hn13 : P.B.n = 13 := P.card_n
  cases p with
  | secondOpposite =>
      rcases hprofile with ⟨hS, h1, h2⟩
      have hsat2 : S.oppInterior2.card = (P.iv : ℕ) - 1 := by
        omega
      have hsatS : (S.capInteriorByIndex S.surplusIdx).card =
          (P.iw : ℕ) - (P.iv : ℕ) - 1 := by
        omega
      have hsat1 : S.oppInterior1.card = 13 - 1 - (P.iw : ℕ) := by
        omega
      exact direct_labelMap_of_saturated_boundaryBlocks_with_boundary P .secondOpposite
        ⟨hS, h1, h2⟩ B hsat2 hsatS hsat1
  | surplus =>
      rcases hprofile with ⟨hS, h1, h2⟩
      have hsat2 : S.oppInterior2.card = (P.iv : ℕ) - 1 := by
        omega
      have hsatS : (S.capInteriorByIndex S.surplusIdx).card =
          (P.iw : ℕ) - (P.iv : ℕ) - 1 := by
        omega
      have hsat1 : S.oppInterior1.card = 13 - 1 - (P.iw : ℕ) := by
        omega
      exact direct_labelMap_of_saturated_boundaryBlocks_with_boundary P .surplus
        ⟨hS, h1, h2⟩ B hsat2 hsatS hsat1
  | firstOpposite =>
      rcases hprofile with ⟨hS, h1, h2⟩
      have hsat2 : S.oppInterior2.card = (P.iv : ℕ) - 1 := by
        omega
      have hsatS : (S.capInteriorByIndex S.surplusIdx).card =
          (P.iw : ℕ) - (P.iv : ℕ) - 1 := by
        omega
      have hsat1 : S.oppInterior1.card = 13 - 1 - (P.iw : ℕ) := by
        omega
      exact direct_labelMap_of_saturated_boundaryBlocks_with_boundary P .firstOpposite
        ⟨hS, h1, h2⟩ B hsat2 hsatS hsat1

/-- The direct profile ingress with the provenance field erased. -/
theorem direct_labelMap_of_profile_boundaryBlocks
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBoundaryBlocks S) (p : Profile)
    (hprofile : HasStrictProfile S p)
    (B : DirectBoundaryBlocks S P.B.boundary P.hn P.iv P.iw) :
    ∃ pt φ : Fin 13 → ℝ², ∃ idx : Fin 13 → Fin 13,
      LabelMap p S pt ∧ ConvexBoundaryEnumeration p pt φ idx := by
  obtain ⟨pt, φ, idx, hL, hE, _⟩ :=
    direct_labelMap_of_profile_boundaryBlocks_with_boundary P p hprofile B
  exact ⟨pt, φ, idx, hL, hE⟩

theorem mirror_labelMap_of_profile_boundaryBlocks_with_boundary
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBoundaryBlocks S) (p : Profile)
    (hprofile : HasStrictProfile S p)
    (B : MirrorBoundaryBlocks S P.B.boundary P.hn P.iv P.iw) :
    ∃ pt φ : Fin 13 → ℝ², ∃ idx : Fin 13 → Fin 13,
      LabelMap p S pt ∧ ConvexBoundaryEnumeration p pt φ idx ∧
        ∀ q : Fin 13, φ q = P.B.boundary (Fin.cast P.card_n.symm q) := by
  have hle := mirror_boundary_interval_card_le P B
  have hn13 : P.B.n = 13 := P.card_n
  cases p with
  | secondOpposite =>
      rcases hprofile with ⟨hS, h1, h2⟩
      have hsat1 : S.oppInterior1.card = (P.iw : ℕ) - 1 := by
        omega
      have hsatS : (S.capInteriorByIndex S.surplusIdx).card =
          (P.iv : ℕ) - (P.iw : ℕ) - 1 := by
        omega
      have hsat2 : S.oppInterior2.card = 13 - 1 - (P.iv : ℕ) := by
        omega
      exact mirror_labelMap_of_saturated_boundaryBlocks_with_boundary P .secondOpposite
        ⟨hS, h1, h2⟩ B hsat1 hsatS hsat2
  | surplus =>
      rcases hprofile with ⟨hS, h1, h2⟩
      have hsat1 : S.oppInterior1.card = (P.iw : ℕ) - 1 := by
        omega
      have hsatS : (S.capInteriorByIndex S.surplusIdx).card =
          (P.iv : ℕ) - (P.iw : ℕ) - 1 := by
        omega
      have hsat2 : S.oppInterior2.card = 13 - 1 - (P.iv : ℕ) := by
        omega
      exact mirror_labelMap_of_saturated_boundaryBlocks_with_boundary P .surplus
        ⟨hS, h1, h2⟩ B hsat1 hsatS hsat2
  | firstOpposite =>
      rcases hprofile with ⟨hS, h1, h2⟩
      have hsat1 : S.oppInterior1.card = (P.iw : ℕ) - 1 := by
        omega
      have hsatS : (S.capInteriorByIndex S.surplusIdx).card =
          (P.iv : ℕ) - (P.iw : ℕ) - 1 := by
        omega
      have hsat2 : S.oppInterior2.card = 13 - 1 - (P.iv : ℕ) := by
        omega
      exact mirror_labelMap_of_saturated_boundaryBlocks_with_boundary P .firstOpposite
        ⟨hS, h1, h2⟩ B hsat1 hsatS hsat2

/-- The mirror profile ingress with the provenance field erased. -/
theorem mirror_labelMap_of_profile_boundaryBlocks
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBoundaryBlocks S) (p : Profile)
    (hprofile : HasStrictProfile S p)
    (B : MirrorBoundaryBlocks S P.B.boundary P.hn P.iv P.iw) :
    ∃ pt φ : Fin 13 → ℝ², ∃ idx : Fin 13 → Fin 13,
      LabelMap p S pt ∧ ConvexBoundaryEnumeration p pt φ idx := by
  obtain ⟨pt, φ, idx, hL, hE, _⟩ :=
    mirror_labelMap_of_profile_boundaryBlocks_with_boundary P p hprofile B
  exact ⟨pt, φ, idx, hL, hE⟩

/- The block package carries a strict profile disjunction; this is the
finite choice needed by the profile-parametrized label map. -/
theorem exists_profile_of_boundaryBlocks
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBoundaryBlocks S) :
    ∃ p : Profile, HasStrictProfile S p := by
  rcases P.strict_profile with h | h | h
  · exact ⟨.secondOpposite, h⟩
  · exact ⟨.surplus, h⟩
  · exact ⟨.firstOpposite, h⟩

end DRExactThirteenValuation
end ATailFrontierLiveClosure
end Problem97
