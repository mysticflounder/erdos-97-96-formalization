/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity

/-!
# Cardinality prefix for a live-to-fixed-surface coverage theorem

The current robust-all-center MARCO and two-omission Kalmanson searches use
exactly fourteen named roles.  This file records two necessary cardinality
consequences of any proposed live extraction theorem:

* an injective chosen fourteen-role subpacket requires at least fourteen
  carrier points;
* a fourteen-role enumeration of the whole carrier forces carrier cardinality
  exactly fourteen.

These structures deliberately contain no row, blocker, cap-profile, or
cyclic-order fields.  They are only the cardinality prefix of the much stronger
coverage contract audited in the adjacent report.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBiApexMarcoCoverageAudit

open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion

attribute [local instance] Classical.propDecidable

/-- Necessary cardinality prefix of an injective chosen fourteen-role
subpacket extracted from one live robust residual. -/
structure FourteenRoleChosenSubpacketCardinalityPrefix
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (_R : FrontierBiApexRobustResidual parent) : Type where
  label : Fin 14 → ℝ²
  label_injective : Function.Injective label
  label_mem_carrier : ∀ i, label i ∈ D.A

/-- Merely choosing fourteen distinct live carrier roles already requires
ambient carrier cardinality at least fourteen. -/
theorem FourteenRoleChosenSubpacketCardinalityPrefix.carrier_card_ge_fourteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    {R : FrontierBiApexRobustResidual parent}
    (C : FourteenRoleChosenSubpacketCardinalityPrefix R) :
    14 ≤ D.A.card := by
  classical
  have himage : Finset.univ.image C.label ⊆ D.A := by
    intro point hpoint
    rcases Finset.mem_image.mp hpoint with ⟨i, _hi, rfl⟩
    exact C.label_mem_carrier i
  calc
    14 = (Finset.univ : Finset (Fin 14)).card := by simp
    _ = (Finset.univ.image C.label).card :=
      (Finset.card_image_of_injective _ C.label_injective).symm
    _ ≤ D.A.card := Finset.card_le_card himage

/-- Necessary cardinality prefix of a fixed fourteen-role enumeration of the
entire live carrier. -/
structure FourteenRoleWholeCarrierCardinalityPrefix
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    (_R : FrontierBiApexRobustResidual parent) : Type where
  label : Fin 14 → ℝ²
  label_injective : Function.Injective label
  label_image_eq_carrier : Finset.univ.image label = D.A

/-- A faithful whole-carrier interpretation of a fourteen-label surface is
possible only at ambient cardinality fourteen. -/
theorem FourteenRoleWholeCarrierCardinalityPrefix.carrier_card_eq_fourteen
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    {R : FrontierBiApexRobustResidual parent}
    (C : FourteenRoleWholeCarrierCardinalityPrefix R) :
    D.A.card = 14 := by
  classical
  calc
    D.A.card = (Finset.univ.image C.label).card :=
      congrArg Finset.card C.label_image_eq_carrier.symm
    _ = (Finset.univ : Finset (Fin 14)).card :=
      Finset.card_image_of_injective _ C.label_injective
    _ = 14 := by simp

/-- In particular, no fourteen-label whole-carrier interpretation exists at
any other ambient cardinality. -/
theorem not_fourteenRoleWholeCarrierCardinalityPrefix_of_card_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {parent : FrontierCommonDeletionParentResidual F}
    {R : FrontierBiApexRobustResidual parent}
    (hcard : D.A.card ≠ 14) :
    ¬ Nonempty (FourteenRoleWholeCarrierCardinalityPrefix R) := by
  rintro ⟨C⟩
  exact hcard C.carrier_card_eq_fourteen

#print axioms
  FourteenRoleChosenSubpacketCardinalityPrefix.carrier_card_ge_fourteen
#print axioms
  FourteenRoleWholeCarrierCardinalityPrefix.carrier_card_eq_fourteen
#print axioms
  not_fourteenRoleWholeCarrierCardinalityPrefix_of_card_ne

end ATailBiApexMarcoCoverageAudit
end Problem97
