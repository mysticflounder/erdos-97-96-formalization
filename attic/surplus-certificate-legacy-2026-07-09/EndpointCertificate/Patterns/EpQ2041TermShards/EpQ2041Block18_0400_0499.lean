/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:400-499

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_0400_0499 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 400 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0400 : Poly :=
[
  term ((-11373173714688347459835257721481251337009858223769039066430130265 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (13, 1), (15, 3)]
]

/-- Partial product 400 for generator 18. -/
def ep_Q2_041_partial_18_0400 : Poly :=
[
  term ((-11373173714688347459835257721481251337009858223769039066430130265 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 3)],
  term ((11373173714688347459835257721481251337009858223769039066430130265 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 18. -/
theorem ep_Q2_041_partial_18_0400_valid :
    mulPoly ep_Q2_041_coefficient_18_0400
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0401 : Poly :=
[
  term ((-58932776982937 : Rat) / 3100914216589) [(0, 1), (10, 1), (13, 2)]
]

/-- Partial product 401 for generator 18. -/
def ep_Q2_041_partial_18_0401 : Poly :=
[
  term ((-117865553965874 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((58932776982937 : Rat) / 3100914216589) [(0, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 18. -/
theorem ep_Q2_041_partial_18_0401_valid :
    mulPoly ep_Q2_041_coefficient_18_0401
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0402 : Poly :=
[
  term ((235731107931748 : Rat) / 3100914216589) [(0, 1), (10, 1), (13, 2), (14, 1)]
]

/-- Partial product 402 for generator 18. -/
def ep_Q2_041_partial_18_0402 : Poly :=
[
  term ((471462215863496 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-235731107931748 : Rat) / 3100914216589) [(0, 1), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 18. -/
theorem ep_Q2_041_partial_18_0402_valid :
    mulPoly ep_Q2_041_coefficient_18_0402
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0403 : Poly :=
[
  term ((-27261465017890581335660481777331539338609392870418450094024333210 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 403 for generator 18. -/
def ep_Q2_041_partial_18_0403 : Poly :=
[
  term ((-54522930035781162671320963554663078677218785740836900188048666420 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 2)],
  term ((27261465017890581335660481777331539338609392870418450094024333210 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 18. -/
theorem ep_Q2_041_partial_18_0403_valid :
    mulPoly ep_Q2_041_coefficient_18_0403
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0404 : Poly :=
[
  term ((617549841128672035613762091872158168297472168270084741130874005 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (10, 1), (13, 2), (15, 2)]
]

/-- Partial product 404 for generator 18. -/
def ep_Q2_041_partial_18_0404 : Poly :=
[
  term ((617549841128672035613762091872158168297472168270084741130874005 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (13, 2), (15, 2)],
  term ((-617549841128672035613762091872158168297472168270084741130874005 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 18. -/
theorem ep_Q2_041_partial_18_0404_valid :
    mulPoly ep_Q2_041_coefficient_18_0404
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0405 : Poly :=
[
  term ((-11851798797361701064013800881912977257827873043016278120469940 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (13, 3), (14, 1), (15, 1)]
]

/-- Partial product 405 for generator 18. -/
def ep_Q2_041_partial_18_0405 : Poly :=
[
  term ((-23703597594723402128027601763825954515655746086032556240939880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 3), (14, 1), (15, 1)],
  term ((11851798797361701064013800881912977257827873043016278120469940 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 18. -/
theorem ep_Q2_041_partial_18_0405_valid :
    mulPoly ep_Q2_041_coefficient_18_0405
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0406 : Poly :=
[
  term ((2962949699340425266003450220478244314456968260754069530117485 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (13, 3), (15, 1)]
]

/-- Partial product 406 for generator 18. -/
def ep_Q2_041_partial_18_0406 : Poly :=
[
  term ((5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 3), (15, 1)],
  term ((-2962949699340425266003450220478244314456968260754069530117485 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 18. -/
theorem ep_Q2_041_partial_18_0406_valid :
    mulPoly ep_Q2_041_coefficient_18_0406
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0407 : Poly :=
[
  term ((-2569463151598659 : Rat) / 3100914216589) [(0, 1), (10, 1), (14, 1)]
]

/-- Partial product 407 for generator 18. -/
def ep_Q2_041_partial_18_0407 : Poly :=
[
  term ((-5138926303197318 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1), (14, 1)],
  term ((2569463151598659 : Rat) / 3100914216589) [(0, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 18. -/
theorem ep_Q2_041_partial_18_0407_valid :
    mulPoly ep_Q2_041_coefficient_18_0407
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0408 : Poly :=
[
  term ((-254636887789907401114339726193392263464185407346353597167277519677988789353626489609 : Rat) / 11833874203956612578209702915042921376088392842877018968493843673847481262059712) [(0, 1), (10, 1), (14, 1), (15, 2)]
]

/-- Partial product 408 for generator 18. -/
def ep_Q2_041_partial_18_0408 : Poly :=
[
  term ((-254636887789907401114339726193392263464185407346353597167277519677988789353626489609 : Rat) / 5916937101978306289104851457521460688044196421438509484246921836923740631029856) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((254636887789907401114339726193392263464185407346353597167277519677988789353626489609 : Rat) / 11833874203956612578209702915042921376088392842877018968493843673847481262059712) [(0, 1), (10, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 18. -/
theorem ep_Q2_041_partial_18_0408_valid :
    mulPoly ep_Q2_041_coefficient_18_0408
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0409 : Poly :=
[
  term ((-2916251635687827227739210744031679346071178296634743317733766180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (14, 1), (15, 4)]
]

/-- Partial product 409 for generator 18. -/
def ep_Q2_041_partial_18_0409 : Poly :=
[
  term ((-5832503271375654455478421488063358692142356593269486635467532360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 4)],
  term ((2916251635687827227739210744031679346071178296634743317733766180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 18. -/
theorem ep_Q2_041_partial_18_0409_valid :
    mulPoly ep_Q2_041_coefficient_18_0409
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0410 : Poly :=
[
  term ((-652747919598203 : Rat) / 9302742649767) [(0, 1), (10, 1), (14, 2)]
]

/-- Partial product 410 for generator 18. -/
def ep_Q2_041_partial_18_0410 : Poly :=
[
  term ((-1305495839196406 : Rat) / 9302742649767) [(0, 1), (8, 1), (10, 1), (14, 2)],
  term ((652747919598203 : Rat) / 9302742649767) [(0, 1), (10, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 18. -/
theorem ep_Q2_041_partial_18_0410_valid :
    mulPoly ep_Q2_041_coefficient_18_0410
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0411 : Poly :=
[
  term ((-13555210571479630488708204653254599237343494432162470292815922265 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (14, 2), (15, 2)]
]

/-- Partial product 411 for generator 18. -/
def ep_Q2_041_partial_18_0411 : Poly :=
[
  term ((-13555210571479630488708204653254599237343494432162470292815922265 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (14, 2), (15, 2)],
  term ((13555210571479630488708204653254599237343494432162470292815922265 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 18. -/
theorem ep_Q2_041_partial_18_0411_valid :
    mulPoly ep_Q2_041_coefficient_18_0411
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0412 : Poly :=
[
  term ((25813838989364654876494934857644209176358497612984500988520829765 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (15, 2)]
]

/-- Partial product 412 for generator 18. -/
def ep_Q2_041_partial_18_0412 : Poly :=
[
  term ((25813838989364654876494934857644209176358497612984500988520829765 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-25813838989364654876494934857644209176358497612984500988520829765 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 18. -/
theorem ep_Q2_041_partial_18_0412_valid :
    mulPoly ep_Q2_041_coefficient_18_0412
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0413 : Poly :=
[
  term ((-1250983911892596939572278380052055291923820692720844266769675260 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (15, 4)]
]

/-- Partial product 413 for generator 18. -/
def ep_Q2_041_partial_18_0413 : Poly :=
[
  term ((-2501967823785193879144556760104110583847641385441688533539350520 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (15, 4)],
  term ((1250983911892596939572278380052055291923820692720844266769675260 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 18. -/
theorem ep_Q2_041_partial_18_0413_valid :
    mulPoly ep_Q2_041_coefficient_18_0413
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0414 : Poly :=
[
  term ((-126363160932437 : Rat) / 3100914216589) [(0, 1), (10, 2)]
]

/-- Partial product 414 for generator 18. -/
def ep_Q2_041_partial_18_0414 : Poly :=
[
  term ((-252726321864874 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 2)],
  term ((126363160932437 : Rat) / 3100914216589) [(0, 1), (10, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 18. -/
theorem ep_Q2_041_partial_18_0414_valid :
    mulPoly ep_Q2_041_coefficient_18_0414
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0415 : Poly :=
[
  term ((-180248184640654479588125592065425900457516019014211864006430520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 2), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 415 for generator 18. -/
def ep_Q2_041_partial_18_0415 : Poly :=
[
  term ((-360496369281308959176251184130851800915032038028423728012861040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((180248184640654479588125592065425900457516019014211864006430520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 18. -/
theorem ep_Q2_041_partial_18_0415_valid :
    mulPoly ep_Q2_041_coefficient_18_0415
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0416 : Poly :=
[
  term ((-50353808378875444366778449175858448129528357570935562502808200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 2), (11, 1), (15, 1)]
]

/-- Partial product 416 for generator 18. -/
def ep_Q2_041_partial_18_0416 : Poly :=
[
  term ((-100707616757750888733556898351716896259056715141871125005616400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((50353808378875444366778449175858448129528357570935562502808200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 18. -/
theorem ep_Q2_041_partial_18_0416_valid :
    mulPoly ep_Q2_041_coefficient_18_0416
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0417 : Poly :=
[
  term ((-720992738562617918352502368261703601830064076056847456025722080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 2), (11, 1), (15, 3)]
]

/-- Partial product 417 for generator 18. -/
def ep_Q2_041_partial_18_0417 : Poly :=
[
  term ((-1441985477125235836705004736523407203660128152113694912051444160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 2), (11, 1), (15, 3)],
  term ((720992738562617918352502368261703601830064076056847456025722080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 18. -/
theorem ep_Q2_041_partial_18_0417_valid :
    mulPoly ep_Q2_041_coefficient_18_0417
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0418 : Poly :=
[
  term ((-857299060490614878028737633799372108314559984417441239754740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 2), (12, 1), (15, 2)]
]

/-- Partial product 418 for generator 18. -/
def ep_Q2_041_partial_18_0418 : Poly :=
[
  term ((-1714598120981229756057475267598744216629119968834882479509480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 2), (12, 1), (15, 2)],
  term ((857299060490614878028737633799372108314559984417441239754740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 18. -/
theorem ep_Q2_041_partial_18_0418_valid :
    mulPoly ep_Q2_041_coefficient_18_0418
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0419 : Poly :=
[
  term ((1169188502526449116555416604376029404573188222391553821872370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 419 for generator 18. -/
def ep_Q2_041_partial_18_0419 : Poly :=
[
  term ((2338377005052898233110833208752058809146376444783107643744740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1169188502526449116555416604376029404573188222391553821872370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 18. -/
theorem ep_Q2_041_partial_18_0419_valid :
    mulPoly ep_Q2_041_coefficient_18_0419
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0420 : Poly :=
[
  term ((-87377075297215611512527254300412835696410519332688513987890 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 2), (13, 1), (15, 1)]
]

/-- Partial product 420 for generator 18. -/
def ep_Q2_041_partial_18_0420 : Poly :=
[
  term ((-174754150594431223025054508600825671392821038665377027975780 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((87377075297215611512527254300412835696410519332688513987890 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 18. -/
theorem ep_Q2_041_partial_18_0420_valid :
    mulPoly ep_Q2_041_coefficient_18_0420
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0421 : Poly :=
[
  term ((1247557768143336954106715882306629185034512951896450328470520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 2), (13, 1), (15, 3)]
]

/-- Partial product 421 for generator 18. -/
def ep_Q2_041_partial_18_0421 : Poly :=
[
  term ((2495115536286673908213431764613258370069025903792900656941040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 2), (13, 1), (15, 3)],
  term ((-1247557768143336954106715882306629185034512951896450328470520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 18. -/
theorem ep_Q2_041_partial_18_0421_valid :
    mulPoly ep_Q2_041_coefficient_18_0421
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0422 : Poly :=
[
  term ((-425569048042996 : Rat) / 3100914216589) [(0, 1), (10, 2), (14, 1)]
]

/-- Partial product 422 for generator 18. -/
def ep_Q2_041_partial_18_0422 : Poly :=
[
  term ((-851138096085992 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 2), (14, 1)],
  term ((425569048042996 : Rat) / 3100914216589) [(0, 1), (10, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 18. -/
theorem ep_Q2_041_partial_18_0422_valid :
    mulPoly ep_Q2_041_coefficient_18_0422
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0423 : Poly :=
[
  term ((-1960122350445637808262843804912941463951429830396409975787861825 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 2), (14, 1), (15, 2)]
]

/-- Partial product 423 for generator 18. -/
def ep_Q2_041_partial_18_0423 : Poly :=
[
  term ((-1960122350445637808262843804912941463951429830396409975787861825 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 2), (14, 1), (15, 2)],
  term ((1960122350445637808262843804912941463951429830396409975787861825 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 18. -/
theorem ep_Q2_041_partial_18_0423_valid :
    mulPoly ep_Q2_041_coefficient_18_0423
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0424 : Poly :=
[
  term ((-3527615565851994382616037428263749773186236741026925833276764329 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (10, 2), (15, 2)]
]

/-- Partial product 424 for generator 18. -/
def ep_Q2_041_partial_18_0424 : Poly :=
[
  term ((-7055231131703988765232074856527499546372473482053851666553528658 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (10, 2), (15, 2)],
  term ((3527615565851994382616037428263749773186236741026925833276764329 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (10, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 18. -/
theorem ep_Q2_041_partial_18_0424_valid :
    mulPoly ep_Q2_041_coefficient_18_0424
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0425 : Poly :=
[
  term ((3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 2), (15, 4)]
]

/-- Partial product 425 for generator 18. -/
def ep_Q2_041_partial_18_0425 : Poly :=
[
  term ((7629283720375162130377807794679164040968519413456710175789483310 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 2), (15, 4)],
  term ((-3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 18. -/
theorem ep_Q2_041_partial_18_0425_valid :
    mulPoly ep_Q2_041_coefficient_18_0425
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0426 : Poly :=
[
  term ((58932776982937 : Rat) / 3100914216589) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 426 for generator 18. -/
def ep_Q2_041_partial_18_0426 : Poly :=
[
  term ((117865553965874 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-58932776982937 : Rat) / 3100914216589) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 18. -/
theorem ep_Q2_041_partial_18_0426_valid :
    mulPoly ep_Q2_041_coefficient_18_0426
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0427 : Poly :=
[
  term ((-867644819483466738232264443180620371772310504306872483456204140 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 427 for generator 18. -/
def ep_Q2_041_partial_18_0427 : Poly :=
[
  term ((-1735289638966933476464528886361240743544621008613744966912408280 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((867644819483466738232264443180620371772310504306872483456204140 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 18. -/
theorem ep_Q2_041_partial_18_0427_valid :
    mulPoly ep_Q2_041_coefficient_18_0427
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0428 : Poly :=
[
  term ((-3943280705293898682837184952282002771213513803947495188889821165 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 428 for generator 18. -/
def ep_Q2_041_partial_18_0428 : Poly :=
[
  term ((-3943280705293898682837184952282002771213513803947495188889821165 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((3943280705293898682837184952282002771213513803947495188889821165 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 18. -/
theorem ep_Q2_041_partial_18_0428_valid :
    mulPoly ep_Q2_041_coefficient_18_0428
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0429 : Poly :=
[
  term ((-2962949699340425266003450220478244314456968260754069530117485 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 429 for generator 18. -/
def ep_Q2_041_partial_18_0429 : Poly :=
[
  term ((-5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((2962949699340425266003450220478244314456968260754069530117485 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 18. -/
theorem ep_Q2_041_partial_18_0429_valid :
    mulPoly ep_Q2_041_coefficient_18_0429
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0430 : Poly :=
[
  term ((-681103268423462708395156147990444700885652294228703136431465972 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 430 for generator 18. -/
def ep_Q2_041_partial_18_0430 : Poly :=
[
  term ((-1362206536846925416790312295980889401771304588457406272862931944 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((681103268423462708395156147990444700885652294228703136431465972 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 18. -/
theorem ep_Q2_041_partial_18_0430_valid :
    mulPoly ep_Q2_041_coefficient_18_0430
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0431 : Poly :=
[
  term ((54673083086247944022049273140746809727945279314411824122056410 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 3)]
]

/-- Partial product 431 for generator 18. -/
def ep_Q2_041_partial_18_0431 : Poly :=
[
  term ((109346166172495888044098546281493619455890558628823648244112820 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-54673083086247944022049273140746809727945279314411824122056410 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 18. -/
theorem ep_Q2_041_partial_18_0431_valid :
    mulPoly ep_Q2_041_coefficient_18_0431
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0432 : Poly :=
[
  term ((207520168864111131872787125765801694918626081942543978201312320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 432 for generator 18. -/
def ep_Q2_041_partial_18_0432 : Poly :=
[
  term ((415040337728222263745574251531603389837252163885087956402624640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-207520168864111131872787125765801694918626081942543978201312320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 18. -/
theorem ep_Q2_041_partial_18_0432_valid :
    mulPoly ep_Q2_041_coefficient_18_0432
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0433 : Poly :=
[
  term ((20836538211967847333331107617204366820778441468640161438701880816 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 433 for generator 18. -/
def ep_Q2_041_partial_18_0433 : Poly :=
[
  term ((41673076423935694666662215234408733641556882937280322877403761632 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((-20836538211967847333331107617204366820778441468640161438701880816 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 18. -/
theorem ep_Q2_041_partial_18_0433_valid :
    mulPoly ep_Q2_041_coefficient_18_0433
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0434 : Poly :=
[
  term ((29954800151798009919156471749372815376342520997985746937050925645 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (11, 1), (12, 1), (15, 3)]
]

/-- Partial product 434 for generator 18. -/
def ep_Q2_041_partial_18_0434 : Poly :=
[
  term ((29954800151798009919156471749372815376342520997985746937050925645 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 3)],
  term ((-29954800151798009919156471749372815376342520997985746937050925645 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (11, 1), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 18. -/
theorem ep_Q2_041_partial_18_0434_valid :
    mulPoly ep_Q2_041_coefficient_18_0434
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0435 : Poly :=
[
  term ((3231016256515474647586846496700412203897114058026693941297895 : Rat) / 24968999369794078182185386646329743778773584398998481017611) [(0, 1), (11, 1), (12, 2), (15, 1)]
]

/-- Partial product 435 for generator 18. -/
def ep_Q2_041_partial_18_0435 : Poly :=
[
  term ((6462032513030949295173692993400824407794228116053387882595790 : Rat) / 24968999369794078182185386646329743778773584398998481017611) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((-3231016256515474647586846496700412203897114058026693941297895 : Rat) / 24968999369794078182185386646329743778773584398998481017611) [(0, 1), (11, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 18. -/
theorem ep_Q2_041_partial_18_0435_valid :
    mulPoly ep_Q2_041_coefficient_18_0435
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0436 : Poly :=
[
  term ((257697286678016160419233174761336341587810631990795703226342640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (12, 2), (15, 3)]
]

/-- Partial product 436 for generator 18. -/
def ep_Q2_041_partial_18_0436 : Poly :=
[
  term ((515394573356032320838466349522672683175621263981591406452685280 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 3)],
  term ((-257697286678016160419233174761336341587810631990795703226342640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (12, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 18. -/
theorem ep_Q2_041_partial_18_0436_valid :
    mulPoly ep_Q2_041_coefficient_18_0436
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0437 : Poly :=
[
  term ((313792499354763 : Rat) / 3100914216589) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 437 for generator 18. -/
def ep_Q2_041_partial_18_0437 : Poly :=
[
  term ((627584998709526 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-313792499354763 : Rat) / 3100914216589) [(0, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 18. -/
theorem ep_Q2_041_partial_18_0437_valid :
    mulPoly ep_Q2_041_coefficient_18_0437
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0438 : Poly :=
[
  term ((-1208967296100278 : Rat) / 3100914216589) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 438 for generator 18. -/
def ep_Q2_041_partial_18_0438 : Poly :=
[
  term ((-2417934592200556 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((1208967296100278 : Rat) / 3100914216589) [(0, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 18. -/
theorem ep_Q2_041_partial_18_0438_valid :
    mulPoly ep_Q2_041_coefficient_18_0438
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0439 : Poly :=
[
  term ((-393712971492087898664634506229176997411464271547780818158204175 : Rat) / 2064525365613859730202973994605390966619608269547570607683988) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 439 for generator 18. -/
def ep_Q2_041_partial_18_0439 : Poly :=
[
  term ((-393712971492087898664634506229176997411464271547780818158204175 : Rat) / 1032262682806929865101486997302695483309804134773785303841994) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((393712971492087898664634506229176997411464271547780818158204175 : Rat) / 2064525365613859730202973994605390966619608269547570607683988) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 18. -/
theorem ep_Q2_041_partial_18_0439_valid :
    mulPoly ep_Q2_041_coefficient_18_0439
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0440 : Poly :=
[
  term ((1933239326735288 : Rat) / 3100914216589) [(0, 1), (11, 1), (13, 1), (14, 2)]
]

/-- Partial product 440 for generator 18. -/
def ep_Q2_041_partial_18_0440 : Poly :=
[
  term ((3866478653470576 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1933239326735288 : Rat) / 3100914216589) [(0, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 18. -/
theorem ep_Q2_041_partial_18_0440_valid :
    mulPoly ep_Q2_041_coefficient_18_0440
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0441 : Poly :=
[
  term ((-6256797956970225123275448972230160667271819807546831534616486660 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 441 for generator 18. -/
def ep_Q2_041_partial_18_0441 : Poly :=
[
  term ((-12513595913940450246550897944460321334543639615093663069232973320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((6256797956970225123275448972230160667271819807546831534616486660 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 18. -/
theorem ep_Q2_041_partial_18_0441_valid :
    mulPoly ep_Q2_041_coefficient_18_0441
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0442 : Poly :=
[
  term ((669913632752806326186646749307276296909572125721046636671709895 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (11, 1), (13, 1), (15, 2)]
]

/-- Partial product 442 for generator 18. -/
def ep_Q2_041_partial_18_0442 : Poly :=
[
  term ((669913632752806326186646749307276296909572125721046636671709895 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((-669913632752806326186646749307276296909572125721046636671709895 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 18. -/
theorem ep_Q2_041_partial_18_0442_valid :
    mulPoly ep_Q2_041_coefficient_18_0442
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0443 : Poly :=
[
  term ((748619817901495204623762278008586467236317734206454116019233550 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 443 for generator 18. -/
def ep_Q2_041_partial_18_0443 : Poly :=
[
  term ((1497239635802990409247524556017172934472635468412908232038467100 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-748619817901495204623762278008586467236317734206454116019233550 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 18. -/
theorem ep_Q2_041_partial_18_0443_valid :
    mulPoly ep_Q2_041_coefficient_18_0443
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0444 : Poly :=
[
  term ((1546239637797024961870121538090409233552901842714362751746986760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (13, 2), (14, 2), (15, 1)]
]

/-- Partial product 444 for generator 18. -/
def ep_Q2_041_partial_18_0444 : Poly :=
[
  term ((3092479275594049923740243076180818467105803685428725503493973520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-1546239637797024961870121538090409233552901842714362751746986760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 18. -/
theorem ep_Q2_041_partial_18_0444_valid :
    mulPoly ep_Q2_041_coefficient_18_0444
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0445 : Poly :=
[
  term ((-27114385025248619341135654436525205374651897317876710825458790 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (11, 1), (13, 2), (15, 1)]
]

/-- Partial product 445 for generator 18. -/
def ep_Q2_041_partial_18_0445 : Poly :=
[
  term ((-54228770050497238682271308873050410749303794635753421650917580 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((27114385025248619341135654436525205374651897317876710825458790 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 18. -/
theorem ep_Q2_041_partial_18_0445_valid :
    mulPoly ep_Q2_041_coefficient_18_0445
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0446 : Poly :=
[
  term ((726147785200684474931109421972883145641501916193033411682127521671 : Rat) / 244646255825242378029052418360738829544423579941387117010552578) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 446 for generator 18. -/
def ep_Q2_041_partial_18_0446 : Poly :=
[
  term ((726147785200684474931109421972883145641501916193033411682127521671 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-726147785200684474931109421972883145641501916193033411682127521671 : Rat) / 244646255825242378029052418360738829544423579941387117010552578) [(0, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 18. -/
theorem ep_Q2_041_partial_18_0446_valid :
    mulPoly ep_Q2_041_coefficient_18_0446
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0447 : Poly :=
[
  term ((-389656840052623898477702721702560604811305454554038877413360121575 : Rat) / 489292511650484756058104836721477659088847159882774234021105156) [(0, 1), (11, 1), (14, 1), (15, 3)]
]

/-- Partial product 447 for generator 18. -/
def ep_Q2_041_partial_18_0447 : Poly :=
[
  term ((-389656840052623898477702721702560604811305454554038877413360121575 : Rat) / 244646255825242378029052418360738829544423579941387117010552578) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((389656840052623898477702721702560604811305454554038877413360121575 : Rat) / 489292511650484756058104836721477659088847159882774234021105156) [(0, 1), (11, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 18. -/
theorem ep_Q2_041_partial_18_0447_valid :
    mulPoly ep_Q2_041_coefficient_18_0447
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0448 : Poly :=
[
  term ((-98200970453721957734266331722150814032190458988084284108078866896 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 1), (14, 2), (15, 1)]
]

/-- Partial product 448 for generator 18. -/
def ep_Q2_041_partial_18_0448 : Poly :=
[
  term ((-196401940907443915468532663444301628064380917976168568216157733792 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((98200970453721957734266331722150814032190458988084284108078866896 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 18. -/
theorem ep_Q2_041_partial_18_0448_valid :
    mulPoly ep_Q2_041_coefficient_18_0448
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0449 : Poly :=
[
  term ((2916251635687827227739210744031679346071178296634743317733766180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 1), (14, 2), (15, 3)]
]

/-- Partial product 449 for generator 18. -/
def ep_Q2_041_partial_18_0449 : Poly :=
[
  term ((5832503271375654455478421488063358692142356593269486635467532360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 3)],
  term ((-2916251635687827227739210744031679346071178296634743317733766180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 1), (14, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 18. -/
theorem ep_Q2_041_partial_18_0449_valid :
    mulPoly ep_Q2_041_coefficient_18_0449
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0450 : Poly :=
[
  term ((-176162056456806955781325786129439152194586433278392420575334350 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(0, 1), (11, 1), (14, 3), (15, 1)]
]

/-- Partial product 450 for generator 18. -/
def ep_Q2_041_partial_18_0450 : Poly :=
[
  term ((-352324112913613911562651572258878304389172866556784841150668700 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(0, 1), (8, 1), (11, 1), (14, 3), (15, 1)],
  term ((176162056456806955781325786129439152194586433278392420575334350 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(0, 1), (11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 18. -/
theorem ep_Q2_041_partial_18_0450_valid :
    mulPoly ep_Q2_041_coefficient_18_0450
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0451 : Poly :=
[
  term ((-59414501688200955148881706455384010467700459881527238130533272423 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 451 for generator 18. -/
def ep_Q2_041_partial_18_0451 : Poly :=
[
  term ((-59414501688200955148881706455384010467700459881527238130533272423 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((59414501688200955148881706455384010467700459881527238130533272423 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 18. -/
theorem ep_Q2_041_partial_18_0451_valid :
    mulPoly ep_Q2_041_coefficient_18_0451
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0452 : Poly :=
[
  term ((12135630042240587625094109059107469148621570017915561610258448005 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (11, 1), (15, 3)]
]

/-- Partial product 452 for generator 18. -/
def ep_Q2_041_partial_18_0452 : Poly :=
[
  term ((12135630042240587625094109059107469148621570017915561610258448005 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 1), (15, 3)],
  term ((-12135630042240587625094109059107469148621570017915561610258448005 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 18. -/
theorem ep_Q2_041_partial_18_0452_valid :
    mulPoly ep_Q2_041_coefficient_18_0452
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0453 : Poly :=
[
  term ((-126363160932437 : Rat) / 3100914216589) [(0, 1), (11, 2)]
]

/-- Partial product 453 for generator 18. -/
def ep_Q2_041_partial_18_0453 : Poly :=
[
  term ((-252726321864874 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2)],
  term ((126363160932437 : Rat) / 3100914216589) [(0, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 18. -/
theorem ep_Q2_041_partial_18_0453_valid :
    mulPoly ep_Q2_041_coefficient_18_0453
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0454 : Poly :=
[
  term ((-74653192572101 : Rat) / 3100914216589) [(0, 1), (11, 2), (12, 1)]
]

/-- Partial product 454 for generator 18. -/
def ep_Q2_041_partial_18_0454 : Poly :=
[
  term ((-149306385144202 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2), (12, 1)],
  term ((74653192572101 : Rat) / 3100914216589) [(0, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 18. -/
theorem ep_Q2_041_partial_18_0454_valid :
    mulPoly ep_Q2_041_coefficient_18_0454
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0455 : Poly :=
[
  term ((59959496755760223489506530604511935542740209172409196274312260 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 455 for generator 18. -/
def ep_Q2_041_partial_18_0455 : Poly :=
[
  term ((119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-59959496755760223489506530604511935542740209172409196274312260 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 18. -/
theorem ep_Q2_041_partial_18_0455_valid :
    mulPoly ep_Q2_041_coefficient_18_0455
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0456 : Poly :=
[
  term ((-812115581601939447063565796294944996306590586506202516257643440 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 2), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 456 for generator 18. -/
def ep_Q2_041_partial_18_0456 : Poly :=
[
  term ((-1624231163203878894127131592589889992613181173012405032515286880 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((812115581601939447063565796294944996306590586506202516257643440 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 2), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 18. -/
theorem ep_Q2_041_partial_18_0456_valid :
    mulPoly ep_Q2_041_coefficient_18_0456
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0457 : Poly :=
[
  term ((9049604583702043590456390387933474661455990762767829156392950675 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (11, 2), (12, 1), (15, 2)]
]

/-- Partial product 457 for generator 18. -/
def ep_Q2_041_partial_18_0457 : Poly :=
[
  term ((9049604583702043590456390387933474661455990762767829156392950675 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-9049604583702043590456390387933474661455990762767829156392950675 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (11, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 18. -/
theorem ep_Q2_041_partial_18_0457_valid :
    mulPoly ep_Q2_041_coefficient_18_0457
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0458 : Poly :=
[
  term ((-480251884931086081980483565261286393012865573770858803467500080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 458 for generator 18. -/
def ep_Q2_041_partial_18_0458 : Poly :=
[
  term ((-960503769862172163960967130522572786025731147541717606935000160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((480251884931086081980483565261286393012865573770858803467500080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 18. -/
theorem ep_Q2_041_partial_18_0458_valid :
    mulPoly ep_Q2_041_coefficient_18_0458
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0459 : Poly :=
[
  term ((670834658262222172479970228579120959753356273016385307109565480 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 2), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 459 for generator 18. -/
def ep_Q2_041_partial_18_0459 : Poly :=
[
  term ((1341669316524444344959940457158241919506712546032770614219130960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-670834658262222172479970228579120959753356273016385307109565480 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 2), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 18. -/
theorem ep_Q2_041_partial_18_0459_valid :
    mulPoly ep_Q2_041_coefficient_18_0459
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0460 : Poly :=
[
  term ((270784599500205764369703294577764734431581095988992401007403315 : Rat) / 3545597910510759101870324903778823616585848984657784304500762) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

/-- Partial product 460 for generator 18. -/
def ep_Q2_041_partial_18_0460 : Poly :=
[
  term ((270784599500205764369703294577764734431581095988992401007403315 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((-270784599500205764369703294577764734431581095988992401007403315 : Rat) / 3545597910510759101870324903778823616585848984657784304500762) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 18. -/
theorem ep_Q2_041_partial_18_0460_valid :
    mulPoly ep_Q2_041_coefficient_18_0460
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0461 : Poly :=
[
  term ((56246403974618 : Rat) / 3100914216589) [(0, 1), (11, 2), (14, 1)]
]

/-- Partial product 461 for generator 18. -/
def ep_Q2_041_partial_18_0461 : Poly :=
[
  term ((112492807949236 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2), (14, 1)],
  term ((-56246403974618 : Rat) / 3100914216589) [(0, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 18. -/
theorem ep_Q2_041_partial_18_0461_valid :
    mulPoly ep_Q2_041_coefficient_18_0461
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0462 : Poly :=
[
  term ((42036863495643217479770915986494493238042729299372797509462696245 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(0, 1), (11, 2), (14, 1), (15, 2)]
]

/-- Partial product 462 for generator 18. -/
def ep_Q2_041_partial_18_0462 : Poly :=
[
  term ((84073726991286434959541831972988986476085458598745595018925392490 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(0, 1), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((-42036863495643217479770915986494493238042729299372797509462696245 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(0, 1), (11, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 18. -/
theorem ep_Q2_041_partial_18_0462_valid :
    mulPoly ep_Q2_041_coefficient_18_0462
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0463 : Poly :=
[
  term ((-1403663421883580 : Rat) / 3100914216589) [(0, 1), (11, 2), (14, 2)]
]

/-- Partial product 463 for generator 18. -/
def ep_Q2_041_partial_18_0463 : Poly :=
[
  term ((-2807326843767160 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2), (14, 2)],
  term ((1403663421883580 : Rat) / 3100914216589) [(0, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 18. -/
theorem ep_Q2_041_partial_18_0463_valid :
    mulPoly ep_Q2_041_coefficient_18_0463
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0464 : Poly :=
[
  term ((-10727801899480418001736814049561194961479575906452934951713388255 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 2), (14, 2), (15, 2)]
]

/-- Partial product 464 for generator 18. -/
def ep_Q2_041_partial_18_0464 : Poly :=
[
  term ((-21455603798960836003473628099122389922959151812905869903426776510 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 2), (14, 2), (15, 2)],
  term ((10727801899480418001736814049561194961479575906452934951713388255 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 18. -/
theorem ep_Q2_041_partial_18_0464_valid :
    mulPoly ep_Q2_041_coefficient_18_0464
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0465 : Poly :=
[
  term ((-5865113300147345714556069732362918577616231555125057552965966195 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 2), (15, 2)]
]

/-- Partial product 465 for generator 18. -/
def ep_Q2_041_partial_18_0465 : Poly :=
[
  term ((-11730226600294691429112139464725837155232463110250115105931932390 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 2), (15, 2)],
  term ((5865113300147345714556069732362918577616231555125057552965966195 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 18. -/
theorem ep_Q2_041_partial_18_0465_valid :
    mulPoly ep_Q2_041_coefficient_18_0465
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0466 : Poly :=
[
  term ((-43264345384472584433628894741758362390208943750521340912153580 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 3), (12, 1), (15, 1)]
]

/-- Partial product 466 for generator 18. -/
def ep_Q2_041_partial_18_0466 : Poly :=
[
  term ((-86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (12, 1), (15, 1)],
  term ((43264345384472584433628894741758362390208943750521340912153580 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 18. -/
theorem ep_Q2_041_partial_18_0466_valid :
    mulPoly ep_Q2_041_coefficient_18_0466
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0467 : Poly :=
[
  term ((676341660389253415316361215127709235666398108995009040258840 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 3), (14, 1), (15, 1)]
]

/-- Partial product 467 for generator 18. -/
def ep_Q2_041_partial_18_0467 : Poly :=
[
  term ((1352683320778506830632722430255418471332796217990018080517680 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (14, 1), (15, 1)],
  term ((-676341660389253415316361215127709235666398108995009040258840 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 18. -/
theorem ep_Q2_041_partial_18_0467_valid :
    mulPoly ep_Q2_041_coefficient_18_0467
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0468 : Poly :=
[
  term ((-547935357024727580617986789294670152269228301054762092377107760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 3), (14, 2), (15, 1)]
]

/-- Partial product 468 for generator 18. -/
def ep_Q2_041_partial_18_0468 : Poly :=
[
  term ((-1095870714049455161235973578589340304538456602109524184754215520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (14, 2), (15, 1)],
  term ((547935357024727580617986789294670152269228301054762092377107760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 18. -/
theorem ep_Q2_041_partial_18_0468_valid :
    mulPoly ep_Q2_041_coefficient_18_0468
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0469 : Poly :=
[
  term ((-50353808378875444366778449175858448129528357570935562502808200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 3), (15, 1)]
]

/-- Partial product 469 for generator 18. -/
def ep_Q2_041_partial_18_0469 : Poly :=
[
  term ((-100707616757750888733556898351716896259056715141871125005616400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (15, 1)],
  term ((50353808378875444366778449175858448129528357570935562502808200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 18. -/
theorem ep_Q2_041_partial_18_0469_valid :
    mulPoly ep_Q2_041_coefficient_18_0469
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0470 : Poly :=
[
  term ((706877595001006 : Rat) / 3100914216589) [(0, 1), (12, 1)]
]

/-- Partial product 470 for generator 18. -/
def ep_Q2_041_partial_18_0470 : Poly :=
[
  term ((1413755190002012 : Rat) / 3100914216589) [(0, 1), (8, 1), (12, 1)],
  term ((-706877595001006 : Rat) / 3100914216589) [(0, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 18. -/
theorem ep_Q2_041_partial_18_0470_valid :
    mulPoly ep_Q2_041_coefficient_18_0470
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0471 : Poly :=
[
  term ((-4036257787637916201587830712732277749574649172118227189658925687 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 471 for generator 18. -/
def ep_Q2_041_partial_18_0471 : Poly :=
[
  term ((-4036257787637916201587830712732277749574649172118227189658925687 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4036257787637916201587830712732277749574649172118227189658925687 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 18. -/
theorem ep_Q2_041_partial_18_0471_valid :
    mulPoly ep_Q2_041_coefficient_18_0471
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0472 : Poly :=
[
  term ((2732061734416681241567840862674017763783828666323084065594411090 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 472 for generator 18. -/
def ep_Q2_041_partial_18_0472 : Poly :=
[
  term ((5464123468833362483135681725348035527567657332646168131188822180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-2732061734416681241567840862674017763783828666323084065594411090 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 18. -/
theorem ep_Q2_041_partial_18_0472_valid :
    mulPoly ep_Q2_041_coefficient_18_0472
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0473 : Poly :=
[
  term ((1426605410793538091038698254304339855108910644066774218204715 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 473 for generator 18. -/
def ep_Q2_041_partial_18_0473 : Poly :=
[
  term ((2853210821587076182077396508608679710217821288133548436409430 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-1426605410793538091038698254304339855108910644066774218204715 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 18. -/
theorem ep_Q2_041_partial_18_0473_valid :
    mulPoly ep_Q2_041_coefficient_18_0473
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0474 : Poly :=
[
  term ((-187103552810899089581067587914203012304075273772004936454253745487 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 474 for generator 18. -/
def ep_Q2_041_partial_18_0474 : Poly :=
[
  term ((-187103552810899089581067587914203012304075273772004936454253745487 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((187103552810899089581067587914203012304075273772004936454253745487 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 18. -/
theorem ep_Q2_041_partial_18_0474_valid :
    mulPoly ep_Q2_041_coefficient_18_0474
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0475 : Poly :=
[
  term ((44412271665585293918290079685019110485279863365658131822038710935 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (12, 1), (13, 1), (15, 3)]
]

/-- Partial product 475 for generator 18. -/
def ep_Q2_041_partial_18_0475 : Poly :=
[
  term ((44412271665585293918290079685019110485279863365658131822038710935 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((-44412271665585293918290079685019110485279863365658131822038710935 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (12, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 18. -/
theorem ep_Q2_041_partial_18_0475_valid :
    mulPoly ep_Q2_041_coefficient_18_0475
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0476 : Poly :=
[
  term ((11412843286348304728309586034434718840871285152534193745637720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (12, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 476 for generator 18. -/
def ep_Q2_041_partial_18_0476 : Poly :=
[
  term ((22825686572696609456619172068869437681742570305068387491275440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-11412843286348304728309586034434718840871285152534193745637720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (12, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 18. -/
theorem ep_Q2_041_partial_18_0476_valid :
    mulPoly ep_Q2_041_coefficient_18_0476
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0477 : Poly :=
[
  term ((-5550476922156235244891453531929030772306328457280040581760045 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (12, 1), (13, 2), (15, 2)]
]

/-- Partial product 477 for generator 18. -/
def ep_Q2_041_partial_18_0477 : Poly :=
[
  term ((-11100953844312470489782907063858061544612656914560081163520090 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((5550476922156235244891453531929030772306328457280040581760045 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (12, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 18. -/
theorem ep_Q2_041_partial_18_0477_valid :
    mulPoly ep_Q2_041_coefficient_18_0477
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0478 : Poly :=
[
  term ((-1437583489020107 : Rat) / 3100914216589) [(0, 1), (12, 1), (14, 1)]
]

/-- Partial product 478 for generator 18. -/
def ep_Q2_041_partial_18_0478 : Poly :=
[
  term ((-2875166978040214 : Rat) / 3100914216589) [(0, 1), (8, 1), (12, 1), (14, 1)],
  term ((1437583489020107 : Rat) / 3100914216589) [(0, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 18. -/
theorem ep_Q2_041_partial_18_0478_valid :
    mulPoly ep_Q2_041_coefficient_18_0478
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0479 : Poly :=
[
  term ((5579343607453098101278417369797730897317332290436683484085924805 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 479 for generator 18. -/
def ep_Q2_041_partial_18_0479 : Poly :=
[
  term ((5579343607453098101278417369797730897317332290436683484085924805 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-5579343607453098101278417369797730897317332290436683484085924805 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (12, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 18. -/
theorem ep_Q2_041_partial_18_0479_valid :
    mulPoly ep_Q2_041_coefficient_18_0479
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0480 : Poly :=
[
  term ((-12697032642151 : Rat) / 442987745227) [(0, 1), (12, 1), (14, 2)]
]

/-- Partial product 480 for generator 18. -/
def ep_Q2_041_partial_18_0480 : Poly :=
[
  term ((-25394065284302 : Rat) / 442987745227) [(0, 1), (8, 1), (12, 1), (14, 2)],
  term ((12697032642151 : Rat) / 442987745227) [(0, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 18. -/
theorem ep_Q2_041_partial_18_0480_valid :
    mulPoly ep_Q2_041_coefficient_18_0480
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0481 : Poly :=
[
  term ((3531191866699744602226578639125397541518719626862856654523580465 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (12, 1), (14, 2), (15, 2)]
]

/-- Partial product 481 for generator 18. -/
def ep_Q2_041_partial_18_0481 : Poly :=
[
  term ((3531191866699744602226578639125397541518719626862856654523580465 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((-3531191866699744602226578639125397541518719626862856654523580465 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (12, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 18. -/
theorem ep_Q2_041_partial_18_0481_valid :
    mulPoly ep_Q2_041_coefficient_18_0481
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0482 : Poly :=
[
  term ((174366633121167868132796654734455190022626327244137161829518671875 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (12, 1), (15, 2)]
]

/-- Partial product 482 for generator 18. -/
def ep_Q2_041_partial_18_0482 : Poly :=
[
  term ((174366633121167868132796654734455190022626327244137161829518671875 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-174366633121167868132796654734455190022626327244137161829518671875 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 18. -/
theorem ep_Q2_041_partial_18_0482_valid :
    mulPoly ep_Q2_041_coefficient_18_0482
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0483 : Poly :=
[
  term ((-2899265449492054825602968201594273565081563496615947530414542245 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (12, 1), (15, 4)]
]

/-- Partial product 483 for generator 18. -/
def ep_Q2_041_partial_18_0483 : Poly :=
[
  term ((-2899265449492054825602968201594273565081563496615947530414542245 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (12, 1), (15, 4)],
  term ((2899265449492054825602968201594273565081563496615947530414542245 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (12, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 18. -/
theorem ep_Q2_041_partial_18_0483_valid :
    mulPoly ep_Q2_041_coefficient_18_0483
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0484 : Poly :=
[
  term ((1223492656863191 : Rat) / 6201828433178) [(0, 1), (12, 2)]
]

/-- Partial product 484 for generator 18. -/
def ep_Q2_041_partial_18_0484 : Poly :=
[
  term ((1223492656863191 : Rat) / 3100914216589) [(0, 1), (8, 1), (12, 2)],
  term ((-1223492656863191 : Rat) / 6201828433178) [(0, 1), (12, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 18. -/
theorem ep_Q2_041_partial_18_0484_valid :
    mulPoly ep_Q2_041_coefficient_18_0484
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0485 : Poly :=
[
  term ((-791275065905727605151018869796334251619112381526915254631765 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 485 for generator 18. -/
def ep_Q2_041_partial_18_0485 : Poly :=
[
  term ((-791275065905727605151018869796334251619112381526915254631765 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((791275065905727605151018869796334251619112381526915254631765 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 18. -/
theorem ep_Q2_041_partial_18_0485_valid :
    mulPoly ep_Q2_041_coefficient_18_0485
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0486 : Poly :=
[
  term ((-5706421643174152364154793017217359420435642576267096872818860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (12, 2), (13, 1), (15, 3)]
]

/-- Partial product 486 for generator 18. -/
def ep_Q2_041_partial_18_0486 : Poly :=
[
  term ((-11412843286348304728309586034434718840871285152534193745637720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 2), (13, 1), (15, 3)],
  term ((5706421643174152364154793017217359420435642576267096872818860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (12, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 18. -/
theorem ep_Q2_041_partial_18_0486_valid :
    mulPoly ep_Q2_041_coefficient_18_0486
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0487 : Poly :=
[
  term ((1511330471460740725399986700849865813157564012608215931207280579 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (12, 2), (15, 2)]
]

/-- Partial product 487 for generator 18. -/
def ep_Q2_041_partial_18_0487 : Poly :=
[
  term ((1511330471460740725399986700849865813157564012608215931207280579 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (12, 2), (15, 2)],
  term ((-1511330471460740725399986700849865813157564012608215931207280579 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 18. -/
theorem ep_Q2_041_partial_18_0487_valid :
    mulPoly ep_Q2_041_coefficient_18_0487
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0488 : Poly :=
[
  term ((-1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (12, 2), (15, 4)]
]

/-- Partial product 488 for generator 18. -/
def ep_Q2_041_partial_18_0488 : Poly :=
[
  term ((-2732061734416681241567840862674017763783828666323084065594411090 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (12, 2), (15, 4)],
  term ((1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (12, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 18. -/
theorem ep_Q2_041_partial_18_0488_valid :
    mulPoly ep_Q2_041_coefficient_18_0488
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0489 : Poly :=
[
  term ((39658780117243635714763883889419655888743311990030104808232817443418944030817412865 : Rat) / 28927248054116164080068162681216030030438293615921601922984951202738287529479296) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 489 for generator 18. -/
def ep_Q2_041_partial_18_0489 : Poly :=
[
  term ((39658780117243635714763883889419655888743311990030104808232817443418944030817412865 : Rat) / 14463624027058082040034081340608015015219146807960800961492475601369143764739648) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((-39658780117243635714763883889419655888743311990030104808232817443418944030817412865 : Rat) / 28927248054116164080068162681216030030438293615921601922984951202738287529479296) [(0, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 18. -/
theorem ep_Q2_041_partial_18_0489_valid :
    mulPoly ep_Q2_041_coefficient_18_0489
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0490 : Poly :=
[
  term ((1745130781204420595880294270622313493559876558204443340629123865 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 490 for generator 18. -/
def ep_Q2_041_partial_18_0490 : Poly :=
[
  term ((1745130781204420595880294270622313493559876558204443340629123865 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1745130781204420595880294270622313493559876558204443340629123865 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 18. -/
theorem ep_Q2_041_partial_18_0490_valid :
    mulPoly ep_Q2_041_coefficient_18_0490
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0491 : Poly :=
[
  term ((5605613691798352769761539533313495903376745582698171875915585 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 491 for generator 18. -/
def ep_Q2_041_partial_18_0491 : Poly :=
[
  term ((11211227383596705539523079066626991806753491165396343751831170 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5605613691798352769761539533313495903376745582698171875915585 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 18. -/
theorem ep_Q2_041_partial_18_0491_valid :
    mulPoly ep_Q2_041_coefficient_18_0491
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0492 : Poly :=
[
  term ((-1901631084532913319156887308480284741153139515315705090069985 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (13, 1), (14, 3), (15, 1)]
]

/-- Partial product 492 for generator 18. -/
def ep_Q2_041_partial_18_0492 : Poly :=
[
  term ((-3803262169065826638313774616960569482306279030631410180139970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (13, 1), (14, 3), (15, 1)],
  term ((1901631084532913319156887308480284741153139515315705090069985 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (13, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 18. -/
theorem ep_Q2_041_partial_18_0492_valid :
    mulPoly ep_Q2_041_coefficient_18_0492
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0493 : Poly :=
[
  term ((3197609791305865376733785606993565370505032020973968311565890269 : Rat) / 14182391642043036407481299615115294466343395938631137218003048) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 493 for generator 18. -/
def ep_Q2_041_partial_18_0493 : Poly :=
[
  term ((3197609791305865376733785606993565370505032020973968311565890269 : Rat) / 7091195821021518203740649807557647233171697969315568609001524) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-3197609791305865376733785606993565370505032020973968311565890269 : Rat) / 14182391642043036407481299615115294466343395938631137218003048) [(0, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 18. -/
theorem ep_Q2_041_partial_18_0493_valid :
    mulPoly ep_Q2_041_coefficient_18_0493
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0494 : Poly :=
[
  term ((-387718044410126696308363916713325891549201967310514045952051455 : Rat) / 7091195821021518203740649807557647233171697969315568609001524) [(0, 1), (13, 1), (15, 3)]
]

/-- Partial product 494 for generator 18. -/
def ep_Q2_041_partial_18_0494 : Poly :=
[
  term ((-387718044410126696308363916713325891549201967310514045952051455 : Rat) / 3545597910510759101870324903778823616585848984657784304500762) [(0, 1), (8, 1), (13, 1), (15, 3)],
  term ((387718044410126696308363916713325891549201967310514045952051455 : Rat) / 7091195821021518203740649807557647233171697969315568609001524) [(0, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 18. -/
theorem ep_Q2_041_partial_18_0494_valid :
    mulPoly ep_Q2_041_coefficient_18_0494
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0495 : Poly :=
[
  term ((-1045734199873077 : Rat) / 6201828433178) [(0, 1), (13, 2)]
]

/-- Partial product 495 for generator 18. -/
def ep_Q2_041_partial_18_0495 : Poly :=
[
  term ((-1045734199873077 : Rat) / 3100914216589) [(0, 1), (8, 1), (13, 2)],
  term ((1045734199873077 : Rat) / 6201828433178) [(0, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 18. -/
theorem ep_Q2_041_partial_18_0495_valid :
    mulPoly ep_Q2_041_coefficient_18_0495
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0496 : Poly :=
[
  term ((2002589171251097 : Rat) / 3100914216589) [(0, 1), (13, 2), (14, 1)]
]

/-- Partial product 496 for generator 18. -/
def ep_Q2_041_partial_18_0496 : Poly :=
[
  term ((4005178342502194 : Rat) / 3100914216589) [(0, 1), (8, 1), (13, 2), (14, 1)],
  term ((-2002589171251097 : Rat) / 3100914216589) [(0, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 18. -/
theorem ep_Q2_041_partial_18_0496_valid :
    mulPoly ep_Q2_041_coefficient_18_0496
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0497 : Poly :=
[
  term ((-34043703539937859072620820772735168418348300804580816804126842315 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 497 for generator 18. -/
def ep_Q2_041_partial_18_0497 : Poly :=
[
  term ((-34043703539937859072620820772735168418348300804580816804126842315 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (13, 2), (14, 1), (15, 2)],
  term ((34043703539937859072620820772735168418348300804580816804126842315 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 18. -/
theorem ep_Q2_041_partial_18_0497_valid :
    mulPoly ep_Q2_041_coefficient_18_0497
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0498 : Poly :=
[
  term ((50788130568604 : Rat) / 442987745227) [(0, 1), (13, 2), (14, 2)]
]

/-- Partial product 498 for generator 18. -/
def ep_Q2_041_partial_18_0498 : Poly :=
[
  term ((101576261137208 : Rat) / 442987745227) [(0, 1), (8, 1), (13, 2), (14, 2)],
  term ((-50788130568604 : Rat) / 442987745227) [(0, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 18. -/
theorem ep_Q2_041_partial_18_0498_valid :
    mulPoly ep_Q2_041_coefficient_18_0498
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0499 : Poly :=
[
  term ((-1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (13, 2), (14, 2), (15, 2)]
]

/-- Partial product 499 for generator 18. -/
def ep_Q2_041_partial_18_0499 : Poly :=
[
  term ((-2732061734416681241567840862674017763783828666323084065594411090 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (13, 2), (14, 2), (15, 2)],
  term ((1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 18. -/
theorem ep_Q2_041_partial_18_0499_valid :
    mulPoly ep_Q2_041_coefficient_18_0499
        ep_Q2_041_generator_18_0400_0499 =
      ep_Q2_041_partial_18_0499 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_0400_0499 : List Poly :=
[
  ep_Q2_041_partial_18_0400,
  ep_Q2_041_partial_18_0401,
  ep_Q2_041_partial_18_0402,
  ep_Q2_041_partial_18_0403,
  ep_Q2_041_partial_18_0404,
  ep_Q2_041_partial_18_0405,
  ep_Q2_041_partial_18_0406,
  ep_Q2_041_partial_18_0407,
  ep_Q2_041_partial_18_0408,
  ep_Q2_041_partial_18_0409,
  ep_Q2_041_partial_18_0410,
  ep_Q2_041_partial_18_0411,
  ep_Q2_041_partial_18_0412,
  ep_Q2_041_partial_18_0413,
  ep_Q2_041_partial_18_0414,
  ep_Q2_041_partial_18_0415,
  ep_Q2_041_partial_18_0416,
  ep_Q2_041_partial_18_0417,
  ep_Q2_041_partial_18_0418,
  ep_Q2_041_partial_18_0419,
  ep_Q2_041_partial_18_0420,
  ep_Q2_041_partial_18_0421,
  ep_Q2_041_partial_18_0422,
  ep_Q2_041_partial_18_0423,
  ep_Q2_041_partial_18_0424,
  ep_Q2_041_partial_18_0425,
  ep_Q2_041_partial_18_0426,
  ep_Q2_041_partial_18_0427,
  ep_Q2_041_partial_18_0428,
  ep_Q2_041_partial_18_0429,
  ep_Q2_041_partial_18_0430,
  ep_Q2_041_partial_18_0431,
  ep_Q2_041_partial_18_0432,
  ep_Q2_041_partial_18_0433,
  ep_Q2_041_partial_18_0434,
  ep_Q2_041_partial_18_0435,
  ep_Q2_041_partial_18_0436,
  ep_Q2_041_partial_18_0437,
  ep_Q2_041_partial_18_0438,
  ep_Q2_041_partial_18_0439,
  ep_Q2_041_partial_18_0440,
  ep_Q2_041_partial_18_0441,
  ep_Q2_041_partial_18_0442,
  ep_Q2_041_partial_18_0443,
  ep_Q2_041_partial_18_0444,
  ep_Q2_041_partial_18_0445,
  ep_Q2_041_partial_18_0446,
  ep_Q2_041_partial_18_0447,
  ep_Q2_041_partial_18_0448,
  ep_Q2_041_partial_18_0449,
  ep_Q2_041_partial_18_0450,
  ep_Q2_041_partial_18_0451,
  ep_Q2_041_partial_18_0452,
  ep_Q2_041_partial_18_0453,
  ep_Q2_041_partial_18_0454,
  ep_Q2_041_partial_18_0455,
  ep_Q2_041_partial_18_0456,
  ep_Q2_041_partial_18_0457,
  ep_Q2_041_partial_18_0458,
  ep_Q2_041_partial_18_0459,
  ep_Q2_041_partial_18_0460,
  ep_Q2_041_partial_18_0461,
  ep_Q2_041_partial_18_0462,
  ep_Q2_041_partial_18_0463,
  ep_Q2_041_partial_18_0464,
  ep_Q2_041_partial_18_0465,
  ep_Q2_041_partial_18_0466,
  ep_Q2_041_partial_18_0467,
  ep_Q2_041_partial_18_0468,
  ep_Q2_041_partial_18_0469,
  ep_Q2_041_partial_18_0470,
  ep_Q2_041_partial_18_0471,
  ep_Q2_041_partial_18_0472,
  ep_Q2_041_partial_18_0473,
  ep_Q2_041_partial_18_0474,
  ep_Q2_041_partial_18_0475,
  ep_Q2_041_partial_18_0476,
  ep_Q2_041_partial_18_0477,
  ep_Q2_041_partial_18_0478,
  ep_Q2_041_partial_18_0479,
  ep_Q2_041_partial_18_0480,
  ep_Q2_041_partial_18_0481,
  ep_Q2_041_partial_18_0482,
  ep_Q2_041_partial_18_0483,
  ep_Q2_041_partial_18_0484,
  ep_Q2_041_partial_18_0485,
  ep_Q2_041_partial_18_0486,
  ep_Q2_041_partial_18_0487,
  ep_Q2_041_partial_18_0488,
  ep_Q2_041_partial_18_0489,
  ep_Q2_041_partial_18_0490,
  ep_Q2_041_partial_18_0491,
  ep_Q2_041_partial_18_0492,
  ep_Q2_041_partial_18_0493,
  ep_Q2_041_partial_18_0494,
  ep_Q2_041_partial_18_0495,
  ep_Q2_041_partial_18_0496,
  ep_Q2_041_partial_18_0497,
  ep_Q2_041_partial_18_0498,
  ep_Q2_041_partial_18_0499
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_0400_0499 : Poly :=
[
  term ((-11373173714688347459835257721481251337009858223769039066430130265 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (13, 1), (15, 3)],
  term ((-117865553965874 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1), (13, 2)],
  term ((471462215863496 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1), (13, 2), (14, 1)],
  term ((-54522930035781162671320963554663078677218785740836900188048666420 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (13, 2), (14, 1), (15, 2)],
  term ((617549841128672035613762091872158168297472168270084741130874005 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (13, 2), (15, 2)],
  term ((-23703597594723402128027601763825954515655746086032556240939880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 3), (14, 1), (15, 1)],
  term ((5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 1), (13, 3), (15, 1)],
  term ((-5138926303197318 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 1), (14, 1)],
  term ((-254636887789907401114339726193392263464185407346353597167277519677988789353626489609 : Rat) / 5916937101978306289104851457521460688044196421438509484246921836923740631029856) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 2)],
  term ((-5832503271375654455478421488063358692142356593269486635467532360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (14, 1), (15, 4)],
  term ((-1305495839196406 : Rat) / 9302742649767) [(0, 1), (8, 1), (10, 1), (14, 2)],
  term ((-13555210571479630488708204653254599237343494432162470292815922265 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (14, 2), (15, 2)],
  term ((25813838989364654876494934857644209176358497612984500988520829765 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 1), (15, 2)],
  term ((-2501967823785193879144556760104110583847641385441688533539350520 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 1), (15, 4)],
  term ((-252726321864874 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 2)],
  term ((-360496369281308959176251184130851800915032038028423728012861040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((-100707616757750888733556898351716896259056715141871125005616400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 2), (11, 1), (15, 1)],
  term ((-1441985477125235836705004736523407203660128152113694912051444160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (10, 2), (11, 1), (15, 3)],
  term ((-1714598120981229756057475267598744216629119968834882479509480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 2), (12, 1), (15, 2)],
  term ((2338377005052898233110833208752058809146376444783107643744740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((-174754150594431223025054508600825671392821038665377027975780 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 2), (13, 1), (15, 1)],
  term ((2495115536286673908213431764613258370069025903792900656941040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (10, 2), (13, 1), (15, 3)],
  term ((-851138096085992 : Rat) / 3100914216589) [(0, 1), (8, 1), (10, 2), (14, 1)],
  term ((-1960122350445637808262843804912941463951429830396409975787861825 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (10, 2), (14, 1), (15, 2)],
  term ((-7055231131703988765232074856527499546372473482053851666553528658 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (10, 2), (15, 2)],
  term ((7629283720375162130377807794679164040968519413456710175789483310 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (10, 2), (15, 4)],
  term ((117865553965874 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1735289638966933476464528886361240743544621008613744966912408280 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-3943280705293898682837184952282002771213513803947495188889821165 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-5925899398680850532006900440956488628913936521508139060234970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-1362206536846925416790312295980889401771304588457406272862931944 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((109346166172495888044098546281493619455890558628823648244112820 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((415040337728222263745574251531603389837252163885087956402624640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((41673076423935694666662215234408733641556882937280322877403761632 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 1)],
  term ((29954800151798009919156471749372815376342520997985746937050925645 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 1), (12, 1), (15, 3)],
  term ((6462032513030949295173692993400824407794228116053387882595790 : Rat) / 24968999369794078182185386646329743778773584398998481017611) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 1)],
  term ((515394573356032320838466349522672683175621263981591406452685280 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (12, 2), (15, 3)],
  term ((627584998709526 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (13, 1)],
  term ((-2417934592200556 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((-393712971492087898664634506229176997411464271547780818158204175 : Rat) / 1032262682806929865101486997302695483309804134773785303841994) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((3866478653470576 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-12513595913940450246550897944460321334543639615093663069232973320 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((669913632752806326186646749307276296909572125721046636671709895 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (11, 1), (13, 1), (15, 2)],
  term ((1497239635802990409247524556017172934472635468412908232038467100 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((3092479275594049923740243076180818467105803685428725503493973520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-54228770050497238682271308873050410749303794635753421650917580 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (8, 1), (11, 1), (13, 2), (15, 1)],
  term ((726147785200684474931109421972883145641501916193033411682127521671 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 1)],
  term ((-389656840052623898477702721702560604811305454554038877413360121575 : Rat) / 244646255825242378029052418360738829544423579941387117010552578) [(0, 1), (8, 1), (11, 1), (14, 1), (15, 3)],
  term ((-196401940907443915468532663444301628064380917976168568216157733792 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 1)],
  term ((5832503271375654455478421488063358692142356593269486635467532360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 1), (14, 2), (15, 3)],
  term ((-352324112913613911562651572258878304389172866556784841150668700 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(0, 1), (8, 1), (11, 1), (14, 3), (15, 1)],
  term ((-59414501688200955148881706455384010467700459881527238130533272423 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (11, 1), (15, 1)],
  term ((12135630042240587625094109059107469148621570017915561610258448005 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (11, 1), (15, 3)],
  term ((-252726321864874 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2)],
  term ((-149306385144202 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2), (12, 1)],
  term ((119918993511520446979013061209023871085480418344818392548624520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-1624231163203878894127131592589889992613181173012405032515286880 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((9049604583702043590456390387933474661455990762767829156392950675 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 2), (12, 1), (15, 2)],
  term ((-960503769862172163960967130522572786025731147541717606935000160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((1341669316524444344959940457158241919506712546032770614219130960 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((270784599500205764369703294577764734431581095988992401007403315 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 2), (13, 1), (15, 1)],
  term ((112492807949236 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2), (14, 1)],
  term ((84073726991286434959541831972988986476085458598745595018925392490 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(0, 1), (8, 1), (11, 2), (14, 1), (15, 2)],
  term ((-2807326843767160 : Rat) / 3100914216589) [(0, 1), (8, 1), (11, 2), (14, 2)],
  term ((-21455603798960836003473628099122389922959151812905869903426776510 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 2), (14, 2), (15, 2)],
  term ((-11730226600294691429112139464725837155232463110250115105931932390 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (11, 2), (15, 2)],
  term ((-86528690768945168867257789483516724780417887501042681824307160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (12, 1), (15, 1)],
  term ((1352683320778506830632722430255418471332796217990018080517680 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (14, 1), (15, 1)],
  term ((-1095870714049455161235973578589340304538456602109524184754215520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (14, 2), (15, 1)],
  term ((-100707616757750888733556898351716896259056715141871125005616400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (8, 1), (11, 3), (15, 1)],
  term ((1413755190002012 : Rat) / 3100914216589) [(0, 1), (8, 1), (12, 1)],
  term ((-4036257787637916201587830712732277749574649172118227189658925687 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((5464123468833362483135681725348035527567657332646168131188822180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((2853210821587076182077396508608679710217821288133548436409430 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((-187103552810899089581067587914203012304075273772004936454253745487 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 1)],
  term ((44412271665585293918290079685019110485279863365658131822038710935 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (12, 1), (13, 1), (15, 3)],
  term ((22825686572696609456619172068869437681742570305068387491275440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-11100953844312470489782907063858061544612656914560081163520090 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 1), (13, 2), (15, 2)],
  term ((-2875166978040214 : Rat) / 3100914216589) [(0, 1), (8, 1), (12, 1), (14, 1)],
  term ((5579343607453098101278417369797730897317332290436683484085924805 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (12, 1), (14, 1), (15, 2)],
  term ((-25394065284302 : Rat) / 442987745227) [(0, 1), (8, 1), (12, 1), (14, 2)],
  term ((3531191866699744602226578639125397541518719626862856654523580465 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (12, 1), (14, 2), (15, 2)],
  term ((174366633121167868132796654734455190022626327244137161829518671875 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (8, 1), (12, 1), (15, 2)],
  term ((-2899265449492054825602968201594273565081563496615947530414542245 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (12, 1), (15, 4)],
  term ((1223492656863191 : Rat) / 3100914216589) [(0, 1), (8, 1), (12, 2)],
  term ((-791275065905727605151018869796334251619112381526915254631765 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 2), (13, 1), (15, 1)],
  term ((-11412843286348304728309586034434718840871285152534193745637720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (12, 2), (13, 1), (15, 3)],
  term ((1511330471460740725399986700849865813157564012608215931207280579 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (12, 2), (15, 2)],
  term ((-2732061734416681241567840862674017763783828666323084065594411090 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (12, 2), (15, 4)],
  term ((39658780117243635714763883889419655888743311990030104808232817443418944030817412865 : Rat) / 14463624027058082040034081340608015015219146807960800961492475601369143764739648) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 1)],
  term ((1745130781204420595880294270622313493559876558204443340629123865 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (8, 1), (13, 1), (14, 1), (15, 3)],
  term ((11211227383596705539523079066626991806753491165396343751831170 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (13, 1), (14, 2), (15, 1)],
  term ((-3803262169065826638313774616960569482306279030631410180139970 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (8, 1), (13, 1), (14, 3), (15, 1)],
  term ((3197609791305865376733785606993565370505032020973968311565890269 : Rat) / 7091195821021518203740649807557647233171697969315568609001524) [(0, 1), (8, 1), (13, 1), (15, 1)],
  term ((-387718044410126696308363916713325891549201967310514045952051455 : Rat) / 3545597910510759101870324903778823616585848984657784304500762) [(0, 1), (8, 1), (13, 1), (15, 3)],
  term ((-1045734199873077 : Rat) / 3100914216589) [(0, 1), (8, 1), (13, 2)],
  term ((4005178342502194 : Rat) / 3100914216589) [(0, 1), (8, 1), (13, 2), (14, 1)],
  term ((-34043703539937859072620820772735168418348300804580816804126842315 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (8, 1), (13, 2), (14, 1), (15, 2)],
  term ((101576261137208 : Rat) / 442987745227) [(0, 1), (8, 1), (13, 2), (14, 2)],
  term ((-2732061734416681241567840862674017763783828666323084065594411090 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (8, 1), (13, 2), (14, 2), (15, 2)],
  term ((11373173714688347459835257721481251337009858223769039066430130265 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (13, 1), (15, 3)],
  term ((58932776982937 : Rat) / 3100914216589) [(0, 1), (10, 1), (13, 2)],
  term ((-235731107931748 : Rat) / 3100914216589) [(0, 1), (10, 1), (13, 2), (14, 1)],
  term ((27261465017890581335660481777331539338609392870418450094024333210 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (13, 2), (14, 1), (15, 2)],
  term ((-617549841128672035613762091872158168297472168270084741130874005 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (10, 1), (13, 2), (15, 2)],
  term ((11851798797361701064013800881912977257827873043016278120469940 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (13, 3), (14, 1), (15, 1)],
  term ((-2962949699340425266003450220478244314456968260754069530117485 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 1), (13, 3), (15, 1)],
  term ((2569463151598659 : Rat) / 3100914216589) [(0, 1), (10, 1), (14, 1)],
  term ((254636887789907401114339726193392263464185407346353597167277519677988789353626489609 : Rat) / 11833874203956612578209702915042921376088392842877018968493843673847481262059712) [(0, 1), (10, 1), (14, 1), (15, 2)],
  term ((2916251635687827227739210744031679346071178296634743317733766180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (14, 1), (15, 4)],
  term ((652747919598203 : Rat) / 9302742649767) [(0, 1), (10, 1), (14, 2)],
  term ((13555210571479630488708204653254599237343494432162470292815922265 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (14, 2), (15, 2)],
  term ((-25813838989364654876494934857644209176358497612984500988520829765 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 1), (15, 2)],
  term ((1250983911892596939572278380052055291923820692720844266769675260 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 1), (15, 4)],
  term ((126363160932437 : Rat) / 3100914216589) [(0, 1), (10, 2)],
  term ((180248184640654479588125592065425900457516019014211864006430520 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 2), (11, 1), (14, 1), (15, 1)],
  term ((50353808378875444366778449175858448129528357570935562502808200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((720992738562617918352502368261703601830064076056847456025722080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (10, 2), (11, 1), (15, 3)],
  term ((857299060490614878028737633799372108314559984417441239754740 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 2), (12, 1), (15, 2)],
  term ((-1169188502526449116555416604376029404573188222391553821872370 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 2), (13, 1), (14, 1), (15, 1)],
  term ((87377075297215611512527254300412835696410519332688513987890 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-1247557768143336954106715882306629185034512951896450328470520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (10, 2), (13, 1), (15, 3)],
  term ((425569048042996 : Rat) / 3100914216589) [(0, 1), (10, 2), (14, 1)],
  term ((1960122350445637808262843804912941463951429830396409975787861825 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (10, 2), (14, 1), (15, 2)],
  term ((3527615565851994382616037428263749773186236741026925833276764329 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(0, 1), (10, 2), (15, 2)],
  term ((-3814641860187581065188903897339582020484259706728355087894741655 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (10, 2), (15, 4)],
  term ((-58932776982937 : Rat) / 3100914216589) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((867644819483466738232264443180620371772310504306872483456204140 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((3943280705293898682837184952282002771213513803947495188889821165 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2962949699340425266003450220478244314456968260754069530117485 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((681103268423462708395156147990444700885652294228703136431465972 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-54673083086247944022049273140746809727945279314411824122056410 : Rat) / 574286985505263798190263892865584106911792441176965063405053) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-207520168864111131872787125765801694918626081942543978201312320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-20836538211967847333331107617204366820778441468640161438701880816 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-29954800151798009919156471749372815376342520997985746937050925645 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((-3231016256515474647586846496700412203897114058026693941297895 : Rat) / 24968999369794078182185386646329743778773584398998481017611) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-257697286678016160419233174761336341587810631990795703226342640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (12, 2), (15, 3)],
  term ((-313792499354763 : Rat) / 3100914216589) [(0, 1), (11, 1), (13, 1)],
  term ((1208967296100278 : Rat) / 3100914216589) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((393712971492087898664634506229176997411464271547780818158204175 : Rat) / 2064525365613859730202973994605390966619608269547570607683988) [(0, 1), (11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1933239326735288 : Rat) / 3100914216589) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((6256797956970225123275448972230160667271819807546831534616486660 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-669913632752806326186646749307276296909572125721046636671709895 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-748619817901495204623762278008586467236317734206454116019233550 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1546239637797024961870121538090409233552901842714362751746986760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 1), (13, 2), (14, 2), (15, 1)],
  term ((27114385025248619341135654436525205374651897317876710825458790 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-726147785200684474931109421972883145641501916193033411682127521671 : Rat) / 244646255825242378029052418360738829544423579941387117010552578) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((389656840052623898477702721702560604811305454554038877413360121575 : Rat) / 489292511650484756058104836721477659088847159882774234021105156) [(0, 1), (11, 1), (14, 1), (15, 3)],
  term ((98200970453721957734266331722150814032190458988084284108078866896 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((-2916251635687827227739210744031679346071178296634743317733766180 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 1), (14, 2), (15, 3)],
  term ((176162056456806955781325786129439152194586433278392420575334350 : Rat) / 5318396865766138652805487355668235424878773476986676456751143) [(0, 1), (11, 1), (14, 3), (15, 1)],
  term ((59414501688200955148881706455384010467700459881527238130533272423 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (11, 1), (15, 1)],
  term ((-12135630042240587625094109059107469148621570017915561610258448005 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (11, 1), (15, 3)],
  term ((126363160932437 : Rat) / 3100914216589) [(0, 1), (11, 2)],
  term ((74653192572101 : Rat) / 3100914216589) [(0, 1), (11, 2), (12, 1)],
  term ((-59959496755760223489506530604511935542740209172409196274312260 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((812115581601939447063565796294944996306590586506202516257643440 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 2), (12, 1), (14, 1), (15, 2)],
  term ((-9049604583702043590456390387933474661455990762767829156392950675 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((480251884931086081980483565261286393012865573770858803467500080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-670834658262222172479970228579120959753356273016385307109565480 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 2), (13, 1), (14, 2), (15, 1)],
  term ((-270784599500205764369703294577764734431581095988992401007403315 : Rat) / 3545597910510759101870324903778823616585848984657784304500762) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-56246403974618 : Rat) / 3100914216589) [(0, 1), (11, 2), (14, 1)],
  term ((-42036863495643217479770915986494493238042729299372797509462696245 : Rat) / 122323127912621189014526209180369414772211789970693558505276289) [(0, 1), (11, 2), (14, 1), (15, 2)],
  term ((1403663421883580 : Rat) / 3100914216589) [(0, 1), (11, 2), (14, 2)],
  term ((10727801899480418001736814049561194961479575906452934951713388255 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 2), (14, 2), (15, 2)],
  term ((5865113300147345714556069732362918577616231555125057552965966195 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (11, 2), (15, 2)],
  term ((43264345384472584433628894741758362390208943750521340912153580 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((-676341660389253415316361215127709235666398108995009040258840 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 3), (14, 1), (15, 1)],
  term ((547935357024727580617986789294670152269228301054762092377107760 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 3), (14, 2), (15, 1)],
  term ((50353808378875444366778449175858448129528357570935562502808200 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(0, 1), (11, 3), (15, 1)],
  term ((-706877595001006 : Rat) / 3100914216589) [(0, 1), (12, 1)],
  term ((4036257787637916201587830712732277749574649172118227189658925687 : Rat) / 11649821705963922763288210398130420454496360949589862714788218) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2732061734416681241567840862674017763783828666323084065594411090 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 3)],
  term ((-1426605410793538091038698254304339855108910644066774218204715 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (12, 1), (13, 1), (14, 2), (15, 1)],
  term ((187103552810899089581067587914203012304075273772004936454253745487 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-44412271665585293918290079685019110485279863365658131822038710935 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (12, 1), (13, 1), (15, 3)],
  term ((-11412843286348304728309586034434718840871285152534193745637720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((5550476922156235244891453531929030772306328457280040581760045 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (12, 1), (13, 2), (15, 2)],
  term ((1437583489020107 : Rat) / 3100914216589) [(0, 1), (12, 1), (14, 1)],
  term ((-5579343607453098101278417369797730897317332290436683484085924805 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((12697032642151 : Rat) / 442987745227) [(0, 1), (12, 1), (14, 2)],
  term ((-3531191866699744602226578639125397541518719626862856654523580465 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (12, 1), (14, 2), (15, 2)],
  term ((-174366633121167868132796654734455190022626327244137161829518671875 : Rat) / 326195007766989837372069891147651772725898106588516156014070104) [(0, 1), (12, 1), (15, 2)],
  term ((2899265449492054825602968201594273565081563496615947530414542245 : Rat) / 81548751941747459343017472786912943181474526647129039003517526) [(0, 1), (12, 1), (15, 4)],
  term ((-1223492656863191 : Rat) / 6201828433178) [(0, 1), (12, 2)],
  term ((791275065905727605151018869796334251619112381526915254631765 : Rat) / 44880986208996950656586391187073716665643658033642839297478) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((5706421643174152364154793017217359420435642576267096872818860 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (12, 2), (13, 1), (15, 3)],
  term ((-1511330471460740725399986700849865813157564012608215931207280579 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (12, 2), (15, 2)],
  term ((1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (12, 2), (15, 4)],
  term ((-39658780117243635714763883889419655888743311990030104808232817443418944030817412865 : Rat) / 28927248054116164080068162681216030030438293615921601922984951202738287529479296) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1745130781204420595880294270622313493559876558204443340629123865 : Rat) / 23299643411927845526576420796260840908992721899179725429576436) [(0, 1), (13, 1), (14, 1), (15, 3)],
  term ((-5605613691798352769761539533313495903376745582698171875915585 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((1901631084532913319156887308480284741153139515315705090069985 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(0, 1), (13, 1), (14, 3), (15, 1)],
  term ((-3197609791305865376733785606993565370505032020973968311565890269 : Rat) / 14182391642043036407481299615115294466343395938631137218003048) [(0, 1), (13, 1), (15, 1)],
  term ((387718044410126696308363916713325891549201967310514045952051455 : Rat) / 7091195821021518203740649807557647233171697969315568609001524) [(0, 1), (13, 1), (15, 3)],
  term ((1045734199873077 : Rat) / 6201828433178) [(0, 1), (13, 2)],
  term ((-2002589171251097 : Rat) / 3100914216589) [(0, 1), (13, 2), (14, 1)],
  term ((34043703539937859072620820772735168418348300804580816804126842315 : Rat) / 163097503883494918686034945573825886362949053294258078007035052) [(0, 1), (13, 2), (14, 1), (15, 2)],
  term ((-50788130568604 : Rat) / 442987745227) [(0, 1), (13, 2), (14, 2)],
  term ((1366030867208340620783920431337008881891914333161542032797205545 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(0, 1), (13, 2), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 400 through 499. -/
theorem ep_Q2_041_block_18_0400_0499_valid :
    checkProductSumEq ep_Q2_041_partials_18_0400_0499
      ep_Q2_041_block_18_0400_0499 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
