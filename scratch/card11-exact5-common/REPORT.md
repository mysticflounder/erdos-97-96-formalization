# Common-center projection report

Run date: 2026-07-30.

## Commands

From the repository root:

```bash
uv run python scratch/card11-exact5-common/self_test.py
uv run python scratch/card11-exact5-common/probe.py --timeout 600
```

CaDiCaL was invoked serially, once per CNF. No two CaDiCaL processes from this
probe overlapped.

## Frozen counts and self-test

The wrapped Census-554 base has 27,286 variables and 207,969 clauses. The
existing direct-or-reflected separation extension adds 618 variables and
179,887 clauses. Each shell adds two clauses, so every target CNF has 27,904
variables and 387,858 clauses.

The self-test checked those frozen counts, the 144-order surface, all four
shell candidate sets (3 center-1 rows and 28 center-8 rows in each case), and a
known positive cube forced through the full wrapped base-plus-separation CNF.
That smoke CNF had 27,904 variables and 387,867 clauses; CaDiCaL returned SAT
and the model passed the independent cube and order validators and a
clause-by-clause assignment check.

## Target results

| shell `(s,o)` | verdict | wall time | chosen row at center 1 | chosen row at center 8 | selected valid orders |
|---|---:|---:|---|---|---:|
| `(2,0)` | SAT | 1.313 s | `{0,2,6,7}` | `{3,6,7,10}` | 2 |
| `(2,9)` | SAT | 1.282 s | `{6,7,8,9}` | `{3,4,6,7}` | 4 |
| `(3,0)` | SAT | 1.297 s | `{0,6,7,8}` | `{3,4,6,7}` | 2 |
| `(3,9)` | SAT | 1.318 s | `{6,7,8,9}` | `{0,1,6,7}` | 2 |

Every model assigned all 27,904 variables and satisfied all 387,858 persisted
CNF clauses. Each also passed:

- the existing independent `census554_lib.cube_ok` hook;
- direct checking of the center-1 and center-8 shell requirements; and
- `validate_cube_order` for every order selector made positive by the model.

Thus this cheap common-center projection is SAT in all four shells. It does
not supply a contradiction and should be extended, if desired, with
source-indexed blocker-row constraints.

## Artifacts

The aggregate machine-readable summary is `runs/summary.json`. Each
`runs/s*_o*/` directory contains:

- `problem.cnf`: exact DIMACS input;
- `cadical.stdout` and `cadical.stderr`: raw solver output;
- `model.json`: decoded cube, selected orders, and validation results;
- `provenance.json`: shell definition, exact counts, SHA-256 hashes of the
  wrapped source files and CNF, and the exact solver command; and
- `result.json`: concise verdict and artifact index.

`self-test-artifacts/` contains the known-positive smoke CNF, raw solver output,
and its validation result.

## Source-faithfulness boundary

The result is source-faithful only to the canonical labeled Census-554
C1/one-hit/C2/C4 cube, the direct-row direct-or-reflected cyclic-separation
surface, and the two explicit shell row requirements. It does not encode the
full exact-five source statement, a source-to-valuation theorem,
uniqueness/minimality, `noM44`, source-indexed blocker production, or the
upstream proof that the four shells exhaust the common-center geometric leaf.
The SAT models are therefore witnesses for this finite projection, not
geometric counterexamples and not theorem-level closure.
