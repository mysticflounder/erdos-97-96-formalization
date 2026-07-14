/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.SixPointNestedCenterOrderCore

/-!
# Round-14 `(5,5,5)` adapter

For assignment digest
`8ae8d4701ed9f6fcff7aa521d5cc46564ae327871d64a2c819d9f2104aaa5ecf`,
instantiate the production core by

`(O,A,D,E,X,C) = (0,1,3,4,5,2)`.

The seven equality closures use only four rows:

* row `0:{1,2,3,4}` gives `OA=OC`, `OA=OD`, and `OA=OE`;
* row `1:{0,2,6,7}` plus edge reversal gives `OA=AC`;
* row `3:{1,4,5,6}` gives `DA=DE` and `DA=DX`; and
* row `4:{0,5,8,11}` gives `EO=EX`.

Row 2 and labels 6 through 11 are not used.  The needed cyclic signs are
`OAC`, `OAD`, `ADC`, `ODE`, and `OEX`; both global orientations are supported
by the production consumers.
-/

#check Problem97.Census554.SixPointNestedCenterOrderCore.Core
#check Problem97.Census554.SixPointNestedCenterOrderCore.metric_orientation_incompatibility
#check Problem97.Census554.SixPointNestedCenterOrderCore.false_of_core
#check Problem97.Census554.SixPointNestedCenterOrderCore.false_of_core_of_neg

#print axioms Problem97.Census554.SixPointNestedCenterOrderCore.false_of_core
#print axioms Problem97.Census554.SixPointNestedCenterOrderCore.false_of_core_of_neg
