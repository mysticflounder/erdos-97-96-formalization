/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 7:0-66

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 7 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_07_0000_0066 : Poly :=
[
  term (2 : Rat) [(0, 1), (4, 1)],
  term (2 : Rat) [(1, 1), (5, 1)],
  term (-1 : Rat) [(4, 2)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0000 : Poly :=
[
  term ((956843753651107103975 : Rat) / 29993435462845846978) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0000 : Poly :=
[
  term ((956843753651107103975 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-956843753651107103975 : Rat) / 29993435462845846978) [(0, 1), (4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-956843753651107103975 : Rat) / 29993435462845846978) [(0, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((956843753651107103975 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0000_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0000
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0001 : Poly :=
[
  term ((-574106252190664262385 : Rat) / 29993435462845846978) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0001 : Poly :=
[
  term ((-574106252190664262385 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((574106252190664262385 : Rat) / 29993435462845846978) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((574106252190664262385 : Rat) / 29993435462845846978) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-574106252190664262385 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0001_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0001
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0002 : Poly :=
[
  term ((1063743508568338481375 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0002 : Poly :=
[
  term ((2127487017136676962750 : Rat) / 104977024119960464423) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1063743508568338481375 : Rat) / 104977024119960464423) [(0, 1), (4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1063743508568338481375 : Rat) / 104977024119960464423) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((2127487017136676962750 : Rat) / 104977024119960464423) [(0, 2), (4, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0002_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0002
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0003 : Poly :=
[
  term ((-638246105141003088825 : Rat) / 104977024119960464423) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0003 : Poly :=
[
  term ((-1276492210282006177650 : Rat) / 104977024119960464423) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((638246105141003088825 : Rat) / 104977024119960464423) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((638246105141003088825 : Rat) / 104977024119960464423) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1276492210282006177650 : Rat) / 104977024119960464423) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0003_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0003
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0004 : Poly :=
[
  term ((10271338499685780584035 : Rat) / 51069903625926712422) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0004 : Poly :=
[
  term ((10271338499685780584035 : Rat) / 25534951812963356211) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-10271338499685780584035 : Rat) / 51069903625926712422) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-10271338499685780584035 : Rat) / 51069903625926712422) [(0, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((10271338499685780584035 : Rat) / 25534951812963356211) [(0, 2), (4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0004_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0004
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0005 : Poly :=
[
  term ((-956843753651107103975 : Rat) / 14996717731422923489) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0005 : Poly :=
[
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((956843753651107103975 : Rat) / 14996717731422923489) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((956843753651107103975 : Rat) / 14996717731422923489) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0005_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0005
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0006 : Poly :=
[
  term ((-2054267699937156116807 : Rat) / 17023301208642237474) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0006 : Poly :=
[
  term ((-2054267699937156116807 : Rat) / 8511650604321118737) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((2054267699937156116807 : Rat) / 17023301208642237474) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((2054267699937156116807 : Rat) / 17023301208642237474) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2054267699937156116807 : Rat) / 8511650604321118737) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0006_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0006
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0007 : Poly :=
[
  term ((574106252190664262385 : Rat) / 14996717731422923489) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 7 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0007 : Poly :=
[
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-574106252190664262385 : Rat) / 14996717731422923489) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-574106252190664262385 : Rat) / 14996717731422923489) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0007_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0007
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0008 : Poly :=
[
  term ((-1075770635840017294105 : Rat) / 7295700517989530346) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 8 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0008 : Poly :=
[
  term ((-1075770635840017294105 : Rat) / 3647850258994765173) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((1075770635840017294105 : Rat) / 7295700517989530346) [(1, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((1075770635840017294105 : Rat) / 7295700517989530346) [(1, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((-1075770635840017294105 : Rat) / 3647850258994765173) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0008_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0008
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0009 : Poly :=
[
  term ((-956843753651107103975 : Rat) / 14996717731422923489) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 9 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0009 : Poly :=
[
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((956843753651107103975 : Rat) / 14996717731422923489) [(1, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((956843753651107103975 : Rat) / 14996717731422923489) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0009_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0009
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0010 : Poly :=
[
  term ((956843753651107103975 : Rat) / 59986870925691693956) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 10 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0010 : Poly :=
[
  term ((956843753651107103975 : Rat) / 29993435462845846978) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((-956843753651107103975 : Rat) / 59986870925691693956) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-956843753651107103975 : Rat) / 59986870925691693956) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((956843753651107103975 : Rat) / 29993435462845846978) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0010_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0010
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0011 : Poly :=
[
  term ((215154127168003458821 : Rat) / 2431900172663176782) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0011 : Poly :=
[
  term ((215154127168003458821 : Rat) / 1215950086331588391) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-215154127168003458821 : Rat) / 2431900172663176782) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-215154127168003458821 : Rat) / 2431900172663176782) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((215154127168003458821 : Rat) / 1215950086331588391) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0011_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0011
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0012 : Poly :=
[
  term ((574106252190664262385 : Rat) / 14996717731422923489) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0012 : Poly :=
[
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-574106252190664262385 : Rat) / 14996717731422923489) [(1, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((-574106252190664262385 : Rat) / 14996717731422923489) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0012_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0012
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0013 : Poly :=
[
  term ((-574106252190664262385 : Rat) / 59986870925691693956) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0013 : Poly :=
[
  term ((-574106252190664262385 : Rat) / 29993435462845846978) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((574106252190664262385 : Rat) / 59986870925691693956) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((574106252190664262385 : Rat) / 59986870925691693956) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-574106252190664262385 : Rat) / 29993435462845846978) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0013_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0013
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0014 : Poly :=
[
  term ((-44676515855668356260875 : Rat) / 1889586434159288359614) [(2, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0014 : Poly :=
[
  term ((-44676515855668356260875 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-44676515855668356260875 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 2), (11, 1), (16, 1)],
  term ((44676515855668356260875 : Rat) / 1889586434159288359614) [(2, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((44676515855668356260875 : Rat) / 1889586434159288359614) [(2, 1), (5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0014_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0014
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0015 : Poly :=
[
  term ((8935303171133671252175 : Rat) / 629862144719762786538) [(2, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0015 : Poly :=
[
  term ((8935303171133671252175 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((8935303171133671252175 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((-8935303171133671252175 : Rat) / 629862144719762786538) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-8935303171133671252175 : Rat) / 629862144719762786538) [(2, 1), (5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0015_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0015
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0016 : Poly :=
[
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0016 : Poly :=
[
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0016_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0016
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0017 : Poly :=
[
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 17 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0017 : Poly :=
[
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(2, 1), (5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0017_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0017
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0018 : Poly :=
[
  term ((44676515855668356260875 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 18 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0018 : Poly :=
[
  term ((44676515855668356260875 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 2), (11, 1), (16, 1)],
  term ((44676515855668356260875 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-44676515855668356260875 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((-44676515855668356260875 : Rat) / 1889586434159288359614) [(3, 1), (4, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0018_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0018
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0019 : Poly :=
[
  term ((-8935303171133671252175 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0019 : Poly :=
[
  term ((-8935303171133671252175 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-8935303171133671252175 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((8935303171133671252175 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((8935303171133671252175 : Rat) / 629862144719762786538) [(3, 1), (4, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0019_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0019
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0020 : Poly :=
[
  term ((17960711226906978226310 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 20 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0020 : Poly :=
[
  term ((35921422453813956452620 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((35921422453813956452620 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-17960711226906978226310 : Rat) / 944793217079644179807) [(3, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((-17960711226906978226310 : Rat) / 944793217079644179807) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0020_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0020
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0021 : Poly :=
[
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 21 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0021 : Poly :=
[
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(3, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0021_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0021
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0022 : Poly :=
[
  term ((-211854318263757396456575 : Rat) / 944793217079644179807) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 22 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0022 : Poly :=
[
  term ((-423708636527514792913150 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-423708636527514792913150 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((211854318263757396456575 : Rat) / 944793217079644179807) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((211854318263757396456575 : Rat) / 944793217079644179807) [(3, 1), (5, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0022_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0022
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0023 : Poly :=
[
  term ((-3592142245381395645262 : Rat) / 314931072359881393269) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 23 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0023 : Poly :=
[
  term ((-7184284490762791290524 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7184284490762791290524 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((3592142245381395645262 : Rat) / 314931072359881393269) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((3592142245381395645262 : Rat) / 314931072359881393269) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0023_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0023
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0024 : Poly :=
[
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0024 : Poly :=
[
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0024_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0024
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0025 : Poly :=
[
  term ((42370863652751479291315 : Rat) / 314931072359881393269) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0025 : Poly :=
[
  term ((84741727305502958582630 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((84741727305502958582630 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-42370863652751479291315 : Rat) / 314931072359881393269) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-42370863652751479291315 : Rat) / 314931072359881393269) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0025_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0025
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0026 : Poly :=
[
  term ((-52812862228568957464465 : Rat) / 944793217079644179807) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 26 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0026 : Poly :=
[
  term ((-105625724457137914928930 : Rat) / 944793217079644179807) [(0, 1), (4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-105625724457137914928930 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((52812862228568957464465 : Rat) / 944793217079644179807) [(4, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((52812862228568957464465 : Rat) / 944793217079644179807) [(4, 3), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0026_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0026
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0027 : Poly :=
[
  term ((10562572445713791492893 : Rat) / 314931072359881393269) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 27 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0027 : Poly :=
[
  term ((21125144891427582985786 : Rat) / 314931072359881393269) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((21125144891427582985786 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-10562572445713791492893 : Rat) / 314931072359881393269) [(4, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-10562572445713791492893 : Rat) / 314931072359881393269) [(4, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0027_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0027
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0028 : Poly :=
[
  term ((-12337548287859451559015 : Rat) / 944793217079644179807) [(4, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 28 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0028 : Poly :=
[
  term ((-24675096575718903118030 : Rat) / 944793217079644179807) [(0, 1), (4, 2), (9, 1), (11, 1), (16, 1)],
  term ((-24675096575718903118030 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((12337548287859451559015 : Rat) / 944793217079644179807) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((12337548287859451559015 : Rat) / 944793217079644179807) [(4, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0028_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0028
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0029 : Poly :=
[
  term ((2467509657571890311803 : Rat) / 314931072359881393269) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0029 : Poly :=
[
  term ((4935019315143780623606 : Rat) / 314931072359881393269) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((4935019315143780623606 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2467509657571890311803 : Rat) / 314931072359881393269) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2467509657571890311803 : Rat) / 314931072359881393269) [(4, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0029_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0029
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0030 : Poly :=
[
  term ((104001161736239764821155 : Rat) / 944793217079644179807) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 30 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0030 : Poly :=
[
  term ((208002323472479529642310 : Rat) / 944793217079644179807) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((208002323472479529642310 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-104001161736239764821155 : Rat) / 944793217079644179807) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((-104001161736239764821155 : Rat) / 944793217079644179807) [(4, 3), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0030_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0030
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0031 : Poly :=
[
  term ((-17482574042184438265175 : Rat) / 269940919165612622802) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 31 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0031 : Poly :=
[
  term ((-17482574042184438265175 : Rat) / 134970459582806311401) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-17482574042184438265175 : Rat) / 134970459582806311401) [(1, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((17482574042184438265175 : Rat) / 269940919165612622802) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((17482574042184438265175 : Rat) / 269940919165612622802) [(4, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0031_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0031
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0032 : Poly :=
[
  term ((-20800232347247952964231 : Rat) / 314931072359881393269) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0032 : Poly :=
[
  term ((-41600464694495905928462 : Rat) / 314931072359881393269) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-41600464694495905928462 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((20800232347247952964231 : Rat) / 314931072359881393269) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((20800232347247952964231 : Rat) / 314931072359881393269) [(4, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0032_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0032
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0033 : Poly :=
[
  term ((3496514808436887653035 : Rat) / 89980306388537540934) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 33 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0033 : Poly :=
[
  term ((3496514808436887653035 : Rat) / 44990153194268770467) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((3496514808436887653035 : Rat) / 44990153194268770467) [(1, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((-3496514808436887653035 : Rat) / 89980306388537540934) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((-3496514808436887653035 : Rat) / 89980306388537540934) [(4, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0033_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0033
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0034 : Poly :=
[
  term ((-174090063221078611730 : Rat) / 19281494226115187343) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 34 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0034 : Poly :=
[
  term ((-348180126442157223460 : Rat) / 19281494226115187343) [(0, 1), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-348180126442157223460 : Rat) / 19281494226115187343) [(1, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((174090063221078611730 : Rat) / 19281494226115187343) [(4, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((174090063221078611730 : Rat) / 19281494226115187343) [(5, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0034_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0034
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0035 : Poly :=
[
  term ((17482574042184438265175 : Rat) / 269940919165612622802) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 35 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0035 : Poly :=
[
  term ((17482574042184438265175 : Rat) / 134970459582806311401) [(0, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((17482574042184438265175 : Rat) / 134970459582806311401) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-17482574042184438265175 : Rat) / 269940919165612622802) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-17482574042184438265175 : Rat) / 269940919165612622802) [(5, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0035_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0035
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0036 : Poly :=
[
  term ((-10106779373992834607635 : Rat) / 629862144719762786538) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 36 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0036 : Poly :=
[
  term ((-10106779373992834607635 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-10106779373992834607635 : Rat) / 314931072359881393269) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((10106779373992834607635 : Rat) / 629862144719762786538) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((10106779373992834607635 : Rat) / 629862144719762786538) [(5, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0036_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0036
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0037 : Poly :=
[
  term ((34818012644215722346 : Rat) / 6427164742038395781) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0037 : Poly :=
[
  term ((69636025288431444692 : Rat) / 6427164742038395781) [(0, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((69636025288431444692 : Rat) / 6427164742038395781) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-34818012644215722346 : Rat) / 6427164742038395781) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-34818012644215722346 : Rat) / 6427164742038395781) [(5, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0037_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0037
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0038 : Poly :=
[
  term ((-3496514808436887653035 : Rat) / 89980306388537540934) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0038 : Poly :=
[
  term ((-3496514808436887653035 : Rat) / 44990153194268770467) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3496514808436887653035 : Rat) / 44990153194268770467) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((3496514808436887653035 : Rat) / 89980306388537540934) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((3496514808436887653035 : Rat) / 89980306388537540934) [(5, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0038_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0038
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0039 : Poly :=
[
  term ((2021355874798566921527 : Rat) / 209954048239920928846) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0039 : Poly :=
[
  term ((2021355874798566921527 : Rat) / 104977024119960464423) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((2021355874798566921527 : Rat) / 104977024119960464423) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-2021355874798566921527 : Rat) / 209954048239920928846) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-2021355874798566921527 : Rat) / 209954048239920928846) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0039_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0039
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0040 : Poly :=
[
  term ((1588063824503355306895 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 40 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0040 : Poly :=
[
  term ((1588063824503355306895 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((1588063824503355306895 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1588063824503355306895 : Rat) / 1889586434159288359614) [(4, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1588063824503355306895 : Rat) / 1889586434159288359614) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0040_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0040
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0041 : Poly :=
[
  term ((1888859325133085356315 : Rat) / 17023301208642237474) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 41 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0041 : Poly :=
[
  term ((1888859325133085356315 : Rat) / 8511650604321118737) [(0, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1888859325133085356315 : Rat) / 8511650604321118737) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1888859325133085356315 : Rat) / 17023301208642237474) [(4, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1888859325133085356315 : Rat) / 17023301208642237474) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0041_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0041
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0042 : Poly :=
[
  term ((34739079592070301272645 : Rat) / 1889586434159288359614) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 42 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0042 : Poly :=
[
  term ((34739079592070301272645 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((34739079592070301272645 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-34739079592070301272645 : Rat) / 1889586434159288359614) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((-34739079592070301272645 : Rat) / 1889586434159288359614) [(5, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0042_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0042
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0043 : Poly :=
[
  term ((-317612764900671061379 : Rat) / 629862144719762786538) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0043 : Poly :=
[
  term ((-317612764900671061379 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-317612764900671061379 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((317612764900671061379 : Rat) / 629862144719762786538) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((317612764900671061379 : Rat) / 629862144719762786538) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0043_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0043
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0044 : Poly :=
[
  term ((-377771865026617071263 : Rat) / 5674433736214079158) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0044 : Poly :=
[
  term ((-377771865026617071263 : Rat) / 2837216868107039579) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-377771865026617071263 : Rat) / 2837216868107039579) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((377771865026617071263 : Rat) / 5674433736214079158) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((377771865026617071263 : Rat) / 5674433736214079158) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0044_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0044
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0045 : Poly :=
[
  term ((-6947815918414060254529 : Rat) / 629862144719762786538) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 45 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0045 : Poly :=
[
  term ((-6947815918414060254529 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6947815918414060254529 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((6947815918414060254529 : Rat) / 629862144719762786538) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((6947815918414060254529 : Rat) / 629862144719762786538) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0045_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0045
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0046 : Poly :=
[
  term ((51335773232158771733555 : Rat) / 1889586434159288359614) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0046 : Poly :=
[
  term ((51335773232158771733555 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((51335773232158771733555 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51335773232158771733555 : Rat) / 1889586434159288359614) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51335773232158771733555 : Rat) / 1889586434159288359614) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0046_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0046
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0047 : Poly :=
[
  term ((-10267154646431754346711 : Rat) / 629862144719762786538) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 47 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0047 : Poly :=
[
  term ((-10267154646431754346711 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10267154646431754346711 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((10267154646431754346711 : Rat) / 629862144719762786538) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((10267154646431754346711 : Rat) / 629862144719762786538) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0047_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0047
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0048 : Poly :=
[
  term ((125453645603660230611485 : Rat) / 944793217079644179807) [(9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 48 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0048 : Poly :=
[
  term ((250907291207320461222970 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((250907291207320461222970 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-125453645603660230611485 : Rat) / 944793217079644179807) [(4, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-125453645603660230611485 : Rat) / 944793217079644179807) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0048_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0048
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0049 : Poly :=
[
  term ((-51335773232158771733555 : Rat) / 1889586434159288359614) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 49 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0049 : Poly :=
[
  term ((-51335773232158771733555 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-51335773232158771733555 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((51335773232158771733555 : Rat) / 1889586434159288359614) [(4, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((51335773232158771733555 : Rat) / 1889586434159288359614) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0049_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0049
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0050 : Poly :=
[
  term ((-25090729120732046122297 : Rat) / 314931072359881393269) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0050 : Poly :=
[
  term ((-50181458241464092244594 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-50181458241464092244594 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((25090729120732046122297 : Rat) / 314931072359881393269) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((25090729120732046122297 : Rat) / 314931072359881393269) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0050_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0050
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0051 : Poly :=
[
  term ((10267154646431754346711 : Rat) / 629862144719762786538) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0051 : Poly :=
[
  term ((10267154646431754346711 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((10267154646431754346711 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10267154646431754346711 : Rat) / 629862144719762786538) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10267154646431754346711 : Rat) / 629862144719762786538) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0051_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0051
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0052 : Poly :=
[
  term ((-16862748140795775873145 : Rat) / 314931072359881393269) [(10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0052 : Poly :=
[
  term ((-33725496281591551746290 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-33725496281591551746290 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((16862748140795775873145 : Rat) / 314931072359881393269) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((16862748140795775873145 : Rat) / 314931072359881393269) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0052_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0052
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0053 : Poly :=
[
  term ((3372549628159155174629 : Rat) / 104977024119960464423) [(10, 1), (15, 2), (16, 1)]
]

/-- Partial product 53 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0053 : Poly :=
[
  term ((6745099256318310349258 : Rat) / 104977024119960464423) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((6745099256318310349258 : Rat) / 104977024119960464423) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-3372549628159155174629 : Rat) / 104977024119960464423) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((-3372549628159155174629 : Rat) / 104977024119960464423) [(5, 2), (10, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0053_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0053
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0054 : Poly :=
[
  term ((-95020236072090048823070 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 54 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0054 : Poly :=
[
  term ((-190040472144180097646140 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-190040472144180097646140 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((95020236072090048823070 : Rat) / 944793217079644179807) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((95020236072090048823070 : Rat) / 944793217079644179807) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0054_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0054
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0055 : Poly :=
[
  term ((-11471331866426020930865 : Rat) / 269940919165612622802) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 55 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0055 : Poly :=
[
  term ((-11471331866426020930865 : Rat) / 134970459582806311401) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11471331866426020930865 : Rat) / 134970459582806311401) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((11471331866426020930865 : Rat) / 269940919165612622802) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((11471331866426020930865 : Rat) / 269940919165612622802) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0055_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0055
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0056 : Poly :=
[
  term ((-118804873390415303996125 : Rat) / 1889586434159288359614) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 56 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0056 : Poly :=
[
  term ((-118804873390415303996125 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-118804873390415303996125 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((118804873390415303996125 : Rat) / 1889586434159288359614) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((118804873390415303996125 : Rat) / 1889586434159288359614) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0056_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0056
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0057 : Poly :=
[
  term ((-1588063824503355306895 : Rat) / 3779172868318576719228) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 57 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0057 : Poly :=
[
  term ((-1588063824503355306895 : Rat) / 1889586434159288359614) [(0, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1588063824503355306895 : Rat) / 1889586434159288359614) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((1588063824503355306895 : Rat) / 3779172868318576719228) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((1588063824503355306895 : Rat) / 3779172868318576719228) [(5, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0057_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0057
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0058 : Poly :=
[
  term ((-16755388513195366983404 : Rat) / 314931072359881393269) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0058 : Poly :=
[
  term ((-33510777026390733966808 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33510777026390733966808 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16755388513195366983404 : Rat) / 314931072359881393269) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((16755388513195366983404 : Rat) / 314931072359881393269) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0058_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0058
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0059 : Poly :=
[
  term ((-292727407597851644423531 : Rat) / 3779172868318576719228) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0059 : Poly :=
[
  term ((-292727407597851644423531 : Rat) / 1889586434159288359614) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-292727407597851644423531 : Rat) / 1889586434159288359614) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((292727407597851644423531 : Rat) / 3779172868318576719228) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((292727407597851644423531 : Rat) / 3779172868318576719228) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0059_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0059
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0060 : Poly :=
[
  term ((83776942565976834917020 : Rat) / 944793217079644179807) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 60 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0060 : Poly :=
[
  term ((167553885131953669834040 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((167553885131953669834040 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(5, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0060_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0060
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0061 : Poly :=
[
  term ((31143808855216398230595 : Rat) / 209954048239920928846) [(11, 2), (16, 1)]
]

/-- Partial product 61 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0061 : Poly :=
[
  term ((31143808855216398230595 : Rat) / 104977024119960464423) [(0, 1), (4, 1), (11, 2), (16, 1)],
  term ((31143808855216398230595 : Rat) / 104977024119960464423) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-31143808855216398230595 : Rat) / 209954048239920928846) [(4, 2), (11, 2), (16, 1)],
  term ((-31143808855216398230595 : Rat) / 209954048239920928846) [(5, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0061_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0061
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0062 : Poly :=
[
  term ((19004047214418009764614 : Rat) / 314931072359881393269) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0062 : Poly :=
[
  term ((38008094428836019529228 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((38008094428836019529228 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19004047214418009764614 : Rat) / 314931072359881393269) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-19004047214418009764614 : Rat) / 314931072359881393269) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0062_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0062
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0063 : Poly :=
[
  term ((2294266373285204186173 : Rat) / 89980306388537540934) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 63 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0063 : Poly :=
[
  term ((2294266373285204186173 : Rat) / 44990153194268770467) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((2294266373285204186173 : Rat) / 44990153194268770467) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2294266373285204186173 : Rat) / 89980306388537540934) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-2294266373285204186173 : Rat) / 89980306388537540934) [(5, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0063_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0063
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0064 : Poly :=
[
  term ((23760974678083060799225 : Rat) / 629862144719762786538) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0064 : Poly :=
[
  term ((23760974678083060799225 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((23760974678083060799225 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23760974678083060799225 : Rat) / 629862144719762786538) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23760974678083060799225 : Rat) / 629862144719762786538) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0064_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0064
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0065 : Poly :=
[
  term ((317612764900671061379 : Rat) / 1259724289439525573076) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 65 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0065 : Poly :=
[
  term ((317612764900671061379 : Rat) / 629862144719762786538) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((317612764900671061379 : Rat) / 629862144719762786538) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-317612764900671061379 : Rat) / 1259724289439525573076) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((-317612764900671061379 : Rat) / 1259724289439525573076) [(5, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0065_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0065
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 7. -/
def rs_R007_ueqv_R007NY_coefficient_07_0066 : Poly :=
[
  term ((-8725145607697091293379 : Rat) / 1259724289439525573076) [(15, 2), (16, 1)]
]

/-- Partial product 66 for generator 7. -/
def rs_R007_ueqv_R007NY_partial_07_0066 : Poly :=
[
  term ((-8725145607697091293379 : Rat) / 629862144719762786538) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-8725145607697091293379 : Rat) / 629862144719762786538) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((8725145607697091293379 : Rat) / 1259724289439525573076) [(4, 2), (15, 2), (16, 1)],
  term ((8725145607697091293379 : Rat) / 1259724289439525573076) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 7. -/
theorem rs_R007_ueqv_R007NY_partial_07_0066_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_07_0066
        rs_R007_ueqv_R007NY_generator_07_0000_0066 =
      rs_R007_ueqv_R007NY_partial_07_0066 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_07_0000_0066 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_07_0000,
  rs_R007_ueqv_R007NY_partial_07_0001,
  rs_R007_ueqv_R007NY_partial_07_0002,
  rs_R007_ueqv_R007NY_partial_07_0003,
  rs_R007_ueqv_R007NY_partial_07_0004,
  rs_R007_ueqv_R007NY_partial_07_0005,
  rs_R007_ueqv_R007NY_partial_07_0006,
  rs_R007_ueqv_R007NY_partial_07_0007,
  rs_R007_ueqv_R007NY_partial_07_0008,
  rs_R007_ueqv_R007NY_partial_07_0009,
  rs_R007_ueqv_R007NY_partial_07_0010,
  rs_R007_ueqv_R007NY_partial_07_0011,
  rs_R007_ueqv_R007NY_partial_07_0012,
  rs_R007_ueqv_R007NY_partial_07_0013,
  rs_R007_ueqv_R007NY_partial_07_0014,
  rs_R007_ueqv_R007NY_partial_07_0015,
  rs_R007_ueqv_R007NY_partial_07_0016,
  rs_R007_ueqv_R007NY_partial_07_0017,
  rs_R007_ueqv_R007NY_partial_07_0018,
  rs_R007_ueqv_R007NY_partial_07_0019,
  rs_R007_ueqv_R007NY_partial_07_0020,
  rs_R007_ueqv_R007NY_partial_07_0021,
  rs_R007_ueqv_R007NY_partial_07_0022,
  rs_R007_ueqv_R007NY_partial_07_0023,
  rs_R007_ueqv_R007NY_partial_07_0024,
  rs_R007_ueqv_R007NY_partial_07_0025,
  rs_R007_ueqv_R007NY_partial_07_0026,
  rs_R007_ueqv_R007NY_partial_07_0027,
  rs_R007_ueqv_R007NY_partial_07_0028,
  rs_R007_ueqv_R007NY_partial_07_0029,
  rs_R007_ueqv_R007NY_partial_07_0030,
  rs_R007_ueqv_R007NY_partial_07_0031,
  rs_R007_ueqv_R007NY_partial_07_0032,
  rs_R007_ueqv_R007NY_partial_07_0033,
  rs_R007_ueqv_R007NY_partial_07_0034,
  rs_R007_ueqv_R007NY_partial_07_0035,
  rs_R007_ueqv_R007NY_partial_07_0036,
  rs_R007_ueqv_R007NY_partial_07_0037,
  rs_R007_ueqv_R007NY_partial_07_0038,
  rs_R007_ueqv_R007NY_partial_07_0039,
  rs_R007_ueqv_R007NY_partial_07_0040,
  rs_R007_ueqv_R007NY_partial_07_0041,
  rs_R007_ueqv_R007NY_partial_07_0042,
  rs_R007_ueqv_R007NY_partial_07_0043,
  rs_R007_ueqv_R007NY_partial_07_0044,
  rs_R007_ueqv_R007NY_partial_07_0045,
  rs_R007_ueqv_R007NY_partial_07_0046,
  rs_R007_ueqv_R007NY_partial_07_0047,
  rs_R007_ueqv_R007NY_partial_07_0048,
  rs_R007_ueqv_R007NY_partial_07_0049,
  rs_R007_ueqv_R007NY_partial_07_0050,
  rs_R007_ueqv_R007NY_partial_07_0051,
  rs_R007_ueqv_R007NY_partial_07_0052,
  rs_R007_ueqv_R007NY_partial_07_0053,
  rs_R007_ueqv_R007NY_partial_07_0054,
  rs_R007_ueqv_R007NY_partial_07_0055,
  rs_R007_ueqv_R007NY_partial_07_0056,
  rs_R007_ueqv_R007NY_partial_07_0057,
  rs_R007_ueqv_R007NY_partial_07_0058,
  rs_R007_ueqv_R007NY_partial_07_0059,
  rs_R007_ueqv_R007NY_partial_07_0060,
  rs_R007_ueqv_R007NY_partial_07_0061,
  rs_R007_ueqv_R007NY_partial_07_0062,
  rs_R007_ueqv_R007NY_partial_07_0063,
  rs_R007_ueqv_R007NY_partial_07_0064,
  rs_R007_ueqv_R007NY_partial_07_0065,
  rs_R007_ueqv_R007NY_partial_07_0066
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_07_0000_0066 : Poly :=
[
  term ((-1075770635840017294105 : Rat) / 3647850258994765173) [(0, 1), (1, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((956843753651107103975 : Rat) / 29993435462845846978) [(0, 1), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((215154127168003458821 : Rat) / 1215950086331588391) [(0, 1), (1, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((-574106252190664262385 : Rat) / 29993435462845846978) [(0, 1), (1, 1), (4, 1), (15, 1), (16, 1)],
  term ((956843753651107103975 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-574106252190664262385 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((2127487017136676962750 : Rat) / 104977024119960464423) [(0, 1), (1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1276492210282006177650 : Rat) / 104977024119960464423) [(0, 1), (1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((10271338499685780584035 : Rat) / 25534951812963356211) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2054267699937156116807 : Rat) / 8511650604321118737) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(0, 1), (1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-44676515855668356260875 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((8935303171133671252175 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((35921422453813956452620 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (11, 1), (12, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (11, 1), (14, 1), (16, 1)],
  term ((-423708636527514792913150 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-7184284490762791290524 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (12, 1), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (14, 1), (15, 1), (16, 1)],
  term ((84741727305502958582630 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 1), (15, 1), (16, 1)],
  term ((44676515855668356260875 : Rat) / 944793217079644179807) [(0, 1), (3, 1), (4, 2), (11, 1), (16, 1)],
  term ((-8935303171133671252175 : Rat) / 314931072359881393269) [(0, 1), (3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-348180126442157223460 : Rat) / 19281494226115187343) [(0, 1), (4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((17482574042184438265175 : Rat) / 134970459582806311401) [(0, 1), (4, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10106779373992834607635 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((69636025288431444692 : Rat) / 6427164742038395781) [(0, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3496514808436887653035 : Rat) / 44990153194268770467) [(0, 1), (4, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((2021355874798566921527 : Rat) / 104977024119960464423) [(0, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((1588063824503355306895 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((1888859325133085356315 : Rat) / 8511650604321118737) [(0, 1), (4, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((34739079592070301272645 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-317612764900671061379 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-377771865026617071263 : Rat) / 2837216868107039579) [(0, 1), (4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6947815918414060254529 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((51335773232158771733555 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10267154646431754346711 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (8, 1), (15, 2), (16, 1)],
  term ((250907291207320461222970 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-51335773232158771733555 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-50181458241464092244594 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((10267154646431754346711 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33725496281591551746290 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6745099256318310349258 : Rat) / 104977024119960464423) [(0, 1), (4, 1), (10, 1), (15, 2), (16, 1)],
  term ((-190040472144180097646140 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11471331866426020930865 : Rat) / 134970459582806311401) [(0, 1), (4, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-118804873390415303996125 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1588063824503355306895 : Rat) / 1889586434159288359614) [(0, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-33510777026390733966808 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-292727407597851644423531 : Rat) / 1889586434159288359614) [(0, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((167553885131953669834040 : Rat) / 944793217079644179807) [(0, 1), (4, 1), (11, 2), (14, 1), (16, 1)],
  term ((31143808855216398230595 : Rat) / 104977024119960464423) [(0, 1), (4, 1), (11, 2), (16, 1)],
  term ((38008094428836019529228 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2294266373285204186173 : Rat) / 44990153194268770467) [(0, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((23760974678083060799225 : Rat) / 314931072359881393269) [(0, 1), (4, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((317612764900671061379 : Rat) / 629862144719762786538) [(0, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8725145607697091293379 : Rat) / 629862144719762786538) [(0, 1), (4, 1), (15, 2), (16, 1)],
  term ((-7338719064710691281305 : Rat) / 51069903625926712422) [(0, 1), (4, 2), (7, 1), (11, 1), (16, 1)],
  term ((1467743812942138256261 : Rat) / 17023301208642237474) [(0, 1), (4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-34248788152833949450405 : Rat) / 944793217079644179807) [(0, 1), (4, 2), (9, 1), (11, 1), (16, 1)],
  term ((6849757630566789890081 : Rat) / 314931072359881393269) [(0, 1), (4, 2), (9, 1), (15, 1), (16, 1)],
  term ((35965122456585177675325 : Rat) / 1889586434159288359614) [(0, 1), (4, 2), (11, 1), (13, 1), (16, 1)],
  term ((-8870980259324474329400 : Rat) / 134970459582806311401) [(0, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-7193024491317035535065 : Rat) / 629862144719762786538) [(0, 1), (4, 2), (13, 1), (15, 1), (16, 1)],
  term ((1774196051864894865880 : Rat) / 44990153194268770467) [(0, 1), (4, 2), (15, 2), (16, 1)],
  term ((-956843753651107103975 : Rat) / 29993435462845846978) [(0, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((574106252190664262385 : Rat) / 29993435462845846978) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1063743508568338481375 : Rat) / 104977024119960464423) [(0, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((638246105141003088825 : Rat) / 104977024119960464423) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-10271338499685780584035 : Rat) / 51069903625926712422) [(0, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((956843753651107103975 : Rat) / 14996717731422923489) [(0, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((2054267699937156116807 : Rat) / 17023301208642237474) [(0, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-574106252190664262385 : Rat) / 14996717731422923489) [(0, 1), (5, 2), (15, 2), (16, 1)],
  term ((956843753651107103975 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-574106252190664262385 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (7, 1), (15, 1), (16, 1)],
  term ((2127487017136676962750 : Rat) / 104977024119960464423) [(0, 2), (4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1276492210282006177650 : Rat) / 104977024119960464423) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((10271338499685780584035 : Rat) / 25534951812963356211) [(0, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2054267699937156116807 : Rat) / 8511650604321118737) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 1), (15, 2), (16, 1)],
  term ((-44676515855668356260875 : Rat) / 944793217079644179807) [(1, 1), (2, 1), (5, 2), (11, 1), (16, 1)],
  term ((8935303171133671252175 : Rat) / 314931072359881393269) [(1, 1), (2, 1), (5, 2), (15, 1), (16, 1)],
  term ((44676515855668356260875 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (4, 1), (5, 1), (11, 1), (16, 1)],
  term ((-8935303171133671252175 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((35921422453813956452620 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-423708636527514792913150 : Rat) / 944793217079644179807) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-7184284490762791290524 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((84741727305502958582630 : Rat) / 314931072359881393269) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-105625724457137914928930 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((21125144891427582985786 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-24675096575718903118030 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((4935019315143780623606 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((208002323472479529642310 : Rat) / 944793217079644179807) [(1, 1), (4, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-17482574042184438265175 : Rat) / 134970459582806311401) [(1, 1), (4, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-41600464694495905928462 : Rat) / 314931072359881393269) [(1, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((3496514808436887653035 : Rat) / 44990153194268770467) [(1, 1), (4, 1), (5, 1), (15, 2), (16, 1)],
  term ((1075770635840017294105 : Rat) / 7295700517989530346) [(1, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((956843753651107103975 : Rat) / 14996717731422923489) [(1, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((-956843753651107103975 : Rat) / 59986870925691693956) [(1, 1), (4, 2), (11, 1), (16, 1)],
  term ((-215154127168003458821 : Rat) / 2431900172663176782) [(1, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-574106252190664262385 : Rat) / 14996717731422923489) [(1, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((574106252190664262385 : Rat) / 59986870925691693956) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((1588063824503355306895 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((1888859325133085356315 : Rat) / 8511650604321118737) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((34739079592070301272645 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-317612764900671061379 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-377771865026617071263 : Rat) / 2837216868107039579) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6947815918414060254529 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((51335773232158771733555 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10267154646431754346711 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((250907291207320461222970 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-51335773232158771733555 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-50181458241464092244594 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((10267154646431754346711 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-33725496281591551746290 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((6745099256318310349258 : Rat) / 104977024119960464423) [(1, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-190040472144180097646140 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-11471331866426020930865 : Rat) / 134970459582806311401) [(1, 1), (5, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-118804873390415303996125 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1588063824503355306895 : Rat) / 1889586434159288359614) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-33510777026390733966808 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-292727407597851644423531 : Rat) / 1889586434159288359614) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((167553885131953669834040 : Rat) / 944793217079644179807) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((31143808855216398230595 : Rat) / 104977024119960464423) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((38008094428836019529228 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2294266373285204186173 : Rat) / 44990153194268770467) [(1, 1), (5, 1), (12, 1), (15, 2), (16, 1)],
  term ((23760974678083060799225 : Rat) / 314931072359881393269) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((317612764900671061379 : Rat) / 629862144719762786538) [(1, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8725145607697091293379 : Rat) / 629862144719762786538) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((34928991755890438753445 : Rat) / 269940919165612622802) [(1, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((3727738260720628885850 : Rat) / 19281494226115187343) [(1, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((-60520836322644587614015 : Rat) / 1259724289439525573076) [(1, 1), (5, 2), (11, 1), (16, 1)],
  term ((-6985798351178087750689 : Rat) / 89980306388537540934) [(1, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-745547652144125777170 : Rat) / 6427164742038395781) [(1, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((12104167264528917522803 : Rat) / 419908096479841857692) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-1075770635840017294105 : Rat) / 3647850258994765173) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1913687507302214207950 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((956843753651107103975 : Rat) / 29993435462845846978) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((215154127168003458821 : Rat) / 1215950086331588391) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1148212504381328524770 : Rat) / 14996717731422923489) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-574106252190664262385 : Rat) / 29993435462845846978) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((44676515855668356260875 : Rat) / 1889586434159288359614) [(2, 1), (4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-8935303171133671252175 : Rat) / 629862144719762786538) [(2, 1), (4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(2, 1), (4, 2), (11, 1), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(2, 1), (4, 2), (15, 2), (16, 1)],
  term ((-269173485414423388961125 : Rat) / 1889586434159288359614) [(2, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((53834697082884677792225 : Rat) / 629862144719762786538) [(2, 1), (5, 2), (15, 2), (16, 1)],
  term ((44676515855668356260875 : Rat) / 1889586434159288359614) [(2, 1), (5, 3), (11, 1), (16, 1)],
  term ((-8935303171133671252175 : Rat) / 629862144719762786538) [(2, 1), (5, 3), (15, 1), (16, 1)],
  term ((-44676515855668356260875 : Rat) / 1889586434159288359614) [(3, 1), (4, 1), (5, 2), (11, 1), (16, 1)],
  term ((8935303171133671252175 : Rat) / 629862144719762786538) [(3, 1), (4, 1), (5, 2), (15, 1), (16, 1)],
  term ((-17960711226906978226310 : Rat) / 944793217079644179807) [(3, 1), (4, 2), (11, 1), (12, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(3, 1), (4, 2), (11, 1), (14, 1), (16, 1)],
  term ((211854318263757396456575 : Rat) / 944793217079644179807) [(3, 1), (4, 2), (11, 1), (16, 1)],
  term ((3592142245381395645262 : Rat) / 314931072359881393269) [(3, 1), (4, 2), (12, 1), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(3, 1), (4, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42370863652751479291315 : Rat) / 314931072359881393269) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-44676515855668356260875 : Rat) / 1889586434159288359614) [(3, 1), (4, 3), (11, 1), (16, 1)],
  term ((8935303171133671252175 : Rat) / 629862144719762786538) [(3, 1), (4, 3), (15, 1), (16, 1)],
  term ((-17960711226906978226310 : Rat) / 944793217079644179807) [(3, 1), (5, 2), (11, 1), (12, 1), (16, 1)],
  term ((269173485414423388961125 : Rat) / 1889586434159288359614) [(3, 1), (5, 2), (11, 1), (14, 1), (16, 1)],
  term ((211854318263757396456575 : Rat) / 944793217079644179807) [(3, 1), (5, 2), (11, 1), (16, 1)],
  term ((3592142245381395645262 : Rat) / 314931072359881393269) [(3, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((-53834697082884677792225 : Rat) / 629862144719762786538) [(3, 1), (5, 2), (14, 1), (15, 1), (16, 1)],
  term ((-42370863652751479291315 : Rat) / 314931072359881393269) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((52812862228568957464465 : Rat) / 944793217079644179807) [(4, 1), (5, 2), (7, 1), (11, 1), (16, 1)],
  term ((-10562572445713791492893 : Rat) / 314931072359881393269) [(4, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((12337548287859451559015 : Rat) / 944793217079644179807) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2467509657571890311803 : Rat) / 314931072359881393269) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-104001161736239764821155 : Rat) / 944793217079644179807) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)],
  term ((17482574042184438265175 : Rat) / 269940919165612622802) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)],
  term ((20800232347247952964231 : Rat) / 314931072359881393269) [(4, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3496514808436887653035 : Rat) / 89980306388537540934) [(4, 1), (5, 2), (15, 2), (16, 1)],
  term ((174090063221078611730 : Rat) / 19281494226115187343) [(4, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-17482574042184438265175 : Rat) / 269940919165612622802) [(4, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((10106779373992834607635 : Rat) / 629862144719762786538) [(4, 2), (5, 1), (11, 1), (16, 1)],
  term ((-34818012644215722346 : Rat) / 6427164742038395781) [(4, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((3496514808436887653035 : Rat) / 89980306388537540934) [(4, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2021355874798566921527 : Rat) / 209954048239920928846) [(4, 2), (5, 1), (15, 1), (16, 1)],
  term ((-1588063824503355306895 : Rat) / 1889586434159288359614) [(4, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1888859325133085356315 : Rat) / 17023301208642237474) [(4, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-34739079592070301272645 : Rat) / 1889586434159288359614) [(4, 2), (7, 1), (11, 1), (16, 1)],
  term ((317612764900671061379 : Rat) / 629862144719762786538) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((377771865026617071263 : Rat) / 5674433736214079158) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6947815918414060254529 : Rat) / 629862144719762786538) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-51335773232158771733555 : Rat) / 1889586434159288359614) [(4, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((10267154646431754346711 : Rat) / 629862144719762786538) [(4, 2), (8, 1), (15, 2), (16, 1)],
  term ((-125453645603660230611485 : Rat) / 944793217079644179807) [(4, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((51335773232158771733555 : Rat) / 1889586434159288359614) [(4, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((25090729120732046122297 : Rat) / 314931072359881393269) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10267154646431754346711 : Rat) / 629862144719762786538) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((16862748140795775873145 : Rat) / 314931072359881393269) [(4, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3372549628159155174629 : Rat) / 104977024119960464423) [(4, 2), (10, 1), (15, 2), (16, 1)],
  term ((95020236072090048823070 : Rat) / 944793217079644179807) [(4, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((11471331866426020930865 : Rat) / 269940919165612622802) [(4, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((118804873390415303996125 : Rat) / 1889586434159288359614) [(4, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1588063824503355306895 : Rat) / 3779172868318576719228) [(4, 2), (11, 1), (13, 1), (16, 1)],
  term ((16755388513195366983404 : Rat) / 314931072359881393269) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((292727407597851644423531 : Rat) / 3779172868318576719228) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(4, 2), (11, 2), (14, 1), (16, 1)],
  term ((-31143808855216398230595 : Rat) / 209954048239920928846) [(4, 2), (11, 2), (16, 1)],
  term ((-19004047214418009764614 : Rat) / 314931072359881393269) [(4, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2294266373285204186173 : Rat) / 89980306388537540934) [(4, 2), (12, 1), (15, 2), (16, 1)],
  term ((-23760974678083060799225 : Rat) / 629862144719762786538) [(4, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-317612764900671061379 : Rat) / 1259724289439525573076) [(4, 2), (13, 1), (15, 1), (16, 1)],
  term ((8725145607697091293379 : Rat) / 1259724289439525573076) [(4, 2), (15, 2), (16, 1)],
  term ((52812862228568957464465 : Rat) / 944793217079644179807) [(4, 3), (7, 1), (11, 1), (16, 1)],
  term ((-10562572445713791492893 : Rat) / 314931072359881393269) [(4, 3), (7, 1), (15, 1), (16, 1)],
  term ((12337548287859451559015 : Rat) / 944793217079644179807) [(4, 3), (9, 1), (11, 1), (16, 1)],
  term ((-2467509657571890311803 : Rat) / 314931072359881393269) [(4, 3), (9, 1), (15, 1), (16, 1)],
  term ((-104001161736239764821155 : Rat) / 944793217079644179807) [(4, 3), (11, 1), (13, 1), (16, 1)],
  term ((17482574042184438265175 : Rat) / 269940919165612622802) [(4, 3), (11, 1), (15, 1), (16, 1)],
  term ((20800232347247952964231 : Rat) / 314931072359881393269) [(4, 3), (13, 1), (15, 1), (16, 1)],
  term ((-3496514808436887653035 : Rat) / 89980306388537540934) [(4, 3), (15, 2), (16, 1)],
  term ((-1588063824503355306895 : Rat) / 1889586434159288359614) [(5, 2), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1888859325133085356315 : Rat) / 17023301208642237474) [(5, 2), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-34739079592070301272645 : Rat) / 1889586434159288359614) [(5, 2), (7, 1), (11, 1), (16, 1)],
  term ((317612764900671061379 : Rat) / 629862144719762786538) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((377771865026617071263 : Rat) / 5674433736214079158) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((6947815918414060254529 : Rat) / 629862144719762786538) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-51335773232158771733555 : Rat) / 1889586434159288359614) [(5, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((10267154646431754346711 : Rat) / 629862144719762786538) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-125453645603660230611485 : Rat) / 944793217079644179807) [(5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((51335773232158771733555 : Rat) / 1889586434159288359614) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((25090729120732046122297 : Rat) / 314931072359881393269) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-10267154646431754346711 : Rat) / 629862144719762786538) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((16862748140795775873145 : Rat) / 314931072359881393269) [(5, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3372549628159155174629 : Rat) / 104977024119960464423) [(5, 2), (10, 1), (15, 2), (16, 1)],
  term ((95020236072090048823070 : Rat) / 944793217079644179807) [(5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((11471331866426020930865 : Rat) / 269940919165612622802) [(5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((118804873390415303996125 : Rat) / 1889586434159288359614) [(5, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((1588063824503355306895 : Rat) / 3779172868318576719228) [(5, 2), (11, 1), (13, 1), (16, 1)],
  term ((16755388513195366983404 : Rat) / 314931072359881393269) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((292727407597851644423531 : Rat) / 3779172868318576719228) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-83776942565976834917020 : Rat) / 944793217079644179807) [(5, 2), (11, 2), (14, 1), (16, 1)],
  term ((-31143808855216398230595 : Rat) / 209954048239920928846) [(5, 2), (11, 2), (16, 1)],
  term ((-19004047214418009764614 : Rat) / 314931072359881393269) [(5, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2294266373285204186173 : Rat) / 89980306388537540934) [(5, 2), (12, 1), (15, 2), (16, 1)],
  term ((-23760974678083060799225 : Rat) / 629862144719762786538) [(5, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-317612764900671061379 : Rat) / 1259724289439525573076) [(5, 2), (13, 1), (15, 1), (16, 1)],
  term ((8725145607697091293379 : Rat) / 1259724289439525573076) [(5, 2), (15, 2), (16, 1)],
  term ((174090063221078611730 : Rat) / 19281494226115187343) [(5, 3), (11, 1), (12, 1), (16, 1)],
  term ((-17482574042184438265175 : Rat) / 269940919165612622802) [(5, 3), (11, 1), (14, 1), (16, 1)],
  term ((10106779373992834607635 : Rat) / 629862144719762786538) [(5, 3), (11, 1), (16, 1)],
  term ((-34818012644215722346 : Rat) / 6427164742038395781) [(5, 3), (12, 1), (15, 1), (16, 1)],
  term ((3496514808436887653035 : Rat) / 89980306388537540934) [(5, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2021355874798566921527 : Rat) / 209954048239920928846) [(5, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 7, terms 0 through 66. -/
theorem rs_R007_ueqv_R007NY_block_07_0000_0066_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_07_0000_0066
      rs_R007_ueqv_R007NY_block_07_0000_0066 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
