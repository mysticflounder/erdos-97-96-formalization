# P97 seven-source Paley/Fano theorem bank (2026-08-02)

## Scope

This checkpoint records a reusable general-cardinality theorem bank for the
seven-source route inside the retained-omission tri-apex residual.  It is a
producer and residual classifier, not a proof of
`ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.

## Banked declarations

| Module | Main declaration | Status | Mathematical role |
|---|---|---|---|
| `P97/ATail/SevenSourcesOutsideTwoShells.lean` | `exists_seven_carrierVertices_outside_two_selected_supports` | Source-clean; standard kernel axioms only | From `15 ≤ A.card`, selects seven carrier vertices outside the union of two selected four-supports. |
| `P97/ATail/SevenSourceTournament.lean` | `exists_perm_supports_eq_paley` | Source-clean under the approved `native_decide` compiler-trust boundary | Classifies seven four-supports with self-membership, exact one-way pair coverage, and pairwise intersection at most two as the Paley `T₇` support system. |
| `P97/ATail/FanoSevenCircleObstruction.lean` | `normalized_paley_determinants_incompatible` | Source-clean; standard kernel axioms only | Refutes the normalized seven-determinant system induced by the Paley/Fano support pattern. |

The tournament theorem has axiom footprint

```text
propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound
```

and no suspicious source-scan findings.  The LSP emits the expected
`native_decide` style warning.  The selector and determinant kernel use only

```text
propext, Classical.choice, Quot.sound
```

## What the bank isolates

At the abstract support level, the intended exact reduction is the dichotomy

```text
mutually omitted pair  OR  Paley T7 support residual.
```

The current modules bank the selector and the classifier for the second arm;
they do not yet package the elementary counting adapter from the seven carrier
shells to that dichotomy.

The cardinality input is already available from
`card_ge_fifteen_of_all_cap_card_ge_six`.  An actual mutually omitted pair can
feed the existing critical-pair consumers that produce cross-deletion
survival, distinct blocker centers, and the pairwise support-intersection
bound.

The Paley arm is satisfiable as a bare incidence pattern.  The normalized
determinant theorem therefore does not eliminate it by itself.  A geometric
adapter must still turn seven **full carrier circle classes** into the
paraboloid-lift determinant hypotheses, handle the possible lift ranks, and
preserve the required nonmembership facts.  A selected four-subset from a
common-deletion certificate is not automatically a full circle class and
cannot be used as such.

## Live-spine impact

No production coordinator imports these modules at this checkpoint.  The
on-spine theorem

```text
Problem97.ATailFrontierLiveClosure.
  false_of_retainedOmission_triApexAllLarge_core
```

remains an explicit `sorry`.  The next stable promotion should prove and
expose the mutual-omission/Paley counting dichotomy immediately before that
theorem and then prove the geometric Paley-to-determinant adapter.  Until those
adapters are proved, this checkpoint is a reusable obstruction bank and a
residual classifier, not closure of the retained-omission branch or of P97.

## Verification evidence

- `SevenSourceTournament` completed its targeted module build.
- `lean_verify` reports no suspicious source patterns for the three public
  endpoints listed above.
- The two non-computational endpoints have the standard three-axiom footprint;
  the tournament endpoint has exactly the approved compiler-trust additions
  listed above.
