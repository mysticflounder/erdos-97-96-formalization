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

/-
## Replay-facing named subsets

The following maps accept a subset only together with a proof that it lies in
the packet's named support.  Thus the default value used by `namedSlotValue`
is never used to interpret an overflow label in a mapped named set.
-/

noncomputable def namedSlotValue {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (x : Fin n) : Fin 52 :=
  (encoding.slot x).getD 0

theorem namedSlotValue_spec {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) {x : Fin n}
    (hx : x ∈ packet.namedSlots) :
    encoding.slot x = some (namedSlotValue encoding x) := by
  rcases (encoding.slot_named_iff_some x).mp hx with ⟨j, hj⟩
  simp [namedSlotValue, hj]

noncomputable def namedSetMap {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (s : Finset (Fin n))
    (_hs : s ⊆ packet.namedSlots) : Finset (Fin 52) :=
  s.image (namedSlotValue encoding)

theorem namedSetMap_card {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (s : Finset (Fin n))
    (hs : s ⊆ packet.namedSlots) :
    (namedSetMap encoding s hs).card = s.card := by
  classical
  rw [namedSetMap, Finset.card_image_iff.mpr]
  intro a ha b hb hab
  apply encoding.slot_injective_on_named (hs ha) (hs hb)
  calc
    encoding.slot a = some (namedSlotValue encoding a) := namedSlotValue_spec encoding (hs ha)
    _ = some (namedSlotValue encoding b) := congrArg some hab
    _ = encoding.slot b := (namedSlotValue_spec encoding (hs hb)).symm

theorem namedSetMap_center_not_mem {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (s : Finset (Fin n))
    (hs : s ⊆ packet.namedSlots) {center : Fin n}
    (hcenter : center ∈ packet.namedSlots) (hcenter_not_mem : center ∉ s) :
    namedSlotValue encoding center ∉ namedSetMap encoding s hs := by
  intro hmem
  rcases Finset.mem_image.mp hmem with ⟨x, hx, hvalue⟩
  have hslot : encoding.slot center = encoding.slot x := by
    calc
      encoding.slot center = some (namedSlotValue encoding center) :=
        namedSlotValue_spec encoding hcenter
      _ = some (namedSlotValue encoding x) := congrArg some hvalue.symm
      _ = encoding.slot x := (namedSlotValue_spec encoding (hs hx)).symm
  have hcenter_eq : center = x :=
    encoding.slot_injective_on_named hcenter (hs hx) hslot
  exact hcenter_not_mem (hcenter_eq.symm ▸ hx)

structure MappedIndexedExactRow {n : ℕ} (row : IndexedExactRow n) where
  center : Fin 52
  support : Finset (Fin 52)
  support_card : support.card = 4
  center_not_mem : center ∉ support

noncomputable def mapIndexedExactRow {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (row : IndexedExactRow n)
    (hsupport : row.support ⊆ packet.namedSlots)
    (hcenter : row.center ∈ packet.namedSlots) : MappedIndexedExactRow row :=
  { center := namedSlotValue encoding row.center
    support := namedSetMap encoding row.support hsupport
    support_card := by
      rw [namedSetMap_card encoding row.support hsupport, row.support_card]
    center_not_mem := namedSetMap_center_not_mem encoding row.support hsupport hcenter
      row.center_not_mem }

theorem mapIndexedExactRow_support_card {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (row : IndexedExactRow n)
    (hsupport : row.support ⊆ packet.namedSlots)
    (hcenter : row.center ∈ packet.namedSlots) :
    (mapIndexedExactRow encoding row hsupport hcenter).support.card = 4 :=
  (mapIndexedExactRow encoding row hsupport hcenter).support_card

theorem mapIndexedExactRow_center_not_mem {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (row : IndexedExactRow n)
    (hsupport : row.support ⊆ packet.namedSlots)
    (hcenter : row.center ∈ packet.namedSlots) :
    (mapIndexedExactRow encoding row hsupport hcenter).center ∉
      (mapIndexedExactRow encoding row hsupport hcenter).support :=
  (mapIndexedExactRow encoding row hsupport hcenter).center_not_mem

theorem named_deleted_not_mem {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (s : Finset (Fin n))
    (hs : s ⊆ packet.namedSlots) {deleted : Fin n}
    (hdeleted : deleted ∈ packet.namedSlots) (hdeleted_not_mem : deleted ∉ s) :
    namedSlotValue encoding deleted ∉ namedSetMap encoding s hs :=
  namedSetMap_center_not_mem encoding s hs hdeleted hdeleted_not_mem

/-
## Packet-level row replay

The contract below is deliberately a source-side premise: it records namedness
of every row center and support before any replay map is formed.  In particular,
it does not infer row-center namedness from the packet's other fields.
-/

structure IndexedPacketNamedReplayContract {n : ℕ}
    (packet : CombinedIndexedPacket n) (source : IndexedPacket n) where
  row_center_named : ∀ row ∈ source.rows, row.center ∈ packet.namedSlots
  row_support_named : ∀ row ∈ source.rows, row.support ⊆ packet.namedSlots

structure MappedNamedExactRow where
  center : Fin 52
  support : Finset (Fin 52)
  support_card : support.card = 4
  center_not_mem : center ∉ support

noncomputable def mapNamedExactRow {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (row : IndexedExactRow n)
    (hsupport : row.support ⊆ packet.namedSlots)
    (hcenter : row.center ∈ packet.namedSlots) : MappedNamedExactRow :=
  { center := namedSlotValue encoding row.center
    support := namedSetMap encoding row.support hsupport
    support_card := by
      rw [namedSetMap_card encoding row.support hsupport, row.support_card]
    center_not_mem := namedSetMap_center_not_mem encoding row.support hsupport hcenter
      row.center_not_mem }

noncomputable def mapIndexedPacketRows {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (source : IndexedPacket n)
    (contract : IndexedPacketNamedReplayContract packet source) :
    List MappedNamedExactRow := by
  let hrows : ∀ row ∈ source.rows,
      row.center ∈ packet.namedSlots ∧ row.support ⊆ packet.namedSlots :=
    fun row hrow =>
      ⟨contract.row_center_named row hrow, contract.row_support_named row hrow⟩
  exact List.pmap
    (fun row hrow => mapNamedExactRow encoding row hrow.2 hrow.1)
    source.rows hrows

theorem mapIndexedPacketRows_length {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (source : IndexedPacket n)
    (contract : IndexedPacketNamedReplayContract packet source) :
    (mapIndexedPacketRows encoding source contract).length = 5 := by
  simpa [mapIndexedPacketRows] using source.rows_length

theorem mapIndexedPacketRows_support_card {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (source : IndexedPacket n)
    (contract : IndexedPacketNamedReplayContract packet source)
    {mapped : MappedNamedExactRow}
    (hmapped : mapped ∈ mapIndexedPacketRows encoding source contract) :
    mapped.support.card = 4 := by
  rcases (List.mem_pmap.mp hmapped) with ⟨row, hrow, hmap⟩
  rw [← hmap]
  exact (mapNamedExactRow encoding row
    (contract.row_support_named row hrow)
    (contract.row_center_named row hrow)).support_card

theorem mapIndexedPacketRows_center_not_mem {n : ℕ} {packet : CombinedIndexedPacket n}
    (encoding : BoundedNamedSlotEncoding packet) (source : IndexedPacket n)
    (contract : IndexedPacketNamedReplayContract packet source)
    {mapped : MappedNamedExactRow}
    (hmapped : mapped ∈ mapIndexedPacketRows encoding source contract) :
    mapped.center ∉ mapped.support := by
  rcases (List.mem_pmap.mp hmapped) with ⟨row, hrow, hmap⟩
  rw [← hmap]
  exact (mapNamedExactRow encoding row
    (contract.row_support_named row hrow)
    (contract.row_center_named row hrow)).center_not_mem

end FirstFiberBoundedEncoding
end ATailFrontierLiveClosure
end Problem97
