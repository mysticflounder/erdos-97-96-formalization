# Normalized two-circle return obstruction

This packet publishes the standalone affine-geometric contradiction proved in
`Erdos9796Proof/P97/ATail/ExactFiveMutualReturnChord.lean`. It describes an
injective affine chart for five points, two equal-distance equations, a height
bound, and an affine separator. Those hypotheses cannot all hold for points in
strictly convex position.

The theorem is a conditional geometric leaf. It does not prove that a Problem
97 counterexample supplies the required chart, mutual incidence, height bound,
or separator, and it does not close the exact-five branch by itself. Those
connections remain part of the open descent argument.

The Lean proof is by Adam McKenna and is released under Apache-2.0. The source
and platform validation use only `propext`, `Classical.choice`, and
`Quot.sound`; no finite certificate bank is involved.

Validate and apply from the repository root:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/exactfive-normalized/plan.toml
uv run python prove2me/tools/prove2me_submit.py apply \
  prove2me/submissions/exactfive-normalized/plan.toml
```
