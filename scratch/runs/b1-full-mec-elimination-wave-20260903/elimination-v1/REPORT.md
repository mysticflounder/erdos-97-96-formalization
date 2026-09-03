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

- `scratch/runs/b1-full-mec-elimination-wave-20260903/elimination-v1/source.json`: `dc310082e5430b32bb6b0829ff627586f9d1a10111a3fe7fc9bfbbe8b955ee09`

## Command parameters

- Workers: `1`
- Per-stage timeout: `120.0` seconds
- Smoke gate passed: `true`

## Publication metadata

- Lane and execution base: `d5ccd4812bee1be08b2aae466c3eb51acb028792`
- Endpoint adapter capture: `208c9bb56978907376810b46497006cc6f1577527066376a80879feba4bc4cae`
- Legacy producer capture: `2f22e76a2c367a7d63c2b0d7f9e8dacb19faa99a618367f6581f9cda4e8f169e`
- Generic PIQD adapter capture: `94058aa4e04b5acc27242b52781794944ea00a069b16805104d3263203d65e70`
- Result: `UNKNOWN` at `193`, `481`, and `481` constraints; no model or core.
- Readback vocabulary: 36 point-coordinate terms and no MEC terms.
