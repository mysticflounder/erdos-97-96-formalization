/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FirstApexExactFiveInteriorFrontier
import Erdos9796Proof.P97.ATail.FirstApexInteriorPairCirclePower
import Erdos9796Proof.P97.ATail.CapInteriorRadiusCounting
import Erdos9796Proof.P97.ATail.DeletionRobustness

/-!
# A minimum admissible exact-five interior pair

The ordinary exact-five interior producer chooses an arbitrary surviving pair.
This module keeps the same frontier API but chooses a pair minimizing the
distance between its endpoints among all admissible pairs.  The
minimum is source data for later “no third point” and bisector arguments; it is
not itself a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FirstApexExactFiveInteriorFrontier

open ATailCriticalPairFrontier
open ATailDeletionRobustness
open FirstApexInteriorPairGeometry
open FirstApexInteriorPairCirclePower

attribute [local instance] Classical.propDecidable

/-- The strict-interior points available to an exact-five first-apex class. -/
noncomputable def interiorPointSet
    {D : CounterexampleData} {S : SurplusCapPacket D.A} (radius : ℝ) :
    Finset ℝ² :=
  SelectedClass D.A S.oppApex1 radius ∩
    S.capInteriorByIndex S.oppIndex1

/-- A pair is admissible when both endpoints are strict-interior points and
their simultaneous deletion still leaves four equidistant points at the
second opposite apex. -/
def admissibleInteriorPair
    {D : CounterexampleData} {S : SurplusCapPacket D.A} (radius : ℝ)
    (p : ℝ² × ℝ²) : Prop :=
  p.1 ∈ interiorPointSet (D := D) (S := S) radius ∧
    p.2 ∈ interiorPointSet (D := D) (S := S) radius ∧
    p.1 ≠ p.2 ∧
    HasNEquidistantPointsAt 4 ((D.A.erase p.1).erase p.2) S.oppApex2

/-- The finite set of all ordered admissible interior pairs. -/
noncomputable def admissibleInteriorPairs
    {D : CounterexampleData} {S : SurplusCapPacket D.A} (radius : ℝ) :
    Finset (ℝ² × ℝ²) := by
  classical
  exact Finset.filter (admissibleInteriorPair (D := D) (S := S) radius)
    ((interiorPointSet (D := D) (S := S) radius).product
      (interiorPointSet (D := D) (S := S) radius))

/-- An exact-five interior frontier whose chord is distance-minimal among all
admissible ordered pairs. -/
structure MinimalAdmissibleInteriorPair
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (radius : ℝ)
    (H : CriticalShellSystem D.A) where
  frontier : ExactFiveInteriorCriticalPairFrontier D S radius H
  minimal :
    ∀ {q w : ℝ²},
      q ∈ interiorPointSet (D := D) (S := S) radius →
      w ∈ interiorPointSet (D := D) (S := S) radius →
      q ≠ w →
      HasNEquidistantPointsAt 4 ((D.A.erase q).erase w) S.oppApex2 →
      dist frontier.frontier.pair.q frontier.frontier.pair.w ≤ dist q w

/-- The selected first endpoint remains a strict-interior first-apex point. -/
theorem MinimalAdmissibleInteriorPair.q_mem_interior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (P : MinimalAdmissibleInteriorPair D S radius H) :
    P.frontier.frontier.pair.q ∈
      interiorPointSet (D := D) (S := S) radius := by
  exact P.frontier.q_mem_interior

/-- The selected second endpoint remains a strict-interior first-apex point. -/
theorem MinimalAdmissibleInteriorPair.w_mem_interior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (P : MinimalAdmissibleInteriorPair D S radius H) :
    P.frontier.frontier.pair.w ∈
      interiorPointSet (D := D) (S := S) radius := by
  exact P.frontier.w_mem_interior

/-- Existence of a minimum admissible pair, obtained by finite minimization of
the endpoint distance over the ordinary exact-five interior producer. -/
theorem nonempty_minimalAdmissibleInteriorPair
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) {radius : ℝ}
    (hradius : 0 < radius)
    (hcard : (SelectedClass D.A S.oppApex1 radius).card = 5) :
    Nonempty (MinimalAdmissibleInteriorPair D S radius H) := by
  classical
  obtain ⟨P⟩ := nonempty_exactFiveInteriorCriticalPairFrontier
    D S H hradius hcard
  let pairs := admissibleInteriorPairs (D := D) (S := S) radius
  have hpairs :
      (P.frontier.pair.q, P.frontier.pair.w) ∈ pairs := by
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_product.mpr ⟨?_, ?_⟩, ?_⟩
    · exact P.q_mem_interior
    · exact P.w_mem_interior
    · exact ⟨P.q_mem_interior, P.w_mem_interior,
        P.frontier.pair.q_ne_w, P.frontier.secondApexDouble⟩
  let score : (ℝ² × ℝ²) → ℝ := fun p => dist p.1 p.2
  let scores : Finset ℝ := pairs.image score
  have hscores : scores.Nonempty := by
    refine ⟨score (P.frontier.pair.q, P.frontier.pair.w), ?_⟩
    exact Finset.mem_image.mpr
      ⟨(P.frontier.pair.q, P.frontier.pair.w), hpairs, rfl⟩
  let μ : ℝ := scores.min' hscores
  have hμmem : μ ∈ scores := by
    exact Finset.min'_mem scores hscores
  obtain ⟨p, hp, hpμ⟩ := Finset.mem_image.mp hμmem
  have hpdata := Finset.mem_filter.mp hp
  have hpinterior :
      p.1 ∈ interiorPointSet (D := D) (S := S) radius ∧
        p.2 ∈ interiorPointSet (D := D) (S := S) radius := by
    exact Finset.mem_product.mp hpdata.1
  have hpadmiss : admissibleInteriorPair (D := D) (S := S) radius p :=
    hpdata.2
  let Q := ExactFiveInteriorCriticalPairFrontier.ofInteriorPair
    D S H hpinterior.1 hpinterior.2 hpadmiss.2.2.1 hpadmiss.2.2.2
  refine ⟨{ frontier := Q, minimal := ?_ }⟩
  intro q w hq hw hqw hdouble
  have hqwpairs : (q, w) ∈ pairs := by
    apply Finset.mem_filter.mpr
    exact ⟨Finset.mem_product.mpr ⟨hq, hw⟩,
      ⟨hq, hw, hqw, hdouble⟩⟩
  have hqscore : score (q, w) ∈ scores :=
    Finset.mem_image.mpr ⟨(q, w), hqwpairs, rfl⟩
  have hmin : μ ≤ score (q, w) := by
    exact Finset.min'_le scores (score (q, w)) hqscore
  have hQq : Q.frontier.pair.q = p.1 := by rfl
  have hQw : Q.frontier.pair.w = p.2 := by rfl
  rw [hQq, hQw]
  calc
    dist p.1 p.2 = score p := by rfl
    _ = μ := hpμ
    _ ≤ score (q, w) := hmin
    _ = dist q w := by rfl

/-- Full deletion robustness at the second apex turns chord minimality into a
metric consecutiveness statement: no other point of the strict first-class
slice is strictly closer to both chosen endpoints than the endpoints are to
each other. -/
theorem MinimalAdmissibleInteriorPair.no_interiorPoint_closer_to_both
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (P : MinimalAdmissibleInteriorPair D S radius H)
    (hsecond : FullyDeletionRobustAt D S.oppApex2)
    {p : ℝ²}
    (hp : p ∈ interiorPointSet (D := D) (S := S) radius) :
    ¬ (dist p P.frontier.frontier.pair.q <
          dist P.frontier.frontier.pair.q P.frontier.frontier.pair.w ∧
        dist p P.frontier.frontier.pair.w <
          dist P.frontier.frontier.pair.q P.frontier.frontier.pair.w) := by
  intro hcloser
  let q := P.frontier.frontier.pair.q
  let w := P.frontier.frontier.pair.w
  have hp' :
      p ∈ SelectedClass D.A S.oppApex1 radius ∩
        S.capInteriorByIndex S.oppIndex1 := by
    simpa [interiorPointSet] using hp
  have hpA : p ∈ D.A :=
    (mem_selectedClass.mp (Finset.mem_inter.mp hp').1).1
  have hp_ne_q : p ≠ q := by
    intro hpq
    have h := hcloser.2
    simp [q, hpq] at h
  have hp_ne_w : p ≠ w := by
    intro hpw
    have h : dist w q < dist q w := by
      simpa [q, w, hpw] using hcloser.1
    exact (not_lt_of_ge (le_of_eq (dist_comm q w))) h
  rcases hsecond.survives p hpA with ⟨rho, hrho, hfour⟩
  have hdist : dist S.oppApex2 q ≠ dist S.oppApex2 w := by
    simpa [q, w] using P.frontier.frontier.pair.oppApex2_dist_ne
  by_cases hqRow : q ∈ SelectedClass (D.A.erase p) S.oppApex2 rho
  · have hwNotRow : w ∉ SelectedClass (D.A.erase p) S.oppApex2 rho := by
      intro hwRow
      apply hdist
      calc
        dist S.oppApex2 q = rho := by
          simpa [dist_comm] using (mem_selectedClass.mp hqRow).2
        _ = dist S.oppApex2 w := by
          simpa [dist_comm] using (mem_selectedClass.mp hwRow).2.symm
    have hfourDouble :
        4 ≤ (SelectedClass ((D.A.erase p).erase w)
          S.oppApex2 rho).card := by
      rw [selectedClass_erase_card_eq_of_not_mem hwNotRow]
      exact hfour
    have hdouble :
        HasNEquidistantPointsAt 4
          ((D.A.erase p).erase w) S.oppApex2 :=
      ⟨rho, hrho, by simpa [SelectedClass] using hfourDouble⟩
    have hmin := P.minimal hp P.w_mem_interior hp_ne_w hdouble
    exact (not_lt_of_ge hmin) (by simpa [q, w] using hcloser.2)
  · have hfourDouble :
        4 ≤ (SelectedClass ((D.A.erase p).erase q)
          S.oppApex2 rho).card := by
      rw [selectedClass_erase_card_eq_of_not_mem hqRow]
      exact hfour
    have hdouble :
        HasNEquidistantPointsAt 4
          ((D.A.erase p).erase q) S.oppApex2 :=
      ⟨rho, hrho, by simpa [SelectedClass] using hfourDouble⟩
    have hmin := P.minimal hp P.q_mem_interior hp_ne_q hdouble
    exact (not_lt_of_ge hmin) (by simpa [q, w] using hcloser.1)

/-- A carrier bisector center distinct from the first apex cannot itself lie
in the selected first-apex class of a minimum admissible pair. -/
theorem MinimalAdmissibleInteriorPair.bisector_not_mem_firstApexClass
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (P : MinimalAdmissibleInteriorPair D S radius H)
    (hsecond : FullyDeletionRobustAt D S.oppApex2)
    {c : ℝ²} (hcA : c ∈ D.A) (hcApex : c ≠ S.oppApex1)
    (hcEq : dist c P.frontier.frontier.pair.q =
      dist c P.frontier.frontier.pair.w) :
    c ∉ SelectedClass D.A S.oppApex1 radius := by
  intro hcClass
  let q := P.frontier.frontier.pair.q
  let w := P.frontier.frontier.pair.w
  have hcEq' : dist c q = dist c w := by
    simpa [q, w] using hcEq
  have hcInterior : c ∈ S.capInteriorByIndex S.oppIndex1 :=
    bisectorCenter_mem_firstApexInterior
      P.frontier.q_mem_interior P.frontier.w_mem_interior
      P.frontier.frontier.pair.q_ne_w hcA hcApex hcEq
  have hinner : inner ℝ (q - c) (w - c) ≤ 0 := by
    simpa [q, w] using bisectorCenter_inner_nonpos_firstApexInterior
      P.frontier.q_mem_interior P.frontier.w_mem_interior
      P.frontier.frontier.pair.q_ne_w hcA hcApex hcEq
  have hq_ne_c : q ≠ c := by
    intro hqc
    apply P.frontier.frontier.pair.q_ne_w
    apply dist_eq_zero.mp
    have h := hcEq'
    rw [← hqc, dist_self] at h
    exact h.symm
  have hshortQ : dist c q < dist q w := by
    have h := dist_center_middle_lt_endpoint_of_inner_nonpos hq_ne_c hinner
    calc
      dist c q = dist c w := hcEq'
      _ = dist w c := dist_comm _ _
      _ < dist w q := h
      _ = dist q w := dist_comm _ _
  have hshortW : dist c w < dist q w := by
    rw [← hcEq']
    exact hshortQ
  apply P.no_interiorPoint_closer_to_both hsecond
    (by simpa [interiorPointSet] using
      (Finset.mem_inter.mpr ⟨hcClass, hcInterior⟩))
  exact ⟨by simpa [q, w] using hshortQ,
    by simpa [q, w] using hshortW⟩

private theorem capInterior_card_eq_three_of_cap_card_eq_five
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3)
    (hcard : (S.capByIndex i).card = 5) :
    (S.capInteriorByIndex i).card = 3 := by
  fin_cases i
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv3 : S.triangle.v3 ∈ S.partition.C1.erase S.triangle.v2 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v23_ne.symm, S.partition.v3_mem_C1⟩
    rw [Finset.card_erase_of_mem hv3,
      Finset.card_erase_of_mem S.partition.v2_mem_C1, hcard]
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv1 : S.triangle.v1 ∈ S.partition.C2.erase S.triangle.v3 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v13_ne, S.partition.v1_mem_C2⟩
    rw [Finset.card_erase_of_mem hv1,
      Finset.card_erase_of_mem S.partition.v3_mem_C2, hcard]
  · simp only [SurplusCapPacket.capInteriorByIndex,
      SurplusCapPacket.capByIndex] at hcard ⊢
    have hv2 : S.triangle.v2 ∈ S.partition.C3.erase S.triangle.v1 :=
      Finset.mem_erase.mpr
        ⟨S.triangle.v12_ne.symm, S.partition.v2_mem_C3⟩
    rw [Finset.card_erase_of_mem hv2,
      Finset.card_erase_of_mem S.partition.v1_mem_C3, hcard]

private theorem oppApex1_eq_oppositeVertexByIndex_oppIndex1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- When both the first selected class and its closed cap have cardinality
five, the selected class contains every strict-interior point of that cap. -/
theorem capInterior_subset_firstApexClass_of_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    (hradius : 0 < radius)
    (hclass : (SelectedClass D.A S.oppApex1 radius).card = 5)
    (hcap : (S.capByIndex S.oppIndex1).card = 5) :
    S.capInteriorByIndex S.oppIndex1 ⊆
      SelectedClass D.A S.oppApex1 radius := by
  have hinterior : (S.capInteriorByIndex S.oppIndex1).card = 3 :=
    capInterior_card_eq_three_of_cap_card_eq_five S S.oppIndex1 hcap
  have hthree :=
    S.selectedClass_capInteriorByIndex_card_ge_card_sub_two
      D.convex S.oppIndex1 hradius
  rw [← oppApex1_eq_oppositeVertexByIndex_oppIndex1 S, hclass] at hthree
  have heq :
      SelectedClass D.A S.oppApex1 radius ∩
          S.capInteriorByIndex S.oppIndex1 =
        S.capInteriorByIndex S.oppIndex1 := by
    apply Finset.eq_of_subset_of_card_le Finset.inter_subset_right
    rw [hinterior]
    omega
  intro c hc
  exact (Finset.mem_inter.mp (heq.symm ▸ hc)).1

/-- In the cap-cardinality-five branch, the first apex is the only carrier
point on the perpendicular bisector of a minimum admissible pair. -/
theorem MinimalAdmissibleInteriorPair.no_other_bisector_of_cap_card_five
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (P : MinimalAdmissibleInteriorPair D S radius H)
    (hsecond : FullyDeletionRobustAt D S.oppApex2)
    (hclass : (SelectedClass D.A S.oppApex1 radius).card = 5)
    (hcap : (S.capByIndex S.oppIndex1).card = 5)
    {c : ℝ²} (hcA : c ∈ D.A) (hcApex : c ≠ S.oppApex1)
    (hcEq : dist c P.frontier.frontier.pair.q =
      dist c P.frontier.frontier.pair.w) :
    False := by
  have hcInterior : c ∈ S.capInteriorByIndex S.oppIndex1 :=
    bisectorCenter_mem_firstApexInterior
      P.frontier.q_mem_interior P.frontier.w_mem_interior
      P.frontier.frontier.pair.q_ne_w hcA hcApex hcEq
  exact P.bisector_not_mem_firstApexClass hsecond hcA hcApex hcEq
    (capInterior_subset_firstApexClass_of_card_five
      P.frontier.frontier.radius_pos hclass hcap hcInterior)

end FirstApexExactFiveInteriorFrontier
end Problem97
