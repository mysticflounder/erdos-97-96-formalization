# ATAIL robust two-blocker census

Date: 2026-07-14

Status: **PROVEN LOGICAL TRICHOTOMY; EXHAUSTIVE STATIC COUNTS WITHIN THE
930-RESIDUE SURFACE; NO 930 CRITICAL-MAP BRANCH COUNTS.**

## Result

The new card-five theorem collapses the apparent four-way blocker split to an
exact three-way normal form.  For a `SurvivorPairRelocationPacket` whose first
apex class has cardinality at least five, write

```text
A := w in selectedAt(q).support
B := q in selectedAt(w).support
E := centerAt(q) = centerAt(w).
```

Then the current production theorems give

```text
A and B  -> E
not A    -> not E
not B    -> not E.
```

Consequently `E` is equivalent to `A and B`, and exactly one of these branches
holds:

1. mutual cross membership and one common blocker;
2. exactly one directed cross membership and two distinct blockers;
3. reciprocal cross nonmembership and two distinct blockers.

In branches 2 and 3 the two blockers differ from each other and, by the
existing first- and second-apex blocker-separation facts, from both prescribed
apices.  These are therefore genuinely **two-blocker/four-center** branches.
This is a uniform producer *normal form*, but not yet a contradiction or a
K-A-PAIR closure theorem.

## What can be counted on the 930 checkpoint

Every one of the 930 residues has an exact card-five first-apex class with
exactly four off-surplus members, hence six static unordered source pairs.
The total is 5,580 possible first-row pairs.  Restricting to pairs whose two
single deletions are certified by the displayed second-apex exact row leaves
3,318 pairs:

| Profile | Residues | All first-row pairs | Second-row-certified pairs |
|---|---:|---:|---:|
| card 11 `(5,5,4)` | 96 | 576 | 288 |
| card 12 `(6,5,4)` | 150 | 900 | 450 |
| card 12 `(5,5,5)` | 684 | 4,104 | 2,580 |
| **Total** | **930** | **5,580** | **3,318** |

The exact second-row strata are:

- all 96 card-11 and all 150 `(6,5,4)` residues have a card-four second row
  meeting the four off-surplus first-row points once, hence three certified
  sources and three pairs;
- among `(5,5,5)`, 64 residues have a disjoint card-four second row and six
  pairs, 508 have a once-intersecting card-four row and three pairs, and 112
  have a card-five second row and six pairs.

These are static source-pair counts, not counts of realized
`SurvivorPairRelocationPacket` choices.  A different second-apex radius could
certify additional deletions in a geometric realization.

## Why the three branch counts are unavailable for the 930

Neither `producer_coverage_census_checkpoint.json` nor the 36-query round-two
checkpoint stores a `CriticalShellSystem`, `centerAt(q)`, `centerAt(w)`,
`selectedAt(q)`, or `selectedAt(w)`.  Round two is still 36/36 fail-closed
`TIMEOUT`.  Therefore there is no sound join from the 930 support pairs to the
three cross-incidence branches.  In particular, the exact numbers of common
blocker, one-way-hit, and reciprocal-nonmembership packets are **not
available** from the current checkpoint.

This is a data-schema boundary, not a need for another sample of the same
two-apex surface.  Exact branch counts require a total critical map joined to
each realized geometric survivor, or a theorem producing one branch directly
from the live hypotheses.

## What the saved total-critical-map shadows show

The two existing global-count shadows do contain total blocker maps.  Across
the two endpoint orientations of each shadow, their four eligible packets
split as follows:

| Branch | Packets |
|---|---:|
| mutual membership / common blocker | 1 |
| one-way membership / distinct blockers | 1 |
| reciprocal nonmembership / distinct blockers | 2 |

Thus all three logical branches are realized by the current incidence
artifacts.  However, every one of these four packets has a card-four first
apex row.  They are not realizations of the card-five 930 surface, are not
Euclidean/convex target models, and do not test the new card-five theorem.
They only show that an incidence-only analysis has no reason to prefer one
remaining branch.

## Producer consequence

The uniform next statement should use the three-way normal form explicitly:

```text
card-five survivor pair
  -> common-blocker mutual branch
   or one-way-hit four-center branch
   or robust reciprocal-nonmembership four-center branch.
```

For closure, the content-bearing theorem must then consume geometry/global
incidence to eliminate each arm:

- common blocker: produce the existing residual-member/cap-placement field;
- one-way hit: cap/order-localize the hit blocker or couple it to the other
  blocker;
- reciprocal nonmembership: use both exact surviving rows and both blocker
  cap locations in a genuinely four-center theorem.

The new theorem removes any need to analyze “mutual membership with distinct
blockers” or “common blocker with a missing cross incidence”: both are
impossible in card five.  It does not remove the two robust four-center arms.

## Validation

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/robust-two-blocker-census/analyze.py --check
```

The required theorem-bank registries and indexed Lean corpus were checked
before this audit.  `analyze.py` pins and replays the current coverage,
round-two, critical-map-shadow, and production-frontier inputs.  Its claims
are exhaustive only for the finite artifacts stated above.
