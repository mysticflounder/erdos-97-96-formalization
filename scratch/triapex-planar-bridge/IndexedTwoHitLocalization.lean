import Erdos9796Proof.P97.ATail.FrontierLiveClosure

open scoped EuclideanGeometry

namespace Problem97
namespace TriApexIndexedScratch

attribute [local instance] Classical.propDecidable

private theorem oppositeVertexByIndex_mem_capByIndex_of_ne
    {A : Finset ℝ²} (S : SurplusCapPacket A) {i j : Fin 3}
    (hij : i ≠ j) :
    S.oppositeVertexByIndex i ∈ S.capByIndex j := by
  fin_cases i <;> fin_cases j
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C1
  · exact False.elim (hij rfl)
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.capByIndex] using S.partition.v3_mem_C2
  · exact False.elim (hij rfl)

private theorem false_of_two_cap_centers_equidistant_outside_pair
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {c apex a b : ℝ²}
    (hcCap : c ∈ S.capByIndex k)
    (hapexCap : apex ∈ S.capByIndex k)
    (hc_ne_apex : c ≠ apex)
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
    (hcEq : dist c a = dist c b)
    (hapexEq : dist apex a = dist apex b) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, data, _Hside, Hord, hcap⟩
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
      D.convex Hord data.mem_A hlt haA hbA haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hia] using hapexEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord data.mem_A hgt haA hbA haOutside hbOutside hab
      (by simpa [hia] using hapexEq)
      (by simpa [hic] using hcEq)

/-- Any carrier point other than an indexed opposite apex that is equidistant
from a distinct selected pair in the strict opposite cap belongs to that same
strict cap. -/
theorem bisectorCenter_mem_oppositeCapInterior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {i : Fin 3} {r : ℝ}
    {q w c : ℝ²}
    (hq : q ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
      S.capInteriorByIndex i)
    (hw : w ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
      S.capInteriorByIndex i)
    (hqw : q ≠ w)
    (hcA : c ∈ D.A)
    (hcApex : c ≠ S.oppositeVertexByIndex i)
    (hcEq : dist c q = dist c w) :
    c ∈ S.capInteriorByIndex i := by
  classical
  have hqClass := (Finset.mem_inter.mp hq).1
  have hwClass := (Finset.mem_inter.mp hw).1
  have hqInterior := (Finset.mem_inter.mp hq).2
  have hwInterior := (Finset.mem_inter.mp hw).2
  have hqA := (mem_selectedClass.mp hqClass).1
  have hwA := (mem_selectedClass.mp hwClass).1
  have hc_ne_left : c ≠ S.leftOuterVertexByIndex i := by
    intro hc
    have hne := S.capInterior_pair_dist_ne_leftOuter_of_selectedClass
      i hqInterior hwInterior hqw hqClass hwClass
    apply hne
    simpa [hc, dist_comm] using hcEq
  have hc_ne_right : c ≠ S.rightOuterVertexByIndex i := by
    intro hc
    have hne := S.capInterior_pair_dist_ne_rightOuter_of_selectedClass
      i hqInterior hwInterior hqw hqClass hwClass
    apply hne
    simpa [hc, dist_comm] using hcEq
  have hc_not_triangle : c ∉ S.triangle.verts := by
    intro hcTriangle
    rcases S.mem_triangle_verts_cases hcTriangle with hc | hc | hc
    all_goals
      fin_cases i <;>
      simp_all [SurplusCapPacket.oppositeVertexByIndex,
        SurplusCapPacket.leftOuterVertexByIndex,
        SurplusCapPacket.rightOuterVertexByIndex]
  rcases S.mem_triangle_verts_or_exists_capInteriorByIndex_of_mem hcA with
    hcTriangle | ⟨j, hcInterior⟩
  · exact False.elim (hc_not_triangle hcTriangle)
  · have hj : j = i := by
      by_contra hji
      have hij : i ≠ j := Ne.symm hji
      have hcCap : c ∈ S.capByIndex j :=
        S.capInteriorByIndex_subset_capByIndex j hcInterior
      have hapexCap : S.oppositeVertexByIndex i ∈ S.capByIndex j :=
        oppositeVertexByIndex_mem_capByIndex_of_ne S hij
      have hqOff : q ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hqInterior hij
      have hwOff : w ∉ S.capByIndex j :=
        S.capInteriorByIndex_not_mem_capByIndex_of_ne hwInterior hij
      have hapexEq :
          dist (S.oppositeVertexByIndex i) q =
            dist (S.oppositeVertexByIndex i) w :=
        (mem_selectedClass.mp hqClass).2.trans
          (mem_selectedClass.mp hwClass).2.symm
      exact false_of_two_cap_centers_equidistant_outside_pair S j
        hcCap hapexCap hcApex hqA hwA hqw hqOff hwOff hcEq hapexEq
    simpa [hj] using hcInterior

/-- If a canonical critical shell has at least two points in one indexed
opposite-apex radius class inside the strict opposite cap, then its blocker
center lies in that strict cap.  Only the local unique-four fact at this
blocker is needed from the global critical-shell cover. -/
theorem criticalShellCenter_mem_oppositeCapInterior_of_two_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hrich :
      ATailApexRichClassStructure.ApexRichClassStructure
        D.A (S.oppositeVertexByIndex i))
    (hunique :
      ATailMinimalUniqueFourCover.IsUniqueFourCenter
        D.A (H.centerAt x hx))
    {r : ℝ}
    (htwo :
      2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card) :
    H.centerAt x hx ∈ S.capInteriorByIndex i := by
  classical
  have hcA : H.centerAt x hx ∈ D.A :=
    (Finset.mem_erase.mp
      (H.selectedAt x hx).toCriticalFourShell.center_mem).2
  have hcApex :
      H.centerAt x hx ≠ S.oppositeVertexByIndex i := by
    intro hc
    apply
      ATailMinimalUniqueFourCover.not_isUniqueFourCenter_of_fullyDeletionRobust
        (ATailApexRichClassStructure.fullyDeletionRobustAt_of_apexRichClassStructure
          hrich)
    simpa [hc] using hunique
  have hone :
      1 < ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card := by
    omega
  rw [Finset.one_lt_card] at hone
  obtain ⟨q, hq, w, hw, hqw⟩ := hone
  have hq' := Finset.mem_inter.mp hq
  have hw' := Finset.mem_inter.mp hw
  have hcEq : dist (H.centerAt x hx) q =
      dist (H.centerAt x hx) w :=
    ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius q hq'.1).trans
      ((H.selectedAt x hx).toCriticalFourShell.support_eq_radius w hw'.1).symm
  exact bisectorCenter_mem_oppositeCapInterior
    hq'.2 hw'.2 hqw hcA hcApex hcEq

/-- Exact adapter for the cover hypothesis carried by
`FrontierLiveClosure`: its only needed component is the local
`IsUniqueFourCenter` fact. -/
theorem criticalShellCenter_mem_oppositeCapInterior_of_two_hits_of_cover
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A} {i : Fin 3}
    {x : ℝ²} (hx : x ∈ D.A)
    (hrich :
      ATailApexRichClassStructure.ApexRichClassStructure
        D.A (S.oppositeVertexByIndex i))
    (hcover :
      ∀ y : ℝ², ∀ hy : y ∈ D.A,
        H.centerAt y hy ≠ y ∧
          ATailMinimalUniqueFourCover.IsUniqueFourCenter
            D.A (H.centerAt y hy) ∧
          ATailMinimalUniqueFourCover.uniqueFourClass
              D.A (H.centerAt y hy) =
            (H.selectedAt y hy).toCriticalFourShell.support)
    {r : ℝ}
    (htwo :
      2 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card) :
    H.centerAt x hx ∈ S.capInteriorByIndex i :=
  criticalShellCenter_mem_oppositeCapInterior_of_two_hits
    hx hrich (hcover x hx).2.1 htwo

end TriApexIndexedScratch
end Problem97
