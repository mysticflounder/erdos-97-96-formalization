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
- certificate directory: `certificates/surplus/relaxed_split_singleton`
- timeout seconds: 180
- Python exact polynomial check: False
- minimize optional equations: False

## Summary

- leaf jobs: 135
- status counts: `{'ok': 135}`
- generator count distribution: `{'30': 2, '31': 133}`
- nonzero count distribution: `{'10': 1, '11': 1, '13': 5, '14': 4, '15': 7, '16': 7, '17': 5, '18': 5, '19': 11, '20': 3, '21': 9, '22': 6, '23': 9, '24': 1, '25': 7, '26': 10, '27': 9, '28': 17, '29': 12, '30': 2, '31': 4}`
- timeout certificate ids: `[]`
- minimize dropped count distribution: `{'0': 135}`
- center usage rows: `{'u': 117, 'v': 132, 'w': 132, 's1': 109, 's2': 114, 's3': 113, 'Pw': 123, 'Pu': 129, 'Q1': 127, 'Q2': 128}`

## Certificates

| certificate | status | generators | nonzero | centers | path |
|---|---:|---:|---:|---|---|
| `R000:u=v:R000` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R000_ueqv_R000.json` |
| `R001:no_separator:R001Y` | `ok` | 30 | 17 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R001_no_separator_R001Y.json` |
| `R001:no_separator:R001N` | `ok` | 30 | 18 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R001_no_separator_R001N.json` |
| `R002:u=v:R002YYY` | `ok` | 31 | 19 | `u`, `v`, `w`, `s1`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002YYY.json` |
| `R002:u=v:R002YYN` | `ok` | 31 | 15 | `u`, `v`, `w`, `s1`, `s3`, `Pw`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002YYN.json` |
| `R002:u=v:R002YNYY` | `ok` | 31 | 21 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002YNYY.json` |
| `R002:u=v:R002YNYN` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002YNYN.json` |
| `R002:u=v:R002YNN` | `ok` | 31 | 16 | `v`, `w`, `s1`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002YNN.json` |
| `R002:u=v:R002NYYY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002NYYY.json` |
| `R002:u=v:R002NYYN` | `ok` | 31 | 11 | `v`, `w`, `s1`, `Pw`, `Pu` | `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002NYYN.json` |
| `R002:u=v:R002NYN` | `ok` | 31 | 13 | `v`, `w`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002NYN.json` |
| `R002:u=v:R002NNY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002NNY.json` |
| `R002:u=v:R002NNNY` | `ok` | 31 | 16 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002NNNY.json` |
| `R002:u=v:R002NNNN` | `ok` | 31 | 16 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R002_ueqv_R002NNNN.json` |
| `R003:u=v:R003YY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003YY.json` |
| `R003:u=v:R003YN` | `ok` | 31 | 21 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003YN.json` |
| `R003:u=v:R003NY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003NY.json` |
| `R003:u=v:R003NN` | `ok` | 31 | 31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R003_ueqv_R003NN.json` |
| `R004:u=v:R004YYY` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004YYY.json` |
| `R004:u=v:R004YYN` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004YYN.json` |
| `R004:u=v:R004YNY` | `ok` | 31 | 19 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004YNY.json` |
| `R004:u=v:R004YNN` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004YNN.json` |
| `R004:u=v:R004NYY` | `ok` | 31 | 14 | `u`, `v`, `w`, `s1`, `s3`, `Pw`, `Q2` | `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004NYY.json` |
| `R004:u=v:R004NYN` | `ok` | 31 | 18 | `u`, `v`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004NYN.json` |
| `R004:u=v:R004NNY` | `ok` | 31 | 16 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004NNY.json` |
| `R004:u=v:R004NNN` | `ok` | 31 | 14 | `u`, `v`, `w`, `s3`, `Pw`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R004_ueqv_R004NNN.json` |
| `R005:u=v:R005YYY` | `ok` | 31 | 22 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005YYY.json` |
| `R005:u=v:R005YYN` | `ok` | 31 | 17 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005YYN.json` |
| `R005:u=v:R005YNY` | `ok` | 31 | 30 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005YNY.json` |
| `R005:u=v:R005YNNY` | `ok` | 31 | 15 | `u`, `v`, `w`, `s1`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005YNNY.json` |
| `R005:u=v:R005YNNN` | `ok` | 31 | 21 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005YNNN.json` |
| `R005:u=v:R005NYY` | `ok` | 31 | 25 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005NYY.json` |
| `R005:u=v:R005NYN` | `ok` | 31 | 31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005NYN.json` |
| `R005:u=v:R005NNY` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005NNY.json` |
| `R005:u=v:R005NNNY` | `ok` | 31 | 16 | `v`, `w`, `s1`, `Pw`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005NNNY.json` |
| `R005:u=v:R005NNNN` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R005_ueqv_R005NNNN.json` |
| `R006:u=v:R006` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R006_ueqv_R006.json` |
| `R007:u=v:R007YY` | `ok` | 31 | 18 | `v`, `w`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R007_ueqv_R007YY.json` |
| `R007:u=v:R007YN` | `ok` | 31 | 20 | `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R007_ueqv_R007YN.json` |
| `R007:u=v:R007NY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R007_ueqv_R007NY.json` |
| `R007:u=v:R007NN` | `ok` | 31 | 21 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R007_ueqv_R007NN.json` |
| `R008:u=v:R008YYYY` | `ok` | 31 | 22 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008YYYY.json` |
| `R008:u=v:R008YYYN` | `ok` | 31 | 23 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008YYYN.json` |
| `R008:u=v:R008YYNY` | `ok` | 31 | 25 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008YYNY.json` |
| `R008:u=v:R008YYNN` | `ok` | 31 | 20 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008YYNN.json` |
| `R008:u=v:R008YNYY` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008YNYY.json` |
| `R008:u=v:R008YNYN` | `ok` | 31 | 27 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008YNYN.json` |
| `R008:u=v:R008YNNY` | `ok` | 31 | 13 | `u`, `v`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008YNNY.json` |
| `R008:u=v:R008YNNN` | `ok` | 31 | 22 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008YNNN.json` |
| `R008:u=v:R008NYYY` | `ok` | 31 | 13 | `u`, `v`, `w`, `s1`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008NYYY.json` |
| `R008:u=v:R008NYYN` | `ok` | 31 | 13 | `u`, `v`, `w`, `s1`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008NYYN.json` |
| `R008:u=v:R008NYNY` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008NYNY.json` |
| `R008:u=v:R008NYNN` | `ok` | 31 | 27 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008NYNN.json` |
| `R008:u=v:R008NNYY` | `ok` | 31 | 19 | `u`, `v`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008NNYY.json` |
| `R008:u=v:R008NNYN` | `ok` | 31 | 14 | `u`, `v`, `w`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008NNYN.json` |
| `R008:u=v:R008NNNY` | `ok` | 31 | 22 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008NNNY.json` |
| `R008:u=v:R008NNNN` | `ok` | 31 | 22 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R008_ueqv_R008NNNN.json` |
| `R009:u=s1:R009Y` | `ok` | 31 | 19 | `u`, `v`, `w`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqs1_R009Y.json` |
| `R009:u=s1:R009NY` | `ok` | 31 | 15 | `u`, `v`, `w`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqs1_R009NY.json` |
| `R009:u=s1:R009NN` | `ok` | 31 | 19 | `u`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqs1_R009NN.json` |
| `R009:u=v:R009YYYYY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YYYYY.json` |
| `R009:u=v:R009YYYYN` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YYYYN.json` |
| `R009:u=v:R009YYYNY` | `ok` | 31 | 15 | `v`, `w`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YYYNY.json` |
| `R009:u=v:R009YYYNN` | `ok` | 31 | 25 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YYYNN.json` |
| `R009:u=v:R009YYNYYY` | `ok` | 31 | 23 | `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YYNYYY.json` |
| `R009:u=v:R009YYNYYN` | `ok` | 31 | 15 | `v`, `w`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YYNYYN.json` |
| `R009:u=v:R009YYNYN` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YYNYN.json` |
| `R009:u=v:R009YYNN` | `ok` | 31 | 24 | `u`, `v`, `w`, `s1`, `s2`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YYNN.json` |
| `R009:u=v:R009YNYYY` | `ok` | 31 | 19 | `v`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YNYYY.json` |
| `R009:u=v:R009YNYYN` | `ok` | 31 | 18 | `v`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YNYYN.json` |
| `R009:u=v:R009YNYNY` | `ok` | 31 | 16 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YNYNY.json` |
| `R009:u=v:R009YNYNN` | `ok` | 31 | 21 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YNYNN.json` |
| `R009:u=v:R009YNNYY` | `ok` | 31 | 23 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YNNYY.json` |
| `R009:u=v:R009YNNYN` | `ok` | 31 | 25 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YNNYN.json` |
| `R009:u=v:R009YNNNY` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YNNNY.json` |
| `R009:u=v:R009YNNNN` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009YNNNN.json` |
| `R009:u=v:R009NYYYY` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYYYY.json` |
| `R009:u=v:R009NYYYNY` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYYYNY.json` |
| `R009:u=v:R009NYYYNN` | `ok` | 31 | 21 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYYYNN.json` |
| `R009:u=v:R009NYYNY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYYNY.json` |
| `R009:u=v:R009NYYNN` | `ok` | 31 | 20 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYYNN.json` |
| `R009:u=v:R009NYNYY` | `ok` | 31 | 23 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYNYY.json` |
| `R009:u=v:R009NYNYN` | `ok` | 31 | 27 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYNYN.json` |
| `R009:u=v:R009NYNNY` | `ok` | 31 | 21 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYNNY.json` |
| `R009:u=v:R009NYNNN` | `ok` | 31 | 19 | `u`, `v`, `w`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NYNNN.json` |
| `R009:u=v:R009NNYY` | `ok` | 31 | 21 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNYY.json` |
| `R009:u=v:R009NNYNY` | `ok` | 31 | 27 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNYNY.json` |
| `R009:u=v:R009NNYNNY` | `ok` | 31 | 23 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNYNNY.json` |
| `R009:u=v:R009NNYNNN` | `ok` | 31 | 19 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNYNNN.json` |
| `R009:u=v:R009NNNYY` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNNYY.json` |
| `R009:u=v:R009NNNYN` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNNYN.json` |
| `R009:u=v:R009NNNNY` | `ok` | 31 | 30 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNNNY.json` |
| `R009:u=v:R009NNNNN` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R009_ueqv_R009NNNNN.json` |
| `R010:u=v:R010YY` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R010_ueqv_R010YY.json` |
| `R010:u=v:R010YNY` | `ok` | 31 | 18 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R010_ueqv_R010YNY.json` |
| `R010:u=v:R010YNN` | `ok` | 31 | 31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R010_ueqv_R010YNN.json` |
| `R010:u=v:R010NYY` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R010_ueqv_R010NYY.json` |
| `R010:u=v:R010NYN` | `ok` | 31 | 27 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R010_ueqv_R010NYN.json` |
| `R010:u=v:R010NN` | `ok` | 31 | 21 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R010_ueqv_R010NN.json` |
| `R011:u=s1:R011Y` | `ok` | 31 | 17 | `u`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqs1_R011Y.json` |
| `R011:u=s1:R011NY` | `ok` | 31 | 17 | `u`, `w`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqs1_R011NY.json` |
| `R011:u=s1:R011NN` | `ok` | 31 | 22 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqs1_R011NN.json` |
| `R011:u=v:R011YYY` | `ok` | 31 | 27 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011YYY.json` |
| `R011:u=v:R011YYN` | `ok` | 31 | 25 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011YYN.json` |
| `R011:u=v:R011YNY` | `ok` | 31 | 27 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011YNY.json` |
| `R011:u=v:R011YNNY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011YNNY.json` |
| `R011:u=v:R011YNNN` | `ok` | 31 | 23 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011YNNN.json` |
| `R011:u=v:R011NYY` | `ok` | 31 | 23 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011NYY.json` |
| `R011:u=v:R011NYN` | `ok` | 31 | 31 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011NYN.json` |
| `R011:u=v:R011NNY` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011NNY.json` |
| `R011:u=v:R011NNNY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011NNNY.json` |
| `R011:u=v:R011NNNN` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R011_ueqv_R011NNNN.json` |
| `R012:u=v:R012` | `ok` | 31 | 25 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R012_ueqv_R012.json` |
| `R013:u=v:R013YYYY` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YYYY.json` |
| `R013:u=v:R013YYYN` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YYYN.json` |
| `R013:u=v:R013YYNYY` | `ok` | 31 | 15 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YYNYY.json` |
| `R013:u=v:R013YYNYN` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YYNYN.json` |
| `R013:u=v:R013YYNN` | `ok` | 31 | 10 | `v`, `w`, `s3`, `Pw`, `Pu` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YYNN.json` |
| `R013:u=v:R013YNYY` | `ok` | 31 | 17 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YNYY.json` |
| `R013:u=v:R013YNYN` | `ok` | 31 | 16 | `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YNYN.json` |
| `R013:u=v:R013YNNY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YNNY.json` |
| `R013:u=v:R013YNNN` | `ok` | 31 | 27 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013YNNN.json` |
| `R013:u=v:R013NYYY` | `ok` | 31 | 19 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013NYYY.json` |
| `R013:u=v:R013NYYN` | `ok` | 31 | 29 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013NYYN.json` |
| `R013:u=v:R013NYNY` | `ok` | 31 | 13 | `v`, `w`, `s1`, `s2`, `s3`, `Pw` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013NYNY.json` |
| `R013:u=v:R013NYNN` | `ok` | 31 | 26 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013NYNN.json` |
| `R013:u=v:R013NNYY` | `ok` | 31 | 27 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013NNYY.json` |
| `R013:u=v:R013NNYN` | `ok` | 31 | 23 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013NNYN.json` |
| `R013:u=v:R013NNNY` | `ok` | 31 | 19 | `u`, `v`, `w`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013NNNY.json` |
| `R013:u=v:R013NNNN` | `ok` | 31 | 14 | `u`, `v`, `w`, `s3`, `Pw`, `Pu`, `Q1` | `certificates/surplus/relaxed_split_singleton/R013_ueqv_R013NNNN.json` |
| `R014:u=v:R014YY` | `ok` | 31 | 28 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R014_ueqv_R014YY.json` |
| `R014:u=v:R014YN` | `ok` | 31 | 23 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R014_ueqv_R014YN.json` |
| `R014:u=v:R014NY` | `ok` | 31 | 15 | `u`, `v`, `w`, `s3`, `Pw`, `Pu`, `Q1` | `certificates/surplus/relaxed_split_singleton/R014_ueqv_R014NY.json` |
| `R014:u=v:R014NNY` | `ok` | 31 | 19 | `u`, `v`, `w`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R014_ueqv_R014NNY.json` |
| `R014:u=v:R014NNN` | `ok` | 31 | 25 | `u`, `v`, `w`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` | `certificates/surplus/relaxed_split_singleton/R014_ueqv_R014NNN.json` |
