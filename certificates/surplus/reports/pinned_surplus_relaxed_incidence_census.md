<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Pinned Surplus Relaxed Incidence Census

This report projects the exact 135-row pinned surplus bank to the
currently guaranteed submask vocabulary. Exact masks are kept only at
the listed centers; every other center is erased to the empty submask.
Each relaxed row records the exact bank rows that complete it, plus
the intersection and union of their exact masks.

This is an incidence projection census, not an algebraic certificate.
Extra common incidences are common to the exact completions in the
current bank; they are not automatically geometric facts unless a
separate bridge theorem proves the exact-bank completion hypothesis.

## Policy

- exact centers: `['v', 'w']`
- erased centers: `['u', 's1', 's2', 's3', 'Pw', 'Pu', 'Q1', 'Q2']`

## Summary

- exact rows: 135
- relaxed rows: 15
- collapsed rows: 120
- exact row counts by surplus star: `{'s1': 41, 's2': 71, 's3': 23}`
- relaxed row counts by surplus star: `{'s1': 8, 's2': 4, 's3': 3}`
- exact-completion count distribution: `{'1': 3, '10': 1, '11': 1, '13': 1, '16': 1, '17': 1, '2': 1, '36': 1, '4': 2, '5': 1, '6': 1, '8': 1}`
- max exact completions for one relaxed row: 36
- relaxed rows with multiple exact completions: 12
- erased-center extra common incidence usage: `{'u': 15, 's1': 11, 's2': 13, 's3': 14, 'Pw': 10, 'Pu': 14, 'Q1': 15, 'Q2': 15}`
- variable center usage across completion fibers: `{'u': 10, 's1': 11, 's2': 11, 's3': 10, 'Pw': 11, 'Pu': 11, 'Q1': 11, 'Q2': 12}`

## Relaxed Rows

| relaxed id | sstar | completions | exact pids | exact centers | erased common extras | variable centers |
|---|---:|---:|---|---|---|---|
| `R000` | `s1` | 1 | `s1_002` | `v`=201(u,s1,Pw,Pu); `w`=777(u,s1,Q1,Q2) | `u`=432(s2,s3,Pu,Q1); `s1`=534(v,w,s2,Q2); `s2`=354(v,s3,Pw,Q1); `s3`=92(w,s1,s2,Pw); `Pw`=170(v,s1,s3,Pu); `Pu`=83(u,v,s2,Pw); `Q1`=549(u,w,s3,Q2); `Q2`=390(v,w,Pu,Q1) | - |
| `R001` | `s1` | 2 | `s1_000`, `s1_001` | `v`=201(u,s1,Pw,Pu); `w`=834(v,Pw,Q1,Q2) | `u`=304(s2,s3,Q1); `s1`=277(u,w,s2,Q1); `s2`=553(u,s1,s3,Q2); `s3`=660(w,s2,Pu,Q2); `Pw`=140(w,s1,Pu); `Pu`=83(u,v,s2,Pw); `Q1`=612(w,s3,Pw,Q2); `Q2`=290(v,s3,Q1) | `u`, `Pw`, `Q2` |
| `R002` | `s1` | 11 | `s1_003`, `s1_004`, `s1_005`, `s1_006`, `s1_007`, `s1_008`, `s1_009`, `s1_010`, `s1_011`, `s1_012`, `s1_013` | `v`=201(u,s1,Pw,Pu); `w`=840(s1,Pw,Q1,Q2) | `u`=48(s2,s3); `s1`=16(s2); `s2`=32(s3); `s3`=20(w,s2); `Pw`=128(Pu); `Pu`=1(u); `Q1`=514(v,Q2); `Q2`=256(Q1) | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `R003` | `s1` | 4 | `s1_024`, `s1_025`, `s1_026`, `s1_027` | `v`=201(u,s1,Pw,Pu); `w`=848(s2,Pw,Q1,Q2) | `u`=32(s3); `s1`=528(s2,Q2); `s2`=32(s3); `s3`=12(w,s1); `Q1`=544(s3,Q2); `Q2`=260(w,Q1) | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `R004` | `s1` | 8 | `s1_029`, `s1_030`, `s1_031`, `s1_032`, `s1_033`, `s1_034`, `s1_035`, `s1_036` | `v`=201(u,s1,Pw,Pu); `w`=864(s3,Pw,Q1,Q2) | `u`=16(s2); `s2`=32(s3); `s3`=4(w); `Pw`=2(v); `Pu`=1(u); `Q1`=512(Q2); `Q2`=256(Q1) | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `R005` | `s1` | 10 | `s1_014`, `s1_015`, `s1_016`, `s1_017`, `s1_018`, `s1_019`, `s1_020`, `s1_021`, `s1_022`, `s1_023` | `v`=201(u,s1,Pw,Pu); `w`=904(s1,Pu,Q1,Q2) | `u`=176(s2,s3,Pu); `s2`=32(s3); `s3`=20(w,s2); `Pu`=65(u,Pw); `Q1`=512(Q2); `Q2`=256(Q1) | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `R006` | `s1` | 1 | `s1_028` | `v`=201(u,s1,Pw,Pu); `w`=912(s2,Pu,Q1,Q2) | `u`=178(v,s2,s3,Pu); `s1`=531(u,v,s2,Q2); `s2`=616(s1,s3,Pw,Q2); `s3`=142(v,w,s1,Pu); `Pw`=297(u,s1,s3,Q1); `Pu`=326(v,w,Pw,Q1); `Q1`=549(u,w,s3,Q2); `Q2`=284(w,s1,s2,Q1) | - |
| `R007` | `s1` | 4 | `s1_037`, `s1_038`, `s1_039`, `s1_040` | `v`=201(u,s1,Pw,Pu); `w`=928(s3,Pu,Q1,Q2) | `u`=16(s2); `s1`=18(v,s2); `s2`=552(s1,s3,Q2); `s3`=6(v,w); `Pw`=9(u,s1); `Pu`=577(u,Pw,Q2); `Q1`=516(w,Q2); `Q2`=256(Q1) | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `R008` | `s2` | 16 | `s2_000`, `s2_001`, `s2_002`, `s2_003`, `s2_004`, `s2_005`, `s2_006`, `s2_007`, `s2_008`, `s2_009`, `s2_010`, `s2_011`, `s2_012`, `s2_013`, `s2_014`, `s2_015` | `v`=209(u,s2,Pw,Pu); `w`=785(u,s2,Q1,Q2) | `u`=424(s1,s3,Pu,Q1); `s1`=16(s2); `s3`=16(s2); `Pw`=128(Pu); `Pu`=65(u,Pw); `Q1`=513(u,Q2); `Q2`=256(Q1) | `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `R009` | `s2` | 36 | `s2_016`, `s2_017`, `s2_018`, `s2_019`, `s2_020`, `s2_021`, `s2_022`, `s2_023`, `s2_024`, `s2_025`, `s2_026`, `s2_027`, `s2_028`, `s2_029`, `s2_030`, `s2_031`, `s2_032`, `s2_033`, `s2_034`, `s2_035`, `s2_036`, `s2_037`, `s2_038`, `s2_039`, `s2_040`, `s2_041`, `s2_042`, `s2_043`, `s2_044`, `s2_045`, `s2_046`, `s2_047`, `s2_048`, `s2_049`, `s2_050`, `s2_051` | `v`=209(u,s2,Pw,Pu); `w`=848(s2,Pw,Q1,Q2) | `u`=40(s1,s3); `Pu`=1(u); `Q1`=512(Q2); `Q2`=256(Q1) | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `R010` | `s2` | 6 | `s2_065`, `s2_066`, `s2_067`, `s2_068`, `s2_069`, `s2_070` | `v`=209(u,s2,Pw,Pu); `w`=864(s3,Pw,Q1,Q2) | `u`=284(w,s1,s2,Q1); `s1`=34(v,s3); `s2`=168(s1,s3,Pu); `s3`=533(u,w,s2,Q2); `Pw`=178(v,s2,s3,Pu); `Pu`=73(u,s1,Pw); `Q1`=518(v,w,Q2); `Q2`=264(s1,Q1) | `s1`, `s2`, `Pu`, `Q1`, `Q2` |
| `R011` | `s2` | 13 | `s2_052`, `s2_053`, `s2_054`, `s2_055`, `s2_056`, `s2_057`, `s2_058`, `s2_059`, `s2_060`, `s2_061`, `s2_062`, `s2_063`, `s2_064` | `v`=209(u,s2,Pw,Pu); `w`=912(s2,Pu,Q1,Q2) | `u`=40(s1,s3); `s2`=32(s3); `s3`=4(w); `Pu`=65(u,Pw); `Q1`=516(w,Q2); `Q2`=256(Q1) | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `R012` | `s3` | 1 | `s3_000` | `v`=225(u,s3,Pw,Pu); `w`=801(u,s3,Q1,Q2) | `u`=408(s1,s2,Pu,Q1); `s1`=562(v,s2,s3,Q2); `s2`=652(w,s1,Pu,Q2); `s3`=86(v,w,s2,Pw); `Pw`=390(v,w,Pu,Q1); `Pu`=75(u,v,s1,Pw); `Q1`=533(u,w,s2,Q2); `Q2`=300(w,s1,s3,Q1) | - |
| `R013` | `s3` | 17 | `s3_001`, `s3_002`, `s3_003`, `s3_004`, `s3_005`, `s3_006`, `s3_007`, `s3_008`, `s3_009`, `s3_010`, `s3_011`, `s3_012`, `s3_013`, `s3_014`, `s3_015`, `s3_016`, `s3_017` | `v`=225(u,s3,Pw,Pu); `w`=864(s3,Pw,Q1,Q2) | `u`=280(s1,s2,Q1); `s1`=18(v,s2); `s2`=12(w,s1); `s3`=20(w,s2); `Pu`=1(u); `Q1`=516(w,Q2); `Q2`=256(Q1) | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
| `R014` | `s3` | 5 | `s3_018`, `s3_019`, `s3_020`, `s3_021`, `s3_022` | `v`=225(u,s3,Pw,Pu); `w`=928(s3,Pu,Q1,Q2) | `u`=280(s1,s2,Q1); `s1`=274(v,s2,Q1); `s2`=12(w,s1); `s3`=20(w,s2); `Pw`=33(u,s3); `Pu`=577(u,Pw,Q2); `Q1`=516(w,Q2); `Q2`=265(u,s1,Q1) | `u`, `s1`, `s2`, `s3`, `Pw`, `Pu`, `Q1`, `Q2` |
