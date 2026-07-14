/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Census554.NestedEqualChordCore

/-!
# Producer adapter for the nested equal-chord core

This scratch adapter isolates the exact theorem-facing output required from a
finite incidence/order producer.  Three critical-shell rows suffice:

* the row centered at `o` contains `a,b,c,d`;
* the row centered at `a` contains `o,d`; and
* the row centered at `b` contains `o,c`.

If `o,a,b,c,d` occur in that cyclic order on a convex boundary, those rows
construct `NestedEqualChordCore.Core`; the existing metric-orientation theorem
then gives `False`.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace GeneralCarrierBridge
namespace NestedEqualChordProducerAdapter

open EqualityCore

/-- A five-label increasing subsequence after one cyclic cut of a boundary
indexing.  This is the order datum emitted by the finite shadow when it scans
the labels in cyclic boundary order. -/
structure BoundaryFiveOrder {A : Finset ℝ²} (B : BoundaryIndexing A)
    (o a b c d : CarrierLabel A) where
  cut : Fin B.n
  io : Fin B.n
  ia : Fin B.n
  ib : Fin B.n
  ic : Fin B.n
  id : Fin B.n
  io_lt_ia : io < ia
  ia_lt_ib : ia < ib
  ib_lt_ic : ib < ic
  ic_lt_id : ic < id
  point_o : B.boundary (io + cut) = pointOf o
  point_a : B.boundary (ia + cut) = pointOf a
  point_b : B.boundary (ib + cut) = pointOf b
  point_c : B.boundary (ic + cut) = pointOf c
  point_d : B.boundary (id + cut) = pointOf d

/-- The cyclic-order witness already supplies the only distinctness fact used
by the metric core. -/
theorem BoundaryFiveOrder.o_ne_a
    {A : Finset ℝ²} {B : BoundaryIndexing A}
    {o a b c d : CarrierLabel A} (h : BoundaryFiveOrder B o a b c d) :
    o ≠ a := by
  intro hoa
  have hshift : h.io + h.cut = h.ia + h.cut := by
    apply B.boundary_injective
    rw [h.point_o, h.point_a, hoa]
  exact (ne_of_lt h.io_lt_ia) (add_left_injective h.cut hshift)

/-- Three rows with the nested equal-chord incidence pattern construct the
generic equality-closure core. -/
def core_of_three_rows
    {α : Type*} {P : RowPattern α} {o a b c d : α}
    (hoa : o ≠ a)
    (ha_o : a ∈ P o) (hb_o : b ∈ P o)
    (hc_o : c ∈ P o) (hd_o : d ∈ P o)
    (ho_a : o ∈ P a) (hd_a : d ∈ P a)
    (ho_b : o ∈ P b) (hc_b : c ∈ P b) :
    NestedEqualChordCore.Core P where
  o := o
  a := a
  b := b
  c := c
  d := d
  hoa := hoa
  oa_ob := EdgeClosure.row o a b ha_o hb_o
  oa_oc := EdgeClosure.row o a c ha_o hc_o
  oa_od := EdgeClosure.row o a d ha_o hd_o
  oa_ad := EdgeClosure.trans (EdgeClosure.flip o a)
    (EdgeClosure.row a o d ho_a hd_a)
  oa_bc := EdgeClosure.trans (EdgeClosure.row o a b ha_o hb_o)
    (EdgeClosure.trans (EdgeClosure.flip o b)
      (EdgeClosure.row b o c ho_b hc_b))

/-- A nested equal-chord core whose labels occur in the required cyclic order
contradicts the faithful carrier realization. -/
theorem false_of_core_of_boundaryFiveOrder
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (B : BoundaryIndexing A)
    (core : NestedEqualChordCore.Core (rowPattern F))
    (horder : BoundaryFiveOrder B core.o core.a core.b core.c core.d) :
    False := by
  have hneg : ∀ {i j k : Fin B.n}, i < j → j < k →
      signedArea2
        (B.boundary (i + horder.cut))
        (B.boundary (j + horder.cut))
        (B.boundary (k + horder.cut)) < 0 :=
    hneg_cyclicShift
      (hneg_of_ccw B.boundary_injective B.boundary_ccw) horder.cut
  have hoad := hneg horder.io_lt_ia
    (horder.ia_lt_ib.trans (horder.ib_lt_ic.trans horder.ic_lt_id))
  have hobc := hneg (horder.io_lt_ia.trans horder.ia_lt_ib)
    horder.ib_lt_ic
  have habd := hneg horder.ia_lt_ib
    (horder.ib_lt_ic.trans horder.ic_lt_id)
  have hbcd := hneg horder.ib_lt_ic horder.ic_lt_id
  rw [horder.point_o, horder.point_a, horder.point_d] at hoad
  rw [horder.point_o, horder.point_b, horder.point_c] at hobc
  rw [horder.point_a, horder.point_b, horder.point_d] at habd
  rw [horder.point_b, horder.point_c, horder.point_d] at hbcd
  exact NestedEqualChordCore.false_of_core_of_neg
    (realizes F) core hoad hobc habd hbcd

/-- Membership in a critical blocker shell is exactly membership in the
faithful carrier row at that blocker center. -/
theorem mem_blocker_row_iff
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (source z : CarrierLabel A) :
    z ∈ rowPattern F (blockerLabel H source.1 source.2) ↔
      z.1 ∈ (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
  calc
    z ∈ rowPattern F (blockerLabel H source.1 source.2) ↔
        z.1 ∈ (F.classAt (blockerLabel H source.1 source.2).1
          (blockerLabel H source.1 source.2).2).support :=
      mem_rowPattern_iff F (blockerLabel H source.1 source.2) z
    _ ↔ z.1 ∈
        (H.selectedAt source.1 source.2).toCriticalFourShell.support := by
      rw [blocker_row_support_eq_shell F H source.1 source.2]

/-- Exact shell-system witness for the three rows used by the nested
equal-chord obstruction.  No metric hypotheses remain: the shell memberships
are sufficient to generate every equality edge in the core. -/
structure NestedBlockerRows {A : Finset ℝ²} (H : CriticalShellSystem A) where
  sourceO : CarrierLabel A
  sourceA : CarrierLabel A
  sourceB : CarrierLabel A
  o : CarrierLabel A
  a : CarrierLabel A
  b : CarrierLabel A
  c : CarrierLabel A
  d : CarrierLabel A
  centerO : blockerLabel H sourceO.1 sourceO.2 = o
  centerA : blockerLabel H sourceA.1 sourceA.2 = a
  centerB : blockerLabel H sourceB.1 sourceB.2 = b
  a_mem_o : a.1 ∈
    (H.selectedAt sourceO.1 sourceO.2).toCriticalFourShell.support
  b_mem_o : b.1 ∈
    (H.selectedAt sourceO.1 sourceO.2).toCriticalFourShell.support
  c_mem_o : c.1 ∈
    (H.selectedAt sourceO.1 sourceO.2).toCriticalFourShell.support
  d_mem_o : d.1 ∈
    (H.selectedAt sourceO.1 sourceO.2).toCriticalFourShell.support
  o_mem_a : o.1 ∈
    (H.selectedAt sourceA.1 sourceA.2).toCriticalFourShell.support
  d_mem_a : d.1 ∈
    (H.selectedAt sourceA.1 sourceA.2).toCriticalFourShell.support
  o_mem_b : o.1 ∈
    (H.selectedAt sourceB.1 sourceB.2).toCriticalFourShell.support
  c_mem_b : c.1 ∈
    (H.selectedAt sourceB.1 sourceB.2).toCriticalFourShell.support

/-- Convert the shell-system incidence witness into the generic nested
equal-chord equality core on the faithful carrier row pattern. -/
def core_of_nestedBlockerRows
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (W : NestedBlockerRows H)
    (hoa : W.o ≠ W.a) :
    NestedEqualChordCore.Core (rowPattern F) := by
  apply core_of_three_rows hoa
  · rw [← W.centerO]
    exact (mem_blocker_row_iff F H W.sourceO W.a).mpr W.a_mem_o
  · rw [← W.centerO]
    exact (mem_blocker_row_iff F H W.sourceO W.b).mpr W.b_mem_o
  · rw [← W.centerO]
    exact (mem_blocker_row_iff F H W.sourceO W.c).mpr W.c_mem_o
  · rw [← W.centerO]
    exact (mem_blocker_row_iff F H W.sourceO W.d).mpr W.d_mem_o
  · rw [← W.centerA]
    exact (mem_blocker_row_iff F H W.sourceA W.o).mpr W.o_mem_a
  · rw [← W.centerA]
    exact (mem_blocker_row_iff F H W.sourceA W.d).mpr W.d_mem_a
  · rw [← W.centerB]
    exact (mem_blocker_row_iff F H W.sourceB W.o).mpr W.o_mem_b
  · rw [← W.centerB]
    exact (mem_blocker_row_iff F H W.sourceB W.c).mpr W.c_mem_b

/-- Complete adapter: a three-blocker incidence witness plus the matching
five-label cyclic order closes the faithful-carrier branch. -/
theorem false_of_nestedBlockerRows
    {A : Finset ℝ²} (F : FaithfulCarrierPattern A)
    (H : CriticalShellSystem A) (B : BoundaryIndexing A)
    (W : NestedBlockerRows H)
    (horder : BoundaryFiveOrder B W.o W.a W.b W.c W.d) : False := by
  let core := core_of_nestedBlockerRows F H W horder.o_ne_a
  apply false_of_core_of_boundaryFiveOrder F B
    core
  simpa [core, core_of_nestedBlockerRows, core_of_three_rows] using horder

#print axioms core_of_three_rows
#print axioms false_of_core_of_boundaryFiveOrder
#print axioms mem_blocker_row_iff
#print axioms core_of_nestedBlockerRows
#print axioms false_of_nestedBlockerRows

end NestedEqualChordProducerAdapter
end GeneralCarrierBridge
end Census554
end Problem97
