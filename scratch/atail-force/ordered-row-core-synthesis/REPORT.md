# Ordered-row synthesis for the three fresh `(4,5,6)` cuts

Date: 2026-07-14

Status: **EXACT COMMON PACKET ON THE THREE FIXED SHADOWS; LIVE PRODUCER OPEN.**

## Verdict

The three sequential fixed-placement survivors reported under different
ordered consumers are not three unrelated patterns.  They all contain the
same smaller direct three-row packet, and that packet instantiates
`FourPointTwoCircleBisectorOrderCore` with the same four roles.

The common boundary order is

```text
0,8,9,10,11,1,3,4,2,5,6,7.
```

Cutting at `o=8`, all three shadows have the same ordered selected row

```text
o=8 : a=9, b=3, c=7, d=0.
```

They also all have

```text
row(a=9) contains {o=8,d=0}
row(f=11) contains {o=8,a=9}
cyclic order d,o,a,f = 0,8,9,11.
```

The first two rows make `d` equidistant from `o,a`:

```text
do = od = oa = ao = ad = da.
```

The `f` row makes `fo=fa`.  Thus `d` and `f` are the two bisector centers
for the chord `o,a`, in the forbidden cyclic order `d,o,a,f`.  The role map

```text
Q=d=0, U=o=8, Y=a=9, V=f=11
```

is exactly the production four-point two-circle order core.

This does **not** mean that the arc-overtake or nested-equal-chord theorems are
generically subsumed.  Their abstract equality contracts do not imply the
extra `f`-row equality.  It means that these three particular fresh shadows
all carried the extra smaller core, so the four-point matcher should have
priority in the fixed-placement scan.

## Exact synthesis of the three contracts

Write the common ordered support as `o,a,b,c,d` and put `f` in the open
boundary interval after `a` and before `b`.

| detected consumer | roles on the common frame | equality continuation beyond the `o` row | order |
|---|---|---|---|
| reverse arc-overtake | `O=o,A=d,D=c,E=b,F=f,C=a` | shared outer chord `od=da`, then `cd=cb=cf` | reverse `o,d,c,b,f,a` |
| nested equal chord | identity `o,a,b,c,d` | shared outer chord `oa=ad`, then `oa=bc` | `o,a,b,c,d` |
| four-point two-circle | `Q=d,U=o,Y=a,V=f` | `do=da` and `fo=fa` | `d,o,a,f` |

The shared outer-chord equality is the same equality in the first two rows of
the table because the `o` row already gives `oa=od`.  The third consumer uses
that common equality directly and asks only for the second bisector center
`f`.

The direct rows supplying the compact core are:

| shadow | `row 8` | `row 9` | `row 11` | first reported match |
|---|---|---|---|---|
| survivor 1 | `{0,3,7,9}` | `{0,4,8,10}` | `{2,3,8,9}` | reverse arc-overtake, `O,A,D,E,F,C = 8,0,7,3,11,9` |
| survivor 2 | `{0,3,7,9}` | `{0,4,8,10}` | `{5,8,9,10}` | nested equal chord, `o,a,b,c,d = 8,9,3,7,0` |
| survivor 3 | `{0,3,7,9}` | `{0,4,8,10}` | `{2,3,8,9}` | four-point two-circle, `Q,U,Y,V = 0,8,9,11` |

`analyze.py --check` verifies the three originally reported equality-closure
matches, the common direct memberships, the cyclic orders, and the common
four-point core on all three row systems.

## Smallest generic direct-row interface

A useful live-facing adapter can be stated without mentioning a fixed
cardinality or all four members of the ordered row:

```text
there exist carrier labels d,o,a,f such that
  a,d are in row(o),
  o,d are in row(a),
  o,a are in row(f), and
  d,o,a,f occur in cyclic boundary order.
```

These six memberships build the equality-closure core with
`Q=d,U=o,Y=a,V=f`; the existing four-point order theorem then closes.  This
would be a small convenience adapter, not a new mathematical consumer.  No
production wrapper was added here because the production core already states
the exact two equalities and the load-bearing work is producing the six
memberships.

## Exact mismatch with the current robust frontier

`CriticalPairFrontier` supplies:

- the active sources `q,w` in one first-apex equal-radius class;
- two exact source-critical shells at their chosen blocker centers;
- diagonal source membership in each shell;
- the common/distinct blocker trichotomy and at most the directed `q/w`
  cross memberships; and
- one opposite-side sign when a directed cross hit occurs.

It does **not** supply:

1. a chosen faithful global row `o` whose support contains `a,d`;
2. the two lower-bound memberships `o,d in row(a)`;
3. the two lower-bound memberships `o,a in row(f)`;
4. a theorem placing `f` in the required boundary interval; or
5. a closed cardinality-12 frame preventing selected support from escaping
   when the ambient carrier is larger.

The fixed survivor emphasizes the gap.  Its common row centers `8,9,11` are
global selected-row centers, not the two active blocker centers.  Hence the
new robust blocker equalities and cross-membership classifier do not directly
produce this packet.  `D.K4` can supply a selected row at every center, but it
does not force either specified pair into the rows at `a` and `f`.

An honest uniform theorem therefore needs to retain a
`FaithfulCarrierPattern` and boundary indexing at the K-A-PAIR wrapper and
prove either the compact outer-bisector packet above or an already-consumed
alternate.  Merely repackaging the two critical shells cannot instantiate it.

## Theorem-bank preflight

The required sibling and legacy markdown and JSON registries were searched
for equal-chord, perpendicular-bisector, two-circle order, and cyclic-row
producers.  Indexed Lean search returned:

- the current four-point and six-point ordered consumers;
- `Dumitrescu.perpBisector_apex_bound`, which rules out three carrier centers
  on one perpendicular bisector but permits the exact two centers here;
- `u5_common_bisector_triple_incompatibility`, again a stronger three-center
  sink; and
- the old `convex_order_implies_perpBisector_side` gap record, explicitly not
  a proved reusable producer.

No bank theorem forces the two row-pair lower bounds or the interstitial
center needed by the compact packet.

## Consequence for the next fixed-placement round

The three observed cuts should be compressed to the four-point matcher before
arc-overtake and nested-equal-chord matching.  This is a detector-order and
theorem-extraction improvement, not fixed-placement exhaustion.  The next
eight-way follow-up already contains two `SixPointTwoCircleOrder` hits and
three extended-matcher-free shadows with externally crosschecked `QQ` unit
ideals.  Therefore the honest possible uniform output remains a finite
disjunction:

```text
compact ordered outer-bisector packet
or another existing ordered/equality core
or a row-escape/continuation packet
or a genuinely new compact metric core.
```

For live card-at-least-12 closure, the row-escape alternative cannot be
omitted unless a closed 12-label extraction theorem is proved first.

## Replay

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-erdos9796 uv run python \
  scratch/atail-force/ordered-row-core-synthesis/analyze.py --check
```

The result is **exact for these three fixed finite shadows only**.  It is not
an exhaustive fixed-placement census and not a proof of K-A-PAIR.
