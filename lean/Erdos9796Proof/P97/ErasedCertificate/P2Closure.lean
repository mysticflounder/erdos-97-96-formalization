/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.CardElevenShellBridge
import Erdos9796Proof.P97.ErasedCertificate.P2Placements
import Erdos9796Proof.P97.ErasedCertificate.ErasedClosureSound
import Erdos9796Proof.P97.EndpointCertificate.BridgeAssembly

/-!
# P2 card-eleven closure

Consumes the right- and left-oriented P2 native certificates and finite
blocker packages to refute every card-eleven non-surplus count-row shell.
-/

namespace Problem97
namespace ErasedCertificate

open scoped EuclideanGeometry

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedCarrierBridge
open Census554.EqualityCore
open ErasedNativeClassifier

/-- A complete right-oriented P2 geometry package is impossible. -/
theorem false_of_rightErasedShellGeometry
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    {m s l r : Nat}
    (hconv : ConvexIndep A)
    (G : RightErasedShellGeometry S x p m s l r) : False := by
  let blocker : Label → Label :=
    erasedBlocker G.H G.L G.F (G.L.labelOf p)
  have hshell : RightErasedRowShellOK (patternCode G.L G.F) blocker
      (G.L.labelOf p) (G.L.labelOf x) G.deleted m s l r := by
    simpa [blocker] using G.toRightErasedRowShellOK
  have hcheck :
      erasedPlacementCheckAt (G.L.labelOf p).val
          (Census554.CapSelectedNativeClassifierSound.rowMaskOf
            (patternCode G.L G.F) (G.L.labelOf p))
          G.deleted.val = true :=
    erasedPlacementCheckAt_rowMaskOf_right G.incidence hshell
  have hcore : ClosureCoreAlternative (patternCode G.L G.F) blocker :=
    closureCoreAlternative_of_erasedPlacementCheckAt
      G.incidence hshell.1 hcheck
  have hexact : ∀ source,
      ExactAt (rowPattern (patternCode G.L G.F)) G.L.pointOf
        (blocker source) := by
    intro source
    simpa [blocker] using G.blocker_exact source
  exact EndpointCertificate.false_of_closureCoreAlternative_of_canonical
    G.L G.F hconv hexact hcore

/-- A complete left-oriented P2 geometry package is impossible. -/
theorem false_of_leftErasedShellGeometry
    {A : Finset ℝ²} {S : SurplusCapPacket A} {x p : ℝ²}
    {m s l r : Nat}
    (hconv : ConvexIndep A)
    (G : LeftErasedShellGeometry S x p m s l r) : False := by
  let blocker : Label → Label :=
    erasedBlocker G.H G.L G.F (G.L.labelOf p)
  have hshell : LeftErasedRowShellOK (patternCode G.L G.F) blocker
      (G.L.labelOf p) (G.L.labelOf x) G.deleted m s l r := by
    simpa [blocker] using G.toLeftErasedRowShellOK
  have hcheck :
      erasedPlacementCheckAt (G.L.labelOf p).val
          (Census554.CapSelectedNativeClassifierSound.rowMaskOf
            (patternCode G.L G.F) (G.L.labelOf p))
          G.deleted.val = true :=
    erasedPlacementCheckAt_rowMaskOf_left G.incidence hshell
  have hcore : ClosureCoreAlternative (patternCode G.L G.F) blocker :=
    closureCoreAlternative_of_erasedPlacementCheckAt
      G.incidence hshell.1 hcheck
  have hexact : ∀ source,
      ExactAt (rowPattern (patternCode G.L G.F)) G.L.pointOf
        (blocker source) := by
    intro source
    simpa [blocker] using G.blocker_exact source
  exact EndpointCertificate.false_of_closureCoreAlternative_of_canonical
    G.L G.F hconv hexact hcore

/-- Any exact right count row in the card-eleven P2 domain is impossible. -/
theorem false_of_rightCountRow_of_cardEleven
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcard6 : S.surplusCap.card = 6)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {x p : ℝ²} {m s l r : Nat}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1) (hpA : p ∈ A)
    (hm : S.moserCount p (dist p x) = m)
    (hs : S.sameCapCount S.oppIndex1 p (dist p x) = s)
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) = l)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) = r)
    (hsum : m + s + l + r = 4) : False := by
  obtain ⟨G⟩ := exists_rightErasedShellGeometry
    S hne hconv hK4 hM44 hcard6 hMin hx hp hpA hm hs hl hr hsum
  exact false_of_rightErasedShellGeometry hconv G

/-- Any exact left count row in the card-eleven P2 domain is impossible. -/
theorem false_of_leftCountRow_of_cardEleven
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcard6 : S.surplusCap.card = 6)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {x p : ℝ²} {m s l r : Nat}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2) (hpA : p ∈ A)
    (hm : S.moserCount p (dist p x) = m)
    (hs : S.sameCapCount S.oppIndex2 p (dist p x) = s)
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) = l)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) = r)
    (hsum : m + s + l + r = 4) : False := by
  obtain ⟨G⟩ := exists_leftErasedShellGeometry
    S hne hconv hK4 hM44 hcard6 hMin hx hp hpA hm hs hl hr hsum
  exact false_of_leftErasedShellGeometry hconv G

/-- The right terminal payload reduces to its exact `(2,1,0,1)` P2 row. -/
theorem false_of_rightOneSidedErasedPayload_of_cardEleven
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcard6 : S.surplusCap.card = 6)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex1) (hpA : p ∈ A)
    (hpayload : SurplusCapPacket.RightOneSidedErasedPayload
      S S.oppIndex1 p x (dist p x)) : False := by
  exact false_of_rightCountRow_of_cardEleven
    hne hconv hK4 hM44 hcard6 hMin hx hp hpA
    (S.rightOneSidedErasedPayload_moserCount_eq_two hpayload)
    (S.rightOneSidedErasedPayload_sameCapCount_eq_one hpayload)
    (S.rightOneSidedErasedPayload_leftAdjCount_eq_zero hpayload)
    (S.rightOneSidedErasedPayload_rightAdjCount_eq_one hpayload) (by omega)

/-- The left terminal payload reduces to its exact `(2,1,1,0)` P2 row. -/
theorem false_of_leftOneSidedErasedPayload_of_cardEleven
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hcard6 : S.surplusCap.card = 6)
    (hMin : ∀ B : Finset ℝ², B.card < A.card →
      B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B → False)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.capInteriorByIndex S.oppIndex2) (hpA : p ∈ A)
    (hpayload : SurplusCapPacket.LeftOneSidedErasedPayload
      S S.oppIndex2 p x (dist p x)) : False := by
  exact false_of_leftCountRow_of_cardEleven
    hne hconv hK4 hM44 hcard6 hMin hx hp hpA
    (S.leftOneSidedErasedPayload_moserCount_eq_two hpayload)
    (S.leftOneSidedErasedPayload_sameCapCount_eq_one hpayload)
    (S.leftOneSidedErasedPayload_leftAdjCount_eq_one hpayload)
    (S.leftOneSidedErasedPayload_rightAdjCount_eq_zero hpayload) (by omega)

end ErasedCertificate
end Problem97
