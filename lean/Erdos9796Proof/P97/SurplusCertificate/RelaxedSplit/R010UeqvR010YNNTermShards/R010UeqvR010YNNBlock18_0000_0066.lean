/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 18:0-66

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 18 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_18_0000_0066 : Poly :=
[
  term (-2 : Rat) [(0, 1), (6, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (7, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (14, 1)],
  term (2 : Rat) [(7, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0000 : Poly :=
[
  term ((-106311097065672776 : Rat) / 53898264945705951) [(0, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0000 : Poly :=
[
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-106311097065672776 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((106311097065672776 : Rat) / 53898264945705951) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((106311097065672776 : Rat) / 53898264945705951) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-106311097065672776 : Rat) / 53898264945705951) [(0, 3), (5, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0000_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0000
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0001 : Poly :=
[
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0001 : Poly :=
[
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (15, 3), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0001_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0001
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0002 : Poly :=
[
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (16, 1)]
]

/-- Partial product 2 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0002 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (8, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 3), (5, 1), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0002_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0002
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0003 : Poly :=
[
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 1), (16, 1)]
]

/-- Partial product 3 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0003 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (14, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 3), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 3), (5, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0003_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0003
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0004 : Poly :=
[
  term ((1320603536037348956 : Rat) / 53898264945705951) [(1, 1), (5, 1), (16, 1)]
]

/-- Partial product 4 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0004 : Poly :=
[
  term ((-2641207072074697912 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((1320603536037348956 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((2641207072074697912 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((2641207072074697912 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-1320603536037348956 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((-1320603536037348956 : Rat) / 53898264945705951) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-2641207072074697912 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((1320603536037348956 : Rat) / 53898264945705951) [(1, 3), (5, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0004_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0004
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0005 : Poly :=
[
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 5 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0005 : Poly :=
[
  term ((148491200542136320 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 3), (5, 2), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0005_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0005
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0006 : Poly :=
[
  term ((64964900237184640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (16, 1)]
]

/-- Partial product 6 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0006 : Poly :=
[
  term ((-129929800474369280 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 2), (9, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 5988696105078439) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (14, 2), (16, 1)],
  term ((-64964900237184640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((-129929800474369280 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 5988696105078439) [(1, 3), (5, 2), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0006_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0006
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0007 : Poly :=
[
  term ((-316170936483744002 : Rat) / 53898264945705951) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 7 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0007 : Poly :=
[
  term ((632341872967488004 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(4, 1), (5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0007_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0007
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0008 : Poly :=
[
  term ((-88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 8 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0008 : Poly :=
[
  term ((176333300643786880 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0008_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0008
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0009 : Poly :=
[
  term ((8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (15, 1), (16, 1)]
]

/-- Partial product 9 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0009 : Poly :=
[
  term ((-17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0009_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0009
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0010 : Poly :=
[
  term ((323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (14, 1), (16, 1)]
]

/-- Partial product 10 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0010 : Poly :=
[
  term ((-646501255873655360 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 2), (14, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (14, 3), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0010_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0010
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0011 : Poly :=
[
  term ((-55325660568978480 : Rat) / 5988696105078439) [(5, 1), (7, 1), (16, 1)]
]

/-- Partial product 11 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0011 : Poly :=
[
  term ((110651321137956960 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((-55325660568978480 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((110651321137956960 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((-55325660568978480 : Rat) / 5988696105078439) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-110651321137956960 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((55325660568978480 : Rat) / 5988696105078439) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((55325660568978480 : Rat) / 5988696105078439) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((-110651321137956960 : Rat) / 5988696105078439) [(5, 1), (7, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0011_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0011
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0012 : Poly :=
[
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 12 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0012 : Poly :=
[
  term ((86031302831488000 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0012_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0012
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0013 : Poly :=
[
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 13 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0013 : Poly :=
[
  term ((-34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0013_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0013
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0014 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 14 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0014 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0014_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0014
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0015 : Poly :=
[
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 15 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0015 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0015_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0015
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0016 : Poly :=
[
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 16 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0016 : Poly :=
[
  term ((107610601457623040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0016_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0016
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0017 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 17 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0017 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0017_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0017
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0018 : Poly :=
[
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 18 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0018 : Poly :=
[
  term ((19769855432224564012 : Rat) / 149717402626960975) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0018_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0018
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0019 : Poly :=
[
  term ((-38212788179321324 : Rat) / 5988696105078439) [(5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 19 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0019 : Poly :=
[
  term ((76425576358642648 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((76425576358642648 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-76425576358642648 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-76425576358642648 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((38212788179321324 : Rat) / 5988696105078439) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((38212788179321324 : Rat) / 5988696105078439) [(5, 1), (8, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0019_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0019
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0020 : Poly :=
[
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 20 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0020 : Poly :=
[
  term ((34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0020_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0020
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0021 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 21 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0021 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0021_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0021
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0022 : Poly :=
[
  term ((-6777911812940800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 22 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0022 : Poly :=
[
  term ((13555823625881600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13555823625881600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-13555823625881600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0022_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0022
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0023 : Poly :=
[
  term ((48830851396633600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 23 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0023 : Poly :=
[
  term ((-97661702793267200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((48830851396633600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-97661702793267200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((48830851396633600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((97661702793267200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((97661702793267200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-48830851396633600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-48830851396633600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0023_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0023
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0024 : Poly :=
[
  term ((3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 24 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0024 : Poly :=
[
  term ((-6448371121561600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0024_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0024
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0025 : Poly :=
[
  term ((-54452337323928320 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 25 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0025 : Poly :=
[
  term ((108904674647856640 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-54452337323928320 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((108904674647856640 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-54452337323928320 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-108904674647856640 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-108904674647856640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((54452337323928320 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((54452337323928320 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0025_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0025
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0026 : Poly :=
[
  term ((86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 26 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0026 : Poly :=
[
  term ((-172980456656537600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0026_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0026
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0027 : Poly :=
[
  term ((-20217261706073600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 27 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0027 : Poly :=
[
  term ((40434523412147200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-20217261706073600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((40434523412147200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-20217261706073600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((-40434523412147200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-40434523412147200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((20217261706073600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((20217261706073600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0027_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0027
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0028 : Poly :=
[
  term ((19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 28 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0028 : Poly :=
[
  term ((-39475125487333760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0028_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0028
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0029 : Poly :=
[
  term ((796040690290064430392 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 29 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0029 : Poly :=
[
  term ((-1592081380580128860784 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((796040690290064430392 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((-1592081380580128860784 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((796040690290064430392 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((1592081380580128860784 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((1592081380580128860784 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-796040690290064430392 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-796040690290064430392 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0029_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0029
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0030 : Poly :=
[
  term ((19737562743666880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 30 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0030 : Poly :=
[
  term ((-39475125487333760 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((-19737562743666880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0030_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0030
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0031 : Poly :=
[
  term ((-417175989001477816696 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (16, 1)]
]

/-- Partial product 31 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0031 : Poly :=
[
  term ((834351978002955633392 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-417175989001477816696 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((834351978002955633392 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-417175989001477816696 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((-834351978002955633392 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-834351978002955633392 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((417175989001477816696 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((417175989001477816696 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0031_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0031
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0032 : Poly :=
[
  term ((126198364417126400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 32 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0032 : Poly :=
[
  term ((-252396728834252800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((252396728834252800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((252396728834252800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0032_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0032
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0033 : Poly :=
[
  term ((-670003605980334080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 33 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0033 : Poly :=
[
  term ((1340007211960668160 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-670003605980334080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((1340007211960668160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-670003605980334080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1340007211960668160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-1340007211960668160 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((670003605980334080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((670003605980334080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0033_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0033
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0034 : Poly :=
[
  term ((289309291735690240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 34 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0034 : Poly :=
[
  term ((-578618583471380480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((289309291735690240 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-578618583471380480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((289309291735690240 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((578618583471380480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((578618583471380480 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-289309291735690240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((-289309291735690240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0034_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0034
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0035 : Poly :=
[
  term ((-59678560403660800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 35 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0035 : Poly :=
[
  term ((119357120807321600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((119357120807321600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-119357120807321600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-119357120807321600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((59678560403660800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((59678560403660800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0035_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0035
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0036 : Poly :=
[
  term ((36584862453923840 : Rat) / 17966088315235317) [(5, 1), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 36 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0036 : Poly :=
[
  term ((-73169724907847680 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((36584862453923840 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((-73169724907847680 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((36584862453923840 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((73169724907847680 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((73169724907847680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-36584862453923840 : Rat) / 17966088315235317) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-36584862453923840 : Rat) / 17966088315235317) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0036_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0036
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0037 : Poly :=
[
  term ((2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 37 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0037 : Poly :=
[
  term ((-4750053127536640 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0037_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0037
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0038 : Poly :=
[
  term ((-286083150426375680 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 38 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0038 : Poly :=
[
  term ((572166300852751360 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-286083150426375680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((572166300852751360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-286083150426375680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-572166300852751360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-572166300852751360 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((286083150426375680 : Rat) / 53898264945705951) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((286083150426375680 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0038_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0038
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0039 : Poly :=
[
  term ((1058718231571947520 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 39 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0039 : Poly :=
[
  term ((-2117436463143895040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((1058718231571947520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-2117436463143895040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 3), (14, 1), (16, 1)],
  term ((1058718231571947520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((2117436463143895040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (14, 2), (16, 1)],
  term ((2117436463143895040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1058718231571947520 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 1), (15, 2), (16, 1)],
  term ((-1058718231571947520 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0039_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0039
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0040 : Poly :=
[
  term ((-407512419107368960 : Rat) / 53898264945705951) [(5, 1), (9, 3), (16, 1)]
]

/-- Partial product 40 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0040 : Poly :=
[
  term ((815024838214737920 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-407512419107368960 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (16, 1)],
  term ((815024838214737920 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 3), (16, 1)],
  term ((-407512419107368960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (16, 1)],
  term ((-815024838214737920 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((-815024838214737920 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((407512419107368960 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 2), (16, 1)],
  term ((407512419107368960 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0040_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0040
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0041 : Poly :=
[
  term ((26218871761022314 : Rat) / 17966088315235317) [(5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 41 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0041 : Poly :=
[
  term ((-52437743522044628 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-52437743522044628 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((52437743522044628 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((52437743522044628 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0041_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0041
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0042 : Poly :=
[
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 42 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0042 : Poly :=
[
  term ((14324988938880830816 : Rat) / 89830441576176585) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((14324988938880830816 : Rat) / 89830441576176585) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((-14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0042_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0042
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0043 : Poly :=
[
  term ((7279195429319260567 : Rat) / 269491324728529755) [(5, 1), (11, 1), (16, 1)]
]

/-- Partial product 43 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0043 : Poly :=
[
  term ((-14558390858638521134 : Rat) / 269491324728529755) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((7279195429319260567 : Rat) / 269491324728529755) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((-14558390858638521134 : Rat) / 269491324728529755) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((7279195429319260567 : Rat) / 269491324728529755) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((14558390858638521134 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((14558390858638521134 : Rat) / 269491324728529755) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((-7279195429319260567 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((-7279195429319260567 : Rat) / 269491324728529755) [(5, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0043_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0043
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0044 : Poly :=
[
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 44 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0044 : Poly :=
[
  term ((-41546018227576328888 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((-41546018227576328888 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((41546018227576328888 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((41546018227576328888 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20773009113788164444 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-20773009113788164444 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0044_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0044
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0045 : Poly :=
[
  term ((65384373839721769982 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (16, 1)]
]

/-- Partial product 45 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0045 : Poly :=
[
  term ((-130768747679443539964 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((65384373839721769982 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((-130768747679443539964 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((65384373839721769982 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((130768747679443539964 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((130768747679443539964 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65384373839721769982 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-65384373839721769982 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0045_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0045
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0046 : Poly :=
[
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 46 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0046 : Poly :=
[
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0046_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0046
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0047 : Poly :=
[
  term ((-3490583759365736686 : Rat) / 449152207880882925) [(5, 1), (15, 1), (16, 1)]
]

/-- Partial product 47 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0047 : Poly :=
[
  term ((6981167518731473372 : Rat) / 449152207880882925) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-3490583759365736686 : Rat) / 449152207880882925) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((6981167518731473372 : Rat) / 449152207880882925) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-3490583759365736686 : Rat) / 449152207880882925) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-6981167518731473372 : Rat) / 449152207880882925) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6981167518731473372 : Rat) / 449152207880882925) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((3490583759365736686 : Rat) / 449152207880882925) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((3490583759365736686 : Rat) / 449152207880882925) [(5, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0047_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0047
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0048 : Poly :=
[
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 48 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0048 : Poly :=
[
  term ((-86031302831488000 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0048_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0048
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0049 : Poly :=
[
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 49 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0049 : Poly :=
[
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(0, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(1, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0049_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0049
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0050 : Poly :=
[
  term ((422336152228357760 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 50 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0050 : Poly :=
[
  term ((-844672304456715520 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((422336152228357760 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-844672304456715520 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((422336152228357760 : Rat) / 53898264945705951) [(1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((844672304456715520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((844672304456715520 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-422336152228357760 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-422336152228357760 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0050_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0050
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0051 : Poly :=
[
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 51 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0051 : Poly :=
[
  term ((-107610601457623040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(1, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0051_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0051
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0052 : Poly :=
[
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (8, 1), (16, 1)]
]

/-- Partial product 52 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0052 : Poly :=
[
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(0, 1), (5, 2), (6, 1), (8, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(0, 2), (5, 2), (8, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(1, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(1, 2), (5, 2), (8, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (8, 1), (14, 2), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (8, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0052_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0052
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0053 : Poly :=
[
  term ((32482450118592320 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 53 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0053 : Poly :=
[
  term ((-64964900237184640 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-32482450118592320 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0053_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0053
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0054 : Poly :=
[
  term ((-2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 54 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0054 : Poly :=
[
  term ((5719071054263607296 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2859535527131803648 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((5719071054263607296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2859535527131803648 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5719071054263607296 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-5719071054263607296 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0054_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0054
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0055 : Poly :=
[
  term ((1496759522362794784 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 55 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0055 : Poly :=
[
  term ((-2993519044725589568 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((1496759522362794784 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((-2993519044725589568 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((1496759522362794784 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((2993519044725589568 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2993519044725589568 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1496759522362794784 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-1496759522362794784 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0055_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0055
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0056 : Poly :=
[
  term ((3386657545635599488 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 56 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0056 : Poly :=
[
  term ((-6773315091271198976 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6773315091271198976 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6773315091271198976 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((6773315091271198976 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3386657545635599488 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-3386657545635599488 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0056_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0056
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0057 : Poly :=
[
  term ((-18335462726474860736 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 57 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0057 : Poly :=
[
  term ((36670925452949721472 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-18335462726474860736 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((36670925452949721472 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-18335462726474860736 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-36670925452949721472 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-36670925452949721472 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((18335462726474860736 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((18335462726474860736 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0057_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0057
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0058 : Poly :=
[
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 58 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0058 : Poly :=
[
  term ((9802639664947982336 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0058_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0058
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0059 : Poly :=
[
  term ((499367383010260928 : Rat) / 89830441576176585) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 59 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0059 : Poly :=
[
  term ((-998734766020521856 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((499367383010260928 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((-998734766020521856 : Rat) / 89830441576176585) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((499367383010260928 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((998734766020521856 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((998734766020521856 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((-499367383010260928 : Rat) / 89830441576176585) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-499367383010260928 : Rat) / 89830441576176585) [(5, 2), (9, 1), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0059_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0059
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0060 : Poly :=
[
  term ((34287821186027638528 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 1), (16, 1)]
]

/-- Partial product 60 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0060 : Poly :=
[
  term ((-68575642372055277056 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((34287821186027638528 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-68575642372055277056 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((34287821186027638528 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((68575642372055277056 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 2), (16, 1)],
  term ((68575642372055277056 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-34287821186027638528 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-34287821186027638528 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0060_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0060
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0061 : Poly :=
[
  term ((-16861654404571076864 : Rat) / 269491324728529755) [(5, 2), (9, 2), (16, 1)]
]

/-- Partial product 61 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0061 : Poly :=
[
  term ((33723308809142153728 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((-16861654404571076864 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((33723308809142153728 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((-16861654404571076864 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-33723308809142153728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((-33723308809142153728 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((16861654404571076864 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 2), (16, 1)],
  term ((16861654404571076864 : Rat) / 269491324728529755) [(5, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0061_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0061
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0062 : Poly :=
[
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (14, 1), (16, 1)]
]

/-- Partial product 62 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0062 : Poly :=
[
  term ((431797246912509876392 : Rat) / 1347456623642648775) [(0, 1), (5, 2), (6, 1), (14, 1), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (14, 1), (16, 1)],
  term ((431797246912509876392 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (7, 1), (14, 1), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (14, 1), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (14, 2), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0062_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0062
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0063 : Poly :=
[
  term ((2381151079394213691 : Rat) / 149717402626960975) [(5, 2), (16, 1)]
]

/-- Partial product 63 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0063 : Poly :=
[
  term ((-4762302158788427382 : Rat) / 149717402626960975) [(0, 1), (5, 2), (6, 1), (16, 1)],
  term ((2381151079394213691 : Rat) / 149717402626960975) [(0, 2), (5, 2), (16, 1)],
  term ((-4762302158788427382 : Rat) / 149717402626960975) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((2381151079394213691 : Rat) / 149717402626960975) [(1, 2), (5, 2), (16, 1)],
  term ((4762302158788427382 : Rat) / 149717402626960975) [(5, 2), (6, 1), (14, 1), (16, 1)],
  term ((4762302158788427382 : Rat) / 149717402626960975) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-2381151079394213691 : Rat) / 149717402626960975) [(5, 2), (14, 2), (16, 1)],
  term ((-2381151079394213691 : Rat) / 149717402626960975) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0063_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0063
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0064 : Poly :=
[
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 64 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0064 : Poly :=
[
  term ((3342491821736034176 : Rat) / 29943480525392195) [(0, 1), (5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(0, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(1, 1), (5, 3), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(1, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0064_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0064
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0065 : Poly :=
[
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 65 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0065 : Poly :=
[
  term ((16202575714108323584 : Rat) / 269491324728529755) [(0, 1), (5, 3), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(1, 1), (5, 3), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0065_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0065
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 18. -/
def rs_R010_ueqv_R010YNN_coefficient_18_0066 : Poly :=
[
  term ((18152186247908528288 : Rat) / 269491324728529755) [(5, 3), (9, 1), (16, 1)]
]

/-- Partial product 66 for generator 18. -/
def rs_R010_ueqv_R010YNN_partial_18_0066 : Poly :=
[
  term ((-36304372495817056576 : Rat) / 269491324728529755) [(0, 1), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((18152186247908528288 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term ((-36304372495817056576 : Rat) / 269491324728529755) [(1, 1), (5, 3), (7, 1), (9, 1), (16, 1)],
  term ((18152186247908528288 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (16, 1)],
  term ((36304372495817056576 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((36304372495817056576 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-18152186247908528288 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 2), (16, 1)],
  term ((-18152186247908528288 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 18. -/
theorem rs_R010_ueqv_R010YNN_partial_18_0066_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_18_0066
        rs_R010_ueqv_R010YNN_generator_18_0000_0066 =
      rs_R010_ueqv_R010YNN_partial_18_0066 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_18_0000_0066 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_18_0000,
  rs_R010_ueqv_R010YNN_partial_18_0001,
  rs_R010_ueqv_R010YNN_partial_18_0002,
  rs_R010_ueqv_R010YNN_partial_18_0003,
  rs_R010_ueqv_R010YNN_partial_18_0004,
  rs_R010_ueqv_R010YNN_partial_18_0005,
  rs_R010_ueqv_R010YNN_partial_18_0006,
  rs_R010_ueqv_R010YNN_partial_18_0007,
  rs_R010_ueqv_R010YNN_partial_18_0008,
  rs_R010_ueqv_R010YNN_partial_18_0009,
  rs_R010_ueqv_R010YNN_partial_18_0010,
  rs_R010_ueqv_R010YNN_partial_18_0011,
  rs_R010_ueqv_R010YNN_partial_18_0012,
  rs_R010_ueqv_R010YNN_partial_18_0013,
  rs_R010_ueqv_R010YNN_partial_18_0014,
  rs_R010_ueqv_R010YNN_partial_18_0015,
  rs_R010_ueqv_R010YNN_partial_18_0016,
  rs_R010_ueqv_R010YNN_partial_18_0017,
  rs_R010_ueqv_R010YNN_partial_18_0018,
  rs_R010_ueqv_R010YNN_partial_18_0019,
  rs_R010_ueqv_R010YNN_partial_18_0020,
  rs_R010_ueqv_R010YNN_partial_18_0021,
  rs_R010_ueqv_R010YNN_partial_18_0022,
  rs_R010_ueqv_R010YNN_partial_18_0023,
  rs_R010_ueqv_R010YNN_partial_18_0024,
  rs_R010_ueqv_R010YNN_partial_18_0025,
  rs_R010_ueqv_R010YNN_partial_18_0026,
  rs_R010_ueqv_R010YNN_partial_18_0027,
  rs_R010_ueqv_R010YNN_partial_18_0028,
  rs_R010_ueqv_R010YNN_partial_18_0029,
  rs_R010_ueqv_R010YNN_partial_18_0030,
  rs_R010_ueqv_R010YNN_partial_18_0031,
  rs_R010_ueqv_R010YNN_partial_18_0032,
  rs_R010_ueqv_R010YNN_partial_18_0033,
  rs_R010_ueqv_R010YNN_partial_18_0034,
  rs_R010_ueqv_R010YNN_partial_18_0035,
  rs_R010_ueqv_R010YNN_partial_18_0036,
  rs_R010_ueqv_R010YNN_partial_18_0037,
  rs_R010_ueqv_R010YNN_partial_18_0038,
  rs_R010_ueqv_R010YNN_partial_18_0039,
  rs_R010_ueqv_R010YNN_partial_18_0040,
  rs_R010_ueqv_R010YNN_partial_18_0041,
  rs_R010_ueqv_R010YNN_partial_18_0042,
  rs_R010_ueqv_R010YNN_partial_18_0043,
  rs_R010_ueqv_R010YNN_partial_18_0044,
  rs_R010_ueqv_R010YNN_partial_18_0045,
  rs_R010_ueqv_R010YNN_partial_18_0046,
  rs_R010_ueqv_R010YNN_partial_18_0047,
  rs_R010_ueqv_R010YNN_partial_18_0048,
  rs_R010_ueqv_R010YNN_partial_18_0049,
  rs_R010_ueqv_R010YNN_partial_18_0050,
  rs_R010_ueqv_R010YNN_partial_18_0051,
  rs_R010_ueqv_R010YNN_partial_18_0052,
  rs_R010_ueqv_R010YNN_partial_18_0053,
  rs_R010_ueqv_R010YNN_partial_18_0054,
  rs_R010_ueqv_R010YNN_partial_18_0055,
  rs_R010_ueqv_R010YNN_partial_18_0056,
  rs_R010_ueqv_R010YNN_partial_18_0057,
  rs_R010_ueqv_R010YNN_partial_18_0058,
  rs_R010_ueqv_R010YNN_partial_18_0059,
  rs_R010_ueqv_R010YNN_partial_18_0060,
  rs_R010_ueqv_R010YNN_partial_18_0061,
  rs_R010_ueqv_R010YNN_partial_18_0062,
  rs_R010_ueqv_R010YNN_partial_18_0063,
  rs_R010_ueqv_R010YNN_partial_18_0064,
  rs_R010_ueqv_R010YNN_partial_18_0065,
  rs_R010_ueqv_R010YNN_partial_18_0066
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_18_0000_0066 : Poly :=
[
  term ((850488776525382208 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (8, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-2641207072074697912 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (6, 1), (16, 1)],
  term ((212622194131345552 : Rat) / 53898264945705951) [(0, 1), (1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (6, 1), (9, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 1), (1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-106311097065672776 : Rat) / 53898264945705951) [(0, 1), (1, 2), (5, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 1), (1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(0, 1), (4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(0, 1), (4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((110651321137956960 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(0, 1), (5, 1), (6, 1), (8, 1), (13, 1), (16, 1)],
  term ((76425576358642648 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-97661702793267200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((108904674647856640 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((40434523412147200 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1592081380580128860784 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((834351978002955633392 : Rat) / 4042369870927946325) [(0, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1340007211960668160 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-578618583471380480 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((119357120807321600 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-73169724907847680 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (9, 2), (13, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(0, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((572166300852751360 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2117436463143895040 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((815024838214737920 : Rat) / 53898264945705951) [(0, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((-52437743522044628 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((14324988938880830816 : Rat) / 89830441576176585) [(0, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14558390858638521134 : Rat) / 269491324728529755) [(0, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-41546018227576328888 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-130768747679443539964 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((-56263809180228337232 : Rat) / 1347456623642648775) [(0, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((6981167518731473372 : Rat) / 449152207880882925) [(0, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(0, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-212622194131345552 : Rat) / 53898264945705951) [(0, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((106311097065672776 : Rat) / 53898264945705951) [(0, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((106311097065672776 : Rat) / 53898264945705951) [(0, 1), (5, 1), (15, 3), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-844672304456715520 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(0, 1), (5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5719071054263607296 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2993519044725589568 : Rat) / 53898264945705951) [(0, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-6773315091271198976 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((36670925452949721472 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((8132113658848948736 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-998734766020521856 : Rat) / 89830441576176585) [(0, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-68575642372055277056 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((33723308809142153728 : Rat) / 269491324728529755) [(0, 1), (5, 2), (6, 1), (9, 2), (16, 1)],
  term ((431797246912509876392 : Rat) / 1347456623642648775) [(0, 1), (5, 2), (6, 1), (14, 1), (16, 1)],
  term ((-4762302158788427382 : Rat) / 149717402626960975) [(0, 1), (5, 2), (6, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 5988696105078439) [(0, 1), (5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 5988696105078439) [(0, 1), (5, 2), (9, 1), (15, 3), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(0, 1), (5, 3), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(0, 1), (5, 3), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-36304372495817056576 : Rat) / 269491324728529755) [(0, 1), (5, 3), (6, 1), (9, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (8, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (14, 1), (16, 1)],
  term ((1320603536037348956 : Rat) / 53898264945705951) [(0, 2), (1, 1), (5, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 5988696105078439) [(0, 2), (1, 1), (5, 2), (9, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(0, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(0, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((238732200562475152 : Rat) / 53898264945705951) [(0, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((323250627936827680 : Rat) / 17966088315235317) [(0, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-55325660568978480 : Rat) / 5988696105078439) [(0, 2), (5, 1), (7, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(0, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(0, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(0, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((48830851396633600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54452337323928320 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-20217261706073600 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((796040690290064430392 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-417175989001477816696 : Rat) / 4042369870927946325) [(0, 2), (5, 1), (9, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-670003605980334080 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((289309291735690240 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((36584862453923840 : Rat) / 17966088315235317) [(0, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(0, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-286083150426375680 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1058718231571947520 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-407512419107368960 : Rat) / 53898264945705951) [(0, 2), (5, 1), (9, 3), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(0, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(0, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((7279195429319260567 : Rat) / 269491324728529755) [(0, 2), (5, 1), (11, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((65384373839721769982 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (13, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(0, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3490583759365736686 : Rat) / 449152207880882925) [(0, 2), (5, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 5988696105078439) [(0, 2), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(0, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(0, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((422336152228357760 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(0, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(0, 2), (5, 2), (8, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2859535527131803648 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1496759522362794784 : Rat) / 53898264945705951) [(0, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18335462726474860736 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((499367383010260928 : Rat) / 89830441576176585) [(0, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((34287821186027638528 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-16861654404571076864 : Rat) / 269491324728529755) [(0, 2), (5, 2), (9, 2), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(0, 2), (5, 2), (14, 1), (16, 1)],
  term ((2381151079394213691 : Rat) / 149717402626960975) [(0, 2), (5, 2), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(0, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((18152186247908528288 : Rat) / 269491324728529755) [(0, 2), (5, 3), (9, 1), (16, 1)],
  term ((-106311097065672776 : Rat) / 53898264945705951) [(0, 3), (5, 1), (15, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 5988696105078439) [(0, 3), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((632341872967488004 : Rat) / 53898264945705951) [(1, 1), (4, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(1, 1), (4, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 17966088315235317) [(1, 1), (5, 1), (6, 1), (7, 1), (15, 1), (16, 1)],
  term ((-850488776525382208 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((2641207072074697912 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (14, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 1), (5, 1), (6, 1), (14, 2), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(1, 1), (5, 1), (7, 1), (8, 1), (13, 1), (16, 1)],
  term ((-162658589297598376 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((13555823625881600 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-97661702793267200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((108904674647856640 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-172980456656537600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((40434523412147200 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 1), (11, 2), (16, 1)],
  term ((-39475125487333760 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1592081380580128860784 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-39475125487333760 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((834351978002955633392 : Rat) / 4042369870927946325) [(1, 1), (5, 1), (7, 1), (9, 1), (16, 1)],
  term ((-252396728834252800 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((1340007211960668160 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-578618583471380480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (11, 1), (16, 1)],
  term ((119357120807321600 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-73169724907847680 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (9, 2), (13, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((572166300852751360 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2117436463143895040 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 3), (14, 1), (16, 1)],
  term ((815024838214737920 : Rat) / 53898264945705951) [(1, 1), (5, 1), (7, 1), (9, 3), (16, 1)],
  term ((-52437743522044628 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 1), (10, 1), (15, 1), (16, 1)],
  term ((14324988938880830816 : Rat) / 89830441576176585) [(1, 1), (5, 1), (7, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14558390858638521134 : Rat) / 269491324728529755) [(1, 1), (5, 1), (7, 1), (11, 1), (16, 1)],
  term ((-41546018227576328888 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-130768747679443539964 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (13, 1), (16, 1)],
  term ((-145799723957694122432 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((86973679358061867916 : Rat) / 1347456623642648775) [(1, 1), (5, 1), (7, 1), (15, 1), (16, 1)],
  term ((-646501255873655360 : Rat) / 17966088315235317) [(1, 1), (5, 1), (7, 2), (14, 1), (16, 1)],
  term ((110651321137956960 : Rat) / 5988696105078439) [(1, 1), (5, 1), (7, 2), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (14, 2), (16, 1)],
  term ((425244388262691104 : Rat) / 53898264945705951) [(1, 1), (5, 1), (8, 1), (15, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1320603536037348956 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 2), (16, 1)],
  term ((1897029392614988480 : Rat) / 53898264945705951) [(1, 1), (5, 1), (14, 3), (16, 1)],
  term ((-1320603536037348956 : Rat) / 53898264945705951) [(1, 1), (5, 1), (15, 2), (16, 1)],
  term ((-148491200542136320 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((129929800474369280 : Rat) / 5988696105078439) [(1, 1), (5, 2), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((-2181093109335942400 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(1, 1), (5, 2), (7, 1), (8, 1), (16, 1)],
  term ((-64964900237184640 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((5719071054263607296 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2993519044725589568 : Rat) / 53898264945705951) [(1, 1), (5, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-6773315091271198976 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((36670925452949721472 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((950212241095017344 : Rat) / 89830441576176585) [(1, 1), (5, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-68575642372055277056 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 2), (14, 1), (16, 1)],
  term ((33723308809142153728 : Rat) / 269491324728529755) [(1, 1), (5, 2), (7, 1), (9, 2), (16, 1)],
  term ((431797246912509876392 : Rat) / 1347456623642648775) [(1, 1), (5, 2), (7, 1), (14, 1), (16, 1)],
  term ((-4762302158788427382 : Rat) / 149717402626960975) [(1, 1), (5, 2), (7, 1), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((74245600271068160 : Rat) / 5988696105078439) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-64964900237184640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (14, 2), (16, 1)],
  term ((-64964900237184640 : Rat) / 5988696105078439) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(1, 1), (5, 3), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((16202575714108323584 : Rat) / 269491324728529755) [(1, 1), (5, 3), (7, 1), (9, 1), (14, 1), (16, 1)],
  term ((-36304372495817056576 : Rat) / 269491324728529755) [(1, 1), (5, 3), (7, 1), (9, 1), (16, 1)],
  term ((-316170936483744002 : Rat) / 53898264945705951) [(1, 2), (4, 1), (5, 1), (15, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(1, 2), (4, 1), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((8703335477043200 : Rat) / 17966088315235317) [(1, 2), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((850488776525382208 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (8, 1), (16, 1)],
  term ((4763810669040460000 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (14, 1), (16, 1)],
  term ((-3139138017195504232 : Rat) / 53898264945705951) [(1, 2), (5, 1), (7, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (13, 1), (16, 1)],
  term ((-139253367632691200 : Rat) / 53898264945705951) [(1, 2), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(1, 2), (5, 1), (8, 1), (13, 1), (16, 1)],
  term ((-38212788179321324 : Rat) / 5988696105078439) [(1, 2), (5, 1), (8, 1), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((48830851396633600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-54452337323928320 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-20217261706073600 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 1), (11, 2), (16, 1)],
  term ((19737562743666880 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((796040690290064430392 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (9, 1), (14, 1), (16, 1)],
  term ((19737562743666880 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-417175989001477816696 : Rat) / 4042369870927946325) [(1, 2), (5, 1), (9, 1), (16, 1)],
  term ((126198364417126400 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-670003605980334080 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((289309291735690240 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (11, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((36584862453923840 : Rat) / 17966088315235317) [(1, 2), (5, 1), (9, 2), (13, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(1, 2), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-286083150426375680 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 2), (15, 1), (16, 1)],
  term ((1058718231571947520 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (14, 1), (16, 1)],
  term ((-407512419107368960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (9, 3), (16, 1)],
  term ((26218871761022314 : Rat) / 17966088315235317) [(1, 2), (5, 1), (10, 1), (15, 1), (16, 1)],
  term ((-7162494469440415408 : Rat) / 89830441576176585) [(1, 2), (5, 1), (11, 1), (14, 1), (16, 1)],
  term ((7279195429319260567 : Rat) / 269491324728529755) [(1, 2), (5, 1), (11, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (14, 1), (16, 1)],
  term ((65384373839721769982 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (13, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(1, 2), (5, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3490583759365736686 : Rat) / 449152207880882925) [(1, 2), (5, 1), (15, 1), (16, 1)],
  term ((148491200542136320 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-129929800474369280 : Rat) / 5988696105078439) [(1, 2), (5, 2), (7, 1), (9, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(1, 2), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(1, 2), (5, 2), (8, 1), (9, 1), (13, 1), (16, 1)],
  term ((422336152228357760 : Rat) / 53898264945705951) [(1, 2), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(1, 2), (5, 2), (8, 1), (9, 2), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(1, 2), (5, 2), (8, 1), (16, 1)],
  term ((32482450118592320 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-2859535527131803648 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1496759522362794784 : Rat) / 53898264945705951) [(1, 2), (5, 2), (9, 1), (11, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-18335462726474860736 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((499367383010260928 : Rat) / 89830441576176585) [(1, 2), (5, 2), (9, 1), (15, 1), (16, 1)],
  term ((34287821186027638528 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 2), (14, 1), (16, 1)],
  term ((-16861654404571076864 : Rat) / 269491324728529755) [(1, 2), (5, 2), (9, 2), (16, 1)],
  term ((-215898623456254938196 : Rat) / 1347456623642648775) [(1, 2), (5, 2), (14, 1), (16, 1)],
  term ((2381151079394213691 : Rat) / 149717402626960975) [(1, 2), (5, 2), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(1, 2), (5, 3), (8, 1), (9, 1), (16, 1)],
  term ((-8101287857054161792 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (14, 1), (16, 1)],
  term ((18152186247908528288 : Rat) / 269491324728529755) [(1, 2), (5, 3), (9, 1), (16, 1)],
  term ((-425244388262691104 : Rat) / 53898264945705951) [(1, 3), (5, 1), (8, 1), (16, 1)],
  term ((-1897029392614988480 : Rat) / 53898264945705951) [(1, 3), (5, 1), (14, 1), (16, 1)],
  term ((1320603536037348956 : Rat) / 53898264945705951) [(1, 3), (5, 1), (16, 1)],
  term ((-74245600271068160 : Rat) / 5988696105078439) [(1, 3), (5, 2), (8, 1), (9, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 5988696105078439) [(1, 3), (5, 2), (9, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-632341872967488004 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (15, 2), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(4, 1), (5, 1), (14, 2), (15, 1), (16, 1)],
  term ((316170936483744002 : Rat) / 53898264945705951) [(4, 1), (5, 1), (15, 3), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-110651321137956960 : Rat) / 5988696105078439) [(5, 1), (6, 1), (7, 1), (14, 1), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (14, 2), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 1), (7, 1), (15, 2), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (8, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(5, 1), (6, 1), (8, 1), (13, 1), (14, 1), (16, 1)],
  term ((-76425576358642648 : Rat) / 5988696105078439) [(5, 1), (6, 1), (8, 1), (14, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (10, 1), (14, 1), (15, 2), (16, 1)],
  term ((97661702793267200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-13555823625881600 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((-108904674647856640 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-40434523412147200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-834351978002955633392 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((1592081380580128860784 : Rat) / 4042369870927946325) [(5, 1), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((252396728834252800 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((578618583471380480 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-1340007211960668160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((73169724907847680 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-119357120807321600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((-572166300852751360 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(5, 1), (6, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-815024838214737920 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((2117436463143895040 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (14, 2), (16, 1)],
  term ((52437743522044628 : Rat) / 17966088315235317) [(5, 1), (6, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((14558390858638521134 : Rat) / 269491324728529755) [(5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((-14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (6, 1), (11, 1), (14, 2), (16, 1)],
  term ((130768747679443539964 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((41546018227576328888 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (13, 1), (14, 2), (16, 1)],
  term ((-6981167518731473372 : Rat) / 449152207880882925) [(5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((50295504166166458432 : Rat) / 1347456623642648775) [(5, 1), (6, 1), (14, 2), (15, 1), (16, 1)],
  term ((-8703335477043200 : Rat) / 17966088315235317) [(5, 1), (6, 1), (15, 3), (16, 1)],
  term ((17406670954086400 : Rat) / 17966088315235317) [(5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (7, 1), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-19769855432224564012 : Rat) / 149717402626960975) [(5, 1), (7, 1), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((-76425576358642648 : Rat) / 5988696105078439) [(5, 1), (7, 1), (8, 1), (15, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (11, 1), (15, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((-13555823625881600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((97661702793267200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-108904674647856640 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((172980456656537600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (11, 2), (14, 1), (15, 1), (16, 1)],
  term ((-40434523412147200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 1), (11, 2), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((1592081380580128860784 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-834351978002955633392 : Rat) / 4042369870927946325) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((39475125487333760 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)],
  term ((252396728834252800 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)],
  term ((-1340007211960668160 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((578618583471380480 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-119357120807321600 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((73169724907847680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((-572166300852751360 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((2117436463143895040 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (14, 1), (15, 1), (16, 1)],
  term ((-815024838214737920 : Rat) / 53898264945705951) [(5, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((52437743522044628 : Rat) / 17966088315235317) [(5, 1), (7, 1), (10, 1), (15, 2), (16, 1)],
  term ((-14324988938880830816 : Rat) / 89830441576176585) [(5, 1), (7, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((14558390858638521134 : Rat) / 269491324728529755) [(5, 1), (7, 1), (11, 1), (15, 1), (16, 1)],
  term ((41546018227576328888 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((130768747679443539964 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (13, 1), (15, 1), (16, 1)],
  term ((26704457231682622432 : Rat) / 1347456623642648775) [(5, 1), (7, 1), (14, 1), (15, 2), (16, 1)],
  term ((55325660568978480 : Rat) / 5988696105078439) [(5, 1), (7, 1), (14, 2), (16, 1)],
  term ((-323250627936827680 : Rat) / 17966088315235317) [(5, 1), (7, 1), (14, 3), (16, 1)],
  term ((-2831742976058087372 : Rat) / 449152207880882925) [(5, 1), (7, 1), (15, 2), (16, 1)],
  term ((646501255873655360 : Rat) / 17966088315235317) [(5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-110651321137956960 : Rat) / 5988696105078439) [(5, 1), (7, 2), (15, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-17406670954086400 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (15, 4), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 2), (15, 3), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (14, 2), (16, 1)],
  term ((9884927716112282006 : Rat) / 149717402626960975) [(5, 1), (8, 1), (13, 1), (15, 2), (16, 1)],
  term ((38212788179321324 : Rat) / 5988696105078439) [(5, 1), (8, 1), (14, 2), (15, 1), (16, 1)],
  term ((38212788179321324 : Rat) / 5988696105078439) [(5, 1), (8, 1), (15, 3), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((17406670954086400 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (11, 1), (15, 3), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (14, 2), (15, 2), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(5, 1), (9, 1), (10, 1), (15, 4), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-48830851396633600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 2), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(5, 1), (9, 1), (11, 1), (13, 1), (14, 3), (16, 1)],
  term ((-48830851396633600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 3), (16, 1)],
  term ((54452337323928320 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 2), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (14, 3), (15, 1), (16, 1)],
  term ((54452337323928320 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 1), (15, 3), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 1), (15, 2), (16, 1)],
  term ((20217261706073600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (14, 2), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(5, 1), (9, 1), (11, 2), (14, 3), (16, 1)],
  term ((20217261706073600 : Rat) / 17966088315235317) [(5, 1), (9, 1), (11, 2), (15, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (14, 2), (15, 1), (16, 1)],
  term ((-19737562743666880 : Rat) / 53898264945705951) [(5, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((-796040690290064430392 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (14, 2), (15, 2), (16, 1)],
  term ((417175989001477816696 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 2), (16, 1)],
  term ((-796040690290064430392 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (14, 3), (16, 1)],
  term ((417175989001477816696 : Rat) / 4042369870927946325) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-19737562743666880 : Rat) / 5988696105078439) [(5, 1), (9, 1), (15, 4), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-126198364417126400 : Rat) / 53898264945705951) [(5, 1), (9, 2), (10, 1), (15, 3), (16, 1)],
  term ((670003605980334080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-289309291735690240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 2), (16, 1)],
  term ((670003605980334080 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (14, 3), (16, 1)],
  term ((-289309291735690240 : Rat) / 53898264945705951) [(5, 1), (9, 2), (11, 1), (15, 2), (16, 1)],
  term ((59678560403660800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-36584862453923840 : Rat) / 17966088315235317) [(5, 1), (9, 2), (13, 1), (14, 2), (16, 1)],
  term ((59678560403660800 : Rat) / 53898264945705951) [(5, 1), (9, 2), (13, 1), (14, 3), (16, 1)],
  term ((-36584862453923840 : Rat) / 17966088315235317) [(5, 1), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 1), (15, 3), (16, 1)],
  term ((286083150426375680 : Rat) / 53898264945705951) [(5, 1), (9, 2), (14, 2), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(5, 1), (9, 2), (14, 3), (15, 1), (16, 1)],
  term ((286083150426375680 : Rat) / 53898264945705951) [(5, 1), (9, 2), (15, 3), (16, 1)],
  term ((-1058718231571947520 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 1), (15, 2), (16, 1)],
  term ((407512419107368960 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 2), (16, 1)],
  term ((-1058718231571947520 : Rat) / 53898264945705951) [(5, 1), (9, 3), (14, 3), (16, 1)],
  term ((407512419107368960 : Rat) / 53898264945705951) [(5, 1), (9, 3), (15, 2), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-26218871761022314 : Rat) / 17966088315235317) [(5, 1), (10, 1), (15, 3), (16, 1)],
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-7279195429319260567 : Rat) / 269491324728529755) [(5, 1), (11, 1), (14, 2), (16, 1)],
  term ((7162494469440415408 : Rat) / 89830441576176585) [(5, 1), (11, 1), (14, 3), (16, 1)],
  term ((-7279195429319260567 : Rat) / 269491324728529755) [(5, 1), (11, 1), (15, 2), (16, 1)],
  term ((-20773009113788164444 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((-65384373839721769982 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 2), (16, 1)],
  term ((-20773009113788164444 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (14, 3), (16, 1)],
  term ((-65384373839721769982 : Rat) / 1347456623642648775) [(5, 1), (13, 1), (15, 2), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 1), (15, 3), (16, 1)],
  term ((3490583759365736686 : Rat) / 449152207880882925) [(5, 1), (14, 2), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(5, 1), (14, 3), (15, 1), (16, 1)],
  term ((3490583759365736686 : Rat) / 449152207880882925) [(5, 1), (15, 3), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(5, 2), (6, 1), (8, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((844672304456715520 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 2), (6, 1), (8, 1), (9, 2), (14, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 2), (6, 1), (8, 1), (14, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((2993519044725589568 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-5719071054263607296 : Rat) / 53898264945705951) [(5, 2), (6, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-36670925452949721472 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6773315091271198976 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((998734766020521856 : Rat) / 89830441576176585) [(5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-33723308809142153728 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 1), (16, 1)],
  term ((68575642372055277056 : Rat) / 269491324728529755) [(5, 2), (6, 1), (9, 2), (14, 2), (16, 1)],
  term ((4762302158788427382 : Rat) / 149717402626960975) [(5, 2), (6, 1), (14, 1), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(5, 2), (6, 1), (14, 2), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(5, 2), (7, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3342491821736034176 : Rat) / 29943480525392195) [(5, 2), (7, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((844672304456715520 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(5, 2), (7, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((19769855432224564012 : Rat) / 149717402626960975) [(5, 2), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((64964900237184640 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (10, 1), (15, 2), (16, 1)],
  term ((-5719071054263607296 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((2993519044725589568 : Rat) / 53898264945705951) [(5, 2), (7, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((6773315091271198976 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (13, 1), (14, 1), (15, 1), (16, 1)],
  term ((-36670925452949721472 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((998734766020521856 : Rat) / 89830441576176585) [(5, 2), (7, 1), (9, 1), (15, 2), (16, 1)],
  term ((68575642372055277056 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-33723308809142153728 : Rat) / 269491324728529755) [(5, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-431797246912509876392 : Rat) / 1347456623642648775) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((4762302158788427382 : Rat) / 149717402626960975) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(5, 2), (8, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-1671245910868017088 : Rat) / 29943480525392195) [(5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-422336152228357760 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-422336152228357760 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 1), (15, 3), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (14, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(5, 2), (8, 1), (9, 2), (15, 2), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (8, 1), (14, 2), (16, 1)],
  term ((-9884927716112282006 : Rat) / 149717402626960975) [(5, 2), (8, 1), (15, 2), (16, 1)],
  term ((-32482450118592320 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (14, 2), (15, 1), (16, 1)],
  term ((-32482450118592320 : Rat) / 53898264945705951) [(5, 2), (9, 1), (10, 1), (15, 3), (16, 1)],
  term ((2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1496759522362794784 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 2), (16, 1)],
  term ((2859535527131803648 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (14, 3), (16, 1)],
  term ((-1496759522362794784 : Rat) / 53898264945705951) [(5, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-3386657545635599488 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 1), (15, 2), (16, 1)],
  term ((18335462726474860736 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-3386657545635599488 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (14, 3), (16, 1)],
  term ((18335462726474860736 : Rat) / 269491324728529755) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 1), (15, 3), (16, 1)],
  term ((-499367383010260928 : Rat) / 89830441576176585) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(5, 2), (9, 1), (14, 3), (15, 1), (16, 1)],
  term ((-499367383010260928 : Rat) / 89830441576176585) [(5, 2), (9, 1), (15, 3), (16, 1)],
  term ((-34287821186027638528 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 1), (15, 2), (16, 1)],
  term ((16861654404571076864 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 2), (16, 1)],
  term ((-34287821186027638528 : Rat) / 269491324728529755) [(5, 2), (9, 2), (14, 3), (16, 1)],
  term ((16861654404571076864 : Rat) / 269491324728529755) [(5, 2), (9, 2), (15, 2), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (14, 1), (15, 2), (16, 1)],
  term ((-2381151079394213691 : Rat) / 149717402626960975) [(5, 2), (14, 2), (16, 1)],
  term ((215898623456254938196 : Rat) / 1347456623642648775) [(5, 2), (14, 3), (16, 1)],
  term ((-2381151079394213691 : Rat) / 149717402626960975) [(5, 2), (15, 2), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(5, 3), (6, 1), (8, 1), (9, 1), (14, 1), (16, 1)],
  term ((36304372495817056576 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(5, 3), (6, 1), (9, 1), (14, 2), (16, 1)],
  term ((-3342491821736034176 : Rat) / 29943480525392195) [(5, 3), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16202575714108323584 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((36304372495817056576 : Rat) / 269491324728529755) [(5, 3), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (14, 2), (16, 1)],
  term ((1671245910868017088 : Rat) / 29943480525392195) [(5, 3), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 1), (15, 2), (16, 1)],
  term ((-18152186247908528288 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 2), (16, 1)],
  term ((8101287857054161792 : Rat) / 269491324728529755) [(5, 3), (9, 1), (14, 3), (16, 1)],
  term ((-18152186247908528288 : Rat) / 269491324728529755) [(5, 3), (9, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 18, terms 0 through 66. -/
theorem rs_R010_ueqv_R010YNN_block_18_0000_0066_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_18_0000_0066
      rs_R010_ueqv_R010YNN_block_18_0000_0066 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
