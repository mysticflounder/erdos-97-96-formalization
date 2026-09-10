# Finite-nine N4 cap containment

This packet supplies `Erdos9796FiniteNine.cap_containment` (theorem ID
`2636c407-2850-4f3e-ac20-18e12aa740fa`). Given the accepted Form A v1, Form B v1, Form C v1,
Form B v2, and cyclic-form exclusions, it constructs the three N4d exclusion predicates and
applies the authenticated N4e cap-containment bridge.

Prove2Me accepted proof `2ab7afe0-25de-4ecb-b326-1bcb63a31b23` for this theorem. It was created
at `2026-09-10T06:49:05.81592+00:00` and accepted at `2026-09-10T06:51:33.432619+00:00`; the
platform theorem status is `Proved`.

The solution is generated from the authenticated 808-byte `cap_containment.lean` declaration
fragment and the authenticated Form-B split/N4e tail. It uses the accepted N4d Form-B branch
support record to discharge the two middle-tail helper obligations. The generated source retains
only the five helper declarations needed by the three form splits, the three classification
bridges, the N4d aliases and constructors, and the final N4e theorem.

Regenerate and validate from `prove2me/` with:

```bash
UV_CACHE_DIR=/tmp/prove2me-uv-cache uv run python submissions/finite-nine-child-cap-containment/generate.py --check
UV_CACHE_DIR=/tmp/prove2me-uv-cache uv run --with ruff ruff check submissions/finite-nine-child-cap-containment/generate.py
UV_CACHE_DIR=/tmp/prove2me-uv-cache uv run python tools/prove2me_submit.py validate submissions/finite-nine-child-cap-containment/plan.toml
```

The local axiom audit may include `sorryAx` through statement-only mirrors of accepted input
theorems. That offline dependency limitation is recorded in `validation.json`; the generated
solution has no proof placeholder or compiler-trust token.
