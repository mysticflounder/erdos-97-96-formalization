# Same-blocker common-omission Euclidean v3

Status: **structural self-check only**. No SMT solver was imported or invoked,
and this lane establishes no SAT/UNSAT result. The live Lean terminal remains
unproved. A fixed `n = 17` experiment would not by itself close its arbitrary-
carrier statement.

## Scope

This scratch model specializes the live
`FreshThirdTwoCapSourceObstruction.sameBlockerCommonOmission` caller to the
closed-cap profile `(6,8,6)`. The modeled first closed cap is the size-eight
cap: its strict interior is exactly
`{p1,p2,r1,r2,q1,q2}`. The other two strict interiors contain four named points
each, giving 17 carrier points with the three apices.

Exhaustion matters. The live hypotheses put the four collision endpoints and
the two fresh sources in this six-point strict interior, pairwise as required.
The common blocker is also there, but a positive-radius shell cannot contain
its center. Thus `bq` must alias one of `p1,p2,r1,r2`; imposing a seventh fresh
point or requiring `bq` to be distinct from all four would be unsound.

The common row is locked carrier-wide, not merely on named local roles:

```text
{z in the 17-point carrier | dist(bq,z) = rq} = {q1,q2,u,v},
```

where `u,v` are distinct and outside the first closed cap. Consequently its
intersection with that cap is exactly `{q1,q2}`, and **all four** collision
endpoints are omitted by both common rows. Thus the live existential
`CommonCollisionEndpointOmission` field is redundant in this specialization.
The model nevertheless retains explicit proof-provenance labels for each of
the four `CrossPairDeletionView` choices and for the common omitted endpoint
witness.

## Branch accounting

- 40 compatible `(bp,br,bq)` alias maps in the exhausted first interior.
- `C(9,2) = 36` choices for `{u,v}` outside the first closed cap.
- `6! 4! 4! = 414720` cap-compatible cyclic carrier orders.
- `597196800` distinct geometric QF_NRA branches.
- 16 source-view omission labels and 4 common-omission witness labels per
  geometric branch, hence `38220595200` provenance-labeled branches.

The 64 proof labels do not change the QF_NRA formula: exact common support
already excludes all four collision endpoints. They are counted separately so
the Lean witness provenance is not silently collapsed into geometry.

## Encoded boundary

`model.py` encodes the full named carrier/profile, cap-compatible strict convex
order, common enclosing circle, a non-obtuse Moser triangle, the p/r/q
first-apex radius relations, positive pairwise-distinct source radii, all legal
blocker aliases, and the exact carrier-wide common support by equality on its
four members and disequality on every other carrier point. The two q source
packets share center and radius, retain source membership/cardinality-four,
blocker/apex inequalities, both cross-pair omission views, and an explicit
common omitted endpoint.

It does **not** encode the full `CounterexampleData` proof surface, all other
`CriticalShellSystem` selected rows, carrier-wide p/r four-shell classes beyond
their source-pair radius equalities, Lean proof objects, the actual
`CommonDeletionTwoCenterPacket`, its terminal incidence contradiction, or the
arbitrary-n reduction. The convex/MEC constraints are an algebraic geometric
specialization, not a reconstruction of those omitted Lean structures.

The source mapping is recorded in `manifest.json`. In particular,
`CriticalFourShell.support_eq` makes support a full carrier filter, while the
proved `crossPairDeletionSurvival_iff_selectedSupportOmission` justifies
representing each `CrossPairDeletionView` through an endpoint omission choice.

## Bounded gate

Only this non-solving command was run:

```bash
uv run python scratch/atail-force/same-blocker-common-omission-euclidean-v3/model.py --self-check --branch-count-only
```

Its exact output is `result.json`; salient terminal fields are:

```json
{
  "common_omission_existential_redundant": true,
  "common_support_omits_all_collision_endpoints": true,
  "mode": "branch-count-only",
  "solver_imported": false,
  "solver_invoked": false,
  "status": "SELF_CHECK_OK"
}
```

The optional `--solve` path is deliberately guarded by a positive case bound
and a per-case timeout. It was not exercised here.
