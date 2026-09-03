/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenBoundaryIngress

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
  | .secondOpposite => Finset.Ico 8 13
  | .surplus => Finset.Ico 9 13
  | .firstOpposite => Finset.Ico 9 13

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
    simp [secondOppositeInterior] at hz ⊢

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
    simp [secondOppositeInterior] at hz ⊢

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
  refine ⟨pt, boundary, directIndex p, ?_, ?_⟩
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
  refine ⟨pt, boundary, mirrorIndex p, ?_, ?_⟩
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
