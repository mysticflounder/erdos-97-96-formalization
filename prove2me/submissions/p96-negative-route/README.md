# Problem 96 negative route

This plan uses the reusable manifest-driven Prove2Me submission tool. It keeps
the existing positive Problem 96 theorem, clarifies that an independent direct
proof is welcome, publishes an eventual superlinear-family target, and proves
that target implies the exact negation of Problem 96.

Validate locally without network access:

```bash
uv run python prove2me/tools/prove2me_submit.py validate \
  prove2me/submissions/p96-negative-route/plan.toml
```

Apply idempotently:

```bash
uv run python prove2me/tools/prove2me_submit.py apply \
  prove2me/submissions/p96-negative-route/plan.toml
```

The negative milestone does not replace the mission's single affirmative root.
If the superlinear family is proved, its construction should also be submitted
with `proof_type=disprove` against `Erdos9796Mission.combined`.
