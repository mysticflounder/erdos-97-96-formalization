/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 12:0-89

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_12_0000_0089 : Poly :=
[
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0000 : Poly :=
[
  term ((-535637226800 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 0 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0000 : Poly :=
[
  term ((-1071274453600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-1071274453600 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((535637226800 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((535637226800 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0000
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0001 : Poly :=
[
  term ((-25801738422528928535 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (15, 1)]
]

/-- Partial product 1 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0001 : Poly :=
[
  term ((-51603476845057857070 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-51603476845057857070 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((25801738422528928535 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (15, 1)],
  term ((25801738422528928535 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0001
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0002 : Poly :=
[
  term ((-249875991316 : Rat) / 25734207) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 2 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0002 : Poly :=
[
  term ((-499751982632 : Rat) / 25734207) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-499751982632 : Rat) / 25734207) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((249875991316 : Rat) / 25734207) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((249875991316 : Rat) / 25734207) [(0, 1), (1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0002
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0003 : Poly :=
[
  term ((244003933600 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 3 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0003 : Poly :=
[
  term ((488007867200 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((-244003933600 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((-244003933600 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((488007867200 : Rat) / 150171761) [(0, 1), (3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0003
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0004 : Poly :=
[
  term ((11753711941246495570 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 4 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0004 : Poly :=
[
  term ((23507423882492991140 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-11753711941246495570 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-11753711941246495570 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((23507423882492991140 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0004
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0005 : Poly :=
[
  term ((90873941912 : Rat) / 25734207) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 5 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0005 : Poly :=
[
  term ((181747883824 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-90873941912 : Rat) / 25734207) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-90873941912 : Rat) / 25734207) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((181747883824 : Rat) / 25734207) [(0, 1), (3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0005
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0006 : Poly :=
[
  term ((-406244891600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 6 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0006 : Poly :=
[
  term ((-812489783200 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1)],
  term ((-812489783200 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((406244891600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((406244891600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0006
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0007 : Poly :=
[
  term ((-19568887120061199545 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 7 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0007 : Poly :=
[
  term ((-39137774240122399090 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-39137774240122399090 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((19568887120061199545 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((19568887120061199545 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0007
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0008 : Poly :=
[
  term ((-86908092172 : Rat) / 25734207) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 8 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0008 : Poly :=
[
  term ((-173816184344 : Rat) / 25734207) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-173816184344 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((86908092172 : Rat) / 25734207) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((86908092172 : Rat) / 25734207) [(0, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0008
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0009 : Poly :=
[
  term ((12507134200 : Rat) / 6529207) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 9 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0009 : Poly :=
[
  term ((25014268400 : Rat) / 6529207) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((25014268400 : Rat) / 6529207) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((-12507134200 : Rat) / 6529207) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-12507134200 : Rat) / 6529207) [(0, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0009
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0010 : Poly :=
[
  term ((159137520800 : Rat) / 150171761) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 10 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0010 : Poly :=
[
  term ((318275041600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((318275041600 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-159137520800 : Rat) / 150171761) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-159137520800 : Rat) / 150171761) [(0, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0010
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0011 : Poly :=
[
  term ((1204941661623379955 : Rat) / 112015976322566) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 11 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0011 : Poly :=
[
  term ((1204941661623379955 : Rat) / 56007988161283) [(0, 1), (2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((1204941661623379955 : Rat) / 56007988161283) [(0, 1), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-1204941661623379955 : Rat) / 112015976322566) [(0, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-1204941661623379955 : Rat) / 112015976322566) [(0, 1), (11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0011
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0012 : Poly :=
[
  term ((7665682068853838210 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)]
]

/-- Partial product 12 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0012 : Poly :=
[
  term ((15331364137707676420 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (15, 2)],
  term ((15331364137707676420 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (15, 2)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0012
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0013 : Poly :=
[
  term ((92534126302 : Rat) / 25734207) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 13 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0013 : Poly :=
[
  term ((185068252604 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((185068252604 : Rat) / 25734207) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((-92534126302 : Rat) / 25734207) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-92534126302 : Rat) / 25734207) [(0, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0013
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0014 : Poly :=
[
  term ((68986039096 : Rat) / 25734207) [(0, 1), (15, 2)]
]

/-- Partial product 14 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0014 : Poly :=
[
  term ((137972078192 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((137972078192 : Rat) / 25734207) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-68986039096 : Rat) / 25734207) [(0, 1), (12, 2), (15, 2)],
  term ((-68986039096 : Rat) / 25734207) [(0, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0014
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0015 : Poly :=
[
  term ((52149402400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 15 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0015 : Poly :=
[
  term ((104298804800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((-52149402400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 2)],
  term ((-52149402400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((104298804800 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0015
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0016 : Poly :=
[
  term ((2512045788255885130 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 16 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0016 : Poly :=
[
  term ((5024091576511770260 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2512045788255885130 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2512045788255885130 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1)],
  term ((5024091576511770260 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0016
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0017 : Poly :=
[
  term ((5640945848 : Rat) / 25734207) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 17 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0017 : Poly :=
[
  term ((11281891696 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((-5640945848 : Rat) / 25734207) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-5640945848 : Rat) / 25734207) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((11281891696 : Rat) / 25734207) [(1, 1), (2, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0017
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0018 : Poly :=
[
  term ((49061641200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 18 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0018 : Poly :=
[
  term ((98123282400 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((98123282400 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (11, 1), (13, 1)],
  term ((-49061641200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (12, 2)],
  term ((-49061641200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0018
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0019 : Poly :=
[
  term ((2363307793942839315 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 19 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0019 : Poly :=
[
  term ((4726615587885678630 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((4726615587885678630 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2363307793942839315 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2363307793942839315 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0019
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0020 : Poly :=
[
  term ((-5024652692 : Rat) / 8578069) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 20 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0020 : Poly :=
[
  term ((-10049305384 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-10049305384 : Rat) / 8578069) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1)],
  term ((5024652692 : Rat) / 8578069) [(1, 1), (4, 1), (12, 2), (15, 1)],
  term ((5024652692 : Rat) / 8578069) [(1, 1), (4, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0020
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0021 : Poly :=
[
  term ((298439186600 : Rat) / 150171761) [(1, 1), (11, 1)]
]

/-- Partial product 21 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0021 : Poly :=
[
  term ((596878373200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1)],
  term ((596878373200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-298439186600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2)],
  term ((-298439186600 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0021
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0022 : Poly :=
[
  term ((309003054600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 22 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0022 : Poly :=
[
  term ((618006109200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 2)],
  term ((618006109200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((-309003054600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-309003054600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0022
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0023 : Poly :=
[
  term ((-724994227600 : Rat) / 150171761) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 23 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0023 : Poly :=
[
  term ((-1449988455200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1449988455200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((724994227600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((724994227600 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0023
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0024 : Poly :=
[
  term ((29769461820952077165 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 24 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0024 : Poly :=
[
  term ((29769461820952077165 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((29769461820952077165 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-29769461820952077165 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-29769461820952077165 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0024
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0025 : Poly :=
[
  term ((-34923098101550030245 : Rat) / 1288183727709509) [(1, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 25 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0025 : Poly :=
[
  term ((-69846196203100060490 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-69846196203100060490 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((34923098101550030245 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((34923098101550030245 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0025
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0026 : Poly :=
[
  term ((28751735101341916465 : Rat) / 2576367455419018) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 26 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0026 : Poly :=
[
  term ((28751735101341916465 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((28751735101341916465 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-28751735101341916465 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 2), (15, 1)],
  term ((-28751735101341916465 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0026
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0027 : Poly :=
[
  term ((54269675834 : Rat) / 8578069) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 27 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0027 : Poly :=
[
  term ((108539351668 : Rat) / 8578069) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((108539351668 : Rat) / 8578069) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-54269675834 : Rat) / 8578069) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-54269675834 : Rat) / 8578069) [(1, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0027
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0028 : Poly :=
[
  term ((-388963148252 : Rat) / 25734207) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 28 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0028 : Poly :=
[
  term ((-777926296504 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-777926296504 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((388963148252 : Rat) / 25734207) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((388963148252 : Rat) / 25734207) [(1, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0028
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0029 : Poly :=
[
  term ((166284507622 : Rat) / 25734207) [(1, 1), (15, 1)]
]

/-- Partial product 29 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0029 : Poly :=
[
  term ((332569015244 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((332569015244 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-166284507622 : Rat) / 25734207) [(1, 1), (12, 2), (15, 1)],
  term ((-166284507622 : Rat) / 25734207) [(1, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0029
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0030 : Poly :=
[
  term ((103613975600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 30 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0030 : Poly :=
[
  term ((207227951200 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-103613975600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 2)],
  term ((-103613975600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (13, 2)],
  term ((207227951200 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0030
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0031 : Poly :=
[
  term ((4991103234778929095 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 31 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0031 : Poly :=
[
  term ((9982206469557858190 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-4991103234778929095 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-4991103234778929095 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((9982206469557858190 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0031
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0032 : Poly :=
[
  term ((12766980532 : Rat) / 25734207) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 32 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0032 : Poly :=
[
  term ((25533961064 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-12766980532 : Rat) / 25734207) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((-12766980532 : Rat) / 25734207) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((25533961064 : Rat) / 25734207) [(2, 2), (5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0032
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0033 : Poly :=
[
  term ((4656059400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 33 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0033 : Poly :=
[
  term ((9312118800 : Rat) / 150171761) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-4656059400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 2)],
  term ((-4656059400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (13, 2)],
  term ((9312118800 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0033
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0034 : Poly :=
[
  term ((448566383021072685 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 34 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0034 : Poly :=
[
  term ((448566383021072685 : Rat) / 1288183727709509) [(2, 1), (3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (13, 2), (15, 1)],
  term ((448566383021072685 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0034
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0035 : Poly :=
[
  term ((437091386 : Rat) / 8578069) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 35 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0035 : Poly :=
[
  term ((874182772 : Rat) / 8578069) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-437091386 : Rat) / 8578069) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((-437091386 : Rat) / 8578069) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((874182772 : Rat) / 8578069) [(2, 2), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0035
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0036 : Poly :=
[
  term ((-178591625200 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 36 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0036 : Poly :=
[
  term ((-357183250400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 2)],
  term ((178591625200 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((178591625200 : Rat) / 150171761) [(2, 1), (11, 1), (13, 3)],
  term ((-357183250400 : Rat) / 150171761) [(2, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0036
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0037 : Poly :=
[
  term ((-36071499200 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 37 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0037 : Poly :=
[
  term ((-72142998400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((36071499200 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((36071499200 : Rat) / 150171761) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-72142998400 : Rat) / 150171761) [(2, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0037
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0038 : Poly :=
[
  term ((-8602789663059180115 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 38 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0038 : Poly :=
[
  term ((-17205579326118360230 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((8602789663059180115 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((8602789663059180115 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 3), (15, 1)],
  term ((-17205579326118360230 : Rat) / 1288183727709509) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0038
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0039 : Poly :=
[
  term ((-1737570393355754540 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 39 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0039 : Poly :=
[
  term ((-3475140786711509080 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((1737570393355754540 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 2), (15, 2)],
  term ((1737570393355754540 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 2), (15, 2)],
  term ((-3475140786711509080 : Rat) / 1288183727709509) [(2, 2), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0039
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0040 : Poly :=
[
  term ((-50991025124 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 40 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0040 : Poly :=
[
  term ((-101982050248 : Rat) / 25734207) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((50991025124 : Rat) / 25734207) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((50991025124 : Rat) / 25734207) [(2, 1), (13, 3), (15, 1)],
  term ((-101982050248 : Rat) / 25734207) [(2, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0040
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0041 : Poly :=
[
  term ((5402702096 : Rat) / 25734207) [(2, 1), (15, 2)]
]

/-- Partial product 41 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0041 : Poly :=
[
  term ((10805404192 : Rat) / 25734207) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-5402702096 : Rat) / 25734207) [(2, 1), (12, 2), (15, 2)],
  term ((-5402702096 : Rat) / 25734207) [(2, 1), (13, 2), (15, 2)],
  term ((10805404192 : Rat) / 25734207) [(2, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0041
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0042 : Poly :=
[
  term ((933197200 : Rat) / 8833633) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 42 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0042 : Poly :=
[
  term ((1866394400 : Rat) / 8833633) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-933197200 : Rat) / 8833633) [(3, 1), (4, 1), (11, 1), (12, 2)],
  term ((-933197200 : Rat) / 8833633) [(3, 1), (4, 1), (11, 1), (13, 2)],
  term ((1866394400 : Rat) / 8833633) [(3, 2), (4, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0042
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0043 : Poly :=
[
  term ((44952271511977765 : Rat) / 75775513394677) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 43 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0043 : Poly :=
[
  term ((89904543023955530 : Rat) / 75775513394677) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-44952271511977765 : Rat) / 75775513394677) [(3, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((-44952271511977765 : Rat) / 75775513394677) [(3, 1), (4, 1), (11, 2), (13, 2), (15, 1)],
  term ((89904543023955530 : Rat) / 75775513394677) [(3, 2), (4, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0043
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0044 : Poly :=
[
  term ((-10226951972 : Rat) / 25734207) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 44 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0044 : Poly :=
[
  term ((-20453903944 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((10226951972 : Rat) / 25734207) [(3, 1), (4, 1), (12, 2), (15, 1)],
  term ((10226951972 : Rat) / 25734207) [(3, 1), (4, 1), (13, 2), (15, 1)],
  term ((-20453903944 : Rat) / 25734207) [(3, 2), (4, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0044
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0045 : Poly :=
[
  term ((-210143861700 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 45 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0045 : Poly :=
[
  term ((-420287723400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1)],
  term ((210143861700 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2)],
  term ((210143861700 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2)],
  term ((-420287723400 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0045_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0045
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0046 : Poly :=
[
  term ((-178591625200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 46 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0046 : Poly :=
[
  term ((-357183250400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 2)],
  term ((178591625200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((178591625200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 3)],
  term ((-357183250400 : Rat) / 150171761) [(3, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0046_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0046
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0047 : Poly :=
[
  term ((393254749600 : Rat) / 150171761) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 47 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0047 : Poly :=
[
  term ((786509499200 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-393254749600 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-393254749600 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((786509499200 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0047_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0047
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0048 : Poly :=
[
  term ((-8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 48 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0048 : Poly :=
[
  term ((-17205579326118360230 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 3), (15, 1)],
  term ((-17205579326118360230 : Rat) / 1288183727709509) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0048_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0048
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0049 : Poly :=
[
  term ((18943149719474114770 : Rat) / 1288183727709509) [(3, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 49 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0049 : Poly :=
[
  term ((37886299438948229540 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-18943149719474114770 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-18943149719474114770 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((37886299438948229540 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0049_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0049
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0050 : Poly :=
[
  term ((-40490665542990936285 : Rat) / 5152734910838036) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 50 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0050 : Poly :=
[
  term ((-40490665542990936285 : Rat) / 2576367455419018) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((40490665542990936285 : Rat) / 5152734910838036) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((40490665542990936285 : Rat) / 5152734910838036) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-40490665542990936285 : Rat) / 2576367455419018) [(3, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0050_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0050
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0051 : Poly :=
[
  term ((-50991025124 : Rat) / 25734207) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 51 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0051 : Poly :=
[
  term ((-101982050248 : Rat) / 25734207) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((50991025124 : Rat) / 25734207) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((50991025124 : Rat) / 25734207) [(3, 1), (12, 3), (15, 1)],
  term ((-101982050248 : Rat) / 25734207) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0051_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0051
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0052 : Poly :=
[
  term ((96579348152 : Rat) / 25734207) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 52 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0052 : Poly :=
[
  term ((193158696304 : Rat) / 25734207) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-96579348152 : Rat) / 25734207) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-96579348152 : Rat) / 25734207) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((193158696304 : Rat) / 25734207) [(3, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0052_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0052
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0053 : Poly :=
[
  term ((-16727698413 : Rat) / 8578069) [(3, 1), (15, 1)]
]

/-- Partial product 53 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0053 : Poly :=
[
  term ((-33455396826 : Rat) / 8578069) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((16727698413 : Rat) / 8578069) [(3, 1), (12, 2), (15, 1)],
  term ((16727698413 : Rat) / 8578069) [(3, 1), (13, 2), (15, 1)],
  term ((-33455396826 : Rat) / 8578069) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0053_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0053
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0054 : Poly :=
[
  term ((2367950000 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)]
]

/-- Partial product 54 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0054 : Poly :=
[
  term ((4735900000 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((4735900000 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (13, 2)],
  term ((-2367950000 : Rat) / 150171761) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((-2367950000 : Rat) / 150171761) [(4, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0054_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0054
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0055 : Poly :=
[
  term ((-1866394400 : Rat) / 8833633) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 55 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0055 : Poly :=
[
  term ((-3732788800 : Rat) / 8833633) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3732788800 : Rat) / 8833633) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((1866394400 : Rat) / 8833633) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((1866394400 : Rat) / 8833633) [(4, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0055_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0055
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0056 : Poly :=
[
  term ((114064563552899375 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 56 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0056 : Poly :=
[
  term ((228129127105798750 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (13, 2), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0056_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0056
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0057 : Poly :=
[
  term ((-89904543023955530 : Rat) / 75775513394677) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 57 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0057 : Poly :=
[
  term ((-179809086047911060 : Rat) / 75775513394677) [(2, 1), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-179809086047911060 : Rat) / 75775513394677) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((89904543023955530 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 2), (15, 2)],
  term ((89904543023955530 : Rat) / 75775513394677) [(4, 1), (11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0057_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0057
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0058 : Poly :=
[
  term ((-12876303500 : Rat) / 25734207) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 58 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0058 : Poly :=
[
  term ((-25752607000 : Rat) / 25734207) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((-25752607000 : Rat) / 25734207) [(3, 1), (4, 1), (13, 2), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(4, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0058_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0058
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0059 : Poly :=
[
  term ((20453903944 : Rat) / 25734207) [(4, 1), (15, 2)]
]

/-- Partial product 59 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0059 : Poly :=
[
  term ((40907807888 : Rat) / 25734207) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((40907807888 : Rat) / 25734207) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((-20453903944 : Rat) / 25734207) [(4, 1), (12, 2), (15, 2)],
  term ((-20453903944 : Rat) / 25734207) [(4, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0059_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0059
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0060 : Poly :=
[
  term ((166183066200 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 60 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0060 : Poly :=
[
  term ((332366132400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1)],
  term ((332366132400 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-166183066200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2)],
  term ((-166183066200 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0060_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0060
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0061 : Poly :=
[
  term ((-2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 61 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0061 : Poly :=
[
  term ((-4735900000 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 2)],
  term ((-4735900000 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0061_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0061
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0062 : Poly :=
[
  term ((23181753200 : Rat) / 150171761) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 62 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0062 : Poly :=
[
  term ((46363506400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((46363506400 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-23181753200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-23181753200 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0062_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0062
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0063 : Poly :=
[
  term ((-114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 63 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0063 : Poly :=
[
  term ((-228129127105798750 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0063_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0063
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0064 : Poly :=
[
  term ((1116669085558828715 : Rat) / 1288183727709509) [(5, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 64 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0064 : Poly :=
[
  term ((2233338171117657430 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((2233338171117657430 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1116669085558828715 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-1116669085558828715 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0064_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0064
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0065 : Poly :=
[
  term ((16010134433569614255 : Rat) / 2576367455419018) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 65 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0065 : Poly :=
[
  term ((16010134433569614255 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((16010134433569614255 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-16010134433569614255 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-16010134433569614255 : Rat) / 2576367455419018) [(5, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0065_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0065
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0066 : Poly :=
[
  term ((12876303500 : Rat) / 25734207) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 66 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0066 : Poly :=
[
  term ((25752607000 : Rat) / 25734207) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((25752607000 : Rat) / 25734207) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0066_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0066
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0067 : Poly :=
[
  term ((-27585262556 : Rat) / 25734207) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 67 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0067 : Poly :=
[
  term ((-55170525112 : Rat) / 25734207) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-55170525112 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((27585262556 : Rat) / 25734207) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((27585262556 : Rat) / 25734207) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0067_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0067
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0068 : Poly :=
[
  term ((9851237518 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 68 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0068 : Poly :=
[
  term ((19702475036 : Rat) / 8578069) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((19702475036 : Rat) / 8578069) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-9851237518 : Rat) / 8578069) [(5, 1), (12, 2), (15, 1)],
  term ((-9851237518 : Rat) / 8578069) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0068_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0068
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0069 : Poly :=
[
  term ((4543133500 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 69 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0069 : Poly :=
[
  term ((9086267000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((9086267000 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-4543133500 : Rat) / 150171761) [(7, 1), (11, 1), (12, 2)],
  term ((-4543133500 : Rat) / 150171761) [(7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0069_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0069
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0070 : Poly :=
[
  term ((-4656059400 : Rat) / 150171761) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 70 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0070 : Poly :=
[
  term ((-9312118800 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9312118800 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((4656059400 : Rat) / 150171761) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((4656059400 : Rat) / 150171761) [(7, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0070_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0070
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0071 : Poly :=
[
  term ((-448566383021072685 : Rat) / 2576367455419018) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 71 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0071 : Poly :=
[
  term ((-448566383021072685 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((448566383021072685 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((448566383021072685 : Rat) / 2576367455419018) [(7, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0071_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0071
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0072 : Poly :=
[
  term ((875374125028072675 : Rat) / 5152734910838036) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 72 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0072 : Poly :=
[
  term ((875374125028072675 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((875374125028072675 : Rat) / 2576367455419018) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-875374125028072675 : Rat) / 5152734910838036) [(7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-875374125028072675 : Rat) / 5152734910838036) [(7, 1), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0072_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0072
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0073 : Poly :=
[
  term ((-437091386 : Rat) / 8578069) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 73 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0073 : Poly :=
[
  term ((-874182772 : Rat) / 8578069) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-874182772 : Rat) / 8578069) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((437091386 : Rat) / 8578069) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((437091386 : Rat) / 8578069) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0073_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0073
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0074 : Poly :=
[
  term ((3851790905 : Rat) / 25734207) [(7, 1), (15, 1)]
]

/-- Partial product 74 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0074 : Poly :=
[
  term ((7703581810 : Rat) / 25734207) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((7703581810 : Rat) / 25734207) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-3851790905 : Rat) / 25734207) [(7, 1), (12, 2), (15, 1)],
  term ((-3851790905 : Rat) / 25734207) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0074_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0074
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0075 : Poly :=
[
  term ((-239483890800 : Rat) / 150171761) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 75 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0075 : Poly :=
[
  term ((-478967781600 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-478967781600 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((239483890800 : Rat) / 150171761) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((239483890800 : Rat) / 150171761) [(11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0075_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0075
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0076 : Poly :=
[
  term ((97597346600 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 76 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0076 : Poly :=
[
  term ((195194693200 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1)],
  term ((195194693200 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2)],
  term ((-97597346600 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1)],
  term ((-97597346600 : Rat) / 150171761) [(11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0076_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0076
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0077 : Poly :=
[
  term ((-418075516000 : Rat) / 150171761) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 77 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0077 : Poly :=
[
  term ((-836151032000 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-836151032000 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((418075516000 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((418075516000 : Rat) / 150171761) [(11, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0077_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0077
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0078 : Poly :=
[
  term ((270733637600 : Rat) / 150171761) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 78 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0078 : Poly :=
[
  term ((541467275200 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((541467275200 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-270733637600 : Rat) / 150171761) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-270733637600 : Rat) / 150171761) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0078_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0078
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0079 : Poly :=
[
  term ((64256678600 : Rat) / 150171761) [(11, 1), (15, 1)]
]

/-- Partial product 79 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0079 : Poly :=
[
  term ((128513357200 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((128513357200 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-64256678600 : Rat) / 150171761) [(11, 1), (12, 2), (15, 1)],
  term ((-64256678600 : Rat) / 150171761) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0079_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0079
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0080 : Poly :=
[
  term ((-11535980693026547835 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 80 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0080 : Poly :=
[
  term ((-23071961386053095670 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 2), (15, 2)],
  term ((-23071961386053095670 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((11535980693026547835 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 2), (15, 2)],
  term ((11535980693026547835 : Rat) / 1288183727709509) [(11, 2), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0080_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0080
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0081 : Poly :=
[
  term ((-20138770356085727950 : Rat) / 1288183727709509) [(11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 81 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0081 : Poly :=
[
  term ((-40277540712171455900 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-40277540712171455900 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((20138770356085727950 : Rat) / 1288183727709509) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((20138770356085727950 : Rat) / 1288183727709509) [(11, 2), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0081_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0081
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0082 : Poly :=
[
  term ((9402562337760550465 : Rat) / 2576367455419018) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 82 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0082 : Poly :=
[
  term ((9402562337760550465 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((9402562337760550465 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-9402562337760550465 : Rat) / 2576367455419018) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-9402562337760550465 : Rat) / 2576367455419018) [(11, 2), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0082_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0082
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0083 : Poly :=
[
  term ((13041286434229112870 : Rat) / 1288183727709509) [(11, 2), (14, 1), (15, 2)]
]

/-- Partial product 83 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0083 : Poly :=
[
  term ((26082572868458225740 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((26082572868458225740 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-13041286434229112870 : Rat) / 1288183727709509) [(11, 2), (12, 2), (14, 1), (15, 2)],
  term ((-13041286434229112870 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0083_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0083
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0084 : Poly :=
[
  term ((6190510779254569765 : Rat) / 2576367455419018) [(11, 2), (15, 2)]
]

/-- Partial product 84 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0084 : Poly :=
[
  term ((6190510779254569765 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (15, 2)],
  term ((6190510779254569765 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-6190510779254569765 : Rat) / 2576367455419018) [(11, 2), (12, 2), (15, 2)],
  term ((-6190510779254569765 : Rat) / 2576367455419018) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0084_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0084
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0085 : Poly :=
[
  term ((-51120367852 : Rat) / 8578069) [(12, 1), (15, 2)]
]

/-- Partial product 85 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0085 : Poly :=
[
  term ((-102240735704 : Rat) / 8578069) [(2, 1), (12, 2), (15, 2)],
  term ((-102240735704 : Rat) / 8578069) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((51120367852 : Rat) / 8578069) [(12, 1), (13, 2), (15, 2)],
  term ((51120367852 : Rat) / 8578069) [(12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0085_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0085
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0086 : Poly :=
[
  term ((-204352128680 : Rat) / 25734207) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 86 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0086 : Poly :=
[
  term ((-408704257360 : Rat) / 25734207) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-408704257360 : Rat) / 25734207) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((204352128680 : Rat) / 25734207) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((204352128680 : Rat) / 25734207) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0086_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0086
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0087 : Poly :=
[
  term ((73509266662 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 87 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0087 : Poly :=
[
  term ((147018533324 : Rat) / 25734207) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((147018533324 : Rat) / 25734207) [(3, 1), (13, 2), (15, 1)],
  term ((-73509266662 : Rat) / 25734207) [(12, 2), (13, 1), (15, 1)],
  term ((-73509266662 : Rat) / 25734207) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0087_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0087
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0088 : Poly :=
[
  term ((217733829832 : Rat) / 25734207) [(14, 1), (15, 2)]
]

/-- Partial product 88 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0088 : Poly :=
[
  term ((435467659664 : Rat) / 25734207) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((435467659664 : Rat) / 25734207) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-217733829832 : Rat) / 25734207) [(12, 2), (14, 1), (15, 2)],
  term ((-217733829832 : Rat) / 25734207) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0088_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0088
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 12. -/
def rs_R013_ueqv_R013YNNN_coefficient_12_0089 : Poly :=
[
  term ((9257738302 : Rat) / 25734207) [(15, 2)]
]

/-- Partial product 89 for generator 12. -/
def rs_R013_ueqv_R013YNNN_partial_12_0089 : Poly :=
[
  term ((18515476604 : Rat) / 25734207) [(2, 1), (12, 1), (15, 2)],
  term ((18515476604 : Rat) / 25734207) [(3, 1), (13, 1), (15, 2)],
  term ((-9257738302 : Rat) / 25734207) [(12, 2), (15, 2)],
  term ((-9257738302 : Rat) / 25734207) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 12. -/
theorem rs_R013_ueqv_R013YNNN_partial_12_0089_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_12_0089
        rs_R013_ueqv_R013YNNN_generator_12_0000_0089 =
      rs_R013_ueqv_R013YNNN_partial_12_0089 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_12_0000_0089 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_12_0000,
  rs_R013_ueqv_R013YNNN_partial_12_0001,
  rs_R013_ueqv_R013YNNN_partial_12_0002,
  rs_R013_ueqv_R013YNNN_partial_12_0003,
  rs_R013_ueqv_R013YNNN_partial_12_0004,
  rs_R013_ueqv_R013YNNN_partial_12_0005,
  rs_R013_ueqv_R013YNNN_partial_12_0006,
  rs_R013_ueqv_R013YNNN_partial_12_0007,
  rs_R013_ueqv_R013YNNN_partial_12_0008,
  rs_R013_ueqv_R013YNNN_partial_12_0009,
  rs_R013_ueqv_R013YNNN_partial_12_0010,
  rs_R013_ueqv_R013YNNN_partial_12_0011,
  rs_R013_ueqv_R013YNNN_partial_12_0012,
  rs_R013_ueqv_R013YNNN_partial_12_0013,
  rs_R013_ueqv_R013YNNN_partial_12_0014,
  rs_R013_ueqv_R013YNNN_partial_12_0015,
  rs_R013_ueqv_R013YNNN_partial_12_0016,
  rs_R013_ueqv_R013YNNN_partial_12_0017,
  rs_R013_ueqv_R013YNNN_partial_12_0018,
  rs_R013_ueqv_R013YNNN_partial_12_0019,
  rs_R013_ueqv_R013YNNN_partial_12_0020,
  rs_R013_ueqv_R013YNNN_partial_12_0021,
  rs_R013_ueqv_R013YNNN_partial_12_0022,
  rs_R013_ueqv_R013YNNN_partial_12_0023,
  rs_R013_ueqv_R013YNNN_partial_12_0024,
  rs_R013_ueqv_R013YNNN_partial_12_0025,
  rs_R013_ueqv_R013YNNN_partial_12_0026,
  rs_R013_ueqv_R013YNNN_partial_12_0027,
  rs_R013_ueqv_R013YNNN_partial_12_0028,
  rs_R013_ueqv_R013YNNN_partial_12_0029,
  rs_R013_ueqv_R013YNNN_partial_12_0030,
  rs_R013_ueqv_R013YNNN_partial_12_0031,
  rs_R013_ueqv_R013YNNN_partial_12_0032,
  rs_R013_ueqv_R013YNNN_partial_12_0033,
  rs_R013_ueqv_R013YNNN_partial_12_0034,
  rs_R013_ueqv_R013YNNN_partial_12_0035,
  rs_R013_ueqv_R013YNNN_partial_12_0036,
  rs_R013_ueqv_R013YNNN_partial_12_0037,
  rs_R013_ueqv_R013YNNN_partial_12_0038,
  rs_R013_ueqv_R013YNNN_partial_12_0039,
  rs_R013_ueqv_R013YNNN_partial_12_0040,
  rs_R013_ueqv_R013YNNN_partial_12_0041,
  rs_R013_ueqv_R013YNNN_partial_12_0042,
  rs_R013_ueqv_R013YNNN_partial_12_0043,
  rs_R013_ueqv_R013YNNN_partial_12_0044,
  rs_R013_ueqv_R013YNNN_partial_12_0045,
  rs_R013_ueqv_R013YNNN_partial_12_0046,
  rs_R013_ueqv_R013YNNN_partial_12_0047,
  rs_R013_ueqv_R013YNNN_partial_12_0048,
  rs_R013_ueqv_R013YNNN_partial_12_0049,
  rs_R013_ueqv_R013YNNN_partial_12_0050,
  rs_R013_ueqv_R013YNNN_partial_12_0051,
  rs_R013_ueqv_R013YNNN_partial_12_0052,
  rs_R013_ueqv_R013YNNN_partial_12_0053,
  rs_R013_ueqv_R013YNNN_partial_12_0054,
  rs_R013_ueqv_R013YNNN_partial_12_0055,
  rs_R013_ueqv_R013YNNN_partial_12_0056,
  rs_R013_ueqv_R013YNNN_partial_12_0057,
  rs_R013_ueqv_R013YNNN_partial_12_0058,
  rs_R013_ueqv_R013YNNN_partial_12_0059,
  rs_R013_ueqv_R013YNNN_partial_12_0060,
  rs_R013_ueqv_R013YNNN_partial_12_0061,
  rs_R013_ueqv_R013YNNN_partial_12_0062,
  rs_R013_ueqv_R013YNNN_partial_12_0063,
  rs_R013_ueqv_R013YNNN_partial_12_0064,
  rs_R013_ueqv_R013YNNN_partial_12_0065,
  rs_R013_ueqv_R013YNNN_partial_12_0066,
  rs_R013_ueqv_R013YNNN_partial_12_0067,
  rs_R013_ueqv_R013YNNN_partial_12_0068,
  rs_R013_ueqv_R013YNNN_partial_12_0069,
  rs_R013_ueqv_R013YNNN_partial_12_0070,
  rs_R013_ueqv_R013YNNN_partial_12_0071,
  rs_R013_ueqv_R013YNNN_partial_12_0072,
  rs_R013_ueqv_R013YNNN_partial_12_0073,
  rs_R013_ueqv_R013YNNN_partial_12_0074,
  rs_R013_ueqv_R013YNNN_partial_12_0075,
  rs_R013_ueqv_R013YNNN_partial_12_0076,
  rs_R013_ueqv_R013YNNN_partial_12_0077,
  rs_R013_ueqv_R013YNNN_partial_12_0078,
  rs_R013_ueqv_R013YNNN_partial_12_0079,
  rs_R013_ueqv_R013YNNN_partial_12_0080,
  rs_R013_ueqv_R013YNNN_partial_12_0081,
  rs_R013_ueqv_R013YNNN_partial_12_0082,
  rs_R013_ueqv_R013YNNN_partial_12_0083,
  rs_R013_ueqv_R013YNNN_partial_12_0084,
  rs_R013_ueqv_R013YNNN_partial_12_0085,
  rs_R013_ueqv_R013YNNN_partial_12_0086,
  rs_R013_ueqv_R013YNNN_partial_12_0087,
  rs_R013_ueqv_R013YNNN_partial_12_0088,
  rs_R013_ueqv_R013YNNN_partial_12_0089
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_12_0000_0089 : Poly :=
[
  term ((-1071274453600 : Rat) / 150171761) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-51603476845057857070 : Rat) / 1288183727709509) [(0, 1), (1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((-499751982632 : Rat) / 25734207) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-1071274453600 : Rat) / 150171761) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-51603476845057857070 : Rat) / 1288183727709509) [(0, 1), (1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-499751982632 : Rat) / 25734207) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((535637226800 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((535637226800 : Rat) / 150171761) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((25801738422528928535 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (12, 2), (15, 1)],
  term ((25801738422528928535 : Rat) / 1288183727709509) [(0, 1), (1, 1), (11, 2), (13, 2), (15, 1)],
  term ((249875991316 : Rat) / 25734207) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((249875991316 : Rat) / 25734207) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((488007867200 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (11, 1), (12, 1)],
  term ((23507423882492991140 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((181747883824 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-812489783200 : Rat) / 150171761) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1)],
  term ((-39137774240122399090 : Rat) / 1288183727709509) [(0, 1), (2, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-173816184344 : Rat) / 25734207) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((25014268400 : Rat) / 6529207) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((318275041600 : Rat) / 150171761) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((1204941661623379955 : Rat) / 56007988161283) [(0, 1), (2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((15331364137707676420 : Rat) / 1288183727709509) [(0, 1), (2, 1), (11, 2), (12, 1), (15, 2)],
  term ((185068252604 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((137972078192 : Rat) / 25734207) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((-812489783200 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-39137774240122399090 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-173816184344 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-244003933600 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((318275041600 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((331324239600 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((-11753711941246495570 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((15331364137707676420 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((15959946276091243395 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-90873941912 : Rat) / 25734207) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((137972078192 : Rat) / 25734207) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((31398103564 : Rat) / 8578069) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((488007867200 : Rat) / 150171761) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((23507423882492991140 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((181747883824 : Rat) / 25734207) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((406244891600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((406244891600 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((19568887120061199545 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((19568887120061199545 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((86908092172 : Rat) / 25734207) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((86908092172 : Rat) / 25734207) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((-12507134200 : Rat) / 6529207) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-159137520800 : Rat) / 150171761) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-159137520800 : Rat) / 150171761) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-12507134200 : Rat) / 6529207) [(0, 1), (11, 1), (13, 3)],
  term ((-1204941661623379955 : Rat) / 112015976322566) [(0, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(0, 1), (11, 2), (12, 2), (15, 2)],
  term ((-7665682068853838210 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 2), (15, 2)],
  term ((-1204941661623379955 : Rat) / 112015976322566) [(0, 1), (11, 2), (13, 3), (15, 1)],
  term ((-92534126302 : Rat) / 25734207) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-68986039096 : Rat) / 25734207) [(0, 1), (12, 2), (15, 2)],
  term ((-68986039096 : Rat) / 25734207) [(0, 1), (13, 2), (15, 2)],
  term ((-92534126302 : Rat) / 25734207) [(0, 1), (13, 3), (15, 1)],
  term ((104298804800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (11, 1), (13, 1)],
  term ((5024091576511770260 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((11281891696 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1)],
  term ((98123282400 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((4726615587885678630 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-10049305384 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((596878373200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-1449988455200 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((565856706800 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (12, 2)],
  term ((-52149402400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((-69846196203100060490 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((28751735101341916465 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 1), (15, 1)],
  term ((27257416032696192035 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2512045788255885130 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (13, 2), (15, 1)],
  term ((-777926296504 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((332569015244 : Rat) / 25734207) [(1, 1), (2, 1), (12, 1), (15, 1)],
  term ((319977109156 : Rat) / 25734207) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-5640945848 : Rat) / 25734207) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((104298804800 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((5024091576511770260 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (12, 1), (15, 1)],
  term ((11281891696 : Rat) / 25734207) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((98123282400 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (11, 1), (13, 1)],
  term ((4726615587885678630 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-10049305384 : Rat) / 8578069) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1)],
  term ((618006109200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((596878373200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-1449988455200 : Rat) / 150171761) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((29769461820952077165 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-69846196203100060490 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((28751735101341916465 : Rat) / 1288183727709509) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((108539351668 : Rat) / 8578069) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((-777926296504 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((332569015244 : Rat) / 25734207) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-49061641200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (12, 2)],
  term ((-49061641200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((-2363307793942839315 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((-2363307793942839315 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (13, 2), (15, 1)],
  term ((5024652692 : Rat) / 8578069) [(1, 1), (4, 1), (12, 2), (15, 1)],
  term ((5024652692 : Rat) / 8578069) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((-309003054600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-298439186600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2)],
  term ((724994227600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((-309003054600 : Rat) / 150171761) [(1, 1), (11, 1), (12, 3)],
  term ((-298439186600 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2)],
  term ((724994227600 : Rat) / 150171761) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-29769461820952077165 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((34923098101550030245 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-28751735101341916465 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 2), (15, 1)],
  term ((-29769461820952077165 : Rat) / 2576367455419018) [(1, 1), (11, 2), (12, 3), (15, 1)],
  term ((34923098101550030245 : Rat) / 1288183727709509) [(1, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-28751735101341916465 : Rat) / 2576367455419018) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-54269675834 : Rat) / 8578069) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((388963148252 : Rat) / 25734207) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-166284507622 : Rat) / 25734207) [(1, 1), (12, 2), (15, 1)],
  term ((-54269675834 : Rat) / 8578069) [(1, 1), (12, 3), (15, 1)],
  term ((388963148252 : Rat) / 25734207) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-166284507622 : Rat) / 25734207) [(1, 1), (13, 2), (15, 1)],
  term ((1866394400 : Rat) / 8833633) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((89904543023955530 : Rat) / 75775513394677) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-20453903944 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((207227951200 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((9982206469557858190 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((25533961064 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((9312118800 : Rat) / 150171761) [(2, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((448566383021072685 : Rat) / 1288183727709509) [(2, 1), (3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((874182772 : Rat) / 8578069) [(2, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-420287723400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1)],
  term ((786509499200 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-357183250400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (12, 2)],
  term ((-72142998400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-357183250400 : Rat) / 150171761) [(2, 1), (3, 1), (11, 1), (13, 2)],
  term ((37886299438948229540 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-40490665542990936285 : Rat) / 2576367455419018) [(2, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-17205579326118360230 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (12, 2), (15, 1)],
  term ((-3475140786711509080 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-17205579326118360230 : Rat) / 1288183727709509) [(2, 1), (3, 1), (11, 2), (13, 2), (15, 1)],
  term ((193158696304 : Rat) / 25734207) [(2, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-33455396826 : Rat) / 8578069) [(2, 1), (3, 1), (12, 1), (15, 1)],
  term ((-101982050248 : Rat) / 25734207) [(2, 1), (3, 1), (12, 2), (15, 1)],
  term ((10805404192 : Rat) / 25734207) [(2, 1), (3, 1), (13, 1), (15, 2)],
  term ((-101982050248 : Rat) / 25734207) [(2, 1), (3, 1), (13, 2), (15, 1)],
  term ((4735900000 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3732788800 : Rat) / 8833633) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((228129127105798750 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-179809086047911060 : Rat) / 75775513394677) [(2, 1), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-25752607000 : Rat) / 25734207) [(2, 1), (4, 1), (12, 1), (13, 1), (15, 1)],
  term ((40907807888 : Rat) / 25734207) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((332366132400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1)],
  term ((46363506400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-108349875600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (12, 2)],
  term ((-103613975600 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1), (13, 2)],
  term ((2233338171117657430 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((16010134433569614255 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-5219232361884727845 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (12, 2), (15, 1)],
  term ((-4991103234778929095 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-55170525112 : Rat) / 25734207) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((19702475036 : Rat) / 8578069) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((4328542156 : Rat) / 8578069) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((-12766980532 : Rat) / 25734207) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((9086267000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-9312118800 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-4656059400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (12, 2)],
  term ((-4656059400 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1), (13, 2)],
  term ((-448566383021072685 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((875374125028072675 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-448566383021072685 : Rat) / 2576367455419018) [(2, 1), (7, 1), (11, 2), (13, 2), (15, 1)],
  term ((-874182772 : Rat) / 8578069) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((7703581810 : Rat) / 25734207) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-437091386 : Rat) / 8578069) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((-437091386 : Rat) / 8578069) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((195194693200 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1)],
  term ((-836151032000 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((541467275200 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((128513357200 : Rat) / 150171761) [(2, 1), (11, 1), (12, 1), (15, 1)],
  term ((178591625200 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((-442896282400 : Rat) / 150171761) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((36071499200 : Rat) / 150171761) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((178591625200 : Rat) / 150171761) [(2, 1), (11, 1), (13, 3)],
  term ((-40277540712171455900 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9402562337760550465 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((26082572868458225740 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((6190510779254569765 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 1), (15, 2)],
  term ((8602789663059180115 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-21334390992697341130 : Rat) / 1288183727709509) [(2, 1), (11, 2), (12, 2), (15, 2)],
  term ((1737570393355754540 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 2), (15, 2)],
  term ((8602789663059180115 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 3), (15, 1)],
  term ((-408704257360 : Rat) / 25734207) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((147018533324 : Rat) / 25734207) [(2, 1), (12, 1), (13, 1), (15, 1)],
  term ((435467659664 : Rat) / 25734207) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((18515476604 : Rat) / 25734207) [(2, 1), (12, 1), (15, 2)],
  term ((50991025124 : Rat) / 25734207) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-312124909208 : Rat) / 25734207) [(2, 1), (12, 2), (15, 2)],
  term ((-5402702096 : Rat) / 25734207) [(2, 1), (13, 2), (15, 2)],
  term ((50991025124 : Rat) / 25734207) [(2, 1), (13, 3), (15, 1)],
  term ((207227951200 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1), (12, 1)],
  term ((9982206469557858190 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((25533961064 : Rat) / 25734207) [(2, 2), (5, 1), (12, 1), (15, 1)],
  term ((9312118800 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((448566383021072685 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((874182772 : Rat) / 8578069) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-357183250400 : Rat) / 150171761) [(2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-72142998400 : Rat) / 150171761) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-17205579326118360230 : Rat) / 1288183727709509) [(2, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-3475140786711509080 : Rat) / 1288183727709509) [(2, 2), (11, 2), (12, 1), (15, 2)],
  term ((-101982050248 : Rat) / 25734207) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((10805404192 : Rat) / 25734207) [(2, 2), (12, 1), (15, 2)],
  term ((-933197200 : Rat) / 8833633) [(3, 1), (4, 1), (11, 1), (12, 2)],
  term ((-3732788800 : Rat) / 8833633) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-11128452400 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (13, 2)],
  term ((-44952271511977765 : Rat) / 75775513394677) [(3, 1), (4, 1), (11, 2), (12, 2), (15, 1)],
  term ((-179809086047911060 : Rat) / 75775513394677) [(3, 1), (4, 1), (11, 2), (13, 1), (15, 2)],
  term ((-536059488597823255 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (13, 2), (15, 1)],
  term ((10226951972 : Rat) / 25734207) [(3, 1), (4, 1), (12, 2), (15, 1)],
  term ((40907807888 : Rat) / 25734207) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((-15525655028 : Rat) / 25734207) [(3, 1), (4, 1), (13, 2), (15, 1)],
  term ((-4735900000 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((332366132400 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((46363506400 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-228129127105798750 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((2233338171117657430 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((16010134433569614255 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((25752607000 : Rat) / 25734207) [(3, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-55170525112 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((19702475036 : Rat) / 8578069) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((9086267000 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-9312118800 : Rat) / 150171761) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-448566383021072685 : Rat) / 1288183727709509) [(3, 1), (7, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((875374125028072675 : Rat) / 2576367455419018) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-874182772 : Rat) / 8578069) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((7703581810 : Rat) / 25734207) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-478967781600 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((178591625200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((210143861700 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2)],
  term ((-393254749600 : Rat) / 150171761) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((178591625200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 3)],
  term ((541467275200 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((128513357200 : Rat) / 150171761) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((405338554900 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2)],
  term ((-1229405781600 : Rat) / 150171761) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((-23071961386053095670 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-18943149719474114770 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((40490665542990936285 : Rat) / 5152734910838036) [(3, 1), (11, 2), (12, 2), (15, 1)],
  term ((8602789663059180115 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 3), (15, 1)],
  term ((26082572868458225740 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((6190510779254569765 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 1), (15, 2)],
  term ((-59220690431645570670 : Rat) / 1288183727709509) [(3, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((78100914894033138145 : Rat) / 5152734910838036) [(3, 1), (11, 2), (13, 2), (15, 1)],
  term ((-102240735704 : Rat) / 8578069) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((50991025124 : Rat) / 25734207) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-96579348152 : Rat) / 25734207) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((16727698413 : Rat) / 8578069) [(3, 1), (12, 2), (15, 1)],
  term ((50991025124 : Rat) / 25734207) [(3, 1), (12, 3), (15, 1)],
  term ((435467659664 : Rat) / 25734207) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((18515476604 : Rat) / 25734207) [(3, 1), (13, 1), (15, 2)],
  term ((-168427868504 : Rat) / 8578069) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((197201628563 : Rat) / 25734207) [(3, 1), (13, 2), (15, 1)],
  term ((1866394400 : Rat) / 8833633) [(3, 2), (4, 1), (11, 1), (13, 1)],
  term ((89904543023955530 : Rat) / 75775513394677) [(3, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-20453903944 : Rat) / 25734207) [(3, 2), (4, 1), (13, 1), (15, 1)],
  term ((-357183250400 : Rat) / 150171761) [(3, 2), (11, 1), (12, 1), (13, 1)],
  term ((-420287723400 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1)],
  term ((786509499200 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-17205579326118360230 : Rat) / 1288183727709509) [(3, 2), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((37886299438948229540 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-40490665542990936285 : Rat) / 2576367455419018) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-101982050248 : Rat) / 25734207) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((193158696304 : Rat) / 25734207) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-33455396826 : Rat) / 8578069) [(3, 2), (13, 1), (15, 1)],
  term ((-2367950000 : Rat) / 150171761) [(4, 1), (11, 1), (12, 2), (13, 1)],
  term ((1866394400 : Rat) / 8833633) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((1866394400 : Rat) / 8833633) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2367950000 : Rat) / 150171761) [(4, 1), (11, 1), (13, 3)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 2), (13, 1), (15, 1)],
  term ((89904543023955530 : Rat) / 75775513394677) [(4, 1), (11, 2), (12, 2), (15, 2)],
  term ((89904543023955530 : Rat) / 75775513394677) [(4, 1), (11, 2), (13, 2), (15, 2)],
  term ((-114064563552899375 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 3), (15, 1)],
  term ((12876303500 : Rat) / 25734207) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((-20453903944 : Rat) / 25734207) [(4, 1), (12, 2), (15, 2)],
  term ((-20453903944 : Rat) / 25734207) [(4, 1), (13, 2), (15, 2)],
  term ((12876303500 : Rat) / 25734207) [(4, 1), (13, 3), (15, 1)],
  term ((2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((-166183066200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2)],
  term ((-23181753200 : Rat) / 150171761) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((2367950000 : Rat) / 150171761) [(5, 1), (11, 1), (12, 3)],
  term ((-166183066200 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2)],
  term ((-23181753200 : Rat) / 150171761) [(5, 1), (11, 1), (13, 2), (14, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-1116669085558828715 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-16010134433569614255 : Rat) / 2576367455419018) [(5, 1), (11, 2), (12, 2), (15, 1)],
  term ((114064563552899375 : Rat) / 1288183727709509) [(5, 1), (11, 2), (12, 3), (15, 1)],
  term ((-1116669085558828715 : Rat) / 1288183727709509) [(5, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-16010134433569614255 : Rat) / 2576367455419018) [(5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((27585262556 : Rat) / 25734207) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-9851237518 : Rat) / 8578069) [(5, 1), (12, 2), (15, 1)],
  term ((-12876303500 : Rat) / 25734207) [(5, 1), (12, 3), (15, 1)],
  term ((27585262556 : Rat) / 25734207) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-9851237518 : Rat) / 8578069) [(5, 1), (13, 2), (15, 1)],
  term ((-4543133500 : Rat) / 150171761) [(7, 1), (11, 1), (12, 2)],
  term ((4656059400 : Rat) / 150171761) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-4543133500 : Rat) / 150171761) [(7, 1), (11, 1), (13, 2)],
  term ((4656059400 : Rat) / 150171761) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((448566383021072685 : Rat) / 2576367455419018) [(7, 1), (11, 2), (12, 2), (14, 1), (15, 1)],
  term ((-875374125028072675 : Rat) / 5152734910838036) [(7, 1), (11, 2), (12, 2), (15, 1)],
  term ((448566383021072685 : Rat) / 2576367455419018) [(7, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-875374125028072675 : Rat) / 5152734910838036) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((437091386 : Rat) / 8578069) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-3851790905 : Rat) / 25734207) [(7, 1), (12, 2), (15, 1)],
  term ((437091386 : Rat) / 8578069) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-3851790905 : Rat) / 25734207) [(7, 1), (13, 2), (15, 1)],
  term ((239483890800 : Rat) / 150171761) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-97597346600 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1)],
  term ((418075516000 : Rat) / 150171761) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-270733637600 : Rat) / 150171761) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-64256678600 : Rat) / 150171761) [(11, 1), (12, 2), (15, 1)],
  term ((239483890800 : Rat) / 150171761) [(11, 1), (12, 3), (15, 1)],
  term ((-270733637600 : Rat) / 150171761) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-64256678600 : Rat) / 150171761) [(11, 1), (13, 2), (15, 1)],
  term ((-97597346600 : Rat) / 150171761) [(11, 1), (13, 3)],
  term ((418075516000 : Rat) / 150171761) [(11, 1), (13, 3), (14, 1)],
  term ((11535980693026547835 : Rat) / 1288183727709509) [(11, 2), (12, 1), (13, 2), (15, 2)],
  term ((20138770356085727950 : Rat) / 1288183727709509) [(11, 2), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-9402562337760550465 : Rat) / 2576367455419018) [(11, 2), (12, 2), (13, 1), (15, 1)],
  term ((-13041286434229112870 : Rat) / 1288183727709509) [(11, 2), (12, 2), (14, 1), (15, 2)],
  term ((-6190510779254569765 : Rat) / 2576367455419018) [(11, 2), (12, 2), (15, 2)],
  term ((11535980693026547835 : Rat) / 1288183727709509) [(11, 2), (12, 3), (15, 2)],
  term ((-13041286434229112870 : Rat) / 1288183727709509) [(11, 2), (13, 2), (14, 1), (15, 2)],
  term ((-6190510779254569765 : Rat) / 2576367455419018) [(11, 2), (13, 2), (15, 2)],
  term ((20138770356085727950 : Rat) / 1288183727709509) [(11, 2), (13, 3), (14, 1), (15, 1)],
  term ((-9402562337760550465 : Rat) / 2576367455419018) [(11, 2), (13, 3), (15, 1)],
  term ((51120367852 : Rat) / 8578069) [(12, 1), (13, 2), (15, 2)],
  term ((204352128680 : Rat) / 25734207) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-73509266662 : Rat) / 25734207) [(12, 2), (13, 1), (15, 1)],
  term ((-217733829832 : Rat) / 25734207) [(12, 2), (14, 1), (15, 2)],
  term ((-9257738302 : Rat) / 25734207) [(12, 2), (15, 2)],
  term ((51120367852 : Rat) / 8578069) [(12, 3), (15, 2)],
  term ((-217733829832 : Rat) / 25734207) [(13, 2), (14, 1), (15, 2)],
  term ((-9257738302 : Rat) / 25734207) [(13, 2), (15, 2)],
  term ((204352128680 : Rat) / 25734207) [(13, 3), (14, 1), (15, 1)],
  term ((-73509266662 : Rat) / 25734207) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 89. -/
theorem rs_R013_ueqv_R013YNNN_block_12_0000_0089_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_12_0000_0089
      rs_R013_ueqv_R013YNNN_block_12_0000_0089 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
