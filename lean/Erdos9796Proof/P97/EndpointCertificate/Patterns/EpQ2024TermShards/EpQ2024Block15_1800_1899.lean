/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:1800-1899

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_1800_1899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1800 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1800 : Poly :=
[
  term ((-1723274251931095 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1800 for generator 15. -/
def ep_Q2_024_partial_15_1800 : Poly :=
[
  term ((-3446548503862190 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1723274251931095 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1800 for generator 15. -/
theorem ep_Q2_024_partial_15_1800_valid :
    mulPoly ep_Q2_024_coefficient_15_1800
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1800 := by
  native_decide

/-- Coefficient term 1801 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1801 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 1), (12, 1), (15, 3)]
]

/-- Partial product 1801 for generator 15. -/
def ep_Q2_024_partial_15_1801 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 3)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1801 for generator 15. -/
theorem ep_Q2_024_partial_15_1801_valid :
    mulPoly ep_Q2_024_coefficient_15_1801
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1801 := by
  native_decide

/-- Coefficient term 1802 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1802 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1802 for generator 15. -/
def ep_Q2_024_partial_15_1802 : Poly :=
[
  term ((-3163264603646592 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1802 for generator 15. -/
theorem ep_Q2_024_partial_15_1802_valid :
    mulPoly ep_Q2_024_coefficient_15_1802
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1802 := by
  native_decide

/-- Coefficient term 1803 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1803 : Poly :=
[
  term ((-125075719062897525056491899812516052676 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (12, 2), (13, 1)]
]

/-- Partial product 1803 for generator 15. -/
def ep_Q2_024_partial_15_1803 : Poly :=
[
  term ((-250151438125795050112983799625032105352 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (8, 1), (12, 2), (13, 1)],
  term ((125075719062897525056491899812516052676 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1803 for generator 15. -/
theorem ep_Q2_024_partial_15_1803_valid :
    mulPoly ep_Q2_024_coefficient_15_1803
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1803 := by
  native_decide

/-- Coefficient term 1804 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1804 : Poly :=
[
  term ((13548174911558370637317327305327751926668457266779295327 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 1804 for generator 15. -/
def ep_Q2_024_partial_15_1804 : Poly :=
[
  term ((13548174911558370637317327305327751926668457266779295327 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-13548174911558370637317327305327751926668457266779295327 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1804 for generator 15. -/
theorem ep_Q2_024_partial_15_1804_valid :
    mulPoly ep_Q2_024_coefficient_15_1804
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1804 := by
  native_decide

/-- Coefficient term 1805 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1805 : Poly :=
[
  term ((-2605894666844055 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1805 for generator 15. -/
def ep_Q2_024_partial_15_1805 : Poly :=
[
  term ((-5211789333688110 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((2605894666844055 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1805 for generator 15. -/
theorem ep_Q2_024_partial_15_1805_valid :
    mulPoly ep_Q2_024_coefficient_15_1805
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1805 := by
  native_decide

/-- Coefficient term 1806 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1806 : Poly :=
[
  term ((-402316494741030423573346269230920770014 : Rat) / 359912837220743188970008058408861780397) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 1806 for generator 15. -/
def ep_Q2_024_partial_15_1806 : Poly :=
[
  term ((-804632989482060847146692538461841540028 : Rat) / 359912837220743188970008058408861780397) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((402316494741030423573346269230920770014 : Rat) / 359912837220743188970008058408861780397) [(7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1806 for generator 15. -/
theorem ep_Q2_024_partial_15_1806_valid :
    mulPoly ep_Q2_024_coefficient_15_1806
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1806 := by
  native_decide

/-- Coefficient term 1807 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1807 : Poly :=
[
  term ((1695711001167302422702866507675585086552 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1807 for generator 15. -/
def ep_Q2_024_partial_15_1807 : Poly :=
[
  term ((3391422002334604845405733015351170173104 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-1695711001167302422702866507675585086552 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1807 for generator 15. -/
theorem ep_Q2_024_partial_15_1807_valid :
    mulPoly ep_Q2_024_coefficient_15_1807
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1807 := by
  native_decide

/-- Coefficient term 1808 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1808 : Poly :=
[
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 2)]
]

/-- Partial product 1808 for generator 15. -/
def ep_Q2_024_partial_15_1808 : Poly :=
[
  term ((25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 2)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1808 for generator 15. -/
theorem ep_Q2_024_partial_15_1808_valid :
    mulPoly ep_Q2_024_coefficient_15_1808
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1808 := by
  native_decide

/-- Coefficient term 1809 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1809 : Poly :=
[
  term ((10607217460974230513901064790439933456878799151749883949 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 1809 for generator 15. -/
def ep_Q2_024_partial_15_1809 : Poly :=
[
  term ((10607217460974230513901064790439933456878799151749883949 : Rat) / 278999685639605945551432029250879769240203926974238414) [(6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-10607217460974230513901064790439933456878799151749883949 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1809 for generator 15. -/
theorem ep_Q2_024_partial_15_1809_valid :
    mulPoly ep_Q2_024_coefficient_15_1809
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1809 := by
  native_decide

/-- Coefficient term 1810 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1810 : Poly :=
[
  term ((618358238776509 : Rat) / 1162780221153193) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1810 for generator 15. -/
def ep_Q2_024_partial_15_1810 : Poly :=
[
  term ((1236716477553018 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-618358238776509 : Rat) / 1162780221153193) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1810 for generator 15. -/
theorem ep_Q2_024_partial_15_1810_valid :
    mulPoly ep_Q2_024_coefficient_15_1810
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1810 := by
  native_decide

/-- Coefficient term 1811 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1811 : Poly :=
[
  term ((-10591606886133126023298341722951515100 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (13, 2), (15, 1)]
]

/-- Partial product 1811 for generator 15. -/
def ep_Q2_024_partial_15_1811 : Poly :=
[
  term ((-21183213772266252046596683445903030200 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((10591606886133126023298341722951515100 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1811 for generator 15. -/
theorem ep_Q2_024_partial_15_1811_valid :
    mulPoly ep_Q2_024_coefficient_15_1811
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1811 := by
  native_decide

/-- Coefficient term 1812 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1812 : Poly :=
[
  term ((14440752691727531454346102886312194137018249720713511773 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1812 for generator 15. -/
def ep_Q2_024_partial_15_1812 : Poly :=
[
  term ((14440752691727531454346102886312194137018249720713511773 : Rat) / 278999685639605945551432029250879769240203926974238414) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-14440752691727531454346102886312194137018249720713511773 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1812 for generator 15. -/
theorem ep_Q2_024_partial_15_1812_valid :
    mulPoly ep_Q2_024_coefficient_15_1812
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1812 := by
  native_decide

/-- Coefficient term 1813 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1813 : Poly :=
[
  term ((2674381653335285 : Rat) / 1162780221153193) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1813 for generator 15. -/
def ep_Q2_024_partial_15_1813 : Poly :=
[
  term ((5348763306670570 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2674381653335285 : Rat) / 1162780221153193) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1813 for generator 15. -/
theorem ep_Q2_024_partial_15_1813_valid :
    mulPoly ep_Q2_024_coefficient_15_1813
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1813 := by
  native_decide

/-- Coefficient term 1814 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1814 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (14, 2), (15, 1)]
]

/-- Partial product 1814 for generator 15. -/
def ep_Q2_024_partial_15_1814 : Poly :=
[
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1814 for generator 15. -/
theorem ep_Q2_024_partial_15_1814_valid :
    mulPoly ep_Q2_024_coefficient_15_1814
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1814 := by
  native_decide

/-- Coefficient term 1815 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1815 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1815 for generator 15. -/
def ep_Q2_024_partial_15_1815 : Poly :=
[
  term ((-624553897293232 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1815 for generator 15. -/
theorem ep_Q2_024_partial_15_1815_valid :
    mulPoly ep_Q2_024_coefficient_15_1815
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1815 := by
  native_decide

/-- Coefficient term 1816 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1816 : Poly :=
[
  term ((41384524895814920612237797406368188987903248213064809087 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1816 for generator 15. -/
def ep_Q2_024_partial_15_1816 : Poly :=
[
  term ((41384524895814920612237797406368188987903248213064809087 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-41384524895814920612237797406368188987903248213064809087 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1816 for generator 15. -/
theorem ep_Q2_024_partial_15_1816_valid :
    mulPoly ep_Q2_024_coefficient_15_1816
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1816 := by
  native_decide

/-- Coefficient term 1817 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1817 : Poly :=
[
  term ((-1235944130217429 : Rat) / 2325560442306386) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 1817 for generator 15. -/
def ep_Q2_024_partial_15_1817 : Poly :=
[
  term ((-1235944130217429 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((1235944130217429 : Rat) / 2325560442306386) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1817 for generator 15. -/
theorem ep_Q2_024_partial_15_1817_valid :
    mulPoly ep_Q2_024_coefficient_15_1817
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1817 := by
  native_decide

/-- Coefficient term 1818 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1818 : Poly :=
[
  term ((-56589315471102669466415242231485818483327419250070008571 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (15, 3)]
]

/-- Partial product 1818 for generator 15. -/
def ep_Q2_024_partial_15_1818 : Poly :=
[
  term ((-56589315471102669466415242231485818483327419250070008571 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (7, 1), (8, 1), (15, 3)],
  term ((56589315471102669466415242231485818483327419250070008571 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1818 for generator 15. -/
theorem ep_Q2_024_partial_15_1818_valid :
    mulPoly ep_Q2_024_coefficient_15_1818
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1818 := by
  native_decide

/-- Coefficient term 1819 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1819 : Poly :=
[
  term ((2250440444607867 : Rat) / 1162780221153193) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 1819 for generator 15. -/
def ep_Q2_024_partial_15_1819 : Poly :=
[
  term ((4500880889215734 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-2250440444607867 : Rat) / 1162780221153193) [(7, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1819 for generator 15. -/
theorem ep_Q2_024_partial_15_1819_valid :
    mulPoly ep_Q2_024_coefficient_15_1819
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1819 := by
  native_decide

/-- Coefficient term 1820 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1820 : Poly :=
[
  term ((206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1)]
]

/-- Partial product 1820 for generator 15. -/
def ep_Q2_024_partial_15_1820 : Poly :=
[
  term ((413117156236923518179612288526746844972 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 2), (9, 1)],
  term ((-206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1820 for generator 15. -/
theorem ep_Q2_024_partial_15_1820_valid :
    mulPoly ep_Q2_024_coefficient_15_1820
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1820 := by
  native_decide

/-- Coefficient term 1821 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1821 : Poly :=
[
  term ((12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (12, 1), (13, 1)]
]

/-- Partial product 1821 for generator 15. -/
def ep_Q2_024_partial_15_1821 : Poly :=
[
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1821 for generator 15. -/
theorem ep_Q2_024_partial_15_1821_valid :
    mulPoly ep_Q2_024_coefficient_15_1821
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1821 := by
  native_decide

/-- Coefficient term 1822 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1822 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 2), (12, 1), (15, 1)]
]

/-- Partial product 1822 for generator 15. -/
def ep_Q2_024_partial_15_1822 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (7, 1), (8, 2), (12, 1), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1822 for generator 15. -/
theorem ep_Q2_024_partial_15_1822_valid :
    mulPoly ep_Q2_024_coefficient_15_1822
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1822 := by
  native_decide

/-- Coefficient term 1823 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1823 : Poly :=
[
  term ((212739288644735 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1823 for generator 15. -/
def ep_Q2_024_partial_15_1823 : Poly :=
[
  term ((425478577289470 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-212739288644735 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1823 for generator 15. -/
theorem ep_Q2_024_partial_15_1823_valid :
    mulPoly ep_Q2_024_coefficient_15_1823
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1823 := by
  native_decide

/-- Coefficient term 1824 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1824 : Poly :=
[
  term ((-84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (13, 1)]
]

/-- Partial product 1824 for generator 15. -/
def ep_Q2_024_partial_15_1824 : Poly :=
[
  term ((-169148534608068318614766785971719853796 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term ((84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1824 for generator 15. -/
theorem ep_Q2_024_partial_15_1824_valid :
    mulPoly ep_Q2_024_coefficient_15_1824
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1824 := by
  native_decide

/-- Coefficient term 1825 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1825 : Poly :=
[
  term ((-12391057674363913550311122299423538521421896682288632882 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 2), (15, 1)]
]

/-- Partial product 1825 for generator 15. -/
def ep_Q2_024_partial_15_1825 : Poly :=
[
  term ((-24782115348727827100622244598847077042843793364577265764 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term ((12391057674363913550311122299423538521421896682288632882 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1825 for generator 15. -/
theorem ep_Q2_024_partial_15_1825_valid :
    mulPoly ep_Q2_024_coefficient_15_1825
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1825 := by
  native_decide

/-- Coefficient term 1826 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1826 : Poly :=
[
  term ((3501168887590402 : Rat) / 1162780221153193) [(7, 1), (8, 2), (15, 1), (16, 1)]
]

/-- Partial product 1826 for generator 15. -/
def ep_Q2_024_partial_15_1826 : Poly :=
[
  term ((7002337775180804 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-3501168887590402 : Rat) / 1162780221153193) [(7, 1), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1826 for generator 15. -/
theorem ep_Q2_024_partial_15_1826_valid :
    mulPoly ep_Q2_024_coefficient_15_1826
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1826 := by
  native_decide

/-- Coefficient term 1827 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1827 : Poly :=
[
  term ((1067516070708591405615275167278824300353 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 1827 for generator 15. -/
def ep_Q2_024_partial_15_1827 : Poly :=
[
  term ((2135032141417182811230550334557648600706 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((-1067516070708591405615275167278824300353 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1827 for generator 15. -/
theorem ep_Q2_024_partial_15_1827_valid :
    mulPoly ep_Q2_024_coefficient_15_1827
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1827 := by
  native_decide

/-- Coefficient term 1828 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1828 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1828 for generator 15. -/
def ep_Q2_024_partial_15_1828 : Poly :=
[
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1828 for generator 15. -/
theorem ep_Q2_024_partial_15_1828_valid :
    mulPoly ep_Q2_024_coefficient_15_1828
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1828 := by
  native_decide

/-- Coefficient term 1829 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1829 : Poly :=
[
  term ((798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1829 for generator 15. -/
def ep_Q2_024_partial_15_1829 : Poly :=
[
  term ((1597164824819487444736734770224430861536 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1829 for generator 15. -/
theorem ep_Q2_024_partial_15_1829_valid :
    mulPoly ep_Q2_024_coefficient_15_1829
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1829 := by
  native_decide

/-- Coefficient term 1830 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1830 : Poly :=
[
  term ((714319551385521268540140568994111106046 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1830 for generator 15. -/
def ep_Q2_024_partial_15_1830 : Poly :=
[
  term ((1428639102771042537080281137988222212092 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-714319551385521268540140568994111106046 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1830 for generator 15. -/
theorem ep_Q2_024_partial_15_1830_valid :
    mulPoly ep_Q2_024_coefficient_15_1830
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1830 := by
  native_decide

/-- Coefficient term 1831 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1831 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1831 for generator 15. -/
def ep_Q2_024_partial_15_1831 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1831 for generator 15. -/
theorem ep_Q2_024_partial_15_1831_valid :
    mulPoly ep_Q2_024_coefficient_15_1831
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1831 := by
  native_decide

/-- Coefficient term 1832 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1832 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1832 for generator 15. -/
def ep_Q2_024_partial_15_1832 : Poly :=
[
  term ((3163264603646592 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1832 for generator 15. -/
theorem ep_Q2_024_partial_15_1832_valid :
    mulPoly ep_Q2_024_coefficient_15_1832
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1832 := by
  native_decide

/-- Coefficient term 1833 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1833 : Poly :=
[
  term ((-4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 1833 for generator 15. -/
def ep_Q2_024_partial_15_1833 : Poly :=
[
  term ((-4344074584876535282375746373930099123380749438247228923 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1833 for generator 15. -/
theorem ep_Q2_024_partial_15_1833_valid :
    mulPoly ep_Q2_024_coefficient_15_1833
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1833 := by
  native_decide

/-- Coefficient term 1834 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1834 : Poly :=
[
  term ((3065637341133238 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1834 for generator 15. -/
def ep_Q2_024_partial_15_1834 : Poly :=
[
  term ((6131274682266476 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3065637341133238 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1834 for generator 15. -/
theorem ep_Q2_024_partial_15_1834_valid :
    mulPoly ep_Q2_024_coefficient_15_1834
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1834 := by
  native_decide

/-- Coefficient term 1835 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1835 : Poly :=
[
  term ((-28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 2)]
]

/-- Partial product 1835 for generator 15. -/
def ep_Q2_024_partial_15_1835 : Poly :=
[
  term ((-56960453299830809226902458886729156568 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (9, 1), (12, 2)],
  term ((28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1835 for generator 15. -/
theorem ep_Q2_024_partial_15_1835_valid :
    mulPoly ep_Q2_024_coefficient_15_1835
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1835 := by
  native_decide

/-- Coefficient term 1836 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1836 : Poly :=
[
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1836 for generator 15. -/
def ep_Q2_024_partial_15_1836 : Poly :=
[
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1836 for generator 15. -/
theorem ep_Q2_024_partial_15_1836_valid :
    mulPoly ep_Q2_024_coefficient_15_1836
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1836 := by
  native_decide

/-- Coefficient term 1837 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1837 : Poly :=
[
  term ((-1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1837 for generator 15. -/
def ep_Q2_024_partial_15_1837 : Poly :=
[
  term ((-3374627121101630 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1837 for generator 15. -/
theorem ep_Q2_024_partial_15_1837_valid :
    mulPoly ep_Q2_024_coefficient_15_1837
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1837 := by
  native_decide

/-- Coefficient term 1838 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1838 : Poly :=
[
  term ((-562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 1838 for generator 15. -/
def ep_Q2_024_partial_15_1838 : Poly :=
[
  term ((-1125550783544139198314360250867824235848 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (9, 1), (13, 2), (14, 1)],
  term ((562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1838 for generator 15. -/
theorem ep_Q2_024_partial_15_1838_valid :
    mulPoly ep_Q2_024_coefficient_15_1838
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1838 := by
  native_decide

/-- Coefficient term 1839 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1839 : Poly :=
[
  term ((-609267233075267976885611040213771039949 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 1839 for generator 15. -/
def ep_Q2_024_partial_15_1839 : Poly :=
[
  term ((-1218534466150535953771222080427542079898 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((609267233075267976885611040213771039949 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1839 for generator 15. -/
theorem ep_Q2_024_partial_15_1839_valid :
    mulPoly ep_Q2_024_coefficient_15_1839
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1839 := by
  native_decide

/-- Coefficient term 1840 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1840 : Poly :=
[
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 1840 for generator 15. -/
def ep_Q2_024_partial_15_1840 : Poly :=
[
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1840 for generator 15. -/
theorem ep_Q2_024_partial_15_1840_valid :
    mulPoly ep_Q2_024_coefficient_15_1840
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1840 := by
  native_decide

/-- Coefficient term 1841 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1841 : Poly :=
[
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1841 for generator 15. -/
def ep_Q2_024_partial_15_1841 : Poly :=
[
  term ((-4227179677649766 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1841 for generator 15. -/
theorem ep_Q2_024_partial_15_1841_valid :
    mulPoly ep_Q2_024_coefficient_15_1841
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1841 := by
  native_decide

/-- Coefficient term 1842 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1842 : Poly :=
[
  term ((-703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (14, 2)]
]

/-- Partial product 1842 for generator 15. -/
def ep_Q2_024_partial_15_1842 : Poly :=
[
  term ((-1406005400822790479278021862241020525186 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term ((703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1842 for generator 15. -/
theorem ep_Q2_024_partial_15_1842_valid :
    mulPoly ep_Q2_024_coefficient_15_1842
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1842 := by
  native_decide

/-- Coefficient term 1843 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1843 : Poly :=
[
  term ((220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (12, 1), (15, 1)]
]

/-- Partial product 1843 for generator 15. -/
def ep_Q2_024_partial_15_1843 : Poly :=
[
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (9, 2), (12, 1), (15, 1)],
  term ((-220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1843 for generator 15. -/
theorem ep_Q2_024_partial_15_1843_valid :
    mulPoly ep_Q2_024_coefficient_15_1843
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1843 := by
  native_decide

/-- Coefficient term 1844 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1844 : Poly :=
[
  term ((7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1), (14, 1)]
]

/-- Partial product 1844 for generator 15. -/
def ep_Q2_024_partial_15_1844 : Poly :=
[
  term ((15162269307229276594898497776806834848 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (9, 2), (13, 1), (14, 1)],
  term ((-7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1844 for generator 15. -/
theorem ep_Q2_024_partial_15_1844_valid :
    mulPoly ep_Q2_024_coefficient_15_1844
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1844 := by
  native_decide

/-- Coefficient term 1845 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1845 : Poly :=
[
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (14, 1), (15, 1)]
]

/-- Partial product 1845 for generator 15. -/
def ep_Q2_024_partial_15_1845 : Poly :=
[
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (9, 2), (14, 1), (15, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1845 for generator 15. -/
theorem ep_Q2_024_partial_15_1845_valid :
    mulPoly ep_Q2_024_coefficient_15_1845
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1845 := by
  native_decide

/-- Coefficient term 1846 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1846 : Poly :=
[
  term ((1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1846 for generator 15. -/
def ep_Q2_024_partial_15_1846 : Poly :=
[
  term ((3737871123862340 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1846 for generator 15. -/
theorem ep_Q2_024_partial_15_1846_valid :
    mulPoly ep_Q2_024_coefficient_15_1846
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1846 := by
  native_decide

/-- Coefficient term 1847 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1847 : Poly :=
[
  term ((31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3), (14, 1)]
]

/-- Partial product 1847 for generator 15. -/
def ep_Q2_024_partial_15_1847 : Poly :=
[
  term ((63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (9, 3), (14, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1847 for generator 15. -/
theorem ep_Q2_024_partial_15_1847_valid :
    mulPoly ep_Q2_024_coefficient_15_1847
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1847 := by
  native_decide

/-- Coefficient term 1848 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1848 : Poly :=
[
  term ((518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 1848 for generator 15. -/
def ep_Q2_024_partial_15_1848 : Poly :=
[
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1848 for generator 15. -/
theorem ep_Q2_024_partial_15_1848_valid :
    mulPoly ep_Q2_024_coefficient_15_1848
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1848 := by
  native_decide

/-- Coefficient term 1849 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1849 : Poly :=
[
  term ((-152459042060193964129367162216960464148 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1849 for generator 15. -/
def ep_Q2_024_partial_15_1849 : Poly :=
[
  term ((-304918084120387928258734324433920928296 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((152459042060193964129367162216960464148 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1849 for generator 15. -/
theorem ep_Q2_024_partial_15_1849_valid :
    mulPoly ep_Q2_024_coefficient_15_1849
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1849 := by
  native_decide

/-- Coefficient term 1850 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1850 : Poly :=
[
  term ((-719513490735594475784021469967236428918 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1850 for generator 15. -/
def ep_Q2_024_partial_15_1850 : Poly :=
[
  term ((-1439026981471188951568042939934472857836 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((719513490735594475784021469967236428918 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1850 for generator 15. -/
theorem ep_Q2_024_partial_15_1850_valid :
    mulPoly ep_Q2_024_coefficient_15_1850
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1850 := by
  native_decide

/-- Coefficient term 1851 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1851 : Poly :=
[
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1851 for generator 15. -/
def ep_Q2_024_partial_15_1851 : Poly :=
[
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1851 for generator 15. -/
theorem ep_Q2_024_partial_15_1851_valid :
    mulPoly ep_Q2_024_coefficient_15_1851
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1851 := by
  native_decide

/-- Coefficient term 1852 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1852 : Poly :=
[
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1852 for generator 15. -/
def ep_Q2_024_partial_15_1852 : Poly :=
[
  term ((-3163264603646592 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1852 for generator 15. -/
theorem ep_Q2_024_partial_15_1852_valid :
    mulPoly ep_Q2_024_coefficient_15_1852
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1852 := by
  native_decide

/-- Coefficient term 1853 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1853 : Poly :=
[
  term ((-19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 2)]
]

/-- Partial product 1853 for generator 15. -/
def ep_Q2_024_partial_15_1853 : Poly :=
[
  term ((-38717834506980728124094132443344896016 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1853 for generator 15. -/
theorem ep_Q2_024_partial_15_1853_valid :
    mulPoly ep_Q2_024_coefficient_15_1853
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1853 := by
  native_decide

/-- Coefficient term 1854 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1854 : Poly :=
[
  term ((-11663645906312816065580666917861834861503355746549728405 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1854 for generator 15. -/
def ep_Q2_024_partial_15_1854 : Poly :=
[
  term ((-11663645906312816065580666917861834861503355746549728405 : Rat) / 278999685639605945551432029250879769240203926974238414) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((11663645906312816065580666917861834861503355746549728405 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1854 for generator 15. -/
theorem ep_Q2_024_partial_15_1854_valid :
    mulPoly ep_Q2_024_coefficient_15_1854
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1854 := by
  native_decide

/-- Coefficient term 1855 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1855 : Poly :=
[
  term ((-1441282754841349 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1855 for generator 15. -/
def ep_Q2_024_partial_15_1855 : Poly :=
[
  term ((-2882565509682698 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1441282754841349 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1855 for generator 15. -/
theorem ep_Q2_024_partial_15_1855_valid :
    mulPoly ep_Q2_024_coefficient_15_1855
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1855 := by
  native_decide

/-- Coefficient term 1856 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1856 : Poly :=
[
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1856 for generator 15. -/
def ep_Q2_024_partial_15_1856 : Poly :=
[
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1856 for generator 15. -/
theorem ep_Q2_024_partial_15_1856_valid :
    mulPoly ep_Q2_024_coefficient_15_1856
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1856 := by
  native_decide

/-- Coefficient term 1857 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1857 : Poly :=
[
  term ((28007393806979136789216506860043626924 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1857 for generator 15. -/
def ep_Q2_024_partial_15_1857 : Poly :=
[
  term ((56014787613958273578433013720087253848 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-28007393806979136789216506860043626924 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1857 for generator 15. -/
theorem ep_Q2_024_partial_15_1857_valid :
    mulPoly ep_Q2_024_coefficient_15_1857
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1857 := by
  native_decide

/-- Coefficient term 1858 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1858 : Poly :=
[
  term ((-12511423257548967841962741166021800254823382319017396243 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1858 for generator 15. -/
def ep_Q2_024_partial_15_1858 : Poly :=
[
  term ((-25022846515097935683925482332043600509646764638034792486 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((12511423257548967841962741166021800254823382319017396243 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1858 for generator 15. -/
theorem ep_Q2_024_partial_15_1858_valid :
    mulPoly ep_Q2_024_coefficient_15_1858
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1858 := by
  native_decide

/-- Coefficient term 1859 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1859 : Poly :=
[
  term ((-1806541953621024 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1859 for generator 15. -/
def ep_Q2_024_partial_15_1859 : Poly :=
[
  term ((-3613083907242048 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1806541953621024 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1859 for generator 15. -/
theorem ep_Q2_024_partial_15_1859_valid :
    mulPoly ep_Q2_024_coefficient_15_1859
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1859 := by
  native_decide

/-- Coefficient term 1860 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1860 : Poly :=
[
  term ((-3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 1860 for generator 15. -/
def ep_Q2_024_partial_15_1860 : Poly :=
[
  term ((-7546803947896731422944084549187591818464216977964783022 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1860 for generator 15. -/
theorem ep_Q2_024_partial_15_1860_valid :
    mulPoly ep_Q2_024_coefficient_15_1860
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1860 := by
  native_decide

/-- Coefficient term 1861 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1861 : Poly :=
[
  term ((-938674662914812 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1861 for generator 15. -/
def ep_Q2_024_partial_15_1861 : Poly :=
[
  term ((-1877349325829624 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((938674662914812 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1861 for generator 15. -/
theorem ep_Q2_024_partial_15_1861_valid :
    mulPoly ep_Q2_024_coefficient_15_1861
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1861 := by
  native_decide

/-- Coefficient term 1862 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1862 : Poly :=
[
  term ((-63638283562751325517728931761014869651796599654713899539 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1862 for generator 15. -/
def ep_Q2_024_partial_15_1862 : Poly :=
[
  term ((-63638283562751325517728931761014869651796599654713899539 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((63638283562751325517728931761014869651796599654713899539 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1862 for generator 15. -/
theorem ep_Q2_024_partial_15_1862_valid :
    mulPoly ep_Q2_024_coefficient_15_1862
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1862 := by
  native_decide

/-- Coefficient term 1863 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1863 : Poly :=
[
  term ((318373975502121 : Rat) / 2325560442306386) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1863 for generator 15. -/
def ep_Q2_024_partial_15_1863 : Poly :=
[
  term ((318373975502121 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-318373975502121 : Rat) / 2325560442306386) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1863 for generator 15. -/
theorem ep_Q2_024_partial_15_1863_valid :
    mulPoly ep_Q2_024_coefficient_15_1863
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1863 := by
  native_decide

/-- Coefficient term 1864 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1864 : Poly :=
[
  term ((3246105213439696173008284602187053635924349240774919079 : Rat) / 47288082311797617890073225296759282922068462199023460) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 1864 for generator 15. -/
def ep_Q2_024_partial_15_1864 : Poly :=
[
  term ((3246105213439696173008284602187053635924349240774919079 : Rat) / 23644041155898808945036612648379641461034231099511730) [(6, 1), (7, 1), (12, 1), (15, 3)],
  term ((-3246105213439696173008284602187053635924349240774919079 : Rat) / 47288082311797617890073225296759282922068462199023460) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1864 for generator 15. -/
theorem ep_Q2_024_partial_15_1864_valid :
    mulPoly ep_Q2_024_coefficient_15_1864
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1864 := by
  native_decide

/-- Coefficient term 1865 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1865 : Poly :=
[
  term ((-4927348611644255 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1865 for generator 15. -/
def ep_Q2_024_partial_15_1865 : Poly :=
[
  term ((-9854697223288510 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((4927348611644255 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1865 for generator 15. -/
theorem ep_Q2_024_partial_15_1865_valid :
    mulPoly ep_Q2_024_coefficient_15_1865
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1865 := by
  native_decide

/-- Coefficient term 1866 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1866 : Poly :=
[
  term ((-711333560106881037673088514204255638276 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 1866 for generator 15. -/
def ep_Q2_024_partial_15_1866 : Poly :=
[
  term ((-1422667120213762075346177028408511276552 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (12, 2), (13, 1)],
  term ((711333560106881037673088514204255638276 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1866 for generator 15. -/
theorem ep_Q2_024_partial_15_1866_valid :
    mulPoly ep_Q2_024_coefficient_15_1866
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1866 := by
  native_decide

/-- Coefficient term 1867 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1867 : Poly :=
[
  term ((3306937061962394129118973858657492576 : Rat) / 10167029300020994038700792610419824305) [(7, 1), (12, 2), (13, 1), (14, 1)]
]

/-- Partial product 1867 for generator 15. -/
def ep_Q2_024_partial_15_1867 : Poly :=
[
  term ((6613874123924788258237947717314985152 : Rat) / 10167029300020994038700792610419824305) [(6, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-3306937061962394129118973858657492576 : Rat) / 10167029300020994038700792610419824305) [(7, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1867 for generator 15. -/
theorem ep_Q2_024_partial_15_1867_valid :
    mulPoly ep_Q2_024_coefficient_15_1867
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1867 := by
  native_decide

/-- Coefficient term 1868 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1868 : Poly :=
[
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 2), (13, 1), (15, 2)]
]

/-- Partial product 1868 for generator 15. -/
def ep_Q2_024_partial_15_1868 : Poly :=
[
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (12, 2), (13, 1), (15, 2)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1868 for generator 15. -/
theorem ep_Q2_024_partial_15_1868_valid :
    mulPoly ep_Q2_024_coefficient_15_1868
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1868 := by
  native_decide

/-- Coefficient term 1869 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1869 : Poly :=
[
  term ((-1795367810010881586814745722822848049207909403763869596 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 1869 for generator 15. -/
def ep_Q2_024_partial_15_1869 : Poly :=
[
  term ((-3590735620021763173629491445645696098415818807527739192 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((1795367810010881586814745722822848049207909403763869596 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1869 for generator 15. -/
theorem ep_Q2_024_partial_15_1869_valid :
    mulPoly ep_Q2_024_coefficient_15_1869
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1869 := by
  native_decide

/-- Coefficient term 1870 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1870 : Poly :=
[
  term ((-840319894183600 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1870 for generator 15. -/
def ep_Q2_024_partial_15_1870 : Poly :=
[
  term ((-1680639788367200 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((840319894183600 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1870 for generator 15. -/
theorem ep_Q2_024_partial_15_1870_valid :
    mulPoly ep_Q2_024_coefficient_15_1870
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1870 := by
  native_decide

/-- Coefficient term 1871 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1871 : Poly :=
[
  term ((37691908171747168497035127959111488124492024062896424443 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 1871 for generator 15. -/
def ep_Q2_024_partial_15_1871 : Poly :=
[
  term ((37691908171747168497035127959111488124492024062896424443 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-37691908171747168497035127959111488124492024062896424443 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1871 for generator 15. -/
theorem ep_Q2_024_partial_15_1871_valid :
    mulPoly ep_Q2_024_coefficient_15_1871
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1871 := by
  native_decide

/-- Coefficient term 1872 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1872 : Poly :=
[
  term ((-3019770354102187 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1872 for generator 15. -/
def ep_Q2_024_partial_15_1872 : Poly :=
[
  term ((-6039540708204374 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((3019770354102187 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1872 for generator 15. -/
theorem ep_Q2_024_partial_15_1872_valid :
    mulPoly ep_Q2_024_coefficient_15_1872
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1872 := by
  native_decide

/-- Coefficient term 1873 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1873 : Poly :=
[
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 2), (15, 3)]
]

/-- Partial product 1873 for generator 15. -/
def ep_Q2_024_partial_15_1873 : Poly :=
[
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (12, 2), (15, 3)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1873 for generator 15. -/
theorem ep_Q2_024_partial_15_1873_valid :
    mulPoly ep_Q2_024_coefficient_15_1873
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1873 := by
  native_decide

/-- Coefficient term 1874 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1874 : Poly :=
[
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 3), (16, 1)]
]

/-- Partial product 1874 for generator 15. -/
def ep_Q2_024_partial_15_1874 : Poly :=
[
  term ((3163264603646592 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1874 for generator 15. -/
theorem ep_Q2_024_partial_15_1874_valid :
    mulPoly ep_Q2_024_coefficient_15_1874
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1874 := by
  native_decide

/-- Coefficient term 1875 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1875 : Poly :=
[
  term ((27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (12, 3), (13, 1)]
]

/-- Partial product 1875 for generator 15. -/
def ep_Q2_024_partial_15_1875 : Poly :=
[
  term ((54892182131588140920103398983081165984 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (12, 3), (13, 1)],
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1875 for generator 15. -/
theorem ep_Q2_024_partial_15_1875_valid :
    mulPoly ep_Q2_024_coefficient_15_1875
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1875 := by
  native_decide

/-- Coefficient term 1876 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1876 : Poly :=
[
  term ((-3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 3), (15, 1)]
]

/-- Partial product 1876 for generator 15. -/
def ep_Q2_024_partial_15_1876 : Poly :=
[
  term ((-7202773032168351371358289925377205570800470476498987952 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (7, 1), (12, 3), (15, 1)],
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1876 for generator 15. -/
theorem ep_Q2_024_partial_15_1876_valid :
    mulPoly ep_Q2_024_coefficient_15_1876
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1876 := by
  native_decide

/-- Coefficient term 1877 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1877 : Poly :=
[
  term ((1758553647569664 : Rat) / 1162780221153193) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

/-- Partial product 1877 for generator 15. -/
def ep_Q2_024_partial_15_1877 : Poly :=
[
  term ((3517107295139328 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-1758553647569664 : Rat) / 1162780221153193) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1877 for generator 15. -/
theorem ep_Q2_024_partial_15_1877_valid :
    mulPoly ep_Q2_024_coefficient_15_1877
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1877 := by
  native_decide

/-- Coefficient term 1878 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1878 : Poly :=
[
  term ((222670977423941781438890223554523312041 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 1878 for generator 15. -/
def ep_Q2_024_partial_15_1878 : Poly :=
[
  term ((445341954847883562877780447109046624082 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-222670977423941781438890223554523312041 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1878 for generator 15. -/
theorem ep_Q2_024_partial_15_1878_valid :
    mulPoly ep_Q2_024_coefficient_15_1878
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1878 := by
  native_decide

/-- Coefficient term 1879 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1879 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1879 for generator 15. -/
def ep_Q2_024_partial_15_1879 : Poly :=
[
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1879 for generator 15. -/
theorem ep_Q2_024_partial_15_1879_valid :
    mulPoly ep_Q2_024_coefficient_15_1879
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1879 := by
  native_decide

/-- Coefficient term 1880 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1880 : Poly :=
[
  term ((2113589838824883 : Rat) / 1162780221153193) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1880 for generator 15. -/
def ep_Q2_024_partial_15_1880 : Poly :=
[
  term ((4227179677649766 : Rat) / 1162780221153193) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1880 for generator 15. -/
theorem ep_Q2_024_partial_15_1880_valid :
    mulPoly ep_Q2_024_coefficient_15_1880
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1880 := by
  native_decide

/-- Coefficient term 1881 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1881 : Poly :=
[
  term ((724312409821161271992046999236946329041 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 1881 for generator 15. -/
def ep_Q2_024_partial_15_1881 : Poly :=
[
  term ((1448624819642322543984093998473892658082 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((-724312409821161271992046999236946329041 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1881 for generator 15. -/
theorem ep_Q2_024_partial_15_1881_valid :
    mulPoly ep_Q2_024_coefficient_15_1881
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1881 := by
  native_decide

/-- Coefficient term 1882 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1882 : Poly :=
[
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1882 for generator 15. -/
def ep_Q2_024_partial_15_1882 : Poly :=
[
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1882 for generator 15. -/
theorem ep_Q2_024_partial_15_1882_valid :
    mulPoly ep_Q2_024_coefficient_15_1882
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1882 := by
  native_decide

/-- Coefficient term 1883 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1883 : Poly :=
[
  term ((-181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1883 for generator 15. -/
def ep_Q2_024_partial_15_1883 : Poly :=
[
  term ((-363244002760710 : Rat) / 1162780221153193) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1883 for generator 15. -/
theorem ep_Q2_024_partial_15_1883_valid :
    mulPoly ep_Q2_024_coefficient_15_1883
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1883 := by
  native_decide

/-- Coefficient term 1884 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1884 : Poly :=
[
  term ((-24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (14, 1)]
]

/-- Partial product 1884 for generator 15. -/
def ep_Q2_024_partial_15_1884 : Poly :=
[
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (13, 3), (14, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1884 for generator 15. -/
theorem ep_Q2_024_partial_15_1884_valid :
    mulPoly ep_Q2_024_coefficient_15_1884
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1884 := by
  native_decide

/-- Coefficient term 1885 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1885 : Poly :=
[
  term ((30514960301125684424531135215542184253408249597503293719 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1885 for generator 15. -/
def ep_Q2_024_partial_15_1885 : Poly :=
[
  term ((61029920602251368849062270431084368506816499195006587438 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-30514960301125684424531135215542184253408249597503293719 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1885 for generator 15. -/
theorem ep_Q2_024_partial_15_1885_valid :
    mulPoly ep_Q2_024_coefficient_15_1885
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1885 := by
  native_decide

/-- Coefficient term 1886 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1886 : Poly :=
[
  term ((6359310750251020 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1886 for generator 15. -/
def ep_Q2_024_partial_15_1886 : Poly :=
[
  term ((12718621500502040 : Rat) / 1162780221153193) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6359310750251020 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1886 for generator 15. -/
theorem ep_Q2_024_partial_15_1886_valid :
    mulPoly ep_Q2_024_coefficient_15_1886
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1886 := by
  native_decide

/-- Coefficient term 1887 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1887 : Poly :=
[
  term ((20105715729045145835299038207446350531698215964122869129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 1887 for generator 15. -/
def ep_Q2_024_partial_15_1887 : Poly :=
[
  term ((20105715729045145835299038207446350531698215964122869129 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((-20105715729045145835299038207446350531698215964122869129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1887 for generator 15. -/
theorem ep_Q2_024_partial_15_1887_valid :
    mulPoly ep_Q2_024_coefficient_15_1887
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1887 := by
  native_decide

/-- Coefficient term 1888 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1888 : Poly :=
[
  term ((3239154629516277 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1888 for generator 15. -/
def ep_Q2_024_partial_15_1888 : Poly :=
[
  term ((6478309259032554 : Rat) / 1162780221153193) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3239154629516277 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1888 for generator 15. -/
theorem ep_Q2_024_partial_15_1888_valid :
    mulPoly ep_Q2_024_coefficient_15_1888
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1888 := by
  native_decide

/-- Coefficient term 1889 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1889 : Poly :=
[
  term ((-4158889381220953185181063148326955255347 : Rat) / 3599128372207431889700080584088617803970) [(8, 1)]
]

/-- Partial product 1889 for generator 15. -/
def ep_Q2_024_partial_15_1889 : Poly :=
[
  term ((-4158889381220953185181063148326955255347 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1)],
  term ((4158889381220953185181063148326955255347 : Rat) / 3599128372207431889700080584088617803970) [(8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1889 for generator 15. -/
theorem ep_Q2_024_partial_15_1889_valid :
    mulPoly ep_Q2_024_coefficient_15_1889
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1889 := by
  native_decide

/-- Coefficient term 1890 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1890 : Poly :=
[
  term ((108142889876027042198777022484642450168 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 1890 for generator 15. -/
def ep_Q2_024_partial_15_1890 : Poly :=
[
  term ((216285779752054084397554044969284900336 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-108142889876027042198777022484642450168 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1890 for generator 15. -/
theorem ep_Q2_024_partial_15_1890_valid :
    mulPoly ep_Q2_024_coefficient_15_1890
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1890 := by
  native_decide

/-- Coefficient term 1891 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1891 : Poly :=
[
  term ((-709142227526871057093496069349195019754 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 1891 for generator 15. -/
def ep_Q2_024_partial_15_1891 : Poly :=
[
  term ((-1418284455053742114186992138698390039508 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((709142227526871057093496069349195019754 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1891 for generator 15. -/
theorem ep_Q2_024_partial_15_1891_valid :
    mulPoly ep_Q2_024_coefficient_15_1891
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1891 := by
  native_decide

/-- Coefficient term 1892 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1892 : Poly :=
[
  term ((676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1892 for generator 15. -/
def ep_Q2_024_partial_15_1892 : Poly :=
[
  term ((1352426172101182737185794737983768912 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1892 for generator 15. -/
theorem ep_Q2_024_partial_15_1892_valid :
    mulPoly ep_Q2_024_coefficient_15_1892
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1892 := by
  native_decide

/-- Coefficient term 1893 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1893 : Poly :=
[
  term ((-2139287844784255361193399289745036112758 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1893 for generator 15. -/
def ep_Q2_024_partial_15_1893 : Poly :=
[
  term ((-4278575689568510722386798579490072225516 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((2139287844784255361193399289745036112758 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1893 for generator 15. -/
theorem ep_Q2_024_partial_15_1893_valid :
    mulPoly ep_Q2_024_coefficient_15_1893
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1893 := by
  native_decide

/-- Coefficient term 1894 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1894 : Poly :=
[
  term ((-263833840722178653477426982259796341636773283204299114381 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1894 for generator 15. -/
def ep_Q2_024_partial_15_1894 : Poly :=
[
  term ((-263833840722178653477426982259796341636773283204299114381 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((263833840722178653477426982259796341636773283204299114381 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1894 for generator 15. -/
theorem ep_Q2_024_partial_15_1894_valid :
    mulPoly ep_Q2_024_coefficient_15_1894
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1894 := by
  native_decide

/-- Coefficient term 1895 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1895 : Poly :=
[
  term ((12858380345378511 : Rat) / 2325560442306386) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1895 for generator 15. -/
def ep_Q2_024_partial_15_1895 : Poly :=
[
  term ((12858380345378511 : Rat) / 1162780221153193) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12858380345378511 : Rat) / 2325560442306386) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1895 for generator 15. -/
theorem ep_Q2_024_partial_15_1895_valid :
    mulPoly ep_Q2_024_coefficient_15_1895
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1895 := by
  native_decide

/-- Coefficient term 1896 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1896 : Poly :=
[
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 2), (13, 1)]
]

/-- Partial product 1896 for generator 15. -/
def ep_Q2_024_partial_15_1896 : Poly :=
[
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1896 for generator 15. -/
theorem ep_Q2_024_partial_15_1896_valid :
    mulPoly ep_Q2_024_coefficient_15_1896
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1896 := by
  native_decide

/-- Coefficient term 1897 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1897 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1897 for generator 15. -/
def ep_Q2_024_partial_15_1897 : Poly :=
[
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1897 for generator 15. -/
theorem ep_Q2_024_partial_15_1897_valid :
    mulPoly ep_Q2_024_coefficient_15_1897
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1897 := by
  native_decide

/-- Coefficient term 1898 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1898 : Poly :=
[
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1898 for generator 15. -/
def ep_Q2_024_partial_15_1898 : Poly :=
[
  term ((850957154578940 : Rat) / 1162780221153193) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1898 for generator 15. -/
theorem ep_Q2_024_partial_15_1898_valid :
    mulPoly ep_Q2_024_coefficient_15_1898
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1898 := by
  native_decide

/-- Coefficient term 1899 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1899 : Poly :=
[
  term ((-3732085232533006446812866262704589087321 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 1899 for generator 15. -/
def ep_Q2_024_partial_15_1899 : Poly :=
[
  term ((-7464170465066012893625732525409178174642 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((3732085232533006446812866262704589087321 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1899 for generator 15. -/
theorem ep_Q2_024_partial_15_1899_valid :
    mulPoly ep_Q2_024_coefficient_15_1899
        ep_Q2_024_generator_15_1800_1899 =
      ep_Q2_024_partial_15_1899 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_1800_1899 : List Poly :=
[
  ep_Q2_024_partial_15_1800,
  ep_Q2_024_partial_15_1801,
  ep_Q2_024_partial_15_1802,
  ep_Q2_024_partial_15_1803,
  ep_Q2_024_partial_15_1804,
  ep_Q2_024_partial_15_1805,
  ep_Q2_024_partial_15_1806,
  ep_Q2_024_partial_15_1807,
  ep_Q2_024_partial_15_1808,
  ep_Q2_024_partial_15_1809,
  ep_Q2_024_partial_15_1810,
  ep_Q2_024_partial_15_1811,
  ep_Q2_024_partial_15_1812,
  ep_Q2_024_partial_15_1813,
  ep_Q2_024_partial_15_1814,
  ep_Q2_024_partial_15_1815,
  ep_Q2_024_partial_15_1816,
  ep_Q2_024_partial_15_1817,
  ep_Q2_024_partial_15_1818,
  ep_Q2_024_partial_15_1819,
  ep_Q2_024_partial_15_1820,
  ep_Q2_024_partial_15_1821,
  ep_Q2_024_partial_15_1822,
  ep_Q2_024_partial_15_1823,
  ep_Q2_024_partial_15_1824,
  ep_Q2_024_partial_15_1825,
  ep_Q2_024_partial_15_1826,
  ep_Q2_024_partial_15_1827,
  ep_Q2_024_partial_15_1828,
  ep_Q2_024_partial_15_1829,
  ep_Q2_024_partial_15_1830,
  ep_Q2_024_partial_15_1831,
  ep_Q2_024_partial_15_1832,
  ep_Q2_024_partial_15_1833,
  ep_Q2_024_partial_15_1834,
  ep_Q2_024_partial_15_1835,
  ep_Q2_024_partial_15_1836,
  ep_Q2_024_partial_15_1837,
  ep_Q2_024_partial_15_1838,
  ep_Q2_024_partial_15_1839,
  ep_Q2_024_partial_15_1840,
  ep_Q2_024_partial_15_1841,
  ep_Q2_024_partial_15_1842,
  ep_Q2_024_partial_15_1843,
  ep_Q2_024_partial_15_1844,
  ep_Q2_024_partial_15_1845,
  ep_Q2_024_partial_15_1846,
  ep_Q2_024_partial_15_1847,
  ep_Q2_024_partial_15_1848,
  ep_Q2_024_partial_15_1849,
  ep_Q2_024_partial_15_1850,
  ep_Q2_024_partial_15_1851,
  ep_Q2_024_partial_15_1852,
  ep_Q2_024_partial_15_1853,
  ep_Q2_024_partial_15_1854,
  ep_Q2_024_partial_15_1855,
  ep_Q2_024_partial_15_1856,
  ep_Q2_024_partial_15_1857,
  ep_Q2_024_partial_15_1858,
  ep_Q2_024_partial_15_1859,
  ep_Q2_024_partial_15_1860,
  ep_Q2_024_partial_15_1861,
  ep_Q2_024_partial_15_1862,
  ep_Q2_024_partial_15_1863,
  ep_Q2_024_partial_15_1864,
  ep_Q2_024_partial_15_1865,
  ep_Q2_024_partial_15_1866,
  ep_Q2_024_partial_15_1867,
  ep_Q2_024_partial_15_1868,
  ep_Q2_024_partial_15_1869,
  ep_Q2_024_partial_15_1870,
  ep_Q2_024_partial_15_1871,
  ep_Q2_024_partial_15_1872,
  ep_Q2_024_partial_15_1873,
  ep_Q2_024_partial_15_1874,
  ep_Q2_024_partial_15_1875,
  ep_Q2_024_partial_15_1876,
  ep_Q2_024_partial_15_1877,
  ep_Q2_024_partial_15_1878,
  ep_Q2_024_partial_15_1879,
  ep_Q2_024_partial_15_1880,
  ep_Q2_024_partial_15_1881,
  ep_Q2_024_partial_15_1882,
  ep_Q2_024_partial_15_1883,
  ep_Q2_024_partial_15_1884,
  ep_Q2_024_partial_15_1885,
  ep_Q2_024_partial_15_1886,
  ep_Q2_024_partial_15_1887,
  ep_Q2_024_partial_15_1888,
  ep_Q2_024_partial_15_1889,
  ep_Q2_024_partial_15_1890,
  ep_Q2_024_partial_15_1891,
  ep_Q2_024_partial_15_1892,
  ep_Q2_024_partial_15_1893,
  ep_Q2_024_partial_15_1894,
  ep_Q2_024_partial_15_1895,
  ep_Q2_024_partial_15_1896,
  ep_Q2_024_partial_15_1897,
  ep_Q2_024_partial_15_1898,
  ep_Q2_024_partial_15_1899
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_1800_1899 : Poly :=
[
  term ((-3446548503862190 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 3)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-250151438125795050112983799625032105352 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (8, 1), (12, 2), (13, 1)],
  term ((13548174911558370637317327305327751926668457266779295327 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-5211789333688110 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-804632989482060847146692538461841540028 : Rat) / 359912837220743188970008058408861780397) [(6, 1), (7, 1), (8, 1), (13, 1)],
  term ((3391422002334604845405733015351170173104 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 1), (13, 1), (14, 2)],
  term ((10607217460974230513901064790439933456878799151749883949 : Rat) / 278999685639605945551432029250879769240203926974238414) [(6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((1236716477553018 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((-21183213772266252046596683445903030200 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((14440752691727531454346102886312194137018249720713511773 : Rat) / 278999685639605945551432029250879769240203926974238414) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((5348763306670570 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((41384524895814920612237797406368188987903248213064809087 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-1235944130217429 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-56589315471102669466415242231485818483327419250070008571 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (7, 1), (8, 1), (15, 3)],
  term ((4500880889215734 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 1), (15, 3), (16, 1)],
  term ((413117156236923518179612288526746844972 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 2), (9, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 2), (12, 1), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (7, 1), (8, 2), (12, 1), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-169148534608068318614766785971719853796 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (8, 2), (13, 1)],
  term ((-24782115348727827100622244598847077042843793364577265764 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (8, 2), (15, 1)],
  term ((7002337775180804 : Rat) / 1162780221153193) [(6, 1), (7, 1), (8, 2), (15, 1), (16, 1)],
  term ((2135032141417182811230550334557648600706 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (7, 1), (9, 1), (12, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1597164824819487444736734770224430861536 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((1428639102771042537080281137988222212092 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4344074584876535282375746373930099123380749438247228923 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((6131274682266476 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-56960453299830809226902458886729156568 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (9, 1), (12, 2)],
  term ((-51824669101602076868988473170378041883354520582692522331 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3374627121101630 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1125550783544139198314360250867824235848 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (9, 1), (13, 2), (14, 1)],
  term ((-1218534466150535953771222080427542079898 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (9, 1), (14, 1)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-4227179677649766 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1406005400822790479278021862241020525186 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (9, 1), (14, 2)],
  term ((441787725305289624319136007521902947392 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (9, 2), (12, 1), (15, 1)],
  term ((15162269307229276594898497776806834848 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (9, 2), (13, 1), (14, 1)],
  term ((-6117088134986307917740122211961773302290741365461673651 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (9, 2), (14, 1), (15, 1)],
  term ((3737871123862340 : Rat) / 1162780221153193) [(6, 1), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((63112532186469946331305143931700421056 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (9, 3), (14, 1)],
  term ((1037086349767103080293030173625953797568 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-304918084120387928258734324433920928296 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((-1439026981471188951568042939934472857836 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3163264603646592 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-38717834506980728124094132443344896016 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-11663645906312816065580666917861834861503355746549728405 : Rat) / 278999685639605945551432029250879769240203926974238414) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2882565509682698 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((56014787613958273578433013720087253848 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-25022846515097935683925482332043600509646764638034792486 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3613083907242048 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7546803947896731422944084549187591818464216977964783022 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1877349325829624 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-63638283562751325517728931761014869651796599654713899539 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((318373975502121 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((3246105213439696173008284602187053635924349240774919079 : Rat) / 23644041155898808945036612648379641461034231099511730) [(6, 1), (7, 1), (12, 1), (15, 3)],
  term ((-9854697223288510 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1422667120213762075346177028408511276552 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (12, 2), (13, 1)],
  term ((6613874123924788258237947717314985152 : Rat) / 10167029300020994038700792610419824305) [(6, 1), (7, 1), (12, 2), (13, 1), (14, 1)],
  term ((66547862040521339861322380022048721344 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (12, 2), (13, 1), (15, 2)],
  term ((-3590735620021763173629491445645696098415818807527739192 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1680639788367200 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((37691908171747168497035127959111488124492024062896424443 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-6039540708204374 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-397491232950237887996184205565539271127191104441069376 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (7, 1), (12, 2), (15, 3)],
  term ((3163264603646592 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 2), (15, 3), (16, 1)],
  term ((54892182131588140920103398983081165984 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (7, 1), (12, 3), (13, 1)],
  term ((-7202773032168351371358289925377205570800470476498987952 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (7, 1), (12, 3), (15, 1)],
  term ((3517107295139328 : Rat) / 1162780221153193) [(6, 1), (7, 1), (12, 3), (15, 1), (16, 1)],
  term ((445341954847883562877780447109046624082 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((4227179677649766 : Rat) / 1162780221153193) [(6, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((1448624819642322543984093998473892658082 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (13, 1), (14, 2)],
  term ((64058845371574692704468717594301588487936003313615869633 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-363244002760710 : Rat) / 1162780221153193) [(6, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-48571238861349145578694374759784602712 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (7, 1), (13, 3), (14, 1)],
  term ((61029920602251368849062270431084368506816499195006587438 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (7, 1), (14, 1), (15, 1)],
  term ((12718621500502040 : Rat) / 1162780221153193) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((20105715729045145835299038207446350531698215964122869129 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (7, 1), (14, 2), (15, 1)],
  term ((6478309259032554 : Rat) / 1162780221153193) [(6, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-4158889381220953185181063148326955255347 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1)],
  term ((216285779752054084397554044969284900336 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-1418284455053742114186992138698390039508 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (8, 1), (9, 1), (11, 1), (12, 1)],
  term ((1352426172101182737185794737983768912 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-4278575689568510722386798579490072225516 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (12, 1), (13, 1)],
  term ((-263833840722178653477426982259796341636773283204299114381 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((12858380345378511 : Rat) / 1162780221153193) [(6, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1)],
  term ((850957154578940 : Rat) / 1162780221153193) [(6, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7464170465066012893625732525409178174642 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (13, 1)],
  term ((1723274251931095 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((125075719062897525056491899812516052676 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (8, 1), (12, 2), (13, 1)],
  term ((-13548174911558370637317327305327751926668457266779295327 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (12, 2), (15, 1)],
  term ((2605894666844055 : Rat) / 1162780221153193) [(7, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((402316494741030423573346269230920770014 : Rat) / 359912837220743188970008058408861780397) [(7, 1), (8, 1), (13, 1)],
  term ((-1695711001167302422702866507675585086552 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((-10607217460974230513901064790439933456878799151749883949 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-618358238776509 : Rat) / 1162780221153193) [(7, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((10591606886133126023298341722951515100 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-14440752691727531454346102886312194137018249720713511773 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-2674381653335285 : Rat) / 1162780221153193) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(7, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-41384524895814920612237797406368188987903248213064809087 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (8, 1), (15, 1)],
  term ((1235944130217429 : Rat) / 2325560442306386) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((56589315471102669466415242231485818483327419250070008571 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 1), (15, 3)],
  term ((-2250440444607867 : Rat) / 1162780221153193) [(7, 1), (8, 1), (15, 3), (16, 1)],
  term ((-206558578118461759089806144263373422486 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (9, 1)],
  term ((-12979170683146789939085894591745652172 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (12, 1), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((-212739288644735 : Rat) / 1162780221153193) [(7, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((84574267304034159307383392985859926898 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (8, 2), (13, 1)],
  term ((12391057674363913550311122299423538521421896682288632882 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (8, 2), (15, 1)],
  term ((-3501168887590402 : Rat) / 1162780221153193) [(7, 1), (8, 2), (15, 1), (16, 1)],
  term ((-1067516070708591405615275167278824300353 : Rat) / 1799564186103715944850040292044308901985) [(7, 1), (9, 1), (12, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-798582412409743722368367385112215430768 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-714319551385521268540140568994111106046 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((4344074584876535282375746373930099123380749438247228923 : Rat) / 464999476066009909252386715418132948733673211623730690) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-3065637341133238 : Rat) / 1162780221153193) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((28480226649915404613451229443364578284 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (12, 2)],
  term ((51824669101602076868988473170378041883354520582692522331 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((1687313560550815 : Rat) / 1162780221153193) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((562775391772069599157180125433912117924 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((609267233075267976885611040213771039949 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 1), (14, 1)],
  term ((-11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((2113589838824883 : Rat) / 1162780221153193) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((703002700411395239639010931120510262593 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (9, 1), (14, 2)],
  term ((-220893862652644812159568003760951473696 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (9, 2), (12, 1), (15, 1)],
  term ((-7581134653614638297449248888403417424 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 2), (13, 1), (14, 1)],
  term ((6117088134986307917740122211961773302290741365461673651 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(7, 1), (9, 2), (14, 1), (15, 1)],
  term ((-1868935561931170 : Rat) / 1162780221153193) [(7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-31556266093234973165652571965850210528 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (9, 3), (14, 1)],
  term ((-518543174883551540146515086812976898784 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (11, 1), (14, 1)],
  term ((152459042060193964129367162216960464148 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1)],
  term ((719513490735594475784021469967236428918 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((19358917253490364062047066221672448008 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((11663645906312816065580666917861834861503355746549728405 : Rat) / 557999371279211891102864058501759538480407853948476828) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((1441282754841349 : Rat) / 1162780221153193) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-28007393806979136789216506860043626924 : Rat) / 119970945740247729656669352802953926799) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((12511423257548967841962741166021800254823382319017396243 : Rat) / 139499842819802972775716014625439884620101963487119207) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((1806541953621024 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3773401973948365711472042274593795909232108488982391511 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((938674662914812 : Rat) / 1162780221153193) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((63638283562751325517728931761014869651796599654713899539 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(7, 1), (12, 1), (15, 1)],
  term ((-318373975502121 : Rat) / 2325560442306386) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3246105213439696173008284602187053635924349240774919079 : Rat) / 47288082311797617890073225296759282922068462199023460) [(7, 1), (12, 1), (15, 3)],
  term ((4927348611644255 : Rat) / 1162780221153193) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((711333560106881037673088514204255638276 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (12, 2), (13, 1)],
  term ((-3306937061962394129118973858657492576 : Rat) / 10167029300020994038700792610419824305) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-33273931020260669930661190011024360672 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (12, 2), (13, 1), (15, 2)],
  term ((1795367810010881586814745722822848049207909403763869596 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((840319894183600 : Rat) / 1162780221153193) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-37691908171747168497035127959111488124492024062896424443 : Rat) / 929998952132019818504773430836265897467346423247461380) [(7, 1), (12, 2), (15, 1)],
  term ((3019770354102187 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((198745616475118943998092102782769635563595552220534688 : Rat) / 46499947606600990925238671541813294873367321162373069) [(7, 1), (12, 2), (15, 3)],
  term ((-1581632301823296 : Rat) / 1162780221153193) [(7, 1), (12, 2), (15, 3), (16, 1)],
  term ((-27446091065794070460051699491540582992 : Rat) / 39990315246749243218889784267651308933) [(7, 1), (12, 3), (13, 1)],
  term ((3601386516084175685679144962688602785400235238249493976 : Rat) / 232499738033004954626193357709066474366836605811865345) [(7, 1), (12, 3), (15, 1)],
  term ((-1758553647569664 : Rat) / 1162780221153193) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-222670977423941781438890223554523312041 : Rat) / 199951576233746216094448921338256544665) [(7, 1), (13, 1), (14, 1)],
  term ((11054165036071785399365776736060685613928533689685750087 : Rat) / 185999790426403963700954686167253179493469284649492276) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2113589838824883 : Rat) / 1162780221153193) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-724312409821161271992046999236946329041 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 1), (14, 2)],
  term ((-64058845371574692704468717594301588487936003313615869633 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((181622001380355 : Rat) / 1162780221153193) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((24285619430674572789347187379892301356 : Rat) / 599854728701238648283346764014769633995) [(7, 1), (13, 3), (14, 1)],
  term ((-30514960301125684424531135215542184253408249597503293719 : Rat) / 697499214099014863878580073127199423100509817435596035) [(7, 1), (14, 1), (15, 1)],
  term ((-6359310750251020 : Rat) / 1162780221153193) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20105715729045145835299038207446350531698215964122869129 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(7, 1), (14, 2), (15, 1)],
  term ((-3239154629516277 : Rat) / 1162780221153193) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((4158889381220953185181063148326955255347 : Rat) / 3599128372207431889700080584088617803970) [(8, 1)],
  term ((-108142889876027042198777022484642450168 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1)],
  term ((709142227526871057093496069349195019754 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((-676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((2139287844784255361193399289745036112758 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((263833840722178653477426982259796341636773283204299114381 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-12858380345378511 : Rat) / 2325560442306386) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3732085232533006446812866262704589087321 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 1800 through 1899. -/
theorem ep_Q2_024_block_15_1800_1899_valid :
    checkProductSumEq ep_Q2_024_partials_15_1800_1899
      ep_Q2_024_block_15_1800_1899 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
