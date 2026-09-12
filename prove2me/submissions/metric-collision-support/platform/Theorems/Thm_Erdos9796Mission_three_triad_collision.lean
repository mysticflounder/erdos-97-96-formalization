/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Definitions.Def_Erdos9796Mission

open scoped EuclideanGeometry

/-!
# Three linked equal-distance triads force a collision

Five points in the Euclidean plane with the displayed chain of equal-distance
relations must have `A = B`.
-/

-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796Mission.three_triad_collision
    {A B C D E : Erdos9796Mission.Plane}
    (hBC_BD : dist B C = dist B D)
    (hBD_DA : dist B D = dist D A)
    (hCA_CD : dist C A = dist C D)
    (hCD_CE : dist C D = dist C E)
    (hEA_EB : dist E A = dist E B)
    (hEB_ED : dist E B = dist E D) : A = B := by sorry
