/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q1_009, term block 9:1800-1899

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q1_009`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ1009TermShards

/-- Generator polynomial 9 for endpoint certificate `ep_Q1_009`. -/
def ep_Q1_009_generator_09_1800_1899 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
]

/-- Coefficient term 1800 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1800 : Poly :=
[
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(6, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1800 for generator 9. -/
def ep_Q1_009_partial_09_1800 : Poly :=
[
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 63575628181339442486601007174807452342195040668907943386213932048572973599996984342021434911943149) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 3)],
  term ((59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(6, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1800 for generator 9. -/
theorem ep_Q1_009_partial_09_1800_valid :
    mulPoly ep_Q1_009_coefficient_09_1800
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1800 := by
  native_decide

/-- Coefficient term 1801 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1801 : Poly :=
[
  term ((748503516560904 : Rat) / 1395206957462413) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1801 for generator 9. -/
def ep_Q1_009_partial_09_1801 : Poly :=
[
  term ((1497007033121808 : Rat) / 1395206957462413) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-748503516560904 : Rat) / 1395206957462413) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1801 for generator 9. -/
theorem ep_Q1_009_partial_09_1801_valid :
    mulPoly ep_Q1_009_coefficient_09_1801
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1801 := by
  native_decide

/-- Coefficient term 1802 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1802 : Poly :=
[
  term ((-1104444645218897040092634881069702470569823431966808088759205289790787532869446589439782125739961525 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(6, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1802 for generator 9. -/
def ep_Q1_009_partial_09_1802 : Poly :=
[
  term ((-1104444645218897040092634881069702470569823431966808088759205289790787532869446589439782125739961525 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((1104444645218897040092634881069702470569823431966808088759205289790787532869446589439782125739961525 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(6, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1802 for generator 9. -/
theorem ep_Q1_009_partial_09_1802_valid :
    mulPoly ep_Q1_009_coefficient_09_1802
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1802 := by
  native_decide

/-- Coefficient term 1803 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1803 : Poly :=
[
  term ((1841057518296139 : Rat) / 1395206957462413) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1803 for generator 9. -/
def ep_Q1_009_partial_09_1803 : Poly :=
[
  term ((3682115036592278 : Rat) / 1395206957462413) [(2, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-1841057518296139 : Rat) / 1395206957462413) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1803 for generator 9. -/
theorem ep_Q1_009_partial_09_1803_valid :
    mulPoly ep_Q1_009_coefficient_09_1803
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1803 := by
  native_decide

/-- Coefficient term 1804 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1804 : Poly :=
[
  term ((2987079672569591968601141055744225993911355787790658551255680732101878285868161516664220872294107152199774079068447 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 1804 for generator 9. -/
def ep_Q1_009_partial_09_1804 : Poly :=
[
  term ((2987079672569591968601141055744225993911355787790658551255680732101878285868161516664220872294107152199774079068447 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-2987079672569591968601141055744225993911355787790658551255680732101878285868161516664220872294107152199774079068447 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1804 for generator 9. -/
theorem ep_Q1_009_partial_09_1804_valid :
    mulPoly ep_Q1_009_coefficient_09_1804
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1804 := by
  native_decide

/-- Coefficient term 1805 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1805 : Poly :=
[
  term ((14397934286703124344389 : Rat) / 2031704557077638197839) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1805 for generator 9. -/
def ep_Q1_009_partial_09_1805 : Poly :=
[
  term ((28795868573406248688778 : Rat) / 2031704557077638197839) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14397934286703124344389 : Rat) / 2031704557077638197839) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1805 for generator 9. -/
theorem ep_Q1_009_partial_09_1805_valid :
    mulPoly ep_Q1_009_coefficient_09_1805
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1805 := by
  native_decide

/-- Coefficient term 1806 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1806 : Poly :=
[
  term ((-191550014681230764662291475019064695621433776405837832873540725054988978046643700349224768750249683 : Rat) / 145315721557347297112230873542417033925017235814646727739917558968166796799993107067477565513012912) [(6, 1), (13, 1), (15, 3)]
]

/-- Partial product 1806 for generator 9. -/
def ep_Q1_009_partial_09_1806 : Poly :=
[
  term ((-191550014681230764662291475019064695621433776405837832873540725054988978046643700349224768750249683 : Rat) / 72657860778673648556115436771208516962508617907323363869958779484083398399996553533738782756506456) [(2, 1), (6, 1), (13, 1), (15, 3)],
  term ((191550014681230764662291475019064695621433776405837832873540725054988978046643700349224768750249683 : Rat) / 145315721557347297112230873542417033925017235814646727739917558968166796799993107067477565513012912) [(6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1806 for generator 9. -/
theorem ep_Q1_009_partial_09_1806_valid :
    mulPoly ep_Q1_009_coefficient_09_1806
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1806 := by
  native_decide

/-- Coefficient term 1807 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1807 : Poly :=
[
  term ((2262658977703735 : Rat) / 1395206957462413) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1807 for generator 9. -/
def ep_Q1_009_partial_09_1807 : Poly :=
[
  term ((4525317955407470 : Rat) / 1395206957462413) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-2262658977703735 : Rat) / 1395206957462413) [(6, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1807 for generator 9. -/
theorem ep_Q1_009_partial_09_1807_valid :
    mulPoly ep_Q1_009_coefficient_09_1807
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1807 := by
  native_decide

/-- Coefficient term 1808 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1808 : Poly :=
[
  term ((276622778980764526510053280183482549512275323808250444023757528709513443603720215150920301516294151 : Rat) / 1215190587364688893036152959662565868428752536594775638348708830201276511671094807819061241593344) [(6, 1), (13, 2)]
]

/-- Partial product 1808 for generator 9. -/
def ep_Q1_009_partial_09_1808 : Poly :=
[
  term ((276622778980764526510053280183482549512275323808250444023757528709513443603720215150920301516294151 : Rat) / 607595293682344446518076479831282934214376268297387819174354415100638255835547403909530620796672) [(2, 1), (6, 1), (13, 2)],
  term ((-276622778980764526510053280183482549512275323808250444023757528709513443603720215150920301516294151 : Rat) / 1215190587364688893036152959662565868428752536594775638348708830201276511671094807819061241593344) [(6, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1808 for generator 9. -/
theorem ep_Q1_009_partial_09_1808_valid :
    mulPoly ep_Q1_009_coefficient_09_1808
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1808 := by
  native_decide

/-- Coefficient term 1809 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1809 : Poly :=
[
  term ((-8790523859652245085563032702327823923112131849392334711150398906936882353 : Rat) / 17811434336709658123299100436463332082539035886972580333410972139885166040) [(6, 1), (13, 2), (14, 1)]
]

/-- Partial product 1809 for generator 9. -/
def ep_Q1_009_partial_09_1809 : Poly :=
[
  term ((-8790523859652245085563032702327823923112131849392334711150398906936882353 : Rat) / 8905717168354829061649550218231666041269517943486290166705486069942583020) [(2, 1), (6, 1), (13, 2), (14, 1)],
  term ((8790523859652245085563032702327823923112131849392334711150398906936882353 : Rat) / 17811434336709658123299100436463332082539035886972580333410972139885166040) [(6, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1809 for generator 9. -/
theorem ep_Q1_009_partial_09_1809_valid :
    mulPoly ep_Q1_009_coefficient_09_1809
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1809 := by
  native_decide

/-- Coefficient term 1810 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1810 : Poly :=
[
  term ((67072172845464898156427141073600 : Rat) / 3435605717361227895008739306438197) [(6, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1810 for generator 9. -/
def ep_Q1_009_partial_09_1810 : Poly :=
[
  term ((134144345690929796312854282147200 : Rat) / 3435605717361227895008739306438197) [(2, 1), (6, 1), (13, 2), (14, 1), (15, 2)],
  term ((-67072172845464898156427141073600 : Rat) / 3435605717361227895008739306438197) [(6, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1810 for generator 9. -/
theorem ep_Q1_009_partial_09_1810_valid :
    mulPoly ep_Q1_009_coefficient_09_1810
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1810 := by
  native_decide

/-- Coefficient term 1811 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1811 : Poly :=
[
  term ((270178606731792726074565447859402022945767563727609180216756874478861237751934187540676454090186587 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(6, 1), (13, 2), (15, 2)]
]

/-- Partial product 1811 for generator 9. -/
def ep_Q1_009_partial_09_1811 : Poly :=
[
  term ((270178606731792726074565447859402022945767563727609180216756874478861237751934187540676454090186587 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(2, 1), (6, 1), (13, 2), (15, 2)],
  term ((-270178606731792726074565447859402022945767563727609180216756874478861237751934187540676454090186587 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1811 for generator 9. -/
theorem ep_Q1_009_partial_09_1811_valid :
    mulPoly ep_Q1_009_coefficient_09_1811
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1811 := by
  native_decide

/-- Coefficient term 1812 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1812 : Poly :=
[
  term ((-990779063156415 : Rat) / 1395206957462413) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1812 for generator 9. -/
def ep_Q1_009_partial_09_1812 : Poly :=
[
  term ((-1981558126312830 : Rat) / 1395206957462413) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((990779063156415 : Rat) / 1395206957462413) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1812 for generator 9. -/
theorem ep_Q1_009_partial_09_1812_valid :
    mulPoly ep_Q1_009_coefficient_09_1812
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1812 := by
  native_decide

/-- Coefficient term 1813 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1813 : Poly :=
[
  term ((1690028857 : Rat) / 99021804) [(6, 1), (13, 2), (16, 1)]
]

/-- Partial product 1813 for generator 9. -/
def ep_Q1_009_partial_09_1813 : Poly :=
[
  term ((1690028857 : Rat) / 49510902) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-1690028857 : Rat) / 99021804) [(6, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1813 for generator 9. -/
theorem ep_Q1_009_partial_09_1813_valid :
    mulPoly ep_Q1_009_coefficient_09_1813
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1813 := by
  native_decide

/-- Coefficient term 1814 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1814 : Poly :=
[
  term ((-367965392693869927385954454501000 : Rat) / 24049240021528595265061175145067379) [(6, 1), (13, 3), (15, 1)]
]

/-- Partial product 1814 for generator 9. -/
def ep_Q1_009_partial_09_1814 : Poly :=
[
  term ((-735930785387739854771908909002000 : Rat) / 24049240021528595265061175145067379) [(2, 1), (6, 1), (13, 3), (15, 1)],
  term ((367965392693869927385954454501000 : Rat) / 24049240021528595265061175145067379) [(6, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1814 for generator 9. -/
theorem ep_Q1_009_partial_09_1814_valid :
    mulPoly ep_Q1_009_coefficient_09_1814
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1814 := by
  native_decide

/-- Coefficient term 1815 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1815 : Poly :=
[
  term ((6662935315120513786674332061450611599858552080755020657808422438741419734065357613594398717289704961 : Rat) / 12151905873646888930361529596625658684287525365947756383487088302012765116710948078190612415933440) [(6, 1), (14, 1)]
]

/-- Partial product 1815 for generator 9. -/
def ep_Q1_009_partial_09_1815 : Poly :=
[
  term ((6662935315120513786674332061450611599858552080755020657808422438741419734065357613594398717289704961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(2, 1), (6, 1), (14, 1)],
  term ((-6662935315120513786674332061450611599858552080755020657808422438741419734065357613594398717289704961 : Rat) / 12151905873646888930361529596625658684287525365947756383487088302012765116710948078190612415933440) [(6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1815 for generator 9. -/
theorem ep_Q1_009_partial_09_1815_valid :
    mulPoly ep_Q1_009_coefficient_09_1815
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1815 := by
  native_decide

/-- Coefficient term 1816 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1816 : Poly :=
[
  term ((-4371557128013147515984481622773241387769570056633136845689261237219842209863938420362589195721023827311262287886047 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(6, 1), (14, 1), (15, 2)]
]

/-- Partial product 1816 for generator 9. -/
def ep_Q1_009_partial_09_1816 : Poly :=
[
  term ((-4371557128013147515984481622773241387769570056633136845689261237219842209863938420362589195721023827311262287886047 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((4371557128013147515984481622773241387769570056633136845689261237219842209863938420362589195721023827311262287886047 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(6, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1816 for generator 9. -/
theorem ep_Q1_009_partial_09_1816_valid :
    mulPoly ep_Q1_009_coefficient_09_1816
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1816 := by
  native_decide

/-- Coefficient term 1817 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1817 : Poly :=
[
  term ((-68985923077573472599889 : Rat) / 1354469704718425465226) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1817 for generator 9. -/
def ep_Q1_009_partial_09_1817 : Poly :=
[
  term ((-68985923077573472599889 : Rat) / 677234852359212732613) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((68985923077573472599889 : Rat) / 1354469704718425465226) [(6, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1817 for generator 9. -/
theorem ep_Q1_009_partial_09_1817_valid :
    mulPoly ep_Q1_009_coefficient_09_1817
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1817 := by
  native_decide

/-- Coefficient term 1818 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1818 : Poly :=
[
  term ((3580960609 : Rat) / 66014536) [(6, 1), (14, 1), (16, 1)]
]

/-- Partial product 1818 for generator 9. -/
def ep_Q1_009_partial_09_1818 : Poly :=
[
  term ((3580960609 : Rat) / 33007268) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((-3580960609 : Rat) / 66014536) [(6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1818 for generator 9. -/
theorem ep_Q1_009_partial_09_1818_valid :
    mulPoly ep_Q1_009_coefficient_09_1818
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1818 := by
  native_decide

/-- Coefficient term 1819 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1819 : Poly :=
[
  term ((684420690243799178045620294414987917064283018594087467 : Rat) / 285071954829622879643311256928356724175362184887277392) [(6, 1), (14, 2), (15, 2)]
]

/-- Partial product 1819 for generator 9. -/
def ep_Q1_009_partial_09_1819 : Poly :=
[
  term ((684420690243799178045620294414987917064283018594087467 : Rat) / 142535977414811439821655628464178362087681092443638696) [(2, 1), (6, 1), (14, 2), (15, 2)],
  term ((-684420690243799178045620294414987917064283018594087467 : Rat) / 285071954829622879643311256928356724175362184887277392) [(6, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1819 for generator 9. -/
theorem ep_Q1_009_partial_09_1819_valid :
    mulPoly ep_Q1_009_coefficient_09_1819
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1819 := by
  native_decide

/-- Coefficient term 1820 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1820 : Poly :=
[
  term ((-3755048164334233 : Rat) / 1395206957462413) [(6, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1820 for generator 9. -/
def ep_Q1_009_partial_09_1820 : Poly :=
[
  term ((-7510096328668466 : Rat) / 1395206957462413) [(2, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((3755048164334233 : Rat) / 1395206957462413) [(6, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1820 for generator 9. -/
theorem ep_Q1_009_partial_09_1820_valid :
    mulPoly ep_Q1_009_coefficient_09_1820
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1820 := by
  native_decide

/-- Coefficient term 1821 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1821 : Poly :=
[
  term ((-1518843439268860166891981972289361029224906330655530568333279867754723031229348896488989829120909116461156759688287 : Rat) / 4202987368315502509327920313825203923012617977292613261503169655801418384209239360872218238909222096495107048960) [(6, 1), (15, 2)]
]

/-- Partial product 1821 for generator 9. -/
def ep_Q1_009_partial_09_1821 : Poly :=
[
  term ((-1518843439268860166891981972289361029224906330655530568333279867754723031229348896488989829120909116461156759688287 : Rat) / 2101493684157751254663960156912601961506308988646306630751584827900709192104619680436109119454611048247553524480) [(2, 1), (6, 1), (15, 2)],
  term ((1518843439268860166891981972289361029224906330655530568333279867754723031229348896488989829120909116461156759688287 : Rat) / 4202987368315502509327920313825203923012617977292613261503169655801418384209239360872218238909222096495107048960) [(6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1821 for generator 9. -/
theorem ep_Q1_009_partial_09_1821_valid :
    mulPoly ep_Q1_009_coefficient_09_1821
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1821 := by
  native_decide

/-- Coefficient term 1822 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1822 : Poly :=
[
  term ((-6518957586792411530071 : Rat) / 193495672102632209318) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 1822 for generator 9. -/
def ep_Q1_009_partial_09_1822 : Poly :=
[
  term ((-6518957586792411530071 : Rat) / 96747836051316104659) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((6518957586792411530071 : Rat) / 193495672102632209318) [(6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1822 for generator 9. -/
theorem ep_Q1_009_partial_09_1822_valid :
    mulPoly ep_Q1_009_coefficient_09_1822
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1822 := by
  native_decide

/-- Coefficient term 1823 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1823 : Poly :=
[
  term ((-493518740573594331488581682822153815936238740983478748762411434890100985600794213122836606706130225 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(6, 1), (15, 4)]
]

/-- Partial product 1823 for generator 9. -/
def ep_Q1_009_partial_09_1823 : Poly :=
[
  term ((-493518740573594331488581682822153815936238740983478748762411434890100985600794213122836606706130225 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (6, 1), (15, 4)],
  term ((493518740573594331488581682822153815936238740983478748762411434890100985600794213122836606706130225 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1823 for generator 9. -/
theorem ep_Q1_009_partial_09_1823_valid :
    mulPoly ep_Q1_009_coefficient_09_1823
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1823 := by
  native_decide

/-- Coefficient term 1824 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1824 : Poly :=
[
  term ((775687799328637 : Rat) / 1395206957462413) [(6, 1), (15, 4), (16, 1)]
]

/-- Partial product 1824 for generator 9. -/
def ep_Q1_009_partial_09_1824 : Poly :=
[
  term ((1551375598657274 : Rat) / 1395206957462413) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((-775687799328637 : Rat) / 1395206957462413) [(6, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1824 for generator 9. -/
theorem ep_Q1_009_partial_09_1824_valid :
    mulPoly ep_Q1_009_coefficient_09_1824
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1824 := by
  native_decide

/-- Coefficient term 1825 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1825 : Poly :=
[
  term ((1179091783 : Rat) / 198043608) [(6, 1), (16, 1)]
]

/-- Partial product 1825 for generator 9. -/
def ep_Q1_009_partial_09_1825 : Poly :=
[
  term ((1179091783 : Rat) / 99021804) [(2, 1), (6, 1), (16, 1)],
  term ((-1179091783 : Rat) / 198043608) [(6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1825 for generator 9. -/
theorem ep_Q1_009_partial_09_1825_valid :
    mulPoly ep_Q1_009_coefficient_09_1825
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1825 := by
  native_decide

/-- Coefficient term 1826 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1826 : Poly :=
[
  term ((3687486922590734366305543911824540 : Rat) / 30920451456251051055078653757943773) [(6, 2), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1826 for generator 9. -/
def ep_Q1_009_partial_09_1826 : Poly :=
[
  term ((7374973845181468732611087823649080 : Rat) / 30920451456251051055078653757943773) [(2, 1), (6, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3687486922590734366305543911824540 : Rat) / 30920451456251051055078653757943773) [(6, 2), (8, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1826 for generator 9. -/
theorem ep_Q1_009_partial_09_1826_valid :
    mulPoly ep_Q1_009_coefficient_09_1826
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1826 := by
  native_decide

/-- Coefficient term 1827 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1827 : Poly :=
[
  term ((-1533973053064365228214078282057725776005918013406902491167288161254332604696290918672545971253569 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(6, 2), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 1827 for generator 9. -/
def ep_Q1_009_partial_09_1827 : Poly :=
[
  term ((-1533973053064365228214078282057725776005918013406902491167288161254332604696290918672545971253569 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (6, 2), (8, 1), (13, 1), (15, 1)],
  term ((1533973053064365228214078282057725776005918013406902491167288161254332604696290918672545971253569 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(6, 2), (8, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1827 for generator 9. -/
theorem ep_Q1_009_partial_09_1827_valid :
    mulPoly ep_Q1_009_coefficient_09_1827
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1827 := by
  native_decide

/-- Coefficient term 1828 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1828 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 247778748475115287936009890990686151049526160563628243862878900211472146794829136634911714048) [(6, 2), (8, 1), (15, 2)]
]

/-- Partial product 1828 for generator 9. -/
def ep_Q1_009_partial_09_1828 : Poly :=
[
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 123889374237557643968004945495343075524763080281814121931439450105736073397414568317455857024) [(2, 1), (6, 2), (8, 1), (15, 2)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 247778748475115287936009890990686151049526160563628243862878900211472146794829136634911714048) [(6, 2), (8, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1828 for generator 9. -/
theorem ep_Q1_009_partial_09_1828_valid :
    mulPoly ep_Q1_009_coefficient_09_1828
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1828 := by
  native_decide

/-- Coefficient term 1829 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1829 : Poly :=
[
  term ((-12169398189074254553851152994980829832434991898801917994388706680742717879648372761290065987144555081092746721927 : Rat) / 773230952599428514881143811939114635164458922406241638203408213259296178673846645272280172434430511710086236160) [(6, 2), (9, 1), (13, 1)]
]

/-- Partial product 1829 for generator 9. -/
def ep_Q1_009_partial_09_1829 : Poly :=
[
  term ((-12169398189074254553851152994980829832434991898801917994388706680742717879648372761290065987144555081092746721927 : Rat) / 386615476299714257440571905969557317582229461203120819101704106629648089336923322636140086217215255855043118080) [(2, 1), (6, 2), (9, 1), (13, 1)],
  term ((12169398189074254553851152994980829832434991898801917994388706680742717879648372761290065987144555081092746721927 : Rat) / 773230952599428514881143811939114635164458922406241638203408213259296178673846645272280172434430511710086236160) [(6, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1829 for generator 9. -/
theorem ep_Q1_009_partial_09_1829_valid :
    mulPoly ep_Q1_009_coefficient_09_1829
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1829 := by
  native_decide

/-- Coefficient term 1830 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1830 : Poly :=
[
  term ((1714692261367085162679200362606484613992660014898241523732036857393723507176988550318344395946651196850773516973 : Rat) / 57992321444957138616085785895433597637334419180468122865255615994447213400538498395421012932582288378256467712) [(6, 2), (9, 1), (13, 1), (14, 1)]
]

/-- Partial product 1830 for generator 9. -/
def ep_Q1_009_partial_09_1830 : Poly :=
[
  term ((1714692261367085162679200362606484613992660014898241523732036857393723507176988550318344395946651196850773516973 : Rat) / 28996160722478569308042892947716798818667209590234061432627807997223606700269249197710506466291144189128233856) [(2, 1), (6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-1714692261367085162679200362606484613992660014898241523732036857393723507176988550318344395946651196850773516973 : Rat) / 57992321444957138616085785895433597637334419180468122865255615994447213400538498395421012932582288378256467712) [(6, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1830 for generator 9. -/
theorem ep_Q1_009_partial_09_1830_valid :
    mulPoly ep_Q1_009_coefficient_09_1830
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1830 := by
  native_decide

/-- Coefficient term 1831 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1831 : Poly :=
[
  term ((-73350087848026117544728 : Rat) / 4676338877845046513121) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1831 for generator 9. -/
def ep_Q1_009_partial_09_1831 : Poly :=
[
  term ((-146700175696052235089456 : Rat) / 4676338877845046513121) [(2, 1), (6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((73350087848026117544728 : Rat) / 4676338877845046513121) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1831 for generator 9. -/
theorem ep_Q1_009_partial_09_1831_valid :
    mulPoly ep_Q1_009_coefficient_09_1831
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1831 := by
  native_decide

/-- Coefficient term 1832 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1832 : Poly :=
[
  term ((-3562419827301784560671469632990244348800 : Rat) / 5002939352438572144395411204253221785991) [(6, 2), (9, 1), (13, 1), (15, 2)]
]

/-- Partial product 1832 for generator 9. -/
def ep_Q1_009_partial_09_1832 : Poly :=
[
  term ((-7124839654603569121342939265980488697600 : Rat) / 5002939352438572144395411204253221785991) [(2, 1), (6, 2), (9, 1), (13, 1), (15, 2)],
  term ((3562419827301784560671469632990244348800 : Rat) / 5002939352438572144395411204253221785991) [(6, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1832 for generator 9. -/
theorem ep_Q1_009_partial_09_1832_valid :
    mulPoly ep_Q1_009_coefficient_09_1832
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1832 := by
  native_decide

/-- Coefficient term 1833 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1833 : Poly :=
[
  term ((31829482665033950839475 : Rat) / 3117559251896697675414) [(6, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 1833 for generator 9. -/
def ep_Q1_009_partial_09_1833 : Poly :=
[
  term ((31829482665033950839475 : Rat) / 1558779625948348837707) [(2, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-31829482665033950839475 : Rat) / 3117559251896697675414) [(6, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1833 for generator 9. -/
theorem ep_Q1_009_partial_09_1833_valid :
    mulPoly ep_Q1_009_coefficient_09_1833
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1833 := by
  native_decide

/-- Coefficient term 1834 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1834 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 105410395858499069756317029609697322815006875050503052852557973497518543046125196930186112) [(6, 2), (9, 1), (15, 1)]
]

/-- Partial product 1834 for generator 9. -/
def ep_Q1_009_partial_09_1834 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 52705197929249534878158514804848661407503437525251526426278986748759271523062598465093056) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 105410395858499069756317029609697322815006875050503052852557973497518543046125196930186112) [(6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1834 for generator 9. -/
theorem ep_Q1_009_partial_09_1834_valid :
    mulPoly ep_Q1_009_coefficient_09_1834
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1834 := by
  native_decide

/-- Coefficient term 1835 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1835 : Poly :=
[
  term ((-8591484309709713063616078679113120000 : Rat) / 238235207258979625923591009726343894571) [(6, 2), (9, 1), (15, 3)]
]

/-- Partial product 1835 for generator 9. -/
def ep_Q1_009_partial_09_1835 : Poly :=
[
  term ((-17182968619419426127232157358226240000 : Rat) / 238235207258979625923591009726343894571) [(2, 1), (6, 2), (9, 1), (15, 3)],
  term ((8591484309709713063616078679113120000 : Rat) / 238235207258979625923591009726343894571) [(6, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1835 for generator 9. -/
theorem ep_Q1_009_partial_09_1835_valid :
    mulPoly ep_Q1_009_coefficient_09_1835
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1835 := by
  native_decide

/-- Coefficient term 1836 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1836 : Poly :=
[
  term ((240288305598895558716027964628613680940699067407081 : Rat) / 232901923880410849381790242588526735437387405953658) [(6, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1836 for generator 9. -/
def ep_Q1_009_partial_09_1836 : Poly :=
[
  term ((240288305598895558716027964628613680940699067407081 : Rat) / 116450961940205424690895121294263367718693702976829) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-240288305598895558716027964628613680940699067407081 : Rat) / 232901923880410849381790242588526735437387405953658) [(6, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1836 for generator 9. -/
theorem ep_Q1_009_partial_09_1836_valid :
    mulPoly ep_Q1_009_coefficient_09_1836
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1836 := by
  native_decide

/-- Coefficient term 1837 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1837 : Poly :=
[
  term ((-1975738223120636 : Rat) / 1395206957462413) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1837 for generator 9. -/
def ep_Q1_009_partial_09_1837 : Poly :=
[
  term ((-3951476446241272 : Rat) / 1395206957462413) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1975738223120636 : Rat) / 1395206957462413) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1837 for generator 9. -/
theorem ep_Q1_009_partial_09_1837_valid :
    mulPoly ep_Q1_009_coefficient_09_1837
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1837 := by
  native_decide

/-- Coefficient term 1838 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1838 : Poly :=
[
  term ((-12750899481129987319291550089854322190667668205637276537277897684724275236557053650517714441553537378351201278855491 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(6, 2), (13, 1), (15, 1)]
]

/-- Partial product 1838 for generator 9. -/
def ep_Q1_009_partial_09_1838 : Poly :=
[
  term ((-12750899481129987319291550089854322190667668205637276537277897684724275236557053650517714441553537378351201278855491 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((12750899481129987319291550089854322190667668205637276537277897684724275236557053650517714441553537378351201278855491 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(6, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1838 for generator 9. -/
theorem ep_Q1_009_partial_09_1838_valid :
    mulPoly ep_Q1_009_coefficient_09_1838
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1838 := by
  native_decide

/-- Coefficient term 1839 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1839 : Poly :=
[
  term ((-174249540956982678905437 : Rat) / 2031704557077638197839) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1839 for generator 9. -/
def ep_Q1_009_partial_09_1839 : Poly :=
[
  term ((-348499081913965357810874 : Rat) / 2031704557077638197839) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((174249540956982678905437 : Rat) / 2031704557077638197839) [(6, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1839 for generator 9. -/
theorem ep_Q1_009_partial_09_1839_valid :
    mulPoly ep_Q1_009_coefficient_09_1839
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1839 := by
  native_decide

/-- Coefficient term 1840 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1840 : Poly :=
[
  term ((24530758996544628450945932313404007581149427591995039909319088002817133 : Rat) / 4190925726284625440776258926226666372362126091052371843155522856443568480) [(6, 2), (13, 2)]
]

/-- Partial product 1840 for generator 9. -/
def ep_Q1_009_partial_09_1840 : Poly :=
[
  term ((24530758996544628450945932313404007581149427591995039909319088002817133 : Rat) / 2095462863142312720388129463113333186181063045526185921577761428221784240) [(2, 1), (6, 2), (13, 2)],
  term ((-24530758996544628450945932313404007581149427591995039909319088002817133 : Rat) / 4190925726284625440776258926226666372362126091052371843155522856443568480) [(6, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1840 for generator 9. -/
theorem ep_Q1_009_partial_09_1840_valid :
    mulPoly ep_Q1_009_coefficient_09_1840
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1840 := by
  native_decide

/-- Coefficient term 1841 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1841 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 284508907359193034480686605635283278719430157377348264534023099134425849954740451037002433547648) [(6, 2), (15, 2)]
]

/-- Partial product 1841 for generator 9. -/
def ep_Q1_009_partial_09_1841 : Poly :=
[
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 142254453679596517240343302817641639359715078688674132267011549567212924977370225518501216773824) [(2, 1), (6, 2), (15, 2)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 284508907359193034480686605635283278719430157377348264534023099134425849954740451037002433547648) [(6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1841 for generator 9. -/
theorem ep_Q1_009_partial_09_1841_valid :
    mulPoly ep_Q1_009_coefficient_09_1841
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1841 := by
  native_decide

/-- Coefficient term 1842 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1842 : Poly :=
[
  term ((-4305225 : Rat) / 1178831) [(6, 2), (15, 2), (16, 1)]
]

/-- Partial product 1842 for generator 9. -/
def ep_Q1_009_partial_09_1842 : Poly :=
[
  term ((-8610450 : Rat) / 1178831) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((4305225 : Rat) / 1178831) [(6, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1842 for generator 9. -/
theorem ep_Q1_009_partial_09_1842_valid :
    mulPoly ep_Q1_009_coefficient_09_1842
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1842 := by
  native_decide

/-- Coefficient term 1843 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1843 : Poly :=
[
  term ((-84630942298619699836782859980681091844505631662244264922455491483681183537054821068726531132699 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 1843 for generator 9. -/
def ep_Q1_009_partial_09_1843 : Poly :=
[
  term ((-84630942298619699836782859980681091844505631662244264922455491483681183537054821068726531132699 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((84630942298619699836782859980681091844505631662244264922455491483681183537054821068726531132699 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 1), (8, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1843 for generator 9. -/
theorem ep_Q1_009_partial_09_1843_valid :
    mulPoly ep_Q1_009_coefficient_09_1843
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1843 := by
  native_decide

/-- Coefficient term 1844 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1844 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1844 for generator 9. -/
def ep_Q1_009_partial_09_1844 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1844 for generator 9. -/
theorem ep_Q1_009_partial_09_1844_valid :
    mulPoly ep_Q1_009_coefficient_09_1844
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1844 := by
  native_decide

/-- Coefficient term 1845 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1845 : Poly :=
[
  term ((2014543285884278623857061038382987255141615004974593017484996450196116462302060278093546984237 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 1845 for generator 9. -/
def ep_Q1_009_partial_09_1845 : Poly :=
[
  term ((2014543285884278623857061038382987255141615004974593017484996450196116462302060278093546984237 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-2014543285884278623857061038382987255141615004974593017484996450196116462302060278093546984237 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1845 for generator 9. -/
theorem ep_Q1_009_partial_09_1845_valid :
    mulPoly ep_Q1_009_coefficient_09_1845
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1845 := by
  native_decide

/-- Coefficient term 1846 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1846 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 32794246121706435168001309101708461168319638898127267570086913263283078252256797495797138624) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1846 for generator 9. -/
def ep_Q1_009_partial_09_1846 : Poly :=
[
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 16397123060853217584000654550854230584159819449063633785043456631641539126128398747898569312) [(2, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 32794246121706435168001309101708461168319638898127267570086913263283078252256797495797138624) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1846 for generator 9. -/
theorem ep_Q1_009_partial_09_1846_valid :
    mulPoly ep_Q1_009_coefficient_09_1846
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1846 := by
  native_decide

/-- Coefficient term 1847 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1847 : Poly :=
[
  term ((-3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 1847 for generator 9. -/
def ep_Q1_009_partial_09_1847 : Poly :=
[
  term ((-3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1847 for generator 9. -/
theorem ep_Q1_009_partial_09_1847_valid :
    mulPoly ep_Q1_009_coefficient_09_1847
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1847 := by
  native_decide

/-- Coefficient term 1848 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1848 : Poly :=
[
  term ((1097777345943255900401211723952676 : Rat) / 10306817152083683685026217919314591) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 1848 for generator 9. -/
def ep_Q1_009_partial_09_1848 : Poly :=
[
  term ((2195554691886511800802423447905352 : Rat) / 10306817152083683685026217919314591) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1097777345943255900401211723952676 : Rat) / 10306817152083683685026217919314591) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1848 for generator 9. -/
theorem ep_Q1_009_partial_09_1848_valid :
    mulPoly ep_Q1_009_coefficient_09_1848
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1848 := by
  native_decide

/-- Coefficient term 1849 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1849 : Poly :=
[
  term ((-1004329008927637502804788700238460248761068624053580454964991112815340414026408980833706818138081 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1849 for generator 9. -/
def ep_Q1_009_partial_09_1849 : Poly :=
[
  term ((-1004329008927637502804788700238460248761068624053580454964991112815340414026408980833706818138081 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((1004329008927637502804788700238460248761068624053580454964991112815340414026408980833706818138081 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1849 for generator 9. -/
theorem ep_Q1_009_partial_09_1849_valid :
    mulPoly ep_Q1_009_coefficient_09_1849
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1849 := by
  native_decide

/-- Coefficient term 1850 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1850 : Poly :=
[
  term ((-1875633008370292864287147179006201281494801732082853398080761929061241265937683967522464803817 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1850 for generator 9. -/
def ep_Q1_009_partial_09_1850 : Poly :=
[
  term ((-1875633008370292864287147179006201281494801732082853398080761929061241265937683967522464803817 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((1875633008370292864287147179006201281494801732082853398080761929061241265937683967522464803817 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1850 for generator 9. -/
theorem ep_Q1_009_partial_09_1850_valid :
    mulPoly ep_Q1_009_coefficient_09_1850
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1850 := by
  native_decide

/-- Coefficient term 1851 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1851 : Poly :=
[
  term ((-121454689929318142610175590778387267267356474926649722627413816286277322452450924710088544592985 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1851 for generator 9. -/
def ep_Q1_009_partial_09_1851 : Poly :=
[
  term ((-121454689929318142610175590778387267267356474926649722627413816286277322452450924710088544592985 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(2, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((121454689929318142610175590778387267267356474926649722627413816286277322452450924710088544592985 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1851 for generator 9. -/
theorem ep_Q1_009_partial_09_1851_valid :
    mulPoly ep_Q1_009_coefficient_09_1851
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1851 := by
  native_decide

/-- Coefficient term 1852 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1852 : Poly :=
[
  term ((-112157181185961069034232320539432 : Rat) / 3435605717361227895008739306438197) [(7, 1), (8, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 1852 for generator 9. -/
def ep_Q1_009_partial_09_1852 : Poly :=
[
  term ((-224314362371922138068464641078864 : Rat) / 3435605717361227895008739306438197) [(2, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((112157181185961069034232320539432 : Rat) / 3435605717361227895008739306438197) [(7, 1), (8, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1852 for generator 9. -/
theorem ep_Q1_009_partial_09_1852_valid :
    mulPoly ep_Q1_009_coefficient_09_1852
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1852 := by
  native_decide

/-- Coefficient term 1853 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1853 : Poly :=
[
  term ((-170231922838157366875076737443743502982439893843546600756584910139434925751769119127776344885297 : Rat) / 5203353717977421046656207710804409172040049371836193121120456904440915082691411869333145995008) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1853 for generator 9. -/
def ep_Q1_009_partial_09_1853 : Poly :=
[
  term ((-170231922838157366875076737443743502982439893843546600756584910139434925751769119127776344885297 : Rat) / 2601676858988710523328103855402204586020024685918096560560228452220457541345705934666572997504) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((170231922838157366875076737443743502982439893843546600756584910139434925751769119127776344885297 : Rat) / 5203353717977421046656207710804409172040049371836193121120456904440915082691411869333145995008) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1853 for generator 9. -/
theorem ep_Q1_009_partial_09_1853_valid :
    mulPoly ep_Q1_009_coefficient_09_1853
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1853 := by
  native_decide

/-- Coefficient term 1854 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1854 : Poly :=
[
  term ((-15121036495254116810278499077240950229660460657512067809559007432410133089671357601435725537987 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (12, 1), (15, 3)]
]

/-- Partial product 1854 for generator 9. -/
def ep_Q1_009_partial_09_1854 : Poly :=
[
  term ((-15121036495254116810278499077240950229660460657512067809559007432410133089671357601435725537987 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 3)],
  term ((15121036495254116810278499077240950229660460657512067809559007432410133089671357601435725537987 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1854 for generator 9. -/
theorem ep_Q1_009_partial_09_1854_valid :
    mulPoly ep_Q1_009_coefficient_09_1854
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1854 := by
  native_decide

/-- Coefficient term 1855 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1855 : Poly :=
[
  term ((1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (12, 2), (14, 1), (15, 1)]
]

/-- Partial product 1855 for generator 9. -/
def ep_Q1_009_partial_09_1855 : Poly :=
[
  term ((2977559401718826073940389265521712 : Rat) / 30920451456251051055078653757943773) [(2, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1855 for generator 9. -/
theorem ep_Q1_009_partial_09_1855_valid :
    mulPoly ep_Q1_009_coefficient_09_1855
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1855 := by
  native_decide

/-- Coefficient term 1856 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1856 : Poly :=
[
  term ((-102031109957887275654661120653739133464833174817175023932325028582471078719302783031955021481595 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(7, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 1856 for generator 9. -/
def ep_Q1_009_partial_09_1856 : Poly :=
[
  term ((-102031109957887275654661120653739133464833174817175023932325028582471078719302783031955021481595 : Rat) / 5203353717977421046656207710804409172040049371836193121120456904440915082691411869333145995008) [(2, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((102031109957887275654661120653739133464833174817175023932325028582471078719302783031955021481595 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(7, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1856 for generator 9. -/
theorem ep_Q1_009_partial_09_1856_valid :
    mulPoly ep_Q1_009_coefficient_09_1856
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1856 := by
  native_decide

/-- Coefficient term 1857 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1857 : Poly :=
[
  term ((101974740386151652737210598175421583866790846395225950043221747101211294860469052862322488727437 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 1857 for generator 9. -/
def ep_Q1_009_partial_09_1857 : Poly :=
[
  term ((101974740386151652737210598175421583866790846395225950043221747101211294860469052862322488727437 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((-101974740386151652737210598175421583866790846395225950043221747101211294860469052862322488727437 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 1), (8, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1857 for generator 9. -/
theorem ep_Q1_009_partial_09_1857_valid :
    mulPoly ep_Q1_009_coefficient_09_1857
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1857 := by
  native_decide

/-- Coefficient term 1858 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1858 : Poly :=
[
  term ((-954591076836921277997567333705384484577042162079771878264735668768169862589896808838002144921497 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1858 for generator 9. -/
def ep_Q1_009_partial_09_1858 : Poly :=
[
  term ((-954591076836921277997567333705384484577042162079771878264735668768169862589896808838002144921497 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((954591076836921277997567333705384484577042162079771878264735668768169862589896808838002144921497 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1858 for generator 9. -/
theorem ep_Q1_009_partial_09_1858_valid :
    mulPoly ep_Q1_009_coefficient_09_1858
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1858 := by
  native_decide

/-- Coefficient term 1859 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1859 : Poly :=
[
  term ((4597638162067340387728769077111247365313746132885300332108950899476829710629545695912581683237 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1859 for generator 9. -/
def ep_Q1_009_partial_09_1859 : Poly :=
[
  term ((4597638162067340387728769077111247365313746132885300332108950899476829710629545695912581683237 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-4597638162067340387728769077111247365313746132885300332108950899476829710629545695912581683237 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1859 for generator 9. -/
theorem ep_Q1_009_partial_09_1859_valid :
    mulPoly ep_Q1_009_coefficient_09_1859
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1859 := by
  native_decide

/-- Coefficient term 1860 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1860 : Poly :=
[
  term ((100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 1), (8, 1), (13, 1), (14, 2)]
]

/-- Partial product 1860 for generator 9. -/
def ep_Q1_009_partial_09_1860 : Poly :=
[
  term ((100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 2)],
  term ((-100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1860 for generator 9. -/
theorem ep_Q1_009_partial_09_1860_valid :
    mulPoly ep_Q1_009_coefficient_09_1860
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1860 := by
  native_decide

/-- Coefficient term 1861 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1861 : Poly :=
[
  term ((163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(7, 1), (8, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1861 for generator 9. -/
def ep_Q1_009_partial_09_1861 : Poly :=
[
  term ((327430788838880981122613390433216 : Rat) / 3435605717361227895008739306438197) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((-163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(7, 1), (8, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1861 for generator 9. -/
theorem ep_Q1_009_partial_09_1861_valid :
    mulPoly ep_Q1_009_coefficient_09_1861
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1861 := by
  native_decide

/-- Coefficient term 1862 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1862 : Poly :=
[
  term ((1854158158482560392622631208396187055450034274955428490548446671598180105701752406807739944937 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 1862 for generator 9. -/
def ep_Q1_009_partial_09_1862 : Poly :=
[
  term ((1854158158482560392622631208396187055450034274955428490548446671598180105701752406807739944937 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(2, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-1854158158482560392622631208396187055450034274955428490548446671598180105701752406807739944937 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(7, 1), (8, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1862 for generator 9. -/
theorem ep_Q1_009_partial_09_1862_valid :
    mulPoly ep_Q1_009_coefficient_09_1862
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1862 := by
  native_decide

/-- Coefficient term 1863 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1863 : Poly :=
[
  term ((4020701859552707943385560394208866508383013672417841906175040923423682321185156278813279850855 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1863 for generator 9. -/
def ep_Q1_009_partial_09_1863 : Poly :=
[
  term ((4020701859552707943385560394208866508383013672417841906175040923423682321185156278813279850855 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (7, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-4020701859552707943385560394208866508383013672417841906175040923423682321185156278813279850855 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1863 for generator 9. -/
theorem ep_Q1_009_partial_09_1863_valid :
    mulPoly ep_Q1_009_coefficient_09_1863
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1863 := by
  native_decide

/-- Coefficient term 1864 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1864 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (13, 2), (15, 1)]
]

/-- Partial product 1864 for generator 9. -/
def ep_Q1_009_partial_09_1864 : Poly :=
[
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1864 for generator 9. -/
theorem ep_Q1_009_partial_09_1864_valid :
    mulPoly ep_Q1_009_coefficient_09_1864
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1864 := by
  native_decide

/-- Coefficient term 1865 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1865 : Poly :=
[
  term ((-1600281021030126826284601324031986110140664626215246556381226286893665443400112775677150483414095 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 1865 for generator 9. -/
def ep_Q1_009_partial_09_1865 : Poly :=
[
  term ((-1600281021030126826284601324031986110140664626215246556381226286893665443400112775677150483414095 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((1600281021030126826284601324031986110140664626215246556381226286893665443400112775677150483414095 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 1), (8, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1865 for generator 9. -/
theorem ep_Q1_009_partial_09_1865_valid :
    mulPoly ep_Q1_009_coefficient_09_1865
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1865 := by
  native_decide

/-- Coefficient term 1866 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1866 : Poly :=
[
  term ((-313702413935632864209581646681692 : Rat) / 10306817152083683685026217919314591) [(7, 1), (8, 1), (14, 1), (15, 3)]
]

/-- Partial product 1866 for generator 9. -/
def ep_Q1_009_partial_09_1866 : Poly :=
[
  term ((-627404827871265728419163293363384 : Rat) / 10306817152083683685026217919314591) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((313702413935632864209581646681692 : Rat) / 10306817152083683685026217919314591) [(7, 1), (8, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1866 for generator 9. -/
theorem ep_Q1_009_partial_09_1866_valid :
    mulPoly ep_Q1_009_coefficient_09_1866
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1866 := by
  native_decide

/-- Coefficient term 1867 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1867 : Poly :=
[
  term ((237219614745664560161555961512565753325269552433766248994359329912267062746853808844126438926493 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(7, 1), (8, 1), (14, 2), (15, 1)]
]

/-- Partial product 1867 for generator 9. -/
def ep_Q1_009_partial_09_1867 : Poly :=
[
  term ((237219614745664560161555961512565753325269552433766248994359329912267062746853808844126438926493 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(2, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-237219614745664560161555961512565753325269552433766248994359329912267062746853808844126438926493 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(7, 1), (8, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1867 for generator 9. -/
theorem ep_Q1_009_partial_09_1867_valid :
    mulPoly ep_Q1_009_coefficient_09_1867
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1867 := by
  native_decide

/-- Coefficient term 1868 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1868 : Poly :=
[
  term ((-5193497788229046516335709879624196 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (14, 3), (15, 1)]
]

/-- Partial product 1868 for generator 9. -/
def ep_Q1_009_partial_09_1868 : Poly :=
[
  term ((-10386995576458093032671419759248392 : Rat) / 30920451456251051055078653757943773) [(2, 1), (7, 1), (8, 1), (14, 3), (15, 1)],
  term ((5193497788229046516335709879624196 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1868 for generator 9. -/
theorem ep_Q1_009_partial_09_1868_valid :
    mulPoly ep_Q1_009_coefficient_09_1868
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1868 := by
  native_decide

/-- Coefficient term 1869 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1869 : Poly :=
[
  term ((375967885090774410336656961247545074264762316325027703344879769491783637859390615075407243962465 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 1869 for generator 9. -/
def ep_Q1_009_partial_09_1869 : Poly :=
[
  term ((375967885090774410336656961247545074264762316325027703344879769491783637859390615075407243962465 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((-375967885090774410336656961247545074264762316325027703344879769491783637859390615075407243962465 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1869 for generator 9. -/
theorem ep_Q1_009_partial_09_1869_valid :
    mulPoly ep_Q1_009_coefficient_09_1869
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1869 := by
  native_decide

/-- Coefficient term 1870 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1870 : Poly :=
[
  term ((-1557295978270224341711511544654962796929822308292986330948785811275313835845266677912641999311 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(7, 1), (8, 1), (15, 3)]
]

/-- Partial product 1870 for generator 9. -/
def ep_Q1_009_partial_09_1870 : Poly :=
[
  term ((-1557295978270224341711511544654962796929822308292986330948785811275313835845266677912641999311 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(2, 1), (7, 1), (8, 1), (15, 3)],
  term ((1557295978270224341711511544654962796929822308292986330948785811275313835845266677912641999311 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(7, 1), (8, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1870 for generator 9. -/
theorem ep_Q1_009_partial_09_1870_valid :
    mulPoly ep_Q1_009_coefficient_09_1870
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1870 := by
  native_decide

/-- Coefficient term 1871 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1871 : Poly :=
[
  term ((22052771479683224472589969631882150688237785400107918877341592515663965800603728616730314730269815539374156551 : Rat) / 72774677891710919047637064653093142133125545638234507125026655365580816816362037202096957405593459925655175168) [(7, 1), (9, 1)]
]

/-- Partial product 1871 for generator 9. -/
def ep_Q1_009_partial_09_1871 : Poly :=
[
  term ((22052771479683224472589969631882150688237785400107918877341592515663965800603728616730314730269815539374156551 : Rat) / 36387338945855459523818532326546571066562772819117253562513327682790408408181018601048478702796729962827587584) [(2, 1), (7, 1), (9, 1)],
  term ((-22052771479683224472589969631882150688237785400107918877341592515663965800603728616730314730269815539374156551 : Rat) / 72774677891710919047637064653093142133125545638234507125026655365580816816362037202096957405593459925655175168) [(7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1871 for generator 9. -/
theorem ep_Q1_009_partial_09_1871_valid :
    mulPoly ep_Q1_009_coefficient_09_1871
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1871 := by
  native_decide

/-- Coefficient term 1872 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1872 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 1872 for generator 9. -/
def ep_Q1_009_partial_09_1872 : Poly :=
[
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1872 for generator 9. -/
theorem ep_Q1_009_partial_09_1872_valid :
    mulPoly ep_Q1_009_coefficient_09_1872
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1872 := by
  native_decide

/-- Coefficient term 1873 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1873 : Poly :=
[
  term ((34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1873 for generator 9. -/
def ep_Q1_009_partial_09_1873 : Poly :=
[
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1873 for generator 9. -/
theorem ep_Q1_009_partial_09_1873_valid :
    mulPoly ep_Q1_009_coefficient_09_1873
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1873 := by
  native_decide

/-- Coefficient term 1874 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1874 : Poly :=
[
  term ((-25087558020558912216352201377366760495610886931058278469294286771804118638904374643238511249043008799358934352258943 : Rat) / 675859083354229052614325487621353270750534559534655637621079021832429095602275814156920890720009012271166090849280) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 1874 for generator 9. -/
def ep_Q1_009_partial_09_1874 : Poly :=
[
  term ((-25087558020558912216352201377366760495610886931058278469294286771804118638904374643238511249043008799358934352258943 : Rat) / 337929541677114526307162743810676635375267279767327818810539510916214547801137907078460445360004506135583045424640) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((25087558020558912216352201377366760495610886931058278469294286771804118638904374643238511249043008799358934352258943 : Rat) / 675859083354229052614325487621353270750534559534655637621079021832429095602275814156920890720009012271166090849280) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1874 for generator 9. -/
theorem ep_Q1_009_partial_09_1874_valid :
    mulPoly ep_Q1_009_coefficient_09_1874
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1874 := by
  native_decide

/-- Coefficient term 1875 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1875 : Poly :=
[
  term ((25497503456775296800685 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1875 for generator 9. -/
def ep_Q1_009_partial_09_1875 : Poly :=
[
  term ((50995006913550593601370 : Rat) / 1558779625948348837707) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-25497503456775296800685 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1875 for generator 9. -/
theorem ep_Q1_009_partial_09_1875_valid :
    mulPoly ep_Q1_009_coefficient_09_1875
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1875 := by
  native_decide

/-- Coefficient term 1876 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1876 : Poly :=
[
  term ((99661217992632671537946512677712192000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 1876 for generator 9. -/
def ep_Q1_009_partial_09_1876 : Poly :=
[
  term ((199322435985265343075893025355424384000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((-99661217992632671537946512677712192000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1876 for generator 9. -/
theorem ep_Q1_009_partial_09_1876_valid :
    mulPoly ep_Q1_009_coefficient_09_1876
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1876 := by
  native_decide

/-- Coefficient term 1877 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1877 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 69756879612242031456386269594652640098166314371656432034781011873357859368759321497917280) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 1877 for generator 9. -/
def ep_Q1_009_partial_09_1877 : Poly :=
[
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 34878439806121015728193134797326320049083157185828216017390505936678929684379660748958640) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 69756879612242031456386269594652640098166314371656432034781011873357859368759321497917280) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1877 for generator 9. -/
theorem ep_Q1_009_partial_09_1877_valid :
    mulPoly ep_Q1_009_coefficient_09_1877
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1877 := by
  native_decide

/-- Coefficient term 1878 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1878 : Poly :=
[
  term ((-6873187447767770450892862943290496000 : Rat) / 126124521490048037253665828678652650067) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1878 for generator 9. -/
def ep_Q1_009_partial_09_1878 : Poly :=
[
  term ((-13746374895535540901785725886580992000 : Rat) / 126124521490048037253665828678652650067) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((6873187447767770450892862943290496000 : Rat) / 126124521490048037253665828678652650067) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1878 for generator 9. -/
theorem ep_Q1_009_partial_09_1878_valid :
    mulPoly ep_Q1_009_coefficient_09_1878
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1878 := by
  native_decide

/-- Coefficient term 1879 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1879 : Poly :=
[
  term ((132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 1879 for generator 9. -/
def ep_Q1_009_partial_09_1879 : Poly :=
[
  term ((132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1879 for generator 9. -/
theorem ep_Q1_009_partial_09_1879_valid :
    mulPoly ep_Q1_009_coefficient_09_1879
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1879 := by
  native_decide

/-- Coefficient term 1880 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1880 : Poly :=
[
  term ((-442059787318935108193 : Rat) / 30564306391144094857) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1880 for generator 9. -/
def ep_Q1_009_partial_09_1880 : Poly :=
[
  term ((-884119574637870216386 : Rat) / 30564306391144094857) [(2, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((442059787318935108193 : Rat) / 30564306391144094857) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1880 for generator 9. -/
theorem ep_Q1_009_partial_09_1880_valid :
    mulPoly ep_Q1_009_coefficient_09_1880
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1880 := by
  native_decide

/-- Coefficient term 1881 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1881 : Poly :=
[
  term ((-105546777227358438411548051223626443273962429161258505988951737915857971764003687194286159143190739044589188550403 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 1881 for generator 9. -/
def ep_Q1_009_partial_09_1881 : Poly :=
[
  term ((-105546777227358438411548051223626443273962429161258505988951737915857971764003687194286159143190739044589188550403 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(2, 1), (7, 1), (9, 1), (12, 1)],
  term ((105546777227358438411548051223626443273962429161258505988951737915857971764003687194286159143190739044589188550403 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(7, 1), (9, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1881 for generator 9. -/
theorem ep_Q1_009_partial_09_1881_valid :
    mulPoly ep_Q1_009_coefficient_09_1881
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1881 := by
  native_decide

/-- Coefficient term 1882 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1882 : Poly :=
[
  term ((-8940907916592591220621875426355595162043761703393442681972664993067575319849462473058706825101714519421300920626833 : Rat) / 675859083354229052614325487621353270750534559534655637621079021832429095602275814156920890720009012271166090849280) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 1882 for generator 9. -/
def ep_Q1_009_partial_09_1882 : Poly :=
[
  term ((-8940907916592591220621875426355595162043761703393442681972664993067575319849462473058706825101714519421300920626833 : Rat) / 337929541677114526307162743810676635375267279767327818810539510916214547801137907078460445360004506135583045424640) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((8940907916592591220621875426355595162043761703393442681972664993067575319849462473058706825101714519421300920626833 : Rat) / 675859083354229052614325487621353270750534559534655637621079021832429095602275814156920890720009012271166090849280) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1882 for generator 9. -/
theorem ep_Q1_009_partial_09_1882_valid :
    mulPoly ep_Q1_009_coefficient_09_1882
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1882 := by
  native_decide

/-- Coefficient term 1883 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1883 : Poly :=
[
  term ((3964010641462228068985 : Rat) / 519593208649449612569) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1883 for generator 9. -/
def ep_Q1_009_partial_09_1883 : Poly :=
[
  term ((7928021282924456137970 : Rat) / 519593208649449612569) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3964010641462228068985 : Rat) / 519593208649449612569) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1883 for generator 9. -/
theorem ep_Q1_009_partial_09_1883_valid :
    mulPoly ep_Q1_009_coefficient_09_1883
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1883 := by
  native_decide

/-- Coefficient term 1884 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1884 : Poly :=
[
  term ((-42957421548548565318080393395565600000 : Rat) / 714705621776938877770773029179031683713) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 1884 for generator 9. -/
def ep_Q1_009_partial_09_1884 : Poly :=
[
  term ((-85914843097097130636160786791131200000 : Rat) / 714705621776938877770773029179031683713) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((42957421548548565318080393395565600000 : Rat) / 714705621776938877770773029179031683713) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1884 for generator 9. -/
theorem ep_Q1_009_partial_09_1884_valid :
    mulPoly ep_Q1_009_coefficient_09_1884
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1884 := by
  native_decide

/-- Coefficient term 1885 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1885 : Poly :=
[
  term ((232241019921115021552752128532846587171794280845680774554810150141097047401067466443793548324868750604847506481 : Rat) / 1705656513086974665178993702806870518745129975896121260742812235130800394133485246924147439193596717007543168) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 1885 for generator 9. -/
def ep_Q1_009_partial_09_1885 : Poly :=
[
  term ((232241019921115021552752128532846587171794280845680774554810150141097047401067466443793548324868750604847506481 : Rat) / 852828256543487332589496851403435259372564987948060630371406117565400197066742623462073719596798358503771584) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-232241019921115021552752128532846587171794280845680774554810150141097047401067466443793548324868750604847506481 : Rat) / 1705656513086974665178993702806870518745129975896121260742812235130800394133485246924147439193596717007543168) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1885 for generator 9. -/
theorem ep_Q1_009_partial_09_1885_valid :
    mulPoly ep_Q1_009_coefficient_09_1885
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1885 := by
  native_decide

/-- Coefficient term 1886 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1886 : Poly :=
[
  term ((-1242548957214316491611834443773906328000 : Rat) / 5002939352438572144395411204253221785991) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 1886 for generator 9. -/
def ep_Q1_009_partial_09_1886 : Poly :=
[
  term ((-2485097914428632983223668887547812656000 : Rat) / 5002939352438572144395411204253221785991) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((1242548957214316491611834443773906328000 : Rat) / 5002939352438572144395411204253221785991) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1886 for generator 9. -/
theorem ep_Q1_009_partial_09_1886_valid :
    mulPoly ep_Q1_009_coefficient_09_1886
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1886 := by
  native_decide

/-- Coefficient term 1887 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1887 : Poly :=
[
  term ((-113401366325483190357572 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1887 for generator 9. -/
def ep_Q1_009_partial_09_1887 : Poly :=
[
  term ((-226802732650966380715144 : Rat) / 1558779625948348837707) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((113401366325483190357572 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1887 for generator 9. -/
theorem ep_Q1_009_partial_09_1887_valid :
    mulPoly ep_Q1_009_coefficient_09_1887
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1887 := by
  native_decide

/-- Coefficient term 1888 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1888 : Poly :=
[
  term ((-186671188063352940319699908994702546470584637859898816261189033856574166705937373443787474822320958472689492501 : Rat) / 386615476299714257440571905969557317582229461203120819101704106629648089336923322636140086217215255855043118080) [(7, 1), (9, 1), (12, 1), (14, 2)]
]

/-- Partial product 1888 for generator 9. -/
def ep_Q1_009_partial_09_1888 : Poly :=
[
  term ((-186671188063352940319699908994702546470584637859898816261189033856574166705937373443787474822320958472689492501 : Rat) / 193307738149857128720285952984778658791114730601560409550852053314824044668461661318070043108607627927521559040) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((186671188063352940319699908994702546470584637859898816261189033856574166705937373443787474822320958472689492501 : Rat) / 386615476299714257440571905969557317582229461203120819101704106629648089336923322636140086217215255855043118080) [(7, 1), (9, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1888 for generator 9. -/
theorem ep_Q1_009_partial_09_1888_valid :
    mulPoly ep_Q1_009_coefficient_09_1888
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1888 := by
  native_decide

/-- Coefficient term 1889 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1889 : Poly :=
[
  term ((5563285235794215997691 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

/-- Partial product 1889 for generator 9. -/
def ep_Q1_009_partial_09_1889 : Poly :=
[
  term ((11126570471588431995382 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-5563285235794215997691 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1889 for generator 9. -/
theorem ep_Q1_009_partial_09_1889_valid :
    mulPoly ep_Q1_009_coefficient_09_1889
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1889 := by
  native_decide

/-- Coefficient term 1890 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1890 : Poly :=
[
  term ((140013298109552741711416373534790418181722262590090120901466187910691308066926093206813662788944187126800218796702599 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(7, 1), (9, 1), (12, 1), (15, 2)]
]

/-- Partial product 1890 for generator 9. -/
def ep_Q1_009_partial_09_1890 : Poly :=
[
  term ((140013298109552741711416373534790418181722262590090120901466187910691308066926093206813662788944187126800218796702599 : Rat) / 1182753395869900842075069603337368223813435479185647365836888288206750917303982674774611558760015771474540658986240) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-140013298109552741711416373534790418181722262590090120901466187910691308066926093206813662788944187126800218796702599 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(7, 1), (9, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1890 for generator 9. -/
theorem ep_Q1_009_partial_09_1890_valid :
    mulPoly ep_Q1_009_coefficient_09_1890
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1890 := by
  native_decide

/-- Coefficient term 1891 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1891 : Poly :=
[
  term ((-39109409794998402648542 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1891 for generator 9. -/
def ep_Q1_009_partial_09_1891 : Poly :=
[
  term ((-78218819589996805297084 : Rat) / 1558779625948348837707) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((39109409794998402648542 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1891 for generator 9. -/
theorem ep_Q1_009_partial_09_1891_valid :
    mulPoly ep_Q1_009_coefficient_09_1891
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1891 := by
  native_decide

/-- Coefficient term 1892 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1892 : Poly :=
[
  term ((-362560637869749891284598520258573664000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (12, 1), (15, 4)]
]

/-- Partial product 1892 for generator 9. -/
def ep_Q1_009_partial_09_1892 : Poly :=
[
  term ((-725121275739499782569197040517147328000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 4)],
  term ((362560637869749891284598520258573664000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1892 for generator 9. -/
theorem ep_Q1_009_partial_09_1892_valid :
    mulPoly ep_Q1_009_coefficient_09_1892
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1892 := by
  native_decide

/-- Coefficient term 1893 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1893 : Poly :=
[
  term ((222148327610976607170850 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 1893 for generator 9. -/
def ep_Q1_009_partial_09_1893 : Poly :=
[
  term ((444296655221953214341700 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-222148327610976607170850 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1893 for generator 9. -/
theorem ep_Q1_009_partial_09_1893_valid :
    mulPoly ep_Q1_009_coefficient_09_1893
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1893 := by
  native_decide

/-- Coefficient term 1894 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1894 : Poly :=
[
  term ((1035901535098839846382182105421525653231135110954150873197303703139317330509767352094319220802812424106409921807 : Rat) / 231969285779828554464343143581734390549337676721872491461022463977788853602153993581684051730329153513025870848) [(7, 1), (9, 1), (12, 2)]
]

/-- Partial product 1894 for generator 9. -/
def ep_Q1_009_partial_09_1894 : Poly :=
[
  term ((1035901535098839846382182105421525653231135110954150873197303703139317330509767352094319220802812424106409921807 : Rat) / 115984642889914277232171571790867195274668838360936245730511231988894426801076996790842025865164576756512935424) [(2, 1), (7, 1), (9, 1), (12, 2)],
  term ((-1035901535098839846382182105421525653231135110954150873197303703139317330509767352094319220802812424106409921807 : Rat) / 231969285779828554464343143581734390549337676721872491461022463977788853602153993581684051730329153513025870848) [(7, 1), (9, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1894 for generator 9. -/
theorem ep_Q1_009_partial_09_1894_valid :
    mulPoly ep_Q1_009_coefficient_09_1894
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1894 := by
  native_decide

/-- Coefficient term 1895 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1895 : Poly :=
[
  term ((10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(7, 1), (9, 1), (12, 2), (14, 1)]
]

/-- Partial product 1895 for generator 9. -/
def ep_Q1_009_partial_09_1895 : Poly :=
[
  term ((10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(2, 1), (7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(7, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1895 for generator 9. -/
theorem ep_Q1_009_partial_09_1895_valid :
    mulPoly ep_Q1_009_coefficient_09_1895
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1895 := by
  native_decide

/-- Coefficient term 1896 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1896 : Poly :=
[
  term ((-24880280697155794952639 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (12, 2), (14, 1), (16, 1)]
]

/-- Partial product 1896 for generator 9. -/
def ep_Q1_009_partial_09_1896 : Poly :=
[
  term ((-49760561394311589905278 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((24880280697155794952639 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (12, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1896 for generator 9. -/
theorem ep_Q1_009_partial_09_1896_valid :
    mulPoly ep_Q1_009_coefficient_09_1896
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1896 := by
  native_decide

/-- Coefficient term 1897 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1897 : Poly :=
[
  term ((-2111183716204619138744400638100680336000 : Rat) / 15008818057315716433186233612759665357973) [(7, 1), (9, 1), (12, 2), (15, 2)]
]

/-- Partial product 1897 for generator 9. -/
def ep_Q1_009_partial_09_1897 : Poly :=
[
  term ((-4222367432409238277488801276201360672000 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (7, 1), (9, 1), (12, 2), (15, 2)],
  term ((2111183716204619138744400638100680336000 : Rat) / 15008818057315716433186233612759665357973) [(7, 1), (9, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1897 for generator 9. -/
theorem ep_Q1_009_partial_09_1897_valid :
    mulPoly ep_Q1_009_coefficient_09_1897
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1897 := by
  native_decide

/-- Coefficient term 1898 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1898 : Poly :=
[
  term ((-8650043352363116764333 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (12, 2), (16, 1)]
]

/-- Partial product 1898 for generator 9. -/
def ep_Q1_009_partial_09_1898 : Poly :=
[
  term ((-17300086704726233528666 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((8650043352363116764333 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1898 for generator 9. -/
theorem ep_Q1_009_partial_09_1898_valid :
    mulPoly ep_Q1_009_coefficient_09_1898
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1898 := by
  native_decide

/-- Coefficient term 1899 from coefficient polynomial 9. -/
def ep_Q1_009_coefficient_09_1899 : Poly :=
[
  term ((-135639840063209366300402395013132052207624924248286717348277928146542286336570659718879190462752684818935400913695719 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1899 for generator 9. -/
def ep_Q1_009_partial_09_1899 : Poly :=
[
  term ((-135639840063209366300402395013132052207624924248286717348277928146542286336570659718879190462752684818935400913695719 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((135639840063209366300402395013132052207624924248286717348277928146542286336570659718879190462752684818935400913695719 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1899 for generator 9. -/
theorem ep_Q1_009_partial_09_1899_valid :
    mulPoly ep_Q1_009_coefficient_09_1899
        ep_Q1_009_generator_09_1800_1899 =
      ep_Q1_009_partial_09_1899 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q1_009_partials_09_1800_1899 : List Poly :=
[
  ep_Q1_009_partial_09_1800,
  ep_Q1_009_partial_09_1801,
  ep_Q1_009_partial_09_1802,
  ep_Q1_009_partial_09_1803,
  ep_Q1_009_partial_09_1804,
  ep_Q1_009_partial_09_1805,
  ep_Q1_009_partial_09_1806,
  ep_Q1_009_partial_09_1807,
  ep_Q1_009_partial_09_1808,
  ep_Q1_009_partial_09_1809,
  ep_Q1_009_partial_09_1810,
  ep_Q1_009_partial_09_1811,
  ep_Q1_009_partial_09_1812,
  ep_Q1_009_partial_09_1813,
  ep_Q1_009_partial_09_1814,
  ep_Q1_009_partial_09_1815,
  ep_Q1_009_partial_09_1816,
  ep_Q1_009_partial_09_1817,
  ep_Q1_009_partial_09_1818,
  ep_Q1_009_partial_09_1819,
  ep_Q1_009_partial_09_1820,
  ep_Q1_009_partial_09_1821,
  ep_Q1_009_partial_09_1822,
  ep_Q1_009_partial_09_1823,
  ep_Q1_009_partial_09_1824,
  ep_Q1_009_partial_09_1825,
  ep_Q1_009_partial_09_1826,
  ep_Q1_009_partial_09_1827,
  ep_Q1_009_partial_09_1828,
  ep_Q1_009_partial_09_1829,
  ep_Q1_009_partial_09_1830,
  ep_Q1_009_partial_09_1831,
  ep_Q1_009_partial_09_1832,
  ep_Q1_009_partial_09_1833,
  ep_Q1_009_partial_09_1834,
  ep_Q1_009_partial_09_1835,
  ep_Q1_009_partial_09_1836,
  ep_Q1_009_partial_09_1837,
  ep_Q1_009_partial_09_1838,
  ep_Q1_009_partial_09_1839,
  ep_Q1_009_partial_09_1840,
  ep_Q1_009_partial_09_1841,
  ep_Q1_009_partial_09_1842,
  ep_Q1_009_partial_09_1843,
  ep_Q1_009_partial_09_1844,
  ep_Q1_009_partial_09_1845,
  ep_Q1_009_partial_09_1846,
  ep_Q1_009_partial_09_1847,
  ep_Q1_009_partial_09_1848,
  ep_Q1_009_partial_09_1849,
  ep_Q1_009_partial_09_1850,
  ep_Q1_009_partial_09_1851,
  ep_Q1_009_partial_09_1852,
  ep_Q1_009_partial_09_1853,
  ep_Q1_009_partial_09_1854,
  ep_Q1_009_partial_09_1855,
  ep_Q1_009_partial_09_1856,
  ep_Q1_009_partial_09_1857,
  ep_Q1_009_partial_09_1858,
  ep_Q1_009_partial_09_1859,
  ep_Q1_009_partial_09_1860,
  ep_Q1_009_partial_09_1861,
  ep_Q1_009_partial_09_1862,
  ep_Q1_009_partial_09_1863,
  ep_Q1_009_partial_09_1864,
  ep_Q1_009_partial_09_1865,
  ep_Q1_009_partial_09_1866,
  ep_Q1_009_partial_09_1867,
  ep_Q1_009_partial_09_1868,
  ep_Q1_009_partial_09_1869,
  ep_Q1_009_partial_09_1870,
  ep_Q1_009_partial_09_1871,
  ep_Q1_009_partial_09_1872,
  ep_Q1_009_partial_09_1873,
  ep_Q1_009_partial_09_1874,
  ep_Q1_009_partial_09_1875,
  ep_Q1_009_partial_09_1876,
  ep_Q1_009_partial_09_1877,
  ep_Q1_009_partial_09_1878,
  ep_Q1_009_partial_09_1879,
  ep_Q1_009_partial_09_1880,
  ep_Q1_009_partial_09_1881,
  ep_Q1_009_partial_09_1882,
  ep_Q1_009_partial_09_1883,
  ep_Q1_009_partial_09_1884,
  ep_Q1_009_partial_09_1885,
  ep_Q1_009_partial_09_1886,
  ep_Q1_009_partial_09_1887,
  ep_Q1_009_partial_09_1888,
  ep_Q1_009_partial_09_1889,
  ep_Q1_009_partial_09_1890,
  ep_Q1_009_partial_09_1891,
  ep_Q1_009_partial_09_1892,
  ep_Q1_009_partial_09_1893,
  ep_Q1_009_partial_09_1894,
  ep_Q1_009_partial_09_1895,
  ep_Q1_009_partial_09_1896,
  ep_Q1_009_partial_09_1897,
  ep_Q1_009_partial_09_1898,
  ep_Q1_009_partial_09_1899
]

/-- Sum of partial products in this block. -/
def ep_Q1_009_block_09_1800_1899 : Poly :=
[
  term ((-59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 63575628181339442486601007174807452342195040668907943386213932048572973599996984342021434911943149) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 3)],
  term ((1497007033121808 : Rat) / 1395206957462413) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-1104444645218897040092634881069702470569823431966808088759205289790787532869446589439782125739961525 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((3682115036592278 : Rat) / 1395206957462413) [(2, 1), (6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((2987079672569591968601141055744225993911355787790658551255680732101878285868161516664220872294107152199774079068447 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((28795868573406248688778 : Rat) / 2031704557077638197839) [(2, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-191550014681230764662291475019064695621433776405837832873540725054988978046643700349224768750249683 : Rat) / 72657860778673648556115436771208516962508617907323363869958779484083398399996553533738782756506456) [(2, 1), (6, 1), (13, 1), (15, 3)],
  term ((4525317955407470 : Rat) / 1395206957462413) [(2, 1), (6, 1), (13, 1), (15, 3), (16, 1)],
  term ((276622778980764526510053280183482549512275323808250444023757528709513443603720215150920301516294151 : Rat) / 607595293682344446518076479831282934214376268297387819174354415100638255835547403909530620796672) [(2, 1), (6, 1), (13, 2)],
  term ((-8790523859652245085563032702327823923112131849392334711150398906936882353 : Rat) / 8905717168354829061649550218231666041269517943486290166705486069942583020) [(2, 1), (6, 1), (13, 2), (14, 1)],
  term ((134144345690929796312854282147200 : Rat) / 3435605717361227895008739306438197) [(2, 1), (6, 1), (13, 2), (14, 1), (15, 2)],
  term ((270178606731792726074565447859402022945767563727609180216756874478861237751934187540676454090186587 : Rat) / 169535008483571846630936019132819872912520108450421182363237152129527929599991958245390493098515064) [(2, 1), (6, 1), (13, 2), (15, 2)],
  term ((-1981558126312830 : Rat) / 1395206957462413) [(2, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((1690028857 : Rat) / 49510902) [(2, 1), (6, 1), (13, 2), (16, 1)],
  term ((-735930785387739854771908909002000 : Rat) / 24049240021528595265061175145067379) [(2, 1), (6, 1), (13, 3), (15, 1)],
  term ((6662935315120513786674332061450611599858552080755020657808422438741419734065357613594398717289704961 : Rat) / 6075952936823444465180764798312829342143762682973878191743544151006382558355474039095306207966720) [(2, 1), (6, 1), (14, 1)],
  term ((-4371557128013147515984481622773241387769570056633136845689261237219842209863938420362589195721023827311262287886047 : Rat) / 3677613947276064695661930274597053432636040730131036603815273448826241086183084440763190959045569334433218667840) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((-68985923077573472599889 : Rat) / 677234852359212732613) [(2, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((3580960609 : Rat) / 33007268) [(2, 1), (6, 1), (14, 1), (16, 1)],
  term ((684420690243799178045620294414987917064283018594087467 : Rat) / 142535977414811439821655628464178362087681092443638696) [(2, 1), (6, 1), (14, 2), (15, 2)],
  term ((-7510096328668466 : Rat) / 1395206957462413) [(2, 1), (6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1518843439268860166891981972289361029224906330655530568333279867754723031229348896488989829120909116461156759688287 : Rat) / 2101493684157751254663960156912601961506308988646306630751584827900709192104619680436109119454611048247553524480) [(2, 1), (6, 1), (15, 2)],
  term ((-6518957586792411530071 : Rat) / 96747836051316104659) [(2, 1), (6, 1), (15, 2), (16, 1)],
  term ((-493518740573594331488581682822153815936238740983478748762411434890100985600794213122836606706130225 : Rat) / 508605025450715539892808057398459618737560325351263547089711456388583788799975874736171479295545192) [(2, 1), (6, 1), (15, 4)],
  term ((1551375598657274 : Rat) / 1395206957462413) [(2, 1), (6, 1), (15, 4), (16, 1)],
  term ((1179091783 : Rat) / 99021804) [(2, 1), (6, 1), (16, 1)],
  term ((7374973845181468732611087823649080 : Rat) / 30920451456251051055078653757943773) [(2, 1), (6, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1533973053064365228214078282057725776005918013406902491167288161254332604696290918672545971253569 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (6, 2), (8, 1), (13, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 123889374237557643968004945495343075524763080281814121931439450105736073397414568317455857024) [(2, 1), (6, 2), (8, 1), (15, 2)],
  term ((-12169398189074254553851152994980829832434991898801917994388706680742717879648372761290065987144555081092746721927 : Rat) / 386615476299714257440571905969557317582229461203120819101704106629648089336923322636140086217215255855043118080) [(2, 1), (6, 2), (9, 1), (13, 1)],
  term ((1714692261367085162679200362606484613992660014898241523732036857393723507176988550318344395946651196850773516973 : Rat) / 28996160722478569308042892947716798818667209590234061432627807997223606700269249197710506466291144189128233856) [(2, 1), (6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-146700175696052235089456 : Rat) / 4676338877845046513121) [(2, 1), (6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7124839654603569121342939265980488697600 : Rat) / 5002939352438572144395411204253221785991) [(2, 1), (6, 2), (9, 1), (13, 1), (15, 2)],
  term ((31829482665033950839475 : Rat) / 1558779625948348837707) [(2, 1), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 52705197929249534878158514804848661407503437525251526426278986748759271523062598465093056) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-17182968619419426127232157358226240000 : Rat) / 238235207258979625923591009726343894571) [(2, 1), (6, 2), (9, 1), (15, 3)],
  term ((240288305598895558716027964628613680940699067407081 : Rat) / 116450961940205424690895121294263367718693702976829) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1)],
  term ((-3951476446241272 : Rat) / 1395206957462413) [(2, 1), (6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12750899481129987319291550089854322190667668205637276537277897684724275236557053650517714441553537378351201278855491 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((-348499081913965357810874 : Rat) / 2031704557077638197839) [(2, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((24530758996544628450945932313404007581149427591995039909319088002817133 : Rat) / 2095462863142312720388129463113333186181063045526185921577761428221784240) [(2, 1), (6, 2), (13, 2)],
  term ((-6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 142254453679596517240343302817641639359715078688674132267011549567212924977370225518501216773824) [(2, 1), (6, 2), (15, 2)],
  term ((-8610450 : Rat) / 1178831) [(2, 1), (6, 2), (15, 2), (16, 1)],
  term ((-84630942298619699836782859980681091844505631662244264922455491483681183537054821068726531132699 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 278751092034504698928011127364521919930716930634081774345738762737906165144182778714275678304) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2014543285884278623857061038382987255141615004974593017484996450196116462302060278093546984237 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(2, 1), (7, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((-73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 16397123060853217584000654550854230584159819449063633785043456631641539126128398747898569312) [(2, 1), (7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((2195554691886511800802423447905352 : Rat) / 10306817152083683685026217919314591) [(2, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1004329008927637502804788700238460248761068624053580454964991112815340414026408980833706818138081 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1)],
  term ((-1875633008370292864287147179006201281494801732082853398080761929061241265937683967522464803817 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(2, 1), (7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-121454689929318142610175590778387267267356474926649722627413816286277322452450924710088544592985 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(2, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-224314362371922138068464641078864 : Rat) / 3435605717361227895008739306438197) [(2, 1), (7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((-170231922838157366875076737443743502982439893843546600756584910139434925751769119127776344885297 : Rat) / 2601676858988710523328103855402204586020024685918096560560228452220457541345705934666572997504) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-15121036495254116810278499077240950229660460657512067809559007432410133089671357601435725537987 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (7, 1), (8, 1), (12, 1), (15, 3)],
  term ((2977559401718826073940389265521712 : Rat) / 30920451456251051055078653757943773) [(2, 1), (7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((-102031109957887275654661120653739133464833174817175023932325028582471078719302783031955021481595 : Rat) / 5203353717977421046656207710804409172040049371836193121120456904440915082691411869333145995008) [(2, 1), (7, 1), (8, 1), (12, 2), (15, 1)],
  term ((101974740386151652737210598175421583866790846395225950043221747101211294860469052862322488727437 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (7, 1), (8, 1), (13, 1)],
  term ((-954591076836921277997567333705384484577042162079771878264735668768169862589896808838002144921497 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1)],
  term ((4597638162067340387728769077111247365313746132885300332108950899476829710629545695912581683237 : Rat) / 371668122712672931904014836486029226574289240845442365794318350317208220192243704952367571072) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 3902515288483065784992155783103306879030037028877144840840342678330686312018558901999859496256) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 2)],
  term ((327430788838880981122613390433216 : Rat) / 3435605717361227895008739306438197) [(2, 1), (7, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((1854158158482560392622631208396187055450034274955428490548446671598180105701752406807739944937 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(2, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((4020701859552707943385560394208866508383013672417841906175040923423682321185156278813279850855 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (7, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(2, 1), (7, 1), (8, 1), (13, 2), (15, 1)],
  term ((-1600281021030126826284601324031986110140664626215246556381226286893665443400112775677150483414095 : Rat) / 15610061153932263139968623132413227516120148115508579363361370713322745248074235607999437985024) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-627404827871265728419163293363384 : Rat) / 10306817152083683685026217919314591) [(2, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((237219614745664560161555961512565753325269552433766248994359329912267062746853808844126438926493 : Rat) / 3468902478651614031104138473869606114693366247890795414080304602960610055127607912888763996672) [(2, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-10386995576458093032671419759248392 : Rat) / 30920451456251051055078653757943773) [(2, 1), (7, 1), (8, 1), (14, 3), (15, 1)],
  term ((375967885090774410336656961247545074264762316325027703344879769491783637859390615075407243962465 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(2, 1), (7, 1), (8, 1), (15, 1)],
  term ((-1557295978270224341711511544654962796929822308292986330948785811275313835845266677912641999311 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(2, 1), (7, 1), (8, 1), (15, 3)],
  term ((22052771479683224472589969631882150688237785400107918877341592515663965800603728616730314730269815539374156551 : Rat) / 36387338945855459523818532326546571066562772819117253562513327682790408408181018601048478702796729962827587584) [(2, 1), (7, 1), (9, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 118586695340811453475856658310909488166882734431815934459127720184708360926890846546459376) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((68731874477677704508928629432904960000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-25087558020558912216352201377366760495610886931058278469294286771804118638904374643238511249043008799358934352258943 : Rat) / 337929541677114526307162743810676635375267279767327818810539510916214547801137907078460445360004506135583045424640) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((50995006913550593601370 : Rat) / 1558779625948348837707) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((199322435985265343075893025355424384000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 34878439806121015728193134797326320049083157185828216017390505936678929684379660748958640) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-13746374895535540901785725886580992000 : Rat) / 126124521490048037253665828678652650067) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-884119574637870216386 : Rat) / 30564306391144094857) [(2, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-105546777227358438411548051223626443273962429161258505988951737915857971764003687194286159143190739044589188550403 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(2, 1), (7, 1), (9, 1), (12, 1)],
  term ((-8940907916592591220621875426355595162043761703393442681972664993067575319849462473058706825101714519421300920626833 : Rat) / 337929541677114526307162743810676635375267279767327818810539510916214547801137907078460445360004506135583045424640) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((7928021282924456137970 : Rat) / 519593208649449612569) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-85914843097097130636160786791131200000 : Rat) / 714705621776938877770773029179031683713) [(2, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((232241019921115021552752128532846587171794280845680774554810150141097047401067466443793548324868750604847506481 : Rat) / 852828256543487332589496851403435259372564987948060630371406117565400197066742623462073719596798358503771584) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-2485097914428632983223668887547812656000 : Rat) / 5002939352438572144395411204253221785991) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((-226802732650966380715144 : Rat) / 1558779625948348837707) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-186671188063352940319699908994702546470584637859898816261189033856574166705937373443787474822320958472689492501 : Rat) / 193307738149857128720285952984778658791114730601560409550852053314824044668461661318070043108607627927521559040) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 2)],
  term ((11126570471588431995382 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((140013298109552741711416373534790418181722262590090120901466187910691308066926093206813662788944187126800218796702599 : Rat) / 1182753395869900842075069603337368223813435479185647365836888288206750917303982674774611558760015771474540658986240) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2)],
  term ((-78218819589996805297084 : Rat) / 1558779625948348837707) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-725121275739499782569197040517147328000 : Rat) / 2144116865330816633312319087537095051139) [(2, 1), (7, 1), (9, 1), (12, 1), (15, 4)],
  term ((444296655221953214341700 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((1035901535098839846382182105421525653231135110954150873197303703139317330509767352094319220802812424106409921807 : Rat) / 115984642889914277232171571790867195274668838360936245730511231988894426801076996790842025865164576756512935424) [(2, 1), (7, 1), (9, 1), (12, 2)],
  term ((10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 579923214449571386160857858954335976373344191804681228652556159944472134005384983954210129325822883782564677120) [(2, 1), (7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-49760561394311589905278 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((-4222367432409238277488801276201360672000 : Rat) / 15008818057315716433186233612759665357973) [(2, 1), (7, 1), (9, 1), (12, 2), (15, 2)],
  term ((-17300086704726233528666 : Rat) / 4676338877845046513121) [(2, 1), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((-135639840063209366300402395013132052207624924248286717348277928146542286336570659718879190462752684818935400913695719 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(2, 1), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((59059351127615575838881213904529843294301732482630417988229117595172972154059555574126842762008167 : Rat) / 127151256362678884973202014349614904684390081337815886772427864097145947199993968684042869823886298) [(6, 1), (13, 1), (14, 1), (15, 3)],
  term ((-748503516560904 : Rat) / 1395206957462413) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1104444645218897040092634881069702470569823431966808088759205289790787532869446589439782125739961525 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1841057518296139 : Rat) / 1395206957462413) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-2987079672569591968601141055744225993911355787790658551255680732101878285868161516664220872294107152199774079068447 : Rat) / 29420911578208517565295442196776427461088325841048292830522187590609928689464675526105527672364554675465749342720) [(6, 1), (13, 1), (15, 1)],
  term ((-14397934286703124344389 : Rat) / 2031704557077638197839) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((191550014681230764662291475019064695621433776405837832873540725054988978046643700349224768750249683 : Rat) / 145315721557347297112230873542417033925017235814646727739917558968166796799993107067477565513012912) [(6, 1), (13, 1), (15, 3)],
  term ((-2262658977703735 : Rat) / 1395206957462413) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((-276622778980764526510053280183482549512275323808250444023757528709513443603720215150920301516294151 : Rat) / 1215190587364688893036152959662565868428752536594775638348708830201276511671094807819061241593344) [(6, 1), (13, 2)],
  term ((8790523859652245085563032702327823923112131849392334711150398906936882353 : Rat) / 17811434336709658123299100436463332082539035886972580333410972139885166040) [(6, 1), (13, 2), (14, 1)],
  term ((-67072172845464898156427141073600 : Rat) / 3435605717361227895008739306438197) [(6, 1), (13, 2), (14, 1), (15, 2)],
  term ((-270178606731792726074565447859402022945767563727609180216756874478861237751934187540676454090186587 : Rat) / 339070016967143693261872038265639745825040216900842364726474304259055859199983916490780986197030128) [(6, 1), (13, 2), (15, 2)],
  term ((990779063156415 : Rat) / 1395206957462413) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1690028857 : Rat) / 99021804) [(6, 1), (13, 2), (16, 1)],
  term ((367965392693869927385954454501000 : Rat) / 24049240021528595265061175145067379) [(6, 1), (13, 3), (15, 1)],
  term ((-6662935315120513786674332061450611599858552080755020657808422438741419734065357613594398717289704961 : Rat) / 12151905873646888930361529596625658684287525365947756383487088302012765116710948078190612415933440) [(6, 1), (14, 1)],
  term ((4371557128013147515984481622773241387769570056633136845689261237219842209863938420362589195721023827311262287886047 : Rat) / 7355227894552129391323860549194106865272081460262073207630546897652482172366168881526381918091138668866437335680) [(6, 1), (14, 1), (15, 2)],
  term ((68985923077573472599889 : Rat) / 1354469704718425465226) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3580960609 : Rat) / 66014536) [(6, 1), (14, 1), (16, 1)],
  term ((-684420690243799178045620294414987917064283018594087467 : Rat) / 285071954829622879643311256928356724175362184887277392) [(6, 1), (14, 2), (15, 2)],
  term ((3755048164334233 : Rat) / 1395206957462413) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((1518843439268860166891981972289361029224906330655530568333279867754723031229348896488989829120909116461156759688287 : Rat) / 4202987368315502509327920313825203923012617977292613261503169655801418384209239360872218238909222096495107048960) [(6, 1), (15, 2)],
  term ((6518957586792411530071 : Rat) / 193495672102632209318) [(6, 1), (15, 2), (16, 1)],
  term ((493518740573594331488581682822153815936238740983478748762411434890100985600794213122836606706130225 : Rat) / 1017210050901431079785616114796919237475120650702527094179422912777167577599951749472342958591090384) [(6, 1), (15, 4)],
  term ((-775687799328637 : Rat) / 1395206957462413) [(6, 1), (15, 4), (16, 1)],
  term ((-1179091783 : Rat) / 198043608) [(6, 1), (16, 1)],
  term ((-3687486922590734366305543911824540 : Rat) / 30920451456251051055078653757943773) [(6, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1533973053064365228214078282057725776005918013406902491167288161254332604696290918672545971253569 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(6, 2), (8, 1), (13, 1), (15, 1)],
  term ((365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 247778748475115287936009890990686151049526160563628243862878900211472146794829136634911714048) [(6, 2), (8, 1), (15, 2)],
  term ((12169398189074254553851152994980829832434991898801917994388706680742717879648372761290065987144555081092746721927 : Rat) / 773230952599428514881143811939114635164458922406241638203408213259296178673846645272280172434430511710086236160) [(6, 2), (9, 1), (13, 1)],
  term ((-1714692261367085162679200362606484613992660014898241523732036857393723507176988550318344395946651196850773516973 : Rat) / 57992321444957138616085785895433597637334419180468122865255615994447213400538498395421012932582288378256467712) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((73350087848026117544728 : Rat) / 4676338877845046513121) [(6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3562419827301784560671469632990244348800 : Rat) / 5002939352438572144395411204253221785991) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term ((-31829482665033950839475 : Rat) / 3117559251896697675414) [(6, 2), (9, 1), (13, 1), (16, 1)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 105410395858499069756317029609697322815006875050503052852557973497518543046125196930186112) [(6, 2), (9, 1), (15, 1)],
  term ((8591484309709713063616078679113120000 : Rat) / 238235207258979625923591009726343894571) [(6, 2), (9, 1), (15, 3)],
  term ((-240288305598895558716027964628613680940699067407081 : Rat) / 232901923880410849381790242588526735437387405953658) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((1975738223120636 : Rat) / 1395206957462413) [(6, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((12750899481129987319291550089854322190667668205637276537277897684724275236557053650517714441553537378351201278855491 : Rat) / 14710455789104258782647721098388213730544162920524146415261093795304964344732337763052763836182277337732874671360) [(6, 2), (13, 1), (15, 1)],
  term ((174249540956982678905437 : Rat) / 2031704557077638197839) [(6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24530758996544628450945932313404007581149427591995039909319088002817133 : Rat) / 4190925726284625440776258926226666372362126091052371843155522856443568480) [(6, 2), (13, 2)],
  term ((6787203876935009431820866292810973305314566930053288987375008782398597542371278444068874639441675 : Rat) / 284508907359193034480686605635283278719430157377348264534023099134425849954740451037002433547648) [(6, 2), (15, 2)],
  term ((4305225 : Rat) / 1178831) [(6, 2), (15, 2), (16, 1)],
  term ((84630942298619699836782859980681091844505631662244264922455491483681183537054821068726531132699 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 557502184069009397856022254729043839861433861268163548691477525475812330288365557428551356608) [(7, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2014543285884278623857061038382987255141615004974593017484996450196116462302060278093546984237 : Rat) / 1115004368138018795712044509458087679722867722536327097382955050951624660576731114857102713216) [(7, 1), (8, 1), (11, 1), (12, 1), (15, 2)],
  term ((73103670173685598970646552621979391061509339498506216475909834971339678567002841432968724561 : Rat) / 32794246121706435168001309101708461168319638898127267570086913263283078252256797495797138624) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((3923648913495604439820613487890302670161013766311903475360458108761301201599332974901155264994773 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((-1097777345943255900401211723952676 : Rat) / 10306817152083683685026217919314591) [(7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((1004329008927637502804788700238460248761068624053580454964991112815340414026408980833706818138081 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((1875633008370292864287147179006201281494801732082853398080761929061241265937683967522464803817 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(7, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((121454689929318142610175590778387267267356474926649722627413816286277322452450924710088544592985 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((112157181185961069034232320539432 : Rat) / 3435605717361227895008739306438197) [(7, 1), (8, 1), (12, 1), (14, 2), (15, 1)],
  term ((170231922838157366875076737443743502982439893843546600756584910139434925751769119127776344885297 : Rat) / 5203353717977421046656207710804409172040049371836193121120456904440915082691411869333145995008) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((15121036495254116810278499077240950229660460657512067809559007432410133089671357601435725537987 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (12, 1), (15, 3)],
  term ((-1488779700859413036970194632760856 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((102031109957887275654661120653739133464833174817175023932325028582471078719302783031955021481595 : Rat) / 10406707435954842093312415421608818344080098743672386242240913808881830165382823738666291990016) [(7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-101974740386151652737210598175421583866790846395225950043221747101211294860469052862322488727437 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 1), (8, 1), (13, 1)],
  term ((954591076836921277997567333705384484577042162079771878264735668768169862589896808838002144921497 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((-4597638162067340387728769077111247365313746132885300332108950899476829710629545695912581683237 : Rat) / 743336245425345863808029672972058453148578481690884731588636700634416440384487409904735142144) [(7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-100816104547952700413776285887583076235189706108655157632423004628489098971576725124856448151437 : Rat) / 7805030576966131569984311566206613758060074057754289681680685356661372624037117803999718992512) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((-163715394419440490561306695216608 : Rat) / 3435605717361227895008739306438197) [(7, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1854158158482560392622631208396187055450034274955428490548446671598180105701752406807739944937 : Rat) / 4460017472552075182848178037832350718891470890145308389531820203806498642306924459428410852864) [(7, 1), (8, 1), (13, 1), (15, 2)],
  term ((-4020701859552707943385560394208866508383013672417841906175040923423682321185156278813279850855 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-365518350868427994853232763109896955307546697492531082379549174856698392835014207164843622805 : Rat) / 2230008736276037591424089018916175359445735445072654194765910101903249321153462229714205426432) [(7, 1), (8, 1), (13, 2), (15, 1)],
  term ((1600281021030126826284601324031986110140664626215246556381226286893665443400112775677150483414095 : Rat) / 31220122307864526279937246264826455032240296231017158726722741426645490496148471215998875970048) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((313702413935632864209581646681692 : Rat) / 10306817152083683685026217919314591) [(7, 1), (8, 1), (14, 1), (15, 3)],
  term ((-237219614745664560161555961512565753325269552433766248994359329912267062746853808844126438926493 : Rat) / 6937804957303228062208276947739212229386732495781590828160609205921220110255215825777527993344) [(7, 1), (8, 1), (14, 2), (15, 1)],
  term ((5193497788229046516335709879624196 : Rat) / 30920451456251051055078653757943773) [(7, 1), (8, 1), (14, 3), (15, 1)],
  term ((-375967885090774410336656961247545074264762316325027703344879769491783637859390615075407243962465 : Rat) / 62440244615729052559874492529652910064480592462034317453445482853290980992296942431997751940096) [(7, 1), (8, 1), (15, 1)],
  term ((1557295978270224341711511544654962796929822308292986330948785811275313835845266677912641999311 : Rat) / 8920034945104150365696356075664701437782941780290616779063640407612997284613848918856821705728) [(7, 1), (8, 1), (15, 3)],
  term ((-22052771479683224472589969631882150688237785400107918877341592515663965800603728616730314730269815539374156551 : Rat) / 72774677891710919047637064653093142133125545638234507125026655365580816816362037202096957405593459925655175168) [(7, 1), (9, 1)],
  term ((56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 237173390681622906951713316621818976333765468863631868918255440369416721853781693092918752) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-34365937238838852254464314716452480000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((25087558020558912216352201377366760495610886931058278469294286771804118638904374643238511249043008799358934352258943 : Rat) / 675859083354229052614325487621353270750534559534655637621079021832429095602275814156920890720009012271166090849280) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((-25497503456775296800685 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-99661217992632671537946512677712192000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 3)],
  term ((-56509410952730211447664397618195454152469574224789589164563298109108862856480676791346561 : Rat) / 69756879612242031456386269594652640098166314371656432034781011873357859368759321497917280) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((6873187447767770450892862943290496000 : Rat) / 126124521490048037253665828678652650067) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-132267930523694104282921036322170354977419335013223049497616203602176807306087210845332543125973985762103139618748727 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((442059787318935108193 : Rat) / 30564306391144094857) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((105546777227358438411548051223626443273962429161258505988951737915857971764003687194286159143190739044589188550403 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(7, 1), (9, 1), (12, 1)],
  term ((8940907916592591220621875426355595162043761703393442681972664993067575319849462473058706825101714519421300920626833 : Rat) / 675859083354229052614325487621353270750534559534655637621079021832429095602275814156920890720009012271166090849280) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((-3964010641462228068985 : Rat) / 519593208649449612569) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((42957421548548565318080393395565600000 : Rat) / 714705621776938877770773029179031683713) [(7, 1), (9, 1), (12, 1), (13, 1), (15, 3)],
  term ((-232241019921115021552752128532846587171794280845680774554810150141097047401067466443793548324868750604847506481 : Rat) / 1705656513086974665178993702806870518745129975896121260742812235130800394133485246924147439193596717007543168) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((1242548957214316491611834443773906328000 : Rat) / 5002939352438572144395411204253221785991) [(7, 1), (9, 1), (12, 1), (14, 1), (15, 2)],
  term ((113401366325483190357572 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((186671188063352940319699908994702546470584637859898816261189033856574166705937373443787474822320958472689492501 : Rat) / 386615476299714257440571905969557317582229461203120819101704106629648089336923322636140086217215255855043118080) [(7, 1), (9, 1), (12, 1), (14, 2)],
  term ((-5563285235794215997691 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (12, 1), (14, 2), (16, 1)],
  term ((-140013298109552741711416373534790418181722262590090120901466187910691308066926093206813662788944187126800218796702599 : Rat) / 2365506791739801684150139206674736447626870958371294731673776576413501834607965349549223117520031542949081317972480) [(7, 1), (9, 1), (12, 1), (15, 2)],
  term ((39109409794998402648542 : Rat) / 1558779625948348837707) [(7, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((362560637869749891284598520258573664000 : Rat) / 2144116865330816633312319087537095051139) [(7, 1), (9, 1), (12, 1), (15, 4)],
  term ((-222148327610976607170850 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-1035901535098839846382182105421525653231135110954150873197303703139317330509767352094319220802812424106409921807 : Rat) / 231969285779828554464343143581734390549337676721872491461022463977788853602153993581684051730329153513025870848) [(7, 1), (9, 1), (12, 2)],
  term ((-10962630933198898498294677259744861740769320600812812333394029197160903250345949668367382347577927161818687169251 : Rat) / 1159846428899142772321715717908671952746688383609362457305112319888944268010769967908420258651645767565129354240) [(7, 1), (9, 1), (12, 2), (14, 1)],
  term ((24880280697155794952639 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((2111183716204619138744400638100680336000 : Rat) / 15008818057315716433186233612759665357973) [(7, 1), (9, 1), (12, 2), (15, 2)],
  term ((8650043352363116764333 : Rat) / 4676338877845046513121) [(7, 1), (9, 1), (12, 2), (16, 1)],
  term ((135639840063209366300402395013132052207624924248286717348277928146542286336570659718879190462752684818935400913695719 : Rat) / 4731013583479603368300278413349472895253741916742589463347553152827003669215930699098446235040063085898162635944960) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 9, terms 1800 through 1899. -/
theorem ep_Q1_009_block_09_1800_1899_valid :
    checkProductSumEq ep_Q1_009_partials_09_1800_1899
      ep_Q1_009_block_09_1800_1899 = true := by
  native_decide

end EpQ1009TermShards

end Patterns

end EndpointCertificate

end Problem97
