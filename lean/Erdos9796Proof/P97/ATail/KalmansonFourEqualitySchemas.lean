/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CapCrossingKalmanson
import Erdos9796Proof.P97.ATail.TwoKalmansonLabelCut

/-!
# Four- and five-equality Kalmanson schemas

Two seven-point contradictions extracted from the exact-sixteen `BlockerV`
four-row census.  Core minimization shows that each originally observed
five-equality signature has one redundant equality, leaving a stronger
four-equality, cardinality-independent consequence of strict Kalmanson
inequalities.  Both increasing and decreasing boundary-index forms are
supplied so finite certificate consumers can remain orientation-neutral.

The exact-seventeen census produced a third seven-point signature whose
minimal core genuinely retains five shell equalities.  It is recorded here as
schema C because it uses the same strict-Kalmanson interface and the same
orientation-neutral consumer convention as schemas A and B.

The next exact-seventeen wave produced two smaller six-point signatures.
Schemas D and E below need only two and three strict Kalmanson inequalities,
respectively.  As with schema C, their public adapters consume direct selected
row incidences rather than equality-closure artifacts.

A later exact-seventeen linear core produced schema G.  It is another
six-point four-row obstruction, but needs only one equality from each row.
The four strict Kalmanson inequalities in its proof sum to zero after those
four shell equalities are substituted.

Subsequent survivor-wide motif audits produced schemas H, I, and J.  They are
again six-point four-row obstructions.  Schema H uses three strict Kalmanson
inequalities, while schemas I and J each use two inequalities that force
opposite strict comparisons between the same pair of chord lengths.

Schema K was obtained by deleting every boundary vertex not named by a
selected-row equality from a global exact-seventeen linear certificate.  Its
five strict Kalmanson inequalities cancel after six shell equalities are
substituted, so it is another cardinality-independent six-point obstruction.
-/

open scoped Convex EuclideanGeometry

namespace Problem97
namespace CapCrossingKalmansonBridge

private theorem dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {ia ib ic id : Fin n}
    (hiba : ib < ia) (hicb : ic < ib) (hidc : id < ic) :
    dist (phi ib) (phi ic) + dist (phi ia) (phi id) <
      dist (phi ia) (phi ic) + dist (phi ib) (phi id) := by
  simpa only [dist_comm, add_comm] using
    (dist_add_dist_lt_diagonal_sum_of_ccw
      (ia := id) (ib := ic) (ic := ib) (id := ia)
      hA hphi_inj hphi_image hccw hidc hicb hiba)

private theorem complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {ia ib ic id : Fin n}
    (hiba : ib < ia) (hicb : ic < ib) (hidc : id < ic) :
    dist (phi ia) (phi ib) + dist (phi ic) (phi id) <
      dist (phi ia) (phi ic) + dist (phi ib) (phi id) := by
  simpa only [dist_comm, add_comm] using
    (complementary_dist_add_dist_lt_diagonal_sum_of_ccw
      (ia := id) (ib := ic) (ic := ib) (id := ia)
      hA hphi_inj hphi_image hccw hidc hicb hiba)

/-- Seven increasingly ordered boundary vertices cannot support the first
four-equality four-row signature. -/
theorem false_of_seven_ccw_four_shell_equalities_A_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hbae : dist (phi b) (phi a) = dist (phi b) (phi e))
    (hcbf : dist (phi c) (phi b) = dist (phi c) (phi f))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e))
    (heaf : dist (phi e) (phi a) = dist (phi e) (phi f)) : False := by
  have hK2_abcd := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc hcd
  have hK1_abcg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc (hcd.trans (hde.trans (hef.trans hfg)))
  have hK1_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans hbc) hcd (hde.trans (hef.trans hfg))
  have hK1_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans (hbc.trans hcd)) hde (hef.trans hfg)
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans hde) hef
  have hK2_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans (hde.trans hef)) hfg
  have hK2_cdef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd hde hef
  have hK2_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd (hde.trans hef) hfg
  have hK2_defg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hde hef hfg
  simp only [dist_comm] at hbae hcbf hdbe heaf
  linarith

/-- Decreasing-index companion of
`false_of_seven_ccw_four_shell_equalities_A_of_increasing`. -/
theorem false_of_seven_ccw_four_shell_equalities_A_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e) (hgf : g < f)
    (hbae : dist (phi b) (phi a) = dist (phi b) (phi e))
    (hcbf : dist (phi c) (phi b) = dist (phi c) (phi f))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e))
    (heaf : dist (phi e) (phi a) = dist (phi e) (phi f)) : False := by
  have hK2_abcd := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb hdc
  have hK1_abcg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb (hgf.trans (hfe.trans (hed.trans hdc)))
  have hK1_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hcb.trans hba) hdc (hgf.trans (hfe.trans hed))
  have hK1_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hdc.trans (hcb.trans hba)) hed (hgf.trans hfe)
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hed.trans hdc) hfe
  have hK2_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hfe.trans (hed.trans hdc)) hgf
  have hK2_cdef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc hed hfe
  have hK2_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc (hfe.trans hed) hgf
  have hK2_defg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hed hfe hgf
  simp only [dist_comm] at hbae hcbf hdbe heaf
  linarith

/-- Seven increasingly ordered boundary vertices cannot support the reflected
placement of the first five-equality signature. -/
theorem false_of_seven_ccw_four_shell_equalities_B_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hbae : dist (phi b) (phi a) = dist (phi b) (phi e))
    (hcbg : dist (phi c) (phi b) = dist (phi c) (phi g))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e))
    (heag : dist (phi e) (phi a) = dist (phi e) (phi g)) : False := by
  have hK2_abcd := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc hcd
  have hK1_abcg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc (hcd.trans (hde.trans (hef.trans hfg)))
  have hK1_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans hbc) hcd (hde.trans (hef.trans hfg))
  have hK1_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans (hbc.trans hcd)) hde (hef.trans hfg)
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans hde) hef
  have hK2_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans (hde.trans hef)) hfg
  have hK2_cdef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd hde hef
  have hK2_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd (hde.trans hef) hfg
  simp only [dist_comm] at hbae hcbg hdbe heag
  linarith

/-- Decreasing-index companion of
`false_of_seven_ccw_four_shell_equalities_B_of_increasing`. -/
theorem false_of_seven_ccw_four_shell_equalities_B_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e) (hgf : g < f)
    (hbae : dist (phi b) (phi a) = dist (phi b) (phi e))
    (hcbg : dist (phi c) (phi b) = dist (phi c) (phi g))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e))
    (heag : dist (phi e) (phi a) = dist (phi e) (phi g)) : False := by
  have hK2_abcd := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb hdc
  have hK1_abcg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb (hgf.trans (hfe.trans (hed.trans hdc)))
  have hK1_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hcb.trans hba) hdc (hgf.trans (hfe.trans hed))
  have hK1_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hdc.trans (hcb.trans hba)) hed (hgf.trans hfe)
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hed.trans hdc) hfe
  have hK2_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hfe.trans (hed.trans hdc)) hgf
  have hK2_cdef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc hed hfe
  have hK2_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc (hfe.trans hed) hgf
  simp only [dist_comm] at hbae hcbg hdbe heag
  linarith

/-- Seven increasingly ordered boundary vertices cannot support the
five-equality signature extracted from the exact-seventeen full-cover
census. -/
theorem false_of_seven_ccw_five_shell_equalities_C_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hafb : dist (phi a) (phi f) = dist (phi a) (phi b))
    (hfad : dist (phi f) (phi a) = dist (phi f) (phi d))
    (hfag : dist (phi f) (phi a) = dist (phi f) (phi g))
    (hcdg : dist (phi c) (phi d) = dist (phi c) (phi g))
    (hefb : dist (phi e) (phi f) = dist (phi e) (phi b)) : False := by
  have hK1_abcg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc
      (hcd.trans (hde.trans (hef.trans hfg)))
  have hK2_abde := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab (hbc.trans hcd) hde
  have hK1_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans hbc) hcd
      (hde.trans (hef.trans hfg))
  have hK1_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans (hbc.trans hcd)) hde
      (hef.trans hfg)
  have hK1_aefg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw
      (hab.trans (hbc.trans (hcd.trans hde))) hef hfg
  have hK2_bcde := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc hcd hde
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans hde) hef
  have hK2_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc
      (hcd.trans (hde.trans hef)) hfg
  have hK2_defg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hde hef hfg
  simp only [dist_comm] at hafb hfad hfag hcdg hefb
  linarith

/-- Decreasing-index companion of
`false_of_seven_ccw_five_shell_equalities_C_of_increasing`. -/
theorem false_of_seven_ccw_five_shell_equalities_C_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e) (hgf : g < f)
    (hafb : dist (phi a) (phi f) = dist (phi a) (phi b))
    (hfad : dist (phi f) (phi a) = dist (phi f) (phi d))
    (hfag : dist (phi f) (phi a) = dist (phi f) (phi g))
    (hcdg : dist (phi c) (phi d) = dist (phi c) (phi g))
    (hefb : dist (phi e) (phi f) = dist (phi e) (phi b)) : False := by
  have hK1_abcg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb
      (hgf.trans (hfe.trans (hed.trans hdc)))
  have hK2_abde := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba (hdc.trans hcb) hed
  have hK1_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hcb.trans hba) hdc
      (hgf.trans (hfe.trans hed))
  have hK1_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hdc.trans (hcb.trans hba)) hed
      (hgf.trans hfe)
  have hK1_aefg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw
      (hed.trans (hdc.trans (hcb.trans hba))) hfe hgf
  have hK2_bcde := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb hdc hed
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hed.trans hdc) hfe
  have hK2_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb
      (hfe.trans (hed.trans hdc)) hgf
  have hK2_defg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hed hfe hgf
  simp only [dist_comm] at hafb hfad hfag hcdg hefb
  linarith

/-- Four selected rows with the schema-C incidences are impossible when the
seven displayed support points occur in increasing CCW boundary order. -/
theorem false_of_four_selected_rows_in_seven_ccw_order_C
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f g : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (ARow : SelectedFourClass carrier (boundary a))
    (FRow : SelectedFourClass carrier (boundary f))
    (CRow : SelectedFourClass carrier (boundary c))
    (ERow : SelectedFourClass carrier (boundary e))
    (hf_mem_ARow : boundary f ∈ ARow.support)
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (ha_mem_FRow : boundary a ∈ FRow.support)
    (hd_mem_FRow : boundary d ∈ FRow.support)
    (hg_mem_FRow : boundary g ∈ FRow.support)
    (hd_mem_CRow : boundary d ∈ CRow.support)
    (hg_mem_CRow : boundary g ∈ CRow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support)
    (hb_mem_ERow : boundary b ∈ ERow.support) : False := by
  have hafb := (ARow.support_eq_radius _ hf_mem_ARow).trans
    (ARow.support_eq_radius _ hb_mem_ARow).symm
  have hfad := (FRow.support_eq_radius _ ha_mem_FRow).trans
    (FRow.support_eq_radius _ hd_mem_FRow).symm
  have hfag := (FRow.support_eq_radius _ ha_mem_FRow).trans
    (FRow.support_eq_radius _ hg_mem_FRow).symm
  have hcdg := (CRow.support_eq_radius _ hd_mem_CRow).trans
    (CRow.support_eq_radius _ hg_mem_CRow).symm
  have hefb := (ERow.support_eq_radius _ hf_mem_ERow).trans
    (ERow.support_eq_radius _ hb_mem_ERow).symm
  exact false_of_seven_ccw_five_shell_equalities_C_of_increasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hab hbc hcd hde hef hfg hafb hfad hfag hcdg hefb

/-- Decreasing-index selected-row companion of
`false_of_four_selected_rows_in_seven_ccw_order_C`. -/
theorem false_of_four_selected_rows_in_seven_ccw_order_C_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f g : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e) (hgf : g < f)
    (ARow : SelectedFourClass carrier (boundary a))
    (FRow : SelectedFourClass carrier (boundary f))
    (CRow : SelectedFourClass carrier (boundary c))
    (ERow : SelectedFourClass carrier (boundary e))
    (hf_mem_ARow : boundary f ∈ ARow.support)
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (ha_mem_FRow : boundary a ∈ FRow.support)
    (hd_mem_FRow : boundary d ∈ FRow.support)
    (hg_mem_FRow : boundary g ∈ FRow.support)
    (hd_mem_CRow : boundary d ∈ CRow.support)
    (hg_mem_CRow : boundary g ∈ CRow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support)
    (hb_mem_ERow : boundary b ∈ ERow.support) : False := by
  have hafb := (ARow.support_eq_radius _ hf_mem_ARow).trans
    (ARow.support_eq_radius _ hb_mem_ARow).symm
  have hfad := (FRow.support_eq_radius _ ha_mem_FRow).trans
    (FRow.support_eq_radius _ hd_mem_FRow).symm
  have hfag := (FRow.support_eq_radius _ ha_mem_FRow).trans
    (FRow.support_eq_radius _ hg_mem_FRow).symm
  have hcdg := (CRow.support_eq_radius _ hd_mem_CRow).trans
    (CRow.support_eq_radius _ hg_mem_CRow).symm
  have hefb := (ERow.support_eq_radius _ hf_mem_ERow).trans
    (ERow.support_eq_radius _ hb_mem_ERow).symm
  exact false_of_seven_ccw_five_shell_equalities_C_of_decreasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hba hcb hdc hed hfe hgf hafb hfad hfag hcdg hefb

/-- Six increasingly ordered boundary vertices cannot support schema D from
the exact-seventeen full-cover census. -/
theorem false_of_six_ccw_six_shell_equalities_D_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (haeb : dist (phi a) (phi e) = dist (phi a) (phi b))
    (heac : dist (phi e) (phi a) = dist (phi e) (phi c))
    (heaf : dist (phi e) (phi a) = dist (phi e) (phi f))
    (hbef : dist (phi b) (phi e) = dist (phi b) (phi f))
    (hdeb : dist (phi d) (phi e) = dist (phi d) (phi b))
    (hdec : dist (phi d) (phi e) = dist (phi d) (phi c)) : False := by
  have hK1_abef := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab
      (hbc.trans (hcd.trans hde)) hef
  have hK2_bcde := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc hcd hde
  simp only [dist_comm] at haeb heac heaf hbef hdeb hdec
  linarith

/-- Decreasing-index companion of
`false_of_six_ccw_six_shell_equalities_D_of_increasing`. -/
theorem false_of_six_ccw_six_shell_equalities_D_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (haeb : dist (phi a) (phi e) = dist (phi a) (phi b))
    (heac : dist (phi e) (phi a) = dist (phi e) (phi c))
    (heaf : dist (phi e) (phi a) = dist (phi e) (phi f))
    (hbef : dist (phi b) (phi e) = dist (phi b) (phi f))
    (hdeb : dist (phi d) (phi e) = dist (phi d) (phi b))
    (hdec : dist (phi d) (phi e) = dist (phi d) (phi c)) : False := by
  have hK1_abef :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hba
        (hed.trans (hdc.trans hcb)) hfe
  have hK2_bcde := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb hdc hed
  simp only [dist_comm] at haeb heac heaf hbef hdeb hdec
  linarith

/-- Four selected rows with the schema-D incidences are impossible when the
six support points occur in increasing CCW boundary order. -/
theorem false_of_four_selected_rows_in_six_ccw_order_D
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary a))
    (ERow : SelectedFourClass carrier (boundary e))
    (BRow : SelectedFourClass carrier (boundary b))
    (DRow : SelectedFourClass carrier (boundary d))
    (he_mem_ARow : boundary e ∈ ARow.support)
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (ha_mem_ERow : boundary a ∈ ERow.support)
    (hc_mem_ERow : boundary c ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support)
    (he_mem_BRow : boundary e ∈ BRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support)
    (he_mem_DRow : boundary e ∈ DRow.support)
    (hb_mem_DRow : boundary b ∈ DRow.support)
    (hc_mem_DRow : boundary c ∈ DRow.support) : False := by
  have haeb := (ARow.support_eq_radius _ he_mem_ARow).trans
    (ARow.support_eq_radius _ hb_mem_ARow).symm
  have heac := (ERow.support_eq_radius _ ha_mem_ERow).trans
    (ERow.support_eq_radius _ hc_mem_ERow).symm
  have heaf := (ERow.support_eq_radius _ ha_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  have hbef := (BRow.support_eq_radius _ he_mem_BRow).trans
    (BRow.support_eq_radius _ hf_mem_BRow).symm
  have hdeb := (DRow.support_eq_radius _ he_mem_DRow).trans
    (DRow.support_eq_radius _ hb_mem_DRow).symm
  have hdec := (DRow.support_eq_radius _ he_mem_DRow).trans
    (DRow.support_eq_radius _ hc_mem_DRow).symm
  exact false_of_six_ccw_six_shell_equalities_D_of_increasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hab hbc hcd hde hef haeb heac heaf hbef hdeb hdec

/-- Decreasing-index selected-row companion of
`false_of_four_selected_rows_in_six_ccw_order_D`. -/
theorem false_of_four_selected_rows_in_six_ccw_order_D_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary a))
    (ERow : SelectedFourClass carrier (boundary e))
    (BRow : SelectedFourClass carrier (boundary b))
    (DRow : SelectedFourClass carrier (boundary d))
    (he_mem_ARow : boundary e ∈ ARow.support)
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (ha_mem_ERow : boundary a ∈ ERow.support)
    (hc_mem_ERow : boundary c ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support)
    (he_mem_BRow : boundary e ∈ BRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support)
    (he_mem_DRow : boundary e ∈ DRow.support)
    (hb_mem_DRow : boundary b ∈ DRow.support)
    (hc_mem_DRow : boundary c ∈ DRow.support) : False := by
  have haeb := (ARow.support_eq_radius _ he_mem_ARow).trans
    (ARow.support_eq_radius _ hb_mem_ARow).symm
  have heac := (ERow.support_eq_radius _ ha_mem_ERow).trans
    (ERow.support_eq_radius _ hc_mem_ERow).symm
  have heaf := (ERow.support_eq_radius _ ha_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  have hbef := (BRow.support_eq_radius _ he_mem_BRow).trans
    (BRow.support_eq_radius _ hf_mem_BRow).symm
  have hdeb := (DRow.support_eq_radius _ he_mem_DRow).trans
    (DRow.support_eq_radius _ hb_mem_DRow).symm
  have hdec := (DRow.support_eq_radius _ he_mem_DRow).trans
    (DRow.support_eq_radius _ hc_mem_DRow).symm
  exact false_of_six_ccw_six_shell_equalities_D_of_decreasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hba hcb hdc hed hfe haeb heac heaf hbef hdeb hdec

/-- Six increasingly ordered boundary vertices cannot support schema E from
the exact-seventeen full-cover census. -/
theorem false_of_six_ccw_five_shell_equalities_E_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hafd : dist (phi a) (phi f) = dist (phi a) (phi d))
    (hebc : dist (phi e) (phi b) = dist (phi e) (phi c))
    (hbac : dist (phi b) (phi a) = dist (phi b) (phi c))
    (hbad : dist (phi b) (phi a) = dist (phi b) (phi d))
    (hcfb : dist (phi c) (phi f) = dist (phi c) (phi b)) : False := by
  have hK2_abde := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab (hbc.trans hcd) hde
  have hK2_abef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab
      (hbc.trans (hcd.trans hde)) hef
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans hde) hef
  simp only [dist_comm] at hafd hebc hbac hbad hcfb
  linarith

/-- Decreasing-index companion of
`false_of_six_ccw_five_shell_equalities_E_of_increasing`. -/
theorem false_of_six_ccw_five_shell_equalities_E_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (hafd : dist (phi a) (phi f) = dist (phi a) (phi d))
    (hebc : dist (phi e) (phi b) = dist (phi e) (phi c))
    (hbac : dist (phi b) (phi a) = dist (phi b) (phi c))
    (hbad : dist (phi b) (phi a) = dist (phi b) (phi d))
    (hcfb : dist (phi c) (phi f) = dist (phi c) (phi b)) : False := by
  have hK2_abde := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba (hdc.trans hcb) hed
  have hK2_abef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba
      (hed.trans (hdc.trans hcb)) hfe
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hed.trans hdc) hfe
  simp only [dist_comm] at hafd hebc hbac hbad hcfb
  linarith

/-- Four selected rows with the schema-E incidences are impossible when the
six support points occur in increasing CCW boundary order. -/
theorem false_of_four_selected_rows_in_six_ccw_order_E
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary a))
    (ERow : SelectedFourClass carrier (boundary e))
    (BRow : SelectedFourClass carrier (boundary b))
    (CRow : SelectedFourClass carrier (boundary c))
    (hf_mem_ARow : boundary f ∈ ARow.support)
    (hd_mem_ARow : boundary d ∈ ARow.support)
    (hb_mem_ERow : boundary b ∈ ERow.support)
    (hc_mem_ERow : boundary c ∈ ERow.support)
    (ha_mem_BRow : boundary a ∈ BRow.support)
    (hc_mem_BRow : boundary c ∈ BRow.support)
    (hd_mem_BRow : boundary d ∈ BRow.support)
    (hf_mem_CRow : boundary f ∈ CRow.support)
    (hb_mem_CRow : boundary b ∈ CRow.support) : False := by
  have hafd := (ARow.support_eq_radius _ hf_mem_ARow).trans
    (ARow.support_eq_radius _ hd_mem_ARow).symm
  have hebc := (ERow.support_eq_radius _ hb_mem_ERow).trans
    (ERow.support_eq_radius _ hc_mem_ERow).symm
  have hbac := (BRow.support_eq_radius _ ha_mem_BRow).trans
    (BRow.support_eq_radius _ hc_mem_BRow).symm
  have hbad := (BRow.support_eq_radius _ ha_mem_BRow).trans
    (BRow.support_eq_radius _ hd_mem_BRow).symm
  have hcfb := (CRow.support_eq_radius _ hf_mem_CRow).trans
    (CRow.support_eq_radius _ hb_mem_CRow).symm
  exact false_of_six_ccw_five_shell_equalities_E_of_increasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hab hbc hcd hde hef hafd hebc hbac hbad hcfb

/-- Decreasing-index selected-row companion of
`false_of_four_selected_rows_in_six_ccw_order_E`. -/
theorem false_of_four_selected_rows_in_six_ccw_order_E_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary a))
    (ERow : SelectedFourClass carrier (boundary e))
    (BRow : SelectedFourClass carrier (boundary b))
    (CRow : SelectedFourClass carrier (boundary c))
    (hf_mem_ARow : boundary f ∈ ARow.support)
    (hd_mem_ARow : boundary d ∈ ARow.support)
    (hb_mem_ERow : boundary b ∈ ERow.support)
    (hc_mem_ERow : boundary c ∈ ERow.support)
    (ha_mem_BRow : boundary a ∈ BRow.support)
    (hc_mem_BRow : boundary c ∈ BRow.support)
    (hd_mem_BRow : boundary d ∈ BRow.support)
    (hf_mem_CRow : boundary f ∈ CRow.support)
    (hb_mem_CRow : boundary b ∈ CRow.support) : False := by
  have hafd := (ARow.support_eq_radius _ hf_mem_ARow).trans
    (ARow.support_eq_radius _ hd_mem_ARow).symm
  have hebc := (ERow.support_eq_radius _ hb_mem_ERow).trans
    (ERow.support_eq_radius _ hc_mem_ERow).symm
  have hbac := (BRow.support_eq_radius _ ha_mem_BRow).trans
    (BRow.support_eq_radius _ hc_mem_BRow).symm
  have hbad := (BRow.support_eq_radius _ ha_mem_BRow).trans
    (BRow.support_eq_radius _ hd_mem_BRow).symm
  have hcfb := (CRow.support_eq_radius _ hf_mem_CRow).trans
    (CRow.support_eq_radius _ hb_mem_CRow).symm
  exact false_of_six_ccw_five_shell_equalities_E_of_decreasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hba hcb hdc hed hfe hafd hebc hbac hbad hcfb

/-- Seven increasingly ordered boundary vertices cannot support schema F from
the exact-seventeen full-cover census. -/
theorem false_of_seven_ccw_six_shell_equalities_F_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hafc : dist (phi a) (phi f) = dist (phi a) (phi c))
    (hfag : dist (phi f) (phi a) = dist (phi f) (phi g))
    (hfac : dist (phi f) (phi a) = dist (phi f) (phi c))
    (hbfe : dist (phi b) (phi f) = dist (phi b) (phi e))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e))
    (hdbg : dist (phi d) (phi b) = dist (phi d) (phi g)) : False := by
  have hK1_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans hbc) hcd
      (hde.trans (hef.trans hfg))
  have hK1_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans (hbc.trans hcd)) hde
      (hef.trans hfg)
  have hK1_aefg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw
      (hab.trans (hbc.trans (hcd.trans hde))) hef hfg
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans hde) hef
  have hK2_cdef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd hde hef
  have hK2_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd (hde.trans hef) hfg
  simp only [dist_comm] at hafc hfag hfac hbfe hdbe hdbg
  linarith

/-- Decreasing-index companion of
`false_of_seven_ccw_six_shell_equalities_F_of_increasing`. -/
theorem false_of_seven_ccw_six_shell_equalities_F_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e) (hgf : g < f)
    (hafc : dist (phi a) (phi f) = dist (phi a) (phi c))
    (hfag : dist (phi f) (phi a) = dist (phi f) (phi g))
    (hfac : dist (phi f) (phi a) = dist (phi f) (phi c))
    (hbfe : dist (phi b) (phi f) = dist (phi b) (phi e))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e))
    (hdbg : dist (phi d) (phi b) = dist (phi d) (phi g)) : False := by
  have hK1_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hcb.trans hba) hdc
      (hgf.trans (hfe.trans hed))
  have hK1_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hdc.trans (hcb.trans hba)) hed
      (hgf.trans hfe)
  have hK1_aefg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw
      (hed.trans (hdc.trans (hcb.trans hba))) hfe hgf
  have hK2_bcef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hed.trans hdc) hfe
  have hK2_cdef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc hed hfe
  have hK2_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc (hfe.trans hed) hgf
  simp only [dist_comm] at hafc hfag hfac hbfe hdbe hdbg
  linarith

/-- Four selected rows with the schema-F incidences are impossible when the
seven displayed support points occur in increasing CCW boundary order. -/
theorem false_of_four_selected_rows_in_seven_ccw_order_F
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f g : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (ARow : SelectedFourClass carrier (boundary a))
    (FRow : SelectedFourClass carrier (boundary f))
    (BRow : SelectedFourClass carrier (boundary b))
    (DRow : SelectedFourClass carrier (boundary d))
    (hf_mem_ARow : boundary f ∈ ARow.support)
    (hc_mem_ARow : boundary c ∈ ARow.support)
    (ha_mem_FRow : boundary a ∈ FRow.support)
    (hg_mem_FRow : boundary g ∈ FRow.support)
    (hc_mem_FRow : boundary c ∈ FRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support)
    (he_mem_BRow : boundary e ∈ BRow.support)
    (hb_mem_DRow : boundary b ∈ DRow.support)
    (he_mem_DRow : boundary e ∈ DRow.support)
    (hg_mem_DRow : boundary g ∈ DRow.support) : False := by
  have hafc := (ARow.support_eq_radius _ hf_mem_ARow).trans
    (ARow.support_eq_radius _ hc_mem_ARow).symm
  have hfag := (FRow.support_eq_radius _ ha_mem_FRow).trans
    (FRow.support_eq_radius _ hg_mem_FRow).symm
  have hfac := (FRow.support_eq_radius _ ha_mem_FRow).trans
    (FRow.support_eq_radius _ hc_mem_FRow).symm
  have hbfe := (BRow.support_eq_radius _ hf_mem_BRow).trans
    (BRow.support_eq_radius _ he_mem_BRow).symm
  have hdbe := (DRow.support_eq_radius _ hb_mem_DRow).trans
    (DRow.support_eq_radius _ he_mem_DRow).symm
  have hdbg := (DRow.support_eq_radius _ hb_mem_DRow).trans
    (DRow.support_eq_radius _ hg_mem_DRow).symm
  exact false_of_seven_ccw_six_shell_equalities_F_of_increasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hab hbc hcd hde hef hfg hafc hfag hfac hbfe hdbe hdbg

/-- Decreasing-index selected-row companion of
`false_of_four_selected_rows_in_seven_ccw_order_F`. -/
theorem false_of_four_selected_rows_in_seven_ccw_order_F_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f g : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e) (hgf : g < f)
    (ARow : SelectedFourClass carrier (boundary a))
    (FRow : SelectedFourClass carrier (boundary f))
    (BRow : SelectedFourClass carrier (boundary b))
    (DRow : SelectedFourClass carrier (boundary d))
    (hf_mem_ARow : boundary f ∈ ARow.support)
    (hc_mem_ARow : boundary c ∈ ARow.support)
    (ha_mem_FRow : boundary a ∈ FRow.support)
    (hg_mem_FRow : boundary g ∈ FRow.support)
    (hc_mem_FRow : boundary c ∈ FRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support)
    (he_mem_BRow : boundary e ∈ BRow.support)
    (hb_mem_DRow : boundary b ∈ DRow.support)
    (he_mem_DRow : boundary e ∈ DRow.support)
    (hg_mem_DRow : boundary g ∈ DRow.support) : False := by
  have hafc := (ARow.support_eq_radius _ hf_mem_ARow).trans
    (ARow.support_eq_radius _ hc_mem_ARow).symm
  have hfag := (FRow.support_eq_radius _ ha_mem_FRow).trans
    (FRow.support_eq_radius _ hg_mem_FRow).symm
  have hfac := (FRow.support_eq_radius _ ha_mem_FRow).trans
    (FRow.support_eq_radius _ hc_mem_FRow).symm
  have hbfe := (BRow.support_eq_radius _ hf_mem_BRow).trans
    (BRow.support_eq_radius _ he_mem_BRow).symm
  have hdbe := (DRow.support_eq_radius _ hb_mem_DRow).trans
    (DRow.support_eq_radius _ he_mem_DRow).symm
  have hdbg := (DRow.support_eq_radius _ hb_mem_DRow).trans
    (DRow.support_eq_radius _ hg_mem_DRow).symm
  exact false_of_seven_ccw_six_shell_equalities_F_of_decreasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hba hcb hdc hed hfe hgf hafc hfag hfac hbfe hdbe hdbg

/-- Six increasingly ordered boundary vertices cannot support schema G from
the exact-seventeen full-cover census. -/
theorem false_of_six_ccw_four_shell_equalities_G_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (habd : dist (phi a) (phi b) = dist (phi a) (phi d))
    (hbcf : dist (phi b) (phi c) = dist (phi b) (phi f))
    (hcbd : dist (phi c) (phi b) = dist (phi c) (phi d))
    (hecf : dist (phi e) (phi c) = dist (phi e) (phi f)) : False := by
  have hK1_abcf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc (hcd.trans (hde.trans hef))
  have hK2_acde := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans hbc) hcd hde
  have hK1_acdf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans hbc) hcd (hde.trans hef)
  have hK1_adef := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans (hbc.trans hcd)) hde hef
  simp only [dist_comm] at habd hbcf hcbd hecf
  linarith

/-- Decreasing-index companion of
`false_of_six_ccw_four_shell_equalities_G_of_increasing`. -/
theorem false_of_six_ccw_four_shell_equalities_G_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (habd : dist (phi a) (phi b) = dist (phi a) (phi d))
    (hbcf : dist (phi b) (phi c) = dist (phi b) (phi f))
    (hcbd : dist (phi c) (phi b) = dist (phi c) (phi d))
    (hecf : dist (phi e) (phi c) = dist (phi e) (phi f)) : False := by
  have hK1_abcf :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hba hcb
        (hfe.trans (hed.trans hdc))
  have hK2_acde := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hcb.trans hba) hdc hed
  have hK1_acdf :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw (hcb.trans hba) hdc (hfe.trans hed)
  have hK1_adef :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw (hdc.trans (hcb.trans hba)) hed hfe
  simp only [dist_comm] at habd hbcf hcbd hecf
  linarith

/-- Four selected rows with the schema-G incidences are impossible when the
six support points occur in increasing CCW boundary order. -/
theorem false_of_four_selected_rows_in_six_ccw_order_G
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary a))
    (BRow : SelectedFourClass carrier (boundary b))
    (CRow : SelectedFourClass carrier (boundary c))
    (ERow : SelectedFourClass carrier (boundary e))
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (hd_mem_ARow : boundary d ∈ ARow.support)
    (hc_mem_BRow : boundary c ∈ BRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support)
    (hb_mem_CRow : boundary b ∈ CRow.support)
    (hd_mem_CRow : boundary d ∈ CRow.support)
    (hc_mem_ERow : boundary c ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support) : False := by
  have habd := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ hd_mem_ARow).symm
  have hbcf := (BRow.support_eq_radius _ hc_mem_BRow).trans
    (BRow.support_eq_radius _ hf_mem_BRow).symm
  have hcbd := (CRow.support_eq_radius _ hb_mem_CRow).trans
    (CRow.support_eq_radius _ hd_mem_CRow).symm
  have hecf := (ERow.support_eq_radius _ hc_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  exact false_of_six_ccw_four_shell_equalities_G_of_increasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hab hbc hcd hde hef habd hbcf hcbd hecf

/-- Decreasing-index selected-row companion of
`false_of_four_selected_rows_in_six_ccw_order_G`. -/
theorem false_of_four_selected_rows_in_six_ccw_order_G_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary a))
    (BRow : SelectedFourClass carrier (boundary b))
    (CRow : SelectedFourClass carrier (boundary c))
    (ERow : SelectedFourClass carrier (boundary e))
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (hd_mem_ARow : boundary d ∈ ARow.support)
    (hc_mem_BRow : boundary c ∈ BRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support)
    (hb_mem_CRow : boundary b ∈ CRow.support)
    (hd_mem_CRow : boundary d ∈ CRow.support)
    (hc_mem_ERow : boundary c ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support) : False := by
  have habd := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ hd_mem_ARow).symm
  have hbcf := (BRow.support_eq_radius _ hc_mem_BRow).trans
    (BRow.support_eq_radius _ hf_mem_BRow).symm
  have hcbd := (CRow.support_eq_radius _ hb_mem_CRow).trans
    (CRow.support_eq_radius _ hd_mem_CRow).symm
  have hecf := (ERow.support_eq_radius _ hc_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  exact false_of_six_ccw_four_shell_equalities_G_of_decreasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hba hcb hdc hed hfe habd hbcf hcbd hecf

/-- Cyclic-shift form of the increasing schema-G selected-row consumer.  This
is the ingress used by matchers that choose their six vertices in a cyclic
window which may cross the distinguished boundary index zero. -/
theorem false_of_four_selected_rows_in_six_ccw_order_G_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (BRow : SelectedFourClass carrier (boundary (b + cut)))
    (CRow : SelectedFourClass carrier (boundary (c + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hd_mem_ARow : boundary (d + cut) ∈ ARow.support)
    (hc_mem_BRow : boundary (c + cut) ∈ BRow.support)
    (hf_mem_BRow : boundary (f + cut) ∈ BRow.support)
    (hb_mem_CRow : boundary (b + cut) ∈ CRow.support)
    (hd_mem_CRow : boundary (d + cut) ∈ CRow.support)
    (hc_mem_ERow : boundary (c + cut) ∈ ERow.support)
    (hf_mem_ERow : boundary (f + cut) ∈ ERow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact false_of_four_selected_rows_in_six_ccw_order_G
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hab hbc hcd hde hef ARow BRow CRow ERow
    hb_mem_ARow hd_mem_ARow hc_mem_BRow hf_mem_BRow
    hb_mem_CRow hd_mem_CRow hc_mem_ERow hf_mem_ERow

/-- Cyclic-shift form of the decreasing schema-G selected-row consumer. -/
theorem false_of_four_selected_rows_in_six_ccw_order_G_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (BRow : SelectedFourClass carrier (boundary (b + cut)))
    (CRow : SelectedFourClass carrier (boundary (c + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hd_mem_ARow : boundary (d + cut) ∈ ARow.support)
    (hc_mem_BRow : boundary (c + cut) ∈ BRow.support)
    (hf_mem_BRow : boundary (f + cut) ∈ BRow.support)
    (hb_mem_CRow : boundary (b + cut) ∈ CRow.support)
    (hd_mem_CRow : boundary (d + cut) ∈ CRow.support)
    (hc_mem_ERow : boundary (c + cut) ∈ ERow.support)
    (hf_mem_ERow : boundary (f + cut) ∈ ERow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact false_of_four_selected_rows_in_six_ccw_order_G_of_decreasing
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hba hcb hdc hed hfe ARow BRow CRow ERow
    hb_mem_ARow hd_mem_ARow hc_mem_BRow hf_mem_BRow
    hb_mem_CRow hd_mem_CRow hc_mem_ERow hf_mem_ERow

/-- Six increasingly ordered boundary vertices cannot support schema H mined
from the recurring exact-seventeen two-Kalmanson cores. -/
theorem false_of_six_ccw_four_shell_equalities_H_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (habd : dist (phi a) (phi b) = dist (phi a) (phi d))
    (hcef : dist (phi c) (phi e) = dist (phi c) (phi f))
    (hedf : dist (phi e) (phi d) = dist (phi e) (phi f))
    (hfbe : dist (phi f) (phi b) = dist (phi f) (phi e)) : False := by
  have hK1_abcf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc (hcd.trans (hde.trans hef))
  have hK1_acdf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans hbc) hcd (hde.trans hef)
  have hK2_cdef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd hde hef
  simp only [dist_comm] at habd hcef hedf hfbe
  linarith

/-- Decreasing-index companion of
`false_of_six_ccw_four_shell_equalities_H_of_increasing`. -/
theorem false_of_six_ccw_four_shell_equalities_H_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (habd : dist (phi a) (phi b) = dist (phi a) (phi d))
    (hcef : dist (phi c) (phi e) = dist (phi c) (phi f))
    (hedf : dist (phi e) (phi d) = dist (phi e) (phi f))
    (hfbe : dist (phi f) (phi b) = dist (phi f) (phi e)) : False := by
  have hK1_abcf :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hba hcb
        (hfe.trans (hed.trans hdc))
  have hK1_acdf :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw (hcb.trans hba) hdc
        (hfe.trans hed)
  have hK2_cdef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc hed hfe
  simp only [dist_comm] at habd hcef hedf hfbe
  linarith

/-- Four selected rows with the schema-H incidences are impossible when the
six support points occur in increasing CCW boundary order. -/
theorem false_of_four_selected_rows_in_six_ccw_order_H
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary a))
    (CRow : SelectedFourClass carrier (boundary c))
    (ERow : SelectedFourClass carrier (boundary e))
    (FRow : SelectedFourClass carrier (boundary f))
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (hd_mem_ARow : boundary d ∈ ARow.support)
    (he_mem_CRow : boundary e ∈ CRow.support)
    (hf_mem_CRow : boundary f ∈ CRow.support)
    (hd_mem_ERow : boundary d ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support)
    (hb_mem_FRow : boundary b ∈ FRow.support)
    (he_mem_FRow : boundary e ∈ FRow.support) : False := by
  have habd := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ hd_mem_ARow).symm
  have hcef := (CRow.support_eq_radius _ he_mem_CRow).trans
    (CRow.support_eq_radius _ hf_mem_CRow).symm
  have hedf := (ERow.support_eq_radius _ hd_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  have hfbe := (FRow.support_eq_radius _ hb_mem_FRow).trans
    (FRow.support_eq_radius _ he_mem_FRow).symm
  exact false_of_six_ccw_four_shell_equalities_H_of_increasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hab hbc hcd hde hef habd hcef hedf hfbe

/-- Decreasing-index selected-row companion of
`false_of_four_selected_rows_in_six_ccw_order_H`. -/
theorem false_of_four_selected_rows_in_six_ccw_order_H_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary a))
    (CRow : SelectedFourClass carrier (boundary c))
    (ERow : SelectedFourClass carrier (boundary e))
    (FRow : SelectedFourClass carrier (boundary f))
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (hd_mem_ARow : boundary d ∈ ARow.support)
    (he_mem_CRow : boundary e ∈ CRow.support)
    (hf_mem_CRow : boundary f ∈ CRow.support)
    (hd_mem_ERow : boundary d ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support)
    (hb_mem_FRow : boundary b ∈ FRow.support)
    (he_mem_FRow : boundary e ∈ FRow.support) : False := by
  have habd := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ hd_mem_ARow).symm
  have hcef := (CRow.support_eq_radius _ he_mem_CRow).trans
    (CRow.support_eq_radius _ hf_mem_CRow).symm
  have hedf := (ERow.support_eq_radius _ hd_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  have hfbe := (FRow.support_eq_radius _ hb_mem_FRow).trans
    (FRow.support_eq_radius _ he_mem_FRow).symm
  exact false_of_six_ccw_four_shell_equalities_H_of_decreasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hba hcb hdc hed hfe habd hcef hedf hfbe

/-- Cyclic-shift form of the increasing schema-H selected-row consumer. -/
theorem false_of_four_selected_rows_in_six_ccw_order_H_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (CRow : SelectedFourClass carrier (boundary (c + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hd_mem_ARow : boundary (d + cut) ∈ ARow.support)
    (he_mem_CRow : boundary (e + cut) ∈ CRow.support)
    (hf_mem_CRow : boundary (f + cut) ∈ CRow.support)
    (hd_mem_ERow : boundary (d + cut) ∈ ERow.support)
    (hf_mem_ERow : boundary (f + cut) ∈ ERow.support)
    (hb_mem_FRow : boundary (b + cut) ∈ FRow.support)
    (he_mem_FRow : boundary (e + cut) ∈ FRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact false_of_four_selected_rows_in_six_ccw_order_H
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hab hbc hcd hde hef ARow CRow ERow FRow
    hb_mem_ARow hd_mem_ARow he_mem_CRow hf_mem_CRow
    hd_mem_ERow hf_mem_ERow hb_mem_FRow he_mem_FRow

/-- Cyclic-shift form of the decreasing schema-H selected-row consumer. -/
theorem false_of_four_selected_rows_in_six_ccw_order_H_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (CRow : SelectedFourClass carrier (boundary (c + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hd_mem_ARow : boundary (d + cut) ∈ ARow.support)
    (he_mem_CRow : boundary (e + cut) ∈ CRow.support)
    (hf_mem_CRow : boundary (f + cut) ∈ CRow.support)
    (hd_mem_ERow : boundary (d + cut) ∈ ERow.support)
    (hf_mem_ERow : boundary (f + cut) ∈ ERow.support)
    (hb_mem_FRow : boundary (b + cut) ∈ FRow.support)
    (he_mem_FRow : boundary (e + cut) ∈ FRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact false_of_four_selected_rows_in_six_ccw_order_H_of_decreasing
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hba hcb hdc hed hfe ARow CRow ERow FRow
    hb_mem_ARow hd_mem_ARow he_mem_CRow hf_mem_CRow
    hd_mem_ERow hf_mem_ERow hb_mem_FRow he_mem_FRow

/-- Six increasingly ordered boundary vertices cannot support schema I mined
from a motif recurring in every survivor after replaying all exact cores. -/
theorem false_of_six_ccw_four_shell_equalities_I_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (habe : dist (phi a) (phi b) = dist (phi a) (phi e))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e))
    (hbcf : dist (phi b) (phi c) = dist (phi b) (phi f))
    (hecf : dist (phi e) (phi c) = dist (phi e) (phi f)) : False := by
  have hK1_abef := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab (hbc.trans (hcd.trans hde)) hef
  have hK1_bcde := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc hcd hde
  simp only [dist_comm] at habe hdbe hbcf hecf
  linarith

/-- Decreasing-index companion of
`false_of_six_ccw_four_shell_equalities_I_of_increasing`. -/
theorem false_of_six_ccw_four_shell_equalities_I_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (habe : dist (phi a) (phi b) = dist (phi a) (phi e))
    (hdbe : dist (phi d) (phi b) = dist (phi d) (phi e))
    (hbcf : dist (phi b) (phi c) = dist (phi b) (phi f))
    (hecf : dist (phi e) (phi c) = dist (phi e) (phi f)) : False := by
  have hK1_abef :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hba (hed.trans (hdc.trans hcb)) hfe
  have hK1_bcde :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hcb hdc hed
  simp only [dist_comm] at habe hdbe hbcf hecf
  linarith

/-- Four selected rows with the schema-I incidences are impossible when the
six support points occur in increasing CCW boundary order. -/
theorem false_of_four_selected_rows_in_six_ccw_order_I
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary a))
    (DRow : SelectedFourClass carrier (boundary d))
    (BRow : SelectedFourClass carrier (boundary b))
    (ERow : SelectedFourClass carrier (boundary e))
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (he_mem_ARow : boundary e ∈ ARow.support)
    (hb_mem_DRow : boundary b ∈ DRow.support)
    (he_mem_DRow : boundary e ∈ DRow.support)
    (hc_mem_BRow : boundary c ∈ BRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support)
    (hc_mem_ERow : boundary c ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support) : False := by
  have habe := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ he_mem_ARow).symm
  have hdbe := (DRow.support_eq_radius _ hb_mem_DRow).trans
    (DRow.support_eq_radius _ he_mem_DRow).symm
  have hbcf := (BRow.support_eq_radius _ hc_mem_BRow).trans
    (BRow.support_eq_radius _ hf_mem_BRow).symm
  have hecf := (ERow.support_eq_radius _ hc_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  exact false_of_six_ccw_four_shell_equalities_I_of_increasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hab hbc hcd hde hef habe hdbe hbcf hecf

/-- Decreasing-order selected-row companion of schema I. -/
theorem false_of_four_selected_rows_in_six_ccw_order_I_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary a))
    (DRow : SelectedFourClass carrier (boundary d))
    (BRow : SelectedFourClass carrier (boundary b))
    (ERow : SelectedFourClass carrier (boundary e))
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (he_mem_ARow : boundary e ∈ ARow.support)
    (hb_mem_DRow : boundary b ∈ DRow.support)
    (he_mem_DRow : boundary e ∈ DRow.support)
    (hc_mem_BRow : boundary c ∈ BRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support)
    (hc_mem_ERow : boundary c ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support) : False := by
  have habe := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ he_mem_ARow).symm
  have hdbe := (DRow.support_eq_radius _ hb_mem_DRow).trans
    (DRow.support_eq_radius _ he_mem_DRow).symm
  have hbcf := (BRow.support_eq_radius _ hc_mem_BRow).trans
    (BRow.support_eq_radius _ hf_mem_BRow).symm
  have hecf := (ERow.support_eq_radius _ hc_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  exact false_of_six_ccw_four_shell_equalities_I_of_decreasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hba hcb hdc hed hfe habe hdbe hbcf hecf

/-- Cyclic-shift form of the increasing schema-I selected-row consumer. -/
theorem false_of_four_selected_rows_in_six_ccw_order_I_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (DRow : SelectedFourClass carrier (boundary (d + cut)))
    (BRow : SelectedFourClass carrier (boundary (b + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (he_mem_ARow : boundary (e + cut) ∈ ARow.support)
    (hb_mem_DRow : boundary (b + cut) ∈ DRow.support)
    (he_mem_DRow : boundary (e + cut) ∈ DRow.support)
    (hc_mem_BRow : boundary (c + cut) ∈ BRow.support)
    (hf_mem_BRow : boundary (f + cut) ∈ BRow.support)
    (hc_mem_ERow : boundary (c + cut) ∈ ERow.support)
    (hf_mem_ERow : boundary (f + cut) ∈ ERow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact false_of_four_selected_rows_in_six_ccw_order_I
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hab hbc hcd hde hef ARow DRow BRow ERow
    hb_mem_ARow he_mem_ARow hb_mem_DRow he_mem_DRow
    hc_mem_BRow hf_mem_BRow hc_mem_ERow hf_mem_ERow

/-- Cyclic-shift form of the decreasing schema-I selected-row consumer. -/
theorem false_of_four_selected_rows_in_six_ccw_order_I_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (DRow : SelectedFourClass carrier (boundary (d + cut)))
    (BRow : SelectedFourClass carrier (boundary (b + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (he_mem_ARow : boundary (e + cut) ∈ ARow.support)
    (hb_mem_DRow : boundary (b + cut) ∈ DRow.support)
    (he_mem_DRow : boundary (e + cut) ∈ DRow.support)
    (hc_mem_BRow : boundary (c + cut) ∈ BRow.support)
    (hf_mem_BRow : boundary (f + cut) ∈ BRow.support)
    (hc_mem_ERow : boundary (c + cut) ∈ ERow.support)
    (hf_mem_ERow : boundary (f + cut) ∈ ERow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i => boundary (i + cut)
  exact false_of_four_selected_rows_in_six_ccw_order_I_of_decreasing
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hba hcb hdc hed hfe ARow DRow BRow ERow
    hb_mem_ARow he_mem_ARow hb_mem_DRow he_mem_DRow
    hc_mem_BRow hf_mem_BRow hc_mem_ERow hf_mem_ERow

/-- Six increasingly ordered boundary vertices cannot support schema J mined
from the first survivors of the source-faithful schema-I replay. -/
theorem false_of_six_ccw_four_shell_equalities_J_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (habd : dist (phi a) (phi b) = dist (phi a) (phi d))
    (hbac : dist (phi b) (phi a) = dist (phi b) (phi c))
    (heab : dist (phi e) (phi a) = dist (phi e) (phi b))
    (hfcd : dist (phi f) (phi c) = dist (phi f) (phi d)) : False := by
  have hK2_abde := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab (hbc.trans hcd) hde
  have hK1_bcdf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc hcd (hde.trans hef)
  simp only [dist_comm] at habd hbac heab hfcd hK2_abde hK1_bcdf
  linarith

/-- Decreasing-index companion of
`false_of_six_ccw_four_shell_equalities_J_of_increasing`. -/
theorem false_of_six_ccw_four_shell_equalities_J_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (habd : dist (phi a) (phi b) = dist (phi a) (phi d))
    (hbac : dist (phi b) (phi a) = dist (phi b) (phi c))
    (heab : dist (phi e) (phi a) = dist (phi e) (phi b))
    (hfcd : dist (phi f) (phi c) = dist (phi f) (phi d)) : False := by
  have hK2_abde := dist_add_dist_lt_diagonal_sum_of_ccw
    (ia := e) (ib := d) (ic := b) (id := a)
    hA hphi_inj hphi_image hccw hed (hdc.trans hcb) hba
  have hK1_bcdf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    (ia := f) (ib := d) (ic := c) (id := b)
    hA hphi_inj hphi_image hccw (hfe.trans hed) hdc hcb
  simp only [dist_comm] at habd hbac heab hfcd hK2_abde hK1_bcdf
  linarith

/-- Four selected rows with the schema-J incidences are impossible when the
six support points occur in increasing CCW boundary order. -/
theorem false_of_four_selected_rows_in_six_ccw_order_J
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary a))
    (BRow : SelectedFourClass carrier (boundary b))
    (ERow : SelectedFourClass carrier (boundary e))
    (FRow : SelectedFourClass carrier (boundary f))
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (hd_mem_ARow : boundary d ∈ ARow.support)
    (ha_mem_BRow : boundary a ∈ BRow.support)
    (hc_mem_BRow : boundary c ∈ BRow.support)
    (ha_mem_ERow : boundary a ∈ ERow.support)
    (hb_mem_ERow : boundary b ∈ ERow.support)
    (hc_mem_FRow : boundary c ∈ FRow.support)
    (hd_mem_FRow : boundary d ∈ FRow.support) : False := by
  have habd := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ hd_mem_ARow).symm
  have hbac := (BRow.support_eq_radius _ ha_mem_BRow).trans
    (BRow.support_eq_radius _ hc_mem_BRow).symm
  have heab := (ERow.support_eq_radius _ ha_mem_ERow).trans
    (ERow.support_eq_radius _ hb_mem_ERow).symm
  have hfcd := (FRow.support_eq_radius _ hc_mem_FRow).trans
    (FRow.support_eq_radius _ hd_mem_FRow).symm
  exact false_of_six_ccw_four_shell_equalities_J_of_increasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hab hbc hcd hde hef habd hbac heab hfcd

/-- Decreasing-order selected-row companion of schema J. -/
theorem false_of_four_selected_rows_in_six_ccw_order_J_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary a))
    (BRow : SelectedFourClass carrier (boundary b))
    (ERow : SelectedFourClass carrier (boundary e))
    (FRow : SelectedFourClass carrier (boundary f))
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (hd_mem_ARow : boundary d ∈ ARow.support)
    (ha_mem_BRow : boundary a ∈ BRow.support)
    (hc_mem_BRow : boundary c ∈ BRow.support)
    (ha_mem_ERow : boundary a ∈ ERow.support)
    (hb_mem_ERow : boundary b ∈ ERow.support)
    (hc_mem_FRow : boundary c ∈ FRow.support)
    (hd_mem_FRow : boundary d ∈ FRow.support) : False := by
  have habd := (ARow.support_eq_radius _ hb_mem_ARow).trans
    (ARow.support_eq_radius _ hd_mem_ARow).symm
  have hbac := (BRow.support_eq_radius _ ha_mem_BRow).trans
    (BRow.support_eq_radius _ hc_mem_BRow).symm
  have heab := (ERow.support_eq_radius _ ha_mem_ERow).trans
    (ERow.support_eq_radius _ hb_mem_ERow).symm
  have hfcd := (FRow.support_eq_radius _ hc_mem_FRow).trans
    (FRow.support_eq_radius _ hd_mem_FRow).symm
  exact false_of_six_ccw_four_shell_equalities_J_of_decreasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hba hcb hdc hed hfe habd hbac heab hfcd

/-- Cyclic-shift form of the increasing schema-J selected-row consumer. -/
theorem false_of_four_selected_rows_in_six_ccw_order_J_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (BRow : SelectedFourClass carrier (boundary (b + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hd_mem_ARow : boundary (d + cut) ∈ ARow.support)
    (ha_mem_BRow : boundary (a + cut) ∈ BRow.support)
    (hc_mem_BRow : boundary (c + cut) ∈ BRow.support)
    (ha_mem_ERow : boundary (a + cut) ∈ ERow.support)
    (hb_mem_ERow : boundary (b + cut) ∈ ERow.support)
    (hc_mem_FRow : boundary (c + cut) ∈ FRow.support)
    (hd_mem_FRow : boundary (d + cut) ∈ FRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  exact false_of_four_selected_rows_in_six_ccw_order_J
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hab hbc hcd hde hef ARow BRow ERow FRow
    hb_mem_ARow hd_mem_ARow ha_mem_BRow hc_mem_BRow
    ha_mem_ERow hb_mem_ERow hc_mem_FRow hd_mem_FRow

/-- Cyclic-shift form of the decreasing schema-J selected-row consumer. -/
theorem false_of_four_selected_rows_in_six_ccw_order_J_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (BRow : SelectedFourClass carrier (boundary (b + cut)))
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (FRow : SelectedFourClass carrier (boundary (f + cut)))
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hd_mem_ARow : boundary (d + cut) ∈ ARow.support)
    (ha_mem_BRow : boundary (a + cut) ∈ BRow.support)
    (hc_mem_BRow : boundary (c + cut) ∈ BRow.support)
    (ha_mem_ERow : boundary (a + cut) ∈ ERow.support)
    (hb_mem_ERow : boundary (b + cut) ∈ ERow.support)
    (hc_mem_FRow : boundary (c + cut) ∈ FRow.support)
    (hd_mem_FRow : boundary (d + cut) ∈ FRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  exact false_of_four_selected_rows_in_six_ccw_order_J_of_decreasing
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hba hcb hdc hed hfe ARow BRow ERow FRow
    hb_mem_ARow hd_mem_ARow ha_mem_BRow hc_mem_BRow
    ha_mem_ERow hb_mem_ERow hc_mem_FRow hd_mem_FRow

/-- Six increasingly ordered boundary vertices cannot support schema K mined
by compressing an exact-seventeen global Kalmanson certificate to the vertices
named by its four selected rows. -/
theorem false_of_six_ccw_six_shell_equalities_K_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (hedb : dist (phi e) (phi d) = dist (phi e) (phi b))
    (hedf : dist (phi e) (phi d) = dist (phi e) (phi f))
    (hdac : dist (phi d) (phi a) = dist (phi d) (phi c))
    (haeb : dist (phi a) (phi e) = dist (phi a) (phi b))
    (haec : dist (phi a) (phi e) = dist (phi a) (phi c))
    (hbaf : dist (phi b) (phi a) = dist (phi b) (phi f)) : False := by
  have hK2_abcd := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc hcd
  have hK2_abcf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc (hcd.trans (hde.trans hef))
  have hK1_abde := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab (hbc.trans hcd) hde
  have hK2_acdf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans hbc) hcd (hde.trans hef)
  have hK2_adef := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw
      (hab.trans (hbc.trans hcd)) hde hef
  simp only [dist_comm] at hedb hedf hdac haeb haec hbaf hK2_abcd hK2_abcf hK1_abde hK2_acdf hK2_adef
  linarith

/-- Decreasing-index companion of
`false_of_six_ccw_six_shell_equalities_K_of_increasing`. -/
theorem false_of_six_ccw_six_shell_equalities_K_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (hedb : dist (phi e) (phi d) = dist (phi e) (phi b))
    (hedf : dist (phi e) (phi d) = dist (phi e) (phi f))
    (hdac : dist (phi d) (phi a) = dist (phi d) (phi c))
    (haeb : dist (phi a) (phi e) = dist (phi a) (phi b))
    (haec : dist (phi a) (phi e) = dist (phi a) (phi c))
    (hbaf : dist (phi b) (phi a) = dist (phi b) (phi f)) : False := by
  have hK2_abcd := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb hdc
  have hK2_abcf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb (hfe.trans (hed.trans hdc))
  have hK1_abde := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba (hdc.trans hcb) hed
  have hK2_acdf := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hcb.trans hba) hdc (hfe.trans hed)
  have hK2_adef := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hdc.trans (hcb.trans hba)) hed hfe
  simp only [dist_comm] at hedb hedf hdac haeb haec hbaf hK2_abcd hK2_abcf hK1_abde hK2_acdf hK2_adef
  linarith

/-- Four selected rows with the schema-K incidences are impossible when the
six support points occur in increasing CCW boundary order. -/
theorem false_of_four_selected_rows_in_six_ccw_order_K
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ERow : SelectedFourClass carrier (boundary e))
    (DRow : SelectedFourClass carrier (boundary d))
    (ARow : SelectedFourClass carrier (boundary a))
    (BRow : SelectedFourClass carrier (boundary b))
    (hd_mem_ERow : boundary d ∈ ERow.support)
    (hb_mem_ERow : boundary b ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support)
    (ha_mem_DRow : boundary a ∈ DRow.support)
    (hc_mem_DRow : boundary c ∈ DRow.support)
    (he_mem_ARow : boundary e ∈ ARow.support)
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (hc_mem_ARow : boundary c ∈ ARow.support)
    (ha_mem_BRow : boundary a ∈ BRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support) : False := by
  have hedb := (ERow.support_eq_radius _ hd_mem_ERow).trans
    (ERow.support_eq_radius _ hb_mem_ERow).symm
  have hedf := (ERow.support_eq_radius _ hd_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  have hdac := (DRow.support_eq_radius _ ha_mem_DRow).trans
    (DRow.support_eq_radius _ hc_mem_DRow).symm
  have haeb := (ARow.support_eq_radius _ he_mem_ARow).trans
    (ARow.support_eq_radius _ hb_mem_ARow).symm
  have haec := (ARow.support_eq_radius _ he_mem_ARow).trans
    (ARow.support_eq_radius _ hc_mem_ARow).symm
  have hbaf := (BRow.support_eq_radius _ ha_mem_BRow).trans
    (BRow.support_eq_radius _ hf_mem_BRow).symm
  exact false_of_six_ccw_six_shell_equalities_K_of_increasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hab hbc hcd hde hef hedb hedf hdac haeb haec hbaf

/-- Decreasing-order selected-row companion of schema K. -/
theorem false_of_four_selected_rows_in_six_ccw_order_K_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ERow : SelectedFourClass carrier (boundary e))
    (DRow : SelectedFourClass carrier (boundary d))
    (ARow : SelectedFourClass carrier (boundary a))
    (BRow : SelectedFourClass carrier (boundary b))
    (hd_mem_ERow : boundary d ∈ ERow.support)
    (hb_mem_ERow : boundary b ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support)
    (ha_mem_DRow : boundary a ∈ DRow.support)
    (hc_mem_DRow : boundary c ∈ DRow.support)
    (he_mem_ARow : boundary e ∈ ARow.support)
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (hc_mem_ARow : boundary c ∈ ARow.support)
    (ha_mem_BRow : boundary a ∈ BRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support) : False := by
  have hedb := (ERow.support_eq_radius _ hd_mem_ERow).trans
    (ERow.support_eq_radius _ hb_mem_ERow).symm
  have hedf := (ERow.support_eq_radius _ hd_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  have hdac := (DRow.support_eq_radius _ ha_mem_DRow).trans
    (DRow.support_eq_radius _ hc_mem_DRow).symm
  have haeb := (ARow.support_eq_radius _ he_mem_ARow).trans
    (ARow.support_eq_radius _ hb_mem_ARow).symm
  have haec := (ARow.support_eq_radius _ he_mem_ARow).trans
    (ARow.support_eq_radius _ hc_mem_ARow).symm
  have hbaf := (BRow.support_eq_radius _ ha_mem_BRow).trans
    (BRow.support_eq_radius _ hf_mem_BRow).symm
  exact false_of_six_ccw_six_shell_equalities_K_of_decreasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hba hcb hdc hed hfe hedb hedf hdac haeb haec hbaf

/-- Cyclic-shift form of the increasing schema-K selected-row consumer. -/
theorem false_of_four_selected_rows_in_six_ccw_order_K_cyclicShift
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f)
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (DRow : SelectedFourClass carrier (boundary (d + cut)))
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (BRow : SelectedFourClass carrier (boundary (b + cut)))
    (hd_mem_ERow : boundary (d + cut) ∈ ERow.support)
    (hb_mem_ERow : boundary (b + cut) ∈ ERow.support)
    (hf_mem_ERow : boundary (f + cut) ∈ ERow.support)
    (ha_mem_DRow : boundary (a + cut) ∈ DRow.support)
    (hc_mem_DRow : boundary (c + cut) ∈ DRow.support)
    (he_mem_ARow : boundary (e + cut) ∈ ARow.support)
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hc_mem_ARow : boundary (c + cut) ∈ ARow.support)
    (ha_mem_BRow : boundary (a + cut) ∈ BRow.support)
    (hf_mem_BRow : boundary (f + cut) ∈ BRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  exact false_of_four_selected_rows_in_six_ccw_order_K
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hab hbc hcd hde hef ERow DRow ARow BRow
    hd_mem_ERow hb_mem_ERow hf_mem_ERow ha_mem_DRow hc_mem_DRow
    he_mem_ARow hb_mem_ARow hc_mem_ARow ha_mem_BRow hf_mem_BRow

/-- Cyclic-shift form of the decreasing schema-K selected-row consumer. -/
theorem false_of_four_selected_rows_in_six_ccw_order_K_cyclicShift_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (cut : Fin carrier.card)
    {a b c d e f : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e)
    (ERow : SelectedFourClass carrier (boundary (e + cut)))
    (DRow : SelectedFourClass carrier (boundary (d + cut)))
    (ARow : SelectedFourClass carrier (boundary (a + cut)))
    (BRow : SelectedFourClass carrier (boundary (b + cut)))
    (hd_mem_ERow : boundary (d + cut) ∈ ERow.support)
    (hb_mem_ERow : boundary (b + cut) ∈ ERow.support)
    (hf_mem_ERow : boundary (f + cut) ∈ ERow.support)
    (ha_mem_DRow : boundary (a + cut) ∈ DRow.support)
    (hc_mem_DRow : boundary (c + cut) ∈ DRow.support)
    (he_mem_ARow : boundary (e + cut) ∈ ARow.support)
    (hb_mem_ARow : boundary (b + cut) ∈ ARow.support)
    (hc_mem_ARow : boundary (c + cut) ∈ ARow.support)
    (ha_mem_BRow : boundary (a + cut) ∈ BRow.support)
    (hf_mem_BRow : boundary (f + cut) ∈ BRow.support) : False := by
  let shifted : Fin carrier.card → ℝ² := fun i ↦ boundary (i + cut)
  exact false_of_four_selected_rows_in_six_ccw_order_K_of_decreasing
    hcarrier
    (by simpa only [shifted] using injective_cyclicShift hboundary_injective cut)
    (by
      simpa only [shifted] using
        (image_univ_cyclicShift boundary cut).trans hboundary_image)
    (by
      simpa only [shifted] using
        isCcwConvexPolygon_cyclicShift hboundary_injective hboundary_ccw cut)
    hba hcb hdc hed hfe ERow DRow ARow BRow
    hd_mem_ERow hb_mem_ERow hf_mem_ERow ha_mem_DRow hc_mem_DRow
    he_mem_ARow hb_mem_ARow hc_mem_ARow ha_mem_BRow hf_mem_BRow

/-- Seven increasingly ordered boundary vertices cannot support schema L,
the smallest remaining local obstruction in the post-K exact-seventeen bank. -/
theorem false_of_seven_ccw_five_shell_equalities_L_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (hgda : dist (phi g) (phi d) = dist (phi g) (phi a))
    (hceb : dist (phi c) (phi e) = dist (phi c) (phi b))
    (hegb : dist (phi e) (phi g) = dist (phi e) (phi b))
    (hegd : dist (phi e) (phi g) = dist (phi e) (phi d))
    (hfea : dist (phi f) (phi e) = dist (phi f) (phi a)) : False := by
  have hK1_abce := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab hbc (hcd.trans hde)
  have hK1_abfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab
      (hbc.trans (hcd.trans (hde.trans hef))) hfg
  have hK2_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans hbc) hcd
      (hde.trans (hef.trans hfg))
  have hK2_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw (hab.trans (hbc.trans hcd)) hde
      (hef.trans hfg)
  have hK1_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans (hde.trans hef)) hfg
  have hK1_cdef := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd hde hef
  have hK1_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd (hde.trans hef) hfg
  have hK1_defg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hde hef hfg
  simp only [dist_comm] at hgda hceb hegb hegd hfea
  linarith

/-- Decreasing-index companion of schema L. -/
theorem false_of_seven_ccw_five_shell_equalities_L_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e) (hgf : g < f)
    (hgda : dist (phi g) (phi d) = dist (phi g) (phi a))
    (hceb : dist (phi c) (phi e) = dist (phi c) (phi b))
    (hegb : dist (phi e) (phi g) = dist (phi e) (phi b))
    (hegd : dist (phi e) (phi g) = dist (phi e) (phi d))
    (hfea : dist (phi f) (phi e) = dist (phi f) (phi a)) : False := by
  have hK1_abce := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba hcb (hed.trans hdc)
  have hK1_abfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hba
      (hfe.trans (hed.trans (hdc.trans hcb))) hgf
  have hK2_acdg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hcb.trans hba) hdc
      (hgf.trans (hfe.trans hed))
  have hK2_adeg := complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw (hdc.trans (hcb.trans hba)) hed
      (hgf.trans hfe)
  have hK1_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hcb (hfe.trans (hed.trans hdc)) hgf
  have hK1_cdef := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc hed hfe
  have hK1_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hdc (hfe.trans hed) hgf
  have hK1_defg := dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw hed hfe hgf
  simp only [dist_comm] at hgda hceb hegb hegd hfea
  linarith

/-- Four selected rows with schema-L incidences are impossible in increasing
CCW boundary order. -/
theorem false_of_four_selected_rows_in_seven_ccw_order_L
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f g : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g)
    (GRow : SelectedFourClass carrier (boundary g))
    (CRow : SelectedFourClass carrier (boundary c))
    (ERow : SelectedFourClass carrier (boundary e))
    (FRow : SelectedFourClass carrier (boundary f))
    (hd_mem_GRow : boundary d ∈ GRow.support)
    (ha_mem_GRow : boundary a ∈ GRow.support)
    (he_mem_CRow : boundary e ∈ CRow.support)
    (hb_mem_CRow : boundary b ∈ CRow.support)
    (hg_mem_ERow : boundary g ∈ ERow.support)
    (hb_mem_ERow : boundary b ∈ ERow.support)
    (hd_mem_ERow : boundary d ∈ ERow.support)
    (he_mem_FRow : boundary e ∈ FRow.support)
    (ha_mem_FRow : boundary a ∈ FRow.support) : False := by
  have hgda := (GRow.support_eq_radius _ hd_mem_GRow).trans
    (GRow.support_eq_radius _ ha_mem_GRow).symm
  have hceb := (CRow.support_eq_radius _ he_mem_CRow).trans
    (CRow.support_eq_radius _ hb_mem_CRow).symm
  have hegb := (ERow.support_eq_radius _ hg_mem_ERow).trans
    (ERow.support_eq_radius _ hb_mem_ERow).symm
  have hegd := (ERow.support_eq_radius _ hg_mem_ERow).trans
    (ERow.support_eq_radius _ hd_mem_ERow).symm
  have hfea := (FRow.support_eq_radius _ he_mem_FRow).trans
    (FRow.support_eq_radius _ ha_mem_FRow).symm
  exact false_of_seven_ccw_five_shell_equalities_L_of_increasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hab hbc hcd hde hef hfg hgda hceb hegb hegd hfea

/-- Decreasing-order selected-row companion of schema L. -/
theorem false_of_four_selected_rows_in_seven_ccw_order_L_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f g : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e) (hgf : g < f)
    (GRow : SelectedFourClass carrier (boundary g))
    (CRow : SelectedFourClass carrier (boundary c))
    (ERow : SelectedFourClass carrier (boundary e))
    (FRow : SelectedFourClass carrier (boundary f))
    (hd_mem_GRow : boundary d ∈ GRow.support)
    (ha_mem_GRow : boundary a ∈ GRow.support)
    (he_mem_CRow : boundary e ∈ CRow.support)
    (hb_mem_CRow : boundary b ∈ CRow.support)
    (hg_mem_ERow : boundary g ∈ ERow.support)
    (hb_mem_ERow : boundary b ∈ ERow.support)
    (hd_mem_ERow : boundary d ∈ ERow.support)
    (he_mem_FRow : boundary e ∈ FRow.support)
    (ha_mem_FRow : boundary a ∈ FRow.support) : False := by
  have hgda := (GRow.support_eq_radius _ hd_mem_GRow).trans
    (GRow.support_eq_radius _ ha_mem_GRow).symm
  have hceb := (CRow.support_eq_radius _ he_mem_CRow).trans
    (CRow.support_eq_radius _ hb_mem_CRow).symm
  have hegb := (ERow.support_eq_radius _ hg_mem_ERow).trans
    (ERow.support_eq_radius _ hb_mem_ERow).symm
  have hegd := (ERow.support_eq_radius _ hg_mem_ERow).trans
    (ERow.support_eq_radius _ hd_mem_ERow).symm
  have hfea := (FRow.support_eq_radius _ he_mem_FRow).trans
    (FRow.support_eq_radius _ ha_mem_FRow).symm
  exact false_of_seven_ccw_five_shell_equalities_L_of_decreasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hba hcb hdc hed hfe hgf hgda hceb hegb hegd hfea

/-- Eight increasingly ordered boundary vertices cannot support schema M.
This is the exact ten-term weighted Kalmanson cancellation extracted from the
first successor after installing schemas K and L in the exact-seventeen
`BlockerV` census. -/
theorem false_of_eight_ccw_six_shell_equalities_M_of_increasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g h : Fin n}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g) (hgh : g < h)
    (hadb : dist (phi a) (phi d) = dist (phi a) (phi b))
    (hadh : dist (phi a) (phi d) = dist (phi a) (phi h))
    (hgab : dist (phi g) (phi a) = dist (phi g) (phi b))
    (hdch : dist (phi d) (phi c) = dist (phi d) (phi h))
    (hecf : dist (phi e) (phi c) = dist (phi e) (phi f))
    (hbaf : dist (phi b) (phi a) = dist (phi b) (phi f)) : False := by
  have hK2_abde := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab (hbc.trans hcd) hde
  have hK2_abgh := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hab
      (hbc.trans (hcd.trans (hde.trans (hef.trans hfg)))) hgh
  have hK1_adeh := complementary_dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw
      (hab.trans (hbc.trans hcd)) hde (hef.trans (hfg.trans hgh))
  have hK2_bcde := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc hcd hde
  have hK2_bcfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc (hcd.trans (hde.trans hef)) hfg
  have hK2_bcgh := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hbc
      (hcd.trans (hde.trans (hef.trans hfg))) hgh
  have hK2_cdfg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd (hde.trans hef) hfg
  have hK2_cdgh := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hcd (hde.trans (hef.trans hfg)) hgh
  have hK2_defg := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hde hef hfg
  have hK2_degh := dist_add_dist_lt_diagonal_sum_of_ccw
    hA hphi_inj hphi_image hccw hde (hef.trans hfg) hgh
  simp only [dist_comm] at *
  linarith

/-- Decreasing-index companion of schema M. -/
theorem false_of_eight_ccw_six_shell_equalities_M_of_decreasing
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {n : ℕ} {phi : Fin n → ℝ²}
    (hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon phi)
    {a b c d e f g h : Fin n}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e) (hgf : g < f) (hhg : h < g)
    (hadb : dist (phi a) (phi d) = dist (phi a) (phi b))
    (hadh : dist (phi a) (phi d) = dist (phi a) (phi h))
    (hgab : dist (phi g) (phi a) = dist (phi g) (phi b))
    (hdch : dist (phi d) (phi c) = dist (phi d) (phi h))
    (hecf : dist (phi e) (phi c) = dist (phi e) (phi f))
    (hbaf : dist (phi b) (phi a) = dist (phi b) (phi f)) : False := by
  have hK2_abde :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hba (hdc.trans hcb) hed
  have hK2_abgh :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hba
        (hgf.trans (hfe.trans (hed.trans (hdc.trans hcb)))) hhg
  have hK1_adeh :=
    complementary_dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
    hA hphi_inj hphi_image hccw
      (hdc.trans (hcb.trans hba)) hed (hhg.trans (hgf.trans hfe))
  have hK2_bcde :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hcb hdc hed
  have hK2_bcfg :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hcb (hfe.trans (hed.trans hdc)) hgf
  have hK2_bcgh :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hcb
        (hgf.trans (hfe.trans (hed.trans hdc))) hhg
  have hK2_cdfg :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hdc (hfe.trans hed) hgf
  have hK2_cdgh :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hdc (hgf.trans (hfe.trans hed)) hhg
  have hK2_defg :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hed hfe hgf
  have hK2_degh :=
    dist_add_dist_lt_diagonal_sum_of_ccw_of_decreasing
      hA hphi_inj hphi_image hccw hed (hgf.trans hfe) hhg
  simp only [dist_comm] at *
  linarith

/-- Five selected rows with schema-M incidences are impossible in increasing
CCW boundary order. -/
theorem false_of_five_selected_rows_in_eight_ccw_order_M
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f g h : Fin carrier.card}
    (hab : a < b) (hbc : b < c) (hcd : c < d)
    (hde : d < e) (hef : e < f) (hfg : f < g) (hgh : g < h)
    (ARow : SelectedFourClass carrier (boundary a))
    (GRow : SelectedFourClass carrier (boundary g))
    (DRow : SelectedFourClass carrier (boundary d))
    (ERow : SelectedFourClass carrier (boundary e))
    (BRow : SelectedFourClass carrier (boundary b))
    (hd_mem_ARow : boundary d ∈ ARow.support)
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (hh_mem_ARow : boundary h ∈ ARow.support)
    (ha_mem_GRow : boundary a ∈ GRow.support)
    (hb_mem_GRow : boundary b ∈ GRow.support)
    (hc_mem_DRow : boundary c ∈ DRow.support)
    (hh_mem_DRow : boundary h ∈ DRow.support)
    (hc_mem_ERow : boundary c ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support)
    (ha_mem_BRow : boundary a ∈ BRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support) : False := by
  have hadb := (ARow.support_eq_radius _ hd_mem_ARow).trans
    (ARow.support_eq_radius _ hb_mem_ARow).symm
  have hadh := (ARow.support_eq_radius _ hd_mem_ARow).trans
    (ARow.support_eq_radius _ hh_mem_ARow).symm
  have hgab := (GRow.support_eq_radius _ ha_mem_GRow).trans
    (GRow.support_eq_radius _ hb_mem_GRow).symm
  have hdch := (DRow.support_eq_radius _ hc_mem_DRow).trans
    (DRow.support_eq_radius _ hh_mem_DRow).symm
  have hecf := (ERow.support_eq_radius _ hc_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  have hbaf := (BRow.support_eq_radius _ ha_mem_BRow).trans
    (BRow.support_eq_radius _ hf_mem_BRow).symm
  exact false_of_eight_ccw_six_shell_equalities_M_of_increasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hab hbc hcd hde hef hfg hgh hadb hadh hgab hdch hecf hbaf

/-- Decreasing-order selected-row companion of schema M. -/
theorem false_of_five_selected_rows_in_eight_ccw_order_M_of_decreasing
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {a b c d e f g h : Fin carrier.card}
    (hba : b < a) (hcb : c < b) (hdc : d < c)
    (hed : e < d) (hfe : f < e) (hgf : g < f) (hhg : h < g)
    (ARow : SelectedFourClass carrier (boundary a))
    (GRow : SelectedFourClass carrier (boundary g))
    (DRow : SelectedFourClass carrier (boundary d))
    (ERow : SelectedFourClass carrier (boundary e))
    (BRow : SelectedFourClass carrier (boundary b))
    (hd_mem_ARow : boundary d ∈ ARow.support)
    (hb_mem_ARow : boundary b ∈ ARow.support)
    (hh_mem_ARow : boundary h ∈ ARow.support)
    (ha_mem_GRow : boundary a ∈ GRow.support)
    (hb_mem_GRow : boundary b ∈ GRow.support)
    (hc_mem_DRow : boundary c ∈ DRow.support)
    (hh_mem_DRow : boundary h ∈ DRow.support)
    (hc_mem_ERow : boundary c ∈ ERow.support)
    (hf_mem_ERow : boundary f ∈ ERow.support)
    (ha_mem_BRow : boundary a ∈ BRow.support)
    (hf_mem_BRow : boundary f ∈ BRow.support) : False := by
  have hadb := (ARow.support_eq_radius _ hd_mem_ARow).trans
    (ARow.support_eq_radius _ hb_mem_ARow).symm
  have hadh := (ARow.support_eq_radius _ hd_mem_ARow).trans
    (ARow.support_eq_radius _ hh_mem_ARow).symm
  have hgab := (GRow.support_eq_radius _ ha_mem_GRow).trans
    (GRow.support_eq_radius _ hb_mem_GRow).symm
  have hdch := (DRow.support_eq_radius _ hc_mem_DRow).trans
    (DRow.support_eq_radius _ hh_mem_DRow).symm
  have hecf := (ERow.support_eq_radius _ hc_mem_ERow).trans
    (ERow.support_eq_radius _ hf_mem_ERow).symm
  have hbaf := (BRow.support_eq_radius _ ha_mem_BRow).trans
    (BRow.support_eq_radius _ hf_mem_BRow).symm
  exact false_of_eight_ccw_six_shell_equalities_M_of_decreasing
    hcarrier hboundary_injective hboundary_image hboundary_ccw
    hba hcb hdc hed hfe hgf hhg hadb hadh hgab hdch hecf hbaf

end CapCrossingKalmansonBridge
end Problem97
