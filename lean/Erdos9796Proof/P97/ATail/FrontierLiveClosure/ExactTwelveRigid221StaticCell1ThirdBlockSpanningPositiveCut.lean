/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221BlockSpanningCommonFiveCertificate

/-!
# Exact-twelve static cell-1 third block-spanning positive cut

Exact minimization of the common-five replay for the second static cell-1
survivor shows that one core covers all 48 source orders.  Only three selected
rows are needed, giving the clause `(-61, -175, -912)`.

This file packages that finite learned cut.  It does not prove terminal UNSAT,
all-cell coverage, an arbitrary-cardinality lift, or closure of a live leaf.

The exact-support clause is retained as the original replay checkpoint.  The
same geometric certificate only needs the displayed positive memberships, so
the partial row choices below package the stronger predicate used by the CNF
membership bridge.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate
open SourceOrderTerminalBankConsumer

/-- The three full-support rows used by the block-spanning core. -/
def staticCell1ThirdBlockSpanningPositiveChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 3, 6, 8} }
  , { center := 3, support := {0, 1, 4, 5} }
  , { center := 5, support := {0, 6, 7, 9} } ]

/-- The source-order proof only consumes these positive memberships. -/
def staticCell1ThirdBlockSpanningMembershipChoices : List (RowChoice Label) :=
  [ { center := 1, support := {0, 6} }
  , { center := 3, support := {0, 1, 5} }
  , { center := 5, support := {0, 6} } ]

/-- The single common-five core `(6,5,0,3,1)`. -/
def staticCell1ThirdBlockSpanningData : BlockSpanningCommonFiveData :=
  { a := 6, x := 5, c := 3 }

/-- The minimized three-row cut, checked entirely by evaluation. -/
def staticCell1ThirdBlockSpanningPositiveNogood : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofBlockSpanningCommonFive
    staticCell1ThirdBlockSpanningPositiveChoices
    staticCell1ThirdBlockSpanningData
    (by native_decide)

/-- The predicate-level cut used by the positive-membership CNF extension. -/
def staticCell1ThirdBlockSpanningMembershipPositiveNogood : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofBlockSpanningCommonFive
    staticCell1ThirdBlockSpanningMembershipChoices
    staticCell1ThirdBlockSpanningData
    (by native_decide)

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
