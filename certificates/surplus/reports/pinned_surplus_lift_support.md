<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Pinned Surplus Lift Support Census

This report records which generators have nonzero coefficients in a
Singular lifted-column certificate for each selected pinned surplus
COMP-G row. It is a support census for the emitted certificate, not a
minimal-core certificate.

The exact-mask-safe centers for the current ten-label bridge are `v` and
`w`. Any support at another center is recorded as nonuniform support.

## Summary

- rows: 135
- status counts: `{'ok': 134, 'timeout': 1}`
- kind counts: `{'base_empty': 2, 'forced_collapse': 133}`
- forced-pair counts: `{'None': 2, 'u=s1': 6, 'u=v': 127}`
- nonzero-count distribution: `{'11': 1, '13': 2, '14': 3, '15': 3, '16': 7, '17': 8, '18': 6, '19': 4, '20': 12, '21': 3, '22': 4, '23': 8, '24': 5, '25': 8, '26': 10, '27': 14, '28': 14, '29': 12, '30': 5, '31': 5}`
- rows using nonuniform centers: 134
- timeout rows: `['s1_030']`

## Center Usage

- `u`: 103 rows
- `v`: 133 rows
- `w`: 134 rows
- `s1`: 111 rows
- `s2`: 119 rows
- `s3`: 111 rows
- `Pw`: 124 rows
- `Pu`: 129 rows
- `Q1`: 129 rows
- `Q2`: 131 rows

## Per-Row Support

| pid | kind | forced pair | nonzero generators | centers | nonuniform centers |
|---|---:|---:|---:|---|---|
| `s1_000` | `base_empty` | `None` | 17/30 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_001` | `base_empty` | `None` | 16/30 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_002` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_003` | `forced_collapse` | `u=v` | 23/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_004` | `forced_collapse` | `u=v` | 16/31 | `v`, `w`, `s1`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_005` | `forced_collapse` | `u=v` | 30/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_006` | `forced_collapse` | `u=v` | 25/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_007` | `forced_collapse` | `u=v` | 16/31 | `u`, `v`, `w`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_008` | `forced_collapse` | `u=v` | 26/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_009` | `forced_collapse` | `u=v` | 26/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_010` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_011` | `forced_collapse` | `u=v` | 17/31 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_012` | `forced_collapse` | `u=v` | 16/31 | `v`, `w`, `s1`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_013` | `forced_collapse` | `u=v` | 11/31 | `v`, `w`, `Pw`, `Pu`, `Q1`, `Q2` | `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_014` | `forced_collapse` | `u=v` | 25/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_015` | `forced_collapse` | `u=v` | 20/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_016` | `forced_collapse` | `u=v` | 29/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_017` | `forced_collapse` | `u=v` | 23/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_018` | `forced_collapse` | `u=v` | 29/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_019` | `forced_collapse` | `u=v` | 20/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_020` | `forced_collapse` | `u=v` | 18/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_021` | `forced_collapse` | `u=v` | 13/31 | `v`, `w`, `s1`, `Q1`, `Q2` | `s1`, `Q1`, `Q2` |
| `s1_022` | `forced_collapse` | `u=v` | 29/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_023` | `forced_collapse` | `u=v` | 24/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_024` | `forced_collapse` | `u=v` | 20/31 | `u`, `v`, `w`, `s1`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_025` | `forced_collapse` | `u=v` | 29/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_026` | `forced_collapse` | `u=v` | 30/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_027` | `forced_collapse` | `u=v` | 31/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_028` | `forced_collapse` | `u=v` | 22/31 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_029` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_030` | `forced_collapse` | `u=v` | timeout/31 | - | - |
| `s1_031` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_032` | `forced_collapse` | `u=v` | 30/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_033` | `forced_collapse` | `u=v` | 18/31 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_034` | `forced_collapse` | `u=v` | 18/31 | `v`, `w`, `s1`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_035` | `forced_collapse` | `u=v` | 29/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_036` | `forced_collapse` | `u=v` | 25/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_037` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_038` | `forced_collapse` | `u=v` | 16/31 | `v`, `w`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_039` | `forced_collapse` | `u=v` | 16/31 | `v`, `w`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s1_040` | `forced_collapse` | `u=v` | 17/31 | `u`, `v`, `w`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_000` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_001` | `forced_collapse` | `u=v` | 23/31 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_002` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_003` | `forced_collapse` | `u=v` | 26/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_004` | `forced_collapse` | `u=v` | 21/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` |
| `s2_005` | `forced_collapse` | `u=v` | 29/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_006` | `forced_collapse` | `u=v` | 18/31 | `u`, `v`, `w`, `s1`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `Pu`, `Q1`, `Q2` |
| `s2_007` | `forced_collapse` | `u=v` | 20/31 | `u`, `v`, `w`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `u`, `s2`, `s3`, `Pu`, `Q1`, `Q2` |
| `s2_008` | `forced_collapse` | `u=v` | 19/31 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_009` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_010` | `forced_collapse` | `u=v` | 21/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_011` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_012` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_013` | `forced_collapse` | `u=v` | 25/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_014` | `forced_collapse` | `u=v` | 29/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_015` | `forced_collapse` | `u=v` | 17/31 | `u`, `v`, `w`, `s1`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_016` | `forced_collapse` | `u=v` | 29/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_017` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_018` | `forced_collapse` | `u=v` | 19/31 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_019` | `forced_collapse` | `u=v` | 23/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_020` | `forced_collapse` | `u=v` | 30/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_021` | `forced_collapse` | `u=v` | 17/31 | `v`, `w`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `s2`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_022` | `forced_collapse` | `u=v` | 20/31 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_023` | `forced_collapse` | `u=v` | 14/31 | `v`, `w`, `s2`, `Pw`, `Pu`, `Q2` | `s2`, `Pw`, `Pu`, `Q2` |
| `s2_024` | `forced_collapse` | `u=v` | 20/31 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_025` | `forced_collapse` | `u=v` | 20/31 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_026` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_027` | `forced_collapse` | `u=v` | 18/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q2` |
| `s2_028` | `forced_collapse` | `u=v` | 24/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_029` | `forced_collapse` | `u=v` | 15/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu` | `s1`, `s2`, `s3`, `Pw`, `Pu` |
| `s2_030` | `forced_collapse` | `u=s1` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_031` | `forced_collapse` | `u=v` | 13/31 | `v`, `w`, `Pw`, `Pu`, `Q1`, `Q2` | `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_032` | `forced_collapse` | `u=v` | 17/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_033` | `forced_collapse` | `u=v` | 21/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_034` | `forced_collapse` | `u=v` | 23/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_035` | `forced_collapse` | `u=v` | 20/31 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Q1`, `Q2` | `u`, `s1`, `s2`, `Pw`, `Q1`, `Q2` |
| `s2_036` | `forced_collapse` | `u=v` | 20/31 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Q1`, `Q2` | `u`, `s1`, `s2`, `Pw`, `Q1`, `Q2` |
| `s2_037` | `forced_collapse` | `u=v` | 22/31 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_038` | `forced_collapse` | `u=v` | 22/31 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_039` | `forced_collapse` | `u=v` | 23/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_040` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_041` | `forced_collapse` | `u=v` | 19/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_042` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_043` | `forced_collapse` | `u=s1` | 14/31 | `u`, `v`, `w`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_044` | `forced_collapse` | `u=s1` | 14/31 | `u`, `v`, `w`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_045` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_046` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_047` | `forced_collapse` | `u=v` | 23/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_048` | `forced_collapse` | `u=v` | 20/31 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_049` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_050` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_051` | `forced_collapse` | `u=v` | 16/31 | `v`, `w`, `s2`, `s3`, `Pw`, `Q1`, `Q2` | `s2`, `s3`, `Pw`, `Q1`, `Q2` |
| `s2_052` | `forced_collapse` | `u=v` | 31/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_053` | `forced_collapse` | `u=s1` | 29/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_054` | `forced_collapse` | `u=v` | 23/31 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_055` | `forced_collapse` | `u=v` | 26/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_056` | `forced_collapse` | `u=v` | 22/31 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_057` | `forced_collapse` | `u=v` | 18/31 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_058` | `forced_collapse` | `u=v` | 24/31 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_059` | `forced_collapse` | `u=v` | 25/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` |
| `s2_060` | `forced_collapse` | `u=v` | 26/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` |
| `s2_061` | `forced_collapse` | `u=s1` | 20/31 | `u`, `w`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `u`, `s2`, `s3`, `Pu`, `Q1`, `Q2` |
| `s2_062` | `forced_collapse` | `u=s1` | 20/31 | `u`, `v`, `w`, `s1`, `s2`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `Pu`, `Q1`, `Q2` |
| `s2_063` | `forced_collapse` | `u=v` | 24/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_064` | `forced_collapse` | `u=v` | 29/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_065` | `forced_collapse` | `u=v` | 31/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_066` | `forced_collapse` | `u=v` | 31/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_067` | `forced_collapse` | `u=v` | 29/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_068` | `forced_collapse` | `u=v` | 31/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_069` | `forced_collapse` | `u=v` | 17/31 | `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s2_070` | `forced_collapse` | `u=v` | 26/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_000` | `forced_collapse` | `u=v` | 25/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_001` | `forced_collapse` | `u=v` | 24/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_002` | `forced_collapse` | `u=v` | 17/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q2` |
| `s3_003` | `forced_collapse` | `u=v` | 15/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu` | `s1`, `s2`, `s3`, `Pw`, `Pu` |
| `s3_004` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` |
| `s3_005` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_006` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_007` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_008` | `forced_collapse` | `u=v` | 26/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_009` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_010` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_011` | `forced_collapse` | `u=v` | 26/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_012` | `forced_collapse` | `u=v` | 19/31 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Q1`, `Q2` | `s1`, `s2`, `s3`, `Pw`, `Q1`, `Q2` |
| `s3_013` | `forced_collapse` | `u=v` | 25/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_014` | `forced_collapse` | `u=v` | 29/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_015` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_016` | `forced_collapse` | `u=v` | 15/31 | `u`, `v`, `w`, `s3`, `Pw`, `Pu`, `Q1` | `u`, `s3`, `Pw`, `Pu`, `Q1` |
| `s3_017` | `forced_collapse` | `u=v` | 26/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_018` | `forced_collapse` | `u=v` | 25/31 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_019` | `forced_collapse` | `u=v` | 26/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` |
| `s3_020` | `forced_collapse` | `u=v` | 30/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_021` | `forced_collapse` | `u=v` | 27/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `s3_022` | `forced_collapse` | `u=v` | 28/31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
