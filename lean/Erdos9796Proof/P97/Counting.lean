import Erdos9796Proof.P97.IsoscelesCount
import Erdos9796Proof.P97.CountingArithmetic
import Erdos9796Proof.P97.ConvexIndepHelpers
import Erdos9796Proof.P97.NoDiameterUnderK4
import Erdos9796Proof.P97.CGN8

/-!
# Counting obstruction: `9 ≤ |A|` (Milestone 3)

This module packages the proven lower bound
`Problem97.six_mul_card_le_iCount_of_K4` and the proven arithmetic core
`Problem97.counting_arithmetic` into the intermediate theorem
`Problem97.counterexample_card_ge_nine_of_iCount_upper_bound`.

The top-level theorem `Problem97.counterexample_card_ge_nine` now
instantiates that reducer with the circumscribed-branch CGN closure
`Problem97.CGN8_circumscribed_iCount_upper_bound`.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

/-- Every vertex of a `HasNEquidistantProperty 4` config has 4 other
vertices at common positive distance from it, so `|A| ≥ 5`. -/
theorem card_ge_five_of_K4 {A : Finset ℝ²} (hne : A.Nonempty)
    (hK4 : HasNEquidistantProperty 4 A) : 5 ≤ A.card := by
  classical
  obtain ⟨p, hp⟩ := hne
  obtain ⟨r, hrpos, hcount⟩ := hK4 p hp
  set S : Finset ℝ² := A.filter (fun q => dist p q = r) with hS
  have hScard : 4 ≤ S.card := hcount
  have hSsub : S ⊆ A.erase p := by
    intro q hqS
    rcases mem_filter.mp hqS with ⟨hqA, hqr⟩
    refine mem_erase.mpr ⟨?_, hqA⟩
    intro hqp
    rw [hqp, dist_self] at hqr
    linarith
  have h4erase : 4 ≤ (A.erase p).card := hScard.trans (card_le_card hSsub)
  have herase : (A.erase p).card = A.card - 1 := card_erase_of_mem hp
  omega

/-- CGN1 + CGN2 packaged: a K4 counterexample with at least five points
is non-collinear. -/
theorem not_collinear_of_K4 {A : Finset ℝ²} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A) :
    ¬ Collinear ℝ (A : Set ℝ²) := by
  have h5 : 5 ≤ A.card := card_ge_five_of_K4 hne hK4
  have h3 : 3 ≤ A.card := le_trans (by decide : 3 ≤ 5) h5
  exact ConvexIndep.not_collinear_of_card_ge_three hconv h3

/-- CGN3 packaged at the counting level: a K4 counterexample has at
least three points on the MEC boundary, so the diameter branch is
excluded. -/
theorem boundary_card_ge_three_of_K4 {A : Finset ℝ²} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A) :
    3 ≤ (A.filter (fun p =>
      dist p (Problem97.MEC.mec A hne).center = (Problem97.MEC.mec A hne).radius)).card := by
  have hnoncol : ¬ Collinear ℝ (A : Set ℝ²) :=
    not_collinear_of_K4 hne hconv hK4
  exact Problem97.MEC.no_diameter_under_k4 hne hnoncol hconv hK4

/-- **M3 counting obstruction (conditional on an upper-bound theorem).**

This theorem isolates the arithmetic assembly: once `iCount A` is
bounded above by the quadratic expression, the `6n` lower bound and the
arithmetic lemma `counting_arithmetic` force `9 ≤ A.card`.

The top-level theorem instantiates this reducer with the CGN8
circumscribed upper bound. -/
theorem counterexample_card_ge_nine_of_iCount_upper_bound
    {A : Finset ℝ²} (hne : A.Nonempty) (_hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A)
    (hup : (iCount A : ℝ) ≤ ((11 : ℝ) * A.card ^ 2 - 18 * A.card) / 12) :
    9 ≤ A.card := by
  have h5 : 5 ≤ A.card := card_ge_five_of_K4 hne hK4
  have h3 : 3 ≤ A.card := by omega
  -- Lower: 6 * A.card ≤ iCount A (ℕ).
  have hlo : 6 * A.card ≤ iCount A := six_mul_card_le_iCount_of_K4 hK4
  have hlor : (6 : ℝ) * A.card ≤ (iCount A : ℝ) := by exact_mod_cast hlo
  -- Upper: `iCount A` is bounded above by the quadratic expression.
  have hchain : (6 : ℝ) * A.card ≤ ((11 : ℝ) * A.card ^ 2 - 18 * A.card) / 12 :=
    hlor.trans hup
  exact counting_arithmetic h3 hchain

/--
A nonempty convex point set with `HasNEquidistantProperty 4` has at
least 9 points.  This is the load-bearing counting statement consumed
by `UniversalReductionHypotheses.counting`.

The theorem closes by feeding the CGN8 circumscribed upper bound into
the arithmetic reducer above. -/
theorem counterexample_card_ge_nine
    {A : Finset ℝ²} (hne : A.Nonempty) (hconv : ConvexIndep A)
    (hK4 : HasNEquidistantProperty 4 A) : 9 ≤ A.card := by
  have hnoncol : ¬ Collinear ℝ (A : Set ℝ²) :=
    not_collinear_of_K4 hne hconv hK4
  have hbd :
      3 ≤ (A.filter (fun p =>
        dist p (Problem97.MEC.mec A hne).center =
          (Problem97.MEC.mec A hne).radius)).card :=
    boundary_card_ge_three_of_K4 hne hconv hK4
  exact counterexample_card_ge_nine_of_iCount_upper_bound hne hconv hK4
    (CGN8_circumscribed_iCount_upper_bound hne hnoncol hconv hbd)

end Problem97
