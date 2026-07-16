/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Scratch: rebasing a critical-pair frontier to another critical-shell system

The geometric survivor pair and both apex deletion facts used by a
`CriticalPairFrontier` do not depend on the particular chosen
`CriticalShellSystem`.  Only the two recorded blocker inequalities do, and
they follow again for every system from the retained single-deletion survival
facts.

This file makes that quantifier fact explicit.  It does not construct a
favorable critical system or prove the A-TAIL producer.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCriticalSystemRebaseScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

/-- Keep the geometric survivor pair fixed while changing the chosen critical
shell system.  The blocker inequalities are reconstructed from the same
deletion-survival witnesses. -/
def rebaseSurvivorPairCriticalSystem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (H' : CriticalShellSystem D.A) :
    SurvivorPairRelocationPacket D S r H' where
  q := P.q
  w := P.w
  q_mem_A := P.q_mem_A
  w_mem_A := P.w_mem_A
  q_mem_marginal := P.q_mem_marginal
  w_mem_marginal := P.w_mem_marginal
  q_ne_w := P.q_ne_w
  q_survives := P.q_survives
  w_survives := P.w_survives
  q_blocker_ne_oppApex2 :=
    actual_blocker_ne_of_deletion_survives H' P.q_mem_A P.q_survives
  w_blocker_ne_oppApex2 :=
    actual_blocker_ne_of_deletion_survives H' P.w_mem_A P.w_survives

@[simp] theorem rebaseSurvivorPairCriticalSystem_q
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (H' : CriticalShellSystem D.A) :
    (rebaseSurvivorPairCriticalSystem P H').q = P.q := rfl

@[simp] theorem rebaseSurvivorPairCriticalSystem_w
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (P : SurvivorPairRelocationPacket D S r H)
    (H' : CriticalShellSystem D.A) :
    (rebaseSurvivorPairCriticalSystem P H').w = P.w := rfl

/-- A concrete frontier transports to every other critical-shell system
without changing its selected pair or either apex deletion normal form. -/
def rebaseCriticalPairFrontierSystem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (H' : CriticalShellSystem D.A) :
    CriticalPairFrontier D S r H' where
  pair := rebaseSurvivorPairCriticalSystem F.pair H'
  firstApexSplit := by
    simpa [FirstApexSplit,
      rebaseSurvivorPairCriticalSystem]
      using F.firstApexSplit
  secondApexDouble := by
    simpa [
      rebaseSurvivorPairCriticalSystem]
      using F.secondApexDouble
  secondApexSplit := by
    simpa [SecondApexSplit,
      rebaseSurvivorPairCriticalSystem]
      using F.secondApexSplit

@[simp] theorem rebaseCriticalPairFrontierSystem_pair_q
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (H' : CriticalShellSystem D.A) :
    (rebaseCriticalPairFrontierSystem F H').pair.q = F.pair.q := rfl

@[simp] theorem rebaseCriticalPairFrontierSystem_pair_w
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    (H' : CriticalShellSystem D.A) :
    (rebaseCriticalPairFrontierSystem F H').pair.w = F.pair.w := rfl

/-- Existence of a frontier at one system implies existence at every other
system, with the same radius and the same selected survivor pair. -/
theorem nonempty_rebaseCriticalPairFrontierSystem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (hF : Nonempty (CriticalPairFrontier D S r H))
    (H' : CriticalShellSystem D.A) :
    Nonempty (CriticalPairFrontier D S r H') := by
  rcases hF with ⟨F⟩
  exact ⟨rebaseCriticalPairFrontierSystem F H'⟩

/-- Override one certified critical shell after the geometric frontier pair
has been selected, then transport the same frontier to the resulting system.
This is the precise choice-order operation available to a parent producer. -/
noncomputable def overrideCriticalPairFrontierAt
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {r : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S r H)
    {source center : ℝ²}
    (C : CriticalSelectedFourClass D.A source center)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase source) center) :
    CriticalPairFrontier D S r (H.overrideAt C hblocked) :=
  rebaseCriticalPairFrontierSystem F (H.overrideAt C hblocked)

#print axioms
  rebaseSurvivorPairCriticalSystem
#print axioms rebaseCriticalPairFrontierSystem
#print axioms nonempty_rebaseCriticalPairFrontierSystem
#print axioms overrideCriticalPairFrontierAt

end ATailCriticalSystemRebaseScratch
end Problem97
