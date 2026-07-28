import CPackageBank

/-!
# C-package bank fidelity check (scratch)

Two `False`-goal theorems whose binder lists are copied character-for-character
from the two live C leaves in
`Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`.  Each body applies every
bank theorem of its leaf and then discharges the goal with `sorry` — the point
is not the proof but the *elaboration*: if any bank hypothesis were not
derivable in the leaf's binder context, one of the applications below would
fail to typecheck.

This file is a check harness, not a bank deliverable: it deliberately contains
`sorry`.  `CPackageBank.lean` is the `sorry`-free artifact.
-/

set_option linter.unusedVariables false

open scoped EuclideanGeometry

namespace Problem97
namespace CPackageBankFidelity

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailFrontierLiveClosure
open ATailMinimalUniqueFourCover
open ATailUniqueFourLateChoiceTerminalScratch
open CPackageBank

attribute [local instance] Classical.propDecidable

/-- Leaf C1 binder list, verbatim. -/
theorem fidelity_c1
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (_hcenter : globalDeletion.center = S.oppApex2)
    (_hsourceBlockerClass :
      (lateFirstApexSystem R).centerAt source.1 source.2 ∈
        SelectedClass D.A S.oppApex2 rho)
    (_huNeSource : u ≠ source)
    (_hsourceBlockerPlacement :
      (lateFirstApexSystem R).centerAt source.1 source.2 =
          jointDeletion.deleted.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 = u.1 ∨
        (lateFirstApexSystem R).centerAt source.1 source.2 ∈
          ((lateFirstApexSystem R).selectedAt
              v.1 v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 rho) :
    False := by
  classical
  -- C1.1
  have hcardTwo : globalDeletion.deleted.card = 2 :=
    c1_globalDeletion_card_eq_two R _hcard surface rho source other _hrho _hfive
      u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context jointDeletion
      _hclassFive globalDeletion _hcenter _hsourceBlockerClass _huNeSource
      _hsourceBlockerPlacement
  -- C1.2
  have huniq :
      ∀ r : ℝ, 0 < r → 4 ≤ (SelectedClass D.A S.oppApex2 r).card → r = rho :=
    c1_unique_K4_radius_at_secondApex R _hcard surface rho source other _hrho
      _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context
      jointDeletion _hclassFive globalDeletion _hcenter _hsourceBlockerClass
      _huNeSource _hsourceBlockerPlacement
  -- C1.3
  have hexact :
      ∀ (z : ℝ²), z ∈ SelectedClass D.A S.oppApex2 rho →
        ∀ r : ℝ, 0 < r → 4 ≤ (SelectedClass (D.A.erase z) S.oppApex2 r).card →
          SelectedClass (D.A.erase z) S.oppApex2 r =
            (SelectedClass D.A S.oppApex2 rho).erase z := by
    intro z hz r hr hw
    exact
      c1_apexWitness_exactification R _hcard surface rho source other _hrho
        _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context
        jointDeletion _hclassFive globalDeletion _hcenter _hsourceBlockerClass
        _huNeSource _hsourceBlockerPlacement z hz r hr hw
  -- C1.3 corollary
  have hsat :=
    c1_jointDeletion_certificates_saturated R _hcard surface rho source other
      _hrho _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context
      jointDeletion _hclassFive globalDeletion _hcenter _hsourceBlockerClass
      _huNeSource _hsourceBlockerPlacement
  sorry

/-- Leaf C2 binder list, verbatim. -/
theorem fidelity_c2
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F)
    (_hcard : 12 ≤ D.A.card)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (rho : ℝ)
    (source other : CarrierVertex D.A)
    (_hrho : 0 < rho)
    (_hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
    (u v : CarrierVertex D.A)
    (_huNeV : u ≠ v)
    (_huClass :
      u.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvClass :
      v.1 ∈ SelectedClass D.A S.oppApex2 rho)
    (_hvOmitted :
      v.1 ∉
        ((lateFirstApexSystem R).selectedAt
          u.1 u.2).toCriticalFourShell.support)
    (_huOmitted :
      u.1 ∉
        ((lateFirstApexSystem R).selectedAt
          v.1 v.2).toCriticalFourShell.support)
    (_context :
      ExactFourMutualOmissionSourceContext
        R rho source other u v)
    (jointDeletion :
      ExactFourMutualOmissionJointDeletion R rho u v)
    (_hclassFive :
      (SelectedClass D.A S.oppApex2 rho).card = 5)
    (globalDeletion :
      ExactFourMutualOmissionRigid221GlobalDeletion
        R rho u v jointDeletion)
    (_hcenter :
      globalDeletion.center ≠ S.oppApex2)
    (_hcollision :
      ∃ s ∈ globalDeletion.deleted, ∃ t ∈ globalDeletion.deleted,
        s ≠ t ∧
          dist globalDeletion.center s =
            dist globalDeletion.center t) :
    False := by
  classical
  obtain ⟨s, hs, t, ht, hst, hdist⟩ := _hcollision
  have hsA : s ∈ D.A :=
    (mem_selectedClass.mp (globalDeletion.deleted_subset_class hs)).1
  have htA : t ∈ D.A :=
    (mem_selectedClass.mp (globalDeletion.deleted_subset_class ht)).1
  -- C2.1
  have hclass :=
    c2_collisionClass_exact R _hcard surface rho source other _hrho _hfive u v
      _huNeV _huClass _hvClass _hvOmitted _huOmitted _context jointDeletion
      _hclassFive globalDeletion _hcenter s t hs ht hst hdist
  -- C2.2 (a)
  have hrobust : FullyDeletionRobustAt D globalDeletion.center :=
    c2_center_fullyDeletionRobust R _hcard surface rho source other _hrho _hfive
      u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context jointDeletion
      _hclassFive globalDeletion _hcenter s t hs ht hst hdist
  -- C2.2 (b)
  have hblockerNe :=
    c2_lateBlocker_ne_center_and_secondApex R _hcard surface rho source other
      _hrho _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context
      jointDeletion _hclassFive globalDeletion _hcenter s t hs ht hst hdist
  -- C2.3
  have hneFirst : globalDeletion.center ≠ S.oppApex1 :=
    c2_center_ne_firstApex R _hcard surface rho source other _hrho _hfive u v
      _huNeV _huClass _hvClass _hvOmitted _huOmitted _context jointDeletion
      _hclassFive globalDeletion _hcenter s t hs ht hst hdist
  -- C2.3 corollary
  have hdistinct :=
    c2_apexPair_distinct_carrier_centers R _hcard surface rho source other _hrho
      _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context
      jointDeletion _hclassFive globalDeletion _hcenter s t hs ht hst hdist
  -- C2.4 (a)
  have hnoRow :=
    c2_no_lateRow_contains_collisionPair R _hcard surface rho source other _hrho
      _hfive u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context
      jointDeletion _hclassFive globalDeletion _hcenter s t hs ht hst hdist
  -- C2.4 (b)
  have homit :=
    c2_collision_mutual_omission R _hcard surface rho source other _hrho _hfive
      u v _huNeV _huClass _hvClass _hvOmitted _huOmitted _context jointDeletion
      _hclassFive globalDeletion _hcenter s t hs ht hst hdist hsA htA
  -- C2.5
  have hplace :=
    c2_collision_placement R _hcard surface rho source other _hrho _hfive u v
      _huNeV _huClass _hvClass _hvOmitted _huOmitted _context jointDeletion
      _hclassFive globalDeletion _hcenter s t hs ht hst hdist
  sorry

end CPackageBankFidelity
end Problem97
