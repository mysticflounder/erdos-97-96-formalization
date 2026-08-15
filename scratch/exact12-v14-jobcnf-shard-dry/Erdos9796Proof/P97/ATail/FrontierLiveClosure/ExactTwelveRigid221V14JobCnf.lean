import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step_01
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step_02
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step_03
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step_04
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14JobCnfShard.Step_05

/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221V14SourceJobBridge
import Erdos9796Proof.P97.Census554.SinzSat

/-!
# Exact variable layout for normalized-v14 jobs

This module mirrors the auxiliary-variable allocation performed by
`census/card_head/exact12_v14_valuation.py`.  Starting at the frozen
source-faithful base-CNF counter, the compiler allocates five blocks of ten
blocker variables and ten bound-one Sinz variables, followed by the
center-wise bound-one Sinz blocks.

The definitions below are the proof-facing variable-map contract.  They do
not yet claim that the complete emitted clause list is satisfied or that any
terminal journal covers the 648 jobs.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace FrozenV14JobCnf

open Census554.CoverCnf
open Census554.EqualityCore
open SafeCoverCnf
open ExactTwelveCarrierIngress

/-- Joint-deletion label of a frozen job. -/

