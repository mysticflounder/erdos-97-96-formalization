# Source and encoding map

## Fixed input

The sole structural signature is the 17-label table in `input.json`. Its 13
listed selected supports are interpreted only as four points equidistant from
the listed image center. The blocker map and the P/Pρ incidence labels are
retained for provenance but are not otherwise encoded as metric constraints.

The recorded P/Pρ facts are:

- `LPρ.fresh = 4` and `MPρ.collisionSource = 1`;
- `LP.fresh = 1` and `MP.collisionSource = 4`;
- K0 omits 4 and K10 omits 1;
- centers 0 and 10 are distinct.

Only the final distinctness fact is enforced metrically, as part of global
pairwise distinctness. In particular, omission is not converted into an
off-circle inequality.

## Metric clauses

- 34 real coordinate variables for p0,...,p16.
- Gauge p0=(0,0), p1=(1,0).
- One existential `delta > 0` and 136 pairwise squared-distance lower bounds.
- Three equal-radius equations for each of 13 selected rows: 39 equations.

This realizes exact center/support and support/support distinctness. It does not
claim that the four listed points are the complete circle support.

## Omitted live structure

Common-deletion survival at apex 12 and global minimality are omitted, as are
anonymous rows, carrier-wide K4, cap composition, cyclic/boundary order,
strict convexity, exact off-support facts, Moser/no-(m,4,4), universal ingress,
coverage of other signatures, and a general-cardinality lift.

No theorem-free relaxation cut was admitted. Therefore a jointly replayed
UNSAT would concern this finite selected-row packet, while SAT is only
`SAT-abstraction`. UNKNOWN has no directional content.
