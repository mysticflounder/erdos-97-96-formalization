# Child46 weighted-Kalmanson theorem derivation

## Result

The following Lean theorem was derived and checked in a temporary Lean
harness against the built Child46 module; its complete statement is retained
here:

```lean
false_of_sourceRealization_of_waveOccurrence_all_hits
    (source : SourceRealization A)
    (occurrence : WeightedSourceOccurrence)
    (hoc : occurrence ∈ waveOccurrences)
    (order : NamedOrder) (direction : Orientation)
    (horder : source.model.order = order)
    (hall : ∀ hit ∈ priorOrientedHits occurrence.hits order direction,
      hit.2 ∈ source.model.selected hit.1) : False
```

It combines the existing checked-occurrence theorem
`sourceAssign_weightedOccurrenceClause` with the exact clause evaluation
theorem `weightedOccurrenceClause_eval_false_of_all_hits`. Thus, for any of
the nine checked Child46 occurrences and either orientation, a source model
cannot simultaneously select every prior-oriented support hit.

## Boundary

This is a finite, source-valid conditional theorem. It does not prove that the
36-clause `extendedFortySixthModelRefinementsCnf` is UNSAT, because that requires
an exact-cover/terminal argument over all assignments or an independently
verified terminal certificate. It also does not promote the Child46 module onto
the proof spine; the module remains off-spine until an import-reachable consumer
and the terminal obligation are supplied.

## Verification

- Lean build: a one-file `lake env lean` harness importing
  `BlockerVExactSeventeenFortySixthModelRefinements`.
- The checked theorem has axiom set `[propext, Classical.choice,
  Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]`, identical to the
  imported Child46 source bridge; no new axiom is introduced by this theorem.
- The theorem is intended as the source-facing consumer for future authenticated
  six-hit certificates, not as a universal coverage claim.
