/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 27:900-999

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_27_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0900 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 1385912907228352718) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 900 for generator 27. -/
def ep_Q2_008_partial_27_0900 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 1385912907228352718) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 27. -/
theorem ep_Q2_008_partial_27_0900_valid :
    mulPoly ep_Q2_008_coefficient_27_0900
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0901 : Poly :=
[
  term ((-6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 901 for generator 27. -/
def ep_Q2_008_partial_27_0901 : Poly :=
[
  term ((6098673174484334416052054853830400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 27. -/
theorem ep_Q2_008_partial_27_0901_valid :
    mulPoly ep_Q2_008_coefficient_27_0901
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0902 : Poly :=
[
  term ((2437831289139806774469490815688416000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 902 for generator 27. -/
def ep_Q2_008_partial_27_0902 : Poly :=
[
  term ((4875662578279613548938981631376832000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2437831289139806774469490815688416000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 27. -/
theorem ep_Q2_008_partial_27_0902_valid :
    mulPoly ep_Q2_008_coefficient_27_0902
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0903 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 903 for generator 27. -/
def ep_Q2_008_partial_27_0903 : Poly :=
[
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 27. -/
theorem ep_Q2_008_partial_27_0903_valid :
    mulPoly ep_Q2_008_coefficient_27_0903
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0904 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 904 for generator 27. -/
def ep_Q2_008_partial_27_0904 : Poly :=
[
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 27. -/
theorem ep_Q2_008_partial_27_0904_valid :
    mulPoly ep_Q2_008_coefficient_27_0904
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0905 : Poly :=
[
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 905 for generator 27. -/
def ep_Q2_008_partial_27_0905 : Poly :=
[
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 27. -/
theorem ep_Q2_008_partial_27_0905_valid :
    mulPoly ep_Q2_008_coefficient_27_0905
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0906 : Poly :=
[
  term ((-77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 906 for generator 27. -/
def ep_Q2_008_partial_27_0906 : Poly :=
[
  term ((-154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 27. -/
theorem ep_Q2_008_partial_27_0906_valid :
    mulPoly ep_Q2_008_coefficient_27_0906
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0907 : Poly :=
[
  term ((1663203050321205018 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 907 for generator 27. -/
def ep_Q2_008_partial_27_0907 : Poly :=
[
  term ((3326406100642410036 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1663203050321205018 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 27. -/
theorem ep_Q2_008_partial_27_0907_valid :
    mulPoly ep_Q2_008_coefficient_27_0907
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0908 : Poly :=
[
  term ((-1210952366020880244172726002886060800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 908 for generator 27. -/
def ep_Q2_008_partial_27_0908 : Poly :=
[
  term ((1210952366020880244172726002886060800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2421904732041760488345452005772121600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 27. -/
theorem ep_Q2_008_partial_27_0908_valid :
    mulPoly ep_Q2_008_coefficient_27_0908
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0909 : Poly :=
[
  term ((-605476183010440122086363001443030400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 909 for generator 27. -/
def ep_Q2_008_partial_27_0909 : Poly :=
[
  term ((-1210952366020880244172726002886060800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((605476183010440122086363001443030400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 27. -/
theorem ep_Q2_008_partial_27_0909_valid :
    mulPoly ep_Q2_008_coefficient_27_0909
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0910 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 910 for generator 27. -/
def ep_Q2_008_partial_27_0910 : Poly :=
[
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 27. -/
theorem ep_Q2_008_partial_27_0910_valid :
    mulPoly ep_Q2_008_coefficient_27_0910
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0911 : Poly :=
[
  term ((-364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 911 for generator 27. -/
def ep_Q2_008_partial_27_0911 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 27. -/
theorem ep_Q2_008_partial_27_0911_valid :
    mulPoly ep_Q2_008_coefficient_27_0911
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0912 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 912 for generator 27. -/
def ep_Q2_008_partial_27_0912 : Poly :=
[
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 27. -/
theorem ep_Q2_008_partial_27_0912_valid :
    mulPoly ep_Q2_008_coefficient_27_0912
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0913 : Poly :=
[
  term ((-3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 913 for generator 27. -/
def ep_Q2_008_partial_27_0913 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 27. -/
theorem ep_Q2_008_partial_27_0913_valid :
    mulPoly ep_Q2_008_coefficient_27_0913
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0914 : Poly :=
[
  term ((103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 914 for generator 27. -/
def ep_Q2_008_partial_27_0914 : Poly :=
[
  term ((-103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((206008602463486280870703186254553600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 27. -/
theorem ep_Q2_008_partial_27_0914_valid :
    mulPoly ep_Q2_008_coefficient_27_0914
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0915 : Poly :=
[
  term ((-3204759772220949495 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 915 for generator 27. -/
def ep_Q2_008_partial_27_0915 : Poly :=
[
  term ((3204759772220949495 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-3204759772220949495 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 27. -/
theorem ep_Q2_008_partial_27_0915_valid :
    mulPoly ep_Q2_008_coefficient_27_0915
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0916 : Poly :=
[
  term ((51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 916 for generator 27. -/
def ep_Q2_008_partial_27_0916 : Poly :=
[
  term ((103004301231743140435351593127276800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 27. -/
theorem ep_Q2_008_partial_27_0916_valid :
    mulPoly ep_Q2_008_coefficient_27_0916
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0917 : Poly :=
[
  term ((-3204759772220949495 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 917 for generator 27. -/
def ep_Q2_008_partial_27_0917 : Poly :=
[
  term ((-3204759772220949495 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((3204759772220949495 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 27. -/
theorem ep_Q2_008_partial_27_0917_valid :
    mulPoly ep_Q2_008_coefficient_27_0917
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0918 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 918 for generator 27. -/
def ep_Q2_008_partial_27_0918 : Poly :=
[
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 27. -/
theorem ep_Q2_008_partial_27_0918_valid :
    mulPoly ep_Q2_008_coefficient_27_0918
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0919 : Poly :=
[
  term ((82136876462536256671818072104236800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 919 for generator 27. -/
def ep_Q2_008_partial_27_0919 : Poly :=
[
  term ((164273752925072513343636144208473600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82136876462536256671818072104236800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 27. -/
theorem ep_Q2_008_partial_27_0919_valid :
    mulPoly ep_Q2_008_coefficient_27_0919
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0920 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 920 for generator 27. -/
def ep_Q2_008_partial_27_0920 : Poly :=
[
  term ((203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 27. -/
theorem ep_Q2_008_partial_27_0920_valid :
    mulPoly ep_Q2_008_coefficient_27_0920
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0921 : Poly :=
[
  term ((-101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 921 for generator 27. -/
def ep_Q2_008_partial_27_0921 : Poly :=
[
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 27. -/
theorem ep_Q2_008_partial_27_0921_valid :
    mulPoly ep_Q2_008_coefficient_27_0921
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0922 : Poly :=
[
  term ((-48291259772351672296641767683641600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 922 for generator 27. -/
def ep_Q2_008_partial_27_0922 : Poly :=
[
  term ((48291259772351672296641767683641600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-96582519544703344593283535367283200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 27. -/
theorem ep_Q2_008_partial_27_0922_valid :
    mulPoly ep_Q2_008_coefficient_27_0922
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0923 : Poly :=
[
  term ((-24145629886175836148320883841820800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 923 for generator 27. -/
def ep_Q2_008_partial_27_0923 : Poly :=
[
  term ((-48291259772351672296641767683641600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((24145629886175836148320883841820800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 27. -/
theorem ep_Q2_008_partial_27_0923_valid :
    mulPoly ep_Q2_008_coefficient_27_0923
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0924 : Poly :=
[
  term ((2315326633528356000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 924 for generator 27. -/
def ep_Q2_008_partial_27_0924 : Poly :=
[
  term ((4630653267056712000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 27. -/
theorem ep_Q2_008_partial_27_0924_valid :
    mulPoly ep_Q2_008_coefficient_27_0924
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0925 : Poly :=
[
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 925 for generator 27. -/
def ep_Q2_008_partial_27_0925 : Poly :=
[
  term ((2315326633528356000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 27. -/
theorem ep_Q2_008_partial_27_0925_valid :
    mulPoly ep_Q2_008_coefficient_27_0925
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0926 : Poly :=
[
  term ((-1157663316764178000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 926 for generator 27. -/
def ep_Q2_008_partial_27_0926 : Poly :=
[
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((1157663316764178000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 27. -/
theorem ep_Q2_008_partial_27_0926_valid :
    mulPoly ep_Q2_008_coefficient_27_0926
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0927 : Poly :=
[
  term ((4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 927 for generator 27. -/
def ep_Q2_008_partial_27_0927 : Poly :=
[
  term ((9849163696472928763174326464201700902400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 27. -/
theorem ep_Q2_008_partial_27_0927_valid :
    mulPoly ep_Q2_008_coefficient_27_0927
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0928 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 928 for generator 27. -/
def ep_Q2_008_partial_27_0928 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 27. -/
theorem ep_Q2_008_partial_27_0928_valid :
    mulPoly ep_Q2_008_coefficient_27_0928
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0929 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 929 for generator 27. -/
def ep_Q2_008_partial_27_0929 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 27. -/
theorem ep_Q2_008_partial_27_0929_valid :
    mulPoly ep_Q2_008_coefficient_27_0929
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0930 : Poly :=
[
  term ((26797761962133750 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 930 for generator 27. -/
def ep_Q2_008_partial_27_0930 : Poly :=
[
  term ((-26797761962133750 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 27. -/
theorem ep_Q2_008_partial_27_0930_valid :
    mulPoly ep_Q2_008_coefficient_27_0930
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0931 : Poly :=
[
  term ((4371704643222131625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 931 for generator 27. -/
def ep_Q2_008_partial_27_0931 : Poly :=
[
  term ((4371704643222131625 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-4371704643222131625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 27. -/
theorem ep_Q2_008_partial_27_0931_valid :
    mulPoly ep_Q2_008_coefficient_27_0931
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0932 : Poly :=
[
  term ((-3018157220908071892679857993109532614400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 932 for generator 27. -/
def ep_Q2_008_partial_27_0932 : Poly :=
[
  term ((3018157220908071892679857993109532614400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6036314441816143785359715986219065228800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 27. -/
theorem ep_Q2_008_partial_27_0932_valid :
    mulPoly ep_Q2_008_coefficient_27_0932
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0933 : Poly :=
[
  term ((-1509078610454035946339928996554766307200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 933 for generator 27. -/
def ep_Q2_008_partial_27_0933 : Poly :=
[
  term ((-3018157220908071892679857993109532614400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1509078610454035946339928996554766307200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 27. -/
theorem ep_Q2_008_partial_27_0933_valid :
    mulPoly ep_Q2_008_coefficient_27_0933
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0934 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 934 for generator 27. -/
def ep_Q2_008_partial_27_0934 : Poly :=
[
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 27. -/
theorem ep_Q2_008_partial_27_0934_valid :
    mulPoly ep_Q2_008_coefficient_27_0934
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0935 : Poly :=
[
  term ((-2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 935 for generator 27. -/
def ep_Q2_008_partial_27_0935 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 27. -/
theorem ep_Q2_008_partial_27_0935_valid :
    mulPoly ep_Q2_008_coefficient_27_0935
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0936 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 936 for generator 27. -/
def ep_Q2_008_partial_27_0936 : Poly :=
[
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 27. -/
theorem ep_Q2_008_partial_27_0936_valid :
    mulPoly ep_Q2_008_coefficient_27_0936
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0937 : Poly :=
[
  term ((-197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 937 for generator 27. -/
def ep_Q2_008_partial_27_0937 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 27. -/
theorem ep_Q2_008_partial_27_0937_valid :
    mulPoly ep_Q2_008_coefficient_27_0937
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0938 : Poly :=
[
  term ((-96462593372687625 : Rat) / 47790100249253542) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 938 for generator 27. -/
def ep_Q2_008_partial_27_0938 : Poly :=
[
  term ((96462593372687625 : Rat) / 47790100249253542) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-96462593372687625 : Rat) / 23895050124626771) [(3, 1), (6, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 27. -/
theorem ep_Q2_008_partial_27_0938_valid :
    mulPoly ep_Q2_008_coefficient_27_0938
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0939 : Poly :=
[
  term ((-3011797303505011125 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 939 for generator 27. -/
def ep_Q2_008_partial_27_0939 : Poly :=
[
  term ((-3011797303505011125 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((3011797303505011125 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 27. -/
theorem ep_Q2_008_partial_27_0939_valid :
    mulPoly ep_Q2_008_coefficient_27_0939
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0940 : Poly :=
[
  term ((7995170523765116349 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 940 for generator 27. -/
def ep_Q2_008_partial_27_0940 : Poly :=
[
  term ((-7995170523765116349 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 27. -/
theorem ep_Q2_008_partial_27_0940_valid :
    mulPoly ep_Q2_008_coefficient_27_0940
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0941 : Poly :=
[
  term ((141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 941 for generator 27. -/
def ep_Q2_008_partial_27_0941 : Poly :=
[
  term ((282294956092783746240896013594526464000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 27. -/
theorem ep_Q2_008_partial_27_0941_valid :
    mulPoly ep_Q2_008_coefficient_27_0941
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0942 : Poly :=
[
  term ((-27279832927703925129 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 942 for generator 27. -/
def ep_Q2_008_partial_27_0942 : Poly :=
[
  term ((-27279832927703925129 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((27279832927703925129 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 27. -/
theorem ep_Q2_008_partial_27_0942_valid :
    mulPoly ep_Q2_008_coefficient_27_0942
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0943 : Poly :=
[
  term ((4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 943 for generator 27. -/
def ep_Q2_008_partial_27_0943 : Poly :=
[
  term ((8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 27. -/
theorem ep_Q2_008_partial_27_0943_valid :
    mulPoly ep_Q2_008_coefficient_27_0943
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0944 : Poly :=
[
  term ((-1086908812529704210324287413335995211982121 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 944 for generator 27. -/
def ep_Q2_008_partial_27_0944 : Poly :=
[
  term ((1086908812529704210324287413335995211982121 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1086908812529704210324287413335995211982121 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 27. -/
theorem ep_Q2_008_partial_27_0944_valid :
    mulPoly ep_Q2_008_coefficient_27_0944
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0945 : Poly :=
[
  term ((1369929568110616053651709693145731702023321 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 945 for generator 27. -/
def ep_Q2_008_partial_27_0945 : Poly :=
[
  term ((1369929568110616053651709693145731702023321 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1369929568110616053651709693145731702023321 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 27. -/
theorem ep_Q2_008_partial_27_0945_valid :
    mulPoly ep_Q2_008_coefficient_27_0945
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0946 : Poly :=
[
  term ((-5428749155630456658478769492202432000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 946 for generator 27. -/
def ep_Q2_008_partial_27_0946 : Poly :=
[
  term ((5428749155630456658478769492202432000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10857498311260913316957538984404864000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 27. -/
theorem ep_Q2_008_partial_27_0946_valid :
    mulPoly ep_Q2_008_coefficient_27_0946
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0947 : Poly :=
[
  term ((7606836130242498228 : Rat) / 692956453614176359) [(3, 1), (6, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 947 for generator 27. -/
def ep_Q2_008_partial_27_0947 : Poly :=
[
  term ((-7606836130242498228 : Rat) / 692956453614176359) [(3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((15213672260484996456 : Rat) / 692956453614176359) [(3, 1), (6, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 27. -/
theorem ep_Q2_008_partial_27_0947_valid :
    mulPoly ep_Q2_008_coefficient_27_0947
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0948 : Poly :=
[
  term ((-2714374577815228329239384746101216000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 948 for generator 27. -/
def ep_Q2_008_partial_27_0948 : Poly :=
[
  term ((-5428749155630456658478769492202432000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2714374577815228329239384746101216000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 27. -/
theorem ep_Q2_008_partial_27_0948_valid :
    mulPoly ep_Q2_008_coefficient_27_0948
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0949 : Poly :=
[
  term ((3803418065121249114 : Rat) / 692956453614176359) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

/-- Partial product 949 for generator 27. -/
def ep_Q2_008_partial_27_0949 : Poly :=
[
  term ((7606836130242498228 : Rat) / 692956453614176359) [(3, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3803418065121249114 : Rat) / 692956453614176359) [(3, 1), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 27. -/
theorem ep_Q2_008_partial_27_0949_valid :
    mulPoly ep_Q2_008_coefficient_27_0949
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0950 : Poly :=
[
  term ((-3593024538216133469108624951538698726400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 950 for generator 27. -/
def ep_Q2_008_partial_27_0950 : Poly :=
[
  term ((3593024538216133469108624951538698726400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-7186049076432266938217249903077397452800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 27. -/
theorem ep_Q2_008_partial_27_0950_valid :
    mulPoly ep_Q2_008_coefficient_27_0950
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0951 : Poly :=
[
  term ((-1796512269108066734554312475769349363200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 951 for generator 27. -/
def ep_Q2_008_partial_27_0951 : Poly :=
[
  term ((-3593024538216133469108624951538698726400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1796512269108066734554312475769349363200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 27. -/
theorem ep_Q2_008_partial_27_0951_valid :
    mulPoly ep_Q2_008_coefficient_27_0951
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0952 : Poly :=
[
  term ((-408607130084278739473284536518054318285157 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 952 for generator 27. -/
def ep_Q2_008_partial_27_0952 : Poly :=
[
  term ((408607130084278739473284536518054318285157 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-408607130084278739473284536518054318285157 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 27. -/
theorem ep_Q2_008_partial_27_0952_valid :
    mulPoly ep_Q2_008_coefficient_27_0952
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0953 : Poly :=
[
  term ((-338066622431790776753647284392756794927157 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 953 for generator 27. -/
def ep_Q2_008_partial_27_0953 : Poly :=
[
  term ((-338066622431790776753647284392756794927157 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((338066622431790776753647284392756794927157 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 27. -/
theorem ep_Q2_008_partial_27_0953_valid :
    mulPoly ep_Q2_008_coefficient_27_0953
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0954 : Poly :=
[
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 954 for generator 27. -/
def ep_Q2_008_partial_27_0954 : Poly :=
[
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 27. -/
theorem ep_Q2_008_partial_27_0954_valid :
    mulPoly ep_Q2_008_coefficient_27_0954
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0955 : Poly :=
[
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 955 for generator 27. -/
def ep_Q2_008_partial_27_0955 : Poly :=
[
  term ((7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 27. -/
theorem ep_Q2_008_partial_27_0955_valid :
    mulPoly ep_Q2_008_coefficient_27_0955
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0956 : Poly :=
[
  term ((-3635567520608600725234339848468866939100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 1), (16, 1)]
]

/-- Partial product 956 for generator 27. -/
def ep_Q2_008_partial_27_0956 : Poly :=
[
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((3635567520608600725234339848468866939100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 27. -/
theorem ep_Q2_008_partial_27_0956_valid :
    mulPoly ep_Q2_008_coefficient_27_0956
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0957 : Poly :=
[
  term ((10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 957 for generator 27. -/
def ep_Q2_008_partial_27_0957 : Poly :=
[
  term ((21609715246264656000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 27. -/
theorem ep_Q2_008_partial_27_0957_valid :
    mulPoly ep_Q2_008_coefficient_27_0957
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0958 : Poly :=
[
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 958 for generator 27. -/
def ep_Q2_008_partial_27_0958 : Poly :=
[
  term ((5402428811566164000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 27. -/
theorem ep_Q2_008_partial_27_0958_valid :
    mulPoly ep_Q2_008_coefficient_27_0958
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0959 : Poly :=
[
  term ((-2701214405783082000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 959 for generator 27. -/
def ep_Q2_008_partial_27_0959 : Poly :=
[
  term ((-5402428811566164000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (14, 1), (16, 1)],
  term ((2701214405783082000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 27. -/
theorem ep_Q2_008_partial_27_0959_valid :
    mulPoly ep_Q2_008_coefficient_27_0959
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0960 : Poly :=
[
  term ((19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 960 for generator 27. -/
def ep_Q2_008_partial_27_0960 : Poly :=
[
  term ((38116429709913792000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 27. -/
theorem ep_Q2_008_partial_27_0960_valid :
    mulPoly ep_Q2_008_coefficient_27_0960
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0961 : Poly :=
[
  term ((1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 961 for generator 27. -/
def ep_Q2_008_partial_27_0961 : Poly :=
[
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 27. -/
theorem ep_Q2_008_partial_27_0961_valid :
    mulPoly ep_Q2_008_coefficient_27_0961
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0962 : Poly :=
[
  term ((2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 962 for generator 27. -/
def ep_Q2_008_partial_27_0962 : Poly :=
[
  term ((4908845061293746365060287226925842432000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 27. -/
theorem ep_Q2_008_partial_27_0962_valid :
    mulPoly ep_Q2_008_coefficient_27_0962
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0963 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 963 for generator 27. -/
def ep_Q2_008_partial_27_0963 : Poly :=
[
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 27. -/
theorem ep_Q2_008_partial_27_0963_valid :
    mulPoly ep_Q2_008_coefficient_27_0963
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0964 : Poly :=
[
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 964 for generator 27. -/
def ep_Q2_008_partial_27_0964 : Poly :=
[
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 27. -/
theorem ep_Q2_008_partial_27_0964_valid :
    mulPoly ep_Q2_008_coefficient_27_0964
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0965 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 965 for generator 27. -/
def ep_Q2_008_partial_27_0965 : Poly :=
[
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 27. -/
theorem ep_Q2_008_partial_27_0965_valid :
    mulPoly ep_Q2_008_coefficient_27_0965
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0966 : Poly :=
[
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 966 for generator 27. -/
def ep_Q2_008_partial_27_0966 : Poly :=
[
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 27. -/
theorem ep_Q2_008_partial_27_0966_valid :
    mulPoly ep_Q2_008_coefficient_27_0966
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0967 : Poly :=
[
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 967 for generator 27. -/
def ep_Q2_008_partial_27_0967 : Poly :=
[
  term ((1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 27. -/
theorem ep_Q2_008_partial_27_0967_valid :
    mulPoly ep_Q2_008_coefficient_27_0967
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0968 : Poly :=
[
  term ((-613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 968 for generator 27. -/
def ep_Q2_008_partial_27_0968 : Poly :=
[
  term ((-1227211265323436591265071806731460608000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 27. -/
theorem ep_Q2_008_partial_27_0968_valid :
    mulPoly ep_Q2_008_coefficient_27_0968
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0969 : Poly :=
[
  term ((1870646269628582541968680547539840800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 969 for generator 27. -/
def ep_Q2_008_partial_27_0969 : Poly :=
[
  term ((-1870646269628582541968680547539840800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3741292539257165083937361095079681600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 27. -/
theorem ep_Q2_008_partial_27_0969_valid :
    mulPoly ep_Q2_008_coefficient_27_0969
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0970 : Poly :=
[
  term ((234677815067677921596603159357396728309715 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 970 for generator 27. -/
def ep_Q2_008_partial_27_0970 : Poly :=
[
  term ((469355630135355843193206318714793456619430 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-234677815067677921596603159357396728309715 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 27. -/
theorem ep_Q2_008_partial_27_0970_valid :
    mulPoly ep_Q2_008_coefficient_27_0970
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0971 : Poly :=
[
  term ((-1228911814177087975102115497753632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 971 for generator 27. -/
def ep_Q2_008_partial_27_0971 : Poly :=
[
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1228911814177087975102115497753632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 27. -/
theorem ep_Q2_008_partial_27_0971_valid :
    mulPoly ep_Q2_008_coefficient_27_0971
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0972 : Poly :=
[
  term ((-4014328837908197853 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 972 for generator 27. -/
def ep_Q2_008_partial_27_0972 : Poly :=
[
  term ((4014328837908197853 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4014328837908197853 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 27. -/
theorem ep_Q2_008_partial_27_0972_valid :
    mulPoly ep_Q2_008_coefficient_27_0972
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0973 : Poly :=
[
  term ((36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 973 for generator 27. -/
def ep_Q2_008_partial_27_0973 : Poly :=
[
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 27. -/
theorem ep_Q2_008_partial_27_0973_valid :
    mulPoly ep_Q2_008_coefficient_27_0973
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0974 : Poly :=
[
  term ((-3284450867379434607 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 974 for generator 27. -/
def ep_Q2_008_partial_27_0974 : Poly :=
[
  term ((-3284450867379434607 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((3284450867379434607 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 27. -/
theorem ep_Q2_008_partial_27_0974_valid :
    mulPoly ep_Q2_008_coefficient_27_0974
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0975 : Poly :=
[
  term ((-20277044933921951589184905712934928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 975 for generator 27. -/
def ep_Q2_008_partial_27_0975 : Poly :=
[
  term ((20277044933921951589184905712934928000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 27. -/
theorem ep_Q2_008_partial_27_0975_valid :
    mulPoly ep_Q2_008_coefficient_27_0975
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0976 : Poly :=
[
  term ((-16590309491390687663878559219674032000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 976 for generator 27. -/
def ep_Q2_008_partial_27_0976 : Poly :=
[
  term ((-33180618982781375327757118439348064000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((16590309491390687663878559219674032000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 27. -/
theorem ep_Q2_008_partial_27_0976_valid :
    mulPoly ep_Q2_008_coefficient_27_0976
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0977 : Poly :=
[
  term ((-3355616531435365018103696848382400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 977 for generator 27. -/
def ep_Q2_008_partial_27_0977 : Poly :=
[
  term ((3355616531435365018103696848382400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-6711233062870730036207393696764800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 27. -/
theorem ep_Q2_008_partial_27_0977_valid :
    mulPoly ep_Q2_008_coefficient_27_0977
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0978 : Poly :=
[
  term ((21752309342453721441 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 978 for generator 27. -/
def ep_Q2_008_partial_27_0978 : Poly :=
[
  term ((-21752309342453721441 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((21752309342453721441 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 27. -/
theorem ep_Q2_008_partial_27_0978_valid :
    mulPoly ep_Q2_008_coefficient_27_0978
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0979 : Poly :=
[
  term ((-14812419366592529148707601930330784396701 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 979 for generator 27. -/
def ep_Q2_008_partial_27_0979 : Poly :=
[
  term ((-14812419366592529148707601930330784396701 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((14812419366592529148707601930330784396701 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 27. -/
theorem ep_Q2_008_partial_27_0979_valid :
    mulPoly ep_Q2_008_coefficient_27_0979
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0980 : Poly :=
[
  term ((-42172140613600091619 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 980 for generator 27. -/
def ep_Q2_008_partial_27_0980 : Poly :=
[
  term ((-42172140613600091619 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((42172140613600091619 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 27. -/
theorem ep_Q2_008_partial_27_0980_valid :
    mulPoly ep_Q2_008_coefficient_27_0980
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0981 : Poly :=
[
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 981 for generator 27. -/
def ep_Q2_008_partial_27_0981 : Poly :=
[
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 27. -/
theorem ep_Q2_008_partial_27_0981_valid :
    mulPoly ep_Q2_008_coefficient_27_0981
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0982 : Poly :=
[
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 2), (16, 1)]
]

/-- Partial product 982 for generator 27. -/
def ep_Q2_008_partial_27_0982 : Poly :=
[
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 27. -/
theorem ep_Q2_008_partial_27_0982_valid :
    mulPoly ep_Q2_008_coefficient_27_0982
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0983 : Poly :=
[
  term ((-65541364857776115854677939579300413962004 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 983 for generator 27. -/
def ep_Q2_008_partial_27_0983 : Poly :=
[
  term ((65541364857776115854677939579300413962004 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-131082729715552231709355879158600827924008 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 27. -/
theorem ep_Q2_008_partial_27_0983_valid :
    mulPoly ep_Q2_008_coefficient_27_0983
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0984 : Poly :=
[
  term ((-32770682428888057927338969789650206981002 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 984 for generator 27. -/
def ep_Q2_008_partial_27_0984 : Poly :=
[
  term ((-65541364857776115854677939579300413962004 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((32770682428888057927338969789650206981002 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 27. -/
theorem ep_Q2_008_partial_27_0984_valid :
    mulPoly ep_Q2_008_coefficient_27_0984
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0985 : Poly :=
[
  term ((-9831294513416703800816923982029056000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 985 for generator 27. -/
def ep_Q2_008_partial_27_0985 : Poly :=
[
  term ((9831294513416703800816923982029056000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-19662589026833407601633847964058112000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 27. -/
theorem ep_Q2_008_partial_27_0985_valid :
    mulPoly ep_Q2_008_coefficient_27_0985
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0986 : Poly :=
[
  term ((-2554572896850671361 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 986 for generator 27. -/
def ep_Q2_008_partial_27_0986 : Poly :=
[
  term ((2554572896850671361 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((-2554572896850671361 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 27. -/
theorem ep_Q2_008_partial_27_0986_valid :
    mulPoly ep_Q2_008_coefficient_27_0986
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0987 : Poly :=
[
  term ((-4915647256708351900408461991014528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 987 for generator 27. -/
def ep_Q2_008_partial_27_0987 : Poly :=
[
  term ((-9831294513416703800816923982029056000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((4915647256708351900408461991014528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 27. -/
theorem ep_Q2_008_partial_27_0987_valid :
    mulPoly ep_Q2_008_coefficient_27_0987
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0988 : Poly :=
[
  term ((-2554572896850671361 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 988 for generator 27. -/
def ep_Q2_008_partial_27_0988 : Poly :=
[
  term ((-2554572896850671361 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (13, 2), (14, 1), (16, 1)],
  term ((2554572896850671361 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 27. -/
theorem ep_Q2_008_partial_27_0988_valid :
    mulPoly ep_Q2_008_coefficient_27_0988
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0989 : Poly :=
[
  term ((-12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 989 for generator 27. -/
def ep_Q2_008_partial_27_0989 : Poly :=
[
  term ((12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-25807148097718847477144425452826272000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 27. -/
theorem ep_Q2_008_partial_27_0989_valid :
    mulPoly ep_Q2_008_coefficient_27_0989
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0990 : Poly :=
[
  term ((-6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 990 for generator 27. -/
def ep_Q2_008_partial_27_0990 : Poly :=
[
  term ((-12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 27. -/
theorem ep_Q2_008_partial_27_0990_valid :
    mulPoly ep_Q2_008_coefficient_27_0990
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0991 : Poly :=
[
  term ((-113051517496293261271067961273612000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 991 for generator 27. -/
def ep_Q2_008_partial_27_0991 : Poly :=
[
  term ((113051517496293261271067961273612000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-226103034992586522542135922547224000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 27. -/
theorem ep_Q2_008_partial_27_0991_valid :
    mulPoly ep_Q2_008_coefficient_27_0991
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0992 : Poly :=
[
  term ((22491742942931087209 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 992 for generator 27. -/
def ep_Q2_008_partial_27_0992 : Poly :=
[
  term ((-22491742942931087209 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((22491742942931087209 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 27. -/
theorem ep_Q2_008_partial_27_0992_valid :
    mulPoly ep_Q2_008_coefficient_27_0992
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0993 : Poly :=
[
  term ((-56525758748146630635533980636806000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 993 for generator 27. -/
def ep_Q2_008_partial_27_0993 : Poly :=
[
  term ((-113051517496293261271067961273612000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((56525758748146630635533980636806000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 27. -/
theorem ep_Q2_008_partial_27_0993_valid :
    mulPoly ep_Q2_008_coefficient_27_0993
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0994 : Poly :=
[
  term ((22491742942931087209 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 994 for generator 27. -/
def ep_Q2_008_partial_27_0994 : Poly :=
[
  term ((22491742942931087209 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-22491742942931087209 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 27. -/
theorem ep_Q2_008_partial_27_0994_valid :
    mulPoly ep_Q2_008_coefficient_27_0994
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0995 : Poly :=
[
  term ((1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 995 for generator 27. -/
def ep_Q2_008_partial_27_0995 : Poly :=
[
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 27. -/
theorem ep_Q2_008_partial_27_0995_valid :
    mulPoly ep_Q2_008_coefficient_27_0995
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0996 : Poly :=
[
  term ((1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (7, 2), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 996 for generator 27. -/
def ep_Q2_008_partial_27_0996 : Poly :=
[
  term ((2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (7, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (7, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 27. -/
theorem ep_Q2_008_partial_27_0996_valid :
    mulPoly ep_Q2_008_coefficient_27_0996
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0997 : Poly :=
[
  term ((-558452675388045642190409022939820800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 997 for generator 27. -/
def ep_Q2_008_partial_27_0997 : Poly :=
[
  term ((558452675388045642190409022939820800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1116905350776091284380818045879641600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 27. -/
theorem ep_Q2_008_partial_27_0997_valid :
    mulPoly ep_Q2_008_coefficient_27_0997
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0998 : Poly :=
[
  term ((29036967714932619513385891836409132800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 998 for generator 27. -/
def ep_Q2_008_partial_27_0998 : Poly :=
[
  term ((58073935429865239026771783672818265600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-29036967714932619513385891836409132800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 27. -/
theorem ep_Q2_008_partial_27_0998_valid :
    mulPoly ep_Q2_008_coefficient_27_0998
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 27. -/
def ep_Q2_008_coefficient_27_0999 : Poly :=
[
  term ((75089072032420254316844008713552000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 999 for generator 27. -/
def ep_Q2_008_partial_27_0999 : Poly :=
[
  term ((-75089072032420254316844008713552000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((150178144064840508633688017427104000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 27. -/
theorem ep_Q2_008_partial_27_0999_valid :
    mulPoly ep_Q2_008_coefficient_27_0999
        ep_Q2_008_generator_27_0900_0999 =
      ep_Q2_008_partial_27_0999 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_27_0900_0999 : List Poly :=
[
  ep_Q2_008_partial_27_0900,
  ep_Q2_008_partial_27_0901,
  ep_Q2_008_partial_27_0902,
  ep_Q2_008_partial_27_0903,
  ep_Q2_008_partial_27_0904,
  ep_Q2_008_partial_27_0905,
  ep_Q2_008_partial_27_0906,
  ep_Q2_008_partial_27_0907,
  ep_Q2_008_partial_27_0908,
  ep_Q2_008_partial_27_0909,
  ep_Q2_008_partial_27_0910,
  ep_Q2_008_partial_27_0911,
  ep_Q2_008_partial_27_0912,
  ep_Q2_008_partial_27_0913,
  ep_Q2_008_partial_27_0914,
  ep_Q2_008_partial_27_0915,
  ep_Q2_008_partial_27_0916,
  ep_Q2_008_partial_27_0917,
  ep_Q2_008_partial_27_0918,
  ep_Q2_008_partial_27_0919,
  ep_Q2_008_partial_27_0920,
  ep_Q2_008_partial_27_0921,
  ep_Q2_008_partial_27_0922,
  ep_Q2_008_partial_27_0923,
  ep_Q2_008_partial_27_0924,
  ep_Q2_008_partial_27_0925,
  ep_Q2_008_partial_27_0926,
  ep_Q2_008_partial_27_0927,
  ep_Q2_008_partial_27_0928,
  ep_Q2_008_partial_27_0929,
  ep_Q2_008_partial_27_0930,
  ep_Q2_008_partial_27_0931,
  ep_Q2_008_partial_27_0932,
  ep_Q2_008_partial_27_0933,
  ep_Q2_008_partial_27_0934,
  ep_Q2_008_partial_27_0935,
  ep_Q2_008_partial_27_0936,
  ep_Q2_008_partial_27_0937,
  ep_Q2_008_partial_27_0938,
  ep_Q2_008_partial_27_0939,
  ep_Q2_008_partial_27_0940,
  ep_Q2_008_partial_27_0941,
  ep_Q2_008_partial_27_0942,
  ep_Q2_008_partial_27_0943,
  ep_Q2_008_partial_27_0944,
  ep_Q2_008_partial_27_0945,
  ep_Q2_008_partial_27_0946,
  ep_Q2_008_partial_27_0947,
  ep_Q2_008_partial_27_0948,
  ep_Q2_008_partial_27_0949,
  ep_Q2_008_partial_27_0950,
  ep_Q2_008_partial_27_0951,
  ep_Q2_008_partial_27_0952,
  ep_Q2_008_partial_27_0953,
  ep_Q2_008_partial_27_0954,
  ep_Q2_008_partial_27_0955,
  ep_Q2_008_partial_27_0956,
  ep_Q2_008_partial_27_0957,
  ep_Q2_008_partial_27_0958,
  ep_Q2_008_partial_27_0959,
  ep_Q2_008_partial_27_0960,
  ep_Q2_008_partial_27_0961,
  ep_Q2_008_partial_27_0962,
  ep_Q2_008_partial_27_0963,
  ep_Q2_008_partial_27_0964,
  ep_Q2_008_partial_27_0965,
  ep_Q2_008_partial_27_0966,
  ep_Q2_008_partial_27_0967,
  ep_Q2_008_partial_27_0968,
  ep_Q2_008_partial_27_0969,
  ep_Q2_008_partial_27_0970,
  ep_Q2_008_partial_27_0971,
  ep_Q2_008_partial_27_0972,
  ep_Q2_008_partial_27_0973,
  ep_Q2_008_partial_27_0974,
  ep_Q2_008_partial_27_0975,
  ep_Q2_008_partial_27_0976,
  ep_Q2_008_partial_27_0977,
  ep_Q2_008_partial_27_0978,
  ep_Q2_008_partial_27_0979,
  ep_Q2_008_partial_27_0980,
  ep_Q2_008_partial_27_0981,
  ep_Q2_008_partial_27_0982,
  ep_Q2_008_partial_27_0983,
  ep_Q2_008_partial_27_0984,
  ep_Q2_008_partial_27_0985,
  ep_Q2_008_partial_27_0986,
  ep_Q2_008_partial_27_0987,
  ep_Q2_008_partial_27_0988,
  ep_Q2_008_partial_27_0989,
  ep_Q2_008_partial_27_0990,
  ep_Q2_008_partial_27_0991,
  ep_Q2_008_partial_27_0992,
  ep_Q2_008_partial_27_0993,
  ep_Q2_008_partial_27_0994,
  ep_Q2_008_partial_27_0995,
  ep_Q2_008_partial_27_0996,
  ep_Q2_008_partial_27_0997,
  ep_Q2_008_partial_27_0998,
  ep_Q2_008_partial_27_0999
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_27_0900_0999 : Poly :=
[
  term ((-5381986129252263987 : Rat) / 692956453614176359) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((5381986129252263987 : Rat) / 1385912907228352718) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((4881761251454097883355033686230662400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12197346348968668832104109707660800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2437831289139806774469490815688416000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((729877970528763246 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-364938985264381623 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-231759677771422065979541084536372800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((3326406100642410036 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((154506451847614710653027389690915200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((77253225923807355326513694845457600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1663203050321205018 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2421904732041760488345452005772121600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((605476183010440122086363001443030400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((364938985264381623 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((3686735442531263925306346493260896000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((206008602463486280870703186254553600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((-3204759772220949495 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((-51502150615871570217675796563638400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((3204759772220949495 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (7, 1), (16, 1)],
  term ((406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-203073700141107506251057826523571200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((164273752925072513343636144208473600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-82136876462536256671818072104236800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-406147400282215012502115653047142400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((101536850070553753125528913261785600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-96582519544703344593283535367283200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (14, 2), (15, 1), (16, 1)],
  term ((24145629886175836148320883841820800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((4630653267056712000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2315326633528356000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4630653267056712000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((1157663316764178000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((9849163696472928763174326464201700902400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4924581848236464381587163232100850451200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((4344906881259997875 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-4371704643222131625 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6036314441816143785359715986219065228800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1509078610454035946339928996554766307200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9529107427478448000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (14, 2), (16, 1)],
  term ((2382276856869612000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-788865363032438271271988374755028070400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((197216340758109567817997093688757017600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-96462593372687625 : Rat) / 23895050124626771) [(3, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((3011797303505011125 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (11, 1), (16, 1)],
  term ((282294956092783746240896013594526464000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-62554836379172966607 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7995170523765116349 : Rat) / 1385912907228352718) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-141147478046391873120448006797263232000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((27279832927703925129 : Rat) / 2771825814456705436) [(3, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((8402930661652177337438025772082918246400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4201465330826088668719012886041459123200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((3826767948750936317627706799627458616028763 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1086908812529704210324287413335995211982121 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1369929568110616053651709693145731702023321 : Rat) / 674830407405318061502963313035932218791992) [(3, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10857498311260913316957538984404864000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((15213672260484996456 : Rat) / 692956453614176359) [(3, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((2714374577815228329239384746101216000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3803418065121249114 : Rat) / 692956453614176359) [(3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-7186049076432266938217249903077397452800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((1796512269108066734554312475769349363200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((35270253826243981359818626062648761679000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-408607130084278739473284536518054318285157 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((338066622431790776753647284392756794927157 : Rat) / 337415203702659030751481656517966109395996) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term ((14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-7271135041217201450468679696937733878200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-14542270082434402900937359393875467756400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (14, 2), (15, 1), (16, 1)],
  term ((3635567520608600725234339848468866939100 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((21609715246264656000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((-10804857623132328000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (14, 2), (16, 1)],
  term ((2701214405783082000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (10, 1), (16, 1)],
  term ((38116429709913792000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3155461452129753085087953499020112281600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((4908845061293746365060287226925842432000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-19058214854956896000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((4764553713739224000 : Rat) / 692956453614176359) [(3, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1577730726064876542543976749510056140800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((394432681516219135635994187377514035200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2454422530646873182530143613462921216000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((613605632661718295632535903365730304000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((469301381393536614299489226978914801236230 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2457823628354175950204230995507264000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((3741292539257165083937361095079681600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-234677815067677921596603159357396728309715 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1228911814177087975102115497753632000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((73734708850625278506126929865217920000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2554572896850671361 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 1), (16, 1)],
  term ((-4014328837908197853 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (12, 1), (13, 2), (14, 2), (16, 1)],
  term ((-36867354425312639253063464932608960000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((3284450867379434607 : Rat) / 2771825814456705436) [(3, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-12903574048859423738572212726413136000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (14, 1), (15, 1), (16, 1)],
  term ((-40554089867843903178369811425869856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((16590309491390687663878559219674032000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-14812322053713117523122076923122181307101 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-106096590569653904679 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-6711233062870730036207393696764800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((21752309342453721441 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (12, 1), (14, 2), (16, 1)],
  term ((14812419366592529148707601930330784396701 : Rat) / 168707601851329515375740828258983054697998) [(3, 1), (7, 1), (12, 1), (15, 2), (16, 1)],
  term ((42172140613600091619 : Rat) / 11087303257826821744) [(3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-14746941770125055701225385973043584000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((7373470885062527850612692986521792000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-729877970528763246 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 2), (14, 1), (16, 1)],
  term ((364938985264381623 : Rat) / 692956453614176359) [(3, 1), (7, 1), (12, 2), (16, 1)],
  term ((-131082729715552231709355879158600827924008 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((32770682428888057927338969789650206981002 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19662589026833407601633847964058112000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (14, 2), (15, 2), (16, 1)],
  term ((-2554572896850671361 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (13, 2), (14, 2), (16, 1)],
  term ((4915647256708351900408461991014528000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((2554572896850671361 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (13, 2), (16, 1)],
  term ((-25807148097718847477144425452826272000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (14, 2), (15, 1), (16, 1)],
  term ((6451787024429711869286106363206568000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-226103034992586522542135922547224000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (14, 2), (15, 2), (16, 1)],
  term ((22491742942931087209 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (14, 2), (16, 1)],
  term ((56525758748146630635533980636806000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-22491742942931087209 : Rat) / 22174606515653643488) [(3, 1), (7, 1), (16, 1)],
  term ((2030737001411075062510578265235712000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2919511882115052984 : Rat) / 692956453614176359) [(3, 1), (7, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1015368500705537531255289132617856000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1459755941057526492 : Rat) / 692956453614176359) [(3, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((58632388105253284668962192695758086400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1116905350776091284380818045879641600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((-29036967714932619513385891836409132800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-75089072032420254316844008713552000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((150178144064840508633688017427104000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 900 through 999. -/
theorem ep_Q2_008_block_27_0900_0999_valid :
    checkProductSumEq ep_Q2_008_partials_27_0900_0999
      ep_Q2_008_block_27_0900_0999 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
