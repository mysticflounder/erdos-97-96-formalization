<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Pinned Surplus Relaxed Split Certificates

This report indexes Singular lifted-column Nullstellensatz witnesses
for the unit leaves of the relaxed split probe.  Each certificate JSON
stores variables, generators, coefficients, generator metadata, and
the split path for one unit leaf.

## Policy

- exact centers: `['v', 'w']`
- certificate directory: `certificates/surplus/relaxed_split`
- timeout seconds: 180
- Python exact polynomial check: False
- minimize optional equations: False

## Summary

- leaf jobs: 11
- status counts: `{'ok': 11}`
- generator count distribution: `{'31': 11}`
- nonzero count distribution: `{'14': 1, '18': 1, '19': 1, '21': 3, '23': 1, '26': 2, '27': 1, '28': 1}`
- timeout certificate ids: `[]`
- minimize dropped count distribution: `{'0': 11}`
- center usage rows: `{'u': 11, 'v': 11, 'w': 10, 's1': 9, 's2': 10, 's3': 10, 'Pw': 10, 'Pu': 10, 'Q1': 10, 'Q2': 11}`

## Certificates

| certificate | status | generators | nonzero | centers | path |
|---|---:|---:|---:|---|---|
| `R003:u=v:R003YY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R003_ueqv_R003YY.json` |
| `R003:u=v:R003YN` | `ok` | 31 | 21 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R003_ueqv_R003YN.json` |
| `R004:u=v:R004NYY` | `ok` | 31 | 14 | `u`, `v`, `w`, `s1`, `s3`, `Pw`, `Q2` | `certificates/surplus/relaxed_split/R004_ueqv_R004NYY.json` |
| `R004:u=v:R004NYN` | `ok` | 31 | 18 | `u`, `v`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R004_ueqv_R004NYN.json` |
| `R009:u=v:R009NYYYY` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009NYYYY.json` |
| `R009:u=v:R009NYYYNY` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009NYYYNY.json` |
| `R009:u=v:R009NYYYNN` | `ok` | 31 | 21 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009NYYYNN.json` |
| `R009:u=v:R009NYNYY` | `ok` | 31 | 23 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009NYNYY.json` |
| `R009:u=v:R009NYNYN` | `ok` | 31 | 27 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009NYNYN.json` |
| `R009:u=v:R009NYNNY` | `ok` | 31 | 21 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009NYNNY.json` |
| `R009:u=v:R009NYNNN` | `ok` | 31 | 19 | `u`, `v`, `w`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009NYNNN.json` |
