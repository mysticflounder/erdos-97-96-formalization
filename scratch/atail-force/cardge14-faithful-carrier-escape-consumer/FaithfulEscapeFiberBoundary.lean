/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalFiberClosingCore
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge

/-!
# Consumer boundary for a faithful-row escape and a critical fiber

The canonical `(5,6,5)` escape produces one selected row and one point outside
the canonical carrier.  This file records the exact interaction of an arbitrary
`FaithfulCarrierPattern` with a production critical fiber and gives a finite
incidence regression for the still-missing coupling.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailCardGe14FaithfulCarrierEscapeConsumerScratch

open ATailCriticalFiberClosingCore
open ATailCriticalPairFrontier
open ATailFirstApexCriticalFiber
open ATailOrientedPhysicalApexIngress
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

/-- At the common blocker of a production critical fiber, every faithful
carrier pattern selects the already-existing exact critical shell.  Choosing
the faithful pattern late therefore cannot turn that center into a distinct
second center for the fiber pair. -/
theorem faithfulRow_at_commonBlocker_eq_fiberShell
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R)
    (G : FaithfulCarrierPattern D.A) :
    (G.classAt
        (H.centerAt P.source₁.1 P.source₁.2)
        P.commonBlocker_mem_A).support =
      (H.selectedAt P.source₁.1
        P.source₁.2).toCriticalFourShell.support := by
  simpa only [blockerLabel, CriticalShellSystem.blockerVertex] using
    blocker_row_support_eq_shell G H P.source₁.1 P.source₁.2

/-- Consequently, the faithful row at the fiber blocker contains both fiber
sources, but only at the old blocker center. -/
theorem fiberSources_mem_faithfulRow_at_commonBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : FrontierCommonDeletionCriticalFiber R)
    (G : FaithfulCarrierPattern D.A) :
    P.source₁.1 ∈
        (G.classAt
          (H.centerAt P.source₁.1 P.source₁.2)
          P.commonBlocker_mem_A).support ∧
      P.source₂.1 ∈
        (G.classAt
          (H.centerAt P.source₁.1 P.source₁.2)
          P.commonBlocker_mem_A).support := by
  rw [faithfulRow_at_commonBlocker_eq_fiberShell P G]
  exact ⟨
    (H.selectedAt P.source₁.1
      P.source₁.2).toCriticalFourShell.q_mem_support,
    P.source₂_mem_commonSupport⟩

namespace IncidenceShadow

/- ## Exact finite regression

This fourteen-label incidence shadow retains the information exported by the
canonical escape together with the source-to-blocker row law of a critical
system.  It deliberately asserts no Euclidean realization.
-/

/-- The full fourteen-label carrier. -/
def carrier : Finset ℕ := Finset.range 14

/-- The thirteen labels of the canonical `(5,6,5)` subcarrier. -/
def canonicalCarrier : Finset ℕ := Finset.range 13

/-- Three Moser-vertex labels. -/
def triangleVertices : Finset ℕ := {0, 1, 2}

/-- The actual surplus interior has one point omitted by the canonical
three-point selection. -/
def surplusInterior : Finset ℕ := {3, 4, 5, 13}

/-- The selected strict surplus points in the canonical carrier. -/
def selectedSurplusInterior : Finset ℕ := {3, 4, 5}

/-- The four selected strict first-opposite-cap points. -/
def firstInterior : Finset ℕ := {6, 7, 8, 9}

/-- All three strict exact-five second-opposite-cap points. -/
def secondInterior : Finset ℕ := {10, 11, 12}

/-- A fixed-point-free blocker map whose image omits labels `0,1`.  It has
one three-source fiber `{3,4,5}` at blocker `2`. -/
def blocker : ℕ → ℕ
  | 0 => 3
  | 1 => 4
  | 2 => 5
  | 3 => 2
  | 4 => 2
  | 5 => 2
  | 6 => 7
  | 7 => 8
  | 8 => 9
  | 9 => 10
  | 10 => 11
  | 11 => 12
  | 12 => 13
  | _ => 6

/-- Four selected support labels at every displayed center.  The row at the
common blocker `2` is the fiber shell.  The escaping row is centered at `7`
and contains the omitted surplus point `13`, but it contains no source of the
fiber `{3,4,5}`. -/
def row : ℕ → Finset ℕ
  | 0 => {6, 7, 8, 9}
  | 1 => {6, 7, 8, 9}
  | 2 => {3, 4, 5, 6}
  | 3 => {0, 6, 7, 8}
  | 4 => {1, 6, 7, 8}
  | 5 => {2, 6, 7, 8}
  | 6 => {7, 8, 9, 13}
  | 7 => {6, 8, 9, 13}
  | 8 => {7, 9, 10, 11}
  | 9 => {8, 10, 11, 12}
  | 10 => {9, 11, 12, 13}
  | 11 => {3, 10, 12, 13}
  | 12 => {3, 6, 11, 13}
  | _ => {3, 6, 7, 12}

/-- The cap-interior pieces and the triangle partition all fourteen labels,
while the canonical carrier omits only surplus-interior label `13`. -/
theorem capPartition_and_canonicalCarrier :
    triangleVertices ∪ surplusInterior ∪ firstInterior ∪ secondInterior =
        carrier ∧
      triangleVertices ∪ selectedSurplusInterior ∪ firstInterior ∪
          secondInterior = canonicalCarrier ∧
      canonicalCarrier.card = 13 ∧ carrier.card = 14 := by
  decide

/-- Every displayed row has four carrier members and omits its center. -/
theorem rows_are_four_point_carrier_classes :
    ∀ center ∈ carrier,
      (row center).card = 4 ∧ row center ⊆ carrier ∧ center ∉ row center := by
  decide

/-- The blocker map is fixed-point-free, omits the two designated robust
apices, and every source belongs to the row at its blocker. -/
theorem blocker_rows_are_source_faithful :
    ∀ source ∈ carrier,
      blocker source ∈ carrier ∧
        blocker source ≠ 0 ∧ blocker source ≠ 1 ∧
          blocker source ≠ source ∧ source ∈ row (blocker source) := by
  decide

/-- The common-blocker fiber is exactly the three displayed sources. -/
theorem commonBlocker_fiber :
    carrier.filter (fun source ↦ blocker source = 2) = {3, 4, 5} := by
  decide

/-- The canonical escape is present: center `7` lies in the thirteen-label
subcarrier and its selected row contains the omitted surplus point `13`. -/
theorem canonical_escape :
    7 ∈ canonicalCarrier ∧
      13 ∈ row 7 ∧
        13 ∈ surplusInterior \ selectedSurplusInterior ∧
          13 ∈ carrier \ canonicalCarrier := by
  decide

/-- No row at a center distinct from the common blocker contains even two
members of the repeated blocker fiber.  In particular, the escaping row does
not produce the paired incidence required by a same-cap consumer. -/
theorem no_distinct_row_contains_fiber_pair :
    ∀ center ∈ carrier, center ≠ 2 →
      (row center ∩ ({3, 4, 5} : Finset ℕ)).card ≤ 1 := by
  decide

end IncidenceShadow

#print axioms faithfulRow_at_commonBlocker_eq_fiberShell
#print axioms fiberSources_mem_faithfulRow_at_commonBlocker
#print axioms IncidenceShadow.capPartition_and_canonicalCarrier
#print axioms IncidenceShadow.rows_are_four_point_carrier_classes
#print axioms IncidenceShadow.blocker_rows_are_source_faithful
#print axioms IncidenceShadow.commonBlocker_fiber
#print axioms IncidenceShadow.canonical_escape
#print axioms IncidenceShadow.no_distinct_row_contains_fiber_pair

end ATailCardGe14FaithfulCarrierEscapeConsumerScratch
end Problem97
