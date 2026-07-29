# Numerical Euclidean fit diagnostic: v9 local robust/new

## Outcome

`UNKNOWN_NO_FIT_FOUND`

bounded deterministic multistart found no candidate meeting both the distance-equality tolerances and strict-convex margins; this does not certify infeasibility

This is a floating-point multistart diagnostic only. A fit would not be exact
SAT, and no-fit-found is not UNSAT or an infeasibility certificate.

## Exact-source validation

- Fresh pinned outer replay: `SKIPPED_CURRENT_CEGAR_IMPLEMENTATION_DRIFT`
- Quotient classes: `20`
- Positive squared-distance equations: `48`
- Strict support inequalities: `360`
- Prior exact QF_NRA status: `UNKNOWN` (`hard subprocess wall timeout`)

The numerical problem was reconstructed by importing the exact probe's parser,
normalization, replay gate, and `build_formula` helpers, then checking the
recorded SMT hash, input hashes, class order, recorded equation list, and
assertion ledger.
Fresh outer replay was intentionally skipped because current `cegar.py` has hash `2bba611b5bd64bd038b4c0c3973c5772bac4433bcbcc81098fc347fa0c88bef8`, while the result/checkpoint/probe ledger records `4a5278cb5da186e9b7c3ec39cb002d38d1a37ae84c1d76a02718cea1d2ba85c0`. The immutable recorded SMT formula and its hash remain the numerical target.

## Numerical frontier

| candidate | equality RMS | max absolute equality residual | raw support minimum | normalized support minimum | nonpositive supports |
|---|---:|---:|---:|---:|---:|
| best strict-order | 0.21204474907 | 0.668704118844 | 9.99999997985e-07 | 2.39562645186e-06 | 0 |
| best equality-fit | 1.1911206456e-16 | 4.4408920985e-16 | -1.19953783154 | -0.999795599073 | 180 |

Acceptance required max equality residual at most
`1e-08`, equality RMS at
most `1e-09`, raw support
margin at least
`1e-06`, normalized
support margin at least
`1e-08`, and
minimum pair distance at least
`1e-06`.

The search used `60`
completed deterministic attempts in
`35.927` seconds. See the JSON artifact for every
attempt summary, selected coordinates, all 48 equality residuals, and the 20
smallest support margins.

## Source hashes

- `cegar_result_sha256`: `90bdaca3614add5ca456fdbdc96dc2ea1d8009e42f729f150bada30e03bbe4d1`
- `checkpoint_sha256`: `3d17df2d340024e18c3ec6692182eee7d5ca4c52f2d9799509506eb2f067823b`
- `exact_probe_result_sha256`: `d08d275d1f5eee7bf31e9c68312da69dccf1e660041704a9c4e2027a960aa9a9`
- `exact_probe_script_sha256`: `48ff2264e4ccaeae3c0403b63dc76e2d7f20d7e0af81a686b22483a8f8af121d`
- `cegar_script_current_sha256`: `2bba611b5bd64bd038b4c0c3973c5772bac4433bcbcc81098fc347fa0c88bef8`
- `cegar_script_recorded_sha256`: `4a5278cb5da186e9b7c3ec39cb002d38d1a37ae84c1d76a02718cea1d2ba85c0`
- `exact_positive_rows_smt2_sha256`: `02ad0315200190370419e0ff7192ebd321922301cc17d7b6acf7facb922514ce`
- `numerical_script_sha256`: `3c1841f77604337f513d10e28dc06b28d3cc093d556368797a9e63b88de63e13`

## Epistemic classification

`NUMERICAL_DIAGNOSTIC_ONLY`. The quotient and positive-row selection are
pinned-model data, not a universal consequence established here. SciPy
floating-point convergence is heuristic evidence; the exact Z3 probe remains
`UNKNOWN`, and only an exact solver result or proof-producing bridge could
upgrade the terminal status.
