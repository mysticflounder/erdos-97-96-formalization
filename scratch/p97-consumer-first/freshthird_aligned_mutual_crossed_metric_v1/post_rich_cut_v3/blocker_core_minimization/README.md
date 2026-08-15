# Blocker-core minimization

This directory globally minimizes the final 1,070-clause
`blocker_exactness` query for the one frozen exact-17, direct-crossed
`post_rich_cut_v3` incidence assignment. It does not re-enumerate incidence
and it does not begin another CEGAR round.

The result is a nine-clause irreducible UNSAT core: eight K4 common-radius
equalities and one unique-four blocker disequality. The contradiction is
derived by distance symmetry and equality transitivity; the canonical query
and core contain no direct syntactic equality/disequality pair.

The source-entitled identity

```text
selected_rows[s] = point_k4_rows[blockers[s]]
```

is checked independently for every one of the 17 sources before clauses are
built. The audit records 17 matches and zero mismatches in `results.json`.

## Reproduction

From this directory, with the repository's `uv` environment:

```bash
uv run python minimize.py --timeout-ms 120000
uv run python verify.py
uv run pytest -q tests
```

The first command invokes external Z3 and cvc5. The verifier is deterministic
and does not rerun the solvers: it reconstructs every query, checks the exact
row identity and distance chain, validates statuses, and authenticates all
listed artifacts with `SHA256SUMS`.

Raw nonlinear SAT drop-one queries were not used as the independent external
replay because they can time out. Instead, each candidate has an explicit
triangular-lattice model. The script first substitutes that model into the
original raw formulas and proves every formula exactly with Z3 arithmetic. It
then gives the resulting exact substituted query to both external solvers.
Two witnesses are rational and additionally pass a `Fraction` replay; seven
live in `Q(sqrt(3))` and are marked `SKIP_ALGEBRAIC` for that Fraction-only
check. The exact coordinates and validation outcomes are stored per drop.

## Artifacts

- `RESULTS.md`: human-readable result and the complete core.
- `INGRESS-CONTRACT.md`: scope, source mapping, and promotion boundary.
- `results.json`: machine-readable audit, core, witnesses, and solver results.
- `generated/`: one-check SMT artifacts and exact models.
- `logs/`: external solver commands and outputs.
- `tests/` and `verify.py`: unit and artifact verification.
- `SHA256SUMS`: hashes of the frozen inputs, scripts, documentation, and output.

This is a source-entitled **preflight cut for one frozen incidence motif**.
It rejects that motif and is not a P97 counterexample, a universal FreshThird
producer, a Lean theorem, or a `sorry` closure.
