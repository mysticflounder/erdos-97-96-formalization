/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 9:1900-1999

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_09_1900_1999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 1900 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1900 : Poly :=
[
  term ((56857735927546726453489 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1900 for generator 9. -/
def ep_Q1_009_partial_09_1900 : Poly :=
[
  term ((113715471855093452906978 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56857735927546726453489 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1900 for generator 9. -/
theorem ep_Q1_009_partial_09_1900_valid :
    mulPoly ep_Q1_009_coefficient_09_1900
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1900 := by
  native_decide

/-- Coefficient term 1901 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1901 : Poly :=
[
  term ((328194700630911039030134205542121184000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1901 for generator 9. -/
def ep_Q1_009_partial_09_1901 : Poly :=
[
  term ((656389401261822078060268411084242368000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((-328194700630911039030134205542121184000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1901 for generator 9. -/
theorem ep_Q1_009_partial_09_1901_valid :
    mulPoly ep_Q1_009_coefficient_09_1901
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1901 := by
  native_decide

/-- Coefficient term 1902 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1902 : Poly :=
[
  term ((6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 591376697934950421037534801668684111906717739592823682918444144103375458651991337387305779380007885737270329493120) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1902 for generator 9. -/
def ep_Q1_009_partial_09_1902 : Poly :=
[
  term ((6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 295688348967475210518767400834342055953358869796411841459222072051687729325995668693652889690003942868635164746560) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 591376697934950421037534801668684111906717739592823682918444144103375458651991337387305779380007885737270329493120) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1902 for generator 9. -/
theorem ep_Q1_009_partial_09_1902_valid :
    mulPoly ep_Q1_009_coefficient_09_1902
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1902 := by
  native_decide

/-- Coefficient term 1903 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1903 : Poly :=
[
  term ((-8890284321793560101416 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1903 for generator 9. -/
def ep_Q1_009_partial_09_1903 : Poly :=
[
  term ((-17780568643587120202832 : Rat) / 1558779625948348837707) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((8890284321793560101416 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1903 for generator 9. -/
theorem ep_Q1_009_partial_09_1903_valid :
    mulPoly ep_Q1_009_coefficient_09_1903
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1903 := by
  native_decide

/-- Coefficient term 1904 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1904 : Poly :=
[
  term ((5724065444710636538816439015843104639331414877840842913083347262066267385137928730988268603330688864473905554657861 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 1904 for generator 9. -/
def ep_Q1_009_partial_09_1904 : Poly :=
[
  term ((5724065444710636538816439015843104639331414877840842913083347262066267385137928730988268603330688864473905554657861 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-5724065444710636538816439015843104639331414877840842913083347262066267385137928730988268603330688864473905554657861 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1904 for generator 9. -/
theorem ep_Q1_009_partial_09_1904_valid :
    mulPoly ep_Q1_009_coefficient_09_1904
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1904 := by
  native_decide

/-- Coefficient term 1905 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1905 : Poly :=
[
  term ((-1111285540224195012677 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1905 for generator 9. -/
def ep_Q1_009_partial_09_1905 : Poly :=
[
  term ((-2222571080448390025354 : Rat) / 1558779625948348837707) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((1111285540224195012677 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1905 for generator 9. -/
theorem ep_Q1_009_partial_09_1905_valid :
    mulPoly ep_Q1_009_coefficient_09_1905
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1905 := by
  native_decide

/-- Coefficient term 1906 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1906 : Poly :=
[
  term ((21478710774274282659040196697782800000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (13, 1), (15, 3)]
]

/-- Partial product 1906 for generator 9. -/
def ep_Q1_009_partial_09_1906 : Poly :=
[
  term ((42957421548548565318080393395565600000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 3)],
  term ((-21478710774274282659040196697782800000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1906 for generator 9. -/
theorem ep_Q1_009_partial_09_1906_valid :
    mulPoly ep_Q1_009_coefficient_09_1906
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1906 := by
  native_decide

/-- Coefficient term 1907 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1907 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 948693562726491627806853266487275905335061875454527475673021761477666887415126772371675008) [(7, 1), (9, 1), (13, 2)]
]

/-- Partial product 1907 for generator 9. -/
def ep_Q1_009_partial_09_1907 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(2, 1), (7, 1), (9, 1), (13, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 948693562726491627806853266487275905335061875454527475673021761477666887415126772371675008) [(7, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1907 for generator 9. -/
theorem ep_Q1_009_partial_09_1907_valid :
    mulPoly ep_Q1_009_coefficient_09_1907
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1907 := by
  native_decide

/-- Coefficient term 1908 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1908 : Poly :=
[
  term ((-621603520480032325924308373800149995677165316472685480810196279200197491421287444704812171 : Rat) / 948693562726491627806853266487275905335061875454527475673021761477666887415126772371675008) [(7, 1), (9, 1), (13, 2), (14, 1)]
]

/-- Partial product 1908 for generator 9. -/
def ep_Q1_009_partial_09_1908 : Poly :=
[
  term ((-621603520480032325924308373800149995677165316472685480810196279200197491421287444704812171 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(2, 1), (7, 1), (9, 1), (13, 2), (14, 1)],
  term ((621603520480032325924308373800149995677165316472685480810196279200197491421287444704812171 : Rat) / 948693562726491627806853266487275905335061875454527475673021761477666887415126772371675008) [(7, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1908 for generator 9. -/
theorem ep_Q1_009_partial_09_1908_valid :
    mulPoly ep_Q1_009_coefficient_09_1908
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1908 := by
  native_decide

/-- Coefficient term 1909 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1909 : Poly :=
[
  term ((94506327406806843699776865470244320000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1909 for generator 9. -/
def ep_Q1_009_partial_09_1909 : Poly :=
[
  term ((189012654813613687399553730940488640000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (13, 2), (14, 1), (15, 2)],
  term ((-94506327406806843699776865470244320000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1909 for generator 9. -/
theorem ep_Q1_009_partial_09_1909_valid :
    mulPoly ep_Q1_009_coefficient_09_1909
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1909 := by
  native_decide

/-- Coefficient term 1910 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1910 : Poly :=
[
  term ((8591484309709713063616078679113120000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (13, 2), (15, 2)]
]

/-- Partial product 1910 for generator 9. -/
def ep_Q1_009_partial_09_1910 : Poly :=
[
  term ((17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (13, 2), (15, 2)],
  term ((-8591484309709713063616078679113120000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1910 for generator 9. -/
theorem ep_Q1_009_partial_09_1910_valid :
    mulPoly ep_Q1_009_coefficient_09_1910
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1910 := by
  native_decide

/-- Coefficient term 1911 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1911 : Poly :=
[
  term ((-72507725762694827100214607681753106577416597957019405623442157594325755852931961418004243826174786469275323464681 : Rat) / 1325538775884734596939103677609910803139072438410699951205842651301650592012308534752480295601880877217290690560) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 1911 for generator 9. -/
def ep_Q1_009_partial_09_1911 : Poly :=
[
  term ((-72507725762694827100214607681753106577416597957019405623442157594325755852931961418004243826174786469275323464681 : Rat) / 662769387942367298469551838804955401569536219205349975602921325650825296006154267376240147800940438608645345280) [(2, 1), (7, 1), (9, 1), (14, 1)],
  term ((72507725762694827100214607681753106577416597957019405623442157594325755852931961418004243826174786469275323464681 : Rat) / 1325538775884734596939103677609910803139072438410699951205842651301650592012308534752480295601880877217290690560) [(7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1911 for generator 9. -/
theorem ep_Q1_009_partial_09_1911_valid :
    mulPoly ep_Q1_009_coefficient_09_1911
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1911 := by
  native_decide

/-- Coefficient term 1912 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1912 : Poly :=
[
  term ((43826462758819780675922011372113941898143777162515649742080078775651190063208728421246331437639752358370510754268021 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 1912 for generator 9. -/
def ep_Q1_009_partial_09_1912 : Poly :=
[
  term ((43826462758819780675922011372113941898143777162515649742080078775651190063208728421246331437639752358370510754268021 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-43826462758819780675922011372113941898143777162515649742080078775651190063208728421246331437639752358370510754268021 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1912 for generator 9. -/
theorem ep_Q1_009_partial_09_1912_valid :
    mulPoly ep_Q1_009_coefficient_09_1912
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1912 := by
  native_decide

/-- Coefficient term 1913 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1913 : Poly :=
[
  term ((-8485096866388995932339 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1913 for generator 9. -/
def ep_Q1_009_partial_09_1913 : Poly :=
[
  term ((-16970193732777991864678 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((8485096866388995932339 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1913 for generator 9. -/
theorem ep_Q1_009_partial_09_1913_valid :
    mulPoly ep_Q1_009_coefficient_09_1913
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1913 := by
  native_decide

/-- Coefficient term 1914 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1914 : Poly :=
[
  term ((120523830792108908005543 : Rat) / 4156745669195596900552) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 1914 for generator 9. -/
def ep_Q1_009_partial_09_1914 : Poly :=
[
  term ((120523830792108908005543 : Rat) / 2078372834597798450276) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-120523830792108908005543 : Rat) / 4156745669195596900552) [(7, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1914 for generator 9. -/
theorem ep_Q1_009_partial_09_1914_valid :
    mulPoly ep_Q1_009_coefficient_09_1914
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1914 := by
  native_decide

/-- Coefficient term 1915 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1915 : Poly :=
[
  term ((1985437721453088787092654768171118380753620515650332578907523459927556742310271456547158017520559108903351108657 : Rat) / 11046156465706121641159197313415923359492270320089166260048688760847088266769237789604002463349007310144089088) [(7, 1), (9, 1), (14, 2)]
]

/-- Partial product 1915 for generator 9. -/
def ep_Q1_009_partial_09_1915 : Poly :=
[
  term ((1985437721453088787092654768171118380753620515650332578907523459927556742310271456547158017520559108903351108657 : Rat) / 5523078232853060820579598656707961679746135160044583130024344380423544133384618894802001231674503655072044544) [(2, 1), (7, 1), (9, 1), (14, 2)],
  term ((-1985437721453088787092654768171118380753620515650332578907523459927556742310271456547158017520559108903351108657 : Rat) / 11046156465706121641159197313415923359492270320089166260048688760847088266769237789604002463349007310144089088) [(7, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1915 for generator 9. -/
theorem ep_Q1_009_partial_09_1915_valid :
    mulPoly ep_Q1_009_coefficient_09_1915
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1915 := by
  native_decide

/-- Coefficient term 1916 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1916 : Poly :=
[
  term ((6869123848011312621851570375647054158400 : Rat) / 15008818057315716433186233612759665357973) [(7, 1), (9, 1), (14, 2), (15, 2)]
]

/-- Partial product 1916 for generator 9. -/
def ep_Q1_009_partial_09_1916 : Poly :=
[
  term ((13738247696022625243703140751294108316800 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (7, 1), (9, 1), (14, 2), (15, 2)],
  term ((-6869123848011312621851570375647054158400 : Rat) / 15008818057315716433186233612759665357973) [(7, 1), (9, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1916 for generator 9. -/
theorem ep_Q1_009_partial_09_1916_valid :
    mulPoly ep_Q1_009_coefficient_09_1916
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1916 := by
  native_decide

/-- Coefficient term 1917 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1917 : Poly :=
[
  term ((-431549001632160990004115 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 1917 for generator 9. -/
def ep_Q1_009_partial_09_1917 : Poly :=
[
  term ((-863098003264321980008230 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((431549001632160990004115 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1917 for generator 9. -/
theorem ep_Q1_009_partial_09_1917_valid :
    mulPoly ep_Q1_009_coefficient_09_1917
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1917 := by
  native_decide

/-- Coefficient term 1918 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1918 : Poly :=
[
  term ((-86728337733013185152788133484391011637922168213464201096468980691320993711942024546321416997101961351678635836951 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(7, 1), (9, 1), (14, 3)]
]

/-- Partial product 1918 for generator 9. -/
def ep_Q1_009_partial_09_1918 : Poly :=
[
  term ((-86728337733013185152788133484391011637922168213464201096468980691320993711942024546321416997101961351678635836951 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(2, 1), (7, 1), (9, 1), (14, 3)],
  term ((86728337733013185152788133484391011637922168213464201096468980691320993711942024546321416997101961351678635836951 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(7, 1), (9, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1918 for generator 9. -/
theorem ep_Q1_009_partial_09_1918_valid :
    mulPoly ep_Q1_009_coefficient_09_1918
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1918 := by
  native_decide

/-- Coefficient term 1919 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1919 : Poly :=
[
  term ((19944005768419667345151 : Rat) / 519593208649449612569) [(7, 1), (9, 1), (14, 3), (16, 1)]
]

/-- Partial product 1919 for generator 9. -/
def ep_Q1_009_partial_09_1919 : Poly :=
[
  term ((39888011536839334690302 : Rat) / 519593208649449612569) [(2, 1), (7, 1), (9, 1), (14, 3), (16, 1)],
  term ((-19944005768419667345151 : Rat) / 519593208649449612569) [(7, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1919 for generator 9. -/
theorem ep_Q1_009_partial_09_1919_valid :
    mulPoly ep_Q1_009_coefficient_09_1919
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1919 := by
  native_decide

/-- Coefficient term 1920 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1920 : Poly :=
[
  term ((155869837778999764758472491289352060426950775843121314446661054867337402806329702434295508864404984620224883267292997 : Rat) / 9462027166959206736600556826698945790507483833485178926695106305654007338431861398196892470080126171796325271889920) [(7, 1), (9, 1), (15, 2)]
]

/-- Partial product 1920 for generator 9. -/
def ep_Q1_009_partial_09_1920 : Poly :=
[
  term ((155869837778999764758472491289352060426950775843121314446661054867337402806329702434295508864404984620224883267292997 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((-155869837778999764758472491289352060426950775843121314446661054867337402806329702434295508864404984620224883267292997 : Rat) / 9462027166959206736600556826698945790507483833485178926695106305654007338431861398196892470080126171796325271889920) [(7, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1920 for generator 9. -/
theorem ep_Q1_009_partial_09_1920_valid :
    mulPoly ep_Q1_009_coefficient_09_1920
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1920 := by
  native_decide

/-- Coefficient term 1921 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1921 : Poly :=
[
  term ((-5006030825800898647247 : Rat) / 550157515040593707426) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 1921 for generator 9. -/
def ep_Q1_009_partial_09_1921 : Poly :=
[
  term ((-5006030825800898647247 : Rat) / 275078757520296853713) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((5006030825800898647247 : Rat) / 550157515040593707426) [(7, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1921 for generator 9. -/
theorem ep_Q1_009_partial_09_1921_valid :
    mulPoly ep_Q1_009_coefficient_09_1921
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1921 := by
  native_decide

/-- Coefficient term 1922 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1922 : Poly :=
[
  term ((-13316800680050055248604921952625336000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (15, 4)]
]

/-- Partial product 1922 for generator 9. -/
def ep_Q1_009_partial_09_1922 : Poly :=
[
  term ((-26633601360100110497209843905250672000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (15, 4)],
  term ((13316800680050055248604921952625336000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1922 for generator 9. -/
theorem ep_Q1_009_partial_09_1922_valid :
    mulPoly ep_Q1_009_coefficient_09_1922
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1922 := by
  native_decide

/-- Coefficient term 1923 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1923 : Poly :=
[
  term ((4370314146020811289561 : Rat) / 24940474015173581403312) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 1923 for generator 9. -/
def ep_Q1_009_partial_09_1923 : Poly :=
[
  term ((4370314146020811289561 : Rat) / 12470237007586790701656) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((-4370314146020811289561 : Rat) / 24940474015173581403312) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1923 for generator 9. -/
theorem ep_Q1_009_partial_09_1923_valid :
    mulPoly ep_Q1_009_coefficient_09_1923
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1923 := by
  native_decide

/-- Coefficient term 1924 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1924 : Poly :=
[
  term ((-84957268227699516213673086560512011742114530360981698006114865526839570605372858381260251767378161 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 1924 for generator 9. -/
def ep_Q1_009_partial_09_1924 : Poly :=
[
  term ((-84957268227699516213673086560512011742114530360981698006114865526839570605372858381260251767378161 : Rat) / 759494117102930558147595599789103667767970335371734773967943018875797819794434254886913275995840) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((84957268227699516213673086560512011742114530360981698006114865526839570605372858381260251767378161 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1924 for generator 9. -/
theorem ep_Q1_009_partial_09_1924_valid :
    mulPoly ep_Q1_009_coefficient_09_1924
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1924 := by
  native_decide

/-- Coefficient term 1925 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1925 : Poly :=
[
  term ((980430161414404512396818536608232686498070671692343963172149005399809989288649673262778805163485 : Rat) / 91449291651169189654506408954198196731245407728433370743078853293208308914023716404750782211744) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1925 for generator 9. -/
def ep_Q1_009_partial_09_1925 : Poly :=
[
  term ((980430161414404512396818536608232686498070671692343963172149005399809989288649673262778805163485 : Rat) / 45724645825584594827253204477099098365622703864216685371539426646604154457011858202375391105872) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-980430161414404512396818536608232686498070671692343963172149005399809989288649673262778805163485 : Rat) / 91449291651169189654506408954198196731245407728433370743078853293208308914023716404750782211744) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1925 for generator 9. -/
theorem ep_Q1_009_partial_09_1925_valid :
    mulPoly ep_Q1_009_coefficient_09_1925
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1925 := by
  native_decide

/-- Coefficient term 1926 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1926 : Poly :=
[
  term ((5740300 : Rat) / 3536493) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1926 for generator 9. -/
def ep_Q1_009_partial_09_1926 : Poly :=
[
  term ((11480600 : Rat) / 3536493) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5740300 : Rat) / 3536493) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1926 for generator 9. -/
theorem ep_Q1_009_partial_09_1926_valid :
    mulPoly ep_Q1_009_coefficient_09_1926
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1926 := by
  native_decide

/-- Coefficient term 1927 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1927 : Poly :=
[
  term ((3058121186311029003090229031528768894493461012213422420120077802441473398242392340442762989030761250222542309131 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1927 for generator 9. -/
def ep_Q1_009_partial_09_1927 : Poly :=
[
  term ((3058121186311029003090229031528768894493461012213422420120077802441473398242392340442762989030761250222542309131 : Rat) / 52537342103943781366599003922815049037657724716157665768789620697517729802615492010902727986365276206188838112) [(2, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-3058121186311029003090229031528768894493461012213422420120077802441473398242392340442762989030761250222542309131 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1927 for generator 9. -/
theorem ep_Q1_009_partial_09_1927_valid :
    mulPoly ep_Q1_009_coefficient_09_1927
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1927 := by
  native_decide

/-- Coefficient term 1928 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1928 : Poly :=
[
  term ((1916015847500740938283 : Rat) / 290243508153948313977) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1928 for generator 9. -/
def ep_Q1_009_partial_09_1928 : Poly :=
[
  term ((3832031695001481876566 : Rat) / 290243508153948313977) [(2, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1916015847500740938283 : Rat) / 290243508153948313977) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1928 for generator 9. -/
theorem ep_Q1_009_partial_09_1928_valid :
    mulPoly ep_Q1_009_coefficient_09_1928
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1928 := by
  native_decide

/-- Coefficient term 1929 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1929 : Poly :=
[
  term ((-132584864 : Rat) / 24755451) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1929 for generator 9. -/
def ep_Q1_009_partial_09_1929 : Poly :=
[
  term ((-265169728 : Rat) / 24755451) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((132584864 : Rat) / 24755451) [(7, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1929 for generator 9. -/
theorem ep_Q1_009_partial_09_1929_valid :
    mulPoly ep_Q1_009_coefficient_09_1929
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1929 := by
  native_decide

/-- Coefficient term 1930 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1930 : Poly :=
[
  term ((-1359149678142594416952475150215728105429566274417443282331557700281174219118980271001467010788815 : Rat) / 37655590679893195740090874275258081006983403182296093835385410179556362494009765578426792675424) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1930 for generator 9. -/
def ep_Q1_009_partial_09_1930 : Poly :=
[
  term ((-1359149678142594416952475150215728105429566274417443282331557700281174219118980271001467010788815 : Rat) / 18827795339946597870045437137629040503491701591148046917692705089778181247004882789213396337712) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1359149678142594416952475150215728105429566274417443282331557700281174219118980271001467010788815 : Rat) / 37655590679893195740090874275258081006983403182296093835385410179556362494009765578426792675424) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1930 for generator 9. -/
theorem ep_Q1_009_partial_09_1930_valid :
    mulPoly ep_Q1_009_coefficient_09_1930
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1930 := by
  native_decide

/-- Coefficient term 1931 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1931 : Poly :=
[
  term ((-1148060 : Rat) / 208029) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1931 for generator 9. -/
def ep_Q1_009_partial_09_1931 : Poly :=
[
  term ((-2296120 : Rat) / 208029) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1148060 : Rat) / 208029) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1931 for generator 9. -/
theorem ep_Q1_009_partial_09_1931_valid :
    mulPoly ep_Q1_009_coefficient_09_1931
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1931 := by
  native_decide

/-- Coefficient term 1932 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1932 : Poly :=
[
  term ((-6661779380315227415517201882065782993211710928502244818784802349786862626509421764289985273935624961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 1932 for generator 9. -/
def ep_Q1_009_partial_09_1932 : Poly :=
[
  term ((-6661779380315227415517201882065782993211710928502244818784802349786862626509421764289985273935624961 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((6661779380315227415517201882065782993211710928502244818784802349786862626509421764289985273935624961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1932 for generator 9. -/
theorem ep_Q1_009_partial_09_1932_valid :
    mulPoly ep_Q1_009_coefficient_09_1932
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1932 := by
  native_decide

/-- Coefficient term 1933 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1933 : Poly :=
[
  term ((1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(7, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 1933 for generator 9. -/
def ep_Q1_009_partial_09_1933 : Poly :=
[
  term ((1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(7, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1933 for generator 9. -/
theorem ep_Q1_009_partial_09_1933_valid :
    mulPoly ep_Q1_009_coefficient_09_1933
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1933 := by
  native_decide

/-- Coefficient term 1934 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1934 : Poly :=
[
  term ((-2067140832184623 : Rat) / 1395206957462413) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1934 for generator 9. -/
def ep_Q1_009_partial_09_1934 : Poly :=
[
  term ((-4134281664369246 : Rat) / 1395206957462413) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2067140832184623 : Rat) / 1395206957462413) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1934 for generator 9. -/
theorem ep_Q1_009_partial_09_1934_valid :
    mulPoly ep_Q1_009_coefficient_09_1934
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1934 := by
  native_decide

/-- Coefficient term 1935 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1935 : Poly :=
[
  term ((-3580960609 : Rat) / 33007268) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1935 for generator 9. -/
def ep_Q1_009_partial_09_1935 : Poly :=
[
  term ((-3580960609 : Rat) / 16503634) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((3580960609 : Rat) / 33007268) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1935 for generator 9. -/
theorem ep_Q1_009_partial_09_1935_valid :
    mulPoly ep_Q1_009_coefficient_09_1935
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1935 := by
  native_decide

/-- Coefficient term 1936 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1936 : Poly :=
[
  term ((-1713698872338238717563212726257972270277520486294183875267285892918445482366183832704082218013226683 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 1936 for generator 9. -/
def ep_Q1_009_partial_09_1936 : Poly :=
[
  term ((-1713698872338238717563212726257972270277520486294183875267285892918445482366183832704082218013226683 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((1713698872338238717563212726257972270277520486294183875267285892918445482366183832704082218013226683 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1936 for generator 9. -/
theorem ep_Q1_009_partial_09_1936_valid :
    mulPoly ep_Q1_009_coefficient_09_1936
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1936 := by
  native_decide

/-- Coefficient term 1937 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1937 : Poly :=
[
  term ((34745072535667721658586049959983427563568987128505423166143171131699638151 : Rat) / 71245737346838632493196401745853328330156143547890321333643888559540664160) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1937 for generator 9. -/
def ep_Q1_009_partial_09_1937 : Poly :=
[
  term ((34745072535667721658586049959983427563568987128505423166143171131699638151 : Rat) / 35622868673419316246598200872926664165078071773945160666821944279770332080) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-34745072535667721658586049959983427563568987128505423166143171131699638151 : Rat) / 71245737346838632493196401745853328330156143547890321333643888559540664160) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1937 for generator 9. -/
theorem ep_Q1_009_partial_09_1937_valid :
    mulPoly ep_Q1_009_coefficient_09_1937
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1937 := by
  native_decide

/-- Coefficient term 1938 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1938 : Poly :=
[
  term ((462052746268758187299831416284800 : Rat) / 24049240021528595265061175145067379) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1938 for generator 9. -/
def ep_Q1_009_partial_09_1938 : Poly :=
[
  term ((924105492537516374599662832569600 : Rat) / 24049240021528595265061175145067379) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-462052746268758187299831416284800 : Rat) / 24049240021528595265061175145067379) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1938 for generator 9. -/
theorem ep_Q1_009_partial_09_1938_valid :
    mulPoly ep_Q1_009_coefficient_09_1938
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1938 := by
  native_decide

/-- Coefficient term 1939 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1939 : Poly :=
[
  term ((-948957187615194577319156994100971736175100593637779906490876742550586656874171961028240965857764197585351562593 : Rat) / 23349929823975013940710668410140021794514544318292295897239831421118991023384663115956767993940122758306150272) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1939 for generator 9. -/
def ep_Q1_009_partial_09_1939 : Poly :=
[
  term ((-948957187615194577319156994100971736175100593637779906490876742550586656874171961028240965857764197585351562593 : Rat) / 11674964911987506970355334205070010897257272159146147948619915710559495511692331557978383996970061379153075136) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((948957187615194577319156994100971736175100593637779906490876742550586656874171961028240965857764197585351562593 : Rat) / 23349929823975013940710668410140021794514544318292295897239831421118991023384663115956767993940122758306150272) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1939 for generator 9. -/
theorem ep_Q1_009_partial_09_1939_valid :
    mulPoly ep_Q1_009_coefficient_09_1939
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1939 := by
  native_decide

/-- Coefficient term 1940 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1940 : Poly :=
[
  term ((-520186591094242460530 : Rat) / 96747836051316104659) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1940 for generator 9. -/
def ep_Q1_009_partial_09_1940 : Poly :=
[
  term ((-1040373182188484921060 : Rat) / 96747836051316104659) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((520186591094242460530 : Rat) / 96747836051316104659) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1940 for generator 9. -/
theorem ep_Q1_009_partial_09_1940_valid :
    mulPoly ep_Q1_009_coefficient_09_1940
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1940 := by
  native_decide

/-- Coefficient term 1941 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1941 : Poly :=
[
  term ((-2223353269 : Rat) / 99021804) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1941 for generator 9. -/
def ep_Q1_009_partial_09_1941 : Poly :=
[
  term ((-2223353269 : Rat) / 49510902) [(2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((2223353269 : Rat) / 99021804) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1941 for generator 9. -/
theorem ep_Q1_009_partial_09_1941_valid :
    mulPoly ep_Q1_009_coefficient_09_1941
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1941 := by
  native_decide

/-- Coefficient term 1942 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1942 : Poly :=
[
  term ((285988292549412829639210170966600 : Rat) / 24049240021528595265061175145067379) [(7, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1942 for generator 9. -/
def ep_Q1_009_partial_09_1942 : Poly :=
[
  term ((571976585098825659278420341933200 : Rat) / 24049240021528595265061175145067379) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-285988292549412829639210170966600 : Rat) / 24049240021528595265061175145067379) [(7, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1942 for generator 9. -/
theorem ep_Q1_009_partial_09_1942_valid :
    mulPoly ep_Q1_009_coefficient_09_1942
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1942 := by
  native_decide

/-- Coefficient term 1943 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1943 : Poly :=
[
  term ((-9538009541800353642286150745694987876527846494600877345038914734771400713651490411320074751596665340960252107106931 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1943 for generator 9. -/
def ep_Q1_009_partial_09_1943 : Poly :=
[
  term ((-9538009541800353642286150745694987876527846494600877345038914734771400713651490411320074751596665340960252107106931 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((9538009541800353642286150745694987876527846494600877345038914734771400713651490411320074751596665340960252107106931 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1943 for generator 9. -/
theorem ep_Q1_009_partial_09_1943_valid :
    mulPoly ep_Q1_009_coefficient_09_1943
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1943 := by
  native_decide

/-- Coefficient term 1944 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1944 : Poly :=
[
  term ((-297935861901283415393215 : Rat) / 8126818228310552791356) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1944 for generator 9. -/
def ep_Q1_009_partial_09_1944 : Poly :=
[
  term ((-297935861901283415393215 : Rat) / 4063409114155276395678) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((297935861901283415393215 : Rat) / 8126818228310552791356) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1944 for generator 9. -/
theorem ep_Q1_009_partial_09_1944_valid :
    mulPoly ep_Q1_009_coefficient_09_1944
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1944 := by
  native_decide

/-- Coefficient term 1945 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1945 : Poly :=
[
  term ((54974226525505507729609282353922775592080259117782601455369928605360183425294794409433677284333037 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 1945 for generator 9. -/
def ep_Q1_009_partial_09_1945 : Poly :=
[
  term ((54974226525505507729609282353922775592080259117782601455369928605360183425294794409433677284333037 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-54974226525505507729609282353922775592080259117782601455369928605360183425294794409433677284333037 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1945 for generator 9. -/
theorem ep_Q1_009_partial_09_1945_valid :
    mulPoly ep_Q1_009_coefficient_09_1945
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1945 := by
  native_decide

/-- Coefficient term 1946 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1946 : Poly :=
[
  term ((7922394401441 : Rat) / 82070997497789) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1946 for generator 9. -/
def ep_Q1_009_partial_09_1946 : Poly :=
[
  term ((15844788802882 : Rat) / 82070997497789) [(2, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-7922394401441 : Rat) / 82070997497789) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1946 for generator 9. -/
theorem ep_Q1_009_partial_09_1946_valid :
    mulPoly ep_Q1_009_coefficient_09_1946
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1946 := by
  native_decide

/-- Coefficient term 1947 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1947 : Poly :=
[
  term ((-1984438144139506386827075721890458670687348194005253816935256136956950413159704773327119067058794675296722132267067 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 1947 for generator 9. -/
def ep_Q1_009_partial_09_1947 : Poly :=
[
  term ((-1984438144139506386827075721890458670687348194005253816935256136956950413159704773327119067058794675296722132267067 : Rat) / 1838806973638032347830965137298526716318020365065518301907636724413120543091542220381595479522784667216609333920) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((1984438144139506386827075721890458670687348194005253816935256136956950413159704773327119067058794675296722132267067 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1947 for generator 9. -/
theorem ep_Q1_009_partial_09_1947_valid :
    mulPoly ep_Q1_009_coefficient_09_1947
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1947 := by
  native_decide

/-- Coefficient term 1948 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1948 : Poly :=
[
  term ((-99814630075874911805024 : Rat) / 2031704557077638197839) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1948 for generator 9. -/
def ep_Q1_009_partial_09_1948 : Poly :=
[
  term ((-199629260151749823610048 : Rat) / 2031704557077638197839) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((99814630075874911805024 : Rat) / 2031704557077638197839) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1948 for generator 9. -/
theorem ep_Q1_009_partial_09_1948_valid :
    mulPoly ep_Q1_009_coefficient_09_1948
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1948 := by
  native_decide

/-- Coefficient term 1949 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1949 : Poly :=
[
  term ((-1093620882616811136218587792898881150308834736110172004672733107528392613151830173674869582262337852979889508165 : Rat) / 10007112781703577403161715032917152197649090422125269670245642037622424724307712763981471997402909753559778688) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 1949 for generator 9. -/
def ep_Q1_009_partial_09_1949 : Poly :=
[
  term ((-1093620882616811136218587792898881150308834736110172004672733107528392613151830173674869582262337852979889508165 : Rat) / 5003556390851788701580857516458576098824545211062634835122821018811212362153856381990735998701454876779889344) [(2, 1), (7, 1), (12, 1), (15, 3)],
  term ((1093620882616811136218587792898881150308834736110172004672733107528392613151830173674869582262337852979889508165 : Rat) / 10007112781703577403161715032917152197649090422125269670245642037622424724307712763981471997402909753559778688) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1949 for generator 9. -/
theorem ep_Q1_009_partial_09_1949_valid :
    mulPoly ep_Q1_009_coefficient_09_1949
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1949 := by
  native_decide

/-- Coefficient term 1950 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1950 : Poly :=
[
  term ((-5835184734738905644231 : Rat) / 290243508153948313977) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1950 for generator 9. -/
def ep_Q1_009_partial_09_1950 : Poly :=
[
  term ((-11670369469477811288462 : Rat) / 290243508153948313977) [(2, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((5835184734738905644231 : Rat) / 290243508153948313977) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1950 for generator 9. -/
theorem ep_Q1_009_partial_09_1950_valid :
    mulPoly ep_Q1_009_coefficient_09_1950
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1950 := by
  native_decide

/-- Coefficient term 1951 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1951 : Poly :=
[
  term ((662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 419092572628462544077625892622666637236212609105237184315552285644356848) [(7, 1), (12, 2), (13, 1)]
]

/-- Partial product 1951 for generator 9. -/
def ep_Q1_009_partial_09_1951 : Poly :=
[
  term ((662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 209546286314231272038812946311333318618106304552618592157776142822178424) [(2, 1), (7, 1), (12, 2), (13, 1)],
  term ((-662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 419092572628462544077625892622666637236212609105237184315552285644356848) [(7, 1), (12, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1951 for generator 9. -/
theorem ep_Q1_009_partial_09_1951_valid :
    mulPoly ep_Q1_009_coefficient_09_1951
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1951 := by
  native_decide

/-- Coefficient term 1952 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1952 : Poly :=
[
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(7, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 1952 for generator 9. -/
def ep_Q1_009_partial_09_1952 : Poly :=
[
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 142535977414811439821655628464178362087681092443638696) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(7, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1952 for generator 9. -/
theorem ep_Q1_009_partial_09_1952_valid :
    mulPoly ep_Q1_009_coefficient_09_1952
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1952 := by
  native_decide

/-- Coefficient term 1953 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1953 : Poly :=
[
  term ((-662786495307469 : Rat) / 1395206957462413) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1953 for generator 9. -/
def ep_Q1_009_partial_09_1953 : Poly :=
[
  term ((-1325572990614938 : Rat) / 1395206957462413) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((662786495307469 : Rat) / 1395206957462413) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1953 for generator 9. -/
theorem ep_Q1_009_partial_09_1953_valid :
    mulPoly ep_Q1_009_coefficient_09_1953
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1953 := by
  native_decide

/-- Coefficient term 1954 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1954 : Poly :=
[
  term ((-2495743743953107770883462524728011865801691539332278201281129966567449959904240331071545192111815351227698424145293 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 1954 for generator 9. -/
def ep_Q1_009_partial_09_1954 : Poly :=
[
  term ((-2495743743953107770883462524728011865801691539332278201281129966567449959904240331071545192111815351227698424145293 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((2495743743953107770883462524728011865801691539332278201281129966567449959904240331071545192111815351227698424145293 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1954 for generator 9. -/
theorem ep_Q1_009_partial_09_1954_valid :
    mulPoly ep_Q1_009_coefficient_09_1954
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1954 := by
  native_decide

/-- Coefficient term 1955 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1955 : Poly :=
[
  term ((-71384300668089807455119 : Rat) / 4063409114155276395678) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1955 for generator 9. -/
def ep_Q1_009_partial_09_1955 : Poly :=
[
  term ((-71384300668089807455119 : Rat) / 2031704557077638197839) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((71384300668089807455119 : Rat) / 4063409114155276395678) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1955 for generator 9. -/
theorem ep_Q1_009_partial_09_1955_valid :
    mulPoly ep_Q1_009_coefficient_09_1955
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1955 := by
  native_decide

/-- Coefficient term 1956 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1956 : Poly :=
[
  term ((9308218533879920831283070162540747646740131749407218886607862216148237908341059942748160502802731 : Rat) / 168776470467317901810576799953134148392882296749274394215098448639066182176540945530425172443520) [(7, 1), (13, 1)]
]

/-- Partial product 1956 for generator 9. -/
def ep_Q1_009_partial_09_1956 : Poly :=
[
  term ((9308218533879920831283070162540747646740131749407218886607862216148237908341059942748160502802731 : Rat) / 84388235233658950905288399976567074196441148374637197107549224319533091088270472765212586221760) [(2, 1), (7, 1), (13, 1)],
  term ((-9308218533879920831283070162540747646740131749407218886607862216148237908341059942748160502802731 : Rat) / 168776470467317901810576799953134148392882296749274394215098448639066182176540945530425172443520) [(7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1956 for generator 9. -/
theorem ep_Q1_009_partial_09_1956_valid :
    mulPoly ep_Q1_009_coefficient_09_1956
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1956 := by
  native_decide

/-- Coefficient term 1957 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1957 : Poly :=
[
  term ((-1651061072179824141548815949224782356773406528226586349631133514244333729099196588686914296106517547 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 1957 for generator 9. -/
def ep_Q1_009_partial_09_1957 : Poly :=
[
  term ((-1651061072179824141548815949224782356773406528226586349631133514244333729099196588686914296106517547 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((1651061072179824141548815949224782356773406528226586349631133514244333729099196588686914296106517547 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1957 for generator 9. -/
theorem ep_Q1_009_partial_09_1957_valid :
    mulPoly ep_Q1_009_coefficient_09_1957
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1957 := by
  native_decide

/-- Coefficient term 1958 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1958 : Poly :=
[
  term ((7004973195640297977429345013015232268213031048978037186740444691355488700306432190422429536843812415136354726199 : Rat) / 70049789471925041822132005230420065383543632954876887691719494263356973070153989347870303981820368274918450816) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1958 for generator 9. -/
def ep_Q1_009_partial_09_1958 : Poly :=
[
  term ((7004973195640297977429345013015232268213031048978037186740444691355488700306432190422429536843812415136354726199 : Rat) / 35024894735962520911066002615210032691771816477438443845859747131678486535076994673935151990910184137459225408) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7004973195640297977429345013015232268213031048978037186740444691355488700306432190422429536843812415136354726199 : Rat) / 70049789471925041822132005230420065383543632954876887691719494263356973070153989347870303981820368274918450816) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1958 for generator 9. -/
theorem ep_Q1_009_partial_09_1958_valid :
    mulPoly ep_Q1_009_coefficient_09_1958
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1958 := by
  native_decide

/-- Coefficient term 1959 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1959 : Poly :=
[
  term ((4893373903329617159216 : Rat) / 290243508153948313977) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1959 for generator 9. -/
def ep_Q1_009_partial_09_1959 : Poly :=
[
  term ((9786747806659234318432 : Rat) / 290243508153948313977) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4893373903329617159216 : Rat) / 290243508153948313977) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1959 for generator 9. -/
theorem ep_Q1_009_partial_09_1959_valid :
    mulPoly ep_Q1_009_coefficient_09_1959
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1959 := by
  native_decide

/-- Coefficient term 1960 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1960 : Poly :=
[
  term ((-2554179101 : Rat) / 99021804) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1960 for generator 9. -/
def ep_Q1_009_partial_09_1960 : Poly :=
[
  term ((-2554179101 : Rat) / 49510902) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((2554179101 : Rat) / 99021804) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1960 for generator 9. -/
theorem ep_Q1_009_partial_09_1960_valid :
    mulPoly ep_Q1_009_coefficient_09_1960
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1960 := by
  native_decide

/-- Coefficient term 1961 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1961 : Poly :=
[
  term ((9324569826366553992132893227610844132112054775302297478069615232003791359698543843082209447172917 : Rat) / 42194117616829475452644199988283537098220574187318598553774612159766545544135236382606293110880) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 1961 for generator 9. -/
def ep_Q1_009_partial_09_1961 : Poly :=
[
  term ((9324569826366553992132893227610844132112054775302297478069615232003791359698543843082209447172917 : Rat) / 21097058808414737726322099994141768549110287093659299276887306079883272772067618191303146555440) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-9324569826366553992132893227610844132112054775302297478069615232003791359698543843082209447172917 : Rat) / 42194117616829475452644199988283537098220574187318598553774612159766545544135236382606293110880) [(7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1961 for generator 9. -/
theorem ep_Q1_009_partial_09_1961_valid :
    mulPoly ep_Q1_009_coefficient_09_1961
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1961 := by
  native_decide

/-- Coefficient term 1962 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1962 : Poly :=
[
  term ((59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(7, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1962 for generator 9. -/
def ep_Q1_009_partial_09_1962 : Poly :=
[
  term ((59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 63575628181339442486601007174807452342195040668907943386213932048572973599996984342021434911943149) [(2, 1), (7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(7, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1962 for generator 9. -/
theorem ep_Q1_009_partial_09_1962_valid :
    mulPoly ep_Q1_009_coefficient_09_1962
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1962 := by
  native_decide

/-- Coefficient term 1963 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1963 : Poly :=
[
  term ((-748503516560904 : Rat) / 1395206957462413) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1963 for generator 9. -/
def ep_Q1_009_partial_09_1963 : Poly :=
[
  term ((-1497007033121808 : Rat) / 1395206957462413) [(2, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((748503516560904 : Rat) / 1395206957462413) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1963 for generator 9. -/
theorem ep_Q1_009_partial_09_1963_valid :
    mulPoly ep_Q1_009_coefficient_09_1963
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1963 := by
  native_decide

/-- Coefficient term 1964 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1964 : Poly :=
[
  term ((177774804 : Rat) / 8251817) [(7, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 1964 for generator 9. -/
def ep_Q1_009_partial_09_1964 : Poly :=
[
  term ((355549608 : Rat) / 8251817) [(2, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-177774804 : Rat) / 8251817) [(7, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1964 for generator 9. -/
theorem ep_Q1_009_partial_09_1964_valid :
    mulPoly ep_Q1_009_coefficient_09_1964
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1964 := by
  native_decide

/-- Coefficient term 1965 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1965 : Poly :=
[
  term ((133142424625823710103178172449863060699313550862182023511603041960653458016235073029239712442005966448212591103 : Rat) / 20014225563407154806323430065834304395298180844250539340491284075244849448615425527962943994805819507119557376) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 1965 for generator 9. -/
def ep_Q1_009_partial_09_1965 : Poly :=
[
  term ((133142424625823710103178172449863060699313550862182023511603041960653458016235073029239712442005966448212591103 : Rat) / 10007112781703577403161715032917152197649090422125269670245642037622424724307712763981471997402909753559778688) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-133142424625823710103178172449863060699313550862182023511603041960653458016235073029239712442005966448212591103 : Rat) / 20014225563407154806323430065834304395298180844250539340491284075244849448615425527962943994805819507119557376) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1965 for generator 9. -/
theorem ep_Q1_009_partial_09_1965_valid :
    mulPoly ep_Q1_009_coefficient_09_1965
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1965 := by
  native_decide

/-- Coefficient term 1966 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1966 : Poly :=
[
  term ((549962574159035671321 : Rat) / 580487016307896627954) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1966 for generator 9. -/
def ep_Q1_009_partial_09_1966 : Poly :=
[
  term ((549962574159035671321 : Rat) / 290243508153948313977) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-549962574159035671321 : Rat) / 580487016307896627954) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1966 for generator 9. -/
theorem ep_Q1_009_partial_09_1966_valid :
    mulPoly ep_Q1_009_coefficient_09_1966
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1966 := by
  native_decide

/-- Coefficient term 1967 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1967 : Poly :=
[
  term ((44443701 : Rat) / 8251817) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 1967 for generator 9. -/
def ep_Q1_009_partial_09_1967 : Poly :=
[
  term ((88887402 : Rat) / 8251817) [(2, 1), (7, 1), (13, 1), (16, 1)],
  term ((-44443701 : Rat) / 8251817) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1967 for generator 9. -/
theorem ep_Q1_009_partial_09_1967_valid :
    mulPoly ep_Q1_009_coefficient_09_1967
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1967 := by
  native_decide

/-- Coefficient term 1968 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1968 : Poly :=
[
  term ((74857136969348571450631300753393252549671842000940268275801119563828278864110782818096696297264505 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1968 for generator 9. -/
def ep_Q1_009_partial_09_1968 : Poly :=
[
  term ((74857136969348571450631300753393252549671842000940268275801119563828278864110782818096696297264505 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-74857136969348571450631300753393252549671842000940268275801119563828278864110782818096696297264505 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1968 for generator 9. -/
theorem ep_Q1_009_partial_09_1968_valid :
    mulPoly ep_Q1_009_coefficient_09_1968
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1968 := by
  native_decide

/-- Coefficient term 1969 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1969 : Poly :=
[
  term ((15785825 : Rat) / 3536493) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1969 for generator 9. -/
def ep_Q1_009_partial_09_1969 : Poly :=
[
  term ((31571650 : Rat) / 3536493) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-15785825 : Rat) / 3536493) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1969 for generator 9. -/
theorem ep_Q1_009_partial_09_1969_valid :
    mulPoly ep_Q1_009_coefficient_09_1969
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1969 := by
  native_decide

/-- Coefficient term 1970 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1970 : Poly :=
[
  term ((-931557956187012474394821403800000 : Rat) / 24049240021528595265061175145067379) [(7, 1), (13, 2), (14, 2), (15, 1)]
]

/-- Partial product 1970 for generator 9. -/
def ep_Q1_009_partial_09_1970 : Poly :=
[
  term ((-1863115912374024948789642807600000 : Rat) / 24049240021528595265061175145067379) [(2, 1), (7, 1), (13, 2), (14, 2), (15, 1)],
  term ((931557956187012474394821403800000 : Rat) / 24049240021528595265061175145067379) [(7, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1970 for generator 9. -/
theorem ep_Q1_009_partial_09_1970_valid :
    mulPoly ep_Q1_009_coefficient_09_1970
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1970 := by
  native_decide

/-- Coefficient term 1971 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1971 : Poly :=
[
  term ((969331336860073099156372348514969896403554490004982994095240941577661487890699612847460780917725 : Rat) / 365797166604676758618025635816792786924981630913733482972315413172833235656094865619003128846976) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 1971 for generator 9. -/
def ep_Q1_009_partial_09_1971 : Poly :=
[
  term ((969331336860073099156372348514969896403554490004982994095240941577661487890699612847460780917725 : Rat) / 182898583302338379309012817908396393462490815456866741486157706586416617828047432809501564423488) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((-969331336860073099156372348514969896403554490004982994095240941577661487890699612847460780917725 : Rat) / 365797166604676758618025635816792786924981630913733482972315413172833235656094865619003128846976) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1971 for generator 9. -/
theorem ep_Q1_009_partial_09_1971_valid :
    mulPoly ep_Q1_009_coefficient_09_1971
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1971 := by
  native_decide

/-- Coefficient term 1972 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1972 : Poly :=
[
  term ((1435075 : Rat) / 3536493) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1972 for generator 9. -/
def ep_Q1_009_partial_09_1972 : Poly :=
[
  term ((2870150 : Rat) / 3536493) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1435075 : Rat) / 3536493) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1972 for generator 9. -/
theorem ep_Q1_009_partial_09_1972_valid :
    mulPoly ep_Q1_009_coefficient_09_1972
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1972 := by
  native_decide

/-- Coefficient term 1973 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1973 : Poly :=
[
  term ((-1468593784584407152515643905176566026985277740801749476801995541615316093523002581798527557428589303824477423120267 : Rat) / 1634495087678250975849746788709801525616018102280460712806788199478329371636926418116973759575808593081430519040) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 1973 for generator 9. -/
def ep_Q1_009_partial_09_1973 : Poly :=
[
  term ((-1468593784584407152515643905176566026985277740801749476801995541615316093523002581798527557428589303824477423120267 : Rat) / 817247543839125487924873394354900762808009051140230356403394099739164685818463209058486879787904296540715259520) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((1468593784584407152515643905176566026985277740801749476801995541615316093523002581798527557428589303824477423120267 : Rat) / 1634495087678250975849746788709801525616018102280460712806788199478329371636926418116973759575808593081430519040) [(7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1973 for generator 9. -/
theorem ep_Q1_009_partial_09_1973_valid :
    mulPoly ep_Q1_009_coefficient_09_1973
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1973 := by
  native_decide

/-- Coefficient term 1974 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1974 : Poly :=
[
  term ((-1433728295865093441193241 : Rat) / 16253636456621105582712) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1974 for generator 9. -/
def ep_Q1_009_partial_09_1974 : Poly :=
[
  term ((-1433728295865093441193241 : Rat) / 8126818228310552791356) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1433728295865093441193241 : Rat) / 16253636456621105582712) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1974 for generator 9. -/
theorem ep_Q1_009_partial_09_1974_valid :
    mulPoly ep_Q1_009_coefficient_09_1974
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1974 := by
  native_decide

/-- Coefficient term 1975 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1975 : Poly :=
[
  term ((493518740573594331488581682822153815936238740983478748762411434890100985600794213122836606706130225 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(7, 1), (14, 1), (15, 3)]
]

/-- Partial product 1975 for generator 9. -/
def ep_Q1_009_partial_09_1975 : Poly :=
[
  term ((493518740573594331488581682822153815936238740983478748762411434890100985600794213122836606706130225 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (7, 1), (14, 1), (15, 3)],
  term ((-493518740573594331488581682822153815936238740983478748762411434890100985600794213122836606706130225 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(7, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1975 for generator 9. -/
theorem ep_Q1_009_partial_09_1975_valid :
    mulPoly ep_Q1_009_coefficient_09_1975
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1975 := by
  native_decide

/-- Coefficient term 1976 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1976 : Poly :=
[
  term ((-775687799328637 : Rat) / 1395206957462413) [(7, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1976 for generator 9. -/
def ep_Q1_009_partial_09_1976 : Poly :=
[
  term ((-1551375598657274 : Rat) / 1395206957462413) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((775687799328637 : Rat) / 1395206957462413) [(7, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1976 for generator 9. -/
theorem ep_Q1_009_partial_09_1976_valid :
    mulPoly ep_Q1_009_coefficient_09_1976
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1976 := by
  native_decide

/-- Coefficient term 1977 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1977 : Poly :=
[
  term ((17648973538483655619069121892664154605907444411772823878099581610204747674200010449052536119225502799116565135955603 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 1977 for generator 9. -/
def ep_Q1_009_partial_09_1977 : Poly :=
[
  term ((17648973538483655619069121892664154605907444411772823878099581610204747674200010449052536119225502799116565135955603 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((-17648973538483655619069121892664154605907444411772823878099581610204747674200010449052536119225502799116565135955603 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1977 for generator 9. -/
theorem ep_Q1_009_partial_09_1977_valid :
    mulPoly ep_Q1_009_coefficient_09_1977
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1977 := by
  native_decide

/-- Coefficient term 1978 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1978 : Poly :=
[
  term ((404086751483420451748987 : Rat) / 8126818228310552791356) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1978 for generator 9. -/
def ep_Q1_009_partial_09_1978 : Poly :=
[
  term ((404086751483420451748987 : Rat) / 4063409114155276395678) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-404086751483420451748987 : Rat) / 8126818228310552791356) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1978 for generator 9. -/
theorem ep_Q1_009_partial_09_1978_valid :
    mulPoly ep_Q1_009_coefficient_09_1978
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1978 := by
  native_decide

/-- Coefficient term 1979 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1979 : Poly :=
[
  term ((-684420690243799178045620294414987917064283018594087467 : Rat) / 285071954829622879643311256928356724175362184887277392) [(7, 1), (14, 3), (15, 1)]
]

/-- Partial product 1979 for generator 9. -/
def ep_Q1_009_partial_09_1979 : Poly :=
[
  term ((-684420690243799178045620294414987917064283018594087467 : Rat) / 142535977414811439821655628464178362087681092443638696) [(2, 1), (7, 1), (14, 3), (15, 1)],
  term ((684420690243799178045620294414987917064283018594087467 : Rat) / 285071954829622879643311256928356724175362184887277392) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1979 for generator 9. -/
theorem ep_Q1_009_partial_09_1979_valid :
    mulPoly ep_Q1_009_coefficient_09_1979
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1979 := by
  native_decide

/-- Coefficient term 1980 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1980 : Poly :=
[
  term ((3755048164334233 : Rat) / 1395206957462413) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 1980 for generator 9. -/
def ep_Q1_009_partial_09_1980 : Poly :=
[
  term ((7510096328668466 : Rat) / 1395206957462413) [(2, 1), (7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-3755048164334233 : Rat) / 1395206957462413) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1980 for generator 9. -/
theorem ep_Q1_009_partial_09_1980_valid :
    mulPoly ep_Q1_009_coefficient_09_1980
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1980 := by
  native_decide

/-- Coefficient term 1981 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1981 : Poly :=
[
  term ((6704773620788751123539563496354524577028246053097460354157559518373349075088132341404916359372643591635188360871919 : Rat) / 58841823156417035130590884393552854922176651682096585661044375181219857378929351052211055344729109350931498685440) [(7, 1), (15, 1)]
]

/-- Partial product 1981 for generator 9. -/
def ep_Q1_009_partial_09_1981 : Poly :=
[
  term ((6704773620788751123539563496354524577028246053097460354157559518373349075088132341404916359372643591635188360871919 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(2, 1), (7, 1), (15, 1)],
  term ((-6704773620788751123539563496354524577028246053097460354157559518373349075088132341404916359372643591635188360871919 : Rat) / 58841823156417035130590884393552854922176651682096585661044375181219857378929351052211055344729109350931498685440) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1981 for generator 9. -/
theorem ep_Q1_009_partial_09_1981_valid :
    mulPoly ep_Q1_009_coefficient_09_1981
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1981 := by
  native_decide

/-- Coefficient term 1982 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1982 : Poly :=
[
  term ((312609792414713802718085 : Rat) / 32507272913242211165424) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 1982 for generator 9. -/
def ep_Q1_009_partial_09_1982 : Poly :=
[
  term ((312609792414713802718085 : Rat) / 16253636456621105582712) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-312609792414713802718085 : Rat) / 32507272913242211165424) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1982 for generator 9. -/
theorem ep_Q1_009_partial_09_1982_valid :
    mulPoly ep_Q1_009_coefficient_09_1982
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1982 := by
  native_decide

/-- Coefficient term 1983 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1983 : Poly :=
[
  term ((-2848120406845402898300808471125697598526774372831798455971016661371820354639103502761984797067535320123685286429 : Rat) / 840597473663100501865584062765040784602523595458522652300633931160283676841847872174443647781844419299021409792) [(7, 1), (15, 3)]
]

/-- Partial product 1983 for generator 9. -/
def ep_Q1_009_partial_09_1983 : Poly :=
[
  term ((-2848120406845402898300808471125697598526774372831798455971016661371820354639103502761984797067535320123685286429 : Rat) / 420298736831550250932792031382520392301261797729261326150316965580141838420923936087221823890922209649510704896) [(2, 1), (7, 1), (15, 3)],
  term ((2848120406845402898300808471125697598526774372831798455971016661371820354639103502761984797067535320123685286429 : Rat) / 840597473663100501865584062765040784602523595458522652300633931160283676841847872174443647781844419299021409792) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1983 for generator 9. -/
theorem ep_Q1_009_partial_09_1983_valid :
    mulPoly ep_Q1_009_coefficient_09_1983
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1983 := by
  native_decide

/-- Coefficient term 1984 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1984 : Poly :=
[
  term ((-1690100917409539859359 : Rat) / 1160974032615793255908) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 1984 for generator 9. -/
def ep_Q1_009_partial_09_1984 : Poly :=
[
  term ((-1690100917409539859359 : Rat) / 580487016307896627954) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((1690100917409539859359 : Rat) / 1160974032615793255908) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1984 for generator 9. -/
theorem ep_Q1_009_partial_09_1984_valid :
    mulPoly ep_Q1_009_coefficient_09_1984
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1984 := by
  native_decide

/-- Coefficient term 1985 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1985 : Poly :=
[
  term ((8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 1781143433670965812329910043646333208253903588697258033341097213988516604) [(7, 2)]
]

/-- Partial product 1985 for generator 9. -/
def ep_Q1_009_partial_09_1985 : Poly :=
[
  term ((8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 890571716835482906164955021823166604126951794348629016670548606994258302) [(2, 1), (7, 2)],
  term ((-8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 1781143433670965812329910043646333208253903588697258033341097213988516604) [(7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1985 for generator 9. -/
theorem ep_Q1_009_partial_09_1985_valid :
    mulPoly ep_Q1_009_coefficient_09_1985
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1985 := by
  native_decide

/-- Coefficient term 1986 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1986 : Poly :=
[
  term ((-2120006435036882370148750026037402340783770845456680277801385214168850678443082401556093012269 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 2), (8, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1986 for generator 9. -/
def ep_Q1_009_partial_09_1986 : Poly :=
[
  term ((-2120006435036882370148750026037402340783770845456680277801385214168850678443082401556093012269 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(2, 1), (7, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((2120006435036882370148750026037402340783770845456680277801385214168850678443082401556093012269 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 2), (8, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1986 for generator 9. -/
theorem ep_Q1_009_partial_09_1986_valid :
    mulPoly ep_Q1_009_coefficient_09_1986
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1986 := by
  native_decide

/-- Coefficient term 1987 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1987 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1987 for generator 9. -/
def ep_Q1_009_partial_09_1987 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 69687773008626174732002781841130479982679232658520443586434690684476541286045694678568919576) [(2, 1), (7, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1987 for generator 9. -/
theorem ep_Q1_009_partial_09_1987_valid :
    mulPoly ep_Q1_009_coefficient_09_1987
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1987 := by
  native_decide

/-- Coefficient term 1988 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1988 : Poly :=
[
  term ((449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 2), (8, 1), (12, 1)]
]

/-- Partial product 1988 for generator 9. -/
def ep_Q1_009_partial_09_1988 : Poly :=
[
  term ((449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (7, 2), (8, 1), (12, 1)],
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 2), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1988 for generator 9. -/
theorem ep_Q1_009_partial_09_1988_valid :
    mulPoly ep_Q1_009_coefficient_09_1988
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1988 := by
  native_decide

/-- Coefficient term 1989 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1989 : Poly :=
[
  term ((1827591754342139974266163815549484776537733487462655411897745874283491964175071035824218114025 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(7, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1989 for generator 9. -/
def ep_Q1_009_partial_09_1989 : Poly :=
[
  term ((1827591754342139974266163815549484776537733487462655411897745874283491964175071035824218114025 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(2, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1827591754342139974266163815549484776537733487462655411897745874283491964175071035824218114025 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(7, 2), (8, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1989 for generator 9. -/
theorem ep_Q1_009_partial_09_1989_valid :
    mulPoly ep_Q1_009_coefficient_09_1989
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1989 := by
  native_decide

/-- Coefficient term 1990 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1990 : Poly :=
[
  term ((14465411436265912319277990565541593315725120304523991768340716306610395958631184363984313217783 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 1990 for generator 9. -/
def ep_Q1_009_partial_09_1990 : Poly :=
[
  term ((14465411436265912319277990565541593315725120304523991768340716306610395958631184363984313217783 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (7, 2), (8, 1), (12, 1), (15, 2)],
  term ((-14465411436265912319277990565541593315725120304523991768340716306610395958631184363984313217783 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1990 for generator 9. -/
theorem ep_Q1_009_partial_09_1990_valid :
    mulPoly ep_Q1_009_coefficient_09_1990
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1990 := by
  native_decide

/-- Coefficient term 1991 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1991 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 123889374237557643968004945495343075524763080281814121931439450105736073397414568317455857024) [(7, 2), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1991 for generator 9. -/
def ep_Q1_009_partial_09_1991 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 61944687118778821984002472747671537762381540140907060965719725052868036698707284158727928512) [(2, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 123889374237557643968004945495343075524763080281814121931439450105736073397414568317455857024) [(7, 2), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1991 for generator 9. -/
theorem ep_Q1_009_partial_09_1991_valid :
    mulPoly ep_Q1_009_coefficient_09_1991
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1991 := by
  native_decide

/-- Coefficient term 1992 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1992 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 2), (8, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1992 for generator 9. -/
def ep_Q1_009_partial_09_1992 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(2, 1), (7, 2), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 2), (8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1992 for generator 9. -/
theorem ep_Q1_009_partial_09_1992_valid :
    mulPoly ep_Q1_009_coefficient_09_1992
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1992 := by
  native_decide

/-- Coefficient term 1993 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1993 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1993 for generator 9. -/
def ep_Q1_009_partial_09_1993 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1993 for generator 9. -/
theorem ep_Q1_009_partial_09_1993_valid :
    mulPoly ep_Q1_009_coefficient_09_1993
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1993 := by
  native_decide

/-- Coefficient term 1994 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1994 : Poly :=
[
  term ((252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 2), (8, 1), (14, 1)]
]

/-- Partial product 1994 for generator 9. -/
def ep_Q1_009_partial_09_1994 : Poly :=
[
  term ((252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(2, 1), (7, 2), (8, 1), (14, 1)],
  term ((-252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 2), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1994 for generator 9. -/
theorem ep_Q1_009_partial_09_1994_valid :
    mulPoly ep_Q1_009_coefficient_09_1994
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1994 := by
  native_decide

/-- Coefficient term 1995 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1995 : Poly :=
[
  term ((365769518703372234287905464520540396547836375353670554982266312370886242662335044132267305365 : Rat) / 61944687118778821984002472747671537762381540140907060965719725052868036698707284158727928512) [(7, 2), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 1995 for generator 9. -/
def ep_Q1_009_partial_09_1995 : Poly :=
[
  term ((365769518703372234287905464520540396547836375353670554982266312370886242662335044132267305365 : Rat) / 30972343559389410992001236373835768881190770070453530482859862526434018349353642079363964256) [(2, 1), (7, 2), (8, 1), (14, 1), (15, 2)],
  term ((-365769518703372234287905464520540396547836375353670554982266312370886242662335044132267305365 : Rat) / 61944687118778821984002472747671537762381540140907060965719725052868036698707284158727928512) [(7, 2), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1995 for generator 9. -/
theorem ep_Q1_009_partial_09_1995_valid :
    mulPoly ep_Q1_009_coefficient_09_1995
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1995 := by
  native_decide

/-- Coefficient term 1996 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1996 : Poly :=
[
  term ((-3874494519205336745444267288964907726259994993420829473223221253481002964051150595947342401733 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (15, 2)]
]

/-- Partial product 1996 for generator 9. -/
def ep_Q1_009_partial_09_1996 : Poly :=
[
  term ((-3874494519205336745444267288964907726259994993420829473223221253481002964051150595947342401733 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (7, 2), (8, 1), (15, 2)],
  term ((3874494519205336745444267288964907726259994993420829473223221253481002964051150595947342401733 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1996 for generator 9. -/
theorem ep_Q1_009_partial_09_1996_valid :
    mulPoly ep_Q1_009_coefficient_09_1996
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1996 := by
  native_decide

/-- Coefficient term 1997 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1997 : Poly :=
[
  term ((1638772917629176131982267530927668170421617652518898085772335645164157022837939626949050269 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(7, 2), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 1997 for generator 9. -/
def ep_Q1_009_partial_09_1997 : Poly :=
[
  term ((1638772917629176131982267530927668170421617652518898085772335645164157022837939626949050269 : Rat) / 1185866953408114534758566583109094881668827344318159344591277201847083609268908465464593760) [(2, 1), (7, 2), (9, 1), (11, 1), (12, 1)],
  term ((-1638772917629176131982267530927668170421617652518898085772335645164157022837939626949050269 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(7, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1997 for generator 9. -/
theorem ep_Q1_009_partial_09_1997_valid :
    mulPoly ep_Q1_009_coefficient_09_1997
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1997 := by
  native_decide

/-- Coefficient term 1998 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1998 : Poly :=
[
  term ((-99661217992632671537946512677712192000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1998 for generator 9. -/
def ep_Q1_009_partial_09_1998 : Poly :=
[
  term ((-199322435985265343075893025355424384000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((99661217992632671537946512677712192000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1998 for generator 9. -/
theorem ep_Q1_009_partial_09_1998_valid :
    mulPoly ep_Q1_009_coefficient_09_1998
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1998 := by
  native_decide

/-- Coefficient term 1999 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1999 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 296466738352028633689641645777273720417206836079539836147819300461770902317227116366148440) [(7, 2), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1999 for generator 9. -/
def ep_Q1_009_partial_09_1999 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 148233369176014316844820822888636860208603418039769918073909650230885451158613558183074220) [(2, 1), (7, 2), (9, 1), (11, 1), (14, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 296466738352028633689641645777273720417206836079539836147819300461770902317227116366148440) [(7, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1999 for generator 9. -/
theorem ep_Q1_009_partial_09_1999_valid :
    mulPoly ep_Q1_009_coefficient_09_1999
        ep_Q1_009_generator_09_1900_1999 =
      ep_Q1_009_partial_09_1999 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_09_1900_1999 : List Poly :=
[
  ep_Q1_009_partial_09_1900,
  ep_Q1_009_partial_09_1901,
  ep_Q1_009_partial_09_1902,
  ep_Q1_009_partial_09_1903,
  ep_Q1_009_partial_09_1904,
  ep_Q1_009_partial_09_1905,
  ep_Q1_009_partial_09_1906,
  ep_Q1_009_partial_09_1907,
  ep_Q1_009_partial_09_1908,
  ep_Q1_009_partial_09_1909,
  ep_Q1_009_partial_09_1910,
  ep_Q1_009_partial_09_1911,
  ep_Q1_009_partial_09_1912,
  ep_Q1_009_partial_09_1913,
  ep_Q1_009_partial_09_1914,
  ep_Q1_009_partial_09_1915,
  ep_Q1_009_partial_09_1916,
  ep_Q1_009_partial_09_1917,
  ep_Q1_009_partial_09_1918,
  ep_Q1_009_partial_09_1919,
  ep_Q1_009_partial_09_1920,
  ep_Q1_009_partial_09_1921,
  ep_Q1_009_partial_09_1922,
  ep_Q1_009_partial_09_1923,
  ep_Q1_009_partial_09_1924,
  ep_Q1_009_partial_09_1925,
  ep_Q1_009_partial_09_1926,
  ep_Q1_009_partial_09_1927,
  ep_Q1_009_partial_09_1928,
  ep_Q1_009_partial_09_1929,
  ep_Q1_009_partial_09_1930,
  ep_Q1_009_partial_09_1931,
  ep_Q1_009_partial_09_1932,
  ep_Q1_009_partial_09_1933,
  ep_Q1_009_partial_09_1934,
  ep_Q1_009_partial_09_1935,
  ep_Q1_009_partial_09_1936,
  ep_Q1_009_partial_09_1937,
  ep_Q1_009_partial_09_1938,
  ep_Q1_009_partial_09_1939,
  ep_Q1_009_partial_09_1940,
  ep_Q1_009_partial_09_1941,
  ep_Q1_009_partial_09_1942,
  ep_Q1_009_partial_09_1943,
  ep_Q1_009_partial_09_1944,
  ep_Q1_009_partial_09_1945,
  ep_Q1_009_partial_09_1946,
  ep_Q1_009_partial_09_1947,
  ep_Q1_009_partial_09_1948,
  ep_Q1_009_partial_09_1949,
  ep_Q1_009_partial_09_1950,
  ep_Q1_009_partial_09_1951,
  ep_Q1_009_partial_09_1952,
  ep_Q1_009_partial_09_1953,
  ep_Q1_009_partial_09_1954,
  ep_Q1_009_partial_09_1955,
  ep_Q1_009_partial_09_1956,
  ep_Q1_009_partial_09_1957,
  ep_Q1_009_partial_09_1958,
  ep_Q1_009_partial_09_1959,
  ep_Q1_009_partial_09_1960,
  ep_Q1_009_partial_09_1961,
  ep_Q1_009_partial_09_1962,
  ep_Q1_009_partial_09_1963,
  ep_Q1_009_partial_09_1964,
  ep_Q1_009_partial_09_1965,
  ep_Q1_009_partial_09_1966,
  ep_Q1_009_partial_09_1967,
  ep_Q1_009_partial_09_1968,
  ep_Q1_009_partial_09_1969,
  ep_Q1_009_partial_09_1970,
  ep_Q1_009_partial_09_1971,
  ep_Q1_009_partial_09_1972,
  ep_Q1_009_partial_09_1973,
  ep_Q1_009_partial_09_1974,
  ep_Q1_009_partial_09_1975,
  ep_Q1_009_partial_09_1976,
  ep_Q1_009_partial_09_1977,
  ep_Q1_009_partial_09_1978,
  ep_Q1_009_partial_09_1979,
  ep_Q1_009_partial_09_1980,
  ep_Q1_009_partial_09_1981,
  ep_Q1_009_partial_09_1982,
  ep_Q1_009_partial_09_1983,
  ep_Q1_009_partial_09_1984,
  ep_Q1_009_partial_09_1985,
  ep_Q1_009_partial_09_1986,
  ep_Q1_009_partial_09_1987,
  ep_Q1_009_partial_09_1988,
  ep_Q1_009_partial_09_1989,
  ep_Q1_009_partial_09_1990,
  ep_Q1_009_partial_09_1991,
  ep_Q1_009_partial_09_1992,
  ep_Q1_009_partial_09_1993,
  ep_Q1_009_partial_09_1994,
  ep_Q1_009_partial_09_1995,
  ep_Q1_009_partial_09_1996,
  ep_Q1_009_partial_09_1997,
  ep_Q1_009_partial_09_1998,
  ep_Q1_009_partial_09_1999
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_09_1900_1999 : Poly :=
[
  term ((113715471855093452906978 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((656389401261822078060268411084242368000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 295688348967475210518767400834342055953358869796411841459222072051687729325995668693652889690003942868635164746560) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((-17780568643587120202832 : Rat) / 1558779625948348837707) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5724065444710636538816439015843104639331414877840842913083347262066267385137928730988268603330688864473905554657861 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-2222571080448390025354 : Rat) / 1558779625948348837707) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((42957421548548565318080393395565600000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 3)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(2, 1), (7, 1), (9, 1), (13, 2)],
  term ((-621603520480032325924308373800149995677165316472685480810196279200197491421287444704812171 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(2, 1), (7, 1), (9, 1), (13, 2), (14, 1)],
  term ((189012654813613687399553730940488640000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (13, 2), (14, 1), (15, 2)],
  term ((17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (13, 2), (15, 2)],
  term ((-72507725762694827100214607681753106577416597957019405623442157594325755852931961418004243826174786469275323464681 : Rat) / 662769387942367298469551838804955401569536219205349975602921325650825296006154267376240147800940438608645345280) [(2, 1), (7, 1), (9, 1), (14, 1)],
  term ((43826462758819780675922011372113941898143777162515649742080078775651190063208728421246331437639752358370510754268021 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((-16970193732777991864678 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((120523830792108908005543 : Rat) / 2078372834597798450276) [(2, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((1985437721453088787092654768171118380753620515650332578907523459927556742310271456547158017520559108903351108657 : Rat) / 5523078232853060820579598656707961679746135160044583130024344380423544133384618894802001231674503655072044544) [(2, 1), (7, 1), (9, 1), (14, 2)],
  term ((13738247696022625243703140751294108316800 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (7, 1), (9, 1), (14, 2), (15, 2)],
  term ((-863098003264321980008230 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (14, 2), (16, 1)],
  term ((-86728337733013185152788133484391011637922168213464201096468980691320993711942024546321416997101961351678635836951 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(2, 1), (7, 1), (9, 1), (14, 3)],
  term ((39888011536839334690302 : Rat) / 519593208649449612569) [(2, 1), (7, 1), (9, 1), (14, 3), (16, 1)],
  term ((155869837778999764758472491289352060426950775843121314446661054867337402806329702434295508864404984620224883267292997 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(2, 1), (7, 1), (9, 1), (15, 2)],
  term ((-5006030825800898647247 : Rat) / 275078757520296853713) [(2, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-26633601360100110497209843905250672000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (15, 4)],
  term ((4370314146020811289561 : Rat) / 12470237007586790701656) [(2, 1), (7, 1), (9, 1), (16, 1)],
  term ((-84957268227699516213673086560512011742114530360981698006114865526839570605372858381260251767378161 : Rat) / 759494117102930558147595599789103667767970335371734773967943018875797819794434254886913275995840) [(2, 1), (7, 1), (11, 1), (12, 1)],
  term ((980430161414404512396818536608232686498070671692343963172149005399809989288649673262778805163485 : Rat) / 45724645825584594827253204477099098365622703864216685371539426646604154457011858202375391105872) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((11480600 : Rat) / 3536493) [(2, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3058121186311029003090229031528768894493461012213422420120077802441473398242392340442762989030761250222542309131 : Rat) / 52537342103943781366599003922815049037657724716157665768789620697517729802615492010902727986365276206188838112) [(2, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((3832031695001481876566 : Rat) / 290243508153948313977) [(2, 1), (7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-265169728 : Rat) / 24755451) [(2, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-1359149678142594416952475150215728105429566274417443282331557700281174219118980271001467010788815 : Rat) / 18827795339946597870045437137629040503491701591148046917692705089778181247004882789213396337712) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2296120 : Rat) / 208029) [(2, 1), (7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6661779380315227415517201882065782993211710928502244818784802349786862626509421764289985273935624961 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-4134281664369246 : Rat) / 1395206957462413) [(2, 1), (7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3580960609 : Rat) / 16503634) [(2, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1713698872338238717563212726257972270277520486294183875267285892918445482366183832704082218013226683 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (7, 1), (12, 1), (13, 1)],
  term ((34745072535667721658586049959983427563568987128505423166143171131699638151 : Rat) / 35622868673419316246598200872926664165078071773945160666821944279770332080) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((924105492537516374599662832569600 : Rat) / 24049240021528595265061175145067379) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-948957187615194577319156994100971736175100593637779906490876742550586656874171961028240965857764197585351562593 : Rat) / 11674964911987506970355334205070010897257272159146147948619915710559495511692331557978383996970061379153075136) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1040373182188484921060 : Rat) / 96747836051316104659) [(2, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2223353269 : Rat) / 49510902) [(2, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((571976585098825659278420341933200 : Rat) / 24049240021528595265061175145067379) [(2, 1), (7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-9538009541800353642286150745694987876527846494600877345038914734771400713651490411320074751596665340960252107106931 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-297935861901283415393215 : Rat) / 4063409114155276395678) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((54974226525505507729609282353922775592080259117782601455369928605360183425294794409433677284333037 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((15844788802882 : Rat) / 82070997497789) [(2, 1), (7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1984438144139506386827075721890458670687348194005253816935256136956950413159704773327119067058794675296722132267067 : Rat) / 1838806973638032347830965137298526716318020365065518301907636724413120543091542220381595479522784667216609333920) [(2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-199629260151749823610048 : Rat) / 2031704557077638197839) [(2, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1093620882616811136218587792898881150308834736110172004672733107528392613151830173674869582262337852979889508165 : Rat) / 5003556390851788701580857516458576098824545211062634835122821018811212362153856381990735998701454876779889344) [(2, 1), (7, 1), (12, 1), (15, 3)],
  term ((-11670369469477811288462 : Rat) / 290243508153948313977) [(2, 1), (7, 1), (12, 1), (15, 3), (16, 1)],
  term ((662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 209546286314231272038812946311333318618106304552618592157776142822178424) [(2, 1), (7, 1), (12, 2), (13, 1)],
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 142535977414811439821655628464178362087681092443638696) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1325572990614938 : Rat) / 1395206957462413) [(2, 1), (7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2495743743953107770883462524728011865801691539332278201281129966567449959904240331071545192111815351227698424145293 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((-71384300668089807455119 : Rat) / 2031704557077638197839) [(2, 1), (7, 1), (12, 2), (15, 1), (16, 1)],
  term ((9308218533879920831283070162540747646740131749407218886607862216148237908341059942748160502802731 : Rat) / 84388235233658950905288399976567074196441148374637197107549224319533091088270472765212586221760) [(2, 1), (7, 1), (13, 1)],
  term ((-1651061072179824141548815949224782356773406528226586349631133514244333729099196588686914296106517547 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((7004973195640297977429345013015232268213031048978037186740444691355488700306432190422429536843812415136354726199 : Rat) / 35024894735962520911066002615210032691771816477438443845859747131678486535076994673935151990910184137459225408) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((9786747806659234318432 : Rat) / 290243508153948313977) [(2, 1), (7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2554179101 : Rat) / 49510902) [(2, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((9324569826366553992132893227610844132112054775302297478069615232003791359698543843082209447172917 : Rat) / 21097058808414737726322099994141768549110287093659299276887306079883272772067618191303146555440) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 63575628181339442486601007174807452342195040668907943386213932048572973599996984342021434911943149) [(2, 1), (7, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1497007033121808 : Rat) / 1395206957462413) [(2, 1), (7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((355549608 : Rat) / 8251817) [(2, 1), (7, 1), (13, 1), (14, 2), (16, 1)],
  term ((133142424625823710103178172449863060699313550862182023511603041960653458016235073029239712442005966448212591103 : Rat) / 10007112781703577403161715032917152197649090422125269670245642037622424724307712763981471997402909753559778688) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((549962574159035671321 : Rat) / 290243508153948313977) [(2, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((88887402 : Rat) / 8251817) [(2, 1), (7, 1), (13, 1), (16, 1)],
  term ((74857136969348571450631300753393252549671842000940268275801119563828278864110782818096696297264505 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1)],
  term ((31571650 : Rat) / 3536493) [(2, 1), (7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1863115912374024948789642807600000 : Rat) / 24049240021528595265061175145067379) [(2, 1), (7, 1), (13, 2), (14, 2), (15, 1)],
  term ((969331336860073099156372348514969896403554490004982994095240941577661487890699612847460780917725 : Rat) / 182898583302338379309012817908396393462490815456866741486157706586416617828047432809501564423488) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((2870150 : Rat) / 3536493) [(2, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1468593784584407152515643905176566026985277740801749476801995541615316093523002581798527557428589303824477423120267 : Rat) / 817247543839125487924873394354900762808009051140230356403394099739164685818463209058486879787904296540715259520) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((-1433728295865093441193241 : Rat) / 8126818228310552791356) [(2, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((493518740573594331488581682822153815936238740983478748762411434890100985600794213122836606706130225 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (7, 1), (14, 1), (15, 3)],
  term ((-1551375598657274 : Rat) / 1395206957462413) [(2, 1), (7, 1), (14, 1), (15, 3), (16, 1)],
  term ((17648973538483655619069121892664154605907444411772823878099581610204747674200010449052536119225502799116565135955603 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((404086751483420451748987 : Rat) / 4063409114155276395678) [(2, 1), (7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-684420690243799178045620294414987917064283018594087467 : Rat) / 142535977414811439821655628464178362087681092443638696) [(2, 1), (7, 1), (14, 3), (15, 1)],
  term ((7510096328668466 : Rat) / 1395206957462413) [(2, 1), (7, 1), (14, 3), (15, 1), (16, 1)],
  term ((6704773620788751123539563496354524577028246053097460354157559518373349075088132341404916359372643591635188360871919 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(2, 1), (7, 1), (15, 1)],
  term ((312609792414713802718085 : Rat) / 16253636456621105582712) [(2, 1), (7, 1), (15, 1), (16, 1)],
  term ((-2848120406845402898300808471125697598526774372831798455971016661371820354639103502761984797067535320123685286429 : Rat) / 420298736831550250932792031382520392301261797729261326150316965580141838420923936087221823890922209649510704896) [(2, 1), (7, 1), (15, 3)],
  term ((-1690100917409539859359 : Rat) / 580487016307896627954) [(2, 1), (7, 1), (15, 3), (16, 1)],
  term ((8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 890571716835482906164955021823166604126951794348629016670548606994258302) [(2, 1), (7, 2)],
  term ((-2120006435036882370148750026037402340783770845456680277801385214168850678443082401556093012269 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(2, 1), (7, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 69687773008626174732002781841130479982679232658520443586434690684476541286045694678568919576) [(2, 1), (7, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (7, 2), (8, 1), (12, 1)],
  term ((1827591754342139974266163815549484776537733487462655411897745874283491964175071035824218114025 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(2, 1), (7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((14465411436265912319277990565541593315725120304523991768340716306610395958631184363984313217783 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (7, 2), (8, 1), (12, 1), (15, 2)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 61944687118778821984002472747671537762381540140907060965719725052868036698707284158727928512) [(2, 1), (7, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(2, 1), (7, 2), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (7, 2), (8, 1), (13, 1), (15, 1)],
  term ((252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(2, 1), (7, 2), (8, 1), (14, 1)],
  term ((365769518703372234287905464520540396547836375353670554982266312370886242662335044132267305365 : Rat) / 30972343559389410992001236373835768881190770070453530482859862526434018349353642079363964256) [(2, 1), (7, 2), (8, 1), (14, 1), (15, 2)],
  term ((-3874494519205336745444267288964907726259994993420829473223221253481002964051150595947342401733 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (7, 2), (8, 1), (15, 2)],
  term ((1638772917629176131982267530927668170421617652518898085772335645164157022837939626949050269 : Rat) / 1185866953408114534758566583109094881668827344318159344591277201847083609268908465464593760) [(2, 1), (7, 2), (9, 1), (11, 1), (12, 1)],
  term ((-199322435985265343075893025355424384000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 148233369176014316844820822888636860208603418039769918073909650230885451158613558183074220) [(2, 1), (7, 2), (9, 1), (11, 1), (14, 1)],
  term ((-56857735927546726453489 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-328194700630911039030134205542121184000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 3)],
  term ((-6324881719539831263689574105615130198168411430588637660637587426068506160606897024808106001830438986629531380588161 : Rat) / 591376697934950421037534801668684111906717739592823682918444144103375458651991337387305779380007885737270329493120) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1)],
  term ((8890284321793560101416 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5724065444710636538816439015843104639331414877840842913083347262066267385137928730988268603330688864473905554657861 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((1111285540224195012677 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-21478710774274282659040196697782800000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (13, 1), (15, 3)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 948693562726491627806853266487275905335061875454527475673021761477666887415126772371675008) [(7, 1), (9, 1), (13, 2)],
  term ((621603520480032325924308373800149995677165316472685480810196279200197491421287444704812171 : Rat) / 948693562726491627806853266487275905335061875454527475673021761477666887415126772371675008) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((-94506327406806843699776865470244320000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (13, 2), (14, 1), (15, 2)],
  term ((-8591484309709713063616078679113120000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (13, 2), (15, 2)],
  term ((72507725762694827100214607681753106577416597957019405623442157594325755852931961418004243826174786469275323464681 : Rat) / 1325538775884734596939103677609910803139072438410699951205842651301650592012308534752480295601880877217290690560) [(7, 1), (9, 1), (14, 1)],
  term ((-43826462758819780675922011372113941898143777162515649742080078775651190063208728421246331437639752358370510754268021 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 1), (9, 1), (14, 1), (15, 2)],
  term ((8485096866388995932339 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-120523830792108908005543 : Rat) / 4156745669195596900552) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1985437721453088787092654768171118380753620515650332578907523459927556742310271456547158017520559108903351108657 : Rat) / 11046156465706121641159197313415923359492270320089166260048688760847088266769237789604002463349007310144089088) [(7, 1), (9, 1), (14, 2)],
  term ((-6869123848011312621851570375647054158400 : Rat) / 15008818057315716433186233612759665357973) [(7, 1), (9, 1), (14, 2), (15, 2)],
  term ((431549001632160990004115 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (14, 2), (16, 1)],
  term ((86728337733013185152788133484391011637922168213464201096468980691320993711942024546321416997101961351678635836951 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(7, 1), (9, 1), (14, 3)],
  term ((-19944005768419667345151 : Rat) / 519593208649449612569) [(7, 1), (9, 1), (14, 3), (16, 1)],
  term ((-155869837778999764758472491289352060426950775843121314446661054867337402806329702434295508864404984620224883267292997 : Rat) / 9462027166959206736600556826698945790507483833485178926695106305654007338431861398196892470080126171796325271889920) [(7, 1), (9, 1), (15, 2)],
  term ((5006030825800898647247 : Rat) / 550157515040593707426) [(7, 1), (9, 1), (15, 2), (16, 1)],
  term ((13316800680050055248604921952625336000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (15, 4)],
  term ((-4370314146020811289561 : Rat) / 24940474015173581403312) [(7, 1), (9, 1), (16, 1)],
  term ((84957268227699516213673086560512011742114530360981698006114865526839570605372858381260251767378161 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(7, 1), (11, 1), (12, 1)],
  term ((-980430161414404512396818536608232686498070671692343963172149005399809989288649673262778805163485 : Rat) / 91449291651169189654506408954198196731245407728433370743078853293208308914023716404750782211744) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5740300 : Rat) / 3536493) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3058121186311029003090229031528768894493461012213422420120077802441473398242392340442762989030761250222542309131 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1916015847500740938283 : Rat) / 290243508153948313977) [(7, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((132584864 : Rat) / 24755451) [(7, 1), (11, 1), (12, 1), (16, 1)],
  term ((1359149678142594416952475150215728105429566274417443282331557700281174219118980271001467010788815 : Rat) / 37655590679893195740090874275258081006983403182296093835385410179556362494009765578426792675424) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1148060 : Rat) / 208029) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6661779380315227415517201882065782993211710928502244818784802349786862626509421764289985273935624961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(7, 1), (11, 1), (14, 1)],
  term ((-1310030566858894467252019011895171114441065272115638440997579140968493838924824636687862896482339811 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((2067140832184623 : Rat) / 1395206957462413) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((3580960609 : Rat) / 33007268) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((1713698872338238717563212726257972270277520486294183875267285892918445482366183832704082218013226683 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(7, 1), (12, 1), (13, 1)],
  term ((-34745072535667721658586049959983427563568987128505423166143171131699638151 : Rat) / 71245737346838632493196401745853328330156143547890321333643888559540664160) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-462052746268758187299831416284800 : Rat) / 24049240021528595265061175145067379) [(7, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((948957187615194577319156994100971736175100593637779906490876742550586656874171961028240965857764197585351562593 : Rat) / 23349929823975013940710668410140021794514544318292295897239831421118991023384663115956767993940122758306150272) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((520186591094242460530 : Rat) / 96747836051316104659) [(7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((2223353269 : Rat) / 99021804) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-285988292549412829639210170966600 : Rat) / 24049240021528595265061175145067379) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((9538009541800353642286150745694987876527846494600877345038914734771400713651490411320074751596665340960252107106931 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((297935861901283415393215 : Rat) / 8126818228310552791356) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54974226525505507729609282353922775592080259117782601455369928605360183425294794409433677284333037 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-7922394401441 : Rat) / 82070997497789) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1984438144139506386827075721890458670687348194005253816935256136956950413159704773327119067058794675296722132267067 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(7, 1), (12, 1), (15, 1)],
  term ((99814630075874911805024 : Rat) / 2031704557077638197839) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((1093620882616811136218587792898881150308834736110172004672733107528392613151830173674869582262337852979889508165 : Rat) / 10007112781703577403161715032917152197649090422125269670245642037622424724307712763981471997402909753559778688) [(7, 1), (12, 1), (15, 3)],
  term ((5835184734738905644231 : Rat) / 290243508153948313977) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 419092572628462544077625892622666637236212609105237184315552285644356848) [(7, 1), (12, 2), (13, 1)],
  term ((-81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((662786495307469 : Rat) / 1395206957462413) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2495743743953107770883462524728011865801691539332278201281129966567449959904240331071545192111815351227698424145293 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(7, 1), (12, 2), (15, 1)],
  term ((71384300668089807455119 : Rat) / 4063409114155276395678) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-9308218533879920831283070162540747646740131749407218886607862216148237908341059942748160502802731 : Rat) / 168776470467317901810576799953134148392882296749274394215098448639066182176540945530425172443520) [(7, 1), (13, 1)],
  term ((1651061072179824141548815949224782356773406528226586349631133514244333729099196588686914296106517547 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(7, 1), (13, 1), (14, 1)],
  term ((-7004973195640297977429345013015232268213031048978037186740444691355488700306432190422429536843812415136354726199 : Rat) / 70049789471925041822132005230420065383543632954876887691719494263356973070153989347870303981820368274918450816) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4893373903329617159216 : Rat) / 290243508153948313977) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((2554179101 : Rat) / 99021804) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-9324569826366553992132893227610844132112054775302297478069615232003791359698543843082209447172917 : Rat) / 42194117616829475452644199988283537098220574187318598553774612159766545544135236382606293110880) [(7, 1), (13, 1), (14, 2)],
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((748503516560904 : Rat) / 1395206957462413) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-177774804 : Rat) / 8251817) [(7, 1), (13, 1), (14, 2), (16, 1)],
  term ((-133142424625823710103178172449863060699313550862182023511603041960653458016235073029239712442005966448212591103 : Rat) / 20014225563407154806323430065834304395298180844250539340491284075244849448615425527962943994805819507119557376) [(7, 1), (13, 1), (15, 2)],
  term ((-549962574159035671321 : Rat) / 580487016307896627954) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-44443701 : Rat) / 8251817) [(7, 1), (13, 1), (16, 1)],
  term ((-74857136969348571450631300753393252549671842000940268275801119563828278864110782818096696297264505 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-15785825 : Rat) / 3536493) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((931557956187012474394821403800000 : Rat) / 24049240021528595265061175145067379) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((-969331336860073099156372348514969896403554490004982994095240941577661487890699612847460780917725 : Rat) / 365797166604676758618025635816792786924981630913733482972315413172833235656094865619003128846976) [(7, 1), (13, 2), (15, 1)],
  term ((-1435075 : Rat) / 3536493) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1468593784584407152515643905176566026985277740801749476801995541615316093523002581798527557428589303824477423120267 : Rat) / 1634495087678250975849746788709801525616018102280460712806788199478329371636926418116973759575808593081430519040) [(7, 1), (14, 1), (15, 1)],
  term ((1433728295865093441193241 : Rat) / 16253636456621105582712) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-493518740573594331488581682822153815936238740983478748762411434890100985600794213122836606706130225 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(7, 1), (14, 1), (15, 3)],
  term ((775687799328637 : Rat) / 1395206957462413) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((-17648973538483655619069121892664154605907444411772823878099581610204747674200010449052536119225502799116565135955603 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(7, 1), (14, 2), (15, 1)],
  term ((-404086751483420451748987 : Rat) / 8126818228310552791356) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((684420690243799178045620294414987917064283018594087467 : Rat) / 285071954829622879643311256928356724175362184887277392) [(7, 1), (14, 3), (15, 1)],
  term ((-3755048164334233 : Rat) / 1395206957462413) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((-6704773620788751123539563496354524577028246053097460354157559518373349075088132341404916359372643591635188360871919 : Rat) / 58841823156417035130590884393552854922176651682096585661044375181219857378929351052211055344729109350931498685440) [(7, 1), (15, 1)],
  term ((-312609792414713802718085 : Rat) / 32507272913242211165424) [(7, 1), (15, 1), (16, 1)],
  term ((2848120406845402898300808471125697598526774372831798455971016661371820354639103502761984797067535320123685286429 : Rat) / 840597473663100501865584062765040784602523595458522652300633931160283676841847872174443647781844419299021409792) [(7, 1), (15, 3)],
  term ((1690100917409539859359 : Rat) / 1160974032615793255908) [(7, 1), (15, 3), (16, 1)],
  term ((-8419695923510322705928972921500055374497826073117976267729155934046875 : Rat) / 1781143433670965812329910043646333208253903588697258033341097213988516604) [(7, 2)],
  term ((2120006435036882370148750026037402340783770845456680277801385214168850678443082401556093012269 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 2), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 2), (8, 1), (12, 1)],
  term ((-1827591754342139974266163815549484776537733487462655411897745874283491964175071035824218114025 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(7, 2), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((-14465411436265912319277990565541593315725120304523991768340716306610395958631184363984313217783 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (12, 1), (15, 2)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 123889374237557643968004945495343075524763080281814121931439450105736073397414568317455857024) [(7, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 2), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((-252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 2), (8, 1), (14, 1)],
  term ((-365769518703372234287905464520540396547836375353670554982266312370886242662335044132267305365 : Rat) / 61944687118778821984002472747671537762381540140907060965719725052868036698707284158727928512) [(7, 2), (8, 1), (14, 1), (15, 2)],
  term ((3874494519205336745444267288964907726259994993420829473223221253481002964051150595947342401733 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (15, 2)],
  term ((-1638772917629176131982267530927668170421617652518898085772335645164157022837939626949050269 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(7, 2), (9, 1), (11, 1), (12, 1)],
  term ((99661217992632671537946512677712192000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 296466738352028633689641645777273720417206836079539836147819300461770902317227116366148440) [(7, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 1900 through 1999. -/
theorem ep_Q1_009_block_09_1900_1999_valid :
    checkProductSumEq ep_Q1_009_partials_09_1900_1999
      ep_Q1_009_block_09_1900_1999 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
