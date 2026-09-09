# Prove2Me counterexample goal

This packet publishes the existential closure of the existing source predicate
[`Problem97.IsCounterexample`](../../../lean/Erdos9796Proof/P97/UniversalProblem97.lean)
and links it to the live combined Problems 97 and 96 mission as an alternate
resolution milestone.

The milestone is advisory because Prove2Me missions have one main theorem. If
the counterexample target is proved, the same witness must be submitted with
`proof_type=disprove` against `Erdos9796Mission.combined` to resolve the main
mission in the negative.

Run local validation with:

```bash
uv run python submissions/counterexample-goal/upload.py
```

Publish and attach the milestone with:

```bash
uv run python submissions/counterexample-goal/upload.py --execute
```
