# Census workspace

This directory is the permanent home for the finite census tooling that
used to live under `scratch/` and `scripts/`.

## Layout

- `incidence/` contains the original incidence escape census.  The
  canonical entrypoint is `census/incidence/escape_census.py`; the old
  `scripts/escape-census.py` path is a compatibility wrapper.
- `candidate_d_probe/` contains the one-center and candidate-d token
  probes, including the q2 token classifier and solver artifacts.
- `q3_two_center/` contains the two-center q3 token probes, kill notes,
  witnesses, and generated solver inputs/outputs.
- `multi_center/` contains the multi-center joint census implementation
  for `docs/multi-center-joint-census-spec-2026-07-07.md`.

## Multi-center checkpoint (2026-07-09)

The L2 GLOBAL / PROVEN sweep is complete through `n = 32`, and the exact
L2 LOCAL frontier scan is flat through `n = 64`: every scanned row from
`n = 29` onward has the same 3,375 class keys as the `n <= 28` baseline.
The certificate stack in `certificates/multi_center/` now proves completeness
of that L2/full-participant representative surface modulo profile
automorphisms. This is not yet a geometric GLOBAL-realization theorem.

## Current commands

```bash
uv run python census/incidence/escape_census.py --min-n 9 --max-n 9
uv run python census/multi_center/smoke.py
uv run python census/multi_center/multi_center_census.py local-summary --n-min 12 --n-max 14 --out census/multi_center/local_summary_n12_14.json
uv run python census/multi_center/multi_center_census.py global-profile --profile 4,5,6 --layer L2 --tier proven --summary-only --out census/multi_center/global_profile_456_l2_summary.json
```

When running in a restricted sandbox, set `UV_CACHE_DIR=.uv-cache` so
`uv` does not try to write to the user-level cache.
