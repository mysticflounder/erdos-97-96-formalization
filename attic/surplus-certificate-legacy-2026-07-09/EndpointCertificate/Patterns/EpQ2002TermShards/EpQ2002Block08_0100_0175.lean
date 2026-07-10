/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 8:100-175

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 8 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_08_0100_0175 : Poly :=
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(14, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0100 : Poly :=
[
  term ((-74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (15, 1)]
]

/-- Partial product 100 for generator 8. -/
def ep_Q2_002_partial_08_0100 : Poly :=
[
  term ((148941511250536434420646795241810478412992 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((-74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (6, 1), (15, 1)],
  term ((-74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (5, 1), (6, 1), (15, 1)],
  term ((-148941511250536434420646795241810478412992 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 8. -/
theorem ep_Q2_002_partial_08_0100_valid :
    mulPoly ep_Q2_002_coefficient_08_0100
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0101 : Poly :=
[
  term ((14304889212 : Rat) / 7401317245) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 101 for generator 8. -/
def ep_Q2_002_partial_08_0101 : Poly :=
[
  term ((-28609778424 : Rat) / 7401317245) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((14304889212 : Rat) / 7401317245) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((14304889212 : Rat) / 7401317245) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((28609778424 : Rat) / 7401317245) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(5, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 8. -/
theorem ep_Q2_002_partial_08_0101_valid :
    mulPoly ep_Q2_002_coefficient_08_0101
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0102 : Poly :=
[
  term ((-214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (11, 1)]
]

/-- Partial product 102 for generator 8. -/
def ep_Q2_002_partial_08_0102 : Poly :=
[
  term ((428740190263229965133057048592 : Rat) / 115799135485108289802725034287) [(0, 1), (5, 1), (8, 1), (11, 1)],
  term ((-214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(0, 2), (5, 1), (8, 1), (11, 1)],
  term ((-214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(1, 2), (5, 1), (8, 1), (11, 1)],
  term ((-428740190263229965133057048592 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 8. -/
theorem ep_Q2_002_partial_08_0102_valid :
    mulPoly ep_Q2_002_coefficient_08_0102
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0103 : Poly :=
[
  term ((403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (13, 1)]
]

/-- Partial product 103 for generator 8. -/
def ep_Q2_002_partial_08_0103 : Poly :=
[
  term ((-807398069213491711065167206464 : Rat) / 115799135485108289802725034287) [(0, 1), (5, 1), (8, 1), (13, 1)],
  term ((403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(0, 2), (5, 1), (8, 1), (13, 1)],
  term ((403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((807398069213491711065167206464 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 8. -/
theorem ep_Q2_002_partial_08_0103_valid :
    mulPoly ep_Q2_002_coefficient_08_0103
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0104 : Poly :=
[
  term ((-4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (8, 1), (15, 1)]
]

/-- Partial product 104 for generator 8. -/
def ep_Q2_002_partial_08_0104 : Poly :=
[
  term ((8200356739168753857774872701486155698928 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((-4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((-4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((-8200356739168753857774872701486155698928 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 8. -/
theorem ep_Q2_002_partial_08_0104_valid :
    mulPoly ep_Q2_002_coefficient_08_0104
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0105 : Poly :=
[
  term ((219650568 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 8. -/
def ep_Q2_002_partial_08_0105 : Poly :=
[
  term ((-439301136 : Rat) / 7401317245) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((219650568 : Rat) / 7401317245) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((219650568 : Rat) / 7401317245) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((439301136 : Rat) / 7401317245) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-219650568 : Rat) / 7401317245) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-219650568 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 8. -/
theorem ep_Q2_002_partial_08_0105_valid :
    mulPoly ep_Q2_002_coefficient_08_0105
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0106 : Poly :=
[
  term ((70782083063274196457662569567516 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1)]
]

/-- Partial product 106 for generator 8. -/
def ep_Q2_002_partial_08_0106 : Poly :=
[
  term ((-141564166126548392915325139135032 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1)],
  term ((70782083063274196457662569567516 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (11, 1)],
  term ((70782083063274196457662569567516 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (11, 1)],
  term ((141564166126548392915325139135032 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1)],
  term ((-70782083063274196457662569567516 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 2)],
  term ((-70782083063274196457662569567516 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 8. -/
theorem ep_Q2_002_partial_08_0106_valid :
    mulPoly ep_Q2_002_coefficient_08_0106
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0107 : Poly :=
[
  term ((1989100387129532543517879266976 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 107 for generator 8. -/
def ep_Q2_002_partial_08_0107 : Poly :=
[
  term ((-3978200774259065087035758533952 : Rat) / 97983883872014706756151952089) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((1989100387129532543517879266976 : Rat) / 97983883872014706756151952089) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((1989100387129532543517879266976 : Rat) / 97983883872014706756151952089) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((3978200774259065087035758533952 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1989100387129532543517879266976 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-1989100387129532543517879266976 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 8. -/
theorem ep_Q2_002_partial_08_0107_valid :
    mulPoly ep_Q2_002_coefficient_08_0107
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0108 : Poly :=
[
  term ((-3745848531377881544833368369792 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 108 for generator 8. -/
def ep_Q2_002_partial_08_0108 : Poly :=
[
  term ((7491697062755763089666736739584 : Rat) / 97983883872014706756151952089) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((-3745848531377881544833368369792 : Rat) / 97983883872014706756151952089) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((-3745848531377881544833368369792 : Rat) / 97983883872014706756151952089) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((-7491697062755763089666736739584 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((3745848531377881544833368369792 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((3745848531377881544833368369792 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 8. -/
theorem ep_Q2_002_partial_08_0108_valid :
    mulPoly ep_Q2_002_coefficient_08_0108
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0109 : Poly :=
[
  term ((62942654816781349315530910870528153362288 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 109 for generator 8. -/
def ep_Q2_002_partial_08_0109 : Poly :=
[
  term ((-125885309633562698631061821741056306724576 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((62942654816781349315530910870528153362288 : Rat) / 103601401347717117429703636119532782115) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((62942654816781349315530910870528153362288 : Rat) / 103601401347717117429703636119532782115) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((125885309633562698631061821741056306724576 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-62942654816781349315530910870528153362288 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-62942654816781349315530910870528153362288 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 8. -/
theorem ep_Q2_002_partial_08_0109_valid :
    mulPoly ep_Q2_002_coefficient_08_0109
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0110 : Poly :=
[
  term ((4972301092 : Rat) / 7401317245) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 8. -/
def ep_Q2_002_partial_08_0110 : Poly :=
[
  term ((-9944602184 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((4972301092 : Rat) / 7401317245) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((4972301092 : Rat) / 7401317245) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((9944602184 : Rat) / 7401317245) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4972301092 : Rat) / 7401317245) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4972301092 : Rat) / 7401317245) [(5, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 8. -/
theorem ep_Q2_002_partial_08_0110_valid :
    mulPoly ep_Q2_002_coefficient_08_0110
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0111 : Poly :=
[
  term ((-133295917896358396545799317839472 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1)]
]

/-- Partial product 111 for generator 8. -/
def ep_Q2_002_partial_08_0111 : Poly :=
[
  term ((266591835792716793091598635678944 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1)],
  term ((-133295917896358396545799317839472 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (13, 1)],
  term ((-133295917896358396545799317839472 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1)],
  term ((-266591835792716793091598635678944 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 1)],
  term ((133295917896358396545799317839472 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 2)],
  term ((133295917896358396545799317839472 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 8. -/
theorem ep_Q2_002_partial_08_0111_valid :
    mulPoly ep_Q2_002_coefficient_08_0111
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0112 : Poly :=
[
  term ((339014794276067576648199289918183117670904 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 1)]
]

/-- Partial product 112 for generator 8. -/
def ep_Q2_002_partial_08_0112 : Poly :=
[
  term ((-678029588552135153296398579836366235341808 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (15, 1)],
  term ((339014794276067576648199289918183117670904 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (15, 1)],
  term ((339014794276067576648199289918183117670904 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (5, 1), (15, 1)],
  term ((678029588552135153296398579836366235341808 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 1), (15, 1)],
  term ((-339014794276067576648199289918183117670904 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 2), (15, 1)],
  term ((-339014794276067576648199289918183117670904 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 8. -/
theorem ep_Q2_002_partial_08_0112_valid :
    mulPoly ep_Q2_002_coefficient_08_0112
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0113 : Poly :=
[
  term ((-36148003063 : Rat) / 7401317245) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 8. -/
def ep_Q2_002_partial_08_0113 : Poly :=
[
  term ((72296006126 : Rat) / 7401317245) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-36148003063 : Rat) / 7401317245) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-36148003063 : Rat) / 7401317245) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-72296006126 : Rat) / 7401317245) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((36148003063 : Rat) / 7401317245) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((36148003063 : Rat) / 7401317245) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 8. -/
theorem ep_Q2_002_partial_08_0113_valid :
    mulPoly ep_Q2_002_coefficient_08_0113
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0114 : Poly :=
[
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(6, 1)]
]

/-- Partial product 114 for generator 8. -/
def ep_Q2_002_partial_08_0114 : Poly :=
[
  term ((-22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (6, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 2), (6, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(1, 2), (6, 1)],
  term ((22997560084163800273152 : Rat) / 253528477699481291099) [(6, 1), (14, 1)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(6, 1), (14, 2)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 8. -/
theorem ep_Q2_002_partial_08_0114_valid :
    mulPoly ep_Q2_002_coefficient_08_0114
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0115 : Poly :=
[
  term ((58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 115 for generator 8. -/
def ep_Q2_002_partial_08_0115 : Poly :=
[
  term ((-117888285289794172374511458562464 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((117888285289794172374511458562464 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((-58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 8. -/
theorem ep_Q2_002_partial_08_0115_valid :
    mulPoly ep_Q2_002_coefficient_08_0115
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0116 : Poly :=
[
  term ((-111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 116 for generator 8. -/
def ep_Q2_002_partial_08_0116 : Poly :=
[
  term ((222005718352250892137002947458688 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((-111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-222005718352250892137002947458688 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 8. -/
theorem ep_Q2_002_partial_08_0116_valid :
    mulPoly ep_Q2_002_coefficient_08_0116
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0117 : Poly :=
[
  term ((-847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 117 for generator 8. -/
def ep_Q2_002_partial_08_0117 : Poly :=
[
  term ((1694617680560298153396602698087297615544832 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-1694617680560298153396602698087297615544832 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 8. -/
theorem ep_Q2_002_partial_08_0117_valid :
    mulPoly ep_Q2_002_coefficient_08_0117
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0118 : Poly :=
[
  term ((-61246522028 : Rat) / 7401317245) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 118 for generator 8. -/
def ep_Q2_002_partial_08_0118 : Poly :=
[
  term ((122493044056 : Rat) / 7401317245) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-61246522028 : Rat) / 7401317245) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-61246522028 : Rat) / 7401317245) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-122493044056 : Rat) / 7401317245) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((61246522028 : Rat) / 7401317245) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((61246522028 : Rat) / 7401317245) [(6, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 8. -/
theorem ep_Q2_002_partial_08_0118_valid :
    mulPoly ep_Q2_002_coefficient_08_0118
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0119 : Poly :=
[
  term ((47062848453155143181002361092896 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 119 for generator 8. -/
def ep_Q2_002_partial_08_0119 : Poly :=
[
  term ((-94125696906310286362004722185792 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((47062848453155143181002361092896 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((47062848453155143181002361092896 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((94125696906310286362004722185792 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-47062848453155143181002361092896 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (14, 2)],
  term ((-47062848453155143181002361092896 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 8. -/
theorem ep_Q2_002_partial_08_0119_valid :
    mulPoly ep_Q2_002_coefficient_08_0119
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0120 : Poly :=
[
  term ((178118180846543005220055521529193162211856 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 120 for generator 8. -/
def ep_Q2_002_partial_08_0120 : Poly :=
[
  term ((-356236361693086010440111043058386324423712 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((178118180846543005220055521529193162211856 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((178118180846543005220055521529193162211856 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((356236361693086010440111043058386324423712 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-178118180846543005220055521529193162211856 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-178118180846543005220055521529193162211856 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 8. -/
theorem ep_Q2_002_partial_08_0120_valid :
    mulPoly ep_Q2_002_coefficient_08_0120
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0121 : Poly :=
[
  term ((4500211964 : Rat) / 1057331035) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 121 for generator 8. -/
def ep_Q2_002_partial_08_0121 : Poly :=
[
  term ((-9000423928 : Rat) / 1057331035) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4500211964 : Rat) / 1057331035) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4500211964 : Rat) / 1057331035) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((9000423928 : Rat) / 1057331035) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4500211964 : Rat) / 1057331035) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4500211964 : Rat) / 1057331035) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 8. -/
theorem ep_Q2_002_partial_08_0121_valid :
    mulPoly ep_Q2_002_coefficient_08_0121
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0122 : Poly :=
[
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2)]
]

/-- Partial product 122 for generator 8. -/
def ep_Q2_002_partial_08_0122 : Poly :=
[
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 2)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (11, 2)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 2)],
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (14, 1)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (14, 2)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 8. -/
theorem ep_Q2_002_partial_08_0122_valid :
    mulPoly ep_Q2_002_coefficient_08_0122
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0123 : Poly :=
[
  term ((871728662554901998481237419813615738957152 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 123 for generator 8. -/
def ep_Q2_002_partial_08_0123 : Poly :=
[
  term ((-1743457325109803996962474839627231477914304 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((871728662554901998481237419813615738957152 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((871728662554901998481237419813615738957152 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((1743457325109803996962474839627231477914304 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-871728662554901998481237419813615738957152 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-871728662554901998481237419813615738957152 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 8. -/
theorem ep_Q2_002_partial_08_0123_valid :
    mulPoly ep_Q2_002_coefficient_08_0123
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0124 : Poly :=
[
  term ((46941632816 : Rat) / 7401317245) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 8. -/
def ep_Q2_002_partial_08_0124 : Poly :=
[
  term ((-93883265632 : Rat) / 7401317245) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((46941632816 : Rat) / 7401317245) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((46941632816 : Rat) / 7401317245) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((93883265632 : Rat) / 7401317245) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 8. -/
theorem ep_Q2_002_partial_08_0124_valid :
    mulPoly ep_Q2_002_coefficient_08_0124
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0125 : Poly :=
[
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2)]
]

/-- Partial product 125 for generator 8. -/
def ep_Q2_002_partial_08_0125 : Poly :=
[
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (13, 2)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (13, 2)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (13, 2)],
  term ((124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (14, 1)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (14, 2)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 8. -/
theorem ep_Q2_002_partial_08_0125_valid :
    mulPoly ep_Q2_002_coefficient_08_0125
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0126 : Poly :=
[
  term ((-905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (15, 2)]
]

/-- Partial product 126 for generator 8. -/
def ep_Q2_002_partial_08_0126 : Poly :=
[
  term ((1811646983641873990357007562973428037898784 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (15, 2)],
  term ((-905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (6, 1), (15, 2)],
  term ((-905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (6, 1), (15, 2)],
  term ((-1811646983641873990357007562973428037898784 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (14, 1), (15, 2)],
  term ((905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (14, 2), (15, 2)],
  term ((905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 8. -/
theorem ep_Q2_002_partial_08_0126_valid :
    mulPoly ep_Q2_002_coefficient_08_0126
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0127 : Poly :=
[
  term ((-40787556556 : Rat) / 7401317245) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 8. -/
def ep_Q2_002_partial_08_0127 : Poly :=
[
  term ((81575113112 : Rat) / 7401317245) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-40787556556 : Rat) / 7401317245) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-40787556556 : Rat) / 7401317245) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-81575113112 : Rat) / 7401317245) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 8. -/
theorem ep_Q2_002_partial_08_0127_valid :
    mulPoly ep_Q2_002_coefficient_08_0127
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0128 : Poly :=
[
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2)]
]

/-- Partial product 128 for generator 8. -/
def ep_Q2_002_partial_08_0128 : Poly :=
[
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (6, 2)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(0, 2), (6, 2)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(1, 2), (6, 2)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(6, 2), (14, 1)],
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (14, 2)],
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 8. -/
theorem ep_Q2_002_partial_08_0128_valid :
    mulPoly ep_Q2_002_coefficient_08_0128
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0129 : Poly :=
[
  term ((-1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 129 for generator 8. -/
def ep_Q2_002_partial_08_0129 : Poly :=
[
  term ((2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(0, 1), (7, 1), (8, 1), (11, 1)],
  term ((-1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((-1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((-2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (14, 2)],
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 8. -/
theorem ep_Q2_002_partial_08_0129_valid :
    mulPoly ep_Q2_002_coefficient_08_0129
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0130 : Poly :=
[
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 130 for generator 8. -/
def ep_Q2_002_partial_08_0130 : Poly :=
[
  term ((-4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 8. -/
theorem ep_Q2_002_partial_08_0130_valid :
    mulPoly ep_Q2_002_coefficient_08_0130
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0131 : Poly :=
[
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 131 for generator 8. -/
def ep_Q2_002_partial_08_0131 : Poly :=
[
  term ((101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((-101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 8. -/
theorem ep_Q2_002_partial_08_0131_valid :
    mulPoly ep_Q2_002_coefficient_08_0131
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0132 : Poly :=
[
  term ((105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 8. -/
def ep_Q2_002_partial_08_0132 : Poly :=
[
  term ((-211224456456 : Rat) / 7401317245) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((105612228228 : Rat) / 7401317245) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((105612228228 : Rat) / 7401317245) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((211224456456 : Rat) / 7401317245) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 8. -/
theorem ep_Q2_002_partial_08_0132_valid :
    mulPoly ep_Q2_002_coefficient_08_0132
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0133 : Poly :=
[
  term ((20931483686740793589002956865496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1)]
]

/-- Partial product 133 for generator 8. -/
def ep_Q2_002_partial_08_0133 : Poly :=
[
  term ((-41862967373481587178005913730992 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1)],
  term ((20931483686740793589002956865496 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (11, 1)],
  term ((20931483686740793589002956865496 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (11, 1)],
  term ((41862967373481587178005913730992 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 1)],
  term ((-20931483686740793589002956865496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 2)],
  term ((-20931483686740793589002956865496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 8. -/
theorem ep_Q2_002_partial_08_0133_valid :
    mulPoly ep_Q2_002_coefficient_08_0133
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0134 : Poly :=
[
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 134 for generator 8. -/
def ep_Q2_002_partial_08_0134 : Poly :=
[
  term ((-65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 8. -/
theorem ep_Q2_002_partial_08_0134_valid :
    mulPoly ep_Q2_002_coefficient_08_0134
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0135 : Poly :=
[
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 135 for generator 8. -/
def ep_Q2_002_partial_08_0135 : Poly :=
[
  term ((124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 8. -/
theorem ep_Q2_002_partial_08_0135_valid :
    mulPoly ep_Q2_002_coefficient_08_0135
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0136 : Poly :=
[
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 136 for generator 8. -/
def ep_Q2_002_partial_08_0136 : Poly :=
[
  term ((1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 8. -/
theorem ep_Q2_002_partial_08_0136_valid :
    mulPoly ep_Q2_002_coefficient_08_0136
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0137 : Poly :=
[
  term ((-46941632816 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 8. -/
def ep_Q2_002_partial_08_0137 : Poly :=
[
  term ((93883265632 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-93883265632 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 8. -/
theorem ep_Q2_002_partial_08_0137_valid :
    mulPoly ep_Q2_002_coefficient_08_0137
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0138 : Poly :=
[
  term ((-39417903658792152209899970593632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1)]
]

/-- Partial product 138 for generator 8. -/
def ep_Q2_002_partial_08_0138 : Poly :=
[
  term ((78835807317584304419799941187264 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)],
  term ((-39417903658792152209899970593632 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (13, 1)],
  term ((-39417903658792152209899970593632 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (13, 1)],
  term ((-78835807317584304419799941187264 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 1)],
  term ((39417903658792152209899970593632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 2)],
  term ((39417903658792152209899970593632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 8. -/
theorem ep_Q2_002_partial_08_0138_valid :
    mulPoly ep_Q2_002_coefficient_08_0138
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0139 : Poly :=
[
  term ((-545523045553894866987266846595408618339816 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 1)]
]

/-- Partial product 139 for generator 8. -/
def ep_Q2_002_partial_08_0139 : Poly :=
[
  term ((1091046091107789733974533693190817236679632 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)],
  term ((-545523045553894866987266846595408618339816 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (7, 1), (15, 1)],
  term ((-545523045553894866987266846595408618339816 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (7, 1), (15, 1)],
  term ((-1091046091107789733974533693190817236679632 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 1), (15, 1)],
  term ((545523045553894866987266846595408618339816 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 2), (15, 1)],
  term ((545523045553894866987266846595408618339816 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 8. -/
theorem ep_Q2_002_partial_08_0139_valid :
    mulPoly ep_Q2_002_coefficient_08_0139
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0140 : Poly :=
[
  term ((-27196854108 : Rat) / 7401317245) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 8. -/
def ep_Q2_002_partial_08_0140 : Poly :=
[
  term ((54393708216 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((-27196854108 : Rat) / 7401317245) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-27196854108 : Rat) / 7401317245) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-54393708216 : Rat) / 7401317245) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((27196854108 : Rat) / 7401317245) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((27196854108 : Rat) / 7401317245) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 8. -/
theorem ep_Q2_002_partial_08_0140_valid :
    mulPoly ep_Q2_002_coefficient_08_0140
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0141 : Poly :=
[
  term ((-4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2)]
]

/-- Partial product 141 for generator 8. -/
def ep_Q2_002_partial_08_0141 : Poly :=
[
  term ((9358997311311152291136 : Rat) / 253528477699481291099) [(0, 1), (7, 2)],
  term ((-4679498655655576145568 : Rat) / 253528477699481291099) [(0, 2), (7, 2)],
  term ((-4679498655655576145568 : Rat) / 253528477699481291099) [(1, 2), (7, 2)],
  term ((-9358997311311152291136 : Rat) / 253528477699481291099) [(7, 2), (14, 1)],
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (14, 2)],
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 8. -/
theorem ep_Q2_002_partial_08_0141_valid :
    mulPoly ep_Q2_002_coefficient_08_0141
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0142 : Poly :=
[
  term ((-10138642238570632892643537685224 : Rat) / 115799135485108289802725034287) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 142 for generator 8. -/
def ep_Q2_002_partial_08_0142 : Poly :=
[
  term ((20277284477141265785287075370448 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-10138642238570632892643537685224 : Rat) / 115799135485108289802725034287) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((-10138642238570632892643537685224 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((-20277284477141265785287075370448 : Rat) / 115799135485108289802725034287) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((10138642238570632892643537685224 : Rat) / 115799135485108289802725034287) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((10138642238570632892643537685224 : Rat) / 115799135485108289802725034287) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 8. -/
theorem ep_Q2_002_partial_08_0142_valid :
    mulPoly ep_Q2_002_coefficient_08_0142
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0143 : Poly :=
[
  term ((68770890992093601056648680303209731126016 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 143 for generator 8. -/
def ep_Q2_002_partial_08_0143 : Poly :=
[
  term ((-137541781984187202113297360606419462252032 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((68770890992093601056648680303209731126016 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((68770890992093601056648680303209731126016 : Rat) / 269363643504064505317229453910785233499) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((137541781984187202113297360606419462252032 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-68770890992093601056648680303209731126016 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-68770890992093601056648680303209731126016 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 8. -/
theorem ep_Q2_002_partial_08_0143_valid :
    mulPoly ep_Q2_002_coefficient_08_0143
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0144 : Poly :=
[
  term ((3496829982 : Rat) / 1480263449) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 144 for generator 8. -/
def ep_Q2_002_partial_08_0144 : Poly :=
[
  term ((-6993659964 : Rat) / 1480263449) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3496829982 : Rat) / 1480263449) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((3496829982 : Rat) / 1480263449) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((6993659964 : Rat) / 1480263449) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3496829982 : Rat) / 1480263449) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3496829982 : Rat) / 1480263449) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 8. -/
theorem ep_Q2_002_partial_08_0144_valid :
    mulPoly ep_Q2_002_coefficient_08_0144
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0145 : Poly :=
[
  term ((-21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2)]
]

/-- Partial product 145 for generator 8. -/
def ep_Q2_002_partial_08_0145 : Poly :=
[
  term ((42209821478619796110585439998384 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 2)],
  term ((-21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(0, 2), (8, 1), (11, 2)],
  term ((-21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (11, 2)],
  term ((-42209821478619796110585439998384 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (14, 1)],
  term ((21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (14, 2)],
  term ((21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 8. -/
theorem ep_Q2_002_partial_08_0145_valid :
    mulPoly ep_Q2_002_coefficient_08_0145
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0146 : Poly :=
[
  term ((-2354733684625543086414579258180324862728 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 146 for generator 8. -/
def ep_Q2_002_partial_08_0146 : Poly :=
[
  term ((4709467369251086172829158516360649725456 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-2354733684625543086414579258180324862728 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((-2354733684625543086414579258180324862728 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((-4709467369251086172829158516360649725456 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((2354733684625543086414579258180324862728 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((2354733684625543086414579258180324862728 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 8. -/
theorem ep_Q2_002_partial_08_0146_valid :
    mulPoly ep_Q2_002_coefficient_08_0146
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0147 : Poly :=
[
  term ((107260916676 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 8. -/
def ep_Q2_002_partial_08_0147 : Poly :=
[
  term ((-214521833352 : Rat) / 7401317245) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((107260916676 : Rat) / 7401317245) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((107260916676 : Rat) / 7401317245) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((214521833352 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-107260916676 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-107260916676 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 8. -/
theorem ep_Q2_002_partial_08_0147_valid :
    mulPoly ep_Q2_002_coefficient_08_0147
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0148 : Poly :=
[
  term ((284868917349435594119351763943776 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2)]
]

/-- Partial product 148 for generator 8. -/
def ep_Q2_002_partial_08_0148 : Poly :=
[
  term ((-569737834698871188238703527887552 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (13, 2)],
  term ((284868917349435594119351763943776 : Rat) / 1273790490336191187829975377157) [(0, 2), (8, 1), (13, 2)],
  term ((284868917349435594119351763943776 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (13, 2)],
  term ((569737834698871188238703527887552 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 1)],
  term ((-284868917349435594119351763943776 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 2)],
  term ((-284868917349435594119351763943776 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 8. -/
theorem ep_Q2_002_partial_08_0148_valid :
    mulPoly ep_Q2_002_coefficient_08_0148
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0149 : Poly :=
[
  term ((488417286136011034646576898458287097656896 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 2)]
]

/-- Partial product 149 for generator 8. -/
def ep_Q2_002_partial_08_0149 : Poly :=
[
  term ((-976834572272022069293153796916574195313792 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (15, 2)],
  term ((488417286136011034646576898458287097656896 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (8, 1), (15, 2)],
  term ((488417286136011034646576898458287097656896 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (8, 1), (15, 2)],
  term ((976834572272022069293153796916574195313792 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (14, 1), (15, 2)],
  term ((-488417286136011034646576898458287097656896 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (14, 2), (15, 2)],
  term ((-488417286136011034646576898458287097656896 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 8. -/
theorem ep_Q2_002_partial_08_0149_valid :
    mulPoly ep_Q2_002_coefficient_08_0149
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0150 : Poly :=
[
  term ((-116593558892 : Rat) / 7401317245) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 150 for generator 8. -/
def ep_Q2_002_partial_08_0150 : Poly :=
[
  term ((233187117784 : Rat) / 7401317245) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((-116593558892 : Rat) / 7401317245) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-116593558892 : Rat) / 7401317245) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-233187117784 : Rat) / 7401317245) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((116593558892 : Rat) / 7401317245) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((116593558892 : Rat) / 7401317245) [(8, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 8. -/
theorem ep_Q2_002_partial_08_0150_valid :
    mulPoly ep_Q2_002_coefficient_08_0150
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0151 : Poly :=
[
  term ((-25998544188625678650329722255764 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1)]
]

/-- Partial product 151 for generator 8. -/
def ep_Q2_002_partial_08_0151 : Poly :=
[
  term ((51997088377251357300659444511528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)],
  term ((-25998544188625678650329722255764 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (11, 1)],
  term ((-25998544188625678650329722255764 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (11, 1)],
  term ((-51997088377251357300659444511528 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1)],
  term ((25998544188625678650329722255764 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 2)],
  term ((25998544188625678650329722255764 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 8. -/
theorem ep_Q2_002_partial_08_0151_valid :
    mulPoly ep_Q2_002_coefficient_08_0151
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0152 : Poly :=
[
  term ((61517525202027945944089604465400 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 152 for generator 8. -/
def ep_Q2_002_partial_08_0152 : Poly :=
[
  term ((-123035050404055891888179208930800 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((61517525202027945944089604465400 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((61517525202027945944089604465400 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((123035050404055891888179208930800 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-61517525202027945944089604465400 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-61517525202027945944089604465400 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 8. -/
theorem ep_Q2_002_partial_08_0152_valid :
    mulPoly ep_Q2_002_coefficient_08_0152
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0153 : Poly :=
[
  term ((-115849020453190419448612209016800 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 153 for generator 8. -/
def ep_Q2_002_partial_08_0153 : Poly :=
[
  term ((231698040906380838897224418033600 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-115849020453190419448612209016800 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-115849020453190419448612209016800 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-231698040906380838897224418033600 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((115849020453190419448612209016800 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((115849020453190419448612209016800 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 8. -/
theorem ep_Q2_002_partial_08_0153_valid :
    mulPoly ep_Q2_002_coefficient_08_0153
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0154 : Poly :=
[
  term ((-879774126291778318938681916797157550682456 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 154 for generator 8. -/
def ep_Q2_002_partial_08_0154 : Poly :=
[
  term ((1759548252583556637877363833594315101364912 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-879774126291778318938681916797157550682456 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-879774126291778318938681916797157550682456 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-1759548252583556637877363833594315101364912 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((879774126291778318938681916797157550682456 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((879774126291778318938681916797157550682456 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 8. -/
theorem ep_Q2_002_partial_08_0154_valid :
    mulPoly ep_Q2_002_coefficient_08_0154
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0155 : Poly :=
[
  term ((-62518336968 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 155 for generator 8. -/
def ep_Q2_002_partial_08_0155 : Poly :=
[
  term ((125036673936 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62518336968 : Rat) / 7401317245) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-62518336968 : Rat) / 7401317245) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-125036673936 : Rat) / 7401317245) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((62518336968 : Rat) / 7401317245) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((62518336968 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 8. -/
theorem ep_Q2_002_partial_08_0155_valid :
    mulPoly ep_Q2_002_coefficient_08_0155
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0156 : Poly :=
[
  term ((48960127501390167632810066142288 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1)]
]

/-- Partial product 156 for generator 8. -/
def ep_Q2_002_partial_08_0156 : Poly :=
[
  term ((-97920255002780335265620132284576 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)],
  term ((48960127501390167632810066142288 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (13, 1)],
  term ((48960127501390167632810066142288 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (13, 1)],
  term ((97920255002780335265620132284576 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1)],
  term ((-48960127501390167632810066142288 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 2)],
  term ((-48960127501390167632810066142288 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 8. -/
theorem ep_Q2_002_partial_08_0156_valid :
    mulPoly ep_Q2_002_coefficient_08_0156
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0157 : Poly :=
[
  term ((395104469166655301169682390481770045249632 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 1)]
]

/-- Partial product 157 for generator 8. -/
def ep_Q2_002_partial_08_0157 : Poly :=
[
  term ((-790208938333310602339364780963540090499264 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (15, 1)],
  term ((395104469166655301169682390481770045249632 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (9, 1), (15, 1)],
  term ((395104469166655301169682390481770045249632 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (9, 1), (15, 1)],
  term ((790208938333310602339364780963540090499264 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 1), (15, 1)],
  term ((-395104469166655301169682390481770045249632 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 2), (15, 1)],
  term ((-395104469166655301169682390481770045249632 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 8. -/
theorem ep_Q2_002_partial_08_0157_valid :
    mulPoly ep_Q2_002_coefficient_08_0157
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0158 : Poly :=
[
  term ((27371851391 : Rat) / 7401317245) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 8. -/
def ep_Q2_002_partial_08_0158 : Poly :=
[
  term ((-54743702782 : Rat) / 7401317245) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((27371851391 : Rat) / 7401317245) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((27371851391 : Rat) / 7401317245) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((54743702782 : Rat) / 7401317245) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27371851391 : Rat) / 7401317245) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-27371851391 : Rat) / 7401317245) [(9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 8. -/
theorem ep_Q2_002_partial_08_0158_valid :
    mulPoly ep_Q2_002_coefficient_08_0158
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0159 : Poly :=
[
  term ((-140294430991312584380584209745488 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 159 for generator 8. -/
def ep_Q2_002_partial_08_0159 : Poly :=
[
  term ((280588861982625168761168419490976 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-140294430991312584380584209745488 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-140294430991312584380584209745488 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-280588861982625168761168419490976 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((140294430991312584380584209745488 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((140294430991312584380584209745488 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 8. -/
theorem ep_Q2_002_partial_08_0159_valid :
    mulPoly ep_Q2_002_coefficient_08_0159
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0160 : Poly :=
[
  term ((46471814729512020403898894539716909894552 : Rat) / 103601401347717117429703636119532782115) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 160 for generator 8. -/
def ep_Q2_002_partial_08_0160 : Poly :=
[
  term ((-92943629459024040807797789079433819789104 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((46471814729512020403898894539716909894552 : Rat) / 103601401347717117429703636119532782115) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((46471814729512020403898894539716909894552 : Rat) / 103601401347717117429703636119532782115) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((92943629459024040807797789079433819789104 : Rat) / 103601401347717117429703636119532782115) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-46471814729512020403898894539716909894552 : Rat) / 103601401347717117429703636119532782115) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-46471814729512020403898894539716909894552 : Rat) / 103601401347717117429703636119532782115) [(11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 8. -/
theorem ep_Q2_002_partial_08_0160_valid :
    mulPoly ep_Q2_002_coefficient_08_0160
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0161 : Poly :=
[
  term ((-8501816812 : Rat) / 7401317245) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 161 for generator 8. -/
def ep_Q2_002_partial_08_0161 : Poly :=
[
  term ((17003633624 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8501816812 : Rat) / 7401317245) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8501816812 : Rat) / 7401317245) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-17003633624 : Rat) / 7401317245) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8501816812 : Rat) / 7401317245) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((8501816812 : Rat) / 7401317245) [(11, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 8. -/
theorem ep_Q2_002_partial_08_0161_valid :
    mulPoly ep_Q2_002_coefficient_08_0161
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0162 : Poly :=
[
  term ((56593212290460130561641701358372 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1)]
]

/-- Partial product 162 for generator 8. -/
def ep_Q2_002_partial_08_0162 : Poly :=
[
  term ((-113186424580920261123283402716744 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)],
  term ((56593212290460130561641701358372 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (13, 1)],
  term ((56593212290460130561641701358372 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 1), (13, 1)],
  term ((113186424580920261123283402716744 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 1)],
  term ((-56593212290460130561641701358372 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 2)],
  term ((-56593212290460130561641701358372 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 8. -/
theorem ep_Q2_002_partial_08_0162_valid :
    mulPoly ep_Q2_002_coefficient_08_0162
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0163 : Poly :=
[
  term ((12805397894551341629731857062688 : Rat) / 1273790490336191187829975377157) [(11, 1), (15, 1)]
]

/-- Partial product 163 for generator 8. -/
def ep_Q2_002_partial_08_0163 : Poly :=
[
  term ((-25610795789102683259463714125376 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (15, 1)],
  term ((12805397894551341629731857062688 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (15, 1)],
  term ((12805397894551341629731857062688 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 1), (15, 1)],
  term ((25610795789102683259463714125376 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 1), (15, 1)],
  term ((-12805397894551341629731857062688 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 2), (15, 1)],
  term ((-12805397894551341629731857062688 : Rat) / 1273790490336191187829975377157) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 8. -/
theorem ep_Q2_002_partial_08_0163_valid :
    mulPoly ep_Q2_002_coefficient_08_0163
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0164 : Poly :=
[
  term ((-897902981776452063696606650916 : Rat) / 1273790490336191187829975377157) [(11, 2)]
]

/-- Partial product 164 for generator 8. -/
def ep_Q2_002_partial_08_0164 : Poly :=
[
  term ((1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)],
  term ((-897902981776452063696606650916 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2)],
  term ((-897902981776452063696606650916 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 2)],
  term ((-1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(11, 2), (14, 1)],
  term ((897902981776452063696606650916 : Rat) / 1273790490336191187829975377157) [(11, 2), (14, 2)],
  term ((897902981776452063696606650916 : Rat) / 1273790490336191187829975377157) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 8. -/
theorem ep_Q2_002_partial_08_0164_valid :
    mulPoly ep_Q2_002_coefficient_08_0164
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0165 : Poly :=
[
  term ((40379810084473554648102388295952 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1)]
]

/-- Partial product 165 for generator 8. -/
def ep_Q2_002_partial_08_0165 : Poly :=
[
  term ((-80759620168947109296204776591904 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1)],
  term ((40379810084473554648102388295952 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2), (12, 1)],
  term ((40379810084473554648102388295952 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 2), (12, 1)],
  term ((80759620168947109296204776591904 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (14, 1)],
  term ((-40379810084473554648102388295952 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (14, 2)],
  term ((-40379810084473554648102388295952 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 8. -/
theorem ep_Q2_002_partial_08_0165_valid :
    mulPoly ep_Q2_002_coefficient_08_0165
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0166 : Poly :=
[
  term ((-56387389870705844113631655943731221021832 : Rat) / 122438019774574775144195206323084197045) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 166 for generator 8. -/
def ep_Q2_002_partial_08_0166 : Poly :=
[
  term ((112774779741411688227263311887462442043664 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-56387389870705844113631655943731221021832 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-56387389870705844113631655943731221021832 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-112774779741411688227263311887462442043664 : Rat) / 122438019774574775144195206323084197045) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((56387389870705844113631655943731221021832 : Rat) / 122438019774574775144195206323084197045) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((56387389870705844113631655943731221021832 : Rat) / 122438019774574775144195206323084197045) [(12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 8. -/
theorem ep_Q2_002_partial_08_0166_valid :
    mulPoly ep_Q2_002_coefficient_08_0166
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0167 : Poly :=
[
  term ((27101504254 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 8. -/
def ep_Q2_002_partial_08_0167 : Poly :=
[
  term ((-54203008508 : Rat) / 7401317245) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((27101504254 : Rat) / 7401317245) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((27101504254 : Rat) / 7401317245) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((54203008508 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-27101504254 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-27101504254 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 8. -/
theorem ep_Q2_002_partial_08_0167_valid :
    mulPoly ep_Q2_002_coefficient_08_0167
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0168 : Poly :=
[
  term ((120997958401550069736558204207168 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2)]
]

/-- Partial product 168 for generator 8. -/
def ep_Q2_002_partial_08_0168 : Poly :=
[
  term ((-241995916803100139473116408414336 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 2)],
  term ((120997958401550069736558204207168 : Rat) / 1273790490336191187829975377157) [(0, 2), (12, 1), (13, 2)],
  term ((120997958401550069736558204207168 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (13, 2)],
  term ((241995916803100139473116408414336 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 1)],
  term ((-120997958401550069736558204207168 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 2)],
  term ((-120997958401550069736558204207168 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 8. -/
theorem ep_Q2_002_partial_08_0168_valid :
    mulPoly ep_Q2_002_coefficient_08_0168
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0169 : Poly :=
[
  term ((822223127698390281004560246128828286339468 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 2)]
]

/-- Partial product 169 for generator 8. -/
def ep_Q2_002_partial_08_0169 : Poly :=
[
  term ((-1644446255396780562009120492257656572678936 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)],
  term ((822223127698390281004560246128828286339468 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (12, 1), (15, 2)],
  term ((822223127698390281004560246128828286339468 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (12, 1), (15, 2)],
  term ((1644446255396780562009120492257656572678936 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (14, 1), (15, 2)],
  term ((-822223127698390281004560246128828286339468 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (14, 2), (15, 2)],
  term ((-822223127698390281004560246128828286339468 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 8. -/
theorem ep_Q2_002_partial_08_0169_valid :
    mulPoly ep_Q2_002_coefficient_08_0169
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0170 : Poly :=
[
  term ((33769756189 : Rat) / 7401317245) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 170 for generator 8. -/
def ep_Q2_002_partial_08_0170 : Poly :=
[
  term ((-67539512378 : Rat) / 7401317245) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((33769756189 : Rat) / 7401317245) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((33769756189 : Rat) / 7401317245) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((67539512378 : Rat) / 7401317245) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-33769756189 : Rat) / 7401317245) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-33769756189 : Rat) / 7401317245) [(12, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 8. -/
theorem ep_Q2_002_partial_08_0170_valid :
    mulPoly ep_Q2_002_coefficient_08_0170
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0171 : Poly :=
[
  term ((48661317825845482717027550239244666458482 : Rat) / 269363643504064505317229453910785233499) [(13, 1), (15, 1)]
]

/-- Partial product 171 for generator 8. -/
def ep_Q2_002_partial_08_0171 : Poly :=
[
  term ((-97322635651690965434055100478489332916964 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (13, 1), (15, 1)],
  term ((48661317825845482717027550239244666458482 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (13, 1), (15, 1)],
  term ((48661317825845482717027550239244666458482 : Rat) / 269363643504064505317229453910785233499) [(1, 2), (13, 1), (15, 1)],
  term ((97322635651690965434055100478489332916964 : Rat) / 269363643504064505317229453910785233499) [(13, 1), (14, 1), (15, 1)],
  term ((-48661317825845482717027550239244666458482 : Rat) / 269363643504064505317229453910785233499) [(13, 1), (14, 2), (15, 1)],
  term ((-48661317825845482717027550239244666458482 : Rat) / 269363643504064505317229453910785233499) [(13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 8. -/
theorem ep_Q2_002_partial_08_0171_valid :
    mulPoly ep_Q2_002_coefficient_08_0171
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0172 : Poly :=
[
  term ((-11633807837 : Rat) / 2960526898) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 8. -/
def ep_Q2_002_partial_08_0172 : Poly :=
[
  term ((11633807837 : Rat) / 1480263449) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11633807837 : Rat) / 2960526898) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11633807837 : Rat) / 2960526898) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-11633807837 : Rat) / 1480263449) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((11633807837 : Rat) / 2960526898) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((11633807837 : Rat) / 2960526898) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 8. -/
theorem ep_Q2_002_partial_08_0172_valid :
    mulPoly ep_Q2_002_coefficient_08_0172
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0173 : Poly :=
[
  term ((-103391299038626409514545508741200 : Rat) / 1273790490336191187829975377157) [(13, 2)]
]

/-- Partial product 173 for generator 8. -/
def ep_Q2_002_partial_08_0173 : Poly :=
[
  term ((206782598077252819029091017482400 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)],
  term ((-103391299038626409514545508741200 : Rat) / 1273790490336191187829975377157) [(0, 2), (13, 2)],
  term ((-103391299038626409514545508741200 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2)],
  term ((-206782598077252819029091017482400 : Rat) / 1273790490336191187829975377157) [(13, 2), (14, 1)],
  term ((103391299038626409514545508741200 : Rat) / 1273790490336191187829975377157) [(13, 2), (14, 2)],
  term ((103391299038626409514545508741200 : Rat) / 1273790490336191187829975377157) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 8. -/
theorem ep_Q2_002_partial_08_0173_valid :
    mulPoly ep_Q2_002_coefficient_08_0173
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0174 : Poly :=
[
  term ((896215980080858256230854440871961266311348 : Rat) / 1346818217520322526586147269553926167495) [(15, 2)]
]

/-- Partial product 174 for generator 8. -/
def ep_Q2_002_partial_08_0174 : Poly :=
[
  term ((-1792431960161716512461708881743922532622696 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)],
  term ((896215980080858256230854440871961266311348 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 2)],
  term ((896215980080858256230854440871961266311348 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (15, 2)],
  term ((1792431960161716512461708881743922532622696 : Rat) / 1346818217520322526586147269553926167495) [(14, 1), (15, 2)],
  term ((-896215980080858256230854440871961266311348 : Rat) / 1346818217520322526586147269553926167495) [(14, 2), (15, 2)],
  term ((-896215980080858256230854440871961266311348 : Rat) / 1346818217520322526586147269553926167495) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 8. -/
theorem ep_Q2_002_partial_08_0174_valid :
    mulPoly ep_Q2_002_coefficient_08_0174
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 8. -/
def ep_Q2_002_coefficient_08_0175 : Poly :=
[
  term ((13706823064 : Rat) / 7401317245) [(15, 2), (16, 1)]
]

/-- Partial product 175 for generator 8. -/
def ep_Q2_002_partial_08_0175 : Poly :=
[
  term ((-27413646128 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)],
  term ((13706823064 : Rat) / 7401317245) [(0, 2), (15, 2), (16, 1)],
  term ((13706823064 : Rat) / 7401317245) [(1, 2), (15, 2), (16, 1)],
  term ((27413646128 : Rat) / 7401317245) [(14, 1), (15, 2), (16, 1)],
  term ((-13706823064 : Rat) / 7401317245) [(14, 2), (15, 2), (16, 1)],
  term ((-13706823064 : Rat) / 7401317245) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 8. -/
theorem ep_Q2_002_partial_08_0175_valid :
    mulPoly ep_Q2_002_coefficient_08_0175
        ep_Q2_002_generator_08_0100_0175 =
      ep_Q2_002_partial_08_0175 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_08_0100_0175 : List Poly :=
[
  ep_Q2_002_partial_08_0100,
  ep_Q2_002_partial_08_0101,
  ep_Q2_002_partial_08_0102,
  ep_Q2_002_partial_08_0103,
  ep_Q2_002_partial_08_0104,
  ep_Q2_002_partial_08_0105,
  ep_Q2_002_partial_08_0106,
  ep_Q2_002_partial_08_0107,
  ep_Q2_002_partial_08_0108,
  ep_Q2_002_partial_08_0109,
  ep_Q2_002_partial_08_0110,
  ep_Q2_002_partial_08_0111,
  ep_Q2_002_partial_08_0112,
  ep_Q2_002_partial_08_0113,
  ep_Q2_002_partial_08_0114,
  ep_Q2_002_partial_08_0115,
  ep_Q2_002_partial_08_0116,
  ep_Q2_002_partial_08_0117,
  ep_Q2_002_partial_08_0118,
  ep_Q2_002_partial_08_0119,
  ep_Q2_002_partial_08_0120,
  ep_Q2_002_partial_08_0121,
  ep_Q2_002_partial_08_0122,
  ep_Q2_002_partial_08_0123,
  ep_Q2_002_partial_08_0124,
  ep_Q2_002_partial_08_0125,
  ep_Q2_002_partial_08_0126,
  ep_Q2_002_partial_08_0127,
  ep_Q2_002_partial_08_0128,
  ep_Q2_002_partial_08_0129,
  ep_Q2_002_partial_08_0130,
  ep_Q2_002_partial_08_0131,
  ep_Q2_002_partial_08_0132,
  ep_Q2_002_partial_08_0133,
  ep_Q2_002_partial_08_0134,
  ep_Q2_002_partial_08_0135,
  ep_Q2_002_partial_08_0136,
  ep_Q2_002_partial_08_0137,
  ep_Q2_002_partial_08_0138,
  ep_Q2_002_partial_08_0139,
  ep_Q2_002_partial_08_0140,
  ep_Q2_002_partial_08_0141,
  ep_Q2_002_partial_08_0142,
  ep_Q2_002_partial_08_0143,
  ep_Q2_002_partial_08_0144,
  ep_Q2_002_partial_08_0145,
  ep_Q2_002_partial_08_0146,
  ep_Q2_002_partial_08_0147,
  ep_Q2_002_partial_08_0148,
  ep_Q2_002_partial_08_0149,
  ep_Q2_002_partial_08_0150,
  ep_Q2_002_partial_08_0151,
  ep_Q2_002_partial_08_0152,
  ep_Q2_002_partial_08_0153,
  ep_Q2_002_partial_08_0154,
  ep_Q2_002_partial_08_0155,
  ep_Q2_002_partial_08_0156,
  ep_Q2_002_partial_08_0157,
  ep_Q2_002_partial_08_0158,
  ep_Q2_002_partial_08_0159,
  ep_Q2_002_partial_08_0160,
  ep_Q2_002_partial_08_0161,
  ep_Q2_002_partial_08_0162,
  ep_Q2_002_partial_08_0163,
  ep_Q2_002_partial_08_0164,
  ep_Q2_002_partial_08_0165,
  ep_Q2_002_partial_08_0166,
  ep_Q2_002_partial_08_0167,
  ep_Q2_002_partial_08_0168,
  ep_Q2_002_partial_08_0169,
  ep_Q2_002_partial_08_0170,
  ep_Q2_002_partial_08_0171,
  ep_Q2_002_partial_08_0172,
  ep_Q2_002_partial_08_0173,
  ep_Q2_002_partial_08_0174,
  ep_Q2_002_partial_08_0175
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_08_0100_0175 : Poly :=
[
  term ((148941511250536434420646795241810478412992 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (6, 1), (15, 1)],
  term ((-28609778424 : Rat) / 7401317245) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((428740190263229965133057048592 : Rat) / 115799135485108289802725034287) [(0, 1), (5, 1), (8, 1), (11, 1)],
  term ((-807398069213491711065167206464 : Rat) / 115799135485108289802725034287) [(0, 1), (5, 1), (8, 1), (13, 1)],
  term ((8200356739168753857774872701486155698928 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (5, 1), (8, 1), (15, 1)],
  term ((-439301136 : Rat) / 7401317245) [(0, 1), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-141564166126548392915325139135032 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1)],
  term ((-3978200774259065087035758533952 : Rat) / 97983883872014706756151952089) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((7491697062755763089666736739584 : Rat) / 97983883872014706756151952089) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((-125885309633562698631061821741056306724576 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-9944602184 : Rat) / 7401317245) [(0, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((266591835792716793091598635678944 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1)],
  term ((-678029588552135153296398579836366235341808 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (5, 1), (15, 1)],
  term ((72296006126 : Rat) / 7401317245) [(0, 1), (5, 1), (15, 1), (16, 1)],
  term ((-22997560084163800273152 : Rat) / 253528477699481291099) [(0, 1), (6, 1)],
  term ((-117888285289794172374511458562464 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((222005718352250892137002947458688 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (9, 1), (13, 1)],
  term ((1694617680560298153396602698087297615544832 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((122493044056 : Rat) / 7401317245) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-94125696906310286362004722185792 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 1), (13, 1)],
  term ((-356236361693086010440111043058386324423712 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-9000423928 : Rat) / 1057331035) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (11, 2)],
  term ((-1743457325109803996962474839627231477914304 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-93883265632 : Rat) / 7401317245) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(0, 1), (6, 1), (13, 2)],
  term ((1811646983641873990357007562973428037898784 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (6, 1), (15, 2)],
  term ((81575113112 : Rat) / 7401317245) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 1), (6, 2)],
  term ((2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(0, 1), (7, 1), (8, 1), (11, 1)],
  term ((-4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(0, 1), (7, 1), (8, 1), (13, 1)],
  term ((101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((-211224456456 : Rat) / 7401317245) [(0, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-41862967373481587178005913730992 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1)],
  term ((-65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((93883265632 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((78835807317584304419799941187264 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)],
  term ((1091046091107789733974533693190817236679632 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)],
  term ((54393708216 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)],
  term ((9358997311311152291136 : Rat) / 253528477699481291099) [(0, 1), (7, 2)],
  term ((20277284477141265785287075370448 : Rat) / 115799135485108289802725034287) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-137541781984187202113297360606419462252032 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((-6993659964 : Rat) / 1480263449) [(0, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((42209821478619796110585439998384 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (11, 2)],
  term ((4709467369251086172829158516360649725456 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-214521833352 : Rat) / 7401317245) [(0, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-569737834698871188238703527887552 : Rat) / 1273790490336191187829975377157) [(0, 1), (8, 1), (13, 2)],
  term ((-976834572272022069293153796916574195313792 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (8, 1), (15, 2)],
  term ((233187117784 : Rat) / 7401317245) [(0, 1), (8, 1), (15, 2), (16, 1)],
  term ((51997088377251357300659444511528 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)],
  term ((-123035050404055891888179208930800 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((231698040906380838897224418033600 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((1759548252583556637877363833594315101364912 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((125036673936 : Rat) / 7401317245) [(0, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-97920255002780335265620132284576 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)],
  term ((-790208938333310602339364780963540090499264 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (15, 1)],
  term ((-54743702782 : Rat) / 7401317245) [(0, 1), (9, 1), (15, 1), (16, 1)],
  term ((280588861982625168761168419490976 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-92943629459024040807797789079433819789104 : Rat) / 103601401347717117429703636119532782115) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((17003633624 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-113186424580920261123283402716744 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)],
  term ((-25610795789102683259463714125376 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (15, 1)],
  term ((1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)],
  term ((-80759620168947109296204776591904 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1)],
  term ((112774779741411688227263311887462442043664 : Rat) / 122438019774574775144195206323084197045) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-54203008508 : Rat) / 7401317245) [(0, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-241995916803100139473116408414336 : Rat) / 1273790490336191187829975377157) [(0, 1), (12, 1), (13, 2)],
  term ((-1644446255396780562009120492257656572678936 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (12, 1), (15, 2)],
  term ((-67539512378 : Rat) / 7401317245) [(0, 1), (12, 1), (15, 2), (16, 1)],
  term ((-97322635651690965434055100478489332916964 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (13, 1), (15, 1)],
  term ((11633807837 : Rat) / 1480263449) [(0, 1), (13, 1), (15, 1), (16, 1)],
  term ((206782598077252819029091017482400 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)],
  term ((-1792431960161716512461708881743922532622696 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)],
  term ((-27413646128 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)],
  term ((-74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (6, 1), (15, 1)],
  term ((14304889212 : Rat) / 7401317245) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(0, 2), (5, 1), (8, 1), (11, 1)],
  term ((403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(0, 2), (5, 1), (8, 1), (13, 1)],
  term ((-4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (5, 1), (8, 1), (15, 1)],
  term ((219650568 : Rat) / 7401317245) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((70782083063274196457662569567516 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (11, 1)],
  term ((1989100387129532543517879266976 : Rat) / 97983883872014706756151952089) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((-3745848531377881544833368369792 : Rat) / 97983883872014706756151952089) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((62942654816781349315530910870528153362288 : Rat) / 103601401347717117429703636119532782115) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((4972301092 : Rat) / 7401317245) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-133295917896358396545799317839472 : Rat) / 1273790490336191187829975377157) [(0, 2), (5, 1), (13, 1)],
  term ((339014794276067576648199289918183117670904 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (5, 1), (15, 1)],
  term ((-36148003063 : Rat) / 7401317245) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(0, 2), (6, 1)],
  term ((58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (9, 1), (11, 1)],
  term ((-111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (9, 1), (13, 1)],
  term ((-847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (6, 1), (9, 1), (15, 1)],
  term ((-61246522028 : Rat) / 7401317245) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((47062848453155143181002361092896 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (11, 1), (13, 1)],
  term ((178118180846543005220055521529193162211856 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (6, 1), (11, 1), (15, 1)],
  term ((4500211964 : Rat) / 1057331035) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (11, 2)],
  term ((871728662554901998481237419813615738957152 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (6, 1), (13, 1), (15, 1)],
  term ((46941632816 : Rat) / 7401317245) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(0, 2), (6, 1), (13, 2)],
  term ((-905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (6, 1), (15, 2)],
  term ((-40787556556 : Rat) / 7401317245) [(0, 2), (6, 1), (15, 2), (16, 1)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(0, 2), (6, 2)],
  term ((-1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(0, 2), (7, 1), (8, 1), (11, 1)],
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(0, 2), (7, 1), (8, 1), (13, 1)],
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (7, 1), (8, 1), (15, 1)],
  term ((105612228228 : Rat) / 7401317245) [(0, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((20931483686740793589002956865496 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (11, 1)],
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(0, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39417903658792152209899970593632 : Rat) / 1273790490336191187829975377157) [(0, 2), (7, 1), (13, 1)],
  term ((-545523045553894866987266846595408618339816 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (7, 1), (15, 1)],
  term ((-27196854108 : Rat) / 7401317245) [(0, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4679498655655576145568 : Rat) / 253528477699481291099) [(0, 2), (7, 2)],
  term ((-10138642238570632892643537685224 : Rat) / 115799135485108289802725034287) [(0, 2), (8, 1), (11, 1), (13, 1)],
  term ((68770890992093601056648680303209731126016 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (8, 1), (11, 1), (15, 1)],
  term ((3496829982 : Rat) / 1480263449) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(0, 2), (8, 1), (11, 2)],
  term ((-2354733684625543086414579258180324862728 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (8, 1), (13, 1), (15, 1)],
  term ((107260916676 : Rat) / 7401317245) [(0, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((284868917349435594119351763943776 : Rat) / 1273790490336191187829975377157) [(0, 2), (8, 1), (13, 2)],
  term ((488417286136011034646576898458287097656896 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (8, 1), (15, 2)],
  term ((-116593558892 : Rat) / 7401317245) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-25998544188625678650329722255764 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (11, 1)],
  term ((61517525202027945944089604465400 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((-115849020453190419448612209016800 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-879774126291778318938681916797157550682456 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-62518336968 : Rat) / 7401317245) [(0, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((48960127501390167632810066142288 : Rat) / 1273790490336191187829975377157) [(0, 2), (9, 1), (13, 1)],
  term ((395104469166655301169682390481770045249632 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (9, 1), (15, 1)],
  term ((27371851391 : Rat) / 7401317245) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-140294430991312584380584209745488 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((46471814729512020403898894539716909894552 : Rat) / 103601401347717117429703636119532782115) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-8501816812 : Rat) / 7401317245) [(0, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((56593212290460130561641701358372 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (13, 1)],
  term ((12805397894551341629731857062688 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 1), (15, 1)],
  term ((-897902981776452063696606650916 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2)],
  term ((40379810084473554648102388295952 : Rat) / 1273790490336191187829975377157) [(0, 2), (11, 2), (12, 1)],
  term ((-56387389870705844113631655943731221021832 : Rat) / 122438019774574775144195206323084197045) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((27101504254 : Rat) / 7401317245) [(0, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((120997958401550069736558204207168 : Rat) / 1273790490336191187829975377157) [(0, 2), (12, 1), (13, 2)],
  term ((822223127698390281004560246128828286339468 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (12, 1), (15, 2)],
  term ((33769756189 : Rat) / 7401317245) [(0, 2), (12, 1), (15, 2), (16, 1)],
  term ((48661317825845482717027550239244666458482 : Rat) / 269363643504064505317229453910785233499) [(0, 2), (13, 1), (15, 1)],
  term ((-11633807837 : Rat) / 2960526898) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-103391299038626409514545508741200 : Rat) / 1273790490336191187829975377157) [(0, 2), (13, 2)],
  term ((896215980080858256230854440871961266311348 : Rat) / 1346818217520322526586147269553926167495) [(0, 2), (15, 2)],
  term ((13706823064 : Rat) / 7401317245) [(0, 2), (15, 2), (16, 1)],
  term ((-74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (5, 1), (6, 1), (15, 1)],
  term ((14304889212 : Rat) / 7401317245) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(1, 2), (5, 1), (8, 1), (11, 1)],
  term ((403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(1, 2), (5, 1), (8, 1), (13, 1)],
  term ((-4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (5, 1), (8, 1), (15, 1)],
  term ((219650568 : Rat) / 7401317245) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((70782083063274196457662569567516 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (11, 1)],
  term ((1989100387129532543517879266976 : Rat) / 97983883872014706756151952089) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((-3745848531377881544833368369792 : Rat) / 97983883872014706756151952089) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((62942654816781349315530910870528153362288 : Rat) / 103601401347717117429703636119532782115) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((4972301092 : Rat) / 7401317245) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-133295917896358396545799317839472 : Rat) / 1273790490336191187829975377157) [(1, 2), (5, 1), (13, 1)],
  term ((339014794276067576648199289918183117670904 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (5, 1), (15, 1)],
  term ((-36148003063 : Rat) / 7401317245) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((11498780042081900136576 : Rat) / 253528477699481291099) [(1, 2), (6, 1)],
  term ((58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (9, 1), (11, 1)],
  term ((-111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (9, 1), (13, 1)],
  term ((-847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (6, 1), (9, 1), (15, 1)],
  term ((-61246522028 : Rat) / 7401317245) [(1, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((47062848453155143181002361092896 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 1), (13, 1)],
  term ((178118180846543005220055521529193162211856 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (6, 1), (11, 1), (15, 1)],
  term ((4500211964 : Rat) / 1057331035) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (11, 2)],
  term ((871728662554901998481237419813615738957152 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (6, 1), (13, 1), (15, 1)],
  term ((46941632816 : Rat) / 7401317245) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(1, 2), (6, 1), (13, 2)],
  term ((-905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (6, 1), (15, 2)],
  term ((-40787556556 : Rat) / 7401317245) [(1, 2), (6, 1), (15, 2), (16, 1)],
  term ((-5749390021040950068288 : Rat) / 253528477699481291099) [(1, 2), (6, 2)],
  term ((-1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(1, 2), (7, 1), (8, 1), (11, 1)],
  term ((2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(1, 2), (7, 1), (8, 1), (13, 1)],
  term ((-50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (7, 1), (8, 1), (15, 1)],
  term ((105612228228 : Rat) / 7401317245) [(1, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((20931483686740793589002956865496 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (11, 1)],
  term ((32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((-921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(1, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-39417903658792152209899970593632 : Rat) / 1273790490336191187829975377157) [(1, 2), (7, 1), (13, 1)],
  term ((-545523045553894866987266846595408618339816 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (7, 1), (15, 1)],
  term ((-27196854108 : Rat) / 7401317245) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((-4679498655655576145568 : Rat) / 253528477699481291099) [(1, 2), (7, 2)],
  term ((-10138642238570632892643537685224 : Rat) / 115799135485108289802725034287) [(1, 2), (8, 1), (11, 1), (13, 1)],
  term ((68770890992093601056648680303209731126016 : Rat) / 269363643504064505317229453910785233499) [(1, 2), (8, 1), (11, 1), (15, 1)],
  term ((3496829982 : Rat) / 1480263449) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (11, 2)],
  term ((-2354733684625543086414579258180324862728 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (8, 1), (13, 1), (15, 1)],
  term ((107260916676 : Rat) / 7401317245) [(1, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((284868917349435594119351763943776 : Rat) / 1273790490336191187829975377157) [(1, 2), (8, 1), (13, 2)],
  term ((488417286136011034646576898458287097656896 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (8, 1), (15, 2)],
  term ((-116593558892 : Rat) / 7401317245) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-25998544188625678650329722255764 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (11, 1)],
  term ((61517525202027945944089604465400 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-115849020453190419448612209016800 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((-879774126291778318938681916797157550682456 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((-62518336968 : Rat) / 7401317245) [(1, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((48960127501390167632810066142288 : Rat) / 1273790490336191187829975377157) [(1, 2), (9, 1), (13, 1)],
  term ((395104469166655301169682390481770045249632 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (9, 1), (15, 1)],
  term ((27371851391 : Rat) / 7401317245) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-140294430991312584380584209745488 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((46471814729512020403898894539716909894552 : Rat) / 103601401347717117429703636119532782115) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-8501816812 : Rat) / 7401317245) [(1, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((56593212290460130561641701358372 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 1), (13, 1)],
  term ((12805397894551341629731857062688 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 1), (15, 1)],
  term ((-897902981776452063696606650916 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 2)],
  term ((40379810084473554648102388295952 : Rat) / 1273790490336191187829975377157) [(1, 2), (11, 2), (12, 1)],
  term ((-56387389870705844113631655943731221021832 : Rat) / 122438019774574775144195206323084197045) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((27101504254 : Rat) / 7401317245) [(1, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((120997958401550069736558204207168 : Rat) / 1273790490336191187829975377157) [(1, 2), (12, 1), (13, 2)],
  term ((822223127698390281004560246128828286339468 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (12, 1), (15, 2)],
  term ((33769756189 : Rat) / 7401317245) [(1, 2), (12, 1), (15, 2), (16, 1)],
  term ((48661317825845482717027550239244666458482 : Rat) / 269363643504064505317229453910785233499) [(1, 2), (13, 1), (15, 1)],
  term ((-11633807837 : Rat) / 2960526898) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((-103391299038626409514545508741200 : Rat) / 1273790490336191187829975377157) [(1, 2), (13, 2)],
  term ((896215980080858256230854440871961266311348 : Rat) / 1346818217520322526586147269553926167495) [(1, 2), (15, 2)],
  term ((13706823064 : Rat) / 7401317245) [(1, 2), (15, 2), (16, 1)],
  term ((-148941511250536434420646795241810478412992 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (14, 1), (15, 1)],
  term ((28609778424 : Rat) / 7401317245) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (14, 2), (15, 1)],
  term ((-14304889212 : Rat) / 7401317245) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((74470755625268217210323397620905239206496 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (6, 1), (15, 3)],
  term ((-14304889212 : Rat) / 7401317245) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((-428740190263229965133057048592 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (11, 1), (14, 1)],
  term ((214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (11, 1), (14, 2)],
  term ((214370095131614982566528524296 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (11, 1), (15, 2)],
  term ((807398069213491711065167206464 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (13, 1), (14, 1)],
  term ((-403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (13, 1), (14, 2)],
  term ((-403699034606745855532583603232 : Rat) / 115799135485108289802725034287) [(5, 1), (8, 1), (13, 1), (15, 2)],
  term ((-8200356739168753857774872701486155698928 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (8, 1), (14, 1), (15, 1)],
  term ((439301136 : Rat) / 7401317245) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (8, 1), (14, 2), (15, 1)],
  term ((-219650568 : Rat) / 7401317245) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((4100178369584376928887436350743077849464 : Rat) / 122438019774574775144195206323084197045) [(5, 1), (8, 1), (15, 3)],
  term ((-219650568 : Rat) / 7401317245) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((3978200774259065087035758533952 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1989100387129532543517879266976 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-1989100387129532543517879266976 : Rat) / 97983883872014706756151952089) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((141564166126548392915325139135032 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 1)],
  term ((-70782083063274196457662569567516 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 2)],
  term ((-70782083063274196457662569567516 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (15, 2)],
  term ((-7491697062755763089666736739584 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((3745848531377881544833368369792 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((3745848531377881544833368369792 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((125885309633562698631061821741056306724576 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((9944602184 : Rat) / 7401317245) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-62942654816781349315530910870528153362288 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4972301092 : Rat) / 7401317245) [(5, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-62942654816781349315530910870528153362288 : Rat) / 103601401347717117429703636119532782115) [(5, 1), (12, 1), (15, 3)],
  term ((-4972301092 : Rat) / 7401317245) [(5, 1), (12, 1), (15, 3), (16, 1)],
  term ((-266591835792716793091598635678944 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 1)],
  term ((133295917896358396545799317839472 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 2)],
  term ((133295917896358396545799317839472 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (15, 2)],
  term ((678029588552135153296398579836366235341808 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 1), (15, 1)],
  term ((-72296006126 : Rat) / 7401317245) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-339014794276067576648199289918183117670904 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 2), (15, 1)],
  term ((36148003063 : Rat) / 7401317245) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-339014794276067576648199289918183117670904 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 3)],
  term ((36148003063 : Rat) / 7401317245) [(5, 1), (15, 3), (16, 1)],
  term ((117888285289794172374511458562464 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (14, 2)],
  term ((-58944142644897086187255729281232 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-222005718352250892137002947458688 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1), (14, 1)],
  term ((111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1), (14, 2)],
  term ((111002859176125446068501473729344 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1694617680560298153396602698087297615544832 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-122493044056 : Rat) / 7401317245) [(6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (14, 2), (15, 1)],
  term ((61246522028 : Rat) / 7401317245) [(6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((847308840280149076698301349043648807772416 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (15, 3)],
  term ((61246522028 : Rat) / 7401317245) [(6, 1), (9, 1), (15, 3), (16, 1)],
  term ((94125696906310286362004722185792 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-47062848453155143181002361092896 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (14, 2)],
  term ((-47062848453155143181002361092896 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((356236361693086010440111043058386324423712 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((9000423928 : Rat) / 1057331035) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-178118180846543005220055521529193162211856 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((-4500211964 : Rat) / 1057331035) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-178118180846543005220055521529193162211856 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 3)],
  term ((-4500211964 : Rat) / 1057331035) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-84956569022962595331484164002880 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (14, 1)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (14, 2)],
  term ((42478284511481297665742082001440 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (15, 2)],
  term ((1743457325109803996962474839627231477914304 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((93883265632 : Rat) / 7401317245) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-871728662554901998481237419813615738957152 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-46941632816 : Rat) / 7401317245) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-871728662554901998481237419813615738957152 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (15, 3)],
  term ((-46941632816 : Rat) / 7401317245) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (14, 1)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (14, 2)],
  term ((-62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (15, 2)],
  term ((22997560084163800273152 : Rat) / 253528477699481291099) [(6, 1), (14, 1)],
  term ((-1811646983641873990357007562973428037898784 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (14, 1), (15, 2)],
  term ((-81575113112 : Rat) / 7401317245) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(6, 1), (14, 2)],
  term ((905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (14, 2), (15, 2)],
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(6, 1), (15, 2)],
  term ((905823491820936995178503781486714018949392 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (15, 4)],
  term ((40787556556 : Rat) / 7401317245) [(6, 1), (15, 4), (16, 1)],
  term ((-11498780042081900136576 : Rat) / 253528477699481291099) [(6, 2), (14, 1)],
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (14, 2)],
  term ((5749390021040950068288 : Rat) / 253528477699481291099) [(6, 2), (15, 2)],
  term ((-2646039613649392990272166435008 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (14, 2)],
  term ((1323019806824696495136083217504 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((4982988121107241377708512084736 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((-2491494060553620688854256042368 : Rat) / 8907625806546791523286541099) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-101847982213360759083310271207317145820768 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((211224456456 : Rat) / 7401317245) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((50923991106680379541655135603658572910384 : Rat) / 122438019774574775144195206323084197045) [(7, 1), (8, 1), (15, 3)],
  term ((-105612228228 : Rat) / 7401317245) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((65863432533663154086054589119168 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-32931716266831577043027294559584 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((41862967373481587178005913730992 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 1)],
  term ((-20931483686740793589002956865496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (14, 2)],
  term ((-20931483686740793589002956865496 : Rat) / 1273790490336191187829975377157) [(7, 1), (11, 1), (15, 2)],
  term ((-124033177824554903377887272307456 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((62016588912277451688943636153728 : Rat) / 1273790490336191187829975377157) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1843559191810834587817249493329108093957824 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-93883265632 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((921779595905417293908624746664554046978912 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (12, 1), (15, 3)],
  term ((46941632816 : Rat) / 7401317245) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-78835807317584304419799941187264 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 1)],
  term ((39417903658792152209899970593632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (14, 2)],
  term ((39417903658792152209899970593632 : Rat) / 1273790490336191187829975377157) [(7, 1), (13, 1), (15, 2)],
  term ((-1091046091107789733974533693190817236679632 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 1), (15, 1)],
  term ((-54393708216 : Rat) / 7401317245) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((545523045553894866987266846595408618339816 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (14, 2), (15, 1)],
  term ((27196854108 : Rat) / 7401317245) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((545523045553894866987266846595408618339816 : Rat) / 1346818217520322526586147269553926167495) [(7, 1), (15, 3)],
  term ((27196854108 : Rat) / 7401317245) [(7, 1), (15, 3), (16, 1)],
  term ((-9358997311311152291136 : Rat) / 253528477699481291099) [(7, 2), (14, 1)],
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (14, 2)],
  term ((4679498655655576145568 : Rat) / 253528477699481291099) [(7, 2), (15, 2)],
  term ((-20277284477141265785287075370448 : Rat) / 115799135485108289802725034287) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((10138642238570632892643537685224 : Rat) / 115799135485108289802725034287) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((10138642238570632892643537685224 : Rat) / 115799135485108289802725034287) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((137541781984187202113297360606419462252032 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((6993659964 : Rat) / 1480263449) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-68770890992093601056648680303209731126016 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3496829982 : Rat) / 1480263449) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-68770890992093601056648680303209731126016 : Rat) / 269363643504064505317229453910785233499) [(8, 1), (11, 1), (15, 3)],
  term ((-3496829982 : Rat) / 1480263449) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-42209821478619796110585439998384 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (14, 1)],
  term ((21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (14, 2)],
  term ((21104910739309898055292719999192 : Rat) / 1273790490336191187829975377157) [(8, 1), (11, 2), (15, 2)],
  term ((-4709467369251086172829158516360649725456 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((214521833352 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2354733684625543086414579258180324862728 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-107260916676 : Rat) / 7401317245) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2354733684625543086414579258180324862728 : Rat) / 122438019774574775144195206323084197045) [(8, 1), (13, 1), (15, 3)],
  term ((-107260916676 : Rat) / 7401317245) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((569737834698871188238703527887552 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 1)],
  term ((-284868917349435594119351763943776 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (14, 2)],
  term ((-284868917349435594119351763943776 : Rat) / 1273790490336191187829975377157) [(8, 1), (13, 2), (15, 2)],
  term ((976834572272022069293153796916574195313792 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (14, 1), (15, 2)],
  term ((-233187117784 : Rat) / 7401317245) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-488417286136011034646576898458287097656896 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (14, 2), (15, 2)],
  term ((116593558892 : Rat) / 7401317245) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-488417286136011034646576898458287097656896 : Rat) / 1346818217520322526586147269553926167495) [(8, 1), (15, 4)],
  term ((116593558892 : Rat) / 7401317245) [(8, 1), (15, 4), (16, 1)],
  term ((123035050404055891888179208930800 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-61517525202027945944089604465400 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-61517525202027945944089604465400 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-51997088377251357300659444511528 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 1)],
  term ((25998544188625678650329722255764 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (14, 2)],
  term ((25998544188625678650329722255764 : Rat) / 1273790490336191187829975377157) [(9, 1), (11, 1), (15, 2)],
  term ((-231698040906380838897224418033600 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((115849020453190419448612209016800 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((115849020453190419448612209016800 : Rat) / 1273790490336191187829975377157) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1759548252583556637877363833594315101364912 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-125036673936 : Rat) / 7401317245) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((879774126291778318938681916797157550682456 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((62518336968 : Rat) / 7401317245) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((879774126291778318938681916797157550682456 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (12, 1), (15, 3)],
  term ((62518336968 : Rat) / 7401317245) [(9, 1), (12, 1), (15, 3), (16, 1)],
  term ((97920255002780335265620132284576 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 1)],
  term ((-48960127501390167632810066142288 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (14, 2)],
  term ((-48960127501390167632810066142288 : Rat) / 1273790490336191187829975377157) [(9, 1), (13, 1), (15, 2)],
  term ((790208938333310602339364780963540090499264 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 1), (15, 1)],
  term ((54743702782 : Rat) / 7401317245) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-395104469166655301169682390481770045249632 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (14, 2), (15, 1)],
  term ((-27371851391 : Rat) / 7401317245) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-395104469166655301169682390481770045249632 : Rat) / 1346818217520322526586147269553926167495) [(9, 1), (15, 3)],
  term ((-27371851391 : Rat) / 7401317245) [(9, 1), (15, 3), (16, 1)],
  term ((-280588861982625168761168419490976 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((140294430991312584380584209745488 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((140294430991312584380584209745488 : Rat) / 1273790490336191187829975377157) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((92943629459024040807797789079433819789104 : Rat) / 103601401347717117429703636119532782115) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17003633624 : Rat) / 7401317245) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-46471814729512020403898894539716909894552 : Rat) / 103601401347717117429703636119532782115) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((8501816812 : Rat) / 7401317245) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-46471814729512020403898894539716909894552 : Rat) / 103601401347717117429703636119532782115) [(11, 1), (12, 1), (15, 3)],
  term ((8501816812 : Rat) / 7401317245) [(11, 1), (12, 1), (15, 3), (16, 1)],
  term ((113186424580920261123283402716744 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 1)],
  term ((-56593212290460130561641701358372 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (14, 2)],
  term ((-56593212290460130561641701358372 : Rat) / 1273790490336191187829975377157) [(11, 1), (13, 1), (15, 2)],
  term ((25610795789102683259463714125376 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 1), (15, 1)],
  term ((-12805397894551341629731857062688 : Rat) / 1273790490336191187829975377157) [(11, 1), (14, 2), (15, 1)],
  term ((-12805397894551341629731857062688 : Rat) / 1273790490336191187829975377157) [(11, 1), (15, 3)],
  term ((80759620168947109296204776591904 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (14, 1)],
  term ((-40379810084473554648102388295952 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (14, 2)],
  term ((-40379810084473554648102388295952 : Rat) / 1273790490336191187829975377157) [(11, 2), (12, 1), (15, 2)],
  term ((-1795805963552904127393213301832 : Rat) / 1273790490336191187829975377157) [(11, 2), (14, 1)],
  term ((897902981776452063696606650916 : Rat) / 1273790490336191187829975377157) [(11, 2), (14, 2)],
  term ((897902981776452063696606650916 : Rat) / 1273790490336191187829975377157) [(11, 2), (15, 2)],
  term ((-112774779741411688227263311887462442043664 : Rat) / 122438019774574775144195206323084197045) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((54203008508 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((56387389870705844113631655943731221021832 : Rat) / 122438019774574775144195206323084197045) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-27101504254 : Rat) / 7401317245) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((56387389870705844113631655943731221021832 : Rat) / 122438019774574775144195206323084197045) [(12, 1), (13, 1), (15, 3)],
  term ((-27101504254 : Rat) / 7401317245) [(12, 1), (13, 1), (15, 3), (16, 1)],
  term ((241995916803100139473116408414336 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 1)],
  term ((-120997958401550069736558204207168 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (14, 2)],
  term ((-120997958401550069736558204207168 : Rat) / 1273790490336191187829975377157) [(12, 1), (13, 2), (15, 2)],
  term ((1644446255396780562009120492257656572678936 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (14, 1), (15, 2)],
  term ((67539512378 : Rat) / 7401317245) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-822223127698390281004560246128828286339468 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (14, 2), (15, 2)],
  term ((-33769756189 : Rat) / 7401317245) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-822223127698390281004560246128828286339468 : Rat) / 1346818217520322526586147269553926167495) [(12, 1), (15, 4)],
  term ((-33769756189 : Rat) / 7401317245) [(12, 1), (15, 4), (16, 1)],
  term ((97322635651690965434055100478489332916964 : Rat) / 269363643504064505317229453910785233499) [(13, 1), (14, 1), (15, 1)],
  term ((-11633807837 : Rat) / 1480263449) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-48661317825845482717027550239244666458482 : Rat) / 269363643504064505317229453910785233499) [(13, 1), (14, 2), (15, 1)],
  term ((11633807837 : Rat) / 2960526898) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-48661317825845482717027550239244666458482 : Rat) / 269363643504064505317229453910785233499) [(13, 1), (15, 3)],
  term ((11633807837 : Rat) / 2960526898) [(13, 1), (15, 3), (16, 1)],
  term ((-206782598077252819029091017482400 : Rat) / 1273790490336191187829975377157) [(13, 2), (14, 1)],
  term ((103391299038626409514545508741200 : Rat) / 1273790490336191187829975377157) [(13, 2), (14, 2)],
  term ((103391299038626409514545508741200 : Rat) / 1273790490336191187829975377157) [(13, 2), (15, 2)],
  term ((1792431960161716512461708881743922532622696 : Rat) / 1346818217520322526586147269553926167495) [(14, 1), (15, 2)],
  term ((27413646128 : Rat) / 7401317245) [(14, 1), (15, 2), (16, 1)],
  term ((-896215980080858256230854440871961266311348 : Rat) / 1346818217520322526586147269553926167495) [(14, 2), (15, 2)],
  term ((-13706823064 : Rat) / 7401317245) [(14, 2), (15, 2), (16, 1)],
  term ((-896215980080858256230854440871961266311348 : Rat) / 1346818217520322526586147269553926167495) [(15, 4)],
  term ((-13706823064 : Rat) / 7401317245) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 8, terms 100 through 175. -/
theorem ep_Q2_002_block_08_0100_0175_valid :
    checkProductSumEq ep_Q2_002_partials_08_0100_0175
      ep_Q2_002_block_08_0100_0175 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
