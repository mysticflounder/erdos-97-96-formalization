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
- timeout seconds: 300
- Python exact polynomial check: False
- minimize optional equations: False

## Summary

- leaf jobs: 1
- status counts: `{'ok': 1}`
- generator count distribution: `{'25': 1}`
- nonzero count distribution: `{'24': 1}`
- timeout certificate ids: `[]`
- minimize dropped count distribution: `{'0': 1}`
- center usage rows: `{'u': 1, 'v': 1, 'w': 1, 's3': 1, 'Pw': 1, 'Pu': 1, 'Q1': 1, 'Q2': 1}`

## Certificates

| certificate | status | generators | nonzero | centers | path |
|---|---:|---:|---:|---|---|
| `R011:u=v:R011NNN` | `ok` | 25 | 24 | `u`, `v`, `w`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R011_ueqv_R011NNN.json` |
