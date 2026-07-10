/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 3:200-290

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 3 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(8, 1)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0200 : Poly :=
[
  term ((60636377762 : Rat) / 24800982975) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 200 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0200 : Poly :=
[
  term ((-121272755524 : Rat) / 24800982975) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((60636377762 : Rat) / 24800982975) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((121272755524 : Rat) / 24800982975) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0200_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0200
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0201 : Poly :=
[
  term ((-11253500800 : Rat) / 110226591) [(7, 1), (15, 3)]
]

/-- Partial product 201 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0201 : Poly :=
[
  term ((22507001600 : Rat) / 110226591) [(4, 1), (7, 1), (15, 3)],
  term ((-11253500800 : Rat) / 110226591) [(4, 2), (7, 1), (15, 3)],
  term ((-11253500800 : Rat) / 110226591) [(5, 2), (7, 1), (15, 3)],
  term ((-22507001600 : Rat) / 110226591) [(7, 1), (8, 1), (15, 3)],
  term ((11253500800 : Rat) / 110226591) [(7, 1), (8, 2), (15, 3)],
  term ((11253500800 : Rat) / 110226591) [(7, 1), (9, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0201_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0201
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0202 : Poly :=
[
  term ((-1264 : Rat) / 67) [(7, 2)]
]

/-- Partial product 202 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0202 : Poly :=
[
  term ((2528 : Rat) / 67) [(4, 1), (7, 2)],
  term ((-1264 : Rat) / 67) [(4, 2), (7, 2)],
  term ((-1264 : Rat) / 67) [(5, 2), (7, 2)],
  term ((-2528 : Rat) / 67) [(7, 2), (8, 1)],
  term ((1264 : Rat) / 67) [(7, 2), (8, 2)],
  term ((1264 : Rat) / 67) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0202_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0202
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0203 : Poly :=
[
  term ((7681428414464 : Rat) / 471218676525) [(7, 2), (9, 1), (11, 1)]
]

/-- Partial product 203 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0203 : Poly :=
[
  term ((-15362856828928 : Rat) / 471218676525) [(4, 1), (7, 2), (9, 1), (11, 1)],
  term ((7681428414464 : Rat) / 471218676525) [(4, 2), (7, 2), (9, 1), (11, 1)],
  term ((7681428414464 : Rat) / 471218676525) [(5, 2), (7, 2), (9, 1), (11, 1)],
  term ((15362856828928 : Rat) / 471218676525) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((-7681428414464 : Rat) / 471218676525) [(7, 2), (8, 2), (9, 1), (11, 1)],
  term ((-7681428414464 : Rat) / 471218676525) [(7, 2), (9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0203_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0203
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0204 : Poly :=
[
  term ((120022318976 : Rat) / 17452543575) [(7, 2), (9, 1), (13, 1)]
]

/-- Partial product 204 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0204 : Poly :=
[
  term ((-240044637952 : Rat) / 17452543575) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((120022318976 : Rat) / 17452543575) [(4, 2), (7, 2), (9, 1), (13, 1)],
  term ((120022318976 : Rat) / 17452543575) [(5, 2), (7, 2), (9, 1), (13, 1)],
  term ((240044637952 : Rat) / 17452543575) [(7, 2), (8, 1), (9, 1), (13, 1)],
  term ((-120022318976 : Rat) / 17452543575) [(7, 2), (8, 2), (9, 1), (13, 1)],
  term ((-120022318976 : Rat) / 17452543575) [(7, 2), (9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0204_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0204
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0205 : Poly :=
[
  term ((-9107267927722 : Rat) / 471218676525) [(7, 2), (9, 1), (15, 1)]
]

/-- Partial product 205 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0205 : Poly :=
[
  term ((18214535855444 : Rat) / 471218676525) [(4, 1), (7, 2), (9, 1), (15, 1)],
  term ((-9107267927722 : Rat) / 471218676525) [(4, 2), (7, 2), (9, 1), (15, 1)],
  term ((-9107267927722 : Rat) / 471218676525) [(5, 2), (7, 2), (9, 1), (15, 1)],
  term ((-18214535855444 : Rat) / 471218676525) [(7, 2), (8, 1), (9, 1), (15, 1)],
  term ((9107267927722 : Rat) / 471218676525) [(7, 2), (8, 2), (9, 1), (15, 1)],
  term ((9107267927722 : Rat) / 471218676525) [(7, 2), (9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0205_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0205
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0206 : Poly :=
[
  term ((397843040 : Rat) / 12247399) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 206 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0206 : Poly :=
[
  term ((-795686080 : Rat) / 12247399) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((397843040 : Rat) / 12247399) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((397843040 : Rat) / 12247399) [(5, 2), (7, 2), (11, 1), (13, 1)],
  term ((795686080 : Rat) / 12247399) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-397843040 : Rat) / 12247399) [(7, 2), (8, 2), (11, 1), (13, 1)],
  term ((-397843040 : Rat) / 12247399) [(7, 2), (9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0206_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0206
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0207 : Poly :=
[
  term ((-33753231443752 : Rat) / 157072892175) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 207 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0207 : Poly :=
[
  term ((67506462887504 : Rat) / 157072892175) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(4, 2), (7, 2), (11, 1), (15, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(5, 2), (7, 2), (11, 1), (15, 1)],
  term ((-67506462887504 : Rat) / 157072892175) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((33753231443752 : Rat) / 157072892175) [(7, 2), (8, 2), (11, 1), (15, 1)],
  term ((33753231443752 : Rat) / 157072892175) [(7, 2), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0207_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0207
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0208 : Poly :=
[
  term ((4385912120576 : Rat) / 157072892175) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 208 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0208 : Poly :=
[
  term ((-8771824241152 : Rat) / 157072892175) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(4, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((8771824241152 : Rat) / 157072892175) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0208_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0208
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0209 : Poly :=
[
  term ((25461954560 : Rat) / 330679773) [(7, 2), (11, 2)]
]

/-- Partial product 209 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0209 : Poly :=
[
  term ((-50923909120 : Rat) / 330679773) [(4, 1), (7, 2), (11, 2)],
  term ((25461954560 : Rat) / 330679773) [(4, 2), (7, 2), (11, 2)],
  term ((25461954560 : Rat) / 330679773) [(5, 2), (7, 2), (11, 2)],
  term ((50923909120 : Rat) / 330679773) [(7, 2), (8, 1), (11, 2)],
  term ((-25461954560 : Rat) / 330679773) [(7, 2), (8, 2), (11, 2)],
  term ((-25461954560 : Rat) / 330679773) [(7, 2), (9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0209_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0209
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0210 : Poly :=
[
  term ((-323864637768 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1)]
]

/-- Partial product 210 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0210 : Poly :=
[
  term ((647729275536 : Rat) / 5817514525) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((-323864637768 : Rat) / 5817514525) [(4, 2), (7, 2), (13, 1), (15, 1)],
  term ((-323864637768 : Rat) / 5817514525) [(5, 2), (7, 2), (13, 1), (15, 1)],
  term ((-647729275536 : Rat) / 5817514525) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((323864637768 : Rat) / 5817514525) [(7, 2), (8, 2), (13, 1), (15, 1)],
  term ((323864637768 : Rat) / 5817514525) [(7, 2), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0210_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0210
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0211 : Poly :=
[
  term ((68529876884 : Rat) / 5817514525) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 211 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0211 : Poly :=
[
  term ((-137059753768 : Rat) / 5817514525) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((68529876884 : Rat) / 5817514525) [(4, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((137059753768 : Rat) / 5817514525) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0211_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0211
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0212 : Poly :=
[
  term ((392 : Rat) / 67) [(7, 2), (14, 1)]
]

/-- Partial product 212 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0212 : Poly :=
[
  term ((-784 : Rat) / 67) [(4, 1), (7, 2), (14, 1)],
  term ((392 : Rat) / 67) [(4, 2), (7, 2), (14, 1)],
  term ((392 : Rat) / 67) [(5, 2), (7, 2), (14, 1)],
  term ((784 : Rat) / 67) [(7, 2), (8, 1), (14, 1)],
  term ((-392 : Rat) / 67) [(7, 2), (8, 2), (14, 1)],
  term ((-392 : Rat) / 67) [(7, 2), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0212_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0212
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0213 : Poly :=
[
  term ((2094906592144 : Rat) / 17452543575) [(7, 2), (15, 2)]
]

/-- Partial product 213 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0213 : Poly :=
[
  term ((-4189813184288 : Rat) / 17452543575) [(4, 1), (7, 2), (15, 2)],
  term ((2094906592144 : Rat) / 17452543575) [(4, 2), (7, 2), (15, 2)],
  term ((2094906592144 : Rat) / 17452543575) [(5, 2), (7, 2), (15, 2)],
  term ((4189813184288 : Rat) / 17452543575) [(7, 2), (8, 1), (15, 2)],
  term ((-2094906592144 : Rat) / 17452543575) [(7, 2), (8, 2), (15, 2)],
  term ((-2094906592144 : Rat) / 17452543575) [(7, 2), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0213_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0213
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0214 : Poly :=
[
  term ((-4789749157348 : Rat) / 157072892175) [(7, 2), (15, 2), (16, 1)]
]

/-- Partial product 214 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0214 : Poly :=
[
  term ((9579498314696 : Rat) / 157072892175) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(4, 2), (7, 2), (15, 2), (16, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 2), (7, 2), (15, 2), (16, 1)],
  term ((-9579498314696 : Rat) / 157072892175) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(7, 2), (8, 2), (15, 2), (16, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(7, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0214_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0214
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0215 : Poly :=
[
  term ((-4385912120576 : Rat) / 157072892175) [(7, 3), (11, 1)]
]

/-- Partial product 215 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0215 : Poly :=
[
  term ((8771824241152 : Rat) / 157072892175) [(4, 1), (7, 3), (11, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(4, 2), (7, 3), (11, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 2), (7, 3), (11, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(7, 3), (8, 1), (11, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(7, 3), (8, 2), (11, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(7, 3), (9, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0215_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0215
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0216 : Poly :=
[
  term ((-68529876884 : Rat) / 5817514525) [(7, 3), (13, 1)]
]

/-- Partial product 216 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0216 : Poly :=
[
  term ((137059753768 : Rat) / 5817514525) [(4, 1), (7, 3), (13, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(4, 2), (7, 3), (13, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 2), (7, 3), (13, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(7, 3), (8, 1), (13, 1)],
  term ((68529876884 : Rat) / 5817514525) [(7, 3), (8, 2), (13, 1)],
  term ((68529876884 : Rat) / 5817514525) [(7, 3), (9, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0216_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0216
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0217 : Poly :=
[
  term ((4789749157348 : Rat) / 157072892175) [(7, 3), (15, 1)]
]

/-- Partial product 217 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0217 : Poly :=
[
  term ((-9579498314696 : Rat) / 157072892175) [(4, 1), (7, 3), (15, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(4, 2), (7, 3), (15, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 2), (7, 3), (15, 1)],
  term ((9579498314696 : Rat) / 157072892175) [(7, 3), (8, 1), (15, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(7, 3), (8, 2), (15, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(7, 3), (9, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0217_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0217
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0218 : Poly :=
[
  term ((4435333837172 : Rat) / 94243735305) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 218 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0218 : Poly :=
[
  term ((-8870667674344 : Rat) / 94243735305) [(4, 1), (9, 1), (10, 1), (11, 1)],
  term ((4435333837172 : Rat) / 94243735305) [(4, 2), (9, 1), (10, 1), (11, 1)],
  term ((4435333837172 : Rat) / 94243735305) [(5, 2), (9, 1), (10, 1), (11, 1)],
  term ((8870667674344 : Rat) / 94243735305) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((-4435333837172 : Rat) / 94243735305) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4435333837172 : Rat) / 94243735305) [(9, 3), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0218_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0218
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0219 : Poly :=
[
  term ((73609873883 : Rat) / 3490508715) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 219 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0219 : Poly :=
[
  term ((-147219747766 : Rat) / 3490508715) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((73609873883 : Rat) / 3490508715) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((73609873883 : Rat) / 3490508715) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((147219747766 : Rat) / 3490508715) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-73609873883 : Rat) / 3490508715) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((-73609873883 : Rat) / 3490508715) [(9, 3), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0219_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0219
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0220 : Poly :=
[
  term ((-4248341292676 : Rat) / 94243735305) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 220 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0220 : Poly :=
[
  term ((8496682585352 : Rat) / 94243735305) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-4248341292676 : Rat) / 94243735305) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((-4248341292676 : Rat) / 94243735305) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((-8496682585352 : Rat) / 94243735305) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((4248341292676 : Rat) / 94243735305) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((4248341292676 : Rat) / 94243735305) [(9, 3), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0220_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0220
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0221 : Poly :=
[
  term ((345931606822 : Rat) / 24800982975) [(9, 1), (11, 1)]
]

/-- Partial product 221 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0221 : Poly :=
[
  term ((-691863213644 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1)],
  term ((345931606822 : Rat) / 24800982975) [(4, 2), (9, 1), (11, 1)],
  term ((345931606822 : Rat) / 24800982975) [(5, 2), (9, 1), (11, 1)],
  term ((691863213644 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1)],
  term ((-345931606822 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1)],
  term ((-345931606822 : Rat) / 24800982975) [(9, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0221_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0221
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0222 : Poly :=
[
  term ((14682881024 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 222 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0222 : Poly :=
[
  term ((-29365762048 : Rat) / 330679773) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term ((14682881024 : Rat) / 330679773) [(4, 2), (9, 1), (11, 1), (12, 1)],
  term ((14682881024 : Rat) / 330679773) [(5, 2), (9, 1), (11, 1), (12, 1)],
  term ((29365762048 : Rat) / 330679773) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-14682881024 : Rat) / 330679773) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((-14682881024 : Rat) / 330679773) [(9, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0222_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0222
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0223 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 223 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0223 : Poly :=
[
  term ((-779878400 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(4, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((389939200 : Rat) / 110226591) [(5, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((779878400 : Rat) / 110226591) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-389939200 : Rat) / 110226591) [(8, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-389939200 : Rat) / 110226591) [(9, 3), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0223_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0223
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0224 : Poly :=
[
  term ((46914560 : Rat) / 36742197) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 224 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0224 : Poly :=
[
  term ((-93829120 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((46914560 : Rat) / 36742197) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((46914560 : Rat) / 36742197) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((93829120 : Rat) / 36742197) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-46914560 : Rat) / 36742197) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-46914560 : Rat) / 36742197) [(9, 3), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0224_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0224
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0225 : Poly :=
[
  term ((-371266482412 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 225 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0225 : Poly :=
[
  term ((742532964824 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-371266482412 : Rat) / 24800982975) [(4, 2), (9, 1), (11, 1), (14, 1)],
  term ((-371266482412 : Rat) / 24800982975) [(5, 2), (9, 1), (11, 1), (14, 1)],
  term ((-742532964824 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((371266482412 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((371266482412 : Rat) / 24800982975) [(9, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0225_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0225
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0226 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 226 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0226 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(4, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(5, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(8, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(9, 3), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0226_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0226
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0227 : Poly :=
[
  term ((103342925728 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 227 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0227 : Poly :=
[
  term ((-206685851456 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((103342925728 : Rat) / 24800982975) [(4, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((103342925728 : Rat) / 24800982975) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((206685851456 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-103342925728 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-103342925728 : Rat) / 24800982975) [(9, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0227_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0227
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0228 : Poly :=
[
  term ((-3846480160 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 228 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0228 : Poly :=
[
  term ((7692960320 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-3846480160 : Rat) / 110226591) [(4, 2), (9, 1), (11, 1), (15, 2)],
  term ((-3846480160 : Rat) / 110226591) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((-7692960320 : Rat) / 110226591) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((3846480160 : Rat) / 110226591) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((3846480160 : Rat) / 110226591) [(9, 3), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0228_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0228
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0229 : Poly :=
[
  term ((-2320 : Rat) / 201) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 229 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0229 : Poly :=
[
  term ((4640 : Rat) / 201) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2320 : Rat) / 201) [(4, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2320 : Rat) / 201) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-4640 : Rat) / 201) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2320 : Rat) / 201) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2320 : Rat) / 201) [(9, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0229_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0229
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0230 : Poly :=
[
  term ((-202546857628 : Rat) / 24800982975) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 230 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0230 : Poly :=
[
  term ((405093715256 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((202546857628 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((202546857628 : Rat) / 24800982975) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0230_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0230
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0231 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 231 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0231 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(9, 3), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0231_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0231
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0232 : Poly :=
[
  term ((229420016 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 232 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0232 : Poly :=
[
  term ((-458840032 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((229420016 : Rat) / 12247399) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((229420016 : Rat) / 12247399) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((458840032 : Rat) / 12247399) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-229420016 : Rat) / 12247399) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-229420016 : Rat) / 12247399) [(9, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0232_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0232
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0233 : Poly :=
[
  term ((18278400 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 233 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0233 : Poly :=
[
  term ((-36556800 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((18278400 : Rat) / 12247399) [(4, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((18278400 : Rat) / 12247399) [(5, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((36556800 : Rat) / 12247399) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-18278400 : Rat) / 12247399) [(8, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-18278400 : Rat) / 12247399) [(9, 3), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0233_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0233
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0234 : Poly :=
[
  term ((-13063133668 : Rat) / 330679773) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 234 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0234 : Poly :=
[
  term ((26126267336 : Rat) / 330679773) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-13063133668 : Rat) / 330679773) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-13063133668 : Rat) / 330679773) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((-26126267336 : Rat) / 330679773) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((13063133668 : Rat) / 330679773) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((13063133668 : Rat) / 330679773) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0234_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0234
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0235 : Poly :=
[
  term ((63 : Rat) / 67) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 235 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0235 : Poly :=
[
  term ((-126 : Rat) / 67) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 67) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 67) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((126 : Rat) / 67) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 67) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63 : Rat) / 67) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0235_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0235
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0236 : Poly :=
[
  term ((-351641600 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)]
]

/-- Partial product 236 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0236 : Poly :=
[
  term ((703283200 : Rat) / 110226591) [(4, 1), (9, 1), (12, 1), (15, 3)],
  term ((-351641600 : Rat) / 110226591) [(4, 2), (9, 1), (12, 1), (15, 3)],
  term ((-351641600 : Rat) / 110226591) [(5, 2), (9, 1), (12, 1), (15, 3)],
  term ((-703283200 : Rat) / 110226591) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((351641600 : Rat) / 110226591) [(8, 2), (9, 1), (12, 1), (15, 3)],
  term ((351641600 : Rat) / 110226591) [(9, 3), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0236_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0236
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0237 : Poly :=
[
  term ((6329836871 : Rat) / 1837109850) [(9, 1), (13, 1)]
]

/-- Partial product 237 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0237 : Poly :=
[
  term ((-6329836871 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1)],
  term ((6329836871 : Rat) / 1837109850) [(4, 2), (9, 1), (13, 1)],
  term ((6329836871 : Rat) / 1837109850) [(5, 2), (9, 1), (13, 1)],
  term ((6329836871 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1)],
  term ((-6329836871 : Rat) / 1837109850) [(8, 2), (9, 1), (13, 1)],
  term ((-6329836871 : Rat) / 1837109850) [(9, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0237_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0237
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0238 : Poly :=
[
  term ((-6934665808 : Rat) / 918554925) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 238 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0238 : Poly :=
[
  term ((13869331616 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-6934665808 : Rat) / 918554925) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-6934665808 : Rat) / 918554925) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-13869331616 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((6934665808 : Rat) / 918554925) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((6934665808 : Rat) / 918554925) [(9, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0238_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0238
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0239 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 239 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0239 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(4, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(5, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2741760 : Rat) / 12247399) [(8, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2741760 : Rat) / 12247399) [(9, 3), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0239_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0239
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0240 : Poly :=
[
  term ((3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 240 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0240 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(9, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0240_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0240
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0241 : Poly :=
[
  term ((-891593680 : Rat) / 36742197) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 241 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0241 : Poly :=
[
  term ((1783187360 : Rat) / 36742197) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-891593680 : Rat) / 36742197) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((-891593680 : Rat) / 36742197) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((-1783187360 : Rat) / 36742197) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((891593680 : Rat) / 36742197) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((891593680 : Rat) / 36742197) [(9, 3), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0241_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0241
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0242 : Poly :=
[
  term ((-3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 242 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0242 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(9, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0242_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0242
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0243 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 243 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0243 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(4, 1), (9, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(4, 2), (9, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 2), (9, 1), (13, 2), (15, 1)],
  term ((5483520 : Rat) / 12247399) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(8, 2), (9, 1), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 3), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0243_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0243
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0244 : Poly :=
[
  term ((255125025176 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 244 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0244 : Poly :=
[
  term ((-510250050352 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((255125025176 : Rat) / 24800982975) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((255125025176 : Rat) / 24800982975) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((510250050352 : Rat) / 24800982975) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-255125025176 : Rat) / 24800982975) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((-255125025176 : Rat) / 24800982975) [(9, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0244_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0244
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0245 : Poly :=
[
  term ((-20641044794 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 245 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0245 : Poly :=
[
  term ((41282089588 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((20641044794 : Rat) / 24800982975) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((20641044794 : Rat) / 24800982975) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0245_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0245
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0246 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(9, 1), (14, 1), (15, 3)]
]

/-- Partial product 246 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0246 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(4, 1), (9, 1), (14, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(4, 2), (9, 1), (14, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(5, 2), (9, 1), (14, 1), (15, 3)],
  term ((-35164160 : Rat) / 36742197) [(8, 1), (9, 1), (14, 1), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(8, 2), (9, 1), (14, 1), (15, 3)],
  term ((17582080 : Rat) / 36742197) [(9, 3), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0246_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0246
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0247 : Poly :=
[
  term ((94679907244 : Rat) / 24800982975) [(9, 1), (15, 1)]
]

/-- Partial product 247 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0247 : Poly :=
[
  term ((-189359814488 : Rat) / 24800982975) [(4, 1), (9, 1), (15, 1)],
  term ((94679907244 : Rat) / 24800982975) [(4, 2), (9, 1), (15, 1)],
  term ((94679907244 : Rat) / 24800982975) [(5, 2), (9, 1), (15, 1)],
  term ((189359814488 : Rat) / 24800982975) [(8, 1), (9, 1), (15, 1)],
  term ((-94679907244 : Rat) / 24800982975) [(8, 2), (9, 1), (15, 1)],
  term ((-94679907244 : Rat) / 24800982975) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0247_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0247
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0248 : Poly :=
[
  term ((-30318188881 : Rat) / 24800982975) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 248 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0248 : Poly :=
[
  term ((60636377762 : Rat) / 24800982975) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 24800982975) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((30318188881 : Rat) / 24800982975) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0248_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0248
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0249 : Poly :=
[
  term ((1868257600 : Rat) / 36742197) [(9, 1), (15, 3)]
]

/-- Partial product 249 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0249 : Poly :=
[
  term ((-3736515200 : Rat) / 36742197) [(4, 1), (9, 1), (15, 3)],
  term ((1868257600 : Rat) / 36742197) [(4, 2), (9, 1), (15, 3)],
  term ((1868257600 : Rat) / 36742197) [(5, 2), (9, 1), (15, 3)],
  term ((3736515200 : Rat) / 36742197) [(8, 1), (9, 1), (15, 3)],
  term ((-1868257600 : Rat) / 36742197) [(8, 2), (9, 1), (15, 3)],
  term ((-1868257600 : Rat) / 36742197) [(9, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0249_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0249
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0250 : Poly :=
[
  term ((571 : Rat) / 134) [(9, 2)]
]

/-- Partial product 250 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0250 : Poly :=
[
  term ((-571 : Rat) / 67) [(4, 1), (9, 2)],
  term ((571 : Rat) / 134) [(4, 2), (9, 2)],
  term ((571 : Rat) / 134) [(5, 2), (9, 2)],
  term ((571 : Rat) / 67) [(8, 1), (9, 2)],
  term ((-571 : Rat) / 134) [(8, 2), (9, 2)],
  term ((-571 : Rat) / 134) [(9, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0250_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0250
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0251 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 251 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0251 : Poly :=
[
  term ((88204818688 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(4, 2), (9, 2), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 2), (9, 2), (11, 1), (15, 1)],
  term ((-88204818688 : Rat) / 18848747061) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((44102409344 : Rat) / 18848747061) [(8, 2), (9, 2), (11, 1), (15, 1)],
  term ((44102409344 : Rat) / 18848747061) [(9, 4), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0251_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0251
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0252 : Poly :=
[
  term ((22051204672 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 252 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0252 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(4, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((44102409344 : Rat) / 18848747061) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(9, 4), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0252_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0252
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0253 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 253 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0253 : Poly :=
[
  term ((1378200292 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(4, 2), (9, 2), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 2), (9, 2), (13, 1), (15, 1)],
  term ((-1378200292 : Rat) / 698101743) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((689100146 : Rat) / 698101743) [(8, 2), (9, 2), (13, 1), (15, 1)],
  term ((689100146 : Rat) / 698101743) [(9, 4), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0253_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0253
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0254 : Poly :=
[
  term ((344550073 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0254 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(4, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 698101743) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-344550073 : Rat) / 698101743) [(9, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0254_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0254
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0255 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(9, 2), (15, 2)]
]

/-- Partial product 255 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0255 : Poly :=
[
  term ((-153811535336 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(4, 2), (9, 2), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(5, 2), (9, 2), (15, 2)],
  term ((153811535336 : Rat) / 18848747061) [(8, 1), (9, 2), (15, 2)],
  term ((-76905767668 : Rat) / 18848747061) [(8, 2), (9, 2), (15, 2)],
  term ((-76905767668 : Rat) / 18848747061) [(9, 4), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0255_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0255
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0256 : Poly :=
[
  term ((-38452883834 : Rat) / 18848747061) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 256 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0256 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(4, 2), (9, 2), (15, 2), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((38452883834 : Rat) / 18848747061) [(8, 2), (9, 2), (15, 2), (16, 1)],
  term ((38452883834 : Rat) / 18848747061) [(9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0256_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0256
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0257 : Poly :=
[
  term ((-147 : Rat) / 67) [(10, 1)]
]

/-- Partial product 257 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0257 : Poly :=
[
  term ((294 : Rat) / 67) [(4, 1), (10, 1)],
  term ((-147 : Rat) / 67) [(4, 2), (10, 1)],
  term ((-147 : Rat) / 67) [(5, 2), (10, 1)],
  term ((-294 : Rat) / 67) [(8, 1), (10, 1)],
  term ((147 : Rat) / 67) [(8, 2), (10, 1)],
  term ((147 : Rat) / 67) [(9, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0257_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0257
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0258 : Poly :=
[
  term ((77240396632 : Rat) / 10471526145) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 258 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0258 : Poly :=
[
  term ((-154480793264 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((77240396632 : Rat) / 10471526145) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((77240396632 : Rat) / 10471526145) [(5, 2), (10, 1), (11, 1), (13, 1)],
  term ((154480793264 : Rat) / 10471526145) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-77240396632 : Rat) / 10471526145) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((-77240396632 : Rat) / 10471526145) [(9, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0258_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0258
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0259 : Poly :=
[
  term ((-171358272772 : Rat) / 10471526145) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 259 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0259 : Poly :=
[
  term ((342716545544 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-171358272772 : Rat) / 10471526145) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((-171358272772 : Rat) / 10471526145) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((-342716545544 : Rat) / 10471526145) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((171358272772 : Rat) / 10471526145) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((171358272772 : Rat) / 10471526145) [(9, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0259_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0259
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0260 : Poly :=
[
  term ((178697921024 : Rat) / 10471526145) [(10, 1), (11, 2)]
]

/-- Partial product 260 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0260 : Poly :=
[
  term ((-357395842048 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 2)],
  term ((178697921024 : Rat) / 10471526145) [(4, 2), (10, 1), (11, 2)],
  term ((178697921024 : Rat) / 10471526145) [(5, 2), (10, 1), (11, 2)],
  term ((357395842048 : Rat) / 10471526145) [(8, 1), (10, 1), (11, 2)],
  term ((-178697921024 : Rat) / 10471526145) [(8, 2), (10, 1), (11, 2)],
  term ((-178697921024 : Rat) / 10471526145) [(9, 2), (10, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0260_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0260
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0261 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 261 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0261 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0261_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0261
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0262 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 2)]
]

/-- Partial product 262 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0262 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(4, 1), (10, 1), (13, 2)],
  term ((913920 : Rat) / 12247399) [(4, 2), (10, 1), (13, 2)],
  term ((913920 : Rat) / 12247399) [(5, 2), (10, 1), (13, 2)],
  term ((1827840 : Rat) / 12247399) [(8, 1), (10, 1), (13, 2)],
  term ((-913920 : Rat) / 12247399) [(8, 2), (10, 1), (13, 2)],
  term ((-913920 : Rat) / 12247399) [(9, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0262_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0262
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0263 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 263 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0263 : Poly :=
[
  term ((-7311360 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((3655680 : Rat) / 12247399) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((3655680 : Rat) / 12247399) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((7311360 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-3655680 : Rat) / 12247399) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-3655680 : Rat) / 12247399) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0263_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0263
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0264 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 264 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0264 : Poly :=
[
  term ((18278400 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9139200 : Rat) / 12247399) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-18278400 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((9139200 : Rat) / 12247399) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((9139200 : Rat) / 12247399) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0264_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0264
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0265 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 265 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0265 : Poly :=
[
  term ((-351641600 : Rat) / 110226591) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((351641600 : Rat) / 110226591) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-175820800 : Rat) / 110226591) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-175820800 : Rat) / 110226591) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0265_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0265
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0266 : Poly :=
[
  term ((-70328320 : Rat) / 110226591) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 266 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0266 : Poly :=
[
  term ((140656640 : Rat) / 110226591) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-140656640 : Rat) / 110226591) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0266_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0266
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0267 : Poly :=
[
  term ((-254377334191 : Rat) / 62829156870) [(11, 1), (13, 1)]
]

/-- Partial product 267 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0267 : Poly :=
[
  term ((254377334191 : Rat) / 31414578435) [(4, 1), (11, 1), (13, 1)],
  term ((-254377334191 : Rat) / 62829156870) [(4, 2), (11, 1), (13, 1)],
  term ((-254377334191 : Rat) / 62829156870) [(5, 2), (11, 1), (13, 1)],
  term ((-254377334191 : Rat) / 31414578435) [(8, 1), (11, 1), (13, 1)],
  term ((254377334191 : Rat) / 62829156870) [(8, 2), (11, 1), (13, 1)],
  term ((254377334191 : Rat) / 62829156870) [(9, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0267_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0267
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0268 : Poly :=
[
  term ((-747900160 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 268 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0268 : Poly :=
[
  term ((1495800320 : Rat) / 330679773) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((-747900160 : Rat) / 330679773) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-747900160 : Rat) / 330679773) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1495800320 : Rat) / 330679773) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((747900160 : Rat) / 330679773) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((747900160 : Rat) / 330679773) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0268_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0268
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0269 : Poly :=
[
  term ((-1370880 : Rat) / 12247399) [(11, 1), (13, 1), (14, 2)]
]

/-- Partial product 269 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0269 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1370880 : Rat) / 12247399) [(4, 2), (11, 1), (13, 1), (14, 2)],
  term ((-1370880 : Rat) / 12247399) [(5, 2), (11, 1), (13, 1), (14, 2)],
  term ((-2741760 : Rat) / 12247399) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((1370880 : Rat) / 12247399) [(8, 2), (11, 1), (13, 1), (14, 2)],
  term ((1370880 : Rat) / 12247399) [(9, 2), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0269_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0269
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0270 : Poly :=
[
  term ((137327360 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 270 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0270 : Poly :=
[
  term ((-274654720 : Rat) / 110226591) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((137327360 : Rat) / 110226591) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((137327360 : Rat) / 110226591) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((274654720 : Rat) / 110226591) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-137327360 : Rat) / 110226591) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((-137327360 : Rat) / 110226591) [(9, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0270_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0270
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0271 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 271 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0271 : Poly :=
[
  term ((10967040 : Rat) / 12247399) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((-5483520 : Rat) / 12247399) [(4, 2), (11, 1), (13, 2), (15, 1)],
  term ((-5483520 : Rat) / 12247399) [(5, 2), (11, 1), (13, 2), (15, 1)],
  term ((-10967040 : Rat) / 12247399) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((5483520 : Rat) / 12247399) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((5483520 : Rat) / 12247399) [(9, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0271_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0271
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0272 : Poly :=
[
  term ((-345665132 : Rat) / 330679773) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 272 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0272 : Poly :=
[
  term ((691330264 : Rat) / 330679773) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-345665132 : Rat) / 330679773) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((-345665132 : Rat) / 330679773) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-691330264 : Rat) / 330679773) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((345665132 : Rat) / 330679773) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((345665132 : Rat) / 330679773) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0272_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0272
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0273 : Poly :=
[
  term ((8791040 : Rat) / 36742197) [(11, 1), (14, 2), (15, 1)]
]

/-- Partial product 273 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0273 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(9, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0273_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0273
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0274 : Poly :=
[
  term ((-729242142376 : Rat) / 94243735305) [(11, 1), (15, 1)]
]

/-- Partial product 274 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0274 : Poly :=
[
  term ((1458484284752 : Rat) / 94243735305) [(4, 1), (11, 1), (15, 1)],
  term ((-729242142376 : Rat) / 94243735305) [(4, 2), (11, 1), (15, 1)],
  term ((-729242142376 : Rat) / 94243735305) [(5, 2), (11, 1), (15, 1)],
  term ((-1458484284752 : Rat) / 94243735305) [(8, 1), (11, 1), (15, 1)],
  term ((729242142376 : Rat) / 94243735305) [(8, 2), (11, 1), (15, 1)],
  term ((729242142376 : Rat) / 94243735305) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0274_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0274
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0275 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(11, 1), (15, 3)]
]

/-- Partial product 275 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0275 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(4, 1), (11, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(4, 2), (11, 1), (15, 3)],
  term ((-8791040 : Rat) / 36742197) [(5, 2), (11, 1), (15, 3)],
  term ((-17582080 : Rat) / 36742197) [(8, 1), (11, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(8, 2), (11, 1), (15, 3)],
  term ((8791040 : Rat) / 36742197) [(9, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0275_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0275
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0276 : Poly :=
[
  term ((757710451232 : Rat) / 94243735305) [(11, 2)]
]

/-- Partial product 276 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0276 : Poly :=
[
  term ((-1515420902464 : Rat) / 94243735305) [(4, 1), (11, 2)],
  term ((757710451232 : Rat) / 94243735305) [(4, 2), (11, 2)],
  term ((757710451232 : Rat) / 94243735305) [(5, 2), (11, 2)],
  term ((1515420902464 : Rat) / 94243735305) [(8, 1), (11, 2)],
  term ((-757710451232 : Rat) / 94243735305) [(8, 2), (11, 2)],
  term ((-757710451232 : Rat) / 94243735305) [(9, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0276_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0276
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0277 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(11, 2), (12, 1)]
]

/-- Partial product 277 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0277 : Poly :=
[
  term ((-155975680 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1)],
  term ((77987840 : Rat) / 110226591) [(4, 2), (11, 2), (12, 1)],
  term ((77987840 : Rat) / 110226591) [(5, 2), (11, 2), (12, 1)],
  term ((155975680 : Rat) / 110226591) [(8, 1), (11, 2), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(8, 2), (11, 2), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(9, 2), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0277_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0277
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0278 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(11, 2), (12, 1), (14, 1)]
]

/-- Partial product 278 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0278 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(4, 2), (11, 2), (12, 1), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 2), (11, 2), (12, 1), (14, 1)],
  term ((-389939200 : Rat) / 110226591) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(8, 2), (11, 2), (12, 1), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(9, 2), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0278_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0278
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0279 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 279 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0279 : Poly :=
[
  term ((77987840 : Rat) / 36742197) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((-77987840 : Rat) / 36742197) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(9, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0279_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0279
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0280 : Poly :=
[
  term ((740884480 : Rat) / 330679773) [(11, 2), (14, 1)]
]

/-- Partial product 280 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0280 : Poly :=
[
  term ((-1481768960 : Rat) / 330679773) [(4, 1), (11, 2), (14, 1)],
  term ((740884480 : Rat) / 330679773) [(4, 2), (11, 2), (14, 1)],
  term ((740884480 : Rat) / 330679773) [(5, 2), (11, 2), (14, 1)],
  term ((1481768960 : Rat) / 330679773) [(8, 1), (11, 2), (14, 1)],
  term ((-740884480 : Rat) / 330679773) [(8, 2), (11, 2), (14, 1)],
  term ((-740884480 : Rat) / 330679773) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0280_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0280
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0281 : Poly :=
[
  term ((-9748480 : Rat) / 36742197) [(11, 2), (14, 2)]
]

/-- Partial product 281 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0281 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(4, 1), (11, 2), (14, 2)],
  term ((-9748480 : Rat) / 36742197) [(4, 2), (11, 2), (14, 2)],
  term ((-9748480 : Rat) / 36742197) [(5, 2), (11, 2), (14, 2)],
  term ((-19496960 : Rat) / 36742197) [(8, 1), (11, 2), (14, 2)],
  term ((9748480 : Rat) / 36742197) [(8, 2), (11, 2), (14, 2)],
  term ((9748480 : Rat) / 36742197) [(9, 2), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0281_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0281
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0282 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(11, 2), (15, 2)]
]

/-- Partial product 282 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0282 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(4, 1), (11, 2), (15, 2)],
  term ((9748480 : Rat) / 36742197) [(4, 2), (11, 2), (15, 2)],
  term ((9748480 : Rat) / 36742197) [(5, 2), (11, 2), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(8, 1), (11, 2), (15, 2)],
  term ((-9748480 : Rat) / 36742197) [(8, 2), (11, 2), (15, 2)],
  term ((-9748480 : Rat) / 36742197) [(9, 2), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0282_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0282
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0283 : Poly :=
[
  term ((-72 : Rat) / 67) [(12, 1)]
]

/-- Partial product 283 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0283 : Poly :=
[
  term ((144 : Rat) / 67) [(4, 1), (12, 1)],
  term ((-72 : Rat) / 67) [(4, 2), (12, 1)],
  term ((-72 : Rat) / 67) [(5, 2), (12, 1)],
  term ((-144 : Rat) / 67) [(8, 1), (12, 1)],
  term ((72 : Rat) / 67) [(8, 2), (12, 1)],
  term ((72 : Rat) / 67) [(9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0283_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0283
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0284 : Poly :=
[
  term ((1311665768 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 284 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0284 : Poly :=
[
  term ((-2623331536 : Rat) / 330679773) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((1311665768 : Rat) / 330679773) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((1311665768 : Rat) / 330679773) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((2623331536 : Rat) / 330679773) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1311665768 : Rat) / 330679773) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1311665768 : Rat) / 330679773) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0284_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0284
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0285 : Poly :=
[
  term ((1969721246 : Rat) / 330679773) [(13, 1), (15, 1)]
]

/-- Partial product 285 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0285 : Poly :=
[
  term ((-3939442492 : Rat) / 330679773) [(4, 1), (13, 1), (15, 1)],
  term ((1969721246 : Rat) / 330679773) [(4, 2), (13, 1), (15, 1)],
  term ((1969721246 : Rat) / 330679773) [(5, 2), (13, 1), (15, 1)],
  term ((3939442492 : Rat) / 330679773) [(8, 1), (13, 1), (15, 1)],
  term ((-1969721246 : Rat) / 330679773) [(8, 2), (13, 1), (15, 1)],
  term ((-1969721246 : Rat) / 330679773) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0285_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0285
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0286 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(13, 1), (15, 3)]
]

/-- Partial product 286 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0286 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(4, 1), (13, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(4, 2), (13, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(5, 2), (13, 1), (15, 3)],
  term ((-35164160 : Rat) / 110226591) [(8, 1), (13, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(8, 2), (13, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(9, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0286_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0286
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0287 : Poly :=
[
  term ((-35668129 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 287 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0287 : Poly :=
[
  term ((71336258 : Rat) / 12247399) [(4, 1), (13, 2)],
  term ((-35668129 : Rat) / 12247399) [(4, 2), (13, 2)],
  term ((-35668129 : Rat) / 12247399) [(5, 2), (13, 2)],
  term ((-71336258 : Rat) / 12247399) [(8, 1), (13, 2)],
  term ((35668129 : Rat) / 12247399) [(8, 2), (13, 2)],
  term ((35668129 : Rat) / 12247399) [(9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0287_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0287
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0288 : Poly :=
[
  term ((-16569700 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 288 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0288 : Poly :=
[
  term ((33139400 : Rat) / 12247399) [(4, 1), (13, 2), (14, 1)],
  term ((-16569700 : Rat) / 12247399) [(4, 2), (13, 2), (14, 1)],
  term ((-16569700 : Rat) / 12247399) [(5, 2), (13, 2), (14, 1)],
  term ((-33139400 : Rat) / 12247399) [(8, 1), (13, 2), (14, 1)],
  term ((16569700 : Rat) / 12247399) [(8, 2), (13, 2), (14, 1)],
  term ((16569700 : Rat) / 12247399) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0288_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0288
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0289 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(13, 2), (15, 2)]
]

/-- Partial product 289 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0289 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(4, 1), (13, 2), (15, 2)],
  term ((913920 : Rat) / 12247399) [(4, 2), (13, 2), (15, 2)],
  term ((913920 : Rat) / 12247399) [(5, 2), (13, 2), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(8, 1), (13, 2), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(8, 2), (13, 2), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(9, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0289_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0289
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 3. -/
def rs_R009_ueqv_R009NNNYN_coefficient_03_0290 : Poly :=
[
  term ((-99 : Rat) / 67) [(14, 1)]
]

/-- Partial product 290 for generator 3. -/
def rs_R009_ueqv_R009NNNYN_partial_03_0290 : Poly :=
[
  term ((198 : Rat) / 67) [(4, 1), (14, 1)],
  term ((-99 : Rat) / 67) [(4, 2), (14, 1)],
  term ((-99 : Rat) / 67) [(5, 2), (14, 1)],
  term ((-198 : Rat) / 67) [(8, 1), (14, 1)],
  term ((99 : Rat) / 67) [(8, 2), (14, 1)],
  term ((99 : Rat) / 67) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 3. -/
theorem rs_R009_ueqv_R009NNNYN_partial_03_0290_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_03_0290
        rs_R009_ueqv_R009NNNYN_generator_03_0200_0290 =
      rs_R009_ueqv_R009NNNYN_partial_03_0290 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_03_0200_0290 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_03_0200,
  rs_R009_ueqv_R009NNNYN_partial_03_0201,
  rs_R009_ueqv_R009NNNYN_partial_03_0202,
  rs_R009_ueqv_R009NNNYN_partial_03_0203,
  rs_R009_ueqv_R009NNNYN_partial_03_0204,
  rs_R009_ueqv_R009NNNYN_partial_03_0205,
  rs_R009_ueqv_R009NNNYN_partial_03_0206,
  rs_R009_ueqv_R009NNNYN_partial_03_0207,
  rs_R009_ueqv_R009NNNYN_partial_03_0208,
  rs_R009_ueqv_R009NNNYN_partial_03_0209,
  rs_R009_ueqv_R009NNNYN_partial_03_0210,
  rs_R009_ueqv_R009NNNYN_partial_03_0211,
  rs_R009_ueqv_R009NNNYN_partial_03_0212,
  rs_R009_ueqv_R009NNNYN_partial_03_0213,
  rs_R009_ueqv_R009NNNYN_partial_03_0214,
  rs_R009_ueqv_R009NNNYN_partial_03_0215,
  rs_R009_ueqv_R009NNNYN_partial_03_0216,
  rs_R009_ueqv_R009NNNYN_partial_03_0217,
  rs_R009_ueqv_R009NNNYN_partial_03_0218,
  rs_R009_ueqv_R009NNNYN_partial_03_0219,
  rs_R009_ueqv_R009NNNYN_partial_03_0220,
  rs_R009_ueqv_R009NNNYN_partial_03_0221,
  rs_R009_ueqv_R009NNNYN_partial_03_0222,
  rs_R009_ueqv_R009NNNYN_partial_03_0223,
  rs_R009_ueqv_R009NNNYN_partial_03_0224,
  rs_R009_ueqv_R009NNNYN_partial_03_0225,
  rs_R009_ueqv_R009NNNYN_partial_03_0226,
  rs_R009_ueqv_R009NNNYN_partial_03_0227,
  rs_R009_ueqv_R009NNNYN_partial_03_0228,
  rs_R009_ueqv_R009NNNYN_partial_03_0229,
  rs_R009_ueqv_R009NNNYN_partial_03_0230,
  rs_R009_ueqv_R009NNNYN_partial_03_0231,
  rs_R009_ueqv_R009NNNYN_partial_03_0232,
  rs_R009_ueqv_R009NNNYN_partial_03_0233,
  rs_R009_ueqv_R009NNNYN_partial_03_0234,
  rs_R009_ueqv_R009NNNYN_partial_03_0235,
  rs_R009_ueqv_R009NNNYN_partial_03_0236,
  rs_R009_ueqv_R009NNNYN_partial_03_0237,
  rs_R009_ueqv_R009NNNYN_partial_03_0238,
  rs_R009_ueqv_R009NNNYN_partial_03_0239,
  rs_R009_ueqv_R009NNNYN_partial_03_0240,
  rs_R009_ueqv_R009NNNYN_partial_03_0241,
  rs_R009_ueqv_R009NNNYN_partial_03_0242,
  rs_R009_ueqv_R009NNNYN_partial_03_0243,
  rs_R009_ueqv_R009NNNYN_partial_03_0244,
  rs_R009_ueqv_R009NNNYN_partial_03_0245,
  rs_R009_ueqv_R009NNNYN_partial_03_0246,
  rs_R009_ueqv_R009NNNYN_partial_03_0247,
  rs_R009_ueqv_R009NNNYN_partial_03_0248,
  rs_R009_ueqv_R009NNNYN_partial_03_0249,
  rs_R009_ueqv_R009NNNYN_partial_03_0250,
  rs_R009_ueqv_R009NNNYN_partial_03_0251,
  rs_R009_ueqv_R009NNNYN_partial_03_0252,
  rs_R009_ueqv_R009NNNYN_partial_03_0253,
  rs_R009_ueqv_R009NNNYN_partial_03_0254,
  rs_R009_ueqv_R009NNNYN_partial_03_0255,
  rs_R009_ueqv_R009NNNYN_partial_03_0256,
  rs_R009_ueqv_R009NNNYN_partial_03_0257,
  rs_R009_ueqv_R009NNNYN_partial_03_0258,
  rs_R009_ueqv_R009NNNYN_partial_03_0259,
  rs_R009_ueqv_R009NNNYN_partial_03_0260,
  rs_R009_ueqv_R009NNNYN_partial_03_0261,
  rs_R009_ueqv_R009NNNYN_partial_03_0262,
  rs_R009_ueqv_R009NNNYN_partial_03_0263,
  rs_R009_ueqv_R009NNNYN_partial_03_0264,
  rs_R009_ueqv_R009NNNYN_partial_03_0265,
  rs_R009_ueqv_R009NNNYN_partial_03_0266,
  rs_R009_ueqv_R009NNNYN_partial_03_0267,
  rs_R009_ueqv_R009NNNYN_partial_03_0268,
  rs_R009_ueqv_R009NNNYN_partial_03_0269,
  rs_R009_ueqv_R009NNNYN_partial_03_0270,
  rs_R009_ueqv_R009NNNYN_partial_03_0271,
  rs_R009_ueqv_R009NNNYN_partial_03_0272,
  rs_R009_ueqv_R009NNNYN_partial_03_0273,
  rs_R009_ueqv_R009NNNYN_partial_03_0274,
  rs_R009_ueqv_R009NNNYN_partial_03_0275,
  rs_R009_ueqv_R009NNNYN_partial_03_0276,
  rs_R009_ueqv_R009NNNYN_partial_03_0277,
  rs_R009_ueqv_R009NNNYN_partial_03_0278,
  rs_R009_ueqv_R009NNNYN_partial_03_0279,
  rs_R009_ueqv_R009NNNYN_partial_03_0280,
  rs_R009_ueqv_R009NNNYN_partial_03_0281,
  rs_R009_ueqv_R009NNNYN_partial_03_0282,
  rs_R009_ueqv_R009NNNYN_partial_03_0283,
  rs_R009_ueqv_R009NNNYN_partial_03_0284,
  rs_R009_ueqv_R009NNNYN_partial_03_0285,
  rs_R009_ueqv_R009NNNYN_partial_03_0286,
  rs_R009_ueqv_R009NNNYN_partial_03_0287,
  rs_R009_ueqv_R009NNNYN_partial_03_0288,
  rs_R009_ueqv_R009NNNYN_partial_03_0289,
  rs_R009_ueqv_R009NNNYN_partial_03_0290
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_03_0200_0290 : Poly :=
[
  term ((-121272755524 : Rat) / 24800982975) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((22507001600 : Rat) / 110226591) [(4, 1), (7, 1), (15, 3)],
  term ((2528 : Rat) / 67) [(4, 1), (7, 2)],
  term ((-15362856828928 : Rat) / 471218676525) [(4, 1), (7, 2), (9, 1), (11, 1)],
  term ((-240044637952 : Rat) / 17452543575) [(4, 1), (7, 2), (9, 1), (13, 1)],
  term ((18214535855444 : Rat) / 471218676525) [(4, 1), (7, 2), (9, 1), (15, 1)],
  term ((-795686080 : Rat) / 12247399) [(4, 1), (7, 2), (11, 1), (13, 1)],
  term ((67506462887504 : Rat) / 157072892175) [(4, 1), (7, 2), (11, 1), (15, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-50923909120 : Rat) / 330679773) [(4, 1), (7, 2), (11, 2)],
  term ((647729275536 : Rat) / 5817514525) [(4, 1), (7, 2), (13, 1), (15, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-784 : Rat) / 67) [(4, 1), (7, 2), (14, 1)],
  term ((-4189813184288 : Rat) / 17452543575) [(4, 1), (7, 2), (15, 2)],
  term ((9579498314696 : Rat) / 157072892175) [(4, 1), (7, 2), (15, 2), (16, 1)],
  term ((8771824241152 : Rat) / 157072892175) [(4, 1), (7, 3), (11, 1)],
  term ((137059753768 : Rat) / 5817514525) [(4, 1), (7, 3), (13, 1)],
  term ((-9579498314696 : Rat) / 157072892175) [(4, 1), (7, 3), (15, 1)],
  term ((-8870667674344 : Rat) / 94243735305) [(4, 1), (9, 1), (10, 1), (11, 1)],
  term ((-147219747766 : Rat) / 3490508715) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((8496682585352 : Rat) / 94243735305) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-691863213644 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1)],
  term ((-29365762048 : Rat) / 330679773) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term ((-779878400 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-93829120 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((742532964824 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(4, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-206685851456 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((7692960320 : Rat) / 110226591) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(4, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-389939200 : Rat) / 110226591) [(4, 1), (9, 1), (11, 2), (15, 1)],
  term ((-458840032 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((-36556800 : Rat) / 12247399) [(4, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((26126267336 : Rat) / 330679773) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((703283200 : Rat) / 110226591) [(4, 1), (9, 1), (12, 1), (15, 3)],
  term ((-6329836871 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1)],
  term ((13869331616 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-5483520 : Rat) / 12247399) [(4, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1783187360 : Rat) / 36742197) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-5483520 : Rat) / 12247399) [(4, 1), (9, 1), (13, 2), (15, 1)],
  term ((-510250050352 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((35164160 : Rat) / 36742197) [(4, 1), (9, 1), (14, 1), (15, 3)],
  term ((-189359814488 : Rat) / 24800982975) [(4, 1), (9, 1), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3736515200 : Rat) / 36742197) [(4, 1), (9, 1), (15, 3)],
  term ((-571 : Rat) / 67) [(4, 1), (9, 2)],
  term ((88204818688 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(4, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((1378200292 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1)],
  term ((-689100146 : Rat) / 698101743) [(4, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-153811535336 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2)],
  term ((76905767668 : Rat) / 18848747061) [(4, 1), (9, 2), (15, 2), (16, 1)],
  term ((294 : Rat) / 67) [(4, 1), (10, 1)],
  term ((-154480793264 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 1), (13, 1)],
  term ((342716545544 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 1), (15, 1)],
  term ((-357395842048 : Rat) / 10471526145) [(4, 1), (10, 1), (11, 2)],
  term ((35164160 : Rat) / 110226591) [(4, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(4, 1), (10, 1), (13, 2)],
  term ((-7311360 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1)],
  term ((18278400 : Rat) / 12247399) [(4, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-351641600 : Rat) / 110226591) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((140656640 : Rat) / 110226591) [(4, 1), (11, 1), (12, 1), (15, 1)],
  term ((254377334191 : Rat) / 31414578435) [(4, 1), (11, 1), (13, 1)],
  term ((1495800320 : Rat) / 330679773) [(4, 1), (11, 1), (13, 1), (14, 1)],
  term ((2741760 : Rat) / 12247399) [(4, 1), (11, 1), (13, 1), (14, 2)],
  term ((-274654720 : Rat) / 110226591) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((10967040 : Rat) / 12247399) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((691330264 : Rat) / 330679773) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(4, 1), (11, 1), (14, 2), (15, 1)],
  term ((1458484284752 : Rat) / 94243735305) [(4, 1), (11, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(4, 1), (11, 1), (15, 3)],
  term ((-1515420902464 : Rat) / 94243735305) [(4, 1), (11, 2)],
  term ((-155975680 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1)],
  term ((389939200 : Rat) / 110226591) [(4, 1), (11, 2), (12, 1), (14, 1)],
  term ((77987840 : Rat) / 36742197) [(4, 1), (11, 2), (13, 1), (15, 1)],
  term ((-1481768960 : Rat) / 330679773) [(4, 1), (11, 2), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(4, 1), (11, 2), (14, 2)],
  term ((-19496960 : Rat) / 36742197) [(4, 1), (11, 2), (15, 2)],
  term ((144 : Rat) / 67) [(4, 1), (12, 1)],
  term ((-2623331536 : Rat) / 330679773) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3939442492 : Rat) / 330679773) [(4, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(4, 1), (13, 1), (15, 3)],
  term ((71336258 : Rat) / 12247399) [(4, 1), (13, 2)],
  term ((33139400 : Rat) / 12247399) [(4, 1), (13, 2), (14, 1)],
  term ((-1827840 : Rat) / 12247399) [(4, 1), (13, 2), (15, 2)],
  term ((198 : Rat) / 67) [(4, 1), (14, 1)],
  term ((60636377762 : Rat) / 24800982975) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-11253500800 : Rat) / 110226591) [(4, 2), (7, 1), (15, 3)],
  term ((-1264 : Rat) / 67) [(4, 2), (7, 2)],
  term ((7681428414464 : Rat) / 471218676525) [(4, 2), (7, 2), (9, 1), (11, 1)],
  term ((120022318976 : Rat) / 17452543575) [(4, 2), (7, 2), (9, 1), (13, 1)],
  term ((-9107267927722 : Rat) / 471218676525) [(4, 2), (7, 2), (9, 1), (15, 1)],
  term ((397843040 : Rat) / 12247399) [(4, 2), (7, 2), (11, 1), (13, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(4, 2), (7, 2), (11, 1), (15, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(4, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 330679773) [(4, 2), (7, 2), (11, 2)],
  term ((-323864637768 : Rat) / 5817514525) [(4, 2), (7, 2), (13, 1), (15, 1)],
  term ((68529876884 : Rat) / 5817514525) [(4, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(4, 2), (7, 2), (14, 1)],
  term ((2094906592144 : Rat) / 17452543575) [(4, 2), (7, 2), (15, 2)],
  term ((-4789749157348 : Rat) / 157072892175) [(4, 2), (7, 2), (15, 2), (16, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(4, 2), (7, 3), (11, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(4, 2), (7, 3), (13, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(4, 2), (7, 3), (15, 1)],
  term ((4435333837172 : Rat) / 94243735305) [(4, 2), (9, 1), (10, 1), (11, 1)],
  term ((73609873883 : Rat) / 3490508715) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-4248341292676 : Rat) / 94243735305) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((345931606822 : Rat) / 24800982975) [(4, 2), (9, 1), (11, 1)],
  term ((14682881024 : Rat) / 330679773) [(4, 2), (9, 1), (11, 1), (12, 1)],
  term ((389939200 : Rat) / 110226591) [(4, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((46914560 : Rat) / 36742197) [(4, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-371266482412 : Rat) / 24800982975) [(4, 2), (9, 1), (11, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(4, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((103342925728 : Rat) / 24800982975) [(4, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3846480160 : Rat) / 110226591) [(4, 2), (9, 1), (11, 1), (15, 2)],
  term ((-2320 : Rat) / 201) [(4, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(4, 2), (9, 1), (11, 1), (16, 1)],
  term ((194969600 : Rat) / 110226591) [(4, 2), (9, 1), (11, 2), (15, 1)],
  term ((229420016 : Rat) / 12247399) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((18278400 : Rat) / 12247399) [(4, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-13063133668 : Rat) / 330679773) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((63 : Rat) / 67) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-351641600 : Rat) / 110226591) [(4, 2), (9, 1), (12, 1), (15, 3)],
  term ((6329836871 : Rat) / 1837109850) [(4, 2), (9, 1), (13, 1)],
  term ((-6934665808 : Rat) / 918554925) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((2741760 : Rat) / 12247399) [(4, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-891593680 : Rat) / 36742197) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((2741760 : Rat) / 12247399) [(4, 2), (9, 1), (13, 2), (15, 1)],
  term ((255125025176 : Rat) / 24800982975) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(4, 2), (9, 1), (14, 1), (15, 3)],
  term ((94679907244 : Rat) / 24800982975) [(4, 2), (9, 1), (15, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((1868257600 : Rat) / 36742197) [(4, 2), (9, 1), (15, 3)],
  term ((571 : Rat) / 134) [(4, 2), (9, 2)],
  term ((-44102409344 : Rat) / 18848747061) [(4, 2), (9, 2), (11, 1), (15, 1)],
  term ((22051204672 : Rat) / 18848747061) [(4, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(4, 2), (9, 2), (13, 1), (15, 1)],
  term ((344550073 : Rat) / 698101743) [(4, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(4, 2), (9, 2), (15, 2)],
  term ((-38452883834 : Rat) / 18848747061) [(4, 2), (9, 2), (15, 2), (16, 1)],
  term ((-147 : Rat) / 67) [(4, 2), (10, 1)],
  term ((77240396632 : Rat) / 10471526145) [(4, 2), (10, 1), (11, 1), (13, 1)],
  term ((-171358272772 : Rat) / 10471526145) [(4, 2), (10, 1), (11, 1), (15, 1)],
  term ((178697921024 : Rat) / 10471526145) [(4, 2), (10, 1), (11, 2)],
  term ((-17582080 : Rat) / 110226591) [(4, 2), (10, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(4, 2), (10, 1), (13, 2)],
  term ((3655680 : Rat) / 12247399) [(4, 2), (11, 1), (12, 1), (13, 1)],
  term ((-9139200 : Rat) / 12247399) [(4, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(4, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(4, 2), (11, 1), (12, 1), (15, 1)],
  term ((-254377334191 : Rat) / 62829156870) [(4, 2), (11, 1), (13, 1)],
  term ((-747900160 : Rat) / 330679773) [(4, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1370880 : Rat) / 12247399) [(4, 2), (11, 1), (13, 1), (14, 2)],
  term ((137327360 : Rat) / 110226591) [(4, 2), (11, 1), (13, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(4, 2), (11, 1), (13, 2), (15, 1)],
  term ((-345665132 : Rat) / 330679773) [(4, 2), (11, 1), (14, 1), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(4, 2), (11, 1), (14, 2), (15, 1)],
  term ((-729242142376 : Rat) / 94243735305) [(4, 2), (11, 1), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(4, 2), (11, 1), (15, 3)],
  term ((757710451232 : Rat) / 94243735305) [(4, 2), (11, 2)],
  term ((77987840 : Rat) / 110226591) [(4, 2), (11, 2), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(4, 2), (11, 2), (12, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(4, 2), (11, 2), (13, 1), (15, 1)],
  term ((740884480 : Rat) / 330679773) [(4, 2), (11, 2), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(4, 2), (11, 2), (14, 2)],
  term ((9748480 : Rat) / 36742197) [(4, 2), (11, 2), (15, 2)],
  term ((-72 : Rat) / 67) [(4, 2), (12, 1)],
  term ((1311665768 : Rat) / 330679773) [(4, 2), (13, 1), (14, 1), (15, 1)],
  term ((1969721246 : Rat) / 330679773) [(4, 2), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(4, 2), (13, 1), (15, 3)],
  term ((-35668129 : Rat) / 12247399) [(4, 2), (13, 2)],
  term ((-16569700 : Rat) / 12247399) [(4, 2), (13, 2), (14, 1)],
  term ((913920 : Rat) / 12247399) [(4, 2), (13, 2), (15, 2)],
  term ((-99 : Rat) / 67) [(4, 2), (14, 1)],
  term ((60636377762 : Rat) / 24800982975) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-11253500800 : Rat) / 110226591) [(5, 2), (7, 1), (15, 3)],
  term ((-1264 : Rat) / 67) [(5, 2), (7, 2)],
  term ((7681428414464 : Rat) / 471218676525) [(5, 2), (7, 2), (9, 1), (11, 1)],
  term ((120022318976 : Rat) / 17452543575) [(5, 2), (7, 2), (9, 1), (13, 1)],
  term ((-9107267927722 : Rat) / 471218676525) [(5, 2), (7, 2), (9, 1), (15, 1)],
  term ((397843040 : Rat) / 12247399) [(5, 2), (7, 2), (11, 1), (13, 1)],
  term ((-33753231443752 : Rat) / 157072892175) [(5, 2), (7, 2), (11, 1), (15, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(5, 2), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((25461954560 : Rat) / 330679773) [(5, 2), (7, 2), (11, 2)],
  term ((-323864637768 : Rat) / 5817514525) [(5, 2), (7, 2), (13, 1), (15, 1)],
  term ((68529876884 : Rat) / 5817514525) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((392 : Rat) / 67) [(5, 2), (7, 2), (14, 1)],
  term ((2094906592144 : Rat) / 17452543575) [(5, 2), (7, 2), (15, 2)],
  term ((-4789749157348 : Rat) / 157072892175) [(5, 2), (7, 2), (15, 2), (16, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(5, 2), (7, 3), (11, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(5, 2), (7, 3), (13, 1)],
  term ((4789749157348 : Rat) / 157072892175) [(5, 2), (7, 3), (15, 1)],
  term ((4435333837172 : Rat) / 94243735305) [(5, 2), (9, 1), (10, 1), (11, 1)],
  term ((73609873883 : Rat) / 3490508715) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((-4248341292676 : Rat) / 94243735305) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((345931606822 : Rat) / 24800982975) [(5, 2), (9, 1), (11, 1)],
  term ((14682881024 : Rat) / 330679773) [(5, 2), (9, 1), (11, 1), (12, 1)],
  term ((389939200 : Rat) / 110226591) [(5, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((46914560 : Rat) / 36742197) [(5, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-371266482412 : Rat) / 24800982975) [(5, 2), (9, 1), (11, 1), (14, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((103342925728 : Rat) / 24800982975) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3846480160 : Rat) / 110226591) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((-2320 : Rat) / 201) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(5, 2), (9, 1), (11, 1), (16, 1)],
  term ((194969600 : Rat) / 110226591) [(5, 2), (9, 1), (11, 2), (15, 1)],
  term ((229420016 : Rat) / 12247399) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((18278400 : Rat) / 12247399) [(5, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-13063133668 : Rat) / 330679773) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((63 : Rat) / 67) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-351641600 : Rat) / 110226591) [(5, 2), (9, 1), (12, 1), (15, 3)],
  term ((6329836871 : Rat) / 1837109850) [(5, 2), (9, 1), (13, 1)],
  term ((-6934665808 : Rat) / 918554925) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-891593680 : Rat) / 36742197) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((2741760 : Rat) / 12247399) [(5, 2), (9, 1), (13, 2), (15, 1)],
  term ((255125025176 : Rat) / 24800982975) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-17582080 : Rat) / 36742197) [(5, 2), (9, 1), (14, 1), (15, 3)],
  term ((94679907244 : Rat) / 24800982975) [(5, 2), (9, 1), (15, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1868257600 : Rat) / 36742197) [(5, 2), (9, 1), (15, 3)],
  term ((571 : Rat) / 134) [(5, 2), (9, 2)],
  term ((-44102409344 : Rat) / 18848747061) [(5, 2), (9, 2), (11, 1), (15, 1)],
  term ((22051204672 : Rat) / 18848747061) [(5, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(5, 2), (9, 2), (13, 1), (15, 1)],
  term ((344550073 : Rat) / 698101743) [(5, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(5, 2), (9, 2), (15, 2)],
  term ((-38452883834 : Rat) / 18848747061) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((-147 : Rat) / 67) [(5, 2), (10, 1)],
  term ((77240396632 : Rat) / 10471526145) [(5, 2), (10, 1), (11, 1), (13, 1)],
  term ((-171358272772 : Rat) / 10471526145) [(5, 2), (10, 1), (11, 1), (15, 1)],
  term ((178697921024 : Rat) / 10471526145) [(5, 2), (10, 1), (11, 2)],
  term ((-17582080 : Rat) / 110226591) [(5, 2), (10, 1), (13, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(5, 2), (10, 1), (13, 2)],
  term ((3655680 : Rat) / 12247399) [(5, 2), (11, 1), (12, 1), (13, 1)],
  term ((-9139200 : Rat) / 12247399) [(5, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(5, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-70328320 : Rat) / 110226591) [(5, 2), (11, 1), (12, 1), (15, 1)],
  term ((-254377334191 : Rat) / 62829156870) [(5, 2), (11, 1), (13, 1)],
  term ((-747900160 : Rat) / 330679773) [(5, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1370880 : Rat) / 12247399) [(5, 2), (11, 1), (13, 1), (14, 2)],
  term ((137327360 : Rat) / 110226591) [(5, 2), (11, 1), (13, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(5, 2), (11, 1), (13, 2), (15, 1)],
  term ((-345665132 : Rat) / 330679773) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(5, 2), (11, 1), (14, 2), (15, 1)],
  term ((-729242142376 : Rat) / 94243735305) [(5, 2), (11, 1), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(5, 2), (11, 1), (15, 3)],
  term ((757710451232 : Rat) / 94243735305) [(5, 2), (11, 2)],
  term ((77987840 : Rat) / 110226591) [(5, 2), (11, 2), (12, 1)],
  term ((-194969600 : Rat) / 110226591) [(5, 2), (11, 2), (12, 1), (14, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 2), (11, 2), (13, 1), (15, 1)],
  term ((740884480 : Rat) / 330679773) [(5, 2), (11, 2), (14, 1)],
  term ((-9748480 : Rat) / 36742197) [(5, 2), (11, 2), (14, 2)],
  term ((9748480 : Rat) / 36742197) [(5, 2), (11, 2), (15, 2)],
  term ((-72 : Rat) / 67) [(5, 2), (12, 1)],
  term ((1311665768 : Rat) / 330679773) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((1969721246 : Rat) / 330679773) [(5, 2), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(5, 2), (13, 1), (15, 3)],
  term ((-35668129 : Rat) / 12247399) [(5, 2), (13, 2)],
  term ((-16569700 : Rat) / 12247399) [(5, 2), (13, 2), (14, 1)],
  term ((913920 : Rat) / 12247399) [(5, 2), (13, 2), (15, 2)],
  term ((-99 : Rat) / 67) [(5, 2), (14, 1)],
  term ((121272755524 : Rat) / 24800982975) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-22507001600 : Rat) / 110226591) [(7, 1), (8, 1), (15, 3)],
  term ((-60636377762 : Rat) / 24800982975) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((11253500800 : Rat) / 110226591) [(7, 1), (8, 2), (15, 3)],
  term ((-60636377762 : Rat) / 24800982975) [(7, 1), (9, 2), (15, 1), (16, 1)],
  term ((11253500800 : Rat) / 110226591) [(7, 1), (9, 2), (15, 3)],
  term ((-2528 : Rat) / 67) [(7, 2), (8, 1)],
  term ((15362856828928 : Rat) / 471218676525) [(7, 2), (8, 1), (9, 1), (11, 1)],
  term ((240044637952 : Rat) / 17452543575) [(7, 2), (8, 1), (9, 1), (13, 1)],
  term ((-18214535855444 : Rat) / 471218676525) [(7, 2), (8, 1), (9, 1), (15, 1)],
  term ((795686080 : Rat) / 12247399) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((-67506462887504 : Rat) / 157072892175) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((8771824241152 : Rat) / 157072892175) [(7, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((50923909120 : Rat) / 330679773) [(7, 2), (8, 1), (11, 2)],
  term ((-647729275536 : Rat) / 5817514525) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((137059753768 : Rat) / 5817514525) [(7, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((784 : Rat) / 67) [(7, 2), (8, 1), (14, 1)],
  term ((4189813184288 : Rat) / 17452543575) [(7, 2), (8, 1), (15, 2)],
  term ((-9579498314696 : Rat) / 157072892175) [(7, 2), (8, 1), (15, 2), (16, 1)],
  term ((1264 : Rat) / 67) [(7, 2), (8, 2)],
  term ((-7681428414464 : Rat) / 471218676525) [(7, 2), (8, 2), (9, 1), (11, 1)],
  term ((-120022318976 : Rat) / 17452543575) [(7, 2), (8, 2), (9, 1), (13, 1)],
  term ((9107267927722 : Rat) / 471218676525) [(7, 2), (8, 2), (9, 1), (15, 1)],
  term ((-397843040 : Rat) / 12247399) [(7, 2), (8, 2), (11, 1), (13, 1)],
  term ((33753231443752 : Rat) / 157072892175) [(7, 2), (8, 2), (11, 1), (15, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(7, 2), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-25461954560 : Rat) / 330679773) [(7, 2), (8, 2), (11, 2)],
  term ((323864637768 : Rat) / 5817514525) [(7, 2), (8, 2), (13, 1), (15, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(7, 2), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-392 : Rat) / 67) [(7, 2), (8, 2), (14, 1)],
  term ((-2094906592144 : Rat) / 17452543575) [(7, 2), (8, 2), (15, 2)],
  term ((4789749157348 : Rat) / 157072892175) [(7, 2), (8, 2), (15, 2), (16, 1)],
  term ((1264 : Rat) / 67) [(7, 2), (9, 2)],
  term ((-397843040 : Rat) / 12247399) [(7, 2), (9, 2), (11, 1), (13, 1)],
  term ((33753231443752 : Rat) / 157072892175) [(7, 2), (9, 2), (11, 1), (15, 1)],
  term ((-4385912120576 : Rat) / 157072892175) [(7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-25461954560 : Rat) / 330679773) [(7, 2), (9, 2), (11, 2)],
  term ((323864637768 : Rat) / 5817514525) [(7, 2), (9, 2), (13, 1), (15, 1)],
  term ((-68529876884 : Rat) / 5817514525) [(7, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-392 : Rat) / 67) [(7, 2), (9, 2), (14, 1)],
  term ((-2094906592144 : Rat) / 17452543575) [(7, 2), (9, 2), (15, 2)],
  term ((4789749157348 : Rat) / 157072892175) [(7, 2), (9, 2), (15, 2), (16, 1)],
  term ((-7681428414464 : Rat) / 471218676525) [(7, 2), (9, 3), (11, 1)],
  term ((-120022318976 : Rat) / 17452543575) [(7, 2), (9, 3), (13, 1)],
  term ((9107267927722 : Rat) / 471218676525) [(7, 2), (9, 3), (15, 1)],
  term ((-8771824241152 : Rat) / 157072892175) [(7, 3), (8, 1), (11, 1)],
  term ((-137059753768 : Rat) / 5817514525) [(7, 3), (8, 1), (13, 1)],
  term ((9579498314696 : Rat) / 157072892175) [(7, 3), (8, 1), (15, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(7, 3), (8, 2), (11, 1)],
  term ((68529876884 : Rat) / 5817514525) [(7, 3), (8, 2), (13, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(7, 3), (8, 2), (15, 1)],
  term ((4385912120576 : Rat) / 157072892175) [(7, 3), (9, 2), (11, 1)],
  term ((68529876884 : Rat) / 5817514525) [(7, 3), (9, 2), (13, 1)],
  term ((-4789749157348 : Rat) / 157072892175) [(7, 3), (9, 2), (15, 1)],
  term ((8870667674344 : Rat) / 94243735305) [(8, 1), (9, 1), (10, 1), (11, 1)],
  term ((147219747766 : Rat) / 3490508715) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-8496682585352 : Rat) / 94243735305) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((691863213644 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1)],
  term ((29365762048 : Rat) / 330679773) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((779878400 : Rat) / 110226591) [(8, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((93829120 : Rat) / 36742197) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-742532964824 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((206685851456 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-7692960320 : Rat) / 110226591) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-4640 : Rat) / 201) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-405093715256 : Rat) / 24800982975) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((389939200 : Rat) / 110226591) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((458840032 : Rat) / 12247399) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((36556800 : Rat) / 12247399) [(8, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-26126267336 : Rat) / 330679773) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((126 : Rat) / 67) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-703283200 : Rat) / 110226591) [(8, 1), (9, 1), (12, 1), (15, 3)],
  term ((6329836871 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1)],
  term ((-13869331616 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((5483520 : Rat) / 12247399) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1783187360 : Rat) / 36742197) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 918554925) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((5483520 : Rat) / 12247399) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((510250050352 : Rat) / 24800982975) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-41282089588 : Rat) / 24800982975) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35164160 : Rat) / 36742197) [(8, 1), (9, 1), (14, 1), (15, 3)],
  term ((189359814488 : Rat) / 24800982975) [(8, 1), (9, 1), (15, 1)],
  term ((-60636377762 : Rat) / 24800982975) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3736515200 : Rat) / 36742197) [(8, 1), (9, 1), (15, 3)],
  term ((571 : Rat) / 67) [(8, 1), (9, 2)],
  term ((-88204818688 : Rat) / 18848747061) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((44102409344 : Rat) / 18848747061) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1378200292 : Rat) / 698101743) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((689100146 : Rat) / 698101743) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((153811535336 : Rat) / 18848747061) [(8, 1), (9, 2), (15, 2)],
  term ((-76905767668 : Rat) / 18848747061) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-294 : Rat) / 67) [(8, 1), (10, 1)],
  term ((154480793264 : Rat) / 10471526145) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((-342716545544 : Rat) / 10471526145) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((357395842048 : Rat) / 10471526145) [(8, 1), (10, 1), (11, 2)],
  term ((-35164160 : Rat) / 110226591) [(8, 1), (10, 1), (13, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(8, 1), (10, 1), (13, 2)],
  term ((7311360 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-18278400 : Rat) / 12247399) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((351641600 : Rat) / 110226591) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-140656640 : Rat) / 110226591) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-254377334191 : Rat) / 31414578435) [(8, 1), (11, 1), (13, 1)],
  term ((-1495800320 : Rat) / 330679773) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2741760 : Rat) / 12247399) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((274654720 : Rat) / 110226591) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-10967040 : Rat) / 12247399) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-691330264 : Rat) / 330679773) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 36742197) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1458484284752 : Rat) / 94243735305) [(8, 1), (11, 1), (15, 1)],
  term ((-17582080 : Rat) / 36742197) [(8, 1), (11, 1), (15, 3)],
  term ((1515420902464 : Rat) / 94243735305) [(8, 1), (11, 2)],
  term ((155975680 : Rat) / 110226591) [(8, 1), (11, 2), (12, 1)],
  term ((-389939200 : Rat) / 110226591) [(8, 1), (11, 2), (12, 1), (14, 1)],
  term ((-77987840 : Rat) / 36742197) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((1481768960 : Rat) / 330679773) [(8, 1), (11, 2), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(8, 1), (11, 2), (14, 2)],
  term ((19496960 : Rat) / 36742197) [(8, 1), (11, 2), (15, 2)],
  term ((-144 : Rat) / 67) [(8, 1), (12, 1)],
  term ((2623331536 : Rat) / 330679773) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((3939442492 : Rat) / 330679773) [(8, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(8, 1), (13, 1), (15, 3)],
  term ((-71336258 : Rat) / 12247399) [(8, 1), (13, 2)],
  term ((-33139400 : Rat) / 12247399) [(8, 1), (13, 2), (14, 1)],
  term ((1827840 : Rat) / 12247399) [(8, 1), (13, 2), (15, 2)],
  term ((-198 : Rat) / 67) [(8, 1), (14, 1)],
  term ((-4435333837172 : Rat) / 94243735305) [(8, 2), (9, 1), (10, 1), (11, 1)],
  term ((-73609873883 : Rat) / 3490508715) [(8, 2), (9, 1), (10, 1), (13, 1)],
  term ((4248341292676 : Rat) / 94243735305) [(8, 2), (9, 1), (10, 1), (15, 1)],
  term ((-345931606822 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1)],
  term ((-14682881024 : Rat) / 330679773) [(8, 2), (9, 1), (11, 1), (12, 1)],
  term ((-389939200 : Rat) / 110226591) [(8, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-46914560 : Rat) / 36742197) [(8, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((371266482412 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(8, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-103342925728 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3846480160 : Rat) / 110226591) [(8, 2), (9, 1), (11, 1), (15, 2)],
  term ((2320 : Rat) / 201) [(8, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((202546857628 : Rat) / 24800982975) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((-194969600 : Rat) / 110226591) [(8, 2), (9, 1), (11, 2), (15, 1)],
  term ((-229420016 : Rat) / 12247399) [(8, 2), (9, 1), (12, 1), (13, 1)],
  term ((-18278400 : Rat) / 12247399) [(8, 2), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((13063133668 : Rat) / 330679773) [(8, 2), (9, 1), (12, 1), (15, 1)],
  term ((-63 : Rat) / 67) [(8, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((351641600 : Rat) / 110226591) [(8, 2), (9, 1), (12, 1), (15, 3)],
  term ((-6329836871 : Rat) / 1837109850) [(8, 2), (9, 1), (13, 1)],
  term ((6934665808 : Rat) / 918554925) [(8, 2), (9, 1), (13, 1), (14, 1)],
  term ((-2741760 : Rat) / 12247399) [(8, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(8, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((891593680 : Rat) / 36742197) [(8, 2), (9, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(8, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2741760 : Rat) / 12247399) [(8, 2), (9, 1), (13, 2), (15, 1)],
  term ((-255125025176 : Rat) / 24800982975) [(8, 2), (9, 1), (14, 1), (15, 1)],
  term ((20641044794 : Rat) / 24800982975) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((17582080 : Rat) / 36742197) [(8, 2), (9, 1), (14, 1), (15, 3)],
  term ((-94679907244 : Rat) / 24800982975) [(8, 2), (9, 1), (15, 1)],
  term ((30318188881 : Rat) / 24800982975) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1868257600 : Rat) / 36742197) [(8, 2), (9, 1), (15, 3)],
  term ((-571 : Rat) / 134) [(8, 2), (9, 2)],
  term ((44102409344 : Rat) / 18848747061) [(8, 2), (9, 2), (11, 1), (15, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(8, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(8, 2), (9, 2), (13, 1), (15, 1)],
  term ((-344550073 : Rat) / 698101743) [(8, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(8, 2), (9, 2), (15, 2)],
  term ((38452883834 : Rat) / 18848747061) [(8, 2), (9, 2), (15, 2), (16, 1)],
  term ((147 : Rat) / 67) [(8, 2), (10, 1)],
  term ((-77240396632 : Rat) / 10471526145) [(8, 2), (10, 1), (11, 1), (13, 1)],
  term ((171358272772 : Rat) / 10471526145) [(8, 2), (10, 1), (11, 1), (15, 1)],
  term ((-178697921024 : Rat) / 10471526145) [(8, 2), (10, 1), (11, 2)],
  term ((17582080 : Rat) / 110226591) [(8, 2), (10, 1), (13, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(8, 2), (10, 1), (13, 2)],
  term ((-3655680 : Rat) / 12247399) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((9139200 : Rat) / 12247399) [(8, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(8, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((254377334191 : Rat) / 62829156870) [(8, 2), (11, 1), (13, 1)],
  term ((747900160 : Rat) / 330679773) [(8, 2), (11, 1), (13, 1), (14, 1)],
  term ((1370880 : Rat) / 12247399) [(8, 2), (11, 1), (13, 1), (14, 2)],
  term ((-137327360 : Rat) / 110226591) [(8, 2), (11, 1), (13, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(8, 2), (11, 1), (13, 2), (15, 1)],
  term ((345665132 : Rat) / 330679773) [(8, 2), (11, 1), (14, 1), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(8, 2), (11, 1), (14, 2), (15, 1)],
  term ((729242142376 : Rat) / 94243735305) [(8, 2), (11, 1), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(8, 2), (11, 1), (15, 3)],
  term ((-757710451232 : Rat) / 94243735305) [(8, 2), (11, 2)],
  term ((-77987840 : Rat) / 110226591) [(8, 2), (11, 2), (12, 1)],
  term ((194969600 : Rat) / 110226591) [(8, 2), (11, 2), (12, 1), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(8, 2), (11, 2), (13, 1), (15, 1)],
  term ((-740884480 : Rat) / 330679773) [(8, 2), (11, 2), (14, 1)],
  term ((9748480 : Rat) / 36742197) [(8, 2), (11, 2), (14, 2)],
  term ((-9748480 : Rat) / 36742197) [(8, 2), (11, 2), (15, 2)],
  term ((72 : Rat) / 67) [(8, 2), (12, 1)],
  term ((-1311665768 : Rat) / 330679773) [(8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1969721246 : Rat) / 330679773) [(8, 2), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(8, 2), (13, 1), (15, 3)],
  term ((35668129 : Rat) / 12247399) [(8, 2), (13, 2)],
  term ((16569700 : Rat) / 12247399) [(8, 2), (13, 2), (14, 1)],
  term ((-913920 : Rat) / 12247399) [(8, 2), (13, 2), (15, 2)],
  term ((99 : Rat) / 67) [(8, 2), (14, 1)],
  term ((147 : Rat) / 67) [(9, 2), (10, 1)],
  term ((-77240396632 : Rat) / 10471526145) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((171358272772 : Rat) / 10471526145) [(9, 2), (10, 1), (11, 1), (15, 1)],
  term ((-178697921024 : Rat) / 10471526145) [(9, 2), (10, 1), (11, 2)],
  term ((17582080 : Rat) / 110226591) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(9, 2), (10, 1), (13, 2)],
  term ((-3655680 : Rat) / 12247399) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((9139200 : Rat) / 12247399) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((70328320 : Rat) / 110226591) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((254377334191 : Rat) / 62829156870) [(9, 2), (11, 1), (13, 1)],
  term ((747900160 : Rat) / 330679773) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((1370880 : Rat) / 12247399) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((-137327360 : Rat) / 110226591) [(9, 2), (11, 1), (13, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(9, 2), (11, 1), (13, 2), (15, 1)],
  term ((345665132 : Rat) / 330679773) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-8791040 : Rat) / 36742197) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((729242142376 : Rat) / 94243735305) [(9, 2), (11, 1), (15, 1)],
  term ((8791040 : Rat) / 36742197) [(9, 2), (11, 1), (15, 3)],
  term ((-757710451232 : Rat) / 94243735305) [(9, 2), (11, 2)],
  term ((-77987840 : Rat) / 110226591) [(9, 2), (11, 2), (12, 1)],
  term ((194969600 : Rat) / 110226591) [(9, 2), (11, 2), (12, 1), (14, 1)],
  term ((38993920 : Rat) / 36742197) [(9, 2), (11, 2), (13, 1), (15, 1)],
  term ((-740884480 : Rat) / 330679773) [(9, 2), (11, 2), (14, 1)],
  term ((9748480 : Rat) / 36742197) [(9, 2), (11, 2), (14, 2)],
  term ((-9748480 : Rat) / 36742197) [(9, 2), (11, 2), (15, 2)],
  term ((72 : Rat) / 67) [(9, 2), (12, 1)],
  term ((-1311665768 : Rat) / 330679773) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1969721246 : Rat) / 330679773) [(9, 2), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(9, 2), (13, 1), (15, 3)],
  term ((35668129 : Rat) / 12247399) [(9, 2), (13, 2)],
  term ((16569700 : Rat) / 12247399) [(9, 2), (13, 2), (14, 1)],
  term ((-913920 : Rat) / 12247399) [(9, 2), (13, 2), (15, 2)],
  term ((99 : Rat) / 67) [(9, 2), (14, 1)],
  term ((-4435333837172 : Rat) / 94243735305) [(9, 3), (10, 1), (11, 1)],
  term ((-73609873883 : Rat) / 3490508715) [(9, 3), (10, 1), (13, 1)],
  term ((4248341292676 : Rat) / 94243735305) [(9, 3), (10, 1), (15, 1)],
  term ((-345931606822 : Rat) / 24800982975) [(9, 3), (11, 1)],
  term ((-14682881024 : Rat) / 330679773) [(9, 3), (11, 1), (12, 1)],
  term ((-389939200 : Rat) / 110226591) [(9, 3), (11, 1), (12, 1), (15, 2)],
  term ((-46914560 : Rat) / 36742197) [(9, 3), (11, 1), (13, 1), (15, 1)],
  term ((371266482412 : Rat) / 24800982975) [(9, 3), (11, 1), (14, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 3), (11, 1), (14, 1), (15, 2)],
  term ((-103342925728 : Rat) / 24800982975) [(9, 3), (11, 1), (14, 1), (16, 1)],
  term ((3846480160 : Rat) / 110226591) [(9, 3), (11, 1), (15, 2)],
  term ((2320 : Rat) / 201) [(9, 3), (11, 1), (15, 2), (16, 1)],
  term ((202546857628 : Rat) / 24800982975) [(9, 3), (11, 1), (16, 1)],
  term ((-194969600 : Rat) / 110226591) [(9, 3), (11, 2), (15, 1)],
  term ((-229420016 : Rat) / 12247399) [(9, 3), (12, 1), (13, 1)],
  term ((-18278400 : Rat) / 12247399) [(9, 3), (12, 1), (13, 1), (15, 2)],
  term ((13063133668 : Rat) / 330679773) [(9, 3), (12, 1), (15, 1)],
  term ((-63 : Rat) / 67) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((351641600 : Rat) / 110226591) [(9, 3), (12, 1), (15, 3)],
  term ((-6329836871 : Rat) / 1837109850) [(9, 3), (13, 1)],
  term ((6934665808 : Rat) / 918554925) [(9, 3), (13, 1), (14, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 3), (13, 1), (14, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(9, 3), (13, 1), (14, 1), (16, 1)],
  term ((891593680 : Rat) / 36742197) [(9, 3), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 1837109850) [(9, 3), (13, 1), (16, 1)],
  term ((-2741760 : Rat) / 12247399) [(9, 3), (13, 2), (15, 1)],
  term ((-255125025176 : Rat) / 24800982975) [(9, 3), (14, 1), (15, 1)],
  term ((20641044794 : Rat) / 24800982975) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((17582080 : Rat) / 36742197) [(9, 3), (14, 1), (15, 3)],
  term ((-94679907244 : Rat) / 24800982975) [(9, 3), (15, 1)],
  term ((30318188881 : Rat) / 24800982975) [(9, 3), (15, 1), (16, 1)],
  term ((-1868257600 : Rat) / 36742197) [(9, 3), (15, 3)],
  term ((-571 : Rat) / 134) [(9, 4)],
  term ((44102409344 : Rat) / 18848747061) [(9, 4), (11, 1), (15, 1)],
  term ((-22051204672 : Rat) / 18848747061) [(9, 4), (11, 1), (15, 1), (16, 1)],
  term ((689100146 : Rat) / 698101743) [(9, 4), (13, 1), (15, 1)],
  term ((-344550073 : Rat) / 698101743) [(9, 4), (13, 1), (15, 1), (16, 1)],
  term ((-76905767668 : Rat) / 18848747061) [(9, 4), (15, 2)],
  term ((38452883834 : Rat) / 18848747061) [(9, 4), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 200 through 290. -/
theorem rs_R009_ueqv_R009NNNYN_block_03_0200_0290_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_03_0200_0290
      rs_R009_ueqv_R009NNNYN_block_03_0200_0290 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
