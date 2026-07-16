import Erdos9796Proof.P97.U5GlobalIncidenceKernels
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Scratch: selected-class adapter for the banked U5 tetrahedron obstruction

The sibling `p97-rvol` theorem bank contains
`U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility`.  Its
metric proof does not use the common deleted source: the contradiction follows
already from three ordinary selected four-classes with the displayed support
incidences.  This scratch adapter records that weaker, production-facing
interface for the ATAIL equilateral continuation.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailTetrahedronBankAdapterScratch

/-- Three selected four-classes cannot realize the incidence pattern of a
four-point equidistant tetrahedron in the plane.

The class at `x` contains `y,a`; the class at `y` contains `x,a,b`; and the
class at `b` contains `x,y,a`.  All six distances among `x,y,a,b` are then the
positive radius of the first class. -/
theorem false_of_three_selected_classes_tetrahedron
    {A : Finset ℝ²} {x y a b : ℝ²}
    (Kx : SelectedFourClass A x)
    (Ky : SelectedFourClass A y)
    (Kb : SelectedFourClass A b)
    (hyKx : y ∈ Kx.support)
    (haKx : a ∈ Kx.support)
    (hxKy : x ∈ Ky.support)
    (haKy : a ∈ Ky.support)
    (hbKy : b ∈ Ky.support)
    (hxKb : x ∈ Kb.support)
    (hyKb : y ∈ Kb.support)
    (haKb : a ∈ Kb.support) : False := by
  let r := Kx.radius
  have hxy : dist x y = r := Kx.support_eq_radius y hyKx
  have hxa : dist x a = r := Kx.support_eq_radius a haKx
  have hyr : Ky.radius = r := by
    calc
      Ky.radius = dist y x := (Ky.support_eq_radius x hxKy).symm
      _ = dist x y := dist_comm y x
      _ = r := hxy
  have hya : dist y a = r := by
    rw [Ky.support_eq_radius a haKy, hyr]
  have hyb : dist y b = r := by
    rw [Ky.support_eq_radius b hbKy, hyr]
  have hbr : Kb.radius = r := by
    calc
      Kb.radius = dist b y := (Kb.support_eq_radius y hyKb).symm
      _ = dist y b := dist_comm b y
      _ = r := hyb
  have hxb : dist x b = r := by
    calc
      dist x b = dist b x := dist_comm x b
      _ = Kb.radius := Kb.support_eq_radius x hxKb
      _ = r := hbr
  have hab : dist a b = r := by
    calc
      dist a b = dist b a := dist_comm a b
      _ = Kb.radius := Kb.support_eq_radius a haKb
      _ = r := hbr
  exact u5_unit_triangle_on_p_circle_incompatibility
    Kx.radius_pos hxy hxa hxb hya hyb hab

#print axioms false_of_three_selected_classes_tetrahedron

end ATailTetrahedronBankAdapterScratch
end Problem97
