# ATAIL remaining-pattern map

Date: 2026-07-14

## Result

The former 87,916-case finite remainder has a missed production-bank
classifier.  The arbitrary-packet theorems

```text
Problem97.SurplusCapPacket
  .leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
Problem97.SurplusCapPacket
  .rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
```

bound the intersection of an opposite-vertex selected class with either
adjacent closed cap by one.  They apply directly to `leafSurplusPacket`; no
identification with `D.packet` and no `IsM44` hypothesis is needed.

On the exact finite surface, these two consumers remove 86,986 of the former
87,916 survivors:

| Case | Before | Removed | Remaining |
|---|---:|---:|---:|
| card11 `(5,5,4)` | 7,320 | 7,224 | 96 |
| card12 `(6,5,4)` | 29,885 | 29,735 | 150 |
| card12 `(5,5,5)` | 50,711 | 50,027 | 684 |
| total | 87,916 | 86,986 | 930 |

Putting the production one-hit stage before the scratch MEC stages also
subsumes every case previously assigned to either scratch MEC consumer.  The
new exhaustive classification of all 369,743 target-negating pairs is:

| Stage | Count |
|---|---:|
| formalized equality/order bank | 44,831 |
| endpoint-radius containment | 108,435 |
| production adjacent-cap one-hit | 215,547 |
| survivor | 930 |

This is exhaustive finite combinatorial coverage, not a Lean closure claim.

## Exact cap-role map

The canonical first class is centered at the vertex opposite `O1`:

- its left adjacent cap is `O2`;
- its right adjacent cap is `S`.

The canonical second class is centered at the vertex opposite `O2`:

- its left adjacent cap is `S`;
- its right adjacent cap is `O1`.

Thus a class containing any two labels in the corresponding closed cap is
immediately contradictory by the named production theorem.  The only
extraction fields needed to consume the theorem are:

1. the class is the full `SelectedClass A (S.oppositeVertexByIndex i) radius`;
2. the two labels are distinct carrier points in the indicated adjacent cap;
3. the finite `S/O1/O2` roles agree with `surplusIdx/oppIndex1/oppIndex2`.

No new distance inequality is missing.  Item 1 supplies the two equal-radius
memberships; item 2 follows from carrier injectivity plus cap membership; item
3 is the cap-role transport needed by the live extraction theorem.

## The 930-case residue

After enforcing both adjacent-cap one-hit bounds, the remaining class pairs
have only 66 case-sensitive cap-count signature classes: 12 for card11, 12 for
card12 `(6,5,4)`, and 42 for card12 `(5,5,5)`.

Every surviving first class has at least three points in its own `O1` cap, and
every surviving second class has at least two points in its own `O2` cap.
The residual support motifs are:

| Motif | card11 | card12 `(6,5,4)` | card12 `(5,5,5)` | total |
|---|---:|---:|---:|---:|
| an opposite boundary endpoint occurs | 42 | 54 | 294 | 390 |
| neither opposite endpoint occurs | 54 | 96 | 390 | 540 |
| at least one class is contained in its own opposite cap | 27 | 34 | 162 | 223 |
| both classes are contained in their own opposite caps | 1 | 1 | 6 | 8 |
| the third Moser apex is common to both classes | 16 | 25 | 68 | 109 |

The production endpoint-containment theorem is instantiable in 193 of these
pairs, but its conclusion agrees with the support pattern and is not a
contradiction.  The existing boundary-chord scratch kernel has an endpoint in
390 pairs, but the 930 pairs have no straddling witness by construction.

## Ranked next consumers

1. **Production adjacent-cap one-hit — immediate and complete for 86,986 old
   survivors.**  This is already proved for arbitrary `SurplusCapPacket` and
   should be consumed before any more solver mining.

2. **Own-cap containment/strict-escape split — structural reduction for all
   930, not a contradiction.**  The 223 containment cases need a theorem
   incompatible with a four/five-point exact class concentrated in its own
   opposite cap.  The other 707 pairs need live critical-row data to rule out
   the one-per-adjacent-cap escape pattern.  Cap order and one-hit bounds alone
   cannot do so.

3. **`u1TwoLargeCapObstruction` — available sink but not yet a finite support
   classifier.**  The two apex rows give only their within-row radius
   equalities.  A usable embedding still needs the remaining cross-row
   equalities `h3` through `h7` of that five-point theorem (and `a != c`).
   Those fields must come from `hfixed`, `hsupport`, or the common critical-row
   system; they are not encoded by the two-class support surface.

The required theorem-bank registries were checked before this conclusion, and
targeted indexed searches covered the one-hit, same-distance arc containment,
cap midpoint, reflection, and two-large-cap consumers.  No bank theorem was
found that turns the final own-cap-concentrated patterns into a contradiction
without additional live-row incidences.

## Reproduction

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/remaining-pattern-map/analyze.py --check
```

Epistemic status: the counts are **EXHAUSTIVE WITHIN THE FINITE SUPPORT
ABSTRACTION**.  The named one-hit consumers are **PROVEN in current Lean
source**.  The extraction of the full exact classes and cap roles from the
live K-A-PAIR hypotheses remains open.
