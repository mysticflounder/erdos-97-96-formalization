/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Soundness

/-!
# Relaxed split certificate payloads

This module defines the stable proof-facing interface shared by generated
relaxed split certificates and their semantic soundness proofs.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

/-- Algebraic payload carried by a generated relaxed split surplus certificate row. -/
inductive CertificatePayload where
  | direct (cert : Certificate)
  | productSum (products : List Poly)

/-- Run the Boolean checker associated with a relaxed split certificate payload. -/
def CertificatePayload.check : CertificatePayload -> Bool
  | .direct cert => checkCertificate cert
  | .productSum products => checkProductSum products

/-- Semantic zero condition needed by a generated relaxed split payload. -/
def CertificatePayload.evaluationZeros
    (payload : CertificatePayload) (nu : Nat -> Real) : Prop :=
  match payload with
  | .direct data => ∀ g ∈ data.generators, evalPoly nu g = 0
  | .productSum products => ∀ p ∈ products, evalPoly nu p = 0

/-- One checked relaxed split surplus certificate fact. -/
structure VerifiedCertificate where
  id : String
  payload : CertificatePayload
  valid : payload.check = true

/-- Run the Boolean checker associated with a verified relaxed split certificate. -/
def VerifiedCertificate.check (cert : VerifiedCertificate) : Bool :=
  cert.payload.check

end RelaxedSplit

end SurplusCertificate

end Problem97
