/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NYNYN, term block 28:1700-1799

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NYNYNTermShards

/-- Generator polynomial 28 for relaxed split surplus certificate `R009:u=v:R009NYNYN`. -/
def rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 1700 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1700 : Poly :=
[
  term ((-2764486672198490330304 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1700 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1700 : Poly :=
[
  term ((2764486672198490330304 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5528973344396980660608 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1700 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1700_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1700
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1700 := by
  native_decide

/-- Coefficient term 1701 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1701 : Poly :=
[
  term ((6019737232036679782972 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 1701 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1701 : Poly :=
[
  term ((12039474464073359565944 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-6019737232036679782972 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1701 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1701_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1701
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1701 := by
  native_decide

/-- Coefficient term 1702 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1702 : Poly :=
[
  term ((410303932469182592695967643323749686315911 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1702 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1702 : Poly :=
[
  term ((-410303932469182592695967643323749686315911 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((410303932469182592695967643323749686315911 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1702 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1702_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1702
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1702 := by
  native_decide

/-- Coefficient term 1703 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1703 : Poly :=
[
  term ((-296538805198452290568 : Rat) / 228382013929336753745) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1703 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1703 : Poly :=
[
  term ((-593077610396904581136 : Rat) / 228382013929336753745) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((296538805198452290568 : Rat) / 228382013929336753745) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1703 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1703_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1703
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1703 := by
  native_decide

/-- Coefficient term 1704 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1704 : Poly :=
[
  term ((11177526045360762176570060027185086628005546239111719355894198679497710253 : Rat) / 756613226436086768049178531031261176667980223534919349703512349686326225) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1704 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1704 : Poly :=
[
  term ((22355052090721524353140120054370173256011092478223438711788397358995420506 : Rat) / 756613226436086768049178531031261176667980223534919349703512349686326225) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11177526045360762176570060027185086628005546239111719355894198679497710253 : Rat) / 756613226436086768049178531031261176667980223534919349703512349686326225) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1704 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1704_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1704
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1704 := by
  native_decide

/-- Coefficient term 1705 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1705 : Poly :=
[
  term ((-347195025545883852912 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1705 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1705 : Poly :=
[
  term ((-694390051091767705824 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((347195025545883852912 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1705 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1705_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1705
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1705 := by
  native_decide

/-- Coefficient term 1706 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1706 : Poly :=
[
  term ((-85844834952922060018000209405893353954049948950660636036139685803 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(8, 1), (9, 1), (10, 1), (13, 1)]
]

/-- Partial product 1706 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1706 : Poly :=
[
  term ((85844834952922060018000209405893353954049948950660636036139685803 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-85844834952922060018000209405893353954049948950660636036139685803 : Rat) / 333390229939667209106775482079636567325082553683743242485485305) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1706 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1706_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1706
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1706 := by
  native_decide

/-- Coefficient term 1707 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1707 : Poly :=
[
  term ((25020428943412886053195920952624806226261 : Rat) / 4396352775071994240912540908485088809500) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1707 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1707 : Poly :=
[
  term ((-25020428943412886053195920952624806226261 : Rat) / 4396352775071994240912540908485088809500) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((25020428943412886053195920952624806226261 : Rat) / 2198176387535997120456270454242544404750) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1707 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1707_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1707
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1707 := by
  native_decide

/-- Coefficient term 1708 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1708 : Poly :=
[
  term ((2276535637033212286716 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1708 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1708 : Poly :=
[
  term ((-2276535637033212286716 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((4553071274066424573432 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1708 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1708_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1708
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1708 := by
  native_decide

/-- Coefficient term 1709 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1709 : Poly :=
[
  term ((-4723149981519542183624 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1709 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1709 : Poly :=
[
  term ((-9446299963039084367248 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((4723149981519542183624 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1709 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1709_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1709
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1709 := by
  native_decide

/-- Coefficient term 1710 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1710 : Poly :=
[
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1710 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1710 : Poly :=
[
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1710 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1710_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1710
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1710 := by
  native_decide

/-- Coefficient term 1711 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1711 : Poly :=
[
  term ((1926038409869376 : Rat) / 7342292683791569) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1711 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1711 : Poly :=
[
  term ((-1926038409869376 : Rat) / 7342292683791569) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1711 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1711_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1711
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1711 := by
  native_decide

/-- Coefficient term 1712 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1712 : Poly :=
[
  term ((-1048024765596157001451119910511446571430211053367616866665748020663554412041 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 1712 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1712 : Poly :=
[
  term ((-1048024765596157001451119910511446571430211053367616866665748020663554412041 : Rat) / 8827154308421012293907082862031380394459769274574059079874310746340472625) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((1048024765596157001451119910511446571430211053367616866665748020663554412041 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(8, 1), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1712 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1712_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1712
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1712 := by
  native_decide

/-- Coefficient term 1713 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1713 : Poly :=
[
  term ((2743532861735824942536 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1713 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1713 : Poly :=
[
  term ((5487065723471649885072 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2743532861735824942536 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1713 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1713_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1713
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1713 := by
  native_decide

/-- Coefficient term 1714 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1714 : Poly :=
[
  term ((669043596300515029264577155797579870215048863836904589950572762287 : Rat) / 14817343552874098182523354759094958547781446830388588554910458000) [(8, 1), (9, 1), (11, 1)]
]

/-- Partial product 1714 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1714 : Poly :=
[
  term ((-669043596300515029264577155797579870215048863836904589950572762287 : Rat) / 14817343552874098182523354759094958547781446830388588554910458000) [(8, 1), (9, 1), (11, 1)],
  term ((669043596300515029264577155797579870215048863836904589950572762287 : Rat) / 7408671776437049091261677379547479273890723415194294277455229000) [(8, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1714 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1714_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1714
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1714 := by
  native_decide

/-- Coefficient term 1715 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1715 : Poly :=
[
  term ((90038421077045634735932718006903567379153235560252914582507410243054961515081983 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 1715 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1715 : Poly :=
[
  term ((-90038421077045634735932718006903567379153235560252914582507410243054961515081983 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((90038421077045634735932718006903567379153235560252914582507410243054961515081983 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1715 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1715_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1715
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1715 := by
  native_decide

/-- Coefficient term 1716 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1716 : Poly :=
[
  term ((-2540054968939562810217242357797077447494297 : Rat) / 7913434995129589633642573635273159857100) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 1716 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1716 : Poly :=
[
  term ((2540054968939562810217242357797077447494297 : Rat) / 7913434995129589633642573635273159857100) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2540054968939562810217242357797077447494297 : Rat) / 3956717497564794816821286817636579928550) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1716 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1716_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1716
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1716 := by
  native_decide

/-- Coefficient term 1717 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1717 : Poly :=
[
  term ((-12484541303299972392812 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1717 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1717 : Poly :=
[
  term ((12484541303299972392812 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24969082606599944785624 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1717 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1717_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1717
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1717 := by
  native_decide

/-- Coefficient term 1718 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1718 : Poly :=
[
  term ((1915739631623386750279331 : Rat) / 541167495006558390624045) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1718 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1718 : Poly :=
[
  term ((3831479263246773500558662 : Rat) / 541167495006558390624045) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1915739631623386750279331 : Rat) / 541167495006558390624045) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1718 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1718_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1718
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1718 := by
  native_decide

/-- Coefficient term 1719 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1719 : Poly :=
[
  term ((2540054968939562810217242357797077447494297 : Rat) / 3956717497564794816821286817636579928550) [(8, 1), (9, 1), (11, 1), (12, 2)]
]

/-- Partial product 1719 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1719 : Poly :=
[
  term ((-2540054968939562810217242357797077447494297 : Rat) / 3956717497564794816821286817636579928550) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((2540054968939562810217242357797077447494297 : Rat) / 1978358748782397408410643408818289964275) [(8, 1), (9, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1719 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1719_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1719
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1719 := by
  native_decide

/-- Coefficient term 1720 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1720 : Poly :=
[
  term ((24969082606599944785624 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1720 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1720 : Poly :=
[
  term ((49938165213199889571248 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-24969082606599944785624 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1720 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1720_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1720
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1720 := by
  native_decide

/-- Coefficient term 1721 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1721 : Poly :=
[
  term ((-2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1721 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1721 : Poly :=
[
  term ((-2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1721 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1721_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1721
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1721 := by
  native_decide

/-- Coefficient term 1722 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1722 : Poly :=
[
  term ((22790793191585225162374 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1722 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1722 : Poly :=
[
  term ((45581586383170450324748 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22790793191585225162374 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1722 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1722_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1722
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1722 := by
  native_decide

/-- Coefficient term 1723 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1723 : Poly :=
[
  term ((8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (9, 1), (11, 1), (13, 2)]
]

/-- Partial product 1723 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1723 : Poly :=
[
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1723 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1723_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1723
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1723 := by
  native_decide

/-- Coefficient term 1724 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1724 : Poly :=
[
  term ((22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1724 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1724 : Poly :=
[
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1724 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1724_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1724
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1724 := by
  native_decide

/-- Coefficient term 1725 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1725 : Poly :=
[
  term ((-353979882721643491508977442306590916848070403326047186950058078695765865810111171 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 1), (11, 1), (14, 1)]
]

/-- Partial product 1725 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1725 : Poly :=
[
  term ((353979882721643491508977442306590916848070403326047186950058078695765865810111171 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-353979882721643491508977442306590916848070403326047186950058078695765865810111171 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1725 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1725_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1725
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1725 := by
  native_decide

/-- Coefficient term 1726 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1726 : Poly :=
[
  term ((-7235663910991024377426967 : Rat) / 1515268986018363493747326) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1726 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1726 : Poly :=
[
  term ((7235663910991024377426967 : Rat) / 1515268986018363493747326) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-7235663910991024377426967 : Rat) / 757634493009181746873663) [(8, 1), (9, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1726 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1726_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1726
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1726 := by
  native_decide

/-- Coefficient term 1727 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1727 : Poly :=
[
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(8, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 1727 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1727 : Poly :=
[
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(8, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1727 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1727_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1727
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1727 := by
  native_decide

/-- Coefficient term 1728 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1728 : Poly :=
[
  term ((-4232046277742570315796 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1728 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1728 : Poly :=
[
  term ((-8464092555485140631592 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1728 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1728_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1728
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1728 := by
  native_decide

/-- Coefficient term 1729 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1729 : Poly :=
[
  term ((5989245937490298697141 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 1729 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1729 : Poly :=
[
  term ((11978491874980597394282 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5989245937490298697141 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1729 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1729_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1729
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1729 := by
  native_decide

/-- Coefficient term 1730 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1730 : Poly :=
[
  term ((1606184556847589865954940371247984838012536 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (11, 2), (13, 1)]
]

/-- Partial product 1730 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1730 : Poly :=
[
  term ((-1606184556847589865954940371247984838012536 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((3212369113695179731909880742495969676025072 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1730 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1730_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1730
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1730 := by
  native_decide

/-- Coefficient term 1731 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1731 : Poly :=
[
  term ((-10511500802420929816448 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1731 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1731 : Poly :=
[
  term ((-21023001604841859632896 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((10511500802420929816448 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1731 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1731_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1731
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1731 := by
  native_decide

/-- Coefficient term 1732 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1732 : Poly :=
[
  term ((-61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 1732 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1732 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1732 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1732_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1732
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1732 := by
  native_decide

/-- Coefficient term 1733 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1733 : Poly :=
[
  term ((631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1733 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1733 : Poly :=
[
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1733 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1733_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1733
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1733 := by
  native_decide

/-- Coefficient term 1734 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1734 : Poly :=
[
  term ((284897135238194868467623846652879900955510491285995151461427363218858201194395239 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(8, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 1734 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1734 : Poly :=
[
  term ((-284897135238194868467623846652879900955510491285995151461427363218858201194395239 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((284897135238194868467623846652879900955510491285995151461427363218858201194395239 : Rat) / 105683735468592599761109257214446561156983477623357534766586605004186047108000) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1734 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1734_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1734
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1734 := by
  native_decide

/-- Coefficient term 1735 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1735 : Poly :=
[
  term ((1595001198689311755240899196532561547096573 : Rat) / 4093156031963580844987538087210255098500) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1735 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1735 : Poly :=
[
  term ((-1595001198689311755240899196532561547096573 : Rat) / 4093156031963580844987538087210255098500) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1595001198689311755240899196532561547096573 : Rat) / 2046578015981790422493769043605127549250) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1735 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1735_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1735
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1735 := by
  native_decide

/-- Coefficient term 1736 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1736 : Poly :=
[
  term ((3948108432263932945556 : Rat) / 2603554958794438992693) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1736 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1736 : Poly :=
[
  term ((-3948108432263932945556 : Rat) / 2603554958794438992693) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((7896216864527865891112 : Rat) / 2603554958794438992693) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1736 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1736_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1736
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1736 := by
  native_decide

/-- Coefficient term 1737 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1737 : Poly :=
[
  term ((42812450343894701153544523 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1737 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1737 : Poly :=
[
  term ((85624900687789402307089046 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42812450343894701153544523 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1737 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1737_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1737
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1737 := by
  native_decide

/-- Coefficient term 1738 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1738 : Poly :=
[
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1738 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1738 : Poly :=
[
  term ((15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 57584923989117473300342204510731528750770752812796693702478257544) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1738 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1738_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1738
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1738 := by
  native_decide

/-- Coefficient term 1739 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1739 : Poly :=
[
  term ((-11423328844091868 : Rat) / 7342292683791569) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1739 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1739 : Poly :=
[
  term ((11423328844091868 : Rat) / 7342292683791569) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1739 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1739_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1739
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1739 := by
  native_decide

/-- Coefficient term 1740 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1740 : Poly :=
[
  term ((-1268064590144297155386789662536624144696760850947699761622939693120316012447847325923 : Rat) / 428747172158805889164180133268208093440420081664892256599734457990315661334144000) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 1740 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1740 : Poly :=
[
  term ((-1268064590144297155386789662536624144696760850947699761622939693120316012447847325923 : Rat) / 214373586079402944582090066634104046720210040832446128299867228995157830667072000) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1268064590144297155386789662536624144696760850947699761622939693120316012447847325923 : Rat) / 428747172158805889164180133268208093440420081664892256599734457990315661334144000) [(8, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1740 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1740_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1740
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1740 := by
  native_decide

/-- Coefficient term 1741 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1741 : Poly :=
[
  term ((-3873086202357543078523571 : Rat) / 84181610334353527430407) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1741 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1741 : Poly :=
[
  term ((-7746172404715086157047142 : Rat) / 84181610334353527430407) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3873086202357543078523571 : Rat) / 84181610334353527430407) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1741 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1741_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1741
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1741 := by
  native_decide

/-- Coefficient term 1742 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1742 : Poly :=
[
  term ((-944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (9, 1), (12, 2), (13, 1)]
]

/-- Partial product 1742 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1742 : Poly :=
[
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1742 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1742_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1742
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1742 := by
  native_decide

/-- Coefficient term 1743 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1743 : Poly :=
[
  term ((-77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 2), (13, 1), (16, 1)]
]

/-- Partial product 1743 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1743 : Poly :=
[
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1743 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1743_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1743
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1743 := by
  native_decide

/-- Coefficient term 1744 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1744 : Poly :=
[
  term ((11882963797271563319952709638379049864823253986764102273047409551832112504521 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(8, 1), (9, 1), (12, 2), (15, 1)]
]

/-- Partial product 1744 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1744 : Poly :=
[
  term ((11882963797271563319952709638379049864823253986764102273047409551832112504521 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-11882963797271563319952709638379049864823253986764102273047409551832112504521 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(8, 1), (9, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1744 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1744_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1744
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1744 := by
  native_decide

/-- Coefficient term 1745 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1745 : Poly :=
[
  term ((19921405032373666321872 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1745 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1745 : Poly :=
[
  term ((39842810064747332643744 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-19921405032373666321872 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1745 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1745_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1745
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1745 := by
  native_decide

/-- Coefficient term 1746 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1746 : Poly :=
[
  term ((-3500762755331813287695530724027490829539025507155036212649581586992127852037798279 : Rat) / 26520443638689024072011142264012871759201242164838696284519657195277257402112000) [(8, 1), (9, 1), (13, 1)]
]

/-- Partial product 1746 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1746 : Poly :=
[
  term ((3500762755331813287695530724027490829539025507155036212649581586992127852037798279 : Rat) / 26520443638689024072011142264012871759201242164838696284519657195277257402112000) [(8, 1), (9, 1), (13, 1)],
  term ((-3500762755331813287695530724027490829539025507155036212649581586992127852037798279 : Rat) / 13260221819344512036005571132006435879600621082419348142259828597638628701056000) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1746 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1746_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1746
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1746 := by
  native_decide

/-- Coefficient term 1747 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1747 : Poly :=
[
  term ((1083550856617513795464978404150864349181039261974250238738010399863010948123725 : Rat) / 7891052248321580782162824538678676566388099662544029262571799840312558184064) [(8, 1), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1747 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1747 : Poly :=
[
  term ((-1083550856617513795464978404150864349181039261974250238738010399863010948123725 : Rat) / 7891052248321580782162824538678676566388099662544029262571799840312558184064) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((1083550856617513795464978404150864349181039261974250238738010399863010948123725 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032) [(8, 1), (9, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1747 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1747_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1747
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1747 := by
  native_decide

/-- Coefficient term 1748 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1748 : Poly :=
[
  term ((9932839056473304510659149 : Rat) / 2525448310030605822912210) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1748 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1748 : Poly :=
[
  term ((-9932839056473304510659149 : Rat) / 2525448310030605822912210) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((9932839056473304510659149 : Rat) / 1262724155015302911456105) [(8, 1), (9, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1748 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1748_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1748
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1748 := by
  native_decide

/-- Coefficient term 1749 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1749 : Poly :=
[
  term ((13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(8, 1), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 1749 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1749 : Poly :=
[
  term ((13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(8, 1), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1749 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1749_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1749
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1749 := by
  native_decide

/-- Coefficient term 1750 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1750 : Poly :=
[
  term ((1181521755256816431310 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1750 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1750 : Poly :=
[
  term ((2363043510513632862620 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1181521755256816431310 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1750 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1750_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1750
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1750 := by
  native_decide

/-- Coefficient term 1751 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1751 : Poly :=
[
  term ((105522101596865258251943 : Rat) / 5207109917588877985386) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1751 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1751 : Poly :=
[
  term ((105522101596865258251943 : Rat) / 2603554958794438992693) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-105522101596865258251943 : Rat) / 5207109917588877985386) [(8, 1), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1751 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1751_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1751
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1751 := by
  native_decide

/-- Coefficient term 1752 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1752 : Poly :=
[
  term ((-633613831111614260776214942063585846815223207080464498764861027 : Rat) / 4379510409716482221435474313032992674221117289770026173865160) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

/-- Partial product 1752 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1752 : Poly :=
[
  term ((-633613831111614260776214942063585846815223207080464498764861027 : Rat) / 2189755204858241110717737156516496337110558644885013086932580) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((633613831111614260776214942063585846815223207080464498764861027 : Rat) / 4379510409716482221435474313032992674221117289770026173865160) [(8, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1752 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1752_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1752
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1752 := by
  native_decide

/-- Coefficient term 1753 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1753 : Poly :=
[
  term ((-9069787030646365156066 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1753 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1753 : Poly :=
[
  term ((-18139574061292730312132 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1753 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1753_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1753
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1753 := by
  native_decide

/-- Coefficient term 1754 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1754 : Poly :=
[
  term ((11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (9, 1), (13, 3)]
]

/-- Partial product 1754 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1754 : Poly :=
[
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (9, 1), (13, 3)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (9, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1754 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1754_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1754
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1754 := by
  native_decide

/-- Coefficient term 1755 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1755 : Poly :=
[
  term ((66737996495403695875703665735579155390817025655881610658139694351832367333634941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 1755 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1755 : Poly :=
[
  term ((-66737996495403695875703665735579155390817025655881610658139694351832367333634941 : Rat) / 65291999922660140990661870225871163731736829160720992722402222047781131008000) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((66737996495403695875703665735579155390817025655881610658139694351832367333634941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1755 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1755_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1755
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1755 := by
  native_decide

/-- Coefficient term 1756 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1756 : Poly :=
[
  term ((590044534898727434698 : Rat) / 32049107564750198685) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1756 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1756 : Poly :=
[
  term ((-590044534898727434698 : Rat) / 32049107564750198685) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1180089069797454869396 : Rat) / 32049107564750198685) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1756 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1756_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1756
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1756 := by
  native_decide

/-- Coefficient term 1757 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1757 : Poly :=
[
  term ((40990511978382916813404962799077228629145267623216095622174862124790033051821170359 : Rat) / 54157537535849164947054332623352601276684641894512706096808563114566188800102400) [(8, 1), (9, 1), (15, 1)]
]

/-- Partial product 1757 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1757 : Poly :=
[
  term ((40990511978382916813404962799077228629145267623216095622174862124790033051821170359 : Rat) / 27078768767924582473527166311676300638342320947256353048404281557283094400051200) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-40990511978382916813404962799077228629145267623216095622174862124790033051821170359 : Rat) / 54157537535849164947054332623352601276684641894512706096808563114566188800102400) [(8, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1757 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1757_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1757
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1757 := by
  native_decide

/-- Coefficient term 1758 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1758 : Poly :=
[
  term ((2819026370183755893290021 : Rat) / 265836664213747981359180) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1758 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1758 : Poly :=
[
  term ((2819026370183755893290021 : Rat) / 132918332106873990679590) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2819026370183755893290021 : Rat) / 265836664213747981359180) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1758 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1758_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1758
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1758 := by
  native_decide

/-- Coefficient term 1759 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1759 : Poly :=
[
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(8, 1), (9, 1), (15, 3)]
]

/-- Partial product 1759 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1759 : Poly :=
[
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(8, 1), (9, 1), (14, 1), (15, 3)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(8, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1759 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1759_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1759
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1759 := by
  native_decide

/-- Coefficient term 1760 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1760 : Poly :=
[
  term ((-2020095442437435 : Rat) / 7342292683791569) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 1760 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1760 : Poly :=
[
  term ((-4040190884874870 : Rat) / 7342292683791569) [(8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((2020095442437435 : Rat) / 7342292683791569) [(8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1760 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1760_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1760
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1760 := by
  native_decide

/-- Coefficient term 1761 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1761 : Poly :=
[
  term ((-377225670968809271875378533150175733801906880785526620448898218045592654189469203 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 2)]
]

/-- Partial product 1761 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1761 : Poly :=
[
  term ((377225670968809271875378533150175733801906880785526620448898218045592654189469203 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 2)],
  term ((-377225670968809271875378533150175733801906880785526620448898218045592654189469203 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1761 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1761_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1761
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1761 := by
  native_decide

/-- Coefficient term 1762 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1762 : Poly :=
[
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (10, 1)]
]

/-- Partial product 1762 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1762 : Poly :=
[
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (10, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1762 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1762_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1762
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1762 := by
  native_decide

/-- Coefficient term 1763 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1763 : Poly :=
[
  term ((23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (12, 1)]
]

/-- Partial product 1763 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1763 : Poly :=
[
  term ((-23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((47622713320727805942769070883885620007104 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1763 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1763_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1763
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1763 := by
  native_decide

/-- Coefficient term 1764 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1764 : Poly :=
[
  term ((-729191877409704439296 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (12, 1), (16, 1)]
]

/-- Partial product 1764 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1764 : Poly :=
[
  term ((-1458383754819408878592 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((729191877409704439296 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1764 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1764_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1764
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1764 := by
  native_decide

/-- Coefficient term 1765 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1765 : Poly :=
[
  term ((-11905678330181951485692267720971405001776 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (14, 1)]
]

/-- Partial product 1765 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1765 : Poly :=
[
  term ((11905678330181951485692267720971405001776 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((-23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1765 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1765_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1765
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1765 := by
  native_decide

/-- Coefficient term 1766 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1766 : Poly :=
[
  term ((364595938704852219648 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (14, 1), (16, 1)]
]

/-- Partial product 1766 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1766 : Poly :=
[
  term ((-364595938704852219648 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((729191877409704439296 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1766 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1766_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1766
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1766 := by
  native_decide

/-- Coefficient term 1767 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1767 : Poly :=
[
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 1767 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1767 : Poly :=
[
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1767 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1767_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1767
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1767 := by
  native_decide

/-- Coefficient term 1768 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1768 : Poly :=
[
  term ((-491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (13, 1)]
]

/-- Partial product 1768 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1768 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1768 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1768_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1768
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1768 := by
  native_decide

/-- Coefficient term 1769 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1769 : Poly :=
[
  term ((1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1769 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1769 : Poly :=
[
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1769 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1769_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1769
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1769 := by
  native_decide

/-- Coefficient term 1770 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1770 : Poly :=
[
  term ((245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (15, 1)]
]

/-- Partial product 1770 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1770 : Poly :=
[
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1770 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1770_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1770
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1770 := by
  native_decide

/-- Coefficient term 1771 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1771 : Poly :=
[
  term ((-835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1771 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1771 : Poly :=
[
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1771 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1771_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1771
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1771 := by
  native_decide

/-- Coefficient term 1772 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1772 : Poly :=
[
  term ((340654265271608540022544997069815933117666624846984703824282984248272907185672107 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 2), (12, 1)]
]

/-- Partial product 1772 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1772 : Poly :=
[
  term ((-340654265271608540022544997069815933117666624846984703824282984248272907185672107 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 2), (12, 1)],
  term ((340654265271608540022544997069815933117666624846984703824282984248272907185672107 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (9, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1772 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1772_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1772
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1772 := by
  native_decide

/-- Coefficient term 1773 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1773 : Poly :=
[
  term ((-3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(8, 1), (9, 2), (12, 1), (14, 1)]
]

/-- Partial product 1773 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1773 : Poly :=
[
  term ((3420361448116722150096179819804782194600709 : Rat) / 39567174975647948168212868176365799285500) [(8, 1), (9, 2), (12, 1), (14, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 2), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1773 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1773_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1773
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1773 := by
  native_decide

/-- Coefficient term 1774 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1774 : Poly :=
[
  term ((2909559106310879266212 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1774 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1774 : Poly :=
[
  term ((-2909559106310879266212 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1774 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1774_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1774
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1774 := by
  native_decide

/-- Coefficient term 1775 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1775 : Poly :=
[
  term ((34469277722051283286931363 : Rat) / 3788172465045908734368315) [(8, 1), (9, 2), (12, 1), (16, 1)]
]

/-- Partial product 1775 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1775 : Poly :=
[
  term ((68938555444102566573862726 : Rat) / 3788172465045908734368315) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-34469277722051283286931363 : Rat) / 3788172465045908734368315) [(8, 1), (9, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1775 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1775_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1775
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1775 := by
  native_decide

/-- Coefficient term 1776 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1776 : Poly :=
[
  term ((3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 2), (12, 2)]
]

/-- Partial product 1776 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1776 : Poly :=
[
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 2), (12, 2)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1776 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1776_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1776
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1776 := by
  native_decide

/-- Coefficient term 1777 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1777 : Poly :=
[
  term ((-5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 2), (16, 1)]
]

/-- Partial product 1777 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1777 : Poly :=
[
  term ((-11638236425243517064848 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 2), (14, 1), (16, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1777 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1777_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1777
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1777 := by
  native_decide

/-- Coefficient term 1778 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1778 : Poly :=
[
  term ((1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(8, 1), (9, 2), (13, 1), (15, 1)]
]

/-- Partial product 1778 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1778 : Poly :=
[
  term ((1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(8, 1), (9, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1778 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1778_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1778
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1778 := by
  native_decide

/-- Coefficient term 1779 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1779 : Poly :=
[
  term ((-2030034702091448434266 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1779 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1779 : Poly :=
[
  term ((-4060069404182896868532 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2030034702091448434266 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1779 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1779_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1779
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1779 := by
  native_decide

/-- Coefficient term 1780 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1780 : Poly :=
[
  term ((-22683215581741558190435964366388456074863310853923606685533568974237738670052641 : Rat) / 77872226134752441929238400052750097694619404564579236143800656318873929448000) [(8, 1), (9, 2), (14, 1)]
]

/-- Partial product 1780 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1780 : Poly :=
[
  term ((22683215581741558190435964366388456074863310853923606685533568974237738670052641 : Rat) / 77872226134752441929238400052750097694619404564579236143800656318873929448000) [(8, 1), (9, 2), (14, 1)],
  term ((-22683215581741558190435964366388456074863310853923606685533568974237738670052641 : Rat) / 38936113067376220964619200026375048847309702282289618071900328159436964724000) [(8, 1), (9, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1780 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1780_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1780
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1780 := by
  native_decide

/-- Coefficient term 1781 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1781 : Poly :=
[
  term ((-1625346663098031549959621 : Rat) / 398754996320621972038770) [(8, 1), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 1781 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1781 : Poly :=
[
  term ((1625346663098031549959621 : Rat) / 398754996320621972038770) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-1625346663098031549959621 : Rat) / 199377498160310986019385) [(8, 1), (9, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1781 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1781_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1781
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1781 := by
  native_decide

/-- Coefficient term 1782 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1782 : Poly :=
[
  term ((-1590951797086655533840394629941114494318483 : Rat) / 52756233300863930890950490901821065714000) [(8, 1), (9, 2), (15, 2)]
]

/-- Partial product 1782 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1782 : Poly :=
[
  term ((-1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(8, 1), (9, 2), (14, 1), (15, 2)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 52756233300863930890950490901821065714000) [(8, 1), (9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1782 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1782_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1782
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1782 := by
  native_decide

/-- Coefficient term 1783 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1783 : Poly :=
[
  term ((1015017351045724217133 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 1783 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1783 : Poly :=
[
  term ((2030034702091448434266 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1015017351045724217133 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1783 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1783_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1783
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1783 := by
  native_decide

/-- Coefficient term 1784 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1784 : Poly :=
[
  term ((-33016698167923061284988111 : Rat) / 7576344930091817468736630) [(8, 1), (9, 2), (16, 1)]
]

/-- Partial product 1784 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1784 : Poly :=
[
  term ((-33016698167923061284988111 : Rat) / 3788172465045908734368315) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term ((33016698167923061284988111 : Rat) / 7576344930091817468736630) [(8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1784 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1784_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1784
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1784 := by
  native_decide

/-- Coefficient term 1785 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1785 : Poly :=
[
  term ((-1040778009776845127700932953298107300352427410376666575513493874838076059363 : Rat) / 8291047609226684570242777171539195394506264020409014948876472640988080128) [(8, 1), (10, 1)]
]

/-- Partial product 1785 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1785 : Poly :=
[
  term ((1040778009776845127700932953298107300352427410376666575513493874838076059363 : Rat) / 8291047609226684570242777171539195394506264020409014948876472640988080128) [(8, 1), (10, 1)],
  term ((-1040778009776845127700932953298107300352427410376666575513493874838076059363 : Rat) / 4145523804613342285121388585769597697253132010204507474438236320494040064) [(8, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1785 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1785_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1785
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1785 := by
  native_decide

/-- Coefficient term 1786 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1786 : Poly :=
[
  term ((1762903585519038541124540067440400216788356 : Rat) / 29675381231735961126159651132274349464125) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1786 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1786 : Poly :=
[
  term ((-1762903585519038541124540067440400216788356 : Rat) / 29675381231735961126159651132274349464125) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((3525807171038077082249080134880800433576712 : Rat) / 29675381231735961126159651132274349464125) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1786 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1786_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1786
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1786 := by
  native_decide

/-- Coefficient term 1787 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1787 : Poly :=
[
  term ((60114870338732700670624 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1787 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1787 : Poly :=
[
  term ((120229740677465401341248 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-60114870338732700670624 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1787 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1787_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1787
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1787 := by
  native_decide

/-- Coefficient term 1788 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1788 : Poly :=
[
  term ((-3168238278468482721219940516302307023359800013870809090039084522048047316 : Rat) / 12009733752953758223002833825893034550285400373570148407992259518830575) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1788 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1788 : Poly :=
[
  term ((-6336476556936965442439881032604614046719600027741618180078169044096094632 : Rat) / 12009733752953758223002833825893034550285400373570148407992259518830575) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((3168238278468482721219940516302307023359800013870809090039084522048047316 : Rat) / 12009733752953758223002833825893034550285400373570148407992259518830575) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1788 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1788_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1788
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1788 := by
  native_decide

/-- Coefficient term 1789 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1789 : Poly :=
[
  term ((-1027342569324748521920 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1789 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1789 : Poly :=
[
  term ((-2054685138649497043840 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1027342569324748521920 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1789 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1789_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1789
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1789 := by
  native_decide

/-- Coefficient term 1790 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1790 : Poly :=
[
  term ((20524551962202220324032351093573156823283613916004167097941311659 : Rat) / 49391145176246993941744515863649861825938156101295295183034860) [(8, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 1790 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1790 : Poly :=
[
  term ((-20524551962202220324032351093573156823283613916004167097941311659 : Rat) / 49391145176246993941744515863649861825938156101295295183034860) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((20524551962202220324032351093573156823283613916004167097941311659 : Rat) / 24695572588123496970872257931824930912969078050647647591517430) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1790 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1790_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1790
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1790 := by
  native_decide

/-- Coefficient term 1791 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1791 : Poly :=
[
  term ((7862101357719442084185676390312447948775302 : Rat) / 29675381231735961126159651132274349464125) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1791 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1791 : Poly :=
[
  term ((-7862101357719442084185676390312447948775302 : Rat) / 29675381231735961126159651132274349464125) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((15724202715438884168371352780624895897550604 : Rat) / 29675381231735961126159651132274349464125) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1791 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1791_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1791
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1791 := by
  native_decide

/-- Coefficient term 1792 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1792 : Poly :=
[
  term ((-21476971049739633721232 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1792 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1792 : Poly :=
[
  term ((21476971049739633721232 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-42953942099479267442464 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1792 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1792_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1792
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1792 := by
  native_decide

/-- Coefficient term 1793 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1793 : Poly :=
[
  term ((-4273132598961733515444 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1793 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1793 : Poly :=
[
  term ((-8546265197923467030888 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((4273132598961733515444 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1793 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1793_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1793
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1793 := by
  native_decide

/-- Coefficient term 1794 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1794 : Poly :=
[
  term ((-5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1794 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1794 : Poly :=
[
  term ((5284460321537091187395739702458132124184236660907251392412871270 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1794 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1794_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1794
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1794 := by
  native_decide

/-- Coefficient term 1795 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1795 : Poly :=
[
  term ((1926038409869376 : Rat) / 7342292683791569) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1795 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1795 : Poly :=
[
  term ((-1926038409869376 : Rat) / 7342292683791569) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1795 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1795_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1795
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1795 := by
  native_decide

/-- Coefficient term 1796 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1796 : Poly :=
[
  term ((793003258579722463115048203603452977173482879295881633059210831046435021479 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 1796 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1796 : Poly :=
[
  term ((793003258579722463115048203603452977173482879295881633059210831046435021479 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-793003258579722463115048203603452977173482879295881633059210831046435021479 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(8, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1796 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1796_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1796
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1796 := by
  native_decide

/-- Coefficient term 1797 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1797 : Poly :=
[
  term ((-10270294368956876160012 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1797 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1797 : Poly :=
[
  term ((-20540588737913752320024 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((10270294368956876160012 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1797 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1797_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1797
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1797 := by
  native_decide

/-- Coefficient term 1798 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1798 : Poly :=
[
  term ((-32820990624515682959095597448726571559968022416943071613654707626 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (10, 1), (11, 2)]
]

/-- Partial product 1798 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1798 : Poly :=
[
  term ((32820990624515682959095597448726571559968022416943071613654707626 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (10, 1), (11, 2)],
  term ((-65641981249031365918191194897453143119936044833886143227309415252 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (10, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1798 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1798_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1798
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1798 := by
  native_decide

/-- Coefficient term 1799 from coefficient polynomial 28. -/
def rs_R009_ueqv_R009NYNYN_coefficient_28_1799 : Poly :=
[
  term ((123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (12, 1)]
]

/-- Partial product 1799 for generator 28. -/
def rs_R009_ueqv_R009NYNYN_partial_28_1799 : Poly :=
[
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1799 for generator 28. -/
theorem rs_R009_ueqv_R009NYNYN_partial_28_1799_valid :
    mulPoly rs_R009_ueqv_R009NYNYN_coefficient_28_1799
        rs_R009_ueqv_R009NYNYN_generator_28_1700_1799 =
      rs_R009_ueqv_R009NYNYN_partial_28_1799 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_partials_28_1700_1799 : List Poly :=
[
  rs_R009_ueqv_R009NYNYN_partial_28_1700,
  rs_R009_ueqv_R009NYNYN_partial_28_1701,
  rs_R009_ueqv_R009NYNYN_partial_28_1702,
  rs_R009_ueqv_R009NYNYN_partial_28_1703,
  rs_R009_ueqv_R009NYNYN_partial_28_1704,
  rs_R009_ueqv_R009NYNYN_partial_28_1705,
  rs_R009_ueqv_R009NYNYN_partial_28_1706,
  rs_R009_ueqv_R009NYNYN_partial_28_1707,
  rs_R009_ueqv_R009NYNYN_partial_28_1708,
  rs_R009_ueqv_R009NYNYN_partial_28_1709,
  rs_R009_ueqv_R009NYNYN_partial_28_1710,
  rs_R009_ueqv_R009NYNYN_partial_28_1711,
  rs_R009_ueqv_R009NYNYN_partial_28_1712,
  rs_R009_ueqv_R009NYNYN_partial_28_1713,
  rs_R009_ueqv_R009NYNYN_partial_28_1714,
  rs_R009_ueqv_R009NYNYN_partial_28_1715,
  rs_R009_ueqv_R009NYNYN_partial_28_1716,
  rs_R009_ueqv_R009NYNYN_partial_28_1717,
  rs_R009_ueqv_R009NYNYN_partial_28_1718,
  rs_R009_ueqv_R009NYNYN_partial_28_1719,
  rs_R009_ueqv_R009NYNYN_partial_28_1720,
  rs_R009_ueqv_R009NYNYN_partial_28_1721,
  rs_R009_ueqv_R009NYNYN_partial_28_1722,
  rs_R009_ueqv_R009NYNYN_partial_28_1723,
  rs_R009_ueqv_R009NYNYN_partial_28_1724,
  rs_R009_ueqv_R009NYNYN_partial_28_1725,
  rs_R009_ueqv_R009NYNYN_partial_28_1726,
  rs_R009_ueqv_R009NYNYN_partial_28_1727,
  rs_R009_ueqv_R009NYNYN_partial_28_1728,
  rs_R009_ueqv_R009NYNYN_partial_28_1729,
  rs_R009_ueqv_R009NYNYN_partial_28_1730,
  rs_R009_ueqv_R009NYNYN_partial_28_1731,
  rs_R009_ueqv_R009NYNYN_partial_28_1732,
  rs_R009_ueqv_R009NYNYN_partial_28_1733,
  rs_R009_ueqv_R009NYNYN_partial_28_1734,
  rs_R009_ueqv_R009NYNYN_partial_28_1735,
  rs_R009_ueqv_R009NYNYN_partial_28_1736,
  rs_R009_ueqv_R009NYNYN_partial_28_1737,
  rs_R009_ueqv_R009NYNYN_partial_28_1738,
  rs_R009_ueqv_R009NYNYN_partial_28_1739,
  rs_R009_ueqv_R009NYNYN_partial_28_1740,
  rs_R009_ueqv_R009NYNYN_partial_28_1741,
  rs_R009_ueqv_R009NYNYN_partial_28_1742,
  rs_R009_ueqv_R009NYNYN_partial_28_1743,
  rs_R009_ueqv_R009NYNYN_partial_28_1744,
  rs_R009_ueqv_R009NYNYN_partial_28_1745,
  rs_R009_ueqv_R009NYNYN_partial_28_1746,
  rs_R009_ueqv_R009NYNYN_partial_28_1747,
  rs_R009_ueqv_R009NYNYN_partial_28_1748,
  rs_R009_ueqv_R009NYNYN_partial_28_1749,
  rs_R009_ueqv_R009NYNYN_partial_28_1750,
  rs_R009_ueqv_R009NYNYN_partial_28_1751,
  rs_R009_ueqv_R009NYNYN_partial_28_1752,
  rs_R009_ueqv_R009NYNYN_partial_28_1753,
  rs_R009_ueqv_R009NYNYN_partial_28_1754,
  rs_R009_ueqv_R009NYNYN_partial_28_1755,
  rs_R009_ueqv_R009NYNYN_partial_28_1756,
  rs_R009_ueqv_R009NYNYN_partial_28_1757,
  rs_R009_ueqv_R009NYNYN_partial_28_1758,
  rs_R009_ueqv_R009NYNYN_partial_28_1759,
  rs_R009_ueqv_R009NYNYN_partial_28_1760,
  rs_R009_ueqv_R009NYNYN_partial_28_1761,
  rs_R009_ueqv_R009NYNYN_partial_28_1762,
  rs_R009_ueqv_R009NYNYN_partial_28_1763,
  rs_R009_ueqv_R009NYNYN_partial_28_1764,
  rs_R009_ueqv_R009NYNYN_partial_28_1765,
  rs_R009_ueqv_R009NYNYN_partial_28_1766,
  rs_R009_ueqv_R009NYNYN_partial_28_1767,
  rs_R009_ueqv_R009NYNYN_partial_28_1768,
  rs_R009_ueqv_R009NYNYN_partial_28_1769,
  rs_R009_ueqv_R009NYNYN_partial_28_1770,
  rs_R009_ueqv_R009NYNYN_partial_28_1771,
  rs_R009_ueqv_R009NYNYN_partial_28_1772,
  rs_R009_ueqv_R009NYNYN_partial_28_1773,
  rs_R009_ueqv_R009NYNYN_partial_28_1774,
  rs_R009_ueqv_R009NYNYN_partial_28_1775,
  rs_R009_ueqv_R009NYNYN_partial_28_1776,
  rs_R009_ueqv_R009NYNYN_partial_28_1777,
  rs_R009_ueqv_R009NYNYN_partial_28_1778,
  rs_R009_ueqv_R009NYNYN_partial_28_1779,
  rs_R009_ueqv_R009NYNYN_partial_28_1780,
  rs_R009_ueqv_R009NYNYN_partial_28_1781,
  rs_R009_ueqv_R009NYNYN_partial_28_1782,
  rs_R009_ueqv_R009NYNYN_partial_28_1783,
  rs_R009_ueqv_R009NYNYN_partial_28_1784,
  rs_R009_ueqv_R009NYNYN_partial_28_1785,
  rs_R009_ueqv_R009NYNYN_partial_28_1786,
  rs_R009_ueqv_R009NYNYN_partial_28_1787,
  rs_R009_ueqv_R009NYNYN_partial_28_1788,
  rs_R009_ueqv_R009NYNYN_partial_28_1789,
  rs_R009_ueqv_R009NYNYN_partial_28_1790,
  rs_R009_ueqv_R009NYNYN_partial_28_1791,
  rs_R009_ueqv_R009NYNYN_partial_28_1792,
  rs_R009_ueqv_R009NYNYN_partial_28_1793,
  rs_R009_ueqv_R009NYNYN_partial_28_1794,
  rs_R009_ueqv_R009NYNYN_partial_28_1795,
  rs_R009_ueqv_R009NYNYN_partial_28_1796,
  rs_R009_ueqv_R009NYNYN_partial_28_1797,
  rs_R009_ueqv_R009NYNYN_partial_28_1798,
  rs_R009_ueqv_R009NYNYN_partial_28_1799
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NYNYN_block_28_1700_1799 : Poly :=
[
  term ((14803961136271849896248 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5528973344396980660608 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-6019737232036679782972 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-410303932469182592695967643323749686315911 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((410303932469182592695967643323749686315911 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-593077610396904581136 : Rat) / 228382013929336753745) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((296538805198452290568 : Rat) / 228382013929336753745) [(8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((22355052090721524353140120054370173256011092478223438711788397358995420506 : Rat) / 756613226436086768049178531031261176667980223534919349703512349686326225) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-694390051091767705824 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11177526045360762176570060027185086628005546239111719355894198679497710253 : Rat) / 756613226436086768049178531031261176667980223534919349703512349686326225) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((347195025545883852912 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((85844834952922060018000209405893353954049948950660636036139685803 : Rat) / 666780459879334418213550964159273134650165107367486484970970610) [(8, 1), (9, 1), (10, 1), (13, 1)],
  term ((-8774221830348744454510814146827636162129907373056420761934090152959 : Rat) / 33339022993966720910677548207963656732508255368374324248548530500) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-16275906874138721227396 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((25020428943412886053195920952624806226261 : Rat) / 2198176387535997120456270454242544404750) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 2)],
  term ((4553071274066424573432 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((4723149981519542183624 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-911936135067961115986817674055277898074752695521250575493330141054044613291 : Rat) / 8827154308421012293907082862031380394459769274574059079874310746340472625) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((4348786653430898015952 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(8, 1), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((1048024765596157001451119910511446571430211053367616866665748020663554412041 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-2743532861735824942536 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-669043596300515029264577155797579870215048863836904589950572762287 : Rat) / 14817343552874098182523354759094958547781446830388588554910458000) [(8, 1), (9, 1), (11, 1)],
  term ((-90038421077045634735932718006903567379153235560252914582507410243054961515081983 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 1), (11, 1), (12, 1)],
  term ((208766728256428658385564371238999287961204556704541576376513506628034408441197443 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((7543871880101658080567102 : Rat) / 757634493009181746873663) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2540054968939562810217242357797077447494297 : Rat) / 3956717497564794816821286817636579928550) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-24969082606599944785624 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (12, 1), (14, 2), (16, 1)],
  term ((-1915739631623386750279331 : Rat) / 541167495006558390624045) [(8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-2540054968939562810217242357797077447494297 : Rat) / 3956717497564794816821286817636579928550) [(8, 1), (9, 1), (11, 1), (12, 2)],
  term ((2540054968939562810217242357797077447494297 : Rat) / 1978358748782397408410643408818289964275) [(8, 1), (9, 1), (11, 1), (12, 2), (14, 1)],
  term ((49938165213199889571248 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-24969082606599944785624 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 12711102204126257703226199321325187768022067755386645075019007474730280580) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((45581586383170450324748 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2944089232778871913859584563672313342275460553713481436936343014265025541151 : Rat) / 25422204408252515406452398642650375536044135510773290150038014949460561160) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-22790793191585225162374 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8050136065673918892198514407607103307069732037084330910142668288 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (9, 1), (11, 1), (13, 2)],
  term ((16100272131347837784397028815214206614139464074168661820285336576 : Rat) / 47627175705666744158110783154233795332154650526249034640783615) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1)],
  term ((44791835683890199076096 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-22395917841945099538048 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((69656193749924011764591324281012399303568338302570165289174192262907184787133501 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(8, 1), (9, 1), (11, 1), (14, 1)],
  term ((-158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 2942384769473670764635694287343793464819923091524686359958103582113490875) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-8464092555485140631592 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((57092766368671244937551207 : Rat) / 7576344930091817468736630) [(8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-353979882721643491508977442306590916848070403326047186950058078695765865810111171 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 1), (11, 1), (14, 2)],
  term ((-7235663910991024377426967 : Rat) / 757634493009181746873663) [(8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((158416126605816423765117048513417392655929536054342399591846860634474238479 : Rat) / 5884769538947341529271388574687586929639846183049372719916207164226981750) [(8, 1), (9, 1), (11, 1), (15, 2)],
  term ((4232046277742570315796 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-5989245937490298697141 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1606184556847589865954940371247984838012536 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (11, 2), (13, 1)],
  term ((3212369113695179731909880742495969676025072 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1)],
  term ((-21023001604841859632896 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((10511500802420929816448 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1)],
  term ((1262941034647941618176 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((61951097216692121134552589574386821247456 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-631470517323970809088 : Rat) / 619894037808199760165) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-284897135238194868467623846652879900955510491285995151461427363218858201194395239 : Rat) / 211367470937185199522218514428893122313966955246715069533173210008372094216000) [(8, 1), (9, 1), (12, 1), (13, 1)],
  term ((48742961912274734801408571602024428931625279328341734265009171129314233753466579 : Rat) / 21136747093718519952221851442889312231396695524671506953317321000837209421600) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((79880402918845379871305066 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1595001198689311755240899196532561547096573 : Rat) / 2046578015981790422493769043605127549250) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2)],
  term ((7896216864527865891112 : Rat) / 2603554958794438992693) [(8, 1), (9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-42812450343894701153544523 : Rat) / 3788172465045908734368315) [(8, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-173078443888362431706014048271600160858063353289065874823766628264966584507001865989 : Rat) / 30624798011343277797441438090586292388601434404635161185695318427879690095296000) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-7615200478248933130591138 : Rat) / 84181610334353527430407) [(8, 1), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-15181160365917164997799805456570156535415502015357682364181057413703 : Rat) / 28792461994558736650171102255365764375385376406398346851239128772) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-22846657688183736 : Rat) / 7342292683791569) [(8, 1), (9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((1268064590144297155386789662536624144696760850947699761622939693120316012447847325923 : Rat) / 428747172158805889164180133268208093440420081664892256599734457990315661334144000) [(8, 1), (9, 1), (12, 1), (15, 1)],
  term ((3873086202357543078523571 : Rat) / 84181610334353527430407) [(8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((944670600904739502583305361878242786457019 : Rat) / 2374030498538876890092772090581947957130) [(8, 1), (9, 1), (12, 2), (13, 1)],
  term ((-944670600904739502583305361878242786457019 : Rat) / 1187015249269438445046386045290973978565) [(8, 1), (9, 1), (12, 2), (13, 1), (14, 1)],
  term ((-155991903508624890085744 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((77995951754312445042872 : Rat) / 13017774793972194963465) [(8, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((11882963797271563319952709638379049864823253986764102273047409551832112504521 : Rat) / 17654308616842024587814165724062760788919538549148118159748621492680945250) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1)],
  term ((39842810064747332643744 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-11882963797271563319952709638379049864823253986764102273047409551832112504521 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(8, 1), (9, 1), (12, 2), (15, 1)],
  term ((-19921405032373666321872 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((3500762755331813287695530724027490829539025507155036212649581586992127852037798279 : Rat) / 26520443638689024072011142264012871759201242164838696284519657195277257402112000) [(8, 1), (9, 1), (13, 1)],
  term ((-516192776895840637567257960107257499381794873895841301541305109115907186191833608063 : Rat) / 1286241516476417667492540399804624280321260244994676769799203373970946984002432000) [(8, 1), (9, 1), (13, 1), (14, 1)],
  term ((13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 211851703402104295053769988688753129467034462589777417916983457912171343000) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2)],
  term ((2363043510513632862620 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((92423599492485995993725561 : Rat) / 2525448310030605822912210) [(8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((1083550856617513795464978404150864349181039261974250238738010399863010948123725 : Rat) / 3945526124160790391081412269339338283194049831272014631285899920156279092032) [(8, 1), (9, 1), (13, 1), (14, 2)],
  term ((9932839056473304510659149 : Rat) / 1262724155015302911456105) [(8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-13491703584650154887922802983357889907108686758768879311453831118674585016167 : Rat) / 423703406804208590107539977377506258934068925179554835833966915824342686000) [(8, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1181521755256816431310 : Rat) / 867851652931479664231) [(8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-105522101596865258251943 : Rat) / 5207109917588877985386) [(8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-633613831111614260776214942063585846815223207080464498764861027 : Rat) / 2189755204858241110717737156516496337110558644885013086932580) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-18139574061292730312132 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((633613831111614260776214942063585846815223207080464498764861027 : Rat) / 4379510409716482221435474313032992674221117289770026173865160) [(8, 1), (9, 1), (13, 2), (15, 1)],
  term ((9069787030646365156066 : Rat) / 4339258264657398321155) [(8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11409944659465041427643585000036395946594193929344 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (9, 1), (13, 3)],
  term ((22819889318930082855287170000072791893188387858688 : Rat) / 4063562337142509348624007334568541033400269394457) [(8, 1), (9, 1), (13, 3), (14, 1)],
  term ((38282324286395199416856199663558378786600133769747303379665623717235686080286539 : Rat) / 77872226134752441929238400052750097694619404564579236143800656318873929448000) [(8, 1), (9, 1), (14, 1), (15, 1)],
  term ((159392143905900133908221 : Rat) / 56964999474374567434110) [(8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 115169847978234946600684409021463057501541505625593387404956515088) [(8, 1), (9, 1), (14, 1), (15, 3)],
  term ((-4040190884874870 : Rat) / 7342292683791569) [(8, 1), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((66737996495403695875703665735579155390817025655881610658139694351832367333634941 : Rat) / 32645999961330070495330935112935581865868414580360496361201111023890565504000) [(8, 1), (9, 1), (14, 2), (15, 1)],
  term ((1180089069797454869396 : Rat) / 32049107564750198685) [(8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-40990511978382916813404962799077228629145267623216095622174862124790033051821170359 : Rat) / 54157537535849164947054332623352601276684641894512706096808563114566188800102400) [(8, 1), (9, 1), (15, 1)],
  term ((-2819026370183755893290021 : Rat) / 265836664213747981359180) [(8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-8056222475513779312712310591046508646923021073308542694243920055029 : Rat) / 230339695956469893201368818042926115003083011251186774809913030176) [(8, 1), (9, 1), (15, 3)],
  term ((2020095442437435 : Rat) / 7342292683791569) [(8, 1), (9, 1), (15, 3), (16, 1)],
  term ((377225670968809271875378533150175733801906880785526620448898218045592654189469203 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 2)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (10, 1)],
  term ((-23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (12, 1)],
  term ((47622713320727805942769070883885620007104 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (12, 1), (14, 1)],
  term ((-1458383754819408878592 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (12, 1), (14, 1), (16, 1)],
  term ((729191877409704439296 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((598215911918769248904224168397764700574312 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (10, 1), (14, 1)],
  term ((-2035509498590190708864 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (14, 1), (16, 1)],
  term ((-23811356660363902971384535441942810003552 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (9, 2), (10, 1), (14, 2)],
  term ((729191877409704439296 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (14, 2), (16, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (10, 1), (16, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (13, 1)],
  term ((-982129613894263371065987517818044111116656 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1)],
  term ((3341827119770676978432 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (13, 1), (16, 1)],
  term ((491064806947131685532993758909022055558328 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1)],
  term ((-1670913559885338489216 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-245532403473565842766496879454511027779164 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (11, 1), (15, 1)],
  term ((835456779942669244608 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-340654265271608540022544997069815933117666624846984703824282984248272907185672107 : Rat) / 739786148280148198327764800501125928098884343363502743366106235029302329756000) [(8, 1), (9, 2), (12, 1)],
  term ((372629457119213314555146738506886608664953786350043878166447255965620510378932431 : Rat) / 369893074140074099163882400250562964049442171681751371683053117514651164878000) [(8, 1), (9, 2), (12, 1), (14, 1)],
  term ((13279702068858633794891930 : Rat) / 757634493009181746873663) [(8, 1), (9, 2), (12, 1), (14, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 2), (12, 1), (14, 2)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 1), (14, 2), (16, 1)],
  term ((-34469277722051283286931363 : Rat) / 3788172465045908734368315) [(8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-3420361448116722150096179819804782194600709 : Rat) / 19783587487823974084106434088182899642750) [(8, 1), (9, 2), (12, 2)],
  term ((3420361448116722150096179819804782194600709 : Rat) / 9891793743911987042053217044091449821375) [(8, 1), (9, 2), (12, 2), (14, 1)],
  term ((-11638236425243517064848 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 2), (14, 1), (16, 1)],
  term ((5819118212621758532424 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (12, 2), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 13189058325215982722737622725455266428500) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1)],
  term ((-4060069404182896868532 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(8, 1), (9, 2), (13, 1), (15, 1)],
  term ((2030034702091448434266 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-323470245884528938132473743338970802181410855346504713872658625580668273647938227 : Rat) / 1479572296560296396655529601002251856197768686727005486732212470058604659512000) [(8, 1), (9, 2), (14, 1)],
  term ((-1590951797086655533840394629941114494318483 : Rat) / 26378116650431965445475245450910532857000) [(8, 1), (9, 2), (14, 1), (15, 2)],
  term ((2030034702091448434266 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-5021687105283360445820489 : Rat) / 1082334990013116781248090) [(8, 1), (9, 2), (14, 1), (16, 1)],
  term ((-22683215581741558190435964366388456074863310853923606685533568974237738670052641 : Rat) / 38936113067376220964619200026375048847309702282289618071900328159436964724000) [(8, 1), (9, 2), (14, 2)],
  term ((-1625346663098031549959621 : Rat) / 199377498160310986019385) [(8, 1), (9, 2), (14, 2), (16, 1)],
  term ((1590951797086655533840394629941114494318483 : Rat) / 52756233300863930890950490901821065714000) [(8, 1), (9, 2), (15, 2)],
  term ((-1015017351045724217133 : Rat) / 4339258264657398321155) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((33016698167923061284988111 : Rat) / 7576344930091817468736630) [(8, 1), (9, 2), (16, 1)],
  term ((1040778009776845127700932953298107300352427410376666575513493874838076059363 : Rat) / 8291047609226684570242777171539195394506264020409014948876472640988080128) [(8, 1), (10, 1)],
  term ((-1762903585519038541124540067440400216788356 : Rat) / 29675381231735961126159651132274349464125) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((3525807171038077082249080134880800433576712 : Rat) / 29675381231735961126159651132274349464125) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((120229740677465401341248 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-60114870338732700670624 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6336476556936965442439881032604614046719600027741618180078169044096094632 : Rat) / 12009733752953758223002833825893034550285400373570148407992259518830575) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2054685138649497043840 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3168238278468482721219940516302307023359800013870809090039084522048047316 : Rat) / 12009733752953758223002833825893034550285400373570148407992259518830575) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((1027342569324748521920 : Rat) / 867851652931479664231) [(8, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-20524551962202220324032351093573156823283613916004167097941311659 : Rat) / 49391145176246993941744515863649861825938156101295295183034860) [(8, 1), (10, 1), (11, 1), (13, 1)],
  term ((9437705082877155526745027865641426095732853871410739952857359488037 : Rat) / 16669511496983360455338774103981828366254127684187162124274265250) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-4161824544030767371432 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((15724202715438884168371352780624895897550604 : Rat) / 29675381231735961126159651132274349464125) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2)],
  term ((-42953942099479267442464 : Rat) / 13017774793972194963465) [(8, 1), (10, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((4273132598961733515444 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((1337357780692506004972257149428127670595316310681346797748882349484474216479 : Rat) / 35308617233684049175628331448125521577839077098296236319497242985361890500) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-21678867807954504189144 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-10568920643074182374791479404916264248368473321814502784825742540 : Rat) / 342767404697127817263941693516259099706968766742837462514751533) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1)],
  term ((3852076819738752 : Rat) / 7342292683791569) [(8, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-793003258579722463115048203603452977173482879295881633059210831046435021479 : Rat) / 70617234467368098351256662896251043155678154196592472638994485970723781000) [(8, 1), (10, 1), (11, 1), (15, 1)],
  term ((10270294368956876160012 : Rat) / 4339258264657398321155) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((32820990624515682959095597448726571559968022416943071613654707626 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (10, 1), (11, 2)],
  term ((-123902194433384242269105179148773642494912 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (12, 1)],
  term ((247804388866768484538210358297547284989824 : Rat) / 1099088193767998560228135227121272202375) [(8, 1), (10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-65641981249031365918191194897453143119936044833886143227309415252 : Rat) / 308694657351543712135903224147811636412113475633095594893967875) [(8, 1), (10, 1), (11, 2), (14, 1)],
  term ((-1040778009776845127700932953298107300352427410376666575513493874838076059363 : Rat) / 4145523804613342285121388585769597697253132010204507474438236320494040064) [(8, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 1700 through 1799. -/
theorem rs_R009_ueqv_R009NYNYN_block_28_1700_1799_valid :
    checkProductSumEq rs_R009_ueqv_R009NYNYN_partials_28_1700_1799
      rs_R009_ueqv_R009NYNYN_block_28_1700_1799 = true := by
  native_decide

end R009UeqvR009NYNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
