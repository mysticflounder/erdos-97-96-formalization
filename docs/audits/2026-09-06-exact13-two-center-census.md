# Exact-13 two-center census audit

Date: 2026-09-06  
Lane: `exact13-two-center-census-20260906`  
Owner: `Kant`

## Claim boundary

This is an exact, solver-free replay census of the 197 quotient groups not
excluded by the retained G2 obstruction report. It scans all 1,430 strict
Kalmanson forms and complete 495-support tables at two active centers per
group. The two residual pairs are then tested against a third active center
(center 3 in both cases; center 6 is inactive in both). Every rejection is
recorded with an exact projected one- or two-form certificate. This is not
source coverage, a metric or Euclidean claim, a Lean theorem, or a PIQD UNSAT
claim.

## Result

The governed v2 report is
`scratch/runs/exact13-two-center-census-20260906/run-0001/exact13-two-center-census.json`.
It contains 197 groups, 394 complete two-center scans, and two complete
third-center scans of the residual pairs.

| outcome | groups |
| --- | ---: |
| `TWO_CENTER_CLOSED` | 195 |
| `THREE_CENTER_CLOSED` | 2 |
| unresolved | 0 |

The selected-center pairs were `(2,7)` for 144 groups, `(2,6)` for 29
groups, and `(7,6)` for 24 groups. The fallback chooses the first two active
centers in the pinned priority order `(2,7,6,3,4,5,9,10,11,12)`.

The two third-center closures are:

| record index | fixed center-2 support | fixed center-7 support | third center | one-form | two-form | survivors |
| ---: | --- | --- | ---: | ---: | ---: | ---: |
| 208 | `04510` | `36912` | 3 | 478 | 17 | 0 |
| 214 | `03510` | `46912` | 3 | 458 | 37 | 0 |

Thus no PIQD complete-cone diagnostic was needed: no third-center support
survived the exact one/two-form replay. The report self-hash is
`ef178a1be870dd983c273a1254c99183dbf51e6b9954b9f507fa9272dd3f925c`;
the governed run manifest and source/input digests bind the replay inputs.

## Reproduction

```bash
PYTHONPATH=scripts uv run --no-cache python -B scripts/certify_exact13_two_center_census.py --verify \
  scratch/runs/exact13-two-center-census-20260906/run-0001/exact13-two-center-census.json \
  --workers 8
PYTHONPATH=scripts uv run --no-cache pytest -q -p no:cacheprovider \
  scripts/test_certify_exact13_two_center_census.py
```
