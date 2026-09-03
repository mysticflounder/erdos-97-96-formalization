/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# Pure cut-relative pair separation

This module contains only propositional consequences of the finite-order
`SurplusCOMPGBank.btw` predicate.  The B1 geometry supplies the hypotheses
later; no boundary indexing or metric facts are imported here.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

/-- Two points occupy the same side of the cut with endpoints `i,j`.

The name is deliberately cut-relative: it does not assert geometric
adjacency on the ambient polygon. -/
def cyclicAdjacent {n : ℕ} (i j p q : Fin n) : Prop :=
  SurplusCOMPGBank.btw i j p ↔ SurplusCOMPGBank.btw i j q

/-- The two points are separated by the cut with endpoints `i,j`. -/
def separatedPair {n : ℕ} (i j p q : Fin n) : Prop :=
  SurplusCOMPGBank.btw i j p ↔ ¬ SurplusCOMPGBank.btw i j q

/-- Points on the same cut side cannot be a separated pair. -/
theorem not_separated_of_cyclicAdjacent
    {n : ℕ} {i j p q : Fin n}
    (hadj : cyclicAdjacent i j p q) :
    ¬ separatedPair i j p q := by
  intro hsep
  by_cases hp : SurplusCOMPGBank.btw i j p
  · have hq : SurplusCOMPGBank.btw i j q := hadj.mp hp
    exact (hsep.mp hp) hq
  · have hq : ¬ SurplusCOMPGBank.btw i j q := by
      intro hq
      exact hp (hadj.mpr hq)
    exact hp (hsep.mpr hq)

/-- If both points lie in one open index interval, they occupy the same cut
side.  This is the order-only adapter used by a boundary producer: the
geometric caller still has to prove the four strict inequalities. -/
theorem cyclicAdjacent_of_common_strict_interval
    {n : ℕ} {i j p q : Fin n}
    (hp_left : i < p) (hp_right : p < j)
    (hq_left : i < q) (hq_right : q < j) :
    cyclicAdjacent i j p q := by
  unfold cyclicAdjacent SurplusCOMPGBank.btw
  simp [hp_left, hp_right, hq_left, hq_right]

/-- Two rotated perfect matchings on four roles cannot both be separated.

The first separation uses the cut `(i,j)` and the pair `(a,b)`; the second
would use the rotated cut `(b,j)` and pair `(a,i)`.  The sole non-degeneracy
needed by the order argument is that the exchanged cut endpoints `i` and `b`
are distinct. -/
theorem separatedPair_rotated_incompatible
    {n : ℕ} {i j a b : Fin n}
    (hib : i ≠ b)
    (hijab : separatedPair i j a b) :
    ¬ separatedPair b j a i := by
  intro hbjai
  unfold separatedPair SurplusCOMPGBank.btw at hijab hbjai
  omega

/-- Alternation is symmetric in the two pairs of endpoints.  The four cross
distinctness hypotheses exclude exactly the degenerate cases where one point
is also a cut endpoint. -/
theorem separatedPair_exchange
    {n : ℕ} {i j p q : Fin n}
    (hip : i ≠ p) (hiq : i ≠ q)
    (hjp : j ≠ p) (hjq : j ≠ q)
    (hsep : separatedPair i j p q) :
    separatedPair p q i j := by
  unfold separatedPair SurplusCOMPGBank.btw at hsep ⊢
  omega

/-- The three perfect matchings cannot all be separated by one cut.

This is the propositional core needed when two independent shared-pair
separation facts are combined.  It is stronger than a fixed-cardinality
statement: distinctness is supplied by the geometric caller when required,
while the finite-order contradiction itself needs no cardinality assumptions.
-/
theorem separated_matching_unique
    {n : ℕ} {i j a b c d : Fin n}
    (hab_cd : separatedPair i j a b ∧ separatedPair i j c d)
    (hac_bd : separatedPair i j a c ∧ separatedPair i j b d) :
    ¬ (separatedPair i j a d ∧ separatedPair i j b c) := by
  rcases hab_cd with ⟨hab, hcd⟩
  rcases hac_bd with ⟨hac, hbd⟩
  intro had_bdc
  rcases had_bdc with ⟨had, hbc⟩
  by_cases ha : SurplusCOMPGBank.btw i j a <;>
    by_cases hb : SurplusCOMPGBank.btw i j b <;>
      by_cases hc : SurplusCOMPGBank.btw i j c <;>
        by_cases hd : SurplusCOMPGBank.btw i j d <;>
          simp [separatedPair, ha, hb, hc, hd] at hab hcd hac hbd had hbc

end ATailFrontierLiveClosure
end Problem97
