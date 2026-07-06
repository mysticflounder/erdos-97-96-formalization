/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 9:900-999

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_09_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0900 : Poly :=
[
  term ((62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 2)]
]

/-- Partial product 900 for generator 9. -/
def ep_Q2_002_partial_09_0900 : Poly :=
[
  term ((125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 9. -/
theorem ep_Q2_002_partial_09_0900_valid :
    mulPoly ep_Q2_002_coefficient_09_0900
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0901 : Poly :=
[
  term ((7150126912865280647382583355796 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 901 for generator 9. -/
def ep_Q2_002_partial_09_0901 : Poly :=
[
  term ((14300253825730561294765166711592 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((-7150126912865280647382583355796 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 9. -/
theorem ep_Q2_002_partial_09_0901_valid :
    mulPoly ep_Q2_002_coefficient_09_0901
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0902 : Poly :=
[
  term ((-5401035136533888807578975381904 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 902 for generator 9. -/
def ep_Q2_002_partial_09_0902 : Poly :=
[
  term ((-10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((5401035136533888807578975381904 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 9. -/
theorem ep_Q2_002_partial_09_0902_valid :
    mulPoly ep_Q2_002_coefficient_09_0902
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0903 : Poly :=
[
  term ((18330805047199142020667875472448 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 903 for generator 9. -/
def ep_Q2_002_partial_09_0903 : Poly :=
[
  term ((36661610094398284041335750944896 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-18330805047199142020667875472448 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 9. -/
theorem ep_Q2_002_partial_09_0903_valid :
    mulPoly ep_Q2_002_coefficient_09_0903
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0904 : Poly :=
[
  term ((-831481558005341818068751705164288940030824 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 904 for generator 9. -/
def ep_Q2_002_partial_09_0904 : Poly :=
[
  term ((-1662963116010683636137503410328577880061648 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((831481558005341818068751705164288940030824 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 9. -/
theorem ep_Q2_002_partial_09_0904_valid :
    mulPoly ep_Q2_002_coefficient_09_0904
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0905 : Poly :=
[
  term ((59971580898 : Rat) / 7401317245) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 905 for generator 9. -/
def ep_Q2_002_partial_09_0905 : Poly :=
[
  term ((119943161796 : Rat) / 7401317245) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-59971580898 : Rat) / 7401317245) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 9. -/
theorem ep_Q2_002_partial_09_0905_valid :
    mulPoly ep_Q2_002_coefficient_09_0905
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0906 : Poly :=
[
  term ((162268135487407697768116762801645907339418 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 906 for generator 9. -/
def ep_Q2_002_partial_09_0906 : Poly :=
[
  term ((324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-162268135487407697768116762801645907339418 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 9. -/
theorem ep_Q2_002_partial_09_0906_valid :
    mulPoly ep_Q2_002_coefficient_09_0906
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0907 : Poly :=
[
  term ((-39643219857 : Rat) / 14802634490) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 907 for generator 9. -/
def ep_Q2_002_partial_09_0907 : Poly :=
[
  term ((-39643219857 : Rat) / 7401317245) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((39643219857 : Rat) / 14802634490) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 9. -/
theorem ep_Q2_002_partial_09_0907_valid :
    mulPoly ep_Q2_002_coefficient_09_0907
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0908 : Poly :=
[
  term ((-23648728954584785626407405847932 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1)]
]

/-- Partial product 908 for generator 9. -/
def ep_Q2_002_partial_09_0908 : Poly :=
[
  term ((-47297457909169571252814811695864 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1)],
  term ((23648728954584785626407405847932 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 9. -/
theorem ep_Q2_002_partial_09_0908_valid :
    mulPoly ep_Q2_002_coefficient_09_0908
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0909 : Poly :=
[
  term ((-5739462713149234259472164056608 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 909 for generator 9. -/
def ep_Q2_002_partial_09_0909 : Poly :=
[
  term ((-11478925426298468518944328113216 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((5739462713149234259472164056608 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 9. -/
theorem ep_Q2_002_partial_09_0909_valid :
    mulPoly ep_Q2_002_coefficient_09_0909
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0910 : Poly :=
[
  term ((1697812493271543097811840589714848410498368 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 910 for generator 9. -/
def ep_Q2_002_partial_09_0910 : Poly :=
[
  term ((3395624986543086195623681179429696820996736 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1697812493271543097811840589714848410498368 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 9. -/
theorem ep_Q2_002_partial_09_0910_valid :
    mulPoly ep_Q2_002_coefficient_09_0910
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0911 : Poly :=
[
  term ((112126330424 : Rat) / 7401317245) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 911 for generator 9. -/
def ep_Q2_002_partial_09_0911 : Poly :=
[
  term ((224252660848 : Rat) / 7401317245) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 9. -/
theorem ep_Q2_002_partial_09_0911_valid :
    mulPoly ep_Q2_002_coefficient_09_0911
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0912 : Poly :=
[
  term ((-117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 2)]
]

/-- Partial product 912 for generator 9. -/
def ep_Q2_002_partial_09_0912 : Poly :=
[
  term ((-235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 9. -/
theorem ep_Q2_002_partial_09_0912_valid :
    mulPoly ep_Q2_002_coefficient_09_0912
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0913 : Poly :=
[
  term ((-13465027994073643600812967601232 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 913 for generator 9. -/
def ep_Q2_002_partial_09_0913 : Poly :=
[
  term ((-26930055988147287201625935202464 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((13465027994073643600812967601232 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 9. -/
theorem ep_Q2_002_partial_09_0913_valid :
    mulPoly ep_Q2_002_coefficient_09_0913
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0914 : Poly :=
[
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 914 for generator 9. -/
def ep_Q2_002_partial_09_0914 : Poly :=
[
  term ((376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 9. -/
theorem ep_Q2_002_partial_09_0914_valid :
    mulPoly ep_Q2_002_coefficient_09_0914
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0915 : Poly :=
[
  term ((-71012360781148761065089936076262247716984 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 915 for generator 9. -/
def ep_Q2_002_partial_09_0915 : Poly :=
[
  term ((-142024721562297522130179872152524495433968 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((71012360781148761065089936076262247716984 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 9. -/
theorem ep_Q2_002_partial_09_0915_valid :
    mulPoly ep_Q2_002_coefficient_09_0915
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0916 : Poly :=
[
  term ((-9682993756 : Rat) / 22203951735) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 916 for generator 9. -/
def ep_Q2_002_partial_09_0916 : Poly :=
[
  term ((-19365987512 : Rat) / 22203951735) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((9682993756 : Rat) / 22203951735) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 9. -/
theorem ep_Q2_002_partial_09_0916_valid :
    mulPoly ep_Q2_002_coefficient_09_0916
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0917 : Poly :=
[
  term ((-3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 1), (15, 3)]
]

/-- Partial product 917 for generator 9. -/
def ep_Q2_002_partial_09_0917 : Poly :=
[
  term ((-6444878423005462202791831729930177525567104 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (14, 1), (15, 3)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 9. -/
theorem ep_Q2_002_partial_09_0917_valid :
    mulPoly ep_Q2_002_coefficient_09_0917
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0918 : Poly :=
[
  term ((-316951406728 : Rat) / 22203951735) [(5, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 918 for generator 9. -/
def ep_Q2_002_partial_09_0918 : Poly :=
[
  term ((-633902813456 : Rat) / 22203951735) [(2, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((316951406728 : Rat) / 22203951735) [(5, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 9. -/
theorem ep_Q2_002_partial_09_0918_valid :
    mulPoly ep_Q2_002_coefficient_09_0918
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0919 : Poly :=
[
  term ((-27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (14, 2), (15, 1)]
]

/-- Partial product 919 for generator 9. -/
def ep_Q2_002_partial_09_0919 : Poly :=
[
  term ((-54596813688829660254282311535600859116288 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 9. -/
theorem ep_Q2_002_partial_09_0919_valid :
    mulPoly ep_Q2_002_coefficient_09_0919
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0920 : Poly :=
[
  term ((-1243661576 : Rat) / 211466207) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 920 for generator 9. -/
def ep_Q2_002_partial_09_0920 : Poly :=
[
  term ((-2487323152 : Rat) / 211466207) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((1243661576 : Rat) / 211466207) [(5, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 9. -/
theorem ep_Q2_002_partial_09_0920_valid :
    mulPoly ep_Q2_002_coefficient_09_0920
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0921 : Poly :=
[
  term ((-366644536219253669652003055641627229025319 : Rat) / 2693636435040645053172294539107852334990) [(5, 1), (15, 1)]
]

/-- Partial product 921 for generator 9. -/
def ep_Q2_002_partial_09_0921 : Poly :=
[
  term ((-366644536219253669652003055641627229025319 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (15, 1)],
  term ((366644536219253669652003055641627229025319 : Rat) / 2693636435040645053172294539107852334990) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 9. -/
theorem ep_Q2_002_partial_09_0921_valid :
    mulPoly ep_Q2_002_coefficient_09_0921
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0922 : Poly :=
[
  term ((-313631849579 : Rat) / 177631613880) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 922 for generator 9. -/
def ep_Q2_002_partial_09_0922 : Poly :=
[
  term ((-313631849579 : Rat) / 88815806940) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((313631849579 : Rat) / 177631613880) [(5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 9. -/
theorem ep_Q2_002_partial_09_0922_valid :
    mulPoly ep_Q2_002_coefficient_09_0922
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0923 : Poly :=
[
  term ((1402544837105570408921331937059207454512678 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 3)]
]

/-- Partial product 923 for generator 9. -/
def ep_Q2_002_partial_09_0923 : Poly :=
[
  term ((2805089674211140817842663874118414909025356 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (15, 3)],
  term ((-1402544837105570408921331937059207454512678 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 9. -/
theorem ep_Q2_002_partial_09_0923_valid :
    mulPoly ep_Q2_002_coefficient_09_0923
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0924 : Poly :=
[
  term ((197389596199 : Rat) / 44407903470) [(5, 1), (15, 3), (16, 1)]
]

/-- Partial product 924 for generator 9. -/
def ep_Q2_002_partial_09_0924 : Poly :=
[
  term ((197389596199 : Rat) / 22203951735) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((-197389596199 : Rat) / 44407903470) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 9. -/
theorem ep_Q2_002_partial_09_0924_valid :
    mulPoly ep_Q2_002_coefficient_09_0924
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0925 : Poly :=
[
  term ((-4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (11, 1)]
]

/-- Partial product 925 for generator 9. -/
def ep_Q2_002_partial_09_0925 : Poly :=
[
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (11, 1)],
  term ((4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 9. -/
theorem ep_Q2_002_partial_09_0925_valid :
    mulPoly ep_Q2_002_coefficient_09_0925
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0926 : Poly :=
[
  term ((16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 926 for generator 9. -/
def ep_Q2_002_partial_09_0926 : Poly :=
[
  term ((33162853602572616672085597726752 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (11, 1), (14, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 9. -/
theorem ep_Q2_002_partial_09_0926_valid :
    mulPoly ep_Q2_002_coefficient_09_0926
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0927 : Poly :=
[
  term ((7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (13, 1)]
]

/-- Partial product 927 for generator 9. -/
def ep_Q2_002_partial_09_0927 : Poly :=
[
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (13, 1)],
  term ((-7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 9. -/
theorem ep_Q2_002_partial_09_0927_valid :
    mulPoly ep_Q2_002_coefficient_09_0927
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0928 : Poly :=
[
  term ((-31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 928 for generator 9. -/
def ep_Q2_002_partial_09_0928 : Poly :=
[
  term ((-62451863800983100189204984877184 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (13, 1), (14, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 9. -/
theorem ep_Q2_002_partial_09_0928_valid :
    mulPoly ep_Q2_002_coefficient_09_0928
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0929 : Poly :=
[
  term ((-899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 929 for generator 9. -/
def ep_Q2_002_partial_09_0929 : Poly :=
[
  term ((-1798864918700863612923282373934692107147696 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 9. -/
theorem ep_Q2_002_partial_09_0929_valid :
    mulPoly ep_Q2_002_coefficient_09_0929
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0930 : Poly :=
[
  term ((-381790635174 : Rat) / 7401317245) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 930 for generator 9. -/
def ep_Q2_002_partial_09_0930 : Poly :=
[
  term ((-763581270348 : Rat) / 7401317245) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((381790635174 : Rat) / 7401317245) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 9. -/
theorem ep_Q2_002_partial_09_0930_valid :
    mulPoly ep_Q2_002_coefficient_09_0930
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0931 : Poly :=
[
  term ((224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (7, 1), (15, 1)]
]

/-- Partial product 931 for generator 9. -/
def ep_Q2_002_partial_09_0931 : Poly :=
[
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 2), (7, 1), (15, 1)],
  term ((-224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 9. -/
theorem ep_Q2_002_partial_09_0931_valid :
    mulPoly ep_Q2_002_coefficient_09_0931
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0932 : Poly :=
[
  term ((190895317587 : Rat) / 14802634490) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 932 for generator 9. -/
def ep_Q2_002_partial_09_0932 : Poly :=
[
  term ((190895317587 : Rat) / 7401317245) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-190895317587 : Rat) / 14802634490) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 9. -/
theorem ep_Q2_002_partial_09_0932_valid :
    mulPoly ep_Q2_002_coefficient_09_0932
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0933 : Poly :=
[
  term ((58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 933 for generator 9. -/
def ep_Q2_002_partial_09_0933 : Poly :=
[
  term ((117530099766188738730213585768288 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 9. -/
theorem ep_Q2_002_partial_09_0933_valid :
    mulPoly ep_Q2_002_coefficient_09_0933
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0934 : Poly :=
[
  term ((-14691262470773592341276698221036 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (15, 1)]
]

/-- Partial product 934 for generator 9. -/
def ep_Q2_002_partial_09_0934 : Poly :=
[
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((14691262470773592341276698221036 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 9. -/
theorem ep_Q2_002_partial_09_0934_valid :
    mulPoly ep_Q2_002_coefficient_09_0934
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0935 : Poly :=
[
  term ((-110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 935 for generator 9. -/
def ep_Q2_002_partial_09_0935 : Poly :=
[
  term ((-221331187933253564025651456986496 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 9. -/
theorem ep_Q2_002_partial_09_0935_valid :
    mulPoly ep_Q2_002_coefficient_09_0935
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0936 : Poly :=
[
  term ((27666398491656695503206432123312 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 1), (15, 1)]
]

/-- Partial product 936 for generator 9. -/
def ep_Q2_002_partial_09_0936 : Poly :=
[
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((-27666398491656695503206432123312 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 9. -/
theorem ep_Q2_002_partial_09_0936_valid :
    mulPoly ep_Q2_002_coefficient_09_0936
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0937 : Poly :=
[
  term ((477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (14, 1), (15, 2)]
]

/-- Partial product 937 for generator 9. -/
def ep_Q2_002_partial_09_0937 : Poly :=
[
  term ((955096054767820213715764753308696422106864 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 2), (14, 1), (15, 2)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 9. -/
theorem ep_Q2_002_partial_09_0937_valid :
    mulPoly ep_Q2_002_coefficient_09_0937
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0938 : Poly :=
[
  term ((15565557134 : Rat) / 4440790347) [(5, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 938 for generator 9. -/
def ep_Q2_002_partial_09_0938 : Poly :=
[
  term ((31131114268 : Rat) / 4440790347) [(2, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-15565557134 : Rat) / 4440790347) [(5, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 9. -/
theorem ep_Q2_002_partial_09_0938_valid :
    mulPoly ep_Q2_002_coefficient_09_0938
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0939 : Poly :=
[
  term ((-119387006845977526714470594163587052763358 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (15, 2)]
]

/-- Partial product 939 for generator 9. -/
def ep_Q2_002_partial_09_0939 : Poly :=
[
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 2), (15, 2)],
  term ((119387006845977526714470594163587052763358 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 9. -/
theorem ep_Q2_002_partial_09_0939_valid :
    mulPoly ep_Q2_002_coefficient_09_0939
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0940 : Poly :=
[
  term ((-7782778567 : Rat) / 8881580694) [(5, 2), (15, 2), (16, 1)]
]

/-- Partial product 940 for generator 9. -/
def ep_Q2_002_partial_09_0940 : Poly :=
[
  term ((-7782778567 : Rat) / 4440790347) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((7782778567 : Rat) / 8881580694) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 9. -/
theorem ep_Q2_002_partial_09_0940_valid :
    mulPoly ep_Q2_002_coefficient_09_0940
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0941 : Poly :=
[
  term ((-44578806891057246780 : Rat) / 253528477699481291099) [(6, 1)]
]

/-- Partial product 941 for generator 9. -/
def ep_Q2_002_partial_09_0941 : Poly :=
[
  term ((-89157613782114493560 : Rat) / 253528477699481291099) [(2, 1), (6, 1)],
  term ((44578806891057246780 : Rat) / 253528477699481291099) [(6, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 9. -/
theorem ep_Q2_002_partial_09_0941_valid :
    mulPoly ep_Q2_002_coefficient_09_0941
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0942 : Poly :=
[
  term ((213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 942 for generator 9. -/
def ep_Q2_002_partial_09_0942 : Poly :=
[
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 9. -/
theorem ep_Q2_002_partial_09_0942_valid :
    mulPoly ep_Q2_002_coefficient_09_0942
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0943 : Poly :=
[
  term ((916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 943 for generator 9. -/
def ep_Q2_002_partial_09_0943 : Poly :=
[
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 9. -/
theorem ep_Q2_002_partial_09_0943_valid :
    mulPoly ep_Q2_002_coefficient_09_0943
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0944 : Poly :=
[
  term ((97514072568 : Rat) / 7401317245) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 944 for generator 9. -/
def ep_Q2_002_partial_09_0944 : Poly :=
[
  term ((195028145136 : Rat) / 7401317245) [(2, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 9. -/
theorem ep_Q2_002_partial_09_0944_valid :
    mulPoly ep_Q2_002_coefficient_09_0944
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0945 : Poly :=
[
  term ((-113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (11, 2)]
]

/-- Partial product 945 for generator 9. -/
def ep_Q2_002_partial_09_0945 : Poly :=
[
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (9, 1), (11, 2)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 9. -/
theorem ep_Q2_002_partial_09_0945_valid :
    mulPoly ep_Q2_002_coefficient_09_0945
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0946 : Poly :=
[
  term ((52718990291332375088889474177906 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1)]
]

/-- Partial product 946 for generator 9. -/
def ep_Q2_002_partial_09_0946 : Poly :=
[
  term ((105437980582664750177778948355812 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((-52718990291332375088889474177906 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 9. -/
theorem ep_Q2_002_partial_09_0946_valid :
    mulPoly ep_Q2_002_coefficient_09_0946
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0947 : Poly :=
[
  term ((-127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 947 for generator 9. -/
def ep_Q2_002_partial_09_0947 : Poly :=
[
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 9. -/
theorem ep_Q2_002_partial_09_0947_valid :
    mulPoly ep_Q2_002_coefficient_09_0947
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0948 : Poly :=
[
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 948 for generator 9. -/
def ep_Q2_002_partial_09_0948 : Poly :=
[
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 9. -/
theorem ep_Q2_002_partial_09_0948_valid :
    mulPoly ep_Q2_002_coefficient_09_0948
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0949 : Poly :=
[
  term ((532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 949 for generator 9. -/
def ep_Q2_002_partial_09_0949 : Poly :=
[
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 9. -/
theorem ep_Q2_002_partial_09_0949_valid :
    mulPoly ep_Q2_002_coefficient_09_0949
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0950 : Poly :=
[
  term ((-88171245013 : Rat) / 22203951735) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 950 for generator 9. -/
def ep_Q2_002_partial_09_0950 : Poly :=
[
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((88171245013 : Rat) / 22203951735) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 9. -/
theorem ep_Q2_002_partial_09_0950_valid :
    mulPoly ep_Q2_002_coefficient_09_0950
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0951 : Poly :=
[
  term ((67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 951 for generator 9. -/
def ep_Q2_002_partial_09_0951 : Poly :=
[
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 9. -/
theorem ep_Q2_002_partial_09_0951_valid :
    mulPoly ep_Q2_002_coefficient_09_0951
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0952 : Poly :=
[
  term ((-95905435386758781114761239203912 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (13, 1)]
]

/-- Partial product 952 for generator 9. -/
def ep_Q2_002_partial_09_0952 : Poly :=
[
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((95905435386758781114761239203912 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 9. -/
theorem ep_Q2_002_partial_09_0952_valid :
    mulPoly ep_Q2_002_coefficient_09_0952
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0953 : Poly :=
[
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (13, 1), (14, 1)]
]

/-- Partial product 953 for generator 9. -/
def ep_Q2_002_partial_09_0953 : Poly :=
[
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 9. -/
theorem ep_Q2_002_partial_09_0953_valid :
    mulPoly ep_Q2_002_coefficient_09_0953
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0954 : Poly :=
[
  term ((-798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 954 for generator 9. -/
def ep_Q2_002_partial_09_0954 : Poly :=
[
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 9. -/
theorem ep_Q2_002_partial_09_0954_valid :
    mulPoly ep_Q2_002_coefficient_09_0954
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0955 : Poly :=
[
  term ((88171245013 : Rat) / 14802634490) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 955 for generator 9. -/
def ep_Q2_002_partial_09_0955 : Poly :=
[
  term ((88171245013 : Rat) / 7401317245) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 9. -/
theorem ep_Q2_002_partial_09_0955_valid :
    mulPoly ep_Q2_002_coefficient_09_0955
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0956 : Poly :=
[
  term ((403231179408457713301544070568761984059721 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 956 for generator 9. -/
def ep_Q2_002_partial_09_0956 : Poly :=
[
  term ((806462358816915426603088141137523968119442 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-403231179408457713301544070568761984059721 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 9. -/
theorem ep_Q2_002_partial_09_0956_valid :
    mulPoly ep_Q2_002_coefficient_09_0956
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0957 : Poly :=
[
  term ((-88171245013 : Rat) / 29605268980) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 957 for generator 9. -/
def ep_Q2_002_partial_09_0957 : Poly :=
[
  term ((-88171245013 : Rat) / 14802634490) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((88171245013 : Rat) / 29605268980) [(6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 9. -/
theorem ep_Q2_002_partial_09_0957_valid :
    mulPoly ep_Q2_002_coefficient_09_0957
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0958 : Poly :=
[
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (11, 1), (13, 1)]
]

/-- Partial product 958 for generator 9. -/
def ep_Q2_002_partial_09_0958 : Poly :=
[
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 2), (11, 1), (13, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 9. -/
theorem ep_Q2_002_partial_09_0958_valid :
    mulPoly ep_Q2_002_coefficient_09_0958
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0959 : Poly :=
[
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 2), (11, 1), (15, 1)]
]

/-- Partial product 959 for generator 9. -/
def ep_Q2_002_partial_09_0959 : Poly :=
[
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (7, 2), (11, 1), (15, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 9. -/
theorem ep_Q2_002_partial_09_0959_valid :
    mulPoly ep_Q2_002_coefficient_09_0959
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0960 : Poly :=
[
  term ((88171245013 : Rat) / 7401317245) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 960 for generator 9. -/
def ep_Q2_002_partial_09_0960 : Poly :=
[
  term ((176342490026 : Rat) / 7401317245) [(2, 1), (6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 9. -/
theorem ep_Q2_002_partial_09_0960_valid :
    mulPoly ep_Q2_002_coefficient_09_0960
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0961 : Poly :=
[
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (11, 2)]
]

/-- Partial product 961 for generator 9. -/
def ep_Q2_002_partial_09_0961 : Poly :=
[
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 2), (11, 2)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 9. -/
theorem ep_Q2_002_partial_09_0961_valid :
    mulPoly ep_Q2_002_coefficient_09_0961
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0962 : Poly :=
[
  term ((8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 962 for generator 9. -/
def ep_Q2_002_partial_09_0962 : Poly :=
[
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 9. -/
theorem ep_Q2_002_partial_09_0962_valid :
    mulPoly ep_Q2_002_coefficient_09_0962
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0963 : Poly :=
[
  term ((305966224696598934669558087824220130902528 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 963 for generator 9. -/
def ep_Q2_002_partial_09_0963 : Poly :=
[
  term ((611932449393197869339116175648440261805056 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-305966224696598934669558087824220130902528 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 9. -/
theorem ep_Q2_002_partial_09_0963_valid :
    mulPoly ep_Q2_002_coefficient_09_0963
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0964 : Poly :=
[
  term ((5271014764 : Rat) / 7401317245) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 964 for generator 9. -/
def ep_Q2_002_partial_09_0964 : Poly :=
[
  term ((10542029528 : Rat) / 7401317245) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 9. -/
theorem ep_Q2_002_partial_09_0964_valid :
    mulPoly ep_Q2_002_coefficient_09_0964
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0965 : Poly :=
[
  term ((-4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 2)]
]

/-- Partial product 965 for generator 9. -/
def ep_Q2_002_partial_09_0965 : Poly :=
[
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (8, 1), (11, 2)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 9. -/
theorem ep_Q2_002_partial_09_0965_valid :
    mulPoly ep_Q2_002_coefficient_09_0965
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0966 : Poly :=
[
  term ((-400726062104681825945358868821312 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 966 for generator 9. -/
def ep_Q2_002_partial_09_0966 : Poly :=
[
  term ((-801452124209363651890717737642624 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((400726062104681825945358868821312 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 9. -/
theorem ep_Q2_002_partial_09_0966_valid :
    mulPoly ep_Q2_002_coefficient_09_0966
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0967 : Poly :=
[
  term ((65293349193536320379884741111996436122272 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (8, 1), (15, 2)]
]

/-- Partial product 967 for generator 9. -/
def ep_Q2_002_partial_09_0967 : Poly :=
[
  term ((130586698387072640759769482223992872244544 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((-65293349193536320379884741111996436122272 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 9. -/
theorem ep_Q2_002_partial_09_0967_valid :
    mulPoly ep_Q2_002_coefficient_09_0967
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0968 : Poly :=
[
  term ((-25427117684 : Rat) / 1480263449) [(6, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 968 for generator 9. -/
def ep_Q2_002_partial_09_0968 : Poly :=
[
  term ((-50854235368 : Rat) / 1480263449) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((25427117684 : Rat) / 1480263449) [(6, 1), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 9. -/
theorem ep_Q2_002_partial_09_0968_valid :
    mulPoly ep_Q2_002_coefficient_09_0968
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0969 : Poly :=
[
  term ((28318070491572733417219258615464 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 969 for generator 9. -/
def ep_Q2_002_partial_09_0969 : Poly :=
[
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-28318070491572733417219258615464 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 9. -/
theorem ep_Q2_002_partial_09_0969_valid :
    mulPoly ep_Q2_002_coefficient_09_0969
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0970 : Poly :=
[
  term ((-71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 970 for generator 9. -/
def ep_Q2_002_partial_09_0970 : Poly :=
[
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 9. -/
theorem ep_Q2_002_partial_09_0970_valid :
    mulPoly ep_Q2_002_coefficient_09_0970
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0971 : Poly :=
[
  term ((-305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 971 for generator 9. -/
def ep_Q2_002_partial_09_0971 : Poly :=
[
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 9. -/
theorem ep_Q2_002_partial_09_0971_valid :
    mulPoly ep_Q2_002_coefficient_09_0971
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0972 : Poly :=
[
  term ((-32504690856 : Rat) / 7401317245) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 972 for generator 9. -/
def ep_Q2_002_partial_09_0972 : Poly :=
[
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((32504690856 : Rat) / 7401317245) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 9. -/
theorem ep_Q2_002_partial_09_0972_valid :
    mulPoly ep_Q2_002_coefficient_09_0972
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0973 : Poly :=
[
  term ((37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 973 for generator 9. -/
def ep_Q2_002_partial_09_0973 : Poly :=
[
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 9. -/
theorem ep_Q2_002_partial_09_0973_valid :
    mulPoly ep_Q2_002_coefficient_09_0973
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0974 : Poly :=
[
  term ((-53328229911708979177244101334688 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 974 for generator 9. -/
def ep_Q2_002_partial_09_0974 : Poly :=
[
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((53328229911708979177244101334688 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 9. -/
theorem ep_Q2_002_partial_09_0974_valid :
    mulPoly ep_Q2_002_coefficient_09_0974
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0975 : Poly :=
[
  term ((-229082829182456785027809284446664494320144 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 975 for generator 9. -/
def ep_Q2_002_partial_09_0975 : Poly :=
[
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((229082829182456785027809284446664494320144 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 9. -/
theorem ep_Q2_002_partial_09_0975_valid :
    mulPoly ep_Q2_002_coefficient_09_0975
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0976 : Poly :=
[
  term ((-24378518142 : Rat) / 7401317245) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 976 for generator 9. -/
def ep_Q2_002_partial_09_0976 : Poly :=
[
  term ((-48757036284 : Rat) / 7401317245) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((24378518142 : Rat) / 7401317245) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 9. -/
theorem ep_Q2_002_partial_09_0976_valid :
    mulPoly ep_Q2_002_coefficient_09_0976
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0977 : Poly :=
[
  term ((-16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 977 for generator 9. -/
def ep_Q2_002_partial_09_0977 : Poly :=
[
  term ((-33359656448941307461750664745792 : Rat) / 97983883872014706756151952089) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 9. -/
theorem ep_Q2_002_partial_09_0977_valid :
    mulPoly ep_Q2_002_coefficient_09_0977
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0978 : Poly :=
[
  term ((-95417271844402345466997157875597038789052 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 978 for generator 9. -/
def ep_Q2_002_partial_09_0978 : Poly :=
[
  term ((-190834543688804690933994315751194077578104 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((95417271844402345466997157875597038789052 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 9. -/
theorem ep_Q2_002_partial_09_0978_valid :
    mulPoly ep_Q2_002_coefficient_09_0978
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0979 : Poly :=
[
  term ((-77504694161 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 979 for generator 9. -/
def ep_Q2_002_partial_09_0979 : Poly :=
[
  term ((-155009388322 : Rat) / 7401317245) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((77504694161 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 9. -/
theorem ep_Q2_002_partial_09_0979_valid :
    mulPoly ep_Q2_002_coefficient_09_0979
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0980 : Poly :=
[
  term ((5918929783951993258240853579160 : Rat) / 115799135485108289802725034287) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 980 for generator 9. -/
def ep_Q2_002_partial_09_0980 : Poly :=
[
  term ((11837859567903986516481707158320 : Rat) / 115799135485108289802725034287) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((-5918929783951993258240853579160 : Rat) / 115799135485108289802725034287) [(6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 9. -/
theorem ep_Q2_002_partial_09_0980_valid :
    mulPoly ep_Q2_002_coefficient_09_0980
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0981 : Poly :=
[
  term ((-71522496824993628077190584588832 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 981 for generator 9. -/
def ep_Q2_002_partial_09_0981 : Poly :=
[
  term ((-143044993649987256154381169177664 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((71522496824993628077190584588832 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 9. -/
theorem ep_Q2_002_partial_09_0981_valid :
    mulPoly ep_Q2_002_coefficient_09_0981
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0982 : Poly :=
[
  term ((-731716039873197710495375129153589037884043 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 982 for generator 9. -/
def ep_Q2_002_partial_09_0982 : Poly :=
[
  term ((-1463432079746395420990750258307178075768086 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((731716039873197710495375129153589037884043 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 9. -/
theorem ep_Q2_002_partial_09_0982_valid :
    mulPoly ep_Q2_002_coefficient_09_0982
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0983 : Poly :=
[
  term ((29181255517 : Rat) / 88815806940) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 983 for generator 9. -/
def ep_Q2_002_partial_09_0983 : Poly :=
[
  term ((29181255517 : Rat) / 44407903470) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-29181255517 : Rat) / 88815806940) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 9. -/
theorem ep_Q2_002_partial_09_0983_valid :
    mulPoly ep_Q2_002_coefficient_09_0983
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0984 : Poly :=
[
  term ((1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 3)]
]

/-- Partial product 984 for generator 9. -/
def ep_Q2_002_partial_09_0984 : Poly :=
[
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (11, 1), (15, 3)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 9. -/
theorem ep_Q2_002_partial_09_0984_valid :
    mulPoly ep_Q2_002_coefficient_09_0984
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0985 : Poly :=
[
  term ((158475703364 : Rat) / 22203951735) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 985 for generator 9. -/
def ep_Q2_002_partial_09_0985 : Poly :=
[
  term ((316951406728 : Rat) / 22203951735) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-158475703364 : Rat) / 22203951735) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 9. -/
theorem ep_Q2_002_partial_09_0985_valid :
    mulPoly ep_Q2_002_coefficient_09_0985
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0986 : Poly :=
[
  term ((-3143038333245336990474819304230 : Rat) / 115799135485108289802725034287) [(6, 1), (11, 2)]
]

/-- Partial product 986 for generator 9. -/
def ep_Q2_002_partial_09_0986 : Poly :=
[
  term ((-6286076666490673980949638608460 : Rat) / 115799135485108289802725034287) [(2, 1), (6, 1), (11, 2)],
  term ((3143038333245336990474819304230 : Rat) / 115799135485108289802725034287) [(6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 9. -/
theorem ep_Q2_002_partial_09_0986_valid :
    mulPoly ep_Q2_002_coefficient_09_0986
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0987 : Poly :=
[
  term ((8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 2), (12, 1)]
]

/-- Partial product 987 for generator 9. -/
def ep_Q2_002_partial_09_0987 : Poly :=
[
  term ((17714465761563756053351934944976 : Rat) / 97983883872014706756151952089) [(2, 1), (6, 1), (11, 2), (12, 1)],
  term ((-8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 9. -/
theorem ep_Q2_002_partial_09_0987_valid :
    mulPoly ep_Q2_002_coefficient_09_0987
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0988 : Poly :=
[
  term ((-15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (15, 2)]
]

/-- Partial product 988 for generator 9. -/
def ep_Q2_002_partial_09_0988 : Poly :=
[
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 2), (15, 2)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 9. -/
theorem ep_Q2_002_partial_09_0988_valid :
    mulPoly ep_Q2_002_coefficient_09_0988
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0989 : Poly :=
[
  term ((-17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 989 for generator 9. -/
def ep_Q2_002_partial_09_0989 : Poly :=
[
  term ((-35356229258193402817733176334976 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 9. -/
theorem ep_Q2_002_partial_09_0989_valid :
    mulPoly ep_Q2_002_coefficient_09_0989
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0990 : Poly :=
[
  term ((-449058280000371355683679790934872675542656 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 990 for generator 9. -/
def ep_Q2_002_partial_09_0990 : Poly :=
[
  term ((-898116560000742711367359581869745351085312 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((449058280000371355683679790934872675542656 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 9. -/
theorem ep_Q2_002_partial_09_0990_valid :
    mulPoly ep_Q2_002_coefficient_09_0990
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0991 : Poly :=
[
  term ((-18201690908 : Rat) / 7401317245) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 991 for generator 9. -/
def ep_Q2_002_partial_09_0991 : Poly :=
[
  term ((-36403381816 : Rat) / 7401317245) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((18201690908 : Rat) / 7401317245) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 9. -/
theorem ep_Q2_002_partial_09_0991_valid :
    mulPoly ep_Q2_002_coefficient_09_0991
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0992 : Poly :=
[
  term ((-1322170548470378763188755807728 : Rat) / 97983883872014706756151952089) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 992 for generator 9. -/
def ep_Q2_002_partial_09_0992 : Poly :=
[
  term ((-2644341096940757526377511615456 : Rat) / 97983883872014706756151952089) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((1322170548470378763188755807728 : Rat) / 97983883872014706756151952089) [(6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 9. -/
theorem ep_Q2_002_partial_09_0992_valid :
    mulPoly ep_Q2_002_coefficient_09_0992
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0993 : Poly :=
[
  term ((1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (15, 3)]
]

/-- Partial product 993 for generator 9. -/
def ep_Q2_002_partial_09_0993 : Poly :=
[
  term ((3515749384676109821755012385992629835019136 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (13, 1), (15, 3)],
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 9. -/
theorem ep_Q2_002_partial_09_0993_valid :
    mulPoly ep_Q2_002_coefficient_09_0993
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0994 : Poly :=
[
  term ((112126330424 : Rat) / 7401317245) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 994 for generator 9. -/
def ep_Q2_002_partial_09_0994 : Poly :=
[
  term ((224252660848 : Rat) / 7401317245) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-112126330424 : Rat) / 7401317245) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 9. -/
theorem ep_Q2_002_partial_09_0994_valid :
    mulPoly ep_Q2_002_coefficient_09_0994
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0995 : Poly :=
[
  term ((188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (15, 2)]
]

/-- Partial product 995 for generator 9. -/
def ep_Q2_002_partial_09_0995 : Poly :=
[
  term ((376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (13, 2), (15, 2)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 9. -/
theorem ep_Q2_002_partial_09_0995_valid :
    mulPoly ep_Q2_002_coefficient_09_0995
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0996 : Poly :=
[
  term ((-33262473723673418585753260305220292611042 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (15, 2)]
]

/-- Partial product 996 for generator 9. -/
def ep_Q2_002_partial_09_0996 : Poly :=
[
  term ((-66524947447346837171506520610440585222084 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (6, 1), (15, 2)],
  term ((33262473723673418585753260305220292611042 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 9. -/
theorem ep_Q2_002_partial_09_0996_valid :
    mulPoly ep_Q2_002_coefficient_09_0996
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0997 : Poly :=
[
  term ((-4499639883 : Rat) / 2960526898) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 997 for generator 9. -/
def ep_Q2_002_partial_09_0997 : Poly :=
[
  term ((-4499639883 : Rat) / 1480263449) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((4499639883 : Rat) / 2960526898) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 9. -/
theorem ep_Q2_002_partial_09_0997_valid :
    mulPoly ep_Q2_002_coefficient_09_0997
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0998 : Poly :=
[
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(6, 2), (11, 1), (15, 1)]
]

/-- Partial product 998 for generator 9. -/
def ep_Q2_002_partial_09_0998 : Poly :=
[
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(6, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 9. -/
theorem ep_Q2_002_partial_09_0998_valid :
    mulPoly ep_Q2_002_coefficient_09_0998
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 9. -/
def ep_Q2_002_coefficient_09_0999 : Poly :=
[
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(6, 2), (13, 1), (15, 1)]
]

/-- Partial product 999 for generator 9. -/
def ep_Q2_002_partial_09_0999 : Poly :=
[
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 9. -/
theorem ep_Q2_002_partial_09_0999_valid :
    mulPoly ep_Q2_002_coefficient_09_0999
        ep_Q2_002_generator_09_0900_0999 =
      ep_Q2_002_partial_09_0999 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_09_0900_0999 : List Poly :=
[
  ep_Q2_002_partial_09_0900,
  ep_Q2_002_partial_09_0901,
  ep_Q2_002_partial_09_0902,
  ep_Q2_002_partial_09_0903,
  ep_Q2_002_partial_09_0904,
  ep_Q2_002_partial_09_0905,
  ep_Q2_002_partial_09_0906,
  ep_Q2_002_partial_09_0907,
  ep_Q2_002_partial_09_0908,
  ep_Q2_002_partial_09_0909,
  ep_Q2_002_partial_09_0910,
  ep_Q2_002_partial_09_0911,
  ep_Q2_002_partial_09_0912,
  ep_Q2_002_partial_09_0913,
  ep_Q2_002_partial_09_0914,
  ep_Q2_002_partial_09_0915,
  ep_Q2_002_partial_09_0916,
  ep_Q2_002_partial_09_0917,
  ep_Q2_002_partial_09_0918,
  ep_Q2_002_partial_09_0919,
  ep_Q2_002_partial_09_0920,
  ep_Q2_002_partial_09_0921,
  ep_Q2_002_partial_09_0922,
  ep_Q2_002_partial_09_0923,
  ep_Q2_002_partial_09_0924,
  ep_Q2_002_partial_09_0925,
  ep_Q2_002_partial_09_0926,
  ep_Q2_002_partial_09_0927,
  ep_Q2_002_partial_09_0928,
  ep_Q2_002_partial_09_0929,
  ep_Q2_002_partial_09_0930,
  ep_Q2_002_partial_09_0931,
  ep_Q2_002_partial_09_0932,
  ep_Q2_002_partial_09_0933,
  ep_Q2_002_partial_09_0934,
  ep_Q2_002_partial_09_0935,
  ep_Q2_002_partial_09_0936,
  ep_Q2_002_partial_09_0937,
  ep_Q2_002_partial_09_0938,
  ep_Q2_002_partial_09_0939,
  ep_Q2_002_partial_09_0940,
  ep_Q2_002_partial_09_0941,
  ep_Q2_002_partial_09_0942,
  ep_Q2_002_partial_09_0943,
  ep_Q2_002_partial_09_0944,
  ep_Q2_002_partial_09_0945,
  ep_Q2_002_partial_09_0946,
  ep_Q2_002_partial_09_0947,
  ep_Q2_002_partial_09_0948,
  ep_Q2_002_partial_09_0949,
  ep_Q2_002_partial_09_0950,
  ep_Q2_002_partial_09_0951,
  ep_Q2_002_partial_09_0952,
  ep_Q2_002_partial_09_0953,
  ep_Q2_002_partial_09_0954,
  ep_Q2_002_partial_09_0955,
  ep_Q2_002_partial_09_0956,
  ep_Q2_002_partial_09_0957,
  ep_Q2_002_partial_09_0958,
  ep_Q2_002_partial_09_0959,
  ep_Q2_002_partial_09_0960,
  ep_Q2_002_partial_09_0961,
  ep_Q2_002_partial_09_0962,
  ep_Q2_002_partial_09_0963,
  ep_Q2_002_partial_09_0964,
  ep_Q2_002_partial_09_0965,
  ep_Q2_002_partial_09_0966,
  ep_Q2_002_partial_09_0967,
  ep_Q2_002_partial_09_0968,
  ep_Q2_002_partial_09_0969,
  ep_Q2_002_partial_09_0970,
  ep_Q2_002_partial_09_0971,
  ep_Q2_002_partial_09_0972,
  ep_Q2_002_partial_09_0973,
  ep_Q2_002_partial_09_0974,
  ep_Q2_002_partial_09_0975,
  ep_Q2_002_partial_09_0976,
  ep_Q2_002_partial_09_0977,
  ep_Q2_002_partial_09_0978,
  ep_Q2_002_partial_09_0979,
  ep_Q2_002_partial_09_0980,
  ep_Q2_002_partial_09_0981,
  ep_Q2_002_partial_09_0982,
  ep_Q2_002_partial_09_0983,
  ep_Q2_002_partial_09_0984,
  ep_Q2_002_partial_09_0985,
  ep_Q2_002_partial_09_0986,
  ep_Q2_002_partial_09_0987,
  ep_Q2_002_partial_09_0988,
  ep_Q2_002_partial_09_0989,
  ep_Q2_002_partial_09_0990,
  ep_Q2_002_partial_09_0991,
  ep_Q2_002_partial_09_0992,
  ep_Q2_002_partial_09_0993,
  ep_Q2_002_partial_09_0994,
  ep_Q2_002_partial_09_0995,
  ep_Q2_002_partial_09_0996,
  ep_Q2_002_partial_09_0997,
  ep_Q2_002_partial_09_0998,
  ep_Q2_002_partial_09_0999
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_09_0900_0999 : Poly :=
[
  term ((125046845046648233984822864079168 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((14300253825730561294765166711592 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((-10802070273067777615157950763808 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (12, 1), (13, 1)],
  term ((36661610094398284041335750944896 : Rat) / 97983883872014706756151952089) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1662963116010683636137503410328577880061648 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((119943161796 : Rat) / 7401317245) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((324536270974815395536233525603291814678836 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-39643219857 : Rat) / 7401317245) [(2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-47297457909169571252814811695864 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1)],
  term ((-11478925426298468518944328113216 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((3395624986543086195623681179429696820996736 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2)],
  term ((224252660848 : Rat) / 7401317245) [(2, 1), (5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-235486626970789296303418248627456 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((-26930055988147287201625935202464 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-142024721562297522130179872152524495433968 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-19365987512 : Rat) / 22203951735) [(2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6444878423005462202791831729930177525567104 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (14, 1), (15, 3)],
  term ((-633902813456 : Rat) / 22203951735) [(2, 1), (5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-54596813688829660254282311535600859116288 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-2487323152 : Rat) / 211466207) [(2, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-366644536219253669652003055641627229025319 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (15, 1)],
  term ((-313631849579 : Rat) / 88815806940) [(2, 1), (5, 1), (15, 1), (16, 1)],
  term ((2805089674211140817842663874118414909025356 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (5, 1), (15, 3)],
  term ((197389596199 : Rat) / 22203951735) [(2, 1), (5, 1), (15, 3), (16, 1)],
  term ((-8290713400643154168021399431688 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (11, 1)],
  term ((33162853602572616672085597726752 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (11, 1), (14, 1)],
  term ((15612965950245775047301246219296 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (13, 1)],
  term ((-62451863800983100189204984877184 : Rat) / 115799135485108289802725034287) [(2, 1), (5, 2), (7, 1), (13, 1), (14, 1)],
  term ((-1798864918700863612923282373934692107147696 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1)],
  term ((-763581270348 : Rat) / 7401317245) [(2, 1), (5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((449716229675215903230820593483673026786924 : Rat) / 122438019774574775144195206323084197045) [(2, 1), (5, 2), (7, 1), (15, 1)],
  term ((190895317587 : Rat) / 7401317245) [(2, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((117530099766188738730213585768288 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (11, 1), (14, 1), (15, 1)],
  term ((-29382524941547184682553396442072 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (11, 1), (15, 1)],
  term ((-221331187933253564025651456986496 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (13, 1), (14, 1), (15, 1)],
  term ((55332796983313391006412864246624 : Rat) / 1273790490336191187829975377157) [(2, 1), (5, 2), (13, 1), (15, 1)],
  term ((955096054767820213715764753308696422106864 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 2), (14, 1), (15, 2)],
  term ((31131114268 : Rat) / 4440790347) [(2, 1), (5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-238774013691955053428941188327174105526716 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (5, 2), (15, 2)],
  term ((-7782778567 : Rat) / 4440790347) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((-89157613782114493560 : Rat) / 253528477699481291099) [(2, 1), (6, 1)],
  term ((426625839293671833417952810677504 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1832662633459654280222474275573315954561152 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((195028145136 : Rat) / 7401317245) [(2, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-226544563932581867337754068923712 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (9, 1), (11, 2)],
  term ((105437980582664750177778948355812 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (11, 1)],
  term ((-255747827698023416306029971210432 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (11, 1), (14, 1)],
  term ((1065179004294772238378912060971987674872856 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((-176342490026 : Rat) / 22203951735) [(2, 1), (6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((135805839136413506742519103630896 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (11, 2), (15, 1)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (13, 1)],
  term ((383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 1), (13, 1), (14, 1)],
  term ((-1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((88171245013 : Rat) / 7401317245) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((806462358816915426603088141137523968119442 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(2, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((767243483094070248918089913631296 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 2), (11, 1), (13, 1)],
  term ((-3195537012884316715136736182915963024618568 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (7, 2), (11, 1), (15, 1)],
  term ((176342490026 : Rat) / 7401317245) [(2, 1), (6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-407417517409240520227557310892688 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (7, 2), (11, 2)],
  term ((17780516342082829308741707745792 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (8, 1), (11, 1), (13, 1)],
  term ((611932449393197869339116175648440261805056 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((10542029528 : Rat) / 7401317245) [(2, 1), (6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-9441714378768639552232807694976 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (8, 1), (11, 2)],
  term ((-801452124209363651890717737642624 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((130586698387072640759769482223992872244544 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (6, 1), (8, 1), (15, 2)],
  term ((-50854235368 : Rat) / 1480263449) [(2, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((56636140983145466834438517230928 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-142208613097890611139317603559168 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-610887544486551426740824758524438651520384 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-65009381712 : Rat) / 7401317245) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((75514854644193955779251356307904 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-106656459823417958354488202669376 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-458165658364913570055618568893328988640288 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((-48757036284 : Rat) / 7401317245) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-33359656448941307461750664745792 : Rat) / 97983883872014706756151952089) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-190834543688804690933994315751194077578104 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-155009388322 : Rat) / 7401317245) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((11837859567903986516481707158320 : Rat) / 115799135485108289802725034287) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((-143044993649987256154381169177664 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-1463432079746395420990750258307178075768086 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((29181255517 : Rat) / 44407903470) [(2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (11, 1), (15, 3)],
  term ((316951406728 : Rat) / 22203951735) [(2, 1), (6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-6286076666490673980949638608460 : Rat) / 115799135485108289802725034287) [(2, 1), (6, 1), (11, 2)],
  term ((17714465761563756053351934944976 : Rat) / 97983883872014706756151952089) [(2, 1), (6, 1), (11, 2), (12, 1)],
  term ((-30164542231633246775576459460960 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (11, 2), (15, 2)],
  term ((-35356229258193402817733176334976 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-898116560000742711367359581869745351085312 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-36403381816 : Rat) / 7401317245) [(2, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2644341096940757526377511615456 : Rat) / 97983883872014706756151952089) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((3515749384676109821755012385992629835019136 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (6, 1), (13, 1), (15, 3)],
  term ((224252660848 : Rat) / 7401317245) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((376355871989336363652770196342528 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 1), (13, 2), (15, 2)],
  term ((-66524947447346837171506520610440585222084 : Rat) / 269363643504064505317229453910785233499) [(2, 1), (6, 1), (15, 2)],
  term ((-4499639883 : Rat) / 1480263449) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((-62523422523324116992411432039584 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (14, 2)],
  term ((-7150126912865280647382583355796 : Rat) / 1273790490336191187829975377157) [(5, 1), (11, 1), (15, 2)],
  term ((5401035136533888807578975381904 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1)],
  term ((-18330805047199142020667875472448 : Rat) / 97983883872014706756151952089) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((831481558005341818068751705164288940030824 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-59971580898 : Rat) / 7401317245) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-162268135487407697768116762801645907339418 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (12, 1), (15, 1)],
  term ((39643219857 : Rat) / 14802634490) [(5, 1), (12, 1), (15, 1), (16, 1)],
  term ((23648728954584785626407405847932 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1)],
  term ((5739462713149234259472164056608 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 1)],
  term ((-1697812493271543097811840589714848410498368 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-112126330424 : Rat) / 7401317245) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((117743313485394648151709124313728 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (14, 2)],
  term ((13465027994073643600812967601232 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 1), (15, 2)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((71012360781148761065089936076262247716984 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 1), (15, 1)],
  term ((9682993756 : Rat) / 22203951735) [(5, 1), (14, 1), (15, 1), (16, 1)],
  term ((3222439211502731101395915864965088762783552 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (14, 1), (15, 3)],
  term ((316951406728 : Rat) / 22203951735) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((27298406844414830127141155767800429558144 : Rat) / 269363643504064505317229453910785233499) [(5, 1), (14, 2), (15, 1)],
  term ((1243661576 : Rat) / 211466207) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((366644536219253669652003055641627229025319 : Rat) / 2693636435040645053172294539107852334990) [(5, 1), (15, 1)],
  term ((313631849579 : Rat) / 177631613880) [(5, 1), (15, 1), (16, 1)],
  term ((-1402544837105570408921331937059207454512678 : Rat) / 1346818217520322526586147269553926167495) [(5, 1), (15, 3)],
  term ((-197389596199 : Rat) / 44407903470) [(5, 1), (15, 3), (16, 1)],
  term ((4145356700321577084010699715844 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (11, 1)],
  term ((-16581426801286308336042798863376 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (11, 1), (14, 1)],
  term ((-7806482975122887523650623109648 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (13, 1)],
  term ((31225931900491550094602492438592 : Rat) / 115799135485108289802725034287) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((899432459350431806461641186967346053573848 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term ((381790635174 : Rat) / 7401317245) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-224858114837607951615410296741836513393462 : Rat) / 122438019774574775144195206323084197045) [(5, 2), (7, 1), (15, 1)],
  term ((-190895317587 : Rat) / 14802634490) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-58765049883094369365106792884144 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (14, 1), (15, 1)],
  term ((14691262470773592341276698221036 : Rat) / 1273790490336191187829975377157) [(5, 2), (11, 1), (15, 1)],
  term ((110665593966626782012825728493248 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 1), (14, 1), (15, 1)],
  term ((-27666398491656695503206432123312 : Rat) / 1273790490336191187829975377157) [(5, 2), (13, 1), (15, 1)],
  term ((-477548027383910106857882376654348211053432 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (14, 1), (15, 2)],
  term ((-15565557134 : Rat) / 4440790347) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((119387006845977526714470594163587052763358 : Rat) / 269363643504064505317229453910785233499) [(5, 2), (15, 2)],
  term ((7782778567 : Rat) / 8881580694) [(5, 2), (15, 2), (16, 1)],
  term ((44578806891057246780 : Rat) / 253528477699481291099) [(6, 1)],
  term ((-213312919646835916708976405338752 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-916331316729827140111237137786657977280576 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1)],
  term ((-97514072568 : Rat) / 7401317245) [(6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((113272281966290933668877034461856 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (9, 1), (11, 2)],
  term ((-52718990291332375088889474177906 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1)],
  term ((127873913849011708153014985605216 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 1), (14, 1)],
  term ((-532589502147386119189456030485993837436428 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (11, 1), (15, 2)],
  term ((88171245013 : Rat) / 22203951735) [(6, 1), (7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-67902919568206753371259551815448 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (11, 2), (15, 1)],
  term ((95905435386758781114761239203912 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (13, 1)],
  term ((-191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 1), (13, 1), (14, 1)],
  term ((798884253221079178784184045728990756154642 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-88171245013 : Rat) / 14802634490) [(6, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-403231179408457713301544070568761984059721 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 1), (15, 1)],
  term ((88171245013 : Rat) / 29605268980) [(6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-383621741547035124459044956815648 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (11, 1), (13, 1)],
  term ((1597768506442158357568368091457981512309284 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (7, 2), (11, 1), (15, 1)],
  term ((-88171245013 : Rat) / 7401317245) [(6, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((203708758704620260113778655446344 : Rat) / 1273790490336191187829975377157) [(6, 1), (7, 2), (11, 2)],
  term ((-8890258171041414654370853872896 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 1), (13, 1)],
  term ((-305966224696598934669558087824220130902528 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (8, 1), (11, 1), (15, 1)],
  term ((-5271014764 : Rat) / 7401317245) [(6, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((4720857189384319776116403847488 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (11, 2)],
  term ((400726062104681825945358868821312 : Rat) / 1273790490336191187829975377157) [(6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-65293349193536320379884741111996436122272 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (8, 1), (15, 2)],
  term ((25427117684 : Rat) / 1480263449) [(6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-28318070491572733417219258615464 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1)],
  term ((71104306548945305569658801779584 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((305443772243275713370412379262219325760192 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (11, 1), (15, 2)],
  term ((32504690856 : Rat) / 7401317245) [(6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-37757427322096977889625678153952 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (11, 2), (15, 1)],
  term ((53328229911708979177244101334688 : Rat) / 1273790490336191187829975377157) [(6, 1), (9, 1), (13, 1)],
  term ((229082829182456785027809284446664494320144 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (9, 1), (15, 1)],
  term ((24378518142 : Rat) / 7401317245) [(6, 1), (9, 1), (15, 1), (16, 1)],
  term ((16679828224470653730875332372896 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((95417271844402345466997157875597038789052 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((77504694161 : Rat) / 7401317245) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5918929783951993258240853579160 : Rat) / 115799135485108289802725034287) [(6, 1), (11, 1), (13, 1)],
  term ((71522496824993628077190584588832 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((731716039873197710495375129153589037884043 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 1)],
  term ((-29181255517 : Rat) / 88815806940) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1611219605751365550697957932482544381391776 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (11, 1), (15, 3)],
  term ((-158475703364 : Rat) / 22203951735) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((3143038333245336990474819304230 : Rat) / 115799135485108289802725034287) [(6, 1), (11, 2)],
  term ((-8857232880781878026675967472488 : Rat) / 97983883872014706756151952089) [(6, 1), (11, 2), (12, 1)],
  term ((15082271115816623387788229730480 : Rat) / 1273790490336191187829975377157) [(6, 1), (11, 2), (15, 2)],
  term ((17678114629096701408866588167488 : Rat) / 1273790490336191187829975377157) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((449058280000371355683679790934872675542656 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (12, 1), (15, 2)],
  term ((18201690908 : Rat) / 7401317245) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((1322170548470378763188755807728 : Rat) / 97983883872014706756151952089) [(6, 1), (13, 1), (15, 1)],
  term ((-1757874692338054910877506192996314917509568 : Rat) / 1346818217520322526586147269553926167495) [(6, 1), (13, 1), (15, 3)],
  term ((-112126330424 : Rat) / 7401317245) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-188177935994668181826385098171264 : Rat) / 1273790490336191187829975377157) [(6, 1), (13, 2), (15, 2)],
  term ((33262473723673418585753260305220292611042 : Rat) / 269363643504064505317229453910785233499) [(6, 1), (15, 2)],
  term ((4499639883 : Rat) / 2960526898) [(6, 1), (15, 2), (16, 1)],
  term ((-101854379352310130056889327723172 : Rat) / 1273790490336191187829975377157) [(6, 2), (11, 1), (15, 1)],
  term ((191810870773517562229522478407824 : Rat) / 1273790490336191187829975377157) [(6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 900 through 999. -/
theorem ep_Q2_002_block_09_0900_0999_valid :
    checkProductSumEq ep_Q2_002_partials_09_0900_0999
      ep_Q2_002_block_09_0900_0999 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
