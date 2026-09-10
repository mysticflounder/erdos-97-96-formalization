# Finite-nine Form C at v1: split proof packet

This packet supplies an accepted smaller proof for the existing Prove2Me theorem
`Erdos9796FiniteNine.form_c_v1` (`0a9dd51c-149f-46d7-950a-fb2454f0c58f`). It imports the
accepted N4e core record and retains only the authenticated Form C residue and the six final Form C
source units.

The generated solution is 464,631 bytes. It removes the 364,106-byte raw N4e dependency frontier
from the 815,939-byte parent packet. Available selector, cardinality, signed-area, and base-transport
facts are consumed through the accepted `N4eCoreSupport` record. Shell-free coordinate identities
use private thin wrappers around the public geometry theorem. The Form B branch record is not
imported because the Form C source uses none of its fields.

The solution elaborates under Lean 4.33.1. Its local axiom report includes `sorryAx` because the
accepted Prove2Me dependency is represented in the offline workspace by a statement-only mirror.
The generated proof source itself contains no proof placeholder or compiler-trust escape.

Prove2Me accepted proof submission `da2c2503-a9f6-4569-beb8-72bc09713eef` for theorem
`Erdos9796FiniteNine.form_c_v1` on 2026-09-10. This platform result is recorded separately from the
offline statement-mirror caveat.

Regenerate and validate with:

```bash
uv run python submissions/finite-nine-child-form-c-v1-split/generate.py --check
uv run --with ruff ruff check submissions/finite-nine-child-form-c-v1-split/generate.py
uv run python tools/prove2me_submit.py validate submissions/finite-nine-child-form-c-v1-split/plan.toml
```
