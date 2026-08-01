# Aligned singleton / second-blocker nonbisector audit (2026-07-31)

Target: `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`.

## Source/dependency audit

The declaration is at `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:11047`.
Its body only packages `hsource` as
`CapSourceThirdCanonicalRowSurface P Pρ` and `Q` as the
`Nonempty (FreshOutsideFirstBlockerFiber P Pρ)` arm, then calls
`false_of_capSourceThirdCanonicalRowSurface` (the `sorry` leaf at
`FrontierLiveClosure.lean:7491`).  The arguments `hsingleton`, `haligned`, and
`hsecondNe` are not used in the body.  Thus this is a compatibility adapter,
not an independent closure.

Command (from `lean/`):

```text
lake env lean ../scratch/aligned_target_axioms.lean
```

Relevant output:

```text
'...false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector'
depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
'...false_of_capSourceThirdCanonicalRowSurface' depends on axioms:
[propext, sorryAx, Classical.choice, Quot.sound]
'...secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber' depends on axioms:
[propext, Classical.choice, Quot.sound]
```

The nearby `secondBlocker_dist_ne_of_freshOutsideFirstBlockerFiber` is
kernel-closed and proves the non-bisection inequality from `Q`; it does not
prove `False`.  The singleton slice is likewise produced by the source-clean
`firstFiberCapSource_firstApexRadius_eq_singleton_of_aligned` route, but no
source-clean consumer of the full packet is present.

## Bounded computational sanity check

The existing n=17 outer survivor was checked with:

```text
uv run python scratch/atail-force/aligned-singleton-second-nonbisector-cegar/verify.py \
  scratch/atail-force/aligned-singleton-second-nonbisector-cegar/nonbisector-v3.json
```

Result:

```json
{"blocker_count":17,"input":".../nonbisector-v3.json","n":17,
 "not_robust_count":14,"row_count":17,
 "schema":"p97-aligned-singleton-second-nonbisector-verification-v1",
 "target":"second_blocker_nonbisector","verified":true}
```

The input payload itself is `status: SAT` with
`epistemic_status: BOUNDED_COMBINATORIAL_SURVIVOR_NOT_EUCLIDEAN_NOT_LEAN`,
zero connectivity refinements, and explicitly omits Euclidean coordinates/MEC
realizability, strict triangle/Kalmanson inequalities, full noM44 geometry,
and the monolithic two-circle overlay.  Therefore it demonstrates only that
the finite Boolean abstraction (including singleton/alignment and the
nonbisector target) is satisfiable.

As a bounded metric follow-up:

```text
uv run python scratch/atail-force/aligned-singleton-second-nonbisector-cegar/metric_check.py \
  scratch/atail-force/aligned-singleton-second-nonbisector-cegar/nonbisector-v3.json \
  --output scratch/aligned_target_metric_rerun_2026-07-31.json --timeout-ms 120000
```

Result: `status: UNSAT` in 0.3479 s, with 4,760 strict-Kalmanson and 2,040
strict-triangle constraints (146 equalities, 1,894 disequalities).  The
artifact labels this `BOUNDED_RATIONAL_KALMANSON_CHECK_NOT_EUCLIDEAN_NOT_LEAN`;
it is not a Euclidean-realizability proof and not a Lean certificate.

## Honest status

The full Lean hypotheses are **not shown satisfiable or refutable**.  At the
finite combinatorial abstraction they are underconstrained (a verified SAT
survivor exists), while the added rational metric gate rejects that particular
n=17 partition.  Since the theorem is for arbitrary `n >= 17` and the gate is
neither Euclidean-complete nor kernel-checked, no contradiction or closure
follows.  The target remains a `sorryAx`-dependent compatibility wrapper whose
missing mathematical content is the common cap-source/multiplicity terminal.
