/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 21:900-999

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_21_0900_0999 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 900 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0900 : Poly :=
[
  term ((-313886199051387222009587 : Rat) / 16253636456621105582712) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 900 for generator 21. -/
def ep_Q1_009_partial_21_0900 : Poly :=
[
  term ((313886199051387222009587 : Rat) / 16253636456621105582712) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-313886199051387222009587 : Rat) / 8126818228310552791356) [(7, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 900 for generator 21. -/
theorem ep_Q1_009_partial_21_0900_valid :
    mulPoly ep_Q1_009_coefficient_21_0900
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0900 := by
  native_decide

/-- Coefficient term 901 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0901 : Poly :=
[
  term ((-708647454365176050321414150642203243581422206620938439543371726172455340073293913049909443222126152127266163147 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(7, 1), (10, 1), (15, 3)]
]

/-- Partial product 901 for generator 21. -/
def ep_Q1_009_partial_21_0901 : Poly :=
[
  term ((708647454365176050321414150642203243581422206620938439543371726172455340073293913049909443222126152127266163147 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(7, 1), (10, 1), (15, 3)],
  term ((-708647454365176050321414150642203243581422206620938439543371726172455340073293913049909443222126152127266163147 : Rat) / 52537342103943781366599003922815049037657724716157665768789620697517729802615492010902727986365276206188838112) [(7, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 901 for generator 21. -/
theorem ep_Q1_009_partial_21_0901_valid :
    mulPoly ep_Q1_009_coefficient_21_0901
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0901 := by
  native_decide

/-- Coefficient term 902 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0902 : Poly :=
[
  term ((244839488185531284659 : Rat) / 290243508153948313977) [(7, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 902 for generator 21. -/
def ep_Q1_009_partial_21_0902 : Poly :=
[
  term ((-244839488185531284659 : Rat) / 290243508153948313977) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((489678976371062569318 : Rat) / 290243508153948313977) [(7, 1), (10, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 902 for generator 21. -/
theorem ep_Q1_009_partial_21_0902_valid :
    mulPoly ep_Q1_009_coefficient_21_0902
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0902 := by
  native_decide

/-- Coefficient term 903 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0903 : Poly :=
[
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 9721524698917511144289223677300526947430020292758205106789670641610212093368758462552489932746752) [(7, 1), (11, 1)]
]

/-- Partial product 903 for generator 21. -/
def ep_Q1_009_partial_21_0903 : Poly :=
[
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 4860762349458755572144611838650263473715010146379102553394835320805106046684379231276244966373376) [(7, 1), (10, 1), (11, 1)],
  term ((-1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 9721524698917511144289223677300526947430020292758205106789670641610212093368758462552489932746752) [(7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 903 for generator 21. -/
theorem ep_Q1_009_partial_21_0903_valid :
    mulPoly ep_Q1_009_coefficient_21_0903
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0903 := by
  native_decide

/-- Coefficient term 904 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0904 : Poly :=
[
  term ((-89803367602387146525321368308666155688121033102215684909722413577200745 : Rat) / 3562286867341931624659820087292666416507807177394516066682194427977033208) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 904 for generator 21. -/
def ep_Q1_009_partial_21_0904 : Poly :=
[
  term ((-89803367602387146525321368308666155688121033102215684909722413577200745 : Rat) / 1781143433670965812329910043646333208253903588697258033341097213988516604) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((89803367602387146525321368308666155688121033102215684909722413577200745 : Rat) / 3562286867341931624659820087292666416507807177394516066682194427977033208) [(7, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 904 for generator 21. -/
theorem ep_Q1_009_partial_21_0904_valid :
    mulPoly ep_Q1_009_coefficient_21_0904
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0904 := by
  native_decide

/-- Coefficient term 905 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0905 : Poly :=
[
  term ((-6822156743538641156806864833329881323449575888289446319838837215740198363574474166055988774778635 : Rat) / 426763361038789551721029908452924918079145236066022396801034648701638774932110676555503650321472) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 905 for generator 21. -/
def ep_Q1_009_partial_21_0905 : Poly :=
[
  term ((-6822156743538641156806864833329881323449575888289446319838837215740198363574474166055988774778635 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((6822156743538641156806864833329881323449575888289446319838837215740198363574474166055988774778635 : Rat) / 426763361038789551721029908452924918079145236066022396801034648701638774932110676555503650321472) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 905 for generator 21. -/
theorem ep_Q1_009_partial_21_0905_valid :
    mulPoly ep_Q1_009_coefficient_21_0905
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0905 := by
  native_decide

/-- Coefficient term 906 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0906 : Poly :=
[
  term ((-2870150 : Rat) / 1178831) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 906 for generator 21. -/
def ep_Q1_009_partial_21_0906 : Poly :=
[
  term ((-5740300 : Rat) / 1178831) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2870150 : Rat) / 1178831) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 906 for generator 21. -/
theorem ep_Q1_009_partial_21_0906_valid :
    mulPoly ep_Q1_009_coefficient_21_0906
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0906 := by
  native_decide

/-- Coefficient term 907 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0907 : Poly :=
[
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 907 for generator 21. -/
def ep_Q1_009_partial_21_0907 : Poly :=
[
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 907 for generator 21. -/
theorem ep_Q1_009_partial_21_0907_valid :
    mulPoly ep_Q1_009_coefficient_21_0907
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0907 := by
  native_decide

/-- Coefficient term 908 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0908 : Poly :=
[
  term ((5740300 : Rat) / 3536493) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 908 for generator 21. -/
def ep_Q1_009_partial_21_0908 : Poly :=
[
  term ((11480600 : Rat) / 3536493) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5740300 : Rat) / 3536493) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 908 for generator 21. -/
theorem ep_Q1_009_partial_21_0908_valid :
    mulPoly ep_Q1_009_coefficient_21_0908
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0908 := by
  native_decide

/-- Coefficient term 909 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0909 : Poly :=
[
  term ((-219568210273278840214859404875660 : Rat) / 24049240021528595265061175145067379) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 909 for generator 21. -/
def ep_Q1_009_partial_21_0909 : Poly :=
[
  term ((-439136420546557680429718809751320 : Rat) / 24049240021528595265061175145067379) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((219568210273278840214859404875660 : Rat) / 24049240021528595265061175145067379) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 909 for generator 21. -/
theorem ep_Q1_009_partial_21_0909_valid :
    mulPoly ep_Q1_009_coefficient_21_0909
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0909 := by
  native_decide

/-- Coefficient term 910 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0910 : Poly :=
[
  term ((-43040311099662021948291827895285987504176064215401815287460586481236381339786190620153380005181383 : Rat) / 82666026351339380478649861201535093090391329020052764513517607496685476984428218218983757931520) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 910 for generator 21. -/
def ep_Q1_009_partial_21_0910 : Poly :=
[
  term ((-43040311099662021948291827895285987504176064215401815287460586481236381339786190620153380005181383 : Rat) / 41333013175669690239324930600767546545195664510026382256758803748342738492214109109491878965760) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((43040311099662021948291827895285987504176064215401815287460586481236381339786190620153380005181383 : Rat) / 82666026351339380478649861201535093090391329020052764513517607496685476984428218218983757931520) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 910 for generator 21. -/
theorem ep_Q1_009_partial_21_0910_valid :
    mulPoly ep_Q1_009_coefficient_21_0910
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0910 := by
  native_decide

/-- Coefficient term 911 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0911 : Poly :=
[
  term ((236350347393293782360737203174990624119925715474192815166375077559673271004239951911504489826929015472456226629 : Rat) / 35024894735962520911066002615210032691771816477438443845859747131678486535076994673935151990910184137459225408) [(7, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 911 for generator 21. -/
def ep_Q1_009_partial_21_0911 : Poly :=
[
  term ((236350347393293782360737203174990624119925715474192815166375077559673271004239951911504489826929015472456226629 : Rat) / 17512447367981260455533001307605016345885908238719221922929873565839243267538497336967575995455092068729612704) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-236350347393293782360737203174990624119925715474192815166375077559673271004239951911504489826929015472456226629 : Rat) / 35024894735962520911066002615210032691771816477438443845859747131678486535076994673935151990910184137459225408) [(7, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 911 for generator 21. -/
theorem ep_Q1_009_partial_21_0911_valid :
    mulPoly ep_Q1_009_coefficient_21_0911
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0911 := by
  native_decide

/-- Coefficient term 912 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0912 : Poly :=
[
  term ((-248083229299708778654 : Rat) / 290243508153948313977) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 912 for generator 21. -/
def ep_Q1_009_partial_21_0912 : Poly :=
[
  term ((-496166458599417557308 : Rat) / 290243508153948313977) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((248083229299708778654 : Rat) / 290243508153948313977) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 912 for generator 21. -/
theorem ep_Q1_009_partial_21_0912_valid :
    mulPoly ep_Q1_009_coefficient_21_0912
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0912 := by
  native_decide

/-- Coefficient term 913 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0913 : Poly :=
[
  term ((-486595823 : Rat) / 9430648) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 913 for generator 21. -/
def ep_Q1_009_partial_21_0913 : Poly :=
[
  term ((-486595823 : Rat) / 4715324) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((486595823 : Rat) / 9430648) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 913 for generator 21. -/
theorem ep_Q1_009_partial_21_0913_valid :
    mulPoly ep_Q1_009_coefficient_21_0913
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0913 := by
  native_decide

/-- Coefficient term 914 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0914 : Poly :=
[
  term ((-4084695481228603654496030242325798095550013060668719202643421930217253017508075680097846322889230451525920277447 : Rat) / 840597473663100501865584062765040784602523595458522652300633931160283676841847872174443647781844419299021409792) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 914 for generator 21. -/
def ep_Q1_009_partial_21_0914 : Poly :=
[
  term ((-4084695481228603654496030242325798095550013060668719202643421930217253017508075680097846322889230451525920277447 : Rat) / 420298736831550250932792031382520392301261797729261326150316965580141838420923936087221823890922209649510704896) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((4084695481228603654496030242325798095550013060668719202643421930217253017508075680097846322889230451525920277447 : Rat) / 840597473663100501865584062765040784602523595458522652300633931160283676841847872174443647781844419299021409792) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 914 for generator 21. -/
theorem ep_Q1_009_partial_21_0914_valid :
    mulPoly ep_Q1_009_coefficient_21_0914
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0914 := by
  native_decide

/-- Coefficient term 915 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0915 : Poly :=
[
  term ((-232860040608931569697 : Rat) / 290243508153948313977) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 915 for generator 21. -/
def ep_Q1_009_partial_21_0915 : Poly :=
[
  term ((-465720081217863139394 : Rat) / 290243508153948313977) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((232860040608931569697 : Rat) / 290243508153948313977) [(7, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 915 for generator 21. -/
theorem ep_Q1_009_partial_21_0915_valid :
    mulPoly ep_Q1_009_coefficient_21_0915
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0915 := by
  native_decide

/-- Coefficient term 916 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0916 : Poly :=
[
  term ((11273221283 : Rat) / 792174432) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 916 for generator 21. -/
def ep_Q1_009_partial_21_0916 : Poly :=
[
  term ((11273221283 : Rat) / 396087216) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-11273221283 : Rat) / 792174432) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 916 for generator 21. -/
theorem ep_Q1_009_partial_21_0916_valid :
    mulPoly ep_Q1_009_coefficient_21_0916
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0916 := by
  native_decide

/-- Coefficient term 917 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0917 : Poly :=
[
  term ((50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 5121160332465474620652358901435099016949742832792268761612415784419665299185328118666043803857664) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 917 for generator 21. -/
def ep_Q1_009_partial_21_0917 : Poly :=
[
  term ((50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 5121160332465474620652358901435099016949742832792268761612415784419665299185328118666043803857664) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 917 for generator 21. -/
theorem ep_Q1_009_partial_21_0917_valid :
    mulPoly ep_Q1_009_coefficient_21_0917
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0917 := by
  native_decide

/-- Coefficient term 918 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0918 : Poly :=
[
  term ((10619555 : Rat) / 7072986) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 918 for generator 21. -/
def ep_Q1_009_partial_21_0918 : Poly :=
[
  term ((10619555 : Rat) / 3536493) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-10619555 : Rat) / 7072986) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 918 for generator 21. -/
theorem ep_Q1_009_partial_21_0918_valid :
    mulPoly ep_Q1_009_coefficient_21_0918
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0918 := by
  native_decide

/-- Coefficient term 919 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0919 : Poly :=
[
  term ((-3449173326224289277432497646660378786074034383946043349199055355607542546172348513977969643710919 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 919 for generator 21. -/
def ep_Q1_009_partial_21_0919 : Poly :=
[
  term ((-3449173326224289277432497646660378786074034383946043349199055355607542546172348513977969643710919 : Rat) / 15822794106311053294741574995606326411832715320244474457665479559912454579050713643477359916580) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((3449173326224289277432497646660378786074034383946043349199055355607542546172348513977969643710919 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(7, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 919 for generator 21. -/
theorem ep_Q1_009_partial_21_0919_valid :
    mulPoly ep_Q1_009_coefficient_21_0919
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0919 := by
  native_decide

/-- Coefficient term 920 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0920 : Poly :=
[
  term ((-662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 419092572628462544077625892622666637236212609105237184315552285644356848) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 920 for generator 21. -/
def ep_Q1_009_partial_21_0920 : Poly :=
[
  term ((-662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 209546286314231272038812946311333318618106304552618592157776142822178424) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 419092572628462544077625892622666637236212609105237184315552285644356848) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 920 for generator 21. -/
theorem ep_Q1_009_partial_21_0920_valid :
    mulPoly ep_Q1_009_coefficient_21_0920
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0920 := by
  native_decide

/-- Coefficient term 921 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0921 : Poly :=
[
  term ((-231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 921 for generator 21. -/
def ep_Q1_009_partial_21_0921 : Poly :=
[
  term ((-462052746268758187299831416284800 : Rat) / 24049240021528595265061175145067379) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(7, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 921 for generator 21. -/
theorem ep_Q1_009_partial_21_0921_valid :
    mulPoly ep_Q1_009_coefficient_21_0921
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0921 := by
  native_decide

/-- Coefficient term 922 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0922 : Poly :=
[
  term ((-88887402 : Rat) / 8251817) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 922 for generator 21. -/
def ep_Q1_009_partial_21_0922 : Poly :=
[
  term ((-177774804 : Rat) / 8251817) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((88887402 : Rat) / 8251817) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 922 for generator 21. -/
theorem ep_Q1_009_partial_21_0922_valid :
    mulPoly ep_Q1_009_coefficient_21_0922
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0922 := by
  native_decide

/-- Coefficient term 923 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0923 : Poly :=
[
  term ((-163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(7, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 923 for generator 21. -/
def ep_Q1_009_partial_21_0923 : Poly :=
[
  term ((-327908400577828390986977134137600 : Rat) / 24049240021528595265061175145067379) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(7, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 923 for generator 21. -/
theorem ep_Q1_009_partial_21_0923_valid :
    mulPoly ep_Q1_009_coefficient_21_0923
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0923 := by
  native_decide

/-- Coefficient term 924 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0924 : Poly :=
[
  term ((1300168350869481025331269525142894474756112040719918660361334333126490465154002533804124667288803492072276568009129 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 924 for generator 21. -/
def ep_Q1_009_partial_21_0924 : Poly :=
[
  term ((1300168350869481025331269525142894474756112040719918660361334333126490465154002533804124667288803492072276568009129 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1300168350869481025331269525142894474756112040719918660361334333126490465154002533804124667288803492072276568009129 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 924 for generator 21. -/
theorem ep_Q1_009_partial_21_0924_valid :
    mulPoly ep_Q1_009_coefficient_21_0924
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0924 := by
  native_decide

/-- Coefficient term 925 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0925 : Poly :=
[
  term ((66495632085931190729887 : Rat) / 4063409114155276395678) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 925 for generator 21. -/
def ep_Q1_009_partial_21_0925 : Poly :=
[
  term ((66495632085931190729887 : Rat) / 2031704557077638197839) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-66495632085931190729887 : Rat) / 4063409114155276395678) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 925 for generator 21. -/
theorem ep_Q1_009_partial_21_0925_valid :
    mulPoly ep_Q1_009_coefficient_21_0925
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0925 := by
  native_decide

/-- Coefficient term 926 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0926 : Poly :=
[
  term ((-81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 926 for generator 21. -/
def ep_Q1_009_partial_21_0926 : Poly :=
[
  term ((-81273192491475592624744306117067112718519949209838179 : Rat) / 142535977414811439821655628464178362087681092443638696) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 926 for generator 21. -/
theorem ep_Q1_009_partial_21_0926_valid :
    mulPoly ep_Q1_009_coefficient_21_0926
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0926 := by
  native_decide

/-- Coefficient term 927 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0927 : Poly :=
[
  term ((662786495307469 : Rat) / 1395206957462413) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 927 for generator 21. -/
def ep_Q1_009_partial_21_0927 : Poly :=
[
  term ((1325572990614938 : Rat) / 1395206957462413) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-662786495307469 : Rat) / 1395206957462413) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 927 for generator 21. -/
theorem ep_Q1_009_partial_21_0927_valid :
    mulPoly ep_Q1_009_coefficient_21_0927
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0927 := by
  native_decide

/-- Coefficient term 928 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0928 : Poly :=
[
  term ((-19915129645885903318181639785932662206861528521203201246944359351347961669647383519317300477796379344588909722448279 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 928 for generator 21. -/
def ep_Q1_009_partial_21_0928 : Poly :=
[
  term ((-19915129645885903318181639785932662206861528521203201246944359351347961669647383519317300477796379344588909722448279 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((19915129645885903318181639785932662206861528521203201246944359351347961669647383519317300477796379344588909722448279 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 928 for generator 21. -/
theorem ep_Q1_009_partial_21_0928_valid :
    mulPoly ep_Q1_009_coefficient_21_0928
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0928 := by
  native_decide

/-- Coefficient term 929 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0929 : Poly :=
[
  term ((-41291884327365669823040 : Rat) / 677234852359212732613) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 929 for generator 21. -/
def ep_Q1_009_partial_21_0929 : Poly :=
[
  term ((-82583768654731339646080 : Rat) / 677234852359212732613) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((41291884327365669823040 : Rat) / 677234852359212732613) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 929 for generator 21. -/
theorem ep_Q1_009_partial_21_0929_valid :
    mulPoly ep_Q1_009_coefficient_21_0929
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0929 := by
  native_decide

/-- Coefficient term 930 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0930 : Poly :=
[
  term ((-148957162083674758382439288244834021513862898223039 : Rat) / 3959332705966984439490434124004954502435585901212186) [(7, 1), (12, 1), (15, 3)]
]

/-- Partial product 930 for generator 21. -/
def ep_Q1_009_partial_21_0930 : Poly :=
[
  term ((-148957162083674758382439288244834021513862898223039 : Rat) / 1979666352983492219745217062002477251217792950606093) [(7, 1), (10, 1), (12, 1), (15, 3)],
  term ((148957162083674758382439288244834021513862898223039 : Rat) / 3959332705966984439490434124004954502435585901212186) [(7, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 930 for generator 21. -/
theorem ep_Q1_009_partial_21_0930_valid :
    mulPoly ep_Q1_009_coefficient_21_0930
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0930 := by
  native_decide

/-- Coefficient term 931 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0931 : Poly :=
[
  term ((60266866769928 : Rat) / 1395206957462413) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 931 for generator 21. -/
def ep_Q1_009_partial_21_0931 : Poly :=
[
  term ((120533733539856 : Rat) / 1395206957462413) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-60266866769928 : Rat) / 1395206957462413) [(7, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 931 for generator 21. -/
theorem ep_Q1_009_partial_21_0931_valid :
    mulPoly ep_Q1_009_coefficient_21_0931
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0931 := by
  native_decide

/-- Coefficient term 932 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0932 : Poly :=
[
  term ((6868267945820220013066770399411721101062985833476703822286152308420420332295716195431157224035595 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 932 for generator 21. -/
def ep_Q1_009_partial_21_0932 : Poly :=
[
  term ((6868267945820220013066770399411721101062985833476703822286152308420420332295716195431157224035595 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-6868267945820220013066770399411721101062985833476703822286152308420420332295716195431157224035595 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 932 for generator 21. -/
theorem ep_Q1_009_partial_21_0932_valid :
    mulPoly ep_Q1_009_coefficient_21_0932
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0932 := by
  native_decide

/-- Coefficient term 933 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0933 : Poly :=
[
  term ((2870150 : Rat) / 3536493) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 933 for generator 21. -/
def ep_Q1_009_partial_21_0933 : Poly :=
[
  term ((5740300 : Rat) / 3536493) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2870150 : Rat) / 3536493) [(7, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 933 for generator 21. -/
theorem ep_Q1_009_partial_21_0933_valid :
    mulPoly ep_Q1_009_coefficient_21_0933
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0933 := by
  native_decide

/-- Coefficient term 934 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0934 : Poly :=
[
  term ((12202134092466485380341061175625745781077280360533605586879846276968501964645386654114077022489611 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(7, 1), (13, 1)]
]

/-- Partial product 934 for generator 21. -/
def ep_Q1_009_partial_21_0934 : Poly :=
[
  term ((12202134092466485380341061175625745781077280360533605586879846276968501964645386654114077022489611 : Rat) / 216998319172265873756455885654029619362277238677638506847983719678799377084124072824832364570240) [(7, 1), (10, 1), (13, 1)],
  term ((-12202134092466485380341061175625745781077280360533605586879846276968501964645386654114077022489611 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 934 for generator 21. -/
theorem ep_Q1_009_partial_21_0934_valid :
    mulPoly ep_Q1_009_coefficient_21_0934
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0934 := by
  native_decide

/-- Coefficient term 935 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0935 : Poly :=
[
  term ((-19034021388281860488569344157563537744788771507691551706292121397896835898929114899874056506826677 : Rat) / 357408996283732027363574399900754667184927216645522246573149655941551915197380825829135659292160) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 935 for generator 21. -/
def ep_Q1_009_partial_21_0935 : Poly :=
[
  term ((-19034021388281860488569344157563537744788771507691551706292121397896835898929114899874056506826677 : Rat) / 178704498141866013681787199950377333592463608322761123286574827970775957598690412914567829646080) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((19034021388281860488569344157563537744788771507691551706292121397896835898929114899874056506826677 : Rat) / 357408996283732027363574399900754667184927216645522246573149655941551915197380825829135659292160) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 935 for generator 21. -/
theorem ep_Q1_009_partial_21_0935_valid :
    mulPoly ep_Q1_009_coefficient_21_0935
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0935 := by
  native_decide

/-- Coefficient term 936 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0936 : Poly :=
[
  term ((-196113760091852471060927690852056247300553383873117941037749038438864336297696511758065414791206611486136119303 : Rat) / 17512447367981260455533001307605016345885908238719221922929873565839243267538497336967575995455092068729612704) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 936 for generator 21. -/
def ep_Q1_009_partial_21_0936 : Poly :=
[
  term ((-196113760091852471060927690852056247300553383873117941037749038438864336297696511758065414791206611486136119303 : Rat) / 8756223683990630227766500653802508172942954119359610961464936782919621633769248668483787997727546034364806352) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((196113760091852471060927690852056247300553383873117941037749038438864336297696511758065414791206611486136119303 : Rat) / 17512447367981260455533001307605016345885908238719221922929873565839243267538497336967575995455092068729612704) [(7, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 936 for generator 21. -/
theorem ep_Q1_009_partial_21_0936_valid :
    mulPoly ep_Q1_009_coefficient_21_0936
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0936 := by
  native_decide

/-- Coefficient term 937 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0937 : Poly :=
[
  term ((-249019220037641232641 : Rat) / 290243508153948313977) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 937 for generator 21. -/
def ep_Q1_009_partial_21_0937 : Poly :=
[
  term ((-498038440075282465282 : Rat) / 290243508153948313977) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((249019220037641232641 : Rat) / 290243508153948313977) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 937 for generator 21. -/
theorem ep_Q1_009_partial_21_0937_valid :
    mulPoly ep_Q1_009_coefficient_21_0937
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0937 := by
  native_decide

/-- Coefficient term 938 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0938 : Poly :=
[
  term ((-57446659 : Rat) / 5824812) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 938 for generator 21. -/
def ep_Q1_009_partial_21_0938 : Poly :=
[
  term ((-57446659 : Rat) / 2912406) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((57446659 : Rat) / 5824812) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 938 for generator 21. -/
theorem ep_Q1_009_partial_21_0938_valid :
    mulPoly ep_Q1_009_coefficient_21_0938
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0938 := by
  native_decide

/-- Coefficient term 939 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0939 : Poly :=
[
  term ((603987828144425979910099760779548924977615102473919347107467358029743691513 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 939 for generator 21. -/
def ep_Q1_009_partial_21_0939 : Poly :=
[
  term ((603987828144425979910099760779548924977615102473919347107467358029743691513 : Rat) / 106868606020257948739794602618779992495234215321835482000465832839310996240) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((-603987828144425979910099760779548924977615102473919347107467358029743691513 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 939 for generator 21. -/
theorem ep_Q1_009_partial_21_0939_valid :
    mulPoly ep_Q1_009_coefficient_21_0939
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0939 := by
  native_decide

/-- Coefficient term 940 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0940 : Poly :=
[
  term ((56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(7, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 940 for generator 21. -/
def ep_Q1_009_partial_21_0940 : Poly :=
[
  term ((56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 63575628181339442486601007174807452342195040668907943386213932048572973599996984342021434911943149) [(7, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((-56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(7, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 940 for generator 21. -/
theorem ep_Q1_009_partial_21_0940_valid :
    mulPoly ep_Q1_009_coefficient_21_0940
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0940 := by
  native_decide

/-- Coefficient term 941 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0941 : Poly :=
[
  term ((-748503516560904 : Rat) / 1395206957462413) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 941 for generator 21. -/
def ep_Q1_009_partial_21_0941 : Poly :=
[
  term ((-1497007033121808 : Rat) / 1395206957462413) [(7, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((748503516560904 : Rat) / 1395206957462413) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 941 for generator 21. -/
theorem ep_Q1_009_partial_21_0941_valid :
    mulPoly ep_Q1_009_coefficient_21_0941
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0941 := by
  native_decide

/-- Coefficient term 942 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0942 : Poly :=
[
  term ((1707277761916124848851209895094106003351484359103058607511611630582068814038678730219526991759660245092023368061 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 942 for generator 21. -/
def ep_Q1_009_partial_21_0942 : Poly :=
[
  term ((1707277761916124848851209895094106003351484359103058607511611630582068814038678730219526991759660245092023368061 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1707277761916124848851209895094106003351484359103058607511611630582068814038678730219526991759660245092023368061 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 942 for generator 21. -/
theorem ep_Q1_009_partial_21_0942_valid :
    mulPoly ep_Q1_009_coefficient_21_0942
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0942 := by
  native_decide

/-- Coefficient term 943 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0943 : Poly :=
[
  term ((103757395561312078331 : Rat) / 96747836051316104659) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 943 for generator 21. -/
def ep_Q1_009_partial_21_0943 : Poly :=
[
  term ((207514791122624156662 : Rat) / 96747836051316104659) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-103757395561312078331 : Rat) / 96747836051316104659) [(7, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 943 for generator 21. -/
theorem ep_Q1_009_partial_21_0943_valid :
    mulPoly ep_Q1_009_coefficient_21_0943
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0943 := by
  native_decide

/-- Coefficient term 944 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0944 : Poly :=
[
  term ((9576953 : Rat) / 3536493) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 944 for generator 21. -/
def ep_Q1_009_partial_21_0944 : Poly :=
[
  term ((19153906 : Rat) / 3536493) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-9576953 : Rat) / 3536493) [(7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 944 for generator 21. -/
theorem ep_Q1_009_partial_21_0944_valid :
    mulPoly ep_Q1_009_coefficient_21_0944
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0944 := by
  native_decide

/-- Coefficient term 945 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0945 : Poly :=
[
  term ((2685681587687156963680270107155400 : Rat) / 24049240021528595265061175145067379) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 945 for generator 21. -/
def ep_Q1_009_partial_21_0945 : Poly :=
[
  term ((5371363175374313927360540214310800 : Rat) / 24049240021528595265061175145067379) [(7, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2685681587687156963680270107155400 : Rat) / 24049240021528595265061175145067379) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 945 for generator 21. -/
theorem ep_Q1_009_partial_21_0945_valid :
    mulPoly ep_Q1_009_coefficient_21_0945
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0945 := by
  native_decide

/-- Coefficient term 946 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0946 : Poly :=
[
  term ((-1259466356764840865381798537937600 : Rat) / 24049240021528595265061175145067379) [(7, 1), (13, 2), (14, 2), (15, 1)]
]

/-- Partial product 946 for generator 21. -/
def ep_Q1_009_partial_21_0946 : Poly :=
[
  term ((-2518932713529681730763597075875200 : Rat) / 24049240021528595265061175145067379) [(7, 1), (10, 1), (13, 2), (14, 2), (15, 1)],
  term ((1259466356764840865381798537937600 : Rat) / 24049240021528595265061175145067379) [(7, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 946 for generator 21. -/
theorem ep_Q1_009_partial_21_0946_valid :
    mulPoly ep_Q1_009_coefficient_21_0946
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0946 := by
  native_decide

/-- Coefficient term 947 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0947 : Poly :=
[
  term ((-39125434159854523924582498959600 : Rat) / 3435605717361227895008739306438197) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 947 for generator 21. -/
def ep_Q1_009_partial_21_0947 : Poly :=
[
  term ((-78250868319709047849164997919200 : Rat) / 3435605717361227895008739306438197) [(7, 1), (10, 1), (13, 2), (15, 1)],
  term ((39125434159854523924582498959600 : Rat) / 3435605717361227895008739306438197) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 947 for generator 21. -/
theorem ep_Q1_009_partial_21_0947_valid :
    mulPoly ep_Q1_009_coefficient_21_0947
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0947 := by
  native_decide

/-- Coefficient term 948 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0948 : Poly :=
[
  term ((208203454919722352372935297164044128904165298466338328076499477275538391377240650739900930589023163683559874835181 : Rat) / 164823034051588333699134129953929565608337959893827971039339986502016407223891739642047774074871454764514001920) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 948 for generator 21. -/
def ep_Q1_009_partial_21_0948 : Poly :=
[
  term ((208203454919722352372935297164044128904165298466338328076499477275538391377240650739900930589023163683559874835181 : Rat) / 82411517025794166849567064976964782804168979946913985519669993251008203611945869821023887037435727382257000960) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-208203454919722352372935297164044128904165298466338328076499477275538391377240650739900930589023163683559874835181 : Rat) / 164823034051588333699134129953929565608337959893827971039339986502016407223891739642047774074871454764514001920) [(7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 948 for generator 21. -/
theorem ep_Q1_009_partial_21_0948_valid :
    mulPoly ep_Q1_009_coefficient_21_0948
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0948 := by
  native_decide

/-- Coefficient term 949 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0949 : Poly :=
[
  term ((8186164079368897137541 : Rat) / 68292590153870191524) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 949 for generator 21. -/
def ep_Q1_009_partial_21_0949 : Poly :=
[
  term ((8186164079368897137541 : Rat) / 34146295076935095762) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8186164079368897137541 : Rat) / 68292590153870191524) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 949 for generator 21. -/
theorem ep_Q1_009_partial_21_0949_valid :
    mulPoly ep_Q1_009_coefficient_21_0949
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0949 := by
  native_decide

/-- Coefficient term 950 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0950 : Poly :=
[
  term ((806910417662736248398950823829891102253996563659415031067128209429176087976477619109630736310163763 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(7, 1), (14, 1), (15, 3)]
]

/-- Partial product 950 for generator 21. -/
def ep_Q1_009_partial_21_0950 : Poly :=
[
  term ((806910417662736248398950823829891102253996563659415031067128209429176087976477619109630736310163763 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(7, 1), (10, 1), (14, 1), (15, 3)],
  term ((-806910417662736248398950823829891102253996563659415031067128209429176087976477619109630736310163763 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(7, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 950 for generator 21. -/
theorem ep_Q1_009_partial_21_0950_valid :
    mulPoly ep_Q1_009_coefficient_21_0950
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0950 := by
  native_decide

/-- Coefficient term 951 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0951 : Poly :=
[
  term ((-1231996799995169 : Rat) / 1395206957462413) [(7, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 951 for generator 21. -/
def ep_Q1_009_partial_21_0951 : Poly :=
[
  term ((-2463993599990338 : Rat) / 1395206957462413) [(7, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((1231996799995169 : Rat) / 1395206957462413) [(7, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 951 for generator 21. -/
theorem ep_Q1_009_partial_21_0951_valid :
    mulPoly ep_Q1_009_coefficient_21_0951
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0951 := by
  native_decide

/-- Coefficient term 952 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0952 : Poly :=
[
  term ((-1210491191015533912548594051696731666162701839904257792858017215581470309840014810789987815586154291893136180819729 : Rat) / 1838806973638032347830965137298526716318020365065518301907636724413120543091542220381595479522784667216609333920) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 952 for generator 21. -/
def ep_Q1_009_partial_21_0952 : Poly :=
[
  term ((-1210491191015533912548594051696731666162701839904257792858017215581470309840014810789987815586154291893136180819729 : Rat) / 919403486819016173915482568649263358159010182532759150953818362206560271545771110190797739761392333608304666960) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((1210491191015533912548594051696731666162701839904257792858017215581470309840014810789987815586154291893136180819729 : Rat) / 1838806973638032347830965137298526716318020365065518301907636724413120543091542220381595479522784667216609333920) [(7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 952 for generator 21. -/
theorem ep_Q1_009_partial_21_0952_valid :
    mulPoly ep_Q1_009_coefficient_21_0952
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0952 := by
  native_decide

/-- Coefficient term 953 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0953 : Poly :=
[
  term ((-163640409211657409868253 : Rat) / 2708939409436850930452) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 953 for generator 21. -/
def ep_Q1_009_partial_21_0953 : Poly :=
[
  term ((-163640409211657409868253 : Rat) / 1354469704718425465226) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((163640409211657409868253 : Rat) / 2708939409436850930452) [(7, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 953 for generator 21. -/
theorem ep_Q1_009_partial_21_0953_valid :
    mulPoly ep_Q1_009_coefficient_21_0953
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0953 := by
  native_decide

/-- Coefficient term 954 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0954 : Poly :=
[
  term ((311299082557579037653676420766075658908360580866990064112500931935684282504824462711457709302311073 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(7, 1), (14, 3), (15, 1)]
]

/-- Partial product 954 for generator 21. -/
def ep_Q1_009_partial_21_0954 : Poly :=
[
  term ((311299082557579037653676420766075658908360580866990064112500931935684282504824462711457709302311073 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(7, 1), (10, 1), (14, 3), (15, 1)],
  term ((-311299082557579037653676420766075658908360580866990064112500931935684282504824462711457709302311073 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 954 for generator 21. -/
theorem ep_Q1_009_partial_21_0954_valid :
    mulPoly ep_Q1_009_coefficient_21_0954
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0954 := by
  native_decide

/-- Coefficient term 955 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0955 : Poly :=
[
  term ((-1539535942190298 : Rat) / 1395206957462413) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 955 for generator 21. -/
def ep_Q1_009_partial_21_0955 : Poly :=
[
  term ((-3079071884380596 : Rat) / 1395206957462413) [(7, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((1539535942190298 : Rat) / 1395206957462413) [(7, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 955 for generator 21. -/
theorem ep_Q1_009_partial_21_0955_valid :
    mulPoly ep_Q1_009_coefficient_21_0955
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0955 := by
  native_decide

/-- Coefficient term 956 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0956 : Poly :=
[
  term ((-517818759872130870449185084533631968145331411643508155188440710317534392662529864639835533776739199400276421873957 : Rat) / 4903485263034752927549240366129404576848054306841382138420364598434988114910779254350921278727425779244291557120) [(7, 1), (15, 1)]
]

/-- Partial product 956 for generator 21. -/
def ep_Q1_009_partial_21_0956 : Poly :=
[
  term ((-517818759872130870449185084533631968145331411643508155188440710317534392662529864639835533776739199400276421873957 : Rat) / 2451742631517376463774620183064702288424027153420691069210182299217494057455389627175460639363712889622145778560) [(7, 1), (10, 1), (15, 1)],
  term ((517818759872130870449185084533631968145331411643508155188440710317534392662529864639835533776739199400276421873957 : Rat) / 4903485263034752927549240366129404576848054306841382138420364598434988114910779254350921278727425779244291557120) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 956 for generator 21. -/
theorem ep_Q1_009_partial_21_0956_valid :
    mulPoly ep_Q1_009_coefficient_21_0956
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0956 := by
  native_decide

/-- Coefficient term 957 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0957 : Poly :=
[
  term ((-313886199051387222009587 : Rat) / 32507272913242211165424) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 957 for generator 21. -/
def ep_Q1_009_partial_21_0957 : Poly :=
[
  term ((-313886199051387222009587 : Rat) / 16253636456621105582712) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((313886199051387222009587 : Rat) / 32507272913242211165424) [(7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 957 for generator 21. -/
theorem ep_Q1_009_partial_21_0957_valid :
    mulPoly ep_Q1_009_coefficient_21_0957
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0957 := by
  native_decide

/-- Coefficient term 958 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0958 : Poly :=
[
  term ((-708647454365176050321414150642203243581422206620938439543371726172455340073293913049909443222126152127266163147 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(7, 1), (15, 3)]
]

/-- Partial product 958 for generator 21. -/
def ep_Q1_009_partial_21_0958 : Poly :=
[
  term ((-708647454365176050321414150642203243581422206620938439543371726172455340073293913049909443222126152127266163147 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(7, 1), (10, 1), (15, 3)],
  term ((708647454365176050321414150642203243581422206620938439543371726172455340073293913049909443222126152127266163147 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 958 for generator 21. -/
theorem ep_Q1_009_partial_21_0958_valid :
    mulPoly ep_Q1_009_coefficient_21_0958
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0958 := by
  native_decide

/-- Coefficient term 959 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0959 : Poly :=
[
  term ((244839488185531284659 : Rat) / 580487016307896627954) [(7, 1), (15, 3), (16, 1)]
]

/-- Partial product 959 for generator 21. -/
def ep_Q1_009_partial_21_0959 : Poly :=
[
  term ((244839488185531284659 : Rat) / 290243508153948313977) [(7, 1), (10, 1), (15, 3), (16, 1)],
  term ((-244839488185531284659 : Rat) / 580487016307896627954) [(7, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 959 for generator 21. -/
theorem ep_Q1_009_partial_21_0959_valid :
    mulPoly ep_Q1_009_coefficient_21_0959
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0959 := by
  native_decide

/-- Coefficient term 960 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0960 : Poly :=
[
  term ((-361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(7, 2)]
]

/-- Partial product 960 for generator 21. -/
def ep_Q1_009_partial_21_0960 : Poly :=
[
  term ((361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(7, 2)],
  term ((-361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 960 for generator 21. -/
theorem ep_Q1_009_partial_21_0960_valid :
    mulPoly ep_Q1_009_coefficient_21_0960
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0960 := by
  native_decide

/-- Coefficient term 961 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0961 : Poly :=
[
  term ((-252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 2), (8, 1)]
]

/-- Partial product 961 for generator 21. -/
def ep_Q1_009_partial_21_0961 : Poly :=
[
  term ((252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 2), (8, 1)],
  term ((-252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(7, 2), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 961 for generator 21. -/
theorem ep_Q1_009_partial_21_0961_valid :
    mulPoly ep_Q1_009_coefficient_21_0961
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0961 := by
  native_decide

/-- Coefficient term 962 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0962 : Poly :=
[
  term ((-252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(7, 2), (8, 1), (10, 1)]
]

/-- Partial product 962 for generator 21. -/
def ep_Q1_009_partial_21_0962 : Poly :=
[
  term ((252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(7, 2), (8, 1), (10, 1)],
  term ((-252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 2), (8, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 962 for generator 21. -/
theorem ep_Q1_009_partial_21_0962_valid :
    mulPoly ep_Q1_009_coefficient_21_0962
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0962 := by
  native_decide

/-- Coefficient term 963 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0963 : Poly :=
[
  term ((2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 963 for generator 21. -/
def ep_Q1_009_partial_21_0963 : Poly :=
[
  term ((-2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 963 for generator 21. -/
theorem ep_Q1_009_partial_21_0963_valid :
    mulPoly ep_Q1_009_coefficient_21_0963
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0963 := by
  native_decide

/-- Coefficient term 964 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0964 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 2), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 964 for generator 21. -/
def ep_Q1_009_partial_21_0964 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 2), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 2), (8, 1), (10, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 964 for generator 21. -/
theorem ep_Q1_009_partial_21_0964_valid :
    mulPoly ep_Q1_009_coefficient_21_0964
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0964 := by
  native_decide

/-- Coefficient term 965 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0965 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 2), (8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 965 for generator 21. -/
def ep_Q1_009_partial_21_0965 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 2), (8, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 965 for generator 21. -/
theorem ep_Q1_009_partial_21_0965_valid :
    mulPoly ep_Q1_009_coefficient_21_0965
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0965 := by
  native_decide

/-- Coefficient term 966 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0966 : Poly :=
[
  term ((363257840353929839941178450414105984144939596742275828955094937229007744389126674458030479765 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 2), (8, 1), (10, 1), (15, 2)]
]

/-- Partial product 966 for generator 21. -/
def ep_Q1_009_partial_21_0966 : Poly :=
[
  term ((-363257840353929839941178450414105984144939596742275828955094937229007744389126674458030479765 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 2), (8, 1), (10, 1), (15, 2)],
  term ((363257840353929839941178450414105984144939596742275828955094937229007744389126674458030479765 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 2), (8, 1), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 966 for generator 21. -/
theorem ep_Q1_009_partial_21_0966_valid :
    mulPoly ep_Q1_009_coefficient_21_0966
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0966 := by
  native_decide

/-- Coefficient term 967 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0967 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 106190892203620837686861381853151207592654068812983533084090957233488062912069629986390734592) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 967 for generator 21. -/
def ep_Q1_009_partial_21_0967 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 53095446101810418843430690926575603796327034406491766542045478616744031456034814993195367296) [(7, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 106190892203620837686861381853151207592654068812983533084090957233488062912069629986390734592) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 967 for generator 21. -/
theorem ep_Q1_009_partial_21_0967_valid :
    mulPoly ep_Q1_009_coefficient_21_0967
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0967 := by
  native_decide

/-- Coefficient term 968 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0968 : Poly :=
[
  term ((2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(7, 2), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 968 for generator 21. -/
def ep_Q1_009_partial_21_0968 : Poly :=
[
  term ((2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(7, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(7, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 968 for generator 21. -/
theorem ep_Q1_009_partial_21_0968_valid :
    mulPoly ep_Q1_009_coefficient_21_0968
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0968 := by
  native_decide

/-- Coefficient term 969 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0969 : Poly :=
[
  term ((252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 2), (8, 1), (12, 1)]
]

/-- Partial product 969 for generator 21. -/
def ep_Q1_009_partial_21_0969 : Poly :=
[
  term ((252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(7, 2), (8, 1), (10, 1), (12, 1)],
  term ((-252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 2), (8, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 969 for generator 21. -/
theorem ep_Q1_009_partial_21_0969_valid :
    mulPoly ep_Q1_009_coefficient_21_0969
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0969 := by
  native_decide

/-- Coefficient term 970 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0970 : Poly :=
[
  term ((13930389996111125604256887915360 : Rat) / 3435605717361227895008739306438197) [(7, 2), (8, 1), (12, 1), (15, 2)]
]

/-- Partial product 970 for generator 21. -/
def ep_Q1_009_partial_21_0970 : Poly :=
[
  term ((27860779992222251208513775830720 : Rat) / 3435605717361227895008739306438197) [(7, 2), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((-13930389996111125604256887915360 : Rat) / 3435605717361227895008739306438197) [(7, 2), (8, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 970 for generator 21. -/
theorem ep_Q1_009_partial_21_0970_valid :
    mulPoly ep_Q1_009_coefficient_21_0970
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0970 := by
  native_decide

/-- Coefficient term 971 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0971 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 318572676610862513060584145559453622777962206438950599252272871700464188736208889959172203776) [(7, 2), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 971 for generator 21. -/
def ep_Q1_009_partial_21_0971 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 159286338305431256530292072779726811388981103219475299626136435850232094368104444979586101888) [(7, 2), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 318572676610862513060584145559453622777962206438950599252272871700464188736208889959172203776) [(7, 2), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 971 for generator 21. -/
theorem ep_Q1_009_partial_21_0971_valid :
    mulPoly ep_Q1_009_coefficient_21_0971
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0971 := by
  native_decide

/-- Coefficient term 972 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0972 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 2), (8, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 972 for generator 21. -/
def ep_Q1_009_partial_21_0972 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(7, 2), (8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 2), (8, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 972 for generator 21. -/
theorem ep_Q1_009_partial_21_0972_valid :
    mulPoly ep_Q1_009_coefficient_21_0972
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0972 := by
  native_decide

/-- Coefficient term 973 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0973 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 973 for generator 21. -/
def ep_Q1_009_partial_21_0973 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 973 for generator 21. -/
theorem ep_Q1_009_partial_21_0973_valid :
    mulPoly ep_Q1_009_coefficient_21_0973
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0973 := by
  native_decide

/-- Coefficient term 974 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0974 : Poly :=
[
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 2), (8, 1), (14, 1)]
]

/-- Partial product 974 for generator 21. -/
def ep_Q1_009_partial_21_0974 : Poly :=
[
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 2), (8, 1), (10, 1), (14, 1)],
  term ((449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 2), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 974 for generator 21. -/
theorem ep_Q1_009_partial_21_0974_valid :
    mulPoly ep_Q1_009_coefficient_21_0974
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0974 := by
  native_decide

/-- Coefficient term 975 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0975 : Poly :=
[
  term ((-2400675554546264498048382892777847689956202738353741527938547289384752238967896469977044629105 : Rat) / 318572676610862513060584145559453622777962206438950599252272871700464188736208889959172203776) [(7, 2), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 975 for generator 21. -/
def ep_Q1_009_partial_21_0975 : Poly :=
[
  term ((-2400675554546264498048382892777847689956202738353741527938547289384752238967896469977044629105 : Rat) / 159286338305431256530292072779726811388981103219475299626136435850232094368104444979586101888) [(7, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((2400675554546264498048382892777847689956202738353741527938547289384752238967896469977044629105 : Rat) / 318572676610862513060584145559453622777962206438950599252272871700464188736208889959172203776) [(7, 2), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 975 for generator 21. -/
theorem ep_Q1_009_partial_21_0975_valid :
    mulPoly ep_Q1_009_coefficient_21_0975
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0975 := by
  native_decide

/-- Coefficient term 976 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0976 : Poly :=
[
  term ((363257840353929839941178450414105984144939596742275828955094937229007744389126674458030479765 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (15, 2)]
]

/-- Partial product 976 for generator 21. -/
def ep_Q1_009_partial_21_0976 : Poly :=
[
  term ((363257840353929839941178450414105984144939596742275828955094937229007744389126674458030479765 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 2), (8, 1), (10, 1), (15, 2)],
  term ((-363257840353929839941178450414105984144939596742275828955094937229007744389126674458030479765 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 976 for generator 21. -/
theorem ep_Q1_009_partial_21_0976_valid :
    mulPoly ep_Q1_009_coefficient_21_0976
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0976 := by
  native_decide

/-- Coefficient term 977 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0977 : Poly :=
[
  term ((-2090848205251017823563582711873231803641374246317214799088842030037027925689785041279822757 : Rat) / 9486935627264916278068532664872759053350618754545274756730217614776668874151267723716750080) [(7, 2), (9, 1), (10, 1), (11, 1)]
]

/-- Partial product 977 for generator 21. -/
def ep_Q1_009_partial_21_0977 : Poly :=
[
  term ((2090848205251017823563582711873231803641374246317214799088842030037027925689785041279822757 : Rat) / 9486935627264916278068532664872759053350618754545274756730217614776668874151267723716750080) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-2090848205251017823563582711873231803641374246317214799088842030037027925689785041279822757 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(7, 2), (9, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 977 for generator 21. -/
theorem ep_Q1_009_partial_21_0977_valid :
    mulPoly ep_Q1_009_coefficient_21_0977
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0977 := by
  native_decide

/-- Coefficient term 978 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0978 : Poly :=
[
  term ((31788491945925938335379491112718544000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 978 for generator 21. -/
def ep_Q1_009_partial_21_0978 : Poly :=
[
  term ((-31788491945925938335379491112718544000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((63576983891851876670758982225437088000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 978 for generator 21. -/
theorem ep_Q1_009_partial_21_0978_valid :
    mulPoly ep_Q1_009_coefficient_21_0978
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0978 := by
  native_decide

/-- Coefficient term 979 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0979 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(7, 2), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 979 for generator 21. -/
def ep_Q1_009_partial_21_0979 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(7, 2), (9, 1), (10, 1), (13, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(7, 2), (9, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 979 for generator 21. -/
theorem ep_Q1_009_partial_21_0979_valid :
    mulPoly ep_Q1_009_coefficient_21_0979
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0979 := by
  native_decide

/-- Coefficient term 980 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0980 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 980 for generator 21. -/
def ep_Q1_009_partial_21_0980 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(7, 2), (9, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 980 for generator 21. -/
theorem ep_Q1_009_partial_21_0980_valid :
    mulPoly ep_Q1_009_coefficient_21_0980
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0980 := by
  native_decide

/-- Coefficient term 981 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0981 : Poly :=
[
  term ((34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 981 for generator 21. -/
def ep_Q1_009_partial_21_0981 : Poly :=
[
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 981 for generator 21. -/
theorem ep_Q1_009_partial_21_0981_valid :
    mulPoly ep_Q1_009_coefficient_21_0981
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0981 := by
  native_decide

/-- Coefficient term 982 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0982 : Poly :=
[
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 982 for generator 21. -/
def ep_Q1_009_partial_21_0982 : Poly :=
[
  term ((34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((-68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 982 for generator 21. -/
theorem ep_Q1_009_partial_21_0982_valid :
    mulPoly ep_Q1_009_coefficient_21_0982
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0982 := by
  native_decide

/-- Coefficient term 983 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0983 : Poly :=
[
  term ((-42889918492753399106915517275188655213818513468334355991507515250361412802484208105003330914655885059045781355267 : Rat) / 78850226391326722805004640222491214920895698612376491055792552547116727820265511651640770584001051431636043932416) [(7, 2), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 983 for generator 21. -/
def ep_Q1_009_partial_21_0983 : Poly :=
[
  term ((42889918492753399106915517275188655213818513468334355991507515250361412802484208105003330914655885059045781355267 : Rat) / 78850226391326722805004640222491214920895698612376491055792552547116727820265511651640770584001051431636043932416) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((-42889918492753399106915517275188655213818513468334355991507515250361412802484208105003330914655885059045781355267 : Rat) / 39425113195663361402502320111245607460447849306188245527896276273558363910132755825820385292000525715818021966208) [(7, 2), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 983 for generator 21. -/
theorem ep_Q1_009_partial_21_0983_valid :
    mulPoly ep_Q1_009_coefficient_21_0983
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0983 := by
  native_decide

/-- Coefficient term 984 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0984 : Poly :=
[
  term ((122206284983427231132 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 984 for generator 21. -/
def ep_Q1_009_partial_21_0984 : Poly :=
[
  term ((-122206284983427231132 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((244412569966854462264 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 984 for generator 21. -/
theorem ep_Q1_009_partial_21_0984_valid :
    mulPoly ep_Q1_009_coefficient_21_0984
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0984 := by
  native_decide

/-- Coefficient term 985 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0985 : Poly :=
[
  term ((17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (15, 3)]
]

/-- Partial product 985 for generator 21. -/
def ep_Q1_009_partial_21_0985 : Poly :=
[
  term ((-17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (15, 3)],
  term ((34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 985 for generator 21. -/
theorem ep_Q1_009_partial_21_0985_valid :
    mulPoly ep_Q1_009_coefficient_21_0985
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0985 := by
  native_decide

/-- Coefficient term 986 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0986 : Poly :=
[
  term ((-2090848205251017823563582711873231803641374246317214799088842030037027925689785041279822757 : Rat) / 18973871254529832556137065329745518106701237509090549513460435229553337748302535447433500160) [(7, 2), (9, 1), (11, 1)]
]

/-- Partial product 986 for generator 21. -/
def ep_Q1_009_partial_21_0986 : Poly :=
[
  term ((-2090848205251017823563582711873231803641374246317214799088842030037027925689785041279822757 : Rat) / 9486935627264916278068532664872759053350618754545274756730217614776668874151267723716750080) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((2090848205251017823563582711873231803641374246317214799088842030037027925689785041279822757 : Rat) / 18973871254529832556137065329745518106701237509090549513460435229553337748302535447433500160) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 986 for generator 21. -/
theorem ep_Q1_009_partial_21_0986_valid :
    mulPoly ep_Q1_009_coefficient_21_0986
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0986 := by
  native_decide

/-- Coefficient term 987 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0987 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 225879419696783720906393634877922834603586160822506541826909943208968306527411136278970240) [(7, 2), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 987 for generator 21. -/
def ep_Q1_009_partial_21_0987 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 112939709848391860453196817438961417301793080411253270913454971604484153263705568139485120) [(7, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 225879419696783720906393634877922834603586160822506541826909943208968306527411136278970240) [(7, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 987 for generator 21. -/
theorem ep_Q1_009_partial_21_0987_valid :
    mulPoly ep_Q1_009_coefficient_21_0987
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0987 := by
  native_decide

/-- Coefficient term 988 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0988 : Poly :=
[
  term ((12028078033593598289062510150758368000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 988 for generator 21. -/
def ep_Q1_009_partial_21_0988 : Poly :=
[
  term ((24056156067187196578125020301516736000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-12028078033593598289062510150758368000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 988 for generator 21. -/
theorem ep_Q1_009_partial_21_0988_valid :
    mulPoly ep_Q1_009_coefficient_21_0988
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0988 := by
  native_decide

/-- Coefficient term 989 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0989 : Poly :=
[
  term ((15894245972962969167689745556359272000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 989 for generator 21. -/
def ep_Q1_009_partial_21_0989 : Poly :=
[
  term ((31788491945925938335379491112718544000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-15894245972962969167689745556359272000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 989 for generator 21. -/
theorem ep_Q1_009_partial_21_0989_valid :
    mulPoly ep_Q1_009_coefficient_21_0989
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0989 := by
  native_decide

/-- Coefficient term 990 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0990 : Poly :=
[
  term ((100489234252474902305822330813619744298018357811277704842290683409542721013059832408747703724794392702217418812269 : Rat) / 118275339586990084207506960333736822381343547918564736583688828820675091730398267477461155876001577147454065898624) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 990 for generator 21. -/
def ep_Q1_009_partial_21_0990 : Poly :=
[
  term ((100489234252474902305822330813619744298018357811277704842290683409542721013059832408747703724794392702217418812269 : Rat) / 59137669793495042103753480166868411190671773959282368291844414410337545865199133738730577938000788573727032949312) [(7, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-100489234252474902305822330813619744298018357811277704842290683409542721013059832408747703724794392702217418812269 : Rat) / 118275339586990084207506960333736822381343547918564736583688828820675091730398267477461155876001577147454065898624) [(7, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 990 for generator 21. -/
theorem ep_Q1_009_partial_21_0990_valid :
    mulPoly ep_Q1_009_coefficient_21_0990
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0990 := by
  native_decide

/-- Coefficient term 991 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0991 : Poly :=
[
  term ((-244412569966854462264 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 991 for generator 21. -/
def ep_Q1_009_partial_21_0991 : Poly :=
[
  term ((-488825139933708924528 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((244412569966854462264 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 991 for generator 21. -/
theorem ep_Q1_009_partial_21_0991_valid :
    mulPoly ep_Q1_009_coefficient_21_0991
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0991 := by
  native_decide

/-- Coefficient term 992 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0992 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(7, 2), (9, 1), (13, 1)]
]

/-- Partial product 992 for generator 21. -/
def ep_Q1_009_partial_21_0992 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(7, 2), (9, 1), (10, 1), (13, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 992 for generator 21. -/
theorem ep_Q1_009_partial_21_0992_valid :
    mulPoly ep_Q1_009_coefficient_21_0992
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0992 := by
  native_decide

/-- Coefficient term 993 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0993 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 135527651818070232543836180926753700762151696493503925096145965925380983916446681767382144) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 993 for generator 21. -/
def ep_Q1_009_partial_21_0993 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 67763825909035116271918090463376850381075848246751962548072982962690491958223340883691072) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 135527651818070232543836180926753700762151696493503925096145965925380983916446681767382144) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 993 for generator 21. -/
theorem ep_Q1_009_partial_21_0993_valid :
    mulPoly ep_Q1_009_coefficient_21_0993
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0993 := by
  native_decide

/-- Coefficient term 994 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0994 : Poly :=
[
  term ((60140390167967991445312550753791840000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 994 for generator 21. -/
def ep_Q1_009_partial_21_0994 : Poly :=
[
  term ((120280780335935982890625101507583680000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-60140390167967991445312550753791840000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 994 for generator 21. -/
theorem ep_Q1_009_partial_21_0994_valid :
    mulPoly ep_Q1_009_coefficient_21_0994
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0994 := by
  native_decide

/-- Coefficient term 995 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0995 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(7, 2), (9, 1), (13, 1), (14, 2)]
]

/-- Partial product 995 for generator 21. -/
def ep_Q1_009_partial_21_0995 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 59293347670405726737928329155454744083441367215907967229563860092354180463445423273229688) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(7, 2), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 995 for generator 21. -/
theorem ep_Q1_009_partial_21_0995_valid :
    mulPoly ep_Q1_009_coefficient_21_0995
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0995 := by
  native_decide

/-- Coefficient term 996 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0996 : Poly :=
[
  term ((-68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 996 for generator 21. -/
def ep_Q1_009_partial_21_0996 : Poly :=
[
  term ((-137463748955355409017857258865809920000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 996 for generator 21. -/
theorem ep_Q1_009_partial_21_0996_valid :
    mulPoly ep_Q1_009_coefficient_21_0996
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0996 := by
  native_decide

/-- Coefficient term 997 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0997 : Poly :=
[
  term ((-17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 997 for generator 21. -/
def ep_Q1_009_partial_21_0997 : Poly :=
[
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (13, 1), (15, 2)],
  term ((17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 997 for generator 21. -/
theorem ep_Q1_009_partial_21_0997_valid :
    mulPoly ep_Q1_009_coefficient_21_0997
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0997 := by
  native_decide

/-- Coefficient term 998 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0998 : Poly :=
[
  term ((3962870725943584101608237468120680177496189703057746077626890772921861092502833900069252121593217023306829880817555 : Rat) / 315400905565306891220018560889964859683582794449505964223170210188466911281062046606563082336004205726544175729664) [(7, 2), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 998 for generator 21. -/
def ep_Q1_009_partial_21_0998 : Poly :=
[
  term ((3962870725943584101608237468120680177496189703057746077626890772921861092502833900069252121593217023306829880817555 : Rat) / 157700452782653445610009280444982429841791397224752982111585105094233455640531023303281541168002102863272087864832) [(7, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-3962870725943584101608237468120680177496189703057746077626890772921861092502833900069252121593217023306829880817555 : Rat) / 315400905565306891220018560889964859683582794449505964223170210188466911281062046606563082336004205726544175729664) [(7, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 998 for generator 21. -/
theorem ep_Q1_009_partial_21_0998_valid :
    mulPoly ep_Q1_009_coefficient_21_0998
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0998 := by
  native_decide

/-- Coefficient term 999 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0999 : Poly :=
[
  term ((-23320267409785460644907 : Rat) / 4676338877845046513121) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 999 for generator 21. -/
def ep_Q1_009_partial_21_0999 : Poly :=
[
  term ((-46640534819570921289814 : Rat) / 4676338877845046513121) [(7, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((23320267409785460644907 : Rat) / 4676338877845046513121) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 999 for generator 21. -/
theorem ep_Q1_009_partial_21_0999_valid :
    mulPoly ep_Q1_009_coefficient_21_0999
        ep_Q1_009_generator_21_0900_0999 =
      ep_Q1_009_partial_21_0999 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_21_0900_0999 : List Poly :=
[
  ep_Q1_009_partial_21_0900,
  ep_Q1_009_partial_21_0901,
  ep_Q1_009_partial_21_0902,
  ep_Q1_009_partial_21_0903,
  ep_Q1_009_partial_21_0904,
  ep_Q1_009_partial_21_0905,
  ep_Q1_009_partial_21_0906,
  ep_Q1_009_partial_21_0907,
  ep_Q1_009_partial_21_0908,
  ep_Q1_009_partial_21_0909,
  ep_Q1_009_partial_21_0910,
  ep_Q1_009_partial_21_0911,
  ep_Q1_009_partial_21_0912,
  ep_Q1_009_partial_21_0913,
  ep_Q1_009_partial_21_0914,
  ep_Q1_009_partial_21_0915,
  ep_Q1_009_partial_21_0916,
  ep_Q1_009_partial_21_0917,
  ep_Q1_009_partial_21_0918,
  ep_Q1_009_partial_21_0919,
  ep_Q1_009_partial_21_0920,
  ep_Q1_009_partial_21_0921,
  ep_Q1_009_partial_21_0922,
  ep_Q1_009_partial_21_0923,
  ep_Q1_009_partial_21_0924,
  ep_Q1_009_partial_21_0925,
  ep_Q1_009_partial_21_0926,
  ep_Q1_009_partial_21_0927,
  ep_Q1_009_partial_21_0928,
  ep_Q1_009_partial_21_0929,
  ep_Q1_009_partial_21_0930,
  ep_Q1_009_partial_21_0931,
  ep_Q1_009_partial_21_0932,
  ep_Q1_009_partial_21_0933,
  ep_Q1_009_partial_21_0934,
  ep_Q1_009_partial_21_0935,
  ep_Q1_009_partial_21_0936,
  ep_Q1_009_partial_21_0937,
  ep_Q1_009_partial_21_0938,
  ep_Q1_009_partial_21_0939,
  ep_Q1_009_partial_21_0940,
  ep_Q1_009_partial_21_0941,
  ep_Q1_009_partial_21_0942,
  ep_Q1_009_partial_21_0943,
  ep_Q1_009_partial_21_0944,
  ep_Q1_009_partial_21_0945,
  ep_Q1_009_partial_21_0946,
  ep_Q1_009_partial_21_0947,
  ep_Q1_009_partial_21_0948,
  ep_Q1_009_partial_21_0949,
  ep_Q1_009_partial_21_0950,
  ep_Q1_009_partial_21_0951,
  ep_Q1_009_partial_21_0952,
  ep_Q1_009_partial_21_0953,
  ep_Q1_009_partial_21_0954,
  ep_Q1_009_partial_21_0955,
  ep_Q1_009_partial_21_0956,
  ep_Q1_009_partial_21_0957,
  ep_Q1_009_partial_21_0958,
  ep_Q1_009_partial_21_0959,
  ep_Q1_009_partial_21_0960,
  ep_Q1_009_partial_21_0961,
  ep_Q1_009_partial_21_0962,
  ep_Q1_009_partial_21_0963,
  ep_Q1_009_partial_21_0964,
  ep_Q1_009_partial_21_0965,
  ep_Q1_009_partial_21_0966,
  ep_Q1_009_partial_21_0967,
  ep_Q1_009_partial_21_0968,
  ep_Q1_009_partial_21_0969,
  ep_Q1_009_partial_21_0970,
  ep_Q1_009_partial_21_0971,
  ep_Q1_009_partial_21_0972,
  ep_Q1_009_partial_21_0973,
  ep_Q1_009_partial_21_0974,
  ep_Q1_009_partial_21_0975,
  ep_Q1_009_partial_21_0976,
  ep_Q1_009_partial_21_0977,
  ep_Q1_009_partial_21_0978,
  ep_Q1_009_partial_21_0979,
  ep_Q1_009_partial_21_0980,
  ep_Q1_009_partial_21_0981,
  ep_Q1_009_partial_21_0982,
  ep_Q1_009_partial_21_0983,
  ep_Q1_009_partial_21_0984,
  ep_Q1_009_partial_21_0985,
  ep_Q1_009_partial_21_0986,
  ep_Q1_009_partial_21_0987,
  ep_Q1_009_partial_21_0988,
  ep_Q1_009_partial_21_0989,
  ep_Q1_009_partial_21_0990,
  ep_Q1_009_partial_21_0991,
  ep_Q1_009_partial_21_0992,
  ep_Q1_009_partial_21_0993,
  ep_Q1_009_partial_21_0994,
  ep_Q1_009_partial_21_0995,
  ep_Q1_009_partial_21_0996,
  ep_Q1_009_partial_21_0997,
  ep_Q1_009_partial_21_0998,
  ep_Q1_009_partial_21_0999
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_21_0900_0999 : Poly :=
[
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 4860762349458755572144611838650263473715010146379102553394835320805106046684379231276244966373376) [(7, 1), (10, 1), (11, 1)],
  term ((-89803367602387146525321368308666155688121033102215684909722413577200745 : Rat) / 1781143433670965812329910043646333208253903588697258033341097213988516604) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-6822156743538641156806864833329881323449575888289446319838837215740198363574474166055988774778635 : Rat) / 213381680519394775860514954226462459039572618033011198400517324350819387466055338277751825160736) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5740300 : Rat) / 1178831) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 320072520779092163790772431339693688559358927049516797600775986526229081199083007416627737741104) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((11480600 : Rat) / 3536493) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-439136420546557680429718809751320 : Rat) / 24049240021528595265061175145067379) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-43040311099662021948291827895285987504176064215401815287460586481236381339786190620153380005181383 : Rat) / 41333013175669690239324930600767546545195664510026382256758803748342738492214109109491878965760) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((236350347393293782360737203174990624119925715474192815166375077559673271004239951911504489826929015472456226629 : Rat) / 17512447367981260455533001307605016345885908238719221922929873565839243267538497336967575995455092068729612704) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-496166458599417557308 : Rat) / 290243508153948313977) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-486595823 : Rat) / 4715324) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4084695481228603654496030242325798095550013060668719202643421930217253017508075680097846322889230451525920277447 : Rat) / 420298736831550250932792031382520392301261797729261326150316965580141838420923936087221823890922209649510704896) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-465720081217863139394 : Rat) / 290243508153948313977) [(7, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((11273221283 : Rat) / 396087216) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 2560580166232737310326179450717549508474871416396134380806207892209832649592664059333021901928832) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((10619555 : Rat) / 3536493) [(7, 1), (10, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3449173326224289277432497646660378786074034383946043349199055355607542546172348513977969643710919 : Rat) / 15822794106311053294741574995606326411832715320244474457665479559912454579050713643477359916580) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 209546286314231272038812946311333318618106304552618592157776142822178424) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-462052746268758187299831416284800 : Rat) / 24049240021528595265061175145067379) [(7, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-177774804 : Rat) / 8251817) [(7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-327908400577828390986977134137600 : Rat) / 24049240021528595265061175145067379) [(7, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((1300168350869481025331269525142894474756112040719918660361334333126490465154002533804124667288803492072276568009129 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((66495632085931190729887 : Rat) / 2031704557077638197839) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-81273192491475592624744306117067112718519949209838179 : Rat) / 142535977414811439821655628464178362087681092443638696) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((1325572990614938 : Rat) / 1395206957462413) [(7, 1), (10, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19915129645885903318181639785932662206861528521203201246944359351347961669647383519317300477796379344588909722448279 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-82583768654731339646080 : Rat) / 677234852359212732613) [(7, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-148957162083674758382439288244834021513862898223039 : Rat) / 1979666352983492219745217062002477251217792950606093) [(7, 1), (10, 1), (12, 1), (15, 3)],
  term ((120533733539856 : Rat) / 1395206957462413) [(7, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((6868267945820220013066770399411721101062985833476703822286152308420420332295716195431157224035595 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((5740300 : Rat) / 3536493) [(7, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((12202134092466485380341061175625745781077280360533605586879846276968501964645386654114077022489611 : Rat) / 216998319172265873756455885654029619362277238677638506847983719678799377084124072824832364570240) [(7, 1), (10, 1), (13, 1)],
  term ((-19034021388281860488569344157563537744788771507691551706292121397896835898929114899874056506826677 : Rat) / 178704498141866013681787199950377333592463608322761123286574827970775957598690412914567829646080) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-196113760091852471060927690852056247300553383873117941037749038438864336297696511758065414791206611486136119303 : Rat) / 8756223683990630227766500653802508172942954119359610961464936782919621633769248668483787997727546034364806352) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-498038440075282465282 : Rat) / 290243508153948313977) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-57446659 : Rat) / 2912406) [(7, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((603987828144425979910099760779548924977615102473919347107467358029743691513 : Rat) / 106868606020257948739794602618779992495234215321835482000465832839310996240) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 63575628181339442486601007174807452342195040668907943386213932048572973599996984342021434911943149) [(7, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1497007033121808 : Rat) / 1395206957462413) [(7, 1), (10, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((1707277761916124848851209895094106003351484359103058607511611630582068814038678730219526991759660245092023368061 : Rat) / 105074684207887562733198007845630098075315449432315331537579241395035459605230984021805455972730552412377676224) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((207514791122624156662 : Rat) / 96747836051316104659) [(7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((19153906 : Rat) / 3536493) [(7, 1), (10, 1), (13, 1), (16, 1)],
  term ((5371363175374313927360540214310800 : Rat) / 24049240021528595265061175145067379) [(7, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2518932713529681730763597075875200 : Rat) / 24049240021528595265061175145067379) [(7, 1), (10, 1), (13, 2), (14, 2), (15, 1)],
  term ((-78250868319709047849164997919200 : Rat) / 3435605717361227895008739306438197) [(7, 1), (10, 1), (13, 2), (15, 1)],
  term ((208203454919722352372935297164044128904165298466338328076499477275538391377240650739900930589023163683559874835181 : Rat) / 82411517025794166849567064976964782804168979946913985519669993251008203611945869821023887037435727382257000960) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((8186164079368897137541 : Rat) / 34146295076935095762) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((806910417662736248398950823829891102253996563659415031067128209429176087976477619109630736310163763 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(7, 1), (10, 1), (14, 1), (15, 3)],
  term ((-2463993599990338 : Rat) / 1395206957462413) [(7, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1210491191015533912548594051696731666162701839904257792858017215581470309840014810789987815586154291893136180819729 : Rat) / 919403486819016173915482568649263358159010182532759150953818362206560271545771110190797739761392333608304666960) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-163640409211657409868253 : Rat) / 1354469704718425465226) [(7, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((311299082557579037653676420766075658908360580866990064112500931935684282504824462711457709302311073 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(7, 1), (10, 1), (14, 3), (15, 1)],
  term ((-3079071884380596 : Rat) / 1395206957462413) [(7, 1), (10, 1), (14, 3), (15, 1), (16, 1)],
  term ((-517818759872130870449185084533631968145331411643508155188440710317534392662529864639835533776739199400276421873957 : Rat) / 2451742631517376463774620183064702288424027153420691069210182299217494057455389627175460639363712889622145778560) [(7, 1), (10, 1), (15, 1)],
  term ((-313886199051387222009587 : Rat) / 8126818228310552791356) [(7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-708647454365176050321414150642203243581422206620938439543371726172455340073293913049909443222126152127266163147 : Rat) / 52537342103943781366599003922815049037657724716157665768789620697517729802615492010902727986365276206188838112) [(7, 1), (10, 2), (15, 3)],
  term ((489678976371062569318 : Rat) / 290243508153948313977) [(7, 1), (10, 2), (15, 3), (16, 1)],
  term ((-1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 9721524698917511144289223677300526947430020292758205106789670641610212093368758462552489932746752) [(7, 1), (11, 1)],
  term ((89803367602387146525321368308666155688121033102215684909722413577200745 : Rat) / 3562286867341931624659820087292666416507807177394516066682194427977033208) [(7, 1), (11, 1), (12, 1)],
  term ((6822156743538641156806864833329881323449575888289446319838837215740198363574474166055988774778635 : Rat) / 426763361038789551721029908452924918079145236066022396801034648701638774932110676555503650321472) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2870150 : Rat) / 1178831) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5740300 : Rat) / 3536493) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((219568210273278840214859404875660 : Rat) / 24049240021528595265061175145067379) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((43040311099662021948291827895285987504176064215401815287460586481236381339786190620153380005181383 : Rat) / 82666026351339380478649861201535093090391329020052764513517607496685476984428218218983757931520) [(7, 1), (11, 1), (14, 1)],
  term ((-236350347393293782360737203174990624119925715474192815166375077559673271004239951911504489826929015472456226629 : Rat) / 35024894735962520911066002615210032691771816477438443845859747131678486535076994673935151990910184137459225408) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((248083229299708778654 : Rat) / 290243508153948313977) [(7, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((486595823 : Rat) / 9430648) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((4084695481228603654496030242325798095550013060668719202643421930217253017508075680097846322889230451525920277447 : Rat) / 840597473663100501865584062765040784602523595458522652300633931160283676841847872174443647781844419299021409792) [(7, 1), (11, 1), (15, 2)],
  term ((232860040608931569697 : Rat) / 290243508153948313977) [(7, 1), (11, 1), (15, 2), (16, 1)],
  term ((-11273221283 : Rat) / 792174432) [(7, 1), (11, 1), (16, 1)],
  term ((-50225308689319069795474410566801202459327795282394338506575064989749621813547460486109672331868395 : Rat) / 5121160332465474620652358901435099016949742832792268761612415784419665299185328118666043803857664) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-10619555 : Rat) / 7072986) [(7, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((3449173326224289277432497646660378786074034383946043349199055355607542546172348513977969643710919 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(7, 1), (12, 1), (13, 1)],
  term ((662993486393098066241781954416324529220254799783649727278894270346409 : Rat) / 419092572628462544077625892622666637236212609105237184315552285644356848) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((231026373134379093649915708142400 : Rat) / 24049240021528595265061175145067379) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((88887402 : Rat) / 8251817) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1300168350869481025331269525142894474756112040719918660361334333126490465154002533804124667288803492072276568009129 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-66495632085931190729887 : Rat) / 4063409114155276395678) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-662786495307469 : Rat) / 1395206957462413) [(7, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((19915129645885903318181639785932662206861528521203201246944359351347961669647383519317300477796379344588909722448279 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(7, 1), (12, 1), (15, 1)],
  term ((41291884327365669823040 : Rat) / 677234852359212732613) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((148957162083674758382439288244834021513862898223039 : Rat) / 3959332705966984439490434124004954502435585901212186) [(7, 1), (12, 1), (15, 3)],
  term ((-60266866769928 : Rat) / 1395206957462413) [(7, 1), (12, 1), (15, 3), (16, 1)],
  term ((-6868267945820220013066770399411721101062985833476703822286152308420420332295716195431157224035595 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(7, 1), (12, 2), (15, 1)],
  term ((-2870150 : Rat) / 3536493) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-12202134092466485380341061175625745781077280360533605586879846276968501964645386654114077022489611 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(7, 1), (13, 1)],
  term ((19034021388281860488569344157563537744788771507691551706292121397896835898929114899874056506826677 : Rat) / 357408996283732027363574399900754667184927216645522246573149655941551915197380825829135659292160) [(7, 1), (13, 1), (14, 1)],
  term ((196113760091852471060927690852056247300553383873117941037749038438864336297696511758065414791206611486136119303 : Rat) / 17512447367981260455533001307605016345885908238719221922929873565839243267538497336967575995455092068729612704) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((249019220037641232641 : Rat) / 290243508153948313977) [(7, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((57446659 : Rat) / 5824812) [(7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-603987828144425979910099760779548924977615102473919347107467358029743691513 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(7, 1), (13, 1), (14, 2)],
  term ((-56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(7, 1), (13, 1), (14, 2), (15, 2)],
  term ((748503516560904 : Rat) / 1395206957462413) [(7, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1707277761916124848851209895094106003351484359103058607511611630582068814038678730219526991759660245092023368061 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(7, 1), (13, 1), (15, 2)],
  term ((-103757395561312078331 : Rat) / 96747836051316104659) [(7, 1), (13, 1), (15, 2), (16, 1)],
  term ((-9576953 : Rat) / 3536493) [(7, 1), (13, 1), (16, 1)],
  term ((-2685681587687156963680270107155400 : Rat) / 24049240021528595265061175145067379) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((1259466356764840865381798537937600 : Rat) / 24049240021528595265061175145067379) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((39125434159854523924582498959600 : Rat) / 3435605717361227895008739306438197) [(7, 1), (13, 2), (15, 1)],
  term ((-208203454919722352372935297164044128904165298466338328076499477275538391377240650739900930589023163683559874835181 : Rat) / 164823034051588333699134129953929565608337959893827971039339986502016407223891739642047774074871454764514001920) [(7, 1), (14, 1), (15, 1)],
  term ((-8186164079368897137541 : Rat) / 68292590153870191524) [(7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-806910417662736248398950823829891102253996563659415031067128209429176087976477619109630736310163763 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(7, 1), (14, 1), (15, 3)],
  term ((1231996799995169 : Rat) / 1395206957462413) [(7, 1), (14, 1), (15, 3), (16, 1)],
  term ((1210491191015533912548594051696731666162701839904257792858017215581470309840014810789987815586154291893136180819729 : Rat) / 1838806973638032347830965137298526716318020365065518301907636724413120543091542220381595479522784667216609333920) [(7, 1), (14, 2), (15, 1)],
  term ((163640409211657409868253 : Rat) / 2708939409436850930452) [(7, 1), (14, 2), (15, 1), (16, 1)],
  term ((-311299082557579037653676420766075658908360580866990064112500931935684282504824462711457709302311073 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(7, 1), (14, 3), (15, 1)],
  term ((1539535942190298 : Rat) / 1395206957462413) [(7, 1), (14, 3), (15, 1), (16, 1)],
  term ((517818759872130870449185084533631968145331411643508155188440710317534392662529864639835533776739199400276421873957 : Rat) / 4903485263034752927549240366129404576848054306841382138420364598434988114910779254350921278727425779244291557120) [(7, 1), (15, 1)],
  term ((313886199051387222009587 : Rat) / 32507272913242211165424) [(7, 1), (15, 1), (16, 1)],
  term ((708647454365176050321414150642203243581422206620938439543371726172455340073293913049909443222126152127266163147 : Rat) / 210149368415775125466396015691260196150630898864630663075158482790070919210461968043610911945461104824755352448) [(7, 1), (15, 3)],
  term ((-244839488185531284659 : Rat) / 580487016307896627954) [(7, 1), (15, 3), (16, 1)],
  term ((361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(7, 2)],
  term ((252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 2), (8, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 53095446101810418843430690926575603796327034406491766542045478616744031456034814993195367296) [(7, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(7, 2), (8, 1), (10, 1), (12, 1)],
  term ((27860779992222251208513775830720 : Rat) / 3435605717361227895008739306438197) [(7, 2), (8, 1), (10, 1), (12, 1), (15, 2)],
  term ((1827591754342139974266163815549484776537733487462655411897745874283491964175071035824218114025 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 2), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 139375546017252349464005563682260959965358465317040887172869381368953082572091389357137839152) [(7, 2), (8, 1), (10, 1), (13, 1), (14, 2), (15, 1)],
  term ((-449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 2), (8, 1), (10, 1), (14, 1)],
  term ((-2400675554546264498048382892777847689956202738353741527938547289384752238967896469977044629105 : Rat) / 159286338305431256530292072779726811388981103219475299626136435850232094368104444979586101888) [(7, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 2), (8, 1), (10, 2)],
  term ((2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 2), (8, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 2), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((363257840353929839941178450414105984144939596742275828955094937229007744389126674458030479765 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 2), (8, 1), (10, 2), (15, 2)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 106190892203620837686861381853151207592654068812983533084090957233488062912069629986390734592) [(7, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(7, 2), (8, 1), (11, 1), (15, 1)],
  term ((-252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 2), (8, 1), (12, 1)],
  term ((-13930389996111125604256887915360 : Rat) / 3435605717361227895008739306438197) [(7, 2), (8, 1), (12, 1), (15, 2)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 318572676610862513060584145559453622777962206438950599252272871700464188736208889959172203776) [(7, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 2), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 2), (8, 1), (13, 1), (15, 1)],
  term ((449130101129454428491796242000690653478090848365018915555828264158336271796856412593319377807901 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 2), (8, 1), (14, 1)],
  term ((2400675554546264498048382892777847689956202738353741527938547289384752238967896469977044629105 : Rat) / 318572676610862513060584145559453622777962206438950599252272871700464188736208889959172203776) [(7, 2), (8, 1), (14, 1), (15, 2)],
  term ((-363257840353929839941178450414105984144939596742275828955094937229007744389126674458030479765 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 2), (8, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 112939709848391860453196817438961417301793080411253270913454971604484153263705568139485120) [(7, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((24056156067187196578125020301516736000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((100489234252474902305822330813619744298018357811277704842290683409542721013059832408747703724794392702217418812269 : Rat) / 59137669793495042103753480166868411190671773959282368291844414410337545865199133738730577938000788573727032949312) [(7, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-488825139933708924528 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-282547054763651057238321988090977270762347871123947945822816490545544314282403383956732805 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((85914843097097130636160786791131200000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 59293347670405726737928329155454744083441367215907967229563860092354180463445423273229688) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-137463748955355409017857258865809920000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((3962870725943584101608237468120680177496189703057746077626890772921861092502833900069252121593217023306829880817555 : Rat) / 157700452782653445610009280444982429841791397224752982111585105094233455640531023303281541168002102863272087864832) [(7, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-46640534819570921289814 : Rat) / 4676338877845046513121) [(7, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((42889918492753399106915517275188655213818513468334355991507515250361412802484208105003330914655885059045781355267 : Rat) / 78850226391326722805004640222491214920895698612376491055792552547116727820265511651640770584001051431636043932416) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((-122206284983427231132 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 1), (15, 3)],
  term ((-2090848205251017823563582711873231803641374246317214799088842030037027925689785041279822757 : Rat) / 4743467813632458139034266332436379526675309377272637378365108807388334437075633861858375040) [(7, 2), (9, 1), (10, 2), (11, 1)],
  term ((63576983891851876670758982225437088000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 2), (11, 1), (15, 2)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(7, 2), (9, 1), (10, 2), (13, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(7, 2), (9, 1), (10, 2), (13, 1), (14, 1)],
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((-68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 2), (13, 1), (15, 2)],
  term ((-42889918492753399106915517275188655213818513468334355991507515250361412802484208105003330914655885059045781355267 : Rat) / 39425113195663361402502320111245607460447849306188245527896276273558363910132755825820385292000525715818021966208) [(7, 2), (9, 1), (10, 2), (15, 1)],
  term ((244412569966854462264 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (10, 2), (15, 3)],
  term ((2090848205251017823563582711873231803641374246317214799088842030037027925689785041279822757 : Rat) / 18973871254529832556137065329745518106701237509090549513460435229553337748302535447433500160) [(7, 2), (9, 1), (11, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 225879419696783720906393634877922834603586160822506541826909943208968306527411136278970240) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((-12028078033593598289062510150758368000 : Rat) / 714705621776938877770773029179031683713) [(7, 2), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-15894245972962969167689745556359272000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (11, 1), (15, 2)],
  term ((-100489234252474902305822330813619744298018357811277704842290683409542721013059832408747703724794392702217418812269 : Rat) / 118275339586990084207506960333736822381343547918564736583688828820675091730398267477461155876001577147454065898624) [(7, 2), (9, 1), (12, 1), (15, 1)],
  term ((244412569966854462264 : Rat) / 519593208649449612569) [(7, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 474346781363245813903426633243637952667530937727263737836510880738833443707563386185837504) [(7, 2), (9, 1), (13, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 135527651818070232543836180926753700762151696493503925096145965925380983916446681767382144) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((-60140390167967991445312550753791840000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(7, 2), (9, 1), (13, 1), (14, 2)],
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (14, 2), (15, 2)],
  term ((17182968619419426127232157358226240000 : Rat) / 2144116865330816633312319087537095051139) [(7, 2), (9, 1), (13, 1), (15, 2)],
  term ((-3962870725943584101608237468120680177496189703057746077626890772921861092502833900069252121593217023306829880817555 : Rat) / 315400905565306891220018560889964859683582794449505964223170210188466911281062046606563082336004205726544175729664) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term ((23320267409785460644907 : Rat) / 4676338877845046513121) [(7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-361519923054117364070052307551841959013777348885416620900212006467653749040597887469935833130993 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(7, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 900 through 999. -/
theorem ep_Q1_009_block_21_0900_0999_valid :
    checkProductSumEq ep_Q1_009_partials_21_0900_0999
      ep_Q1_009_block_21_0900_0999 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
