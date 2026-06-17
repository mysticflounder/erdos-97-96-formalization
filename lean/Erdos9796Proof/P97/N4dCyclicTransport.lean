import Erdos9796Proof.P97.N4dExcludesFormAv1
import Erdos9796Proof.P97.N4dExcludesFormBv1
import Erdos9796Proof.P97.N4dExcludesFormCv1

/-!
# Cyclic transport for `N4d` form exclusions

This module transports the `v₁` Form `a`/`b`/`c` exclusions around the cyclic
labelling of the endpoint shell.  The transport is only a relabelling of the
Moser vertices, caps, interiors, and witness classes; it introduces no new
geometric input.
-/

open scoped EuclideanGeometry
open scoped InnerProductSpace
open Finset

namespace Problem97
namespace FiniteEndpointShell

/-- Rotate the MEC-level non-obtuse triangle so the old `v₂` is first. -/
private noncomputable def cyclicShiftMT {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.MEC.NonObtuseCircumscribedMoserTriangle A S.hne S.hnoncol :=
  { toMoserTriangle :=
      { v1 := S.MT.toMoserTriangle.v2
        v2 := S.MT.toMoserTriangle.v3
        v3 := S.MT.toMoserTriangle.v1
        v1_mem := S.MT.toMoserTriangle.v2_mem
        v2_mem := S.MT.toMoserTriangle.v3_mem
        v3_mem := S.MT.toMoserTriangle.v1_mem
        v1_boundary := S.MT.toMoserTriangle.v2_boundary
        v2_boundary := S.MT.toMoserTriangle.v3_boundary
        v3_boundary := S.MT.toMoserTriangle.v1_boundary
        case_split := by
          obtain ⟨h12, h23, h13, _⟩ := S.hCirc
          exact Or.inl ⟨h23, h13.symm, h12.symm⟩ }
    inner_at_v1 := S.MT.inner_at_v2
    inner_at_v2 := S.MT.inner_at_v3
    inner_at_v3 := S.MT.inner_at_v1 }

/-- Circumscribed-case witness for `cyclicShiftMT`. -/
private theorem cyclicShift_hCirc {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ h12 h23 h13,
      (cyclicShiftMT S).toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩ := by
  obtain ⟨h12, h23, h13, _⟩ := S.hCirc
  exact ⟨h23, h13.symm, h12.symm, rfl⟩

private theorem not_mem_verts_of_not_mem_cyclicShift_verts
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {v : ℝ²}
    (hv : v ∉ ((cyclicShiftMT S).toMoserTriangle.toStructural
      (cyclicShift_hCirc S)).verts) :
    v ∉ S.triangle.verts := by
  intro hvOld
  apply hv
  unfold Problem97.MoserTriangle.verts at hvOld ⊢
  simp only [mem_insert, mem_singleton] at hvOld ⊢
  rcases hvOld with h | h | h
  · exact Or.inr (Or.inr h)
  · exact Or.inl h
  · exact Or.inr (Or.inl h)

/-- Rotate the cap triple so the old `C₂` is first. -/
private noncomputable def cyclicShiftCP {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.CapTriple A
      ((cyclicShiftMT S).toMoserTriangle.toStructural (cyclicShift_hCirc S)) :=
  { C1 := S.CP.C2
    C2 := S.CP.C3
    C3 := S.CP.C1
    C1_subset := S.CP.C2_subset
    C2_subset := S.CP.C3_subset
    C3_subset := S.CP.C1_subset
    v1_notin_C1 := S.CP.v2_notin_C2
    v2_mem_C1 := S.CP.v3_mem_C2
    v3_mem_C1 := S.CP.v1_mem_C2
    v1_mem_C2 := S.CP.v2_mem_C3
    v2_notin_C2 := S.CP.v3_notin_C3
    v3_mem_C2 := S.CP.v1_mem_C3
    v1_mem_C3 := S.CP.v2_mem_C1
    v2_mem_C3 := S.CP.v3_mem_C1
    v3_notin_C3 := S.CP.v1_notin_C1
    nonmoser_in_one := by
      classical
      intro v hvA hv
      have hvOld := not_mem_verts_of_not_mem_cyclicShift_verts S hv
      simpa [add_assoc, add_comm, add_left_comm] using S.CP.nonmoser_in_one v hvA hvOld
    arc_membership := by
      intro v hvA
      have h := S.CP.arc_membership v hvA
      exact ⟨h.2.1, h.2.2, h.1⟩ }

/-- The circumscribed MEC packet rotated so the old `v₂` is first. -/
private noncomputable def cyclicShiftPacket {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.CircumscribedMECPacket A
      ((cyclicShiftMT S).toMoserTriangle.toStructural (cyclicShift_hCirc S)) :=
  { center := S.Packet.center
    radius := S.Packet.radius
    radius_pos := S.Packet.radius_pos
    moser_on_boundary_1 := S.Packet.moser_on_boundary_2
    moser_on_boundary_2 := S.Packet.moser_on_boundary_3
    moser_on_boundary_3 := S.Packet.moser_on_boundary_1
    inner_at_v1 := S.Packet.inner_at_v2
    inner_at_v2 := S.Packet.inner_at_v3
    inner_at_v3 := S.Packet.inner_at_v1
    disk_contains_A := S.Packet.disk_contains_A }

/-- The cyclic relabelling of the shell, with the old `v₂` as new `v₁`. -/
@[reducible] noncomputable def cyclicShift {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    FiniteEndpointShell A :=
  { hne := S.hne
    hcard9 := S.hcard9
    hconv := S.hconv
    hK4 := S.hK4
    hnoncol := S.hnoncol
    hbd := S.hbd
    MT := cyclicShiftMT S
    hCirc := cyclicShift_hCirc S
    CP := cyclicShiftCP S
    hcapSum12 := by
      simpa [cyclicShiftCP, add_assoc, add_comm, add_left_comm] using S.hcapSum12
    Packet := cyclicShiftPacket S }

/-- Rotate the MEC-level non-obtuse triangle so the old `v₃` is first. -/
private noncomputable def cyclicShift3MT {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.MEC.NonObtuseCircumscribedMoserTriangle A S.hne S.hnoncol :=
  { toMoserTriangle :=
      { v1 := S.MT.toMoserTriangle.v3
        v2 := S.MT.toMoserTriangle.v1
        v3 := S.MT.toMoserTriangle.v2
        v1_mem := S.MT.toMoserTriangle.v3_mem
        v2_mem := S.MT.toMoserTriangle.v1_mem
        v3_mem := S.MT.toMoserTriangle.v2_mem
        v1_boundary := S.MT.toMoserTriangle.v3_boundary
        v2_boundary := S.MT.toMoserTriangle.v1_boundary
        v3_boundary := S.MT.toMoserTriangle.v2_boundary
        case_split := by
          obtain ⟨h12, h23, h13, _⟩ := S.hCirc
          exact Or.inl ⟨h13.symm, h12, h23.symm⟩ }
    inner_at_v1 := S.MT.inner_at_v3
    inner_at_v2 := S.MT.inner_at_v1
    inner_at_v3 := S.MT.inner_at_v2 }

/-- Circumscribed-case witness for `cyclicShift3MT`. -/
private theorem cyclicShift3_hCirc {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ h12 h23 h13,
      (cyclicShift3MT S).toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩ := by
  obtain ⟨h12, h23, h13, _⟩ := S.hCirc
  exact ⟨h13.symm, h12, h23.symm, rfl⟩

private theorem not_mem_verts_of_not_mem_cyclicShift3_verts
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {v : ℝ²}
    (hv : v ∉ ((cyclicShift3MT S).toMoserTriangle.toStructural
      (cyclicShift3_hCirc S)).verts) :
    v ∉ S.triangle.verts := by
  intro hvOld
  apply hv
  unfold Problem97.MoserTriangle.verts at hvOld ⊢
  simp only [mem_insert, mem_singleton] at hvOld ⊢
  rcases hvOld with h | h | h
  · exact Or.inr (Or.inl h)
  · exact Or.inr (Or.inr h)
  · exact Or.inl h

/-- Rotate the cap triple so the old `C₃` is first. -/
private noncomputable def cyclicShift3CP {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.CapTriple A
      ((cyclicShift3MT S).toMoserTriangle.toStructural (cyclicShift3_hCirc S)) :=
  { C1 := S.CP.C3
    C2 := S.CP.C1
    C3 := S.CP.C2
    C1_subset := S.CP.C3_subset
    C2_subset := S.CP.C1_subset
    C3_subset := S.CP.C2_subset
    v1_notin_C1 := S.CP.v3_notin_C3
    v2_mem_C1 := S.CP.v1_mem_C3
    v3_mem_C1 := S.CP.v2_mem_C3
    v1_mem_C2 := S.CP.v3_mem_C1
    v2_notin_C2 := S.CP.v1_notin_C1
    v3_mem_C2 := S.CP.v2_mem_C1
    v1_mem_C3 := S.CP.v3_mem_C2
    v2_mem_C3 := S.CP.v1_mem_C2
    v3_notin_C3 := S.CP.v2_notin_C2
    nonmoser_in_one := by
      classical
      intro v hvA hv
      have hvOld := not_mem_verts_of_not_mem_cyclicShift3_verts S hv
      simpa [add_assoc, add_comm, add_left_comm] using S.CP.nonmoser_in_one v hvA hvOld
    arc_membership := by
      intro v hvA
      have h := S.CP.arc_membership v hvA
      exact ⟨h.2.2, h.1, h.2.1⟩ }

/-- The circumscribed MEC packet rotated so the old `v₃` is first. -/
private noncomputable def cyclicShift3Packet {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Problem97.CircumscribedMECPacket A
      ((cyclicShift3MT S).toMoserTriangle.toStructural (cyclicShift3_hCirc S)) :=
  { center := S.Packet.center
    radius := S.Packet.radius
    radius_pos := S.Packet.radius_pos
    moser_on_boundary_1 := S.Packet.moser_on_boundary_3
    moser_on_boundary_2 := S.Packet.moser_on_boundary_1
    moser_on_boundary_3 := S.Packet.moser_on_boundary_2
    inner_at_v1 := S.Packet.inner_at_v3
    inner_at_v2 := S.Packet.inner_at_v1
    inner_at_v3 := S.Packet.inner_at_v2
    disk_contains_A := S.Packet.disk_contains_A }

/-- The direct cyclic relabelling of the shell, with the old `v₃` as new `v₁`. -/
@[reducible] noncomputable def cyclicShift3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    FiniteEndpointShell A :=
  { hne := S.hne
    hcard9 := S.hcard9
    hconv := S.hconv
    hK4 := S.hK4
    hnoncol := S.hnoncol
    hbd := S.hbd
    MT := cyclicShift3MT S
    hCirc := cyclicShift3_hCirc S
    CP := cyclicShift3CP S
    hcapSum12 := by
      simpa [cyclicShift3CP, add_assoc, add_comm, add_left_comm] using S.hcapSum12
    Packet := cyclicShift3Packet S }

/-- The shifted shell's structural triangle is `S.triangle2`. -/
theorem cyclicShift_triangle {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift).triangle = S.triangle2 := by
  rfl

/-- The direct third-position shift has structural triangle `S.triangle3`. -/
theorem cyclicShift3_triangle {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift3).triangle = S.triangle3 := by
  rfl

theorem cyclicShift_witnessClassAt_v1 {A : Finset ℝ²}
    (S : FiniteEndpointShell A) (r : ℝ) :
    (S.cyclicShift).witnessClassAt_v1 r = S.witnessClassAt_v2 r := by
  rfl

theorem cyclicShift3_witnessClassAt_v1 {A : Finset ℝ²}
    (S : FiniteEndpointShell A) (r : ℝ) :
    (S.cyclicShift3).witnessClassAt_v1 r = S.witnessClassAt_v3 r := by
  rfl

theorem cyclicShift_I1 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift).I1 = S.I2 := by
  rfl

theorem cyclicShift_I2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift).I2 = S.I3 := by
  rfl

theorem cyclicShift_I3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift).I3 = S.I1 := by
  rfl

theorem cyclicShift3_I1 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift3).I1 = S.I3 := by
  rfl

theorem cyclicShift3_I2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift3).I2 = S.I1 := by
  rfl

theorem cyclicShift3_I3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift3).I3 = S.I2 := by
  rfl

theorem cyclicShift_CP_C1 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift).CP.C1 = S.CP.C2 := by
  rfl

theorem cyclicShift_CP_C2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift).CP.C2 = S.CP.C3 := by
  rfl

theorem cyclicShift_CP_C3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift).CP.C3 = S.CP.C1 := by
  rfl

theorem cyclicShift3_CP_C1 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift3).CP.C1 = S.CP.C3 := by
  rfl

theorem cyclicShift3_CP_C2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift3).CP.C2 = S.CP.C1 := by
  rfl

theorem cyclicShift3_CP_C3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift3).CP.C3 = S.CP.C2 := by
  rfl

theorem cyclicShift_triangle_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift).triangle.v2 = S.triangle.v3 := by
  rfl

theorem cyclicShift_triangle_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift).triangle.v3 = S.triangle.v1 := by
  rfl

theorem cyclicShift3_triangle_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift3).triangle.v2 = S.triangle.v1 := by
  rfl

theorem cyclicShift3_triangle_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    (S.cyclicShift3).triangle.v3 = S.triangle.v2 := by
  rfl

/-- Form `a` transport from old `v₂` to shifted `v₁`. -/
theorem isFormA_v1_cyclicShift {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (r : ℝ) : (S.cyclicShift).IsFormA_v1 r ↔ S.IsFormA_v2 r := by
  rfl

/-- Form `b` transport from old `v₂` to shifted `v₁`. -/
theorem isFormB_v1_cyclicShift {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (r : ℝ) : (S.cyclicShift).IsFormB_v1 r ↔ S.IsFormB_v2 r := by
  rfl

/-- Form `c` transport from old `v₂` to shifted `v₁`. -/
theorem isFormC_v1_cyclicShift {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (r : ℝ) : (S.cyclicShift).IsFormC_v1 r ↔ S.IsFormC_v2 r := by
  rfl

/-- Form `a` transport from old `v₃` to direct shifted `v₁`. -/
theorem isFormA_v1_cyclicShift3 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (r : ℝ) : (S.cyclicShift3).IsFormA_v1 r ↔ S.IsFormA_v3 r := by
  rfl

/-- Form `b` transport from old `v₃` to direct shifted `v₁`. -/
theorem isFormB_v1_cyclicShift3 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (r : ℝ) : (S.cyclicShift3).IsFormB_v1 r ↔ S.IsFormB_v3 r := by
  rfl

/-- Form `c` transport from old `v₃` to direct shifted `v₁`. -/
theorem isFormC_v1_cyclicShift3 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (r : ℝ) : (S.cyclicShift3).IsFormC_v1 r ↔ S.IsFormC_v3 r := by
  rfl

/-- Cyclic transport of the Form `a` exclusion to `v₂`. -/
theorem N4dExcludesFormA_v2_proof
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4dExcludesFormA_v2 := by
  intro r hr hcard hesc hform
  exact N4dExcludesFormA_v1_proof (S.cyclicShift)
      (N4dExcludesFormB_v1_proof (S.cyclicShift.cyclicShift)) hr
    (by simpa [cyclicShift_witnessClassAt_v1] using hcard)
    (by simpa [cyclicShift_witnessClassAt_v1, cyclicShift_CP_C1] using hesc)
    ((isFormA_v1_cyclicShift S r).mpr hform)

/-- Cyclic transport of the Form `b` exclusion to `v₂`. -/
theorem N4dExcludesFormB_v2_proof
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4dExcludesFormB_v2 := by
  intro r hr hcard hesc hform
  exact N4dExcludesFormB_v1_proof (S.cyclicShift) (r := r) hr
    (by simpa [cyclicShift_witnessClassAt_v1] using hcard)
    (by simpa [cyclicShift_witnessClassAt_v1, cyclicShift_CP_C1] using hesc)
    ((isFormB_v1_cyclicShift S r).mpr hform)

/-- Cyclic transport of the Form `c` exclusion to `v₂`. -/
theorem N4dExcludesFormC_v2_proof
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4dExcludesFormC_v2 := by
  intro r hr hcard hesc hform
  exact N4dExcludesFormC_v1_proof (S.cyclicShift) (r := r) hr
    (by simpa [cyclicShift_witnessClassAt_v1] using hcard)
    (by simpa [cyclicShift_witnessClassAt_v1, cyclicShift_CP_C1] using hesc)
    ((isFormC_v1_cyclicShift S r).mpr hform)

/-- Direct cyclic transport of the Form `a` exclusion to `v₃`. -/
theorem N4dExcludesFormA_v3_proof
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4dExcludesFormA_v3 := by
  intro r hr hcard hesc hform
  exact N4dExcludesFormA_v1_proof (S.cyclicShift3)
      (N4dExcludesFormB_v1_proof S) hr
    (by simpa [cyclicShift3_witnessClassAt_v1] using hcard)
    (by simpa [cyclicShift3_witnessClassAt_v1, cyclicShift3_CP_C1] using hesc)
    ((isFormA_v1_cyclicShift3 S r).mpr hform)

/-- Direct cyclic transport of the Form `b` exclusion to `v₃`. -/
theorem N4dExcludesFormB_v3_proof
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4dExcludesFormB_v3 := by
  intro r hr hcard hesc hform
  exact N4dExcludesFormB_v1_proof (S.cyclicShift3) (r := r) hr
    (by simpa [cyclicShift3_witnessClassAt_v1] using hcard)
    (by simpa [cyclicShift3_witnessClassAt_v1, cyclicShift3_CP_C1] using hesc)
    ((isFormB_v1_cyclicShift3 S r).mpr hform)

/-- Direct cyclic transport of the Form `c` exclusion to `v₃`. -/
theorem N4dExcludesFormC_v3_proof
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4dExcludesFormC_v3 := by
  intro r hr hcard hesc hform
  exact N4dExcludesFormC_v1_proof (S.cyclicShift3) (r := r) hr
    (by simpa [cyclicShift3_witnessClassAt_v1] using hcard)
    (by simpa [cyclicShift3_witnessClassAt_v1, cyclicShift3_CP_C1] using hesc)
    ((isFormC_v1_cyclicShift3 S r).mpr hform)

end FiniteEndpointShell

end Problem97
