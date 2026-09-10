# Finite-nine Form `c` at `v₁`

This packet prepares the proof of `Erdos9796FiniteNine.form_c_v1`, theorem ID
`0a9dd51c-149f-46d7-950a-fb2454f0c58f`. The generated source transfers the authenticated theorem
`Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v1_proof` to the public statement.

The generator binds the 306,175-byte Form `c` fragment, its six current source modules, the shared
authenticated preamble and shell prefix, the N4e dependency slice, and 20 named support
declarations. It subtracts the published shell declarations and applies the 21 evidenced Lean
4.33.1 repairs. The resulting source is 815,939 bytes, below Prove2Me's one-MiB source limit.

From `prove2me/`, reproduce the generated artifact and uploader checks with:

```bash
uv run python submissions/finite-nine-child-form-c-v1/generate.py --check
uv run python tools/prove2me_submit.py validate \
  submissions/finite-nine-child-form-c-v1/plan.toml
```

The source is larger than the 694,176-byte Form `b` payload that twice exceeded Prove2Me's
300-second verification window, so server runtime is a material risk. The solution and audit both
build under Lean 4.33.1, but the local axiom probe includes `sorryAx` from the accepted theorem
nodes' statement-only mirrors. We therefore withheld the monolithic server submission. The next
submission route is to publish smaller authenticated support nodes and leave a short final proof.
