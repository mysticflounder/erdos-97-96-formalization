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
| `P97/ATail/SevenSourceCriticalShellDichotomy.lean` | `mutualOmission_or_exists_perm_supports_eq_paley` | Targeted build passed; no `sorryAx`; inherits the approved classifier trust boundary | Converts seven selected physical critical shells into the exact mutually-omitted-pair/Paley dichotomy. |
| `P97/ATail/PaleyCriticalShellAdapter.lean` | `false_of_literal_paley_critical_shells` | Targeted build passed; standard kernel axioms only | Converts literal Paley supports on seven full physical critical shells into the incompatible lifted-determinant system. |
| `P97/ATail/SevenSourceCriticalShellMutualOmission.lean` | `exists_mutualOmission`; `exists_seven_sources_outside_two_supports_with_mutualOmission` | Targeted build and independent `lean_verify` passed; no `sorryAx`; inherits the approved classifier trust boundary | Eliminates the Paley arm and produces a mutually omitted pair, including a version whose seven sources all lie outside two selected supports when `15 ≤ A.card`. |

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

At the abstract support level, the exact reduction is the dichotomy

```text
mutually omitted pair  OR  Paley T7 support residual.
```

`SevenSourceCriticalShellDichotomy` now packages the counting adapter from
seven carrier shells to this dichotomy.  `PaleyCriticalShellAdapter` then turns
the physical Paley arm into the normalized lifted-determinant contradiction,
and `SevenSourceCriticalShellMutualOmission` transports through the classifier
permutation.  Consequently any seven distinct carrier sources with their
selected full critical shells contain a mutually omitted pair.

The cardinality input is already available from
`card_ge_fifteen_of_all_cap_card_ge_six`.  An actual mutually omitted pair can
feed the existing critical-pair consumers that produce cross-deletion
survival, distinct blocker centers, and the pairwise support-intersection
bound.

The Paley arm remains satisfiable as a bare incidence pattern; its elimination
uses the physical-shell adapter and therefore genuinely depends on seven
**full carrier circle classes**.  A selected four-subset from a common-deletion
certificate is not automatically a full circle class and cannot be substituted
for one.  The proved theorem avoids that error by taking every shell from the
`CriticalShellSystem` itself.

## Live-spine impact

No production coordinator imports the terminal mutual-omission theorem at this
checkpoint.  The on-spine theorem

```text
Problem97.ATailFrontierLiveClosure.
  false_of_retainedOmission_triApexAllLarge_core
```

remains an explicit `sorry`.  The next stable promotion must consume the proved
mutually omitted pair: either map it into one of the checked canonical E1 core
archetypes or use it to prove the bounded-support/deletion-descent bridge for
general cardinality.  Until that consumer is proved, this checkpoint is a
reusable general producer, not closure of the retained-omission branch or P97.

## Verification evidence

- Targeted builds completed for `SevenSourceTournament`,
  `SevenSourceCriticalShellDichotomy`, `PaleyCriticalShellAdapter`, and
  `SevenSourceCriticalShellMutualOmission`.
- Independent `lean_verify` checks passed for both terminal mutual-omission
  endpoints, with no suspicious source patterns or `sorryAx`.
- The physical-shell adapter has the standard three-axiom footprint.  The
  dichotomy and terminal mutual-omission endpoints inherit exactly the approved
  compiler-trust additions listed above from the tournament classifier.
