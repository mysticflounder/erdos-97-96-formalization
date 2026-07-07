/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 20:0-40

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 20 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_20_0000_0040 : Poly :=
[
  term (2 : Rat) [(6, 1), (8, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (9, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0000 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 0 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0000 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0000
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0001 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 1 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0001 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0001
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0002 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0002 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0002
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0003 : Poly :=
[
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 3 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0003 : Poly :=
[
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0003
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0004 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 4 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0004 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0004
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0005 : Poly :=
[
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 5 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0005 : Poly :=
[
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0005
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0006 : Poly :=
[
  term ((-747445980857746060 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0006 : Poly :=
[
  term ((-1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((747445980857746060 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (11, 1), (16, 1)],
  term ((-1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((747445980857746060 : Rat) / 53898264945705951) [(5, 1), (6, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0006
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0007 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 7 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0007 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0007
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0008 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 8 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0008 : Poly :=
[
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0008
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0009 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0009 : Poly :=
[
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0009
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0010 : Poly :=
[
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0010 : Poly :=
[
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0010
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0011 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0011 : Poly :=
[
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0011
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0012 : Poly :=
[
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 12 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0012 : Poly :=
[
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 3), (10, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0012
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0013 : Poly :=
[
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 13 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0013 : Poly :=
[
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 2), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 3), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0013
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0014 : Poly :=
[
  term ((747445980857746060 : Rat) / 53898264945705951) [(5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 14 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0014 : Poly :=
[
  term ((1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-747445980857746060 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-747445980857746060 : Rat) / 53898264945705951) [(5, 1), (7, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0014
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0015 : Poly :=
[
  term ((-721335974426616460 : Rat) / 53898264945705951) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 15 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0015 : Poly :=
[
  term ((-1442671948853232920 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((721335974426616460 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-1442671948853232920 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((721335974426616460 : Rat) / 53898264945705951) [(5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0015
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0016 : Poly :=
[
  term ((-324183486951138400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 16 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0016 : Poly :=
[
  term ((-648366973902276800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((324183486951138400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-648366973902276800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((324183486951138400 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0016
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0017 : Poly :=
[
  term ((-7615418542412800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 17 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0017 : Poly :=
[
  term ((-15230837084825600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((7615418542412800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-15230837084825600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((7615418542412800 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0017
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0018 : Poly :=
[
  term ((-1367051584595200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0018 : Poly :=
[
  term ((-2734103169190400 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((1367051584595200 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((1367051584595200 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0018
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0019 : Poly :=
[
  term ((-268684197729140480 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0019 : Poly :=
[
  term ((-537368395458280960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((268684197729140480 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-537368395458280960 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((268684197729140480 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0019
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0020 : Poly :=
[
  term ((-43516677385216000 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 20 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0020 : Poly :=
[
  term ((-87033354770432000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((43516677385216000 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((-87033354770432000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((43516677385216000 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0020
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0021 : Poly :=
[
  term ((197375627436668800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 21 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0021 : Poly :=
[
  term ((394751254873337600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-197375627436668800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((394751254873337600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-197375627436668800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0021
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0022 : Poly :=
[
  term ((-65585131918463360 : Rat) / 53898264945705951) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 22 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0022 : Poly :=
[
  term ((-131170263836926720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((65585131918463360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-131170263836926720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((65585131918463360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0022
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0023 : Poly :=
[
  term ((-568222030334950964 : Rat) / 53898264945705951) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 23 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0023 : Poly :=
[
  term ((-1136444060669901928 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((568222030334950964 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-1136444060669901928 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((568222030334950964 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0023
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0024 : Poly :=
[
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0024 : Poly :=
[
  term ((905146889612492800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((905146889612492800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0024
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0025 : Poly :=
[
  term ((-131342676088924160 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 25 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0025 : Poly :=
[
  term ((-262685352177848320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((131342676088924160 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (16, 1)],
  term ((131342676088924160 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0025
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0026 : Poly :=
[
  term ((9495979410319360 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0026 : Poly :=
[
  term ((18991958820638720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-9495979410319360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((18991958820638720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-9495979410319360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0026
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0027 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 27 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0027 : Poly :=
[
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 3), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 4), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0027
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0028 : Poly :=
[
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0028 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0028
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0029 : Poly :=
[
  term ((1728789452535746540 : Rat) / 53898264945705951) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 29 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0029 : Poly :=
[
  term ((3457578905071493080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1728789452535746540 : Rat) / 53898264945705951) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((3457578905071493080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1728789452535746540 : Rat) / 53898264945705951) [(5, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0029
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0030 : Poly :=
[
  term ((-23601619648628358427 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0030 : Poly :=
[
  term ((-47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((23601619648628358427 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((23601619648628358427 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0030
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0031 : Poly :=
[
  term ((3167390784629838103 : Rat) / 149717402626960975) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0031 : Poly :=
[
  term ((6334781569259676206 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3167390784629838103 : Rat) / 149717402626960975) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((6334781569259676206 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3167390784629838103 : Rat) / 149717402626960975) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0031
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0032 : Poly :=
[
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0032 : Poly :=
[
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0032
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0033 : Poly :=
[
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 33 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0033 : Poly :=
[
  term ((-92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-92807000338835200 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0033
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0034 : Poly :=
[
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 34 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0034 : Poly :=
[
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0034
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0035 : Poly :=
[
  term ((-788859502880099200 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 35 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0035 : Poly :=
[
  term ((-1577719005760198400 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((788859502880099200 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1577719005760198400 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((788859502880099200 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0035
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0036 : Poly :=
[
  term ((1300377861897168032 : Rat) / 89830441576176585) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 36 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0036 : Poly :=
[
  term ((2600755723794336064 : Rat) / 89830441576176585) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-1300377861897168032 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((2600755723794336064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-1300377861897168032 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0036
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0037 : Poly :=
[
  term ((-3669116084844416096 : Rat) / 269491324728529755) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0037 : Poly :=
[
  term ((-7338232169688832192 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((3669116084844416096 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-7338232169688832192 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((3669116084844416096 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0037
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0038 : Poly :=
[
  term ((9280700033883520 : Rat) / 17966088315235317) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 38 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0038 : Poly :=
[
  term ((18561400067767040 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (16, 1)],
  term ((-9280700033883520 : Rat) / 17966088315235317) [(5, 2), (7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0038
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0039 : Poly :=
[
  term ((632341872967488004 : Rat) / 53898264945705951) [(5, 2), (16, 1)]
]

/-- Partial product 39 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0039 : Poly :=
[
  term ((1264683745934976008 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 2), (16, 1)],
  term ((1264683745934976008 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0039
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 20. -/
def rs_R010_ueqv_R010YNN_coefficient_20_0040 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 40 for generator 20. -/
def rs_R010_ueqv_R010YNN_partial_20_0040 : Poly :=
[
  term ((352666601287573760 : Rat) / 17966088315235317) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 2), (9, 1), (16, 1)],
  term ((352666601287573760 : Rat) / 17966088315235317) [(5, 3), (7, 1), (9, 2), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 20. -/
theorem rs_R010_ueqv_R010YNN_partial_20_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_20_0040
        rs_R010_ueqv_R010YNN_generator_20_0000_0040 =
      rs_R010_ueqv_R010YNN_partial_20_0040 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_20_0000_0040 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_20_0000,
  rs_R010_ueqv_R010YNN_partial_20_0001,
  rs_R010_ueqv_R010YNN_partial_20_0002,
  rs_R010_ueqv_R010YNN_partial_20_0003,
  rs_R010_ueqv_R010YNN_partial_20_0004,
  rs_R010_ueqv_R010YNN_partial_20_0005,
  rs_R010_ueqv_R010YNN_partial_20_0006,
  rs_R010_ueqv_R010YNN_partial_20_0007,
  rs_R010_ueqv_R010YNN_partial_20_0008,
  rs_R010_ueqv_R010YNN_partial_20_0009,
  rs_R010_ueqv_R010YNN_partial_20_0010,
  rs_R010_ueqv_R010YNN_partial_20_0011,
  rs_R010_ueqv_R010YNN_partial_20_0012,
  rs_R010_ueqv_R010YNN_partial_20_0013,
  rs_R010_ueqv_R010YNN_partial_20_0014,
  rs_R010_ueqv_R010YNN_partial_20_0015,
  rs_R010_ueqv_R010YNN_partial_20_0016,
  rs_R010_ueqv_R010YNN_partial_20_0017,
  rs_R010_ueqv_R010YNN_partial_20_0018,
  rs_R010_ueqv_R010YNN_partial_20_0019,
  rs_R010_ueqv_R010YNN_partial_20_0020,
  rs_R010_ueqv_R010YNN_partial_20_0021,
  rs_R010_ueqv_R010YNN_partial_20_0022,
  rs_R010_ueqv_R010YNN_partial_20_0023,
  rs_R010_ueqv_R010YNN_partial_20_0024,
  rs_R010_ueqv_R010YNN_partial_20_0025,
  rs_R010_ueqv_R010YNN_partial_20_0026,
  rs_R010_ueqv_R010YNN_partial_20_0027,
  rs_R010_ueqv_R010YNN_partial_20_0028,
  rs_R010_ueqv_R010YNN_partial_20_0029,
  rs_R010_ueqv_R010YNN_partial_20_0030,
  rs_R010_ueqv_R010YNN_partial_20_0031,
  rs_R010_ueqv_R010YNN_partial_20_0032,
  rs_R010_ueqv_R010YNN_partial_20_0033,
  rs_R010_ueqv_R010YNN_partial_20_0034,
  rs_R010_ueqv_R010YNN_partial_20_0035,
  rs_R010_ueqv_R010YNN_partial_20_0036,
  rs_R010_ueqv_R010YNN_partial_20_0037,
  rs_R010_ueqv_R010YNN_partial_20_0038,
  rs_R010_ueqv_R010YNN_partial_20_0039,
  rs_R010_ueqv_R010YNN_partial_20_0040
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_20_0000_0040 : Poly :=
[
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 2), (10, 1), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (10, 1), (16, 1)],
  term ((-1442671948853232920 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (8, 2), (16, 1)],
  term ((-1494891961715492120 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((747445980857746060 : Rat) / 53898264945705951) [(5, 1), (6, 1), (7, 2), (11, 1), (16, 1)],
  term ((-15230837084825600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-2734103169190400 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-537368395458280960 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-87033354770432000 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((394751254873337600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-131170263836926720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1136444060669901928 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((905146889612492800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((18991958820638720 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 3), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((3457578905071493080 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((6334781569259676206 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-648366973902276800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 2), (11, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (9, 2), (16, 1)],
  term ((-747445980857746060 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((721335974426616460 : Rat) / 53898264945705951) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-522341500862076920 : Rat) / 53898264945705951) [(5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((7615418542412800 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((1367051584595200 : Rat) / 5988696105078439) [(5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((268684197729140480 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((43516677385216000 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((-197375627436668800 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((65585131918463360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((568222030334950964 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-452573444806246400 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((131342676088924160 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (13, 1), (16, 1)],
  term ((-9495979410319360 : Rat) / 53898264945705951) [(5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (9, 3), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-1728789452535746540 : Rat) / 53898264945705951) [(5, 1), (6, 2), (11, 1), (16, 1)],
  term ((23601619648628358427 : Rat) / 1347456623642648775) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-3167390784629838103 : Rat) / 149717402626960975) [(5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 3), (9, 1), (11, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 3), (9, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (6, 3), (9, 2), (11, 1), (16, 1)],
  term ((747445980857746060 : Rat) / 53898264945705951) [(5, 1), (6, 3), (11, 1), (16, 1)],
  term ((-648366973902276800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((3457578905071493080 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-47203239297256716854 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((6334781569259676206 : Rat) / 149717402626960975) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-15230837084825600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-2734103169190400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-537368395458280960 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-87033354770432000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((394751254873337600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-131170263836926720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1136444060669901928 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (16, 1)],
  term ((905146889612492800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)],
  term ((-262685352177848320 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (13, 1), (16, 1)],
  term ((18991958820638720 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 4), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((324183486951138400 : Rat) / 17966088315235317) [(5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((1563430728597207320 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((1367051584595200 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((268684197729140480 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((43516677385216000 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((-197375627436668800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((65585131918463360 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-97161102057586884 : Rat) / 5988696105078439) [(5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((131342676088924160 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((102101674829450240 : Rat) / 17966088315235317) [(5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((452573444806246400 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 3), (10, 1), (16, 1)],
  term ((-504793457668505600 : Rat) / 53898264945705951) [(5, 1), (7, 2), (9, 3), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-1728789452535746540 : Rat) / 53898264945705951) [(5, 1), (7, 2), (11, 1), (16, 1)],
  term ((23601619648628358427 : Rat) / 1347456623642648775) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-3167390784629838103 : Rat) / 149717402626960975) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 3), (8, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 1), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((-226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 2), (10, 1), (16, 1)],
  term ((226286722403123200 : Rat) / 53898264945705951) [(5, 1), (7, 3), (9, 2), (16, 1)],
  term ((-747445980857746060 : Rat) / 53898264945705951) [(5, 1), (7, 3), (10, 1), (16, 1)],
  term ((721335974426616460 : Rat) / 53898264945705951) [(5, 1), (7, 3), (16, 1)],
  term ((-92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1577719005760198400 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((2600755723794336064 : Rat) / 89830441576176585) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-7338232169688832192 : Rat) / 269491324728529755) [(5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((1264683745934976008 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((92807000338835200 : Rat) / 53898264945705951) [(5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((788859502880099200 : Rat) / 53898264945705951) [(5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1300377861897168032 : Rat) / 89830441576176585) [(5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((3669116084844416096 : Rat) / 269491324728529755) [(5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-9280700033883520 : Rat) / 17966088315235317) [(5, 2), (6, 2), (9, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (6, 2), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (6, 3), (9, 1), (11, 1), (16, 1)],
  term ((1264683745934976008 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-1577719005760198400 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((2600755723794336064 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-7338232169688832192 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 17966088315235317) [(5, 2), (7, 1), (9, 3), (16, 1)],
  term ((788859502880099200 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1300377861897168032 : Rat) / 89830441576176585) [(5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((3669116084844416096 : Rat) / 269491324728529755) [(5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-92807000338835200 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (7, 2), (9, 2), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(5, 2), (7, 2), (16, 1)],
  term ((46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 3), (9, 1), (10, 1), (16, 1)],
  term ((-46403500169417600 : Rat) / 53898264945705951) [(5, 2), (7, 3), (9, 1), (16, 1)],
  term ((352666601287573760 : Rat) / 17966088315235317) [(5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (6, 2), (9, 1), (16, 1)],
  term ((352666601287573760 : Rat) / 17966088315235317) [(5, 3), (7, 1), (9, 2), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(5, 3), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 20, terms 0 through 40. -/
theorem rs_R010_ueqv_R010YNN_block_20_0000_0040_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_20_0000_0040
      rs_R010_ueqv_R010YNN_block_20_0000_0040 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
