/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.CapSelectedRowCounting
import Erdos9796Proof.P97.U2.WitnessReflectionKernel
import Erdos9796Proof.P97.U5GlobalIncidenceKernels

/-!
# Scratch: two-hit profiles for a third equilateral-continuation row

Two selected rows centered at `x,y` both contain the other center and an
apex `a`.  A third row is centered at a remaining member `b` of either old
row and contains two of `x,y,a`.

Every one of the six source/profile combinations below produces a precise
two-circle core.  Such a core is not a contradiction by itself: its two
common points may be the two opposite intersections of the circles.  It
closes only when cyclic order puts those common points strictly on the same
side of the center chord.

The live cap packet supplies that side information in one case.  If the
third row contains `x,y` and `b` is outside the common cap of `x,y`, then
`a,b` are two distinct outside points equidistant from both cap centers,
contradicting ordered-cap uniqueness.  No analogous cap conclusion is
asserted for the other profiles.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailThirdRowProfileBankScratch

attribute [local instance] Classical.propDecidable

/-- The two continuation rows that make `x,y,a` an equilateral triangle.
The name records only the row incidence; no cyclic-order conclusion is built
into the packet. -/
structure EquilateralRows (A : Finset ℝ²) (x y a : ℝ²) where
  rowX : SelectedFourClass A x
  rowY : SelectedFourClass A y
  y_mem_rowX : y ∈ rowX.support
  a_mem_rowX : a ∈ rowX.support
  x_mem_rowY : x ∈ rowY.support
  a_mem_rowY : a ∈ rowY.support

namespace EquilateralRows

theorem x_ne_y {A : Finset ℝ²} {x y a : ℝ²}
    (P : EquilateralRows A x y a) : x ≠ y := by
  intro h
  apply P.rowX.center_not_mem
  simpa [h] using P.y_mem_rowX

theorem x_ne_a {A : Finset ℝ²} {x y a : ℝ²}
    (P : EquilateralRows A x y a) : x ≠ a := by
  intro h
  apply P.rowX.center_not_mem
  simpa [h] using P.a_mem_rowX

theorem y_ne_a {A : Finset ℝ²} {x y a : ℝ²}
    (P : EquilateralRows A x y a) : y ≠ a := by
  intro h
  apply P.rowY.center_not_mem
  simpa [h] using P.a_mem_rowY

theorem radiusY_eq_radiusX {A : Finset ℝ²} {x y a : ℝ²}
    (P : EquilateralRows A x y a) : P.rowY.radius = P.rowX.radius := by
  calc
    P.rowY.radius = dist y x :=
      (P.rowY.support_eq_radius x P.x_mem_rowY).symm
    _ = dist x y := dist_comm y x
    _ = P.rowX.radius := P.rowX.support_eq_radius y P.y_mem_rowX

end EquilateralRows

/-- Equality data for two points `u,w` common to circles centered at `q,v`.
The radii at the two centers need not be equal. -/
structure TwoCircleCore (q v u w : ℝ²) where
  radiusQ : ℝ
  radiusV : ℝ
  u_at_q : dist u q = radiusQ
  w_at_q : dist w q = radiusQ
  u_at_v : dist u v = radiusV
  w_at_v : dist w v = radiusV
  points_ne : u ≠ w

namespace TwoCircleCore

/-- The exact missing order input for a bare two-circle core: the two common
points cannot lie strictly on the same side of the center chord. -/
theorem false_of_same_side {q v u w : ℝ²}
    (C : TwoCircleCore q v u w)
    (hsame :
      0 < signedArea2 u q v * signedArea2 w q v) : False := by
  have huArea : signedArea2 u q v ≠ 0 := by
    intro hzero
    rw [hzero, zero_mul] at hsame
    exact (lt_irrefl 0) hsame
  exact twoCircle_sameSide_reflection_false
    C.u_at_q C.w_at_q C.u_at_v C.w_at_v C.points_ne
    (mul_self_pos.mpr huArea)
    (by simpa [mul_comm] using hsame)

end TwoCircleCore

/-- `b` belongs to the row centered at `y`, while its new row contains
`x,y`.  The common circle points are `a,b`, with centers `x,y`. -/
def twoCircleCore_of_rowY_member_profile_xy
    {A : Finset ℝ²} {x y a b : ℝ²}
    (P : EquilateralRows A x y a)
    (Kb : SelectedFourClass A b)
    (hbY : b ∈ P.rowY.support)
    (hxB : x ∈ Kb.support) (hyB : y ∈ Kb.support)
    (hab : a ≠ b) : TwoCircleCore x y a b := by
  have hbAtX : dist b x = P.rowX.radius := by
    calc
      dist b x = Kb.radius := Kb.support_eq_radius x hxB
      _ = dist b y := (Kb.support_eq_radius y hyB).symm
      _ = dist y b := dist_comm b y
      _ = P.rowY.radius := P.rowY.support_eq_radius b hbY
      _ = P.rowX.radius := P.radiusY_eq_radiusX
  exact {
    radiusQ := P.rowX.radius
    radiusV := P.rowY.radius
    u_at_q := by
      simpa [dist_comm] using P.rowX.support_eq_radius a P.a_mem_rowX
    w_at_q := hbAtX
    u_at_v := by
      simpa [dist_comm] using P.rowY.support_eq_radius a P.a_mem_rowY
    w_at_v := by
      simpa [dist_comm] using P.rowY.support_eq_radius b hbY
    points_ne := hab }

/-- `b` belongs to the row centered at `y`, while its new row contains
`x,a`.  The common circle points are `x,a`, with centers `y,b`. -/
def twoCircleCore_of_rowY_member_profile_xa
    {A : Finset ℝ²} {x y a b : ℝ²}
    (P : EquilateralRows A x y a)
    (Kb : SelectedFourClass A b)
    (_hbY : b ∈ P.rowY.support)
    (hxB : x ∈ Kb.support) (haB : a ∈ Kb.support) :
    TwoCircleCore y b x a := {
  radiusQ := P.rowY.radius
  radiusV := Kb.radius
  u_at_q := by
    simpa [dist_comm] using P.rowY.support_eq_radius x P.x_mem_rowY
  w_at_q := by
    simpa [dist_comm] using P.rowY.support_eq_radius a P.a_mem_rowY
  u_at_v := by
    simpa [dist_comm] using Kb.support_eq_radius x hxB
  w_at_v := by
    simpa [dist_comm] using Kb.support_eq_radius a haB
  points_ne := P.x_ne_a }

/-- `b` belongs to the row centered at `y`, while its new row contains
`y,a`.  The common circle points are `x,b`, with centers `y,a`. -/
def twoCircleCore_of_rowY_member_profile_ya
    {A : Finset ℝ²} {x y a b : ℝ²}
    (P : EquilateralRows A x y a)
    (Kb : SelectedFourClass A b)
    (hbY : b ∈ P.rowY.support)
    (hyB : y ∈ Kb.support) (haB : a ∈ Kb.support)
    (hxb : x ≠ b) : TwoCircleCore y a x b := by
  have hbAtA : dist b a = P.rowY.radius := by
    calc
      dist b a = Kb.radius := Kb.support_eq_radius a haB
      _ = dist b y := (Kb.support_eq_radius y hyB).symm
      _ = dist y b := dist_comm b y
      _ = P.rowY.radius := P.rowY.support_eq_radius b hbY
  exact {
    radiusQ := P.rowY.radius
    radiusV := P.rowY.radius
    u_at_q := by
      simpa [dist_comm] using P.rowY.support_eq_radius x P.x_mem_rowY
    w_at_q := by
      simpa [dist_comm] using P.rowY.support_eq_radius b hbY
    u_at_v := by
      calc
        dist x a = dist x y :=
          (P.rowX.support_eq_radius a P.a_mem_rowX).trans
            (P.rowX.support_eq_radius y P.y_mem_rowX).symm
        _ = dist y x := dist_comm x y
        _ = P.rowY.radius := P.rowY.support_eq_radius x P.x_mem_rowY
    w_at_v := hbAtA
    points_ne := hxb }

/-- Symmetric source case: `b` belongs to the row centered at `x`, and the
new row contains `x,y`.  Again `a,b` are common to the circles at `x,y`. -/
def twoCircleCore_of_rowX_member_profile_xy
    {A : Finset ℝ²} {x y a b : ℝ²}
    (P : EquilateralRows A x y a)
    (Kb : SelectedFourClass A b)
    (hbX : b ∈ P.rowX.support)
    (hxB : x ∈ Kb.support) (hyB : y ∈ Kb.support)
    (hab : a ≠ b) : TwoCircleCore x y a b := by
  have hbAtY : dist b y = P.rowY.radius := by
    calc
      dist b y = Kb.radius := Kb.support_eq_radius y hyB
      _ = dist b x := (Kb.support_eq_radius x hxB).symm
      _ = dist x b := dist_comm b x
      _ = P.rowX.radius := P.rowX.support_eq_radius b hbX
      _ = P.rowY.radius := P.radiusY_eq_radiusX.symm
  exact {
    radiusQ := P.rowX.radius
    radiusV := P.rowY.radius
    u_at_q := by
      simpa [dist_comm] using P.rowX.support_eq_radius a P.a_mem_rowX
    w_at_q := by
      simpa [dist_comm] using P.rowX.support_eq_radius b hbX
    u_at_v := by
      simpa [dist_comm] using P.rowY.support_eq_radius a P.a_mem_rowY
    w_at_v := hbAtY
    points_ne := hab }

/-- `b` belongs to the row centered at `x`, while its new row contains
`x,a`.  The common circle points are `y,b`, with centers `x,a`. -/
def twoCircleCore_of_rowX_member_profile_xa
    {A : Finset ℝ²} {x y a b : ℝ²}
    (P : EquilateralRows A x y a)
    (Kb : SelectedFourClass A b)
    (hbX : b ∈ P.rowX.support)
    (hxB : x ∈ Kb.support) (haB : a ∈ Kb.support)
    (hyb : y ≠ b) : TwoCircleCore x a y b := by
  have hbAtA : dist b a = P.rowX.radius := by
    calc
      dist b a = Kb.radius := Kb.support_eq_radius a haB
      _ = dist b x := (Kb.support_eq_radius x hxB).symm
      _ = dist x b := dist_comm b x
      _ = P.rowX.radius := P.rowX.support_eq_radius b hbX
  exact {
    radiusQ := P.rowX.radius
    radiusV := P.rowX.radius
    u_at_q := by
      simpa [dist_comm] using P.rowX.support_eq_radius y P.y_mem_rowX
    w_at_q := by
      simpa [dist_comm] using P.rowX.support_eq_radius b hbX
    u_at_v := by
      calc
        dist y a = dist y x :=
          (P.rowY.support_eq_radius a P.a_mem_rowY).trans
            (P.rowY.support_eq_radius x P.x_mem_rowY).symm
        _ = dist x y := dist_comm y x
        _ = P.rowX.radius := P.rowX.support_eq_radius y P.y_mem_rowX
    w_at_v := hbAtA
    points_ne := hyb }

/-- `b` belongs to the row centered at `x`, while its new row contains
`y,a`.  The common circle points are `y,a`, with centers `x,b`. -/
def twoCircleCore_of_rowX_member_profile_ya
    {A : Finset ℝ²} {x y a b : ℝ²}
    (P : EquilateralRows A x y a)
    (Kb : SelectedFourClass A b)
    (_hbX : b ∈ P.rowX.support)
    (hyB : y ∈ Kb.support) (haB : a ∈ Kb.support) :
    TwoCircleCore x b y a := {
  radiusQ := P.rowX.radius
  radiusV := Kb.radius
  u_at_q := by
    simpa [dist_comm] using P.rowX.support_eq_radius y P.y_mem_rowX
  w_at_q := by
    simpa [dist_comm] using P.rowX.support_eq_radius a P.a_mem_rowX
  u_at_v := by
    simpa [dist_comm] using Kb.support_eq_radius y hyB
  w_at_v := by
    simpa [dist_comm] using Kb.support_eq_radius a haB
  points_ne := P.y_ne_a }

/-- Two distinct centers in one cap cannot support a two-circle core whose
two common points are distinct carrier points outside that cap. -/
theorem false_of_twoCircleCore_at_cap_centers
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {q v u w : ℝ²}
    (C : TwoCircleCore q v u w)
    (hqCap : q ∈ S.capByIndex i) (hvCap : v ∈ S.capByIndex i)
    (hqv : q ≠ v)
    (huA : u ∈ A) (hwA : w ∈ A)
    (huOutside : u ∉ S.capByIndex i)
    (hwOutside : w ∉ S.capByIndex i) : False := by
  classical
  rcases S.capByIndex_cgn4g_capData hconv i with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hqImage : q ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hqCap
  have hvImage : v ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hvCap
  rcases Finset.mem_image.mp hqImage with ⟨r, _hr, hrq⟩
  rcases Finset.mem_image.mp hvImage with ⟨s, _hs, hsv⟩
  have hrs : r ≠ s := by
    intro h
    apply hqv
    calc
      q = L.points r := hrq.symm
      _ = L.points s := by simp [h]
      _ = v := hsv
  have huOutsideImage : u ∉ Finset.univ.image L.points := by
    simpa [hcap] using huOutside
  have hwOutsideImage : w ∉ Finset.univ.image L.points := by
    simpa [hcap] using hwOutside
  have hqeq : dist q u = dist q w := by
    calc
      dist q u = C.radiusQ := by simpa [dist_comm] using C.u_at_q
      _ = dist q w := by simpa [dist_comm] using C.w_at_q.symm
  have hveq : dist v u = dist v w := by
    calc
      dist v u = C.radiusV := by simpa [dist_comm] using C.u_at_v
      _ = dist v w := by simpa [dist_comm] using C.w_at_v.symm
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv Hord Packet.mem_A hrs' huA hwA
      huOutsideImage hwOutsideImage C.points_ne
      (by simpa [hrq] using hqeq)
      (by simpa [hsv] using hveq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv Hord Packet.mem_A hsr' huA hwA
      huOutsideImage hwOutsideImage C.points_ne
      (by simpa [hsv] using hveq)
      (by simpa [hrq] using hqeq)

/-- The one uniformly closed two-hit profile under the live cap placement.
The third center may be a member of either old row. -/
theorem false_of_member_profile_xy_of_common_cap_geometry
    {A : Finset ℝ²} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (i : Fin 3)
    {x y a b : ℝ²}
    (P : EquilateralRows A x y a)
    (Kb : SelectedFourClass A b)
    (hbOld : b ∈ P.rowX.support ∨ b ∈ P.rowY.support)
    (hxB : x ∈ Kb.support) (hyB : y ∈ Kb.support)
    (hab : a ≠ b)
    (hxCap : x ∈ S.capByIndex i) (hyCap : y ∈ S.capByIndex i)
    (haOutside : a ∉ S.capByIndex i)
    (hbOutside : b ∉ S.capByIndex i) : False := by
  rcases hbOld with hbX | hbY
  · exact false_of_twoCircleCore_at_cap_centers S hconv i
      (twoCircleCore_of_rowX_member_profile_xy P Kb hbX hxB hyB hab)
      hxCap hyCap P.x_ne_y
      (P.rowX.support_subset_A P.a_mem_rowX)
      (P.rowX.support_subset_A hbX)
      haOutside hbOutside
  · exact false_of_twoCircleCore_at_cap_centers S hconv i
      (twoCircleCore_of_rowY_member_profile_xy P Kb hbY hxB hyB hab)
      hxCap hyCap P.x_ne_y
      (P.rowX.support_subset_A P.a_mem_rowX)
      (P.rowY.support_subset_A hbY)
      haOutside hbOutside

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨j, hj3⟩
  interval_cases j <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem oppApex2_not_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∉ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨j, hj3⟩
  interval_cases j
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v3_notin_C3
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v1_notin_C1
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex2, hi] using S.partition.v2_notin_C2

/-- Live `oppCap2` specialization.  It deliberately retains the hypothesis
that the chosen remaining old-row member `b` is outside `oppCap2`; an
arbitrary one of the two unnamed row members need not have this property. -/
theorem false_of_live_outside_member_profile_xy
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {x y b : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Kb : SelectedFourClass D.A b)
    (hbOld : b ∈ P.rowX.support ∨ b ∈ P.rowY.support)
    (hxB : x ∈ Kb.support) (hyB : y ∈ Kb.support)
    (hab : S.oppApex2 ≠ b)
    (hxStrict : x ∈ S.oppCap2 \
      (S.surplusCap ∪ S.oppCap1))
    (hyStrict : y ∈ S.oppCap2 \
      (S.surplusCap ∪ S.oppCap1))
    (hbOutside : b ∉ S.oppCap2) : False := by
  have hcap := capByIndex_oppIndex2_eq_oppCap2 S
  exact false_of_member_profile_xy_of_common_cap_geometry
    S D.convex S.oppIndex2 P Kb hbOld hxB hyB hab
    (by simpa only [hcap] using (Finset.mem_sdiff.mp hxStrict).1)
    (by simpa only [hcap] using (Finset.mem_sdiff.mp hyStrict).1)
    (by simpa only [hcap] using oppApex2_not_mem_oppCap2 S)
    (by simpa only [hcap] using hbOutside)

/-- Three anchor hits at an old-row member give the planar tetrahedron
contradiction.  This is the selected-class interface of the banked U5
tetrahedron terminal. -/
private theorem false_of_three_anchor_hits_at_rowY_member
    {A : Finset ℝ²} {x y a b : ℝ²}
    (P : EquilateralRows A x y a)
    (Kb : SelectedFourClass A b)
    (hbY : b ∈ P.rowY.support)
    (hxB : x ∈ Kb.support)
    (hyB : y ∈ Kb.support)
    (haB : a ∈ Kb.support) : False := by
  let r := P.rowX.radius
  have hxy : dist x y = r := P.rowX.support_eq_radius y P.y_mem_rowX
  have hxa : dist x a = r := P.rowX.support_eq_radius a P.a_mem_rowX
  have hyr : P.rowY.radius = r := P.radiusY_eq_radiusX
  have hya : dist y a = r := by
    rw [P.rowY.support_eq_radius a P.a_mem_rowY, hyr]
  have hyb : dist y b = r := by
    rw [P.rowY.support_eq_radius b hbY, hyr]
  have hbr : Kb.radius = r := by
    calc
      Kb.radius = dist b y := (Kb.support_eq_radius y hyB).symm
      _ = dist y b := dist_comm b y
      _ = r := hyb
  have hxb : dist x b = r := by
    calc
      dist x b = dist b x := dist_comm x b
      _ = Kb.radius := Kb.support_eq_radius x hxB
      _ = r := hbr
  have hab : dist a b = r := by
    calc
      dist a b = dist b a := dist_comm a b
      _ = Kb.radius := Kb.support_eq_radius a haB
      _ = r := hbr
  exact u5_unit_triangle_on_p_circle_incompatibility
    P.rowX.radius_pos hxy hxa hxb hya hyb hab

/-- Branch-complete anchor-hit normal form for a generated row centered at an
outside member of one of the equilateral continuation rows.

The low-hit branch means that no two of `x,y,oppApex2` occur together.  The
only two-hit branches retained are the locally realizable apex-pair profiles
`{x,oppApex2}` and `{y,oppApex2}`. -/
theorem low_hit_or_live_apex_pair_profile
    (D : CounterexampleData) (S : SurplusCapPacket D.A) {x y b : ℝ²}
    (P : EquilateralRows D.A x y S.oppApex2)
    (Kb : SelectedFourClass D.A b)
    (hbOld : b ∈ P.rowX.support ∨ b ∈ P.rowY.support)
    (hab : S.oppApex2 ≠ b)
    (hxStrict : x ∈ S.oppCap2 \
      (S.surplusCap ∪ S.oppCap1))
    (hyStrict : y ∈ S.oppCap2 \
      (S.surplusCap ∪ S.oppCap1))
    (hbOutside : b ∉ S.oppCap2) :
    ¬ ((x ∈ Kb.support ∧ y ∈ Kb.support) ∨
        (x ∈ Kb.support ∧ S.oppApex2 ∈ Kb.support) ∨
        (y ∈ Kb.support ∧ S.oppApex2 ∈ Kb.support)) ∨
      (x ∈ Kb.support ∧ S.oppApex2 ∈ Kb.support ∧
        y ∉ Kb.support) ∨
      (y ∈ Kb.support ∧ S.oppApex2 ∈ Kb.support ∧
        x ∉ Kb.support) := by
  by_cases hpairs :
      (x ∈ Kb.support ∧ y ∈ Kb.support) ∨
        (x ∈ Kb.support ∧ S.oppApex2 ∈ Kb.support) ∨
        (y ∈ Kb.support ∧ S.oppApex2 ∈ Kb.support)
  · rcases hpairs with hxy | hxa | hya
    · exact False.elim
        (false_of_live_outside_member_profile_xy D S P Kb hbOld
          hxy.1 hxy.2 hab hxStrict hyStrict hbOutside)
    · right
      left
      exact ⟨hxa.1, hxa.2, by
        intro hyB
        rcases hbOld with hbX | hbY
        · exact false_of_three_anchor_hits_at_rowY_member
            ({ rowX := P.rowY
               rowY := P.rowX
               y_mem_rowX := P.x_mem_rowY
               a_mem_rowX := P.a_mem_rowY
               x_mem_rowY := P.y_mem_rowX
               a_mem_rowY := P.a_mem_rowX } :
              EquilateralRows D.A y x S.oppApex2)
            Kb hbX hyB hxa.1 hxa.2
        · exact false_of_three_anchor_hits_at_rowY_member
            P Kb hbY hxa.1 hyB hxa.2⟩
    · right
      right
      exact ⟨hya.1, hya.2, by
        intro hxB
        rcases hbOld with hbX | hbY
        · exact false_of_three_anchor_hits_at_rowY_member
            ({ rowX := P.rowY
               rowY := P.rowX
               y_mem_rowX := P.x_mem_rowY
               a_mem_rowX := P.a_mem_rowY
               x_mem_rowY := P.y_mem_rowX
               a_mem_rowY := P.a_mem_rowX } :
              EquilateralRows D.A y x S.oppApex2)
            Kb hbX hya.1 hxB hya.2
        · exact false_of_three_anchor_hits_at_rowY_member
            P Kb hbY hxB hya.1 hya.2⟩
  · exact Or.inl hpairs

#print axioms TwoCircleCore.false_of_same_side
#print axioms twoCircleCore_of_rowY_member_profile_xy
#print axioms twoCircleCore_of_rowY_member_profile_xa
#print axioms twoCircleCore_of_rowY_member_profile_ya
#print axioms twoCircleCore_of_rowX_member_profile_xy
#print axioms twoCircleCore_of_rowX_member_profile_xa
#print axioms twoCircleCore_of_rowX_member_profile_ya
#print axioms false_of_twoCircleCore_at_cap_centers
#print axioms false_of_member_profile_xy_of_common_cap_geometry
#print axioms false_of_live_outside_member_profile_xy
#print axioms low_hit_or_live_apex_pair_profile

end ATailThirdRowProfileBankScratch
end Problem97
