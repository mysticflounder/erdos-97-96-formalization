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
- timeout seconds: 60
- Python exact polynomial check: False

## Summary

- leaf jobs: 63
- status counts: `{'ok': 58, 'timeout': 5}`
- generator count distribution: `{'18': 2, '21': 3, '22': 2, '25': 9, '26': 7, '27': 2, '28': 3, '29': 3, '30': 7, '31': 25}`
- nonzero count distribution: `{'13': 1, '14': 1, '15': 1, '16': 6, '17': 2, '18': 4, '19': 5, '20': 2, '21': 5, '23': 3, '24': 1, '25': 6, '26': 2, '27': 2, '28': 8, '29': 6, '30': 1, '31': 2}`
- timeout certificate ids: `['R003:u=v:R003Y', 'R004:u=v:R004NY', 'R009:u=v:R009NYYY', 'R009:u=v:R009NYN', 'R011:u=v:R011NNN']`
- center usage rows: `{'u': 51, 'v': 58, 'w': 58, 's1': 45, 's2': 51, 's3': 53, 'Pw': 53, 'Pu': 54, 'Q1': 54, 'Q2': 53}`

## Certificates

| certificate | status | generators | nonzero | centers | path |
|---|---:|---:|---:|---|---|
| `R000:u=v:R000` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R000_ueqv_R000.json` |
| `R001:no_separator:R001` | `ok` | 27 | 18 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R001_no_separator_R001.json` |
| `R002:u=v:R002YY` | `ok` | 25 | 18 | `u`, `v`, `w`, `s1`, `s2`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R002_ueqv_R002YY.json` |
| `R002:u=v:R002YN` | `ok` | 25 | 23 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R002_ueqv_R002YN.json` |
| `R002:u=v:R002NYY` | `ok` | 25 | 21 | `u`, `v`, `w`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R002_ueqv_R002NYY.json` |
| `R002:u=v:R002NYN` | `ok` | 31 | 13 | `v`, `w`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R002_ueqv_R002NYN.json` |
| `R002:u=v:R002NNY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R002_ueqv_R002NNY.json` |
| `R002:u=v:R002NNN` | `ok` | 30 | 16 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R002_ueqv_R002NNN.json` |
| `R003:u=v:R003Y` | `timeout` | 26 | - | - | - |
| `R003:u=v:R003NY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R003_ueqv_R003NY.json` |
| `R003:u=v:R003NN` | `ok` | 31 | 31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R003_ueqv_R003NN.json` |
| `R004:u=v:R004YY` | `ok` | 30 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R004_ueqv_R004YY.json` |
| `R004:u=v:R004YNY` | `ok` | 31 | 19 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R004_ueqv_R004YNY.json` |
| `R004:u=v:R004YNN` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R004_ueqv_R004YNN.json` |
| `R004:u=v:R004NY` | `timeout` | 25 | - | - | - |
| `R004:u=v:R004NNY` | `ok` | 31 | 16 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R004_ueqv_R004NNY.json` |
| `R004:u=v:R004NNN` | `ok` | 31 | 14 | `u`, `v`, `w`, `s3`, `Pw`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R004_ueqv_R004NNN.json` |
| `R005:u=v:R005YY` | `ok` | 26 | 21 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R005_ueqv_R005YY.json` |
| `R005:u=v:R005YNY` | `ok` | 31 | 30 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R005_ueqv_R005YNY.json` |
| `R005:u=v:R005YNN` | `ok` | 26 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R005_ueqv_R005YNN.json` |
| `R005:u=v:R005NYY` | `ok` | 31 | 25 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R005_ueqv_R005NYY.json` |
| `R005:u=v:R005NYN` | `ok` | 31 | 31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R005_ueqv_R005NYN.json` |
| `R005:u=v:R005NNY` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R005_ueqv_R005NNY.json` |
| `R005:u=v:R005NNN` | `ok` | 25 | 25 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R005_ueqv_R005NNN.json` |
| `R006:u=v:R006` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R006_ueqv_R006.json` |
| `R007:u=v:R007Y` | `ok` | 30 | 19 | `u`, `v`, `w`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R007_ueqv_R007Y.json` |
| `R007:u=v:R007NY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R007_ueqv_R007NY.json` |
| `R007:u=v:R007NN` | `ok` | 31 | 21 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R007_ueqv_R007NN.json` |
| `R008:u=v:R008YY` | `ok` | 26 | 19 | `u`, `v`, `w`, `s1`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R008_ueqv_R008YY.json` |
| `R008:u=v:R008YN` | `ok` | 25 | 25 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1` | `certificates/surplus/relaxed_split/R008_ueqv_R008YN.json` |
| `R008:u=v:R008NY` | `ok` | 25 | 25 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R008_ueqv_R008NY.json` |
| `R008:u=v:R008NN` | `ok` | 26 | 19 | `u`, `v`, `w`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R008_ueqv_R008NN.json` |
| `R009:u=s1:R009Y` | `ok` | 31 | 19 | `u`, `v`, `w`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqs1_R009Y.json` |
| `R009:u=s1:R009N` | `ok` | 30 | 15 | `u`, `v`, `w`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqs1_R009N.json` |
| `R009:u=v:R009YYY` | `ok` | 21 | 17 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu` | `certificates/surplus/relaxed_split/R009_ueqv_R009YYY.json` |
| `R009:u=v:R009YYN` | `ok` | 28 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009YYN.json` |
| `R009:u=v:R009YNYY` | `ok` | 30 | 18 | `v`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009YNYY.json` |
| `R009:u=v:R009YNYNY` | `ok` | 31 | 16 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009YNYNY.json` |
| `R009:u=v:R009YNYNN` | `ok` | 31 | 21 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009YNYNN.json` |
| `R009:u=v:R009YNN` | `ok` | 21 | 16 | `v`, `w`, `s1`, `s2`, `s3`, `Pw` | `certificates/surplus/relaxed_split/R009_ueqv_R009YNN.json` |
| `R009:u=v:R009NYYY` | `timeout` | 18 | - | - | - |
| `R009:u=v:R009NYYNY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009NYYNY.json` |
| `R009:u=v:R009NYYNN` | `ok` | 31 | 20 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009NYYNN.json` |
| `R009:u=v:R009NYN` | `timeout` | 22 | - | - | - |
| `R009:u=v:R009NNY` | `ok` | 28 | 18 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009NNY.json` |
| `R009:u=v:R009NNNY` | `ok` | 28 | 16 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009NNNY.json` |
| `R009:u=v:R009NNNN` | `ok` | 30 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R009_ueqv_R009NNNN.json` |
| `R010:u=v:R010Y` | `ok` | 27 | 27 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R010_ueqv_R010Y.json` |
| `R010:u=v:R010N` | `ok` | 29 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R010_ueqv_R010N.json` |
| `R011:u=s1:R011` | `ok` | 29 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R011_ueqs1_R011.json` |
| `R011:u=v:R011YYY` | `ok` | 31 | 27 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R011_ueqv_R011YYY.json` |
| `R011:u=v:R011YYN` | `ok` | 31 | 25 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R011_ueqv_R011YYN.json` |
| `R011:u=v:R011YN` | `ok` | 25 | 24 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R011_ueqv_R011YN.json` |
| `R011:u=v:R011NY` | `ok` | 30 | 20 | `u`, `v`, `w`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R011_ueqv_R011NY.json` |
| `R011:u=v:R011NNY` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R011_ueqv_R011NNY.json` |
| `R011:u=v:R011NNN` | `timeout` | 25 | - | - | - |
| `R012:u=v:R012` | `ok` | 31 | 25 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R012_ueqv_R012.json` |
| `R013:u=v:R013Y` | `ok` | 18 | 17 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Q1` | `certificates/surplus/relaxed_split/R013_ueqv_R013Y.json` |
| `R013:u=v:R013NY` | `ok` | 22 | 16 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Q1` | `certificates/surplus/relaxed_split/R013_ueqv_R013NY.json` |
| `R013:u=v:R013NNY` | `ok` | 26 | 23 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R013_ueqv_R013NNY.json` |
| `R013:u=v:R013NNN` | `ok` | 21 | 21 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R013_ueqv_R013NNN.json` |
| `R014:u=v:R014Y` | `ok` | 26 | 23 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R014_ueqv_R014Y.json` |
| `R014:u=v:R014N` | `ok` | 29 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split/R014_ueqv_R014N.json` |
