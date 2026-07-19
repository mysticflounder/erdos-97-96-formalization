# Retained selector theorem-bank replay

Date: 2026-07-17

Status: **EXISTING-BANK HIT; REPAIRED FIN12 FIXTURE REFUTED**

`check.py` replays the complete selected rows of the repaired retained-radius
matching fixture through
`census.global_confinement.metric_realizability_probe._formalized_metric_core`.
The first hit is:

```text
equality-duplicate-center
triple  = [0, 1, 3]
centers = [2, 8]
```

The script also prints shortest row-equality paths for the four required
equalities.  The same paths are now kernel-checked in
`critical-fiber-closing-core-selector/RetainedRadiusInjectiveFiniteBoundary.lean`
as `banked_duplicateCenterCore`; `no_planar_realization` applies the existing
general Lean consumer.

This refutes only the displayed fixture.  It does not prove that every live
`RetainedRadiusBlockerMatching` contains a duplicate-center core.  Its durable
strategy consequence is that future matching searches must apply the full
formalized equality/metric and ordinal/Kalmanson banks before reporting a
geometric survivor or asking for new cap/MEC/full-filter facts.

Replay from the repository root with:

```text
PYTHONPATH=. UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/retained-selector-bank-replay/check.py
```
