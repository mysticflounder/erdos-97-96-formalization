# RVOL general-structure probe — Wave 2 audited report

**Date:** 2026-09-01

**Upstream report:** `/tmp/wave2-report.md`, SHA-256
`58c6d0b2aa07f7657c2e7195757cda5a44922d1299bf4d3ca336f2dcb86e4596`

**Status:** the uniform cyclic Kalmanson theorem has been independently audited
and selected for Lean formalization. The sampled-run statistics remain
provisional because their producer, certificates, verifier output, positive
control, and governed run manifest are not present in this repository.

## Semantic scope

Wave 2 studies abstract all-row systems with a cyclic boundary order,
shared-pair alternation, row-forced distance equalities, and strict Kalmanson
inequalities. It does not construct `CounterexampleData`, a
`CriticalShellSystem`, coordinates, MEC/cap data, or exhaustive Card18
coverage.

The source-backed order interfaces identified by the audit are:

- `SurplusCOMPGBank.btw_sep`;
- `SharedPairSeparationCore.satisfiedBy_of_realizes_ccw`;
- `GeneralCarrierBridge.BoundaryIndexing.sharedPair_satisfied`; and
- `selectedFourClass_shared_pair_separated`.

These support the shared-pair condition but do not authenticate the reported
finite mutation run.

## Provisional finite-run report

The upstream report states that a deterministic sampler retained 1,564
order-consistent abstract row systems and rejected all of them with one- or
two-inequality exact Kalmanson certificates:

| n | Models | Reported zero vector | Reported opposite pair |
|---:|---:|---:|---:|
| 9 | 1 | 1 | 0 |
| 10 | 1 | 0 | 1 |
| 11 | 1 | 0 | 1 |
| 12 | 1 | 0 | 1 |
| 13 | 100 | 72 | 28 |
| 14 | 100 | 53 | 47 |
| 16 | 100 | 28 | 72 |
| 18 | 1,000 | 280 | 720 |
| 20 | 200 | 30 | 170 |
| 24 | 50 | 2 | 48 |
| 32 | 10 | 0 | 10 |
| **Total** | **1,564** | **466** | **1,098** |

The report also states that 86 retained examples and a rational six-point
positive control were independently replayed. No corresponding governed Wave-2
lane, run manifest, certificate bundle, producer output, or verifier output is
available in the repository. Consequently these counts and replay claims are
recorded as unauthenticated observations, not proof-carrying evidence.

The existing Wave-1 lane cannot supply this custody: it records only 16 generic
A-row candidates with 16 `PARTIAL_SURVIVOR_CAP` outcomes and explicitly lacks
the Wave-2 metric/order bridge.

## Kernel-targeted uniform obstruction

Let `9 ≤ n`, let the cyclic labels be `ZMod n`, and put

```text
U(c) = {c+1, c+2, c+4, c+8}.
```

For the five boundary indices

```text
0 < 1 < 2 < 3 < n-1,
```

the three rows supply

```text
1,2 ∈ U(0)
2,3 ∈ U(1)
1,3 ∈ U(n-1).
```

Any Euclidean boundary realization in which points in a common row have equal
distance from its center therefore gives

```text
d(0,1) = d(0,2)
d(1,2) = d(1,3)
d(n-1,1) = d(n-1,3).
```

These equalities contradict strict convex cyclic order. The existing theorem

```text
CapCrossingKalmansonBridge.
  false_of_five_ccw_three_shell_equalities_012_123_413
```

proves exactly this five-role schema. It is sorry-free and its axiom closure is
the three standard core axioms.

The upstream report states the uniform threshold as `n ≥ 10` and handles
`n = 9` separately. The same five-role proof works at `n = 9`; all six row
memberships and the strict index order remain valid. Thus the corrected uniform
threshold is `n ≥ 9`, matching the incidence formalization.

## Evidence boundary

Established before this checkpoint:

1. the five-role mathematical argument and inequality orientations have been
   independently checked;
2. the matching generic Kalmanson theorem already compiles without `sorry`; and
3. the cyclic incidence family itself is kernel checked for every `9 ≤ n`.

Formalization checkpoint:

1. `Cyclic1248KalmansonObstruction.RealizesRows` records the exact
   row-to-equal-distance boundary contract;
2. `Cyclic1248KalmansonObstruction.false_of_realizesRows` proves that contract
   impossible on a strictly convex CCW boundary for every `9 ≤ n` by applying
   the existing five-role schema;
3. the targeted build passes without `sorry` or `native_decide`; and
4. `#print axioms` reports only `propext`, `Classical.choice`, and `Quot.sound`.

Still provisional:

1. the 1,564-model histogram and rolling hashes;
2. the claimed 86 retained certificate replays;
3. the rational positive-control replay;
4. the Wave-1 shared-pair rescan; and
5. all runtime and mutation-stream observations.

To promote those claims, import the producer, exact inputs and certificates,
positive control, verifier output, and a governed run manifest under a declared
Wave-2 lane. Do not use the provisional sample as an exhaustive nonexistence
claim.

## Next computation

After the cyclic adapter is kernel checked, the recommended computational step
is a governed cut-in-the-loop Wave 2b: enforce shared-pair alternation eagerly,
add zero/opposite Kalmanson cuts lazily, and exhaust a declared cell before
promoting any coverage statement. Larger LP, determinant, EDM, or coordinate
screens should be reserved for atomic-cut survivors.
