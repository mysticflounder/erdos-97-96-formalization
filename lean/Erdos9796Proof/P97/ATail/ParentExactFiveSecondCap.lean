/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionSharedCapOrder
import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionSingleOrbit
import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionSuccessor
import Erdos9796Proof.P97.U2NonSurplusOneHit
import Erdos9796Proof.P97.CircumcenterSide
import Erdos9796Proof.P97.ConvexIndepHelpers

/-!
# Exact-five physical second-cap parent reduction

The live exact-five second-cap branch retains one chosen `q`-deleted row at
each physical opposite apex.  The second row has at least two points in the
three-point physical exact-five interior, while the first row has at most one.
This gives a source-faithful physical point in the second row but outside the
first.

Independently, the global all-reverse physical-omission arm is impossible on
this exact-five cap.  Its three-cycle and three strict-cap positions would
have to contain three cyclic source pairs together with a blocker strictly
between every consecutive pair, which requires at least five positions.
Consequently the live branch reduces to one full-parent mutual-omission
residual.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace ATailParentExactFiveSecondCap

open ATailBiApexRobustCapBounds
open ATailCapApexRadiusRigidity
open ATailCriticalPairFrontier
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionSharedCapOrder
open ATailLargeCapUniqueFivePhysicalOmissionSingleOrbit
open ATailLargeCapUniqueFivePhysicalOmissionSuccessor
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Replace only the distinguished surplus packet, retaining the carrier and
all counterexample hypotheses definitionally. -/
private def withPacket
    (D : CounterexampleData) (S : SurplusCapPacket D.A) : CounterexampleData :=
  { A := D.A
    nonempty := D.nonempty
    convex := D.convex
    K4 := D.K4
    packet := S }

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

/-- A q-deleted selected row is contained in its complete ambient radius
class. -/
private theorem qDeleted_support_subset_ambientSelectedClass
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D q center B) :
    B ⊆ SelectedClass D.A center K.radius := by
  intro z hz
  have hzSkeleton : z ∈ D.skeleton q :=
    (Finset.mem_erase.mp (K.subset hz)).2
  have hzA : z ∈ D.A := (Finset.mem_erase.mp hzSkeleton).2
  exact mem_selectedClass.mpr ⟨hzA, K.same_radius z hz⟩

/-- The retained physical-second-apex row lies in the unique exact-five
ambient class. -/
theorem parentSecondRow_subset_physicalClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    R.common.packet.B₂ ⊆
      SelectedClass D.A S.oppApex2 profile.radius := by
  let C := R.common.packet
  have hsub : C.B₂ ⊆
      SelectedClass D.A S.oppApex2 C.row₂.radius :=
    qDeleted_support_subset_ambientSelectedClass C.row₂
  have hfour :
      4 ≤ (SelectedClass D.A S.oppApex2 C.row₂.radius).card :=
    C.B₂_card.ge.trans (Finset.card_le_card hsub)
  have hradius : C.row₂.radius = profile.radius :=
    profile.unique_K4_radius C.row₂.radius C.row₂.radius_pos hfour
  simpa [C, hradius] using hsub

/-- At least two retained second-row points lie in the physical exact-five
strict-cap set. -/
theorem two_le_physicalVertices_inter_parentSecondRow_card
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    2 ≤ (physicalVertices profile ∩ R.common.packet.B₂).card := by
  let P := physicalVertices profile
  let U := R.common.packet.B₂
  let E := SelectedClass D.A S.oppApex2 profile.radius
  have hPsub : P ⊆ E := Finset.inter_subset_left
  have hUsub : U ⊆ E := parentSecondRow_subset_physicalClass R profile
  have hunionSub : P ∪ U ⊆ E := Finset.union_subset hPsub hUsub
  have hunionCard : (P ∪ U).card ≤ 5 := by
    have := Finset.card_le_card hunionSub
    simpa [E, profile.class_card_eq_five] using this
  have hidentity := Finset.card_union_add_card_inter P U
  have hPthree : 3 ≤ P.card := physicalVertices_card_ge_three profile
  have hUfour : U.card = 4 := R.common.packet.B₂_card
  simpa [P, U, Finset.inter_comm] using (show 2 ≤ (P ∩ U).card by omega)

/-- The retained first-apex row meets the physical exact-five strict-cap set
in at most one point. -/
theorem physicalVertices_inter_parentFirstRow_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    (physicalVertices profile ∩ R.common.packet.B₁).card ≤ 1 := by
  let C := R.common.packet
  let D' := withPacket D S
  have hsub : physicalVertices profile ∩ C.B₁ ⊆
      (D'.A.filter (fun x ↦ dist x D'.packet.oppApex1 = C.row₁.radius)) ∩
        D'.packet.oppCap2 := by
    intro z hz
    rcases Finset.mem_inter.mp hz with ⟨hzPhysical, hzRow⟩
    have hzA : z ∈ D.A := PhysicalVertex.mem_A ⟨z, hzPhysical⟩
    have hzCapInterior : z ∈ S.capInteriorByIndex S.oppIndex2 :=
      PhysicalVertex.mem_capInterior ⟨z, hzPhysical⟩
    have hzCap : z ∈ S.oppCap2 := by
      rw [← capByIndex_oppIndex2_eq_oppCap2 S]
      exact S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hzCapInterior
    refine Finset.mem_inter.mpr ⟨Finset.mem_filter.mpr ⟨?_, ?_⟩, ?_⟩
    · simpa [D'] using hzA
    · simpa [D', dist_comm] using C.row₁.same_radius z hzRow
    · simpa [D'] using hzCap
  exact (Finset.card_le_card hsub).trans
    (U2NonSurplusSqueeze.oppApex1_otherCap_one_hit D' C.row₁.radius)

/-- The live parent rows contain a physical exact-five point in the second
row but outside the first row. -/
theorem exists_physicalVertex_mem_parentSecondRow_not_mem_parentFirstRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    ∃ x : PhysicalVertex profile,
      x.1 ∈ R.common.packet.B₂ ∧ x.1 ∉ R.common.packet.B₁ := by
  have htwo := two_le_physicalVertices_inter_parentSecondRow_card R profile
  have hone := physicalVertices_inter_parentFirstRow_card_le_one R profile
  by_contra hnone
  push_neg at hnone
  have hsub : physicalVertices profile ∩ R.common.packet.B₂ ⊆
      physicalVertices profile ∩ R.common.packet.B₁ := by
    intro x hx
    exact Finset.mem_inter.mpr ⟨(Finset.mem_inter.mp hx).1,
      hnone ⟨x, (Finset.mem_inter.mp hx).1⟩ (Finset.mem_inter.mp hx).2⟩
  have hcard := Finset.card_le_card hsub
  omega

/-- `b` lies strictly between `a` and `c` in either orientation. -/
def StrictBetween {α : Type*} [LT α] (a b c : α) : Prop :=
  (a < b ∧ b < c) ∨ (c < b ∧ b < a)

theorem StrictBetween.swap
    {α : Type*} [LT α] {a b c : α}
    (h : StrictBetween a b c) : StrictBetween c b a := by
  simpa [StrictBetween, or_comm] using h

set_option linter.flexible false in
private theorem five_le_card_of_two_adjacent_straddles
    {α : Type*} [LinearOrder α]
    (U : Finset α) (x y z bx bz : α)
    (hxU : x ∈ U) (hyU : y ∈ U) (hzU : z ∈ U)
    (hbxU : bx ∈ U) (hbzU : bz ∈ U)
    (hxy : x < y) (hyz : y < z)
    (hbx : StrictBetween x bx y)
    (hbz : StrictBetween y bz z) :
    5 ≤ U.card := by
  have hxbx : x < bx := by rcases hbx with h | h <;> order
  have hbxy : bx < y := by rcases hbx with h | h <;> order
  have hybz : y < bz := by rcases hbz with h | h <;> order
  have hbzz : bz < z := by rcases hbz with h | h <;> order
  let f : Fin 5 → ↑U := ![
    ⟨x, hxU⟩, ⟨bx, hbxU⟩, ⟨y, hyU⟩, ⟨bz, hbzU⟩, ⟨z, hzU⟩]
  have hf : Function.Injective f := by
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp [f] at hij ⊢ <;> order
  have hcard := Fintype.card_le_of_injective f hf
  simpa using hcard

/-- A three-cycle whose consecutive source pairs all strictly straddle
blockers in the same finite order requires at least five positions. -/
theorem five_le_card_of_periodThree_straddles
    {α : Type*} [LinearOrder α]
    (U : Finset α) (q0 q1 q2 b0 b1 b2 : α)
    (hq0U : q0 ∈ U) (hq1U : q1 ∈ U) (hq2U : q2 ∈ U)
    (hb0U : b0 ∈ U) (hb1U : b1 ∈ U) (hb2U : b2 ∈ U)
    (hq01 : q0 ≠ q1) (hq12 : q1 ≠ q2) (hq20 : q2 ≠ q0)
    (h0 : StrictBetween q0 b0 q1)
    (h1 : StrictBetween q1 b1 q2)
    (h2 : StrictBetween q2 b2 q0) :
    5 ≤ U.card := by
  rcases lt_trichotomy q0 q1 with h01 | h01 | h10
  · rcases lt_trichotomy q1 q2 with h12 | h12 | h21
    · exact five_le_card_of_two_adjacent_straddles U q0 q1 q2 b0 b1
        hq0U hq1U hq2U hb0U hb1U h01 h12 h0 h1
    · exact False.elim (hq12 h12)
    · rcases lt_or_gt_of_ne hq20.symm with h02 | h20
      · exact five_le_card_of_two_adjacent_straddles U q0 q2 q1 b2 b1
          hq0U hq2U hq1U hb2U hb1U h02 h21 h2.swap h1.swap
      · exact five_le_card_of_two_adjacent_straddles U q2 q0 q1 b2 b0
          hq2U hq0U hq1U hb2U hb0U h20 h01 h2 h0
  · exact False.elim (hq01 h01)
  · rcases lt_trichotomy q0 q2 with h02 | h02 | h20
    · exact five_le_card_of_two_adjacent_straddles U q1 q0 q2 b0 b2
        hq1U hq0U hq2U hb0U hb2U h10 h02 h0.swap h2.swap
    · exact False.elim (hq20 h02.symm)
    · rcases lt_trichotomy q1 q2 with h12 | h12 | h21
      · exact five_le_card_of_two_adjacent_straddles U q1 q2 q0 b1 b2
          hq1U hq2U hq0U hb1U hb2U h12 h20 h1 h2
      · exact False.elim (hq12 h12)
      · exact five_le_card_of_two_adjacent_straddles U q2 q1 q0 b1 b0
          hq2U hq1U hq0U hb1U hb0U h21 h10 h1.swap h0.swap

/-- Exact-five cap arithmetic leaves exactly three strict physical-cap
positions. -/
theorem physicalVertices_card_eq_three_of_exactFiveSecondCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    (physicalVertices profile).card = 3 := by
  have hinterior := capInteriorByIndex_card_add_two S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2 S, Q.secondOppCap_card_eq_five] at hinterior
  apply Nat.le_antisymm
  · exact (Finset.card_le_card Finset.inter_subset_right).trans (by omega)
  · exact physicalVertices_card_ge_three profile

/-- On the exact-five cap, the physical radius class saturates the entire
three-point strict cap. -/
theorem physicalVertices_eq_capInterior_of_exactFiveSecondCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    physicalVertices profile = S.capInteriorByIndex S.oppIndex2 := by
  apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
  have hphysical :
      (SelectedClass D.A S.oppApex2 profile.radius ∩
        S.capInteriorByIndex S.oppIndex2).card = 3 := by
    simpa only [physicalVertices] using
      physicalVertices_card_eq_three_of_exactFiveSecondCap Q profile
  have hinterior := capInteriorByIndex_card_add_two S S.oppIndex2
  rw [capByIndex_oppIndex2_eq_oppCap2 S,
    Q.secondOppCap_card_eq_five] at hinterior
  omega

private theorem oppApex2_mem_A
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ A := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v3_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v1_mem
  · simpa [SurplusCapPacket.oppApex2, hi] using S.triangle.v2_mem

private theorem physicalVertex_ne_physicalApex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (q : PhysicalVertex profile) :
    q.1 ≠ S.oppApex2 := by
  intro h
  have hdist :=
    (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass q)).2
  rw [h, dist_self] at hdist
  linarith [profile.radius_pos]

/-- Three distinct physical exact-five sources cannot form a non-obtuse
triangle. Their common physical apex would lie in their convex hull,
contradicting convex independence. -/
theorem not_nonobtuse_of_three_distinct_physicalVertices
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (a b c : PhysicalVertex profile)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c) :
    ¬ (0 ≤ ⟪b.1 - a.1, c.1 - a.1⟫_ℝ ∧
      0 ≤ ⟪c.1 - b.1, a.1 - b.1⟫_ℝ ∧
      0 ≤ ⟪a.1 - c.1, b.1 - c.1⟫_ℝ) := by
  rintro ⟨hinnerA, hinnerB, hinnerC⟩
  have habPoints : a.1 ≠ b.1 := fun h ↦ hab (Subtype.ext h)
  have hacPoints : a.1 ≠ c.1 := fun h ↦ hac (Subtype.ext h)
  have hbcPoints : b.1 ≠ c.1 := fun h ↦ hbc (Subtype.ext h)
  have harea : signedArea2 a.1 b.1 c.1 ≠ 0 := by
    intro hzero
    exact D.convex.not_three_collinear
      (PhysicalVertex.mem_A a) (PhysicalVertex.mem_A b)
      (PhysicalVertex.mem_A c) habPoints hacPoints hbcPoints
      (collinear_of_signedArea2_eq_zero a.1 b.1 c.1 hzero)
  have habDist : dist S.oppApex2 a.1 = dist S.oppApex2 b.1 :=
    (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass a)).2.trans
      (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass b)).2.symm
  have hacDist : dist S.oppApex2 a.1 = dist S.oppApex2 c.1 :=
    (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass a)).2.trans
      (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass c)).2.symm
  have hapexHull :
      S.oppApex2 ∈ convexHull ℝ ({a.1, b.1, c.1} : Set ℝ²) :=
    mem_convexHull_three_of_equidistant_nonobtuse harea habDist hacDist
      hinnerA hinnerB hinnerC
  have htripleSubset :
      ({a.1, b.1, c.1} : Set ℝ²) ⊆
        (D.A : Set ℝ²) \ {S.oppApex2} := by
    intro x hx
    rcases hx with (rfl | rfl | rfl)
    · exact ⟨by exact_mod_cast PhysicalVertex.mem_A a,
        by simpa using physicalVertex_ne_physicalApex a⟩
    · exact ⟨by exact_mod_cast PhysicalVertex.mem_A b,
        by simpa using physicalVertex_ne_physicalApex b⟩
    · exact ⟨by exact_mod_cast PhysicalVertex.mem_A c,
        by simpa using physicalVertex_ne_physicalApex c⟩
  exact D.convex S.oppApex2 (by exact_mod_cast oppApex2_mem_A S)
    (convexHull_mono htripleSubset hapexHull)

private theorem actualBlocker_not_mem_actualSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (q : PhysicalVertex profile) :
    H.centerAt q.1 (PhysicalVertex.mem_A q) ∉
      (H.selectedAt q.1
        (PhysicalVertex.mem_A q)).toCriticalFourShell.support := by
  intro hmem
  let K := (H.selectedAt q.1
    (PhysicalVertex.mem_A q)).toCriticalFourShell
  have hradius := K.support_eq_radius
    (H.centerAt q.1 (PhysicalVertex.mem_A q)) hmem
  rw [dist_self] at hradius
  linarith [K.radius_pos]

/-- Two physical hits in a source's actual critical row place its actual
blocker in the exact three-point physical set. -/
theorem actualBlocker_mem_physicalVertices_of_two_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (q x : PhysicalVertex profile) (hqx : q ≠ x)
    (hx : x.1 ∈
      (H.selectedAt q.1
        (PhysicalVertex.mem_A q)).toCriticalFourShell.support) :
    H.centerAt q.1 (PhysicalVertex.mem_A q) ∈ physicalVertices profile := by
  let K := (H.selectedAt q.1
    (PhysicalVertex.mem_A q)).toCriticalFourShell
  have hcenterA : H.centerAt q.1 (PhysicalVertex.mem_A q) ∈ D.A :=
    (Finset.mem_erase.mp K.center_mem).2
  have hcenterEq :
      dist (H.centerAt q.1 (PhysicalVertex.mem_A q)) q.1 =
        dist (H.centerAt q.1 (PhysicalVertex.mem_A q)) x.1 :=
    (K.support_eq_radius q.1 K.q_mem_support).trans
      (K.support_eq_radius x.1 hx).symm
  have hphysicalEq : dist S.oppApex2 q.1 = dist S.oppApex2 x.1 :=
    (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass q)).2.trans
      (mem_selectedClass.mp (PhysicalVertex.mem_radiusClass x)).2.symm
  have hcenterInterior :
      H.centerAt q.1 (PhysicalVertex.mem_A q) ∈
        S.capInteriorByIndex S.oppIndex2 :=
    commonPhysicalPair_center_mem_secondCapInterior
      hcenterA (transition_actualBlocker_ne_physicalApex (H := H) q)
      (PhysicalVertex.mem_capInterior q) (PhysicalVertex.mem_capInterior x)
      (fun h ↦ hqx (Subtype.ext h)) hcenterEq hphysicalEq
  rw [physicalVertices_eq_capInterior_of_exactFiveSecondCap Q profile]
  exact hcenterInterior

private theorem inner_nonneg_of_three_equal_distances
    (a b c : ℝ²)
    (hab_ac : dist a b = dist a c)
    (hab_bc : dist a b = dist b c) :
    0 ≤ ⟪b - a, c - a⟫_ℝ := by
  have hvec : (b - a) - (c - a) = b - c := by abel
  have hnormBA : ‖b - a‖ = dist a b := by
    rw [dist_eq_norm, norm_sub_rev]
  have hnormCA : ‖c - a‖ = dist a c := by
    rw [dist_eq_norm, norm_sub_rev]
  have hnormBC : ‖b - c‖ = dist b c := by
    rw [dist_eq_norm]
  have hidentity := norm_sub_sq_real (b - a) (c - a)
  rw [hvec, hnormBA, hnormCA, hnormBC, ← hab_ac, ← hab_bc] at hidentity
  nlinarith [sq_nonneg (dist a b)]

/-- The global all-reverse physical-omission arm is incompatible with an
exact-five physical second cap. -/
theorem false_of_all_omissions_reverseMembership_of_exactFiveSecondCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (hallReverse : ∀ q w : PhysicalVertex profile,
      w.1 ∉
          (H.selectedAt q.1
            (PhysicalVertex.mem_A q)).toCriticalFourShell.support →
        q.1 ∈
          (H.selectedAt w.1
            (PhysicalVertex.mem_A w)).toCriticalFourShell.support) :
    False := by
  classical
  rcases nonempty_physicalActualCriticalOmissionTransition H profile with ⟨T⟩
  have hreverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (T.successor q).1
          (PhysicalVertex.mem_A
            (T.successor q))).toCriticalFourShell.support := fun q ↦
    hallReverse q (T.successor q)
      (T.successor_not_mem_actualCriticalSupport q)
  have hinjective : Function.Injective T.successor :=
    transition_successor_injective_of_all_reverseMembership T hreverse
  rcases physicalVertex_nonempty profile with ⟨start⟩
  rcases nonempty_zeroEntryPhysicalActualCriticalOmissionCycle_from_start
      T hinjective start with ⟨K, htransition, _hstart, _hentry⟩
  rcases nonempty_transitionSharedCapOrder_of_all_omissions_reverseMembership
      T hallReverse with ⟨O⟩
  have hvertexCard : (physicalVertices profile).card = 3 :=
    physicalVertices_card_eq_three_of_exactFiveSecondCap Q profile
  have hperiodLe : K.period ≤ 3 := by
    calc
      K.period ≤ (physicalVertices profile).card := by
        simpa using Fintype.card_le_of_injective K.source K.source_injective
      _ = 3 := hvertexCard
  have htransitionInjective : Function.Injective K.transition.successor := by
    simpa only [htransition] using hinjective
  have htransitionReverse : ∀ q : PhysicalVertex profile,
      q.1 ∈
        (H.selectedAt (K.transition.successor q).1
          (PhysicalVertex.mem_A
            (K.transition.successor q))).toCriticalFourShell.support := by
    intro q
    rw [htransition]
    exact hreverse q
  have htransitionNoTwo : ∀ q : PhysicalVertex profile,
      K.transition.successor (K.transition.successor q) ≠ q :=
    transition_successor_sq_ne_self_of_all_reverseMembership
      K.transition htransitionReverse
  have hperiodGe : 3 ≤ K.period := by
    simpa [PhysicalActualCriticalOmissionCycle.period] using
      three_le_minimalPeriod_of_injective_no_short_cycles
        K.transition.successor htransitionInjective K.transition.successor_ne
        htransitionNoTwo K.base
  have hperiod : K.period = 3 := by omega
  let U : Finset (Fin O.block.m) := Finset.univ.filter fun k ↦
    O.block.L.points k ∈ S.capInteriorByIndex S.oppIndex2
  have himage : U.image O.block.L.points = S.capInteriorByIndex S.oppIndex2 := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨k, hk, rfl⟩
      exact (Finset.mem_filter.mp hk).2
    · intro hx
      have hxCap : x ∈ S.capByIndex S.oppIndex2 :=
        S.capInteriorByIndex_subset_capByIndex S.oppIndex2 hx
      rcases O.block.exists_index_of_mem_cap hxCap with ⟨k, hk⟩
      exact Finset.mem_image.mpr ⟨k,
        Finset.mem_filter.mpr ⟨Finset.mem_univ _, hk.symm ▸ hx⟩, hk⟩
  have hUcard : U.card = 3 := by
    have hinterior := capInteriorByIndex_card_add_two S S.oppIndex2
    rw [capByIndex_oppIndex2_eq_oppCap2 S,
      Q.secondOppCap_card_eq_five] at hinterior
    calc
      U.card = (U.image O.block.L.points).card :=
        (Finset.card_image_of_injective U O.block.L.injective).symm
      _ = (S.capInteriorByIndex S.oppIndex2).card := congrArg Finset.card himage
      _ = 3 := by omega
  let i0 : Fin K.period := ⟨0, by omega⟩
  let i1 : Fin K.period := ⟨1, by omega⟩
  let i2 : Fin K.period := ⟨2, by omega⟩
  let q0 := O.sourceIndex (K.source i0)
  let q1 := O.sourceIndex (K.source i1)
  let q2 := O.sourceIndex (K.source i2)
  let b0 := O.blockerIndex (K.source i0)
  let b1 := O.blockerIndex (K.source i1)
  let b2 := O.blockerIndex (K.source i2)
  have hqmem (i : Fin K.period) : O.sourceIndex (K.source i) ∈ U := by
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, by
      rw [O.source_point]
      exact K.source_mem_capInterior i⟩
  have hbmem (i : Fin K.period) : O.blockerIndex (K.source i) ∈ U := by
    refine Finset.mem_filter.mpr ⟨Finset.mem_univ _, ?_⟩
    rw [O.blocker_point]
    exact transition_successor_actualBlocker_mem_physicalCapInterior
      T hreverse (K.source i)
  have hnext0 : T.successor (K.source i0) = K.source i1 := by
    calc
      T.successor (K.source i0) = K.transition.successor (K.source i0) := by
        rw [htransition]
      _ = K.source (K.successorIndex i0) := K.successor_source_eq i0
      _ = K.source i1 := by
        congr 1
        apply Fin.ext
        simp [PhysicalActualCriticalOmissionCycle.successorIndex, i0, i1, hperiod]
  have hnext1 : T.successor (K.source i1) = K.source i2 := by
    calc
      T.successor (K.source i1) = K.transition.successor (K.source i1) := by
        rw [htransition]
      _ = K.source (K.successorIndex i1) := K.successor_source_eq i1
      _ = K.source i2 := by
        congr 1
        apply Fin.ext
        simp [PhysicalActualCriticalOmissionCycle.successorIndex, i1, i2, hperiod]
  have hnext2 : T.successor (K.source i2) = K.source i0 := by
    calc
      T.successor (K.source i2) = K.transition.successor (K.source i2) := by
        rw [htransition]
      _ = K.source (K.successorIndex i2) := K.successor_source_eq i2
      _ = K.source i0 := by
        congr 1
        apply Fin.ext
        simp [PhysicalActualCriticalOmissionCycle.successorIndex, i2, i0, hperiod]
  have hsourceIndex_ne {i j : Fin K.period} (hij : i ≠ j) :
      O.sourceIndex (K.source i) ≠ O.sourceIndex (K.source j) := by
    intro heq
    apply hij
    apply K.source_injective
    apply Subtype.ext
    calc
      (K.source i).1 = O.block.L.points (O.sourceIndex (K.source i)) :=
        (O.source_point _).symm
      _ = O.block.L.points (O.sourceIndex (K.source j)) := by rw [heq]
      _ = (K.source j).1 := O.source_point _
  have hi01 : i0 ≠ i1 := by
    intro h
    have := congrArg Fin.val h
    simp [i0, i1] at this
  have hi12 : i1 ≠ i2 := by
    intro h
    have := congrArg Fin.val h
    simp [i1, i2] at this
  have hi20 : i2 ≠ i0 := by
    intro h
    have := congrArg Fin.val h
    simp [i2, i0] at this
  have h0 : StrictBetween q0 b0 q1 := by
    simpa [StrictBetween, q0, b0, q1, hnext0] using O.straddle (K.source i0)
  have h1 : StrictBetween q1 b1 q2 := by
    simpa [StrictBetween, q1, b1, q2, hnext1] using O.straddle (K.source i1)
  have h2 : StrictBetween q2 b2 q0 := by
    simpa [StrictBetween, q2, b2, q0, hnext2] using O.straddle (K.source i2)
  have hfive := five_le_card_of_periodThree_straddles U q0 q1 q2 b0 b1 b2
    (hqmem i0) (hqmem i1) (hqmem i2)
    (hbmem i0) (hbmem i1) (hbmem i2)
    (hsourceIndex_ne hi01) (hsourceIndex_ne hi12) (hsourceIndex_ne hi20)
    h0 h1 h2
  omega

/-- The endpoints of an arbitrary mutual omission are distinct.  A critical
support always contains its own source. -/
theorem PhysicalActualCriticalMutualOmissionPair.source_ne_target
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : PhysicalActualCriticalMutualOmissionPair H profile) :
    M.source ≠ M.target := by
  intro h
  apply M.target_not_mem_sourceSupport
  simpa only [h] using
    (H.selectedAt M.source.1
      (PhysicalVertex.mem_A M.source)).toCriticalFourShell.q_mem_support

/-- In an exact-five mutual omission, at least one of the two actual critical
rows is one-hit on the three-point physical set.  The excluded double-two-hit
case would make the two actual blockers the opposite endpoints and hence make
the physical triple equilateral, contradicting the non-obtuse obstruction. -/
theorem PhysicalActualCriticalMutualOmissionPair.source_hit_eq_one_or_target_hit_eq_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (M : PhysicalActualCriticalMutualOmissionPair H profile) :
    (physicalVertices profile ∩
        (H.selectedAt M.source.1
          (PhysicalVertex.mem_A M.source)).toCriticalFourShell.support).card = 1 ∨
      (physicalVertices profile ∩
        (H.selectedAt M.target.1
          (PhysicalVertex.mem_A M.target)).toCriticalFourShell.support).card = 1 := by
  let P := physicalVertices profile
  let Ka := (H.selectedAt M.source.1
    (PhysicalVertex.mem_A M.source)).toCriticalFourShell
  let Kb := (H.selectedAt M.target.1
    (PhysicalVertex.mem_A M.target)).toCriticalFourShell
  have hsourceUpper : (P ∩ Ka.support).card ≤ 2 := by
    change ((SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2) ∩ Ka.support).card ≤ 2
    simpa only [Ka] using
      actualCriticalSupport_physicalInterior_inter_card_le_two
        H profile M.source.1 M.source.2
  have htargetUpper : (P ∩ Kb.support).card ≤ 2 := by
    change ((SelectedClass D.A S.oppApex2 profile.radius ∩
      S.capInteriorByIndex S.oppIndex2) ∩ Kb.support).card ≤ 2
    simpa only [Kb] using
      actualCriticalSupport_physicalInterior_inter_card_le_two
        H profile M.target.1 M.target.2
  have hsourcePos : 0 < (P ∩ Ka.support).card :=
    Finset.card_pos.mpr ⟨M.source.1,
      Finset.mem_inter.mpr ⟨M.source.2, Ka.q_mem_support⟩⟩
  have htargetPos : 0 < (P ∩ Kb.support).card :=
    Finset.card_pos.mpr ⟨M.target.1,
      Finset.mem_inter.mpr ⟨M.target.2, Kb.q_mem_support⟩⟩
  by_contra hnotOne
  simp only [not_or] at hnotOne
  have hsourceNotOne : (P ∩ Ka.support).card ≠ 1 := by
    simpa [P, Ka] using hnotOne.1
  have htargetNotOne : (P ∩ Kb.support).card ≠ 1 := by
    simpa [P, Kb] using hnotOne.2
  have hsourceCard : (P ∩ Ka.support).card = 2 := by omega
  have htargetCard : (P ∩ Kb.support).card = 2 := by omega
  have hpairNe :=
    PhysicalActualCriticalMutualOmissionPair.source_ne_target M
  have hthird :
      ∃ x ∈ P, x ≠ M.source.1 ∧ x ≠ M.target.1 := by
    by_contra hnone
    push_neg at hnone
    have hsub : P ⊆ ({M.source.1, M.target.1} : Finset ℝ²) := by
      intro x hx
      by_cases hxSource : x = M.source.1
      · simp [hxSource]
      · have hxTarget := hnone x hx hxSource
        simp [hxTarget]
    have hcard := Finset.card_le_card hsub
    have hpairPoints : M.source.1 ≠ M.target.1 := by
      intro h
      exact hpairNe (Subtype.ext h)
    rw [Finset.card_pair hpairPoints] at hcard
    have hthree : P.card = 3 := by
      simpa [P] using
        physicalVertices_card_eq_three_of_exactFiveSecondCap Q profile
    omega
  rcases hthird with ⟨x, hxP, hxSource, hxTarget⟩
  let third : PhysicalVertex profile := ⟨x, hxP⟩
  have hthirdSource : third ≠ M.source := by
    intro h
    exact hxSource (congrArg Subtype.val h)
  have hthirdTarget : third ≠ M.target := by
    intro h
    exact hxTarget (congrArg Subtype.val h)
  have htripleSub :
      ({M.source.1, M.target.1, third.1} : Finset ℝ²) ⊆ P := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact M.source.2
    · exact M.target.2
    · exact third.2
  have htripleCard :
      ({M.source.1, M.target.1, third.1} : Finset ℝ²).card = 3 := by
    have hsourceTarget : M.source.1 ≠ M.target.1 :=
      fun h ↦ hpairNe (Subtype.ext h)
    have hsourceThird : M.source.1 ≠ third.1 :=
      fun h ↦ hthirdSource (Subtype.ext h.symm)
    have htargetThird : M.target.1 ≠ third.1 :=
      fun h ↦ hthirdTarget (Subtype.ext h.symm)
    simp [hsourceTarget, hsourceThird, htargetThird]
  have hPcard : P.card = 3 := by
    simpa [P] using
      physicalVertices_card_eq_three_of_exactFiveSecondCap Q profile
  have htripleEq :
      ({M.source.1, M.target.1, third.1} : Finset ℝ²) = P :=
    Finset.eq_of_subset_of_card_le htripleSub (by omega)
  have hthirdKa : third.1 ∈ Ka.support := by
    by_contra hthirdNot
    have hinterSub : P ∩ Ka.support ⊆ ({M.source.1} : Finset ℝ²) := by
      intro z hz
      have hzCases :
          z = M.source.1 ∨ z = M.target.1 ∨ z = third.1 := by
        have hzP := (Finset.mem_inter.mp hz).1
        rw [← htripleEq] at hzP
        simpa only [Finset.mem_insert, Finset.mem_singleton] using hzP
      rcases hzCases with rfl | rfl | rfl
      · exact Finset.mem_singleton_self _
      · exact False.elim
          (M.target_not_mem_sourceSupport (Finset.mem_inter.mp hz).2)
      · exact False.elim (hthirdNot (Finset.mem_inter.mp hz).2)
    have := Finset.card_le_card hinterSub
    simp only [Finset.card_singleton] at this
    omega
  have hthirdKb : third.1 ∈ Kb.support := by
    by_contra hthirdNot
    have hinterSub : P ∩ Kb.support ⊆ ({M.target.1} : Finset ℝ²) := by
      intro z hz
      have hzCases :
          z = M.source.1 ∨ z = M.target.1 ∨ z = third.1 := by
        have hzP := (Finset.mem_inter.mp hz).1
        rw [← htripleEq] at hzP
        simpa only [Finset.mem_insert, Finset.mem_singleton] using hzP
      rcases hzCases with rfl | rfl | rfl
      · exact False.elim
          (M.source_not_mem_targetSupport (Finset.mem_inter.mp hz).2)
      · exact Finset.mem_singleton_self _
      · exact False.elim (hthirdNot (Finset.mem_inter.mp hz).2)
    have := Finset.card_le_card hinterSub
    simp only [Finset.card_singleton] at this
    omega
  have hsourceBlockerP := actualBlocker_mem_physicalVertices_of_two_hits
    Q profile M.source third hthirdSource.symm hthirdKa
  have htargetBlockerP := actualBlocker_mem_physicalVertices_of_two_hits
    Q profile M.target third hthirdTarget.symm hthirdKb
  have hsourceBlockerEq :
      H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) = M.target.1 := by
    have hcases :
        H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) = M.source.1 ∨
          H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) = M.target.1 ∨
          H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) = third.1 := by
      change H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) ∈ P at hsourceBlockerP
      rw [← htripleEq] at hsourceBlockerP
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hsourceBlockerP
    rcases hcases with hself | htarget | hthird
    · exfalso
      apply actualBlocker_not_mem_actualSupport (H := H) M.source
      have hmem :
          H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) ∈ Ka.support := by
        simpa only [hself] using Ka.q_mem_support
      simpa only [Ka] using hmem
    · exact htarget
    · exfalso
      apply actualBlocker_not_mem_actualSupport (H := H) M.source
      have hmem :
          H.centerAt M.source.1 (PhysicalVertex.mem_A M.source) ∈ Ka.support := by
        simpa only [hthird] using hthirdKa
      simpa only [Ka] using hmem
  have htargetBlockerEq :
      H.centerAt M.target.1 (PhysicalVertex.mem_A M.target) = M.source.1 := by
    have hcases :
        H.centerAt M.target.1 (PhysicalVertex.mem_A M.target) = M.source.1 ∨
          H.centerAt M.target.1 (PhysicalVertex.mem_A M.target) = M.target.1 ∨
          H.centerAt M.target.1 (PhysicalVertex.mem_A M.target) = third.1 := by
      change H.centerAt M.target.1 (PhysicalVertex.mem_A M.target) ∈ P at htargetBlockerP
      rw [← htripleEq] at htargetBlockerP
      simpa only [Finset.mem_insert, Finset.mem_singleton] using htargetBlockerP
    rcases hcases with hsource | hself | hthird
    · exact hsource
    · exfalso
      apply actualBlocker_not_mem_actualSupport (H := H) M.target
      have hmem :
          H.centerAt M.target.1 (PhysicalVertex.mem_A M.target) ∈ Kb.support := by
        simpa only [hself] using Kb.q_mem_support
      simpa only [Kb] using hmem
    · exfalso
      apply actualBlocker_not_mem_actualSupport (H := H) M.target
      have hmem :
          H.centerAt M.target.1 (PhysicalVertex.mem_A M.target) ∈ Kb.support := by
        simpa only [hthird] using hthirdKb
      simpa only [Kb] using hmem
  have hba_bc : dist M.target.1 M.source.1 = dist M.target.1 third.1 := by
    rw [← hsourceBlockerEq]
    exact (Ka.support_eq_radius M.source.1 Ka.q_mem_support).trans
      (Ka.support_eq_radius third.1 hthirdKa).symm
  have hab_ac : dist M.source.1 M.target.1 = dist M.source.1 third.1 := by
    rw [← htargetBlockerEq]
    exact (Kb.support_eq_radius M.target.1 Kb.q_mem_support).trans
      (Kb.support_eq_radius third.1 hthirdKb).symm
  have hab_bc : dist M.source.1 M.target.1 = dist M.target.1 third.1 := by
    rw [dist_comm M.source.1 M.target.1]
    exact hba_bc
  apply not_nonobtuse_of_three_distinct_physicalVertices
    M.source M.target third hpairNe hthirdSource.symm hthirdTarget.symm
  refine ⟨inner_nonneg_of_three_equal_distances
      M.source.1 M.target.1 third.1 hab_ac hab_bc, ?_, ?_⟩
  · exact inner_nonneg_of_three_equal_distances
      M.target.1 third.1 M.source.1
      (by
        calc
          dist M.target.1 third.1 = dist M.source.1 M.target.1 := hab_bc.symm
          _ = dist M.target.1 M.source.1 := dist_comm _ _)
      (by
        calc
          dist M.target.1 third.1 = dist M.source.1 M.target.1 := hab_bc.symm
          _ = dist M.source.1 third.1 := hab_ac
          _ = dist third.1 M.source.1 := dist_comm _ _)
  · exact inner_nonneg_of_three_equal_distances
      third.1 M.source.1 M.target.1
      (by
        calc
          dist third.1 M.source.1 = dist M.source.1 third.1 := dist_comm _ _
          _ = dist M.source.1 M.target.1 := hab_ac.symm
          _ = dist M.target.1 third.1 := hab_bc
          _ = dist third.1 M.target.1 := dist_comm _ _)
      (by
        calc
          dist third.1 M.source.1 = dist M.source.1 third.1 := dist_comm _ _
          _ = dist M.source.1 M.target.1 := hab_ac.symm)

/-- At least one endpoint of a mutual physical pair lies in the retained
second-apex row. -/
theorem PhysicalActualCriticalMutualOmissionPair.source_mem_secondRow_or_target_mem_secondRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (M : PhysicalActualCriticalMutualOmissionPair H profile) :
    M.source.1 ∈ R.common.packet.B₂ ∨
      M.target.1 ∈ R.common.packet.B₂ := by
  by_contra hneither
  simp only [not_or] at hneither
  let P := physicalVertices profile
  let U := R.common.packet.B₂
  have hpairPoints : M.source.1 ≠ M.target.1 := by
    intro h
    exact PhysicalActualCriticalMutualOmissionPair.source_ne_target M
      (Subtype.ext h)
  have hpairSub : ({M.source.1, M.target.1} : Finset ℝ²) ⊆ P \ U := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_sdiff.mpr ⟨M.source.2, hneither.1⟩
    · exact Finset.mem_sdiff.mpr ⟨M.target.2, hneither.2⟩
  have hpairCard : ({M.source.1, M.target.1} : Finset ℝ²).card = 2 := by
    rw [Finset.card_pair hpairPoints]
  have hdiffCard : (P \ U).card ≤ 1 := by
    have hsplit := Finset.card_sdiff_add_card_inter P U
    have hPcard : P.card = 3 := by
      simpa [P] using
        physicalVertices_card_eq_three_of_exactFiveSecondCap Q profile
    have hinter : 2 ≤ (P ∩ U).card := by
      simpa [P, U] using
        two_le_physicalVertices_inter_parentSecondRow_card R profile
    omega
  have := Finset.card_le_card hpairSub
  omega

/-- At least one endpoint of a mutual physical pair lies outside the
retained first-apex row. -/
theorem PhysicalActualCriticalMutualOmissionPair.source_not_mem_firstRow_or_target_not_mem_firstRow
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (M : PhysicalActualCriticalMutualOmissionPair H profile) :
    M.source.1 ∉ R.common.packet.B₁ ∨
      M.target.1 ∉ R.common.packet.B₁ := by
  by_contra hboth
  simp only [not_or, not_not] at hboth
  let P := physicalVertices profile
  let U := R.common.packet.B₁
  have hpairPoints : M.source.1 ≠ M.target.1 := by
    intro h
    exact PhysicalActualCriticalMutualOmissionPair.source_ne_target M
      (Subtype.ext h)
  have hpairSub : ({M.source.1, M.target.1} : Finset ℝ²) ⊆ P ∩ U := by
    intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact Finset.mem_inter.mpr ⟨M.source.2, hboth.1⟩
    · exact Finset.mem_inter.mpr ⟨M.target.2, hboth.2⟩
  have hpairCard : ({M.source.1, M.target.1} : Finset ℝ²).card = 2 := by
    rw [Finset.card_pair hpairPoints]
  have hone : (P ∩ U).card ≤ 1 := by
    simpa [P, U] using
      physicalVertices_inter_parentFirstRow_card_le_one R profile
  have := Finset.card_le_card hpairSub
  omega

/-- Full-parent mutual residual after the exact-five all-reverse arm has
been eliminated.  Besides the mutual omission itself, it retains the parent
row bridge, the sharp endpoint distribution across the two retained rows,
and the fact that at least one mutual critical row has exactly one physical
hit. -/
structure FrontierBiApexRobustExactFiveMutualParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Type where
  pair : PhysicalActualCriticalMutualOmissionPair H profile
  oneHit :
    (physicalVertices profile ∩
        (H.selectedAt pair.source.1
          (PhysicalVertex.mem_A pair.source)).toCriticalFourShell.support).card = 1 ∨
      (physicalVertices profile ∩
        (H.selectedAt pair.target.1
          (PhysicalVertex.mem_A pair.target)).toCriticalFourShell.support).card = 1
  bridge : ∃ x : PhysicalVertex profile,
    x.1 ∈ R.common.packet.B₂ ∧ x.1 ∉ R.common.packet.B₁
  source_mem_second_or_target_mem_second :
    pair.source.1 ∈ R.common.packet.B₂ ∨
      pair.target.1 ∈ R.common.packet.B₂
  source_not_mem_first_or_target_not_mem_first :
    pair.source.1 ∉ R.common.packet.B₁ ∨
      pair.target.1 ∉ R.common.packet.B₁
  endpointRowDichotomy :
    (pair.source.1 ∈ R.common.packet.B₂ ∧
        pair.source.1 ∉ R.common.packet.B₁) ∨
      (pair.target.1 ∈ R.common.packet.B₂ ∧
        pair.target.1 ∉ R.common.packet.B₁) ∨
      ((pair.source.1 ∈ R.common.packet.B₁ ∧
          pair.source.1 ∈ R.common.packet.B₂) ∧
        (pair.target.1 ∉ R.common.packet.B₁ ∧
          pair.target.1 ∉ R.common.packet.B₂)) ∨
      ((pair.target.1 ∈ R.common.packet.B₁ ∧
          pair.target.1 ∈ R.common.packet.B₂) ∧
        (pair.source.1 ∉ R.common.packet.B₁ ∧
          pair.source.1 ∉ R.common.packet.B₂))

/-- The exact-five parent reduces unconditionally to the mutual residual:
the complementary global all-reverse relation is impossible by the
period-three straddle count. -/
theorem nonempty_frontierBiApexRobustExactFiveMutualParentResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    Nonempty (FrontierBiApexRobustExactFiveMutualParentResidual Q profile) := by
  rcases nonempty_mutualOmissionPair_or_all_omissions_reverseMembership
      H profile with hmutual | hallReverse
  · rcases hmutual with ⟨pair⟩
    have honeHit :=
      PhysicalActualCriticalMutualOmissionPair.source_hit_eq_one_or_target_hit_eq_one
        Q profile pair
    have hsecond :=
      PhysicalActualCriticalMutualOmissionPair.source_mem_secondRow_or_target_mem_secondRow
        Q profile pair
    have hfirst :=
      PhysicalActualCriticalMutualOmissionPair.source_not_mem_firstRow_or_target_not_mem_firstRow
        (R := R) pair
    have hdichotomy :
        (pair.source.1 ∈ R.common.packet.B₂ ∧
            pair.source.1 ∉ R.common.packet.B₁) ∨
          (pair.target.1 ∈ R.common.packet.B₂ ∧
            pair.target.1 ∉ R.common.packet.B₁) ∨
          ((pair.source.1 ∈ R.common.packet.B₁ ∧
              pair.source.1 ∈ R.common.packet.B₂) ∧
            (pair.target.1 ∉ R.common.packet.B₁ ∧
              pair.target.1 ∉ R.common.packet.B₂)) ∨
          ((pair.target.1 ∈ R.common.packet.B₁ ∧
              pair.target.1 ∈ R.common.packet.B₂) ∧
            (pair.source.1 ∉ R.common.packet.B₁ ∧
              pair.source.1 ∉ R.common.packet.B₂)) := by
      tauto
    exact ⟨{
      pair := pair
      oneHit := honeHit
      bridge :=
        exists_physicalVertex_mem_parentSecondRow_not_mem_parentFirstRow
          R profile
      source_mem_second_or_target_mem_second := hsecond
      source_not_mem_first_or_target_not_mem_first := hfirst
      endpointRowDichotomy := hdichotomy }⟩
  · exact False.elim
      (false_of_all_omissions_reverseMembership_of_exactFiveSecondCap
        Q profile hallReverse)

end

end ATailParentExactFiveSecondCap
end Problem97
