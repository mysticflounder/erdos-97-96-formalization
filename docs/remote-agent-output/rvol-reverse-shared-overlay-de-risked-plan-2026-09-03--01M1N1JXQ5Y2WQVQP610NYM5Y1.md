# RVOL reverse/shared-overlay campaign: de-risked execution handoff

## Status

`PLAN_SOLIDIFIED_EXECUTION_NOT_COMPLETE`

This is an executable campaign contract, not an overlay theorem or Lean closure.

## Correct source contract

Roles:

- `C = kept = Q.C`
- `D = deleted`
- `K = fresh = Q.K`
- `O = S.oppApex1`, center of `Q.row`
- `A = H.centerAt C = H.centerAt J = H.centerAt K`, the shared blocker
- `b = H.centerAt D`, the reverse blocker
- `L` = common-shell fourth point
- `P,Q` = private points of `Q.row`

Structural rows:

```text
reverse row at b:  {C,D,R0,R1}, cap trace exactly {C,D}, K omitted
Q.row at O:        {C,J,P,Q}
common shell at A: {C,J,K,L}, with Q.row∩commonShell={C,J}
```

Metric groups must be compiled separately from structural supports:

```text
center b: {C,D,R0,R1}
center O: {C,D,J,P,Q}
center A: {C,J,K,L}
```

The `O-D` equality is source-proved even though `D` is not structurally in `Q.row`. Omitting it under-models the packet.

Cap/order facts for the first closed cap `B`, strict interior `I`:

```text
C,D,K,b ∈ I
O ∉ B
J ∉ I
b lies strictly between C,D, in either orientation
btw(O,A,C) ↔ ¬btw(O,A,J)
```

For closure, allowing `J` anywhere outside `I` is a conservative source-safe superset. Any survivor must be checked against the exact adjacent-cap image.

Named source-open aliases are exactly:

```text
A=D
b=K
b=L
O=L
```

They yield ten consistent named-alias skeletons. Both `C/D` orientations are mandatory.

Crucial correction: there is no complete static private-alias list. The two private `Q.row` points may alias any compatible pre-existing base point or center, not only `A,b,D`. After named substitution, enumerate the unordered pair `{P,Q}` from every carrier label except `C,J,O,K,L`, then enforce row functionality and incidence constraints.

If `A` aliases an existing selected-row center, the common-shell support must equal the existing support exactly; otherwise reject. Never create two distinct selected rows at one center.

## Complete ordinal domain

The prior ordinal bank already closes:

```text
C2, C19, C20, C21.
```

Reverse strict-interior placement excludes endpoints `C0,C23`. The complete remaining domain is:

```text
C1, C3,C4,...,C18, C22.
```

`C1,C22` are duplicate-base-row cases and require separate campaigns. They must not be silently omitted from a `C3..C18` census.

There are 1,876 ordinal/local-root-type cells before the existing exact base-triple filter and 471 eligible types after that filter. With ten named skeletons and two orientations, there are 9,420 high-level cells, each further sharded by decorated base state and role-order extension. No private-alias multiplier is statically valid.

## Replayed C3 calibration

The complete `C3` base surface was replayed in 50 immutable local-type shards:

```text
reflection-order mass                   243,877,920
raw base assignments                         556,600
structural base assignments                  503,328
base survivors after exact triple bank        58,276
raw four-row extensions                    3,496,560
structural four-row extensions             2,305,192
canonical four-row patterns                    4,743
```

Computational classification:

```text
STRICT_FEASIBLE             20
STRICT_ONLY_INFEASIBLE   1,610
WEAK_INFEASIBLE          3,113
```

All twenty positive patterns occur in local type 5 and represent 6,498 concrete strict base states. Every positive pattern has a producer-independent exact rational direction witness. The 4,723 negative patterns still require an exact Farkas bank before theorem use.

The 6,498 states have 6,498 distinct complete boundary-gap profiles, so canonical row incidence alone is not enough; concrete decorated states must be retained.

Measured surface shards remain small: the C3 maximum was 13.36 seconds. Representative heavy C8/C13/C18 shards were 10.28/12.36/10.95 seconds. Classification shards of 200 patterns stayed below 8.52 seconds.

## Campaign stages

1. **Source transport**: freeze source commit and prove/record the role-to-boundary map.
2. **Base surface**: enumerate every local type and support assignment; preserve concrete decorated strict states.
3. **Base exact custody**: exact Farkas or exact rational witness for every canonical base pattern.
4. **Named role/order extension**: ten named alias skeletons × two orientations, using cap categories and actual boundary gaps.
5. **Dynamic private aliases**: enumerate all compatible unordered `{P,Q}` choices after named substitution.
6. **Structural/metric compilation**: functional row map plus separate equal-radius groups, including `O-D`.
7. **Local exact screening**: exact one-/two-/three-row certificates with explicit pullback maps.
8. **Full classification**: exact integer Farkas certificate or exact rational strict witness; no numerical-only status.
9. **Independent replay**: reconstruct every branch with separate code and require zero uncovered states or an exact survivor ledger.
10. **Source/Lean promotion**: only after the finite image/superset theorem and certificate replay exist.

Shard key:

```text
(ordinal, local_root_type, base_state_chunk,
 C_D_orientation, named_alias_skeleton,
 role_order_extension_chunk)
```

Operational rules:

```text
OMP_NUM_THREADS=1
OPENBLAS_NUM_THREADS=1
MKL_NUM_THREADS=1
maximum four concurrent solver processes
hard per-shard cutoff 180 seconds
classification shard size 200 canonical patterns
```

Every immutable receipt must include code/input/contract hashes, exact bounds, counts by rejection reason, certificate/witness hashes, time/RSS, and terminal status. Aggregation must reject divergent duplicate shard keys.

## Stop conditions

- An exact source-compatible survivor stops certificate-bank expansion and becomes the next geometric/source target. It is not automatically a Euclidean RVOL witness.
- A survivor only in the conservative `J∉I` superset must be checked against exact left/right adjacent-cap placement.
- Any numerical-only infeasibility, timeout, missing shard, unresolved alias, or missing transport leaves status `UNKNOWN`.
- Exact conditional closure requires every ordinal, orientation, named skeleton, dynamic private alias, and decorated state to be independently certified with zero uncovered cases.
- Source closure additionally requires the ordered-cap equality/owner-map packet and the base/reverse row roles to be proved to map into this finite contract.

## Execution order

1. Exact Farkas custody for the 4,723 C3-negative base patterns.
2. Pilot all ten named skeletons and both orientations on representative states with 13,14,15,16 used base labels.
3. Complete duplicate-row cases C1 and C22.
4. Complete all 6,498 decorated C3 states.
5. Pilot middle/late ordinals C8,C13,C18.
6. Scale to all remaining ordinals only if shard ceilings hold.
7. Build global bank and run independent replay.
8. Request Lean import only after source transport.

## Current claim boundary

The plan and resource model are verified. The overlay computation is not complete. In particular:

- the 4,723 negative C3 base patterns lack exact Farkas custody;
- dynamic aliases and both orientations are not fully executed;
- C1/C22 and the remaining ordinals are open;
- the source base-packet/ordinal transport is open;
- no Lean certificate consumer/import is claimed.

Full local artifact: `rvol-overlay-plan-solidification-2026-09-03/PLAN-AND-RISK-REGISTER.md`.
