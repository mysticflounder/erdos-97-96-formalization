# Exact-five profile 0034 NEW-mirror reduced singleton-deletion postrun

Date: 2026-09-05

Status: authenticated diagnostic complete; two candidate removals require
fresh sequential confirmation.

## Scope and custody

This campaign tested each one-group deletion from the authenticated GT8 and
LT9 reduced unguarded cells. It makes no theorem, source-realization,
source-completeness, minimality, simultaneous-removability, Lean-ingress,
promotion, or live-closure claim. Every terminal claim field is false.

- Run root:
  `scratch/runs/exactfive-profile0034-new-mirror-reduced-singleton-deletion-piqd-20260905/run-0001`
- Execution commit: `ac9a1f89b81782f1a596290a340ad10dc29c23aa`
- Wall time: `54.920s`
- Queries: 19 in 19 fresh Z3 sessions; total solve time `51,396 ms`
- Run-manifest SHA-256:
  `a019d04b982f95b50bc170d059f3266b5cb022072609a1b299debec9b4718e59`
- Launch SHA-256:
  `7b4cf3b5d8f11e9a02dd9921bf6baa85676e54246f5fc19f09b8eb75843928ed`
- Terminal SHA-256:
  `f901fb71afa12381287a16f647934e07dfa490455d6310a532cf8cea1b215b7b`
- Parent-custody SHA-256:
  `6f70dbf7d81353bfd815df50e43f3e048331aa365178bd8872c9c1f922899a9d`

Strict offline verification exited zero. Independent audit confirmed all ten
source pins, all nine input pins, all seventeen leave-one journal pins, and all
nineteen result self-hashes. The run contains 760 regular files and 23
directories, with no symlinks, hard links, or nonregular files. No session was
resumed, retried, reconciled, or reused; every solve index is one.

## Results

The positive control is `SAT_REPLAYED` and the negative control is
`UNSAT_CUSTODY_VALID`. Of the seventeen target cells:

- GT without `source-row-equality-01`: `UNSAT_CUSTODY_VALID`.
- LT without `source-row-equality-01`: `UNSAT_CUSTODY_VALID`.
- Every other deletion: `SAT_REPLAY_UNRESOLVED` because Z3 returned algebraic
  values unsupported by the exact-rational readback layer.

The shared candidate group is T0's `D(O,a)=D(O,p)`, where `O=(1,0)`,
`a=(1/2,-1/2)`, and `D=(delta-x)^2+3(delta-Y)^2`. Its removal drops
`(1-x_p)^2+3Y_p^2=1`.

Raw UNSAT marks a candidate removal only. These singleton outcomes do not
prove that several groups can be removed together, do not prove necessity for
any unresolved cell, and do not establish formula minimality.

## Fresh sequential targets

The next GT cell has seven retained groups:

```text
edge-index-00, edge-index-01, edge-index-03, edge-index-04,
source-row-equality-00, source-row-equality-03, source-row-equality-05
```

The next LT cell has eight retained groups:

```text
edge-index-00, edge-index-01, edge-index-03, edge-index-04,
edge-index-06, source-row-equality-02, source-row-equality-03,
source-row-equality-05
```

Run each as a newly generated exact cell in a fresh Z3 session with fresh
positive and negative controls. Repeated cvc5 attempts on the parent reduced
cells ended `UNKNOWN`, so this confirmation lane should not spend another
ninety seconds per target on cvc5. If both fresh cells remain authenticated
UNSAT, repeat leave-one deletion on GT7 and LT8 before assertion-level
minimization or an independent certificate lane.

## Completed-wave theorem mine

The bounded mine found no concrete general theorem candidate, so it did not
trigger another Lean-corpus search. The first missing antecedents remain the
fresh sequential confirmation, an independent exact UNSAT result, and a later
source-realization theorem. Radius/source-strict guards are absent from these
reduced unguarded cells.

For replay rules and the full deletion ledger, see the [singleton-deletion
specification](../specs/p97-exactfive-profile0034-new-mirror-reduced-singleton-deletion-piqd-v1.md),
the [producer](../../census/card_head/exactfive_profile0034_new_mirror_reduced_singleton_deletion_piqd.py),
and the [runner](../../scripts/run_exactfive_profile0034_new_mirror_reduced_singleton_deletion_piqd.py).
