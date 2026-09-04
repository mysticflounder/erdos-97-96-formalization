/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenTwoCanonicalK4FixedCellNormalizers

/-!
# Two canonical K4 rows in one exact-thirteen fixed cell

For the direct order `[2,8,9,10,11,12,1,3,4,5,0,6,7]`, the four fixed
rows `C0@6`, `K@0`, `C1@7`, and `T@1` cannot coexist with arbitrary selected
four-support rows at raw centers `2` and `5`.  This is a fixed-cell theorem;
source occurrence and mirror coverage are deliberately separate.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CardGeThirteenTwoCanonicalK4FixedCell

open Census554.EqualityCore
open GenericRowNogoodCertificate
open ThreeBlockPairRowDomainCertificate
open CardGeThirteenTwoCanonicalK4FixedCellData
open CardGeThirteenTwoCanonicalK4FixedCellCertificateBank
open CardGeThirteenTwoCanonicalK4FixedCellNormalizers
open scoped EuclideanGeometry

/-- The compressed sixty-three-entry bank closes every pair of residual
center-2 and center-5 supports. -/
theorem false_of_normalized_center2_center5
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 13 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hbase : RowChoicesDistanceEqual boundary baseChoices)
    (index2 : Fin 27) (index5 : Fin 16)
    (hrow2 : RowDistancesEqual boundary (rawToPos 2)
      (center2Domain index2))
    (hrow5 : RowDistancesEqual boundary (rawToPos 5)
      (center5Domain index5)) : False := by
  let certificateIndex := jointRoute index2 index5
  have hbase2 :
      RowChoicesDistanceEqual boundary
        (baseChoices ++
          [{ center := rawToPos 2,
             support := jointCenter2Core certificateIndex }]) :=
    rowChoicesDistanceEqual_append_singleton hbase hrow2
      (jointCenter2Core_subset index2 index5)
  have hrows :
      RowChoicesDistanceEqual boundary (jointChoices certificateIndex) := by
    simpa only [jointChoices, certificateIndex, List.append_assoc] using
      rowChoicesDistanceEqual_append_singleton hbase2 hrow5
        (jointCenter5Core_subset index2 index5)
  exact false_of_weightedKalmansonCancellationData_of_check
    hA hinj himage hccw (jointChoices certificateIndex) hrows
      (jointCertificate certificateIndex)
      (jointCertificate_check certificateIndex)

/-- Main source-neutral fixed-cell terminal.  The base-row hypothesis names
exactly the four displayed direct-order rows through `baseChoices`; the two
challenged supports remain arbitrary. -/
theorem false_of_twoCanonicalK4_fixedCell
    {A : Finset ℝ²} (hA : ConvexIndep A)
    {boundary : Fin 13 → ℝ²}
    (hinj : Function.Injective boundary)
    (himage : Finset.univ.image boundary = A)
    (hccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    (hbase : RowChoicesDistanceEqual boundary baseChoices)
    {support2 support5 : Finset (Fin 13)}
    (hrow2 : FourSupportRow boundary (rawToPos 2) support2)
    (hrow5 : FourSupportRow boundary (rawToPos 5) support5) : False := by
  obtain ⟨index2, hsupport2⟩ :=
    center2_normalize hA hinj himage hccw hbase hrow2
  obtain ⟨index5, hsupport5⟩ :=
    center5_normalize hA hinj himage hccw hbase hrow5
  subst support2
  subst support5
  exact false_of_normalized_center2_center5 hA hinj himage hccw hbase
    index2 index5 hrow2.equalDistances hrow5.equalDistances

#print axioms false_of_normalized_center2_center5
#print axioms false_of_twoCanonicalK4_fixedCell

end CardGeThirteenTwoCanonicalK4FixedCell
end ATailFrontierLiveClosure
end Problem97
