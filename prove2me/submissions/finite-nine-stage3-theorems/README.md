# Finite-nine Stage-3 public theorem nodes

This packet creates the nine public theorem statements needed to transfer the existing
finite-nine Lean proof into Prove2Me without inviting contributors to solve those
branches again. It contains statement stubs, mission milestones, and dependency
metadata only. It contains no proof entries or solution submissions.

All nine theorem files import the published terminal definition bundle
`Definitions.Def_Erdos9796FiniteNine_N8Interface`. That module reaches the other three
published finite-nine definition bundles. Each theorem file is explicitly labelled
`SKETCH — NOT PROMOTABLE`; its `sorry` is the platform theorem-creation placeholder,
not a claim that the source mathematics remains open.

## Fixed transfer order

The leaf-first order comes directly from the authenticated first-wave `cuts.json`:

1. `shell`;
2. `form_b_v1`, after `shell`;
3. `form_b_v2`, after `form_b_v1`;
4. `form_a_v1`, after `form_b_v2`;
5. `form_c_v1`, after `shell`;
6. `cyclic_forms`, after `form_a_v1`, `form_b_v1`, and `form_c_v1`;
7. `cap_containment`, after all five listed form predecessors;
8. `circle_placement`, after `cap_containment`;
9. `single_apex_exhaustion`, after `circle_placement`.

`dag.json` records these edges in machine-readable form. The same order and predecessor
sets appear in the mission milestone descriptions and reasons in `plan.toml`. The
platform theorem statements intentionally import only definitions; the later proof
solutions will import predecessor theorem nodes as required by this DAG.

## Validation

From `prove2me/`, validate the generic uploader packet without network access:

```bash
uv run python tools/prove2me_submit.py validate \
  submissions/finite-nine-stage3-theorems/plan.toml
```

The statement files were also elaborated under Lean 4.33.1 against freshly compiled
copies of the exact four published definition-module sources. `validation.json`
records the toolchain, plan digest, statement hashes, label/import checks, and DAG
comparison result.

## Publication boundary

Running `validate` performs no server mutation. Applying this plan would create public
theorem nodes and mission milestones, so it requires a separate reviewed publication
step. Even after node creation, no finite-nine child theorem is proved on Prove2Me
until its no-`sorry` proof solution is transferred, accepted, and independently
verified. The final mission theorem remains a later root-assembly step.
