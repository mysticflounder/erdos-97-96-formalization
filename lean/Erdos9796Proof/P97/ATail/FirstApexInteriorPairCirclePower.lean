import Erdos9796Proof.P97.ATail.FirstApexInteriorPairGeometry
import Erdos9796Proof.P97.SameShellSuperadditivity
import Erdos9796Proof.P97.SignedAreaOangle

/-!
# Circle power across a first-apex interior chord

This module isolates the Euclidean step behind the physical exact-five
radius-drop branch.  Two distinct points determine a chord.  If two circle
centers lie on its perpendicular bisector, and a point of the second circle
lies on the first center's side of the chord, then that point lies strictly
closer to the first center than the chord endpoints do.
-/

open EuclideanGeometry
open scoped RealInnerProductSpace

namespace Problem97
namespace FirstApexInteriorPairCirclePower

/-- A coordinate-free circle-power comparison.  The signed-area hypotheses
say that `c` is on one open side of the chord `qw`, while `O` and `z` are on
the other. -/
theorem dist_lt_of_two_bisectors_of_area_signs
    {O c q w z : ℝ²}
    (hqw : q ≠ w)
    (hOeq : dist O q = dist O w)
    (hcEq : dist c q = dist c w)
    (hzEq : dist c z = dist c q)
    (hcArea : 0 < signedArea2 q w c)
    (hOArea : signedArea2 q w O < 0)
    (hzArea : signedArea2 q w z < 0) :
    dist O z < dist O q := by
  rw [signedArea2_eq_stdOrientation_areaForm] at hcArea hOArea hzArea
  have horth : inner ℝ (c - O) (w - q) = 0 := by
    simpa only [vsub_eq_sub] using
      (EuclideanGeometry.inner_vsub_vsub_of_dist_eq_of_dist_eq
        (c₁ := O) (c₂ := c) (p₁ := q) (p₂ := w)
        (by simpa [dist_comm] using hOeq)
        (by simpa [dist_comm] using hcEq))
  have horth' : inner ℝ (w - q) (c - O) = 0 := by
    simpa [real_inner_comm] using horth
  have hcOArea :
      0 < stdOrientation.areaForm (w - q) (c - O) := by
    have hrewrite :
        stdOrientation.areaForm (w - q) (c - O) =
          stdOrientation.areaForm (w - q) (c - q) -
            stdOrientation.areaForm (w - q) (O - q) := by
      rw [show c - O = (c - q) - (O - q) by abel]
      exact LinearMap.map_sub _ _ _
    rw [hrewrite]
    linarith
  have hareaProd :
      stdOrientation.areaForm (w - q) (c - O) *
          stdOrientation.areaForm (w - q) (z - q) < 0 :=
    mul_neg_of_pos_of_neg hcOArea hzArea
  have hnorm : 0 < ‖w - q‖ ^ 2 := by
    exact sq_pos_of_pos (norm_pos_iff.mpr (sub_ne_zero.mpr hqw.symm))
  have hgram :=
    Orientation.inner_mul_inner_add_areaForm_mul_areaForm
      stdOrientation (w - q) (c - O) (z - q)
  have hprodInner :
      ‖w - q‖ ^ 2 * inner ℝ (c - O) (z - q) < 0 := by
    rw [horth', zero_mul, zero_add] at hgram
    linarith
  have hinner : inner ℝ (c - O) (z - q) < 0 := by
    rcases (mul_neg_iff.mp hprodInner) with h | h
    · exact h.2
    · exact (not_lt_of_ge (le_of_lt hnorm) h.1).elim
  have hcircleSq : ‖c - z‖ ^ 2 = ‖c - q‖ ^ 2 := by
    have := congrArg (fun x : ℝ => x ^ 2) hzEq
    simpa [dist_eq_norm] using this
  have hpower :
      ‖O - z‖ ^ 2 - ‖O - q‖ ^ 2 =
        2 * inner ℝ (c - O) (z - q) := by
    rw [norm_sub_sq_real, norm_sub_sq_real] at hcircleSq
    rw [norm_sub_sq_real, norm_sub_sq_real]
    simp only [inner_sub_left, inner_sub_right]
    nlinarith
  have hsq : ‖O - z‖ ^ 2 < ‖O - q‖ ^ 2 := by
    nlinarith
  simp only [dist_eq_norm]
  nlinarith [norm_nonneg (O - z), norm_nonneg (O - q),
    sq_nonneg (‖O - z‖ - ‖O - q‖)]

/-- Ordered-cap form of the circle-power comparison.  The point at index `j`
is a common bisector center for the endpoint chord, while `O` and `z` are
carrier points outside the indexed cap. -/
theorem dist_lt_of_ordered_cap_bisectors_and_off_cap
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (hconv : ConvexIndep A)
    (Packet : CGN.MecCapPacket A L)
    (Hord : CGN.StrictCapOrder A L)
    {i j k : Fin m} (hij : i < j) (hjk : j < k)
    {O z : ℝ²}
    (hOA : O ∈ A) (hOOff : O ∉ Finset.univ.image L.points)
    (hzA : z ∈ A) (hzOff : z ∉ Finset.univ.image L.points)
    (hOeq : dist O (L.points i) = dist O (L.points k))
    (hjEq : dist (L.points j) (L.points i) =
      dist (L.points j) (L.points k))
    (hzEq : dist (L.points j) z = dist (L.points j) (L.points i)) :
    dist O z < dist O (L.points i) := by
  have hjArea :
      0 < signedArea2 (L.points i) (L.points k) (L.points j) :=
    (Hord.subchord_open_side_iff_A (lt_trans hij hjk) (Packet.mem_A j)).2
      ⟨j, hij, hjk, rfl⟩
  have hOProd :=
    CGN.signedArea_product_neg_of_between_and_off_cap
      hconv Packet Hord hij hjk hOA hOOff
  have hzProd :=
    CGN.signedArea_product_neg_of_between_and_off_cap
      hconv Packet Hord hij hjk hzA hzOff
  have hcycO :
      signedArea2 O (L.points i) (L.points k) =
        signedArea2 (L.points i) (L.points k) O := by
    unfold signedArea2
    ring
  have hcycJ :
      signedArea2 (L.points j) (L.points i) (L.points k) =
        signedArea2 (L.points i) (L.points k) (L.points j) := by
    unfold signedArea2
    ring
  have hcycZ :
      signedArea2 z (L.points i) (L.points k) =
        signedArea2 (L.points i) (L.points k) z := by
    unfold signedArea2
    ring
  rw [hcycO, hcycJ] at hOProd
  rw [hcycZ, hcycJ] at hzProd
  have hOArea : signedArea2 (L.points i) (L.points k) O < 0 := by
    rcases (mul_neg_iff.mp hOProd) with h | h
    · exact (not_lt_of_ge (le_of_lt hjArea) h.2).elim
    · exact h.1
  have hzArea : signedArea2 (L.points i) (L.points k) z < 0 := by
    rcases (mul_neg_iff.mp hzProd) with h | h
    · exact (not_lt_of_ge (le_of_lt hjArea) h.2).elim
    · exact h.1
  exact dist_lt_of_two_bisectors_of_area_signs
    (L.injective.ne (ne_of_lt (lt_trans hij hjk)))
    hOeq hjEq hzEq hjArea hOArea hzArea

/-- A carrier point on the circle through a selected first-cap interior pair
lies strictly inside the first-apex circle when it is outside the closed first
cap.  This is the source-facing circle-power bridge used by the physical
exact-five fresh-row branch. -/
theorem dist_firstApex_lt_of_interiorPair_circlePoint_outsideCap
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {q w c z : ℝ²}
    (hq : q ∈ SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1)
    (hqw : q ≠ w)
    (hcA : c ∈ D.A) (hcApex : c ≠ S.oppApex1)
    (hcEq : dist c q = dist c w)
    (hzA : z ∈ D.A) (hzOff : z ∉ S.capByIndex S.oppIndex1)
    (hzEq : dist c z = dist c q) :
    dist S.oppApex1 z < r := by
  classical
  have hcInterior :=
    FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior
      hq hw hqw hcA hcApex hcEq
  have hqCap : q ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      (Finset.mem_inter.mp hq).2
  have hwCap : w ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      (Finset.mem_inter.mp hw).2
  have hcCap : c ∈ S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hcInterior
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex1 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hqImage : q ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hqCap
  have hwImage : w ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hwCap
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  rcases Finset.mem_image.mp hqImage with ⟨iq, _hiqMem, hiq⟩
  rcases Finset.mem_image.mp hwImage with ⟨iw, _hiwMem, hiw⟩
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hicMem, hic⟩
  have hiq_ne_iw : iq ≠ iw := by
    intro h
    apply hqw
    calc
      q = L.points iq := hiq.symm
      _ = L.points iw := by rw [h]
      _ = w := hiw
  have hc_ne_q : c ≠ q := by
    intro h
    apply hqw
    apply dist_eq_zero.mp
    have hcEq' := hcEq
    rw [h, dist_self] at hcEq'
    exact hcEq'.symm
  have hc_ne_w : c ≠ w := by
    intro h
    apply hqw
    apply dist_eq_zero.mp
    have hcEq' := hcEq
    rw [h, dist_self] at hcEq'
    simpa [dist_comm] using hcEq'
  have hic_ne_iq : ic ≠ iq := by
    intro h
    apply hc_ne_q
    calc
      c = L.points ic := hic.symm
      _ = L.points iq := by rw [h]
      _ = q := hiq
  have hic_ne_iw : ic ≠ iw := by
    intro h
    apply hc_ne_w
    calc
      c = L.points ic := hic.symm
      _ = L.points iw := by rw [h]
      _ = w := hiw
  have happA : S.oppApex1 ∈ D.A := by
    rcases hs : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex1, hs] using S.triangle.v2_mem
    · simpa [SurplusCapPacket.oppApex1, hs] using S.triangle.v3_mem
    · simpa [SurplusCapPacket.oppApex1, hs] using S.triangle.v1_mem
  have happOffCap : S.oppApex1 ∉ S.capByIndex S.oppIndex1 := by
    rcases hs : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i
    · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
        SurplusCapPacket.capByIndex, hs] using S.partition.v2_notin_C2
    · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
        SurplusCapPacket.capByIndex, hs] using S.partition.v3_notin_C3
    · simpa [SurplusCapPacket.oppApex1, SurplusCapPacket.oppIndex1,
        SurplusCapPacket.capByIndex, hs] using S.partition.v1_notin_C1
  have happOff : S.oppApex1 ∉ Finset.univ.image L.points := by
    simpa [hcap] using happOffCap
  have hzImageOff : z ∉ Finset.univ.image L.points := by
    simpa [hcap] using hzOff
  have hOeq : dist S.oppApex1 q = dist S.oppApex1 w :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hq).1).2.trans
      (mem_selectedClass.mp (Finset.mem_inter.mp hw).1).2.symm
  have hqRadius : dist S.oppApex1 q = r :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hq).1).2
  have hwRadius : dist S.oppApex1 w = r :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hw).1).2
  rcases lt_or_gt_of_ne hiq_ne_iw with hiqiw | hwiq
  · have hbetween :=
      CGN.index_strictly_between_of_equidistant
        Packet Hside Hord hiqiw hic_ne_iq hic_ne_iw
        (by simpa [hic, hiq, hiw] using hcEq)
    have hdrop := dist_lt_of_ordered_cap_bisectors_and_off_cap
      D.convex Packet Hord hbetween.1 hbetween.2
      happA happOff hzA hzImageOff
      (by simpa [hiq, hiw] using hOeq)
      (by simpa [hic, hiq, hiw] using hcEq)
      (by simpa [hic, hiq] using hzEq)
    calc
      dist S.oppApex1 z < dist S.oppApex1 (L.points iq) := hdrop
      _ = r := by simpa [hiq] using hqRadius
  · have hbetween :=
      CGN.index_strictly_between_of_equidistant
        Packet Hside Hord hwiq hic_ne_iw hic_ne_iq
        (by simpa [hic, hiq, hiw] using hcEq.symm)
    have hdrop := dist_lt_of_ordered_cap_bisectors_and_off_cap
      D.convex Packet Hord hbetween.1 hbetween.2
      happA happOff hzA hzImageOff
      (by simpa [hiq, hiw] using hOeq.symm)
      (by simpa [hic, hiq, hiw] using hcEq.symm)
      (by simpa [hic, hiw] using hzEq.trans hcEq)
    calc
      dist S.oppApex1 z < dist S.oppApex1 (L.points iw) := hdrop
      _ = r := by simpa [hiw] using hwRadius

end FirstApexInteriorPairCirclePower
end Problem97

-- AUTO_AXIOM_CHECK_MARKER_DO_NOT_COMMIT
#print axioms Problem97.FirstApexInteriorPairCirclePower.dist_lt_of_two_bisectors_of_area_signs
