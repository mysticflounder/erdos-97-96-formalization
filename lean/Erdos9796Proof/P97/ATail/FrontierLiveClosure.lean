/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletionCore
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1Live
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletionCollision
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavy
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221SourceHeavyCommonDeletion
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Closure
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TriApexEndpointRetainedOmission
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdFiber
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdTwoRowSixPointIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFreshThirdResidual
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdQFiberThreeSynchronization
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdQFiberThreeCarrierFiniteCnfIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.FreshThirdQFiberThreeCarrierFiniteSourceTotalIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceFirstFiberCollision
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceClosure
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceRetainedMinimalCore
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceAlignedLowHits
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Coordinator

/-!
# Live large-cap frontier closure boundary

The old Route-B tail asked for an impossible double-apex equal-radius pair and
then immediately refuted it.  The live parent already has global minimality,
the no-M44 hypothesis, and a concrete critical-shell system, so its honest
residual is the exhaustive `CriticalPairFrontier` split instead.  This module
keeps those hypotheses on both remaining arms and exposes no LIVE slot or
center classification.

The declarations below are deliberately parent-facing: a future proof must
consume the full frontier and the physical-second-apex split of its genuine
common-deletion packet, rather than manufacture the already-impossible
shared-radius pair.
-/
