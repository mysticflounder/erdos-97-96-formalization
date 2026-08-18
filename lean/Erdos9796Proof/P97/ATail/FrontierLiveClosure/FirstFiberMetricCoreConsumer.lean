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

/-- Exact-row-facing form of the metric-core consumer.  The existential ties
the installed faithful carrier to the supplied exact-row packet and supplies
its metric core.
-/
theorem false_of_firstFiberExactRows_metricCore
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (outsideRows :
      ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H q hq c₀ c₁ c₂ c₃ c₄)
    (hcore : ∃ B :
      ATailFiveCenterDeletionBoundary.FiveSurvivorFaithfulCarrierBoundary
        D H q hq c₀ c₁ c₂ c₃ c₄,
      B.rows = outsideRows ∧ MetricCoreAlternative B.carrierPattern) : False := by
  rcases hcore with ⟨B, _, hmetric⟩
  exact false_of_firstFiberFaithfulCarrierBoundary_metricCore B hmetric

/-- Coverage-contract form of the exact-row consumer.  Once the five centers
are known to be actual carrier points and distinct, the source boundary
itself supplies the faithful carrier.  A producer only has to prove the
universal metric-core coverage statement for faithful carriers whose rows are
this exact packet. -/
theorem false_of_firstFiberExactRows_metricCoreCoverage
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {q : ℝ²} {hq : q ∈ D.A} {c₀ c₁ c₂ c₃ c₄ : ℝ²}
    (outsideRows :
      ATailFiveCenterDeletionBoundary.FiveSurvivorExactRowsBoundary
        D H q hq c₀ c₁ c₂ c₃ c₄)
    (hc₀ : c₀ ∈ D.A) (hc₁ : c₁ ∈ D.A) (hc₂ : c₂ ∈ D.A)
    (hc₃ : c₃ ∈ D.A) (hc₄ : c₄ ∈ D.A)
    (hcenters : ({c₀, c₁, c₂, c₃, c₄} : Finset ℝ²).card = 5)
    (hcoverage : ∀ B :
      ATailFiveCenterDeletionBoundary.FiveSurvivorFaithfulCarrierBoundary
        D H q hq c₀ c₁ c₂ c₃ c₄,
      B.rows = outsideRows → MetricCoreAlternative B.carrierPattern) : False := by
  rcases
      ATailFiveCenterDeletionBoundary.exists_faithfulCarrierPattern_with_fiveSurvivorClasses
        outsideRows hc₀ hc₁ hc₂ hc₃ hc₄ hcenters with
    ⟨carrierPattern, h₀, h₁, h₂, h₃, h₄⟩
  let B : ATailFiveCenterDeletionBoundary.FiveSurvivorFaithfulCarrierBoundary
      D H q hq c₀ c₁ c₂ c₃ c₄ := {
    rows := outsideRows
    c₀_mem := hc₀
    c₁_mem := hc₁
    c₂_mem := hc₂
    c₃_mem := hc₃
    c₄_mem := hc₄
    centers_card := hcenters
    carrierPattern := carrierPattern
    classAt₀_eq := h₀
    classAt₁_eq := h₁
    classAt₂_eq := h₂
    classAt₃_eq := h₃
    classAt₄_eq := h₄ }
  exact false_of_firstFiberFaithfulCarrierBoundary_metricCore B
    (hcoverage B rfl)

end FirstFiberMetricCoreConsumer
end ATailFrontierLiveClosure
end Problem97
