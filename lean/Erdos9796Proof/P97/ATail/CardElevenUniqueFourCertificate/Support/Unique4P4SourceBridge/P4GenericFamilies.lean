/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4SourceBridge.P4DirectOuterArcAdapter
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.IndexedSource.CyclicAlternationCore
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSourceBridge.IndexedSource.MirrorTransport

/-!
# Curvature-generic P4 family adapters

This file specializes the transport-generic selected-row semantics from
`IndexedSource/GenericFamilies.lean` and the direct cyclic-alternation theorem
from `IndexedSource/CyclicAlternationCore.lean` to a direct `(5,4,5)` P4
boundary packet.

The five theorems below prove the source semantics of every *well-formed
instance* of the corresponding family.  They do not inspect a clause ledger.
Consequently, the only remaining finite seam for the audited clauses is to
certify, for each retained clause, its family parameters, the required
well-formedness side conditions, and inclusion of the instantiated family
literals in the stored clause.  No additional geometric theorem is needed
for that occurrence bridge.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace P4GenericFamiliesScratch

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open ATailUniqueFourExactTwoSchemaDecoderScratch
open P5IndexedSourceScratch

variable {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
  {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
  {R : OriginalUniqueFourResidual F}
  {profile : S.surplusCap.card = 5 ∧
    S.oppCap1.card = 4 ∧ S.oppCap2.card = 5}
  {distribution : ExactTwoStrictHitDistribution R}

/-
The first four adapters retain the stronger transport-generic statements.
For the direct P4 compact formula, instantiate `σ` with `directIndex`; for a
future reflected occurrence bridge, the same theorems remain available once
that bridge supplies its index transport (and injectivity where requested).
-/

/-- Core-level source semantics for `radius_partition_transitivity`.

Keeping this statement at `ExactTwoBoundaryCore` is essential for the mirror
packet: the compact CNF labels can be evaluated through `mirrorIndex` without
claiming that a reflected boundary is a direct P4 packet. -/
theorem radiusPartitionTransitivitySat_core
    (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) :
    P5IndexedSourceScratch.RadiusPartitionTransitivitySat Q σ :=
  P5IndexedSourceScratch.radiusPartitionTransitivitySat Q σ

/-- Core-level source semantics for `selected_row_subset_radius_class`. -/
theorem selectedRowSubsetRadiusClassSat_core
    (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) :
    P5IndexedSourceScratch.SelectedRowSubsetRadiusClassSat Q σ :=
  P5IndexedSourceScratch.selectedRowSubsetRadiusClassSat Q σ

/-- Core-level source semantics for the mutual-triangle transport family. -/
theorem mutualTriangleCrossCenterRadiusTransportSat_core
    (Q : ExactTwoBoundaryCore R distribution)
    (σ : Label → Label) :
    P5IndexedSourceScratch.MutualTriangleCrossCenterRadiusTransportSat Q σ :=
  P5IndexedSourceScratch.mutualTriangleCrossCenterRadiusTransportSat Q σ

/-- Core-level source semantics for `row_at_least_4`. -/
theorem rowAtLeastFourSat_core
    (Q : ExactTwoBoundaryCore R distribution)
    {σ : Label → Label} (hσ : Function.Injective σ) :
    P5IndexedSourceScratch.RowAtLeastFourSat Q σ :=
  P5IndexedSourceScratch.rowAtLeastFourSat Q hσ

/-- Direct-orientation cyclic-alternation semantics at the common core. -/
theorem fullClassCyclicAlternationSat_direct_core
    (Q : ExactTwoBoundaryCore R distribution) :
    P5IndexedSourceScratch.FullClassCyclicAlternationSat
      Q P5IndexedSourceScratch.directIndex :=
  P5IndexedSourceScratch.fullClassCyclicAlternationSat_direct Q

/-- Mirror-orientation cyclic-alternation semantics at the common core. -/
theorem fullClassCyclicAlternationSat_mirror_core
    (Q : ExactTwoBoundaryCore R distribution) :
    P5IndexedSourceScratch.FullClassCyclicAlternationSat
      Q P5IndexedSourceScratch.mirrorIndex :=
  P5IndexedSourceScratch.fullClassCyclicAlternationSat_mirror Q

/-- Source semantics for every P4 `radius_partition_transitivity` instance:
two radius equalities at one center imply the third, for any index transport.
-/
theorem radiusPartitionTransitivitySat
    (P : P4DirectBoundaryPacket R profile distribution)
    (σ : Label → Label) :
    P5IndexedSourceScratch.RadiusPartitionTransitivitySat P.core σ :=
  radiusPartitionTransitivitySat_core P.core σ

/-- Source semantics for every P4 `selected_row_subset_radius_class`
instance: two members of one selected row are equidistant from its center,
for any index transport. -/
theorem selectedRowSubsetRadiusClassSat
    (P : P4DirectBoundaryPacket R profile distribution)
    (σ : Label → Label) :
    P5IndexedSourceScratch.SelectedRowSubsetRadiusClassSat P.core σ :=
  selectedRowSubsetRadiusClassSat_core P.core σ

/-- Source semantics for every P4
`mutual_triangle_cross_center_radius_transport` instance: the four displayed
mutual row memberships force the transported radius equality, for any index
transport. -/
theorem mutualTriangleCrossCenterRadiusTransportSat
    (P : P4DirectBoundaryPacket R profile distribution)
    (σ : Label → Label) :
    P5IndexedSourceScratch.MutualTriangleCrossCenterRadiusTransportSat
      P.core σ :=
  mutualTriangleCrossCenterRadiusTransportSat_core P.core σ

/-- Source semantics for every P4 `row_at_least_4` instance: every seven
non-center labels meet the selected four-row, for any injective index
transport. -/
theorem rowAtLeastFourSat
    (P : P4DirectBoundaryPacket R profile distribution)
    {σ : Label → Label} (hσ : Function.Injective σ) :
    P5IndexedSourceScratch.RowAtLeastFourSat P.core σ :=
  rowAtLeastFourSat_core P.core hσ

/-- Source semantics for every direct P4 `full_class_cyclic_alternation`
instance: two ordered centers cannot share an equidistant pair in any of the
four non-alternating linear arrangements. -/
theorem fullClassCyclicAlternationSat
    (P : P4DirectBoundaryPacket R profile distribution) :
    P5IndexedSourceScratch.FullClassCyclicAlternationSat
      P.core P5IndexedSourceScratch.directIndex :=
  fullClassCyclicAlternationSat_direct_core P.core

/-
Audited retained-clause counts.  These constants document the scope of the
finite occurrence bridge; the arithmetic theorem does not itself authenticate
the clauses.
-/

def radiusPartitionTransitivityClauseCount : ℕ := 3218
def selectedRowSubsetRadiusClassClauseCount : ℕ := 441
def mutualTriangleCrossCenterRadiusTransportClauseCount : ℕ := 392
def rowAtLeastFourClauseCount : ℕ := 981
def fullClassCyclicAlternationClauseCount : ℕ := 1279

def curvatureGenericClauseCount : ℕ :=
  radiusPartitionTransitivityClauseCount +
    selectedRowSubsetRadiusClassClauseCount +
    mutualTriangleCrossCenterRadiusTransportClauseCount +
    rowAtLeastFourClauseCount +
    fullClassCyclicAlternationClauseCount

theorem curvatureGenericClauseCount_eq :
    curvatureGenericClauseCount = 6311 := by
  norm_num [curvatureGenericClauseCount,
    radiusPartitionTransitivityClauseCount,
    selectedRowSubsetRadiusClassClauseCount,
    mutualTriangleCrossCenterRadiusTransportClauseCount,
    rowAtLeastFourClauseCount,
    fullClassCyclicAlternationClauseCount]

#print axioms radiusPartitionTransitivitySat
#print axioms selectedRowSubsetRadiusClassSat
#print axioms mutualTriangleCrossCenterRadiusTransportSat
#print axioms rowAtLeastFourSat
#print axioms fullClassCyclicAlternationSat
#print axioms curvatureGenericClauseCount_eq

end P4GenericFamiliesScratch
end Problem97
