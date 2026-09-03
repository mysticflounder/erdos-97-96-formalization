/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.DRExactThirteenValuation

/-!
# Finite-label cap-betweenness transport

The exact-thirteen valuation carries a finite label order, while the source
cap theorem is stated in the local ordered-cap order.  This module transports
an equidistance witness from the finite labels to the retained boundary block
and back.  It is the positive companion to
`capLabel_not_equidistant_of_boundary_not_between` and keeps all source
ordered-cap hypotheses explicit.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace DRExactThirteenValuation

open Census554.GeneralCarrierBridge
open Census554.ZeroCutBoundaryIndexing

theorem capLabel_boundary_between_of_equidistant
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
    (heq : dist (pt j) (pt r) = dist (pt j) (pt s)) :
    (idx r < idx j ∧ idx j < idx s) ∨
      (idx j < idx s ∧ idx s < idx r) ∨
      (idx s < idx r ∧ idx r < idx j) := by
  let cast : Fin 13 → Fin B.n := Fin.cast hBn.symm
  have local_index_of_mem_cap : ∀ l : Fin 13, pt l ∈ C →
      ∃ t : Fin B.m, B.L.points t = pt l ∧
        B.Block.idx t = cast (idx l) := by
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
        B.phi (B.Block.idx t) = B.L.points t :=
          (B.Block.points_eq t).symm
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
  have heq' : dist (B.L.points tj) (B.L.points tr) =
      dist (B.L.points tj) (B.L.points ts) := by
    simpa [htj, htr, hts] using heq
  have hrsLocal : tr < ts := (B.Block.idx_strict.lt_iff_lt).1 hrs'
  have hcyc := CGN.boundary_indices_cyclically_between_of_equidistant
    B.Packet B.Hside B.Hord B.phi_injective B.phi_ccw
    hrsLocal hjr' hjs' heq'
    (B.Block.points_eq tj).symm
    (B.Block.points_eq tr).symm
    (B.Block.points_eq ts).symm
  rcases hcyc with h | h | h
  · left
    constructor
    · have hcast : cast (idx r) < cast (idx j) := by
        calc
          cast (idx r) = B.Block.idx tr := hir.symm
          _ < B.Block.idx tj := h.1
          _ = cast (idx j) := hij
      simpa [cast] using hcast
    · have hcast : cast (idx j) < cast (idx s) := by
        calc
          cast (idx j) = B.Block.idx tj := hij.symm
          _ < B.Block.idx ts := h.2
          _ = cast (idx s) := his
      simpa [cast] using hcast
  · right
    left
    constructor
    · have hcast : cast (idx j) < cast (idx s) := by
        calc
          cast (idx j) = B.Block.idx tj := hij.symm
          _ < B.Block.idx ts := h.1
          _ = cast (idx s) := his
      simpa [cast] using hcast
    · have hcast : cast (idx s) < cast (idx r) := by
        calc
          cast (idx s) = B.Block.idx ts := his.symm
          _ < B.Block.idx tr := h.2
          _ = cast (idx r) := hir
      simpa [cast] using hcast
  · right
    right
    constructor
    · have hcast : cast (idx s) < cast (idx r) := by
        calc
          cast (idx s) = B.Block.idx ts := his.symm
          _ < B.Block.idx tr := h.1
          _ = cast (idx r) := hir
      simpa [cast] using hcast
    · have hcast : cast (idx r) < cast (idx j) := by
        calc
          cast (idx r) = B.Block.idx tr := hir.symm
          _ < B.Block.idx tj := h.2
          _ = cast (idx j) := hij
      simpa [cast] using hcast

end DRExactThirteenValuation
end ATailFrontierLiveClosure
end Problem97
