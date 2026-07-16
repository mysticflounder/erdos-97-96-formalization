# Strict-oppCap1 directed three-cycle: exact negative result

## Result

Strict convex/Moser-cap order alone does **not** rule out the hard directed
three-cycle.  `DirectedCycleCountermodel.lean` gives an exact rational
nine-point configuration with boundary order

```text
o, left, q0, c0, c2, q1, c1, q2, right
```

and proves all of the following in Lean:

- every nonincident boundary point is strictly inside every directed boundary
  edge half-plane, and the resulting carrier is convex independent;
- `(o,left,right)` lies on a displayed circumscribed circle containing the
  whole carrier, and its three squared-side inequalities make it non-obtuse;
- `left,q0,q1,q2,right` have squared distance `1` from `o`, while each of
  `c0,c1,c2` has squared distance `1002001/1000000` from `o`;
- `c0,c1,c2` are pairwise distinct; and
- the exact directed cycle holds:
  `d(c0,q0)=d(c0,q1)`, `d(c1,q1)=d(c1,q2)`, and
  `d(c2,q2)=d(c2,q0)`.

The direct check

```bash
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/strict-oppcap-cross-classifier/directed-cycle-geometry/DirectedCycleCountermodel.lean
```

exits `0`.  Every printed declaration depends only on `propext`,
`Classical.choice`, and `Quot.sound`; none depends on `sorryAx`.

## Theorem-bank preflight

The required registries and indexed Lean corpus were searched before deriving
the model.  The closest banked declarations are:

- `blocker_centers_eq_of_five_le_of_mutual_cross_membership` (and its iff),
  which needs reciprocal membership for one pair;
- `Dumitrescu.perpBisector_apex_bound`, which also constrains several centers
  for one fixed pair; and
- the `six_point_five_circle_collision_*` / U5 kernels, which need additional
  exact-shell or global equality hypotheses.

None applies to the one-way three-pair cycle on cap order alone.

## Exact scope of the negative result

This is a cap-local Euclidean model, not a global Problem 97 counterexample.
It deliberately does **not** provide:

- `CounterexampleData` or the global `HasNEquidistantProperty`;
- selected-shell support for every carrier point;
- deletion-criticality;
- the K4/source-unit total critical map; or
- identification of `c0,c1,c2` as the globally selected blocker centers.

Therefore the cap-order-only subroute is closed negatively.  K-A-PAIR must use
one of those omitted global couplings.  The sharpest next target is a theorem
that transports selected-shell/deletion-critical data into an additional
cross-membership or shared-center equality; that is exactly the kind of input
the existing mutual-membership and same-pair theorem-bank entries can consume.
