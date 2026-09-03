# B1 MEC component-isolation audit

Date: 2026-09-03

## Scope

This wave separates the two nontrivial parts of the gauge-eliminated
circumscribed-MEC packet for exact source system
`82c2dfe781d609472430`:

- `disk-only` retains the gauge reconstruction backbone and all 18 polynomial
  disk-containment atoms, but omits the three nonobtuse atoms;
- `nonobtuse-only` retains the same reconstruction backbone and the three
  nonobtuse atoms, but omits all disk-containment atoms.

Both modes retain the four 6/4/4/4 row systems, pairwise distinctness, and the
stage-specific convexity policy.  This is finite diagnostic evidence only.  It
does not include deletion minimality, retained-deletion survival, or the full
Problem 97 counterexample context.

## Authenticated selector

The canonical endpoint PIQD adapter and producer now accept
`full`, `disk-only`, and `nonobtuse-only` through `--mec-components`.  The
selection is bound into source records, descriptor semantic input, query IDs,
stage results, final results, exact SAT replay, and offline publication
reconstruction.  Every query ID contains its mode.  The affected endpoint
artifact schemas and producer/verifier versions were advanced because the
authenticated record shapes changed.

Exact replay checks only the selected disk/nonobtuse payload while retaining
the common reconstruction checks: positive gauge height and reconstructed
positive radius plus the three boundary identities in the eliminated case, or
the explicit radius and boundary atoms in the ungauged case.

Focused verification passed:

- 133 endpoint PIQD tests;
- Ruff on the adapter, producer, and tests;
- `git diff --check`;
- offline publication validation for both target runs and both smoke controls.

## Results

Both governed runs use the previously authenticated 18-label input with SHA-256
`dc310082e5430b32bb6b0829ff627586f9d1a10111a3fe7fc9bfbbe8b955ee09` and a
120-second budget per PIQD/Z3 stage.

| mode | exact metric | full convex | convex-only | accepted result |
|---|---:|---:|---:|---|
| disk-only | UNKNOWN at 190 | UNKNOWN at 478 | UNKNOWN at 478 | UNKNOWN |
| nonobtuse-only | raw SAT at 175 | UNKNOWN at 463 | UNKNOWN at 463 | UNKNOWN |

The nonobtuse-only raw model is not an accepted SAT witness.  Twelve coordinate
readbacks use Z3 `root-obj` algebraic terms, while the endpoint trust boundary
accepts only exact rational readback.  Replaying the saved model fails at
`_real` with `EndpointMetricPiqdError`; the recorded effective status is
`INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE`.  The three apex coordinates in that
model are rational and satisfy the nonobtuse packet, but the complete 18-label
assignment is not promotable.

The durable run roots are:

- `scratch/runs/b1-mec-component-isolation-20260903/disk-only-v1`;
- `scratch/runs/b1-mec-component-isolation-20260903/nonobtuse-only-v1`.

## Theorem mining and next gate

The required new-wave mine found no SAT certificate, UNSAT core, assumption
subset, or concrete general theorem candidate.  The Lean reuse key therefore
did not materially change.

Removing the three nonobtuse atoms does not unlock the 18-disk system.  The
highest-information next computation is an authenticated disk-subset sweep,
starting with balanced halves and refining only the first subset that remains
hard.  This requires extending the same canonical adapter with a bound list of
selected disk labels; it should not be implemented as another standalone wave
script.  Algebraic-number replay is a larger trust-boundary change and is not
required for that next diagnostic.
