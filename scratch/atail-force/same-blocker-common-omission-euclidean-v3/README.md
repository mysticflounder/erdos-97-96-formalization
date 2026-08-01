# Same-blocker common-omission Euclidean v3

Status: the Euclidean QF_NRA branch generator remains **structural self-check
only**. A separate finite Boolean incidence audit, strengthened with the exact
four-arm five-center deletion residual and the smallest block-order Kalmanson
specialization, is replay-checked **SAT at `n = 17`**.
The live Lean terminal remains unproved. A fixed `n = 17` experiment cannot by
itself close its arbitrary-carrier statement.

## Scope

This scratch model specializes the live
`FreshThirdTwoCapSourceObstruction.sameBlockerAllEndpointOmission` caller to the
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

## Five-center deletion incidence audit

`incidence_cegar.py` now includes the four arms of
`FirstFiberCollisionFiveCenterDeletionResidual` in their Lean disjunct order:

1. delete `p1`, using the r-pair blocker as the opposite collision blocker;
2. delete `r1`, using the p-pair blocker;
3. delete `p2`, using the r-pair blocker; or
4. delete `r2`, using the p-pair blocker.

For the selected arm, a chosen co-radial K4 row must avoid the deleted point at
the q/common blocker, `a1` (`oppApex1`), the opposite collision blocker, `a2`
(`oppApex2`), and `a3` (`surplusApex`). The arm selector is existential: it
chooses one witness arm without asserting that the other arms fail. Replay
independently recovers the chosen blockers and rows, checks that exactly one
arm was selected, and checks deletion avoidance at all five named center roles.

The strengthened self-check and smallest-profile audit were run as:

```bash
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/incidence_cegar.py --self-check
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/incidence_cegar.py --n 17 --timeout-ms 180000 --max-cuts 200
```

The `(6,8,6)` case is `SAT` at iteration zero with semantic replay `PASS`. The
witness selects `delete-P.source1`, deletes `p1`, and exhibits selected rows
avoiding `p1` at all five centers. See
`incidence-audit/n17-profile-6-8-6-incidence-five-center-deletion/` and
`incidence-audit/summary-incidence-five-center-deletion.json`.

This is finite external evidence only. It does not encode coordinates, QF_NRA
geometry, MEC/nonobtuse inequalities, the full `CounterexampleData.noM44`
surface, arbitrary carrier cardinality, or a Lean kernel proof.

## Production-backed cap-crossing strengthening

The smallest order-aware strengthening used here is a direct finite
specialization of
`Problem97.CapCrossingKalmanson.false_of_two_selected_rows_shared_late_pair`
(`lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean`, theorem beginning
at line 427). The general interface is
`Problem97.selectedFourClass_shared_pair_separated`
(`lean/Erdos9796Proof/P97/Phase3SharedPairSeparation.lean`, line 31).

The lane's cap schema is
`a1 -- third interior -- a2 -- first interior -- a3 -- second interior`.
Consequently, for every third-interior center `t` and every distinct pair
`x,y` in the first strict interior, the increasing order is
`a1 < t < x,y`. The theorem forbids the selected rows at `a1` and `t` from
both containing `x` and `y`. This statement is independent of the unknown
orders within the two interior blocks and needs no coordinate variables.

The implementation adds exactly these 60 clauses at `n = 17` and independently
replays all 60 cases. The bounded run was:

```bash
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/incidence_cegar.py --n 17 --cap-crossing-kalmanson --timeout-ms 180000 --max-cuts 200
```

It is still `SAT` at iteration zero, with semantic replay `PASS`. See
`incidence-audit/n17-profile-6-8-6-incidence-five-center-deletion-cap-crossing-kalmanson/`
and `incidence-audit/summary-incidence-five-center-deletion-cap-crossing-kalmanson.json`.
Thus this exact theorem-backed strengthening eliminates the previously observed
`a1`/`t2` shared `{q1,q2}` pattern but does not refute the finite abstraction.

## Full shared-pair separation plus geometric incidence

The next strengthening introduces existential integer positions for every
within-block permutation while fixing the three apex positions. The bounds and
`Distinct` constraints make the cyclic order exactly

`a1 -- perm(third interior) -- a2 -- perm(first interior) -- a3 -- perm(second interior)`.

For every center pair and every possible common point pair, the selected-row
memberships imply the exact linear-cut betweenness XOR from
`selectedFourClass_shared_pair_separated`. At `n = 17` this contributes 14,280
candidate implications. Replay independently checks the block permutation and
all 14,280 implications; 13 have both antecedent rows active in the combined
witness.

The single combined follow-up run also enables the already implemented
source-proved Euclidean incidence consequences: two complete circles share at
most two carrier points, and one equal point pair has at most two carrier
bisector centers. It was run as:

```bash
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/incidence_cegar.py --n 17 --geometric-incidence --full-shared-pair-separation --timeout-ms 300000 --max-cuts 200
```

The result is still `SAT` at iteration zero with semantic replay `PASS`, zero
CEGAR cuts, and solver check time 3,173 ms. The geometric replay checks 61,880
circle-overlap candidates and 61,880 bisector-center candidates. The selected
deletion arm is `delete-P.source1` (deleting `p1`), and the existential cyclic
order is

`a1,t3,t2,t4,t1,a2,r1,q2,r2,p2,q1,p1,a3,s4,s3,s1,s2`.

See
`incidence-audit/n17-profile-6-8-6-incidence-five-center-deletion-geometric-incidence-full-shared-pair-separation/`,
`incidence-audit/summary-incidence-five-center-deletion-geometric-incidence-full-shared-pair-separation.json`,
and `incidence_cegar-n17-geometric-full-shared-pair-separation.log`.

This is finite external evidence, not closure. The precise next missing datum
is a common Euclidean realization adapter: one point configuration and squared-
distance table whose equalities agree with every Boolean radius class while
realizing the existential cyclic order. The current consequences are necessary
projections of such geometry, but they do not supply coordinates, strict
convexity/CCW boundary proof objects, the complete `CounterexampleData.noM44`
surface, arbitrary carrier cardinality, or a Lean kernel proof. No Lean build or
axiom gate was run.
