# Card-11 exact-five common full-radius v4

This directory preserves v1-v3 and starts from the verified v3 production
encoding exactly: 43,087 variables and 589,878 clauses. V4 appends only the
perpendicular-bisector-core obstruction. It adds no variables and exactly
4,620 ternary clauses, for 43,087 variables and 594,498 clauses per target.

For each focus pair `a<b` and triple `p<q<r` outside `{a,b}`, v4 adds

```text
¬G({p,a},{p,b}) ∨ ¬G({q,a},{q,b}) ∨ ¬G({r,a},{r,b}).
```

Here `G` is v3's global equality relation on the 55 nonloop carrier edges.
The count is
`C(11,2) * C(9,3) = 55 * 84 = 4,620`.

The geometric obstruction is formalized by
`EqualityCore.false_of_convexIndep_of_perpBisectorCore`; the native
selected-row detector and soundness theorem are `perpendicularBisectorCore`
and `perpendicularBisectorCore_sound`. Scope matters: the native soundness
theorem covers selected-row closure. V4 also retains v3's proved exact-U5
equality seeds, so an augmented-closure bridge or a direct distance-equality
consumer is still needed for paths that use those seeds.

Run:

```bash
uv run python -B scratch/card11-exact5-common-fullradius-v4/audit_v3_models.py
uv run python -B scratch/card11-exact5-common-fullradius-v4/self_test.py
uv run python -B scratch/card11-exact5-common-fullradius-v4/probe.py --timeout 1800
```

All four v3 models are rejected by explicit perpendicular-bisector witnesses.
All four new v4 cases nevertheless remain SAT. The production runs were
serial, with one CaDiCaL process and a per-case timeout of 1,800 seconds.
Every SAT result has a complete model independently checked against the exact
DIMACS and reconstructed semantics.

SAT here is terminal only for this finite abstraction. It does not establish
Euclidean realizability, supply the source-to-valuation adapter, or close a
Lean theorem. See `REPORT.md` for counts, hashes, witnesses, mutation controls,
and the exact trust boundary.
