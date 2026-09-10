# Finite-nine cyclic forms

This packet supplies the proof of `Erdos9796FiniteNine.cyclic_forms`
(`0ecda05b-fa42-4a3f-9e58-f77d7226bc26`). It retains both authenticated cyclic shifts and
their transport lemmas, then applies the accepted public Form A v1, Form B v1, Form B v2,
and Form C v1 theorem modules.

The source fragment is `submissions/finite-nine-modular/source-fragments/cyclic_forms.lean`,
12,271 bytes, SHA-256
`246d74d5159947ad68c26e2725fa6af7e62b9226a28968a0f5319d3f1087e32c`. The current source module
`lean/Erdos9796Proof/P97/N4d/CyclicTransport.lean` is pinned at SHA-256
`edbf1d9caed20389ae0b93b9f13ea65433b6ae9230b7a85a53e45b1f408e794c`.

The generated solution is 13,319 bytes with SHA-256
`1812e901b588f216b46874002c8d9921c2ca6f1d4c8bcdf359b4ddecf1cbb3d5`. The solution build passed
with 8,725 jobs; its log is
`/Users/adam/prove2me_workspace/.lake/lake-build-logs/80484-1789020063493488000.log`. The Audit
build passed with 8,726 jobs; its log is
`/Users/adam/prove2me_workspace/.lake/lake-build-logs/90916-1789020129563098000.log`.

Prove2Me accepted proof submission `ea892517-aefe-4776-9a28-ebcfd62d5252` for theorem
`0ecda05b-fa42-4a3f-9e58-f77d7226bc26`. It was created at
`2026-09-10T06:11:19.419853+00:00` and accepted at `2026-09-10T06:12:53.232103+00:00`.

Regenerate and check from `prove2me/` with:

```bash
UV_CACHE_DIR=/tmp/prove2me-uv-cache uv run python submissions/finite-nine-child-cyclic-forms/generate.py
UV_CACHE_DIR=/tmp/prove2me-uv-cache uv run python submissions/finite-nine-child-cyclic-forms/generate.py --check
UV_CACHE_DIR=/tmp/prove2me-uv-cache uv run --with ruff ruff check submissions/finite-nine-child-cyclic-forms/generate.py
```

The offline axiom audit may report `sorryAx` through statement-only mirrors of the accepted
dependency theorem nodes. That local mirror boundary is recorded in `validation.json` and does
not occur in the generated solution source.
