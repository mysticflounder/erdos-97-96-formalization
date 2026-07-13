/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.CardElevenBlocker
import Erdos9796Proof.P97.ErasedCertificate.ErasedNativeClassifier

/-!
# ERASE card-eleven finite shell bridge

Packages the geometric carrier/blocker constructions as the finite shell
predicates consumed by classifier soundness.
-/

namespace Problem97
namespace ErasedCertificate

open scoped EuclideanGeometry

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedCarrierBridge
open ErasedNativeClassifier

/-- Generic count-row geometry supplies the corresponding finite shell. -/
theorem ErasedShellGeometry.toErasedRowShellOK
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    {centerBucket sameBucket leftBucket rightBucket : Finset Label}
    {m s l r : Nat}
    (G : ErasedShellGeometry S x p centerBucket sameBucket
      leftBucket rightBucket m s l r) :
    ErasedRowShellOK (patternCode G.L G.F)
      (erasedBlocker G.H G.L G.F (G.L.labelOf p))
      centerBucket sameBucket leftBucket rightBucket
      (G.L.labelOf p) (G.L.labelOf x) G.deleted m s l r := by
  refine ⟨?_, G.moser_card, G.same_card, G.left_card, G.right_card⟩
  exact ⟨G.center_mem, G.pin_mem, G.pin_mem_row, G.pin_ne_center,
    G.deleted_mem_intS, G.deleted_mem_row_zero,
    G.blocker_total, G.seed_blocker⟩

/-- Right count-row specialization. -/
theorem ErasedShellGeometry.toRightErasedRowShellOK
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    {m s l r : Nat} (G : RightErasedShellGeometry S x p m s l r) :
    RightErasedRowShellOK (patternCode G.L G.F)
      (erasedBlocker G.H G.L G.F (G.L.labelOf p))
      (G.L.labelOf p) (G.L.labelOf x) G.deleted m s l r :=
  G.toErasedRowShellOK

/-- Left count-row specialization. -/
theorem ErasedShellGeometry.toLeftErasedRowShellOK
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    {m s l r : Nat} (G : LeftErasedShellGeometry S x p m s l r) :
    LeftErasedRowShellOK (patternCode G.L G.F)
      (erasedBlocker G.H G.L G.F (G.L.labelOf p))
      (G.L.labelOf p) (G.L.labelOf x) G.deleted m s l r :=
  G.toErasedRowShellOK

/-- Generic P4 geometry supplies the common finite seed shell. -/
theorem ErasedP4ShellGeometry.toErasedSeedShellOK
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    {centerBucket : Finset Label}
    (G : ErasedP4ShellGeometry S x p centerBucket) :
    ErasedSeedShellOK (patternCode G.L G.F)
      (erasedBlocker G.H G.L G.F (G.L.labelOf p))
      centerBucket (G.L.labelOf p) (G.L.labelOf x) G.deleted :=
  ⟨G.center_mem, G.pin_mem, G.pin_mem_row, G.pin_ne_center,
    G.deleted_mem_intS, G.deleted_mem_row_zero,
    G.blocker_total, G.seed_blocker⟩

/-- P4-S geometry supplies its finite shell predicate. -/
theorem ErasedP4ShellGeometry.toP4SErasedShellOK
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    (G : ErasedP4ShellGeometry S x p intS) :
    P4SErasedShellOK (patternCode G.L G.F)
      (erasedBlocker G.H G.L G.F (G.L.labelOf p))
      (G.L.labelOf p) (G.L.labelOf x) G.deleted :=
  G.toErasedSeedShellOK

/-- Containment-specialized P4-U geometry supplies the exact finite shell
used by `erasedP4UPlacementCheck`. -/
theorem P4UContainmentErasedShellGeometry.toP4UErasedShellOK
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (G : P4UContainmentErasedShellGeometry S x) :
    P4UErasedShellOK (patternCode G.L G.F)
      (erasedBlocker G.H G.L G.F 0) (G.L.labelOf x) G.deleted := by
  have hcenter :
      G.L.labelOf (S.oppositeVertexByIndex S.surplusIdx) = 0 := by
    simpa using G.center_mem
  have hpinRow : G.L.labelOf x ∈ row (patternCode G.L G.F) 0 := by
    simpa [hcenter] using G.pin_mem_row
  have hpinNe : G.L.labelOf x ≠ 0 := by
    simpa [hcenter] using G.pin_ne_center
  have htotal : ∀ q,
      erasedBlocker G.H G.L G.F 0 q ≠ q ∧
        q ∈ row (patternCode G.L G.F)
          (erasedBlocker G.H G.L G.F 0 q) := by
    simpa [hcenter] using G.blocker_total
  have hseed : ∀ q, q ∈ row (patternCode G.L G.F) 0 →
      erasedBlocker G.H G.L G.F 0 q = 0 := by
    simpa [hcenter] using G.seed_blocker
  refine ⟨?_, G.first_opp_row, G.second_opp_row, G.moser_pair⟩
  exact ⟨by simp, G.pin_mem, hpinRow, hpinNe,
    G.deleted_mem_intS, G.deleted_mem_row_zero, htotal, hseed⟩

end ErasedCertificate
end Problem97
