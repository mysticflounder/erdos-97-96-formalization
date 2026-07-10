<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Grouped Relaxed-Bank General-Ambient Mining

This report inventories the valid coefficient certificates retained in
`certificates/surplus/relaxed_split/` but not emitted into the live Lean
singleton bank. A certificate covering multiple exact pids is a candidate
for a stronger ambient-cardinality-independent local theorem: exact `.v/.w`
equations, its common erased-center submask equations, and its separator
equation imply `False`. The split path identifies the grouped leaf; it is
not an additional polynomial equation.

This is a metadata result, not a new kernel theorem. Lean emission and the
geometric producer for those hypotheses remain separate obligations.

## Summary

- Valid retained certificates: 70
- Multi-pid grouped theorem candidates: 34
- Single-pid retained certificates: 36
- Exact-pid count distribution: `{1: 36, 2: 18, 3: 6, 4: 9, 9: 1}`
- Grouped candidate size distribution: `{'1-to-50-MiB': 8, 'at-least-50-MiB': 3, 'under-1-MiB': 23}`

## Erased-Pin Cross-Check

The P2 goals use the six own-kind private masks
`[u,w,sstar,Pu]` at `Pw` and `[u,w,sstar,Pw]` at `Pu`.
They occur 12 times across the two oriented
terminal rows (6 distinct seeds). Every
occurrence has zero pinned-bank completions. Therefore no theorem mined from
this grouped pinned bank can directly discharge those six P2 seed cases via
the existing pinned-completion bridge. The fixed-seed DFS remains the relevant
finite contradiction once the geometric candidate remainder is produced.

## Multi-Pid Candidates

| Certificate | Exact pids | MiB | Split depth | Source |
|---|---:|---:|---:|---|
| `R001:no_separator:R001` | 2 | 0.0 | 0 | `certificates/surplus/relaxed_split/R001_no_separator_R001.json` |
| `R002:u=v:R002NNN` | 2 | 0.0 | 3 | `certificates/surplus/relaxed_split/R002_ueqv_R002NNN.json` |
| `R002:u=v:R002NYY` | 2 | 0.0 | 3 | `certificates/surplus/relaxed_split/R002_ueqv_R002NYY.json` |
| `R002:u=v:R002YN` | 3 | 0.6 | 2 | `certificates/surplus/relaxed_split/R002_ueqv_R002YN.json` |
| `R002:u=v:R002YY` | 2 | 0.0 | 2 | `certificates/surplus/relaxed_split/R002_ueqv_R002YY.json` |
| `R004:u=v:R004YY` | 2 | 0.0 | 2 | `certificates/surplus/relaxed_split/R004_ueqv_R004YY.json` |
| `R005:u=v:R005NNN` | 2 | 2.5 | 3 | `certificates/surplus/relaxed_split/R005_ueqv_R005NNN.json` |
| `R005:u=v:R005YNN` | 2 | 0.2 | 3 | `certificates/surplus/relaxed_split/R005_ueqv_R005YNN.json` |
| `R005:u=v:R005YY` | 2 | 0.0 | 2 | `certificates/surplus/relaxed_split/R005_ueqv_R005YY.json` |
| `R007:u=v:R007Y` | 2 | 0.0 | 1 | `certificates/surplus/relaxed_split/R007_ueqv_R007Y.json` |
| `R008:u=v:R008NN` | 4 | 0.0 | 2 | `certificates/surplus/relaxed_split/R008_ueqv_R008NN.json` |
| `R008:u=v:R008NY` | 4 | 2.9 | 2 | `certificates/surplus/relaxed_split/R008_ueqv_R008NY.json` |
| `R008:u=v:R008YN` | 4 | 1.5 | 2 | `certificates/surplus/relaxed_split/R008_ueqv_R008YN.json` |
| `R008:u=v:R008YY` | 4 | 0.0 | 2 | `certificates/surplus/relaxed_split/R008_ueqv_R008YY.json` |
| `R009:u=s1:R009N` | 2 | 0.0 | 1 | `certificates/surplus/relaxed_split/R009_ueqs1_R009N.json` |
| `R009:u=v:R009NNNN` | 2 | 1.3 | 4 | `certificates/surplus/relaxed_split/R009_ueqv_R009NNNN.json` |
| `R009:u=v:R009NNNY` | 2 | 0.0 | 4 | `certificates/surplus/relaxed_split/R009_ueqv_R009NNNY.json` |
| `R009:u=v:R009NNY` | 4 | 0.0 | 3 | `certificates/surplus/relaxed_split/R009_ueqv_R009NNY.json` |
| `R009:u=v:R009YNN` | 4 | 0.0 | 3 | `certificates/surplus/relaxed_split/R009_ueqv_R009YNN.json` |
| `R009:u=v:R009YNYY` | 2 | 0.0 | 4 | `certificates/surplus/relaxed_split/R009_ueqv_R009YNYY.json` |
| `R009:u=v:R009YYN` | 4 | 0.0 | 3 | `certificates/surplus/relaxed_split/R009_ueqv_R009YYN.json` |
| `R009:u=v:R009YYY` | 4 | 0.0 | 3 | `certificates/surplus/relaxed_split/R009_ueqv_R009YYY.json` |
| `R010:u=v:R010N` | 3 | 1.5 | 1 | `certificates/surplus/relaxed_split/R010_ueqv_R010N.json` |
| `R010:u=v:R010Y` | 3 | 6.9 | 1 | `certificates/surplus/relaxed_split/R010_ueqv_R010Y.json` |
| `R011:u=s1:R011` | 3 | 0.1 | 0 | `certificates/surplus/relaxed_split/R011_ueqs1_R011.json` |
| `R011:u=v:R011NNN` | 2 | 579.4 | 3 | `certificates/surplus/relaxed_split/R011_ueqv_R011NNN.json` |
| `R011:u=v:R011NY` | 2 | 0.0 | 2 | `certificates/surplus/relaxed_split/R011_ueqv_R011NY.json` |
| `R011:u=v:R011YN` | 3 | 0.2 | 2 | `certificates/surplus/relaxed_split/R011_ueqv_R011YN.json` |
| `R013:u=v:R013NNN` | 2 | 1.0 | 3 | `certificates/surplus/relaxed_split/R013_ueqv_R013NNN.json` |
| `R013:u=v:R013NNY` | 2 | 198.8 | 3 | `certificates/surplus/relaxed_split/R013_ueqv_R013NNY.json` |
| `R013:u=v:R013NY` | 4 | 0.4 | 2 | `certificates/surplus/relaxed_split/R013_ueqv_R013NY.json` |
| `R013:u=v:R013Y` | 9 | 183.5 | 1 | `certificates/surplus/relaxed_split/R013_ueqv_R013Y.json` |
| `R014:u=v:R014N` | 3 | 3.5 | 1 | `certificates/surplus/relaxed_split/R014_ueqv_R014N.json` |
| `R014:u=v:R014Y` | 2 | 0.0 | 1 | `certificates/surplus/relaxed_split/R014_ueqv_R014Y.json` |
