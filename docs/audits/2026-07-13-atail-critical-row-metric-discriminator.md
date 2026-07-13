# ATAIL critical-row metric discriminator audit (2026-07-13)

## Verdict

Two saved card-12 critical-row shadow witnesses survive the strengthened
finite checks used in this experiment:

- one selected four-point row at every center;
- pairwise row-support overlap at most two;
- all shared-pair cyclic-separation constraints for an explicit common cyclic
  order; and
- no instance of any obstruction currently recognized by
  `_formalized_metric_core`.

Neither witness has even a gauge-fixed complex Euclidean realization according
to the trusted exact-arithmetic CAS check of its row equalities. Singular
returns `UNIT` over `QQ` for a contained subsystem of
each witness. The `(4,5,6)` witness contains an eight-row, 24-equality unit
subsystem. The `(5,5,5)` witness contains a seven-row, 20-equality unit
subsystem on 11 active labels. Since adding generators preserves the unit
ideal, both full 36-equality systems are excluded exactly.

This is a **trusted exact-CAS exclusion of two saved finite-shadow witnesses**,
exact within the stated gauge-fixed equality model. The Nullstellensatz
certificate was not extracted and independently replayed. This is not an
exhaustive critical-row census, a new generic metric theorem, a Lean
certificate, or a proof of K-A-PAIR.

The reproducible artifact is
`scratch/atail-force/critical_row_metric_discriminator.py`; its pinned output
is `scratch/atail-force/critical_row_metric_discriminator.json`.

## Exact checks

The script first runs Singular smoke gates on one known unit ideal and one
known nonunit ideal. For each saved candidate it then verifies the finite
shadow directly, checks that `_formalized_metric_core` returns `None`, checks
that the stated subsystem generators occur in the full system, and invokes
the existing `probe_rows` Singular oracle on that subsystem.

| profile | full rows / equalities | confirmed unit subsystem | active labels | trusted exact-CAS verdict |
|---|---:|---:|---:|---|
| `(4,5,6)` | 12 / 36 | 8 rows / 24 equalities | 12 | `UNIT` |
| `(5,5,5)` | 12 / 36 | 7 rows / 20 equalities | 11 | `UNIT` |

These are the internal saved-search block-profile labels. In particular,
`(4,5,6)` is not using the closure matrix's labeled-cap tuple order; no
profile-orientation bridge is claimed by this audit.

The gauge fixes labels `0` and `1` at `(0,0)` and `(1,0)`. Conditional on the
trusted CAS result, any injective real
planar realization can be translated, rotated, and scaled into this gauge, so
a unit ideal excludes the intended distinct-point realization. The actual
Singular claim is stronger here: there is no solution over the algebraic
closure in that gauge, even before convexity, exact-radius exclusions, or
inequalities are imposed.

The two candidate digests are:

- `(4,5,6)`:
  `c9003d8b54c15bb4be4207ef84d9eb5fd749f48e7897514635b502efc14083bb`;
- `(5,5,5)`:
  `d13f07d4388e5301703f65bf4451c62f0af7d6d9f1c130628dc21bcfb2928b95`.

## What became apparent

The current finite incidence/order shadow is still weaker than planar metric
realizability. Cross-separation eliminates the old W16/W20 nonconvex
row-decorated witnesses, but it does not eliminate these two stronger
candidate systems. Conversely, the current catalog of small formalized metric
cores does not recognize either candidate, while the complete equality ideal
does.

The unit subsystems are large rigidity networks rather than a small common
pattern. The `(5,5,5)` subsystem is built from two equality-forced equilateral
triangles coupled to five further circle constraints; removing one leaf
equality leaves the exact 20-equation contradiction. A Singular
Nullstellensatz-lift attempt did not finish in 180 seconds, and the
`(4,5,6)` equality-deletion candidate did not reconfirm within 180 seconds.
Accordingly no irredundancy, short polynomial identity, or new theorem schema
is claimed.

This supplies a stopping rule: do not formalize either saved network verbatim,
and do not resume blind equality-core mining from these two examples. A useful
new core would first need to recur under independent candidates and reduce to
a substantially smaller structural statement.

## Solver-input footgun caught during discovery

The discovery pass briefly used `msolve` as a fast proposal engine. Feeding it
the raw nested distance syntax emitted by `row_equalities`, especially terms
of the form `-((...))`, produced a false `[-1]` result even for a two-row
satisfiable smoke system. Expanding every polynomial first corrected the smoke
result and made `msolve` agree with Singular on the full candidates.

No raw-parser or `msolve`-only verdict is retained as evidence. The committed
checkpoint uses Singular alone for the trusted exact-arithmetic verdicts. Any future `msolve`
adapter must canonicalize polynomials and carry both a known-SAT and known-UNSAT
gate before touching research inputs.

## Consequence for the live producer

The complementary retained-provenance result gives every LIVE-C branch two
distinct points of the `f2` critical support outside
`{q,t1,t2,t3}`. The highest-leverage next statement is therefore not another
free-standing metric circuit. It is a **convex/cap-localized second-center
producer** for that already-forced pair:

1. use the actual Moser/cap/order hypotheses to put the same two points in a
   second selected/full-filter class;
2. prove the two centers are distinct and lie in the cap/order relationship
   required by `CapSelectedRowCounting.outsidePair_unique_capCenter`; or
3. identify the two centers with the opposite Moser apices and recover the
   two radii required by K-A-PAIR directly.

This targets the missing cap/order/full-filter content and immediately
consumes an existing proved theorem. The saved metric networks remain
regression examples for any proposed weaker substitute: a statement expressed
only by selected rows, overlap two, cyclic separation, and the current core
catalog is not yet strong enough.

The separate blocker-graph audit makes the qualifier load-bearing: global K4,
deletion criticality, blocker cycles (even spanning), and overlap at most two
still permit all fixed two-center fibers to be singletons. A successor must use
convex/Moser/cap localization rather than merely adding an arbitrary second
blocker center.

## Reproduction

From the repository root:

```bash
PYTHONPATH=. UV_CACHE_DIR=/tmp/codex-uv-cache \
  uv run python scratch/atail-force/critical_row_metric_discriminator.py

PYTHONPATH=. UV_CACHE_DIR=/tmp/codex-uv-cache \
  uv run python scratch/atail-force/critical_row_metric_discriminator.py --check
```

The first command regenerates the pinned JSON. The second recomputes the exact
verdicts and rejects any byte-level artifact drift.
