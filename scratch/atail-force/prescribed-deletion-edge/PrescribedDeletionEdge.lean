/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Prescribed-deletion edge adapters

This scratch file checks the exact terminal adapter for the proposed `h4`/`h5`
lane.  It deliberately does not postulate the open geometric producer.

There are two equivalent ways for the missing content to arrive:

* deletion of the prescribed endpoint destroys K4 at the prescribed center; or
* the retained `CriticalShellSystem` actually chooses that center as the
  endpoint's blocker.

Either form forces the endpoint into every selected global four-class at that
center.  Thus it supplies the desired radius equality, and it is immediately
contradictory when the endpoint is known to lie outside the selected support.
-/

open scoped EuclideanGeometry

namespace Problem97.ATailPrescribedDeletionEdge

/-- A selected four-class whose support omits `source` survives deletion of
`source`.  This records the exact polarity of the proposed terminal edge. -/
theorem deletion_survives_of_not_mem_selected_support
    {A : Finset ℝ²} {source center : ℝ²}
    (K : SelectedFourClass A center)
    (hsource : source ∉ K.support) :
    HasNEquidistantPointsAt 4 (A.erase source) center := by
  refine ⟨K.radius, K.radius_pos, ?_⟩
  calc
    4 = K.support.card := K.support_card.symm
    _ ≤ ((A.erase source).filter
        fun z => dist center z = K.radius).card :=
      Finset.card_le_card (by
        intro z hz
        exact Finset.mem_filter.mpr
          ⟨Finset.mem_erase.mpr
              ⟨fun hzsource => hsource (by simpa [hzsource] using hz),
                K.support_subset_A hz⟩,
            K.support_eq_radius z hz⟩)

/-- The honest branch-complete local output is a direct radius-row extension
or deletion survival.  Deletion *failure* is not an independent producer arm:
if the endpoint belongs to the selected support, the equality is already
present; if it does not, the same support survives its deletion. -/
theorem row_extension_or_deletion_survives
    {A : Finset ℝ²} {source center anchor : ℝ²}
    (K : SelectedFourClass A center)
    (hanchor : anchor ∈ K.support) :
    dist center anchor = dist center source ∨
      HasNEquidistantPointsAt 4 (A.erase source) center := by
  by_cases hsource : source ∈ K.support
  · exact Or.inl <|
      (K.support_eq_radius anchor hanchor).trans
        (K.support_eq_radius source hsource).symm
  · exact Or.inr
      (deletion_survives_of_not_mem_selected_support K hsource)

/-- Preferred `h4` normal form: either the row is already extended from `c`
to `f`, or the row itself witnesses K4 after deleting `f`. -/
theorem h4_or_f_deletion_survives
    {A : Finset ℝ²} {c d f : ℝ²}
    (Kd : SelectedFourClass A d) (hc : c ∈ Kd.support) :
    dist d c = dist d f ∨
      HasNEquidistantPointsAt 4 (A.erase f) d :=
  row_extension_or_deletion_survives Kd hc

/-- Preferred `h5` normal form: either the row is already extended from `a`
to `d`, or the row itself witnesses K4 after deleting `d`. -/
theorem h5_or_d_deletion_survives
    {A : Finset ℝ²} {a d f : ℝ²}
    (Kf : SelectedFourClass A f) (ha : a ∈ Kf.support) :
    dist f a = dist f d ∨
      HasNEquidistantPointsAt 4 (A.erase d) f :=
  row_extension_or_deletion_survives Kf ha

/-- Therefore a prescribed deletion failure and an already selected support
omitting the deleted point are a terminal contradiction. -/
theorem false_of_prescribed_deletion_failure_and_not_mem
    {A : Finset ℝ²} {source center : ℝ²}
    (K : SelectedFourClass A center)
    (hsource : source ∉ K.support)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase source) center) : False :=
  hblocked (deletion_survives_of_not_mem_selected_support K hsource)

/-- Choice-invariant radius extension: prescribed deletion failure forces the
deleted source into the selected row, hence onto the anchor's circle. -/
theorem dist_eq_of_prescribed_deletion_failure
    {A : Finset ℝ²} {source center anchor : ℝ²}
    (K : SelectedFourClass A center)
    (hanchor : anchor ∈ K.support)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (A.erase source) center) :
    dist center anchor = dist center source := by
  have hsource : source ∈ K.support := by
    by_contra hsource
    exact false_of_prescribed_deletion_failure_and_not_mem K hsource hblocked
  exact (K.support_eq_radius anchor hanchor).trans
    (K.support_eq_radius source hsource).symm

/-- Alignment with the retained source-indexed critical map gives the
prescribed deletion failure without reconstructing a new selector. -/
theorem prescribed_deletion_failure_of_actual_blocker_alignment
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source center : ℝ²} (hsource : source ∈ A)
    (halign : H.centerAt source hsource = center) :
    ¬ HasNEquidistantPointsAt 4 (A.erase source) center := by
  subst center
  exact H.no_qfree_at source hsource

/-- Actual-map alignment is already the exact radius-row extension consumed
by the `h4`/`h5` branch. -/
theorem dist_eq_of_actual_blocker_alignment
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {source center anchor : ℝ²} (hsource : source ∈ A)
    (K : SelectedFourClass A center)
    (halign : H.centerAt source hsource = center)
    (hanchor : anchor ∈ K.support) :
    dist center anchor = dist center source :=
  dist_eq_of_prescribed_deletion_failure K hanchor
    (prescribed_deletion_failure_of_actual_blocker_alignment
      H hsource halign)

/-- Correlated actual-map alignment supplies exactly one of the two preferred
consumer equalities:

* `centerAt f = d` gives `h4 : dist d c = dist d f`;
* `centerAt d = f` gives `h5 : dist f a = dist f d`.
-/
theorem h4_or_h5_of_actual_blocker_alignment
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {a c d f : ℝ²} (hd : d ∈ A) (hf : f ∈ A)
    (Kd : SelectedFourClass A d) (Kf : SelectedFourClass A f)
    (hc : c ∈ Kd.support) (ha : a ∈ Kf.support)
    (halign :
      H.centerAt f hf = d ∨ H.centerAt d hd = f) :
    dist d c = dist d f ∨ dist f a = dist f d := by
  rcases halign with hfd | hdf
  · exact Or.inl
      (dist_eq_of_actual_blocker_alignment H hf Kd hfd hc)
  · exact Or.inr
      (dist_eq_of_actual_blocker_alignment H hd Kf hdf ha)

/-- If the preferred endpoint is recorded outside the corresponding selected
support, the same actual-map alignment is terminal immediately. -/
theorem false_of_aligned_h4_or_h5_outside_support
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    {d f : ℝ²} (hd : d ∈ A) (hf : f ∈ A)
    (Kd : SelectedFourClass A d) (Kf : SelectedFourClass A f)
    (hterminal :
      (H.centerAt f hf = d ∧ f ∉ Kd.support) ∨
        (H.centerAt d hd = f ∧ d ∉ Kf.support)) : False := by
  rcases hterminal with ⟨hfd, hfOff⟩ | ⟨hdf, hdOff⟩
  · exact false_of_prescribed_deletion_failure_and_not_mem Kd hfOff
      (prescribed_deletion_failure_of_actual_blocker_alignment H hf hfd)
  · exact false_of_prescribed_deletion_failure_and_not_mem Kf hdOff
      (prescribed_deletion_failure_of_actual_blocker_alignment H hd hdf)

/-- Global K4 in the live counterexample datum supplies a coherent selected
row at every carrier point.  The gauge is pinned to an actual MEC-triangle
vertex from the supplied cap packet, so no local row selector is invented. -/
theorem global_rows_exist_from_counterexample_and_cap_packet
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    Nonempty (FaithfulCarrierPattern D.A) :=
  exists_faithfulCarrierPattern_of_globalK4 D.K4 S.triangle.v1_mem

#print axioms deletion_survives_of_not_mem_selected_support
#print axioms row_extension_or_deletion_survives
#print axioms h4_or_f_deletion_survives
#print axioms h5_or_d_deletion_survives
#print axioms false_of_prescribed_deletion_failure_and_not_mem
#print axioms dist_eq_of_prescribed_deletion_failure
#print axioms prescribed_deletion_failure_of_actual_blocker_alignment
#print axioms dist_eq_of_actual_blocker_alignment
#print axioms h4_or_h5_of_actual_blocker_alignment
#print axioms false_of_aligned_h4_or_h5_outside_support
#print axioms global_rows_exist_from_counterexample_and_cap_packet

end Problem97.ATailPrescribedDeletionEdge
