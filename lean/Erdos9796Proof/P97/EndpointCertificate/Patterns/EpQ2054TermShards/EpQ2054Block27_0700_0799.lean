/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_054, term block 27:700-799

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_054`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2054TermShards

/-- Generator polynomial 27 for endpoint certificate `ep_Q2_054`. -/
def ep_Q2_054_generator_27_0700_0799 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(14, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0700 : Poly :=
[
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 700 for generator 27. -/
def ep_Q2_054_partial_27_0700 : Poly :=
[
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 27. -/
theorem ep_Q2_054_partial_27_0700_valid :
    mulPoly ep_Q2_054_coefficient_27_0700
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0701 : Poly :=
[
  term ((-3131515798236 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1)]
]

/-- Partial product 701 for generator 27. -/
def ep_Q2_054_partial_27_0701 : Poly :=
[
  term ((3131515798236 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-6263031596472 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 27. -/
theorem ep_Q2_054_partial_27_0701_valid :
    mulPoly ep_Q2_054_coefficient_27_0701
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0702 : Poly :=
[
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 702 for generator 27. -/
def ep_Q2_054_partial_27_0702 : Poly :=
[
  term ((367622707952592 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 27. -/
theorem ep_Q2_054_partial_27_0702_valid :
    mulPoly ep_Q2_054_coefficient_27_0702
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0703 : Poly :=
[
  term ((1921834114173 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1)]
]

/-- Partial product 703 for generator 27. -/
def ep_Q2_054_partial_27_0703 : Poly :=
[
  term ((3843668228346 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1921834114173 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 27. -/
theorem ep_Q2_054_partial_27_0703_valid :
    mulPoly ep_Q2_054_coefficient_27_0703
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0703 := by
  native_decide

/-- Coefficient term 704 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0704 : Poly :=
[
  term ((-6101325000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 704 for generator 27. -/
def ep_Q2_054_partial_27_0704 : Poly :=
[
  term ((-12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((6101325000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 704 for generator 27. -/
theorem ep_Q2_054_partial_27_0704_valid :
    mulPoly ep_Q2_054_coefficient_27_0704
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0704 := by
  native_decide

/-- Coefficient term 705 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0705 : Poly :=
[
  term ((7315593419799 : Rat) / 90066973034) [(7, 1), (8, 1), (11, 1)]
]

/-- Partial product 705 for generator 27. -/
def ep_Q2_054_partial_27_0705 : Poly :=
[
  term ((-7315593419799 : Rat) / 90066973034) [(7, 1), (8, 1), (11, 1)],
  term ((7315593419799 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 705 for generator 27. -/
theorem ep_Q2_054_partial_27_0705_valid :
    mulPoly ep_Q2_054_coefficient_27_0705
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0705 := by
  native_decide

/-- Coefficient term 706 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0706 : Poly :=
[
  term ((3831642841986 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1)]
]

/-- Partial product 706 for generator 27. -/
def ep_Q2_054_partial_27_0706 : Poly :=
[
  term ((-3831642841986 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((7663285683972 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 706 for generator 27. -/
theorem ep_Q2_054_partial_27_0706_valid :
    mulPoly ep_Q2_054_coefficient_27_0706
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0706 := by
  native_decide

/-- Coefficient term 707 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0707 : Poly :=
[
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 707 for generator 27. -/
def ep_Q2_054_partial_27_0707 : Poly :=
[
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 707 for generator 27. -/
theorem ep_Q2_054_partial_27_0707_valid :
    mulPoly ep_Q2_054_coefficient_27_0707
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0707 := by
  native_decide

/-- Coefficient term 708 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0708 : Poly :=
[
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 2)]
]

/-- Partial product 708 for generator 27. -/
def ep_Q2_054_partial_27_0708 : Poly :=
[
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 2)],
  term ((1867005450000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 708 for generator 27. -/
theorem ep_Q2_054_partial_27_0708_valid :
    mulPoly ep_Q2_054_coefficient_27_0708
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0708 := by
  native_decide

/-- Coefficient term 709 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0709 : Poly :=
[
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 709 for generator 27. -/
def ep_Q2_054_partial_27_0709 : Poly :=
[
  term ((183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 709 for generator 27. -/
theorem ep_Q2_054_partial_27_0709_valid :
    mulPoly ep_Q2_054_coefficient_27_0709
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0709 := by
  native_decide

/-- Coefficient term 710 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0710 : Poly :=
[
  term ((-91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 710 for generator 27. -/
def ep_Q2_054_partial_27_0710 : Poly :=
[
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 710 for generator 27. -/
theorem ep_Q2_054_partial_27_0710_valid :
    mulPoly ep_Q2_054_coefficient_27_0710
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0710 := by
  native_decide

/-- Coefficient term 711 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0711 : Poly :=
[
  term ((-1921834114173 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (14, 1)]
]

/-- Partial product 711 for generator 27. -/
def ep_Q2_054_partial_27_0711 : Poly :=
[
  term ((1921834114173 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((-3843668228346 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 711 for generator 27. -/
theorem ep_Q2_054_partial_27_0711_valid :
    mulPoly ep_Q2_054_coefficient_27_0711
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0711 := by
  native_decide

/-- Coefficient term 712 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0712 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 712 for generator 27. -/
def ep_Q2_054_partial_27_0712 : Poly :=
[
  term ((-6101325000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 712 for generator 27. -/
theorem ep_Q2_054_partial_27_0712_valid :
    mulPoly ep_Q2_054_coefficient_27_0712
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0712 := by
  native_decide

/-- Coefficient term 713 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0713 : Poly :=
[
  term ((3050662500 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 713 for generator 27. -/
def ep_Q2_054_partial_27_0713 : Poly :=
[
  term ((6101325000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (14, 1), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 713 for generator 27. -/
theorem ep_Q2_054_partial_27_0713_valid :
    mulPoly ep_Q2_054_coefficient_27_0713
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0713 := by
  native_decide

/-- Coefficient term 714 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0714 : Poly :=
[
  term ((233375681250 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (13, 1)]
]

/-- Partial product 714 for generator 27. -/
def ep_Q2_054_partial_27_0714 : Poly :=
[
  term ((-233375681250 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 714 for generator 27. -/
theorem ep_Q2_054_partial_27_0714_valid :
    mulPoly ep_Q2_054_coefficient_27_0714
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0714 := by
  native_decide

/-- Coefficient term 715 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0715 : Poly :=
[
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 715 for generator 27. -/
def ep_Q2_054_partial_27_0715 : Poly :=
[
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 715 for generator 27. -/
theorem ep_Q2_054_partial_27_0715_valid :
    mulPoly ep_Q2_054_coefficient_27_0715
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0715 := by
  native_decide

/-- Coefficient term 716 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0716 : Poly :=
[
  term ((-21394505299743 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

/-- Partial product 716 for generator 27. -/
def ep_Q2_054_partial_27_0716 : Poly :=
[
  term ((-42789010599486 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((21394505299743 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 716 for generator 27. -/
theorem ep_Q2_054_partial_27_0716_valid :
    mulPoly ep_Q2_054_coefficient_27_0716
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0716 := by
  native_decide

/-- Coefficient term 717 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0717 : Poly :=
[
  term ((-958289084010 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 717 for generator 27. -/
def ep_Q2_054_partial_27_0717 : Poly :=
[
  term ((-1916578168020 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((958289084010 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 717 for generator 27. -/
theorem ep_Q2_054_partial_27_0717_valid :
    mulPoly ep_Q2_054_coefficient_27_0717
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0717 := by
  native_decide

/-- Coefficient term 718 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0718 : Poly :=
[
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 2), (15, 1)]
]

/-- Partial product 718 for generator 27. -/
def ep_Q2_054_partial_27_0718 : Poly :=
[
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 718 for generator 27. -/
theorem ep_Q2_054_partial_27_0718_valid :
    mulPoly ep_Q2_054_coefficient_27_0718
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0718 := by
  native_decide

/-- Coefficient term 719 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0719 : Poly :=
[
  term ((6583668128847 : Rat) / 90066973034) [(7, 1), (8, 1), (13, 1)]
]

/-- Partial product 719 for generator 27. -/
def ep_Q2_054_partial_27_0719 : Poly :=
[
  term ((-6583668128847 : Rat) / 90066973034) [(7, 1), (8, 1), (13, 1)],
  term ((6583668128847 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 719 for generator 27. -/
theorem ep_Q2_054_partial_27_0719_valid :
    mulPoly ep_Q2_054_coefficient_27_0719
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0719 := by
  native_decide

/-- Coefficient term 720 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0720 : Poly :=
[
  term ((1616480524287 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (14, 1)]
]

/-- Partial product 720 for generator 27. -/
def ep_Q2_054_partial_27_0720 : Poly :=
[
  term ((-1616480524287 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((3232961048574 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 720 for generator 27. -/
theorem ep_Q2_054_partial_27_0720_valid :
    mulPoly ep_Q2_054_coefficient_27_0720
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0720 := by
  native_decide

/-- Coefficient term 721 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0721 : Poly :=
[
  term ((-9316951212132 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

/-- Partial product 721 for generator 27. -/
def ep_Q2_054_partial_27_0721 : Poly :=
[
  term ((-18633902424264 : Rat) / 45033486517) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((9316951212132 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 721 for generator 27. -/
theorem ep_Q2_054_partial_27_0721_valid :
    mulPoly ep_Q2_054_coefficient_27_0721
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0721 := by
  native_decide

/-- Coefficient term 722 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0722 : Poly :=
[
  term ((36607950000 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 722 for generator 27. -/
def ep_Q2_054_partial_27_0722 : Poly :=
[
  term ((73215900000 : Rat) / 45033486517) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 722 for generator 27. -/
theorem ep_Q2_054_partial_27_0722_valid :
    mulPoly ep_Q2_054_coefficient_27_0722
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0722 := by
  native_decide

/-- Coefficient term 723 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0723 : Poly :=
[
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1)]
]

/-- Partial product 723 for generator 27. -/
def ep_Q2_054_partial_27_0723 : Poly :=
[
  term ((-311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((622335150000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 723 for generator 27. -/
theorem ep_Q2_054_partial_27_0723_valid :
    mulPoly ep_Q2_054_coefficient_27_0723
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0723 := by
  native_decide

/-- Coefficient term 724 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0724 : Poly :=
[
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (15, 1)]
]

/-- Partial product 724 for generator 27. -/
def ep_Q2_054_partial_27_0724 : Poly :=
[
  term ((-311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (14, 1), (15, 1)],
  term ((155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 724 for generator 27. -/
theorem ep_Q2_054_partial_27_0724_valid :
    mulPoly ep_Q2_054_coefficient_27_0724
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0724 := by
  native_decide

/-- Coefficient term 725 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0725 : Poly :=
[
  term ((-233375681250 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1)]
]

/-- Partial product 725 for generator 27. -/
def ep_Q2_054_partial_27_0725 : Poly :=
[
  term ((233375681250 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 725 for generator 27. -/
theorem ep_Q2_054_partial_27_0725_valid :
    mulPoly ep_Q2_054_coefficient_27_0725
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0725 := by
  native_decide

/-- Coefficient term 726 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0726 : Poly :=
[
  term ((-311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (12, 1)]
]

/-- Partial product 726 for generator 27. -/
def ep_Q2_054_partial_27_0726 : Poly :=
[
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((-622335150000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 726 for generator 27. -/
theorem ep_Q2_054_partial_27_0726_valid :
    mulPoly ep_Q2_054_coefficient_27_0726
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0726 := by
  native_decide

/-- Coefficient term 727 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0727 : Poly :=
[
  term ((155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (14, 1)]
]

/-- Partial product 727 for generator 27. -/
def ep_Q2_054_partial_27_0727 : Poly :=
[
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (14, 1)],
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 727 for generator 27. -/
theorem ep_Q2_054_partial_27_0727_valid :
    mulPoly ep_Q2_054_coefficient_27_0727
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0727 := by
  native_decide

/-- Coefficient term 728 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0728 : Poly :=
[
  term ((155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (12, 1), (15, 1)]
]

/-- Partial product 728 for generator 27. -/
def ep_Q2_054_partial_27_0728 : Poly :=
[
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 728 for generator 27. -/
theorem ep_Q2_054_partial_27_0728_valid :
    mulPoly ep_Q2_054_coefficient_27_0728
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0728 := by
  native_decide

/-- Coefficient term 729 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0729 : Poly :=
[
  term ((-77791893750 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1)]
]

/-- Partial product 729 for generator 27. -/
def ep_Q2_054_partial_27_0729 : Poly :=
[
  term ((77791893750 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 729 for generator 27. -/
theorem ep_Q2_054_partial_27_0729_valid :
    mulPoly ep_Q2_054_coefficient_27_0729
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0729 := by
  native_decide

/-- Coefficient term 730 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0730 : Poly :=
[
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1), (14, 1)]
]

/-- Partial product 730 for generator 27. -/
def ep_Q2_054_partial_27_0730 : Poly :=
[
  term ((155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1), (14, 1)],
  term ((-311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 730 for generator 27. -/
theorem ep_Q2_054_partial_27_0730_valid :
    mulPoly ep_Q2_054_coefficient_27_0730
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0730 := by
  native_decide

/-- Coefficient term 731 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0731 : Poly :=
[
  term ((155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (15, 1)]
]

/-- Partial product 731 for generator 27. -/
def ep_Q2_054_partial_27_0731 : Poly :=
[
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 731 for generator 27. -/
theorem ep_Q2_054_partial_27_0731_valid :
    mulPoly ep_Q2_054_coefficient_27_0731
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0731 := by
  native_decide

/-- Coefficient term 732 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0732 : Poly :=
[
  term ((-2047339045620 : Rat) / 45033486517) [(7, 1), (9, 1)]
]

/-- Partial product 732 for generator 27. -/
def ep_Q2_054_partial_27_0732 : Poly :=
[
  term ((2047339045620 : Rat) / 45033486517) [(7, 1), (9, 1)],
  term ((-4094678091240 : Rat) / 45033486517) [(7, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 732 for generator 27. -/
theorem ep_Q2_054_partial_27_0732_valid :
    mulPoly ep_Q2_054_coefficient_27_0732
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0732 := by
  native_decide

/-- Coefficient term 733 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0733 : Poly :=
[
  term ((-19069706535219 : Rat) / 180133946068) [(7, 1), (9, 1), (10, 1)]
]

/-- Partial product 733 for generator 27. -/
def ep_Q2_054_partial_27_0733 : Poly :=
[
  term ((19069706535219 : Rat) / 180133946068) [(7, 1), (9, 1), (10, 1)],
  term ((-19069706535219 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 733 for generator 27. -/
theorem ep_Q2_054_partial_27_0733_valid :
    mulPoly ep_Q2_054_coefficient_27_0733
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0733 := by
  native_decide

/-- Coefficient term 734 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0734 : Poly :=
[
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 734 for generator 27. -/
def ep_Q2_054_partial_27_0734 : Poly :=
[
  term ((-2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((5695991849700 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 734 for generator 27. -/
theorem ep_Q2_054_partial_27_0734_valid :
    mulPoly ep_Q2_054_coefficient_27_0734
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0734 := by
  native_decide

/-- Coefficient term 735 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0735 : Poly :=
[
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 735 for generator 27. -/
def ep_Q2_054_partial_27_0735 : Poly :=
[
  term ((-2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 735 for generator 27. -/
theorem ep_Q2_054_partial_27_0735_valid :
    mulPoly ep_Q2_054_coefficient_27_0735
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0735 := by
  native_decide

/-- Coefficient term 736 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0736 : Poly :=
[
  term ((2900497167999 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 1), (12, 1)]
]

/-- Partial product 736 for generator 27. -/
def ep_Q2_054_partial_27_0736 : Poly :=
[
  term ((-2900497167999 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 1), (12, 1)],
  term ((2900497167999 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 736 for generator 27. -/
theorem ep_Q2_054_partial_27_0736_valid :
    mulPoly ep_Q2_054_coefficient_27_0736
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0736 := by
  native_decide

/-- Coefficient term 737 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0737 : Poly :=
[
  term ((163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 737 for generator 27. -/
def ep_Q2_054_partial_27_0737 : Poly :=
[
  term ((326607707952 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 737 for generator 27. -/
theorem ep_Q2_054_partial_27_0737_valid :
    mulPoly ep_Q2_054_coefficient_27_0737
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0737 := by
  native_decide

/-- Coefficient term 738 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0738 : Poly :=
[
  term ((39658612500 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 738 for generator 27. -/
def ep_Q2_054_partial_27_0738 : Poly :=
[
  term ((79317225000 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-39658612500 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 738 for generator 27. -/
theorem ep_Q2_054_partial_27_0738_valid :
    mulPoly ep_Q2_054_coefficient_27_0738
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0738 := by
  native_decide

/-- Coefficient term 739 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0739 : Poly :=
[
  term ((1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 739 for generator 27. -/
def ep_Q2_054_partial_27_0739 : Poly :=
[
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 739 for generator 27. -/
theorem ep_Q2_054_partial_27_0739_valid :
    mulPoly ep_Q2_054_coefficient_27_0739
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0739 := by
  native_decide

/-- Coefficient term 740 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0740 : Poly :=
[
  term ((-1587301816401 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (13, 1)]
]

/-- Partial product 740 for generator 27. -/
def ep_Q2_054_partial_27_0740 : Poly :=
[
  term ((1587301816401 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1587301816401 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 740 for generator 27. -/
theorem ep_Q2_054_partial_27_0740_valid :
    mulPoly ep_Q2_054_coefficient_27_0740
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0740 := by
  native_decide

/-- Coefficient term 741 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0741 : Poly :=
[
  term ((-1587301816401 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 741 for generator 27. -/
def ep_Q2_054_partial_27_0741 : Poly :=
[
  term ((1587301816401 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-3174603632802 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 741 for generator 27. -/
theorem ep_Q2_054_partial_27_0741_valid :
    mulPoly ep_Q2_054_coefficient_27_0741
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0741 := by
  native_decide

/-- Coefficient term 742 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0742 : Poly :=
[
  term ((1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

/-- Partial product 742 for generator 27. -/
def ep_Q2_054_partial_27_0742 : Poly :=
[
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 742 for generator 27. -/
theorem ep_Q2_054_partial_27_0742_valid :
    mulPoly ep_Q2_054_coefficient_27_0742
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0742 := by
  native_decide

/-- Coefficient term 743 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0743 : Poly :=
[
  term ((-4271993887275 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 2)]
]

/-- Partial product 743 for generator 27. -/
def ep_Q2_054_partial_27_0743 : Poly :=
[
  term ((4271993887275 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 2)],
  term ((-4271993887275 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 743 for generator 27. -/
theorem ep_Q2_054_partial_27_0743_valid :
    mulPoly ep_Q2_054_coefficient_27_0743
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0743 := by
  native_decide

/-- Coefficient term 744 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0744 : Poly :=
[
  term ((-2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (12, 1)]
]

/-- Partial product 744 for generator 27. -/
def ep_Q2_054_partial_27_0744 : Poly :=
[
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((-5695991849700 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 744 for generator 27. -/
theorem ep_Q2_054_partial_27_0744_valid :
    mulPoly ep_Q2_054_coefficient_27_0744
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0744 := by
  native_decide

/-- Coefficient term 745 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0745 : Poly :=
[
  term ((1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (14, 1)]
]

/-- Partial product 745 for generator 27. -/
def ep_Q2_054_partial_27_0745 : Poly :=
[
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 745 for generator 27. -/
theorem ep_Q2_054_partial_27_0745_valid :
    mulPoly ep_Q2_054_coefficient_27_0745
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0745 := by
  native_decide

/-- Coefficient term 746 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0746 : Poly :=
[
  term ((-5961828101463 : Rat) / 180133946068) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 746 for generator 27. -/
def ep_Q2_054_partial_27_0746 : Poly :=
[
  term ((5961828101463 : Rat) / 180133946068) [(7, 1), (9, 1), (12, 1)],
  term ((-5961828101463 : Rat) / 90066973034) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 746 for generator 27. -/
theorem ep_Q2_054_partial_27_0746_valid :
    mulPoly ep_Q2_054_coefficient_27_0746
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0746 := by
  native_decide

/-- Coefficient term 747 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0747 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

/-- Partial product 747 for generator 27. -/
def ep_Q2_054_partial_27_0747 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 747 for generator 27. -/
theorem ep_Q2_054_partial_27_0747_valid :
    mulPoly ep_Q2_054_coefficient_27_0747
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0747 := by
  native_decide

/-- Coefficient term 748 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0748 : Poly :=
[
  term ((2405984628465 : Rat) / 90066973034) [(7, 1), (9, 1), (12, 2)]
]

/-- Partial product 748 for generator 27. -/
def ep_Q2_054_partial_27_0748 : Poly :=
[
  term ((-2405984628465 : Rat) / 90066973034) [(7, 1), (9, 1), (12, 2)],
  term ((2405984628465 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 748 for generator 27. -/
theorem ep_Q2_054_partial_27_0748_valid :
    mulPoly ep_Q2_054_coefficient_27_0748
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0748 := by
  native_decide

/-- Coefficient term 749 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0749 : Poly :=
[
  term ((-1459806028371 : Rat) / 90066973034) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 749 for generator 27. -/
def ep_Q2_054_partial_27_0749 : Poly :=
[
  term ((1459806028371 : Rat) / 90066973034) [(7, 1), (9, 1), (14, 1)],
  term ((-1459806028371 : Rat) / 45033486517) [(7, 1), (9, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 749 for generator 27. -/
theorem ep_Q2_054_partial_27_0749_valid :
    mulPoly ep_Q2_054_coefficient_27_0749
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0749 := by
  native_decide

/-- Coefficient term 750 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0750 : Poly :=
[
  term ((-18303975000 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)]
]

/-- Partial product 750 for generator 27. -/
def ep_Q2_054_partial_27_0750 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((18303975000 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 750 for generator 27. -/
theorem ep_Q2_054_partial_27_0750_valid :
    mulPoly ep_Q2_054_coefficient_27_0750
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0750 := by
  native_decide

/-- Coefficient term 751 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0751 : Poly :=
[
  term ((228985491894 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 751 for generator 27. -/
def ep_Q2_054_partial_27_0751 : Poly :=
[
  term ((-228985491894 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1)],
  term ((457970983788 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 751 for generator 27. -/
theorem ep_Q2_054_partial_27_0751_valid :
    mulPoly ep_Q2_054_coefficient_27_0751
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0751 := by
  native_decide

/-- Coefficient term 752 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0752 : Poly :=
[
  term ((652201892001 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 752 for generator 27. -/
def ep_Q2_054_partial_27_0752 : Poly :=
[
  term ((-652201892001 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((1304403784002 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 752 for generator 27. -/
theorem ep_Q2_054_partial_27_0752_valid :
    mulPoly ep_Q2_054_coefficient_27_0752
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0752 := by
  native_decide

/-- Coefficient term 753 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0753 : Poly :=
[
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 753 for generator 27. -/
def ep_Q2_054_partial_27_0753 : Poly :=
[
  term ((11659739968296 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5829869984148 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 753 for generator 27. -/
theorem ep_Q2_054_partial_27_0753_valid :
    mulPoly ep_Q2_054_coefficient_27_0753
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0753 := by
  native_decide

/-- Coefficient term 754 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0754 : Poly :=
[
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (15, 2)]
]

/-- Partial product 754 for generator 27. -/
def ep_Q2_054_partial_27_0754 : Poly :=
[
  term ((-5829869984148 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((2914934992074 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 754 for generator 27. -/
theorem ep_Q2_054_partial_27_0754_valid :
    mulPoly ep_Q2_054_coefficient_27_0754
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0754 := by
  native_decide

/-- Coefficient term 755 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0755 : Poly :=
[
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 755 for generator 27. -/
def ep_Q2_054_partial_27_0755 : Poly :=
[
  term ((-410136305154 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 755 for generator 27. -/
theorem ep_Q2_054_partial_27_0755_valid :
    mulPoly ep_Q2_054_coefficient_27_0755
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0755 := by
  native_decide

/-- Coefficient term 756 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0756 : Poly :=
[
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 756 for generator 27. -/
def ep_Q2_054_partial_27_0756 : Poly :=
[
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((1867005450000 : Rat) / 45033486517) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 756 for generator 27. -/
theorem ep_Q2_054_partial_27_0756_valid :
    mulPoly ep_Q2_054_coefficient_27_0756
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0756 := by
  native_decide

/-- Coefficient term 757 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0757 : Poly :=
[
  term ((2400258477825 : Rat) / 90066973034) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 757 for generator 27. -/
def ep_Q2_054_partial_27_0757 : Poly :=
[
  term ((2400258477825 : Rat) / 45033486517) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2400258477825 : Rat) / 90066973034) [(7, 1), (10, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 757 for generator 27. -/
theorem ep_Q2_054_partial_27_0757_valid :
    mulPoly ep_Q2_054_coefficient_27_0757
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0757 := by
  native_decide

/-- Coefficient term 758 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0758 : Poly :=
[
  term ((15654581887563 : Rat) / 180133946068) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 758 for generator 27. -/
def ep_Q2_054_partial_27_0758 : Poly :=
[
  term ((-15654581887563 : Rat) / 180133946068) [(7, 1), (10, 1), (13, 1)],
  term ((15654581887563 : Rat) / 90066973034) [(7, 1), (10, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 758 for generator 27. -/
theorem ep_Q2_054_partial_27_0758_valid :
    mulPoly ep_Q2_054_coefficient_27_0758
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0758 := by
  native_decide

/-- Coefficient term 759 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0759 : Poly :=
[
  term ((-79519059691308 : Rat) / 45033486517) [(7, 1), (10, 1), (13, 1), (15, 2)]
]

/-- Partial product 759 for generator 27. -/
def ep_Q2_054_partial_27_0759 : Poly :=
[
  term ((-159038119382616 : Rat) / 45033486517) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (10, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 759 for generator 27. -/
theorem ep_Q2_054_partial_27_0759_valid :
    mulPoly ep_Q2_054_coefficient_27_0759
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0759 := by
  native_decide

/-- Coefficient term 760 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0760 : Poly :=
[
  term ((212234300337 : Rat) / 90066973034) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 760 for generator 27. -/
def ep_Q2_054_partial_27_0760 : Poly :=
[
  term ((212234300337 : Rat) / 45033486517) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-212234300337 : Rat) / 90066973034) [(7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 760 for generator 27. -/
theorem ep_Q2_054_partial_27_0760_valid :
    mulPoly ep_Q2_054_coefficient_27_0760
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0760 := by
  native_decide

/-- Coefficient term 761 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0761 : Poly :=
[
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 761 for generator 27. -/
def ep_Q2_054_partial_27_0761 : Poly :=
[
  term ((-410136305154 : Rat) / 45033486517) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 761 for generator 27. -/
theorem ep_Q2_054_partial_27_0761_valid :
    mulPoly ep_Q2_054_coefficient_27_0761
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0761 := by
  native_decide

/-- Coefficient term 762 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0762 : Poly :=
[
  term ((-1100127457650 : Rat) / 45033486517) [(7, 1), (11, 1)]
]

/-- Partial product 762 for generator 27. -/
def ep_Q2_054_partial_27_0762 : Poly :=
[
  term ((1100127457650 : Rat) / 45033486517) [(7, 1), (11, 1)],
  term ((-2200254915300 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 762 for generator 27. -/
theorem ep_Q2_054_partial_27_0762_valid :
    mulPoly ep_Q2_054_coefficient_27_0762
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0762 := by
  native_decide

/-- Coefficient term 763 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0763 : Poly :=
[
  term ((-8503455411657 : Rat) / 90066973034) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 763 for generator 27. -/
def ep_Q2_054_partial_27_0763 : Poly :=
[
  term ((8503455411657 : Rat) / 90066973034) [(7, 1), (11, 1), (12, 1)],
  term ((-8503455411657 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 763 for generator 27. -/
theorem ep_Q2_054_partial_27_0763_valid :
    mulPoly ep_Q2_054_coefficient_27_0763
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0763 := by
  native_decide

/-- Coefficient term 764 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0764 : Poly :=
[
  term ((514676514249 : Rat) / 90066973034) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 764 for generator 27. -/
def ep_Q2_054_partial_27_0764 : Poly :=
[
  term ((-514676514249 : Rat) / 90066973034) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((514676514249 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 764 for generator 27. -/
theorem ep_Q2_054_partial_27_0764_valid :
    mulPoly ep_Q2_054_coefficient_27_0764
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0764 := by
  native_decide

/-- Coefficient term 765 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0765 : Poly :=
[
  term ((2914934992074 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

/-- Partial product 765 for generator 27. -/
def ep_Q2_054_partial_27_0765 : Poly :=
[
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 765 for generator 27. -/
theorem ep_Q2_054_partial_27_0765_valid :
    mulPoly ep_Q2_054_coefficient_27_0765
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0765 := by
  native_decide

/-- Coefficient term 766 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0766 : Poly :=
[
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 2)]
]

/-- Partial product 766 for generator 27. -/
def ep_Q2_054_partial_27_0766 : Poly :=
[
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 2)],
  term ((-1867005450000 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 766 for generator 27. -/
theorem ep_Q2_054_partial_27_0766_valid :
    mulPoly ep_Q2_054_coefficient_27_0766
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0766 := by
  native_decide

/-- Coefficient term 767 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0767 : Poly :=
[
  term ((76604124699234 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 767 for generator 27. -/
def ep_Q2_054_partial_27_0767 : Poly :=
[
  term ((-76604124699234 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((153208249398468 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 767 for generator 27. -/
theorem ep_Q2_054_partial_27_0767_valid :
    mulPoly ep_Q2_054_coefficient_27_0767
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0767 := by
  native_decide

/-- Coefficient term 768 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0768 : Poly :=
[
  term ((38302062349617 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 768 for generator 27. -/
def ep_Q2_054_partial_27_0768 : Poly :=
[
  term ((76604124699234 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-38302062349617 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 768 for generator 27. -/
theorem ep_Q2_054_partial_27_0768_valid :
    mulPoly ep_Q2_054_coefficient_27_0768
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0768 := by
  native_decide

/-- Coefficient term 769 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0769 : Poly :=
[
  term ((-834850898187 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 769 for generator 27. -/
def ep_Q2_054_partial_27_0769 : Poly :=
[
  term ((834850898187 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 1)],
  term ((-1669701796374 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 769 for generator 27. -/
theorem ep_Q2_054_partial_27_0769_valid :
    mulPoly ep_Q2_054_coefficient_27_0769
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0769 := by
  native_decide

/-- Coefficient term 770 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0770 : Poly :=
[
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 770 for generator 27. -/
def ep_Q2_054_partial_27_0770 : Poly :=
[
  term ((-205068152577 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((410136305154 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 770 for generator 27. -/
theorem ep_Q2_054_partial_27_0770_valid :
    mulPoly ep_Q2_054_coefficient_27_0770
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0770 := by
  native_decide

/-- Coefficient term 771 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0771 : Poly :=
[
  term ((2914934992074 : Rat) / 45033486517) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 771 for generator 27. -/
def ep_Q2_054_partial_27_0771 : Poly :=
[
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 771 for generator 27. -/
theorem ep_Q2_054_partial_27_0771_valid :
    mulPoly ep_Q2_054_coefficient_27_0771
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0771 := by
  native_decide

/-- Coefficient term 772 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0772 : Poly :=
[
  term ((205068152577 : Rat) / 90066973034) [(7, 1), (11, 1), (16, 1)]
]

/-- Partial product 772 for generator 27. -/
def ep_Q2_054_partial_27_0772 : Poly :=
[
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-205068152577 : Rat) / 90066973034) [(7, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 772 for generator 27. -/
theorem ep_Q2_054_partial_27_0772_valid :
    mulPoly ep_Q2_054_coefficient_27_0772
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0772 := by
  native_decide

/-- Coefficient term 773 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0773 : Poly :=
[
  term ((-5829869984148 : Rat) / 45033486517) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

/-- Partial product 773 for generator 27. -/
def ep_Q2_054_partial_27_0773 : Poly :=
[
  term ((-11659739968296 : Rat) / 45033486517) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (11, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 773 for generator 27. -/
theorem ep_Q2_054_partial_27_0773_valid :
    mulPoly ep_Q2_054_coefficient_27_0773
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0773 := by
  native_decide

/-- Coefficient term 774 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0774 : Poly :=
[
  term ((2914934992074 : Rat) / 45033486517) [(7, 1), (11, 2), (14, 1), (15, 1)]
]

/-- Partial product 774 for generator 27. -/
def ep_Q2_054_partial_27_0774 : Poly :=
[
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (11, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 774 for generator 27. -/
theorem ep_Q2_054_partial_27_0774_valid :
    mulPoly ep_Q2_054_coefficient_27_0774
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0774 := by
  native_decide

/-- Coefficient term 775 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0775 : Poly :=
[
  term ((-4372402488111 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 775 for generator 27. -/
def ep_Q2_054_partial_27_0775 : Poly :=
[
  term ((-8744804976222 : Rat) / 45033486517) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((4372402488111 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 775 for generator 27. -/
theorem ep_Q2_054_partial_27_0775_valid :
    mulPoly ep_Q2_054_coefficient_27_0775
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0775 := by
  native_decide

/-- Coefficient term 776 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0776 : Poly :=
[
  term ((267619708935 : Rat) / 90066973034) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 776 for generator 27. -/
def ep_Q2_054_partial_27_0776 : Poly :=
[
  term ((-267619708935 : Rat) / 90066973034) [(7, 1), (12, 1), (13, 1)],
  term ((267619708935 : Rat) / 45033486517) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 776 for generator 27. -/
theorem ep_Q2_054_partial_27_0776_valid :
    mulPoly ep_Q2_054_coefficient_27_0776
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0776 := by
  native_decide

/-- Coefficient term 777 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0777 : Poly :=
[
  term ((-233375681250 : Rat) / 45033486517) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 777 for generator 27. -/
def ep_Q2_054_partial_27_0777 : Poly :=
[
  term ((233375681250 : Rat) / 45033486517) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (12, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 777 for generator 27. -/
theorem ep_Q2_054_partial_27_0777_valid :
    mulPoly ep_Q2_054_coefficient_27_0777
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0777 := by
  native_decide

/-- Coefficient term 778 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0778 : Poly :=
[
  term ((9435590178921 : Rat) / 180133946068) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 778 for generator 27. -/
def ep_Q2_054_partial_27_0778 : Poly :=
[
  term ((9435590178921 : Rat) / 90066973034) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9435590178921 : Rat) / 180133946068) [(7, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 778 for generator 27. -/
theorem ep_Q2_054_partial_27_0778_valid :
    mulPoly ep_Q2_054_coefficient_27_0778
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0778 := by
  native_decide

/-- Coefficient term 779 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0779 : Poly :=
[
  term ((-1626511429377 : Rat) / 45033486517) [(7, 1), (12, 2), (15, 1)]
]

/-- Partial product 779 for generator 27. -/
def ep_Q2_054_partial_27_0779 : Poly :=
[
  term ((-3253022858754 : Rat) / 45033486517) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((1626511429377 : Rat) / 45033486517) [(7, 1), (12, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 779 for generator 27. -/
theorem ep_Q2_054_partial_27_0779_valid :
    mulPoly ep_Q2_054_coefficient_27_0779
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0779 := by
  native_decide

/-- Coefficient term 780 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0780 : Poly :=
[
  term ((-21981551571891 : Rat) / 360267892136) [(7, 1), (13, 1)]
]

/-- Partial product 780 for generator 27. -/
def ep_Q2_054_partial_27_0780 : Poly :=
[
  term ((21981551571891 : Rat) / 360267892136) [(7, 1), (13, 1)],
  term ((-21981551571891 : Rat) / 180133946068) [(7, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 780 for generator 27. -/
theorem ep_Q2_054_partial_27_0780_valid :
    mulPoly ep_Q2_054_coefficient_27_0780
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0780 := by
  native_decide

/-- Coefficient term 781 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0781 : Poly :=
[
  term ((-6095115674325 : Rat) / 180133946068) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 781 for generator 27. -/
def ep_Q2_054_partial_27_0781 : Poly :=
[
  term ((6095115674325 : Rat) / 180133946068) [(7, 1), (13, 1), (14, 1)],
  term ((-6095115674325 : Rat) / 90066973034) [(7, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 781 for generator 27. -/
theorem ep_Q2_054_partial_27_0781_valid :
    mulPoly ep_Q2_054_coefficient_27_0781
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0781 := by
  native_decide

/-- Coefficient term 782 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0782 : Poly :=
[
  term ((-231246866448 : Rat) / 45033486517) [(7, 1), (15, 1)]
]

/-- Partial product 782 for generator 27. -/
def ep_Q2_054_partial_27_0782 : Poly :=
[
  term ((-462493732896 : Rat) / 45033486517) [(7, 1), (14, 1), (15, 1)],
  term ((231246866448 : Rat) / 45033486517) [(7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 782 for generator 27. -/
theorem ep_Q2_054_partial_27_0782_valid :
    mulPoly ep_Q2_054_coefficient_27_0782
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0782 := by
  native_decide

/-- Coefficient term 783 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0783 : Poly :=
[
  term ((936911013165 : Rat) / 180133946068) [(7, 2)]
]

/-- Partial product 783 for generator 27. -/
def ep_Q2_054_partial_27_0783 : Poly :=
[
  term ((-936911013165 : Rat) / 180133946068) [(7, 2)],
  term ((936911013165 : Rat) / 90066973034) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 783 for generator 27. -/
theorem ep_Q2_054_partial_27_0783_valid :
    mulPoly ep_Q2_054_coefficient_27_0783
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0783 := by
  native_decide

/-- Coefficient term 784 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0784 : Poly :=
[
  term ((118892288232 : Rat) / 45033486517) [(7, 2), (8, 1)]
]

/-- Partial product 784 for generator 27. -/
def ep_Q2_054_partial_27_0784 : Poly :=
[
  term ((-118892288232 : Rat) / 45033486517) [(7, 2), (8, 1)],
  term ((237784576464 : Rat) / 45033486517) [(7, 2), (8, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 784 for generator 27. -/
theorem ep_Q2_054_partial_27_0784_valid :
    mulPoly ep_Q2_054_coefficient_27_0784
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0784 := by
  native_decide

/-- Coefficient term 785 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0785 : Poly :=
[
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 785 for generator 27. -/
def ep_Q2_054_partial_27_0785 : Poly :=
[
  term ((-13727981250000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 785 for generator 27. -/
theorem ep_Q2_054_partial_27_0785_valid :
    mulPoly ep_Q2_054_coefficient_27_0785
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0785 := by
  native_decide

/-- Coefficient term 786 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0786 : Poly :=
[
  term ((3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1)]
]

/-- Partial product 786 for generator 27. -/
def ep_Q2_054_partial_27_0786 : Poly :=
[
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 786 for generator 27. -/
theorem ep_Q2_054_partial_27_0786_valid :
    mulPoly ep_Q2_054_coefficient_27_0786
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0786 := by
  native_decide

/-- Coefficient term 787 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0787 : Poly :=
[
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 787 for generator 27. -/
def ep_Q2_054_partial_27_0787 : Poly :=
[
  term ((-6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 787 for generator 27. -/
theorem ep_Q2_054_partial_27_0787_valid :
    mulPoly ep_Q2_054_coefficient_27_0787
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0787 := by
  native_decide

/-- Coefficient term 788 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0788 : Poly :=
[
  term ((1220635889154 : Rat) / 45033486517) [(7, 2), (8, 1), (12, 1)]
]

/-- Partial product 788 for generator 27. -/
def ep_Q2_054_partial_27_0788 : Poly :=
[
  term ((-1220635889154 : Rat) / 45033486517) [(7, 2), (8, 1), (12, 1)],
  term ((2441271778308 : Rat) / 45033486517) [(7, 2), (8, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 788 for generator 27. -/
theorem ep_Q2_054_partial_27_0788_valid :
    mulPoly ep_Q2_054_coefficient_27_0788
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0788 := by
  native_decide

/-- Coefficient term 789 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0789 : Poly :=
[
  term ((-36607950000 : Rat) / 45033486517) [(7, 2), (8, 1), (12, 1), (16, 1)]
]

/-- Partial product 789 for generator 27. -/
def ep_Q2_054_partial_27_0789 : Poly :=
[
  term ((-73215900000 : Rat) / 45033486517) [(7, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (8, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 789 for generator 27. -/
theorem ep_Q2_054_partial_27_0789_valid :
    mulPoly ep_Q2_054_coefficient_27_0789
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0789 := by
  native_decide

/-- Coefficient term 790 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0790 : Poly :=
[
  term ((-30446504325 : Rat) / 180133946068) [(7, 2), (10, 1)]
]

/-- Partial product 790 for generator 27. -/
def ep_Q2_054_partial_27_0790 : Poly :=
[
  term ((30446504325 : Rat) / 180133946068) [(7, 2), (10, 1)],
  term ((-30446504325 : Rat) / 90066973034) [(7, 2), (10, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 790 for generator 27. -/
theorem ep_Q2_054_partial_27_0790_valid :
    mulPoly ep_Q2_054_coefficient_27_0790
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0790 := by
  native_decide

/-- Coefficient term 791 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0791 : Poly :=
[
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (13, 1)]
]

/-- Partial product 791 for generator 27. -/
def ep_Q2_054_partial_27_0791 : Poly :=
[
  term ((-60893008650 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (13, 1)],
  term ((121786017300 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 791 for generator 27. -/
theorem ep_Q2_054_partial_27_0791_valid :
    mulPoly ep_Q2_054_coefficient_27_0791
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0791 := by
  native_decide

/-- Coefficient term 792 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0792 : Poly :=
[
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (15, 1)]
]

/-- Partial product 792 for generator 27. -/
def ep_Q2_054_partial_27_0792 : Poly :=
[
  term ((-60893008650 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 792 for generator 27. -/
theorem ep_Q2_054_partial_27_0792_valid :
    mulPoly ep_Q2_054_coefficient_27_0792
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0792 := by
  native_decide

/-- Coefficient term 793 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0793 : Poly :=
[
  term ((30446504325 : Rat) / 90066973034) [(7, 2), (10, 1), (12, 1)]
]

/-- Partial product 793 for generator 27. -/
def ep_Q2_054_partial_27_0793 : Poly :=
[
  term ((-30446504325 : Rat) / 90066973034) [(7, 2), (10, 1), (12, 1)],
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (12, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 793 for generator 27. -/
theorem ep_Q2_054_partial_27_0793_valid :
    mulPoly ep_Q2_054_coefficient_27_0793
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0793 := by
  native_decide

/-- Coefficient term 794 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0794 : Poly :=
[
  term ((-528954632460 : Rat) / 45033486517) [(7, 2), (10, 1), (13, 1), (15, 1)]
]

/-- Partial product 794 for generator 27. -/
def ep_Q2_054_partial_27_0794 : Poly :=
[
  term ((-1057909264920 : Rat) / 45033486517) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 794 for generator 27. -/
theorem ep_Q2_054_partial_27_0794_valid :
    mulPoly ep_Q2_054_coefficient_27_0794
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0794 := by
  native_decide

/-- Coefficient term 795 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0795 : Poly :=
[
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 795 for generator 27. -/
def ep_Q2_054_partial_27_0795 : Poly :=
[
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 795 for generator 27. -/
theorem ep_Q2_054_partial_27_0795_valid :
    mulPoly ep_Q2_054_coefficient_27_0795
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0795 := by
  native_decide

/-- Coefficient term 796 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0796 : Poly :=
[
  term ((498508128135 : Rat) / 90066973034) [(7, 2), (11, 1), (13, 1)]
]

/-- Partial product 796 for generator 27. -/
def ep_Q2_054_partial_27_0796 : Poly :=
[
  term ((-498508128135 : Rat) / 90066973034) [(7, 2), (11, 1), (13, 1)],
  term ((498508128135 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 796 for generator 27. -/
theorem ep_Q2_054_partial_27_0796_valid :
    mulPoly ep_Q2_054_coefficient_27_0796
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0796 := by
  native_decide

/-- Coefficient term 797 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0797 : Poly :=
[
  term ((498508128135 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

/-- Partial product 797 for generator 27. -/
def ep_Q2_054_partial_27_0797 : Poly :=
[
  term ((-498508128135 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((997016256270 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 797 for generator 27. -/
theorem ep_Q2_054_partial_27_0797_valid :
    mulPoly ep_Q2_054_coefficient_27_0797
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0797 := by
  native_decide

/-- Coefficient term 798 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0798 : Poly :=
[
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (11, 1), (15, 1)]
]

/-- Partial product 798 for generator 27. -/
def ep_Q2_054_partial_27_0798 : Poly :=
[
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 798 for generator 27. -/
theorem ep_Q2_054_partial_27_0798_valid :
    mulPoly ep_Q2_054_coefficient_27_0798
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0798 := by
  native_decide

/-- Coefficient term 799 from coefficient polynomial 27. -/
def ep_Q2_054_coefficient_27_0799 : Poly :=
[
  term ((-91339512975 : Rat) / 90066973034) [(7, 2), (11, 2)]
]

/-- Partial product 799 for generator 27. -/
def ep_Q2_054_partial_27_0799 : Poly :=
[
  term ((91339512975 : Rat) / 90066973034) [(7, 2), (11, 2)],
  term ((-91339512975 : Rat) / 45033486517) [(7, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 799 for generator 27. -/
theorem ep_Q2_054_partial_27_0799_valid :
    mulPoly ep_Q2_054_coefficient_27_0799
        ep_Q2_054_generator_27_0700_0799 =
      ep_Q2_054_partial_27_0799 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_054_partials_27_0700_0799 : List Poly :=
[
  ep_Q2_054_partial_27_0700,
  ep_Q2_054_partial_27_0701,
  ep_Q2_054_partial_27_0702,
  ep_Q2_054_partial_27_0703,
  ep_Q2_054_partial_27_0704,
  ep_Q2_054_partial_27_0705,
  ep_Q2_054_partial_27_0706,
  ep_Q2_054_partial_27_0707,
  ep_Q2_054_partial_27_0708,
  ep_Q2_054_partial_27_0709,
  ep_Q2_054_partial_27_0710,
  ep_Q2_054_partial_27_0711,
  ep_Q2_054_partial_27_0712,
  ep_Q2_054_partial_27_0713,
  ep_Q2_054_partial_27_0714,
  ep_Q2_054_partial_27_0715,
  ep_Q2_054_partial_27_0716,
  ep_Q2_054_partial_27_0717,
  ep_Q2_054_partial_27_0718,
  ep_Q2_054_partial_27_0719,
  ep_Q2_054_partial_27_0720,
  ep_Q2_054_partial_27_0721,
  ep_Q2_054_partial_27_0722,
  ep_Q2_054_partial_27_0723,
  ep_Q2_054_partial_27_0724,
  ep_Q2_054_partial_27_0725,
  ep_Q2_054_partial_27_0726,
  ep_Q2_054_partial_27_0727,
  ep_Q2_054_partial_27_0728,
  ep_Q2_054_partial_27_0729,
  ep_Q2_054_partial_27_0730,
  ep_Q2_054_partial_27_0731,
  ep_Q2_054_partial_27_0732,
  ep_Q2_054_partial_27_0733,
  ep_Q2_054_partial_27_0734,
  ep_Q2_054_partial_27_0735,
  ep_Q2_054_partial_27_0736,
  ep_Q2_054_partial_27_0737,
  ep_Q2_054_partial_27_0738,
  ep_Q2_054_partial_27_0739,
  ep_Q2_054_partial_27_0740,
  ep_Q2_054_partial_27_0741,
  ep_Q2_054_partial_27_0742,
  ep_Q2_054_partial_27_0743,
  ep_Q2_054_partial_27_0744,
  ep_Q2_054_partial_27_0745,
  ep_Q2_054_partial_27_0746,
  ep_Q2_054_partial_27_0747,
  ep_Q2_054_partial_27_0748,
  ep_Q2_054_partial_27_0749,
  ep_Q2_054_partial_27_0750,
  ep_Q2_054_partial_27_0751,
  ep_Q2_054_partial_27_0752,
  ep_Q2_054_partial_27_0753,
  ep_Q2_054_partial_27_0754,
  ep_Q2_054_partial_27_0755,
  ep_Q2_054_partial_27_0756,
  ep_Q2_054_partial_27_0757,
  ep_Q2_054_partial_27_0758,
  ep_Q2_054_partial_27_0759,
  ep_Q2_054_partial_27_0760,
  ep_Q2_054_partial_27_0761,
  ep_Q2_054_partial_27_0762,
  ep_Q2_054_partial_27_0763,
  ep_Q2_054_partial_27_0764,
  ep_Q2_054_partial_27_0765,
  ep_Q2_054_partial_27_0766,
  ep_Q2_054_partial_27_0767,
  ep_Q2_054_partial_27_0768,
  ep_Q2_054_partial_27_0769,
  ep_Q2_054_partial_27_0770,
  ep_Q2_054_partial_27_0771,
  ep_Q2_054_partial_27_0772,
  ep_Q2_054_partial_27_0773,
  ep_Q2_054_partial_27_0774,
  ep_Q2_054_partial_27_0775,
  ep_Q2_054_partial_27_0776,
  ep_Q2_054_partial_27_0777,
  ep_Q2_054_partial_27_0778,
  ep_Q2_054_partial_27_0779,
  ep_Q2_054_partial_27_0780,
  ep_Q2_054_partial_27_0781,
  ep_Q2_054_partial_27_0782,
  ep_Q2_054_partial_27_0783,
  ep_Q2_054_partial_27_0784,
  ep_Q2_054_partial_27_0785,
  ep_Q2_054_partial_27_0786,
  ep_Q2_054_partial_27_0787,
  ep_Q2_054_partial_27_0788,
  ep_Q2_054_partial_27_0789,
  ep_Q2_054_partial_27_0790,
  ep_Q2_054_partial_27_0791,
  ep_Q2_054_partial_27_0792,
  ep_Q2_054_partial_27_0793,
  ep_Q2_054_partial_27_0794,
  ep_Q2_054_partial_27_0795,
  ep_Q2_054_partial_27_0796,
  ep_Q2_054_partial_27_0797,
  ep_Q2_054_partial_27_0798,
  ep_Q2_054_partial_27_0799
]

/-- Sum of partial products in this block. -/
def ep_Q2_054_block_27_0700_0799 : Poly :=
[
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (12, 1), (15, 1)],
  term ((3131515798236 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1)],
  term ((-6263031596472 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1)],
  term ((367622707952592 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((-183811353976296 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (13, 1), (15, 2)],
  term ((3843668228346 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1)],
  term ((-12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1921834114173 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1)],
  term ((6101325000 : Rat) / 45033486517) [(7, 1), (8, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7315593419799 : Rat) / 90066973034) [(7, 1), (8, 1), (11, 1)],
  term ((-3831642841986 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1)],
  term ((8130037046472 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 1), (14, 2)],
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 2)],
  term ((1867005450000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (12, 2), (14, 1)],
  term ((-367622707952592 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((91905676988148 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (13, 1), (15, 1)],
  term ((9237427533972 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (14, 1)],
  term ((-3843668228346 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (14, 2)],
  term ((12202650000 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (14, 2), (16, 1)],
  term ((-3050662500 : Rat) / 45033486517) [(7, 1), (8, 1), (11, 1), (16, 1)],
  term ((-233375681250 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (13, 1)],
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (13, 1), (14, 2)],
  term ((-42789010599486 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1916578168020 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((21394505299743 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (15, 1)],
  term ((958289084010 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 2), (14, 1), (15, 1)],
  term ((466751362500 : Rat) / 45033486517) [(7, 1), (8, 1), (12, 2), (15, 1)],
  term ((-6583668128847 : Rat) / 90066973034) [(7, 1), (8, 1), (13, 1)],
  term ((4967187604560 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (14, 1)],
  term ((3232961048574 : Rat) / 45033486517) [(7, 1), (8, 1), (13, 1), (14, 2)],
  term ((-18633902424264 : Rat) / 45033486517) [(7, 1), (8, 1), (14, 1), (15, 1)],
  term ((73215900000 : Rat) / 45033486517) [(7, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((9316951212132 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1)],
  term ((622335150000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (13, 1), (14, 1)],
  term ((-311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (14, 1), (15, 1)],
  term ((155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (10, 1), (15, 1)],
  term ((233375681250 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1)],
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (12, 1)],
  term ((-622335150000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (12, 1), (14, 1)],
  term ((-622335150000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (14, 1)],
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (11, 1), (14, 2)],
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (12, 1), (14, 1), (15, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (12, 1), (15, 1)],
  term ((77791893750 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1)],
  term ((-311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (13, 1), (14, 2)],
  term ((311167575000 : Rat) / 45033486517) [(7, 1), (8, 2), (14, 1), (15, 1)],
  term ((-155583787500 : Rat) / 45033486517) [(7, 1), (8, 2), (15, 1)],
  term ((2047339045620 : Rat) / 45033486517) [(7, 1), (9, 1)],
  term ((19069706535219 : Rat) / 180133946068) [(7, 1), (9, 1), (10, 1)],
  term ((-2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((5695991849700 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (11, 1), (15, 1)],
  term ((-2900497167999 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 1), (12, 1)],
  term ((2900497167999 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (12, 1), (14, 1)],
  term ((326607707952 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((-163303853976 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-19069706535219 : Rat) / 90066973034) [(7, 1), (9, 1), (10, 1), (14, 1)],
  term ((79317225000 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (14, 1), (16, 1)],
  term ((-39658612500 : Rat) / 45033486517) [(7, 1), (9, 1), (10, 1), (16, 1)],
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (12, 1), (15, 1)],
  term ((1587301816401 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-3174603632802 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 2)],
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (14, 1), (15, 1)],
  term ((-1423997962425 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 1), (15, 1)],
  term ((4271993887275 : Rat) / 90066973034) [(7, 1), (9, 1), (11, 2)],
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (12, 1)],
  term ((-5695991849700 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (12, 1), (14, 1)],
  term ((-5695991849700 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (14, 1)],
  term ((2847995924850 : Rat) / 45033486517) [(7, 1), (9, 1), (11, 2), (14, 2)],
  term ((5961828101463 : Rat) / 180133946068) [(7, 1), (9, 1), (12, 1)],
  term ((-5961828101463 : Rat) / 90066973034) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 1), (16, 1)],
  term ((-2405984628465 : Rat) / 90066973034) [(7, 1), (9, 1), (12, 2)],
  term ((2405984628465 : Rat) / 45033486517) [(7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-6729550154109 : Rat) / 90066973034) [(7, 1), (9, 1), (14, 1)],
  term ((-36607950000 : Rat) / 45033486517) [(7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1459806028371 : Rat) / 45033486517) [(7, 1), (9, 1), (14, 2)],
  term ((18303975000 : Rat) / 45033486517) [(7, 1), (9, 1), (16, 1)],
  term ((-228985491894 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1)],
  term ((-652201892001 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (12, 1)],
  term ((1304403784002 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((11659739968296 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5829869984148 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((457970983788 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((-5829869984148 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (14, 1), (15, 2)],
  term ((-410136305154 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (14, 1), (16, 1)],
  term ((2914934992074 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (10, 1), (11, 1), (16, 1)],
  term ((-933502725000 : Rat) / 45033486517) [(7, 1), (10, 1), (12, 1), (13, 1)],
  term ((1867005450000 : Rat) / 45033486517) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((2400258477825 : Rat) / 45033486517) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2400258477825 : Rat) / 90066973034) [(7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-15654581887563 : Rat) / 180133946068) [(7, 1), (10, 1), (13, 1)],
  term ((15654581887563 : Rat) / 90066973034) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-159038119382616 : Rat) / 45033486517) [(7, 1), (10, 1), (13, 1), (14, 1), (15, 2)],
  term ((79519059691308 : Rat) / 45033486517) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((212234300337 : Rat) / 45033486517) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-410136305154 : Rat) / 45033486517) [(7, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-212234300337 : Rat) / 90066973034) [(7, 1), (10, 1), (15, 1)],
  term ((205068152577 : Rat) / 45033486517) [(7, 1), (10, 1), (15, 1), (16, 1)],
  term ((1100127457650 : Rat) / 45033486517) [(7, 1), (11, 1)],
  term ((8503455411657 : Rat) / 90066973034) [(7, 1), (11, 1), (12, 1)],
  term ((-17521587337563 : Rat) / 90066973034) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((514676514249 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((933502725000 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 2)],
  term ((-1867005450000 : Rat) / 45033486517) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((153208249398468 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-38302062349617 : Rat) / 45033486517) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1365404017113 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 1)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-1669701796374 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 2)],
  term ((410136305154 : Rat) / 45033486517) [(7, 1), (11, 1), (14, 2), (16, 1)],
  term ((-2914934992074 : Rat) / 45033486517) [(7, 1), (11, 1), (15, 2)],
  term ((-205068152577 : Rat) / 90066973034) [(7, 1), (11, 1), (16, 1)],
  term ((-11659739968296 : Rat) / 45033486517) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-11659739968296 : Rat) / 45033486517) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((5829869984148 : Rat) / 45033486517) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((4372402488111 : Rat) / 45033486517) [(7, 1), (11, 2), (15, 1)],
  term ((-267619708935 : Rat) / 90066973034) [(7, 1), (12, 1), (13, 1)],
  term ((500995390185 : Rat) / 45033486517) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-466751362500 : Rat) / 45033486517) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((9435590178921 : Rat) / 90066973034) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9435590178921 : Rat) / 180133946068) [(7, 1), (12, 1), (15, 1)],
  term ((-3253022858754 : Rat) / 45033486517) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((1626511429377 : Rat) / 45033486517) [(7, 1), (12, 2), (15, 1)],
  term ((21981551571891 : Rat) / 360267892136) [(7, 1), (13, 1)],
  term ((-7943217948783 : Rat) / 90066973034) [(7, 1), (13, 1), (14, 1)],
  term ((-6095115674325 : Rat) / 90066973034) [(7, 1), (13, 1), (14, 2)],
  term ((-462493732896 : Rat) / 45033486517) [(7, 1), (14, 1), (15, 1)],
  term ((231246866448 : Rat) / 45033486517) [(7, 1), (15, 1)],
  term ((-936911013165 : Rat) / 180133946068) [(7, 2)],
  term ((-118892288232 : Rat) / 45033486517) [(7, 2), (8, 1)],
  term ((-13727981250000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((6863990625000 : Rat) / 45033486517) [(7, 2), (8, 1), (10, 1), (13, 1), (15, 1)],
  term ((-3431995312500 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1)],
  term ((13727981250000 : Rat) / 45033486517) [(7, 2), (8, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1220635889154 : Rat) / 45033486517) [(7, 2), (8, 1), (12, 1)],
  term ((2441271778308 : Rat) / 45033486517) [(7, 2), (8, 1), (12, 1), (14, 1)],
  term ((-73215900000 : Rat) / 45033486517) [(7, 2), (8, 1), (12, 1), (14, 1), (16, 1)],
  term ((36607950000 : Rat) / 45033486517) [(7, 2), (8, 1), (12, 1), (16, 1)],
  term ((237784576464 : Rat) / 45033486517) [(7, 2), (8, 1), (14, 1)],
  term ((30446504325 : Rat) / 180133946068) [(7, 2), (10, 1)],
  term ((-60893008650 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (13, 1)],
  term ((121786017300 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (13, 1), (14, 1)],
  term ((-60893008650 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (14, 1), (15, 1)],
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (11, 1), (15, 1)],
  term ((-30446504325 : Rat) / 90066973034) [(7, 2), (10, 1), (12, 1)],
  term ((30446504325 : Rat) / 45033486517) [(7, 2), (10, 1), (12, 1), (14, 1)],
  term ((-1057909264920 : Rat) / 45033486517) [(7, 2), (10, 1), (13, 1), (14, 1), (15, 1)],
  term ((528954632460 : Rat) / 45033486517) [(7, 2), (10, 1), (13, 1), (15, 1)],
  term ((-30446504325 : Rat) / 90066973034) [(7, 2), (10, 1), (14, 1)],
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((-498508128135 : Rat) / 90066973034) [(7, 2), (11, 1), (13, 1)],
  term ((997016256270 : Rat) / 45033486517) [(7, 2), (11, 1), (13, 1), (14, 2)],
  term ((60893008650 : Rat) / 45033486517) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((-30446504325 : Rat) / 45033486517) [(7, 2), (11, 1), (15, 1)],
  term ((91339512975 : Rat) / 90066973034) [(7, 2), (11, 2)],
  term ((-91339512975 : Rat) / 45033486517) [(7, 2), (11, 2), (14, 1)],
  term ((936911013165 : Rat) / 90066973034) [(7, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 700 through 799. -/
theorem ep_Q2_054_block_27_0700_0799_valid :
    checkProductSumEq ep_Q2_054_partials_27_0700_0799
      ep_Q2_054_block_27_0700_0799 = true := by
  native_decide

end EpQ2054TermShards

end Patterns

end EndpointCertificate

end Problem97
