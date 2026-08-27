/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TriApexEndpointRetainedOmission

/-!
# Tri-apex compatibility import surface

`TwoSourceCanonicalSurface` reaches the remaining cluster-owned tri-apex
closures through this governed Legacy surface.  The neutral declarations it
uses directly live in the shared `ATail` modules; this import preserves only
the residual coordinator-facing API that cannot move across the cluster cut.
-/
