/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Patterns.All
import Erdos9796Proof.P97.EndpointCertificate.Soundness

/-!
# Soundness for generated endpoint certificate aggregates

This module connects the checked aggregate row payloads from `Patterns.All` to
the semantic checker soundness theorems.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

/-- Semantic zero condition needed by a generated aggregate payload. -/
def CertificatePayload.evaluationZeros
    (payload : CertificatePayload) (ν : Nat → ℝ) : Prop :=
  match payload with
  | .direct data => ∀ g ∈ data.generators, evalPoly ν g = 0
  | .productSum products => ∀ p ∈ products, evalPoly ν p = 0

/-- Coefficient-aware semantic zero condition for a generated aggregate
payload.  Direct certificates only need each coefficient-generator product to
vanish; product-sum certificates already store those products directly. -/
def CertificatePayload.weightedEvaluationZeros
    (payload : CertificatePayload) (ν : Nat → ℝ) : Prop :=
  match payload with
  | .direct data =>
      ∀ g c, (g, c) ∈ data.generators.zip data.coefficients →
        evalPoly ν c * evalPoly ν g = 0
  | .productSum products => ∀ p ∈ products, evalPoly ν p = 0

/-- The coefficient-aware zero condition is a weakening of the existing
all-generators zero condition. -/
theorem CertificatePayload.weightedEvaluationZeros_of_evaluationZeros
    {payload : CertificatePayload} {ν : Nat → ℝ}
    (hzero : payload.evaluationZeros ν) :
    payload.weightedEvaluationZeros ν := by
  cases payload with
  | direct data =>
      intro g c hmem
      have hg : evalPoly ν g = 0 := hzero g (List.of_mem_zip hmem).1
      simp [hg]
  | productSum products =>
      exact hzero

/-- A checked direct aggregate payload contradicts any real assignment that
zeros all of its generators. -/
theorem false_of_verifiedDirectCertificate
    (ν : Nat → ℝ) {cert : VerifiedCertificate}
    {data : Problem97.EndpointCertificate.Certificate}
    (hpayload : cert.payload = .direct data)
    (hgenerators : ∀ g ∈ data.generators, evalPoly ν g = 0) :
    False := by
  have hcheck : checkCertificate data = true := by
    have hvalid : cert.payload.check = true := cert.valid
    simpa [CertificatePayload.check, hpayload] using hvalid
  exact false_of_checkCertificate ν data hcheck hgenerators

/-- A checked direct aggregate payload contradicts any real assignment whose
coefficient-generator products vanish. -/
theorem false_of_verifiedDirectCertificate_weighted
    (ν : Nat → ℝ) {cert : VerifiedCertificate}
    {data : Problem97.EndpointCertificate.Certificate}
    (hpayload : cert.payload = .direct data)
    (hweighted : ∀ g c, (g, c) ∈ data.generators.zip data.coefficients →
      evalPoly ν c * evalPoly ν g = 0) :
    False := by
  have hcheck : checkCertificate data = true := by
    have hvalid : cert.payload.check = true := cert.valid
    simpa [CertificatePayload.check, hpayload] using hvalid
  exact false_of_checkCertificate_of_weighted_zeros ν data hcheck hweighted

/-- A checked product-sum aggregate payload contradicts any real assignment
that zeros all of its listed products. -/
theorem false_of_verifiedProductSum
    (ν : Nat → ℝ) {cert : VerifiedCertificate} {products : List Poly}
    (hpayload : cert.payload = .productSum products)
    (hproducts : ∀ p ∈ products, evalPoly ν p = 0) :
    False := by
  have hcheck : checkProductSum products = true := by
    have hvalid : cert.payload.check = true := cert.valid
    simpa [CertificatePayload.check, hpayload] using hvalid
  exact false_of_checkProductSum ν products hcheck hproducts

/-- A checked aggregate payload contradicts any real assignment satisfying the
payload's zero-evaluation condition. -/
theorem false_of_verifiedCertificate
    (ν : Nat → ℝ) (cert : VerifiedCertificate)
    (hzero : cert.payload.evaluationZeros ν) :
    False := by
  cases hpayload : cert.payload with
  | direct data =>
      exact false_of_verifiedDirectCertificate ν hpayload
        (by
          simpa [CertificatePayload.evaluationZeros, hpayload] using hzero)
  | productSum products =>
      exact false_of_verifiedProductSum ν hpayload
        (by
          simpa [CertificatePayload.evaluationZeros, hpayload] using hzero)

/-- A checked aggregate payload contradicts any real assignment satisfying the
coefficient-aware zero-evaluation condition. -/
theorem false_of_verifiedCertificate_weighted
    (ν : Nat → ℝ) (cert : VerifiedCertificate)
    (hzero : cert.payload.weightedEvaluationZeros ν) :
    False := by
  cases hpayload : cert.payload with
  | direct data =>
      exact false_of_verifiedDirectCertificate_weighted ν hpayload
        (by
          simpa [CertificatePayload.weightedEvaluationZeros, hpayload]
            using hzero)
  | productSum products =>
      exact false_of_verifiedProductSum ν hpayload
        (by
          simpa [CertificatePayload.weightedEvaluationZeros, hpayload]
            using hzero)

end Patterns

end EndpointCertificate

end Problem97
