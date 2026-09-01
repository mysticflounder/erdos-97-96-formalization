# Rigid221 S0 faithful `B=A` CEGAR wave 1

**Status:** `SCOPED_CANDIDATES_UNSAT_FIXED_BA_CEGAR_WAVE`

**Scope:** relaxed incidence/order metric models on one retained S0-N exact-18 label/alias/order cell; discovery only

## Fixed source cell

The authenticated named union contains all `18` carrier roles. `physical_Q={u,xu,v,xv}` is a nonexact selected four-subset of the physical five-class. `Ku`, `Kv`, `Kdelta`, and `F1` retain complete off-row exclusions. The other thirteen rows are nonexact selections supplied only by the modeled global-K4 interface.

The authenticated fifth `delta` incidence at `O` is emitted separately; no other off-row exclusion is imposed at `O`.

Canonical Moser aliases and the retained counterclockwise cyclic order are frozen independently in the certificate.

The common similarity gauge sends `O` to `(0,0)` and its selected witness `u` to `(1,0)`. All row equalities, positive radii, ambient distinctness, and all edge/nonincident strict orientations are emitted directly.

These are relaxed formulas: they do not retain the source coordinates, MEC, cap data, `J1`/`J2` or endpoint geometry, or exact physical-`O` off-row constraints. They encode only the gauge, selected-row equations, the authenticated `O`-`delta` equality, named exact-row exclusions, distinctness, and fixed-order strict convexity.

## Bounded wave

Candidate cap: `3`; per-candidate timeout: `10000 ms`; checked candidates: `3`; exact-signature blocks: `3`.

| Candidate | Signature SHA | Formula status | Disposition |
|---:|---|---|---|
| 1 | `e96de6c35c0b1c8b` | `UNSAT` | `FORMULA_UNSAT_EXACT_SIGNATURE_BLOCKED` |
| 2 | `d35eceb436780093` | `UNSAT` | `FORMULA_UNSAT_EXACT_SIGNATURE_BLOCKED` |
| 3 | `90b0febd7629b7ac` | `UNSAT` | `FORMULA_UNSAT_EXACT_SIGNATURE_BLOCKED` |

A formula-UNSAT result blocks only the complete support signature shown in its receipt. It is an enumeration-control record, not a source-preserving semantic refinement. UNKNOWN adds no block. A SAT label is exact only after every emitted assertion replays over rational coordinates.

## Claim boundary

This wave does not claim exhaustive candidate coverage, bounded UNSAT, a typed `FaithfulCarrierPattern`, `CounterexampleData`, `CriticalShellSystem`, a Lean theorem, or a universal result. The first unmodeled interface is an authenticated exhaustive support/order cell census with checked terminal evidence.

## Governance revisions

The run manifest keeps base head `f26de746bc16d15d891c42ad8cfb42876a63ab06` as the historical original lane base required by governance. The current input checkpoint for this audit rerun is `aeee9534c5bf00212459a743db1333a34ee30b3d`.

## Wave-data generalization checkpoint

No stable general pattern is asserted from this capped first wave; each metric-UNSAT record remains an exact-signature enumeration block.
