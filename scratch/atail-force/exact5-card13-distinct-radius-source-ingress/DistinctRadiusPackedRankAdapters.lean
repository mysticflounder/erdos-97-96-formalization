/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.WitnessPacketInterface
import FiniteDistanceRank

/-!
# Generic packed-rank adapters for the exact-five distinct-radius source

This scratch module proves the two rank adapters needed before generating any
of the exact-card-13 distinct-radius instance sweeps.  The statements retain a
complete ambient `SelectedClass` and an arbitrary source-faithful table of the
78 pair distances.  They do not depend on a particular orbit or certificate.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressScratch

open ATailExactFiveCard13CnfIngressScratch

attribute [local instance] Classical.propDecidable

noncomputable section

/-- Membership XOR in a complete exact radius class forces unequal packed
seven-bit ordinal ranks.  The two value-table indices are allowed to be
arbitrary; generated uses only have to identify them with the corresponding
center-to-point distances. -/
theorem distinct_completeClass_rank_ne_guard
    {A : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (point : Fin 13 → ℝ²) (value : Fin 78 → ℝ)
    (member : Fin 13 → Bool)
    (left right : Fin 13) (i j : Fin 78)
    (hleftA : point left ∈ A) (hrightA : point right ∈ A)
    (hi : value i = dist center (point left))
    (hj : value j = dist center (point right))
    (hmember : ∀ k, member k = true ↔
      point k ∈ SelectedClass A center radius) :
    ((member left == member right) ||
      !(finiteOrdinalRank78BitVec value i ==
        finiteOrdinalRank78BitVec value j)) = true := by
  cases hleft : member left <;> cases hright : member right
  · simp
  · have hrightMem : point right ∈ SelectedClass A center radius :=
      (hmember right).1 hright
    have hleftNotMem : point left ∉ SelectedClass A center radius := by
      intro hleftMem
      have : member left = true := (hmember left).2 hleftMem
      simp [hleft] at this
    have hdistNe :
        dist center (point left) ≠ dist center (point right) := by
      intro hdist
      apply hleftNotMem
      exact mem_selectedClass.mpr
        ⟨hleftA, hdist.trans (mem_selectedClass.mp hrightMem).2⟩
    have hvalueNe : value i ≠ value j := by
      intro hvalue
      apply hdistNe
      exact hi.symm.trans (hvalue.trans hj)
    have hrankNe :
        finiteOrdinalRank78BitVec value i ≠
          finiteOrdinalRank78BitVec value j := by
      intro hrank
      exact hvalueNe ((finiteOrdinalRank78BitVec_eq_iff value i j).1 hrank)
    simp [hrankNe]
  · have hleftMem : point left ∈ SelectedClass A center radius :=
      (hmember left).1 hleft
    have hrightNotMem : point right ∉ SelectedClass A center radius := by
      intro hrightMem
      have : member right = true := (hmember right).2 hrightMem
      simp [hright] at this
    have hdistNe :
        dist center (point left) ≠ dist center (point right) := by
      intro hdist
      apply hrightNotMem
      exact mem_selectedClass.mpr
        ⟨hrightA, hdist.symm.trans (mem_selectedClass.mp hleftMem).2⟩
    have hvalueNe : value i ≠ value j := by
      intro hvalue
      apply hdistNe
      exact hi.symm.trans (hvalue.trans hj)
    have hrankNe :
        finiteOrdinalRank78BitVec value i ≠
          finiteOrdinalRank78BitVec value j := by
      intro hrank
      exact hvalueNe ((finiteOrdinalRank78BitVec_eq_iff value i j).1 hrank)
    simp [hrankNe]
  · simp

/-- One generic guarded unique-K4 rank clause.  If four distinct carrier
points have equal packed ranks from one center, their actual distances are
equal.  The supplied source-level unique-radius fact then places all four in
the distinguished complete class. -/
theorem distinct_uniqueK4_rank_guard
    {A : Finset ℝ²} {center : ℝ²} {radius : ℝ}
    (point : Fin 13 → ℝ²) (value : Fin 78 → ℝ)
    (member : Fin 13 → Bool)
    (hpointA : ∀ k, point k ∈ A)
    (hpointInjective : Function.Injective point)
    (hunique : ∀ otherRadius : ℝ, 0 < otherRadius →
      4 ≤ (SelectedClass A center otherRadius).card →
      otherRadius = radius)
    (hmember : ∀ k, member k = true ↔
      point k ∈ SelectedClass A center radius)
    (a b c d : Fin 13)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d)
    (hbc : b ≠ c) (hbd : b ≠ d) (hcd : c ≠ d)
    (ia ib ic id : Fin 78)
    (hcenter : center ≠ point a)
    (hia : value ia = dist center (point a))
    (hib : value ib = dist center (point b))
    (hic : value ic = dist center (point c))
    (hid : value id = dist center (point d)) :
    ((member a && member b && member c && member d) ||
      !((finiteOrdinalRank78BitVec value ia ==
            finiteOrdinalRank78BitVec value ib) &&
        (finiteOrdinalRank78BitVec value ia ==
            finiteOrdinalRank78BitVec value ic) &&
        (finiteOrdinalRank78BitVec value ia ==
            finiteOrdinalRank78BitVec value id))) = true := by
  by_cases hrankAB : finiteOrdinalRank78BitVec value ia =
      finiteOrdinalRank78BitVec value ib
  · by_cases hrankAC : finiteOrdinalRank78BitVec value ia =
        finiteOrdinalRank78BitVec value ic
    · by_cases hrankAD : finiteOrdinalRank78BitVec value ia =
          finiteOrdinalRank78BitVec value id
      · have hvalueAB : value ia = value ib :=
          (finiteOrdinalRank78BitVec_eq_iff value ia ib).1 hrankAB
        have hvalueAC : value ia = value ic :=
          (finiteOrdinalRank78BitVec_eq_iff value ia ic).1 hrankAC
        have hvalueAD : value ia = value id :=
          (finiteOrdinalRank78BitVec_eq_iff value ia id).1 hrankAD
        let rho := dist center (point a)
        have hbRho : dist center (point b) = rho := by
          exact hib.symm.trans (hvalueAB.symm.trans hia)
        have hcRho : dist center (point c) = rho := by
          exact hic.symm.trans (hvalueAC.symm.trans hia)
        have hdRho : dist center (point d) = rho := by
          exact hid.symm.trans (hvalueAD.symm.trans hia)
        let quad : Finset ℝ² := {point a, point b, point c, point d}
        have hquadCard : quad.card = 4 := by
          have habp : point a ≠ point b := fun h ↦ hab (hpointInjective h)
          have hacp : point a ≠ point c := fun h ↦ hac (hpointInjective h)
          have hadp : point a ≠ point d := fun h ↦ had (hpointInjective h)
          have hbcp : point b ≠ point c := fun h ↦ hbc (hpointInjective h)
          have hbdp : point b ≠ point d := fun h ↦ hbd (hpointInjective h)
          have hcdp : point c ≠ point d := fun h ↦ hcd (hpointInjective h)
          simp [quad, habp, hacp, hadp, hbcp, hbdp, hcdp]
        have hquadSubset : quad ⊆ SelectedClass A center rho := by
          intro x hx
          simp only [quad, Finset.mem_insert, Finset.mem_singleton] at hx
          rcases hx with rfl | rfl | rfl | rfl
          · exact mem_selectedClass.mpr ⟨hpointA a, rfl⟩
          · exact mem_selectedClass.mpr ⟨hpointA b, hbRho⟩
          · exact mem_selectedClass.mpr ⟨hpointA c, hcRho⟩
          · exact mem_selectedClass.mpr ⟨hpointA d, hdRho⟩
        have hfour : 4 ≤ (SelectedClass A center rho).card := by
          calc
            4 = quad.card := hquadCard.symm
            _ ≤ (SelectedClass A center rho).card :=
              Finset.card_le_card hquadSubset
        have hrhoPos : 0 < rho := by
          exact dist_pos.mpr hcenter
        have hrho : rho = radius := hunique rho hrhoPos hfour
        have hma : member a = true := by
          apply (hmember a).2
          exact mem_selectedClass.mpr ⟨hpointA a, by simpa [rho] using hrho⟩
        have hmb : member b = true := by
          apply (hmember b).2
          exact mem_selectedClass.mpr ⟨hpointA b, hbRho.trans hrho⟩
        have hmc : member c = true := by
          apply (hmember c).2
          exact mem_selectedClass.mpr ⟨hpointA c, hcRho.trans hrho⟩
        have hmd : member d = true := by
          apply (hmember d).2
          exact mem_selectedClass.mpr ⟨hpointA d, hdRho.trans hrho⟩
        simp [hma, hmb, hmc, hmd]
      · simp [hrankAD]
    · simp [hrankAC]
  · simp [hrankAB]

#print axioms distinct_completeClass_rank_ne_guard
#print axioms distinct_uniqueK4_rank_guard

end

end ATailExactFiveCard13DistinctRadiusSourceIngressScratch
end Problem97
