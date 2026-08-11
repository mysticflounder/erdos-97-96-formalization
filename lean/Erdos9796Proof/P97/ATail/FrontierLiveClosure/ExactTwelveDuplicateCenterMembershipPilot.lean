/-
Generated membership-core bank coordinator from scratch/sidecar-sourcefaithful-common-missing-20260807-a7f3c1/ordered-cegar-jd0-v4/journal.jsonl
Journal SHA-256: 4d2ac12341f5981cf988c7add8b547e2840f26c2395161b124d73373124e8db3
Distinct duplicate-center membership cores: 100

This module proves record validity only.  Coverage remains a separate theorem.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_001
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_002
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_003
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_004

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilot

open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate

abbrev Label := Fin 12

def bank : List (DuplicateCenterNogood Label) :=
  Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_001.bank ++ Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_002.bank ++ Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_003.bank ++ Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_004.bank

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  intro nogood hmem
  simp only [bank, List.mem_append] at hmem
  rcases hmem with hmem | hmem
  · exact Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_001.bank_valid nogood hmem
  rcases hmem with hmem | hmem
  · exact Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_002.bank_valid nogood hmem
  rcases hmem with hmem | hmem
  · exact Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_003.bank_valid nogood hmem
  exact Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilotShards.Part_004.bank_valid nogood hmem

end Problem97.ATailFrontierLiveClosure.ExactTwelveDuplicateCenterMembershipPilot
