# Witness-system deletion support

This packet publishes the witness-system definition and two proved interfaces
from the minimal-counterexample analysis for Problem 97. A witness system
chooses, for each point, a class of at least four other points at one common
positive distance.

The deletion theorem says that a point which occurs in none of those classes
can be removed while preserving nonemptiness, strict convexity, and the
four-witness property. The nine-point theorem says that this situation cannot
occur when the set has exactly nine points: deletion would produce an
eight-point configuration, contradicting the accepted lower bound of nine.

These results expose a useful interface for the descent argument. They do not
establish the separate theorem that every larger minimal counterexample has a
point of in-degree zero. No milestone is attached to this packet.

The formalization is by Adam McKenna. The source is
`lean/Erdos9796Proof/P97/K4WitnessDeletion.lean`, at commit
`387e5b44ae26906725a4898b0a01c2d7345ddb38`.
The nine-point lower bound used by the incidence corollary follows Adrian
Dumitrescu's 2006 isosceles-count method in *On Distinct Distances from a
Vertex of a Convex Polygon*.

`receipt-initial-http400.json` records the rejected first request, which used a
Lean declaration name as the Prove2Me definition package name. The corrected
plan uses the module-style package name `Problem97_IsWitnessSystem`, while the
Lean declaration remains `Problem97.IsWitnessSystem`. `receipt.json` records
the accepted run.

Validate and apply from the repository root:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/witness-deletion-support/plan.toml
uv run python prove2me/tools/prove2me_submit.py apply \
  prove2me/submissions/witness-deletion-support/plan.toml
```
