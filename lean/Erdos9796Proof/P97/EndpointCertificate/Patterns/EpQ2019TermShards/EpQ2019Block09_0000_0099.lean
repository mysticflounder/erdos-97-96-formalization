/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 9:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_09_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (2, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (3, 1)],
  term (1 : Rat) [(1, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0000 : Poly :=
[
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (16, 1)]
]

/-- Partial product 0 for generator 9. -/
def ep_Q2_019_partial_09_0000 : Poly :=
[
  term ((-2216433617933932254165931036176941376 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((-2216433617933932254165931036176941376 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 2), (16, 1)],
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 9. -/
theorem ep_Q2_019_partial_09_0000_valid :
    mulPoly ep_Q2_019_coefficient_09_0000
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0001 : Poly :=
[
  term ((-8119449544546602358389212753204395548 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 1 for generator 9. -/
def ep_Q2_019_partial_09_0001 : Poly :=
[
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (6, 1), (16, 1)],
  term ((-8119449544546602358389212753204395548 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (6, 1), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (6, 1), (16, 1)],
  term ((-8119449544546602358389212753204395548 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 9. -/
theorem ep_Q2_019_partial_09_0001_valid :
    mulPoly ep_Q2_019_coefficient_09_0001
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0002 : Poly :=
[
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 2 for generator 9. -/
def ep_Q2_019_partial_09_0002 : Poly :=
[
  term ((-15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 9. -/
theorem ep_Q2_019_partial_09_0002_valid :
    mulPoly ep_Q2_019_coefficient_09_0002
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0003 : Poly :=
[
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (16, 1)]
]

/-- Partial product 3 for generator 9. -/
def ep_Q2_019_partial_09_0003 : Poly :=
[
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (7, 2), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (7, 2), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 9. -/
theorem ep_Q2_019_partial_09_0003_valid :
    mulPoly ep_Q2_019_coefficient_09_0003
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0004 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 9. -/
def ep_Q2_019_partial_09_0004 : Poly :=
[
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(0, 3), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 9. -/
theorem ep_Q2_019_partial_09_0004_valid :
    mulPoly ep_Q2_019_coefficient_09_0004
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0005 : Poly :=
[
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 9. -/
def ep_Q2_019_partial_09_0005 : Poly :=
[
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(0, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 9. -/
theorem ep_Q2_019_partial_09_0005_valid :
    mulPoly ep_Q2_019_coefficient_09_0005
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0006 : Poly :=
[
  term ((106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 9. -/
def ep_Q2_019_partial_09_0006 : Poly :=
[
  term ((-213829147697446740888389801616717888 : Rat) / 169180850602121608642086281526396695) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-213829147697446740888389801616717888 : Rat) / 169180850602121608642086281526396695) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 9. -/
theorem ep_Q2_019_partial_09_0006_valid :
    mulPoly ep_Q2_019_coefficient_09_0006
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0007 : Poly :=
[
  term ((-11332156598025199028634492239744517936 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 7 for generator 9. -/
def ep_Q2_019_partial_09_0007 : Poly :=
[
  term ((22664313196050398057268984479489035872 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-11332156598025199028634492239744517936 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((22664313196050398057268984479489035872 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-11332156598025199028634492239744517936 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 9. -/
theorem ep_Q2_019_partial_09_0007_valid :
    mulPoly ep_Q2_019_coefficient_09_0007
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0008 : Poly :=
[
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 8 for generator 9. -/
def ep_Q2_019_partial_09_0008 : Poly :=
[
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (13, 2), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (13, 2), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 9. -/
theorem ep_Q2_019_partial_09_0008_valid :
    mulPoly ep_Q2_019_coefficient_09_0008
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0009 : Poly :=
[
  term ((7247406388172863230839133417644824576 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 9 for generator 9. -/
def ep_Q2_019_partial_09_0009 : Poly :=
[
  term ((-14494812776345726461678266835289649152 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (14, 1), (16, 1)],
  term ((7247406388172863230839133417644824576 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-14494812776345726461678266835289649152 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((7247406388172863230839133417644824576 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 9. -/
theorem ep_Q2_019_partial_09_0009_valid :
    mulPoly ep_Q2_019_coefficient_09_0009
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0010 : Poly :=
[
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 2), (16, 1)]
]

/-- Partial product 10 for generator 9. -/
def ep_Q2_019_partial_09_0010 : Poly :=
[
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (14, 2), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (14, 2), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (14, 2), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 9. -/
theorem ep_Q2_019_partial_09_0010_valid :
    mulPoly ep_Q2_019_coefficient_09_0010
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0011 : Poly :=
[
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 11 for generator 9. -/
def ep_Q2_019_partial_09_0011 : Poly :=
[
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 9. -/
theorem ep_Q2_019_partial_09_0011_valid :
    mulPoly ep_Q2_019_coefficient_09_0011
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0012 : Poly :=
[
  term ((13347042831088328815948029977830968796852 : Rat) / 394360562753545469744703122238030696045) [(0, 1), (16, 1)]
]

/-- Partial product 12 for generator 9. -/
def ep_Q2_019_partial_09_0012 : Poly :=
[
  term ((-26694085662176657631896059955661937593704 : Rat) / 394360562753545469744703122238030696045) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term ((13347042831088328815948029977830968796852 : Rat) / 394360562753545469744703122238030696045) [(0, 1), (1, 2), (16, 1)],
  term ((-26694085662176657631896059955661937593704 : Rat) / 394360562753545469744703122238030696045) [(0, 2), (2, 1), (16, 1)],
  term ((13347042831088328815948029977830968796852 : Rat) / 394360562753545469744703122238030696045) [(0, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 9. -/
theorem ep_Q2_019_partial_09_0012_valid :
    mulPoly ep_Q2_019_coefficient_09_0012
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0013 : Poly :=
[
  term ((2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (16, 1)]
]

/-- Partial product 13 for generator 9. -/
def ep_Q2_019_partial_09_0013 : Poly :=
[
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 2), (16, 1)],
  term ((-5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (2, 1), (16, 1)],
  term ((2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 9. -/
theorem ep_Q2_019_partial_09_0013_valid :
    mulPoly ep_Q2_019_coefficient_09_0013
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0014 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (11, 1), (16, 1)]
]

/-- Partial product 14 for generator 9. -/
def ep_Q2_019_partial_09_0014 : Poly :=
[
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (2, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 9. -/
theorem ep_Q2_019_partial_09_0014_valid :
    mulPoly ep_Q2_019_coefficient_09_0014
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0015 : Poly :=
[
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 9. -/
def ep_Q2_019_partial_09_0015 : Poly :=
[
  term ((-4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (2, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 9. -/
theorem ep_Q2_019_partial_09_0015_valid :
    mulPoly ep_Q2_019_coefficient_09_0015
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0016 : Poly :=
[
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 9. -/
def ep_Q2_019_partial_09_0016 : Poly :=
[
  term ((4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (2, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 9. -/
theorem ep_Q2_019_partial_09_0016_valid :
    mulPoly ep_Q2_019_coefficient_09_0016
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0017 : Poly :=
[
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 9. -/
def ep_Q2_019_partial_09_0017 : Poly :=
[
  term ((-11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (3, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 9. -/
theorem ep_Q2_019_partial_09_0017_valid :
    mulPoly ep_Q2_019_coefficient_09_0017
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0018 : Poly :=
[
  term ((3448151169774347508853739058372333504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (12, 1), (16, 1)]
]

/-- Partial product 18 for generator 9. -/
def ep_Q2_019_partial_09_0018 : Poly :=
[
  term ((-6896302339548695017707478116744667008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((3448151169774347508853739058372333504 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-6896302339548695017707478116744667008 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 2), (12, 1), (16, 1)],
  term ((3448151169774347508853739058372333504 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (3, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 9. -/
theorem ep_Q2_019_partial_09_0018_valid :
    mulPoly ep_Q2_019_coefficient_09_0018
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0019 : Poly :=
[
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (14, 1), (16, 1)]
]

/-- Partial product 19 for generator 9. -/
def ep_Q2_019_partial_09_0019 : Poly :=
[
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (3, 1), (14, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 2), (14, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (3, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 9. -/
theorem ep_Q2_019_partial_09_0019_valid :
    mulPoly ep_Q2_019_coefficient_09_0019
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0020 : Poly :=
[
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 20 for generator 9. -/
def ep_Q2_019_partial_09_0020 : Poly :=
[
  term ((-4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (3, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 9. -/
theorem ep_Q2_019_partial_09_0020_valid :
    mulPoly ep_Q2_019_coefficient_09_0020
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0021 : Poly :=
[
  term ((1389209463755304837455298347804738832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 21 for generator 9. -/
def ep_Q2_019_partial_09_0021 : Poly :=
[
  term ((-2778418927510609674910596695609477664 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((1389209463755304837455298347804738832 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-2778418927510609674910596695609477664 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 2), (16, 1)],
  term ((1389209463755304837455298347804738832 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (3, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 9. -/
theorem ep_Q2_019_partial_09_0021_valid :
    mulPoly ep_Q2_019_coefficient_09_0021
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0022 : Poly :=
[
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 22 for generator 9. -/
def ep_Q2_019_partial_09_0022 : Poly :=
[
  term ((4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (4, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 9. -/
theorem ep_Q2_019_partial_09_0022_valid :
    mulPoly ep_Q2_019_coefficient_09_0022
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0023 : Poly :=
[
  term ((6984480522041855377390344836652333868 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 23 for generator 9. -/
def ep_Q2_019_partial_09_0023 : Poly :=
[
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((6984480522041855377390344836652333868 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((6984480522041855377390344836652333868 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 9. -/
theorem ep_Q2_019_partial_09_0023_valid :
    mulPoly ep_Q2_019_coefficient_09_0023
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0024 : Poly :=
[
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 24 for generator 9. -/
def ep_Q2_019_partial_09_0024 : Poly :=
[
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1), (16, 1)],
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 9. -/
theorem ep_Q2_019_partial_09_0024_valid :
    mulPoly ep_Q2_019_coefficient_09_0024
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0025 : Poly :=
[
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 25 for generator 9. -/
def ep_Q2_019_partial_09_0025 : Poly :=
[
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 9. -/
theorem ep_Q2_019_partial_09_0025_valid :
    mulPoly ep_Q2_019_coefficient_09_0025
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0026 : Poly :=
[
  term ((-4195886173710171812046148913195591684 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 26 for generator 9. -/
def ep_Q2_019_partial_09_0026 : Poly :=
[
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-4195886173710171812046148913195591684 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((-4195886173710171812046148913195591684 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 9. -/
theorem ep_Q2_019_partial_09_0026_valid :
    mulPoly ep_Q2_019_coefficient_09_0026
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0027 : Poly :=
[
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(1, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 27 for generator 9. -/
def ep_Q2_019_partial_09_0027 : Poly :=
[
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(0, 2), (1, 1), (9, 1), (14, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(1, 3), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 9. -/
theorem ep_Q2_019_partial_09_0027_valid :
    mulPoly ep_Q2_019_coefficient_09_0027
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0028 : Poly :=
[
  term ((593517709551473596819066999499978676598 : Rat) / 11267444650101299135562946349658019887) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 28 for generator 9. -/
def ep_Q2_019_partial_09_0028 : Poly :=
[
  term ((-1187035419102947193638133998999957353196 : Rat) / 11267444650101299135562946349658019887) [(0, 1), (1, 1), (2, 1), (9, 1), (16, 1)],
  term ((593517709551473596819066999499978676598 : Rat) / 11267444650101299135562946349658019887) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-1187035419102947193638133998999957353196 : Rat) / 11267444650101299135562946349658019887) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((593517709551473596819066999499978676598 : Rat) / 11267444650101299135562946349658019887) [(1, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 9. -/
theorem ep_Q2_019_partial_09_0028_valid :
    mulPoly ep_Q2_019_coefficient_09_0028
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0029 : Poly :=
[
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 9. -/
def ep_Q2_019_partial_09_0029 : Poly :=
[
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 9. -/
theorem ep_Q2_019_partial_09_0029_valid :
    mulPoly ep_Q2_019_coefficient_09_0029
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0030 : Poly :=
[
  term ((2322600708198757685499136146687124576 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 30 for generator 9. -/
def ep_Q2_019_partial_09_0030 : Poly :=
[
  term ((-4645201416397515370998272293374249152 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((2322600708198757685499136146687124576 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4645201416397515370998272293374249152 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((2322600708198757685499136146687124576 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 9. -/
theorem ep_Q2_019_partial_09_0030_valid :
    mulPoly ep_Q2_019_coefficient_09_0030
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0031 : Poly :=
[
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 31 for generator 9. -/
def ep_Q2_019_partial_09_0031 : Poly :=
[
  term ((-273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 9. -/
theorem ep_Q2_019_partial_09_0031_valid :
    mulPoly ep_Q2_019_coefficient_09_0031
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0032 : Poly :=
[
  term ((-1211025595365370085523615678979528120 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 9. -/
def ep_Q2_019_partial_09_0032 : Poly :=
[
  term ((2422051190730740171047231357959056240 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((-1211025595365370085523615678979528120 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((2422051190730740171047231357959056240 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-1211025595365370085523615678979528120 : Rat) / 1251938294455699903951438483295335543) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 9. -/
theorem ep_Q2_019_partial_09_0032_valid :
    mulPoly ep_Q2_019_coefficient_09_0032
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0033 : Poly :=
[
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 33 for generator 9. -/
def ep_Q2_019_partial_09_0033 : Poly :=
[
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 9. -/
theorem ep_Q2_019_partial_09_0033_valid :
    mulPoly ep_Q2_019_coefficient_09_0033
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0034 : Poly :=
[
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 9. -/
def ep_Q2_019_partial_09_0034 : Poly :=
[
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 9. -/
theorem ep_Q2_019_partial_09_0034_valid :
    mulPoly ep_Q2_019_coefficient_09_0034
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0035 : Poly :=
[
  term ((-432788241430681288000707781326283322116 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 9. -/
def ep_Q2_019_partial_09_0035 : Poly :=
[
  term ((865576482861362576001415562652566644232 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-432788241430681288000707781326283322116 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((865576482861362576001415562652566644232 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-432788241430681288000707781326283322116 : Rat) / 1708895771932030368893713529698133016195) [(1, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 9. -/
theorem ep_Q2_019_partial_09_0035_valid :
    mulPoly ep_Q2_019_coefficient_09_0035
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0036 : Poly :=
[
  term ((2549259011638147430179525163327080704 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 36 for generator 9. -/
def ep_Q2_019_partial_09_0036 : Poly :=
[
  term ((-5098518023276294860359050326654161408 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((2549259011638147430179525163327080704 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5098518023276294860359050326654161408 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((2549259011638147430179525163327080704 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 9. -/
theorem ep_Q2_019_partial_09_0036_valid :
    mulPoly ep_Q2_019_coefficient_09_0036
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0037 : Poly :=
[
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 37 for generator 9. -/
def ep_Q2_019_partial_09_0037 : Poly :=
[
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 9. -/
theorem ep_Q2_019_partial_09_0037_valid :
    mulPoly ep_Q2_019_coefficient_09_0037
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0038 : Poly :=
[
  term ((-854930674657400678960774100606229209704 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 38 for generator 9. -/
def ep_Q2_019_partial_09_0038 : Poly :=
[
  term ((1709861349314801357921548201212458419408 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((-854930674657400678960774100606229209704 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((1709861349314801357921548201212458419408 : Rat) / 43817840305949496638300346915336744005) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((-854930674657400678960774100606229209704 : Rat) / 43817840305949496638300346915336744005) [(1, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 9. -/
theorem ep_Q2_019_partial_09_0038_valid :
    mulPoly ep_Q2_019_coefficient_09_0038
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0039 : Poly :=
[
  term ((-961246253611453075602719251639060512 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 9. -/
def ep_Q2_019_partial_09_0039 : Poly :=
[
  term ((1922492507222906151205438503278121024 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-961246253611453075602719251639060512 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((1922492507222906151205438503278121024 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-961246253611453075602719251639060512 : Rat) / 1251938294455699903951438483295335543) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 9. -/
theorem ep_Q2_019_partial_09_0039_valid :
    mulPoly ep_Q2_019_coefficient_09_0039
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0040 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 9. -/
def ep_Q2_019_partial_09_0040 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 9. -/
theorem ep_Q2_019_partial_09_0040_valid :
    mulPoly ep_Q2_019_coefficient_09_0040
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0041 : Poly :=
[
  term ((2747798086497582578092301889036536730614 : Rat) / 81375989139620493756843501414196810295) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 9. -/
def ep_Q2_019_partial_09_0041 : Poly :=
[
  term ((-5495596172995165156184603778073073461228 : Rat) / 81375989139620493756843501414196810295) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((2747798086497582578092301889036536730614 : Rat) / 81375989139620493756843501414196810295) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-5495596172995165156184603778073073461228 : Rat) / 81375989139620493756843501414196810295) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((2747798086497582578092301889036536730614 : Rat) / 81375989139620493756843501414196810295) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 9. -/
theorem ep_Q2_019_partial_09_0041_valid :
    mulPoly ep_Q2_019_coefficient_09_0041
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0042 : Poly :=
[
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (15, 3), (16, 1)]
]

/-- Partial product 42 for generator 9. -/
def ep_Q2_019_partial_09_0042 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (15, 3), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (15, 3), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 9. -/
theorem ep_Q2_019_partial_09_0042_valid :
    mulPoly ep_Q2_019_coefficient_09_0042
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0043 : Poly :=
[
  term ((-878196339605601634362442749119471546642 : Rat) / 26290704183569697982980208149202046403) [(1, 2), (16, 1)]
]

/-- Partial product 43 for generator 9. -/
def ep_Q2_019_partial_09_0043 : Poly :=
[
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((-878196339605601634362442749119471546642 : Rat) / 26290704183569697982980208149202046403) [(0, 2), (1, 2), (16, 1)],
  term ((1756392679211203268724885498238943093284 : Rat) / 26290704183569697982980208149202046403) [(1, 3), (3, 1), (16, 1)],
  term ((-878196339605601634362442749119471546642 : Rat) / 26290704183569697982980208149202046403) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 9. -/
theorem ep_Q2_019_partial_09_0043_valid :
    mulPoly ep_Q2_019_coefficient_09_0043
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0044 : Poly :=
[
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 44 for generator 9. -/
def ep_Q2_019_partial_09_0044 : Poly :=
[
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 9. -/
theorem ep_Q2_019_partial_09_0044_valid :
    mulPoly ep_Q2_019_coefficient_09_0044
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0045 : Poly :=
[
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 9. -/
def ep_Q2_019_partial_09_0045 : Poly :=
[
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 9. -/
theorem ep_Q2_019_partial_09_0045_valid :
    mulPoly ep_Q2_019_coefficient_09_0045
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0046 : Poly :=
[
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 9. -/
def ep_Q2_019_partial_09_0046 : Poly :=
[
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 9. -/
theorem ep_Q2_019_partial_09_0046_valid :
    mulPoly ep_Q2_019_coefficient_09_0046
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0047 : Poly :=
[
  term ((-1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 9. -/
def ep_Q2_019_partial_09_0047 : Poly :=
[
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 9. -/
theorem ep_Q2_019_partial_09_0047_valid :
    mulPoly ep_Q2_019_coefficient_09_0047
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0048 : Poly :=
[
  term ((-501757087856987952435204782114163336 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 2), (16, 1)]
]

/-- Partial product 48 for generator 9. -/
def ep_Q2_019_partial_09_0048 : Poly :=
[
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 2), (16, 1)],
  term ((-501757087856987952435204782114163336 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (7, 2), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (7, 2), (16, 1)],
  term ((-501757087856987952435204782114163336 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 9. -/
theorem ep_Q2_019_partial_09_0048_valid :
    mulPoly ep_Q2_019_coefficient_09_0048
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0049 : Poly :=
[
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 9. -/
def ep_Q2_019_partial_09_0049 : Poly :=
[
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 9. -/
theorem ep_Q2_019_partial_09_0049_valid :
    mulPoly ep_Q2_019_coefficient_09_0049
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0050 : Poly :=
[
  term ((9048531180484721490722137446542376 : Rat) / 10520489869375629444970071288196097) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 50 for generator 9. -/
def ep_Q2_019_partial_09_0050 : Poly :=
[
  term ((-18097062360969442981444274893084752 : Rat) / 10520489869375629444970071288196097) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((9048531180484721490722137446542376 : Rat) / 10520489869375629444970071288196097) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((-18097062360969442981444274893084752 : Rat) / 10520489869375629444970071288196097) [(1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((9048531180484721490722137446542376 : Rat) / 10520489869375629444970071288196097) [(1, 2), (2, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 9. -/
theorem ep_Q2_019_partial_09_0050_valid :
    mulPoly ep_Q2_019_coefficient_09_0050
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0051 : Poly :=
[
  term ((2221448541614736482721494560019021280 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 9. -/
def ep_Q2_019_partial_09_0051 : Poly :=
[
  term ((-4442897083229472965442989120038042560 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((2221448541614736482721494560019021280 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4442897083229472965442989120038042560 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((2221448541614736482721494560019021280 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 9. -/
theorem ep_Q2_019_partial_09_0051_valid :
    mulPoly ep_Q2_019_coefficient_09_0051
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0052 : Poly :=
[
  term ((-37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(2, 1), (13, 2), (16, 1)]
]

/-- Partial product 52 for generator 9. -/
def ep_Q2_019_partial_09_0052 : Poly :=
[
  term ((75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((-37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(0, 2), (2, 1), (13, 2), (16, 1)],
  term ((75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((-37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(1, 2), (2, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 9. -/
theorem ep_Q2_019_partial_09_0052_valid :
    mulPoly ep_Q2_019_coefficient_09_0052
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0053 : Poly :=
[
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 53 for generator 9. -/
def ep_Q2_019_partial_09_0053 : Poly :=
[
  term ((4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 9. -/
theorem ep_Q2_019_partial_09_0053_valid :
    mulPoly ep_Q2_019_coefficient_09_0053
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0054 : Poly :=
[
  term ((-10104852927266981079901813169925015216 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 54 for generator 9. -/
def ep_Q2_019_partial_09_0054 : Poly :=
[
  term ((20209705854533962159803626339850030432 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((-10104852927266981079901813169925015216 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((20209705854533962159803626339850030432 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((-10104852927266981079901813169925015216 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 9. -/
theorem ep_Q2_019_partial_09_0054_valid :
    mulPoly ep_Q2_019_coefficient_09_0054
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0055 : Poly :=
[
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (15, 2), (16, 1)]
]

/-- Partial product 55 for generator 9. -/
def ep_Q2_019_partial_09_0055 : Poly :=
[
  term ((-4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 9. -/
theorem ep_Q2_019_partial_09_0055_valid :
    mulPoly ep_Q2_019_coefficient_09_0055
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0056 : Poly :=
[
  term ((1000015029401399085768925721606487120 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (16, 1)]
]

/-- Partial product 56 for generator 9. -/
def ep_Q2_019_partial_09_0056 : Poly :=
[
  term ((-2000030058802798171537851443212974240 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 2), (16, 1)],
  term ((1000015029401399085768925721606487120 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (2, 1), (16, 1)],
  term ((-2000030058802798171537851443212974240 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((1000015029401399085768925721606487120 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (2, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 9. -/
theorem ep_Q2_019_partial_09_0056_valid :
    mulPoly ep_Q2_019_coefficient_09_0056
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0057 : Poly :=
[
  term ((501757087856987952435204782114163336 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 1), (7, 1), (16, 1)]
]

/-- Partial product 57 for generator 9. -/
def ep_Q2_019_partial_09_0057 : Poly :=
[
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((501757087856987952435204782114163336 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (6, 1), (7, 1), (16, 1)],
  term ((501757087856987952435204782114163336 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (6, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 9. -/
theorem ep_Q2_019_partial_09_0057_valid :
    mulPoly ep_Q2_019_coefficient_09_0057
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0058 : Poly :=
[
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 9. -/
def ep_Q2_019_partial_09_0058 : Poly :=
[
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 9. -/
theorem ep_Q2_019_partial_09_0058_valid :
    mulPoly ep_Q2_019_coefficient_09_0058
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0059 : Poly :=
[
  term ((144112281834639569911291992991568016 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 59 for generator 9. -/
def ep_Q2_019_partial_09_0059 : Poly :=
[
  term ((-288224563669279139822583985983136032 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((144112281834639569911291992991568016 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-288224563669279139822583985983136032 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((144112281834639569911291992991568016 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 9. -/
theorem ep_Q2_019_partial_09_0059_valid :
    mulPoly ep_Q2_019_coefficient_09_0059
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0060 : Poly :=
[
  term ((1465177311543968770192221161055360576 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 60 for generator 9. -/
def ep_Q2_019_partial_09_0060 : Poly :=
[
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((1465177311543968770192221161055360576 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (7, 1), (14, 1), (16, 1)],
  term ((1465177311543968770192221161055360576 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (7, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 9. -/
theorem ep_Q2_019_partial_09_0060_valid :
    mulPoly ep_Q2_019_coefficient_09_0060
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0061 : Poly :=
[
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 61 for generator 9. -/
def ep_Q2_019_partial_09_0061 : Poly :=
[
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)],
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 9. -/
theorem ep_Q2_019_partial_09_0061_valid :
    mulPoly ep_Q2_019_coefficient_09_0061
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0062 : Poly :=
[
  term ((27330893589779239169630271312073872 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 62 for generator 9. -/
def ep_Q2_019_partial_09_0062 : Poly :=
[
  term ((-54661787179558478339260542624147744 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((27330893589779239169630271312073872 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-54661787179558478339260542624147744 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((27330893589779239169630271312073872 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 9. -/
theorem ep_Q2_019_partial_09_0062_valid :
    mulPoly ep_Q2_019_coefficient_09_0062
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0063 : Poly :=
[
  term ((-45266173521756046406614457418424080 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 63 for generator 9. -/
def ep_Q2_019_partial_09_0063 : Poly :=
[
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((-45266173521756046406614457418424080 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((-45266173521756046406614457418424080 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (3, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 9. -/
theorem ep_Q2_019_partial_09_0063_valid :
    mulPoly ep_Q2_019_coefficient_09_0063
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0064 : Poly :=
[
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 64 for generator 9. -/
def ep_Q2_019_partial_09_0064 : Poly :=
[
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 9. -/
theorem ep_Q2_019_partial_09_0064_valid :
    mulPoly ep_Q2_019_coefficient_09_0064
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0065 : Poly :=
[
  term ((37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(3, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 65 for generator 9. -/
def ep_Q2_019_partial_09_0065 : Poly :=
[
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(0, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 9. -/
theorem ep_Q2_019_partial_09_0065_valid :
    mulPoly ep_Q2_019_coefficient_09_0065
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0066 : Poly :=
[
  term ((-5558757759548014969642364206630895376 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 66 for generator 9. -/
def ep_Q2_019_partial_09_0066 : Poly :=
[
  term ((11117515519096029939284728413261790752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5558757759548014969642364206630895376 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((11117515519096029939284728413261790752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((-5558757759548014969642364206630895376 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 9. -/
theorem ep_Q2_019_partial_09_0066_valid :
    mulPoly ep_Q2_019_coefficient_09_0066
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0067 : Poly :=
[
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(3, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 67 for generator 9. -/
def ep_Q2_019_partial_09_0067 : Poly :=
[
  term ((151203968374790167274266347089689824 : Rat) / 52602449346878147224850356440980485) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((151203968374790167274266347089689824 : Rat) / 52602449346878147224850356440980485) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 9. -/
theorem ep_Q2_019_partial_09_0067_valid :
    mulPoly ep_Q2_019_coefficient_09_0067
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0068 : Poly :=
[
  term ((923254848325116314141917087074431496 : Rat) / 1251938294455699903951438483295335543) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 68 for generator 9. -/
def ep_Q2_019_partial_09_0068 : Poly :=
[
  term ((-1846509696650232628283834174148862992 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((923254848325116314141917087074431496 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-1846509696650232628283834174148862992 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((923254848325116314141917087074431496 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (3, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 9. -/
theorem ep_Q2_019_partial_09_0068_valid :
    mulPoly ep_Q2_019_coefficient_09_0068
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0069 : Poly :=
[
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 9. -/
def ep_Q2_019_partial_09_0069 : Poly :=
[
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 9. -/
theorem ep_Q2_019_partial_09_0069_valid :
    mulPoly ep_Q2_019_coefficient_09_0069
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0070 : Poly :=
[
  term ((4220997456241884681557445719980095288 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 70 for generator 9. -/
def ep_Q2_019_partial_09_0070 : Poly :=
[
  term ((-8441994912483769363114891439960190576 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((4220997456241884681557445719980095288 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-8441994912483769363114891439960190576 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((4220997456241884681557445719980095288 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 9. -/
theorem ep_Q2_019_partial_09_0070_valid :
    mulPoly ep_Q2_019_coefficient_09_0070
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0071 : Poly :=
[
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 71 for generator 9. -/
def ep_Q2_019_partial_09_0071 : Poly :=
[
  term ((4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (15, 3), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (15, 3), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 9. -/
theorem ep_Q2_019_partial_09_0071_valid :
    mulPoly ep_Q2_019_coefficient_09_0071
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0072 : Poly :=
[
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 72 for generator 9. -/
def ep_Q2_019_partial_09_0072 : Poly :=
[
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (4, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 9. -/
theorem ep_Q2_019_partial_09_0072_valid :
    mulPoly ep_Q2_019_coefficient_09_0072
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0073 : Poly :=
[
  term ((1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 73 for generator 9. -/
def ep_Q2_019_partial_09_0073 : Poly :=
[
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (4, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 9. -/
theorem ep_Q2_019_partial_09_0073_valid :
    mulPoly ep_Q2_019_coefficient_09_0073
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0074 : Poly :=
[
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 74 for generator 9. -/
def ep_Q2_019_partial_09_0074 : Poly :=
[
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 9. -/
theorem ep_Q2_019_partial_09_0074_valid :
    mulPoly ep_Q2_019_coefficient_09_0074
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0075 : Poly :=
[
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 75 for generator 9. -/
def ep_Q2_019_partial_09_0075 : Poly :=
[
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(0, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(1, 2), (4, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 9. -/
theorem ep_Q2_019_partial_09_0075_valid :
    mulPoly ep_Q2_019_coefficient_09_0075
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0076 : Poly :=
[
  term ((1142478260597101954385414205726172304 : Rat) / 1251938294455699903951438483295335543) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 9. -/
def ep_Q2_019_partial_09_0076 : Poly :=
[
  term ((-2284956521194203908770828411452344608 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((1142478260597101954385414205726172304 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2284956521194203908770828411452344608 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((1142478260597101954385414205726172304 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 9. -/
theorem ep_Q2_019_partial_09_0076_valid :
    mulPoly ep_Q2_019_coefficient_09_0076
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0077 : Poly :=
[
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 9. -/
def ep_Q2_019_partial_09_0077 : Poly :=
[
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 9. -/
theorem ep_Q2_019_partial_09_0077_valid :
    mulPoly ep_Q2_019_coefficient_09_0077
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0078 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(4, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 78 for generator 9. -/
def ep_Q2_019_partial_09_0078 : Poly :=
[
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (4, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 9. -/
theorem ep_Q2_019_partial_09_0078_valid :
    mulPoly ep_Q2_019_coefficient_09_0078
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0079 : Poly :=
[
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 9. -/
def ep_Q2_019_partial_09_0079 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 9. -/
theorem ep_Q2_019_partial_09_0079_valid :
    mulPoly ep_Q2_019_coefficient_09_0079
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0080 : Poly :=
[
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(4, 1), (15, 2), (16, 1)]
]

/-- Partial product 80 for generator 9. -/
def ep_Q2_019_partial_09_0080 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (4, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 9. -/
theorem ep_Q2_019_partial_09_0080_valid :
    mulPoly ep_Q2_019_coefficient_09_0080
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0081 : Poly :=
[
  term ((-1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 81 for generator 9. -/
def ep_Q2_019_partial_09_0081 : Poly :=
[
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (5, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 9. -/
theorem ep_Q2_019_partial_09_0081_valid :
    mulPoly ep_Q2_019_coefficient_09_0081
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0082 : Poly :=
[
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 82 for generator 9. -/
def ep_Q2_019_partial_09_0082 : Poly :=
[
  term ((7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 9. -/
theorem ep_Q2_019_partial_09_0082_valid :
    mulPoly ep_Q2_019_coefficient_09_0082
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0083 : Poly :=
[
  term ((-3331881455724356834102120359101141364 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 83 for generator 9. -/
def ep_Q2_019_partial_09_0083 : Poly :=
[
  term ((6663762911448713668204240718202282728 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((-3331881455724356834102120359101141364 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((6663762911448713668204240718202282728 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((-3331881455724356834102120359101141364 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (5, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 9. -/
theorem ep_Q2_019_partial_09_0083_valid :
    mulPoly ep_Q2_019_coefficient_09_0083
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0084 : Poly :=
[
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 84 for generator 9. -/
def ep_Q2_019_partial_09_0084 : Poly :=
[
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(0, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 9. -/
theorem ep_Q2_019_partial_09_0084_valid :
    mulPoly ep_Q2_019_coefficient_09_0084
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0085 : Poly :=
[
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 85 for generator 9. -/
def ep_Q2_019_partial_09_0085 : Poly :=
[
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 9. -/
theorem ep_Q2_019_partial_09_0085_valid :
    mulPoly ep_Q2_019_coefficient_09_0085
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0086 : Poly :=
[
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 86 for generator 9. -/
def ep_Q2_019_partial_09_0086 : Poly :=
[
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 2), (5, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 9. -/
theorem ep_Q2_019_partial_09_0086_valid :
    mulPoly ep_Q2_019_coefficient_09_0086
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0087 : Poly :=
[
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 9. -/
def ep_Q2_019_partial_09_0087 : Poly :=
[
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 9. -/
theorem ep_Q2_019_partial_09_0087_valid :
    mulPoly ep_Q2_019_coefficient_09_0087
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0088 : Poly :=
[
  term ((822367695049891815611516389024402042706 : Rat) / 569631923977343456297904509899377672065) [(5, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 9. -/
def ep_Q2_019_partial_09_0088 : Poly :=
[
  term ((-1644735390099783631223032778048804085412 : Rat) / 569631923977343456297904509899377672065) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 569631923977343456297904509899377672065) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 569631923977343456297904509899377672065) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 569631923977343456297904509899377672065) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 9. -/
theorem ep_Q2_019_partial_09_0088_valid :
    mulPoly ep_Q2_019_coefficient_09_0088
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0089 : Poly :=
[
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 9. -/
def ep_Q2_019_partial_09_0089 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (5, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 9. -/
theorem ep_Q2_019_partial_09_0089_valid :
    mulPoly ep_Q2_019_coefficient_09_0089
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0090 : Poly :=
[
  term ((-18097062360969442981444274893084752 : Rat) / 10520489869375629444970071288196097) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 90 for generator 9. -/
def ep_Q2_019_partial_09_0090 : Poly :=
[
  term ((36194124721938885962888549786169504 : Rat) / 10520489869375629444970071288196097) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-18097062360969442981444274893084752 : Rat) / 10520489869375629444970071288196097) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((36194124721938885962888549786169504 : Rat) / 10520489869375629444970071288196097) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-18097062360969442981444274893084752 : Rat) / 10520489869375629444970071288196097) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 9. -/
theorem ep_Q2_019_partial_09_0090_valid :
    mulPoly ep_Q2_019_coefficient_09_0090
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0091 : Poly :=
[
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 9. -/
def ep_Q2_019_partial_09_0091 : Poly :=
[
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 9. -/
theorem ep_Q2_019_partial_09_0091_valid :
    mulPoly ep_Q2_019_coefficient_09_0091
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0092 : Poly :=
[
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 9. -/
def ep_Q2_019_partial_09_0092 : Poly :=
[
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 9. -/
theorem ep_Q2_019_partial_09_0092_valid :
    mulPoly ep_Q2_019_coefficient_09_0092
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0093 : Poly :=
[
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 93 for generator 9. -/
def ep_Q2_019_partial_09_0093 : Poly :=
[
  term ((20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 9. -/
theorem ep_Q2_019_partial_09_0093_valid :
    mulPoly ep_Q2_019_coefficient_09_0093
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0094 : Poly :=
[
  term ((-2159784136890572987213733728886623208 : Rat) / 894241638896928502822456059496668245) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 94 for generator 9. -/
def ep_Q2_019_partial_09_0094 : Poly :=
[
  term ((4319568273781145974427467457773246416 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2159784136890572987213733728886623208 : Rat) / 894241638896928502822456059496668245) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((4319568273781145974427467457773246416 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-2159784136890572987213733728886623208 : Rat) / 894241638896928502822456059496668245) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 9. -/
theorem ep_Q2_019_partial_09_0094_valid :
    mulPoly ep_Q2_019_coefficient_09_0094
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0095 : Poly :=
[
  term ((5122602770914865578970504424971993088 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 95 for generator 9. -/
def ep_Q2_019_partial_09_0095 : Poly :=
[
  term ((-10245205541829731157941008849943986176 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (12, 1), (16, 1)],
  term ((5122602770914865578970504424971993088 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((-10245205541829731157941008849943986176 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (12, 1), (16, 1)],
  term ((5122602770914865578970504424971993088 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 9. -/
theorem ep_Q2_019_partial_09_0095_valid :
    mulPoly ep_Q2_019_coefficient_09_0095
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0096 : Poly :=
[
  term ((-1823965323254377472214428705111366208 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 96 for generator 9. -/
def ep_Q2_019_partial_09_0096 : Poly :=
[
  term ((3647930646508754944428857410222732416 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1823965323254377472214428705111366208 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((3647930646508754944428857410222732416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1823965323254377472214428705111366208 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 9. -/
theorem ep_Q2_019_partial_09_0096_valid :
    mulPoly ep_Q2_019_coefficient_09_0096
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0097 : Poly :=
[
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 97 for generator 9. -/
def ep_Q2_019_partial_09_0097 : Poly :=
[
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (13, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 9. -/
theorem ep_Q2_019_partial_09_0097_valid :
    mulPoly ep_Q2_019_coefficient_09_0097
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0098 : Poly :=
[
  term ((-1599514024359988436427283177651465244 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 98 for generator 9. -/
def ep_Q2_019_partial_09_0098 : Poly :=
[
  term ((3199028048719976872854566355302930488 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-1599514024359988436427283177651465244 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (6, 1), (14, 1), (16, 1)],
  term ((3199028048719976872854566355302930488 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (6, 1), (14, 1), (16, 1)],
  term ((-1599514024359988436427283177651465244 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 9. -/
theorem ep_Q2_019_partial_09_0098_valid :
    mulPoly ep_Q2_019_coefficient_09_0098
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 9. -/
def ep_Q2_019_coefficient_09_0099 : Poly :=
[
  term ((8119449544546602358389212753204395548 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (14, 2), (16, 1)]
]

/-- Partial product 99 for generator 9. -/
def ep_Q2_019_partial_09_0099 : Poly :=
[
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (14, 2), (16, 1)],
  term ((8119449544546602358389212753204395548 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (14, 2), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (14, 2), (16, 1)],
  term ((8119449544546602358389212753204395548 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 9. -/
theorem ep_Q2_019_partial_09_0099_valid :
    mulPoly ep_Q2_019_coefficient_09_0099
        ep_Q2_019_generator_09_0000_0099 =
      ep_Q2_019_partial_09_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_09_0000_0099 : List Poly :=
[
  ep_Q2_019_partial_09_0000,
  ep_Q2_019_partial_09_0001,
  ep_Q2_019_partial_09_0002,
  ep_Q2_019_partial_09_0003,
  ep_Q2_019_partial_09_0004,
  ep_Q2_019_partial_09_0005,
  ep_Q2_019_partial_09_0006,
  ep_Q2_019_partial_09_0007,
  ep_Q2_019_partial_09_0008,
  ep_Q2_019_partial_09_0009,
  ep_Q2_019_partial_09_0010,
  ep_Q2_019_partial_09_0011,
  ep_Q2_019_partial_09_0012,
  ep_Q2_019_partial_09_0013,
  ep_Q2_019_partial_09_0014,
  ep_Q2_019_partial_09_0015,
  ep_Q2_019_partial_09_0016,
  ep_Q2_019_partial_09_0017,
  ep_Q2_019_partial_09_0018,
  ep_Q2_019_partial_09_0019,
  ep_Q2_019_partial_09_0020,
  ep_Q2_019_partial_09_0021,
  ep_Q2_019_partial_09_0022,
  ep_Q2_019_partial_09_0023,
  ep_Q2_019_partial_09_0024,
  ep_Q2_019_partial_09_0025,
  ep_Q2_019_partial_09_0026,
  ep_Q2_019_partial_09_0027,
  ep_Q2_019_partial_09_0028,
  ep_Q2_019_partial_09_0029,
  ep_Q2_019_partial_09_0030,
  ep_Q2_019_partial_09_0031,
  ep_Q2_019_partial_09_0032,
  ep_Q2_019_partial_09_0033,
  ep_Q2_019_partial_09_0034,
  ep_Q2_019_partial_09_0035,
  ep_Q2_019_partial_09_0036,
  ep_Q2_019_partial_09_0037,
  ep_Q2_019_partial_09_0038,
  ep_Q2_019_partial_09_0039,
  ep_Q2_019_partial_09_0040,
  ep_Q2_019_partial_09_0041,
  ep_Q2_019_partial_09_0042,
  ep_Q2_019_partial_09_0043,
  ep_Q2_019_partial_09_0044,
  ep_Q2_019_partial_09_0045,
  ep_Q2_019_partial_09_0046,
  ep_Q2_019_partial_09_0047,
  ep_Q2_019_partial_09_0048,
  ep_Q2_019_partial_09_0049,
  ep_Q2_019_partial_09_0050,
  ep_Q2_019_partial_09_0051,
  ep_Q2_019_partial_09_0052,
  ep_Q2_019_partial_09_0053,
  ep_Q2_019_partial_09_0054,
  ep_Q2_019_partial_09_0055,
  ep_Q2_019_partial_09_0056,
  ep_Q2_019_partial_09_0057,
  ep_Q2_019_partial_09_0058,
  ep_Q2_019_partial_09_0059,
  ep_Q2_019_partial_09_0060,
  ep_Q2_019_partial_09_0061,
  ep_Q2_019_partial_09_0062,
  ep_Q2_019_partial_09_0063,
  ep_Q2_019_partial_09_0064,
  ep_Q2_019_partial_09_0065,
  ep_Q2_019_partial_09_0066,
  ep_Q2_019_partial_09_0067,
  ep_Q2_019_partial_09_0068,
  ep_Q2_019_partial_09_0069,
  ep_Q2_019_partial_09_0070,
  ep_Q2_019_partial_09_0071,
  ep_Q2_019_partial_09_0072,
  ep_Q2_019_partial_09_0073,
  ep_Q2_019_partial_09_0074,
  ep_Q2_019_partial_09_0075,
  ep_Q2_019_partial_09_0076,
  ep_Q2_019_partial_09_0077,
  ep_Q2_019_partial_09_0078,
  ep_Q2_019_partial_09_0079,
  ep_Q2_019_partial_09_0080,
  ep_Q2_019_partial_09_0081,
  ep_Q2_019_partial_09_0082,
  ep_Q2_019_partial_09_0083,
  ep_Q2_019_partial_09_0084,
  ep_Q2_019_partial_09_0085,
  ep_Q2_019_partial_09_0086,
  ep_Q2_019_partial_09_0087,
  ep_Q2_019_partial_09_0088,
  ep_Q2_019_partial_09_0089,
  ep_Q2_019_partial_09_0090,
  ep_Q2_019_partial_09_0091,
  ep_Q2_019_partial_09_0092,
  ep_Q2_019_partial_09_0093,
  ep_Q2_019_partial_09_0094,
  ep_Q2_019_partial_09_0095,
  ep_Q2_019_partial_09_0096,
  ep_Q2_019_partial_09_0097,
  ep_Q2_019_partial_09_0098,
  ep_Q2_019_partial_09_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_09_0000_0099 : Poly :=
[
  term ((-11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6896302339548695017707478116744667008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((-4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-998970509088908385815305546357283808 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (2, 1), (3, 1), (16, 1)],
  term ((4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (4, 1), (11, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (5, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (6, 1), (7, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((8391772347420343624092297826391183368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (7, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(0, 1), (1, 1), (2, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1187035419102947193638133998999957353196 : Rat) / 11267444650101299135562946349658019887) [(0, 1), (1, 1), (2, 1), (9, 1), (16, 1)],
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4645201416397515370998272293374249152 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (11, 1), (14, 1), (16, 1)],
  term ((-273140727580677667434527660582734464 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (2, 1), (11, 1), (15, 2), (16, 1)],
  term ((2422051190730740171047231357959056240 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((865576482861362576001415562652566644232 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5098518023276294860359050326654161408 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (13, 1), (14, 1), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (13, 1), (15, 2), (16, 1)],
  term ((1709861349314801357921548201212458419408 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (2, 1), (13, 1), (16, 1)],
  term ((1922492507222906151205438503278121024 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5495596172995165156184603778073073461228 : Rat) / 81375989139620493756843501414196810295) [(0, 1), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 1), (15, 3), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 2), (11, 1), (16, 1)],
  term ((-4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 2), (14, 1), (15, 1), (16, 1)],
  term ((4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (6, 1), (16, 1)],
  term ((-15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (3, 1), (9, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (3, 1), (9, 1), (15, 1), (16, 1)],
  term ((-213829147697446740888389801616717888 : Rat) / 169180850602121608642086281526396695) [(0, 1), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((22664313196050398057268984479489035872 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (13, 2), (16, 1)],
  term ((-14494812776345726461678266835289649152 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (14, 1), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (14, 2), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-26694085662176657631896059955661937593704 : Rat) / 394360562753545469744703122238030696045) [(0, 1), (1, 1), (3, 1), (16, 1)],
  term ((8805235949044322632293169767074573350868 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (1, 2), (2, 1), (16, 1)],
  term ((-8119449544546602358389212753204395548 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (6, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (7, 1), (13, 1), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (7, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 2), (9, 1), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 2), (9, 1), (15, 1), (16, 1)],
  term ((106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 1), (1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-11332156598025199028634492239744517936 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (12, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (13, 2), (16, 1)],
  term ((7247406388172863230839133417644824576 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (14, 1), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (14, 2), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 2), (15, 2), (16, 1)],
  term ((13347042831088328815948029977830968796852 : Rat) / 394360562753545469744703122238030696045) [(0, 1), (1, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-288224563669279139822583985983136032 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((-54661787179558478339260542624147744 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (7, 1), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (9, 1), (16, 1)],
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(0, 1), (2, 1), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((11117515519096029939284728413261790752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((151203968374790167274266347089689824 : Rat) / 52602449346878147224850356440980485) [(0, 1), (2, 1), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1846509696650232628283834174148862992 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (3, 1), (13, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8441994912483769363114891439960190576 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (3, 1), (15, 3), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2284956521194203908770828411452344608 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (4, 1), (15, 2), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((6663762911448713668204240718202282728 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (5, 1), (9, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (5, 1), (11, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 569631923977343456297904509899377672065) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((36194124721938885962888549786169504 : Rat) / 10520489869375629444970071288196097) [(0, 1), (2, 1), (5, 1), (13, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 1), (2, 1), (5, 1), (15, 1), (16, 1)],
  term ((20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((4319568273781145974427467457773246416 : Rat) / 894241638896928502822456059496668245) [(0, 1), (2, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10245205541829731157941008849943986176 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (12, 1), (16, 1)],
  term ((3647930646508754944428857410222732416 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (13, 2), (16, 1)],
  term ((3199028048719976872854566355302930488 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (14, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 1), (11, 1), (16, 1)],
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (7, 2), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18097062360969442981444274893084752 : Rat) / 10520489869375629444970071288196097) [(0, 1), (2, 2), (12, 1), (16, 1)],
  term ((-4442897083229472965442989120038042560 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(0, 1), (2, 2), (13, 2), (16, 1)],
  term ((4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (14, 1), (15, 2), (16, 1)],
  term ((20209705854533962159803626339850030432 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (14, 1), (16, 1)],
  term ((-4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-2000030058802798171537851443212974240 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 2), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (2, 1), (11, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (2, 1), (15, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((3448151169774347508853739058372333504 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (3, 1), (12, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (3, 1), (14, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (3, 1), (15, 2), (16, 1)],
  term ((-914731624015082335744146422112239088 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (1, 1), (3, 1), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (4, 1), (11, 1), (16, 1)],
  term ((6984480522041855377390344836652333868 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-4195886173710171812046148913195591684 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (7, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(0, 2), (1, 1), (9, 1), (14, 1), (16, 1)],
  term ((593517709551473596819066999499978676598 : Rat) / 11267444650101299135562946349658019887) [(0, 2), (1, 1), (9, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2322600708198757685499136146687124576 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1211025595365370085523615678979528120 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-432788241430681288000707781326283322116 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (1, 1), (12, 1), (15, 1), (16, 1)],
  term ((2549259011638147430179525163327080704 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (13, 1), (15, 2), (16, 1)],
  term ((-854930674657400678960774100606229209704 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (1, 1), (13, 1), (16, 1)],
  term ((-961246253611453075602719251639060512 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (14, 2), (15, 1), (16, 1)],
  term ((2747798086497582578092301889036536730614 : Rat) / 81375989139620493756843501414196810295) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (1, 1), (15, 3), (16, 1)],
  term ((-4328371588397785648392365425784515423354 : Rat) / 131453520917848489914901040746010232015) [(0, 2), (1, 2), (16, 1)],
  term ((16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (6, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2979493209566920294319800998282832944 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((1489746604783460147159900499141416472 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (2, 1), (7, 2), (16, 1)],
  term ((-192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (2, 1), (9, 1), (13, 1), (16, 1)],
  term ((-185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (2, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1363527764870579091342755712117743424 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((28048189248438807344248656260181749592 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (12, 1), (16, 1)],
  term ((2221448541614736482721494560019021280 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6505346410577959286150242954374925608 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (13, 2), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24599665703612707541580080005214664368 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (14, 1), (16, 1)],
  term ((5962867583830716516176030458365934272 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 1), (14, 2), (16, 1)],
  term ((486069780146124368134720432383549024 : Rat) / 368217145428147030573952495086863395) [(0, 2), (2, 1), (15, 2), (16, 1)],
  term ((-712948133186897754591320225766375517592 : Rat) / 10658393587933661344451435736162991785) [(0, 2), (2, 1), (16, 1)],
  term ((-2216433617933932254165931036176941376 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (2, 2), (16, 1)],
  term ((501757087856987952435204782114163336 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((144112281834639569911291992991568016 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((1465177311543968770192221161055360576 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((27330893589779239169630271312073872 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (7, 1), (16, 1)],
  term ((-45266173521756046406614457418424080 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (3, 1), (9, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(0, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5558757759548014969642364206630895376 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(0, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((923254848325116314141917087074431496 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (3, 1), (13, 1), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((4220997456241884681557445719980095288 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(0, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((1142478260597101954385414205726172304 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (4, 1), (15, 2), (16, 1)],
  term ((-1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3331881455724356834102120359101141364 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(0, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 569631923977343456297904509899377672065) [(0, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-18097062360969442981444274893084752 : Rat) / 10520489869375629444970071288196097) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2159784136890572987213733728886623208 : Rat) / 894241638896928502822456059496668245) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((5122602770914865578970504424971993088 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((-1823965323254377472214428705111366208 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (13, 2), (16, 1)],
  term ((-1599514024359988436427283177651465244 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (6, 1), (14, 1), (16, 1)],
  term ((8119449544546602358389212753204395548 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (14, 2), (16, 1)],
  term ((-693521539266250055584723562896780512 : Rat) / 894241638896928502822456059496668245) [(0, 3), (2, 1), (16, 1)],
  term ((-8119449544546602358389212753204395548 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (6, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (7, 1), (13, 1), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (7, 2), (16, 1)],
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(0, 3), (9, 1), (13, 1), (16, 1)],
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(0, 3), (9, 1), (15, 1), (16, 1)],
  term ((106914573848723370444194900808358944 : Rat) / 169180850602121608642086281526396695) [(0, 3), (11, 1), (15, 1), (16, 1)],
  term ((-11332156598025199028634492239744517936 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (12, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (13, 2), (16, 1)],
  term ((7247406388172863230839133417644824576 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (14, 1), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (14, 2), (16, 1)],
  term ((-2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 3), (15, 2), (16, 1)],
  term ((13347042831088328815948029977830968796852 : Rat) / 394360562753545469744703122238030696045) [(0, 3), (16, 1)],
  term ((2981433791915358258088015229182967136 : Rat) / 6259691472278499519757192416476677715) [(0, 4), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (7, 2), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-18097062360969442981444274893084752 : Rat) / 10520489869375629444970071288196097) [(1, 1), (2, 1), (3, 1), (12, 1), (16, 1)],
  term ((-4442897083229472965442989120038042560 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term ((75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(1, 1), (2, 1), (3, 1), (13, 2), (16, 1)],
  term ((4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2), (16, 1)],
  term ((20209705854533962159803626339850030432 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (14, 1), (16, 1)],
  term ((-4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (3, 1), (15, 2), (16, 1)],
  term ((-2000030058802798171537851443212974240 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (3, 1), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2284956521194203908770828411452344608 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (4, 1), (15, 2), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((7305198132634997086576448955102385008 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((6663762911448713668204240718202282728 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (5, 1), (9, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1006946292022926245603937951477477728 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((3289470780199567262446065556097608170824 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 569631923977343456297904509899377672065) [(1, 1), (3, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((36194124721938885962888549786169504 : Rat) / 10520489869375629444970071288196097) [(1, 1), (3, 1), (5, 1), (13, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 1), (3, 1), (5, 1), (15, 1), (16, 1)],
  term ((20996164749914544914082650193068097312 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((4319568273781145974427467457773246416 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10245205541829731157941008849943986176 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (12, 1), (16, 1)],
  term ((3647930646508754944428857410222732416 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2007028351427951809740819128456653344 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (13, 2), (16, 1)],
  term ((3199028048719976872854566355302930488 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 1), (6, 1), (14, 1), (16, 1)],
  term ((-16238899089093204716778425506408791096 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (6, 1), (14, 2), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (6, 1), (7, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-288224563669279139822583985983136032 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (7, 1), (12, 1), (16, 1)],
  term ((-2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (7, 1), (14, 1), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (7, 1), (15, 2), (16, 1)],
  term ((-54661787179558478339260542624147744 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (7, 1), (16, 1)],
  term ((90532347043512092813228914836848160 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (9, 1), (16, 1)],
  term ((11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (11, 1), (15, 2), (16, 1)],
  term ((-75601984187395083637133173544844912 : Rat) / 52602449346878147224850356440980485) [(1, 1), (3, 2), (12, 1), (13, 1), (16, 1)],
  term ((11117515519096029939284728413261790752 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (12, 1), (15, 1), (16, 1)],
  term ((151203968374790167274266347089689824 : Rat) / 52602449346878147224850356440980485) [(1, 1), (3, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1846509696650232628283834174148862992 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (3, 2), (13, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (14, 1), (15, 1), (16, 1)],
  term ((-8441994912483769363114891439960190576 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (15, 1), (16, 1)],
  term ((4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 2), (15, 3), (16, 1)],
  term ((2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (3, 1), (11, 1), (16, 1)],
  term ((-4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (3, 1), (15, 1), (16, 1)],
  term ((-547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (7, 1), (11, 1), (16, 1)],
  term ((1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (7, 1), (13, 1), (16, 1)],
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-501757087856987952435204782114163336 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (7, 2), (16, 1)],
  term ((1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (11, 1), (15, 1), (16, 1)],
  term ((9048531180484721490722137446542376 : Rat) / 10520489869375629444970071288196097) [(1, 2), (2, 1), (12, 1), (16, 1)],
  term ((2221448541614736482721494560019021280 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (2, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37800992093697541818566586772422456 : Rat) / 52602449346878147224850356440980485) [(1, 2), (2, 1), (13, 2), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10104852927266981079901813169925015216 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (14, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (2, 1), (15, 2), (16, 1)],
  term ((1000015029401399085768925721606487120 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (2, 1), (16, 1)],
  term ((4376158561810535824626576396919378944 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (4, 1), (11, 1), (16, 1)],
  term ((-13968961044083710754780689673304667736 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-1489746604783460147159900499141416472 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2374505947531682175146553502942904496 : Rat) / 894241638896928502822456059496668245) [(1, 2), (3, 1), (7, 1), (12, 1), (16, 1)],
  term ((1465177311543968770192221161055360576 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (7, 1), (14, 1), (16, 1)],
  term ((1150159339326698871057108446077199568 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (7, 1), (15, 2), (16, 1)],
  term ((1683820648202024572652385619540651448 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (3, 1), (7, 1), (16, 1)],
  term ((70494990463236156807169607267185472 : Rat) / 368217145428147030573952495086863395) [(1, 2), (3, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1187442814664642998055793529116723169916 : Rat) / 11267444650101299135562946349658019887) [(1, 2), (3, 1), (9, 1), (16, 1)],
  term ((11525294033884154843788554738770717184 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-4645201416397515370998272293374249152 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-425083110828191965761266055713830272 : Rat) / 368217145428147030573952495086863395) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((2422051190730740171047231357959056240 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((6505346410577959286150242954374925608 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (12, 1), (13, 1), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-651964385495245510710949865757667793416 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-14095154141576309813177897978490705936 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (13, 1), (14, 1), (16, 1)],
  term ((8878733689883533649980402906392093504 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((2769754004779301158849785849380069192 : Rat) / 69662703189108897676153174746163345) [(1, 2), (3, 1), (13, 1), (16, 1)],
  term ((6682107913026593215642750194279883968 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5440723206064020655324356983713332222484 : Rat) / 81375989139620493756843501414196810295) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-3394358319106031698270860991384243872 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((-11721418492351750161537769288442884608 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-6896302339548695017707478116744667008 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 2), (12, 1), (16, 1)],
  term ((-5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 2), (14, 1), (16, 1)],
  term ((-4600637357306795484228433784308798272 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 2), (15, 2), (16, 1)],
  term ((-2778418927510609674910596695609477664 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (3, 2), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (4, 1), (7, 1), (11, 1), (16, 1)],
  term ((1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (4, 1), (9, 1), (13, 1), (16, 1)],
  term ((3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (4, 1), (9, 1), (15, 1), (16, 1)],
  term ((251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(1, 2), (4, 1), (11, 1), (13, 1), (16, 1)],
  term ((1142478260597101954385414205726172304 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (4, 1), (11, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (4, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (4, 1), (12, 1), (15, 2), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (4, 1), (13, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (4, 1), (15, 2), (16, 1)],
  term ((-1826299533158749271644112238775596252 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((-3652599066317498543288224477551192504 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3331881455724356834102120359101141364 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-251736573005731561400984487869369432 : Rat) / 894241638896928502822456059496668245) [(1, 2), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((-503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((503473146011463122801968975738738864 : Rat) / 894241638896928502822456059496668245) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-1644735390099783631223032778048804085412 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 569631923977343456297904509899377672065) [(1, 2), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((-18097062360969442981444274893084752 : Rat) / 10520489869375629444970071288196097) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-822367695049891815611516389024402042706 : Rat) / 1708895771932030368893713529698133016195) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-10498082374957272457041325096534048656 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2159784136890572987213733728886623208 : Rat) / 894241638896928502822456059496668245) [(1, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((5122602770914865578970504424971993088 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (12, 1), (16, 1)],
  term ((-1823965323254377472214428705111366208 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (13, 2), (16, 1)],
  term ((-1599514024359988436427283177651465244 : Rat) / 1251938294455699903951438483295335543) [(1, 2), (6, 1), (14, 1), (16, 1)],
  term ((8119449544546602358389212753204395548 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (6, 1), (14, 2), (16, 1)],
  term ((-1094039640452633956156644099229844736 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (2, 1), (11, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (2, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (2, 1), (15, 1), (16, 1)],
  term ((5860709246175875080768884644221442304 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((3448151169774347508853739058372333504 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (3, 1), (12, 1), (16, 1)],
  term ((2930354623087937540384442322110721152 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (3, 1), (14, 1), (16, 1)],
  term ((2300318678653397742114216892154399136 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (3, 1), (15, 2), (16, 1)],
  term ((8811136794794877745210988756498614981892 : Rat) / 131453520917848489914901040746010232015) [(1, 3), (3, 1), (16, 1)],
  term ((-2188079280905267912313288198459689472 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (4, 1), (11, 1), (16, 1)],
  term ((6984480522041855377390344836652333868 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (5, 1), (16, 1)],
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (6, 1), (7, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (7, 1), (12, 1), (16, 1)],
  term ((-4195886173710171812046148913195591684 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (7, 1), (16, 1)],
  term ((-35247495231618078403584803633592736 : Rat) / 368217145428147030573952495086863395) [(1, 3), (9, 1), (14, 1), (16, 1)],
  term ((593517709551473596819066999499978676598 : Rat) / 11267444650101299135562946349658019887) [(1, 3), (9, 1), (16, 1)],
  term ((-5762647016942077421894277369385358592 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2322600708198757685499136146687124576 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (11, 1), (14, 1), (16, 1)],
  term ((136570363790338833717263830291367232 : Rat) / 1251938294455699903951438483295335543) [(1, 3), (11, 1), (15, 2), (16, 1)],
  term ((-1211025595365370085523615678979528120 : Rat) / 1251938294455699903951438483295335543) [(1, 3), (11, 1), (16, 1)],
  term ((-1003514175713975904870409564228326672 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (12, 1), (13, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-432788241430681288000707781326283322116 : Rat) / 1708895771932030368893713529698133016195) [(1, 3), (12, 1), (15, 1), (16, 1)],
  term ((2549259011638147430179525163327080704 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (13, 1), (14, 1), (16, 1)],
  term ((-4439366844941766824990201453196046752 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (13, 1), (15, 2), (16, 1)],
  term ((-854930674657400678960774100606229209704 : Rat) / 43817840305949496638300346915336744005) [(1, 3), (13, 1), (16, 1)],
  term ((-961246253611453075602719251639060512 : Rat) / 1251938294455699903951438483295335543) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (14, 2), (15, 1), (16, 1)],
  term ((2747798086497582578092301889036536730614 : Rat) / 81375989139620493756843501414196810295) [(1, 3), (15, 1), (16, 1)],
  term ((547019820226316978078322049614922368 : Rat) / 6259691472278499519757192416476677715) [(1, 3), (15, 3), (16, 1)],
  term ((-878196339605601634362442749119471546642 : Rat) / 26290704183569697982980208149202046403) [(1, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 0 through 99. -/
theorem ep_Q2_019_block_09_0000_0099_valid :
    checkProductSumEq ep_Q2_019_partials_09_0000_0099
      ep_Q2_019_block_09_0000_0099 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
