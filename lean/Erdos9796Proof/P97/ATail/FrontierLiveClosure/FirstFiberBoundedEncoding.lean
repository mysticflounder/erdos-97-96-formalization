/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FirstFiberFinitePacketIngress

/-!
# Bounded named-slot encoding for a first-fiber packet pair

The named support of a `CombinedIndexedPacket` has cardinality at most `52`.
This file records a noncomputable injection of that support into `Fin 52`,
using `none` precisely for the complementary overflow labels.  It is only a
finite named-slot interface; it makes no assertion about the full carrier or
about any metric obstruction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace FirstFiberBoundedEncoding

open FirstFiberFinitePacketIngress
open Census554.GeneralCarrierBridge

abbrev NamedSlot {n : ℕ} (packet : CombinedIndexedPacket n) :=
  {x : Fin n // x ∈ packet.namedSlots}

private noncomputable def namedCardLE {n : ℕ} (packet : CombinedIndexedPacket n) :
    Fintype.card (NamedSlot packet) ≤ 52 := by
  simpa [NamedSlot] using packet.namedSlots_card_le

private noncomputable def namedIndex {n : ℕ} (packet : CombinedIndexedPacket n)
    (x : NamedSlot packet) : Fin 52 :=
  Fin.castLE (namedCardLE packet) ((Fintype.equivFin (NamedSlot packet)) x)

private theorem namedIndex_injective {n : ℕ} (packet : CombinedIndexedPacket n) :
    Function.Injective (namedIndex packet) := by
  intro x y hxy
  apply (Fintype.equivFin (NamedSlot packet)).injective
  apply Fin.ext
  exact congrArg (fun z : Fin 52 => z.val) hxy

private noncomputable def slotMap {n : ℕ} (packet : CombinedIndexedPacket n) :
    Fin n → Option (Fin 52) := fun x ↦
  if hx : x ∈ packet.namedSlots then some (namedIndex packet ⟨x, hx⟩) else none

structure BoundedNamedSlotEncoding {n : ℕ} (packet : CombinedIndexedPacket n) where
  slot : Fin n → Option (Fin 52)
  slot_named_iff_some : ∀ x, x ∈ packet.namedSlots ↔ ∃ j, slot x = some j
  slot_injective_on_named : Set.InjOn slot (packet.namedSlots : Set (Fin n))
  slot_none_iff_not_named : ∀ x, slot x = none ↔ x ∉ packet.namedSlots
  slot_none_iff_overflow : ∀ x, slot x = none ↔ x ∈ packet.overflow

private theorem slotMap_named_iff_some {n : ℕ} (packet : CombinedIndexedPacket n) (x : Fin n) :
    x ∈ packet.namedSlots ↔ ∃ j, slotMap packet x = some j := by
  by_cases hx : x ∈ packet.namedSlots
  · simp [slotMap, hx]
  · simp [slotMap, hx]

private theorem slotMap_injective_on_named {n : ℕ} (packet : CombinedIndexedPacket n) :
    Set.InjOn (slotMap packet) (packet.namedSlots : Set (Fin n)) := by
  intro x hx y hy hxy
  have hx' : x ∈ packet.namedSlots := hx
  have hy' : y ∈ packet.namedSlots := hy
  have hindex :
      namedIndex packet ⟨x, hx'⟩ = namedIndex packet ⟨y, hy'⟩ := by
    simpa [slotMap, hx', hy'] using hxy
  have hsub : (⟨x, hx'⟩ : NamedSlot packet) = ⟨y, hy'⟩ :=
    namedIndex_injective packet hindex
  exact congrArg Subtype.val hsub

private theorem slotMap_none_iff_not_named {n : ℕ} (packet : CombinedIndexedPacket n)
    (x : Fin n) : slotMap packet x = none ↔ x ∉ packet.namedSlots := by
  by_cases hx : x ∈ packet.namedSlots
  · simp [slotMap, hx]
  · simp [slotMap, hx]

private theorem slotMap_none_iff_overflow {n : ℕ} (packet : CombinedIndexedPacket n)
    (x : Fin n) : slotMap packet x = none ↔ x ∈ packet.overflow := by
  rw [slotMap_none_iff_not_named]
  exact (packet.overflow_complete x).symm

noncomputable def boundedNamedSlotEncoding {n : ℕ} (packet : CombinedIndexedPacket n) :
    BoundedNamedSlotEncoding packet :=
  { slot := slotMap packet
    slot_named_iff_some := slotMap_named_iff_some packet
    slot_injective_on_named := slotMap_injective_on_named packet
    slot_none_iff_not_named := slotMap_none_iff_not_named packet
    slot_none_iff_overflow := slotMap_none_iff_overflow packet }

theorem exists_boundedNamedSlotEncoding {n : ℕ} (packet : CombinedIndexedPacket n) :
    Nonempty (BoundedNamedSlotEncoding packet) :=
  ⟨boundedNamedSlotEncoding packet⟩

theorem boundedNamedSlotEncoding_named_iff_some {n : ℕ}
    (packet : CombinedIndexedPacket n) (x : Fin n) :
    x ∈ packet.namedSlots ↔
      ∃ j, (boundedNamedSlotEncoding packet).slot x = some j := by
  exact (boundedNamedSlotEncoding packet).slot_named_iff_some x

theorem boundedNamedSlotEncoding_injective_on_named {n : ℕ}
    (packet : CombinedIndexedPacket n) :
    Set.InjOn (boundedNamedSlotEncoding packet).slot
      (packet.namedSlots : Set (Fin n)) :=
  (boundedNamedSlotEncoding packet).slot_injective_on_named

theorem boundedNamedSlotEncoding_none_iff_not_named {n : ℕ}
    (packet : CombinedIndexedPacket n) (x : Fin n) :
    (boundedNamedSlotEncoding packet).slot x = none ↔ x ∉ packet.namedSlots :=
  (boundedNamedSlotEncoding packet).slot_none_iff_not_named x

theorem boundedNamedSlotEncoding_none_iff_overflow {n : ℕ}
    (packet : CombinedIndexedPacket n) (x : Fin n) :
    (boundedNamedSlotEncoding packet).slot x = none ↔ x ∈ packet.overflow :=
  (boundedNamedSlotEncoding packet).slot_none_iff_overflow x

theorem exists_roleCombinationPacket_with_boundedNamedSlotEncoding {n : ℕ}
    (hpackets : Nonempty (RoleCombinationPacket n)) :
    ∃ packet : RoleCombinationPacket n,
      Nonempty (BoundedNamedSlotEncoding packet.combinedPacket) := by
  rcases hpackets with ⟨packet⟩
  exact ⟨packet, exists_boundedNamedSlotEncoding packet.combinedPacket⟩

theorem exists_indexed_roleCombinationPacket_with_boundedNamedSlotEncoding
    {D : CounterexampleData}
    (hpackets : ∃ I : BoundaryIndexing D.A, Nonempty (RoleCombinationPacket I.n)) :
    ∃ I : BoundaryIndexing D.A, ∃ packet : RoleCombinationPacket I.n,
      Nonempty (BoundedNamedSlotEncoding packet.combinedPacket) := by
  rcases hpackets with ⟨I, hI⟩
  rcases exists_roleCombinationPacket_with_boundedNamedSlotEncoding hI with ⟨packet, hpacket⟩
  exact ⟨I, packet, hpacket⟩

end FirstFiberBoundedEncoding
end ATailFrontierLiveClosure
end Problem97
