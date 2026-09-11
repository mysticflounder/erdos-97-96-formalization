# Pinned-multiplicity foundation

This packet adds the pinned-distance language used by the large-cardinality
descent to the Prove2Me mission. It publishes two definitions and five proved
theorems, culminating in proofs of both implications between Problem 97 and
the existence of a vertex whose maximum repeated positive distance occurs at
most three times.

The final theorem restates the open problem in both directions. Its proof does
not establish either statement by itself. The package stops before the later
large-cardinality case analysis and its computational certificates.

The sources are adapted to the already-published `Erdos9796Mission` vocabulary
and validated under the repository's Lean 4.33.1 toolchain. The combined
validation theorem uses only `propext`, `Classical.choice`, and `Quot.sound`.

Validate and apply from the repository root:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/pinned-multiplicity/plan.toml
uv run python prove2me/tools/prove2me_submit.py apply \
  prove2me/submissions/pinned-multiplicity/plan.toml
```

The milestone title and descriptions use mathematical language rather than
internal project labels. The pinned formulation follows Erdős's repeated-
distance viewpoint; the Lean definitions and proofs are this project's work.
