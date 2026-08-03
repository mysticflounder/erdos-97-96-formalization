import Erdos9796Proof.P97.Census554.EqualityCore

open scoped EuclideanGeometry

namespace Problem97.CrossedArmSevenPointEuclideanObstruction

private def q1 (bs bu bw : ℂ) : ℂ :=
  bs ^ 3 - 2 * bs ^ 2 * bu - bs ^ 2 * bw + bs * bu ^ 2 + bs * bu * bw +
    bs * bw ^ 2 - bu ^ 2 * bw

private def e2 (br bs bu bv bw : ℂ) : ℂ :=
  br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
    br ^ 2 * bs * bu * bv - br * bs ^ 3 * bu + br * bs ^ 2 * bu ^ 2 +
    br * bs ^ 2 * bu * bv - br * bs * bu ^ 2 * bv - br * bs * bu ^ 2 * bw +
    br * bs * bu * bw ^ 2 + br * bs * bv ^ 2 * bw + br * bu ^ 2 * bv * bw -
    br * bu * bv ^ 2 * bw - br * bu * bv * bw ^ 2 - bs * bv ^ 2 * bw ^ 2 +
    bu * bv ^ 2 * bw ^ 2

private def e5 (br bs bu bv : ℂ) : ℂ :=
  br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
    br ^ 2 * bs * bu * bv + br ^ 2 * bs * bu - br ^ 2 * bu * bv -
    br * bs ^ 3 + br * bs ^ 2 * bu + br * bs ^ 2 * bv - br * bs * bu ^ 2 -
    br * bs * bu * bv + br * bu ^ 2 * bv + bs * bu * bv ^ 2 - bs * bv ^ 2 -
    bu ^ 2 * bv ^ 2 + bu * bv ^ 2

private def e7 (bs bu bv : ℂ) : ℂ :=
  bs ^ 3 * bu - bs ^ 3 - bs ^ 2 * bu ^ 2 - bs ^ 2 * bu * bv + bs ^ 2 * bu +
    bs ^ 2 * bv + bs * bu ^ 2 * bv + bs * bu * bv - bs * bu - bs * bv ^ 2 -
    bu ^ 2 * bv + bu * bv

private def e8 (bs bv bw : ℂ) : ℂ :=
  bs ^ 2 * bv * bw - bs ^ 2 * bw ^ 2 + bs ^ 2 * bw - bs ^ 2 -
    bs * bv ^ 2 * bw + bs * bv * bw ^ 2 - bs * bv * bw + bs * bv +
    bv ^ 2 * bw - bv * bw

private def e9 (br bs bv : ℂ) : ℂ :=
  br ^ 2 * bv + br * bs ^ 2 * bv - br * bs ^ 2 - br * bs * bv ^ 2 +
    br * bs * bv - br * bv ^ 2 - br * bv + bv ^ 3

set_option maxHeartbeats 4000000 in
private theorem brEqBwB3
    {bs bu bv bw : ℂ}
    (p2 : e2 bw bs bu bv bw = 0) (p5 : e5 bw bs bu bv = 0)
    (p7 : e7 bs bu bv = 0) (p8 : e8 bs bv bw = 0) (p9 : e9 bw bs bv = 0) :
    bs * (bv - bu) * (bw - 1) * (bw - bv) = 0 := by
  simp only [e2, e5, e7, e8, e9] at *
  grobner (ringSteps := 100000)

#check brEqBwB3

set_option maxHeartbeats 4000000 in
private theorem brEqBwB17
    {bs bu bv bw : ℂ}
    (p2 : e2 bw bs bu bv bw = 0) (p5 : e5 bw bs bu bv = 0)
    (p7 : e7 bs bu bv = 0) (p8 : e8 bs bv bw = 0) (p9 : e9 bw bs bv = 0) :
    bs * bv * (bw ^ 3 - bv ^ 2 + 2 * bv * bw - 3 * bw ^ 2 + bw) = 0 := by
  simp only [e2, e5, e7, e8, e9] at *
  grobner (ringSteps := 100000)

#check brEqBwB17

set_option maxHeartbeats 4000000 in
private theorem brEqBwBuEqBvB24
    {bs bv bw : ℂ}
    (p2 : e2 bw bs bv bv bw = 0) (p5 : e5 bw bs bv bv = 0)
    (p7 : e7 bs bv bv = 0) (p8 : e8 bs bv bw = 0) (p9 : e9 bw bs bv = 0) :
    -bv ^ 2 * (bw - 1) * (bw - bv ^ 2) = 0 := by
  simp only [e2, e5, e7, e8, e9] at *
  grobner (ringSteps := 100000)

#check brEqBwBuEqBvB24

set_option maxHeartbeats 4000000 in
private theorem q1EqZeroG3
    {br bs bu bv bw : ℂ}
    (hq : q1 bs bu bw = 0) (p2 : e2 br bs bu bv bw = 0) (p5 : e5 br bs bu bv = 0)
    (p7 : e7 bs bu bv = 0) (p8 : e8 bs bv bw = 0) (p9 : e9 br bs bv = 0) :
    -(bu - bs) * (br - bv) * bv * bw = 0 := by
  simp only [q1, e2, e5, e7, e8, e9] at *
  grobner (ringSteps := 100000)

#check q1EqZeroG3

set_option maxHeartbeats 4000000 in
private theorem q1EqZeroG7
    {br bs bu bv bw : ℂ}
    (hq : q1 bs bu bw = 0) (p2 : e2 br bs bu bv bw = 0) (p5 : e5 br bs bu bv = 0)
    (p7 : e7 bs bu bv = 0) (p8 : e8 bs bv bw = 0) (p9 : e9 br bs bv = 0) :
    bs * bv * (br ^ 2 - br * bv + bv ^ 2 - br) = 0 := by
  simp only [q1, e2, e5, e7, e8, e9] at *
  grobner (ringSteps := 100000)

#check q1EqZeroG7

set_option maxHeartbeats 4000000 in
private theorem q1EqZeroG39
    {br bs bu bv bw : ℂ}
    (hq : q1 bs bu bw = 0) (p2 : e2 br bs bu bv bw = 0) (p5 : e5 br bs bu bv = 0)
    (p7 : e7 bs bu bv = 0) (p8 : e8 bs bv bw = 0) (p9 : e9 br bs bv = 0) :
    br * (br - 1) * bw * (bu ^ 2 - bs * bw) = 0 := by
  simp only [q1, e2, e5, e7, e8, e9] at *
  grobner (ringSteps := 100000)

#check q1EqZeroG39

set_option maxRecDepth 10000 in
set_option maxHeartbeats 4000000 in
theorem determinantRelationsIncompatiblePrototype
    {br bs bu bv bw : ℂ}
    (p1 : bv * (br - bw) *
      (bs ^ 3 - 2 * bs ^ 2 * bu - bs ^ 2 * bw + bs * bu ^ 2 + bs * bu * bw +
        bs * bw ^ 2 - bu ^ 2 * bw) = 0)
    (p2 : br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
      br ^ 2 * bs * bu * bv - br * bs ^ 3 * bu + br * bs ^ 2 * bu ^ 2 +
      br * bs ^ 2 * bu * bv - br * bs * bu ^ 2 * bv - br * bs * bu ^ 2 * bw +
      br * bs * bu * bw ^ 2 + br * bs * bv ^ 2 * bw + br * bu ^ 2 * bv * bw -
      br * bu * bv ^ 2 * bw - br * bu * bv * bw ^ 2 - bs * bv ^ 2 * bw ^ 2 +
      bu * bv ^ 2 * bw ^ 2 = 0)
    (p5 : br ^ 2 * bs ^ 3 - br ^ 2 * bs ^ 2 * bu - br ^ 2 * bs ^ 2 * bv +
      br ^ 2 * bs * bu * bv + br ^ 2 * bs * bu - br ^ 2 * bu * bv -
      br * bs ^ 3 + br * bs ^ 2 * bu + br * bs ^ 2 * bv - br * bs * bu ^ 2 -
      br * bs * bu * bv + br * bu ^ 2 * bv + bs * bu * bv ^ 2 - bs * bv ^ 2 -
      bu ^ 2 * bv ^ 2 + bu * bv ^ 2 = 0)
    (p7 : br *
      (bs ^ 3 * bu - bs ^ 3 - bs ^ 2 * bu ^ 2 - bs ^ 2 * bu * bv + bs ^ 2 * bu +
        bs ^ 2 * bv + bs * bu ^ 2 * bv + bs * bu * bv - bs * bu - bs * bv ^ 2 -
        bu ^ 2 * bv + bu * bv) = 0)
    (p8 : -br * (bv - 1) *
      (bs ^ 2 * bv * bw - bs ^ 2 * bw ^ 2 + bs ^ 2 * bw - bs ^ 2 -
        bs * bv ^ 2 * bw + bs * bv * bw ^ 2 - bs * bv * bw + bs * bv +
        bv ^ 2 * bw - bv * bw) = 0)
    (p9 : (bv - 1) *
      (br ^ 2 * bv + br * bs ^ 2 * bv - br * bs ^ 2 - br * bs * bv ^ 2 +
        br * bs * bv - br * bv ^ 2 - br * bv + bv ^ 3) = 0)
    (hbr : br ≠ 0) (hbs : bs ≠ 0) (hbw : bw ≠ 0) (hbv : bv - 1 ≠ 0)
    {zs : ℂ} (f3 : -bs * zs + 1 = 0) (hconj : zs = starRingEnd ℂ bs) : False := by
  change bv * (br - bw) * q1 bs bu bw = 0 at p1
  change e2 br bs bu bv bw = 0 at p2
  change e5 br bs bu bv = 0 at p5
  change br * e7 bs bu bv = 0 at p7
  change -br * (bv - 1) * e8 bs bv bw = 0 at p8
  change (bv - 1) * e9 br bs bv = 0 at p9
  have E7 : e7 bs bu bv = 0 := by
    exact (mul_eq_zero.mp p7).resolve_left hbr
  have E8 : e8 bs bv bw = 0 := by
    have hprefix : -br * (bv - 1) ≠ 0 := mul_ne_zero (neg_ne_zero.mpr hbr) hbv
    exact (mul_eq_zero.mp p8).resolve_left hprefix
  have E9 : e9 br bs bv = 0 := by
    exact (mul_eq_zero.mp p9).resolve_left hbv
  rcases mul_eq_zero.mp p1 with hpref | hq
  · rcases mul_eq_zero.mp hpref with hbvZero | hbrbw
    · subst bv
      ring_nf at E9
      exact (mul_ne_zero hbr (pow_ne_zero 2 hbs)) E9
    · have hbr_eq_bw : br = bw := sub_eq_zero.mp hbrbw
      subst br
      have hbvZero : bv ≠ 0 := by
        intro hv
        subst bv
        ring_nf at E9
        exact (mul_ne_zero hbw (pow_ne_zero 2 hbs)) E9
      have B3 : bs * (bv - bu) * (bw - 1) * (bw - bv) = 0 := by
        exact brEqBwB3 p2 p5 E7 E8 E9
      let h := bw ^ 3 - bv ^ 2 + 2 * bv * bw - 3 * bw ^ 2 + bw
      have B17 : bs * bv * h = 0 := by
        exact brEqBwB17 p2 p5 E7 E8 E9
      have hh : h = 0 :=
        (mul_eq_zero.mp B17).resolve_left (mul_ne_zero hbs hbvZero)
      have hbwOne : bw ≠ 1 := by
        intro hw
        subst bw
        dsimp [h] at hh
        have hz : (bv - 1) ^ 2 = 0 := by linear_combination -hh
        exact (pow_ne_zero 2 hbv) hz
      have hbwBv : bw ≠ bv := by
        intro hw
        subst bw
        dsimp [h] at hh
        have hz : bv * (bv - 1) ^ 2 = 0 := by linear_combination hh
        exact (mul_ne_zero hbvZero (pow_ne_zero 2 hbv)) hz
      have hbu : bu = bv := by
        by_contra hne
        exact (mul_ne_zero
          (mul_ne_zero (mul_ne_zero hbs (sub_ne_zero.mpr (Ne.symm hne)))
            (sub_ne_zero.mpr hbwOne))
          (sub_ne_zero.mpr hbwBv)) B3
      have B24 : -bv ^ 2 * (bw - 1) * (bw - bv ^ 2) = 0 := by
        subst bu
        exact brEqBwBuEqBvB24 p2 p5 E7 E8 E9
      have hbwBvSq : bw = bv ^ 2 := by
        have hprefix : -bv ^ 2 * (bw - 1) ≠ 0 :=
          mul_ne_zero (neg_ne_zero.mpr (pow_ne_zero 2 hbvZero))
            (sub_ne_zero.mpr hbwOne)
        exact sub_eq_zero.mp ((mul_eq_zero.mp B24).resolve_left hprefix)
      have hbvNegTwo : bv = -2 := by
        have hz : bv ^ 3 * (bv - 1) ^ 2 * (bv + 2) = 0 := by
          dsimp [h] at hh
          rw [hbwBvSq] at hh
          linear_combination hh
        have hprefix : bv ^ 3 * (bv - 1) ^ 2 ≠ 0 :=
          mul_ne_zero (pow_ne_zero 3 hbvZero) (pow_ne_zero 2 hbv)
        exact eq_neg_of_add_eq_zero_left ((mul_eq_zero.mp hz).resolve_left hprefix)
      have pbs : bs ^ 2 + 2 * bs + 4 = 0 := by
        rw [hbwBvSq, hbvNegTwo] at E9
        ring_nf at E9
        linear_combination (-1 / 12 : ℂ) * E9
      have pzs : zs ^ 2 + 2 * zs + 4 = 0 := by
        have hc := congrArg (starRingEnd ℂ) pbs
        simpa [hconj] using hc
      grobner
  · have hbvZero : bv ≠ 0 := by
      intro hv
      subst bv
      ring_nf at E9
      exact (mul_ne_zero hbr (pow_ne_zero 2 hbs)) E9
    have G3 : -(bu - bs) * (br - bv) * bv * bw = 0 := by
      exact q1EqZeroG3 hq p2 p5 E7 E8 E9
    have G7 : bs * bv * (br ^ 2 - br * bv + bv ^ 2 - br) = 0 := by
      exact q1EqZeroG7 hq p2 p5 E7 E8 E9
    have G39 : br * (br - 1) * bw * (bu ^ 2 - bs * bw) = 0 := by
      exact q1EqZeroG39 hq p2 p5 E7 E8 E9
    let F := br ^ 2 - br * bv + bv ^ 2 - br
    have hF : F = 0 := by
      exact (mul_eq_zero.mp G7).resolve_left (mul_ne_zero hbs hbvZero)
    have hbrOne : br ≠ 1 := by
      intro hr
      subst br
      dsimp [F] at hF
      have hz : bv * (bv - 1) = 0 := by linear_combination hF
      exact (mul_ne_zero hbvZero hbv) hz
    have hbuSq : bu ^ 2 = bs * bw := by
      have hprefix : br * (br - 1) * bw ≠ 0 :=
        mul_ne_zero (mul_ne_zero hbr (sub_ne_zero.mpr hbrOne)) hbw
      exact sub_eq_zero.mp ((mul_eq_zero.mp G39).resolve_left hprefix)
    have hbrBv : br ≠ bv := by
      intro hr
      subst bv
      dsimp [F] at hF
      have hz : br * (br - 1) = 0 := by linear_combination hF
      exact (mul_ne_zero hbr (sub_ne_zero.mpr hbrOne)) hz
    have hbu : bu = bs := by
      have hprefix : bv * bw ≠ 0 := mul_ne_zero hbvZero hbw
      have hprod : -(bu - bs) * (br - bv) = 0 := by
        exact (mul_eq_zero.mp G3).resolve_right hprefix
      rcases mul_eq_zero.mp hprod with h | h
      · exact sub_eq_zero.mp (neg_eq_zero.mp h)
      · exact False.elim (hbrBv (sub_eq_zero.mp h))
    have hbwBs : bw = bs := by
      rw [hbu] at hbuSq
      have hz : bs * (bs - bw) = 0 := by linear_combination hbuSq
      exact (sub_eq_zero.mp ((mul_eq_zero.mp hz).resolve_left hbs)).symm
    have hbvBs : bv = bs := by
      rw [hbu, hbwBs] at E7
      ring_nf at E7
      have hz : -bs * (bv - 1) * (bv - bs) = 0 := by linear_combination E7
      have hprefix : -bs * (bv - 1) ≠ 0 :=
        mul_ne_zero (neg_ne_zero.mpr hbs) hbv
      exact sub_eq_zero.mp ((mul_eq_zero.mp hz).resolve_left hprefix)
    rw [hbu, hbwBs, hbvBs] at E8
    ring_nf at E8
    have hbsOne : bs = 1 := by
      have hz : bs ^ 2 * (1 - bs) = 0 := by linear_combination E8
      have : 1 - bs = 0 := (mul_eq_zero.mp hz).resolve_left (pow_ne_zero 2 hbs)
      linear_combination this
    exact hbv (by rw [hbvBs, hbsOne]; norm_num)

end Problem97.CrossedArmSevenPointEuclideanObstruction
