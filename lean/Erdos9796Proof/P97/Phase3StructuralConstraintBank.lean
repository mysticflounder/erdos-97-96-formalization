/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ExactTenSelectedShellMincut
import Erdos9796Proof.P97.Phase3SharedPairSeparation
import Erdos9796Proof.P97.PropositionEExactTen
import Erdos9796Proof.P97.U1CardTenCapProfile

/-!
# Phase-3 structural-constraint theorem bank

This import-only module collects kernel-checked semantic constraints used to
justify clauses in the Phase-3 exact-ten projected search.

It currently banks the incoming- and outgoing-cut theorems for an arbitrary
choice of four equal-distance witnesses at every point of a ten-point
counterexample, together with cyclic separation of two witnesses shared by
two selected four-classes and the exact `(5,4,4)` cap profile forced at
cardinality ten.  These theorems justify the intended `k = 4`, `n = 10`
`S-MINCUT` family, the shared-pair order filter, and the SAT profile recorded
as `(4,4,5)`.

The bank also exports
`propositionE_n10_of_u2FullDistanceClasses`, a source-clean exact-ten
terminal under `IsM44` and `U2FullDistanceClasses`.  Neither hypothesis is
produced here; in particular, this import does not turn Proposition E into an
unconditional exact-ten closure.

The propositional lemma `false_of_exactlyOne3_badPattern` records the common
core of the nine externally DRAT-verified depth-nine wave-1 leaves: the third
selector row has one of the patterns `000`, `011`, or `101`, each incompatible
with its exactly-one constraint.  The fixed first selector row and the three
one-hot choices for the second selector row therefore do not enter the proof.
This lemma does not import or replay those certificates, and the external
44-leaf terminal bank still requires checked CNF semantics, certificate
ingress, and exhaustive adaptive-prefix coverage.

This module makes no claim that the Python generator is kernel verified, that
the labelled SAT variables have been bridged to a live geometric
counterexample, that the current clauses cover all projected patterns, or that
Problem 97 is closed.
-/

namespace Problem97

/-- An exactly-one triple cannot be `000`, `011`, or `101`.

These are precisely the three bad third-row patterns shared by the nine
depth-nine wave-1 terminal shards. -/
theorem false_of_exactlyOne3_badPattern
    {x0 x1 x2 : Prop}
    (hexactlyOne :
      (x0 ∨ x1 ∨ x2) ∧
        ¬ (x0 ∧ x1) ∧ ¬ (x0 ∧ x2) ∧ ¬ (x1 ∧ x2))
    (hbad :
      (¬ x0 ∧ ¬ x1 ∧ ¬ x2) ∨
        (¬ x0 ∧ x1 ∧ x2) ∨
        (x0 ∧ ¬ x1 ∧ x2)) :
    False := by
  rcases hexactlyOne with ⟨hatLeastOne, -, h02, h12⟩
  rcases hbad with h000 | h011 | h101
  · rcases h000 with ⟨hx0, hx1, hx2⟩
    rcases hatLeastOne with hx0' | hx1' | hx2'
    · exact hx0 hx0'
    · exact hx1 hx1'
    · exact hx2 hx2'
  · exact h12 ⟨h011.2.1, h011.2.2⟩
  · exact h02 ⟨h101.1, h101.2.2⟩

end Problem97
