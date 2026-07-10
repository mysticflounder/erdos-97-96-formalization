/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 25:1700-1799

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 25 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_25_1700_1799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(12, 1)]
]

/-- Coefficient term 1700 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1700 : Poly :=
[
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1700 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1700 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1700 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1700_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1700
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1700 := by
  native_decide

/-- Coefficient term 1701 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1701 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1701 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1701 : Poly :=
[
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1701 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1701_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1701
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1701 := by
  native_decide

/-- Coefficient term 1702 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1702 : Poly :=
[
  term ((874055049381248000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1702 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1702 : Poly :=
[
  term ((1748110098762496000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-874055049381248000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1702 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1702_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1702
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1702 := by
  native_decide

/-- Coefficient term 1703 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1703 : Poly :=
[
  term ((-15787540775751772160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1703 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1703 : Poly :=
[
  term ((-31575081551503544320 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((15787540775751772160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1703 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1703_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1703
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1703 := by
  native_decide

/-- Coefficient term 1704 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1704 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1704 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1704 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1704 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1704_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1704
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1704 := by
  native_decide

/-- Coefficient term 1705 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1705 : Poly :=
[
  term ((-11875132818841600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1705 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1705 : Poly :=
[
  term ((11875132818841600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-23750265637683200 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1705 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1705_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1705
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1705 := by
  native_decide

/-- Coefficient term 1706 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1706 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1706 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1706 : Poly :=
[
  term ((-426539992519925760 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1706 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1706_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1706
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1706 := by
  native_decide

/-- Coefficient term 1707 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1707 : Poly :=
[
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1707 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1707 : Poly :=
[
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1707 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1707_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1707
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1707 := by
  native_decide

/-- Coefficient term 1708 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1708 : Poly :=
[
  term ((8507779018275031040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1708 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1708 : Poly :=
[
  term ((17015558036550062080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-8507779018275031040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1708 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1708_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1708
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1708 := by
  native_decide

/-- Coefficient term 1709 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1709 : Poly :=
[
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1709 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1709 : Poly :=
[
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1709 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1709_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1709
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1709 := by
  native_decide

/-- Coefficient term 1710 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1710 : Poly :=
[
  term ((3426115287186045440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 1710 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1710 : Poly :=
[
  term ((6852230574372090880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-3426115287186045440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1710 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1710_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1710
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1710 := by
  native_decide

/-- Coefficient term 1711 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1711 : Poly :=
[
  term ((-1729880126195415040 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1711 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1711 : Poly :=
[
  term ((1729880126195415040 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3459760252390830080 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1711 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1711_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1711
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1711 := by
  native_decide

/-- Coefficient term 1712 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1712 : Poly :=
[
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1712 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1712 : Poly :=
[
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((6897439332499251200 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1712 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1712_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1712
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1712 := by
  native_decide

/-- Coefficient term 1713 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1713 : Poly :=
[
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1713 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1713 : Poly :=
[
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1713 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1713_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1713
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1713 := by
  native_decide

/-- Coefficient term 1714 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1714 : Poly :=
[
  term ((2513367652039408640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1714 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1714 : Poly :=
[
  term ((5026735304078817280 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2513367652039408640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1714 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1714_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1714
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1714 := by
  native_decide

/-- Coefficient term 1715 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1715 : Poly :=
[
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1715 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1715 : Poly :=
[
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1715 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1715_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1715
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1715 := by
  native_decide

/-- Coefficient term 1716 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1716 : Poly :=
[
  term ((478716593246312960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 1716 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1716 : Poly :=
[
  term ((957433186492625920 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-478716593246312960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1716 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1716_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1716
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1716 := by
  native_decide

/-- Coefficient term 1717 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1717 : Poly :=
[
  term ((10435891975608494080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1717 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1717 : Poly :=
[
  term ((20871783951216988160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10435891975608494080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1717 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1717_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1717
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1717 := by
  native_decide

/-- Coefficient term 1718 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1718 : Poly :=
[
  term ((-1541384735997621760 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 1718 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1718 : Poly :=
[
  term ((-3082769471995243520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1541384735997621760 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1718 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1718_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1718
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1718 := by
  native_decide

/-- Coefficient term 1719 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1719 : Poly :=
[
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 1719 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1719 : Poly :=
[
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1719 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1719_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1719
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1719 := by
  native_decide

/-- Coefficient term 1720 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1720 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1720 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1720 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1720 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1720_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1720
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1720 := by
  native_decide

/-- Coefficient term 1721 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1721 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1721 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1721 : Poly :=
[
  term ((-142309018178682880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1721 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1721_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1721
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1721 := by
  native_decide

/-- Coefficient term 1722 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1722 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1722 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1722 : Poly :=
[
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1722 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1722_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1722
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1722 := by
  native_decide

/-- Coefficient term 1723 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1723 : Poly :=
[
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 1723 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1723 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1723 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1723_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1723
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1723 := by
  native_decide

/-- Coefficient term 1724 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1724 : Poly :=
[
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 1724 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1724 : Poly :=
[
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1724 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1724_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1724
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1724 := by
  native_decide

/-- Coefficient term 1725 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1725 : Poly :=
[
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)]
]

/-- Partial product 1725 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1725 : Poly :=
[
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1725 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1725_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1725
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1725 := by
  native_decide

/-- Coefficient term 1726 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1726 : Poly :=
[
  term ((-76444109191463256772 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1726 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1726 : Poly :=
[
  term ((-152888218382926513544 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((76444109191463256772 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1726 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1726_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1726
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1726 := by
  native_decide

/-- Coefficient term 1727 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1727 : Poly :=
[
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1727 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1727 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1727 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1727_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1727
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1727 := by
  native_decide

/-- Coefficient term 1728 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1728 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1728 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1728 : Poly :=
[
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1728 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1728_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1728
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1728 := by
  native_decide

/-- Coefficient term 1729 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1729 : Poly :=
[
  term ((247365388687035404172 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1729 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1729 : Poly :=
[
  term ((494730777374070808344 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-247365388687035404172 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1729 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1729_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1729
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1729 := by
  native_decide

/-- Coefficient term 1730 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1730 : Poly :=
[
  term ((-4529021105558100531868 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1730 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1730 : Poly :=
[
  term ((-9058042211116201063736 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4529021105558100531868 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1730 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1730_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1730
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1730 := by
  native_decide

/-- Coefficient term 1731 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1731 : Poly :=
[
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1731 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1731 : Poly :=
[
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1913865611540614527664 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1731 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1731_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1731
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1731 := by
  native_decide

/-- Coefficient term 1732 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1732 : Poly :=
[
  term ((-282950591279167184 : Rat) / 29943480525392195) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1732 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1732 : Poly :=
[
  term ((282950591279167184 : Rat) / 29943480525392195) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-565901182558334368 : Rat) / 29943480525392195) [(5, 1), (8, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1732 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1732_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1732
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1732 := by
  native_decide

/-- Coefficient term 1733 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1733 : Poly :=
[
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1733 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1733 : Poly :=
[
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1733 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1733_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1733
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1733 := by
  native_decide

/-- Coefficient term 1734 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1734 : Poly :=
[
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1734 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1734 : Poly :=
[
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1734 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1734_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1734
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1734 := by
  native_decide

/-- Coefficient term 1735 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1735 : Poly :=
[
  term ((851566195141640411186 : Rat) / 449152207880882925) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1735 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1735 : Poly :=
[
  term ((1703132390283280822372 : Rat) / 449152207880882925) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-851566195141640411186 : Rat) / 449152207880882925) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1735 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1735_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1735
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1735 := by
  native_decide

/-- Coefficient term 1736 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1736 : Poly :=
[
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1736 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1736 : Poly :=
[
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1736 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1736_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1736
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1736 := by
  native_decide

/-- Coefficient term 1737 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1737 : Poly :=
[
  term ((157969823306236832486 : Rat) / 269491324728529755) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 1737 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1737 : Poly :=
[
  term ((315939646612473664972 : Rat) / 269491324728529755) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((-157969823306236832486 : Rat) / 269491324728529755) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1737 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1737_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1737
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1737 := by
  native_decide

/-- Coefficient term 1738 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1738 : Poly :=
[
  term ((-153189279934086097958 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1738 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1738 : Poly :=
[
  term ((153189279934086097958 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-306378559868172195916 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1738 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1738_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1738
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1738 := by
  native_decide

/-- Coefficient term 1739 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1739 : Poly :=
[
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1739 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1739 : Poly :=
[
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((1967605085845116546016 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1739 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1739_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1739
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1739 := by
  native_decide

/-- Coefficient term 1740 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1740 : Poly :=
[
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1740 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1740 : Poly :=
[
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1740 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1740_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1740
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1740 := by
  native_decide

/-- Coefficient term 1741 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1741 : Poly :=
[
  term ((191247010214234184604 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1741 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1741 : Poly :=
[
  term ((382494020428468369208 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-191247010214234184604 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1741 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1741_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1741
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1741 := by
  native_decide

/-- Coefficient term 1742 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1742 : Poly :=
[
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1742 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1742 : Poly :=
[
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1742 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1742_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1742
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1742 := by
  native_decide

/-- Coefficient term 1743 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1743 : Poly :=
[
  term ((140363892821886174338 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 1743 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1743 : Poly :=
[
  term ((280727785643772348676 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-140363892821886174338 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1743 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1743_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1743
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1743 := by
  native_decide

/-- Coefficient term 1744 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1744 : Poly :=
[
  term ((1006172736779942814026 : Rat) / 449152207880882925) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1744 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1744 : Poly :=
[
  term ((2012345473559885628052 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1006172736779942814026 : Rat) / 449152207880882925) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1744 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1744_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1744
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1744 := by
  native_decide

/-- Coefficient term 1745 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1745 : Poly :=
[
  term ((-133916390591166974288 : Rat) / 449152207880882925) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1745 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1745 : Poly :=
[
  term ((-267832781182333948576 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((133916390591166974288 : Rat) / 449152207880882925) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1745 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1745_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1745
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1745 := by
  native_decide

/-- Coefficient term 1746 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1746 : Poly :=
[
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 1746 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1746 : Poly :=
[
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1746 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1746_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1746
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1746 := by
  native_decide

/-- Coefficient term 1747 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1747 : Poly :=
[
  term ((1950280846947912640 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1747 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1747 : Poly :=
[
  term ((-1950280846947912640 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3900561693895825280 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1747 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1747_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1747
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1747 := by
  native_decide

/-- Coefficient term 1748 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1748 : Poly :=
[
  term ((-5904479010699404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1748 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1748 : Poly :=
[
  term ((-11808958021398809600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((5904479010699404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1748 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1748_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1748
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1748 := by
  native_decide

/-- Coefficient term 1749 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1749 : Poly :=
[
  term ((-2935309080698355200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1749 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1749 : Poly :=
[
  term ((-5870618161396710400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2935309080698355200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1749 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1749_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1749
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1749 := by
  native_decide

/-- Coefficient term 1750 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1750 : Poly :=
[
  term ((73374032599333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1750 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1750 : Poly :=
[
  term ((146748065198667520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-73374032599333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1750 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1750_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1750
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1750 := by
  native_decide

/-- Coefficient term 1751 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1751 : Poly :=
[
  term ((1932852140541815360 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1751 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1751 : Poly :=
[
  term ((3865704281083630720 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1932852140541815360 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1751 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1751_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1751
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1751 := by
  native_decide

/-- Coefficient term 1752 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1752 : Poly :=
[
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1752 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1752 : Poly :=
[
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1752 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1752_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1752
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1752 := by
  native_decide

/-- Coefficient term 1753 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1753 : Poly :=
[
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1753 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1753 : Poly :=
[
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1753 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1753_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1753
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1753 := by
  native_decide

/-- Coefficient term 1754 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1754 : Poly :=
[
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

/-- Partial product 1754 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1754 : Poly :=
[
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1754 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1754_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1754
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1754 := by
  native_decide

/-- Coefficient term 1755 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1755 : Poly :=
[
  term ((-106229777509048983560 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1755 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1755 : Poly :=
[
  term ((106229777509048983560 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-212459555018097967120 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1755 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1755_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1755
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1755 := by
  native_decide

/-- Coefficient term 1756 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1756 : Poly :=
[
  term ((106052139444355981640 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1756 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1756 : Poly :=
[
  term ((212104278888711963280 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-106052139444355981640 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1756 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1756_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1756
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1756 := by
  native_decide

/-- Coefficient term 1757 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1757 : Poly :=
[
  term ((53154053764171186180 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1757 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1757 : Poly :=
[
  term ((106308107528342372360 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53154053764171186180 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1757 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1757_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1757
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1757 := by
  native_decide

/-- Coefficient term 1758 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1758 : Poly :=
[
  term ((19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1758 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1758 : Poly :=
[
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1758 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1758_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1758
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1758 := by
  native_decide

/-- Coefficient term 1759 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1759 : Poly :=
[
  term ((-28047785422329415010 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1759 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1759 : Poly :=
[
  term ((-56095570844658830020 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((28047785422329415010 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1759 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1759_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1759
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1759 := by
  native_decide

/-- Coefficient term 1760 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1760 : Poly :=
[
  term ((-50114158985805847300 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 1760 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1760 : Poly :=
[
  term ((-100228317971611694600 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((50114158985805847300 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1760 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1760_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1760
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1760 := by
  native_decide

/-- Coefficient term 1761 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1761 : Poly :=
[
  term ((742996509662550308522 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 1761 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1761 : Poly :=
[
  term ((1485993019325100617044 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-742996509662550308522 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1761 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1761_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1761
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1761 := by
  native_decide

/-- Coefficient term 1762 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1762 : Poly :=
[
  term ((60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1762 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1762 : Poly :=
[
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1762 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1762_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1762
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1762 := by
  native_decide

/-- Coefficient term 1763 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1763 : Poly :=
[
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1763 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1763 : Poly :=
[
  term ((-241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1763 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1763_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1763
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1763 := by
  native_decide

/-- Coefficient term 1764 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1764 : Poly :=
[
  term ((19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1764 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1764 : Poly :=
[
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1764 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1764_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1764
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1764 := by
  native_decide

/-- Coefficient term 1765 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1765 : Poly :=
[
  term ((-2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

/-- Partial product 1765 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1765 : Poly :=
[
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1765 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1765_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1765
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1765 := by
  native_decide

/-- Coefficient term 1766 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1766 : Poly :=
[
  term ((-39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

/-- Partial product 1766 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1766 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1766 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1766_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1766
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1766 := by
  native_decide

/-- Coefficient term 1767 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1767 : Poly :=
[
  term ((76688890501755096772 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (10, 2), (16, 1)]
]

/-- Partial product 1767 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1767 : Poly :=
[
  term ((153377781003510193544 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-76688890501755096772 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1767 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1767_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1767
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1767 := by
  native_decide

/-- Coefficient term 1768 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1768 : Poly :=
[
  term ((356878943642492988344 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1768 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1768 : Poly :=
[
  term ((-356878943642492988344 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((713757887284985976688 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1768 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1768_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1768
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1768 := by
  native_decide

/-- Coefficient term 1769 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1769 : Poly :=
[
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1769 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1769 : Poly :=
[
  term ((11077155358648986880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-22154310717297973760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1769 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1769_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1769
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1769 := by
  native_decide

/-- Coefficient term 1770 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1770 : Poly :=
[
  term ((11077155358648986880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1770 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1770 : Poly :=
[
  term ((22154310717297973760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1770 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1770_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1770
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1770 := by
  native_decide

/-- Coefficient term 1771 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1771 : Poly :=
[
  term ((-335622466618267104344 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1771 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1771 : Poly :=
[
  term ((-671244933236534208688 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((335622466618267104344 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1771 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1771_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1771
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1771 := by
  native_decide

/-- Coefficient term 1772 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1772 : Poly :=
[
  term ((-6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 1772 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1772 : Poly :=
[
  term ((-13551594980403200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1772 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1772_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1772
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1772 := by
  native_decide

/-- Coefficient term 1773 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1773 : Poly :=
[
  term ((5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1773 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1773 : Poly :=
[
  term ((11073931173088206080 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1773 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1773_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1773
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1773 := by
  native_decide

/-- Coefficient term 1774 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1774 : Poly :=
[
  term ((-53338337914494970724 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1774 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1774 : Poly :=
[
  term ((-106676675828989941448 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((53338337914494970724 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1774 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1774_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1774
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1774 := by
  native_decide

/-- Coefficient term 1775 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1775 : Poly :=
[
  term ((-6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1775 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1775 : Poly :=
[
  term ((-13551594980403200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1775 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1775_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1775
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1775 := by
  native_decide

/-- Coefficient term 1776 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1776 : Poly :=
[
  term ((-1536569335492290400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1776 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1776 : Poly :=
[
  term ((-3073138670984580800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1536569335492290400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1776 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1776_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1776
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1776 := by
  native_decide

/-- Coefficient term 1777 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1777 : Poly :=
[
  term ((-1612092780390400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1777 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1777 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1777 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1777_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1777
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1777 := by
  native_decide

/-- Coefficient term 1778 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1778 : Poly :=
[
  term ((50119950841001602724 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1778 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1778 : Poly :=
[
  term ((100239901682003205448 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50119950841001602724 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1778 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1778_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1778
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1778 := by
  native_decide

/-- Coefficient term 1779 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1779 : Poly :=
[
  term ((-5538577679324493440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1779 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1779 : Poly :=
[
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((5538577679324493440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1779 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1779_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1779
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1779 := by
  native_decide

/-- Coefficient term 1780 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1780 : Poly :=
[
  term ((738825248688638720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1780 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1780 : Poly :=
[
  term ((-738825248688638720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((1477650497377277440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1780 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1780_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1780
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1780 := by
  native_decide

/-- Coefficient term 1781 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1781 : Poly :=
[
  term ((5651932174739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1781 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1781 : Poly :=
[
  term ((-5651932174739200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((11303864349478400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1781 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1781_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1781
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1781 := by
  native_decide

/-- Coefficient term 1782 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1782 : Poly :=
[
  term ((-738825248688638720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1782 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1782 : Poly :=
[
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((738825248688638720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1782 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1782_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1782
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1782 := by
  native_decide

/-- Coefficient term 1783 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1783 : Poly :=
[
  term ((-94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1783 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1783 : Poly :=
[
  term ((-188614930677367040 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1783 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1783_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1783
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1783 := by
  native_decide

/-- Coefficient term 1784 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1784 : Poly :=
[
  term ((-2906417521193043200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1784 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1784 : Poly :=
[
  term ((-5812835042386086400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((2906417521193043200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1784 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1784_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1784
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1784 := by
  native_decide

/-- Coefficient term 1785 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1785 : Poly :=
[
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)]
]

/-- Partial product 1785 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1785 : Poly :=
[
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1785 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1785_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1785
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1785 := by
  native_decide

/-- Coefficient term 1786 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1786 : Poly :=
[
  term ((369412624344319360 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 1786 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1786 : Poly :=
[
  term ((738825248688638720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-369412624344319360 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1786 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1786_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1786
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1786 := by
  native_decide

/-- Coefficient term 1787 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1787 : Poly :=
[
  term ((-1511870104179276800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 1787 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1787 : Poly :=
[
  term ((-3023740208358553600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((1511870104179276800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1787 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1787_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1787
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1787 := by
  native_decide

/-- Coefficient term 1788 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1788 : Poly :=
[
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1788 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1788 : Poly :=
[
  term ((-241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((483295493905817600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1788 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1788_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1788
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1788 := by
  native_decide

/-- Coefficient term 1789 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1789 : Poly :=
[
  term ((-241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1789 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1789 : Poly :=
[
  term ((-483295493905817600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1789 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1789_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1789
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1789 := by
  native_decide

/-- Coefficient term 1790 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1790 : Poly :=
[
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (16, 1)]
]

/-- Partial product 1790 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1790 : Poly :=
[
  term ((-241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 1), (13, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1790 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1790_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1790
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1790 := by
  native_decide

/-- Coefficient term 1791 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1791 : Poly :=
[
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

/-- Partial product 1791 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1791 : Poly :=
[
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1791 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1791_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1791
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1791 := by
  native_decide

/-- Coefficient term 1792 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1792 : Poly :=
[
  term ((317127263015485085816 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1792 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1792 : Poly :=
[
  term ((-317127263015485085816 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((634254526030970171632 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1792 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1792_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1792
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1792 := by
  native_decide

/-- Coefficient term 1793 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1793 : Poly :=
[
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (15, 4), (16, 1)]
]

/-- Partial product 1793 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1793 : Poly :=
[
  term ((3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((-7263423089669411840 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1793 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1793_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1793
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1793 := by
  native_decide

/-- Coefficient term 1794 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1794 : Poly :=
[
  term ((-310712555123793349816 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1794 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1794 : Poly :=
[
  term ((-621425110247586699632 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((310712555123793349816 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1794 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1794_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1794
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1794 := by
  native_decide

/-- Coefficient term 1795 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1795 : Poly :=
[
  term ((3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1795 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1795 : Poly :=
[
  term ((7263423089669411840 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1795 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1795_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1795
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1795 := by
  native_decide

/-- Coefficient term 1796 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1796 : Poly :=
[
  term ((-20357695074296163844 : Rat) / 449152207880882925) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1796 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1796 : Poly :=
[
  term ((-40715390148592327688 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((20357695074296163844 : Rat) / 449152207880882925) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1796 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1796_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1796
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1796 := by
  native_decide

/-- Coefficient term 1797 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1797 : Poly :=
[
  term ((1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1797 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1797 : Poly :=
[
  term ((3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1797 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1797_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1797
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1797 := by
  native_decide

/-- Coefficient term 1798 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1798 : Poly :=
[
  term ((-1164516201876345920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1798 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1798 : Poly :=
[
  term ((-2329032403752691840 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((1164516201876345920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1798 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1798_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1798
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1798 := by
  native_decide

/-- Coefficient term 1799 from coefficient polynomial 25. -/
def rs_R010_ueqv_R010YNN_coefficient_25_1799 : Poly :=
[
  term ((-113637476833486394806 : Rat) / 808473974185589265) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1799 for generator 25. -/
def rs_R010_ueqv_R010YNN_partial_25_1799 : Poly :=
[
  term ((-227274953666972789612 : Rat) / 808473974185589265) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((113637476833486394806 : Rat) / 808473974185589265) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1799 for generator 25. -/
theorem rs_R010_ueqv_R010YNN_partial_25_1799_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_25_1799
        rs_R010_ueqv_R010YNN_generator_25_1700_1799 =
      rs_R010_ueqv_R010YNN_partial_25_1799 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_25_1700_1799 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_25_1700,
  rs_R010_ueqv_R010YNN_partial_25_1701,
  rs_R010_ueqv_R010YNN_partial_25_1702,
  rs_R010_ueqv_R010YNN_partial_25_1703,
  rs_R010_ueqv_R010YNN_partial_25_1704,
  rs_R010_ueqv_R010YNN_partial_25_1705,
  rs_R010_ueqv_R010YNN_partial_25_1706,
  rs_R010_ueqv_R010YNN_partial_25_1707,
  rs_R010_ueqv_R010YNN_partial_25_1708,
  rs_R010_ueqv_R010YNN_partial_25_1709,
  rs_R010_ueqv_R010YNN_partial_25_1710,
  rs_R010_ueqv_R010YNN_partial_25_1711,
  rs_R010_ueqv_R010YNN_partial_25_1712,
  rs_R010_ueqv_R010YNN_partial_25_1713,
  rs_R010_ueqv_R010YNN_partial_25_1714,
  rs_R010_ueqv_R010YNN_partial_25_1715,
  rs_R010_ueqv_R010YNN_partial_25_1716,
  rs_R010_ueqv_R010YNN_partial_25_1717,
  rs_R010_ueqv_R010YNN_partial_25_1718,
  rs_R010_ueqv_R010YNN_partial_25_1719,
  rs_R010_ueqv_R010YNN_partial_25_1720,
  rs_R010_ueqv_R010YNN_partial_25_1721,
  rs_R010_ueqv_R010YNN_partial_25_1722,
  rs_R010_ueqv_R010YNN_partial_25_1723,
  rs_R010_ueqv_R010YNN_partial_25_1724,
  rs_R010_ueqv_R010YNN_partial_25_1725,
  rs_R010_ueqv_R010YNN_partial_25_1726,
  rs_R010_ueqv_R010YNN_partial_25_1727,
  rs_R010_ueqv_R010YNN_partial_25_1728,
  rs_R010_ueqv_R010YNN_partial_25_1729,
  rs_R010_ueqv_R010YNN_partial_25_1730,
  rs_R010_ueqv_R010YNN_partial_25_1731,
  rs_R010_ueqv_R010YNN_partial_25_1732,
  rs_R010_ueqv_R010YNN_partial_25_1733,
  rs_R010_ueqv_R010YNN_partial_25_1734,
  rs_R010_ueqv_R010YNN_partial_25_1735,
  rs_R010_ueqv_R010YNN_partial_25_1736,
  rs_R010_ueqv_R010YNN_partial_25_1737,
  rs_R010_ueqv_R010YNN_partial_25_1738,
  rs_R010_ueqv_R010YNN_partial_25_1739,
  rs_R010_ueqv_R010YNN_partial_25_1740,
  rs_R010_ueqv_R010YNN_partial_25_1741,
  rs_R010_ueqv_R010YNN_partial_25_1742,
  rs_R010_ueqv_R010YNN_partial_25_1743,
  rs_R010_ueqv_R010YNN_partial_25_1744,
  rs_R010_ueqv_R010YNN_partial_25_1745,
  rs_R010_ueqv_R010YNN_partial_25_1746,
  rs_R010_ueqv_R010YNN_partial_25_1747,
  rs_R010_ueqv_R010YNN_partial_25_1748,
  rs_R010_ueqv_R010YNN_partial_25_1749,
  rs_R010_ueqv_R010YNN_partial_25_1750,
  rs_R010_ueqv_R010YNN_partial_25_1751,
  rs_R010_ueqv_R010YNN_partial_25_1752,
  rs_R010_ueqv_R010YNN_partial_25_1753,
  rs_R010_ueqv_R010YNN_partial_25_1754,
  rs_R010_ueqv_R010YNN_partial_25_1755,
  rs_R010_ueqv_R010YNN_partial_25_1756,
  rs_R010_ueqv_R010YNN_partial_25_1757,
  rs_R010_ueqv_R010YNN_partial_25_1758,
  rs_R010_ueqv_R010YNN_partial_25_1759,
  rs_R010_ueqv_R010YNN_partial_25_1760,
  rs_R010_ueqv_R010YNN_partial_25_1761,
  rs_R010_ueqv_R010YNN_partial_25_1762,
  rs_R010_ueqv_R010YNN_partial_25_1763,
  rs_R010_ueqv_R010YNN_partial_25_1764,
  rs_R010_ueqv_R010YNN_partial_25_1765,
  rs_R010_ueqv_R010YNN_partial_25_1766,
  rs_R010_ueqv_R010YNN_partial_25_1767,
  rs_R010_ueqv_R010YNN_partial_25_1768,
  rs_R010_ueqv_R010YNN_partial_25_1769,
  rs_R010_ueqv_R010YNN_partial_25_1770,
  rs_R010_ueqv_R010YNN_partial_25_1771,
  rs_R010_ueqv_R010YNN_partial_25_1772,
  rs_R010_ueqv_R010YNN_partial_25_1773,
  rs_R010_ueqv_R010YNN_partial_25_1774,
  rs_R010_ueqv_R010YNN_partial_25_1775,
  rs_R010_ueqv_R010YNN_partial_25_1776,
  rs_R010_ueqv_R010YNN_partial_25_1777,
  rs_R010_ueqv_R010YNN_partial_25_1778,
  rs_R010_ueqv_R010YNN_partial_25_1779,
  rs_R010_ueqv_R010YNN_partial_25_1780,
  rs_R010_ueqv_R010YNN_partial_25_1781,
  rs_R010_ueqv_R010YNN_partial_25_1782,
  rs_R010_ueqv_R010YNN_partial_25_1783,
  rs_R010_ueqv_R010YNN_partial_25_1784,
  rs_R010_ueqv_R010YNN_partial_25_1785,
  rs_R010_ueqv_R010YNN_partial_25_1786,
  rs_R010_ueqv_R010YNN_partial_25_1787,
  rs_R010_ueqv_R010YNN_partial_25_1788,
  rs_R010_ueqv_R010YNN_partial_25_1789,
  rs_R010_ueqv_R010YNN_partial_25_1790,
  rs_R010_ueqv_R010YNN_partial_25_1791,
  rs_R010_ueqv_R010YNN_partial_25_1792,
  rs_R010_ueqv_R010YNN_partial_25_1793,
  rs_R010_ueqv_R010YNN_partial_25_1794,
  rs_R010_ueqv_R010YNN_partial_25_1795,
  rs_R010_ueqv_R010YNN_partial_25_1796,
  rs_R010_ueqv_R010YNN_partial_25_1797,
  rs_R010_ueqv_R010YNN_partial_25_1798,
  rs_R010_ueqv_R010YNN_partial_25_1799
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_25_1700_1799 : Poly :=
[
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1748110098762496000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-16055843053380229120 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-874055049381248000 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((15787540775751772160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-426539992519925760 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((17015558036550062080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((6959106769741665280 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((426539992519925760 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-23750265637683200 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((213269996259962880 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8507779018275031040 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-106634998129981440 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-3426115287186045440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-6897439332499251200 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((5026735304078817280 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((957433186492625920 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((20871783951216988160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2106870906591001600 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-3459760252390830080 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((6897439332499251200 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((3448719666249625600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2513367652039408640 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-478716593246312960 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-10435891975608494080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1541384735997621760 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1724359833124812800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 2), (15, 3), (16, 1)],
  term ((-142309018178682880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 1), (16, 1)],
  term ((142309018178682880 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((71154509089341440 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (14, 1), (16, 1)],
  term ((-35577254544670720 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (15, 2), (16, 1)],
  term ((17788627272335360 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-152888218382926513544 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((76444109191463256772 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((494730777374070808344 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-185237230718587553408 : Rat) / 53898264945705951) [(5, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-247365388687035404172 : Rat) / 149717402626960975) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((4529021105558100531868 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1913865611540614527664 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1703132390283280822372 : Rat) / 449152207880882925) [(5, 1), (8, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((318486201933986169628 : Rat) / 269491324728529755) [(5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((1913865611540614527664 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-565901182558334368 : Rat) / 29943480525392195) [(5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((956932805770307263832 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-851566195141640411186 : Rat) / 449152207880882925) [(5, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-478466402885153631916 : Rat) / 1347456623642648775) [(5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-157969823306236832486 : Rat) / 269491324728529755) [(5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-1967605085845116546016 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((382494020428468369208 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((280727785643772348676 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((2012345473559885628052 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((191735058619924345298 : Rat) / 449152207880882925) [(5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-306378559868172195916 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((1967605085845116546016 : Rat) / 149717402626960975) [(5, 1), (8, 1), (12, 2), (15, 3), (16, 1)],
  term ((983802542922558273008 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-191247010214234184604 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-140363892821886174338 : Rat) / 449152207880882925) [(5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-1006172736779942814026 : Rat) / 449152207880882925) [(5, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((133916390591166974288 : Rat) / 449152207880882925) [(5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-491901271461279136504 : Rat) / 149717402626960975) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((-11808958021398809600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5870618161396710400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((146748065198667520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((638474478045239360 : Rat) / 5988696105078439) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3900561693895825280 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((5904479010699404800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((2935309080698355200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-73374032599333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1932852140541815360 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((60411936738227200 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (12, 2), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 2), (16, 1)],
  term ((212104278888711963280 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((106308107528342372360 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-56095570844658830020 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((2000486512479096320 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((1485993019325100617044 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-212459555018097967120 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((-106052139444355981640 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53154053764171186180 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((28047785422329415010 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((50114158985805847300 : Rat) / 161694794837117853) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-742996509662550308522 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (10, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-60411936738227200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (13, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4351667738521600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (12, 1), (15, 2), (16, 1)],
  term ((153377781003510193544 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (10, 2), (12, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2175833869260800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (10, 2), (14, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 2), (15, 2), (16, 1)],
  term ((-76688890501755096772 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (10, 2), (16, 1)],
  term ((22154310717297973760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-671244933236534208688 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13551594980403200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((11073931173088206080 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-106676675828989941448 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-13551594980403200 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3073138670984580800 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2246369543859334880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((713757887284985976688 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-22154310717297973760 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-11077155358648986880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((335622466618267104344 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-5536965586544103040 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((53338337914494970724 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((6775797490201600 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1536569335492290400 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1612092780390400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-50119950841001602724 : Rat) / 449152207880882925) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((5538577679324493440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1477650497377277440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-188614930677367040 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5812835042386086400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-3074607597931206400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((1477650497377277440 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((11303864349478400 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((738825248688638720 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((94307465338683520 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((2906417521193043200 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((-369412624344319360 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((1511870104179276800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-483295493905817600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 1), (13, 1), (16, 1)],
  term ((483295493905817600 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (12, 2), (15, 1), (16, 1)],
  term ((241647746952908800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (13, 1), (16, 1)],
  term ((-120823873476454400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 3), (15, 1), (16, 1)],
  term ((-621425110247586699632 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7263423089669411840 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-40715390148592327688 : Rat) / 449152207880882925) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2329032403752691840 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-227274953666972789612 : Rat) / 808473974185589265) [(5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-317127263015485085816 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 1), (15, 4), (16, 1)],
  term ((634254526030970171632 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-7263423089669411840 : Rat) / 53898264945705951) [(5, 1), (9, 1), (12, 2), (15, 4), (16, 1)],
  term ((310712555123793349816 : Rat) / 1347456623642648775) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3631711544834705920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((20357695074296163844 : Rat) / 449152207880882925) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1815855772417352960 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((1164516201876345920 : Rat) / 53898264945705951) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((113637476833486394806 : Rat) / 808473974185589265) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 25, terms 1700 through 1799. -/
theorem rs_R010_ueqv_R010YNN_block_25_1700_1799_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_25_1700_1799
      rs_R010_ueqv_R010YNN_block_25_1700_1799 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
