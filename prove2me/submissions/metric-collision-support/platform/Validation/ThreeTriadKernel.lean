/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Solutions.Sol_Erdos9796Mission_three_triad_collision

/-! Kernel validation of the three-triad collision theorem. -/

open Erdos9796Mission

namespace ThreeTriadKernelValidation

theorem result
    {A B C D E : Plane}
    (hBC_BD : dist B C = dist B D)
    (hBD_DA : dist B D = dist D A)
    (hCA_CD : dist C A = dist C D)
    (hCD_CE : dist C D = dist C E)
    (hEA_EB : dist E A = dist E B)
    (hEB_ED : dist E B = dist E D) : A = B := by
  exact solution hBC_BD hBD_DA hCA_CD hCD_CE hEA_EB hEB_ED

#print axioms result

end ThreeTriadKernelValidation
