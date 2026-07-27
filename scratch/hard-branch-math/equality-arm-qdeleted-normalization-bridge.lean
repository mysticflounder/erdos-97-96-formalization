import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Exact missing bridge for first-apex q-deleted rows

The equality arm supplies exact ambient four-point radius classes, but a
`U5QDeletedK4Class` stores its own unconstrained witness radius.  This checked
lemma isolates the sole datum needed to identify such a row with a named
exact class: equality of those radii.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace EqualityArmQDeletedNormalization

attribute [local instance] Classical.propDecidable

theorem qDeleted_support_eq_exact_ambient_class_of_radius_eq
    {D : CounterexampleData} {deleted center : ℝ²}
    {B : Finset ℝ²} (K : U5QDeletedK4Class D deleted center B)
    {radius : ℝ}
    (hrowRadius : K.radius = radius)
    (hBcard : B.card = 4)
    (hclassCard : (SelectedClass D.A center radius).card = 4) :
    B = SelectedClass D.A center radius := by
  apply Finset.eq_of_subset_of_card_le
  · intro z hz
    have hzErased : z ∈ (D.skeleton deleted).erase center := K.subset hz
    have hzSkeleton : z ∈ D.skeleton deleted :=
      (Finset.mem_erase.mp hzErased).2
    have hzA : z ∈ D.A :=
      (Finset.mem_erase.mp hzSkeleton).2
    exact mem_selectedClass.mpr
      ⟨hzA, by simpa only [← hrowRadius] using K.same_radius z hz⟩
  · omega

#print axioms qDeleted_support_eq_exact_ambient_class_of_radius_eq

end EqualityArmQDeletedNormalization
end Problem97
