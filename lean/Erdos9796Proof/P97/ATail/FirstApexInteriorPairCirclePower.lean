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

/-- If two circle centers lie on a chord's perpendicular bisector, the chord
separates the centers, and the first-center chord angle is acute, then the
first center lies strictly outside the second circle. -/
theorem circleRadius_lt_dist_otherCenter_of_two_bisectors
    {O c q w : ℝ²}
    (hqw : q ≠ w)
    (hOeq : dist O q = dist O w)
    (hcEq : dist c q = dist c w)
    (hacute : 0 < inner ℝ (q - O) (w - O))
    (hcArea : 0 < signedArea2 q w c)
    (hOArea : signedArea2 q w O < 0) :
    dist c q < dist c O := by
  rw [signedArea2_eq_stdOrientation_areaForm] at hcArea hOArea
  have horth : inner ℝ (c - O) (w - q) = 0 := by
    simpa only [vsub_eq_sub] using
      (EuclideanGeometry.inner_vsub_vsub_of_dist_eq_of_dist_eq
        (c₁ := O) (c₂ := c) (p₁ := q) (p₂ := w)
        (by simpa [dist_comm] using hOeq)
        (by simpa [dist_comm] using hcEq))
  have horth' : inner ℝ (w - q) (c - O) = 0 := by
    simpa [real_inner_comm] using horth
  have hareaY :
      0 < stdOrientation.areaForm (w - q) (q - O) := by
    have hrewrite :
        stdOrientation.areaForm (w - q) (O - q) =
          -stdOrientation.areaForm (w - q) (q - O) := by
      rw [show O - q = -(q - O) by abel]
      exact LinearMap.map_neg _ _
    rw [hrewrite] at hOArea
    linarith
  have hareaXeq :
      stdOrientation.areaForm (w - q) (c - O) =
        stdOrientation.areaForm (w - q) (c - q) +
          stdOrientation.areaForm (w - q) (q - O) := by
    rw [show c - O = (c - q) + (q - O) by abel]
    exact LinearMap.map_add _ _ _
  have hareaXgt :
      stdOrientation.areaForm (w - q) (q - O) <
        stdOrientation.areaForm (w - q) (c - O) := by
    rw [hareaXeq]
    linarith
  have hareaProdGt :
      stdOrientation.areaForm (w - q) (q - O) ^ 2 <
        stdOrientation.areaForm (w - q) (c - O) *
          stdOrientation.areaForm (w - q) (q - O) := by
    nlinarith [mul_pos (sub_pos.mpr hareaXgt) hareaY]
  have hgramXY :=
    Orientation.inner_mul_inner_add_areaForm_mul_areaForm
      stdOrientation (w - q) (c - O) (q - O)
  rw [horth', zero_mul, zero_add] at hgramXY
  have hgramYY :=
    Orientation.inner_mul_inner_add_areaForm_mul_areaForm
      stdOrientation (w - q) (q - O) (q - O)
  rw [real_inner_self_eq_norm_sq] at hgramYY
  have hnormD : 0 < ‖w - q‖ ^ 2 :=
    sq_pos_of_pos (norm_pos_iff.mpr (sub_ne_zero.mpr hqw.symm))
  have hOeqSq : ‖q - O‖ ^ 2 = ‖w - O‖ ^ 2 := by
    have := congrArg (fun x : ℝ => x ^ 2) hOeq
    simpa [dist_eq_norm, norm_sub_rev] using this
  have hwDecomp : w - O = (q - O) + (w - q) := by abel
  rw [hwDecomp, norm_add_sq_real] at hOeqSq
  have ht :
      2 * inner ℝ (w - q) (q - O) + ‖w - q‖ ^ 2 = 0 := by
    rw [real_inner_comm]
    nlinarith
  have hacute' :
      0 < ‖q - O‖ ^ 2 + inner ℝ (q - O) (w - q) := by
    rw [hwDecomp, inner_add_right, real_inner_self_eq_norm_sq] at hacute
    exact hacute
  have hacute'' : ‖w - q‖ ^ 2 < 2 * ‖q - O‖ ^ 2 := by
    rw [real_inner_comm] at hacute'
    nlinarith
  have hkey :
      ‖q - O‖ ^ 2 < 2 * inner ℝ (c - O) (q - O) := by
    nlinarith [sq_nonneg (inner ℝ (w - q) (q - O)),
      mul_pos hnormD (sub_pos.mpr hacute'')]
  have hsq : ‖c - q‖ ^ 2 < ‖c - O‖ ^ 2 := by
    rw [show c - q = (c - O) - (q - O) by abel, norm_sub_sq_real]
    nlinarith
  simp only [dist_eq_norm]
  nlinarith [norm_nonneg (c - q), norm_nonneg (c - O),
    sq_nonneg (‖c - q‖ - ‖c - O‖)]

/-- At a nonacute middle vertex, a point strictly beyond one ray is farther
from the other endpoint than the middle vertex is. -/
theorem dist_center_middle_lt_endpoint_of_inner_nonpos
    {a b c : ℝ²}
    (hab : a ≠ b)
    (hinner : inner ℝ (a - b) (c - b) ≤ 0) :
    dist c b < dist c a := by
  have hpol :
      2 * inner ℝ (a - b) (c - b) =
        dist a b ^ 2 + dist c b ^ 2 - dist c a ^ 2 := by
    rw [real_inner_eq_norm_mul_self_add_norm_mul_self_sub_norm_sub_mul_self_div_two]
    simp only [dist_eq_norm]
    rw [show (a - b) - (c - b) = a - c by abel]
    rw [norm_sub_rev c b, norm_sub_rev c a]
    ring
  have habpos : 0 < dist a b := dist_pos.mpr hab
  have hsq : dist c b ^ 2 < dist c a ^ 2 := by
    nlinarith [sq_pos_of_pos habpos]
  nlinarith [dist_nonneg (x := c) (y := b), dist_nonneg (x := c) (y := a),
    sq_nonneg (dist c b - dist c a)]

/-- In a strict ordered minor cap, the middle vertex is strictly closer to
either outer vertex than the two outer vertices are to one another. -/
theorem middle_dist_lt_both_endpoints_of_ordered_cap
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (Packet : CGN.MecCapPacket A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder A L)
    {i j k : Fin m} (hij : i < j) (hjk : j < k) :
    dist (L.points k) (L.points j) < dist (L.points k) (L.points i) ∧
      dist (L.points i) (L.points j) < dist (L.points i) (L.points k) := by
  rcases CGN.CGN6norm_minorCapChainModel_of_mecCapPacket Packet Hside Hord with
    ⟨T, hT, tau, ⟨M⟩⟩
  have hinnerT := CGN.CGN6b_nonacute_of_minorCapChainModel M hij hjk
  have hleftT :
      dist (T (L.points k)) (T (L.points j)) <
        dist (T (L.points k)) (T (L.points i)) := by
    apply dist_center_middle_lt_endpoint_of_inner_nonpos
      (hT.ne (L.injective.ne (ne_of_lt hij)))
    simpa only [CGN.OrderedCap.map_points, real_inner_comm] using hinnerT
  have hrightT :
      dist (T (L.points i)) (T (L.points j)) <
        dist (T (L.points i)) (T (L.points k)) := by
    apply dist_center_middle_lt_endpoint_of_inner_nonpos
      (hT.ne (L.injective.ne (ne_of_gt hjk)))
    simpa only [CGN.OrderedCap.map_points, real_inner_comm] using hinnerT
  rw [tau.dist_image, tau.dist_image] at hleftT hrightT
  constructor <;> nlinarith [tau.scale_pos]

/-- Ordered-cap specialization of the preceding first-center exclusion: the
outside carrier center lies strictly outside the circle centered at the
strictly-between cap vertex. -/
theorem circleRadius_lt_dist_offCapCenter_of_ordered_cap
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (hconv : ConvexIndep A)
    (Packet : CGN.MecCapPacket A L)
    (Hord : CGN.StrictCapOrder A L)
    {i j k : Fin m} (hij : i < j) (hjk : j < k)
    {O : ℝ²} (hOA : O ∈ A) (hOOff : O ∉ Finset.univ.image L.points)
    (hOeq : dist O (L.points i) = dist O (L.points k))
    (hjEq : dist (L.points j) (L.points i) =
      dist (L.points j) (L.points k))
    (hacute : 0 < inner ℝ (L.points i - O) (L.points k - O)) :
    dist (L.points j) (L.points i) < dist (L.points j) O := by
  have hjArea :
      0 < signedArea2 (L.points i) (L.points k) (L.points j) :=
    (Hord.subchord_open_side_iff_A (lt_trans hij hjk) (Packet.mem_A j)).2
      ⟨j, hij, hjk, rfl⟩
  have hOProd :=
    CGN.signedArea_product_neg_of_between_and_off_cap
      hconv Packet Hord hij hjk hOA hOOff
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
  rw [hcycO, hcycJ] at hOProd
  have hOArea : signedArea2 (L.points i) (L.points k) O < 0 := by
    rcases (mul_neg_iff.mp hOProd) with h | h
    · exact (not_lt_of_ge (le_of_lt hjArea) h.2).elim
    · exact h.1
  exact circleRadius_lt_dist_otherCenter_of_two_bisectors
    (L.injective.ne (ne_of_lt (lt_trans hij hjk)))
    hOeq hjEq hacute hjArea hOArea

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

/-- The circle centered at an interior bisector of a selected first-cap pair
places all three vertices of the indexed supporting triangle strictly outside
the circle through that pair. -/
theorem interiorPair_circleRadius_lt_dist_triangleByIndex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {q w c : ℝ²}
    (hq : q ∈ SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1)
    (hqw : q ≠ w)
    (hcA : c ∈ D.A) (hcApex : c ≠ S.oppApex1)
    (hcEq : dist c q = dist c w) :
    dist c q < dist c (S.triangleByIndex S.oppIndex1).v1 ∧
      dist c q < dist c (S.triangleByIndex S.oppIndex1).v2 ∧
      dist c q < dist c (S.triangleByIndex S.oppIndex1).v3 := by
  classical
  have hqI := (Finset.mem_inter.mp hq).2
  have hwI := (Finset.mem_inter.mp hw).2
  have hcI :=
    FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior
      hq hw hqw hcA hcApex hcEq
  have hqCap := S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hqI
  have hwCap := S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hwI
  have hcCap := S.capInteriorByIndex_subset_capByIndex S.oppIndex1 hcI
  rcases S.capByIndex_cgn4g_capData_oriented D.convex S.oppIndex1 with
    ⟨m, L, Packet, Hside, Hord, hcap, horient⟩
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
    have he := hcEq
    rw [h, dist_self] at he
    exact he.symm
  have hc_ne_w : c ≠ w := by
    intro h
    apply hqw
    apply dist_eq_zero.mp
    have he := hcEq
    rw [h, dist_self] at he
    simpa [dist_comm] using he
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
  have hqNeFirst : q ≠ L.points (CGN.firstIndex Packet.hm) := by
    rcases horient with h | h
    · simpa [h.1] using S.capInteriorByIndex_ne_triangleByIndex_v2 hqI
    · simpa [h.1] using S.capInteriorByIndex_ne_triangleByIndex_v3 hqI
  have hwNeFirst : w ≠ L.points (CGN.firstIndex Packet.hm) := by
    rcases horient with h | h
    · simpa [h.1] using S.capInteriorByIndex_ne_triangleByIndex_v2 hwI
    · simpa [h.1] using S.capInteriorByIndex_ne_triangleByIndex_v3 hwI
  have hqNeLast : q ≠ L.points (CGN.lastIndex Packet.hm) := by
    rcases horient with h | h
    · simpa [h.2] using S.capInteriorByIndex_ne_triangleByIndex_v3 hqI
    · simpa [h.2] using S.capInteriorByIndex_ne_triangleByIndex_v2 hqI
  have hwNeLast : w ≠ L.points (CGN.lastIndex Packet.hm) := by
    rcases horient with h | h
    · simpa [h.2] using S.capInteriorByIndex_ne_triangleByIndex_v3 hwI
    · simpa [h.2] using S.capInteriorByIndex_ne_triangleByIndex_v2 hwI
  have hfirst_ne_iq : CGN.firstIndex Packet.hm ≠ iq := by
    intro h
    apply hqNeFirst
    calc
      q = L.points iq := hiq.symm
      _ = L.points (CGN.firstIndex Packet.hm) := by rw [h]
  have hfirst_ne_iw : CGN.firstIndex Packet.hm ≠ iw := by
    intro h
    apply hwNeFirst
    calc
      w = L.points iw := hiw.symm
      _ = L.points (CGN.firstIndex Packet.hm) := by rw [h]
  have hiq_ne_last : iq ≠ CGN.lastIndex Packet.hm := by
    intro h
    apply hqNeLast
    calc
      q = L.points iq := hiq.symm
      _ = L.points (CGN.lastIndex Packet.hm) := by rw [h]
  have hiw_ne_last : iw ≠ CGN.lastIndex Packet.hm := by
    intro h
    apply hwNeLast
    calc
      w = L.points iw := hiw.symm
      _ = L.points (CGN.lastIndex Packet.hm) := by rw [h]
  have hfirst_lt_iq : CGN.firstIndex Packet.hm < iq := by
    apply lt_of_le_of_ne
    · change (CGN.firstIndex Packet.hm).val ≤ iq.val
      simp
    · exact hfirst_ne_iq
  have hfirst_lt_iw : CGN.firstIndex Packet.hm < iw := by
    apply lt_of_le_of_ne
    · change (CGN.firstIndex Packet.hm).val ≤ iw.val
      simp
    · exact hfirst_ne_iw
  have hiq_lt_last : iq < CGN.lastIndex Packet.hm := by
    apply lt_of_le_of_ne
    · change iq.val ≤ (CGN.lastIndex Packet.hm).val
      simp only [CGN.lastIndex_val]
      omega
    · exact hiq_ne_last
  have hiw_lt_last : iw < CGN.lastIndex Packet.hm := by
    apply lt_of_le_of_ne
    · change iw.val ≤ (CGN.lastIndex Packet.hm).val
      simp only [CGN.lastIndex_val]
      omega
    · exact hiw_ne_last
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
  have hv1 :
      (S.triangleByIndex S.oppIndex1).v1 = S.oppApex1 := by
    rcases hs : S.surplusIdx with ⟨i, hi3⟩
    interval_cases i <;>
      simp [SurplusCapPacket.triangleByIndex, SurplusCapPacket.oppIndex1,
        SurplusCapPacket.oppApex1, hs]
  have hOeq : dist S.oppApex1 q = dist S.oppApex1 w :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hq).1).2.trans
      (mem_selectedClass.mp (Finset.mem_inter.mp hw).1).2.symm
  have hacute :
      0 < inner ℝ (q - S.oppApex1) (w - S.oppApex1) :=
    FirstApexInteriorPairGeometry.inner_pos_of_oppApex1_capInterior_pair
      hqI hwI
  rcases lt_or_gt_of_ne hiq_ne_iw with hiqiw | hwiq
  · have hbetween := CGN.index_strictly_between_of_equidistant
      Packet Hside Hord hiqiw hic_ne_iq hic_ne_iw
      (by simpa [hic, hiq, hiw] using hcEq)
    have hapex := circleRadius_lt_dist_offCapCenter_of_ordered_cap
      D.convex Packet Hord hbetween.1 hbetween.2 happA happOff
      (by simpa [hiq, hiw] using hOeq)
      (by simpa [hic, hiq, hiw] using hcEq)
      (by simpa [hiq, hiw] using hacute)
    have hapex' :
        dist c q < dist c (S.triangleByIndex S.oppIndex1).v1 := by
      simpa [hic, hiq, hv1] using hapex
    have hleft := (middle_dist_lt_both_endpoints_of_ordered_cap
      Packet Hside Hord hfirst_lt_iq hbetween.1).1
    have hright := (middle_dist_lt_both_endpoints_of_ordered_cap
      Packet Hside Hord hbetween.2 hiw_lt_last).2
    have hleft' :
        dist c q < dist c (L.points (CGN.firstIndex Packet.hm)) := by
      simpa [hic, hiq, dist_comm] using hleft
    have hright' :
        dist c q < dist c (L.points (CGN.lastIndex Packet.hm)) := by
      rw [hcEq]
      simpa [hic, hiw, dist_comm] using hright
    rcases horient with h | h
    · exact ⟨hapex', by simpa [h.1] using hleft',
        by simpa [h.2] using hright'⟩
    · exact ⟨hapex', by simpa [h.2] using hright',
        by simpa [h.1] using hleft'⟩
  · have hbetween := CGN.index_strictly_between_of_equidistant
      Packet Hside Hord hwiq hic_ne_iw hic_ne_iq
      (by simpa [hic, hiq, hiw] using hcEq.symm)
    have hacuteRev :
        0 < inner ℝ (w - S.oppApex1) (q - S.oppApex1) := by
      simpa [real_inner_comm] using hacute
    have hapex := circleRadius_lt_dist_offCapCenter_of_ordered_cap
      D.convex Packet Hord hbetween.1 hbetween.2 happA happOff
      (by simpa [hiq, hiw] using hOeq.symm)
      (by simpa [hic, hiq, hiw] using hcEq.symm)
      (by simpa [hiq, hiw] using hacuteRev)
    have hapex' :
        dist c q < dist c (S.triangleByIndex S.oppIndex1).v1 := by
      rw [hcEq]
      simpa [hic, hiw, hv1] using hapex
    have hleft := (middle_dist_lt_both_endpoints_of_ordered_cap
      Packet Hside Hord hfirst_lt_iw hbetween.1).1
    have hright := (middle_dist_lt_both_endpoints_of_ordered_cap
      Packet Hside Hord hbetween.2 hiq_lt_last).2
    have hleft' :
        dist c q < dist c (L.points (CGN.firstIndex Packet.hm)) := by
      rw [hcEq]
      simpa [hic, hiw, dist_comm] using hleft
    have hright' :
        dist c q < dist c (L.points (CGN.lastIndex Packet.hm)) := by
      simpa [hic, hiq, dist_comm] using hright
    rcases horient with h | h
    · exact ⟨hapex', by simpa [h.1] using hleft',
        by simpa [h.2] using hright'⟩
    · exact ⟨hapex', by simpa [h.2] using hright',
        by simpa [h.1] using hleft'⟩

/-- The same exclusion stated for the packet's original supporting Moser
triangle rather than its first-cap reindexing. -/
theorem interiorPair_circleRadius_lt_dist_supportTriangle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {q w c : ℝ²}
    (hq : q ∈ SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1)
    (hw : w ∈ SelectedClass D.A S.oppApex1 r ∩
      S.capInteriorByIndex S.oppIndex1)
    (hqw : q ≠ w)
    (hcA : c ∈ D.A) (hcApex : c ≠ S.oppApex1)
    (hcEq : dist c q = dist c w) :
    dist c q < dist c S.triangle.v1 ∧
      dist c q < dist c S.triangle.v2 ∧
      dist c q < dist c S.triangle.v3 := by
  have hindexed := interiorPair_circleRadius_lt_dist_triangleByIndex
    hq hw hqw hcA hcApex hcEq
  rcases hs : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · have h := hindexed
    simp only [SurplusCapPacket.triangleByIndex, SurplusCapPacket.oppIndex1,
      hs] at h
    exact ⟨h.2.2, h.1, h.2.1⟩
  · have h := hindexed
    simp only [SurplusCapPacket.triangleByIndex, SurplusCapPacket.oppIndex1,
      hs] at h
    exact ⟨h.2.1, h.2.2, h.1⟩
  · simpa [SurplusCapPacket.triangleByIndex, SurplusCapPacket.oppIndex1,
      hs] using hindexed

end FirstApexInteriorPairCirclePower
end Problem97
