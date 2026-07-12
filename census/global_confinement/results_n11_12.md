<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Global confinement incidence probe

Generated `2026-07-10T10:20:57.034861+00:00`.

## Scope

This is an exhaustive finite search over the declared `(m,4,4)`
selected-class incidence shadow. Each scenario includes one compatible
four-class at every ambient center, the pinned exact class, the marked
dangerous exact class through `q`, the two-circle overlap bound, cyclic
cross-separation, Q3 joint cuts, and the L2/PROVEN local row kills.

It does **not** encode coordinates, distance equations, or the full
`CriticalShellSystem`. `SAT` therefore means only that these incidence
constraints permit the pattern. `UNSAT` is conclusive only for this
shadow, and capped searches are reported as `INDETERMINATE`.

The fixed pin is one orientation; the `(m,4,4)` profile has the reflected
orientation by exchanging the two short caps.
Each checkpoint fixes the first two surplus-interior labels as the pinned
source and deleted point. A result is therefore exhaustive for that
canonical adjacent labeled placement, not for every cyclic placement of
the ordered pair.

## Results

| n | dangerous rows admitted | packet frames | q-critical row tests | all-row survival | rowwise confinement |
|---:|---:|---:|---|---|---|
| 11 | 364/564 | 7280 | S 2654 / U 622 / I 0 | S 3933 / U 3347 / I 0 | S 0 / U 7280 / I 0 |
| 12 | 709/935 | 24815 | S 6082 / U 1008 / I 0 | S 24815 / U 0 / I 0 | S 0 / U 24815 / I 0 |

`q-critical row tests` are individual-center compatibility checks;
they do not assert that all such exact rows occur simultaneously.
`all-row survival` and `rowwise confinement` do require simultaneous
classes at all six audit centers.

## Verdicts

- `n = 11`: existential survival `SAT`, universal survival `UNSAT`, existential confinement `UNSAT`, universal confinement `UNSAT`.
- `n = 12`: existential survival `SAT`, universal survival `SAT`, existential confinement `UNSAT`, universal confinement `UNSAT`.

## n = 11 imprints

Labels: `u = 0`, `v = 1`, `w = 2`; `intS = (3, 4, 5, 6)`, `intO1 = (7, 8)`, `intO2 = (9, 10)`. The pinned source is `3` and `q = 4`.

### By blocker

| blocker | dangerous admitted | survival S/U/I | q-critical S/U/I |
|---:|---:|---:|---:|
| 0 | 36/46 | 496/224/0 | 256/68/0 |
| 2 | 3/3 | 47/13/0 | 24/3/0 |
| 3 | 42/65 | 554/286/0 | 333/45/0 |
| 5 | 42/65 | 511/329/0 | 307/71/0 |
| 6 | 39/65 | 349/431/0 | 279/72/0 |
| 7 | 62/80 | 527/713/0 | 436/122/0 |
| 8 | 55/80 | 466/634/0 | 382/113/0 |
| 9 | 42/80 | 492/348/0 | 303/75/0 |
| 10 | 43/80 | 491/369/0 | 334/53/0 |

### By dangerous-row type

| type | dangerous admitted | survival S/U/I |
|---|---:|---:|
| `(0, 0, 0, 4)` | 0/4 | 0/0/0 |
| `(0, 0, 1, 3)` | 13/24 | 40/220/0 |
| `(0, 0, 2, 2)` | 0/12 | 0/0/0 |
| `(0, 1, 0, 3)` | 9/12 | 100/80/0 |
| `(0, 1, 1, 2)` | 18/40 | 190/170/0 |
| `(0, 2, 0, 2)` | 0/12 | 0/0/0 |
| `(0, 2, 1, 1)` | 24/24 | 184/296/0 |
| `(0, 3, 0, 1)` | 11/12 | 146/74/0 |
| `(1, 0, 0, 3)` | 22/36 | 138/302/0 |
| `(1, 0, 1, 2)` | 46/84 | 294/626/0 |
| `(1, 1, 0, 2)` | 28/54 | 356/204/0 |
| `(1, 1, 1, 1)` | 42/60 | 590/250/0 |
| `(1, 2, 0, 1)` | 57/72 | 659/481/0 |
| `(1, 3, 0, 0)` | 7/9 | 123/17/0 |
| `(2, 0, 0, 2)` | 32/36 | 332/308/0 |
| `(2, 0, 1, 1)` | 16/24 | 238/82/0 |
| `Moser-0` | 36/46 | 496/224/0 |
| `Moser-2` | 3/3 | 47/13/0 |

The dangerous-row types with no full-center extension are `(0, 0, 0, 4)`, `(0, 0, 2, 2)`, `(0, 2, 0, 2)`. These are fixed-pin global elimination candidates, not yet general-`n` theorems.

## n = 12 imprints

Labels: `u = 0`, `v = 1`, `w = 2`; `intS = (3, 4, 5, 6, 7)`, `intO1 = (8, 9)`, `intO2 = (10, 11)`. The pinned source is `3` and `q = 4`.

### By blocker

| blocker | dangerous admitted | survival S/U/I | q-critical S/U/I |
|---:|---:|---:|---:|
| 0 | 64/76 | 2240/0/0 | 544/96/0 |
| 2 | 3/3 | 105/0/0 | 27/3/0 |
| 3 | 72/98 | 2520/0/0 | 648/72/0 |
| 5 | 72/98 | 2520/0/0 | 604/116/0 |
| 6 | 72/98 | 2520/0/0 | 604/116/0 |
| 7 | 72/98 | 2520/0/0 | 604/116/0 |
| 8 | 102/116 | 3570/0/0 | 864/156/0 |
| 9 | 100/116 | 3500/0/0 | 846/154/0 |
| 10 | 76/116 | 2660/0/0 | 657/103/0 |
| 11 | 76/116 | 2660/0/0 | 684/76/0 |

### By dangerous-row type

| type | dangerous admitted | survival S/U/I |
|---|---:|---:|
| `(0, 0, 0, 4)` | 16/16 | 560/0/0 |
| `(0, 0, 1, 3)` | 36/48 | 1260/0/0 |
| `(0, 0, 2, 2)` | 0/16 | 0/0/0 |
| `(0, 1, 0, 3)` | 21/24 | 735/0/0 |
| `(0, 1, 1, 2)` | 26/52 | 910/0/0 |
| `(0, 2, 0, 2)` | 0/24 | 0/0/0 |
| `(0, 2, 1, 1)` | 48/48 | 1680/0/0 |
| `(0, 3, 0, 1)` | 48/48 | 1680/0/0 |
| `(0, 4, 0, 0)` | 4/4 | 140/0/0 |
| `(1, 0, 0, 3)` | 66/72 | 2310/0/0 |
| `(1, 0, 1, 2)` | 72/108 | 2520/0/0 |
| `(1, 1, 0, 2)` | 39/72 | 1365/0/0 |
| `(1, 1, 1, 1)` | 50/72 | 1750/0/0 |
| `(1, 2, 0, 1)` | 120/144 | 4200/0/0 |
| `(1, 3, 0, 0)` | 36/36 | 1260/0/0 |
| `(2, 0, 0, 2)` | 44/48 | 1540/0/0 |
| `(2, 0, 1, 1)` | 16/24 | 560/0/0 |
| `Moser-0` | 64/76 | 2240/0/0 |
| `Moser-2` | 3/3 | 105/0/0 |

The dangerous-row types with no full-center extension are `(0, 0, 2, 2)`, `(0, 2, 0, 2)`. These are fixed-pin global elimination candidates, not yet general-`n` theorems.

A universal `SAT` verdict says every enumerated packet frame has a
witness in this shadow. It is not a proof that the corresponding
Lean producer holds. A universal `UNSAT` verdict identifies an
incidence-level obstruction that must be understood before pursuing
that producer.

The q-critical compatibility witnesses show that the current incidence
cuts do not eliminate the first producer subobligation. Survival SAT
rows identify frames with no selected-class incidence obstruction, while
survival UNSAT rows identify genuine shadow obstructions. Neither kind
proves the theorem-facing q-deleted classes exist. Finally, an all-UNSAT
confinement column revalidates the bounded finite consumer; it is not
evidence that confinement can be produced. Any closure route must use
additional consequences of minimality or the critical-shell system, or
turn those inputs directly into a contradiction.
