# Two-source collision residual probe (2026-07-31)

## Scope

This is a bounded computational probe of the two live leaves
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal`:

* `false_of_crossBlockerCoincidence` (four coincidence arms), and
* `false_of_capSourceThirdCanonicalRowSurface` (cap-source surface crossed
  with the three `GeometricMultiplicityResidual` arms).

The base model is the existing exact rational projection
`scratch/atail-force/cross-blocker-euclidean-audit/exact_12_branch_witnesses.py`.
No production Lean files were edited.

## Probe

```text
uv run python scratch/computational_residual_probe_20260731.py
```

Output summary:

```text
branches=12 status_counts={'SAT_ABSTRACT': 12}
```

All `4 × 3` branches are SAT in this layered abstraction.  The probe adds:

* an abstract eight-label cap-source surface (fresh source plus seven
  fillers, with distinct blocker/apex labels);
* the existing exact cross-blocker and residual branch data;
* the smallest all-large-cap profile `(8,6,6)`, which excludes the abstract
  `IsM44` shape `(?,4,4)`;
* two-cycle nonreturn as the already checked distinct first-apex radii; and
* three distinct abstract tri-apex labels, a six-member rich class for each,
  and the no-single-centre cover condition.

## Verdict and trust boundary

**SAT_ABSTRACT (12/12), not UNSAT.**  This does not produce a
`CounterexampleData` witness and does not refute either Lean leaf.  The cap
labels, no-M44 condition, two-cycle condition, and tri-apex package are only
finite-name abstractions; no convex cap partition, complete four-point shell,
minimality/deletion robustness, `CrossPairDeletionView`, or global distance
condition is encoded.  Therefore the live theorem status remains **UNKNOWN**:
the probe shows that the named collision/residual equations plus these weak
root summaries do not force a contradiction.  Any UNSAT result must consume
the omitted global geometry or a stronger producer for the stranded cap-source
and blocker-fiber data.
