/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Solutions.Sol_Erdos9796Mission_eq_of_dist_eq_three_of_pairwise_ne

/-! Kernel validation of the circumcenter uniqueness theorem. -/

open Erdos9796Mission

namespace CircumcenterKernelValidation

theorem result
    (P Q R A B : Plane)
    (hPQ : P ≠ Q) (hPR : P ≠ R) (hQR : Q ≠ R)
    (hAP_AQ : dist A P = dist A Q) (hAP_AR : dist A P = dist A R)
    (hBP_BQ : dist B P = dist B Q) (hBP_BR : dist B P = dist B R) :
    A = B := by
  exact solution P Q R A B hPQ hPR hQR hAP_AQ hAP_AR hBP_BQ hBP_BR

#print axioms result

end CircumcenterKernelValidation
