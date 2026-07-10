/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R007:u=v:R007NY, term block 16:1000-1081

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R007UeqvR007NYTermShards

/-- Generator polynomial 16 for relaxed split surplus certificate `R007:u=v:R007NY`. -/
def rs_R007_ueqv_R007NY_generator_16_1000_1081 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(6, 1)]
]

/-- Coefficient term 1000 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1000 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(10, 2), (15, 2), (16, 2)]
]

/-- Partial product 1000 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1000 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 2), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 2), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1000 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1000_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1000
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1000 := by
  native_decide

/-- Coefficient term 1001 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1001 : Poly :=
[
  term ((-15 : Rat) / 8) [(10, 2), (16, 1)]
]

/-- Partial product 1001 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1001 : Poly :=
[
  term ((-15 : Rat) / 4) [(6, 1), (10, 2), (16, 1)],
  term ((15 : Rat) / 8) [(10, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1001 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1001_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1001
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1001 := by
  native_decide

/-- Coefficient term 1002 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1002 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1002 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1002 : Poly :=
[
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1002 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1002_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1002
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1002 := by
  native_decide

/-- Coefficient term 1003 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1003 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 1003 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1003 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1003 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1003_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1003
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1003 := by
  native_decide

/-- Coefficient term 1004 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1004 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 1004 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1004 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1004 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1004_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1004
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1004 := by
  native_decide

/-- Coefficient term 1005 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1005 : Poly :=
[
  term ((-281417346199923236541901 : Rat) / 539881838331225245604) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1005 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1005 : Poly :=
[
  term ((-281417346199923236541901 : Rat) / 269940919165612622802) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((281417346199923236541901 : Rat) / 539881838331225245604) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1005 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1005_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1005
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1005 := by
  native_decide

/-- Coefficient term 1006 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1006 : Poly :=
[
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 1006 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1006 : Poly :=
[
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1006 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1006_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1006
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1006 := by
  native_decide

/-- Coefficient term 1007 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1007 : Poly :=
[
  term ((169068049342663160072294 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1007 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1007 : Poly :=
[
  term ((338136098685326320144588 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-169068049342663160072294 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1007 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1007_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1007
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1007 := by
  native_decide

/-- Coefficient term 1008 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1008 : Poly :=
[
  term ((35071273897685353712 : Rat) / 445447061329393767) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 2)]
]

/-- Partial product 1008 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1008 : Poly :=
[
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1008 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1008_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1008
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1008 := by
  native_decide

/-- Coefficient term 1009 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1009 : Poly :=
[
  term ((83295657678668529422021 : Rat) / 629862144719762786538) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 1009 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1009 : Poly :=
[
  term ((83295657678668529422021 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-83295657678668529422021 : Rat) / 629862144719762786538) [(11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1009 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1009_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1009
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1009 := by
  native_decide

/-- Coefficient term 1010 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1010 : Poly :=
[
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 1), (16, 2)]
]

/-- Partial product 1010 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1010 : Poly :=
[
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1010 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1010_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1010
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1010 := by
  native_decide

/-- Coefficient term 1011 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1011 : Poly :=
[
  term ((238042101074760537850324 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1011 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1011 : Poly :=
[
  term ((476084202149521075700648 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-238042101074760537850324 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1011 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1011_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1011
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1011 := by
  native_decide

/-- Coefficient term 1012 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1012 : Poly :=
[
  term ((-270490205329669721593355 : Rat) / 539881838331225245604) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1012 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1012 : Poly :=
[
  term ((-270490205329669721593355 : Rat) / 269940919165612622802) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((270490205329669721593355 : Rat) / 539881838331225245604) [(11, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1012 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1012_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1012
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1012 := by
  native_decide

/-- Coefficient term 1013 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1013 : Poly :=
[
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1013 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1013 : Poly :=
[
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1013 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1013_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1013
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1013 := by
  native_decide

/-- Coefficient term 1014 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1014 : Poly :=
[
  term ((28000171607074640434025 : Rat) / 179960612777075081868) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 1014 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1014 : Poly :=
[
  term ((28000171607074640434025 : Rat) / 89980306388537540934) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-28000171607074640434025 : Rat) / 179960612777075081868) [(11, 1), (13, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1014 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1014_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1014
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1014 := by
  native_decide

/-- Coefficient term 1015 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1015 : Poly :=
[
  term ((1155107476384805560112 : Rat) / 6797073504170102013) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 1015 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1015 : Poly :=
[
  term ((2310214952769611120224 : Rat) / 6797073504170102013) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1155107476384805560112 : Rat) / 6797073504170102013) [(11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1015 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1015_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1015
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1015 := by
  native_decide

/-- Coefficient term 1016 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1016 : Poly :=
[
  term ((31459443349121345968805 : Rat) / 314931072359881393269) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 1016 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1016 : Poly :=
[
  term ((62918886698242691937610 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-31459443349121345968805 : Rat) / 314931072359881393269) [(11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1016 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1016_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1016
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1016 := by
  native_decide

/-- Coefficient term 1017 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1017 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1017 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1017 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1017 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1017_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1017
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1017 := by
  native_decide

/-- Coefficient term 1018 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1018 : Poly :=
[
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 1018 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1018 : Poly :=
[
  term ((11360282480834308858880 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1018 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1018_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1018
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1018 := by
  native_decide

/-- Coefficient term 1019 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1019 : Poly :=
[
  term ((2227695118883955297611777 : Rat) / 7558345736637153438456) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1019 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1019 : Poly :=
[
  term ((2227695118883955297611777 : Rat) / 3779172868318576719228) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-2227695118883955297611777 : Rat) / 7558345736637153438456) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1019 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1019_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1019
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1019 := by
  native_decide

/-- Coefficient term 1020 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1020 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 1336341183988181301) [(11, 1), (14, 1), (15, 1), (16, 2)]
]

/-- Partial product 1020 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1020 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 1336341183988181301) [(11, 1), (14, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1020 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1020_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1020
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1020 := by
  native_decide

/-- Coefficient term 1021 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1021 : Poly :=
[
  term ((127505083938541876767195 : Rat) / 209954048239920928846) [(11, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1021 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1021 : Poly :=
[
  term ((127505083938541876767195 : Rat) / 104977024119960464423) [(6, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-127505083938541876767195 : Rat) / 209954048239920928846) [(11, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1021 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1021_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1021
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1021 := by
  native_decide

/-- Coefficient term 1022 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1022 : Poly :=
[
  term ((-646441848667149550603309 : Rat) / 3779172868318576719228) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1022 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1022 : Poly :=
[
  term ((-646441848667149550603309 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((646441848667149550603309 : Rat) / 3779172868318576719228) [(11, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1022 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1022_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1022
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1022 := by
  native_decide

/-- Coefficient term 1023 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1023 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(11, 1), (14, 2), (15, 1), (16, 2)]
]

/-- Partial product 1023 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1023 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(11, 1), (14, 2), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1023 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1023_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1023
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1023 := by
  native_decide

/-- Coefficient term 1024 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1024 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(11, 1), (14, 2), (15, 3), (16, 1)]
]

/-- Partial product 1024 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1024 : Poly :=
[
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(11, 1), (14, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1024 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1024_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1024
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1024 := by
  native_decide

/-- Coefficient term 1025 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1025 : Poly :=
[
  term ((835280326636640753187259 : Rat) / 1889586434159288359614) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

/-- Partial product 1025 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1025 : Poly :=
[
  term ((835280326636640753187259 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-835280326636640753187259 : Rat) / 1889586434159288359614) [(11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1025 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1025_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1025
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1025 := by
  native_decide

/-- Coefficient term 1026 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1026 : Poly :=
[
  term ((-156916452505657804438477 : Rat) / 102834635872614332496) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 1026 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1026 : Poly :=
[
  term ((-156916452505657804438477 : Rat) / 51417317936307166248) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((156916452505657804438477 : Rat) / 102834635872614332496) [(11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1026 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1026_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1026
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1026 := by
  native_decide

/-- Coefficient term 1027 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1027 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (15, 1), (16, 2)]
]

/-- Partial product 1027 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1027 : Poly :=
[
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (15, 1), (16, 2)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (15, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1027 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1027_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1027
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1027 := by
  native_decide

/-- Coefficient term 1028 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1028 : Poly :=
[
  term ((86517476848829305143703 : Rat) / 2519448578879051146152) [(11, 1), (15, 3), (16, 1)]
]

/-- Partial product 1028 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1028 : Poly :=
[
  term ((86517476848829305143703 : Rat) / 1259724289439525573076) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((-86517476848829305143703 : Rat) / 2519448578879051146152) [(11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1028 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1028_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1028
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1028 := by
  native_decide

/-- Coefficient term 1029 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1029 : Poly :=
[
  term ((189643442017000944836065 : Rat) / 209954048239920928846) [(11, 2), (12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1029 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1029 : Poly :=
[
  term ((189643442017000944836065 : Rat) / 104977024119960464423) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-189643442017000944836065 : Rat) / 209954048239920928846) [(11, 2), (12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1029 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1029_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1029
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1029 := by
  native_decide

/-- Coefficient term 1030 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1030 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 1), (16, 2)]
]

/-- Partial product 1030 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1030 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1030 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1030_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1030
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1030 := by
  native_decide

/-- Coefficient term 1031 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1031 : Poly :=
[
  term ((-261071233965417724596490 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 2), (16, 1)]
]

/-- Partial product 1031 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1031 : Poly :=
[
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1031 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1031_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1031
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1031 := by
  native_decide

/-- Coefficient term 1032 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1032 : Poly :=
[
  term ((-175356369488426768560 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 2), (16, 2)]
]

/-- Partial product 1032 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1032 : Poly :=
[
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (14, 2), (16, 2)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1032 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1032_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1032
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1032 := by
  native_decide

/-- Coefficient term 1033 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1033 : Poly :=
[
  term ((-421126212663669329618815 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (16, 1)]
]

/-- Partial product 1033 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1033 : Poly :=
[
  term ((-842252425327338659237630 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((421126212663669329618815 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1033 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1033_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1033
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1033 := by
  native_decide

/-- Coefficient term 1034 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1034 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (16, 2)]
]

/-- Partial product 1034 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1034 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1034 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1034_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1034
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1034 := by
  native_decide

/-- Coefficient term 1035 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1035 : Poly :=
[
  term ((-42309381957280990181524 : Rat) / 314931072359881393269) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1035 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1035 : Poly :=
[
  term ((-84618763914561980363048 : Rat) / 314931072359881393269) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((42309381957280990181524 : Rat) / 314931072359881393269) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1035 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1035_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1035
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1035 := by
  native_decide

/-- Coefficient term 1036 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1036 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1036 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1036 : Poly :=
[
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1036 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1036_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1036
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1036 := by
  native_decide

/-- Coefficient term 1037 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1037 : Poly :=
[
  term ((-33794200863381212298197 : Rat) / 944793217079644179807) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1037 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1037 : Poly :=
[
  term ((-67588401726762424596394 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((33794200863381212298197 : Rat) / 944793217079644179807) [(11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1037 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1037_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1037
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1037 := by
  native_decide

/-- Coefficient term 1038 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1038 : Poly :=
[
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

/-- Partial product 1038 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1038 : Poly :=
[
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1038 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1038_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1038
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1038 := by
  native_decide

/-- Coefficient term 1039 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1039 : Poly :=
[
  term ((7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (13, 2), (16, 1)]
]

/-- Partial product 1039 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1039 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1039 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1039_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1039
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1039 := by
  native_decide

/-- Coefficient term 1040 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1040 : Poly :=
[
  term ((-1376380919581279917839665 : Rat) / 1889586434159288359614) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1040 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1040 : Poly :=
[
  term ((-1376380919581279917839665 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((1376380919581279917839665 : Rat) / 1889586434159288359614) [(11, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1040 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1040_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1040
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1040 := by
  native_decide

/-- Coefficient term 1041 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1041 : Poly :=
[
  term ((-528662753449896419850673 : Rat) / 444608572743361966968) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 1041 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1041 : Poly :=
[
  term ((-528662753449896419850673 : Rat) / 222304286371680983484) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((528662753449896419850673 : Rat) / 444608572743361966968) [(11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1041 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1041_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1041
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1041 := by
  native_decide

/-- Coefficient term 1042 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1042 : Poly :=
[
  term ((-43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (14, 1), (16, 2)]
]

/-- Partial product 1042 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1042 : Poly :=
[
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (14, 1), (16, 2)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (14, 1), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1042 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1042_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1042
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1042 := by
  native_decide

/-- Coefficient term 1043 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1043 : Poly :=
[
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1043 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1043 : Poly :=
[
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1043 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1043_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1043
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1043 := by
  native_decide

/-- Coefficient term 1044 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1044 : Poly :=
[
  term ((1788122575347879009426241 : Rat) / 1889586434159288359614) [(11, 2), (14, 2), (16, 1)]
]

/-- Partial product 1044 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1044 : Poly :=
[
  term ((1788122575347879009426241 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (14, 2), (16, 1)],
  term ((-1788122575347879009426241 : Rat) / 1889586434159288359614) [(11, 2), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1044 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1044_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1044
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1044 := by
  native_decide

/-- Coefficient term 1045 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1045 : Poly :=
[
  term ((87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (14, 2), (16, 2)]
]

/-- Partial product 1045 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1045 : Poly :=
[
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (14, 2), (16, 2)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (14, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1045 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1045_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1045
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1045 := by
  native_decide

/-- Coefficient term 1046 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1046 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 629862144719762786538) [(11, 2), (14, 3), (16, 1)]
]

/-- Partial product 1046 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1046 : Poly :=
[
  term ((-491656423605717141358255 : Rat) / 314931072359881393269) [(6, 1), (11, 2), (14, 3), (16, 1)],
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1046 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1046_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1046
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1046 := by
  native_decide

/-- Coefficient term 1047 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1047 : Poly :=
[
  term ((5635680584451532981492135 : Rat) / 7558345736637153438456) [(11, 2), (15, 2), (16, 1)]
]

/-- Partial product 1047 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1047 : Poly :=
[
  term ((5635680584451532981492135 : Rat) / 3779172868318576719228) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((-5635680584451532981492135 : Rat) / 7558345736637153438456) [(11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1047 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1047_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1047
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1047 := by
  native_decide

/-- Coefficient term 1048 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1048 : Poly :=
[
  term ((93899297780196562700474 : Rat) / 44990153194268770467) [(11, 2), (16, 1)]
]

/-- Partial product 1048 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1048 : Poly :=
[
  term ((187798595560393125400948 : Rat) / 44990153194268770467) [(6, 1), (11, 2), (16, 1)],
  term ((-93899297780196562700474 : Rat) / 44990153194268770467) [(11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1048 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1048_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1048
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1048 := by
  native_decide

/-- Coefficient term 1049 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1049 : Poly :=
[
  term ((21919546186053346070 : Rat) / 1336341183988181301) [(11, 2), (16, 2)]
]

/-- Partial product 1049 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1049 : Poly :=
[
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (16, 2)],
  term ((-21919546186053346070 : Rat) / 1336341183988181301) [(11, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1049 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1049_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1049
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1049 := by
  native_decide

/-- Coefficient term 1050 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1050 : Poly :=
[
  term ((-39586773307377828949040 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 1050 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1050 : Poly :=
[
  term ((-79173546614755657898080 : Rat) / 134970459582806311401) [(6, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((39586773307377828949040 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1050 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1050_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1050
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1050 := by
  native_decide

/-- Coefficient term 1051 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1051 : Poly :=
[
  term ((36522355391299868625260 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (16, 1)]
]

/-- Partial product 1051 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1051 : Poly :=
[
  term ((73044710782599737250520 : Rat) / 134970459582806311401) [(6, 1), (11, 3), (13, 1), (16, 1)],
  term ((-36522355391299868625260 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1051 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1051_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1051
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1051 := by
  native_decide

/-- Coefficient term 1052 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1052 : Poly :=
[
  term ((-653917932304248949963550 : Rat) / 944793217079644179807) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1052 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1052 : Poly :=
[
  term ((-1307835864608497899927100 : Rat) / 944793217079644179807) [(6, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((653917932304248949963550 : Rat) / 944793217079644179807) [(11, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1052 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1052_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1052
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1052 := by
  native_decide

/-- Coefficient term 1053 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1053 : Poly :=
[
  term ((267983257581512724142375 : Rat) / 1889586434159288359614) [(11, 3), (15, 1), (16, 1)]
]

/-- Partial product 1053 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1053 : Poly :=
[
  term ((267983257581512724142375 : Rat) / 944793217079644179807) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((-267983257581512724142375 : Rat) / 1889586434159288359614) [(11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1053 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1053_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1053
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1053 := by
  native_decide

/-- Coefficient term 1054 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1054 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1054 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1054 : Poly :=
[
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1054 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1054_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1054
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1054 := by
  native_decide

/-- Coefficient term 1055 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1055 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1055 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1055 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1055 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1055_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1055
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1055 := by
  native_decide

/-- Coefficient term 1056 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1056 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1056 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1056 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1056 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1056_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1056
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1056 := by
  native_decide

/-- Coefficient term 1057 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1057 : Poly :=
[
  term ((-15645550076829509687239 : Rat) / 1259724289439525573076) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1057 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1057 : Poly :=
[
  term ((-15645550076829509687239 : Rat) / 629862144719762786538) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((15645550076829509687239 : Rat) / 1259724289439525573076) [(12, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1057 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1057_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1057
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1057 := by
  native_decide

/-- Coefficient term 1058 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1058 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (14, 1), (15, 2), (16, 2)]
]

/-- Partial product 1058 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1058 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1058 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1058_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1058
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1058 := by
  native_decide

/-- Coefficient term 1059 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1059 : Poly :=
[
  term ((1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)]
]

/-- Partial product 1059 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1059 : Poly :=
[
  term ((1 : Rat) / 3) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1059 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1059_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1059
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1059 := by
  native_decide

/-- Coefficient term 1060 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1060 : Poly :=
[
  term ((-355008827526072151840 : Rat) / 44990153194268770467) [(12, 1), (14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1060 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1060 : Poly :=
[
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(12, 1), (14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1060 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1060_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1060
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1060 := by
  native_decide

/-- Coefficient term 1061 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1061 : Poly :=
[
  term ((-1 : Rat) / 6) [(12, 1), (14, 2), (16, 1)]
]

/-- Partial product 1061 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1061 : Poly :=
[
  term ((-1 : Rat) / 3) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((1 : Rat) / 6) [(12, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1061 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1061_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1061
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1061 := by
  native_decide

/-- Coefficient term 1062 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1062 : Poly :=
[
  term ((2432995068194262926443 : Rat) / 29993435462845846978) [(12, 1), (15, 2), (16, 1)]
]

/-- Partial product 1062 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1062 : Poly :=
[
  term ((2432995068194262926443 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2432995068194262926443 : Rat) / 29993435462845846978) [(12, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1062 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1062_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1062
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1062 := by
  native_decide

/-- Coefficient term 1063 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1063 : Poly :=
[
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(12, 1), (15, 2), (16, 2)]
]

/-- Partial product 1063 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1063 : Poly :=
[
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (12, 1), (15, 2), (16, 2)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(12, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1063 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1063_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1063
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1063 := by
  native_decide

/-- Coefficient term 1064 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1064 : Poly :=
[
  term ((18022682543490366157231 : Rat) / 59986870925691693956) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 1064 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1064 : Poly :=
[
  term ((18022682543490366157231 : Rat) / 29993435462845846978) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-18022682543490366157231 : Rat) / 59986870925691693956) [(13, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1064 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1064_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1064
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1064 := by
  native_decide

/-- Coefficient term 1065 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1065 : Poly :=
[
  term ((-1775044137630360759200 : Rat) / 44990153194268770467) [(13, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 1065 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1065 : Poly :=
[
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(13, 1), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1065 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1065_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1065
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1065 := by
  native_decide

/-- Coefficient term 1066 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1066 : Poly :=
[
  term ((-5600034321414928086805 : Rat) / 59986870925691693956) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 1066 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1066 : Poly :=
[
  term ((-5600034321414928086805 : Rat) / 29993435462845846978) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((5600034321414928086805 : Rat) / 59986870925691693956) [(13, 1), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1066 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1066_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1066
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1066 := by
  native_decide

/-- Coefficient term 1067 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1067 : Poly :=
[
  term ((-37646354994825654698143 : Rat) / 629862144719762786538) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 1067 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1067 : Poly :=
[
  term ((-37646354994825654698143 : Rat) / 314931072359881393269) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((37646354994825654698143 : Rat) / 629862144719762786538) [(13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1067 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1067_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1067
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1067 := by
  native_decide

/-- Coefficient term 1068 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1068 : Poly :=
[
  term ((-46463950857106982882461 : Rat) / 314931072359881393269) [(13, 1), (15, 3), (16, 1)]
]

/-- Partial product 1068 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1068 : Poly :=
[
  term ((-92927901714213965764922 : Rat) / 314931072359881393269) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((46463950857106982882461 : Rat) / 314931072359881393269) [(13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1068 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1068_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1068
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1068 := by
  native_decide

/-- Coefficient term 1069 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1069 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1069 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1069 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1069 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1069_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1069
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1069 := by
  native_decide

/-- Coefficient term 1070 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1070 : Poly :=
[
  term ((-1420035310104288607360 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)]
]

/-- Partial product 1070 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1070 : Poly :=
[
  term ((-2840070620208577214720 : Rat) / 14996717731422923489) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1070 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1070_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1070
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1070 := by
  native_decide

/-- Coefficient term 1071 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1071 : Poly :=
[
  term ((324327176196601458062503 : Rat) / 1259724289439525573076) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 1071 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1071 : Poly :=
[
  term ((324327176196601458062503 : Rat) / 629862144719762786538) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((-324327176196601458062503 : Rat) / 1259724289439525573076) [(14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1071 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1071_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1071
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1071 := by
  native_decide

/-- Coefficient term 1072 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1072 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(14, 1), (15, 2), (16, 2)]
]

/-- Partial product 1072 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1072 : Poly :=
[
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (14, 1), (15, 2), (16, 2)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(14, 1), (15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1072 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1072_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1072
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1072 := by
  native_decide

/-- Coefficient term 1073 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1073 : Poly :=
[
  term ((710017655052144303680 : Rat) / 14996717731422923489) [(14, 1), (15, 4), (16, 1)]
]

/-- Partial product 1073 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1073 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (14, 1), (15, 4), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(14, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1073 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1073_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1073
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1073 := by
  native_decide

/-- Coefficient term 1074 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1074 : Poly :=
[
  term ((17 : Rat) / 24) [(14, 1), (16, 1)]
]

/-- Partial product 1074 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1074 : Poly :=
[
  term ((17 : Rat) / 12) [(6, 1), (14, 1), (16, 1)],
  term ((-17 : Rat) / 24) [(14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1074 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1074_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1074
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1074 := by
  native_decide

/-- Coefficient term 1075 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1075 : Poly :=
[
  term ((-301070383667922996691789 : Rat) / 1259724289439525573076) [(14, 2), (15, 2), (16, 1)]
]

/-- Partial product 1075 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1075 : Poly :=
[
  term ((-301070383667922996691789 : Rat) / 629862144719762786538) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((301070383667922996691789 : Rat) / 1259724289439525573076) [(14, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1075 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1075_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1075
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1075 := by
  native_decide

/-- Coefficient term 1076 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1076 : Poly :=
[
  term ((-7 : Rat) / 24) [(14, 2), (16, 1)]
]

/-- Partial product 1076 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1076 : Poly :=
[
  term ((-7 : Rat) / 12) [(6, 1), (14, 2), (16, 1)],
  term ((7 : Rat) / 24) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1076 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1076_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1076
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1076 := by
  native_decide

/-- Coefficient term 1077 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1077 : Poly :=
[
  term ((710017655052144303680 : Rat) / 44990153194268770467) [(14, 3), (15, 2), (16, 1)]
]

/-- Partial product 1077 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1077 : Poly :=
[
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (14, 3), (15, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(14, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1077 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1077_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1077
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1077 := by
  native_decide

/-- Coefficient term 1078 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1078 : Poly :=
[
  term ((37769537830438767088871 : Rat) / 239947483702766775824) [(15, 2), (16, 1)]
]

/-- Partial product 1078 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1078 : Poly :=
[
  term ((37769537830438767088871 : Rat) / 119973741851383387912) [(6, 1), (15, 2), (16, 1)],
  term ((-37769537830438767088871 : Rat) / 239947483702766775824) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1078 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1078_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1078
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1078 := by
  native_decide

/-- Coefficient term 1079 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1079 : Poly :=
[
  term ((4383909237210669214 : Rat) / 445447061329393767) [(15, 2), (16, 2)]
]

/-- Partial product 1079 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1079 : Poly :=
[
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (15, 2), (16, 2)],
  term ((-4383909237210669214 : Rat) / 445447061329393767) [(15, 2), (16, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1079 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1079_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1079
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1079 := by
  native_decide

/-- Coefficient term 1080 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1080 : Poly :=
[
  term ((-134228555737826200903047 : Rat) / 419908096479841857692) [(15, 4), (16, 1)]
]

/-- Partial product 1080 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1080 : Poly :=
[
  term ((-134228555737826200903047 : Rat) / 209954048239920928846) [(6, 1), (15, 4), (16, 1)],
  term ((134228555737826200903047 : Rat) / 419908096479841857692) [(15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1080 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1080_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1080
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1080 := by
  native_decide

/-- Coefficient term 1081 from coefficient polynomial 16. -/
def rs_R007_ueqv_R007NY_coefficient_16_1081 : Poly :=
[
  term ((5 : Rat) / 6) [(16, 1)]
]

/-- Partial product 1081 for generator 16. -/
def rs_R007_ueqv_R007NY_partial_16_1081 : Poly :=
[
  term ((5 : Rat) / 3) [(6, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1081 for generator 16. -/
theorem rs_R007_ueqv_R007NY_partial_16_1081_valid :
    mulPoly rs_R007_ueqv_R007NY_coefficient_16_1081
        rs_R007_ueqv_R007NY_generator_16_1000_1081 =
      rs_R007_ueqv_R007NY_partial_16_1081 := by
  native_decide

/-- Partial products in this block. -/
def rs_R007_ueqv_R007NY_partials_16_1000_1081 : List Poly :=
[
  rs_R007_ueqv_R007NY_partial_16_1000,
  rs_R007_ueqv_R007NY_partial_16_1001,
  rs_R007_ueqv_R007NY_partial_16_1002,
  rs_R007_ueqv_R007NY_partial_16_1003,
  rs_R007_ueqv_R007NY_partial_16_1004,
  rs_R007_ueqv_R007NY_partial_16_1005,
  rs_R007_ueqv_R007NY_partial_16_1006,
  rs_R007_ueqv_R007NY_partial_16_1007,
  rs_R007_ueqv_R007NY_partial_16_1008,
  rs_R007_ueqv_R007NY_partial_16_1009,
  rs_R007_ueqv_R007NY_partial_16_1010,
  rs_R007_ueqv_R007NY_partial_16_1011,
  rs_R007_ueqv_R007NY_partial_16_1012,
  rs_R007_ueqv_R007NY_partial_16_1013,
  rs_R007_ueqv_R007NY_partial_16_1014,
  rs_R007_ueqv_R007NY_partial_16_1015,
  rs_R007_ueqv_R007NY_partial_16_1016,
  rs_R007_ueqv_R007NY_partial_16_1017,
  rs_R007_ueqv_R007NY_partial_16_1018,
  rs_R007_ueqv_R007NY_partial_16_1019,
  rs_R007_ueqv_R007NY_partial_16_1020,
  rs_R007_ueqv_R007NY_partial_16_1021,
  rs_R007_ueqv_R007NY_partial_16_1022,
  rs_R007_ueqv_R007NY_partial_16_1023,
  rs_R007_ueqv_R007NY_partial_16_1024,
  rs_R007_ueqv_R007NY_partial_16_1025,
  rs_R007_ueqv_R007NY_partial_16_1026,
  rs_R007_ueqv_R007NY_partial_16_1027,
  rs_R007_ueqv_R007NY_partial_16_1028,
  rs_R007_ueqv_R007NY_partial_16_1029,
  rs_R007_ueqv_R007NY_partial_16_1030,
  rs_R007_ueqv_R007NY_partial_16_1031,
  rs_R007_ueqv_R007NY_partial_16_1032,
  rs_R007_ueqv_R007NY_partial_16_1033,
  rs_R007_ueqv_R007NY_partial_16_1034,
  rs_R007_ueqv_R007NY_partial_16_1035,
  rs_R007_ueqv_R007NY_partial_16_1036,
  rs_R007_ueqv_R007NY_partial_16_1037,
  rs_R007_ueqv_R007NY_partial_16_1038,
  rs_R007_ueqv_R007NY_partial_16_1039,
  rs_R007_ueqv_R007NY_partial_16_1040,
  rs_R007_ueqv_R007NY_partial_16_1041,
  rs_R007_ueqv_R007NY_partial_16_1042,
  rs_R007_ueqv_R007NY_partial_16_1043,
  rs_R007_ueqv_R007NY_partial_16_1044,
  rs_R007_ueqv_R007NY_partial_16_1045,
  rs_R007_ueqv_R007NY_partial_16_1046,
  rs_R007_ueqv_R007NY_partial_16_1047,
  rs_R007_ueqv_R007NY_partial_16_1048,
  rs_R007_ueqv_R007NY_partial_16_1049,
  rs_R007_ueqv_R007NY_partial_16_1050,
  rs_R007_ueqv_R007NY_partial_16_1051,
  rs_R007_ueqv_R007NY_partial_16_1052,
  rs_R007_ueqv_R007NY_partial_16_1053,
  rs_R007_ueqv_R007NY_partial_16_1054,
  rs_R007_ueqv_R007NY_partial_16_1055,
  rs_R007_ueqv_R007NY_partial_16_1056,
  rs_R007_ueqv_R007NY_partial_16_1057,
  rs_R007_ueqv_R007NY_partial_16_1058,
  rs_R007_ueqv_R007NY_partial_16_1059,
  rs_R007_ueqv_R007NY_partial_16_1060,
  rs_R007_ueqv_R007NY_partial_16_1061,
  rs_R007_ueqv_R007NY_partial_16_1062,
  rs_R007_ueqv_R007NY_partial_16_1063,
  rs_R007_ueqv_R007NY_partial_16_1064,
  rs_R007_ueqv_R007NY_partial_16_1065,
  rs_R007_ueqv_R007NY_partial_16_1066,
  rs_R007_ueqv_R007NY_partial_16_1067,
  rs_R007_ueqv_R007NY_partial_16_1068,
  rs_R007_ueqv_R007NY_partial_16_1069,
  rs_R007_ueqv_R007NY_partial_16_1070,
  rs_R007_ueqv_R007NY_partial_16_1071,
  rs_R007_ueqv_R007NY_partial_16_1072,
  rs_R007_ueqv_R007NY_partial_16_1073,
  rs_R007_ueqv_R007NY_partial_16_1074,
  rs_R007_ueqv_R007NY_partial_16_1075,
  rs_R007_ueqv_R007NY_partial_16_1076,
  rs_R007_ueqv_R007NY_partial_16_1077,
  rs_R007_ueqv_R007NY_partial_16_1078,
  rs_R007_ueqv_R007NY_partial_16_1079,
  rs_R007_ueqv_R007NY_partial_16_1080,
  rs_R007_ueqv_R007NY_partial_16_1081
]

/-- Sum of partial products in this block. -/
def rs_R007_ueqv_R007NY_block_16_1000_1081 : Poly :=
[
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (10, 2), (15, 2), (16, 2)],
  term ((-15 : Rat) / 4) [(6, 1), (10, 2), (16, 1)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(6, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-281417346199923236541901 : Rat) / 269940919165612622802) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((338136098685326320144588 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((70142547795370707424 : Rat) / 445447061329393767) [(6, 1), (11, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((83295657678668529422021 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((140285095590741414848 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (12, 1), (15, 1), (16, 2)],
  term ((476084202149521075700648 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-270490205329669721593355 : Rat) / 269940919165612622802) [(6, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((28000171607074640434025 : Rat) / 89980306388537540934) [(6, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((2310214952769611120224 : Rat) / 6797073504170102013) [(6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((62918886698242691937610 : Rat) / 314931072359881393269) [(6, 1), (11, 1), (13, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((11360282480834308858880 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2227695118883955297611777 : Rat) / 3779172868318576719228) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (14, 1), (15, 1), (16, 2)],
  term ((127505083938541876767195 : Rat) / 104977024119960464423) [(6, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-646441848667149550603309 : Rat) / 1889586434159288359614) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (11, 1), (14, 2), (15, 1), (16, 2)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (11, 1), (14, 2), (15, 3), (16, 1)],
  term ((835280326636640753187259 : Rat) / 944793217079644179807) [(6, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((-156916452505657804438477 : Rat) / 51417317936307166248) [(6, 1), (11, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(6, 1), (11, 1), (15, 1), (16, 2)],
  term ((86517476848829305143703 : Rat) / 1259724289439525573076) [(6, 1), (11, 1), (15, 3), (16, 1)],
  term ((189643442017000944836065 : Rat) / 104977024119960464423) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (14, 1), (16, 2)],
  term ((-522142467930835449192980 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (14, 2), (16, 1)],
  term ((-350712738976853537120 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (14, 2), (16, 2)],
  term ((-842252425327338659237630 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (12, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (12, 1), (16, 2)],
  term ((-84618763914561980363048 : Rat) / 314931072359881393269) [(6, 1), (11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-67588401726762424596394 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 44990153194268770467) [(6, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (13, 2), (16, 1)],
  term ((-1376380919581279917839665 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-528662753449896419850673 : Rat) / 222304286371680983484) [(6, 1), (11, 2), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (14, 1), (16, 2)],
  term ((28400706202085772147200 : Rat) / 134970459582806311401) [(6, 1), (11, 2), (14, 2), (15, 2), (16, 1)],
  term ((1788122575347879009426241 : Rat) / 944793217079644179807) [(6, 1), (11, 2), (14, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (14, 2), (16, 2)],
  term ((-491656423605717141358255 : Rat) / 314931072359881393269) [(6, 1), (11, 2), (14, 3), (16, 1)],
  term ((5635680584451532981492135 : Rat) / 3779172868318576719228) [(6, 1), (11, 2), (15, 2), (16, 1)],
  term ((187798595560393125400948 : Rat) / 44990153194268770467) [(6, 1), (11, 2), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(6, 1), (11, 2), (16, 2)],
  term ((-79173546614755657898080 : Rat) / 134970459582806311401) [(6, 1), (11, 3), (13, 1), (14, 1), (16, 1)],
  term ((73044710782599737250520 : Rat) / 134970459582806311401) [(6, 1), (11, 3), (13, 1), (16, 1)],
  term ((-1307835864608497899927100 : Rat) / 944793217079644179807) [(6, 1), (11, 3), (14, 1), (15, 1), (16, 1)],
  term ((267983257581512724142375 : Rat) / 944793217079644179807) [(6, 1), (11, 3), (15, 1), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-15645550076829509687239 : Rat) / 629862144719762786538) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(6, 1), (12, 1), (14, 1), (15, 2), (16, 2)],
  term ((1 : Rat) / 3) [(6, 1), (12, 1), (14, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(6, 1), (12, 1), (14, 2), (15, 2), (16, 1)],
  term ((-1 : Rat) / 3) [(6, 1), (12, 1), (14, 2), (16, 1)],
  term ((2432995068194262926443 : Rat) / 14996717731422923489) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (12, 1), (15, 2), (16, 2)],
  term ((18022682543490366157231 : Rat) / 29993435462845846978) [(6, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3550088275260721518400 : Rat) / 44990153194268770467) [(6, 1), (13, 1), (14, 1), (15, 3), (16, 1)],
  term ((-5600034321414928086805 : Rat) / 29993435462845846978) [(6, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-37646354994825654698143 : Rat) / 314931072359881393269) [(6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-92927901714213965764922 : Rat) / 314931072359881393269) [(6, 1), (13, 1), (15, 3), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (13, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 14996717731422923489) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((324327176196601458062503 : Rat) / 629862144719762786538) [(6, 1), (14, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(6, 1), (14, 1), (15, 2), (16, 2)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(6, 1), (14, 1), (15, 4), (16, 1)],
  term ((17 : Rat) / 12) [(6, 1), (14, 1), (16, 1)],
  term ((-301070383667922996691789 : Rat) / 629862144719762786538) [(6, 1), (14, 2), (15, 2), (16, 1)],
  term ((-7 : Rat) / 12) [(6, 1), (14, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 44990153194268770467) [(6, 1), (14, 3), (15, 2), (16, 1)],
  term ((37769537830438767088871 : Rat) / 119973741851383387912) [(6, 1), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(6, 1), (15, 2), (16, 2)],
  term ((-134228555737826200903047 : Rat) / 209954048239920928846) [(6, 1), (15, 4), (16, 1)],
  term ((5 : Rat) / 3) [(6, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(10, 2), (15, 2), (16, 2)],
  term ((15 : Rat) / 8) [(10, 2), (16, 1)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((3550088275260721518400 : Rat) / 44990153194268770467) [(11, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((3550088275260721518400 : Rat) / 134970459582806311401) [(11, 1), (12, 1), (13, 1), (16, 1)],
  term ((281417346199923236541901 : Rat) / 539881838331225245604) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (14, 1), (15, 1), (16, 2)],
  term ((-169068049342663160072294 : Rat) / 944793217079644179807) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-35071273897685353712 : Rat) / 445447061329393767) [(11, 1), (12, 1), (14, 2), (15, 1), (16, 2)],
  term ((-83295657678668529422021 : Rat) / 629862144719762786538) [(11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-70142547795370707424 : Rat) / 1336341183988181301) [(11, 1), (12, 1), (15, 1), (16, 2)],
  term ((-238042101074760537850324 : Rat) / 944793217079644179807) [(11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((270490205329669721593355 : Rat) / 539881838331225245604) [(11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-2840070620208577214720 : Rat) / 44990153194268770467) [(11, 1), (13, 1), (14, 2), (15, 2), (16, 1)],
  term ((-28000171607074640434025 : Rat) / 179960612777075081868) [(11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1155107476384805560112 : Rat) / 6797073504170102013) [(11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-31459443349121345968805 : Rat) / 314931072359881393269) [(11, 1), (13, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-5680141240417154429440 : Rat) / 44990153194268770467) [(11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2227695118883955297611777 : Rat) / 7558345736637153438456) [(11, 1), (14, 1), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 1336341183988181301) [(11, 1), (14, 1), (15, 1), (16, 2)],
  term ((-127505083938541876767195 : Rat) / 209954048239920928846) [(11, 1), (14, 1), (15, 3), (16, 1)],
  term ((646441848667149550603309 : Rat) / 3779172868318576719228) [(11, 1), (14, 2), (15, 1), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(11, 1), (14, 2), (15, 1), (16, 2)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(11, 1), (14, 2), (15, 3), (16, 1)],
  term ((-835280326636640753187259 : Rat) / 1889586434159288359614) [(11, 1), (14, 3), (15, 1), (16, 1)],
  term ((156916452505657804438477 : Rat) / 102834635872614332496) [(11, 1), (15, 1), (16, 1)],
  term ((35071273897685353712 : Rat) / 1336341183988181301) [(11, 1), (15, 1), (16, 2)],
  term ((-86517476848829305143703 : Rat) / 2519448578879051146152) [(11, 1), (15, 3), (16, 1)],
  term ((-189643442017000944836065 : Rat) / 209954048239920928846) [(11, 2), (12, 1), (14, 1), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 1), (16, 2)],
  term ((261071233965417724596490 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (14, 2), (16, 1)],
  term ((175356369488426768560 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (14, 2), (16, 2)],
  term ((421126212663669329618815 : Rat) / 944793217079644179807) [(11, 2), (12, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (12, 1), (16, 2)],
  term ((42309381957280990181524 : Rat) / 314931072359881393269) [(11, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((33794200863381212298197 : Rat) / 944793217079644179807) [(11, 2), (13, 1), (15, 1), (16, 1)],
  term ((7100176550521443036800 : Rat) / 44990153194268770467) [(11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-7100176550521443036800 : Rat) / 134970459582806311401) [(11, 2), (13, 2), (16, 1)],
  term ((1376380919581279917839665 : Rat) / 1889586434159288359614) [(11, 2), (14, 1), (15, 2), (16, 1)],
  term ((528662753449896419850673 : Rat) / 444608572743361966968) [(11, 2), (14, 1), (16, 1)],
  term ((43839092372106692140 : Rat) / 1336341183988181301) [(11, 2), (14, 1), (16, 2)],
  term ((-14200353101042886073600 : Rat) / 134970459582806311401) [(11, 2), (14, 2), (15, 2), (16, 1)],
  term ((-1788122575347879009426241 : Rat) / 1889586434159288359614) [(11, 2), (14, 2), (16, 1)],
  term ((-87678184744213384280 : Rat) / 1336341183988181301) [(11, 2), (14, 2), (16, 2)],
  term ((491656423605717141358255 : Rat) / 629862144719762786538) [(11, 2), (14, 3), (16, 1)],
  term ((-5635680584451532981492135 : Rat) / 7558345736637153438456) [(11, 2), (15, 2), (16, 1)],
  term ((-93899297780196562700474 : Rat) / 44990153194268770467) [(11, 2), (16, 1)],
  term ((-21919546186053346070 : Rat) / 1336341183988181301) [(11, 2), (16, 2)],
  term ((39586773307377828949040 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (14, 1), (16, 1)],
  term ((-36522355391299868625260 : Rat) / 134970459582806311401) [(11, 3), (13, 1), (16, 1)],
  term ((653917932304248949963550 : Rat) / 944793217079644179807) [(11, 3), (14, 1), (15, 1), (16, 1)],
  term ((-267983257581512724142375 : Rat) / 1889586434159288359614) [(11, 3), (15, 1), (16, 1)],
  term ((2840070620208577214720 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(12, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(12, 1), (13, 1), (15, 1), (16, 1)],
  term ((15645550076829509687239 : Rat) / 1259724289439525573076) [(12, 1), (14, 1), (15, 2), (16, 1)],
  term ((17535636948842676856 : Rat) / 445447061329393767) [(12, 1), (14, 1), (15, 2), (16, 2)],
  term ((-1 : Rat) / 6) [(12, 1), (14, 1), (16, 1)],
  term ((355008827526072151840 : Rat) / 44990153194268770467) [(12, 1), (14, 2), (15, 2), (16, 1)],
  term ((1 : Rat) / 6) [(12, 1), (14, 2), (16, 1)],
  term ((-2432995068194262926443 : Rat) / 29993435462845846978) [(12, 1), (15, 2), (16, 1)],
  term ((8767818474421338428 : Rat) / 445447061329393767) [(12, 1), (15, 2), (16, 2)],
  term ((-18022682543490366157231 : Rat) / 59986870925691693956) [(13, 1), (14, 1), (15, 1), (16, 1)],
  term ((1775044137630360759200 : Rat) / 44990153194268770467) [(13, 1), (14, 1), (15, 3), (16, 1)],
  term ((5600034321414928086805 : Rat) / 59986870925691693956) [(13, 1), (14, 2), (15, 1), (16, 1)],
  term ((37646354994825654698143 : Rat) / 629862144719762786538) [(13, 1), (15, 1), (16, 1)],
  term ((46463950857106982882461 : Rat) / 314931072359881393269) [(13, 1), (15, 3), (16, 1)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(13, 2), (14, 1), (15, 2), (16, 1)],
  term ((1420035310104288607360 : Rat) / 14996717731422923489) [(13, 2), (15, 2), (16, 1)],
  term ((-324327176196601458062503 : Rat) / 1259724289439525573076) [(14, 1), (15, 2), (16, 1)],
  term ((-8767818474421338428 : Rat) / 445447061329393767) [(14, 1), (15, 2), (16, 2)],
  term ((-710017655052144303680 : Rat) / 14996717731422923489) [(14, 1), (15, 4), (16, 1)],
  term ((-17 : Rat) / 24) [(14, 1), (16, 1)],
  term ((301070383667922996691789 : Rat) / 1259724289439525573076) [(14, 2), (15, 2), (16, 1)],
  term ((7 : Rat) / 24) [(14, 2), (16, 1)],
  term ((-710017655052144303680 : Rat) / 44990153194268770467) [(14, 3), (15, 2), (16, 1)],
  term ((-37769537830438767088871 : Rat) / 239947483702766775824) [(15, 2), (16, 1)],
  term ((-4383909237210669214 : Rat) / 445447061329393767) [(15, 2), (16, 2)],
  term ((134228555737826200903047 : Rat) / 419908096479841857692) [(15, 4), (16, 1)],
  term ((-5 : Rat) / 6) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 16, terms 1000 through 1081. -/
theorem rs_R007_ueqv_R007NY_block_16_1000_1081_valid :
    checkProductSumEq rs_R007_ueqv_R007NY_partials_16_1000_1081
      rs_R007_ueqv_R007NY_block_16_1000_1081 = true := by
  native_decide

end R007UeqvR007NYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
