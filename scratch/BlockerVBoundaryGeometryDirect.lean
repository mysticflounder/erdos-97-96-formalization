/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Blocker-v direct source-radius audit

In the rigid source-equals-`u` branch, suppose the actual source blocker is
`v`.  The source row is an exact four-shell centered at `v`, but it contains
the source itself.  Consequently, after deleting the source, its exact radius
class has cardinality exactly three.

Thus the existing source shell cannot itself supply the four off-source
equidistant points centered at `v`.  Any such contradiction must produce a
genuinely different radius (or obtain additional same-radius points by first
contradicting exactness of the critical shell).
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

/-- Under `blocker = v`, the source-shell radius class after deleting the
source is exactly the original critical support with the source erased. -/
theorem blockerV_sourceRadiusClass_afterDeletion_eq_supportErase
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1) :
    (D.A.erase P.source.1).filter
        (fun z =>
          dist P.v.1 z =
            ((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.radius) =
      ((lateFirstApexSystem R).selectedAt
        P.source.1 P.source.2).toCriticalFourShell.support.erase
          P.source.1 := by
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.source.1 P.source.2).toCriticalFourShell
  ext z
  simp only [Finset.mem_filter, Finset.mem_erase]
  rw [K.support_eq]
  simp only [Finset.mem_filter]
  constructor
  · rintro ⟨⟨hzNe, hzA⟩, hzdist⟩
    exact ⟨hzNe, hzA, by simpa [K, hblocker] using hzdist⟩
  · rintro ⟨hzNe, hzA, hzdist⟩
    exact ⟨⟨hzNe, hzA⟩, by simpa [K, hblocker] using hzdist⟩

/-- The already-recorded source radius has exactly three survivors after
deleting the source. -/
theorem blockerV_sourceRadiusClass_afterDeletion_card_eq_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1) :
    ((D.A.erase P.source.1).filter
      (fun z =>
        dist P.v.1 z =
          ((lateFirstApexSystem R).selectedAt
            P.source.1 P.source.2).toCriticalFourShell.radius)).card = 3 := by
  rw [blockerV_sourceRadiusClass_afterDeletion_eq_supportErase P hblocker]
  rw [Finset.card_erase_of_mem
    ((lateFirstApexSystem R).selectedAt
      P.source.1 P.source.2).toCriticalFourShell.q_mem_support]
  simp only [
    ((lateFirstApexSystem R).selectedAt
      P.source.1 P.source.2).toCriticalFourShell.support_card]

/-- In particular, the source-shell radius cannot be the requested
four-point survival witness centered at `v`. -/
theorem blockerV_sourceRadiusClass_afterDeletion_not_four
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1) :
    ¬ 4 ≤
      ((D.A.erase P.source.1).filter
        (fun z =>
          dist P.v.1 z =
            ((lateFirstApexSystem R).selectedAt
              P.source.1 P.source.2).toCriticalFourShell.radius)).card := by
  rw [blockerV_sourceRadiusClass_afterDeletion_card_eq_three P hblocker]
  omega

/-- Any ambient selected class centered at `v` and pinned through the source
has the already-recorded source-shell radius.  In particular, the exact-four
pin returned by global `K4` is not a second-radius class. -/
theorem blockerV_sourcePinnedRadius_eq_sourceShellRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    {tau : ℝ}
    (hsource : P.source.1 ∈ SelectedClass D.A P.v.1 tau) :
    tau =
      ((lateFirstApexSystem R).selectedAt
        P.source.1 P.source.2).toCriticalFourShell.radius := by
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.source.1 P.source.2).toCriticalFourShell
  have hsourceTau : dist P.v.1 P.source.1 = tau :=
    (mem_selectedClass.mp hsource).2
  have hsourceK :
      dist
          ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
          P.source.1 =
        K.radius :=
    K.support_eq_radius P.source.1 K.q_mem_support
  calc
    tau = dist P.v.1 P.source.1 := hsourceTau.symm
    _ = K.radius := by simpa [K, hblocker] using hsourceK

/-- Consequently every source-pinned class centered at `v` is literally the
critical source support. -/
theorem blockerV_sourcePinnedClass_eq_sourceShellSupport
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    {tau : ℝ}
    (hsource : P.source.1 ∈ SelectedClass D.A P.v.1 tau) :
    SelectedClass D.A P.v.1 tau =
      ((lateFirstApexSystem R).selectedAt
        P.source.1 P.source.2).toCriticalFourShell.support := by
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.source.1 P.source.2).toCriticalFourShell
  have htau :
      tau = K.radius :=
    blockerV_sourcePinnedRadius_eq_sourceShellRadius P hblocker hsource
  rw [K.support_eq]
  simp only [SelectedClass]
  simp [K, hblocker, htau]

/-- Exact low-level closure interface for the pinned alternative: it is enough
to produce one ambient point outside the recorded source support at the same
distance from `v` as the source.  Critical-shell exactness then gives the
contradiction immediately. -/
theorem false_of_blockerV_offSupport_sourceCoRadial
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1)
    {z : ℝ²}
    (hzA : z ∈ D.A)
    (hzOutside :
      z ∉
        ((lateFirstApexSystem R).selectedAt
          P.source.1 P.source.2).toCriticalFourShell.support)
    (hzCoRadial : dist P.v.1 z = dist P.v.1 P.source.1) :
    False := by
  let K :=
    ((lateFirstApexSystem R).selectedAt
      P.source.1 P.source.2).toCriticalFourShell
  apply hzOutside
  apply K.off_row_named_label_forbidden hzA
  calc
    dist
        ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
        z =
      dist P.v.1 z := by rw [hblocker]
    _ = dist P.v.1 P.source.1 := hzCoRadial
    _ =
      dist
        ((lateFirstApexSystem R).centerAt P.source.1 P.source.2)
        P.source.1 := by rw [hblocker]
    _ = K.radius := K.support_eq_radius P.source.1 K.q_mem_support

end ATailFrontierLiveClosure
end Problem97
