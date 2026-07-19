/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity
import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Dumitrescu.L1

/-!
# Faithful whole-carrier bi-apex Kalmanson surface

This scratch file pins the smallest source-valid object corresponding to the
generic whole-carrier solver.  It has no fixed cardinality, cap profile, or
named finite roles.  It retains only:

* a CCW enumeration of the complete carrier by `Fin D.A.card`;
* one selected four-class at every carrier center, chosen from global K4;
* the original common `CriticalShellSystem`; and
* omission of both physical apices from that system's blocker image.

The row cardinality, source membership at blocker rows, exactness at blocker
rows, strong connectivity, two incidence bounds, and both strict Kalmanson
inequalities are proved below from existing production theorems.  They are not
extra fields or conjectural assumptions.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace WholeCarrierBiApexKalmansonSurfaceAudit

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open CapCrossingKalmansonBridge
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- A complete CCW carrier enumeration whose index type has definitionally
the ambient carrier cardinality. -/
structure WholeCarrierBoundaryIndexing (A : Finset ℝ²) where
  boundary : Fin A.card → ℝ²
  indexOf : CarrierLabel A → Fin A.card
  boundary_injective : Function.Injective boundary
  boundary_image : Finset.univ.image boundary = A
  boundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary
  index_injective : Function.Injective indexOf
  point_eq : ∀ label, boundary (indexOf label) = pointOf label

/-- Convexity and non-collinearity produce a CCW enumeration indexed by the
actual carrier cardinality. -/
theorem nonempty_wholeCarrierBoundaryIndexing
    {A : Finset ℝ²} (hconv : ConvexIndep A)
    (hncol : ¬ Collinear ℝ (A : Set ℝ²)) :
    Nonempty (WholeCarrierBoundaryIndexing A) := by
  classical
  rcases exists_isCcwConvexPolygon_of_convexIndep hconv hncol with
    ⟨n, _hn, boundary, hboundaryInj, hboundaryImage, hboundaryCcw⟩
  have hncard : n = A.card := by
    calc
      n = (Finset.univ : Finset (Fin n)).card := by simp
      _ = (Finset.univ.image boundary).card :=
        (Finset.card_image_of_injective _ hboundaryInj).symm
      _ = A.card := congrArg Finset.card hboundaryImage
  subst n
  have hex (label : CarrierLabel A) :
      ∃ i : Fin A.card, boundary i = label.1 := by
    have hmem : label.1 ∈ Finset.univ.image boundary := by
      rw [hboundaryImage]
      exact label.2
    rcases Finset.mem_image.mp hmem with ⟨i, _hi, hpoint⟩
    exact ⟨i, hpoint⟩
  let indexOf : CarrierLabel A → Fin A.card :=
    fun label ↦ Classical.choose (hex label)
  have hpoint : ∀ label, boundary (indexOf label) = pointOf label :=
    fun label ↦ Classical.choose_spec (hex label)
  have hindexInj : Function.Injective indexOf := by
    intro a b hab
    apply Subtype.ext
    calc
      a.1 = boundary (indexOf a) := (hpoint a).symm
      _ = boundary (indexOf b) := congrArg boundary hab
      _ = b.1 := hpoint b
  exact ⟨{
    boundary := boundary
    indexOf := indexOf
    boundary_injective := hboundaryInj
    boundary_image := hboundaryImage
    boundary_ccw := hboundaryCcw
    index_injective := hindexInj
    point_eq := hpoint }⟩

/-- The smallest faithful whole-carrier surface.  The concrete critical map
`H` and the complete parent remain indices rather than copied fields. -/
structure WholeCarrierBiApexKalmansonSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (_R : FrontierBiApexRobustResidual parent) : Type where
  indexing : WholeCarrierBoundaryIndexing D.A
  rows : FaithfulCarrierPattern D.A
  physical_apices_ne : S.oppApex1 ≠ S.oppApex2
  blocker_omits_firstApex :
    ∀ source, (H.blockerVertex source).1 ≠ S.oppApex1
  blocker_omits_secondApex :
    ∀ source, (H.blockerVertex source).1 ≠ S.oppApex2

/-- Every live bi-apex robust residual extracts the faithful whole-carrier
surface without a cardinality or profile split. -/
theorem nonempty_wholeCarrierBiApexKalmansonSurface
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (R : FrontierBiApexRobustResidual parent) :
    Nonempty (WholeCarrierBiApexKalmansonSurface R) := by
  have hncol : ¬ Collinear ℝ (D.A : Set ℝ²) :=
    D.convex.not_collinear_of_card_ge_three (by
      have hcard := parent.carrier_card_gt_nine
      omega)
  rcases nonempty_wholeCarrierBoundaryIndexing D.convex hncol with ⟨B⟩
  rcases exists_faithfulCarrierPattern_of_globalK4
      D.K4 parent.common.packet.center₁_mem_A with ⟨P⟩
  refine ⟨{
    indexing := B
    rows := P
    physical_apices_ne := parent.common.packet.centers_ne
    blocker_omits_firstApex := ?_
    blocker_omits_secondApex := ?_ }⟩
  · intro source hvalue
    apply R.firstApex_robust.blockerVertex_ne H source
      parent.common.packet.center₁_mem_A
    exact Subtype.ext hvalue
  · intro source hvalue
    apply R.secondApex_robust.blockerVertex_ne H source
      parent.common.packet.center₂_mem_A
    exact Subtype.ext hvalue

section DerivedFacts

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    {R : FrontierBiApexRobustResidual parent}
    (W : WholeCarrierBiApexKalmansonSurface R)

/-- The selected-witness edge relation represented by the whole-carrier row
system. -/
def SelectedWitnessEdge (center target : ℝ²) : Prop :=
  ∃ hcenter : center ∈ D.A,
    target ∈ (W.rows.classAt center hcenter).support

/-- Minimality makes the chosen selected-witness graph strongly connected on
the actual carrier. -/
theorem selectedWitnessEdge_reflTransGen
    {source target : ℝ²}
    (hsource : source ∈ D.A) (htarget : target ∈ D.A) :
    Relation.ReflTransGen (SelectedWitnessEdge W) source target := by
  classical
  let reachable : Finset ℝ² :=
    D.A.filter fun z ↦
      Relation.ReflTransGen (SelectedWitnessEdge W) source z
  have hreachable_nonempty : reachable.Nonempty := by
    refine ⟨source, Finset.mem_filter.mpr ⟨hsource, ?_⟩⟩
    exact Relation.ReflTransGen.refl
  have hreachable_subset : reachable ⊆ D.A := by
    intro z hz
    exact (Finset.mem_filter.mp hz).1
  have hreachable_closed :
      ∀ center : ℝ², ∀ hcenter : center ∈ reachable,
        (FaithfulCarrierPattern.classAt W.rows center
          (hreachable_subset hcenter)).support ⊆ reachable := by
    intro center hcenter z hz
    have hpath :
        Relation.ReflTransGen (SelectedWitnessEdge W) source center :=
      (Finset.mem_filter.mp hcenter).2
    have hedge : SelectedWitnessEdge W center z :=
      ⟨hreachable_subset hcenter, hz⟩
    exact Finset.mem_filter.mpr
      ⟨(FaithfulCarrierPattern.classAt W.rows center
          (hreachable_subset hcenter)).support_subset_A hz,
        hpath.tail hedge⟩
  have hreachable_eq : reachable = D.A :=
    FaithfulCarrierPattern.eq_carrier_of_nonempty_closed
      parent.minimal W.rows
      hreachable_nonempty hreachable_subset hreachable_closed
  have htarget_reachable : target ∈ reachable := by
    rw [hreachable_eq]
    exact htarget
  exact (Finset.mem_filter.mp htarget_reachable).2

/-- Each represented row has exactly four carrier labels. -/
theorem rowPattern_card (center : CarrierLabel D.A) :
    (Census554.GeneralCarrierBridge.rowPattern W.rows center).card = 4 :=
  Census554.GeneralCarrierBridge.rowPattern_card W.rows center

/-- A represented row never contains its own center. -/
theorem center_not_mem_rowPattern (center : CarrierLabel D.A) :
    center ∉ Census554.GeneralCarrierBridge.rowPattern W.rows center := by
  intro hcenter
  apply (W.rows.classAt center.1 center.2).center_not_mem
  exact (mem_rowPattern_iff W.rows center center).mp hcenter

/-- Distinct represented rows meet in at most two carrier labels. -/
theorem rowPattern_inter_card_le_two
    {left right : CarrierLabel D.A} (hne : left ≠ right) :
    ((Census554.GeneralCarrierBridge.rowPattern W.rows left) ∩
      Census554.GeneralCarrierBridge.rowPattern W.rows right).card ≤ 2 := by
  classical
  let Kleft := W.rows.classAt left.1 left.2
  let Kright := W.rows.classAt right.1 right.2
  let hits : Finset (CarrierLabel D.A) :=
    Census554.GeneralCarrierBridge.rowPattern W.rows left ∩
      Census554.GeneralCarrierBridge.rowPattern W.rows right
  let target : Finset ℝ² := Kleft.support ∩ Kright.support
  have hmaps : Set.MapsTo Subtype.val
      (↑hits : Set (CarrierLabel D.A)) (↑target : Set ℝ²) := by
    intro point hpoint
    have hrows := Finset.mem_inter.mp hpoint
    exact Finset.mem_inter.mpr
      ⟨(mem_rowPattern_iff W.rows left point).mp hrows.1,
        (mem_rowPattern_iff W.rows right point).mp hrows.2⟩
  have hinj : Set.InjOn Subtype.val (↑hits : Set (CarrierLabel D.A)) := by
    intro a _ha b _hb hab
    exact Subtype.ext hab
  have hle : hits.card ≤ target.card :=
    Finset.card_le_card_of_injOn Subtype.val hmaps hinj
  have hcenter_ne : left.1 ≠ right.1 := by
    intro h
    exact hne (Subtype.ext h)
  exact hle.trans
    (SelectedFourClass.inter_card_le_two Kleft Kright hcenter_ne)

/-- Any fixed pair of distinct carrier labels occurs together in selected
rows at at most two carrier centers. -/
theorem pair_hit_centers_card_le_two
    {left right : CarrierLabel D.A} (hne : left ≠ right) :
    ((Finset.univ : Finset (CarrierLabel D.A)).filter fun center ↦
      left ∈ Census554.GeneralCarrierBridge.rowPattern W.rows center ∧
      right ∈ Census554.GeneralCarrierBridge.rowPattern W.rows center).card ≤ 2 := by
  classical
  let hits : Finset (CarrierLabel D.A) :=
    Finset.univ.filter fun center ↦
      left ∈ Census554.GeneralCarrierBridge.rowPattern W.rows center ∧
      right ∈ Census554.GeneralCarrierBridge.rowPattern W.rows center
  let target : Finset ℝ² :=
    D.A.filter fun center ↦ dist center left.1 = dist center right.1
  have hmaps : Set.MapsTo Subtype.val
      (↑hits : Set (CarrierLabel D.A)) (↑target : Set ℝ²) := by
    intro center hcenter
    have hrows :
        left ∈ Census554.GeneralCarrierBridge.rowPattern W.rows center ∧
          right ∈ Census554.GeneralCarrierBridge.rowPattern W.rows center := by
      simpa [hits] using hcenter
    have hleft := (mem_rowPattern_iff W.rows center left).mp hrows.1
    have hright := (mem_rowPattern_iff W.rows center right).mp hrows.2
    exact Finset.mem_filter.mpr ⟨center.2, by
      rw [(W.rows.classAt center.1 center.2).support_eq_radius _ hleft,
        (W.rows.classAt center.1 center.2).support_eq_radius _ hright]⟩
  have hinj : Set.InjOn Subtype.val (↑hits : Set (CarrierLabel D.A)) := by
    intro a _ha b _hb hab
    exact Subtype.ext hab
  have hle : hits.card ≤ target.card :=
    Finset.card_le_card_of_injOn Subtype.val hmaps hinj
  have hpoint_ne : left.1 ≠ right.1 := by
    intro h
    exact hne (Subtype.ext h)
  have htarget : target.card ≤ 2 := by
    simpa [target] using
      Dumitrescu.perpBisector_apex_bound D.convex
        left.2 right.2 hpoint_ne
  change hits.card ≤ 2
  exact hle.trans htarget

/-- The actual critical blocker row contains its source in the represented
whole-carrier row system. -/
theorem source_mem_blocker_row (source : CarrierLabel D.A) :
    source ∈ Census554.GeneralCarrierBridge.rowPattern W.rows
      (blockerLabel H source.1 source.2) :=
  Census554.GeneralCarrierBridge.source_mem_blocker_row W.rows H source

/-- Every represented row at an actual blocker center is exact over the full
carrier, not merely a selected four-subset. -/
theorem exactAt_blocker (source : CarrierLabel D.A) :
    Census554.EqualityCore.ExactAt
      (Census554.GeneralCarrierBridge.rowPattern W.rows)
      (pointOf (A := D.A))
      (blockerLabel H source.1 source.2) :=
  Census554.GeneralCarrierBridge.exactAt_blocker
    W.rows H source.1 source.2

/-- The represented critical blocker map is fixed-point-free. -/
theorem blocker_ne_source (source : CarrierLabel D.A) :
    H.blockerVertex source ≠ source :=
  H.blockerVertex_ne source

/-- First strict Kalmanson inequality on every increasing boundary
quadruple. -/
theorem kalmanson_first
    {ia ib ic id : Fin D.A.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id) :
    dist (W.indexing.boundary ib) (W.indexing.boundary ic) +
        dist (W.indexing.boundary ia) (W.indexing.boundary id) <
      dist (W.indexing.boundary ia) (W.indexing.boundary ic) +
        dist (W.indexing.boundary ib) (W.indexing.boundary id) :=
  dist_add_dist_lt_diagonal_sum_of_ccw D.convex
    W.indexing.boundary_injective W.indexing.boundary_image
    W.indexing.boundary_ccw hiab hibc hicd

/-- Companion strict Kalmanson inequality on every increasing boundary
quadruple. -/
theorem kalmanson_second
    {ia ib ic id : Fin D.A.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id) :
    dist (W.indexing.boundary ia) (W.indexing.boundary ib) +
        dist (W.indexing.boundary ic) (W.indexing.boundary id) <
      dist (W.indexing.boundary ia) (W.indexing.boundary ic) +
        dist (W.indexing.boundary ib) (W.indexing.boundary id) :=
  complementary_dist_add_dist_lt_diagonal_sum_of_ccw D.convex
    W.indexing.boundary_injective W.indexing.boundary_image
    W.indexing.boundary_ccw hiab hibc hicd

/-- The carrier label represented by one complete boundary index. -/
def WholeCarrierBoundaryIndexing.labelAt
    {A : Finset ℝ²} (B : WholeCarrierBoundaryIndexing A)
    (i : Fin A.card) : CarrierLabel A :=
  ⟨B.boundary i, by
    have hmem : B.boundary i ∈ Finset.univ.image B.boundary :=
      Finset.mem_image_of_mem B.boundary (Finset.mem_univ i)
    exact (congrArg (fun carrier : Finset ℝ² => B.boundary i ∈ carrier)
      B.boundary_image).mp hmem⟩

@[simp] theorem WholeCarrierBoundaryIndexing.pointOf_labelAt
    {A : Finset ℝ²} (B : WholeCarrierBoundaryIndexing A)
    (i : Fin A.card) :
    pointOf (B.labelAt i) = B.boundary i := rfl

/-- Global equality closure may use arbitrarily many selected rows. If it
identifies the two sides in the first strict Kalmanson sum with the two
diagonals, the whole-carrier surface is contradictory. -/
theorem false_of_global_equal_sum_core
    {ia ib ic id : Fin D.A.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hbc_ac : Census554.EqualityCore.EdgeClosure
      (Census554.GeneralCarrierBridge.rowPattern W.rows)
      (W.indexing.labelAt ib, W.indexing.labelAt ic)
      (W.indexing.labelAt ia, W.indexing.labelAt ic))
    (had_bd : Census554.EqualityCore.EdgeClosure
      (Census554.GeneralCarrierBridge.rowPattern W.rows)
      (W.indexing.labelAt ia, W.indexing.labelAt id)
      (W.indexing.labelAt ib, W.indexing.labelAt id)) :
    False := by
  have hreal := Census554.GeneralCarrierBridge.realizes W.rows
  have hbc_ac_dist :
      dist (W.indexing.boundary ib) (W.indexing.boundary ic) =
        dist (W.indexing.boundary ia) (W.indexing.boundary ic) := by
    simpa only [Census554.EqualityCore.edgeDist,
      WholeCarrierBoundaryIndexing.pointOf_labelAt] using
      Census554.EqualityCore.EdgeClosure.sound hreal hbc_ac
  have had_bd_dist :
      dist (W.indexing.boundary ia) (W.indexing.boundary id) =
        dist (W.indexing.boundary ib) (W.indexing.boundary id) := by
    simpa only [Census554.EqualityCore.edgeDist,
      WholeCarrierBoundaryIndexing.pointOf_labelAt] using
      Census554.EqualityCore.EdgeClosure.sound hreal had_bd
  have hstrict := kalmanson_first W hiab hibc hicd
  linarith

/-- Companion global equality-closure consumer for the other strict
Kalmanson sum. -/
theorem false_of_global_complementary_equal_sum_core
    {ia ib ic id : Fin D.A.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hab_ac : Census554.EqualityCore.EdgeClosure
      (Census554.GeneralCarrierBridge.rowPattern W.rows)
      (W.indexing.labelAt ia, W.indexing.labelAt ib)
      (W.indexing.labelAt ia, W.indexing.labelAt ic))
    (hcd_bd : Census554.EqualityCore.EdgeClosure
      (Census554.GeneralCarrierBridge.rowPattern W.rows)
      (W.indexing.labelAt ic, W.indexing.labelAt id)
      (W.indexing.labelAt ib, W.indexing.labelAt id)) :
    False := by
  have hreal := Census554.GeneralCarrierBridge.realizes W.rows
  have hab_ac_dist :
      dist (W.indexing.boundary ia) (W.indexing.boundary ib) =
        dist (W.indexing.boundary ia) (W.indexing.boundary ic) := by
    simpa only [Census554.EqualityCore.edgeDist,
      WholeCarrierBoundaryIndexing.pointOf_labelAt] using
      Census554.EqualityCore.EdgeClosure.sound hreal hab_ac
  have hcd_bd_dist :
      dist (W.indexing.boundary ic) (W.indexing.boundary id) =
        dist (W.indexing.boundary ib) (W.indexing.boundary id) := by
    simpa only [Census554.EqualityCore.edgeDist,
      WholeCarrierBoundaryIndexing.pointOf_labelAt] using
      Census554.EqualityCore.EdgeClosure.sound hreal hcd_bd
  have hstrict := kalmanson_second W hiab hibc hicd
  linarith

end DerivedFacts

#print axioms nonempty_wholeCarrierBiApexKalmansonSurface
#print axioms selectedWitnessEdge_reflTransGen
#print axioms rowPattern_inter_card_le_two
#print axioms pair_hit_centers_card_le_two
#print axioms source_mem_blocker_row
#print axioms exactAt_blocker
#print axioms kalmanson_first
#print axioms kalmanson_second
#print axioms false_of_global_equal_sum_core
#print axioms false_of_global_complementary_equal_sum_core

end WholeCarrierBiApexKalmansonSurfaceAudit
end Problem97
