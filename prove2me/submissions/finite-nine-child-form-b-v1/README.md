# Finite-nine Form `b` at `v₁`

This packet prepares the proof of `Erdos9796FiniteNine.form_b_v1`, the first unresolved child
after the accepted endpoint-shell theorem. The generated solution is a direct public-boundary
rewrite of the authenticated repository proof
`Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v1_proof`.

The generator authenticates the preserved 555,787-byte modular fragment and the full 87-unit
submission stream, then binds all 18 current Form `b` source modules. It retains the complete
51,853-byte preamble and 76,512-byte authenticated prefix (units 1–46), applies the exact Lean
4.33.1 repairs affecting the prefix and Form `b` fragment, removes declarations already published
in the finite-nine bundles, and emits a top-level `theorem solution`. The result is 694,176 bytes,
below Prove2Me's one-MiB source limit.

From `prove2me/`, reproduce the solution and static uploader checks with:

```bash
uv run python submissions/finite-nine-child-form-b-v1/generate.py --check
uv run python tools/prove2me_submit.py validate \
  submissions/finite-nine-child-form-b-v1/plan.toml
```

`platform/Audit.lean` is the local type and axiom probe. Both the solution and audit elaborate under
Lean 4.33.1. The local axiom report includes `sorryAx` because the accepted Prove2Me theorem nodes
are represented offline by statement-only `by sorry` mirrors. The generated solution contains no
forbidden proof or trust tokens, but this local build does not establish a core-clean dependency
closure. Server verification remains the certification gate; `validation.json` records the exact
build evidence and outstanding review status.

Two server attempts, `e79c8662-4da5-4028-a16a-ae1139352bd1` and
`c48a71c4-7c62-4cd8-8fb6-0e12fad9dada`, each ended with
`Verification timed out after 300s`. The server did not return a Lean diagnostic rejecting the
proof. The monolithic packet is therefore too expensive for the current verification window; the
next submission route is to publish reusable support nodes and reduce the final child proof.
