/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# An equilateral-chain bisector core

This file packages the equality-closure form of
`Problem97.u5_qcritical_aux_center_metric_incompatibility`.  Four row classes
force a three-edge equilateral chain, while a fifth row puts an auxiliary
center on the terminal perpendicular bisector.  The result uses neither a
cyclic order nor exact-row exclusions.

The theorem layer is independent of the ambient label type and does not assert
coverage of a finite bank.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- Equality-closure data for the six-label equilateral-chain obstruction. -/
structure EquilateralChainBisectorCore {α : Type*} (P : RowPattern α) where
  p : α
  q : α
  t₁ : α
  t₂ : α
  t₃ : α
  a : α
  hp_t₁ : p ≠ t₁
  hq_t₂ : q ≠ t₂
  ht₁_t₃ : t₁ ≠ t₃
  pt₁_pt₃ : EdgeClosure P (p, t₁) (p, t₃)
  pt₁_pq : EdgeClosure P (p, t₁) (p, q)
  t₁p_t₁t₂ : EdgeClosure P (t₁, p) (t₁, t₂)
  t₁p_t₁q : EdgeClosure P (t₁, p) (t₁, q)
  t₂p_t₂t₁ : EdgeClosure P (t₂, p) (t₂, t₁)
  t₃p_t₃t₂ : EdgeClosure P (t₃, p) (t₃, t₂)
  t₃p_t₃a : EdgeClosure P (t₃, p) (t₃, a)
  ap_aq : EdgeClosure P (a, p) (a, q)

/-- An equilateral-chain bisector core has no injective planar realization. -/
theorem not_realizes_of_equilateralChainBisectorCore
    {α : Type*} {P : RowPattern α} (core : EquilateralChainBisectorCore P) :
    ¬ ∃ pointOf : α → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have hp_t₁ : pointOf core.p ≠ pointOf core.t₁ := by
    intro h
    exact core.hp_t₁ (hreal.injective h)
  have hq_t₂ : pointOf core.q ≠ pointOf core.t₂ := by
    intro h
    exact core.hq_t₂ (hreal.injective h)
  have ht₁_t₃ : pointOf core.t₁ ≠ pointOf core.t₃ := by
    intro h
    exact core.ht₁_t₃ (hreal.injective h)
  have hpq :
      dist (pointOf core.p) (pointOf core.q) =
        dist (pointOf core.p) (pointOf core.t₁) := by
    simpa [edgeDist] using
      (EdgeClosure.sound hreal core.pt₁_pq).symm
  have hpt₃ :
      dist (pointOf core.p) (pointOf core.t₃) =
        dist (pointOf core.p) (pointOf core.t₁) := by
    simpa [edgeDist] using
      (EdgeClosure.sound hreal core.pt₁_pt₃).symm
  have ht₁t₂ :
      dist (pointOf core.t₁) (pointOf core.t₂) =
        dist (pointOf core.p) (pointOf core.t₁) := by
    calc
      dist (pointOf core.t₁) (pointOf core.t₂) =
          dist (pointOf core.t₁) (pointOf core.p) := by
        simpa [edgeDist] using
          (EdgeClosure.sound hreal core.t₁p_t₁t₂).symm
      _ = dist (pointOf core.p) (pointOf core.t₁) := dist_comm _ _
  have ht₁q :
      dist (pointOf core.t₁) (pointOf core.q) =
        dist (pointOf core.p) (pointOf core.t₁) := by
    calc
      dist (pointOf core.t₁) (pointOf core.q) =
          dist (pointOf core.t₁) (pointOf core.p) := by
        simpa [edgeDist] using
          (EdgeClosure.sound hreal core.t₁p_t₁q).symm
      _ = dist (pointOf core.p) (pointOf core.t₁) := dist_comm _ _
  have hpt₂ :
      dist (pointOf core.p) (pointOf core.t₂) =
        dist (pointOf core.p) (pointOf core.t₁) := by
    calc
      dist (pointOf core.p) (pointOf core.t₂) =
          dist (pointOf core.t₂) (pointOf core.p) := dist_comm _ _
      _ = dist (pointOf core.t₂) (pointOf core.t₁) := by
        simpa [edgeDist] using
          EdgeClosure.sound hreal core.t₂p_t₂t₁
      _ = dist (pointOf core.t₁) (pointOf core.t₂) := dist_comm _ _
      _ = dist (pointOf core.p) (pointOf core.t₁) := ht₁t₂
  have ht₂t₃ :
      dist (pointOf core.t₂) (pointOf core.t₃) =
        dist (pointOf core.p) (pointOf core.t₁) := by
    calc
      dist (pointOf core.t₂) (pointOf core.t₃) =
          dist (pointOf core.t₃) (pointOf core.t₂) := dist_comm _ _
      _ = dist (pointOf core.t₃) (pointOf core.p) := by
        simpa [edgeDist] using
          (EdgeClosure.sound hreal core.t₃p_t₃t₂).symm
      _ = dist (pointOf core.p) (pointOf core.t₃) := dist_comm _ _
      _ = dist (pointOf core.p) (pointOf core.t₁) := hpt₃
  have hapq :
      dist (pointOf core.a) (pointOf core.p) =
        dist (pointOf core.a) (pointOf core.q) := by
    simpa [edgeDist] using EdgeClosure.sound hreal core.ap_aq
  have ht₃a :
      dist (pointOf core.t₃) (pointOf core.a) =
        dist (pointOf core.p) (pointOf core.t₁) := by
    calc
      dist (pointOf core.t₃) (pointOf core.a) =
          dist (pointOf core.t₃) (pointOf core.p) := by
        simpa [edgeDist] using
          (EdgeClosure.sound hreal core.t₃p_t₃a).symm
      _ = dist (pointOf core.p) (pointOf core.t₃) := dist_comm _ _
      _ = dist (pointOf core.p) (pointOf core.t₁) := hpt₃
  exact u5_qcritical_aux_center_metric_incompatibility
    (dist_pos.mpr hp_t₁) hpq rfl hpt₂ hpt₃ ht₁q ht₁t₂ ht₂t₃
    hq_t₂ ht₁_t₃ hapq ht₃a

end EqualityCore
end Census554
end Problem97
