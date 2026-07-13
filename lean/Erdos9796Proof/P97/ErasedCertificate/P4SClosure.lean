/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.CardElevenShellBridge
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacements
import Erdos9796Proof.P97.ErasedCertificate.ErasedClosureSound
import Erdos9796Proof.P97.EndpointCertificate.BridgeAssembly

/-!
# P4-S card-eleven closure

Consumes the surplus-interior P4-S native certificate and finite blocker
package to refute the surplus-interior erased-pin residual.
-/

namespace Problem97
namespace ErasedCertificate

open scoped EuclideanGeometry

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedCarrierBridge
open Census554.EqualityCore
open ErasedNativeClassifier

/-- A complete surplus-interior P4-S geometry package is impossible. -/
theorem false_of_p4sErasedShellGeometry
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    (hconv : ConvexIndep A)
    (G : ErasedP4ShellGeometry S x p intS) : False := by
  let blocker : Label → Label :=
    erasedBlocker G.H G.L G.F (G.L.labelOf p)
  have hshell : P4SErasedShellOK (patternCode G.L G.F) blocker
      (G.L.labelOf p) (G.L.labelOf x) G.deleted := by
    simpa [blocker] using G.toP4SErasedShellOK
  have hcheck :
      erasedPlacementCheckAt (G.L.labelOf p).val
          (Census554.CapSelectedNativeClassifierSound.rowMaskOf
            (patternCode G.L G.F) (G.L.labelOf p))
          G.deleted.val = true :=
    erasedPlacementCheckAt_rowMaskOf_p4s G.incidence hshell
  have hcore : ClosureCoreAlternative (patternCode G.L G.F) blocker :=
    closureCoreAlternative_of_erasedPlacementCheckAt
      G.incidence hshell hcheck
  have hexact : ∀ source,
      ExactAt (rowPattern (patternCode G.L G.F)) G.L.pointOf
        (blocker source) := by
    intro source
    simpa [blocker] using G.blocker_exact source
  exact EndpointCertificate.false_of_closureCoreAlternative_of_canonical
    G.L G.F hconv hexact hcore

/-- Card-eleven surplus-interior erased-pin triples are impossible. -/
theorem false_of_surplusInteriorErasedPinTriple_of_cardEleven
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcard6 : S.surplusCap.card = 6)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hpI : p ∈ S.capInteriorByIndex S.surplusIdx)
    (hpErase : p ∈ A.erase x)
    (htriple : ErasedPinTriple A x p) : False := by
  have hpA : p ∈ A := Finset.mem_of_mem_erase hpErase
  obtain ⟨G⟩ := exists_p4sErasedShellGeometry
    S hne hconv hK4 hM44 hcard6 hMin hx hpI hpA htriple
  exact false_of_p4sErasedShellGeometry hconv G

end ErasedCertificate
end Problem97
