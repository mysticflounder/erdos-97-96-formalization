/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

-- Authenticated declaration slice from Solutions.Batch3N9.N4d.CyclicTransport
theorem N4dExcludesFormB_v2_proof
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4dExcludesFormB_v2 := by
  intro r hr hcard hesc hform
  exact N4dExcludesFormB_v1_proof (S.cyclicShift) (r := r) hr
    (by simpa [cyclicShift_witnessClassAt_v1] using hcard)
    (by simpa [cyclicShift_witnessClassAt_v1, cyclicShift_CP_C1, b3n9m073_cyclicShiftCP] using hesc)
    ((isFormB_v1_cyclicShift S r).mpr hform)
