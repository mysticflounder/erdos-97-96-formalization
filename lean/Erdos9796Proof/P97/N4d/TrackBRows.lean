import Erdos9796Proof.P97.N9Endpoint.N4e

/-!
# N4d q'=E Family-B Track-B row closures

This module records the concrete sampled Track-B row closures discharged by the
shared-triple shell theorem in `N9EndpointN4e.lean`.

The archived hard-residual sample has 30 free-`rb` rows outside the already
landed `rb = s` reducers whose second `b2` class contains `{v1, v3, a2}`.  The
row packet below is exactly the Lean-facing content of that class membership:
`b2` is equidistant from `v1`, `v3`, and `a2`, while the `a2` selector is the
upper `circle(v1, |v1v2|) ∩ circle(v2, |v2v3|)` witness.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace N4dTrackBRows

/-- The 30 sampled free-`rb` Track-B rows with `Sb2 ⊇ {v1, v3, a2}` not already
covered by the landed `rb = s` reducers. -/
def sharedTripleRows : Finset Nat :=
  ([609, 606, 661, 664, 668, 1706, 1709, 1761, 1764, 1768,
    1926, 1932, 1933, 2094, 2097, 2098, 2256, 2259, 2311, 2314,
    2476, 2644, 2751, 2754, 2861, 2864, 2867, 2868, 2916, 2974] :
    List Nat).toFinset

/-- Row-facing packet for the shared-triple Track-B family. -/
structure SharedTripleRowPacket {A : Finset ℝ²}
    (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout) (rb : ℝ) : Prop where
  hA2 : Z.a2 ∈ S.I2
  hB2 : Z.b2 ∈ S.I2
  hAC : dist S.triangle.v1 Z.a2 = dist S.triangle.v1 S.triangle.v2
  hBD : dist S.triangle.v2 Z.a2 = dist S.triangle.v2 S.triangle.v3
  hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2
  hb2v1 : dist Z.b2 S.triangle.v1 = rb
  hb2v3 : dist Z.b2 S.triangle.v3 = rb
  hb2a2 : dist Z.b2 Z.a2 = rb

/-- Generic row closer for the shared-triple Track-B family. -/
theorem not_qEqE_familyB_trackB_of_sharedTripleRowPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) :
    False :=
  Problem97.FiniteEndpointShell.qEqE_b2_familyB_sharedTriple_impossible_of_shell
    S Z h.hA2 h.hB2 h.hAC h.hBD h.hsmall h.hb2v1 h.hb2v3 h.hb2a2

/-- Sample row 609 closes by the shared-triple Track-B theorem. -/
theorem row609_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 606 closes by the shared-triple Track-B theorem. -/
theorem row606_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 661 closes by the shared-triple Track-B theorem. -/
theorem row661_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 664 closes by the shared-triple Track-B theorem. -/
theorem row664_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 668 closes by the shared-triple Track-B theorem. -/
theorem row668_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 1706 closes by the shared-triple Track-B theorem. -/
theorem row1706_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 1709 closes by the shared-triple Track-B theorem. -/
theorem row1709_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 1761 closes by the shared-triple Track-B theorem. -/
theorem row1761_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 1764 closes by the shared-triple Track-B theorem. -/
theorem row1764_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 1768 closes by the shared-triple Track-B theorem. -/
theorem row1768_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 1926 closes by the shared-triple Track-B theorem. -/
theorem row1926_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 1932 closes by the shared-triple Track-B theorem. -/
theorem row1932_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 1933 closes by the shared-triple Track-B theorem. -/
theorem row1933_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2094 closes by the shared-triple Track-B theorem. -/
theorem row2094_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2097 closes by the shared-triple Track-B theorem. -/
theorem row2097_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2098 closes by the shared-triple Track-B theorem. -/
theorem row2098_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2256 closes by the shared-triple Track-B theorem. -/
theorem row2256_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2259 closes by the shared-triple Track-B theorem. -/
theorem row2259_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2311 closes by the shared-triple Track-B theorem. -/
theorem row2311_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2314 closes by the shared-triple Track-B theorem. -/
theorem row2314_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2476 closes by the shared-triple Track-B theorem. -/
theorem row2476_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2644 closes by the shared-triple Track-B theorem. -/
theorem row2644_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2751 closes by the shared-triple Track-B theorem. -/
theorem row2751_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2754 closes by the shared-triple Track-B theorem. -/
theorem row2754_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2861 closes by the shared-triple Track-B theorem. -/
theorem row2861_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2864 closes by the shared-triple Track-B theorem. -/
theorem row2864_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2867 closes by the shared-triple Track-B theorem. -/
theorem row2867_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2868 closes by the shared-triple Track-B theorem. -/
theorem row2868_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2916 closes by the shared-triple Track-B theorem. -/
theorem row2916_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

/-- Sample row 2974 closes by the shared-triple Track-B theorem. -/
theorem row2974_not_qEqE_familyB_trackB
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : S.ZeroDefectCapLayout)
    {rb : ℝ} (h : SharedTripleRowPacket S Z rb) : False :=
  not_qEqE_familyB_trackB_of_sharedTripleRowPacket S Z h

end N4dTrackBRows
end Problem97
