# Rigid221 S0 coupled-two-row computation: 12-role positive control

**Date:** 2026-08-29
**Lane:** `rigid221-s0-coupled-two-row-l1-20260829`
**Run:** `l1-v1`
**Base HEAD:** `55687ab3e1d47a0f8a5a3646031faf912e28ac80`
**Status:** POSITIVE CONTROL COMPLETE; FULL L1/S0 ENCODING BLOCKED

## Objective

Construct and exactly verify a fixed, pairwise-distinct twelve-role coupled-row
positive control extending the prior nine-point coordinate seed with an
opposite selected row. The first executable query deliberately closes its
modeled carrier at those twelve roles, fixes one cyclic order and disjoint
support-incidence cell, and omits the actual cap construction, source context,
common-deletion packets, robust surface, ambient K4, unnamed carrier points,
and source-permitted support/role identifications.

The computation is an encoding and geometry positive control adjacent to the
on-spine theorem
`Problem97.ATailFrontierLiveClosure.false_of_exactFourMutualOmissionRigid221_minimalCore`.
It is not L1 or S0 evidence, and it is not a proof or promotion artifact.

## Governed paths

```text
checkpoint:
  .codex/worktree-checkpoints/rigid221-s0-coupled-two-row-l1-20260829.json
run root:
  scratch/runs/rigid221-s0-coupled-two-row-l1-20260829/l1-v1/
source manifest:
  docs/audits/2026-08-29-rigid221-s0-l1-source-constraint-manifest.md
```

Bulk solver inputs and logs remain below the run root's `artifacts/`, `events/`,
and `tmp/` classes. Only authenticated top-level manifests, results, reports, and
exact witness certificates are candidates for durable retention.

## Planned gates

1. Exact known-SAT and known-UNSAT smoke pair.
2. Exact replay of the prior nine-point row seed, labeled `UNCERTIFIED_WEDGE`
   with respect to cap semantics.
3. Bounded search for `cv,av,bv` and a cyclic order extending the seed.
4. Independent exact serialized-witness replay of modeled physical-class, row,
   convexity, omission, rigid-cover, and both deletion-blocking constraints.
5. Second-engine check of any decisive nonlinear verdict.
6. Fail-closed result classification using the omission ledger.

## Results

The first audit correctly rejected the initial `L1-row-core` label: fiber
completeness and deletion blocking were checked only in a closed twelve-role
model, while the source carrier may be larger and permits incidence cells
excluded by pairwise distinctness. The harness and report were repaired before
acceptance.

The restricted cell now has the exact verdict

```text
SAT_12_ROLE_POSITIVE_CONTROL_EXACT
```

with selected points

```text
cv = (79/100, -79/1640)
av = (237/2050, -2599/4100)
bv = (13557/26650, 2131/2665).
```

The bounded rational grid checked 4,059 candidates and retained 1,904 exact
survivors. Exact serialized replay independently checked all 120
edge/nonincident orientation inequalities, the three modeled-carrier fibers,
the rigid `2+2+1` intersections, both mutual omissions, and both
designated-center deletion obstructions. The global orientation margin is
`2/5525`; the row radii squared are `17/25` and
`53649709/67240000`; both post-deletion maximum positive multiplicities are
three.

Z3 returned `sat` with exact rational readback. cvc5 1.3.3 independently
returned `sat`, and all 24 coordinate values matched. A repeat produced
identical JSON and SMT2 digests. Twenty focused tests plus Ruff lint/format
checks passed. The governed primary run used 1.958 seconds real and 1.937
seconds user CPU; the cvc5 recheck used 0.074 seconds real.

This is EMPIRICALLY VERIFIED external computation for the stated finite model,
not a Lean proof. It makes no L1, S0, counterexample, or promotion claim.

## Next full-L1 step

The source audit establishes that hand-assigned cap sets are insufficient.
The next checker must:

1. close an explicit finite carrier and derive all three caps from the exact
   signed-area `OnArcOpposite` predicate;
2. implement `capInteriorByIndex` as endpoint erasure and rotate
   `oppIndex2` with `surplusIdx`;
3. validate a non-obtuse minimum-enclosing-circle Moser certificate and exact
   finite convex independence; and
4. enumerate source-permitted support overlaps and center-role
   identifications instead of assuming all roles distinct.

Until that executable surface exists, `L1-S0-I` and `L1-S0-N` remain
`ENCODING_BLOCKED`.
