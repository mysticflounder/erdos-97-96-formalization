/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 12:0-99

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 12 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_12_0000_0099 : Poly :=
[
  term (2 : Rat) [(4, 1), (6, 1)],
  term (2 : Rat) [(5, 1), (7, 1)],
  term (-1 : Rat) [(6, 2)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0000 : Poly :=
[
  term ((107191047848535000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (11, 1), (16, 1)]
]

/-- Partial product 0 for generator 12. -/
def ep_Q2_008_partial_12_0000 : Poly :=
[
  term ((214382095697070000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((214382095697070000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 12. -/
theorem ep_Q2_008_partial_12_0000_valid :
    mulPoly ep_Q2_008_coefficient_12_0000
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0001 : Poly :=
[
  term ((-33776457858975819290561652049575783759000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 12. -/
def ep_Q2_008_partial_12_0001 : Poly :=
[
  term ((-67552915717951638581123304099151567518000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-67552915717951638581123304099151567518000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((33776457858975819290561652049575783759000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((33776457858975819290561652049575783759000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 12. -/
theorem ep_Q2_008_partial_12_0001_valid :
    mulPoly ep_Q2_008_coefficient_12_0001
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0002 : Poly :=
[
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 12. -/
def ep_Q2_008_partial_12_0002 : Poly :=
[
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 12. -/
theorem ep_Q2_008_partial_12_0002_valid :
    mulPoly ep_Q2_008_coefficient_12_0002
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0003 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 12. -/
def ep_Q2_008_partial_12_0003 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (6, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 3), (13, 3), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 2), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 12. -/
theorem ep_Q2_008_partial_12_0003_valid :
    mulPoly ep_Q2_008_coefficient_12_0003
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0004 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 4 for generator 12. -/
def ep_Q2_008_partial_12_0004 : Poly :=
[
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (5, 2), (7, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 12. -/
theorem ep_Q2_008_partial_12_0004_valid :
    mulPoly ep_Q2_008_coefficient_12_0004
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0005 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (13, 3), (16, 1)]
]

/-- Partial product 5 for generator 12. -/
def ep_Q2_008_partial_12_0005 : Poly :=
[
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (4, 1), (5, 1), (6, 1), (13, 3), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (6, 2), (13, 3), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 2), (13, 3), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 2), (7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 12. -/
theorem ep_Q2_008_partial_12_0005_valid :
    mulPoly ep_Q2_008_coefficient_12_0005
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0006 : Poly :=
[
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 12. -/
def ep_Q2_008_partial_12_0006 : Poly :=
[
  term ((20859331816493476290388167809242783320000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((20859331816493476290388167809242783320000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 12. -/
theorem ep_Q2_008_partial_12_0006_valid :
    mulPoly ep_Q2_008_coefficient_12_0006
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0007 : Poly :=
[
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 12. -/
def ep_Q2_008_partial_12_0007 : Poly :=
[
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 12. -/
theorem ep_Q2_008_partial_12_0007_valid :
    mulPoly ep_Q2_008_coefficient_12_0007
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0008 : Poly :=
[
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 1), (16, 1)]
]

/-- Partial product 8 for generator 12. -/
def ep_Q2_008_partial_12_0008 : Poly :=
[
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (6, 2), (7, 1), (13, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 12. -/
theorem ep_Q2_008_partial_12_0008_valid :
    mulPoly ep_Q2_008_coefficient_12_0008
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0009 : Poly :=
[
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 12. -/
def ep_Q2_008_partial_12_0009 : Poly :=
[
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 12. -/
theorem ep_Q2_008_partial_12_0009_valid :
    mulPoly ep_Q2_008_coefficient_12_0009
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0010 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 1), (13, 3), (16, 1)]
]

/-- Partial product 10 for generator 12. -/
def ep_Q2_008_partial_12_0010 : Poly :=
[
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 3), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 2), (13, 3), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (6, 2), (7, 1), (13, 3), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 12. -/
theorem ep_Q2_008_partial_12_0010_valid :
    mulPoly ep_Q2_008_coefficient_12_0010
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0011 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 11 for generator 12. -/
def ep_Q2_008_partial_12_0011 : Poly :=
[
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (6, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 12. -/
theorem ep_Q2_008_partial_12_0011_valid :
    mulPoly ep_Q2_008_coefficient_12_0011
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0012 : Poly :=
[
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 12 for generator 12. -/
def ep_Q2_008_partial_12_0012 : Poly :=
[
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (6, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 4), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 12. -/
theorem ep_Q2_008_partial_12_0012_valid :
    mulPoly ep_Q2_008_coefficient_12_0012
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0013 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 12. -/
def ep_Q2_008_partial_12_0013 : Poly :=
[
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 3), (13, 3), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (6, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 4), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 12. -/
theorem ep_Q2_008_partial_12_0013_valid :
    mulPoly ep_Q2_008_coefficient_12_0013
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0014 : Poly :=
[
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (10, 1), (13, 2), (16, 1)]
]

/-- Partial product 14 for generator 12. -/
def ep_Q2_008_partial_12_0014 : Poly :=
[
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (4, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (6, 2), (10, 1), (13, 2), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (7, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 12. -/
theorem ep_Q2_008_partial_12_0014_valid :
    mulPoly ep_Q2_008_coefficient_12_0014
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0015 : Poly :=
[
  term ((-3734882957533134375 : Rat) / 1385912907228352718) [(0, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 15 for generator 12. -/
def ep_Q2_008_partial_12_0015 : Poly :=
[
  term ((-3734882957533134375 : Rat) / 692956453614176359) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-3734882957533134375 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((3734882957533134375 : Rat) / 1385912907228352718) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((3734882957533134375 : Rat) / 1385912907228352718) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 12. -/
theorem ep_Q2_008_partial_12_0015_valid :
    mulPoly ep_Q2_008_coefficient_12_0015
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0016 : Poly :=
[
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 16 for generator 12. -/
def ep_Q2_008_partial_12_0016 : Poly :=
[
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 12. -/
theorem ep_Q2_008_partial_12_0016_valid :
    mulPoly ep_Q2_008_coefficient_12_0016
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0017 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (11, 1), (13, 3), (16, 1)]
]

/-- Partial product 17 for generator 12. -/
def ep_Q2_008_partial_12_0017 : Poly :=
[
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 3), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (6, 2), (11, 1), (13, 3), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (7, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 12. -/
theorem ep_Q2_008_partial_12_0017_valid :
    mulPoly ep_Q2_008_coefficient_12_0017
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0018 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (11, 1), (13, 4), (15, 1), (16, 1)]
]

/-- Partial product 18 for generator 12. -/
def ep_Q2_008_partial_12_0018 : Poly :=
[
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (6, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (11, 1), (13, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 12. -/
theorem ep_Q2_008_partial_12_0018_valid :
    mulPoly ep_Q2_008_coefficient_12_0018
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0019 : Poly :=
[
  term ((-4052459799516765205351163155922718194475 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 12. -/
def ep_Q2_008_partial_12_0019 : Poly :=
[
  term ((-8104919599033530410702326311845436388950 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8104919599033530410702326311845436388950 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((4052459799516765205351163155922718194475 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((4052459799516765205351163155922718194475 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 12. -/
theorem ep_Q2_008_partial_12_0019_valid :
    mulPoly ep_Q2_008_coefficient_12_0019
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0020 : Poly :=
[
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 20 for generator 12. -/
def ep_Q2_008_partial_12_0020 : Poly :=
[
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 2), (13, 2), (15, 2), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 12. -/
theorem ep_Q2_008_partial_12_0020_valid :
    mulPoly ep_Q2_008_coefficient_12_0020
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0021 : Poly :=
[
  term ((16187968423977146460 : Rat) / 692956453614176359) [(0, 1), (13, 2), (16, 1)]
]

/-- Partial product 21 for generator 12. -/
def ep_Q2_008_partial_12_0021 : Poly :=
[
  term ((32375936847954292920 : Rat) / 692956453614176359) [(0, 1), (4, 1), (6, 1), (13, 2), (16, 1)],
  term ((32375936847954292920 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-16187968423977146460 : Rat) / 692956453614176359) [(0, 1), (6, 2), (13, 2), (16, 1)],
  term ((-16187968423977146460 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 12. -/
theorem ep_Q2_008_partial_12_0021_valid :
    mulPoly ep_Q2_008_coefficient_12_0021
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0022 : Poly :=
[
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 22 for generator 12. -/
def ep_Q2_008_partial_12_0022 : Poly :=
[
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 2), (13, 3), (15, 1), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 12. -/
theorem ep_Q2_008_partial_12_0022_valid :
    mulPoly ep_Q2_008_coefficient_12_0022
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0023 : Poly :=
[
  term ((385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (16, 1)]
]

/-- Partial product 23 for generator 12. -/
def ep_Q2_008_partial_12_0023 : Poly :=
[
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (6, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 12. -/
theorem ep_Q2_008_partial_12_0023_valid :
    mulPoly ep_Q2_008_coefficient_12_0023
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0024 : Poly :=
[
  term ((-10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 12. -/
def ep_Q2_008_partial_12_0024 : Poly :=
[
  term ((-20859331816493476290388167809242783320000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-20859331816493476290388167809242783320000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 2), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 12. -/
theorem ep_Q2_008_partial_12_0024_valid :
    mulPoly ep_Q2_008_coefficient_12_0024
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0025 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 12. -/
def ep_Q2_008_partial_12_0025 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 2), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 12. -/
theorem ep_Q2_008_partial_12_0025_valid :
    mulPoly ep_Q2_008_coefficient_12_0025
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0026 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 26 for generator 12. -/
def ep_Q2_008_partial_12_0026 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 2), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 12. -/
theorem ep_Q2_008_partial_12_0026_valid :
    mulPoly ep_Q2_008_coefficient_12_0026
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0027 : Poly :=
[
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 27 for generator 12. -/
def ep_Q2_008_partial_12_0027 : Poly :=
[
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (4, 1), (5, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 2), (12, 1), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 2), (7, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 12. -/
theorem ep_Q2_008_partial_12_0027_valid :
    mulPoly ep_Q2_008_coefficient_12_0027
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0028 : Poly :=
[
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (12, 1), (16, 1)]
]

/-- Partial product 28 for generator 12. -/
def ep_Q2_008_partial_12_0028 : Poly :=
[
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (4, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 2), (12, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (7, 2), (12, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (5, 2), (7, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 12. -/
theorem ep_Q2_008_partial_12_0028_valid :
    mulPoly ep_Q2_008_coefficient_12_0028
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0029 : Poly :=
[
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 29 for generator 12. -/
def ep_Q2_008_partial_12_0029 : Poly :=
[
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 3), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 12. -/
theorem ep_Q2_008_partial_12_0029_valid :
    mulPoly ep_Q2_008_coefficient_12_0029
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0030 : Poly :=
[
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 30 for generator 12. -/
def ep_Q2_008_partial_12_0030 : Poly :=
[
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 3), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 12. -/
theorem ep_Q2_008_partial_12_0030_valid :
    mulPoly ep_Q2_008_coefficient_12_0030
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0031 : Poly :=
[
  term ((1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 31 for generator 12. -/
def ep_Q2_008_partial_12_0031 : Poly :=
[
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 2), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 3), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 12. -/
theorem ep_Q2_008_partial_12_0031_valid :
    mulPoly ep_Q2_008_coefficient_12_0031
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0032 : Poly :=
[
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 12. -/
def ep_Q2_008_partial_12_0032 : Poly :=
[
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 2), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 3), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 12. -/
theorem ep_Q2_008_partial_12_0032_valid :
    mulPoly ep_Q2_008_coefficient_12_0032
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0033 : Poly :=
[
  term ((4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (7, 1), (12, 1), (16, 1)]
]

/-- Partial product 33 for generator 12. -/
def ep_Q2_008_partial_12_0033 : Poly :=
[
  term ((9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 2), (12, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (7, 3), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 12. -/
theorem ep_Q2_008_partial_12_0033_valid :
    mulPoly ep_Q2_008_coefficient_12_0033
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0034 : Poly :=
[
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 34 for generator 12. -/
def ep_Q2_008_partial_12_0034 : Poly :=
[
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 2), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 4), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 12. -/
theorem ep_Q2_008_partial_12_0034_valid :
    mulPoly ep_Q2_008_coefficient_12_0034
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0035 : Poly :=
[
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 35 for generator 12. -/
def ep_Q2_008_partial_12_0035 : Poly :=
[
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 2), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 4), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 12. -/
theorem ep_Q2_008_partial_12_0035_valid :
    mulPoly ep_Q2_008_coefficient_12_0035
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0036 : Poly :=
[
  term ((6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 36 for generator 12. -/
def ep_Q2_008_partial_12_0036 : Poly :=
[
  term ((13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (7, 2), (10, 1), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 12. -/
theorem ep_Q2_008_partial_12_0036_valid :
    mulPoly ep_Q2_008_coefficient_12_0036
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0037 : Poly :=
[
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 12. -/
def ep_Q2_008_partial_12_0037 : Poly :=
[
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 12. -/
theorem ep_Q2_008_partial_12_0037_valid :
    mulPoly ep_Q2_008_coefficient_12_0037
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0038 : Poly :=
[
  term ((14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (11, 1), (12, 1), (13, 2), (16, 1)]
]

/-- Partial product 38 for generator 12. -/
def ep_Q2_008_partial_12_0038 : Poly :=
[
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (7, 2), (11, 1), (12, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 12. -/
theorem ep_Q2_008_partial_12_0038_valid :
    mulPoly ep_Q2_008_coefficient_12_0038
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0039 : Poly :=
[
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 39 for generator 12. -/
def ep_Q2_008_partial_12_0039 : Poly :=
[
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 12. -/
theorem ep_Q2_008_partial_12_0039_valid :
    mulPoly ep_Q2_008_coefficient_12_0039
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0040 : Poly :=
[
  term ((3734882957533134375 : Rat) / 1385912907228352718) [(1, 1), (11, 1), (12, 1), (16, 1)]
]

/-- Partial product 40 for generator 12. -/
def ep_Q2_008_partial_12_0040 : Poly :=
[
  term ((3734882957533134375 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((3734882957533134375 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((-3734882957533134375 : Rat) / 1385912907228352718) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-3734882957533134375 : Rat) / 1385912907228352718) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 12. -/
theorem ep_Q2_008_partial_12_0040_valid :
    mulPoly ep_Q2_008_coefficient_12_0040
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0041 : Poly :=
[
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 41 for generator 12. -/
def ep_Q2_008_partial_12_0041 : Poly :=
[
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 12. -/
theorem ep_Q2_008_partial_12_0041_valid :
    mulPoly ep_Q2_008_coefficient_12_0041
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0042 : Poly :=
[
  term ((-16187968423977146460 : Rat) / 692956453614176359) [(1, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 42 for generator 12. -/
def ep_Q2_008_partial_12_0042 : Poly :=
[
  term ((-32375936847954292920 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((-32375936847954292920 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((16187968423977146460 : Rat) / 692956453614176359) [(1, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((16187968423977146460 : Rat) / 692956453614176359) [(1, 1), (7, 2), (12, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 12. -/
theorem ep_Q2_008_partial_12_0042_valid :
    mulPoly ep_Q2_008_coefficient_12_0042
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0043 : Poly :=
[
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 43 for generator 12. -/
def ep_Q2_008_partial_12_0043 : Poly :=
[
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 12. -/
theorem ep_Q2_008_partial_12_0043_valid :
    mulPoly ep_Q2_008_coefficient_12_0043
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0044 : Poly :=
[
  term ((4251632595152520147918759690999115250475 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 44 for generator 12. -/
def ep_Q2_008_partial_12_0044 : Poly :=
[
  term ((8503265190305040295837519381998230500950 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((8503265190305040295837519381998230500950 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4251632595152520147918759690999115250475 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-4251632595152520147918759690999115250475 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 12. -/
theorem ep_Q2_008_partial_12_0044_valid :
    mulPoly ep_Q2_008_coefficient_12_0044
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0045 : Poly :=
[
  term ((257258514836484000 : Rat) / 692956453614176359) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 12. -/
def ep_Q2_008_partial_12_0045 : Poly :=
[
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 12. -/
theorem ep_Q2_008_partial_12_0045_valid :
    mulPoly ep_Q2_008_coefficient_12_0045
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0046 : Poly :=
[
  term ((5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 12. -/
def ep_Q2_008_partial_12_0046 : Poly :=
[
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 12. -/
theorem ep_Q2_008_partial_12_0046_valid :
    mulPoly ep_Q2_008_coefficient_12_0046
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0047 : Poly :=
[
  term ((-23820232855230000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (11, 1), (16, 1)]
]

/-- Partial product 47 for generator 12. -/
def ep_Q2_008_partial_12_0047 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(3, 1), (4, 2), (6, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 12. -/
theorem ep_Q2_008_partial_12_0047_valid :
    mulPoly ep_Q2_008_coefficient_12_0047
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0048 : Poly :=
[
  term ((199241833525243875 : Rat) / 692956453614176359) [(3, 1), (4, 1), (13, 1), (16, 1)]
]

/-- Partial product 48 for generator 12. -/
def ep_Q2_008_partial_12_0048 : Poly :=
[
  term ((398483667050487750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(3, 1), (4, 2), (6, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 12. -/
theorem ep_Q2_008_partial_12_0048_valid :
    mulPoly ep_Q2_008_coefficient_12_0048
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0049 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 49 for generator 12. -/
def ep_Q2_008_partial_12_0049 : Poly :=
[
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (6, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 12. -/
theorem ep_Q2_008_partial_12_0049_valid :
    mulPoly ep_Q2_008_coefficient_12_0049
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0050 : Poly :=
[
  term ((4785470462664994565303141540132080832400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 12. -/
def ep_Q2_008_partial_12_0050 : Poly :=
[
  term ((9570940925329989130606283080264161664800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-4785470462664994565303141540132080832400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((-4785470462664994565303141540132080832400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((9570940925329989130606283080264161664800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (6, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 12. -/
theorem ep_Q2_008_partial_12_0050_valid :
    mulPoly ep_Q2_008_coefficient_12_0050
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0051 : Poly :=
[
  term ((193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 51 for generator 12. -/
def ep_Q2_008_partial_12_0051 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 12. -/
theorem ep_Q2_008_partial_12_0051_valid :
    mulPoly ep_Q2_008_coefficient_12_0051
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0052 : Poly :=
[
  term ((-9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 52 for generator 12. -/
def ep_Q2_008_partial_12_0052 : Poly :=
[
  term ((-18982625112633358778440170737088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 3), (15, 1), (16, 1)],
  term ((-18982625112633358778440170737088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 12. -/
theorem ep_Q2_008_partial_12_0052_valid :
    mulPoly ep_Q2_008_coefficient_12_0052
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0053 : Poly :=
[
  term ((32291916775513583922 : Rat) / 692956453614176359) [(3, 1), (5, 1), (13, 2), (16, 1)]
]

/-- Partial product 53 for generator 12. -/
def ep_Q2_008_partial_12_0053 : Poly :=
[
  term ((64583833551027167844 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 2), (13, 2), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 2), (13, 2), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(3, 1), (5, 2), (7, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 12. -/
theorem ep_Q2_008_partial_12_0053_valid :
    mulPoly ep_Q2_008_coefficient_12_0053
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0054 : Poly :=
[
  term ((-66925080449200531695 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (16, 1)]
]

/-- Partial product 54 for generator 12. -/
def ep_Q2_008_partial_12_0054 : Poly :=
[
  term ((-66925080449200531695 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((66925080449200531695 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((66925080449200531695 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-66925080449200531695 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (7, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 12. -/
theorem ep_Q2_008_partial_12_0054_valid :
    mulPoly ep_Q2_008_coefficient_12_0054
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0055 : Poly :=
[
  term ((-53595523924267500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 55 for generator 12. -/
def ep_Q2_008_partial_12_0055 : Poly :=
[
  term ((-107191047848535000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 2), (11, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(3, 1), (6, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 12. -/
theorem ep_Q2_008_partial_12_0055_valid :
    mulPoly ep_Q2_008_coefficient_12_0055
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0056 : Poly :=
[
  term ((17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 56 for generator 12. -/
def ep_Q2_008_partial_12_0056 : Poly :=
[
  term ((34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 12. -/
theorem ep_Q2_008_partial_12_0056_valid :
    mulPoly ep_Q2_008_coefficient_12_0056
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0057 : Poly :=
[
  term ((-157397599892251599871233082361688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 57 for generator 12. -/
def ep_Q2_008_partial_12_0057 : Poly :=
[
  term ((-314795199784503199742466164723376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-314795199784503199742466164723376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((157397599892251599871233082361688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((157397599892251599871233082361688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 12. -/
theorem ep_Q2_008_partial_12_0057_valid :
    mulPoly ep_Q2_008_coefficient_12_0057
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0058 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 1385912907228352718) [(3, 1), (7, 1), (13, 2), (16, 1)]
]

/-- Partial product 58 for generator 12. -/
def ep_Q2_008_partial_12_0058 : Poly :=
[
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 2), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(3, 1), (6, 2), (7, 1), (13, 2), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(3, 1), (7, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 12. -/
theorem ep_Q2_008_partial_12_0058_valid :
    mulPoly ep_Q2_008_coefficient_12_0058
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0059 : Poly :=
[
  term ((-11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 12. -/
def ep_Q2_008_partial_12_0059 : Poly :=
[
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 12. -/
theorem ep_Q2_008_partial_12_0059_valid :
    mulPoly ep_Q2_008_coefficient_12_0059
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0060 : Poly :=
[
  term ((1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (7, 1), (16, 1)]
]

/-- Partial product 60 for generator 12. -/
def ep_Q2_008_partial_12_0060 : Poly :=
[
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (7, 1), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 12. -/
theorem ep_Q2_008_partial_12_0060_valid :
    mulPoly ep_Q2_008_coefficient_12_0060
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0061 : Poly :=
[
  term ((-304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 61 for generator 12. -/
def ep_Q2_008_partial_12_0061 : Poly :=
[
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 4), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 12. -/
theorem ep_Q2_008_partial_12_0061_valid :
    mulPoly ep_Q2_008_coefficient_12_0061
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0062 : Poly :=
[
  term ((4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

/-- Partial product 62 for generator 12. -/
def ep_Q2_008_partial_12_0062 : Poly :=
[
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 3), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 2), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 4), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 12. -/
theorem ep_Q2_008_partial_12_0062_valid :
    mulPoly ep_Q2_008_coefficient_12_0062
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0063 : Poly :=
[
  term ((-39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 63 for generator 12. -/
def ep_Q2_008_partial_12_0063 : Poly :=
[
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 12. -/
theorem ep_Q2_008_partial_12_0063_valid :
    mulPoly ep_Q2_008_coefficient_12_0063
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0064 : Poly :=
[
  term ((70324786932212700 : Rat) / 692956453614176359) [(3, 1), (9, 1), (16, 1)]
]

/-- Partial product 64 for generator 12. -/
def ep_Q2_008_partial_12_0064 : Poly :=
[
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (7, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 12. -/
theorem ep_Q2_008_partial_12_0064_valid :
    mulPoly ep_Q2_008_coefficient_12_0064
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0065 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 65 for generator 12. -/
def ep_Q2_008_partial_12_0065 : Poly :=
[
  term ((-95280931420920000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 12. -/
theorem ep_Q2_008_partial_12_0065_valid :
    mulPoly ep_Q2_008_coefficient_12_0065
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0066 : Poly :=
[
  term ((179148722135805069729799393242680256000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 66 for generator 12. -/
def ep_Q2_008_partial_12_0066 : Poly :=
[
  term ((358297444271610139459598786485360512000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((358297444271610139459598786485360512000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-179148722135805069729799393242680256000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-179148722135805069729799393242680256000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 12. -/
theorem ep_Q2_008_partial_12_0066_valid :
    mulPoly ep_Q2_008_coefficient_12_0066
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0067 : Poly :=
[
  term ((-1929438861273630000 : Rat) / 692956453614176359) [(3, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 67 for generator 12. -/
def ep_Q2_008_partial_12_0067 : Poly :=
[
  term ((-3858877722547260000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-3858877722547260000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((1929438861273630000 : Rat) / 692956453614176359) [(3, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((1929438861273630000 : Rat) / 692956453614176359) [(3, 1), (7, 2), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 12. -/
theorem ep_Q2_008_partial_12_0067_valid :
    mulPoly ep_Q2_008_coefficient_12_0067
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0068 : Poly :=
[
  term ((-41019583372568435225665280457310267554975 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 68 for generator 12. -/
def ep_Q2_008_partial_12_0068 : Poly :=
[
  term ((-82039166745136870451330560914620535109950 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-82039166745136870451330560914620535109950 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((41019583372568435225665280457310267554975 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((41019583372568435225665280457310267554975 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 12. -/
theorem ep_Q2_008_partial_12_0068_valid :
    mulPoly ep_Q2_008_coefficient_12_0068
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0069 : Poly :=
[
  term ((-294243709198519874134306505033093001600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 69 for generator 12. -/
def ep_Q2_008_partial_12_0069 : Poly :=
[
  term ((-588487418397039748268613010066186003200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-588487418397039748268613010066186003200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((294243709198519874134306505033093001600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((294243709198519874134306505033093001600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 12. -/
theorem ep_Q2_008_partial_12_0069_valid :
    mulPoly ep_Q2_008_coefficient_12_0069
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0070 : Poly :=
[
  term ((-7146830570608836000 : Rat) / 692956453614176359) [(3, 1), (11, 1), (13, 2), (16, 1)]
]

/-- Partial product 70 for generator 12. -/
def ep_Q2_008_partial_12_0070 : Poly :=
[
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(3, 1), (6, 2), (11, 1), (13, 2), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(3, 1), (7, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 12. -/
theorem ep_Q2_008_partial_12_0070_valid :
    mulPoly ep_Q2_008_coefficient_12_0070
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0071 : Poly :=
[
  term ((-591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 71 for generator 12. -/
def ep_Q2_008_partial_12_0071 : Poly :=
[
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 12. -/
theorem ep_Q2_008_partial_12_0071_valid :
    mulPoly ep_Q2_008_coefficient_12_0071
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0072 : Poly :=
[
  term ((823892116398062625 : Rat) / 2771825814456705436) [(3, 1), (11, 1), (16, 1)]
]

/-- Partial product 72 for generator 12. -/
def ep_Q2_008_partial_12_0072 : Poly :=
[
  term ((823892116398062625 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((823892116398062625 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-823892116398062625 : Rat) / 2771825814456705436) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((-823892116398062625 : Rat) / 2771825814456705436) [(3, 1), (7, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 12. -/
theorem ep_Q2_008_partial_12_0072_valid :
    mulPoly ep_Q2_008_coefficient_12_0072
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0073 : Poly :=
[
  term ((-22532564248860967608146705379132840228600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 73 for generator 12. -/
def ep_Q2_008_partial_12_0073 : Poly :=
[
  term ((-45065128497721935216293410758265680457200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-45065128497721935216293410758265680457200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((22532564248860967608146705379132840228600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((22532564248860967608146705379132840228600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 12. -/
theorem ep_Q2_008_partial_12_0073_valid :
    mulPoly ep_Q2_008_coefficient_12_0073
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0074 : Poly :=
[
  term ((-263837208963640193602068197321038195200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 74 for generator 12. -/
def ep_Q2_008_partial_12_0074 : Poly :=
[
  term ((-527674417927280387204136394642076390400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((-527674417927280387204136394642076390400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((263837208963640193602068197321038195200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((263837208963640193602068197321038195200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 12. -/
theorem ep_Q2_008_partial_12_0074_valid :
    mulPoly ep_Q2_008_coefficient_12_0074
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0075 : Poly :=
[
  term ((29570310589067078787 : Rat) / 5543651628913410872) [(3, 1), (13, 1), (16, 1)]
]

/-- Partial product 75 for generator 12. -/
def ep_Q2_008_partial_12_0075 : Poly :=
[
  term ((29570310589067078787 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((29570310589067078787 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-29570310589067078787 : Rat) / 5543651628913410872) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((-29570310589067078787 : Rat) / 5543651628913410872) [(3, 1), (7, 2), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 12. -/
theorem ep_Q2_008_partial_12_0075_valid :
    mulPoly ep_Q2_008_coefficient_12_0075
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0076 : Poly :=
[
  term ((-7307115283310442031487756392402192012800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 76 for generator 12. -/
def ep_Q2_008_partial_12_0076 : Poly :=
[
  term ((-14614230566620884062975512784804384025600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((-14614230566620884062975512784804384025600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((7307115283310442031487756392402192012800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((7307115283310442031487756392402192012800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 12. -/
theorem ep_Q2_008_partial_12_0076_valid :
    mulPoly ep_Q2_008_coefficient_12_0076
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0077 : Poly :=
[
  term ((83913253488655551081823546348441147205325 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 77 for generator 12. -/
def ep_Q2_008_partial_12_0077 : Poly :=
[
  term ((167826506977311102163647092696882294410650 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((167826506977311102163647092696882294410650 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-83913253488655551081823546348441147205325 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-83913253488655551081823546348441147205325 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 12. -/
theorem ep_Q2_008_partial_12_0077_valid :
    mulPoly ep_Q2_008_coefficient_12_0077
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0078 : Poly :=
[
  term ((5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 1), (15, 1), (16, 1)]
]

/-- Partial product 78 for generator 12. -/
def ep_Q2_008_partial_12_0078 : Poly :=
[
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 3), (15, 1), (16, 1)],
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 12. -/
theorem ep_Q2_008_partial_12_0078_valid :
    mulPoly ep_Q2_008_coefficient_12_0078
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0079 : Poly :=
[
  term ((-3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 79 for generator 12. -/
def ep_Q2_008_partial_12_0079 : Poly :=
[
  term ((-6711189780963057975675238698337049856000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6711189780963057975675238698337049856000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 12. -/
theorem ep_Q2_008_partial_12_0079_valid :
    mulPoly ep_Q2_008_coefficient_12_0079
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0080 : Poly :=
[
  term ((-692576845212253500 : Rat) / 692956453614176359) [(4, 1), (10, 1), (16, 1)]
]

/-- Partial product 80 for generator 12. -/
def ep_Q2_008_partial_12_0080 : Poly :=
[
  term ((-1385153690424507000 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (6, 2), (10, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (7, 2), (10, 1), (16, 1)],
  term ((-1385153690424507000 : Rat) / 692956453614176359) [(4, 2), (6, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 12. -/
theorem ep_Q2_008_partial_12_0080_valid :
    mulPoly ep_Q2_008_coefficient_12_0080
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0081 : Poly :=
[
  term ((-199241833525243875 : Rat) / 692956453614176359) [(4, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 81 for generator 12. -/
def ep_Q2_008_partial_12_0081 : Poly :=
[
  term ((-398483667050487750 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 692956453614176359) [(4, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 692956453614176359) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-398483667050487750 : Rat) / 692956453614176359) [(4, 2), (6, 1), (11, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 12. -/
theorem ep_Q2_008_partial_12_0081_valid :
    mulPoly ep_Q2_008_coefficient_12_0081
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0082 : Poly :=
[
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 82 for generator 12. -/
def ep_Q2_008_partial_12_0082 : Poly :=
[
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 12. -/
theorem ep_Q2_008_partial_12_0082_valid :
    mulPoly ep_Q2_008_coefficient_12_0082
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0083 : Poly :=
[
  term ((427848448161865078194870330949611628800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 83 for generator 12. -/
def ep_Q2_008_partial_12_0083 : Poly :=
[
  term ((855696896323730156389740661899223257600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-427848448161865078194870330949611628800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-427848448161865078194870330949611628800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((855696896323730156389740661899223257600 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 12. -/
theorem ep_Q2_008_partial_12_0083_valid :
    mulPoly ep_Q2_008_coefficient_12_0083
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0084 : Poly :=
[
  term ((23820232855230000 : Rat) / 692956453614176359) [(4, 1), (11, 2), (16, 1)]
]

/-- Partial product 84 for generator 12. -/
def ep_Q2_008_partial_12_0084 : Poly :=
[
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(4, 1), (6, 2), (11, 2), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(4, 1), (7, 2), (11, 2), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 2), (6, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 12. -/
theorem ep_Q2_008_partial_12_0084_valid :
    mulPoly ep_Q2_008_coefficient_12_0084
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0085 : Poly :=
[
  term ((1676788083043091541186122953764926884800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 85 for generator 12. -/
def ep_Q2_008_partial_12_0085 : Poly :=
[
  term ((3353576166086183082372245907529853769600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1676788083043091541186122953764926884800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1676788083043091541186122953764926884800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((3353576166086183082372245907529853769600 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 12. -/
theorem ep_Q2_008_partial_12_0085_valid :
    mulPoly ep_Q2_008_coefficient_12_0085
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0086 : Poly :=
[
  term ((346288422606126750 : Rat) / 692956453614176359) [(4, 1), (16, 1)]
]

/-- Partial product 86 for generator 12. -/
def ep_Q2_008_partial_12_0086 : Poly :=
[
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(4, 1), (6, 2), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(4, 1), (7, 2), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 2), (6, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 12. -/
theorem ep_Q2_008_partial_12_0086_valid :
    mulPoly ep_Q2_008_coefficient_12_0086
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0087 : Poly :=
[
  term ((-5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 87 for generator 12. -/
def ep_Q2_008_partial_12_0087 : Poly :=
[
  term ((-10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 3), (15, 1), (16, 1)],
  term ((-10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (6, 1), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 12. -/
theorem ep_Q2_008_partial_12_0087_valid :
    mulPoly ep_Q2_008_coefficient_12_0087
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0088 : Poly :=
[
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 88 for generator 12. -/
def ep_Q2_008_partial_12_0088 : Poly :=
[
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 12. -/
theorem ep_Q2_008_partial_12_0088_valid :
    mulPoly ep_Q2_008_coefficient_12_0088
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0089 : Poly :=
[
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 89 for generator 12. -/
def ep_Q2_008_partial_12_0089 : Poly :=
[
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 12. -/
theorem ep_Q2_008_partial_12_0089_valid :
    mulPoly ep_Q2_008_coefficient_12_0089
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0090 : Poly :=
[
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 90 for generator 12. -/
def ep_Q2_008_partial_12_0090 : Poly :=
[
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 12. -/
theorem ep_Q2_008_partial_12_0090_valid :
    mulPoly ep_Q2_008_coefficient_12_0090
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0091 : Poly :=
[
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 91 for generator 12. -/
def ep_Q2_008_partial_12_0091 : Poly :=
[
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 12. -/
theorem ep_Q2_008_partial_12_0091_valid :
    mulPoly ep_Q2_008_coefficient_12_0091
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0092 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 92 for generator 12. -/
def ep_Q2_008_partial_12_0092 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 12. -/
theorem ep_Q2_008_partial_12_0092_valid :
    mulPoly ep_Q2_008_coefficient_12_0092
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0093 : Poly :=
[
  term ((47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 93 for generator 12. -/
def ep_Q2_008_partial_12_0093 : Poly :=
[
  term ((94913125563166793892200853685440000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((94913125563166793892200853685440000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 12. -/
theorem ep_Q2_008_partial_12_0093_valid :
    mulPoly ep_Q2_008_coefficient_12_0093
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0094 : Poly :=
[
  term ((-64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 2), (15, 2), (16, 1)]
]

/-- Partial product 94 for generator 12. -/
def ep_Q2_008_partial_12_0094 : Poly :=
[
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 12. -/
theorem ep_Q2_008_partial_12_0094_valid :
    mulPoly ep_Q2_008_coefficient_12_0094
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0095 : Poly :=
[
  term ((129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (13, 3), (15, 1), (16, 1)]
]

/-- Partial product 95 for generator 12. -/
def ep_Q2_008_partial_12_0095 : Poly :=
[
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 3), (15, 1), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 12. -/
theorem ep_Q2_008_partial_12_0095_valid :
    mulPoly ep_Q2_008_coefficient_12_0095
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0096 : Poly :=
[
  term ((-5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 1), (15, 2), (16, 1)]
]

/-- Partial product 96 for generator 12. -/
def ep_Q2_008_partial_12_0096 : Poly :=
[
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 12. -/
theorem ep_Q2_008_partial_12_0096_valid :
    mulPoly ep_Q2_008_coefficient_12_0096
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0097 : Poly :=
[
  term ((-23820232855230000 : Rat) / 692956453614176359) [(5, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 97 for generator 12. -/
def ep_Q2_008_partial_12_0097 : Poly :=
[
  term ((-47640465710460000 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(5, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(5, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(5, 2), (7, 1), (10, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 12. -/
theorem ep_Q2_008_partial_12_0097_valid :
    mulPoly ep_Q2_008_coefficient_12_0097
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0098 : Poly :=
[
  term ((27339124979056313157 : Rat) / 2771825814456705436) [(5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 98 for generator 12. -/
def ep_Q2_008_partial_12_0098 : Poly :=
[
  term ((27339124979056313157 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-27339124979056313157 : Rat) / 2771825814456705436) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-27339124979056313157 : Rat) / 2771825814456705436) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((27339124979056313157 : Rat) / 1385912907228352718) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 12. -/
theorem ep_Q2_008_partial_12_0098_valid :
    mulPoly ep_Q2_008_coefficient_12_0098
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 12. -/
def ep_Q2_008_coefficient_12_0099 : Poly :=
[
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

/-- Partial product 99 for generator 12. -/
def ep_Q2_008_partial_12_0099 : Poly :=
[
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 12. -/
theorem ep_Q2_008_partial_12_0099_valid :
    mulPoly ep_Q2_008_coefficient_12_0099
        ep_Q2_008_generator_12_0000_0099 =
      ep_Q2_008_partial_12_0099 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_12_0000_0099 : List Poly :=
[
  ep_Q2_008_partial_12_0000,
  ep_Q2_008_partial_12_0001,
  ep_Q2_008_partial_12_0002,
  ep_Q2_008_partial_12_0003,
  ep_Q2_008_partial_12_0004,
  ep_Q2_008_partial_12_0005,
  ep_Q2_008_partial_12_0006,
  ep_Q2_008_partial_12_0007,
  ep_Q2_008_partial_12_0008,
  ep_Q2_008_partial_12_0009,
  ep_Q2_008_partial_12_0010,
  ep_Q2_008_partial_12_0011,
  ep_Q2_008_partial_12_0012,
  ep_Q2_008_partial_12_0013,
  ep_Q2_008_partial_12_0014,
  ep_Q2_008_partial_12_0015,
  ep_Q2_008_partial_12_0016,
  ep_Q2_008_partial_12_0017,
  ep_Q2_008_partial_12_0018,
  ep_Q2_008_partial_12_0019,
  ep_Q2_008_partial_12_0020,
  ep_Q2_008_partial_12_0021,
  ep_Q2_008_partial_12_0022,
  ep_Q2_008_partial_12_0023,
  ep_Q2_008_partial_12_0024,
  ep_Q2_008_partial_12_0025,
  ep_Q2_008_partial_12_0026,
  ep_Q2_008_partial_12_0027,
  ep_Q2_008_partial_12_0028,
  ep_Q2_008_partial_12_0029,
  ep_Q2_008_partial_12_0030,
  ep_Q2_008_partial_12_0031,
  ep_Q2_008_partial_12_0032,
  ep_Q2_008_partial_12_0033,
  ep_Q2_008_partial_12_0034,
  ep_Q2_008_partial_12_0035,
  ep_Q2_008_partial_12_0036,
  ep_Q2_008_partial_12_0037,
  ep_Q2_008_partial_12_0038,
  ep_Q2_008_partial_12_0039,
  ep_Q2_008_partial_12_0040,
  ep_Q2_008_partial_12_0041,
  ep_Q2_008_partial_12_0042,
  ep_Q2_008_partial_12_0043,
  ep_Q2_008_partial_12_0044,
  ep_Q2_008_partial_12_0045,
  ep_Q2_008_partial_12_0046,
  ep_Q2_008_partial_12_0047,
  ep_Q2_008_partial_12_0048,
  ep_Q2_008_partial_12_0049,
  ep_Q2_008_partial_12_0050,
  ep_Q2_008_partial_12_0051,
  ep_Q2_008_partial_12_0052,
  ep_Q2_008_partial_12_0053,
  ep_Q2_008_partial_12_0054,
  ep_Q2_008_partial_12_0055,
  ep_Q2_008_partial_12_0056,
  ep_Q2_008_partial_12_0057,
  ep_Q2_008_partial_12_0058,
  ep_Q2_008_partial_12_0059,
  ep_Q2_008_partial_12_0060,
  ep_Q2_008_partial_12_0061,
  ep_Q2_008_partial_12_0062,
  ep_Q2_008_partial_12_0063,
  ep_Q2_008_partial_12_0064,
  ep_Q2_008_partial_12_0065,
  ep_Q2_008_partial_12_0066,
  ep_Q2_008_partial_12_0067,
  ep_Q2_008_partial_12_0068,
  ep_Q2_008_partial_12_0069,
  ep_Q2_008_partial_12_0070,
  ep_Q2_008_partial_12_0071,
  ep_Q2_008_partial_12_0072,
  ep_Q2_008_partial_12_0073,
  ep_Q2_008_partial_12_0074,
  ep_Q2_008_partial_12_0075,
  ep_Q2_008_partial_12_0076,
  ep_Q2_008_partial_12_0077,
  ep_Q2_008_partial_12_0078,
  ep_Q2_008_partial_12_0079,
  ep_Q2_008_partial_12_0080,
  ep_Q2_008_partial_12_0081,
  ep_Q2_008_partial_12_0082,
  ep_Q2_008_partial_12_0083,
  ep_Q2_008_partial_12_0084,
  ep_Q2_008_partial_12_0085,
  ep_Q2_008_partial_12_0086,
  ep_Q2_008_partial_12_0087,
  ep_Q2_008_partial_12_0088,
  ep_Q2_008_partial_12_0089,
  ep_Q2_008_partial_12_0090,
  ep_Q2_008_partial_12_0091,
  ep_Q2_008_partial_12_0092,
  ep_Q2_008_partial_12_0093,
  ep_Q2_008_partial_12_0094,
  ep_Q2_008_partial_12_0095,
  ep_Q2_008_partial_12_0096,
  ep_Q2_008_partial_12_0097,
  ep_Q2_008_partial_12_0098,
  ep_Q2_008_partial_12_0099
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_12_0000_0099 : Poly :=
[
  term ((214382095697070000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-67552915717951638581123304099151567518000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((214382095697070000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-67552915717951638581123304099151567518000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (6, 2), (11, 1), (16, 1)],
  term ((33776457858975819290561652049575783759000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (6, 2), (15, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(0, 1), (3, 1), (7, 2), (11, 1), (16, 1)],
  term ((33776457858975819290561652049575783759000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (3, 1), (7, 2), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (4, 1), (5, 1), (6, 1), (13, 3), (16, 1)],
  term ((20859331816493476290388167809242783320000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-9249340331398466862 : Rat) / 692956453614176359) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2189633911586289738 : Rat) / 692956453614176359) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 3), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (6, 1), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((-86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (6, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (4, 1), (6, 1), (10, 1), (13, 2), (16, 1)],
  term ((-3734882957533134375 : Rat) / 692956453614176359) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 3), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (4, 1), (6, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-8104919599033530410702326311845436388950 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (6, 1), (13, 2), (15, 2), (16, 1)],
  term ((32375936847954292920 : Rat) / 692956453614176359) [(0, 1), (4, 1), (6, 1), (13, 2), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (6, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((26542157644955337657 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-64583833551027167844 : Rat) / 692956453614176359) [(0, 1), (5, 1), (6, 2), (13, 3), (16, 1)],
  term ((-10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-13891959801170136000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-3734882957533134375 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28587322282435344000 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 3), (16, 1)],
  term ((-2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((-8104919599033530410702326311845436388950 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((32375936847954292920 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((-23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-10455203680638529791 : Rat) / 2771825814456705436) [(0, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-66773467462613457582 : Rat) / 692956453614176359) [(0, 1), (5, 1), (7, 2), (13, 3), (16, 1)],
  term ((-44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 2), (13, 4), (15, 1), (16, 1)],
  term ((-10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-43013820733945802338380386882976000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1605687753144365556586526442178022400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 1), (7, 3), (13, 3), (15, 1), (16, 1)],
  term ((-26542157644955337657 : Rat) / 1385912907228352718) [(0, 1), (5, 2), (7, 1), (13, 1), (16, 1)],
  term ((129167667102054335688 : Rat) / 692956453614176359) [(0, 1), (5, 2), (7, 1), (13, 3), (16, 1)],
  term ((20859331816493476290388167809242783320000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (5, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (6, 2), (7, 1), (13, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (6, 2), (7, 1), (13, 3), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (6, 2), (7, 1), (13, 4), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (6, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (6, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (6, 2), (10, 1), (13, 2), (16, 1)],
  term ((3734882957533134375 : Rat) / 1385912907228352718) [(0, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (6, 2), (11, 1), (13, 3), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (6, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((4052459799516765205351163155922718194475 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 2), (13, 2), (15, 2), (16, 1)],
  term ((-16187968423977146460 : Rat) / 692956453614176359) [(0, 1), (6, 2), (13, 2), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 2), (13, 3), (15, 1), (16, 1)],
  term ((21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (6, 3), (13, 1), (15, 1), (16, 1)],
  term ((6945979900585068000 : Rat) / 692956453614176359) [(0, 1), (7, 2), (10, 1), (13, 2), (16, 1)],
  term ((3734882957533134375 : Rat) / 1385912907228352718) [(0, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((14293661141217672000 : Rat) / 692956453614176359) [(0, 1), (7, 2), (11, 1), (13, 3), (16, 1)],
  term ((1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 2), (11, 1), (13, 4), (15, 1), (16, 1)],
  term ((4052459799516765205351163155922718194475 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((-16187968423977146460 : Rat) / 692956453614176359) [(0, 1), (7, 2), (13, 2), (16, 1)],
  term ((11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(0, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((4624670165699233431 : Rat) / 692956453614176359) [(0, 1), (7, 3), (13, 1), (16, 1)],
  term ((-78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 692956453614176359) [(0, 1), (7, 3), (13, 3), (16, 1)],
  term ((22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 3), (13, 4), (15, 1), (16, 1)],
  term ((43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 4), (13, 1), (15, 1), (16, 1)],
  term ((609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(0, 1), (7, 4), (13, 3), (15, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (4, 1), (6, 1), (16, 1)],
  term ((771775544509452000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (5, 1), (7, 1), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (6, 2), (16, 1)],
  term ((-385887772254726000 : Rat) / 692956453614176359) [(1, 1), (3, 1), (7, 2), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (4, 1), (5, 1), (6, 1), (12, 1), (13, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (4, 1), (5, 1), (6, 1), (12, 1), (16, 1)],
  term ((-20859331816493476290388167809242783320000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2189633911586289738 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((9249340331398466862 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (7, 1), (12, 1), (16, 1)],
  term ((1218442200846645037506346959141427200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((86673858493002527528792779578278400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3734882957533134375 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32375936847954292920 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 1), (16, 1)],
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((8503265190305040295837519381998230500950 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-20859331816493476290388167809242783320000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((43626810247303208702812078181626403269200 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (6, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 2), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (6, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(1, 1), (5, 1), (6, 2), (12, 1), (13, 2), (16, 1)],
  term ((-26542157644955337657 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (6, 2), (12, 1), (16, 1)],
  term ((13891959801170136000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((6670395561478076422635316524709288665600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((28587322282435344000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((2366596089097314813815965124265084211200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((3734882957533134375 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 1), (11, 1), (12, 1), (16, 1)],
  term ((1074892332814830418378796359456081536000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-32375936847954292920 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((23383469607126666413482913512740473548800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((8503265190305040295837519381998230500950 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((514517029672968000 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-156546074333121060904753408036070400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((66773467462613457582 : Rat) / 692956453614176359) [(1, 1), (5, 1), (7, 2), (12, 1), (13, 2), (16, 1)],
  term ((44240825310375167103676157919130752000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 2), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((10455203680638529791 : Rat) / 2771825814456705436) [(1, 1), (5, 1), (7, 2), (12, 1), (16, 1)],
  term ((1605687753144365556586526442178022400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 3), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((43013820733945802338380386882976000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 1), (7, 3), (12, 1), (15, 1), (16, 1)],
  term ((-129167667102054335688 : Rat) / 692956453614176359) [(1, 1), (5, 2), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((26542157644955337657 : Rat) / 1385912907228352718) [(1, 1), (5, 2), (7, 1), (12, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 2), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (5, 2), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (6, 2), (7, 1), (12, 1), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 2), (7, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (6, 2), (7, 1), (12, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 2), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 2), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (6, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (6, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (6, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3734882957533134375 : Rat) / 1385912907228352718) [(1, 1), (6, 2), (11, 1), (12, 1), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((16187968423977146460 : Rat) / 692956453614176359) [(1, 1), (6, 2), (12, 1), (13, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4251632595152520147918759690999115250475 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (6, 2), (13, 1), (16, 1)],
  term ((-5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 2), (15, 1), (16, 1)],
  term ((-21813405123651604351406039090813201634600 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (6, 3), (12, 1), (15, 1), (16, 1)],
  term ((-6945979900585068000 : Rat) / 692956453614176359) [(1, 1), (7, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3335197780739038211317658262354644332800 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(1, 1), (7, 2), (11, 1), (12, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 2), (11, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3734882957533134375 : Rat) / 1385912907228352718) [(1, 1), (7, 2), (11, 1), (12, 1), (16, 1)],
  term ((-537446166407415209189398179728040768000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((16187968423977146460 : Rat) / 692956453614176359) [(1, 1), (7, 2), (12, 1), (13, 1), (16, 1)],
  term ((-11691734803563333206741456756370236774400 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 2), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4251632595152520147918759690999115250475 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((-257258514836484000 : Rat) / 692956453614176359) [(1, 1), (7, 2), (13, 1), (16, 1)],
  term ((-5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(1, 1), (7, 2), (15, 1), (16, 1)],
  term ((78273037166560530452376704018035200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(1, 1), (7, 3), (12, 1), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 3), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4624670165699233431 : Rat) / 692956453614176359) [(1, 1), (7, 3), (12, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 4), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43336929246501263764396389789139200 : Rat) / 2908751756057405437512772901016949218931) [(1, 1), (7, 4), (12, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((-18982625112633358778440170737088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (6, 1), (13, 2), (16, 1)],
  term ((-66925080449200531695 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (5, 1), (6, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((9570940925329989130606283080264161664800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-314795199784503199742466164723376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1094816955793144869 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((1619646487561852949 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (7, 1), (16, 1)],
  term ((-609221100423322518753173479570713600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((9397072573488003139965417854246400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (9, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((358297444271610139459598786485360512000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3858877722547260000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-82039166745136870451330560914620535109950 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-588487418397039748268613010066186003200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (4, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((823892116398062625 : Rat) / 1385912907228352718) [(3, 1), (4, 1), (6, 1), (11, 1), (16, 1)],
  term ((-45065128497721935216293410758265680457200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (12, 1), (15, 1), (16, 1)],
  term ((-527674417927280387204136394642076390400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (13, 1), (15, 2), (16, 1)],
  term ((29570310589067078787 : Rat) / 2771825814456705436) [(3, 1), (4, 1), (6, 1), (13, 1), (16, 1)],
  term ((-14614230566620884062975512784804384025600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((167826506977311102163647092696882294410650 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 1), (15, 1), (16, 1)],
  term ((-83370814993305000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 2), (11, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(3, 1), (4, 1), (6, 2), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((29289746589764457139109905312058298510600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (6, 2), (15, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 2), (11, 1), (16, 1)],
  term ((-199241833525243875 : Rat) / 692956453614176359) [(3, 1), (4, 1), (7, 2), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4785470462664994565303141540132080832400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 1), (7, 2), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(3, 1), (4, 2), (6, 1), (11, 1), (16, 1)],
  term ((398483667050487750 : Rat) / 692956453614176359) [(3, 1), (4, 2), (6, 1), (13, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (6, 1), (13, 2), (15, 1), (16, 1)],
  term ((9570940925329989130606283080264161664800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (4, 2), (6, 1), (15, 1), (16, 1)],
  term ((-107191047848535000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 1), (7, 1), (11, 1), (16, 1)],
  term ((34075217052429451704413046852190379343000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-193622776148860259540089741518297600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 2), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((9491312556316679389220085368544000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((-32291916775513583922 : Rat) / 692956453614176359) [(3, 1), (5, 1), (6, 2), (13, 2), (16, 1)],
  term ((66925080449200531695 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (6, 2), (16, 1)],
  term ((-78173987841078575882094280687715020800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((140649573864425400 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-95280931420920000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((358297444271610139459598786485360512000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3858877722547260000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-82039166745136870451330560914620535109950 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((-588487418397039748268613010066186003200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14293661141217672000 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1183298044548657406907982562132542105600 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((823892116398062625 : Rat) / 1385912907228352718) [(3, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-45065128497721935216293410758265680457200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-527674417927280387204136394642076390400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (13, 1), (15, 2), (16, 1)],
  term ((29570310589067078787 : Rat) / 2771825814456705436) [(3, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-14614230566620884062975512784804384025600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (13, 2), (15, 1), (16, 1)],
  term ((167826506977311102163647092696882294410650 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-314795199784503199742466164723376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-33386733731306728791 : Rat) / 692956453614176359) [(3, 1), (5, 1), (7, 2), (13, 2), (16, 1)],
  term ((-22120412655187583551838078959565376000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((70164373424324237593 : Rat) / 5543651628913410872) [(3, 1), (5, 1), (7, 2), (16, 1)],
  term ((-802843876572182778293263221089011200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 3), (13, 2), (15, 1), (16, 1)],
  term ((18888385129804682529185503222790400 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 1), (7, 3), (15, 1), (16, 1)],
  term ((64583833551027167844 : Rat) / 692956453614176359) [(3, 1), (5, 2), (7, 1), (13, 2), (16, 1)],
  term ((-66925080449200531695 : Rat) / 2771825814456705436) [(3, 1), (5, 2), (7, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-18982625112633358778440170737088000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (5, 2), (7, 2), (15, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(3, 1), (6, 1), (7, 2), (11, 1), (16, 1)],
  term ((-17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((157397599892251599871233082361688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(3, 1), (6, 2), (7, 1), (13, 2), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (6, 2), (7, 1), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (7, 2), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (6, 2), (9, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(3, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-179148722135805069729799393242680256000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1929438861273630000 : Rat) / 692956453614176359) [(3, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((41019583372568435225665280457310267554975 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((294243709198519874134306505033093001600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(3, 1), (6, 2), (11, 1), (13, 2), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (6, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-823892116398062625 : Rat) / 2771825814456705436) [(3, 1), (6, 2), (11, 1), (16, 1)],
  term ((22532564248860967608146705379132840228600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (12, 1), (15, 1), (16, 1)],
  term ((263837208963640193602068197321038195200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (13, 1), (15, 2), (16, 1)],
  term ((-29570310589067078787 : Rat) / 5543651628913410872) [(3, 1), (6, 2), (13, 1), (16, 1)],
  term ((7307115283310442031487756392402192012800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (13, 2), (15, 1), (16, 1)],
  term ((-83913253488655551081823546348441147205325 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term ((53595523924267500 : Rat) / 692956453614176359) [(3, 1), (6, 3), (11, 1), (16, 1)],
  term ((-17037608526214725852206523426095189671500 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (6, 3), (15, 1), (16, 1)],
  term ((39086993920539287941047140343857510400 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-70324786932212700 : Rat) / 692956453614176359) [(3, 1), (7, 2), (9, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(3, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-179148722135805069729799393242680256000 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1929438861273630000 : Rat) / 692956453614176359) [(3, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((41019583372568435225665280457310267554975 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((294243709198519874134306505033093001600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((7146830570608836000 : Rat) / 692956453614176359) [(3, 1), (7, 2), (11, 1), (13, 2), (16, 1)],
  term ((591649022274328703453991281066271052800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-823892116398062625 : Rat) / 2771825814456705436) [(3, 1), (7, 2), (11, 1), (16, 1)],
  term ((22532564248860967608146705379132840228600 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (12, 1), (15, 1), (16, 1)],
  term ((263837208963640193602068197321038195200 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (13, 1), (15, 2), (16, 1)],
  term ((-29570310589067078787 : Rat) / 5543651628913410872) [(3, 1), (7, 2), (13, 1), (16, 1)],
  term ((7307115283310442031487756392402192012800 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (13, 2), (15, 1), (16, 1)],
  term ((-83913253488655551081823546348441147205325 : Rat) / 84353800925664757687870414129491527348999) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term ((157397599892251599871233082361688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((1094816955793144869 : Rat) / 1385912907228352718) [(3, 1), (7, 3), (13, 2), (16, 1)],
  term ((11060206327593791775919039479782688000 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 3), (13, 3), (15, 1), (16, 1)],
  term ((-1619646487561852949 : Rat) / 5543651628913410872) [(3, 1), (7, 3), (16, 1)],
  term ((304610550211661259376586739785356800 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 4), (13, 2), (15, 1), (16, 1)],
  term ((-4698536286744001569982708927123200 : Rat) / 2908751756057405437512772901016949218931) [(3, 1), (7, 4), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((94913125563166793892200853685440000 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(4, 1), (5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(4, 1), (5, 1), (6, 1), (10, 1), (11, 1), (16, 1)],
  term ((27339124979056313157 : Rat) / 1385912907228352718) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-6711189780963057975675238698337049856000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1385153690424507000 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (10, 1), (16, 1)],
  term ((-398483667050487750 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((855696896323730156389740661899223257600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (11, 2), (16, 1)],
  term ((3353576166086183082372245907529853769600 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (5, 1), (7, 1), (16, 1)],
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (7, 1), (15, 1), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (6, 2), (10, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 692956453614176359) [(4, 1), (6, 2), (11, 1), (13, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-427848448161865078194870330949611628800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(4, 1), (6, 2), (11, 2), (16, 1)],
  term ((-1676788083043091541186122953764926884800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (6, 2), (13, 1), (15, 1), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(4, 1), (6, 2), (16, 1)],
  term ((3355594890481528987837619349168524928000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 1), (7, 2), (10, 1), (16, 1)],
  term ((199241833525243875 : Rat) / 692956453614176359) [(4, 1), (7, 2), (11, 1), (13, 1), (16, 1)],
  term ((-478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-427848448161865078194870330949611628800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 2), (11, 1), (15, 1), (16, 1)],
  term ((-23820232855230000 : Rat) / 692956453614176359) [(4, 1), (7, 2), (11, 2), (16, 1)],
  term ((-1676788083043091541186122953764926884800 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-346288422606126750 : Rat) / 692956453614176359) [(4, 1), (7, 2), (16, 1)],
  term ((-5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(4, 1), (7, 3), (15, 1), (16, 1)],
  term ((10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-6711189780963057975675238698337049856000 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1385153690424507000 : Rat) / 692956453614176359) [(4, 2), (6, 1), (10, 1), (16, 1)],
  term ((-398483667050487750 : Rat) / 692956453614176359) [(4, 2), (6, 1), (11, 1), (13, 1), (16, 1)],
  term ((956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((855696896323730156389740661899223257600 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (11, 1), (15, 1), (16, 1)],
  term ((47640465710460000 : Rat) / 692956453614176359) [(4, 2), (6, 1), (11, 2), (16, 1)],
  term ((3353576166086183082372245907529853769600 : Rat) / 84353800925664757687870414129491527348999) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((692576845212253500 : Rat) / 692956453614176359) [(4, 2), (6, 1), (16, 1)],
  term ((5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 1), (7, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (13, 3), (15, 1), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (6, 2), (7, 1), (15, 2), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(5, 1), (6, 2), (10, 1), (11, 1), (16, 1)],
  term ((-27339124979056313157 : Rat) / 2771825814456705436) [(5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((5214832954123369072597041952310695830000 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (6, 3), (15, 1), (16, 1)],
  term ((23820232855230000 : Rat) / 692956453614176359) [(5, 1), (7, 2), (10, 1), (11, 1), (16, 1)],
  term ((-27339124979056313157 : Rat) / 2771825814456705436) [(5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((478060622764964799693876234252168883200 : Rat) / 84353800925664757687870414129491527348999) [(5, 1), (7, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-387245552297720519080179483036595200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((43660037759056725190412392695302400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-47456562781583396946100426842720000 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 1), (15, 1), (16, 1)],
  term ((64540925382953419846696580506099200 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 2), (15, 2), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (13, 3), (15, 1), (16, 1)],
  term ((5694787533790007633532051221126400 : Rat) / 2908751756057405437512772901016949218931) [(5, 1), (7, 3), (15, 2), (16, 1)],
  term ((-10429665908246738145194083904621391660000 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-47640465710460000 : Rat) / 692956453614176359) [(5, 2), (7, 1), (10, 1), (11, 1), (16, 1)],
  term ((27339124979056313157 : Rat) / 1385912907228352718) [(5, 2), (7, 1), (10, 1), (13, 1), (16, 1)],
  term ((-956121245529929599387752468504337766400 : Rat) / 84353800925664757687870414129491527348999) [(5, 2), (7, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((774491104595441038160358966073190400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (11, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-87320075518113450380824785390604800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((94913125563166793892200853685440000 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (13, 1), (15, 1), (16, 1)],
  term ((-129081850765906839693393161012198400 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (13, 2), (15, 2), (16, 1)],
  term ((258163701531813679386786322024396800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (13, 3), (15, 1), (16, 1)],
  term ((-11389575067580015267064102442252800 : Rat) / 2908751756057405437512772901016949218931) [(5, 2), (7, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 0 through 99. -/
theorem ep_Q2_008_block_12_0000_0099_valid :
    checkProductSumEq ep_Q2_008_partials_12_0000_0099
      ep_Q2_008_block_12_0000_0099 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
