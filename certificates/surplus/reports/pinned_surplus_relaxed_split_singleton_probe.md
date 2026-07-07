<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Pinned Surplus Relaxed Split Probe

This report recursively splits relaxed incidence branches by
erased-center label incidences.  Each node is tested using exact
`.v/.w`, the separator when present, and the erased-center submask
facts common to the exact completions under that node.

A leaf with status `unit` is an algebraically closed certificate target.
A non-`unit` leaf means the split depth or incidence vocabulary is still
too coarse.

## Policy

- exact centers: `['v', 'w']`
- split policy: recursively split exact completions by erased-center label incidence; test each node with equations common to that node
- max depth: 12
- continue unit above completions: 1
- timeout seconds: 20

## Summary

- relaxed rows: 15
- probe cases: 17
- leaves: 135
- leaf status counts: `{'unit': 135}`
- unresolved cases: `[]`
- case leaf counts: `{'R000:u=v': 1, 'R001:no_separator': 2, 'R002:u=v': 11, 'R003:u=v': 4, 'R004:u=v': 8, 'R005:u=v': 10, 'R006:u=v': 1, 'R007:u=v': 4, 'R008:u=v': 16, 'R009:u=s1': 3, 'R009:u=v': 33, 'R010:u=v': 6, 'R011:u=s1': 3, 'R011:u=v': 10, 'R012:u=v': 1, 'R013:u=v': 17, 'R014:u=v': 5}`

## Cases

| case | completions | leaves | leaf statuses | unresolved leaves |
|---|---:|---:|---|---|
| `R000:u=v` | 1 | 1 | `{'unit': 1}` | - |
| `R001:no_separator` | 2 | 2 | `{'unit': 2}` | - |
| `R002:u=v` | 11 | 11 | `{'unit': 11}` | - |
| `R003:u=v` | 4 | 4 | `{'unit': 4}` | - |
| `R004:u=v` | 8 | 8 | `{'unit': 8}` | - |
| `R005:u=v` | 10 | 10 | `{'unit': 10}` | - |
| `R006:u=v` | 1 | 1 | `{'unit': 1}` | - |
| `R007:u=v` | 4 | 4 | `{'unit': 4}` | - |
| `R008:u=v` | 16 | 16 | `{'unit': 16}` | - |
| `R009:u=s1` | 3 | 3 | `{'unit': 3}` | - |
| `R009:u=v` | 33 | 33 | `{'unit': 33}` | - |
| `R010:u=v` | 6 | 6 | `{'unit': 6}` | - |
| `R011:u=s1` | 3 | 3 | `{'unit': 3}` | - |
| `R011:u=v` | 10 | 10 | `{'unit': 10}` | - |
| `R012:u=v` | 1 | 1 | `{'unit': 1}` | - |
| `R013:u=v` | 17 | 17 | `{'unit': 17}` | - |
| `R014:u=v` | 5 | 5 | `{'unit': 5}` | - |
