# Finite-nine N4e core support

This packet publishes the N4d branch packet types and a first proof-bearing N4e support node. The
support record makes each later dependency an explicit field, because declarations local to a
Prove2Me solution are unavailable to later submissions.

The public definition is live as `Erdos9796FiniteNine_N4dPackets` with ID
`20e77876-f67d-4a4a-bb0e-7613b5d63ace`. The theorem `Erdos9796FiniteNine.n4e_core` has ID
`8092e252-3da6-454a-813c-702397a844f8`; proof submission
`1a2e8096-87cf-4595-b748-0c0ada857b8a` was accepted by Prove2Me.

The generated solution contains the authenticated preamble and units 1–46 from the preserved
finite-nine proof, followed only by the N4e source needed through the base-transport theorem. At
259,042 bytes it is less than half the 694,176-byte Form `b` monolith that exceeded the server's
300-second verification window.

Regenerate and check the packet with:

```bash
uv run python submissions/finite-nine-n4e-core-support/generate.py
uv run python submissions/finite-nine-n4e-core-support/generate.py --check
uv run --with ruff ruff check submissions/finite-nine-n4e-core-support/generate.py
uv run python tools/prove2me_submit.py validate submissions/finite-nine-n4e-core-support/plan.toml
```
