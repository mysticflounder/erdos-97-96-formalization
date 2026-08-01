# Cap-source terminal model check (2026-07-31)

## Scope

Audited the live declarations in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`:

* `TwoSourceExactCollisionRowsTerminal.false_of_capSourceThirdCanonicalRowSurface`
  (the common terminal, line 7491), and
* `TwoSourceExactCollisionRowsTerminal.false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`
  (compatibility adapter, line 11047).

No production Lean file was edited.

## Exact source/dependency result

The adapter body ignores `hsingleton`, `haligned`, and `hsecondNe`.  It packages
`hsource : FirstFiberCapSourceWitness` as
`CapSourceThirdCanonicalRowSurface` and `Q` as the
`Nonempty (FreshOutsideFirstBlockerFiber ...)` arm of
`GeometricMultiplicityResidual`, then calls the common terminal.  Therefore
the adapter has no independent contradiction; its only load-bearing dependency
is the `sorry` at `false_of_capSourceThirdCanonicalRowSurface`.

Focused axiom check (`lake env lean ../scratch/aligned_target_axioms.lean`, run
from `lean/`) reports:

```text
false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector
  depends on [propext, sorryAx, Classical.choice, Quot.sound]
false_of_capSourceThirdCanonicalRowSurface
  depends on [propext, sorryAx, Classical.choice, Quot.sound]
secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber
  depends on [propext, Classical.choice, Quot.sound]
```

The last theorem is kernel-closed but proves only the strict non-bisection
inequality used as `hsecondNe`; it does not derive `False`.

## Bounded abstraction

Replayed the existing finite Boolean survivor:

```text
uv run python scratch/atail-force/aligned-singleton-second-nonbisector-cegar/verify.py \
  scratch/atail-force/aligned-singleton-second-nonbisector-cegar/nonbisector-v3.json
```

Output:

```json
{"blocker_count":17,"input":".../nonbisector-v3.json","n":17,
 "not_robust_count":14,"row_count":17,
 "schema":"p97-aligned-singleton-second-nonbisector-verification-v1",
 "target":"second_blocker_nonbisector","verified":true}
```

The input is `status: SAT`,
`epistemic_status: BOUNDED_COMBINATORIAL_SURVIVOR_NOT_EUCLIDEAN_NOT_LEAN`,
with `n = 17`, cap sizes `(6,6,8)`, singleton/alignment constraints, and the
strict second-blocker non-bisector target all present in the Boolean schema.
Thus the exposed finite/cardinality/incidence hypotheses are satisfiable in an
abstraction; this is not a Euclidean `CounterexampleData` model.

As a diagnostic only, the same assignment fails an added rational strict-
Kalmanson/triangle metric gate (`status: UNSAT`, 4,760 Kalmanson and 2,040
triangle constraints, 146 equalities, 1,894 disequalities, 0.348 s).  That gate
is neither Euclidean-complete nor a kernel-checked Lean certificate, so it does
not establish inconsistency of the full theorem hypotheses.

## Classification and next target

* **Full hypotheses:** neither inconsistency nor satisfiability is established.
* **Finite Boolean abstraction:** SAT survivor exists (verified above).
* **Concrete source-clean Lean bridge:** none found.  Existing row/cardinality,
  singleton-radius, ordered-cap, and blocker-fiber lemmas are source-clean but
  only produce the cap-source surface/residual; they do not close it.

The next genuine proof target is the common terminal
`false_of_capSourceThirdCanonicalRowSurface`: derive a global metric/incidence
bridge from `CapSourceThirdCanonicalRowSurface` plus
`GeometricMultiplicityResidual` (for example, force a second-blocker
bisector of the first-fiber outside pair or one of the four cross-row hits).
Reusing the aligned adapter cannot advance the frontier because it delegates
directly to this same `sorry` leaf.
