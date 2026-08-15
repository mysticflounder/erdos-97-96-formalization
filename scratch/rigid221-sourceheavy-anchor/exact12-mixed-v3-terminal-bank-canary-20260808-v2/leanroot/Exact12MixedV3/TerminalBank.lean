import Exact12MixedV3.TerminalBankShards.Part_001
import Exact12MixedV3.TerminalBankShards.Part_002

/-!
Generated typed terminal-bank coordinator from /Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/rigid221-sourceheavy-anchor/exact12-mixed-v3-terminal-bank-canary-20260808-v2/prepared
Receipt SHA-256: 91721ce408df784abf6f16f97e804bd26935fbea897ad6aca0aa4fa482feff7a
Terminal-bank manifest SHA-256: 47762d545ff1a841473ec2565b6686c5cdcf15c92ed6ee5f42005f50a36cc61a
Entries: 2

This module materializes the finite typed bank only.  Terminal compact-RUP
replay, exact DIMACS equality, aggregate coverage, the universal lift, and
live-theorem closure remain separate obligations.
-/

namespace Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.GeneratedTerminalBank

open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.SourceOrderTerminalBankConsumer

def bank : List SourceOrderPositiveNogood :=
  Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.GeneratedTerminalBankShards.Part_001.bank ++ Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.GeneratedTerminalBankShards.Part_002.bank

theorem bank_length : bank.length = 2 := by
  native_decide

end Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.GeneratedTerminalBank
