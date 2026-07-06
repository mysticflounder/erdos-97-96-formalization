/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_041, term block 18:1000-1099

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_041`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2041TermShards

/-- Generator polynomial 18 for endpoint certificate `ep_Q2_041`. -/
def ep_Q2_041_generator_18_1000_1099 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(8, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1000 : Poly :=
[
  term ((183098420431076158946640678565709974452048997479253679186640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)]
]

/-- Partial product 1000 for generator 18. -/
def ep_Q2_041_partial_18_1000 : Poly :=
[
  term ((-183098420431076158946640678565709974452048997479253679186640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((366196840862152317893281357131419948904097994958507358373280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (12, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 18. -/
theorem ep_Q2_041_partial_18_1000_valid :
    mulPoly ep_Q2_041_coefficient_18_1000
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1001 : Poly :=
[
  term ((1627194213394870392743744173327491971634384616751676110710880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)]
]

/-- Partial product 1001 for generator 18. -/
def ep_Q2_041_partial_18_1001 : Poly :=
[
  term ((-1627194213394870392743744173327491971634384616751676110710880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (12, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 18. -/
theorem ep_Q2_041_partial_18_1001_valid :
    mulPoly ep_Q2_041_coefficient_18_1001
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1002 : Poly :=
[
  term ((-3987335360 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 2), (16, 1)]
]

/-- Partial product 1002 for generator 18. -/
def ep_Q2_041_partial_18_1002 : Poly :=
[
  term ((3987335360 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((-7974670720 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (12, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 18. -/
theorem ep_Q2_041_partial_18_1002_valid :
    mulPoly ep_Q2_041_coefficient_18_1002
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1003 : Poly :=
[
  term ((-1143209950064463863371820583550111757945768539506354119120419523226831107 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1003 for generator 18. -/
def ep_Q2_041_partial_18_1003 : Poly :=
[
  term ((1143209950064463863371820583550111757945768539506354119120419523226831107 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2286419900128927726743641167100223515891537079012708238240839046453662214 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (11, 1), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 18. -/
theorem ep_Q2_041_partial_18_1003_valid :
    mulPoly ep_Q2_041_coefficient_18_1003
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1004 : Poly :=
[
  term ((-32197465004992 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1004 for generator 18. -/
def ep_Q2_041_partial_18_1004 : Poly :=
[
  term ((32197465004992 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-64394930009984 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 18. -/
theorem ep_Q2_041_partial_18_1004_valid :
    mulPoly ep_Q2_041_coefficient_18_1004
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1005 : Poly :=
[
  term ((-6635592667531340159052303061722145775337176015003779847538488880 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 3)]
]

/-- Partial product 1005 for generator 18. -/
def ep_Q2_041_partial_18_1005 : Poly :=
[
  term ((6635592667531340159052303061722145775337176015003779847538488880 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-13271185335062680318104606123444291550674352030007559695076977760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (11, 1), (13, 1), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 18. -/
theorem ep_Q2_041_partial_18_1005_valid :
    mulPoly ep_Q2_041_coefficient_18_1005
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1006 : Poly :=
[
  term ((42601803529532176432830355588394079501204161258236275108720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

/-- Partial product 1006 for generator 18. -/
def ep_Q2_041_partial_18_1006 : Poly :=
[
  term ((-42601803529532176432830355588394079501204161258236275108720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((85203607059064352865660711176788159002408322516472550217440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 18. -/
theorem ep_Q2_041_partial_18_1006_valid :
    mulPoly ep_Q2_041_coefficient_18_1006
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1007 : Poly :=
[
  term ((-1017551449675652057938209942723379430655618359591964226142269003567093385 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 1007 for generator 18. -/
def ep_Q2_041_partial_18_1007 : Poly :=
[
  term ((1017551449675652057938209942723379430655618359591964226142269003567093385 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2035102899351304115876419885446758861311236719183928452284538007134186770 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 18. -/
theorem ep_Q2_041_partial_18_1007_valid :
    mulPoly ep_Q2_041_coefficient_18_1007
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1008 : Poly :=
[
  term ((18213016214588 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1008 for generator 18. -/
def ep_Q2_041_partial_18_1008 : Poly :=
[
  term ((-18213016214588 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((36426032429176 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 18. -/
theorem ep_Q2_041_partial_18_1008_valid :
    mulPoly ep_Q2_041_coefficient_18_1008
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1009 : Poly :=
[
  term ((-7437369047706614652491622875298796186249373006118933556911186480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3)]
]

/-- Partial product 1009 for generator 18. -/
def ep_Q2_041_partial_18_1009 : Poly :=
[
  term ((7437369047706614652491622875298796186249373006118933556911186480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((-14874738095413229304983245750597592372498746012237867113822372960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 18. -/
theorem ep_Q2_041_partial_18_1009_valid :
    mulPoly ep_Q2_041_coefficient_18_1009
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1010 : Poly :=
[
  term ((-18243158139407848512 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (13, 2)]
]

/-- Partial product 1010 for generator 18. -/
def ep_Q2_041_partial_18_1010 : Poly :=
[
  term ((18243158139407848512 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((-36486316278815697024 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 18. -/
theorem ep_Q2_041_partial_18_1010_valid :
    mulPoly ep_Q2_041_coefficient_18_1010
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1011 : Poly :=
[
  term ((463300203582045152836 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)]
]

/-- Partial product 1011 for generator 18. -/
def ep_Q2_041_partial_18_1011 : Poly :=
[
  term ((-463300203582045152836 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((926600407164090305672 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 18. -/
theorem ep_Q2_041_partial_18_1011_valid :
    mulPoly ep_Q2_041_coefficient_18_1011
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1012 : Poly :=
[
  term ((-793803921030301529071484264641938908334596031987915408699471780 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 2)]
]

/-- Partial product 1012 for generator 18. -/
def ep_Q2_041_partial_18_1012 : Poly :=
[
  term ((793803921030301529071484264641938908334596031987915408699471780 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-1587607842060603058142968529283877816669192063975830817398943560 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (11, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 18. -/
theorem ep_Q2_041_partial_18_1012_valid :
    mulPoly ep_Q2_041_coefficient_18_1012
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1013 : Poly :=
[
  term ((32621220160 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1013 for generator 18. -/
def ep_Q2_041_partial_18_1013 : Poly :=
[
  term ((-32621220160 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((65242440320 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 18. -/
theorem ep_Q2_041_partial_18_1013_valid :
    mulPoly ep_Q2_041_coefficient_18_1013
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1014 : Poly :=
[
  term ((544666444261608887394964665295023750847566039774321281791156320 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (11, 1), (13, 2), (15, 2)]
]

/-- Partial product 1014 for generator 18. -/
def ep_Q2_041_partial_18_1014 : Poly :=
[
  term ((-544666444261608887394964665295023750847566039774321281791156320 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((1089332888523217774789929330590047501695132079548642563582312640 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 2), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 18. -/
theorem ep_Q2_041_partial_18_1014_valid :
    mulPoly ep_Q2_041_coefficient_18_1014
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1015 : Poly :=
[
  term ((-1284510720 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 1015 for generator 18. -/
def ep_Q2_041_partial_18_1015 : Poly :=
[
  term ((1284510720 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2569021440 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 18. -/
theorem ep_Q2_041_partial_18_1015_valid :
    mulPoly ep_Q2_041_coefficient_18_1015
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1016 : Poly :=
[
  term ((-9797748836815995545242956771144257431538121051399222007173040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 3), (14, 1), (15, 1)]
]

/-- Partial product 1016 for generator 18. -/
def ep_Q2_041_partial_18_1016 : Poly :=
[
  term ((9797748836815995545242956771144257431538121051399222007173040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((-19595497673631991090485913542288514863076242102798444014346080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 18. -/
theorem ep_Q2_041_partial_18_1016_valid :
    mulPoly ep_Q2_041_coefficient_18_1016
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1017 : Poly :=
[
  term ((2008341552158899468014745553759136883962657758182405116529200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 3), (15, 1)]
]

/-- Partial product 1017 for generator 18. -/
def ep_Q2_041_partial_18_1017 : Poly :=
[
  term ((-2008341552158899468014745553759136883962657758182405116529200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((4016683104317798936029491107518273767925315516364810233058400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 18. -/
theorem ep_Q2_041_partial_18_1017_valid :
    mulPoly ep_Q2_041_coefficient_18_1017
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1018 : Poly :=
[
  term ((-209148029463012572043 : Rat) / 518003890243601902) [(1, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 1018 for generator 18. -/
def ep_Q2_041_partial_18_1018 : Poly :=
[
  term ((209148029463012572043 : Rat) / 518003890243601902) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((-209148029463012572043 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 18. -/
theorem ep_Q2_041_partial_18_1018_valid :
    mulPoly ep_Q2_041_coefficient_18_1018
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1019 : Poly :=
[
  term ((3958708716292144429324340714086723809918279134714973414981139397016325235 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)]
]

/-- Partial product 1019 for generator 18. -/
def ep_Q2_041_partial_18_1019 : Poly :=
[
  term ((-3958708716292144429324340714086723809918279134714973414981139397016325235 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((3958708716292144429324340714086723809918279134714973414981139397016325235 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (11, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 18. -/
theorem ep_Q2_041_partial_18_1019_valid :
    mulPoly ep_Q2_041_coefficient_18_1019
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1020 : Poly :=
[
  term ((12758555295696 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1020 for generator 18. -/
def ep_Q2_041_partial_18_1020 : Poly :=
[
  term ((-12758555295696 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((25517110591392 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 18. -/
theorem ep_Q2_041_partial_18_1020_valid :
    mulPoly ep_Q2_041_coefficient_18_1020
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1021 : Poly :=
[
  term ((503775505403144821955082842897916855474685818713572056437145800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 4)]
]

/-- Partial product 1021 for generator 18. -/
def ep_Q2_041_partial_18_1021 : Poly :=
[
  term ((-503775505403144821955082842897916855474685818713572056437145800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 4)],
  term ((1007551010806289643910165685795833710949371637427144112874291600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 1), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 18. -/
theorem ep_Q2_041_partial_18_1021_valid :
    mulPoly ep_Q2_041_coefficient_18_1021
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1022 : Poly :=
[
  term ((-1343248917 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 1022 for generator 18. -/
def ep_Q2_041_partial_18_1022 : Poly :=
[
  term ((1343248917 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2686497834 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 18. -/
theorem ep_Q2_041_partial_18_1022_valid :
    mulPoly ep_Q2_041_coefficient_18_1022
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1023 : Poly :=
[
  term ((-44645051420443739075 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (14, 2)]
]

/-- Partial product 1023 for generator 18. -/
def ep_Q2_041_partial_18_1023 : Poly :=
[
  term ((44645051420443739075 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (14, 2)],
  term ((-89290102840887478150 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 18. -/
theorem ep_Q2_041_partial_18_1023_valid :
    mulPoly ep_Q2_041_coefficient_18_1023
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1024 : Poly :=
[
  term ((-28012199459789503001272374708189139368292253089819832181060 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (11, 1), (14, 2), (15, 2)]
]

/-- Partial product 1024 for generator 18. -/
def ep_Q2_041_partial_18_1024 : Poly :=
[
  term ((28012199459789503001272374708189139368292253089819832181060 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((-56024398919579006002544749416378278736584506179639664362120 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 2), (11, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 18. -/
theorem ep_Q2_041_partial_18_1024_valid :
    mulPoly ep_Q2_041_coefficient_18_1024
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1025 : Poly :=
[
  term ((-6619585454 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)]
]

/-- Partial product 1025 for generator 18. -/
def ep_Q2_041_partial_18_1025 : Poly :=
[
  term ((6619585454 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-13239170908 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 18. -/
theorem ep_Q2_041_partial_18_1025_valid :
    mulPoly ep_Q2_041_coefficient_18_1025
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1026 : Poly :=
[
  term ((132296664317538027373249797099175214256560679701594891225929526430272953 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (15, 2)]
]

/-- Partial product 1026 for generator 18. -/
def ep_Q2_041_partial_18_1026 : Poly :=
[
  term ((-132296664317538027373249797099175214256560679701594891225929526430272953 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((264593328635076054746499594198350428513121359403189782451859052860545906 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 18. -/
theorem ep_Q2_041_partial_18_1026_valid :
    mulPoly ep_Q2_041_coefficient_18_1026
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1027 : Poly :=
[
  term ((-30981962503400 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 1027 for generator 18. -/
def ep_Q2_041_partial_18_1027 : Poly :=
[
  term ((30981962503400 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-61963925006800 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 18. -/
theorem ep_Q2_041_partial_18_1027_valid :
    mulPoly ep_Q2_041_coefficient_18_1027
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1028 : Poly :=
[
  term ((13649001810197914516293926607130641026338131954434187050396020 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (15, 4)]
]

/-- Partial product 1028 for generator 18. -/
def ep_Q2_041_partial_18_1028 : Poly :=
[
  term ((-13649001810197914516293926607130641026338131954434187050396020 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (15, 4)],
  term ((27298003620395829032587853214261282052676263908868374100792040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 18. -/
theorem ep_Q2_041_partial_18_1028_valid :
    mulPoly ep_Q2_041_coefficient_18_1028
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1029 : Poly :=
[
  term ((5788375401 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 1029 for generator 18. -/
def ep_Q2_041_partial_18_1029 : Poly :=
[
  term ((-5788375401 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((11576750802 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 18. -/
theorem ep_Q2_041_partial_18_1029_valid :
    mulPoly ep_Q2_041_coefficient_18_1029
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1030 : Poly :=
[
  term ((-1392596184373973255487865277044305670481628261627191109496541840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1030 for generator 18. -/
def ep_Q2_041_partial_18_1030 : Poly :=
[
  term ((1392596184373973255487865277044305670481628261627191109496541840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-2785192368747946510975730554088611340963256523254382218993083680 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (11, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 18. -/
theorem ep_Q2_041_partial_18_1030_valid :
    mulPoly ep_Q2_041_coefficient_18_1030
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1031 : Poly :=
[
  term ((-5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1031 for generator 18. -/
def ep_Q2_041_partial_18_1031 : Poly :=
[
  term ((5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 2), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 18. -/
theorem ep_Q2_041_partial_18_1031_valid :
    mulPoly ep_Q2_041_coefficient_18_1031
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1032 : Poly :=
[
  term ((3523348686384651239471462421942523275622322474226476599896040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1032 for generator 18. -/
def ep_Q2_041_partial_18_1032 : Poly :=
[
  term ((-3523348686384651239471462421942523275622322474226476599896040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((7046697372769302478942924843885046551244644948452953199792080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 18. -/
theorem ep_Q2_041_partial_18_1032_valid :
    mulPoly ep_Q2_041_coefficient_18_1032
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1033 : Poly :=
[
  term ((-591853845814945483233294281967006595482968538858854626116579738493240625 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 1033 for generator 18. -/
def ep_Q2_041_partial_18_1033 : Poly :=
[
  term ((591853845814945483233294281967006595482968538858854626116579738493240625 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-591853845814945483233294281967006595482968538858854626116579738493240625 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 18. -/
theorem ep_Q2_041_partial_18_1033_valid :
    mulPoly ep_Q2_041_coefficient_18_1033
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1034 : Poly :=
[
  term ((7265669363232 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1034 for generator 18. -/
def ep_Q2_041_partial_18_1034 : Poly :=
[
  term ((-7265669363232 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((14531338726464 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 18. -/
theorem ep_Q2_041_partial_18_1034_valid :
    mulPoly ep_Q2_041_coefficient_18_1034
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1035 : Poly :=
[
  term ((-32397714150992791889809911019549813764760395518620196203632400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 3)]
]

/-- Partial product 1035 for generator 18. -/
def ep_Q2_041_partial_18_1035 : Poly :=
[
  term ((32397714150992791889809911019549813764760395518620196203632400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 3)],
  term ((-64795428301985583779619822039099627529520791037240392407264800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 18. -/
theorem ep_Q2_041_partial_18_1035_valid :
    mulPoly ep_Q2_041_coefficient_18_1035
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1036 : Poly :=
[
  term ((-1627194213394870392743744173327491971634384616751676110710880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 2), (15, 1)]
]

/-- Partial product 1036 for generator 18. -/
def ep_Q2_041_partial_18_1036 : Poly :=
[
  term ((1627194213394870392743744173327491971634384616751676110710880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((-3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 18. -/
theorem ep_Q2_041_partial_18_1036_valid :
    mulPoly ep_Q2_041_coefficient_18_1036
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1037 : Poly :=
[
  term ((-4750822432137460550 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 2), (13, 1)]
]

/-- Partial product 1037 for generator 18. -/
def ep_Q2_041_partial_18_1037 : Poly :=
[
  term ((4750822432137460550 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((-9501644864274921100 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 18. -/
theorem ep_Q2_041_partial_18_1037_valid :
    mulPoly ep_Q2_041_coefficient_18_1037
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1038 : Poly :=
[
  term ((20523552906833829576 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1)]
]

/-- Partial product 1038 for generator 18. -/
def ep_Q2_041_partial_18_1038 : Poly :=
[
  term ((-20523552906833829576 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 18. -/
theorem ep_Q2_041_partial_18_1038_valid :
    mulPoly ep_Q2_041_coefficient_18_1038
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1039 : Poly :=
[
  term ((5829223064919177163237072297961204521771597931750953526588944020 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1039 for generator 18. -/
def ep_Q2_041_partial_18_1039 : Poly :=
[
  term ((-5829223064919177163237072297961204521771597931750953526588944020 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((11658446129838354326474144595922409043543195863501907053177888040 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (11, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 18. -/
theorem ep_Q2_041_partial_18_1039_valid :
    mulPoly ep_Q2_041_coefficient_18_1039
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1040 : Poly :=
[
  term ((1445074560 : Rat) / 151763803) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1040 for generator 18. -/
def ep_Q2_041_partial_18_1040 : Poly :=
[
  term ((-1445074560 : Rat) / 151763803) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (8, 2), (11, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 18. -/
theorem ep_Q2_041_partial_18_1040_valid :
    mulPoly ep_Q2_041_coefficient_18_1040
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1041 : Poly :=
[
  term ((-1198827534716140116491354875326456702923944804494347268256617240 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (11, 2), (13, 1), (15, 2)]
]

/-- Partial product 1041 for generator 18. -/
def ep_Q2_041_partial_18_1041 : Poly :=
[
  term ((1198827534716140116491354875326456702923944804494347268256617240 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((-2397655069432280232982709750652913405847889608988694536513234480 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 2), (11, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 18. -/
theorem ep_Q2_041_partial_18_1041_valid :
    mulPoly ep_Q2_041_coefficient_18_1041
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1042 : Poly :=
[
  term ((-334508000 : Rat) / 151763803) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 1042 for generator 18. -/
def ep_Q2_041_partial_18_1042 : Poly :=
[
  term ((334508000 : Rat) / 151763803) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((-669016000 : Rat) / 151763803) [(1, 1), (8, 2), (11, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 18. -/
theorem ep_Q2_041_partial_18_1042_valid :
    mulPoly ep_Q2_041_coefficient_18_1042
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1043 : Poly :=
[
  term ((13246056586745428833365809064722579696657075180915526713291840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1043 for generator 18. -/
def ep_Q2_041_partial_18_1043 : Poly :=
[
  term ((-13246056586745428833365809064722579696657075180915526713291840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((26492113173490857666731618129445159393314150361831053426583680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 18. -/
theorem ep_Q2_041_partial_18_1043_valid :
    mulPoly ep_Q2_041_coefficient_18_1043
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1044 : Poly :=
[
  term ((-508836187836008905133333636494283489649663417017381089424760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (13, 2), (15, 1)]
]

/-- Partial product 1044 for generator 18. -/
def ep_Q2_041_partial_18_1044 : Poly :=
[
  term ((508836187836008905133333636494283489649663417017381089424760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (13, 2), (15, 1)],
  term ((-1017672375672017810266667272988566979299326834034762178849520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 18. -/
theorem ep_Q2_041_partial_18_1044_valid :
    mulPoly ep_Q2_041_coefficient_18_1044
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1045 : Poly :=
[
  term ((-4390514355870315137932946426718071574356584685782309415312482145702513025 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 1045 for generator 18. -/
def ep_Q2_041_partial_18_1045 : Poly :=
[
  term ((4390514355870315137932946426718071574356584685782309415312482145702513025 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((-4390514355870315137932946426718071574356584685782309415312482145702513025 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (11, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 18. -/
theorem ep_Q2_041_partial_18_1045_valid :
    mulPoly ep_Q2_041_coefficient_18_1045
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1046 : Poly :=
[
  term ((34769992886160 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1046 for generator 18. -/
def ep_Q2_041_partial_18_1046 : Poly :=
[
  term ((-34769992886160 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((69539985772320 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 18. -/
theorem ep_Q2_041_partial_18_1046_valid :
    mulPoly ep_Q2_041_coefficient_18_1046
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1047 : Poly :=
[
  term ((-32710951718751009490954481982446013621602001552640004730463100 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 3)]
]

/-- Partial product 1047 for generator 18. -/
def ep_Q2_041_partial_18_1047 : Poly :=
[
  term ((32710951718751009490954481982446013621602001552640004730463100 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 3)],
  term ((-65421903437502018981908963964892027243204003105280009460926200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 2), (11, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 18. -/
theorem ep_Q2_041_partial_18_1047_valid :
    mulPoly ep_Q2_041_coefficient_18_1047
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1048 : Poly :=
[
  term ((87386371937271468229681736494331097313799937766318849927440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (14, 2), (15, 1)]
]

/-- Partial product 1048 for generator 18. -/
def ep_Q2_041_partial_18_1048 : Poly :=
[
  term ((-87386371937271468229681736494331097313799937766318849927440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (14, 2), (15, 1)],
  term ((174772743874542936459363472988662194627599875532637699854880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 18. -/
theorem ep_Q2_041_partial_18_1048_valid :
    mulPoly ep_Q2_041_coefficient_18_1048
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1049 : Poly :=
[
  term ((894728263354175887616311818352871700792566536592300877167781201724279344 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 2), (15, 1)]
]

/-- Partial product 1049 for generator 18. -/
def ep_Q2_041_partial_18_1049 : Poly :=
[
  term ((-894728263354175887616311818352871700792566536592300877167781201724279344 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((1789456526708351775232623636705743401585133073184601754335562403448558688 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 18. -/
theorem ep_Q2_041_partial_18_1049_valid :
    mulPoly ep_Q2_041_coefficient_18_1049
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1050 : Poly :=
[
  term ((-3657639684080 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 1050 for generator 18. -/
def ep_Q2_041_partial_18_1050 : Poly :=
[
  term ((3657639684080 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-7315279368160 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 18. -/
theorem ep_Q2_041_partial_18_1050_valid :
    mulPoly ep_Q2_041_coefficient_18_1050
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1051 : Poly :=
[
  term ((590340281785744531255476363866189677393075443757949957710062540 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 2), (15, 3)]
]

/-- Partial product 1051 for generator 18. -/
def ep_Q2_041_partial_18_1051 : Poly :=
[
  term ((-590340281785744531255476363866189677393075443757949957710062540 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 2), (15, 3)],
  term ((1180680563571489062510952727732379354786150887515899915420125080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 18. -/
theorem ep_Q2_041_partial_18_1051_valid :
    mulPoly ep_Q2_041_coefficient_18_1051
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1052 : Poly :=
[
  term ((-130396324635349441390754255125646626119491426161960292454951400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (12, 1), (15, 2)]
]

/-- Partial product 1052 for generator 18. -/
def ep_Q2_041_partial_18_1052 : Poly :=
[
  term ((130396324635349441390754255125646626119491426161960292454951400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (12, 1), (15, 2)],
  term ((-260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 3), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 18. -/
theorem ep_Q2_041_partial_18_1052_valid :
    mulPoly ep_Q2_041_coefficient_18_1052
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1053 : Poly :=
[
  term ((589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 3), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 1053 for generator 18. -/
def ep_Q2_041_partial_18_1053 : Poly :=
[
  term ((-589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 3), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 18. -/
theorem ep_Q2_041_partial_18_1053_valid :
    mulPoly ep_Q2_041_coefficient_18_1053
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1054 : Poly :=
[
  term ((-136509581660643489324139611856333219096844347042925848214000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 3), (13, 1), (15, 1)]
]

/-- Partial product 1054 for generator 18. -/
def ep_Q2_041_partial_18_1054 : Poly :=
[
  term ((136509581660643489324139611856333219096844347042925848214000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 3), (13, 1), (15, 1)],
  term ((-273019163321286978648279223712666438193688694085851696428000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 18. -/
theorem ep_Q2_041_partial_18_1054_valid :
    mulPoly ep_Q2_041_coefficient_18_1054
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1055 : Poly :=
[
  term ((-624013983198334921137291725369643857665170877772318558093444500 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (14, 1), (15, 2)]
]

/-- Partial product 1055 for generator 18. -/
def ep_Q2_041_partial_18_1055 : Poly :=
[
  term ((624013983198334921137291725369643857665170877772318558093444500 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (14, 1), (15, 2)],
  term ((-1248027966396669842274583450739287715330341755544637116186889000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 18. -/
theorem ep_Q2_041_partial_18_1055_valid :
    mulPoly ep_Q2_041_coefficient_18_1055
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1056 : Poly :=
[
  term ((133676261920204998742149039273158358008878312933385009662628640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (15, 2)]
]

/-- Partial product 1056 for generator 18. -/
def ep_Q2_041_partial_18_1056 : Poly :=
[
  term ((-133676261920204998742149039273158358008878312933385009662628640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (15, 2)],
  term ((267352523840409997484298078546316716017756625866770019325257280 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 18. -/
theorem ep_Q2_041_partial_18_1056_valid :
    mulPoly ep_Q2_041_coefficient_18_1056
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1057 : Poly :=
[
  term ((40185124441471888453 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 1057 for generator 18. -/
def ep_Q2_041_partial_18_1057 : Poly :=
[
  term ((-40185124441471888453 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((80370248882943776906 : Rat) / 259001945121800951) [(1, 1), (8, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 18. -/
theorem ep_Q2_041_partial_18_1057_valid :
    mulPoly ep_Q2_041_coefficient_18_1057
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1058 : Poly :=
[
  term ((-56629803391078529756 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 1058 for generator 18. -/
def ep_Q2_041_partial_18_1058 : Poly :=
[
  term ((56629803391078529756 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 18. -/
theorem ep_Q2_041_partial_18_1058_valid :
    mulPoly ep_Q2_041_coefficient_18_1058
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1059 : Poly :=
[
  term ((181884673058417871422822972015796469356294110692667092614840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1059 for generator 18. -/
def ep_Q2_041_partial_18_1059 : Poly :=
[
  term ((-181884673058417871422822972015796469356294110692667092614840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((363769346116835742845645944031592938712588221385334185229680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 18. -/
theorem ep_Q2_041_partial_18_1059_valid :
    mulPoly ep_Q2_041_coefficient_18_1059
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1060 : Poly :=
[
  term ((-3987335360 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1060 for generator 18. -/
def ep_Q2_041_partial_18_1060 : Poly :=
[
  term ((3987335360 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7974670720 : Rat) / 151763803) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 18. -/
theorem ep_Q2_041_partial_18_1060_valid :
    mulPoly ep_Q2_041_coefficient_18_1060
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1061 : Poly :=
[
  term ((-3933736658017723993854124164620405710421300585804488952042292401557554777 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)]
]

/-- Partial product 1061 for generator 18. -/
def ep_Q2_041_partial_18_1061 : Poly :=
[
  term ((3933736658017723993854124164620405710421300585804488952042292401557554777 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3933736658017723993854124164620405710421300585804488952042292401557554777 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (12, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 18. -/
theorem ep_Q2_041_partial_18_1061_valid :
    mulPoly ep_Q2_041_coefficient_18_1061
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1062 : Poly :=
[
  term ((10022926526608 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1062 for generator 18. -/
def ep_Q2_041_partial_18_1062 : Poly :=
[
  term ((-10022926526608 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((20045853053216 : Rat) / 275754830051) [(1, 1), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 18. -/
theorem ep_Q2_041_partial_18_1062_valid :
    mulPoly ep_Q2_041_coefficient_18_1062
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1063 : Poly :=
[
  term ((17716645481501717272065331085528587853534888866393845393552100 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 4)]
]

/-- Partial product 1063 for generator 18. -/
def ep_Q2_041_partial_18_1063 : Poly :=
[
  term ((-17716645481501717272065331085528587853534888866393845393552100 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 4)],
  term ((35433290963003434544130662171057175707069777732787690787104200 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 2), (12, 1), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 18. -/
theorem ep_Q2_041_partial_18_1063_valid :
    mulPoly ep_Q2_041_coefficient_18_1063
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1064 : Poly :=
[
  term ((1957066672 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1064 for generator 18. -/
def ep_Q2_041_partial_18_1064 : Poly :=
[
  term ((-1957066672 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((3914133344 : Rat) / 151763803) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 18. -/
theorem ep_Q2_041_partial_18_1064_valid :
    mulPoly ep_Q2_041_coefficient_18_1064
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1065 : Poly :=
[
  term ((183098420431076158946640678565709974452048997479253679186640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1065 for generator 18. -/
def ep_Q2_041_partial_18_1065 : Poly :=
[
  term ((-183098420431076158946640678565709974452048997479253679186640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((366196840862152317893281357131419948904097994958507358373280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (12, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 18. -/
theorem ep_Q2_041_partial_18_1065_valid :
    mulPoly ep_Q2_041_coefficient_18_1065
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1066 : Poly :=
[
  term ((3775489045481141534003113193534450316318977507664155213746406176401470 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1)]
]

/-- Partial product 1066 for generator 18. -/
def ep_Q2_041_partial_18_1066 : Poly :=
[
  term ((-3775489045481141534003113193534450316318977507664155213746406176401470 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((7550978090962283068006226387068900632637955015328310427492812352802940 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 2), (12, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 18. -/
theorem ep_Q2_041_partial_18_1066_valid :
    mulPoly ep_Q2_041_coefficient_18_1066
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1067 : Poly :=
[
  term ((20338086400 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1067 for generator 18. -/
def ep_Q2_041_partial_18_1067 : Poly :=
[
  term ((-20338086400 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((40676172800 : Rat) / 151763803) [(1, 1), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 18. -/
theorem ep_Q2_041_partial_18_1067_valid :
    mulPoly ep_Q2_041_coefficient_18_1067
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1068 : Poly :=
[
  term ((174239880297008419299635552589053234965439936535960403931378340 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 3)]
]

/-- Partial product 1068 for generator 18. -/
def ep_Q2_041_partial_18_1068 : Poly :=
[
  term ((-174239880297008419299635552589053234965439936535960403931378340 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 3)],
  term ((348479760594016838599271105178106469930879873071920807862756680 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (12, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 18. -/
theorem ep_Q2_041_partial_18_1068_valid :
    mulPoly ep_Q2_041_coefficient_18_1068
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1069 : Poly :=
[
  term ((-933924829044415307378838360469393158278907638149213397193600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 3), (15, 2)]
]

/-- Partial product 1069 for generator 18. -/
def ep_Q2_041_partial_18_1069 : Poly :=
[
  term ((933924829044415307378838360469393158278907638149213397193600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 3), (15, 2)],
  term ((-1867849658088830614757676720938786316557815276298426794387200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (12, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 18. -/
theorem ep_Q2_041_partial_18_1069_valid :
    mulPoly ep_Q2_041_coefficient_18_1069
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1070 : Poly :=
[
  term ((-14784322770198856307 : Rat) / 37000277874542993) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 1070 for generator 18. -/
def ep_Q2_041_partial_18_1070 : Poly :=
[
  term ((14784322770198856307 : Rat) / 37000277874542993) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-29568645540397712614 : Rat) / 37000277874542993) [(1, 1), (8, 2), (12, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 18. -/
theorem ep_Q2_041_partial_18_1070_valid :
    mulPoly ep_Q2_041_coefficient_18_1070
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1071 : Poly :=
[
  term ((-9613848770 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1071 for generator 18. -/
def ep_Q2_041_partial_18_1071 : Poly :=
[
  term ((9613848770 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19227697540 : Rat) / 151763803) [(1, 1), (8, 2), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 18. -/
theorem ep_Q2_041_partial_18_1071_valid :
    mulPoly ep_Q2_041_coefficient_18_1071
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1072 : Poly :=
[
  term ((-19047008438862443630 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 1072 for generator 18. -/
def ep_Q2_041_partial_18_1072 : Poly :=
[
  term ((19047008438862443630 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-38094016877724887260 : Rat) / 259001945121800951) [(1, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 18. -/
theorem ep_Q2_041_partial_18_1072_valid :
    mulPoly ep_Q2_041_coefficient_18_1072
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1073 : Poly :=
[
  term ((590755194 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1073 for generator 18. -/
def ep_Q2_041_partial_18_1073 : Poly :=
[
  term ((-590755194 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((1181510388 : Rat) / 151763803) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 18. -/
theorem ep_Q2_041_partial_18_1073_valid :
    mulPoly ep_Q2_041_coefficient_18_1073
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1074 : Poly :=
[
  term ((-33292612311359722458110492774928834403164842371014157753040561974992425 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (8, 1), (12, 1), (15, 3)]
]

/-- Partial product 1074 for generator 18. -/
def ep_Q2_041_partial_18_1074 : Poly :=
[
  term ((33292612311359722458110492774928834403164842371014157753040561974992425 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((-33292612311359722458110492774928834403164842371014157753040561974992425 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (8, 2), (12, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 18. -/
theorem ep_Q2_041_partial_18_1074_valid :
    mulPoly ep_Q2_041_coefficient_18_1074
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1075 : Poly :=
[
  term ((-21904222840080 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)]
]

/-- Partial product 1075 for generator 18. -/
def ep_Q2_041_partial_18_1075 : Poly :=
[
  term ((21904222840080 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((-43808445680160 : Rat) / 275754830051) [(1, 1), (8, 2), (12, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 18. -/
theorem ep_Q2_041_partial_18_1075_valid :
    mulPoly ep_Q2_041_coefficient_18_1075
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1076 : Poly :=
[
  term ((-183098420431076158946640678565709974452048997479253679186640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 2)]
]

/-- Partial product 1076 for generator 18. -/
def ep_Q2_041_partial_18_1076 : Poly :=
[
  term ((183098420431076158946640678565709974452048997479253679186640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-366196840862152317893281357131419948904097994958507358373280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (12, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 18. -/
theorem ep_Q2_041_partial_18_1076_valid :
    mulPoly ep_Q2_041_coefficient_18_1076
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1077 : Poly :=
[
  term ((56629803391078529756 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 1077 for generator 18. -/
def ep_Q2_041_partial_18_1077 : Poly :=
[
  term ((-56629803391078529756 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (8, 2), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 18. -/
theorem ep_Q2_041_partial_18_1077_valid :
    mulPoly ep_Q2_041_coefficient_18_1077
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1078 : Poly :=
[
  term ((3987335360 : Rat) / 151763803) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)]
]

/-- Partial product 1078 for generator 18. -/
def ep_Q2_041_partial_18_1078 : Poly :=
[
  term ((-3987335360 : Rat) / 151763803) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((7974670720 : Rat) / 151763803) [(1, 1), (8, 2), (12, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 18. -/
theorem ep_Q2_041_partial_18_1078_valid :
    mulPoly ep_Q2_041_coefficient_18_1078
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1079 : Poly :=
[
  term ((-97269813895697037682 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 1)]
]

/-- Partial product 1079 for generator 18. -/
def ep_Q2_041_partial_18_1079 : Poly :=
[
  term ((97269813895697037682 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 1)],
  term ((-194539627791394075364 : Rat) / 259001945121800951) [(1, 1), (8, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 18. -/
theorem ep_Q2_041_partial_18_1079_valid :
    mulPoly ep_Q2_041_coefficient_18_1079
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1080 : Poly :=
[
  term ((3236564885418608531 : Rat) / 37000277874542993) [(1, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 1080 for generator 18. -/
def ep_Q2_041_partial_18_1080 : Poly :=
[
  term ((-3236564885418608531 : Rat) / 37000277874542993) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((6473129770837217062 : Rat) / 37000277874542993) [(1, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 18. -/
theorem ep_Q2_041_partial_18_1080_valid :
    mulPoly ep_Q2_041_coefficient_18_1080
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1081 : Poly :=
[
  term ((1829620561670320550643557292127625642362475420197537210535748821210355461 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)]
]

/-- Partial product 1081 for generator 18. -/
def ep_Q2_041_partial_18_1081 : Poly :=
[
  term ((-1829620561670320550643557292127625642362475420197537210535748821210355461 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((1829620561670320550643557292127625642362475420197537210535748821210355461 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (13, 1), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 18. -/
theorem ep_Q2_041_partial_18_1081_valid :
    mulPoly ep_Q2_041_coefficient_18_1081
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1081 := by
  native_decide

/-- Coefficient term 1082 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1082 : Poly :=
[
  term ((22088952122288 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1082 for generator 18. -/
def ep_Q2_041_partial_18_1082 : Poly :=
[
  term ((-22088952122288 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((44177904244576 : Rat) / 275754830051) [(1, 1), (8, 2), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1082 for generator 18. -/
theorem ep_Q2_041_partial_18_1082_valid :
    mulPoly ep_Q2_041_coefficient_18_1082
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1082 := by
  native_decide

/-- Coefficient term 1083 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1083 : Poly :=
[
  term ((158927485920913412787977288733769595263024524986344152542318360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 4)]
]

/-- Partial product 1083 for generator 18. -/
def ep_Q2_041_partial_18_1083 : Poly :=
[
  term ((-158927485920913412787977288733769595263024524986344152542318360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 4)],
  term ((317854971841826825575954577467539190526049049972688305084636720 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (13, 1), (14, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1083 for generator 18. -/
theorem ep_Q2_041_partial_18_1083_valid :
    mulPoly ep_Q2_041_coefficient_18_1083
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1083 := by
  native_decide

/-- Coefficient term 1084 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1084 : Poly :=
[
  term ((-1110412096 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1084 for generator 18. -/
def ep_Q2_041_partial_18_1084 : Poly :=
[
  term ((1110412096 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2220824192 : Rat) / 151763803) [(1, 1), (8, 2), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1084 for generator 18. -/
theorem ep_Q2_041_partial_18_1084_valid :
    mulPoly ep_Q2_041_coefficient_18_1084
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1084 := by
  native_decide

/-- Coefficient term 1085 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1085 : Poly :=
[
  term ((43706396304392267779 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 1), (14, 2)]
]

/-- Partial product 1085 for generator 18. -/
def ep_Q2_041_partial_18_1085 : Poly :=
[
  term ((-43706396304392267779 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((87412792608784535558 : Rat) / 259001945121800951) [(1, 1), (8, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1085 for generator 18. -/
theorem ep_Q2_041_partial_18_1085_valid :
    mulPoly ep_Q2_041_coefficient_18_1085
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1085 := by
  native_decide

/-- Coefficient term 1086 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1086 : Poly :=
[
  term ((114596712075453142539177216159853914012998238244611614549900 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 1), (14, 2), (15, 2)]
]

/-- Partial product 1086 for generator 18. -/
def ep_Q2_041_partial_18_1086 : Poly :=
[
  term ((-114596712075453142539177216159853914012998238244611614549900 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((229193424150906285078354432319707828025996476489223229099800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (13, 1), (14, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1086 for generator 18. -/
theorem ep_Q2_041_partial_18_1086_valid :
    mulPoly ep_Q2_041_coefficient_18_1086
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1086 := by
  native_decide

/-- Coefficient term 1087 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1087 : Poly :=
[
  term ((5378758734 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 1087 for generator 18. -/
def ep_Q2_041_partial_18_1087 : Poly :=
[
  term ((-5378758734 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((10757517468 : Rat) / 151763803) [(1, 1), (8, 2), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1087 for generator 18. -/
theorem ep_Q2_041_partial_18_1087_valid :
    mulPoly ep_Q2_041_coefficient_18_1087
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1087 := by
  native_decide

/-- Coefficient term 1088 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1088 : Poly :=
[
  term ((252947480982172091089165873564149436266828920945512491116297055608060141 : Rat) / 1076186845615932947433409840486166685838564635790707999209491315035772) [(1, 1), (8, 1), (13, 1), (15, 2)]
]

/-- Partial product 1088 for generator 18. -/
def ep_Q2_041_partial_18_1088 : Poly :=
[
  term ((-252947480982172091089165873564149436266828920945512491116297055608060141 : Rat) / 1076186845615932947433409840486166685838564635790707999209491315035772) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((252947480982172091089165873564149436266828920945512491116297055608060141 : Rat) / 538093422807966473716704920243083342919282317895353999604745657517886) [(1, 1), (8, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1088 for generator 18. -/
theorem ep_Q2_041_partial_18_1088_valid :
    mulPoly ep_Q2_041_coefficient_18_1088
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1088 := by
  native_decide

/-- Coefficient term 1089 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1089 : Poly :=
[
  term ((1468882280420 : Rat) / 11989340437) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1089 for generator 18. -/
def ep_Q2_041_partial_18_1089 : Poly :=
[
  term ((-1468882280420 : Rat) / 11989340437) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((2937764560840 : Rat) / 11989340437) [(1, 1), (8, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1089 for generator 18. -/
theorem ep_Q2_041_partial_18_1089_valid :
    mulPoly ep_Q2_041_coefficient_18_1089
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1089 := by
  native_decide

/-- Coefficient term 1090 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1090 : Poly :=
[
  term ((-46421044525350675928152687865425849734235864744837292884015380 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 1), (15, 4)]
]

/-- Partial product 1090 for generator 18. -/
def ep_Q2_041_partial_18_1090 : Poly :=
[
  term ((46421044525350675928152687865425849734235864744837292884015380 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 1), (15, 4)],
  term ((-92842089050701351856305375730851699468471729489674585768030760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (13, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1090 for generator 18. -/
theorem ep_Q2_041_partial_18_1090_valid :
    mulPoly ep_Q2_041_coefficient_18_1090
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1090 := by
  native_decide

/-- Coefficient term 1091 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1091 : Poly :=
[
  term ((-5176990454 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 1091 for generator 18. -/
def ep_Q2_041_partial_18_1091 : Poly :=
[
  term ((5176990454 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((-10353980908 : Rat) / 151763803) [(1, 1), (8, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1091 for generator 18. -/
theorem ep_Q2_041_partial_18_1091_valid :
    mulPoly ep_Q2_041_coefficient_18_1091
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1091 := by
  native_decide

/-- Coefficient term 1092 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1092 : Poly :=
[
  term ((-14821376026502728678103471266417500628017071439769578108422516719143380055 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 1)]
]

/-- Partial product 1092 for generator 18. -/
def ep_Q2_041_partial_18_1092 : Poly :=
[
  term ((14821376026502728678103471266417500628017071439769578108422516719143380055 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((-14821376026502728678103471266417500628017071439769578108422516719143380055 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1092 for generator 18. -/
theorem ep_Q2_041_partial_18_1092_valid :
    mulPoly ep_Q2_041_coefficient_18_1092
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1092 := by
  native_decide

/-- Coefficient term 1093 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1093 : Poly :=
[
  term ((-34967081044048 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1093 for generator 18. -/
def ep_Q2_041_partial_18_1093 : Poly :=
[
  term ((34967081044048 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-69934162088096 : Rat) / 275754830051) [(1, 1), (8, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1093 for generator 18. -/
theorem ep_Q2_041_partial_18_1093_valid :
    mulPoly ep_Q2_041_coefficient_18_1093
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1093 := by
  native_decide

/-- Coefficient term 1094 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1094 : Poly :=
[
  term ((-35763381041229827642326051339308997975293528457854153550365900 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 3)]
]

/-- Partial product 1094 for generator 18. -/
def ep_Q2_041_partial_18_1094 : Poly :=
[
  term ((35763381041229827642326051339308997975293528457854153550365900 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 3)],
  term ((-71526762082459655284652102678617995950587056915708307100731800 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 2), (13, 2), (14, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1094 for generator 18. -/
theorem ep_Q2_041_partial_18_1094_valid :
    mulPoly ep_Q2_041_coefficient_18_1094
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1094 := by
  native_decide

/-- Coefficient term 1095 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1095 : Poly :=
[
  term ((21833046898398157802721552441729464552914566538339720834080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 2), (14, 2), (15, 1)]
]

/-- Partial product 1095 for generator 18. -/
def ep_Q2_041_partial_18_1095 : Poly :=
[
  term ((-21833046898398157802721552441729464552914566538339720834080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 2), (14, 2), (15, 1)],
  term ((43666093796796315605443104883458929105829133076679441668160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1095 for generator 18. -/
theorem ep_Q2_041_partial_18_1095_valid :
    mulPoly ep_Q2_041_coefficient_18_1095
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1095 := by
  native_decide

/-- Coefficient term 1096 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1096 : Poly :=
[
  term ((-11547821057752654770769230352090303499176237518417207882965351020982403383 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (13, 2), (15, 1)]
]

/-- Partial product 1096 for generator 18. -/
def ep_Q2_041_partial_18_1096 : Poly :=
[
  term ((11547821057752654770769230352090303499176237518417207882965351020982403383 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((-11547821057752654770769230352090303499176237518417207882965351020982403383 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1096 for generator 18. -/
theorem ep_Q2_041_partial_18_1096_valid :
    mulPoly ep_Q2_041_coefficient_18_1096
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1096 := by
  native_decide

/-- Coefficient term 1097 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1097 : Poly :=
[
  term ((-71348627976672 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1097 for generator 18. -/
def ep_Q2_041_partial_18_1097 : Poly :=
[
  term ((71348627976672 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-142697255953344 : Rat) / 275754830051) [(1, 1), (8, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1097 for generator 18. -/
theorem ep_Q2_041_partial_18_1097_valid :
    mulPoly ep_Q2_041_coefficient_18_1097
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1097 := by
  native_decide

/-- Coefficient term 1098 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1098 : Poly :=
[
  term ((-20245662888081958159904305886935301074300510005238112536826860 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (13, 2), (15, 3)]
]

/-- Partial product 1098 for generator 18. -/
def ep_Q2_041_partial_18_1098 : Poly :=
[
  term ((20245662888081958159904305886935301074300510005238112536826860 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (13, 2), (15, 3)],
  term ((-40491325776163916319808611773870602148601020010476225073653720 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1098 for generator 18. -/
theorem ep_Q2_041_partial_18_1098_valid :
    mulPoly ep_Q2_041_coefficient_18_1098
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1098 := by
  native_decide

/-- Coefficient term 1099 from coefficient polynomial 18. -/
def ep_Q2_041_coefficient_18_1099 : Poly :=
[
  term ((9691677761560419522 : Rat) / 37000277874542993) [(1, 1), (8, 1), (13, 3)]
]

/-- Partial product 1099 for generator 18. -/
def ep_Q2_041_partial_18_1099 : Poly :=
[
  term ((-9691677761560419522 : Rat) / 37000277874542993) [(1, 1), (8, 1), (13, 3)],
  term ((19383355523120839044 : Rat) / 37000277874542993) [(1, 1), (8, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1099 for generator 18. -/
theorem ep_Q2_041_partial_18_1099_valid :
    mulPoly ep_Q2_041_coefficient_18_1099
        ep_Q2_041_generator_18_1000_1099 =
      ep_Q2_041_partial_18_1099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_041_partials_18_1000_1099 : List Poly :=
[
  ep_Q2_041_partial_18_1000,
  ep_Q2_041_partial_18_1001,
  ep_Q2_041_partial_18_1002,
  ep_Q2_041_partial_18_1003,
  ep_Q2_041_partial_18_1004,
  ep_Q2_041_partial_18_1005,
  ep_Q2_041_partial_18_1006,
  ep_Q2_041_partial_18_1007,
  ep_Q2_041_partial_18_1008,
  ep_Q2_041_partial_18_1009,
  ep_Q2_041_partial_18_1010,
  ep_Q2_041_partial_18_1011,
  ep_Q2_041_partial_18_1012,
  ep_Q2_041_partial_18_1013,
  ep_Q2_041_partial_18_1014,
  ep_Q2_041_partial_18_1015,
  ep_Q2_041_partial_18_1016,
  ep_Q2_041_partial_18_1017,
  ep_Q2_041_partial_18_1018,
  ep_Q2_041_partial_18_1019,
  ep_Q2_041_partial_18_1020,
  ep_Q2_041_partial_18_1021,
  ep_Q2_041_partial_18_1022,
  ep_Q2_041_partial_18_1023,
  ep_Q2_041_partial_18_1024,
  ep_Q2_041_partial_18_1025,
  ep_Q2_041_partial_18_1026,
  ep_Q2_041_partial_18_1027,
  ep_Q2_041_partial_18_1028,
  ep_Q2_041_partial_18_1029,
  ep_Q2_041_partial_18_1030,
  ep_Q2_041_partial_18_1031,
  ep_Q2_041_partial_18_1032,
  ep_Q2_041_partial_18_1033,
  ep_Q2_041_partial_18_1034,
  ep_Q2_041_partial_18_1035,
  ep_Q2_041_partial_18_1036,
  ep_Q2_041_partial_18_1037,
  ep_Q2_041_partial_18_1038,
  ep_Q2_041_partial_18_1039,
  ep_Q2_041_partial_18_1040,
  ep_Q2_041_partial_18_1041,
  ep_Q2_041_partial_18_1042,
  ep_Q2_041_partial_18_1043,
  ep_Q2_041_partial_18_1044,
  ep_Q2_041_partial_18_1045,
  ep_Q2_041_partial_18_1046,
  ep_Q2_041_partial_18_1047,
  ep_Q2_041_partial_18_1048,
  ep_Q2_041_partial_18_1049,
  ep_Q2_041_partial_18_1050,
  ep_Q2_041_partial_18_1051,
  ep_Q2_041_partial_18_1052,
  ep_Q2_041_partial_18_1053,
  ep_Q2_041_partial_18_1054,
  ep_Q2_041_partial_18_1055,
  ep_Q2_041_partial_18_1056,
  ep_Q2_041_partial_18_1057,
  ep_Q2_041_partial_18_1058,
  ep_Q2_041_partial_18_1059,
  ep_Q2_041_partial_18_1060,
  ep_Q2_041_partial_18_1061,
  ep_Q2_041_partial_18_1062,
  ep_Q2_041_partial_18_1063,
  ep_Q2_041_partial_18_1064,
  ep_Q2_041_partial_18_1065,
  ep_Q2_041_partial_18_1066,
  ep_Q2_041_partial_18_1067,
  ep_Q2_041_partial_18_1068,
  ep_Q2_041_partial_18_1069,
  ep_Q2_041_partial_18_1070,
  ep_Q2_041_partial_18_1071,
  ep_Q2_041_partial_18_1072,
  ep_Q2_041_partial_18_1073,
  ep_Q2_041_partial_18_1074,
  ep_Q2_041_partial_18_1075,
  ep_Q2_041_partial_18_1076,
  ep_Q2_041_partial_18_1077,
  ep_Q2_041_partial_18_1078,
  ep_Q2_041_partial_18_1079,
  ep_Q2_041_partial_18_1080,
  ep_Q2_041_partial_18_1081,
  ep_Q2_041_partial_18_1082,
  ep_Q2_041_partial_18_1083,
  ep_Q2_041_partial_18_1084,
  ep_Q2_041_partial_18_1085,
  ep_Q2_041_partial_18_1086,
  ep_Q2_041_partial_18_1087,
  ep_Q2_041_partial_18_1088,
  ep_Q2_041_partial_18_1089,
  ep_Q2_041_partial_18_1090,
  ep_Q2_041_partial_18_1091,
  ep_Q2_041_partial_18_1092,
  ep_Q2_041_partial_18_1093,
  ep_Q2_041_partial_18_1094,
  ep_Q2_041_partial_18_1095,
  ep_Q2_041_partial_18_1096,
  ep_Q2_041_partial_18_1097,
  ep_Q2_041_partial_18_1098,
  ep_Q2_041_partial_18_1099
]

/-- Sum of partial products in this block. -/
def ep_Q2_041_block_18_1000_1099 : Poly :=
[
  term ((-183098420431076158946640678565709974452048997479253679186640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1627194213394870392743744173327491971634384616751676110710880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (12, 2), (15, 2)],
  term ((3987335360 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((1143209950064463863371820583550111757945768539506354119120419523226831107 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((32197465004992 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6635592667531340159052303061722145775337176015003779847538488880 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((-42601803529532176432830355588394079501204161258236275108720 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((1017551449675652057938209942723379430655618359591964226142269003567093385 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((-18213016214588 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7437369047706614652491622875298796186249373006118933556911186480 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 1), (15, 3)],
  term ((18243158139407848512 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (13, 2)],
  term ((-463300203582045152836 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1)],
  term ((793803921030301529071484264641938908334596031987915408699471780 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((-32621220160 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((-544666444261608887394964665295023750847566039774321281791156320 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (11, 1), (13, 2), (15, 2)],
  term ((1284510720 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((9797748836815995545242956771144257431538121051399222007173040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((-2008341552158899468014745553759136883962657758182405116529200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 1), (13, 3), (15, 1)],
  term ((209148029463012572043 : Rat) / 518003890243601902) [(1, 1), (8, 1), (11, 1), (14, 1)],
  term ((-3958708716292144429324340714086723809918279134714973414981139397016325235 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2)],
  term ((-12758555295696 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-503775505403144821955082842897916855474685818713572056437145800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (14, 1), (15, 4)],
  term ((1343248917 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((44645051420443739075 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 1), (14, 2)],
  term ((28012199459789503001272374708189139368292253089819832181060 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 1), (11, 1), (14, 2), (15, 2)],
  term ((6619585454 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-132296664317538027373249797099175214256560679701594891225929526430272953 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 1), (15, 2)],
  term ((30981962503400 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-13649001810197914516293926607130641026338131954434187050396020 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 1), (15, 4)],
  term ((-5788375401 : Rat) / 151763803) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((1392596184373973255487865277044305670481628261627191109496541840 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((5602353231352808801862689670583915311734492002641676810702560 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((-3523348686384651239471462421942523275622322474226476599896040 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((591853845814945483233294281967006595482968538858854626116579738493240625 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1)],
  term ((-7265669363232 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((32397714150992791889809911019549813764760395518620196203632400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 2), (12, 1), (15, 3)],
  term ((1627194213394870392743744173327491971634384616751676110710880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (12, 2), (15, 1)],
  term ((4750822432137460550 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 2), (13, 1)],
  term ((-20523552906833829576 : Rat) / 259001945121800951) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1)],
  term ((-5829223064919177163237072297961204521771597931750953526588944020 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((-1445074560 : Rat) / 151763803) [(1, 1), (8, 1), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((1198827534716140116491354875326456702923944804494347268256617240 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (11, 2), (13, 1), (15, 2)],
  term ((334508000 : Rat) / 151763803) [(1, 1), (8, 1), (11, 2), (13, 1), (16, 1)],
  term ((-13246056586745428833365809064722579696657075180915526713291840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((508836187836008905133333636494283489649663417017381089424760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (13, 2), (15, 1)],
  term ((4390514355870315137932946426718071574356584685782309415312482145702513025 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1)],
  term ((-34769992886160 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((32710951718751009490954481982446013621602001552640004730463100 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 1), (11, 2), (14, 1), (15, 3)],
  term ((-87386371937271468229681736494331097313799937766318849927440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 2), (14, 2), (15, 1)],
  term ((-894728263354175887616311818352871700792566536592300877167781201724279344 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 1), (11, 2), (15, 1)],
  term ((3657639684080 : Rat) / 275754830051) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-590340281785744531255476363866189677393075443757949957710062540 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 2), (15, 3)],
  term ((130396324635349441390754255125646626119491426161960292454951400 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (12, 1), (15, 2)],
  term ((-589721392773979873880283123219359506498367579225439664284480 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((136509581660643489324139611856333219096844347042925848214000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (11, 3), (13, 1), (15, 1)],
  term ((624013983198334921137291725369643857665170877772318558093444500 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (14, 1), (15, 2)],
  term ((-133676261920204998742149039273158358008878312933385009662628640 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (11, 3), (15, 2)],
  term ((-40185124441471888453 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (13, 1)],
  term ((56629803391078529756 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((-181884673058417871422822972015796469356294110692667092614840 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((3987335360 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3933736658017723993854124164620405710421300585804488952042292401557554777 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2)],
  term ((-10022926526608 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17716645481501717272065331085528587853534888866393845393552100 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (12, 1), (13, 1), (15, 4)],
  term ((-1957066672 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-183098420431076158946640678565709974452048997479253679186640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-3775489045481141534003113193534450316318977507664155213746406176401470 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1)],
  term ((-20338086400 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-174239880297008419299635552589053234965439936535960403931378340 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (12, 1), (13, 2), (15, 3)],
  term ((933924829044415307378838360469393158278907638149213397193600 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 1), (13, 3), (15, 2)],
  term ((14784322770198856307 : Rat) / 37000277874542993) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((9613848770 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((19047008438862443630 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 1), (15, 1)],
  term ((-590755194 : Rat) / 151763803) [(1, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((33292612311359722458110492774928834403164842371014157753040561974992425 : Rat) / 3536042492738065398709775190168833396326712374740897711688328606546108) [(1, 1), (8, 1), (12, 1), (15, 3)],
  term ((21904222840080 : Rat) / 275754830051) [(1, 1), (8, 1), (12, 1), (15, 3), (16, 1)],
  term ((183098420431076158946640678565709974452048997479253679186640 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (12, 2), (13, 1), (15, 2)],
  term ((-56629803391078529756 : Rat) / 259001945121800951) [(1, 1), (8, 1), (12, 2), (15, 1)],
  term ((-3987335360 : Rat) / 151763803) [(1, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((97269813895697037682 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 1)],
  term ((-3236564885418608531 : Rat) / 37000277874542993) [(1, 1), (8, 1), (13, 1), (14, 1)],
  term ((-1829620561670320550643557292127625642362475420197537210535748821210355461 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2)],
  term ((-22088952122288 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-158927485920913412787977288733769595263024524986344152542318360 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 1), (14, 1), (15, 4)],
  term ((1110412096 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-43706396304392267779 : Rat) / 259001945121800951) [(1, 1), (8, 1), (13, 1), (14, 2)],
  term ((-114596712075453142539177216159853914012998238244611614549900 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 1), (14, 2), (15, 2)],
  term ((-5378758734 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((-252947480982172091089165873564149436266828920945512491116297055608060141 : Rat) / 1076186845615932947433409840486166685838564635790707999209491315035772) [(1, 1), (8, 1), (13, 1), (15, 2)],
  term ((-1468882280420 : Rat) / 11989340437) [(1, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((46421044525350675928152687865425849734235864744837292884015380 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 1), (13, 1), (15, 4)],
  term ((5176990454 : Rat) / 151763803) [(1, 1), (8, 1), (13, 1), (16, 1)],
  term ((14821376026502728678103471266417500628017071439769578108422516719143380055 : Rat) / 24752297449166457790968426331181833774286986623186283981818300245822756) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 1)],
  term ((34967081044048 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((35763381041229827642326051339308997975293528457854153550365900 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 1), (13, 2), (14, 1), (15, 3)],
  term ((-21833046898398157802721552441729464552914566538339720834080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 1), (13, 2), (14, 2), (15, 1)],
  term ((11547821057752654770769230352090303499176237518417207882965351020982403383 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 1), (13, 2), (15, 1)],
  term ((71348627976672 : Rat) / 275754830051) [(1, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((20245662888081958159904305886935301074300510005238112536826860 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 1), (13, 2), (15, 3)],
  term ((-9691677761560419522 : Rat) / 37000277874542993) [(1, 1), (8, 1), (13, 3)],
  term ((366196840862152317893281357131419948904097994958507358373280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (12, 2), (15, 2)],
  term ((-7974670720 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (12, 2), (16, 1)],
  term ((-2286419900128927726743641167100223515891537079012708238240839046453662214 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-64394930009984 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-13271185335062680318104606123444291550674352030007559695076977760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (11, 1), (13, 1), (14, 1), (15, 3)],
  term ((85203607059064352865660711176788159002408322516472550217440 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-2035102899351304115876419885446758861311236719183928452284538007134186770 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1)],
  term ((36426032429176 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14874738095413229304983245750597592372498746012237867113822372960 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (11, 1), (13, 1), (15, 3)],
  term ((-36486316278815697024 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (13, 2)],
  term ((926600407164090305672 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (13, 2), (14, 1)],
  term ((-1587607842060603058142968529283877816669192063975830817398943560 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (11, 1), (13, 2), (14, 1), (15, 2)],
  term ((65242440320 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((1089332888523217774789929330590047501695132079548642563582312640 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 2), (11, 1), (13, 2), (15, 2)],
  term ((-2569021440 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (13, 2), (16, 1)],
  term ((-19595497673631991090485913542288514863076242102798444014346080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (13, 3), (14, 1), (15, 1)],
  term ((4016683104317798936029491107518273767925315516364810233058400 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 1), (13, 3), (15, 1)],
  term ((-209148029463012572043 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (14, 1)],
  term ((3958708716292144429324340714086723809918279134714973414981139397016325235 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (11, 1), (14, 1), (15, 2)],
  term ((25517110591392 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1007551010806289643910165685795833710949371637427144112874291600 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 1), (14, 1), (15, 4)],
  term ((-2686497834 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-89290102840887478150 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 1), (14, 2)],
  term ((-56024398919579006002544749416378278736584506179639664362120 : Rat) / 3205784729214067904041885084790979761831689859545917092677) [(1, 1), (8, 2), (11, 1), (14, 2), (15, 2)],
  term ((-13239170908 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (14, 2), (16, 1)],
  term ((264593328635076054746499594198350428513121359403189782451859052860545906 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (11, 1), (15, 2)],
  term ((-61963925006800 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((27298003620395829032587853214261282052676263908868374100792040 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 1), (15, 4)],
  term ((11576750802 : Rat) / 151763803) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-2785192368747946510975730554088611340963256523254382218993083680 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (11, 2), (12, 1), (13, 1), (15, 2)],
  term ((-11204706462705617603725379341167830623468984005283353621405120 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 2), (12, 1), (13, 2), (15, 1)],
  term ((7046697372769302478942924843885046551244644948452953199792080 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-591853845814945483233294281967006595482968538858854626116579738493240625 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (11, 2), (12, 1), (15, 1)],
  term ((14531338726464 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-64795428301985583779619822039099627529520791037240392407264800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 2), (12, 1), (15, 3)],
  term ((-3254388426789740785487488346654983943268769233503352221421760 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 2), (12, 2), (15, 1)],
  term ((-9501644864274921100 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 2), (13, 1)],
  term ((41047105813667659152 : Rat) / 259001945121800951) [(1, 1), (8, 2), (11, 2), (13, 1), (14, 1)],
  term ((11658446129838354326474144595922409043543195863501907053177888040 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (11, 2), (13, 1), (14, 1), (15, 2)],
  term ((2890149120 : Rat) / 151763803) [(1, 1), (8, 2), (11, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2397655069432280232982709750652913405847889608988694536513234480 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 2), (11, 2), (13, 1), (15, 2)],
  term ((-669016000 : Rat) / 151763803) [(1, 1), (8, 2), (11, 2), (13, 1), (16, 1)],
  term ((26492113173490857666731618129445159393314150361831053426583680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 2), (13, 2), (14, 1), (15, 1)],
  term ((-1017672375672017810266667272988566979299326834034762178849520 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 2), (13, 2), (15, 1)],
  term ((-4390514355870315137932946426718071574356584685782309415312482145702513025 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (11, 2), (14, 1), (15, 1)],
  term ((69539985772320 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-65421903437502018981908963964892027243204003105280009460926200 : Rat) / 253256993607911364419308921698487401184703498904127450321483) [(1, 1), (8, 2), (11, 2), (14, 1), (15, 3)],
  term ((174772743874542936459363472988662194627599875532637699854880 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 2), (14, 2), (15, 1)],
  term ((1789456526708351775232623636705743401585133073184601754335562403448558688 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (11, 2), (15, 1)],
  term ((-7315279368160 : Rat) / 275754830051) [(1, 1), (8, 2), (11, 2), (15, 1), (16, 1)],
  term ((1180680563571489062510952727732379354786150887515899915420125080 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 2), (15, 3)],
  term ((-260792649270698882781508510251293252238982852323920584909902800 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 3), (12, 1), (15, 2)],
  term ((1179442785547959747760566246438719012996735158450879328568960 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 3), (13, 1), (14, 1), (15, 1)],
  term ((-273019163321286978648279223712666438193688694085851696428000 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (11, 3), (13, 1), (15, 1)],
  term ((-1248027966396669842274583450739287715330341755544637116186889000 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 3), (14, 1), (15, 2)],
  term ((267352523840409997484298078546316716017756625866770019325257280 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (11, 3), (15, 2)],
  term ((80370248882943776906 : Rat) / 259001945121800951) [(1, 1), (8, 2), (12, 1), (13, 1)],
  term ((-113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1)],
  term ((363769346116835742845645944031592938712588221385334185229680 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-7974670720 : Rat) / 151763803) [(1, 1), (8, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3933736658017723993854124164620405710421300585804488952042292401557554777 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (12, 1), (13, 1), (15, 2)],
  term ((20045853053216 : Rat) / 275754830051) [(1, 1), (8, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((35433290963003434544130662171057175707069777732787690787104200 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 2), (12, 1), (13, 1), (15, 4)],
  term ((3914133344 : Rat) / 151763803) [(1, 1), (8, 2), (12, 1), (13, 1), (16, 1)],
  term ((366196840862152317893281357131419948904097994958507358373280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((7550978090962283068006226387068900632637955015328310427492812352802940 : Rat) / 3405654574733965023523448862297995841261280493008569617751554794417) [(1, 1), (8, 2), (12, 1), (13, 2), (15, 1)],
  term ((40676172800 : Rat) / 151763803) [(1, 1), (8, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((348479760594016838599271105178106469930879873071920807862756680 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (12, 1), (13, 2), (15, 3)],
  term ((-1867849658088830614757676720938786316557815276298426794387200 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (12, 1), (13, 3), (15, 2)],
  term ((-29568645540397712614 : Rat) / 37000277874542993) [(1, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((-19227697540 : Rat) / 151763803) [(1, 1), (8, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38094016877724887260 : Rat) / 259001945121800951) [(1, 1), (8, 2), (12, 1), (15, 1)],
  term ((1181510388 : Rat) / 151763803) [(1, 1), (8, 2), (12, 1), (15, 1), (16, 1)],
  term ((-33292612311359722458110492774928834403164842371014157753040561974992425 : Rat) / 1768021246369032699354887595084416698163356187370448855844164303273054) [(1, 1), (8, 2), (12, 1), (15, 3)],
  term ((-43808445680160 : Rat) / 275754830051) [(1, 1), (8, 2), (12, 1), (15, 3), (16, 1)],
  term ((-366196840862152317893281357131419948904097994958507358373280 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (12, 2), (13, 1), (15, 2)],
  term ((113259606782157059512 : Rat) / 259001945121800951) [(1, 1), (8, 2), (12, 2), (15, 1)],
  term ((7974670720 : Rat) / 151763803) [(1, 1), (8, 2), (12, 2), (15, 1), (16, 1)],
  term ((-194539627791394075364 : Rat) / 259001945121800951) [(1, 1), (8, 2), (13, 1)],
  term ((6473129770837217062 : Rat) / 37000277874542993) [(1, 1), (8, 2), (13, 1), (14, 1)],
  term ((1829620561670320550643557292127625642362475420197537210535748821210355461 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (13, 1), (14, 1), (15, 2)],
  term ((44177904244576 : Rat) / 275754830051) [(1, 1), (8, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((317854971841826825575954577467539190526049049972688305084636720 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (13, 1), (14, 1), (15, 4)],
  term ((-2220824192 : Rat) / 151763803) [(1, 1), (8, 2), (13, 1), (14, 1), (16, 1)],
  term ((87412792608784535558 : Rat) / 259001945121800951) [(1, 1), (8, 2), (13, 1), (14, 2)],
  term ((229193424150906285078354432319707828025996476489223229099800 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (13, 1), (14, 2), (15, 2)],
  term ((10757517468 : Rat) / 151763803) [(1, 1), (8, 2), (13, 1), (14, 2), (16, 1)],
  term ((252947480982172091089165873564149436266828920945512491116297055608060141 : Rat) / 538093422807966473716704920243083342919282317895353999604745657517886) [(1, 1), (8, 2), (13, 1), (15, 2)],
  term ((2937764560840 : Rat) / 11989340437) [(1, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((-92842089050701351856305375730851699468471729489674585768030760 : Rat) / 40774375970873729671508736393456471590737263323564519501758763) [(1, 1), (8, 2), (13, 1), (15, 4)],
  term ((-10353980908 : Rat) / 151763803) [(1, 1), (8, 2), (13, 1), (16, 1)],
  term ((-14821376026502728678103471266417500628017071439769578108422516719143380055 : Rat) / 12376148724583228895484213165590916887143493311593141990909150122911378) [(1, 1), (8, 2), (13, 2), (14, 1), (15, 1)],
  term ((-69934162088096 : Rat) / 275754830051) [(1, 1), (8, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-71526762082459655284652102678617995950587056915708307100731800 : Rat) / 5824910852981961381644105199065210227248180474794931357394109) [(1, 1), (8, 2), (13, 2), (14, 1), (15, 3)],
  term ((43666093796796315605443104883458929105829133076679441668160 : Rat) / 22440493104498475328293195593536858332821829016821419648739) [(1, 1), (8, 2), (13, 2), (14, 2), (15, 1)],
  term ((-11547821057752654770769230352090303499176237518417207882965351020982403383 : Rat) / 6188074362291614447742106582795458443571746655796570995454575061455689) [(1, 1), (8, 2), (13, 2), (15, 1)],
  term ((-142697255953344 : Rat) / 275754830051) [(1, 1), (8, 2), (13, 2), (15, 1), (16, 1)],
  term ((-40491325776163916319808611773870602148601020010476225073653720 : Rat) / 1772798955255379550935162451889411808292924492328892152250381) [(1, 1), (8, 2), (13, 2), (15, 3)],
  term ((19383355523120839044 : Rat) / 37000277874542993) [(1, 1), (8, 2), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 1000 through 1099. -/
theorem ep_Q2_041_block_18_1000_1099_valid :
    checkProductSumEq ep_Q2_041_partials_18_1000_1099
      ep_Q2_041_block_18_1000_1099 = true := by
  native_decide

end EpQ2041TermShards

end Patterns

end EndpointCertificate

end Problem97
