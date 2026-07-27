# Two collision kites inside a genuine MEC cap

## Result

The minimum-enclosing-circle packet by itself does not exclude the two local
equal-distance collision kites occurring in the live A-TAIL leaf.

`search.py` fixes the unit disk and the equilateral boundary support triangle

```text
O  = ( 1, 0)
V2 = (-1/2,  sqrt(3)/2)
V3 = (-1/2, -sqrt(3)/2).
```

It then searches inside the open circular segment opposite `O` for two
reflection kites

```text
Oa = Ob,   ca = cb,
Ou = Ov,   du = dv.
```

At trial 21453 (seed 9796) it found a strictly convex nine-point configuration:

```text
a = (-0.6760244720924050, -0.4543070548242748)
b = (-0.7363563075456901,  0.0227970252890901)
c = (-0.7177363026771567, -0.2172150444419306)
u = (-0.7497708992289912,  0.5193928234646884)
v = (-0.7132261730170794,  0.6295420438259108)
d = (-0.7502823236858661,  0.5806994194138345)
```

All nine points are vertices of their convex hull, all lie in the unit disk,
and the six named kite points lie strictly in the cap opposite `O`.
Consequently the unit disk really is the minimum enclosing disk, witnessed by
the equilateral boundary triangle, while both collision-kite equalities hold.

Reproduce with:

```bash
uv run python scratch/mec-two-kite-search/search.py
```

## Epistemic boundary

This is a floating-point exploratory witness, not a Lean theorem and not a
full model of the target hypotheses.  The distance equalities hold by the
reflection construction; strict cap containment and convex-hull membership
are checked numerically with positive margins.

It does not supply exact four-point selected classes, a critical shell row at
every carrier point, the global per-vertex K4 property, minimality, `noM44`,
or the complete tri-apex robust residual.  Its use is negative and local: an
argument that only combines the genuine MEC packet with the two collision
kites cannot close the live leaf.  A successful closer must spend additional
global shell, minimality, or tri-cap structure.
