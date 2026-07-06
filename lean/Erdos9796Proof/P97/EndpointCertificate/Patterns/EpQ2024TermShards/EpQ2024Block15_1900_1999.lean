/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_024, term block 15:1900-1999

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_024`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2024TermShards

/-- Generator polynomial 15 for endpoint certificate `ep_Q2_024`. -/
def ep_Q2_024_generator_15_1900_1999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1900 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1900 : Poly :=
[
  term ((8637355615427028052845683097057417188252 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1900 for generator 15. -/
def ep_Q2_024_partial_15_1900 : Poly :=
[
  term ((17274711230854056105691366194114834376504 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-8637355615427028052845683097057417188252 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1900 for generator 15. -/
theorem ep_Q2_024_partial_15_1900_valid :
    mulPoly ep_Q2_024_coefficient_15_1900
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1900 := by
  native_decide

/-- Coefficient term 1901 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1901 : Poly :=
[
  term ((550273987578555347265791778601745421704 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1901 for generator 15. -/
def ep_Q2_024_partial_15_1901 : Poly :=
[
  term ((1100547975157110694531583557203490843408 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-550273987578555347265791778601745421704 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1901 for generator 15. -/
theorem ep_Q2_024_partial_15_1901_valid :
    mulPoly ep_Q2_024_coefficient_15_1901
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1901 := by
  native_decide

/-- Coefficient term 1902 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1902 : Poly :=
[
  term ((59578653046556248671257779700657601494300556013576894961 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1902 for generator 15. -/
def ep_Q2_024_partial_15_1902 : Poly :=
[
  term ((59578653046556248671257779700657601494300556013576894961 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-59578653046556248671257779700657601494300556013576894961 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1902 for generator 15. -/
theorem ep_Q2_024_partial_15_1902_valid :
    mulPoly ep_Q2_024_coefficient_15_1902
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1902 := by
  native_decide

/-- Coefficient term 1903 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1903 : Poly :=
[
  term ((-1082535559364413 : Rat) / 4651120884612772) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1903 for generator 15. -/
def ep_Q2_024_partial_15_1903 : Poly :=
[
  term ((-1082535559364413 : Rat) / 2325560442306386) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1082535559364413 : Rat) / 4651120884612772) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1903 for generator 15. -/
theorem ep_Q2_024_partial_15_1903_valid :
    mulPoly ep_Q2_024_coefficient_15_1903
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1903 := by
  native_decide

/-- Coefficient term 1904 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1904 : Poly :=
[
  term ((-612632661057327339513311352279570908701 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2)]
]

/-- Partial product 1904 for generator 15. -/
def ep_Q2_024_partial_15_1904 : Poly :=
[
  term ((-1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 2)],
  term ((612632661057327339513311352279570908701 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1904 for generator 15. -/
theorem ep_Q2_024_partial_15_1904_valid :
    mulPoly ep_Q2_024_coefficient_15_1904
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1904 := by
  native_decide

/-- Coefficient term 1905 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1905 : Poly :=
[
  term ((413117156236923518179612288526746844972 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (12, 1)]
]

/-- Partial product 1905 for generator 15. -/
def ep_Q2_024_partial_15_1905 : Poly :=
[
  term ((826234312473847036359224577053493689944 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 2), (12, 1)],
  term ((-413117156236923518179612288526746844972 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1905 for generator 15. -/
theorem ep_Q2_024_partial_15_1905_valid :
    mulPoly ep_Q2_024_coefficient_15_1905
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1905 := by
  native_decide

/-- Coefficient term 1906 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1906 : Poly :=
[
  term ((81730976694291241886439722037607501898 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1906 for generator 15. -/
def ep_Q2_024_partial_15_1906 : Poly :=
[
  term ((163461953388582483772879444075215003796 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-81730976694291241886439722037607501898 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1906 for generator 15. -/
theorem ep_Q2_024_partial_15_1906_valid :
    mulPoly ep_Q2_024_coefficient_15_1906
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1906 := by
  native_decide

/-- Coefficient term 1907 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1907 : Poly :=
[
  term ((51740090026032145735973014812320781808 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1907 for generator 15. -/
def ep_Q2_024_partial_15_1907 : Poly :=
[
  term ((103480180052064291471946029624641563616 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-51740090026032145735973014812320781808 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1907 for generator 15. -/
theorem ep_Q2_024_partial_15_1907_valid :
    mulPoly ep_Q2_024_coefficient_15_1907
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1907 := by
  native_decide

/-- Coefficient term 1908 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1908 : Poly :=
[
  term ((-6954791040655159872333137773074190517658106839433947733 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1908 for generator 15. -/
def ep_Q2_024_partial_15_1908 : Poly :=
[
  term ((-13909582081310319744666275546148381035316213678867895466 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6954791040655159872333137773074190517658106839433947733 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1908 for generator 15. -/
theorem ep_Q2_024_partial_15_1908_valid :
    mulPoly ep_Q2_024_coefficient_15_1908
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1908 := by
  native_decide

/-- Coefficient term 1909 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1909 : Poly :=
[
  term ((2595156029826876 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1909 for generator 15. -/
def ep_Q2_024_partial_15_1909 : Poly :=
[
  term ((5190312059653752 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2595156029826876 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1909 for generator 15. -/
theorem ep_Q2_024_partial_15_1909_valid :
    mulPoly ep_Q2_024_coefficient_15_1909
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1909 := by
  native_decide

/-- Coefficient term 1910 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1910 : Poly :=
[
  term ((64969775860595452199616527648191718688832709263523546999 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1910 for generator 15. -/
def ep_Q2_024_partial_15_1910 : Poly :=
[
  term ((64969775860595452199616527648191718688832709263523546999 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-64969775860595452199616527648191718688832709263523546999 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1910 for generator 15. -/
theorem ep_Q2_024_partial_15_1910_valid :
    mulPoly ep_Q2_024_coefficient_15_1910
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1910 := by
  native_decide

/-- Coefficient term 1911 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1911 : Poly :=
[
  term ((3983788675240561 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1911 for generator 15. -/
def ep_Q2_024_partial_15_1911 : Poly :=
[
  term ((7967577350481122 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3983788675240561 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1911 for generator 15. -/
theorem ep_Q2_024_partial_15_1911_valid :
    mulPoly ep_Q2_024_coefficient_15_1911
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1911 := by
  native_decide

/-- Coefficient term 1912 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1912 : Poly :=
[
  term ((-602250474567464162959958800176093816604 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 1912 for generator 15. -/
def ep_Q2_024_partial_15_1912 : Poly :=
[
  term ((-1204500949134928325919917600352187633208 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 1)],
  term ((602250474567464162959958800176093816604 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1912 for generator 15. -/
theorem ep_Q2_024_partial_15_1912_valid :
    mulPoly ep_Q2_024_coefficient_15_1912
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1912 := by
  native_decide

/-- Coefficient term 1913 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1913 : Poly :=
[
  term ((4373283040555244735964336602921559704927312631246897239 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 1913 for generator 15. -/
def ep_Q2_024_partial_15_1913 : Poly :=
[
  term ((4373283040555244735964336602921559704927312631246897239 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-4373283040555244735964336602921559704927312631246897239 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1913 for generator 15. -/
theorem ep_Q2_024_partial_15_1913_valid :
    mulPoly ep_Q2_024_coefficient_15_1913
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1913 := by
  native_decide

/-- Coefficient term 1914 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1914 : Poly :=
[
  term ((-4473006499520779 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1914 for generator 15. -/
def ep_Q2_024_partial_15_1914 : Poly :=
[
  term ((-8946012999041558 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4473006499520779 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1914 for generator 15. -/
theorem ep_Q2_024_partial_15_1914_valid :
    mulPoly ep_Q2_024_coefficient_15_1914
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1914 := by
  native_decide

/-- Coefficient term 1915 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1915 : Poly :=
[
  term ((2140779531112199963091625553503897129979 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (11, 1), (13, 1)]
]

/-- Partial product 1915 for generator 15. -/
def ep_Q2_024_partial_15_1915 : Poly :=
[
  term ((4281559062224399926183251107007794259958 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-2140779531112199963091625553503897129979 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1915 for generator 15. -/
theorem ep_Q2_024_partial_15_1915_valid :
    mulPoly ep_Q2_024_coefficient_15_1915
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1915 := by
  native_decide

/-- Coefficient term 1916 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1916 : Poly :=
[
  term ((8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1916 for generator 15. -/
def ep_Q2_024_partial_15_1916 : Poly :=
[
  term ((16283290118036559100125731609525651232 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1916 for generator 15. -/
theorem ep_Q2_024_partial_15_1916_valid :
    mulPoly ep_Q2_024_coefficient_15_1916
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1916 := by
  native_decide

/-- Coefficient term 1917 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1917 : Poly :=
[
  term ((12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 1), (14, 2)]
]

/-- Partial product 1917 for generator 15. -/
def ep_Q2_024_partial_15_1917 : Poly :=
[
  term ((25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1917 for generator 15. -/
theorem ep_Q2_024_partial_15_1917_valid :
    mulPoly ep_Q2_024_coefficient_15_1917
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1917 := by
  native_decide

/-- Coefficient term 1918 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1918 : Poly :=
[
  term ((13420810968027974606585335199222260519238881589755771634 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 1918 for generator 15. -/
def ep_Q2_024_partial_15_1918 : Poly :=
[
  term ((26841621936055949213170670398444521038477763179511543268 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-13420810968027974606585335199222260519238881589755771634 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1918 for generator 15. -/
theorem ep_Q2_024_partial_15_1918_valid :
    mulPoly ep_Q2_024_coefficient_15_1918
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1918 := by
  native_decide

/-- Coefficient term 1919 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1919 : Poly :=
[
  term ((915924673970824 : Rat) / 1162780221153193) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1919 for generator 15. -/
def ep_Q2_024_partial_15_1919 : Poly :=
[
  term ((1831849347941648 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-915924673970824 : Rat) / 1162780221153193) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1919 for generator 15. -/
theorem ep_Q2_024_partial_15_1919_valid :
    mulPoly ep_Q2_024_coefficient_15_1919
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1919 := by
  native_decide

/-- Coefficient term 1920 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1920 : Poly :=
[
  term ((146293725812500668663621106148561594848 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 1920 for generator 15. -/
def ep_Q2_024_partial_15_1920 : Poly :=
[
  term ((292587451625001337327242212297123189696 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-146293725812500668663621106148561594848 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1920 for generator 15. -/
theorem ep_Q2_024_partial_15_1920_valid :
    mulPoly ep_Q2_024_coefficient_15_1920
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1920 := by
  native_decide

/-- Coefficient term 1921 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1921 : Poly :=
[
  term ((-53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1921 for generator 15. -/
def ep_Q2_024_partial_15_1921 : Poly :=
[
  term ((-53824762600716421491094410962189703401457332436241210747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1921 for generator 15. -/
theorem ep_Q2_024_partial_15_1921_valid :
    mulPoly ep_Q2_024_coefficient_15_1921
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1921 := by
  native_decide

/-- Coefficient term 1922 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1922 : Poly :=
[
  term ((3756917212699698 : Rat) / 1162780221153193) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1922 for generator 15. -/
def ep_Q2_024_partial_15_1922 : Poly :=
[
  term ((7513834425399396 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3756917212699698 : Rat) / 1162780221153193) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1922 for generator 15. -/
theorem ep_Q2_024_partial_15_1922_valid :
    mulPoly ep_Q2_024_coefficient_15_1922
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1922 := by
  native_decide

/-- Coefficient term 1923 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1923 : Poly :=
[
  term ((1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 1923 for generator 15. -/
def ep_Q2_024_partial_15_1923 : Poly :=
[
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1923 for generator 15. -/
theorem ep_Q2_024_partial_15_1923_valid :
    mulPoly ep_Q2_024_coefficient_15_1923
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1923 := by
  native_decide

/-- Coefficient term 1924 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1924 : Poly :=
[
  term ((-312276948646616 : Rat) / 1162780221153193) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1924 for generator 15. -/
def ep_Q2_024_partial_15_1924 : Poly :=
[
  term ((-624553897293232 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1924 for generator 15. -/
theorem ep_Q2_024_partial_15_1924_valid :
    mulPoly ep_Q2_024_coefficient_15_1924
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1924 := by
  native_decide

/-- Coefficient term 1925 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1925 : Poly :=
[
  term ((459605872589467395132898205219008568350671210667963567157 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(8, 1), (11, 1), (15, 1)]
]

/-- Partial product 1925 for generator 15. -/
def ep_Q2_024_partial_15_1925 : Poly :=
[
  term ((459605872589467395132898205219008568350671210667963567157 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-459605872589467395132898205219008568350671210667963567157 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1925 for generator 15. -/
theorem ep_Q2_024_partial_15_1925_valid :
    mulPoly ep_Q2_024_coefficient_15_1925
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1925 := by
  native_decide

/-- Coefficient term 1926 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1926 : Poly :=
[
  term ((-8238281905398233 : Rat) / 2325560442306386) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1926 for generator 15. -/
def ep_Q2_024_partial_15_1926 : Poly :=
[
  term ((-8238281905398233 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((8238281905398233 : Rat) / 2325560442306386) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1926 for generator 15. -/
theorem ep_Q2_024_partial_15_1926_valid :
    mulPoly ep_Q2_024_coefficient_15_1926
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1926 := by
  native_decide

/-- Coefficient term 1927 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1927 : Poly :=
[
  term ((-329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (11, 1), (15, 3)]
]

/-- Partial product 1927 for generator 15. -/
def ep_Q2_024_partial_15_1927 : Poly :=
[
  term ((-659245145371871234793179275591195206842375400820629068 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 1), (11, 1), (15, 3)],
  term ((329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1927 for generator 15. -/
theorem ep_Q2_024_partial_15_1927_valid :
    mulPoly ep_Q2_024_coefficient_15_1927
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1927 := by
  native_decide

/-- Coefficient term 1928 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1928 : Poly :=
[
  term ((136850605782984 : Rat) / 1162780221153193) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1928 for generator 15. -/
def ep_Q2_024_partial_15_1928 : Poly :=
[
  term ((273701211565968 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-136850605782984 : Rat) / 1162780221153193) [(8, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1928 for generator 15. -/
theorem ep_Q2_024_partial_15_1928_valid :
    mulPoly ep_Q2_024_coefficient_15_1928
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1928 := by
  native_decide

/-- Coefficient term 1929 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1929 : Poly :=
[
  term ((-1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (11, 2)]
]

/-- Partial product 1929 for generator 15. -/
def ep_Q2_024_partial_15_1929 : Poly :=
[
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1), (11, 2)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1929 for generator 15. -/
theorem ep_Q2_024_partial_15_1929_valid :
    mulPoly ep_Q2_024_coefficient_15_1929
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1929 := by
  native_decide

/-- Coefficient term 1930 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1930 : Poly :=
[
  term ((-87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 1930 for generator 15. -/
def ep_Q2_024_partial_15_1930 : Poly :=
[
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1930 for generator 15. -/
theorem ep_Q2_024_partial_15_1930_valid :
    mulPoly ep_Q2_024_coefficient_15_1930
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1930 := by
  native_decide

/-- Coefficient term 1931 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1931 : Poly :=
[
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 2), (15, 2)]
]

/-- Partial product 1931 for generator 15. -/
def ep_Q2_024_partial_15_1931 : Poly :=
[
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (11, 2), (15, 2)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1931 for generator 15. -/
theorem ep_Q2_024_partial_15_1931_valid :
    mulPoly ep_Q2_024_coefficient_15_1931
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1931 := by
  native_decide

/-- Coefficient term 1932 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1932 : Poly :=
[
  term ((-57972216906980 : Rat) / 1162780221153193) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 1932 for generator 15. -/
def ep_Q2_024_partial_15_1932 : Poly :=
[
  term ((-115944433813960 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((57972216906980 : Rat) / 1162780221153193) [(8, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1932 for generator 15. -/
theorem ep_Q2_024_partial_15_1932_valid :
    mulPoly ep_Q2_024_coefficient_15_1932
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1932 := by
  native_decide

/-- Coefficient term 1933 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1933 : Poly :=
[
  term ((2262186041481186780752495353724733372893 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (12, 1)]
]

/-- Partial product 1933 for generator 15. -/
def ep_Q2_024_partial_15_1933 : Poly :=
[
  term ((4524372082962373561504990707449466745786 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1), (12, 1)],
  term ((-2262186041481186780752495353724733372893 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1933 for generator 15. -/
theorem ep_Q2_024_partial_15_1933_valid :
    mulPoly ep_Q2_024_coefficient_15_1933
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1933 := by
  native_decide

/-- Coefficient term 1934 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1934 : Poly :=
[
  term ((57282938508457199692400454260146274858348641708123719253 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1934 for generator 15. -/
def ep_Q2_024_partial_15_1934 : Poly :=
[
  term ((57282938508457199692400454260146274858348641708123719253 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-57282938508457199692400454260146274858348641708123719253 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1934 for generator 15. -/
theorem ep_Q2_024_partial_15_1934_valid :
    mulPoly ep_Q2_024_coefficient_15_1934
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1934 := by
  native_decide

/-- Coefficient term 1935 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1935 : Poly :=
[
  term ((-1487647416800383 : Rat) / 2325560442306386) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1935 for generator 15. -/
def ep_Q2_024_partial_15_1935 : Poly :=
[
  term ((-1487647416800383 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1487647416800383 : Rat) / 2325560442306386) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1935 for generator 15. -/
theorem ep_Q2_024_partial_15_1935_valid :
    mulPoly ep_Q2_024_coefficient_15_1935
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1935 := by
  native_decide

/-- Coefficient term 1936 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1936 : Poly :=
[
  term ((1256437761322907405732853456048317766906757745647613173949 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1936 for generator 15. -/
def ep_Q2_024_partial_15_1936 : Poly :=
[
  term ((1256437761322907405732853456048317766906757745647613173949 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1256437761322907405732853456048317766906757745647613173949 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1936 for generator 15. -/
theorem ep_Q2_024_partial_15_1936_valid :
    mulPoly ep_Q2_024_coefficient_15_1936
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1936 := by
  native_decide

/-- Coefficient term 1937 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1937 : Poly :=
[
  term ((75522169147931209 : Rat) / 13953362653838316) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1937 for generator 15. -/
def ep_Q2_024_partial_15_1937 : Poly :=
[
  term ((75522169147931209 : Rat) / 6976681326919158) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-75522169147931209 : Rat) / 13953362653838316) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1937 for generator 15. -/
theorem ep_Q2_024_partial_15_1937_valid :
    mulPoly ep_Q2_024_coefficient_15_1937
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1937 := by
  native_decide

/-- Coefficient term 1938 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1938 : Poly :=
[
  term ((19051213653055693731542107038343230094 : Rat) / 30501087900062982116102377831259472915) [(8, 1), (12, 1), (13, 2)]
]

/-- Partial product 1938 for generator 15. -/
def ep_Q2_024_partial_15_1938 : Poly :=
[
  term ((38102427306111387463084214076686460188 : Rat) / 30501087900062982116102377831259472915) [(6, 1), (8, 1), (12, 1), (13, 2)],
  term ((-19051213653055693731542107038343230094 : Rat) / 30501087900062982116102377831259472915) [(8, 1), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1938 for generator 15. -/
theorem ep_Q2_024_partial_15_1938_valid :
    mulPoly ep_Q2_024_coefficient_15_1938
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1938 := by
  native_decide

/-- Coefficient term 1939 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1939 : Poly :=
[
  term ((76715245327302406519890051962086037366 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 1), (13, 2), (14, 1)]
]

/-- Partial product 1939 for generator 15. -/
def ep_Q2_024_partial_15_1939 : Poly :=
[
  term ((153430490654604813039780103924172074732 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-76715245327302406519890051962086037366 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1939 for generator 15. -/
theorem ep_Q2_024_partial_15_1939_valid :
    mulPoly ep_Q2_024_coefficient_15_1939
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1939 := by
  native_decide

/-- Coefficient term 1940 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1940 : Poly :=
[
  term ((-826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (14, 1)]
]

/-- Partial product 1940 for generator 15. -/
def ep_Q2_024_partial_15_1940 : Poly :=
[
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1940 for generator 15. -/
theorem ep_Q2_024_partial_15_1940_valid :
    mulPoly ep_Q2_024_coefficient_15_1940
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1940 := by
  native_decide

/-- Coefficient term 1941 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1941 : Poly :=
[
  term ((-60613189104109889150602519961253961272330567250720564943 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1941 for generator 15. -/
def ep_Q2_024_partial_15_1941 : Poly :=
[
  term ((-60613189104109889150602519961253961272330567250720564943 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((60613189104109889150602519961253961272330567250720564943 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1941 for generator 15. -/
theorem ep_Q2_024_partial_15_1941_valid :
    mulPoly ep_Q2_024_coefficient_15_1941
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1941 := by
  native_decide

/-- Coefficient term 1942 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1942 : Poly :=
[
  term ((13480911334857383 : Rat) / 1162780221153193) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1942 for generator 15. -/
def ep_Q2_024_partial_15_1942 : Poly :=
[
  term ((26961822669714766 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-13480911334857383 : Rat) / 1162780221153193) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1942 for generator 15. -/
theorem ep_Q2_024_partial_15_1942_valid :
    mulPoly ep_Q2_024_coefficient_15_1942
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1942 := by
  native_decide

/-- Coefficient term 1943 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1943 : Poly :=
[
  term ((-260964897169297331495304441607119013362770740427838183521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1943 for generator 15. -/
def ep_Q2_024_partial_15_1943 : Poly :=
[
  term ((-260964897169297331495304441607119013362770740427838183521 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (8, 1), (12, 1), (15, 2)],
  term ((260964897169297331495304441607119013362770740427838183521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1943 for generator 15. -/
theorem ep_Q2_024_partial_15_1943_valid :
    mulPoly ep_Q2_024_coefficient_15_1943
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1943 := by
  native_decide

/-- Coefficient term 1944 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1944 : Poly :=
[
  term ((7314429299716121 : Rat) / 6976681326919158) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1944 for generator 15. -/
def ep_Q2_024_partial_15_1944 : Poly :=
[
  term ((7314429299716121 : Rat) / 3488340663459579) [(6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-7314429299716121 : Rat) / 6976681326919158) [(8, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1944 for generator 15. -/
theorem ep_Q2_024_partial_15_1944_valid :
    mulPoly ep_Q2_024_coefficient_15_1944
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1944 := by
  native_decide

/-- Coefficient term 1945 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1945 : Poly :=
[
  term ((-77733965294047982849249561660849897517775764515577071069 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1945 for generator 15. -/
def ep_Q2_024_partial_15_1945 : Poly :=
[
  term ((-77733965294047982849249561660849897517775764515577071069 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((77733965294047982849249561660849897517775764515577071069 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1945 for generator 15. -/
theorem ep_Q2_024_partial_15_1945_valid :
    mulPoly ep_Q2_024_coefficient_15_1945
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1945 := by
  native_decide

/-- Coefficient term 1946 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1946 : Poly :=
[
  term ((4569079916135479 : Rat) / 2325560442306386) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1946 for generator 15. -/
def ep_Q2_024_partial_15_1946 : Poly :=
[
  term ((4569079916135479 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1946 for generator 15. -/
theorem ep_Q2_024_partial_15_1946_valid :
    mulPoly ep_Q2_024_coefficient_15_1946
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1946 := by
  native_decide

/-- Coefficient term 1947 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1947 : Poly :=
[
  term ((349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 2), (13, 2)]
]

/-- Partial product 1947 for generator 15. -/
def ep_Q2_024_partial_15_1947 : Poly :=
[
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (12, 2), (13, 2)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1947 for generator 15. -/
theorem ep_Q2_024_partial_15_1947_valid :
    mulPoly ep_Q2_024_coefficient_15_1947
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1947 := by
  native_decide

/-- Coefficient term 1948 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1948 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(8, 1), (12, 2), (15, 2)]
]

/-- Partial product 1948 for generator 15. -/
def ep_Q2_024_partial_15_1948 : Poly :=
[
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(8, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1948 for generator 15. -/
theorem ep_Q2_024_partial_15_1948_valid :
    mulPoly ep_Q2_024_coefficient_15_1948
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1948 := by
  native_decide

/-- Coefficient term 1949 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1949 : Poly :=
[
  term ((-2172308402631610 : Rat) / 1162780221153193) [(8, 1), (12, 2), (15, 2), (16, 1)]
]

/-- Partial product 1949 for generator 15. -/
def ep_Q2_024_partial_15_1949 : Poly :=
[
  term ((-4344616805263220 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((2172308402631610 : Rat) / 1162780221153193) [(8, 1), (12, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1949 for generator 15. -/
theorem ep_Q2_024_partial_15_1949_valid :
    mulPoly ep_Q2_024_coefficient_15_1949
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1949 := by
  native_decide

/-- Coefficient term 1950 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1950 : Poly :=
[
  term ((-3372968324111785565064740301738122917674488575207960182017 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1950 for generator 15. -/
def ep_Q2_024_partial_15_1950 : Poly :=
[
  term ((-3372968324111785565064740301738122917674488575207960182017 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((3372968324111785565064740301738122917674488575207960182017 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1950 for generator 15. -/
theorem ep_Q2_024_partial_15_1950_valid :
    mulPoly ep_Q2_024_coefficient_15_1950
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1950 := by
  native_decide

/-- Coefficient term 1951 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1951 : Poly :=
[
  term ((37451541547866803 : Rat) / 13953362653838316) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1951 for generator 15. -/
def ep_Q2_024_partial_15_1951 : Poly :=
[
  term ((37451541547866803 : Rat) / 6976681326919158) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37451541547866803 : Rat) / 13953362653838316) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1951 for generator 15. -/
theorem ep_Q2_024_partial_15_1951_valid :
    mulPoly ep_Q2_024_coefficient_15_1951
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1951 := by
  native_decide

/-- Coefficient term 1952 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1952 : Poly :=
[
  term ((-1650243423976359827537056467652681764777639501280148209 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1952 for generator 15. -/
def ep_Q2_024_partial_15_1952 : Poly :=
[
  term ((-3300486847952719655074112935305363529555279002560296418 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((1650243423976359827537056467652681764777639501280148209 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1952 for generator 15. -/
theorem ep_Q2_024_partial_15_1952_valid :
    mulPoly ep_Q2_024_coefficient_15_1952
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1952 := by
  native_decide

/-- Coefficient term 1953 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1953 : Poly :=
[
  term ((1041537767813708 : Rat) / 1162780221153193) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1953 for generator 15. -/
def ep_Q2_024_partial_15_1953 : Poly :=
[
  term ((2083075535627416 : Rat) / 1162780221153193) [(6, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1041537767813708 : Rat) / 1162780221153193) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1953 for generator 15. -/
theorem ep_Q2_024_partial_15_1953_valid :
    mulPoly ep_Q2_024_coefficient_15_1953
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1953 := by
  native_decide

/-- Coefficient term 1954 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1954 : Poly :=
[
  term ((39917548597857942075629668229013981889838602187763015239 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1954 for generator 15. -/
def ep_Q2_024_partial_15_1954 : Poly :=
[
  term ((39917548597857942075629668229013981889838602187763015239 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-39917548597857942075629668229013981889838602187763015239 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1954 for generator 15. -/
theorem ep_Q2_024_partial_15_1954_valid :
    mulPoly ep_Q2_024_coefficient_15_1954
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1954 := by
  native_decide

/-- Coefficient term 1955 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1955 : Poly :=
[
  term ((-557571936953549 : Rat) / 4651120884612772) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1955 for generator 15. -/
def ep_Q2_024_partial_15_1955 : Poly :=
[
  term ((-557571936953549 : Rat) / 2325560442306386) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((557571936953549 : Rat) / 4651120884612772) [(8, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1955 for generator 15. -/
theorem ep_Q2_024_partial_15_1955_valid :
    mulPoly ep_Q2_024_coefficient_15_1955
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1955 := by
  native_decide

/-- Coefficient term 1956 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1956 : Poly :=
[
  term ((-2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (15, 3)]
]

/-- Partial product 1956 for generator 15. -/
def ep_Q2_024_partial_15_1956 : Poly :=
[
  term ((-4976759947362561700591008818322780060033296103603165464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (13, 1), (15, 3)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1956 for generator 15. -/
theorem ep_Q2_024_partial_15_1956_valid :
    mulPoly ep_Q2_024_coefficient_15_1956
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1956 := by
  native_decide

/-- Coefficient term 1957 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1957 : Poly :=
[
  term ((624553897293232 : Rat) / 1162780221153193) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1957 for generator 15. -/
def ep_Q2_024_partial_15_1957 : Poly :=
[
  term ((1249107794586464 : Rat) / 1162780221153193) [(6, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(8, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1957 for generator 15. -/
theorem ep_Q2_024_partial_15_1957_valid :
    mulPoly ep_Q2_024_coefficient_15_1957
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1957 := by
  native_decide

/-- Coefficient term 1958 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1958 : Poly :=
[
  term ((-1333744514272956948859061587339420805702 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 2)]
]

/-- Partial product 1958 for generator 15. -/
def ep_Q2_024_partial_15_1958 : Poly :=
[
  term ((-2667489028545913897718123174678841611404 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (13, 2)],
  term ((1333744514272956948859061587339420805702 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1958 for generator 15. -/
theorem ep_Q2_024_partial_15_1958_valid :
    mulPoly ep_Q2_024_coefficient_15_1958
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1958 := by
  native_decide

/-- Coefficient term 1959 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1959 : Poly :=
[
  term ((4581670440369367096157315995597275086008 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2), (14, 1)]
]

/-- Partial product 1959 for generator 15. -/
def ep_Q2_024_partial_15_1959 : Poly :=
[
  term ((9163340880738734192314631991194550172016 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1), (13, 2), (14, 1)],
  term ((-4581670440369367096157315995597275086008 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1959 for generator 15. -/
theorem ep_Q2_024_partial_15_1959_valid :
    mulPoly ep_Q2_024_coefficient_15_1959
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1959 := by
  native_decide

/-- Coefficient term 1960 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1960 : Poly :=
[
  term ((-7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (13, 2), (14, 2)]
]

/-- Partial product 1960 for generator 15. -/
def ep_Q2_024_partial_15_1960 : Poly :=
[
  term ((-15910681050259042974401075197063467808 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (8, 1), (13, 2), (14, 2)],
  term ((7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1960 for generator 15. -/
theorem ep_Q2_024_partial_15_1960_valid :
    mulPoly ep_Q2_024_coefficient_15_1960
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1960 := by
  native_decide

/-- Coefficient term 1961 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1961 : Poly :=
[
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 2), (15, 2)]
]

/-- Partial product 1961 for generator 15. -/
def ep_Q2_024_partial_15_1961 : Poly :=
[
  term ((19846603801094971681836921785403492035946502369064496832 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (13, 2), (15, 2)],
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1961 for generator 15. -/
theorem ep_Q2_024_partial_15_1961_valid :
    mulPoly ep_Q2_024_coefficient_15_1961
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1961 := by
  native_decide

/-- Coefficient term 1962 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1962 : Poly :=
[
  term ((-2498215589172928 : Rat) / 1162780221153193) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1962 for generator 15. -/
def ep_Q2_024_partial_15_1962 : Poly :=
[
  term ((-4996431178345856 : Rat) / 1162780221153193) [(6, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(8, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1962 for generator 15. -/
theorem ep_Q2_024_partial_15_1962_valid :
    mulPoly ep_Q2_024_coefficient_15_1962
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1962 := by
  native_decide

/-- Coefficient term 1963 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1963 : Poly :=
[
  term ((103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 3), (15, 1)]
]

/-- Partial product 1963 for generator 15. -/
def ep_Q2_024_partial_15_1963 : Poly :=
[
  term ((207901673096356702735661496247904121472 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (13, 3), (15, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1963 for generator 15. -/
theorem ep_Q2_024_partial_15_1963_valid :
    mulPoly ep_Q2_024_coefficient_15_1963
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1963 := by
  native_decide

/-- Coefficient term 1964 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1964 : Poly :=
[
  term ((2045879696722380779649562774801677204872 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (14, 1)]
]

/-- Partial product 1964 for generator 15. -/
def ep_Q2_024_partial_15_1964 : Poly :=
[
  term ((4091759393444761559299125549603354409744 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (14, 1)],
  term ((-2045879696722380779649562774801677204872 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1964 for generator 15. -/
theorem ep_Q2_024_partial_15_1964_valid :
    mulPoly ep_Q2_024_coefficient_15_1964
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1964 := by
  native_decide

/-- Coefficient term 1965 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1965 : Poly :=
[
  term ((7677996214056465788226486493702137612765108652994535477 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1965 for generator 15. -/
def ep_Q2_024_partial_15_1965 : Poly :=
[
  term ((7677996214056465788226486493702137612765108652994535477 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-7677996214056465788226486493702137612765108652994535477 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1965 for generator 15. -/
theorem ep_Q2_024_partial_15_1965_valid :
    mulPoly ep_Q2_024_coefficient_15_1965
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1965 := by
  native_decide

/-- Coefficient term 1966 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1966 : Poly :=
[
  term ((98423055706883929 : Rat) / 6976681326919158) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1966 for generator 15. -/
def ep_Q2_024_partial_15_1966 : Poly :=
[
  term ((98423055706883929 : Rat) / 3488340663459579) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-98423055706883929 : Rat) / 6976681326919158) [(8, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1966 for generator 15. -/
theorem ep_Q2_024_partial_15_1966_valid :
    mulPoly ep_Q2_024_coefficient_15_1966
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1966 := by
  native_decide

/-- Coefficient term 1967 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1967 : Poly :=
[
  term ((-337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (14, 2), (15, 2)]
]

/-- Partial product 1967 for generator 15. -/
def ep_Q2_024_partial_15_1967 : Poly :=
[
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 1), (8, 1), (14, 2), (15, 2)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1967 for generator 15. -/
theorem ep_Q2_024_partial_15_1967_valid :
    mulPoly ep_Q2_024_coefficient_15_1967
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1967 := by
  native_decide

/-- Coefficient term 1968 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1968 : Poly :=
[
  term ((-833967741040952 : Rat) / 1162780221153193) [(8, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1968 for generator 15. -/
def ep_Q2_024_partial_15_1968 : Poly :=
[
  term ((-1667935482081904 : Rat) / 1162780221153193) [(6, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((833967741040952 : Rat) / 1162780221153193) [(8, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1968 for generator 15. -/
theorem ep_Q2_024_partial_15_1968_valid :
    mulPoly ep_Q2_024_coefficient_15_1968
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1968 := by
  native_decide

/-- Coefficient term 1969 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1969 : Poly :=
[
  term ((-29465923472488313649372248813758280789818759793353336959 : Rat) / 743999161705615854803818744669012717973877138597969104) [(8, 1), (15, 2)]
]

/-- Partial product 1969 for generator 15. -/
def ep_Q2_024_partial_15_1969 : Poly :=
[
  term ((-29465923472488313649372248813758280789818759793353336959 : Rat) / 371999580852807927401909372334506358986938569298984552) [(6, 1), (8, 1), (15, 2)],
  term ((29465923472488313649372248813758280789818759793353336959 : Rat) / 743999161705615854803818744669012717973877138597969104) [(8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1969 for generator 15. -/
theorem ep_Q2_024_partial_15_1969_valid :
    mulPoly ep_Q2_024_coefficient_15_1969
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1969 := by
  native_decide

/-- Coefficient term 1970 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1970 : Poly :=
[
  term ((47667903956803 : Rat) / 4651120884612772) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 1970 for generator 15. -/
def ep_Q2_024_partial_15_1970 : Poly :=
[
  term ((47667903956803 : Rat) / 2325560442306386) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-47667903956803 : Rat) / 4651120884612772) [(8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1970 for generator 15. -/
theorem ep_Q2_024_partial_15_1970_valid :
    mulPoly ep_Q2_024_coefficient_15_1970
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1970 := by
  native_decide

/-- Coefficient term 1971 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1971 : Poly :=
[
  term ((1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (11, 1)]
]

/-- Partial product 1971 for generator 15. -/
def ep_Q2_024_partial_15_1971 : Poly :=
[
  term ((2450530644229309358053245409118283634804 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 2), (9, 1), (11, 1)],
  term ((-1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1971 for generator 15. -/
theorem ep_Q2_024_partial_15_1971_valid :
    mulPoly ep_Q2_024_coefficient_15_1971
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1971 := by
  native_decide

/-- Coefficient term 1972 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1972 : Poly :=
[
  term ((-413117156236923518179612288526746844972 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (13, 1)]
]

/-- Partial product 1972 for generator 15. -/
def ep_Q2_024_partial_15_1972 : Poly :=
[
  term ((-826234312473847036359224577053493689944 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term ((413117156236923518179612288526746844972 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1972 for generator 15. -/
theorem ep_Q2_024_partial_15_1972_valid :
    mulPoly ep_Q2_024_coefficient_15_1972
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1972 := by
  native_decide

/-- Coefficient term 1973 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1973 : Poly :=
[
  term ((25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1973 for generator 15. -/
def ep_Q2_024_partial_15_1973 : Poly :=
[
  term ((50596331749013033533730977984407392584 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1973 for generator 15. -/
theorem ep_Q2_024_partial_15_1973_valid :
    mulPoly ep_Q2_024_coefficient_15_1973
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1973 := by
  native_decide

/-- Coefficient term 1974 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1974 : Poly :=
[
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1974 for generator 15. -/
def ep_Q2_024_partial_15_1974 : Poly :=
[
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1974 for generator 15. -/
theorem ep_Q2_024_partial_15_1974_valid :
    mulPoly ep_Q2_024_coefficient_15_1974
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1974 := by
  native_decide

/-- Coefficient term 1975 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1975 : Poly :=
[
  term ((1146295204983097 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1975 for generator 15. -/
def ep_Q2_024_partial_15_1975 : Poly :=
[
  term ((2292590409966194 : Rat) / 1162780221153193) [(6, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1146295204983097 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1975 for generator 15. -/
theorem ep_Q2_024_partial_15_1975_valid :
    mulPoly ep_Q2_024_coefficient_15_1975
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1975 := by
  native_decide

/-- Coefficient term 1976 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1976 : Poly :=
[
  term ((-84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (11, 1), (13, 1)]
]

/-- Partial product 1976 for generator 15. -/
def ep_Q2_024_partial_15_1976 : Poly :=
[
  term ((-168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1976 for generator 15. -/
theorem ep_Q2_024_partial_15_1976_valid :
    mulPoly ep_Q2_024_coefficient_15_1976
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1976 := by
  native_decide

/-- Coefficient term 1977 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1977 : Poly :=
[
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (11, 1), (15, 1)]
]

/-- Partial product 1977 for generator 15. -/
def ep_Q2_024_partial_15_1977 : Poly :=
[
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1977 for generator 15. -/
theorem ep_Q2_024_partial_15_1977_valid :
    mulPoly ep_Q2_024_coefficient_15_1977
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1977 := by
  native_decide

/-- Coefficient term 1978 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1978 : Poly :=
[
  term ((1082535559364413 : Rat) / 2325560442306386) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1978 for generator 15. -/
def ep_Q2_024_partial_15_1978 : Poly :=
[
  term ((1082535559364413 : Rat) / 1162780221153193) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1082535559364413 : Rat) / 2325560442306386) [(8, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1978 for generator 15. -/
theorem ep_Q2_024_partial_15_1978_valid :
    mulPoly ep_Q2_024_coefficient_15_1978
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1978 := by
  native_decide

/-- Coefficient term 1979 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1979 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1979 for generator 15. -/
def ep_Q2_024_partial_15_1979 : Poly :=
[
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1979 for generator 15. -/
theorem ep_Q2_024_partial_15_1979_valid :
    mulPoly ep_Q2_024_coefficient_15_1979
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1979 := by
  native_decide

/-- Coefficient term 1980 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1980 : Poly :=
[
  term ((-425478577289470 : Rat) / 1162780221153193) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1980 for generator 15. -/
def ep_Q2_024_partial_15_1980 : Poly :=
[
  term ((-850957154578940 : Rat) / 1162780221153193) [(6, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1980 for generator 15. -/
theorem ep_Q2_024_partial_15_1980_valid :
    mulPoly ep_Q2_024_coefficient_15_1980
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1980 := by
  native_decide

/-- Coefficient term 1981 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1981 : Poly :=
[
  term ((-25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 1), (13, 2)]
]

/-- Partial product 1981 for generator 15. -/
def ep_Q2_024_partial_15_1981 : Poly :=
[
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 2), (12, 1), (13, 2)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1981 for generator 15. -/
theorem ep_Q2_024_partial_15_1981_valid :
    mulPoly ep_Q2_024_coefficient_15_1981
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1981 := by
  native_decide

/-- Coefficient term 1982 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1982 : Poly :=
[
  term ((8901278851837287449075483478346929522351235159668315756 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (13, 1), (15, 1)]
]

/-- Partial product 1982 for generator 15. -/
def ep_Q2_024_partial_15_1982 : Poly :=
[
  term ((17802557703674574898150966956693859044702470319336631512 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((-8901278851837287449075483478346929522351235159668315756 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1982 for generator 15. -/
theorem ep_Q2_024_partial_15_1982_valid :
    mulPoly ep_Q2_024_coefficient_15_1982
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1982 := by
  native_decide

/-- Coefficient term 1983 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1983 : Poly :=
[
  term ((-7002337775180804 : Rat) / 1162780221153193) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1983 for generator 15. -/
def ep_Q2_024_partial_15_1983 : Poly :=
[
  term ((-14004675550361608 : Rat) / 1162780221153193) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((7002337775180804 : Rat) / 1162780221153193) [(8, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1983 for generator 15. -/
theorem ep_Q2_024_partial_15_1983_valid :
    mulPoly ep_Q2_024_coefficient_15_1983
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1983 := by
  native_decide

/-- Coefficient term 1984 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1984 : Poly :=
[
  term ((169148534608068318614766785971719853796 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (13, 2)]
]

/-- Partial product 1984 for generator 15. -/
def ep_Q2_024_partial_15_1984 : Poly :=
[
  term ((338297069216136637229533571943439707592 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 2), (13, 2)],
  term ((-169148534608068318614766785971719853796 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1984 for generator 15. -/
theorem ep_Q2_024_partial_15_1984_valid :
    mulPoly ep_Q2_024_coefficient_15_1984
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1984 := by
  native_decide

/-- Coefficient term 1985 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1985 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(9, 1), (11, 1)]
]

/-- Partial product 1985 for generator 15. -/
def ep_Q2_024_partial_15_1985 : Poly :=
[
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (11, 1)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1985 for generator 15. -/
theorem ep_Q2_024_partial_15_1985_valid :
    mulPoly ep_Q2_024_coefficient_15_1985
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1985 := by
  native_decide

/-- Coefficient term 1986 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1986 : Poly :=
[
  term ((-586386077606579824824875343171890477124 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 1986 for generator 15. -/
def ep_Q2_024_partial_15_1986 : Poly :=
[
  term ((-1172772155213159649649750686343780954248 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((586386077606579824824875343171890477124 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1986 for generator 15. -/
theorem ep_Q2_024_partial_15_1986_valid :
    mulPoly ep_Q2_024_coefficient_15_1986
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1986 := by
  native_decide

/-- Coefficient term 1987 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1987 : Poly :=
[
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1987 for generator 15. -/
def ep_Q2_024_partial_15_1987 : Poly :=
[
  term ((-349932281624983451981531254766853737984 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1987 for generator 15. -/
theorem ep_Q2_024_partial_15_1987_valid :
    mulPoly ep_Q2_024_coefficient_15_1987
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1987 := by
  native_decide

/-- Coefficient term 1988 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1988 : Poly :=
[
  term ((-676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1988 for generator 15. -/
def ep_Q2_024_partial_15_1988 : Poly :=
[
  term ((-1352426172101182737185794737983768912 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1988 for generator 15. -/
theorem ep_Q2_024_partial_15_1988_valid :
    mulPoly ep_Q2_024_coefficient_15_1988
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1988 := by
  native_decide

/-- Coefficient term 1989 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1989 : Poly :=
[
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1989 for generator 15. -/
def ep_Q2_024_partial_15_1989 : Poly :=
[
  term ((-32353000969407719280652367219495481640248766956944768212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1989 for generator 15. -/
theorem ep_Q2_024_partial_15_1989_valid :
    mulPoly ep_Q2_024_coefficient_15_1989
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1989 := by
  native_decide

/-- Coefficient term 1990 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1990 : Poly :=
[
  term ((-115944433813960 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1990 for generator 15. -/
def ep_Q2_024_partial_15_1990 : Poly :=
[
  term ((-231888867627920 : Rat) / 1162780221153193) [(6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((115944433813960 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1990 for generator 15. -/
theorem ep_Q2_024_partial_15_1990_valid :
    mulPoly ep_Q2_024_coefficient_15_1990
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1990 := by
  native_decide

/-- Coefficient term 1991 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1991 : Poly :=
[
  term ((3993831043486647702866554363354132024 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 2)]
]

/-- Partial product 1991 for generator 15. -/
def ep_Q2_024_partial_15_1991 : Poly :=
[
  term ((7987662086973295405733108726708264048 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 1), (11, 1), (12, 2)],
  term ((-3993831043486647702866554363354132024 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1991 for generator 15. -/
theorem ep_Q2_024_partial_15_1991_valid :
    mulPoly ep_Q2_024_coefficient_15_1991
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1991 := by
  native_decide

/-- Coefficient term 1992 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1992 : Poly :=
[
  term ((43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1992 for generator 15. -/
def ep_Q2_024_partial_15_1992 : Poly :=
[
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1992 for generator 15. -/
theorem ep_Q2_024_partial_15_1992_valid :
    mulPoly ep_Q2_024_coefficient_15_1992
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1992 := by
  native_decide

/-- Coefficient term 1993 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1993 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 1993 for generator 15. -/
def ep_Q2_024_partial_15_1993 : Poly :=
[
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1993 for generator 15. -/
theorem ep_Q2_024_partial_15_1993_valid :
    mulPoly ep_Q2_024_coefficient_15_1993
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1993 := by
  native_decide

/-- Coefficient term 1994 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1994 : Poly :=
[
  term ((28986108453490 : Rat) / 1162780221153193) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1994 for generator 15. -/
def ep_Q2_024_partial_15_1994 : Poly :=
[
  term ((57972216906980 : Rat) / 1162780221153193) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1994 for generator 15. -/
theorem ep_Q2_024_partial_15_1994_valid :
    mulPoly ep_Q2_024_coefficient_15_1994
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1994 := by
  native_decide

/-- Coefficient term 1995 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1995 : Poly :=
[
  term ((1143599013855145394761061330562970788791 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1995 for generator 15. -/
def ep_Q2_024_partial_15_1995 : Poly :=
[
  term ((2287198027710290789522122661125941577582 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1143599013855145394761061330562970788791 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1995 for generator 15. -/
theorem ep_Q2_024_partial_15_1995_valid :
    mulPoly ep_Q2_024_coefficient_15_1995
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1995 := by
  native_decide

/-- Coefficient term 1996 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1996 : Poly :=
[
  term ((1825122725003726853987651979071835741026 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1996 for generator 15. -/
def ep_Q2_024_partial_15_1996 : Poly :=
[
  term ((3650245450007453707975303958143671482052 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1825122725003726853987651979071835741026 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1996 for generator 15. -/
theorem ep_Q2_024_partial_15_1996_valid :
    mulPoly ep_Q2_024_coefficient_15_1996
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1996 := by
  native_decide

/-- Coefficient term 1997 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1997 : Poly :=
[
  term ((-1631965081169429788014758309938783585868 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 2)]
]

/-- Partial product 1997 for generator 15. -/
def ep_Q2_024_partial_15_1997 : Poly :=
[
  term ((-3263930162338859576029516619877567171736 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((1631965081169429788014758309938783585868 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1997 for generator 15. -/
theorem ep_Q2_024_partial_15_1997_valid :
    mulPoly ep_Q2_024_coefficient_15_1997
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1997 := by
  native_decide

/-- Coefficient term 1998 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1998 : Poly :=
[
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1998 for generator 15. -/
def ep_Q2_024_partial_15_1998 : Poly :=
[
  term ((-19846603801094971681836921785403492035946502369064496832 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1998 for generator 15. -/
theorem ep_Q2_024_partial_15_1998_valid :
    mulPoly ep_Q2_024_coefficient_15_1998
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1998 := by
  native_decide

/-- Coefficient term 1999 from coefficient polynomial 15. -/
def ep_Q2_024_coefficient_15_1999 : Poly :=
[
  term ((2498215589172928 : Rat) / 1162780221153193) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1999 for generator 15. -/
def ep_Q2_024_partial_15_1999 : Poly :=
[
  term ((4996431178345856 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1999 for generator 15. -/
theorem ep_Q2_024_partial_15_1999_valid :
    mulPoly ep_Q2_024_coefficient_15_1999
        ep_Q2_024_generator_15_1900_1999 =
      ep_Q2_024_partial_15_1999 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_024_partials_15_1900_1999 : List Poly :=
[
  ep_Q2_024_partial_15_1900,
  ep_Q2_024_partial_15_1901,
  ep_Q2_024_partial_15_1902,
  ep_Q2_024_partial_15_1903,
  ep_Q2_024_partial_15_1904,
  ep_Q2_024_partial_15_1905,
  ep_Q2_024_partial_15_1906,
  ep_Q2_024_partial_15_1907,
  ep_Q2_024_partial_15_1908,
  ep_Q2_024_partial_15_1909,
  ep_Q2_024_partial_15_1910,
  ep_Q2_024_partial_15_1911,
  ep_Q2_024_partial_15_1912,
  ep_Q2_024_partial_15_1913,
  ep_Q2_024_partial_15_1914,
  ep_Q2_024_partial_15_1915,
  ep_Q2_024_partial_15_1916,
  ep_Q2_024_partial_15_1917,
  ep_Q2_024_partial_15_1918,
  ep_Q2_024_partial_15_1919,
  ep_Q2_024_partial_15_1920,
  ep_Q2_024_partial_15_1921,
  ep_Q2_024_partial_15_1922,
  ep_Q2_024_partial_15_1923,
  ep_Q2_024_partial_15_1924,
  ep_Q2_024_partial_15_1925,
  ep_Q2_024_partial_15_1926,
  ep_Q2_024_partial_15_1927,
  ep_Q2_024_partial_15_1928,
  ep_Q2_024_partial_15_1929,
  ep_Q2_024_partial_15_1930,
  ep_Q2_024_partial_15_1931,
  ep_Q2_024_partial_15_1932,
  ep_Q2_024_partial_15_1933,
  ep_Q2_024_partial_15_1934,
  ep_Q2_024_partial_15_1935,
  ep_Q2_024_partial_15_1936,
  ep_Q2_024_partial_15_1937,
  ep_Q2_024_partial_15_1938,
  ep_Q2_024_partial_15_1939,
  ep_Q2_024_partial_15_1940,
  ep_Q2_024_partial_15_1941,
  ep_Q2_024_partial_15_1942,
  ep_Q2_024_partial_15_1943,
  ep_Q2_024_partial_15_1944,
  ep_Q2_024_partial_15_1945,
  ep_Q2_024_partial_15_1946,
  ep_Q2_024_partial_15_1947,
  ep_Q2_024_partial_15_1948,
  ep_Q2_024_partial_15_1949,
  ep_Q2_024_partial_15_1950,
  ep_Q2_024_partial_15_1951,
  ep_Q2_024_partial_15_1952,
  ep_Q2_024_partial_15_1953,
  ep_Q2_024_partial_15_1954,
  ep_Q2_024_partial_15_1955,
  ep_Q2_024_partial_15_1956,
  ep_Q2_024_partial_15_1957,
  ep_Q2_024_partial_15_1958,
  ep_Q2_024_partial_15_1959,
  ep_Q2_024_partial_15_1960,
  ep_Q2_024_partial_15_1961,
  ep_Q2_024_partial_15_1962,
  ep_Q2_024_partial_15_1963,
  ep_Q2_024_partial_15_1964,
  ep_Q2_024_partial_15_1965,
  ep_Q2_024_partial_15_1966,
  ep_Q2_024_partial_15_1967,
  ep_Q2_024_partial_15_1968,
  ep_Q2_024_partial_15_1969,
  ep_Q2_024_partial_15_1970,
  ep_Q2_024_partial_15_1971,
  ep_Q2_024_partial_15_1972,
  ep_Q2_024_partial_15_1973,
  ep_Q2_024_partial_15_1974,
  ep_Q2_024_partial_15_1975,
  ep_Q2_024_partial_15_1976,
  ep_Q2_024_partial_15_1977,
  ep_Q2_024_partial_15_1978,
  ep_Q2_024_partial_15_1979,
  ep_Q2_024_partial_15_1980,
  ep_Q2_024_partial_15_1981,
  ep_Q2_024_partial_15_1982,
  ep_Q2_024_partial_15_1983,
  ep_Q2_024_partial_15_1984,
  ep_Q2_024_partial_15_1985,
  ep_Q2_024_partial_15_1986,
  ep_Q2_024_partial_15_1987,
  ep_Q2_024_partial_15_1988,
  ep_Q2_024_partial_15_1989,
  ep_Q2_024_partial_15_1990,
  ep_Q2_024_partial_15_1991,
  ep_Q2_024_partial_15_1992,
  ep_Q2_024_partial_15_1993,
  ep_Q2_024_partial_15_1994,
  ep_Q2_024_partial_15_1995,
  ep_Q2_024_partial_15_1996,
  ep_Q2_024_partial_15_1997,
  ep_Q2_024_partial_15_1998,
  ep_Q2_024_partial_15_1999
]

/-- Sum of partial products in this block. -/
def ep_Q2_024_block_15_1900_1999 : Poly :=
[
  term ((17274711230854056105691366194114834376504 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 1), (13, 1), (14, 1)],
  term ((1100547975157110694531583557203490843408 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((59578653046556248671257779700657601494300556013576894961 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(6, 1), (8, 1), (9, 1), (15, 1)],
  term ((-1082535559364413 : Rat) / 2325560442306386) [(6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 2)],
  term ((826234312473847036359224577053493689944 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (9, 2), (12, 1)],
  term ((163461953388582483772879444075215003796 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((103480180052064291471946029624641563616 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-13909582081310319744666275546148381035316213678867895466 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((5190312059653752 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((64969775860595452199616527648191718688832709263523546999 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((7967577350481122 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1204500949134928325919917600352187633208 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (11, 1), (12, 2), (13, 1)],
  term ((4373283040555244735964336602921559704927312631246897239 : Rat) / 92999895213201981850477343083626589746734642324746138) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-8946012999041558 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((4281559062224399926183251107007794259958 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((16283290118036559100125731609525651232 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((25987709137044587841957687030988015184 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((26841621936055949213170670398444521038477763179511543268 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1831849347941648 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((292587451625001337327242212297123189696 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((-53824762600716421491094410962189703401457332436241210747 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((7513834425399396 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((459605872589467395132898205219008568350671210667963567157 : Rat) / 8369990569188178366542960877526393077206117809227152420) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-8238281905398233 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-659245145371871234793179275591195206842375400820629068 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 1), (11, 1), (15, 3)],
  term ((273701211565968 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((-2858364389378608838764062023873769248962 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1), (11, 2)],
  term ((-174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (11, 2), (15, 2)],
  term ((-115944433813960 : Rat) / 1162780221153193) [(6, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((4524372082962373561504990707449466745786 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1), (12, 1)],
  term ((57282938508457199692400454260146274858348641708123719253 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1487647416800383 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1256437761322907405732853456048317766906757745647613173949 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((75522169147931209 : Rat) / 6976681326919158) [(6, 1), (8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((38102427306111387463084214076686460188 : Rat) / 30501087900062982116102377831259472915) [(6, 1), (8, 1), (12, 1), (13, 2)],
  term ((153430490654604813039780103924172074732 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (8, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1652695128300478652375073904873736949728 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (12, 1), (14, 1)],
  term ((-60613189104109889150602519961253961272330567250720564943 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((26961822669714766 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-260964897169297331495304441607119013362770740427838183521 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (8, 1), (12, 1), (15, 2)],
  term ((7314429299716121 : Rat) / 3488340663459579) [(6, 1), (8, 1), (12, 1), (15, 2), (16, 1)],
  term ((-77733965294047982849249561660849897517775764515577071069 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((4569079916135479 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((699598964377024284665984479369490528956 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (12, 2), (13, 2)],
  term ((917441215567441973698591233420584982763484800877141585 : Rat) / 46499947606600990925238671541813294873367321162373069) [(6, 1), (8, 1), (12, 2), (15, 2)],
  term ((-4344616805263220 : Rat) / 1162780221153193) [(6, 1), (8, 1), (12, 2), (15, 2), (16, 1)],
  term ((-3372968324111785565064740301738122917674488575207960182017 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((37451541547866803 : Rat) / 6976681326919158) [(6, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3300486847952719655074112935305363529555279002560296418 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((2083075535627416 : Rat) / 1162780221153193) [(6, 1), (8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((39917548597857942075629668229013981889838602187763015239 : Rat) / 1115998742558423782205728117003519076960815707896953656) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-557571936953549 : Rat) / 2325560442306386) [(6, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4976759947362561700591008818322780060033296103603165464 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (13, 1), (15, 3)],
  term ((1249107794586464 : Rat) / 1162780221153193) [(6, 1), (8, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2667489028545913897718123174678841611404 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (13, 2)],
  term ((9163340880738734192314631991194550172016 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (8, 1), (13, 2), (14, 1)],
  term ((-15910681050259042974401075197063467808 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (8, 1), (13, 2), (14, 2)],
  term ((19846603801094971681836921785403492035946502369064496832 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (8, 1), (13, 2), (15, 2)],
  term ((-4996431178345856 : Rat) / 1162780221153193) [(6, 1), (8, 1), (13, 2), (15, 2), (16, 1)],
  term ((207901673096356702735661496247904121472 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (13, 3), (15, 1)],
  term ((4091759393444761559299125549603354409744 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 1), (14, 1)],
  term ((7677996214056465788226486493702137612765108652994535477 : Rat) / 929998952132019818504773430836265897467346423247461380) [(6, 1), (8, 1), (14, 1), (15, 2)],
  term ((98423055706883929 : Rat) / 3488340663459579) [(6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-674456529895393409686477352003493571793009190155093372 : Rat) / 139499842819802972775716014625439884620101963487119207) [(6, 1), (8, 1), (14, 2), (15, 2)],
  term ((-1667935482081904 : Rat) / 1162780221153193) [(6, 1), (8, 1), (14, 2), (15, 2), (16, 1)],
  term ((-29465923472488313649372248813758280789818759793353336959 : Rat) / 371999580852807927401909372334506358986938569298984552) [(6, 1), (8, 1), (15, 2)],
  term ((47667903956803 : Rat) / 2325560442306386) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((2450530644229309358053245409118283634804 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 2), (9, 1), (11, 1)],
  term ((-826234312473847036359224577053493689944 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 2), (9, 1), (13, 1)],
  term ((50596331749013033533730977984407392584 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (8, 2), (11, 1), (12, 1), (13, 1)],
  term ((-4678910223116561885498892093094954879251581098910006897 : Rat) / 464999476066009909252386715418132948733673211623730690) [(6, 1), (8, 2), (11, 1), (12, 1), (15, 1)],
  term ((2292590409966194 : Rat) / 1162780221153193) [(6, 1), (8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-168987700368001651573028191564885626968 : Rat) / 119970945740247729656669352802953926799) [(6, 1), (8, 2), (11, 1), (13, 1)],
  term ((-177146052459990833086843034621145881016452606292749398931 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(6, 1), (8, 2), (11, 1), (15, 1)],
  term ((1082535559364413 : Rat) / 1162780221153193) [(6, 1), (8, 2), (11, 1), (15, 1), (16, 1)],
  term ((519790077507635364246714238454931580267528154182411463 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 2), (12, 1), (13, 1), (15, 1)],
  term ((-850957154578940 : Rat) / 1162780221153193) [(6, 1), (8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51916682732587159756343578366982608688 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 2), (12, 1), (13, 2)],
  term ((17802557703674574898150966956693859044702470319336631512 : Rat) / 232499738033004954626193357709066474366836605811865345) [(6, 1), (8, 2), (13, 1), (15, 1)],
  term ((-14004675550361608 : Rat) / 1162780221153193) [(6, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((338297069216136637229533571943439707592 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (8, 2), (13, 2)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(6, 1), (9, 1), (11, 1)],
  term ((-1172772155213159649649750686343780954248 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-349932281624983451981531254766853737984 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1352426172101182737185794737983768912 : Rat) / 39990315246749243218889784267651308933) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-32353000969407719280652367219495481640248766956944768212 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-231888867627920 : Rat) / 1162780221153193) [(6, 1), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((7987662086973295405733108726708264048 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 1), (11, 1), (12, 2)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((2287198027710290789522122661125941577582 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((3650245450007453707975303958143671482052 : Rat) / 199951576233746216094448921338256544665) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-3263930162338859576029516619877567171736 : Rat) / 599854728701238648283346764014769633995) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-19846603801094971681836921785403492035946502369064496832 : Rat) / 697499214099014863878580073127199423100509817435596035) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((4996431178345856 : Rat) / 1162780221153193) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8637355615427028052845683097057417188252 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((-550273987578555347265791778601745421704 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-59578653046556248671257779700657601494300556013576894961 : Rat) / 3719995808528079274019093723345063589869385692989845520) [(8, 1), (9, 1), (15, 1)],
  term ((1082535559364413 : Rat) / 4651120884612772) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((612632661057327339513311352279570908701 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2)],
  term ((-413117156236923518179612288526746844972 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (9, 2), (12, 1)],
  term ((-81730976694291241886439722037607501898 : Rat) / 39990315246749243218889784267651308933) [(8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-51740090026032145735973014812320781808 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((6954791040655159872333137773074190517658106839433947733 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2595156029826876 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64969775860595452199616527648191718688832709263523546999 : Rat) / 2789996856396059455514320292508797692402039269742384140) [(8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3983788675240561 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((602250474567464162959958800176093816604 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (12, 2), (13, 1)],
  term ((-4373283040555244735964336602921559704927312631246897239 : Rat) / 185999790426403963700954686167253179493469284649492276) [(8, 1), (11, 1), (12, 2), (15, 1)],
  term ((4473006499520779 : Rat) / 1162780221153193) [(8, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2140779531112199963091625553503897129979 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (11, 1), (13, 1)],
  term ((-8141645059018279550062865804762825616 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-12993854568522293920978843515494007592 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-13420810968027974606585335199222260519238881589755771634 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-915924673970824 : Rat) / 1162780221153193) [(8, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-146293725812500668663621106148561594848 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 1), (13, 2), (15, 1)],
  term ((53824762600716421491094410962189703401457332436241210747 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3756917212699698 : Rat) / 1162780221153193) [(8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1244189986840640425147752204580695015008324025900791366 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 1), (14, 2), (15, 1)],
  term ((312276948646616 : Rat) / 1162780221153193) [(8, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-459605872589467395132898205219008568350671210667963567157 : Rat) / 16739981138376356733085921755052786154412235618454304840) [(8, 1), (11, 1), (15, 1)],
  term ((8238281905398233 : Rat) / 2325560442306386) [(8, 1), (11, 1), (15, 1), (16, 1)],
  term ((329622572685935617396589637795597603421187700410314534 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 1), (11, 1), (15, 3)],
  term ((-136850605782984 : Rat) / 1162780221153193) [(8, 1), (11, 1), (15, 3), (16, 1)],
  term ((1429182194689304419382031011936884624481 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (11, 2)],
  term ((87483070406245862995382813691713434496 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (11, 2), (13, 1), (15, 1)],
  term ((8088250242351929820163091804873870410062191739236192053 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (11, 2), (15, 2)],
  term ((57972216906980 : Rat) / 1162780221153193) [(8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2262186041481186780752495353724733372893 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (12, 1)],
  term ((-57282938508457199692400454260146274858348641708123719253 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1487647416800383 : Rat) / 2325560442306386) [(8, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1256437761322907405732853456048317766906757745647613173949 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-75522169147931209 : Rat) / 13953362653838316) [(8, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19051213653055693731542107038343230094 : Rat) / 30501087900062982116102377831259472915) [(8, 1), (12, 1), (13, 2)],
  term ((-76715245327302406519890051962086037366 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (12, 1), (13, 2), (14, 1)],
  term ((826347564150239326187536952436868474864 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 1), (14, 1)],
  term ((60613189104109889150602519961253961272330567250720564943 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-13480911334857383 : Rat) / 1162780221153193) [(8, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((260964897169297331495304441607119013362770740427838183521 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (12, 1), (15, 2)],
  term ((-7314429299716121 : Rat) / 6976681326919158) [(8, 1), (12, 1), (15, 2), (16, 1)],
  term ((77733965294047982849249561660849897517775764515577071069 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-4569079916135479 : Rat) / 2325560442306386) [(8, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-349799482188512142332992239684745264478 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (12, 2), (13, 2)],
  term ((-917441215567441973698591233420584982763484800877141585 : Rat) / 92999895213201981850477343083626589746734642324746138) [(8, 1), (12, 2), (15, 2)],
  term ((2172308402631610 : Rat) / 1162780221153193) [(8, 1), (12, 2), (15, 2), (16, 1)],
  term ((3372968324111785565064740301738122917674488575207960182017 : Rat) / 33479962276752713466171843510105572308824471236908609680) [(8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-37451541547866803 : Rat) / 13953362653838316) [(8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1650243423976359827537056467652681764777639501280148209 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1041537767813708 : Rat) / 1162780221153193) [(8, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-39917548597857942075629668229013981889838602187763015239 : Rat) / 2231997485116847564411456234007038153921631415793907312) [(8, 1), (13, 1), (15, 1)],
  term ((557571936953549 : Rat) / 4651120884612772) [(8, 1), (13, 1), (15, 1), (16, 1)],
  term ((2488379973681280850295504409161390030016648051801582732 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 1), (15, 3)],
  term ((-624553897293232 : Rat) / 1162780221153193) [(8, 1), (13, 1), (15, 3), (16, 1)],
  term ((1333744514272956948859061587339420805702 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 2)],
  term ((-4581670440369367096157315995597275086008 : Rat) / 1799564186103715944850040292044308901985) [(8, 1), (13, 2), (14, 1)],
  term ((7955340525129521487200537598531733904 : Rat) / 199951576233746216094448921338256544665) [(8, 1), (13, 2), (14, 2)],
  term ((-9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(8, 1), (13, 2), (15, 2)],
  term ((2498215589172928 : Rat) / 1162780221153193) [(8, 1), (13, 2), (15, 2), (16, 1)],
  term ((-103950836548178351367830748123952060736 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (13, 3), (15, 1)],
  term ((-2045879696722380779649562774801677204872 : Rat) / 599854728701238648283346764014769633995) [(8, 1), (14, 1)],
  term ((-7677996214056465788226486493702137612765108652994535477 : Rat) / 1859997904264039637009546861672531794934692846494922760) [(8, 1), (14, 1), (15, 2)],
  term ((-98423055706883929 : Rat) / 6976681326919158) [(8, 1), (14, 1), (15, 2), (16, 1)],
  term ((337228264947696704843238676001746785896504595077546686 : Rat) / 139499842819802972775716014625439884620101963487119207) [(8, 1), (14, 2), (15, 2)],
  term ((833967741040952 : Rat) / 1162780221153193) [(8, 1), (14, 2), (15, 2), (16, 1)],
  term ((29465923472488313649372248813758280789818759793353336959 : Rat) / 743999161705615854803818744669012717973877138597969104) [(8, 1), (15, 2)],
  term ((-47667903956803 : Rat) / 4651120884612772) [(8, 1), (15, 2), (16, 1)],
  term ((-1225265322114654679026622704559141817402 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (11, 1)],
  term ((413117156236923518179612288526746844972 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (9, 1), (13, 1)],
  term ((-25298165874506516766865488992203696292 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (11, 1), (12, 1), (13, 1)],
  term ((4678910223116561885498892093094954879251581098910006897 : Rat) / 929998952132019818504773430836265897467346423247461380) [(8, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1146295204983097 : Rat) / 1162780221153193) [(8, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((84493850184000825786514095782442813484 : Rat) / 119970945740247729656669352802953926799) [(8, 2), (11, 1), (13, 1)],
  term ((177146052459990833086843034621145881016452606292749398931 : Rat) / 5579993712792118911028640585017595384804078539484768280) [(8, 2), (11, 1), (15, 1)],
  term ((-1082535559364413 : Rat) / 2325560442306386) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-519790077507635364246714238454931580267528154182411463 : Rat) / 464999476066009909252386715418132948733673211623730690) [(8, 2), (12, 1), (13, 1), (15, 1)],
  term ((425478577289470 : Rat) / 1162780221153193) [(8, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((25958341366293579878171789183491304344 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (12, 1), (13, 2)],
  term ((-8901278851837287449075483478346929522351235159668315756 : Rat) / 232499738033004954626193357709066474366836605811865345) [(8, 2), (13, 1), (15, 1)],
  term ((7002337775180804 : Rat) / 1162780221153193) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-169148534608068318614766785971719853796 : Rat) / 599854728701238648283346764014769633995) [(8, 2), (13, 2)],
  term ((-1429182194689304419382031011936884624481 : Rat) / 3599128372207431889700080584088617803970) [(9, 1), (11, 1)],
  term ((586386077606579824824875343171890477124 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 1)],
  term ((174966140812491725990765627383426868992 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((676213086050591368592897368991884456 : Rat) / 39990315246749243218889784267651308933) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((16176500484703859640326183609747740820124383478472384106 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((115944433813960 : Rat) / 1162780221153193) [(9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3993831043486647702866554363354132024 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (11, 1), (12, 2)],
  term ((-43741535203122931497691406845856717248 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8088250242351929820163091804873870410062191739236192053 : Rat) / 1394998428198029727757160146254398846201019634871192070) [(9, 1), (11, 1), (15, 2)],
  term ((-28986108453490 : Rat) / 1162780221153193) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1143599013855145394761061330562970788791 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1)],
  term ((-1825122725003726853987651979071835741026 : Rat) / 199951576233746216094448921338256544665) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1631965081169429788014758309938783585868 : Rat) / 599854728701238648283346764014769633995) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((9923301900547485840918460892701746017973251184532248416 : Rat) / 697499214099014863878580073127199423100509817435596035) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2498215589172928 : Rat) / 1162780221153193) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 15, terms 1900 through 1999. -/
theorem ep_Q2_024_block_15_1900_1999_valid :
    checkProductSumEq ep_Q2_024_partials_15_1900_1999
      ep_Q2_024_block_15_1900_1999 = true := by
  native_decide

end EpQ2024TermShards

end Patterns

end EndpointCertificate

end Problem97
