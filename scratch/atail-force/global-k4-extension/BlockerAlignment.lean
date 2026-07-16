/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Critical-blocker alignment supplies the missing exact-row equality

This scratch file checks the coupling used by the global K4 extension audit.
If the blocker selected for `source` is a center carrying an independently
chosen global four-class, deletion criticality forces that class to be the
critical shell and hence to contain `source`.
-/

open scoped EuclideanGeometry

namespace Problem97.ATailGlobalK4Extension

/-- A blocker-center alignment identifies an independently selected global
four-class with the critical shell selected for the source. -/
theorem selected_support_eq_critical_support_of_blocker_alignment
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source center : ℝ²} (hsource : source ∈ A)
    (K : SelectedFourClass A center)
    (halign : H.centerAt source hsource = center) :
    K.support =
      (H.selectedAt source hsource).toCriticalFourShell.support := by
  subst center
  exact H.selectedFourClass_support_eq_shell source hsource K

/-- Consequently, one already-known member of the global row and the newly
aligned source are equidistant from its center.  This is exactly the h4/h5
edge-completion mechanism used in the U1 bank match. -/
theorem dist_eq_of_blocker_alignment
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source center anchor : ℝ²} (hsource : source ∈ A)
    (K : SelectedFourClass A center)
    (halign : H.centerAt source hsource = center)
    (hanchor : anchor ∈ K.support) :
    dist center anchor = dist center source := by
  subst center
  have hsourceK : source ∈ K.support :=
    H.source_mem_selectedFourClass source hsource K
  exact (K.support_eq_radius anchor hanchor).trans
    (K.support_eq_radius source hsourceK).symm

/-- Choice-invariant form of the same coupling.  If deleting `source` destroys
K4 at a prescribed `center`, then every independently selected global
four-class at that center contains `source`; otherwise that class would remain
a K4 witness after the deletion. -/
theorem source_mem_selected_support_of_prescribed_deletion_criticality
    {A : Finset ℝ²} {source center : ℝ²}
    (K : SelectedFourClass A center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase source) center) :
    source ∈ K.support := by
  by_contra hsourceK
  apply hblocked
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ ((A.erase source).filter
        fun z => dist center z = K.radius).card :=
      Finset.card_le_card (by
        intro z hz
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr
              ⟨fun hzsource => hsourceK (by simpa [hzsource] using hz),
                K.support_subset_A hz⟩,
            K.support_eq_radius z hz⟩)

/-- Prescribed-center deletion criticality is already the exact row-extension
adapter: an old member `anchor` and the deleted `source` have the same radius
from `center`.  No arbitrary critical-shell selector occurs in the statement. -/
theorem dist_eq_of_prescribed_deletion_criticality
    {A : Finset ℝ²} {source center anchor : ℝ²}
    (K : SelectedFourClass A center)
    (hanchor : anchor ∈ K.support)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase source) center) :
    dist center anchor = dist center source := by
  have hsourceK : source ∈ K.support :=
    source_mem_selected_support_of_prescribed_deletion_criticality K hblocked
  exact (K.support_eq_radius anchor hanchor).trans
    (K.support_eq_radius source hsourceK).symm

/-- The current-bank `h5` adapter:
`not K4 at f after erasing d` extends the selected row at `f` from `a` to
`d`. -/
theorem h5_of_prescribed_deletion_criticality
    {A : Finset ℝ²} {a d f : ℝ²}
    (Kf : SelectedFourClass A f)
    (ha : a ∈ Kf.support)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase d) f) :
    dist f a = dist f d :=
  dist_eq_of_prescribed_deletion_criticality Kf ha hblocked

/-- The mirror current-bank `h4` adapter:
`not K4 at d after erasing f` extends the selected row at `d` from `c` to
`f`. -/
theorem h4_of_prescribed_deletion_criticality
    {A : Finset ℝ²} {c d f : ℝ²}
    (Kd : SelectedFourClass A d)
    (hc : c ∈ Kd.support)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase f) d) :
    dist d c = dist d f :=
  dist_eq_of_prescribed_deletion_criticality Kd hc hblocked

#print axioms selected_support_eq_critical_support_of_blocker_alignment
#print axioms dist_eq_of_blocker_alignment
#print axioms source_mem_selected_support_of_prescribed_deletion_criticality
#print axioms dist_eq_of_prescribed_deletion_criticality
#print axioms h5_of_prescribed_deletion_criticality
#print axioms h4_of_prescribed_deletion_criticality

end Problem97.ATailGlobalK4Extension
