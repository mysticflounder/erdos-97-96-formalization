# Period-three active-constraint checkpoint audit

Date: 2026-07-18

Status: **THE HISTORICAL BEST-CANDIDATE CONSTRAINTS ARE NOT RECOVERABLE FROM
THE STORED CHECKPOINT.  THIS IS AN ARTIFACT-LOSS FINDING, NOT A GEOMETRIC
RESULT AND NOT A PROOF OF UNSAT.**

## Evidence

`../cycle-three-rows-euclidean/CHECKPOINT.json` stores, for each union schema,
only its seed/budget and the scalar `minimum_margin`.  It does not store the
best parameter vector, cyclic order, point coordinates, per-group minima, or
the identity of the minimizing constraint.  The prose report repeats only the
same scalar margins.  No raw result JSON containing those fields is present in
the lane, in the supplied Front-A backup, or in the recent temporary files
searched during this audit.

The search programs themselves print the missing data: each final payload has
`result.parameters`, `result.points`, `result.cyclic_order`, and
`result.minimum_by_group`.  Because that stdout was not banked, the exact
active constraint at the historical optimum cannot be reconstructed by
replaying `evaluate`; rerunning a seeded differential-evolution search is not
guaranteed to reproduce the prior candidate across SciPy versions or worker
schedules.

## Scratch-only replay tool

`audit_candidate.py` accepts the raw JSON printed by any of the five schema
drivers and recomputes every margin with a fully qualified name, including
the hull edge and tested point, the exact row/nonmember exclusion, and the
named pairwise distinction.  It performs no optimization.

Example for a future saved six-target result:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/period3-active-constraint-audit/audit_candidate.py \
  --schema six-disjoint --input /path/to/raw-result.json --limit 30
```

The `--example-seed` mode only checks that every evaluator margin has exactly
one generated label.  It is not evidence about a best candidate.

## Smallest sound logging change

For every future bounded run, bank the complete stdout payload rather than
copying only `minimum_margin` into `CHECKPOINT.json`.  The essential lossless
fields are:

1. schema and pivot;
2. parameter vector;
3. dynamically detected cyclic order;
4. point coordinates;
5. all group minima; and
6. the ranked fully named margins emitted by this replay tool.

Without fields 2 and 3, claims about which geometric constraint is active are
guesswork.

## Theorem-bank preflight and proof-facing target

The required certificate registries were checked before proposing a local
metric lemma:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries found that the elementary
algebra is already banked: `U5GlobalIncidenceBasic.radical_axis_eq_of_dist_sq_eqs`
and `Dumitrescu.Lc1Strict.dist_lt_iff_inner_chord_neg` are the closest reusable
kernels, while `U2NonSurplusOneHit.no_adjacent_escape_on_apex_radius` is a
specialized radical-axis sign consumer.  Therefore the following is not a new
standalone theorem-mining target; at most it needs a thin cap-side adapter.

The numerical suite has already refuted one-row impossibility and has not
decided simultaneous completion of all three rows.  The next theorem should
therefore stay at the complete period-three surface.  A useful elementary
producer to test there is the radical-axis side lemma:

```text
if q and r are co-radial from both o and c,
c is on the cap side of chord qr,
and x is on c's q-radius circle on o's side of chord qr,
then dist o x < dist o q.
```

The adapter follows by subtracting the two circle equations; the common chord
is the radical axis and the power difference has a fixed strict sign on each
side.  It consumes genuine Euclidean chord-side information absent from the
finite marginal model.  It is only a producer: one-row countermodels show that
this inside-physical-circle conclusion is not by itself contradictory.  Do
not formalize even the adapter until a three-row/MEC or minimality consumer is
identified that turns all six strict inside inequalities into `False` (or
into the existing first-apex co-radial outside-pair terminal).

No production Lean, shared plan document, blueprint state, protected theorem
lane, or long search was modified or run.
