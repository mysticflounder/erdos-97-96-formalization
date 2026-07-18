# Complete-row-compatible period-three seed cell

Date: 2026-07-17

Status: **SOURCE ROLE/IDENTITY/ORDER AUDIT PASSES.  THE MODIFIED FULLY
DISJOINT 25-ROLE WORD IS EXACT QF_LRA SAT AND CONTAINS THE BANKED EXACT
RATIONAL ELEVEN-POINT COMPLETE-`b0`-ROW MODEL AS A STRICT CYCLIC
SUBSEQUENCE.  THIS IS A NUMERICAL SEED, NOT A FULL EUCLIDEAN/MEC/CSS
REALIZATION OR A PROOF.**

This lane owns only
`scratch/atail-force/period-three-seed-compatible-cell/`.  It did not edit
production Lean, shared docs, blueprint state, git, `ShellCurvature`,
`SurplusM44`, or protected lanes, and it ran no Lean/Lake/LSP command.

## Audit input

The numerical lane changed only the private first-block order of the earlier
fully-disjoint cell, moving `x0,y0` before `nI`.  The audited boundary word is

```text
first, t0s, nS,
second, x0, y0, q, w, t0i, t1i0, t1i1, t1i2, nI, x1, y1, x2, y2,
surplus,
c0, b0, b2, c1, b1, c2, t1o.
```

The source audit is downstream of the theorem-bank preflight and full role
census recorded in
`../period-three-full-role-identity-quotient/{REPORT.md,enumerate_schema.py}`.
No new local finite theorem was derived here.

## Source-role result

Every fixed choice is one explicitly enumerated legal branch:

| surface | chosen cell | audit |
| --- | --- | --- |
| first-apex arm | unequal radii, frontier `q,w = II` | enumerated |
| T0 | `3I+S` | enumerated |
| T1 | `3I+O` | enumerated |
| physical exact five | `3O+I+S` | enumerated |
| blockers | three fresh, distinct `O` roles | enumerated matching `(None,None,None)` |
| reverse targets | six fresh `I` roles, three disjoint pairs | six-block member of the 53 target partitions |
| cross-front identities | fully disjoint | legal partial-injection cell |
| orientation | displayed chirality only | legal fixed branch, not a coverage quotient |

The physical-cap word

```text
c0, b0, b2, c1, b1, c2, t1o
```

satisfies all three common-order requirements:

```text
c0 < b0 < c1,
c1 < b1 < c2,
c0 < b2 < c2.
```

The last relation is the non-obvious `c2--c0` edge.  It places `b2` between
the two incident sources in the single retained cap order.  No unsupported
blocker order or profile choice was found.

## Exact seed map

The eleven exact rational points from
`../cycle-one-target-kalmanson/verify_two_target_exact.py` map as follows:

| cell role | exact-model label |
| --- | --- |
| `second` | `o` |
| `x0,y0` | the two exact complete-row targets `x,y` |
| `nI` | `left` |
| `c0,c1,c2` | `q0,q1,q2` |
| `b0,b1,b2` | old centers `c0,c1,c2` |
| `nS` | `right` |

Their exact counterclockwise order is therefore the cyclic subsequence

```text
second, x0, y0, nI, c0, b0, b2, c1, b1, c2, nS.
```

Exact `Fraction` replay checks strict convexity, the physical class

```text
second : {nI,c0,c1,c2,nS},
```

the complete reverse row

```text
b0 : {c0,c1,x0,y0},
```

their named exclusions inside the eleven-point model, and the remaining
adjacent-source equalities at `b1,b2`.  The minimum exact strict-hull margin
is

```text
1715231162403 / 1193369583218474185 > 0.
```

The full coordinate values and the fourteen deliberately unassigned roles
are recorded in `SEED.json`.

## Exact QF_LRA validation

`audit_seed_cell.py` reuses the existing audited abstract-distance encoder;
it does not introduce a second encoding.  On the modified word, Z3 returns
SAT and the encoder independently substitutes the rational model into:

- every positive distance and strict triangle inequality;
- both strict Kalmanson inequalities for every cyclic quadruple;
- the T0/T1 selected-row equalities and unequal radii;
- the physical exact-five and all three reverse-row equalities;
- every named physical/reverse exact-support exclusion; and
- the required unequal `second` distances to `q,w`.

The replay reproduces the numerical lane's exact ledger:

```text
T0 radius          309
T1 radius          300
physical radius    197
reverse radii      213, 191, 213
second--q          198
second--w          201
minimum triangle margin   1
minimum Kalmanson margin  1
```

Replay:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/period-three-seed-compatible-cell/audit_seed_cell.py
```

## Boundary of the result

There is no unsupported order/profile choice in this fixed cell.  There is
also no full coordinate realization yet.  The exact seed assigns only eleven
of the 25 roles.  In particular, its auxiliary support triangle
`(second,nI,nS)` is **not** the live distinguished triangle
`(first,second,surplus)` of the 25-role cell.  The remaining roles—including
`first`, `surplus`, both first-apex rows, and the four targets completing
reverse rows 1 and 2—must still be inserted by the rank-two numerical lane.

Thus the result justifies using this word and exact complete-row geometry as
a source-compatible seed.  It does not claim that the QF_LRA ledger extends
the exact coordinates, that the remaining roles can be inserted in the
plane, that the live MEC/cap packet exists, or that the total critical map,
minimality, or any production `sorry` is closed.
