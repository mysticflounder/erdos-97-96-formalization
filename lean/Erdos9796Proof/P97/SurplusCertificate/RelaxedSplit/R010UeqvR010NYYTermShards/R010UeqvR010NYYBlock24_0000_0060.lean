/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010NYY, term block 24:0-60

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010NYYTermShards

/-- Generator polynomial 24 for relaxed split surplus certificate `R010:u=v:R010NYY`. -/
def rs_R010_ueqv_R010NYY_generator_24_0000_0060 : Poly :=
[
  term (-2 : Rat) [(0, 1), (10, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (11, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(8, 1), (10, 1)],
  term (-1 : Rat) [(8, 2)],
  term (2 : Rat) [(9, 1), (11, 1)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0000 : Poly :=
[
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 0 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0000 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 2), (1, 1), (5, 1), (8, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 3), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 3), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0000_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0000
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0001 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 1 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0001 : Poly :=
[
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 2), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 2), (14, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 3), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0001_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0001
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0002 : Poly :=
[
  term ((5251737526729202151 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 2 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0002 : Poly :=
[
  term ((-5251737526729202151 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((5251737526729202151 : Rat) / 4211767005915325696) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((5251737526729202151 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-5251737526729202151 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((5251737526729202151 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-5251737526729202151 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((-5251737526729202151 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((5251737526729202151 : Rat) / 4211767005915325696) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0002_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0002
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0003 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 3 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0003 : Poly :=
[
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 2), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 3), (11, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 3), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0003_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0003
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0004 : Poly :=
[
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0004 : Poly :=
[
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 3), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 3), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0004_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0004
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0005 : Poly :=
[
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 5 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0005 : Poly :=
[
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 2), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0005_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0005
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0006 : Poly :=
[
  term ((-4303016838416635575 : Rat) / 2105883502957662848) [(1, 1), (11, 1), (16, 1)]
]

/-- Partial product 6 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0006 : Poly :=
[
  term ((4303016838416635575 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-4303016838416635575 : Rat) / 2105883502957662848) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((-4303016838416635575 : Rat) / 1052941751478831424) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((4303016838416635575 : Rat) / 2105883502957662848) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-4303016838416635575 : Rat) / 1052941751478831424) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((4303016838416635575 : Rat) / 2105883502957662848) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((4303016838416635575 : Rat) / 1052941751478831424) [(1, 2), (11, 2), (16, 1)],
  term ((-4303016838416635575 : Rat) / 2105883502957662848) [(1, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0006_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0006
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0007 : Poly :=
[
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0007 : Poly :=
[
  term ((-21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0007_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0007
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0008 : Poly :=
[
  term ((-24845504887116597 : Rat) / 11931351291544832) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0008 : Poly :=
[
  term ((24845504887116597 : Rat) / 5965675645772416) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-24845504887116597 : Rat) / 11931351291544832) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((-24845504887116597 : Rat) / 5965675645772416) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((24845504887116597 : Rat) / 11931351291544832) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((-24845504887116597 : Rat) / 5965675645772416) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((24845504887116597 : Rat) / 11931351291544832) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((24845504887116597 : Rat) / 5965675645772416) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-24845504887116597 : Rat) / 11931351291544832) [(1, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0008_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0008
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0009 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (15, 2), (16, 1)]
]

/-- Partial product 9 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0009 : Poly :=
[
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 2), (3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(1, 2), (3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0009_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0009
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0010 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 10 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0010 : Poly :=
[
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(1, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0010_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0010
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0011 : Poly :=
[
  term ((10925110817965791 : Rat) / 37605062552815408) [(3, 1), (5, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0011 : Poly :=
[
  term ((-10925110817965791 : Rat) / 18802531276407704) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(0, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(3, 1), (5, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0011_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0011
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0012 : Poly :=
[
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 12 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0012 : Poly :=
[
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 2), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(1, 2), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0012_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0012
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0013 : Poly :=
[
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 13 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0013 : Poly :=
[
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(1, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 2), (14, 1), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0013_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0013
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0014 : Poly :=
[
  term ((-10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (15, 2), (16, 1)]
]

/-- Partial product 14 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0014 : Poly :=
[
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(0, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(1, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (8, 2), (15, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0014_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0014
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0015 : Poly :=
[
  term ((6475349938341370743 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 15 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0015 : Poly :=
[
  term ((-6475349938341370743 : Rat) / 2105883502957662848) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((6475349938341370743 : Rat) / 4211767005915325696) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-6475349938341370743 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((6475349938341370743 : Rat) / 4211767005915325696) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((6475349938341370743 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-6475349938341370743 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((6475349938341370743 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-6475349938341370743 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0015_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0015
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0016 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 16 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0016 : Poly :=
[
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 2), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(1, 2), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 3), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0016_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0016
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0017 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 17 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0017 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (8, 1), (11, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0017_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0017
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0018 : Poly :=
[
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0018 : Poly :=
[
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0018_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0018
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0019 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (15, 3), (16, 1)]
]

/-- Partial product 19 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0019 : Poly :=
[
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 2), (3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(1, 2), (3, 1), (8, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (9, 2), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (10, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0019_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0019
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0020 : Poly :=
[
  term ((-363534495967615059 : Rat) / 37605062552815408) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0020 : Poly :=
[
  term ((363534495967615059 : Rat) / 18802531276407704) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(3, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0020_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0020
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0021 : Poly :=
[
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (11, 1), (14, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0021 : Poly :=
[
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 2), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(1, 2), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0021_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0021
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0022 : Poly :=
[
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 22 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0022 : Poly :=
[
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0022_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0022
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0023 : Poly :=
[
  term ((363534495967615059 : Rat) / 18802531276407704) [(3, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 23 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0023 : Poly :=
[
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0023_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0023
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0024 : Poly :=
[
  term ((-24660948612603078879 : Rat) / 2105883502957662848) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 24 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0024 : Poly :=
[
  term ((24660948612603078879 : Rat) / 1052941751478831424) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-24660948612603078879 : Rat) / 2105883502957662848) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((24660948612603078879 : Rat) / 1052941751478831424) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-24660948612603078879 : Rat) / 2105883502957662848) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((-24660948612603078879 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((24660948612603078879 : Rat) / 2105883502957662848) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((-24660948612603078879 : Rat) / 1052941751478831424) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((24660948612603078879 : Rat) / 2105883502957662848) [(3, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0024_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0024
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0025 : Poly :=
[
  term ((333796423576923 : Rat) / 426119688983744) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 25 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0025 : Poly :=
[
  term ((-333796423576923 : Rat) / 213059844491872) [(0, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0025_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0025
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0026 : Poly :=
[
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0026 : Poly :=
[
  term ((921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0026_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0026
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0027 : Poly :=
[
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (14, 1), (15, 3), (16, 1)]
]

/-- Partial product 27 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0027 : Poly :=
[
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 2), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(1, 2), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 2), (14, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 2), (14, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0027_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0027
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0028 : Poly :=
[
  term ((-15499205026962753 : Rat) / 11931351291544832) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0028 : Poly :=
[
  term ((15499205026962753 : Rat) / 5965675645772416) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((-15499205026962753 : Rat) / 11931351291544832) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((15499205026962753 : Rat) / 5965675645772416) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((-15499205026962753 : Rat) / 11931351291544832) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-15499205026962753 : Rat) / 5965675645772416) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((15499205026962753 : Rat) / 11931351291544832) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((-15499205026962753 : Rat) / 5965675645772416) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((15499205026962753 : Rat) / 11931351291544832) [(3, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0028_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0028
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0029 : Poly :=
[
  term ((-333796423576923 : Rat) / 213059844491872) [(3, 1), (15, 3), (16, 1)]
]

/-- Partial product 29 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0029 : Poly :=
[
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0029_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0029
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0030 : Poly :=
[
  term ((330127320565347 : Rat) / 852239377967488) [(4, 1), (16, 1)]
]

/-- Partial product 30 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0030 : Poly :=
[
  term ((-330127320565347 : Rat) / 426119688983744) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((330127320565347 : Rat) / 852239377967488) [(0, 2), (4, 1), (16, 1)],
  term ((-330127320565347 : Rat) / 426119688983744) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((330127320565347 : Rat) / 852239377967488) [(1, 2), (4, 1), (16, 1)],
  term ((330127320565347 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-330127320565347 : Rat) / 852239377967488) [(4, 1), (8, 2), (16, 1)],
  term ((330127320565347 : Rat) / 426119688983744) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-330127320565347 : Rat) / 852239377967488) [(4, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0030_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0030
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0031 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 31 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0031 : Poly :=
[
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 3), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0031_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0031
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0032 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 32 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0032 : Poly :=
[
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0032_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0032
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0033 : Poly :=
[
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 33 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0033 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0033_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0033
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0034 : Poly :=
[
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 34 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0034 : Poly :=
[
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (9, 1), (14, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0034_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0034
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0035 : Poly :=
[
  term ((-167105828102293247121 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 35 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0035 : Poly :=
[
  term ((167105828102293247121 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-167105828102293247121 : Rat) / 33694136047322605568) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((167105828102293247121 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-167105828102293247121 : Rat) / 33694136047322605568) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-167105828102293247121 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((167105828102293247121 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-167105828102293247121 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((167105828102293247121 : Rat) / 33694136047322605568) [(5, 1), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0035_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0035
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0036 : Poly :=
[
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 36 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0036 : Poly :=
[
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0036_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0036
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0037 : Poly :=
[
  term ((110729312173101 : Rat) / 426119688983744) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 37 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0037 : Poly :=
[
  term ((-110729312173101 : Rat) / 213059844491872) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((110729312173101 : Rat) / 426119688983744) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-110729312173101 : Rat) / 213059844491872) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((110729312173101 : Rat) / 426119688983744) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((110729312173101 : Rat) / 213059844491872) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-110729312173101 : Rat) / 426119688983744) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((110729312173101 : Rat) / 213059844491872) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-110729312173101 : Rat) / 426119688983744) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0037_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0037
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0038 : Poly :=
[
  term ((-12877199254377465621 : Rat) / 33694136047322605568) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 38 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0038 : Poly :=
[
  term ((12877199254377465621 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((-12877199254377465621 : Rat) / 33694136047322605568) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((12877199254377465621 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((-12877199254377465621 : Rat) / 33694136047322605568) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-12877199254377465621 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((12877199254377465621 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((-12877199254377465621 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((12877199254377465621 : Rat) / 33694136047322605568) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0038_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0038
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0039 : Poly :=
[
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0039 : Poly :=
[
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0039_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0039
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0040 : Poly :=
[
  term ((108832426183380943947 : Rat) / 33694136047322605568) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 40 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0040 : Poly :=
[
  term ((-108832426183380943947 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((108832426183380943947 : Rat) / 33694136047322605568) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((-108832426183380943947 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((108832426183380943947 : Rat) / 33694136047322605568) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((108832426183380943947 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-108832426183380943947 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((108832426183380943947 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-108832426183380943947 : Rat) / 33694136047322605568) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0040_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0040
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0041 : Poly :=
[
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 41 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0041 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(1, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(8, 1), (9, 3), (11, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(8, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0041_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0041
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0042 : Poly :=
[
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0042 : Poly :=
[
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 3), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(8, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0042_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0042
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0043 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(8, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0043 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(8, 3), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0043_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0043
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0044 : Poly :=
[
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (11, 2), (16, 1)]
]

/-- Partial product 44 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0044 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(1, 1), (8, 1), (11, 3), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (9, 1), (11, 3), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(8, 2), (10, 1), (11, 2), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(8, 3), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0044_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0044
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0045 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (15, 2), (16, 1)]
]

/-- Partial product 45 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0045 : Poly :=
[
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(8, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0045_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0045
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0046 : Poly :=
[
  term ((-3508079821965097 : Rat) / 1278359066951232) [(8, 1), (16, 1)]
]

/-- Partial product 46 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0046 : Poly :=
[
  term ((3508079821965097 : Rat) / 639179533475616) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((-3508079821965097 : Rat) / 1278359066951232) [(0, 2), (8, 1), (16, 1)],
  term ((3508079821965097 : Rat) / 639179533475616) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-3508079821965097 : Rat) / 1278359066951232) [(1, 2), (8, 1), (16, 1)],
  term ((-3508079821965097 : Rat) / 639179533475616) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((3508079821965097 : Rat) / 1278359066951232) [(8, 1), (9, 2), (16, 1)],
  term ((-3508079821965097 : Rat) / 639179533475616) [(8, 2), (10, 1), (16, 1)],
  term ((3508079821965097 : Rat) / 1278359066951232) [(8, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0046_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0046
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0047 : Poly :=
[
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 47 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0047 : Poly :=
[
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(1, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(9, 3), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0047_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0047
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0048 : Poly :=
[
  term ((941298258344299718295 : Rat) / 16847068023661302784) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 48 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0048 : Poly :=
[
  term ((-941298258344299718295 : Rat) / 8423534011830651392) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((941298258344299718295 : Rat) / 16847068023661302784) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-941298258344299718295 : Rat) / 8423534011830651392) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((941298258344299718295 : Rat) / 16847068023661302784) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((941298258344299718295 : Rat) / 8423534011830651392) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-941298258344299718295 : Rat) / 16847068023661302784) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((941298258344299718295 : Rat) / 8423534011830651392) [(9, 2), (11, 2), (16, 1)],
  term ((-941298258344299718295 : Rat) / 16847068023661302784) [(9, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0048_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0048
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0049 : Poly :=
[
  term ((-70302592550481639 : Rat) / 5965675645772416) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0049 : Poly :=
[
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0049_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0049
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0050 : Poly :=
[
  term ((359145881497034343 : Rat) / 23862702583089664) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0050 : Poly :=
[
  term ((-359145881497034343 : Rat) / 11931351291544832) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((359145881497034343 : Rat) / 23862702583089664) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-359145881497034343 : Rat) / 11931351291544832) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((359145881497034343 : Rat) / 23862702583089664) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((359145881497034343 : Rat) / 11931351291544832) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-359145881497034343 : Rat) / 23862702583089664) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((359145881497034343 : Rat) / 11931351291544832) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-359145881497034343 : Rat) / 23862702583089664) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0050_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0050
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0051 : Poly :=
[
  term ((-1213901201996199 : Rat) / 1704478755934976) [(10, 1), (16, 1)]
]

/-- Partial product 51 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0051 : Poly :=
[
  term ((1213901201996199 : Rat) / 852239377967488) [(0, 1), (10, 2), (16, 1)],
  term ((-1213901201996199 : Rat) / 1704478755934976) [(0, 2), (10, 1), (16, 1)],
  term ((1213901201996199 : Rat) / 852239377967488) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-1213901201996199 : Rat) / 1704478755934976) [(1, 2), (10, 1), (16, 1)],
  term ((-1213901201996199 : Rat) / 852239377967488) [(8, 1), (10, 2), (16, 1)],
  term ((1213901201996199 : Rat) / 1704478755934976) [(8, 2), (10, 1), (16, 1)],
  term ((-1213901201996199 : Rat) / 852239377967488) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((1213901201996199 : Rat) / 1704478755934976) [(9, 2), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0051_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0051
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0052 : Poly :=
[
  term ((76008243672993308491 : Rat) / 16847068023661302784) [(11, 1), (13, 1), (16, 1)]
]

/-- Partial product 52 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0052 : Poly :=
[
  term ((-76008243672993308491 : Rat) / 8423534011830651392) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((76008243672993308491 : Rat) / 16847068023661302784) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((-76008243672993308491 : Rat) / 8423534011830651392) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((76008243672993308491 : Rat) / 16847068023661302784) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((76008243672993308491 : Rat) / 8423534011830651392) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-76008243672993308491 : Rat) / 16847068023661302784) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((76008243672993308491 : Rat) / 8423534011830651392) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-76008243672993308491 : Rat) / 16847068023661302784) [(9, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0052_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0052
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0053 : Poly :=
[
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0053 : Poly :=
[
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0053_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0053
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0054 : Poly :=
[
  term ((-1024466476275620166077 : Rat) / 16847068023661302784) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 54 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0054 : Poly :=
[
  term ((1024466476275620166077 : Rat) / 8423534011830651392) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1024466476275620166077 : Rat) / 16847068023661302784) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((1024466476275620166077 : Rat) / 8423534011830651392) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-1024466476275620166077 : Rat) / 16847068023661302784) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1024466476275620166077 : Rat) / 8423534011830651392) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((1024466476275620166077 : Rat) / 16847068023661302784) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1024466476275620166077 : Rat) / 8423534011830651392) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1024466476275620166077 : Rat) / 16847068023661302784) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0054_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0054
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0055 : Poly :=
[
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(11, 2), (14, 1), (16, 1)]
]

/-- Partial product 55 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0055 : Poly :=
[
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(1, 1), (11, 3), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 2), (11, 2), (14, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(9, 2), (11, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0055_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0055
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0056 : Poly :=
[
  term ((178600225860031049 : Rat) / 71588107749268992) [(13, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0056 : Poly :=
[
  term ((-178600225860031049 : Rat) / 35794053874634496) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((178600225860031049 : Rat) / 71588107749268992) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((-178600225860031049 : Rat) / 35794053874634496) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((178600225860031049 : Rat) / 71588107749268992) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((178600225860031049 : Rat) / 35794053874634496) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-178600225860031049 : Rat) / 71588107749268992) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((178600225860031049 : Rat) / 35794053874634496) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-178600225860031049 : Rat) / 71588107749268992) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0056_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0056
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0057 : Poly :=
[
  term ((1353319841726368049 : Rat) / 47725405166179328) [(14, 1), (15, 2), (16, 1)]
]

/-- Partial product 57 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0057 : Poly :=
[
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(9, 2), (14, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0057_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0057
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0058 : Poly :=
[
  term ((11986614995996003 : Rat) / 2556718133902464) [(14, 1), (16, 1)]
]

/-- Partial product 58 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0058 : Poly :=
[
  term ((-11986614995996003 : Rat) / 1278359066951232) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((11986614995996003 : Rat) / 2556718133902464) [(0, 2), (14, 1), (16, 1)],
  term ((-11986614995996003 : Rat) / 1278359066951232) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((11986614995996003 : Rat) / 2556718133902464) [(1, 2), (14, 1), (16, 1)],
  term ((11986614995996003 : Rat) / 1278359066951232) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-11986614995996003 : Rat) / 2556718133902464) [(8, 2), (14, 1), (16, 1)],
  term ((11986614995996003 : Rat) / 1278359066951232) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-11986614995996003 : Rat) / 2556718133902464) [(9, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0058_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0058
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0059 : Poly :=
[
  term ((-1145793299788306447 : Rat) / 71588107749268992) [(15, 2), (16, 1)]
]

/-- Partial product 59 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0059 : Poly :=
[
  term ((1145793299788306447 : Rat) / 35794053874634496) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1145793299788306447 : Rat) / 71588107749268992) [(0, 2), (15, 2), (16, 1)],
  term ((1145793299788306447 : Rat) / 35794053874634496) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1145793299788306447 : Rat) / 71588107749268992) [(1, 2), (15, 2), (16, 1)],
  term ((-1145793299788306447 : Rat) / 35794053874634496) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((1145793299788306447 : Rat) / 71588107749268992) [(8, 2), (15, 2), (16, 1)],
  term ((-1145793299788306447 : Rat) / 35794053874634496) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((1145793299788306447 : Rat) / 71588107749268992) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0059_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0059
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 24. -/
def rs_R010_ueqv_R010NYY_coefficient_24_0060 : Poly :=
[
  term ((-1126512951770743 : Rat) / 639179533475616) [(16, 1)]
]

/-- Partial product 60 for generator 24. -/
def rs_R010_ueqv_R010NYY_partial_24_0060 : Poly :=
[
  term ((1126512951770743 : Rat) / 319589766737808) [(0, 1), (10, 1), (16, 1)],
  term ((-1126512951770743 : Rat) / 639179533475616) [(0, 2), (16, 1)],
  term ((1126512951770743 : Rat) / 319589766737808) [(1, 1), (11, 1), (16, 1)],
  term ((-1126512951770743 : Rat) / 639179533475616) [(1, 2), (16, 1)],
  term ((-1126512951770743 : Rat) / 319589766737808) [(8, 1), (10, 1), (16, 1)],
  term ((1126512951770743 : Rat) / 639179533475616) [(8, 2), (16, 1)],
  term ((-1126512951770743 : Rat) / 319589766737808) [(9, 1), (11, 1), (16, 1)],
  term ((1126512951770743 : Rat) / 639179533475616) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 24. -/
theorem rs_R010_ueqv_R010NYY_partial_24_0060_valid :
    mulPoly rs_R010_ueqv_R010NYY_coefficient_24_0060
        rs_R010_ueqv_R010NYY_generator_24_0000_0060 =
      rs_R010_ueqv_R010NYY_partial_24_0060 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010NYY_partials_24_0000_0060 : List Poly :=
[
  rs_R010_ueqv_R010NYY_partial_24_0000,
  rs_R010_ueqv_R010NYY_partial_24_0001,
  rs_R010_ueqv_R010NYY_partial_24_0002,
  rs_R010_ueqv_R010NYY_partial_24_0003,
  rs_R010_ueqv_R010NYY_partial_24_0004,
  rs_R010_ueqv_R010NYY_partial_24_0005,
  rs_R010_ueqv_R010NYY_partial_24_0006,
  rs_R010_ueqv_R010NYY_partial_24_0007,
  rs_R010_ueqv_R010NYY_partial_24_0008,
  rs_R010_ueqv_R010NYY_partial_24_0009,
  rs_R010_ueqv_R010NYY_partial_24_0010,
  rs_R010_ueqv_R010NYY_partial_24_0011,
  rs_R010_ueqv_R010NYY_partial_24_0012,
  rs_R010_ueqv_R010NYY_partial_24_0013,
  rs_R010_ueqv_R010NYY_partial_24_0014,
  rs_R010_ueqv_R010NYY_partial_24_0015,
  rs_R010_ueqv_R010NYY_partial_24_0016,
  rs_R010_ueqv_R010NYY_partial_24_0017,
  rs_R010_ueqv_R010NYY_partial_24_0018,
  rs_R010_ueqv_R010NYY_partial_24_0019,
  rs_R010_ueqv_R010NYY_partial_24_0020,
  rs_R010_ueqv_R010NYY_partial_24_0021,
  rs_R010_ueqv_R010NYY_partial_24_0022,
  rs_R010_ueqv_R010NYY_partial_24_0023,
  rs_R010_ueqv_R010NYY_partial_24_0024,
  rs_R010_ueqv_R010NYY_partial_24_0025,
  rs_R010_ueqv_R010NYY_partial_24_0026,
  rs_R010_ueqv_R010NYY_partial_24_0027,
  rs_R010_ueqv_R010NYY_partial_24_0028,
  rs_R010_ueqv_R010NYY_partial_24_0029,
  rs_R010_ueqv_R010NYY_partial_24_0030,
  rs_R010_ueqv_R010NYY_partial_24_0031,
  rs_R010_ueqv_R010NYY_partial_24_0032,
  rs_R010_ueqv_R010NYY_partial_24_0033,
  rs_R010_ueqv_R010NYY_partial_24_0034,
  rs_R010_ueqv_R010NYY_partial_24_0035,
  rs_R010_ueqv_R010NYY_partial_24_0036,
  rs_R010_ueqv_R010NYY_partial_24_0037,
  rs_R010_ueqv_R010NYY_partial_24_0038,
  rs_R010_ueqv_R010NYY_partial_24_0039,
  rs_R010_ueqv_R010NYY_partial_24_0040,
  rs_R010_ueqv_R010NYY_partial_24_0041,
  rs_R010_ueqv_R010NYY_partial_24_0042,
  rs_R010_ueqv_R010NYY_partial_24_0043,
  rs_R010_ueqv_R010NYY_partial_24_0044,
  rs_R010_ueqv_R010NYY_partial_24_0045,
  rs_R010_ueqv_R010NYY_partial_24_0046,
  rs_R010_ueqv_R010NYY_partial_24_0047,
  rs_R010_ueqv_R010NYY_partial_24_0048,
  rs_R010_ueqv_R010NYY_partial_24_0049,
  rs_R010_ueqv_R010NYY_partial_24_0050,
  rs_R010_ueqv_R010NYY_partial_24_0051,
  rs_R010_ueqv_R010NYY_partial_24_0052,
  rs_R010_ueqv_R010NYY_partial_24_0053,
  rs_R010_ueqv_R010NYY_partial_24_0054,
  rs_R010_ueqv_R010NYY_partial_24_0055,
  rs_R010_ueqv_R010NYY_partial_24_0056,
  rs_R010_ueqv_R010NYY_partial_24_0057,
  rs_R010_ueqv_R010NYY_partial_24_0058,
  rs_R010_ueqv_R010NYY_partial_24_0059,
  rs_R010_ueqv_R010NYY_partial_24_0060
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010NYY_block_24_0000_0060 : Poly :=
[
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((-5251737526729202151 : Rat) / 2105883502957662848) [(0, 1), (1, 1), (5, 1), (10, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((4303016838416635575 : Rat) / 1052941751478831424) [(0, 1), (1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(0, 1), (1, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((24845504887116597 : Rat) / 5965675645772416) [(0, 1), (1, 1), (10, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(0, 1), (3, 1), (5, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(0, 1), (3, 1), (5, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(0, 1), (3, 1), (5, 1), (10, 1), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 1), (3, 1), (5, 1), (10, 1), (15, 2), (16, 1)],
  term ((-6475349938341370743 : Rat) / 2105883502957662848) [(0, 1), (3, 1), (5, 1), (10, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(0, 1), (3, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(0, 1), (3, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 1), (3, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((24660948612603078879 : Rat) / 1052941751478831424) [(0, 1), (3, 1), (10, 1), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(0, 1), (3, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(0, 1), (3, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((15499205026962753 : Rat) / 5965675645772416) [(0, 1), (3, 1), (10, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 1), (3, 1), (10, 1), (15, 3), (16, 1)],
  term ((-330127320565347 : Rat) / 426119688983744) [(0, 1), (4, 1), (10, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((167105828102293247121 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (9, 1), (10, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(0, 1), (5, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-110729312173101 : Rat) / 213059844491872) [(0, 1), (5, 1), (10, 1), (11, 1), (16, 1)],
  term ((12877199254377465621 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (10, 1), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(0, 1), (5, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-108832426183380943947 : Rat) / 16847068023661302784) [(0, 1), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(0, 1), (8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (8, 1), (10, 1), (11, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((3508079821965097 : Rat) / 639179533475616) [(0, 1), (8, 1), (10, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(0, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-941298258344299718295 : Rat) / 8423534011830651392) [(0, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(0, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-359145881497034343 : Rat) / 11931351291544832) [(0, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-76008243672993308491 : Rat) / 8423534011830651392) [(0, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(0, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1024466476275620166077 : Rat) / 8423534011830651392) [(0, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(0, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((-178600225860031049 : Rat) / 35794053874634496) [(0, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(0, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11986614995996003 : Rat) / 1278359066951232) [(0, 1), (10, 1), (14, 1), (16, 1)],
  term ((1145793299788306447 : Rat) / 35794053874634496) [(0, 1), (10, 1), (15, 2), (16, 1)],
  term ((1126512951770743 : Rat) / 319589766737808) [(0, 1), (10, 1), (16, 1)],
  term ((1213901201996199 : Rat) / 852239377967488) [(0, 1), (10, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(0, 2), (1, 1), (5, 1), (8, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(0, 2), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((5251737526729202151 : Rat) / 4211767005915325696) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(0, 2), (1, 1), (8, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(0, 2), (1, 1), (8, 1), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(0, 2), (1, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4303016838416635575 : Rat) / 2105883502957662848) [(0, 2), (1, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(0, 2), (1, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24845504887116597 : Rat) / 11931351291544832) [(0, 2), (1, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(0, 2), (3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(0, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(0, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(0, 2), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(0, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(0, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((6475349938341370743 : Rat) / 4211767005915325696) [(0, 2), (3, 1), (5, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(0, 2), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(0, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(0, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(0, 2), (3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(0, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(0, 2), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(0, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(0, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-24660948612603078879 : Rat) / 2105883502957662848) [(0, 2), (3, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(0, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(0, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(0, 2), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-15499205026962753 : Rat) / 11931351291544832) [(0, 2), (3, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(0, 2), (3, 1), (15, 3), (16, 1)],
  term ((330127320565347 : Rat) / 852239377967488) [(0, 2), (4, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-167105828102293247121 : Rat) / 33694136047322605568) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((110729312173101 : Rat) / 426119688983744) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-12877199254377465621 : Rat) / 33694136047322605568) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((108832426183380943947 : Rat) / 33694136047322605568) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(0, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(0, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(0, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(0, 2), (8, 1), (11, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(0, 2), (8, 1), (15, 2), (16, 1)],
  term ((-3508079821965097 : Rat) / 1278359066951232) [(0, 2), (8, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(0, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((941298258344299718295 : Rat) / 16847068023661302784) [(0, 2), (9, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(0, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((359145881497034343 : Rat) / 23862702583089664) [(0, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1213901201996199 : Rat) / 1704478755934976) [(0, 2), (10, 1), (16, 1)],
  term ((76008243672993308491 : Rat) / 16847068023661302784) [(0, 2), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(0, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1024466476275620166077 : Rat) / 16847068023661302784) [(0, 2), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(0, 2), (11, 2), (14, 1), (16, 1)],
  term ((178600225860031049 : Rat) / 71588107749268992) [(0, 2), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(0, 2), (14, 1), (15, 2), (16, 1)],
  term ((11986614995996003 : Rat) / 2556718133902464) [(0, 2), (14, 1), (16, 1)],
  term ((-1145793299788306447 : Rat) / 71588107749268992) [(0, 2), (15, 2), (16, 1)],
  term ((-1126512951770743 : Rat) / 639179533475616) [(0, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(1, 1), (3, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(1, 1), (3, 1), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(1, 1), (3, 1), (5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-6475349938341370743 : Rat) / 2105883502957662848) [(1, 1), (3, 1), (5, 1), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (8, 1), (11, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (8, 1), (11, 2), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (8, 1), (11, 2), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(1, 1), (3, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(1, 1), (3, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((15499205026962753 : Rat) / 5965675645772416) [(1, 1), (3, 1), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(1, 1), (3, 1), (11, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(1, 1), (3, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(1, 1), (3, 1), (11, 2), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((24660948612603078879 : Rat) / 1052941751478831424) [(1, 1), (3, 1), (11, 2), (16, 1)],
  term ((-330127320565347 : Rat) / 426119688983744) [(1, 1), (4, 1), (11, 1), (16, 1)],
  term ((1514267493796089513 : Rat) / 65808859467426964) [(1, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((5251737526729202151 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 1), (11, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 2), (14, 1), (16, 1)],
  term ((-5251737526729202151 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 2), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (8, 3), (16, 1)],
  term ((-1514267493796089513 : Rat) / 65808859467426964) [(1, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((209119728316126864329 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((-5251737526729202151 : Rat) / 4211767005915325696) [(1, 1), (5, 1), (9, 2), (16, 1)],
  term ((12877199254377465621 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (11, 1), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(1, 1), (5, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-108832426183380943947 : Rat) / 16847068023661302784) [(1, 1), (5, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(1, 1), (5, 1), (11, 2), (14, 1), (16, 1)],
  term ((-110729312173101 : Rat) / 213059844491872) [(1, 1), (5, 1), (11, 2), (16, 1)],
  term ((-154430197009804659 : Rat) / 2982837822886208) [(1, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-51954191106796685645 : Rat) / 394853156804561784) [(1, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4303016838416635575 : Rat) / 1052941751478831424) [(1, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 745709455721552) [(1, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-24845504887116597 : Rat) / 5965675645772416) [(1, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(1, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((3508079821965097 : Rat) / 639179533475616) [(1, 1), (8, 1), (11, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(1, 1), (8, 1), (11, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(1, 1), (8, 1), (11, 3), (16, 1)],
  term ((-58232073427577196457 : Rat) / 1052941751478831424) [(1, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 745709455721552) [(1, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((4303016838416635575 : Rat) / 2105883502957662848) [(1, 1), (8, 2), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((24845504887116597 : Rat) / 11931351291544832) [(1, 1), (8, 2), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (8, 3), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 1), (8, 3), (15, 1), (16, 1)],
  term ((154430197009804659 : Rat) / 2982837822886208) [(1, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-408836891271267537 : Rat) / 11931351291544832) [(1, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((51954191106796685645 : Rat) / 394853156804561784) [(1, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-975722393051632802895 : Rat) / 8423534011830651392) [(1, 1), (9, 1), (11, 2), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((4303016838416635575 : Rat) / 2105883502957662848) [(1, 1), (9, 2), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((24845504887116597 : Rat) / 11931351291544832) [(1, 1), (9, 2), (15, 1), (16, 1)],
  term ((1213901201996199 : Rat) / 852239377967488) [(1, 1), (10, 1), (11, 1), (16, 1)],
  term ((-178600225860031049 : Rat) / 35794053874634496) [(1, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(1, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-11986614995996003 : Rat) / 1278359066951232) [(1, 1), (11, 1), (14, 1), (16, 1)],
  term ((1145793299788306447 : Rat) / 35794053874634496) [(1, 1), (11, 1), (15, 2), (16, 1)],
  term ((1126512951770743 : Rat) / 319589766737808) [(1, 1), (11, 1), (16, 1)],
  term ((-76008243672993308491 : Rat) / 8423534011830651392) [(1, 1), (11, 2), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(1, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((1024466476275620166077 : Rat) / 8423534011830651392) [(1, 1), (11, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(1, 1), (11, 3), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(1, 2), (3, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(1, 2), (3, 1), (5, 1), (8, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 37605062552815408) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(1, 2), (3, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(1, 2), (3, 1), (5, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 18802531276407704) [(1, 2), (3, 1), (5, 1), (15, 2), (16, 1)],
  term ((6475349938341370743 : Rat) / 4211767005915325696) [(1, 2), (3, 1), (5, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(1, 2), (3, 1), (8, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(1, 2), (3, 1), (8, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(1, 2), (3, 1), (8, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(1, 2), (3, 1), (8, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 37605062552815408) [(1, 2), (3, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(1, 2), (3, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(1, 2), (3, 1), (11, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 18802531276407704) [(1, 2), (3, 1), (11, 1), (15, 2), (16, 1)],
  term ((-24660948612603078879 : Rat) / 2105883502957662848) [(1, 2), (3, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 426119688983744) [(1, 2), (3, 1), (13, 1), (15, 2), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(1, 2), (3, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(1, 2), (3, 1), (14, 1), (15, 3), (16, 1)],
  term ((-15499205026962753 : Rat) / 11931351291544832) [(1, 2), (3, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 213059844491872) [(1, 2), (3, 1), (15, 3), (16, 1)],
  term ((330127320565347 : Rat) / 852239377967488) [(1, 2), (4, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (8, 1), (9, 1), (16, 1)],
  term ((-59671896247098932445 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (8, 1), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-167105828102293247121 : Rat) / 33694136047322605568) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((59671896247098932445 : Rat) / 4211767005915325696) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-4704513265969737009 : Rat) / 2105883502957662848) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((-12877199254377465621 : Rat) / 33694136047322605568) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((108832426183380943947 : Rat) / 33694136047322605568) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(1, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(1, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-30470806713122293087225 : Rat) / 303247224425903450112) [(1, 2), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((418948508350870752361 : Rat) / 6317650508872988544) [(1, 2), (8, 1), (11, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(1, 2), (8, 1), (15, 2), (16, 1)],
  term ((-3508079821965097 : Rat) / 1278359066951232) [(1, 2), (8, 1), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(1, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((941298258344299718295 : Rat) / 16847068023661302784) [(1, 2), (9, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(1, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((359145881497034343 : Rat) / 23862702583089664) [(1, 2), (9, 1), (15, 1), (16, 1)],
  term ((-1213901201996199 : Rat) / 1704478755934976) [(1, 2), (10, 1), (16, 1)],
  term ((76008243672993308491 : Rat) / 16847068023661302784) [(1, 2), (11, 1), (13, 1), (16, 1)],
  term ((30470806713122293087225 : Rat) / 303247224425903450112) [(1, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-954302770474402896149 : Rat) / 16847068023661302784) [(1, 2), (11, 1), (15, 1), (16, 1)],
  term ((-418948508350870752361 : Rat) / 6317650508872988544) [(1, 2), (11, 2), (14, 1), (16, 1)],
  term ((4303016838416635575 : Rat) / 1052941751478831424) [(1, 2), (11, 2), (16, 1)],
  term ((178600225860031049 : Rat) / 71588107749268992) [(1, 2), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(1, 2), (14, 1), (15, 2), (16, 1)],
  term ((11986614995996003 : Rat) / 2556718133902464) [(1, 2), (14, 1), (16, 1)],
  term ((-1145793299788306447 : Rat) / 71588107749268992) [(1, 2), (15, 2), (16, 1)],
  term ((-1126512951770743 : Rat) / 639179533475616) [(1, 2), (16, 1)],
  term ((24616754095471512255 : Rat) / 4211767005915325696) [(1, 3), (5, 1), (8, 1), (16, 1)],
  term ((-24616754095471512255 : Rat) / 4211767005915325696) [(1, 3), (5, 1), (14, 1), (16, 1)],
  term ((5251737526729202151 : Rat) / 4211767005915325696) [(1, 3), (5, 1), (16, 1)],
  term ((-58232073427577196457 : Rat) / 2105883502957662848) [(1, 3), (8, 1), (11, 1), (16, 1)],
  term ((-21031901114830755 : Rat) / 1491418911443104) [(1, 3), (8, 1), (15, 1), (16, 1)],
  term ((58232073427577196457 : Rat) / 2105883502957662848) [(1, 3), (11, 1), (14, 1), (16, 1)],
  term ((-4303016838416635575 : Rat) / 2105883502957662848) [(1, 3), (11, 1), (16, 1)],
  term ((21031901114830755 : Rat) / 1491418911443104) [(1, 3), (14, 1), (15, 1), (16, 1)],
  term ((-24845504887116597 : Rat) / 11931351291544832) [(1, 3), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 1), (9, 2), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 1), (10, 1), (15, 2), (16, 1)],
  term ((6475349938341370743 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (8, 1), (10, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (8, 2), (10, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(3, 1), (5, 1), (8, 2), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 2), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (8, 2), (15, 2), (16, 1)],
  term ((-6475349938341370743 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (8, 2), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (8, 3), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (8, 3), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 4700632819101926) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((445809356405963151255 : Rat) / 16847068023661302784) [(3, 1), (5, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((6475349938341370743 : Rat) / 2105883502957662848) [(3, 1), (5, 1), (9, 1), (11, 1), (16, 1)],
  term ((-10925110817965791 : Rat) / 37605062552815408) [(3, 1), (5, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 9401265638203852) [(3, 1), (5, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-445809356405963151255 : Rat) / 33694136047322605568) [(3, 1), (5, 1), (9, 2), (14, 1), (16, 1)],
  term ((10925110817965791 : Rat) / 18802531276407704) [(3, 1), (5, 1), (9, 2), (15, 2), (16, 1)],
  term ((-6475349938341370743 : Rat) / 4211767005915325696) [(3, 1), (5, 1), (9, 2), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (9, 2), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (8, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-24660948612603078879 : Rat) / 1052941751478831424) [(3, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (8, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 1), (10, 1), (14, 1), (15, 3), (16, 1)],
  term ((-15499205026962753 : Rat) / 5965675645772416) [(3, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 1), (10, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 4700632819101926) [(3, 1), (8, 2), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((921238143868634625 : Rat) / 11931351291544832) [(3, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 53264961122968) [(3, 1), (8, 2), (10, 1), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(3, 1), (8, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (8, 2), (11, 1), (15, 2), (16, 1)],
  term ((24660948612603078879 : Rat) / 2105883502957662848) [(3, 1), (8, 2), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(3, 1), (8, 2), (13, 1), (15, 2), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 2), (14, 1), (15, 3), (16, 1)],
  term ((15499205026962753 : Rat) / 11931351291544832) [(3, 1), (8, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (8, 2), (15, 3), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (8, 3), (11, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (8, 3), (11, 1), (16, 1)],
  term ((-921238143868634625 : Rat) / 23862702583089664) [(3, 1), (8, 3), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (8, 3), (15, 3), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-921238143868634625 : Rat) / 11931351291544832) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 53264961122968) [(3, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-15499205026962753 : Rat) / 5965675645772416) [(3, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 4700632819101926) [(3, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2647720545115526336833 : Rat) / 8423534011830651392) [(3, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-24660948612603078879 : Rat) / 1052941751478831424) [(3, 1), (9, 1), (11, 2), (16, 1)],
  term ((363534495967615059 : Rat) / 37605062552815408) [(3, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 9401265638203852) [(3, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2647720545115526336833 : Rat) / 16847068023661302784) [(3, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-363534495967615059 : Rat) / 18802531276407704) [(3, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((24660948612603078879 : Rat) / 2105883502957662848) [(3, 1), (9, 2), (11, 1), (16, 1)],
  term ((-333796423576923 : Rat) / 426119688983744) [(3, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((921238143868634625 : Rat) / 23862702583089664) [(3, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 106529922245936) [(3, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((15499205026962753 : Rat) / 11931351291544832) [(3, 1), (9, 2), (15, 1), (16, 1)],
  term ((333796423576923 : Rat) / 213059844491872) [(3, 1), (9, 2), (15, 3), (16, 1)],
  term ((330127320565347 : Rat) / 426119688983744) [(4, 1), (8, 1), (10, 1), (16, 1)],
  term ((-330127320565347 : Rat) / 852239377967488) [(4, 1), (8, 2), (16, 1)],
  term ((330127320565347 : Rat) / 426119688983744) [(4, 1), (9, 1), (11, 1), (16, 1)],
  term ((-330127320565347 : Rat) / 852239377967488) [(4, 1), (9, 2), (16, 1)],
  term ((23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-167105828102293247121 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (9, 1), (10, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-5320174765121542341 : Rat) / 601681000845046528) [(5, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 1), (9, 3), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((110729312173101 : Rat) / 213059844491872) [(5, 1), (8, 1), (10, 1), (11, 1), (16, 1)],
  term ((-12877199254377465621 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (10, 1), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((108832426183380943947 : Rat) / 16847068023661302784) [(5, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 2105883502957662848) [(5, 1), (8, 2), (9, 1), (10, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (9, 1), (14, 1), (16, 1)],
  term ((167105828102293247121 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (9, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (8, 2), (10, 1), (11, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (10, 1), (15, 1), (16, 1)],
  term ((-10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 2), (11, 1), (14, 1), (16, 1)],
  term ((-110729312173101 : Rat) / 426119688983744) [(5, 1), (8, 2), (11, 1), (16, 1)],
  term ((12877199254377465621 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 2), (14, 1), (15, 1), (16, 1)],
  term ((-108832426183380943947 : Rat) / 33694136047322605568) [(5, 1), (8, 2), (15, 1), (16, 1)],
  term ((23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (8, 3), (9, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 4211767005915325696) [(5, 1), (8, 3), (11, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (8, 3), (15, 1), (16, 1)],
  term ((-12877199254377465621 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-915776598761011178391 : Rat) / 33694136047322605568) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((108832426183380943947 : Rat) / 16847068023661302784) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((10438388056155907935 : Rat) / 2105883502957662848) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((110729312173101 : Rat) / 213059844491872) [(5, 1), (9, 1), (11, 2), (16, 1)],
  term ((5320174765121542341 : Rat) / 601681000845046528) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-171483622188368968257 : Rat) / 16847068023661302784) [(5, 1), (9, 2), (11, 1), (16, 1)],
  term ((12877199254377465621 : Rat) / 33694136047322605568) [(5, 1), (9, 2), (13, 1), (16, 1)],
  term ((915776598761011178391 : Rat) / 67388272094645211136) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-108832426183380943947 : Rat) / 33694136047322605568) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-23839805706003352161 : Rat) / 4211767005915325696) [(5, 1), (9, 3), (14, 1), (16, 1)],
  term ((167105828102293247121 : Rat) / 33694136047322605568) [(5, 1), (9, 3), (16, 1)],
  term ((-240937308571641895789 : Rat) / 3158825254436494272) [(8, 1), (9, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((941298258344299718295 : Rat) / 8423534011830651392) [(8, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 2982837822886208) [(8, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((359145881497034343 : Rat) / 11931351291544832) [(8, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3508079821965097 : Rat) / 639179533475616) [(8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(8, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (9, 1), (11, 3), (16, 1)],
  term ((46170798261927073939801 : Rat) / 303247224425903450112) [(8, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((58902649908268031137 : Rat) / 902521501267569792) [(8, 1), (9, 2), (11, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(8, 1), (9, 2), (15, 2), (16, 1)],
  term ((3508079821965097 : Rat) / 1278359066951232) [(8, 1), (9, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(8, 1), (9, 3), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(8, 1), (9, 3), (15, 1), (16, 1)],
  term ((76008243672993308491 : Rat) / 8423534011830651392) [(8, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(8, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1024466476275620166077 : Rat) / 8423534011830651392) [(8, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(8, 1), (10, 1), (11, 2), (14, 1), (16, 1)],
  term ((178600225860031049 : Rat) / 35794053874634496) [(8, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(8, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((11986614995996003 : Rat) / 1278359066951232) [(8, 1), (10, 1), (14, 1), (16, 1)],
  term ((-1145793299788306447 : Rat) / 35794053874634496) [(8, 1), (10, 1), (15, 2), (16, 1)],
  term ((-1126512951770743 : Rat) / 319589766737808) [(8, 1), (10, 1), (16, 1)],
  term ((-1213901201996199 : Rat) / 852239377967488) [(8, 1), (10, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 3158825254436494272) [(8, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 2982837822886208) [(8, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(8, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-941298258344299718295 : Rat) / 16847068023661302784) [(8, 2), (9, 1), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(8, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-359145881497034343 : Rat) / 23862702583089664) [(8, 2), (9, 1), (15, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 151623612212951725056) [(8, 2), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 3158825254436494272) [(8, 2), (10, 1), (11, 2), (16, 1)],
  term ((-1353319841726368049 : Rat) / 23862702583089664) [(8, 2), (10, 1), (15, 2), (16, 1)],
  term ((-24422934969732179 : Rat) / 5113436267804928) [(8, 2), (10, 1), (16, 1)],
  term ((-76008243672993308491 : Rat) / 16847068023661302784) [(8, 2), (11, 1), (13, 1), (16, 1)],
  term ((-39023555492874908592505 : Rat) / 303247224425903450112) [(8, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1024466476275620166077 : Rat) / 16847068023661302784) [(8, 2), (11, 1), (15, 1), (16, 1)],
  term ((69556067785407573619 : Rat) / 6317650508872988544) [(8, 2), (11, 2), (14, 1), (16, 1)],
  term ((-178600225860031049 : Rat) / 71588107749268992) [(8, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(8, 2), (14, 1), (15, 2), (16, 1)],
  term ((-11986614995996003 : Rat) / 2556718133902464) [(8, 2), (14, 1), (16, 1)],
  term ((1145793299788306447 : Rat) / 71588107749268992) [(8, 2), (15, 2), (16, 1)],
  term ((1126512951770743 : Rat) / 639179533475616) [(8, 2), (16, 1)],
  term ((-240937308571641895789 : Rat) / 6317650508872988544) [(8, 3), (9, 1), (11, 1), (16, 1)],
  term ((-70302592550481639 : Rat) / 5965675645772416) [(8, 3), (9, 1), (15, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 303247224425903450112) [(8, 3), (11, 1), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 6317650508872988544) [(8, 3), (11, 2), (16, 1)],
  term ((1353319841726368049 : Rat) / 47725405166179328) [(8, 3), (15, 2), (16, 1)],
  term ((3508079821965097 : Rat) / 1278359066951232) [(8, 3), (16, 1)],
  term ((-1213901201996199 : Rat) / 852239377967488) [(9, 1), (10, 1), (11, 1), (16, 1)],
  term ((178600225860031049 : Rat) / 35794053874634496) [(9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1353319841726368049 : Rat) / 23862702583089664) [(9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((11986614995996003 : Rat) / 1278359066951232) [(9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-1145793299788306447 : Rat) / 35794053874634496) [(9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1126512951770743 : Rat) / 319589766737808) [(9, 1), (11, 1), (16, 1)],
  term ((76008243672993308491 : Rat) / 8423534011830651392) [(9, 1), (11, 2), (13, 1), (16, 1)],
  term ((39023555492874908592505 : Rat) / 151623612212951725056) [(9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1024466476275620166077 : Rat) / 8423534011830651392) [(9, 1), (11, 2), (15, 1), (16, 1)],
  term ((-69556067785407573619 : Rat) / 3158825254436494272) [(9, 1), (11, 3), (14, 1), (16, 1)],
  term ((1213901201996199 : Rat) / 1704478755934976) [(9, 2), (10, 1), (16, 1)],
  term ((-76008243672993308491 : Rat) / 16847068023661302784) [(9, 2), (11, 1), (13, 1), (16, 1)],
  term ((-46170798261927073939801 : Rat) / 303247224425903450112) [(9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1531580460949432658393 : Rat) / 16847068023661302784) [(9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-58902649908268031137 : Rat) / 902521501267569792) [(9, 2), (11, 2), (14, 1), (16, 1)],
  term ((941298258344299718295 : Rat) / 8423534011830651392) [(9, 2), (11, 2), (16, 1)],
  term ((-178600225860031049 : Rat) / 71588107749268992) [(9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1353319841726368049 : Rat) / 47725405166179328) [(9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-11986614995996003 : Rat) / 2556718133902464) [(9, 2), (14, 1), (16, 1)],
  term ((1145793299788306447 : Rat) / 71588107749268992) [(9, 2), (15, 2), (16, 1)],
  term ((1126512951770743 : Rat) / 639179533475616) [(9, 2), (16, 1)],
  term ((240937308571641895789 : Rat) / 6317650508872988544) [(9, 3), (11, 1), (14, 1), (16, 1)],
  term ((-941298258344299718295 : Rat) / 16847068023661302784) [(9, 3), (11, 1), (16, 1)],
  term ((70302592550481639 : Rat) / 5965675645772416) [(9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-359145881497034343 : Rat) / 23862702583089664) [(9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 24, terms 0 through 60. -/
theorem rs_R010_ueqv_R010NYY_block_24_0000_0060_valid :
    checkProductSumEq rs_R010_ueqv_R010NYY_partials_24_0000_0060
      rs_R010_ueqv_R010NYY_block_24_0000_0060 = true := by
  native_decide

end R010UeqvR010NYYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
