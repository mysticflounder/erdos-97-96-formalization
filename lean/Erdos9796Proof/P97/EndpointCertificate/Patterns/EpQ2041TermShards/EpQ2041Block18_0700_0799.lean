/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:700-799

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0700 : Poly :=
[
  term ((715408567273951319813182404994548569123603609205879018896360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 700 for generator 18. -/
def ep_Q2_041_partial_18_0700 : Poly :=
[
  term ((1430817134547902639626364809989097138247207218411758037792720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-715408567273951319813182404994548569123603609205879018896360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 18. -/
theorem ep_Q2_041_partial_18_0700_valid :
    mulPoly ep_Q2_041_coefficient_18_0700
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0701 : Poly :=
[
  term ((398811290410071336641477620780011470586131731197918148904378880 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 3)]
]

/-- Partial product 701 for generator 18. -/
def ep_Q2_041_partial_18_0701 : Poly :=
[
  term ((797622580820142673282955241560022941172263462395836297808757760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 3)],
  term ((-398811290410071336641477620780011470586131731197918148904378880 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 18. -/
theorem ep_Q2_041_partial_18_0701_valid :
    mulPoly ep_Q2_041_coefficient_18_0701
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0702 : Poly :=
[
  term ((15202850342805744172 : Rat) / 777005835365402853) [(1, 1), (6, 1), (9, 1), (14, 1)]
]

/-- Partial product 702 for generator 18. -/
def ep_Q2_041_partial_18_0702 : Poly :=
[
  term ((30405700685611488344 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((-15202850342805744172 : Rat) / 777005835365402853) [(1, 1), (6, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 18. -/
theorem ep_Q2_041_partial_18_0702_valid :
    mulPoly ep_Q2_041_coefficient_18_0702
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0703 : Poly :=
[
  term ((-16605547285055455703144172831583993119657155079667997927326134700579095 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (9, 1), (14, 1), (15, 2)]
]

/-- Partial product 703 for generator 18. -/
def ep_Q2_041_partial_18_0703 : Poly :=
[
  term ((-33211094570110911406288345663167986239314310159335995854652269401158190 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((16605547285055455703144172831583993119657155079667997927326134700579095 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (9, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 18. -/
theorem ep_Q2_041_partial_18_0703_valid :
    mulPoly ep_Q2_041_coefficient_18_0703
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0704 : Poly :=
[
  term ((-14810595750720 : Rat) / 275754830051) [(1, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 704 for generator 18. -/
def ep_Q2_041_partial_18_0704 : Poly :=
[
  term ((-29621191501440 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((14810595750720 : Rat) / 275754830051) [(1, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 18. -/
theorem ep_Q2_041_partial_18_0704_valid :
    mulPoly ep_Q2_041_coefficient_18_0704
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0705 : Poly :=
[
  term ((1755882320 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 705 for generator 18. -/
def ep_Q2_041_partial_18_0705 : Poly :=
[
  term ((3511764640 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1755882320 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 18. -/
theorem ep_Q2_041_partial_18_0705_valid :
    mulPoly ep_Q2_041_coefficient_18_0705
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0706 : Poly :=
[
  term ((24999850265064131710 : Rat) / 777005835365402853) [(1, 1), (6, 1), (9, 1), (14, 2)]
]

/-- Partial product 706 for generator 18. -/
def ep_Q2_041_partial_18_0706 : Poly :=
[
  term ((49999700530128263420 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 2)],
  term ((-24999850265064131710 : Rat) / 777005835365402853) [(1, 1), (6, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 18. -/
theorem ep_Q2_041_partial_18_0706_valid :
    mulPoly ep_Q2_041_coefficient_18_0706
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0707 : Poly :=
[
  term ((636121756 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (14, 2), (16, 1)]
]

/-- Partial product 707 for generator 18. -/
def ep_Q2_041_partial_18_0707 : Poly :=
[
  term ((1272243512 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-636121756 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 18. -/
theorem ep_Q2_041_partial_18_0707_valid :
    mulPoly ep_Q2_041_coefficient_18_0707
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0708 : Poly :=
[
  term ((-4759823581232041101260112097403412106695376215042052940434027551114893481 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (6, 1), (9, 1), (15, 2)]
]

/-- Partial product 708 for generator 18. -/
def ep_Q2_041_partial_18_0708 : Poly :=
[
  term ((-4759823581232041101260112097403412106695376215042052940434027551114893481 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (8, 1), (9, 1), (15, 2)],
  term ((4759823581232041101260112097403412106695376215042052940434027551114893481 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (6, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 18. -/
theorem ep_Q2_041_partial_18_0708_valid :
    mulPoly ep_Q2_041_coefficient_18_0708
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0709 : Poly :=
[
  term ((-13087900862820 : Rat) / 275754830051) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 709 for generator 18. -/
def ep_Q2_041_partial_18_0709 : Poly :=
[
  term ((-26175801725640 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((13087900862820 : Rat) / 275754830051) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 18. -/
theorem ep_Q2_041_partial_18_0709_valid :
    mulPoly ep_Q2_041_coefficient_18_0709
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0710 : Poly :=
[
  term ((-1522687150 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 710 for generator 18. -/
def ep_Q2_041_partial_18_0710 : Poly :=
[
  term ((-3045374300 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((1522687150 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 18. -/
theorem ep_Q2_041_partial_18_0710_valid :
    mulPoly ep_Q2_041_coefficient_18_0710
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0711 : Poly :=
[
  term ((27373765944575053518 : Rat) / 259001945121800951) [(1, 1), (6, 1), (10, 1), (11, 1)]
]

/-- Partial product 711 for generator 18. -/
def ep_Q2_041_partial_18_0711 : Poly :=
[
  term ((54747531889150107036 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-27373765944575053518 : Rat) / 259001945121800951) [(1, 1), (6, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 18. -/
theorem ep_Q2_041_partial_18_0711_valid :
    mulPoly ep_Q2_041_coefficient_18_0711
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0712 : Poly :=
[
  term ((-100619404256060091259151879064741960811098423933888236420160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 712 for generator 18. -/
def ep_Q2_041_partial_18_0712 : Poly :=
[
  term ((-201238808512120182518303758129483921622196847867776472840320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((100619404256060091259151879064741960811098423933888236420160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 18. -/
theorem ep_Q2_041_partial_18_0712_valid :
    mulPoly ep_Q2_041_coefficient_18_0712
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0713 : Poly :=
[
  term ((193312327530785719563506651387369054507962580995081833701232000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 713 for generator 18. -/
def ep_Q2_041_partial_18_0713 : Poly :=
[
  term ((386624655061571439127013302774738109015925161990163667402464000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-193312327530785719563506651387369054507962580995081833701232000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 18. -/
theorem ep_Q2_041_partial_18_0713_valid :
    mulPoly ep_Q2_041_coefficient_18_0713
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0714 : Poly :=
[
  term ((-276052898795543811159758668428421310940771465296647980788537580 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 714 for generator 18. -/
def ep_Q2_041_partial_18_0714 : Poly :=
[
  term ((-552105797591087622319517336856842621881542930593295961577075160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((276052898795543811159758668428421310940771465296647980788537580 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 18. -/
theorem ep_Q2_041_partial_18_0714_valid :
    mulPoly ep_Q2_041_coefficient_18_0714
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0715 : Poly :=
[
  term ((773249310123142878254026605549476218031850323980327334804928000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (10, 1), (11, 1), (15, 4)]
]

/-- Partial product 715 for generator 18. -/
def ep_Q2_041_partial_18_0715 : Poly :=
[
  term ((1546498620246285756508053211098952436063700647960654669609856000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 4)],
  term ((-773249310123142878254026605549476218031850323980327334804928000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (10, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 18. -/
theorem ep_Q2_041_partial_18_0715_valid :
    mulPoly ep_Q2_041_coefficient_18_0715
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0716 : Poly :=
[
  term ((3698744524 : Rat) / 151763803) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 716 for generator 18. -/
def ep_Q2_041_partial_18_0716 : Poly :=
[
  term ((7397489048 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-3698744524 : Rat) / 151763803) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 18. -/
theorem ep_Q2_041_partial_18_0716_valid :
    mulPoly ep_Q2_041_coefficient_18_0716
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0717 : Poly :=
[
  term ((-140199111089916965995328115098029971757364291634018936780640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 717 for generator 18. -/
def ep_Q2_041_partial_18_0717 : Poly :=
[
  term ((-280398222179833931990656230196059943514728583268037873561280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((140199111089916965995328115098029971757364291634018936780640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 18. -/
theorem ep_Q2_041_partial_18_0717_valid :
    mulPoly ep_Q2_041_coefficient_18_0717
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0718 : Poly :=
[
  term ((60984787633535791725356358796401194842446788767188376175414400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 718 for generator 18. -/
def ep_Q2_041_partial_18_0718 : Poly :=
[
  term ((121969575267071583450712717592802389684893577534376752350828800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-60984787633535791725356358796401194842446788767188376175414400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 18. -/
theorem ep_Q2_041_partial_18_0718_valid :
    mulPoly ep_Q2_041_coefficient_18_0718
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0719 : Poly :=
[
  term ((637241454184566020769142610569503092690782305501078056207403540 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 719 for generator 18. -/
def ep_Q2_041_partial_18_0719 : Poly :=
[
  term ((1274482908369132041538285221139006185381564611002156112414807080 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((-637241454184566020769142610569503092690782305501078056207403540 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 18. -/
theorem ep_Q2_041_partial_18_0719_valid :
    mulPoly ep_Q2_041_coefficient_18_0719
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0720 : Poly :=
[
  term ((243939150534143166901425435185604779369787155068753504701657600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (10, 1), (13, 1), (15, 4)]
]

/-- Partial product 720 for generator 18. -/
def ep_Q2_041_partial_18_0720 : Poly :=
[
  term ((487878301068286333802850870371209558739574310137507009403315200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 4)],
  term ((-243939150534143166901425435185604779369787155068753504701657600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (10, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 18. -/
theorem ep_Q2_041_partial_18_0720_valid :
    mulPoly ep_Q2_041_coefficient_18_0720
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0721 : Poly :=
[
  term ((-28650216172325498210963611312289355502325123315295052090265981619913800 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 721 for generator 18. -/
def ep_Q2_041_partial_18_0721 : Poly :=
[
  term ((-57300432344650996421927222624578711004650246630590104180531963239827600 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((28650216172325498210963611312289355502325123315295052090265981619913800 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 18. -/
theorem ep_Q2_041_partial_18_0721_valid :
    mulPoly ep_Q2_041_coefficient_18_0721
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0722 : Poly :=
[
  term ((-10771342364160 : Rat) / 275754830051) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 722 for generator 18. -/
def ep_Q2_041_partial_18_0722 : Poly :=
[
  term ((-21542684728320 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((10771342364160 : Rat) / 275754830051) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 18. -/
theorem ep_Q2_041_partial_18_0722_valid :
    mulPoly ep_Q2_041_coefficient_18_0722
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0723 : Poly :=
[
  term ((-8981606028170928656954268479342320528093252614968160811253375517706301499 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (6, 1), (10, 1), (15, 1)]
]

/-- Partial product 723 for generator 18. -/
def ep_Q2_041_partial_18_0723 : Poly :=
[
  term ((-8981606028170928656954268479342320528093252614968160811253375517706301499 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((8981606028170928656954268479342320528093252614968160811253375517706301499 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (6, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 18. -/
theorem ep_Q2_041_partial_18_0723_valid :
    mulPoly ep_Q2_041_coefficient_18_0723
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0724 : Poly :=
[
  term ((-7285707116892 : Rat) / 275754830051) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 724 for generator 18. -/
def ep_Q2_041_partial_18_0724 : Poly :=
[
  term ((-14571414233784 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((7285707116892 : Rat) / 275754830051) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 18. -/
theorem ep_Q2_041_partial_18_0724_valid :
    mulPoly ep_Q2_041_coefficient_18_0724
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0725 : Poly :=
[
  term ((-114600864689301992843854445249157422009300493261180208361063926479655200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (10, 1), (15, 3)]
]

/-- Partial product 725 for generator 18. -/
def ep_Q2_041_partial_18_0725 : Poly :=
[
  term ((-229201729378603985687708890498314844018600986522360416722127852959310400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 3)],
  term ((114600864689301992843854445249157422009300493261180208361063926479655200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 18. -/
theorem ep_Q2_041_partial_18_0725_valid :
    mulPoly ep_Q2_041_coefficient_18_0725
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0726 : Poly :=
[
  term ((-43085369456640 : Rat) / 275754830051) [(1, 1), (6, 1), (10, 1), (15, 3), (16, 1)]
]

/-- Partial product 726 for generator 18. -/
def ep_Q2_041_partial_18_0726 : Poly :=
[
  term ((-86170738913280 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((43085369456640 : Rat) / 275754830051) [(1, 1), (6, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 18. -/
theorem ep_Q2_041_partial_18_0726_valid :
    mulPoly ep_Q2_041_coefficient_18_0726
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0727 : Poly :=
[
  term ((58190631460752317118 : Rat) / 259001945121800951) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 727 for generator 18. -/
def ep_Q2_041_partial_18_0727 : Poly :=
[
  term ((116381262921504634236 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((-58190631460752317118 : Rat) / 259001945121800951) [(1, 1), (6, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 18. -/
theorem ep_Q2_041_partial_18_0727_valid :
    mulPoly ep_Q2_041_coefficient_18_0727
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0728 : Poly :=
[
  term ((452472633489002684238062030484724490380741955567281003393980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 728 for generator 18. -/
def ep_Q2_041_partial_18_0728 : Poly :=
[
  term ((904945266978005368476124060969448980761483911134562006787960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-452472633489002684238062030484724490380741955567281003393980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 18. -/
theorem ep_Q2_041_partial_18_0728_valid :
    mulPoly ep_Q2_041_coefficient_18_0728
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0729 : Poly :=
[
  term ((-396401119617982646214816332176607766475904126986724445140193600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 729 for generator 18. -/
def ep_Q2_041_partial_18_0729 : Poly :=
[
  term ((-792802239235965292429632664353215532951808253973448890280387200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((396401119617982646214816332176607766475904126986724445140193600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 18. -/
theorem ep_Q2_041_partial_18_0729_valid :
    mulPoly ep_Q2_041_coefficient_18_0729
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0730 : Poly :=
[
  term ((-226236316744501342119031015242362245190370977783640501696990 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 730 for generator 18. -/
def ep_Q2_041_partial_18_0730 : Poly :=
[
  term ((-452472633489002684238062030484724490380741955567281003393980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((226236316744501342119031015242362245190370977783640501696990 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 18. -/
theorem ep_Q2_041_partial_18_0730_valid :
    mulPoly ep_Q2_041_coefficient_18_0730
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0731 : Poly :=
[
  term ((22869295362575921897008634548650448065917545787695641065780400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 731 for generator 18. -/
def ep_Q2_041_partial_18_0731 : Poly :=
[
  term ((45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((-22869295362575921897008634548650448065917545787695641065780400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 18. -/
theorem ep_Q2_041_partial_18_0731_valid :
    mulPoly ep_Q2_041_coefficient_18_0731
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0732 : Poly :=
[
  term ((-16938464392118721948 : Rat) / 37000277874542993) [(1, 1), (6, 1), (11, 1), (14, 1)]
]

/-- Partial product 732 for generator 18. -/
def ep_Q2_041_partial_18_0732 : Poly :=
[
  term ((-33876928784237443896 : Rat) / 37000277874542993) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((16938464392118721948 : Rat) / 37000277874542993) [(1, 1), (6, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 18. -/
theorem ep_Q2_041_partial_18_0732_valid :
    mulPoly ep_Q2_041_coefficient_18_0732
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0733 : Poly :=
[
  term ((-155153033871378840466760369983850514673474381443657723318325672242035460 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 733 for generator 18. -/
def ep_Q2_041_partial_18_0733 : Poly :=
[
  term ((-310306067742757680933520739967701029346948762887315446636651344484070920 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((155153033871378840466760369983850514673474381443657723318325672242035460 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 18. -/
theorem ep_Q2_041_partial_18_0733_valid :
    mulPoly ep_Q2_041_coefficient_18_0733
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0734 : Poly :=
[
  term ((70013725367040 : Rat) / 275754830051) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 734 for generator 18. -/
def ep_Q2_041_partial_18_0734 : Poly :=
[
  term ((140027450734080 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-70013725367040 : Rat) / 275754830051) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 18. -/
theorem ep_Q2_041_partial_18_0734_valid :
    mulPoly ep_Q2_041_coefficient_18_0734
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0735 : Poly :=
[
  term ((-12082020470674107472719165711710565906747661312192614606327000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 4)]
]

/-- Partial product 735 for generator 18. -/
def ep_Q2_041_partial_18_0735 : Poly :=
[
  term ((-24164040941348214945438331423421131813495322624385229212654000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 4)],
  term ((12082020470674107472719165711710565906747661312192614606327000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 18. -/
theorem ep_Q2_041_partial_18_0735_valid :
    mulPoly ep_Q2_041_coefficient_18_0735
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0736 : Poly :=
[
  term ((-14879843804 : Rat) / 151763803) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 736 for generator 18. -/
def ep_Q2_041_partial_18_0736 : Poly :=
[
  term ((-29759687608 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((14879843804 : Rat) / 151763803) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 18. -/
theorem ep_Q2_041_partial_18_0736_valid :
    mulPoly ep_Q2_041_coefficient_18_0736
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0737 : Poly :=
[
  term ((47278407402431815004464160699375286446230750335176252908291020 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (6, 1), (11, 1), (14, 2), (15, 2)]
]

/-- Partial product 737 for generator 18. -/
def ep_Q2_041_partial_18_0737 : Poly :=
[
  term ((94556814804863630008928321398750572892461500670352505816582040 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((-47278407402431815004464160699375286446230750335176252908291020 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (6, 1), (11, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 18. -/
theorem ep_Q2_041_partial_18_0737_valid :
    mulPoly ep_Q2_041_coefficient_18_0737
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0738 : Poly :=
[
  term ((771487350434572093409016769531869066052418234747680580859626853707253275 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (11, 1), (15, 2)]
]

/-- Partial product 738 for generator 18. -/
def ep_Q2_041_partial_18_0738 : Poly :=
[
  term ((771487350434572093409016769531869066052418234747680580859626853707253275 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-771487350434572093409016769531869066052418234747680580859626853707253275 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 18. -/
theorem ep_Q2_041_partial_18_0738_valid :
    mulPoly ep_Q2_041_coefficient_18_0738
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0739 : Poly :=
[
  term ((-4039253386560 : Rat) / 275754830051) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 739 for generator 18. -/
def ep_Q2_041_partial_18_0739 : Poly :=
[
  term ((-8078506773120 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((4039253386560 : Rat) / 275754830051) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 18. -/
theorem ep_Q2_041_partial_18_0739_valid :
    mulPoly ep_Q2_041_coefficient_18_0739
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0740 : Poly :=
[
  term ((-120820204706741074727191657117105659067476613121926146063270000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 1), (15, 4)]
]

/-- Partial product 740 for generator 18. -/
def ep_Q2_041_partial_18_0740 : Poly :=
[
  term ((-241640409413482149454383314234211318134953226243852292126540000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 4)],
  term ((120820204706741074727191657117105659067476613121926146063270000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 18. -/
theorem ep_Q2_041_partial_18_0740_valid :
    mulPoly ep_Q2_041_coefficient_18_0740
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0741 : Poly :=
[
  term ((7439921902 : Rat) / 151763803) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 741 for generator 18. -/
def ep_Q2_041_partial_18_0741 : Poly :=
[
  term ((14879843804 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-7439921902 : Rat) / 151763803) [(1, 1), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 18. -/
theorem ep_Q2_041_partial_18_0741_valid :
    mulPoly ep_Q2_041_coefficient_18_0741
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0742 : Poly :=
[
  term ((152461969083839479313390896991002987106116971917970940438536000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (11, 2), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 742 for generator 18. -/
def ep_Q2_041_partial_18_0742 : Poly :=
[
  term ((304923938167678958626781793982005974212233943835941880877072000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-152461969083839479313390896991002987106116971917970940438536000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (11, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 18. -/
theorem ep_Q2_041_partial_18_0742_valid :
    mulPoly ep_Q2_041_coefficient_18_0742
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0743 : Poly :=
[
  term ((176938044974474528161507057275255904578852920513129050680439920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 743 for generator 18. -/
def ep_Q2_041_partial_18_0743 : Poly :=
[
  term ((353876089948949056323014114550511809157705841026258101360879840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-176938044974474528161507057275255904578852920513129050680439920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 18. -/
theorem ep_Q2_041_partial_18_0743_valid :
    mulPoly ep_Q2_041_coefficient_18_0743
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0744 : Poly :=
[
  term ((-105283264635289534082699750385167103451502634239539424029319116145418200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 744 for generator 18. -/
def ep_Q2_041_partial_18_0744 : Poly :=
[
  term ((-210566529270579068165399500770334206903005268479078848058638232290836400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((105283264635289534082699750385167103451502634239539424029319116145418200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 18. -/
theorem ep_Q2_041_partial_18_0744_valid :
    mulPoly ep_Q2_041_coefficient_18_0744
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0745 : Poly :=
[
  term ((-26928355910400 : Rat) / 275754830051) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 745 for generator 18. -/
def ep_Q2_041_partial_18_0745 : Poly :=
[
  term ((-53856711820800 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((26928355910400 : Rat) / 275754830051) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 18. -/
theorem ep_Q2_041_partial_18_0745_valid :
    mulPoly ep_Q2_041_coefficient_18_0745
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0746 : Poly :=
[
  term ((-1256530128950107177162793234017898854301756776468031919058008000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 3)]
]

/-- Partial product 746 for generator 18. -/
def ep_Q2_041_partial_18_0746 : Poly :=
[
  term ((-2513060257900214354325586468035797708603513552936063838116016000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 3)],
  term ((1256530128950107177162793234017898854301756776468031919058008000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 18. -/
theorem ep_Q2_041_partial_18_0746_valid :
    mulPoly ep_Q2_041_coefficient_18_0746
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0747 : Poly :=
[
  term ((-848472790080583240937915316949367127018343634298092411922917121392242841 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (11, 2), (15, 1)]
]

/-- Partial product 747 for generator 18. -/
def ep_Q2_041_partial_18_0747 : Poly :=
[
  term ((-1696945580161166481875830633898734254036687268596184823845834242784485682 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term ((848472790080583240937915316949367127018343634298092411922917121392242841 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 18. -/
theorem ep_Q2_041_partial_18_0747_valid :
    mulPoly ep_Q2_041_coefficient_18_0747
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0748 : Poly :=
[
  term ((6982940372520 : Rat) / 275754830051) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 748 for generator 18. -/
def ep_Q2_041_partial_18_0748 : Poly :=
[
  term ((13965880745040 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-6982940372520 : Rat) / 275754830051) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 18. -/
theorem ep_Q2_041_partial_18_0748_valid :
    mulPoly ep_Q2_041_coefficient_18_0748
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0749 : Poly :=
[
  term ((72492122824044644836314994270263395440485967873155687637962000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 2), (15, 3)]
]

/-- Partial product 749 for generator 18. -/
def ep_Q2_041_partial_18_0749 : Poly :=
[
  term ((144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 3)],
  term ((-72492122824044644836314994270263395440485967873155687637962000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 18. -/
theorem ep_Q2_041_partial_18_0749_valid :
    mulPoly ep_Q2_041_coefficient_18_0749
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0750 : Poly :=
[
  term ((483280818826964298908766628468422636269906452487704584253080000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 3), (14, 1), (15, 2)]
]

/-- Partial product 750 for generator 18. -/
def ep_Q2_041_partial_18_0750 : Poly :=
[
  term ((966561637653928597817533256936845272539812904975409168506160000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 3), (14, 1), (15, 2)],
  term ((-483280818826964298908766628468422636269906452487704584253080000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 18. -/
theorem ep_Q2_041_partial_18_0750_valid :
    mulPoly ep_Q2_041_coefficient_18_0750
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0751 : Poly :=
[
  term ((-256340980517320917085713799085142209541534597579881270097326160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 3), (15, 2)]
]

/-- Partial product 751 for generator 18. -/
def ep_Q2_041_partial_18_0751 : Poly :=
[
  term ((-512681961034641834171427598170284419083069195159762540194652320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 3), (15, 2)],
  term ((256340980517320917085713799085142209541534597579881270097326160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 18. -/
theorem ep_Q2_041_partial_18_0751_valid :
    mulPoly ep_Q2_041_coefficient_18_0751
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0752 : Poly :=
[
  term ((-1047855756144656308153100626454134107023864410647221859541820 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

/-- Partial product 752 for generator 18. -/
def ep_Q2_041_partial_18_0752 : Poly :=
[
  term ((-2095711512289312616306201252908268214047728821294443719083640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((1047855756144656308153100626454134107023864410647221859541820 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 18. -/
theorem ep_Q2_041_partial_18_0752_valid :
    mulPoly ep_Q2_041_coefficient_18_0752
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0753 : Poly :=
[
  term ((9583902900 : Rat) / 1706612117) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 753 for generator 18. -/
def ep_Q2_041_partial_18_0753 : Poly :=
[
  term ((19167805800 : Rat) / 1706612117) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((-9583902900 : Rat) / 1706612117) [(1, 1), (6, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 18. -/
theorem ep_Q2_041_partial_18_0753_valid :
    mulPoly ep_Q2_041_coefficient_18_0753
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0754 : Poly :=
[
  term ((-290862000 : Rat) / 243801731) [(1, 1), (6, 1), (13, 1), (14, 1)]
]

/-- Partial product 754 for generator 18. -/
def ep_Q2_041_partial_18_0754 : Poly :=
[
  term ((-581724000 : Rat) / 243801731) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((290862000 : Rat) / 243801731) [(1, 1), (6, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 18. -/
theorem ep_Q2_041_partial_18_0754_valid :
    mulPoly ep_Q2_041_coefficient_18_0754
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0755 : Poly :=
[
  term ((-898873689864465823531029345938251544342941812963060271763734280 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 755 for generator 18. -/
def ep_Q2_041_partial_18_0755 : Poly :=
[
  term ((-1797747379728931647062058691876503088685883625926120543527468560 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((898873689864465823531029345938251544342941812963060271763734280 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 18. -/
theorem ep_Q2_041_partial_18_0755_valid :
    mulPoly ep_Q2_041_coefficient_18_0755
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0756 : Poly :=
[
  term ((-3811549227095986982834772424775074677652924297949273510963400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 4)]
]

/-- Partial product 756 for generator 18. -/
def ep_Q2_041_partial_18_0756 : Poly :=
[
  term ((-7623098454191973965669544849550149355305848595898547021926800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 4)],
  term ((3811549227095986982834772424775074677652924297949273510963400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 18. -/
theorem ep_Q2_041_partial_18_0756_valid :
    mulPoly ep_Q2_041_coefficient_18_0756
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0757 : Poly :=
[
  term ((21132392533097612261707896240850633653544016323203707639173820 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (6, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 757 for generator 18. -/
def ep_Q2_041_partial_18_0757 : Poly :=
[
  term ((42264785066195224523415792481701267307088032646407415278347640 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((-21132392533097612261707896240850633653544016323203707639173820 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (6, 1), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 18. -/
theorem ep_Q2_041_partial_18_0757_valid :
    mulPoly ep_Q2_041_coefficient_18_0757
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0758 : Poly :=
[
  term ((281563532565858754335923589221356158565573788600500369388291480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (13, 1), (15, 2)]
]

/-- Partial product 758 for generator 18. -/
def ep_Q2_041_partial_18_0758 : Poly :=
[
  term ((563127065131717508671847178442712317131147577201000738776582960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-281563532565858754335923589221356158565573788600500369388291480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 18. -/
theorem ep_Q2_041_partial_18_0758_valid :
    mulPoly ep_Q2_041_coefficient_18_0758
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0759 : Poly :=
[
  term ((-38115492270959869828347724247750746776529242979492735109634000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (13, 1), (15, 4)]
]

/-- Partial product 759 for generator 18. -/
def ep_Q2_041_partial_18_0759 : Poly :=
[
  term ((-76230984541919739656695448495501493553058485958985470219268000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 4)],
  term ((38115492270959869828347724247750746776529242979492735109634000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 18. -/
theorem ep_Q2_041_partial_18_0759_valid :
    mulPoly ep_Q2_041_coefficient_18_0759
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0760 : Poly :=
[
  term ((27380999370554380280873985825100791620006656737493461820847628134435379245 : Rat) / 74256892347499373372905278993545501322860959869558851945454900737468268) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

/-- Partial product 760 for generator 18. -/
def ep_Q2_041_partial_18_0760 : Poly :=
[
  term ((27380999370554380280873985825100791620006656737493461820847628134435379245 : Rat) / 37128446173749686686452639496772750661430479934779425972727450368734134) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((-27380999370554380280873985825100791620006656737493461820847628134435379245 : Rat) / 74256892347499373372905278993545501322860959869558851945454900737468268) [(1, 1), (6, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 18. -/
theorem ep_Q2_041_partial_18_0760_valid :
    mulPoly ep_Q2_041_coefficient_18_0760
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0761 : Poly :=
[
  term ((42629608696132 : Rat) / 275754830051) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 761 for generator 18. -/
def ep_Q2_041_partial_18_0761 : Poly :=
[
  term ((85259217392264 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-42629608696132 : Rat) / 275754830051) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 18. -/
theorem ep_Q2_041_partial_18_0761_valid :
    mulPoly ep_Q2_041_coefficient_18_0761
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0762 : Poly :=
[
  term ((-19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (14, 1), (15, 3)]
]

/-- Partial product 762 for generator 18. -/
def ep_Q2_041_partial_18_0762 : Poly :=
[
  term ((-19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 18. -/
theorem ep_Q2_041_partial_18_0762_valid :
    mulPoly ep_Q2_041_coefficient_18_0762
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0763 : Poly :=
[
  term ((673208897760 : Rat) / 275754830051) [(1, 1), (6, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 763 for generator 18. -/
def ep_Q2_041_partial_18_0763 : Poly :=
[
  term ((1346417795520 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-673208897760 : Rat) / 275754830051) [(1, 1), (6, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 18. -/
theorem ep_Q2_041_partial_18_0763_valid :
    mulPoly ep_Q2_041_coefficient_18_0763
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0764 : Poly :=
[
  term ((-449061840835404297750972332609369373992201254883738758022054998080668795 : Rat) / 18564223086874843343226319748386375330715239967389712986363725184367067) [(1, 1), (6, 1), (14, 2), (15, 1)]
]

/-- Partial product 764 for generator 18. -/
def ep_Q2_041_partial_18_0764 : Poly :=
[
  term ((-898123681670808595501944665218738747984402509767477516044109996161337590 : Rat) / 18564223086874843343226319748386375330715239967389712986363725184367067) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((449061840835404297750972332609369373992201254883738758022054998080668795 : Rat) / 18564223086874843343226319748386375330715239967389712986363725184367067) [(1, 1), (6, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 18. -/
theorem ep_Q2_041_partial_18_0764_valid :
    mulPoly ep_Q2_041_coefficient_18_0764
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0765 : Poly :=
[
  term ((-19427765752606 : Rat) / 275754830051) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 765 for generator 18. -/
def ep_Q2_041_partial_18_0765 : Poly :=
[
  term ((-38855531505212 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((19427765752606 : Rat) / 275754830051) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 18. -/
theorem ep_Q2_041_partial_18_0765_valid :
    mulPoly ep_Q2_041_coefficient_18_0765
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0766 : Poly :=
[
  term ((-12480153963174810616959020855421571822764148568550059254390726886861326323 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 766 for generator 18. -/
def ep_Q2_041_partial_18_0766 : Poly :=
[
  term ((-12480153963174810616959020855421571822764148568550059254390726886861326323 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((12480153963174810616959020855421571822764148568550059254390726886861326323 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (6, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 18. -/
theorem ep_Q2_041_partial_18_0766_valid :
    mulPoly ep_Q2_041_coefficient_18_0766
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0767 : Poly :=
[
  term ((-23334500231910 : Rat) / 275754830051) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 767 for generator 18. -/
def ep_Q2_041_partial_18_0767 : Poly :=
[
  term ((-46669000463820 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((23334500231910 : Rat) / 275754830051) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 18. -/
theorem ep_Q2_041_partial_18_0767_valid :
    mulPoly ep_Q2_041_coefficient_18_0767
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0768 : Poly :=
[
  term ((90021839516735584136924172919763710222388278083373990471896713347818015 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (15, 3)]
]

/-- Partial product 768 for generator 18. -/
def ep_Q2_041_partial_18_0768 : Poly :=
[
  term ((180043679033471168273848345839527420444776556166747980943793426695636030 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (15, 3)],
  term ((-90021839516735584136924172919763710222388278083373990471896713347818015 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 18. -/
theorem ep_Q2_041_partial_18_0768_valid :
    mulPoly ep_Q2_041_coefficient_18_0768
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0769 : Poly :=
[
  term ((6732088977600 : Rat) / 275754830051) [(1, 1), (6, 1), (15, 3), (16, 1)]
]

/-- Partial product 769 for generator 18. -/
def ep_Q2_041_partial_18_0769 : Poly :=
[
  term ((13464177955200 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-6732088977600 : Rat) / 275754830051) [(1, 1), (6, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 18. -/
theorem ep_Q2_041_partial_18_0769_valid :
    mulPoly ep_Q2_041_coefficient_18_0769
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0770 : Poly :=
[
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (11, 1)]
]

/-- Partial product 770 for generator 18. -/
def ep_Q2_041_partial_18_0770 : Poly :=
[
  term ((63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (11, 1)],
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 18. -/
theorem ep_Q2_041_partial_18_0770_valid :
    mulPoly ep_Q2_041_coefficient_18_0770
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0771 : Poly :=
[
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 771 for generator 18. -/
def ep_Q2_041_partial_18_0771 : Poly :=
[
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 18. -/
theorem ep_Q2_041_partial_18_0771_valid :
    mulPoly ep_Q2_041_coefficient_18_0771
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0772 : Poly :=
[
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 772 for generator 18. -/
def ep_Q2_041_partial_18_0772 : Poly :=
[
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 1), (15, 2)],
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 18. -/
theorem ep_Q2_041_partial_18_0772_valid :
    mulPoly ep_Q2_041_coefficient_18_0772
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0773 : Poly :=
[
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 773 for generator 18. -/
def ep_Q2_041_partial_18_0773 : Poly :=
[
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 2), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 18. -/
theorem ep_Q2_041_partial_18_0773_valid :
    mulPoly ep_Q2_041_coefficient_18_0773
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0774 : Poly :=
[
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 774 for generator 18. -/
def ep_Q2_041_partial_18_0774 : Poly :=
[
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 2), (15, 1)],
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 18. -/
theorem ep_Q2_041_partial_18_0774_valid :
    mulPoly ep_Q2_041_coefficient_18_0774
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0775 : Poly :=
[
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 775 for generator 18. -/
def ep_Q2_041_partial_18_0775 : Poly :=
[
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (13, 1), (15, 2)],
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 18. -/
theorem ep_Q2_041_partial_18_0775_valid :
    mulPoly ep_Q2_041_coefficient_18_0775
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0776 : Poly :=
[
  term ((63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (15, 1)]
]

/-- Partial product 776 for generator 18. -/
def ep_Q2_041_partial_18_0776 : Poly :=
[
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (15, 1)],
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 18. -/
theorem ep_Q2_041_partial_18_0776_valid :
    mulPoly ep_Q2_041_coefficient_18_0776
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0777 : Poly :=
[
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 777 for generator 18. -/
def ep_Q2_041_partial_18_0777 : Poly :=
[
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 2), (8, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 18. -/
theorem ep_Q2_041_partial_18_0777_valid :
    mulPoly ep_Q2_041_coefficient_18_0777
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0778 : Poly :=
[
  term ((-24022068973512879723 : Rat) / 259001945121800951) [(1, 1), (6, 2), (9, 1)]
]

/-- Partial product 778 for generator 18. -/
def ep_Q2_041_partial_18_0778 : Poly :=
[
  term ((-48044137947025759446 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (9, 1)],
  term ((24022068973512879723 : Rat) / 259001945121800951) [(1, 1), (6, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 18. -/
theorem ep_Q2_041_partial_18_0778_valid :
    mulPoly ep_Q2_041_coefficient_18_0778
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0779 : Poly :=
[
  term ((63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 2), (9, 1), (10, 1)]
]

/-- Partial product 779 for generator 18. -/
def ep_Q2_041_partial_18_0779 : Poly :=
[
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (9, 1), (10, 1)],
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 2), (9, 1), (10, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 18. -/
theorem ep_Q2_041_partial_18_0779_valid :
    mulPoly ep_Q2_041_coefficient_18_0779
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0780 : Poly :=
[
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 780 for generator 18. -/
def ep_Q2_041_partial_18_0780 : Poly :=
[
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 18. -/
theorem ep_Q2_041_partial_18_0780_valid :
    mulPoly ep_Q2_041_coefficient_18_0780
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0781 : Poly :=
[
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 781 for generator 18. -/
def ep_Q2_041_partial_18_0781 : Poly :=
[
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 18. -/
theorem ep_Q2_041_partial_18_0781_valid :
    mulPoly ep_Q2_041_coefficient_18_0781
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0782 : Poly :=
[
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 2), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 782 for generator 18. -/
def ep_Q2_041_partial_18_0782 : Poly :=
[
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 2), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 18. -/
theorem ep_Q2_041_partial_18_0782_valid :
    mulPoly ep_Q2_041_coefficient_18_0782
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0783 : Poly :=
[
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1)]
]

/-- Partial product 783 for generator 18. -/
def ep_Q2_041_partial_18_0783 : Poly :=
[
  term ((-1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 18. -/
theorem ep_Q2_041_partial_18_0783_valid :
    mulPoly ep_Q2_041_coefficient_18_0783
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0784 : Poly :=
[
  term ((-445436319863636590746027785590117726182675330714012185958780 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 784 for generator 18. -/
def ep_Q2_041_partial_18_0784 : Poly :=
[
  term ((-890872639727273181492055571180235452365350661428024371917560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((445436319863636590746027785590117726182675330714012185958780 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 18. -/
theorem ep_Q2_041_partial_18_0784_valid :
    mulPoly ep_Q2_041_coefficient_18_0784
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0785 : Poly :=
[
  term ((144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (9, 1), (11, 1), (15, 3)]
]

/-- Partial product 785 for generator 18. -/
def ep_Q2_041_partial_18_0785 : Poly :=
[
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 3)],
  term ((-144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (9, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 18. -/
theorem ep_Q2_041_partial_18_0785_valid :
    mulPoly ep_Q2_041_coefficient_18_0785
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0786 : Poly :=
[
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 786 for generator 18. -/
def ep_Q2_041_partial_18_0786 : Poly :=
[
  term ((1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 18. -/
theorem ep_Q2_041_partial_18_0786_valid :
    mulPoly ep_Q2_041_coefficient_18_0786
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0787 : Poly :=
[
  term ((100304718592792364831030453758127627541897471798672175923420 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (13, 1), (15, 1)]
]

/-- Partial product 787 for generator 18. -/
def ep_Q2_041_partial_18_0787 : Poly :=
[
  term ((200609437185584729662060907516255255083794943597344351846840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((-100304718592792364831030453758127627541897471798672175923420 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 18. -/
theorem ep_Q2_041_partial_18_0787_valid :
    mulPoly ep_Q2_041_coefficient_18_0787
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0788 : Poly :=
[
  term ((45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (9, 1), (13, 1), (15, 3)]
]

/-- Partial product 788 for generator 18. -/
def ep_Q2_041_partial_18_0788 : Poly :=
[
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (8, 1), (9, 1), (13, 1), (15, 3)],
  term ((-45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (9, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 18. -/
theorem ep_Q2_041_partial_18_0788_valid :
    mulPoly ep_Q2_041_coefficient_18_0788
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0789 : Poly :=
[
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 2), (9, 1), (14, 1)]
]

/-- Partial product 789 for generator 18. -/
def ep_Q2_041_partial_18_0789 : Poly :=
[
  term ((-255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (9, 1), (14, 1)],
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 2), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 18. -/
theorem ep_Q2_041_partial_18_0789_valid :
    mulPoly ep_Q2_041_coefficient_18_0789
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0790 : Poly :=
[
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 2), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 790 for generator 18. -/
def ep_Q2_041_partial_18_0790 : Poly :=
[
  term ((-29929419024 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 2), (9, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 18. -/
theorem ep_Q2_041_partial_18_0790_valid :
    mulPoly ep_Q2_041_coefficient_18_0790
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0791 : Poly :=
[
  term ((-21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (9, 1), (15, 2)]
]

/-- Partial product 791 for generator 18. -/
def ep_Q2_041_partial_18_0791 : Poly :=
[
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (8, 1), (9, 1), (15, 2)],
  term ((21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 18. -/
theorem ep_Q2_041_partial_18_0791_valid :
    mulPoly ep_Q2_041_coefficient_18_0791
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0792 : Poly :=
[
  term ((-8078506773120 : Rat) / 275754830051) [(1, 1), (6, 2), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 792 for generator 18. -/
def ep_Q2_041_partial_18_0792 : Poly :=
[
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (6, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((8078506773120 : Rat) / 275754830051) [(1, 1), (6, 2), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 18. -/
theorem ep_Q2_041_partial_18_0792_valid :
    mulPoly ep_Q2_041_coefficient_18_0792
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0793 : Poly :=
[
  term ((-1934237970 : Rat) / 151763803) [(1, 1), (6, 2), (9, 1), (16, 1)]
]

/-- Partial product 793 for generator 18. -/
def ep_Q2_041_partial_18_0793 : Poly :=
[
  term ((-3868475940 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((1934237970 : Rat) / 151763803) [(1, 1), (6, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 18. -/
theorem ep_Q2_041_partial_18_0793_valid :
    mulPoly ep_Q2_041_coefficient_18_0793
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0794 : Poly :=
[
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 2), (10, 1), (11, 1)]
]

/-- Partial product 794 for generator 18. -/
def ep_Q2_041_partial_18_0794 : Poly :=
[
  term ((-255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (10, 1), (11, 1)],
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 18. -/
theorem ep_Q2_041_partial_18_0794_valid :
    mulPoly ep_Q2_041_coefficient_18_0794
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0795 : Poly :=
[
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 795 for generator 18. -/
def ep_Q2_041_partial_18_0795 : Poly :=
[
  term ((1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 18. -/
theorem ep_Q2_041_partial_18_0795_valid :
    mulPoly ep_Q2_041_coefficient_18_0795
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0796 : Poly :=
[
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 796 for generator 18. -/
def ep_Q2_041_partial_18_0796 : Poly :=
[
  term ((-29929419024 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 18. -/
theorem ep_Q2_041_partial_18_0796_valid :
    mulPoly ep_Q2_041_coefficient_18_0796
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0797 : Poly :=
[
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (10, 1), (11, 2), (15, 1)]
]

/-- Partial product 797 for generator 18. -/
def ep_Q2_041_partial_18_0797 : Poly :=
[
  term ((-1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (10, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 18. -/
theorem ep_Q2_041_partial_18_0797_valid :
    mulPoly ep_Q2_041_coefficient_18_0797
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0798 : Poly :=
[
  term ((-47688440336495660454 : Rat) / 259001945121800951) [(1, 1), (6, 2), (11, 1)]
]

/-- Partial product 798 for generator 18. -/
def ep_Q2_041_partial_18_0798 : Poly :=
[
  term ((-95376880672991320908 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (11, 1)],
  term ((47688440336495660454 : Rat) / 259001945121800951) [(1, 1), (6, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 18. -/
theorem ep_Q2_041_partial_18_0798_valid :
    mulPoly ep_Q2_041_coefficient_18_0798
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_0799 : Poly :=
[
  term ((-1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 799 for generator 18. -/
def ep_Q2_041_partial_18_0799 : Poly :=
[
  term ((-2009870599815060013758066178841924550068360861596036244429280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 18. -/
theorem ep_Q2_041_partial_18_0799_valid :
    mulPoly ep_Q2_041_coefficient_18_0799
        ep_Q2_041_generator_18_0700_0799 =
      ep_Q2_041_partial_18_0799 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_0700_0799 : List Poly :=
[
  ep_Q2_041_partial_18_0700,
  ep_Q2_041_partial_18_0701,
  ep_Q2_041_partial_18_0702,
  ep_Q2_041_partial_18_0703,
  ep_Q2_041_partial_18_0704,
  ep_Q2_041_partial_18_0705,
  ep_Q2_041_partial_18_0706,
  ep_Q2_041_partial_18_0707,
  ep_Q2_041_partial_18_0708,
  ep_Q2_041_partial_18_0709,
  ep_Q2_041_partial_18_0710,
  ep_Q2_041_partial_18_0711,
  ep_Q2_041_partial_18_0712,
  ep_Q2_041_partial_18_0713,
  ep_Q2_041_partial_18_0714,
  ep_Q2_041_partial_18_0715,
  ep_Q2_041_partial_18_0716,
  ep_Q2_041_partial_18_0717,
  ep_Q2_041_partial_18_0718,
  ep_Q2_041_partial_18_0719,
  ep_Q2_041_partial_18_0720,
  ep_Q2_041_partial_18_0721,
  ep_Q2_041_partial_18_0722,
  ep_Q2_041_partial_18_0723,
  ep_Q2_041_partial_18_0724,
  ep_Q2_041_partial_18_0725,
  ep_Q2_041_partial_18_0726,
  ep_Q2_041_partial_18_0727,
  ep_Q2_041_partial_18_0728,
  ep_Q2_041_partial_18_0729,
  ep_Q2_041_partial_18_0730,
  ep_Q2_041_partial_18_0731,
  ep_Q2_041_partial_18_0732,
  ep_Q2_041_partial_18_0733,
  ep_Q2_041_partial_18_0734,
  ep_Q2_041_partial_18_0735,
  ep_Q2_041_partial_18_0736,
  ep_Q2_041_partial_18_0737,
  ep_Q2_041_partial_18_0738,
  ep_Q2_041_partial_18_0739,
  ep_Q2_041_partial_18_0740,
  ep_Q2_041_partial_18_0741,
  ep_Q2_041_partial_18_0742,
  ep_Q2_041_partial_18_0743,
  ep_Q2_041_partial_18_0744,
  ep_Q2_041_partial_18_0745,
  ep_Q2_041_partial_18_0746,
  ep_Q2_041_partial_18_0747,
  ep_Q2_041_partial_18_0748,
  ep_Q2_041_partial_18_0749,
  ep_Q2_041_partial_18_0750,
  ep_Q2_041_partial_18_0751,
  ep_Q2_041_partial_18_0752,
  ep_Q2_041_partial_18_0753,
  ep_Q2_041_partial_18_0754,
  ep_Q2_041_partial_18_0755,
  ep_Q2_041_partial_18_0756,
  ep_Q2_041_partial_18_0757,
  ep_Q2_041_partial_18_0758,
  ep_Q2_041_partial_18_0759,
  ep_Q2_041_partial_18_0760,
  ep_Q2_041_partial_18_0761,
  ep_Q2_041_partial_18_0762,
  ep_Q2_041_partial_18_0763,
  ep_Q2_041_partial_18_0764,
  ep_Q2_041_partial_18_0765,
  ep_Q2_041_partial_18_0766,
  ep_Q2_041_partial_18_0767,
  ep_Q2_041_partial_18_0768,
  ep_Q2_041_partial_18_0769,
  ep_Q2_041_partial_18_0770,
  ep_Q2_041_partial_18_0771,
  ep_Q2_041_partial_18_0772,
  ep_Q2_041_partial_18_0773,
  ep_Q2_041_partial_18_0774,
  ep_Q2_041_partial_18_0775,
  ep_Q2_041_partial_18_0776,
  ep_Q2_041_partial_18_0777,
  ep_Q2_041_partial_18_0778,
  ep_Q2_041_partial_18_0779,
  ep_Q2_041_partial_18_0780,
  ep_Q2_041_partial_18_0781,
  ep_Q2_041_partial_18_0782,
  ep_Q2_041_partial_18_0783,
  ep_Q2_041_partial_18_0784,
  ep_Q2_041_partial_18_0785,
  ep_Q2_041_partial_18_0786,
  ep_Q2_041_partial_18_0787,
  ep_Q2_041_partial_18_0788,
  ep_Q2_041_partial_18_0789,
  ep_Q2_041_partial_18_0790,
  ep_Q2_041_partial_18_0791,
  ep_Q2_041_partial_18_0792,
  ep_Q2_041_partial_18_0793,
  ep_Q2_041_partial_18_0794,
  ep_Q2_041_partial_18_0795,
  ep_Q2_041_partial_18_0796,
  ep_Q2_041_partial_18_0797,
  ep_Q2_041_partial_18_0798,
  ep_Q2_041_partial_18_0799
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_0700_0799 : Poly :=
[
  term ((1430817134547902639626364809989097138247207218411758037792720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((797622580820142673282955241560022941172263462395836297808757760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 3)],
  term ((30405700685611488344 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 1)],
  term ((-33211094570110911406288345663167986239314310159335995854652269401158190 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 2)],
  term ((-29621191501440 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((3511764640 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((49999700530128263420 : Rat) / 777005835365402853) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 2)],
  term ((1272243512 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((-4759823581232041101260112097403412106695376215042052940434027551114893481 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (8, 1), (9, 1), (15, 2)],
  term ((-26175801725640 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3045374300 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((54747531889150107036 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1)],
  term ((-201238808512120182518303758129483921622196847867776472840320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((386624655061571439127013302774738109015925161990163667402464000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-552105797591087622319517336856842621881542930593295961577075160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 2)],
  term ((1546498620246285756508053211098952436063700647960654669609856000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (15, 4)],
  term ((7397489048 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-280398222179833931990656230196059943514728583268037873561280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((121969575267071583450712717592802389684893577534376752350828800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((1274482908369132041538285221139006185381564611002156112414807080 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((487878301068286333802850870371209558739574310137507009403315200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (10, 1), (13, 1), (15, 4)],
  term ((-57300432344650996421927222624578711004650246630590104180531963239827600 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-21542684728320 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-8981606028170928656954268479342320528093252614968160811253375517706301499 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1)],
  term ((-14571414233784 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-229201729378603985687708890498314844018600986522360416722127852959310400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 3)],
  term ((-86170738913280 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((116381262921504634236 : Rat) / 259001945121800951) [(1, 1), (6, 1), (8, 1), (11, 1)],
  term ((904945266978005368476124060969448980761483911134562006787960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-792802239235965292429632664353215532951808253973448890280387200 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-452472633489002684238062030484724490380741955567281003393980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((-33876928784237443896 : Rat) / 37000277874542993) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1)],
  term ((-310306067742757680933520739967701029346948762887315446636651344484070920 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((140027450734080 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-24164040941348214945438331423421131813495322624385229212654000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (15, 4)],
  term ((-29759687608 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((94556814804863630008928321398750572892461500670352505816582040 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (6, 1), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((771487350434572093409016769531869066052418234747680580859626853707253275 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2)],
  term ((-8078506773120 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-241640409413482149454383314234211318134953226243852292126540000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 1), (15, 4)],
  term ((14879843804 : Rat) / 151763803) [(1, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((304923938167678958626781793982005974212233943835941880877072000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((353876089948949056323014114550511809157705841026258101360879840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-210566529270579068165399500770334206903005268479078848058638232290836400 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((-53856711820800 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2513060257900214354325586468035797708603513552936063838116016000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 2), (14, 1), (15, 3)],
  term ((-1696945580161166481875830633898734254036687268596184823845834242784485682 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 1)],
  term ((13965880745040 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 2), (15, 3)],
  term ((966561637653928597817533256936845272539812904975409168506160000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 3), (14, 1), (15, 2)],
  term ((-512681961034641834171427598170284419083069195159762540194652320 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (8, 1), (11, 3), (15, 2)],
  term ((-2095711512289312616306201252908268214047728821294443719083640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (8, 1), (12, 1), (15, 1)],
  term ((19167805800 : Rat) / 1706612117) [(1, 1), (6, 1), (8, 1), (13, 1)],
  term ((-581724000 : Rat) / 243801731) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1)],
  term ((-1797747379728931647062058691876503088685883625926120543527468560 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7623098454191973965669544849550149355305848595898547021926800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 1), (15, 4)],
  term ((42264785066195224523415792481701267307088032646407415278347640 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (6, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((563127065131717508671847178442712317131147577201000738776582960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 2)],
  term ((-76230984541919739656695448495501493553058485958985470219268000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (8, 1), (13, 1), (15, 4)],
  term ((27380999370554380280873985825100791620006656737493461820847628134435379245 : Rat) / 37128446173749686686452639496772750661430479934779425972727450368734134) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1)],
  term ((85259217392264 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 3)],
  term ((1346417795520 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (14, 1), (15, 3), (16, 1)],
  term ((-898123681670808595501944665218738747984402509767477516044109996161337590 : Rat) / 18564223086874843343226319748386375330715239967389712986363725184367067) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1)],
  term ((-38855531505212 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((-12480153963174810616959020855421571822764148568550059254390726886861326323 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (6, 1), (8, 1), (15, 1)],
  term ((-46669000463820 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((180043679033471168273848345839527420444776556166747980943793426695636030 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (8, 1), (15, 3)],
  term ((13464177955200 : Rat) / 275754830051) [(1, 1), (6, 1), (8, 1), (15, 3), (16, 1)],
  term ((-715408567273951319813182404994548569123603609205879018896360 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 1)],
  term ((-398811290410071336641477620780011470586131731197918148904378880 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (9, 1), (13, 1), (15, 3)],
  term ((-15202850342805744172 : Rat) / 777005835365402853) [(1, 1), (6, 1), (9, 1), (14, 1)],
  term ((16605547285055455703144172831583993119657155079667997927326134700579095 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (9, 1), (14, 1), (15, 2)],
  term ((14810595750720 : Rat) / 275754830051) [(1, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1755882320 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-24999850265064131710 : Rat) / 777005835365402853) [(1, 1), (6, 1), (9, 1), (14, 2)],
  term ((-636121756 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((4759823581232041101260112097403412106695376215042052940434027551114893481 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (6, 1), (9, 1), (15, 2)],
  term ((13087900862820 : Rat) / 275754830051) [(1, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((1522687150 : Rat) / 151763803) [(1, 1), (6, 1), (9, 1), (16, 1)],
  term ((-27373765944575053518 : Rat) / 259001945121800951) [(1, 1), (6, 1), (10, 1), (11, 1)],
  term ((100619404256060091259151879064741960811098423933888236420160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-193312327530785719563506651387369054507962580995081833701232000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((276052898795543811159758668428421310940771465296647980788537580 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (10, 1), (11, 1), (15, 2)],
  term ((-773249310123142878254026605549476218031850323980327334804928000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (10, 1), (11, 1), (15, 4)],
  term ((-3698744524 : Rat) / 151763803) [(1, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((140199111089916965995328115098029971757364291634018936780640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (10, 1), (11, 2), (15, 1)],
  term ((-60984787633535791725356358796401194842446788767188376175414400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-637241454184566020769142610569503092690782305501078056207403540 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (10, 1), (13, 1), (15, 2)],
  term ((-243939150534143166901425435185604779369787155068753504701657600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (10, 1), (13, 1), (15, 4)],
  term ((28650216172325498210963611312289355502325123315295052090265981619913800 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1)],
  term ((10771342364160 : Rat) / 275754830051) [(1, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((8981606028170928656954268479342320528093252614968160811253375517706301499 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (6, 1), (10, 1), (15, 1)],
  term ((7285707116892 : Rat) / 275754830051) [(1, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((114600864689301992843854445249157422009300493261180208361063926479655200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (10, 1), (15, 3)],
  term ((43085369456640 : Rat) / 275754830051) [(1, 1), (6, 1), (10, 1), (15, 3), (16, 1)],
  term ((-58190631460752317118 : Rat) / 259001945121800951) [(1, 1), (6, 1), (11, 1)],
  term ((-452472633489002684238062030484724490380741955567281003393980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((396401119617982646214816332176607766475904126986724445140193600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((226236316744501342119031015242362245190370977783640501696990 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 1)],
  term ((-22869295362575921897008634548650448065917545787695641065780400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (11, 1), (13, 1), (15, 3)],
  term ((16938464392118721948 : Rat) / 37000277874542993) [(1, 1), (6, 1), (11, 1), (14, 1)],
  term ((155153033871378840466760369983850514673474381443657723318325672242035460 : Rat) / 884010623184516349677443797542208349081678093685224427922082151636527) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2)],
  term ((-70013725367040 : Rat) / 275754830051) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((12082020470674107472719165711710565906747661312192614606327000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 1), (14, 1), (15, 4)],
  term ((14879843804 : Rat) / 151763803) [(1, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-47278407402431815004464160699375286446230750335176252908291020 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (6, 1), (11, 1), (14, 2), (15, 2)],
  term ((-771487350434572093409016769531869066052418234747680580859626853707253275 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (11, 1), (15, 2)],
  term ((4039253386560 : Rat) / 275754830051) [(1, 1), (6, 1), (11, 1), (15, 2), (16, 1)],
  term ((120820204706741074727191657117105659067476613121926146063270000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 1), (15, 4)],
  term ((-7439921902 : Rat) / 151763803) [(1, 1), (6, 1), (11, 1), (16, 1)],
  term ((-152461969083839479313390896991002987106116971917970940438536000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-176938044974474528161507057275255904578852920513129050680439920 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (11, 2), (13, 1), (15, 2)],
  term ((105283264635289534082699750385167103451502634239539424029319116145418200 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 1)],
  term ((26928355910400 : Rat) / 275754830051) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1256530128950107177162793234017898854301756776468031919058008000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 2), (14, 1), (15, 3)],
  term ((848472790080583240937915316949367127018343634298092411922917121392242841 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((-6982940372520 : Rat) / 275754830051) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-72492122824044644836314994270263395440485967873155687637962000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 2), (15, 3)],
  term ((-483280818826964298908766628468422636269906452487704584253080000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 3), (14, 1), (15, 2)],
  term ((256340980517320917085713799085142209541534597579881270097326160 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 1), (11, 3), (15, 2)],
  term ((1047855756144656308153100626454134107023864410647221859541820 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((-9583902900 : Rat) / 1706612117) [(1, 1), (6, 1), (13, 1)],
  term ((290862000 : Rat) / 243801731) [(1, 1), (6, 1), (13, 1), (14, 1)],
  term ((898873689864465823531029345938251544342941812963060271763734280 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 2)],
  term ((3811549227095986982834772424775074677652924297949273510963400 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (13, 1), (14, 1), (15, 4)],
  term ((-21132392533097612261707896240850633653544016323203707639173820 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (6, 1), (13, 1), (14, 2), (15, 2)],
  term ((-281563532565858754335923589221356158565573788600500369388291480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (13, 1), (15, 2)],
  term ((38115492270959869828347724247750746776529242979492735109634000 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 1), (13, 1), (15, 4)],
  term ((-27380999370554380280873985825100791620006656737493461820847628134435379245 : Rat) / 74256892347499373372905278993545501322860959869558851945454900737468268) [(1, 1), (6, 1), (14, 1), (15, 1)],
  term ((-42629608696132 : Rat) / 275754830051) [(1, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((19207222930351417060560341308777701258249249064450817185506342324313155 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (6, 1), (14, 1), (15, 3)],
  term ((-673208897760 : Rat) / 275754830051) [(1, 1), (6, 1), (14, 1), (15, 3), (16, 1)],
  term ((449061840835404297750972332609369373992201254883738758022054998080668795 : Rat) / 18564223086874843343226319748386375330715239967389712986363725184367067) [(1, 1), (6, 1), (14, 2), (15, 1)],
  term ((19427765752606 : Rat) / 275754830051) [(1, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((12480153963174810616959020855421571822764148568550059254390726886861326323 : Rat) / 49504594898332915581936852662363667548573973246372567963636600491645512) [(1, 1), (6, 1), (15, 1)],
  term ((23334500231910 : Rat) / 275754830051) [(1, 1), (6, 1), (15, 1), (16, 1)],
  term ((-90021839516735584136924172919763710222388278083373990471896713347818015 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 1), (15, 3)],
  term ((-6732088977600 : Rat) / 275754830051) [(1, 1), (6, 1), (15, 3), (16, 1)],
  term ((-48044137947025759446 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (9, 1)],
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (9, 1), (10, 1)],
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-890872639727273181492055571180235452365350661428024371917560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1)],
  term ((289968491296178579345259977081053581761943871492622750551848000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 3)],
  term ((1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((200609437185584729662060907516255255083794943597344351846840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (9, 1), (13, 1), (15, 1)],
  term ((91477181450303687588034538194601792263670183150782564263121600 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (8, 1), (9, 1), (13, 1), (15, 3)],
  term ((-255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (9, 1), (14, 1)],
  term ((-29929419024 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-42975324258488247316445416968434033253487684972942578135398972429870700 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (8, 1), (9, 1), (15, 2)],
  term ((-16157013546240 : Rat) / 275754830051) [(1, 1), (6, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3868475940 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((-255286875422723786400 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (10, 1), (11, 1)],
  term ((1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-29929419024 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1609819683488455774519697977467831255999216659694143053039920 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (10, 1), (11, 2), (15, 1)],
  term ((-31555161817310374308 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (11, 1)],
  term ((-2009870599815060013758066178841924550068360861596036244429280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 1), (15, 2)],
  term ((7482354756 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (11, 2), (15, 1)],
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 1), (13, 1), (15, 2)],
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 1), (15, 1)],
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 2), (11, 1)],
  term ((502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 2), (11, 1), (15, 2)],
  term ((-14964709512 : Rat) / 151763803) [(1, 1), (6, 2), (8, 2), (11, 1), (16, 1)],
  term ((-804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 2), (11, 2), (15, 1)],
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (8, 2), (13, 1), (15, 2)],
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 2), (8, 2), (15, 1)],
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 2), (8, 2), (15, 1), (16, 1)],
  term ((24022068973512879723 : Rat) / 259001945121800951) [(1, 1), (6, 2), (9, 1)],
  term ((-63821718855680946600 : Rat) / 259001945121800951) [(1, 1), (6, 2), (9, 1), (10, 1)],
  term ((-402454920872113943629924494366957813999804164923535763259980 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((251233824976882501719758272355240568758545107699504530553660 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-7482354756 : Rat) / 151763803) [(1, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((445436319863636590746027785590117726182675330714012185958780 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (11, 1), (15, 1)],
  term ((-144984245648089289672629988540526790880971935746311375275924000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (6, 2), (9, 1), (11, 1), (15, 3)],
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-100304718592792364831030453758127627541897471798672175923420 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (9, 1), (13, 1), (15, 1)],
  term ((-45738590725151843794017269097300896131835091575391282131560800 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (6, 2), (9, 1), (13, 1), (15, 3)],
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 2), (9, 1), (14, 1)],
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((21487662129244123658222708484217016626743842486471289067699486214935350 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (6, 2), (9, 1), (15, 2)],
  term ((8078506773120 : Rat) / 275754830051) [(1, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((1934237970 : Rat) / 151763803) [(1, 1), (6, 2), (9, 1), (16, 1)],
  term ((127643437711361893200 : Rat) / 259001945121800951) [(1, 1), (6, 2), (10, 1), (11, 1)],
  term ((-502467649953765003439516544710481137517090215399009061107320 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((14964709512 : Rat) / 151763803) [(1, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((804909841744227887259848988733915627999608329847071526519960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (10, 1), (11, 2), (15, 1)],
  term ((47688440336495660454 : Rat) / 259001945121800951) [(1, 1), (6, 2), (11, 1)],
  term ((1004935299907530006879033089420962275034180430798018122214640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (6, 2), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 700 through 799. -/
theorem ep_Q2_041_block_18_0700_0799_valid :
    checkProductSumEq ep_Q2_041_partials_18_0700_0799
      ep_Q2_041_block_18_0700_0799 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
