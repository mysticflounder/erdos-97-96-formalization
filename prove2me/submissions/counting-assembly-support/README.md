# Counting assembly support

This packet publishes four intermediate theorems already used by the accepted
Prove2Me proof that every counterexample has at least nine points:

- summing the six isosceles pairs forced at every vertex;
- proving that a strictly convex set with four equidistant witnesses at every
  vertex is not collinear;
- obtaining at least three points on the boundary of its minimum enclosing
  circle; and
- combining the total-count lower bound with the stated quadratic upper bound
  to force at least nine points.

The accepted proof already establishes the nine-point conclusion. Publishing
these lemmas exposes its arithmetic and geometric assembly and makes the
lemmas reusable by later proofs.

The counting method follows Adrian Dumitrescu's 2006 isosceles-count argument
in *On Distinct Distances from a Vertex of a Convex Polygon*. The Lean
formalization and these Prove2Me proofs are by Adam McKenna and are released
under Apache-2.0.

`receipt-initial-failed.json` records an initial packaging failure: two theorem
statement files unnecessarily imported new theorems that were still Open.
Removing those imports from the statement preambles fixed the submission; the
proof files retain the actual dependencies. `receipt.json` records the accepted
run.

Validate and apply from the repository root:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/counting-assembly-support/plan.toml
uv run python prove2me/tools/prove2me_submit.py apply \
  prove2me/submissions/counting-assembly-support/plan.toml
```
