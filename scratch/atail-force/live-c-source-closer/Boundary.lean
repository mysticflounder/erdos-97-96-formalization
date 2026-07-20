/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail
import Erdos9796Proof.P97.CapSelectedRowCounting

/-!
# Exact common boundary of the seven LIVE-C source leaves

This file isolates the strongest uniform consequence of the current seven
`liveData_C_*_false` interfaces and the exact additional packet consumed by
the already-proved ordered-cap terminal.

The uniform row witnesses point in the wrong incidence direction for that
terminal: they lie outside the dangerous base, while the terminal needs two
dangerous-base points outside one cap.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace LiveCSourceCloserScratch

open U1Depth5

/-- The six center cases represented by the seven LIVE-C leaves.  The two
`center_t2` leaves differ only in their additional row-content split. -/
def OuterCenterCase
    {D : CounterexampleData} (p q t1 t2 t3 u source : Plane)
    (row : CriticalRowPacket D source) : Prop :=
  row.center = q ∨
    row.center = t1 ∨
      row.center = t2 ∨
        row.center = t3 ∨
          row.center = u ∨
            (row.center ∈ D.A ∧
              row.center ≠ p ∧
                row.center ≠ q ∧
                  row.center ≠ t1 ∧
                    row.center ≠ t2 ∧
                      row.center ≠ t3 ∧ row.center ≠ u)

/-- Every LIVE-C center case is different from the dangerous-circle center. -/
theorem center_ne_p
    {D : CounterexampleData} {p q t1 t2 t3 u source : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (row : CriticalRowPacket D source)
    (hcase : OuterCenterCase p q t1 t2 t3 u source row) :
    row.center ≠ p := by
  rcases hcase with hq | ht1 | ht2 | ht3 | hu | hfresh
  · simpa [hq] using hfixed.p_ne_q.symm
  · simpa [ht1] using hfixed.p_ne_t1.symm
  · simpa [ht2] using hfixed.p_ne_t2.symm
  · simpa [ht3] using hfixed.p_ne_t3.symm
  · have hu_ne_p : u ≠ p := (Finset.mem_erase.mp H.selected.candidate_mem).1
    simpa [hu] using hu_ne_p
  · exact hfresh.2.1

/-- Uniform positive content of all seven leaves: at least two selected
support points of the extra row lie outside the dangerous four-point base. -/
theorem two_le_support_sdiff_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u source : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (row : CriticalRowPacket D source)
    (hcase : OuterCenterCase p q t1 t2 t3 u source row) :
    2 ≤
      (row.selected.toCriticalFourShell.support \
        ({q, t1, t2, t3} : Finset Plane)).card := by
  classical
  let Krow : SelectedFourClass D.A row.center :=
    row.selected.toSelectedFourClass
  let Kbase : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  have hcenter := center_ne_p hfixed H row hcase
  have hinter : (Krow.support ∩ Kbase.support).card ≤ 2 :=
    SelectedFourClass.inter_card_le_two Krow Kbase hcenter
  have hsplit :
      (Krow.support ∩ Kbase.support).card +
          (Krow.support \ Kbase.support).card = Krow.support.card :=
    Finset.card_inter_add_card_sdiff Krow.support Kbase.support
  have hcard : Krow.support.card = 4 := Krow.support_card
  have htwo : 2 ≤ (Krow.support \ Kbase.support).card := by omega
  simpa [Krow, Kbase,
    CriticalSelectedFourClass.toSelectedFourClass,
    CriticalFourShell.toSelectedFourClass,
    dangerousBaseSelectedFourClass]
    using htwo

/-- Witness form of `two_le_support_sdiff_dangerousBase`. -/
theorem exists_two_support_off_dangerousBase
    {D : CounterexampleData} {p q t1 t2 t3 u source : Plane}
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (row : CriticalRowPacket D source)
    (hcase : OuterCenterCase p q t1 t2 t3 u source row) :
    ∃ x w : Plane,
      x ≠ w ∧
        x ∈ row.selected.toCriticalFourShell.support ∧
        w ∈ row.selected.toCriticalFourShell.support ∧
        x ∉ ({q, t1, t2, t3} : Finset Plane) ∧
        w ∉ ({q, t1, t2, t3} : Finset Plane) := by
  classical
  have htwo := two_le_support_sdiff_dangerousBase hfixed H row hcase
  have hone :
      1 <
        (row.selected.toCriticalFourShell.support \
          ({q, t1, t2, t3} : Finset Plane)).card := by omega
  rcases Finset.one_lt_card.mp hone with ⟨x, hx, w, hw, hxw⟩
  rcases Finset.mem_sdiff.mp hx with ⟨hxSupport, hxOff⟩
  rcases Finset.mem_sdiff.mp hw with ⟨hwSupport, hwOff⟩
  exact ⟨x, w, hxw, hxSupport, hwSupport, hxOff, hwOff⟩

/-- The exact additional producer needed to feed the existing same-cap
ordered-chain contradiction using the fixed dangerous circle as one center. -/
structure SameCapDangerousPairProducer
    {D : CounterexampleData} (S : SurplusCapPacket D.A)
    (p q t1 t2 t3 source : Plane)
    (row : CriticalRowPacket D source) where
  capIndex : Fin 3
  p_mem_cap : p ∈ S.capByIndex capIndex
  center_mem_cap : row.center ∈ S.capByIndex capIndex
  x : Plane
  w : Plane
  x_mem_row : x ∈ row.selected.toCriticalFourShell.support
  w_mem_row : w ∈ row.selected.toCriticalFourShell.support
  x_mem_dangerous : x ∈ ({q, t1, t2, t3} : Finset Plane)
  w_mem_dangerous : w ∈ ({q, t1, t2, t3} : Finset Plane)
  x_ne_w : x ≠ w
  x_not_mem_cap : x ∉ S.capByIndex capIndex
  w_not_mem_cap : w ∉ S.capByIndex capIndex

private theorem false_of_two_cap_centers_equidistant_outside_pair
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {c apex a b : Plane}
    (hcCap : c ∈ S.capByIndex k)
    (hapexCap : apex ∈ S.capByIndex k)
    (hc_ne_apex : c ≠ apex)
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
    (hcEq : dist c a = dist c b)
    (hapexEq : dist apex a = dist apex b) : False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hapexImage : apex ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hapexCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hapexImage with ⟨ia, _hia, hia⟩
  have hic_ne_ia : ic ≠ ia := by
    intro h
    apply hc_ne_apex
    calc
      c = L.points ic := hic.symm
      _ = L.points ia := by simp [h]
      _ = apex := hia
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  rcases lt_or_gt_of_ne hic_ne_ia with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt haA hbA haOutside hbOutside hab
        (by simpa [hic] using hcEq) (by simpa [hia] using hapexEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt haA hbA haOutside hbOutside hab
        (by simpa [hia] using hapexEq) (by simpa [hic] using hcEq)

/-- Once the missing producer is supplied, the existing ordered-cap theorem
closes every LIVE-C center case directly. -/
theorem false_of_sameCapDangerousPairProducer
    {D : CounterexampleData} {p q t1 t2 t3 u source : Plane}
    (S : SurplusCapPacket D.A)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (row : CriticalRowPacket D source)
    (hcase : OuterCenterCase p q t1 t2 t3 u source row)
    (P : SameCapDangerousPairProducer S p q t1 t2 t3 source row) :
    False := by
  classical
  let Kp : SelectedFourClass D.A p :=
    dangerousBaseSelectedFourClass hfixed
  have hxK : P.x ∈ Kp.support := by
    simpa [Kp, dangerousBaseSelectedFourClass]
      using P.x_mem_dangerous
  have hwK : P.w ∈ Kp.support := by
    simpa [Kp, dangerousBaseSelectedFourClass]
      using P.w_mem_dangerous
  have hxA : P.x ∈ D.A := Kp.support_subset_A hxK
  have hwA : P.w ∈ D.A := Kp.support_subset_A hwK
  have hpEq : dist p P.x = dist p P.w :=
    (Kp.support_eq_radius P.x hxK).trans
      (Kp.support_eq_radius P.w hwK).symm
  have hcEq : dist row.center P.x = dist row.center P.w :=
    (row.selected.toCriticalFourShell.support_eq_radius P.x P.x_mem_row).trans
      (row.selected.toCriticalFourShell.support_eq_radius P.w P.w_mem_row).symm
  exact false_of_two_cap_centers_equidistant_outside_pair
    S P.capIndex P.center_mem_cap P.p_mem_cap
      (center_ne_p hfixed H row hcase) hxA hwA P.x_ne_w
      P.x_not_mem_cap P.w_not_mem_cap hcEq hpEq

/-- The actually produced uniform witness cannot itself instantiate the
dangerous-pair fields: both of its endpoints lie outside the dangerous base. -/
theorem offDangerous_pair_not_dangerous
    {q t1 t2 t3 x w : Plane}
    (hx : x ∉ ({q, t1, t2, t3} : Finset Plane))
    (hw : w ∉ ({q, t1, t2, t3} : Finset Plane)) :
    ¬ (x ∈ ({q, t1, t2, t3} : Finset Plane) ∨
      w ∈ ({q, t1, t2, t3} : Finset Plane)) := by
  intro h
  rcases h with h | h
  · exact hx h
  · exact hw h

#print axioms center_ne_p
#print axioms two_le_support_sdiff_dangerousBase
#print axioms exists_two_support_off_dangerousBase
#print axioms false_of_sameCapDangerousPairProducer
#print axioms offDangerous_pair_not_dangerous

end LiveCSourceCloserScratch
end Problem97
