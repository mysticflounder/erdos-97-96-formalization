# Metric realizability probe

## Result

- Saved SAT assignments: **0**
- Unique metric row systems: **1**
- Systems selected in this run: **1**
- Systems completed: **1**

| Final status | Count |
|---|---:|
| UNKNOWN | 1 |

| Decisive stage | Count |
|---|---:|
| none | 1 |

## Formula ledger

Encoded exactly over the reals:

- the gauge `p0 = (0,0)` and `p1 = (1,0)`;
- all selected-row squared-distance equalities;
- pairwise distinctness of every ambient label;
- strict convexity in the cap frame's recorded cyclic order, using
  the left-half-plane condition for every oriented hull edge; and
- for every exact row, exclusion of each nonmember from its radius.
- for each declared MEC packet, a positive squared radius,
  its three apices on the boundary, every ambient point in
  the disk, and the three nonobtuse-triangle inequalities.

Before invoking QF_NRA, the probe deterministically closes row
equalities and checks for two distinct centers equidistant from the
same three labels. Such a duplicate-center core is reported as
`equality-duplicate-center` UNSAT. It is a structural consequence
of the selected rows and ambient-label distinctness, not a Z3 result.

The same prefilter also rejects an exact row when equality closure
forces a label outside its support onto that row's circle. Such a
witness is reported as `equality-exact-off-circle` UNSAT.

Equality closure also rejects four labels whose six pair distances
are all forced equal. Such a witness is reported as
`equality-equal-k4` UNSAT.

With strict convexity enabled, equality closure also rejects three
distinct labels forced onto the perpendicular bisector of the same
two distinct foci. Such a witness is reported as
`equality-perpendicular-bisector-convex` UNSAT.

Finally, equality closure rejects a cyclic five-label pattern
`a,x,b,c,y` when `x,y` are equidistant from `a,b` and `c` is
equidistant from `b,x,y`. Such a witness is reported as
`equality-convex-five-point` UNSAT.

Equality closure finally rejects a cyclic six-label pattern
`a,b,c,x,y,d` consisting of an equal-sided quadrilateral
`a,b,c,d` and the equilateral triangles `b,c,y` and `x,d,a`.
Such a witness is reported as
`equality-convex-rhombus-equilateral` UNSAT.

Not encoded:

- the quantified minimum-radius clause and other global
  geometric hypotheses outside the declared MEC packet; and
- any selected radius classes not represented by a saved row.

Therefore `UNSAT` soundly excludes a saved incidence assignment even
under this relaxation. `SAT` establishes only row-level realizability
and is not a Problem 97 configuration. `UNKNOWN` is no verdict. Z3
QF_NRA outcomes are trusted computations, not Lean certificates.

## Inputs

- `scratch/runs/b1-mec-gauge-elimination-wave-20260903/elimination-v1/source.json`: `dc310082e5430b32bb6b0829ff627586f9d1a10111a3fe7fc9bfbbe8b955ee09`

## Command parameters

- Workers: `1`
- Per-stage timeout: `120.0` seconds
- Smoke gate passed: `true`

## Publication metadata

- Lane base: `58a89bce6daffa5c2786b1d238c453bf329eae6d`
- Launch-time repository HEAD: `3822c2a6cb819e44dbf41e1486926e828ee7a45b`
- Endpoint adapter capture: `eda3bd9eaa94c0461996e92bfc2aaa430cb14dd8174a37573fc7858e69b0630b`
- Legacy producer capture: `a7e43319e4ab9797f21d662788ceedc3fa98bb7dd8f2d931340cca15169cc28b`
- Generic PIQD adapter capture: `94058aa4e04b5acc27242b52781794944ea00a069b16805104d3263203d65e70`
- Result: `UNKNOWN` at `194`, `482`, and `482` constraints; no model or core.

The exact runtime source captures, rather than unrelated concurrent HEAD
movement, bind the executable inputs used by this run.
