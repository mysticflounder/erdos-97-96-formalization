# B1 post-MEC consult — working checkpoint

Consult: `01M1KN4B72QCVYTQQ0SG039DFS`

## Established boundary

The current fully eliminated gauge system has 36 point-coordinate variables and stage totals 193/481/481. Its 120-second PIQD outcomes are all `UNKNOWN`; there is no model, UNSAT core, or theorem evidence. Repeating the same formulation at a longer timeout is therefore deprioritized.

The exact row/order surface without the MEC/nonobtuse packet is satisfiable, even with three completed four-point rows and strict convexity. Thus any proof must use the MEC packet or later deletion/minimality provenance.

## Algebraic observation

With `A=(0,0)`, `s=(1,0)`, `o1=(u,v)`, `v>0`, and circumcenter height `m`, the boundary relation is

```text
2 v m = u^2-u+v^2.
```

For any point `(x,y)` the MEC disk atom is

```text
x^2-x+y^2-2my <= 0,
```

or, after eliminating `m`,

```text
v*(x^2-x+y^2) <= y*(u^2-u+v^2).
```

For the six physical points on one A-centered circle, introduce a shared squared radius `R2` and retain `m`. Their disk atoms become

```text
R2 - x_i - 2 m y_i <= 0,
```

while their circle equations are `x_i^2+y_i^2=R2`. This hybrid formulation stays quadratic. Full MEC elimination raises the substituted disk expressions to total degree three. A useful next query should therefore compare the hybrid quadratic formulation, not repeat the cubic eliminated one.

## Parameterization assessment in progress

A tangent-half-angle parameterization saves physical-point coordinates, but clearing denominators in the blocker/completion row equations raises degree substantially. A more promising exact gauge is to normalize one known physical point rather than the MEC edge:

```text
A=(0,0), x5=(1,0).
```

This fixes the physical radius, keeps all physical disk atoms as half-space inequalities relative to the retained MEC center, and preserves degree two. It needs a separate direct/reflected orientation treatment but no angle-chart denominator split.

## Source-rich frontier

The current endpoint residual has no clean consumer. The most plausible additional source data are:

- first-apex-class versus outside-first-apex-fiber split for a named strict-cap live source;
- retained q/w-deletion survival, which supplies another selected-four witness;
- a route-specific canonical-deletion or blocker/cap-location packet;
- no-qfree/minimality constraints on named sources.

These facts are not all present in the frozen endpoint/MEC system. The consult should recommend a bounded branch query that adds one such source packet rather than another generic order wrapper.

## Pending exact audits

Requested from current-source agents:

1. literal applicability of `P97.N4d.SmallSReductions.disk_apexCircle_iff_halfplane` to each of the 18 disk atoms;
2. exact degree/variable comparison between Cartesian, tangent-half-angle, and dot/chord formulations;
3. the smallest source split with an existing clean consumer or a materially smaller metric cell;
4. a low-degree geometric consequence of the nonobtuse MEC triangle plus the six-point A-circle.
