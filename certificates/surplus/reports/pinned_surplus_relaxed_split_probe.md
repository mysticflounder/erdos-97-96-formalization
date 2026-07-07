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
- max depth: 8
- timeout seconds: 20

## Summary

- relaxed rows: 15
- probe cases: 17
- leaves: 63
- leaf status counts: `{'unit': 63}`
- unresolved cases: `[]`
- case leaf counts: `{'R000:u=v': 1, 'R001:no_separator': 1, 'R002:u=v': 6, 'R003:u=v': 3, 'R004:u=v': 6, 'R005:u=v': 7, 'R006:u=v': 1, 'R007:u=v': 3, 'R008:u=v': 4, 'R009:u=s1': 2, 'R009:u=v': 13, 'R010:u=v': 2, 'R011:u=s1': 1, 'R011:u=v': 6, 'R012:u=v': 1, 'R013:u=v': 4, 'R014:u=v': 2}`

## Cases

| case | completions | leaves | leaf statuses | unresolved leaves |
|---|---:|---:|---|---|
| `R000:u=v` | 1 | 1 | `{'unit': 1}` | - |
| `R001:no_separator` | 2 | 1 | `{'unit': 1}` | - |
| `R002:u=v` | 11 | 6 | `{'unit': 6}` | - |
| `R003:u=v` | 4 | 3 | `{'unit': 3}` | - |
| `R004:u=v` | 8 | 6 | `{'unit': 6}` | - |
| `R005:u=v` | 10 | 7 | `{'unit': 7}` | - |
| `R006:u=v` | 1 | 1 | `{'unit': 1}` | - |
| `R007:u=v` | 4 | 3 | `{'unit': 3}` | - |
| `R008:u=v` | 16 | 4 | `{'unit': 4}` | - |
| `R009:u=s1` | 3 | 2 | `{'unit': 2}` | - |
| `R009:u=v` | 33 | 13 | `{'unit': 13}` | - |
| `R010:u=v` | 6 | 2 | `{'unit': 2}` | - |
| `R011:u=s1` | 3 | 1 | `{'unit': 1}` | - |
| `R011:u=v` | 10 | 6 | `{'unit': 6}` | - |
| `R012:u=v` | 1 | 1 | `{'unit': 1}` | - |
| `R013:u=v` | 17 | 4 | `{'unit': 4}` | - |
| `R014:u=v` | 5 | 2 | `{'unit': 2}` | - |
