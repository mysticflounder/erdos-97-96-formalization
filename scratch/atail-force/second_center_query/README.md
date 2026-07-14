# ATAIL-PAIR-SECOND-CENTER card-12 preflight

This directory contains the first target-specific finite-shadow query for the
same-cap second-center proposal (`Q-C`). It intentionally excludes card 11,
which is separately owned.

The query reuses the current ATAIL row inventory in
`census/multi_center/multi_center_census.py` and the global-confinement row
solver/validator in `census/global_confinement/shadow.py`. It checks one
explicit admitted named-label placement for each card-12 profile `(4,5,6)` and
`(5,5,5)`.

Each witness contains:

- one fixed cyclic/cap frame;
- the exact dangerous supplied `t2` row at `p`;
- all five supplied exact source rows, without identifying them with the
  separately quantified critical-shell system;
- one selected row at every carrier center;
- one source-indexed exact critical-system row per carrier point, including
  source membership and a nonfixed blocker map; and
- the row-witnessed negation of `Q-C`.

The independently checked result is `SAT_FINITE_SHADOW_ONLY` for both
profiles. This is not a Euclidean counterexample. In particular, arbitrary
bisector hits not belonging to an encoded four-point row are absent. The exact
encoded/unimplemented boundary and fail-closed verdict policy are in
`manifest.json`.

Run the deterministic replay and tests from the repository root:

```bash
PYTHONPATH=. .venv/bin/python scratch/atail-force/second_center_query/query.py --check
PYTHONPATH=. .venv/bin/python -m unittest \
  scratch/atail-force/second_center_query/test_second_center_query.py
```

Print the complete validated witnesses with:

```bash
PYTHONPATH=. .venv/bin/python scratch/atail-force/second_center_query/query.py --full
```

Interpretation: the encoded row/cap/critical-system incidence surface does not
force a row-witnessed second center at either card-12 profile. The next query
must add actual metric bisector equations and the omitted live/cap geometry;
running more incidence-only placements cannot promote this checkpoint into a
proof or a genuine counterexample.
