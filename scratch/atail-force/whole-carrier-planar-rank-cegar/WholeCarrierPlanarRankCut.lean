/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import AuxBaseCollisionPort

/-!
# Four selected rows forcing a planar auxiliary base collision

This file packages the extension-stable four-row core found in the current
whole-carrier Kalmanson survivor.  It uses only equal-radius consequences of
four actual selected rows and the already checked planar metric consumer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace WholeCarrierPlanarRankCut

/-- Four selected equal-radius rows containing the displayed incidences force
the six-point auxiliary base-collision obstruction.  Extra carrier points and
extra members of the four rows are irrelevant. -/
theorem false_of_four_selected_rows_auxBaseCollision
    {p q t₁ t₂ t₃ x : ℝ²}
    (hp_ne_q : p ≠ q)
    (hq_ne_t₂ : q ≠ t₂)
    (ht₁_ne_t₃ : t₁ ≠ t₃)
    (hx_ne_p : x ≠ p)
    (hpt₁ : dist p t₁ = dist p q)
    (hpt₂ : dist p t₂ = dist p q)
    (hpt₃ : dist p t₃ = dist p q)
    (hqt₁ : dist q t₁ = dist q p)
    (hqx : dist q x = dist q p)
    (ht₁t₂ : dist t₁ t₂ = dist t₁ p)
    (ht₃t₂ : dist t₃ t₂ = dist t₃ p)
    (ht₃x : dist t₃ x = dist t₃ p) : False := by
  let r := dist p q
  have hr : 0 < r := by
    exact dist_pos.mpr hp_ne_q
  have ht₁q : dist t₁ q = r := by
    calc
      dist t₁ q = dist q t₁ := dist_comm _ _
      _ = dist q p := hqt₁
      _ = dist p q := dist_comm _ _
  have ht₁t₂' : dist t₁ t₂ = r := by
    calc
      dist t₁ t₂ = dist t₁ p := ht₁t₂
      _ = dist p t₁ := dist_comm _ _
      _ = dist p q := hpt₁
  have ht₂t₃ : dist t₂ t₃ = r := by
    calc
      dist t₂ t₃ = dist t₃ t₂ := dist_comm _ _
      _ = dist t₃ p := ht₃t₂
      _ = dist p t₃ := dist_comm _ _
      _ = dist p q := hpt₃
  have ht₃x' : dist t₃ x = r := by
    calc
      dist t₃ x = dist t₃ p := ht₃x
      _ = dist p t₃ := dist_comm _ _
      _ = dist p q := hpt₃
  have hxt₃q : dist x t₃ = dist x q := by
    calc
      dist x t₃ = dist t₃ x := dist_comm _ _
      _ = dist t₃ p := ht₃x
      _ = dist p t₃ := dist_comm _ _
      _ = dist p q := hpt₃
      _ = dist q p := dist_comm _ _
      _ = dist q x := hqx.symm
      _ = dist x q := dist_comm _ _
  exact u5_qcritical_aux_base_collision_metric_incompatibility hr rfl hpt₁ hpt₂
    hpt₃ ht₁q ht₁t₂' ht₂t₃ hq_ne_t₂ ht₁_ne_t₃ hx_ne_p
    ht₃x' hxt₃q

#print axioms false_of_four_selected_rows_auxBaseCollision

end WholeCarrierPlanarRankCut
end Problem97
