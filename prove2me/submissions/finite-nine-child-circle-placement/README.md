# Finite-nine common-radius circle placement

This packet supplies `Erdos9796FiniteNine.circle_placement` (theorem ID
`0e9040fa-76aa-44d0-9f4a-f78e0f838e21`). Given the public N4 cap-containment
predicate, it transfers the authenticated N6 equilateral-triangle and N7 common-radius
argument to the public finite-nine interface.

Prove2Me accepted proof `dabbf8f4-1dad-4e7d-93ac-a4861ec89239` for this theorem. It was
created at `2026-09-10T07:08:34.795679+00:00` and accepted at
`2026-09-10T07:09:55.587793+00:00`; the platform theorem status is `Proved`.

The generated solution imports only `Definitions.Def_Erdos9796FiniteNine_N8Interface`.
It retains the authenticated exact-cap and equilateral support lemmas from the
7,289-byte source fragment, omits the duplicate interface definition already supplied by
the public definition module, and closes the target by applying `hN4e`.

Regenerate and validate from `prove2me/` with:

```bash
UV_CACHE_DIR=/tmp/prove2me-uv-cache uv run python submissions/finite-nine-child-circle-placement/generate.py --check
UV_CACHE_DIR=/tmp/prove2me-uv-cache uv run --with ruff ruff check submissions/finite-nine-child-circle-placement/generate.py
UV_CACHE_DIR=/tmp/prove2me-uv-cache uv run python tools/prove2me_submit.py validate submissions/finite-nine-child-circle-placement/plan.toml
```

The local axiom audit for the exported solution is source-clean with
`[propext, Classical.choice, Quot.sound]`. The public statement mirror remains
statement-only and emits its expected warning during the audit build; it is not in the
exported solution's axiom closure.
