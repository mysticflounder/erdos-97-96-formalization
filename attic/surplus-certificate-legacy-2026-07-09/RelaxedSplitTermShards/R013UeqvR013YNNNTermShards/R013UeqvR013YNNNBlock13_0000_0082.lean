/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R013:u=v:R013YNNN, term block 13:0-82

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R013UeqvR013YNNNTermShards

/-- Generator polynomial 13 for relaxed split surplus certificate `R013:u=v:R013YNNN`. -/
def rs_R013_ueqv_R013YNNN_generator_13_0000_0082 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(2, 1), (4, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (5, 1)],
  term (-1 : Rat) [(3, 2)],
  term (-2 : Rat) [(4, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0000 : Poly :=
[
  term ((87828184400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 0 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0000 : Poly :=
[
  term ((175656368800 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-87828184400 : Rat) / 150171761) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((-175656368800 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1)],
  term ((87828184400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1)],
  term ((175656368800 : Rat) / 150171761) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((-87828184400 : Rat) / 150171761) [(0, 1), (3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0000_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0000
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0001 : Poly :=
[
  term ((4230698925749937905 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 1)]
]

/-- Partial product 1 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0001 : Poly :=
[
  term ((8461397851499875810 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(0, 1), (2, 2), (3, 1), (11, 2), (15, 1)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((4230698925749937905 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((8461397851499875810 : Rat) / 1288183727709509) [(0, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(0, 1), (3, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0001_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0001
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0002 : Poly :=
[
  term ((8184228268 : Rat) / 25734207) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 2 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0002 : Poly :=
[
  term ((16368456536 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-8184228268 : Rat) / 25734207) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((-16368456536 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (15, 1)],
  term ((8184228268 : Rat) / 25734207) [(0, 1), (3, 1), (15, 1)],
  term ((16368456536 : Rat) / 25734207) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-8184228268 : Rat) / 25734207) [(0, 1), (3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0002_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0002
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0003 : Poly :=
[
  term ((-7878039200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 3 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0003 : Poly :=
[
  term ((-15756078400 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1)],
  term ((7878039200 : Rat) / 150171761) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((-15756078400 : Rat) / 150171761) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((7878039200 : Rat) / 150171761) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((15756078400 : Rat) / 150171761) [(0, 1), (4, 1), (5, 1), (11, 1)],
  term ((-7878039200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0003_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0003
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0004 : Poly :=
[
  term ((-379486519141296290 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 4 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0004 : Poly :=
[
  term ((-758973038282592580 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((379486519141296290 : Rat) / 1288183727709509) [(0, 1), (2, 2), (5, 1), (11, 2), (15, 1)],
  term ((-758973038282592580 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((379486519141296290 : Rat) / 1288183727709509) [(0, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((758973038282592580 : Rat) / 1288183727709509) [(0, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-379486519141296290 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0004_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0004
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0005 : Poly :=
[
  term ((-12051557464 : Rat) / 25734207) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 5 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0005 : Poly :=
[
  term ((-24103114928 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1)],
  term ((12051557464 : Rat) / 25734207) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((-24103114928 : Rat) / 25734207) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((12051557464 : Rat) / 25734207) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((24103114928 : Rat) / 25734207) [(0, 1), (4, 1), (5, 1), (15, 1)],
  term ((-12051557464 : Rat) / 25734207) [(0, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0005_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0005
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0006 : Poly :=
[
  term ((38019449600 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 6 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0006 : Poly :=
[
  term ((76038899200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((76038899200 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((-76038899200 : Rat) / 150171761) [(0, 1), (4, 1), (7, 1), (11, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0006_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0006
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0007 : Poly :=
[
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 7 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0007 : Poly :=
[
  term ((3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (2, 2), (7, 1), (11, 2), (15, 1)],
  term ((3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0007_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0007
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0008 : Poly :=
[
  term ((6312091072 : Rat) / 25734207) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 8 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0008 : Poly :=
[
  term ((12624182144 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((12624182144 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-12624182144 : Rat) / 25734207) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0008_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0008
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0009 : Poly :=
[
  term ((256200097600 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 9 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0009 : Poly :=
[
  term ((512400195200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-256200097600 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((512400195200 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-256200097600 : Rat) / 150171761) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-512400195200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((256200097600 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0009_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0009
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0010 : Poly :=
[
  term ((11131685600 : Rat) / 150171761) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 10 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0010 : Poly :=
[
  term ((22263371200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((-11131685600 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((22263371200 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-11131685600 : Rat) / 150171761) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-22263371200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((11131685600 : Rat) / 150171761) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0010_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0010
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0011 : Poly :=
[
  term ((12341203283411483620 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 11 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0011 : Poly :=
[
  term ((24682406566822967240 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-12341203283411483620 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (13, 1), (15, 1)],
  term ((24682406566822967240 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-12341203283411483620 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-24682406566822967240 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((12341203283411483620 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0011_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0011
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0012 : Poly :=
[
  term ((536215232404440470 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)]
]

/-- Partial product 12 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0012 : Poly :=
[
  term ((1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 2), (15, 2)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (15, 2)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 2), (15, 2)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (15, 2)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0012_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0012
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0013 : Poly :=
[
  term ((92895922352 : Rat) / 25734207) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 13 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0013 : Poly :=
[
  term ((185791844704 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-92895922352 : Rat) / 25734207) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((185791844704 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-92895922352 : Rat) / 25734207) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-185791844704 : Rat) / 25734207) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((92895922352 : Rat) / 25734207) [(0, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0013_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0013
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0014 : Poly :=
[
  term ((-8895511928 : Rat) / 25734207) [(0, 1), (15, 2)]
]

/-- Partial product 14 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0014 : Poly :=
[
  term ((-17791023856 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((8895511928 : Rat) / 25734207) [(0, 1), (2, 2), (15, 2)],
  term ((-17791023856 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((8895511928 : Rat) / 25734207) [(0, 1), (3, 2), (15, 2)],
  term ((17791023856 : Rat) / 25734207) [(0, 1), (4, 1), (15, 2)],
  term ((-8895511928 : Rat) / 25734207) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0014_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0014
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0015 : Poly :=
[
  term ((-87828184400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 15 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0015 : Poly :=
[
  term ((-175656368800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1)],
  term ((87828184400 : Rat) / 150171761) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((175656368800 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-87828184400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)],
  term ((-175656368800 : Rat) / 150171761) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((87828184400 : Rat) / 150171761) [(1, 1), (2, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0015_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0015
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0016 : Poly :=
[
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)]
]

/-- Partial product 16 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0016 : Poly :=
[
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 2), (11, 2), (15, 1)],
  term ((8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 2), (4, 1), (11, 2), (15, 1)],
  term ((4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0016_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0016
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0017 : Poly :=
[
  term ((-8184228268 : Rat) / 25734207) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 17 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0017 : Poly :=
[
  term ((-16368456536 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((8184228268 : Rat) / 25734207) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((16368456536 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-8184228268 : Rat) / 25734207) [(1, 1), (2, 1), (15, 1)],
  term ((-16368456536 : Rat) / 25734207) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((8184228268 : Rat) / 25734207) [(1, 1), (2, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0017_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0017
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0018 : Poly :=
[
  term ((7878039200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 18 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0018 : Poly :=
[
  term ((15756078400 : Rat) / 150171761) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((-7878039200 : Rat) / 150171761) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((15756078400 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1)],
  term ((-7878039200 : Rat) / 150171761) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((7878039200 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)],
  term ((-15756078400 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0018_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0018
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0019 : Poly :=
[
  term ((379486519141296290 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 19 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0019 : Poly :=
[
  term ((758973038282592580 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 2), (11, 2), (15, 1)],
  term ((-379486519141296290 : Rat) / 1288183727709509) [(1, 1), (2, 2), (4, 1), (11, 2), (15, 1)],
  term ((758973038282592580 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-379486519141296290 : Rat) / 1288183727709509) [(1, 1), (3, 2), (4, 1), (11, 2), (15, 1)],
  term ((379486519141296290 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((-758973038282592580 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0019_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0019
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0020 : Poly :=
[
  term ((12051557464 : Rat) / 25734207) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 20 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0020 : Poly :=
[
  term ((24103114928 : Rat) / 25734207) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((-12051557464 : Rat) / 25734207) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((24103114928 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((-12051557464 : Rat) / 25734207) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((12051557464 : Rat) / 25734207) [(1, 1), (4, 1), (15, 1)],
  term ((-24103114928 : Rat) / 25734207) [(1, 1), (4, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0020_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0020
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0021 : Poly :=
[
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 21 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0021 : Poly :=
[
  term ((-293403307200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1)],
  term ((146701653600 : Rat) / 150171761) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((-293403307200 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1)],
  term ((146701653600 : Rat) / 150171761) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((293403307200 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0021_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0021
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0022 : Poly :=
[
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 22 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0022 : Poly :=
[
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (2, 2), (10, 1), (11, 2), (15, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (3, 2), (10, 1), (11, 2), (15, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0022_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0022
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0023 : Poly :=
[
  term ((-822900664 : Rat) / 8578069) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 23 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0023 : Poly :=
[
  term ((-1645801328 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((-1645801328 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((1645801328 : Rat) / 8578069) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(1, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0023_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0023
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0024 : Poly :=
[
  term ((162212486800 : Rat) / 150171761) [(1, 1), (11, 1)]
]

/-- Partial product 24 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0024 : Poly :=
[
  term ((324424973600 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((-162212486800 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1)],
  term ((324424973600 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((-162212486800 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1)],
  term ((-324424973600 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)],
  term ((162212486800 : Rat) / 150171761) [(1, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0024_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0024
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0025 : Poly :=
[
  term ((39953238400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 25 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0025 : Poly :=
[
  term ((79906476800 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((-39953238400 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((79906476800 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((-39953238400 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-79906476800 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (12, 1)],
  term ((39953238400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0025_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0025
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0026 : Poly :=
[
  term ((1924554446090897080 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 26 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0026 : Poly :=
[
  term ((3849108892181794160 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1924554446090897080 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (12, 1), (15, 1)],
  term ((3849108892181794160 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1924554446090897080 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (12, 1), (15, 1)],
  term ((-3849108892181794160 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((1924554446090897080 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0026_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0026
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0027 : Poly :=
[
  term ((7813803716156359285 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 1)]
]

/-- Partial product 27 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0027 : Poly :=
[
  term ((15627607432312718570 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((-7813803716156359285 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (15, 1)],
  term ((15627607432312718570 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-7813803716156359285 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (15, 1)],
  term ((-15627607432312718570 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((7813803716156359285 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0027_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0027
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0028 : Poly :=
[
  term ((3618965408 : Rat) / 25734207) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 28 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0028 : Poly :=
[
  term ((7237930816 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((-3618965408 : Rat) / 25734207) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((7237930816 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((-3618965408 : Rat) / 25734207) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-7237930816 : Rat) / 25734207) [(1, 1), (4, 1), (12, 1), (15, 1)],
  term ((3618965408 : Rat) / 25734207) [(1, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0028_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0028
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0029 : Poly :=
[
  term ((8764655036 : Rat) / 25734207) [(1, 1), (15, 1)]
]

/-- Partial product 29 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0029 : Poly :=
[
  term ((17529310072 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((-8764655036 : Rat) / 25734207) [(1, 1), (2, 2), (15, 1)],
  term ((17529310072 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-8764655036 : Rat) / 25734207) [(1, 1), (3, 2), (15, 1)],
  term ((-17529310072 : Rat) / 25734207) [(1, 1), (4, 1), (15, 1)],
  term ((8764655036 : Rat) / 25734207) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0029_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0029
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0030 : Poly :=
[
  term ((-26962212400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 30 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0030 : Poly :=
[
  term ((-53924424800 : Rat) / 150171761) [(2, 1), (3, 1), (5, 2), (11, 1)],
  term ((26962212400 : Rat) / 150171761) [(2, 1), (3, 2), (5, 1), (11, 1)],
  term ((53924424800 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-26962212400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)],
  term ((-53924424800 : Rat) / 150171761) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((26962212400 : Rat) / 150171761) [(2, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0030_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0030
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0031 : Poly :=
[
  term ((-1298774463069985255 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)]
]

/-- Partial product 31 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0031 : Poly :=
[
  term ((-2597548926139970510 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((1298774463069985255 : Rat) / 1288183727709509) [(2, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((2597548926139970510 : Rat) / 1288183727709509) [(2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-1298774463069985255 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)],
  term ((-2597548926139970510 : Rat) / 1288183727709509) [(2, 2), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((1298774463069985255 : Rat) / 1288183727709509) [(2, 3), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0031_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0031
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0032 : Poly :=
[
  term ((14425297132 : Rat) / 25734207) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 32 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0032 : Poly :=
[
  term ((28850594264 : Rat) / 25734207) [(2, 1), (3, 1), (5, 2), (15, 1)],
  term ((-14425297132 : Rat) / 25734207) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((-28850594264 : Rat) / 25734207) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((14425297132 : Rat) / 25734207) [(2, 1), (5, 1), (15, 1)],
  term ((28850594264 : Rat) / 25734207) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-14425297132 : Rat) / 25734207) [(2, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0032_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0032
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0033 : Poly :=
[
  term ((-11174816000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 33 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0033 : Poly :=
[
  term ((-22349632000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((11174816000 : Rat) / 150171761) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((22349632000 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-11174816000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)],
  term ((-22349632000 : Rat) / 150171761) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((11174816000 : Rat) / 150171761) [(2, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0033_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0033
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0034 : Poly :=
[
  term ((-538292831277669200 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 34 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0034 : Poly :=
[
  term ((-1076585662555338400 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((538292831277669200 : Rat) / 1288183727709509) [(2, 1), (3, 2), (7, 1), (11, 2), (15, 1)],
  term ((1076585662555338400 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-538292831277669200 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1076585662555338400 : Rat) / 1288183727709509) [(2, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((538292831277669200 : Rat) / 1288183727709509) [(2, 3), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0034_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0034
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0035 : Poly :=
[
  term ((-9560340160 : Rat) / 25734207) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 35 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0035 : Poly :=
[
  term ((-19120680320 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((9560340160 : Rat) / 25734207) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((19120680320 : Rat) / 25734207) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-9560340160 : Rat) / 25734207) [(2, 1), (7, 1), (15, 1)],
  term ((-19120680320 : Rat) / 25734207) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((9560340160 : Rat) / 25734207) [(2, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0035_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0035
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0036 : Poly :=
[
  term ((-221627019200 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 36 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0036 : Poly :=
[
  term ((-443254038400 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((221627019200 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((443254038400 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-221627019200 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)],
  term ((-443254038400 : Rat) / 150171761) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((221627019200 : Rat) / 150171761) [(2, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0036_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0036
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0037 : Poly :=
[
  term ((28089020400 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 37 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0037 : Poly :=
[
  term ((56178040800 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-28089020400 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((-56178040800 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((28089020400 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)],
  term ((56178040800 : Rat) / 150171761) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-28089020400 : Rat) / 150171761) [(2, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0037_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0037
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0038 : Poly :=
[
  term ((-10675812080735678540 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 38 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0038 : Poly :=
[
  term ((-21351624161471357080 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((10675812080735678540 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((21351624161471357080 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-10675812080735678540 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((-21351624161471357080 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((10675812080735678540 : Rat) / 1288183727709509) [(2, 3), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0038_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0038
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0039 : Poly :=
[
  term ((1353053000508662355 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)]
]

/-- Partial product 39 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0039 : Poly :=
[
  term ((2706106001017324710 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((-1353053000508662355 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (15, 2)],
  term ((-2706106001017324710 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (15, 2)],
  term ((1353053000508662355 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)],
  term ((2706106001017324710 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 2), (15, 2)],
  term ((-1353053000508662355 : Rat) / 1288183727709509) [(2, 3), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0039_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0039
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0040 : Poly :=
[
  term ((-88398373744 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 40 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0040 : Poly :=
[
  term ((-176796747488 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((88398373744 : Rat) / 25734207) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((176796747488 : Rat) / 25734207) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-88398373744 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)],
  term ((-176796747488 : Rat) / 25734207) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((88398373744 : Rat) / 25734207) [(2, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0040_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0040
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0041 : Poly :=
[
  term ((2304737996 : Rat) / 8578069) [(2, 1), (15, 2)]
]

/-- Partial product 41 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0041 : Poly :=
[
  term ((4609475992 : Rat) / 8578069) [(2, 1), (3, 1), (5, 1), (15, 2)],
  term ((-2304737996 : Rat) / 8578069) [(2, 1), (3, 2), (15, 2)],
  term ((-4609475992 : Rat) / 8578069) [(2, 1), (4, 1), (15, 2)],
  term ((2304737996 : Rat) / 8578069) [(2, 1), (15, 2)],
  term ((4609475992 : Rat) / 8578069) [(2, 2), (4, 1), (15, 2)],
  term ((-2304737996 : Rat) / 8578069) [(2, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0041_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0041
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0042 : Poly :=
[
  term ((-15873657200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 42 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0042 : Poly :=
[
  term ((-31747314400 : Rat) / 150171761) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((15873657200 : Rat) / 150171761) [(2, 2), (3, 1), (4, 1), (11, 1)],
  term ((-15873657200 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)],
  term ((31747314400 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)],
  term ((-31747314400 : Rat) / 150171761) [(3, 2), (4, 1), (5, 1), (11, 1)],
  term ((15873657200 : Rat) / 150171761) [(3, 3), (4, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0042_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0042
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0043 : Poly :=
[
  term ((-764636829538773515 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)]
]

/-- Partial product 43 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0043 : Poly :=
[
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(2, 2), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-764636829538773515 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)],
  term ((1529273659077547030 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(3, 2), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(3, 3), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0043_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0043
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0044 : Poly :=
[
  term ((-12926066884 : Rat) / 25734207) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 44 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0044 : Poly :=
[
  term ((-25852133768 : Rat) / 25734207) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((-12926066884 : Rat) / 25734207) [(3, 1), (4, 1), (15, 1)],
  term ((25852133768 : Rat) / 25734207) [(3, 1), (4, 2), (15, 1)],
  term ((-25852133768 : Rat) / 25734207) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(3, 3), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0044_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0044
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0045 : Poly :=
[
  term ((-68196266200 : Rat) / 150171761) [(3, 1), (11, 1)]
]

/-- Partial product 45 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0045 : Poly :=
[
  term ((-136392532400 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1)],
  term ((68196266200 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1)],
  term ((136392532400 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1)],
  term ((-68196266200 : Rat) / 150171761) [(3, 1), (11, 1)],
  term ((-136392532400 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)],
  term ((68196266200 : Rat) / 150171761) [(3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0045_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0045
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0046 : Poly :=
[
  term ((-16077903200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 46 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0046 : Poly :=
[
  term ((-32155806400 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((16077903200 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((32155806400 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-16077903200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)],
  term ((-32155806400 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((16077903200 : Rat) / 150171761) [(3, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0046_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0046
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0047 : Poly :=
[
  term ((-774475394900130590 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 47 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0047 : Poly :=
[
  term ((-1548950789800261180 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((774475394900130590 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((1548950789800261180 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-774475394900130590 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1548950789800261180 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((774475394900130590 : Rat) / 1288183727709509) [(3, 3), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0047_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0047
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0048 : Poly :=
[
  term ((-6570052019713544255 : Rat) / 2576367455419018) [(3, 1), (11, 2), (15, 1)]
]

/-- Partial product 48 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0048 : Poly :=
[
  term ((-6570052019713544255 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((6570052019713544255 : Rat) / 2576367455419018) [(2, 2), (3, 1), (11, 2), (15, 1)],
  term ((6570052019713544255 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-6570052019713544255 : Rat) / 2576367455419018) [(3, 1), (11, 2), (15, 1)],
  term ((-6570052019713544255 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((6570052019713544255 : Rat) / 2576367455419018) [(3, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0048_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0048
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0049 : Poly :=
[
  term ((-11043647944 : Rat) / 25734207) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 49 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0049 : Poly :=
[
  term ((-22087295888 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((11043647944 : Rat) / 25734207) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((22087295888 : Rat) / 25734207) [(3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-11043647944 : Rat) / 25734207) [(3, 1), (12, 1), (15, 1)],
  term ((-22087295888 : Rat) / 25734207) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((11043647944 : Rat) / 25734207) [(3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0049_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0049
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0050 : Poly :=
[
  term ((53048806 : Rat) / 25734207) [(3, 1), (15, 1)]
]

/-- Partial product 50 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0050 : Poly :=
[
  term ((106097612 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-53048806 : Rat) / 25734207) [(2, 2), (3, 1), (15, 1)],
  term ((-106097612 : Rat) / 25734207) [(3, 1), (4, 1), (15, 1)],
  term ((53048806 : Rat) / 25734207) [(3, 1), (15, 1)],
  term ((106097612 : Rat) / 25734207) [(3, 2), (5, 1), (15, 1)],
  term ((-53048806 : Rat) / 25734207) [(3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0050_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0050
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0051 : Poly :=
[
  term ((-13422316800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)]
]

/-- Partial product 51 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0051 : Poly :=
[
  term ((-26844633600 : Rat) / 150171761) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((13422316800 : Rat) / 150171761) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((-26844633600 : Rat) / 150171761) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((13422316800 : Rat) / 150171761) [(3, 2), (4, 1), (7, 1), (11, 1)],
  term ((-13422316800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)],
  term ((26844633600 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0051_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0051
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0052 : Poly :=
[
  term ((-646555335906902160 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 52 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0052 : Poly :=
[
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(2, 1), (4, 2), (7, 1), (11, 2), (15, 1)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(2, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(3, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-646555335906902160 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((1293110671813804320 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0052_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0052
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0053 : Poly :=
[
  term ((541374848 : Rat) / 8578069) [(4, 1), (7, 1), (15, 1)]
]

/-- Partial product 53 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0053 : Poly :=
[
  term ((1082749696 : Rat) / 8578069) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((-541374848 : Rat) / 8578069) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((1082749696 : Rat) / 8578069) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((-541374848 : Rat) / 8578069) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((541374848 : Rat) / 8578069) [(4, 1), (7, 1), (15, 1)],
  term ((-1082749696 : Rat) / 8578069) [(4, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0053_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0053
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0054 : Poly :=
[
  term ((42835869600 : Rat) / 150171761) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 54 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0054 : Poly :=
[
  term ((85671739200 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((-42835869600 : Rat) / 150171761) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((85671739200 : Rat) / 150171761) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((-42835869600 : Rat) / 150171761) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((42835869600 : Rat) / 150171761) [(4, 1), (11, 1), (15, 1)],
  term ((-85671739200 : Rat) / 150171761) [(4, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0054_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0054
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0055 : Poly :=
[
  term ((2063411292608758770 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)]
]

/-- Partial product 55 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0055 : Poly :=
[
  term ((4126822585217517540 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (15, 2)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 2), (15, 2)],
  term ((4126822585217517540 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 1), (11, 2), (15, 2)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 2), (15, 2)],
  term ((2063411292608758770 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)],
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0055_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0055
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0056 : Poly :=
[
  term ((-499743416 : Rat) / 8578069) [(4, 1), (15, 2)]
]

/-- Partial product 56 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0056 : Poly :=
[
  term ((-999486832 : Rat) / 8578069) [(2, 1), (4, 2), (15, 2)],
  term ((499743416 : Rat) / 8578069) [(2, 2), (4, 1), (15, 2)],
  term ((-999486832 : Rat) / 8578069) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((499743416 : Rat) / 8578069) [(3, 2), (4, 1), (15, 2)],
  term ((-499743416 : Rat) / 8578069) [(4, 1), (15, 2)],
  term ((999486832 : Rat) / 8578069) [(4, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0056_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0056
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0057 : Poly :=
[
  term ((29666506800 : Rat) / 150171761) [(5, 1), (11, 1)]
]

/-- Partial product 57 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0057 : Poly :=
[
  term ((59333013600 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-29666506800 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)],
  term ((59333013600 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1)],
  term ((-29666506800 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)],
  term ((-59333013600 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1)],
  term ((29666506800 : Rat) / 150171761) [(5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0057_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0057
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0058 : Poly :=
[
  term ((1429040794899014535 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 58 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0058 : Poly :=
[
  term ((2858081589798029070 : Rat) / 1288183727709509) [(2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-1429040794899014535 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((2858081589798029070 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-1429040794899014535 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-2858081589798029070 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 1)],
  term ((1429040794899014535 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0058_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0058
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0059 : Poly :=
[
  term ((-289150788 : Rat) / 8578069) [(5, 1), (15, 1)]
]

/-- Partial product 59 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0059 : Poly :=
[
  term ((-578301576 : Rat) / 8578069) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((289150788 : Rat) / 8578069) [(2, 2), (5, 1), (15, 1)],
  term ((-578301576 : Rat) / 8578069) [(3, 1), (5, 2), (15, 1)],
  term ((289150788 : Rat) / 8578069) [(3, 2), (5, 1), (15, 1)],
  term ((578301576 : Rat) / 8578069) [(4, 1), (5, 1), (15, 1)],
  term ((-289150788 : Rat) / 8578069) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0059_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0059
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0060 : Poly :=
[
  term ((11600014800 : Rat) / 150171761) [(7, 1), (11, 1)]
]

/-- Partial product 60 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0060 : Poly :=
[
  term ((23200029600 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-11600014800 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1)],
  term ((23200029600 : Rat) / 150171761) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-11600014800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)],
  term ((-23200029600 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)],
  term ((11600014800 : Rat) / 150171761) [(7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0060_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0060
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0061 : Poly :=
[
  term ((-16076222400 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 61 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0061 : Poly :=
[
  term ((-32152444800 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((16076222400 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((-32152444800 : Rat) / 150171761) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1)],
  term ((16076222400 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((32152444800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-16076222400 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0061_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0061
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0062 : Poly :=
[
  term ((-774394430471650380 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 62 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0062 : Poly :=
[
  term ((-1548788860943300760 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1548788860943300760 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((1548788860943300760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0062_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0062
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0063 : Poly :=
[
  term ((558774731463575385 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 63 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0063 : Poly :=
[
  term ((1117549462927150770 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-558774731463575385 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((1117549462927150770 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-558774731463575385 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-1117549462927150770 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((558774731463575385 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0063_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0063
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0064 : Poly :=
[
  term ((-1749490416 : Rat) / 8578069) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 64 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0064 : Poly :=
[
  term ((-3498980832 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-3498980832 : Rat) / 8578069) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((3498980832 : Rat) / 8578069) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0064_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0064
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0065 : Poly :=
[
  term ((1210104132 : Rat) / 8578069) [(7, 1), (15, 1)]
]

/-- Partial product 65 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0065 : Poly :=
[
  term ((2420208264 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((-1210104132 : Rat) / 8578069) [(2, 2), (7, 1), (15, 1)],
  term ((2420208264 : Rat) / 8578069) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-1210104132 : Rat) / 8578069) [(3, 2), (7, 1), (15, 1)],
  term ((-2420208264 : Rat) / 8578069) [(4, 1), (7, 1), (15, 1)],
  term ((1210104132 : Rat) / 8578069) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0065_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0065
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0066 : Poly :=
[
  term ((51365310000 : Rat) / 150171761) [(9, 1), (11, 1)]
]

/-- Partial product 66 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0066 : Poly :=
[
  term ((102730620000 : Rat) / 150171761) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((-51365310000 : Rat) / 150171761) [(2, 2), (9, 1), (11, 1)],
  term ((102730620000 : Rat) / 150171761) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((-51365310000 : Rat) / 150171761) [(3, 2), (9, 1), (11, 1)],
  term ((-102730620000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1)],
  term ((51365310000 : Rat) / 150171761) [(9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0066_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0066
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0067 : Poly :=
[
  term ((2474275920906006375 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 67 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0067 : Poly :=
[
  term ((4948551841812012750 : Rat) / 1288183727709509) [(2, 1), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-2474275920906006375 : Rat) / 1288183727709509) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((4948551841812012750 : Rat) / 1288183727709509) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((-2474275920906006375 : Rat) / 1288183727709509) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((2474275920906006375 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0067_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0067
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0068 : Poly :=
[
  term ((323357500 : Rat) / 8578069) [(9, 1), (15, 1)]
]

/-- Partial product 68 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0068 : Poly :=
[
  term ((646715000 : Rat) / 8578069) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((-323357500 : Rat) / 8578069) [(2, 2), (9, 1), (15, 1)],
  term ((646715000 : Rat) / 8578069) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((-323357500 : Rat) / 8578069) [(3, 2), (9, 1), (15, 1)],
  term ((-646715000 : Rat) / 8578069) [(4, 1), (9, 1), (15, 1)],
  term ((323357500 : Rat) / 8578069) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0068_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0068
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0069 : Poly :=
[
  term ((160247695200 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 69 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0069 : Poly :=
[
  term ((320495390400 : Rat) / 150171761) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-160247695200 : Rat) / 150171761) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((320495390400 : Rat) / 150171761) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((-160247695200 : Rat) / 150171761) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-320495390400 : Rat) / 150171761) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((160247695200 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0069_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0069
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0070 : Poly :=
[
  term ((7719159362886060990 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)]
]

/-- Partial product 70 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0070 : Poly :=
[
  term ((15438318725772121980 : Rat) / 1288183727709509) [(2, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-7719159362886060990 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 2), (15, 2)],
  term ((15438318725772121980 : Rat) / 1288183727709509) [(3, 1), (5, 1), (10, 1), (11, 2), (15, 2)],
  term ((-7719159362886060990 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 2), (15, 2)],
  term ((-15438318725772121980 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 2)],
  term ((7719159362886060990 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0070_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0070
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0071 : Poly :=
[
  term ((-37878632 : Rat) / 8578069) [(10, 1), (15, 2)]
]

/-- Partial product 71 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0071 : Poly :=
[
  term ((-75757264 : Rat) / 8578069) [(2, 1), (4, 1), (10, 1), (15, 2)],
  term ((37878632 : Rat) / 8578069) [(2, 2), (10, 1), (15, 2)],
  term ((-75757264 : Rat) / 8578069) [(3, 1), (5, 1), (10, 1), (15, 2)],
  term ((37878632 : Rat) / 8578069) [(3, 2), (10, 1), (15, 2)],
  term ((75757264 : Rat) / 8578069) [(4, 1), (10, 1), (15, 2)],
  term ((-37878632 : Rat) / 8578069) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0071_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0071
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0072 : Poly :=
[
  term ((-85168122400 : Rat) / 150171761) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 72 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0072 : Poly :=
[
  term ((-170336244800 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((85168122400 : Rat) / 150171761) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((-170336244800 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((85168122400 : Rat) / 150171761) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((170336244800 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-85168122400 : Rat) / 150171761) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0072_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0072
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0073 : Poly :=
[
  term ((-47386712000 : Rat) / 150171761) [(11, 1), (13, 1)]
]

/-- Partial product 73 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0073 : Poly :=
[
  term ((-94773424000 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((47386712000 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1)],
  term ((-94773424000 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((47386712000 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1)],
  term ((94773424000 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)],
  term ((-47386712000 : Rat) / 150171761) [(11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0073_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0073
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0074 : Poly :=
[
  term ((-853559566409538928 : Rat) / 1288183727709509) [(11, 1), (15, 1)]
]

/-- Partial product 74 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0074 : Poly :=
[
  term ((-1707119132819077856 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((853559566409538928 : Rat) / 1288183727709509) [(2, 2), (11, 1), (15, 1)],
  term ((-1707119132819077856 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((853559566409538928 : Rat) / 1288183727709509) [(3, 2), (11, 1), (15, 1)],
  term ((1707119132819077856 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 1)],
  term ((-853559566409538928 : Rat) / 1288183727709509) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0074_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0074
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0075 : Poly :=
[
  term ((6773020800 : Rat) / 150171761) [(11, 2)]
]

/-- Partial product 75 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0075 : Poly :=
[
  term ((13546041600 : Rat) / 150171761) [(2, 1), (4, 1), (11, 2)],
  term ((-6773020800 : Rat) / 150171761) [(2, 2), (11, 2)],
  term ((13546041600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 2)],
  term ((-6773020800 : Rat) / 150171761) [(3, 2), (11, 2)],
  term ((-13546041600 : Rat) / 150171761) [(4, 1), (11, 2)],
  term ((6773020800 : Rat) / 150171761) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0075_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0075
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0076 : Poly :=
[
  term ((-4102563276325899130 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

/-- Partial product 76 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0076 : Poly :=
[
  term ((-8205126552651798260 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((4102563276325899130 : Rat) / 1288183727709509) [(2, 2), (11, 2), (12, 1), (15, 2)],
  term ((-8205126552651798260 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (12, 1), (15, 2)],
  term ((4102563276325899130 : Rat) / 1288183727709509) [(3, 2), (11, 2), (12, 1), (15, 2)],
  term ((8205126552651798260 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (15, 2)],
  term ((-4102563276325899130 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0076_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0076
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0077 : Poly :=
[
  term ((-2282626162920221900 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 77 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0077 : Poly :=
[
  term ((-4565252325840443800 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((2282626162920221900 : Rat) / 1288183727709509) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-4565252325840443800 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((2282626162920221900 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((4565252325840443800 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2282626162920221900 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0077_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0077
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0078 : Poly :=
[
  term ((-4430223196958032990 : Rat) / 1288183727709509) [(11, 2), (15, 2)]
]

/-- Partial product 78 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0078 : Poly :=
[
  term ((-8860446393916065980 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (15, 2)],
  term ((4430223196958032990 : Rat) / 1288183727709509) [(2, 2), (11, 2), (15, 2)],
  term ((-8860446393916065980 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (15, 2)],
  term ((4430223196958032990 : Rat) / 1288183727709509) [(3, 2), (11, 2), (15, 2)],
  term ((8860446393916065980 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)],
  term ((-4430223196958032990 : Rat) / 1288183727709509) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0078_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0078
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0079 : Poly :=
[
  term ((326257590526281960 : Rat) / 1288183727709509) [(11, 3), (15, 1)]
]

/-- Partial product 79 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0079 : Poly :=
[
  term ((652515181052563920 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 3), (15, 1)],
  term ((-326257590526281960 : Rat) / 1288183727709509) [(2, 2), (11, 3), (15, 1)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 3), (15, 1)],
  term ((-326257590526281960 : Rat) / 1288183727709509) [(3, 2), (11, 3), (15, 1)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 1)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0079_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0079
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0080 : Poly :=
[
  term ((-14599636088 : Rat) / 25734207) [(12, 1), (15, 2)]
]

/-- Partial product 80 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0080 : Poly :=
[
  term ((-29199272176 : Rat) / 25734207) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((14599636088 : Rat) / 25734207) [(2, 2), (12, 1), (15, 2)],
  term ((-29199272176 : Rat) / 25734207) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((14599636088 : Rat) / 25734207) [(3, 2), (12, 1), (15, 2)],
  term ((29199272176 : Rat) / 25734207) [(4, 1), (12, 1), (15, 2)],
  term ((-14599636088 : Rat) / 25734207) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0080_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0080
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0081 : Poly :=
[
  term ((-4627030000 : Rat) / 25734207) [(13, 1), (15, 1)]
]

/-- Partial product 81 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0081 : Poly :=
[
  term ((-9254060000 : Rat) / 25734207) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((4627030000 : Rat) / 25734207) [(2, 2), (13, 1), (15, 1)],
  term ((-9254060000 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((4627030000 : Rat) / 25734207) [(3, 2), (13, 1), (15, 1)],
  term ((9254060000 : Rat) / 25734207) [(4, 1), (13, 1), (15, 1)],
  term ((-4627030000 : Rat) / 25734207) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0081_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0081
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 13. -/
def rs_R013_ueqv_R013YNNN_coefficient_13_0082 : Poly :=
[
  term ((4313864056 : Rat) / 25734207) [(15, 2)]
]

/-- Partial product 82 for generator 13. -/
def rs_R013_ueqv_R013YNNN_partial_13_0082 : Poly :=
[
  term ((8627728112 : Rat) / 25734207) [(2, 1), (4, 1), (15, 2)],
  term ((-4313864056 : Rat) / 25734207) [(2, 2), (15, 2)],
  term ((8627728112 : Rat) / 25734207) [(3, 1), (5, 1), (15, 2)],
  term ((-4313864056 : Rat) / 25734207) [(3, 2), (15, 2)],
  term ((-8627728112 : Rat) / 25734207) [(4, 1), (15, 2)],
  term ((4313864056 : Rat) / 25734207) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 13. -/
theorem rs_R013_ueqv_R013YNNN_partial_13_0082_valid :
    mulPoly rs_R013_ueqv_R013YNNN_coefficient_13_0082
        rs_R013_ueqv_R013YNNN_generator_13_0000_0082 =
      rs_R013_ueqv_R013YNNN_partial_13_0082 := by
  native_decide

/-- Partial products in this block. -/
def rs_R013_ueqv_R013YNNN_partials_13_0000_0082 : List Poly :=
[
  rs_R013_ueqv_R013YNNN_partial_13_0000,
  rs_R013_ueqv_R013YNNN_partial_13_0001,
  rs_R013_ueqv_R013YNNN_partial_13_0002,
  rs_R013_ueqv_R013YNNN_partial_13_0003,
  rs_R013_ueqv_R013YNNN_partial_13_0004,
  rs_R013_ueqv_R013YNNN_partial_13_0005,
  rs_R013_ueqv_R013YNNN_partial_13_0006,
  rs_R013_ueqv_R013YNNN_partial_13_0007,
  rs_R013_ueqv_R013YNNN_partial_13_0008,
  rs_R013_ueqv_R013YNNN_partial_13_0009,
  rs_R013_ueqv_R013YNNN_partial_13_0010,
  rs_R013_ueqv_R013YNNN_partial_13_0011,
  rs_R013_ueqv_R013YNNN_partial_13_0012,
  rs_R013_ueqv_R013YNNN_partial_13_0013,
  rs_R013_ueqv_R013YNNN_partial_13_0014,
  rs_R013_ueqv_R013YNNN_partial_13_0015,
  rs_R013_ueqv_R013YNNN_partial_13_0016,
  rs_R013_ueqv_R013YNNN_partial_13_0017,
  rs_R013_ueqv_R013YNNN_partial_13_0018,
  rs_R013_ueqv_R013YNNN_partial_13_0019,
  rs_R013_ueqv_R013YNNN_partial_13_0020,
  rs_R013_ueqv_R013YNNN_partial_13_0021,
  rs_R013_ueqv_R013YNNN_partial_13_0022,
  rs_R013_ueqv_R013YNNN_partial_13_0023,
  rs_R013_ueqv_R013YNNN_partial_13_0024,
  rs_R013_ueqv_R013YNNN_partial_13_0025,
  rs_R013_ueqv_R013YNNN_partial_13_0026,
  rs_R013_ueqv_R013YNNN_partial_13_0027,
  rs_R013_ueqv_R013YNNN_partial_13_0028,
  rs_R013_ueqv_R013YNNN_partial_13_0029,
  rs_R013_ueqv_R013YNNN_partial_13_0030,
  rs_R013_ueqv_R013YNNN_partial_13_0031,
  rs_R013_ueqv_R013YNNN_partial_13_0032,
  rs_R013_ueqv_R013YNNN_partial_13_0033,
  rs_R013_ueqv_R013YNNN_partial_13_0034,
  rs_R013_ueqv_R013YNNN_partial_13_0035,
  rs_R013_ueqv_R013YNNN_partial_13_0036,
  rs_R013_ueqv_R013YNNN_partial_13_0037,
  rs_R013_ueqv_R013YNNN_partial_13_0038,
  rs_R013_ueqv_R013YNNN_partial_13_0039,
  rs_R013_ueqv_R013YNNN_partial_13_0040,
  rs_R013_ueqv_R013YNNN_partial_13_0041,
  rs_R013_ueqv_R013YNNN_partial_13_0042,
  rs_R013_ueqv_R013YNNN_partial_13_0043,
  rs_R013_ueqv_R013YNNN_partial_13_0044,
  rs_R013_ueqv_R013YNNN_partial_13_0045,
  rs_R013_ueqv_R013YNNN_partial_13_0046,
  rs_R013_ueqv_R013YNNN_partial_13_0047,
  rs_R013_ueqv_R013YNNN_partial_13_0048,
  rs_R013_ueqv_R013YNNN_partial_13_0049,
  rs_R013_ueqv_R013YNNN_partial_13_0050,
  rs_R013_ueqv_R013YNNN_partial_13_0051,
  rs_R013_ueqv_R013YNNN_partial_13_0052,
  rs_R013_ueqv_R013YNNN_partial_13_0053,
  rs_R013_ueqv_R013YNNN_partial_13_0054,
  rs_R013_ueqv_R013YNNN_partial_13_0055,
  rs_R013_ueqv_R013YNNN_partial_13_0056,
  rs_R013_ueqv_R013YNNN_partial_13_0057,
  rs_R013_ueqv_R013YNNN_partial_13_0058,
  rs_R013_ueqv_R013YNNN_partial_13_0059,
  rs_R013_ueqv_R013YNNN_partial_13_0060,
  rs_R013_ueqv_R013YNNN_partial_13_0061,
  rs_R013_ueqv_R013YNNN_partial_13_0062,
  rs_R013_ueqv_R013YNNN_partial_13_0063,
  rs_R013_ueqv_R013YNNN_partial_13_0064,
  rs_R013_ueqv_R013YNNN_partial_13_0065,
  rs_R013_ueqv_R013YNNN_partial_13_0066,
  rs_R013_ueqv_R013YNNN_partial_13_0067,
  rs_R013_ueqv_R013YNNN_partial_13_0068,
  rs_R013_ueqv_R013YNNN_partial_13_0069,
  rs_R013_ueqv_R013YNNN_partial_13_0070,
  rs_R013_ueqv_R013YNNN_partial_13_0071,
  rs_R013_ueqv_R013YNNN_partial_13_0072,
  rs_R013_ueqv_R013YNNN_partial_13_0073,
  rs_R013_ueqv_R013YNNN_partial_13_0074,
  rs_R013_ueqv_R013YNNN_partial_13_0075,
  rs_R013_ueqv_R013YNNN_partial_13_0076,
  rs_R013_ueqv_R013YNNN_partial_13_0077,
  rs_R013_ueqv_R013YNNN_partial_13_0078,
  rs_R013_ueqv_R013YNNN_partial_13_0079,
  rs_R013_ueqv_R013YNNN_partial_13_0080,
  rs_R013_ueqv_R013YNNN_partial_13_0081,
  rs_R013_ueqv_R013YNNN_partial_13_0082
]

/-- Sum of partial products in this block. -/
def rs_R013_ueqv_R013YNNN_block_13_0000_0082 : Poly :=
[
  term ((175656368800 : Rat) / 150171761) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 1)],
  term ((8461397851499875810 : Rat) / 1288183727709509) [(0, 1), (2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((16368456536 : Rat) / 25734207) [(0, 1), (2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-15756078400 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1)],
  term ((-758973038282592580 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-24103114928 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1)],
  term ((76038899200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1)],
  term ((3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((12624182144 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (7, 1), (15, 1)],
  term ((512400195200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1)],
  term ((22263371200 : Rat) / 150171761) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1)],
  term ((24682406566822967240 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (2, 1), (4, 1), (11, 2), (15, 2)],
  term ((185791844704 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(0, 1), (2, 1), (4, 1), (15, 2)],
  term ((-87828184400 : Rat) / 150171761) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(0, 1), (2, 2), (3, 1), (11, 2), (15, 1)],
  term ((-8184228268 : Rat) / 25734207) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((7878039200 : Rat) / 150171761) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((379486519141296290 : Rat) / 1288183727709509) [(0, 1), (2, 2), (5, 1), (11, 2), (15, 1)],
  term ((12051557464 : Rat) / 25734207) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (2, 2), (7, 1), (11, 2), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-256200097600 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-11131685600 : Rat) / 150171761) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-12341203283411483620 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(0, 1), (2, 2), (11, 2), (15, 2)],
  term ((-92895922352 : Rat) / 25734207) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(0, 1), (2, 2), (15, 2)],
  term ((-175656368800 : Rat) / 150171761) [(0, 1), (3, 1), (4, 1), (11, 1)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(0, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-16368456536 : Rat) / 25734207) [(0, 1), (3, 1), (4, 1), (15, 1)],
  term ((76038899200 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((12624182144 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((512400195200 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((22263371200 : Rat) / 150171761) [(0, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((24682406566822967240 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((185791844704 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((-17791023856 : Rat) / 25734207) [(0, 1), (3, 1), (5, 1), (15, 2)],
  term ((-15756078400 : Rat) / 150171761) [(0, 1), (3, 1), (5, 2), (11, 1)],
  term ((-758973038282592580 : Rat) / 1288183727709509) [(0, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-24103114928 : Rat) / 25734207) [(0, 1), (3, 1), (5, 2), (15, 1)],
  term ((87828184400 : Rat) / 150171761) [(0, 1), (3, 1), (11, 1)],
  term ((4230698925749937905 : Rat) / 1288183727709509) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((8184228268 : Rat) / 25734207) [(0, 1), (3, 1), (15, 1)],
  term ((183534408000 : Rat) / 150171761) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((8840884370641172100 : Rat) / 1288183727709509) [(0, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((9473338000 : Rat) / 8578069) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-38019449600 : Rat) / 150171761) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((-1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (3, 2), (7, 1), (11, 2), (15, 1)],
  term ((-6312091072 : Rat) / 25734207) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-256200097600 : Rat) / 150171761) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-11131685600 : Rat) / 150171761) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-12341203283411483620 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-536215232404440470 : Rat) / 1288183727709509) [(0, 1), (3, 2), (11, 2), (15, 2)],
  term ((-92895922352 : Rat) / 25734207) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((8895511928 : Rat) / 25734207) [(0, 1), (3, 2), (15, 2)],
  term ((-87828184400 : Rat) / 150171761) [(0, 1), (3, 3), (11, 1)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(0, 1), (3, 3), (11, 2), (15, 1)],
  term ((-8184228268 : Rat) / 25734207) [(0, 1), (3, 3), (15, 1)],
  term ((15756078400 : Rat) / 150171761) [(0, 1), (4, 1), (5, 1), (11, 1)],
  term ((758973038282592580 : Rat) / 1288183727709509) [(0, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((24103114928 : Rat) / 25734207) [(0, 1), (4, 1), (5, 1), (15, 1)],
  term ((-76038899200 : Rat) / 150171761) [(0, 1), (4, 1), (7, 1), (11, 1)],
  term ((-3662807006182947040 : Rat) / 1288183727709509) [(0, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-12624182144 : Rat) / 25734207) [(0, 1), (4, 1), (7, 1), (15, 1)],
  term ((-512400195200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (13, 1)],
  term ((-22263371200 : Rat) / 150171761) [(0, 1), (4, 1), (11, 1), (15, 1)],
  term ((-24682406566822967240 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1072430464808880940 : Rat) / 1288183727709509) [(0, 1), (4, 1), (11, 2), (15, 2)],
  term ((-185791844704 : Rat) / 25734207) [(0, 1), (4, 1), (13, 1), (15, 1)],
  term ((17791023856 : Rat) / 25734207) [(0, 1), (4, 1), (15, 2)],
  term ((-7878039200 : Rat) / 150171761) [(0, 1), (5, 1), (11, 1)],
  term ((-379486519141296290 : Rat) / 1288183727709509) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((-12051557464 : Rat) / 25734207) [(0, 1), (5, 1), (15, 1)],
  term ((38019449600 : Rat) / 150171761) [(0, 1), (7, 1), (11, 1)],
  term ((1831403503091473520 : Rat) / 1288183727709509) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((6312091072 : Rat) / 25734207) [(0, 1), (7, 1), (15, 1)],
  term ((256200097600 : Rat) / 150171761) [(0, 1), (11, 1), (13, 1)],
  term ((11131685600 : Rat) / 150171761) [(0, 1), (11, 1), (15, 1)],
  term ((12341203283411483620 : Rat) / 1288183727709509) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((536215232404440470 : Rat) / 1288183727709509) [(0, 1), (11, 2), (15, 2)],
  term ((92895922352 : Rat) / 25734207) [(0, 1), (13, 1), (15, 1)],
  term ((-8895511928 : Rat) / 25734207) [(0, 1), (15, 2)],
  term ((-175656368800 : Rat) / 150171761) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 1)],
  term ((-8461397851499875810 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-16368456536 : Rat) / 25734207) [(1, 1), (2, 1), (3, 1), (5, 1), (15, 1)],
  term ((87828184400 : Rat) / 150171761) [(1, 1), (2, 1), (3, 2), (11, 1)],
  term ((4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 1), (3, 2), (11, 2), (15, 1)],
  term ((8184228268 : Rat) / 25734207) [(1, 1), (2, 1), (3, 2), (15, 1)],
  term ((-293403307200 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1645801328 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (10, 1), (15, 1)],
  term ((500081342400 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1)],
  term ((79906476800 : Rat) / 150171761) [(1, 1), (2, 1), (4, 1), (11, 1), (12, 1)],
  term ((3849108892181794160 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((24089005283812594380 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 1), (11, 2), (15, 1)],
  term ((7237930816 : Rat) / 25734207) [(1, 1), (2, 1), (4, 1), (12, 1), (15, 1)],
  term ((11299255536 : Rat) / 8578069) [(1, 1), (2, 1), (4, 1), (15, 1)],
  term ((15756078400 : Rat) / 150171761) [(1, 1), (2, 1), (4, 2), (11, 1)],
  term ((758973038282592580 : Rat) / 1288183727709509) [(1, 1), (2, 1), (4, 2), (11, 2), (15, 1)],
  term ((24103114928 : Rat) / 25734207) [(1, 1), (2, 1), (4, 2), (15, 1)],
  term ((-87828184400 : Rat) / 150171761) [(1, 1), (2, 1), (11, 1)],
  term ((-4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 1), (11, 2), (15, 1)],
  term ((-8184228268 : Rat) / 25734207) [(1, 1), (2, 1), (15, 1)],
  term ((-183534408000 : Rat) / 150171761) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((-8840884370641172100 : Rat) / 1288183727709509) [(1, 1), (2, 2), (4, 1), (11, 2), (15, 1)],
  term ((-9473338000 : Rat) / 8578069) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(1, 1), (2, 2), (10, 1), (11, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (2, 2), (10, 1), (11, 2), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(1, 1), (2, 2), (10, 1), (15, 1)],
  term ((-162212486800 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1)],
  term ((-39953238400 : Rat) / 150171761) [(1, 1), (2, 2), (11, 1), (12, 1)],
  term ((-1924554446090897080 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (12, 1), (15, 1)],
  term ((-7813803716156359285 : Rat) / 1288183727709509) [(1, 1), (2, 2), (11, 2), (15, 1)],
  term ((-3618965408 : Rat) / 25734207) [(1, 1), (2, 2), (12, 1), (15, 1)],
  term ((-8764655036 : Rat) / 25734207) [(1, 1), (2, 2), (15, 1)],
  term ((87828184400 : Rat) / 150171761) [(1, 1), (2, 3), (11, 1)],
  term ((4230698925749937905 : Rat) / 1288183727709509) [(1, 1), (2, 3), (11, 2), (15, 1)],
  term ((8184228268 : Rat) / 25734207) [(1, 1), (2, 3), (15, 1)],
  term ((15756078400 : Rat) / 150171761) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1)],
  term ((758973038282592580 : Rat) / 1288183727709509) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((24103114928 : Rat) / 25734207) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1)],
  term ((-293403307200 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 1)],
  term ((-14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (10, 1), (11, 2), (15, 1)],
  term ((-1645801328 : Rat) / 8578069) [(1, 1), (3, 1), (5, 1), (10, 1), (15, 1)],
  term ((324424973600 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1)],
  term ((79906476800 : Rat) / 150171761) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1)],
  term ((3849108892181794160 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((15627607432312718570 : Rat) / 1288183727709509) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((7237930816 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1)],
  term ((17529310072 : Rat) / 25734207) [(1, 1), (3, 1), (5, 1), (15, 1)],
  term ((-7878039200 : Rat) / 150171761) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((-379486519141296290 : Rat) / 1288183727709509) [(1, 1), (3, 2), (4, 1), (11, 2), (15, 1)],
  term ((-12051557464 : Rat) / 25734207) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((146701653600 : Rat) / 150171761) [(1, 1), (3, 2), (10, 1), (11, 1)],
  term ((7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (3, 2), (10, 1), (11, 2), (15, 1)],
  term ((822900664 : Rat) / 8578069) [(1, 1), (3, 2), (10, 1), (15, 1)],
  term ((-162212486800 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1)],
  term ((-39953238400 : Rat) / 150171761) [(1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-1924554446090897080 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (12, 1), (15, 1)],
  term ((-7813803716156359285 : Rat) / 1288183727709509) [(1, 1), (3, 2), (11, 2), (15, 1)],
  term ((-3618965408 : Rat) / 25734207) [(1, 1), (3, 2), (12, 1), (15, 1)],
  term ((-8764655036 : Rat) / 25734207) [(1, 1), (3, 2), (15, 1)],
  term ((293403307200 : Rat) / 150171761) [(1, 1), (4, 1), (10, 1), (11, 1)],
  term ((14133288363666994140 : Rat) / 1288183727709509) [(1, 1), (4, 1), (10, 1), (11, 2), (15, 1)],
  term ((1645801328 : Rat) / 8578069) [(1, 1), (4, 1), (10, 1), (15, 1)],
  term ((-316546934400 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1)],
  term ((-79906476800 : Rat) / 150171761) [(1, 1), (4, 1), (11, 1), (12, 1)],
  term ((-3849108892181794160 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-15248120913171422280 : Rat) / 1288183727709509) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((-7237930816 : Rat) / 25734207) [(1, 1), (4, 1), (12, 1), (15, 1)],
  term ((-1825917536 : Rat) / 8578069) [(1, 1), (4, 1), (15, 1)],
  term ((-15756078400 : Rat) / 150171761) [(1, 1), (4, 2), (11, 1)],
  term ((-758973038282592580 : Rat) / 1288183727709509) [(1, 1), (4, 2), (11, 2), (15, 1)],
  term ((-24103114928 : Rat) / 25734207) [(1, 1), (4, 2), (15, 1)],
  term ((-146701653600 : Rat) / 150171761) [(1, 1), (10, 1), (11, 1)],
  term ((-7066644181833497070 : Rat) / 1288183727709509) [(1, 1), (10, 1), (11, 2), (15, 1)],
  term ((-822900664 : Rat) / 8578069) [(1, 1), (10, 1), (15, 1)],
  term ((162212486800 : Rat) / 150171761) [(1, 1), (11, 1)],
  term ((39953238400 : Rat) / 150171761) [(1, 1), (11, 1), (12, 1)],
  term ((1924554446090897080 : Rat) / 1288183727709509) [(1, 1), (11, 2), (12, 1), (15, 1)],
  term ((7813803716156359285 : Rat) / 1288183727709509) [(1, 1), (11, 2), (15, 1)],
  term ((3618965408 : Rat) / 25734207) [(1, 1), (12, 1), (15, 1)],
  term ((8764655036 : Rat) / 25734207) [(1, 1), (15, 1)],
  term ((-136392532400 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1)],
  term ((-32155806400 : Rat) / 150171761) [(2, 1), (3, 1), (4, 1), (11, 1), (12, 1)],
  term ((-1548950789800261180 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6570052019713544255 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((-22087295888 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (12, 1), (15, 1)],
  term ((106097612 : Rat) / 25734207) [(2, 1), (3, 1), (4, 1), (15, 1)],
  term ((-31747314400 : Rat) / 150171761) [(2, 1), (3, 1), (4, 2), (11, 1)],
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(2, 1), (3, 1), (4, 2), (11, 2), (15, 1)],
  term ((-25852133768 : Rat) / 25734207) [(2, 1), (3, 1), (4, 2), (15, 1)],
  term ((-22349632000 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-1076585662555338400 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-19120680320 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (7, 1), (15, 1)],
  term ((-443254038400 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (13, 1)],
  term ((56178040800 : Rat) / 150171761) [(2, 1), (3, 1), (5, 1), (11, 1), (15, 1)],
  term ((-21351624161471357080 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((2706106001017324710 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 1), (11, 2), (15, 2)],
  term ((-176796747488 : Rat) / 25734207) [(2, 1), (3, 1), (5, 1), (13, 1), (15, 1)],
  term ((4609475992 : Rat) / 8578069) [(2, 1), (3, 1), (5, 1), (15, 2)],
  term ((-53924424800 : Rat) / 150171761) [(2, 1), (3, 1), (5, 2), (11, 1)],
  term ((-2597548926139970510 : Rat) / 1288183727709509) [(2, 1), (3, 1), (5, 2), (11, 2), (15, 1)],
  term ((28850594264 : Rat) / 25734207) [(2, 1), (3, 1), (5, 2), (15, 1)],
  term ((26962212400 : Rat) / 150171761) [(2, 1), (3, 2), (5, 1), (11, 1)],
  term ((1298774463069985255 : Rat) / 1288183727709509) [(2, 1), (3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-14425297132 : Rat) / 25734207) [(2, 1), (3, 2), (5, 1), (15, 1)],
  term ((11174816000 : Rat) / 150171761) [(2, 1), (3, 2), (7, 1), (11, 1)],
  term ((538292831277669200 : Rat) / 1288183727709509) [(2, 1), (3, 2), (7, 1), (11, 2), (15, 1)],
  term ((9560340160 : Rat) / 25734207) [(2, 1), (3, 2), (7, 1), (15, 1)],
  term ((221627019200 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (13, 1)],
  term ((-28089020400 : Rat) / 150171761) [(2, 1), (3, 2), (11, 1), (15, 1)],
  term ((10675812080735678540 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-1353053000508662355 : Rat) / 1288183727709509) [(2, 1), (3, 2), (11, 2), (15, 2)],
  term ((88398373744 : Rat) / 25734207) [(2, 1), (3, 2), (13, 1), (15, 1)],
  term ((-2304737996 : Rat) / 8578069) [(2, 1), (3, 2), (15, 2)],
  term ((113257438400 : Rat) / 150171761) [(2, 1), (4, 1), (5, 1), (11, 1)],
  term ((92468313829457620 : Rat) / 21833622503551) [(2, 1), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-518398288 : Rat) / 436173) [(2, 1), (4, 1), (5, 1), (15, 1)],
  term ((45549661600 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1)],
  term ((-32152444800 : Rat) / 150171761) [(2, 1), (4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-1548788860943300760 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((2194135125482489170 : Rat) / 1288183727709509) [(2, 1), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3498980832 : Rat) / 8578069) [(2, 1), (4, 1), (7, 1), (12, 1), (15, 1)],
  term ((26381305112 : Rat) / 25734207) [(2, 1), (4, 1), (7, 1), (15, 1)],
  term ((102730620000 : Rat) / 150171761) [(2, 1), (4, 1), (9, 1), (11, 1)],
  term ((4948551841812012750 : Rat) / 1288183727709509) [(2, 1), (4, 1), (9, 1), (11, 2), (15, 1)],
  term ((646715000 : Rat) / 8578069) [(2, 1), (4, 1), (9, 1), (15, 1)],
  term ((320495390400 : Rat) / 150171761) [(2, 1), (4, 1), (10, 1), (11, 1), (15, 1)],
  term ((15438318725772121980 : Rat) / 1288183727709509) [(2, 1), (4, 1), (10, 1), (11, 2), (15, 2)],
  term ((-75757264 : Rat) / 8578069) [(2, 1), (4, 1), (10, 1), (15, 2)],
  term ((-170336244800 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (12, 1), (15, 1)],
  term ((348480614400 : Rat) / 150171761) [(2, 1), (4, 1), (11, 1), (13, 1)],
  term ((-2189018243086293056 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(2, 1), (4, 1), (11, 2)],
  term ((-8205126552651798260 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (12, 1), (15, 2)],
  term ((16786371835630913280 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-11566552394933390690 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 2), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(2, 1), (4, 1), (11, 3), (15, 1)],
  term ((-29199272176 : Rat) / 25734207) [(2, 1), (4, 1), (12, 1), (15, 2)],
  term ((55847562496 : Rat) / 8578069) [(2, 1), (4, 1), (13, 1), (15, 1)],
  term ((-5200699864 : Rat) / 25734207) [(2, 1), (4, 1), (15, 2)],
  term ((-26844633600 : Rat) / 150171761) [(2, 1), (4, 2), (7, 1), (11, 1)],
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(2, 1), (4, 2), (7, 1), (11, 2), (15, 1)],
  term ((1082749696 : Rat) / 8578069) [(2, 1), (4, 2), (7, 1), (15, 1)],
  term ((85671739200 : Rat) / 150171761) [(2, 1), (4, 2), (11, 1), (15, 1)],
  term ((4126822585217517540 : Rat) / 1288183727709509) [(2, 1), (4, 2), (11, 2), (15, 2)],
  term ((-999486832 : Rat) / 8578069) [(2, 1), (4, 2), (15, 2)],
  term ((-26962212400 : Rat) / 150171761) [(2, 1), (5, 1), (11, 1)],
  term ((-1298774463069985255 : Rat) / 1288183727709509) [(2, 1), (5, 1), (11, 2), (15, 1)],
  term ((14425297132 : Rat) / 25734207) [(2, 1), (5, 1), (15, 1)],
  term ((-11174816000 : Rat) / 150171761) [(2, 1), (7, 1), (11, 1)],
  term ((-538292831277669200 : Rat) / 1288183727709509) [(2, 1), (7, 1), (11, 2), (15, 1)],
  term ((-9560340160 : Rat) / 25734207) [(2, 1), (7, 1), (15, 1)],
  term ((-221627019200 : Rat) / 150171761) [(2, 1), (11, 1), (13, 1)],
  term ((28089020400 : Rat) / 150171761) [(2, 1), (11, 1), (15, 1)],
  term ((-10675812080735678540 : Rat) / 1288183727709509) [(2, 1), (11, 2), (13, 1), (15, 1)],
  term ((1353053000508662355 : Rat) / 1288183727709509) [(2, 1), (11, 2), (15, 2)],
  term ((-88398373744 : Rat) / 25734207) [(2, 1), (13, 1), (15, 1)],
  term ((2304737996 : Rat) / 8578069) [(2, 1), (15, 2)],
  term ((15873657200 : Rat) / 150171761) [(2, 2), (3, 1), (4, 1), (11, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(2, 2), (3, 1), (4, 1), (11, 2), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(2, 2), (3, 1), (4, 1), (15, 1)],
  term ((68196266200 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1)],
  term ((16077903200 : Rat) / 150171761) [(2, 2), (3, 1), (11, 1), (12, 1)],
  term ((774475394900130590 : Rat) / 1288183727709509) [(2, 2), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((6570052019713544255 : Rat) / 2576367455419018) [(2, 2), (3, 1), (11, 2), (15, 1)],
  term ((11043647944 : Rat) / 25734207) [(2, 2), (3, 1), (12, 1), (15, 1)],
  term ((-53048806 : Rat) / 25734207) [(2, 2), (3, 1), (15, 1)],
  term ((-53924424800 : Rat) / 150171761) [(2, 2), (4, 1), (5, 1), (11, 1)],
  term ((-2597548926139970510 : Rat) / 1288183727709509) [(2, 2), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((28850594264 : Rat) / 25734207) [(2, 2), (4, 1), (5, 1), (15, 1)],
  term ((-8927315200 : Rat) / 150171761) [(2, 2), (4, 1), (7, 1), (11, 1)],
  term ((-430030326648436240 : Rat) / 1288183727709509) [(2, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-20744804864 : Rat) / 25734207) [(2, 2), (4, 1), (7, 1), (15, 1)],
  term ((-443254038400 : Rat) / 150171761) [(2, 2), (4, 1), (11, 1), (13, 1)],
  term ((34123200 : Rat) / 384071) [(2, 2), (4, 1), (11, 1), (15, 1)],
  term ((-21351624161471357080 : Rat) / 1288183727709509) [(2, 2), (4, 1), (11, 2), (13, 1), (15, 1)],
  term ((1643720481863340 : Rat) / 3294587538899) [(2, 2), (4, 1), (11, 2), (15, 2)],
  term ((-176796747488 : Rat) / 25734207) [(2, 2), (4, 1), (13, 1), (15, 1)],
  term ((5109219408 : Rat) / 8578069) [(2, 2), (4, 1), (15, 2)],
  term ((-29666506800 : Rat) / 150171761) [(2, 2), (5, 1), (11, 1)],
  term ((-1429040794899014535 : Rat) / 1288183727709509) [(2, 2), (5, 1), (11, 2), (15, 1)],
  term ((289150788 : Rat) / 8578069) [(2, 2), (5, 1), (15, 1)],
  term ((-11600014800 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1)],
  term ((16076222400 : Rat) / 150171761) [(2, 2), (7, 1), (11, 1), (12, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-558774731463575385 : Rat) / 1288183727709509) [(2, 2), (7, 1), (11, 2), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-1210104132 : Rat) / 8578069) [(2, 2), (7, 1), (15, 1)],
  term ((-51365310000 : Rat) / 150171761) [(2, 2), (9, 1), (11, 1)],
  term ((-2474275920906006375 : Rat) / 1288183727709509) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-323357500 : Rat) / 8578069) [(2, 2), (9, 1), (15, 1)],
  term ((-160247695200 : Rat) / 150171761) [(2, 2), (10, 1), (11, 1), (15, 1)],
  term ((-7719159362886060990 : Rat) / 1288183727709509) [(2, 2), (10, 1), (11, 2), (15, 2)],
  term ((37878632 : Rat) / 8578069) [(2, 2), (10, 1), (15, 2)],
  term ((85168122400 : Rat) / 150171761) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((47386712000 : Rat) / 150171761) [(2, 2), (11, 1), (13, 1)],
  term ((853559566409538928 : Rat) / 1288183727709509) [(2, 2), (11, 1), (15, 1)],
  term ((-6773020800 : Rat) / 150171761) [(2, 2), (11, 2)],
  term ((4102563276325899130 : Rat) / 1288183727709509) [(2, 2), (11, 2), (12, 1), (15, 2)],
  term ((2282626162920221900 : Rat) / 1288183727709509) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((4430223196958032990 : Rat) / 1288183727709509) [(2, 2), (11, 2), (15, 2)],
  term ((-326257590526281960 : Rat) / 1288183727709509) [(2, 2), (11, 3), (15, 1)],
  term ((14599636088 : Rat) / 25734207) [(2, 2), (12, 1), (15, 2)],
  term ((4627030000 : Rat) / 25734207) [(2, 2), (13, 1), (15, 1)],
  term ((-4313864056 : Rat) / 25734207) [(2, 2), (15, 2)],
  term ((26962212400 : Rat) / 150171761) [(2, 3), (5, 1), (11, 1)],
  term ((1298774463069985255 : Rat) / 1288183727709509) [(2, 3), (5, 1), (11, 2), (15, 1)],
  term ((-14425297132 : Rat) / 25734207) [(2, 3), (5, 1), (15, 1)],
  term ((11174816000 : Rat) / 150171761) [(2, 3), (7, 1), (11, 1)],
  term ((538292831277669200 : Rat) / 1288183727709509) [(2, 3), (7, 1), (11, 2), (15, 1)],
  term ((9560340160 : Rat) / 25734207) [(2, 3), (7, 1), (15, 1)],
  term ((221627019200 : Rat) / 150171761) [(2, 3), (11, 1), (13, 1)],
  term ((-28089020400 : Rat) / 150171761) [(2, 3), (11, 1), (15, 1)],
  term ((10675812080735678540 : Rat) / 1288183727709509) [(2, 3), (11, 2), (13, 1), (15, 1)],
  term ((-1353053000508662355 : Rat) / 1288183727709509) [(2, 3), (11, 2), (15, 2)],
  term ((88398373744 : Rat) / 25734207) [(2, 3), (13, 1), (15, 1)],
  term ((-2304737996 : Rat) / 8578069) [(2, 3), (15, 2)],
  term ((-26844633600 : Rat) / 150171761) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1)],
  term ((-1293110671813804320 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((1082749696 : Rat) / 8578069) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1)],
  term ((85671739200 : Rat) / 150171761) [(3, 1), (4, 1), (5, 1), (11, 1), (15, 1)],
  term ((4126822585217517540 : Rat) / 1288183727709509) [(3, 1), (4, 1), (5, 1), (11, 2), (15, 2)],
  term ((-999486832 : Rat) / 8578069) [(3, 1), (4, 1), (5, 1), (15, 2)],
  term ((7089345600 : Rat) / 8833633) [(3, 1), (4, 1), (11, 1)],
  term ((32155806400 : Rat) / 150171761) [(3, 1), (4, 1), (11, 1), (12, 1)],
  term ((1548950789800261180 : Rat) / 1288183727709509) [(3, 1), (4, 1), (11, 2), (12, 1), (15, 1)],
  term ((5788051037063580 : Rat) / 1284330735503) [(3, 1), (4, 1), (11, 2), (15, 1)],
  term ((22087295888 : Rat) / 25734207) [(3, 1), (4, 1), (12, 1), (15, 1)],
  term ((-73628048 : Rat) / 145391) [(3, 1), (4, 1), (15, 1)],
  term ((31747314400 : Rat) / 150171761) [(3, 1), (4, 2), (11, 1)],
  term ((1529273659077547030 : Rat) / 1288183727709509) [(3, 1), (4, 2), (11, 2), (15, 1)],
  term ((25852133768 : Rat) / 25734207) [(3, 1), (4, 2), (15, 1)],
  term ((23200029600 : Rat) / 150171761) [(3, 1), (5, 1), (7, 1), (11, 1)],
  term ((-32152444800 : Rat) / 150171761) [(3, 1), (5, 1), (7, 1), (11, 1), (12, 1)],
  term ((-1548788860943300760 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((1117549462927150770 : Rat) / 1288183727709509) [(3, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((-3498980832 : Rat) / 8578069) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((2420208264 : Rat) / 8578069) [(3, 1), (5, 1), (7, 1), (15, 1)],
  term ((102730620000 : Rat) / 150171761) [(3, 1), (5, 1), (9, 1), (11, 1)],
  term ((4948551841812012750 : Rat) / 1288183727709509) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1)],
  term ((646715000 : Rat) / 8578069) [(3, 1), (5, 1), (9, 1), (15, 1)],
  term ((320495390400 : Rat) / 150171761) [(3, 1), (5, 1), (10, 1), (11, 1), (15, 1)],
  term ((15438318725772121980 : Rat) / 1288183727709509) [(3, 1), (5, 1), (10, 1), (11, 2), (15, 2)],
  term ((-75757264 : Rat) / 8578069) [(3, 1), (5, 1), (10, 1), (15, 2)],
  term ((-170336244800 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (12, 1), (15, 1)],
  term ((-94773424000 : Rat) / 150171761) [(3, 1), (5, 1), (11, 1), (13, 1)],
  term ((-1707119132819077856 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 1), (15, 1)],
  term ((13546041600 : Rat) / 150171761) [(3, 1), (5, 1), (11, 2)],
  term ((-8205126552651798260 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (12, 1), (15, 2)],
  term ((-4565252325840443800 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-8860446393916065980 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 2), (15, 2)],
  term ((652515181052563920 : Rat) / 1288183727709509) [(3, 1), (5, 1), (11, 3), (15, 1)],
  term ((-29199272176 : Rat) / 25734207) [(3, 1), (5, 1), (12, 1), (15, 2)],
  term ((-9254060000 : Rat) / 25734207) [(3, 1), (5, 1), (13, 1), (15, 1)],
  term ((8627728112 : Rat) / 25734207) [(3, 1), (5, 1), (15, 2)],
  term ((59333013600 : Rat) / 150171761) [(3, 1), (5, 2), (11, 1)],
  term ((2858081589798029070 : Rat) / 1288183727709509) [(3, 1), (5, 2), (11, 2), (15, 1)],
  term ((-578301576 : Rat) / 8578069) [(3, 1), (5, 2), (15, 1)],
  term ((-68196266200 : Rat) / 150171761) [(3, 1), (11, 1)],
  term ((-16077903200 : Rat) / 150171761) [(3, 1), (11, 1), (12, 1)],
  term ((-774475394900130590 : Rat) / 1288183727709509) [(3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-6570052019713544255 : Rat) / 2576367455419018) [(3, 1), (11, 2), (15, 1)],
  term ((-11043647944 : Rat) / 25734207) [(3, 1), (12, 1), (15, 1)],
  term ((53048806 : Rat) / 25734207) [(3, 1), (15, 1)],
  term ((-31747314400 : Rat) / 150171761) [(3, 2), (4, 1), (5, 1), (11, 1)],
  term ((-1529273659077547030 : Rat) / 1288183727709509) [(3, 2), (4, 1), (5, 1), (11, 2), (15, 1)],
  term ((-25852133768 : Rat) / 25734207) [(3, 2), (4, 1), (5, 1), (15, 1)],
  term ((13422316800 : Rat) / 150171761) [(3, 2), (4, 1), (7, 1), (11, 1)],
  term ((646555335906902160 : Rat) / 1288183727709509) [(3, 2), (4, 1), (7, 1), (11, 2), (15, 1)],
  term ((-541374848 : Rat) / 8578069) [(3, 2), (4, 1), (7, 1), (15, 1)],
  term ((-42835869600 : Rat) / 150171761) [(3, 2), (4, 1), (11, 1), (15, 1)],
  term ((-2063411292608758770 : Rat) / 1288183727709509) [(3, 2), (4, 1), (11, 2), (15, 2)],
  term ((499743416 : Rat) / 8578069) [(3, 2), (4, 1), (15, 2)],
  term ((-166059039200 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1)],
  term ((-32155806400 : Rat) / 150171761) [(3, 2), (5, 1), (11, 1), (12, 1)],
  term ((-1548950789800261180 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-7999092814612558790 : Rat) / 1288183727709509) [(3, 2), (5, 1), (11, 2), (15, 1)],
  term ((-22087295888 : Rat) / 25734207) [(3, 2), (5, 1), (12, 1), (15, 1)],
  term ((973549976 : Rat) / 25734207) [(3, 2), (5, 1), (15, 1)],
  term ((-11600014800 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1)],
  term ((16076222400 : Rat) / 150171761) [(3, 2), (7, 1), (11, 1), (12, 1)],
  term ((774394430471650380 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-558774731463575385 : Rat) / 1288183727709509) [(3, 2), (7, 1), (11, 2), (15, 1)],
  term ((1749490416 : Rat) / 8578069) [(3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-1210104132 : Rat) / 8578069) [(3, 2), (7, 1), (15, 1)],
  term ((-51365310000 : Rat) / 150171761) [(3, 2), (9, 1), (11, 1)],
  term ((-2474275920906006375 : Rat) / 1288183727709509) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((-323357500 : Rat) / 8578069) [(3, 2), (9, 1), (15, 1)],
  term ((-160247695200 : Rat) / 150171761) [(3, 2), (10, 1), (11, 1), (15, 1)],
  term ((-7719159362886060990 : Rat) / 1288183727709509) [(3, 2), (10, 1), (11, 2), (15, 2)],
  term ((37878632 : Rat) / 8578069) [(3, 2), (10, 1), (15, 2)],
  term ((85168122400 : Rat) / 150171761) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((47386712000 : Rat) / 150171761) [(3, 2), (11, 1), (13, 1)],
  term ((853559566409538928 : Rat) / 1288183727709509) [(3, 2), (11, 1), (15, 1)],
  term ((-6773020800 : Rat) / 150171761) [(3, 2), (11, 2)],
  term ((4102563276325899130 : Rat) / 1288183727709509) [(3, 2), (11, 2), (12, 1), (15, 2)],
  term ((2282626162920221900 : Rat) / 1288183727709509) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((4430223196958032990 : Rat) / 1288183727709509) [(3, 2), (11, 2), (15, 2)],
  term ((-326257590526281960 : Rat) / 1288183727709509) [(3, 2), (11, 3), (15, 1)],
  term ((14599636088 : Rat) / 25734207) [(3, 2), (12, 1), (15, 2)],
  term ((4627030000 : Rat) / 25734207) [(3, 2), (13, 1), (15, 1)],
  term ((-4313864056 : Rat) / 25734207) [(3, 2), (15, 2)],
  term ((15873657200 : Rat) / 150171761) [(3, 3), (4, 1), (11, 1)],
  term ((764636829538773515 : Rat) / 1288183727709509) [(3, 3), (4, 1), (11, 2), (15, 1)],
  term ((12926066884 : Rat) / 25734207) [(3, 3), (4, 1), (15, 1)],
  term ((68196266200 : Rat) / 150171761) [(3, 3), (11, 1)],
  term ((16077903200 : Rat) / 150171761) [(3, 3), (11, 1), (12, 1)],
  term ((774475394900130590 : Rat) / 1288183727709509) [(3, 3), (11, 2), (12, 1), (15, 1)],
  term ((6570052019713544255 : Rat) / 2576367455419018) [(3, 3), (11, 2), (15, 1)],
  term ((11043647944 : Rat) / 25734207) [(3, 3), (12, 1), (15, 1)],
  term ((-53048806 : Rat) / 25734207) [(3, 3), (15, 1)],
  term ((-59333013600 : Rat) / 150171761) [(4, 1), (5, 1), (11, 1)],
  term ((-2858081589798029070 : Rat) / 1288183727709509) [(4, 1), (5, 1), (11, 2), (15, 1)],
  term ((578301576 : Rat) / 8578069) [(4, 1), (5, 1), (15, 1)],
  term ((-36622346400 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1)],
  term ((32152444800 : Rat) / 150171761) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((1548788860943300760 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-1764104798834052930 : Rat) / 1288183727709509) [(4, 1), (7, 1), (11, 2), (15, 1)],
  term ((3498980832 : Rat) / 8578069) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1878833416 : Rat) / 8578069) [(4, 1), (7, 1), (15, 1)],
  term ((-102730620000 : Rat) / 150171761) [(4, 1), (9, 1), (11, 1)],
  term ((-4948551841812012750 : Rat) / 1288183727709509) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-646715000 : Rat) / 8578069) [(4, 1), (9, 1), (15, 1)],
  term ((-320495390400 : Rat) / 150171761) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-15438318725772121980 : Rat) / 1288183727709509) [(4, 1), (10, 1), (11, 2), (15, 2)],
  term ((75757264 : Rat) / 8578069) [(4, 1), (10, 1), (15, 2)],
  term ((170336244800 : Rat) / 150171761) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((94773424000 : Rat) / 150171761) [(4, 1), (11, 1), (13, 1)],
  term ((2074568177922880256 : Rat) / 1288183727709509) [(4, 1), (11, 1), (15, 1)],
  term ((-13546041600 : Rat) / 150171761) [(4, 1), (11, 2)],
  term ((8205126552651798260 : Rat) / 1288183727709509) [(4, 1), (11, 2), (12, 1), (15, 2)],
  term ((4565252325840443800 : Rat) / 1288183727709509) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((10923857686524824750 : Rat) / 1288183727709509) [(4, 1), (11, 2), (15, 2)],
  term ((-652515181052563920 : Rat) / 1288183727709509) [(4, 1), (11, 3), (15, 1)],
  term ((29199272176 : Rat) / 25734207) [(4, 1), (12, 1), (15, 2)],
  term ((9254060000 : Rat) / 25734207) [(4, 1), (13, 1), (15, 1)],
  term ((-10126958360 : Rat) / 25734207) [(4, 1), (15, 2)],
  term ((26844633600 : Rat) / 150171761) [(4, 2), (7, 1), (11, 1)],
  term ((1293110671813804320 : Rat) / 1288183727709509) [(4, 2), (7, 1), (11, 2), (15, 1)],
  term ((-1082749696 : Rat) / 8578069) [(4, 2), (7, 1), (15, 1)],
  term ((-85671739200 : Rat) / 150171761) [(4, 2), (11, 1), (15, 1)],
  term ((-4126822585217517540 : Rat) / 1288183727709509) [(4, 2), (11, 2), (15, 2)],
  term ((999486832 : Rat) / 8578069) [(4, 2), (15, 2)],
  term ((29666506800 : Rat) / 150171761) [(5, 1), (11, 1)],
  term ((1429040794899014535 : Rat) / 1288183727709509) [(5, 1), (11, 2), (15, 1)],
  term ((-289150788 : Rat) / 8578069) [(5, 1), (15, 1)],
  term ((11600014800 : Rat) / 150171761) [(7, 1), (11, 1)],
  term ((-16076222400 : Rat) / 150171761) [(7, 1), (11, 1), (12, 1)],
  term ((-774394430471650380 : Rat) / 1288183727709509) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((558774731463575385 : Rat) / 1288183727709509) [(7, 1), (11, 2), (15, 1)],
  term ((-1749490416 : Rat) / 8578069) [(7, 1), (12, 1), (15, 1)],
  term ((1210104132 : Rat) / 8578069) [(7, 1), (15, 1)],
  term ((51365310000 : Rat) / 150171761) [(9, 1), (11, 1)],
  term ((2474275920906006375 : Rat) / 1288183727709509) [(9, 1), (11, 2), (15, 1)],
  term ((323357500 : Rat) / 8578069) [(9, 1), (15, 1)],
  term ((160247695200 : Rat) / 150171761) [(10, 1), (11, 1), (15, 1)],
  term ((7719159362886060990 : Rat) / 1288183727709509) [(10, 1), (11, 2), (15, 2)],
  term ((-37878632 : Rat) / 8578069) [(10, 1), (15, 2)],
  term ((-85168122400 : Rat) / 150171761) [(11, 1), (12, 1), (15, 1)],
  term ((-47386712000 : Rat) / 150171761) [(11, 1), (13, 1)],
  term ((-853559566409538928 : Rat) / 1288183727709509) [(11, 1), (15, 1)],
  term ((6773020800 : Rat) / 150171761) [(11, 2)],
  term ((-4102563276325899130 : Rat) / 1288183727709509) [(11, 2), (12, 1), (15, 2)],
  term ((-2282626162920221900 : Rat) / 1288183727709509) [(11, 2), (13, 1), (15, 1)],
  term ((-4430223196958032990 : Rat) / 1288183727709509) [(11, 2), (15, 2)],
  term ((326257590526281960 : Rat) / 1288183727709509) [(11, 3), (15, 1)],
  term ((-14599636088 : Rat) / 25734207) [(12, 1), (15, 2)],
  term ((-4627030000 : Rat) / 25734207) [(13, 1), (15, 1)],
  term ((4313864056 : Rat) / 25734207) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 13, terms 0 through 82. -/
theorem rs_R013_ueqv_R013YNNN_block_13_0000_0082_valid :
    checkProductSumEq rs_R013_ueqv_R013YNNN_partials_13_0000_0082
      rs_R013_ueqv_R013YNNN_block_13_0000_0082 = true := by
  native_decide

end R013UeqvR013YNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
