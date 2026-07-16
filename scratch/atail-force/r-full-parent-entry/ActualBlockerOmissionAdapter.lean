/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ActualBlockerMinimalCycleClassifier
import Erdos9796Proof.P97.U5GlobalIncidenceSupport

/-!
# Exact q-deleted row carried by an actual-blocker omission

An `ActualBlockerOmissionOutcome` does not merely supply an anonymous
four-point equidistance witness after deleting the mate.  Its witness is the
actual critical shell selected at the source.  Consequently the exact shell
support:

* is a four-point subset of the ambient carrier;
* contains the source and omits the mate;
* is the full positive-radius class at the actual blocker; and
* packages as the existing `U5QDeletedK4Class` with the mate as `q`.

This file records that source-preserving adapter.  It does not assert a second
row or any cross-row named incidence.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

/-- An exact critical shell is a q-allowed U5 row at its center. -/
def criticalFourShellToU5QAllowedK4Class
    {D : CounterexampleData} {source blocker : ℝ²}
    (K : CriticalFourShell D.A source blocker) :
    U5QAllowedK4Class D blocker K.support where
  subset := by
    intro z hz
    change z ∈ D.A.erase blocker
    exact Finset.mem_erase.mpr ⟨by
      intro hzb
      subst z
      exact K.center_not_mem_support hz, K.support_subset_A hz⟩
  card_four := by
    rw [K.support_card]
  radius := K.radius
  radius_pos := K.radius_pos
  same_radius := K.support_eq_radius

/-- If a point is omitted by an exact critical shell, the same support is a
U5 q-deleted row for that point.  This visibly consumes the existing
q-allowed-to-q-deleted adapter. -/
def criticalFourShellToU5QDeletedK4ClassOfNotMem
    {D : CounterexampleData} {source mate blocker : ℝ²}
    (K : CriticalFourShell D.A source blocker)
    (hmate : mate ∉ K.support) :
    U5QDeletedK4Class D mate blocker K.support :=
  (criticalFourShellToU5QAllowedK4Class K).toQDeletedK4Class_of_not_mem_q hmate

/-- Complete single-row payload extracted from an actual-blocker OMISSION.

The parameters `blocker` and `B` remain explicit so consumers can see that
the row is the actual selected shell, rather than an arbitrary witness
recovered from `HasNEquidistantPointsAt`. -/
structure ActualBlockerOmissionExactRowPacket
    (D : CounterexampleData) (source mate blocker : ℝ²)
    (B : Finset ℝ²) : Type where
  blocker_mem_erase_source : blocker ∈ D.A.erase source
  source_mem_A : source ∈ D.A
  mate_mem_A : mate ∈ D.A
  source_ne_mate : source ≠ mate
  blocker_ne_source : blocker ≠ source
  support_subset_A : B ⊆ D.A
  support_card : B.card = 4
  source_mem_support : source ∈ B
  mate_not_mem_support : mate ∉ B
  blocker_not_mem_support : blocker ∉ B
  radius : ℝ
  radius_pos : 0 < radius
  support_eq_radiusClass :
    B = D.A.filter fun z => dist blocker z = radius
  support_eq_radius : ∀ z ∈ B, dist blocker z = radius
  source_eq_radius : dist blocker source = radius
  mate_ne_radius : dist blocker mate ≠ radius
  deletion_survives :
    HasNEquidistantPointsAt 4 (D.A.erase mate) blocker
  mate_radius_ne_source_radius :
    dist blocker mate ≠ dist blocker source
  qDeletedClass : U5QDeletedK4Class D mate blocker B

/-- The exact remaining one-row U5 incidence: a dangerous triple for the
source/mate circle cannot be contained in the actual-blocker row. -/
theorem ActualBlockerOmissionExactRowPacket.false_of_dangerousTriple_subset
    {D : CounterexampleData} {source mate blocker : ℝ²}
    {B T : Finset ℝ²}
    (R : ActualBlockerOmissionExactRowPacket
      D source mate blocker B)
    (htriple : U5DangerousTriple D mate source T)
    (hTB : T ⊆ B) : False :=
  (U5QDeletedK4Class.not_dangerous_triple_subset_of_ne_center
    htriple R.qDeletedClass R.blocker_ne_source) hTB

/-- The actual selected four-shell is the exact U5 q-deleted row carried by
an OMISSION outcome.  No support choice is made in this proof. -/
def ActualBlockerOmissionOutcome.exactRowPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (h : ActualBlockerOmissionOutcome P H) :
    let hxA := (mem_selectedClass.mp P.x_mem_class).1
    let blocker := H.centerAt P.x hxA
    let K := (H.selectedAt P.x hxA).toCriticalFourShell
    ActualBlockerOmissionExactRowPacket
      D P.x P.y blocker K.support := by
  let hxA := (mem_selectedClass.mp P.x_mem_class).1
  let blocker := H.centerAt P.x hxA
  let K := (H.selectedAt P.x hxA).toCriticalFourShell
  change P.y ∉ K.support ∧
    HasNEquidistantPointsAt 4 (D.A.erase P.y) blocker ∧
    dist blocker P.y ≠ dist blocker P.x at h
  change ActualBlockerOmissionExactRowPacket
    D P.x P.y blocker K.support
  rcases h with ⟨hmate, hsurvives, hmetric⟩
  have hsourceRadius : dist blocker P.x = K.radius :=
    K.support_eq_radius P.x K.q_mem_support
  have hmateNeRadius : dist blocker P.y ≠ K.radius := by
    intro hmateRadius
    exact hmetric (hmateRadius.trans hsourceRadius.symm)
  exact
    { blocker_mem_erase_source := K.center_mem
      source_mem_A := K.q_mem_A
      mate_mem_A := (mem_selectedClass.mp P.y_mem_class).1
      source_ne_mate := P.x_ne_y
      blocker_ne_source := (Finset.mem_erase.mp K.center_mem).1
      support_subset_A := K.support_subset_A
      support_card := K.support_card
      source_mem_support := K.q_mem_support
      mate_not_mem_support := hmate
      blocker_not_mem_support := K.center_not_mem_support
      radius := K.radius
      radius_pos := K.radius_pos
      support_eq_radiusClass := K.support_eq
      support_eq_radius := K.support_eq_radius
      source_eq_radius := hsourceRadius
      mate_ne_radius := hmateNeRadius
      deletion_survives := hsurvives
      mate_radius_ne_source_radius := hmetric
      qDeletedClass :=
        criticalFourShellToU5QDeletedK4ClassOfNotMem K hmate }

#print axioms criticalFourShellToU5QAllowedK4Class
#print axioms criticalFourShellToU5QDeletedK4ClassOfNotMem
#print axioms ActualBlockerOmissionExactRowPacket.false_of_dangerousTriple_subset
#print axioms ActualBlockerOmissionOutcome.exactRowPacket

end ATailRFullParentEntryScratch
end Problem97
