# Exact-five profile 0034 common-obstruction formalization

Date: 2026-09-04

## Result

The scalar common obstruction mined from the direct and mirror profile-0034
cells is now proved in
`Erdos9796Proof.P97.Census554.ExactFiveProfile0034CommonObstruction`.
The module exports:

- `Profile0034.normalized_first_chain_obstruction`, which forces the normalized
  point `s` strictly left and below the equilateral anchor; and
- `Profile0034.normalized_common_obstruction`, which derives `False` from the
  common scalar core;
- `Profile0034.normalized_euclidean_common_obstruction`, which transports the
  scalar result to ordinary signed areas and distances in the standard
  Euclidean equilateral frame; and
- `Profile0034.euclidean_common_obstruction`, which transports the result from
  an arbitrary negatively oriented equilateral frame by `normSim`;
- `Profile0034.euclidean_common_obstruction_opposedProducts`, which removes
  the frame-orientation choice; and
- `Profile0034.boundaryOrder_common_obstruction`, which packages the seven
  retained turns from increasing convex-boundary positions.

The terminal theorem uses seven strict signed-area inequalities and four
quadratic metric equations. It does not carry the other thirty-seven physical
supporting-edge assertions from the block-deletion result.

## Proof structure

Normalize the equilateral frame to

```text
U = (0, 0), O = (1, 0), a = (1/2, -1/2),
qdist X Y = (X₀-Y₀)² + 3(X₁-Y₁)².
```

The turns at `U,p,a` and the `O`-circle equation for `p` imply `py < 0`,
`px + py < 0`, and `px > 0`; the discarded turn at `U,p,O` is therefore
derived rather than assumed. A polynomial combination of the turn at the
edge `p,s` with the `p`-circle equation gives a strict linear inequality in
`sx - 1/2` and `sy + 1/2`. The unit ellipse for `s` then forces both terms to
be negative.

The bisector equation at `c` reduces to `cx + 3cy = 0`. The turns at `U,p,c`
and `d,c,U` force `cy < 0` and `dx + 3dy < 0`. The `d`-circle equation gives

```text
dx + 3dy + 1 = (dx-1/2)² + 3(dy+1/2)² >= 0.
```

Together with the retained turn at `a,d,c`, this forces `dx + dy > 0`; the
discarded turn at `a,d,U` is also derived rather than assumed. Finally, the
same circle equation proves the polynomial identity

```text
4 dx cross(a,d,s)
  = (dx+dy) (3(dx-dy)(sy+1/2) - (dx+3dy)(sx-1/2)).
```

The left side is positive while the two first-chain inequalities make the
right side negative.

## Verification and trust

A focused command

```text
lake env lean Erdos9796Proof/P97/Census554/ExactFiveProfile0034CommonObstruction.lean
```

exits zero with no diagnostics. After sharpening to the seven-turn residue,
the focused wall time is 12.9 seconds. Independent adversarial review checked
the coordinate scaling, `normSim` transport, orientation reflection, and
convex-boundary wrapper; a final review of the sharpened scalar assumption set
is recorded with this checkpoint.
`#print axioms` reports only `propext`, `Classical.choice`, and `Quot.sound`;
there is no `sorryAx`, custom axiom, native computation, or unsafe declaration.

## Scope boundary

This is a proved and audited coordinate-free geometric theorem. It is not yet
consumer-reachable: the module is not imported by the live closure path, and
the live packet does not presently supply the required named row points and
their boundary order. The sharpened theorem itself no longer mentions the
surplus apex: its role `U` may be instantiated by the blocker center `c₁`.
Thus the diagnostic alias `c₁ = surplus apex` is absent from the proved
geometric core.

Therefore
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence` remains
open. The next proof task is a source-backed role/order adapter. The
assertion-level PIQD deletion is a
separate diagnostic. It reached this seven-turn formula at its query cap and
did not establish deletion stability, minimality, or coverage of every live
continuation constructor and boundary order.
