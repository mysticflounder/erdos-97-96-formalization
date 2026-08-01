# Root-obligation computational audit (2026-07-31)

Scope: read-only audit of existing `scratch/atail-force` models, CEGAR runs,
and theorem-bank search for the two live leaves
`TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence` and
`...false_of_capSourceThirdCanonicalRowSurface` in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7452-7495`.
No production Lean file was edited.

## Cross-blocker coincidence leaf

The live interface is `CrossBlockerCoincidence P Pρ` plus
`GeometricMultiplicityResidual P Pρ`; the former has four equality arms and
the latter has three residual arms.  The existing symbolic projection was
re-run with:

```bash
uv run python scratch/atail-force/cross-blocker-equality-audit/symbolic_12_branch_audit.py
```

It enumerated all `4 × 3 = 12` branches.  Every row printed
`dup=False exact=False perp=False k4=False`; the only residual component was
the expected single positive membership (`B in row(A)` or `A in row(B)`).
Thus the exposed local equalities/incidences do not produce a duplicate,
exact-two, perpendicular, or capacity contradiction.

The exact rational Euclidean follow-up was re-run with:

```bash
uv run python scratch/atail-force/cross-blocker-euclidean-audit/exact_12_branch_witnesses.py
```

Result: `verified 12 exact rational witnesses` (the deliberate perturbation
smoke test was rejected).  See
`scratch/atail-force/cross-blocker-euclidean-audit/results.{md,json}`.  The
projection checks the named radii, source/blocker distinctness, aliases,
omissions, and each residual arm, but omits full `CounterexampleData`, cap
order, complete supports, minimality/no-M44, and tri-apex data.  It therefore
rules out only a local metric/order closure, not the production theorem.

The stronger Lean scratch certificate also passes:

```bash
cd lean && lake env lean ../scratch/full-exact-two-cross-equality/CrossEqualityMetricModel.lean
cd lean && lake env lean ../scratch/cross-blocker-terminal/CrossBlockerCoincidenceAudit.lean
```

Both exit successfully.  Their `#print axioms` output is only
`[propext, Classical.choice, Quot.sound]`; they prove local realizability and
that the displayed cross-hit conclusion is impossible under exact disjoint
rows, but do not derive `False` from the missing global hypotheses.

## Cap-source third canonical row leaf

The closest existing solver is the bounded `n = 17`, cap-profile `(6,8,6)`
Boolean/QF-FD model in
`scratch/atail-force/aligned-singleton-second-nonbisector-cegar/` (the model
docstring explicitly says it is necessary-condition only, omits coordinates,
full no-M44, and strict metric constraints).  Existing results are all
fail-closed:

* `cegar-result-continued.json`: `BOUNDED_UNCERTIFIED_RESULT`, 672 cuts,
  wall-clock budget exhausted at 600.37 s.
* `qf-bool-cegar-result.json` and `qf-bool-qffd-cegar-result.json`:
  `UNKNOWN_FAIL_CLOSED_NO_MATHEMATICAL_RESULT` (outer timeout).
* `scratch/atail-force/aligned-singleton-second-nonbisector-cadical/RESULT.md`
  and `run-summary.json`: CNF has 116,393 variables and 1,435,449 clauses;
  CaDiCaL returns `UNKNOWN` after 600 s (default) and 300 s (`--sat -n`),
  with an incomplete, non-certifying DRAT stream.  The model is fixed `n=17`
  and omits Euclidean realizability; the live theorem is `n ≥ 17`.

The induced source-faithful v19 run
(`scratch/atail-force/aligned-singleton-second-nonbisector-induced/cegar-v19-custom-q-cover-q-critical-reuse-second.json`)
is `status=ALIVE`, `epistemic_status=INDUCED_NECESSARY_CONDITION_ONLY`, with
2,434 banked cuts and 14,740 resumed cuts.  Its exact-coordinate probe
(`euclidean-survivor-probe-v19-custom-q-cover-q-critical-reuse-second.json`)
reports `UNKNOWN` for the positive-rows QF_NRA check.  This is neither an
UNSAT certificate nor a Euclidean model of the Lean hypotheses.

An indexed theorem search was run:

```bash
nthdegree docs search --lean "CrossBlockerCoincidence GeometricMultiplicityResidual" --current-project
nthdegree docs search --lean "false_of_capSourceThirdCanonicalRowSurface" --current-project
```

The only matches are the live definitions/normalizer and the two target
leaves (plus compatibility/swap wrappers).  No banked certificate or
source-clean theorem consumes either root packet to `False`.

## Conclusion

No existing computational artifact materially closes either root obligation.
The honest first missing bridge remains global support/cap-order/minimality/
no-M44/tri-apex structure (or a producer of positive cross-row incidence),
not another local SAT/Euclidean branch search.  All solver results above are
bounded or induced necessary-condition evidence and cannot be promoted to a
kernel-closed theorem.
