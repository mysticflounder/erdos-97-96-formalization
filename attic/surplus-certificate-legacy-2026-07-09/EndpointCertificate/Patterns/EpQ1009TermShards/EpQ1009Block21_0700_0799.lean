/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 21:700-799

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_21_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0700 : Poly :=
[
  term ((5901673312616415253973 : Rat) / 1160974032615793255908) [(6, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 700 for generator 21. -/
def ep_Q1_009_partial_21_0700 : Poly :=
[
  term ((-5901673312616415253973 : Rat) / 1160974032615793255908) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((5901673312616415253973 : Rat) / 580487016307896627954) [(6, 1), (10, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 21. -/
theorem ep_Q1_009_partial_21_0700_valid :
    mulPoly ep_Q1_009_coefficient_21_0700
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0701 : Poly :=
[
  term ((-11273221283 : Rat) / 792174432) [(6, 1), (10, 1), (16, 1)]
]

/-- Partial product 701 for generator 21. -/
def ep_Q1_009_partial_21_0701 : Poly :=
[
  term ((11273221283 : Rat) / 792174432) [(6, 1), (10, 1), (16, 1)],
  term ((-11273221283 : Rat) / 396087216) [(6, 1), (10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 21. -/
theorem ep_Q1_009_partial_21_0701_valid :
    mulPoly ep_Q1_009_coefficient_21_0701
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0702 : Poly :=
[
  term ((-1361885632799918303146907960026523559487026399571887339799255357735611753010265325886166698857295 : Rat) / 150622362719572782960363497101032324027933612729184375341541640718225449976039062313707170701696) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 702 for generator 21. -/
def ep_Q1_009_partial_21_0702 : Poly :=
[
  term ((-1361885632799918303146907960026523559487026399571887339799255357735611753010265325886166698857295 : Rat) / 75311181359786391480181748550516162013966806364592187670770820359112724988019531156853585350848) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1361885632799918303146907960026523559487026399571887339799255357735611753010265325886166698857295 : Rat) / 150622362719572782960363497101032324027933612729184375341541640718225449976039062313707170701696) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 21. -/
theorem ep_Q1_009_partial_21_0702_valid :
    mulPoly ep_Q1_009_coefficient_21_0702
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0703 : Poly :=
[
  term ((-287015 : Rat) / 208029) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 703 for generator 21. -/
def ep_Q1_009_partial_21_0703 : Poly :=
[
  term ((-574030 : Rat) / 208029) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((287015 : Rat) / 208029) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 21. -/
theorem ep_Q1_009_partial_21_0703_valid :
    mulPoly ep_Q1_009_coefficient_21_0703
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0704 : Poly :=
[
  term ((-12196663679624560648393610300846755184382038403594167552415372801593120641364365604927807459826011 : Rat) / 216998319172265873756455885654029619362277238677638506847983719678799377084124072824832364570240) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 704 for generator 21. -/
def ep_Q1_009_partial_21_0704 : Poly :=
[
  term ((-12196663679624560648393610300846755184382038403594167552415372801593120641364365604927807459826011 : Rat) / 108499159586132936878227942827014809681138619338819253423991859839399688542062036412416182285120) [(6, 1), (10, 1), (11, 1), (13, 1)],
  term ((12196663679624560648393610300846755184382038403594167552415372801593120641364365604927807459826011 : Rat) / 216998319172265873756455885654029619362277238677638506847983719678799377084124072824832364570240) [(6, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 21. -/
theorem ep_Q1_009_partial_21_0704_valid :
    mulPoly ep_Q1_009_coefficient_21_0704
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0705 : Poly :=
[
  term ((354111522875714572442928955329749603834161031929717808302948435712421302983 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(6, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 705 for generator 21. -/
def ep_Q1_009_partial_21_0705 : Poly :=
[
  term ((354111522875714572442928955329749603834161031929717808302948435712421302983 : Rat) / 106868606020257948739794602618779992495234215321835482000465832839310996240) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-354111522875714572442928955329749603834161031929717808302948435712421302983 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(6, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 21. -/
theorem ep_Q1_009_partial_21_0705_valid :
    mulPoly ep_Q1_009_coefficient_21_0705
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0706 : Poly :=
[
  term ((59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 706 for generator 21. -/
def ep_Q1_009_partial_21_0706 : Poly :=
[
  term ((59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 21. -/
theorem ep_Q1_009_partial_21_0706_valid :
    mulPoly ep_Q1_009_coefficient_21_0706
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0707 : Poly :=
[
  term ((-374251758280452 : Rat) / 1395206957462413) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 707 for generator 21. -/
def ep_Q1_009_partial_21_0707 : Poly :=
[
  term ((-748503516560904 : Rat) / 1395206957462413) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((374251758280452 : Rat) / 1395206957462413) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 21. -/
theorem ep_Q1_009_partial_21_0707_valid :
    mulPoly ep_Q1_009_coefficient_21_0707
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0708 : Poly :=
[
  term ((-33367560542910511887212332286056933753354916329707112806012591410024920774033965106793322439878307 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 708 for generator 21. -/
def ep_Q1_009_partial_21_0708 : Poly :=
[
  term ((-33367560542910511887212332286056933753354916329707112806012591410024920774033965106793322439878307 : Rat) / 63575628181339442486601007174807452342195040668907943386213932048572973599996984342021434911943149) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((33367560542910511887212332286056933753354916329707112806012591410024920774033965106793322439878307 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(6, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 21. -/
theorem ep_Q1_009_partial_21_0708_valid :
    mulPoly ep_Q1_009_coefficient_21_0708
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0709 : Poly :=
[
  term ((404385191665416 : Rat) / 1395206957462413) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 709 for generator 21. -/
def ep_Q1_009_partial_21_0709 : Poly :=
[
  term ((808770383330832 : Rat) / 1395206957462413) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-404385191665416 : Rat) / 1395206957462413) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 21. -/
theorem ep_Q1_009_partial_21_0709_valid :
    mulPoly ep_Q1_009_coefficient_21_0709
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0710 : Poly :=
[
  term ((-19153906 : Rat) / 3536493) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 710 for generator 21. -/
def ep_Q1_009_partial_21_0710 : Poly :=
[
  term ((-38307812 : Rat) / 3536493) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((19153906 : Rat) / 3536493) [(6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 21. -/
theorem ep_Q1_009_partial_21_0710_valid :
    mulPoly ep_Q1_009_coefficient_21_0710
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0711 : Poly :=
[
  term ((-629733178382420432690899268968800 : Rat) / 24049240021528595265061175145067379) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 711 for generator 21. -/
def ep_Q1_009_partial_21_0711 : Poly :=
[
  term ((-1259466356764840865381798537937600 : Rat) / 24049240021528595265061175145067379) [(6, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((629733178382420432690899268968800 : Rat) / 24049240021528595265061175145067379) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 21. -/
theorem ep_Q1_009_partial_21_0711_valid :
    mulPoly ep_Q1_009_coefficient_21_0711
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0712 : Poly :=
[
  term ((78250868319709047849164997919200 : Rat) / 3435605717361227895008739306438197) [(6, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 712 for generator 21. -/
def ep_Q1_009_partial_21_0712 : Poly :=
[
  term ((156501736639418095698329995838400 : Rat) / 3435605717361227895008739306438197) [(6, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-78250868319709047849164997919200 : Rat) / 3435605717361227895008739306438197) [(6, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 21. -/
theorem ep_Q1_009_partial_21_0712_valid :
    mulPoly ep_Q1_009_coefficient_21_0712
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0713 : Poly :=
[
  term ((-461926934853654595314290143808267164822768382541453113655824235490694116905604964269857562494815498201825760160895 : Rat) / 840597473663100501865584062765040784602523595458522652300633931160283676841847872174443647781844419299021409792) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 713 for generator 21. -/
def ep_Q1_009_partial_21_0713 : Poly :=
[
  term ((-461926934853654595314290143808267164822768382541453113655824235490694116905604964269857562494815498201825760160895 : Rat) / 420298736831550250932792031382520392301261797729261326150316965580141838420923936087221823890922209649510704896) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((461926934853654595314290143808267164822768382541453113655824235490694116905604964269857562494815498201825760160895 : Rat) / 840597473663100501865584062765040784602523595458522652300633931160283676841847872174443647781844419299021409792) [(6, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 21. -/
theorem ep_Q1_009_partial_21_0713_valid :
    mulPoly ep_Q1_009_coefficient_21_0713
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0714 : Poly :=
[
  term ((-33129843455955574156685 : Rat) / 580487016307896627954) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 714 for generator 21. -/
def ep_Q1_009_partial_21_0714 : Poly :=
[
  term ((-33129843455955574156685 : Rat) / 290243508153948313977) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((33129843455955574156685 : Rat) / 580487016307896627954) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 21. -/
theorem ep_Q1_009_partial_21_0714_valid :
    mulPoly ep_Q1_009_coefficient_21_0714
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0715 : Poly :=
[
  term ((21098765420225759898486073251488458150010862660447631 : Rat) / 63349323295471751031846945984079272038969374419394976) [(6, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 715 for generator 21. -/
def ep_Q1_009_partial_21_0715 : Poly :=
[
  term ((21098765420225759898486073251488458150010862660447631 : Rat) / 31674661647735875515923472992039636019484687209697488) [(6, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-21098765420225759898486073251488458150010862660447631 : Rat) / 63349323295471751031846945984079272038969374419394976) [(6, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 21. -/
theorem ep_Q1_009_partial_21_0715_valid :
    mulPoly ep_Q1_009_coefficient_21_0715
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0716 : Poly :=
[
  term ((-1404855237365801 : Rat) / 2790413914924826) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 716 for generator 21. -/
def ep_Q1_009_partial_21_0716 : Poly :=
[
  term ((-1404855237365801 : Rat) / 1395206957462413) [(6, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((1404855237365801 : Rat) / 2790413914924826) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 21. -/
theorem ep_Q1_009_partial_21_0716_valid :
    mulPoly ep_Q1_009_coefficient_21_0716
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0717 : Poly :=
[
  term ((43352362367362047242516079301130490640121414643930651502796335361361484146690197769094139458367889526787065615028669 : Rat) / 58841823156417035130590884393552854922176651682096585661044375181219857378929351052211055344729109350931498685440) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 717 for generator 21. -/
def ep_Q1_009_partial_21_0717 : Poly :=
[
  term ((43352362367362047242516079301130490640121414643930651502796335361361484146690197769094139458367889526787065615028669 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((-43352362367362047242516079301130490640121414643930651502796335361361484146690197769094139458367889526787065615028669 : Rat) / 58841823156417035130590884393552854922176651682096585661044375181219857378929351052211055344729109350931498685440) [(6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 21. -/
theorem ep_Q1_009_partial_21_0717_valid :
    mulPoly ep_Q1_009_coefficient_21_0717
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0718 : Poly :=
[
  term ((291182874916565810286601 : Rat) / 4063409114155276395678) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 718 for generator 21. -/
def ep_Q1_009_partial_21_0718 : Poly :=
[
  term ((291182874916565810286601 : Rat) / 2031704557077638197839) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-291182874916565810286601 : Rat) / 4063409114155276395678) [(6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 21. -/
theorem ep_Q1_009_partial_21_0718_valid :
    mulPoly ep_Q1_009_coefficient_21_0718
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0719 : Poly :=
[
  term ((-3907064623933031393205972055915447859574646471616910849817747802750797287683741502939483673672715 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(6, 1), (11, 1), (15, 3)]
]

/-- Partial product 719 for generator 21. -/
def ep_Q1_009_partial_21_0719 : Poly :=
[
  term ((-3907064623933031393205972055915447859574646471616910849817747802750797287683741502939483673672715 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(6, 1), (10, 1), (11, 1), (15, 3)],
  term ((3907064623933031393205972055915447859574646471616910849817747802750797287683741502939483673672715 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 21. -/
theorem ep_Q1_009_partial_21_0719_valid :
    mulPoly ep_Q1_009_coefficient_21_0719
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0720 : Poly :=
[
  term ((15592735215655 : Rat) / 1395206957462413) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 720 for generator 21. -/
def ep_Q1_009_partial_21_0720 : Poly :=
[
  term ((31185470431310 : Rat) / 1395206957462413) [(6, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-15592735215655 : Rat) / 1395206957462413) [(6, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 21. -/
theorem ep_Q1_009_partial_21_0720_valid :
    mulPoly ep_Q1_009_coefficient_21_0720
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0721 : Poly :=
[
  term ((-1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 4860762349458755572144611838650263473715010146379102553394835320805106046684379231276244966373376) [(6, 1), (11, 2)]
]

/-- Partial product 721 for generator 21. -/
def ep_Q1_009_partial_21_0721 : Poly :=
[
  term ((-1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 2430381174729377786072305919325131736857505073189551276697417660402553023342189615638122483186688) [(6, 1), (10, 1), (11, 2)],
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 4860762349458755572144611838650263473715010146379102553394835320805106046684379231276244966373376) [(6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 21. -/
theorem ep_Q1_009_partial_21_0721_valid :
    mulPoly ep_Q1_009_coefficient_21_0721
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0722 : Poly :=
[
  term ((439136420546557680429718809751320 : Rat) / 24049240021528595265061175145067379) [(6, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 722 for generator 21. -/
def ep_Q1_009_partial_21_0722 : Poly :=
[
  term ((878272841093115360859437619502640 : Rat) / 24049240021528595265061175145067379) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-439136420546557680429718809751320 : Rat) / 24049240021528595265061175145067379) [(6, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 21. -/
theorem ep_Q1_009_partial_21_0722_valid :
    mulPoly ep_Q1_009_coefficient_21_0722
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0723 : Poly :=
[
  term ((-60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(6, 1), (11, 2), (15, 2)]
]

/-- Partial product 723 for generator 21. -/
def ep_Q1_009_partial_21_0723 : Poly :=
[
  term ((-60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(6, 1), (10, 1), (11, 2), (15, 2)],
  term ((60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 21. -/
theorem ep_Q1_009_partial_21_0723_valid :
    mulPoly ep_Q1_009_coefficient_21_0723
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0724 : Poly :=
[
  term ((287857417009617 : Rat) / 2790413914924826) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 724 for generator 21. -/
def ep_Q1_009_partial_21_0724 : Poly :=
[
  term ((287857417009617 : Rat) / 1395206957462413) [(6, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-287857417009617 : Rat) / 2790413914924826) [(6, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 21. -/
theorem ep_Q1_009_partial_21_0724_valid :
    mulPoly ep_Q1_009_coefficient_21_0724
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0725 : Poly :=
[
  term ((-11273221283 : Rat) / 396087216) [(6, 1), (11, 2), (16, 1)]
]

/-- Partial product 725 for generator 21. -/
def ep_Q1_009_partial_21_0725 : Poly :=
[
  term ((-11273221283 : Rat) / 198043608) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((11273221283 : Rat) / 396087216) [(6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 21. -/
theorem ep_Q1_009_partial_21_0725_valid :
    mulPoly ep_Q1_009_coefficient_21_0725
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0726 : Poly :=
[
  term ((59053246339204947161086852163103452109422005332410801698004296427981063639 : Rat) / 160302909030386923109691903928169988742851322982753223000698749258966494360) [(6, 1), (12, 1)]
]

/-- Partial product 726 for generator 21. -/
def ep_Q1_009_partial_21_0726 : Poly :=
[
  term ((59053246339204947161086852163103452109422005332410801698004296427981063639 : Rat) / 80151454515193461554845951964084994371425661491376611500349374629483247180) [(6, 1), (10, 1), (12, 1)],
  term ((-59053246339204947161086852163103452109422005332410801698004296427981063639 : Rat) / 160302909030386923109691903928169988742851322982753223000698749258966494360) [(6, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 21. -/
theorem ep_Q1_009_partial_21_0726_valid :
    mulPoly ep_Q1_009_coefficient_21_0726
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0727 : Poly :=
[
  term ((-7094976535770337957559644545965347333663583089152334266318434664490673 : Rat) / 59870367518351792011089413231809519605173229872176740616507469377765264) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 727 for generator 21. -/
def ep_Q1_009_partial_21_0727 : Poly :=
[
  term ((-7094976535770337957559644545965347333663583089152334266318434664490673 : Rat) / 29935183759175896005544706615904759802586614936088370308253734688882632) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((7094976535770337957559644545965347333663583089152334266318434664490673 : Rat) / 59870367518351792011089413231809519605173229872176740616507469377765264) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 21. -/
theorem ep_Q1_009_partial_21_0727_valid :
    mulPoly ep_Q1_009_coefficient_21_0727
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0728 : Poly :=
[
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(6, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 728 for generator 21. -/
def ep_Q1_009_partial_21_0728 : Poly :=
[
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 142535977414811439821655628464178362087681092443638696) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(6, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 21. -/
theorem ep_Q1_009_partial_21_0728_valid :
    mulPoly ep_Q1_009_coefficient_21_0728
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0729 : Poly :=
[
  term ((-662786495307469 : Rat) / 1395206957462413) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 729 for generator 21. -/
def ep_Q1_009_partial_21_0729 : Poly :=
[
  term ((-1325572990614938 : Rat) / 1395206957462413) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((662786495307469 : Rat) / 1395206957462413) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 21. -/
theorem ep_Q1_009_partial_21_0729_valid :
    mulPoly ep_Q1_009_coefficient_21_0729
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0730 : Poly :=
[
  term ((-471541342957168459311257308690167541485069014232490930547528268589114586197146276731539042960792496609471765609537 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 730 for generator 21. -/
def ep_Q1_009_partial_21_0730 : Poly :=
[
  term ((-471541342957168459311257308690167541485069014232490930547528268589114586197146276731539042960792496609471765609537 : Rat) / 1838806973638032347830965137298526716318020365065518301907636724413120543091542220381595479522784667216609333920) [(6, 1), (10, 1), (12, 1), (15, 2)],
  term ((471541342957168459311257308690167541485069014232490930547528268589114586197146276731539042960792496609471765609537 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(6, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 21. -/
theorem ep_Q1_009_partial_21_0730_valid :
    mulPoly ep_Q1_009_coefficient_21_0730
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0731 : Poly :=
[
  term ((-49700332218010950393091 : Rat) / 4063409114155276395678) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 731 for generator 21. -/
def ep_Q1_009_partial_21_0731 : Poly :=
[
  term ((-49700332218010950393091 : Rat) / 2031704557077638197839) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((49700332218010950393091 : Rat) / 4063409114155276395678) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 21. -/
theorem ep_Q1_009_partial_21_0731_valid :
    mulPoly ep_Q1_009_coefficient_21_0731
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0732 : Poly :=
[
  term ((-1629181075074357390359347058317676610324861305981564716889854796084078461980957543912260987489056813 : Rat) / 363289303893368242780577183856042584812543089536616819349793897420416991999982767668693913782532280) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 732 for generator 21. -/
def ep_Q1_009_partial_21_0732 : Poly :=
[
  term ((-1629181075074357390359347058317676610324861305981564716889854796084078461980957543912260987489056813 : Rat) / 181644651946684121390288591928021292406271544768308409674896948710208495999991383834346956891266140) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((1629181075074357390359347058317676610324861305981564716889854796084078461980957543912260987489056813 : Rat) / 363289303893368242780577183856042584812543089536616819349793897420416991999982767668693913782532280) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 21. -/
theorem ep_Q1_009_partial_21_0732_valid :
    mulPoly ep_Q1_009_coefficient_21_0732
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0733 : Poly :=
[
  term ((5735012812185059 : Rat) / 2790413914924826) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 733 for generator 21. -/
def ep_Q1_009_partial_21_0733 : Poly :=
[
  term ((5735012812185059 : Rat) / 1395206957462413) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-5735012812185059 : Rat) / 2790413914924826) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 21. -/
theorem ep_Q1_009_partial_21_0733_valid :
    mulPoly ep_Q1_009_coefficient_21_0733
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0734 : Poly :=
[
  term ((-56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(6, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 734 for generator 21. -/
def ep_Q1_009_partial_21_0734 : Poly :=
[
  term ((-56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 63575628181339442486601007174807452342195040668907943386213932048572973599996984342021434911943149) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(6, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 21. -/
theorem ep_Q1_009_partial_21_0734_valid :
    mulPoly ep_Q1_009_coefficient_21_0734
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0735 : Poly :=
[
  term ((748503516560904 : Rat) / 1395206957462413) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 735 for generator 21. -/
def ep_Q1_009_partial_21_0735 : Poly :=
[
  term ((1497007033121808 : Rat) / 1395206957462413) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-748503516560904 : Rat) / 1395206957462413) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 21. -/
theorem ep_Q1_009_partial_21_0735_valid :
    mulPoly ep_Q1_009_coefficient_21_0735
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0736 : Poly :=
[
  term ((6888372280238651170300448919018387381424890571517275990817667209980606288170332456703002663506308065901618601142567 : Rat) / 9806970526069505855098480732258809153696108613682764276840729196869976229821558508701842557454851558488583114240) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 736 for generator 21. -/
def ep_Q1_009_partial_21_0736 : Poly :=
[
  term ((6888372280238651170300448919018387381424890571517275990817667209980606288170332456703002663506308065901618601142567 : Rat) / 4903485263034752927549240366129404576848054306841382138420364598434988114910779254350921278727425779244291557120) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((-6888372280238651170300448919018387381424890571517275990817667209980606288170332456703002663506308065901618601142567 : Rat) / 9806970526069505855098480732258809153696108613682764276840729196869976229821558508701842557454851558488583114240) [(6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 21. -/
theorem ep_Q1_009_partial_21_0736_valid :
    mulPoly ep_Q1_009_coefficient_21_0736
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0737 : Poly :=
[
  term ((271584703858441547571091 : Rat) / 4063409114155276395678) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 737 for generator 21. -/
def ep_Q1_009_partial_21_0737 : Poly :=
[
  term ((271584703858441547571091 : Rat) / 2031704557077638197839) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-271584703858441547571091 : Rat) / 4063409114155276395678) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 21. -/
theorem ep_Q1_009_partial_21_0737_valid :
    mulPoly ep_Q1_009_coefficient_21_0737
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0738 : Poly :=
[
  term ((136073320149709178450980285629152142057643307402665892699317202289970372844197118654145324061436087 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(6, 1), (13, 1), (15, 3)]
]

/-- Partial product 738 for generator 21. -/
def ep_Q1_009_partial_21_0738 : Poly :=
[
  term ((136073320149709178450980285629152142057643307402665892699317202289970372844197118654145324061436087 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(6, 1), (10, 1), (13, 1), (15, 3)],
  term ((-136073320149709178450980285629152142057643307402665892699317202289970372844197118654145324061436087 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 21. -/
theorem ep_Q1_009_partial_21_0738_valid :
    mulPoly ep_Q1_009_coefficient_21_0738
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0739 : Poly :=
[
  term ((-753620715875547 : Rat) / 1395206957462413) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 739 for generator 21. -/
def ep_Q1_009_partial_21_0739 : Poly :=
[
  term ((-1507241431751094 : Rat) / 1395206957462413) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((753620715875547 : Rat) / 1395206957462413) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 21. -/
theorem ep_Q1_009_partial_21_0739_valid :
    mulPoly ep_Q1_009_coefficient_21_0739
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0740 : Poly :=
[
  term ((3449173326224289277432497646660378786074034383946043349199055355607542546172348513977969643710919 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(6, 1), (13, 2)]
]

/-- Partial product 740 for generator 21. -/
def ep_Q1_009_partial_21_0740 : Poly :=
[
  term ((3449173326224289277432497646660378786074034383946043349199055355607542546172348513977969643710919 : Rat) / 15822794106311053294741574995606326411832715320244474457665479559912454579050713643477359916580) [(6, 1), (10, 1), (13, 2)],
  term ((-3449173326224289277432497646660378786074034383946043349199055355607542546172348513977969643710919 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 21. -/
theorem ep_Q1_009_partial_21_0740_valid :
    mulPoly ep_Q1_009_coefficient_21_0740
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0741 : Poly :=
[
  term ((1259466356764840865381798537937600 : Rat) / 24049240021528595265061175145067379) [(6, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 741 for generator 21. -/
def ep_Q1_009_partial_21_0741 : Poly :=
[
  term ((2518932713529681730763597075875200 : Rat) / 24049240021528595265061175145067379) [(6, 1), (10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-1259466356764840865381798537937600 : Rat) / 24049240021528595265061175145067379) [(6, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 21. -/
theorem ep_Q1_009_partial_21_0741_valid :
    mulPoly ep_Q1_009_coefficient_21_0741
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0742 : Poly :=
[
  term ((-1824922036170357437339455130044200 : Rat) / 24049240021528595265061175145067379) [(6, 1), (13, 2), (15, 2)]
]

/-- Partial product 742 for generator 21. -/
def ep_Q1_009_partial_21_0742 : Poly :=
[
  term ((-3649844072340714874678910260088400 : Rat) / 24049240021528595265061175145067379) [(6, 1), (10, 1), (13, 2), (15, 2)],
  term ((1824922036170357437339455130044200 : Rat) / 24049240021528595265061175145067379) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 21. -/
theorem ep_Q1_009_partial_21_0742_valid :
    mulPoly ep_Q1_009_coefficient_21_0742
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0743 : Poly :=
[
  term ((88887402 : Rat) / 8251817) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 743 for generator 21. -/
def ep_Q1_009_partial_21_0743 : Poly :=
[
  term ((177774804 : Rat) / 8251817) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-88887402 : Rat) / 8251817) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 21. -/
theorem ep_Q1_009_partial_21_0743_valid :
    mulPoly ep_Q1_009_coefficient_21_0743
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0744 : Poly :=
[
  term ((163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(6, 1), (13, 3), (15, 1)]
]

/-- Partial product 744 for generator 21. -/
def ep_Q1_009_partial_21_0744 : Poly :=
[
  term ((327908400577828390986977134137600 : Rat) / 24049240021528595265061175145067379) [(6, 1), (10, 1), (13, 3), (15, 1)],
  term ((-163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(6, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 21. -/
theorem ep_Q1_009_partial_21_0744_valid :
    mulPoly ep_Q1_009_coefficient_21_0744
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0745 : Poly :=
[
  term ((-151184951141162511435080991736866989129069096806224064166221581814574565224073711249162813319802239 : Rat) / 867993276689063495025823542616118477449108954710554027391934878715197508336496291299329458280960) [(6, 1), (14, 1)]
]

/-- Partial product 745 for generator 21. -/
def ep_Q1_009_partial_21_0745 : Poly :=
[
  term ((-151184951141162511435080991736866989129069096806224064166221581814574565224073711249162813319802239 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(6, 1), (10, 1), (14, 1)],
  term ((151184951141162511435080991736866989129069096806224064166221581814574565224073711249162813319802239 : Rat) / 867993276689063495025823542616118477449108954710554027391934878715197508336496291299329458280960) [(6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 21. -/
theorem ep_Q1_009_partial_21_0745_valid :
    mulPoly ep_Q1_009_coefficient_21_0745
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0746 : Poly :=
[
  term ((540402882509456502889416099592698037754352546888985231810033112712579480291296889138775455096231751874413512049409 : Rat) / 817247543839125487924873394354900762808009051140230356403394099739164685818463209058486879787904296540715259520) [(6, 1), (14, 1), (15, 2)]
]

/-- Partial product 746 for generator 21. -/
def ep_Q1_009_partial_21_0746 : Poly :=
[
  term ((540402882509456502889416099592698037754352546888985231810033112712579480291296889138775455096231751874413512049409 : Rat) / 408623771919562743962436697177450381404004525570115178201697049869582342909231604529243439893952148270357629760) [(6, 1), (10, 1), (14, 1), (15, 2)],
  term ((-540402882509456502889416099592698037754352546888985231810033112712579480291296889138775455096231751874413512049409 : Rat) / 817247543839125487924873394354900762808009051140230356403394099739164685818463209058486879787904296540715259520) [(6, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 21. -/
theorem ep_Q1_009_partial_21_0746_valid :
    mulPoly ep_Q1_009_coefficient_21_0746
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0747 : Poly :=
[
  term ((492462591544720069280579 : Rat) / 8126818228310552791356) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 747 for generator 21. -/
def ep_Q1_009_partial_21_0747 : Poly :=
[
  term ((492462591544720069280579 : Rat) / 4063409114155276395678) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-492462591544720069280579 : Rat) / 8126818228310552791356) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 21. -/
theorem ep_Q1_009_partial_21_0747_valid :
    mulPoly ep_Q1_009_coefficient_21_0747
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0748 : Poly :=
[
  term ((-236458753 : Rat) / 14145972) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 748 for generator 21. -/
def ep_Q1_009_partial_21_0748 : Poly :=
[
  term ((-236458753 : Rat) / 7072986) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((236458753 : Rat) / 14145972) [(6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 21. -/
theorem ep_Q1_009_partial_21_0748_valid :
    mulPoly ep_Q1_009_coefficient_21_0748
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0749 : Poly :=
[
  term ((-311299082557579037653676420766075658908360580866990064112500931935684282504824462711457709302311073 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(6, 1), (14, 2), (15, 2)]
]

/-- Partial product 749 for generator 21. -/
def ep_Q1_009_partial_21_0749 : Poly :=
[
  term ((-311299082557579037653676420766075658908360580866990064112500931935684282504824462711457709302311073 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(6, 1), (10, 1), (14, 2), (15, 2)],
  term ((311299082557579037653676420766075658908360580866990064112500931935684282504824462711457709302311073 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(6, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 21. -/
theorem ep_Q1_009_partial_21_0749_valid :
    mulPoly ep_Q1_009_coefficient_21_0749
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0750 : Poly :=
[
  term ((1539535942190298 : Rat) / 1395206957462413) [(6, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 750 for generator 21. -/
def ep_Q1_009_partial_21_0750 : Poly :=
[
  term ((3079071884380596 : Rat) / 1395206957462413) [(6, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1539535942190298 : Rat) / 1395206957462413) [(6, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 21. -/
theorem ep_Q1_009_partial_21_0750_valid :
    mulPoly ep_Q1_009_coefficient_21_0750
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0751 : Poly :=
[
  term ((-94114590254983330141970316551631082558244043825663440713843978314506510250168883610889088369789866523878837909937 : Rat) / 133428170422714365375489533772228695968654538961670262269941893834965662990769503519752959965372130047463715840) [(6, 1), (15, 2)]
]

/-- Partial product 751 for generator 21. -/
def ep_Q1_009_partial_21_0751 : Poly :=
[
  term ((-94114590254983330141970316551631082558244043825663440713843978314506510250168883610889088369789866523878837909937 : Rat) / 66714085211357182687744766886114347984327269480835131134970946917482831495384751759876479982686065023731857920) [(6, 1), (10, 1), (15, 2)],
  term ((94114590254983330141970316551631082558244043825663440713843978314506510250168883610889088369789866523878837909937 : Rat) / 133428170422714365375489533772228695968654538961670262269941893834965662990769503519752959965372130047463715840) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 21. -/
theorem ep_Q1_009_partial_21_0751_valid :
    mulPoly ep_Q1_009_coefficient_21_0751
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0752 : Poly :=
[
  term ((-47058796313167527396059 : Rat) / 773982688410528837272) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 752 for generator 21. -/
def ep_Q1_009_partial_21_0752 : Poly :=
[
  term ((-47058796313167527396059 : Rat) / 386991344205264418636) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((47058796313167527396059 : Rat) / 773982688410528837272) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 21. -/
theorem ep_Q1_009_partial_21_0752_valid :
    mulPoly ep_Q1_009_coefficient_21_0752
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0753 : Poly :=
[
  term ((-806910417662736248398950823829891102253996563659415031067128209429176087976477619109630736310163763 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(6, 1), (15, 4)]
]

/-- Partial product 753 for generator 21. -/
def ep_Q1_009_partial_21_0753 : Poly :=
[
  term ((-806910417662736248398950823829891102253996563659415031067128209429176087976477619109630736310163763 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(6, 1), (10, 1), (15, 4)],
  term ((806910417662736248398950823829891102253996563659415031067128209429176087976477619109630736310163763 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 21. -/
theorem ep_Q1_009_partial_21_0753_valid :
    mulPoly ep_Q1_009_coefficient_21_0753
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0754 : Poly :=
[
  term ((1231996799995169 : Rat) / 1395206957462413) [(6, 1), (15, 4), (16, 1)]
]

/-- Partial product 754 for generator 21. -/
def ep_Q1_009_partial_21_0754 : Poly :=
[
  term ((2463993599990338 : Rat) / 1395206957462413) [(6, 1), (10, 1), (15, 4), (16, 1)],
  term ((-1231996799995169 : Rat) / 1395206957462413) [(6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 21. -/
theorem ep_Q1_009_partial_21_0754_valid :
    mulPoly ep_Q1_009_coefficient_21_0754
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0755 : Poly :=
[
  term ((1508874581 : Rat) / 37722592) [(6, 1), (16, 1)]
]

/-- Partial product 755 for generator 21. -/
def ep_Q1_009_partial_21_0755 : Poly :=
[
  term ((1508874581 : Rat) / 18861296) [(6, 1), (10, 1), (16, 1)],
  term ((-1508874581 : Rat) / 37722592) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 21. -/
theorem ep_Q1_009_partial_21_0755_valid :
    mulPoly ep_Q1_009_coefficient_21_0755
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0756 : Poly :=
[
  term ((347159014435945014093861199372180970211033505293116278873204403955204941466433978272586218130993 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(6, 2)]
]

/-- Partial product 756 for generator 21. -/
def ep_Q1_009_partial_21_0756 : Poly :=
[
  term ((-347159014435945014093861199372180970211033505293116278873204403955204941466433978272586218130993 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(6, 2)],
  term ((347159014435945014093861199372180970211033505293116278873204403955204941466433978272586218130993 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(6, 2), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 21. -/
theorem ep_Q1_009_partial_21_0756_valid :
    mulPoly ep_Q1_009_coefficient_21_0756
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0757 : Poly :=
[
  term ((252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(6, 2), (8, 1)]
]

/-- Partial product 757 for generator 21. -/
def ep_Q1_009_partial_21_0757 : Poly :=
[
  term ((-252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(6, 2), (8, 1)],
  term ((252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(6, 2), (8, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 21. -/
theorem ep_Q1_009_partial_21_0757_valid :
    mulPoly ep_Q1_009_coefficient_21_0757
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0758 : Poly :=
[
  term ((2266213775384253568090043131281361122906789524453692710753204884111530035577088084422030461391 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(6, 2), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 758 for generator 21. -/
def ep_Q1_009_partial_21_0758 : Poly :=
[
  term ((2266213775384253568090043131281361122906789524453692710753204884111530035577088084422030461391 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(6, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2266213775384253568090043131281361122906789524453692710753204884111530035577088084422030461391 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(6, 2), (8, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 21. -/
theorem ep_Q1_009_partial_21_0758_valid :
    mulPoly ep_Q1_009_coefficient_21_0758
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0759 : Poly :=
[
  term ((-3687486922590734366305543911824540 : Rat) / 30920451456251051055078653757943773) [(6, 2), (8, 1), (14, 1), (15, 2)]
]

/-- Partial product 759 for generator 21. -/
def ep_Q1_009_partial_21_0759 : Poly :=
[
  term ((-7374973845181468732611087823649080 : Rat) / 30920451456251051055078653757943773) [(6, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((3687486922590734366305543911824540 : Rat) / 30920451456251051055078653757943773) [(6, 2), (8, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 21. -/
theorem ep_Q1_009_partial_21_0759_valid :
    mulPoly ep_Q1_009_coefficient_21_0759
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0760 : Poly :=
[
  term ((1407096728790050002569804627083710626719414299447999272913051047070874591782216411402807649418233 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(6, 2), (8, 1), (15, 2)]
]

/-- Partial product 760 for generator 21. -/
def ep_Q1_009_partial_21_0760 : Poly :=
[
  term ((1407096728790050002569804627083710626719414299447999272913051047070874591782216411402807649418233 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(6, 2), (8, 1), (10, 1), (15, 2)],
  term ((-1407096728790050002569804627083710626719414299447999272913051047070874591782216411402807649418233 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(6, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 21. -/
theorem ep_Q1_009_partial_21_0760_valid :
    mulPoly ep_Q1_009_coefficient_21_0760
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0761 : Poly :=
[
  term ((-1751791739534636554877596326164059078726556800968477264101462241382374748550900980531743391 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(6, 2), (9, 1), (11, 1)]
]

/-- Partial product 761 for generator 21. -/
def ep_Q1_009_partial_21_0761 : Poly :=
[
  term ((-1751791739534636554877596326164059078726556800968477264101462241382374748550900980531743391 : Rat) / 1185866953408114534758566583109094881668827344318159344591277201847083609268908465464593760) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((1751791739534636554877596326164059078726556800968477264101462241382374748550900980531743391 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(6, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 21. -/
theorem ep_Q1_009_partial_21_0761_valid :
    mulPoly ep_Q1_009_coefficient_21_0761
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0762 : Poly :=
[
  term ((106534405440400441988839375621002688000 : Rat) / 2144116865330816633312319087537095051139) [(6, 2), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 762 for generator 21. -/
def ep_Q1_009_partial_21_0762 : Poly :=
[
  term ((213068810880800883977678751242005376000 : Rat) / 2144116865330816633312319087537095051139) [(6, 2), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-106534405440400441988839375621002688000 : Rat) / 2144116865330816633312319087537095051139) [(6, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 21. -/
theorem ep_Q1_009_partial_21_0762_valid :
    mulPoly ep_Q1_009_coefficient_21_0762
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0763 : Poly :=
[
  term ((-1714692261367085162679200362606484613992660014898241523732036857393723507176988550318344395946651196850773516973 : Rat) / 57992321444957138616085785895433597637334419180468122865255615994447213400538498395421012932582288378256467712) [(6, 2), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 763 for generator 21. -/
def ep_Q1_009_partial_21_0763 : Poly :=
[
  term ((-1714692261367085162679200362606484613992660014898241523732036857393723507176988550318344395946651196850773516973 : Rat) / 28996160722478569308042892947716798818667209590234061432627807997223606700269249197710506466291144189128233856) [(6, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1714692261367085162679200362606484613992660014898241523732036857393723507176988550318344395946651196850773516973 : Rat) / 57992321444957138616085785895433597637334419180468122865255615994447213400538498395421012932582288378256467712) [(6, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 21. -/
theorem ep_Q1_009_partial_21_0763_valid :
    mulPoly ep_Q1_009_coefficient_21_0763
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0764 : Poly :=
[
  term ((73350087848026117544728 : Rat) / 4676338877845046513121) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 764 for generator 21. -/
def ep_Q1_009_partial_21_0764 : Poly :=
[
  term ((146700175696052235089456 : Rat) / 4676338877845046513121) [(6, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-73350087848026117544728 : Rat) / 4676338877845046513121) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 21. -/
theorem ep_Q1_009_partial_21_0764_valid :
    mulPoly ep_Q1_009_coefficient_21_0764
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0765 : Poly :=
[
  term ((164904248852740657348995419437778135331812205588352404707767421041844085741137158913587586912693746568936572938217951 : Rat) / 9462027166959206736600556826698945790507483833485178926695106305654007338431861398196892470080126171796325271889920) [(6, 2), (9, 1), (15, 1)]
]

/-- Partial product 765 for generator 21. -/
def ep_Q1_009_partial_21_0765 : Poly :=
[
  term ((164904248852740657348995419437778135331812205588352404707767421041844085741137158913587586912693746568936572938217951 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-164904248852740657348995419437778135331812205588352404707767421041844085741137158913587586912693746568936572938217951 : Rat) / 9462027166959206736600556826698945790507483833485178926695106305654007338431861398196892470080126171796325271889920) [(6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 21. -/
theorem ep_Q1_009_partial_21_0765_valid :
    mulPoly ep_Q1_009_coefficient_21_0765
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0766 : Poly :=
[
  term ((-32196101519984232532871 : Rat) / 3117559251896697675414) [(6, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 766 for generator 21. -/
def ep_Q1_009_partial_21_0766 : Poly :=
[
  term ((-32196101519984232532871 : Rat) / 1558779625948348837707) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((32196101519984232532871 : Rat) / 3117559251896697675414) [(6, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 21. -/
theorem ep_Q1_009_partial_21_0766_valid :
    mulPoly ep_Q1_009_coefficient_21_0766
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0767 : Poly :=
[
  term ((9195777805739747494170657640276695414400 : Rat) / 15008818057315716433186233612759665357973) [(6, 2), (9, 1), (15, 3)]
]

/-- Partial product 767 for generator 21. -/
def ep_Q1_009_partial_21_0767 : Poly :=
[
  term ((18391555611479494988341315280553390828800 : Rat) / 15008818057315716433186233612759665357973) [(6, 2), (9, 1), (10, 1), (15, 3)],
  term ((-9195777805739747494170657640276695414400 : Rat) / 15008818057315716433186233612759665357973) [(6, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 21. -/
theorem ep_Q1_009_partial_21_0767_valid :
    mulPoly ep_Q1_009_coefficient_21_0767
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0768 : Poly :=
[
  term ((42080664036997058477289371015428034492950314966330391721725054450871304762701926353227022764538385 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(6, 2), (11, 1), (15, 1)]
]

/-- Partial product 768 for generator 21. -/
def ep_Q1_009_partial_21_0768 : Poly :=
[
  term ((42080664036997058477289371015428034492950314966330391721725054450871304762701926353227022764538385 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((-42080664036997058477289371015428034492950314966330391721725054450871304762701926353227022764538385 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(6, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 21. -/
theorem ep_Q1_009_partial_21_0768_valid :
    mulPoly ep_Q1_009_coefficient_21_0768
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0769 : Poly :=
[
  term ((17794930 : Rat) / 3536493) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 769 for generator 21. -/
def ep_Q1_009_partial_21_0769 : Poly :=
[
  term ((35589860 : Rat) / 3536493) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17794930 : Rat) / 3536493) [(6, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 21. -/
theorem ep_Q1_009_partial_21_0769_valid :
    mulPoly ep_Q1_009_coefficient_21_0769
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0770 : Poly :=
[
  term ((-24530758996544628450945932313404007581149427591995039909319088002817133 : Rat) / 4190925726284625440776258926226666372362126091052371843155522856443568480) [(6, 2), (13, 1), (15, 1)]
]

/-- Partial product 770 for generator 21. -/
def ep_Q1_009_partial_21_0770 : Poly :=
[
  term ((-24530758996544628450945932313404007581149427591995039909319088002817133 : Rat) / 2095462863142312720388129463113333186181063045526185921577761428221784240) [(6, 2), (10, 1), (13, 1), (15, 1)],
  term ((24530758996544628450945932313404007581149427591995039909319088002817133 : Rat) / 4190925726284625440776258926226666372362126091052371843155522856443568480) [(6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 21. -/
theorem ep_Q1_009_partial_21_0770_valid :
    mulPoly ep_Q1_009_coefficient_21_0770
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0771 : Poly :=
[
  term ((-240288305598895558716027964628613680940699067407081 : Rat) / 232901923880410849381790242588526735437387405953658) [(6, 2), (14, 1), (15, 2)]
]

/-- Partial product 771 for generator 21. -/
def ep_Q1_009_partial_21_0771 : Poly :=
[
  term ((-240288305598895558716027964628613680940699067407081 : Rat) / 116450961940205424690895121294263367718693702976829) [(6, 2), (10, 1), (14, 1), (15, 2)],
  term ((240288305598895558716027964628613680940699067407081 : Rat) / 232901923880410849381790242588526735437387405953658) [(6, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 21. -/
theorem ep_Q1_009_partial_21_0771_valid :
    mulPoly ep_Q1_009_coefficient_21_0771
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0772 : Poly :=
[
  term ((1975738223120636 : Rat) / 1395206957462413) [(6, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 772 for generator 21. -/
def ep_Q1_009_partial_21_0772 : Poly :=
[
  term ((3951476446241272 : Rat) / 1395206957462413) [(6, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1975738223120636 : Rat) / 1395206957462413) [(6, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 21. -/
theorem ep_Q1_009_partial_21_0772_valid :
    mulPoly ep_Q1_009_coefficient_21_0772
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0773 : Poly :=
[
  term ((11784029259121631862012103830084795699490688709330471399666668759683562852882388443731846150705749518908937152297451 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(6, 2), (15, 2)]
]

/-- Partial product 773 for generator 21. -/
def ep_Q1_009_partial_21_0773 : Poly :=
[
  term ((11784029259121631862012103830084795699490688709330471399666668759683562852882388443731846150705749518908937152297451 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(6, 2), (10, 1), (15, 2)],
  term ((-11784029259121631862012103830084795699490688709330471399666668759683562852882388443731846150705749518908937152297451 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 21. -/
theorem ep_Q1_009_partial_21_0773_valid :
    mulPoly ep_Q1_009_coefficient_21_0773
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0774 : Poly :=
[
  term ((51260444527296103600937 : Rat) / 677234852359212732613) [(6, 2), (15, 2), (16, 1)]
]

/-- Partial product 774 for generator 21. -/
def ep_Q1_009_partial_21_0774 : Poly :=
[
  term ((102520889054592207201874 : Rat) / 677234852359212732613) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((-51260444527296103600937 : Rat) / 677234852359212732613) [(6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 21. -/
theorem ep_Q1_009_partial_21_0774_valid :
    mulPoly ep_Q1_009_coefficient_21_0774
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0775 : Poly :=
[
  term ((746239 : Rat) / 49510902) [(6, 2), (16, 1)]
]

/-- Partial product 775 for generator 21. -/
def ep_Q1_009_partial_21_0775 : Poly :=
[
  term ((746239 : Rat) / 24755451) [(6, 2), (10, 1), (16, 1)],
  term ((-746239 : Rat) / 49510902) [(6, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 21. -/
theorem ep_Q1_009_partial_21_0775_valid :
    mulPoly ep_Q1_009_coefficient_21_0775
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0776 : Poly :=
[
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(7, 1), (8, 1), (10, 1), (11, 1)]
]

/-- Partial product 776 for generator 21. -/
def ep_Q1_009_partial_21_0776 : Poly :=
[
  term ((-1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 83253659487638736746499323372870546752640789949379089937927310471054641323062589909330335920128) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 41626829743819368373249661686435273376320394974689544968963655235527320661531294954665167960064) [(7, 1), (8, 1), (10, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 21. -/
theorem ep_Q1_009_partial_21_0776_valid :
    mulPoly ep_Q1_009_coefficient_21_0776
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0777 : Poly :=
[
  term ((-302014619258136788910019611903712606934540194440218677127780843795501303426153465950817350989 : Rat) / 495557496950230575872019781981372302099052321127256487725757800422944293589658273269823428096) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 777 for generator 21. -/
def ep_Q1_009_partial_21_0777 : Poly :=
[
  term ((302014619258136788910019611903712606934540194440218677127780843795501303426153465950817350989 : Rat) / 495557496950230575872019781981372302099052321127256487725757800422944293589658273269823428096) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-302014619258136788910019611903712606934540194440218677127780843795501303426153465950817350989 : Rat) / 247778748475115287936009890990686151049526160563628243862878900211472146794829136634911714048) [(7, 1), (8, 1), (10, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 21. -/
theorem ep_Q1_009_partial_21_0777_valid :
    mulPoly ep_Q1_009_coefficient_21_0777
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0778 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 1486672490850691727616059345944116906297156963381769463177273401268832880768974819809470284288) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 778 for generator 21. -/
def ep_Q1_009_partial_21_0778 : Poly :=
[
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 1486672490850691727616059345944116906297156963381769463177273401268832880768974819809470284288) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 21. -/
theorem ep_Q1_009_partial_21_0778_valid :
    mulPoly ep_Q1_009_coefficient_21_0778
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0779 : Poly :=
[
  term ((1559048094388291692611456666551709998690813699296700818696912989768626823852577057620061876801 : Rat) / 495557496950230575872019781981372302099052321127256487725757800422944293589658273269823428096) [(7, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 779 for generator 21. -/
def ep_Q1_009_partial_21_0779 : Poly :=
[
  term ((-1559048094388291692611456666551709998690813699296700818696912989768626823852577057620061876801 : Rat) / 495557496950230575872019781981372302099052321127256487725757800422944293589658273269823428096) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((1559048094388291692611456666551709998690813699296700818696912989768626823852577057620061876801 : Rat) / 247778748475115287936009890990686151049526160563628243862878900211472146794829136634911714048) [(7, 1), (8, 1), (10, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 21. -/
theorem ep_Q1_009_partial_21_0779_valid :
    mulPoly ep_Q1_009_coefficient_21_0779
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0780 : Poly :=
[
  term ((88462782965631509855892718431241328600051480257045241572834875762416640 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 780 for generator 21. -/
def ep_Q1_009_partial_21_0780 : Poly :=
[
  term ((-88462782965631509855892718431241328600051480257045241572834875762416640 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((176925565931263019711785436862482657200102960514090483145669751524833280 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 1), (8, 1), (10, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 21. -/
theorem ep_Q1_009_partial_21_0780_valid :
    mulPoly ep_Q1_009_coefficient_21_0780
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0781 : Poly :=
[
  term ((-378801552938638204031466459533248094763697091238917621704899573514042463598354892656604538261 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 781 for generator 21. -/
def ep_Q1_009_partial_21_0781 : Poly :=
[
  term ((378801552938638204031466459533248094763697091238917621704899573514042463598354892656604538261 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-378801552938638204031466459533248094763697091238917621704899573514042463598354892656604538261 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 1), (8, 1), (10, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 21. -/
theorem ep_Q1_009_partial_21_0781_valid :
    mulPoly ep_Q1_009_coefficient_21_0781
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0782 : Poly :=
[
  term ((375127322420067519276073331624061371999182660240207193071267519837491322825870508394955280789 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 782 for generator 21. -/
def ep_Q1_009_partial_21_0782 : Poly :=
[
  term ((-375127322420067519276073331624061371999182660240207193071267519837491322825870508394955280789 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((375127322420067519276073331624061371999182660240207193071267519837491322825870508394955280789 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(7, 1), (8, 1), (10, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 21. -/
theorem ep_Q1_009_partial_21_0782_valid :
    mulPoly ep_Q1_009_coefficient_21_0782
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0783 : Poly :=
[
  term ((131222562431930764182165089225070103345091580874442552176121548500916525940157888445978026057641 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 783 for generator 21. -/
def ep_Q1_009_partial_21_0783 : Poly :=
[
  term ((-131222562431930764182165089225070103345091580874442552176121548500916525940157888445978026057641 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((131222562431930764182165089225070103345091580874442552176121548500916525940157888445978026057641 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (10, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 21. -/
theorem ep_Q1_009_partial_21_0783_valid :
    mulPoly ep_Q1_009_coefficient_21_0783
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0784 : Poly :=
[
  term ((-1450009580106890032585259128923556 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1)]
]

/-- Partial product 784 for generator 21. -/
def ep_Q1_009_partial_21_0784 : Poly :=
[
  term ((1450009580106890032585259128923556 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-2900019160213780065170518257847112 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (10, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 21. -/
theorem ep_Q1_009_partial_21_0784_valid :
    mulPoly ep_Q1_009_coefficient_21_0784
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0785 : Poly :=
[
  term ((-76981805925608078535629388859475112179599036758016513504309624555748966089119693391037958241373 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 785 for generator 21. -/
def ep_Q1_009_partial_21_0785 : Poly :=
[
  term ((76981805925608078535629388859475112179599036758016513504309624555748966089119693391037958241373 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-76981805925608078535629388859475112179599036758016513504309624555748966089119693391037958241373 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(7, 1), (8, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 21. -/
theorem ep_Q1_009_partial_21_0785_valid :
    mulPoly ep_Q1_009_coefficient_21_0785
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0786 : Poly :=
[
  term ((-167654732615531123087380597891817524937925186331517535888454610366352294131871257813647677575 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(7, 1), (8, 1), (10, 1), (15, 3)]
]

/-- Partial product 786 for generator 21. -/
def ep_Q1_009_partial_21_0786 : Poly :=
[
  term ((167654732615531123087380597891817524937925186331517535888454610366352294131871257813647677575 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(7, 1), (8, 1), (10, 1), (15, 3)],
  term ((-167654732615531123087380597891817524937925186331517535888454610366352294131871257813647677575 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(7, 1), (8, 1), (10, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 21. -/
theorem ep_Q1_009_partial_21_0786_valid :
    mulPoly ep_Q1_009_coefficient_21_0786
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0787 : Poly :=
[
  term ((4179332622138575796953023139187400336038085440156059559548423484552206776213842624169411697645579 : Rat) / 499521956925832420478995940237223280515844739696274539627563862826327847938375539455982015520768) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 787 for generator 21. -/
def ep_Q1_009_partial_21_0787 : Poly :=
[
  term ((4179332622138575796953023139187400336038085440156059559548423484552206776213842624169411697645579 : Rat) / 249760978462916210239497970118611640257922369848137269813781931413163923969187769727991007760384) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-4179332622138575796953023139187400336038085440156059559548423484552206776213842624169411697645579 : Rat) / 499521956925832420478995940237223280515844739696274539627563862826327847938375539455982015520768) [(7, 1), (8, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 21. -/
theorem ep_Q1_009_partial_21_0787_valid :
    mulPoly ep_Q1_009_coefficient_21_0787
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0788 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 788 for generator 21. -/
def ep_Q1_009_partial_21_0788 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 21. -/
theorem ep_Q1_009_partial_21_0788_valid :
    mulPoly ep_Q1_009_coefficient_21_0788
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0789 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 789 for generator 21. -/
def ep_Q1_009_partial_21_0789 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 21. -/
theorem ep_Q1_009_partial_21_0789_valid :
    mulPoly ep_Q1_009_coefficient_21_0789
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0790 : Poly :=
[
  term ((-536629633030100147172273223281356128979100693994734601640620693264344638127770080775978062528417 : Rat) / 17840069890208300731392712151329402875565883560581233558127280815225994569227697837713643411456) [(7, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 790 for generator 21. -/
def ep_Q1_009_partial_21_0790 : Poly :=
[
  term ((-536629633030100147172273223281356128979100693994734601640620693264344638127770080775978062528417 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((536629633030100147172273223281356128979100693994734601640620693264344638127770080775978062528417 : Rat) / 17840069890208300731392712151329402875565883560581233558127280815225994569227697837713643411456) [(7, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 21. -/
theorem ep_Q1_009_partial_21_0790_valid :
    mulPoly ep_Q1_009_coefficient_21_0790
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0791 : Poly :=
[
  term ((475368877954965555370994468128609066354603531482982131542165551311713772458286828189333182869 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 791 for generator 21. -/
def ep_Q1_009_partial_21_0791 : Poly :=
[
  term ((475368877954965555370994468128609066354603531482982131542165551311713772458286828189333182869 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-475368877954965555370994468128609066354603531482982131542165551311713772458286828189333182869 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 21. -/
theorem ep_Q1_009_partial_21_0791_valid :
    mulPoly ep_Q1_009_coefficient_21_0791
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0792 : Poly :=
[
  term ((-302014619258136788910019611903712606934540194440218677127780843795501303426153465950817350989 : Rat) / 991114993900461151744039563962744604198104642254512975451515600845888587179316546539646856192) [(7, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 792 for generator 21. -/
def ep_Q1_009_partial_21_0792 : Poly :=
[
  term ((-302014619258136788910019611903712606934540194440218677127780843795501303426153465950817350989 : Rat) / 495557496950230575872019781981372302099052321127256487725757800422944293589658273269823428096) [(7, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((302014619258136788910019611903712606934540194440218677127780843795501303426153465950817350989 : Rat) / 991114993900461151744039563962744604198104642254512975451515600845888587179316546539646856192) [(7, 1), (8, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 21. -/
theorem ep_Q1_009_partial_21_0792_valid :
    mulPoly ep_Q1_009_coefficient_21_0792
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0793 : Poly :=
[
  term ((2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 793 for generator 21. -/
def ep_Q1_009_partial_21_0793 : Poly :=
[
  term ((2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 21. -/
theorem ep_Q1_009_partial_21_0793_valid :
    mulPoly ep_Q1_009_coefficient_21_0793
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0794 : Poly :=
[
  term ((-103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 794 for generator 21. -/
def ep_Q1_009_partial_21_0794 : Poly :=
[
  term ((-103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 21. -/
theorem ep_Q1_009_partial_21_0794_valid :
    mulPoly ep_Q1_009_coefficient_21_0794
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0795 : Poly :=
[
  term ((26800311876207674025560207203815293503581469773865165837131342179352735808551477607515713783935 : Rat) / 2601676858988710523328103855402204586020024685918096560560228452220457541345705934666572997504) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 795 for generator 21. -/
def ep_Q1_009_partial_21_0795 : Poly :=
[
  term ((26800311876207674025560207203815293503581469773865165837131342179352735808551477607515713783935 : Rat) / 1300838429494355261664051927701102293010012342959048280280114226110228770672852967333286498752) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-26800311876207674025560207203815293503581469773865165837131342179352735808551477607515713783935 : Rat) / 2601676858988710523328103855402204586020024685918096560560228452220457541345705934666572997504) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 21. -/
theorem ep_Q1_009_partial_21_0795_valid :
    mulPoly ep_Q1_009_coefficient_21_0795
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0796 : Poly :=
[
  term ((-1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 796 for generator 21. -/
def ep_Q1_009_partial_21_0796 : Poly :=
[
  term ((-2977559401718826073940389265521712 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 21. -/
theorem ep_Q1_009_partial_21_0796_valid :
    mulPoly ep_Q1_009_coefficient_21_0796
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0797 : Poly :=
[
  term ((-267367530629478200637847104060513931280993036627658953538456668434690544122615981703270780127169 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 797 for generator 21. -/
def ep_Q1_009_partial_21_0797 : Poly :=
[
  term ((-267367530629478200637847104060513931280993036627658953538456668434690544122615981703270780127169 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((267367530629478200637847104060513931280993036627658953538456668434690544122615981703270780127169 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 21. -/
theorem ep_Q1_009_partial_21_0797_valid :
    mulPoly ep_Q1_009_coefficient_21_0797
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0798 : Poly :=
[
  term ((-13930389996111125604256887915360 : Rat) / 3435605717361227895008739306438197) [(7, 1), (8, 1), (12, 1), (15, 3)]
]

/-- Partial product 798 for generator 21. -/
def ep_Q1_009_partial_21_0798 : Poly :=
[
  term ((-27860779992222251208513775830720 : Rat) / 3435605717361227895008739306438197) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 3)],
  term ((13930389996111125604256887915360 : Rat) / 3435605717361227895008739306438197) [(7, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 21. -/
theorem ep_Q1_009_partial_21_0798_valid :
    mulPoly ep_Q1_009_coefficient_21_0798
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 21. -/
def ep_Q1_009_coefficient_21_0799 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 799 for generator 21. -/
def ep_Q1_009_partial_21_0799 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 21. -/
theorem ep_Q1_009_partial_21_0799_valid :
    mulPoly ep_Q1_009_coefficient_21_0799
        ep_Q1_009_generator_21_0700_0799 =
      ep_Q1_009_partial_21_0799 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_21_0700_0799 : List Poly :=
[
  ep_Q1_009_partial_21_0700,
  ep_Q1_009_partial_21_0701,
  ep_Q1_009_partial_21_0702,
  ep_Q1_009_partial_21_0703,
  ep_Q1_009_partial_21_0704,
  ep_Q1_009_partial_21_0705,
  ep_Q1_009_partial_21_0706,
  ep_Q1_009_partial_21_0707,
  ep_Q1_009_partial_21_0708,
  ep_Q1_009_partial_21_0709,
  ep_Q1_009_partial_21_0710,
  ep_Q1_009_partial_21_0711,
  ep_Q1_009_partial_21_0712,
  ep_Q1_009_partial_21_0713,
  ep_Q1_009_partial_21_0714,
  ep_Q1_009_partial_21_0715,
  ep_Q1_009_partial_21_0716,
  ep_Q1_009_partial_21_0717,
  ep_Q1_009_partial_21_0718,
  ep_Q1_009_partial_21_0719,
  ep_Q1_009_partial_21_0720,
  ep_Q1_009_partial_21_0721,
  ep_Q1_009_partial_21_0722,
  ep_Q1_009_partial_21_0723,
  ep_Q1_009_partial_21_0724,
  ep_Q1_009_partial_21_0725,
  ep_Q1_009_partial_21_0726,
  ep_Q1_009_partial_21_0727,
  ep_Q1_009_partial_21_0728,
  ep_Q1_009_partial_21_0729,
  ep_Q1_009_partial_21_0730,
  ep_Q1_009_partial_21_0731,
  ep_Q1_009_partial_21_0732,
  ep_Q1_009_partial_21_0733,
  ep_Q1_009_partial_21_0734,
  ep_Q1_009_partial_21_0735,
  ep_Q1_009_partial_21_0736,
  ep_Q1_009_partial_21_0737,
  ep_Q1_009_partial_21_0738,
  ep_Q1_009_partial_21_0739,
  ep_Q1_009_partial_21_0740,
  ep_Q1_009_partial_21_0741,
  ep_Q1_009_partial_21_0742,
  ep_Q1_009_partial_21_0743,
  ep_Q1_009_partial_21_0744,
  ep_Q1_009_partial_21_0745,
  ep_Q1_009_partial_21_0746,
  ep_Q1_009_partial_21_0747,
  ep_Q1_009_partial_21_0748,
  ep_Q1_009_partial_21_0749,
  ep_Q1_009_partial_21_0750,
  ep_Q1_009_partial_21_0751,
  ep_Q1_009_partial_21_0752,
  ep_Q1_009_partial_21_0753,
  ep_Q1_009_partial_21_0754,
  ep_Q1_009_partial_21_0755,
  ep_Q1_009_partial_21_0756,
  ep_Q1_009_partial_21_0757,
  ep_Q1_009_partial_21_0758,
  ep_Q1_009_partial_21_0759,
  ep_Q1_009_partial_21_0760,
  ep_Q1_009_partial_21_0761,
  ep_Q1_009_partial_21_0762,
  ep_Q1_009_partial_21_0763,
  ep_Q1_009_partial_21_0764,
  ep_Q1_009_partial_21_0765,
  ep_Q1_009_partial_21_0766,
  ep_Q1_009_partial_21_0767,
  ep_Q1_009_partial_21_0768,
  ep_Q1_009_partial_21_0769,
  ep_Q1_009_partial_21_0770,
  ep_Q1_009_partial_21_0771,
  ep_Q1_009_partial_21_0772,
  ep_Q1_009_partial_21_0773,
  ep_Q1_009_partial_21_0774,
  ep_Q1_009_partial_21_0775,
  ep_Q1_009_partial_21_0776,
  ep_Q1_009_partial_21_0777,
  ep_Q1_009_partial_21_0778,
  ep_Q1_009_partial_21_0779,
  ep_Q1_009_partial_21_0780,
  ep_Q1_009_partial_21_0781,
  ep_Q1_009_partial_21_0782,
  ep_Q1_009_partial_21_0783,
  ep_Q1_009_partial_21_0784,
  ep_Q1_009_partial_21_0785,
  ep_Q1_009_partial_21_0786,
  ep_Q1_009_partial_21_0787,
  ep_Q1_009_partial_21_0788,
  ep_Q1_009_partial_21_0789,
  ep_Q1_009_partial_21_0790,
  ep_Q1_009_partial_21_0791,
  ep_Q1_009_partial_21_0792,
  ep_Q1_009_partial_21_0793,
  ep_Q1_009_partial_21_0794,
  ep_Q1_009_partial_21_0795,
  ep_Q1_009_partial_21_0796,
  ep_Q1_009_partial_21_0797,
  ep_Q1_009_partial_21_0798,
  ep_Q1_009_partial_21_0799
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_21_0700_0799 : Poly :=
[
  term ((-1361885632799918303146907960026523559487026399571887339799255357735611753010265325886166698857295 : Rat) / 75311181359786391480181748550516162013966806364592187670770820359112724988019531156853585350848) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((-574030 : Rat) / 208029) [(6, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-12196663679624560648393610300846755184382038403594167552415372801593120641364365604927807459826011 : Rat) / 108499159586132936878227942827014809681138619338819253423991859839399688542062036412416182285120) [(6, 1), (10, 1), (11, 1), (13, 1)],
  term ((354111522875714572442928955329749603834161031929717808302948435712421302983 : Rat) / 106868606020257948739794602618779992495234215321835482000465832839310996240) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-748503516560904 : Rat) / 1395206957462413) [(6, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-33367560542910511887212332286056933753354916329707112806012591410024920774033965106793322439878307 : Rat) / 63575628181339442486601007174807452342195040668907943386213932048572973599996984342021434911943149) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2)],
  term ((808770383330832 : Rat) / 1395206957462413) [(6, 1), (10, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-38307812 : Rat) / 3536493) [(6, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1259466356764840865381798537937600 : Rat) / 24049240021528595265061175145067379) [(6, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((156501736639418095698329995838400 : Rat) / 3435605717361227895008739306438197) [(6, 1), (10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-461926934853654595314290143808267164822768382541453113655824235490694116905604964269857562494815498201825760160895 : Rat) / 420298736831550250932792031382520392301261797729261326150316965580141838420923936087221823890922209649510704896) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-33129843455955574156685 : Rat) / 290243508153948313977) [(6, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((21098765420225759898486073251488458150010862660447631 : Rat) / 31674661647735875515923472992039636019484687209697488) [(6, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-1404855237365801 : Rat) / 1395206957462413) [(6, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((43352362367362047242516079301130490640121414643930651502796335361361484146690197769094139458367889526787065615028669 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(6, 1), (10, 1), (11, 1), (15, 1)],
  term ((291182874916565810286601 : Rat) / 2031704557077638197839) [(6, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3907064623933031393205972055915447859574646471616910849817747802750797287683741502939483673672715 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(6, 1), (10, 1), (11, 1), (15, 3)],
  term ((31185470431310 : Rat) / 1395206957462413) [(6, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((-1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 2430381174729377786072305919325131736857505073189551276697417660402553023342189615638122483186688) [(6, 1), (10, 1), (11, 2)],
  term ((878272841093115360859437619502640 : Rat) / 24049240021528595265061175145067379) [(6, 1), (10, 1), (11, 2), (13, 1), (15, 1)],
  term ((-60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(6, 1), (10, 1), (11, 2), (15, 2)],
  term ((287857417009617 : Rat) / 1395206957462413) [(6, 1), (10, 1), (11, 2), (15, 2), (16, 1)],
  term ((-11273221283 : Rat) / 198043608) [(6, 1), (10, 1), (11, 2), (16, 1)],
  term ((59053246339204947161086852163103452109422005332410801698004296427981063639 : Rat) / 80151454515193461554845951964084994371425661491376611500349374629483247180) [(6, 1), (10, 1), (12, 1)],
  term ((-7094976535770337957559644545965347333663583089152334266318434664490673 : Rat) / 29935183759175896005544706615904759802586614936088370308253734688882632) [(6, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((81273192491475592624744306117067112718519949209838179 : Rat) / 142535977414811439821655628464178362087681092443638696) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1325572990614938 : Rat) / 1395206957462413) [(6, 1), (10, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-471541342957168459311257308690167541485069014232490930547528268589114586197146276731539042960792496609471765609537 : Rat) / 1838806973638032347830965137298526716318020365065518301907636724413120543091542220381595479522784667216609333920) [(6, 1), (10, 1), (12, 1), (15, 2)],
  term ((-49700332218010950393091 : Rat) / 2031704557077638197839) [(6, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1629181075074357390359347058317676610324861305981564716889854796084078461980957543912260987489056813 : Rat) / 181644651946684121390288591928021292406271544768308409674896948710208495999991383834346956891266140) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((5735012812185059 : Rat) / 1395206957462413) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 63575628181339442486601007174807452342195040668907943386213932048572973599996984342021434911943149) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 3)],
  term ((1497007033121808 : Rat) / 1395206957462413) [(6, 1), (10, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((6888372280238651170300448919018387381424890571517275990817667209980606288170332456703002663506308065901618601142567 : Rat) / 4903485263034752927549240366129404576848054306841382138420364598434988114910779254350921278727425779244291557120) [(6, 1), (10, 1), (13, 1), (15, 1)],
  term ((271584703858441547571091 : Rat) / 2031704557077638197839) [(6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((136073320149709178450980285629152142057643307402665892699317202289970372844197118654145324061436087 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(6, 1), (10, 1), (13, 1), (15, 3)],
  term ((-1507241431751094 : Rat) / 1395206957462413) [(6, 1), (10, 1), (13, 1), (15, 3), (16, 1)],
  term ((3449173326224289277432497646660378786074034383946043349199055355607542546172348513977969643710919 : Rat) / 15822794106311053294741574995606326411832715320244474457665479559912454579050713643477359916580) [(6, 1), (10, 1), (13, 2)],
  term ((2518932713529681730763597075875200 : Rat) / 24049240021528595265061175145067379) [(6, 1), (10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-3649844072340714874678910260088400 : Rat) / 24049240021528595265061175145067379) [(6, 1), (10, 1), (13, 2), (15, 2)],
  term ((177774804 : Rat) / 8251817) [(6, 1), (10, 1), (13, 2), (16, 1)],
  term ((327908400577828390986977134137600 : Rat) / 24049240021528595265061175145067379) [(6, 1), (10, 1), (13, 3), (15, 1)],
  term ((-151184951141162511435080991736866989129069096806224064166221581814574565224073711249162813319802239 : Rat) / 433996638344531747512911771308059238724554477355277013695967439357598754168248145649664729140480) [(6, 1), (10, 1), (14, 1)],
  term ((540402882509456502889416099592698037754352546888985231810033112712579480291296889138775455096231751874413512049409 : Rat) / 408623771919562743962436697177450381404004525570115178201697049869582342909231604529243439893952148270357629760) [(6, 1), (10, 1), (14, 1), (15, 2)],
  term ((492462591544720069280579 : Rat) / 4063409114155276395678) [(6, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-236458753 : Rat) / 7072986) [(6, 1), (10, 1), (14, 1), (16, 1)],
  term ((-311299082557579037653676420766075658908360580866990064112500931935684282504824462711457709302311073 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(6, 1), (10, 1), (14, 2), (15, 2)],
  term ((3079071884380596 : Rat) / 1395206957462413) [(6, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((-94114590254983330141970316551631082558244043825663440713843978314506510250168883610889088369789866523878837909937 : Rat) / 66714085211357182687744766886114347984327269480835131134970946917482831495384751759876479982686065023731857920) [(6, 1), (10, 1), (15, 2)],
  term ((-73539031126059498721075 : Rat) / 580487016307896627954) [(6, 1), (10, 1), (15, 2), (16, 1)],
  term ((-806910417662736248398950823829891102253996563659415031067128209429176087976477619109630736310163763 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(6, 1), (10, 1), (15, 4)],
  term ((2463993599990338 : Rat) / 1395206957462413) [(6, 1), (10, 1), (15, 4), (16, 1)],
  term ((74645953685 : Rat) / 792174432) [(6, 1), (10, 1), (16, 1)],
  term ((5901673312616415253973 : Rat) / 580487016307896627954) [(6, 1), (10, 2), (15, 2), (16, 1)],
  term ((-11273221283 : Rat) / 396087216) [(6, 1), (10, 2), (16, 1)],
  term ((1361885632799918303146907960026523559487026399571887339799255357735611753010265325886166698857295 : Rat) / 150622362719572782960363497101032324027933612729184375341541640718225449976039062313707170701696) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((287015 : Rat) / 208029) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((12196663679624560648393610300846755184382038403594167552415372801593120641364365604927807459826011 : Rat) / 216998319172265873756455885654029619362277238677638506847983719678799377084124072824832364570240) [(6, 1), (11, 1), (13, 1)],
  term ((-354111522875714572442928955329749603834161031929717808302948435712421302983 : Rat) / 213737212040515897479589205237559984990468430643670964000931665678621992480) [(6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 254302512725357769946404028699229809368780162675631773544855728194291894399987937368085739647772596) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((374251758280452 : Rat) / 1395206957462413) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((33367560542910511887212332286056933753354916329707112806012591410024920774033965106793322439878307 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-404385191665416 : Rat) / 1395206957462413) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((19153906 : Rat) / 3536493) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((629733178382420432690899268968800 : Rat) / 24049240021528595265061175145067379) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-78250868319709047849164997919200 : Rat) / 3435605717361227895008739306438197) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((461926934853654595314290143808267164822768382541453113655824235490694116905604964269857562494815498201825760160895 : Rat) / 840597473663100501865584062765040784602523595458522652300633931160283676841847872174443647781844419299021409792) [(6, 1), (11, 1), (14, 1), (15, 1)],
  term ((33129843455955574156685 : Rat) / 580487016307896627954) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21098765420225759898486073251488458150010862660447631 : Rat) / 63349323295471751031846945984079272038969374419394976) [(6, 1), (11, 1), (14, 2), (15, 1)],
  term ((1404855237365801 : Rat) / 2790413914924826) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-43352362367362047242516079301130490640121414643930651502796335361361484146690197769094139458367889526787065615028669 : Rat) / 58841823156417035130590884393552854922176651682096585661044375181219857378929351052211055344729109350931498685440) [(6, 1), (11, 1), (15, 1)],
  term ((-291182874916565810286601 : Rat) / 4063409114155276395678) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((3907064623933031393205972055915447859574646471616910849817747802750797287683741502939483673672715 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(6, 1), (11, 1), (15, 3)],
  term ((-15592735215655 : Rat) / 1395206957462413) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((1400379134279677785474283610094284851991244785363603523529960392788893977016479295199794654661027521 : Rat) / 4860762349458755572144611838650263473715010146379102553394835320805106046684379231276244966373376) [(6, 1), (11, 2)],
  term ((-439136420546557680429718809751320 : Rat) / 24049240021528595265061175145067379) [(6, 1), (11, 2), (13, 1), (15, 1)],
  term ((60256226743533095862062018864319077133136996851339084206881547555856666683959792517866270799484863 : Rat) / 678140033934287386523744076531279491650080433801684729452948608518111718399967832981561972394060256) [(6, 1), (11, 2), (15, 2)],
  term ((-287857417009617 : Rat) / 2790413914924826) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((11273221283 : Rat) / 396087216) [(6, 1), (11, 2), (16, 1)],
  term ((-59053246339204947161086852163103452109422005332410801698004296427981063639 : Rat) / 160302909030386923109691903928169988742851322982753223000698749258966494360) [(6, 1), (12, 1)],
  term ((7094976535770337957559644545965347333663583089152334266318434664490673 : Rat) / 59870367518351792011089413231809519605173229872176740616507469377765264) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-81273192491475592624744306117067112718519949209838179 : Rat) / 285071954829622879643311256928356724175362184887277392) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((662786495307469 : Rat) / 1395206957462413) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((471541342957168459311257308690167541485069014232490930547528268589114586197146276731539042960792496609471765609537 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(6, 1), (12, 1), (15, 2)],
  term ((49700332218010950393091 : Rat) / 4063409114155276395678) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((1629181075074357390359347058317676610324861305981564716889854796084078461980957543912260987489056813 : Rat) / 363289303893368242780577183856042584812543089536616819349793897420416991999982767668693913782532280) [(6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5735012812185059 : Rat) / 2790413914924826) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((56616422072838549163216503030117400313342491889212310120407638703811088408020686838612285605790567 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(6, 1), (13, 1), (14, 1), (15, 3)],
  term ((-748503516560904 : Rat) / 1395206957462413) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-6888372280238651170300448919018387381424890571517275990817667209980606288170332456703002663506308065901618601142567 : Rat) / 9806970526069505855098480732258809153696108613682764276840729196869976229821558508701842557454851558488583114240) [(6, 1), (13, 1), (15, 1)],
  term ((-271584703858441547571091 : Rat) / 4063409114155276395678) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-136073320149709178450980285629152142057643307402665892699317202289970372844197118654145324061436087 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(6, 1), (13, 1), (15, 3)],
  term ((753620715875547 : Rat) / 1395206957462413) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3449173326224289277432497646660378786074034383946043349199055355607542546172348513977969643710919 : Rat) / 31645588212622106589483149991212652823665430640488948915330959119824909158101427286954719833160) [(6, 1), (13, 2)],
  term ((-1259466356764840865381798537937600 : Rat) / 24049240021528595265061175145067379) [(6, 1), (13, 2), (14, 1), (15, 2)],
  term ((1824922036170357437339455130044200 : Rat) / 24049240021528595265061175145067379) [(6, 1), (13, 2), (15, 2)],
  term ((-88887402 : Rat) / 8251817) [(6, 1), (13, 2), (16, 1)],
  term ((-163954200288914195493488567068800 : Rat) / 24049240021528595265061175145067379) [(6, 1), (13, 3), (15, 1)],
  term ((151184951141162511435080991736866989129069096806224064166221581814574565224073711249162813319802239 : Rat) / 867993276689063495025823542616118477449108954710554027391934878715197508336496291299329458280960) [(6, 1), (14, 1)],
  term ((-540402882509456502889416099592698037754352546888985231810033112712579480291296889138775455096231751874413512049409 : Rat) / 817247543839125487924873394354900762808009051140230356403394099739164685818463209058486879787904296540715259520) [(6, 1), (14, 1), (15, 2)],
  term ((-492462591544720069280579 : Rat) / 8126818228310552791356) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((236458753 : Rat) / 14145972) [(6, 1), (14, 1), (16, 1)],
  term ((311299082557579037653676420766075658908360580866990064112500931935684282504824462711457709302311073 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(6, 1), (14, 2), (15, 2)],
  term ((-1539535942190298 : Rat) / 1395206957462413) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((94114590254983330141970316551631082558244043825663440713843978314506510250168883610889088369789866523878837909937 : Rat) / 133428170422714365375489533772228695968654538961670262269941893834965662990769503519752959965372130047463715840) [(6, 1), (15, 2)],
  term ((47058796313167527396059 : Rat) / 773982688410528837272) [(6, 1), (15, 2), (16, 1)],
  term ((806910417662736248398950823829891102253996563659415031067128209429176087976477619109630736310163763 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(6, 1), (15, 4)],
  term ((-1231996799995169 : Rat) / 1395206957462413) [(6, 1), (15, 4), (16, 1)],
  term ((-1508874581 : Rat) / 37722592) [(6, 1), (16, 1)],
  term ((-347159014435945014093861199372180970211033505293116278873204403955204941466433978272586218130993 : Rat) / 3037976468411722232590382399156414671071881341486939095871772075503191279177737019547653103983360) [(6, 2)],
  term ((-252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(6, 2), (8, 1)],
  term ((252550289041998757358099380069052047712794371965908246099715882059204046145904083518029371193 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(6, 2), (8, 1), (10, 1)],
  term ((2266213775384253568090043131281361122906789524453692710753204884111530035577088084422030461391 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(6, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-7374973845181468732611087823649080 : Rat) / 30920451456251051055078653757943773) [(6, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((1407096728790050002569804627083710626719414299447999272913051047070874591782216411402807649418233 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(6, 2), (8, 1), (10, 1), (15, 2)],
  term ((-2266213775384253568090043131281361122906789524453692710753204884111530035577088084422030461391 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(6, 2), (8, 1), (11, 1), (15, 1)],
  term ((3687486922590734366305543911824540 : Rat) / 30920451456251051055078653757943773) [(6, 2), (8, 1), (14, 1), (15, 2)],
  term ((-1407096728790050002569804627083710626719414299447999272913051047070874591782216411402807649418233 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(6, 2), (8, 1), (15, 2)],
  term ((-1751791739534636554877596326164059078726556800968477264101462241382374748550900980531743391 : Rat) / 1185866953408114534758566583109094881668827344318159344591277201847083609268908465464593760) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((213068810880800883977678751242005376000 : Rat) / 2144116865330816633312319087537095051139) [(6, 2), (9, 1), (10, 1), (11, 1), (15, 2)],
  term ((-1714692261367085162679200362606484613992660014898241523732036857393723507176988550318344395946651196850773516973 : Rat) / 28996160722478569308042892947716798818667209590234061432627807997223606700269249197710506466291144189128233856) [(6, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((146700175696052235089456 : Rat) / 4676338877845046513121) [(6, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((164904248852740657348995419437778135331812205588352404707767421041844085741137158913587586912693746568936572938217951 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-32196101519984232532871 : Rat) / 1558779625948348837707) [(6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((18391555611479494988341315280553390828800 : Rat) / 15008818057315716433186233612759665357973) [(6, 2), (9, 1), (10, 1), (15, 3)],
  term ((1751791739534636554877596326164059078726556800968477264101462241382374748550900980531743391 : Rat) / 2371733906816229069517133166218189763337654688636318689182554403694167218537816930929187520) [(6, 2), (9, 1), (11, 1)],
  term ((-106534405440400441988839375621002688000 : Rat) / 2144116865330816633312319087537095051139) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term ((1714692261367085162679200362606484613992660014898241523732036857393723507176988550318344395946651196850773516973 : Rat) / 57992321444957138616085785895433597637334419180468122865255615994447213400538498395421012932582288378256467712) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((-73350087848026117544728 : Rat) / 4676338877845046513121) [(6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-164904248852740657348995419437778135331812205588352404707767421041844085741137158913587586912693746568936572938217951 : Rat) / 9462027166959206736600556826698945790507483833485178926695106305654007338431861398196892470080126171796325271889920) [(6, 2), (9, 1), (15, 1)],
  term ((32196101519984232532871 : Rat) / 3117559251896697675414) [(6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-9195777805739747494170657640276695414400 : Rat) / 15008818057315716433186233612759665357973) [(6, 2), (9, 1), (15, 3)],
  term ((347159014435945014093861199372180970211033505293116278873204403955204941466433978272586218130993 : Rat) / 1518988234205861116295191199578207335535940670743469547935886037751595639588868509773826551991680) [(6, 2), (10, 1)],
  term ((42080664036997058477289371015428034492950314966330391721725054450871304762701926353227022764538385 : Rat) / 640145041558184327581544862679387377118717854099033595201551973052458162398166014833255475482208) [(6, 2), (10, 1), (11, 1), (15, 1)],
  term ((35589860 : Rat) / 3536493) [(6, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-24530758996544628450945932313404007581149427591995039909319088002817133 : Rat) / 2095462863142312720388129463113333186181063045526185921577761428221784240) [(6, 2), (10, 1), (13, 1), (15, 1)],
  term ((-240288305598895558716027964628613680940699067407081 : Rat) / 116450961940205424690895121294263367718693702976829) [(6, 2), (10, 1), (14, 1), (15, 2)],
  term ((3951476446241272 : Rat) / 1395206957462413) [(6, 2), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((11784029259121631862012103830084795699490688709330471399666668759683562852882388443731846150705749518908937152297451 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(6, 2), (10, 1), (15, 2)],
  term ((102520889054592207201874 : Rat) / 677234852359212732613) [(6, 2), (10, 1), (15, 2), (16, 1)],
  term ((746239 : Rat) / 24755451) [(6, 2), (10, 1), (16, 1)],
  term ((-42080664036997058477289371015428034492950314966330391721725054450871304762701926353227022764538385 : Rat) / 1280290083116368655163089725358774754237435708198067190403103946104916324796332029666510950964416) [(6, 2), (11, 1), (15, 1)],
  term ((-17794930 : Rat) / 3536493) [(6, 2), (11, 1), (15, 1), (16, 1)],
  term ((24530758996544628450945932313404007581149427591995039909319088002817133 : Rat) / 4190925726284625440776258926226666372362126091052371843155522856443568480) [(6, 2), (13, 1), (15, 1)],
  term ((240288305598895558716027964628613680940699067407081 : Rat) / 232901923880410849381790242588526735437387405953658) [(6, 2), (14, 1), (15, 2)],
  term ((-1975738223120636 : Rat) / 1395206957462413) [(6, 2), (14, 1), (15, 2), (16, 1)],
  term ((-11784029259121631862012103830084795699490688709330471399666668759683562852882388443731846150705749518908937152297451 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(6, 2), (15, 2)],
  term ((-51260444527296103600937 : Rat) / 677234852359212732613) [(6, 2), (15, 2), (16, 1)],
  term ((-746239 : Rat) / 49510902) [(6, 2), (16, 1)],
  term ((1386692777580949066693643916419965827958859442886279426165453459490672858 : Rat) / 4007572725759673077742297598204249718571283074568830575017468731474162359) [(7, 1), (8, 1), (10, 1), (11, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-536629633030100147172273223281356128979100693994734601640620693264344638127770080775978062528417 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((475368877954965555370994468128609066354603531482982131542165551311713772458286828189333182869 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((26800311876207674025560207203815293503581469773865165837131342179352735808551477607515713783935 : Rat) / 1300838429494355261664051927701102293010012342959048280280114226110228770672852967333286498752) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2977559401718826073940389265521712 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 2), (15, 1)],
  term ((-200397716549304700680186696578296984526387136126621829275009659114818063654469731304945389827395 : Rat) / 2601676858988710523328103855402204586020024685918096560560228452220457541345705934666572997504) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-27860779992222251208513775830720 : Rat) / 3435605717361227895008739306438197) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 3)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-1559048094388291692611456666551709998690813699296700818696912989768626823852577057620061876801 : Rat) / 495557496950230575872019781981372302099052321127256487725757800422944293589658273269823428096) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-88462782965631509855892718431241328600051480257045241572834875762416640 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((378801552938638204031466459533248094763697091238917621704899573514042463598354892656604538261 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-375127322420067519276073331624061371999182660240207193071267519837491322825870508394955280789 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-131222562431930764182165089225070103345091580874442552176121548500916525940157888445978026057641 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((1450009580106890032585259128923556 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((76981805925608078535629388859475112179599036758016513504309624555748966089119693391037958241373 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((167654732615531123087380597891817524937925186331517535888454610366352294131871257813647677575 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(7, 1), (8, 1), (10, 1), (15, 3)],
  term ((1364303599364281279831393069283888284616675009878797335068456363909554522891147539012869442420057 : Rat) / 41626829743819368373249661686435273376320394974689544968963655235527320661531294954665167960064) [(7, 1), (8, 1), (10, 2), (11, 1)],
  term ((-302014619258136788910019611903712606934540194440218677127780843795501303426153465950817350989 : Rat) / 247778748475115287936009890990686151049526160563628243862878900211472146794829136634911714048) [(7, 1), (8, 1), (10, 2), (11, 1), (15, 2)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(7, 1), (8, 1), (10, 2), (12, 1), (15, 1)],
  term ((1559048094388291692611456666551709998690813699296700818696912989768626823852577057620061876801 : Rat) / 247778748475115287936009890990686151049526160563628243862878900211472146794829136634911714048) [(7, 1), (8, 1), (10, 2), (13, 1)],
  term ((176925565931263019711785436862482657200102960514090483145669751524833280 : Rat) / 445285858417741453082477510911583302063475897174314508335274303497129151) [(7, 1), (8, 1), (10, 2), (13, 1), (14, 1)],
  term ((-378801552938638204031466459533248094763697091238917621704899573514042463598354892656604538261 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(7, 1), (8, 1), (10, 2), (13, 1), (14, 1), (15, 2)],
  term ((375127322420067519276073331624061371999182660240207193071267519837491322825870508394955280789 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(7, 1), (8, 1), (10, 2), (13, 1), (15, 2)],
  term ((131222562431930764182165089225070103345091580874442552176121548500916525940157888445978026057641 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (10, 2), (14, 1), (15, 1)],
  term ((-2900019160213780065170518257847112 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (10, 2), (14, 2), (15, 1)],
  term ((-76981805925608078535629388859475112179599036758016513504309624555748966089119693391037958241373 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-167654732615531123087380597891817524937925186331517535888454610366352294131871257813647677575 : Rat) / 185834061356336465952007418243014613287144620422721182897159175158604110096121852476183785536) [(7, 1), (8, 1), (10, 2), (15, 3)],
  term ((-4179332622138575796953023139187400336038085440156059559548423484552206776213842624169411697645579 : Rat) / 499521956925832420478995940237223280515844739696274539627563862826327847938375539455982015520768) [(7, 1), (8, 1), (11, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((536629633030100147172273223281356128979100693994734601640620693264344638127770080775978062528417 : Rat) / 17840069890208300731392712151329402875565883560581233558127280815225994569227697837713643411456) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((-475368877954965555370994468128609066354603531482982131542165551311713772458286828189333182869 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((302014619258136788910019611903712606934540194440218677127780843795501303426153465950817350989 : Rat) / 991114993900461151744039563962744604198104642254512975451515600845888587179316546539646856192) [(7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-2704835796426367161913922447013237469275845561444730009608663893939568106979105133019842808757 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(7, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((103917279727527021707747000542546526648283737905549980179139922665673116132732903786685056806797 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-26800311876207674025560207203815293503581469773865165837131342179352735808551477607515713783935 : Rat) / 2601676858988710523328103855402204586020024685918096560560228452220457541345705934666572997504) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((267367530629478200637847104060513931280993036627658953538456668434690544122615981703270780127169 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((13930389996111125604256887915360 : Rat) / 3435605717361227895008739306438197) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 700 through 799. -/
theorem ep_Q1_009_block_21_0700_0799_valid :
    checkProductSumEq ep_Q1_009_partials_21_0700_0799
      ep_Q1_009_block_21_0700_0799 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
