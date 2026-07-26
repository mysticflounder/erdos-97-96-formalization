/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import CommonLabelTransport
import SemanticRowTable

/-!
# Exact-five card-thirteen distinct-radius dispatcher

This scratch module isolates the source-level wiring left after the two
canonical asymmetric source-orbit certificates are available.  It does not
postulate a terminal geometric packet: each callback receives the complete
source-faithful semantic table, the two independently selected deletion-cover
families, and one of the two exact canonical role orientations.

The all-one arm is already closed independently of the first-apex radius
comparison.  Both two-hit arms construct the same canonical surface and
dispatch solely on whether the source is boundary index `1` or `3`.
-/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusDispatcherScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable

noncomputable section

/-- The two exact source-orbit consumers needed by the distinct-radius
card-thirteen surface.  The callback arguments are deliberately generic over
which spoke generated the two-hit row: after canonical cover-family
normalization, the source formula depends only on the retained semantic table
and the exact `(1,2,3)` or `(3,2,1)` role orientation. -/
structure CanonicalDistinctRadiusCard13OrbitClosers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hdistinct : first.doubleRadius ≠ radius) : Type where
  allOne :
    ∀ (_star : PhysicalGlobalCrossDeletionStar profile),
      AllPhysicalActualCriticalRowsOneHit H profile → False
  direct :
    ∀ {M : PhysicalActualCriticalMutualOmissionPair H profile}
      {N : SourceTwoHitNormalForm Q profile M}
      {P : CanonicalAsymmetricRolePrepacket N}
      {star : PhysicalGlobalCrossDeletionStar profile}
      {T : CanonicalAsymmetricSemanticRowTable P star first}
      (_C : CanonicalCoverFamilies T),
      P.sourceIndex = (1 : Fin 13) ∧
        P.blockerIndex = (2 : Fin 13) ∧
        P.thirdIndex = (3 : Fin 13) → False
  mirror :
    ∀ {M : PhysicalActualCriticalMutualOmissionPair H profile}
      {N : SourceTwoHitNormalForm Q profile M}
      {P : CanonicalAsymmetricRolePrepacket N}
      {star : PhysicalGlobalCrossDeletionStar profile}
      {T : CanonicalAsymmetricSemanticRowTable P star first}
      (_C : CanonicalCoverFamilies T),
      P.sourceIndex = (3 : Fin 13) ∧
        P.blockerIndex = (2 : Fin 13) ∧
        P.thirdIndex = (1 : Fin 13) → False

/-- Close one canonical asymmetric source surface from the two orbit
callbacks. -/
theorem false_of_canonicalAsymmetric_distinctRadius_of_orbitClosers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {first : FirstApexShellRolePacket F R}
    {hcard : D.A.card = 13}
    {hdistinct : first.doubleRadius ≠ radius}
    (closers : CanonicalDistinctRadiusCard13OrbitClosers
      Q profile first hcard hdistinct)
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    {star : PhysicalGlobalCrossDeletionStar profile}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
    (C : CanonicalCoverFamilies T) : False := by
  rcases P.source_role_orbits with hdirect | hmirror
  · exact closers.direct C hdirect
  · exact closers.mirror C hmirror

/-- Exact-card-thirteen distinct-radius closure conditional only on the two
canonical source-orbit certificate endpoints.  The global-cover split is
exhaustive; its all-one arm is already unconditionally closed, while each
two-hit arm constructs the canonical frame, semantic rows, and independently
chosen normalized cover families before entering the orbit callbacks. -/
theorem false_of_exactFive_card13_distinctRadius_of_orbitClosers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (first : FirstApexShellRolePacket F R)
    (hcard : D.A.card = 13)
    (hdistinct : first.doubleRadius ≠ radius)
    (closers : CanonicalDistinctRadiusCard13OrbitClosers
      Q profile first hcard hdistinct) : False := by
  rcases nonempty_exactFiveGlobalCoverStarOutcome Q profile with ⟨outcome⟩
  cases outcome with
  | allRowsOneHit star hall =>
      exact closers.allOne star hall
  | spoke₁TwoHit star normal =>
      rcases nonempty_canonicalAsymmetricRolePrepacket
          Q profile star.spoke₁HubPair.toMutualOmissionPair normal hcard with ⟨P⟩
      rcases CanonicalAsymmetricSemanticRowTable.nonempty P star first with ⟨T⟩
      rcases nonempty_canonicalCoverFamilies_spoke₁ T with ⟨C⟩
      exact false_of_canonicalAsymmetric_distinctRadius_of_orbitClosers
        closers P C
  | spoke₂TwoHit star normal =>
      rcases nonempty_canonicalAsymmetricRolePrepacket
          Q profile star.spoke₂HubPair.toMutualOmissionPair normal hcard with ⟨P⟩
      rcases CanonicalAsymmetricSemanticRowTable.nonempty P star first with ⟨T⟩
      rcases nonempty_canonicalCoverFamilies_spoke₂ T with ⟨C⟩
      exact false_of_canonicalAsymmetric_distinctRadius_of_orbitClosers
        closers P C

#print axioms false_of_canonicalAsymmetric_distinctRadius_of_orbitClosers
#print axioms false_of_exactFive_card13_distinctRadius_of_orbitClosers

end

end ATailExactFiveCard13DistinctRadiusDispatcherScratch
end Problem97
