# Card-11 exact-five common full-radius v5

This directory preserves v1-v4 and starts exactly from the verified v4
production encoding: 43,087 variables and 594,498 clauses. V5 appends the
complete forward `ConvexFivePointCore` schema, adding no variables and
332,640 five-literal clauses. Each target has 43,087 variables and 927,138
clauses.

For each of the 144 boundary-order selectors `Oπ`, each anchor `a`, and each
choice of four increasing cyclic positions among the other ten labels as
`x,b,c,y`, v5 adds

```text
¬Oπ
∨ ¬G({x,a},{x,b})
∨ ¬G({y,a},{y,b})
∨ ¬G({c,b},{c,x})
∨ ¬G({c,b},{c,y}).
```

The naive count is `144 * 11 * C(10,4) = 332,640`. Exact canonical-clause
deduplication removes zero clauses.

`ConvexFivePointCore.false_of_core_of_neg` is the direct consumer for a
forward tuple in either stored order family under the live signed-area
convention; `false_of_core` handles the reversed positive orientation.

Run:

```bash
uv run python -B scratch/card11-exact5-common-fullradius-v5/audit_v4_models.py
uv run python -B scratch/card11-exact5-common-fullradius-v5/self_test.py
uv run python -B scratch/card11-exact5-common-fullradius-v5/probe.py --timeout 1800
```

All four persisted v4 models are rejected by witnesses whose four equalities
are direct selected-row seeds; none uses the exact-U5 seed. All four v5 cases
nevertheless remain SAT, with different complete models independently checked
against the exact DIMACS and reconstructed semantics.

SAT is terminal only for this finite abstraction. It does not establish
Euclidean realizability or supply the live geometric source-to-valuation and
boundary-order adapter. See `REPORT.md` for hashes, controls, theorem scope,
and the exact trust boundary.
