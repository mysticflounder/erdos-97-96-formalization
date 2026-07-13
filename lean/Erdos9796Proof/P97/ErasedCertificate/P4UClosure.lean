/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.CardElevenShellBridge
import Erdos9796Proof.P97.ErasedCertificate.P4UPlacements
import Erdos9796Proof.P97.ErasedCertificate.ErasedClosureSound
import Erdos9796Proof.P97.EndpointCertificate.BridgeAssembly

/-!
# P4-U card-eleven closure

Consumes the containment-specialized P4-U native certificate and the finite
blocker package to refute the surplus-opposite erased-pin residual.
-/

namespace Problem97
namespace ErasedCertificate

open scoped EuclideanGeometry

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedCarrierBridge
open Census554.EqualityCore
open ErasedNativeClassifier

/-- A complete containment-specialized P4-U geometry package is impossible. -/
theorem false_of_p4uContainmentErasedShellGeometry
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x : ℝ²}
    (hconv : ConvexIndep A)
    (G : P4UContainmentErasedShellGeometry S x) : False := by
  let blocker : Label → Label := erasedBlocker G.H G.L G.F 0
  have hshell : P4UErasedShellOK (patternCode G.L G.F) blocker
      (G.L.labelOf x) G.deleted := by
    simpa [blocker] using G.toP4UErasedShellOK
  have hcheck :
      erasedP4UPlacementCheck
          (Census554.CapSelectedNativeClassifierSound.rowMaskOf
            (patternCode G.L G.F) 0)
          G.deleted.val = true :=
    erasedP4UPlacementCheck_rowMaskOf G.incidence hshell
  have hcore : ClosureCoreAlternative (patternCode G.L G.F) blocker :=
    closureCoreAlternative_of_erasedP4UPlacementCheck
      G.incidence hshell hcheck
  have hcenter :
      G.L.labelOf (S.oppositeVertexByIndex S.surplusIdx) = 0 := by
    simpa using G.center_mem
  have hexact : ∀ source,
      ExactAt (rowPattern (patternCode G.L G.F)) G.L.pointOf
        (blocker source) := by
    intro source
    simpa [blocker, hcenter] using G.blocker_exact source
  exact EndpointCertificate.false_of_closureCoreAlternative_of_canonical
    G.L G.F hconv hexact hcore

/-- Card-eleven surplus-opposite erased-pin triples are impossible under the
Moser-cap containment hypotheses. -/
theorem false_of_surplusOppositeErasedPinTriple_of_cardEleven
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcontain : S.NonSurplusMoserCapContainment)
    (hcard6 : S.surplusCap.card = 6)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {x : ℝ²} (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (htriple : ErasedPinTriple A x
      (S.oppositeVertexByIndex S.surplusIdx)) : False := by
  obtain ⟨G⟩ := exists_p4uContainmentErasedShellGeometry
    S hne hconv hK4 hM44 hcontain hcard6 hMin hx htriple
  exact false_of_p4uContainmentErasedShellGeometry hconv G

end ErasedCertificate
end Problem97
