# Exact-five role-complete asymmetric gate

Date: 2026-07-21

Status: **BOUNDED DIAGNOSTIC. NO QUOTIENT-FREE COMPLETION FOUND; NO
COORDINATE RUN; NO LEAN `sorry` CLOSED.**

## Source-valid surface

The test rotates the exact rational ordered-distance survivor from
`exact-five-retained-rows-lra` into a card-16 cyclic carrier with cap profile
`(8,6,5)`.  It fixes and independently checks:

- the exact-five second-apex shell `{0,1,2,3,4}`;
- frontier sources `q=12`, `w=3`;
- the first-apex retained frontier row `{3,10,12,14}`;
- the first-apex double-deletion row `{1,6,13,15}`;
- the actual q-deleted retained second row `B2={0,1,2,3}`;
- the asymmetric hub row `{1,3,5,14}`, whose outside pair is `{5,14}`;
- the named actual rows at the hub and `q` blocker;
- the fixed blocker incidences for those rows;
- the complete shell against every other-center `m/g0/g1/b1/B2` row;
- distinct-center overlap, convex pair alternation, same-cap outside-pair
  exclusion, and the global at-most-two carrier centers per target pair;
- the `FirstApexShellRolePacket` consequences: both first-apex rows have at
  least two strict-first-opposite hits, `q,w` have the exact role cover with
  at least one strict source, and the two displayed first-apex supports take
  the distinct-radius/disjoint-support arm; and
- strong connectivity of all three selected-row families.

These are necessary-condition fields.  Their finite satisfiability is not a
Euclidean realization or a Problem 97 counterexample.

## Results

The first independently verified Boolean completion was SAT but already had
a strict Kalmanson quotient cycle.  A deletion-minimal example used:

```text
g1[8] : 0 = 13
B1@O1 : 1 = 13
B2@O2 : 0 = 1
```

The two resulting strict comparisons form a two-cycle, so that completion
was correctly rejected before nonlinear optimization.

| Run | Additional specialization | Result | Epistemic status |
| --- | --- | --- | --- |
| role-complete | none | 60 ordinal cores, then `UNKNOWN / wall budget` | bounded search only |
| role-complete | `g0 = g1 = m` globally | Boolean `UNSAT` | exact within this strengthened finite encoding; not a source consequence |
| role-complete | `g0 = g1` globally | 30 ordinal cores, then `UNKNOWN / wall budget` | bounded search only; specialization not a source consequence |

The specializations are legitimate witness-search restrictions: a model
found under either would satisfy the unspecialized source contract.  Their
failure does **not** prove the source branch false because the parent does not
force either equality of witness tables.

No completion passed the necessary quotient-cycle gate.  Therefore
`search_exact5_asym_decoded_euclidean.py` was compiled but deliberately not
run.  There is no numerical Euclidean/MEC model and no numerical infeasibility
claim from this checkpoint.

## Isolated first-apex two-hit cut

The newly identified source-valid constraint

```text
card (b1 ∩ strictFirstOppositeCap) >= 2
```

was also tested separately, with no retained-row or witness-table
specialization.  With the corrected shell cross-family geometry it remains
SAT in all four checked card-13 orbits:

| Orbit | Strict hits in `b1` | Result |
| --- | --- | --- |
| `asymmetricSourceLeft` | `{10,11}` | SAT |
| `allOneHitHubLeft` | `{10,12}` | SAT |
| `allOneHitHubMiddle` | `{9,10}` | SAT |
| `allOneHitHubRight` | `{10,12}` | SAT |

Thus the cut invalidates a stale finite-metric regression that had only one
strict hit, but it does not close an asymmetric or all-one orbit by itself.

## Scratch artifacts and commands

Artifacts:

```text
/tmp/generate_exact5_asym_retained_b0.py
/tmp/verify_exact5_asym_retained_b0.py
/tmp/search_exact5_asym_decoded_euclidean.py
/tmp/exact5-asym-retained-role-complete-cegar.checkpoint.json
/tmp/exact5-asym-retained-g01-equal-cegar.checkpoint.json
/tmp/check_card13_b1_strict_two.py
/tmp/card13-b1-strict-two-isolated.json
/tmp/card13-b1-strict-two-allOneHitHubLeft.json
/tmp/card13-b1-strict-two-allOneHitHubMiddle.json
/tmp/card13-b1-strict-two-allOneHitHubRight.json
```

Representative replay commands from the repository root:

```bash
PYTHONPYCACHEPREFIX=/tmp/exact5-asym-pycache \
  UV_CACHE_DIR=/tmp/uv-cache uv run python \
  /tmp/check_card13_b1_strict_two.py allOneHitHubMiddle

PYTHONPYCACHEPREFIX=/tmp/exact5-asym-pycache \
  UV_CACHE_DIR=/tmp/uv-cache uv run python \
  /tmp/generate_exact5_asym_retained_b0.py

PYTHONPYCACHEPREFIX=/tmp/exact5-asym-pycache \
  UV_CACHE_DIR=/tmp/uv-cache uv run python \
  /tmp/verify_exact5_asym_retained_b0.py \
  /tmp/exact5-asym-retained-post-alternation-b0.json
```

The verifier command applies only when the generator returns `SAT`; the last
bounded role-complete run ended `UNKNOWN`, so its final output is not a SAT
candidate.

## Route implication

Do not continue one-core-per-completion mining on this surface.  The useful
next result must be either a source-level schema/coverage theorem consuming
the recurring quotient cycles, or a quotient-free exact decoded completion
obtained by a materially stronger symmetry/schema method.  Only then is the
rank-two Euclidean/MEC coordinate gate meaningful.
