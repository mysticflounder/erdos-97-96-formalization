/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Soundness
import Erdos9796Proof.P97.SurplusCertificate.RelaxedSplit.All

/-!
# Soundness for generated relaxed split surplus certificate aggregates

This module connects the checked relaxed split surplus certificate payloads to
the shared polynomial-certificate soundness theorems.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Semantic zero condition needed by a generated relaxed split payload. -/
def CertificatePayload.evaluationZeros
    (payload : CertificatePayload) (ν : Nat → ℝ) : Prop :=
  match payload with
  | .direct data => ∀ g ∈ data.generators, evalPoly ν g = 0
  | .productSum products => ∀ p ∈ products, evalPoly ν p = 0

/-- A checked direct relaxed split payload contradicts any real assignment that
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

/-- A checked product-sum relaxed split payload contradicts any real assignment
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

/-- A checked relaxed split aggregate payload contradicts any real assignment
satisfying the payload's zero-evaluation condition. -/
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

end RelaxedSplit

end SurplusCertificate

end Problem97
