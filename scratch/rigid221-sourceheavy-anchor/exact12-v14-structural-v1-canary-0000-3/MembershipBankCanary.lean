/-
Generated membership-core bank coordinator from scratch/rigid221-sourceheavy-anchor/exact12-v14-structural-v1-canary-0000-3/journal.jsonl
Journal SHA-256: 3708cf60f9cce9fb5b04565c9ee783b062cb60b540dfbabefc4b634b3284e264
Distinct duplicate-center membership cores: 1

This module proves record validity only.  Coverage remains a separate theorem.
-/

import Scratch.Exact12V14Cell0MembershipBankCanaryShards.Part_001

namespace Scratch.Exact12V14Cell0MembershipBankCanary

open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate

abbrev Label := Fin 12

def bank : List (DuplicateCenterNogood Label) :=
  Scratch.Exact12V14Cell0MembershipBankCanaryShards.Part_001.bank

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  intro nogood hmem
  simp only [bank, List.mem_append] at hmem
  exact Scratch.Exact12V14Cell0MembershipBankCanaryShards.Part_001.bank_valid nogood hmem

end Scratch.Exact12V14Cell0MembershipBankCanary
