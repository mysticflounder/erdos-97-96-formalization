/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 27:900-952

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_27_0900_0952 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0900 : Poly :=
[
  term ((-3377885020038 : Rat) / 45033486517) [(9, 1), (12, 2), (15, 1)]
]

/-- Partial product 900 for generator 27. -/
def ep_Q2_054_partial_27_0900 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((3377885020038 : Rat) / 45033486517) [(9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 27. -/
theorem ep_Q2_054_partial_27_0900_valid :
    mulPoly ep_Q2_054_coefficient_27_0900
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0901 : Poly :=
[
  term ((40020353319151 : Rat) / 360267892136) [(9, 1), (13, 1)]
]

/-- Partial product 901 for generator 27. -/
def ep_Q2_054_partial_27_0901 : Poly :=
[
  term ((-40020353319151 : Rat) / 360267892136) [(9, 1), (13, 1)],
  term ((40020353319151 : Rat) / 180133946068) [(9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 27. -/
theorem ep_Q2_054_partial_27_0901_valid :
    mulPoly ep_Q2_054_coefficient_27_0901
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0902 : Poly :=
[
  term ((8374753560781 : Rat) / 180133946068) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 902 for generator 27. -/
def ep_Q2_054_partial_27_0902 : Poly :=
[
  term ((-8374753560781 : Rat) / 180133946068) [(9, 1), (13, 1), (14, 1)],
  term ((8374753560781 : Rat) / 90066973034) [(9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 27. -/
theorem ep_Q2_054_partial_27_0902_valid :
    mulPoly ep_Q2_054_coefficient_27_0902
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0903 : Poly :=
[
  term ((-4093741004229 : Rat) / 45033486517) [(9, 1), (15, 1)]
]

/-- Partial product 903 for generator 27. -/
def ep_Q2_054_partial_27_0903 : Poly :=
[
  term ((-8187482008458 : Rat) / 45033486517) [(9, 1), (14, 1), (15, 1)],
  term ((4093741004229 : Rat) / 45033486517) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 27. -/
theorem ep_Q2_054_partial_27_0903_valid :
    mulPoly ep_Q2_054_coefficient_27_0903
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0904 : Poly :=
[
  term ((-479144542005 : Rat) / 45033486517) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 904 for generator 27. -/
def ep_Q2_054_partial_27_0904 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((479144542005 : Rat) / 45033486517) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 27. -/
theorem ep_Q2_054_partial_27_0904_valid :
    mulPoly ep_Q2_054_coefficient_27_0904
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0905 : Poly :=
[
  term ((-334647651093 : Rat) / 90066973034) [(9, 2)]
]

/-- Partial product 905 for generator 27. -/
def ep_Q2_054_partial_27_0905 : Poly :=
[
  term ((334647651093 : Rat) / 90066973034) [(9, 2)],
  term ((-334647651093 : Rat) / 45033486517) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 27. -/
theorem ep_Q2_054_partial_27_0905_valid :
    mulPoly ep_Q2_054_coefficient_27_0905
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0906 : Poly :=
[
  term ((-81445052796 : Rat) / 45033486517) [(9, 2), (10, 1)]
]

/-- Partial product 906 for generator 27. -/
def ep_Q2_054_partial_27_0906 : Poly :=
[
  term ((81445052796 : Rat) / 45033486517) [(9, 2), (10, 1)],
  term ((-162890105592 : Rat) / 45033486517) [(9, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 27. -/
theorem ep_Q2_054_partial_27_0906_valid :
    mulPoly ep_Q2_054_coefficient_27_0906
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0907 : Poly :=
[
  term ((-571563488916 : Rat) / 45033486517) [(9, 2), (10, 1), (12, 1)]
]

/-- Partial product 907 for generator 27. -/
def ep_Q2_054_partial_27_0907 : Poly :=
[
  term ((571563488916 : Rat) / 45033486517) [(9, 2), (10, 1), (12, 1)],
  term ((-1143126977832 : Rat) / 45033486517) [(9, 2), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 27. -/
theorem ep_Q2_054_partial_27_0907_valid :
    mulPoly ep_Q2_054_coefficient_27_0907
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0908 : Poly :=
[
  term ((-61445819433 : Rat) / 45033486517) [(9, 2), (12, 1)]
]

/-- Partial product 908 for generator 27. -/
def ep_Q2_054_partial_27_0908 : Poly :=
[
  term ((61445819433 : Rat) / 45033486517) [(9, 2), (12, 1)],
  term ((-122891638866 : Rat) / 45033486517) [(9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 27. -/
theorem ep_Q2_054_partial_27_0908_valid :
    mulPoly ep_Q2_054_coefficient_27_0908
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0909 : Poly :=
[
  term ((155677659219 : Rat) / 45033486517) [(9, 2), (14, 1)]
]

/-- Partial product 909 for generator 27. -/
def ep_Q2_054_partial_27_0909 : Poly :=
[
  term ((-155677659219 : Rat) / 45033486517) [(9, 2), (14, 1)],
  term ((311355318438 : Rat) / 45033486517) [(9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 27. -/
theorem ep_Q2_054_partial_27_0909_valid :
    mulPoly ep_Q2_054_coefficient_27_0909
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0910 : Poly :=
[
  term ((-4017231571059 : Rat) / 180133946068) [(10, 1)]
]

/-- Partial product 910 for generator 27. -/
def ep_Q2_054_partial_27_0910 : Poly :=
[
  term ((4017231571059 : Rat) / 180133946068) [(10, 1)],
  term ((-4017231571059 : Rat) / 90066973034) [(10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 27. -/
theorem ep_Q2_054_partial_27_0910_valid :
    mulPoly ep_Q2_054_coefficient_27_0910
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0911 : Poly :=
[
  term ((-12351476306976 : Rat) / 45033486517) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 911 for generator 27. -/
def ep_Q2_054_partial_27_0911 : Poly :=
[
  term ((-24702952613952 : Rat) / 45033486517) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((12351476306976 : Rat) / 45033486517) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 27. -/
theorem ep_Q2_054_partial_27_0911_valid :
    mulPoly ep_Q2_054_coefficient_27_0911
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0912 : Poly :=
[
  term ((-1097348024922 : Rat) / 45033486517) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 912 for generator 27. -/
def ep_Q2_054_partial_27_0912 : Poly :=
[
  term ((1097348024922 : Rat) / 45033486517) [(10, 1), (11, 1), (13, 1)],
  term ((-2194696049844 : Rat) / 45033486517) [(10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 27. -/
theorem ep_Q2_054_partial_27_0912_valid :
    mulPoly ep_Q2_054_coefficient_27_0912
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0913 : Poly :=
[
  term ((24419433217926 : Rat) / 45033486517) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 913 for generator 27. -/
def ep_Q2_054_partial_27_0913 : Poly :=
[
  term ((48838866435852 : Rat) / 45033486517) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-24419433217926 : Rat) / 45033486517) [(10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 27. -/
theorem ep_Q2_054_partial_27_0913_valid :
    mulPoly ep_Q2_054_coefficient_27_0913
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0914 : Poly :=
[
  term ((551687611376 : Rat) / 45033486517) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 914 for generator 27. -/
def ep_Q2_054_partial_27_0914 : Poly :=
[
  term ((1103375222752 : Rat) / 45033486517) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-551687611376 : Rat) / 45033486517) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 27. -/
theorem ep_Q2_054_partial_27_0914_valid :
    mulPoly ep_Q2_054_coefficient_27_0914
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0915 : Poly :=
[
  term ((-3292044074766 : Rat) / 45033486517) [(10, 1), (11, 2)]
]

/-- Partial product 915 for generator 27. -/
def ep_Q2_054_partial_27_0915 : Poly :=
[
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (11, 2)],
  term ((-6584088149532 : Rat) / 45033486517) [(10, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 27. -/
theorem ep_Q2_054_partial_27_0915_valid :
    mulPoly ep_Q2_054_coefficient_27_0915
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0916 : Poly :=
[
  term ((548674012461 : Rat) / 45033486517) [(10, 1), (12, 1)]
]

/-- Partial product 916 for generator 27. -/
def ep_Q2_054_partial_27_0916 : Poly :=
[
  term ((-548674012461 : Rat) / 45033486517) [(10, 1), (12, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 27. -/
theorem ep_Q2_054_partial_27_0916_valid :
    mulPoly ep_Q2_054_coefficient_27_0916
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0917 : Poly :=
[
  term ((-13511540080152 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 917 for generator 27. -/
def ep_Q2_054_partial_27_0917 : Poly :=
[
  term ((-27023080160304 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 27. -/
theorem ep_Q2_054_partial_27_0917_valid :
    mulPoly ep_Q2_054_coefficient_27_0917
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0918 : Poly :=
[
  term ((2268974396607 : Rat) / 45033486517) [(10, 1), (12, 1), (15, 2)]
]

/-- Partial product 918 for generator 27. -/
def ep_Q2_054_partial_27_0918 : Poly :=
[
  term ((4537948793214 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2268974396607 : Rat) / 45033486517) [(10, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 27. -/
theorem ep_Q2_054_partial_27_0918_valid :
    mulPoly ep_Q2_054_coefficient_27_0918
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0919 : Poly :=
[
  term ((-15134559175 : Rat) / 45033486517) [(10, 1), (12, 1), (16, 1)]
]

/-- Partial product 919 for generator 27. -/
def ep_Q2_054_partial_27_0919 : Poly :=
[
  term ((-30269118350 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((15134559175 : Rat) / 45033486517) [(10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 27. -/
theorem ep_Q2_054_partial_27_0919_valid :
    mulPoly ep_Q2_054_coefficient_27_0919
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0920 : Poly :=
[
  term ((-23477288408891 : Rat) / 90066973034) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 920 for generator 27. -/
def ep_Q2_054_partial_27_0920 : Poly :=
[
  term ((-23477288408891 : Rat) / 45033486517) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((23477288408891 : Rat) / 90066973034) [(10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 27. -/
theorem ep_Q2_054_partial_27_0920_valid :
    mulPoly ep_Q2_054_coefficient_27_0920
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0921 : Poly :=
[
  term ((30269118350 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 921 for generator 27. -/
def ep_Q2_054_partial_27_0921 : Poly :=
[
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 27. -/
theorem ep_Q2_054_partial_27_0921_valid :
    mulPoly ep_Q2_054_coefficient_27_0921
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0922 : Poly :=
[
  term ((4662017721790 : Rat) / 45033486517) [(10, 1), (15, 2)]
]

/-- Partial product 922 for generator 27. -/
def ep_Q2_054_partial_27_0922 : Poly :=
[
  term ((9324035443580 : Rat) / 45033486517) [(10, 1), (14, 1), (15, 2)],
  term ((-4662017721790 : Rat) / 45033486517) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 27. -/
theorem ep_Q2_054_partial_27_0922_valid :
    mulPoly ep_Q2_054_coefficient_27_0922
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0923 : Poly :=
[
  term ((521418493026 : Rat) / 45033486517) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 923 for generator 27. -/
def ep_Q2_054_partial_27_0923 : Poly :=
[
  term ((1042836986052 : Rat) / 45033486517) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-521418493026 : Rat) / 45033486517) [(10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 27. -/
theorem ep_Q2_054_partial_27_0923_valid :
    mulPoly ep_Q2_054_coefficient_27_0923
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0924 : Poly :=
[
  term ((15134559175 : Rat) / 90066973034) [(10, 1), (16, 1)]
]

/-- Partial product 924 for generator 27. -/
def ep_Q2_054_partial_27_0924 : Poly :=
[
  term ((15134559175 : Rat) / 45033486517) [(10, 1), (14, 1), (16, 1)],
  term ((-15134559175 : Rat) / 90066973034) [(10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 27. -/
theorem ep_Q2_054_partial_27_0924_valid :
    mulPoly ep_Q2_054_coefficient_27_0924
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0925 : Poly :=
[
  term ((-2268974396607 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 925 for generator 27. -/
def ep_Q2_054_partial_27_0925 : Poly :=
[
  term ((2268974396607 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4537948793214 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 27. -/
theorem ep_Q2_054_partial_27_0925_valid :
    mulPoly ep_Q2_054_coefficient_27_0925
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0926 : Poly :=
[
  term ((16262579021296 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 926 for generator 27. -/
def ep_Q2_054_partial_27_0926 : Poly :=
[
  term ((32525158042592 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-16262579021296 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 27. -/
theorem ep_Q2_054_partial_27_0926_valid :
    mulPoly ep_Q2_054_coefficient_27_0926
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0927 : Poly :=
[
  term ((-30269118350 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 927 for generator 27. -/
def ep_Q2_054_partial_27_0927 : Poly :=
[
  term ((-60538236700 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 27. -/
theorem ep_Q2_054_partial_27_0927_valid :
    mulPoly ep_Q2_054_coefficient_27_0927
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0928 : Poly :=
[
  term ((13511540080152 : Rat) / 45033486517) [(11, 1), (12, 2), (15, 1)]
]

/-- Partial product 928 for generator 27. -/
def ep_Q2_054_partial_27_0928 : Poly :=
[
  term ((27023080160304 : Rat) / 45033486517) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 27. -/
theorem ep_Q2_054_partial_27_0928_valid :
    mulPoly ep_Q2_054_coefficient_27_0928
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0929 : Poly :=
[
  term ((548674012461 : Rat) / 45033486517) [(11, 1), (13, 1)]
]

/-- Partial product 929 for generator 27. -/
def ep_Q2_054_partial_27_0929 : Poly :=
[
  term ((-548674012461 : Rat) / 45033486517) [(11, 1), (13, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 27. -/
theorem ep_Q2_054_partial_27_0929_valid :
    mulPoly ep_Q2_054_coefficient_27_0929
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0930 : Poly :=
[
  term ((1097348024922 : Rat) / 45033486517) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 930 for generator 27. -/
def ep_Q2_054_partial_27_0930 : Poly :=
[
  term ((-1097348024922 : Rat) / 45033486517) [(11, 1), (13, 1), (14, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 27. -/
theorem ep_Q2_054_partial_27_0930_valid :
    mulPoly ep_Q2_054_coefficient_27_0930
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0931 : Poly :=
[
  term ((-4662017721790 : Rat) / 45033486517) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 931 for generator 27. -/
def ep_Q2_054_partial_27_0931 : Poly :=
[
  term ((4662017721790 : Rat) / 45033486517) [(11, 1), (14, 1), (15, 1)],
  term ((-9324035443580 : Rat) / 45033486517) [(11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 27. -/
theorem ep_Q2_054_partial_27_0931_valid :
    mulPoly ep_Q2_054_coefficient_27_0931
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0932 : Poly :=
[
  term ((-521418493026 : Rat) / 45033486517) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 932 for generator 27. -/
def ep_Q2_054_partial_27_0932 : Poly :=
[
  term ((521418493026 : Rat) / 45033486517) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1042836986052 : Rat) / 45033486517) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 27. -/
theorem ep_Q2_054_partial_27_0932_valid :
    mulPoly ep_Q2_054_coefficient_27_0932
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0933 : Poly :=
[
  term ((-24737082707685 : Rat) / 90066973034) [(11, 1), (15, 1)]
]

/-- Partial product 933 for generator 27. -/
def ep_Q2_054_partial_27_0933 : Poly :=
[
  term ((-24737082707685 : Rat) / 45033486517) [(11, 1), (14, 1), (15, 1)],
  term ((24737082707685 : Rat) / 90066973034) [(11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 27. -/
theorem ep_Q2_054_partial_27_0933_valid :
    mulPoly ep_Q2_054_coefficient_27_0933
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0934 : Poly :=
[
  term ((-290978364863 : Rat) / 45033486517) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 934 for generator 27. -/
def ep_Q2_054_partial_27_0934 : Poly :=
[
  term ((-581956729726 : Rat) / 45033486517) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((290978364863 : Rat) / 45033486517) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 27. -/
theorem ep_Q2_054_partial_27_0934_valid :
    mulPoly ep_Q2_054_coefficient_27_0934
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0935 : Poly :=
[
  term ((1646022037383 : Rat) / 45033486517) [(11, 2)]
]

/-- Partial product 935 for generator 27. -/
def ep_Q2_054_partial_27_0935 : Poly :=
[
  term ((-1646022037383 : Rat) / 45033486517) [(11, 2)],
  term ((3292044074766 : Rat) / 45033486517) [(11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 27. -/
theorem ep_Q2_054_partial_27_0935_valid :
    mulPoly ep_Q2_054_coefficient_27_0935
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0936 : Poly :=
[
  term ((4389392099688 : Rat) / 45033486517) [(11, 2), (12, 1)]
]

/-- Partial product 936 for generator 27. -/
def ep_Q2_054_partial_27_0936 : Poly :=
[
  term ((-4389392099688 : Rat) / 45033486517) [(11, 2), (12, 1)],
  term ((8778784199376 : Rat) / 45033486517) [(11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 27. -/
theorem ep_Q2_054_partial_27_0936_valid :
    mulPoly ep_Q2_054_coefficient_27_0936
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0937 : Poly :=
[
  term ((60538236700 : Rat) / 45033486517) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 937 for generator 27. -/
def ep_Q2_054_partial_27_0937 : Poly :=
[
  term ((121076473400 : Rat) / 45033486517) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 27. -/
theorem ep_Q2_054_partial_27_0937_valid :
    mulPoly ep_Q2_054_coefficient_27_0937
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0938 : Poly :=
[
  term ((-1097348024922 : Rat) / 45033486517) [(11, 2), (14, 1)]
]

/-- Partial product 938 for generator 27. -/
def ep_Q2_054_partial_27_0938 : Poly :=
[
  term ((1097348024922 : Rat) / 45033486517) [(11, 2), (14, 1)],
  term ((-2194696049844 : Rat) / 45033486517) [(11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 27. -/
theorem ep_Q2_054_partial_27_0938_valid :
    mulPoly ep_Q2_054_coefficient_27_0938
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0939 : Poly :=
[
  term ((-30269118350 : Rat) / 45033486517) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 939 for generator 27. -/
def ep_Q2_054_partial_27_0939 : Poly :=
[
  term ((30269118350 : Rat) / 45033486517) [(11, 2), (14, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 27. -/
theorem ep_Q2_054_partial_27_0939_valid :
    mulPoly ep_Q2_054_coefficient_27_0939
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0940 : Poly :=
[
  term ((45403677525 : Rat) / 45033486517) [(11, 2), (16, 1)]
]

/-- Partial product 940 for generator 27. -/
def ep_Q2_054_partial_27_0940 : Poly :=
[
  term ((90807355050 : Rat) / 45033486517) [(11, 2), (14, 1), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 27. -/
theorem ep_Q2_054_partial_27_0940_valid :
    mulPoly ep_Q2_054_coefficient_27_0940
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0941 : Poly :=
[
  term ((-3369375878519 : Rat) / 180133946068) [(12, 1)]
]

/-- Partial product 941 for generator 27. -/
def ep_Q2_054_partial_27_0941 : Poly :=
[
  term ((3369375878519 : Rat) / 180133946068) [(12, 1)],
  term ((-3369375878519 : Rat) / 90066973034) [(12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 27. -/
theorem ep_Q2_054_partial_27_0941_valid :
    mulPoly ep_Q2_054_coefficient_27_0941
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0942 : Poly :=
[
  term ((3377885020038 : Rat) / 45033486517) [(12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 942 for generator 27. -/
def ep_Q2_054_partial_27_0942 : Poly :=
[
  term ((-3377885020038 : Rat) / 45033486517) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 27. -/
theorem ep_Q2_054_partial_27_0942_valid :
    mulPoly ep_Q2_054_coefficient_27_0942
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0943 : Poly :=
[
  term ((-1859887110627 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 943 for generator 27. -/
def ep_Q2_054_partial_27_0943 : Poly :=
[
  term ((-3719774221254 : Rat) / 45033486517) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((1859887110627 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 27. -/
theorem ep_Q2_054_partial_27_0943_valid :
    mulPoly ep_Q2_054_coefficient_27_0943
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0944 : Poly :=
[
  term ((3430120652711 : Rat) / 180133946068) [(12, 1), (14, 1)]
]

/-- Partial product 944 for generator 27. -/
def ep_Q2_054_partial_27_0944 : Poly :=
[
  term ((-3430120652711 : Rat) / 180133946068) [(12, 1), (14, 1)],
  term ((3430120652711 : Rat) / 90066973034) [(12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 27. -/
theorem ep_Q2_054_partial_27_0944_valid :
    mulPoly ep_Q2_054_coefficient_27_0944
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0945 : Poly :=
[
  term ((-22471643921764 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

/-- Partial product 945 for generator 27. -/
def ep_Q2_054_partial_27_0945 : Poly :=
[
  term ((-44943287843528 : Rat) / 45033486517) [(12, 1), (14, 1), (15, 2)],
  term ((22471643921764 : Rat) / 45033486517) [(12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 27. -/
theorem ep_Q2_054_partial_27_0945_valid :
    mulPoly ep_Q2_054_coefficient_27_0945
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0946 : Poly :=
[
  term ((15134559175 : Rat) / 90066973034) [(12, 1), (16, 1)]
]

/-- Partial product 946 for generator 27. -/
def ep_Q2_054_partial_27_0946 : Poly :=
[
  term ((15134559175 : Rat) / 45033486517) [(12, 1), (14, 1), (16, 1)],
  term ((-15134559175 : Rat) / 90066973034) [(12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 27. -/
theorem ep_Q2_054_partial_27_0946_valid :
    mulPoly ep_Q2_054_coefficient_27_0946
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0947 : Poly :=
[
  term ((-3377885020038 : Rat) / 45033486517) [(12, 2), (15, 2)]
]

/-- Partial product 947 for generator 27. -/
def ep_Q2_054_partial_27_0947 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(12, 2), (14, 1), (15, 2)],
  term ((3377885020038 : Rat) / 45033486517) [(12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 27. -/
theorem ep_Q2_054_partial_27_0947_valid :
    mulPoly ep_Q2_054_coefficient_27_0947
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0948 : Poly :=
[
  term ((4254878943223 : Rat) / 45033486517) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 948 for generator 27. -/
def ep_Q2_054_partial_27_0948 : Poly :=
[
  term ((-4254878943223 : Rat) / 45033486517) [(13, 1), (14, 1), (15, 1)],
  term ((8509757886446 : Rat) / 45033486517) [(13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 27. -/
theorem ep_Q2_054_partial_27_0948_valid :
    mulPoly ep_Q2_054_coefficient_27_0948
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0949 : Poly :=
[
  term ((5870274320306 : Rat) / 45033486517) [(13, 1), (15, 1)]
]

/-- Partial product 949 for generator 27. -/
def ep_Q2_054_partial_27_0949 : Poly :=
[
  term ((11740548640612 : Rat) / 45033486517) [(13, 1), (14, 1), (15, 1)],
  term ((-5870274320306 : Rat) / 45033486517) [(13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 27. -/
theorem ep_Q2_054_partial_27_0949_valid :
    mulPoly ep_Q2_054_coefficient_27_0949
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0950 : Poly :=
[
  term ((226468378034 : Rat) / 45033486517) [(14, 1)]
]

/-- Partial product 950 for generator 27. -/
def ep_Q2_054_partial_27_0950 : Poly :=
[
  term ((-226468378034 : Rat) / 45033486517) [(14, 1)],
  term ((452936756068 : Rat) / 45033486517) [(14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 27. -/
theorem ep_Q2_054_partial_27_0950_valid :
    mulPoly ep_Q2_054_coefficient_27_0950
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0951 : Poly :=
[
  term ((8355678486513 : Rat) / 45033486517) [(15, 2)]
]

/-- Partial product 951 for generator 27. -/
def ep_Q2_054_partial_27_0951 : Poly :=
[
  term ((16711356973026 : Rat) / 45033486517) [(14, 1), (15, 2)],
  term ((-8355678486513 : Rat) / 45033486517) [(15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 27. -/
theorem ep_Q2_054_partial_27_0951_valid :
    mulPoly ep_Q2_054_coefficient_27_0951
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0952 : Poly :=
[
  term ((15134559175 : Rat) / 90066973034) [(16, 1)]
]

/-- Partial product 952 for generator 27. -/
def ep_Q2_054_partial_27_0952 : Poly :=
[
  term ((15134559175 : Rat) / 45033486517) [(14, 1), (16, 1)],
  term ((-15134559175 : Rat) / 90066973034) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 27. -/
theorem ep_Q2_054_partial_27_0952_valid :
    mulPoly ep_Q2_054_coefficient_27_0952
        ep_Q2_054_generator_27_0900_0952 =
      ep_Q2_054_partial_27_0952 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_27_0900_0952 : List Poly :=
[
  ep_Q2_054_partial_27_0900,
  ep_Q2_054_partial_27_0901,
  ep_Q2_054_partial_27_0902,
  ep_Q2_054_partial_27_0903,
  ep_Q2_054_partial_27_0904,
  ep_Q2_054_partial_27_0905,
  ep_Q2_054_partial_27_0906,
  ep_Q2_054_partial_27_0907,
  ep_Q2_054_partial_27_0908,
  ep_Q2_054_partial_27_0909,
  ep_Q2_054_partial_27_0910,
  ep_Q2_054_partial_27_0911,
  ep_Q2_054_partial_27_0912,
  ep_Q2_054_partial_27_0913,
  ep_Q2_054_partial_27_0914,
  ep_Q2_054_partial_27_0915,
  ep_Q2_054_partial_27_0916,
  ep_Q2_054_partial_27_0917,
  ep_Q2_054_partial_27_0918,
  ep_Q2_054_partial_27_0919,
  ep_Q2_054_partial_27_0920,
  ep_Q2_054_partial_27_0921,
  ep_Q2_054_partial_27_0922,
  ep_Q2_054_partial_27_0923,
  ep_Q2_054_partial_27_0924,
  ep_Q2_054_partial_27_0925,
  ep_Q2_054_partial_27_0926,
  ep_Q2_054_partial_27_0927,
  ep_Q2_054_partial_27_0928,
  ep_Q2_054_partial_27_0929,
  ep_Q2_054_partial_27_0930,
  ep_Q2_054_partial_27_0931,
  ep_Q2_054_partial_27_0932,
  ep_Q2_054_partial_27_0933,
  ep_Q2_054_partial_27_0934,
  ep_Q2_054_partial_27_0935,
  ep_Q2_054_partial_27_0936,
  ep_Q2_054_partial_27_0937,
  ep_Q2_054_partial_27_0938,
  ep_Q2_054_partial_27_0939,
  ep_Q2_054_partial_27_0940,
  ep_Q2_054_partial_27_0941,
  ep_Q2_054_partial_27_0942,
  ep_Q2_054_partial_27_0943,
  ep_Q2_054_partial_27_0944,
  ep_Q2_054_partial_27_0945,
  ep_Q2_054_partial_27_0946,
  ep_Q2_054_partial_27_0947,
  ep_Q2_054_partial_27_0948,
  ep_Q2_054_partial_27_0949,
  ep_Q2_054_partial_27_0950,
  ep_Q2_054_partial_27_0951,
  ep_Q2_054_partial_27_0952
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_27_0900_0952 : Poly :=
[
  term ((-6755770040076 : Rat) / 45033486517) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((3377885020038 : Rat) / 45033486517) [(9, 1), (12, 2), (15, 1)],
  term ((-40020353319151 : Rat) / 360267892136) [(9, 1), (13, 1)],
  term ((15822799879185 : Rat) / 90066973034) [(9, 1), (13, 1), (14, 1)],
  term ((8374753560781 : Rat) / 90066973034) [(9, 1), (13, 1), (14, 2)],
  term ((-8187482008458 : Rat) / 45033486517) [(9, 1), (14, 1), (15, 1)],
  term ((-958289084010 : Rat) / 45033486517) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4093741004229 : Rat) / 45033486517) [(9, 1), (15, 1)],
  term ((479144542005 : Rat) / 45033486517) [(9, 1), (15, 1), (16, 1)],
  term ((334647651093 : Rat) / 90066973034) [(9, 2)],
  term ((81445052796 : Rat) / 45033486517) [(9, 2), (10, 1)],
  term ((571563488916 : Rat) / 45033486517) [(9, 2), (10, 1), (12, 1)],
  term ((-1143126977832 : Rat) / 45033486517) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-162890105592 : Rat) / 45033486517) [(9, 2), (10, 1), (14, 1)],
  term ((61445819433 : Rat) / 45033486517) [(9, 2), (12, 1)],
  term ((-122891638866 : Rat) / 45033486517) [(9, 2), (12, 1), (14, 1)],
  term ((-490325310312 : Rat) / 45033486517) [(9, 2), (14, 1)],
  term ((311355318438 : Rat) / 45033486517) [(9, 2), (14, 2)],
  term ((4017231571059 : Rat) / 180133946068) [(10, 1)],
  term ((-24702952613952 : Rat) / 45033486517) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((12351476306976 : Rat) / 45033486517) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(10, 1), (11, 1), (13, 1)],
  term ((-2194696049844 : Rat) / 45033486517) [(10, 1), (11, 1), (13, 1), (14, 1)],
  term ((48838866435852 : Rat) / 45033486517) [(10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1103375222752 : Rat) / 45033486517) [(10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24419433217926 : Rat) / 45033486517) [(10, 1), (11, 1), (15, 1)],
  term ((-551687611376 : Rat) / 45033486517) [(10, 1), (11, 1), (15, 1), (16, 1)],
  term ((3292044074766 : Rat) / 45033486517) [(10, 1), (11, 2)],
  term ((-6584088149532 : Rat) / 45033486517) [(10, 1), (11, 2), (14, 1)],
  term ((-548674012461 : Rat) / 45033486517) [(10, 1), (12, 1)],
  term ((-27023080160304 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((13511540080152 : Rat) / 45033486517) [(10, 1), (12, 1), (13, 1), (15, 1)],
  term ((1097348024922 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1)],
  term ((4537948793214 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-30269118350 : Rat) / 45033486517) [(10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2268974396607 : Rat) / 45033486517) [(10, 1), (12, 1), (15, 2)],
  term ((15134559175 : Rat) / 45033486517) [(10, 1), (12, 1), (16, 1)],
  term ((-23477288408891 : Rat) / 45033486517) [(10, 1), (13, 1), (14, 1), (15, 1)],
  term ((60538236700 : Rat) / 45033486517) [(10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23477288408891 : Rat) / 90066973034) [(10, 1), (13, 1), (15, 1)],
  term ((-30269118350 : Rat) / 45033486517) [(10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4017231571059 : Rat) / 90066973034) [(10, 1), (14, 1)],
  term ((9324035443580 : Rat) / 45033486517) [(10, 1), (14, 1), (15, 2)],
  term ((1042836986052 : Rat) / 45033486517) [(10, 1), (14, 1), (15, 2), (16, 1)],
  term ((15134559175 : Rat) / 45033486517) [(10, 1), (14, 1), (16, 1)],
  term ((-4662017721790 : Rat) / 45033486517) [(10, 1), (15, 2)],
  term ((-521418493026 : Rat) / 45033486517) [(10, 1), (15, 2), (16, 1)],
  term ((-15134559175 : Rat) / 90066973034) [(10, 1), (16, 1)],
  term ((34794132439199 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4537948793214 : Rat) / 45033486517) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-16262579021296 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1)],
  term ((30269118350 : Rat) / 45033486517) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((27023080160304 : Rat) / 45033486517) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-13511540080152 : Rat) / 45033486517) [(11, 1), (12, 2), (15, 1)],
  term ((-548674012461 : Rat) / 45033486517) [(11, 1), (13, 1)],
  term ((2194696049844 : Rat) / 45033486517) [(11, 1), (13, 1), (14, 2)],
  term ((-20075064985895 : Rat) / 45033486517) [(11, 1), (14, 1), (15, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9324035443580 : Rat) / 45033486517) [(11, 1), (14, 2), (15, 1)],
  term ((-1042836986052 : Rat) / 45033486517) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((24737082707685 : Rat) / 90066973034) [(11, 1), (15, 1)],
  term ((290978364863 : Rat) / 45033486517) [(11, 1), (15, 1), (16, 1)],
  term ((-1646022037383 : Rat) / 45033486517) [(11, 2)],
  term ((-4389392099688 : Rat) / 45033486517) [(11, 2), (12, 1)],
  term ((8778784199376 : Rat) / 45033486517) [(11, 2), (12, 1), (14, 1)],
  term ((121076473400 : Rat) / 45033486517) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 2), (12, 1), (16, 1)],
  term ((4389392099688 : Rat) / 45033486517) [(11, 2), (14, 1)],
  term ((121076473400 : Rat) / 45033486517) [(11, 2), (14, 1), (16, 1)],
  term ((-2194696049844 : Rat) / 45033486517) [(11, 2), (14, 2)],
  term ((-60538236700 : Rat) / 45033486517) [(11, 2), (14, 2), (16, 1)],
  term ((-45403677525 : Rat) / 45033486517) [(11, 2), (16, 1)],
  term ((3369375878519 : Rat) / 180133946068) [(12, 1)],
  term ((-7097659241292 : Rat) / 45033486517) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((6755770040076 : Rat) / 45033486517) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((1859887110627 : Rat) / 45033486517) [(12, 1), (13, 1), (15, 1)],
  term ((-10168872409749 : Rat) / 180133946068) [(12, 1), (14, 1)],
  term ((-44943287843528 : Rat) / 45033486517) [(12, 1), (14, 1), (15, 2)],
  term ((15134559175 : Rat) / 45033486517) [(12, 1), (14, 1), (16, 1)],
  term ((3430120652711 : Rat) / 90066973034) [(12, 1), (14, 2)],
  term ((22471643921764 : Rat) / 45033486517) [(12, 1), (15, 2)],
  term ((-15134559175 : Rat) / 90066973034) [(12, 1), (16, 1)],
  term ((-6755770040076 : Rat) / 45033486517) [(12, 2), (14, 1), (15, 2)],
  term ((3377885020038 : Rat) / 45033486517) [(12, 2), (15, 2)],
  term ((7485669697389 : Rat) / 45033486517) [(13, 1), (14, 1), (15, 1)],
  term ((8509757886446 : Rat) / 45033486517) [(13, 1), (14, 2), (15, 1)],
  term ((-5870274320306 : Rat) / 45033486517) [(13, 1), (15, 1)],
  term ((-226468378034 : Rat) / 45033486517) [(14, 1)],
  term ((16711356973026 : Rat) / 45033486517) [(14, 1), (15, 2)],
  term ((15134559175 : Rat) / 45033486517) [(14, 1), (16, 1)],
  term ((452936756068 : Rat) / 45033486517) [(14, 2)],
  term ((-8355678486513 : Rat) / 45033486517) [(15, 2)],
  term ((-15134559175 : Rat) / 90066973034) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 900 through 952. -/
theorem ep_Q2_054_block_27_0900_0952_valid :
    checkProductSumEq ep_Q2_054_partials_27_0900_0952
      ep_Q2_054_block_27_0900_0952 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
