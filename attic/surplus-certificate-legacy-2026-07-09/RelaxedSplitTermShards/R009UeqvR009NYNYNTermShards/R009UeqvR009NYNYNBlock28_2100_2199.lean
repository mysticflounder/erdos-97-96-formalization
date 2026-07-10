/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:2100-2199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 2100 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2100 : Poly :=
[
  term ((-6132594399649006915426674170944163645559609160526159526854594822294299740001 : Rat) / 94156312623157464468342217195001390874237538928789963518659314627631708000) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 2100 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2100 : Poly :=
[
  term ((-6132594399649006915426674170944163645559609160526159526854594822294299740001 : Rat) / 47078156311578732234171108597500695437118769464394981759329657313815854000) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((6132594399649006915426674170944163645559609160526159526854594822294299740001 : Rat) / 94156312623157464468342217195001390874237538928789963518659314627631708000) [(9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2100 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2100_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2100
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2100 := by
  native_decide

/-- Coefficient term 2101 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2101 : Poly :=
[
  term ((2208883657049036114958 : Rat) / 4339258264657398321155) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 2101 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2101 : Poly :=
[
  term ((4417767314098072229916 : Rat) / 4339258264657398321155) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2208883657049036114958 : Rat) / 4339258264657398321155) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2101 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2101_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2101
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2101 := by
  native_decide

/-- Coefficient term 2102 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2102 : Poly :=
[
  term ((8545727781554139364989223 : Rat) / 1010179324012242329164884) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 2102 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2102 : Poly :=
[
  term ((8545727781554139364989223 : Rat) / 505089662006121164582442) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-8545727781554139364989223 : Rat) / 1010179324012242329164884) [(9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2102 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2102_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2102
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2102 := by
  native_decide

/-- Coefficient term 2103 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2103 : Poly :=
[
  term ((56593643325478482346282909575800498905072223877032845742228086176595102987301 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 2103 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2103 : Poly :=
[
  term ((-56593643325478482346282909575800498905072223877032845742228086176595102987301 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((56593643325478482346282909575800498905072223877032845742228086176595102987301 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(9, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2103 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2103_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2103
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2103 := by
  native_decide

/-- Coefficient term 2104 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2104 : Poly :=
[
  term ((1278136356737923245271 : Rat) / 619894037808199760165) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2104 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2104 : Poly :=
[
  term ((-1278136356737923245271 : Rat) / 619894037808199760165) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((2556272713475846490542 : Rat) / 619894037808199760165) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2104 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2104_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2104
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2104 := by
  native_decide

/-- Coefficient term 2105 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2105 : Poly :=
[
  term ((-21605604603670849337118718465601737354560491371146044933730845383812485580533 : Rat) / 282468937869472393405026651585004172622712616786369890555977943882895124000) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 2105 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2105 : Poly :=
[
  term ((-21605604603670849337118718465601737354560491371146044933730845383812485580533 : Rat) / 141234468934736196702513325792502086311356308393184945277988971941447562000) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((21605604603670849337118718465601737354560491371146044933730845383812485580533 : Rat) / 282468937869472393405026651585004172622712616786369890555977943882895124000) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2105 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2105_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2105
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2105 := by
  native_decide

/-- Coefficient term 2106 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2106 : Poly :=
[
  term ((-1838523912825453519047 : Rat) / 1735703305862959328462) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 2106 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2106 : Poly :=
[
  term ((-1838523912825453519047 : Rat) / 867851652931479664231) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1838523912825453519047 : Rat) / 1735703305862959328462) [(9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2106 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2106_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2106
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2106 := by
  native_decide

/-- Coefficient term 2107 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2107 : Poly :=
[
  term ((15013978582066542386539039433373095440459355535322399584631016611 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(9, 1), (13, 3)]
]

/-- Partial product 2107 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2107 : Poly :=
[
  term ((-15013978582066542386539039433373095440459355535322399584631016611 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(9, 1), (13, 3)],
  term ((15013978582066542386539039433373095440459355535322399584631016611 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(9, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2107 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2107_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2107
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2107 := by
  native_decide

/-- Coefficient term 2108 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2108 : Poly :=
[
  term ((7525053824893269452645353119733526128533449248392122220833876131 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(9, 1), (13, 3), (14, 1)]
]

/-- Partial product 2108 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2108 : Poly :=
[
  term ((-7525053824893269452645353119733526128533449248392122220833876131 : Rat) / 1333560919758668836427101928318546269300330214734972969941941220) [(9, 1), (13, 3), (14, 1)],
  term ((7525053824893269452645353119733526128533449248392122220833876131 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(9, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2108 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2108_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2108
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2108 := by
  native_decide

/-- Coefficient term 2109 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2109 : Poly :=
[
  term ((1656419629152817119692 : Rat) / 13017774793972194963465) [(9, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 2109 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2109 : Poly :=
[
  term ((-1656419629152817119692 : Rat) / 13017774793972194963465) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((3312839258305634239384 : Rat) / 13017774793972194963465) [(9, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2109 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2109_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2109
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2109 := by
  native_decide

/-- Coefficient term 2110 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2110 : Poly :=
[
  term ((828209814576408559846 : Rat) / 13017774793972194963465) [(9, 1), (13, 3), (16, 1)]
]

/-- Partial product 2110 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2110 : Poly :=
[
  term ((1656419629152817119692 : Rat) / 13017774793972194963465) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((-828209814576408559846 : Rat) / 13017774793972194963465) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2110 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2110_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2110
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2110 := by
  native_decide

/-- Coefficient term 2111 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2111 : Poly :=
[
  term ((28089746568016262679428852532339752742095729004408271223331034880393007649914763 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 2111 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2111 : Poly :=
[
  term ((-28089746568016262679428852532339752742095729004408271223331034880393007649914763 : Rat) / 16322999980665035247665467556467790932934207290180248180600555511945282752000) [(9, 1), (14, 1), (15, 1)],
  term ((28089746568016262679428852532339752742095729004408271223331034880393007649914763 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2111 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2111_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2111
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2111 := by
  native_decide

/-- Coefficient term 2112 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2112 : Poly :=
[
  term ((2264102280380029055107 : Rat) / 64098215129500397370) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2112 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2112 : Poly :=
[
  term ((-2264102280380029055107 : Rat) / 64098215129500397370) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((2264102280380029055107 : Rat) / 32049107564750198685) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2112 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2112_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2112
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2112 := by
  native_decide

/-- Coefficient term 2113 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2113 : Poly :=
[
  term ((6382095262126246803408063525267405697444660845299854857068131971975247459435911438857 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 1), (15, 1)]
]

/-- Partial product 2113 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2113 : Poly :=
[
  term ((6382095262126246803408063525267405697444660845299854857068131971975247459435911438857 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 1), (14, 1), (15, 1)],
  term ((-6382095262126246803408063525267405697444660845299854857068131971975247459435911438857 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2113 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2113_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2113
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2113 := by
  native_decide

/-- Coefficient term 2114 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2114 : Poly :=
[
  term ((34108764298743990231797047 : Rat) / 3030537972036726987494652) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 2114 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2114 : Poly :=
[
  term ((34108764298743990231797047 : Rat) / 1515268986018363493747326) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34108764298743990231797047 : Rat) / 3030537972036726987494652) [(9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2114 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2114_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2114
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2114 := by
  native_decide

/-- Coefficient term 2115 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2115 : Poly :=
[
  term ((11645253806864154864606763004224707085954314204145419115215947790758233915413843178747 : Rat) / 30869796395434024019820969595310982727710245879872242475180880975302727616058368000) [(9, 2)]
]

/-- Partial product 2115 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2115 : Poly :=
[
  term ((-11645253806864154864606763004224707085954314204145419115215947790758233915413843178747 : Rat) / 30869796395434024019820969595310982727710245879872242475180880975302727616058368000) [(9, 2)],
  term ((11645253806864154864606763004224707085954314204145419115215947790758233915413843178747 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2115 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2115_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2115
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2115 := by
  native_decide

/-- Coefficient term 2116 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2116 : Poly :=
[
  term ((338486945624205787357086352191887534160083899053744403246272127813 : Rat) / 6350290094088899221081437753897839377620620070166537952104482000) [(9, 2), (10, 1)]
]

/-- Partial product 2116 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2116 : Poly :=
[
  term ((-338486945624205787357086352191887534160083899053744403246272127813 : Rat) / 6350290094088899221081437753897839377620620070166537952104482000) [(9, 2), (10, 1)],
  term ((338486945624205787357086352191887534160083899053744403246272127813 : Rat) / 3175145047044449610540718876948919688810310035083268976052241000) [(9, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2116 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2116_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2116
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2116 := by
  native_decide

/-- Coefficient term 2117 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2117 : Poly :=
[
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 2117 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2117 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2117 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2117_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2117
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2117 := by
  native_decide

/-- Coefficient term 2118 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2118 : Poly :=
[
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2118 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2118 : Poly :=
[
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2118 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2118_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2118
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2118 := by
  native_decide

/-- Coefficient term 2119 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2119 : Poly :=
[
  term ((-72441956025243530990329241987836235885407342432338578818671410145218976380617619 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(9, 2), (10, 1), (12, 1)]
]

/-- Partial product 2119 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2119 : Poly :=
[
  term ((72441956025243530990329241987836235885407342432338578818671410145218976380617619 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(9, 2), (10, 1), (12, 1)],
  term ((-72441956025243530990329241987836235885407342432338578818671410145218976380617619 : Rat) / 73978614828014819832776480050112592809888434336350274336610623502930232975600) [(9, 2), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2119 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2119_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2119
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2119 := by
  native_decide

/-- Coefficient term 2120 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2120 : Poly :=
[
  term ((80285586426198999337751309099722282423357 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 1), (14, 1)]
]

/-- Partial product 2120 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2120 : Poly :=
[
  term ((-80285586426198999337751309099722282423357 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2120 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2120_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2120
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2120 := by
  native_decide

/-- Coefficient term 2121 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2121 : Poly :=
[
  term ((-819547276398438027312 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 2121 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2121 : Poly :=
[
  term ((819547276398438027312 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1639094552796876054624 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2121 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2121_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2121
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2121 := by
  native_decide

/-- Coefficient term 2122 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2122 : Poly :=
[
  term ((-33392958838422925309378457 : Rat) / 3788172465045908734368315) [(9, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 2122 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2122 : Poly :=
[
  term ((-66785917676845850618756914 : Rat) / 3788172465045908734368315) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((33392958838422925309378457 : Rat) / 3788172465045908734368315) [(9, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2122 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2122_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2122
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2122 := by
  native_decide

/-- Coefficient term 2123 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2123 : Poly :=
[
  term ((-160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 2)]
]

/-- Partial product 2123 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2123 : Poly :=
[
  term ((160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 2)],
  term ((-321142345704795997351005236398889129693428 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2123 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2123_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2123
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2123 := by
  native_decide

/-- Coefficient term 2124 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2124 : Poly :=
[
  term ((1639094552796876054624 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 2), (16, 1)]
]

/-- Partial product 2124 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2124 : Poly :=
[
  term ((3278189105593752109248 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1639094552796876054624 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2124 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2124_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2124
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2124 := by
  native_decide

/-- Coefficient term 2125 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2125 : Poly :=
[
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 2125 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2125 : Poly :=
[
  term ((1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2125 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2125_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2125
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2125 := by
  native_decide

/-- Coefficient term 2126 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2126 : Poly :=
[
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2126 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2126 : Poly :=
[
  term ((-4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2126 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2126_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2126
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2126 := by
  native_decide

/-- Coefficient term 2127 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2127 : Poly :=
[
  term ((83026776232441756675126983795617821613280821042721241470947113980658676607422231 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(9, 2), (10, 1), (14, 1)]
]

/-- Partial product 2127 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2127 : Poly :=
[
  term ((-83026776232441756675126983795617821613280821042721241470947113980658676607422231 : Rat) / 295914459312059279331105920200450371239553737345401097346442494011720931902400) [(9, 2), (10, 1), (14, 1)],
  term ((83026776232441756675126983795617821613280821042721241470947113980658676607422231 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(9, 2), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2127 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2127_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2127
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2127 := by
  native_decide

/-- Coefficient term 2128 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2128 : Poly :=
[
  term ((31290866626764206234479487 : Rat) / 7576344930091817468736630) [(9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 2128 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2128 : Poly :=
[
  term ((-31290866626764206234479487 : Rat) / 7576344930091817468736630) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((31290866626764206234479487 : Rat) / 3788172465045908734368315) [(9, 2), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2128 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2128_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2128
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2128 := by
  native_decide

/-- Coefficient term 2129 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2129 : Poly :=
[
  term ((-1535661522999887085051 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (16, 1)]
]

/-- Partial product 2129 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2129 : Poly :=
[
  term ((-3071323045999774170102 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((1535661522999887085051 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2129 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2129_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2129
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2129 := by
  native_decide

/-- Coefficient term 2130 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2130 : Poly :=
[
  term ((208915778982325269960221313525366697283963 : Rat) / 4396352775071994240912540908485088809500) [(9, 2), (10, 2)]
]

/-- Partial product 2130 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2130 : Poly :=
[
  term ((-208915778982325269960221313525366697283963 : Rat) / 4396352775071994240912540908485088809500) [(9, 2), (10, 2)],
  term ((208915778982325269960221313525366697283963 : Rat) / 2198176387535997120456270454242544404750) [(9, 2), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2130 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2130_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2130
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2130 := by
  native_decide

/-- Coefficient term 2131 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2131 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (12, 1)]
]

/-- Partial product 2131 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2131 : Poly :=
[
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (12, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2131 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2131_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2131
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2131 := by
  native_decide

/-- Coefficient term 2132 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2132 : Poly :=
[
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (12, 1), (16, 1)]
]

/-- Partial product 2132 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2132 : Poly :=
[
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2132 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2132_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2132
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2132 := by
  native_decide

/-- Coefficient term 2133 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2133 : Poly :=
[
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (14, 1)]
]

/-- Partial product 2133 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2133 : Poly :=
[
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (14, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2133 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2133_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2133
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2133 := by
  native_decide

/-- Coefficient term 2134 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2134 : Poly :=
[
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (14, 1), (16, 1)]
]

/-- Partial product 2134 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2134 : Poly :=
[
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (14, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2134 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2134_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2134
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2134 := by
  native_decide

/-- Coefficient term 2135 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2135 : Poly :=
[
  term ((-1599443610768884119356 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (16, 1)]
]

/-- Partial product 2135 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2135 : Poly :=
[
  term ((-3198887221537768238712 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (14, 1), (16, 1)],
  term ((1599443610768884119356 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2135 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2135_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2135
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2135 := by
  native_decide

/-- Coefficient term 2136 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2136 : Poly :=
[
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 2), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 2136 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2136 : Poly :=
[
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2136 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2136_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2136
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2136 := by
  native_decide

/-- Coefficient term 2137 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2137 : Poly :=
[
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2137 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2137 : Poly :=
[
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2137 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2137_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2137
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2137 := by
  native_decide

/-- Coefficient term 2138 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2138 : Poly :=
[
  term ((-2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2138 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2138 : Poly :=
[
  term ((-4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2138 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2138_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2138
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2138 := by
  native_decide

/-- Coefficient term 2139 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2139 : Poly :=
[
  term ((-1089805110791781626712 : Rat) / 619894037808199760165) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2139 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2139 : Poly :=
[
  term ((-2179610221583563253424 : Rat) / 619894037808199760165) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1089805110791781626712 : Rat) / 619894037808199760165) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2139 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2139_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2139
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2139 := by
  native_decide

/-- Coefficient term 2140 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2140 : Poly :=
[
  term ((20758511256877260879788678287996039879007660500634999592020462468 : Rat) / 1190679392641668603952769578855844883303866263156225866019590375) [(9, 2), (11, 1), (13, 1)]
]

/-- Partial product 2140 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2140 : Poly :=
[
  term ((-20758511256877260879788678287996039879007660500634999592020462468 : Rat) / 1190679392641668603952769578855844883303866263156225866019590375) [(9, 2), (11, 1), (13, 1)],
  term ((41517022513754521759577356575992079758015321001269999184040924936 : Rat) / 1190679392641668603952769578855844883303866263156225866019590375) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2140 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2140_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2140
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2140 := by
  native_decide

/-- Coefficient term 2141 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2141 : Poly :=
[
  term ((159736379128093450545385503614185502918727979925838273569525782264 : Rat) / 1190679392641668603952769578855844883303866263156225866019590375) [(9, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 2141 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2141 : Poly :=
[
  term ((-159736379128093450545385503614185502918727979925838273569525782264 : Rat) / 1190679392641668603952769578855844883303866263156225866019590375) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((319472758256186901090771007228371005837455959851676547139051564528 : Rat) / 1190679392641668603952769578855844883303866263156225866019590375) [(9, 2), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2141 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2141_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2141
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2141 := by
  native_decide

/-- Coefficient term 2142 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2142 : Poly :=
[
  term ((6185218241316534301376 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2142 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2142 : Poly :=
[
  term ((-6185218241316534301376 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((12370436482633068602752 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2142 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2142_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2142
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2142 := by
  native_decide

/-- Coefficient term 2143 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2143 : Poly :=
[
  term ((426597357911278032544 : Rat) / 685146041788010261235) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 2143 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2143 : Poly :=
[
  term ((853194715822556065088 : Rat) / 685146041788010261235) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-426597357911278032544 : Rat) / 685146041788010261235) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2143 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2143_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2143
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2143 := by
  native_decide

/-- Coefficient term 2144 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2144 : Poly :=
[
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 2144 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2144 : Poly :=
[
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(9, 2), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2144 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2144_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2144
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2144 := by
  native_decide

/-- Coefficient term 2145 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2145 : Poly :=
[
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2145 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2145 : Poly :=
[
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2145 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2145_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2145
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2145 := by
  native_decide

/-- Coefficient term 2146 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2146 : Poly :=
[
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(9, 2), (11, 1), (15, 1)]
]

/-- Partial product 2146 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2146 : Poly :=
[
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2146 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2146_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2146
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2146 := by
  native_decide

/-- Coefficient term 2147 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2147 : Poly :=
[
  term ((2116023138871285157898 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 2147 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2147 : Poly :=
[
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2116023138871285157898 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2147 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2147_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2147
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2147 := by
  native_decide

/-- Coefficient term 2148 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2148 : Poly :=
[
  term ((30975548608346060567276294787193410623728 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2)]
]

/-- Partial product 2148 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2148 : Poly :=
[
  term ((-30975548608346060567276294787193410623728 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2148 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2148_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2148
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2148 := by
  native_decide

/-- Coefficient term 2149 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2149 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2), (12, 1)]
]

/-- Partial product 2149 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2149 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2), (12, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2149 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2149_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2149
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2149 := by
  native_decide

/-- Coefficient term 2150 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2150 : Poly :=
[
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (12, 1), (16, 1)]
]

/-- Partial product 2150 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2150 : Poly :=
[
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2150 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2150_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2150
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2150 := by
  native_decide

/-- Coefficient term 2151 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2151 : Poly :=
[
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2), (14, 1)]
]

/-- Partial product 2151 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2151 : Poly :=
[
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2), (14, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2151 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2151_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2151
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2151 := by
  native_decide

/-- Coefficient term 2152 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2152 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 2152 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2152 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2152 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2152_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2152
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2152 := by
  native_decide

/-- Coefficient term 2153 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2153 : Poly :=
[
  term ((-315735258661985404544 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (16, 1)]
]

/-- Partial product 2153 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2153 : Poly :=
[
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((315735258661985404544 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2153 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2153_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2153
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2153 := by
  native_decide

/-- Coefficient term 2154 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2154 : Poly :=
[
  term ((-1258535151589372621729303870914775086875076449372646460201355687560426245882432653947 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 2), (12, 1)]
]

/-- Partial product 2154 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2154 : Poly :=
[
  term ((1258535151589372621729303870914775086875076449372646460201355687560426245882432653947 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 2), (12, 1)],
  term ((-1258535151589372621729303870914775086875076449372646460201355687560426245882432653947 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2154 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2154_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2154
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2154 := by
  native_decide

/-- Coefficient term 2155 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2155 : Poly :=
[
  term ((57298126980638316829231474029295332537824694865419779000232714091 : Rat) / 389930093496686794276930388397235751257406495536541804076591000) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 2155 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2155 : Poly :=
[
  term ((57298126980638316829231474029295332537824694865419779000232714091 : Rat) / 194965046748343397138465194198617875628703247768270902038295500) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-57298126980638316829231474029295332537824694865419779000232714091 : Rat) / 389930093496686794276930388397235751257406495536541804076591000) [(9, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2155 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2155_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2155
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2155 := by
  native_decide

/-- Coefficient term 2156 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2156 : Poly :=
[
  term ((8946204954718759126702 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2156 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2156 : Poly :=
[
  term ((17892409909437518253404 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8946204954718759126702 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2156 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2156_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2156
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2156 := by
  native_decide

/-- Coefficient term 2157 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2157 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 2), (12, 1), (13, 2)]
]

/-- Partial product 2157 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2157 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 2), (12, 1), (13, 2)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 2), (12, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2157 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2157_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2157
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2157 := by
  native_decide

/-- Coefficient term 2158 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2158 : Poly :=
[
  term ((41835720699017993522251148435598859661898389 : Rat) / 158268699902591792672851472705463197142000) [(9, 2), (12, 1), (14, 1)]
]

/-- Partial product 2158 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2158 : Poly :=
[
  term ((-41835720699017993522251148435598859661898389 : Rat) / 158268699902591792672851472705463197142000) [(9, 2), (12, 1), (14, 1)],
  term ((41835720699017993522251148435598859661898389 : Rat) / 79134349951295896336425736352731598571000) [(9, 2), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2158 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2158_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2158
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2158 := by
  native_decide

/-- Coefficient term 2159 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2159 : Poly :=
[
  term ((-8896976531232412717113 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 2159 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2159 : Poly :=
[
  term ((8896976531232412717113 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-17793953062464825434226 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2159 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2159_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2159
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2159 := by
  native_decide

/-- Coefficient term 2160 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2160 : Poly :=
[
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 2), (12, 1), (15, 2)]
]

/-- Partial product 2160 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2160 : Poly :=
[
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2160 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2160_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2160
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2160 := by
  native_decide

/-- Coefficient term 2161 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2161 : Poly :=
[
  term ((-486107137578906858969 : Rat) / 619894037808199760165) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 2161 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2161 : Poly :=
[
  term ((-972214275157813717938 : Rat) / 619894037808199760165) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(9, 2), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2161 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2161_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2161
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2161 := by
  native_decide

/-- Coefficient term 2162 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2162 : Poly :=
[
  term ((-210178565392547410013000647 : Rat) / 7576344930091817468736630) [(9, 2), (12, 1), (16, 1)]
]

/-- Partial product 2162 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2162 : Poly :=
[
  term ((-210178565392547410013000647 : Rat) / 3788172465045908734368315) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((210178565392547410013000647 : Rat) / 7576344930091817468736630) [(9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2162 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2162_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2162
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2162 := by
  native_decide

/-- Coefficient term 2163 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2163 : Poly :=
[
  term ((-1388177660004134945943221659745689202786369 : Rat) / 3165373998051835853457029454109263942840) [(9, 2), (12, 2)]
]

/-- Partial product 2163 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2163 : Poly :=
[
  term ((1388177660004134945943221659745689202786369 : Rat) / 3165373998051835853457029454109263942840) [(9, 2), (12, 2)],
  term ((-1388177660004134945943221659745689202786369 : Rat) / 1582686999025917926728514727054631971420) [(9, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2163 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2163_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2163
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2163 := by
  native_decide

/-- Coefficient term 2164 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2164 : Poly :=
[
  term ((2952162376045268027730 : Rat) / 867851652931479664231) [(9, 2), (12, 2), (16, 1)]
]

/-- Partial product 2164 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2164 : Poly :=
[
  term ((5904324752090536055460 : Rat) / 867851652931479664231) [(9, 2), (12, 2), (14, 1), (16, 1)],
  term ((-2952162376045268027730 : Rat) / 867851652931479664231) [(9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2164 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2164_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2164
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2164 := by
  native_decide

/-- Coefficient term 2165 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2165 : Poly :=
[
  term ((-5865435900540892916883962592877774595348240095839300602558235040531 : Rat) / 44452030658622294547570064277284875643344340491165765664731374000) [(9, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 2165 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2165 : Poly :=
[
  term ((5865435900540892916883962592877774595348240095839300602558235040531 : Rat) / 44452030658622294547570064277284875643344340491165765664731374000) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-5865435900540892916883962592877774595348240095839300602558235040531 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(9, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2165 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2165_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2165
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2165 := by
  native_decide

/-- Coefficient term 2166 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2166 : Poly :=
[
  term ((-2504858813231734143767 : Rat) / 4339258264657398321155) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2166 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2166 : Poly :=
[
  term ((2504858813231734143767 : Rat) / 4339258264657398321155) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5009717626463468287534 : Rat) / 4339258264657398321155) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2166 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2166_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2166
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2166 := by
  native_decide

/-- Coefficient term 2167 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2167 : Poly :=
[
  term ((-503336778932214555545505016453958672226892903636328415206794879519 : Rat) / 88904061317244589095140128554569751286688680982331531329462748000) [(9, 2), (13, 1), (15, 1)]
]

/-- Partial product 2167 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2167 : Poly :=
[
  term ((-503336778932214555545505016453958672226892903636328415206794879519 : Rat) / 44452030658622294547570064277284875643344340491165765664731374000) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((503336778932214555545505016453958672226892903636328415206794879519 : Rat) / 88904061317244589095140128554569751286688680982331531329462748000) [(9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2167 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2167_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2167
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2167 := by
  native_decide

/-- Coefficient term 2168 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2168 : Poly :=
[
  term ((-345522537758664790121 : Rat) / 456764027858673507490) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2168 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2168 : Poly :=
[
  term ((-345522537758664790121 : Rat) / 228382013929336753745) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((345522537758664790121 : Rat) / 456764027858673507490) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2168 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2168_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2168
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2168 := by
  native_decide

/-- Coefficient term 2169 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2169 : Poly :=
[
  term ((-25201522502470842913451594348567891034374915697785035890797495581 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(9, 2), (13, 2)]
]

/-- Partial product 2169 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2169 : Poly :=
[
  term ((25201522502470842913451594348567891034374915697785035890797495581 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(9, 2), (13, 2)],
  term ((-25201522502470842913451594348567891034374915697785035890797495581 : Rat) / 11113007664655573636892516069321218910836085122791441416182843500) [(9, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2169 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2169_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2169
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2169 := by
  native_decide

/-- Coefficient term 2170 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2170 : Poly :=
[
  term ((-25201522502470842913451594348567891034374915697785035890797495581 : Rat) / 11113007664655573636892516069321218910836085122791441416182843500) [(9, 2), (13, 2), (14, 1)]
]

/-- Partial product 2170 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2170 : Poly :=
[
  term ((25201522502470842913451594348567891034374915697785035890797495581 : Rat) / 11113007664655573636892516069321218910836085122791441416182843500) [(9, 2), (13, 2), (14, 1)],
  term ((-25201522502470842913451594348567891034374915697785035890797495581 : Rat) / 5556503832327786818446258034660609455418042561395720708091421750) [(9, 2), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2170 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2170_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2170
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2170 := by
  native_decide

/-- Coefficient term 2171 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2171 : Poly :=
[
  term ((123582075927606029364 : Rat) / 4339258264657398321155) [(9, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 2171 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2171 : Poly :=
[
  term ((-123582075927606029364 : Rat) / 4339258264657398321155) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((247164151855212058728 : Rat) / 4339258264657398321155) [(9, 2), (13, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2171 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2171_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2171
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2171 := by
  native_decide

/-- Coefficient term 2172 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2172 : Poly :=
[
  term ((61791037963803014682 : Rat) / 4339258264657398321155) [(9, 2), (13, 2), (16, 1)]
]

/-- Partial product 2172 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2172 : Poly :=
[
  term ((123582075927606029364 : Rat) / 4339258264657398321155) [(9, 2), (13, 2), (14, 1), (16, 1)],
  term ((-61791037963803014682 : Rat) / 4339258264657398321155) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2172 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2172_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2172
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2172 := by
  native_decide

/-- Coefficient term 2173 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2173 : Poly :=
[
  term ((2281326609043120101759977182538347008425424065595728024355765369832370728536992888041 : Rat) / 5144966065905670669970161599218497121285040979978707079196813495883787936009728000) [(9, 2), (14, 1)]
]

/-- Partial product 2173 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2173 : Poly :=
[
  term ((-2281326609043120101759977182538347008425424065595728024355765369832370728536992888041 : Rat) / 5144966065905670669970161599218497121285040979978707079196813495883787936009728000) [(9, 2), (14, 1)],
  term ((2281326609043120101759977182538347008425424065595728024355765369832370728536992888041 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2173 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2173_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2173
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2173 := by
  native_decide

/-- Coefficient term 2174 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2174 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(9, 2), (14, 1), (15, 2)]
]

/-- Partial product 2174 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2174 : Poly :=
[
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(9, 2), (14, 1), (15, 2)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2174 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2174_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2174
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2174 := by
  native_decide

/-- Coefficient term 2175 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2175 : Poly :=
[
  term ((2020095442437435 : Rat) / 7342292683791569) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 2175 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2175 : Poly :=
[
  term ((-2020095442437435 : Rat) / 7342292683791569) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((4040190884874870 : Rat) / 7342292683791569) [(9, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2175 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2175_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2175
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2175 := by
  native_decide

/-- Coefficient term 2176 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2176 : Poly :=
[
  term ((12155957648458686204326081 : Rat) / 1010179324012242329164884) [(9, 2), (14, 1), (16, 1)]
]

/-- Partial product 2176 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2176 : Poly :=
[
  term ((-12155957648458686204326081 : Rat) / 1010179324012242329164884) [(9, 2), (14, 1), (16, 1)],
  term ((12155957648458686204326081 : Rat) / 505089662006121164582442) [(9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2176 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2176_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2176
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2176 := by
  native_decide

/-- Coefficient term 2177 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2177 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 460679391912939786402737636085852230006166022502373549619826060352) [(9, 2), (15, 2)]
]

/-- Partial product 2177 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2177 : Poly :=
[
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(9, 2), (14, 1), (15, 2)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 460679391912939786402737636085852230006166022502373549619826060352) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2177 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2177_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2177
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2177 := by
  native_decide

/-- Coefficient term 2178 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2178 : Poly :=
[
  term ((2020095442437435 : Rat) / 14684585367583138) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 2178 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2178 : Poly :=
[
  term ((2020095442437435 : Rat) / 7342292683791569) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2020095442437435 : Rat) / 14684585367583138) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2178 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2178_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2178
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2178 := by
  native_decide

/-- Coefficient term 2179 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2179 : Poly :=
[
  term ((244022898880001713245028141 : Rat) / 30305379720367269874946520) [(9, 2), (16, 1)]
]

/-- Partial product 2179 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2179 : Poly :=
[
  term ((244022898880001713245028141 : Rat) / 15152689860183634937473260) [(9, 2), (14, 1), (16, 1)],
  term ((-244022898880001713245028141 : Rat) / 30305379720367269874946520) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2179 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2179_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2179
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2179 := by
  native_decide

/-- Coefficient term 2180 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2180 : Poly :=
[
  term ((-122766201736782921383248439727255513889582 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1)]
]

/-- Partial product 2180 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2180 : Poly :=
[
  term ((122766201736782921383248439727255513889582 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2180 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2180_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2180
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2180 := by
  native_decide

/-- Coefficient term 2181 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2181 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (12, 1)]
]

/-- Partial product 2181 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2181 : Poly :=
[
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (12, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2181 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2181_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2181
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2181 := by
  native_decide

/-- Coefficient term 2182 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2182 : Poly :=
[
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 2182 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2182 : Poly :=
[
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2182 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2182_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2182
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2182 := by
  native_decide

/-- Coefficient term 2183 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2183 : Poly :=
[
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (14, 1)]
]

/-- Partial product 2183 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2183 : Poly :=
[
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (14, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2183 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2183_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2183
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2183 := by
  native_decide

/-- Coefficient term 2184 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2184 : Poly :=
[
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 2184 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2184 : Poly :=
[
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (14, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2184 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2184_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2184
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2184 := by
  native_decide

/-- Coefficient term 2185 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2185 : Poly :=
[
  term ((417728389971334622304 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (16, 1)]
]

/-- Partial product 2185 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2185 : Poly :=
[
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-417728389971334622304 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2185 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2185_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2185
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2185 := by
  native_decide

/-- Coefficient term 2186 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2186 : Poly :=
[
  term ((-1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 3), (12, 1), (15, 1)]
]

/-- Partial product 2186 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2186 : Poly :=
[
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 3), (12, 1), (14, 1), (15, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2186 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2186_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2186
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2186 := by
  native_decide

/-- Coefficient term 2187 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2187 : Poly :=
[
  term ((2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2187 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2187 : Poly :=
[
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2187 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2187_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2187
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2187 := by
  native_decide

/-- Coefficient term 2188 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2188 : Poly :=
[
  term ((1590951797086655533840394629941114494318483 : Rat) / 52756233300863930890950490901821065714000) [(9, 3), (14, 1), (15, 1)]
]

/-- Partial product 2188 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2188 : Poly :=
[
  term ((-1590951797086655533840394629941114494318483 : Rat) / 52756233300863930890950490901821065714000) [(9, 3), (14, 1), (15, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2188 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2188_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2188
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2188 := by
  native_decide

/-- Coefficient term 2189 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2189 : Poly :=
[
  term ((-1015017351045724217133 : Rat) / 4339258264657398321155) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 2189 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2189 : Poly :=
[
  term ((1015017351045724217133 : Rat) / 4339258264657398321155) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 3), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2189 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2189_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2189
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2189 := by
  native_decide

/-- Coefficient term 2190 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2190 : Poly :=
[
  term ((1590951797086655533840394629941114494318483 : Rat) / 105512466601727861781900981803642131428000) [(9, 3), (15, 1)]
]

/-- Partial product 2190 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2190 : Poly :=
[
  term ((1590951797086655533840394629941114494318483 : Rat) / 52756233300863930890950490901821065714000) [(9, 3), (14, 1), (15, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 105512466601727861781900981803642131428000) [(9, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2190 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2190_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2190
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2190 := by
  native_decide

/-- Coefficient term 2191 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2191 : Poly :=
[
  term ((-1015017351045724217133 : Rat) / 8678516529314796642310) [(9, 3), (15, 1), (16, 1)]
]

/-- Partial product 2191 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2191 : Poly :=
[
  term ((-1015017351045724217133 : Rat) / 4339258264657398321155) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((1015017351045724217133 : Rat) / 8678516529314796642310) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2191 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2191_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2191
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2191 := by
  native_decide

/-- Coefficient term 2192 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2192 : Poly :=
[
  term ((26419528049972444950572098101442926264490949888908472779644587250427895481465313 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(10, 1)]
]

/-- Partial product 2192 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2192 : Poly :=
[
  term ((-26419528049972444950572098101442926264490949888908472779644587250427895481465313 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(10, 1)],
  term ((26419528049972444950572098101442926264490949888908472779644587250427895481465313 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2192 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2192_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2192
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2192 := by
  native_decide

/-- Coefficient term 2193 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2193 : Poly :=
[
  term ((7857851105466407810011619842084945379569326815604640448431008907 : Rat) / 438671355183772643561546686946890220164582307478609529586164875) [(10, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 2193 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2193 : Poly :=
[
  term ((-7857851105466407810011619842084945379569326815604640448431008907 : Rat) / 438671355183772643561546686946890220164582307478609529586164875) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((15715702210932815620023239684169890759138653631209280896862017814 : Rat) / 438671355183772643561546686946890220164582307478609529586164875) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2193 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2193_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2193
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2193 := by
  native_decide

/-- Coefficient term 2194 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2194 : Poly :=
[
  term ((-85352682241758103692698282480707796871242842282952537080036675082 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 2194 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2194 : Poly :=
[
  term ((85352682241758103692698282480707796871242842282952537080036675082 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-170705364483516207385396564961415593742485684565905074160073350164 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2194 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2194_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2194
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2194 := by
  native_decide

/-- Coefficient term 2195 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2195 : Poly :=
[
  term ((-475880786208854109712 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 2195 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2195 : Poly :=
[
  term ((475880786208854109712 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-951761572417708219424 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2195 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2195_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2195
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2195 := by
  native_decide

/-- Coefficient term 2196 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2196 : Poly :=
[
  term ((72540452120770421843432 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 2196 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2196 : Poly :=
[
  term ((145080904241540843686864 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-72540452120770421843432 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2196 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2196_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2196
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2196 := by
  native_decide

/-- Coefficient term 2197 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2197 : Poly :=
[
  term ((125607305115455621105582043228192432623729754810259308491879302226558258359 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 2197 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2197 : Poly :=
[
  term ((251214610230911242211164086456384865247459509620518616983758604453116516718 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-125607305115455621105582043228192432623729754810259308491879302226558258359 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2197 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2197_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2197
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2197 := by
  native_decide

/-- Coefficient term 2198 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2198 : Poly :=
[
  term ((3041233929359876751432 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 2198 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2198 : Poly :=
[
  term ((6082467858719753502864 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3041233929359876751432 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2198 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2198_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2198
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2198 := by
  native_decide

/-- Coefficient term 2199 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_2199 : Poly :=
[
  term ((8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 2), (13, 1)]
]

/-- Partial product 2199 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_2199 : Poly :=
[
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2199 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_2199_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_2199
        rs_R009_ueqv_R009NYNYN_generator_28_2100_2199 =
      rs_R009_ueqv_R009NYNYN_partial_28_2199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_2100_2199 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_2100,
  rs_R009_ueqv_R009NYNYN_partial_28_2101,
  rs_R009_ueqv_R009NYNYN_partial_28_2102,
  rs_R009_ueqv_R009NYNYN_partial_28_2103,
  rs_R009_ueqv_R009NYNYN_partial_28_2104,
  rs_R009_ueqv_R009NYNYN_partial_28_2105,
  rs_R009_ueqv_R009NYNYN_partial_28_2106,
  rs_R009_ueqv_R009NYNYN_partial_28_2107,
  rs_R009_ueqv_R009NYNYN_partial_28_2108,
  rs_R009_ueqv_R009NYNYN_partial_28_2109,
  rs_R009_ueqv_R009NYNYN_partial_28_2110,
  rs_R009_ueqv_R009NYNYN_partial_28_2111,
  rs_R009_ueqv_R009NYNYN_partial_28_2112,
  rs_R009_ueqv_R009NYNYN_partial_28_2113,
  rs_R009_ueqv_R009NYNYN_partial_28_2114,
  rs_R009_ueqv_R009NYNYN_partial_28_2115,
  rs_R009_ueqv_R009NYNYN_partial_28_2116,
  rs_R009_ueqv_R009NYNYN_partial_28_2117,
  rs_R009_ueqv_R009NYNYN_partial_28_2118,
  rs_R009_ueqv_R009NYNYN_partial_28_2119,
  rs_R009_ueqv_R009NYNYN_partial_28_2120,
  rs_R009_ueqv_R009NYNYN_partial_28_2121,
  rs_R009_ueqv_R009NYNYN_partial_28_2122,
  rs_R009_ueqv_R009NYNYN_partial_28_2123,
  rs_R009_ueqv_R009NYNYN_partial_28_2124,
  rs_R009_ueqv_R009NYNYN_partial_28_2125,
  rs_R009_ueqv_R009NYNYN_partial_28_2126,
  rs_R009_ueqv_R009NYNYN_partial_28_2127,
  rs_R009_ueqv_R009NYNYN_partial_28_2128,
  rs_R009_ueqv_R009NYNYN_partial_28_2129,
  rs_R009_ueqv_R009NYNYN_partial_28_2130,
  rs_R009_ueqv_R009NYNYN_partial_28_2131,
  rs_R009_ueqv_R009NYNYN_partial_28_2132,
  rs_R009_ueqv_R009NYNYN_partial_28_2133,
  rs_R009_ueqv_R009NYNYN_partial_28_2134,
  rs_R009_ueqv_R009NYNYN_partial_28_2135,
  rs_R009_ueqv_R009NYNYN_partial_28_2136,
  rs_R009_ueqv_R009NYNYN_partial_28_2137,
  rs_R009_ueqv_R009NYNYN_partial_28_2138,
  rs_R009_ueqv_R009NYNYN_partial_28_2139,
  rs_R009_ueqv_R009NYNYN_partial_28_2140,
  rs_R009_ueqv_R009NYNYN_partial_28_2141,
  rs_R009_ueqv_R009NYNYN_partial_28_2142,
  rs_R009_ueqv_R009NYNYN_partial_28_2143,
  rs_R009_ueqv_R009NYNYN_partial_28_2144,
  rs_R009_ueqv_R009NYNYN_partial_28_2145,
  rs_R009_ueqv_R009NYNYN_partial_28_2146,
  rs_R009_ueqv_R009NYNYN_partial_28_2147,
  rs_R009_ueqv_R009NYNYN_partial_28_2148,
  rs_R009_ueqv_R009NYNYN_partial_28_2149,
  rs_R009_ueqv_R009NYNYN_partial_28_2150,
  rs_R009_ueqv_R009NYNYN_partial_28_2151,
  rs_R009_ueqv_R009NYNYN_partial_28_2152,
  rs_R009_ueqv_R009NYNYN_partial_28_2153,
  rs_R009_ueqv_R009NYNYN_partial_28_2154,
  rs_R009_ueqv_R009NYNYN_partial_28_2155,
  rs_R009_ueqv_R009NYNYN_partial_28_2156,
  rs_R009_ueqv_R009NYNYN_partial_28_2157,
  rs_R009_ueqv_R009NYNYN_partial_28_2158,
  rs_R009_ueqv_R009NYNYN_partial_28_2159,
  rs_R009_ueqv_R009NYNYN_partial_28_2160,
  rs_R009_ueqv_R009NYNYN_partial_28_2161,
  rs_R009_ueqv_R009NYNYN_partial_28_2162,
  rs_R009_ueqv_R009NYNYN_partial_28_2163,
  rs_R009_ueqv_R009NYNYN_partial_28_2164,
  rs_R009_ueqv_R009NYNYN_partial_28_2165,
  rs_R009_ueqv_R009NYNYN_partial_28_2166,
  rs_R009_ueqv_R009NYNYN_partial_28_2167,
  rs_R009_ueqv_R009NYNYN_partial_28_2168,
  rs_R009_ueqv_R009NYNYN_partial_28_2169,
  rs_R009_ueqv_R009NYNYN_partial_28_2170,
  rs_R009_ueqv_R009NYNYN_partial_28_2171,
  rs_R009_ueqv_R009NYNYN_partial_28_2172,
  rs_R009_ueqv_R009NYNYN_partial_28_2173,
  rs_R009_ueqv_R009NYNYN_partial_28_2174,
  rs_R009_ueqv_R009NYNYN_partial_28_2175,
  rs_R009_ueqv_R009NYNYN_partial_28_2176,
  rs_R009_ueqv_R009NYNYN_partial_28_2177,
  rs_R009_ueqv_R009NYNYN_partial_28_2178,
  rs_R009_ueqv_R009NYNYN_partial_28_2179,
  rs_R009_ueqv_R009NYNYN_partial_28_2180,
  rs_R009_ueqv_R009NYNYN_partial_28_2181,
  rs_R009_ueqv_R009NYNYN_partial_28_2182,
  rs_R009_ueqv_R009NYNYN_partial_28_2183,
  rs_R009_ueqv_R009NYNYN_partial_28_2184,
  rs_R009_ueqv_R009NYNYN_partial_28_2185,
  rs_R009_ueqv_R009NYNYN_partial_28_2186,
  rs_R009_ueqv_R009NYNYN_partial_28_2187,
  rs_R009_ueqv_R009NYNYN_partial_28_2188,
  rs_R009_ueqv_R009NYNYN_partial_28_2189,
  rs_R009_ueqv_R009NYNYN_partial_28_2190,
  rs_R009_ueqv_R009NYNYN_partial_28_2191,
  rs_R009_ueqv_R009NYNYN_partial_28_2192,
  rs_R009_ueqv_R009NYNYN_partial_28_2193,
  rs_R009_ueqv_R009NYNYN_partial_28_2194,
  rs_R009_ueqv_R009NYNYN_partial_28_2195,
  rs_R009_ueqv_R009NYNYN_partial_28_2196,
  rs_R009_ueqv_R009NYNYN_partial_28_2197,
  rs_R009_ueqv_R009NYNYN_partial_28_2198,
  rs_R009_ueqv_R009NYNYN_partial_28_2199
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_2100_2199 : Poly :=
[
  term ((-6132594399649006915426674170944163645559609160526159526854594822294299740001 : Rat) / 47078156311578732234171108597500695437118769464394981759329657313815854000) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((4417767314098072229916 : Rat) / 4339258264657398321155) [(9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((8545727781554139364989223 : Rat) / 505089662006121164582442) [(9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6132594399649006915426674170944163645559609160526159526854594822294299740001 : Rat) / 94156312623157464468342217195001390874237538928789963518659314627631708000) [(9, 1), (13, 1), (15, 2)],
  term ((-2208883657049036114958 : Rat) / 4339258264657398321155) [(9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8545727781554139364989223 : Rat) / 1010179324012242329164884) [(9, 1), (13, 1), (16, 1)],
  term ((-127375453589462149448589352186634665351502659989512580355300598401 : Rat) / 444520306586222945475700642772848756433443404911657656647313740) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-18139574061292730312132 : Rat) / 4339258264657398321155) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((56593643325478482346282909575800498905072223877032845742228086176595102987301 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((2556272713475846490542 : Rat) / 619894037808199760165) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((21605604603670849337118718465601737354560491371146044933730845383812485580533 : Rat) / 282468937869472393405026651585004172622712616786369890555977943882895124000) [(9, 1), (13, 2), (15, 1)],
  term ((1838523912825453519047 : Rat) / 1735703305862959328462) [(9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-15013978582066542386539039433373095440459355535322399584631016611 : Rat) / 2667121839517337672854203856637092538600660429469945939883882440) [(9, 1), (13, 3)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 1), (13, 3), (14, 1)],
  term ((7525053824893269452645353119733526128533449248392122220833876131 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(9, 1), (13, 3), (14, 2)],
  term ((3312839258305634239384 : Rat) / 13017774793972194963465) [(9, 1), (13, 3), (14, 2), (16, 1)],
  term ((-828209814576408559846 : Rat) / 13017774793972194963465) [(9, 1), (13, 3), (16, 1)],
  term ((-766513839582841125152797804068077782223025716118706460470876443926116109490354316499 : Rat) / 857494344317611778328360266536416186880840163329784513199468915980631322668288000) [(9, 1), (14, 1), (15, 1)],
  term ((-5392822441384394618089281 : Rat) / 420908051671767637152035) [(9, 1), (14, 1), (15, 1), (16, 1)],
  term ((28089746568016262679428852532339752742095729004408271223331034880393007649914763 : Rat) / 8161499990332517623832733778233895466467103645090124090300277755972641376000) [(9, 1), (14, 2), (15, 1)],
  term ((2264102280380029055107 : Rat) / 32049107564750198685) [(9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-6382095262126246803408063525267405697444660845299854857068131971975247459435911438857 : Rat) / 15434898197717012009910484797655491363855122939936121237590440487651363808029184000) [(9, 1), (15, 1)],
  term ((-34108764298743990231797047 : Rat) / 3030537972036726987494652) [(9, 1), (15, 1), (16, 1)],
  term ((-11645253806864154864606763004224707085954314204145419115215947790758233915413843178747 : Rat) / 30869796395434024019820969595310982727710245879872242475180880975302727616058368000) [(9, 2)],
  term ((-338486945624205787357086352191887534160083899053744403246272127813 : Rat) / 6350290094088899221081437753897839377620620070166537952104482000) [(9, 2), (10, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (11, 1), (13, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((72441956025243530990329241987836235885407342432338578818671410145218976380617619 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(9, 2), (10, 1), (12, 1)],
  term ((-81448537584003613793542951846112795721419157383868022165439036667467582205832643 : Rat) / 73978614828014819832776480050112592809888434336350274336610623502930232975600) [(9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-9029799116480952661362862 : Rat) / 541167495006558390624045) [(9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 1), (14, 2)],
  term ((-1639094552796876054624 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 1), (14, 2), (16, 1)],
  term ((33392958838422925309378457 : Rat) / 3788172465045908734368315) [(9, 2), (10, 1), (12, 1), (16, 1)],
  term ((160571172852397998675502618199444564846714 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 2)],
  term ((-321142345704795997351005236398889129693428 : Rat) / 659452916260799136136881136272763321425) [(9, 2), (10, 1), (12, 2), (14, 1)],
  term ((3278189105593752109248 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1639094552796876054624 : Rat) / 867851652931479664231) [(9, 2), (10, 1), (12, 2), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 2), (10, 1), (13, 1), (15, 1)],
  term ((2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8875992869727972300919809994118609712225796882407271938944403966718357737883991 : Rat) / 51019734364148151608811365551801788144750644369896740921800430002020850328000) [(9, 2), (10, 1), (14, 1)],
  term ((-5236199523582830276496797 : Rat) / 1082334990013116781248090) [(9, 2), (10, 1), (14, 1), (16, 1)],
  term ((83026776232441756675126983795617821613280821042721241470947113980658676607422231 : Rat) / 147957229656029639665552960100225185619776868672700548673221247005860465951200) [(9, 2), (10, 1), (14, 2)],
  term ((31290866626764206234479487 : Rat) / 3788172465045908734368315) [(9, 2), (10, 1), (14, 2), (16, 1)],
  term ((1535661522999887085051 : Rat) / 4339258264657398321155) [(9, 2), (10, 1), (16, 1)],
  term ((-208915778982325269960221313525366697283963 : Rat) / 4396352775071994240912540908485088809500) [(9, 2), (10, 2)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (12, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (12, 1), (14, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (12, 1), (14, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (12, 1), (16, 1)],
  term ((474261363557611823034997116127464466222799 : Rat) / 3956717497564794816821286817636579928550) [(9, 2), (10, 2), (14, 1)],
  term ((-806868800296087496664 : Rat) / 867851652931479664231) [(9, 2), (10, 2), (14, 1), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (10, 2), (14, 2)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (14, 2), (16, 1)],
  term ((1599443610768884119356 : Rat) / 4339258264657398321155) [(9, 2), (10, 2), (16, 1)],
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 2), (11, 1), (12, 1), (13, 1)],
  term ((-16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-44791835683890199076096 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4166126917691815831628434313102063344246676938416112103975868285579294425446 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2179610221583563253424 : Rat) / 619894037808199760165) [(9, 2), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2083063458845907915814217156551031672123338469208056051987934142789647212723 : Rat) / 26481462925263036881721248586094141183379307823722177239622932239021417875) [(9, 2), (11, 1), (12, 1), (15, 1)],
  term ((1089805110791781626712 : Rat) / 619894037808199760165) [(9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20758511256877260879788678287996039879007660500634999592020462468 : Rat) / 1190679392641668603952769578855844883303866263156225866019590375) [(9, 2), (11, 1), (13, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 2), (11, 1), (13, 1), (14, 1)],
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((319472758256186901090771007228371005837455959851676547139051564528 : Rat) / 1190679392641668603952769578855844883303866263156225866019590375) [(9, 2), (11, 1), (13, 1), (14, 2)],
  term ((12370436482633068602752 : Rat) / 13017774793972194963465) [(9, 2), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-426597357911278032544 : Rat) / 685146041788010261235) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(9, 2), (11, 1), (14, 2), (15, 1)],
  term ((8464092555485140631592 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 11769539077894683058542777149375173859279692366098745439832414328453963500) [(9, 2), (11, 1), (15, 1)],
  term ((-2116023138871285157898 : Rat) / 4339258264657398321155) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-30975548608346060567276294787193410623728 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2), (12, 1)],
  term ((-247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2), (12, 1), (14, 1)],
  term ((2525882069295883236352 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (12, 1), (16, 1)],
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(9, 2), (11, 2), (14, 2)],
  term ((-1262941034647941618176 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (14, 2), (16, 1)],
  term ((315735258661985404544 : Rat) / 619894037808199760165) [(9, 2), (11, 2), (16, 1)],
  term ((1258535151589372621729303870914775086875076449372646460201355687560426245882432653947 : Rat) / 7717449098858506004955242398827745681927561469968060618795220243825681904014592000) [(9, 2), (12, 1)],
  term ((57298126980638316829231474029295332537824694865419779000232714091 : Rat) / 194965046748343397138465194198617875628703247768270902038295500) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((17892409909437518253404 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-57298126980638316829231474029295332537824694865419779000232714091 : Rat) / 389930093496686794276930388397235751257406495536541804076591000) [(9, 2), (12, 1), (13, 1), (15, 1)],
  term ((-8946204954718759126702 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 2), (12, 1), (13, 2)],
  term ((-22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(9, 2), (12, 1), (13, 2), (14, 1)],
  term ((-2278525349295689140205403182753843525803068618565614538806015576999880614007140926779 : Rat) / 3858724549429253002477621199413872840963780734984030309397610121912840952007296000) [(9, 2), (12, 1), (14, 1)],
  term ((3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(9, 2), (12, 1), (14, 1), (15, 2)],
  term ((-972214275157813717938 : Rat) / 619894037808199760165) [(9, 2), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-202411504880781513710960998 : Rat) / 3788172465045908734368315) [(9, 2), (12, 1), (14, 1), (16, 1)],
  term ((41835720699017993522251148435598859661898389 : Rat) / 79134349951295896336425736352731598571000) [(9, 2), (12, 1), (14, 2)],
  term ((-17793953062464825434226 : Rat) / 4339258264657398321155) [(9, 2), (12, 1), (14, 2), (16, 1)],
  term ((-3534655830365409088310197176021902318198686184119992702994000868461970839891 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(9, 2), (12, 1), (15, 2)],
  term ((486107137578906858969 : Rat) / 619894037808199760165) [(9, 2), (12, 1), (15, 2), (16, 1)],
  term ((210178565392547410013000647 : Rat) / 7576344930091817468736630) [(9, 2), (12, 1), (16, 1)],
  term ((1388177660004134945943221659745689202786369 : Rat) / 3165373998051835853457029454109263942840) [(9, 2), (12, 2)],
  term ((-1388177660004134945943221659745689202786369 : Rat) / 1582686999025917926728514727054631971420) [(9, 2), (12, 2), (14, 1)],
  term ((5904324752090536055460 : Rat) / 867851652931479664231) [(9, 2), (12, 2), (14, 1), (16, 1)],
  term ((-2952162376045268027730 : Rat) / 867851652931479664231) [(9, 2), (12, 2), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5865435900540892916883962592877774595348240095839300602558235040531 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(9, 2), (13, 1), (14, 2), (15, 1)],
  term ((-5009717626463468287534 : Rat) / 4339258264657398321155) [(9, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((503336778932214555545505016453958672226892903636328415206794879519 : Rat) / 88904061317244589095140128554569751286688680982331531329462748000) [(9, 2), (13, 1), (15, 1)],
  term ((345522537758664790121 : Rat) / 456764027858673507490) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((25201522502470842913451594348567891034374915697785035890797495581 : Rat) / 22226015329311147273785032138642437821672170245582882832365687000) [(9, 2), (13, 2)],
  term ((-25201522502470842913451594348567891034374915697785035890797495581 : Rat) / 5556503832327786818446258034660609455418042561395720708091421750) [(9, 2), (13, 2), (14, 2)],
  term ((247164151855212058728 : Rat) / 4339258264657398321155) [(9, 2), (13, 2), (14, 2), (16, 1)],
  term ((-61791037963803014682 : Rat) / 4339258264657398321155) [(9, 2), (13, 2), (16, 1)],
  term ((65749260239575955293147889140688897631984580512683981186303840946279603004530901 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(9, 2), (14, 1)],
  term ((30841767076560710090068463 : Rat) / 7576344930091817468736630) [(9, 2), (14, 1), (16, 1)],
  term ((2281326609043120101759977182538347008425424065595728024355765369832370728536992888041 : Rat) / 2572483032952835334985080799609248560642520489989353539598406747941893968004864000) [(9, 2), (14, 2)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(9, 2), (14, 2), (15, 2)],
  term ((4040190884874870 : Rat) / 7342292683791569) [(9, 2), (14, 2), (15, 2), (16, 1)],
  term ((12155957648458686204326081 : Rat) / 505089662006121164582442) [(9, 2), (14, 2), (16, 1)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 460679391912939786402737636085852230006166022502373549619826060352) [(9, 2), (15, 2)],
  term ((-2020095442437435 : Rat) / 14684585367583138) [(9, 2), (15, 2), (16, 1)],
  term ((-244022898880001713245028141 : Rat) / 30305379720367269874946520) [(9, 2), (16, 1)],
  term ((122766201736782921383248439727255513889582 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (12, 1)],
  term ((982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (12, 1), (14, 1)],
  term ((-3341827119770676978432 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(9, 3), (11, 1), (14, 2)],
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (14, 2), (16, 1)],
  term ((-417728389971334622304 : Rat) / 4339258264657398321155) [(9, 3), (11, 1), (16, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(9, 3), (12, 1), (14, 1), (15, 1)],
  term ((4060069404182896868532 : Rat) / 4339258264657398321155) [(9, 3), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 3), (12, 1), (15, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 3), (12, 1), (15, 1), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(9, 3), (14, 2), (15, 1)],
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(9, 3), (14, 2), (15, 1), (16, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 105512466601727861781900981803642131428000) [(9, 3), (15, 1)],
  term ((1015017351045724217133 : Rat) / 8678516529314796642310) [(9, 3), (15, 1), (16, 1)],
  term ((-26419528049972444950572098101442926264490949888908472779644587250427895481465313 : Rat) / 261167999690640563962647480903484654926947316642883970889608888191124524032000) [(10, 1)],
  term ((-7857851105466407810011619842084945379569326815604640448431008907 : Rat) / 438671355183772643561546686946890220164582307478609529586164875) [(10, 1), (11, 1), (12, 1), (13, 1)],
  term ((520624152507038459296659036195667687989438232126538967640273713136 : Rat) / 1666951149698336045533877410398182836625412768418716212427426525) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((155074400751926779990816 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-170705364483516207385396564961415593742485684565905074160073350164 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-951761572417708219424 : Rat) / 619894037808199760165) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-72540452120770421843432 : Rat) / 13017774793972194963465) [(10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((251214610230911242211164086456384865247459509620518616983758604453116516718 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6082467858719753502864 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125607305115455621105582043228192432623729754810259308491879302226558258359 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-3041233929359876751432 : Rat) / 4339258264657398321155) [(10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-8612590640195854960793353557919213597396 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 2), (13, 1)],
  term ((17225181280391709921586707115838427194792 : Rat) / 157012599109714080032590746731610314625) [(10, 1), (11, 1), (12, 2), (13, 1), (14, 1)],
  term ((26419528049972444950572098101442926264490949888908472779644587250427895481465313 : Rat) / 130583999845320281981323740451742327463473658321441985444804444095562262016000) [(10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 2100 through 2199. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_2100_2199_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_2100_2199
      rs_R009_ueqv_R009NYNYN_block_28_2100_2199 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
