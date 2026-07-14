/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.SixPointTwoCircleOrderCore

/-!
# `(5,5,5)` residual adapter

The exact residual-label map into the production six-point core is

`A = 0`, `P = 9`, `Q = 11`, `B = 1`, `D = 3`, `C = 2`.

This is the subsequence `0,9,11,1,3,2` of the twelve-label hull order
`0,9,10,11,1,3,4,5,2,6,7,8`.  The five closure hypotheses are supplied by

* `AB = AC = AD` from the row centered at label `0`;
* `AB = BC` from the row centered at label `1`;
* `CD = CP` from the row centered at label `2`; and
* `DA = DQ` from the row centered at label `3`.

The production consumer uses only those equalities and the seven orientation
signs inherited from strict cyclic order.  It assumes no exact-row exclusions
and uses none of the other six labels.
-/

#check Problem97.Census554.SixPointTwoCircleOrderCore.Core
#check Problem97.Census554.SixPointTwoCircleOrderCore.six_point_twoCircle_order_incompatible
#check Problem97.Census554.SixPointTwoCircleOrderCore.false_of_core
#check Problem97.Census554.SixPointTwoCircleOrderCore.false_of_core_of_neg

#print axioms Problem97.Census554.SixPointTwoCircleOrderCore.false_of_core
#print axioms Problem97.Census554.SixPointTwoCircleOrderCore.false_of_core_of_neg
