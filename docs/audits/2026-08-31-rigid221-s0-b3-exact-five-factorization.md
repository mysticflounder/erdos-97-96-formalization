# Rigid221 S0 B3 exact-five factorization audit

**Date:** 2026-08-31

**Lane:** `rigid221-s0-b3-exact-five-factorization-20260831`

**Lane base:** `504a6bcf13a2920fc92e734861e2c7e1dd98f9d5`

**Status:** directed-edge computational boundary isolated; no B3 theorem closed

## Scope

This lane factors the archived 1,020-assertion exact-five QF_NRA probe into
source-traceable monotone prefixes.  It corrects the active source order to the
two cases actually supplied by the prose specification:

```text
u, v, xu
xu, v, u
```

The archived `v, u, xu` cell remains only as a byte-regression target.  It is
not an active source cell.

The factorization preserves the full 1,020-assertion formula byte for byte and
separates it into blocks of sizes

```text
9, 78, 13, 13, 13, 19, 143, 72, 330, 330.
```

The generated factor manifest records every included and omitted block for all
14 cumulative cells.  Static validation also checks the archived full formula,
the two corrected full-order formulas, parser assertion counts, and absence of
pseudo-Boolean operators.

## PiQD wave

All solver calls used fresh sessions in an isolated PiQD daemon with at most 20
workers.  Z3 4.17.0 received a requested timeout of 30,000 ms for each of the
14 cumulative cells.  The six common prefixes were SAT:

| Last block | Assertions | Status | Solve time |
|---|---:|---|---:|
| gauge | 9 | SAT | 0 ms |
| role distinctness | 87 | SAT | 1 ms |
| physical fiber | 100 | SAT | 2 ms |
| source fiber | 113 | SAT | 3 ms |
| opposite fiber | 126 | SAT | 5 ms |
| Moser disk | 145 | SAT | 39 ms |

Adding the complete 143-assertion cyclic-order block produced UNKNOWN for both
source orders after about 30 seconds.  Every larger cumulative cell was also
UNKNOWN, so those later results do not localize any further transition.

cvc5 1.3.3 independently returned UNKNOWN for the same two 288-assertion order
cells after about 30 seconds.  This shows that the coarse boundary is not only
a Z3 presentation artifact.  It does not establish satisfiability or
unsatisfiability of either order cell.

The durable `receipt.json` authenticates solver versions, worker digests,
session identifiers, formula-base digests, result digests, timeouts, and solve
times.  PiQD recorded an effective deadline of 60,000 ms while the requested
timeout and observed solver runtimes were about 30,000 ms; both fields are kept
in the receipt.

## Boundary interpretation

The first unresolved addition is exactly the cyclic-order block:

```text
145-assertion Moser-disk prefix: SAT
+ 143 strict turn inequalities: UNKNOWN
```

This is a tractability boundary, not a contradiction.  In particular, SAT for
the reduced prefix cannot be used as a witness for the full B3 cell, and UNKNOWN
cannot be promoted into a mathematical claim.

The order block consists of 13 directed cyclic edges with 11 turn inequalities
per edge.  Its source-centered part is the four-edge arc

```text
m1 -> first -> v -> second -> m2,
```

where `(first, second)` is `(u, xu)` or `(xu, u)`.  The next bounded wave must
add these edge blocks monotonically in their original cyclic emission order.
This preserves formula bytes and can distinguish a source-midpoint bottleneck
from one of the two outer Moser arcs.  A reduced edge selection is a control;
source provenance alone does not assert all 11 global turn inequalities on an
edge.

## Directed-edge successor

Run `run-0002` splits the cyclic-order block into its 13 directed edges, with
11 strict turn inequalities per edge.  It emits 26 monotone cells: prefixes of
one through thirteen edges for each source-correct order.  Static validation
checks assertion counts from 156 through 288 and reproduces both parent
288-assertion formulas byte for byte at the endpoints.

The complete 26-cell Z3 profile found the same pattern in both orders:

```text
145-assertion Moser-disk prefix
+ 11 turns for O -> au:  SAT
+ 11 turns for au -> av: UNKNOWN
```

The first-edge cells were SAT in about 0.13 seconds.  The two-edge cells were
UNKNOWN at the requested 30-second timeout.  cvc5 also returned UNKNOWN for
both two-edge cells; it reached PiQD's recorded 60-second daemon deadline.
Thus the 143-assertion boundary is now narrowed to the second directed edge,
`au -> av`.

The initial all-cell profile used a PiQD daemon whose journal root still named
`run-0001`.  Its statuses were retained only as a layout pilot and are excluded
from durable acceptance.  The four decisive Z3 cells and both cvc5 checks were
replayed in fresh sessions under `run-0002/tmp/piqd-data`.  The authoritative
receipt names only those correctly rooted sessions and records the pilot as
non-authoritative.

This remains a tractability result.  The edge `au -> av` is part of the fixed
cyclic-order control; source provenance does not independently supply all 11
turn inequalities against the other modeled points.

## Conclusion

Run `run-0001` replaces an uninformative full-formula timeout with one precise
coarse boundary, and `run-0002` narrows that boundary from 143 assertions to the
11 turns attached to `au -> av`.  Neither run closes B3 or creates a Lean
ingress.  The highest-leverage continuation is an immutable successor that adds
those 11 turns one at a time in their original emission order.
