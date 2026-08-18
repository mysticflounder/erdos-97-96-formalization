/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary

/-!
# Source ingress for a finite FirstFiber deletion packet

This module reindexes one genuine five-survivor deletion boundary through an
actual `BoundaryIndexing`.  It does not choose the carrier cardinality, infer
the boundary order, or produce a `MetricCoreAlternative`.  The order is an
explicit permutation supplied by the source-side caller.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace FirstFiberFinitePacketIngress

open ATailFiveCenterDeletionBoundary
open Census554.GeneralCarrierBridge

structure IndexedExactRow (n : ℕ) where
  center : Fin n
  support : Finset (Fin n)
  support_card : support.card = 4
  center_not_mem : center ∉ support

def rowSupportUnion {n : ℕ} : List (IndexedExactRow n) → Finset (Fin n)
  | [] => ∅
  | row :: rows => row.support ∪ rowSupportUnion rows

private theorem rowSupportUnion_contains {n : ℕ}
    {rows : List (IndexedExactRow n)} {row : IndexedExactRow n}
    (hrow : row ∈ rows) : row.support ⊆ rowSupportUnion rows := by
  induction rows with
  | nil => simp at hrow
  | cons head tail ih =>
    simp only [List.mem_cons] at hrow
    rcases hrow with rfl | hrow
    · simp [rowSupportUnion]
    · exact Finset.Subset.trans (ih hrow) (Finset.subset_union_right)

private theorem rowSupportUnion_card_le {n : ℕ}
    (rows : List (IndexedExactRow n)) :
    (rowSupportUnion rows).card ≤ 4 * rows.length := by
  induction rows with
  | nil => simp [rowSupportUnion]
  | cons row rows ih =>
    calc
      (rowSupportUnion (row :: rows)).card =
          (row.support ∪ rowSupportUnion rows).card := by rfl
      _ ≤ row.support.card + (rowSupportUnion rows).card :=
        Finset.card_union_le _ _
      _ ≤ 4 + 4 * rows.length := by
        exact Nat.add_le_add (le_of_eq row.support_card) ih
      _ = 4 * (row :: rows).length := by simp; omega

structure IndexedPacket (n : ℕ) where
  deleted : Fin n
  order : Fin n → Fin n
  order_bijective : Function.Bijective order
  profile : List ℕ
  profile_nonempty : profile ≠ []
  centers : List (Fin n)
  centers_length : centers.length = 5
  centers_nodup : centers.Nodup
  rows : List (IndexedExactRow n)
  rows_length : rows.length = 5
  deleted_not_mem : ∀ row ∈ rows, deleted ∉ row.support
  namedSlots : Finset (Fin n)
  namedSlots_card_le : namedSlots.card ≤ 26
  deleted_mem_namedSlots : deleted ∈ namedSlots
  centers_subset_namedSlots : ∀ center ∈ centers, center ∈ namedSlots
  rows_support_subset_namedSlots : ∀ row ∈ rows, row.support ⊆ namedSlots

/--
The source-faithful union of two finite packets.  The `left` and `right`
fields retain each packet's order, deleted label, profile, centers, and exact
rows.  `overflow` is the explicit complement of the named-slot union; this is
only a bounded named-support packet, not a claim about a full carrier
alternative.
-/
structure CombinedIndexedPacket (n : ℕ) where
  left : IndexedPacket n
  right : IndexedPacket n
  namedSlots : Finset (Fin n)
  namedSlots_eq : namedSlots = left.namedSlots ∪ right.namedSlots
  namedSlots_card_le : namedSlots.card ≤ 52
  overflow : Finset (Fin n)
  overflow_eq : overflow = Finset.univ \ namedSlots
  overflow_disjoint : Disjoint overflow namedSlots
  overflow_complete : ∀ x, x ∈ overflow ↔ x ∉ namedSlots

noncomputable def IndexedPacket.combine {n : ℕ}
    (left right : IndexedPacket n) : CombinedIndexedPacket n := by
  let namedSlots : Finset (Fin n) := left.namedSlots ∪ right.namedSlots
  let overflow : Finset (Fin n) := Finset.univ \ namedSlots
  have hcard : namedSlots.card ≤ 52 := by
    calc
      namedSlots.card ≤ left.namedSlots.card + right.namedSlots.card := by
        exact Finset.card_union_le _ _
      _ ≤ 26 + 26 := Nat.add_le_add left.namedSlots_card_le right.namedSlots_card_le
      _ = 52 := by norm_num
  refine
    { left := left
      right := right
      namedSlots := namedSlots
      namedSlots_eq := by rfl
      namedSlots_card_le := hcard
      overflow := overflow
      overflow_eq := by rfl
      overflow_disjoint := by
        exact Finset.sdiff_disjoint
      overflow_complete := by
        intro x
        simp [overflow] }

private def pointIndex {A : Finset ℝ²} (B : BoundaryIndexing A)
    {x : ℝ²} (hx : x ∈ A) : Fin B.n :=
  B.indexOf ⟨x, hx⟩

private def mapSupport {A : Finset ℝ²} (B : BoundaryIndexing A)
    {support : Finset ℝ²} (hsupport : support ⊆ A) : Finset (Fin B.n) :=
  support.attach.image (fun z => pointIndex B (hsupport z.property))

private theorem deletedRow_subset_A
    {D : CounterexampleData} {q center : ℝ²} {support : Finset ℝ²}
    (K : U5QDeletedK4Class D q center support) : support ⊆ D.A := by
  intro x hx
  have hx' := K.subset hx
  have hx'' : x ∈ D.skeleton q := (Finset.mem_erase.mp hx').2
  exact (Finset.mem_erase.mp (by simpa [CounterexampleData.skeleton] using hx'')).2

private theorem mapSupport_card
    {A : Finset ℝ²} (B : BoundaryIndexing A)
    {support : Finset ℝ²} (hsupport : support ⊆ A)
    (hcard : support.card = 4) :
    (mapSupport B hsupport).card = 4 := by
  unfold mapSupport
  have hcardImage :
      (support.attach.image (fun z => pointIndex B (hsupport z.property))).card =
        support.attach.card := by
    apply Finset.card_image_iff.mpr
    intro a ha b hb hab
    have hlabels :
        (⟨a.1, hsupport a.2⟩ : CarrierLabel A) = ⟨b.1, hsupport b.2⟩ := by
      apply B.index_injective
      simpa [pointIndex] using hab
    apply Subtype.ext
    exact congrArg (fun z : CarrierLabel A => z.1) hlabels
  simpa [hcard] using hcardImage

private theorem mapSupport_center_not_mem
    {D : CounterexampleData} (I : BoundaryIndexing D.A)
    {q center : ℝ²} {support : Finset ℝ²}
    (hc : center ∈ D.A) (K : U5QDeletedK4Class D q center support) :
    pointIndex I hc ∉ mapSupport I (deletedRow_subset_A K) := by
  intro hmem
  rcases Finset.mem_image.mp hmem with ⟨z, hz, hindex⟩
  have hlabels :
      (⟨z.1, (deletedRow_subset_A K) z.2⟩ : CarrierLabel D.A) = ⟨center, hc⟩ := by
    apply I.index_injective
    simpa [pointIndex] using hindex
  have hcenter : center ∈ support := by
    have : z.1 = center := congrArg (fun x : CarrierLabel D.A => x.1) hlabels
    simpa [this] using z.2
  exact (Finset.mem_erase.mp (K.subset hcenter)).1 rfl

private theorem mapSupport_deleted_not_mem
    {D : CounterexampleData} (I : BoundaryIndexing D.A)
    {q center : ℝ²} {support : Finset ℝ²} (hq : q ∈ D.A)
    (K : U5QDeletedK4Class D q center support) :
    pointIndex I hq ∉ mapSupport I (deletedRow_subset_A K) := by
  intro hmem
  rcases Finset.mem_image.mp hmem with ⟨z, hz, hindex⟩
  have hlabels :
      (⟨z.1, (deletedRow_subset_A K) z.2⟩ : CarrierLabel D.A) = ⟨q, hq⟩ := by
    apply I.index_injective
    simpa [pointIndex] using hindex
  have hq_support : q ∈ support := by
    have hzq : z.1 = q := congrArg (fun x : CarrierLabel D.A => x.1) hlabels
    simpa [hzq] using z.2
  exact qDeletedK4Class_deleted_not_mem_support K hq_support

private def indexedRow
    {D : CounterexampleData} {q center : ℝ²} {support : Finset ℝ²}
    (I : BoundaryIndexing D.A) (hc : center ∈ D.A)
    (K : U5QDeletedK4Class D q center support) (hcard : support.card = 4) :
    IndexedExactRow I.n :=
  { center := pointIndex I hc
    support := mapSupport I (deletedRow_subset_A K)
    support_card := mapSupport_card I (deletedRow_subset_A K) hcard
    center_not_mem := mapSupport_center_not_mem I hc K }

noncomputable def FiveSurvivorExactRowsBoundary.toIndexedPacket
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (R : FiveSurvivorExactRowsBoundary D H q hq c₀ c₁ c₂ c₃ c₄)
    (I : BoundaryIndexing D.A)
    (hc₀ : c₀ ∈ D.A) (hc₁ : c₁ ∈ D.A) (hc₂ : c₂ ∈ D.A)
    (hc₃ : c₃ ∈ D.A) (hc₄ : c₄ ∈ D.A)
    (hcenters : ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²).card = 5)
    (order : Fin I.n → Fin I.n) (horder : Function.Bijective order)
    (profile : List ℕ) (hprofile : profile ≠ []) :
    IndexedPacket I.n := by
  have hnodup : [c₀, c₁, c₂, c₃, c₄].Nodup := by
    rw [← Multiset.coe_nodup]
    apply Multiset.toFinset_card_eq_card_iff_nodup.mp
    simpa using hcenters
  have hne :
      (c₀ ≠ c₁ ∧ c₀ ≠ c₂ ∧ c₀ ≠ c₃ ∧ c₀ ≠ c₄) ∧
      (c₁ ≠ c₂ ∧ c₁ ≠ c₃ ∧ c₁ ≠ c₄) ∧
      (c₂ ≠ c₃ ∧ c₂ ≠ c₄) ∧ c₃ ≠ c₄ := by
    simpa [List.nodup_cons, not_or] using hnodup
  have hindex_ne {x y : ℝ²} {hx : x ∈ D.A} {hy : y ∈ D.A}
      (hxy : x ≠ y) : pointIndex I hx ≠ pointIndex I hy := by
    intro h
    apply hxy
    exact congrArg (fun z : CarrierLabel D.A => z.1) (I.index_injective h)
  let r₀ := indexedRow I hc₀ R.K₀ R.B₀_card
  let r₁ := indexedRow I hc₁ R.K₁ R.B₁_card
  let r₂ := indexedRow I hc₂ R.K₂ R.B₂_card
  let r₃ := indexedRow I hc₃ R.K₃ R.B₃_card
  let r₄ := indexedRow I hc₄ R.K₄ R.B₄_card
  let centers : List (Fin I.n) :=
    [pointIndex I hc₀, pointIndex I hc₁, pointIndex I hc₂,
      pointIndex I hc₃, pointIndex I hc₄]
  let rows : List (IndexedExactRow I.n) := [r₀, r₁, r₂, r₃, r₄]
  have hcenters_nodup : centers.Nodup := by
    dsimp [centers]
    apply List.nodup_cons.mpr
    constructor
    · simp only [List.mem_cons, List.not_mem_nil, or_false]
      intro hmem
      rcases hmem with h | h | h | h
      · exact hindex_ne hne.1.1 h
      · exact hindex_ne hne.1.2.1 h
      · exact hindex_ne hne.1.2.2.1 h
      · exact hindex_ne hne.1.2.2.2 h
    · apply List.nodup_cons.mpr
      constructor
      · simp only [List.mem_cons, List.not_mem_nil, or_false]
        intro hmem
        rcases hmem with h | h | h
        · exact hindex_ne hne.2.1.1 h
        · exact hindex_ne hne.2.1.2.1 h
        · exact hindex_ne hne.2.1.2.2 h
      · apply List.nodup_cons.mpr
        constructor
        · simp only [List.mem_cons, List.not_mem_nil, or_false]
          intro hmem
          rcases hmem with h | h
          · exact hindex_ne hne.2.2.1.1 h
          · exact hindex_ne hne.2.2.1.2 h
        · apply List.nodup_cons.mpr
          constructor
          · simp only [List.mem_cons, List.not_mem_nil, or_false]
            exact hindex_ne hne.2.2.2
          · simp
  let centerSlots := centers.toFinset
  let supportSlots := rowSupportUnion rows
  let namedSlots := insert (pointIndex I hq) (centerSlots ∪ supportSlots)
  have hsupport_card : supportSlots.card ≤ 20 := by
    simpa [supportSlots, rows] using rowSupportUnion_card_le [r₀, r₁, r₂, r₃, r₄]
  have hcenter_card : centerSlots.card ≤ 5 := by
    have hcenter_eq : centerSlots.card = 5 := by
      rw [List.toFinset_card_of_nodup hcenters_nodup]
      simp [centers]
    exact hcenter_eq.le
  have hnamed_card : namedSlots.card ≤ 26 := by
    calc
      namedSlots.card ≤ 1 + (centerSlots ∪ supportSlots).card :=
        (Finset.card_insert_le _ _).trans_eq (Nat.add_comm _ _)
      _ ≤ 1 + (centerSlots.card + supportSlots.card) := by
        exact Nat.add_le_add_left (Finset.card_union_le _ _) _
      _ ≤ 26 := by omega
  have hrow_support_subset :
      ∀ row ∈ rows, row.support ⊆ namedSlots := by
    intro row hrow
    exact (rowSupportUnion_contains hrow).trans
      (Finset.subset_union_right.trans (Finset.subset_insert _ _))
  refine
    { deleted := pointIndex I hq
      order := order
      order_bijective := horder
      profile := profile
      profile_nonempty := hprofile
      centers := centers
      centers_length := by simp [centers]
      centers_nodup := hcenters_nodup
      rows := rows
      rows_length := by simp [rows]
      deleted_not_mem := ?_
      namedSlots := namedSlots
      namedSlots_card_le := hnamed_card
      deleted_mem_namedSlots := by simp [namedSlots]
      centers_subset_namedSlots := by
        intro center hcenter
        simp only [centers, List.mem_cons, List.not_mem_nil, or_false] at hcenter
        rcases hcenter with rfl | rfl | rfl | rfl | rfl <;>
          simp [namedSlots, centerSlots, centers]
      rows_support_subset_namedSlots := hrow_support_subset }
  intro row hrow
  simp only [rows, List.mem_cons, List.not_mem_nil, or_false] at hrow
  rcases hrow with rfl | rfl | rfl | rfl | rfl
  · simpa [r₀, indexedRow] using mapSupport_deleted_not_mem I hq R.K₀
  · simpa [r₁, indexedRow] using mapSupport_deleted_not_mem I hq R.K₁
  · simpa [r₂, indexedRow] using mapSupport_deleted_not_mem I hq R.K₂
  · simpa [r₃, indexedRow] using mapSupport_deleted_not_mem I hq R.K₃
  · simpa [r₄, indexedRow] using mapSupport_deleted_not_mem I hq R.K₄

noncomputable def FiveSurvivorFaithfulCarrierBoundary.toIndexedPacket
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (B : FiveSurvivorFaithfulCarrierBoundary D H q hq c₀ c₁ c₂ c₃ c₄)
    (I : BoundaryIndexing D.A)
    (order : Fin I.n → Fin I.n) (horder : Function.Bijective order)
    (profile : List ℕ) (hprofile : profile ≠ []) :
    IndexedPacket I.n :=
  FirstFiberFinitePacketIngress.FiveSurvivorExactRowsBoundary.toIndexedPacket
    B.rows I B.c₀_mem B.c₁_mem B.c₂_mem B.c₃_mem B.c₄_mem B.centers_card
    order horder profile hprofile

end FirstFiberFinitePacketIngress
end ATailFrontierLiveClosure
end Problem97
