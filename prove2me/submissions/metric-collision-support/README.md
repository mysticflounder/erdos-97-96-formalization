# Metric collision support

This packet publishes three reusable plane-geometry lemmas from the local
Problem 97 development:

- a point equidistant from three pairwise-distinct points is unique;
- an equilateral triangle together with two further equal-distance conditions
  forces one of two point collisions; and
- three linked equal-distance triads force two named points to coincide.

These are standalone theorem nodes rather than separate mission milestones.
They support later finite-configuration and descent arguments, but none of them
alone resolves a fixed cardinality case or either Erdős problem.

The Lean proofs are by Adam McKenna and are released under Apache-2.0. They use
ordinary kernel-checked algebra and Euclidean geometry; no finite certificate
or `native_decide` theorem bank is involved.

Validate and apply from the repository root:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/metric-collision-support/plan.toml
uv run python prove2me/tools/prove2me_submit.py apply \
  prove2me/submissions/metric-collision-support/plan.toml
```
