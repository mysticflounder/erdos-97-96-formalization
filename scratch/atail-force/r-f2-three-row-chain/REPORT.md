# Source-faithful F2 three-row chain

## Purpose

This scratch lane packages the exact object exposed by the F2 live-heavy
placement audit and the direct U5-bank role audit. It does not introduce a
new finite shadow, replace the retained critical system, or claim a
contradiction.

The three rows are:

1. `C.B₁`, the q-deleted row centered at the retained live center `p`, whose
   support is exactly `{q,t1,t2,t3}`;
2. `C.B₂`, the q-deleted row centered at `S.oppApex2`; and
3. `deletedCriticalSupport C`, the selected critical shell at the actual
   deleted source, centered at `W.H.centerAt deleted C.q_mem_A`.

The extracted chain records:

```text
card (C.B₂ ∩ live) = 2
card (C.B₂ ∩ deletedCriticalSupport C) = 2
card (live ∩ deletedCriticalSupport C) ≤ 1
card (C.B₂ ∩ live ∩ deletedCriticalSupport C) = 0
```

The two middle/live points are live-only points in `strictSecondCap S`, and
the live center `p` is itself in that strict cap. The packet also retains
`q ∈ S.surplusCap`, so those two live witnesses are provably among
`{t1,t2,t3}`, and it retains the global-K4 selected-row producer at every
strict middle-row point. The three row centers are pairwise distinct.

## Theorem-bank preflight

Before packaging the object, the active lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- current `U5GlobalIncidenceSupport.lean` and
  `U5GlobalIncidenceKernels.lean`; and
- focused `nthdegree docs search --lean` queries for the three-row `2-2`
  chain and the apparent two-q-critical-center matches.

The direct two-q-critical mapping is already ruled out in
`r-f2-u5-bank-match`: after deleting one strict live witness, the two
q-critical supports have exactly one surviving common point, and the
dangerous-center/triple-center roles required by the named current U5
incompatibilities are absent.

## Lean interface

`F2ThreeRowChain.lean` defines:

- `SourceFaithfulF2ThreeRowChain`, the exact finite/incidence/cap packet;
- `sourceFaithfulF2ThreeRowChain`, its extraction from the actual F2
  live-heavy branch; and
- `NamedF2TwoTwoWitnesses`, which names the two live-only strict points and
  the two support-only points with all cross-cell inequalities explicit and
  identifies the live-only pair as actual dangerous-triple points; and
- `strictPoint_qDeleted_or_qCritical`, which applies global K4 at any actual
  strict middle-row point and returns the exact original-deletion split:
  either a four-point q-deleted row at that center or a three-point
  q-critical row.

The last theorem deliberately records no additional generated-row incidence.
It is a producer boundary for the role-deficit audit, not a contradiction.

This is intended to be the input object for theorem-bank role-deficit
matching. Any subsequent mining or adapter must preserve these row centers,
source identities, and class types.

## Status

The deliberate current-toolchain check used the repository-pinned Lean
`4.27.0` and exited `0`:

```text
lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-three-row-chain-oleans/F2ThreeRowChain.olean \
  ../scratch/atail-force/r-f2-three-row-chain/F2ThreeRowChain.lean
```

All three printed declarations depend only on:

```text
propext, Classical.choice, Quot.sound
```

Neither depends on `sorryAx`. No full `lake-build` was run.

No production file, closure document, protected file, or proof-blueprint
state was changed.
