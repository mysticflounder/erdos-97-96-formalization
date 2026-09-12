# Sharp height bound for the normalized return configuration

This packet publishes the quantitative companion to the normalized two-circle
contradiction. Under the same affine chart, equal-distance equations, separator
signs, and strict-convexity hypotheses, a lower-center height greater than one
forces the inner normalized height below `2 - √3`.

The theorem is conditional. It does not construct the chart or separator from
a Problem 97 counterexample, and it does not establish the mutual selected-row
hypotheses used later in the descent argument. It is published as a theorem
node rather than as a separate fixed-cardinality milestone.

The Lean proof is by Adam McKenna and is released under Apache-2.0. The source
and platform validation use only `propext`, `Classical.choice`, and
`Quot.sound`; no finite certificate bank is involved.

Validate and apply from the repository root:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/normalized-height-bound/plan.toml
uv run python prove2me/tools/prove2me_submit.py apply \
  prove2me/submissions/normalized-height-bound/plan.toml
```
