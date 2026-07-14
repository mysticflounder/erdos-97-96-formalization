/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import «nested_equal_chord_producer_adapter»

/-!
# Live producer boundary for the nested equal-chord obstruction

This scratch file separates the part forced by every faithful critical-shell
system from the genuinely missing incidence producer.

For any chosen source row, its four support labels can be enumerated in cyclic
boundary order after cutting at the blocker center.  Consequently, the
smallest additional data needed by the nested equal-chord consumer are four
global-row memberships: the row at the first cyclic support label contains the
outer pair, and the row at the second contains the inner pair.  No additional
critical-shell provenance is needed because `FaithfulCarrierPattern` already
supplies a selected row at every carrier center.

The companion analysis records the exact-realizable four-row residual showing
why critical-shell provenance and cyclic order alone do not force these global
pair incidences.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace GeneralCarrierBridge
namespace NestedEqualChordLiveProducer

open EqualityCore
open NestedEqualChordProducerAdapter

/-- Boundary index measured cyclically from a fixed cut. -/
private def cyclicKey {A : Finset ℝ²} (B : BoundaryIndexing A)
    (cut : Fin B.n) (z : CarrierLabel A) : Fin B.n :=
  B.indexOf z - cut

private theorem cyclicKey_injective
    {A : Finset ℝ²} (B : BoundaryIndexing A) [NeZero B.n]
    (cut : Fin B.n) :
    Function.Injective (cyclicKey B cut) := by
  intro x y hxy
  apply B.index_injective
  have hsum := congrArg (fun z : Fin B.n => z + cut) hxy
  simpa [cyclicKey] using hsum

/-- One chosen blocker row, canonically enumerated after its center in the
cyclic boundary order.  Membership of all four labels is part of the record so
downstream incidence consumers do not have to unfold the enumeration. -/
structure OrderedBlockerRow {A : Finset ℝ²}
    (F : FaithfulCarrierPattern A) (H : CriticalShellSystem A)
    (B : BoundaryIndexing A) where
  sourceO : CarrierLabel A
  o : CarrierLabel A
  a : CarrierLabel A
  b : CarrierLabel A
  c : CarrierLabel A
  d : CarrierLabel A
  centerO : blockerLabel H sourceO.1 sourceO.2 = o
  a_mem_o : a ∈ rowPattern F o
  b_mem_o : b ∈ rowPattern F o
  c_mem_o : c ∈ rowPattern F o
  d_mem_o : d ∈ rowPattern F o
  order : BoundaryFiveOrder B o a b c d

/-- Every chosen critical blocker row has an ordered four-label enumeration.

This theorem discharges the cyclic-order half of the prospective producer. It
uses only row cardinality, exclusion of the row center, and the boundary
indexing; no cap, MEC, or no-`M44` hypothesis is needed. -/
noncomputable def orderedBlockerRow
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (B : BoundaryIndexing A)
    (sourceO : CarrierLabel A) : OrderedBlockerRow F H B := by
  let o : CarrierLabel A := blockerLabel H sourceO.1 sourceO.2
  let P : Finset (CarrierLabel A) := rowPattern F o
  have hPcard : P.card = 4 := by
    simpa [P] using rowPattern_card F o
  let cut : Fin B.n := B.indexOf o
  letI : NeZero B.n :=
    ⟨Nat.ne_of_gt (lt_of_le_of_lt (Nat.zero_le cut.val) cut.isLt)⟩
  letI : LinearOrder (CarrierLabel A) :=
    LinearOrder.lift' (cyclicKey B cut) (cyclicKey_injective B cut)
  let e : Fin 4 ≃o {z // z ∈ P} := P.orderIsoOfFin hPcard
  let a : CarrierLabel A := (e 0).1
  let b : CarrierLabel A := (e 1).1
  let c : CarrierLabel A := (e 2).1
  let d : CarrierLabel A := (e 3).1
  have haP : a ∈ P := (e 0).2
  have hbP : b ∈ P := (e 1).2
  have hcP : c ∈ P := (e 2).2
  have hdP : d ∈ P := (e 3).2
  have hoP : o ∉ P := by
    intro ho
    have hosupport :
        o.1 ∈ (F.classAt o.1 o.2).support :=
      (mem_rowPattern_iff F o o).mp (by simpa [P] using ho)
    exact (F.classAt o.1 o.2).center_not_mem hosupport
  have hkey_a_ne : cyclicKey B cut a ≠ 0 := by
    intro hzero
    have hindex : B.indexOf a = cut := sub_eq_zero.mp hzero
    have hao : a = o := by
      apply B.index_injective
      simpa [cut] using hindex
    exact hoP (by simpa [hao] using haP)
  have h0a : (0 : Fin B.n) < cyclicKey B cut a :=
    Fin.pos_iff_ne_zero.mpr hkey_a_ne
  have hab : cyclicKey B cut a < cyclicKey B cut b := by
    have h : (e 0).1 < (e 1).1 :=
      e.strictMono (show (0 : Fin 4) < 1 by decide)
    change cyclicKey B cut (e 0).1 < cyclicKey B cut (e 1).1 at h
    simpa [a, b] using h
  have hbc : cyclicKey B cut b < cyclicKey B cut c := by
    have h : (e 1).1 < (e 2).1 :=
      e.strictMono (show (1 : Fin 4) < 2 by decide)
    change cyclicKey B cut (e 1).1 < cyclicKey B cut (e 2).1 at h
    simpa [b, c] using h
  have hcd : cyclicKey B cut c < cyclicKey B cut d := by
    have h : (e 2).1 < (e 3).1 :=
      e.strictMono (show (2 : Fin 4) < 3 by decide)
    change cyclicKey B cut (e 2).1 < cyclicKey B cut (e 3).1 at h
    simpa [c, d] using h
  refine {
    sourceO := sourceO
    o := o
    a := a
    b := b
    c := c
    d := d
    centerO := rfl
    a_mem_o := by simpa [P] using haP
    b_mem_o := by simpa [P] using hbP
    c_mem_o := by simpa [P] using hcP
    d_mem_o := by simpa [P] using hdP
    order := {
      cut := cut
      io := 0
      ia := cyclicKey B cut a
      ib := cyclicKey B cut b
      ic := cyclicKey B cut c
      id := cyclicKey B cut d
      io_lt_ia := h0a
      ia_lt_ib := hab
      ib_lt_ic := hbc
      ic_lt_id := hcd
      point_o := by simpa [cut, o] using B.point_eq o
      point_a := by
        simpa [cyclicKey] using B.point_eq a
      point_b := by
        simpa [cyclicKey] using B.point_eq b
      point_c := by
        simpa [cyclicKey] using B.point_eq c
      point_d := by
        simpa [cyclicKey] using B.point_eq d } }

/-- Smallest direct live output for the nested equal-chord consumer.  The
faithful pattern already has rows centered at `O.a` and `O.b`; the producer
only has to force the two indicated pairs into those rows. -/
structure GlobalNestedPairFields
    {A : Finset ℝ²} {F : FaithfulCarrierPattern A}
    {H : CriticalShellSystem A} {B : BoundaryIndexing A}
    (O : OrderedBlockerRow F H B) where
  o_mem_a : O.o ∈ rowPattern F O.a
  d_mem_a : O.d ∈ rowPattern F O.a
  o_mem_b : O.o ∈ rowPattern F O.b
  c_mem_b : O.c ∈ rowPattern F O.b

/-- Four global-row memberships added to one automatically ordered blocker row
construct the metric core directly. -/
def core_of_globalNestedPairFields
    {A : Finset ℝ²} {F : FaithfulCarrierPattern A}
    {H : CriticalShellSystem A} {B : BoundaryIndexing A}
    (O : OrderedBlockerRow F H B) (X : GlobalNestedPairFields O) :
    NestedEqualChordCore.Core (rowPattern F) :=
  core_of_three_rows O.order.o_ne_a
    O.a_mem_o O.b_mem_o O.c_mem_o O.d_mem_o
    X.o_mem_a X.d_mem_a X.o_mem_b X.c_mem_b

/-- The direct four-membership live producer closes the branch. -/
theorem false_of_globalNestedPairFields
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (B : BoundaryIndexing A)
    (O : OrderedBlockerRow F H B) (X : GlobalNestedPairFields O) : False := by
  exact false_of_core_of_boundaryFiveOrder F B
    (core_of_globalNestedPairFields O X) O.order

/-- Single proposition suitable as the conclusion of a live incidence
producer.  Any source may be used; its blocker row is ordered canonically. -/
def HasGlobalNestedPairProducer
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (B : BoundaryIndexing A) : Prop :=
  ∃ sourceO : CarrierLabel A,
    Nonempty (GlobalNestedPairFields (orderedBlockerRow F H B sourceO))

/-- Closure theorem at the exact proposed producer boundary. -/
theorem false_of_hasGlobalNestedPairProducer
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (B : BoundaryIndexing A)
    (h : HasGlobalNestedPairProducer F H B) : False := by
  rcases h with ⟨sourceO, ⟨X⟩⟩
  exact false_of_globalNestedPairFields F H B
    (orderedBlockerRow F H B sourceO) X

/-- The stronger critical-shell-only live incidence output after cyclic
enumeration has
been discharged.  It asks for two blocker rows extending the first two support
labels by the two nested opposite pairs. -/
structure CrossShellExtensions
    {A : Finset ℝ²} {F : FaithfulCarrierPattern A}
    {H : CriticalShellSystem A} {B : BoundaryIndexing A}
    (O : OrderedBlockerRow F H B) where
  sourceA : CarrierLabel A
  sourceB : CarrierLabel A
  centerA : blockerLabel H sourceA.1 sourceA.2 = O.a
  centerB : blockerLabel H sourceB.1 sourceB.2 = O.b
  o_mem_a : O.o.1 ∈
    (H.selectedAt sourceA.1 sourceA.2).toCriticalFourShell.support
  d_mem_a : O.d.1 ∈
    (H.selectedAt sourceA.1 sourceA.2).toCriticalFourShell.support
  o_mem_b : O.o.1 ∈
    (H.selectedAt sourceB.1 sourceB.2).toCriticalFourShell.support
  c_mem_b : O.c.1 ∈
    (H.selectedAt sourceB.1 sourceB.2).toCriticalFourShell.support

/-- Two cross-shell extensions of one automatically ordered blocker row give
the exact `NestedBlockerRows` consumer record. -/
def nestedBlockerRows_of_crossShellExtensions
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (B : BoundaryIndexing A)
    (O : OrderedBlockerRow F H B) (X : CrossShellExtensions O) :
    NestedBlockerRows H where
  sourceO := O.sourceO
  sourceA := X.sourceA
  sourceB := X.sourceB
  o := O.o
  a := O.a
  b := O.b
  c := O.c
  d := O.d
  centerO := O.centerO
  centerA := X.centerA
  centerB := X.centerB
  a_mem_o := (mem_blocker_row_iff F H O.sourceO O.a).mp (by
    rw [O.centerO]
    exact O.a_mem_o)
  b_mem_o := (mem_blocker_row_iff F H O.sourceO O.b).mp (by
    rw [O.centerO]
    exact O.b_mem_o)
  c_mem_o := (mem_blocker_row_iff F H O.sourceO O.c).mp (by
    rw [O.centerO]
    exact O.c_mem_o)
  d_mem_o := (mem_blocker_row_iff F H O.sourceO O.d).mp (by
    rw [O.centerO]
    exact O.d_mem_o)
  o_mem_a := X.o_mem_a
  d_mem_a := X.d_mem_a
  o_mem_b := X.o_mem_b
  c_mem_b := X.c_mem_b

/-- Exact closure proposition for a live producer: it is enough to produce two
cross-shell extensions for any one chosen source row. -/
theorem false_of_crossShellExtensions
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (B : BoundaryIndexing A)
    (O : OrderedBlockerRow F H B) (X : CrossShellExtensions O) : False := by
  exact false_of_nestedBlockerRows F H B
    (nestedBlockerRows_of_crossShellExtensions F H B O X) O.order

#print axioms orderedBlockerRow
#print axioms core_of_globalNestedPairFields
#print axioms false_of_globalNestedPairFields
#print axioms false_of_hasGlobalNestedPairProducer
#print axioms nestedBlockerRows_of_crossShellExtensions
#print axioms false_of_crossShellExtensions

end NestedEqualChordLiveProducer
end GeneralCarrierBridge
end Census554
end Problem97
