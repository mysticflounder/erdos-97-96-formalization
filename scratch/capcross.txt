/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ConvexCyclicOrder.Construct
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Convex-quadrilateral Kalmanson bridge

This module isolates the metric consequence of four points occurring in one
strictly convex boundary order. It deliberately does not claim the separate
adapter from two arbitrary `SurplusCapPacket` interiors to the four indices
required below.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace CapCrossingKalmansonBridge

/-- Four increasing vertices of one CCW enumeration have intersecting open
diagonals.  The proof reuses the current signed-side line-intersection theorem
and the current extreme-pair hull-line theorem. -/
theorem exists_mem_openSegment_diagonals_of_ccw
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {ia ib ic id : Fin A.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id) :
    ∃ z : ℝ²,
      z ∈ openSegment ℝ (phi ia) (phi ic) ∧
      z ∈ openSegment ℝ (phi ib) (phi id) := by
  have hiac : ia < ic := hiab.trans hibc
  have hiad : ia < id := hiac.trans hicd
  have hibd : ib < id := hibc.trans hicd
  have hphi_iac : phi ia ≠ phi ic := hphi_inj.ne hiac.ne
  have harea_iabic : signedArea2 (phi ia) (phi ib) (phi ic) < 0 :=
    hneg_of_ccw hphi_inj hccw hiab hibc
  have harea_iaicib : 0 < signedArea2 (phi ia) (phi ic) (phi ib) := by
    have hswap :
        signedArea2 (phi ia) (phi ic) (phi ib) =
          -signedArea2 (phi ia) (phi ib) (phi ic) := by
      simp only [signedArea2]
      ring
    rw [hswap]
    linarith
  have harea_iaicid : signedArea2 (phi ia) (phi ic) (phi id) < 0 :=
    hneg_of_ccw hphi_inj hccw hiac hicd
  obtain ⟨z, hzbd, hzline⟩ :=
    signedArea2_opposite_sign_openSegment_line_inter hphi_iac
      harea_iaicib harea_iaicid
  have hiaA : phi ia ∈ A := by
    rw [← hphi_image]
    exact Finset.mem_image_of_mem phi (Finset.mem_univ ia)
  have hibA : phi ib ∈ A := by
    rw [← hphi_image]
    exact Finset.mem_image_of_mem phi (Finset.mem_univ ib)
  have hicA : phi ic ∈ A := by
    rw [← hphi_image]
    exact Finset.mem_image_of_mem phi (Finset.mem_univ ic)
  have hidA : phi id ∈ A := by
    rw [← hphi_image]
    exact Finset.mem_image_of_mem phi (Finset.mem_univ id)
  have hibK : phi ib ∈ convexHull ℝ (A : Set ℝ²) :=
    subset_convexHull ℝ _ (by exact_mod_cast hibA)
  have hidK : phi id ∈ convexHull ℝ (A : Set ℝ²) :=
    subset_convexHull ℝ _ (by exact_mod_cast hidA)
  have hzK : z ∈ convexHull ℝ (A : Set ℝ²) :=
    (convex_convexHull ℝ (A : Set ℝ²)).openSegment_subset hibK hidK hzbd
  have hline_inter :=
    convexHull_line_inter_eq_segment_of_extreme_pair
      (A := A) (c := z) (phi := phi) hA hphi_inj hphi_image hiac
  have hzac : z ∈ segment ℝ (phi ia) (phi ic) := by
    have hzInter :
        z ∈ convexHull ℝ (A : Set ℝ²) ∩ line[ℝ, phi ia, phi ic] :=
      ⟨hzK, hzline⟩
    rwa [hline_inter] at hzInter
  have hz_ne_ia : z ≠ phi ia := by
    intro h
    subst z
    have hline_bd : phi ia ∈ line[ℝ, phi ib, phi id] :=
      (mem_segment_iff_wbtw.mp (openSegment_subset_segment ℝ _ _ hzbd)).mem_affineSpan
    have hcol : Collinear ℝ ({phi ia, phi ib, phi id} : Set ℝ²) :=
      collinear_insert_of_mem_affineSpan_pair hline_bd
    exact
      (not_collinear_of_convexIndep_triple hA hiaA hibA hidA
        (hphi_inj.ne hiab.ne) (hphi_inj.ne hibd.ne) (hphi_inj.ne hiad.ne)) hcol
  have hz_ne_ic : z ≠ phi ic := by
    intro h
    subst z
    have hline_bd : phi ic ∈ line[ℝ, phi ib, phi id] :=
      (mem_segment_iff_wbtw.mp (openSegment_subset_segment ℝ _ _ hzbd)).mem_affineSpan
    have hcol : Collinear ℝ ({phi ic, phi ib, phi id} : Set ℝ²) :=
      collinear_insert_of_mem_affineSpan_pair hline_bd
    exact
      (not_collinear_of_convexIndep_triple hA hicA hibA hidA
        (hphi_inj.ne hibc.ne).symm (hphi_inj.ne hibd.ne)
        (hphi_inj.ne hicd.ne)) hcol
  have hzOpenAc : z ∈ openSegment ℝ (phi ia) (phi ic) :=
    mem_openSegment_of_ne_left_right hz_ne_ia.symm hz_ne_ic.symm hzac
  exact ⟨z, hzOpenAc, hzbd⟩

/-- Two proper diagonal intersections, together with the two noncollinear
boundary triples, imply the strict Kalmanson inequality. -/
theorem dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals
    {a b c d z : ℝ²}
    (hzac : z ∈ openSegment ℝ a c)
    (hzbd : z ∈ openSegment ℝ b d)
    (habc : ¬ Collinear ℝ ({a, b, c} : Set ℝ²))
    (hacd : ¬ Collinear ℝ ({a, c, d} : Set ℝ²)) :
    dist b c + dist a d < dist a c + dist b d := by
  have hac_ne : a ≠ c := ne₁₃_of_not_collinear habc
  have hz_ne_a : z ≠ a := by
    intro h
    subst z
    exact hac_ne (left_mem_openSegment_iff.mp hzac)
  have hz_ne_c : z ≠ c := by
    intro h
    subst z
    exact hac_ne (right_mem_openSegment_iff.mp hzac)
  have hwac : Wbtw ℝ a z c :=
    mem_segment_iff_wbtw.mp (openSegment_subset_segment ℝ _ _ hzac)
  have hwbd : Wbtw ℝ b z d :=
    mem_segment_iff_wbtw.mp (openSegment_subset_segment ℝ _ _ hzbd)
  have hbc_not : ¬ Wbtw ℝ b z c := by
    intro hwbc
    have hcol_zac : Collinear ℝ ({z, a, c} : Set ℝ²) :=
      collinear_insert_of_mem_affineSpan_pair hwac.mem_affineSpan
    have hcol_zbc : Collinear ℝ ({z, b, c} : Set ℝ²) :=
      collinear_insert_of_mem_affineSpan_pair hwbc.mem_affineSpan
    have ha_line : a ∈ line[ℝ, z, c] :=
      hcol_zac.mem_affineSpan_of_mem_of_ne (by simp) (by simp) (by simp) hz_ne_c
    have hb_line : b ∈ line[ℝ, z, c] :=
      hcol_zbc.mem_affineSpan_of_mem_of_ne (by simp) (by simp) (by simp) hz_ne_c
    have hcol4 : Collinear ℝ ({a, b, z, c} : Set ℝ²) :=
      collinear_insert_insert_of_mem_affineSpan_pair ha_line hb_line
    have hsub : ({a, b, c} : Set ℝ²) ⊆ ({a, b, z, c} : Set ℝ²) := by
      intro x hx
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hx ⊢
      rcases hx with rfl | rfl | rfl <;> simp
    exact habc (hcol4.subset hsub)
  have had_not : ¬ Wbtw ℝ a z d := by
    intro hwad
    have hcol_zac : Collinear ℝ ({z, a, c} : Set ℝ²) :=
      collinear_insert_of_mem_affineSpan_pair hwac.mem_affineSpan
    have hcol_zad : Collinear ℝ ({z, a, d} : Set ℝ²) :=
      collinear_insert_of_mem_affineSpan_pair hwad.mem_affineSpan
    have hc_line : c ∈ line[ℝ, z, a] :=
      hcol_zac.mem_affineSpan_of_mem_of_ne (by simp) (by simp) (by simp) hz_ne_a
    have hd_line : d ∈ line[ℝ, z, a] :=
      hcol_zad.mem_affineSpan_of_mem_of_ne (by simp) (by simp) (by simp) hz_ne_a
    have hcol4 : Collinear ℝ ({c, d, z, a} : Set ℝ²) :=
      collinear_insert_insert_of_mem_affineSpan_pair hc_line hd_line
    have hsub : ({a, c, d} : Set ℝ²) ⊆ ({c, d, z, a} : Set ℝ²) := by
      intro x hx
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hx ⊢
      rcases hx with rfl | rfl | rfl <;> simp
    exact hacd (hcol4.subset hsub)
  have hbc : dist b c < dist b z + dist z c :=
    dist_lt_dist_add_dist_iff.mpr hbc_not
  have had : dist a d < dist a z + dist z d :=
    dist_lt_dist_add_dist_iff.mpr had_not
  have hac : dist a z + dist z c = dist a c := hwac.dist_add_dist
  have hbd : dist b z + dist z d = dist b d := hwbd.dist_add_dist
  linarith

/-- The companion strict Kalmanson inequality for the other pair of opposite
sides of the same crossed quadrilateral. -/
theorem complementary_dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals
    {a b c d z : ℝ²}
    (hzac : z ∈ openSegment ℝ a c)
    (hzbd : z ∈ openSegment ℝ b d)
    (habc : ¬ Collinear ℝ ({a, b, c} : Set ℝ²))
    (hacd : ¬ Collinear ℝ ({a, c, d} : Set ℝ²)) :
    dist a b + dist c d < dist a c + dist b d := by
  have hac_ne : a ≠ c := ne₁₃_of_not_collinear habc
  have hz_ne_a : z ≠ a := by
    intro h
    subst z
    exact hac_ne (left_mem_openSegment_iff.mp hzac)
  have hz_ne_c : z ≠ c := by
    intro h
    subst z
    exact hac_ne (right_mem_openSegment_iff.mp hzac)
  have hwac : Wbtw ℝ a z c :=
    mem_segment_iff_wbtw.mp (openSegment_subset_segment ℝ _ _ hzac)
  have hwbd : Wbtw ℝ b z d :=
    mem_segment_iff_wbtw.mp (openSegment_subset_segment ℝ _ _ hzbd)
  have hab_not : ¬ Wbtw ℝ a z b := by
    intro hwab
    have hcol_zac : Collinear ℝ ({z, a, c} : Set ℝ²) :=
      collinear_insert_of_mem_affineSpan_pair hwac.mem_affineSpan
    have hcol_zab : Collinear ℝ ({z, a, b} : Set ℝ²) :=
      collinear_insert_of_mem_affineSpan_pair hwab.mem_affineSpan
    have hc_line : c ∈ line[ℝ, z, a] :=
      hcol_zac.mem_affineSpan_of_mem_of_ne (by simp) (by simp) (by simp) hz_ne_a
    have hb_line : b ∈ line[ℝ, z, a] :=
      hcol_zab.mem_affineSpan_of_mem_of_ne (by simp) (by simp) (by simp) hz_ne_a
    have hcol4 : Collinear ℝ ({c, b, z, a} : Set ℝ²) :=
      collinear_insert_insert_of_mem_affineSpan_pair hc_line hb_line
    have hsub : ({a, b, c} : Set ℝ²) ⊆ ({c, b, z, a} : Set ℝ²) := by
      intro x hx
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hx ⊢
      rcases hx with rfl | rfl | rfl <;> simp
    exact habc (hcol4.subset hsub)
  have hcd_not : ¬ Wbtw ℝ c z d := by
    intro hwcd
    have hcol_zac : Collinear ℝ ({z, a, c} : Set ℝ²) :=
      collinear_insert_of_mem_affineSpan_pair hwac.mem_affineSpan
    have hcol_zcd : Collinear ℝ ({z, c, d} : Set ℝ²) :=
      collinear_insert_of_mem_affineSpan_pair hwcd.mem_affineSpan
    have ha_line : a ∈ line[ℝ, z, c] :=
      hcol_zac.mem_affineSpan_of_mem_of_ne (by simp) (by simp) (by simp) hz_ne_c
    have hd_line : d ∈ line[ℝ, z, c] :=
      hcol_zcd.mem_affineSpan_of_mem_of_ne (by simp) (by simp) (by simp) hz_ne_c
    have hcol4 : Collinear ℝ ({a, d, z, c} : Set ℝ²) :=
      collinear_insert_insert_of_mem_affineSpan_pair ha_line hd_line
    have hsub : ({a, c, d} : Set ℝ²) ⊆ ({a, d, z, c} : Set ℝ²) := by
      intro x hx
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hx ⊢
      rcases hx with rfl | rfl | rfl <;> simp
    exact hacd (hcol4.subset hsub)
  have hab : dist a b < dist a z + dist z b :=
    dist_lt_dist_add_dist_iff.mpr hab_not
  have hcd : dist c d < dist c z + dist z d :=
    dist_lt_dist_add_dist_iff.mpr hcd_not
  have hac : dist a z + dist z c = dist a c := hwac.dist_add_dist
  have hbd : dist b z + dist z d = dist b d := hwbd.dist_add_dist
  rw [dist_comm z b] at hab
  rw [dist_comm c z] at hcd
  linarith

/-- Generic strict Kalmanson inequality for four increasing vertices of a
strictly convex CCW boundary enumeration. -/
theorem dist_add_dist_lt_diagonal_sum_of_ccw
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {ia ib ic id : Fin A.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id) :
    dist (phi ib) (phi ic) + dist (phi ia) (phi id) <
      dist (phi ia) (phi ic) + dist (phi ib) (phi id) := by
  obtain ⟨z, hzac, hzbd⟩ :=
    exists_mem_openSegment_diagonals_of_ccw hA hphi_inj hphi_image hccw
      hiab hibc hicd
  have hiac : ia < ic := hiab.trans hibc
  have hiad : ia < id := hiac.trans hicd
  have hibd : ib < id := hibc.trans hicd
  have hnotabc :=
    not_collinear_of_convexIndep_triple hA
      (by rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ ia))
      (by rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ ib))
      (by rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ ic))
      (hphi_inj.ne hiab.ne) (hphi_inj.ne hibc.ne) (hphi_inj.ne hiac.ne)
  have hnotacd :=
    not_collinear_of_convexIndep_triple hA
      (by rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ ia))
      (by rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ ic))
      (by rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ id))
      (hphi_inj.ne hiac.ne) (hphi_inj.ne hicd.ne) (hphi_inj.ne hiad.ne)
  exact dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals
    hzac hzbd hnotabc hnotacd

/-- Companion strict Kalmanson inequality for four increasing vertices of a
strictly convex CCW boundary enumeration. -/
theorem complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {ia ib ic id : Fin A.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id) :
    dist (phi ia) (phi ib) + dist (phi ic) (phi id) <
      dist (phi ia) (phi ic) + dist (phi ib) (phi id) := by
  obtain ⟨z, hzac, hzbd⟩ :=
    exists_mem_openSegment_diagonals_of_ccw hA hphi_inj hphi_image hccw
      hiab hibc hicd
  have hiac : ia < ic := hiab.trans hibc
  have hiad : ia < id := hiac.trans hicd
  have hnotabc :=
    not_collinear_of_convexIndep_triple hA
      (by rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ ia))
      (by rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ ib))
      (by rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ ic))
      (hphi_inj.ne hiab.ne) (hphi_inj.ne hibc.ne) (hphi_inj.ne hiac.ne)
  have hnotacd :=
    not_collinear_of_convexIndep_triple hA
      (by rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ ia))
      (by rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ ic))
      (by rw [← hphi_image]; exact Finset.mem_image_of_mem phi (Finset.mem_univ id))
      (hphi_inj.ne hiac.ne) (hphi_inj.ne hicd.ne) (hphi_inj.ne hiad.ne)
  exact complementary_dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals
    hzac hzbd hnotabc hnotacd

/-- Ordinal corollary: equality of the first diagonal with the adjacent side
forces strict increase in distances from the second vertex. -/
theorem dist_lt_of_ccw_of_dist_diagonal_eq_side
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {ia ib ic id : Fin A.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (heq : dist (phi ia) (phi ic) = dist (phi ia) (phi id)) :
    dist (phi ib) (phi ic) < dist (phi ib) (phi id) := by
  have hkal :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      hiab hibc hicd
  linarith

/-- Companion ordinal corollary used by the `O,I,A,C` placement: equality of
the first diagonal with the last side forces `OI < IC`. -/
theorem dist_first_side_lt_second_diagonal_of_ccw_of_dist_diagonal_eq_last_side
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {ia ib ic id : Fin A.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (heq : dist (phi ia) (phi ic) = dist (phi ic) (phi id)) :
    dist (phi ia) (phi ib) < dist (phi ib) (phi id) := by
  have hkal :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw hiab hibc hicd
  linarith

/-- Immediate three-row consumer on five points in the boundary order
`O < A < Y < E < C`.  The `Y`-row equality and the complementary Kalmanson
inequality on `O,A,Y,E` force `OA < AE`; the `O`- and `A`-row equalities and
the other Kalmanson inequality on `O,A,E,C` force `AE < OA`. -/
theorem false_of_five_ccw_three_shell_equalities
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {phi : Fin A.card → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {iO iA iY iE iC : Fin A.card}
    (hOA : iO < iA) (hAY : iA < iY) (hYE : iY < iE) (hEC : iE < iC)
    (hYRow : dist (phi iY) (phi iO) = dist (phi iY) (phi iE))
    (hORow : dist (phi iO) (phi iE) = dist (phi iO) (phi iC))
    (hARow : dist (phi iA) (phi iC) = dist (phi iA) (phi iO)) :
    False := by
  have hOA_lt_AE :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj
      hphi_image hccw hOA hAY hYE
  have hAE_lt_AO :=
    dist_add_dist_lt_diagonal_sum_of_ccw hA hphi_inj hphi_image hccw
      hOA (hAY.trans hYE) hEC
  have hYRow' : dist (phi iO) (phi iY) = dist (phi iY) (phi iE) := by
    simpa only [dist_comm (phi iO) (phi iY)] using hYRow
  have hARow' : dist (phi iA) (phi iC) = dist (phi iO) (phi iA) := by
    simpa only [dist_comm (phi iA) (phi iO)] using hARow
  linarith

/-- Three selected rows with the normalized incidences

```text
center Y: O,E
center O: E,C
center A: C,O
```

are impossible when the five displayed points occur in one shared CCW
boundary order `O < A < Y < E < C`.

The proof uses only `SelectedFourClass.support_eq_radius` to produce the three
metric equalities consumed by
`false_of_five_ccw_three_shell_equalities`.
-/
theorem false_of_selected_rows_in_five_ccw_order
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {iO iA iY iE iC : Fin carrier.card}
    (hOA : iO < iA) (hAY : iA < iY) (hYE : iY < iE) (hEC : iE < iC)
    (ORow : SelectedFourClass carrier (boundary iO))
    (ARow : SelectedFourClass carrier (boundary iA))
    (YRow : SelectedFourClass carrier (boundary iY))
    (hO_mem_YRow : boundary iO ∈ YRow.support)
    (hE_mem_YRow : boundary iE ∈ YRow.support)
    (hE_mem_ORow : boundary iE ∈ ORow.support)
    (hC_mem_ORow : boundary iC ∈ ORow.support)
    (hC_mem_ARow : boundary iC ∈ ARow.support)
    (hO_mem_ARow : boundary iO ∈ ARow.support) : False := by
  have hYRow :
      dist (boundary iY) (boundary iO) =
        dist (boundary iY) (boundary iE) :=
    (YRow.support_eq_radius _ hO_mem_YRow).trans
      (YRow.support_eq_radius _ hE_mem_YRow).symm
  have hORow :
      dist (boundary iO) (boundary iE) =
        dist (boundary iO) (boundary iC) :=
    (ORow.support_eq_radius _ hE_mem_ORow).trans
      (ORow.support_eq_radius _ hC_mem_ORow).symm
  have hARow :
      dist (boundary iA) (boundary iC) =
        dist (boundary iA) (boundary iO) :=
    (ARow.support_eq_radius _ hC_mem_ARow).trans
      (ARow.support_eq_radius _ hO_mem_ARow).symm
  exact
    false_of_five_ccw_three_shell_equalities
      hcarrier hboundary_injective hboundary_image hboundary_ccw
      hOA hAY hYE hEC hYRow hORow hARow

/-- Two selected rows at the first two vertices of an increasing boundary
quadruple cannot share the last two support vertices.

For `ia < ib < ic < id`, the strict Kalmanson inequality

```text
dist ia id + dist ib ic < dist ia ic + dist ib id
```

contradicts the two row equalities after direct cancellation. -/
theorem false_of_two_selected_rows_shared_late_pair
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (ARow : SelectedFourClass carrier (boundary ia))
    (BRow : SelectedFourClass carrier (boundary ib))
    (hic_mem_ARow : boundary ic ∈ ARow.support)
    (hid_mem_ARow : boundary id ∈ ARow.support)
    (hic_mem_BRow : boundary ic ∈ BRow.support)
    (hid_mem_BRow : boundary id ∈ BRow.support) : False := by
  have hAeq :
      dist (boundary ia) (boundary ic) =
        dist (boundary ia) (boundary id) :=
    (ARow.support_eq_radius _ hic_mem_ARow).trans
      (ARow.support_eq_radius _ hid_mem_ARow).symm
  have hBeq :
      dist (boundary ib) (boundary ic) =
        dist (boundary ib) (boundary id) :=
    (BRow.support_eq_radius _ hic_mem_BRow).trans
      (BRow.support_eq_radius _ hid_mem_BRow).symm
  have hstrict :=
    dist_add_dist_lt_diagonal_sum_of_ccw hcarrier
      hboundary_injective hboundary_image hboundary_ccw hiab hibc hicd
  linarith

#print axioms exists_mem_openSegment_diagonals_of_ccw
#print axioms dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals
#print axioms complementary_dist_add_dist_lt_diagonal_sum_of_openSegment_diagonals
#print axioms dist_add_dist_lt_diagonal_sum_of_ccw
#print axioms complementary_dist_add_dist_lt_diagonal_sum_of_ccw
#print axioms dist_lt_of_ccw_of_dist_diagonal_eq_side
#print axioms dist_first_side_lt_second_diagonal_of_ccw_of_dist_diagonal_eq_last_side
#print axioms false_of_five_ccw_three_shell_equalities
#print axioms false_of_selected_rows_in_five_ccw_order
#print axioms false_of_two_selected_rows_shared_late_pair

end CapCrossingKalmansonBridge
end Problem97
