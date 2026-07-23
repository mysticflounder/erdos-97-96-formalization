# Exact-four support-or-blocker star producer audit

Date: 2026-07-22

Scope: the conjectured producer

```lean
exists_supportOrBlockerStarMiddleArcPlacement
    (R : OriginalUniqueFourResidual F)
    (Q : ExactTwoStrictHitDistribution R) :
    Nonempty
      (SupportOrBlockerStarMiddleArcPlacement
        D (lateFirstApexSystem R))
```

No production Lean or shared plan file is changed in this lane.

## Decision

The producer remains **CONJECTURED / NOT PROVED**.  Neither stored Boolean SAT
assignment refutes it.  The audit found two successive omissions in the
finite outer:

1. the original static assignments violated already-proved displayed-cap
   selected-row bounds; and
2. after adding all those bounds, both corrected assignments still violate
   the exact full-linear Kalmanson system forced by their cyclic boundary
   order and selected-row equalities.

Thus the current first omitted layer is the **incomplete transported linear
Kalmanson schema bank**, not nonlinear Euclidean, MEC, or `noM44` geometry.
The corrected assignments are scalar-curvature SAT but full-linear Kalmanson
UNSAT.  They are not source-faithful residuals, Euclidean realizations, or
Problem 97 counterexamples.

The next discovery calculation must integrate the full-linear oracle into the
corrected Boolean outer and bank each transported order schema it returns.
[`run_full_linear_cegar.py`](run_full_linear_cegar.py) is that driver.  A
Boolean exhaustion result would remain fixed-`n = 11` evidence until proof
replay and source lifting; a full-linear SAT result would only be an abstract
distance-table survivor requiring the next Euclidean/MEC audit.

## Theorem-bank preflight

The general-n, sibling `p97-rvol`, legacy `erdos/97`, and older
`erdos-general-theorem/97` registries were checked before attempting the
producer.  Focused indexed Lean searches covered support-or-blocker stars,
mutual complete-radius rows, selected-row curvature, ordered-cap row counting,
and global equality-quotiented Kalmanson consumers.  No existing proof of the
star producer was found.

The searches did recover the load-bearing source gates:

```lean
Problem97.CapSelectedRowCounting
  .selectedFourClass_inter_capByIndex_card_le_two

Problem97.CapSelectedRowCounting
  .selectedFourClass_inter_orderedCap_first_card_le_one

Problem97.CapSelectedRowCounting
  .selectedFourClass_inter_orderedCap_last_card_le_one
```

and the cardinality-generic global Kalmanson consumers in
`whole-carrier-ordinal-coverage/GlobalEqualityKalmansonCore.lean`.

## Durable rejection of the original static assignments

The original compact fixtures are preserved as
[`uncorrected_direct_p4.json`](uncorrected_direct_p4.json) and
[`uncorrected_direct_p5.json`](uncorrected_direct_p5.json), with SHA-256
digests

```text
bd3f2d4c9fa3162e3ee8d40c3bc5d36d99986d9eead2b02c710ac129341b4db7
3a01b3ada93e6a474ab80819fa906b7ffd58b7e9ce1ae0b595a31a23a47c7a45
```

[`audit_uncorrected_survivors.py`](audit_uncorrected_survivors.py) replays the
violations into
[`uncorrected_survivor_own_cap_audit.json`](uncorrected_survivor_own_cap_audit.json).
Its digest is

```text
f1cc9162378813fc2fd2133a159045caf15ff0ef9dbbae228a7b8d561fc226a9
```

Profile four has two own-cap intersections of cardinality three and one
endpoint intersection of cardinality two.  Profile five passes the coarse
own-cap bound but has two endpoint intersections of cardinality two.  These
are exact contradictions with the three Lean theorems above.

[`UniqueFourOwnCapGate.lean`](UniqueFourOwnCapGate.lean) kernel-checks the
literal contradiction adapters.  All three are warning-clean and have axiom
closure exactly

```text
propext, Classical.choice, Quot.sound.
```

## Corrected static Boolean results

[`run_direct_overlay_with_own_cap.py`](run_direct_overlay_with_own_cap.py)
adds every applicable displayed-cap own-row bound before statically forbidding
all four pairwise-disjoint outer-arc packings.  Both corrected Boolean gates
are SAT:

| profile | compact artifact SHA-256 | final variables | final clauses |
|---:|---|---:|---:|
| 4 | `8a1662080001c1041219bf91ed82588835b79ba0069fdb044a204de2e2db14e3` | 12,672 | 2,765,381 |
| 5 | `77649d222a14aecd3847905f724332e82c441f66bfda359a374c288dcbc8af27` | 12,672 | 2,765,405 |

Each encoding contains:

- 2,310 exact selected-row pattern variables;
- 154 outer-arc type variables;
- 150,832 forbidden four-arc packing clauses;
- 44 general own-cap clauses; and
- 30 endpoint own-cap clauses.

The initial independent outer replay checked, for each assignment, all 332,640
planar injections, 8,118 kernel-bank Kalmanson embeddings, and 2,106,720
signed-U5 embeddings.  The large DIMACS and solver logs are intentionally not
preserved.  Their digests and initial replay result remain bound inside the
compact
[`corrected_survivor_replay.json`](corrected_survivor_replay.json), whose
current digest is

```text
6f429dfb64d2a622dae1b6140660c571ac50b5f22dffa410575df3d42bb07d6b
```

The compact verifier independently reconstructs the final header counts,
replays every own-cap and endpoint incidence, enumerates the 22 selected outer
arcs, and confirms that no four have pairwise-disjoint turn masks.

### Decoded normal forms

The profile-four assignment has first-apex exact class
`{2,5,6,9}`, strict pair `(6,5)`, retained pair `(5,9)`, and minimal-deletion
witness center `10` with deleted set `{4}`.  Its selected row is
`{0,3,4,8}`.  Relative to the second-opposite cap, the outside pair is
`{3,4}`, whose fixed blockers are `10` and `3`; this is the singleton-return
normal-form arm.

The profile-five assignment has first-apex exact class
`{1,6,7,10}`, with both strict and retained pair `(7,6)`, and
minimal-deletion witness center `2` with deleted set `{1}`.  Its selected row
is `{1,4,7,8}`.  Relative to the surplus cap, the outside pair is `{7,8}`,
whose fixed blockers are `0` and `9`; these and center `2` are pairwise
distinct, giving the three-distinct-center singleton normal-form arm.

These classifications do not rescue the assignments: both fail at the
earlier full-linear boundary described next.

## Independent curvature and full-linear replay

The exact scalar shell-curvature ledger is SAT for both corrected row tables.
The stored rational turn models replay the full turn sum, positivity,
turn-`< π`, and both outer quarter-turn inequalities for every row.  This
confirms that scalar curvature alone does not eliminate either table.

The stronger exact QF_LRA replay adds all strict Kalmanson inequalities,
triangle inequalities, positivity, and every selected-row equality.  It is
UNSAT for both tables.  One stored deletion-minimized core has:

| profile | dependency centers | required row memberships | full ordered roles |
|---:|---|---:|---:|
| 4 | `{0,1,4}` | 9 | 10 |
| 5 | `{0,1,8}` | 7 | 11 |

These are multi-inequality global equality cores, not occurrences of the ten
kernel-checked local schemas already encoded by the outer.  The exact row
memberships and tracked inequality names are stored in
`corrected_survivor_replay.json`.  Consequently, the linear bank must be
refined before nonlinear/MEC reasoning is invoked on a claimed survivor.

A separate strict-convex coordinate QF_NRA diagnostic used only the positive
row equalities and boundary supporting-line inequalities.  Both 180-second
runs returned `UNKNOWN (timeout)`.  That is unresolved-under-budget and is
superseded for these fixed tables by the decisive necessary full-linear UNSAT
replay; it is not evidence of realizability or infeasibility on its own.

## Source-level status

The target producer would feed

```lean
false_of_supportOrBlockerStarMiddleArcPlacement
```

and close the exact-two branch.  No such source theorem has been proved here,
and no `sorry` has been closed by this audit.  The strongest source-clean data
before cyclic placement remains `exists_completeRadiusSpineIngress` together
with the collision/singleton-core/packed-core minimal-deletion split.

The present correction does establish the right discovery order:

1. run the corrected outer against exact full-linear Kalmanson closure;
2. port and bank only the schemas actually encountered;
3. prove an occurrence/coverage theorem if the bank exhausts the projection;
4. invoke nonlinear Euclidean/MEC/`noM44` fields only after a verified
   full-linear survivor appears.

No new conditional consumer or renamed star packet is introduced.

## Replay

```bash
UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline python \
  scratch/atail-force/unique4-star-producer/audit_uncorrected_survivors.py \
  scratch/atail-force/unique4-star-producer/uncorrected_direct_p4.json \
  scratch/atail-force/unique4-star-producer/uncorrected_direct_p5.json \
  --output scratch/atail-force/unique4-star-producer/\
uncorrected_survivor_own_cap_audit.json --check

UV_CACHE_DIR=/tmp/uv-cache-p97 uv run --offline python \
  scratch/atail-force/unique4-star-producer/verify_corrected_survivors.py \
  scratch/atail-force/unique4-star-producer/direct_owncap_endpoint_p4.json \
  scratch/atail-force/unique4-star-producer/direct_owncap_endpoint_p5.json \
  --output scratch/atail-force/unique4-star-producer/\
corrected_survivor_replay.json --check

cd lean
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/unique4-star-producer/UniqueFourOwnCapGate.lean
```
