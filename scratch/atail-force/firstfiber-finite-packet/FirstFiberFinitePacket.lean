/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary

/-!
# Indexed finite packet for a FirstFiber deletion boundary

This scratch module is the source-side half of the FirstFiber metric ingress.
It does not choose a cardinality or a geometric witness.  Given an actual
`FiveSurvivorExactRowsBoundary` and a `BoundaryIndexing`, it reindexes the five
centers, their exact four-point supports, and the deleted point by `Fin n`.
The resulting object is the only shape an external packet exporter may emit.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FirstFiberFinitePacketScratch

open ATailFiveCenterDeletionBoundary
open Census554.GeneralCarrierBridge

structure IndexedExactRow (n : ℕ) where
  center : Fin n
  support : Finset (Fin n)
  support_card : support.card = 4
  center_not_mem : center ∉ support

structure IndexedPacket (n : ℕ) where
  deleted : Fin n
  order : Fin n → Fin n
  order_injective : Function.Injective order
  profile : List ℕ
  profile_nonempty : profile ≠ []
  centers : List (Fin n)
  centers_length : centers.length = 5
  centers_nodup : centers.Nodup
  rows : List (IndexedExactRow n)
  rows_length : rows.length = 5
  deleted_not_mem : ∀ row ∈ rows, deleted ∉ row.support

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
      (⟨z.1, (deletedRow_subset_A K) z.2⟩ : CarrierLabel D.A) =
        ⟨center, hc⟩ := by
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
    {D : CounterexampleData}
    {q : ℝ²} {center : ℝ²} {support : Finset ℝ²}
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
  have hcenters_nodup :
      [pointIndex I hc₀, pointIndex I hc₁, pointIndex I hc₂,
        pointIndex I hc₃, pointIndex I hc₄].Nodup := by
    apply List.nodup_cons.mpr
    constructor
    · intro hmem
      simp only [List.mem_cons, List.not_mem_nil, or_false] at hmem
      rcases hmem with h | h | h | h
      · exact hindex_ne hne.1.1 h
      · exact hindex_ne hne.1.2.1 h
      · exact hindex_ne hne.1.2.2.1 h
      · exact hindex_ne hne.1.2.2.2 h
    · apply List.nodup_cons.mpr
      constructor
      · intro hmem
        simp only [List.mem_cons, List.not_mem_nil, or_false] at hmem
        rcases hmem with h | h | h
        · exact hindex_ne hne.2.1.1 h
        · exact hindex_ne hne.2.1.2.1 h
        · exact hindex_ne hne.2.1.2.2 h
      · apply List.nodup_cons.mpr
        constructor
        · intro hmem
          simp only [List.mem_cons, List.not_mem_nil, or_false] at hmem
          rcases hmem with h | h
          · exact hindex_ne hne.2.2.1.1 h
          · exact hindex_ne hne.2.2.1.2 h
        · apply List.nodup_cons.mpr
          constructor
          · intro hmem
            simp only [List.mem_cons, List.not_mem_nil, or_false] at hmem
            exact hindex_ne hne.2.2.2 hmem
          · simp
  refine
    { deleted := pointIndex I hq
      order := id
      order_injective := Function.injective_id
      profile := profile
      profile_nonempty := hprofile
      centers := [pointIndex I hc₀, pointIndex I hc₁, pointIndex I hc₂,
        pointIndex I hc₃, pointIndex I hc₄]
      centers_length := by simp
      centers_nodup := hcenters_nodup
      rows := [r₀, r₁, r₂, r₃, r₄]
      rows_length := by simp
      deleted_not_mem := ?_ }
  intro row hrow
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hrow
  rcases hrow with rfl | rfl | rfl | rfl | rfl
  · simpa [r₀, indexedRow] using mapSupport_deleted_not_mem I hq R.K₀
  · simpa [r₁, indexedRow] using mapSupport_deleted_not_mem I hq R.K₁
  · simpa [r₂, indexedRow] using mapSupport_deleted_not_mem I hq R.K₂
  · simpa [r₃, indexedRow] using mapSupport_deleted_not_mem I hq R.K₃
  · simpa [r₄, indexedRow] using mapSupport_deleted_not_mem I hq R.K₄

#print axioms FiveSurvivorExactRowsBoundary.toIndexedPacket

end FirstFiberFinitePacketScratch
end Problem97
