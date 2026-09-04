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
  common core.

The terminal theorem uses eight strict signed-area inequalities and four
quadratic metric equations. It does not carry the other forty physical
supporting-edge assertions from the block-deletion result.

## Proof structure

Normalize the equilateral frame to

```text
U = (0, 0), O = (1, 0), a = (1/2, -1/2),
qdist X Y = (X₀-Y₀)² + 3(X₁-Y₁)².
```

The first four turns and the `O`-circle equation for `p` imply `py < 0`,
`px + py < 0`, and `px > 0`. A polynomial combination of the turn at the
edge `p,s` with the `p`-circle equation gives a strict linear inequality in
`sx - 1/2` and `sy + 1/2`. The unit ellipse for `s` then forces both terms to
be negative.

The bisector equation at `c` reduces to `cx + 3cy = 0`. The turns at `U,p,c`
and `d,c,U` force `cy < 0` and `dx + 3dy < 0`; the turn at `a,d,U` also gives
`dx + dy > 0`. Finally, the `d`-circle equation proves the polynomial identity

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

exits zero with no diagnostics. After bounding nonlinear tactics to explicit
premise lists, the focused wall time is 24.5 seconds; most of that time is the
standalone `Mathlib` import. An independent adversarial audit rechecked every
polynomial identity and sign transition and repeated the focused build.
`#print axioms` reports only `propext`, `Classical.choice`, and `Quot.sound`;
there is no `sorryAx`, custom axiom, native computation, or unsafe declaration.

## Scope boundary

This is a proved and audited low-level geometric theorem. It is not yet
consumer-reachable: the module is not imported by the live closure path, and
profile 0034 fixes aliases and a mirror role order that the live packet does
not presently supply. In particular, the live packet does not prove the
diagnostic alias `c₁ = U`.

Therefore
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence` remains
open. The next proof task is a coordinate-free wrapper followed by a
source-backed role/order adapter. The assertion-level PIQD deletion is a
separate diagnostic for checking whether the eight retained turns are also
minimal among the submitted physical assertions.
