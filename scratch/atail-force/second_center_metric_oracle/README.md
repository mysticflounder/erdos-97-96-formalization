# Card-12 second-center metric oracle

## Result

Both independently validated card-12 finite-shadow witnesses are excluded by
their metric equalities alone after the normalization

```text
point 0 = (0, 0), point 1 = (1, 0).
```

Each serialized 29-row witness has exactly 12 distinct center/support rows;
the other 17 rows repeat one of those circles for supplied-row or
critical-system provenance.  The 12 distinct rows yield 36 quadratic
squared-distance equalities in 20 coordinate variables.

For both profiles `(4,5,6)` and `(5,5,5)`, the normalized equality ideal is
`UNIT` in all three exact computations:

- Singular 4.4.1 over `QQ`;
- msolve 0.10.1 over `QQ`, forward variable declaration; and
- msolve 0.10.1 over `QQ`, reverse variable declaration.

Thus the two fixed normalized complex varieties are empty, and therefore the
two fixed normalized real varieties are empty as well. This is an exact-CAS
computation, not a replayed Nullstellensatz certificate or a kernel-checked
proof.

The bounded one-pass deletion found cross-checked `UNIT` subcores of:

- 6 rows / 18 equalities for `(4,5,6)`; and
- 7 rows / 21 equalities for `(5,5,5)`.

Some deletion tests reached the four-second local cap. The saved subcores are
therefore confirmed unit subsets, but they are not claimed row-minimal or
equation-minimal. A further bounded single-deletion probe found no confirmed
smaller unit subset and was left fail-closed.

## Deterministic replay

From the repository root:

```bash
PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/second_center_metric_oracle/oracle.py --check

PYTHONPATH=. .venv/bin/python -m unittest \
  scratch/atail-force/second_center_metric_oracle/test_oracle.py
```

`--check` regenerates and independently validates the two source witnesses,
recomputes all row/provenance/polynomial hashes, reruns Singular and both
msolve variable orders on each full ideal and saved subcore, and compares the
result with `checkpoint.json`. The bounded discovery pass is available as:

```bash
PYTHONPATH=. .venv/bin/python \
  scratch/atail-force/second_center_metric_oracle/oracle.py --discover
```

Discovery enforces a 55-second wall budget per case, keeps timed-out rows, and
reserves time for a three-oracle check of the retained subcore. No individual
oracle call is allowed more than 12 seconds; deletion calls are capped at four
seconds.

## Scope and epistemic boundary

This checkpoint answers only the normalized equality-ideal question for the
two saved card-12 placements. It does not exhaust placements or orbit classes,
does not include card 11, and does not prove the same-cap producer.

The source shadow was intentionally not target-faithful. The oracle omits
off-radius disequalities of exact rows, pairwise distinctness beyond the 0/1
gauge, convexity and orientation inequalities, cap/Moser/liveData geometry,
and arbitrary equal-distance pairs not represented by saved rows. Since the
weaker equality subsystem is already unit, those omitted constraints are not
needed to exclude these two placements; their omission still prevents any
exhaustive or producer-level conclusion.

The complete encoded/omitted ledger and fail-closed verdict policy are in
`manifest.json`.

## Reproducibility hashes

Source witnesses:

- `(4,5,6)`: `ce24f3818d0b9465ef6afadced8a957065ffb7846cd62d7f1cb52c764850fa47`
- `(5,5,5)`: `d1231886198381478c2ae0120c5d444b353e0b003097cc97b10c205c98883a18`

Expanded equality systems:

- `(4,5,6)`: `6b945750dabf76847a64734c582fd54a7f6e24635eeddaa31718e0be90bb8c70`
- `(5,5,5)`: `706ac1a975ff2cfb9b24c6a8472513b50c5a571c6aea84f5a2ca7d78598c7278`

Artifact files:

- `checkpoint.json`: `5791754f879aa25eb3de7b7d751d88f4bf24a05bc0a52cebf6d3857c60d9e5af`
- `manifest.json`: `84c19c092e657d09e14b666ed43ae90646d6edee14330a769508d5499d948381`
- `oracle.py`: `b708722ce49f9d0f165facf20a911161815ce8018c5fc3760bf872dad6977a09`
- `test_oracle.py`: `6d935d626a17c39d614419f710ef35285f38ebe8e7c2133fe19bdd1eb07af2c0`
