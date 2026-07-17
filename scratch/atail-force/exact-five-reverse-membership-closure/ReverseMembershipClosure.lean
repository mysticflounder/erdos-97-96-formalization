/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.LargeCapUniqueFivePhysicalOmissionCycle
import Erdos9796Proof.P97.U5GlobalIncidenceSupport

/-!
# Scratch: exact-five reverse-membership closure audit

This file records the strongest source-faithful consequences currently
available from the `all_reverseMembership` arm of the physical actual-critical
omission cycle.

For every cycle edge, the current source belongs to the successor source's
actual critical shell.  Hence deleting the current source is blocked at two
distinct actual centers: its own blocker and the successor source's blocker.
The successor blocker is forced into the same strict physical cap, and its
exact four-shell meets that cap in exactly the adjacent physical pair.  The
other two shell points therefore lie outside the cap.

The final theorem isolates the exact missing field for the existing ordered-
cap terminal: two distinct cycle rows sharing their two outside-shell points.
Nothing in the current reverse-membership packet produces that repeated pair.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveReverseMembershipClosureScratch

open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionSuccessor
open ATailLargeCapUniqueFive
open ATailCriticalPairFrontier
open ATailTwoCenterCapLocalization

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Forget the source-critical exactness and expose a critical shell as a
q-allowed four-point class. -/
def criticalShellToQAllowedK4Class
    {D : CounterexampleData} {source center : ℝ²}
    (R : CriticalFourShell D.A source center) :
    U5QAllowedK4Class D center R.support where
  subset := by
    intro z hz
    exact Finset.mem_erase.mpr
      ⟨fun hzc ↦ R.center_not_mem_support (hzc ▸ hz), R.support_subset_A hz⟩
  card_four := by rw [R.support_card]
  radius := R.radius
  radius_pos := R.radius_pos
  same_radius := R.support_eq_radius

/-- Any point of an exact critical shell can be regarded as the deleted point
of a q-critical triple at that shell's center. -/
theorem qCriticalTriple_of_mem_criticalShell
    {D : CounterexampleData} {source q center : ℝ²}
    (R : CriticalFourShell D.A source center)
    (hq : q ∈ R.support) :
    Nonempty (U5QCriticalTripleClass D q center (R.support.erase q)) :=
  (criticalShellToQAllowedK4Class R).qCriticalTriple_of_mem_q
    R.support_card hq

/-- Reverse membership says the current source deletion fails K4 at the
successor source's actual blocker. -/
theorem reverse_source_deletion_fails_at_successorBlocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (i : Fin K.period) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase (K.source i).1)
      (H.centerAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex i)))) := by
  intro hsurvives
  exact ((cross_deletion_survives_iff_not_mem_selected_support H
    (PhysicalVertex.mem_A
      (K.source (K.successorIndex i)))).mp hsurvives) (hreverse i)

/-- The reverse-positive arm cannot be a 2-cycle: the reverse membership of
one edge is the forward omission of the other edge. -/
theorem period_ne_two_of_all_reverseMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support) :
    K.period ≠ 2 := by
  intro hperiod
  let i : Fin K.period := ⟨0, lt_of_lt_of_le Nat.zero_lt_two K.two_le_period⟩
  have htwice : K.successorIndex (K.successorIndex i) = i := by
    apply Fin.ext
    change ((1 % K.period + 1) % K.period) = 0
    simp [hperiod]
  have hforward := K.successor_not_mem_actualCriticalSupport
    (K.successorIndex i)
  rw [htwice] at hforward
  exact hforward (hreverse i)

/-- Thus the reverse-positive cycle has period three, four, or five. -/
theorem three_le_period_of_all_reverseMembership
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support) :
    3 ≤ K.period := by
  have hne := period_ne_two_of_all_reverseMembership K hreverse
  have htwo := K.two_le_period
  omega

/-- The successor source's actual blocker bisects the adjacent physical pair,
so it lies in the same strict physical cap. -/
theorem successor_actualBlocker_mem_physicalCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (i : Fin K.period) :
    H.centerAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A (K.source (K.successorIndex i))) ∈
      S.capInteriorByIndex S.oppIndex2 := by
  let R := (H.selectedAt (K.source (K.successorIndex i)).1
    (PhysicalVertex.mem_A
      (K.source (K.successorIndex i)))).toCriticalFourShell
  have hcenterA :
      H.centerAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i))) ∈ D.A :=
    (Finset.mem_erase.mp R.center_mem).2
  have hsourcesNe : (K.source i).1 ≠ (K.source (K.successorIndex i)).1 := by
    intro h
    apply K.successor_source_ne i
    exact Subtype.ext h.symm
  have hcenterEq :
      dist (H.centerAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i))))
          (K.source i).1 =
        dist (H.centerAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i))))
          (K.source (K.successorIndex i)).1 :=
    (R.support_eq_radius (K.source i).1 (hreverse i)).trans
      (R.support_eq_radius (K.source (K.successorIndex i)).1
        R.q_mem_support).symm
  have hphysicalEq :
      dist S.oppApex2 (K.source i).1 =
        dist S.oppApex2 (K.source (K.successorIndex i)).1 :=
    (mem_selectedClass.mp (K.source_mem_A_and_radiusClass i).2).2.trans
      (mem_selectedClass.mp
        (K.source_mem_A_and_radiusClass (K.successorIndex i)).2).2.symm
  exact commonPhysicalPair_center_mem_secondCapInterior
    hcenterA (K.actualBlocker_ne_physicalApex (K.successorIndex i))
    (K.source_mem_capInterior i)
    (K.source_mem_capInterior (K.successorIndex i))
    hsourcesNe hcenterEq hphysicalEq

/-- In the reverse-positive arm, the successor actual shell meets the physical
cap in exactly the adjacent source pair. -/
theorem successor_actualCriticalSupport_inter_physicalCap_eq_pair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (i : Fin K.period) :
    ((H.selectedAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex i)))).toCriticalFourShell.support ∩
      S.capByIndex S.oppIndex2) =
        ({(K.source i).1,
          (K.source (K.successorIndex i)).1} : Finset ℝ²) := by
  let R := (H.selectedAt (K.source (K.successorIndex i)).1
    (PhysicalVertex.mem_A
      (K.source (K.successorIndex i)))).toCriticalFourShell
  have hsourcesNe : (K.source i).1 ≠ (K.source (K.successorIndex i)).1 := by
    intro h
    apply K.successor_source_ne i
    exact Subtype.ext h.symm
  have hcenterCap :
      H.centerAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i))) ∈
        S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (successor_actualBlocker_mem_physicalCapInterior K hreverse i)
  have hpairSub :
      ({(K.source i).1,
        (K.source (K.successorIndex i)).1} : Finset ℝ²) ⊆
        R.support ∩ S.capByIndex S.oppIndex2 := by
    intro z hz
    rcases Finset.mem_insert.mp hz with hz | hz
    · subst z
      exact Finset.mem_inter.mpr ⟨hreverse i,
        S.capInteriorByIndex_subset_capByIndex S.oppIndex2
          (K.source_mem_capInterior i)⟩
    · have hz' : z = (K.source (K.successorIndex i)).1 := by simpa using hz
      subst z
      exact Finset.mem_inter.mpr ⟨R.q_mem_support,
        S.capInteriorByIndex_subset_capByIndex S.oppIndex2
          (K.source_mem_capInterior (K.successorIndex i))⟩
  have hinterLe :
      (R.support ∩ S.capByIndex S.oppIndex2).card ≤ 2 :=
    CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
      S D.convex S.oppIndex2 R.toSelectedFourClass hcenterCap
  exact (Finset.eq_of_subset_of_card_le hpairSub (by
    simpa [hsourcesNe] using hinterLe)).symm

/-- The two remaining points of the successor actual shell lie outside the
physical cap. -/
theorem successor_actualCriticalSupport_outside_physicalCap_card_eq_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (i : Fin K.period) :
    (((H.selectedAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex i)))).toCriticalFourShell.support \
      S.capByIndex S.oppIndex2).card = 2) := by
  let R := (H.selectedAt (K.source (K.successorIndex i)).1
    (PhysicalVertex.mem_A
      (K.source (K.successorIndex i)))).toCriticalFourShell
  have hsourcesNe : (K.source i).1 ≠ (K.source (K.successorIndex i)).1 := by
    intro h
    apply K.successor_source_ne i
    exact Subtype.ext h.symm
  have hinter := successor_actualCriticalSupport_inter_physicalCap_eq_pair
    K hreverse i
  have hsplit := Finset.card_sdiff_add_card_inter
    R.support (S.capByIndex S.oppIndex2)
  change (R.support \ S.capByIndex S.oppIndex2).card = 2
  rw [show R.support ∩ S.capByIndex S.oppIndex2 =
      ({(K.source i).1,
        (K.source (K.successorIndex i)).1} : Finset ℝ²) by
    simpa [R] using hinter] at hsplit
  rw [R.support_card] at hsplit
  simpa [hsourcesNe] using hsplit

/-- After erasing the common deleted source, the two consecutive q-critical
triple supports share at most one surviving point. -/
theorem consecutive_qCriticalSupports_inter_card_le_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (i : Fin K.period) :
    ((((H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support.erase
            (K.source i).1) ∩
        ((H.selectedAt (K.source i).1
          (PhysicalVertex.mem_A
            (K.source i))).toCriticalFourShell.support.erase
            (K.source i).1)).card ≤ 1) := by
  let Rnext := (H.selectedAt (K.source (K.successorIndex i)).1
    (PhysicalVertex.mem_A
      (K.source (K.successorIndex i)))).toCriticalFourShell
  let Rown := (H.selectedAt (K.source i).1
    (PhysicalVertex.mem_A (K.source i))).toCriticalFourShell
  have hcommon : (K.source i).1 ∈ Rnext.support ∩ Rown.support :=
    Finset.mem_inter.mpr ⟨hreverse i, Rown.q_mem_support⟩
  have herase :
      (Rnext.support.erase (K.source i).1) ∩
          (Rown.support.erase (K.source i).1) =
        (Rnext.support ∩ Rown.support).erase (K.source i).1 := by
    ext z
    simp only [Finset.mem_inter, Finset.mem_erase]
    tauto
  have hinterLe := K.successor_actualCriticalSupport_inter_card_le_two i
  change ((Rnext.support.erase (K.source i).1) ∩
    (Rown.support.erase (K.source i).1)).card ≤ 1
  rw [herase, Finset.card_erase_of_mem hcommon]
  change (Rnext.support ∩ Rown.support).card ≤ 2 at hinterLe
  omega

/-- Each reverse edge exposes two distinct q-critical centers for the current
source deletion. -/
structure ReverseMembershipQCriticalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (i : Fin K.period) where
  own : Nonempty (U5QCriticalTripleClass D (K.source i).1
    (H.centerAt (K.source i).1 (PhysicalVertex.mem_A (K.source i)))
    ((H.selectedAt (K.source i).1
      (PhysicalVertex.mem_A (K.source i))).toCriticalFourShell.support.erase
        (K.source i).1))
  successor : Nonempty (U5QCriticalTripleClass D (K.source i).1
    (H.centerAt (K.source (K.successorIndex i)).1
      (PhysicalVertex.mem_A (K.source (K.successorIndex i))))
    ((H.selectedAt (K.source (K.successorIndex i)).1
      (PhysicalVertex.mem_A
        (K.source (K.successorIndex i)))).toCriticalFourShell.support.erase
          (K.source i).1))
  centers_ne :
    H.centerAt (K.source i).1 (PhysicalVertex.mem_A (K.source i)) ≠
      H.centerAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A (K.source (K.successorIndex i)))

/-- Construct the two-center q-critical packet directly from reverse
membership and the retained global critical map. -/
theorem nonempty_reverseMembershipQCriticalPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (i : Fin K.period) :
    Nonempty (ReverseMembershipQCriticalPair K i) := by
  refine ⟨{
    own := qCriticalTriple_of_mem_criticalShell
      (H.selectedAt (K.source i).1
        (PhysicalVertex.mem_A (K.source i))).toCriticalFourShell
      (H.selectedAt (K.source i).1
        (PhysicalVertex.mem_A (K.source i))).toCriticalFourShell.q_mem_support
    successor := qCriticalTriple_of_mem_criticalShell
      (H.selectedAt (K.source (K.successorIndex i)).1
        (PhysicalVertex.mem_A
          (K.source (K.successorIndex i)))).toCriticalFourShell
      (hreverse i)
    centers_ne := (K.successor_actualBlockers_ne i).symm }⟩

/-- Existing ordered-cap terminal specialized to two reverse-positive cycle
rows.  The exact missing producer is the two common outside-cap support points
`a,b`; once supplied, the branch closes immediately. -/
theorem false_of_two_reverseRows_common_outsidePair
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : ∀ i : Fin K.period,
      (K.source i).1 ∈
        (H.selectedAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A
            (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (i j : Fin K.period)
    (hcenters :
      H.centerAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i))) ≠
        H.centerAt (K.source (K.successorIndex j)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex j))))
    {a b : ℝ²}
    (ha_i : a ∈ (H.selectedAt (K.source (K.successorIndex i)).1
      (PhysicalVertex.mem_A
        (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (hb_i : b ∈ (H.selectedAt (K.source (K.successorIndex i)).1
      (PhysicalVertex.mem_A
        (K.source (K.successorIndex i)))).toCriticalFourShell.support)
    (ha_j : a ∈ (H.selectedAt (K.source (K.successorIndex j)).1
      (PhysicalVertex.mem_A
        (K.source (K.successorIndex j)))).toCriticalFourShell.support)
    (hb_j : b ∈ (H.selectedAt (K.source (K.successorIndex j)).1
      (PhysicalVertex.mem_A
        (K.source (K.successorIndex j)))).toCriticalFourShell.support)
    (haOutside : a ∉ S.capByIndex S.oppIndex2)
    (hbOutside : b ∉ S.capByIndex S.oppIndex2)
    (hab : a ≠ b) : False := by
  let R_i := (H.selectedAt (K.source (K.successorIndex i)).1
    (PhysicalVertex.mem_A
      (K.source (K.successorIndex i)))).toCriticalFourShell
  let R_j := (H.selectedAt (K.source (K.successorIndex j)).1
    (PhysicalVertex.mem_A
      (K.source (K.successorIndex j)))).toCriticalFourShell
  have hci :
      H.centerAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i))) ∈
        S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (successor_actualBlocker_mem_physicalCapInterior K hreverse i)
  have hcj :
      H.centerAt (K.source (K.successorIndex j)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex j))) ∈
        S.capByIndex S.oppIndex2 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex2
      (successor_actualBlocker_mem_physicalCapInterior K hreverse j)
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hciImage :
      H.centerAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i))) ∈
        Finset.univ.image L.points := by
    rw [hcap]
    exact hci
  have hcjImage :
      H.centerAt (K.source (K.successorIndex j)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex j))) ∈
        Finset.univ.image L.points := by
    rw [hcap]
    exact hcj
  rcases Finset.mem_image.mp hciImage with ⟨r, _hr, hri⟩
  rcases Finset.mem_image.mp hcjImage with ⟨s, _hs, hsj⟩
  have hrs : r ≠ s := by
    intro hrs
    apply hcenters
    calc
      H.centerAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i))) =
          L.points r := hri.symm
      _ = L.points s := by simp [hrs]
      _ = H.centerAt (K.source (K.successorIndex j)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex j))) := hsj
  have haA : a ∈ D.A := R_i.support_subset_A ha_i
  have hbA : b ∈ D.A := R_i.support_subset_A hb_i
  have haOutsideImage : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOutside
  have hbOutsideImage : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOutside
  have hiEq :
      dist (H.centerAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i)))) a =
        dist (H.centerAt (K.source (K.successorIndex i)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex i)))) b :=
    (R_i.support_eq_radius a ha_i).trans
      (R_i.support_eq_radius b hb_i).symm
  have hjEq :
      dist (H.centerAt (K.source (K.successorIndex j)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex j)))) a =
        dist (H.centerAt (K.source (K.successorIndex j)).1
          (PhysicalVertex.mem_A (K.source (K.successorIndex j)))) b :=
    (R_j.support_eq_radius a ha_j).trans
      (R_j.support_eq_radius b hb_j).symm
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hrs' haA hbA haOutsideImage hbOutsideImage hab
      (by simpa [hri] using hiEq)
      (by simpa [hsj] using hjEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hsr' haA hbA haOutsideImage hbOutsideImage hab
      (by simpa [hsj] using hjEq)
      (by simpa [hri] using hiEq)

#print axioms qCriticalTriple_of_mem_criticalShell
#print axioms reverse_source_deletion_fails_at_successorBlocker
#print axioms period_ne_two_of_all_reverseMembership
#print axioms three_le_period_of_all_reverseMembership
#print axioms successor_actualBlocker_mem_physicalCapInterior
#print axioms successor_actualCriticalSupport_inter_physicalCap_eq_pair
#print axioms successor_actualCriticalSupport_outside_physicalCap_card_eq_two
#print axioms consecutive_qCriticalSupports_inter_card_le_one
#print axioms nonempty_reverseMembershipQCriticalPair
#print axioms false_of_two_reverseRows_common_outsidePair

end

end ATailExactFiveReverseMembershipClosureScratch
end Problem97
