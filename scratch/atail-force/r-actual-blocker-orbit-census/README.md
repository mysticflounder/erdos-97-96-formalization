# Bounded actual-blocker orbit census

This lane asks two deliberately small questions about the checked
source-exact minimal actual-blocker cycle:

1. can the proved equality/incidence shadow contain at least one `HIT` without
   a third common circle point?
2. can it be `all-OMISSION`?

It also exercises the live first-fiber nonbisector theorem as a separately
scoped hard rule:

```text
not (outsideSource in secondShell and otherOutside in secondShell).
```

The separation matters. That rule is proved for
`FreshOutsideFirstBlockerFiber P Pρ`, not for an arbitrary orbit edge.

The first-fiber packet is encoded separately from the generic cycle. It keeps
both exact four-shells, classifies first-cap membership for every represented
point, and records the proved partial blocker fibers. In this exact packet the
second shell has at least three outside-cap points. Consequently it needs at
least one outside point in addition to the named `q,o`; if it contains neither
`q` nor `o`, it needs at least two additional outside points. This is a finite
point-spending consequence, not a generic orbit rule.

## Trust boundary

Distance colors record only which unordered point pairs have equal lengths.
The encoder adds the banked two-circle intersection bound, but no triangle
inequalities, convex order, MEC condition, minimal-counterexample condition,
or coordinate realization. Therefore:

- a verified `SAT` model is an equality-pattern survivor, not a P97
  counterexample;
- a Z3 `UNSAT` is bounded discovery evidence, not a kernel-checked closure;
- `UNKNOWN` and timeout are nonterminal.

The exact six-point fixtures use integer squared distances from explicit
Euclidean coordinates. They validate the local metric shadows, but their
opaque robust-history/cap fields are assumptions, not realized geometry.

## Commands

```bash
uv run python scratch/atail-force/r-actual-blocker-orbit-census/test_census.py

uv run python scratch/atail-force/r-actual-blocker-orbit-census/census.py \
  --max-points 8 --max-period 4 --timeout-ms 20000

uv run python scratch/atail-force/r-actual-blocker-orbit-census/verify_model.py \
  scratch/atail-force/r-actual-blocker-orbit-census/out/models.jsonl
```

The census writes its checkpoint, verified models, and manifest under `out/`.
The manifest hashes every Lean source used to justify a hard rule. See
`RULE_LEDGER.md` for the exact scope and the excluded conjectures, and
`RESULTS.md` for the completed local sweeps. The explicit `p >= 11`
equality-shadow construction and its solver-free validator live in
`uniform_survivors.py`; `test_uniform_survivors.py` checks both queries through
`p = 100` and isolated-point extensions.
