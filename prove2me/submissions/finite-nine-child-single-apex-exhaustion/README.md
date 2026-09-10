# Finite-nine single-apex exhaustion

This packet supplies `Erdos9796FiniteNine.single_apex_exhaustion` (theorem ID
`b5c8965d-f45d-4911-a606-655ddfa6899d`). It transfers the authenticated N8
single-apex case analysis to the public finite-nine interface and consumes the accepted
circle-placement dependency.

Prove2Me accepted proof `d578752d-d17e-46cf-b111-ae3d7aec65a2` for this theorem. It
was created at `2026-09-10T07:45:36.488255+00:00` and accepted at
`2026-09-10T07:50:22.552727+00:00`; the platform theorem status is `Proved`.

The generated solution imports the public N8 interface and
`Theorems.Thm_Erdos9796FiniteNine_circle_placement`; it imports no solution module.
The generator authenticates the complete 176,077-byte source fragment, retains its
support declarations and declaration-scoped heartbeat settings, and rewrites every
private `S.n7_circle_placement hN4e` use to the public theorem.

Regenerate and validate from `prove2me/` with:

```bash
UV_CACHE_DIR=/tmp/prove2me-uv-cache uv run python submissions/finite-nine-child-single-apex-exhaustion/generate.py --check
UV_CACHE_DIR=/tmp/prove2me-uv-cache uv run --with ruff ruff check submissions/finite-nine-child-single-apex-exhaustion/generate.py
UV_CACHE_DIR=/tmp/prove2me-uv-cache uv run python tools/prove2me_submit.py validate submissions/finite-nine-child-single-apex-exhaustion/plan.toml
```

The offline axiom audit is recorded separately from the generated source scan. The
local public theorem files used by the accepted dependency and shared support frontier
are statement-only mirrors, so inherited `sorryAx` does not describe a placeholder in
the generated proof source.
