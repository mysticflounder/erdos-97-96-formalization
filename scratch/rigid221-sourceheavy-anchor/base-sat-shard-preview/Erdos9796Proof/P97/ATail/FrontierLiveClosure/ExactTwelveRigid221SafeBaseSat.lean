import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeBaseSatShards.Step_01
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeBaseSatShards.Step_02
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeBaseSatShards.Step_03

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCoverCnf
import Erdos9796Proof.P97.Census554.BaseSat
import Erdos9796Proof.P97.Census554.SinzSat

/-!
# Satisfiability of the base cover CNF from an index-level class choice

Given an index-level selection `idx p < candCount p` of one candidate class per
center that obeys the index-level analogues of the `C2` and `C4` cube
constraints, we build an explicit satisfying assignment for the base cover CNF
`baseDimacs` (equivalently `baseCnf`).

The assignment is built in three layers, mirroring the encoder:

* `baseAssign` sets exactly the twelve chosen `x` variables true;
* `onehotExt` extends through the one-hot Sinz blocks (one `sinzExt` per center);
* `c4Ext` extends through the `C4` Sinz blocks (one `sinzExt` per center/point
  pair, threading the variable counter exactly as `c4Fold` does).

`C2` clauses are satisfied directly by contradiction from `hc2`, not through a
Sinz witness.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SafeCoverCnf

open Census554.CoverCnf

/- ## List prefix-sum toolkit -/

/-- Prefix sum of `take (p+1)` splits off the `p`-th element. -/

