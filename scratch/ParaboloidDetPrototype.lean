import Erdos9796Proof.P97.Census554.CirclePowerMatrix
import Erdos9796Proof.P97.Foundation
import Mathlib.Tactic

open scoped EuclideanGeometry
open Problem97
open Problem97.Census554.CirclePowerMatrix

namespace Scratch

def liftedFour (a b c d : ℝ²) : Matrix (Fin 4) (Fin 4) ℝ :=
  !![sqNorm a, sqNorm b, sqNorm c, sqNorm d;
     a 0, b 0, c 0, d 0;
     a 1, b 1, c 1, d 1;
     1, 1, 1, 1]

theorem det_liftedFour_eq
    (center a b c d : ℝ²) (radiusSq : ℝ)
    (ha : power center radiusSq a = 0)
    (hb : power center radiusSq b = 0)
    (hc : power center radiusSq c = 0) :
    (liftedFour a b c d).det =
      - signedArea2 a b c * power center radiusSq d := by
  have hrow :
      (liftedFour a b c d).det =
        (Matrix.det !![
          power center radiusSq a, power center radiusSq b,
            power center radiusSq c, power center radiusSq d;
          a 0, b 0, c 0, d 0;
          a 1, b 1, c 1, d 1;
          1, 1, 1, 1]) := by
    rw [Matrix.det_succ_row_zero, Matrix.det_succ_row_zero]
    simp [Fin.sum_univ_succ, Matrix.det_fin_three, Fin.succAbove,
      liftedFour, power, sqDist, sqNorm]
    ring
  rw [hrow, ha, hb, hc]
  rw [Matrix.det_succ_row_zero]
  simp [Fin.sum_univ_succ, Matrix.det_fin_three, Fin.succAbove,
    signedArea2]
  ring

end Scratch
