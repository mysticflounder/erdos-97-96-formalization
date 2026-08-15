# Blocker-cycle / Kalmanson no-go

The existence of a cycle in `CriticalShellSystem.blockerVertex` does not by
itself supply a strict Kalmanson cycle.  There is an exact rational strictly
convex eight-point configuration containing a genuine two-cycle of critical
four-shells.

In cyclic order, take

```text
q  = (-1, 0)
a1 = (-13/17, 16/17)
a2 = (-3/5, 6/5)
a3 = (-1/5, 8/5)
p  = (1, 0)
b1 = (13/17, -16/17)
b2 = (3/5, -6/5)
b3 = (1/5, -8/5).
```

All eight consecutive cross products are strictly negative, so this order is
strictly convex.  The circle of squared radius `4` centered at `p` meets the
carrier exactly in `{q,a1,a2,a3}`.  After deleting `q`, every distance class at
`p` has size at most three.  Symmetrically, the circle of squared radius `4`
centered at `q` meets the carrier exactly in `{p,b1,b2,b3}`, and after deleting
`p` every distance class at `q` has size at most three.  Thus the two source
choices give `q -> p -> q`, and both chosen rows have the full critical-shell
semantics used by `CriticalShellSystem`.

The other six vertices are not asserted to extend this partial packet to a
full `CriticalShellSystem`.  Nevertheless, any proposed contradiction that
uses only `exists_blocker_cycle` and the critical rows attached to the cycle
vertices is false: this configuration realizes exactly that extracted data.
Additional ingress must use off-class-leaf information or rows at vertices
outside the extracted cycle.

Run `uv run python scratch/rigid221-sourceheavy-anchor/verify_blocker_two_cycle.py`
for an exact `Fraction` replay.
