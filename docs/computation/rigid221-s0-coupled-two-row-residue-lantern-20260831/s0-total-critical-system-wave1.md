# Rigid221 S0 total critical-shell-system geometric model

**Status:** `SAT_EXACT_TOTAL_CRITICAL_SHELL_SYSTEM_GEOMETRIC_MODEL`

**Arithmetic:** exact `fractions.Fraction`; no solver invoked

**Claim boundary:** exhaustive only for the displayed 28-role finite geometry

## Exact carrier geometry

The carrier has `28` pairwise distinct strictly convex roles. The minimum edge/nonincident orientation is `46898077558600000000000000000/8562534250001198754795000041956417825000308251233` at `['a1', 'a2', 'a3']`. Its exact MEC boundary is `['O', 'delta', 'xv']` and the recomputed cap cards are `(8,10,13)`.

## Seven complete critical rows

| Row | Center | Complete support | Radius squared |
|---|---|---|---:|
| A | `fw` | `{a1,a2,a3,cu}` | `234490387793/342501370000` |
| B | `fp` | `{b1,b2,b3,cv}` | `5498853749190441/8057385015812500` |
| C | `delta` | `{c1,c2,c3,s}` | `6817/6850` |
| Ku | `cu` | `{q1,q2,u,xu}` | `1309933/3970000` |
| Kv | `cv` | `{r1,r2,v,xv}` | `3214746049/8057312500` |
| Kdelta | `xu` | `{d1,d2,d3,delta}` | `80656/54389` |
| F1 | `xv` | `{O,fp,fq,fw}` | `1/1` |

The seven four-point supports are pairwise disjoint and partition all 28 carrier roles. Every source is assigned to its unique support's center. Deleting that source leaves maximum positive-distance multiplicity at most three at the assigned center, replaying the finite `no_qfree` predicate.

The blocker orbit is `u -> cu -> fw -> xv -> cv -> fp -> xv`, with cycle `xv -> cv -> fp -> xv`.

## Centerwise four-point census

Exactly `8` centers satisfy the modeled `HasNEquidistantPointsAt 4` predicate: `['O', 'cu', 'cv', 'delta', 'fp', 'fw', 'xu', 'xv']`. The other `20` do not. Thus the modeled carrier does not satisfy global `D.K4`.

## Supplied-value discrepancies

- `cap cardinalities (C1,C2,C3)`: supplied `{'C1': 8, 'C2': 7, 'C3': 16}`, observed `{'C1': 8, 'C2': 10, 'C3': 13}`. The retained L3 caps are (5,10,7); c1-c3 enter C1 and a1-a3,b1-b3 enter C3, so the exact extension is (8,10,13)
- `Kdelta complete-fiber center`: supplied `fq`, observed `xu`. d1,d2,d3 are retained as rotations of delta about xu; their exact complete four-fiber is centered at xu, while fq has maximum positive-distance multiplicity one

## Claim boundary

The current Lean source contract was read directly: `CriticalShellSystem` has total dependent `shellAt` and `no_qfree` fields, with each selected row carrying a complete named four-point radius class. This artifact models all of those finite geometric predicates, but it does not elaborate or construct the typed Lean structure. `CounterexampleData`, `D.K4`, `D.Minimal`, the full theorem, and promotion remain false in the claim scope.
