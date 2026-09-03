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

## Lean result

`Profile282K2OrderCore.lean` proves the obstruction first for every center
`(1+s,-r)` with `s,r>0`, then specializes to `(3/2,-r)`. It also provides the
reflected upper-right forms with both turns negative, matching the geometric
shape expected from the authenticated direct order. A focused `lake env lean`
check passes. `#print axioms` reports only `propext`, `Classical.choice`, and
`Quot.sound`; there is no admitted or external computational trust. An
independent adversarial audit certified the lower-right algebra, the four
mirror source-atom correspondences, and the stated consumer boundary. The
direct-order source-atom mapping still requires the successor PIQD wave and a
separate audit.
