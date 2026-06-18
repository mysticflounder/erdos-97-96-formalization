import Erdos9796Proof.P97.N9Endpoint.N4e

/-!
# A1 endpoint-shell bridge lemmas (public-extract trim)

This is the trimmed, public-extract version of `A1SpineWiring.lean`.  It
keeps only the endpoint-shell bridge lemmas that the kernel-closed
`Problem97.FiniteN9Closure` spine actually consumes:

* `mem_C2_of_mem_I2`, `mem_C3_of_mem_I3`, `mem_A_of_mem_I2`,
  `not_triangle_of_mem_I2`, `ne_of_mem_I2_of_mem_I3` — cap-membership /
  distinctness facts for interior points of the opposite caps;
* `FormBv1A2SelectorV2LowerPacketPublic`, `SelectorV3Qb2PacketPublic` —
  the public selector-packet predicates used by the Form-`B`/`C`
  exclusion files.

The off-spine row-layer wiring of the working repo (the `A1RowLayer` /
`A1Bridge*` certificate cluster and the `q'=E b₂` residual gate that was
left as a SORRY-GATE) is **not** part of the published proof and has
been dropped from this extract.
-/

open Finset Problem97
open scoped EuclideanGeometry

namespace Problem97
namespace FiniteEndpointShell

/-- Interior points of `I₂` lie on the second opposite cap. -/
theorem mem_C2_of_mem_I2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I2) :
    x ∈ S.CP.C2 :=
  Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx)

/-- Interior points of `I₃` lie on the third opposite cap. -/
theorem mem_C3_of_mem_I3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I3) :
    x ∈ S.CP.C3 :=
  Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx)

/-- `I₂` points lie in `A`. -/
theorem mem_A_of_mem_I2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I2) :
    x ∈ A :=
  S.CP.C2_subset (mem_C2_of_mem_I2 hx)

/-- `I₂` excludes the three Moser vertices. -/
theorem not_triangle_of_mem_I2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I2) :
    x ∉ S.triangle.verts := by
  have hxv1 : x ≠ S.triangle.v1 := (Finset.mem_erase.mp hx).1
  have hxv3 : x ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hx).2).1
  have hxC2 : x ∈ S.CP.C2 := mem_C2_of_mem_I2 hx
  have hxv2 : x ≠ S.triangle.v2 := by
    intro h
    exact S.CP.v2_notin_C2 (h ▸ hxC2)
  simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]

/-- Interior points from two different opposite caps are distinct. -/
theorem ne_of_mem_I2_of_mem_I3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x y : ℝ²} (hx : x ∈ S.I2) (hy : y ∈ S.I3) :
    x ≠ y := by
  intro hxy
  have hxA : x ∈ A := mem_A_of_mem_I2 hx
  have hxnon : x ∉ S.triangle.verts := not_triangle_of_mem_I2 hx
  have hxC2 : x ∈ S.CP.C2 := mem_C2_of_mem_I2 hx
  have hxC3 : x ∈ S.CP.C3 := by simpa [hxy] using mem_C3_of_mem_I3 hy
  have hone := S.CP.nonmoser_in_one x hxA hxnon
  by_cases hxC1 : x ∈ S.CP.C1
  · simp [hxC1, hxC2, hxC3] at hone
  · simp [hxC1, hxC2, hxC3] at hone

/-- Public mirror of the private `x = a₂`, lower-side packet from
`N9EndpointN4e.lean`.  This is the exact `S(v₂)` branch context for the q′=E
b₂ rows. -/
def FormBv1A2SelectorV2LowerPacketPublic
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 s
  (Z.a2 : ℝ²) ∈ S.I2 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²) ∧
  T.card = 4 ∧
  S.I2 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) ∧
  ((T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
   (T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))

/-- Public mirror of the q′=E branch of `selectorShape_v3_split`: the forced
`v₃` selector contains the whole lower pair `I₃`, meets `C₂` in `{b₂}`, and
meets `C₁` in one of the two upper named witnesses `{a₁,b₁}`. -/
def SelectorV3Qb2PacketPublic
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (t : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 t
  S.I3 ⊆ T ∧
  ∃ p : ℝ²,
    p ∈ ({Z.a1, Z.b1} : Finset ℝ²) ∧
    T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
    T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)

end FiniteEndpointShell
end Problem97
