/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FirstApexExactFiveInteriorFrontier

/-!
# A minimum admissible exact-five interior pair

The ordinary exact-five interior producer chooses an arbitrary surviving pair.
This module keeps the same frontier API but chooses a pair minimizing the
second-apex distance of its first endpoint among all admissible pairs.  The
minimum is source data for later “no third point” and bisector arguments; it is
not itself a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace FirstApexExactFiveInteriorFrontier

attribute [local instance] Classical.propDecidable

/-- The strict-interior points available to an exact-five first-apex class. -/
def interiorPointSet
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
  p.1 ∈ interiorPointSet radius ∧
    p.2 ∈ interiorPointSet radius ∧
    p.1 ≠ p.2 ∧
    HasNEquidistantPointsAt 4 ((D.A.erase p.1).erase p.2) S.oppApex2

/-- The finite set of all ordered admissible interior pairs. -/
noncomputable def admissibleInteriorPairs
    {D : CounterexampleData} {S : SurplusCapPacket D.A} (radius : ℝ) :
    Finset (ℝ² × ℝ²) := by
  classical
  exact Finset.filter (admissibleInteriorPair radius)
    ((interiorPointSet radius).product (interiorPointSet radius))

/-- An exact-five interior frontier whose first endpoint is distance-minimal
among all admissible ordered pairs. -/
structure MinimalAdmissibleInteriorPair
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (radius : ℝ)
    (H : CriticalShellSystem D.A) where
  frontier : ExactFiveInteriorCriticalPairFrontier D S radius H
  minimal :
    ∀ {q w : ℝ²},
      q ∈ interiorPointSet radius →
      w ∈ interiorPointSet radius →
      q ≠ w →
      HasNEquidistantPointsAt 4 ((D.A.erase q).erase w) S.oppApex2 →
      dist S.oppApex2 frontier.frontier.pair.q ≤ dist S.oppApex2 q

/-- The selected first endpoint remains a strict-interior first-apex point. -/
theorem MinimalAdmissibleInteriorPair.q_mem_interior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (P : MinimalAdmissibleInteriorPair D S radius H) :
    P.frontier.frontier.pair.q ∈ interiorPointSet radius := by
  exact P.frontier.q_mem_interior

/-- The selected second endpoint remains a strict-interior first-apex point. -/
theorem MinimalAdmissibleInteriorPair.w_mem_interior
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (P : MinimalAdmissibleInteriorPair D S radius H) :
    P.frontier.frontier.pair.w ∈ interiorPointSet radius := by
  exact P.frontier.w_mem_interior

/-- Existence of a minimum admissible pair, obtained by finite minimization of
the second-apex distance over the ordinary exact-five interior producer. -/
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
  let score : (ℝ² × ℝ²) → ℝ := fun p => dist S.oppApex2 p.1
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
      p.1 ∈ interiorPointSet radius ∧ p.2 ∈ interiorPointSet radius := by
    exact Finset.mem_product.mp hpdata.1
  have hpadmiss : admissibleInteriorPair radius p := hpdata.2
  let Q := ExactFiveInteriorCriticalPairFrontier.ofInteriorPair
    D S H hpinterior.1 hpinterior.2 hpadmiss.2.1 hpadmiss.2.2
  refine ⟨{ frontier := Q, minimal := ?_ }⟩
  intro q w hq hw hqw hdouble
  have hqwpairs : (q, w) ∈ pairs := by
    apply Finset.mem_filter.mpr
    exact ⟨Finset.mem_product.mpr ⟨hq, hw⟩,
      ⟨hq, hw, hqw, hdouble⟩⟩
  have hqscore : score (q, w) ∈ scores :=
    Finset.mem_image.mpr ⟨(q, w), hqwpairs, rfl⟩
  have hmin : μ ≤ score (q, w) := by
    exact Finset.min'_le scores hscores hqscore
  have hQq : Q.frontier.pair.q = p.1 := by
    rfl
  rw [hQq]
  calc
    dist S.oppApex2 p.1 = score p := by rfl
    _ = μ := hpμ
    _ ≤ score (q, w) := hmin
    _ = dist S.oppApex2 q := by rfl

end FirstApexExactFiveInteriorFrontier
end Problem97

#print axioms Problem97.FirstApexExactFiveInteriorFrontier.nonempty_minimalAdmissibleInteriorPair
