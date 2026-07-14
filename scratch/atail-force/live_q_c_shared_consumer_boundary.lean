/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Shared LIVE-Q / LIVE-C consumer boundary

This scratch module records two consumer-side facts used by the audit of the
four LIVE-Q and seven LIVE-C helpers.

* The same-cap contradiction does not intrinsically need a selected `t2` row:
  the fixed dangerous `p`-circle already supplies the first center and its
  equal-distance pair.
* Every outer LIVE-C center case is a non-`p` center, and hence its additional
  `f2` critical row has two same-radius support points off the dangerous base.

The second statement is not the same-cap producer.  Its pair lies outside the
dangerous base, whereas the same-cap sink needs two dangerous-base points on
the second center's circle, together with common-cap placement and
outside-that-cap confinement.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATAILForceScratch

open U1Depth5

/-- The six center-value families represented by the seven LIVE-C helpers.
The two `center_t2` helpers share the same center case and differ only in their
additional row-content split.  The definition is source-generic because none
of the center cases identifies the additional row's source. -/
def LiveCOuterCenterCaseOfSource
    {D : CounterexampleData} (p q t1 t2 t3 u source : Plane)
    (f2Row : CriticalRowPacket D source) : Prop :=
  f2Row.center = q ∨
    f2Row.center = t1 ∨
      f2Row.center = t2 ∨
        f2Row.center = t3 ∨
          f2Row.center = u ∨
            (f2Row.center ∈ D.A ∧
              f2Row.center ≠ p ∧
                f2Row.center ≠ q ∧
                  f2Row.center ≠ t1 ∧
                    f2Row.center ≠ t2 ∧
                      f2Row.center ≠ t3 ∧
                        f2Row.center ≠ u)

/-- Every outer LIVE-C branch has blocker center different from the dangerous
apex `p`. -/
theorem center_ne_p_of_liveCOuterCenterCase
    {D : CounterexampleData} {p q t1 t2 t3 u source : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (f2Row : CriticalRowPacket D source)
    (hcase : LiveCOuterCenterCaseOfSource p q t1 t2 t3 u source f2Row) :
    f2Row.center ≠ p := by
  rcases hcase with hq | ht1 | ht2 | ht3 | hu | hfresh
  · simpa [hq] using hfixed.p_ne_q.symm
  · simpa [ht1] using hfixed.p_ne_t1.symm
  · simpa [ht2] using hfixed.p_ne_t2.symm
  · simpa [ht3] using hfixed.p_ne_t3.symm
  · have hu_ne_p : u ≠ p := (Finset.mem_erase.mp H.selected.candidate_mem).1
    simpa [hu] using hu_ne_p
  · exact hfresh.2.1

/-- Uniform positive content of all seven LIVE-C helpers: two distinct points
of the additional row lie off the exact dangerous four-point base. -/
theorem exists_two_f2Row_support_off_dangerousBase_of_liveCOuterCenterCase
    {D : CounterexampleData} {p q t1 t2 t3 u source : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (f2Row : CriticalRowPacket D source)
    (hcase : LiveCOuterCenterCaseOfSource p q t1 t2 t3 u source f2Row) :
    ∃ x w : Plane,
      x ≠ w ∧
        x ∈ f2Row.selected.toCriticalFourShell.support ∧
        w ∈ f2Row.selected.toCriticalFourShell.support ∧
        x ∉ ({q, t1, t2, t3} : Finset Plane) ∧
        w ∉ ({q, t1, t2, t3} : Finset Plane) := by
  classical
  let Krow : SelectedFourClass D.A f2Row.center :=
    f2Row.selected.toSelectedFourClass
  let Kbase : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  have hcenter_ne_p :=
    center_ne_p_of_liveCOuterCenterCase hfixed H f2Row hcase
  have hinter_le : (Krow.support ∩ Kbase.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two Krow Kbase hcenter_ne_p
  have hsplit :
      (Krow.support ∩ Kbase.support).card +
          (Krow.support \ Kbase.support).card = Krow.support.card :=
    Finset.card_inter_add_card_sdiff Krow.support Kbase.support
  have hrow_card : Krow.support.card = 4 := Krow.support_card
  have htwo : 2 ≤ (Krow.support \ Kbase.support).card := by omega
  have hone : 1 < (Krow.support \ Kbase.support).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  rcases Finset.mem_sdiff.mp hx with ⟨hxSupport, hxOff⟩
  rcases Finset.mem_sdiff.mp hw with ⟨hwSupport, hwOff⟩
  exact ⟨x, w, hxw,
    by simpa [Krow, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using hxSupport,
    by simpa [Krow, CriticalSelectedFourClass.toSelectedFourClass,
      CriticalFourShell.toSelectedFourClass] using hwSupport,
    by simpa [Kbase, dangerousBaseSelectedFourClass] using hxOff,
    by simpa [Kbase, dangerousBaseSelectedFourClass] using hwOff⟩

/-- Direct fixed-dangerous-circle form of the existing same-cap producer
boundary. -/
def FixedDangerousSameCapSecondCenter
    {A : Finset Plane} (S : SurplusCapPacket A)
    (p q t1 t2 t3 : Plane) : Prop :=
  ∃ k : Fin 3, ∃ c x w : Plane,
    p ∈ S.capByIndex k ∧
    c ∈ S.capByIndex k ∧
    c ≠ p ∧
    x ∈ ({q, t1, t2, t3} : Finset Plane) ∧
    w ∈ ({q, t1, t2, t3} : Finset Plane) ∧
    x ≠ w ∧
    x ∉ S.capByIndex k ∧
    w ∉ S.capByIndex k ∧
    dist c x = dist c w

private theorem false_of_sameCap_outsidePair_twoCenters_fixedBoundary
    {A : Finset Plane} (S : SurplusCapPacket A)
    (hconv : ConvexIndep A) (k : Fin 3)
    {p c x w : Plane}
    (hpCap : p ∈ S.capByIndex k)
    (hcCap : c ∈ S.capByIndex k)
    (hpc : c ≠ p)
    (hxA : x ∈ A) (hwA : w ∈ A) (hxw : x ≠ w)
    (hxOff : x ∉ S.capByIndex k) (hwOff : w ∉ S.capByIndex k)
    (hpdist : dist p x = dist p w)
    (hcdist : dist c x = dist c w) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData hconv k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hpImage : p ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hpCap
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  rcases Finset.mem_image.mp hpImage with ⟨r, _hr, hrp⟩
  rcases Finset.mem_image.mp hcImage with ⟨s, _hs, hsc⟩
  have hrs : r ≠ s := by
    intro hrs
    apply hpc
    calc
      c = L.points s := hsc.symm
      _ = L.points r := by simp [hrs]
      _ = p := hrp
  have hxOutside : x ∉ Finset.univ.image L.points := by
    simpa [hcap] using hxOff
  have hwOutside : w ∉ Finset.univ.image L.points := by
    simpa [hcap] using hwOff
  rcases lt_or_gt_of_ne hrs with hrs' | hsr'
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv Hord Packet.mem_A hrs' hxA hwA hxOutside hwOutside hxw
        (by simpa [hrp] using hpdist) (by simpa [hsc] using hcdist)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      hconv Hord Packet.mem_A hsr' hxA hwA hxOutside hwOutside hxw
        (by simpa [hsc] using hcdist) (by simpa [hrp] using hpdist)

/-- The same-cap sink can consume the fixed dangerous circle directly; no
intermediate `t2`-row realization of that circle is required. -/
theorem false_of_fixedDangerousSameCapSecondCenter
    {D : CounterexampleData} {p q t1 t2 t3 : Plane}
    (S : SurplusCapPacket D.A)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (W : FixedDangerousSameCapSecondCenter S p q t1 t2 t3) :
    False := by
  classical
  rcases W with ⟨k, c, x, w, hpCap, hcCap, hcp, hxB, hwB, hxw,
    hxOff, hwOff, hcdist⟩
  let Kp : SelectedFourClass D.A p := dangerousBaseSelectedFourClass hfixed
  have hxK : x ∈ Kp.support := by
    simpa [Kp, dangerousBaseSelectedFourClass] using hxB
  have hwK : w ∈ Kp.support := by
    simpa [Kp, dangerousBaseSelectedFourClass] using hwB
  have hxA : x ∈ D.A := Kp.support_subset_A hxK
  have hwA : w ∈ D.A := Kp.support_subset_A hwK
  have hpdist : dist p x = dist p w :=
    (Kp.support_eq_radius x hxK).trans (Kp.support_eq_radius w hwK).symm
  exact false_of_sameCap_outsidePair_twoCenters_fixedBoundary
    S D.convex k hpCap hcCap hcp hxA hwA hxw hxOff hwOff hpdist hcdist

/-- The special `center_t2_named` LIVE-C helper supplies exactly the
equilateral-star prefix of the five-row circle-intersection consumer under
the assignment `O = p`, `A = t2`, `C = q`. -/
theorem center_t2_named_equilateral_star
    {D : CounterexampleData} {p q t1 t2 t3 source : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (f2Row : CriticalRowPacket D source)
    (hcenter : f2Row.center = t2)
    (hp_named :
      p = f2Row.selected.l1 ∨ p = f2Row.selected.l2 ∨
        p = f2Row.selected.l3 ∨ p = f2Row.selected.l4)
    (hq_named :
      q = f2Row.selected.l1 ∨ q = f2Row.selected.l2 ∨
        q = f2Row.selected.l3 ∨ q = f2Row.selected.l4) :
    dist p t2 = dist p q ∧
      dist t2 p = dist p q ∧
        dist t2 q = dist p q := by
  have hp_on :
      dist t2 p = f2Row.selected.toCriticalFourShell.radius := by
    simpa [hcenter] using f2Row.point_on_shell_of_eq_named hp_named
  have hq_on :
      dist t2 q = f2Row.selected.toCriticalFourShell.radius := by
    simpa [hcenter] using f2Row.point_on_shell_of_eq_named hq_named
  refine ⟨hfixed.t2_same_radius, ?_, ?_⟩
  · exact (dist_comm t2 p).trans hfixed.t2_same_radius
  · exact (hq_on.trans hp_on.symm).trans
      ((dist_comm t2 p).trans hfixed.t2_same_radius)

#print axioms center_ne_p_of_liveCOuterCenterCase
#print axioms exists_two_f2Row_support_off_dangerousBase_of_liveCOuterCenterCase
#print axioms false_of_fixedDangerousSameCapSecondCenter
#print axioms center_t2_named_equilateral_star

end ATAILForceScratch
end Problem97
