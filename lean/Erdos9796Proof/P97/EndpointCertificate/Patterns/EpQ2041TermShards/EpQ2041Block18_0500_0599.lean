/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:500-599

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_0500_0599 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 500 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0500 : Poly :=
[
  term ((15555636332521923396728476331153881030931769904386309608153498565 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (13, 2), (15, 2)]
]

/-- Partial product 500 for generator 18. -/
def ep_Q2_041_partial_18_0500 : Poly :=
[
  term ((15555636332521923396728476331153881030931769904386309608153498565 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (13, 2), (15, 2)],
  term ((-15555636332521923396728476331153881030931769904386309608153498565 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 500 for generator 18. -/
theorem ep_Q2_041_partial_18_0500_valid :
    mulPoly ep_Q2_041_coefficient_18_0500
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0500 := by
  native_decide

/-- Coefficient term 501 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0501 : Poly :=
[
  term ((5550476922156235244891453531929030772306328457280040581760045 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (13, 3), (14, 1), (15, 1)]
]

/-- Partial product 501 for generator 18. -/
def ep_Q2_041_partial_18_0501 : Poly :=
[
  term ((11100953844312470489782907063858061544612656914560081163520090 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (13, 3), (14, 1), (15, 1)],
  term ((-5550476922156235244891453531929030772306328457280040581760045 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 501 for generator 18. -/
theorem ep_Q2_041_partial_18_0501_valid :
    mulPoly ep_Q2_041_coefficient_18_0501
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0501 := by
  native_decide

/-- Coefficient term 502 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0502 : Poly :=
[
  term ((-5706421643174152364154793017217359420435642576267096872818860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (13, 3), (14, 2), (15, 1)]
]

/-- Partial product 502 for generator 18. -/
def ep_Q2_041_partial_18_0502 : Poly :=
[
  term ((-11412843286348304728309586034434718840871285152534193745637720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (13, 3), (14, 2), (15, 1)],
  term ((5706421643174152364154793017217359420435642576267096872818860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (13, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 502 for generator 18. -/
theorem ep_Q2_041_partial_18_0502_valid :
    mulPoly ep_Q2_041_coefficient_18_0502
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0502 := by
  native_decide

/-- Coefficient term 503 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0503 : Poly :=
[
  term ((-294562250811621225275196805544620779799815558086661883111095 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (13, 3), (15, 1)]
]

/-- Partial product 503 for generator 18. -/
def ep_Q2_041_partial_18_0503 : Poly :=
[
  term ((-294562250811621225275196805544620779799815558086661883111095 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 1), (13, 3), (15, 1)],
  term ((294562250811621225275196805544620779799815558086661883111095 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 503 for generator 18. -/
theorem ep_Q2_041_partial_18_0503_valid :
    mulPoly ep_Q2_041_coefficient_18_0503
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0503 := by
  native_decide

/-- Coefficient term 504 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0504 : Poly :=
[
  term ((8796344278869565 : Rat) / 3100914216589) [(0, 1), (14, 1)]
]

/-- Partial product 504 for generator 18. -/
def ep_Q2_041_partial_18_0504 : Poly :=
[
  term ((17592688557739130 : Rat) / 3100914216589) [(0, 1), (8, 1), (14, 1)],
  term ((-8796344278869565 : Rat) / 3100914216589) [(0, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 504 for generator 18. -/
theorem ep_Q2_041_partial_18_0504_valid :
    mulPoly ep_Q2_041_coefficient_18_0504
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0504 := by
  native_decide

/-- Coefficient term 505 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0505 : Poly :=
[
  term ((10054218322640873066224456691035454127116653391626935656485340043559494666769501070521 : Rat) / 781035697461136430161840392392832810821833927629883251920593682473933763295940992) [(0, 1), (14, 1), (15, 2)]
]

/-- Partial product 505 for generator 18. -/
def ep_Q2_041_partial_18_0505 : Poly :=
[
  term ((10054218322640873066224456691035454127116653391626935656485340043559494666769501070521 : Rat) / 390517848730568215080920196196416405410916963814941625960296841236966881647970496) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((-10054218322640873066224456691035454127116653391626935656485340043559494666769501070521 : Rat) / 781035697461136430161840392392832810821833927629883251920593682473933763295940992) [(0, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 505 for generator 18. -/
theorem ep_Q2_041_partial_18_0505_valid :
    mulPoly ep_Q2_041_coefficient_18_0505
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0505 := by
  native_decide

/-- Coefficient term 506 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0506 : Poly :=
[
  term ((12426094785131553348532392970997016420028262115247524926148739955 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (14, 1), (15, 4)]
]

/-- Partial product 506 for generator 18. -/
def ep_Q2_041_partial_18_0506 : Poly :=
[
  term ((12426094785131553348532392970997016420028262115247524926148739955 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (14, 1), (15, 4)],
  term ((-12426094785131553348532392970997016420028262115247524926148739955 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 506 for generator 18. -/
theorem ep_Q2_041_partial_18_0506_valid :
    mulPoly ep_Q2_041_coefficient_18_0506
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0506 := by
  native_decide

/-- Coefficient term 507 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0507 : Poly :=
[
  term ((-6017745747251095 : Rat) / 3100914216589) [(0, 1), (14, 2)]
]

/-- Partial product 507 for generator 18. -/
def ep_Q2_041_partial_18_0507 : Poly :=
[
  term ((-12035491494502190 : Rat) / 3100914216589) [(0, 1), (8, 1), (14, 2)],
  term ((6017745747251095 : Rat) / 3100914216589) [(0, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 507 for generator 18. -/
theorem ep_Q2_041_partial_18_0507_valid :
    mulPoly ep_Q2_041_coefficient_18_0507
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0507 := by
  native_decide

/-- Coefficient term 508 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0508 : Poly :=
[
  term ((49506366076066672480634117141858958347055674127299006841168210395 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (14, 2), (15, 2)]
]

/-- Partial product 508 for generator 18. -/
def ep_Q2_041_partial_18_0508 : Poly :=
[
  term ((49506366076066672480634117141858958347055674127299006841168210395 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((-49506366076066672480634117141858958347055674127299006841168210395 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 508 for generator 18. -/
theorem ep_Q2_041_partial_18_0508_valid :
    mulPoly ep_Q2_041_coefficient_18_0508
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0508 := by
  native_decide

/-- Coefficient term 509 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0509 : Poly :=
[
  term ((-1719342571423763 : Rat) / 9302742649767) [(0, 1), (14, 3)]
]

/-- Partial product 509 for generator 18. -/
def ep_Q2_041_partial_18_0509 : Poly :=
[
  term ((-3438685142847526 : Rat) / 9302742649767) [(0, 1), (8, 1), (14, 3)],
  term ((1719342571423763 : Rat) / 9302742649767) [(0, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 509 for generator 18. -/
theorem ep_Q2_041_partial_18_0509_valid :
    mulPoly ep_Q2_041_coefficient_18_0509
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0509 := by
  native_decide

/-- Coefficient term 510 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0510 : Poly :=
[
  term ((1413361125219898306951875708246878692902352398587448709019374120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (14, 3), (15, 2)]
]

/-- Partial product 510 for generator 18. -/
def ep_Q2_041_partial_18_0510 : Poly :=
[
  term ((2826722250439796613903751416493757385804704797174897418038748240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (14, 3), (15, 2)],
  term ((-1413361125219898306951875708246878692902352398587448709019374120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 510 for generator 18. -/
theorem ep_Q2_041_partial_18_0510_valid :
    mulPoly ep_Q2_041_coefficient_18_0510
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0510 := by
  native_decide

/-- Coefficient term 511 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0511 : Poly :=
[
  term ((10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (15, 2)]
]

/-- Partial product 511 for generator 18. -/
def ep_Q2_041_partial_18_0511 : Poly :=
[
  term ((10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (15, 2)],
  term ((-10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 511 for generator 18. -/
theorem ep_Q2_041_partial_18_0511_valid :
    mulPoly ep_Q2_041_coefficient_18_0511
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0511 := by
  native_decide

/-- Coefficient term 512 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0512 : Poly :=
[
  term ((-114615575566079661987532774267138142062813915519644900199521895 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (15, 4)]
]

/-- Partial product 512 for generator 18. -/
def ep_Q2_041_partial_18_0512 : Poly :=
[
  term ((-114615575566079661987532774267138142062813915519644900199521895 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (15, 4)],
  term ((114615575566079661987532774267138142062813915519644900199521895 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 512 for generator 18. -/
theorem ep_Q2_041_partial_18_0512_valid :
    mulPoly ep_Q2_041_coefficient_18_0512
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0512 := by
  native_decide

/-- Coefficient term 513 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0513 : Poly :=
[
  term ((-197144904821693621566554190076996291644877649573154551014139900 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 513 for generator 18. -/
def ep_Q2_041_partial_18_0513 : Poly :=
[
  term ((-394289809643387243133108380153992583289755299146309102028279800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 2), (2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((197144904821693621566554190076996291644877649573154551014139900 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 513 for generator 18. -/
theorem ep_Q2_041_partial_18_0513_valid :
    mulPoly ep_Q2_041_coefficient_18_0513
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0513 := by
  native_decide

/-- Coefficient term 514 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0514 : Poly :=
[
  term ((5596682765420803280228739305347794816196495603646575779110805 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 2), (2, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 514 for generator 18. -/
def ep_Q2_041_partial_18_0514 : Poly :=
[
  term ((11193365530841606560457478610695589632392991207293151558221610 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 2), (2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5596682765420803280228739305347794816196495603646575779110805 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 2), (2, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 514 for generator 18. -/
theorem ep_Q2_041_partial_18_0514_valid :
    mulPoly ep_Q2_041_coefficient_18_0514
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0514 := by
  native_decide

/-- Coefficient term 515 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0515 : Poly :=
[
  term ((-3142453237728519 : Rat) / 3100914216589) [(0, 2), (2, 1), (14, 1)]
]

/-- Partial product 515 for generator 18. -/
def ep_Q2_041_partial_18_0515 : Poly :=
[
  term ((-6284906475457038 : Rat) / 3100914216589) [(0, 2), (2, 1), (8, 1), (14, 1)],
  term ((3142453237728519 : Rat) / 3100914216589) [(0, 2), (2, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 515 for generator 18. -/
theorem ep_Q2_041_partial_18_0515_valid :
    mulPoly ep_Q2_041_coefficient_18_0515
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0515 := by
  native_decide

/-- Coefficient term 516 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0516 : Poly :=
[
  term ((2947834630286193758509229498904246677904311734685301604483886145 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 2), (2, 1), (14, 1), (15, 2)]
]

/-- Partial product 516 for generator 18. -/
def ep_Q2_041_partial_18_0516 : Poly :=
[
  term ((2947834630286193758509229498904246677904311734685301604483886145 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 2), (2, 1), (8, 1), (14, 1), (15, 2)],
  term ((-2947834630286193758509229498904246677904311734685301604483886145 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 2), (2, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 516 for generator 18. -/
theorem ep_Q2_041_partial_18_0516_valid :
    mulPoly ep_Q2_041_coefficient_18_0516
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0516 := by
  native_decide

/-- Coefficient term 517 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0517 : Poly :=
[
  term ((3119813938397535411700033067462748372500143137148030096285312960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 517 for generator 18. -/
def ep_Q2_041_partial_18_0517 : Poly :=
[
  term ((6239627876795070823400066134925496745000286274296060192570625920 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3119813938397535411700033067462748372500143137148030096285312960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 517 for generator 18. -/
theorem ep_Q2_041_partial_18_0517_valid :
    mulPoly ep_Q2_041_coefficient_18_0517
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0517 := by
  native_decide

/-- Coefficient term 518 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0518 : Poly :=
[
  term ((-3696467461165442826982861873501123511213371709322815788060800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 518 for generator 18. -/
def ep_Q2_041_partial_18_0518 : Poly :=
[
  term ((-7392934922330885653965723747002247022426743418645631576121600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 2), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((3696467461165442826982861873501123511213371709322815788060800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 518 for generator 18. -/
theorem ep_Q2_041_partial_18_0518_valid :
    mulPoly ep_Q2_041_coefficient_18_0518
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0518 := by
  native_decide

/-- Coefficient term 519 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0519 : Poly :=
[
  term ((7094273389426652 : Rat) / 3100914216589) [(0, 2), (10, 1), (14, 1)]
]

/-- Partial product 519 for generator 18. -/
def ep_Q2_041_partial_18_0519 : Poly :=
[
  term ((14188546778853304 : Rat) / 3100914216589) [(0, 2), (8, 1), (10, 1), (14, 1)],
  term ((-7094273389426652 : Rat) / 3100914216589) [(0, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 519 for generator 18. -/
theorem ep_Q2_041_partial_18_0519_valid :
    mulPoly ep_Q2_041_coefficient_18_0519
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0519 := by
  native_decide

/-- Coefficient term 520 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0520 : Poly :=
[
  term ((-4090130502146442064678647322194413032608566502497090395849569585 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 2), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 520 for generator 18. -/
def ep_Q2_041_partial_18_0520 : Poly :=
[
  term ((-4090130502146442064678647322194413032608566502497090395849569585 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((4090130502146442064678647322194413032608566502497090395849569585 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 2), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 520 for generator 18. -/
theorem ep_Q2_041_partial_18_0520_valid :
    mulPoly ep_Q2_041_coefficient_18_0520
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0520 := by
  native_decide

/-- Coefficient term 521 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0521 : Poly :=
[
  term ((-1739799604645680060734153736923774330985999590135948239186333660 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 521 for generator 18. -/
def ep_Q2_041_partial_18_0521 : Poly :=
[
  term ((-3479599209291360121468307473847548661971999180271896478372667320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1739799604645680060734153736923774330985999590135948239186333660 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 521 for generator 18. -/
theorem ep_Q2_041_partial_18_0521_valid :
    mulPoly ep_Q2_041_coefficient_18_0521
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0521 := by
  native_decide

/-- Coefficient term 522 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0522 : Poly :=
[
  term ((-271459329179337207606553918835238757854731984903394284435715 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 522 for generator 18. -/
def ep_Q2_041_partial_18_0522 : Poly :=
[
  term ((-542918658358674415213107837670477515709463969806788568871430 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((271459329179337207606553918835238757854731984903394284435715 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 522 for generator 18. -/
theorem ep_Q2_041_partial_18_0522_valid :
    mulPoly ep_Q2_041_coefficient_18_0522
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0522 := by
  native_decide

/-- Coefficient term 523 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0523 : Poly :=
[
  term ((-3951820151698133 : Rat) / 3100914216589) [(0, 2), (14, 1)]
]

/-- Partial product 523 for generator 18. -/
def ep_Q2_041_partial_18_0523 : Poly :=
[
  term ((-7903640303396266 : Rat) / 3100914216589) [(0, 2), (8, 1), (14, 1)],
  term ((3951820151698133 : Rat) / 3100914216589) [(0, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 523 for generator 18. -/
theorem ep_Q2_041_partial_18_0523_valid :
    mulPoly ep_Q2_041_coefficient_18_0523
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0523 := by
  native_decide

/-- Coefficient term 524 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0524 : Poly :=
[
  term ((5232426374006690370848065145484579387312821270308879187215253025 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 2), (14, 1), (15, 2)]
]

/-- Partial product 524 for generator 18. -/
def ep_Q2_041_partial_18_0524 : Poly :=
[
  term ((5232426374006690370848065145484579387312821270308879187215253025 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 2), (8, 1), (14, 1), (15, 2)],
  term ((-5232426374006690370848065145484579387312821270308879187215253025 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 524 for generator 18. -/
theorem ep_Q2_041_partial_18_0524_valid :
    mulPoly ep_Q2_041_coefficient_18_0524
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0524 := by
  native_decide

/-- Coefficient term 525 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0525 : Poly :=
[
  term ((1290148655271601153869150656950424543057755499323805472693694411256160 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 525 for generator 18. -/
def ep_Q2_041_partial_18_0525 : Poly :=
[
  term ((2580297310543202307738301313900849086115510998647610945387388822512320 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1290148655271601153869150656950424543057755499323805472693694411256160 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 525 for generator 18. -/
theorem ep_Q2_041_partial_18_0525_valid :
    mulPoly ep_Q2_041_coefficient_18_0525
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0525 := by
  native_decide

/-- Coefficient term 526 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0526 : Poly :=
[
  term ((560962277370629569485823940894068384622806475186174482989308332441884600 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2)]
]

/-- Partial product 526 for generator 18. -/
def ep_Q2_041_partial_18_0526 : Poly :=
[
  term ((1121924554741259138971647881788136769245612950372348965978616664883769200 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (2, 1), (3, 1), (8, 1), (14, 1), (15, 2)],
  term ((-560962277370629569485823940894068384622806475186174482989308332441884600 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 526 for generator 18. -/
theorem ep_Q2_041_partial_18_0526_valid :
    mulPoly ep_Q2_041_coefficient_18_0526
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0526 := by
  native_decide

/-- Coefficient term 527 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0527 : Poly :=
[
  term ((483280818826964298908766628468422636269906452487704584253080000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 527 for generator 18. -/
def ep_Q2_041_partial_18_0527 : Poly :=
[
  term ((966561637653928597817533256936845272539812904975409168506160000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (2, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-483280818826964298908766628468422636269906452487704584253080000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 527 for generator 18. -/
theorem ep_Q2_041_partial_18_0527_valid :
    mulPoly ep_Q2_041_coefficient_18_0527
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0527 := by
  native_decide

/-- Coefficient term 528 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0528 : Poly :=
[
  term ((152461969083839479313390896991002987106116971917970940438536000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 528 for generator 18. -/
def ep_Q2_041_partial_18_0528 : Poly :=
[
  term ((304923938167678958626781793982005974212233943835941880877072000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (2, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-152461969083839479313390896991002987106116971917970940438536000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 528 for generator 18. -/
theorem ep_Q2_041_partial_18_0528_valid :
    mulPoly ep_Q2_041_coefficient_18_0528
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0528 := by
  native_decide

/-- Coefficient term 529 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0529 : Poly :=
[
  term ((-71625540430813745527409028280723388755812808288237630225664954049784500 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 529 for generator 18. -/
def ep_Q2_041_partial_18_0529 : Poly :=
[
  term ((-143251080861627491054818056561446777511625616576475260451329908099569000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((71625540430813745527409028280723388755812808288237630225664954049784500 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 529 for generator 18. -/
theorem ep_Q2_041_partial_18_0529_valid :
    mulPoly ep_Q2_041_coefficient_18_0529
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0529 := by
  native_decide

/-- Coefficient term 530 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0530 : Poly :=
[
  term ((-26928355910400 : Rat) / 275754830051) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 530 for generator 18. -/
def ep_Q2_041_partial_18_0530 : Poly :=
[
  term ((-53856711820800 : Rat) / 275754830051) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((26928355910400 : Rat) / 275754830051) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 530 for generator 18. -/
theorem ep_Q2_041_partial_18_0530_valid :
    mulPoly ep_Q2_041_coefficient_18_0530
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0530 := by
  native_decide

/-- Coefficient term 531 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0531 : Poly :=
[
  term ((-852110566949251536095207864239702484578909720915619713647022108569600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 531 for generator 18. -/
def ep_Q2_041_partial_18_0531 : Poly :=
[
  term ((-1704221133898503072190415728479404969157819441831239427294044217139200 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((852110566949251536095207864239702484578909720915619713647022108569600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 531 for generator 18. -/
theorem ep_Q2_041_partial_18_0531_valid :
    mulPoly ep_Q2_041_coefficient_18_0531
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0531 := by
  native_decide

/-- Coefficient term 532 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0532 : Poly :=
[
  term ((-1556674107600391157890705456580262514706414079246265410524575621006911600 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 532 for generator 18. -/
def ep_Q2_041_partial_18_0532 : Poly :=
[
  term ((-3113348215200782315781410913160525029412828158492530821049151242013823200 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((1556674107600391157890705456580262514706414079246265410524575621006911600 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 532 for generator 18. -/
theorem ep_Q2_041_partial_18_0532_valid :
    mulPoly ep_Q2_041_coefficient_18_0532
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0532 := by
  native_decide

/-- Coefficient term 533 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0533 : Poly :=
[
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 3)]
]

/-- Partial product 533 for generator 18. -/
def ep_Q2_041_partial_18_0533 : Poly :=
[
  term ((579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (6, 1), (8, 1), (11, 1), (15, 3)],
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 533 for generator 18. -/
theorem ep_Q2_041_partial_18_0533_valid :
    mulPoly ep_Q2_041_coefficient_18_0533
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0533 := by
  native_decide

/-- Coefficient term 534 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0534 : Poly :=
[
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3)]
]

/-- Partial product 534 for generator 18. -/
def ep_Q2_041_partial_18_0534 : Poly :=
[
  term ((182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (3, 1), (6, 1), (8, 1), (13, 1), (15, 3)],
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 534 for generator 18. -/
theorem ep_Q2_041_partial_18_0534_valid :
    mulPoly ep_Q2_041_coefficient_18_0534
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0534 := by
  native_decide

/-- Coefficient term 535 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0535 : Poly :=
[
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (3, 1), (6, 1), (15, 2)]
]

/-- Partial product 535 for generator 18. -/
def ep_Q2_041_partial_18_0535 : Poly :=
[
  term ((-85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2)],
  term ((42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (3, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 535 for generator 18. -/
theorem ep_Q2_041_partial_18_0535_valid :
    mulPoly ep_Q2_041_coefficient_18_0535
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0535 := by
  native_decide

/-- Coefficient term 536 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0536 : Poly :=
[
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 536 for generator 18. -/
def ep_Q2_041_partial_18_0536 : Poly :=
[
  term ((-32314027092480 : Rat) / 275754830051) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 536 for generator 18. -/
theorem ep_Q2_041_partial_18_0536_valid :
    mulPoly ep_Q2_041_coefficient_18_0536
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0536 := by
  native_decide

/-- Coefficient term 537 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0537 : Poly :=
[
  term ((193312327530785719563506651387369054507962580995081833701232000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 537 for generator 18. -/
def ep_Q2_041_partial_18_0537 : Poly :=
[
  term ((386624655061571439127013302774738109015925161990163667402464000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-193312327530785719563506651387369054507962580995081833701232000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 537 for generator 18. -/
theorem ep_Q2_041_partial_18_0537_valid :
    mulPoly ep_Q2_041_coefficient_18_0537
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0537 := by
  native_decide

/-- Coefficient term 538 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0538 : Poly :=
[
  term ((60984787633535791725356358796401194842446788767188376175414400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 538 for generator 18. -/
def ep_Q2_041_partial_18_0538 : Poly :=
[
  term ((121969575267071583450712717592802389684893577534376752350828800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (3, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-60984787633535791725356358796401194842446788767188376175414400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 538 for generator 18. -/
theorem ep_Q2_041_partial_18_0538_valid :
    mulPoly ep_Q2_041_coefficient_18_0538
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0538 := by
  native_decide

/-- Coefficient term 539 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0539 : Poly :=
[
  term ((-28650216172325498210963611312289355502325123315295052090265981619913800 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 539 for generator 18. -/
def ep_Q2_041_partial_18_0539 : Poly :=
[
  term ((-57300432344650996421927222624578711004650246630590104180531963239827600 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (3, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((28650216172325498210963611312289355502325123315295052090265981619913800 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 539 for generator 18. -/
theorem ep_Q2_041_partial_18_0539_valid :
    mulPoly ep_Q2_041_coefficient_18_0539
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0539 := by
  native_decide

/-- Coefficient term 540 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0540 : Poly :=
[
  term ((-10771342364160 : Rat) / 275754830051) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 540 for generator 18. -/
def ep_Q2_041_partial_18_0540 : Poly :=
[
  term ((-21542684728320 : Rat) / 275754830051) [(1, 1), (3, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((10771342364160 : Rat) / 275754830051) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 540 for generator 18. -/
theorem ep_Q2_041_partial_18_0540_valid :
    mulPoly ep_Q2_041_coefficient_18_0540
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0540 := by
  native_decide

/-- Coefficient term 541 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0541 : Poly :=
[
  term ((1050681916976091912057568655753088742594656698576805661710330520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 541 for generator 18. -/
def ep_Q2_041_partial_18_0541 : Poly :=
[
  term ((2101363833952183824115137311506177485189313397153611323420661040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1050681916976091912057568655753088742594656698576805661710330520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 541 for generator 18. -/
theorem ep_Q2_041_partial_18_0541_valid :
    mulPoly ep_Q2_041_coefficient_18_0541
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0541 := by
  native_decide

/-- Coefficient term 542 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0542 : Poly :=
[
  term ((1354755096555153852546017739661010752393930242706770060118559714602638482467175597 : Rat) / 429849035476684881762157618267932201883232761491405201937585956232214509243776) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 542 for generator 18. -/
def ep_Q2_041_partial_18_0542 : Poly :=
[
  term ((1354755096555153852546017739661010752393930242706770060118559714602638482467175597 : Rat) / 214924517738342440881078809133966100941616380745702600968792978116107254621888) [(1, 1), (3, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1354755096555153852546017739661010752393930242706770060118559714602638482467175597 : Rat) / 429849035476684881762157618267932201883232761491405201937585956232214509243776) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 542 for generator 18. -/
theorem ep_Q2_041_partial_18_0542_valid :
    mulPoly ep_Q2_041_coefficient_18_0542
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0542 := by
  native_decide

/-- Coefficient term 543 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0543 : Poly :=
[
  term ((28158263285665 : Rat) / 38520673498) [(1, 1), (3, 1), (14, 1)]
]

/-- Partial product 543 for generator 18. -/
def ep_Q2_041_partial_18_0543 : Poly :=
[
  term ((28158263285665 : Rat) / 19260336749) [(1, 1), (3, 1), (8, 1), (14, 1)],
  term ((-28158263285665 : Rat) / 38520673498) [(1, 1), (3, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 543 for generator 18. -/
theorem ep_Q2_041_partial_18_0543_valid :
    mulPoly ep_Q2_041_coefficient_18_0543
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0543 := by
  native_decide

/-- Coefficient term 544 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0544 : Poly :=
[
  term ((896057999161215779599273380963265973428427027044181289780220241193683711531745433919 : Rat) / 111576528208733775737405770341833258688833418232840464560084811781990537613705856) [(1, 1), (3, 1), (14, 1), (15, 2)]
]

/-- Partial product 544 for generator 18. -/
def ep_Q2_041_partial_18_0544 : Poly :=
[
  term ((896057999161215779599273380963265973428427027044181289780220241193683711531745433919 : Rat) / 55788264104366887868702885170916629344416709116420232280042405890995268806852928) [(1, 1), (3, 1), (8, 1), (14, 1), (15, 2)],
  term ((-896057999161215779599273380963265973428427027044181289780220241193683711531745433919 : Rat) / 111576528208733775737405770341833258688833418232840464560084811781990537613705856) [(1, 1), (3, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 544 for generator 18. -/
theorem ep_Q2_041_partial_18_0544_valid :
    mulPoly ep_Q2_041_coefficient_18_0544
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0544 := by
  native_decide

/-- Coefficient term 545 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0545 : Poly :=
[
  term ((-10479649306463821168 : Rat) / 777005835365402853) [(1, 1), (5, 1), (6, 1)]
]

/-- Partial product 545 for generator 18. -/
def ep_Q2_041_partial_18_0545 : Poly :=
[
  term ((10479649306463821168 : Rat) / 777005835365402853) [(1, 1), (5, 1), (6, 1)],
  term ((-20959298612927642336 : Rat) / 777005835365402853) [(1, 1), (5, 1), (6, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 545 for generator 18. -/
theorem ep_Q2_041_partial_18_0545_valid :
    mulPoly ep_Q2_041_coefficient_18_0545
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0545 := by
  native_decide

/-- Coefficient term 546 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0546 : Poly :=
[
  term ((-72492122824044644836314994270263395440485967873155687637962000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 2)]
]

/-- Partial product 546 for generator 18. -/
def ep_Q2_041_partial_18_0546 : Poly :=
[
  term ((-144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((72492122824044644836314994270263395440485967873155687637962000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 546 for generator 18. -/
theorem ep_Q2_041_partial_18_0546_valid :
    mulPoly ep_Q2_041_coefficient_18_0546
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0546 := by
  native_decide

/-- Coefficient term 547 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0547 : Poly :=
[
  term ((-22869295362575921897008634548650448065917545787695641065780400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2)]
]

/-- Partial product 547 for generator 18. -/
def ep_Q2_041_partial_18_0547 : Poly :=
[
  term ((-45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((22869295362575921897008634548650448065917545787695641065780400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 547 for generator 18. -/
theorem ep_Q2_041_partial_18_0547_valid :
    mulPoly ep_Q2_041_coefficient_18_0547
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0547 := by
  native_decide

/-- Coefficient term 548 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0548 : Poly :=
[
  term ((10743831064622061829111354242108508313371921243235644533849743107467675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1)]
]

/-- Partial product 548 for generator 18. -/
def ep_Q2_041_partial_18_0548 : Poly :=
[
  term ((21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((-10743831064622061829111354242108508313371921243235644533849743107467675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 548 for generator 18. -/
theorem ep_Q2_041_partial_18_0548_valid :
    mulPoly ep_Q2_041_coefficient_18_0548
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0548 := by
  native_decide

/-- Coefficient term 549 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0549 : Poly :=
[
  term ((4039253386560 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 549 for generator 18. -/
def ep_Q2_041_partial_18_0549 : Poly :=
[
  term ((8078506773120 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-4039253386560 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 549 for generator 18. -/
theorem ep_Q2_041_partial_18_0549_valid :
    mulPoly ep_Q2_041_coefficient_18_0549
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0549 := by
  native_decide

/-- Coefficient term 550 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0550 : Poly :=
[
  term ((-65274310100091660706859578541772704682367148586556930129380 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 550 for generator 18. -/
def ep_Q2_041_partial_18_0550 : Poly :=
[
  term ((-130548620200183321413719157083545409364734297173113860258760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((65274310100091660706859578541772704682367148586556930129380 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 550 for generator 18. -/
theorem ep_Q2_041_partial_18_0550_valid :
    mulPoly ep_Q2_041_coefficient_18_0550
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0550 := by
  native_decide

/-- Coefficient term 551 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0551 : Poly :=
[
  term ((-12082020470674107472719165711710565906747661312192614606327000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 551 for generator 18. -/
def ep_Q2_041_partial_18_0551 : Poly :=
[
  term ((-24164040941348214945438331423421131813495322624385229212654000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((12082020470674107472719165711710565906747661312192614606327000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 551 for generator 18. -/
theorem ep_Q2_041_partial_18_0551_valid :
    mulPoly ep_Q2_041_coefficient_18_0551
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0551 := by
  native_decide

/-- Coefficient term 552 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0552 : Poly :=
[
  term ((-13287018737526770714082305664138951655188543210053234392620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 1), (6, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 552 for generator 18. -/
def ep_Q2_041_partial_18_0552 : Poly :=
[
  term ((-26574037475053541428164611328277903310377086420106468785240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 1), (6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((13287018737526770714082305664138951655188543210053234392620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 1), (6, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 552 for generator 18. -/
theorem ep_Q2_041_partial_18_0552_valid :
    mulPoly ep_Q2_041_coefficient_18_0552
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0552 := by
  native_decide

/-- Coefficient term 553 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0553 : Poly :=
[
  term ((-55469642125191468583433122214399913807905307767631421237920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1)]
]

/-- Partial product 553 for generator 18. -/
def ep_Q2_041_partial_18_0553 : Poly :=
[
  term ((-110939284250382937166866244428799827615810615535262842475840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((55469642125191468583433122214399913807905307767631421237920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 553 for generator 18. -/
theorem ep_Q2_041_partial_18_0553_valid :
    mulPoly ep_Q2_041_coefficient_18_0553
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0553 := by
  native_decide

/-- Coefficient term 554 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0554 : Poly :=
[
  term ((205394348001459827036225817099079620414710242307274448307559000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 3)]
]

/-- Partial product 554 for generator 18. -/
def ep_Q2_041_partial_18_0554 : Poly :=
[
  term ((410788696002919654072451634198159240829420484614548896615118000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 3)],
  term ((-205394348001459827036225817099079620414710242307274448307559000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 554 for generator 18. -/
theorem ep_Q2_041_partial_18_0554_valid :
    mulPoly ep_Q2_041_coefficient_18_0554
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0554 := by
  native_decide

/-- Coefficient term 555 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0555 : Poly :=
[
  term ((17297436312039729032769443923294184751523426804295479072860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 555 for generator 18. -/
def ep_Q2_041_partial_18_0555 : Poly :=
[
  term ((34594872624079458065538887846588369503046853608590958145720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-17297436312039729032769443923294184751523426804295479072860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 555 for generator 18. -/
theorem ep_Q2_041_partial_18_0555_valid :
    mulPoly ep_Q2_041_coefficient_18_0555
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0555 := by
  native_decide

/-- Coefficient term 556 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0556 : Poly :=
[
  term ((-3811549227095986982834772424775074677652924297949273510963400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 556 for generator 18. -/
def ep_Q2_041_partial_18_0556 : Poly :=
[
  term ((-7623098454191973965669544849550149355305848595898547021926800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((3811549227095986982834772424775074677652924297949273510963400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 556 for generator 18. -/
theorem ep_Q2_041_partial_18_0556_valid :
    mulPoly ep_Q2_041_coefficient_18_0556
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0556 := by
  native_decide

/-- Coefficient term 557 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0557 : Poly :=
[
  term ((3239513277222710143295985988855440254778381470229286513660 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 557 for generator 18. -/
def ep_Q2_041_partial_18_0557 : Poly :=
[
  term ((6479026554445420286591971977710880509556762940458573027320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3239513277222710143295985988855440254778381470229286513660 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 557 for generator 18. -/
theorem ep_Q2_041_partial_18_0557_valid :
    mulPoly ep_Q2_041_coefficient_18_0557
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0557 := by
  native_decide

/-- Coefficient term 558 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0558 : Poly :=
[
  term ((45148195452554746776137487763142008005598472085980426033600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

/-- Partial product 558 for generator 18. -/
def ep_Q2_041_partial_18_0558 : Poly :=
[
  term ((90296390905109493552274975526284016011196944171960852067200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((-45148195452554746776137487763142008005598472085980426033600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 558 for generator 18. -/
theorem ep_Q2_041_partial_18_0558_valid :
    mulPoly ep_Q2_041_coefficient_18_0558
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0558 := by
  native_decide

/-- Coefficient term 559 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0559 : Poly :=
[
  term ((64796336860631778708191131221176269520099713065137649686377800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 3)]
]

/-- Partial product 559 for generator 18. -/
def ep_Q2_041_partial_18_0559 : Poly :=
[
  term ((129592673721263557416382262442352539040199426130275299372755600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 3)],
  term ((-64796336860631778708191131221176269520099713065137649686377800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 559 for generator 18. -/
theorem ep_Q2_041_partial_18_0559_valid :
    mulPoly ep_Q2_041_coefficient_18_0559
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0559 := by
  native_decide

/-- Coefficient term 560 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0560 : Poly :=
[
  term ((-2420033493100051757 : Rat) / 259001945121800951) [(1, 1), (5, 1), (6, 1), (14, 1)]
]

/-- Partial product 560 for generator 18. -/
def ep_Q2_041_partial_18_0560 : Poly :=
[
  term ((-4840066986200103514 : Rat) / 259001945121800951) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1)],
  term ((2420033493100051757 : Rat) / 259001945121800951) [(1, 1), (5, 1), (6, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 560 for generator 18. -/
theorem ep_Q2_041_partial_18_0560_valid :
    mulPoly ep_Q2_041_coefficient_18_0560
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0560 := by
  native_decide

/-- Coefficient term 561 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0561 : Poly :=
[
  term ((-19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2)]
]

/-- Partial product 561 for generator 18. -/
def ep_Q2_041_partial_18_0561 : Poly :=
[
  term ((-19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 561 for generator 18. -/
theorem ep_Q2_041_partial_18_0561_valid :
    mulPoly ep_Q2_041_coefficient_18_0561
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0561 := by
  native_decide

/-- Coefficient term 562 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0562 : Poly :=
[
  term ((673208897760 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 562 for generator 18. -/
def ep_Q2_041_partial_18_0562 : Poly :=
[
  term ((1346417795520 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-673208897760 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 562 for generator 18. -/
theorem ep_Q2_041_partial_18_0562_valid :
    mulPoly ep_Q2_041_coefficient_18_0562
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0562 := by
  native_decide

/-- Coefficient term 563 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0563 : Poly :=
[
  term ((-154718322 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)]
]

/-- Partial product 563 for generator 18. -/
def ep_Q2_041_partial_18_0563 : Poly :=
[
  term ((-309436644 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((154718322 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 563 for generator 18. -/
theorem ep_Q2_041_partial_18_0563_valid :
    mulPoly ep_Q2_041_coefficient_18_0563
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0563 := by
  native_decide

/-- Coefficient term 564 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0564 : Poly :=
[
  term ((-12499925132532065855 : Rat) / 777005835365402853) [(1, 1), (5, 1), (6, 1), (14, 2)]
]

/-- Partial product 564 for generator 18. -/
def ep_Q2_041_partial_18_0564 : Poly :=
[
  term ((-24999850265064131710 : Rat) / 777005835365402853) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 2)],
  term ((12499925132532065855 : Rat) / 777005835365402853) [(1, 1), (5, 1), (6, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 564 for generator 18. -/
theorem ep_Q2_041_partial_18_0564_valid :
    mulPoly ep_Q2_041_coefficient_18_0564
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0564 := by
  native_decide

/-- Coefficient term 565 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0565 : Poly :=
[
  term ((-318060878 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (14, 2), (16, 1)]
]

/-- Partial product 565 for generator 18. -/
def ep_Q2_041_partial_18_0565 : Poly :=
[
  term ((-636121756 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 2), (16, 1)],
  term ((318060878 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 565 for generator 18. -/
theorem ep_Q2_041_partial_18_0565_valid :
    mulPoly ep_Q2_041_coefficient_18_0565
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0565 := by
  native_decide

/-- Coefficient term 566 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0566 : Poly :=
[
  term ((-102636561558680783660066330144109779633168397420374951823752845866703365 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (5, 1), (6, 1), (15, 2)]
]

/-- Partial product 566 for generator 18. -/
def ep_Q2_041_partial_18_0566 : Poly :=
[
  term ((-102636561558680783660066330144109779633168397420374951823752845866703365 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((102636561558680783660066330144109779633168397420374951823752845866703365 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (5, 1), (6, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 566 for generator 18. -/
theorem ep_Q2_041_partial_18_0566_valid :
    mulPoly ep_Q2_041_coefficient_18_0566
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0566 := by
  native_decide

/-- Coefficient term 567 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0567 : Poly :=
[
  term ((-11444551261920 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

/-- Partial product 567 for generator 18. -/
def ep_Q2_041_partial_18_0567 : Poly :=
[
  term ((-22889102523840 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((11444551261920 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 567 for generator 18. -/
theorem ep_Q2_041_partial_18_0567_valid :
    mulPoly ep_Q2_041_coefficient_18_0567
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0567 := by
  native_decide

/-- Coefficient term 568 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0568 : Poly :=
[
  term ((-326685112 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

/-- Partial product 568 for generator 18. -/
def ep_Q2_041_partial_18_0568 : Poly :=
[
  term ((-653370224 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((326685112 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 568 for generator 18. -/
theorem ep_Q2_041_partial_18_0568_valid :
    mulPoly ep_Q2_041_coefficient_18_0568
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0568 := by
  native_decide

/-- Coefficient term 569 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0569 : Poly :=
[
  term ((181230307060111612090787485675658488601214919682889219094905000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 569 for generator 18. -/
def ep_Q2_041_partial_18_0569 : Poly :=
[
  term ((362460614120223224181574971351316977202429839365778438189810000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-181230307060111612090787485675658488601214919682889219094905000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 569 for generator 18. -/
theorem ep_Q2_041_partial_18_0569_valid :
    mulPoly ep_Q2_041_coefficient_18_0569
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0569 := by
  native_decide

/-- Coefficient term 570 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0570 : Poly :=
[
  term ((-34389882195516262835532571765754213941747985111361372988080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 570 for generator 18. -/
def ep_Q2_041_partial_18_0570 : Poly :=
[
  term ((-68779764391032525671065143531508427883495970222722745976160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((34389882195516262835532571765754213941747985111361372988080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 570 for generator 18. -/
theorem ep_Q2_041_partial_18_0570_valid :
    mulPoly ep_Q2_041_coefficient_18_0570
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0570 := by
  native_decide

/-- Coefficient term 571 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0571 : Poly :=
[
  term ((57173238406439804742521586371626120164793864469239102664451000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 571 for generator 18. -/
def ep_Q2_041_partial_18_0571 : Poly :=
[
  term ((114346476812879609485043172743252240329587728938478205328902000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-57173238406439804742521586371626120164793864469239102664451000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 571 for generator 18. -/
theorem ep_Q2_041_partial_18_0571_valid :
    mulPoly ep_Q2_041_coefficient_18_0571
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0571 := by
  native_decide

/-- Coefficient term 572 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0572 : Poly :=
[
  term ((-34752803082513313520718907827861513072171985319667955234100670639754215 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)]
]

/-- Partial product 572 for generator 18. -/
def ep_Q2_041_partial_18_0572 : Poly :=
[
  term ((-34752803082513313520718907827861513072171985319667955234100670639754215 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((34752803082513313520718907827861513072171985319667955234100670639754215 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 572 for generator 18. -/
theorem ep_Q2_041_partial_18_0572_valid :
    mulPoly ep_Q2_041_coefficient_18_0572
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0572 := by
  native_decide

/-- Coefficient term 573 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0573 : Poly :=
[
  term ((-10098133466400 : Rat) / 275754830051) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 573 for generator 18. -/
def ep_Q2_041_partial_18_0573 : Poly :=
[
  term ((-20196266932800 : Rat) / 275754830051) [(1, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((10098133466400 : Rat) / 275754830051) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 573 for generator 18. -/
theorem ep_Q2_041_partial_18_0573_valid :
    mulPoly ep_Q2_041_coefficient_18_0573
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0573 := by
  native_decide

/-- Coefficient term 574 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0574 : Poly :=
[
  term ((1583511147263464476160019497533465341523394425697939839282400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 574 for generator 18. -/
def ep_Q2_041_partial_18_0574 : Poly :=
[
  term ((3167022294526928952320038995066930683046788851395879678564800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1583511147263464476160019497533465341523394425697939839282400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 574 for generator 18. -/
theorem ep_Q2_041_partial_18_0574_valid :
    mulPoly ep_Q2_041_coefficient_18_0574
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0574 := by
  native_decide

/-- Coefficient term 575 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0575 : Poly :=
[
  term ((-18769744518747963207571508717286373889207247351370609755210 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 575 for generator 18. -/
def ep_Q2_041_partial_18_0575 : Poly :=
[
  term ((-37539489037495926415143017434572747778414494702741219510420 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((18769744518747963207571508717286373889207247351370609755210 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 575 for generator 18. -/
theorem ep_Q2_041_partial_18_0575_valid :
    mulPoly ep_Q2_041_coefficient_18_0575
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0575 := by
  native_decide

/-- Coefficient term 576 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0576 : Poly :=
[
  term ((-721609859667002433722478763952016984489676986371918900524552600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 576 for generator 18. -/
def ep_Q2_041_partial_18_0576 : Poly :=
[
  term ((-1443219719334004867444957527904033968979353972743837801049105200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((721609859667002433722478763952016984489676986371918900524552600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 576 for generator 18. -/
theorem ep_Q2_041_partial_18_0576_valid :
    mulPoly ep_Q2_041_coefficient_18_0576
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0576 := by
  native_decide

/-- Coefficient term 577 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0577 : Poly :=
[
  term ((125646286212733225352005928919859013927503376763651105813030 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 577 for generator 18. -/
def ep_Q2_041_partial_18_0577 : Poly :=
[
  term ((251292572425466450704011857839718027855006753527302211626060 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-125646286212733225352005928919859013927503376763651105813030 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 577 for generator 18. -/
theorem ep_Q2_041_partial_18_0577_valid :
    mulPoly ep_Q2_041_coefficient_18_0577
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0577 := by
  native_decide

/-- Coefficient term 578 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0578 : Poly :=
[
  term ((34389882195516262835532571765754213941747985111361372988080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (12, 1), (15, 2)]
]

/-- Partial product 578 for generator 18. -/
def ep_Q2_041_partial_18_0578 : Poly :=
[
  term ((68779764391032525671065143531508427883495970222722745976160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((-34389882195516262835532571765754213941747985111361372988080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 578 for generator 18. -/
theorem ep_Q2_041_partial_18_0578_valid :
    mulPoly ep_Q2_041_coefficient_18_0578
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0578 := by
  native_decide

/-- Coefficient term 579 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0579 : Poly :=
[
  term ((730766950442737536185407912014552803492263818096265652932654902188850 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 579 for generator 18. -/
def ep_Q2_041_partial_18_0579 : Poly :=
[
  term ((1461533900885475072370815824029105606984527636192531305865309804377700 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-730766950442737536185407912014552803492263818096265652932654902188850 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 579 for generator 18. -/
theorem ep_Q2_041_partial_18_0579_valid :
    mulPoly ep_Q2_041_coefficient_18_0579
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0579 := by
  native_decide

/-- Coefficient term 580 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0580 : Poly :=
[
  term ((3880292800 : Rat) / 151763803) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 580 for generator 18. -/
def ep_Q2_041_partial_18_0580 : Poly :=
[
  term ((7760585600 : Rat) / 151763803) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3880292800 : Rat) / 151763803) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 580 for generator 18. -/
theorem ep_Q2_041_partial_18_0580_valid :
    mulPoly ep_Q2_041_coefficient_18_0580
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0580 := by
  native_decide

/-- Coefficient term 581 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0581 : Poly :=
[
  term ((-227648306800555133648864963414529089821596508254555498658502920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 581 for generator 18. -/
def ep_Q2_041_partial_18_0581 : Poly :=
[
  term ((-455296613601110267297729926829058179643193016509110997317005840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((227648306800555133648864963414529089821596508254555498658502920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 581 for generator 18. -/
theorem ep_Q2_041_partial_18_0581_valid :
    mulPoly ep_Q2_041_coefficient_18_0581
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0581 := by
  native_decide

/-- Coefficient term 582 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0582 : Poly :=
[
  term ((-65715193292095098354989195649389388100958368805114118120130 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 582 for generator 18. -/
def ep_Q2_041_partial_18_0582 : Poly :=
[
  term ((-131430386584190196709978391298778776201916737610228236240260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((65715193292095098354989195649389388100958368805114118120130 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 582 for generator 18. -/
theorem ep_Q2_041_partial_18_0582_valid :
    mulPoly ep_Q2_041_coefficient_18_0582
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0582 := by
  native_decide

/-- Coefficient term 583 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0583 : Poly :=
[
  term ((-178183026594000288907804687194818431513738957278468345517200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 583 for generator 18. -/
def ep_Q2_041_partial_18_0583 : Poly :=
[
  term ((-356366053188000577815609374389636863027477914556936691034400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (8, 1), (13, 2), (14, 1), (15, 2)],
  term ((178183026594000288907804687194818431513738957278468345517200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 583 for generator 18. -/
theorem ep_Q2_041_partial_18_0583_valid :
    mulPoly ep_Q2_041_coefficient_18_0583
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0583 := by
  native_decide

/-- Coefficient term 584 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0584 : Poly :=
[
  term ((-2020275826068244687 : Rat) / 1554011670730805706) [(1, 1), (5, 1), (14, 1)]
]

/-- Partial product 584 for generator 18. -/
def ep_Q2_041_partial_18_0584 : Poly :=
[
  term ((-2020275826068244687 : Rat) / 777005835365402853) [(1, 1), (5, 1), (8, 1), (14, 1)],
  term ((2020275826068244687 : Rat) / 1554011670730805706) [(1, 1), (5, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 584 for generator 18. -/
theorem ep_Q2_041_partial_18_0584_valid :
    mulPoly ep_Q2_041_coefficient_18_0584
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0584 := by
  native_decide

/-- Coefficient term 585 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0585 : Poly :=
[
  term ((251875919361913222112476874918568556174184509586274872831514696157045605 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (5, 1), (14, 1), (15, 2)]
]

/-- Partial product 585 for generator 18. -/
def ep_Q2_041_partial_18_0585 : Poly :=
[
  term ((251875919361913222112476874918568556174184509586274872831514696157045605 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2)],
  term ((-251875919361913222112476874918568556174184509586274872831514696157045605 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (5, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 585 for generator 18. -/
theorem ep_Q2_041_partial_18_0585_valid :
    mulPoly ep_Q2_041_coefficient_18_0585
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0585 := by
  native_decide

/-- Coefficient term 586 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0586 : Poly :=
[
  term ((40208024760288 : Rat) / 275754830051) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 586 for generator 18. -/
def ep_Q2_041_partial_18_0586 : Poly :=
[
  term ((80416049520576 : Rat) / 275754830051) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-40208024760288 : Rat) / 275754830051) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 586 for generator 18. -/
theorem ep_Q2_041_partial_18_0586_valid :
    mulPoly ep_Q2_041_coefficient_18_0586
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0586 := by
  native_decide

/-- Coefficient term 587 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0587 : Poly :=
[
  term ((4312117 : Rat) / 151763803) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 587 for generator 18. -/
def ep_Q2_041_partial_18_0587 : Poly :=
[
  term ((8624234 : Rat) / 151763803) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((-4312117 : Rat) / 151763803) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 587 for generator 18. -/
theorem ep_Q2_041_partial_18_0587_valid :
    mulPoly ep_Q2_041_coefficient_18_0587
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0587 := by
  native_decide

/-- Coefficient term 588 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0588 : Poly :=
[
  term ((32259950744364286981 : Rat) / 1554011670730805706) [(1, 1), (5, 1), (14, 2)]
]

/-- Partial product 588 for generator 18. -/
def ep_Q2_041_partial_18_0588 : Poly :=
[
  term ((32259950744364286981 : Rat) / 777005835365402853) [(1, 1), (5, 1), (8, 1), (14, 2)],
  term ((-32259950744364286981 : Rat) / 1554011670730805706) [(1, 1), (5, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 588 for generator 18. -/
theorem ep_Q2_041_partial_18_0588_valid :
    mulPoly ep_Q2_041_coefficient_18_0588
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0588 := by
  native_decide

/-- Coefficient term 589 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0589 : Poly :=
[
  term ((395420039 : Rat) / 151763803) [(1, 1), (5, 1), (14, 2), (16, 1)]
]

/-- Partial product 589 for generator 18. -/
def ep_Q2_041_partial_18_0589 : Poly :=
[
  term ((790840078 : Rat) / 151763803) [(1, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((-395420039 : Rat) / 151763803) [(1, 1), (5, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 589 for generator 18. -/
theorem ep_Q2_041_partial_18_0589_valid :
    mulPoly ep_Q2_041_coefficient_18_0589
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0589 := by
  native_decide

/-- Coefficient term 590 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0590 : Poly :=
[
  term ((-31910859427840473300 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1)]
]

/-- Partial product 590 for generator 18. -/
def ep_Q2_041_partial_18_0590 : Poly :=
[
  term ((31910859427840473300 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1)],
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 590 for generator 18. -/
theorem ep_Q2_041_partial_18_0590_valid :
    mulPoly ep_Q2_041_coefficient_18_0590
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0590 := by
  native_decide

/-- Coefficient term 591 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0591 : Poly :=
[
  term ((24022068973512879723 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1)]
]

/-- Partial product 591 for generator 18. -/
def ep_Q2_041_partial_18_0591 : Poly :=
[
  term ((-24022068973512879723 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1)],
  term ((48044137947025759446 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 591 for generator 18. -/
theorem ep_Q2_041_partial_18_0591_valid :
    mulPoly ep_Q2_041_coefficient_18_0591
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0591 := by
  native_decide

/-- Coefficient term 592 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0592 : Poly :=
[
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 592 for generator 18. -/
def ep_Q2_041_partial_18_0592 : Poly :=
[
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 592 for generator 18. -/
theorem ep_Q2_041_partial_18_0592_valid :
    mulPoly ep_Q2_041_coefficient_18_0592
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0592 := by
  native_decide

/-- Coefficient term 593 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0593 : Poly :=
[
  term ((445436319863636590746027785590117726182675330714012185958780 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)]
]

/-- Partial product 593 for generator 18. -/
def ep_Q2_041_partial_18_0593 : Poly :=
[
  term ((-445436319863636590746027785590117726182675330714012185958780 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((890872639727273181492055571180235452365350661428024371917560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 593 for generator 18. -/
theorem ep_Q2_041_partial_18_0593_valid :
    mulPoly ep_Q2_041_coefficient_18_0593
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0593 := by
  native_decide

/-- Coefficient term 594 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0594 : Poly :=
[
  term ((-144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 3)]
]

/-- Partial product 594 for generator 18. -/
def ep_Q2_041_partial_18_0594 : Poly :=
[
  term ((144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 3)],
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 594 for generator 18. -/
theorem ep_Q2_041_partial_18_0594_valid :
    mulPoly ep_Q2_041_coefficient_18_0594
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0594 := by
  native_decide

/-- Coefficient term 595 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0595 : Poly :=
[
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 595 for generator 18. -/
def ep_Q2_041_partial_18_0595 : Poly :=
[
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 595 for generator 18. -/
theorem ep_Q2_041_partial_18_0595_valid :
    mulPoly ep_Q2_041_coefficient_18_0595
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0595 := by
  native_decide

/-- Coefficient term 596 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0596 : Poly :=
[
  term ((-100304718592792364831030453758127627541897471798672175923420 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)]
]

/-- Partial product 596 for generator 18. -/
def ep_Q2_041_partial_18_0596 : Poly :=
[
  term ((100304718592792364831030453758127627541897471798672175923420 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((-200609437185584729662060907516255255083794943597344351846840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 596 for generator 18. -/
theorem ep_Q2_041_partial_18_0596_valid :
    mulPoly ep_Q2_041_coefficient_18_0596
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0596 := by
  native_decide

/-- Coefficient term 597 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0597 : Poly :=
[
  term ((-45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 3)]
]

/-- Partial product 597 for generator 18. -/
def ep_Q2_041_partial_18_0597 : Poly :=
[
  term ((45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 3)],
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 597 for generator 18. -/
theorem ep_Q2_041_partial_18_0597_valid :
    mulPoly ep_Q2_041_coefficient_18_0597
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0597 := by
  native_decide

/-- Coefficient term 598 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0598 : Poly :=
[
  term ((63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1)]
]

/-- Partial product 598 for generator 18. -/
def ep_Q2_041_partial_18_0598 : Poly :=
[
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1)],
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 598 for generator 18. -/
theorem ep_Q2_041_partial_18_0598_valid :
    mulPoly ep_Q2_041_coefficient_18_0598
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0598 := by
  native_decide

/-- Coefficient term 599 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0599 : Poly :=
[
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1), (16, 1)]
]

/-- Partial product 599 for generator 18. -/
def ep_Q2_041_partial_18_0599 : Poly :=
[
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 599 for generator 18. -/
theorem ep_Q2_041_partial_18_0599_valid :
    mulPoly ep_Q2_041_coefficient_18_0599
        ep_Q2_041_generator_18_0500_0599 =
      ep_Q2_041_partial_18_0599 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_0500_0599 : List Poly :=
[
  ep_Q2_041_partial_18_0500,
  ep_Q2_041_partial_18_0501,
  ep_Q2_041_partial_18_0502,
  ep_Q2_041_partial_18_0503,
  ep_Q2_041_partial_18_0504,
  ep_Q2_041_partial_18_0505,
  ep_Q2_041_partial_18_0506,
  ep_Q2_041_partial_18_0507,
  ep_Q2_041_partial_18_0508,
  ep_Q2_041_partial_18_0509,
  ep_Q2_041_partial_18_0510,
  ep_Q2_041_partial_18_0511,
  ep_Q2_041_partial_18_0512,
  ep_Q2_041_partial_18_0513,
  ep_Q2_041_partial_18_0514,
  ep_Q2_041_partial_18_0515,
  ep_Q2_041_partial_18_0516,
  ep_Q2_041_partial_18_0517,
  ep_Q2_041_partial_18_0518,
  ep_Q2_041_partial_18_0519,
  ep_Q2_041_partial_18_0520,
  ep_Q2_041_partial_18_0521,
  ep_Q2_041_partial_18_0522,
  ep_Q2_041_partial_18_0523,
  ep_Q2_041_partial_18_0524,
  ep_Q2_041_partial_18_0525,
  ep_Q2_041_partial_18_0526,
  ep_Q2_041_partial_18_0527,
  ep_Q2_041_partial_18_0528,
  ep_Q2_041_partial_18_0529,
  ep_Q2_041_partial_18_0530,
  ep_Q2_041_partial_18_0531,
  ep_Q2_041_partial_18_0532,
  ep_Q2_041_partial_18_0533,
  ep_Q2_041_partial_18_0534,
  ep_Q2_041_partial_18_0535,
  ep_Q2_041_partial_18_0536,
  ep_Q2_041_partial_18_0537,
  ep_Q2_041_partial_18_0538,
  ep_Q2_041_partial_18_0539,
  ep_Q2_041_partial_18_0540,
  ep_Q2_041_partial_18_0541,
  ep_Q2_041_partial_18_0542,
  ep_Q2_041_partial_18_0543,
  ep_Q2_041_partial_18_0544,
  ep_Q2_041_partial_18_0545,
  ep_Q2_041_partial_18_0546,
  ep_Q2_041_partial_18_0547,
  ep_Q2_041_partial_18_0548,
  ep_Q2_041_partial_18_0549,
  ep_Q2_041_partial_18_0550,
  ep_Q2_041_partial_18_0551,
  ep_Q2_041_partial_18_0552,
  ep_Q2_041_partial_18_0553,
  ep_Q2_041_partial_18_0554,
  ep_Q2_041_partial_18_0555,
  ep_Q2_041_partial_18_0556,
  ep_Q2_041_partial_18_0557,
  ep_Q2_041_partial_18_0558,
  ep_Q2_041_partial_18_0559,
  ep_Q2_041_partial_18_0560,
  ep_Q2_041_partial_18_0561,
  ep_Q2_041_partial_18_0562,
  ep_Q2_041_partial_18_0563,
  ep_Q2_041_partial_18_0564,
  ep_Q2_041_partial_18_0565,
  ep_Q2_041_partial_18_0566,
  ep_Q2_041_partial_18_0567,
  ep_Q2_041_partial_18_0568,
  ep_Q2_041_partial_18_0569,
  ep_Q2_041_partial_18_0570,
  ep_Q2_041_partial_18_0571,
  ep_Q2_041_partial_18_0572,
  ep_Q2_041_partial_18_0573,
  ep_Q2_041_partial_18_0574,
  ep_Q2_041_partial_18_0575,
  ep_Q2_041_partial_18_0576,
  ep_Q2_041_partial_18_0577,
  ep_Q2_041_partial_18_0578,
  ep_Q2_041_partial_18_0579,
  ep_Q2_041_partial_18_0580,
  ep_Q2_041_partial_18_0581,
  ep_Q2_041_partial_18_0582,
  ep_Q2_041_partial_18_0583,
  ep_Q2_041_partial_18_0584,
  ep_Q2_041_partial_18_0585,
  ep_Q2_041_partial_18_0586,
  ep_Q2_041_partial_18_0587,
  ep_Q2_041_partial_18_0588,
  ep_Q2_041_partial_18_0589,
  ep_Q2_041_partial_18_0590,
  ep_Q2_041_partial_18_0591,
  ep_Q2_041_partial_18_0592,
  ep_Q2_041_partial_18_0593,
  ep_Q2_041_partial_18_0594,
  ep_Q2_041_partial_18_0595,
  ep_Q2_041_partial_18_0596,
  ep_Q2_041_partial_18_0597,
  ep_Q2_041_partial_18_0598,
  ep_Q2_041_partial_18_0599
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_0500_0599 : Poly :=
[
  term ((15555636332521923396728476331153881030931769904386309608153498565 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (13, 2), (15, 2)],
  term ((11100953844312470489782907063858061544612656914560081163520090 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (13, 3), (14, 1), (15, 1)],
  term ((-11412843286348304728309586034434718840871285152534193745637720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (13, 3), (14, 2), (15, 1)],
  term ((-294562250811621225275196805544620779799815558086661883111095 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 1), (8, 1), (13, 3), (15, 1)],
  term ((17592688557739130 : Rat) / 3100914216589) [(0, 1), (8, 1), (14, 1)],
  term ((10054218322640873066224456691035454127116653391626935656485340043559494666769501070521 : Rat) / 390517848730568215080920196196416405410916963814941625960296841236966881647970496) [(0, 1), (8, 1), (14, 1), (15, 2)],
  term ((12426094785131553348532392970997016420028262115247524926148739955 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (14, 1), (15, 4)],
  term ((-12035491494502190 : Rat) / 3100914216589) [(0, 1), (8, 1), (14, 2)],
  term ((49506366076066672480634117141858958347055674127299006841168210395 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (14, 2), (15, 2)],
  term ((-3438685142847526 : Rat) / 9302742649767) [(0, 1), (8, 1), (14, 3)],
  term ((2826722250439796613903751416493757385804704797174897418038748240 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (14, 3), (15, 2)],
  term ((10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (15, 2)],
  term ((-114615575566079661987532774267138142062813915519644900199521895 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (15, 4)],
  term ((-15555636332521923396728476331153881030931769904386309608153498565 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (13, 2), (15, 2)],
  term ((-5550476922156235244891453531929030772306328457280040581760045 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (13, 3), (14, 1), (15, 1)],
  term ((5706421643174152364154793017217359420435642576267096872818860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (13, 3), (14, 2), (15, 1)],
  term ((294562250811621225275196805544620779799815558086661883111095 : Rat) / 6411569458428135808083770169581959523663379719091834185354) [(0, 1), (13, 3), (15, 1)],
  term ((-8796344278869565 : Rat) / 3100914216589) [(0, 1), (14, 1)],
  term ((-10054218322640873066224456691035454127116653391626935656485340043559494666769501070521 : Rat) / 781035697461136430161840392392832810821833927629883251920593682473933763295940992) [(0, 1), (14, 1), (15, 2)],
  term ((-12426094785131553348532392970997016420028262115247524926148739955 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (14, 1), (15, 4)],
  term ((6017745747251095 : Rat) / 3100914216589) [(0, 1), (14, 2)],
  term ((-49506366076066672480634117141858958347055674127299006841168210395 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (14, 2), (15, 2)],
  term ((1719342571423763 : Rat) / 9302742649767) [(0, 1), (14, 3)],
  term ((-1413361125219898306951875708246878692902352398587448709019374120 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (14, 3), (15, 2)],
  term ((-10909710733814973590292897265632432224751243248950787078956371361 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (15, 2)],
  term ((114615575566079661987532774267138142062813915519644900199521895 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (15, 4)],
  term ((-394289809643387243133108380153992583289755299146309102028279800 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 2), (2, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((11193365530841606560457478610695589632392991207293151558221610 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 2), (2, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6284906475457038 : Rat) / 3100914216589) [(0, 2), (2, 1), (8, 1), (14, 1)],
  term ((2947834630286193758509229498904246677904311734685301604483886145 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 2), (2, 1), (8, 1), (14, 1), (15, 2)],
  term ((197144904821693621566554190076996291644877649573154551014139900 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 2), (2, 1), (11, 1), (14, 1), (15, 1)],
  term ((-5596682765420803280228739305347794816196495603646575779110805 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 2), (2, 1), (13, 1), (14, 1), (15, 1)],
  term ((3142453237728519 : Rat) / 3100914216589) [(0, 2), (2, 1), (14, 1)],
  term ((-2947834630286193758509229498904246677904311734685301604483886145 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 2), (2, 1), (14, 1), (15, 2)],
  term ((6239627876795070823400066134925496745000286274296060192570625920 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 2), (8, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((-7392934922330885653965723747002247022426743418645631576121600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 2), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((14188546778853304 : Rat) / 3100914216589) [(0, 2), (8, 1), (10, 1), (14, 1)],
  term ((-4090130502146442064678647322194413032608566502497090395849569585 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 2), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-3479599209291360121468307473847548661971999180271896478372667320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 2), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-542918658358674415213107837670477515709463969806788568871430 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 2), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7903640303396266 : Rat) / 3100914216589) [(0, 2), (8, 1), (14, 1)],
  term ((5232426374006690370848065145484579387312821270308879187215253025 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 2), (8, 1), (14, 1), (15, 2)],
  term ((-3119813938397535411700033067462748372500143137148030096285312960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((3696467461165442826982861873501123511213371709322815788060800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7094273389426652 : Rat) / 3100914216589) [(0, 2), (10, 1), (14, 1)],
  term ((4090130502146442064678647322194413032608566502497090395849569585 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 2), (10, 1), (14, 1), (15, 2)],
  term ((1739799604645680060734153736923774330985999590135948239186333660 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((271459329179337207606553918835238757854731984903394284435715 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((3951820151698133 : Rat) / 3100914216589) [(0, 2), (14, 1)],
  term ((-5232426374006690370848065145484579387312821270308879187215253025 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 2), (14, 1), (15, 2)],
  term ((2580297310543202307738301313900849086115510998647610945387388822512320 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (2, 1), (3, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1121924554741259138971647881788136769245612950372348965978616664883769200 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (2, 1), (3, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1290148655271601153869150656950424543057755499323805472693694411256160 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (2, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-560962277370629569485823940894068384622806475186174482989308332441884600 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (2, 1), (3, 1), (14, 1), (15, 2)],
  term ((966561637653928597817533256936845272539812904975409168506160000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (2, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((304923938167678958626781793982005974212233943835941880877072000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (2, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-143251080861627491054818056561446777511625616576475260451329908099569000 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-53856711820800 : Rat) / 275754830051) [(1, 1), (2, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-483280818826964298908766628468422636269906452487704584253080000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (2, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((-152461969083839479313390896991002987106116971917970940438536000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (2, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((71625540430813745527409028280723388755812808288237630225664954049784500 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1)],
  term ((26928355910400 : Rat) / 275754830051) [(1, 1), (2, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1704221133898503072190415728479404969157819441831239427294044217139200 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (2, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3113348215200782315781410913160525029412828158492530821049151242013823200 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (2, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((852110566949251536095207864239702484578909720915619713647022108569600 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (2, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1556674107600391157890705456580262514706414079246265410524575621006911600 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (2, 1), (11, 1), (14, 1), (15, 2)],
  term ((579936982592357158690519954162107163523887742985245501103696000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (6, 1), (8, 1), (11, 1), (15, 3)],
  term ((182954362900607375176069076389203584527340366301565128526243200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (3, 1), (6, 1), (8, 1), (13, 1), (15, 3)],
  term ((-85950648516976494632890833936868066506975369945885156270797944859741400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2)],
  term ((-32314027092480 : Rat) / 275754830051) [(1, 1), (3, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (6, 1), (11, 1), (15, 3)],
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (3, 1), (6, 1), (13, 1), (15, 3)],
  term ((42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (3, 1), (6, 1), (15, 2)],
  term ((16157013546240 : Rat) / 275754830051) [(1, 1), (3, 1), (6, 1), (15, 2), (16, 1)],
  term ((386624655061571439127013302774738109015925161990163667402464000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((121969575267071583450712717592802389684893577534376752350828800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (3, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-57300432344650996421927222624578711004650246630590104180531963239827600 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (3, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-21542684728320 : Rat) / 275754830051) [(1, 1), (3, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-193312327530785719563506651387369054507962580995081833701232000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-60984787633535791725356358796401194842446788767188376175414400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (3, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((28650216172325498210963611312289355502325123315295052090265981619913800 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1)],
  term ((10771342364160 : Rat) / 275754830051) [(1, 1), (3, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((2101363833952183824115137311506177485189313397153611323420661040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((1354755096555153852546017739661010752393930242706770060118559714602638482467175597 : Rat) / 214924517738342440881078809133966100941616380745702600968792978116107254621888) [(1, 1), (3, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((28158263285665 : Rat) / 19260336749) [(1, 1), (3, 1), (8, 1), (14, 1)],
  term ((896057999161215779599273380963265973428427027044181289780220241193683711531745433919 : Rat) / 55788264104366887868702885170916629344416709116420232280042405890995268806852928) [(1, 1), (3, 1), (8, 1), (14, 1), (15, 2)],
  term ((-1050681916976091912057568655753088742594656698576805661710330520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1354755096555153852546017739661010752393930242706770060118559714602638482467175597 : Rat) / 429849035476684881762157618267932201883232761491405201937585956232214509243776) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((-28158263285665 : Rat) / 38520673498) [(1, 1), (3, 1), (14, 1)],
  term ((-896057999161215779599273380963265973428427027044181289780220241193683711531745433919 : Rat) / 111576528208733775737405770341833258688833418232840464560084811781990537613705856) [(1, 1), (3, 1), (14, 1), (15, 2)],
  term ((10479649306463821168 : Rat) / 777005835365402853) [(1, 1), (5, 1), (6, 1)],
  term ((-144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 2)],
  term ((-45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 2)],
  term ((21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1)],
  term ((8078506773120 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((72492122824044644836314994270263395440485967873155687637962000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (7, 1), (11, 1), (15, 2)],
  term ((22869295362575921897008634548650448065917545787695641065780400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-10743831064622061829111354242108508313371921243235644533849743107467675 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1)],
  term ((-4039253386560 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-20959298612927642336 : Rat) / 777005835365402853) [(1, 1), (5, 1), (6, 1), (8, 1)],
  term ((-130548620200183321413719157083545409364734297173113860258760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-24164040941348214945438331423421131813495322624385229212654000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((-26574037475053541428164611328277903310377086420106468785240 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 1), (6, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((-110939284250382937166866244428799827615810615535262842475840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 1)],
  term ((410788696002919654072451634198159240829420484614548896615118000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (8, 1), (11, 1), (15, 3)],
  term ((34594872624079458065538887846588369503046853608590958145720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-7623098454191973965669544849550149355305848595898547021926800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((6479026554445420286591971977710880509556762940458573027320 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((90296390905109493552274975526284016011196944171960852067200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 1)],
  term ((129592673721263557416382262442352539040199426130275299372755600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (8, 1), (13, 1), (15, 3)],
  term ((-4840066986200103514 : Rat) / 259001945121800951) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1)],
  term ((-19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2)],
  term ((1346417795520 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((-309436644 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-24999850265064131710 : Rat) / 777005835365402853) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 2)],
  term ((-636121756 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 2), (16, 1)],
  term ((-102636561558680783660066330144109779633168397420374951823752845866703365 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2)],
  term ((-22889102523840 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (8, 1), (15, 2), (16, 1)],
  term ((-653370224 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((65274310100091660706859578541772704682367148586556930129380 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((12082020470674107472719165711710565906747661312192614606327000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (11, 1), (14, 1), (15, 3)],
  term ((13287018737526770714082305664138951655188543210053234392620 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 1), (6, 1), (11, 1), (14, 2), (15, 1)],
  term ((55469642125191468583433122214399913807905307767631421237920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 1)],
  term ((-205394348001459827036225817099079620414710242307274448307559000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (6, 1), (11, 1), (15, 3)],
  term ((-17297436312039729032769443923294184751523426804295479072860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((3811549227095986982834772424775074677652924297949273510963400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 1), (15, 3)],
  term ((-3239513277222710143295985988855440254778381470229286513660 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (5, 1), (6, 1), (13, 1), (14, 2), (15, 1)],
  term ((-45148195452554746776137487763142008005598472085980426033600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 1)],
  term ((-64796336860631778708191131221176269520099713065137649686377800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (6, 1), (13, 1), (15, 3)],
  term ((2420033493100051757 : Rat) / 259001945121800951) [(1, 1), (5, 1), (6, 1), (14, 1)],
  term ((19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2)],
  term ((-673208897760 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (14, 1), (15, 2), (16, 1)],
  term ((154718322 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((12499925132532065855 : Rat) / 777005835365402853) [(1, 1), (5, 1), (6, 1), (14, 2)],
  term ((318060878 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (14, 2), (16, 1)],
  term ((102636561558680783660066330144109779633168397420374951823752845866703365 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (5, 1), (6, 1), (15, 2)],
  term ((11444551261920 : Rat) / 275754830051) [(1, 1), (5, 1), (6, 1), (15, 2), (16, 1)],
  term ((326685112 : Rat) / 151763803) [(1, 1), (5, 1), (6, 1), (16, 1)],
  term ((362460614120223224181574971351316977202429839365778438189810000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-68779764391032525671065143531508427883495970222722745976160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (7, 1), (8, 1), (12, 1), (15, 1)],
  term ((114346476812879609485043172743252240329587728938478205328902000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-34752803082513313520718907827861513072171985319667955234100670639754215 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1)],
  term ((-20196266932800 : Rat) / 275754830051) [(1, 1), (5, 1), (7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-181230307060111612090787485675658488601214919682889219094905000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (15, 2)],
  term ((34389882195516262835532571765754213941747985111361372988080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1)],
  term ((-57173238406439804742521586371626120164793864469239102664451000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (15, 2)],
  term ((34752803082513313520718907827861513072171985319667955234100670639754215 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1)],
  term ((10098133466400 : Rat) / 275754830051) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3167022294526928952320038995066930683046788851395879678564800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-37539489037495926415143017434572747778414494702741219510420 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1443219719334004867444957527904033968979353972743837801049105200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((251292572425466450704011857839718027855006753527302211626060 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((68779764391032525671065143531508427883495970222722745976160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (8, 1), (12, 1), (15, 2)],
  term ((1461533900885475072370815824029105606984527636192531305865309804377700 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((7760585600 : Rat) / 151763803) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-455296613601110267297729926829058179643193016509110997317005840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-131430386584190196709978391298778776201916737610228236240260 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-356366053188000577815609374389636863027477914556936691034400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (8, 1), (13, 2), (14, 1), (15, 2)],
  term ((-2020275826068244687 : Rat) / 777005835365402853) [(1, 1), (5, 1), (8, 1), (14, 1)],
  term ((251875919361913222112476874918568556174184509586274872831514696157045605 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2)],
  term ((80416049520576 : Rat) / 275754830051) [(1, 1), (5, 1), (8, 1), (14, 1), (15, 2), (16, 1)],
  term ((8624234 : Rat) / 151763803) [(1, 1), (5, 1), (8, 1), (14, 1), (16, 1)],
  term ((32259950744364286981 : Rat) / 777005835365402853) [(1, 1), (5, 1), (8, 1), (14, 2)],
  term ((790840078 : Rat) / 151763803) [(1, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((-1583511147263464476160019497533465341523394425697939839282400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((18769744518747963207571508717286373889207247351370609755210 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1)],
  term ((721609859667002433722478763952016984489676986371918900524552600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 3)],
  term ((-125646286212733225352005928919859013927503376763651105813030 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (11, 1), (14, 2), (15, 1)],
  term ((-34389882195516262835532571765754213941747985111361372988080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (12, 1), (15, 2)],
  term ((-730766950442737536185407912014552803492263818096265652932654902188850 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3880292800 : Rat) / 151763803) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((227648306800555133648864963414529089821596508254555498658502920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 3)],
  term ((65715193292095098354989195649389388100958368805114118120130 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (13, 1), (14, 2), (15, 1)],
  term ((178183026594000288907804687194818431513738957278468345517200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (5, 1), (13, 2), (14, 1), (15, 2)],
  term ((2020275826068244687 : Rat) / 1554011670730805706) [(1, 1), (5, 1), (14, 1)],
  term ((-251875919361913222112476874918568556174184509586274872831514696157045605 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (5, 1), (14, 1), (15, 2)],
  term ((-40208024760288 : Rat) / 275754830051) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-4312117 : Rat) / 151763803) [(1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-32259950744364286981 : Rat) / 1554011670730805706) [(1, 1), (5, 1), (14, 2)],
  term ((-395420039 : Rat) / 151763803) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((31910859427840473300 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1)],
  term ((-87843787829193826323 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1)],
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-445436319863636590746027785590117726182675330714012185958780 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 1)],
  term ((144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 1), (11, 1), (15, 3)],
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((100304718592792364831030453758127627541897471798672175923420 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 1)],
  term ((45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 1), (13, 1), (15, 3)],
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1)],
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 1), (14, 1), (16, 1)],
  term ((48044137947025759446 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 2)],
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 2), (11, 1), (14, 1), (15, 1)],
  term ((890872639727273181492055571180235452365350661428024371917560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 2), (11, 1), (15, 1)],
  term ((-289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (7, 1), (8, 2), (11, 1), (15, 3)],
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 2), (13, 1), (14, 1), (15, 1)],
  term ((-200609437185584729662060907516255255083794943597344351846840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (7, 1), (8, 2), (13, 1), (15, 1)],
  term ((-91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (7, 1), (8, 2), (13, 1), (15, 3)],
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 1), (7, 1), (8, 2), (14, 1)],
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 1), (7, 1), (8, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 500 through 599. -/
theorem ep_Q2_041_block_18_0500_0599_valid :
    checkProductSumEq ep_Q2_041_partials_18_0500_0599
      ep_Q2_041_block_18_0500_0599 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
