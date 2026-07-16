/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.MECStraddlingRowCore
import Erdos9796Proof.P97.Moser.NonDeg

/-!
# Two-row validation for the six continuation frontiers

This scratch file kernel-checks the equality-closure skeleton shared by the
smallest UNIT frontiers for shards `0, 1, 2, 3, 16, 20`.  The apex-row pairs
have three distinct concrete forms: shard `0`, shards `1/2/3/20`, and shard
`16`.  Every form produces `MECStraddlingRowCore.Core`.

This does not provide the ambient `MECStraddlingRowCore.Geometry` packet.  The
three terminal theorems below are deliberately conditional on that packet.
-/

open scoped EuclideanGeometry InnerProductSpace

namespace Problem97
namespace Scratch
namespace SixFrontierStructuralCore

open Census554.EqualityCore
open Census554.MECStraddlingRowCore

/-- A point in the cap opposite the first Moser apex supplies the
`MECStraddlingRowCore.Geometry.nonobtuse_a` inequality against either support
ray.  Thus this field is derivable from the live circumscribed packet plus cap
membership even though it is not a literal packet field. -/
theorem inner_nonneg_of_mem_first_cap
    {A : Finset ℝ²} {hA : A.Nonempty}
    {hncol : ¬ Collinear ℝ (A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    (CP : CapTriple A (MT.toMoserTriangle.toStructural hCirc))
    {p : ℝ²} (hp : p ∈ CP.C1) :
    0 ≤ inner ℝ
      (p - (MT.toMoserTriangle.toStructural hCirc).v1)
      ((MT.toMoserTriangle.toStructural hCirc).v2 -
        (MT.toMoserTriangle.toStructural hCirc).v1) := by
  let M := MT.toMoserTriangle.toStructural hCirc
  let P : CircumscribedMECPacket A M :=
    CircumscribedMECPacket.ofNonObtuse MT hCirc
  have hpA : p ∈ A := CP.C1_subset hp
  have hpSide : OnArcOpposite M.v1 M.v2 M.v3 p := by
    exact ((CP.arc_membership p hpA).1).mp hp
  have hNonDeg : signedArea2 M.v1 M.v2 M.v3 ≠ 0 := by
    simpa only [M] using
      MEC.moser_triangle_signed_area_ne_zero MT.toMoserTriangle hCirc
  obtain ⟨t, s, ht, hs, hpCone⟩ :=
    exists_cone_coeffs_of_cap_region
      (O := P.center) (c := M.v1) (a := M.v2) (b := M.v3) (p := p)
      P.moser_on_boundary_1 P.moser_on_boundary_2 P.moser_on_boundary_3
      (P.disk_contains_A p hpA) hpSide hNonDeg
  change 0 ≤ inner ℝ (p - M.v1) (M.v2 - M.v1)
  rw [hpCone, inner_add_left, real_inner_smul_left, real_inner_smul_left]
  exact add_nonneg
    (mul_nonneg ht real_inner_self_nonneg)
    (mul_nonneg hs (by rw [real_inner_comm]; exact P.inner_at_v1))

/-- Cyclic `C2` version of `inner_nonneg_of_mem_first_cap`. -/
theorem inner_nonneg_of_mem_second_cap
    {A : Finset ℝ²} {hA : A.Nonempty}
    {hncol : ¬ Collinear ℝ (A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    (CP : CapTriple A (MT.toMoserTriangle.toStructural hCirc))
    {p : ℝ²} (hp : p ∈ CP.C2) :
    0 ≤ inner ℝ
      (p - (MT.toMoserTriangle.toStructural hCirc).v2)
      ((MT.toMoserTriangle.toStructural hCirc).v3 -
        (MT.toMoserTriangle.toStructural hCirc).v2) := by
  let M := MT.toMoserTriangle.toStructural hCirc
  let P : CircumscribedMECPacket A M :=
    CircumscribedMECPacket.ofNonObtuse MT hCirc
  have hpA : p ∈ A := CP.C2_subset hp
  have hpSide : OnArcOpposite M.v2 M.v3 M.v1 p := by
    exact ((CP.arc_membership p hpA).2.1).mp hp
  have hNonDeg : signedArea2 M.v2 M.v3 M.v1 ≠ 0 := by
    have hbase : signedArea2 M.v1 M.v2 M.v3 ≠ 0 := by
      simpa only [M] using
        MEC.moser_triangle_signed_area_ne_zero MT.toMoserTriangle hCirc
    have hcycle : signedArea2 M.v2 M.v3 M.v1 =
        signedArea2 M.v1 M.v2 M.v3 := by
      unfold signedArea2
      ring
    rwa [hcycle]
  obtain ⟨t, s, ht, hs, hpCone⟩ :=
    exists_cone_coeffs_of_cap_region
      (O := P.center) (c := M.v2) (a := M.v3) (b := M.v1) (p := p)
      P.moser_on_boundary_2 P.moser_on_boundary_3 P.moser_on_boundary_1
      (P.disk_contains_A p hpA) hpSide hNonDeg
  change 0 ≤ inner ℝ (p - M.v2) (M.v3 - M.v2)
  rw [hpCone, inner_add_left, real_inner_smul_left, real_inner_smul_left]
  exact add_nonneg
    (mul_nonneg ht real_inner_self_nonneg)
    (mul_nonneg hs (by rw [real_inner_comm]; exact P.inner_at_v2))

/-- Cyclic `C3` version of `inner_nonneg_of_mem_first_cap`. -/
theorem inner_nonneg_of_mem_third_cap
    {A : Finset ℝ²} {hA : A.Nonempty}
    {hncol : ¬ Collinear ℝ (A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    (CP : CapTriple A (MT.toMoserTriangle.toStructural hCirc))
    {p : ℝ²} (hp : p ∈ CP.C3) :
    0 ≤ inner ℝ
      (p - (MT.toMoserTriangle.toStructural hCirc).v3)
      ((MT.toMoserTriangle.toStructural hCirc).v1 -
        (MT.toMoserTriangle.toStructural hCirc).v3) := by
  let M := MT.toMoserTriangle.toStructural hCirc
  let P : CircumscribedMECPacket A M :=
    CircumscribedMECPacket.ofNonObtuse MT hCirc
  have hpA : p ∈ A := CP.C3_subset hp
  have hpSide : OnArcOpposite M.v3 M.v1 M.v2 p := by
    exact ((CP.arc_membership p hpA).2.2).mp hp
  have hNonDeg : signedArea2 M.v3 M.v1 M.v2 ≠ 0 := by
    have hbase : signedArea2 M.v1 M.v2 M.v3 ≠ 0 := by
      simpa only [M] using
        MEC.moser_triangle_signed_area_ne_zero MT.toMoserTriangle hCirc
    have hcycle : signedArea2 M.v3 M.v1 M.v2 =
        signedArea2 M.v1 M.v2 M.v3 := by
      unfold signedArea2
      ring
    rwa [hcycle]
  obtain ⟨t, s, ht, hs, hpCone⟩ :=
    exists_cone_coeffs_of_cap_region
      (O := P.center) (c := M.v3) (a := M.v1) (b := M.v2) (p := p)
      P.moser_on_boundary_3 P.moser_on_boundary_1 P.moser_on_boundary_2
      (P.disk_contains_A p hpA) hpSide hNonDeg
  change 0 ≤ inner ℝ (p - M.v3) (M.v1 - M.v3)
  rw [hpCone, inner_add_left, real_inner_smul_left, real_inner_smul_left]
  exact add_nonneg
    (mul_nonneg ht real_inner_self_nonneg)
    (mul_nonneg hs (by rw [real_inner_comm]; exact P.inner_at_v3))

/-- Two intersecting four-point rows produce the equality skeleton used by
`MECStraddlingRowCore`.  The first row is centered at `a` and contains
`o,s,p`; the second is centered at `s` and contains `a,o,x,y`. -/
def coreOfTwoRows {α : Type*} {P : RowPattern α}
    (o a p s x y : α) (hoa : o ≠ a)
    (ho_a : o ∈ P a) (hs_a : s ∈ P a) (hp_a : p ∈ P a)
    (ha_s : a ∈ P s) (ho_s : o ∈ P s)
    (hx_s : x ∈ P s) (hy_s : y ∈ P s) :
    Core P where
  o := o
  a := a
  p := p
  s := s
  x := x
  y := y
  hoa := hoa
  oa_ap := by
    apply EdgeClosure.trans (EdgeClosure.flip o a)
    exact EdgeClosure.row a o p ho_a hp_a
  oa_os := by
    apply EdgeClosure.trans (EdgeClosure.flip o a)
    apply EdgeClosure.trans (EdgeClosure.row a o s ho_a hs_a)
    apply EdgeClosure.trans (EdgeClosure.flip a s)
    apply EdgeClosure.trans (EdgeClosure.row s a o ha_s ho_s)
    exact EdgeClosure.flip s o
  oa_sx := by
    apply EdgeClosure.trans (EdgeClosure.flip o a)
    apply EdgeClosure.trans (EdgeClosure.row a o s ho_a hs_a)
    apply EdgeClosure.trans (EdgeClosure.flip a s)
    exact EdgeClosure.row s a x ha_s hx_s
  oa_sy := by
    apply EdgeClosure.trans (EdgeClosure.flip o a)
    apply EdgeClosure.trans (EdgeClosure.row a o s ho_a hs_a)
    apply EdgeClosure.trans (EdgeClosure.flip a s)
    exact EdgeClosure.row s a y ha_s hy_s

/-- Conditional consumer: the two rows close as soon as the matching ambient
MEC/disk/nonobtuse/orientation packet is available. -/
theorem false_of_twoRows_of_geometry
    {α : Type*} {P : RowPattern α} {pointOf : α → ℝ²}
    (o a p s x y : α) (hoa : o ≠ a)
    (ho_a : o ∈ P a) (hs_a : s ∈ P a) (hp_a : p ∈ P a)
    (ha_s : a ∈ P s) (ho_s : o ∈ P s)
    (hx_s : x ∈ P s) (hy_s : y ∈ P s)
    (hreal : Realizes P pointOf)
    (geometry : Geometry pointOf
      (coreOfTwoRows o a p s x y hoa ho_a hs_a hp_a ha_s ho_s hx_s hy_s)) :
    False :=
  false_of_core hreal _ geometry

/-- The two apex rows used by the shard-`0` smallest frontier. -/
def shard0ApexPattern : RowPattern (Fin 12) := fun center =>
  if center = 1 then {0, 2, 6, 7}
  else if center = 2 then {0, 1, 9, 10}
  else ∅

/-- Shard `0`: `(o,a,p,s,x,y) = (0,1,6,2,9,10)`. -/
def shard0Core : Core shard0ApexPattern :=
  coreOfTwoRows 0 1 6 2 9 10
    (by decide) (by decide) (by decide) (by decide)
    (by decide) (by decide) (by decide) (by decide)

/-- The common two apex rows in the smallest frontiers for shards
`1`, `2`, `3`, and `20`. -/
def shards12320ApexPattern : RowPattern (Fin 12) := fun center =>
  if center = 0 then {1, 2, 3, 4}
  else if center = 2 then {0, 1, 9, 10}
  else ∅

/-- Shards `1/2/3/20`: `(o,a,p,s,x,y) = (1,0,3,2,9,10)`. -/
def shards12320Core : Core shards12320ApexPattern :=
  coreOfTwoRows 1 0 3 2 9 10
    (by decide) (by decide) (by decide) (by decide)
    (by decide) (by decide) (by decide) (by decide)

/-- The two apex rows used by the shard-`16` smallest frontier. -/
def shard16ApexPattern : RowPattern (Fin 12) := fun center =>
  if center = 0 then {1, 2, 3, 4}
  else if center = 1 then {0, 2, 6, 7}
  else ∅

/-- Shard `16`: `(o,a,p,s,x,y) = (2,0,3,1,6,7)`. -/
def shard16Core : Core shard16ApexPattern :=
  coreOfTwoRows 2 0 3 1 6 7
    (by decide) (by decide) (by decide) (by decide)
    (by decide) (by decide) (by decide) (by decide)

theorem shard0_false_of_geometry {pointOf : Fin 12 → ℝ²}
    (hreal : Realizes shard0ApexPattern pointOf)
    (geometry : Geometry pointOf shard0Core) : False :=
  false_of_core hreal shard0Core geometry

theorem shards12320_false_of_geometry {pointOf : Fin 12 → ℝ²}
    (hreal : Realizes shards12320ApexPattern pointOf)
    (geometry : Geometry pointOf shards12320Core) : False :=
  false_of_core hreal shards12320Core geometry

theorem shard16_false_of_geometry {pointOf : Fin 12 → ℝ²}
    (hreal : Realizes shard16ApexPattern pointOf)
    (geometry : Geometry pointOf shard16Core) : False :=
  false_of_core hreal shard16Core geometry

#print axioms coreOfTwoRows
#print axioms inner_nonneg_of_mem_first_cap
#print axioms inner_nonneg_of_mem_second_cap
#print axioms inner_nonneg_of_mem_third_cap
#print axioms false_of_twoRows_of_geometry
#print axioms shard0_false_of_geometry
#print axioms shards12320_false_of_geometry
#print axioms shard16_false_of_geometry

end SixFrontierStructuralCore
end Scratch
end Problem97
