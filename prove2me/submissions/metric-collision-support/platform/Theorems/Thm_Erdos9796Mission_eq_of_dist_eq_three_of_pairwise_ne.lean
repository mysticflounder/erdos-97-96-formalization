/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-/

import Definitions.Def_Erdos9796Mission

open Erdos9796Mission

/-! Three pairwise-distinct reference points determine an equidistant center. -/

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.eq_of_dist_eq_three_of_pairwise_ne
    (P Q R A B : Plane)
    (hPQ : P ≠ Q) (hPR : P ≠ R) (hQR : Q ≠ R)
    (hAP_AQ : dist A P = dist A Q) (hAP_AR : dist A P = dist A R)
    (hBP_BQ : dist B P = dist B Q) (hBP_BR : dist B P = dist B R) :
    A = B := by sorry
