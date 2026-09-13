# Extra isosceles-count support

This packet publishes two reusable consequences of the local isosceles-count
argument:

- one vertex contributing at least seven local isosceles pairs raises the total
  lower bound from `6 · |A|` to `6 · |A| + 1`; and
- in a nine-point configuration, that extra local pair gives a total count of
  at least `55`.

The results expose the finite-nine counting interface used by the later shape
arguments. They are supporting theorems and do not resolve a mission
milestone by themselves.

The counting method follows Adrian Dumitrescu's 2006 paper *On Distinct
Distances from a Vertex of a Convex Polygon*. The Lean formalization and these
Prove2Me proofs are by Adam McKenna and are released under Apache-2.0.

Validate and apply from the repository root:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/extra-isosceles-count-support/plan.toml
uv run python prove2me/tools/prove2me_submit.py apply \
  prove2me/submissions/extra-isosceles-count-support/plan.toml
```
