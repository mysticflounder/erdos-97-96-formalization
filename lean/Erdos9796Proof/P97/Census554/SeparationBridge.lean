/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.SeparationGeometry
import Erdos9796Proof.P97.Census554.SeparationCertificate

/-!
# Geometric consumer for card-11 separation certificates

This module combines the geometric direct-or-mirror macro-order producer with
the executable separation-certificate consumer.  A checked certificate for a
realized row pattern contradicts any cap-aware card-11 labeling of the same
point configuration.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554
namespace SeparationCore
namespace SeparationCertificate

open EqualityCore

/-- A checked card-11 separation certificate contradicts a realization carried
by a cap-aware card-11 labeling. -/
theorem false_of_card11SeparationCertificate_of_capLabeling
    {A : Finset ℝ²} (SP : SurplusCapPacket A)
    (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {second : Fin 3} (hsecond : second ≠ SP.surplusIdx)
    (frame : MultiCenter.JointCapIndexFrame SP.surplusIdx second)
    (L : Card11CapLabeling SP.partition frame)
    {P : RowPattern (Fin 11)}
    (certificate : Card11SeparationCertificate)
    (hcheck : certificate.check P = true)
    (hreal : Realizes P L.pointOf) : False := by
  rcases L.nonempty_directOrMirrorMacroCcwLabeling
      SP hconv hK4 hsecond frame with ⟨labeling⟩
  exact false_of_card11SeparationCertificate
    certificate hcheck hreal labeling

end SeparationCertificate
end SeparationCore
end Census554
end Problem97
