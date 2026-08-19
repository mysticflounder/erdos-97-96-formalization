/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstFiberFinitePacketIngress

/-!
# Order-preserving named-slot projection

The finite named support of a `CombinedIndexedPacket` is put in its canonical
increasing order and embedded into `Fin 52`.  The explicit `Fin.castLE` keeps
the target fixed while `Finset.orderIsoOfFin` supplies the order on the
support.  This module records only the named-support interface.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace FirstFiberOrderProjection

open FirstFiberFinitePacketIngress
open Census554.GeneralCarrierBridge

abbrev NamedSlot {n : ℕ} (packet : CombinedIndexedPacket n) :=
  {x : Fin n // x ∈ packet.namedSlots}

noncomputable def namedProjection {n : ℕ} (packet : CombinedIndexedPacket n) :
    NamedSlot packet → Fin 52 := fun x =>
  Fin.castLE packet.namedSlots_card_le
    ((packet.namedSlots.orderIsoOfFin rfl).symm x)

theorem namedProjection_injective {n : ℕ} (packet : CombinedIndexedPacket n) :
    Function.Injective (namedProjection packet) := by
  intro x y hxy
  apply Subtype.ext
  have hval :
      (((packet.namedSlots.orderIsoOfFin rfl).symm x : Fin packet.namedSlots.card).val) =
        (((packet.namedSlots.orderIsoOfFin rfl).symm y : Fin packet.namedSlots.card).val) := by
    simpa only [namedProjection, Fin.val_castLE] using congrArg Fin.val hxy
  have hfin :
      (packet.namedSlots.orderIsoOfFin rfl).symm x =
        (packet.namedSlots.orderIsoOfFin rfl).symm y := by
    exact Fin.ext hval
  exact congrArg Subtype.val ((packet.namedSlots.orderIsoOfFin rfl).symm.injective hfin)

theorem namedProjection_mem {n : ℕ} (packet : CombinedIndexedPacket n)
    (x : Fin n) (hx : x ∈ packet.namedSlots) :
    (⟨x, hx⟩ : NamedSlot packet).val ∈ packet.namedSlots :=
  hx

noncomputable def namedProjectionOption {n : ℕ} (packet : CombinedIndexedPacket n) :
    Fin n → Option (Fin 52) := fun x =>
  if hx : x ∈ packet.namedSlots then
    some (namedProjection packet ⟨x, hx⟩)
  else none

theorem namedProjectionOption_some_iff_named {n : ℕ}
    (packet : CombinedIndexedPacket n) (x : Fin n) :
    x ∈ packet.namedSlots ↔ ∃ j, namedProjectionOption packet x = some j := by
  by_cases hx : x ∈ packet.namedSlots
  · simp [namedProjectionOption, hx]
  · simp [namedProjectionOption, hx]

theorem namedProjection_strictMono {n : ℕ} (packet : CombinedIndexedPacket n) :
    StrictMono (fun x : NamedSlot packet => namedProjection packet x) := by
  intro x y hxy
  have horder :
      (packet.namedSlots.orderIsoOfFin rfl).symm x <
        (packet.namedSlots.orderIsoOfFin rfl).symm y := by
    exact (packet.namedSlots.orderIsoOfFin rfl).symm.strictMono hxy
  have hval :
      ((packet.namedSlots.orderIsoOfFin rfl).symm x).val <
        ((packet.namedSlots.orderIsoOfFin rfl).symm y).val := horder
  simpa only [namedProjection, Fin.lt_def, Fin.val_castLE] using hval

theorem namedProjection_lt_of_lt {n : ℕ} (packet : CombinedIndexedPacket n)
    {x y : Fin n} (hx : x ∈ packet.namedSlots) (hy : y ∈ packet.namedSlots)
    (hxy : x < y) :
    namedProjection packet ⟨x, hx⟩ < namedProjection packet ⟨y, hy⟩ := by
  apply namedProjection_strictMono packet
  exact hxy

end FirstFiberOrderProjection
end ATailFrontierLiveClosure
end Problem97
