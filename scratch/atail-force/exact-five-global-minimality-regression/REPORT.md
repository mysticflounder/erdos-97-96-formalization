# Exact-five global-minimality regression

Date: 2026-07-21

Status: **EXACT WITHIN THE DECLARED 13-POINT FINITE METRIC MODEL.**

`verify_finite_metric_model.py` checks an exact rational metric with global
K4, a total deletion-critical map, two robust apex classes, the exact-five
cap and retained-row roles, the global-cover star, and the asymmetric two-hit
normal form. It exhaustively checks that none of the 8,190 nonempty proper
subsets is witness-closed. The model nevertheless avoids both the first-apex
co-radial outside-pair terminal and a second displayed center through the
forced nontrivial critical fiber.

Run:

```bash
UV_CACHE_DIR=.uv-cache uv run --no-project \
  scratch/atail-force/exact-five-global-minimality-regression/verify_finite_metric_model.py \
  --check
```

This is not planar Euclidean/MEC data and not a Problem 97 counterexample.
Its purpose is to prevent future attempts to derive the live exact-five
terminal from incidence, total criticality, or cardinal minimality alone.
The full audit is
`docs/audits/2026-07-21-exact-five-global-minimality-regression.md`.
