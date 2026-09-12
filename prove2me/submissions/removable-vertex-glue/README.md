# Removable-vertex descent glue

This packet publishes the elementary descent interface used by the Problem 97
argument. It defines when a vertex is removable and proves that deleting such
a vertex from a strictly convex counterexample with at least two points gives
a nonempty, strictly smaller counterexample.

The result is conditional: it does not construct a removable vertex. The
mission's open large-cardinality milestone is responsible for proving that a
suitable vertex exists in a minimal counterexample with more than nine points.

The source declaration in `Erdos9796Proof/P97/SmallerCounterexample.lean` and
the platform validation use only `propext`, `Classical.choice`, and
`Quot.sound`. No finite certificate bank is involved.

Validate and apply from the repository root:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/removable-vertex-glue/plan.toml
uv run python prove2me/tools/prove2me_submit.py apply \
  prove2me/submissions/removable-vertex-glue/plan.toml
```
