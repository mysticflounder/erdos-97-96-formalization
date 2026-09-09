/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

-- Authenticated declaration slice from Solutions.Batch3N9.N9Endpoint.N4e
theorem n4eCapContainment_of_n4c_n4d
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hClass1 : S.N4cClassifies_v1) (hClass2 : S.N4cClassifies_v2)
    (hClass3 : S.N4cClassifies_v3)
    (hExcl1 : S.N4dExcludes_v1 hClass1)
    (hExcl2 : S.N4dExcludes_v2 hClass2)
    (hExcl3 : S.N4dExcludes_v3 hClass3) :
    S.N4eCapContainment := by
  constructor
  · intro r hr hcard
    by_contra hsub
    exact hExcl1 hr hcard hsub
  constructor
  · intro r hr hcard
    by_contra hsub
    exact hExcl2 hr hcard hsub
  · intro r hr hcard
    by_contra hsub
    exact hExcl3 hr hcard hsub
