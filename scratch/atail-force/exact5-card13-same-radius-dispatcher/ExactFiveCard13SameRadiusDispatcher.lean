/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import DirectSourceExactFiveCoordinator
import AllOneSourceIngress
import AllOneLeftSourceClosure
import AllOneMiddleSourceClosure
import AllOneRightSourceClosure

/-!
# Exact-five card-thirteen same-radius dispatcher

This scratch module performs the source-level split of the exact-five global
cover-star outcome.  The two asymmetric outcomes enter the existing verified
spoke terminals.  The all-one outcome constructs the canonical card-thirteen
source ingress and dispatches its three unquotiented boundary-hub orbits to
the persisted left, middle, and right source-orbit certificate closures.

The callback record separates the finite source split from the individual
certificate implementations; `canonicalAllOneCard13OrbitClosers` is its
concrete instantiation, and `false_of_exactFive_card13_sameRadius` is the
direct branch theorem.
-/

namespace Problem97
namespace ATailExactFiveCard13SameRadiusDispatcherScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13AllOneSourceIngressScratch
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion

noncomputable section

/-- Source-clean terminal interface for the three unquotiented all-one
boundary-hub orbits.  Each callback receives the exact aligned cover-family
packet carried by the corresponding constructor; no row or role is
reselected at the dispatcher boundary. -/
structure CanonicalAllOneCard13OrbitClosers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) : Type where
  left :
    ∀ {P : CanonicalCard13Frame profile}
      {star : PhysicalGlobalCrossDeletionStar profile}
      {hall : AllPhysicalActualCriticalRowsOneHit H profile}
      {first : FirstApexShellRolePacket F R}
      {T : CanonicalAllOneSemanticRowTable P star hall first},
      CanonicalAlignedCoverFamilies T 1 2 3 → False
  middle :
    ∀ {P : CanonicalCard13Frame profile}
      {star : PhysicalGlobalCrossDeletionStar profile}
      {hall : AllPhysicalActualCriticalRowsOneHit H profile}
      {first : FirstApexShellRolePacket F R}
      {T : CanonicalAllOneSemanticRowTable P star hall first},
      CanonicalAlignedCoverFamilies T 2 1 3 → False
  right :
    ∀ {P : CanonicalCard13Frame profile}
      {star : PhysicalGlobalCrossDeletionStar profile}
      {hall : AllPhysicalActualCriticalRowsOneHit H profile}
      {first : FirstApexShellRolePacket F R}
      {T : CanonicalAllOneSemanticRowTable P star hall first},
      CanonicalAlignedCoverFamilies T 3 1 2 → False

/-- Exact-card-thirteen same-radius closure, conditional only on the three
all-one source-orbit terminals.

The global-cover classification is exhaustive.  Its asymmetric cases are
closed by the existing verified spoke-one and spoke-two consumers.  In the
all-one case, `nonempty_canonicalAllOneCard13SourceIngress` constructs the
complete source-faithful ingress, whose orbit constructor selects exactly one
callback. -/
theorem false_of_exactFive_card13_sameRadius_of_allOneOrbitClosers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hsame : first.doubleRadius = radius)
    (closers : CanonicalAllOneCard13OrbitClosers Q profile) :
    False := by
  rcases nonempty_exactFiveGlobalCoverStarOutcome Q profile with ⟨outcome⟩
  cases outcome with
  | allRowsOneHit star hall =>
      rcases nonempty_canonicalAllOneCard13SourceIngress
          Q profile star hall hcard with ⟨ingress⟩
      rcases ingress.orbit with covers | covers | covers
      · exact closers.left covers
      · exact closers.middle covers
      · exact closers.right covers
  | spoke₁TwoHit star normal =>
      exact false_of_exactFive_card13_sameRadius_spoke₁
        Q profile star normal first hcard hsame
  | spoke₂TwoHit star normal =>
      exact false_of_exactFive_card13_sameRadius_spoke₂
        Q profile star normal first hcard hsame

/-- The three persisted all-one certificate endpoints provide the concrete
orbit-closing interface expected by the source-level dispatcher. -/
def canonicalAllOneCard13OrbitClosers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S) :
    CanonicalAllOneCard13OrbitClosers Q profile where
  left := fun C ↦ false_of_leftAllOneSourceOrbit C
  middle := fun C ↦ false_of_middleAllOneSourceOrbit C
  right := fun C ↦ false_of_rightAllOneSourceOrbit C

/-- Direct closure of the exact-card-thirteen all-one global-cover outcome.
The constructed source ingress retains its actual boundary hub and is sent
to the matching persisted certificate endpoint. -/
theorem false_of_exactFive_card13_allRowsOneHit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile)
    (hcard : D.A.card = 13) :
    False := by
  rcases nonempty_canonicalAllOneCard13SourceIngress
      Q profile star hall hcard with ⟨ingress⟩
  cases ingress.orbit with
  | left covers => exact false_of_leftAllOneSourceOrbit covers
  | middle covers => exact false_of_middleAllOneSourceOrbit covers
  | right covers => exact false_of_rightAllOneSourceOrbit covers

/-- Unconditional closure of the exact-card-thirteen same-radius branch.
The all-one arm uses the three persisted orbit certificates, while the two
asymmetric arms use the existing verified spoke terminals. -/
theorem false_of_exactFive_card13_sameRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hsame : first.doubleRadius = radius) :
    False :=
  false_of_exactFive_card13_sameRadius_of_allOneOrbitClosers
    Q profile first hcard hsame
      (canonicalAllOneCard13OrbitClosers Q profile)

#print axioms false_of_exactFive_card13_sameRadius_of_allOneOrbitClosers
#print axioms false_of_exactFive_card13_allRowsOneHit
#print axioms false_of_exactFive_card13_sameRadius

end


end ATailExactFiveCard13SameRadiusDispatcherScratch
end Problem97
