# Profile-282 K2 order-core formalization

Date: 2026-09-03

Status: standalone Lean formalization kernel-checked and independently
certified.

## Discovery

The governed profile-282 named-assumption run returned a five-atom Z3 core for
the authenticated mirror-order formula:

```text
normalization-000  row-009  area-059  area-144  area-244
```

In source roles, `row-009` places `v` on the `K2` circle centered at `c2`
through `O`; `area-059` is the strict turn `B,O,v`; and `area-244` is the
strict turn `c2,O,v`. The normalization fixes
`B=(0,0)`, `O=(1,0)`, and `c2=(3/2,-r)` with `r>0`.

The equation `4*r^2-3=0` and `area-144`, which says `r+y_v>0`, are not needed.
Writing `t=1-x_v`, the `c2` circle equation becomes

```text
t^2 + t + y_v^2 + 2*r*y_v = 0.
```

The two retained turns give `y_v>0` and
`r*t-y_v/2>0`, hence `t>0`; every displayed term is then nonnegative and at
least two are positive.

## Reuse preflight

The exact candidate was searched once in the repository's indexed Lean corpus
at source revision `05eee6511`. The closest result was
`Geometry.normalizedFivePoint_orientation_incompatibility`, but it needs a
different twelve-premise circumdisk configuration and does not directly
supply this four-fact circle obstruction. The existing `pt`, squared-distance,
and signed-area coordinate helpers remain reusable.

## Scope and consumer

The immediate computational consumer is the profile-282 mirror-order cell.
The intended eventual source consumer is the exact-grid arm below
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`.
Formalizing this standalone obstruction does not establish that the live
source packet exposes the required profile aliases, does not eliminate the
direct-order cell, and does not close that broad endpoint.

The role name `B` must be interpreted through each authenticated profile: it
is the `c1`/`K1` center. In profile 282 specifically, `c1=U=c000`, so `B=U`
there. That identification is profile-local and must never be assumed for a
different profile without checking its role map.

## Lean result

`Profile282K2OrderCore.lean` proves the obstruction first for every center
`(1+s,-r)` with `s,r>0`, then specializes to `(3/2,-r)`. It also provides the
reflected upper-right forms with both turns negative, matching the geometric
shape expected from the authenticated direct order.

The new normalized theorem
`normalized_twoEquilateralCircle_opposedTurns_false` and its coordinate-free
consumer `twoEquilateralCircle_opposedTurns_false` both pass focused
`lake env lean` builds. An independent audit checked both declarations and
reported only `propext`, `Classical.choice`, and `Quot.sound`; there is no
admitted or external computational trust in these lemmas.

## Authenticated formula-scope mine

The governed mine covered all 2,798 authenticated profiles. Its structural
filter retained 558 profiles. Among those, 34 profiles had SAT-bearing engine
cells, comprising 56 SAT cells. Exactly 50 of those cells match the opposed-
turn obstruction. The obstruction rejects every SAT cell for 28 profiles.

Six formula/profile-scope residuals remain:

```text
360  363  376  467  470  483
```

These counts concern the authenticated formulas and their engine cells. They
do not establish a source bridge, wire the broad
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence` consumer,
or close its `sorry`.

## Next governed work

Produce a durable mine/adapter for the six residual profiles. It must bind the
authenticated formula inputs, preserve per-engine SAT-cell custody, replay any
survivors, and keep formula/profile conclusions separate from live-source and
Lean closure claims. Source wiring of the broad five-incidence consumer comes
only after that residual adapter and a separate bridge audit.
