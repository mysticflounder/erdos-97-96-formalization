/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBankSep

/-!
# Alternation audit for the withdrawn retained-radius finite boundary

This file freezes the first, now-withdrawn finite regression from the selector
audit.  That predecessor retained exact four-point rows and a five-point
first-apex radius class, but did not retain the cyclic-separation consequence
of those metric equalities.  The current repaired regression in
`critical-fiber-closing-core-selector/RetainedRadiusInjectiveFiniteBoundary.lean`
uses different rows and passes both this order gate and the production
two-circle gate.

This file checks that missing surface.  Centers `1` and `4` are both
equidistant from the three distinct labels `0`, `6`, and `7`: the first fact is
in `globalRow 1`, while the second uses the full retained radius class at
center `4`.  Hence all three pairs among `0`, `6`, and `7` would have to
alternate across centers `1` and `4`.  Three Boolean side values cannot be
pairwise opposite, so no cyclic order satisfies the exact `btw_sep` surface.

This eliminates only the withdrawn displayed regression.  It does not prove
that every injective retained-radius blocker matching has such a triple.
-/

namespace Problem97
namespace ATailRetainedRadiusAlternationUnsat

open scoped EuclideanGeometry
open SurplusCOMPGBank

abbrev Label := Fin 12

def firstApex : Label := 4

def retainedRadiusClass : Finset Label := {0, 3, 5, 6, 7}

def globalRow : Label → Finset Label :=
  ![({1, 2, 3, 4} : Finset Label),
    {0, 2, 6, 7},
    {1, 3, 9, 10},
    {1, 4, 7, 11},
    {0, 3, 5, 6},
    {0, 3, 8, 11},
    {2, 7, 8, 10},
    {4, 6, 9, 11},
    {3, 5, 7, 9},
    {0, 4, 5, 10},
    {2, 5, 8, 11},
    {1, 6, 8, 9}]

/-- The equality class seen by the alternation audit: the complete retained
radius at the first apex and the displayed selected row at every other
center. -/
def shellAt (center : Label) : Finset Label :=
  if center = firstApex then retainedRadiusClass else globalRow center

/-- The same defect in the direct two-circle-cardinality normal form already
present in production: center `1`'s selected row has a three-point
intersection with the retained first-apex class. -/
theorem displayed_row_violates_twoCircle_card_gate :
    (globalRow 1 ∩ retainedRadiusClass).card = 3 := by
  decide

/-- Exact finite cyclic-separation surface supplied by
`SurplusCOMPGBank.btw_sep` for every pair shared by two distinct centers.
The endpoint exclusions mirror that theorem's hypotheses. -/
def AlternationSound (indexOf : Label → Fin 12) : Prop :=
  ∀ i j a b,
    i ≠ j → b ≠ i → b ≠ j → a ≠ b →
    a ∈ shellAt i → b ∈ shellAt i →
    a ∈ shellAt j → b ∈ shellAt j →
    (SurplusCOMPGBank.btw (indexOf i) (indexOf j) (indexOf a) ↔
      ¬ SurplusCOMPGBank.btw (indexOf i) (indexOf j) (indexOf b))

/-- Three side predicates cannot be pairwise opposite.  This is the minimal
propositional core of the failed cyclic-order surface. -/
theorem false_of_three_pairwise_alternations
    {P Q R : Prop}
    (hPQ : P ↔ ¬ Q) (hPR : P ↔ ¬ R) (hQR : Q ↔ ¬ R) : False := by
  tauto

/-- No injective boundary indexing of the twelve labels can satisfy every
shared-pair alternation forced by the displayed equalities.  Injectivity is
included to state the intended cyclic-order surface; the three-alternation
core itself is already contradictory. -/
theorem no_injective_alternationSound :
    ¬ ∃ indexOf : Label → Fin 12,
      Function.Injective indexOf ∧ AlternationSound indexOf := by
  rintro ⟨indexOf, _hinjective, hsound⟩
  have h06 := hsound (1 : Label) (4 : Label) (0 : Label) (6 : Label)
    (by decide) (by decide) (by decide) (by decide)
    (by decide) (by decide) (by decide) (by decide)
  have h07 := hsound (1 : Label) (4 : Label) (0 : Label) (7 : Label)
    (by decide) (by decide) (by decide) (by decide)
    (by decide) (by decide) (by decide) (by decide)
  have h67 := hsound (1 : Label) (4 : Label) (6 : Label) (7 : Label)
    (by decide) (by decide) (by decide) (by decide)
    (by decide) (by decide) (by decide) (by decide)
  exact false_of_three_pairwise_alternations h06 h07 h67

/-- Geometry-level terminal behind the finite rejection.  It uses the exact
`btw_sep` theorem three times, then closes the minimal parity core. -/
theorem false_of_three_common_equidistant_points
    {n : ℕ} {ψ : Fin n → ℝ²}
    (hccw : EuclideanGeometry.IsCcwConvexPolygon ψ)
    (hinjective : Function.Injective ψ)
    {i j a b c : Fin n}
    (hij : i ≠ j)
    (hbi : b ≠ i) (hbj : b ≠ j)
    (hci : c ≠ i) (hcj : c ≠ j)
    (hab : a ≠ b) (hac : a ≠ c) (hbc : b ≠ c)
    (hiab : dist (ψ a) (ψ i) = dist (ψ b) (ψ i))
    (hiac : dist (ψ a) (ψ i) = dist (ψ c) (ψ i))
    (hjab : dist (ψ a) (ψ j) = dist (ψ b) (ψ j))
    (hjac : dist (ψ a) (ψ j) = dist (ψ c) (ψ j)) : False := by
  have hPairAB :
      SurplusCOMPGBank.btw i j a ↔ ¬ SurplusCOMPGBank.btw i j b :=
    btw_sep hccw hinjective hij hbi hbj hiab hjab (hinjective.ne hab)
  have hPairAC :
      SurplusCOMPGBank.btw i j a ↔ ¬ SurplusCOMPGBank.btw i j c :=
    btw_sep hccw hinjective hij hci hcj hiac hjac (hinjective.ne hac)
  have hiBC : dist (ψ b) (ψ i) = dist (ψ c) (ψ i) :=
    hiab.symm.trans hiac
  have hjBC : dist (ψ b) (ψ j) = dist (ψ c) (ψ j) :=
    hjab.symm.trans hjac
  have hPairBC :
      SurplusCOMPGBank.btw i j b ↔ ¬ SurplusCOMPGBank.btw i j c :=
    btw_sep hccw hinjective hij hci hcj hiBC hjBC (hinjective.ne hbc)
  exact false_of_three_pairwise_alternations hPairAB hPairAC hPairBC

#print axioms displayed_row_violates_twoCircle_card_gate
#print axioms no_injective_alternationSound
#print axioms false_of_three_common_equidistant_points

end ATailRetainedRadiusAlternationUnsat
end Problem97
