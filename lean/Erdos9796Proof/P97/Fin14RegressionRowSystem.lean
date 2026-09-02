/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.AbstractRowSystemConnectivity
import Mathlib.Data.Fin.Tuple.Reflection
import Mathlib.Tactic.FinCases

/-!
# A fourteen-point finite row-system regression

This module formalizes the literal finite witness specified in
`docs/rvol-wave1-formalization-targets-2026-09-01.md`. It is a combinatorial regression,
not a geometric carrier or a P97 counterexample. In particular, the historical
“18-to-14 exact solve” has no retained witness-specific receipt and is not used here.

The designated seven-source statement concerns rows at the chosen blocker centers.
The corresponding statement for rows at the sources themselves is false on exactly
seventeen unordered pairs; both counts are retained below.
-/

namespace Problem97
namespace Fin14RegressionRowSystem

/-- The fourteen labels of the finite regression. -/
abbrev Vertex := Fin 14

/-- The literal fourteen selected rows from the Wave-1 target specification. -/
def row : Vertex → Finset Vertex :=
  ![{6, 9, 11, 12}, {3, 7, 10, 11}, {0, 8, 10, 13}, {7, 8, 9, 10},
    {2, 8, 9, 11}, {9, 10, 12, 13}, {8, 11, 12, 13}, {0, 1, 2, 4},
    {1, 2, 3, 5}, {2, 3, 4, 6}, {0, 3, 4, 5}, {1, 4, 5, 6},
    {0, 2, 5, 6}, {0, 1, 3, 6}]

/-- The literal chosen-blocker map from the Wave-1 target specification. -/
def blocker : Vertex → Vertex :=
  ![7, 8, 9, 10, 11, 12, 13, 1, 6, 5, 5, 1, 6, 6]

/-- The literal rows packaged through the shared weak interface. -/
def system : AbstractRowSystem Vertex where
  row := row

/-- Embed the seven distinguished source labels into the fourteen-point carrier. -/
def source (i : Fin 7) : Vertex :=
  ⟨i, Nat.lt_trans i.isLt (by omega)⟩

/-- Unordered pairs of distinct distinguished source indices. -/
def sourcePairs : Finset (Fin 7 × Fin 7) :=
  Finset.univ.filter fun pair ↦ pair.1 < pair.2

/-- Source pairs mutually omitted by their raw source rows. -/
def rawMutualOmissionPairs : Finset (Fin 7 × Fin 7) :=
  sourcePairs.filter fun pair ↦
    source pair.2 ∉ row (source pair.1) ∧
      source pair.1 ∉ row (source pair.2)

/-- Source pairs mutually omitted by their designated blocker rows. -/
def blockerMutualOmissionPairs : Finset (Fin 7 × Fin 7) :=
  sourcePairs.filter fun pair ↦
    source pair.2 ∉ row (blocker (source pair.1)) ∧
      source pair.1 ∉ row (blocker (source pair.2))

/-- Every row in the literal system has four labels. -/
theorem system_rowCardEq_four : system.RowCardEq 4 := by
  change ∀ center, (row center).card = 4
  decide

/-- Every row in the literal system omits its center. -/
theorem system_centerExcluded : system.CenterExcluded := by
  change ∀ center, center ∉ row center
  decide

/-- The literal blocker map is a blocker section for the literal rows. -/
theorem system_hasBlockerSection : system.HasBlockerSection blocker := by
  change ∀ q, blocker q ≠ q ∧ q ∈ row (blocker q)
  decide

/-- Distinct literal rows meet in at most two labels. -/
theorem system_rowInterCardLE_two : system.RowInterCardLE 2 := by
  change ∀ ⦃c d⦄, c ≠ d → ((row c) ∩ row d).card ≤ 2
  decide

/-- Distinct label pairs occur together in at most two literal rows. -/
theorem system_pairCodegreeLE_two : system.PairCodegreeLE 2 := by
  change ∀ ⦃a b⦄, a ≠ b →
    (Finset.univ.filter fun c ↦ a ∈ row c ∧ b ∈ row c).card ≤ 2
  decide

private theorem supportStep (c z : Vertex) (hz : z ∈ row c) :
    Relation.ReflTransGen system.SupportEdge c z :=
  Relation.ReflTransGen.single hz

private theorem supportPathToZero (c : Vertex) :
    Relation.ReflTransGen system.SupportEdge c 0 := by
  fin_cases c
  · exact Relation.ReflTransGen.refl
  · exact (supportStep 1 3 (by decide)).trans
      ((supportStep 3 7 (by decide)).trans (supportStep 7 0 (by decide)))
  · exact supportStep 2 0 (by decide)
  · exact (supportStep 3 7 (by decide)).trans (supportStep 7 0 (by decide))
  · exact (supportStep 4 2 (by decide)).trans (supportStep 2 0 (by decide))
  · exact (supportStep 5 9 (by decide)).trans
      ((supportStep 9 2 (by decide)).trans (supportStep 2 0 (by decide)))
  · exact (supportStep 6 8 (by decide)).trans
      ((supportStep 8 2 (by decide)).trans (supportStep 2 0 (by decide)))
  · exact supportStep 7 0 (by decide)
  · exact (supportStep 8 2 (by decide)).trans (supportStep 2 0 (by decide))
  · exact (supportStep 9 2 (by decide)).trans (supportStep 2 0 (by decide))
  · exact supportStep 10 0 (by decide)
  · exact (supportStep 11 4 (by decide)).trans
      ((supportStep 4 2 (by decide)).trans (supportStep 2 0 (by decide)))
  · exact supportStep 12 0 (by decide)
  · exact supportStep 13 0 (by decide)

private theorem supportPathFromZero (z : Vertex) :
    Relation.ReflTransGen system.SupportEdge 0 z := by
  fin_cases z
  · exact Relation.ReflTransGen.refl
  · exact (supportStep 0 11 (by decide)).trans (supportStep 11 1 (by decide))
  · exact (supportStep 0 9 (by decide)).trans (supportStep 9 2 (by decide))
  · exact (supportStep 0 9 (by decide)).trans (supportStep 9 3 (by decide))
  · exact (supportStep 0 9 (by decide)).trans (supportStep 9 4 (by decide))
  · exact (supportStep 0 11 (by decide)).trans (supportStep 11 5 (by decide))
  · exact supportStep 0 6 (by decide)
  · exact (supportStep 0 9 (by decide)).trans
      ((supportStep 9 3 (by decide)).trans (supportStep 3 7 (by decide)))
  · exact (supportStep 0 6 (by decide)).trans (supportStep 6 8 (by decide))
  · exact supportStep 0 9 (by decide)
  · exact (supportStep 0 9 (by decide)).trans
      ((supportStep 9 3 (by decide)).trans (supportStep 3 10 (by decide)))
  · exact supportStep 0 11 (by decide)
  · exact supportStep 0 12 (by decide)
  · exact (supportStep 0 6 (by decide)).trans (supportStep 6 13 (by decide))

/-- The directed row-membership graph of the literal system is strongly connected. -/
theorem system_supportStronglyConnected : system.SupportStronglyConnected := by
  intro a b
  exact (supportPathToZero a).trans (supportPathFromZero b)

/-- The only nonempty row-closed subset is the whole fourteen-point carrier. -/
theorem system_supportMinimal : system.SupportMinimal := by
  intro T hTne hclosed
  rcases hTne with ⟨a, ha⟩
  apply Finset.eq_univ_of_forall
  intro b
  have hab := system_supportStronglyConnected a b
  induction hab with
  | refl => exact ha
  | tail _ hbc ih => exact hclosed ih hbc

/-- No distinct pair among the seven distinguished sources is mutually omitted by
its designated blocker rows. -/
theorem blockerRow_nonOmission :
    ∀ i j : Fin 7, i ≠ j →
      ¬ (source j ∉ row (blocker (source i)) ∧
        source i ∉ row (blocker (source j))) := by
  decide

/-- The designated blocker-row formulation has no failing source pair. -/
theorem blockerMutualOmissionPairs_empty :
    blockerMutualOmissionPairs = ∅ := by
  decide

/-- The incorrect raw-source-row formulation fails on exactly seventeen unordered
source pairs. -/
theorem rawMutualOmissionPairs_card :
    rawMutualOmissionPairs.card = 17 := by
  decide

/-- The complete finite regression certificate advertised by this module. -/
theorem verifies_fin14_regression :
    system.RowCardEq 4 ∧
      system.CenterExcluded ∧
      system.HasBlockerSection blocker ∧
      system.RowInterCardLE 2 ∧
      system.PairCodegreeLE 2 ∧
      system.SupportMinimal ∧
      system.SupportStronglyConnected ∧
      (∀ i j : Fin 7, i ≠ j →
        ¬ (source j ∉ row (blocker (source i)) ∧
          source i ∉ row (blocker (source j)))) ∧
      blockerMutualOmissionPairs = ∅ ∧
      rawMutualOmissionPairs.card = 17 :=
  ⟨system_rowCardEq_four,
    system_centerExcluded,
    system_hasBlockerSection,
    system_rowInterCardLE_two,
    system_pairCodegreeLE_two,
    system_supportMinimal,
    system_supportStronglyConnected,
    blockerRow_nonOmission,
    blockerMutualOmissionPairs_empty,
    rawMutualOmissionPairs_card⟩

end Fin14RegressionRowSystem
end Problem97
