# Rigid221 S0 common-core and theorem-extraction audit

**Date:** 2026-08-30  
**Lane:** `rigid221-s0-common-core-20260830`  
**Status:** computational extraction complete; coordinate-level Lean helper pending

## Purpose

This lane preserves the exact PiQd fixed-cell evidence, constructs an
occurrence-indexed assertion ledger, separates the S0-I/S0-N common and
branch-only packets, and uses fresh PiQd sessions to mine the smallest
source-indexed contradiction available from the bounded cells.

The tracked generator `scripts/rigid221_s0_full_l1.py` still regenerates the
two 1,365-assertion frozen inputs byte-for-byte:

| Cell | SHA-256 |
|---|---|
| S0-I | `708bf91a0afb0a573b7fb33da517296bfd47e52acea6b8f1040c6660f1f0adcf` |
| S0-N | `d91c12d084ec6d7313607152519e18d463220c0bd7dec1eb24eb5ef90583c7a7` |

The generator SHA-256 is
`0b131fda6cd4f10ec678e747bff9377405b6e529321169d9db7751669ff3b174`.

## Correction to the prior canary description

The prior decisive SMT files remain strict subsets of their frozen source
cells. Their PiQd z3/nlsat `UNSAT` verdicts therefore still imply `UNSAT` for
those two frozen fixed cells by conjunction monotonicity.

Their semantic description as retained-role-only formulas was incorrect:

| Audit item | S0-I | S0-N |
|---|---:|---:|
| Prior assertions | 217 | 208 |
| Prior orientation assertions | 156 | 156 |
| Truly retained-role orientations | 30 | 30 |
| Auxiliary-role orientation leaks | 126 | 126 |
| Auxiliary cap clauses | 9 (`cu`, `cv`, `au`) | 0 |

The orientation filter collected names only from the retained-role set, so its
subset test could not detect auxiliary names. The S0-I cap-index construction
also selected three clauses each for `cu`, `cv`, and `au`; the later S0-N
builder used the intended five physical roles.

Consequently, the established bounded result is:

```text
the two exact, source-copied prior canary conjunctions are UNSAT;
therefore their corresponding frozen fixed cells are UNSAT.
```

It does not yet establish that the physical/Moser retained-role geometry alone
is contradictory. This lane retains the exact old inputs as
`legacy_decisive` evidence and separately constructs a symmetric
`retained_only` control.

## Corrected symmetric control

For each cell the corrected surface retains:

- source assertions 0--8 (fixed coordinates and positive radii);
- the five physical O-fiber equalities at indices 109, 112, 115, 118, 121;
- MEC enclosure indices 142--149;
- Moser boundary/dot indices 156--161;
- cap endpoint indices 330--338;
- physical-role cap indices 339--353; and
- only orientation assertions whose complete role set is contained in
  `{O,m1,m2,u,xu,delta,v,xv}`.

This gives 82 assertions per cell, including 30 orientations. After replacing
only the cell-specific symbol prefix for comparison, the occurrence census is:

```text
COMMON = 68
I_ONLY = 14
N_ONLY = 14
```

These are bookkeeping counts, not solver verdicts.

## PiQd decisions and minimization

Every decision and deletion trial used a fresh PiQd SMT session with Z3
4.17.0 (`b7a02cb...f5a9a`). The runner checked the exact journal byte count,
command count, SHA-256, solver identity, status, and single receipt before
closing each session. `UNKNOWN` never licensed deletion.

| Packet | Assertions | PiQd result | Exact journal SHA-256 |
|---|---:|---|---|
| corrected `COMMON` | 68 | `UNSAT` | `473922d0...090a67` |
| legacy `COMMON` | 170 | `UNSAT` | `903dbcec...022d1e` |
| first corrected shrink | 14 | authenticated `UNSAT`; not yet minimal | `f028d9de...e474e` |
| second corrected shrink | 12 | locally irredundant `UNSAT` | `b9483a6e...c5e0f2` |

The first shrink used 83 calls and retained 14 clauses. Its late necessity
replay found two clauses still removable after earlier `UNKNOWN` results, so
the runner correctly labeled that pass
`NECESSITY_INCONSISTENT_FAIL_CLOSED`. A second pass started from those exact
14-clause bytes, removed both clauses on authenticated `UNSAT`, and replayed
all twelve single-clause omissions as `SAT`. It used 27 calls and ended
`MINIMIZED_UNSAT` with `locally_irredundant = true`.

Removing only the three Z3-specific option commands gives the 44-command
cvc5 journal `778a2a99...aa5f86`. PiQd/cvc5 1.3.3 returned `UNKNOWN` at its
330-second daemon deadline. This is neutral cross-check evidence: it neither
confirms the Z3 result nor supplies a model.

The complete receipts and full per-call records are in
`certificates/rigid221_s0_common_core_v1/`. `PIQD_SHA256SUMS` authenticates
the promoted solver evidence separately from the deterministic extraction
bundle.

## Twelve-clause contradiction

The final common packet uses source assertions

```text
0, 3, 4, 5, 115, 118, 148, 156, 158, 198, 213, 349.
```

Only the roles `O`, `m1`, `m2`, `delta`, and `v` occur. Write

```text
O = (O_x,O_y),  m1 = (a,-4/5),  m2 = (8/5,4/5),
v = (x,y),      delta = (d,e).
```

The fixed and boundary clauses give `O = (0,0)` and
`(1-a)^2 = 9/25`, hence `a` is `8/5` or `2/5`. Define

```text
D1 = det(O-v,m1-v) = 4*x/5 + a*y,
D2 = det(O-m2,m1-m2) = 32/25 + 4*a/5.
```

In the two cases for `a`, `D2` is respectively `64/25` or `8/5`, so
`D2 > 0`. The retained cap clause `D1 * D2 <= 0` therefore yields
`D1 <= 0`.

Let `r^2 = x^2+y^2`. Disk containment gives `r^2 <= 2*x`, while the two
O-fiber equalities give `||delta||^2 = ||v||^2 = r^2`. The first strict
orientation gives `det(delta,v) < 0`, so `r^2 > 0`. Put

```text
c = dot(delta,v)/r^2,
s = -det(delta,v)/r^2.
```

Then `s > 0`, `delta = c*v + s*J(v)`, and `c <= 1`. With
`F = r^2 - dot(m1,v)`, the disk bound gives

```text
a = 8/5  ->  F <= D1/2 <= 0,
a = 2/5  ->  F <= 2*D1 <= 0.
```

A direct determinant expansion now gives

```text
det(m1-delta,v-delta) = (1-c)*D1 + s*F <= 0,
```

contradicting the packet's second strict orientation. This is the
human-readable contradiction to formalize. The PiQd necessity census says
each of the twelve SMT occurrences is load-bearing for this particular
packet; the prose proof also uses all twelve.

## Trust and promotion boundary

All solver results in this lane are bounded theorem-discovery evidence. The
source-level S0 branch and
`false_of_exactFourMutualOmissionRigid221_minimalCore` remain open. Promotion
would still require a proved source ingress, coverage of cyclic-order and
equality/overlap cells, remaining placement and q/w cases, and a kernel-checked
consumer.

The independent cvc5 timeout on the prior S0-I canary is neutral. A primary
core that cvc5 cannot replay will be retained as unauthenticated solver
evidence and will not be promoted.

## Lean reuse preflight

The closest terminal API is
`Problem97.ExactA2CapMetric.false_of_clearance_and_outside_hit`; it consumes a
strict clearance, an opposite-side condition, and a same-center equal-radius
equality. A3/A4 global-circle-wedge lemmas can produce clearance pairs from
positive fan parameters, exact fan identities, common-radius data, and strict
side/order hypotheses.

The present S0 packet does not itself supply the full fan identities or a
source-faithful global cap-order producer. These are the first missing
antecedents to check against any minimized core. MEC existence alone does not
supply them.

## Highest-leverage next theorem

Formalize the twelve-clause coordinate contradiction as a small helper over
real coordinates, then prove a source-ingress lemma that supplies its exact
hypotheses from the S0 fixed-order cell. The existing A2/A3/A4 APIs are not a
direct consumer: they require clearance, opposite-side, fan-identity, and
global-order hypotheses absent from this packet. The new helper should remain
explicitly fixed-cell until cyclic-order coverage and the other source cases
are proved.
