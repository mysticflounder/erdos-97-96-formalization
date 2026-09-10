# Finite-nine Form A at v1

This packet supplies the accepted proof of the existing Prove2Me theorem
`Erdos9796FiniteNine.form_a_v1` (`34a0a695-2a9d-47f4-b9c6-c3b38c82705d`). It imports the accepted
N4e core-support theorem and the accepted Form-B-at-v2 exclusion, then retains the authenticated
source needed for the Form `a` endpoint-pair argument.

Prove2Me accepted proof submission `c8238e1b-ad33-43cc-8566-185a03a405e6`, created
`2026-09-10T05:30:23.712256+00:00` and accepted `2026-09-10T05:37:09.807499+00:00`.

The generated solution is 265,766 bytes. It uses the repaired 32,828-byte shared prerequisite
prefix, authenticated source units 047–049, and the authenticated Form A units 053–054. The
unused Track-B support unit 050 and already-public declarations are omitted.

The generated source contains no proof placeholder, named axiom, native/compiler trust primitive,
unsafe or partial declaration, or external implementation. The offline axiom report is expected to
include `sorryAx` because offline dependency theorem mirrors/stubs contain proof placeholders; that
local boundary is recorded separately from platform acceptance.

Regenerate and validate from `prove2me/` with:

```bash
uv run python submissions/finite-nine-child-form-a-v1/generate.py --check
uv run --with ruff ruff check submissions/finite-nine-child-form-a-v1/generate.py
uv run python tools/prove2me_submit.py validate submissions/finite-nine-child-form-a-v1/plan.toml
```
