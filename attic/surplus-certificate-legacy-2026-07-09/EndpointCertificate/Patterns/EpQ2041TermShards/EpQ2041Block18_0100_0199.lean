/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:100-199

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_0100_0199 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 100 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0100 : Poly :=
[
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (9, 1), (10, 2), (15, 1)]
]

/-- Partial product 100 for generator 18. -/
def ep_Q2_041_partial_18_0100 : Poly :=
[
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (9, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 18. -/
theorem ep_Q2_041_partial_18_0100_valid :
    mulPoly ep_Q2_041_coefficient_18_0100
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0101 : Poly :=
[
  term ((-95924634922116 : Rat) / 442987745227) [(0, 1), (6, 1), (9, 1), (11, 1)]
]

/-- Partial product 101 for generator 18. -/
def ep_Q2_041_partial_18_0101 : Poly :=
[
  term ((-191849269844232 : Rat) / 442987745227) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((95924634922116 : Rat) / 442987745227) [(0, 1), (6, 1), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 18. -/
theorem ep_Q2_041_partial_18_0101_valid :
    mulPoly ep_Q2_041_coefficient_18_0101
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0102 : Poly :=
[
  term ((-27407295906362247003094733076716822119340775477440417128863600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 102 for generator 18. -/
def ep_Q2_041_partial_18_0102 : Poly :=
[
  term ((-54814591812724494006189466153433644238681550954880834257727200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((27407295906362247003094733076716822119340775477440417128863600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 18. -/
theorem ep_Q2_041_partial_18_0102_valid :
    mulPoly ep_Q2_041_coefficient_18_0102
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0103 : Poly :=
[
  term ((-4476477989892023115055546570229204363787267600440817285921990310 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 103 for generator 18. -/
def ep_Q2_041_partial_18_0103 : Poly :=
[
  term ((-8952955979784046230111093140458408727574535200881634571843980620 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((4476477989892023115055546570229204363787267600440817285921990310 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 18. -/
theorem ep_Q2_041_partial_18_0103_valid :
    mulPoly ep_Q2_041_coefficient_18_0103
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0104 : Poly :=
[
  term ((-40695681800356063731867936992700735874172666618017589070130800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1)]
]

/-- Partial product 104 for generator 18. -/
def ep_Q2_041_partial_18_0104 : Poly :=
[
  term ((-81391363600712127463735873985401471748345333236035178140261600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((40695681800356063731867936992700735874172666618017589070130800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 18. -/
theorem ep_Q2_041_partial_18_0104_valid :
    mulPoly ep_Q2_041_coefficient_18_0104
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0105 : Poly :=
[
  term ((-12611512083548554669628042848037790935405363444989058060980 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 105 for generator 18. -/
def ep_Q2_041_partial_18_0105 : Poly :=
[
  term ((-25223024167097109339256085696075581870810726889978116121960 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((12611512083548554669628042848037790935405363444989058060980 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 18. -/
theorem ep_Q2_041_partial_18_0105_valid :
    mulPoly ep_Q2_041_coefficient_18_0105
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0106 : Poly :=
[
  term ((-31500697765213899637916651293445436489631544614304592121160710767 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 106 for generator 18. -/
def ep_Q2_041_partial_18_0106 : Poly :=
[
  term ((-31500697765213899637916651293445436489631544614304592121160710767 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((31500697765213899637916651293445436489631544614304592121160710767 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 18. -/
theorem ep_Q2_041_partial_18_0106_valid :
    mulPoly ep_Q2_041_coefficient_18_0106
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0107 : Poly :=
[
  term ((788247848379399969638283209844747693650473201766034551662657950 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 3)]
]

/-- Partial product 107 for generator 18. -/
def ep_Q2_041_partial_18_0107 : Poly :=
[
  term ((1576495696758799939276566419689495387300946403532069103325315900 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 3)],
  term ((-788247848379399969638283209844747693650473201766034551662657950 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 18. -/
theorem ep_Q2_041_partial_18_0107_valid :
    mulPoly ep_Q2_041_coefficient_18_0107
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0108 : Poly :=
[
  term ((-49945656414809640789968036653966091588270367061404449465055 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1)]
]

/-- Partial product 108 for generator 18. -/
def ep_Q2_041_partial_18_0108 : Poly :=
[
  term ((-99891312829619281579936073307932183176540734122808898930110 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (6, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 18. -/
theorem ep_Q2_041_partial_18_0108_valid :
    mulPoly ep_Q2_041_coefficient_18_0108
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0109 : Poly :=
[
  term ((-36093463979052132056148343980669978737580157347226762602284758 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (9, 1), (15, 1)]
]

/-- Partial product 109 for generator 18. -/
def ep_Q2_041_partial_18_0109 : Poly :=
[
  term ((-72186927958104264112296687961339957475160314694453525204569516 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((36093463979052132056148343980669978737580157347226762602284758 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 18. -/
theorem ep_Q2_041_partial_18_0109_valid :
    mulPoly ep_Q2_041_coefficient_18_0109
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0110 : Poly :=
[
  term ((457683837192786418510946784204278657802514155300826424568956910 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (9, 1), (15, 3)]
]

/-- Partial product 110 for generator 18. -/
def ep_Q2_041_partial_18_0110 : Poly :=
[
  term ((915367674385572837021893568408557315605028310601652849137913820 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 3)],
  term ((-457683837192786418510946784204278657802514155300826424568956910 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 18. -/
theorem ep_Q2_041_partial_18_0110_valid :
    mulPoly ep_Q2_041_coefficient_18_0110
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0111 : Poly :=
[
  term ((47962317461058 : Rat) / 442987745227) [(0, 1), (6, 1), (10, 1)]
]

/-- Partial product 111 for generator 18. -/
def ep_Q2_041_partial_18_0111 : Poly :=
[
  term ((95924634922116 : Rat) / 442987745227) [(0, 1), (6, 1), (8, 1), (10, 1)],
  term ((-47962317461058 : Rat) / 442987745227) [(0, 1), (6, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 18. -/
theorem ep_Q2_041_partial_18_0111_valid :
    mulPoly ep_Q2_041_coefficient_18_0111
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0112 : Poly :=
[
  term ((-19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 112 for generator 18. -/
def ep_Q2_041_partial_18_0112 : Poly :=
[
  term ((-39865157681981450186319611747951741264495673421731515823801600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 18. -/
theorem ep_Q2_041_partial_18_0112_valid :
    mulPoly ep_Q2_041_coefficient_18_0112
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0113 : Poly :=
[
  term ((126548646593537749918609150271126461120801976056986392498439870 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 113 for generator 18. -/
def ep_Q2_041_partial_18_0113 : Poly :=
[
  term ((253097293187075499837218300542252922241603952113972784996879740 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-126548646593537749918609150271126461120801976056986392498439870 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 18. -/
theorem ep_Q2_041_partial_18_0113_valid :
    mulPoly ep_Q2_041_coefficient_18_0113
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0114 : Poly :=
[
  term ((-79730315363962900372639223495903482528991346843463031647603200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 3)]
]

/-- Partial product 114 for generator 18. -/
def ep_Q2_041_partial_18_0114 : Poly :=
[
  term ((-159460630727925800745278446991806965057982693686926063295206400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 3)],
  term ((79730315363962900372639223495903482528991346843463031647603200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 18. -/
theorem ep_Q2_041_partial_18_0114_valid :
    mulPoly ep_Q2_041_coefficient_18_0114
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0115 : Poly :=
[
  term ((-328884462590112 : Rat) / 3100914216589) [(0, 1), (6, 1), (10, 1), (14, 1)]
]

/-- Partial product 115 for generator 18. -/
def ep_Q2_041_partial_18_0115 : Poly :=
[
  term ((-657768925180224 : Rat) / 3100914216589) [(0, 1), (6, 1), (8, 1), (10, 1), (14, 1)],
  term ((328884462590112 : Rat) / 3100914216589) [(0, 1), (6, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 18. -/
theorem ep_Q2_041_partial_18_0115_valid :
    mulPoly ep_Q2_041_coefficient_18_0115
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0116 : Poly :=
[
  term ((573271162457745432464205970796180140836707783102570583027387600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 116 for generator 18. -/
def ep_Q2_041_partial_18_0116 : Poly :=
[
  term ((1146542324915490864928411941592360281673415566205141166054775200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-573271162457745432464205970796180140836707783102570583027387600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 18. -/
theorem ep_Q2_041_partial_18_0116_valid :
    mulPoly ep_Q2_041_coefficient_18_0116
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0117 : Poly :=
[
  term ((-23025572671750142596542036969864145045789756534171368186662798297 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (10, 1), (15, 2)]
]

/-- Partial product 117 for generator 18. -/
def ep_Q2_041_partial_18_0117 : Poly :=
[
  term ((-23025572671750142596542036969864145045789756534171368186662798297 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (10, 1), (15, 2)],
  term ((23025572671750142596542036969864145045789756534171368186662798297 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 18. -/
theorem ep_Q2_041_partial_18_0117_valid :
    mulPoly ep_Q2_041_coefficient_18_0117
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0118 : Poly :=
[
  term ((2293084649830981729856823883184720563346831132410282332109550400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (10, 1), (15, 4)]
]

/-- Partial product 118 for generator 18. -/
def ep_Q2_041_partial_18_0118 : Poly :=
[
  term ((4586169299661963459713647766369441126693662264820564664219100800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (10, 1), (15, 4)],
  term ((-2293084649830981729856823883184720563346831132410282332109550400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 18. -/
theorem ep_Q2_041_partial_18_0118_valid :
    mulPoly ep_Q2_041_coefficient_18_0118
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0119 : Poly :=
[
  term ((25223024167097109339256085696075581870810726889978116121960 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 119 for generator 18. -/
def ep_Q2_041_partial_18_0119 : Poly :=
[
  term ((50446048334194218678512171392151163741621453779956232243920 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-25223024167097109339256085696075581870810726889978116121960 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 18. -/
theorem ep_Q2_041_partial_18_0119_valid :
    mulPoly ep_Q2_041_coefficient_18_0119
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0120 : Poly :=
[
  term ((47258150505061170125085552548763289560211722965044671091376646851 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 120 for generator 18. -/
def ep_Q2_041_partial_18_0120 : Poly :=
[
  term ((94516301010122340250171105097526579120423445930089342182753293702 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-47258150505061170125085552548763289560211722965044671091376646851 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 18. -/
theorem ep_Q2_041_partial_18_0120_valid :
    mulPoly ep_Q2_041_coefficient_18_0120
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0121 : Poly :=
[
  term ((-3525690981387876139767418263568288717201606733263622100689517600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 121 for generator 18. -/
def ep_Q2_041_partial_18_0121 : Poly :=
[
  term ((-7051381962775752279534836527136577434403213466527244201379035200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((3525690981387876139767418263568288717201606733263622100689517600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 18. -/
theorem ep_Q2_041_partial_18_0121_valid :
    mulPoly ep_Q2_041_coefficient_18_0121
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0122 : Poly :=
[
  term ((-34882012971733768913029660279457773606433714244015076345826400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 122 for generator 18. -/
def ep_Q2_041_partial_18_0122 : Poly :=
[
  term ((-69764025943467537826059320558915547212867428488030152691652800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((34882012971733768913029660279457773606433714244015076345826400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 18. -/
theorem ep_Q2_041_partial_18_0122_valid :
    mulPoly ep_Q2_041_coefficient_18_0122
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0123 : Poly :=
[
  term ((-59924265339007294444129485871760868031874526179660638058143188281 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 123 for generator 18. -/
def ep_Q2_041_partial_18_0123 : Poly :=
[
  term ((-59924265339007294444129485871760868031874526179660638058143188281 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((59924265339007294444129485871760868031874526179660638058143188281 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 18. -/
theorem ep_Q2_041_partial_18_0123_valid :
    mulPoly ep_Q2_041_coefficient_18_0123
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0124 : Poly :=
[
  term ((2220692431796346249673282705117389535183703987694330858520288350 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (11, 1), (15, 3)]
]

/-- Partial product 124 for generator 18. -/
def ep_Q2_041_partial_18_0124 : Poly :=
[
  term ((4441384863592692499346565410234779070367407975388661717040576700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 3)],
  term ((-2220692431796346249673282705117389535183703987694330858520288350 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 18. -/
theorem ep_Q2_041_partial_18_0124_valid :
    mulPoly ep_Q2_041_coefficient_18_0124
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0125 : Poly :=
[
  term ((356291501139288 : Rat) / 3100914216589) [(0, 1), (6, 1), (11, 2)]
]

/-- Partial product 125 for generator 18. -/
def ep_Q2_041_partial_18_0125 : Poly :=
[
  term ((712583002278576 : Rat) / 3100914216589) [(0, 1), (6, 1), (8, 1), (11, 2)],
  term ((-356291501139288 : Rat) / 3100914216589) [(0, 1), (6, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 18. -/
theorem ep_Q2_041_partial_18_0125_valid :
    mulPoly ep_Q2_041_coefficient_18_0125
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0126 : Poly :=
[
  term ((-822211156475280 : Rat) / 3100914216589) [(0, 1), (6, 1), (11, 2), (14, 1)]
]

/-- Partial product 126 for generator 18. -/
def ep_Q2_041_partial_18_0126 : Poly :=
[
  term ((-1644422312950560 : Rat) / 3100914216589) [(0, 1), (6, 1), (8, 1), (11, 2), (14, 1)],
  term ((822211156475280 : Rat) / 3100914216589) [(0, 1), (6, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 18. -/
theorem ep_Q2_041_partial_18_0126_valid :
    mulPoly ep_Q2_041_coefficient_18_0126
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0127 : Poly :=
[
  term ((22292621663241157391152251774106198968739130575677442112372656200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 127 for generator 18. -/
def ep_Q2_041_partial_18_0127 : Poly :=
[
  term ((44585243326482314782304503548212397937478261151354884224745312400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((-22292621663241157391152251774106198968739130575677442112372656200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 18. -/
theorem ep_Q2_041_partial_18_0127_valid :
    mulPoly ep_Q2_041_coefficient_18_0127
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0128 : Poly :=
[
  term ((13772573446282309982084953223939691657557723756298249591787790 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (11, 2), (15, 2)]
]

/-- Partial product 128 for generator 18. -/
def ep_Q2_041_partial_18_0128 : Poly :=
[
  term ((27545146892564619964169906447879383315115447512596499183575580 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (11, 2), (15, 2)],
  term ((-13772573446282309982084953223939691657557723756298249591787790 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 18. -/
theorem ep_Q2_041_partial_18_0128_valid :
    mulPoly ep_Q2_041_coefficient_18_0128
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0129 : Poly :=
[
  term ((-49831447102476812732899514684939676580619591777164394779752000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (11, 3), (14, 1), (15, 1)]
]

/-- Partial product 129 for generator 18. -/
def ep_Q2_041_partial_18_0129 : Poly :=
[
  term ((-99662894204953625465799029369879353161239183554328789559504000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (11, 3), (14, 1), (15, 1)],
  term ((49831447102476812732899514684939676580619591777164394779752000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 18. -/
theorem ep_Q2_041_partial_18_0129_valid :
    mulPoly ep_Q2_041_coefficient_18_0129
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0130 : Poly :=
[
  term ((21593627077739952184256456363473859851601823103437904404559200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (11, 3), (15, 1)]
]

/-- Partial product 130 for generator 18. -/
def ep_Q2_041_partial_18_0130 : Poly :=
[
  term ((43187254155479904368512912726947719703203646206875808809118400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (11, 3), (15, 1)],
  term ((-21593627077739952184256456363473859851601823103437904404559200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 18. -/
theorem ep_Q2_041_partial_18_0130_valid :
    mulPoly ep_Q2_041_coefficient_18_0130
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0131 : Poly :=
[
  term ((-151420202448554281485812552221545707929861751726887310709540 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 131 for generator 18. -/
def ep_Q2_041_partial_18_0131 : Poly :=
[
  term ((-302840404897108562971625104443091415859723503453774621419080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((151420202448554281485812552221545707929861751726887310709540 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 18. -/
theorem ep_Q2_041_partial_18_0131_valid :
    mulPoly ep_Q2_041_coefficient_18_0131
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0132 : Poly :=
[
  term ((811900280059119549902410211442989455947543696434027772857340 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 132 for generator 18. -/
def ep_Q2_041_partial_18_0132 : Poly :=
[
  term ((1623800560118239099804820422885978911895087392868055545714680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-811900280059119549902410211442989455947543696434027772857340 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 18. -/
theorem ep_Q2_041_partial_18_0132_valid :
    mulPoly ep_Q2_041_coefficient_18_0132
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0133 : Poly :=
[
  term ((853306710285744 : Rat) / 3100914216589) [(0, 1), (6, 1), (14, 1)]
]

/-- Partial product 133 for generator 18. -/
def ep_Q2_041_partial_18_0133 : Poly :=
[
  term ((1706613420571488 : Rat) / 3100914216589) [(0, 1), (6, 1), (8, 1), (14, 1)],
  term ((-853306710285744 : Rat) / 3100914216589) [(0, 1), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 18. -/
theorem ep_Q2_041_partial_18_0133_valid :
    mulPoly ep_Q2_041_coefficient_18_0133
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0134 : Poly :=
[
  term ((-1022862338136615502468464702707076852696645868033264447448496853 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (14, 1), (15, 2)]
]

/-- Partial product 134 for generator 18. -/
def ep_Q2_041_partial_18_0134 : Poly :=
[
  term ((-2045724676273231004936929405414153705393291736066528894896993706 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((1022862338136615502468464702707076852696645868033264447448496853 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 18. -/
theorem ep_Q2_041_partial_18_0134_valid :
    mulPoly ep_Q2_041_coefficient_18_0134
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0135 : Poly :=
[
  term ((-35829447653609089529012873174761258802294236443910661439211725 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (14, 1), (15, 4)]
]

/-- Partial product 135 for generator 18. -/
def ep_Q2_041_partial_18_0135 : Poly :=
[
  term ((-71658895307218179058025746349522517604588472887821322878423450 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (14, 1), (15, 4)],
  term ((35829447653609089529012873174761258802294236443910661439211725 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 18. -/
theorem ep_Q2_041_partial_18_0135_valid :
    mulPoly ep_Q2_041_coefficient_18_0135
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0136 : Poly :=
[
  term ((-82221115647528 : Rat) / 442987745227) [(0, 1), (6, 1), (14, 2)]
]

/-- Partial product 136 for generator 18. -/
def ep_Q2_041_partial_18_0136 : Poly :=
[
  term ((-164442231295056 : Rat) / 442987745227) [(0, 1), (6, 1), (8, 1), (14, 2)],
  term ((82221115647528 : Rat) / 442987745227) [(0, 1), (6, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 18. -/
theorem ep_Q2_041_partial_18_0136_valid :
    mulPoly ep_Q2_041_coefficient_18_0136
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0137 : Poly :=
[
  term ((377386838934581833547474907998346458834241148501857176191698735 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (6, 1), (14, 2), (15, 2)]
]

/-- Partial product 137 for generator 18. -/
def ep_Q2_041_partial_18_0137 : Poly :=
[
  term ((377386838934581833547474907998346458834241148501857176191698735 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (14, 2), (15, 2)],
  term ((-377386838934581833547474907998346458834241148501857176191698735 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (6, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 18. -/
theorem ep_Q2_041_partial_18_0137_valid :
    mulPoly ep_Q2_041_coefficient_18_0137
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0138 : Poly :=
[
  term ((12149700083149487980130213491847871738070410085444011280775049315 : Rat) / 46599286823855691053152841592521681817985443798359450859152872) [(0, 1), (6, 1), (15, 2)]
]

/-- Partial product 138 for generator 18. -/
def ep_Q2_041_partial_18_0138 : Poly :=
[
  term ((12149700083149487980130213491847871738070410085444011280775049315 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((-12149700083149487980130213491847871738070410085444011280775049315 : Rat) / 46599286823855691053152841592521681817985443798359450859152872) [(0, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 18. -/
theorem ep_Q2_041_partial_18_0138_valid :
    mulPoly ep_Q2_041_coefficient_18_0138
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0139 : Poly :=
[
  term ((-358294476536090895290128731747612588022942364439106614392117250 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (15, 4)]
]

/-- Partial product 139 for generator 18. -/
def ep_Q2_041_partial_18_0139 : Poly :=
[
  term ((-716588953072181790580257463495225176045884728878213228784234500 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (15, 4)],
  term ((358294476536090895290128731747612588022942364439106614392117250 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 18. -/
theorem ep_Q2_041_partial_18_0139_valid :
    mulPoly ep_Q2_041_coefficient_18_0139
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0140 : Poly :=
[
  term ((82221115647528 : Rat) / 3100914216589) [(0, 1), (6, 2)]
]

/-- Partial product 140 for generator 18. -/
def ep_Q2_041_partial_18_0140 : Poly :=
[
  term ((-82221115647528 : Rat) / 3100914216589) [(0, 1), (6, 2)],
  term ((164442231295056 : Rat) / 3100914216589) [(0, 1), (6, 2), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 18. -/
theorem ep_Q2_041_partial_18_0140_valid :
    mulPoly ep_Q2_041_coefficient_18_0140
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0141 : Poly :=
[
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 2), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 141 for generator 18. -/
def ep_Q2_041_partial_18_0141 : Poly :=
[
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 2), (8, 1), (11, 1), (15, 1)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 18. -/
theorem ep_Q2_041_partial_18_0141_valid :
    mulPoly ep_Q2_041_coefficient_18_0141
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0142 : Poly :=
[
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 2), (8, 1), (15, 2)]
]

/-- Partial product 142 for generator 18. -/
def ep_Q2_041_partial_18_0142 : Poly :=
[
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 2), (8, 1), (15, 2)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (8, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 18. -/
theorem ep_Q2_041_partial_18_0142_valid :
    mulPoly ep_Q2_041_coefficient_18_0142
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0143 : Poly :=
[
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 2), (9, 1), (10, 1), (15, 1)]
]

/-- Partial product 143 for generator 18. -/
def ep_Q2_041_partial_18_0143 : Poly :=
[
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 18. -/
theorem ep_Q2_041_partial_18_0143_valid :
    mulPoly ep_Q2_041_coefficient_18_0143
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0144 : Poly :=
[
  term ((-14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 2), (9, 1), (11, 1), (15, 2)]
]

/-- Partial product 144 for generator 18. -/
def ep_Q2_041_partial_18_0144 : Poly :=
[
  term ((-29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 18. -/
theorem ep_Q2_041_partial_18_0144_valid :
    mulPoly ep_Q2_041_coefficient_18_0144
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0145 : Poly :=
[
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (9, 1), (14, 1), (15, 1)]
]

/-- Partial product 145 for generator 18. -/
def ep_Q2_041_partial_18_0145 : Poly :=
[
  term ((9040999247496886275929303621393680335148668260328163305951110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 18. -/
theorem ep_Q2_041_partial_18_0145_valid :
    mulPoly ep_Q2_041_coefficient_18_0145
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0146 : Poly :=
[
  term ((-3461333030754051033270590310503357157006789999396833504879475043 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (9, 1), (15, 1)]
]

/-- Partial product 146 for generator 18. -/
def ep_Q2_041_partial_18_0146 : Poly :=
[
  term ((-6922666061508102066541180621006714314013579998793667009758950086 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (8, 1), (9, 1), (15, 1)],
  term ((3461333030754051033270590310503357157006789999396833504879475043 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 18. -/
theorem ep_Q2_041_partial_18_0146_valid :
    mulPoly ep_Q2_041_coefficient_18_0146
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0147 : Poly :=
[
  term ((429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (9, 1), (15, 3)]
]

/-- Partial product 147 for generator 18. -/
def ep_Q2_041_partial_18_0147 : Poly :=
[
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (8, 1), (9, 1), (15, 3)],
  term ((-429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 18. -/
theorem ep_Q2_041_partial_18_0147_valid :
    mulPoly ep_Q2_041_coefficient_18_0147
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0148 : Poly :=
[
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 148 for generator 18. -/
def ep_Q2_041_partial_18_0148 : Poly :=
[
  term ((9040999247496886275929303621393680335148668260328163305951110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 18. -/
theorem ep_Q2_041_partial_18_0148_valid :
    mulPoly ep_Q2_041_coefficient_18_0148
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0149 : Poly :=
[
  term ((-661915921094653362428870495670914086067094221199902286651398090 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (6, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 149 for generator 18. -/
def ep_Q2_041_partial_18_0149 : Poly :=
[
  term ((-1323831842189306724857740991341828172134188442399804573302796180 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (6, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((661915921094653362428870495670914086067094221199902286651398090 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (6, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 18. -/
theorem ep_Q2_041_partial_18_0149_valid :
    mulPoly ep_Q2_041_coefficient_18_0149
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0150 : Poly :=
[
  term ((1286684895300217453496498117167849275959012451556916531497800175 : Rat) / 7091195821021518203740649807557647233171697969315568609001524) [(0, 1), (6, 2), (11, 1), (15, 1)]
]

/-- Partial product 150 for generator 18. -/
def ep_Q2_041_partial_18_0150 : Poly :=
[
  term ((1286684895300217453496498117167849275959012451556916531497800175 : Rat) / 3545597910510759101870324903778823616585848984657784304500762) [(0, 1), (6, 2), (8, 1), (11, 1), (15, 1)],
  term ((-1286684895300217453496498117167849275959012451556916531497800175 : Rat) / 7091195821021518203740649807557647233171697969315568609001524) [(0, 1), (6, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 18. -/
theorem ep_Q2_041_partial_18_0150_valid :
    mulPoly ep_Q2_041_coefficient_18_0150
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0151 : Poly :=
[
  term ((29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 2), (11, 1), (15, 3)]
]

/-- Partial product 151 for generator 18. -/
def ep_Q2_041_partial_18_0151 : Poly :=
[
  term ((59797736522972175279479417621927611896743510132597273735702400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 2), (8, 1), (11, 1), (15, 3)],
  term ((-29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 18. -/
theorem ep_Q2_041_partial_18_0151_valid :
    mulPoly ep_Q2_041_coefficient_18_0151
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0152 : Poly :=
[
  term ((123331673471292 : Rat) / 3100914216589) [(0, 1), (6, 2), (14, 1)]
]

/-- Partial product 152 for generator 18. -/
def ep_Q2_041_partial_18_0152 : Poly :=
[
  term ((246663346942584 : Rat) / 3100914216589) [(0, 1), (6, 2), (8, 1), (14, 1)],
  term ((-123331673471292 : Rat) / 3100914216589) [(0, 1), (6, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 18. -/
theorem ep_Q2_041_partial_18_0152_valid :
    mulPoly ep_Q2_041_coefficient_18_0152
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0153 : Poly :=
[
  term ((-214976685921654537174077239048567552813765418663463968635270350 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (14, 1), (15, 2)]
]

/-- Partial product 153 for generator 18. -/
def ep_Q2_041_partial_18_0153 : Poly :=
[
  term ((-429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (8, 1), (14, 1), (15, 2)],
  term ((214976685921654537174077239048567552813765418663463968635270350 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 18. -/
theorem ep_Q2_041_partial_18_0153_valid :
    mulPoly ep_Q2_041_coefficient_18_0153
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0154 : Poly :=
[
  term ((124122692855619528105658748876421114826620385835541995618260773 : Rat) / 1032262682806929865101486997302695483309804134773785303841994) [(0, 1), (6, 2), (15, 2)]
]

/-- Partial product 154 for generator 18. -/
def ep_Q2_041_partial_18_0154 : Poly :=
[
  term ((124122692855619528105658748876421114826620385835541995618260773 : Rat) / 516131341403464932550743498651347741654902067386892651920997) [(0, 1), (6, 2), (8, 1), (15, 2)],
  term ((-124122692855619528105658748876421114826620385835541995618260773 : Rat) / 1032262682806929865101486997302695483309804134773785303841994) [(0, 1), (6, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 18. -/
theorem ep_Q2_041_partial_18_0154_valid :
    mulPoly ep_Q2_041_coefficient_18_0154
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0155 : Poly :=
[
  term ((-859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (15, 4)]
]

/-- Partial product 155 for generator 18. -/
def ep_Q2_041_partial_18_0155 : Poly :=
[
  term ((-1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (8, 1), (15, 4)],
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 18. -/
theorem ep_Q2_041_partial_18_0155_valid :
    mulPoly ep_Q2_041_coefficient_18_0155
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0156 : Poly :=
[
  term ((95924634922116 : Rat) / 442987745227) [(0, 1), (7, 1), (8, 1), (11, 1)]
]

/-- Partial product 156 for generator 18. -/
def ep_Q2_041_partial_18_0156 : Poly :=
[
  term ((-95924634922116 : Rat) / 442987745227) [(0, 1), (7, 1), (8, 1), (11, 1)],
  term ((191849269844232 : Rat) / 442987745227) [(0, 1), (7, 1), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 18. -/
theorem ep_Q2_041_partial_18_0156_valid :
    mulPoly ep_Q2_041_coefficient_18_0156
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0157 : Poly :=
[
  term ((246663346942584 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 157 for generator 18. -/
def ep_Q2_041_partial_18_0157 : Poly :=
[
  term ((-246663346942584 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((493326693885168 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 18. -/
theorem ep_Q2_041_partial_18_0157_valid :
    mulPoly ep_Q2_041_coefficient_18_0157
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0158 : Poly :=
[
  term ((-2903567053871391178458657360636112751778949119289129725089100 : Rat) / 516131341403464932550743498651347741654902067386892651920997) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 158 for generator 18. -/
def ep_Q2_041_partial_18_0158 : Poly :=
[
  term ((2903567053871391178458657360636112751778949119289129725089100 : Rat) / 516131341403464932550743498651347741654902067386892651920997) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-5807134107742782356917314721272225503557898238578259450178200 : Rat) / 516131341403464932550743498651347741654902067386892651920997) [(0, 1), (7, 1), (8, 2), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 18. -/
theorem ep_Q2_041_partial_18_0158_valid :
    mulPoly ep_Q2_041_coefficient_18_0158
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0159 : Poly :=
[
  term ((-136668225619767823692626001729086195663591108330176560813551090 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 159 for generator 18. -/
def ep_Q2_041_partial_18_0159 : Poly :=
[
  term ((136668225619767823692626001729086195663591108330176560813551090 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-273336451239535647385252003458172391327182216660353121627102180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 18. -/
theorem ep_Q2_041_partial_18_0159_valid :
    mulPoly ep_Q2_041_coefficient_18_0159
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0160 : Poly :=
[
  term ((14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 160 for generator 18. -/
def ep_Q2_041_partial_18_0160 : Poly :=
[
  term ((-14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 2), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 18. -/
theorem ep_Q2_041_partial_18_0160_valid :
    mulPoly ep_Q2_041_coefficient_18_0160
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0161 : Poly :=
[
  term ((40695681800356063731867936992700735874172666618017589070130800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 161 for generator 18. -/
def ep_Q2_041_partial_18_0161 : Poly :=
[
  term ((-40695681800356063731867936992700735874172666618017589070130800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((81391363600712127463735873985401471748345333236035178140261600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 18. -/
theorem ep_Q2_041_partial_18_0161_valid :
    mulPoly ep_Q2_041_coefficient_18_0161
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0162 : Poly :=
[
  term ((12611512083548554669628042848037790935405363444989058060980 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 162 for generator 18. -/
def ep_Q2_041_partial_18_0162 : Poly :=
[
  term ((-12611512083548554669628042848037790935405363444989058060980 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((25223024167097109339256085696075581870810726889978116121960 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (7, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 18. -/
theorem ep_Q2_041_partial_18_0162_valid :
    mulPoly ep_Q2_041_coefficient_18_0162
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0163 : Poly :=
[
  term ((4266659247794720260546901156940463027012199850076153448977308064 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1)]
]

/-- Partial product 163 for generator 18. -/
def ep_Q2_041_partial_18_0163 : Poly :=
[
  term ((-4266659247794720260546901156940463027012199850076153448977308064 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((8533318495589440521093802313880926054024399700152306897954616128 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 18. -/
theorem ep_Q2_041_partial_18_0163_valid :
    mulPoly ep_Q2_041_coefficient_18_0163
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0164 : Poly :=
[
  term ((-35829447653609089529012873174761258802294236443910661439211725 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 3)]
]

/-- Partial product 164 for generator 18. -/
def ep_Q2_041_partial_18_0164 : Poly :=
[
  term ((35829447653609089529012873174761258802294236443910661439211725 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((-71658895307218179058025746349522517604588472887821322878423450 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 18. -/
theorem ep_Q2_041_partial_18_0164_valid :
    mulPoly ep_Q2_041_coefficient_18_0164
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0165 : Poly :=
[
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (7, 1), (8, 1), (14, 2), (15, 1)]
]

/-- Partial product 165 for generator 18. -/
def ep_Q2_041_partial_18_0165 : Poly :=
[
  term ((-49945656414809640789968036653966091588270367061404449465055 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (7, 1), (8, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 18. -/
theorem ep_Q2_041_partial_18_0165_valid :
    mulPoly ep_Q2_041_coefficient_18_0165
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0166 : Poly :=
[
  term ((-5963886448202182719129400818850445994539464994994473394719007056 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (15, 1)]
]

/-- Partial product 166 for generator 18. -/
def ep_Q2_041_partial_18_0166 : Poly :=
[
  term ((5963886448202182719129400818850445994539464994994473394719007056 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((-11927772896404365438258801637700891989078929989988946789438014112 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 18. -/
theorem ep_Q2_041_partial_18_0166_valid :
    mulPoly ep_Q2_041_coefficient_18_0166
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0167 : Poly :=
[
  term ((71658895307218179058025746349522517604588472887821322878423450 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (8, 1), (15, 3)]
]

/-- Partial product 167 for generator 18. -/
def ep_Q2_041_partial_18_0167 : Poly :=
[
  term ((-71658895307218179058025746349522517604588472887821322878423450 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (8, 1), (15, 3)],
  term ((143317790614436358116051492699045035209176945775642645756846900 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (8, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 18. -/
theorem ep_Q2_041_partial_18_0167_valid :
    mulPoly ep_Q2_041_coefficient_18_0167
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0168 : Poly :=
[
  term ((-14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 168 for generator 18. -/
def ep_Q2_041_partial_18_0168 : Poly :=
[
  term ((-29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 18. -/
theorem ep_Q2_041_partial_18_0168_valid :
    mulPoly ep_Q2_041_coefficient_18_0168
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0169 : Poly :=
[
  term ((-246663346942584 : Rat) / 3100914216589) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1)]
]

/-- Partial product 169 for generator 18. -/
def ep_Q2_041_partial_18_0169 : Poly :=
[
  term ((-493326693885168 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((246663346942584 : Rat) / 3100914216589) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 18. -/
theorem ep_Q2_041_partial_18_0169_valid :
    mulPoly ep_Q2_041_coefficient_18_0169
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0170 : Poly :=
[
  term ((429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 170 for generator 18. -/
def ep_Q2_041_partial_18_0170 : Poly :=
[
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 18. -/
theorem ep_Q2_041_partial_18_0170_valid :
    mulPoly ep_Q2_041_coefficient_18_0170
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0171 : Poly :=
[
  term ((28653082083924167321417220943840314033856265271869526998357400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 171 for generator 18. -/
def ep_Q2_041_partial_18_0171 : Poly :=
[
  term ((57306164167848334642834441887680628067712530543739053996714800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-28653082083924167321417220943840314033856265271869526998357400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 18. -/
theorem ep_Q2_041_partial_18_0171_valid :
    mulPoly ep_Q2_041_coefficient_18_0171
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0172 : Poly :=
[
  term ((20555278911882 : Rat) / 134822357243) [(0, 1), (7, 1), (9, 1), (14, 1)]
]

/-- Partial product 172 for generator 18. -/
def ep_Q2_041_partial_18_0172 : Poly :=
[
  term ((41110557823764 : Rat) / 134822357243) [(0, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-20555278911882 : Rat) / 134822357243) [(0, 1), (7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 18. -/
theorem ep_Q2_041_partial_18_0172_valid :
    mulPoly ep_Q2_041_coefficient_18_0172
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0173 : Poly :=
[
  term ((-23014901413043678155172718719730485887265331660375989019451320 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 173 for generator 18. -/
def ep_Q2_041_partial_18_0173 : Poly :=
[
  term ((-46029802826087356310345437439460971774530663320751978038902640 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((23014901413043678155172718719730485887265331660375989019451320 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 18. -/
theorem ep_Q2_041_partial_18_0173_valid :
    mulPoly ep_Q2_041_coefficient_18_0173
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0174 : Poly :=
[
  term ((-356291501139288 : Rat) / 3100914216589) [(0, 1), (7, 1), (10, 1), (11, 1)]
]

/-- Partial product 174 for generator 18. -/
def ep_Q2_041_partial_18_0174 : Poly :=
[
  term ((-712583002278576 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((356291501139288 : Rat) / 3100914216589) [(0, 1), (7, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 18. -/
theorem ep_Q2_041_partial_18_0174_valid :
    mulPoly ep_Q2_041_coefficient_18_0174
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0175 : Poly :=
[
  term ((822211156475280 : Rat) / 3100914216589) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 175 for generator 18. -/
def ep_Q2_041_partial_18_0175 : Poly :=
[
  term ((1644422312950560 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((-822211156475280 : Rat) / 3100914216589) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 18. -/
theorem ep_Q2_041_partial_18_0175_valid :
    mulPoly ep_Q2_041_coefficient_18_0175
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0176 : Poly :=
[
  term ((3380539883954896528837578191574722405596083107917654078155574200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 176 for generator 18. -/
def ep_Q2_041_partial_18_0176 : Poly :=
[
  term ((6761079767909793057675156383149444811192166215835308156311148400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3380539883954896528837578191574722405596083107917654078155574200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 18. -/
theorem ep_Q2_041_partial_18_0176_valid :
    mulPoly ep_Q2_041_coefficient_18_0176
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0177 : Poly :=
[
  term ((-185691065949827313910588278886981575860695315387515411581932190 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 177 for generator 18. -/
def ep_Q2_041_partial_18_0177 : Poly :=
[
  term ((-371382131899654627821176557773963151721390630775030823163864380 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((185691065949827313910588278886981575860695315387515411581932190 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 18. -/
theorem ep_Q2_041_partial_18_0177_valid :
    mulPoly ep_Q2_041_coefficient_18_0177
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0178 : Poly :=
[
  term ((49831447102476812732899514684939676580619591777164394779752000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (10, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 178 for generator 18. -/
def ep_Q2_041_partial_18_0178 : Poly :=
[
  term ((99662894204953625465799029369879353161239183554328789559504000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-49831447102476812732899514684939676580619591777164394779752000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (10, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 18. -/
theorem ep_Q2_041_partial_18_0178_valid :
    mulPoly ep_Q2_041_coefficient_18_0178
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0179 : Poly :=
[
  term ((-21593627077739952184256456363473859851601823103437904404559200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 179 for generator 18. -/
def ep_Q2_041_partial_18_0179 : Poly :=
[
  term ((-43187254155479904368512912726947719703203646206875808809118400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((21593627077739952184256456363473859851601823103437904404559200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 18. -/
theorem ep_Q2_041_partial_18_0179_valid :
    mulPoly ep_Q2_041_coefficient_18_0179
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0180 : Poly :=
[
  term ((-25223024167097109339256085696075581870810726889978116121960 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 180 for generator 18. -/
def ep_Q2_041_partial_18_0180 : Poly :=
[
  term ((-50446048334194218678512171392151163741621453779956232243920 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((25223024167097109339256085696075581870810726889978116121960 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 18. -/
theorem ep_Q2_041_partial_18_0180_valid :
    mulPoly ep_Q2_041_coefficient_18_0180
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0181 : Poly :=
[
  term ((-4580617021314748009380979740950509906470238264392503383772359714 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 181 for generator 18. -/
def ep_Q2_041_partial_18_0181 : Poly :=
[
  term ((-9161234042629496018761959481901019812940476528785006767544719428 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((4580617021314748009380979740950509906470238264392503383772359714 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 18. -/
theorem ep_Q2_041_partial_18_0181_valid :
    mulPoly ep_Q2_041_coefficient_18_0181
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0182 : Poly :=
[
  term ((-859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 3)]
]

/-- Partial product 182 for generator 18. -/
def ep_Q2_041_partial_18_0182 : Poly :=
[
  term ((-1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 18. -/
theorem ep_Q2_041_partial_18_0182_valid :
    mulPoly ep_Q2_041_coefficient_18_0182
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0183 : Poly :=
[
  term ((2415587818275956048745593674521896496223880835969525361384705 : Rat) / 12823138916856271616167540339163919047326759438183668370708) [(0, 1), (7, 1), (10, 1), (15, 1)]
]

/-- Partial product 183 for generator 18. -/
def ep_Q2_041_partial_18_0183 : Poly :=
[
  term ((2415587818275956048745593674521896496223880835969525361384705 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((-2415587818275956048745593674521896496223880835969525361384705 : Rat) / 12823138916856271616167540339163919047326759438183668370708) [(0, 1), (7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 18. -/
theorem ep_Q2_041_partial_18_0183_valid :
    mulPoly ep_Q2_041_coefficient_18_0183
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0184 : Poly :=
[
  term ((201091641869727508138337078523115372643067811469305939835670 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (10, 2), (15, 1)]
]

/-- Partial product 184 for generator 18. -/
def ep_Q2_041_partial_18_0184 : Poly :=
[
  term ((402183283739455016276674157046230745286135622938611879671340 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-201091641869727508138337078523115372643067811469305939835670 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (10, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 18. -/
theorem ep_Q2_041_partial_18_0184_valid :
    mulPoly ep_Q2_041_coefficient_18_0184
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0185 : Poly :=
[
  term ((47962317461058 : Rat) / 442987745227) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 185 for generator 18. -/
def ep_Q2_041_partial_18_0185 : Poly :=
[
  term ((95924634922116 : Rat) / 442987745227) [(0, 1), (7, 1), (8, 1), (11, 1)],
  term ((-47962317461058 : Rat) / 442987745227) [(0, 1), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 18. -/
theorem ep_Q2_041_partial_18_0185_valid :
    mulPoly ep_Q2_041_coefficient_18_0185
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0186 : Poly :=
[
  term ((-205552789118820 : Rat) / 3100914216589) [(0, 1), (7, 1), (11, 1), (14, 1)]
]

/-- Partial product 186 for generator 18. -/
def ep_Q2_041_partial_18_0186 : Poly :=
[
  term ((-411105578237640 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((205552789118820 : Rat) / 3100914216589) [(0, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 18. -/
theorem ep_Q2_041_partial_18_0186_valid :
    mulPoly ep_Q2_041_coefficient_18_0186
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0187 : Poly :=
[
  term ((3567439669935597635288857477457727759814844074888493638208146050 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 187 for generator 18. -/
def ep_Q2_041_partial_18_0187 : Poly :=
[
  term ((7134879339871195270577714954915455519629688149776987276416292100 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-3567439669935597635288857477457727759814844074888493638208146050 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 18. -/
theorem ep_Q2_041_partial_18_0187_valid :
    mulPoly ep_Q2_041_coefficient_18_0187
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0188 : Poly :=
[
  term ((-1315537850360448 : Rat) / 3100914216589) [(0, 1), (7, 1), (11, 1), (14, 2)]
]

/-- Partial product 188 for generator 18. -/
def ep_Q2_041_partial_18_0188 : Poly :=
[
  term ((-2631075700720896 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 2)],
  term ((1315537850360448 : Rat) / 3100914216589) [(0, 1), (7, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 18. -/
theorem ep_Q2_041_partial_18_0188_valid :
    mulPoly ep_Q2_041_coefficient_18_0188
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0189 : Poly :=
[
  term ((1891941500656043387356982789970956166872843418604108954132546800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (11, 1), (14, 2), (15, 2)]
]

/-- Partial product 189 for generator 18. -/
def ep_Q2_041_partial_18_0189 : Poly :=
[
  term ((3783883001312086774713965579941912333745686837208217908265093600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((-1891941500656043387356982789970956166872843418604108954132546800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (11, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 18. -/
theorem ep_Q2_041_partial_18_0189_valid :
    mulPoly ep_Q2_041_coefficient_18_0189
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0190 : Poly :=
[
  term ((-68334112809883911846313000864543097831795554165088280406775545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 190 for generator 18. -/
def ep_Q2_041_partial_18_0190 : Poly :=
[
  term ((-136668225619767823692626001729086195663591108330176560813551090 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((68334112809883911846313000864543097831795554165088280406775545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 18. -/
theorem ep_Q2_041_partial_18_0190_valid :
    mulPoly ep_Q2_041_coefficient_18_0190
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0191 : Poly :=
[
  term ((-12457861775619203183224878671234919145154897944291098694938000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 191 for generator 18. -/
def ep_Q2_041_partial_18_0191 : Poly :=
[
  term ((-24915723551238406366449757342469838290309795888582197389876000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((12457861775619203183224878671234919145154897944291098694938000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 18. -/
theorem ep_Q2_041_partial_18_0191_valid :
    mulPoly ep_Q2_041_coefficient_18_0191
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0192 : Poly :=
[
  term ((-79730315363962900372639223495903482528991346843463031647603200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (11, 2), (14, 2), (15, 1)]
]

/-- Partial product 192 for generator 18. -/
def ep_Q2_041_partial_18_0192 : Poly :=
[
  term ((-159460630727925800745278446991806965057982693686926063295206400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (11, 2), (14, 2), (15, 1)],
  term ((79730315363962900372639223495903482528991346843463031647603200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 18. -/
theorem ep_Q2_041_partial_18_0192_valid :
    mulPoly ep_Q2_041_coefficient_18_0192
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0193 : Poly :=
[
  term ((20347840900178031865933968496350367937086333309008794535065400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (11, 2), (15, 1)]
]

/-- Partial product 193 for generator 18. -/
def ep_Q2_041_partial_18_0193 : Poly :=
[
  term ((40695681800356063731867936992700735874172666618017589070130800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (11, 2), (15, 1)],
  term ((-20347840900178031865933968496350367937086333309008794535065400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 18. -/
theorem ep_Q2_041_partial_18_0193_valid :
    mulPoly ep_Q2_041_coefficient_18_0193
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0194 : Poly :=
[
  term ((151420202448554281485812552221545707929861751726887310709540 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 194 for generator 18. -/
def ep_Q2_041_partial_18_0194 : Poly :=
[
  term ((302840404897108562971625104443091415859723503453774621419080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-151420202448554281485812552221545707929861751726887310709540 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 18. -/
theorem ep_Q2_041_partial_18_0194_valid :
    mulPoly ep_Q2_041_coefficient_18_0194
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0195 : Poly :=
[
  term ((-364191601093145859130614690337647877740653294136916211692550 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 195 for generator 18. -/
def ep_Q2_041_partial_18_0195 : Poly :=
[
  term ((-728383202186291718261229380675295755481306588273832423385100 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((364191601093145859130614690337647877740653294136916211692550 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 18. -/
theorem ep_Q2_041_partial_18_0195_valid :
    mulPoly ep_Q2_041_coefficient_18_0195
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0196 : Poly :=
[
  term ((-295836719777946122738300032840458121037786419908034308458575827 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 196 for generator 18. -/
def ep_Q2_041_partial_18_0196 : Poly :=
[
  term ((-295836719777946122738300032840458121037786419908034308458575827 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((295836719777946122738300032840458121037786419908034308458575827 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 18. -/
theorem ep_Q2_041_partial_18_0196_valid :
    mulPoly ep_Q2_041_coefficient_18_0196
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0197 : Poly :=
[
  term ((-573271162457745432464205970796180140836707783102570583027387600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (14, 1), (15, 3)]
]

/-- Partial product 197 for generator 18. -/
def ep_Q2_041_partial_18_0197 : Poly :=
[
  term ((-1146542324915490864928411941592360281673415566205141166054775200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((573271162457745432464205970796180140836707783102570583027387600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 18. -/
theorem ep_Q2_041_partial_18_0197_valid :
    mulPoly ep_Q2_041_coefficient_18_0197
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0198 : Poly :=
[
  term ((5692995569307708977097661248110910911941598823457128241778385379 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (7, 1), (14, 2), (15, 1)]
]

/-- Partial product 198 for generator 18. -/
def ep_Q2_041_partial_18_0198 : Poly :=
[
  term ((5692995569307708977097661248110910911941598823457128241778385379 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((-5692995569307708977097661248110910911941598823457128241778385379 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (7, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 18. -/
theorem ep_Q2_041_partial_18_0198_valid :
    mulPoly ep_Q2_041_coefficient_18_0198
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0199 : Poly :=
[
  term ((71658895307218179058025746349522517604588472887821322878423450 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (14, 2), (15, 3)]
]

/-- Partial product 199 for generator 18. -/
def ep_Q2_041_partial_18_0199 : Poly :=
[
  term ((143317790614436358116051492699045035209176945775642645756846900 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (14, 2), (15, 3)],
  term ((-71658895307218179058025746349522517604588472887821322878423450 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 18. -/
theorem ep_Q2_041_partial_18_0199_valid :
    mulPoly ep_Q2_041_coefficient_18_0199
        ep_Q2_041_generator_18_0100_0199 =
      ep_Q2_041_partial_18_0199 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_0100_0199 : List Poly :=
[
  ep_Q2_041_partial_18_0100,
  ep_Q2_041_partial_18_0101,
  ep_Q2_041_partial_18_0102,
  ep_Q2_041_partial_18_0103,
  ep_Q2_041_partial_18_0104,
  ep_Q2_041_partial_18_0105,
  ep_Q2_041_partial_18_0106,
  ep_Q2_041_partial_18_0107,
  ep_Q2_041_partial_18_0108,
  ep_Q2_041_partial_18_0109,
  ep_Q2_041_partial_18_0110,
  ep_Q2_041_partial_18_0111,
  ep_Q2_041_partial_18_0112,
  ep_Q2_041_partial_18_0113,
  ep_Q2_041_partial_18_0114,
  ep_Q2_041_partial_18_0115,
  ep_Q2_041_partial_18_0116,
  ep_Q2_041_partial_18_0117,
  ep_Q2_041_partial_18_0118,
  ep_Q2_041_partial_18_0119,
  ep_Q2_041_partial_18_0120,
  ep_Q2_041_partial_18_0121,
  ep_Q2_041_partial_18_0122,
  ep_Q2_041_partial_18_0123,
  ep_Q2_041_partial_18_0124,
  ep_Q2_041_partial_18_0125,
  ep_Q2_041_partial_18_0126,
  ep_Q2_041_partial_18_0127,
  ep_Q2_041_partial_18_0128,
  ep_Q2_041_partial_18_0129,
  ep_Q2_041_partial_18_0130,
  ep_Q2_041_partial_18_0131,
  ep_Q2_041_partial_18_0132,
  ep_Q2_041_partial_18_0133,
  ep_Q2_041_partial_18_0134,
  ep_Q2_041_partial_18_0135,
  ep_Q2_041_partial_18_0136,
  ep_Q2_041_partial_18_0137,
  ep_Q2_041_partial_18_0138,
  ep_Q2_041_partial_18_0139,
  ep_Q2_041_partial_18_0140,
  ep_Q2_041_partial_18_0141,
  ep_Q2_041_partial_18_0142,
  ep_Q2_041_partial_18_0143,
  ep_Q2_041_partial_18_0144,
  ep_Q2_041_partial_18_0145,
  ep_Q2_041_partial_18_0146,
  ep_Q2_041_partial_18_0147,
  ep_Q2_041_partial_18_0148,
  ep_Q2_041_partial_18_0149,
  ep_Q2_041_partial_18_0150,
  ep_Q2_041_partial_18_0151,
  ep_Q2_041_partial_18_0152,
  ep_Q2_041_partial_18_0153,
  ep_Q2_041_partial_18_0154,
  ep_Q2_041_partial_18_0155,
  ep_Q2_041_partial_18_0156,
  ep_Q2_041_partial_18_0157,
  ep_Q2_041_partial_18_0158,
  ep_Q2_041_partial_18_0159,
  ep_Q2_041_partial_18_0160,
  ep_Q2_041_partial_18_0161,
  ep_Q2_041_partial_18_0162,
  ep_Q2_041_partial_18_0163,
  ep_Q2_041_partial_18_0164,
  ep_Q2_041_partial_18_0165,
  ep_Q2_041_partial_18_0166,
  ep_Q2_041_partial_18_0167,
  ep_Q2_041_partial_18_0168,
  ep_Q2_041_partial_18_0169,
  ep_Q2_041_partial_18_0170,
  ep_Q2_041_partial_18_0171,
  ep_Q2_041_partial_18_0172,
  ep_Q2_041_partial_18_0173,
  ep_Q2_041_partial_18_0174,
  ep_Q2_041_partial_18_0175,
  ep_Q2_041_partial_18_0176,
  ep_Q2_041_partial_18_0177,
  ep_Q2_041_partial_18_0178,
  ep_Q2_041_partial_18_0179,
  ep_Q2_041_partial_18_0180,
  ep_Q2_041_partial_18_0181,
  ep_Q2_041_partial_18_0182,
  ep_Q2_041_partial_18_0183,
  ep_Q2_041_partial_18_0184,
  ep_Q2_041_partial_18_0185,
  ep_Q2_041_partial_18_0186,
  ep_Q2_041_partial_18_0187,
  ep_Q2_041_partial_18_0188,
  ep_Q2_041_partial_18_0189,
  ep_Q2_041_partial_18_0190,
  ep_Q2_041_partial_18_0191,
  ep_Q2_041_partial_18_0192,
  ep_Q2_041_partial_18_0193,
  ep_Q2_041_partial_18_0194,
  ep_Q2_041_partial_18_0195,
  ep_Q2_041_partial_18_0196,
  ep_Q2_041_partial_18_0197,
  ep_Q2_041_partial_18_0198,
  ep_Q2_041_partial_18_0199
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_0100_0199 : Poly :=
[
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 1), (9, 1), (10, 2), (15, 1)],
  term ((-191849269844232 : Rat) / 442987745227) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1)],
  term ((-54814591812724494006189466153433644238681550954880834257727200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-8952955979784046230111093140458408727574535200881634571843980620 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((-81391363600712127463735873985401471748345333236035178140261600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (9, 1), (11, 2), (15, 1)],
  term ((-25223024167097109339256085696075581870810726889978116121960 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (6, 1), (8, 1), (9, 1), (12, 1), (15, 1)],
  term ((-31500697765213899637916651293445436489631544614304592121160710767 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((1576495696758799939276566419689495387300946403532069103325315900 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 3)],
  term ((-99891312829619281579936073307932183176540734122808898930110 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (6, 1), (8, 1), (9, 1), (14, 2), (15, 1)],
  term ((-72186927958104264112296687961339957475160314694453525204569516 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 1)],
  term ((915367674385572837021893568408557315605028310601652849137913820 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (9, 1), (15, 3)],
  term ((95924634922116 : Rat) / 442987745227) [(0, 1), (6, 1), (8, 1), (10, 1)],
  term ((-39865157681981450186319611747951741264495673421731515823801600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((253097293187075499837218300542252922241603952113972784996879740 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-159460630727925800745278446991806965057982693686926063295206400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 3)],
  term ((-657768925180224 : Rat) / 3100914216589) [(0, 1), (6, 1), (8, 1), (10, 1), (14, 1)],
  term ((1146542324915490864928411941592360281673415566205141166054775200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-23025572671750142596542036969864145045789756534171368186662798297 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (10, 1), (15, 2)],
  term ((4586169299661963459713647766369441126693662264820564664219100800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (10, 1), (15, 4)],
  term ((50446048334194218678512171392151163741621453779956232243920 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (6, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((94516301010122340250171105097526579120423445930089342182753293702 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7051381962775752279534836527136577434403213466527244201379035200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((-69764025943467537826059320558915547212867428488030152691652800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-59924265339007294444129485871760868031874526179660638058143188281 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((4441384863592692499346565410234779070367407975388661717040576700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (11, 1), (15, 3)],
  term ((712583002278576 : Rat) / 3100914216589) [(0, 1), (6, 1), (8, 1), (11, 2)],
  term ((-1644422312950560 : Rat) / 3100914216589) [(0, 1), (6, 1), (8, 1), (11, 2), (14, 1)],
  term ((44585243326482314782304503548212397937478261151354884224745312400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((27545146892564619964169906447879383315115447512596499183575580 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (11, 2), (15, 2)],
  term ((-99662894204953625465799029369879353161239183554328789559504000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (11, 3), (14, 1), (15, 1)],
  term ((43187254155479904368512912726947719703203646206875808809118400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (8, 1), (11, 3), (15, 1)],
  term ((-302840404897108562971625104443091415859723503453774621419080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1623800560118239099804820422885978911895087392868055545714680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((1706613420571488 : Rat) / 3100914216589) [(0, 1), (6, 1), (8, 1), (14, 1)],
  term ((-2045724676273231004936929405414153705393291736066528894896993706 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((-71658895307218179058025746349522517604588472887821322878423450 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (14, 1), (15, 4)],
  term ((-164442231295056 : Rat) / 442987745227) [(0, 1), (6, 1), (8, 1), (14, 2)],
  term ((377386838934581833547474907998346458834241148501857176191698735 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (8, 1), (14, 2), (15, 2)],
  term ((12149700083149487980130213491847871738070410085444011280775049315 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (6, 1), (8, 1), (15, 2)],
  term ((-716588953072181790580257463495225176045884728878213228784234500 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (8, 1), (15, 4)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 1), (9, 1), (10, 2), (15, 1)],
  term ((95924634922116 : Rat) / 442987745227) [(0, 1), (6, 1), (9, 1), (11, 1)],
  term ((27407295906362247003094733076716822119340775477440417128863600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 2)],
  term ((4476477989892023115055546570229204363787267600440817285921990310 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((40695681800356063731867936992700735874172666618017589070130800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((12611512083548554669628042848037790935405363444989058060980 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((31500697765213899637916651293445436489631544614304592121160710767 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-788247848379399969638283209844747693650473201766034551662657950 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (9, 1), (14, 1), (15, 3)],
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (6, 1), (9, 1), (14, 2), (15, 1)],
  term ((36093463979052132056148343980669978737580157347226762602284758 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (9, 1), (15, 1)],
  term ((-457683837192786418510946784204278657802514155300826424568956910 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (9, 1), (15, 3)],
  term ((-47962317461058 : Rat) / 442987745227) [(0, 1), (6, 1), (10, 1)],
  term ((19932578840990725093159805873975870632247836710865757911900800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-126548646593537749918609150271126461120801976056986392498439870 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 1)],
  term ((79730315363962900372639223495903482528991346843463031647603200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (10, 1), (11, 1), (15, 3)],
  term ((328884462590112 : Rat) / 3100914216589) [(0, 1), (6, 1), (10, 1), (14, 1)],
  term ((-573271162457745432464205970796180140836707783102570583027387600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (10, 1), (14, 1), (15, 2)],
  term ((23025572671750142596542036969864145045789756534171368186662798297 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (6, 1), (10, 1), (15, 2)],
  term ((-2293084649830981729856823883184720563346831132410282332109550400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (10, 1), (15, 4)],
  term ((-25223024167097109339256085696075581870810726889978116121960 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-47258150505061170125085552548763289560211722965044671091376646851 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((3525690981387876139767418263568288717201606733263622100689517600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (11, 1), (14, 1), (15, 3)],
  term ((34882012971733768913029660279457773606433714244015076345826400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((59924265339007294444129485871760868031874526179660638058143188281 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (6, 1), (11, 1), (15, 1)],
  term ((-2220692431796346249673282705117389535183703987694330858520288350 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (11, 1), (15, 3)],
  term ((-356291501139288 : Rat) / 3100914216589) [(0, 1), (6, 1), (11, 2)],
  term ((822211156475280 : Rat) / 3100914216589) [(0, 1), (6, 1), (11, 2), (14, 1)],
  term ((-22292621663241157391152251774106198968739130575677442112372656200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (11, 2), (14, 1), (15, 2)],
  term ((-13772573446282309982084953223939691657557723756298249591787790 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (11, 2), (15, 2)],
  term ((49831447102476812732899514684939676580619591777164394779752000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (11, 3), (14, 1), (15, 1)],
  term ((-21593627077739952184256456363473859851601823103437904404559200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 1), (11, 3), (15, 1)],
  term ((151420202448554281485812552221545707929861751726887310709540 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-811900280059119549902410211442989455947543696434027772857340 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 1), (13, 1), (15, 1)],
  term ((-853306710285744 : Rat) / 3100914216589) [(0, 1), (6, 1), (14, 1)],
  term ((1022862338136615502468464702707076852696645868033264447448496853 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (6, 1), (14, 1), (15, 2)],
  term ((35829447653609089529012873174761258802294236443910661439211725 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (14, 1), (15, 4)],
  term ((82221115647528 : Rat) / 442987745227) [(0, 1), (6, 1), (14, 2)],
  term ((-377386838934581833547474907998346458834241148501857176191698735 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (6, 1), (14, 2), (15, 2)],
  term ((-12149700083149487980130213491847871738070410085444011280775049315 : Rat) / 46599286823855691053152841592521681817985443798359450859152872) [(0, 1), (6, 1), (15, 2)],
  term ((358294476536090895290128731747612588022942364439106614392117250 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 1), (15, 4)],
  term ((-82221115647528 : Rat) / 3100914216589) [(0, 1), (6, 2)],
  term ((164442231295056 : Rat) / 3100914216589) [(0, 1), (6, 2), (8, 1)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (8, 1), (9, 1), (10, 1), (15, 1)],
  term ((-29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 2)],
  term ((9040999247496886275929303621393680335148668260328163305951110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (8, 1), (9, 1), (14, 1), (15, 1)],
  term ((-6922666061508102066541180621006714314013579998793667009758950086 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (8, 1), (9, 1), (15, 1)],
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (8, 1), (9, 1), (15, 3)],
  term ((9040999247496886275929303621393680335148668260328163305951110 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (8, 1), (10, 1), (11, 1), (15, 1)],
  term ((-1323831842189306724857740991341828172134188442399804573302796180 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (6, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((464782712512045222798645312061399451360320027636977040456365665 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (6, 2), (8, 1), (11, 1), (15, 1)],
  term ((59797736522972175279479417621927611896743510132597273735702400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 2), (8, 1), (11, 1), (15, 3)],
  term ((246663346942584 : Rat) / 3100914216589) [(0, 1), (6, 2), (8, 1), (14, 1)],
  term ((-429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (8, 1), (14, 1), (15, 2)],
  term ((352216877057453248384504489398869553507450456664857869254959311 : Rat) / 1032262682806929865101486997302695483309804134773785303841994) [(0, 1), (6, 2), (8, 1), (15, 2)],
  term ((-1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (8, 1), (15, 4)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (8, 2), (11, 1), (15, 1)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (8, 2), (15, 2)],
  term ((4520499623748443137964651810696840167574334130164081652975555 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (6, 2), (9, 1), (10, 1), (15, 1)],
  term ((14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 2), (9, 1), (11, 1), (15, 2)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (9, 1), (14, 1), (15, 1)],
  term ((3461333030754051033270590310503357157006789999396833504879475043 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((-429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (9, 1), (15, 3)],
  term ((-4520499623748443137964651810696840167574334130164081652975555 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (6, 2), (10, 1), (11, 1), (15, 1)],
  term ((661915921094653362428870495670914086067094221199902286651398090 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (6, 2), (11, 1), (14, 1), (15, 1)],
  term ((-1286684895300217453496498117167849275959012451556916531497800175 : Rat) / 7091195821021518203740649807557647233171697969315568609001524) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((-29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (6, 2), (11, 1), (15, 3)],
  term ((-123331673471292 : Rat) / 3100914216589) [(0, 1), (6, 2), (14, 1)],
  term ((214976685921654537174077239048567552813765418663463968635270350 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (14, 1), (15, 2)],
  term ((-124122692855619528105658748876421114826620385835541995618260773 : Rat) / 1032262682806929865101486997302695483309804134773785303841994) [(0, 1), (6, 2), (15, 2)],
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (6, 2), (15, 4)],
  term ((-29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-493326693885168 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 1), (9, 1), (10, 1), (14, 1)],
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((57306164167848334642834441887680628067712530543739053996714800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((41110557823764 : Rat) / 134822357243) [(0, 1), (7, 1), (8, 1), (9, 1), (14, 1)],
  term ((-46029802826087356310345437439460971774530663320751978038902640 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-712583002278576 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1)],
  term ((1644422312950560 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1)],
  term ((6761079767909793057675156383149444811192166215835308156311148400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-371382131899654627821176557773963151721390630775030823163864380 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((99662894204953625465799029369879353161239183554328789559504000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((-43187254155479904368512912726947719703203646206875808809118400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-50446048334194218678512171392151163741621453779956232243920 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((-9161234042629496018761959481901019812940476528785006767544719428 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1719813487373236297392617912388540422510123349307711749082162800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (10, 1), (14, 1), (15, 3)],
  term ((2415587818275956048745593674521896496223880835969525361384705 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (7, 1), (8, 1), (10, 1), (15, 1)],
  term ((402183283739455016276674157046230745286135622938611879671340 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (8, 1), (10, 2), (15, 1)],
  term ((-657768925180224 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 1)],
  term ((7364261137127035173675948886405708427020225130200828524698331000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2631075700720896 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 2)],
  term ((3783883001312086774713965579941912333745686837208217908265093600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((-39865157681981450186319611747951741264495673421731515823801600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((-159460630727925800745278446991806965057982693686926063295206400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 1), (11, 2), (14, 2), (15, 1)],
  term ((302840404897108562971625104443091415859723503453774621419080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1623800560118239099804820422885978911895087392868055545714680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((-10604175534035063380261902543764132901288904639508547057164646917 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-1110712877261881775399399068417599022871121329761230504615563475 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (14, 1), (15, 3)],
  term ((71196902878645391609190192304768391423655542041458631064971763 : Rat) / 540057959879122247304751475410019491268043222828669132473626) [(0, 1), (7, 1), (8, 1), (14, 2), (15, 1)],
  term ((143317790614436358116051492699045035209176945775642645756846900 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (14, 2), (15, 3)],
  term ((5963886448202182719129400818850445994539464994994473394719007056 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 1), (15, 1)],
  term ((-71658895307218179058025746349522517604588472887821322878423450 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (8, 1), (15, 3)],
  term ((191849269844232 : Rat) / 442987745227) [(0, 1), (7, 1), (8, 2), (11, 1)],
  term ((493326693885168 : Rat) / 3100914216589) [(0, 1), (7, 1), (8, 2), (11, 1), (14, 1)],
  term ((-5807134107742782356917314721272225503557898238578259450178200 : Rat) / 516131341403464932550743498651347741654902067386892651920997) [(0, 1), (7, 1), (8, 2), (11, 1), (14, 1), (15, 2)],
  term ((-273336451239535647385252003458172391327182216660353121627102180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 2), (11, 1), (15, 2)],
  term ((29898868261486087639739708810963805948371755066298636867851200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 2), (11, 2), (14, 1), (15, 1)],
  term ((81391363600712127463735873985401471748345333236035178140261600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (8, 2), (11, 2), (15, 1)],
  term ((25223024167097109339256085696075581870810726889978116121960 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (7, 1), (8, 2), (12, 1), (15, 1)],
  term ((8533318495589440521093802313880926054024399700152306897954616128 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-71658895307218179058025746349522517604588472887821322878423450 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 2), (14, 1), (15, 3)],
  term ((49945656414809640789968036653966091588270367061404449465055 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (7, 1), (8, 2), (14, 2), (15, 1)],
  term ((-11927772896404365438258801637700891989078929989988946789438014112 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (8, 2), (15, 1)],
  term ((143317790614436358116051492699045035209176945775642645756846900 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (8, 2), (15, 3)],
  term ((14949434130743043819869854405481902974185877533149318433925600 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((246663346942584 : Rat) / 3100914216589) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1)],
  term ((-429953371843309074348154478097135105627530837326927937270540700 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (9, 1), (10, 1), (14, 1), (15, 2)],
  term ((-28653082083924167321417220943840314033856265271869526998357400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-20555278911882 : Rat) / 134822357243) [(0, 1), (7, 1), (9, 1), (14, 1)],
  term ((23014901413043678155172718719730485887265331660375989019451320 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (9, 1), (14, 1), (15, 2)],
  term ((356291501139288 : Rat) / 3100914216589) [(0, 1), (7, 1), (10, 1), (11, 1)],
  term ((-822211156475280 : Rat) / 3100914216589) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-3380539883954896528837578191574722405596083107917654078155574200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((185691065949827313910588278886981575860695315387515411581932190 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-49831447102476812732899514684939676580619591777164394779752000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (10, 1), (11, 2), (14, 1), (15, 1)],
  term ((21593627077739952184256456363473859851601823103437904404559200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (10, 1), (11, 2), (15, 1)],
  term ((25223024167097109339256085696075581870810726889978116121960 : Rat) / 316063283161950356736523881599110680743969422772132671109) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((4580617021314748009380979740950509906470238264392503383772359714 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 1)],
  term ((859906743686618148696308956194270211255061674653855874541081400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (10, 1), (14, 1), (15, 3)],
  term ((-2415587818275956048745593674521896496223880835969525361384705 : Rat) / 12823138916856271616167540339163919047326759438183668370708) [(0, 1), (7, 1), (10, 1), (15, 1)],
  term ((-201091641869727508138337078523115372643067811469305939835670 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((-47962317461058 : Rat) / 442987745227) [(0, 1), (7, 1), (11, 1)],
  term ((205552789118820 : Rat) / 3100914216589) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-3567439669935597635288857477457727759814844074888493638208146050 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((1315537850360448 : Rat) / 3100914216589) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((-1891941500656043387356982789970956166872843418604108954132546800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (11, 1), (14, 2), (15, 2)],
  term ((68334112809883911846313000864543097831795554165088280406775545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((12457861775619203183224878671234919145154897944291098694938000 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (11, 2), (14, 1), (15, 1)],
  term ((79730315363962900372639223495903482528991346843463031647603200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-20347840900178031865933968496350367937086333309008794535065400 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((-151420202448554281485812552221545707929861751726887310709540 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((364191601093145859130614690337647877740653294136916211692550 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((295836719777946122738300032840458121037786419908034308458575827 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((573271162457745432464205970796180140836707783102570583027387600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (14, 1), (15, 3)],
  term ((-5692995569307708977097661248110910911941598823457128241778385379 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((-71658895307218179058025746349522517604588472887821322878423450 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (7, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 100 through 199. -/
theorem ep_Q2_041_block_18_0100_0199_valid :
    checkProductSumEq ep_Q2_041_partials_18_0100_0199
      ep_Q2_041_block_18_0100_0199 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
