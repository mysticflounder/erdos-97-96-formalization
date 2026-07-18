import Erdos9796Proof.P97.Census554.EqualityCore

/-!
# A reusable distance-form rank-two identity for four planar points

This is a proof-facing normalization of the three-vector Gram determinant.
It is intended to consume an exact four-label distance obstruction extracted
from the all-center abstract-distance search.  It does not assert that an
abstract distance table is planar and does not provide finite role coverage.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace PlanarRankTwoDistanceIdentityScratch

/-- Squared distance in `ℝ²`, expanded in the two coordinates. -/
private theorem dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]

/-- The six squared distances of four planar points obey the three-vector
Gram-determinant identity.  The three half-sums are the pairwise dot products
of `a - p`, `b - p`, and `c - p` recovered from distances by polarization. -/
theorem planar_distance_gram_det_zero (p a b c : ℝ²) :
    let A := dist p a ^ 2
    let B := dist p b ^ 2
    let C := dist p c ^ 2
    let X := (A + B - dist a b ^ 2) / 2
    let Y := (A + C - dist a c ^ 2) / 2
    let Z := (B + C - dist b c ^ 2) / 2
    A * B * C + 2 * X * Y * Z - A * Z ^ 2 - B * Y ^ 2 - C * X ^ 2 = 0 := by
  dsimp only
  rw [dist_sq_coord p a, dist_sq_coord p b, dist_sq_coord p c,
    dist_sq_coord a b, dist_sq_coord a c, dist_sq_coord b c]
  ring

/-- Certificate-facing form: any proposed six squared-distance values for
four actual planar points must satisfy the same determinant polynomial. -/
theorem determinant_eq_zero_of_six_distance_squares
    (p a b c : ℝ²) {A B C AB AC BC : ℝ}
    (hA : dist p a ^ 2 = A)
    (hB : dist p b ^ 2 = B)
    (hC : dist p c ^ 2 = C)
    (hAB : dist a b ^ 2 = AB)
    (hAC : dist a c ^ 2 = AC)
    (hBC : dist b c ^ 2 = BC) :
    let X := (A + B - AB) / 2
    let Y := (A + C - AC) / 2
    let Z := (B + C - BC) / 2
    A * B * C + 2 * X * Y * Z - A * Z ^ 2 - B * Y ^ 2 - C * X ^ 2 = 0 := by
  have h := planar_distance_gram_det_zero p a b c
  simpa [hA, hB, hC, hAB, hAC, hBC] using h

/-- Immediate contradiction adapter for an exact certificate whose scalar
determinant replay proves nonzero. -/
theorem false_of_six_distance_squares_of_determinant_ne_zero
    (p a b c : ℝ²) {A B C AB AC BC : ℝ}
    (hA : dist p a ^ 2 = A)
    (hB : dist p b ^ 2 = B)
    (hC : dist p c ^ 2 = C)
    (hAB : dist a b ^ 2 = AB)
    (hAC : dist a c ^ 2 = AC)
    (hBC : dist b c ^ 2 = BC)
    (hne :
      let X := (A + B - AB) / 2
      let Y := (A + C - AC) / 2
      let Z := (B + C - BC) / 2
      A * B * C + 2 * X * Y * Z - A * Z ^ 2 - B * Y ^ 2 - C * X ^ 2 ≠ 0) :
    False := by
  exact hne (determinant_eq_zero_of_six_distance_squares
    p a b c hA hB hC hAB hAC hBC)

#print axioms planar_distance_gram_det_zero
#print axioms determinant_eq_zero_of_six_distance_squares
#print axioms false_of_six_distance_squares_of_determinant_ne_zero

end PlanarRankTwoDistanceIdentityScratch
end Problem97
