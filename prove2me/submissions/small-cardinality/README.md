# Small-cardinality closure

This packet connects two results that are already proved on Prove2Me: the
counting theorem that forces at least nine vertices and the finite theorem
that excludes exactly nine vertices. It publishes two consequences:

- every Problem 97 counterexample has at least ten points;
- Problem 97 holds for every nonempty point set in strictly convex position with at most nine
  points.

The source declarations in `Erdos9796Proof/P97/SmallCardinality.lean` use only
`propext`, `Classical.choice`, and `Quot.sound`. The platform adapters compile
against the exact accepted theorem statements they reuse.

Validate and apply from the repository root:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/small-cardinality/plan.toml
uv run python prove2me/tools/prove2me_submit.py apply \
  prove2me/submissions/small-cardinality/plan.toml
```
