# Metric realizability probe

## Result

- Saved SAT assignments: **1503**
- Unique metric row systems: **1325**
- Systems selected in this run: **30**
- Systems completed: **30**

| Final status | Count |
|---|---:|
| UNKNOWN | 30 |

| Decisive stage | Count |
|---|---:|
| none | 30 |

## Formula ledger

Encoded exactly over the reals:

- the gauge `p0 = (0,0)` and `p1 = (1,0)`;
- all selected-row squared-distance equalities;
- pairwise distinctness of every ambient label;
- strict convexity in the cap frame's recorded cyclic order, using
  the left-half-plane condition for every oriented hull edge; and
- for every exact row, exclusion of each nonmember from its radius.

Before invoking QF_NRA, the probe deterministically closes row
equalities and checks for two distinct centers equidistant from the
same three labels. Such a duplicate-center core is reported as
`equality-duplicate-center` UNSAT. It is a structural consequence
of the selected rows and ambient-label distinctness, not a Z3 result.

The same prefilter also rejects an exact row when equality closure
forces a label outside its support onto that row's circle. Such a
witness is reported as `equality-exact-off-circle` UNSAT.

Not encoded:

- the diameter, minimal-enclosing-circle, nonobtuse-frame, and other
  geometric hypotheses not present in the saved row assignment; and
- any selected radius classes not represented by a saved row.

Therefore `UNSAT` soundly excludes a saved incidence assignment even
under this relaxation. `SAT` establishes only row-level realizability
and is not a Problem 97 configuration. `UNKNOWN` is no verdict. Z3
QF_NRA outcomes are trusted computations, not Lean certificates.

## Inputs

- `census/global_confinement/results_n11_12.json`: `1cfac3c594daa534981b20c8d41d4944d898851363cb7b88700950d165deeeca`
- `census/global_confinement/critical_shell_results_all_placements_n11_12.json`: `5eedf2a56f7effd2616204a4c5d583be9fc97d302871a32f930bd2c64e4fcaea`
- `census/global_confinement/shell_audit_results_all_frames_n11_12.json`: `6d94b47ce41bc4290e0b19e59e4a7c605988a01ad7258f396fd1a1aa1faea620`

## Command parameters

- Workers: `8`
- Per-stage timeout: `60.0` seconds
- Smoke gate passed: `true`
