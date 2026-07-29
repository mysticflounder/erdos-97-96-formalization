# Numerical Euclidean fit diagnostic: v9 local robust/new

## Outcome

`UNKNOWN_NO_FIT_FOUND`

bounded deterministic multistart found no candidate meeting both the distance-equality tolerances and strict-convex margins; this does not certify infeasibility

This is a floating-point multistart diagnostic only. A fit would not be exact
SAT, and no-fit-found is not UNSAT or an infeasibility certificate.

## Exact-source validation

- Fresh pinned outer replay: `SAT`
- Quotient classes: `19`
- Positive squared-distance equations: `38`
- Strict support inequalities: `323`
- Prior exact QF_NRA status: `UNKNOWN` (`hard subprocess wall timeout`)

The numerical problem was reconstructed by importing the exact probe's parser,
normalization, replay gate, and `build_formula` helpers, then checking the
recorded SMT hash, input hashes, class order, recorded equation list, and
assertion ledger.
A fresh outer replay selected `38` positive quotient equations versus the recorded formula's `38`; their overlap is `38`. This is expected model freedom: the numerical target remains the exact recorded SMT formula, not the fresh replay's different row selection.

## Numerical frontier

| candidate | equality RMS | max absolute equality residual | raw support minimum | normalized support minimum | nonpositive supports |
|---|---:|---:|---:|---:|---:|
| best strict-order | 0.1134716807 | 0.313873752963 | 9.99774856186e-07 | 9.87375763518e-07 | 0 |
| best equality-fit | 6.42858498697e-16 | 1.7763568394e-15 | -5.00515724259 | -0.999999840437 | 164 |

Acceptance required max equality residual at most
`1e-08`, equality RMS at
most `1e-09`, raw support
margin at least
`1e-06`, normalized
support margin at least
`1e-08`, and
minimum pair distance at least
`1e-06`.

The search used `72`
completed deterministic attempts in
`20.644` seconds. See the JSON artifact for every
attempt summary, selected coordinates, all 48 equality residuals, and the 20
smallest support margins.

## Source hashes

- `cegar_result_sha256`: `4305fde6500059ef45b268fe09bd99edd3e3ea63386e162b6524ce27e0ef61a3`
- `checkpoint_sha256`: `0fbe6cad9144ad555825ed09e7c37fc78c07c184250d4fbb8aff53c1f68a7a19`
- `exact_probe_result_sha256`: `7cbd30884a8e5733b2942d6b0c1186f9043895bffab231f1aa194b9cf9be8803`
- `exact_probe_script_sha256`: `79f30c1f37504846810a0db41be00ff8690e3d414675be0a7d8e13e26650dfd5`
- `cegar_script_current_sha256`: `29db457d62c7ba10a096a07aa3600a34baf859bcf3019c4d20e04fc1455c57dc`
- `cegar_script_recorded_sha256`: `29db457d62c7ba10a096a07aa3600a34baf859bcf3019c4d20e04fc1455c57dc`
- `exact_positive_rows_smt2_sha256`: `08fd9aaa292be6574be7788897e106e903b865682fe72b07eebe271a20fadd2e`
- `numerical_script_sha256`: `3c1841f77604337f513d10e28dc06b28d3cc093d556368797a9e63b88de63e13`

## Epistemic classification

`NUMERICAL_DIAGNOSTIC_ONLY`. The quotient and positive-row selection are
pinned-model data, not a universal consequence established here. SciPy
floating-point convergence is heuristic evidence; the exact Z3 probe remains
`UNKNOWN`, and only an exact solver result or proof-producing bridge could
upgrade the terminal status.
