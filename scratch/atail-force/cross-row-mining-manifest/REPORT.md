# Cross-row mining route audit

Date: 2026-07-17

The executable specification and full route decision are in
[`MANIFEST.md`](MANIFEST.md), with machine-readable pins in `manifest.json`.

## Verdict

- **Rejected:** mining the anonymous `O/A/X` three-row equality packet.  Its
  Kalmanson consumer does not use the two-source blocker collision.
- **Accepted object:** an existential source-indexed coverage theorem ranging
  over every nontrivial fiber of the retained `CriticalShellSystem`.  It must
  use `C,K -> A` and both source-critical facts to force either the
  `J -> X`, `K ∈ X-shell`, `O<A<X<J<C<K` cross-row core or a second
  robust/critical same-cap center bisecting the collision pair `C,K` itself.
- **Immediate consumers:** the checked six-role Kalmanson terminal and
  production `outsidePair_unique_capCenter`.

The pinned read-only replay finds the corrected cross-row terminal in 75 of
the stored 101 witnesses (the literal `C,K -> A; J -> X` instance in 28), no
source-faithful same-cap alternative, and 26 witnesses with neither terminal.
Thus the old 101-witness ordinal result and zero-node fourteen-role
continuation do not prove this producer.  They remain exact only in their
fixed `(8,4,5)` abstraction.

## Validation

`jq empty manifest.json` passes.  Running `audit_existing.py` through `uv`
reproduces every pinned hash and count recorded in the manifest.  No solver,
broad miner, production Lean build, production source, closure document,
proof-blueprint state, or protected scratch lane was changed.
