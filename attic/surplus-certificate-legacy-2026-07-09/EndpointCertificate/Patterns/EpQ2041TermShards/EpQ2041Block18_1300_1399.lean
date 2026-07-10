/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:1300-1399

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_1300_1399 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1300 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1300 : Poly :=
[
  term ((-2785192368747946510975730554088611340963256523254382218993083680 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 1300 for generator 18. -/
def ep_Q2_041_partial_18_1300 : Poly :=
[
  term ((-5570384737495893021951461108177222681926513046508764437986167360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((2785192368747946510975730554088611340963256523254382218993083680 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1300 for generator 18. -/
theorem ep_Q2_041_partial_18_1300_valid :
    mulPoly ep_Q2_041_coefficient_18_1300
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1300 := by
  native_decide

/-- Coefficient term 1301 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1301 : Poly :=
[
  term ((-11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 2)]
]

/-- Partial product 1301 for generator 18. -/
def ep_Q2_041_partial_18_1301 : Poly :=
[
  term ((-22409412925411235207450758682335661246937968010566707242810240 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1301 for generator 18. -/
theorem ep_Q2_041_partial_18_1301_valid :
    mulPoly ep_Q2_041_coefficient_18_1301
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1301 := by
  native_decide

/-- Coefficient term 1302 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1302 : Poly :=
[
  term ((335007145773460687839751257249258632621467333236351349004302910 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1302 for generator 18. -/
def ep_Q2_041_partial_18_1302 : Poly :=
[
  term ((670014291546921375679502514498517265242934666472702698008605820 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-335007145773460687839751257249258632621467333236351349004302910 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1302 for generator 18. -/
theorem ep_Q2_041_partial_18_1302_valid :
    mulPoly ep_Q2_041_coefficient_18_1302
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1302 := by
  native_decide

/-- Coefficient term 1303 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1303 : Poly :=
[
  term ((1836704089131374543467689041125035650275623019271142509389158979082686065 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1303 for generator 18. -/
def ep_Q2_041_partial_18_1303 : Poly :=
[
  term ((3673408178262749086935378082250071300551246038542285018778317958165372130 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1836704089131374543467689041125035650275623019271142509389158979082686065 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1303 for generator 18. -/
theorem ep_Q2_041_partial_18_1303_valid :
    mulPoly ep_Q2_041_coefficient_18_1303
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1303 := by
  native_decide

/-- Coefficient term 1304 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1304 : Poly :=
[
  term ((14531338726464 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1304 for generator 18. -/
def ep_Q2_041_partial_18_1304 : Poly :=
[
  term ((29062677452928 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-14531338726464 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1304 for generator 18. -/
theorem ep_Q2_041_partial_18_1304_valid :
    mulPoly ep_Q2_041_coefficient_18_1304
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1304 := by
  native_decide

/-- Coefficient term 1305 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1305 : Poly :=
[
  term ((-325588077572684466561128332290392879768503643361160977317167600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 4)]
]

/-- Partial product 1305 for generator 18. -/
def ep_Q2_041_partial_18_1305 : Poly :=
[
  term ((-651176155145368933122256664580785759537007286722321954634335200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 4)],
  term ((325588077572684466561128332290392879768503643361160977317167600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1305 for generator 18. -/
theorem ep_Q2_041_partial_18_1305_valid :
    mulPoly ep_Q2_041_coefficient_18_1305
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1305 := by
  native_decide

/-- Coefficient term 1306 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1306 : Poly :=
[
  term ((-1956977953 : Rat) / 151763803) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 1306 for generator 18. -/
def ep_Q2_041_partial_18_1306 : Poly :=
[
  term ((-3913955906 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((1956977953 : Rat) / 151763803) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1306 for generator 18. -/
theorem ep_Q2_041_partial_18_1306_valid :
    mulPoly ep_Q2_041_coefficient_18_1306
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1306 := by
  native_decide

/-- Coefficient term 1307 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1307 : Poly :=
[
  term ((-3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 2), (15, 2)]
]

/-- Partial product 1307 for generator 18. -/
def ep_Q2_041_partial_18_1307 : Poly :=
[
  term ((-6508776853579481570974976693309967886537538467006704442843520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 2), (15, 2)],
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1307 for generator 18. -/
theorem ep_Q2_041_partial_18_1307_valid :
    mulPoly ep_Q2_041_coefficient_18_1307
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1307 := by
  native_decide

/-- Coefficient term 1308 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1308 : Poly :=
[
  term ((580755226861408969877268460618517764233158875255999164512599768909248501 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1308 for generator 18. -/
def ep_Q2_041_partial_18_1308 : Poly :=
[
  term ((1161510453722817939754536921237035528466317750511998329025199537818497002 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-580755226861408969877268460618517764233158875255999164512599768909248501 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1308 for generator 18. -/
theorem ep_Q2_041_partial_18_1308_valid :
    mulPoly ep_Q2_041_coefficient_18_1308
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1308 := by
  native_decide

/-- Coefficient term 1309 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1309 : Poly :=
[
  term ((-4028536824384 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1309 for generator 18. -/
def ep_Q2_041_partial_18_1309 : Poly :=
[
  term ((-8057073648768 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((4028536824384 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1309 for generator 18. -/
theorem ep_Q2_041_partial_18_1309_valid :
    mulPoly ep_Q2_041_coefficient_18_1309
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1309 := by
  native_decide

/-- Coefficient term 1310 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1310 : Poly :=
[
  term ((1802701613816271296921488139056348670634535378926774690614734400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1310 for generator 18. -/
def ep_Q2_041_partial_18_1310 : Poly :=
[
  term ((3605403227632542593842976278112697341269070757853549381229468800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1802701613816271296921488139056348670634535378926774690614734400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1310 for generator 18. -/
theorem ep_Q2_041_partial_18_1310_valid :
    mulPoly ep_Q2_041_coefficient_18_1310
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1310 := by
  native_decide

/-- Coefficient term 1311 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1311 : Poly :=
[
  term ((5405343938245020474200105664503120660780785349224340307228640 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1311 for generator 18. -/
def ep_Q2_041_partial_18_1311 : Poly :=
[
  term ((10810687876490040948400211329006241321561570698448680614457280 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5405343938245020474200105664503120660780785349224340307228640 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1311 for generator 18. -/
theorem ep_Q2_041_partial_18_1311_valid :
    mulPoly ep_Q2_041_coefficient_18_1311
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1311 := by
  native_decide

/-- Coefficient term 1312 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1312 : Poly :=
[
  term ((987330277001010478658339806642457606499308402770914613840074618993846047 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1312 for generator 18. -/
def ep_Q2_041_partial_18_1312 : Poly :=
[
  term ((987330277001010478658339806642457606499308402770914613840074618993846047 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-987330277001010478658339806642457606499308402770914613840074618993846047 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1312 for generator 18. -/
theorem ep_Q2_041_partial_18_1312_valid :
    mulPoly ep_Q2_041_coefficient_18_1312
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1312 := by
  native_decide

/-- Coefficient term 1313 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1313 : Poly :=
[
  term ((2319984443856 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1313 for generator 18. -/
def ep_Q2_041_partial_18_1313 : Poly :=
[
  term ((4639968887712 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2319984443856 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1313 for generator 18. -/
theorem ep_Q2_041_partial_18_1313_valid :
    mulPoly ep_Q2_041_coefficient_18_1313
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1313 := by
  native_decide

/-- Coefficient term 1314 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1314 : Poly :=
[
  term ((17861232932503550722964511480806357721615483373581912400094033100 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 1314 for generator 18. -/
def ep_Q2_041_partial_18_1314 : Poly :=
[
  term ((35722465865007101445929022961612715443230966747163824800188066200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((-17861232932503550722964511480806357721615483373581912400094033100 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1314 for generator 18. -/
theorem ep_Q2_041_partial_18_1314_valid :
    mulPoly ep_Q2_041_coefficient_18_1314
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1314 := by
  native_decide

/-- Coefficient term 1315 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1315 : Poly :=
[
  term ((22661855398977843480474235015661423173785295936433580380108072800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1315 for generator 18. -/
def ep_Q2_041_partial_18_1315 : Poly :=
[
  term ((45323710797955686960948470031322846347570591872867160760216145600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-22661855398977843480474235015661423173785295936433580380108072800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1315 for generator 18. -/
theorem ep_Q2_041_partial_18_1315_valid :
    mulPoly ep_Q2_041_coefficient_18_1315
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1315 := by
  native_decide

/-- Coefficient term 1316 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1316 : Poly :=
[
  term ((425590238651515511351277054543847140955399179048530385730699960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (13, 2), (15, 2)]
]

/-- Partial product 1316 for generator 18. -/
def ep_Q2_041_partial_18_1316 : Poly :=
[
  term ((851180477303031022702554109087694281910798358097060771461399920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((-425590238651515511351277054543847140955399179048530385730699960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1316 for generator 18. -/
theorem ep_Q2_041_partial_18_1316_valid :
    mulPoly ep_Q2_041_coefficient_18_1316
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1316 := by
  native_decide

/-- Coefficient term 1317 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1317 : Poly :=
[
  term ((11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 1)]
]

/-- Partial product 1317 for generator 18. -/
def ep_Q2_041_partial_18_1317 : Poly :=
[
  term ((22409412925411235207450758682335661246937968010566707242810240 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((-11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1317 for generator 18. -/
theorem ep_Q2_041_partial_18_1317_valid :
    mulPoly ep_Q2_041_coefficient_18_1317
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1317 := by
  native_decide

/-- Coefficient term 1318 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1318 : Poly :=
[
  term ((-2801176615676404400931344835291957655867246001320838405351280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (13, 3), (15, 1)]
]

/-- Partial product 1318 for generator 18. -/
def ep_Q2_041_partial_18_1318 : Poly :=
[
  term ((-5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 3), (15, 1)],
  term ((2801176615676404400931344835291957655867246001320838405351280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1318 for generator 18. -/
theorem ep_Q2_041_partial_18_1318_valid :
    mulPoly ep_Q2_041_coefficient_18_1318
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1318 := by
  native_decide

/-- Coefficient term 1319 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1319 : Poly :=
[
  term ((-47139427647628251759 : Rat) / 518003890243601902) [(1, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 1319 for generator 18. -/
def ep_Q2_041_partial_18_1319 : Poly :=
[
  term ((-47139427647628251759 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((47139427647628251759 : Rat) / 518003890243601902) [(1, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1319 for generator 18. -/
theorem ep_Q2_041_partial_18_1319_valid :
    mulPoly ep_Q2_041_coefficient_18_1319
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1319 := by
  native_decide

/-- Coefficient term 1320 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1320 : Poly :=
[
  term ((-1740732437590464399198708853419350424742579027230734458793291065427704500 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 1320 for generator 18. -/
def ep_Q2_041_partial_18_1320 : Poly :=
[
  term ((-3481464875180928798397417706838700849485158054461468917586582130855409000 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((1740732437590464399198708853419350424742579027230734458793291065427704500 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1320 for generator 18. -/
theorem ep_Q2_041_partial_18_1320_valid :
    mulPoly ep_Q2_041_coefficient_18_1320
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1320 := by
  native_decide

/-- Coefficient term 1321 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1321 : Poly :=
[
  term ((128817275903232 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1321 for generator 18. -/
def ep_Q2_041_partial_18_1321 : Poly :=
[
  term ((257634551806464 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-128817275903232 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1321 for generator 18. -/
theorem ep_Q2_041_partial_18_1321_valid :
    mulPoly ep_Q2_041_coefficient_18_1321
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1321 := by
  native_decide

/-- Coefficient term 1322 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1322 : Poly :=
[
  term ((-983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 4)]
]

/-- Partial product 1322 for generator 18. -/
def ep_Q2_041_partial_18_1322 : Poly :=
[
  term ((-1966773939729882857929454708744825158271752629605517767323275200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 4)],
  term ((983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1322 for generator 18. -/
theorem ep_Q2_041_partial_18_1322_valid :
    mulPoly ep_Q2_041_coefficient_18_1322
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1322 := by
  native_decide

/-- Coefficient term 1323 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1323 : Poly :=
[
  term ((-1943561687 : Rat) / 151763803) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1323 for generator 18. -/
def ep_Q2_041_partial_18_1323 : Poly :=
[
  term ((-3887123374 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((1943561687 : Rat) / 151763803) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1323 for generator 18. -/
theorem ep_Q2_041_partial_18_1323_valid :
    mulPoly ep_Q2_041_coefficient_18_1323
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1323 := by
  native_decide

/-- Coefficient term 1324 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1324 : Poly :=
[
  term ((44854609210871136598 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 1), (14, 2)]
]

/-- Partial product 1324 for generator 18. -/
def ep_Q2_041_partial_18_1324 : Poly :=
[
  term ((89709218421742273196 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term ((-44854609210871136598 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1324 for generator 18. -/
theorem ep_Q2_041_partial_18_1324_valid :
    mulPoly ep_Q2_041_coefficient_18_1324
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1324 := by
  native_decide

/-- Coefficient term 1325 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1325 : Poly :=
[
  term ((1186102556417100431188960689509601875918749344078464308498423430 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 1), (11, 1), (14, 2), (15, 2)]
]

/-- Partial product 1325 for generator 18. -/
def ep_Q2_041_partial_18_1325 : Poly :=
[
  term ((2372205112834200862377921379019203751837498688156928616996846860 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 2)],
  term ((-1186102556417100431188960689509601875918749344078464308498423430 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 1), (11, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1325 for generator 18. -/
theorem ep_Q2_041_partial_18_1325_valid :
    mulPoly ep_Q2_041_coefficient_18_1325
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1325 := by
  native_decide

/-- Coefficient term 1326 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1326 : Poly :=
[
  term ((4900977780 : Rat) / 151763803) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 1326 for generator 18. -/
def ep_Q2_041_partial_18_1326 : Poly :=
[
  term ((9801955560 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-4900977780 : Rat) / 151763803) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1326 for generator 18. -/
theorem ep_Q2_041_partial_18_1326_valid :
    mulPoly ep_Q2_041_coefficient_18_1326
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1326 := by
  native_decide

/-- Coefficient term 1327 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1327 : Poly :=
[
  term ((38536475766844239275815900863980908434432750680071962111637072870591498521 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 1327 for generator 18. -/
def ep_Q2_041_partial_18_1327 : Poly :=
[
  term ((38536475766844239275815900863980908434432750680071962111637072870591498521 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-38536475766844239275815900863980908434432750680071962111637072870591498521 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1327 for generator 18. -/
theorem ep_Q2_041_partial_18_1327_valid :
    mulPoly ep_Q2_041_coefficient_18_1327
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1327 := by
  native_decide

/-- Coefficient term 1328 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1328 : Poly :=
[
  term ((-21547146057088 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1328 for generator 18. -/
def ep_Q2_041_partial_18_1328 : Poly :=
[
  term ((-43094292114176 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((21547146057088 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1328 for generator 18. -/
theorem ep_Q2_041_partial_18_1328_valid :
    mulPoly ep_Q2_041_coefficient_18_1328
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1328 := by
  native_decide

/-- Coefficient term 1329 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1329 : Poly :=
[
  term ((-526533435026990219400761304478706504101955529789724292030809760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (15, 4)]
]

/-- Partial product 1329 for generator 18. -/
def ep_Q2_041_partial_18_1329 : Poly :=
[
  term ((-1053066870053980438801522608957413008203911059579448584061619520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 4)],
  term ((526533435026990219400761304478706504101955529789724292030809760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1329 for generator 18. -/
theorem ep_Q2_041_partial_18_1329_valid :
    mulPoly ep_Q2_041_coefficient_18_1329
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1329 := by
  native_decide

/-- Coefficient term 1330 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1330 : Poly :=
[
  term ((-25747826921477573838558203963049116878596509328330704343160 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 1330 for generator 18. -/
def ep_Q2_041_partial_18_1330 : Poly :=
[
  term ((-51495653842955147677116407926098233757193018656661408686320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((25747826921477573838558203963049116878596509328330704343160 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1330 for generator 18. -/
theorem ep_Q2_041_partial_18_1330_valid :
    mulPoly ep_Q2_041_coefficient_18_1330
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1330 := by
  native_decide

/-- Coefficient term 1331 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1331 : Poly :=
[
  term ((-260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 3)]
]

/-- Partial product 1331 for generator 18. -/
def ep_Q2_041_partial_18_1331 : Poly :=
[
  term ((-521585298541397765563017020502586504477965704647841169819805600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 3)],
  term ((260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1331 for generator 18. -/
theorem ep_Q2_041_partial_18_1331_valid :
    mulPoly ep_Q2_041_coefficient_18_1331
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1331 := by
  native_decide

/-- Coefficient term 1332 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1332 : Poly :=
[
  term ((447144609387276522927677977188610856292467007359159518823798480 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1332 for generator 18. -/
def ep_Q2_041_partial_18_1332 : Poly :=
[
  term ((894289218774553045855355954377221712584934014718319037647596960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-447144609387276522927677977188610856292467007359159518823798480 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1332 for generator 18. -/
theorem ep_Q2_041_partial_18_1332_valid :
    mulPoly ep_Q2_041_coefficient_18_1332
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1332 := by
  native_decide

/-- Coefficient term 1333 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1333 : Poly :=
[
  term ((-12641736761749560816235472989998287652347318922912144709530380 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 1333 for generator 18. -/
def ep_Q2_041_partial_18_1333 : Poly :=
[
  term ((-25283473523499121632470945979996575304694637845824289419060760 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((12641736761749560816235472989998287652347318922912144709530380 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1333 for generator 18. -/
theorem ep_Q2_041_partial_18_1333_valid :
    mulPoly ep_Q2_041_coefficient_18_1333
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1333 := by
  native_decide

/-- Coefficient term 1334 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1334 : Poly :=
[
  term ((-26372977114969673183072574319124816819528496867636616180640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 1334 for generator 18. -/
def ep_Q2_041_partial_18_1334 : Poly :=
[
  term ((-52745954229939346366145148638249633639056993735273232361280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((26372977114969673183072574319124816819528496867636616180640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1334 for generator 18. -/
theorem ep_Q2_041_partial_18_1334_valid :
    mulPoly ep_Q2_041_coefficient_18_1334
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1334 := by
  native_decide

/-- Coefficient term 1335 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1335 : Poly :=
[
  term ((-2311872242951507735076159175295609914837819163085626818597326400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 3)]
]

/-- Partial product 1335 for generator 18. -/
def ep_Q2_041_partial_18_1335 : Poly :=
[
  term ((-4623744485903015470152318350591219829675638326171253637194652800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 3)],
  term ((2311872242951507735076159175295609914837819163085626818597326400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1335 for generator 18. -/
theorem ep_Q2_041_partial_18_1335_valid :
    mulPoly ep_Q2_041_coefficient_18_1335
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1335 := by
  native_decide

/-- Coefficient term 1336 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1336 : Poly :=
[
  term ((-615447245341493374747339413688876005322588273722713256885920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (14, 2), (15, 1)]
]

/-- Partial product 1336 for generator 18. -/
def ep_Q2_041_partial_18_1336 : Poly :=
[
  term ((-1230894490682986749494678827377752010645176547445426513771840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((615447245341493374747339413688876005322588273722713256885920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1336 for generator 18. -/
theorem ep_Q2_041_partial_18_1336_valid :
    mulPoly ep_Q2_041_coefficient_18_1336
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1336 := by
  native_decide

/-- Coefficient term 1337 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1337 : Poly :=
[
  term ((391751806933202574589810284861505432467194162637966013590646970 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 2), (15, 3)]
]

/-- Partial product 1337 for generator 18. -/
def ep_Q2_041_partial_18_1337 : Poly :=
[
  term ((783503613866405149179620569723010864934388325275932027181293940 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 3)],
  term ((-391751806933202574589810284861505432467194162637966013590646970 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1337 for generator 18. -/
theorem ep_Q2_041_partial_18_1337_valid :
    mulPoly ep_Q2_041_coefficient_18_1337
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1337 := by
  native_decide

/-- Coefficient term 1338 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1338 : Poly :=
[
  term ((-52626654078527845924 : Rat) / 259001945121800951) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 1338 for generator 18. -/
def ep_Q2_041_partial_18_1338 : Poly :=
[
  term ((-105253308157055691848 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((52626654078527845924 : Rat) / 259001945121800951) [(1, 1), (10, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1338 for generator 18. -/
theorem ep_Q2_041_partial_18_1338_valid :
    mulPoly ep_Q2_041_coefficient_18_1338
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1338 := by
  native_decide

/-- Coefficient term 1339 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1339 : Poly :=
[
  term ((66321481152638949278 : Rat) / 259001945121800951) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1339 for generator 18. -/
def ep_Q2_041_partial_18_1339 : Poly :=
[
  term ((132642962305277898556 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-66321481152638949278 : Rat) / 259001945121800951) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1339 for generator 18. -/
theorem ep_Q2_041_partial_18_1339_valid :
    mulPoly ep_Q2_041_coefficient_18_1339
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1339 := by
  native_decide

/-- Coefficient term 1340 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1340 : Poly :=
[
  term ((-260934223910361983142940774596067639393059786048134412431786390 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1340 for generator 18. -/
def ep_Q2_041_partial_18_1340 : Poly :=
[
  term ((-521868447820723966285881549192135278786119572096268824863572780 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((260934223910361983142940774596067639393059786048134412431786390 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1340 for generator 18. -/
theorem ep_Q2_041_partial_18_1340_valid :
    mulPoly ep_Q2_041_coefficient_18_1340
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1340 := by
  native_decide

/-- Coefficient term 1341 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1341 : Poly :=
[
  term ((4669731680 : Rat) / 151763803) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1341 for generator 18. -/
def ep_Q2_041_partial_18_1341 : Poly :=
[
  term ((9339463360 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4669731680 : Rat) / 151763803) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1341 for generator 18. -/
theorem ep_Q2_041_partial_18_1341_valid :
    mulPoly ep_Q2_041_coefficient_18_1341
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1341 := by
  native_decide

/-- Coefficient term 1342 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1342 : Poly :=
[
  term ((-2518293293613931050972626042587579898743646597291776651941988901585492283 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1342 for generator 18. -/
def ep_Q2_041_partial_18_1342 : Poly :=
[
  term ((-5036586587227862101945252085175159797487293194583553303883977803170984566 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((2518293293613931050972626042587579898743646597291776651941988901585492283 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1342 for generator 18. -/
theorem ep_Q2_041_partial_18_1342_valid :
    mulPoly ep_Q2_041_coefficient_18_1342
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1342 := by
  native_decide

/-- Coefficient term 1343 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1343 : Poly :=
[
  term ((-18399437427264 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1343 for generator 18. -/
def ep_Q2_041_partial_18_1343 : Poly :=
[
  term ((-36798874854528 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((18399437427264 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1343 for generator 18. -/
theorem ep_Q2_041_partial_18_1343_valid :
    mulPoly ep_Q2_041_coefficient_18_1343
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1343 := by
  native_decide

/-- Coefficient term 1344 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1344 : Poly :=
[
  term ((-102714193245742226989280756158012753165195100710662644688035920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 4)]
]

/-- Partial product 1344 for generator 18. -/
def ep_Q2_041_partial_18_1344 : Poly :=
[
  term ((-205428386491484453978561512316025506330390201421325289376071840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 4)],
  term ((102714193245742226989280756158012753165195100710662644688035920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1344 for generator 18. -/
theorem ep_Q2_041_partial_18_1344_valid :
    mulPoly ep_Q2_041_coefficient_18_1344
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1344 := by
  native_decide

/-- Coefficient term 1345 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1345 : Poly :=
[
  term ((-4365928564 : Rat) / 151763803) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1345 for generator 18. -/
def ep_Q2_041_partial_18_1345 : Poly :=
[
  term ((-8731857128 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((4365928564 : Rat) / 151763803) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1345 for generator 18. -/
theorem ep_Q2_041_partial_18_1345_valid :
    mulPoly ep_Q2_041_coefficient_18_1345
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1345 := by
  native_decide

/-- Coefficient term 1346 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1346 : Poly :=
[
  term ((-214434056142434830444220123555143560683775503759260181329320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1346 for generator 18. -/
def ep_Q2_041_partial_18_1346 : Poly :=
[
  term ((-428868112284869660888440247110287121367551007518520362658640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((214434056142434830444220123555143560683775503759260181329320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1346 for generator 18. -/
theorem ep_Q2_041_partial_18_1346_valid :
    mulPoly ep_Q2_041_coefficient_18_1346
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1346 := by
  native_decide

/-- Coefficient term 1347 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1347 : Poly :=
[
  term ((-72008901597431068082191746063155867031004344526412064507086050076928 : Rat) / 47966965841323451035541533271802758327623668915613656588050067527) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1347 for generator 18. -/
def ep_Q2_041_partial_18_1347 : Poly :=
[
  term ((-144017803194862136164383492126311734062008689052824129014172100153856 : Rat) / 47966965841323451035541533271802758327623668915613656588050067527) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((72008901597431068082191746063155867031004344526412064507086050076928 : Rat) / 47966965841323451035541533271802758327623668915613656588050067527) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1347 for generator 18. -/
theorem ep_Q2_041_partial_18_1347_valid :
    mulPoly ep_Q2_041_coefficient_18_1347
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1347 := by
  native_decide

/-- Coefficient term 1348 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1348 : Poly :=
[
  term ((-27456416640 : Rat) / 151763803) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1348 for generator 18. -/
def ep_Q2_041_partial_18_1348 : Poly :=
[
  term ((-54912833280 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((27456416640 : Rat) / 151763803) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1348 for generator 18. -/
theorem ep_Q2_041_partial_18_1348_valid :
    mulPoly ep_Q2_041_coefficient_18_1348
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1348 := by
  native_decide

/-- Coefficient term 1349 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1349 : Poly :=
[
  term ((609213315253608045360872061414882842870130649545356484071051120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 3)]
]

/-- Partial product 1349 for generator 18. -/
def ep_Q2_041_partial_18_1349 : Poly :=
[
  term ((1218426630507216090721744122829765685740261299090712968142102240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 2), (15, 3)],
  term ((-609213315253608045360872061414882842870130649545356484071051120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1349 for generator 18. -/
theorem ep_Q2_041_partial_18_1349_valid :
    mulPoly ep_Q2_041_coefficient_18_1349
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1349 := by
  native_decide

/-- Coefficient term 1350 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1350 : Poly :=
[
  term ((1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (12, 1), (13, 3), (15, 2)]
]

/-- Partial product 1350 for generator 18. -/
def ep_Q2_041_partial_18_1350 : Poly :=
[
  term ((2521597038419921329922863573267361527353050623002876172422720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 3), (15, 2)],
  term ((-1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (12, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1350 for generator 18. -/
theorem ep_Q2_041_partial_18_1350_valid :
    mulPoly ep_Q2_041_coefficient_18_1350
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1350 := by
  native_decide

/-- Coefficient term 1351 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1351 : Poly :=
[
  term ((4580961414202624980467657969126166877939804860328078336531618175009131421 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1351 for generator 18. -/
def ep_Q2_041_partial_18_1351 : Poly :=
[
  term ((4580961414202624980467657969126166877939804860328078336531618175009131421 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-4580961414202624980467657969126166877939804860328078336531618175009131421 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1351 for generator 18. -/
theorem ep_Q2_041_partial_18_1351_valid :
    mulPoly ep_Q2_041_coefficient_18_1351
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1351 := by
  native_decide

/-- Coefficient term 1352 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1352 : Poly :=
[
  term ((23679611854472 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1352 for generator 18. -/
def ep_Q2_041_partial_18_1352 : Poly :=
[
  term ((47359223708944 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-23679611854472 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1352 for generator 18. -/
theorem ep_Q2_041_partial_18_1352_valid :
    mulPoly ep_Q2_041_coefficient_18_1352
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1352 := by
  native_decide

/-- Coefficient term 1353 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1353 : Poly :=
[
  term ((26955605082187103896810182002546676349265998901680160083267416485204530709 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 1353 for generator 18. -/
def ep_Q2_041_partial_18_1353 : Poly :=
[
  term ((26955605082187103896810182002546676349265998901680160083267416485204530709 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-26955605082187103896810182002546676349265998901680160083267416485204530709 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1353 for generator 18. -/
theorem ep_Q2_041_partial_18_1353_valid :
    mulPoly ep_Q2_041_coefficient_18_1353
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1353 := by
  native_decide

/-- Coefficient term 1354 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1354 : Poly :=
[
  term ((168705069907 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1354 for generator 18. -/
def ep_Q2_041_partial_18_1354 : Poly :=
[
  term ((337410139814 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-168705069907 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1354 for generator 18. -/
theorem ep_Q2_041_partial_18_1354_valid :
    mulPoly ep_Q2_041_coefficient_18_1354
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1354 := by
  native_decide

/-- Coefficient term 1355 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1355 : Poly :=
[
  term ((9147753424426605534016194954403023074078444791621563441451460455279875 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (10, 1), (12, 1), (15, 3)]
]

/-- Partial product 1355 for generator 18. -/
def ep_Q2_041_partial_18_1355 : Poly :=
[
  term ((18295506848853211068032389908806046148156889583243126882902920910559750 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 3)],
  term ((-9147753424426605534016194954403023074078444791621563441451460455279875 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (10, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1355 for generator 18. -/
theorem ep_Q2_041_partial_18_1355_valid :
    mulPoly ep_Q2_041_coefficient_18_1355
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1355 := by
  native_decide

/-- Coefficient term 1356 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1356 : Poly :=
[
  term ((18141733111488 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1356 for generator 18. -/
def ep_Q2_041_partial_18_1356 : Poly :=
[
  term ((36283466222976 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-18141733111488 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1356 for generator 18. -/
theorem ep_Q2_041_partial_18_1356_valid :
    mulPoly ep_Q2_041_coefficient_18_1356
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1356 := by
  native_decide

/-- Coefficient term 1357 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1357 : Poly :=
[
  term ((366196840862152317893281357131419948904097994958507358373280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (12, 2), (13, 1), (15, 2)]
]

/-- Partial product 1357 for generator 18. -/
def ep_Q2_041_partial_18_1357 : Poly :=
[
  term ((732393681724304635786562714262839897808195989917014716746560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (12, 2), (13, 1), (15, 2)],
  term ((-366196840862152317893281357131419948904097994958507358373280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1357 for generator 18. -/
theorem ep_Q2_041_partial_18_1357_valid :
    mulPoly ep_Q2_041_coefficient_18_1357
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1357 := by
  native_decide

/-- Coefficient term 1358 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1358 : Poly :=
[
  term ((-113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (10, 1), (12, 2), (15, 1)]
]

/-- Partial product 1358 for generator 18. -/
def ep_Q2_041_partial_18_1358 : Poly :=
[
  term ((-226519213564314119024 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (10, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1358 for generator 18. -/
theorem ep_Q2_041_partial_18_1358_valid :
    mulPoly ep_Q2_041_coefficient_18_1358
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1358 := by
  native_decide

/-- Coefficient term 1359 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1359 : Poly :=
[
  term ((-7974670720 : Rat) / 151763803) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1359 for generator 18. -/
def ep_Q2_041_partial_18_1359 : Poly :=
[
  term ((-15949341440 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((7974670720 : Rat) / 151763803) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1359 for generator 18. -/
theorem ep_Q2_041_partial_18_1359_valid :
    mulPoly ep_Q2_041_coefficient_18_1359
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1359 := by
  native_decide

/-- Coefficient term 1360 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1360 : Poly :=
[
  term ((208884629151629417589 : Rat) / 518003890243601902) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 1360 for generator 18. -/
def ep_Q2_041_partial_18_1360 : Poly :=
[
  term ((208884629151629417589 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-208884629151629417589 : Rat) / 518003890243601902) [(1, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1360 for generator 18. -/
theorem ep_Q2_041_partial_18_1360_valid :
    mulPoly ep_Q2_041_coefficient_18_1360
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1360 := by
  native_decide

/-- Coefficient term 1361 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1361 : Poly :=
[
  term ((-207052843777895917341 : Rat) / 259001945121800951) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 1361 for generator 18. -/
def ep_Q2_041_partial_18_1361 : Poly :=
[
  term ((-414105687555791834682 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((207052843777895917341 : Rat) / 259001945121800951) [(1, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1361 for generator 18. -/
theorem ep_Q2_041_partial_18_1361_valid :
    mulPoly ep_Q2_041_coefficient_18_1361
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1361 := by
  native_decide

/-- Coefficient term 1362 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1362 : Poly :=
[
  term ((-970064303781037563505294154580001973619834361890239333659844207337267808 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1362 for generator 18. -/
def ep_Q2_041_partial_18_1362 : Poly :=
[
  term ((-1940128607562075127010588309160003947239668723780478667319688414674535616 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((970064303781037563505294154580001973619834361890239333659844207337267808 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1362 for generator 18. -/
theorem ep_Q2_041_partial_18_1362_valid :
    mulPoly ep_Q2_041_coefficient_18_1362
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1362 := by
  native_decide

/-- Coefficient term 1363 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1363 : Poly :=
[
  term ((-18511191675904 : Rat) / 275754830051) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1363 for generator 18. -/
def ep_Q2_041_partial_18_1363 : Poly :=
[
  term ((-37022383351808 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((18511191675904 : Rat) / 275754830051) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1363 for generator 18. -/
theorem ep_Q2_041_partial_18_1363_valid :
    mulPoly ep_Q2_041_coefficient_18_1363
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1363 := by
  native_decide

/-- Coefficient term 1364 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1364 : Poly :=
[
  term ((-310231873387634851610285032617989041170743201376789758062709920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 4)]
]

/-- Partial product 1364 for generator 18. -/
def ep_Q2_041_partial_18_1364 : Poly :=
[
  term ((-620463746775269703220570065235978082341486402753579516125419840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 4)],
  term ((310231873387634851610285032617989041170743201376789758062709920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1364 for generator 18. -/
theorem ep_Q2_041_partial_18_1364_valid :
    mulPoly ep_Q2_041_coefficient_18_1364
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1364 := by
  native_decide

/-- Coefficient term 1365 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1365 : Poly :=
[
  term ((-12708421074 : Rat) / 151763803) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1365 for generator 18. -/
def ep_Q2_041_partial_18_1365 : Poly :=
[
  term ((-25416842148 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((12708421074 : Rat) / 151763803) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1365 for generator 18. -/
theorem ep_Q2_041_partial_18_1365_valid :
    mulPoly ep_Q2_041_coefficient_18_1365
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1365 := by
  native_decide

/-- Coefficient term 1366 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1366 : Poly :=
[
  term ((-37664376363001390070 : Rat) / 777005835365402853) [(1, 1), (10, 1), (13, 1), (14, 2)]
]

/-- Partial product 1366 for generator 18. -/
def ep_Q2_041_partial_18_1366 : Poly :=
[
  term ((-75328752726002780140 : Rat) / 777005835365402853) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((37664376363001390070 : Rat) / 777005835365402853) [(1, 1), (10, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1366 for generator 18. -/
theorem ep_Q2_041_partial_18_1366_valid :
    mulPoly ep_Q2_041_coefficient_18_1366
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1366 := by
  native_decide

/-- Coefficient term 1367 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1367 : Poly :=
[
  term ((-1400448021915171134654103578523135287304198845223468815092855870 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (10, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1367 for generator 18. -/
def ep_Q2_041_partial_18_1367 : Poly :=
[
  term ((-2800896043830342269308207157046270574608397690446937630185711740 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((1400448021915171134654103578523135287304198845223468815092855870 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (10, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1367 for generator 18. -/
theorem ep_Q2_041_partial_18_1367_valid :
    mulPoly ep_Q2_041_coefficient_18_1367
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1367 := by
  native_decide

/-- Coefficient term 1368 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1368 : Poly :=
[
  term ((-16788970880 : Rat) / 455291409) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 1368 for generator 18. -/
def ep_Q2_041_partial_18_1368 : Poly :=
[
  term ((-33577941760 : Rat) / 455291409) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((16788970880 : Rat) / 455291409) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1368 for generator 18. -/
theorem ep_Q2_041_partial_18_1368_valid :
    mulPoly ep_Q2_041_coefficient_18_1368
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1368 := by
  native_decide

/-- Coefficient term 1369 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1369 : Poly :=
[
  term ((14716549900519591442899927354561631930207213173673692595160815802467785565 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 1369 for generator 18. -/
def ep_Q2_041_partial_18_1369 : Poly :=
[
  term ((14716549900519591442899927354561631930207213173673692595160815802467785565 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-14716549900519591442899927354561631930207213173673692595160815802467785565 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1369 for generator 18. -/
theorem ep_Q2_041_partial_18_1369_valid :
    mulPoly ep_Q2_041_coefficient_18_1369
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1369 := by
  native_decide

/-- Coefficient term 1370 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1370 : Poly :=
[
  term ((-22640255720104 : Rat) / 275754830051) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1370 for generator 18. -/
def ep_Q2_041_partial_18_1370 : Poly :=
[
  term ((-45280511440208 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((22640255720104 : Rat) / 275754830051) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1370 for generator 18. -/
theorem ep_Q2_041_partial_18_1370_valid :
    mulPoly ep_Q2_041_coefficient_18_1370
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1370 := by
  native_decide

/-- Coefficient term 1371 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1371 : Poly :=
[
  term ((-142935822809287987412858596565515648595799952101655646303750240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 1), (15, 4)]
]

/-- Partial product 1371 for generator 18. -/
def ep_Q2_041_partial_18_1371 : Poly :=
[
  term ((-285871645618575974825717193131031297191599904203311292607500480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 4)],
  term ((142935822809287987412858596565515648595799952101655646303750240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1371 for generator 18. -/
theorem ep_Q2_041_partial_18_1371_valid :
    mulPoly ep_Q2_041_coefficient_18_1371
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1371 := by
  native_decide

/-- Coefficient term 1372 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1372 : Poly :=
[
  term ((7919563837 : Rat) / 151763803) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 1372 for generator 18. -/
def ep_Q2_041_partial_18_1372 : Poly :=
[
  term ((15839127674 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-7919563837 : Rat) / 151763803) [(1, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1372 for generator 18. -/
theorem ep_Q2_041_partial_18_1372_valid :
    mulPoly ep_Q2_041_coefficient_18_1372
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1372 := by
  native_decide

/-- Coefficient term 1373 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1373 : Poly :=
[
  term ((11940561298410230911710178335027866107070961769791023510536647850430589169 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1373 for generator 18. -/
def ep_Q2_041_partial_18_1373 : Poly :=
[
  term ((23881122596820461823420356670055732214141923539582047021073295700861178338 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-11940561298410230911710178335027866107070961769791023510536647850430589169 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1373 for generator 18. -/
theorem ep_Q2_041_partial_18_1373_valid :
    mulPoly ep_Q2_041_coefficient_18_1373
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1373 := by
  native_decide

/-- Coefficient term 1374 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1374 : Poly :=
[
  term ((68287746462144 : Rat) / 275754830051) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1374 for generator 18. -/
def ep_Q2_041_partial_18_1374 : Poly :=
[
  term ((136575492924288 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-68287746462144 : Rat) / 275754830051) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1374 for generator 18. -/
theorem ep_Q2_041_partial_18_1374_valid :
    mulPoly ep_Q2_041_coefficient_18_1374
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1374 := by
  native_decide

/-- Coefficient term 1375 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1375 : Poly :=
[
  term ((355368491081935772172930839710938494869816054991106958883429120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 3)]
]

/-- Partial product 1375 for generator 18. -/
def ep_Q2_041_partial_18_1375 : Poly :=
[
  term ((710736982163871544345861679421876989739632109982213917766858240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 3)],
  term ((-355368491081935772172930839710938494869816054991106958883429120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1375 for generator 18. -/
theorem ep_Q2_041_partial_18_1375_valid :
    mulPoly ep_Q2_041_coefficient_18_1375
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1375 := by
  native_decide

/-- Coefficient term 1376 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1376 : Poly :=
[
  term ((-340021555114110256759790499187662316934023106346568064294760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (13, 2), (14, 2), (15, 1)]
]

/-- Partial product 1376 for generator 18. -/
def ep_Q2_041_partial_18_1376 : Poly :=
[
  term ((-680043110228220513519580998375324633868046212693136128589520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 2), (14, 2), (15, 1)],
  term ((340021555114110256759790499187662316934023106346568064294760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1376 for generator 18. -/
theorem ep_Q2_041_partial_18_1376_valid :
    mulPoly ep_Q2_041_coefficient_18_1376
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1376 := by
  native_decide

/-- Coefficient term 1377 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1377 : Poly :=
[
  term ((-648976382639244323454675117890558909266993334797360889346623081924931869 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (10, 1), (13, 2), (15, 1)]
]

/-- Partial product 1377 for generator 18. -/
def ep_Q2_041_partial_18_1377 : Poly :=
[
  term ((-648976382639244323454675117890558909266993334797360889346623081924931869 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((648976382639244323454675117890558909266993334797360889346623081924931869 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1377 for generator 18. -/
theorem ep_Q2_041_partial_18_1377_valid :
    mulPoly ep_Q2_041_coefficient_18_1377
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1377 := by
  native_decide

/-- Coefficient term 1378 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1378 : Poly :=
[
  term ((-1998470922736 : Rat) / 275754830051) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1378 for generator 18. -/
def ep_Q2_041_partial_18_1378 : Poly :=
[
  term ((-3996941845472 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1998470922736 : Rat) / 275754830051) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1378 for generator 18. -/
theorem ep_Q2_041_partial_18_1378_valid :
    mulPoly ep_Q2_041_coefficient_18_1378
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1378 := by
  native_decide

/-- Coefficient term 1379 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1379 : Poly :=
[
  term ((-302470553697484872501473595037249543623130814407220240706093290 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 2), (15, 3)]
]

/-- Partial product 1379 for generator 18. -/
def ep_Q2_041_partial_18_1379 : Poly :=
[
  term ((-604941107394969745002947190074499087246261628814440481412186580 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 3)],
  term ((302470553697484872501473595037249543623130814407220240706093290 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1379 for generator 18. -/
theorem ep_Q2_041_partial_18_1379_valid :
    mulPoly ep_Q2_041_coefficient_18_1379
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1379 := by
  native_decide

/-- Coefficient term 1380 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1380 : Poly :=
[
  term ((-97486876307460690486 : Rat) / 259001945121800951) [(1, 1), (10, 1), (13, 3)]
]

/-- Partial product 1380 for generator 18. -/
def ep_Q2_041_partial_18_1380 : Poly :=
[
  term ((-194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (13, 3)],
  term ((97486876307460690486 : Rat) / 259001945121800951) [(1, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1380 for generator 18. -/
theorem ep_Q2_041_partial_18_1380_valid :
    mulPoly ep_Q2_041_coefficient_18_1380
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1380 := by
  native_decide

/-- Coefficient term 1381 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1381 : Poly :=
[
  term ((389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (10, 1), (13, 3), (14, 1)]
]

/-- Partial product 1381 for generator 18. -/
def ep_Q2_041_partial_18_1381 : Poly :=
[
  term ((779895010459685523888 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (13, 3), (14, 1)],
  term ((-389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (10, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1381 for generator 18. -/
theorem ep_Q2_041_partial_18_1381_valid :
    mulPoly ep_Q2_041_coefficient_18_1381
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1381 := by
  native_decide

/-- Coefficient term 1382 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1382 : Poly :=
[
  term ((-2900084224658106573595793617728280790470377140543469486717092240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 3), (14, 1), (15, 2)]
]

/-- Partial product 1382 for generator 18. -/
def ep_Q2_041_partial_18_1382 : Poly :=
[
  term ((-5800168449316213147191587235456561580940754281086938973434184480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 3), (14, 1), (15, 2)],
  term ((2900084224658106573595793617728280790470377140543469486717092240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1382 for generator 18. -/
theorem ep_Q2_041_partial_18_1382_valid :
    mulPoly ep_Q2_041_coefficient_18_1382
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1382 := by
  native_decide

/-- Coefficient term 1383 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1383 : Poly :=
[
  term ((27456416640 : Rat) / 151763803) [(1, 1), (10, 1), (13, 3), (14, 1), (16, 1)]
]

/-- Partial product 1383 for generator 18. -/
def ep_Q2_041_partial_18_1383 : Poly :=
[
  term ((54912833280 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((-27456416640 : Rat) / 151763803) [(1, 1), (10, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1383 for generator 18. -/
theorem ep_Q2_041_partial_18_1383_valid :
    mulPoly ep_Q2_041_coefficient_18_1383
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1383 := by
  native_decide

/-- Coefficient term 1384 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1384 : Poly :=
[
  term ((32847584512095314205161189561550349902120199161778647682905860 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 3), (15, 2)]
]

/-- Partial product 1384 for generator 18. -/
def ep_Q2_041_partial_18_1384 : Poly :=
[
  term ((65695169024190628410322379123100699804240398323557295365811720 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 3), (15, 2)],
  term ((-32847584512095314205161189561550349902120199161778647682905860 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1384 for generator 18. -/
theorem ep_Q2_041_partial_18_1384_valid :
    mulPoly ep_Q2_041_coefficient_18_1384
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1384 := by
  native_decide

/-- Coefficient term 1385 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1385 : Poly :=
[
  term ((-6864104160 : Rat) / 151763803) [(1, 1), (10, 1), (13, 3), (16, 1)]
]

/-- Partial product 1385 for generator 18. -/
def ep_Q2_041_partial_18_1385 : Poly :=
[
  term ((-13728208320 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 3), (16, 1)],
  term ((6864104160 : Rat) / 151763803) [(1, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1385 for generator 18. -/
theorem ep_Q2_041_partial_18_1385_valid :
    mulPoly ep_Q2_041_coefficient_18_1385
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1385 := by
  native_decide

/-- Coefficient term 1386 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1386 : Poly :=
[
  term ((-1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (13, 4), (14, 1), (15, 1)]
]

/-- Partial product 1386 for generator 18. -/
def ep_Q2_041_partial_18_1386 : Poly :=
[
  term ((-2521597038419921329922863573267361527353050623002876172422720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 4), (14, 1), (15, 1)],
  term ((1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (13, 4), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1386 for generator 18. -/
theorem ep_Q2_041_partial_18_1386_valid :
    mulPoly ep_Q2_041_coefficient_18_1386
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1386 := by
  native_decide

/-- Coefficient term 1387 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1387 : Poly :=
[
  term ((315199629802490166240357946658420190919131327875359521552840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (13, 4), (15, 1)]
]

/-- Partial product 1387 for generator 18. -/
def ep_Q2_041_partial_18_1387 : Poly :=
[
  term ((630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 4), (15, 1)],
  term ((-315199629802490166240357946658420190919131327875359521552840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1387 for generator 18. -/
theorem ep_Q2_041_partial_18_1387_valid :
    mulPoly ep_Q2_041_coefficient_18_1387
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1387 := by
  native_decide

/-- Coefficient term 1388 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1388 : Poly :=
[
  term ((-28869971588593747430326744282236109817330732797456260523017902327237533069 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 1388 for generator 18. -/
def ep_Q2_041_partial_18_1388 : Poly :=
[
  term ((-28869971588593747430326744282236109817330732797456260523017902327237533069 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((28869971588593747430326744282236109817330732797456260523017902327237533069 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1388 for generator 18. -/
theorem ep_Q2_041_partial_18_1388_valid :
    mulPoly ep_Q2_041_coefficient_18_1388
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1388 := by
  native_decide

/-- Coefficient term 1389 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1389 : Poly :=
[
  term ((125784552421390 : Rat) / 275754830051) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1389 for generator 18. -/
def ep_Q2_041_partial_18_1389 : Poly :=
[
  term ((251569104842780 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-125784552421390 : Rat) / 275754830051) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1389 for generator 18. -/
theorem ep_Q2_041_partial_18_1389_valid :
    mulPoly ep_Q2_041_coefficient_18_1389
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1389 := by
  native_decide

/-- Coefficient term 1390 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1390 : Poly :=
[
  term ((76078210013997168130792545776270401240718729403966979681237450616778490 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (14, 1), (15, 3)]
]

/-- Partial product 1390 for generator 18. -/
def ep_Q2_041_partial_18_1390 : Poly :=
[
  term ((152156420027994336261585091552540802481437458807933959362474901233556980 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((-76078210013997168130792545776270401240718729403966979681237450616778490 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1390 for generator 18. -/
theorem ep_Q2_041_partial_18_1390_valid :
    mulPoly ep_Q2_041_coefficient_18_1390
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1390 := by
  native_decide

/-- Coefficient term 1391 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1391 : Poly :=
[
  term ((54794217545088 : Rat) / 275754830051) [(1, 1), (10, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1391 for generator 18. -/
def ep_Q2_041_partial_18_1391 : Poly :=
[
  term ((109588435090176 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-54794217545088 : Rat) / 275754830051) [(1, 1), (10, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1391 for generator 18. -/
theorem ep_Q2_041_partial_18_1391_valid :
    mulPoly ep_Q2_041_coefficient_18_1391
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1391 := by
  native_decide

/-- Coefficient term 1392 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1392 : Poly :=
[
  term ((1685638353558183812485404117315220430854142066924163350114115640914060631 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (10, 1), (14, 2), (15, 1)]
]

/-- Partial product 1392 for generator 18. -/
def ep_Q2_041_partial_18_1392 : Poly :=
[
  term ((1685638353558183812485404117315220430854142066924163350114115640914060631 : Rat) / 74256892347499373372905278993545501322860959869558851945454900737468268) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1685638353558183812485404117315220430854142066924163350114115640914060631 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (10, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1392 for generator 18. -/
theorem ep_Q2_041_partial_18_1392_valid :
    mulPoly ep_Q2_041_coefficient_18_1392
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1392 := by
  native_decide

/-- Coefficient term 1393 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1393 : Poly :=
[
  term ((-22501475733120 : Rat) / 275754830051) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1393 for generator 18. -/
def ep_Q2_041_partial_18_1393 : Poly :=
[
  term ((-45002951466240 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((22501475733120 : Rat) / 275754830051) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1393 for generator 18. -/
theorem ep_Q2_041_partial_18_1393_valid :
    mulPoly ep_Q2_041_coefficient_18_1393
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1393 := by
  native_decide

/-- Coefficient term 1394 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1394 : Poly :=
[
  term ((45233975272697377908773893837800780455079863796700803248921002781631241003 : Rat) / 99009189796665831163873705324727335097147946492745135927273200983291024) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 1394 for generator 18. -/
def ep_Q2_041_partial_18_1394 : Poly :=
[
  term ((45233975272697377908773893837800780455079863796700803248921002781631241003 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-45233975272697377908773893837800780455079863796700803248921002781631241003 : Rat) / 99009189796665831163873705324727335097147946492745135927273200983291024) [(1, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1394 for generator 18. -/
theorem ep_Q2_041_partial_18_1394_valid :
    mulPoly ep_Q2_041_coefficient_18_1394
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1394 := by
  native_decide

/-- Coefficient term 1395 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1395 : Poly :=
[
  term ((-51459743067283 : Rat) / 275754830051) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 1395 for generator 18. -/
def ep_Q2_041_partial_18_1395 : Poly :=
[
  term ((-102919486134566 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((51459743067283 : Rat) / 275754830051) [(1, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1395 for generator 18. -/
theorem ep_Q2_041_partial_18_1395_valid :
    mulPoly ep_Q2_041_coefficient_18_1395
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1395 := by
  native_decide

/-- Coefficient term 1396 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1396 : Poly :=
[
  term ((954349548641394961747226838190238678758569066166718509145497858327044504 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (15, 3)]
]

/-- Partial product 1396 for generator 18. -/
def ep_Q2_041_partial_18_1396 : Poly :=
[
  term ((1908699097282789923494453676380477357517138132333437018290995716654089008 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((-954349548641394961747226838190238678758569066166718509145497858327044504 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1396 for generator 18. -/
theorem ep_Q2_041_partial_18_1396_valid :
    mulPoly ep_Q2_041_coefficient_18_1396
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1396 := by
  native_decide

/-- Coefficient term 1397 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1397 : Poly :=
[
  term ((37920312998992 : Rat) / 275754830051) [(1, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 1397 for generator 18. -/
def ep_Q2_041_partial_18_1397 : Poly :=
[
  term ((75840625997984 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-37920312998992 : Rat) / 275754830051) [(1, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1397 for generator 18. -/
theorem ep_Q2_041_partial_18_1397_valid :
    mulPoly ep_Q2_041_coefficient_18_1397
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1397 := by
  native_decide

/-- Coefficient term 1398 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1398 : Poly :=
[
  term ((56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 2), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1398 for generator 18. -/
def ep_Q2_041_partial_18_1398 : Poly :=
[
  term ((112565941960423643457955184431328387754518083644529429475360 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((-56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 2), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1398 for generator 18. -/
theorem ep_Q2_041_partial_18_1398_valid :
    mulPoly ep_Q2_041_coefficient_18_1398
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1398 := by
  native_decide

/-- Coefficient term 1399 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1399 : Poly :=
[
  term ((-688841493248472689042984707119329110389997082368572835306000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1399 for generator 18. -/
def ep_Q2_041_partial_18_1399 : Poly :=
[
  term ((-1377682986496945378085969414238658220779994164737145670612000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((688841493248472689042984707119329110389997082368572835306000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1399 for generator 18. -/
theorem ep_Q2_041_partial_18_1399_valid :
    mulPoly ep_Q2_041_coefficient_18_1399
        ep_Q2_041_generator_18_1300_1399 =
      ep_Q2_041_partial_18_1399 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_1300_1399 : List Poly :=
[
  ep_Q2_041_partial_18_1300,
  ep_Q2_041_partial_18_1301,
  ep_Q2_041_partial_18_1302,
  ep_Q2_041_partial_18_1303,
  ep_Q2_041_partial_18_1304,
  ep_Q2_041_partial_18_1305,
  ep_Q2_041_partial_18_1306,
  ep_Q2_041_partial_18_1307,
  ep_Q2_041_partial_18_1308,
  ep_Q2_041_partial_18_1309,
  ep_Q2_041_partial_18_1310,
  ep_Q2_041_partial_18_1311,
  ep_Q2_041_partial_18_1312,
  ep_Q2_041_partial_18_1313,
  ep_Q2_041_partial_18_1314,
  ep_Q2_041_partial_18_1315,
  ep_Q2_041_partial_18_1316,
  ep_Q2_041_partial_18_1317,
  ep_Q2_041_partial_18_1318,
  ep_Q2_041_partial_18_1319,
  ep_Q2_041_partial_18_1320,
  ep_Q2_041_partial_18_1321,
  ep_Q2_041_partial_18_1322,
  ep_Q2_041_partial_18_1323,
  ep_Q2_041_partial_18_1324,
  ep_Q2_041_partial_18_1325,
  ep_Q2_041_partial_18_1326,
  ep_Q2_041_partial_18_1327,
  ep_Q2_041_partial_18_1328,
  ep_Q2_041_partial_18_1329,
  ep_Q2_041_partial_18_1330,
  ep_Q2_041_partial_18_1331,
  ep_Q2_041_partial_18_1332,
  ep_Q2_041_partial_18_1333,
  ep_Q2_041_partial_18_1334,
  ep_Q2_041_partial_18_1335,
  ep_Q2_041_partial_18_1336,
  ep_Q2_041_partial_18_1337,
  ep_Q2_041_partial_18_1338,
  ep_Q2_041_partial_18_1339,
  ep_Q2_041_partial_18_1340,
  ep_Q2_041_partial_18_1341,
  ep_Q2_041_partial_18_1342,
  ep_Q2_041_partial_18_1343,
  ep_Q2_041_partial_18_1344,
  ep_Q2_041_partial_18_1345,
  ep_Q2_041_partial_18_1346,
  ep_Q2_041_partial_18_1347,
  ep_Q2_041_partial_18_1348,
  ep_Q2_041_partial_18_1349,
  ep_Q2_041_partial_18_1350,
  ep_Q2_041_partial_18_1351,
  ep_Q2_041_partial_18_1352,
  ep_Q2_041_partial_18_1353,
  ep_Q2_041_partial_18_1354,
  ep_Q2_041_partial_18_1355,
  ep_Q2_041_partial_18_1356,
  ep_Q2_041_partial_18_1357,
  ep_Q2_041_partial_18_1358,
  ep_Q2_041_partial_18_1359,
  ep_Q2_041_partial_18_1360,
  ep_Q2_041_partial_18_1361,
  ep_Q2_041_partial_18_1362,
  ep_Q2_041_partial_18_1363,
  ep_Q2_041_partial_18_1364,
  ep_Q2_041_partial_18_1365,
  ep_Q2_041_partial_18_1366,
  ep_Q2_041_partial_18_1367,
  ep_Q2_041_partial_18_1368,
  ep_Q2_041_partial_18_1369,
  ep_Q2_041_partial_18_1370,
  ep_Q2_041_partial_18_1371,
  ep_Q2_041_partial_18_1372,
  ep_Q2_041_partial_18_1373,
  ep_Q2_041_partial_18_1374,
  ep_Q2_041_partial_18_1375,
  ep_Q2_041_partial_18_1376,
  ep_Q2_041_partial_18_1377,
  ep_Q2_041_partial_18_1378,
  ep_Q2_041_partial_18_1379,
  ep_Q2_041_partial_18_1380,
  ep_Q2_041_partial_18_1381,
  ep_Q2_041_partial_18_1382,
  ep_Q2_041_partial_18_1383,
  ep_Q2_041_partial_18_1384,
  ep_Q2_041_partial_18_1385,
  ep_Q2_041_partial_18_1386,
  ep_Q2_041_partial_18_1387,
  ep_Q2_041_partial_18_1388,
  ep_Q2_041_partial_18_1389,
  ep_Q2_041_partial_18_1390,
  ep_Q2_041_partial_18_1391,
  ep_Q2_041_partial_18_1392,
  ep_Q2_041_partial_18_1393,
  ep_Q2_041_partial_18_1394,
  ep_Q2_041_partial_18_1395,
  ep_Q2_041_partial_18_1396,
  ep_Q2_041_partial_18_1397,
  ep_Q2_041_partial_18_1398,
  ep_Q2_041_partial_18_1399
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_1300_1399 : Poly :=
[
  term ((-5570384737495893021951461108177222681926513046508764437986167360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((-22409412925411235207450758682335661246937968010566707242810240 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((670014291546921375679502514498517265242934666472702698008605820 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((3673408178262749086935378082250071300551246038542285018778317958165372130 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((29062677452928 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-651176155145368933122256664580785759537007286722321954634335200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (15, 4)],
  term ((-3913955906 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-6508776853579481570974976693309967886537538467006704442843520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (12, 2), (15, 2)],
  term ((1161510453722817939754536921237035528466317750511998329025199537818497002 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8057073648768 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((3605403227632542593842976278112697341269070757853549381229468800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((10810687876490040948400211329006241321561570698448680614457280 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((987330277001010478658339806642457606499308402770914613840074618993846047 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((4639968887712 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((35722465865007101445929022961612715443230966747163824800188066200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((45323710797955686960948470031322846347570591872867160760216145600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((851180477303031022702554109087694281910798358097060771461399920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((22409412925411235207450758682335661246937968010566707242810240 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((-5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 1), (13, 3), (15, 1)],
  term ((-47139427647628251759 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-3481464875180928798397417706838700849485158054461468917586582130855409000 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((257634551806464 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1966773939729882857929454708744825158271752629605517767323275200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 4)],
  term ((-3887123374 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((89709218421742273196 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 2)],
  term ((2372205112834200862377921379019203751837498688156928616996846860 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 2), (15, 2)],
  term ((9801955560 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((38536475766844239275815900863980908434432750680071962111637072870591498521 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((-43094292114176 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1053066870053980438801522608957413008203911059579448584061619520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 1), (15, 4)],
  term ((-51495653842955147677116407926098233757193018656661408686320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((-521585298541397765563017020502586504477965704647841169819805600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 2), (12, 1), (15, 3)],
  term ((894289218774553045855355954377221712584934014718319037647596960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-25283473523499121632470945979996575304694637845824289419060760 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((-52745954229939346366145148638249633639056993735273232361280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4623744485903015470152318350591219829675638326171253637194652800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 3)],
  term ((-1230894490682986749494678827377752010645176547445426513771840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((783503613866405149179620569723010864934388325275932027181293940 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (10, 1), (11, 2), (15, 3)],
  term ((-105253308157055691848 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1)],
  term ((132642962305277898556 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-521868447820723966285881549192135278786119572096268824863572780 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((9339463360 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-5036586587227862101945252085175159797487293194583553303883977803170984566 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((-36798874854528 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-205428386491484453978561512316025506330390201421325289376071840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (15, 4)],
  term ((-8731857128 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-428868112284869660888440247110287121367551007518520362658640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-144017803194862136164383492126311734062008689052824129014172100153856 : Rat) / 47966965841323451035541533271802758327623668915613656588050067527) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((-54912833280 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1218426630507216090721744122829765685740261299090712968142102240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 2), (15, 3)],
  term ((2521597038419921329922863573267361527353050623002876172422720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (12, 1), (13, 3), (15, 2)],
  term ((4580961414202624980467657969126166877939804860328078336531618175009131421 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((47359223708944 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((26955605082187103896810182002546676349265998901680160083267416485204530709 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((337410139814 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((18295506848853211068032389908806046148156889583243126882902920910559750 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 3)],
  term ((36283466222976 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((732393681724304635786562714262839897808195989917014716746560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (12, 2), (13, 1), (15, 2)],
  term ((-226519213564314119024 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1)],
  term ((-15949341440 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((208884629151629417589 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (13, 1)],
  term ((-414105687555791834682 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1940128607562075127010588309160003947239668723780478667319688414674535616 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-37022383351808 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-620463746775269703220570065235978082341486402753579516125419840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 4)],
  term ((-25416842148 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-75328752726002780140 : Rat) / 777005835365402853) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 2)],
  term ((-2800896043830342269308207157046270574608397690446937630185711740 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((-33577941760 : Rat) / 455291409) [(1, 1), (8, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((14716549900519591442899927354561631930207213173673692595160815802467785565 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-45280511440208 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-285871645618575974825717193131031297191599904203311292607500480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 1), (15, 4)],
  term ((15839127674 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((23881122596820461823420356670055732214141923539582047021073295700861178338 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((136575492924288 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((710736982163871544345861679421876989739632109982213917766858240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 3)],
  term ((-680043110228220513519580998375324633868046212693136128589520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 2), (14, 2), (15, 1)],
  term ((-648976382639244323454675117890558909266993334797360889346623081924931869 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1)],
  term ((-3996941845472 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-604941107394969745002947190074499087246261628814440481412186580 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 2), (15, 3)],
  term ((-194973752614921380972 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (13, 3)],
  term ((779895010459685523888 : Rat) / 259001945121800951) [(1, 1), (8, 1), (10, 1), (13, 3), (14, 1)],
  term ((-5800168449316213147191587235456561580940754281086938973434184480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 3), (14, 1), (15, 2)],
  term ((54912833280 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((65695169024190628410322379123100699804240398323557295365811720 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (10, 1), (13, 3), (15, 2)],
  term ((-13728208320 : Rat) / 151763803) [(1, 1), (8, 1), (10, 1), (13, 3), (16, 1)],
  term ((-2521597038419921329922863573267361527353050623002876172422720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 4), (14, 1), (15, 1)],
  term ((630399259604980332480715893316840381838262655750719043105680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 1), (13, 4), (15, 1)],
  term ((-28869971588593747430326744282236109817330732797456260523017902327237533069 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((251569104842780 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((152156420027994336261585091552540802481437458807933959362474901233556980 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((109588435090176 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((1685638353558183812485404117315220430854142066924163350114115640914060631 : Rat) / 74256892347499373372905278993545501322860959869558851945454900737468268) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1)],
  term ((-45002951466240 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((45233975272697377908773893837800780455079863796700803248921002781631241003 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (8, 1), (10, 1), (15, 1)],
  term ((-102919486134566 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1908699097282789923494453676380477357517138132333437018290995716654089008 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (10, 1), (15, 3)],
  term ((75840625997984 : Rat) / 275754830051) [(1, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((112565941960423643457955184431328387754518083644529429475360 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((-1377682986496945378085969414238658220779994164737145670612000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((2785192368747946510975730554088611340963256523254382218993083680 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 1), (15, 3)],
  term ((11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 1), (13, 2), (15, 2)],
  term ((-335007145773460687839751257249258632621467333236351349004302910 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1836704089131374543467689041125035650275623019271142509389158979082686065 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2)],
  term ((-14531338726464 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((325588077572684466561128332290392879768503643361160977317167600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (12, 1), (15, 4)],
  term ((1956977953 : Rat) / 151763803) [(1, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (12, 2), (15, 2)],
  term ((-580755226861408969877268460618517764233158875255999164512599768909248501 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((4028536824384 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1802701613816271296921488139056348670634535378926774690614734400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-5405343938245020474200105664503120660780785349224340307228640 : Rat) / 67321479313495425984879586780610574998465487050464258946217) [(1, 1), (10, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-987330277001010478658339806642457606499308402770914613840074618993846047 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2319984443856 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-17861232932503550722964511480806357721615483373581912400094033100 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 3)],
  term ((-22661855398977843480474235015661423173785295936433580380108072800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-425590238651515511351277054543847140955399179048530385730699960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (11, 1), (13, 2), (15, 2)],
  term ((-11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((2801176615676404400931344835291957655867246001320838405351280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 1), (13, 3), (15, 1)],
  term ((47139427647628251759 : Rat) / 518003890243601902) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((1740732437590464399198708853419350424742579027230734458793291065427704500 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-128817275903232 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((983386969864941428964727354372412579135876314802758883661637600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (14, 1), (15, 4)],
  term ((1943561687 : Rat) / 151763803) [(1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-44854609210871136598 : Rat) / 259001945121800951) [(1, 1), (10, 1), (11, 1), (14, 2)],
  term ((-1186102556417100431188960689509601875918749344078464308498423430 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(1, 1), (10, 1), (11, 1), (14, 2), (15, 2)],
  term ((-4900977780 : Rat) / 151763803) [(1, 1), (10, 1), (11, 1), (14, 2), (16, 1)],
  term ((-38536475766844239275815900863980908434432750680071962111637072870591498521 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 1), (11, 1), (15, 2)],
  term ((21547146057088 : Rat) / 275754830051) [(1, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((526533435026990219400761304478706504101955529789724292030809760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 1), (15, 4)],
  term ((25747826921477573838558203963049116878596509328330704343160 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 1)],
  term ((260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 2), (12, 1), (15, 3)],
  term ((-447144609387276522927677977188610856292467007359159518823798480 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((12641736761749560816235472989998287652347318922912144709530380 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (10, 1), (11, 2), (13, 1), (15, 2)],
  term ((26372977114969673183072574319124816819528496867636616180640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((2311872242951507735076159175295609914837819163085626818597326400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 2), (14, 1), (15, 3)],
  term ((615447245341493374747339413688876005322588273722713256885920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (11, 2), (14, 2), (15, 1)],
  term ((-391751806933202574589810284861505432467194162637966013590646970 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (10, 1), (11, 2), (15, 3)],
  term ((52626654078527845924 : Rat) / 259001945121800951) [(1, 1), (10, 1), (12, 1), (13, 1)],
  term ((-66321481152638949278 : Rat) / 259001945121800951) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((260934223910361983142940774596067639393059786048134412431786390 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4669731680 : Rat) / 151763803) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((2518293293613931050972626042587579898743646597291776651941988901585492283 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2)],
  term ((18399437427264 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((102714193245742226989280756158012753165195100710662644688035920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (12, 1), (13, 1), (15, 4)],
  term ((4365928564 : Rat) / 151763803) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((214434056142434830444220123555143560683775503759260181329320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((72008901597431068082191746063155867031004344526412064507086050076928 : Rat) / 47966965841323451035541533271802758327623668915613656588050067527) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((27456416640 : Rat) / 151763803) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-609213315253608045360872061414882842870130649545356484071051120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (12, 1), (13, 2), (15, 3)],
  term ((-1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (12, 1), (13, 3), (15, 2)],
  term ((-4580961414202624980467657969126166877939804860328078336531618175009131421 : Rat) / 7072084985476130797419550380337666792653424749481795423376657213092216) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-23679611854472 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-26955605082187103896810182002546676349265998901680160083267416485204530709 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 1), (12, 1), (15, 1)],
  term ((-168705069907 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-9147753424426605534016194954403023074078444791621563441451460455279875 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (10, 1), (12, 1), (15, 3)],
  term ((-18141733111488 : Rat) / 275754830051) [(1, 1), (10, 1), (12, 1), (15, 3), (16, 1)],
  term ((-366196840862152317893281357131419948904097994958507358373280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (12, 2), (13, 1), (15, 2)],
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((7974670720 : Rat) / 151763803) [(1, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-208884629151629417589 : Rat) / 518003890243601902) [(1, 1), (10, 1), (13, 1)],
  term ((207052843777895917341 : Rat) / 259001945121800951) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((970064303781037563505294154580001973619834361890239333659844207337267808 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((18511191675904 : Rat) / 275754830051) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((310231873387634851610285032617989041170743201376789758062709920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 1), (14, 1), (15, 4)],
  term ((12708421074 : Rat) / 151763803) [(1, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((37664376363001390070 : Rat) / 777005835365402853) [(1, 1), (10, 1), (13, 1), (14, 2)],
  term ((1400448021915171134654103578523135287304198845223468815092855870 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(1, 1), (10, 1), (13, 1), (14, 2), (15, 2)],
  term ((16788970880 : Rat) / 455291409) [(1, 1), (10, 1), (13, 1), (14, 2), (16, 1)],
  term ((-14716549900519591442899927354561631930207213173673692595160815802467785565 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((22640255720104 : Rat) / 275754830051) [(1, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((142935822809287987412858596565515648595799952101655646303750240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 1), (15, 4)],
  term ((-7919563837 : Rat) / 151763803) [(1, 1), (10, 1), (13, 1), (16, 1)],
  term ((-11940561298410230911710178335027866107070961769791023510536647850430589169 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((-68287746462144 : Rat) / 275754830051) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-355368491081935772172930839710938494869816054991106958883429120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 2), (14, 1), (15, 3)],
  term ((340021555114110256759790499187662316934023106346568064294760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (13, 2), (14, 2), (15, 1)],
  term ((648976382639244323454675117890558909266993334797360889346623081924931869 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((1998470922736 : Rat) / 275754830051) [(1, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((302470553697484872501473595037249543623130814407220240706093290 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 2), (15, 3)],
  term ((97486876307460690486 : Rat) / 259001945121800951) [(1, 1), (10, 1), (13, 3)],
  term ((-389947505229842761944 : Rat) / 259001945121800951) [(1, 1), (10, 1), (13, 3), (14, 1)],
  term ((2900084224658106573595793617728280790470377140543469486717092240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 3), (14, 1), (15, 2)],
  term ((-27456416640 : Rat) / 151763803) [(1, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((-32847584512095314205161189561550349902120199161778647682905860 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (10, 1), (13, 3), (15, 2)],
  term ((6864104160 : Rat) / 151763803) [(1, 1), (10, 1), (13, 3), (16, 1)],
  term ((1260798519209960664961431786633680763676525311501438086211360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (13, 4), (14, 1), (15, 1)],
  term ((-315199629802490166240357946658420190919131327875359521552840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 1), (13, 4), (15, 1)],
  term ((28869971588593747430326744282236109817330732797456260523017902327237533069 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((-125784552421390 : Rat) / 275754830051) [(1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-76078210013997168130792545776270401240718729403966979681237450616778490 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (14, 1), (15, 3)],
  term ((-54794217545088 : Rat) / 275754830051) [(1, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1685638353558183812485404117315220430854142066924163350114115640914060631 : Rat) / 148513784694998746745810557987091002645721919739117703890909801474936536) [(1, 1), (10, 1), (14, 2), (15, 1)],
  term ((22501475733120 : Rat) / 275754830051) [(1, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-45233975272697377908773893837800780455079863796700803248921002781631241003 : Rat) / 99009189796665831163873705324727335097147946492745135927273200983291024) [(1, 1), (10, 1), (15, 1)],
  term ((51459743067283 : Rat) / 275754830051) [(1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-954349548641394961747226838190238678758569066166718509145497858327044504 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (10, 1), (15, 3)],
  term ((-37920312998992 : Rat) / 275754830051) [(1, 1), (10, 1), (15, 3), (16, 1)],
  term ((-56282970980211821728977592215664193877259041822264714737680 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (10, 2), (11, 1), (12, 1), (15, 2)],
  term ((688841493248472689042984707119329110389997082368572835306000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (10, 2), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 1300 through 1399. -/
theorem ep_Q2_041_block_18_1300_1399_valid :
    checkProductSumEq ep_Q2_041_partials_18_1300_1399
      ep_Q2_041_block_18_1300_1399 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
