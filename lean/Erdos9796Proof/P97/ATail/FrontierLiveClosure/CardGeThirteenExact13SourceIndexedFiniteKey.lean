/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Fintype.Powerset
import Mathlib.Data.Fintype.Sigma

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13OccurrenceBankIngress

/-!
# A source-indexed finite key for exact thirteen

The key retains actual positional provider rows and the certified orientation.
The uncovered label and occurrence endpoints remain raw labels. Finite validity
pulls positional supports back along that orientation and records source-proved
incidences. No cyclic normalization, legacy artifact, or bank coverage is assumed.
-/

open scoped EuclideanGeometry

namespace Problem97.ATailFrontierLiveClosure
namespace CardGeThirteenExact13SourceIndexedFiniteKey

set_option synthInstance.maxSize 4096

open ExactThirteenBranchIngress
open DRExactThirteenValuation
open CardGeThirteenExact13SourceOrderBridge
open CardGeThirteenExact13OccurrenceBankIngress

/-- Actual positional rows, plus raw occurrence labels and their source order.
Existential role/partition witnesses are checked by validity rather than stored. -/
structure Key where
  centerOf : Exact13Provider → Fin 13
  supportOf : Exact13Provider → Finset (Fin 13)
  orientation : Bool
  z : Fin 13
  a : Fin 13
  b : Fin 13
  other : Exact13Provider
deriving DecidableEq, Fintype

attribute [irreducible] instFintypeKey

def orderIndex (o : Bool) : Fin 13 → Fin 13 :=
  if o then mirrorIndex .secondOpposite else directIndex .secondOpposite

def rawOrder (o : Bool) : List (Fin 13) :=
  if o then mirrorOrder .secondOpposite else directOrder .secondOpposite

/-- Computable pullback; it does not choose an inverse or a canonical relabeling. -/
def Key.rawSupport (k : Key) (j : Exact13Provider) : Finset (Fin 13) :=
  Finset.univ.filter fun x => orderIndex k.orientation x ∈ k.supportOf j

def Key.CenterValid (k : Key) : Prop :=
  k.centerOf .k = orderIndex k.orientation secondApex ∧
  k.centerOf .l = orderIndex k.orientation secondApex ∧
  k.centerOf .t = orderIndex k.orientation firstApex ∧
  (∀ c : Exact13GlobalCenter, k.centerOf (.g c) = orderIndex k.orientation c.1) ∧
  ∃ b0 b1 : Fin 13,
    k.centerOf .c0 = orderIndex k.orientation b0 ∧
    k.centerOf .c1 = orderIndex k.orientation b1 ∧ b0 ≠ b1 ∧
    b0 ≠ firstApex ∧ b0 ≠ secondApex ∧
    b1 ≠ firstApex ∧ b1 ≠ secondApex ∧
    ∀ c : Exact13GlobalCenter,
      if c.1 = b0 ∨ c.1 = b1 then k.rawSupport (.g c) = ∅
      else (k.rawSupport (.g c)).card = 4

def Key.RowValid (k : Key) : Prop :=
  (∀ j, k.centerOf j ∉ k.supportOf j) ∧
  (k.rawSupport .c0).card = 4 ∧ (k.rawSupport .c1).card = 4 ∧
  (k.rawSupport .k).card = 4 ∧ (k.rawSupport .l).card = 4 ∧
  (k.rawSupport .t).card = 4 ∧
  Disjoint (k.rawSupport .c0) (k.rawSupport .c1) ∧
  Disjoint (k.rawSupport .c0) (k.rawSupport .k) ∧
  Disjoint (k.rawSupport .c1) (k.rawSupport .k) ∧
  Disjoint (k.rawSupport .k) (k.rawSupport .l) ∧
  (k.rawSupport .c0 ∪ k.rawSupport .c1) ∪ k.rawSupport .k =
    Finset.univ.erase k.z

def Key.CoarseValid (k : Key) : Prop :=
  let J := secondOppositeInterior .secondOpposite
  k.z ∈ J ∧ k.z ∈ k.rawSupport .l ∧ k.z ∉ k.rawSupport .k ∧
  (k.rawSupport .k ∩ J) ∪ (k.rawSupport .l ∩ J) = J ∧
  (((k.rawSupport .k ∩ J).card = 2 ∧ (k.rawSupport .l ∩ J).card = 3) ∨
    ((k.rawSupport .k ∩ J).card = 3 ∧ (k.rawSupport .l ∩ J).card = 2)) ∧
  (k.rawSupport .c0 ∩ k.rawSupport .l).card ≤ 2 ∧
  (k.rawSupport .c1 ∩ k.rawSupport .l).card ≤ 2

def Key.RoleValid (k : Key) : Prop :=
  ∃ s0 s1 d : Fin 13, s0 ≠ s1 ∧
    s0 ∈ k.rawSupport .c0 ∧ s1 ∈ k.rawSupport .c1 ∧
    s0 ∉ k.rawSupport .t ∧ s1 ∉ k.rawSupport .t ∧
    d ∈ k.rawSupport .t ∧ d ∉ k.rawSupport .c0 ∧ d ∉ k.rawSupport .c1 ∧
    (d = k.z ∨ d ∈ k.rawSupport .k)

def Key.OccurrenceValid (k : Key) : Prop :=
  let L := k.rawSupport .l
  let U := Finset.univ \ (k.rawSupport .k ∪ L ∪ {secondApex})
  (k.other = .c0 ∨ k.other = .c1) ∧ k.a ≠ k.b ∧
  k.a ∈ L ∧ k.b ∈ L ∧
  k.a ∈ k.rawSupport k.other ∧ k.b ∈ k.rawSupport k.other ∧
  secondApex ≠ k.z ∧ secondApex ∉ k.rawSupport .k ∧ secondApex ∉ L ∧
  U.card = 4 ∧
  ∃ (ell : Fin 13) (E C : Finset (Fin 13)),
    ell ∈ L.erase k.z ∧ (L.erase k.z).erase ell = {k.a, k.b} ∧
    E ∈ U.powersetCard 2 ∧ C = ({secondApex, ell} ∪ E) ∧
    k.rawSupport k.other = ((L.erase k.z).erase ell ∪ (U \ E)) ∧
    ((C = k.rawSupport .c0 ∧ k.rawSupport k.other = k.rawSupport .c1) ∨
      (C = k.rawSupport .c1 ∧ k.rawSupport k.other = k.rawSupport .c0))

def Key.OrderValid (k : Key) : Prop :=
  (rawOrder k.orientation).map (orderIndex k.orientation) = List.ofFn id ∧
  (rawOrder k.orientation).Pairwise
    (fun a b => orderIndex k.orientation a < orderIndex k.orientation b)

/-- Finite, source-necessary incidences; this predicate is not a realizability
or bank coverage assertion. All quantified witnesses range over finite types. -/
@[irreducible] def Key.Valid (k : Key) : Prop :=
  k.CenterValid ∧ k.RowValid ∧ k.CoarseValid ∧ k.RoleValid ∧
    k.OccurrenceValid ∧ k.OrderValid

instance (k : Key) : Decidable k.Valid := by
  unfold Key.Valid Key.CenterValid Key.RowValid Key.CoarseValid Key.RoleValid
    Key.OccurrenceValid Key.OrderValid
  infer_instance

/-- The finite valid domain is defined without enumerating it during compilation. -/
@[irreducible] def validKeys : Finset Key := Finset.univ.filter Key.Valid

theorem mem_validKeys_iff (k : Key) : k ∈ validKeys ↔ k.Valid := by
  simp only [validKeys, Finset.mem_filter, Finset.mem_univ, true_and]

noncomputable def ofInput (I : Input) (j : Exact13Provider) (a b : Fin 13)
    (o : Bool) : Key where
  centerOf := I.positionalPattern.centerOf
  supportOf := I.positionalPattern.supportOf
  orientation := o
  z := I.X.tightSupport.zraw
  a := a
  b := b
  other := j

private theorem source_index (I : Input) (o : Bool) (ho : sourceOrderValid I o) :
    I.P.idx = orderIndex o := by
  cases o <;> simpa [sourceOrderValid, orderIndex, I.coarse.profile_eq_secondOpposite] using ho

private theorem rawSupport_ofInput (I : Input) (j : Exact13Provider)
    (a b : Fin 13) (o : Bool) (ho : sourceOrderValid I o) (p : Exact13Provider) :
    (ofInput I j a b o).rawSupport p = I.providerPattern.supportOf p := by
  ext x
  simp only [Key.rawSupport, Finset.mem_filter]
  change (x ∈ Finset.univ ∧ orderIndex o x ∈
    (I.providerPattern.supportOf p).image I.P.idx) ↔ x ∈ I.providerPattern.supportOf p
  rw [← source_index I o ho]
  simp only [Finset.mem_univ, true_and]
  constructor
  · intro hx
    obtain ⟨y, hy, heq⟩ := Finset.mem_image.mp hx
    exact I.P.boundaryEnumeration.idx_injective heq ▸ hy
  · intro hx
    exact Finset.mem_image.mpr ⟨x, hx, rfl⟩

private theorem row_raw_card {I : Input} {c : Fin 13} {S : Finset ℝ²} {r : ℝ}
    (V : PositionalFourSupportRow I.P c S r) : V.rawSupport.card = 4 := by
  have h := V.card_eq_four
  rw [V.support_eq, Finset.card_image_of_injective _ I.P.boundaryEnumeration.idx_injective] at h
  exact h

private theorem row_raw_center {I : Input} {c : Fin 13} {S : Finset ℝ²} {r : ℝ}
    (V : PositionalFourSupportRow I.P c S r) : c ∉ V.rawSupport := by
  intro h
  apply V.center_not_mem
  rw [V.support_eq]
  exact Finset.mem_image.mpr ⟨c, h, rfl⟩

private theorem source_raw_center (I : Input) (j : Exact13Provider) :
    I.providerPattern.centerOf j ∉ I.providerPattern.supportOf j := by
  cases j with
  | c0 =>
    simpa [Input.providerPattern, exact13RawProviderPattern_of_dispatch,
      Exact13RawProviderPattern, I.sourceRole.b0_eq] using I.sourceRole.b0_not_C0
  | c1 =>
    simpa [Input.providerPattern, exact13RawProviderPattern_of_dispatch,
      Exact13RawProviderPattern, I.sourceRole.b1_eq] using I.sourceRole.b1_not_C1
  | k => exact ExclusiveApex18Input.pRaw_not_mem_Kraw I.toExclusive
  | l => exact ExclusiveApex18Input.pRaw_not_mem_Lraw I.toExclusive
  | t => exact row_raw_center I.X.fivePositionalRows.firstApexRow
  | g c =>
    change c.1 ∉ guardedGlobalSupport _ _ _ c
    unfold guardedGlobalSupport
    split
    · simp
    · exact Exact13GlobalRows.raw_center_not_mem I.P I.globalRows c

private theorem center_valid (I : Input) (j : Exact13Provider) (a b : Fin 13)
    (o : Bool) (ho : sourceOrderValid I o) : (ofInput I j a b o).CenterValid := by
  unfold Key.CenterValid
  simp only [rawSupport_ofInput I j a b o ho]
  have hi := source_index I o ho
  refine ⟨?_, ?_, ?_, ?_, I.X.fivePositionalRows.blocker₁,
    I.X.fivePositionalRows.blocker₂, ?_, ?_, I.X.fivePositionalRows.blockers_ne,
    I.X.fivePositionalRows.blocker₁_ne_firstApex,
    I.X.fivePositionalRows.blocker₁_ne_secondApex,
    I.X.fivePositionalRows.blocker₂_ne_firstApex,
    I.X.fivePositionalRows.blocker₂_ne_secondApex, ?_⟩
  · exact congrFun hi secondApex
  · exact congrFun hi secondApex
  · exact congrFun hi firstApex
  · intro c; exact congrFun hi c.1
  · exact congrFun hi _
  · exact congrFun hi _
  · intro c
    simp only [Input.providerPattern, exact13RawProviderPattern_of_dispatch,
      Exact13RawProviderPattern]
    split <;> rename_i hc
    · simp [guardedGlobalSupport, hc]
    · simpa [guardedGlobalSupport, hc] using row_raw_card (I.globalRows.row c).2

private theorem row_valid (I : Input) (j : Exact13Provider) (a b : Fin 13)
    (o : Bool) (ho : sourceOrderValid I o) : (ofInput I j a b o).RowValid := by
  unfold Key.RowValid
  simp only [rawSupport_ofInput I j a b o ho]
  refine ⟨?_, I.X.tightSupport.C0raw_card, I.X.tightSupport.C1raw_card,
    I.X.tightSupport.Kraw_card, I.O.Lraw_card,
    row_raw_card I.X.fivePositionalRows.firstApexRow,
    I.X.tightSupport.raw_disjoint_C0_C1, I.X.tightSupport.raw_disjoint_C0_K,
    I.X.tightSupport.raw_disjoint_C1_K, I.coarse.Kraw_Lraw_disjoint,
    I.X.tightSupport.raw_cover⟩
  intro p hp
  change I.P.idx (I.providerPattern.centerOf p) ∈
    (I.providerPattern.supportOf p).image I.P.idx at hp
  obtain ⟨x, hx, heq⟩ := Finset.mem_image.mp hp
  exact source_raw_center I p (I.P.boundaryEnumeration.idx_injective heq ▸ hx)

private theorem coarse_valid (I : Input) (j : Exact13Provider) (a b : Fin 13)
    (o : Bool) (ho : sourceOrderValid I o) : (ofInput I j a b o).CoarseValid := by
  unfold Key.CoarseValid
  simp only [rawSupport_ofInput I j a b o ho]
  exact ⟨I.coarse.zraw_mem_I2, I.coarse.zraw_mem_Lraw, I.coarse.zraw_not_mem_Kraw,
    I.coarse.slice_partition, I.coarse.slice_cards,
    I.coarse.C0raw_Lraw_inter_card_le_two, I.coarse.C1raw_Lraw_inter_card_le_two⟩

private theorem role_valid (I : Input) (j : Exact13Provider) (a b : Fin 13)
    (o : Bool) (ho : sourceOrderValid I o) : (ofInput I j a b o).RoleValid := by
  unfold Key.RoleValid
  simp only [rawSupport_ofInput I j a b o ho]
  exact ⟨I.sourceRole.s0, I.sourceRole.s1, I.sourceRole.d, I.sourceRole.source_ne,
    I.sourceRole.s0_mem_C0, I.sourceRole.s1_mem_C1,
    I.sourceRole.s0_not_firstApex, I.sourceRole.s1_not_firstApex,
    I.sourceRole.d_mem_firstApex, I.sourceRole.d_not_C0, I.sourceRole.d_not_C1,
    I.sourceRole.d_z_or_K⟩

private theorem order_valid (k : Key) : k.OrderValid := by
  cases ho : k.orientation
  · exact ⟨by simpa [Key.OrderValid, rawOrder, orderIndex, ho] using
      directOrder_map_directIndex Profile.secondOpposite,
      by simpa [rawOrder, orderIndex, ho] using
        directOrder_pairwise_directIndex_lt Profile.secondOpposite⟩
  · exact ⟨by simpa [Key.OrderValid, rawOrder, orderIndex, ho] using
      mirrorOrder_map_mirrorIndex Profile.secondOpposite,
      by simpa [rawOrder, orderIndex, ho] using
        mirrorOrder_pairwise_mirrorIndex_lt Profile.secondOpposite⟩

/-- Every source input gives a valid key with its exact positional pattern and
source-entitled occurrence pair. This is source necessity, not realizability. -/
theorem exists_valid_key (I : Input) :
    ∃ (k : Key), k.Valid ∧
      k.centerOf = I.positionalPattern.centerOf ∧
      k.supportOf = I.positionalPattern.supportOf ∧
      k.z = I.X.tightSupport.zraw ∧ sourceOrderValid I k.orientation ∧
      candidatePredicate I ⟨.l, k.a, k.b, k.orientation⟩ ∧
      candidatePredicate I ⟨k.other, k.a, k.b, k.orientation⟩ := by
  obtain ⟨W, j, a, b, o, hell, hj, hother, hpair, hab, ho, hL, hB⟩ :=
    exists_occurrence_other_shared_pair I
  have hocc : (ofInput I j a b o).OccurrenceValid := by
    unfold Key.OccurrenceValid
    simp only [rawSupport_ofInput I j a b o ho]
    dsimp only [ofInput]
    refine ⟨hj, hab, hL.2.2.1, hL.2.2.2, hB.2.2.1, hB.2.2.2,
      ExclusiveApex18Input.pRaw_ne_zraw I.toExclusive,
      ExclusiveApex18Input.pRaw_not_mem_Kraw I.toExclusive,
      ExclusiveApex18Input.pRaw_not_mem_Lraw I.toExclusive,
      ExclusiveApex18Input.Uraw_card I.toExclusive,
      W.ell, W.E, W.chosenSupport, hell, hpair, W.E_mem, W.chosen_eq, ?_, ?_⟩
    · rw [← hother]; exact W.other_eq
    · rw [← hother]; exact W.chosen_cases
  refine ⟨ofInput I j a b o, ?_, rfl, rfl, rfl, ho, hL, hB⟩
  unfold Key.Valid
  exact ⟨center_valid I j a b o ho, row_valid I j a b o ho,
      coarse_valid I j a b o ho, role_valid I j a b o ho, hocc, order_valid _⟩

theorem exists_mem_validKeys (I : Input) :
    ∃ k ∈ validKeys, k.centerOf = I.positionalPattern.centerOf ∧
      k.supportOf = I.positionalPattern.supportOf ∧ sourceOrderValid I k.orientation := by
  obtain ⟨k, hk, hc, hs, _, ho, _⟩ := exists_valid_key I
  have hmem : k ∈ validKeys := (mem_validKeys_iff k).mpr hk
  exact ⟨k, hmem, hc, hs, ho⟩

#print axioms exists_valid_key
#print axioms exists_mem_validKeys
#print axioms mem_validKeys_iff

end CardGeThirteenExact13SourceIndexedFiniteKey
end Problem97.ATailFrontierLiveClosure
