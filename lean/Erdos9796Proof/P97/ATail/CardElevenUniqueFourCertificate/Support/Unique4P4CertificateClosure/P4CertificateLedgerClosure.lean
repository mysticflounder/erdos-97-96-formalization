/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4CertificateClosure.P4CertificateSemantics
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4CertificateClosure.P4CompactFormulaLedger

/-!
# P4 authenticated-ledger replay consequence

This is only the certificate side of the P4 source-to-CNF ingress.  Once the
generated ledger has authenticated the ordered C0000 clause list, any single
valuation that satisfies every ledger clause contradicts the checked compact
two-shard RUP replay.  It deliberately contains no geometric satisfaction
claim and therefore does not resolve an orientation branch or a production
`sorry` on its own.
-/

namespace Problem97
namespace P4ExactTwoCertificateClosureScratch

theorem false_of_p4CompactLedger_sat (v : Nat → Prop)
    (h : ∀ clause ∈ p4CompactLedger, clauseSat v clause) : False := by
  apply false_of_checkpoint0_signedClauses_sat v
  intro clause hclause
  rw [checkpoint0_signedClauses_eq_p4CompactLedger] at hclause
  exact h clause hclause

end P4ExactTwoCertificateClosureScratch
end Problem97

#print axioms Problem97.P4ExactTwoCertificateClosureScratch.false_of_p4CompactLedger_sat
