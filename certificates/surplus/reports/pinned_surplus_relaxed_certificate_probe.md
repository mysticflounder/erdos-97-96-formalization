<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Pinned Surplus Relaxed Certificate Probe

This report tests the 15-row relaxed incidence projection as an
algebraic support-mining problem.  Each branch keeps the exact center
equations, adds the branch separator when present, and then tries
branch-common erased-center submask equations as optional facts.
A deterministic greedy pass deletes optional equations when Singular
still reports the unit ideal.

This is not a Lean certificate.  It is the proof shopping list for
the geometric submask bridge and the next certificate-generation pass.

## Policy

- exact centers: `['v', 'w']`
- separator policy: branch by COMP-G final forced pair; C_EMPTY rows use no separator
- optional fact policy: branch-specific intersections of erased-center exact masks; each common submask contributes star equal-distance equations
- greedy policy: single deterministic deletion pass over optional equations
- greedy max optional equations: 8
- lifted support enabled: True
- timeout seconds: 20

## Summary

- relaxed rows: 15
- probe cases: 17
- case counts by separator: `{'None': 1, 'u=s1': 2, 'u=v': 14}`
- required-only status counts: `{'nonunit': 17}`
- all-optional status counts: `{'nonunit': 5, 'timeout': 7, 'unit': 5}`
- final status counts: `{'nonunit': 5, 'timeout': 7, 'unit': 5}`
- lift status counts: `{'not_run': 12, 'ok': 5}`
- initial support source counts: `{'lift_nonzero_optional_support': 5, 'required_only': 12}`
- optional equation count distribution: `{'0': 1, '1': 1, '12': 1, '13': 1, '17': 1, '21': 1, '22': 1, '24': 3, '3': 2, '4': 2, '5': 1, '6': 1, '8': 1}`
- kept optional equation count distribution: `{'0': 1, '1': 1, '12': 1, '13': 2, '17': 1, '21': 2, '22': 1, '24': 1, '3': 2, '4': 2, '5': 1, '6': 1, '8': 1}`
- cases unit required-only: `[]`
- cases nonunit with all optional: `['R002:u=v', 'R003:u=v', 'R004:u=v', 'R009:u=v', 'R011:u=v']`
- cases greedy skipped: `['R000:u=v', 'R001:no_separator', 'R006:u=v', 'R011:u=s1', 'R012:u=v']`
- timeout/error cases: `['R005:u=v', 'R007:u=v', 'R008:u=v', 'R009:u=s1', 'R010:u=v', 'R013:u=v', 'R014:u=v']`
- kept optional center usage: `{'u': 13, 's1': 11, 's2': 10, 's3': 13, 'Pw': 9, 'Pu': 12, 'Q1': 14, 'Q2': 9}`

## Probe Cases

| case | completions | required | all optional | final | lift | source | optional eqs | kept eqs | kept submasks |
|---|---:|---:|---:|---:|---:|---|---:|---:|---|
| `R000:u=v` | 1 | `nonunit` | `unit` | `unit` | `ok` | `lift_nonzero_optional_support` | 24 | 24 | `u`=432(s2,s3,Pu,Q1); `s1`=534(v,w,s2,Q2); `s2`=354(v,s3,Pw,Q1); `s3`=92(w,s1,s2,Pw); `Pw`=170(v,s1,s3,Pu); `Pu`=83(u,v,s2,Pw); `Q1`=549(u,w,s3,Q2); `Q2`=390(v,w,Pu,Q1) |
| `R001:no_separator` | 2 | `nonunit` | `unit` | `unit` | `ok` | `lift_nonzero_optional_support` | 21 | 13 | `s1`=21(u,w,s2); `s2`=41(u,s1,s3); `s3`=532(w,s2,Q2); `Pw`=140(w,s1,Pu); `Pu`=67(u,v,Pw); `Q1`=516(w,Q2); `Q2`=290(v,s3,Q1) |
| `R002:u=v` | 11 | `nonunit` | `nonunit` | `nonunit` | `not_run` | `required_only` | 3 | 3 | `u`=48(s2,s3); `s3`=20(w,s2); `Q1`=514(v,Q2) |
| `R003:u=v` | 4 | `nonunit` | `nonunit` | `nonunit` | `not_run` | `required_only` | 4 | 4 | `s1`=528(s2,Q2); `s3`=12(w,s1); `Q1`=544(s3,Q2); `Q2`=260(w,Q1) |
| `R004:u=v` | 8 | `nonunit` | `nonunit` | `nonunit` | `not_run` | `required_only` | 0 | 0 | - |
| `R005:u=v` | 10 | `nonunit` | `timeout` | `timeout` | `not_run` | `required_only` | 4 | 4 | `u`=176(s2,s3,Pu); `s3`=20(w,s2); `Pu`=65(u,Pw) |
| `R006:u=v` | 1 | `nonunit` | `unit` | `unit` | `ok` | `lift_nonzero_optional_support` | 24 | 22 | `u`=178(v,s2,s3,Pu); `s1`=515(u,v,Q2); `s2`=616(s1,s3,Pw,Q2); `s3`=142(v,w,s1,Pu); `Pw`=297(u,s1,s3,Q1); `Pu`=326(v,w,Pw,Q1); `Q1`=545(u,s3,Q2); `Q2`=284(w,s1,s2,Q1) |
| `R007:u=v` | 4 | `nonunit` | `timeout` | `timeout` | `not_run` | `required_only` | 8 | 8 | `s1`=18(v,s2); `s2`=552(s1,s3,Q2); `s3`=6(v,w); `Pw`=9(u,s1); `Pu`=577(u,Pw,Q2); `Q1`=516(w,Q2) |
| `R008:u=v` | 16 | `nonunit` | `timeout` | `timeout` | `not_run` | `required_only` | 5 | 5 | `u`=424(s1,s3,Pu,Q1); `Pu`=65(u,Pw); `Q1`=513(u,Q2) |
| `R009:u=s1` | 3 | `nonunit` | `timeout` | `timeout` | `not_run` | `required_only` | 13 | 13 | `u`=296(s1,s3,Q1); `s1`=290(v,s3,Q1); `s2`=516(w,Q2); `s3`=26(v,s1,s2); `Pw`=132(w,Pu); `Pu`=69(u,w,Pw); `Q1`=546(v,s3,Q2); `Q2`=260(w,Q1) |
| `R009:u=v` | 33 | `nonunit` | `nonunit` | `nonunit` | `not_run` | `required_only` | 1 | 1 | `u`=40(s1,s3) |
| `R010:u=v` | 6 | `nonunit` | `timeout` | `timeout` | `not_run` | `required_only` | 17 | 17 | `u`=284(w,s1,s2,Q1); `s1`=34(v,s3); `s2`=168(s1,s3,Pu); `s3`=533(u,w,s2,Q2); `Pw`=178(v,s2,s3,Pu); `Pu`=73(u,s1,Pw); `Q1`=518(v,w,Q2); `Q2`=264(s1,Q1) |
| `R011:u=s1` | 3 | `nonunit` | `unit` | `unit` | `ok` | `lift_nonzero_optional_support` | 22 | 21 | `u`=424(s1,s3,Pu,Q1); `s1`=290(v,s3,Q1); `s2`=556(w,s1,s3,Q2); `s3`=86(v,w,s2,Pw); `Pw`=21(u,w,s2); `Pu`=609(u,s3,Pw,Q2); `Q1`=646(v,w,Pu,Q2); `Q2`=266(v,s1,Q1) |
| `R011:u=v` | 10 | `nonunit` | `nonunit` | `nonunit` | `not_run` | `required_only` | 3 | 3 | `u`=40(s1,s3); `Pu`=65(u,Pw); `Q1`=516(w,Q2) |
| `R012:u=v` | 1 | `nonunit` | `unit` | `unit` | `ok` | `lift_nonzero_optional_support` | 24 | 21 | `u`=408(s1,s2,Pu,Q1); `s1`=530(v,s2,Q2); `s2`=524(w,s1,Q2); `s3`=86(v,w,s2,Pw); `Pw`=390(v,w,Pu,Q1); `Pu`=67(u,v,Pw); `Q1`=533(u,w,s2,Q2); `Q2`=300(w,s1,s3,Q1) |
| `R013:u=v` | 17 | `nonunit` | `timeout` | `timeout` | `not_run` | `required_only` | 6 | 6 | `u`=280(s1,s2,Q1); `s1`=18(v,s2); `s2`=12(w,s1); `s3`=20(w,s2); `Q1`=516(w,Q2) |
| `R014:u=v` | 5 | `nonunit` | `timeout` | `timeout` | `not_run` | `required_only` | 12 | 12 | `u`=280(s1,s2,Q1); `s1`=274(v,s2,Q1); `s2`=12(w,s1); `s3`=20(w,s2); `Pw`=33(u,s3); `Pu`=577(u,Pw,Q2); `Q1`=516(w,Q2); `Q2`=265(u,s1,Q1) |
