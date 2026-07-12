<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Stable zero-extension one-center cores

Generated `2026-07-10T19:57:21.916882+00:00`.

Each listed dangerous row is already UNSAT before DFS: either the
fixed pinned and dangerous exact rows are incompatible, or at least
one ambient center has no compatible locally admitted K4 support.
This is still an incidence
shadow; the rejection atoms must be matched to proved Lean lemmas
before the pattern can be formalized.

Cores: `2888`.

## Signatures

| n | dangerous type | blocker region | core kind | reason / empty-center roles | rows |
|---:|---|---|---|---|---:|
| 11 | `(0, 0, 2, 2)` | `O2` | `fixed-pair` | `cross-separation:dangerous` | 48 |
| 11 | `(0, 0, 2, 2)` | `O2` | `fixed-pair` | `overlap>2:dangerous` | 24 |
| 11 | `(0, 0, 2, 2)` | `O1` | `one-center-domain` | `Moser-2` | 72 |
| 11 | `(0, 2, 0, 2)` | `S` | `fixed-pair` | `cross-separation:dangerous` | 48 |
| 11 | `(0, 2, 0, 2)` | `S` | `fixed-pair` | `overlap>2:dangerous` | 24 |
| 11 | `(0, 2, 0, 2)` | `S` | `one-center-domain` | `Moser-2` | 72 |
| 12 | `(0, 0, 2, 2)` | `O2` | `fixed-pair` | `cross-separation:dangerous` | 120 |
| 12 | `(0, 0, 2, 2)` | `O2` | `fixed-pair` | `overlap>2:dangerous` | 40 |
| 12 | `(0, 0, 2, 2)` | `O1` | `one-center-domain` | `Moser-2` | 160 |
| 12 | `(0, 2, 0, 2)` | `S` | `fixed-pair` | `cross-separation:dangerous` | 180 |
| 12 | `(0, 2, 0, 2)` | `S` | `fixed-pair` | `overlap>2:dangerous` | 60 |
| 12 | `(0, 2, 0, 2)` | `S` | `one-center-domain` | `Moser-2` | 240 |
| 13 | `(0, 0, 2, 2)` | `O2` | `fixed-pair` | `cross-separation:dangerous` | 240 |
| 13 | `(0, 0, 2, 2)` | `O2` | `fixed-pair` | `overlap>2:dangerous` | 60 |
| 13 | `(0, 0, 2, 2)` | `O1` | `one-center-domain` | `Moser-2` | 300 |
| 13 | `(0, 2, 0, 2)` | `S` | `fixed-pair` | `cross-separation:dangerous` | 480 |
| 13 | `(0, 2, 0, 2)` | `S` | `fixed-pair` | `overlap>2:dangerous` | 120 |
| 13 | `(0, 2, 0, 2)` | `S` | `one-center-domain` | `Moser-2` | 600 |

## Fixed-pair reasons

### `(0, 0, 2, 2)`

- `cross-separation:dangerous`: `408` rows
- `overlap>2:dangerous`: `124` rows

### `(0, 2, 0, 2)`

- `cross-separation:dangerous`: `708` rows
- `overlap>2:dangerous`: `204` rows

## Empty-domain candidate rejections

### `(0, 0, 2, 2)`

- `Q3:pinned + cross-separation:dangerous`: `1224` candidates
- `Q3:pinned + overlap>2:dangerous`: `372` candidates
- `cross-separation:dangerous`: `5844` candidates
- `overlap>2:dangerous`: `2820` candidates

### `(0, 2, 0, 2)`

- `Q3:pinned + cross-separation:dangerous`: `2124` candidates
- `Q3:pinned + overlap>2:dangerous`: `612` candidates
- `cross-separation:dangerous`: `10404` candidates
- `overlap>2:dangerous`: `4860` candidates

