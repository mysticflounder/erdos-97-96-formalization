/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1TwoShortCapReduction
import Erdos9796Proof.P97.U1OppositeCapLowerBounds

/-!
# Census554 geometry bridge

Bank-independent cardinality facts used to isolate the card-11 branch before
constructing a Census554 cube. The theorem in this file does not consume any
finite-census result or any open Front-A leaf.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace Census554

/-- If two distinct caps have at least five points and the remaining cap has
the generic four-point lower bound, then the cap-sum identity forces the
ambient carrier to have at least eleven points. -/
theorem card_ge_eleven_of_twoLargeCaps
    {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M)
    (hconv : ConvexIndep A)
    (hnoncol : ¬ Collinear ℝ (A : Set ℝ²))
    (hK4 : HasNEquidistantProperty 4 A)
    (P : CircumscribedMECPacket A M)
    {i j : Fin 3} (hji : j ≠ i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hj5 : 5 ≤ (CP.capAt j).card) :
    11 ≤ A.card := by
  have hlower :
      4 ≤ CP.C1.card ∧ 4 ≤ CP.C2.card ∧ 4 ≤ CP.C3.card :=
    U1OppositeCapLowerBounds.capTriple_caps_card_ge_four
      CP hconv hnoncol hK4 P
  have hi5 : 5 ≤ (CP.capAt i).card := by omega
  have hsum := CP.cap_sum_identity
  fin_cases i <;> fin_cases j <;>
    simp_all [CapTriple.capAt] <;> omega

end Census554
end Problem97
