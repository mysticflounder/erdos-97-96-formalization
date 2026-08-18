/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceSafeIngress

/-!
# FirstFiber metric-core consumer

This module exposes the source-safe metric-core consumer to FirstFiber
producers.  The producer supplies the faithful five-survivor carrier boundary
and the `MetricCoreAlternative`; the exact-twelve ingress supplies the generic
contradiction.  No FirstFiber role coverage or two-source collision module is
imported here.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace FirstFiberMetricCoreConsumer

open scoped EuclideanGeometry
open Census554.GeneralCarrierBridge

/-- A faithful five-survivor boundary together with a metric-core alternative
is contradictory by the exact-twelve source-safe consumer. -/
theorem false_of_firstFiberFaithfulCarrierBoundary_metricCore
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (B : ATailFiveCenterDeletionBoundary.FiveSurvivorFaithfulCarrierBoundary
      D H q hq c₀ c₁ c₂ c₃ c₄)
    (hcore : MetricCoreAlternative B.carrierPattern) : False :=
  ExactTwelveRigid221Ingress.false_of_fiveSurvivorFaithfulCarrierBoundary_metricCore
    B hcore

end FirstFiberMetricCoreConsumer
end ATailFrontierLiveClosure
end Problem97
