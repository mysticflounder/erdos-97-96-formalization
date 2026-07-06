/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 1:0-70

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 1 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_01_0000_0070 : Poly :=
[
  term (2 : Rat) [(0, 1), (6, 1)],
  term (2 : Rat) [(1, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0000 : Poly :=
[
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (16, 1)]
]

/-- Partial product 0 for generator 1. -/
def ep_Q2_019_partial_01_0000 : Poly :=
[
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 2), (16, 1)],
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 3), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 1. -/
theorem ep_Q2_019_partial_01_0000_valid :
    mulPoly ep_Q2_019_coefficient_01_0000
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0001 : Poly :=
[
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 1 for generator 1. -/
def ep_Q2_019_partial_01_0001 : Poly :=
[
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 3), (9, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 1. -/
theorem ep_Q2_019_partial_01_0001_valid :
    mulPoly ep_Q2_019_coefficient_01_0001
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0002 : Poly :=
[
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 1), (11, 1), (16, 1)]
]

/-- Partial product 2 for generator 1. -/
def ep_Q2_019_partial_01_0002 : Poly :=
[
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 3), (11, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 1. -/
theorem ep_Q2_019_partial_01_0002_valid :
    mulPoly ep_Q2_019_coefficient_01_0002
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0003 : Poly :=
[
  term ((-2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (8, 1), (16, 1)]
]

/-- Partial product 3 for generator 1. -/
def ep_Q2_019_partial_01_0003 : Poly :=
[
  term ((-4591329964483799066958088664871737472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (8, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 2), (8, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (8, 1), (16, 1)],
  term ((-4591329964483799066958088664871737472 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 1. -/
theorem ep_Q2_019_partial_01_0003_valid :
    mulPoly ep_Q2_019_coefficient_01_0003
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0004 : Poly :=
[
  term ((2477336961546806192794815044343146612688 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 1. -/
def ep_Q2_019_partial_01_0004 : Poly :=
[
  term ((4954673923093612385589630088686293225376 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2477336961546806192794815044343146612688 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-2477336961546806192794815044343146612688 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((4954673923093612385589630088686293225376 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 1. -/
theorem ep_Q2_019_partial_01_0004_valid :
    mulPoly ep_Q2_019_coefficient_01_0004
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0005 : Poly :=
[
  term ((-269941717760438282325848741370012160527 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 1. -/
def ep_Q2_019_partial_01_0005 : Poly :=
[
  term ((-539883435520876564651697482740024321054 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((269941717760438282325848741370012160527 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((269941717760438282325848741370012160527 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-539883435520876564651697482740024321054 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 1. -/
theorem ep_Q2_019_partial_01_0005_valid :
    mulPoly ep_Q2_019_coefficient_01_0005
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0006 : Poly :=
[
  term ((-740695090430416417918444581976780902096 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 6 for generator 1. -/
def ep_Q2_019_partial_01_0006 : Poly :=
[
  term ((-1481390180860832835836889163953561804192 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((740695090430416417918444581976780902096 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((740695090430416417918444581976780902096 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-1481390180860832835836889163953561804192 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 1. -/
theorem ep_Q2_019_partial_01_0006_valid :
    mulPoly ep_Q2_019_coefficient_01_0006
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0007 : Poly :=
[
  term ((-585004668200492674139103420796527932748 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 1. -/
def ep_Q2_019_partial_01_0007 : Poly :=
[
  term ((-1170009336400985348278206841593055865496 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((585004668200492674139103420796527932748 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((585004668200492674139103420796527932748 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1170009336400985348278206841593055865496 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 1. -/
theorem ep_Q2_019_partial_01_0007_valid :
    mulPoly ep_Q2_019_coefficient_01_0007
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0008 : Poly :=
[
  term ((-273645914410965655447884004909342560 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (12, 1), (16, 1)]
]

/-- Partial product 8 for generator 1. -/
def ep_Q2_019_partial_01_0008 : Poly :=
[
  term ((-547291828821931310895768009818685120 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((273645914410965655447884004909342560 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((273645914410965655447884004909342560 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((-547291828821931310895768009818685120 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (6, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 1. -/
theorem ep_Q2_019_partial_01_0008_valid :
    mulPoly ep_Q2_019_coefficient_01_0008
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0009 : Poly :=
[
  term ((925922356364715092796291239441190048 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (14, 1), (16, 1)]
]

/-- Partial product 9 for generator 1. -/
def ep_Q2_019_partial_01_0009 : Poly :=
[
  term ((1851844712729430185592582478882380096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-925922356364715092796291239441190048 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((-925922356364715092796291239441190048 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((1851844712729430185592582478882380096 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 1. -/
theorem ep_Q2_019_partial_01_0009_valid :
    mulPoly ep_Q2_019_coefficient_01_0009
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0010 : Poly :=
[
  term ((-61908448690168496525922516565128242368 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (16, 1)]
]

/-- Partial product 10 for generator 1. -/
def ep_Q2_019_partial_01_0010 : Poly :=
[
  term ((-123816897380336993051845033130256484736 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((61908448690168496525922516565128242368 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 2), (16, 1)],
  term ((61908448690168496525922516565128242368 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 2), (16, 1)],
  term ((-123816897380336993051845033130256484736 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 1. -/
theorem ep_Q2_019_partial_01_0010_valid :
    mulPoly ep_Q2_019_coefficient_01_0010
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0011 : Poly :=
[
  term ((5123077547008094110856875805128557216 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (16, 1)]
]

/-- Partial product 11 for generator 1. -/
def ep_Q2_019_partial_01_0011 : Poly :=
[
  term ((10246155094016188221713751610257114432 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-5123077547008094110856875805128557216 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((-5123077547008094110856875805128557216 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 3), (16, 1)],
  term ((10246155094016188221713751610257114432 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 1. -/
theorem ep_Q2_019_partial_01_0011_valid :
    mulPoly ep_Q2_019_coefficient_01_0011
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0012 : Poly :=
[
  term ((-314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (9, 1), (16, 1)]
]

/-- Partial product 12 for generator 1. -/
def ep_Q2_019_partial_01_0012 : Poly :=
[
  term ((-628647974338524830052109404584052587632 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (6, 1), (9, 1), (16, 1)],
  term ((314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-628647974338524830052109404584052587632 : Rat) / 43817840305949496638300346915336744005) [(1, 2), (7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 1. -/
theorem ep_Q2_019_partial_01_0012_valid :
    mulPoly ep_Q2_019_coefficient_01_0012
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0013 : Poly :=
[
  term ((-314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 13 for generator 1. -/
def ep_Q2_019_partial_01_0013 : Poly :=
[
  term ((-628647974338524830052109404584052587632 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-628647974338524830052109404584052587632 : Rat) / 43817840305949496638300346915336744005) [(1, 2), (7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 1. -/
theorem ep_Q2_019_partial_01_0013_valid :
    mulPoly ep_Q2_019_coefficient_01_0013
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0014 : Poly :=
[
  term ((-173044251371515331028678991985504626320 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 14 for generator 1. -/
def ep_Q2_019_partial_01_0014 : Poly :=
[
  term ((-346088502743030662057357983971009252640 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((173044251371515331028678991985504626320 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((173044251371515331028678991985504626320 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-346088502743030662057357983971009252640 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 1. -/
theorem ep_Q2_019_partial_01_0014_valid :
    mulPoly ep_Q2_019_coefficient_01_0014
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0015 : Poly :=
[
  term ((1928492716847934634890559922176997765559 : Rat) / 87635680611898993276600693830673488010) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 15 for generator 1. -/
def ep_Q2_019_partial_01_0015 : Poly :=
[
  term ((1928492716847934634890559922176997765559 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-1928492716847934634890559922176997765559 : Rat) / 87635680611898993276600693830673488010) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-1928492716847934634890559922176997765559 : Rat) / 87635680611898993276600693830673488010) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((1928492716847934634890559922176997765559 : Rat) / 43817840305949496638300346915336744005) [(1, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 1. -/
theorem ep_Q2_019_partial_01_0015_valid :
    mulPoly ep_Q2_019_coefficient_01_0015
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0016 : Poly :=
[
  term ((-220397080933878510499897858328778432 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (16, 1)]
]

/-- Partial product 16 for generator 1. -/
def ep_Q2_019_partial_01_0016 : Poly :=
[
  term ((-440794161867757020999795716657556864 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 2), (16, 1)],
  term ((-440794161867757020999795716657556864 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (6, 1), (7, 1), (16, 1)],
  term ((220397080933878510499897858328778432 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((220397080933878510499897858328778432 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 1. -/
theorem ep_Q2_019_partial_01_0016_valid :
    mulPoly ep_Q2_019_coefficient_01_0016
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0017 : Poly :=
[
  term ((440794161867757020999795716657556864 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (8, 1), (16, 1)]
]

/-- Partial product 17 for generator 1. -/
def ep_Q2_019_partial_01_0017 : Poly :=
[
  term ((881588323735514041999591433315113728 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (8, 1), (16, 1)],
  term ((881588323735514041999591433315113728 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (8, 1), (16, 1)],
  term ((-440794161867757020999795716657556864 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 2), (8, 1), (16, 1)],
  term ((-440794161867757020999795716657556864 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 1. -/
theorem ep_Q2_019_partial_01_0017_valid :
    mulPoly ep_Q2_019_coefficient_01_0017
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0018 : Poly :=
[
  term ((-3296736185381240555706123148380768 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (12, 1), (16, 1)]
]

/-- Partial product 18 for generator 1. -/
def ep_Q2_019_partial_01_0018 : Poly :=
[
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (12, 1), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((3296736185381240555706123148380768 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 2), (12, 1), (16, 1)],
  term ((3296736185381240555706123148380768 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 1. -/
theorem ep_Q2_019_partial_01_0018_valid :
    mulPoly ep_Q2_019_coefficient_01_0018
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0019 : Poly :=
[
  term ((-1647767445179700519698440183427435928 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (14, 1), (16, 1)]
]

/-- Partial product 19 for generator 1. -/
def ep_Q2_019_partial_01_0019 : Poly :=
[
  term ((-3295534890359401039396880366854871856 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-3295534890359401039396880366854871856 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((1647767445179700519698440183427435928 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((1647767445179700519698440183427435928 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 1. -/
theorem ep_Q2_019_partial_01_0019_valid :
    mulPoly ep_Q2_019_coefficient_01_0019
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0020 : Poly :=
[
  term ((120663468106296963328397666328134544 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (16, 1)]
]

/-- Partial product 20 for generator 1. -/
def ep_Q2_019_partial_01_0020 : Poly :=
[
  term ((241326936212593926656795332656269088 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((241326936212593926656795332656269088 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term ((-120663468106296963328397666328134544 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (6, 2), (16, 1)],
  term ((-120663468106296963328397666328134544 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 1. -/
theorem ep_Q2_019_partial_01_0020_valid :
    mulPoly ep_Q2_019_coefficient_01_0020
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0021 : Poly :=
[
  term ((-132490772883867322319946329698450848 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 21 for generator 1. -/
def ep_Q2_019_partial_01_0021 : Poly :=
[
  term ((-264981545767734644639892659396901696 : Rat) / 894241638896928502822456059496668245) [(0, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((-264981545767734644639892659396901696 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((132490772883867322319946329698450848 : Rat) / 894241638896928502822456059496668245) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((132490772883867322319946329698450848 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 1. -/
theorem ep_Q2_019_partial_01_0021_valid :
    mulPoly ep_Q2_019_coefficient_01_0021
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0022 : Poly :=
[
  term ((356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 22 for generator 1. -/
def ep_Q2_019_partial_01_0022 : Poly :=
[
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 1. -/
theorem ep_Q2_019_partial_01_0022_valid :
    mulPoly ep_Q2_019_coefficient_01_0022
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0023 : Poly :=
[
  term ((356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 23 for generator 1. -/
def ep_Q2_019_partial_01_0023 : Poly :=
[
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 1. -/
theorem ep_Q2_019_partial_01_0023_valid :
    mulPoly ep_Q2_019_coefficient_01_0023
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0024 : Poly :=
[
  term ((-162047739609953018928688882123483776 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 24 for generator 1. -/
def ep_Q2_019_partial_01_0024 : Poly :=
[
  term ((-324095479219906037857377764246967552 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((-324095479219906037857377764246967552 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((162047739609953018928688882123483776 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((162047739609953018928688882123483776 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 1. -/
theorem ep_Q2_019_partial_01_0024_valid :
    mulPoly ep_Q2_019_coefficient_01_0024
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0025 : Poly :=
[
  term ((1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 1. -/
def ep_Q2_019_partial_01_0025 : Poly :=
[
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 1. -/
theorem ep_Q2_019_partial_01_0025_valid :
    mulPoly ep_Q2_019_coefficient_01_0025
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0026 : Poly :=
[
  term ((2470422423429655258923427546311717336 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 1. -/
def ep_Q2_019_partial_01_0026 : Poly :=
[
  term ((4940844846859310517846855092623434672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((4940844846859310517846855092623434672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2470422423429655258923427546311717336 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-2470422423429655258923427546311717336 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 1. -/
theorem ep_Q2_019_partial_01_0026_valid :
    mulPoly ep_Q2_019_coefficient_01_0026
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0027 : Poly :=
[
  term ((554108404483483063541482759044235344 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (16, 1)]
]

/-- Partial product 27 for generator 1. -/
def ep_Q2_019_partial_01_0027 : Poly :=
[
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-554108404483483063541482759044235344 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 2), (16, 1)],
  term ((-554108404483483063541482759044235344 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 1. -/
theorem ep_Q2_019_partial_01_0027_valid :
    mulPoly ep_Q2_019_coefficient_01_0027
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0028 : Poly :=
[
  term ((3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 28 for generator 1. -/
def ep_Q2_019_partial_01_0028 : Poly :=
[
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 1. -/
theorem ep_Q2_019_partial_01_0028_valid :
    mulPoly ep_Q2_019_coefficient_01_0028
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0029 : Poly :=
[
  term ((-8954004287488264593105116842049572368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 29 for generator 1. -/
def ep_Q2_019_partial_01_0029 : Poly :=
[
  term ((-17908008574976529186210233684099144736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-17908008574976529186210233684099144736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((8954004287488264593105116842049572368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((8954004287488264593105116842049572368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 1. -/
theorem ep_Q2_019_partial_01_0029_valid :
    mulPoly ep_Q2_019_coefficient_01_0029
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0030 : Poly :=
[
  term ((-1165849748267924466641051096474023392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (8, 1), (16, 1)]
]

/-- Partial product 30 for generator 1. -/
def ep_Q2_019_partial_01_0030 : Poly :=
[
  term ((-2331699496535848933282102192948046784 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 2), (8, 1), (16, 1)],
  term ((-2331699496535848933282102192948046784 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((1165849748267924466641051096474023392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 2), (8, 1), (16, 1)],
  term ((1165849748267924466641051096474023392 : Rat) / 894241638896928502822456059496668245) [(6, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 1. -/
theorem ep_Q2_019_partial_01_0030_valid :
    mulPoly ep_Q2_019_coefficient_01_0030
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0031 : Poly :=
[
  term ((273645914410965655447884004909342560 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (12, 1), (16, 1)]
]

/-- Partial product 31 for generator 1. -/
def ep_Q2_019_partial_01_0031 : Poly :=
[
  term ((547291828821931310895768009818685120 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((547291828821931310895768009818685120 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((-273645914410965655447884004909342560 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (7, 2), (12, 1), (16, 1)],
  term ((-273645914410965655447884004909342560 : Rat) / 1251938294455699903951438483295335543) [(6, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 1. -/
theorem ep_Q2_019_partial_01_0031_valid :
    mulPoly ep_Q2_019_coefficient_01_0031
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0032 : Poly :=
[
  term ((3032293455439915039142730487163046912 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 32 for generator 1. -/
def ep_Q2_019_partial_01_0032 : Poly :=
[
  term ((6064586910879830078285460974326093824 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((6064586910879830078285460974326093824 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((-3032293455439915039142730487163046912 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term ((-3032293455439915039142730487163046912 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 1. -/
theorem ep_Q2_019_partial_01_0032_valid :
    mulPoly ep_Q2_019_coefficient_01_0032
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0033 : Poly :=
[
  term ((2457947165125956676050265279548397764 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (16, 1)]
]

/-- Partial product 33 for generator 1. -/
def ep_Q2_019_partial_01_0033 : Poly :=
[
  term ((4915894330251913352100530559096795528 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 2), (16, 1)],
  term ((4915894330251913352100530559096795528 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-2457947165125956676050265279548397764 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (7, 2), (16, 1)],
  term ((-2457947165125956676050265279548397764 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 1. -/
theorem ep_Q2_019_partial_01_0033_valid :
    mulPoly ep_Q2_019_coefficient_01_0033
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0034 : Poly :=
[
  term ((1753278936688630374936958877275057344 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (16, 1)]
]

/-- Partial product 34 for generator 1. -/
def ep_Q2_019_partial_01_0034 : Poly :=
[
  term ((3506557873377260749873917754550114688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 3), (16, 1)],
  term ((3506557873377260749873917754550114688 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((-1753278936688630374936958877275057344 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (7, 2), (16, 1)],
  term ((-1753278936688630374936958877275057344 : Rat) / 6259691472278499519757192416476677715) [(6, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 1. -/
theorem ep_Q2_019_partial_01_0034_valid :
    mulPoly ep_Q2_019_coefficient_01_0034
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0035 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 35 for generator 1. -/
def ep_Q2_019_partial_01_0035 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 1. -/
theorem ep_Q2_019_partial_01_0035_valid :
    mulPoly ep_Q2_019_coefficient_01_0035
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0036 : Poly :=
[
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 1. -/
def ep_Q2_019_partial_01_0036 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 1. -/
theorem ep_Q2_019_partial_01_0036_valid :
    mulPoly ep_Q2_019_coefficient_01_0036
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0037 : Poly :=
[
  term ((145952693492412688724517373252289661896 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 37 for generator 1. -/
def ep_Q2_019_partial_01_0037 : Poly :=
[
  term ((291905386984825377449034746504579323792 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((291905386984825377449034746504579323792 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((-145952693492412688724517373252289661896 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-145952693492412688724517373252289661896 : Rat) / 43817840305949496638300346915336744005) [(7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 1. -/
theorem ep_Q2_019_partial_01_0037_valid :
    mulPoly ep_Q2_019_coefficient_01_0037
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0038 : Poly :=
[
  term ((96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 38 for generator 1. -/
def ep_Q2_019_partial_01_0038 : Poly :=
[
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 3), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 1. -/
theorem ep_Q2_019_partial_01_0038_valid :
    mulPoly ep_Q2_019_coefficient_01_0038
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0039 : Poly :=
[
  term ((92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 1. -/
def ep_Q2_019_partial_01_0039 : Poly :=
[
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 1. -/
theorem ep_Q2_019_partial_01_0039_valid :
    mulPoly ep_Q2_019_coefficient_01_0039
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0040 : Poly :=
[
  term ((157447466069746186185163437159329595872 : Rat) / 43817840305949496638300346915336744005) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 40 for generator 1. -/
def ep_Q2_019_partial_01_0040 : Poly :=
[
  term ((314894932139492372370326874318659191744 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((314894932139492372370326874318659191744 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((-157447466069746186185163437159329595872 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-157447466069746186185163437159329595872 : Rat) / 43817840305949496638300346915336744005) [(7, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 1. -/
theorem ep_Q2_019_partial_01_0040_valid :
    mulPoly ep_Q2_019_coefficient_01_0040
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0041 : Poly :=
[
  term ((2767989344116862279306515677041581392 : Rat) / 6259691472278499519757192416476677715) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 41 for generator 1. -/
def ep_Q2_019_partial_01_0041 : Poly :=
[
  term ((5535978688233724558613031354083162784 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((5535978688233724558613031354083162784 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-2767989344116862279306515677041581392 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-2767989344116862279306515677041581392 : Rat) / 6259691472278499519757192416476677715) [(7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 1. -/
theorem ep_Q2_019_partial_01_0041_valid :
    mulPoly ep_Q2_019_coefficient_01_0041
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0042 : Poly :=
[
  term ((1753278936688630374936958877275057344 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (16, 1)]
]

/-- Partial product 42 for generator 1. -/
def ep_Q2_019_partial_01_0042 : Poly :=
[
  term ((3506557873377260749873917754550114688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 2), (16, 1)],
  term ((3506557873377260749873917754550114688 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 3), (16, 1)],
  term ((-1753278936688630374936958877275057344 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (7, 2), (16, 1)],
  term ((-1753278936688630374936958877275057344 : Rat) / 6259691472278499519757192416476677715) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 1. -/
theorem ep_Q2_019_partial_01_0042_valid :
    mulPoly ep_Q2_019_coefficient_01_0042
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0043 : Poly :=
[
  term ((-3281803051006710431483519190698544 : Rat) / 368217145428147030573952495086863395) [(8, 1), (12, 1), (16, 1)]
]

/-- Partial product 43 for generator 1. -/
def ep_Q2_019_partial_01_0043 : Poly :=
[
  term ((-6563606102013420862967038381397088 : Rat) / 368217145428147030573952495086863395) [(0, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-6563606102013420862967038381397088 : Rat) / 368217145428147030573952495086863395) [(1, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((3281803051006710431483519190698544 : Rat) / 368217145428147030573952495086863395) [(6, 2), (8, 1), (12, 1), (16, 1)],
  term ((3281803051006710431483519190698544 : Rat) / 368217145428147030573952495086863395) [(7, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 1. -/
theorem ep_Q2_019_partial_01_0043_valid :
    mulPoly ep_Q2_019_coefficient_01_0043
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0044 : Poly :=
[
  term ((-22317265552865975014049949966247523856 : Rat) / 6259691472278499519757192416476677715) [(8, 1), (14, 1), (16, 1)]
]

/-- Partial product 44 for generator 1. -/
def ep_Q2_019_partial_01_0044 : Poly :=
[
  term ((-44634531105731950028099899932495047712 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-44634531105731950028099899932495047712 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((22317265552865975014049949966247523856 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (14, 1), (16, 1)],
  term ((22317265552865975014049949966247523856 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 1. -/
theorem ep_Q2_019_partial_01_0044_valid :
    mulPoly ep_Q2_019_coefficient_01_0044
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0045 : Poly :=
[
  term ((-407410122964366159320067040274258456 : Rat) / 894241638896928502822456059496668245) [(8, 1), (16, 1)]
]

/-- Partial product 45 for generator 1. -/
def ep_Q2_019_partial_01_0045 : Poly :=
[
  term ((-814820245928732318640134080548516912 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((-814820245928732318640134080548516912 : Rat) / 894241638896928502822456059496668245) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((407410122964366159320067040274258456 : Rat) / 894241638896928502822456059496668245) [(6, 2), (8, 1), (16, 1)],
  term ((407410122964366159320067040274258456 : Rat) / 894241638896928502822456059496668245) [(7, 2), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 1. -/
theorem ep_Q2_019_partial_01_0045_valid :
    mulPoly ep_Q2_019_coefficient_01_0045
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0046 : Poly :=
[
  term ((547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(8, 2), (16, 1)]
]

/-- Partial product 46 for generator 1. -/
def ep_Q2_019_partial_01_0046 : Poly :=
[
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(0, 1), (6, 1), (8, 2), (16, 1)],
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(1, 1), (7, 1), (8, 2), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(6, 2), (8, 2), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(7, 2), (8, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 1. -/
theorem ep_Q2_019_partial_01_0046_valid :
    mulPoly ep_Q2_019_coefficient_01_0046
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0047 : Poly :=
[
  term ((-2088258049528381443110660983868350486219 : Rat) / 87635680611898993276600693830673488010) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 47 for generator 1. -/
def ep_Q2_019_partial_01_0047 : Poly :=
[
  term ((-2088258049528381443110660983868350486219 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-2088258049528381443110660983868350486219 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((2088258049528381443110660983868350486219 : Rat) / 87635680611898993276600693830673488010) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((2088258049528381443110660983868350486219 : Rat) / 87635680611898993276600693830673488010) [(7, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 1. -/
theorem ep_Q2_019_partial_01_0047_valid :
    mulPoly ep_Q2_019_coefficient_01_0047
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0048 : Poly :=
[
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 48 for generator 1. -/
def ep_Q2_019_partial_01_0048 : Poly :=
[
  term ((493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 1. -/
theorem ep_Q2_019_partial_01_0048_valid :
    mulPoly ep_Q2_019_coefficient_01_0048
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0049 : Poly :=
[
  term ((260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 49 for generator 1. -/
def ep_Q2_019_partial_01_0049 : Poly :=
[
  term ((521435801273066716425248800165638578752 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((521435801273066716425248800165638578752 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 1. -/
theorem ep_Q2_019_partial_01_0049_valid :
    mulPoly ep_Q2_019_coefficient_01_0049
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0050 : Poly :=
[
  term ((-1876149896611792887896534837524129320808 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 50 for generator 1. -/
def ep_Q2_019_partial_01_0050 : Poly :=
[
  term ((-3752299793223585775793069675048258641616 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3752299793223585775793069675048258641616 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((1876149896611792887896534837524129320808 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((1876149896611792887896534837524129320808 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 1. -/
theorem ep_Q2_019_partial_01_0050_valid :
    mulPoly ep_Q2_019_coefficient_01_0050
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0051 : Poly :=
[
  term ((52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 1. -/
def ep_Q2_019_partial_01_0051 : Poly :=
[
  term ((104027755206586710984699282193043913758 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((104027755206586710984699282193043913758 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 1. -/
theorem ep_Q2_019_partial_01_0051_valid :
    mulPoly ep_Q2_019_coefficient_01_0051
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0052 : Poly :=
[
  term ((2398541996309500233609960180155487929041 : Rat) / 37558148833670997118543154498860066290) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 1. -/
def ep_Q2_019_partial_01_0052 : Poly :=
[
  term ((2398541996309500233609960180155487929041 : Rat) / 18779074416835498559271577249430033145) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((2398541996309500233609960180155487929041 : Rat) / 18779074416835498559271577249430033145) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-2398541996309500233609960180155487929041 : Rat) / 37558148833670997118543154498860066290) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-2398541996309500233609960180155487929041 : Rat) / 37558148833670997118543154498860066290) [(7, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 1. -/
theorem ep_Q2_019_partial_01_0052_valid :
    mulPoly ep_Q2_019_coefficient_01_0052
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0053 : Poly :=
[
  term ((118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(9, 2), (16, 1)]
]

/-- Partial product 53 for generator 1. -/
def ep_Q2_019_partial_01_0053 : Poly :=
[
  term ((237009172048170076758685543154634976 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((237009172048170076758685543154634976 : Rat) / 894241638896928502822456059496668245) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((-118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(6, 2), (9, 2), (16, 1)],
  term ((-118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(7, 2), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 1. -/
theorem ep_Q2_019_partial_01_0053_valid :
    mulPoly ep_Q2_019_coefficient_01_0053
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0054 : Poly :=
[
  term ((246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 1. -/
def ep_Q2_019_partial_01_0054 : Poly :=
[
  term ((493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 1. -/
theorem ep_Q2_019_partial_01_0054_valid :
    mulPoly ep_Q2_019_coefficient_01_0054
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0055 : Poly :=
[
  term ((-27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 55 for generator 1. -/
def ep_Q2_019_partial_01_0055 : Poly :=
[
  term ((-55773508556182048167958639158372038528 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55773508556182048167958639158372038528 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 1. -/
theorem ep_Q2_019_partial_01_0055_valid :
    mulPoly ep_Q2_019_coefficient_01_0055
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0056 : Poly :=
[
  term ((135600494537339406871290192603610361076 : Rat) / 43817840305949496638300346915336744005) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 56 for generator 1. -/
def ep_Q2_019_partial_01_0056 : Poly :=
[
  term ((271200989074678813742580385207220722152 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((271200989074678813742580385207220722152 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-135600494537339406871290192603610361076 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-135600494537339406871290192603610361076 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 1. -/
theorem ep_Q2_019_partial_01_0056_valid :
    mulPoly ep_Q2_019_coefficient_01_0056
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0057 : Poly :=
[
  term ((-191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 1. -/
def ep_Q2_019_partial_01_0057 : Poly :=
[
  term ((-382450452465542708884286906058191814046 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-382450452465542708884286906058191814046 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 1. -/
theorem ep_Q2_019_partial_01_0057_valid :
    mulPoly ep_Q2_019_coefficient_01_0057
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0058 : Poly :=
[
  term ((-22161058627123058387833128542207041072243 : Rat) / 262907041835696979829802081492020464030) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 1. -/
def ep_Q2_019_partial_01_0058 : Poly :=
[
  term ((-22161058627123058387833128542207041072243 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-22161058627123058387833128542207041072243 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((22161058627123058387833128542207041072243 : Rat) / 262907041835696979829802081492020464030) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((22161058627123058387833128542207041072243 : Rat) / 262907041835696979829802081492020464030) [(7, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 1. -/
theorem ep_Q2_019_partial_01_0058_valid :
    mulPoly ep_Q2_019_coefficient_01_0058
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0059 : Poly :=
[
  term ((2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(11, 2), (16, 1)]
]

/-- Partial product 59 for generator 1. -/
def ep_Q2_019_partial_01_0059 : Poly :=
[
  term ((2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(6, 2), (11, 2), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(7, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 1. -/
theorem ep_Q2_019_partial_01_0059_valid :
    mulPoly ep_Q2_019_coefficient_01_0059
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0060 : Poly :=
[
  term ((504210159860186982174735542851165663092 : Rat) / 43817840305949496638300346915336744005) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 60 for generator 1. -/
def ep_Q2_019_partial_01_0060 : Poly :=
[
  term ((1008420319720373964349471085702331326184 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((1008420319720373964349471085702331326184 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-504210159860186982174735542851165663092 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((-504210159860186982174735542851165663092 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 1. -/
theorem ep_Q2_019_partial_01_0060_valid :
    mulPoly ep_Q2_019_coefficient_01_0060
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0061 : Poly :=
[
  term ((-3996150007939018201734521549484804438 : Rat) / 1184265954214851260494603970684776865) [(12, 1), (16, 1)]
]

/-- Partial product 61 for generator 1. -/
def ep_Q2_019_partial_01_0061 : Poly :=
[
  term ((-7992300015878036403469043098969608876 : Rat) / 1184265954214851260494603970684776865) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-7992300015878036403469043098969608876 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((3996150007939018201734521549484804438 : Rat) / 1184265954214851260494603970684776865) [(6, 2), (12, 1), (16, 1)],
  term ((3996150007939018201734521549484804438 : Rat) / 1184265954214851260494603970684776865) [(7, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 1. -/
theorem ep_Q2_019_partial_01_0061_valid :
    mulPoly ep_Q2_019_coefficient_01_0061
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0062 : Poly :=
[
  term ((-1011452465606659987266462803158474296 : Rat) / 894241638896928502822456059496668245) [(12, 2), (16, 1)]
]

/-- Partial product 62 for generator 1. -/
def ep_Q2_019_partial_01_0062 : Poly :=
[
  term ((-2022904931213319974532925606316948592 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((-2022904931213319974532925606316948592 : Rat) / 894241638896928502822456059496668245) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((1011452465606659987266462803158474296 : Rat) / 894241638896928502822456059496668245) [(6, 2), (12, 2), (16, 1)],
  term ((1011452465606659987266462803158474296 : Rat) / 894241638896928502822456059496668245) [(7, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 1. -/
theorem ep_Q2_019_partial_01_0062_valid :
    mulPoly ep_Q2_019_coefficient_01_0062
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0063 : Poly :=
[
  term ((-65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 1. -/
def ep_Q2_019_partial_01_0063 : Poly :=
[
  term ((-130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 1. -/
theorem ep_Q2_019_partial_01_0063_valid :
    mulPoly ep_Q2_019_coefficient_01_0063
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0064 : Poly :=
[
  term ((-854955871076708261538019074556812640136 : Rat) / 43817840305949496638300346915336744005) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 64 for generator 1. -/
def ep_Q2_019_partial_01_0064 : Poly :=
[
  term ((-1709911742153416523076038149113625280272 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1709911742153416523076038149113625280272 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((854955871076708261538019074556812640136 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((854955871076708261538019074556812640136 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 1. -/
theorem ep_Q2_019_partial_01_0064_valid :
    mulPoly ep_Q2_019_coefficient_01_0064
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0065 : Poly :=
[
  term ((-1011452465606659987266462803158474296 : Rat) / 894241638896928502822456059496668245) [(13, 2), (16, 1)]
]

/-- Partial product 65 for generator 1. -/
def ep_Q2_019_partial_01_0065 : Poly :=
[
  term ((-2022904931213319974532925606316948592 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((-2022904931213319974532925606316948592 : Rat) / 894241638896928502822456059496668245) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((1011452465606659987266462803158474296 : Rat) / 894241638896928502822456059496668245) [(6, 2), (13, 2), (16, 1)],
  term ((1011452465606659987266462803158474296 : Rat) / 894241638896928502822456059496668245) [(7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 1. -/
theorem ep_Q2_019_partial_01_0065_valid :
    mulPoly ep_Q2_019_coefficient_01_0065
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0066 : Poly :=
[
  term ((318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 66 for generator 1. -/
def ep_Q2_019_partial_01_0066 : Poly :=
[
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 1. -/
theorem ep_Q2_019_partial_01_0066_valid :
    mulPoly ep_Q2_019_coefficient_01_0066
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0067 : Poly :=
[
  term ((-93418434576705981027166056545907559921 : Rat) / 1421119145057821512593524764821732238) [(14, 1), (16, 1)]
]

/-- Partial product 67 for generator 1. -/
def ep_Q2_019_partial_01_0067 : Poly :=
[
  term ((-93418434576705981027166056545907559921 : Rat) / 710559572528910756296762382410866119) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((-93418434576705981027166056545907559921 : Rat) / 710559572528910756296762382410866119) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((93418434576705981027166056545907559921 : Rat) / 1421119145057821512593524764821732238) [(6, 2), (14, 1), (16, 1)],
  term ((93418434576705981027166056545907559921 : Rat) / 1421119145057821512593524764821732238) [(7, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 1. -/
theorem ep_Q2_019_partial_01_0067_valid :
    mulPoly ep_Q2_019_coefficient_01_0067
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0068 : Poly :=
[
  term ((3804386277865922140322242474105915334413 : Rat) / 131453520917848489914901040746010232015) [(14, 2), (16, 1)]
]

/-- Partial product 68 for generator 1. -/
def ep_Q2_019_partial_01_0068 : Poly :=
[
  term ((7608772555731844280644484948211830668826 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((7608772555731844280644484948211830668826 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((-3804386277865922140322242474105915334413 : Rat) / 131453520917848489914901040746010232015) [(6, 2), (14, 2), (16, 1)],
  term ((-3804386277865922140322242474105915334413 : Rat) / 131453520917848489914901040746010232015) [(7, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 1. -/
theorem ep_Q2_019_partial_01_0068_valid :
    mulPoly ep_Q2_019_coefficient_01_0068
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0069 : Poly :=
[
  term ((-139832564677843056148128857937691605104 : Rat) / 43817840305949496638300346915336744005) [(15, 2), (16, 1)]
]

/-- Partial product 69 for generator 1. -/
def ep_Q2_019_partial_01_0069 : Poly :=
[
  term ((-279665129355686112296257715875383210208 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((-279665129355686112296257715875383210208 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((139832564677843056148128857937691605104 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (15, 2), (16, 1)],
  term ((139832564677843056148128857937691605104 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 1. -/
theorem ep_Q2_019_partial_01_0069_valid :
    mulPoly ep_Q2_019_coefficient_01_0069
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 1. -/
def ep_Q2_019_coefficient_01_0070 : Poly :=
[
  term ((9654296232971979755527421942183574184551 : Rat) / 701085444895191946212805550645387904080) [(16, 1)]
]

/-- Partial product 70 for generator 1. -/
def ep_Q2_019_partial_01_0070 : Poly :=
[
  term ((9654296232971979755527421942183574184551 : Rat) / 350542722447595973106402775322693952040) [(0, 1), (6, 1), (16, 1)],
  term ((9654296232971979755527421942183574184551 : Rat) / 350542722447595973106402775322693952040) [(1, 1), (7, 1), (16, 1)],
  term ((-9654296232971979755527421942183574184551 : Rat) / 701085444895191946212805550645387904080) [(6, 2), (16, 1)],
  term ((-9654296232971979755527421942183574184551 : Rat) / 701085444895191946212805550645387904080) [(7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 1. -/
theorem ep_Q2_019_partial_01_0070_valid :
    mulPoly ep_Q2_019_coefficient_01_0070
        ep_Q2_019_generator_01_0000_0070 =
      ep_Q2_019_partial_01_0070 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_01_0000_0070 : List Poly :=
[
  ep_Q2_019_partial_01_0000,
  ep_Q2_019_partial_01_0001,
  ep_Q2_019_partial_01_0002,
  ep_Q2_019_partial_01_0003,
  ep_Q2_019_partial_01_0004,
  ep_Q2_019_partial_01_0005,
  ep_Q2_019_partial_01_0006,
  ep_Q2_019_partial_01_0007,
  ep_Q2_019_partial_01_0008,
  ep_Q2_019_partial_01_0009,
  ep_Q2_019_partial_01_0010,
  ep_Q2_019_partial_01_0011,
  ep_Q2_019_partial_01_0012,
  ep_Q2_019_partial_01_0013,
  ep_Q2_019_partial_01_0014,
  ep_Q2_019_partial_01_0015,
  ep_Q2_019_partial_01_0016,
  ep_Q2_019_partial_01_0017,
  ep_Q2_019_partial_01_0018,
  ep_Q2_019_partial_01_0019,
  ep_Q2_019_partial_01_0020,
  ep_Q2_019_partial_01_0021,
  ep_Q2_019_partial_01_0022,
  ep_Q2_019_partial_01_0023,
  ep_Q2_019_partial_01_0024,
  ep_Q2_019_partial_01_0025,
  ep_Q2_019_partial_01_0026,
  ep_Q2_019_partial_01_0027,
  ep_Q2_019_partial_01_0028,
  ep_Q2_019_partial_01_0029,
  ep_Q2_019_partial_01_0030,
  ep_Q2_019_partial_01_0031,
  ep_Q2_019_partial_01_0032,
  ep_Q2_019_partial_01_0033,
  ep_Q2_019_partial_01_0034,
  ep_Q2_019_partial_01_0035,
  ep_Q2_019_partial_01_0036,
  ep_Q2_019_partial_01_0037,
  ep_Q2_019_partial_01_0038,
  ep_Q2_019_partial_01_0039,
  ep_Q2_019_partial_01_0040,
  ep_Q2_019_partial_01_0041,
  ep_Q2_019_partial_01_0042,
  ep_Q2_019_partial_01_0043,
  ep_Q2_019_partial_01_0044,
  ep_Q2_019_partial_01_0045,
  ep_Q2_019_partial_01_0046,
  ep_Q2_019_partial_01_0047,
  ep_Q2_019_partial_01_0048,
  ep_Q2_019_partial_01_0049,
  ep_Q2_019_partial_01_0050,
  ep_Q2_019_partial_01_0051,
  ep_Q2_019_partial_01_0052,
  ep_Q2_019_partial_01_0053,
  ep_Q2_019_partial_01_0054,
  ep_Q2_019_partial_01_0055,
  ep_Q2_019_partial_01_0056,
  ep_Q2_019_partial_01_0057,
  ep_Q2_019_partial_01_0058,
  ep_Q2_019_partial_01_0059,
  ep_Q2_019_partial_01_0060,
  ep_Q2_019_partial_01_0061,
  ep_Q2_019_partial_01_0062,
  ep_Q2_019_partial_01_0063,
  ep_Q2_019_partial_01_0064,
  ep_Q2_019_partial_01_0065,
  ep_Q2_019_partial_01_0066,
  ep_Q2_019_partial_01_0067,
  ep_Q2_019_partial_01_0068,
  ep_Q2_019_partial_01_0069,
  ep_Q2_019_partial_01_0070
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_01_0000_0070 : Poly :=
[
  term ((1791688582322583965027542277527569024 : Rat) / 894241638896928502822456059496668245) [(0, 1), (1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-628647974338524830052109404584052587632 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (6, 1), (9, 1), (16, 1)],
  term ((-628647974338524830052109404584052587632 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-346088502743030662057357983971009252640 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (6, 1), (13, 1), (16, 1)],
  term ((1928492716847934634890559922176997765559 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-4591329964483799066958088664871737472 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (8, 1), (16, 1)],
  term ((4954673923093612385589630088686293225376 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-539883435520876564651697482740024321054 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1481390180860832835836889163953561804192 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1170009336400985348278206841593055865496 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-547291828821931310895768009818685120 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (1, 1), (7, 1), (12, 1), (16, 1)],
  term ((1851844712729430185592582478882380096 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 1), (14, 1), (16, 1)],
  term ((-123816897380336993051845033130256484736 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (1, 1), (7, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 2), (9, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (1, 1), (7, 2), (11, 1), (16, 1)],
  term ((881588323735514041999591433315113728 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (8, 1), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (12, 1), (16, 1)],
  term ((-3295534890359401039396880366854871856 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 1), (14, 1), (16, 1)],
  term ((241326936212593926656795332656269088 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (2, 1), (6, 1), (16, 1)],
  term ((-440794161867757020999795716657556864 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (2, 1), (6, 2), (16, 1)],
  term ((-264981545767734644639892659396901696 : Rat) / 894241638896928502822456059496668245) [(0, 1), (3, 1), (6, 1), (7, 1), (16, 1)],
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (9, 1), (16, 1)],
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (11, 1), (16, 1)],
  term ((-324095479219906037857377764246967552 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (13, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((4940844846859310517846855092623434672 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (3, 1), (6, 1), (15, 1), (16, 1)],
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (4, 1), (6, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-17908008574976529186210233684099144736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((291905386984825377449034746504579323792 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((314894932139492372370326874318659191744 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((5535978688233724558613031354083162784 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((471745076451262196626879117666436064 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (6, 1), (7, 2), (16, 1)],
  term ((-6563606102013420862967038381397088 : Rat) / 368217145428147030573952495086863395) [(0, 1), (6, 1), (8, 1), (12, 1), (16, 1)],
  term ((-44634531105731950028099899932495047712 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-814820245928732318640134080548516912 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (8, 1), (16, 1)],
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(0, 1), (6, 1), (8, 2), (16, 1)],
  term ((-2088258049528381443110660983868350486219 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((521435801273066716425248800165638578752 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3752299793223585775793069675048258641616 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((104027755206586710984699282193043913758 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2398541996309500233609960180155487929041 : Rat) / 18779074416835498559271577249430033145) [(0, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((237009172048170076758685543154634976 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (9, 2), (16, 1)],
  term ((493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-55773508556182048167958639158372038528 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((271200989074678813742580385207220722152 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-382450452465542708884286906058191814046 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22161058627123058387833128542207041072243 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(0, 1), (6, 1), (11, 2), (16, 1)],
  term ((1008420319720373964349471085702331326184 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7992300015878036403469043098969608876 : Rat) / 1184265954214851260494603970684776865) [(0, 1), (6, 1), (12, 1), (16, 1)],
  term ((-2022904931213319974532925606316948592 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (12, 2), (16, 1)],
  term ((-130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1709911742153416523076038149113625280272 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2022904931213319974532925606316948592 : Rat) / 894241638896928502822456059496668245) [(0, 1), (6, 1), (13, 2), (16, 1)],
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(0, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-93418434576705981027166056545907559921 : Rat) / 710559572528910756296762382410866119) [(0, 1), (6, 1), (14, 1), (16, 1)],
  term ((7608772555731844280644484948211830668826 : Rat) / 131453520917848489914901040746010232015) [(0, 1), (6, 1), (14, 2), (16, 1)],
  term ((-279665129355686112296257715875383210208 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 1), (15, 2), (16, 1)],
  term ((9654296232971979755527421942183574184551 : Rat) / 350542722447595973106402775322693952040) [(0, 1), (6, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-14026231493509042999495671018200458752 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 2), (8, 1), (16, 1)],
  term ((-2477336961546806192794815044343146612688 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((269941717760438282325848741370012160527 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((740695090430416417918444581976780902096 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((585004668200492674139103420796527932748 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((820937743232896966343652014728027680 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (6, 2), (12, 1), (16, 1)],
  term ((5138664554515114985489169734884903776 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (6, 2), (14, 1), (16, 1)],
  term ((343953503762605876094316296739318780536 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (6, 2), (16, 1)],
  term ((471745076451262196626879117666436064 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (6, 3), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (8, 1), (16, 1)],
  term ((-2477336961546806192794815044343146612688 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((269941717760438282325848741370012160527 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((740695090430416417918444581976780902096 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((585004668200492674139103420796527932748 : Rat) / 43817840305949496638300346915336744005) [(0, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((273645914410965655447884004909342560 : Rat) / 1251938294455699903951438483295335543) [(0, 1), (7, 2), (12, 1), (16, 1)],
  term ((-925922356364715092796291239441190048 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 2), (14, 1), (16, 1)],
  term ((61908448690168496525922516565128242368 : Rat) / 8763568061189899327660069383067348801) [(0, 1), (7, 2), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 3), (9, 1), (16, 1)],
  term ((-7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(0, 1), (7, 3), (11, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((15900980223548577376469414555642491392 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((-4591329964483799066958088664871737472 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (8, 1), (16, 1)],
  term ((4954673923093612385589630088686293225376 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-539883435520876564651697482740024321054 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-1481390180860832835836889163953561804192 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1170009336400985348278206841593055865496 : Rat) / 43817840305949496638300346915336744005) [(0, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-547291828821931310895768009818685120 : Rat) / 1251938294455699903951438483295335543) [(0, 2), (6, 1), (12, 1), (16, 1)],
  term ((1851844712729430185592582478882380096 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 1), (14, 1), (16, 1)],
  term ((-123816897380336993051845033130256484736 : Rat) / 8763568061189899327660069383067348801) [(0, 2), (6, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(0, 2), (6, 2), (16, 1)],
  term ((-440794161867757020999795716657556864 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (6, 1), (7, 1), (16, 1)],
  term ((881588323735514041999591433315113728 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (8, 1), (16, 1)],
  term ((-6593472370762481111412246296761536 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (12, 1), (16, 1)],
  term ((-3295534890359401039396880366854871856 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (2, 1), (7, 1), (14, 1), (16, 1)],
  term ((241326936212593926656795332656269088 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (2, 1), (7, 1), (16, 1)],
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (9, 1), (16, 1)],
  term ((713710162656664293592617851508680832 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (11, 1), (16, 1)],
  term ((-324095479219906037857377764246967552 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (13, 1), (16, 1)],
  term ((2295664982241899533479044332435868736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4940844846859310517846855092623434672 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-264981545767734644639892659396901696 : Rat) / 894241638896928502822456059496668245) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((1108216808966966127082965518088470688 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (4, 1), (7, 1), (16, 1)],
  term ((-17908008574976529186210233684099144736 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((7950490111774288688234707277821245696 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((-2331699496535848933282102192948046784 : Rat) / 894241638896928502822456059496668245) [(1, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((547291828821931310895768009818685120 : Rat) / 1251938294455699903951438483295335543) [(1, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((6064586910879830078285460974326093824 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((4915894330251913352100530559096795528 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 1), (7, 1), (16, 1)],
  term ((-1616519673630833360982958050578442528 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (6, 2), (7, 1), (16, 1)],
  term ((314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((314323987169262415026054702292026293816 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (6, 2), (11, 1), (16, 1)],
  term ((173044251371515331028678991985504626320 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-1928492716847934634890559922176997765559 : Rat) / 87635680611898993276600693830673488010) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-6563606102013420862967038381397088 : Rat) / 368217145428147030573952495086863395) [(1, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((-44634531105731950028099899932495047712 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((-814820245928732318640134080548516912 : Rat) / 894241638896928502822456059496668245) [(1, 1), (7, 1), (8, 1), (16, 1)],
  term ((1095150673999578945085515275474835072 : Rat) / 368217145428147030573952495086863395) [(1, 1), (7, 1), (8, 2), (16, 1)],
  term ((-2088258049528381443110660983868350486219 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((521435801273066716425248800165638578752 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3752299793223585775793069675048258641616 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((104027755206586710984699282193043913758 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2398541996309500233609960180155487929041 : Rat) / 18779074416835498559271577249430033145) [(1, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((237009172048170076758685543154634976 : Rat) / 894241638896928502822456059496668245) [(1, 1), (7, 1), (9, 2), (16, 1)],
  term ((493197837995173606088976322806681710244 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-55773508556182048167958639158372038528 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((271200989074678813742580385207220722152 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-382450452465542708884286906058191814046 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22161058627123058387833128542207041072243 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((2084860018144044374909234235205639917647 : Rat) / 262907041835696979829802081492020464030) [(1, 1), (7, 1), (11, 2), (16, 1)],
  term ((1008420319720373964349471085702331326184 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (12, 1), (14, 1), (16, 1)],
  term ((-7992300015878036403469043098969608876 : Rat) / 1184265954214851260494603970684776865) [(1, 1), (7, 1), (12, 1), (16, 1)],
  term ((-2022904931213319974532925606316948592 : Rat) / 894241638896928502822456059496668245) [(1, 1), (7, 1), (12, 2), (16, 1)],
  term ((-130908756925170431561912565878046912 : Rat) / 178848327779385700564491211899333649) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1709911742153416523076038149113625280272 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2022904931213319974532925606316948592 : Rat) / 894241638896928502822456059496668245) [(1, 1), (7, 1), (13, 2), (16, 1)],
  term ((637784363252502464864225512791903744 : Rat) / 368217145428147030573952495086863395) [(1, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-93418434576705981027166056545907559921 : Rat) / 710559572528910756296762382410866119) [(1, 1), (7, 1), (14, 1), (16, 1)],
  term ((7608772555731844280644484948211830668826 : Rat) / 131453520917848489914901040746010232015) [(1, 1), (7, 1), (14, 2), (16, 1)],
  term ((-279665129355686112296257715875383210208 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 1), (15, 2), (16, 1)],
  term ((9654296232971979755527421942183574184551 : Rat) / 350542722447595973106402775322693952040) [(1, 1), (7, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 2), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((606229374154087792475089448796605617608 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 2), (9, 1), (16, 1)],
  term ((192403103276416254864402479774670205760 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 2), (9, 2), (13, 1), (16, 1)],
  term ((185412061497692378211647174973359107472 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((125843783861750957479276315322137097112 : Rat) / 8763568061189899327660069383067348801) [(1, 1), (7, 2), (11, 1), (16, 1)],
  term ((903973107675212727053686179406105271088 : Rat) / 43817840305949496638300346915336744005) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-1928492716847934634890559922176997765559 : Rat) / 87635680611898993276600693830673488010) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((-1616519673630833360982958050578442528 : Rat) / 6259691472278499519757192416476677715) [(1, 1), (7, 3), (16, 1)],
  term ((-628647974338524830052109404584052587632 : Rat) / 43817840305949496638300346915336744005) [(1, 2), (7, 1), (9, 1), (16, 1)],
  term ((-628647974338524830052109404584052587632 : Rat) / 43817840305949496638300346915336744005) [(1, 2), (7, 1), (11, 1), (16, 1)],
  term ((-346088502743030662057357983971009252640 : Rat) / 8763568061189899327660069383067348801) [(1, 2), (7, 1), (13, 1), (16, 1)],
  term ((1928492716847934634890559922176997765559 : Rat) / 43817840305949496638300346915336744005) [(1, 2), (7, 1), (15, 1), (16, 1)],
  term ((10246155094016188221713751610257114432 : Rat) / 6259691472278499519757192416476677715) [(1, 2), (7, 2), (16, 1)],
  term ((220397080933878510499897858328778432 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 1), (7, 2), (16, 1)],
  term ((-440794161867757020999795716657556864 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 2), (8, 1), (16, 1)],
  term ((3296736185381240555706123148380768 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 2), (12, 1), (16, 1)],
  term ((1647767445179700519698440183427435928 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 2), (14, 1), (16, 1)],
  term ((-120663468106296963328397666328134544 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (6, 2), (16, 1)],
  term ((220397080933878510499897858328778432 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (6, 3), (16, 1)],
  term ((-440794161867757020999795716657556864 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 2), (8, 1), (16, 1)],
  term ((3296736185381240555706123148380768 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 2), (12, 1), (16, 1)],
  term ((1647767445179700519698440183427435928 : Rat) / 6259691472278499519757192416476677715) [(2, 1), (7, 2), (14, 1), (16, 1)],
  term ((-120663468106296963328397666328134544 : Rat) / 1251938294455699903951438483295335543) [(2, 1), (7, 2), (16, 1)],
  term ((132490772883867322319946329698450848 : Rat) / 894241638896928502822456059496668245) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((162047739609953018928688882123483776 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2470422423429655258923427546311717336 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((-356855081328332146796308925754340416 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((162047739609953018928688882123483776 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((-1147832491120949766739522166217934368 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2470422423429655258923427546311717336 : Rat) / 6259691472278499519757192416476677715) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((132490772883867322319946329698450848 : Rat) / 894241638896928502822456059496668245) [(3, 1), (7, 3), (16, 1)],
  term ((-554108404483483063541482759044235344 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (6, 2), (16, 1)],
  term ((-554108404483483063541482759044235344 : Rat) / 6259691472278499519757192416476677715) [(4, 1), (7, 2), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 2), (7, 1), (16, 1)],
  term ((8954004287488264593105116842049572368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (6, 2), (13, 1), (16, 1)],
  term ((8954004287488264593105116842049572368 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-3975245055887144344117353638910622848 : Rat) / 6259691472278499519757192416476677715) [(5, 1), (7, 3), (16, 1)],
  term ((1165849748267924466641051096474023392 : Rat) / 894241638896928502822456059496668245) [(6, 1), (7, 2), (8, 1), (16, 1)],
  term ((-273645914410965655447884004909342560 : Rat) / 1251938294455699903951438483295335543) [(6, 1), (7, 2), (12, 1), (16, 1)],
  term ((-3032293455439915039142730487163046912 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (7, 2), (14, 1), (16, 1)],
  term ((-2457947165125956676050265279548397764 : Rat) / 6259691472278499519757192416476677715) [(6, 1), (7, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-145952693492412688724517373252289661896 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-157447466069746186185163437159329595872 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (7, 1), (11, 1), (16, 1)],
  term ((-2767989344116862279306515677041581392 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-3506557873377260749873917754550114688 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (7, 2), (16, 1)],
  term ((3281803051006710431483519190698544 : Rat) / 368217145428147030573952495086863395) [(6, 2), (8, 1), (12, 1), (16, 1)],
  term ((22317265552865975014049949966247523856 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (8, 1), (14, 1), (16, 1)],
  term ((407410122964366159320067040274258456 : Rat) / 894241638896928502822456059496668245) [(6, 2), (8, 1), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(6, 2), (8, 2), (16, 1)],
  term ((2088258049528381443110660983868350486219 : Rat) / 87635680611898993276600693830673488010) [(6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1876149896611792887896534837524129320808 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2398541996309500233609960180155487929041 : Rat) / 37558148833670997118543154498860066290) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(6, 2), (9, 2), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(6, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-135600494537339406871290192603610361076 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (11, 1), (13, 1), (16, 1)],
  term ((191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(6, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((22161058627123058387833128542207041072243 : Rat) / 262907041835696979829802081492020464030) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(6, 2), (11, 2), (16, 1)],
  term ((-504210159860186982174735542851165663092 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (12, 1), (14, 1), (16, 1)],
  term ((3996150007939018201734521549484804438 : Rat) / 1184265954214851260494603970684776865) [(6, 2), (12, 1), (16, 1)],
  term ((1011452465606659987266462803158474296 : Rat) / 894241638896928502822456059496668245) [(6, 2), (12, 2), (16, 1)],
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((854955871076708261538019074556812640136 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((1011452465606659987266462803158474296 : Rat) / 894241638896928502822456059496668245) [(6, 2), (13, 2), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((93418434576705981027166056545907559921 : Rat) / 1421119145057821512593524764821732238) [(6, 2), (14, 1), (16, 1)],
  term ((-3804386277865922140322242474105915334413 : Rat) / 131453520917848489914901040746010232015) [(6, 2), (14, 2), (16, 1)],
  term ((139832564677843056148128857937691605104 : Rat) / 43817840305949496638300346915336744005) [(6, 2), (15, 2), (16, 1)],
  term ((-9654296232971979755527421942183574184551 : Rat) / 701085444895191946212805550645387904080) [(6, 2), (16, 1)],
  term ((1165849748267924466641051096474023392 : Rat) / 894241638896928502822456059496668245) [(6, 3), (8, 1), (16, 1)],
  term ((-273645914410965655447884004909342560 : Rat) / 1251938294455699903951438483295335543) [(6, 3), (12, 1), (16, 1)],
  term ((-3032293455439915039142730487163046912 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (14, 1), (16, 1)],
  term ((-2457947165125956676050265279548397764 : Rat) / 6259691472278499519757192416476677715) [(6, 3), (16, 1)],
  term ((-1753278936688630374936958877275057344 : Rat) / 6259691472278499519757192416476677715) [(6, 4), (16, 1)],
  term ((3281803051006710431483519190698544 : Rat) / 368217145428147030573952495086863395) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((22317265552865975014049949966247523856 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (8, 1), (14, 1), (16, 1)],
  term ((407410122964366159320067040274258456 : Rat) / 894241638896928502822456059496668245) [(7, 2), (8, 1), (16, 1)],
  term ((-547575336999789472542757637737417536 : Rat) / 368217145428147030573952495086863395) [(7, 2), (8, 2), (16, 1)],
  term ((2088258049528381443110660983868350486219 : Rat) / 87635680611898993276600693830673488010) [(7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-260717900636533358212624400082819289376 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1876149896611792887896534837524129320808 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (9, 1), (13, 1), (16, 1)],
  term ((-52013877603293355492349641096521956879 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2398541996309500233609960180155487929041 : Rat) / 37558148833670997118543154498860066290) [(7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-118504586024085038379342771577317488 : Rat) / 894241638896928502822456059496668245) [(7, 2), (9, 2), (16, 1)],
  term ((-246598918997586803044488161403340855122 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((27886754278091024083979319579186019264 : Rat) / 8763568061189899327660069383067348801) [(7, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-135600494537339406871290192603610361076 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (11, 1), (13, 1), (16, 1)],
  term ((191225226232771354442143453029095907023 : Rat) / 6259691472278499519757192416476677715) [(7, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((22161058627123058387833128542207041072243 : Rat) / 262907041835696979829802081492020464030) [(7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-2084860018144044374909234235205639917647 : Rat) / 525814083671393959659604162984040928060) [(7, 2), (11, 2), (16, 1)],
  term ((-504210159860186982174735542851165663092 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (12, 1), (14, 1), (16, 1)],
  term ((3996150007939018201734521549484804438 : Rat) / 1184265954214851260494603970684776865) [(7, 2), (12, 1), (16, 1)],
  term ((1011452465606659987266462803158474296 : Rat) / 894241638896928502822456059496668245) [(7, 2), (12, 2), (16, 1)],
  term ((65454378462585215780956282939023456 : Rat) / 178848327779385700564491211899333649) [(7, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((854955871076708261538019074556812640136 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (13, 1), (15, 1), (16, 1)],
  term ((1011452465606659987266462803158474296 : Rat) / 894241638896928502822456059496668245) [(7, 2), (13, 2), (16, 1)],
  term ((-318892181626251232432112756395951872 : Rat) / 368217145428147030573952495086863395) [(7, 2), (14, 1), (15, 2), (16, 1)],
  term ((93418434576705981027166056545907559921 : Rat) / 1421119145057821512593524764821732238) [(7, 2), (14, 1), (16, 1)],
  term ((-3804386277865922140322242474105915334413 : Rat) / 131453520917848489914901040746010232015) [(7, 2), (14, 2), (16, 1)],
  term ((139832564677843056148128857937691605104 : Rat) / 43817840305949496638300346915336744005) [(7, 2), (15, 2), (16, 1)],
  term ((-9654296232971979755527421942183574184551 : Rat) / 701085444895191946212805550645387904080) [(7, 2), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 3), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-145952693492412688724517373252289661896 : Rat) / 43817840305949496638300346915336744005) [(7, 3), (9, 1), (16, 1)],
  term ((-96201551638208127432201239887335102880 : Rat) / 8763568061189899327660069383067348801) [(7, 3), (9, 2), (13, 1), (16, 1)],
  term ((-92706030748846189105823587486679553736 : Rat) / 8763568061189899327660069383067348801) [(7, 3), (9, 2), (15, 1), (16, 1)],
  term ((-157447466069746186185163437159329595872 : Rat) / 43817840305949496638300346915336744005) [(7, 3), (11, 1), (16, 1)],
  term ((-2767989344116862279306515677041581392 : Rat) / 6259691472278499519757192416476677715) [(7, 3), (13, 1), (16, 1)],
  term ((-1753278936688630374936958877275057344 : Rat) / 6259691472278499519757192416476677715) [(7, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 1, terms 0 through 70. -/
theorem ep_Q2_019_block_01_0000_0070_valid :
    checkProductSumEq ep_Q2_019_partials_01_0000_0070
      ep_Q2_019_block_01_0000_0070 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
