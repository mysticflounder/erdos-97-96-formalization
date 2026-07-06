/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 4:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 4 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_04_0000_0099 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(10, 2)],
  term (-1 : Rat) [(11, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0000 : Poly :=
[
  term ((-12370463792602028356086027509376 : Rat) / 1273790490336191187829975377157) []
]

/-- Partial product 0 for generator 4. -/
def ep_Q2_002_partial_04_0000 : Poly :=
[
  term ((-12370463792602028356086027509376 : Rat) / 1273790490336191187829975377157) [(2, 2)],
  term ((-12370463792602028356086027509376 : Rat) / 1273790490336191187829975377157) [(3, 2)],
  term ((12370463792602028356086027509376 : Rat) / 1273790490336191187829975377157) [(10, 2)],
  term ((12370463792602028356086027509376 : Rat) / 1273790490336191187829975377157) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 4. -/
theorem ep_Q2_002_partial_04_0000_valid :
    mulPoly ep_Q2_002_coefficient_04_0000
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0001 : Poly :=
[
  term ((4820870951848505286508379924032 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1)]
]

/-- Partial product 1 for generator 4. -/
def ep_Q2_002_partial_04_0001 : Poly :=
[
  term ((4820870951848505286508379924032 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((-4820870951848505286508379924032 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (10, 2)],
  term ((-4820870951848505286508379924032 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((4820870951848505286508379924032 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 4. -/
theorem ep_Q2_002_partial_04_0001_valid :
    mulPoly ep_Q2_002_coefficient_04_0001
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0002 : Poly :=
[
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (12, 1)]
]

/-- Partial product 2 for generator 4. -/
def ep_Q2_002_partial_04_0002 : Poly :=
[
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (3, 1), (12, 1)],
  term ((892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (10, 2), (12, 1)],
  term ((892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (11, 2), (12, 1)],
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 4. -/
theorem ep_Q2_002_partial_04_0002_valid :
    mulPoly ep_Q2_002_coefficient_04_0002
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0003 : Poly :=
[
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1)]
]

/-- Partial product 3 for generator 4. -/
def ep_Q2_002_partial_04_0003 : Poly :=
[
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (5, 1)],
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (5, 1)],
  term ((-2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (10, 2)],
  term ((-2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 4. -/
theorem ep_Q2_002_partial_04_0003_valid :
    mulPoly ep_Q2_002_coefficient_04_0003
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0004 : Poly :=
[
  term ((-9641741903697010573016759848064 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1)]
]

/-- Partial product 4 for generator 4. -/
def ep_Q2_002_partial_04_0004 : Poly :=
[
  term ((-9641741903697010573016759848064 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((-9641741903697010573016759848064 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((9641741903697010573016759848064 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term ((9641741903697010573016759848064 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 4. -/
theorem ep_Q2_002_partial_04_0004_valid :
    mulPoly ep_Q2_002_coefficient_04_0004
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0005 : Poly :=
[
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (12, 1)]
]

/-- Partial product 5 for generator 4. -/
def ep_Q2_002_partial_04_0005 : Poly :=
[
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (7, 1), (12, 1)],
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (7, 1), (12, 1)],
  term ((-1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (10, 2), (12, 1)],
  term ((-1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 4. -/
theorem ep_Q2_002_partial_04_0005_valid :
    mulPoly ep_Q2_002_coefficient_04_0005
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0006 : Poly :=
[
  term ((104053623801149625423786130848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1)]
]

/-- Partial product 6 for generator 4. -/
def ep_Q2_002_partial_04_0006 : Poly :=
[
  term ((104053623801149625423786130848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((104053623801149625423786130848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((-104053623801149625423786130848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((-104053623801149625423786130848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 4. -/
theorem ep_Q2_002_partial_04_0006_valid :
    mulPoly ep_Q2_002_coefficient_04_0006
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0007 : Poly :=
[
  term ((81256062337843686620490295405360 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1)]
]

/-- Partial product 7 for generator 4. -/
def ep_Q2_002_partial_04_0007 : Poly :=
[
  term ((81256062337843686620490295405360 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((81256062337843686620490295405360 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((-81256062337843686620490295405360 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((-81256062337843686620490295405360 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 4. -/
theorem ep_Q2_002_partial_04_0007_valid :
    mulPoly ep_Q2_002_coefficient_04_0007
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0008 : Poly :=
[
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 1), (12, 1)]
]

/-- Partial product 8 for generator 4. -/
def ep_Q2_002_partial_04_0008 : Poly :=
[
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (11, 1), (12, 1)],
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (11, 1), (12, 1)],
  term ((892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (10, 2), (11, 1), (12, 1)],
  term ((892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 4. -/
theorem ep_Q2_002_partial_04_0008_valid :
    mulPoly ep_Q2_002_coefficient_04_0008
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0009 : Poly :=
[
  term ((-173218925051523534193722528131136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (13, 1)]
]

/-- Partial product 9 for generator 4. -/
def ep_Q2_002_partial_04_0009 : Poly :=
[
  term ((-173218925051523534193722528131136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((-173218925051523534193722528131136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((173218925051523534193722528131136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (10, 2), (13, 1)],
  term ((173218925051523534193722528131136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 4. -/
theorem ep_Q2_002_partial_04_0009_valid :
    mulPoly ep_Q2_002_coefficient_04_0009
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0010 : Poly :=
[
  term ((2413702653204514171706980125705608492206968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (15, 1)]
]

/-- Partial product 10 for generator 4. -/
def ep_Q2_002_partial_04_0010 : Poly :=
[
  term ((2413702653204514171706980125705608492206968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((2413702653204514171706980125705608492206968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((-2413702653204514171706980125705608492206968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((-2413702653204514171706980125705608492206968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 4. -/
theorem ep_Q2_002_partial_04_0010_valid :
    mulPoly ep_Q2_002_coefficient_04_0010
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0011 : Poly :=
[
  term ((10592497274 : Rat) / 7401317245) [(0, 1), (1, 1), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 4. -/
def ep_Q2_002_partial_04_0011 : Poly :=
[
  term ((10592497274 : Rat) / 7401317245) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((10592497274 : Rat) / 7401317245) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((-10592497274 : Rat) / 7401317245) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((-10592497274 : Rat) / 7401317245) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 4. -/
theorem ep_Q2_002_partial_04_0011_valid :
    mulPoly ep_Q2_002_coefficient_04_0011
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0012 : Poly :=
[
  term ((-5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2)]
]

/-- Partial product 12 for generator 4. -/
def ep_Q2_002_partial_04_0012 : Poly :=
[
  term ((-5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (2, 2)],
  term ((-5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (3, 2)],
  term ((5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (10, 2)],
  term ((5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 4. -/
theorem ep_Q2_002_partial_04_0012_valid :
    mulPoly ep_Q2_002_coefficient_04_0012
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0013 : Poly :=
[
  term ((-68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 13 for generator 4. -/
def ep_Q2_002_partial_04_0013 : Poly :=
[
  term ((-68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 3)],
  term ((-68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 4. -/
theorem ep_Q2_002_partial_04_0013_valid :
    mulPoly ep_Q2_002_coefficient_04_0013
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0014 : Poly :=
[
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 1), (12, 1)]
]

/-- Partial product 14 for generator 4. -/
def ep_Q2_002_partial_04_0014 : Poly :=
[
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (11, 1), (12, 1)],
  term ((-12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (10, 2), (11, 1), (12, 1)],
  term ((-12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 3), (12, 1)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 4. -/
theorem ep_Q2_002_partial_04_0014_valid :
    mulPoly ep_Q2_002_coefficient_04_0014
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0015 : Poly :=
[
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (12, 1), (13, 1)]
]

/-- Partial product 15 for generator 4. -/
def ep_Q2_002_partial_04_0015 : Poly :=
[
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (12, 1), (13, 1)],
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (10, 2), (12, 1), (13, 1)],
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 2), (12, 1), (13, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 4. -/
theorem ep_Q2_002_partial_04_0015_valid :
    mulPoly ep_Q2_002_coefficient_04_0015
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0016 : Poly :=
[
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (12, 1), (15, 1)]
]

/-- Partial product 16 for generator 4. -/
def ep_Q2_002_partial_04_0016 : Poly :=
[
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (3, 1), (12, 1), (15, 1)],
  term ((-781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (10, 2), (12, 1), (15, 1)],
  term ((-781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 4. -/
theorem ep_Q2_002_partial_04_0016_valid :
    mulPoly ep_Q2_002_coefficient_04_0016
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0017 : Poly :=
[
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 4. -/
def ep_Q2_002_partial_04_0017 : Poly :=
[
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (3, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 4. -/
theorem ep_Q2_002_partial_04_0017_valid :
    mulPoly ep_Q2_002_coefficient_04_0017
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0018 : Poly :=
[
  term ((128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 18 for generator 4. -/
def ep_Q2_002_partial_04_0018 : Poly :=
[
  term ((128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (10, 2), (13, 1)],
  term ((-128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 2), (13, 1)],
  term ((128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 4. -/
theorem ep_Q2_002_partial_04_0018_valid :
    mulPoly ep_Q2_002_coefficient_04_0018
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0019 : Poly :=
[
  term ((-802220129144742210434286925077245255565312 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 19 for generator 4. -/
def ep_Q2_002_partial_04_0019 : Poly :=
[
  term ((-802220129144742210434286925077245255565312 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((802220129144742210434286925077245255565312 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((802220129144742210434286925077245255565312 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((-802220129144742210434286925077245255565312 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 4. -/
theorem ep_Q2_002_partial_04_0019_valid :
    mulPoly ep_Q2_002_coefficient_04_0019
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0020 : Poly :=
[
  term ((22025102804 : Rat) / 7401317245) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 4. -/
def ep_Q2_002_partial_04_0020 : Poly :=
[
  term ((22025102804 : Rat) / 7401317245) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-22025102804 : Rat) / 7401317245) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((-22025102804 : Rat) / 7401317245) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((22025102804 : Rat) / 7401317245) [(0, 1), (3, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 4. -/
theorem ep_Q2_002_partial_04_0020_valid :
    mulPoly ep_Q2_002_coefficient_04_0020
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0021 : Poly :=
[
  term ((-31261711261662058496205716019792 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 21 for generator 4. -/
def ep_Q2_002_partial_04_0021 : Poly :=
[
  term ((-31261711261662058496205716019792 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((-31261711261662058496205716019792 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((31261711261662058496205716019792 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (10, 2), (11, 1)],
  term ((31261711261662058496205716019792 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 4. -/
theorem ep_Q2_002_partial_04_0021_valid :
    mulPoly ep_Q2_002_coefficient_04_0021
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0022 : Poly :=
[
  term ((58871656742697324075854562156864 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 22 for generator 4. -/
def ep_Q2_002_partial_04_0022 : Poly :=
[
  term ((58871656742697324075854562156864 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((58871656742697324075854562156864 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((-58871656742697324075854562156864 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (10, 2), (13, 1)],
  term ((-58871656742697324075854562156864 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 4. -/
theorem ep_Q2_002_partial_04_0022_valid :
    mulPoly ep_Q2_002_coefficient_04_0022
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0023 : Poly :=
[
  term ((13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 23 for generator 4. -/
def ep_Q2_002_partial_04_0023 : Poly :=
[
  term ((13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((-13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((-13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 4. -/
theorem ep_Q2_002_partial_04_0023_valid :
    mulPoly ep_Q2_002_coefficient_04_0023
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0024 : Poly :=
[
  term ((621830788 : Rat) / 211466207) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 4. -/
def ep_Q2_002_partial_04_0024 : Poly :=
[
  term ((621830788 : Rat) / 211466207) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((621830788 : Rat) / 211466207) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((-621830788 : Rat) / 211466207) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-621830788 : Rat) / 211466207) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 4. -/
theorem ep_Q2_002_partial_04_0024_valid :
    mulPoly ep_Q2_002_coefficient_04_0024
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0025 : Poly :=
[
  term ((136316738915723936558415436396128 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 25 for generator 4. -/
def ep_Q2_002_partial_04_0025 : Poly :=
[
  term ((136316738915723936558415436396128 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((136316738915723936558415436396128 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((-136316738915723936558415436396128 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term ((-136316738915723936558415436396128 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 4. -/
theorem ep_Q2_002_partial_04_0025_valid :
    mulPoly ep_Q2_002_coefficient_04_0025
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0026 : Poly :=
[
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 1), (12, 1)]
]

/-- Partial product 26 for generator 4. -/
def ep_Q2_002_partial_04_0026 : Poly :=
[
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (7, 1), (11, 1), (12, 1)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (7, 1), (11, 1), (12, 1)],
  term ((25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 2), (11, 1), (12, 1)],
  term ((25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 4. -/
theorem ep_Q2_002_partial_04_0026_valid :
    mulPoly ep_Q2_002_coefficient_04_0026
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0027 : Poly :=
[
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (12, 1), (13, 1)]
]

/-- Partial product 27 for generator 4. -/
def ep_Q2_002_partial_04_0027 : Poly :=
[
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (7, 1), (12, 1), (13, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 2), (12, 1), (13, 1)],
  term ((-47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 4. -/
theorem ep_Q2_002_partial_04_0027_valid :
    mulPoly ep_Q2_002_coefficient_04_0027
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0028 : Poly :=
[
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (12, 1), (15, 1)]
]

/-- Partial product 28 for generator 4. -/
def ep_Q2_002_partial_04_0028 : Poly :=
[
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1)],
  term ((1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 4. -/
theorem ep_Q2_002_partial_04_0028_valid :
    mulPoly ep_Q2_002_coefficient_04_0028
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0029 : Poly :=
[
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 4. -/
def ep_Q2_002_partial_04_0029 : Poly :=
[
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((26204186168 : Rat) / 7401317245) [(0, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((26204186168 : Rat) / 7401317245) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 4. -/
theorem ep_Q2_002_partial_04_0029_valid :
    mulPoly ep_Q2_002_coefficient_04_0029
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0030 : Poly :=
[
  term ((-256709947659587041234792337467776 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 30 for generator 4. -/
def ep_Q2_002_partial_04_0030 : Poly :=
[
  term ((-256709947659587041234792337467776 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((-256709947659587041234792337467776 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((256709947659587041234792337467776 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((256709947659587041234792337467776 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 4. -/
theorem ep_Q2_002_partial_04_0030_valid :
    mulPoly ep_Q2_002_coefficient_04_0030
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0031 : Poly :=
[
  term ((1604440258289484420868573850154490511130624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 31 for generator 4. -/
def ep_Q2_002_partial_04_0031 : Poly :=
[
  term ((1604440258289484420868573850154490511130624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((1604440258289484420868573850154490511130624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-1604440258289484420868573850154490511130624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((-1604440258289484420868573850154490511130624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 4. -/
theorem ep_Q2_002_partial_04_0031_valid :
    mulPoly ep_Q2_002_coefficient_04_0031
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0032 : Poly :=
[
  term ((-44050205608 : Rat) / 7401317245) [(0, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 4. -/
def ep_Q2_002_partial_04_0032 : Poly :=
[
  term ((-44050205608 : Rat) / 7401317245) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-44050205608 : Rat) / 7401317245) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((44050205608 : Rat) / 7401317245) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((44050205608 : Rat) / 7401317245) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 4. -/
theorem ep_Q2_002_partial_04_0032_valid :
    mulPoly ep_Q2_002_coefficient_04_0032
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0033 : Poly :=
[
  term ((-1471129471272975101986168536696 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 33 for generator 4. -/
def ep_Q2_002_partial_04_0033 : Poly :=
[
  term ((-1471129471272975101986168536696 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((-1471129471272975101986168536696 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((1471129471272975101986168536696 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((1471129471272975101986168536696 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 4. -/
theorem ep_Q2_002_partial_04_0033_valid :
    mulPoly ep_Q2_002_coefficient_04_0033
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0034 : Poly :=
[
  term ((2770412295473418261319313944032 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 34 for generator 4. -/
def ep_Q2_002_partial_04_0034 : Poly :=
[
  term ((2770412295473418261319313944032 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((2770412295473418261319313944032 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((-2770412295473418261319313944032 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((-2770412295473418261319313944032 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 4. -/
theorem ep_Q2_002_partial_04_0034_valid :
    mulPoly ep_Q2_002_coefficient_04_0034
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0035 : Poly :=
[
  term ((1059184803249220561596571109266275155550072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 35 for generator 4. -/
def ep_Q2_002_partial_04_0035 : Poly :=
[
  term ((1059184803249220561596571109266275155550072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((1059184803249220561596571109266275155550072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((-1059184803249220561596571109266275155550072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-1059184803249220561596571109266275155550072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 4. -/
theorem ep_Q2_002_partial_04_0035_valid :
    mulPoly ep_Q2_002_coefficient_04_0035
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0036 : Poly :=
[
  term ((4172447528 : Rat) / 1057331035) [(0, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 36 for generator 4. -/
def ep_Q2_002_partial_04_0036 : Poly :=
[
  term ((4172447528 : Rat) / 1057331035) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((4172447528 : Rat) / 1057331035) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-4172447528 : Rat) / 1057331035) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-4172447528 : Rat) / 1057331035) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 4. -/
theorem ep_Q2_002_partial_04_0036_valid :
    mulPoly ep_Q2_002_coefficient_04_0036
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0037 : Poly :=
[
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (12, 1), (13, 1)]
]

/-- Partial product 37 for generator 4. -/
def ep_Q2_002_partial_04_0037 : Poly :=
[
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 4. -/
theorem ep_Q2_002_partial_04_0037_valid :
    mulPoly ep_Q2_002_coefficient_04_0037
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0038 : Poly :=
[
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 38 for generator 4. -/
def ep_Q2_002_partial_04_0038 : Poly :=
[
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((-781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 4. -/
theorem ep_Q2_002_partial_04_0038_valid :
    mulPoly ep_Q2_002_coefficient_04_0038
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0039 : Poly :=
[
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 4. -/
def ep_Q2_002_partial_04_0039 : Poly :=
[
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (11, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 4. -/
theorem ep_Q2_002_partial_04_0039_valid :
    mulPoly ep_Q2_002_coefficient_04_0039
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0040 : Poly :=
[
  term ((404929457520618938046579427270752 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 40 for generator 4. -/
def ep_Q2_002_partial_04_0040 : Poly :=
[
  term ((404929457520618938046579427270752 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((404929457520618938046579427270752 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-404929457520618938046579427270752 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((-404929457520618938046579427270752 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 4. -/
theorem ep_Q2_002_partial_04_0040_valid :
    mulPoly ep_Q2_002_coefficient_04_0040
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0041 : Poly :=
[
  term ((-40291606162087250825187305919381902104260 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 41 for generator 4. -/
def ep_Q2_002_partial_04_0041 : Poly :=
[
  term ((-40291606162087250825187305919381902104260 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-40291606162087250825187305919381902104260 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((40291606162087250825187305919381902104260 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((40291606162087250825187305919381902104260 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 4. -/
theorem ep_Q2_002_partial_04_0041_valid :
    mulPoly ep_Q2_002_coefficient_04_0041
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0042 : Poly :=
[
  term ((-9472995677 : Rat) / 1480263449) [(0, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 42 for generator 4. -/
def ep_Q2_002_partial_04_0042 : Poly :=
[
  term ((-9472995677 : Rat) / 1480263449) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-9472995677 : Rat) / 1480263449) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((9472995677 : Rat) / 1480263449) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((9472995677 : Rat) / 1480263449) [(0, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 4. -/
theorem ep_Q2_002_partial_04_0042_valid :
    mulPoly ep_Q2_002_coefficient_04_0042
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0043 : Poly :=
[
  term ((-31690610060386672318839733765080 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2)]
]

/-- Partial product 43 for generator 4. -/
def ep_Q2_002_partial_04_0043 : Poly :=
[
  term ((-31690610060386672318839733765080 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 2)],
  term ((-31690610060386672318839733765080 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 2)],
  term ((31690610060386672318839733765080 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (11, 2)],
  term ((31690610060386672318839733765080 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 4. -/
theorem ep_Q2_002_partial_04_0043_valid :
    mulPoly ep_Q2_002_coefficient_04_0043
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0044 : Poly :=
[
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (12, 1)]
]

/-- Partial product 44 for generator 4. -/
def ep_Q2_002_partial_04_0044 : Poly :=
[
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 2), (12, 1)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 2), (12, 1)],
  term ((-12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (11, 2), (12, 1)],
  term ((-12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 4), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 4. -/
theorem ep_Q2_002_partial_04_0044_valid :
    mulPoly ep_Q2_002_coefficient_04_0044
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0045 : Poly :=
[
  term ((50763878144211078031663673277968765298384 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 45 for generator 4. -/
def ep_Q2_002_partial_04_0045 : Poly :=
[
  term ((50763878144211078031663673277968765298384 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((50763878144211078031663673277968765298384 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-50763878144211078031663673277968765298384 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((-50763878144211078031663673277968765298384 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 4. -/
theorem ep_Q2_002_partial_04_0045_valid :
    mulPoly ep_Q2_002_coefficient_04_0045
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0046 : Poly :=
[
  term ((-2482085108 : Rat) / 125446055) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 4. -/
def ep_Q2_002_partial_04_0046 : Poly :=
[
  term ((-2482085108 : Rat) / 125446055) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2482085108 : Rat) / 125446055) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((2482085108 : Rat) / 125446055) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((2482085108 : Rat) / 125446055) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 4. -/
theorem ep_Q2_002_partial_04_0046_valid :
    mulPoly ep_Q2_002_coefficient_04_0046
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0047 : Poly :=
[
  term ((-650170601477256799478779949528064 : Rat) / 1273790490336191187829975377157) [(0, 1), (13, 2)]
]

/-- Partial product 47 for generator 4. -/
def ep_Q2_002_partial_04_0047 : Poly :=
[
  term ((-650170601477256799478779949528064 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (13, 2)],
  term ((-650170601477256799478779949528064 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (13, 2)],
  term ((650170601477256799478779949528064 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (13, 2)],
  term ((650170601477256799478779949528064 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 4. -/
theorem ep_Q2_002_partial_04_0047_valid :
    mulPoly ep_Q2_002_coefficient_04_0047
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0048 : Poly :=
[
  term ((-1205374040904672307016999158118600689287084 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (15, 2)]
]

/-- Partial product 48 for generator 4. -/
def ep_Q2_002_partial_04_0048 : Poly :=
[
  term ((-1205374040904672307016999158118600689287084 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (15, 2)],
  term ((-1205374040904672307016999158118600689287084 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (15, 2)],
  term ((1205374040904672307016999158118600689287084 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 2), (15, 2)],
  term ((1205374040904672307016999158118600689287084 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 4. -/
theorem ep_Q2_002_partial_04_0048_valid :
    mulPoly ep_Q2_002_coefficient_04_0048
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0049 : Poly :=
[
  term ((-5296248637 : Rat) / 7401317245) [(0, 1), (15, 2), (16, 1)]
]

/-- Partial product 49 for generator 4. -/
def ep_Q2_002_partial_04_0049 : Poly :=
[
  term ((-5296248637 : Rat) / 7401317245) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((-5296248637 : Rat) / 7401317245) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((5296248637 : Rat) / 7401317245) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((5296248637 : Rat) / 7401317245) [(0, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 4. -/
theorem ep_Q2_002_partial_04_0049_valid :
    mulPoly ep_Q2_002_coefficient_04_0049
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0050 : Poly :=
[
  term ((-222308460748264059718356855240 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1)]
]

/-- Partial product 50 for generator 4. -/
def ep_Q2_002_partial_04_0050 : Poly :=
[
  term ((-222308460748264059718356855240 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (3, 1)],
  term ((222308460748264059718356855240 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (10, 2)],
  term ((222308460748264059718356855240 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (11, 2)],
  term ((-222308460748264059718356855240 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 4. -/
theorem ep_Q2_002_partial_04_0050_valid :
    mulPoly ep_Q2_002_coefficient_04_0050
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0051 : Poly :=
[
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1)]
]

/-- Partial product 51 for generator 4. -/
def ep_Q2_002_partial_04_0051 : Poly :=
[
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (4, 1)],
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (10, 2)],
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (11, 2)],
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (4, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 4. -/
theorem ep_Q2_002_partial_04_0051_valid :
    mulPoly ep_Q2_002_coefficient_04_0051
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0052 : Poly :=
[
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (12, 1)]
]

/-- Partial product 52 for generator 4. -/
def ep_Q2_002_partial_04_0052 : Poly :=
[
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (4, 1), (12, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (10, 2), (12, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (11, 2), (12, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (4, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 4. -/
theorem ep_Q2_002_partial_04_0052_valid :
    mulPoly ep_Q2_002_coefficient_04_0052
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0053 : Poly :=
[
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1)]
]

/-- Partial product 53 for generator 4. -/
def ep_Q2_002_partial_04_0053 : Poly :=
[
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (3, 1), (5, 1), (7, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1), (10, 2)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 2)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 3), (5, 1), (7, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 4. -/
theorem ep_Q2_002_partial_04_0053_valid :
    mulPoly ep_Q2_002_coefficient_04_0053
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0054 : Poly :=
[
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (15, 1)]
]

/-- Partial product 54 for generator 4. -/
def ep_Q2_002_partial_04_0054 : Poly :=
[
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (10, 2), (15, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 4. -/
theorem ep_Q2_002_partial_04_0054_valid :
    mulPoly ep_Q2_002_coefficient_04_0054
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0055 : Poly :=
[
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1)]
]

/-- Partial product 55 for generator 4. -/
def ep_Q2_002_partial_04_0055 : Poly :=
[
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (9, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 2)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 2)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 4. -/
theorem ep_Q2_002_partial_04_0055_valid :
    mulPoly ep_Q2_002_coefficient_04_0055
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0056 : Poly :=
[
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 1)]
]

/-- Partial product 56 for generator 4. -/
def ep_Q2_002_partial_04_0056 : Poly :=
[
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (11, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (10, 2), (11, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 3)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 4. -/
theorem ep_Q2_002_partial_04_0056_valid :
    mulPoly ep_Q2_002_coefficient_04_0056
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0057 : Poly :=
[
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (13, 1)]
]

/-- Partial product 57 for generator 4. -/
def ep_Q2_002_partial_04_0057 : Poly :=
[
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (13, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (10, 2), (13, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 2), (13, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 4. -/
theorem ep_Q2_002_partial_04_0057_valid :
    mulPoly ep_Q2_002_coefficient_04_0057
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0058 : Poly :=
[
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (15, 1)]
]

/-- Partial product 58 for generator 4. -/
def ep_Q2_002_partial_04_0058 : Poly :=
[
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (3, 1), (7, 1), (15, 1)],
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (10, 2), (15, 1)],
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 4. -/
theorem ep_Q2_002_partial_04_0058_valid :
    mulPoly ep_Q2_002_coefficient_04_0058
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0059 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 4. -/
def ep_Q2_002_partial_04_0059 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 2), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 3), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 4. -/
theorem ep_Q2_002_partial_04_0059_valid :
    mulPoly ep_Q2_002_coefficient_04_0059
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0060 : Poly :=
[
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2)]
]

/-- Partial product 60 for generator 4. -/
def ep_Q2_002_partial_04_0060 : Poly :=
[
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 2)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (10, 2)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (11, 2)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 4. -/
theorem ep_Q2_002_partial_04_0060_valid :
    mulPoly ep_Q2_002_coefficient_04_0060
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0061 : Poly :=
[
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1)]
]

/-- Partial product 61 for generator 4. -/
def ep_Q2_002_partial_04_0061 : Poly :=
[
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (8, 1)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (10, 2)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (11, 2)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (8, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 4. -/
theorem ep_Q2_002_partial_04_0061_valid :
    mulPoly ep_Q2_002_coefficient_04_0061
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0062 : Poly :=
[
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (15, 1)]
]

/-- Partial product 62 for generator 4. -/
def ep_Q2_002_partial_04_0062 : Poly :=
[
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (10, 2), (15, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 4. -/
theorem ep_Q2_002_partial_04_0062_valid :
    mulPoly ep_Q2_002_coefficient_04_0062
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0063 : Poly :=
[
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 1), (15, 1)]
]

/-- Partial product 63 for generator 4. -/
def ep_Q2_002_partial_04_0063 : Poly :=
[
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (11, 1), (15, 1)],
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (10, 2), (11, 1), (15, 1)],
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 4. -/
theorem ep_Q2_002_partial_04_0063_valid :
    mulPoly ep_Q2_002_coefficient_04_0063
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0064 : Poly :=
[
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (12, 1)]
]

/-- Partial product 64 for generator 4. -/
def ep_Q2_002_partial_04_0064 : Poly :=
[
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (3, 1), (12, 1)],
  term ((-626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (10, 2), (12, 1)],
  term ((-626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (11, 2), (12, 1)],
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 4. -/
theorem ep_Q2_002_partial_04_0064_valid :
    mulPoly ep_Q2_002_coefficient_04_0064
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0065 : Poly :=
[
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (13, 1), (15, 1)]
]

/-- Partial product 65 for generator 4. -/
def ep_Q2_002_partial_04_0065 : Poly :=
[
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1)],
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (10, 2), (13, 1), (15, 1)],
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 4. -/
theorem ep_Q2_002_partial_04_0065_valid :
    mulPoly ep_Q2_002_coefficient_04_0065
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0066 : Poly :=
[
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (15, 2)]
]

/-- Partial product 66 for generator 4. -/
def ep_Q2_002_partial_04_0066 : Poly :=
[
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (10, 2), (15, 2)],
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 4. -/
theorem ep_Q2_002_partial_04_0066_valid :
    mulPoly ep_Q2_002_coefficient_04_0066
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0067 : Poly :=
[
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (15, 2), (16, 1)]
]

/-- Partial product 67 for generator 4. -/
def ep_Q2_002_partial_04_0067 : Poly :=
[
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (10, 2), (15, 2), (16, 1)],
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (3, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 4. -/
theorem ep_Q2_002_partial_04_0067_valid :
    mulPoly ep_Q2_002_coefficient_04_0067
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0068 : Poly :=
[
  term ((-4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1)]
]

/-- Partial product 68 for generator 4. -/
def ep_Q2_002_partial_04_0068 : Poly :=
[
  term ((-4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (7, 1)],
  term ((-4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (7, 1)],
  term ((4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 2)],
  term ((4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 4. -/
theorem ep_Q2_002_partial_04_0068_valid :
    mulPoly ep_Q2_002_coefficient_04_0068
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0069 : Poly :=
[
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (12, 1)]
]

/-- Partial product 69 for generator 4. -/
def ep_Q2_002_partial_04_0069 : Poly :=
[
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (7, 1), (12, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (7, 1), (12, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 2), (12, 1)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 4. -/
theorem ep_Q2_002_partial_04_0069_valid :
    mulPoly ep_Q2_002_coefficient_04_0069
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0070 : Poly :=
[
  term ((57694203959615192486591052096 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (9, 1)]
]

/-- Partial product 70 for generator 4. -/
def ep_Q2_002_partial_04_0070 : Poly :=
[
  term ((57694203959615192486591052096 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((57694203959615192486591052096 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((-57694203959615192486591052096 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (9, 1), (10, 2)],
  term ((-57694203959615192486591052096 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 4. -/
theorem ep_Q2_002_partial_04_0070_valid :
    mulPoly ep_Q2_002_coefficient_04_0070
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0071 : Poly :=
[
  term ((3586896357230346710991421042256 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 71 for generator 4. -/
def ep_Q2_002_partial_04_0071 : Poly :=
[
  term ((3586896357230346710991421042256 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((3586896357230346710991421042256 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((-3586896357230346710991421042256 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (10, 2), (11, 1)],
  term ((-3586896357230346710991421042256 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 4. -/
theorem ep_Q2_002_partial_04_0071_valid :
    mulPoly ep_Q2_002_coefficient_04_0071
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0072 : Poly :=
[
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 1), (12, 1)]
]

/-- Partial product 72 for generator 4. -/
def ep_Q2_002_partial_04_0072 : Poly :=
[
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (11, 1), (12, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (11, 1), (12, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 2), (11, 1), (12, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 3), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 4. -/
theorem ep_Q2_002_partial_04_0072_valid :
    mulPoly ep_Q2_002_coefficient_04_0072
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0073 : Poly :=
[
  term ((-94018064428882796171721902401088 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 73 for generator 4. -/
def ep_Q2_002_partial_04_0073 : Poly :=
[
  term ((-94018064428882796171721902401088 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((-94018064428882796171721902401088 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (13, 1)],
  term ((94018064428882796171721902401088 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 2), (13, 1)],
  term ((94018064428882796171721902401088 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 4. -/
theorem ep_Q2_002_partial_04_0073_valid :
    mulPoly ep_Q2_002_coefficient_04_0073
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0074 : Poly :=
[
  term ((626410151106379565259861281506904150652256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 74 for generator 4. -/
def ep_Q2_002_partial_04_0074 : Poly :=
[
  term ((626410151106379565259861281506904150652256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((626410151106379565259861281506904150652256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((-626410151106379565259861281506904150652256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (10, 2), (15, 1)],
  term ((-626410151106379565259861281506904150652256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 4. -/
theorem ep_Q2_002_partial_04_0074_valid :
    mulPoly ep_Q2_002_coefficient_04_0074
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0075 : Poly :=
[
  term ((-10261853432 : Rat) / 7401317245) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 75 for generator 4. -/
def ep_Q2_002_partial_04_0075 : Poly :=
[
  term ((-10261853432 : Rat) / 7401317245) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-10261853432 : Rat) / 7401317245) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((10261853432 : Rat) / 7401317245) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((10261853432 : Rat) / 7401317245) [(1, 1), (4, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 4. -/
theorem ep_Q2_002_partial_04_0075_valid :
    mulPoly ep_Q2_002_coefficient_04_0075
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0076 : Poly :=
[
  term ((-22793140321558280028044858688 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1)]
]

/-- Partial product 76 for generator 4. -/
def ep_Q2_002_partial_04_0076 : Poly :=
[
  term ((-22793140321558280028044858688 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (5, 1)],
  term ((-22793140321558280028044858688 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (5, 1)],
  term ((22793140321558280028044858688 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (10, 2)],
  term ((22793140321558280028044858688 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 4. -/
theorem ep_Q2_002_partial_04_0076_valid :
    mulPoly ep_Q2_002_coefficient_04_0076
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0077 : Poly :=
[
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 1), (11, 1)]
]

/-- Partial product 77 for generator 4. -/
def ep_Q2_002_partial_04_0077 : Poly :=
[
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (5, 1), (7, 1), (11, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (5, 1), (7, 1), (11, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 1), (10, 2), (11, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 4. -/
theorem ep_Q2_002_partial_04_0077_valid :
    mulPoly ep_Q2_002_coefficient_04_0077
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0078 : Poly :=
[
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (15, 1)]
]

/-- Partial product 78 for generator 4. -/
def ep_Q2_002_partial_04_0078 : Poly :=
[
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (7, 1), (15, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (7, 1), (15, 1)],
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (10, 2), (15, 1)],
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 4. -/
theorem ep_Q2_002_partial_04_0078_valid :
    mulPoly ep_Q2_002_coefficient_04_0078
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0079 : Poly :=
[
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2)]
]

/-- Partial product 79 for generator 4. -/
def ep_Q2_002_partial_04_0079 : Poly :=
[
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (5, 1), (7, 2)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (5, 1), (7, 2)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2), (10, 2)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 4. -/
theorem ep_Q2_002_partial_04_0079_valid :
    mulPoly ep_Q2_002_coefficient_04_0079
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0080 : Poly :=
[
  term ((-2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1)]
]

/-- Partial product 80 for generator 4. -/
def ep_Q2_002_partial_04_0080 : Poly :=
[
  term ((-2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (8, 1)],
  term ((-2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (8, 1)],
  term ((2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (10, 2)],
  term ((2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 4. -/
theorem ep_Q2_002_partial_04_0080_valid :
    mulPoly ep_Q2_002_coefficient_04_0080
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0081 : Poly :=
[
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 1), (15, 1)]
]

/-- Partial product 81 for generator 4. -/
def ep_Q2_002_partial_04_0081 : Poly :=
[
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (10, 2), (11, 1), (15, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 4. -/
theorem ep_Q2_002_partial_04_0081_valid :
    mulPoly ep_Q2_002_coefficient_04_0081
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0082 : Poly :=
[
  term ((103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (12, 1)]
]

/-- Partial product 82 for generator 4. -/
def ep_Q2_002_partial_04_0082 : Poly :=
[
  term ((103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (5, 1), (12, 1)],
  term ((103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (5, 1), (12, 1)],
  term ((-103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (10, 2), (12, 1)],
  term ((-103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 4. -/
theorem ep_Q2_002_partial_04_0082_valid :
    mulPoly ep_Q2_002_coefficient_04_0082
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0083 : Poly :=
[
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (14, 1)]
]

/-- Partial product 83 for generator 4. -/
def ep_Q2_002_partial_04_0083 : Poly :=
[
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (14, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (14, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (10, 2), (14, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 4. -/
theorem ep_Q2_002_partial_04_0083_valid :
    mulPoly ep_Q2_002_coefficient_04_0083
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0084 : Poly :=
[
  term ((1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1)]
]

/-- Partial product 84 for generator 4. -/
def ep_Q2_002_partial_04_0084 : Poly :=
[
  term ((1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (9, 1)],
  term ((-1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (10, 2)],
  term ((-1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 4. -/
theorem ep_Q2_002_partial_04_0084_valid :
    mulPoly ep_Q2_002_coefficient_04_0084
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0085 : Poly :=
[
  term ((57425008990310286737083701086592 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 1)]
]

/-- Partial product 85 for generator 4. -/
def ep_Q2_002_partial_04_0085 : Poly :=
[
  term ((57425008990310286737083701086592 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((57425008990310286737083701086592 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((-57425008990310286737083701086592 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 2), (11, 1)],
  term ((-57425008990310286737083701086592 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 4. -/
theorem ep_Q2_002_partial_04_0085_valid :
    mulPoly ep_Q2_002_coefficient_04_0085
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0086 : Poly :=
[
  term ((-102968437825009349737042674461184 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (13, 1)]
]

/-- Partial product 86 for generator 4. -/
def ep_Q2_002_partial_04_0086 : Poly :=
[
  term ((-102968437825009349737042674461184 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((-102968437825009349737042674461184 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((102968437825009349737042674461184 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 2), (13, 1)],
  term ((102968437825009349737042674461184 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 4. -/
theorem ep_Q2_002_partial_04_0086_valid :
    mulPoly ep_Q2_002_coefficient_04_0086
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0087 : Poly :=
[
  term ((-870252567751057344865301407532256850744608 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (15, 1)]
]

/-- Partial product 87 for generator 4. -/
def ep_Q2_002_partial_04_0087 : Poly :=
[
  term ((-870252567751057344865301407532256850744608 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((-870252567751057344865301407532256850744608 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((870252567751057344865301407532256850744608 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (10, 2), (15, 1)],
  term ((870252567751057344865301407532256850744608 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 4. -/
theorem ep_Q2_002_partial_04_0087_valid :
    mulPoly ep_Q2_002_coefficient_04_0087
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0088 : Poly :=
[
  term ((-56478225624 : Rat) / 7401317245) [(1, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 4. -/
def ep_Q2_002_partial_04_0088 : Poly :=
[
  term ((-56478225624 : Rat) / 7401317245) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((-56478225624 : Rat) / 7401317245) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((56478225624 : Rat) / 7401317245) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((56478225624 : Rat) / 7401317245) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 4. -/
theorem ep_Q2_002_partial_04_0088_valid :
    mulPoly ep_Q2_002_coefficient_04_0088
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0089 : Poly :=
[
  term ((1737944129226413015176017981360 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1)]
]

/-- Partial product 89 for generator 4. -/
def ep_Q2_002_partial_04_0089 : Poly :=
[
  term ((1737944129226413015176017981360 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1)],
  term ((1737944129226413015176017981360 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1)],
  term ((-1737944129226413015176017981360 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2)],
  term ((-1737944129226413015176017981360 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 4. -/
theorem ep_Q2_002_partial_04_0089_valid :
    mulPoly ep_Q2_002_coefficient_04_0089
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0090 : Poly :=
[
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1)]
]

/-- Partial product 90 for generator 4. -/
def ep_Q2_002_partial_04_0090 : Poly :=
[
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (8, 1)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (8, 1)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (10, 2)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 4. -/
theorem ep_Q2_002_partial_04_0090_valid :
    mulPoly ep_Q2_002_coefficient_04_0090
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0091 : Poly :=
[
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (11, 1)]
]

/-- Partial product 91 for generator 4. -/
def ep_Q2_002_partial_04_0091 : Poly :=
[
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (9, 1), (11, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (9, 1), (11, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (11, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 4. -/
theorem ep_Q2_002_partial_04_0091_valid :
    mulPoly ep_Q2_002_coefficient_04_0091
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0092 : Poly :=
[
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (15, 1)]
]

/-- Partial product 92 for generator 4. -/
def ep_Q2_002_partial_04_0092 : Poly :=
[
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (9, 1), (15, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (9, 1), (15, 1)],
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (10, 2), (15, 1)],
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 4. -/
theorem ep_Q2_002_partial_04_0092_valid :
    mulPoly ep_Q2_002_coefficient_04_0092
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0093 : Poly :=
[
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 1), (13, 1)]
]

/-- Partial product 93 for generator 4. -/
def ep_Q2_002_partial_04_0093 : Poly :=
[
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (11, 1), (13, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (11, 1), (13, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2), (11, 1), (13, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 4. -/
theorem ep_Q2_002_partial_04_0093_valid :
    mulPoly ep_Q2_002_coefficient_04_0093
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0094 : Poly :=
[
  term ((37869057826735434227527751935103257467968 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (7, 1), (11, 1), (15, 1)]
]

/-- Partial product 94 for generator 4. -/
def ep_Q2_002_partial_04_0094 : Poly :=
[
  term ((37869057826735434227527751935103257467968 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1)],
  term ((37869057826735434227527751935103257467968 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1)],
  term ((-37869057826735434227527751935103257467968 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((-37869057826735434227527751935103257467968 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (7, 1), (11, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 4. -/
theorem ep_Q2_002_partial_04_0094_valid :
    mulPoly ep_Q2_002_coefficient_04_0094
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0095 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (7, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 4. -/
def ep_Q2_002_partial_04_0095 : Poly :=
[
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (7, 1), (11, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 4. -/
theorem ep_Q2_002_partial_04_0095_valid :
    mulPoly ep_Q2_002_coefficient_04_0095
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0096 : Poly :=
[
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 2)]
]

/-- Partial product 96 for generator 4. -/
def ep_Q2_002_partial_04_0096 : Poly :=
[
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (11, 2)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (11, 2)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2), (11, 2)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 4. -/
theorem ep_Q2_002_partial_04_0096_valid :
    mulPoly ep_Q2_002_coefficient_04_0096
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0097 : Poly :=
[
  term ((-9220618437057331434984373750848 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (12, 1)]
]

/-- Partial product 97 for generator 4. -/
def ep_Q2_002_partial_04_0097 : Poly :=
[
  term ((-9220618437057331434984373750848 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (12, 1)],
  term ((-9220618437057331434984373750848 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (12, 1)],
  term ((9220618437057331434984373750848 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2), (12, 1)],
  term ((9220618437057331434984373750848 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 2), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 4. -/
theorem ep_Q2_002_partial_04_0097_valid :
    mulPoly ep_Q2_002_coefficient_04_0097
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0098 : Poly :=
[
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (13, 1), (15, 1)]
]

/-- Partial product 98 for generator 4. -/
def ep_Q2_002_partial_04_0098 : Poly :=
[
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1)],
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 4. -/
theorem ep_Q2_002_partial_04_0098_valid :
    mulPoly ep_Q2_002_coefficient_04_0098
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 4. -/
def ep_Q2_002_coefficient_04_0099 : Poly :=
[
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (15, 2)]
]

/-- Partial product 99 for generator 4. -/
def ep_Q2_002_partial_04_0099 : Poly :=
[
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (7, 1), (15, 2)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (7, 1), (15, 2)],
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (10, 2), (15, 2)],
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 4. -/
theorem ep_Q2_002_partial_04_0099_valid :
    mulPoly ep_Q2_002_coefficient_04_0099
        ep_Q2_002_generator_04_0000_0099 =
      ep_Q2_002_partial_04_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_04_0000_0099 : List Poly :=
[
  ep_Q2_002_partial_04_0000,
  ep_Q2_002_partial_04_0001,
  ep_Q2_002_partial_04_0002,
  ep_Q2_002_partial_04_0003,
  ep_Q2_002_partial_04_0004,
  ep_Q2_002_partial_04_0005,
  ep_Q2_002_partial_04_0006,
  ep_Q2_002_partial_04_0007,
  ep_Q2_002_partial_04_0008,
  ep_Q2_002_partial_04_0009,
  ep_Q2_002_partial_04_0010,
  ep_Q2_002_partial_04_0011,
  ep_Q2_002_partial_04_0012,
  ep_Q2_002_partial_04_0013,
  ep_Q2_002_partial_04_0014,
  ep_Q2_002_partial_04_0015,
  ep_Q2_002_partial_04_0016,
  ep_Q2_002_partial_04_0017,
  ep_Q2_002_partial_04_0018,
  ep_Q2_002_partial_04_0019,
  ep_Q2_002_partial_04_0020,
  ep_Q2_002_partial_04_0021,
  ep_Q2_002_partial_04_0022,
  ep_Q2_002_partial_04_0023,
  ep_Q2_002_partial_04_0024,
  ep_Q2_002_partial_04_0025,
  ep_Q2_002_partial_04_0026,
  ep_Q2_002_partial_04_0027,
  ep_Q2_002_partial_04_0028,
  ep_Q2_002_partial_04_0029,
  ep_Q2_002_partial_04_0030,
  ep_Q2_002_partial_04_0031,
  ep_Q2_002_partial_04_0032,
  ep_Q2_002_partial_04_0033,
  ep_Q2_002_partial_04_0034,
  ep_Q2_002_partial_04_0035,
  ep_Q2_002_partial_04_0036,
  ep_Q2_002_partial_04_0037,
  ep_Q2_002_partial_04_0038,
  ep_Q2_002_partial_04_0039,
  ep_Q2_002_partial_04_0040,
  ep_Q2_002_partial_04_0041,
  ep_Q2_002_partial_04_0042,
  ep_Q2_002_partial_04_0043,
  ep_Q2_002_partial_04_0044,
  ep_Q2_002_partial_04_0045,
  ep_Q2_002_partial_04_0046,
  ep_Q2_002_partial_04_0047,
  ep_Q2_002_partial_04_0048,
  ep_Q2_002_partial_04_0049,
  ep_Q2_002_partial_04_0050,
  ep_Q2_002_partial_04_0051,
  ep_Q2_002_partial_04_0052,
  ep_Q2_002_partial_04_0053,
  ep_Q2_002_partial_04_0054,
  ep_Q2_002_partial_04_0055,
  ep_Q2_002_partial_04_0056,
  ep_Q2_002_partial_04_0057,
  ep_Q2_002_partial_04_0058,
  ep_Q2_002_partial_04_0059,
  ep_Q2_002_partial_04_0060,
  ep_Q2_002_partial_04_0061,
  ep_Q2_002_partial_04_0062,
  ep_Q2_002_partial_04_0063,
  ep_Q2_002_partial_04_0064,
  ep_Q2_002_partial_04_0065,
  ep_Q2_002_partial_04_0066,
  ep_Q2_002_partial_04_0067,
  ep_Q2_002_partial_04_0068,
  ep_Q2_002_partial_04_0069,
  ep_Q2_002_partial_04_0070,
  ep_Q2_002_partial_04_0071,
  ep_Q2_002_partial_04_0072,
  ep_Q2_002_partial_04_0073,
  ep_Q2_002_partial_04_0074,
  ep_Q2_002_partial_04_0075,
  ep_Q2_002_partial_04_0076,
  ep_Q2_002_partial_04_0077,
  ep_Q2_002_partial_04_0078,
  ep_Q2_002_partial_04_0079,
  ep_Q2_002_partial_04_0080,
  ep_Q2_002_partial_04_0081,
  ep_Q2_002_partial_04_0082,
  ep_Q2_002_partial_04_0083,
  ep_Q2_002_partial_04_0084,
  ep_Q2_002_partial_04_0085,
  ep_Q2_002_partial_04_0086,
  ep_Q2_002_partial_04_0087,
  ep_Q2_002_partial_04_0088,
  ep_Q2_002_partial_04_0089,
  ep_Q2_002_partial_04_0090,
  ep_Q2_002_partial_04_0091,
  ep_Q2_002_partial_04_0092,
  ep_Q2_002_partial_04_0093,
  ep_Q2_002_partial_04_0094,
  ep_Q2_002_partial_04_0095,
  ep_Q2_002_partial_04_0096,
  ep_Q2_002_partial_04_0097,
  ep_Q2_002_partial_04_0098,
  ep_Q2_002_partial_04_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_04_0000_0099 : Poly :=
[
  term ((4820870951848505286508379924032 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (3, 1)],
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (3, 1), (12, 1)],
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (5, 1)],
  term ((-9641741903697010573016759848064 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (7, 1)],
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (7, 1), (12, 1)],
  term ((104053623801149625423786130848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (9, 1)],
  term ((81256062337843686620490295405360 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (11, 1)],
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (11, 1), (12, 1)],
  term ((-173218925051523534193722528131136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (2, 2), (13, 1)],
  term ((2413702653204514171706980125705608492206968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (2, 2), (15, 1)],
  term ((10592497274 : Rat) / 7401317245) [(0, 1), (1, 1), (2, 2), (15, 1), (16, 1)],
  term ((-4820870951848505286508379924032 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (10, 2)],
  term ((892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (10, 2), (12, 1)],
  term ((-4820870951848505286508379924032 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (11, 2)],
  term ((892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 1), (11, 2), (12, 1)],
  term ((2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (5, 1)],
  term ((-9641741903697010573016759848064 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (7, 1)],
  term ((1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (7, 1), (12, 1)],
  term ((104053623801149625423786130848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (9, 1)],
  term ((81256062337843686620490295405360 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (11, 1)],
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (11, 1), (12, 1)],
  term ((-173218925051523534193722528131136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 2), (13, 1)],
  term ((2413702653204514171706980125705608492206968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (3, 2), (15, 1)],
  term ((10592497274 : Rat) / 7401317245) [(0, 1), (1, 1), (3, 2), (15, 1), (16, 1)],
  term ((4820870951848505286508379924032 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 3)],
  term ((-892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (3, 3), (12, 1)],
  term ((-2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (10, 2)],
  term ((-2211154358960943124842562984896 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (5, 1), (11, 2)],
  term ((9641741903697010573016759848064 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (10, 2)],
  term ((-1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (10, 2), (12, 1)],
  term ((9641741903697010573016759848064 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (11, 2)],
  term ((-1785981487448440280943662227200 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (7, 1), (11, 2), (12, 1)],
  term ((-104053623801149625423786130848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (10, 2)],
  term ((-104053623801149625423786130848 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (9, 1), (11, 2)],
  term ((-81256062337843686620490295405360 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (10, 2), (11, 1)],
  term ((892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (10, 2), (11, 1), (12, 1)],
  term ((173218925051523534193722528131136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (10, 2), (13, 1)],
  term ((-2413702653204514171706980125705608492206968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (10, 2), (15, 1)],
  term ((-10592497274 : Rat) / 7401317245) [(0, 1), (1, 1), (10, 2), (15, 1), (16, 1)],
  term ((173218925051523534193722528131136 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 2), (13, 1)],
  term ((-2413702653204514171706980125705608492206968 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (1, 1), (11, 2), (15, 1)],
  term ((-10592497274 : Rat) / 7401317245) [(0, 1), (1, 1), (11, 2), (15, 1), (16, 1)],
  term ((-81256062337843686620490295405360 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 3)],
  term ((892990743724220140471831113600 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 1), (11, 3), (12, 1)],
  term ((-5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (2, 2)],
  term ((-5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (3, 2)],
  term ((5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (10, 2)],
  term ((5588734837750331754863904980160 : Rat) / 1273790490336191187829975377157) [(0, 1), (1, 2), (11, 2)],
  term ((-68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (11, 1)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (11, 1), (12, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (12, 1), (13, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (3, 1), (12, 1), (15, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (2, 2), (3, 1), (12, 1), (15, 1), (16, 1)],
  term ((128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (3, 1), (13, 1)],
  term ((-802220129144742210434286925077245255565312 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (3, 1), (15, 1)],
  term ((22025102804 : Rat) / 7401317245) [(0, 1), (2, 2), (3, 1), (15, 1), (16, 1)],
  term ((-31261711261662058496205716019792 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (5, 1), (11, 1)],
  term ((58871656742697324075854562156864 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (5, 1), (13, 1)],
  term ((13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (2, 2), (5, 1), (15, 1)],
  term ((621830788 : Rat) / 211466207) [(0, 1), (2, 2), (5, 1), (15, 1), (16, 1)],
  term ((136316738915723936558415436396128 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (7, 1), (11, 1)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (7, 1), (11, 1), (12, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (7, 1), (12, 1), (13, 1)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (2, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-256709947659587041234792337467776 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (7, 1), (13, 1)],
  term ((1604440258289484420868573850154490511130624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (7, 1), (15, 1)],
  term ((-44050205608 : Rat) / 7401317245) [(0, 1), (2, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1471129471272975101986168536696 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (11, 1)],
  term ((2770412295473418261319313944032 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (9, 1), (13, 1)],
  term ((1059184803249220561596571109266275155550072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (9, 1), (15, 1)],
  term ((4172447528 : Rat) / 1057331035) [(0, 1), (2, 2), (9, 1), (15, 1), (16, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 1), (12, 1), (13, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (2, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((404929457520618938046579427270752 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 1), (13, 1)],
  term ((-40291606162087250825187305919381902104260 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (2, 2), (11, 1), (15, 1)],
  term ((-9472995677 : Rat) / 1480263449) [(0, 1), (2, 2), (11, 1), (15, 1), (16, 1)],
  term ((-31690610060386672318839733765080 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 2)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (11, 2), (12, 1)],
  term ((50763878144211078031663673277968765298384 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (2, 2), (13, 1), (15, 1)],
  term ((-2482085108 : Rat) / 125446055) [(0, 1), (2, 2), (13, 1), (15, 1), (16, 1)],
  term ((-650170601477256799478779949528064 : Rat) / 1273790490336191187829975377157) [(0, 1), (2, 2), (13, 2)],
  term ((-1205374040904672307016999158118600689287084 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (2, 2), (15, 2)],
  term ((-5296248637 : Rat) / 7401317245) [(0, 1), (2, 2), (15, 2), (16, 1)],
  term ((68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (10, 2), (11, 1)],
  term ((-12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (10, 2), (11, 1), (12, 1)],
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (10, 2), (12, 1), (13, 1)],
  term ((-781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (10, 2), (12, 1), (15, 1)],
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (3, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((-128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (10, 2), (13, 1)],
  term ((802220129144742210434286925077245255565312 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (10, 2), (15, 1)],
  term ((-22025102804 : Rat) / 7401317245) [(0, 1), (3, 1), (10, 2), (15, 1), (16, 1)],
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 2), (12, 1), (13, 1)],
  term ((-781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1)],
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (3, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 2), (13, 1)],
  term ((802220129144742210434286925077245255565312 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 1), (11, 2), (15, 1)],
  term ((-22025102804 : Rat) / 7401317245) [(0, 1), (3, 1), (11, 2), (15, 1), (16, 1)],
  term ((68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 3)],
  term ((-12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 1), (11, 3), (12, 1)],
  term ((-31261711261662058496205716019792 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (11, 1)],
  term ((58871656742697324075854562156864 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (5, 1), (13, 1)],
  term ((13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (3, 2), (5, 1), (15, 1)],
  term ((621830788 : Rat) / 211466207) [(0, 1), (3, 2), (5, 1), (15, 1), (16, 1)],
  term ((136316738915723936558415436396128 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (7, 1), (11, 1)],
  term ((-25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (7, 1), (11, 1), (12, 1)],
  term ((47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (7, 1), (12, 1), (13, 1)],
  term ((-1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1)],
  term ((-26204186168 : Rat) / 7401317245) [(0, 1), (3, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-256709947659587041234792337467776 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (7, 1), (13, 1)],
  term ((1604440258289484420868573850154490511130624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (7, 1), (15, 1)],
  term ((-44050205608 : Rat) / 7401317245) [(0, 1), (3, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1471129471272975101986168536696 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (11, 1)],
  term ((2770412295473418261319313944032 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (9, 1), (13, 1)],
  term ((1059184803249220561596571109266275155550072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (9, 1), (15, 1)],
  term ((4172447528 : Rat) / 1057331035) [(0, 1), (3, 2), (9, 1), (15, 1), (16, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 1), (12, 1), (13, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (3, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((404929457520618938046579427270752 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 1), (13, 1)],
  term ((-40291606162087250825187305919381902104260 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (3, 2), (11, 1), (15, 1)],
  term ((-9472995677 : Rat) / 1480263449) [(0, 1), (3, 2), (11, 1), (15, 1), (16, 1)],
  term ((-31690610060386672318839733765080 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 2)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (11, 2), (12, 1)],
  term ((50763878144211078031663673277968765298384 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (3, 2), (13, 1), (15, 1)],
  term ((-2482085108 : Rat) / 125446055) [(0, 1), (3, 2), (13, 1), (15, 1), (16, 1)],
  term ((-650170601477256799478779949528064 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 2), (13, 2)],
  term ((-1205374040904672307016999158118600689287084 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 2), (15, 2)],
  term ((-5296248637 : Rat) / 7401317245) [(0, 1), (3, 2), (15, 2), (16, 1)],
  term ((-68158369457861968279207718198064 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (11, 1)],
  term ((12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (11, 1), (12, 1)],
  term ((-23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (12, 1), (13, 1)],
  term ((781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 3), (12, 1), (15, 1)],
  term ((13102093084 : Rat) / 7401317245) [(0, 1), (3, 3), (12, 1), (15, 1), (16, 1)],
  term ((128354973829793520617396168733888 : Rat) / 1273790490336191187829975377157) [(0, 1), (3, 3), (13, 1)],
  term ((-802220129144742210434286925077245255565312 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (3, 3), (15, 1)],
  term ((22025102804 : Rat) / 7401317245) [(0, 1), (3, 3), (15, 1), (16, 1)],
  term ((31261711261662058496205716019792 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (10, 2), (11, 1)],
  term ((-58871656742697324075854562156864 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (10, 2), (13, 1)],
  term ((-13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (10, 2), (15, 1)],
  term ((-621830788 : Rat) / 211466207) [(0, 1), (5, 1), (10, 2), (15, 1), (16, 1)],
  term ((-58871656742697324075854562156864 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 2), (13, 1)],
  term ((-13649203422207415063570577883900214779072 : Rat) / 269363643504064505317229453910785233499) [(0, 1), (5, 1), (11, 2), (15, 1)],
  term ((-621830788 : Rat) / 211466207) [(0, 1), (5, 1), (11, 2), (15, 1), (16, 1)],
  term ((31261711261662058496205716019792 : Rat) / 1273790490336191187829975377157) [(0, 1), (5, 1), (11, 3)],
  term ((-136316738915723936558415436396128 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 2), (11, 1)],
  term ((25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 2), (11, 1), (12, 1)],
  term ((-47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 2), (12, 1), (13, 1)],
  term ((1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (10, 2), (12, 1), (15, 1)],
  term ((26204186168 : Rat) / 7401317245) [(0, 1), (7, 1), (10, 2), (12, 1), (15, 1), (16, 1)],
  term ((256709947659587041234792337467776 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (10, 2), (13, 1)],
  term ((-1604440258289484420868573850154490511130624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (10, 2), (15, 1)],
  term ((44050205608 : Rat) / 7401317245) [(0, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-47551492120742429915784705004800 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 2), (12, 1), (13, 1)],
  term ((1563189148042989968780389245954703029487776 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((26204186168 : Rat) / 7401317245) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((256709947659587041234792337467776 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 2), (13, 1)],
  term ((-1604440258289484420868573850154490511130624 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (7, 1), (11, 2), (15, 1)],
  term ((44050205608 : Rat) / 7401317245) [(0, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((-136316738915723936558415436396128 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 3)],
  term ((25250538187448661526546609454400 : Rat) / 1273790490336191187829975377157) [(0, 1), (7, 1), (11, 3), (12, 1)],
  term ((1471129471272975101986168536696 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 2), (11, 1)],
  term ((-2770412295473418261319313944032 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (10, 2), (13, 1)],
  term ((-1059184803249220561596571109266275155550072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (10, 2), (15, 1)],
  term ((-4172447528 : Rat) / 1057331035) [(0, 1), (9, 1), (10, 2), (15, 1), (16, 1)],
  term ((-2770412295473418261319313944032 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 2), (13, 1)],
  term ((-1059184803249220561596571109266275155550072 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (9, 1), (11, 2), (15, 1)],
  term ((-4172447528 : Rat) / 1057331035) [(0, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((1471129471272975101986168536696 : Rat) / 1273790490336191187829975377157) [(0, 1), (9, 1), (11, 3)],
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (11, 1), (12, 1), (13, 1)],
  term ((-781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1)],
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (10, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-404929457520618938046579427270752 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (11, 1), (13, 1)],
  term ((40291606162087250825187305919381902104260 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (10, 2), (11, 1), (15, 1)],
  term ((9472995677 : Rat) / 1480263449) [(0, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((31690610060386672318839733765080 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (11, 2)],
  term ((-12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (11, 2), (12, 1)],
  term ((-50763878144211078031663673277968765298384 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (10, 2), (13, 1), (15, 1)],
  term ((2482085108 : Rat) / 125446055) [(0, 1), (10, 2), (13, 1), (15, 1), (16, 1)],
  term ((650170601477256799478779949528064 : Rat) / 1273790490336191187829975377157) [(0, 1), (10, 2), (13, 2)],
  term ((1205374040904672307016999158118600689287084 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (10, 2), (15, 2)],
  term ((5296248637 : Rat) / 7401317245) [(0, 1), (10, 2), (15, 2), (16, 1)],
  term ((-50763878144211078031663673277968765298384 : Rat) / 22827427415598686891290631687354680805) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((2482085108 : Rat) / 125446055) [(0, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((650170601477256799478779949528064 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 2), (13, 2)],
  term ((1205374040904672307016999158118600689287084 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 2), (15, 2)],
  term ((5296248637 : Rat) / 7401317245) [(0, 1), (11, 2), (15, 2), (16, 1)],
  term ((23775746060371214957892352502400 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 3), (12, 1), (13, 1)],
  term ((-781594574021494984390194622977351514743888 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((-13102093084 : Rat) / 7401317245) [(0, 1), (11, 3), (12, 1), (15, 1), (16, 1)],
  term ((-404929457520618938046579427270752 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 3), (13, 1)],
  term ((40291606162087250825187305919381902104260 : Rat) / 20720280269543423485940727223906556423) [(0, 1), (11, 3), (15, 1)],
  term ((9472995677 : Rat) / 1480263449) [(0, 1), (11, 3), (15, 1), (16, 1)],
  term ((31690610060386672318839733765080 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 4)],
  term ((-12625269093724330763273304727200 : Rat) / 1273790490336191187829975377157) [(0, 1), (11, 4), (12, 1)],
  term ((-222308460748264059718356855240 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (3, 1)],
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (4, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (4, 1), (12, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (3, 1), (5, 1), (7, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (5, 1), (15, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (9, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (11, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 1), (13, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (3, 1), (7, 1), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 2), (3, 1), (7, 1), (15, 1), (16, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (7, 2)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (8, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (9, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (11, 1), (15, 1)],
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (3, 1), (12, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (3, 1), (13, 1), (15, 1)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (3, 1), (15, 2)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (2, 2), (3, 1), (15, 2), (16, 1)],
  term ((-4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (7, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (7, 1), (12, 1)],
  term ((57694203959615192486591052096 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (4, 1), (9, 1)],
  term ((3586896357230346710991421042256 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (4, 1), (11, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (11, 1), (12, 1)],
  term ((-94018064428882796171721902401088 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (4, 1), (13, 1)],
  term ((626410151106379565259861281506904150652256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (4, 1), (15, 1)],
  term ((-10261853432 : Rat) / 7401317245) [(1, 1), (2, 2), (4, 1), (15, 1), (16, 1)],
  term ((-22793140321558280028044858688 : Rat) / 97983883872014706756151952089) [(1, 1), (2, 2), (5, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (5, 1), (7, 1), (11, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (7, 1), (15, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (5, 1), (7, 2)],
  term ((-2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (8, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (11, 1), (15, 1)],
  term ((103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (2, 2), (5, 1), (12, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (5, 1), (14, 1)],
  term ((1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (9, 1)],
  term ((57425008990310286737083701086592 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (11, 1)],
  term ((-102968437825009349737042674461184 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (6, 1), (13, 1)],
  term ((-870252567751057344865301407532256850744608 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (6, 1), (15, 1)],
  term ((-56478225624 : Rat) / 7401317245) [(1, 1), (2, 2), (6, 1), (15, 1), (16, 1)],
  term ((1737944129226413015176017981360 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (8, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (9, 1), (11, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (9, 1), (15, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (11, 1), (13, 1)],
  term ((37869057826735434227527751935103257467968 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (2, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (11, 2)],
  term ((-9220618437057331434984373750848 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (12, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (2, 2), (7, 1), (13, 1), (15, 1)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (2, 2), (7, 1), (15, 2)],
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (10, 2)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (10, 2), (12, 1)],
  term ((-2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (11, 2)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (4, 1), (11, 2), (12, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1), (10, 2)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (5, 1), (7, 1), (11, 2)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (10, 2), (15, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (5, 1), (11, 2), (15, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1), (10, 2)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (9, 1), (11, 2)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (10, 2), (11, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (10, 2), (13, 1)],
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (10, 2), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (10, 2), (15, 1), (16, 1)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 2), (13, 1)],
  term ((-561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (3, 1), (7, 1), (11, 2), (15, 1), (16, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 1), (11, 3)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (10, 2)],
  term ((14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (7, 2), (11, 2)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (10, 2)],
  term ((333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (8, 1), (11, 2)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (10, 2), (15, 1)],
  term ((-2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (9, 1), (11, 2), (15, 1)],
  term ((222308460748264059718356855240 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (10, 2)],
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (10, 2), (11, 1), (15, 1)],
  term ((-626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (10, 2), (12, 1)],
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (10, 2), (13, 1), (15, 1)],
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (10, 2), (15, 2)],
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (10, 2), (15, 2), (16, 1)],
  term ((222308460748264059718356855240 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 1), (11, 2)],
  term ((-626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 1), (11, 2), (12, 1)],
  term ((61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 2), (13, 1), (15, 1)],
  term ((186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 1), (11, 2), (15, 2)],
  term ((25493387784 : Rat) / 7401317245) [(1, 1), (3, 1), (11, 2), (15, 2), (16, 1)],
  term ((-32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 1), (11, 3), (15, 1)],
  term ((-4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (7, 1)],
  term ((10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (7, 1), (12, 1)],
  term ((57694203959615192486591052096 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (4, 1), (9, 1)],
  term ((3586896357230346710991421042256 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (4, 1), (11, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (11, 1), (12, 1)],
  term ((-94018064428882796171721902401088 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (4, 1), (13, 1)],
  term ((626410151106379565259861281506904150652256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (4, 1), (15, 1)],
  term ((-10261853432 : Rat) / 7401317245) [(1, 1), (3, 2), (4, 1), (15, 1), (16, 1)],
  term ((-22793140321558280028044858688 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 2), (5, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (5, 1), (7, 1), (11, 1)],
  term ((4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (7, 1), (15, 1)],
  term ((1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (5, 1), (7, 2)],
  term ((-2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (8, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (11, 1), (15, 1)],
  term ((103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 2), (5, 1), (12, 1)],
  term ((-4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (5, 1), (14, 1)],
  term ((1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (9, 1)],
  term ((57425008990310286737083701086592 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (11, 1)],
  term ((-102968437825009349737042674461184 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (6, 1), (13, 1)],
  term ((-870252567751057344865301407532256850744608 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (6, 1), (15, 1)],
  term ((-56478225624 : Rat) / 7401317245) [(1, 1), (3, 2), (6, 1), (15, 1), (16, 1)],
  term ((1737944129226413015176017981360 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1)],
  term ((667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (8, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (9, 1), (11, 1)],
  term ((-5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (9, 1), (15, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (11, 1), (13, 1)],
  term ((37869057826735434227527751935103257467968 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 2), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (11, 2)],
  term ((-9220618437057331434984373750848 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (12, 1)],
  term ((122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 2), (7, 1), (13, 1), (15, 1)],
  term ((372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 2), (7, 1), (15, 2)],
  term ((-222308460748264059718356855240 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 3)],
  term ((2132175472514533460565240680080 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (4, 1)],
  term ((-5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (4, 1), (12, 1)],
  term ((-586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (3, 3), (5, 1), (7, 1)],
  term ((-2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (5, 1), (15, 1)],
  term ((-8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (9, 1)],
  term ((-97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (11, 1)],
  term ((183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 1), (13, 1)],
  term ((561051603593746989333324833445875079424064 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 3), (7, 1), (15, 1)],
  term ((76480163352 : Rat) / 7401317245) [(1, 1), (3, 3), (7, 1), (15, 1), (16, 1)],
  term ((-14408408611995363816264810360672 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (7, 2)],
  term ((-333908270886648519021197823744 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (8, 1)],
  term ((2670599165465104181352678926976 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (9, 1), (15, 1)],
  term ((32512926212454524412718131502464 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (11, 1), (15, 1)],
  term ((626475912618732359016409323744 : Rat) / 97983883872014706756151952089) [(1, 1), (3, 3), (12, 1)],
  term ((-61227928812317505022187877938688 : Rat) / 1273790490336191187829975377157) [(1, 1), (3, 3), (13, 1), (15, 1)],
  term ((-186452418594262805499543430801104735955808 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (3, 3), (15, 2)],
  term ((-25493387784 : Rat) / 7401317245) [(1, 1), (3, 3), (15, 2), (16, 1)],
  term ((4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 2)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (10, 2), (12, 1)],
  term ((4264350945029066921130481360160 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (11, 2)],
  term ((-10985854649935407734188596937344 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (7, 1), (11, 2), (12, 1)],
  term ((-57694203959615192486591052096 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (9, 1), (10, 2)],
  term ((-57694203959615192486591052096 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (9, 1), (11, 2)],
  term ((-3586896357230346710991421042256 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (10, 2), (11, 1)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 2), (11, 1), (12, 1)],
  term ((94018064428882796171721902401088 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (10, 2), (13, 1)],
  term ((-626410151106379565259861281506904150652256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (10, 2), (15, 1)],
  term ((10261853432 : Rat) / 7401317245) [(1, 1), (4, 1), (10, 2), (15, 1), (16, 1)],
  term ((94018064428882796171721902401088 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 2), (13, 1)],
  term ((-626410151106379565259861281506904150652256 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (4, 1), (11, 2), (15, 1)],
  term ((10261853432 : Rat) / 7401317245) [(1, 1), (4, 1), (11, 2), (15, 1), (16, 1)],
  term ((-3586896357230346710991421042256 : Rat) / 97983883872014706756151952089) [(1, 1), (4, 1), (11, 3)],
  term ((5492927324967703867094298468672 : Rat) / 1273790490336191187829975377157) [(1, 1), (4, 1), (11, 3), (12, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 1), (10, 2), (11, 1)],
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (10, 2), (15, 1)],
  term ((-4156477395494090026460036267072 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (7, 1), (11, 2), (15, 1)],
  term ((586405744755553529911904053344 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 1), (11, 3)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2), (10, 2)],
  term ((-1172811489511107059823808106688 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (7, 2), (11, 2)],
  term ((2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (10, 2)],
  term ((2171981086039173739413283317888 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (8, 1), (11, 2)],
  term ((22793140321558280028044858688 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (10, 2)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (10, 2), (11, 1), (15, 1)],
  term ((-103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (10, 2), (12, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (10, 2), (14, 1)],
  term ((22793140321558280028044858688 : Rat) / 97983883872014706756151952089) [(1, 1), (5, 1), (11, 2)],
  term ((-103849214841592857571049593728 : Rat) / 115799135485108289802725034287) [(1, 1), (5, 1), (11, 2), (12, 1)],
  term ((4422308717921886249685125969792 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 2), (14, 1)],
  term ((2078238697747045013230018133536 : Rat) / 1273790490336191187829975377157) [(1, 1), (5, 1), (11, 3), (15, 1)],
  term ((-1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (10, 2)],
  term ((-1204603110221925235828014603456 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (9, 1), (11, 2)],
  term ((-57425008990310286737083701086592 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 2), (11, 1)],
  term ((102968437825009349737042674461184 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (10, 2), (13, 1)],
  term ((870252567751057344865301407532256850744608 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (10, 2), (15, 1)],
  term ((56478225624 : Rat) / 7401317245) [(1, 1), (6, 1), (10, 2), (15, 1), (16, 1)],
  term ((102968437825009349737042674461184 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 2), (13, 1)],
  term ((870252567751057344865301407532256850744608 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (6, 1), (11, 2), (15, 1)],
  term ((56478225624 : Rat) / 7401317245) [(1, 1), (6, 1), (11, 2), (15, 1), (16, 1)],
  term ((-57425008990310286737083701086592 : Rat) / 1273790490336191187829975377157) [(1, 1), (6, 1), (11, 3)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (10, 2)],
  term ((-667816541773297038042395647488 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (8, 1), (11, 2)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (10, 2), (11, 1)],
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (10, 2), (15, 1)],
  term ((5341198330930208362705357853952 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((8011797496395312544058036780928 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (9, 1), (11, 3)],
  term ((-1737944129226413015176017981360 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2), (11, 1), (13, 1)],
  term ((-37869057826735434227527751935103257467968 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (7, 1), (10, 2), (11, 1), (15, 1), (16, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2), (11, 2)],
  term ((9220618437057331434984373750848 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2), (12, 1)],
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (10, 2), (13, 1), (15, 1)],
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (10, 2), (15, 2)],
  term ((-1737944129226413015176017981360 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 2)],
  term ((9220618437057331434984373750848 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 2), (12, 1)],
  term ((-122455857624635010044375755877376 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-372904837188525610999086861602209471911616 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (7, 1), (11, 2), (15, 2)],
  term ((-183683786436952515066563633816064 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 3), (13, 1)],
  term ((-37869057826735434227527751935103257467968 : Rat) / 103601401347717117429703636119532782115) [(1, 1), (7, 1), (11, 3), (15, 1)],
  term ((-76480163352 : Rat) / 7401317245) [(1, 1), (7, 1), (11, 3), (15, 1), (16, 1)],
  term ((97538778637363573238154394507392 : Rat) / 1273790490336191187829975377157) [(1, 1), (7, 1), (11, 4)],
  term ((-12370463792602028356086027509376 : Rat) / 1273790490336191187829975377157) [(2, 2)],
  term ((-12370463792602028356086027509376 : Rat) / 1273790490336191187829975377157) [(3, 2)],
  term ((12370463792602028356086027509376 : Rat) / 1273790490336191187829975377157) [(10, 2)],
  term ((12370463792602028356086027509376 : Rat) / 1273790490336191187829975377157) [(11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 0 through 99. -/
theorem ep_Q2_002_block_04_0000_0099_valid :
    checkProductSumEq ep_Q2_002_partials_04_0000_0099
      ep_Q2_002_block_04_0000_0099 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
