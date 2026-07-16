/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.EqualityCore
import BankClean15ArbitraryAnchorClosure

/-!
# Equality-closure interface for the bank-clean fifteen-row collision

This scratch integration file checks the exact abstract core shape intended
for the production metric bank.  Only the two anchor labels must differ; all
other roles may alias.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace EqualityCore

/-- The fifteen equality-closure obligations of the bank-clean collision. -/
structure BankCleanFifteenCollisionCore {alpha : Type*}
    (P : RowPattern alpha) where
  O : alpha
  A : alpha
  E : alpha
  F : alpha
  G : alpha
  K : alpha
  X : alpha
  Y : alpha
  Z : alpha
  hOA : O ≠ A
  A_O_G : EdgeClosure P (A, O) (A, G)
  A_O_K : EdgeClosure P (A, O) (A, K)
  F_A_Z : EdgeClosure P (F, A) (F, Z)
  F_A_K : EdgeClosure P (F, A) (F, K)
  G_X_E : EdgeClosure P (G, X) (G, E)
  G_X_K : EdgeClosure P (G, X) (G, K)
  K_O_Y : EdgeClosure P (K, O) (K, Y)
  K_O_G : EdgeClosure P (K, O) (K, G)
  O_A_E : EdgeClosure P (O, A) (O, E)
  X_Z_G : EdgeClosure P (X, Z) (X, G)
  X_Z_F : EdgeClosure P (X, Z) (X, F)
  Y_O_X : EdgeClosure P (Y, O) (Y, X)
  Y_O_Z : EdgeClosure P (Y, O) (Y, Z)
  Z_A_Y : EdgeClosure P (Z, A) (Z, Y)
  Z_A_G : EdgeClosure P (Z, A) (Z, G)

/-- A bank-clean fifteen-row core has no injective planar realization. -/
theorem not_realizes_of_bankCleanFifteenCollisionCore
    {alpha : Type*} {P : RowPattern alpha}
    (core : BankCleanFifteenCollisionCore P) :
    ¬ ∃ pointOf : alpha → ℝ², Realizes P pointOf := by
  rintro ⟨pointOf, hreal⟩
  have sound {e f : Edge alpha} (h : EdgeClosure P e f) :
      edgeDist pointOf e = edgeDist pointOf f :=
    EdgeClosure.sound hreal h
  have hcollision :=
    Problem97.ATailBankClean15ArbitraryAnchorClosureScratch.bank_clean_15_anchor_collision
      (by simpa [edgeDist] using sound core.A_O_G)
      (by simpa [edgeDist] using sound core.A_O_K)
      (by simpa [edgeDist] using sound core.F_A_Z)
      (by simpa [edgeDist] using sound core.F_A_K)
      (by simpa [edgeDist] using sound core.G_X_E)
      (by simpa [edgeDist] using sound core.G_X_K)
      (by simpa [edgeDist] using sound core.K_O_Y)
      (by simpa [edgeDist] using sound core.K_O_G)
      (by simpa [edgeDist] using sound core.O_A_E)
      (by simpa [edgeDist] using sound core.X_Z_G)
      (by simpa [edgeDist] using sound core.X_Z_F)
      (by simpa [edgeDist] using sound core.Y_O_X)
      (by simpa [edgeDist] using sound core.Y_O_Z)
      (by simpa [edgeDist] using sound core.Z_A_Y)
      (by simpa [edgeDist] using sound core.Z_A_G)
  exact core.hOA (hreal.injective hcollision)

#print axioms not_realizes_of_bankCleanFifteenCollisionCore

end EqualityCore
end Census554
end Problem97
