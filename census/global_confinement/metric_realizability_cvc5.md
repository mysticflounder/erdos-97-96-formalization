# cvc5 metric-realizability frontier

## Result

- Structural frontier: **30 systems**
- Frontier-ID SHA256: `085f332d753a3ca693230196643fc68c504afbd5ca99863a4433ab8ee97092d2`
- Completed: **30 systems**

| Final status | Count |
|---|---:|
| CVC5_UNSAT | 4 |
| UNKNOWN | 26 |

| Decisive stage | Count |
|---|---:|
| full-convex | 4 |
| none | 26 |

## Interpretation

The runner independently encodes the same gauge, selected-row
squared-distance equalities, ambient distinctness, exact-row
exclusions, and recorded strict convex order used by the Z3 probe.
Each stage is a fresh cvc5 QF_NRA query using `--nl-cov`.

`CVC5_UNSAT` excludes only the saved bounded row system and is a
trusted computation, not a Lean proof. `SAT_CANDIDATE` has not been
accepted as a realization because no cvc5 model verifier is part of
this runner. `UNKNOWN` is no verdict. No diameter, minimal-enclosing-
circle, nonobtuse-frame, or unsaved radius-class constraints are
encoded, so no status is a Problem 97 verdict.

## Reproducibility

- cvc5: `/Users/adam/bin/cvc5`
- cvc5 version: `This is cvc5 version 1.3.3 [git 8ff882e on branch HEAD]`
- workers: `8`
- per-query timeout: `30.0` seconds
- smoke gate passed: `true`

The frontier is reconstructed from the current saved assignments by
removing exactly the duplicate-center and exact-off-circle equality
cores. Its IDs must match the checked 60-second Z3 residual artifact
unless `--allow-selection-drift` is explicitly supplied.
