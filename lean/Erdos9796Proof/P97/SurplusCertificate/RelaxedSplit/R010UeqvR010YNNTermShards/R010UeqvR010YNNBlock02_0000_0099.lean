/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 2:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 2 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_02_0000_0099 : Poly :=
[
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0000 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (16, 1)]
]

/-- Partial product 0 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0000 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (10, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 3), (5, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 3), (1, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0000
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0001 : Poly :=
[
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 1 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0001 : Poly :=
[
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 3), (5, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0001
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0002 : Poly :=
[
  term ((-5642324731366400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0002 : Poly :=
[
  term ((-5642324731366400 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((5642324731366400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((5642324731366400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-5642324731366400 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0002
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0003 : Poly :=
[
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0003 : Poly :=
[
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0003
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0004 : Poly :=
[
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 4 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0004 : Poly :=
[
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 4), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0004
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0005 : Poly :=
[
  term ((31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 5 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0005 : Poly :=
[
  term ((31503976548889600 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0005
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0006 : Poly :=
[
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0006 : Poly :=
[
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (11, 3), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0006
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0007 : Poly :=
[
  term ((-4156296486594560 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 7 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0007 : Poly :=
[
  term ((-4156296486594560 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((4156296486594560 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((4156296486594560 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-4156296486594560 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0007
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0008 : Poly :=
[
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0008 : Poly :=
[
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0008
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0009 : Poly :=
[
  term ((80272046843251604 : Rat) / 449152207880882925) [(0, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 9 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0009 : Poly :=
[
  term ((80272046843251604 : Rat) / 449152207880882925) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-80272046843251604 : Rat) / 449152207880882925) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-80272046843251604 : Rat) / 449152207880882925) [(0, 1), (5, 1), (11, 3), (16, 1)],
  term ((80272046843251604 : Rat) / 449152207880882925) [(0, 3), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0009
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0010 : Poly :=
[
  term ((850240597195527224 : Rat) / 449152207880882925) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 10 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0010 : Poly :=
[
  term ((850240597195527224 : Rat) / 449152207880882925) [(0, 1), (1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-850240597195527224 : Rat) / 449152207880882925) [(0, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-850240597195527224 : Rat) / 449152207880882925) [(0, 1), (5, 1), (11, 2), (13, 1), (16, 1)],
  term ((850240597195527224 : Rat) / 449152207880882925) [(0, 3), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0010
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0011 : Poly :=
[
  term ((15170590786088610268 : Rat) / 449152207880882925) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0011 : Poly :=
[
  term ((15170590786088610268 : Rat) / 449152207880882925) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-15170590786088610268 : Rat) / 449152207880882925) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-15170590786088610268 : Rat) / 449152207880882925) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((15170590786088610268 : Rat) / 449152207880882925) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0011
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0012 : Poly :=
[
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0012 : Poly :=
[
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 3), (5, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0012
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0013 : Poly :=
[
  term ((-744508899780232576 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0013 : Poly :=
[
  term ((-744508899780232576 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((744508899780232576 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((744508899780232576 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 3), (16, 1)],
  term ((-744508899780232576 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0013
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0014 : Poly :=
[
  term ((1895205682433350144 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0014 : Poly :=
[
  term ((1895205682433350144 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-1895205682433350144 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-1895205682433350144 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((1895205682433350144 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0014
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0015 : Poly :=
[
  term ((862827549505294208 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0015 : Poly :=
[
  term ((862827549505294208 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-862827549505294208 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-862827549505294208 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((862827549505294208 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0015
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0016 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 16 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0016 : Poly :=
[
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 2), (10, 2), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0016
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0017 : Poly :=
[
  term ((-4318487275340100464 : Rat) / 449152207880882925) [(0, 1), (5, 2), (16, 1)]
]

/-- Partial product 17 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0017 : Poly :=
[
  term ((-4318487275340100464 : Rat) / 449152207880882925) [(0, 1), (1, 2), (5, 2), (16, 1)],
  term ((4318487275340100464 : Rat) / 449152207880882925) [(0, 1), (5, 2), (10, 2), (16, 1)],
  term ((4318487275340100464 : Rat) / 449152207880882925) [(0, 1), (5, 2), (11, 2), (16, 1)],
  term ((-4318487275340100464 : Rat) / 449152207880882925) [(0, 3), (5, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0017
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0018 : Poly :=
[
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (16, 1)]
]

/-- Partial product 18 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0018 : Poly :=
[
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 3), (9, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (10, 2), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (11, 2), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 3), (5, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0018
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0019 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 19 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0019 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 2), (1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 3), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 3), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0019
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0020 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 20 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0020 : Poly :=
[
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 2), (1, 1), (4, 1), (5, 1), (9, 2), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 3), (4, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0020
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0021 : Poly :=
[
  term ((-34470272989354410608 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (16, 1)]
]

/-- Partial product 21 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0021 : Poly :=
[
  term ((-34470272989354410608 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (4, 1), (5, 1), (16, 1)],
  term ((34470272989354410608 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (10, 2), (16, 1)],
  term ((34470272989354410608 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (11, 2), (16, 1)],
  term ((-34470272989354410608 : Rat) / 1347456623642648775) [(1, 3), (4, 1), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0021
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0022 : Poly :=
[
  term ((2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 22 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0022 : Poly :=
[
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 2), (1, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 1), (10, 2), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(1, 3), (4, 1), (5, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0022
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0023 : Poly :=
[
  term ((-212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 23 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0023 : Poly :=
[
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (10, 2), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (11, 2), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(1, 3), (5, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0023
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0024 : Poly :=
[
  term ((-31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 24 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0024 : Poly :=
[
  term ((-31503976548889600 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (8, 1), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(1, 3), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0024
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0025 : Poly :=
[
  term ((-806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 25 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0025 : Poly :=
[
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 2), (1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 3), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 3), (11, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(1, 3), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0025
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0026 : Poly :=
[
  term ((2015115975488000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 26 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0026 : Poly :=
[
  term ((2015115975488000 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2015115975488000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-2015115975488000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 3), (16, 1)],
  term ((2015115975488000 : Rat) / 53898264945705951) [(1, 3), (5, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0026
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0027 : Poly :=
[
  term ((-1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 27 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0027 : Poly :=
[
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 3), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(1, 3), (5, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0027
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0028 : Poly :=
[
  term ((1484391602355200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 28 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0028 : Poly :=
[
  term ((1484391602355200 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-1484391602355200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((-1484391602355200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((1484391602355200 : Rat) / 5988696105078439) [(1, 3), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0028
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0029 : Poly :=
[
  term ((47184918674844957188 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 1), (16, 1)]
]

/-- Partial product 29 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0029 : Poly :=
[
  term ((47184918674844957188 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((-47184918674844957188 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 1), (11, 2), (16, 1)],
  term ((-47184918674844957188 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 3), (16, 1)],
  term ((47184918674844957188 : Rat) / 1347456623642648775) [(1, 3), (5, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0029
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0030 : Poly :=
[
  term ((434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 30 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0030 : Poly :=
[
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 2), (14, 1), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(1, 3), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0030
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0031 : Poly :=
[
  term ((3484498147826857552 : Rat) / 269491324728529755) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 31 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0031 : Poly :=
[
  term ((3484498147826857552 : Rat) / 269491324728529755) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-3484498147826857552 : Rat) / 269491324728529755) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((-3484498147826857552 : Rat) / 269491324728529755) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((3484498147826857552 : Rat) / 269491324728529755) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0031
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0032 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 32 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0032 : Poly :=
[
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 3), (5, 2), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0032
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0033 : Poly :=
[
  term ((250856454560728192 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 33 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0033 : Poly :=
[
  term ((250856454560728192 : Rat) / 89830441576176585) [(0, 2), (1, 1), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((-250856454560728192 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((-250856454560728192 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (10, 3), (16, 1)],
  term ((250856454560728192 : Rat) / 89830441576176585) [(1, 3), (5, 2), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0033
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0034 : Poly :=
[
  term ((-195033477534490496 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 34 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0034 : Poly :=
[
  term ((-195033477534490496 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 2), (9, 1), (16, 1)],
  term ((195033477534490496 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (10, 2), (16, 1)],
  term ((195033477534490496 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-195033477534490496 : Rat) / 53898264945705951) [(1, 3), (5, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0034
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0035 : Poly :=
[
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 35 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0035 : Poly :=
[
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(0, 2), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0035
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0036 : Poly :=
[
  term ((-16404619015142400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 36 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0036 : Poly :=
[
  term ((-16404619015142400 : Rat) / 5988696105078439) [(0, 2), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0036
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0037 : Poly :=
[
  term ((789502509746675200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0037 : Poly :=
[
  term ((789502509746675200 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0037
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0038 : Poly :=
[
  term ((-525370704355696640 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (16, 1)]
]

/-- Partial product 38 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0038 : Poly :=
[
  term ((-525370704355696640 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 1), (7, 1), (9, 3), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 3), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0038
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0039 : Poly :=
[
  term ((433902310968806400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 39 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0039 : Poly :=
[
  term ((433902310968806400 : Rat) / 5988696105078439) [(0, 2), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-433902310968806400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-433902310968806400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0039
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0040 : Poly :=
[
  term ((434226380360671360 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0040 : Poly :=
[
  term ((434226380360671360 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0040
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0041 : Poly :=
[
  term ((862179916562406400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 41 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0041 : Poly :=
[
  term ((862179916562406400 : Rat) / 5988696105078439) [(0, 2), (3, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0041
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0042 : Poly :=
[
  term ((245950635730639568252 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 42 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0042 : Poly :=
[
  term ((245950635730639568252 : Rat) / 149717402626960975) [(0, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(1, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0042
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0043 : Poly :=
[
  term ((-2789026402405913600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 43 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0043 : Poly :=
[
  term ((-2789026402405913600 : Rat) / 53898264945705951) [(0, 2), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2789026402405913600 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((2789026402405913600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((2789026402405913600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0043
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0044 : Poly :=
[
  term ((-907927886208676480 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0044 : Poly :=
[
  term ((-907927886208676480 : Rat) / 53898264945705951) [(0, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((907927886208676480 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((907927886208676480 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0044
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0045 : Poly :=
[
  term ((-203585546790613284944 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (16, 1)]
]

/-- Partial product 45 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0045 : Poly :=
[
  term ((-203585546790613284944 : Rat) / 149717402626960975) [(0, 2), (3, 1), (5, 1), (9, 2), (16, 1)],
  term ((-203585546790613284944 : Rat) / 149717402626960975) [(1, 2), (3, 1), (5, 1), (9, 2), (16, 1)],
  term ((203585546790613284944 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((203585546790613284944 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0045
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0046 : Poly :=
[
  term ((63551921353625600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 46 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0046 : Poly :=
[
  term ((63551921353625600 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 2), (11, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0046
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0047 : Poly :=
[
  term ((-717863814876938240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (16, 1)]
]

/-- Partial product 47 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0047 : Poly :=
[
  term ((-717863814876938240 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 1), (9, 4), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (9, 4), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 2), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0047
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0048 : Poly :=
[
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 48 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0048 : Poly :=
[
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 2), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(3, 1), (5, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0048
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0049 : Poly :=
[
  term ((5201511447588672128 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 49 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0049 : Poly :=
[
  term ((5201511447588672128 : Rat) / 29943480525392195) [(0, 2), (3, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(1, 2), (3, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0049
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0050 : Poly :=
[
  term ((95981017097526230912 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 50 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0050 : Poly :=
[
  term ((95981017097526230912 : Rat) / 89830441576176585) [(0, 2), (3, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(1, 2), (3, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0050
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0051 : Poly :=
[
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 51 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0051 : Poly :=
[
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(0, 2), (3, 1), (5, 2), (9, 1), (16, 1)],
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 2), (9, 1), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (10, 2), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0051
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0052 : Poly :=
[
  term ((118930458309376000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 52 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0052 : Poly :=
[
  term ((118930458309376000 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0052
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0053 : Poly :=
[
  term ((68146038134768743936 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (16, 1)]
]

/-- Partial product 53 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0053 : Poly :=
[
  term ((68146038134768743936 : Rat) / 89830441576176585) [(0, 2), (3, 1), (5, 2), (9, 3), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(1, 2), (3, 1), (5, 2), (9, 3), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (10, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0053
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0054 : Poly :=
[
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (16, 1)]
]

/-- Partial product 54 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0054 : Poly :=
[
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 3), (9, 2), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 3), (9, 2), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (10, 2), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0054
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0055 : Poly :=
[
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 55 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0055 : Poly :=
[
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 2), (16, 1)],
  term ((1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0055
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0056 : Poly :=
[
  term ((-94764052844787200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 56 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0056 : Poly :=
[
  term ((-94764052844787200 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-94764052844787200 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((94764052844787200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((94764052844787200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0056
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0057 : Poly :=
[
  term ((67468606342681600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0057 : Poly :=
[
  term ((67468606342681600 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((67468606342681600 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-67468606342681600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-67468606342681600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0057_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0057
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0058 : Poly :=
[
  term ((36887658920358400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 58 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0058 : Poly :=
[
  term ((36887658920358400 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((36887658920358400 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-36887658920358400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((-36887658920358400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0058_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0058
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0059 : Poly :=
[
  term ((48866192105141722052 : Rat) / 449152207880882925) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 59 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0059 : Poly :=
[
  term ((48866192105141722052 : Rat) / 449152207880882925) [(0, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((48866192105141722052 : Rat) / 449152207880882925) [(1, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-48866192105141722052 : Rat) / 449152207880882925) [(4, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-48866192105141722052 : Rat) / 449152207880882925) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0059_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0059
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0060 : Poly :=
[
  term ((-90799098650677760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 60 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0060 : Poly :=
[
  term ((-90799098650677760 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-90799098650677760 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((90799098650677760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((90799098650677760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0060_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0060
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0061 : Poly :=
[
  term ((-67018776349091840 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 61 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0061 : Poly :=
[
  term ((-67018776349091840 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-67018776349091840 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((67018776349091840 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((67018776349091840 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0061_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0061
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0062 : Poly :=
[
  term ((147510663235425280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0062 : Poly :=
[
  term ((147510663235425280 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((147510663235425280 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-147510663235425280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-147510663235425280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0062_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0062
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0063 : Poly :=
[
  term ((531152421686763520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 63 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0063 : Poly :=
[
  term ((531152421686763520 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((531152421686763520 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-531152421686763520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 2), (16, 1)],
  term ((-531152421686763520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0063_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0063
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0064 : Poly :=
[
  term ((-440919652981422218672 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 64 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0064 : Poly :=
[
  term ((-440919652981422218672 : Rat) / 4042369870927946325) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-440919652981422218672 : Rat) / 4042369870927946325) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((440919652981422218672 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((440919652981422218672 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0064_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0064
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0065 : Poly :=
[
  term ((-8656407424179905364 : Rat) / 149717402626960975) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 65 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0065 : Poly :=
[
  term ((-8656407424179905364 : Rat) / 149717402626960975) [(0, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((-8656407424179905364 : Rat) / 149717402626960975) [(1, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((8656407424179905364 : Rat) / 149717402626960975) [(4, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((8656407424179905364 : Rat) / 149717402626960975) [(4, 1), (5, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0065_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0065
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0066 : Poly :=
[
  term ((76415268813144333776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0066 : Poly :=
[
  term ((76415268813144333776 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((76415268813144333776 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-76415268813144333776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-76415268813144333776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0066_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0066
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0067 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 67 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0067 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0067_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0067
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0068 : Poly :=
[
  term ((-23297341969672066048 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 68 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0068 : Poly :=
[
  term ((-23297341969672066048 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-23297341969672066048 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((23297341969672066048 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((23297341969672066048 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0068_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0068
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0069 : Poly :=
[
  term ((13777225220954386048 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 69 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0069 : Poly :=
[
  term ((13777225220954386048 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((13777225220954386048 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-13777225220954386048 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-13777225220954386048 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0069_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0069
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0070 : Poly :=
[
  term ((-5690335459279894016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0070 : Poly :=
[
  term ((-5690335459279894016 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-5690335459279894016 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((5690335459279894016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((5690335459279894016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0070_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0070
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0071 : Poly :=
[
  term ((9649295815565264512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (16, 1)]
]

/-- Partial product 71 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0071 : Poly :=
[
  term ((9649295815565264512 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((9649295815565264512 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((-9649295815565264512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 2), (16, 1)],
  term ((-9649295815565264512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0071_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0071
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0072 : Poly :=
[
  term ((68752773706477550968 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (16, 1)]
]

/-- Partial product 72 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0072 : Poly :=
[
  term ((68752773706477550968 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 2), (16, 1)],
  term ((68752773706477550968 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 2), (16, 1)],
  term ((-68752773706477550968 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (10, 2), (16, 1)],
  term ((-68752773706477550968 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0072_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0072
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0073 : Poly :=
[
  term ((2883886463239251712 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (16, 1)]
]

/-- Partial product 73 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0073 : Poly :=
[
  term ((2883886463239251712 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 3), (9, 1), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 3), (9, 1), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 2), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0073_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0073
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0074 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 74 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0074 : Poly :=
[
  term ((17406670954086400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0074_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0074
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0075 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 75 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0075 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0075_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0075
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0076 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 76 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0076 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0076_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0076
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0077 : Poly :=
[
  term ((48178460964376960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0077 : Poly :=
[
  term ((48178460964376960 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((48178460964376960 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-48178460964376960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-48178460964376960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0077_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0077
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0078 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 78 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0078 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0078_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0078
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0079 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0079 : Poly :=
[
  term ((-78950250974667520 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0079_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0079
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0080 : Poly :=
[
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 80 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0080 : Poly :=
[
  term ((39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0080_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0080
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0081 : Poly :=
[
  term ((-84110003448991256 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 81 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0081 : Poly :=
[
  term ((-84110003448991256 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-84110003448991256 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((84110003448991256 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((84110003448991256 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0081_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0081
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0082 : Poly :=
[
  term ((8703335477043200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 82 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0082 : Poly :=
[
  term ((8703335477043200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0082_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0082
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0083 : Poly :=
[
  term ((34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 83 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0083 : Poly :=
[
  term ((34813341908172800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0083_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0083
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0084 : Poly :=
[
  term ((105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 84 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0084 : Poly :=
[
  term ((105680489087075840 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((105680489087075840 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0084_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0084
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0085 : Poly :=
[
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 85 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0085 : Poly :=
[
  term ((-278506735265382400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (10, 2), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0085_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0085
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0086 : Poly :=
[
  term ((265743411665469692 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 86 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0086 : Poly :=
[
  term ((265743411665469692 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((265743411665469692 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-265743411665469692 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((-265743411665469692 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0086_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0086
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0087 : Poly :=
[
  term ((-215315886847195382 : Rat) / 17966088315235317) [(5, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 87 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0087 : Poly :=
[
  term ((-215315886847195382 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-215315886847195382 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((215315886847195382 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((215315886847195382 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0087_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0087
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0088 : Poly :=
[
  term ((889550793175939864 : Rat) / 53898264945705951) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0088 : Poly :=
[
  term ((889550793175939864 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((889550793175939864 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-889550793175939864 : Rat) / 53898264945705951) [(5, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((-889550793175939864 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0088_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0088
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0089 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 89 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0089 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0089_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0089
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0090 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0090 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0090_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0090
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0091 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 91 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0091 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0091_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0091
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0092 : Poly :=
[
  term ((2056716452869828376 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 92 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0092 : Poly :=
[
  term ((2056716452869828376 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((2056716452869828376 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-2056716452869828376 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((-2056716452869828376 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0092_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0092
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0093 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 93 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0093 : Poly :=
[
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 3), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0093_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0093
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0094 : Poly :=
[
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0094 : Poly :=
[
  term ((-39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0094_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0094
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0095 : Poly :=
[
  term ((21758338692608000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 95 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0095 : Poly :=
[
  term ((21758338692608000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((21758338692608000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-21758338692608000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-21758338692608000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0095_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0095
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0096 : Poly :=
[
  term ((285686631126498661124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0096 : Poly :=
[
  term ((285686631126498661124 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((285686631126498661124 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-285686631126498661124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-285686631126498661124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0096_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0096
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0097 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 97 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0097 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0097_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0097
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0098 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 98 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0098 : Poly :=
[
  term ((16404619015142400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0098_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0098
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 2. -/
def rs_R010_ueqv_R010YNN_coefficient_02_0099 : Poly :=
[
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 99 for generator 2. -/
def rs_R010_ueqv_R010YNN_partial_02_0099 : Poly :=
[
  term ((-789502509746675200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 2), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 2. -/
theorem rs_R010_ueqv_R010YNN_partial_02_0099_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_02_0099
        rs_R010_ueqv_R010YNN_generator_02_0000_0099 =
      rs_R010_ueqv_R010YNN_partial_02_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_02_0000_0099 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_02_0000,
  rs_R010_ueqv_R010YNN_partial_02_0001,
  rs_R010_ueqv_R010YNN_partial_02_0002,
  rs_R010_ueqv_R010YNN_partial_02_0003,
  rs_R010_ueqv_R010YNN_partial_02_0004,
  rs_R010_ueqv_R010YNN_partial_02_0005,
  rs_R010_ueqv_R010YNN_partial_02_0006,
  rs_R010_ueqv_R010YNN_partial_02_0007,
  rs_R010_ueqv_R010YNN_partial_02_0008,
  rs_R010_ueqv_R010YNN_partial_02_0009,
  rs_R010_ueqv_R010YNN_partial_02_0010,
  rs_R010_ueqv_R010YNN_partial_02_0011,
  rs_R010_ueqv_R010YNN_partial_02_0012,
  rs_R010_ueqv_R010YNN_partial_02_0013,
  rs_R010_ueqv_R010YNN_partial_02_0014,
  rs_R010_ueqv_R010YNN_partial_02_0015,
  rs_R010_ueqv_R010YNN_partial_02_0016,
  rs_R010_ueqv_R010YNN_partial_02_0017,
  rs_R010_ueqv_R010YNN_partial_02_0018,
  rs_R010_ueqv_R010YNN_partial_02_0019,
  rs_R010_ueqv_R010YNN_partial_02_0020,
  rs_R010_ueqv_R010YNN_partial_02_0021,
  rs_R010_ueqv_R010YNN_partial_02_0022,
  rs_R010_ueqv_R010YNN_partial_02_0023,
  rs_R010_ueqv_R010YNN_partial_02_0024,
  rs_R010_ueqv_R010YNN_partial_02_0025,
  rs_R010_ueqv_R010YNN_partial_02_0026,
  rs_R010_ueqv_R010YNN_partial_02_0027,
  rs_R010_ueqv_R010YNN_partial_02_0028,
  rs_R010_ueqv_R010YNN_partial_02_0029,
  rs_R010_ueqv_R010YNN_partial_02_0030,
  rs_R010_ueqv_R010YNN_partial_02_0031,
  rs_R010_ueqv_R010YNN_partial_02_0032,
  rs_R010_ueqv_R010YNN_partial_02_0033,
  rs_R010_ueqv_R010YNN_partial_02_0034,
  rs_R010_ueqv_R010YNN_partial_02_0035,
  rs_R010_ueqv_R010YNN_partial_02_0036,
  rs_R010_ueqv_R010YNN_partial_02_0037,
  rs_R010_ueqv_R010YNN_partial_02_0038,
  rs_R010_ueqv_R010YNN_partial_02_0039,
  rs_R010_ueqv_R010YNN_partial_02_0040,
  rs_R010_ueqv_R010YNN_partial_02_0041,
  rs_R010_ueqv_R010YNN_partial_02_0042,
  rs_R010_ueqv_R010YNN_partial_02_0043,
  rs_R010_ueqv_R010YNN_partial_02_0044,
  rs_R010_ueqv_R010YNN_partial_02_0045,
  rs_R010_ueqv_R010YNN_partial_02_0046,
  rs_R010_ueqv_R010YNN_partial_02_0047,
  rs_R010_ueqv_R010YNN_partial_02_0048,
  rs_R010_ueqv_R010YNN_partial_02_0049,
  rs_R010_ueqv_R010YNN_partial_02_0050,
  rs_R010_ueqv_R010YNN_partial_02_0051,
  rs_R010_ueqv_R010YNN_partial_02_0052,
  rs_R010_ueqv_R010YNN_partial_02_0053,
  rs_R010_ueqv_R010YNN_partial_02_0054,
  rs_R010_ueqv_R010YNN_partial_02_0055,
  rs_R010_ueqv_R010YNN_partial_02_0056,
  rs_R010_ueqv_R010YNN_partial_02_0057,
  rs_R010_ueqv_R010YNN_partial_02_0058,
  rs_R010_ueqv_R010YNN_partial_02_0059,
  rs_R010_ueqv_R010YNN_partial_02_0060,
  rs_R010_ueqv_R010YNN_partial_02_0061,
  rs_R010_ueqv_R010YNN_partial_02_0062,
  rs_R010_ueqv_R010YNN_partial_02_0063,
  rs_R010_ueqv_R010YNN_partial_02_0064,
  rs_R010_ueqv_R010YNN_partial_02_0065,
  rs_R010_ueqv_R010YNN_partial_02_0066,
  rs_R010_ueqv_R010YNN_partial_02_0067,
  rs_R010_ueqv_R010YNN_partial_02_0068,
  rs_R010_ueqv_R010YNN_partial_02_0069,
  rs_R010_ueqv_R010YNN_partial_02_0070,
  rs_R010_ueqv_R010YNN_partial_02_0071,
  rs_R010_ueqv_R010YNN_partial_02_0072,
  rs_R010_ueqv_R010YNN_partial_02_0073,
  rs_R010_ueqv_R010YNN_partial_02_0074,
  rs_R010_ueqv_R010YNN_partial_02_0075,
  rs_R010_ueqv_R010YNN_partial_02_0076,
  rs_R010_ueqv_R010YNN_partial_02_0077,
  rs_R010_ueqv_R010YNN_partial_02_0078,
  rs_R010_ueqv_R010YNN_partial_02_0079,
  rs_R010_ueqv_R010YNN_partial_02_0080,
  rs_R010_ueqv_R010YNN_partial_02_0081,
  rs_R010_ueqv_R010YNN_partial_02_0082,
  rs_R010_ueqv_R010YNN_partial_02_0083,
  rs_R010_ueqv_R010YNN_partial_02_0084,
  rs_R010_ueqv_R010YNN_partial_02_0085,
  rs_R010_ueqv_R010YNN_partial_02_0086,
  rs_R010_ueqv_R010YNN_partial_02_0087,
  rs_R010_ueqv_R010YNN_partial_02_0088,
  rs_R010_ueqv_R010YNN_partial_02_0089,
  rs_R010_ueqv_R010YNN_partial_02_0090,
  rs_R010_ueqv_R010YNN_partial_02_0091,
  rs_R010_ueqv_R010YNN_partial_02_0092,
  rs_R010_ueqv_R010YNN_partial_02_0093,
  rs_R010_ueqv_R010YNN_partial_02_0094,
  rs_R010_ueqv_R010YNN_partial_02_0095,
  rs_R010_ueqv_R010YNN_partial_02_0096,
  rs_R010_ueqv_R010YNN_partial_02_0097,
  rs_R010_ueqv_R010YNN_partial_02_0098,
  rs_R010_ueqv_R010YNN_partial_02_0099
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_02_0000_0099 : Poly :=
[
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (10, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (11, 2), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-5642324731366400 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 1), (1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (9, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-4156296486594560 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((80272046843251604 : Rat) / 449152207880882925) [(0, 1), (1, 2), (5, 1), (11, 1), (16, 1)],
  term ((850240597195527224 : Rat) / 449152207880882925) [(0, 1), (1, 2), (5, 1), (13, 1), (16, 1)],
  term ((15170590786088610268 : Rat) / 449152207880882925) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-744508899780232576 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1895205682433350144 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((862827549505294208 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-4318487275340100464 : Rat) / 449152207880882925) [(0, 1), (1, 2), (5, 2), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (1, 2), (5, 3), (9, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 1), (1, 3), (5, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (10, 2), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((5642324731366400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((5642324731366400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 53898264945705951) [(0, 1), (5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (9, 1), (11, 4), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((4156296486594560 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((4156296486594560 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-593756640942080 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 1), (5, 1), (9, 2), (11, 3), (16, 1)],
  term ((-80272046843251604 : Rat) / 449152207880882925) [(0, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((-850240597195527224 : Rat) / 449152207880882925) [(0, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-15170590786088610268 : Rat) / 449152207880882925) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-850240597195527224 : Rat) / 449152207880882925) [(0, 1), (5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-15170590786088610268 : Rat) / 449152207880882925) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((-80272046843251604 : Rat) / 449152207880882925) [(0, 1), (5, 1), (11, 3), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((744508899780232576 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-1895205682433350144 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((-862827549505294208 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-1895205682433350144 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-862827549505294208 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((744508899780232576 : Rat) / 269491324728529755) [(0, 1), (5, 2), (9, 1), (11, 3), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 2), (10, 2), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((4318487275340100464 : Rat) / 449152207880882925) [(0, 1), (5, 2), (10, 2), (16, 1)],
  term ((4318487275340100464 : Rat) / 449152207880882925) [(0, 1), (5, 2), (11, 2), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (10, 2), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 1), (5, 3), (9, 1), (11, 2), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(0, 2), (1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(0, 2), (1, 1), (4, 1), (5, 1), (9, 2), (16, 1)],
  term ((-34470272989354410608 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (4, 1), (5, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(0, 2), (1, 1), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (8, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(0, 2), (1, 1), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((2015115975488000 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((1484391602355200 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 1), (9, 2), (16, 1)],
  term ((47184918674844957188 : Rat) / 1347456623642648775) [(0, 2), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((3484498147826857552 : Rat) / 269491324728529755) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((250856454560728192 : Rat) / 89830441576176585) [(0, 2), (1, 1), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((-195033477534490496 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(0, 2), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(0, 2), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 1), (7, 1), (9, 3), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(0, 2), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(0, 2), (3, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(0, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-2789026402405913600 : Rat) / 53898264945705951) [(0, 2), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(0, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-203585546790613284944 : Rat) / 149717402626960975) [(0, 2), (3, 1), (5, 1), (9, 2), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 1), (9, 4), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(0, 2), (3, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(0, 2), (3, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(0, 2), (3, 1), (5, 2), (9, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(0, 2), (3, 1), (5, 2), (9, 3), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(0, 2), (3, 1), (5, 3), (9, 2), (16, 1)],
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-94764052844787200 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((67468606342681600 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((36887658920358400 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((48866192105141722052 : Rat) / 449152207880882925) [(0, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-90799098650677760 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-67018776349091840 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((147510663235425280 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((531152421686763520 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-440919652981422218672 : Rat) / 4042369870927946325) [(0, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-8656407424179905364 : Rat) / 149717402626960975) [(0, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((76415268813144333776 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-23297341969672066048 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((13777225220954386048 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-5690335459279894016 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((9649295815565264512 : Rat) / 269491324728529755) [(0, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((68752773706477550968 : Rat) / 1347456623642648775) [(0, 2), (4, 1), (5, 2), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(0, 2), (4, 1), (5, 3), (9, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((48178460964376960 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-84110003448991256 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((105680489087075840 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((265743411665469692 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-215315886847195382 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((889550793175939864 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((2056716452869828376 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((21758338692608000 : Rat) / 53898264945705951) [(0, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((285686631126498661124 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 3), (1, 1), (5, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 3), (5, 1), (7, 1), (16, 1)],
  term ((-5642324731366400 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((806046390195200 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(0, 3), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(0, 3), (5, 1), (9, 1), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-4156296486594560 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((593756640942080 : Rat) / 5988696105078439) [(0, 3), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((80272046843251604 : Rat) / 449152207880882925) [(0, 3), (5, 1), (11, 1), (16, 1)],
  term ((850240597195527224 : Rat) / 449152207880882925) [(0, 3), (5, 1), (13, 1), (16, 1)],
  term ((15170590786088610268 : Rat) / 449152207880882925) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 3), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-744508899780232576 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((1895205682433350144 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((862827549505294208 : Rat) / 269491324728529755) [(0, 3), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 2), (16, 1)],
  term ((-4318487275340100464 : Rat) / 449152207880882925) [(0, 3), (5, 2), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(0, 3), (5, 3), (9, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 3), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((1187513281884160 : Rat) / 5988696105078439) [(1, 1), (4, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((34470272989354410608 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (10, 2), (16, 1)],
  term ((34470272989354410608 : Rat) / 1347456623642648775) [(1, 1), (4, 1), (5, 1), (11, 2), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 1), (10, 2), (16, 1)],
  term ((-2450659916236995584 : Rat) / 269491324728529755) [(1, 1), (4, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (10, 2), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (11, 2), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((31503976548889600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 1), (11, 3), (16, 1)],
  term ((-2015115975488000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((806046390195200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (9, 1), (10, 3), (11, 1), (16, 1)],
  term ((-2015115975488000 : Rat) / 53898264945705951) [(1, 1), (5, 1), (9, 1), (11, 3), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((-1484391602355200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((1781269922826240 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (10, 3), (16, 1)],
  term ((-1484391602355200 : Rat) / 5988696105078439) [(1, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((-47184918674844957188 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 1), (11, 2), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (10, 2), (14, 1), (16, 1)],
  term ((-3484498147826857552 : Rat) / 269491324728529755) [(1, 1), (5, 1), (10, 2), (16, 1)],
  term ((-47184918674844957188 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (10, 3), (16, 1)],
  term ((-434664188152364720 : Rat) / 53898264945705951) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((-3484498147826857552 : Rat) / 269491324728529755) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-250856454560728192 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((195033477534490496 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (10, 2), (16, 1)],
  term ((-250856454560728192 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 1), (10, 3), (16, 1)],
  term ((195033477534490496 : Rat) / 53898264945705951) [(1, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (7, 1), (9, 3), (16, 1)],
  term ((433902310968806400 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((862179916562406400 : Rat) / 5988696105078439) [(1, 2), (3, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((245950635730639568252 : Rat) / 149717402626960975) [(1, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-2789026402405913600 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-907927886208676480 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-203585546790613284944 : Rat) / 149717402626960975) [(1, 2), (3, 1), (5, 1), (9, 2), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (9, 3), (11, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 1), (9, 4), (16, 1)],
  term ((-179731707542723902856 : Rat) / 269491324728529755) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(1, 2), (3, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((95981017097526230912 : Rat) / 89830441576176585) [(1, 2), (3, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-16751835683757716552 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 2), (9, 1), (16, 1)],
  term ((118930458309376000 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 2), (9, 2), (11, 1), (16, 1)],
  term ((68146038134768743936 : Rat) / 89830441576176585) [(1, 2), (3, 1), (5, 2), (9, 3), (16, 1)],
  term ((-2353134503918316800 : Rat) / 17966088315235317) [(1, 2), (3, 1), (5, 3), (9, 2), (16, 1)],
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-94764052844787200 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((67468606342681600 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((36887658920358400 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((48866192105141722052 : Rat) / 449152207880882925) [(1, 2), (4, 1), (5, 1), (9, 1), (16, 1)],
  term ((-90799098650677760 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-67018776349091840 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((147510663235425280 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((531152421686763520 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (9, 3), (16, 1)],
  term ((-440919652981422218672 : Rat) / 4042369870927946325) [(1, 2), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-8656407424179905364 : Rat) / 149717402626960975) [(1, 2), (4, 1), (5, 1), (13, 1), (16, 1)],
  term ((76415268813144333776 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((-23297341969672066048 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((13777225220954386048 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-5690335459279894016 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((9649295815565264512 : Rat) / 269491324728529755) [(1, 2), (4, 1), (5, 2), (9, 2), (16, 1)],
  term ((68752773706477550968 : Rat) / 1347456623642648775) [(1, 2), (4, 1), (5, 2), (16, 1)],
  term ((2883886463239251712 : Rat) / 89830441576176585) [(1, 2), (4, 1), (5, 3), (9, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((48178460964376960 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-84110003448991256 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((105680489087075840 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((265743411665469692 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-215315886847195382 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((889550793175939864 : Rat) / 53898264945705951) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((2056716452869828376 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((21758338692608000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((285686631126498661124 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (10, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1612092780390400 : Rat) / 53898264945705951) [(1, 3), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1187513281884160 : Rat) / 5988696105078439) [(1, 3), (4, 1), (5, 1), (9, 2), (16, 1)],
  term ((-34470272989354410608 : Rat) / 1347456623642648775) [(1, 3), (4, 1), (5, 1), (16, 1)],
  term ((2450659916236995584 : Rat) / 269491324728529755) [(1, 3), (4, 1), (5, 2), (9, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(1, 3), (5, 1), (6, 1), (16, 1)],
  term ((-31503976548889600 : Rat) / 53898264945705951) [(1, 3), (5, 1), (8, 1), (16, 1)],
  term ((-806046390195200 : Rat) / 17966088315235317) [(1, 3), (5, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((2015115975488000 : Rat) / 53898264945705951) [(1, 3), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1781269922826240 : Rat) / 5988696105078439) [(1, 3), (5, 1), (9, 2), (10, 1), (16, 1)],
  term ((1484391602355200 : Rat) / 5988696105078439) [(1, 3), (5, 1), (9, 2), (16, 1)],
  term ((47184918674844957188 : Rat) / 1347456623642648775) [(1, 3), (5, 1), (10, 1), (16, 1)],
  term ((434664188152364720 : Rat) / 53898264945705951) [(1, 3), (5, 1), (14, 1), (16, 1)],
  term ((3484498147826857552 : Rat) / 269491324728529755) [(1, 3), (5, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(1, 3), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((250856454560728192 : Rat) / 89830441576176585) [(1, 3), (5, 2), (9, 1), (10, 1), (16, 1)],
  term ((-195033477534490496 : Rat) / 53898264945705951) [(1, 3), (5, 2), (9, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 3), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (11, 2), (16, 1)],
  term ((-433902310968806400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-433902310968806400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 3), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((-862179916562406400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (10, 2), (16, 1)],
  term ((-245950635730639568252 : Rat) / 149717402626960975) [(3, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((2789026402405913600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((907927886208676480 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((907927886208676480 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((2789026402405913600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (9, 1), (11, 3), (16, 1)],
  term ((203585546790613284944 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (10, 2), (16, 1)],
  term ((203585546790613284944 : Rat) / 149717402626960975) [(3, 1), (5, 1), (9, 2), (11, 2), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (10, 2), (11, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 3), (11, 3), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (10, 2), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (9, 4), (11, 2), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(3, 1), (5, 1), (10, 2), (16, 1)],
  term ((179731707542723902856 : Rat) / 269491324728529755) [(3, 1), (5, 1), (11, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (10, 2), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(3, 1), (5, 2), (7, 1), (9, 2), (11, 2), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-95981017097526230912 : Rat) / 89830441576176585) [(3, 1), (5, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (10, 2), (16, 1)],
  term ((16751835683757716552 : Rat) / 53898264945705951) [(3, 1), (5, 2), (9, 1), (11, 2), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-118930458309376000 : Rat) / 17966088315235317) [(3, 1), (5, 2), (9, 2), (11, 3), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (10, 2), (16, 1)],
  term ((-68146038134768743936 : Rat) / 89830441576176585) [(3, 1), (5, 2), (9, 3), (11, 2), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (10, 2), (16, 1)],
  term ((2353134503918316800 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 2), (16, 1)],
  term ((1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 2), (16, 1)],
  term ((1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((94764052844787200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-67468606342681600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-36887658920358400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((-48866192105141722052 : Rat) / 449152207880882925) [(4, 1), (5, 1), (9, 1), (10, 2), (16, 1)],
  term ((-48866192105141722052 : Rat) / 449152207880882925) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((94764052844787200 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-67468606342681600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-36887658920358400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 4), (16, 1)],
  term ((90799098650677760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((67018776349091840 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-147510663235425280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((67018776349091840 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-147510663235425280 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((90799098650677760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (11, 3), (16, 1)],
  term ((-531152421686763520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (10, 2), (16, 1)],
  term ((-531152421686763520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (11, 2), (16, 1)],
  term ((440919652981422218672 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (10, 2), (11, 1), (16, 1)],
  term ((8656407424179905364 : Rat) / 149717402626960975) [(4, 1), (5, 1), (10, 2), (13, 1), (16, 1)],
  term ((-76415268813144333776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((8656407424179905364 : Rat) / 149717402626960975) [(4, 1), (5, 1), (11, 2), (13, 1), (16, 1)],
  term ((-76415268813144333776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((440919652981422218672 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (11, 3), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 2), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((23297341969672066048 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-13777225220954386048 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 2), (13, 1), (16, 1)],
  term ((5690335459279894016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-13777225220954386048 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((5690335459279894016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((23297341969672066048 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (11, 3), (16, 1)],
  term ((-9649295815565264512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (10, 2), (16, 1)],
  term ((-9649295815565264512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 2), (11, 2), (16, 1)],
  term ((-68752773706477550968 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (10, 2), (16, 1)],
  term ((-68752773706477550968 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (11, 2), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (10, 2), (16, 1)],
  term ((-2883886463239251712 : Rat) / 89830441576176585) [(4, 1), (5, 3), (9, 1), (11, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (10, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((-48178460964376960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (11, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((84110003448991256 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 2), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (10, 3), (16, 1)],
  term ((78950250974667520 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((84110003448991256 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-48178460964376960 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 4), (16, 1)],
  term ((-8703335477043200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 2), (11, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (10, 2), (13, 1), (16, 1)],
  term ((-105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 2), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((-105680489087075840 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 2), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 3), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (10, 2), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (11, 2), (16, 1)],
  term ((-265743411665469692 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 2), (11, 1), (16, 1)],
  term ((215315886847195382 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 2), (13, 1), (16, 1)],
  term ((-889550793175939864 : Rat) / 53898264945705951) [(5, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((215315886847195382 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 2), (13, 1), (16, 1)],
  term ((-889550793175939864 : Rat) / 53898264945705951) [(5, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-265743411665469692 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 3), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 3), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (10, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-2056716452869828376 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (10, 2), (16, 1)],
  term ((-2056716452869828376 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (11, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 2), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 3), (16, 1)],
  term ((-21758338692608000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 2), (11, 1), (16, 1)],
  term ((-285686631126498661124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 3), (11, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (10, 3), (15, 1), (16, 1)],
  term ((-285686631126498661124 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-21758338692608000 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 3), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 2), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 2), (15, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 3), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 2), (15, 2), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 2, terms 0 through 99. -/
theorem rs_R010_ueqv_R010YNN_block_02_0000_0099_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_02_0000_0099
      rs_R010_ueqv_R010YNN_block_02_0000_0099 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
